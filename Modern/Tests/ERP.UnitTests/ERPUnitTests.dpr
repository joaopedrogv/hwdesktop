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
  {$ENDIF }
  DUnitX.TestFramework,
  FakeTransactionUnit in 'Support\Fakes\FakeTransactionUnit.pas',
  FakeDatabaseConnectionUnit in 'Support\Fakes\FakeDatabaseConnectionUnit.pas',
  StubNFSeRepositoryUnit in 'Support\Fakes\StubNFSeRepositoryUnit.pas',
  StubTributosDFeRepositoryUnit in 'Support\Fakes\StubTributosDFeRepositoryUnit.pas',
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
  FakeTokenDecryptorUnit in 'Support\Fakes\FakeTokenDecryptorUnit.pas';

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
