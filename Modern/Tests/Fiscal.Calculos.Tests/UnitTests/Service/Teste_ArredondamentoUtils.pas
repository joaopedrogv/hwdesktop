unit Teste_ArredondamentoUtils;

interface

uses
  DUnitX.TestFramework,
  ArredondamentoUtilsUnit,
  NumberServiceUnit,
  CurrencyNullableUnit,
  DoubleNullableUnit;

type
  [TestFixture]
  TTest_ArredondamentoUtils = class
  public
    [Test]
    procedure teste_ArredondarInterno_Retorna8CasasHalfEven;

    [Test]
    procedure teste_RoundHalfEvenTo8_Retorna8Casas;

    [Test]
    procedure teste_DividirPorCem_DevolveFracao;

    [Test]
    procedure teste_Dividir_DevolveFracao;

    [Test]
    procedure teste_Multiplicar_Retorna8Casas;

    [Test]
    procedure teste_Subtrair_Retorna8Casas;

    [Test]
    procedure teste_RoundHalfEven_EmpateArredondaParaPar;

    [Test]
    procedure teste_Empate8Casas_HalfEvenDivergeDeHalfUp;

    [Test]
    procedure teste_CurrencyNullable_NuloRetornaNuloSemExcecao;

    [Test]
    procedure teste_DoubleNullable_NuloRetornaNuloSemExcecao;
  end;

implementation

{ TTest_ArredondamentoUtils }

procedure TTest_ArredondamentoUtils.teste_ArredondarInterno_Retorna8CasasHalfEven;
begin
  // 12.34567890123 -> 12.34567890 (8 casas, HALF_EVEN)
  Assert.AreEqual(12.34567890, ArredondamentoUtils.ArredondarInterno(12.34567890123), 0.000000001);
end;

procedure TTest_ArredondamentoUtils.teste_RoundHalfEvenTo8_Retorna8Casas;
begin
  Assert.AreEqual(12.34567890, NumberService.RoundHalfEvenTo8(12.34567890123), 0.000000001);
end;

procedure TTest_ArredondamentoUtils.teste_DividirPorCem_DevolveFracao;
begin
  // 5/100 -> 0.05000000 (divisao inteira devolve fracao)
  Assert.AreEqual(0.05, ArredondamentoUtils.DividirPorCem(5), 0.000000001);
end;

procedure TTest_ArredondamentoUtils.teste_Dividir_DevolveFracao;
begin
  // 1/2 -> 0.50000000
  Assert.AreEqual(0.5, ArredondamentoUtils.Dividir(1, 2), 0.000000001);
end;

procedure TTest_ArredondamentoUtils.teste_Multiplicar_Retorna8Casas;
begin
  Assert.AreEqual(0.3, ArredondamentoUtils.Multiplicar(3, 0.1), 0.000000001);
end;

procedure TTest_ArredondamentoUtils.teste_Subtrair_Retorna8Casas;
begin
  Assert.AreEqual(0.9, ArredondamentoUtils.Subtrair(1, 0.1), 0.000000001);
end;

procedure TTest_ArredondamentoUtils.teste_RoundHalfEven_EmpateArredondaParaPar;
begin
  // Empate exato em .5 arredonda para o par (banker's rounding)
  Assert.AreEqual(2.0, NumberService.RoundHalfEven(2.5, 0), 0.000000001);
  Assert.AreEqual(4.0, NumberService.RoundHalfEven(3.5, 0), 0.000000001);
  Assert.AreEqual(-2.0, NumberService.RoundHalfEven(-2.5, 0), 0.000000001);
  // 0.125 arredondado a 2 casas -> 0.12 (12 e par)
  Assert.AreEqual(0.12, NumberService.RoundHalfEven(0.125, 2), 0.000000001);
end;

procedure TTest_ArredondamentoUtils.teste_Empate8Casas_HalfEvenDivergeDeHalfUp;
begin
  // 0.001953125 = 1/512 (exatamente representavel em binario).
  // Em 8 casas o 9o decimal e 5 (empate); o 8o decimal e 2 (par).
  // HALF_EVEN -> 0.00195312; HALF_UP -> 0.00195313.
  Assert.AreEqual(0.00195312, NumberService.RoundHalfEvenTo8(0.001953125), 0.0000000001);
  Assert.AreEqual(0.00195313, NumberService.RoundHalfUp(0.001953125, 8), 0.0000000001);

  // ArredondarInterno (espelho de ArredondamentoUtils.java) usa HALF_EVEN.
  Assert.AreEqual(0.00195312, ArredondamentoUtils.ArredondarInterno(0.001953125), 0.0000000001);

  // DividirPorCem: 0.1953125 / 100 = 0.001953125 -> HALF_EVEN 0.00195312.
  Assert.AreEqual(0.00195312, ArredondamentoUtils.DividirPorCem(0.1953125), 0.0000000001);
end;

procedure TTest_ArredondamentoUtils.teste_CurrencyNullable_NuloRetornaNuloSemExcecao;
var
  valor: CurrencyNullable;
  resultado: CurrencyNullable;
begin
  valor := CurrencyNullable.NullInstance();

  // Operando nulo nao lanca e devolve null
  resultado := ArredondamentoUtils.DividirPorCem(valor);
  Assert.IsTrue(resultado.IsNull, 'Resultado deve ser null quando o operando e null');

  resultado := ArredondamentoUtils.Multiplicar(valor, CurrencyNullable.Create(2));
  Assert.IsTrue(resultado.IsNull, 'Resultado deve ser null quando qualquer operando e null');

  // Operando nao nulo devolve valor
  valor.SetValue(5);
  resultado := ArredondamentoUtils.DividirPorCem(valor);
  Assert.IsFalse(resultado.IsNull);
  Assert.AreEqual(0.05, resultado.Value, 0.000000001);
end;

procedure TTest_ArredondamentoUtils.teste_DoubleNullable_NuloRetornaNuloSemExcecao;
var
  valor: DoubleNullable;
  resultado: DoubleNullable;
begin
  valor := DoubleNullable.NullInstance();

  resultado := ArredondamentoUtils.DividirPorCem(valor);
  Assert.IsTrue(resultado.IsNull, 'Resultado deve ser null quando o operando e null');

  resultado := ArredondamentoUtils.Dividir(valor, DoubleNullable.Create(2));
  Assert.IsTrue(resultado.IsNull, 'Resultado deve ser null quando qualquer operando e null');

  valor.SetValue(12.34567890123);
  resultado := ArredondamentoUtils.ArredondarInterno(valor);
  Assert.IsFalse(resultado.IsNull);
  Assert.AreEqual(12.34567890, resultado.Value, 0.000000001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_ArredondamentoUtils);

end.
