unit ConfigurationTestUnit;

interface

type
  UserSessionConfig = class
  private
    FEmpresaId: Integer;
    FEmpresaNome: string;
    FEmpresaCnpj: string;
    FUsuarioId: Integer;
    FUsuarioNome: string;
    FUsuarioEmail: string;
    FCaixaUnificado: Boolean;
    FUnificadoraId: Integer;
  public
    property EmpresaId: Integer read FEmpresaId write FEmpresaId;
    property EmpresaNome: string read FEmpresaNome write FEmpresaNome;
    property EmpresaCnpj: string read FEmpresaCnpj write FEmpresaCnpj;
    property UsuarioId: Integer read FUsuarioId write FUsuarioId;
    property UsuarioNome: string read FUsuarioNome write FUsuarioNome;
    property UsuarioEmail: string read FUsuarioEmail write FUsuarioEmail;
    property CaixaUnificado: Boolean read FCaixaUnificado write FCaixaUnificado;
    property UnificadoraId: Integer read FUnificadoraId write FUnificadoraId;
  end;

  TConfigurationCustomTests = class
  private
    FSincronizacaototal: Boolean;
  public
    property Sincronizacaototal: Boolean read FSincronizacaototal;
  end;

  ConfigurationTest = class
  private
    FDatabaseName: string;
    FDatabaseNameSinc: string;
    FUserSession: UserSessionConfig;
    FCustomTests: TConfigurationCustomTests;
  public
    destructor Destroy; override;

    property DatabaseName: string read FDatabaseName write FDatabaseName;
    property DatabaseNameSinc: string read FDatabaseNameSinc write FDatabaseNameSinc;
    property UserSession: UserSessionConfig read FUserSession write FUserSession;
    property CustomTests: TConfigurationCustomTests read FCustomTests write FCustomTests;
  end;

implementation

uses
  SysUtils;

{ ConfigurationTest }

destructor ConfigurationTest.Destroy;
begin
  if Assigned(FUserSession) then
    FreeAndNil(FUserSession);

  if Assigned(FCustomTests) then
    FreeAndNil(FCustomTests);

  inherited;
end;

end.