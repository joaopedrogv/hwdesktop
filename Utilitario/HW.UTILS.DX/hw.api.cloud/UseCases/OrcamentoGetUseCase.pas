unit OrcamentoGetUseCase;

interface

uses
  UseCaseBase;

type
  TOrcamentoGetUseCase = class(TUseCaseBase)
  public
    procedure Run();
  end;

implementation

uses
  System.SysUtils,
  ErrorApiRes,
  RepoHw;

{ TOrcamentoGetUseCase }

procedure TOrcamentoGetUseCase.Run();
const M = 'TNFCePostGetUseCase.Run';
begin

  try
    if not Self.InitUseCase(False) then
      Exit;

    var id := StrToIntDef(paramsUC.Values['id'], 0);
    if id = 0 then
      Exit;

    var orcamento := api.GetOrcamento(id);

    repo.PostPedVenda([orcamento]);

  except
    on E: ExceptionApp do
      HandleError(M, E);

    on E: Exception do
      HandleError(M, E);
  end;
end;

end.
