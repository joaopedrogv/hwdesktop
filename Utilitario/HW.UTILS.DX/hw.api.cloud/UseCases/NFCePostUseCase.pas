unit NFCePostUseCase;

interface

uses
  UseCaseBase;

type
  TNFCePostUseCase = class(TUseCaseBase)
  public
    procedure Run();
  end;

implementation

uses
  System.SysUtils,
  ErrorApiRes,
  RepoHw;

{ TNFCePostUseCase }

procedure TNFCePostUseCase.Run();
const M = 'TNFCePostGetUseCase.Run';
begin

  try
    if not Self.InitUseCase then
      Exit;

    var nfceId := StrToIntDef(paramsUC.Values['nfceId'], -1);
    if nfceId = -1 then
      raise Exception.Create('Parametro com Id da NFCe inválido');

    var
    dataNFCe := repo.GetNFCeData(nfceId, Self.keys);

    if not Assigned(dataNFCe) then
      raise Exception.Create(Format('Não foi encontrado no banco de dados NFCe com ID %d', [nfceId]));

    var
    nfce := api.PostNFCeData(dataNFCe);

    if not Assigned(nfce) then
      raise Exception.Create('Api não retornou nenhuma NFCe');

    repo.UpdateSeqIdGenericData(dataNFCe.nfce.table, GetLastSeqId(dataNFCe.nfce.fields, dataNFCe.nfce.registry.data, dataNFCe.keys.separator), clientSide);
    repo.PostNFCeBkp(dataNFCe);

  except
    on E: ExceptionApp do
      HandleError(M, E);

    on E: Exception do
      HandleError(M, E);
  end;
end;

end.
