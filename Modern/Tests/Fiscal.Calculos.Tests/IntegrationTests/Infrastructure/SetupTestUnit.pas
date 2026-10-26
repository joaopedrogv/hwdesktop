unit SetupTestUnit;

interface

uses
  ConfigurationTestUnit;

procedure ModernInitialize();
procedure ModernShutDown();
function GetConfig(): ConfigurationTest;

implementation

uses
  SysUtils,
  FiscalCalculosFactoryUnit, ISharedFactoryUnit, SharedFactoryContainerUnit, SetupUnit,
  SetupConfigUnit, FileConfigUnit, ISqlLoggerUnit, ContainerFiscalTestsUnit, SharedRepoContainerUnit,
  FiscalRepoContainerUnit, ISessionContextUnit, JsonResourceUnit;

var
  GFiscalFactoryInst: FiscalCalculosFactory;
  GConfig: ConfigurationTest;

procedure ModernInitialize();
var
  FSharedFactory: ISharedFactory;
  Session: ISessionContext;
  J: JsonResource;
begin

  J := JsonResource.Create();
  try
    if Assigned(GConfig) then
      FreeAndNil(GConfig);
    GConfig := J.DeserializeObject<ConfigurationTest>('test-config.json');
  finally
    J.Free();
  end;

  Session := Container.GetInstance().GetSessionContext();

  Session.SetEnviroment(GConfig.DatabaseNameSinc, 'C:\Windows\Temp\');
  Session.SetEmpresa(GConfig.UserSession.EmpresaId, GConfig.UserSession.EmpresaNome, GConfig.UserSession.EmpresaCnpj);
  Session.SetUsuario(GConfig.UserSession.UsuarioId, GConfig.UserSession.UsuarioNome, GConfig.UserSession.UsuarioEmail);
  Session.SetFinanceiro(GConfig.UserSession.CaixaUnificado, GConfig.UserSession.UnificadoraId);

  AppSetup.Initialize(
    nil,
    SetupConfig.Create(
      FileConfig.Create( ExtractFilePath(ParamStr(0)) + 'log\',  ''),
      FileConfig.Create( ExtractFilePath(ParamStr(0)), 'erros.log' )
    )
  );

  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ GConfig.DatabaseNameSinc ])
  );

  AppSetup.SqlLogger.SetOptions( [loQuery, loParam]);

  FSharedFactory := SharedFactory.Create( AppSetup.DatabaseConnection, Session  );

  GFiscalFactoryInst := FiscalCalculosFactory.Create(AppSetup.DatabaseConnection, FSharedFactory);

  Container.GetInstance().RegisterFiscalCalculosFactory(GFiscalFactoryInst);
end;

procedure ModernShutDown();
begin
  AppSetup.DatabaseConnection.Disconnect();

  Container.ReleaseInstance();
  SharedRepoContainer.ReleaseInstance();
  FiscalRepoContainer.ReleaseInstance();

  if Assigned(GFiscalFactoryInst) then
    FreeAndNil(GFiscalFactoryInst);

  if Assigned(GConfig) then
    FreeAndNil(GConfig);

  AppSetupShutdown();
end;

function GetConfig(): ConfigurationTest;
begin
  Result := GConfig;
end;

end.
