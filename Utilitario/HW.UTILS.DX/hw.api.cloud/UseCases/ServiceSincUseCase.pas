unit ServiceSincUseCase;

interface

uses
  UseCaseBase;

type
  TServiceSincUseCase = class(TUseCaseBase)
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

{ TServiceSincUseCase }

procedure TServiceSincUseCase.Run;
const M = 'TServiceSincUseCase.Run';
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

    {$REGION 'Sincronização exclusoes server -> client'}
    seqid := repo.GetLastSincIdDeletedTables(serverSide);
    skip  := 0;

    while skip <> - 1 do
    begin

      var deleteds := api.GetDeleted(seqid, skip, limit);

      if Assigned(deleteds) and (Length(deleteds) > 0 ) then
      begin
        repo.PostDeleted(deleteds);

        skip := skip + Length(deleteds);
      end
      else
        skip := - 1;
    end;
    {$ENDREGION}

    {$REGION 'Sincronização exclusoes client - server'}
    seqid := repo.GetLastSincIdDeletedTables(clientSide);
    skip  := 0;

    while skip <> - 1 do
    begin

      var deletedsDb := repo.GetDeleted(seqid, skip);

      if Assigned(deletedsDb) and (Length(deletedsDb) > 0) then
      begin
        if api.PostDeleted(deletedsDb) then
        begin
          countRecords := countRecords + Length(deletedsDb);
          repo.UpdateSeqIdGenericData('SINCOFF_DEL', deletedsDb[High(deletedsDb)].id, clientSide);
          skip := skip + Length(deletedsDb);
        end
        else
          skip := - 1;
      end
      else
        skip := - 1;
    end;
    {$ENDREGION}

    {$REGION 'Sincronizacao de tabelas server -> client'}
    for itemSh in schema do
      if (not MatchText(itemSh.table, TABS_NOT_REP)) then
      begin
        ld := ldServerClient;

  //      try
//          repoLog.Info(ldClientServer, 'Obtendo schema');

          seqid := repo.GetLastSincIdTable(itemSh.table, serverSide);
          skip  := 0;

          while skip <> - 1 do
          begin

            var
            generic := api.GetGenericData(itemSh.table, seqid, skip, limit, Self.keys);

            if Assigned(generic) then
            begin
              if Length(generic.list) > 0 then
              begin
                countRecords := countRecords + 1;

                if not repo.PostGenericData2(generic) then
                begin
                  Inc(FcountErrors);
                  skip := - 1;
                end
                else
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
    {$ENDREGION}

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

    {$REGION 'Sincronizacao das tabelas da NFCe client -> server'}

    ld := ldClientServer;
    seqid := repo.GetLastSincIdTable('NFCE', clientSide);
    skip  := 0;

    while skip <> -1 do
    begin
      var nfces := repo.GetNFCeList(caixaId, seqid, skip);

      if Length(nfces) > 0 then
      begin
        countRecords := countRecords + Length(nfces);
        for var I := Low(nfces) to High(nfces) do
        begin
          var dataNFCe := repo.GetNFCeData(nfces[I].id, Self.keys);

          var nfce := api.PostNFCeData(dataNFCe);

          if not Assigned(nfce) then
            raise Exception.Create('Api não retornou nenhuma NFCe');

          repo.UpdateSeqIdGenericData(dataNFCe.nfce.table, GetLastSeqId(dataNFCe.nfce.fields, dataNFCe.nfce.registry.data, dataNFCe.keys.separator), clientSide);

          repo.PostNFCe(nfces[I].id, nfce, dataNFCe);
//          repo.PostNFCeBkp(dataNFCe);
        end;

        skip := skip + Length(nfces);
      end
      else
        skip := -1;

    end;

    {$ENDREGION}

    {$REGION 'Enviando Erros'}
    ld := ldClientServer;
    if (Length(repo.clientError.errors) > 0) or
      (Length(repo.clientError.dataHandle) > 0) then
      api.PostClientError(repo.clientError);
    {$ENDREGION}

    repoLog.CheckAndClearLogData;

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
