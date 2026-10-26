unit SessionExport;

interface

implementation

uses
  SetupDFeUnit;

procedure SetupSessionDLL(
  EmpresaId: Integer; const EmpresaNome, EmpresaCNPJ: WideString;
  UsuarioId: Integer; const UsuarioLogin, UsuarioEmail: WideString;
  CaixaUnificado: Boolean; UnificadoraId: Integer
); stdcall;
begin
  SetupSession(
    EmpresaId, UsuarioId, EmpresaNome, EmpresaCNPJ, UsuarioLogin, UsuarioEmail, CaixaUnificado, UnificadoraId
  );
end;

procedure SetupSessionAndEnviromentDLL(
  EmpresaId: Integer; const EmpresaNome, EmpresaCNPJ: WideString;
  UsuarioId: Integer; const UsuarioLogin, UsuarioEmail: WideString;
  CaixaUnificado: Boolean; UnificadoraId: Integer;
  const DatabaseName, TemporaryFolder: WideString
); stdcall;
begin
  SetupSession(
    EmpresaId, UsuarioId, EmpresaNome, EmpresaCNPJ, UsuarioLogin, UsuarioEmail, CaixaUnificado, UnificadoraId
  );
  SetupEnviroment(DatabaseName, TemporaryFolder);
end;

exports
  SetupSessionDll,
  SetupSessionAndEnviromentDLL;

end.
