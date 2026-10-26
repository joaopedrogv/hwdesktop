unit TestConnectionUseCase;

interface

uses
  UseCaseBase;

type
  TTestConnectionUseCase = class(TUseCaseBase)
  public
    procedure Run();
  end;

implementation

uses
  System.SysUtils,
  hw_utils,
  ErrorApiRes,
  RepoHw;

{ TTestConnectionUseCase }

procedure TTestConnectionUseCase.Run;
const M = 'TTestConnectionUseCase.Run';
begin

  silent := False;

  try
    if not Self.InitUseCase(False) then
      Exit;

    var caixa := api.GetCaixa;

    if not Assigned(caixa) then
      ShowAtencao('Conexão estabelecida com API, porém não retornou dados do Caixa')
    else
      ShowAtencao('Sucesso na conexão com API' + sLineBreak +
                  'Url: %s' + sLineBreak +
                  'Caixa: %s' + sLineBreak +
                  'Code: %s', [api.Api.BaseUrl, caixa.name, caixa.refreshToken]);

  except
    on E: ExceptionApp do
      HandleError(M, E);

    on E: Exception do
      HandleError(M, E);
  end;
end;

end.
