unit AddUserStatisticsUseCase;

interface

uses
  Config_sistema_class,
  UseCaseBaseIntegra;

type

  TAddUserStatistcsUseCase = class(TUseCaseBaseIntegra)
  public
    function Run(userHW: string): Boolean;
  end;

implementation

uses
  hw_utils,
  hw_win_utils,
  System.SysUtils;

{ TAddUserStatistcsUseCase }

function TAddUserStatistcsUseCase.Run(userHW: string): Boolean;
const M = 'TAddUserStatistcsUseCase.Run';
begin
  try

    InitUseCase();

    if repo.IsCnpjHW then
      Exit(True);

    var conf := repo.GetConfig('hw_ws_envio_statisticas', repo.CodEmpresa);

    if not conf.ReadBool('Conf', 'RegistroUsuarios') then
      Exit(True);

    repo.AddUserEstatistica(userHW);

    Result := True;

  except on E: Exception do
    begin
      Result := False;

      LogApp.Error('%s - %s', [M, e.Message]);
      if not silent then
        ShowErro(E.Message);
    end;
  end;

end;

end.

