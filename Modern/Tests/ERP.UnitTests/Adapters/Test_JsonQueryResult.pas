unit Test_JsonQueryResult;

interface

uses
  System.SysUtils,
  System.JSON,
  DUnitX.TestFramework,
  JsonQueryResultUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  DoubleNullableUnit,
  DateAndTimeNullableUnit;

type
  [TestFixture]
  TTestJsonQueryResult = class
  private
    function Criar(const AJson: string): JsonQueryResult;
  public
    [Test]
    procedure DeveTratarNuloComoStringVaziaENuloNullable;

    [Test]
    procedure DevePreservarStringVaziaComoValorNaoNulo;

    [Test]
    procedure DevePreservarNumeroZeroComoValorNaoNulo;

    [Test]
    procedure DeveConverterBooleanoParaUmEDezero;

    [Test]
    procedure DeveCoercionarNumeroParaString;

    [Test]
    procedure DeveCompararInteiroEString;

    [Test]
    procedure DeveLerDatasISOComDateService;

    [Test]
    procedure DeveLerDecimaisReais;

    [Test]
    procedure DeveExporContadorExplicitoDeLinha;

    [Test]
    procedure DeveTratarCampoAusenteComoNulo;
  end;

implementation

function TTestJsonQueryResult.Criar(const AJson: string): JsonQueryResult;
var
  Valor: TJSONValue;
begin
  Valor := TJSONObject.ParseJSONValue(AJson);
  // O fixture transfere a posse do objeto JSON para o JsonQueryResult.
  Result := JsonQueryResult.Create(TJSONObject(Valor), True);
end;

procedure TTestJsonQueryResult.DeveTratarNuloComoStringVaziaENuloNullable;
var
  Qr: JsonQueryResult;
begin
  Qr := Criar('{"CAMPO":null}');
  try
    Assert.AreEqual('', Qr.FieldAsString('CAMPO'));
    Assert.AreEqual(0, Qr.FieldAsInteger('CAMPO'));
    Assert.IsTrue(Qr.FieldIsNull('CAMPO'));
    Assert.IsTrue(Qr.FieldIsNullOrWhiteSpace('CAMPO'));
    Assert.IsTrue(Qr.FieldAsStringNullable('CAMPO').IsNull);
    Assert.IsTrue(Qr.FieldAsIntNullable('CAMPO').IsNull);
    Assert.IsTrue(Qr.FieldAsDoubleNullable('CAMPO').IsNull);
    Assert.IsTrue(Qr.FieldAsDateTimeNullable('CAMPO').IsNull);
  finally
    Qr.Free;
  end;
end;

procedure TTestJsonQueryResult.DevePreservarStringVaziaComoValorNaoNulo;
var
  Qr: JsonQueryResult;
begin
  Qr := Criar('{"CAMPO":""}');
  try
    Assert.AreEqual('', Qr.FieldAsString('CAMPO'));
    Assert.IsFalse(Qr.FieldIsNull('CAMPO'));
    Assert.IsTrue(Qr.FieldIsNullOrWhiteSpace('CAMPO'));
    Assert.IsTrue(Qr.FieldAsStringNullable('CAMPO').HasValue);
    Assert.AreEqual('', Qr.FieldAsStringNullable('CAMPO').Value);
  finally
    Qr.Free;
  end;
end;

procedure TTestJsonQueryResult.DevePreservarNumeroZeroComoValorNaoNulo;
var
  Qr: JsonQueryResult;
begin
  Qr := Criar('{"CAMPO":0}');
  try
    Assert.AreEqual('0', Qr.FieldAsString('CAMPO'));
    Assert.AreEqual(0, Qr.FieldAsInteger('CAMPO'));
    Assert.IsFalse(Qr.FieldIsNull('CAMPO'));
    Assert.IsTrue(Qr.FieldAsIntNullable('CAMPO').HasValue);
    Assert.AreEqual(0, Qr.FieldAsIntNullable('CAMPO').Value);
    Assert.IsFalse(Qr.FieldAsDoubleNullable('CAMPO').IsNull);
  finally
    Qr.Free;
  end;
end;

procedure TTestJsonQueryResult.DeveConverterBooleanoParaUmEDezero;
var
  Qr: JsonQueryResult;
begin
  Qr := Criar('{"VERDADE":true,"FALSO":false}');
  try
    Assert.AreEqual('1', Qr.FieldAsString('VERDADE'));
    Assert.AreEqual('0', Qr.FieldAsString('FALSO'));
    Assert.AreEqual(1, Qr.FieldAsInteger('VERDADE'));
    Assert.AreEqual(0, Qr.FieldAsInteger('FALSO'));
    Assert.IsFalse(Qr.FieldIsNull('FALSO'));
  finally
    Qr.Free;
  end;
end;

procedure TTestJsonQueryResult.DeveCoercionarNumeroParaString;
var
  Qr: JsonQueryResult;
begin
  Qr := Criar('{"INDICADOR":1,"DECIMAL":10.5}');
  try
    Assert.AreEqual('1', Qr.FieldAsString('INDICADOR'));
    Assert.AreEqual('10.5', Qr.FieldAsString('DECIMAL'));
  finally
    Qr.Free;
  end;
end;

procedure TTestJsonQueryResult.DeveCompararInteiroEString;
var
  Qr: JsonQueryResult;
begin
  Qr := Criar('{"NUM":1,"TXT":"1","ZERO":0}');
  try
    Assert.IsTrue(Qr.FieldAreEquals('NUM', 1));
    Assert.IsFalse(Qr.FieldAreEquals('NUM', 0));
    Assert.IsTrue(Qr.FieldAreEquals('TXT', '1'));
    Assert.IsFalse(Qr.FieldAreEquals('TXT', '0'));
    Assert.IsFalse(Qr.FieldAreEquals('ZERO', 1));
  finally
    Qr.Free;
  end;
end;

procedure TTestJsonQueryResult.DeveLerDatasISOComDateService;
var
  Qr: JsonQueryResult;
begin
  Qr := Criar('{"DATA":"2026-01-01","FIM":null}');
  try
    Assert.IsTrue(Qr.FieldAsDate('DATA') = EncodeDate(2026, 1, 1));
    Assert.IsTrue(Qr.FieldAsDateTimeNullable('DATA').HasValue);
    Assert.IsTrue(Qr.FieldAsDateTimeNullable('DATA').Value = EncodeDate(2026, 1, 1));
    Assert.IsTrue(Qr.FieldAsDateTimeNullable('FIM').IsNull);
  finally
    Qr.Free;
  end;
end;

procedure TTestJsonQueryResult.DeveLerDecimaisReais;
var
  Qr: JsonQueryResult;
begin
  Qr := Criar('{"VALOR":12.75}');
  try
    Assert.IsTrue(Abs(Qr.FieldAsDouble('VALOR') - 12.75) < 0.000001);
    Assert.IsTrue(Abs(Qr.FieldAsFloat('VALOR') - 12.75) < 0.000001);
    Assert.IsFalse(Qr.FieldAsDoubleNullable('VALOR').IsNull);
    Assert.IsTrue(Abs(Qr.FieldAsDoubleNullable('VALOR').Value - 12.75) < 0.000001);
  finally
    Qr.Free;
  end;
end;

procedure TTestJsonQueryResult.DeveExporContadorExplicitoDeLinha;
var
  Qr: JsonQueryResult;
begin
  Qr := JsonQueryResult.Create(TJSONObject(TJSONObject.ParseJSONValue('{"CAMPO":1}')), True, 7);
  try
    Assert.AreEqual(7, Qr.RowIndex);
  finally
    Qr.Free;
  end;
end;

procedure TTestJsonQueryResult.DeveTratarCampoAusenteComoNulo;
var
  Qr: JsonQueryResult;
begin
  Qr := Criar('{"OUTRO":1}');
  try
    Assert.AreEqual('', Qr.FieldAsString('AUSENTE'));
    Assert.IsTrue(Qr.FieldIsNull('AUSENTE'));
    Assert.IsTrue(Qr.FieldAsIntNullable('AUSENTE').IsNull);
  finally
    Qr.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestJsonQueryResult);

end.
