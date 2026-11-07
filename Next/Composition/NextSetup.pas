unit NextSetup;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDACDatabaseConnectionUnit,
  IDataBaseConnectionUnit;

type
  // Possui o contexto ERP recebido e a conexao/adaptador FireDAC do Next. Nunca
  // abre a conexao em SetContext; EnsureConnection faz isso na primeira busca.
  // Nenhum logger e associado, portanto falhas do adaptador nao sao registradas
  // e sao substituidas por mensagens constantes.
  TNextSetup = class
  private
    FCompanyCode: Integer;
    FDatabaseName: string;
    FUserName: string;
    FPassword: string;
    FConnection: TFDConnection;
    FAdapter: FireDACDatabaseConnection;
    FContextSet: Boolean;
    FActiveConsumers: Integer;
    function GetAdapter: IDataBaseConnection;
    function GetContextInUse: Boolean;
    function BuildConnectionString: string;
    procedure ClearContext;
    procedure ValidateValue(const AValue: string);
  public
    procedure SetContext(ACompanyCode: Integer;
      const ADatabaseName, AUserName, APassword: string);
    function MatchesContext(ACompanyCode: Integer;
      const ADatabaseName, AUserName, APassword: string): Boolean;
    procedure AcquireContext;
    procedure ReleaseContext;
    procedure EnsureConnection;
    procedure Release;
    property Adapter: IDataBaseConnection read GetAdapter;
    property CompanyCode: Integer read FCompanyCode;
    property Connection: TFDConnection read FConnection;
    property HasContext: Boolean read FContextSet;
    property ContextInUse: Boolean read GetContextInUse;
  end;

var
  NextSetupInstance: TNextSetup;

implementation

uses
  // Registra o driver fisico Firebird no modulo Rio; sem esta unit o DriverID=FB
  // nao e resolvido na primeira conexao. FireDAC.DApt fornece o suporte usado
  // por TFDQuery e TFDTransaction.
  FireDAC.DApt, FireDAC.Phys.FB;

const
  NoContextMessage = 'O contexto da empresa nao foi informado.';
  InvalidContextMessage = 'O contexto da empresa nao foi aceito.';
  InvalidValueMessage = 'O contexto da empresa contem caracteres nao suportados.';
  ContextInUseMessage = 'A conexao Next esta em uso e nao pode ser substituida.';

{ TNextSetup }

function TNextSetup.GetAdapter: IDataBaseConnection;
begin
  Result := FAdapter;
end;

function TNextSetup.GetContextInUse: Boolean;
begin
  Result := FActiveConsumers > 0;
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

function TNextSetup.BuildConnectionString: string;
begin
  ValidateValue(FDatabaseName);
  ValidateValue(FUserName);
  ValidateValue(FPassword);
  // Mapeamento exato: nenhum Server, Port ou Charset e criado. O proprio
  // adaptador define SQLDialect=3.
  Result := 'DriverID=FB;DatabaseName=' + FDatabaseName + ';UserName=' +
    FUserName + ';Password=' + FPassword;
end;

procedure TNextSetup.ClearContext;
begin
  FContextSet := False;
  FCompanyCode := 0;
  FDatabaseName := '';
  FUserName := '';
  FPassword := '';
end;

procedure TNextSetup.SetContext(ACompanyCode: Integer;
  const ADatabaseName, AUserName, APassword: string);
begin
  if ACompanyCode <= 0 then
    raise Exception.Create(InvalidContextMessage);
  if Trim(ADatabaseName) = '' then
    raise Exception.Create(InvalidContextMessage);
  if Trim(AUserName) = '' then
    raise Exception.Create(InvalidContextMessage);
  if Trim(APassword) = '' then
    raise Exception.Create(InvalidContextMessage);

  ValidateValue(ADatabaseName);
  ValidateValue(AUserName);
  ValidateValue(APassword);

  if ContextInUse then
    raise Exception.Create(ContextInUseMessage);

  Release;

  FCompanyCode := ACompanyCode;
  FDatabaseName := ADatabaseName;
  FUserName := AUserName;
  FPassword := APassword;

  try
    FConnection := TFDConnection.Create(nil);
    FAdapter := FireDACDatabaseConnection.Create(FConnection);
    FAdapter.SetConnectionString(BuildConnectionString);
  except
    FreeAndNil(FAdapter);
    FreeAndNil(FConnection);
    ClearContext;
    raise;
  end;
  FContextSet := True;
end;

function TNextSetup.MatchesContext(ACompanyCode: Integer;
  const ADatabaseName, AUserName, APassword: string): Boolean;
begin
  Result := FContextSet and (FCompanyCode = ACompanyCode) and
    (FDatabaseName = ADatabaseName) and (FUserName = AUserName) and
    (FPassword = APassword);
end;

procedure TNextSetup.AcquireContext;
begin
  Inc(FActiveConsumers);
end;

procedure TNextSetup.ReleaseContext;
begin
  if FActiveConsumers > 0 then
    Dec(FActiveConsumers);
end;

procedure TNextSetup.EnsureConnection;
begin
  if (not FContextSet) or (FConnection = nil) or (FAdapter = nil) then
    raise Exception.Create(NoContextMessage);

  // A abertura efetiva e do adaptador, que preserva a conexao preguicosa e
  // substitui a mensagem original do FireDAC por uma mensagem generica.
  FAdapter.EnsureConnection;
end;

procedure TNextSetup.Release;
var
  Adapter: FireDACDatabaseConnection;
  Conn: TFDConnection;
begin
  // Uma consulta ativa depende da conexao. O chamador deve liberar as telas
  // antes que o Setup possa libera-la.
  if ContextInUse then
    Exit;

  Adapter := FAdapter;
  FAdapter := nil;
  Conn := FConnection;
  FConnection := nil;

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
    if Conn <> nil then
    begin
      try
        if Conn.Connected then
          Conn.Connected := False;
      except
      end;
      try
        Conn.Free;
      except
      end;
    end;
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
