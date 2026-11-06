// Delphi Rio
unit FireDACDatabaseConnectionUnit;

interface

uses
  BaseDatabaseConnectionUnit,
  IDataBaseConnectionUnit,
  ITransactionUnit,
  QueryResultUnit,
  ScalarResultUnit,
  FireDAC.Comp.Client,
  ParameterValueUnit,
  Classes;

type
  FireDACDatabaseConnection = class(BaseDatabaseConnection)
  private
    FTransactionStack: TStrings;
    FDatabase: TFDConnection;
    function GetCurrentTransaction: TFDTransaction;
    function CreateFDQuery(const SQL: string): TObject;
    function CreateAndExecuteQuery(const SQL: string; Command: CreateAndExecuteQueryCmd; const Params: ParametersValues): TObject;
    procedure ApplyParameters(Query: TFDQuery; const Params: ParametersValues);
  public
    /// <summary>
    ///   Database pode ser nil, assim a propria instancia vai criar e destruir a conexao
    /// </summary>
    constructor Create(const Database: TFDConnection);
    destructor Destroy; override;

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
  end;

implementation

uses
  SysUtils, StrUtils, DB, Variants,
  FireDACTransactionUnit,
  FireDAC.Stan.Param,
  FireDAC.Stan.Option,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  ISqlLoggerUnit;

var
  PARAMS_VAZIO: ParametersValues;

{ FireDACDatabaseConnection }

procedure FireDACDatabaseConnection.ApplyParameters(Query: TFDQuery; const Params: ParametersValues);
var
  I: Integer;
  qParam: TFDParam;
begin
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
        qParam.AsLargeInt := Params[I].AsInt64;
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
end;

function FireDACDatabaseConnection.BeginTransaction: ITransaction;
var
  Transaction: FireDACTransaction;
begin
  Transaction := FireDACTransaction.Create( FDatabase, Self );
  FTransactionStack.AddObject(Transaction.GetId(), Transaction.FDTransaction );
  Result := Transaction;
end;

constructor FireDACDatabaseConnection.Create(const Database: TFDConnection);
begin
  inherited Create();

  FOwnsDatabase := Database = nil;

  if FOwnsDatabase then
    FDatabase := TFDConnection.Create( nil )
  else
    FDatabase := Database;

  FTransactionStack := TStringList.Create();
end;

function FireDACDatabaseConnection.CreateAndExecuteQuery(
  const SQL: string;
  Command: CreateAndExecuteQueryCmd;
  const Params: ParametersValues
): TObject;
var
  Query: TFDQuery;
begin
  Query := TFDQuery( CreateFDQuery( SQL ) );
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

function FireDACDatabaseConnection.CreateFDQuery(const SQL: string): TObject;
var
  Query: TFDQuery;
  CurrentTrans: TFDTransaction;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FDatabase;
    CurrentTrans := GetCurrentTransaction;
    if Assigned(CurrentTrans) then
      Query.Transaction := CurrentTrans
    else
    begin
      Query.Transaction := TFDTransaction.Create(Query);
      Query.Transaction.Connection := FDatabase;
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

function FireDACDatabaseConnection.CreateQuery(const SQL: string; const Params: ParametersValues): QueryResult;
var
  Query: TFDQuery;
begin
  Query := TFDQuery( CreateAndExecuteQuery(SQL, rcOpen, Params) );

  Result := QueryResult.Create(Query, FCharSet, True);
end;

function FireDACDatabaseConnection.CreateQuery(const SQL: string; const Params: array of const): QueryResult;
begin
  Result := CreateQuery( Format(SQL, Params) );
end;

function FireDACDatabaseConnection.CreateQuery(const SQL: string): QueryResult;
var
  Query: TFDQuery;
begin
  Query := TFDQuery( CreateAndExecuteQuery(SQL, rcOpen, PARAMS_VAZIO ));

  Result := QueryResult.Create(Query, FCharSet, True);
end;

destructor FireDACDatabaseConnection.Destroy;
begin
  if FOwnsDataBase then
    Disconnect();

  FTransactionStack.Clear();
  FTransactionStack.Free();

  if FOwnsDataBase then
    FDatabase.Free();

  inherited;
end;

procedure FireDACDatabaseConnection.Disconnect;
begin
  try
    FDatabase.Close;
  except
    begin
      Sleep(100);
      try
        FDatabase.Connected := False;
      except
      end;
    end;
  end;
end;

procedure FireDACDatabaseConnection.ExecuteBatch(
  const SQL: string;
  const ParamsList: array of ParametersValues
);
var
  Query: TFDQuery;
  I: Integer;
begin
  if Length(ParamsList) = 0 then
    Exit;

  Query := TFDQuery( CreateFDQuery( SQL ) );
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

procedure FireDACDatabaseConnection.ExecuteCommand(const SQL: string; const Params: ParametersValues);
var
  Query: TFDQuery;
begin
  Query := TFDQuery( CreateAndExecuteQuery(SQL, rcExec, Params ));
  Query.Free;
end;

procedure FireDACDatabaseConnection.ExecuteCommand(const SQL: string; const Params: array of const);
begin
  ExecuteCommand( Format(SQL, Params) );
end;

procedure FireDACDatabaseConnection.ExecuteCommand(const SQL: string);
var
  Query: TFDQuery;
begin
  Query := TFDQuery( CreateAndExecuteQuery( SQL, rcExec, PARAMS_VAZIO ) );
  Query.Free;
end;

function FireDACDatabaseConnection.ExecuteScalar(const SQL: string; const Params: array of const): ScalarResult;
begin
  Result := ExecuteScalar( Format(SQL, Params) );
end;

function FireDACDatabaseConnection.ExecuteScalar(const SQL: string): ScalarResult;
var
  Query: TFDQuery;
begin
  Query := TFDQuery( CreateAndExecuteQuery(SQL, rcOpen, PARAMS_VAZIO ) );
  try
    if Query.IsEmpty then
      Result := ScalarResult.Null()
    else
      Result := GetScalarFromField( Query.Fields[0] );
  finally
    Query.Free;
  end;
end;

function FireDACDatabaseConnection.ExecuteScalar(const SQL: string; const Params: ParametersValues): ScalarResult;
var
  Query: TFDQuery;
begin
  Query := TFDQuery( CreateAndExecuteQuery(SQL, rcOpen, Params) );
  try
    if Query.IsEmpty then
      Result := ScalarResult.Null()
    else
      Result := GetScalarFromField( Query.Fields[0] );
  finally
    Query.Free;
  end;
end;

function FireDACDatabaseConnection.GetCurrentTransaction: TFDTransaction;
begin
  if FTransactionStack.Count > 0 then
    Result := TFDTransaction(FTransactionStack.Objects[FTransactionStack.Count - 1])
  else if Assigned(FDatabase.Transaction) then
    Result := FDatabase.Transaction as TFDTransaction
  else
    Result := nil;
end;

function FireDACDatabaseConnection.GetDatabaseName: string;
begin
  Result := FDatabase.Params.Database;
end;

procedure FireDACDatabaseConnection.ReleaseTransaction(const TransactionId: string);
var
  I: Integer;
begin
  I := FTransactionStack.IndexOf(TransactionId);
  if I >= 0 then
    FTransactionStack.Delete(I);
end;

procedure FireDACDatabaseConnection.UseTransaction(const Transaction: ITransaction);
var
  I: Integer;
begin
  I := FTransactionStack.IndexOf( Transaction.GetId() );
  if I >= 0 then
    FTransactionStack.Delete(I);

  if Assigned(FireDACTransaction(Transaction).OnNeedTransaction) then
    FTransactionStack.AddObject( Transaction.GetId(), FireDACTransaction(Transaction).OnNeedTransaction() )
  else
    FTransactionStack.AddObject( Transaction.GetId(), FireDACTransaction(Transaction).FDTransaction );
end;

procedure FireDACDatabaseConnection.Connect(const ConnectionString: string);
var
  Parametros: TStrings;
  connStr, server, port, databaseName, userName, password, charset, driverID: string;
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
      driverID := Parametros.Values['DriverID'];

      FDatabase.Connected := False;
      FDatabase.Params.Clear;
      FDatabase.LoginPrompt := False;

      if Trim(driverID) <> '' then
        FDatabase.Params.DriverID := driverID
      else
        FDatabase.Params.DriverID := 'FB';

      FDatabase.Params.Values['SQLDialect'] := '3';

      if connStr <> '' then
        FDatabase.Params.Database := connStr
      else if (Trim(port) <> '') and (Trim(server) <> '') then
      begin
        FDatabase.Params.Values['Server'] := server;
        FDatabase.Params.Values['Port'] := port;
        FDatabase.Params.Database := databaseName;
      end
      else if Trim(server) <> '' then
      begin
        FDatabase.Params.Values['Server'] := server;
        FDatabase.Params.Database := databaseName;
      end
      else
        FDatabase.Params.Database := databaseName;

      if Trim(userName) <> '' then
        FDatabase.Params.UserName := userName;

      if Trim(password) <> '' then
        FDatabase.Params.Password := password;

      if Trim(charset) <> '' then
      begin
        FDatabase.Params.Values['CharacterSet'] := charset;
        SetCharSet(Trim(charset));
      end;

      FDatabase.Open();

      if Assigned(FSqlLogger) then
        FSqlLogger.WriteToLog(Format(' >> Connection with "%s" is Open', [ FDatabase.Params.Database ]));

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

initialization
  FDManager.SilentMode := True;
  SetLength(PARAMS_VAZIO, 0);

finalization

end.
