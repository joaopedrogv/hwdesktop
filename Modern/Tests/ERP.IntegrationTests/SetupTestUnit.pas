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
  FiscalCalculosFactoryUnit, ErpFeaturesFactoryUnit, ISharedFactoryUnit, SharedFactoryContainerUnit, SetupUnit,
  SetupConfigUnit, FileConfigUnit, ISqlLoggerUnit, ContainerUnit, ErpFeaturesRepoContainerUnit, SharedRepoContainerUnit,
  FiscalRepoContainerUnit, ISessionContextUnit, DFeDLLAdapterUnit, ErpFeaturesFactoryDFeUnit, ContainerDFeUnit,
  JsonResourceUnit;

var
  GFiscalFactoryInst: IFiscalCalculosFactory;
  GErpFeaturesInst: IErpFeaturesFactory;
  GErpFeaturesInstDFe: IErpFeaturesFactoryDFe;
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

  Session.SetEnviroment(GConfig.DataBaseName, 'C:\Windows\Temp\');
  Session.SetEmpresa(GConfig.UserSession.EmpresaId, GConfig.UserSession.EmpresaNome, GConfig.UserSession.EmpresaCnpj);
  Session.SetUsuario(GConfig.UserSession.UsuarioId, GConfig.UserSession.UsuarioNome, GConfig.UserSession.UsuarioEmail);
  Session.SetFinanceiro(GConfig.UserSession.CaixaUnificado, GConfig.UserSession.UnificadoraId);

  DFeDLLAdapter.SetupSession(
    Session.EmpresaId, Session.EmpresaNome, Session.EmpresaCNPJ,
    Session.UsuarioId, Session.UsuarioLogin, Session.UsuarioEmail,
    Session.CaixaUnificado, Session.UnificadoraId
  );

  AppSetup.Initialize(
    nil,
    SetupConfig.Create(
      FileConfig.Create( ExtractFilePath(ParamStr(0)) + 'log\',  ''),
      FileConfig.Create( ExtractFilePath(ParamStr(0)), 'erros.log' )
    )
  );

  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ GConfig.DataBaseName ])
  );

  AppSetup.SqlLogger.SetOptions( [loQuery, loParam]);

  FSharedFactory := SharedFactory.Create( AppSetup.DatabaseConnection, Session  );

  GFiscalFactoryInst := FiscalCalculosFactory.Create(AppSetup.DatabaseConnection, FSharedFactory);
  GErpFeaturesInst := ErpFeaturesFactory.Create(AppSetup.DatabaseConnection, FSharedFactory, Session);


  Container.GetInstance().RegisterFiscalCalculosFactory(GFiscalFactoryInst);
  Container.GetInstance().RegisterErpFeatures(GErpFeaturesInst);

  GErpFeaturesInstDFe := ErpFeaturesFactoryDFe.Create(AppSetup.DatabaseConnection, Session, AppSetup.ErrorLogger);
  ContainerDFe.GetInstance().RegisterDFeFeatures(GErpFeaturesInstDFe);
end;

procedure ModernShutDown();
begin
  AppSetup.DatabaseConnection.Disconnect();

  Container.ReleaseInstance();
  ErpFeaturesRepoContainer.ReleaseInstance();
  SharedRepoContainer.ReleaseInstance();
  FiscalRepoContainer.ReleaseInstance();

  if Assigned(GErpFeaturesInst) then
    FreeAndNil(GErpFeaturesInst);

  if Assigned(GFiscalFactoryInst) then
    FreeAndNil(GFiscalFactoryInst);

  if Assigned(GErpFeaturesInstDFe) then
    FreeAndNil(GErpFeaturesInstDFe);

  if Assigned(GConfig) then
    FreeAndNil(GConfig);

  AppSetupShutdown();
end;

function GetConfig(): ConfigurationTest;
begin
  Result := GConfig;
end;

end.
