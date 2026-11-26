unit Teste_AvaliadorExpressaoAritmetica;

interface

uses
  DUnitX.TestFramework,
  AvaliadorExpressaoAritmeticaServiceUnit,
  IAvaliadorExpressaoAritmeticaServiceUnit,
  DecimalCalculoUnit;

type
  [TestFixture]
  TTest_AvaliadorExpressaoAritmetica = class
  private
    FAvaliador: IAvaliadorExpressaoAritmeticaService;
    function AvaliarMonofasica(const Expressao: string;
      Quantidade: Double): DecimalCalculo;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_VariavelUnica_RetornaValorExato;

    [Test]
    procedure teste_ExpressaoComposta_ContaExata;

    [Test]
    procedure teste_MultiplicacaoExata_22Casas;

    [Test]
    procedure teste_AliquotaReduzida_ContaExata;

    [Test]
    procedure teste_AliquotaEfetiva_ComRedutorCompraGov;

    [Test]
    procedure teste_DivisaoUmTerco_34Digitos;

    [Test]
    procedure teste_DivisaoPorZero_LevantaEDecimalCalculo;

    [Test]
    procedure teste_FormulaMonofasica_Escala44Aceita;

    [Test]
    procedure teste_FormulaMonofasica1_Quantidade2Casas;

    [Test]
    procedure teste_FormulaMonofasica1_Quantidade4Casas;

    [Test]
    procedure teste_FormulaMonofasica1_Quantidade6Casas;

    [Test]
    procedure teste_FormulaMonofasica2_Quantidade2Casas;

    [Test]
    procedure teste_FormulaMonofasica2_Quantidade4Casas;

    [Test]
    procedure teste_FormulaMonofasica2_Quantidade6Casas;
  end;

implementation

{ TTest_AvaliadorExpressaoAritmetica }

procedure TTest_AvaliadorExpressaoAritmetica.Setup;
begin
  FAvaliador := AvaliadorExpressaoAritmeticaService.Create();
end;

procedure TTest_AvaliadorExpressaoAritmetica.TearDown;
begin
  FAvaliador := nil;
end;

function TTest_AvaliadorExpressaoAritmetica.AvaliarMonofasica(
  const Expressao: string; Quantidade: Double): DecimalCalculo;
var
  vars: VariaveisAvaliador;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .VariacaoPontoPercentual(5)
    .PBio(0.30)
    .Quantidade(Quantidade)
    .AliquotaAdRemSecundaria(0.1922)
    .Build();
  Result := FAvaliador.Evaluate(Expressao, vars);
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_VariavelUnica_RetornaValorExato;
var
  vars: VariaveisAvaliador;
  resultado: DecimalCalculo;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .Aliquota(0.123456789)
    .BaseCalculoInformada(100.123456789)
    .Quantidade(7.123456789)
    .TributoCalculado(50.123456789)
    .AliquotaAdRemPrincipal(0.987654321)
    .AliquotaAdRemSecundaria(0.111111111)
    .Build();

  resultado := FAvaliador.Evaluate('aliquota', vars);
  Assert.AreEqual('0.123456789', resultado.ParaTexto(9));

  resultado := FAvaliador.Evaluate('baseCalculoInformada', vars);
  Assert.AreEqual('100.123456789', resultado.ParaTexto(9));

  resultado := FAvaliador.Evaluate('quantidade', vars);
  Assert.AreEqual('7.123456789', resultado.ParaTexto(9));

  resultado := FAvaliador.Evaluate('tributoCalculado', vars);
  Assert.AreEqual('50.123456789', resultado.ParaTexto(9));

  resultado := FAvaliador.Evaluate('aliquotaAdRemPrincipal', vars);
  Assert.AreEqual('0.987654321', resultado.ParaTexto(9));

  resultado := FAvaliador.Evaluate('aliquotaAdRemSecundaria', vars);
  Assert.AreEqual('0.111111111', resultado.ParaTexto(9));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_ExpressaoComposta_ContaExata;
var
  vars: VariaveisAvaliador;
  resultado: DecimalCalculo;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .BaseCalculo(12.34567890123)
    .AliquotaEfetiva(1)
    .Build();

  resultado := FAvaliador.Evaluate('baseCalculo*aliquotaEfetiva', vars);
  Assert.AreEqual('12.34567890123', resultado.ParaTexto(11));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_MultiplicacaoExata_22Casas;
var
  vars: VariaveisAvaliador;
  resultado: DecimalCalculo;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .BaseCalculo(0.12345678901)
    .AliquotaEfetiva(0.10987654321)
    .Build();

  resultado := FAvaliador.Evaluate('baseCalculo*aliquotaEfetiva', vars);
  Assert.AreEqual('0.0135650052122251181221', resultado.ParaTexto(22));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_AliquotaReduzida_ContaExata;
var
  vars: VariaveisAvaliador;
  resultado: DecimalCalculo;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .Aliquota(0.088123)
    .PercentualReducao(0.60)
    .Build();

  resultado := FAvaliador.Evaluate('aliquota*(1-percentualReducao)', vars);
  Assert.AreEqual('0.0352492', resultado.ParaTexto(7));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_AliquotaEfetiva_ComRedutorCompraGov;
var
  vars: VariaveisAvaliador;
  resultado: DecimalCalculo;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .Aliquota(0.088123)
    .PercentualReducao(0.60)
    .PRedutorCompraGov(15)
    .Build();

  resultado := FAvaliador.Evaluate(
    'aliquota*(1-percentualReducao)*(1-pRedutorCompraGov/100)', vars);
  Assert.AreEqual('0.02996182', resultado.ParaTexto(8));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_DivisaoUmTerco_34Digitos;
var
  vars: VariaveisAvaliador;
  resultado: DecimalCalculo;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .PBio(0.25)
    .Quantidade(1)
    .AliquotaAdRemSecundaria(1)
    .Build();

  resultado := FAvaliador.Evaluate('(pBio/(1-pBio))*quantidade*aliquotaAdRemSecundaria', vars);
  Assert.AreEqual(34, Integer(resultado.Escala));
  Assert.AreEqual('0.3333333333333333333333333333333333', resultado.ParaTexto(34));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_DivisaoPorZero_LevantaEDecimalCalculo;
var
  vars: VariaveisAvaliador;
  resultado: DecimalCalculo;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .PBio(1)
    .Quantidade(1)
    .AliquotaAdRemSecundaria(1)
    .Build();

  Assert.WillRaise(
    procedure
    begin
      resultado := FAvaliador.Evaluate(
        '(pBio/(1-pBio))*quantidade*aliquotaAdRemSecundaria', vars);
    end,
    EDecimalCalculo);
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_FormulaMonofasica_Escala44Aceita;
var
  vars: VariaveisAvaliador;
  resultado: DecimalCalculo;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .PBio(0.3)
    .Quantidade(1.2345)
    .AliquotaAdRemSecundaria(0.0123456)
    .Build();

  resultado := FAvaliador.Evaluate('(pBio/(1-pBio))*quantidade*aliquotaAdRemSecundaria', vars);
  Assert.AreEqual(44, Integer(resultado.Escala));
  Assert.AreEqual('0.00653170422857142857142857142857142900687552', resultado.ParaTexto(44));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_FormulaMonofasica1_Quantidade2Casas;
var
  resultado: DecimalCalculo;
begin
  resultado := AvaliarMonofasica(
    '(variacaoPontoPercentual/100)*quantidade*(pBio/(1-pBio))*aliquotaAdRemSecundaria',
    1.23);
  Assert.AreEqual(41, Integer(resultado.Escala));
  Assert.AreEqual('0.00506584285714285714285714285714285748058', resultado.ParaTexto(41));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_FormulaMonofasica1_Quantidade4Casas;
var
  resultado: DecimalCalculo;
begin
  resultado := AvaliarMonofasica(
    '(variacaoPontoPercentual/100)*quantidade*(pBio/(1-pBio))*aliquotaAdRemSecundaria',
    1.2345);
  Assert.AreEqual(42, Integer(resultado.Escala));
  Assert.AreEqual('0.005084376428571428571428571428571428910387', resultado.ParaTexto(42));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_FormulaMonofasica1_Quantidade6Casas;
var
  resultado: DecimalCalculo;
begin
  resultado := AvaliarMonofasica(
    '(variacaoPontoPercentual/100)*quantidade*(pBio/(1-pBio))*aliquotaAdRemSecundaria',
    1.234567);
  Assert.AreEqual(45, Integer(resultado.Escala));
  Assert.AreEqual('0.005084652372857142857142857142857143196119682', resultado.ParaTexto(45));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_FormulaMonofasica2_Quantidade2Casas;
var
  resultado: DecimalCalculo;
begin
  resultado := AvaliarMonofasica(
    '(pBio/(1-pBio))*quantidade*aliquotaAdRemSecundaria', 1.23);
  Assert.AreEqual(40, Integer(resultado.Escala));
  Assert.AreEqual('0.1013168571428571428571428571428571496116', resultado.ParaTexto(40));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_FormulaMonofasica2_Quantidade4Casas;
var
  resultado: DecimalCalculo;
begin
  resultado := AvaliarMonofasica(
    '(pBio/(1-pBio))*quantidade*aliquotaAdRemSecundaria', 1.2345);
  Assert.AreEqual(41, Integer(resultado.Escala));
  Assert.AreEqual('0.10168752857142857142857142857142857820774', resultado.ParaTexto(41));
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_FormulaMonofasica2_Quantidade6Casas;
var
  resultado: DecimalCalculo;
begin
  resultado := AvaliarMonofasica(
    '(pBio/(1-pBio))*quantidade*aliquotaAdRemSecundaria', 1.234567);
  Assert.AreEqual(44, Integer(resultado.Escala));
  Assert.AreEqual('0.10169304745714285714285714285714286392239364', resultado.ParaTexto(44));
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_AvaliadorExpressaoAritmetica);

end.
