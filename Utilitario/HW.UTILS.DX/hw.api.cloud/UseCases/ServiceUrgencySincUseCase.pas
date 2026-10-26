unit ServiceUrgencySincUseCase;

interface

uses
  UseCaseBase;

type
  TServiceUrgencySincUseCase = class(TUseCaseBase)
  private
    FcountRecords: Integer;
    FcountErrors: Integer;
  public
    procedure Run();

    property countRecords: Integer read FcountRecords write FcountRecords;
    property countErrors: Integer read FcountErrors write FcountErrors;
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
  System.Math,
  ConstsBase,
  RepoHw,
  RepoLog;

{ TServiceUrgencySincUseCase }

procedure TServiceUrgencySincUseCase.Run;
const M = 'TServiceUrgencySincUseCase.Run';
var
  skip : Integer;
  seqid: Integer;
  itemSh: TSchema;
  ld: LogDirection;
begin
  countRecords := 0;
  countErrors := 0;

  try
    if not Self.InitUseCase(False) then
      Exit;

    seqid := repo.GetLastSincIdTable('NFC_EMISSOR', serverSide);
    var caixa := api.GetCaixa(seqid);
    repo.PostCaixa(caixa);

    var schema := api.SchemaGet;

    if Length(schema) = 0 then
      raise Exception.Create('Api não retornou nenhum schema');

    repo.SetDateOnline(caixaId);
    repo.CheckSchema(schema);

    {$REGION 'Sincronizacao de tabelas client -> server'}
    for itemSh in schema do
      if MatchText(itemSh.table, TABS_BIDIRECIONAIS) then
      begin
        ld := ldClientServer;

  //      try
          seqid := repo.GetLastSincIdTable(itemSh.table, clientSide);
          skip  := 0;

          while skip <> - 1 do
          begin
            var genericDb := repo.GetGenericData(itemSh.table, caixaId, seqid, skip, Self.keys);

            if Assigned(genericDb) and (Length(genericDb.list) > 0) then
            begin
              if api.PostGenericData(genericDb) then
              begin
                countRecords := countRecords + Length(genericDb.list);
                repo.UpdateSeqIdGenericData(itemSh.table, GetLastSeqId(genericDb.fields, genericDb.list[High(genericDb.list)].data, genericDb.keys.separator), clientSide);
                skip := skip + Length(genericDb.list);
              end
              else
              begin
                Inc(FcountErrors);
                skip := - 1;
              end;
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

    {$ENDREGION}

  except
    on E: ExceptionApp do
    begin
      countRecords := -1;
      repoLog.Error(ld, E.Message);
      HandleError(M, E);
      repo.HandlePermision(E.Message);
    end;

    on E: Exception do
    begin
      countRecords := -1;
      repoLog.Error(ld, E.Message);
      HandleError(M, E);
      repo.HandlePermision(E.Message);
    end;
  end;
end;

end.
