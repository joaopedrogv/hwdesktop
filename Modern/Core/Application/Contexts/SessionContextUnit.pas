unit SessionContextUnit;

interface

uses
  ISessionContextUnit;

type
  SessionContext = class(TInterfacedObject, ISessionContext)
  private
    // Enviroment
    FDatabaseName: string;
    FTemporaryFolder: string;
    //Empresa
    FEmpresaId: Integer;
    FEmpresaNome: string;
    FEmpresaCNPJ: string;
    // Usuario
    FUsuarioId: Integer;
    FUsuarioLogin: string;
    FUsuarioEmail: string;
    // Financeiro
    FCaixaUnificado: Boolean;
    FUnificadoraId: Integer;
  public
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
  end;

implementation

uses
  SysUtils;

{ SessionContext }

function SessionContext.GetCaixaUnificado: Boolean;
begin
    Result := FCaixaUnificado;
end;

function SessionContext.GetDatabaseName: string;
begin
  Result := FDatabaseName;
end;

function SessionContext.GetEmpresaCNPJ: string;
begin
  Result := FEmpresaCNPJ;
end;

function SessionContext.GetEmpresaId: Integer;
begin
  Result := FEmpresaId;
end;

function SessionContext.GetEmpresaNome: string;
begin
  Result := FEmpresaNome;
end;

function SessionContext.GetTemporaryFolder: string;
begin
  Result := FTemporaryFolder;
end;

function SessionContext.GetUnificadoraId: Integer;
begin
  Result := FUnificadoraId;
end;

function SessionContext.GetUsuarioEmail: string;
begin
  Result := FUsuarioEmail;
end;

function SessionContext.GetUsuarioId: Integer;
begin
  Result := FUsuarioId;
end;

function SessionContext.GetUsuarioLogin: string;
begin
  Result := FUsuarioLogin;
end;

procedure SessionContext.SetEnviroment(const DatabaseName, TemporaryFolder: string);
begin
  FDatabaseName := DatabaseName;
  FTemporaryFolder := TemporaryFolder;
  if FTemporaryFolder <> '' then
    FTemporaryFolder := IncludeTrailingPathDelimiter(FTemporaryFolder);
end;

procedure SessionContext.SetFinanceiro(CaixaUnificado: Boolean; UnificadoraId: Integer);
begin
  FCaixaUnificado := CaixaUnificado;
  FUnificadoraId := UnificadoraId;
end;

procedure SessionContext.SetEmpresa(EmpresaId: Integer; const EmpresaNome, EmpresaCNPJ: string);
begin
  FEmpresaId := EmpresaId;
  FEmpresaNome := EmpresaNome;
  FEmpresaCNPJ := EmpresaCNPJ;
end;

procedure SessionContext.SetUsuario(UsuarioId: Integer; const UsuarioLogin, UsuarioEmail: string);
begin
  FUsuarioId := UsuarioId;
  FUsuarioLogin := UsuarioLogin;
  FUsuarioEmail := UsuarioEmail
end;

end.
