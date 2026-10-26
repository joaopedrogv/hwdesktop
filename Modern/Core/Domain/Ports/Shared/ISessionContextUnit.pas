unit ISessionContextUnit;

interface

type
  ISessionContext = interface
    ['{2277C448-A63A-47F0-BB22-E848FA077432}']
    // Setters
    procedure SetEnviroment(const DatabaseName, TemporaryFolder: string);
    procedure SetEmpresa(EmpresaId: Integer; const EmpresaNome, EmpresaCNPJ: string);
    procedure SetUsuario(UsuarioId: Integer; const UsuarioLogin, UsuarioEmail: string);
    procedure SetFinanceiro(CaixaUnificado: Boolean; UnificadoraId: Integer);
    // Getters
    function GetDatabaseName: string;
    function GetTemporaryFolder: string;
    // - Empresa
    function GetEmpresaId: Integer;
    function GetEmpresaNome: string;
    function GetEmpresaCNPJ: string;
    // - Usuario
    function GetUsuarioId: Integer;
    function GetUsuarioLogin: string;
    function GetUsuarioEmail: string;
    // - Financeiro
    function GetCaixaUnificado: Boolean;
    function GetUnificadoraId: Integer;

    // Conexao
    property DatabaseName: string read GetDatabaseName;
    // Diretorio temporario
    property TemporaryFolder: string read GetTemporaryFolder;
    // Empresa
    property EmpresaId: Integer read GetEmpresaId;
    property EmpresaNome: string read GetEmpresaNome;   
    property EmpresaCNPJ: string read GetEmpresaCNPJ;         
    // Usuario
    property UsuarioId: Integer read GetUsuarioId;
    property UsuarioLogin: string read GetUsuarioLogin; 
    property UsuarioEmail: string read GetUsuarioEmail;
    // Financeiro
    property CaixaUnificado: Boolean read GetCaixaUnificado;
    property UnificadoraId: Integer read GetUnificadoraId;
  end;


implementation

end.
