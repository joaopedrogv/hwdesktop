unit SetupDFeUnit;

interface

uses
  IBX.IBDatabase;

type
  // Basicamente serve apenas para armazer a sessao entre as chamadas
  TSessionState = record
    HasState: Boolean;
    //Empresa
    EmpresaId: Integer;
    EmpresaNome: string;
    EmpresaCNPJ: string;
    // Usuario
    UsuarioId: Integer;
    UsuarioLogin: string;
    UsuarioEmail: string;
    // Financeiro
    CaixaUnificado: Boolean;
    UnificadoraId: Integer;
    // Enviroment
    DatabaseName: string;
    TemporaryFolder: string;
  end;

procedure SetupSession(
  EmpresaId, UsuarioId: Integer;
  const EmpresaNome, EmpresaCNPJ, UsuarioLogin, UsuarioEmail: WideString;
  CaixaUnificado: Boolean;
  UnificadoraId: Integer
);
procedure SetupEnviroment(const DatabaseName, TemporaryFolder: WideString);
procedure SetupDFeInitialize(DataBase: TIBDatabase); overload;
procedure SetupDFeInitialize(); overload;
procedure SetupDFeShutDown();

var
  SessionState: TSessionState;

implementation

uses
  SysUtils, StrUtils,
  SetupUnit,
  ContainerDFeUnit,
  ErpFeaturesFactoryDFeUnit, SetupConfigUnit, FileConfigUnit, hw_win_utils, ISqlLoggerUnit, ISessionContextUnit;

var
  GErpFeaturesFactoryDFe: IErpFeaturesFactoryDFe;

procedure SetupSession(
  EmpresaId, UsuarioId: Integer; const EmpresaNome, EmpresaCNPJ, UsuarioLogin, UsuarioEmail: WideString;
  CaixaUnificado: Boolean; UnificadoraId: Integer
);
begin
  SessionState.HasState := (EmpresaId > 0) or (UsuarioLogin <> '');

  SessionState.EmpresaId := EmpresaId;
  SessionState.EmpresaNome := EmpresaNome;
  SessionState.EmpresaCNPJ := EmpresaCNPJ;

  SessionState.UsuarioId := UsuarioId;
  SessionState.UsuarioLogin := UsuarioLogin;
  SessionState.UsuarioEmail := UsuarioEmail;

  SessionState.CaixaUnificado := CaixaUnificado;
  SessionState.UnificadoraId := UnificadoraId;

  SetupEnviroment(IniConf.ReadStr('Banco', 'HW'), GetPathTemp('modern'));
end;

procedure SetupEnviroment(const DatabaseName, TemporaryFolder: WideString);
begin
  SessionState.DatabaseName := DatabaseName;
  SessionState.TemporaryFolder := TemporaryFolder;
end;

procedure SetupDFeInitialize(DataBase: TIBDatabase);
var
  Session: ISessionContext;
begin
  if not SessionState.HasState then
    raise Exception.Create('SetupDFeInitialize SesstionState has no state. Call SetupSession before this');

  Session := ContainerDFe.GetInstance().GetSessionContext();

  AppSetup.Initialize(
    DataBase,
    SetupConfig.Create(
      FileConfig.Create( IfThen(IniConf.ReadStr('Sistema', 'loggeral') = 'S', ExtractFilePath(ParamStr(0)) + 'log\'), '' ),
      FileConfig.Create( ExtractFilePath(ParamStr(0)), 'erros.log' )
  ));

  Session.SetEnviroment( SessionState.DatabaseName, SessionState.TemporaryFolder );
  Session.SetEmpresa( SessionState.EmpresaId, SessionState.EmpresaNome, SessionState.EmpresaCNPJ );
  Session.SetUsuario( SessionState.UsuarioId, SessionState.UsuarioLogin, SessionState.UsuarioEmail );
  Session.SetFinanceiro( SessionState.CaixaUnificado, SessionState.UnificadoraId );

  if GErpFeaturesFactoryDFe = nil then
    GErpFeaturesFactoryDFe := ErpFeaturesFactoryDFe.Create(
      AppSetup.DatabaseConnection,
      Session,
      AppSetup.ErrorLogger
    );

  AppSetup.SqlLogger.SetOptions( [loQuery, loParam]);

  ContainerDFe.GetInstance()
    .RegisterDFeFeatures( GErpFeaturesFactoryDFe );
end;

procedure SetupDFeInitialize();
begin
  SetupDFeInitialize( nil );

  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=%s;Password=%s;LogSql=True',
     [SessionState.DatabaseName, 'sysdba', 'masterkey'])
  );
end;

procedure SetupDFeShutDown();
begin
  AppSetupShutdown();

  if Assigned(GErpFeaturesFactoryDFe) then
    FreeAndNil(GErpFeaturesFactoryDFe);
end;

end.
