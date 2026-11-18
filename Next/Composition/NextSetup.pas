unit NextSetup;

interface

uses
  System.SysUtils, FireDACDatabaseConnectionUnit,
  IDataBaseConnectionUnit, IDataSetReaderUnit, IDataSetSorterUnit,
  ISessionContextUnit, SessionContextUnit, Spring.Container;

type
  // Possui o adaptador FireDAC, a fabrica de leitores e o container da composicao. Nunca abre a conexao em SetContext:
  // a identidade fica em SessionContext e as credenciais apenas na string de conexao do adaptador. Adaptador, fabrica e
  // container sobrevivem a troca de empresa/login enquanto o banco, identificado por um resumo da conexao, for o mesmo.
  TNextSetup = class
  private
    FSessionContext: ISessionContext;
    FAdapter: FireDACDatabaseConnection;
    FReaderFactory: ISqlDataSetReaderFactory;
    FContainer: TContainer;
    FContextSet: Boolean;
    FDatabaseFingerprint: string;
    function GetAdapter: IDataBaseConnection;
    function BuildConnectionString(const ADatabaseName, ADatabaseUserName, ADatabasePassword: string): string;
    function BuildDatabaseFingerprint(const AConnectionString: string): string;
    procedure ClearContext;
    procedure ValidateValue(const AValue: string);
  public
    constructor Create;
    procedure SetContext(ACompanyCode: Integer; const AUserLogin, ADatabaseName, ADatabaseUserName,
      ADatabasePassword: string);
    procedure Release;
    function Resolve<T>: T;
    property Adapter: IDataBaseConnection read GetAdapter;
    property SessionContext: ISessionContext read FSessionContext;
    property HasContext: Boolean read FContextSet;
  end;

var
  NextSetupInstance: TNextSetup;

implementation

uses
  // FireDAC.Phys.FB registra o driver Firebird usado na primeira conexao; FireDAC.DApt fornece TFDQuery/TFDTransaction.
  // System.Hash identifica o banco sem reter usuario ou senha.
  System.Hash, FireDAC.DApt, FireDAC.Phys.FB, NextFeaturesComposition,
  FireDACDataSetSorterUnit, QueryResultOperations;

const
  InvalidContextMessage = 'O contexto da empresa nao foi aceito.';

constructor TNextSetup.Create;
begin
  inherited Create;
  FSessionContext := SessionContextUnit.SessionContext.Create;
end;

function TNextSetup.GetAdapter: IDataBaseConnection;
begin
  Result := FAdapter;
end;

procedure TNextSetup.ValidateValue(const AValue: string);
begin
  // O adaptador interpreta a string como lista separada por ponto e virgula, sem aspas nem escape; por isso o valor com
  // delimitador e rejeitado.
  if (Pos(';', AValue) > 0) or (Pos(#13, AValue) > 0) or (Pos(#10, AValue) > 0) or (Pos(#0, AValue) > 0) then
    raise Exception.Create('O contexto da empresa contem caracteres nao suportados.');
end;

function TNextSetup.BuildConnectionString(const ADatabaseName, ADatabaseUserName, ADatabasePassword: string): string;
begin
  ValidateValue(ADatabaseName);
  ValidateValue(ADatabaseUserName);
  ValidateValue(ADatabasePassword);
  // Mapeamento exato: nenhum Server, Port ou Charset e criado. O proprio adaptador define SQLDialect=3.
  Result := 'DriverID=FB;DatabaseName=' + ADatabaseName + ';UserName=' +
    ADatabaseUserName + ';Password=' + ADatabasePassword;
end;

function TNextSetup.BuildDatabaseFingerprint(const AConnectionString: string): string;
begin
  // O resumo permite comparar o banco entre contextos sem reter a string de conexao, que contem as credenciais
  // tecnicas.
  Result := THashSHA2.GetHashString(AConnectionString);
end;

procedure TNextSetup.ClearContext;
begin
  FContextSet := False;
  FDatabaseFingerprint := '';
  if FSessionContext <> nil then
  begin
    // A SessionContext guarda somente a identidade; credenciais nao passam por ela.
    FSessionContext.SetEmpresa(0, '', '');
    FSessionContext.SetUsuario(0, '', '');
  end;
end;

procedure TNextSetup.SetContext(ACompanyCode: Integer; const AUserLogin, ADatabaseName, ADatabaseUserName,
  ADatabasePassword: string);
var
  ConnectionString: string;
  DatabaseFingerprint: string;
begin
  if ACompanyCode <= 0 then
    raise Exception.Create(InvalidContextMessage);
  if Trim(AUserLogin) = '' then
    raise Exception.Create(InvalidContextMessage);
  if Trim(ADatabaseName) = '' then
    raise Exception.Create(InvalidContextMessage);
  if Trim(ADatabaseUserName) = '' then
    raise Exception.Create(InvalidContextMessage);
  if Trim(ADatabasePassword) = '' then
    raise Exception.Create(InvalidContextMessage);

  ValidateValue(ADatabaseName);
  ValidateValue(ADatabaseUserName);
  ValidateValue(ADatabasePassword);

  ConnectionString := BuildConnectionString(ADatabaseName, ADatabaseUserName, ADatabasePassword);
  DatabaseFingerprint := BuildDatabaseFingerprint(ConnectionString);

  if FContextSet then
  begin
    // A empresa e o login podem mudar, mas o banco precisa ser o mesmo: apenas a identidade e atualizada.
    if (FAdapter = nil) or (FReaderFactory = nil) or (FContainer = nil) or
      (FSessionContext = nil) or (FDatabaseFingerprint = '') then
      raise Exception.Create(InvalidContextMessage);
    if DatabaseFingerprint <> FDatabaseFingerprint then
      raise Exception.Create(InvalidContextMessage);

    FSessionContext.SetEmpresa(ACompanyCode, '', '');
    FSessionContext.SetUsuario(0, AUserLogin, '');
    Exit;
  end;

  Release;

  try
    FAdapter := FireDACDatabaseConnection.Create(nil);
    FAdapter.SetConnectionString(ConnectionString);

    // A fabrica reutiliza a conexao do adaptador, que so abre na primeira busca.
    FReaderFactory := TFireDACDataSetReaderFactory.Create(FAdapter);

    // A composicao e montada uma unica vez e reaproveitada nos contextos seguintes.
    FContainer := TContainer.Create;
    FContainer.RegisterInstance<ISessionContext>(FSessionContext);
    FContainer.RegisterInstance<IDataBaseConnection>(FAdapter);
    FContainer.RegisterInstance<ISqlDataSetReaderFactory>(FReaderFactory);

    FContainer.RegisterType<IDataSetSorter, TFireDACDataSetSorter>().AsSingleton;
    FContainer.RegisterType<IQueryResultOperations, TQueryResultOperations>().AsTransient;

    RegisterNextFeatures(FContainer);
    FContainer.Build;
  except
    // O container sai antes da fabrica e do adaptador, que possui a conexao; o contexto fica vazio para o proximo
    // login.
    try
      FreeAndNil(FContainer);
    finally
      try
        FReaderFactory := nil;
      finally
        try
          FreeAndNil(FAdapter);
        finally
          ClearContext;
        end;
      end;
    end;
    raise;
  end;

  // Somente empresa e login compoem a sessao Next; os demais dados nao chegam ao modulo.
  FDatabaseFingerprint := DatabaseFingerprint;
  FSessionContext.SetEmpresa(ACompanyCode, '', '');
  FSessionContext.SetUsuario(0, AUserLogin, '');
  FContextSet := True;
end;

function TNextSetup.Resolve<T>: T;
begin
  if (not FContextSet) or (FContainer = nil) then
    raise Exception.Create('O contexto da empresa nao foi informado.');

  Result := FContainer.Resolve<T>;
end;

procedure TNextSetup.Release;
var
  Adapter: FireDACDatabaseConnection;
  Container: TContainer;
begin
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

  Adapter := FAdapter;
  FAdapter := nil;

  try
    FReaderFactory := nil;

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
  finally
    ClearContext;
  end;
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
