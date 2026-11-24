unit Test_ObterEventoDFe211130PorIdUseCase;

interface

uses
  DUnitX.TestFramework,
  ISessionContextUnit,
  StatusRegistroEnumUnit,
  EventoDFeEtdUnit,
  EventoDFe211130EtdUnit,
  EventoDFe211130ItemEtdUnit,
  ObterEventoDFe211130PorIdUseCaseUnit,
  StubSessionContextUnit,
  StubEventosDFeRepositoryUnit,
  StubEventoDFe211130RepositoryUnit;

type
  [TestFixture]
  TTestObterEventoDFe211130PorIdUseCase = class
  private
    FSession: ISessionContext;
    FEventosRepo: TEventosDFeRepositoryStub;
    FRepo211130: TEventoDFe211130RepositoryStub;
    FUseCase: ObterEventoDFe211130PorIdUseCase;
    procedure SemearEvento(const AId: string; ASeqId: Integer;
      AAtivo: StatusRegistroEnum; ACodEmpresa: Integer);
    procedure SemearTipoDivergente(const AId: string);
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveRetornarAgregadoAtivoComItensOrdenados;

    [Test]
    procedure DeveCarregarAgregadoLixeiraComRestauracao;

    [Test]
    procedure DeveRetornarColecaoVaziaNaLeituraDefensiva;

    [Test]
    procedure DeveRetornarNilQuandoRegistroNaoEncontrado;

    [Test]
    procedure DeveRetornarNilParaOutraEmpresa;

    [Test]
    procedure DeveRejeitarTipoDivergente;
  end;

implementation

uses
  SysUtils,
  TipoEventoDFeUnit,
  EValidacaoNegocioUnit;

const
  EMPRESA_ID = 3;
  OUTRA_EMPRESA_ID = 4;
  ID_EVENTO = 'EVENTO-211130';
  CHAVE_VALIDA = '11111111111111111111111111111111111111111111';

function Item(ANItem: Integer; const AUImobilizado: string): EventoDFe211130ItemEtd;
begin
  Result := EventoDFe211130ItemEtd.Create(
    Format('ITEM-%d', [ANItem]), ANItem, 0, 0, 1, AUImobilizado);
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
    EncodeDate(2026, 3, 1),
    EncodeDate(2026, 3, 2)
  );
end;

{ TTestObterEventoDFe211130PorIdUseCase }

procedure TTestObterEventoDFe211130PorIdUseCase.Setup;
begin
  FSession := TSessionContextStub.Create(EMPRESA_ID);
  FEventosRepo := TEventosDFeRepositoryStub.Create;
  FRepo211130 := TEventoDFe211130RepositoryStub.Create;
  FUseCase := ObterEventoDFe211130PorIdUseCase.Create(
    FSession, FEventosRepo, FRepo211130);
end;

procedure TTestObterEventoDFe211130PorIdUseCase.TearDown;
begin
  FUseCase.Free;
  FRepo211130.Free;
  FEventosRepo.Free;
  FSession := nil;
end;

procedure TTestObterEventoDFe211130PorIdUseCase.SemearEvento(const AId: string;
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
end;

procedure TTestObterEventoDFe211130PorIdUseCase.SemearTipoDivergente(
  const AId: string);
var
  Header: EventoDFeEtd;
begin
  Header := EventoDFeEtd.Create(
    AId,
    5,
    fdNFe,
    teAtualizacaoPrevisaoEntrega,
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

procedure TTestObterEventoDFe211130PorIdUseCase.DeveRetornarAgregadoAtivoComItensOrdenados;
var
  Evento: EventoDFe211130Etd;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, EMPRESA_ID);
  FRepo211130.AdicionarItens(ID_EVENTO, Itens([
    Item(2, 'CX'),
    Item(1, 'UN')
  ]));

  Evento := FUseCase.Executar(ID_EVENTO);
  try
    Assert.IsNotNull(Evento);
    Assert.AreEqual(2, Length(Evento.Itens));
    Assert.AreEqual('ITEM-1', Evento.Itens[0].Id);
    Assert.AreEqual(1, Evento.Itens[0].NItem);
    Assert.AreEqual('UN', Evento.Itens[0].UImobilizado);
    Assert.AreEqual('ITEM-2', Evento.Itens[1].Id);
    Assert.AreEqual(2, Evento.Itens[1].NItem);
    Assert.AreEqual('CX', Evento.Itens[1].UImobilizado);
    Assert.IsTrue(Evento.Ativo = saAtivo);
    Assert.AreEqual(EMPRESA_ID, FEventosRepo.UltimaEmpresaObterPorId);
  finally
    Evento.Free;
  end;
end;

procedure TTestObterEventoDFe211130PorIdUseCase.DeveCarregarAgregadoLixeiraComRestauracao;
var
  Evento: EventoDFe211130Etd;
begin
  SemearEvento(ID_EVENTO, 4, saLixeira, EMPRESA_ID);
  FRepo211130.AdicionarItens(ID_EVENTO, Itens([Item(1, 'UN')]));

  Evento := FUseCase.Executar(ID_EVENTO);
  try
    Assert.IsNotNull(Evento);
    Assert.IsTrue(Evento.Ativo = saLixeira);
    Assert.AreEqual(1, Length(Evento.Itens));
    Assert.AreEqual('ITEM-1', Evento.Itens[0].Id);
  finally
    Evento.Free;
  end;
end;

procedure TTestObterEventoDFe211130PorIdUseCase.DeveRetornarColecaoVaziaNaLeituraDefensiva;
var
  Evento: EventoDFe211130Etd;
begin
  // A leitura defensiva nao transforma colecao vazia em erro.
  SemearEvento(ID_EVENTO, 4, saAtivo, EMPRESA_ID);

  Evento := FUseCase.Executar(ID_EVENTO);
  try
    Assert.IsNotNull(Evento);
    Assert.AreEqual(0, Length(Evento.Itens));
  finally
    Evento.Free;
  end;
end;

procedure TTestObterEventoDFe211130PorIdUseCase.DeveRetornarNilQuandoRegistroNaoEncontrado;
begin
  Assert.IsNull(FUseCase.Executar('INEXISTENTE'));
end;

procedure TTestObterEventoDFe211130PorIdUseCase.DeveRetornarNilParaOutraEmpresa;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, OUTRA_EMPRESA_ID);

  Assert.IsNull(FUseCase.Executar(ID_EVENTO));
  Assert.AreEqual(EMPRESA_ID, FEventosRepo.UltimaEmpresaObterPorId);
end;

procedure TTestObterEventoDFe211130PorIdUseCase.DeveRejeitarTipoDivergente;
begin
  SemearTipoDivergente(ID_EVENTO);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO).Free;
    end,
    EValidacaoNegocio
  );
end;

initialization
  TDUnitX.RegisterTestFixture(TTestObterEventoDFe211130PorIdUseCase);

end.
