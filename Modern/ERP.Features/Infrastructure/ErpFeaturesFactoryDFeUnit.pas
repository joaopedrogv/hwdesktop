// Delphi Rio
unit ErpFeaturesFactoryDFeUnit;

interface

uses
  SysUtils, Classes,
  ErpFeaturesFactoryBaseUnit,
  IServiceFactoryUnit,
  IDatabaseConnectionUnit,
  ISessionContextUnit,
  IErrorLoggerUnit,
  ListarTributosDFePorDocFiscalUseCaseUnit,
  ISalvarTributoDFeUseCaseUnit,
  IRemoverTributoDFeUseCaseUnit,
  EmitirWsNFSeUseCaseUnit,
  IEmpresasRepositoryUnit,
  EmpresasRepositoryUnit,
  IACBrNFSeAdapterUnit,
  ACBrNFSeAdapterUnit,
  ListarRegimesEspeciaisDeTributacaoNFSeUseCaseUnit,
  ImprimirNFSeUseCaseUnit,
  SalvarPdfNFSeUseCaseUnit,
  CancelarWsNFSeUseCaseUnit,
  IProgressObserverUnit,
  IAtualizarSituacaoNFSeServiceUnit,
  EnviarEmailNFSeUseCaseUnit,
  ObterArquivosFiscaisModificadosUseCaseUnit,
  ISincronizarDadosFiscaisUseCaseUnit, IFormasPagamentoRepositoryUnit, IControleCreditosRepositoryUnit,
  CriarAnexosDxNFSeUseCaseUnit, ExisteAtualizacaoConsultasSqlUseCaseUnit, SincronizarConsultasSqlUseCaseUnit,
  RegistrarDFeAlertasUseCaseUnit, ConverterNFeParaContingenciaUseCaseUnit, INotasFiscaisRepositoryUnit,
  IDocumentosEletronicosRepositoryUnit, ObterPendenciaNFeSefazUseCaseUnit, AvancarPendenciaSefazUseCaseUnit,
  ObterAtualizacaoCalculadoraUseCaseUnit, ISincronizarCalculadoraUseCaseUnit, IConfiguracaoNFSeServiceUnit;

type

  IListarTributosNFePorIdUseCase = ListarTributosNFe;
  IListarTributosNFCePorIdUseCase = ListarTributosNFCe;

  /// <summary>
  ///   Factory de UseCases, de uso exclusivo da dll hw.nfe.dx.dll
  /// </summary>
  ErpFeaturesFactoryDFe = class(ErpFeaturesFactoryBase)
  private
    FErrorLogger: IErrorLogger;
    //FSession: ISessionContext;
    FDatabaseConnection: IDatabaseConnection;
    function CreateAtualizarSituacaoNFSeService(): IAtualizarSituacaoNFSeService;
    function CreateACBrNFSeAdapter(Observer: IProgressObserver): IACBrNFSeAdapter;
    function CreateConfiguracaoNFSeService(): IConfiguracaoNFSeService;
  public
    constructor Create(
      DatabaseConnection: IDatabaseConnection;
      Session: ISessionContext;
      ErrorLogger: IErrorLogger
    );
    //Tributos DFe
    function CreateListarTributosNFePorIdUseCase(): IListarTributosNFePorIdUseCase;
    function CreateListarTributosNFCePorIdUseCase(): IListarTributosNFCePorIdUseCase;
    function CreateSalvarTributoDFeUseCase(): ISalvarTributoDFeUseCase;
    function CreateRemoverTributoDFeUseCase(): IRemoverTributoDFeUseCase;
    // Dados Fiscais
    function CreateObterArquivosFiscaisModificadosUseCase(): IObterArquivosFiscaisModificadosUseCase;
    function CreateSincronizarDadosFiscaisUseCase(Observer: IProgressObserver): ISincronizarDadosFiscaisUseCase;
    function CreateObterAtualizacaoCalculadoraUseCase(Observer: IProgressObserver): IObterAtualizacaoCalculadoraUseCase;
    function CreateSincronizarCalculadoraUseCase(Observer: IProgressObserver): ISincronizarCalculadoraUseCase;
    // NFSe
    function CreateListarRegimesEspeciaisDeTributacaoNFSeUseCase(): IListarRegimesEspeciaisDeTributacaoNFSeUseCase;
    function CreateConsultarWsNFSeUseCase(Observer: IProgressObserver): IConsultarWsNFSeUseCase;
    function CreateEmitirWsNFSeUseCase(Observer: IProgressObserver): IEmitirWsNFSeUseCase;
    function CreateEmitirLoteWsNFSeUseCase(Observer: IProgressObserver): IEmitirLoteWsNFSeUseCase;
    function CreateCancelarWsNFSeUseCase(Observer: IProgressObserver): ICancelarWsNFSeUseCase;
    function CreateImprimirNFSeUseCase(Observer: IProgressObserver): IImprimirNFSeUseCase;
    function CreateSalvarPdfNFSeUseCase(Observer: IProgressObserver): ISalvarPdfNFSeUseCase;
    function CreateEnviarEmailNFSeUseCase(Observer: IProgressObserver): IEnviarEmailNFSeUseCase;
    function CreateCriarAnexosNFSeUseCase(Observer: IProgressObserver): ICriarAnexosDxNFSeUseCase;
    // Consultas-SQL
    function CreateExisteAtualizacaoConsultasSqlUseCase(Observer: IProgressObserver): IExisteAtualizacaoConsultasSqlUseCase;
    function CreateSincronizarConsultasSqlUseCase(Observer: IProgressObserver): ISincronizarConsultasSqlUseCase;
    // Alertas DFe
    function CreateRegistrarDFeAlertasUseCase(): IRegistrarDFeAlertasUseCase;
    //Nota Fiscal
    function CreateConverterNFeParaContingenciaUseCase(): IConverterNFeParaContingenciaUseCase;
    function CreateObterPendenciaNFeSefazUseCase(): IObterPendenciaNFeSefazUseCase;
    function CreateAvancarPendenciaSefazUseCase(): IAvancarPendenciaSefazUseCase;
  end;

  IErpFeaturesFactoryDFe = ErpFeaturesFactoryDFe;

implementation

uses
  ITributosDFeRepositoryUnit,
  TributosDFeRepositoryUnit,
  SalvarTributoDFeUseCaseUnit,
  RemoverTributoDFeUseCaseUnit,
  INFSeRepositoryUnit,
  NFSeRepositoryUnit,
  ConfiguracaoNFSeServiceUnit,
  IConfiguracoesRepositoryUnit,
  ConfiguracoesRepositoryUnit,
  IConfigReaderAndWriterUnit,
  ISimpleLoggerUnit,
  INFSeConverterUnit,
  NFSeConverterUnit,
  IniConfigReaderAndWriterUnit,
  SimpleFileLoggerUnit, SincronizarDadosFiscaisUseCaseUnit, SincronizarCalculadoraUseCaseUnit,
  FileConfigUnit, AtualizarSituacaoNFSeServiceUnit, EmailComposerServiceUnit, IEmailComposerServiceUnit,
  IEnviarEmailUseCaseUnit, EnviarEmailUseCaseUnit, IEmailServiceUnit, ACBrEmailServiceUnit, IDownloadServiceUnit,
  DownloadServiceUnit, ISincronizadorCalculadoraServiceUnit, SincronizadorCalculadoraServiceUnit,
  IDadosFiscaisReaderUnit, IDadosFiscaisWriterUnit, ERPWriterUnit, INcmReaderUnit,
  ISincronizadorNCMsSICOMEXServiceUnit, SincronizadorNCMsSICOMEXServiceUnit,
  INcmWriterUnit, NCMJsonReaderUnit, IIbptReaderUnit, IIbptWriterUnit, IbptCsvReaderUnit, ICSVReaderUnit,
  CSVFileReaderUnit, ISincronizadorTabelaIbptServiceUnit, SincronizadorTabelaIbptServiceUnit,
  ISincronizadorFiscalNFSeServiceUnit, SincronizadorFiscalNFSeServiceUnit, ITabelasFiscaisNFSeReaderUnit,
  ITabelasFiscaisNFSeWriterUnit, TabelasFiscaisNFSeCsvReaderUnit, IPedVendaRepositoryUnit, PedVendaRepositoryUnit,
  FormasPagamentoRepositoryUnit, ControleCreditosRepositoryUnit, IRatearRetencoesNFSeOSServiceUnit,
  RatearRetencoesNFSeOSServiceUnit, ZipCompressorServiceUnit, IZipCompressorServiceUnit, INFSeAnexosServiceUnit,
  NFSeAnexosServiceUnit, IConsultasSqlRepositoryUnit, ConsultasSqlRepositoryUnit, ManifestSincServiceUnit,
  IManifestSincServiceUnit, HashComparatorServiceUnit, IHashComparatorServiceUnit, LocalManifestHashesServiceUnit,
  ILocalManifestHashesServiceUnit, IDFeAlertasRepositoryUnit, DFeAlertasRepositoryUnit, NotasFiscaisRepositoryUnit,
  DocumentosEletronicosRepositoryUnit, IHttpJsonClientUnit, NetHttpJsonClientUnit, IControleVersaoCalculadoraApiUnit,
  ControleVersaoCalculadoraApiUnit, ISincronizacaoCalculadoraLockServiceUnit, SincronizacaoCalculadoraLockServiceUnit,
  CalculadoraApiReaderUnit, ITokenDecryptorUnit, TwofishTokenDecryptorUnit, ITokenEncryptorUnit;

type
  ErpFeaturesRepoContainerDFe = class
  strict private
    procedure CheckIsSetupValid();
  private
    FDataBaseConnection: IDataBaseConnection;
    FSession: ISessionContext;
    FTributosDFeRepo: ITributosDFeRepository;
    FNFSeRepo: INFSeRepository;
    FConfiguracoesRepo: IConfiguracoesRepository;
    FEmpresasRepo: IEmpresasRepository;
    FPedVendaRepo: IPedVendaRepository;
    FFormasPagamentoRepo: IFormasPagamentoRepository;
    FControleCreditosRepo: IControleCreditosRepository;
    FConsultasSqlRepo: IConsultasSqlRepository;
    FDFeAlertasRepo: IDFeAlertasRepository;
    FNotasFiscaisRepo: INotasFiscaisRepository;
    FDocumentosEletRepo: IDocumentosEletronicosRepository;

    function GetTributosDFeRepo: ITributosDFeRepository;
    function GetNFSeRepo: INFSeRepository;
    function GetConfiguracoesRepo: IConfiguracoesRepository;
    function GetEmpresasRepo: IEmpresasRepository;
    function GetPedVendaRepo: IPedVendaRepository;
    function GetFormasPagamentoRepo: IFormasPagamentoRepository;
    function GetControleCreditosRepo: IControleCreditosRepository;
    function GetConsultasSqlRepository: IConsultasSqlRepository;
    function GetDFeAlertasRepo: IDFeAlertasRepository;
    function GetNotasFiscaisRepo: INotasFiscaisRepository;
    function GetDocumentosEletRepo: IDocumentosEletronicosRepository;
  public
    destructor Destroy; override;

    class procedure ReleaseInstance();
    class function GetInstance(): ErpFeaturesRepoContainerDFe;

    procedure Setup(Connection: IDataBaseConnection; Session: ISessionContext);

    property TributosDFeRepo: ITributosDFeRepository read GetTributosDFeRepo;
    property NFSeRepo: INFSeRepository read GetNFSeRepo;
    property ConfiguracoesRepo: IConfiguracoesRepository read GetConfiguracoesRepo;
    property EmpresasRepo: IEmpresasRepository read GetEmpresasRepo;
    property PedVendaRepo: IPedVendaRepository read GetPedVendaRepo;
    property FormasPagamentoRepo: IFormasPagamentoRepository read GetFormasPagamentoRepo;
    property ControleCreditosRepo: IControleCreditosRepository read GetControleCreditosRepo;
    property ConsultasSqlRepo: IConsultasSqlRepository read GetConsultasSqlRepository;
    property DFeAlertasRepo: IDFeAlertasRepository read GetDFeAlertasRepo;
    property NotasFiscaisRepo: INotasFiscaisRepository read GetNotasFiscaisRepo;
    property DocumentosEletRepo: IDocumentosEletronicosRepository read GetDocumentosEletRepo;
  end;

  ErpFeaturesFactoryDFeInternal = class
  public
    class function CreateConfigReaderAppIni(): IConfigReader;
    class function CreateSimpleLoggerNFSe(): ISimpleLogger;
  end;

var
  GFeaturesRepoContainerDFe: ErpFeaturesRepoContainerDFe;

{ ErpFeaturesRepoContainerDFe }

procedure ErpFeaturesRepoContainerDFe.CheckIsSetupValid;
begin
  if FDataBaseConnection = nil then
    raise Exception.Create('Setup ErpFeaturesRepoContainerDFe need be called');
end;

destructor ErpFeaturesRepoContainerDFe.Destroy;
begin
  FSession := nil;
  FTributosDFeRepo.FreeSafe();
  FNFSeRepo.FreeSafe();
  FConfiguracoesRepo.FreeSafe();
  FEmpresasRepo.FreeSafe();
  FPedVendaRepo.FreeSafe();
  FFormasPagamentoRepo.FreeSafe();
  FControleCreditosRepo.FreeSafe();
  FConsultasSqlRepo.FreeSafe();
  FDFeAlertasRepo.FreeSafe();
  FNotasFiscaisRepo.FreeSafe();
  FDocumentosEletRepo.FreeSafe();

  inherited;
end;

function ErpFeaturesRepoContainerDFe.GetConfiguracoesRepo: IConfiguracoesRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FConfiguracoesRepo) then
    FConfiguracoesRepo := ConfiguracoesRepository.Create(FDataBaseConnection, FSession );

  Result := FConfiguracoesRepo;
end;

function ErpFeaturesRepoContainerDFe.GetConsultasSqlRepository: IConsultasSqlRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FConsultasSqlRepo) then
    FConsultasSqlRepo := ConsultasSqlRepository.Create(FDataBaseConnection, FSession);

  Result := FConsultasSqlRepo;
end;

function ErpFeaturesRepoContainerDFe.GetControleCreditosRepo: IControleCreditosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FControleCreditosRepo) then
    FControleCreditosRepo := ControleCreditosRepository.Create(FDataBaseConnection, FSession);

  Result := FControleCreditosRepo;
end;

function ErpFeaturesRepoContainerDFe.GetDFeAlertasRepo: IDFeAlertasRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FDFeAlertasRepo) then
    FDFeAlertasRepo := DFeAlertasRepository.Create(FDataBaseConnection, FSession);

  Result := FDFeAlertasRepo;
end;

function ErpFeaturesRepoContainerDFe.GetDocumentosEletRepo: IDocumentosEletronicosRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FDocumentosEletRepo) then
    FDocumentosEletRepo := DocumentosEletronicosRepository.Create(FDataBaseConnection, FSession);

  Result := FDocumentosEletRepo;
end;

function ErpFeaturesRepoContainerDFe.GetEmpresasRepo: IEmpresasRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FEmpresasRepo) then
    FEmpresasRepo := EmpresasRepository.Create(FDataBaseConnection, FSession);

  Result := FEmpresasRepo;
end;

function ErpFeaturesRepoContainerDFe.GetFormasPagamentoRepo: IFormasPagamentoRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FFormasPagamentoRepo) then
    FFormasPagamentoRepo := FormasPagamentoRepository.Create(FDataBaseConnection, FSession);

  Result := FFormasPagamentoRepo;
end;

class function ErpFeaturesRepoContainerDFe.GetInstance: ErpFeaturesRepoContainerDFe;
begin
  if GFeaturesRepoContainerDFe = nil then
    GFeaturesRepoContainerDFe := ErpFeaturesRepoContainerDFe.Create();

  Result := GFeaturesRepoContainerDFe;
end;

function ErpFeaturesRepoContainerDFe.GetNFSeRepo: INFSeRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNFSeRepo) then
    FNFSeRepo := NFSeRepository.Create(FDataBaseConnection, FSession);

  Result := FNFSeRepo;
end;

function ErpFeaturesRepoContainerDFe.GetNotasFiscaisRepo: INotasFiscaisRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FNotasFiscaisRepo) then
    FNotasFiscaisRepo := NotasFiscaisRepository.Create(FDataBaseConnection, FSession);

  Result := FNotasFiscaisRepo;
end;

function ErpFeaturesRepoContainerDFe.GetPedVendaRepo: IPedVendaRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FPedVendaRepo) then
    FPedVendaRepo := PedVendaRepository.Create(FDataBaseConnection, FSession);

  Result := FPedVendaRepo;
end;

function ErpFeaturesRepoContainerDFe.GetTributosDFeRepo: ITributosDFeRepository;
begin
  CheckIsSetupValid();

  if not Assigned(FTributosDFeRepo) then
    FTributosDFeRepo := TributosDFeRepository.Create(FDataBaseConnection, FSession);

  Result := FTributosDFeRepo;
end;

class procedure ErpFeaturesRepoContainerDFe.ReleaseInstance;
begin
  if Assigned(GFeaturesRepoContainerDFe) then
    FreeAndNil(GFeaturesRepoContainerDFe);
end;

procedure ErpFeaturesRepoContainerDFe.Setup(Connection: IDataBaseConnection; Session: ISessionContext);
begin
  FDataBaseConnection := Connection;
  FSession := Session;
end;

{ ErpFeaturesFactoryDFeInternal }

class function ErpFeaturesFactoryDFeInternal.CreateConfigReaderAppIni: IConfigReader;
begin
  Result := IniConfigReaderAndWriter.Create( FileConfig.Create(ExtractFilePath(ParamStr(0)), 'Config.ini') );
end;

class function ErpFeaturesFactoryDFeInternal.CreateSimpleLoggerNFSe: ISimpleLogger;
begin
  Result := SimpleFileLogger.Create( FileConfig.Create(ExtractFilePath(ParamStr(0)), 'NFSe.log' ) );
end;

{ ErpFeaturesFactoryDFe }

constructor ErpFeaturesFactoryDFe.Create(
  DatabaseConnection: IDatabaseConnection;
  Session: ISessionContext;
  ErrorLogger: IErrorLogger
);
begin
  FDatabaseConnection := DatabaseConnection;
  FSession := Session;
  FErrorLogger := ErrorLogger;

  ErpFeaturesRepoContainerDFe.ReleaseInstance();
  ErpFeaturesRepoContainerDFe.GetInstance().Setup( FDatabaseConnection, FSession );
end;

function ErpFeaturesFactoryDFe.CreateConfiguracaoNFSeService: IConfiguracaoNFSeService;
var
  Decryptor: ITokenDecryptor;
begin
  Decryptor := TwofishTokenDecryptor.Create(CreateSecretPorEmpresaNFSe());
  Result := ConfiguracaoNFSeService.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo,
    Decryptor
  );
end;

function ErpFeaturesFactoryDFe.CreateACBrNFSeAdapter(Observer: IProgressObserver): IACBrNFSeAdapter;
var
  ConfigReader: IConfigReader;
  LoggerNFSe: ISimpleLogger;
begin
  ConfigReader := IniConfigReaderAndWriter.Create( FileConfig.Create(ExtractFilePath(ParamStr(0)), 'Config.ini' ));
  LoggerNFSe  := SimpleFileLogger.Create( FileConfig.Create(ExtractFilePath(ParamStr(0)), 'NFSe.log' ));

  Result := ACBrNFSeAdapter.Create(
    FSession,
    ConfigReader,
    LoggerNFSe,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateAtualizarSituacaoNFSeService: IAtualizarSituacaoNFSeService;
var
  RateionRetencoesServ: IRatearRetencoesNFSeOSService;
begin
  RateionRetencoesServ := RatearRetencoesNFSeOSService.Create();

  Result := AtualizarSituacaoNFSeService.Create(
		ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().PedVendaRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().FormasPagamentoRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().ControleCreditosRepo,
    RateionRetencoesServ
  );
end;

function ErpFeaturesFactoryDFe.CreateAvancarPendenciaSefazUseCase: IAvancarPendenciaSefazUseCase;
begin
  Result := AvancarPendenciaSefazUseCase.Create(
		ErpFeaturesRepoContainerDFe.GetInstance().NotasFiscaisRepo,
		ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateCancelarWsNFSeUseCase(Observer: IProgressObserver): ICancelarWsNFSeUseCase;
begin
  Result := CancelarWsNFSeUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().EmpresasRepo,
    CreateConfiguracaoNFSeService(),
    CreateAtualizarSituacaoNFSeService(),
    CreateACBrNFSeAdapter(Observer),
    NFSeConverter.Create(),
    FErrorLogger,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateConsultarWsNFSeUseCase(Observer: IProgressObserver): IConsultarWsNFSeUseCase;
var
  EmailCompuser: IEmailComposerService;
  EnviarEmail: IEnviarEmailUseCase;
  EmailService: IEmailService;
begin
  EmailService := ACBrEmailService.Create();

  EnviarEmail := EnviarEmailUseCase.Create( EmailService );

  EmailCompuser := EmailComposerService.Create();

  Result := ConsultarWsNFSeUseCase.Create(
    FSession,
    FDatabaseConnection,
    ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().EmpresasRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo,
    CreateConfiguracaoNFSeService(),
    CreateAtualizarSituacaoNFSeService(),
    CreateACBrNFSeAdapter(Observer),
    NFSeConverter.Create(),
    EmailCompuser,
    EnviarEmail,
    FErrorLogger,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateConverterNFeParaContingenciaUseCase: IConverterNFeParaContingenciaUseCase;
begin
  Result := ConverterNFeParaContingenciaUseCase.Create(
		ErpFeaturesRepoContainerDFe.GetInstance().NotasFiscaisRepo,
		ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateCriarAnexosNFSeUseCase(Observer: IProgressObserver): ICriarAnexosDxNFSeUseCase;
var
  Compressor: IZipCompressorService;
  AnexoService: INFSeAnexosService;
begin
  Compressor := ZipCompressorService.Create();

  AnexoService := NFSeAnexosService.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().EmpresasRepo,
    CreateConfiguracaoNFSeService(),
    CreateACBrNFSeAdapter(Observer)
  );

  Result := CriarAnexosDxNFSeUseCase.Create(
    FSession,
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo,
    Compressor,
    AnexoService,
    FErrorLogger,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateEmitirLoteWsNFSeUseCase(Observer: IProgressObserver): IEmitirLoteWsNFSeUseCase;
var
  EmailCompuser: IEmailComposerService;
  EnviarEmail: IEnviarEmailUseCase;
  EmailService: IEmailService;
begin
  EmailService := ACBrEmailService.Create();

  EnviarEmail := EnviarEmailUseCase.Create( EmailService );

  EmailCompuser := EmailComposerService.Create();

  Result := EmitirWsNFSeUseCase.Create(
    FSession,
    FDatabaseConnection,
    ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().EmpresasRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo,
    CreateConfiguracaoNFSeService(),
    CreateAtualizarSituacaoNFSeService(),
    CreateACBrNFSeAdapter(Observer),
    NFSeConverter.Create(),
    EmailCompuser,
    EnviarEmail,
    FErrorLogger,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateEmitirWsNFSeUseCase(Observer: IProgressObserver): IEmitirWsNFSeUseCase;
var
  EmailCompuser: IEmailComposerService;
  EnviarEmail: IEnviarEmailUseCase;
  EmailService: IEmailService;
begin
  EmailService := ACBrEmailService.Create();

  EnviarEmail := EnviarEmailUseCase.Create( EmailService );

  EmailCompuser := EmailComposerService.Create();

  Result := EmitirWsNFSeUseCase.Create(
    FSession,
    FDatabaseConnection,
    ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().EmpresasRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo,
    CreateConfiguracaoNFSeService(),
    CreateAtualizarSituacaoNFSeService(),
    CreateACBrNFSeAdapter(Observer),
    NFSeConverter.Create(),
    EmailCompuser,
    EnviarEmail,
    FErrorLogger,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateEnviarEmailNFSeUseCase(Observer: IProgressObserver): IEnviarEmailNFSeUseCase;
var
  EmailCompuser: IEmailComposerService;
  Compressor: IZipCompressorService;
  EmailService: IEmailService;
  EnviarEmail: IEnviarEmailUseCase;
  AnexoService: INFSeAnexosService;
begin
  EmailCompuser := EmailComposerService.Create();

  Compressor := ZipCompressorService.Create();

  AnexoService := NFSeAnexosService.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().EmpresasRepo,
    CreateConfiguracaoNFSeService(),
    CreateACBrNFSeAdapter(Observer)
  );

  EmailService := ACBrEmailService.Create();

  EnviarEmail := EnviarEmailUseCase.Create( EmailService );

  Result := EnviarEmailNFSeUseCase.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo,
    EmailCompuser,
    Compressor,
    AnexoService,
    EnviarEmail,
    FErrorLogger,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateExisteAtualizacaoConsultasSqlUseCase(
  Observer: IProgressObserver): IExisteAtualizacaoConsultasSqlUseCase;
var
  ManifestServ: IManifestSincService;
  HashCompServ: IHashComparatorService;
  LocalHashServ: ILocalManifestHashesService;
begin
  ManifestServ := ManifestSincService.Create();

  HashCompServ := HashComparatorService.Create();

  LocalHashServ := LocalManifestHashesService.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo
  );

  Result := ExisteAtualizacaoConsultasSqlUseCase.Create(
    ManifestServ,
    HashCompServ,
    LocalHashServ,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateImprimirNFSeUseCase(Observer: IProgressObserver): IImprimirNFSeUseCase;
begin
  Result := ImprimirNFSeUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().EmpresasRepo,
    CreateConfiguracaoNFSeService(),
    nil,
    CreateACBrNFSeAdapter(Observer),
    NFSeConverter.Create(),
    FErrorLogger,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateListarRegimesEspeciaisDeTributacaoNFSeUseCase: IListarRegimesEspeciaisDeTributacaoNFSeUseCase;
var
  ACBr: IACBrNFSeAdapter;
  ConfigReader: IConfigReader;
  LoggerNFSe: ISimpleLogger;
  Converter: INFSeConverter;
begin
  ConfigReader := IniConfigReaderAndWriter.Create( FileConfig.Create(ExtractFilePath(ParamStr(0)), 'Config.ini') );
  LoggerNFSe  := SimpleFileLogger.Create( FileConfig.Create(ExtractFilePath(ParamStr(0)), 'NFSe.log' ) );

  ACBr := ACBrNFSeAdapter.Create(
    FSession,
    ConfigReader,
    LoggerNFSe,
    nil
  );
  Result := ListarRegimesEspeciaisDeTributacaoNFSeUseCase.Create(
    FErrorLogger,
    CreateConfiguracaoNFSeService(),
    ACBr,
    ErpFeaturesRepoContainerDFe.GetInstance().EmpresasRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateListarTributosNFCePorIdUseCase: IListarTributosNFCePorIdUseCase;
begin
  Result := ListarTributosNFCe.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateListarTributosNFePorIdUseCase(): IListarTributosNFePorIdUseCase;
begin
  Result := ListarTributosNFe.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateObterArquivosFiscaisModificadosUseCase: IObterArquivosFiscaisModificadosUseCase;
begin
  Result := ObterArquivosFiscaisModificadosUseCase.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateObterAtualizacaoCalculadoraUseCase(
  Observer: IProgressObserver): IObterAtualizacaoCalculadoraUseCase;
var
  Http: IHttpJsonClient;
  ControleApi: IControleVersaoCalculadoraApi;
  TokenDecryptor: ITokenDecryptor;
begin
  Http := NetHttpJsonClient.Create();
  ControleApi := ControleVersaoCalculadoraApi.Create(Http);
  TokenDecryptor := TwofishTokenDecryptor.Create(TWOFISH_SECRET_KEY);

  Result := ObterAtualizacaoCalculadoraUseCase.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo,
    ControleApi,
    TokenDecryptor,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateObterPendenciaNFeSefazUseCase: IObterPendenciaNFeSefazUseCase;
begin
  Result := ObterPendenciaNFeSefazUseCase.Create(
		ErpFeaturesRepoContainerDFe.GetInstance().NotasFiscaisRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateRegistrarDFeAlertasUseCase: IRegistrarDFeAlertasUseCase;
begin
  Result := RegistrarDFeAlertasUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainerDFe.GetInstance().DFeAlertasRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateRemoverTributoDFeUseCase: IRemoverTributoDFeUseCase;
begin
  Result := RemoverTributoDFeUseCase.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateSalvarPdfNFSeUseCase(Observer: IProgressObserver): ISalvarPdfNFSeUseCase;
begin
  Result := SalvarPdfNFSeUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainerDFe.GetInstance().NFSeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo,
    ErpFeaturesRepoContainerDFe.GetInstance().EmpresasRepo,
    CreateConfiguracaoNFSeService(),
    nil,
    CreateACBrNFSeAdapter(Observer),
    NFSeConverter.Create(),
    FErrorLogger,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateSalvarTributoDFeUseCase: ISalvarTributoDFeUseCase;
begin
  Result := SalvarTributoDFeUseCase.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().TributosDFeRepo
  );
end;

function ErpFeaturesFactoryDFe.CreateSincronizarCalculadoraUseCase(
  Observer: IProgressObserver): ISincronizarCalculadoraUseCase;
var
  ConfigRepo: IConfiguracoesRepository;
  Http: IHttpJsonClient;
  ControleApi: IControleVersaoCalculadoraApi;
  Reader: IDadosFiscaisReader;
  Writer: IDadosFiscaisWriter;
  Sincronizador: ISincronizadorCalculadoraService;
  Lock: ISincronizacaoCalculadoraLockService;
  TokenDecryptor: ITokenDecryptor;
begin
  ConfigRepo := ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo;

  Http := NetHttpJsonClient.Create();
  ControleApi := ControleVersaoCalculadoraApi.Create(Http);
  Reader := CalculadoraApiReader.Create(Http);
  Writer := ERPWriter.Create( FDatabaseConnection );
  Sincronizador := SincronizadorCalculadoraService.Create( Observer, Reader, Writer );
  Lock := SincronizacaoCalculadoraLockService.Create( ConfigRepo );
  TokenDecryptor := TwofishTokenDecryptor.Create(TWOFISH_SECRET_KEY);

  Result := SincronizarCalculadoraUseCase.Create(
    FDatabaseConnection,
    ConfigRepo,
    Observer,
    Sincronizador,
    Lock,
    ControleApi,
    TokenDecryptor,
    Reader
  );
end;

function ErpFeaturesFactoryDFe.CreateSincronizarConsultasSqlUseCase(
  Observer: IProgressObserver): ISincronizarConsultasSqlUseCase;
var
  ManifestServ: IManifestSincService;
  Downloader: IDownloadService;
  HashCompServ: IHashComparatorService;
  LocalHashServ: ILocalManifestHashesService;
begin
  ManifestServ := ManifestSincService.Create();

  Downloader := DownloadService.Create();

  HashCompServ := HashComparatorService.Create();

  LocalHashServ := LocalManifestHashesService.Create(
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo
  );

  Result := SincronizarConsultasSqlUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainerDFe.GetInstance().ConsultasSqlRepo,
    ManifestServ,
    Downloader,
    HashCompServ,
    LocalHashServ,
    Observer
  );
end;

function ErpFeaturesFactoryDFe.CreateSincronizarDadosFiscaisUseCase(
  Observer: IProgressObserver): ISincronizarDadosFiscaisUseCase;
var
  ReaderNCMsSICOMEX: INcmReader;
  ReaderTabelaIBPT: IIbptReader;
  ReaderFiscalNFSe: ITabelasFiscaisNFSeReader;
  ReaderCSV: ICSVReader;
  WriterERP: IDadosFiscaisWriter;
  WriterNCM: INcmWriter;
  WriterIBPT: IIbptWriter;
  WriterCorrelNFSe: ITabelasFiscaisNFSeWriter;
  Downloader: IDownloadService;
  SincronizadorNCMsSICOMEX: ISincronizadorNCMsSICOMEXService;
  SincronizadorTabelaIBPT: ISincronizadorTabelaIbptService;
  SincronizadorFiscalNFSe: ISincronizadorFiscalNFSeService;
begin
  Downloader := DownloadService.Create();
  WriterERP := ERPWriter.Create( FDatabaseConnection );
  WriterNCM := WriterERP as INcmWriter;
  WriterIBPT := WriterERP as IIbptWriter;
  WriterCorrelNFSe := WriterERP as ITabelasFiscaisNFSeWriter;

  ReaderNCMsSICOMEX := NCMJsonReader.Create();

  SincronizadorNCMsSICOMEX := SincronizadorNCMsSICOMEXService.Create(
    Observer,
    ReaderNCMsSICOMEX,
    WriterNCM
  );

  ReaderCSV := CSVFileReader.Create();
  ReaderTabelaIBPT := IbptCsvReader.Create( ReaderCSV );

  SincronizadorTabelaIBPT := SincronizadorTabelaIbptService.Create(
    ReaderTabelaIBPT,
    WriterIBPT,
    Observer
  );

  ReaderFiscalNFSe := TabelasFiscaisNFSeCsvReader.Create(ReaderCSV);

  SincronizadorFiscalNFSe := SincronizadorFiscalNFSeService.Create(
    ReaderFiscalNFSe,
    WriterCorrelNFSe,
    Observer
  );

  Result := SincronizarDadosFiscaisUseCase.Create(
    FDatabaseConnection,
    ErpFeaturesRepoContainerDFe.GetInstance().ConfiguracoesRepo,
    Observer,
    Downloader,
    SincronizadorNCMsSICOMEX,
    SincronizadorTabelaIBPT,
    SincronizadorFiscalNFSe
  );
end;

initialization

finalization
  ErpFeaturesRepoContainerDFe.ReleaseInstance();

end.
