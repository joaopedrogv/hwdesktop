unit IncStatisticsUseCase;

interface

uses
  Config_sistema_class,
  UseCaseBaseIntegra;

type

  TIncStatistcsUseCase = class(TUseCaseBaseIntegra)
  public
    function Run(name: string): Integer;
  end;

implementation

uses
  hw_utils,
  hw_win_utils,
  System.SysUtils;

{ TIncStatistcsUseCase }

function TIncStatistcsUseCase.Run(name: string): Integer;
const M = 'TIncStatistcsUseCase.Run';
begin
  try

    InitUseCase();

    if repo.IsCnpjHW then
      Exit(1);

    var conf := repo.GetConfig('hw_ws_envio_statisticas', repo.CodEmpresa);

    if not conf.ReadBool('Conf', 'RegistroGeral') then
      Exit(0);

    Result := repo.IncEstatistica(name);

  except on E: Exception do
    begin
      Result := -1;

      LogApp.Error('%s - %s: %S', [M, e.Message, NAME]);
      if not silent then
        ShowErro(E.Message);
    end;
  end;

end;

end.
