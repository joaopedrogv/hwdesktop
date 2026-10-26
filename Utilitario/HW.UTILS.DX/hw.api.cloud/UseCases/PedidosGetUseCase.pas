unit PedidosGetUseCase;

interface

uses
  UseCaseBase;

type
  TPedidosGetUseCase = class(TUseCaseBase)
  public
    procedure Run();
  end;

implementation

uses
  System.SysUtils,
  System.Dateutils,
  ErrorApiRes,
  RepoHw;

{ TPedidosGetUseCase }

procedure TPedidosGetUseCase.Run();
const M = 'TNFCePostGetUseCase.Run';
begin

  try
    if not Self.InitUseCase(False) then
      Exit;

    var fs := TFormatSettings.Create();
    fs.ShortDateFormat := 'dd/mm/yyyy';
//    var date := formaStrToDate(paramsUC.Values['date'], TFormatSettings.Invariant);
    var date := StrToDate(paramsUC.Values['date'], fs);

    var seqid := repo.GetLastSincIdTable('PEDVENDA', date);

    var propostas := api.GetPedidos(date);

    repo.PostPedVenda(propostas);

  except
    on E: ExceptionApp do
      HandleError(M, E);

    on E: Exception do
      HandleError(M, E);
  end;
end;

end.
