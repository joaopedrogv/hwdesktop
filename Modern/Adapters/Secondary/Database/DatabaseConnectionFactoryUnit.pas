unit DatabaseConnectionFactoryUnit;

interface

uses
  IDatabaseConnectionFactoryUnit,
  IDataBaseConnectionUnit,
  ISqlLoggerUnit;

type
  DatabaseConnectionFactory = class(TInterfacedObject, IDatabaseConnectionFactory)
  public
    function CreateConnection(const ConnectionString: string; Logger: ISqlLogger): IDatabaseConnection; overload;
    function CreateConnection(const ConnectionString: string; Logger: ISqlLogger; out Erro: string): IDatabaseConnection; overload;
    function CreateConnection(const ConnectionString: string): IDatabaseConnection; overload;
    function CreateConnection(const ConnectionString: string; out Erro: string): IDatabaseConnection; overload;
  end;

implementation

uses
  SysUtils, Classes, StrUtils,
  {$IFNDEF ZDB_OFF}
  ZeosLibDatabaseConnectionUnit,
  {$ENDIF}
  IBXDatabaseConnectionUnit;

{ DatabaseConnectionFactory }

function DatabaseConnectionFactory.CreateConnection(const ConnectionString: string;
  Logger: ISqlLogger): IDatabaseConnection;
var
  Params: TStrings;
begin
  Params := TStringList.Create();
  try
    Params.LineBreak := ';';
    Params.Text := ConnectionString;

    {$IFNDEF ZDB_OFF}
    if MatchText(Params.Values['DriverID'], ['sqlite', 'sqlite-utf8']) then
      Result := ZeosLibDatabaseConnection.Create(nil)

    else
    {$ENDIF}
      Result := IBXDatabaseConnection.Create(nil);

    if Assigned(Logger) then
      Result.SetLogger(Logger);

    Result.Connect( ConnectionString );

  finally
    Params.Free();
  end;
end;

function DatabaseConnectionFactory.CreateConnection(const ConnectionString: string;
  out Erro: string): IDatabaseConnection;
var
  conn: IDatabaseConnection;
begin
  try
    conn := Self.CreateConnection(ConnectionString);

    Result := conn;

  except on E: Exception do
    begin
      conn   := nil;
      Result := nil;
      Erro := E.Message;
    end;
  end;
end;

function DatabaseConnectionFactory.CreateConnection(const ConnectionString: string): IDatabaseConnection;
begin
  Result := Self.CreateConnection(ConnectionString, nil);
end;

function DatabaseConnectionFactory.CreateConnection(const ConnectionString: string;
  Logger: ISqlLogger; out Erro: string): IDatabaseConnection;
var
  conn: IDatabaseConnection;
begin
  try
    conn := Self.CreateConnection(ConnectionString, Logger);

    Result := conn;

  except on E: Exception do
    begin
      conn   := nil;
      Result := nil;
      Erro := E.Message;
    end;
  end;

end;

end.
