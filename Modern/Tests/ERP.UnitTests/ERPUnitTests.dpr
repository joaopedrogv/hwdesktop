program ERPUnitTests;

{$IFDEF TESTINSIGHT}
  {$IFNDEF CI}
    {$DEFINE USE_TESTINSIGHT}
  {$ENDIF}
{$ENDIF}

{$IFNDEF USE_TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}

uses
  FastMM5,
  DUnitX.MemoryLeakMonitor.FastMM5,
  System.SysUtils,
  {$IFDEF USE_TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.XML.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  FakeTransactionUnit in 'Support\Fakes\FakeTransactionUnit.pas',
  FakeDatabaseConnectionUnit in 'Support\Fakes\FakeDatabaseConnectionUnit.pas',
  StubNFSeRepositoryUnit in 'Support\Fakes\StubNFSeRepositoryUnit.pas',
  StubTributosDFeRepositoryUnit in 'Support\Fakes\StubTributosDFeRepositoryUnit.pas',
  StubOperacoesFiscaisIbsCbsRepositoryUnit in 'Support\Fakes\StubOperacoesFiscaisIbsCbsRepositoryUnit.pas',
  StubRegrasFiscaisIbsCbsRepositoryUnit in 'Support\Fakes\StubRegrasFiscaisIbsCbsRepositoryUnit.pas',
  FakeAtualizarSituacaoNFSeServiceUnit in 'Support\Fakes\FakeAtualizarSituacaoNFSeServiceUnit.pas',
  FakeHttpJsonClientUnit in 'Support\Fakes\FakeHttpJsonClientUnit.pas',
  FakeConfiguracoesRepositoryUnit in 'Support\Fakes\FakeConfiguracoesRepositoryUnit.pas',
  FakeControleVersaoCalculadoraApiUnit in 'Support\Fakes\FakeControleVersaoCalculadoraApiUnit.pas',
  FakeSincronizadorCalculadoraServiceUnit in 'Support\Fakes\FakeSincronizadorCalculadoraServiceUnit.pas',
  Test_ReverterAutorizacaoPortalNFSeUseCase in 'Application\UseCases\Test_ReverterAutorizacaoPortalNFSeUseCase.pas',
  Test_ControleVersaoCalculadoraApi in 'Adapters\Test_ControleVersaoCalculadoraApi.pas',
  Test_JsonQueryResult in 'Adapters\Test_JsonQueryResult.pas',
  Test_CalculadoraApiReader in 'Adapters\Test_CalculadoraApiReader.pas',
  Test_ObterAtualizacaoCalculadoraUseCase in 'Application\UseCases\Test_ObterAtualizacaoCalculadoraUseCase.pas',
  Test_SincronizarCalculadoraUseCase in 'Application\UseCases\Test_SincronizarCalculadoraUseCase.pas',
  Test_SincronizarDadosFiscaisSemCalculadora in 'Application\UseCases\Test_SincronizarDadosFiscaisSemCalculadora.pas',
  Test_SincronizacaoCalculadoraLockService in 'Domain\Services\Test_SincronizacaoCalculadoraLockService.pas',
  Test_SincronizadorCalculadoraService in 'Domain\Services\Test_SincronizadorCalculadoraService.pas',
  Test_OperacaoFiscalIbsCbsCondicaoEtd in 'Domain\Entities\Test_OperacaoFiscalIbsCbsCondicaoEtd.pas',
  Test_ResolverRegraFiscalIbsCbsService in 'Domain\Services\Test_ResolverRegraFiscalIbsCbsService.pas',
  Test_SalvarOperacaoFiscalIbsCbsUseCase in 'Application\UseCases\Test_SalvarOperacaoFiscalIbsCbsUseCase.pas',
  Test_CalcularTributosNFSeService in 'Application\Services\Test_CalcularTributosNFSeService.pas',
  ObterProximoSeqIdEventoDFeUseCaseUnit in '..\..\ERP.Features\Core\Application\UseCases\EventosDFe\ObterProximoSeqIdEventoDFeUseCaseUnit.pas',
  SalvarEventoDFe112150UseCaseUnit in '..\..\ERP.Features\Core\Application\UseCases\EventosDFe\SalvarEventoDFe112150UseCaseUnit.pas',
  ObterEventoDFe112150PorIdUseCaseUnit in '..\..\ERP.Features\Core\Application\UseCases\EventosDFe\ObterEventoDFe112150PorIdUseCaseUnit.pas',
  SalvarEventoDFe211130UseCaseUnit in '..\..\ERP.Features\Core\Application\UseCases\EventosDFe\SalvarEventoDFe211130UseCaseUnit.pas',
  ObterEventoDFe211130PorIdUseCaseUnit in '..\..\ERP.Features\Core\Application\UseCases\EventosDFe\ObterEventoDFe211130PorIdUseCaseUnit.pas',
  RemoverEventoDFeUseCaseUnit in '..\..\ERP.Features\Core\Application\UseCases\EventosDFe\RemoverEventoDFeUseCaseUnit.pas',
  FakeTokenDecryptorUnit in 'Support\Fakes\FakeTokenDecryptorUnit.pas',
  StubSessionContextUnit in 'Support\Fakes\StubSessionContextUnit.pas',
  StubEventosDFeRepositoryUnit in 'Support\Fakes\StubEventosDFeRepositoryUnit.pas',
  StubEventoDFe112150RepositoryUnit in 'Support\Fakes\StubEventoDFe112150RepositoryUnit.pas',
  StubEventoDFe211130RepositoryUnit in 'Support\Fakes\StubEventoDFe211130RepositoryUnit.pas',
  Test_SalvarEventoDFe112150UseCase in 'Application\UseCases\Test_SalvarEventoDFe112150UseCase.pas',
  Test_ObterEventoDFe112150PorIdUseCase in 'Application\UseCases\Test_ObterEventoDFe112150PorIdUseCase.pas',
  Test_SalvarEventoDFe211130UseCase in 'Application\UseCases\Test_SalvarEventoDFe211130UseCase.pas',
  Test_ObterEventoDFe211130PorIdUseCase in 'Application\UseCases\Test_ObterEventoDFe211130PorIdUseCase.pas',
  Test_RemoverEventoDFeUseCase in 'Application\UseCases\Test_RemoverEventoDFeUseCase.pas',
  Test_ObterProximoSeqIdEventoDFeUseCase in 'Application\UseCases\Test_ObterProximoSeqIdEventoDFeUseCase.pas',
  Test_EventoDFe211130Itens in 'Domain\Entities\Test_EventoDFe211130Itens.pas',
  Test_EventoDFeEtd in 'Domain\Entities\Test_EventoDFeEtd.pas',
  Test_EventoDFeMetadata in 'Domain\Validation\Test_EventoDFeMetadata.pas';

{ Keep this comment to prevent the IDE from removing the conditional below when adding a unit. }
{$IFNDEF USE_TESTINSIGHT}
var
  Runner: ITestRunner;
  Results: IRunResults;
  Logger: ITestLogger;
  NUnitLogger: ITestLogger;
{$ENDIF}

begin
  ReportMemoryLeaksOnShutdown := True;
{$IFDEF USE_TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    TDUnitX.CheckCommandLine;
    Runner := TDUnitX.CreateRunner;
    Runner.UseRTTI := True;
    Runner.FailsOnNoAsserts := False;

    if TDUnitX.Options.ConsoleMode <> TDUnitXConsoleMode.Off then
    begin
      Logger := TDUnitXConsoleLogger.Create(
        TDUnitX.Options.ConsoleMode = TDUnitXConsoleMode.Quiet
      );
      Runner.AddLogger(Logger);
    end;

    NUnitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    Runner.AddLogger(NUnitLogger);

    Results := Runner.Execute;
    if not Results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
    begin
      System.Writeln(E.ClassName, ': ', E.Message);
      System.ExitCode := EXIT_ERRORS;
    end;
  end;
{$ENDIF}
end.
