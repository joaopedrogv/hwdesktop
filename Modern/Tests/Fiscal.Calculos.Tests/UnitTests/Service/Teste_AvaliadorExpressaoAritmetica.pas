unit Teste_AvaliadorExpressaoAritmetica;

interface

uses
  DUnitX.TestFramework,
  AvaliadorExpressaoAritmeticaServiceUnit,
  IAvaliadorExpressaoAritmeticaServiceUnit;

type
  [TestFixture]
  TTest_AvaliadorExpressaoAritmetica = class
  private
    FAvaliador: IAvaliadorExpressaoAritmeticaService;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_VariavelUnica_RetornaValorBruto;

    [Test]
    procedure teste_ExpressaoComposta_Arredonda8CasasHalfEven;

    [Test]
    procedure teste_ScaleIgnorado_ResultadoIndependenteDeScale;

    [Test]
    procedure teste_ExpressaoComposta_Empate8Casas_UsaHalfEven;
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

procedure TTest_AvaliadorExpressaoAritmetica.teste_VariavelUnica_RetornaValorBruto;
var
  vars: VariaveisAvaliador;
begin
  // Variavel unica deve retornar o valor bruto, sem arredondamento (mesmo com Scale=2)
  vars := VariaveisAvaliadorBuilder.Create()
    .Aliquota(0.123456789)
    .BaseCalculoInformada(100.123456789)
    .Quantidade(7.123456789)
    .TributoCalculado(50.123456789)
    .AliquotaAdRemPrincipal(0.987654321)
    .AliquotaAdRemSecundaria(0.111111111)
    .Build();

  Assert.AreEqual(0.123456789,  FAvaliador.Evaluate('aliquota', vars, 2), 0.000000001);
  Assert.AreEqual(100.123456789, FAvaliador.Evaluate('baseCalculoInformada', vars, 2), 0.000000001);
  Assert.AreEqual(7.123456789, FAvaliador.Evaluate('quantidade', vars, 2), 0.000000001);
  Assert.AreEqual(50.123456789, FAvaliador.Evaluate('tributoCalculado', vars, 2), 0.000000001);
  Assert.AreEqual(0.987654321, FAvaliador.Evaluate('aliquotaAdRemPrincipal', vars, 2), 0.000000001);
  Assert.AreEqual(0.111111111, FAvaliador.Evaluate('aliquotaAdRemSecundaria', vars, 2), 0.000000001);
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_ExpressaoComposta_Arredonda8CasasHalfEven;
var
  vars: VariaveisAvaliador;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .Aliquota(0.25)
    .PercentualReducao(0.1)
    .Build();
  Assert.AreEqual(0.225, FAvaliador.Evaluate('aliquota*(1-percentualReducao)', vars, 2), 0.000000001);

  // Resultado com mais de 2 casas e preservado internamente com 8 casas/HALF_EVEN,
  // nao truncado para 2/4 casas.
  vars := VariaveisAvaliadorBuilder.Create()
    .BaseCalculo(12.34567890123)
    .AliquotaEfetiva(1)
    .Build();
  Assert.AreEqual(12.34567890, FAvaliador.Evaluate('baseCalculo*aliquotaEfetiva', vars, 2), 0.000000001);
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_ScaleIgnorado_ResultadoIndependenteDeScale;
var
  vars: VariaveisAvaliador;
begin
  vars := VariaveisAvaliadorBuilder.Create()
    .BaseCalculo(100.12345678)
    .AliquotaEfetiva(0.33333333)
    .Build();

  Assert.AreEqual(
    FAvaliador.Evaluate('baseCalculo*aliquotaEfetiva', vars, 2),
    FAvaliador.Evaluate('baseCalculo*aliquotaEfetiva', vars, 4),
    0.000000001
  );
  Assert.AreEqual(
    FAvaliador.Evaluate('baseCalculo*aliquotaEfetiva', vars, 4),
    FAvaliador.Evaluate('baseCalculo*aliquotaEfetiva', vars, 8),
    0.000000001
  );
end;

procedure TTest_AvaliadorExpressaoAritmetica.teste_ExpressaoComposta_Empate8Casas_UsaHalfEven;
var
  vars: VariaveisAvaliador;
begin
  // Produto baseCalculo*aliquotaEfetiva = 0.001953125 (9o decimal = 5, empate;
  // 8o decimal = 2, par). HALF_EVEN -> 0.00195312; HALF_UP -> 0.00195313.
  // Avaliador usa ArredondarInterno (HALF_EVEN) em expressoes compostas.
  vars := VariaveisAvaliadorBuilder.Create()
    .BaseCalculo(0.001953125)
    .AliquotaEfetiva(1)
    .Build();

  Assert.AreEqual(0.00195312, FAvaliador.Evaluate('baseCalculo*aliquotaEfetiva', vars, 2), 0.0000000001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_AvaliadorExpressaoAritmetica);

end.
