unit Teste_BaseCalculoService_CalcularISMercadorias;

interface

uses
  DUnitX.TestFramework,
  ICalculoBaseCalculoServiceUnit,
  CalculoBaseCalculoServiceUnit,
  CalcularBaseCalculoModelUnit,
  SysUtils;

type
  [TestFixture]
  TTest_BaseCalculoService_CalcularISMercadorias = class
  private
    FService: ICalculoBaseCalculoService;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_logicaCalculoCorreta;
    [Test]
    procedure teste_baseNegativaLancaExcecao;
    [Test]
    procedure teste_todosCamposZeroRetornaZero;
    [Test]
    procedure teste_camposIndividuaisIntegram;
    [Test]
    procedure teste_bonificacaoReduzBase_Art417;
    [Test]
    procedure teste_devolucaoVendasReduzBase_Art418;
    [Test]
    procedure teste_camposIndividuaisNaoIntegram;
    [Test]
    procedure teste_ano2026_PisCofinsDeduzidos;
    [Test]
    procedure teste_anoAnterior2027_LancaExcecao;
    [Test]
    procedure teste_ano2032_IssDeduzido;
    [Test]
    procedure teste_ano2033_IssLancaExcecao;
    [Test]
    procedure teste_ano2033_IssZeroNaoLancaExcecao;
    [Test]
    procedure teste_icmsNaoIntegraBase_2027;
    [Test]
    procedure teste_icmsNaoIntegraBase_2032;
    [Test]
    procedure teste_ano2033_IcmsLancaExcecao;
    [Test]
    procedure teste_ano2033_IcmsZeroNaoLancaExcecao;
    [Test]
    procedure teste_ano2033_IcmsIssAmbosLancamExcecao;
    [Test]
    procedure teste_icmsComOutrosCamposQueNaoIntegram;
    [Test]
    procedure teste_ano2034_IcmsLancaExcecao;
    [Test]
    procedure teste_mensagemErroOrdenadaAlfabeticamente;
    [Test]
    procedure teste_validacaoAntesDaSoma;
    [Test]
    procedure teste_todosOsCamposDeducaoSimultanea;
  end;

implementation

procedure TTest_BaseCalculoService_CalcularISMercadorias.Setup;
begin
  FService := CalculadorBaseCalculoService.Create;
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_logicaCalculoCorreta;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 1000.00, 50.00, 20.00, 10.00, 30.00, 40.00, 25.00, 15.00, 100.00, 50.00, 0, 0, 20.00, 0);

  // integra = 1000 + 50 + 20 + 10 + 30 + 40 + 25 + 15 = 1190
  // naoIntegra = 100 + 50 + 20 = 170 (em 2027, PIS/COFINS não são deduzidos, ISS é deduzido)
  // base = 1190 - 170 = 1020.00
  Assert.AreEqual(1020.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_baseNegativaLancaExcecao;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 100.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50.00, 60.00);

  Assert.WillRaise(
    procedure
    begin
      FService.CalculaIS(input);
    end,
    Exception,
    'Base de cálculo não pode ser negativa. A soma dos valores que não integram a base é maior que a soma dos valores que integram a base'
  );
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_todosCamposZeroRetornaZero;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(0.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_camposIndividuaisIntegram;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 100.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(100.00, FService.CalculaIS(input), 0.001);

  input := BaseCalculoISMercadoriasModel.Create(2027, 100.00, 0, 0, 0, 0, 25.00, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(125.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_bonificacaoReduzBase_Art417;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150.00, 0);
  Assert.AreEqual(850.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_devolucaoVendasReduzBase_Art418;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 200.00);
  Assert.AreEqual(800.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_camposIndividuaisNaoIntegram;
var
  input: BaseCalculoISMercadoriasModel;
begin
  // IPI
  input := BaseCalculoISMercadoriasModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150.00, 0, 0, 0);
  Assert.AreEqual(850.00, FService.CalculaIS(input), 0.001);

  // DescontoIncondicional
  input := BaseCalculoISMercadoriasModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50.00, 0, 0);
  Assert.AreEqual(950.00, FService.CalculaIS(input), 0.001);

  // Bonificacao e DevolucaoVendas
  input := BaseCalculoISMercadoriasModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100.00, 50.00);
  Assert.AreEqual(850.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.TearDown;
begin
  FService := nil;
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_ano2026_PisCofinsDeduzidos;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 50.00, 30.00, 0, 0, 0, 0);
  // Em 2027, PIS/COFINS não são mais deduzidos, apenas ICMS e ISS
  // base = 1000 - 50 - 30 = 920.00
  Assert.AreEqual(920.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_anoAnterior2027_LancaExcecao;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2026, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.WillRaise(
    procedure begin FService.CalculaIS(input); end,
    Exception,
    'Ano do fato gerador é inferior ao início do Tributo'
  );
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_ano2032_IssDeduzido;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2032, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 50.00, 0, 0, 0, 0);
  Assert.AreEqual(950.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_ano2033_IssLancaExcecao;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 50.00, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIS(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_ano2033_IssZeroNaoLancaExcecao;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(1000.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_icmsNaoIntegraBase_2027;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 180.00, 0, 0, 0, 0, 0);
  Assert.AreEqual(820.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_icmsNaoIntegraBase_2032;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2032, 1000.00, 0, 0, 0, 0, 0, 0, 0, 120.00, 50.00, 0, 0, 0, 0);
  Assert.AreEqual(830.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_ano2033_IcmsLancaExcecao;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 100.00, 0, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIS(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_ano2033_IcmsZeroNaoLancaExcecao;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(1000.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_ano2033_IcmsIssAmbosLancamExcecao;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 100.00, 50.00, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIS(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_icmsComOutrosCamposQueNaoIntegram;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 100.00, 0, 50.00, 20.00, 0, 0);
  // naoIntegra = 100 + 50 + 20 = 170
  // base = 1000 - 170 = 830.00
  Assert.AreEqual(830.00, FService.CalculaIS(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_ano2034_IcmsLancaExcecao;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2034, 1000.00, 0, 0, 0, 0, 0, 0, 0, 50.00, 0, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIS(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_mensagemErroOrdenadaAlfabeticamente;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 100.00, 50.00, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIS(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_validacaoAntesDaSoma;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 100.00, 0, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIS(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularISMercadorias.teste_todosOsCamposDeducaoSimultanea;
var
  input: BaseCalculoISMercadoriasModel;
begin
  input := BaseCalculoISMercadoriasModel.Create(2027, 2000.00, 0, 0, 0, 0, 0, 0, 0, 100.00, 50.00, 150.00, 30.00, 20.00, 40.00);
  // Todos os campos não integram: 100 + 50 + 150 + 30 + 20 + 40 = 390
  // base = 2000 - 390 = 1610.00
  Assert.AreEqual(1610.00, FService.CalculaIS(input), 0.001);
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_BaseCalculoService_CalcularISMercadorias);

end.
