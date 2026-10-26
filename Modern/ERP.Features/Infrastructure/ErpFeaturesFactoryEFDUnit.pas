// Delphi Rio
unit ErpFeaturesFactoryEFDUnit;

interface

uses
  IServiceFactoryUnit, IErrorLoggerUnit, ISessionContextUnit, IDataBaseConnectionUnit,
  ResolverAjustesEFDRedBenefPcUseCaseUnit, ObterRegistrosDeAjusteEFDRedBenefPCUseCaseUnit;

type

  /// <summary>
  ///   Factory de UseCases, de uso exclusivo da dll hw.efd.dx.dll
  /// </summary>
  ErpFeaturesFactoryEFD = class//(TInterfacedObject, IErpFeaturesFactoryEFD)
  private
    FErrorLogger: IErrorLogger;
    FSession: ISessionContext;
    FDatabaseConnection: IDatabaseConnection;
  public
    constructor Create(
      DatabaseConnection: IDatabaseConnection;
      Session: ISessionContext;
      ErrorLogger: IErrorLogger
    );

    function CreateResolverAjustesEFDRedBenefPcUseCase(): IResolverAjustesEFDRedBenefPcUseCase;
    function CreateObterRegistrosDeAjusteEFDRedBenefPCUseCase(): IObterRegistrosDeAjusteEFDRedBenefPCUseCase;
  end;

  IErpFeaturesFactoryEFD = ErpFeaturesFactoryEFD;

implementation

uses
  SysUtils, IConsolidadorContextoFiscalPcServiceUnit, ICalcularAjusteRedBenefPcServiceUnit,
  ICalcularPisCofinsServiceUnit, IAplicadorRedBenefPcServiceUnit, ConsolidadorContextoFiscalPcServiceUnit,
  IRegrasRedBenefPcRepositoryUnit, IAjustesRedBenefPcRepositoryUnit, INotasFiscaisRepositoryUnit,
  INotasConsumidorRepositoryUnit, AjustesRedBenefPcRepositoryUnit, NotasConsumidorRepositoryUnit,
  NotasFiscaisRepositoryUnit, RegrasRedBenefPcRepositoryUnit, CalcularPisCofinsServiceUnit,
  AplicadorRedBenefPcServiceUnit, CalcularAjusteRedBenefPcServiceUnit, IConfiguracoesRepositoryUnit,
  ConfiguracoesRepositoryUnit, ICompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit,
  CompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit;

type
  ErpFeaturesRepoContainerEFD = class
  strict private
    procedure CheckIsSetupValid();
  private
    FDataBaseConnection: IDataBaseConnection;
    FSession: ISessionContext;
    FRegrasRedBenefPcRepo: IRegrasRedBenefPcRepository;
    FAjustesRedBenefPcRepo: IAjustesRedBenefPcRepository;
    FNotasFiscaisRepo: INotasFiscaisRepository;
    FNotasConsumidorRepo: INotasConsumidorRepository;
    FConfiguracoesRepo: IConfiguracoesRepository;

    function GetAjustesRedBenefPcRepo: IAjustesRedBenefPcRepository;
    function GetNotasConsumidorRepo: INotasConsumidorRepository;
    function GetNotasFiscaisRepo: INotasFiscaisRepository;
    function GetRegrasRedBenefPcRepo: IRegrasRedBenefPcRepository;
    function GetConfiguracoesRepo: IConfiguracoesRepository;
  public
    destructor Destroy; override;

    class procedure ReleaseInstance();
    class function GetInstance(): ErpFeaturesRepoContainerEFD;

    procedure Setup(Connection: IDataBaseConnection; Session: ISessionContext);

    property ConfiguracoesRepo: IConfiguracoesRepository read GetConfiguracoesRepo;
    property RegrasRedBenefPcRepo: IRegrasRedBenefPcRepository read GetRegrasRedBenefPcRepo;
    property AjustesRedBenefPcRepo: IAjustesRedBenefPcRepository read GetAjustesRedBenefPcRepo;
    property NotasFiscaisRepo: INotasFiscaisRepository read GetNotasFiscaisRepo;
    property NotasConsumidorRepo: INotasConsumidorRepository read GetNotasConsumidorRepo;
  end;

var
  GDFeFeaturesRepoContainer: ErpFeaturesRepoContainerEFD;

{ ErpFeaturesRepoContainerEFD }

procedure ErpFeaturesRepoContainerEFD.CheckIsSetupValid;
begin
  if FDataBaseConnection = nil then
    raise Exception.Create('Setup ErpFeaturesRepoContainerDX need be called');
end;

destructor ErpFeaturesRepoContainerEFD.Destroy;
begin
  FSession := nil;
  FConfiguracoesRepo.FreeSafe();
  FRegrasRedBenefPcRepo.FreeSafe();
  FAjustesRedBenefPcRepo.FreeSafe();
  FNotasFiscaisRepo.FreeSafe();
  FNotasConsumidorRepo.FreeSafe();

  inherited;
end;

function ErpFeaturesRepoContainerEFD.GetAjustesRedBenefPcRepo: IAjustesRedBenefPcRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FAjustesRedBenefPcRepo) then
    FAjustesRedBenefPcRepo := AjustesRedBenefPcRepository.Create(FDataBaseConnection, FSession);

  Result := FAjustesRedBenefPcRepo;
end;

function ErpFeaturesRepoContainerEFD.GetConfiguracoesRepo: IConfiguracoesRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FConfiguracoesRepo) then
    FConfiguracoesRepo := ConfiguracoesRepository.Create(FDataBaseConnection, FSession);

  Result := FConfiguracoesRepo;
end;

class function ErpFeaturesRepoContainerEFD.GetInstance: ErpFeaturesRepoContainerEFD;
begin
  if GDFeFeaturesRepoContainer = nil then
    GDFeFeaturesRepoContainer := ErpFeaturesRepoContainerEFD.Create();

  Result := GDFeFeaturesRepoContainer;
end;

function ErpFeaturesRepoContainerEFD.GetNotasConsumidorRepo: INotasConsumidorRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNotasConsumidorRepo) then
    FNotasConsumidorRepo := NotasConsumidorRepository.Create(FDataBaseConnection, FSession);

  Result := FNotasConsumidorRepo;
end;

function ErpFeaturesRepoContainerEFD.GetNotasFiscaisRepo: INotasFiscaisRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNotasFiscaisRepo) then
    FNotasFiscaisRepo := NotasFiscaisRepository.Create(FDataBaseConnection, FSession);

  Result := FNotasFiscaisRepo;
end;

function ErpFeaturesRepoContainerEFD.GetRegrasRedBenefPcRepo: IRegrasRedBenefPcRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FRegrasRedBenefPcRepo) then
    FRegrasRedBenefPcRepo := RegrasRedBenefPcRepository.Create(FDataBaseConnection, FSession);

  Result := FRegrasRedBenefPcRepo;
end;

class procedure ErpFeaturesRepoContainerEFD.ReleaseInstance;
begin
  if Assigned(GDFeFeaturesRepoContainer) then
    FreeAndNil(GDFeFeaturesRepoContainer);
end;

procedure ErpFeaturesRepoContainerEFD.Setup(Connection: IDataBaseConnection; Session: ISessionContext);
begin
  FDataBaseConnection := Connection;
  FSession := Session;
end;

{ ErpFeaturesFactoryEFD }

constructor ErpFeaturesFactoryEFD.Create(DatabaseConnection: IDatabaseConnection; Session: ISessionContext;
  ErrorLogger: IErrorLogger);
begin
  FDatabaseConnection := DatabaseConnection;
  FSession := Session;
  FErrorLogger := ErrorLogger;

  ErpFeaturesRepoContainerEFD.ReleaseInstance();
  ErpFeaturesRepoContainerEFD.GetInstance().Setup( FDatabaseConnection, FSession );
end;

function ErpFeaturesFactoryEFD.CreateObterRegistrosDeAjusteEFDRedBenefPCUseCase: IObterRegistrosDeAjusteEFDRedBenefPCUseCase;
var
  CompiladorDeAjustes: ICompilarRegistrosDeAjusteEFDRedBenefPCService;
begin
  CompiladorDeAjustes := CompilarRegistrosDeAjusteEFDRedBenefPCService.Create(
    ErpFeaturesRepoContainerEFD.GetInstance().AjustesRedBenefPcRepo
  );

  Result := ObterRegistrosDeAjusteEFDRedBenefPCUseCase.Create( CompiladorDeAjustes );
end;

function ErpFeaturesFactoryEFD.CreateResolverAjustesEFDRedBenefPcUseCase: IResolverAjustesEFDRedBenefPcUseCase;
var
  Consolidador: IConsolidadorContextoFiscalPcService;
  CalculadorAjuste: ICalcularAjusteRedBenefPcService;
  CalcularPISCOFINS: ICalcularPisCofinsService;
  AplicadorReducao: IAplicadorRedBenefPcService;
begin
  Consolidador := ConsolidadorContextoFiscalPcService.Create(
    ErpFeaturesRepoContainerEFD.GetInstance().NotasFiscaisRepo,
    ErpFeaturesRepoContainerEFD.GetInstance().NotasConsumidorRepo
  );

  CalcularPISCOFINS := CalcularPisCofinsService.Create();

  AplicadorReducao := AplicadorRedBenefPcService.Create();

  CalculadorAjuste := CalcularAjusteRedBenefPcService.Create(
    ErpFeaturesRepoContainerEFD.GetInstance().RegrasRedBenefPcRepo,
    CalcularPISCOFINS,
    AplicadorReducao,
    ErpFeaturesRepoContainerEFD.GetInstance().ConfiguracoesRepo
  );

  Result := ResolverAjustesEFDRedBenefPcUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainerEFD.GetInstance().AjustesRedBenefPcRepo,
    Consolidador,
    CalculadorAjuste
  );
end;

end.
