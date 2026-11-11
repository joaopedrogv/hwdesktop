unit NextSetup;

interface

uses
  System.SysUtils, FireDACDatabaseConnectionUnit,
  IDataBaseConnectionUnit, IDataSetReaderUnit, ISessionContextUnit,
  SessionContextUnit, Spring.Container;

const
  MissingContextMessage = 'O contexto da empresa nao foi informado.';

type
  // Possui o contexto ERP recebido, a conexao/adaptador FireDAC do Next, a
  // fabrica de leitores e o container Spring4D usado somente na composicao.
  // Nunca abre a conexao em SetContext; o adaptador a abre na primeira busca.
  // A identidade da empresa/usuario fica em SessionContext. As credenciais
  // tecnicas ficam somente na string de conexao mantida pelo adaptador.
  // O adaptador, a fabrica e o container sao montados no primeiro contexto e
  // reutilizados enquanto o banco, identificado por um resumo da conexao,
  // permanecer o mesmo.
  // Nenhum logger e associado, portanto falhas do adaptador nao sao registradas
  // e sao substituidas por mensagens constantes.
  TNextSetup = class
  private
    FSessionContext: ISessionContext;
    FAdapter: FireDACDatabaseConnection;
    FReaderFactory: ISqlDataSetReaderFactory;
    FContainer: TContainer;
    FContextSet: Boolean;
    FDatabaseFingerprint: string;
    function GetAdapter: IDataBaseConnection;
    function BuildConnectionString(const ADatabaseName, ADatabaseUserName,
      ADatabasePassword: string): string;
    function BuildDatabaseFingerprint(const AConnectionString: string): string;
    procedure ClearContext;
    procedure ValidateValue(const AValue: string);
  public
    constructor Create;
    procedure SetContext(ACompanyCode: Integer;
      const AUserLogin, ADatabaseName, ADatabaseUserName,
      ADatabasePassword: string);
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
  // por TFDQuery e TFDTransaction. System.Hash gera a identificacao da
  // configuracao do banco sem reter usuario ou senha.
  System.Hash, FireDAC.DApt, FireDAC.Phys.FB, NextFeaturesComposition;

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

function TNextSetup.BuildDatabaseFingerprint(
  const AConnectionString: string): string;
begin
  // A identificacao resume a configuracao completa recebida. Ela permite
  // comparar o banco entre contextos sem reter a string de conexao, que contem
  // as credenciais tecnicas.
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

procedure TNextSetup.SetContext(ACompanyCode: Integer;
  const AUserLogin, ADatabaseName, ADatabaseUserName,
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

  ConnectionString := BuildConnectionString(ADatabaseName, ADatabaseUserName,
    ADatabasePassword);
  DatabaseFingerprint := BuildDatabaseFingerprint(ConnectionString);

  if FContextSet then
  begin
    // A empresa e o login podem mudar durante a vida do modulo, mas o banco
    // permanece o mesmo. O adaptador, a fabrica de leitores, o container e a
    // instancia de sessao sao preservados; somente a identidade e atualizada.
    if (FAdapter = nil) or (FReaderFactory = nil) or (FContainer = nil) or
      (FSessionContext = nil) or (FDatabaseFingerprint = '') then
      raise Exception.Create(InvalidContextMessage);
    if DatabaseFingerprint <> FDatabaseFingerprint then
      raise Exception.Create(InvalidContextMessage);

    FSessionContext.SetEmpresa(ACompanyCode, '', '');
    FSessionContext.SetUsuario(0, AUserLogin, '');
    Exit;
  end;

  // Primeiro contexto: remove qualquer estado parcial de uma tentativa anterior
  // antes de montar a conexao e o container.
  Release;

  try
    FAdapter := FireDACDatabaseConnection.Create(nil);
    FAdapter.SetConnectionString(ConnectionString);

    // A fabrica reutiliza a conexao do adaptador; nenhum dos dois abre a
    // conexao aqui. A mesma fabrica e o mesmo adaptador sao preservados nos
    // contextos seguintes.
    FReaderFactory := TFireDACDataSetReaderFactory.Create(FAdapter);

    // O container e montado somente no primeiro contexto. Ele compoe as
    // instancias recebidas e nao abre a conexao; a abertura continua sob
    // demanda. Trocas posteriores de empresa/login reutilizam esta composicao.
    FContainer := TContainer.Create;
    FContainer.RegisterInstance<ISessionContext>(FSessionContext);
    FContainer.RegisterInstance<IDataBaseConnection>(FAdapter);
    FContainer.RegisterInstance<ISqlDataSetReaderFactory>(FReaderFactory);
    RegisterNextFeatures(FContainer);
    FContainer.Build;
  except
    // Sem servicos parciais: o container e liberado antes da fabrica e do
    // adaptador, que possui a conexao; o contexto permanece vazio para a
    // proxima tentativa de login.
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

  // A identidade so e publicada depois da validacao e da montagem da conexao e
  // do container. Somente empresa e login pertencem a sessao Next; nome, CNPJ,
  // id e email nao sao recebidos pelo modulo.
  FDatabaseFingerprint := DatabaseFingerprint;
  FSessionContext.SetEmpresa(ACompanyCode, '', '');
  FSessionContext.SetUsuario(0, AUserLogin, '');
  FContextSet := True;
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
  // Uma consulta ativa depende da conexao e da fabrica de leitores. O chamador
  // deve liberar as telas e os leitores antes que o Setup libere o adaptador.
  // O container e liberado primeiro porque pode manter a consulta, que referencia
  // a fabrica e o adaptador; depois a fabrica e, por ultimo, o adaptador, que
  // possui a conexao.
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
    // A fabrica e liberada antes do adaptador, pois cria leitores que usam a
    // conexao dele.
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
