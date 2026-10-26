unit SetupEFDUnit;

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
  end;

procedure SetupSession(
  EmpresaId, UsuarioId: Integer;
  const EmpresaNome, EmpresaCNPJ, UsuarioLogin, UsuarioEmail: WideString;
  CaixaUnificado: Boolean;
  UnificadoraId: Integer
);
procedure SetupEFDInitialize(DataBase: TIBDatabase); overload;
procedure SetupEFDInitialize(); overload;
procedure SetupEFDShutDown();

var
  SessionState: TSessionState;

implementation

uses
  SysUtils, StrUtils,
  SetupUnit,
  ContainerEFDUnit,
  ErpFeaturesFactoryEFDUnit, SetupConfigUnit, FileConfigUnit, hw_win_utils, ISqlLoggerUnit, ISessionContextUnit;

var
  GErpFeaturesFactoryEFD: IErpFeaturesFactoryEFD;

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
end;

procedure SetupEFDInitialize(DataBase: TIBDatabase);
var
  Session: ISessionContext;
begin
  if not SessionState.HasState then
    raise Exception.Create('SetupEFDInitialize SesstionState has no state. Call SetupSession before this');

  Session := ContainerEFD.GetInstance().GetSessionContext();

  AppSetup.Initialize(
    DataBase,
    SetupConfig.Create(
      FileConfig.Create( IfThen(IniConf.ReadStr('Sistema', 'loggeral') = 'S', ExtractFilePath(ParamStr(0)) + 'log\'), '' ),
      FileConfig.Create( ExtractFilePath(ParamStr(0)), 'erros.log' )
  ));

  Session.SetEnviroment( AppSetup.DatabaseConnection.GetDatabaseName(), GetPathTemp('modern') );
  Session.SetEmpresa( SessionState.EmpresaId, SessionState.EmpresaNome, SessionState.EmpresaCNPJ );
  Session.SetUsuario( SessionState.UsuarioId, SessionState.UsuarioLogin, SessionState.UsuarioEmail );
  Session.SetFinanceiro( SessionState.CaixaUnificado, SessionState.UnificadoraId );

  if GErpFeaturesFactoryEFD = nil then
    GErpFeaturesFactoryEFD := ErpFeaturesFactoryEFD.Create(
      AppSetup.DatabaseConnection,
      Session,
      AppSetup.ErrorLogger
    );

  AppSetup.SqlLogger.SetOptions( [loQuery, loParam]);

  ContainerEFD.GetInstance()
    .RegisterErpFeaturesEFD( GErpFeaturesFactoryEFD );
end;

procedure SetupEFDInitialize();
begin
  SetupEFDInitialize( nil );

  AppSetup.DatabaseConnection.Connect(
    Format('ConnectionString=%s;UserName=%s;Password=%s;LogSql=True',
     [IniConf.ReadStr('Banco', 'HW'), 'sysdba', 'masterkey'])
  );
end;

procedure SetupEFDShutDown();
begin
  AppSetupShutdown();

  if Assigned(GErpFeaturesFactoryEFD) then
    FreeAndNil(GErpFeaturesFactoryEFD);
end;

end.
