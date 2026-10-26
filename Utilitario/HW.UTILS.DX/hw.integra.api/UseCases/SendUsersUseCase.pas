unit SendUsersUseCase;

interface

uses
  Config_sistema_class,
  UseCaseBaseIntegra;

type
  TStatusEnvio = (seSemEvento, seError, seSucesso);

  TSendUsersUseCase = class(TUseCaseBaseIntegra)
  private
    statusEnv: TStatusEnvio;
    conf: TConfig_sistema_class;
    procedure HandleDataConsulta;
  protected
    function IsTimeToRun: Boolean; override;
  public
    function Run(): Boolean;
  end;

implementation

uses
  hw_utils,
  hw_win_utils,
  PrintModels,
  System.SysUtils,
  System.StrUtils,
  System.DateUtils,
  System.Math,
  System.Classes,
  UsuarioClienteEtd;

{ TSendUsersUseCase }

procedure TSendUsersUseCase.HandleDataConsulta;
begin
  // data consulta | sucesso | falha
  conf.value1_vc := Format('%s|%s|%s', [
    FormatDateTime('dd/mm/yyyy hh:mm:ss', repo.DataHoraAtual),
    IfThen(statusEnv = seSucesso,
           FormatDateTime('dd/mm/yyyy hh:mm:ss', repo.DataHoraAtual),
           StrByPosition('|' + conf.AsString, 2)),
    IfThen(statusEnv = seError,
           FormatDateTime('dd/mm/yyyy hh:mm:ss', repo.DataHoraAtual),
           StrByPosition('|' + conf.AsString, 3))]);

  conf.WriteBool('HWUtils', 'ComErro', statusEnv = seError);

//  if statusEnv = seSucesso then
//    conf.WriteInteger('Conf', 'QtdeFalhas', 0)
//  else if statusEnv = seError then
//    conf.WriteInteger('Conf', 'QtdeFalhas', conf.ReadInteger('Conf', 'QtdeFalhas') + 1);

  repo.SaveConfig(conf);
end;

function TSendUsersUseCase.IsTimeToRun: Boolean;
var
  dhConsulta: TDateTime;
begin
  if IsPcHw then
    Exit(False);

  if not TryStrToDateTime(StrByPosition('|' + conf.AsString, 2), dhConsulta) then //Nunca enviou, sem hora de sucesso
    Exit(True)
  else if TryStrToDateTime(StrByPosition('|' + conf.AsString, 1), dhConsulta) then //calcula proxima data de consulta
    dhConsulta := dhConsulta + EncodeTime(IfThen(conf.AsInteger > 99, 24, IfThen(conf.AsInteger <= 0, 2, conf.AsInteger)), 0, 0, 0)
  else
    dhConsulta := repo.DataHoraAtual - EncodeTime(24, 0, 0, 0);

  Exit(dhConsulta < repo.DataHoraAtual);
end;

function TSendUsersUseCase.Run: Boolean;
const M = 'TSendUsersuseCase.Run';
begin
  try

    InitUseCase();

    if repo.IsCnpjHW then
      Exit(True);

    conf := repo.GetConfig('hw_ws_envio_colaboradores_status', repo.CodEmpresa);
    statusEnv := seSemEvento;

    if not IsTimeToRun then
      Exit(True);

    var confs := api.GetConfsUsuariosCliente();

    if confs.Ativo then
    begin

      var users := repo.GetUsuariosCliente();

      if Length(users) > 0 then
        if api.PostUsuariosCliente(users) then
        begin
          repo.UpdateStatusWsUsuariosCliente<TUsuarioCliente>(users);
          statusEnv := seSucesso;
        end;

      var logins := repo.GetUsuariosClientePorLogin(confs.DiasLogin);

      if Length(logins) > 0 then
        if api.PostUsuariosClienteLogin(logins) then
        begin
          repo.UpdateStatusWsUsuariosCliente<TUsuarioClienteBase>(logins);
          statusEnv := seSucesso;
        end;

    end;

    HandleDataConsulta;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      statusEnv := seError;
      HandleDataConsulta;

      LogApp.Error('%s - %s', [M, e.Message]);
      if not silent then
        ShowErro(E.Message);
    end;
  end;

end;

end.
