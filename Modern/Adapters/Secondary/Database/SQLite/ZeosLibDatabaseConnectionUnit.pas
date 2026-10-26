unit ZeosLibDatabaseConnectionUnit;

interface

uses
  BaseDatabaseConnectionUnit,
  IDataBaseConnectionUnit,
  ITransactionUnit,
  QueryResultUnit,
  ScalarResultUnit,
  ZConnection,
  Classes,
  ZeosLibCompatibilityWithERPUnit,
  ParameterValueUnit;

type
  {$IFDEF INTF_ON}
  ZeosLibDatabaseConnection = class(BaseDatabaseConnection, IDataBaseConnection)
  {$ELSE}
  ZeosLibDatabaseConnection = class(BaseDatabaseConnection)
  {$ENDIF}
  private
    FConnection: TZConnection;
    FTransactionStack: TStrings;
    function GetCurrentTransaction: TZTransaction;
    function CreateZQuery(const SQL: string): TObject;
    function CreateAndExecuteQuery(const SQL: string; Command: CreateAndExecuteQueryCmd; const Params: ParametersValues): TObject;
  public
    /// <summary>
    ///   Connection pode ser nil, assim a propria instancia vai criar e destruir a conexao
    /// </summary>
    constructor Create(const Connection: TZConnection);
    destructor Destroy; override;


    // Eu nao posso usar QueryResult para criar SQL, isso mistura com a finalidade da classe
    // Se necessario eu preciso de outra classe ou record builder, e os repositorios usaria para criar o SQL

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
  SysUtils, StrUtils, DB,
  {$IFNDEF VER180}
  ZDatasetParam,
  ZDatasetUtils,
  {$ENDIF}
  ZDataset,
  ZeosLibTransactionUnit, ISqlLoggerUnit, ZCompatibility;      

var
  PARAMS_VAZIO: ParametersValues;

{ ZeosLibDatabaseConnection }

procedure ApplyParameters(Query: TZQuery; const Params: array of ParameterValue);
var
  I: Integer;
  qParam: {$IFNDEF DISABLE_ZPARAM}TZParam{$ELSE}TParam{$ENDIF};
begin
  for I := 0 to High(Params) do
  begin
    if (Params[I].Name = '') and (Length(Params) <> Query.Params.Count) then
      raise Exception.Create('DatabaseConnection.ApplyParameters Length(Params) <> Query.Params.Count');

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

function ZeosLibDatabaseConnection.BeginTransaction: ITransaction;
var
  Transaction: ZeosLibTransaction;
begin
  Transaction := ZeosLibTransaction.Create(FConnection, Self);
  FTransactionStack.AddObject(Transaction.GetId(), Transaction.Transaction );
  Result := Transaction;
end;

constructor ZeosLibDatabaseConnection.Create(const Connection: TZConnection);
begin
  inherited Create();

  FOwnsDatabase := Connection = nil;

  if FOwnsDatabase then
    FConnection := TZConnection.Create( nil )
  else
    FConnection := Connection;

  FTransactionStack := TStringList.Create();
end;

function ZeosLibDatabaseConnection.CreateAndExecuteQuery(
  const SQL: string;
  Command: CreateAndExecuteQueryCmd;
  const Params: ParametersValues
): TObject;
var
  Query: TZQuery;
begin
  Query := TZQuery( CreateZQuery( SQL ) );
  try
    try
      ApplyParameters( Query, Params );

      if Assigned(FSqlLogger) then
      begin
        FSqlLogger.BeginQuery( SQL , Params );
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

function ZeosLibDatabaseConnection.CreateQuery(const SQL: string): QueryResult;
var
  Query: TZQuery;
begin
  Query := TZQuery( CreateAndExecuteQuery(SQL, rcOpen, PARAMS_VAZIO ) );

  Result := QueryResult.Create(Query, FCharSet, True);
end;

function ZeosLibDatabaseConnection.CreateQuery(const SQL: string; const Params: array of const): QueryResult;
begin
  Result := CreateQuery( Format(SQL, Params) );
end;

function ZeosLibDatabaseConnection.CreateZQuery(const SQL: string): TObject;
var
  Query: TZQuery;
  CurrentTrans: TZTransaction;
begin
  Query := TZQuery.Create(nil);
  try
    Query.Connection := FConnection;
    {$IFNDEF VER180}
    CurrentTrans := GetCurrentTransaction;
    if Assigned(CurrentTrans) then
      Query.Transaction := CurrentTrans;
    {$ENDIF}
    { TZConnection controla nativamente a transacao, sendo caso a transacao nao tenha sido iniciada explicitamente então
    o proprio FConnection é a transacao, nao precisa do codigo abaixo
    else
    begin
      Query.Transaction := TZTransaction.Create(Query);
      Query.Transaction.Connection := FConnection;
      Query.Transaction.StartTransaction;
    end;
    }
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

destructor ZeosLibDatabaseConnection.Destroy;
var
  I: Integer;
  tr: TZTransaction;
begin

  if FOwnsDataBase then
    Disconnect();

  for I := 0 to FTransactionStack.Count - 1 do
  begin
    tr := TZTransaction(FTransactionStack[I]);
    tr.Free();
  end;

  FTransactionStack.Clear();
  FTransactionStack.Free();

  if FOwnsDataBase then
    FConnection.Free();

  inherited;
end;

procedure ZeosLibDatabaseConnection.Disconnect;
begin
  try
    FConnection.Disconnect();
  except
  end;
end;

procedure ZeosLibDatabaseConnection.ExecuteBatch(
  const SQL: string;
  const ParamsList: array of ParametersValues
);
var
  Query: TZQuery;
  I: Integer;
begin
  Query := TZQuery( CreateZQuery( SQL ) );
  try
    try
      Query.Prepare();

      for I := 0 to High(ParamsList) do
      begin
        ApplyParameters( Query, ParamsList[I] );
        Query.ExecSQL();
      end;

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

procedure ZeosLibDatabaseConnection.ExecuteCommand(const SQL: string; const Params: ParametersValues);
var
  Query: TZQuery;
begin
  Query := TZQuery( CreateAndExecuteQuery(SQL, rcExec, Params ));
  Query.Free;
end;

procedure ZeosLibDatabaseConnection.ExecuteCommand(const SQL: string; const Params: array of const);
begin
  ExecuteCommand( Format(SQL, Params) );
end;

function ZeosLibDatabaseConnection.ExecuteScalar(const SQL: string; const Params: array of const): ScalarResult;
begin
  Result := ExecuteScalar( Format(SQL, Params) ); 
end;

function ZeosLibDatabaseConnection.ExecuteScalar(const SQL: string): ScalarResult;
var
  Query: TZQuery;
begin
  Query := TZQuery( CreateAndExecuteQuery(SQL, rcOpen, PARAMS_VAZIO ));
  try
    if Query.IsEmpty then
      Result := ScalarResult.Null()

    else
      Result := GetScalarFromField( Query.Fields[0] );

  finally
    Query.Free;
  end;
end;

procedure ZeosLibDatabaseConnection.ExecuteCommand(const SQL: string);
var
  Query: TZQuery;
begin
  Query := TZQuery( CreateAndExecuteQuery(SQL, rcExec, PARAMS_VAZIO ));
  Query.Free;
end;

function ZeosLibDatabaseConnection.GetCurrentTransaction: TZTransaction;
begin
  if FTransactionStack.Count > 0 then
    Result := TZTransaction(FTransactionStack.Objects[FTransactionStack.Count - 1])
  else
    Result := nil;
end;

function ZeosLibDatabaseConnection.GetDatabaseName: string;
begin
  Result := FConnection.Database;
end;

procedure ZeosLibDatabaseConnection.ReleaseTransaction(const TransactionId: string);
var
  I: Integer;
begin
  I := FTransactionStack.IndexOf(TransactionId);
  if I >= 0 then
    FTransactionStack.Delete(I);
end;

procedure ZeosLibDatabaseConnection.UseTransaction(const Transaction: ITransaction);
var
  I: Integer;
begin
  I := FTransactionStack.IndexOf( Transaction.GetId() );
  if I >= 0 then
    FTransactionStack.Delete(I);

  FTransactionStack.AddObject( Transaction.GetId(), ZeosLibTransaction(Transaction).OnNeedTransaction() );
end;

procedure ZeosLibDatabaseConnection.Connect(const ConnectionString: string);
var
  Parametros: TStrings;
  connStr, server, port, databaseName, userName, password, charset, pathLib, driverId: string;
begin
  FConnectionString := ConnectionString;

  Parametros := TStringList.Create;
  try
    try
      Parametros.LineBreak := ';';
      Parametros.Text := FConnectionString;
                             
      connStr := Parametros.Values['ConnectionString'];
      server := Parametros.Values['Server'];
      port := Parametros.Values['Port'];
      databaseName := Parametros.Values['DatabaseName'];
      userName := Parametros.Values['UserName'];
      password := Parametros.Values['Password'];
      charset := Parametros.Values['Charset'];
      pathLib := Parametros.Values['PathLib'];
      driverId := Parametros.Values['DriverID'];

      if (Trim(pathLib) <> '') and not FileExists(pathLib) then
        raise Exception.CreateFmt('PathLib inváida, arquivo [%s] não encontrado', [pathLib]);

      FConnection.Disconnect();

      if Trim(driverId) <> '' then
        FConnection.Protocol := driverId;

      if connStr <> '' then
        FConnection.Database := connStr
      else if (Trim(port) <> '' ) and (Trim(server) <> '') then
        FConnection.Database := server + '/' + port + ':' + databaseName
      else if Trim(server) <> '' then
        FConnection.Database := server + ':' + databaseName
      else
        FConnection.Database := databaseName;

      if Trim(userName) <> '' then
        FConnection.User := userName;

      if Trim(password) <> '' then
        FConnection.Password := password;

      SetCharSet(Trim(charset));

      if Trim(charset) <> '' then
      begin
        FConnection.ClientCodepage := charset;
        {$IFDEF VER180}
        if FCharSet = 'UTF8' then
          FConnection.ControlsCodePage := cCP_UTF8;
        {$ENDIF}
      end;

      if Trim(pathLib) <> '' then
        FConnection.LibraryLocation := pathLib;

      FConnection.Connect();

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

function ZeosLibDatabaseConnection.CreateQuery(const SQL: string; const Params: ParametersValues): QueryResult;
var
  Query: TZQuery;
begin
  Query := TZQuery( CreateAndExecuteQuery(SQL, rcOpen, Params) );

  Result := QueryResult.Create(Query, FCharSet, True);
end;

function ZeosLibDatabaseConnection.ExecuteScalar(const SQL: string; const Params: ParametersValues): ScalarResult;
var
  Query: TZQuery;
begin
  Query := TZQuery( CreateAndExecuteQuery(SQL, rcOpen, Params) );
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
