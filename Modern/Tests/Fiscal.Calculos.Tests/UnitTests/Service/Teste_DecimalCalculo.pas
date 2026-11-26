unit Teste_DecimalCalculo;

interface

uses
  DUnitX.TestFramework,
  DecimalCalculoUnit,
  ArredondamentoCalculoUnit;

type
  [TestFixture]
  TTest_DecimalCalculo = class
  public
    [Test] procedure teste_Caso1_1_ValorFiscal_2_005;
    [Test] procedure teste_Caso1_2_ValorFiscal_2_015;
    [Test] procedure teste_Caso1_3_ValorFiscal_10_005;
    [Test] procedure teste_Caso1_4_ValorFiscal_954_505;
    [Test] procedure teste_Caso1_5_ValorFiscal_1e12_455;

    [Test] procedure teste_Caso2_1_AliquotaPublicada_0_12345;
    [Test] procedure teste_Caso2_2_AliquotaPublicada_0_12355;
    [Test] procedure teste_Caso2_3_AliquotaPublicada_Produto;
    [Test] procedure teste_Caso2_4_AliquotaPublicada_8_8;

    [Test] procedure teste_Caso3_1_BaseVezesPercentual;
    [Test] procedure teste_Caso3_2_BaseVezesFatorVezesPercentual;

    [Test] procedure teste_Caso4_1_MultiplicacaoExata26Casas;
    [Test] procedure teste_Caso4_2_SubtracaoExata;
    [Test] procedure teste_Caso4_3_Totalizar;
    [Test] procedure teste_Caso4_4_Divisao34Digitos;

    [Test] procedure teste_Caso5_1_PercentualParaFracao;
    [Test] procedure teste_Caso5_2_ConversaoRoundTrip;

    [Test] procedure teste_Caso12_1_EscalaDivisaoUmTerco;
    [Test] procedure teste_Caso12_2_EscalaDivisao0_0001;

    [Test] procedure teste_ComparacaoExataIgnoraEscala;
    [Test] procedure teste_DeCurrencyPreservaValor;
    [Test] procedure teste_DeDoubleValorExato;
    [Test] procedure teste_DeDouble_2_015_RepresentacaoCurta;
    [Test] procedure teste_DeDouble_NaoDependeDoSeparadorGlobal;
    [Test] procedure teste_ParaDouble_NaoDependeDoSeparadorGlobal;

    [Test] procedure teste_FalhaExplicita_EscalaAcimaDe48;
    [Test] procedure teste_FalhaExplicita_DigitosAcimaDe64;
    [Test] procedure teste_FalhaExplicita_OverflowNaSoma;
    [Test] procedure teste_FalhaExplicita_EscalaNaMultiplicacao;
    [Test] procedure teste_FalhaExplicita_DivisaoPorZero;
    [Test] procedure teste_FalhaExplicita_DivisaoAcimaDe48Casas;
    [Test] procedure teste_Limite48CasasAceitoSemTruncar;
    [Test] procedure teste_Limite64DigitosAceitoSemTruncar;
    [Test] procedure teste_Limite48CasasComMagnitudeAlta;
    [Test] procedure teste_Caso1_6_ValorFiscal_NegativoEmpatePar;
  end;

implementation

uses
  SysUtils;

const
  CBS_INTEGRAL = '1.6839379378389463610262954';

function Dec(const ATexto: string): DecimalCalculo;
begin
  Result := DecimalCalculo.DeTexto(ATexto);
end;

function PercentualParaFracao(const ATexto: string): DecimalCalculo;
begin
  Result := ArredondamentoCalculo.PercentualParaFracao(Dec(ATexto));
end;

function TextoValorFiscal(const ATexto: string): string;
var
  valor: DecimalCalculo;
begin
  valor := Dec(ATexto);
  valor := ArredondamentoCalculo.ValorFiscal(valor);
  Result := valor.ParaTexto(2);
end;

function TextoAliquotaPublicada(const ATexto: string): string;
var
  valor: DecimalCalculo;
begin
  valor := Dec(ATexto);
  valor := ArredondamentoCalculo.AliquotaPublicada(valor);
  Result := valor.ParaTexto(4);
end;

function TextoAliquotaPublicadaDoProduto(const A, B: string): string;
var
  valor: DecimalCalculo;
begin
  valor := Dec(A);
  valor := valor.Multiplicar(Dec(B));
  valor := ArredondamentoCalculo.AliquotaPublicada(valor);
  Result := valor.ParaTexto(4);
end;

function TextoValorFiscalDoProdutoPercentual(const ABase, APercentual: string): string;
var
  valor: DecimalCalculo;
begin
  valor := Dec(ABase);
  valor := valor.Multiplicar(PercentualParaFracao(APercentual));
  valor := ArredondamentoCalculo.ValorFiscal(valor);
  Result := valor.ParaTexto(2);
end;

function TextoValorFiscalDoCaso3_2: string;
var
  valor: DecimalCalculo;
begin
  valor := Dec('32902.73');
  valor := valor.Multiplicar(Dec('0.5'));
  valor := valor.Multiplicar(PercentualParaFracao('1.3663'));
  valor := ArredondamentoCalculo.ValorFiscal(valor);
  Result := valor.ParaTexto(2);
end;

{ TTest_DecimalCalculo }

procedure TTest_DecimalCalculo.teste_Caso1_1_ValorFiscal_2_005;
begin
  Assert.AreEqual('2.00', TextoValorFiscal('2.005'));
end;

procedure TTest_DecimalCalculo.teste_Caso1_2_ValorFiscal_2_015;
begin
  Assert.AreEqual('2.02', TextoValorFiscal('2.015'));
end;

procedure TTest_DecimalCalculo.teste_Caso1_3_ValorFiscal_10_005;
begin
  Assert.AreEqual('10.00', TextoValorFiscal('10.005'));
end;

procedure TTest_DecimalCalculo.teste_Caso1_4_ValorFiscal_954_505;
begin
  Assert.AreEqual('954.50', TextoValorFiscal('954.505'));
end;

procedure TTest_DecimalCalculo.teste_Caso1_5_ValorFiscal_1e12_455;
begin
  Assert.AreEqual('1234567890123.46', TextoValorFiscal('1234567890123.455'));
end;

procedure TTest_DecimalCalculo.teste_Caso1_6_ValorFiscal_NegativoEmpatePar;
begin
  Assert.AreEqual('0.00', TextoValorFiscal('-0.005'));
  Assert.AreEqual('-0.02', TextoValorFiscal('-0.015'));
end;

procedure TTest_DecimalCalculo.teste_Caso2_1_AliquotaPublicada_0_12345;
begin
  Assert.AreEqual('0.1234', TextoAliquotaPublicada('0.12345'));
end;

procedure TTest_DecimalCalculo.teste_Caso2_2_AliquotaPublicada_0_12355;
begin
  Assert.AreEqual('0.1236', TextoAliquotaPublicada('0.12355'));
end;

procedure TTest_DecimalCalculo.teste_Caso2_3_AliquotaPublicada_Produto;
begin
  Assert.AreEqual('3.5249', TextoAliquotaPublicadaDoProduto('8.8123', '0.4'));
end;

procedure TTest_DecimalCalculo.teste_Caso2_4_AliquotaPublicada_8_8;
begin
  Assert.AreEqual('8.8000', TextoAliquotaPublicada('8.8'));
end;

procedure TTest_DecimalCalculo.teste_Caso3_1_BaseVezesPercentual;
begin
  Assert.AreEqual('16631.49',
    TextoValorFiscalDoProdutoPercentual('987654.32', CBS_INTEGRAL));
end;

procedure TTest_DecimalCalculo.teste_Caso3_2_BaseVezesFatorVezesPercentual;
begin
  Assert.AreEqual('224.77', TextoValorFiscalDoCaso3_2);
end;

procedure TTest_DecimalCalculo.teste_Caso4_1_MultiplicacaoExata26Casas;
var
  valor: DecimalCalculo;
begin
  valor := Dec('0.9');
  valor := valor.Multiplicar(Dec(CBS_INTEGRAL));
  Assert.AreEqual('1.51554414405505172492366586', valor.ParaTexto(26));
end;

procedure TTest_DecimalCalculo.teste_Caso4_2_SubtracaoExata;
var
  valor: DecimalCalculo;
begin
  valor := Dec('1');
  valor := valor.Subtrair(Dec('0.10'));
  Assert.AreEqual('0.90', valor.ParaTexto(2));
end;

procedure TTest_DecimalCalculo.teste_Caso4_3_Totalizar;
var
  valores: array[0..1] of DecimalCalculo;
  total: DecimalCalculo;
begin
  valores[0] := Dec('2.00');
  valores[1] := Dec('4.41');
  total := ArredondamentoCalculo.Totalizar(valores);
  Assert.AreEqual('6.41', total.ParaTexto(2));
end;

procedure TTest_DecimalCalculo.teste_Caso4_4_Divisao34Digitos;
var
  valor: DecimalCalculo;
begin
  valor := Dec('1');
  valor := valor.Dividir(Dec('3'));
  Assert.AreEqual('0.3333333333333333333333333333333333', valor.ParaTexto(34));
end;

procedure TTest_DecimalCalculo.teste_Caso5_1_PercentualParaFracao;
var
  valor: DecimalCalculo;
begin
  valor := PercentualParaFracao(CBS_INTEGRAL);
  Assert.AreEqual('0.016839379378389463610262954', valor.ParaTexto(27));
end;

procedure TTest_DecimalCalculo.teste_Caso5_2_ConversaoRoundTrip;
var
  valor: DecimalCalculo;
begin
  valor := PercentualParaFracao(CBS_INTEGRAL);
  valor := ArredondamentoCalculo.FracaoParaPercentual(valor);
  Assert.AreEqual(CBS_INTEGRAL, valor.ParaTexto(25));
end;

procedure TTest_DecimalCalculo.teste_Caso12_1_EscalaDivisaoUmTerco;
var
  valor: DecimalCalculo;
begin
  valor := Dec('1');
  valor := valor.Dividir(Dec('3'));
  Assert.AreEqual(34, Integer(valor.Escala));
end;

procedure TTest_DecimalCalculo.teste_Caso12_2_EscalaDivisao0_0001;
var
  valor: DecimalCalculo;
begin
  valor := Dec('0.0001');
  valor := valor.Dividir(Dec('3'));
  Assert.AreEqual(38, Integer(valor.Escala));
end;

procedure TTest_DecimalCalculo.teste_ComparacaoExataIgnoraEscala;
begin
  Assert.AreEqual(0, Dec('1.0').Comparar(Dec('1.000')));
  Assert.IsTrue(Dec('0.10').MenorQue(Dec('0.2')));
  Assert.IsTrue(Dec('-0.10').MaiorQue(Dec('-0.2')));
end;

procedure TTest_DecimalCalculo.teste_DeCurrencyPreservaValor;
var
  valor: DecimalCalculo;
begin
  valor := DecimalCalculo.DeCurrency(1234.5678);
  Assert.AreEqual('1234.5678', valor.ParaTexto(4));
end;

procedure TTest_DecimalCalculo.teste_DeDoubleValorExato;
var
  valor: DecimalCalculo;
begin
  valor := DecimalCalculo.DeDouble(0.5);
  Assert.AreEqual('0.5', valor.ParaTexto(1));
end;

procedure TTest_DecimalCalculo.teste_DeDouble_2_015_RepresentacaoCurta;
var
  valor: DecimalCalculo;
begin
  valor := DecimalCalculo.DeDouble(2.015);
  valor := ArredondamentoCalculo.ValorFiscal(valor);
  Assert.AreEqual('2.02', valor.ParaTexto(2));
end;

procedure TTest_DecimalCalculo.teste_DeDouble_NaoDependeDoSeparadorGlobal;
var
  valor: DecimalCalculo;
  separadorAnterior: Char;
begin
  separadorAnterior := FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator := ',';
  try
    valor := DecimalCalculo.DeDouble(2.015);
    valor := ArredondamentoCalculo.ValorFiscal(valor);
    Assert.AreEqual('2.02', valor.ParaTexto(2));
    Assert.AreEqual(',', FormatSettings.DecimalSeparator);
  finally
    FormatSettings.DecimalSeparator := separadorAnterior;
  end;
end;

procedure TTest_DecimalCalculo.teste_ParaDouble_NaoDependeDoSeparadorGlobal;
var
  valor: DecimalCalculo;
  convertido: Double;
  separadorAnterior: Char;
begin
  valor := Dec('2.015');
  separadorAnterior := FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator := ',';
  try
    convertido := valor.ParaDouble;
    Assert.AreEqual(2.015, convertido, 0.0000001);
    Assert.AreEqual(',', FormatSettings.DecimalSeparator);
  finally
    FormatSettings.DecimalSeparator := separadorAnterior;
  end;
end;

procedure TTest_DecimalCalculo.teste_FalhaExplicita_EscalaAcimaDe48;
begin
  Assert.WillRaise(
    procedure
    begin
      DecimalCalculo.DeTexto('0.' + StringOfChar('1', 49));
    end,
    EDecimalCalculo);
end;

procedure TTest_DecimalCalculo.teste_FalhaExplicita_DigitosAcimaDe64;
begin
  Assert.WillRaise(
    procedure
    begin
      DecimalCalculo.DeTexto(StringOfChar('9', 65));
    end,
    EDecimalCalculo);
end;

procedure TTest_DecimalCalculo.teste_FalhaExplicita_OverflowNaSoma;
var
  valor: DecimalCalculo;
begin
  valor := Dec(StringOfChar('9', 64));
  Assert.WillRaise(
    procedure
    begin
      valor.Somar(Dec('1'));
    end,
    EDecimalCalculo);
end;

procedure TTest_DecimalCalculo.teste_FalhaExplicita_EscalaNaMultiplicacao;
var
  a, b: DecimalCalculo;
begin
  a := Dec('0.' + StringOfChar('1', 25));
  b := Dec('0.' + StringOfChar('1', 24));
  Assert.WillRaise(
    procedure
    begin
      a.Multiplicar(b);
    end,
    EDecimalCalculo);
end;

procedure TTest_DecimalCalculo.teste_FalhaExplicita_DivisaoPorZero;
var
  valor: DecimalCalculo;
begin
  valor := Dec('1');
  Assert.WillRaise(
    procedure
    begin
      valor.Dividir(Dec('0'));
    end,
    EDecimalCalculo);
end;

procedure TTest_DecimalCalculo.teste_FalhaExplicita_DivisaoAcimaDe48Casas;
var
  valor: DecimalCalculo;
begin
  valor := Dec('0.' + StringOfChar('0', 15) + '1');
  Assert.WillRaise(
    procedure
    begin
      valor.Dividir(Dec('3'));
    end,
    EDecimalCalculo);
end;

procedure TTest_DecimalCalculo.teste_Limite48CasasAceitoSemTruncar;
var
  valor: DecimalCalculo;
  texto: string;
begin
  texto := '0.' + StringOfChar('1', 48);
  valor := DecimalCalculo.DeTexto(texto);
  Assert.AreEqual(48, Integer(valor.Escala));
  Assert.AreEqual(texto, valor.ParaTexto(48));
end;

procedure TTest_DecimalCalculo.teste_Limite64DigitosAceitoSemTruncar;
var
  valor: DecimalCalculo;
  texto: string;
begin
  texto := StringOfChar('9', 64);
  valor := DecimalCalculo.DeTexto(texto);
  Assert.AreEqual(texto, valor.ParaTexto(0));
end;

procedure TTest_DecimalCalculo.teste_Limite48CasasComMagnitudeAlta;
var
  valor: DecimalCalculo;
  texto: string;
begin
  texto := '1234567890123456.' + StringOfChar('1', 48);
  valor := DecimalCalculo.DeTexto(texto);
  Assert.AreEqual(48, Integer(valor.Escala));
  Assert.AreEqual(texto, valor.ParaTexto(48));
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_DecimalCalculo);

end.
