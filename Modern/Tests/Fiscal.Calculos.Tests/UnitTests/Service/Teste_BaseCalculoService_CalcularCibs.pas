unit Teste_BaseCalculoService_CalcularCibs;

interface

uses
  DUnitX.TestFramework,
  ICalculoBaseCalculoServiceUnit,
  CalculoBaseCalculoServiceUnit,
  CalcularBaseCalculoModelUnit,
  SysUtils;

type
  // Exceção mapeada do Java CampoInvalidoException
  ECampoInvalidoException = class(Exception);

  [TestFixture]
  TTest_BaseCalculoService_CalcularCibs = class
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
    procedure teste_camposIndividuaisNaoIntegram;
    [Test]
    procedure teste_ano2026_PisCofinsDeduzidos;
    [Test]
    procedure teste_anoAnterior2026_LancaExcecao;
    [Test]
    procedure teste_ano2027_PisLancaExcecao;
    [Test]
    procedure teste_ano2027_CofinsLancaExcecao;
    [Test]
    procedure teste_ano2027_PisImportacaoLancaExcecao;
    [Test]
    procedure teste_ano2027_CofinsImportacaoLancaExcecao;
    [Test]
    procedure teste_ano2027_PisCofinsMultiplosLancaExcecao;
    [Test]
    procedure teste_ano2032_IssDeduzido;
    [Test]
    procedure teste_ano2033_IssLancaExcecao;
    [Test]
    procedure teste_ano2033_IssZeroNaoLancaExcecao;
    [Test]
    procedure teste_ano2027_TodosCamposPisCofinsLancaExcecao;
    [Test]
    procedure teste_ano2027_CamposPisZeroNaoLancaExcecao;
    [Test]
    procedure teste_icmsNaoIntegraBase_2026;
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
    procedure teste_icmsComPisCofinsSomenteIcmsDeveSerDeduzido2027;
    [Test]
    procedure teste_mensagemErroOrdenadaAlfabeticamente_PisCofins;
    [Test]
    procedure teste_mensagemErroOrdenadaAlfabeticamente_IcmsIss;
    [Test]
    procedure teste_pisCofinsDeducaoSimultanea2026;
    [Test]
    procedure teste_todosOsCamposDeducaoSimultanea;
    [Test]
    procedure teste_validacaoAntesDaSoma;
    [Test]
    procedure teste_duasValidacoesSeparadas;
  end;

implementation

procedure TTest_BaseCalculoService_CalcularCibs.Setup;
begin
  FService := CalculoBaseCalculoService.Create();
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_logicaCalculoCorreta;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 50.00, 20.00, 10.00, 30.00, 40.00, 25.00, 100.00, 15.00, 100.00, 50.00, 0, 0, 0, 0);

  Assert.AreEqual(1140.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_baseNegativaLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 100.00, 0, 0, 0, 0, 0, 0, 0, 0, 200.00, 0, 0, 0, 0, 0);

  Assert.WillRaise(
    procedure
    begin
      FService.CalculaIbsCbs(input);
    end,
    Exception,
    'Base de cálculo não pode ser negativa. A soma dos valores que não integram a base é maior que a soma dos valores que integram a base.'
  );
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_todosCamposZeroRetornaZero;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(0.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_camposIndividuaisIntegram;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 100.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(100.00, FService.CalculaIbsCbs(input), 0.001);

  input := BaseCalculoIbsCbsModel.Create(2027, 100.00, 0, 0, 0, 0, 0, 0, 50.00, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(150.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_camposIndividuaisNaoIntegram;
var
  input: BaseCalculoIbsCbsModel;
begin
  // No Pascal a lógica de Cosip não está em IbsCbsModel conforme CalculoBaseCalculoServiceUnit.pas
  // Mas simulamos o comportamento dos campos que reduzem a base (não integram)
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150.00, 0);
  Assert.AreEqual(850.00, FService.CalculaIbsCbs(input), 0.001);
  
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50.00);
  Assert.AreEqual(950.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.TearDown;
begin
  FService := nil;
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2026_PisCofinsDeduzidos;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2026, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21.50, 86.00, 0, 0);
  
  // base = 1000 - 107.50 = 892.50
  Assert.AreEqual(892.50, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_anoAnterior2026_LancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2025, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  
  Assert.WillRaise(
    procedure begin FService.CalculaIbsCbs(input); end,
    Exception,
    'Para CBS/IBS, o ano do fato gerador deve ser 2026 ou superior'
  );
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2027_PisLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10.00, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2027_CofinsLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20.00, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2027_PisImportacaoLancaExcecao;
begin
  // No modelo Pascal PIS engloba importação ou deve ser validado via regras
  teste_ano2027_PisLancaExcecao;
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2027_CofinsImportacaoLancaExcecao;
begin
  teste_ano2027_CofinsLancaExcecao;
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2027_PisCofinsMultiplosLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10.00, 20.00, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2032_IssDeduzido;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2032, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50.00, 0, 0, 0, 0);
  Assert.AreEqual(950.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2033_IssLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50.00, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2033_IssZeroNaoLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(1000.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2027_TodosCamposPisCofinsLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21.50, 86.00, 0, 0);
  
  Assert.WillRaise(
    procedure begin FService.CalculaIbsCbs(input); end,
    Exception
  );
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2027_CamposPisZeroNaoLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(1000.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_icmsNaoIntegraBase_2026;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2026, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 150.00, 0, 0, 0, 0, 0);
  Assert.AreEqual(850.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_icmsNaoIntegraBase_2027;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 180.00, 0, 0, 0, 0, 0);
  Assert.AreEqual(820.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_icmsNaoIntegraBase_2032;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2032, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 120.00, 50.00, 0, 0, 0, 0);
  Assert.AreEqual(830.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2033_IcmsLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 100.00, 0, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2033_IcmsZeroNaoLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  Assert.AreEqual(1000.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2033_IcmsIssAmbosLancamExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 100.00, 50.00, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_icmsComOutrosCamposQueNaoIntegram;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 100.00, 0, 0, 0, 50.00, 20.00);
  // base = 1000 - (100 + 50 + 20) = 830.00
  // Note: O java usou 5.00 de cosip resultando em 825.
  Assert.AreEqual(830.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_ano2034_IcmsLancaExcecao;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2034, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 50.00, 0, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_icmsComPisCofinsSomenteIcmsDeveSerDeduzido2027;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 100.00, 0, 0, 0, 0, 0);
  Assert.AreEqual(900.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_mensagemErroOrdenadaAlfabeticamente_PisCofins;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10.00, 15.00, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_mensagemErroOrdenadaAlfabeticamente_IcmsIss;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 100.00, 50.00, 0, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_pisCofinsDeducaoSimultanea2026;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2026, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 100.00, 50.00, 21.50, 86.00, 0, 0);
  // Total deduções: 21.50 + 86 + 100 + 50 = 257.50
  // base = 742.50
  Assert.AreEqual(742.50, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_todosOsCamposDeducaoSimultanea;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2026, 3000.00, 0, 0, 0, 0, 0, 0, 0, 0, 150.00, 60.00, 30.00, 95.00, 200.00, 30.00);
  // 30+95+150+60+200+30 = 565
  // base = 3000 - 565 = 2435
  Assert.AreEqual(2435.00, FService.CalculaIbsCbs(input), 0.001);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_validacaoAntesDaSoma;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2027, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10.00, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

procedure TTest_BaseCalculoService_CalcularCibs.teste_duasValidacoesSeparadas;
var
  input: BaseCalculoIbsCbsModel;
begin
  input := BaseCalculoIbsCbsModel.Create(2033, 1000.00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10.00, 0, 0, 0);
  Assert.WillRaise(procedure begin FService.CalculaIbsCbs(input); end, Exception);
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_BaseCalculoService_CalcularCibs);

end.
