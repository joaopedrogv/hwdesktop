unit IBXDatabaseConnectionUnit;

interface

uses
  BaseDatabaseConnectionUnit,
  IDataBaseConnectionUnit,
  ITransactionUnit,
  QueryResultUnit,
  ScalarResultUnit,
  {$IFNDEF VER180}IBX.IBDatabase{$ELSE}IBDatabase{$ENDIF},
  {$IFNDEF VER180}IBX.IBQuery{$ELSE}IBQuery{$ENDIF},
  ParameterValueUnit,
  Classes;

type
  {$IFDEF INTF_ON}
  IBXDatabaseConnection = class(BaseDatabaseConnection, IDataBaseConnection)
  {$ELSE}
  IBXDatabaseConnection = class(BaseDatabaseConnection)
  {$ENDIF}
  private
    FTransactionStack: TStrings;
    FDatabase: TIBDatabase;
    function GetCurrentTransaction: TIBTransaction;
    function CreateIBQuery(const SQL: string): TObject;
    function CreateAndExecuteQuery(const SQL: string; Command: CreateAndExecuteQueryCmd; const Params: ParametersValues): TObject;
    procedure ApplyParameters(Query: TIBQuery; const Params: ParametersValues);
  public
    /// <summary>
    ///   Database pode ser nil, assim a propria instancia vai criar e destruir a conexao
    /// </summary>
    constructor Create(const Database: TIBDatabase);
    destructor Destroy; override;
    
    {$IFDEF INTF_ON}
    procedure Connect(const ConnectionString: string);
    procedure Disconnect();
    function BeginTransaction(): ITransaction;
    procedure UseTransaction(const Transaction: ITransaction);
    procedure ReleaseTransaction(const TransactionId: string);
    function CreateQuery(const SQL: string): QueryResult; overload;
    function CreateQuery(const SQL: string; const Params: array of const): QueryResult; overload;
    function CreateQuery(const SQL: string; const Params: ParametersValues): QueryResult; overload;
    function ExecuteScalar(const SQL: string): ScalarResult; overload;
    function ExecuteScalar(const SQL: string; const Params: array of const): ScalarResult; overload;
    function ExecuteScalar(const SQL: string; const Params: ParametersValues): ScalarResult; overload;
    procedure ExecuteCommand(const SQL: string); overload;
    procedure ExecuteCommand(const SQL: string; const Params: array of const); overload;
    procedure ExecuteCommand(const SQL: string; const Params: ParametersValues); overload;
    procedure ExecuteBatch(const SQL: string; const ParamsList: array of ParametersValues);
    {$ELSE}
    procedure Connect(const ConnectionString: string); override;
    procedure Disconnect(); override;
    function BeginTransaction(): ITransaction; override;
    procedure UseTransaction(const Transaction: ITransaction); override;
    procedure ReleaseTransaction(const TransactionId: string); override;
    function CreateQuery(const SQL: string): QueryResult; overload; override;
    function CreateQuery(const SQL: string; const Params: array of const): QueryResult; overload; override;
    function CreateQuery(const SQL: string; const Params: ParametersValues): QueryResult; overload; override;
    function ExecuteScalar(const SQL: string): ScalarResult; overload; override;
    function ExecuteScalar(const SQL: string; const Params: array of const): ScalarResult; overload; override;
    function ExecuteScalar(const SQL: string; const Params: ParametersValues): ScalarResult; overload; override;
    procedure ExecuteCommand(const SQL: string); overload; override;
    procedure ExecuteCommand(const SQL: string; const Params: array of const); overload; override;
    procedure ExecuteCommand(const SQL: string; const Params: ParametersValues); overload; override;
    procedure ExecuteBatch(const SQL: string; const ParamsList: array of ParametersValues); override;
    function GetDatabaseName(): string; override;
    {$ENDIF}
  end;

implementation

uses
  SysUtils, StrUtils, DB, Variants,
  IBXTransactionBaseUnit,
  IBXTransactionUnit,
  ISqlLoggerUnit;

var
  PARAMS_VAZIO: ParametersValues;

{ IBXDatabaseConnection }

procedure IBXDatabaseConnection.ApplyParameters(Query: TIBQuery; const Params: ParametersValues);
var
  I: Integer;
  qParam: TParam;
begin
//  if Assigned(FSqlLogger) then
//  begin
//    FSqlLogger.WriteToLog('antes');
//    for I := 0 to Query.Params.Count - 1 do
//      FSqlLogger.WriteToLog(Format(' Queryparam %s = %s', [Query.Params[I].Name, Query.Params[I].AsString]));
//  end;

  for I := 0 to High(Params) do
  begin
    if (Params[I].Name = '') and (Length(Params) <> Query.ParamCount) then
      raise Exception.Create('DatabaseConnection.ApplyParameters Length(Params) <> Query.ParamCount ');

    if Params[I].Name <> '' then
      qParam := Query.ParamByName(Params[I].Name)
    else
      qParam := Query.Params[I];

    case Params[I].ParamType of
      ptInteger:
        qParam.AsInteger := Params[I].AsInteger;
      ptInt64:
        {$IFNDEF VER180}
        qParam.AsLargeInt := Params[I].AsInt64;
        {$ELSE}
        qParam.Value := Params[I].AsInt64;
        {$ENDIF}
      ptCurrency:
        qParam.AsCurrency := Params[I].AsCurrency;
      ptDouble:
        qParam.AsFloat := Params[I].AsDouble;
      ptString:
        qParam.AsString := Params[I].AsString;
      ptMemo:
        qParam.AsMemo := Params[I].AsString;
      ptMemoUTF8:
        qParam.AsMemo := AnsiToUtf8(Params[I].AsString);
      ptDate:
        qParam.AsDateTime := Params[I].AsDateTime;
      ptDateTime:
        qParam.AsDateTime := Params[I].AsDateTime;
      else
        qParam.Clear();
    end;
  end;

//  if Assigned(FSqlLogger) then
//  begin
//    FSqlLogger.WriteToLog('depois');
//    for I := 0 to Query.Params.Count - 1 do
//      FSqlLogger.WriteToLog(Format(' Queryparam %s = %s', [Query.Params[I].Name, Query.Params[I].AsString]));
//  end;
end;

function IBXDatabaseConnection.BeginTransaction: ITransaction;
var
  Transaction: IBXTransaction;
begin
  Transaction := IBXTransaction.Create( FDatabase, Self);
  FTransactionStack.AddObject(Transaction.GetId(), Transaction.IBTransaction );
  Result := Transaction;
end;

constructor IBXDatabaseConnection.Create(const Database: TIBDatabase);
begin
  inherited Create();

  FOwnsDatabase := Database = nil;

  if FOwnsDatabase then
    FDatabase := TIBDatabase.Create( nil )
  else
    FDatabase := Database;

  FTransactionStack := TStringList.Create();
end;

function IBXDatabaseConnection.CreateAndExecuteQuery(
  const SQL: string;
  Command: CreateAndExecuteQueryCmd;
  const Params: ParametersValues
): TObject;
var
  Query: TIBQuery;
begin
  Query := TIBQuery( CreateIBQuery( SQL ) );
  try
    try
      ApplyParameters( Query, Params );

      if Assigned(FSqlLogger) then
      begin
        FSqlLogger.BeginQuery( SQL, Params );
        case Command of
          rcOpen:
            Query.Open();

          rcExec:
            Query.ExecSQL();
        end;
        FSqlLogger.EndQuerySuccess(Query.RowsAffected);
      end
      else
      begin
        case Command of
          rcOpen:
            Query.Open();

          rcExec:
            Query.ExecSQL();
        end;
      end;

    except on E: Exception do
      begin
        LogError(E.Message);

        if Assigned(FSqlLogger) then
          FSqlLogger.EndQueryError( e.Message, Params );
        raise;
      end;
    end;

    Result := Query;

  except
    Query.Free;
    raise;
  end;
end;

function IBXDatabaseConnection.CreateIBQuery(const SQL: string): TObject;
var
  Query: TIBQuery;
  CurrentTrans: TIBTransaction;
begin
  Query := TIBQuery.Create(nil);
  try
    Query.Database := FDatabase;
    CurrentTrans := GetCurrentTransaction;
    if Assigned(CurrentTrans) then
      Query.Transaction := CurrentTrans
    else
    begin
      Query.Transaction := TIBTransaction.Create(Query);
      Query.Transaction.DefaultDatabase := FDatabase;
      Query.Transaction.StartTransaction;
    end;
    Query.SQL.Text := SQL;

    Result := Query;


  except on E: Exception do
    begin
      LogError(E.Message);

      Query.Free();
      raise;
    end;
  end;
end;

function IBXDatabaseConnection.CreateQuery(const SQL: string; const Params: ParametersValues): QueryResult;
var
  Query: TIBQuery;
begin
  Query := TIBQuery( CreateAndExecuteQuery(SQL, rcOpen, Params) );

  Result := QueryResult.Create(Query, FCharSet, True);
end;

function IBXDatabaseConnection.CreateQuery(const SQL: string; const Params: array of const): QueryResult;
begin
  Result := CreateQuery( Format(SQL, Params) );
end;

function IBXDatabaseConnection.CreateQuery(const SQL: string): QueryResult;
var
  Query: TIBQuery;
begin
  Query := TIBQuery( CreateAndExecuteQuery(SQL, rcOpen, PARAMS_VAZIO ));

  Result := QueryResult.Create(Query, FCharSet, True);
end;

destructor IBXDatabaseConnection.Destroy;
var
  I: Integer;
  tr: TIBTransaction;
begin

  if FOwnsDataBase then
    Disconnect();

  FTransactionStack.Clear();
  FTransactionStack.Free();

  if FOwnsDataBase then
    FDatabase.Free();

  inherited;
end;

procedure IBXDatabaseConnection.Disconnect;
begin
  // Como o componente vem de fora da aplicacao pode ser que ele já tenha sido destruido
  try
    FDatabase.Close;
  except
    begin
      Sleep(100);
      try
        FDatabase.ForceClose();
      except
      end;
    end;
  end;
end;

procedure IBXDatabaseConnection.ExecuteBatch(
  const SQL: string;
  const ParamsList: array of ParametersValues
);
var
  Query: TIBQuery;
  I: Integer;
begin
  if Length(ParamsList) = 0 then
    Exit;

  Query := TIBQuery( CreateIBQuery( SQL ) );
  try
    try

      if Assigned(FSqlLogger) then
        FSqlLogger.BeginQuery(SQL, Length(ParamsList), PARAMS_VAZIO);

      Query.Prepare();

      for I := 0 to High(ParamsList) do
      begin
        ApplyParameters( Query, ParamsList[I] );

        try

          Query.ExecSQL();

        except on E: Exception do
          begin
            if Assigned(FSqlLogger) then
              FSqlLogger.EndQueryError(e.Message, ParamsList[I], I);
            raise;
          end;
        end;
      end;

      if Assigned(FSqlLogger) then
        FSqlLogger.EndQuerySuccess();
    
    except on E: Exception do
      begin
        LogError(E.Message);
        raise;
      end;
    end;

  finally
    Query.Free();
  end;
end;

procedure IBXDatabaseConnection.ExecuteCommand(const SQL: string; const Params: ParametersValues);
var
  Query: TIBQuery;
begin
  Query := TIBQuery( CreateAndExecuteQuery(SQL, rcExec, Params ));
  Query.Free;
end;

procedure IBXDatabaseConnection.ExecuteCommand(const SQL: string; const Params: array of const);
begin
  ExecuteCommand( Format(SQL, Params) );
end;

function IBXDatabaseConnection.ExecuteScalar(const SQL: string; const Params: array of const): ScalarResult;
begin
  Result := ExecuteScalar( Format(SQL, Params) );
end;

function IBXDatabaseConnection.ExecuteScalar(const SQL: string): ScalarResult;
var
  Query: TIBQuery;
begin
  Query := TIBQuery( CreateAndExecuteQuery(SQL, rcOpen, PARAMS_VAZIO ) );
  try
    if Query.IsEmpty then
      Result := ScalarResult.Null()

    else
      Result := GetScalarFromField( Query.Fields[0] );

  finally
    Query.Free;
  end;
end;

procedure IBXDatabaseConnection.ExecuteCommand(const SQL: string);
var
  Query: TIBQuery;
begin
  Query := TIBQuery( CreateAndExecuteQuery( SQL, rcExec, PARAMS_VAZIO ) );
  Query.Free;
end;

function IBXDatabaseConnection.GetCurrentTransaction: TIBTransaction;
begin
  if FTransactionStack.Count > 0 then
    Result := TIBTransaction(FTransactionStack.Objects[FTransactionStack.Count - 1])
  else
    Result := FDatabase.DefaultTransaction;
end;

function IBXDatabaseConnection.GetDatabaseName: string;
begin
  Result := FDatabase.DatabaseName;
end;

procedure IBXDatabaseConnection.ReleaseTransaction(const TransactionId: string);
var
  I: Integer;
begin
  I := FTransactionStack.IndexOf(TransactionId);
  if I >= 0 then
    FTransactionStack.Delete(I);
end;

procedure IBXDatabaseConnection.UseTransaction(const Transaction: ITransaction);
var
  I: Integer;
begin
  I := FTransactionStack.IndexOf( Transaction.GetId() );
  if I >= 0 then
    FTransactionStack.Delete(I);

  FTransactionStack.AddObject( Transaction.GetId(), IBXTransactionBase(Transaction).OnNeedTransaction() );
end;

procedure IBXDatabaseConnection.Connect(const ConnectionString: string);
var
  Parametros: TStrings;
  connStr, server, port, databaseName, userName, password, charset: string;
begin
  FConnectionString := ConnectionString;

  Parametros := TStringList.Create;
  try
    try
      Parametros.LineBreak := ';';
      Parametros.Text := ConnectionString;

      connStr := Parametros.Values['ConnectionString'];
      server := Parametros.Values['Server'];
      port := Parametros.Values['Port'];
      databaseName := Parametros.Values['DatabaseName'];
      userName := Parametros.Values['UserName'];
      password := Parametros.Values['Password'];
      charset := Parametros.Values['Charset'];

      FDatabase.Connected := False;
      FDatabase.Params.Clear;

      FDatabase.SQLDialect := 3;
      FDatabase.LoginPrompt := False;

      if connStr <> '' then
        FDatabase.DatabaseName := connStr
      else if (Trim(port) <> '' ) and (Trim(server) <> '') then
        FDatabase.DatabaseName := server + '/' + port + ':' + databaseName
      else if Trim(server) <> '' then
        FDatabase.DatabaseName := server + ':' + databaseName
      else
        FDatabase.DatabaseName := databaseName;

      if Trim(userName) <> '' then
        FDatabase.Params.Values['user_name'] := userName;

      if Trim(password) <> '' then
        FDatabase.Params.Values['password'] := password;

      if Trim(charset) <> '' then
        FDatabase.Params.Values['lc_ctype'] := charset;

      SetCharSet(Trim(charset));

      FDatabase.Open();

      if Assigned(FSqlLogger) then
        FSqlLogger.WriteToLog(Format(' >> Conection with "%s" is Open', [ FDatabase.DatabaseName ]));

    except on E: Exception do
      begin
        LogError(E.Message);
        raise;
      end;
    end;

  finally
    Parametros.Free();
  end;
end;

//    if FDatabase.DefaultTransaction = nil then // Caso o compente nao tenha a transacao definida
//      FDefaultTransaction := BeginTransaction(); // cria uma transacao na stack e sera liberada apenas quando a class for destruida

function IBXDatabaseConnection.ExecuteScalar(const SQL: string; const Params: ParametersValues): ScalarResult;
var
  Query: TIBQuery;
begin
  Query := TIBQuery( CreateAndExecuteQuery(SQL, rcOpen, Params) );
  try
    if Query.IsEmpty then
      Result := ScalarResult.Null()

    else
      Result := GetScalarFromField( Query.Fields[0] );

  finally
    Query.Free;
  end;
end;

initialization
  SetLength(PARAMS_VAZIO, 0);

finalization

end.
