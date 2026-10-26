unit ApiCloud;

interface

uses
  Hw.Servicos,
  Hw.Integra.Api,
  Hw.Json,
  BaseApiRes,
  SchemaEtd,
  RepoLog,
  GenericDataEtd,
  NFCeDataEtd,
  NFCeEtd,
  PropostaEtd,
  CaixaEtd,
  DeletedEtd;

const
  ERRO_DEFAULT = 'Erro não catalogado de execução na API';

type

  TApiCloud = class(TBaseApi)
  strict private
  public
    function SchemaGet: TArray< TSchema >;
    function GetCaixa(seqId: Integer = 0): TCaixa;
    function GetGenericData(
      table             : string;
      seqid, skip, limit: Integer;
      keys: TKeyWords): TGenericData;
    function PostGenericData(data: TGenericData): Boolean;
    function PostNFCeData(nfce: TNFCeData): TNFCe;
    function PostClientError(data: TClientError): Boolean;
    function GetPedidos(date: TDate): TArray<TProposta>;
    function GetOrcamento(id: Integer): TProposta;
    function GetDeleted(seqid, skip, limit: Integer): TArray<TDeleted>;
    function PostDeleted(payload: TArray<TDeleted>): Boolean;
  end;

implementation

uses
  Hw.Api.Rest,
  System.SysUtils,
  System.StrUtils,
  System.DateUtils,
  System.TypInfo;

{ TApiCloud }

function TApiCloud.GetDeleted(seqid, skip,
  limit: Integer): TArray<TDeleted>;
begin
  Result := nil;
  HandleLog('genericdata/deleted - > seqid=%d&skip=%d&limit=%d', [seqid, skip, limit]);
  repoLog.Info(ldServerClient, Format('Tabelas com Exclusões Seq=%d Skip=%d Limit=%d', [seqid, skip, limit]));

  with Get(TReq.New('genericdata/deleted?seqid=%d&skip=%d&limit=%d', [seqid, skip, limit])) do
    if isSuccess then
    begin
      Result := TJsonHw.ToArrayObject< TDeleted >(data);
      if Assigned(Result) then
        HandleLog('genericdata-> count=%d', [Length(Result)]);
    end
    else
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
end;

function TApiCloud.GetGenericData(
  table: string;
  seqid, skip,
  limit: Integer;
  keys: TKeyWords): TGenericData;
begin
  Result := nil;
  HandleLog('genericdata - > table=%s&seqid=%d&skip=%d&limit=%d', [table, seqid, skip, limit]);
  repoLog.Info(ldServerClient, Format('Tabela=%s Seq=%d Skip=%d Limit=%d', [table, seqid, skip, limit]));

  with Get(TReq.New('genericdata?table=%s&seqid=%d&skip=%d&limit=%d', [table, seqid, skip, limit], TJsonHw.ToJsonString(keys))) do
    if isSuccess then
    begin
      Result := TJsonHw.ToObject< TGenericData >(data);
      if Assigned(Result) then
        HandleLog('genericdata-> count=%d', [Length(Result.list)]);
    end
    else
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
end;

function TApiCloud.GetOrcamento(id: Integer): TProposta;
begin
  Result := nil;
  HandleLog('proposta/orcamento - > get');
  repoLog.Info(ldServerClient, Format('Tabela=PEDVENDA - Orçamento Num=%d', [id]));
  with Get(TReq.New('proposta/orcamento/%d', [id])) do
    if isSuccess then
    begin
      Result := TJsonHw.ToObject< TProposta >(data);
      if Assigned(Result) then
        HandleLog('proposta/orcamento-> count=1');
    end
    else
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
end;

function TApiCloud.GetPedidos(date: TDate): TArray<TProposta>;
begin
  Result := nil;
  HandleLog('proposta - > get');
  repoLog.Info(ldServerClient, Format('Tabela=PEDVENDA - Venda - Data=%s', [DateToStr(date)]));
  with Get(TReq.New('proposta/%s', [DateToISO8601(date)])) do
    if isSuccess then
    begin
      Result := TJsonHw.ToArrayObject< TProposta >(data);
      if Assigned(Result) then
        HandleLog('proposta-> count=%d', [Length(Result)]);
    end
    else
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
end;

function TApiCloud.GetCaixa(seqId: Integer): TCaixa;
begin
  Result := nil;
  HandleLog('caixa -> get');
  repoLog.Info(ldServerClient, 'Obtendo Caixa');
  with GetT < TArray < TSchema >> (TReq.New('caixa/token/%s?seqid=%d', [caixaCode, seqId])) do
    if isSuccess then
    begin
      Result := TJsonHw.ToObject< TCaixa >(data);
      if Assigned(Result) then
        HandleLog('caixa get -> 1');
    end
    else
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
end;

function TApiCloud.PostClientError(data: TClientError): Boolean;
begin
  Result := False;
  HandleLog('genericdata/error - > post');
  with Post(TReq.New('genericdata/error', '', TJsonHw.ToJsonString(data))) do
  begin
    HandleLog('genericdata/error - > post -> status=%d', [code]);
    Result := isSuccess;
    if not Result then
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
  end;
end;

function TApiCloud.PostDeleted(payload: TArray<TDeleted>): Boolean;
begin
  Result := False;
  HandleLog('genericdata/deleted - > post');
  with Post(TReq.New('genericdata/deleted', '', TJsonHw.ToArrayJson<TDeleted>(payload))) do
  begin
    HandleLog('genericdata/deleted - > post -> status=%d', [code]);
    Result := isSuccess;
    if not Result then
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
  end;
end;

function TApiCloud.PostGenericData(data: TGenericData): Boolean;
begin
  Result := False;
  HandleLog('genericdata - > post');
  with Post(TReq.New('genericdata', '', TJsonHw.ToJsonString(data))) do
  begin
    HandleLog('genericdata - > post -> status=%d', [code]);
    Result := isSuccess;
    if not Result then
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
  end;
end;

function TApiCloud.PostNFCeData(nfce: TNFCeData): TNFCe;
begin
  Result := nil;
  HandleLog('nfce');
  with PostT < TNFCe > (TReq.New('nfce', '', TJsonHw.ToJsonString(nfce))) do
    if isSuccess then
    begin
      Result := TJsonHw.ToObject< TNFCe >(data);
      if Assigned(Result) then
        HandleLog('nfce -> %d - %s - %s - %s - %d', [Result.empresaId, Result.status, Result.situacao, Result.guidt, Result.sincOff]);
    end
    else
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
end;

function TApiCloud.SchemaGet: TArray< TSchema >;
begin
  Result := [];
  HandleLog('schema');
  repoLog.Info(ldServerClient, 'Obtendo Schema');
  with GetT < TArray < TSchema >> (TReq.New('schema')) do
    if isSuccess then
    begin
      Result := TJsonHw.ToArrayObject< TSchema >(data);
      if Assigned(Result) then
        HandleLog('schema -> %d', [Length(result)]);
    end
    else
      repoLog.Error(ldServerClient, ' >> Api << ' + IfThen(not Api.LastError.msg.IsEmpty, Api.LastError.msg.Trim(), ERRO_DEFAULT));
end;

end.
