unit IDataBaseConnectionUnit;

interface

uses
  ITransactionUnit, ISqlLoggerUnit, QueryResultUnit, ScalarResultUnit, ParameterValueUnit, IErrorLoggerUnit;

type
  IDataBaseConnection = class abstract
    /// <summary>
    ///   Metodo que configura o banco de dados e abre a conexão
    /// </summary>
    /// <param name="ConnectionString">
    ///  String no formato Chave=Valor separados por ponto e virgula ";"
    /// <p>ConnectionString = URL de conexao formatada, se preenchida Server, Port, DataBaseName são desconsiderados</p>
    /// <p>Server = Nome ou endereço IP do servidor</p>
    /// <p>Port = Porta da conexão</p>
    /// <p>DatabaseName = Nome do banco de dados</p>
    /// <p>UserName = Nome de usuario</p>
    /// <p>Password = Senha de acesso</p>
    /// <p>Schema = Schema do banco se houver</p>
    /// <p>Pooled = True or False, ativar o Pool de conexões (Nao implementado)</p>
    /// <p>Encrypted = True or False</p>
    /// <p>DriverID = Opcional e especifico de algum componente</p>
    /// <p>CharSet = Opcional, CharacterSet do banco de dados</p>
    /// <p>PathLib = Caminho completo ou nome da dll para conexao</p>
    /// <p>LogSql = True or False</p>
    /// <p>TransAutoStart = True or False (Nao implementado)</p>
    /// <p>TransAutoCommit = True or False (Nao implementado)</p>
    /// <p>TransAutoClose = True or False (Nao implementado)</p>
    /// </param>
  public
    procedure Connect(const ConnectionString: string); virtual; abstract;
    procedure Disconnect(); virtual; abstract;
    procedure SetLogger(const SqlLogger: ISqlLogger); overload; virtual; abstract;
    procedure SetLogger(const ErrorLogger: IErrorLogger); overload; virtual; abstract;
    function BeginTransaction(): ITransaction; virtual; abstract;
    procedure UseTransaction(const Transaction: ITransaction); virtual; abstract;
    procedure ReleaseTransaction(const TransactionId: string); virtual; abstract;
    function CreateQuery(const SQL: string): QueryResult; overload; virtual; abstract;
    function CreateQuery(const SQL: string; const Params: array of const): QueryResult; overload; virtual; abstract;
    function CreateQuery(const SQL: string; const Params: ParametersValues): QueryResult; overload; virtual; abstract;
    function ExecuteScalar(const SQL: string): ScalarResult; overload; virtual; abstract;
    function ExecuteScalar(const SQL: string; const Params: array of const): ScalarResult; overload; virtual; abstract;
    function ExecuteScalar(const SQL: string; const Params: ParametersValues): ScalarResult; overload; virtual; abstract;
    procedure ExecuteCommand(const SQL: string); overload; virtual; abstract;
    procedure ExecuteCommand(const SQL: string; const Params: array of const); overload; virtual; abstract;
    procedure ExecuteCommand(const SQL: string; const Params: ParametersValues); overload; virtual; abstract;
    procedure ExecuteBatch(const SQL: string; const ParamsList: array of ParametersValues); virtual; abstract;
    function GetDatabaseName(): string; virtual; abstract;
  end;

implementation

end.
