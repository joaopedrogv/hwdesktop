program FiscalCalculosTests;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  FastMM5,
  DUnitX.MemoryLeakMonitor.FastMM5,
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  {$ENDIF }
  DUnitX.TestFramework,
  CalculoInputTestModel in '..\Common\Models\CalculoInputTestModel.pas',
  ConfigurationTestUnit in '..\Common\Models\ConfigurationTestUnit.pas',
  JsonResourceUnit in '..\Common\Services\JsonResourceUnit.pas',
  Teste_ItemDuplicadoSemErro in 'IntegrationTests\CalculosCorretos\Teste_ItemDuplicadoSemErro.pas',
  Teste_000001_1 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_000001\Teste_000001_1.pas',
  Teste_000001_2 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_000001\Teste_000001_2.pas',
  Teste_000001_3 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_000001\Teste_000001_3.pas',
  Teste_000001_4 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_000001\Teste_000001_4.pas',
  Teste_000001_5 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_000001\Teste_000001_5.pas',
  Teste_000001_6 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_000001\Teste_000001_6.pas',
  Teste_000001_7 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_000001\Teste_000001_7.pas',
  Teste_000001_8 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_000001\Teste_000001_8.pas',
  Teste_011002_1 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_011002\Teste_011002_1.pas',
  Teste_200002_1 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_200002\Teste_200002_1.pas',
  Teste_200002_2 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_200002\Teste_200002_2.pas',
  Teste_200002_3 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_200002\Teste_200002_3.pas',
  Teste_200002_4 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_200002\Teste_200002_4.pas',
  Teste_200032_1 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_200032\Teste_200032_1.pas',
  Teste_200032_2 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_200032\Teste_200032_2.pas',
  Teste_200032_3 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_200032\Teste_200032_3.pas',
  Teste_200032_4 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_200032\Teste_200032_4.pas',
  Teste_510002_1 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_510002\Teste_510002_1.pas',
  Teste_620001_1 in 'IntegrationTests\CalculosCorretos\CbsIbs\cclasstrib_620001\Teste_620001_1.pas',
  Teste_totais_1 in 'IntegrationTests\CalculosCorretos\Totais\Teste_totais_1.pas',
  Teste_CompraGovService in 'IntegrationTests\CalculosCorretos\ComprasGovernamentais\Teste_CompraGovService.pas',
  Teste_indicador_gRed_1_presente in 'IntegrationTests\Indicadores\Teste_indicador_gRed_1_presente.pas',
  Teste_indicador_gRed_2_ausente in 'IntegrationTests\Indicadores\Teste_indicador_gRed_2_ausente.pas',
  Teste_indicador_gRed_3_tributacaoRegular in 'IntegrationTests\Indicadores\Teste_indicador_gRed_3_tributacaoRegular.pas',
  Teste_indicador_gRed_4_cst515 in 'IntegrationTests\Indicadores\Teste_indicador_gRed_4_cst515.pas',
  Test_AliquotaResultadoModel in 'UnitTests\DTO\Test_AliquotaResultadoModel.pas',
  Teste_CompraGovernamentalInput in 'UnitTests\DTO\Teste_CompraGovernamentalInput.pas',
  Teste_IBSCBSTotal_GMono in 'UnitTests\DTO\Teste_IBSCBSTotal_GMono.pas',
  Teste_ResultadoCbsIbsCompraGovernamental in 'UnitTests\DTO\Teste_ResultadoCbsIbsCompraGovernamental.pas',
  Teste_ROCOperacaoConsumo in 'UnitTests\DTO\Teste_ROCOperacaoConsumo.pas',
  Teste_ArredondamentoUtils in 'UnitTests\Service\Teste_ArredondamentoUtils.pas',
  Teste_AvaliadorExpressaoAritmetica in 'UnitTests\Service\Teste_AvaliadorExpressaoAritmetica.pas',
  Teste_BaseCalculoService_CalcularCibs in 'UnitTests\Service\Teste_BaseCalculoService_CalcularCibs.pas',
  Teste_BaseCalculoService_CalcularISMercadorias in 'UnitTests\Service\Teste_BaseCalculoService_CalcularISMercadorias.pas',
  Teste_CalculoCbsIbsService_CompraGovernamental in 'UnitTests\Service\Teste_CalculoCbsIbsService_CompraGovernamental.pas',
  Teste_CalculoImpostoSeletivo_Precisao in 'UnitTests\Service\Teste_CalculoImpostoSeletivo_Precisao.pas',
  Teste_MemoriaCalculoService in 'UnitTests\Service\Teste_MemoriaCalculoService.pas',
  Teste_NbsAplicavelService in 'UnitTests\Service\Teste_NbsAplicavelService.pas',
  Teste_NfseUseCases_ConsultarIndicadorOperacao in 'UnitTests\Service\Teste_NfseUseCases_ConsultarIndicadorOperacao.pas',
  Teste_NfseUseCases_ConsultarLocalOperacao in 'UnitTests\Service\Teste_NfseUseCases_ConsultarLocalOperacao.pas',
  Teste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs in 'UnitTests\Service\Teste_NfseUseCases_ConsultarSituacoesClassificacoesPorNbs.pas',
  Teste_NfseUseCases_ValidarIndicadorOperacao in 'UnitTests\Service\Teste_NfseUseCases_ValidarIndicadorOperacao.pas',
  Teste_PreparacaoCalculoService_ValidacaoDigitos in 'UnitTests\Service\Teste_PreparacaoCalculoService_ValidacaoDigitos.pas',
  Teste_PreparacaoCalculoService_ValidarQuantidadeEUnidade in 'UnitTests\Service\Teste_PreparacaoCalculoService_ValidarQuantidadeEUnidade.pas',
  Teste_TributacaoCompraGovernamentalModel in 'UnitTests\Service\Teste_TributacaoCompraGovernamentalModel.pas',
  Teste_ValidacoesNegocioNbsNcm in 'IntegrationTests\ValidacoesNegocio\Teste_ValidacoesNegocioNbsNcm.pas',
  ContainerFiscalTestsUnit in 'IntegrationTests\Infrastructure\ContainerFiscalTestsUnit.pas',
  SetupTestUnit in 'IntegrationTests\Infrastructure\SetupTestUnit.pas';

{ keep comment here to protect the following conditional from being removed by the IDE when adding a unit }
{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
  ReportMemoryLeaksOnShutdown := True;
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
