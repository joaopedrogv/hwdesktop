unit GenericDataGetUseCase;

interface

uses
  UseCaseBase;

type
  TGenericDataGetUseCase = class(TUseCaseBase)
  public
    procedure Run();
  end;

implementation

uses
  hw_progress_utils,
  hw_utils,
  hw_win_utils,
  SchemaEtd,
  GenericDataEtd,
  ErrorApiRes,
  System.SysUtils,
  System.StrUtils,
  ConstsBase;

{ TGenericDataGetUseCase }

procedure TGenericDataGetUseCase.Run;
const M = 'TGenericDataGetUseCase.Run';
begin
   {
  try
    if not Self.InitUseCase then
      Exit;

    var
    schema := api.SchemaGet;

    if Length(schema) = 0 then
      raise Exception.Create('Api não retornou nenhum schema');

    for var item in schema do  if (not MatchText(item.table, TABS_GENERIC_NFCES)) then
    begin
      var
      limit := 50;
      var
      skip := 0;

//      try

        var
        seqid := repo.GetLastSincIdTable(item.table);

        while skip <> - 1 do
        begin

          var
          generic := api.GetGenericData(item.table, seqid, skip, limit);

          if Assigned(generic) then
          begin
            if Length(generic.list) > 0 then
            begin
              repo.PostGenericData2(generic);
              skip := skip + Length(generic.list);
            end
            else
              skip := - 1;
          end
          else
            skip := - 1;
        end;

//      trantar algum erro em especial aqui  ..
//      except
//        on E: Exception do
//          on E: ExceptionApp do
//            HandleError(M, E);
//
//        on E: Exception do
//          HandleError(M, E);
//      end;

    end;

  except
    on E: ExceptionApp do
      HandleError(M, E);

    on E: Exception do
      HandleError(M, E);
  end;
  }
end;

end.
