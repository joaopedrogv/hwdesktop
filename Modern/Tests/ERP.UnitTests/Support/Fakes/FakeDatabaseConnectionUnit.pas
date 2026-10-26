unit FakeDatabaseConnectionUnit;

interface

uses
  IDataBaseConnectionUnit,
  ITransactionUnit,
  ISqlLoggerUnit,
  QueryResultUnit,
  ScalarResultUnit,
  ParameterValueUnit,
  IErrorLoggerUnit,
  FakeTransactionUnit;

type
  TFakeDatabaseConnection = class(IDataBaseConnection)
  private
    FTransactionState: TTransactionSpyState;
    FBeginTransactionCalled: Boolean;
    procedure UnexpectedCall(const AMethod: string);
  public
    constructor Create(ATransactionState: TTransactionSpyState);

    procedure Connect(const ConnectionString: string); override;
    procedure Disconnect(); override;
    procedure SetLogger(const SqlLogger: ISqlLogger); overload; override;
    procedure SetLogger(const ErrorLogger: IErrorLogger); overload; override;
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

    property BeginTransactionCalled: Boolean read FBeginTransactionCalled;
  end;

implementation

uses
  SysUtils;

constructor TFakeDatabaseConnection.Create(ATransactionState: TTransactionSpyState);
begin
  inherited Create;
  FTransactionState := ATransactionState;
end;

procedure TFakeDatabaseConnection.UnexpectedCall(const AMethod: string);
begin
  raise Exception.Create('Unexpected call to TFakeDatabaseConnection.' + AMethod);
end;

function TFakeDatabaseConnection.BeginTransaction: ITransaction;
begin
  FBeginTransactionCalled := True;
  Result := TFakeTransaction.Create(FTransactionState);
end;

procedure TFakeDatabaseConnection.Connect(const ConnectionString: string);
begin
  UnexpectedCall('Connect');
end;

procedure TFakeDatabaseConnection.Disconnect;
begin
  UnexpectedCall('Disconnect');
end;

procedure TFakeDatabaseConnection.SetLogger(const SqlLogger: ISqlLogger);
begin
  UnexpectedCall('SetLogger(ISqlLogger)');
end;

procedure TFakeDatabaseConnection.SetLogger(const ErrorLogger: IErrorLogger);
begin
  UnexpectedCall('SetLogger(IErrorLogger)');
end;

procedure TFakeDatabaseConnection.UseTransaction(const Transaction: ITransaction);
begin
  UnexpectedCall('UseTransaction');
end;

procedure TFakeDatabaseConnection.ReleaseTransaction(const TransactionId: string);
begin
  UnexpectedCall('ReleaseTransaction');
end;

function TFakeDatabaseConnection.CreateQuery(const SQL: string): QueryResult;
begin
  UnexpectedCall('CreateQuery');
end;

function TFakeDatabaseConnection.CreateQuery(const SQL: string; const Params: array of const): QueryResult;
begin
  UnexpectedCall('CreateQuery(array of const)');
end;

function TFakeDatabaseConnection.CreateQuery(const SQL: string; const Params: ParametersValues): QueryResult;
begin
  UnexpectedCall('CreateQuery(ParametersValues)');
end;

function TFakeDatabaseConnection.ExecuteScalar(const SQL: string): ScalarResult;
begin
  UnexpectedCall('ExecuteScalar');
end;

function TFakeDatabaseConnection.ExecuteScalar(const SQL: string; const Params: array of const): ScalarResult;
begin
  UnexpectedCall('ExecuteScalar(array of const)');
end;

function TFakeDatabaseConnection.ExecuteScalar(const SQL: string; const Params: ParametersValues): ScalarResult;
begin
  UnexpectedCall('ExecuteScalar(ParametersValues)');
end;

procedure TFakeDatabaseConnection.ExecuteCommand(const SQL: string);
begin
  UnexpectedCall('ExecuteCommand');
end;

procedure TFakeDatabaseConnection.ExecuteCommand(const SQL: string; const Params: array of const);
begin
  UnexpectedCall('ExecuteCommand(array of const)');
end;

procedure TFakeDatabaseConnection.ExecuteCommand(const SQL: string; const Params: ParametersValues);
begin
  UnexpectedCall('ExecuteCommand(ParametersValues)');
end;

procedure TFakeDatabaseConnection.ExecuteBatch(const SQL: string; const ParamsList: array of ParametersValues);
begin
  UnexpectedCall('ExecuteBatch');
end;

function TFakeDatabaseConnection.GetDatabaseName: string;
begin
  UnexpectedCall('GetDatabaseName');
end;

end.
