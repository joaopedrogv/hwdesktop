unit Test_SalvarEventoDFe211130UseCase;

interface

uses
  DUnitX.TestFramework,
  ISessionContextUnit,
  StatusRegistroEnumUnit,
  EventoDFeStatusUnit,
  CreateEntityUseCaseOutputUnit,
  EventoDFeEtdUnit,
  EventoDFe211130EtdUnit,
  EventoDFe211130ItemEtdUnit,
  SalvarEventoDFe211130UseCaseUnit,
  FakeTransactionUnit,
  FakeDatabaseConnectionUnit,
  StubSessionContextUnit,
  StubEventosDFeRepositoryUnit,
  StubEventoDFe211130RepositoryUnit;

type
  [TestFixture]
  TTestSalvarEventoDFe211130UseCase = class
  private
    FTransactionState: TTransactionSpyState;
    FConnection: TFakeDatabaseConnection;
    FSession: ISessionContext;
    FEventosRepo: TEventosDFeRepositoryStub;
    FRepo211130: TEventoDFe211130RepositoryStub;
    FUseCase: SalvarEventoDFe211130UseCase;
    procedure SemearEvento(const AId: string; ASeqId: Integer;
      AAtivo: StatusRegistroEnum; ACodEmpresa: Integer);
    function RejeitarAoExecutar(AEvento: EventoDFe211130Etd): string;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveInserirComItensESeqIdDoRascunho;

    [Test]
    procedure DeveRejeitarInclusaoSemSeqId;

    [Test]
    procedure DeveRejeitarColecaoVazia;

    [Test]
    procedure DeveRejeitarMaisDeNovecentosENoventaItens;

    [Test]
    procedure DeveRejeitarNItemDuplicado;

    [Test]
    procedure DeveRejeitarNItemForaDaFaixa;

    [Test]
    procedure DeveRejeitarValorNegativo;

    [Test]
    procedure DeveRejeitarValorComMaisDeDuasCasas;

    [Test]
    procedure DeveRejeitarUnidadeVazia;

    [Test]
    procedure DeveAceitarUnidadeComSeisCaracteres;

    [Test]
    procedure DeveNormalizarItensAntesDeGravar;

    [Test]
    procedure DeveSubstituirItensNaAlteracao;

    [Test]
    procedure DeveRestaurarEReativarRegistro;

    [Test]
    procedure DeveRejeitarChaveComCaracteresNaoNumericos;

    [Test]
    procedure DeveConverterColisaoDeSeqIdEmValidacao;

    [Test]
    procedure DeveDesfazerTransacaoQuandoSubstituicaoFalhar;

    [Test]
    procedure DeveDesfazerTransacaoQuandoAtualizacaoFalhar;

    [Test]
    procedure DeveRejeitarSegundoEventoNaoAutorizadoParaAMesmaChaveETipo;

    [Test]
    procedure NaoDeveEditarEventoEnviando;

    [Test]
    procedure DeveConfirmarEAliberarTransacaoAoIncluir;
  end;

implementation

uses
  SysUtils,
  TipoEventoDFeUnit,
  EValidacaoNegocioUnit,
  ValidationEntityOutputUnit;

const
  EMPRESA_ID = 3;
  ID_EVENTO = 'EVENTO-211130-EXISTENTE';
  CHAVE_VALIDA = '11111111111111111111111111111111111111111111';

function IdDoItem(ANItem: Integer): string;
begin
  Result := Format('ITEM-%d', [ANItem]);
end;

function Item(ANItem: Integer; const AVIbs, AVCbs, AQImobilizado: Currency;
  const AUImobilizado: string): EventoDFe211130ItemEtd;
begin
  Result := EventoDFe211130ItemEtd.Create(
    IdDoItem(ANItem), ANItem, AVIbs, AVCbs, AQImobilizado, AUImobilizado);
end;

function Itens(const AItens: array of EventoDFe211130ItemEtd):
  EventoDFe211130ItemEtdArray;
var
  I: Integer;
begin
  SetLength(Result, Length(AItens));

  for I := 0 to High(AItens) do
    Result[I] := AItens[I];
end;

function ItemValido(ANItem: Integer): EventoDFe211130ItemEtd;
begin
  Result := Item(ANItem, 1, 2, 10, 'UN');
end;

function CriarRascunho(ASeqId: Integer;
  const AItens: EventoDFe211130ItemEtdArray;
  const AChave: string): EventoDFe211130Etd;
begin
  Result := EventoDFe211130Etd.Create;
  Result.ChaveDocumento := AChave;
  Result.Itens := AItens;

  if ASeqId > 0 then
    Result.DefinirSeqIdInclusao(ASeqId);
end;

function CriarHeader(const AId: string; ASeqId: Integer;
  AAtivo: StatusRegistroEnum; ACodEmpresa: Integer): EventoDFeEtd;
begin
  Result := EventoDFeEtd.Create(
    AId,
    ASeqId,
    fdNFe,
    teImobilizacaoItem,
    CHAVE_VALIDA,
    ACodEmpresa,
    AAtivo,
    EncodeDate(2026, 4, 1),
    EncodeDate(2026, 4, 2)
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

{ TTestSalvarEventoDFe211130UseCase }

procedure TTestSalvarEventoDFe211130UseCase.Setup;
begin
  FTransactionState := TTransactionSpyState.Create;
  FConnection := TFakeDatabaseConnection.Create(FTransactionState);
  FSession := TSessionContextStub.Create(EMPRESA_ID);
  FEventosRepo := TEventosDFeRepositoryStub.Create;
  FRepo211130 := TEventoDFe211130RepositoryStub.Create;
  FUseCase := SalvarEventoDFe211130UseCase.Create(
    FConnection, FSession, FEventosRepo, FRepo211130);
end;

procedure TTestSalvarEventoDFe211130UseCase.TearDown;
begin
  FUseCase.Free;
  FRepo211130.Free;
  FEventosRepo.Free;
  FSession := nil;
  FConnection.Free;
  FTransactionState.Free;
end;

procedure TTestSalvarEventoDFe211130UseCase.SemearEvento(const AId: string;
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

  FRepo211130.AdicionarItens(AId, Itens([Item(9, 1, 2, 10, 'UN')]));
end;

function TTestSalvarEventoDFe211130UseCase.RejeitarAoExecutar(
  AEvento: EventoDFe211130Etd): string;
begin
  Result := '';
  try
    FUseCase.Executar(AEvento);
  except
    on E: EValidacaoNegocio do
      Result := E.Message;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveInserirComItensESeqIdDoRascunho;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  FEventosRepo.ProximoSeqId := 99;

  Rascunho := CriarRascunho(5, Itens([
    ItemValido(1),
    Item(2, 3, 4, 5, 'CX')
  ]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.AreEqual(5, FEventosRepo.UltimoSeqIdInserido);
      Assert.IsFalse(FEventosRepo.ObterProximoSeqIdChamado);
      Assert.AreEqual(2, Length(EventoDFe211130Etd(Saida.OutputObj).Itens));
      Assert.IsTrue(FRepo211130.SubstituirChamado);
      Assert.AreEqual(
        EventoDFe211130Etd(Saida.OutputObj).Id,
        FRepo211130.UltimoIdSubstituido);
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

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarInclusaoSemSeqId;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(0, Itens([ItemValido(1)]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'SeqId'));
      Assert.IsFalse(FConnection.BeginTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarColecaoVazia;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
  SemItens: EventoDFe211130ItemEtdArray;
begin
  SetLength(SemItens, 0);

  Rascunho := CriarRascunho(1, SemItens, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'Itens'));
      Assert.IsFalse(FConnection.BeginTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarMaisDeNovecentosENoventaItens;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
  MuitosItens: EventoDFe211130ItemEtdArray;
  I: Integer;
begin
  SetLength(MuitosItens, 991);

  for I := 0 to High(MuitosItens) do
    MuitosItens[I] := ItemValido(I + 1);

  Rascunho := CriarRascunho(1, MuitosItens, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'Itens'));
      Assert.IsFalse(FConnection.BeginTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarNItemDuplicado;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Itens([
    ItemValido(1),
    ItemValido(1)
  ]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'Itens'));
      Assert.IsFalse(FConnection.BeginTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarNItemForaDaFaixa;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Itens([ItemValido(0)]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'Itens'));
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;

  Rascunho := CriarRascunho(1, Itens([ItemValido(991)]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'Itens'));
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarValorNegativo;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Itens([
    Item(1, -1, -2, -10, 'UN')
  ]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'Itens'));
      Assert.IsFalse(FConnection.BeginTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarValorComMaisDeDuasCasas;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Itens([
    Item(1, 1.234, 2.345, 10, 'UN')
  ]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'Itens'));
      Assert.IsFalse(FConnection.BeginTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarUnidadeVazia;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Itens([
    Item(1, 1, 2, 10, '   ')
  ]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'Itens'));
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveAceitarUnidadeComSeisCaracteres;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Itens([
    Item(1, 1, 2, 10, 'ABCDEF')
  ]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.AreEqual('ABCDEF', EventoDFe211130Etd(Saida.OutputObj).Itens[0].UImobilizado);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveNormalizarItensAntesDeGravar;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
  Resultado: EventoDFe211130Etd;
begin
  Rascunho := CriarRascunho(1, Itens([
    Item(2, 1, 2, 10, ' UN '),
    Item(1, 3, 4, 5, 'KG')
  ]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);

      Resultado := EventoDFe211130Etd(Saida.OutputObj);
      Assert.AreEqual(1, Resultado.Itens[0].NItem);
      Assert.AreEqual(2, Resultado.Itens[1].NItem);
      Assert.AreEqual('UN', Resultado.Itens[1].UImobilizado);

      Assert.AreEqual(1, FRepo211130.ItensSalvos[0].NItem);
      Assert.AreEqual('UN', FRepo211130.ItensSalvos[1].UImobilizado);
      Assert.AreEqual(IdDoItem(1), FRepo211130.ItensSalvos[0].Id);
      Assert.AreEqual(IdDoItem(2), FRepo211130.ItensSalvos[1].Id);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveSubstituirItensNaAlteracao;
var
  Evento: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, EMPRESA_ID);

  Evento := EventoDFe211130Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, EMPRESA_ID, saAtivo,
    Itens([Item(3, 1, 2, 10, 'UN'), Item(4, 3, 4, 5, 'CX')]), 0, 0);
  try
    Saida := FUseCase.Executar(Evento);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.IsTrue(FEventosRepo.AtualizarChamado);
      Assert.IsTrue(FRepo211130.SubstituirChamado);
      Assert.AreEqual(2, Length(FRepo211130.ItensSalvos));
      Assert.AreEqual(3, FRepo211130.ItensSalvos[0].NItem);
      Assert.AreEqual(4, FRepo211130.ItensSalvos[1].NItem);
      Assert.IsTrue(FTransactionState.CommitCalled);
      Assert.IsTrue(FTransactionState.FreeTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Evento.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveRestaurarEReativarRegistro;
var
  Evento: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  SemearEvento(ID_EVENTO, 4, saLixeira, EMPRESA_ID);

  Evento := EventoDFe211130Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, EMPRESA_ID, saLixeira,
    Itens([ItemValido(1)]), 0, 0);
  try
    Saida := FUseCase.Executar(Evento);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.IsTrue(EventoDFe211130Etd(Saida.OutputObj).Ativo = saAtivo);
      Assert.IsTrue(FRepo211130.SubstituirChamado);
      Assert.IsTrue(FEventosRepo.EventoArmazenado(ID_EVENTO).Ativo = saAtivo);
      Assert.IsTrue(FTransactionState.CommitCalled);
    finally
      Saida.Free;
    end;
  finally
    Evento.Free;
  end;
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarChaveComCaracteresNaoNumericos;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Itens([ItemValido(1)]),
    StringOfChar('A', 44));
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

procedure TTestSalvarEventoDFe211130UseCase.DeveConverterColisaoDeSeqIdEmValidacao;
var
  Rascunho: EventoDFe211130Etd;
begin
  FEventosRepo.ColidirSeqId := 5;

  Rascunho := CriarRascunho(5, Itens([ItemValido(1)]), CHAVE_VALIDA);
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
  Assert.IsFalse(FRepo211130.SubstituirChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsTrue(FTransactionState.FreeTransactionCalled);
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveDesfazerTransacaoQuandoSubstituicaoFalhar;
var
  Rascunho: EventoDFe211130Etd;
begin
  FRepo211130.FalharNaSubstituicao := True;

  Rascunho := CriarRascunho(1, Itens([ItemValido(1)]), CHAVE_VALIDA);
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
  Assert.IsTrue(FRepo211130.SubstituirChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsTrue(FTransactionState.FreeTransactionCalled);
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveDesfazerTransacaoQuandoAtualizacaoFalhar;
var
  Evento: EventoDFe211130Etd;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, EMPRESA_ID);
  FEventosRepo.FalharNoAtualizar := True;

  Evento := EventoDFe211130Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, EMPRESA_ID, saAtivo,
    Itens([ItemValido(1)]), 0, 0);
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

procedure TTestSalvarEventoDFe211130UseCase.DeveRejeitarSegundoEventoNaoAutorizadoParaAMesmaChaveETipo;
var
  Rascunho: EventoDFe211130Etd;
  Mensagem: string;
begin
  SemearEvento(ID_EVENTO, 4711, saAtivo, EMPRESA_ID);

  Rascunho := CriarRascunho(4712, Itens([ItemValido(1)]), CHAVE_VALIDA);
  try
    Mensagem := RejeitarAoExecutar(Rascunho);
  finally
    Rascunho.Free;
  end;

  Assert.IsTrue(Pos('4711', Mensagem) > 0,
    'A mensagem deve citar o SEQID do evento existente.');
  Assert.IsFalse(FRepo211130.SubstituirChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
end;

procedure TTestSalvarEventoDFe211130UseCase.NaoDeveEditarEventoEnviando;
var
  Header: EventoDFeEtd;
  Evento: EventoDFe211130Etd;
  Mensagem: string;
begin
  Header := CriarHeader(ID_EVENTO, 4, saAtivo, EMPRESA_ID);
  try
    FEventosRepo.AdicionarEventoExistente(Header, seEnviando, 1);
  finally
    Header.Free;
  end;

  FRepo211130.AdicionarItens(ID_EVENTO, Itens([ItemValido(1)]));

  Evento := EventoDFe211130Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, EMPRESA_ID, saAtivo,
    Itens([ItemValido(1)]), 0, 0);
  try
    Mensagem := RejeitarAoExecutar(Evento);
  finally
    Evento.Free;
  end;

  Assert.IsTrue(Mensagem <> '');
  Assert.IsFalse(FRepo211130.SubstituirChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
end;

procedure TTestSalvarEventoDFe211130UseCase.DeveConfirmarEAliberarTransacaoAoIncluir;
var
  Rascunho: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Itens([ItemValido(1)]), CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.IsTrue(FConnection.BeginTransactionCalled);
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

initialization
  TDUnitX.RegisterTestFixture(TTestSalvarEventoDFe211130UseCase);

end.
