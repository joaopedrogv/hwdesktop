unit NextSetup;

interface

uses
  System.SysUtils, FireDACDatabaseConnectionUnit,
  IDataBaseConnectionUnit, ISessionContextUnit, SessionContextUnit,
  Spring.Container;

const
  MissingContextMessage = 'O contexto da empresa nao foi informado.';

type
  // Possui o contexto ERP recebido, a conexao/adaptador FireDAC do Next e o
  // container Spring4D usado somente na composicao. Nunca abre a conexao em
  // SetContext; o adaptador a abre na primeira busca.
  // A identidade da empresa/usuario fica em SessionContext. As credenciais
  // tecnicas ficam somente na string de conexao mantida pelo adaptador.
  // Nenhum logger e associado, portanto falhas do adaptador nao sao registradas
  // e sao substituidas por mensagens constantes.
  TNextSetup = class
  private
    FSessionContext: ISessionContext;
    FAdapter: FireDACDatabaseConnection;
    FContainer: TContainer;
    FContextSet: Boolean;
    function GetAdapter: IDataBaseConnection;
    function BuildConnectionString(const ADatabaseName, ADatabaseUserName,
      ADatabasePassword: string): string;
    procedure ClearContext;
    procedure ValidateValue(const AValue: string);
  public
    constructor Create;
    procedure SetContext(ACompanyCode: Integer;
      const AUserLogin, ADatabaseName, ADatabaseUserName,
      ADatabasePassword: string);
    function MatchesContext(ACompanyCode: Integer;
      const AUserLogin, ADatabaseName, ADatabaseUserName,
      ADatabasePassword: string): Boolean;
    procedure Release;
    function Resolve<T: class>: T;
    property Adapter: IDataBaseConnection read GetAdapter;
    property SessionContext: ISessionContext read FSessionContext;
    property HasContext: Boolean read FContextSet;
  end;

var
  NextSetupInstance: TNextSetup;

implementation

uses
  // Registra o driver fisico Firebird no modulo Rio; sem esta unit o DriverID=FB
  // nao e resolvido na primeira conexao. FireDAC.DApt fornece o suporte usado
  // por TFDQuery e TFDTransaction.
  FireDAC.DApt, FireDAC.Phys.FB, NextFeaturesComposition;

const
  InvalidContextMessage = 'O contexto da empresa nao foi aceito.';
  InvalidValueMessage = 'O contexto da empresa contem caracteres nao suportados.';

{ TNextSetup }

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
  // O adaptador analisa uma lista separada por ponto e virgula com TStringList
  // e nao oferece aspas nem escape. Um delimitador mudaria o mapeamento; por
  // isso, o valor e rejeitado em vez de receber aspas, ser truncado ou reescrito.
  if (Pos(';', AValue) > 0) or (Pos(#13, AValue) > 0) or
    (Pos(#10, AValue) > 0) or (Pos(#0, AValue) > 0) then
    raise Exception.Create(InvalidValueMessage);
end;

function TNextSetup.BuildConnectionString(const ADatabaseName,
  ADatabaseUserName, ADatabasePassword: string): string;
begin
  ValidateValue(ADatabaseName);
  ValidateValue(ADatabaseUserName);
  ValidateValue(ADatabasePassword);
  // Mapeamento exato: nenhum Server, Port ou Charset e criado. O proprio
  // adaptador define SQLDialect=3.
  Result := 'DriverID=FB;DatabaseName=' + ADatabaseName + ';UserName=' +
    ADatabaseUserName + ';Password=' + ADatabasePassword;
end;

procedure TNextSetup.ClearContext;
begin
  FContextSet := False;
  if FSessionContext <> nil then
  begin
    // A SessionContext guarda somente a identidade; credenciais nao passam por ela.
    FSessionContext.SetEmpresa(0, '', '');
    FSessionContext.SetUsuario(0, '', '');
  end;
end;

procedure TNextSetup.SetContext(ACompanyCode: Integer;
  const AUserLogin, ADatabaseName, ADatabaseUserName,
  ADatabasePassword: string);
var
  ConnectionString: string;
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

  Release;

  ConnectionString := BuildConnectionString(ADatabaseName, ADatabaseUserName,
    ADatabasePassword);
  try
    FAdapter := FireDACDatabaseConnection.Create(nil);
    FAdapter.SetConnectionString(ConnectionString);

    // O container e recriado a cada contexto. Ele apenas compoe as instancias
    // recebidas e nao abre a conexao; a abertura continua sob demanda.
    FContainer := TContainer.Create;
    FContainer.RegisterInstance<ISessionContext>(FSessionContext);
    FContainer.RegisterInstance<IDataBaseConnection>(FAdapter);
    RegisterNextFeatures(FContainer);
    FContainer.Build;
  except
    // Sem servicos parciais: o container e liberado antes do adaptador e o
    // contexto permanece vazio para a proxima tentativa de login.
    try
      FreeAndNil(FContainer);
    finally
      try
        FreeAndNil(FAdapter);
      finally
        ClearContext;
      end;
    end;
    raise;
  end;

  // A identidade so e publicada depois da validacao e da montagem da conexao e
  // do container. Somente empresa e login pertencem a sessao Next; nome, CNPJ,
  // id e email nao sao recebidos pelo modulo.
  FSessionContext.SetEmpresa(ACompanyCode, '', '');
  FSessionContext.SetUsuario(0, AUserLogin, '');
  FContextSet := True;
end;

function TNextSetup.MatchesContext(ACompanyCode: Integer;
  const AUserLogin, ADatabaseName, ADatabaseUserName,
  ADatabasePassword: string): Boolean;
begin
  Result := False;
  if (not FContextSet) or (FSessionContext = nil) or (FAdapter = nil) then
    Exit;

  Result := (FSessionContext.EmpresaId = ACompanyCode) and
    (FSessionContext.UsuarioLogin = AUserLogin);
end;

function TNextSetup.Resolve<T>: T;
begin
  if (not FContextSet) or (FContainer = nil) then
    raise Exception.Create(MissingContextMessage);

  Result := FContainer.Resolve<T>;
end;

procedure TNextSetup.Release;
var
  Adapter: FireDACDatabaseConnection;
  Container: TContainer;
begin
  // Uma consulta ativa depende da conexao. O chamador deve liberar as telas e
  // os leitores antes que o Setup libere o adaptador, que possui a conexao.
  // O container e liberado primeiro porque pode manter a consulta, que referencia
  // o adaptador; depois o adaptador e a conexao sao liberados.
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
