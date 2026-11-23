unit NextSetup;

interface

uses
  System.SysUtils, FireDACDatabaseConnectionUnit,
  IDataBaseConnectionUnit, IDataSetReaderUnit, IDataSetSorterUnit,
  ISessionContextUnit, SessionContextUnit, Spring.Container;

type
  // SetSession publica somente a identidade e nunca abre a conexao. A infraestrutura nasce no primeiro Initialize, que
  // tambem prepara os processos Next da empresa atual.
  TNextSetup = class
  private
    FSessionContext: ISessionContext;
    FAdapter: FireDACDatabaseConnection;
    FReaderFactory: ISqlDataSetReaderFactory;
    FContainer: TContainer;
    FSessionSet: Boolean;
    FInfrastructureReady: Boolean;
    FDatabaseFingerprint: string;
    FPreparedCompany: Integer;
    function GetIsAvailable: Boolean;
    function BuildConnectionString(const ADatabaseName, ADatabaseUserName, ADatabasePassword: string): string;
    function BuildDatabaseFingerprint(const AConnectionString: string): string;
    procedure ClearInfrastructure;
    procedure ValidateValue(const AValue: string);
    procedure PrepareProcesses;
  public
    constructor Create;
    procedure SetSession(ACompanyCode: Integer; const AUserLogin: string);
    procedure Initialize(const ADatabaseName, ADatabaseUserName, ADatabasePassword: string);
    procedure Release;
    function Resolve<T>: T;
    property SessionContext: ISessionContext read FSessionContext;
    property HasSession: Boolean read FSessionSet;
    property IsAvailable: Boolean read GetIsAvailable;
  end;

var
  NextSetupInstance: TNextSetup;

implementation

uses
  // FireDAC.Phys.FB registra o driver Firebird usado na primeira conexao; FireDAC.DApt fornece TFDQuery/TFDTransaction.
  // System.Hash identifica o banco sem reter usuario ou senha.
  System.Hash, NextFeaturesComposition,
  RegistrarProcessosUseCaseUnit, FireDACDataSetSorterUnit, QueryResultOperations,
  IConfigReaderAndWriterUnit, IniConfigReaderAndWriterUnit, FileConfigUnit;

const
  InvalidSessionMessage = 'O contexto da empresa nao foi aceito.';
  SessionRequiredMessage = 'A sessao da empresa nao foi informada.';
  InvalidDatabaseConfigMessage = 'A configuracao do banco de dados nao foi informada.';
  DatabaseChangedMessage = 'O Next ja foi inicializado com outro banco de dados nesta execucao.';

constructor TNextSetup.Create;
begin
  inherited Create;
  FSessionContext := SessionContextUnit.SessionContext.Create;
end;

function TNextSetup.GetIsAvailable: Boolean;
begin
  Result := (FSessionContext <> nil) and FSessionSet and FInfrastructureReady and (FContainer <> nil) and
    (FPreparedCompany > 0) and (FPreparedCompany = FSessionContext.EmpresaId);
end;

procedure TNextSetup.ValidateValue(const AValue: string);
begin
  // O adaptador interpreta a string como lista separada por ponto e virgula, sem aspas nem escape; por isso o valor com
  // delimitador e rejeitado.
  if (Pos(';', AValue) > 0) or (Pos(#13, AValue) > 0) or (Pos(#10, AValue) > 0) or (Pos(#0, AValue) > 0) then
    raise Exception.Create('A configuracao do banco de dados contem caracteres nao suportados.');
end;

function TNextSetup.BuildConnectionString(const ADatabaseName, ADatabaseUserName, ADatabasePassword: string): string;
begin
  // Mapeamento exato: nenhum Server, Port ou Charset e criado. O proprio adaptador define SQLDialect=3.
  Result := 'DriverID=FB;DatabaseName=' + ADatabaseName + ';UserName=' +
    ADatabaseUserName + ';Password=' + ADatabasePassword;
end;

function TNextSetup.BuildDatabaseFingerprint(const AConnectionString: string): string;
begin
  // O resumo permite comparar o banco entre inicializacoes sem reter a string de conexao, que contem as credenciais
  // tecnicas.
  Result := THashSHA2.GetHashString(AConnectionString);
end;

procedure TNextSetup.ClearInfrastructure;
var
  Adapter: FireDACDatabaseConnection;
  Container: TContainer;
begin
  FInfrastructureReady := False;
  FDatabaseFingerprint := '';
  FPreparedCompany := 0;

  // Consultas ativas dependem da conexao e da fabrica: o chamador deve liberar telas e leitores antes. O container sai
  // primeiro, depois a fabrica e por ultimo o adaptador, que possui a conexao.
  Container := FContainer;
  FContainer := nil;
  if Container <> nil then
  begin
    try
      Container.Free;
    except
    end;
  end;

  FReaderFactory := nil;

  Adapter := FAdapter;
  FAdapter := nil;
  if Adapter <> nil then
  begin
    try
      Adapter.Disconnect;
    except
    end;
    try
      Adapter.Free;
    except
    end;
  end;
end;

procedure TNextSetup.SetSession(ACompanyCode: Integer; const AUserLogin: string);
var
  IdentityChanged: Boolean;
begin
  if (ACompanyCode <= 0) or (Trim(AUserLogin) = '') or (Pos(#0, AUserLogin) > 0) then
    raise Exception.Create(InvalidSessionMessage);
  if FSessionContext = nil then
    raise Exception.Create(InvalidSessionMessage);

  IdentityChanged := (not FSessionSet) or (FSessionContext.EmpresaId <> ACompanyCode) or
    (FSessionContext.UsuarioLogin <> AUserLogin);

  FSessionContext.SetEmpresa(ACompanyCode, '', '');
  FSessionContext.SetUsuario(0, AUserLogin, '');
  FSessionSet := True;

  if IdentityChanged then
    FPreparedCompany := 0;
end;

procedure TNextSetup.Initialize(const ADatabaseName, ADatabaseUserName, ADatabasePassword: string);
var
  ConnectionString: string;
  DatabaseFingerprint: string;
  ConfigFile: FileConfig;
  ConfigReaderWriter: IniConfigReaderAndWriter;
begin
  if not FSessionSet then
    raise Exception.Create(SessionRequiredMessage);

  if (Trim(ADatabaseName) = '') or (Trim(ADatabaseUserName) = '') or (Trim(ADatabasePassword) = '') then
    raise Exception.Create(InvalidDatabaseConfigMessage);

  ValidateValue(ADatabaseName);
  ValidateValue(ADatabaseUserName);
  ValidateValue(ADatabasePassword);

  ConnectionString := BuildConnectionString(ADatabaseName, ADatabaseUserName, ADatabasePassword);
  DatabaseFingerprint := BuildDatabaseFingerprint(ConnectionString);

  if FInfrastructureReady and
    ((FAdapter = nil) or (FReaderFactory = nil) or (FContainer = nil) or (FDatabaseFingerprint = '')) then
    ClearInfrastructure;

  if FInfrastructureReady then
  begin
    if FDatabaseFingerprint <> DatabaseFingerprint then
    begin
      FPreparedCompany := 0;
      raise Exception.Create(DatabaseChangedMessage);
    end;
  end
  else
  begin
    ClearInfrastructure;
    try
      FAdapter := FireDACDatabaseConnection.Create(nil);
      FAdapter.SetConnectionString(ConnectionString);

      // A fabrica reutiliza a conexao do adaptador, que o primeiro Initialize abre uma unica vez.
      FReaderFactory := TFireDACDataSetReaderFactory.Create(FAdapter);

      FContainer := TContainer.Create;
      FContainer.RegisterInstance<ISessionContext>(FSessionContext);
      FContainer.RegisterInstance<IDataBaseConnection>(FAdapter);
      FContainer.RegisterInstance<ISqlDataSetReaderFactory>(FReaderFactory);

      // Sem Config.ini ao lado do executavel, o leitor entrega os valores padrao.
      ConfigFile := FileConfig.Create(ExtractFilePath(ParamStr(0)), 'Config.ini');
      if FileExists(ConfigFile.FullFileName) then
        ConfigReaderWriter := IniConfigReaderAndWriter.Create(ConfigFile)
      else
        ConfigReaderWriter := IniConfigReaderAndWriter.Create(nil);
      FContainer.RegisterInstance<IConfigReader>(ConfigReaderWriter);

      FContainer.RegisterType<IDataSetSorter, TFireDACDataSetSorter>().AsSingleton;
      FContainer.RegisterType<IQueryResultOperations, TQueryResultOperations>().AsTransient;

      RegisterNextFeatures(FContainer);
      FContainer.Build;

      FAdapter.EnsureConnection;

      FDatabaseFingerprint := DatabaseFingerprint;
      FInfrastructureReady := True;
    except
      // Nenhum objeto parcial fica acessivel; a sessao recebida nao e tocada.
      ClearInfrastructure;
      raise;
    end;
  end;

  if FPreparedCompany <> FSessionContext.EmpresaId then
    PrepareProcesses;
end;

procedure TNextSetup.PrepareProcesses;
var
  UseCase: IRegistrarProcessosUseCase;
begin
  UseCase := FContainer.Resolve<IRegistrarProcessosUseCase>;
  UseCase.Executar(FSessionContext.EmpresaId);
  FPreparedCompany := FSessionContext.EmpresaId;
end;

function TNextSetup.Resolve<T>: T;
begin
  if (not FInfrastructureReady) or (FContainer = nil) then
    raise Exception.Create('A infraestrutura do Next nao foi inicializada.');
  if not IsAvailable then
    raise Exception.Create('O Next nao esta disponivel para a empresa atual.');

  Result := FContainer.Resolve<T>;
end;

procedure TNextSetup.Release;
begin
  // A identidade publicada sobrevive a liberacao da infraestrutura.
  ClearInfrastructure;
end;

initialization
  NextSetupInstance := TNextSetup.Create;

finalization
  if NextSetupInstance <> nil then
  begin
    NextSetupInstance.Release;
    NextSetupInstance.Free;
    NextSetupInstance := nil;
  end;

end.
