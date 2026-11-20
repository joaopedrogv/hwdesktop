unit Test_EventoDFe211130Itens;

interface

uses
  DUnitX.TestFramework,
  TipoComunsUnit,
  EventoDFe211130ItemEtdUnit,
  EventoDFe211130ItensUnit;

type
  [TestFixture]
  TTestEventoDFe211130Itens = class
  public
    [Test]
    procedure DeveAceitarColecaoComUmItem;

    [Test]
    procedure DeveRejeitarColecaoVazia;

    [Test]
    procedure DeveRejeitarMaisDeNovecentosENoventaItens;

    [Test]
    procedure DeveRejeitarNItemForaDaFaixa;

    [Test]
    procedure DeveRejeitarNItemDuplicado;

    [Test]
    procedure DeveRejeitarValoresNegativos;

    [Test]
    procedure DeveRejeitarValorComMaisDeDuasCasas;

    [Test]
    procedure DeveAceitarQuantidadeComQuatroCasas;

    [Test]
    procedure DeveValidarUnidadeComTrim;

    [Test]
    procedure DeveRejeitarUnidadeMaiorQueSeisCaracteres;

    [Test]
    procedure DeveNormalizarOrdemETrimSemRemoverItens;

    [Test]
    procedure DeveCompararItensNormalizados;

    [Test]
    procedure DeveIdentificarNItemNaMensagem;
  end;

implementation

uses
  SysUtils;

function Item(ANItem: Integer; const AVIbs, AVCbs, AQImobilizado: Currency;
  const AUImobilizado: string): EventoDFe211130ItemEtd;
begin
  Result := EventoDFe211130ItemEtd.Create(
    ANItem, AVIbs, AVCbs, AQImobilizado, AUImobilizado);
end;

function ItemValido(ANItem: Integer): EventoDFe211130ItemEtd;
begin
  Result := Item(ANItem, 1, 2, 10, 'UN');
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

{ TTestEventoDFe211130Itens }

procedure TTestEventoDFe211130Itens.DeveAceitarColecaoComUmItem;
var
  Erros: TArrayString;
begin
  Assert.IsTrue(EventoDFe211130Itens.Validar(Itens([ItemValido(1)]), Erros));
  Assert.AreEqual(0, Length(Erros));
end;

procedure TTestEventoDFe211130Itens.DeveRejeitarColecaoVazia;
var
  Erros: TArrayString;
  SemItens: EventoDFe211130ItemEtdArray;
begin
  SetLength(SemItens, 0);

  Assert.IsFalse(EventoDFe211130Itens.Validar(SemItens, Erros));
  Assert.AreEqual(1, Length(Erros));
end;

procedure TTestEventoDFe211130Itens.DeveRejeitarMaisDeNovecentosENoventaItens;
var
  Erros: TArrayString;
  MuitosItens: EventoDFe211130ItemEtdArray;
  I: Integer;
begin
  SetLength(MuitosItens, 991);

  for I := 0 to High(MuitosItens) do
    MuitosItens[I] := ItemValido(I + 1);

  Assert.IsFalse(EventoDFe211130Itens.Validar(MuitosItens, Erros));
  Assert.AreEqual(1, Length(Erros));
end;

procedure TTestEventoDFe211130Itens.DeveRejeitarNItemForaDaFaixa;
var
  Erros: TArrayString;
begin
  Assert.IsFalse(EventoDFe211130Itens.Validar(Itens([ItemValido(0)]), Erros));
  Assert.AreEqual(1, Length(Erros));

  Assert.IsFalse(EventoDFe211130Itens.Validar(Itens([ItemValido(991)]), Erros));
  Assert.AreEqual(1, Length(Erros));
end;

procedure TTestEventoDFe211130Itens.DeveRejeitarNItemDuplicado;
var
  Erros: TArrayString;
begin
  Assert.IsFalse(EventoDFe211130Itens.Validar(Itens([
    ItemValido(1),
    ItemValido(1)
  ]), Erros));
  Assert.AreEqual(1, Length(Erros));
  Assert.IsTrue(Pos('1', Erros[0]) > 0);
end;

procedure TTestEventoDFe211130Itens.DeveRejeitarValoresNegativos;
var
  Erros: TArrayString;
begin
  Assert.IsFalse(EventoDFe211130Itens.Validar(Itens([
    Item(1, -1, -2, -10, 'UN')
  ]), Erros));
  Assert.IsTrue(Length(Erros) >= 3);
end;

procedure TTestEventoDFe211130Itens.DeveRejeitarValorComMaisDeDuasCasas;
var
  Erros: TArrayString;
begin
  Assert.IsFalse(EventoDFe211130Itens.Validar(Itens([
    Item(1, 1.234, 2.345, 10, 'UN')
  ]), Erros));
  Assert.IsTrue(Length(Erros) >= 2);
end;

procedure TTestEventoDFe211130Itens.DeveAceitarQuantidadeComQuatroCasas;
var
  Erros: TArrayString;
begin
  Assert.IsTrue(EventoDFe211130Itens.Validar(Itens([
    Item(1, 1.23, 2.34, 1.2345, 'UN')
  ]), Erros));
  Assert.AreEqual(0, Length(Erros));
end;

procedure TTestEventoDFe211130Itens.DeveValidarUnidadeComTrim;
var
  Erros: TArrayString;
begin
  Assert.IsTrue(EventoDFe211130Itens.Validar(Itens([
    Item(1, 1, 2, 10, ' UN ')
  ]), Erros));
end;

procedure TTestEventoDFe211130Itens.DeveRejeitarUnidadeMaiorQueSeisCaracteres;
var
  Erros: TArrayString;
begin
  Assert.IsFalse(EventoDFe211130Itens.Validar(Itens([
    Item(1, 1, 2, 10, 'ABCDEFG')
  ]), Erros));
  Assert.AreEqual(1, Length(Erros));
end;

procedure TTestEventoDFe211130Itens.DeveNormalizarOrdemETrimSemRemoverItens;
var
  Normalizado: EventoDFe211130ItemEtdArray;
begin
  Normalizado := EventoDFe211130Itens.Normalizar(Itens([
    Item(2, 1, 2, 10, ' CX '),
    Item(1, 3, 4, 5, 'UN')
  ]));

  Assert.AreEqual(2, Length(Normalizado));
  Assert.AreEqual(1, Normalizado[0].NItem);
  Assert.AreEqual(2, Normalizado[1].NItem);
  Assert.AreEqual('CX', Normalizado[1].UImobilizado);
end;

procedure TTestEventoDFe211130Itens.DeveCompararItensNormalizados;
begin
  Assert.IsTrue(EventoDFe211130Itens.Iguais(
    Itens([Item(2, 1, 2, 10, ' CX '), Item(1, 3, 4, 5, 'UN')]),
    Itens([Item(1, 3, 4, 5, 'UN'), Item(2, 1, 2, 10, 'CX')])));

  Assert.IsFalse(EventoDFe211130Itens.Iguais(
    Itens([ItemValido(1)]),
    Itens([ItemValido(2)])));
end;

procedure TTestEventoDFe211130Itens.DeveIdentificarNItemNaMensagem;
var
  Erros: TArrayString;
  I: Integer;
  Encontrou: Boolean;
begin
  Assert.IsFalse(EventoDFe211130Itens.Validar(Itens([
    Item(7, -1, 2, 10, 'UN')
  ]), Erros));

  Encontrou := False;

  for I := 0 to High(Erros) do
    if Pos('7', Erros[I]) > 0 then
      Encontrou := True;

  Assert.IsTrue(Encontrou);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestEventoDFe211130Itens);

end.
