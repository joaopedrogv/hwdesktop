unit Test_AliquotaResultadoModel;

interface

uses
  DUnitX.TestFramework,
  AliquotaResultadoModelUnit,
  CurrencyNullableUnit,
  StringNullableUnit,
  System.SysUtils;

type
  [TestFixture]
  TTest_AliquotaResultadoModel = class
  public
    [Test]
    procedure teste_CriacaoComApenasValorReferencia_DeveFuncionar;
    [Test]
    procedure teste_ValorAplicavel_SemValorPadrao_DeveRetornarValorReferencia;
    [Test]
    procedure teste_CriacaoComAcrescimo_DeveAplicarCorretamente;
    [Test]
    procedure teste_ValorAplicavel_ComAcrescimo_DeveRetornarValorPadraoCalculado;
    [Test]
    procedure teste_CriacaoComDecrescimo_DeveAplicarCorretamente;
    [Test]
    procedure teste_ValorAplicavel_ComDecrescimo_DeveRetornarValorPadraoCalculado;
    [Test]
    procedure teste_CriacaoComValorReferenciaNull_DeveLancarExcecao;
    [Test]
    procedure teste_CriacaoComValorPadraoSemFormaAplicacao_DeveLancarExcecao;
    [Test]
    procedure teste_CriacaoComFormaAplicacaoSemValorPadrao_DeveLancarExcecao;
    [Test]
    procedure teste_AcrescimoComValoresDecimais_DeveCalcularPrecisamente;
    [Test]
    procedure teste_DecrescimoComValoresDecimais_DeveCalcularPrecisamente;
    [Test]
    procedure teste_AcrescimoComValorZero_DeveManterValorReferencia;
    [Test]
    procedure teste_DecrescimoComValorZero_DeveManterValorReferencia;
    [Test]
    procedure teste_ValorReferenciaNegativo_DeveLancarExcecao;
    [Test]
    procedure teste_ValorPadraoNegativo_DeveLancarExcecao;
    [Test]
    procedure teste_DecrescimoResultadoNegativo_DeveLancarExcecao;
    [Test]
    procedure teste_ValoresComMuitasCasasDecimais_DevePreservarPrecisao;
    [Test]
    procedure teste_CriacaoComSubstituicao_DeveManterValorPadrao;
    [Test]
    procedure teste_ValorAplicavel_ComSubstituicao_DeveRetornarValorPadrao;
    [Test]
    procedure teste_SubstituicaoComValorMaiorQueReferencia_DevePermitir;
    [Test]
    procedure teste_SubstituicaoComValorMenorQueReferencia_DevePermitir;
    [Test]
    procedure teste_SubstituicaoComValoresDecimais_DevePreservarPrecisao;
    [Test]
    procedure teste_SubstituicaoComValorZero_DevePermitir;
    [Test]
    procedure teste_AcrescimoComValoresGrandes_DeveCalcularCorretamente;
    [Test]
    procedure teste_DecrescimoComValoresIguais_DeveResultarZero;
    [Test]
    procedure teste_AcrescimoComValorReferenciaZero_DeveResultarValorPadrao;
    [Test]
    procedure teste_DecrescimoComValorReferenciaZero_DeveResultarNegativo;
    [Test]
    procedure teste_SubstituicaoComValorIgualReferencia_DevePermitir;
    [Test]
    procedure teste_AcrescimoComMuitasCasasDecimais_DevePreservarTodasCasas;
    [Test]
    procedure teste_DecrescimoComResultadoMuitoPequeno_DevePreservarPrecisao;
    [Test]
    procedure teste_ValorReferenciaZeroSemValorPadrao_DevePermitir;
    [Test]
    procedure teste_AcrescimoComValoresFracionarios_DeveCalcularCorretamente;
    [Test]
    procedure teste_DecrescimoComValoresFracionarios_DeveCalcularCorretamente;
    [Test]
    procedure teste_SubstituicaoComValorFracionario_DevePreservar;
    [Test]
    procedure teste_ValorReferenciaUmCentavo_ComAcrescimo_DeveCalcular;
    [Test]
    procedure teste_MultiplasCriacoesComMesmosValores_DevemSerIndependentes;
  end;

implementation

{ TTest_AliquotaResultadoModel }

procedure TTest_AliquotaResultadoModel.teste_CriacaoComApenasValorReferencia_DeveFuncionar;
var
  valorReferencia: CurrencyNullable;
  model: AliquotaResultadoModel;
begin
  valorReferencia.SetValue(10.50);
  model := AliquotaResultadoModel.Create(valorReferencia, Default(CurrencyNullable), Default(StringNullable));
  try
    Assert.IsNotNull(model, 'Model não deve ser nulo');
    Assert.AreEqual(valorReferencia.Value, model.ValorReferencia.Value, 0.0001, 'Valor de referência deve ser preservado');
    Assert.IsFalse(model.ValorPadrao.HasValue, 'Valor padrão deve ser nulo');
    Assert.IsFalse(model.FormaAplicacao.HasValue, 'Forma de aplicação deve ser nula');
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_ValorAplicavel_SemValorPadrao_DeveRetornarValorReferencia;
var
  valorReferencia: CurrencyNullable;
  model: AliquotaResultadoModel;
begin
  valorReferencia.SetValue(15.75);
  model := AliquotaResultadoModel.Create(valorReferencia, Default(CurrencyNullable), Default(StringNullable));
  try
    Assert.AreEqual(valorReferencia.Value, model.ValorAplicavel, 0.0001, 'Quando não há valor padrão, ValorAplicavel deve retornar valor de referência');
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_CriacaoComAcrescimo_DeveAplicarCorretamente;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(100.00);
  vPad.SetValue(5.00);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(105.00, model.ValorPadrao.Value, 0.0001, 'Valor padrão deve ser soma de referência + padrão quando forma é ACRESCIMO');
    Assert.AreEqual(vRef.Value, model.ValorReferencia.Value, 0.0001, 'Valor de referência deve permanecer inalterado');
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_ValorAplicavel_ComAcrescimo_DeveRetornarValorPadraoCalculado;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(50.00);
  vPad.SetValue(10.00);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(60.00, model.ValorAplicavel, 0.0001, 'Valor aplicável deve ser o valor padrão calculado (50 + 10)');
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_CriacaoComDecrescimo_DeveAplicarCorretamente;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(100.00);
  vPad.SetValue(15.00);
  fApp.SetValue('DECRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(85.00, model.ValorPadrao.Value, 0.0001, 'Valor padrão deve ser diferença de referência - padrão quando forma é DECRESCIMO');
    Assert.AreEqual(vRef.Value, model.ValorReferencia.Value, 0.0001, 'Valor de referência deve permanecer inalterado');
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_ValorAplicavel_ComDecrescimo_DeveRetornarValorPadraoCalculado;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(80.00);
  vPad.SetValue(20.00);
  fApp.SetValue('DECRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(60.00, model.ValorAplicavel, 0.0001, 'Valor aplicável deve ser o valor padrão calculado (80 - 20)');
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_CriacaoComValorReferenciaNull_DeveLancarExcecao;
begin
  Assert.WillRaise(
    procedure
    begin
      AliquotaResultadoModel.Create(Default(CurrencyNullable), Default(CurrencyNullable), Default(StringNullable));
    end,
    Exception);
end;

procedure TTest_AliquotaResultadoModel.teste_CriacaoComValorPadraoSemFormaAplicacao_DeveLancarExcecao;
var
  vRef, vPad: CurrencyNullable;
begin
  vRef.SetValue(100.00);
  vPad.SetValue(10.00);
  Assert.WillRaise(
    procedure
    begin
      AliquotaResultadoModel.Create(vRef, vPad, Default(StringNullable));
    end,
    Exception);
end;

procedure TTest_AliquotaResultadoModel.teste_CriacaoComFormaAplicacaoSemValorPadrao_DeveLancarExcecao;
var
  vRef: CurrencyNullable;
  fApp: StringNullable;
begin
  vRef.SetValue(100.00);
  fApp.SetValue('ACRESCIMO');
  Assert.WillRaise(
    procedure
    begin
      AliquotaResultadoModel.Create(vRef, Default(CurrencyNullable), fApp);
    end,
    Exception);
end;

procedure TTest_AliquotaResultadoModel.teste_AcrescimoComValoresDecimais_DeveCalcularPrecisamente;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(12.345);
  vPad.SetValue(2.655);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(15.000, model.ValorPadrao.Value, 0.0001, 'Cálculo com decimais deve ser preciso');
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_DecrescimoComValoresDecimais_DeveCalcularPrecisamente;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(25.750);
  vPad.SetValue(5.250);
  fApp.SetValue('DECRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(20.500, model.ValorPadrao.Value, 0.0001, 'Cálculo com decimais deve ser preciso');
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_AcrescimoComValorZero_DeveManterValorReferencia;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(50.00);
  vPad.SetValue(0);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(50.00, model.ValorPadrao.Value, 0.0001);
    Assert.AreEqual(50.00, model.ValorAplicavel, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_DecrescimoComValorZero_DeveManterValorReferencia;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(50.00);
  vPad.SetValue(0);
  fApp.SetValue('DECRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(50.00, model.ValorPadrao.Value, 0.0001);
    Assert.AreEqual(50.00, model.ValorAplicavel, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_ValorReferenciaNegativo_DeveLancarExcecao;
var
  vRef: CurrencyNullable;
begin
  vRef.SetValue(-10.00);
  Assert.WillRaise(
    procedure
    begin
      AliquotaResultadoModel.Create(vRef, Default(CurrencyNullable), Default(StringNullable));
    end,
    Exception);
end;

procedure TTest_AliquotaResultadoModel.teste_ValorPadraoNegativo_DeveLancarExcecao;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
begin
  vRef.SetValue(100.00);
  vPad.SetValue(-10.00);
  fApp.SetValue('ACRESCIMO');
  Assert.WillRaise(
    procedure
    begin
      AliquotaResultadoModel.Create(vRef, vPad, fApp);
    end,
    Exception);
end;

procedure TTest_AliquotaResultadoModel.teste_DecrescimoResultadoNegativo_DeveLancarExcecao;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
begin
  vRef.SetValue(10.00);
  vPad.SetValue(15.00);
  fApp.SetValue('DECRESCIMO');
  Assert.WillRaise(
    procedure
    begin
      AliquotaResultadoModel.Create(vRef, vPad, fApp);
    end,
    Exception);
end;

procedure TTest_AliquotaResultadoModel.teste_ValoresComMuitasCasasDecimais_DevePreservarPrecisao;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(123.4567);
  vPad.SetValue(0.0001);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(123.4568, model.ValorPadrao.Value, 0.00001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_CriacaoComSubstituicao_DeveManterValorPadrao;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(100.00);
  vPad.SetValue(25.00);
  fApp.SetValue('SUBSTITUICAO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(25.00, model.ValorPadrao.Value, 0.0001);
    Assert.AreEqual(100.00, model.ValorReferencia.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_ValorAplicavel_ComSubstituicao_DeveRetornarValorPadrao;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(50.00);
  vPad.SetValue(30.00);
  fApp.SetValue('SUBSTITUICAO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(30.00, model.ValorAplicavel, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_SubstituicaoComValorMaiorQueReferencia_DevePermitir;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(10.00);
  vPad.SetValue(50.00);
  fApp.SetValue('SUBSTITUICAO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(50.00, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_SubstituicaoComValorMenorQueReferencia_DevePermitir;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(80.00);
  vPad.SetValue(15.00);
  fApp.SetValue('SUBSTITUICAO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(15.00, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_SubstituicaoComValoresDecimais_DevePreservarPrecisao;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(45.678);
  vPad.SetValue(12.345);
  fApp.SetValue('SUBSTITUICAO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(12.345, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_SubstituicaoComValorZero_DevePermitir;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(50.00);
  vPad.SetValue(0);
  fApp.SetValue('SUBSTITUICAO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(0, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_AcrescimoComValoresGrandes_DeveCalcularCorretamente;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(9999999.99);
  vPad.SetValue(0.01);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(10000000.00, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_DecrescimoComValoresIguais_DeveResultarZero;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(100.00);
  vPad.SetValue(100.00);
  fApp.SetValue('DECRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(0, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_AcrescimoComValorReferenciaZero_DeveResultarValorPadrao;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(0);
  vPad.SetValue(25.00);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(25.00, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_DecrescimoComValorReferenciaZero_DeveResultarNegativo;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
begin
  vRef.SetValue(0);
  vPad.SetValue(10.00);
  fApp.SetValue('DECRESCIMO');
  Assert.WillRaise(
    procedure
    begin
      AliquotaResultadoModel.Create(vRef, vPad, fApp);
    end,
    Exception);
end;

procedure TTest_AliquotaResultadoModel.teste_SubstituicaoComValorIgualReferencia_DevePermitir;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(75.50);
  vPad.SetValue(75.50);
  fApp.SetValue('SUBSTITUICAO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(75.50, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_AcrescimoComMuitasCasasDecimais_DevePreservarTodasCasas;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(1.1234);
  vPad.SetValue(2.8766);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(4.0000, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_DecrescimoComResultadoMuitoPequeno_DevePreservarPrecisao;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(10.0001);
  vPad.SetValue(10.0000);
  fApp.SetValue('DECRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(0.0001, model.ValorPadrao.Value, 0.00001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_ValorReferenciaZeroSemValorPadrao_DevePermitir;
var
  vRef: CurrencyNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(0);
  model := AliquotaResultadoModel.Create(vRef, Default(CurrencyNullable), Default(StringNullable));
  try
    Assert.AreEqual(0, model.ValorReferencia.Value, 0.0001);
    Assert.AreEqual(0, model.ValorAplicavel, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_AcrescimoComValoresFracionarios_DeveCalcularCorretamente;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(0.5);
  vPad.SetValue(0.3);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(0.8, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_DecrescimoComValoresFracionarios_DeveCalcularCorretamente;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(0.9);
  vPad.SetValue(0.4);
  fApp.SetValue('DECRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(0.5, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_SubstituicaoComValorFracionario_DevePreservar;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(10.0);
  vPad.SetValue(0.25);
  fApp.SetValue('SUBSTITUICAO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(0.25, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_ValorReferenciaUmCentavo_ComAcrescimo_DeveCalcular;
var
  vRef, vPad: CurrencyNullable;
  fApp: StringNullable;
  model: AliquotaResultadoModel;
begin
  vRef.SetValue(0.01);
  vPad.SetValue(0.01);
  fApp.SetValue('ACRESCIMO');
  model := AliquotaResultadoModel.Create(vRef, vPad, fApp);
  try
    Assert.AreEqual(0.02, model.ValorPadrao.Value, 0.0001);
  finally
    model.Free;
  end;
end;

procedure TTest_AliquotaResultadoModel.teste_MultiplasCriacoesComMesmosValores_DevemSerIndependentes;
var
  vRef, vPad: CurrencyNullable;
  fApp1, fApp2, fApp3: StringNullable;
  m1, m2, m3: AliquotaResultadoModel;
begin
  vRef.SetValue(100.00);
  vPad.SetValue(10.00);
  fApp1.SetValue('ACRESCIMO');
  fApp2.SetValue('DECRESCIMO');
  fApp3.SetValue('SUBSTITUICAO');

  m1 := AliquotaResultadoModel.Create(vRef, vPad, fApp1);
  m2 := AliquotaResultadoModel.Create(vRef, vPad, fApp2);
  m3 := AliquotaResultadoModel.Create(vRef, vPad, fApp3);
  try
    Assert.AreEqual(110.00, m1.ValorPadrao.Value, 0.0001);
    Assert.AreEqual(90.00, m2.ValorPadrao.Value, 0.0001);
    Assert.AreEqual(10.00, m3.ValorPadrao.Value, 0.0001);
  finally
    m1.Free;
    m2.Free;
    m3.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_AliquotaResultadoModel);

end.
