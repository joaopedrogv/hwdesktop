unit Test_ValidadorItemEventoDFe211130;

interface

uses
  DUnitX.TestFramework,
  ValidationEntityOutputUnit,
  EventoDFe211130ItemEtdUnit,
  ValidadorItemEventoDFe211130Unit;

type
  [TestFixture]
  TTestValidadorItemEventoDFe211130 = class
  private
    FValidador: IValidadorItemEventoDFe211130;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveAceitarItemValido;

    [Test]
    procedure DeveRejeitarNItemForaDaFaixa;

    [Test]
    procedure DeveRejeitarValoresNegativos;

    [Test]
    procedure DeveRejeitarValorComMaisDeDuasCasas;

    [Test]
    procedure DeveAceitarQuantidadeComQuatroCasas;

    [Test]
    procedure DeveValidarUnidadeComTrim;

    [Test]
    procedure DeveRejeitarUnidadeVazia;

    [Test]
    procedure DeveRejeitarUnidadeMaiorQueSeisCaracteres;

    [Test]
    procedure DeveValidarCadaItemSemDependerDaColecao;
  end;

implementation

uses
  SysUtils;

function Item(const AId: string; ANItem: Integer;
  const AVIbs, AVCbs, AQImobilizado: Currency;
  const AUImobilizado: string): EventoDFe211130ItemEtd;
begin
  Result := EventoDFe211130ItemEtd.Create(AId, ANItem, AVIbs, AVCbs,
    AQImobilizado, AUImobilizado);
end;

function ItemValido(ANItem: Integer): EventoDFe211130ItemEtd;
begin
  Result := Item(Format('ITEM-%d', [ANItem]), ANItem, 1, 2, 10, 'UN');
end;

function PossuiErro(const AValidacao: ValidationEntityOutput;
  const ACampo: string): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to High(AValidacao.Validations) do
    if AValidacao.Validations[I].FieldName = ACampo then
      Exit(True);
end;

{ TTestValidadorItemEventoDFe211130 }

procedure TTestValidadorItemEventoDFe211130.Setup;
begin
  FValidador := ValidadorItemEventoDFe211130.Create;
end;

procedure TTestValidadorItemEventoDFe211130.TearDown;
begin
  FValidador := nil;
end;

procedure TTestValidadorItemEventoDFe211130.DeveAceitarItemValido;
var
  Validacao: ValidationEntityOutput;
begin
  Validacao := FValidador.Validar(ItemValido(1));

  Assert.IsTrue(Validacao.IsValid);
  Assert.AreEqual(0, Length(Validacao.Validations));
end;

procedure TTestValidadorItemEventoDFe211130.DeveRejeitarNItemForaDaFaixa;
var
  Validacao: ValidationEntityOutput;
begin
  Validacao := FValidador.Validar(ItemValido(0));

  Assert.IsFalse(Validacao.IsValid);
  Assert.AreEqual(1, Length(Validacao.Validations));
  Assert.IsTrue(PossuiErro(Validacao, 'NItem'));

  Validacao := FValidador.Validar(ItemValido(991));

  Assert.IsFalse(Validacao.IsValid);
  Assert.AreEqual(1, Length(Validacao.Validations));
  Assert.IsTrue(PossuiErro(Validacao, 'NItem'));
end;

procedure TTestValidadorItemEventoDFe211130.DeveRejeitarValoresNegativos;
var
  Validacao: ValidationEntityOutput;
begin
  Validacao := FValidador.Validar(Item('ITEM-1', 1, -1, -2, -10, 'UN'));

  Assert.IsFalse(Validacao.IsValid);
  Assert.IsTrue(PossuiErro(Validacao, 'VIbs'));
  Assert.IsTrue(PossuiErro(Validacao, 'VCbs'));
  Assert.IsTrue(PossuiErro(Validacao, 'QImobilizado'));
end;

procedure TTestValidadorItemEventoDFe211130.DeveRejeitarValorComMaisDeDuasCasas;
var
  Validacao: ValidationEntityOutput;
begin
  Validacao := FValidador.Validar(Item('ITEM-1', 1, 1.234, 2.345, 10, 'UN'));

  Assert.IsFalse(Validacao.IsValid);
  Assert.AreEqual(2, Length(Validacao.Validations));
  Assert.IsTrue(PossuiErro(Validacao, 'VIbs'));
  Assert.IsTrue(PossuiErro(Validacao, 'VCbs'));
  Assert.IsFalse(PossuiErro(Validacao, 'QImobilizado'));
end;

procedure TTestValidadorItemEventoDFe211130.DeveAceitarQuantidadeComQuatroCasas;
var
  Validacao: ValidationEntityOutput;
begin
  Validacao := FValidador.Validar(Item('ITEM-1', 1, 1.23, 2.34, 1.2345, 'UN'));

  Assert.IsTrue(Validacao.IsValid);
end;

procedure TTestValidadorItemEventoDFe211130.DeveValidarUnidadeComTrim;
var
  Validacao: ValidationEntityOutput;
begin
  Validacao := FValidador.Validar(Item('ITEM-1', 1, 1, 2, 10, ' UN '));

  Assert.IsTrue(Validacao.IsValid);
end;

procedure TTestValidadorItemEventoDFe211130.DeveRejeitarUnidadeVazia;
var
  Validacao: ValidationEntityOutput;
begin
  Validacao := FValidador.Validar(Item('ITEM-1', 1, 1, 2, 10, '   '));

  Assert.IsFalse(Validacao.IsValid);
  Assert.AreEqual(1, Length(Validacao.Validations));
  Assert.IsTrue(PossuiErro(Validacao, 'UImobilizado'));
end;

procedure TTestValidadorItemEventoDFe211130.DeveRejeitarUnidadeMaiorQueSeisCaracteres;
var
  Validacao: ValidationEntityOutput;
begin
  Validacao := FValidador.Validar(Item('ITEM-1', 1, 1, 2, 10, 'ABCDEFG'));

  Assert.IsFalse(Validacao.IsValid);
  Assert.AreEqual(1, Length(Validacao.Validations));
  Assert.IsTrue(PossuiErro(Validacao, 'UImobilizado'));
end;

procedure TTestValidadorItemEventoDFe211130.DeveValidarCadaItemSemDependerDaColecao;
var
  Validacao: ValidationEntityOutput;
begin
  // A duplicidade de nItem pertence ao salvamento do evento, nao ao item.
  Validacao := FValidador.Validar(ItemValido(1));
  Assert.IsTrue(Validacao.IsValid);

  Validacao := FValidador.Validar(ItemValido(1));
  Assert.IsTrue(Validacao.IsValid);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestValidadorItemEventoDFe211130);

end.