unit SetupMirror;

interface

procedure ModernInitialize();
procedure ModernShutDown();

procedure ModernSetupDatabase(const DataBaseName: string);
procedure ModernSetupEmpresa(EmpresaId: Integer);

implementation

uses
  SysUtils,
  FiscalCalculosFactoryUnit, ErpFeaturesFactoryUnit, ISharedFactoryUnit, SharedFactoryContainerUnit, SetupUnit,
  SetupConfigUnit, FileConfigUnit, ISqlLoggerUnit, ContainerUnit, ErpFeaturesRepoContainerUnit, SharedRepoContainerUnit,
  FiscalRepoContainerUnit, ISessionContextUnit, DFeDLLAdapterUnit, ErpFeaturesFactoryDFeUnit, ContainerDFeUnit,
  EmpresaEtdUnit;

var
  GFiscalFactoryInst: IFiscalCalculosFactory;
  GErpFeaturesInst: IErpFeaturesFactory;
  GErpFeaturesInstDX: IErpFeaturesFactoryDFe;

procedure ModernInitialize();
var
  FSharedFactory: ISharedFactory;
  Session: ISessionContext;
begin

  Session := Container.GetInstance().GetSessionContext();

  Session.SetEnviroment(
    'note-jp:D:\Hw\bases\producao\Hwauto.fdb',
    'C:\Windows\Temp\'
  );
  Session.SetEmpresa(0, '', '');
  Session.SetUsuario(0, '', '');
  Session.SetFinanceiro(False, 0);

  AppSetup.Initialize(
    nil,
    SetupConfig.Create(
      FileConfig.Create( ExtractFilePath(ParamStr(0)) + 'log\',  ''),
      FileConfig.Create( ExtractFilePath(ParamStr(0)), 'erros.log' )
    )
  );
  {
  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ Session.DataBaseName ])
  );
  }
  AppSetup.SqlLogger.SetOptions( [loQuery, loParam]);

  FSharedFactory := SharedFactory.Create( AppSetup.DatabaseConnection, Session  );

  GFiscalFactoryInst := FiscalCalculosFactory.Create(AppSetup.DatabaseConnection, FSharedFactory);
  GErpFeaturesInst := ErpFeaturesFactory.Create(AppSetup.DatabaseConnection, FSharedFactory, Session);


  Container.GetInstance().RegisterFiscalCalculosFactory(GFiscalFactoryInst);
  Container.GetInstance().RegisterErpFeatures(GErpFeaturesInst);

  GErpFeaturesInstDX := ErpFeaturesFactoryDFe.Create(AppSetup.DatabaseConnection, Session, AppSetup.ErrorLogger);
  ContainerDFe.GetInstance().RegisterDFeFeatures(GErpFeaturesInstDX);
end;

procedure ModernSetupDatabase(const DataBaseName: string);
var
  Session: ISessionContext;
begin
  Session := Container.GetInstance().GetSessionContext();

  if DataBaseName <> '' then
  begin
    Session.SetEnviroment(DataBaseName, Session.TemporaryFolder);
    ContainerDFe.GetInstance().GetSessionContext.SetEnviroment(Session.DataBaseName, Session.TemporaryFolder);

    AppSetup.DatabaseConnection.Connect(
      Format('ConnectionString=%s;UserName=sysdba;Password=masterkey;LogSql=True', [ Session.DataBaseName ])
    );
  end;
end;

procedure ModernSetupEmpresa(EmpresaId: Integer);
var
  Session: ISessionContext;
  Empresa: EmpresaEtd;
begin
  Session := Container.GetInstance().GetSessionContext();

  Empresa := ErpFeaturesRepoContainer.GetInstance().EmpresasRepo.GetByKey(EmpresaId);
  if Empresa = nil then
    Exit();

  try
    Session.SetEmpresa(Empresa.Id, Empresa.Razao, Empresa.CNPJ);
    ContainerDFe.GetInstance().GetSessionContext.SetEmpresa(Session.EmpresaId, Session.EmpresaNome, Session.EmpresaCNPJ);
  finally
    Empresa.Free();
  end;
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

  if Assigned(GErpFeaturesInstDX) then
    FreeAndNil(GErpFeaturesInstDX);

  AppSetupShutdown();
end;

end.
