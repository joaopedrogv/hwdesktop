unit StubSessionContextUnit;

interface

uses
  ISessionContextUnit;

type
  TSessionContextStub = class(TInterfacedObject, ISessionContext)
  private
    FEmpresaId: Integer;
    FEmpresaNome: string;
    FEmpresaCNPJ: string;
    FUsuarioId: Integer;
    FUsuarioLogin: string;
    FUsuarioEmail: string;
    FDatabaseName: string;
    FTemporaryFolder: string;
    FCaixaUnificado: Boolean;
    FUnificadoraId: Integer;
  public
    constructor Create(AEmpresaId: Integer);

    procedure SetEnviroment(const DatabaseName, TemporaryFolder: string);
    procedure SetEmpresa(EmpresaId: Integer;
      const EmpresaNome, EmpresaCNPJ: string);
    procedure SetUsuario(UsuarioId: Integer;
      const UsuarioLogin, UsuarioEmail: string);
    procedure SetFinanceiro(CaixaUnificado: Boolean; UnificadoraId: Integer);
    function GetDatabaseName: string;
    function GetTemporaryFolder: string;
    function GetEmpresaId: Integer;
    function GetEmpresaNome: string;
    function GetEmpresaCNPJ: string;
    function GetUsuarioId: Integer;
    function GetUsuarioLogin: string;
    function GetUsuarioEmail: string;
    function GetCaixaUnificado: Boolean;
    function GetUnificadoraId: Integer;
  end;

implementation

{ TSessionContextStub }

constructor TSessionContextStub.Create(AEmpresaId: Integer);
begin
  inherited Create;

  FEmpresaId := AEmpresaId;
end;

procedure TSessionContextStub.SetEnviroment(const DatabaseName,
  TemporaryFolder: string);
begin
  FDatabaseName := DatabaseName;
  FTemporaryFolder := TemporaryFolder;
end;

procedure TSessionContextStub.SetEmpresa(EmpresaId: Integer;
  const EmpresaNome, EmpresaCNPJ: string);
begin
  FEmpresaId := EmpresaId;
  FEmpresaNome := EmpresaNome;
  FEmpresaCNPJ := EmpresaCNPJ;
end;

procedure TSessionContextStub.SetUsuario(UsuarioId: Integer;
  const UsuarioLogin, UsuarioEmail: string);
begin
  FUsuarioId := UsuarioId;
  FUsuarioLogin := UsuarioLogin;
  FUsuarioEmail := UsuarioEmail;
end;

procedure TSessionContextStub.SetFinanceiro(CaixaUnificado: Boolean;
  UnificadoraId: Integer);
begin
  FCaixaUnificado := CaixaUnificado;
  FUnificadoraId := UnificadoraId;
end;

function TSessionContextStub.GetDatabaseName: string;
begin
  Result := FDatabaseName;
end;

function TSessionContextStub.GetTemporaryFolder: string;
begin
  Result := FTemporaryFolder;
end;

function TSessionContextStub.GetEmpresaId: Integer;
begin
  Result := FEmpresaId;
end;

function TSessionContextStub.GetEmpresaNome: string;
begin
  Result := FEmpresaNome;
end;

function TSessionContextStub.GetEmpresaCNPJ: string;
begin
  Result := FEmpresaCNPJ;
end;

function TSessionContextStub.GetUsuarioId: Integer;
begin
  Result := FUsuarioId;
end;

function TSessionContextStub.GetUsuarioLogin: string;
begin
  Result := FUsuarioLogin;
end;

function TSessionContextStub.GetUsuarioEmail: string;
begin
  Result := FUsuarioEmail;
end;

function TSessionContextStub.GetCaixaUnificado: Boolean;
begin
  Result := FCaixaUnificado;
end;

function TSessionContextStub.GetUnificadoraId: Integer;
begin
  Result := FUnificadoraId;
end;

end.
