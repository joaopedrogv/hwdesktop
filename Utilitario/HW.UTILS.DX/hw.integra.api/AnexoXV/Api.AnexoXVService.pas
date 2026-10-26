unit Api.AnexoXVService;

interface

uses
  Hw.Servicos,
  Hw.Integra.Api,
  Hw.Json,
  AnexoXV;

type
  TAnexoXVServiceApi = class(THwIntegraApi)
  strict private
//    function ReqWithParams(controller: string; params: TArray<string>): TRestApiReq;
  private
//    FConsulta: THwServicosJSON;
  public
    function LastVersion: TVersao;
    function AmbitosChanges(sincid, offset, limit: Integer; var totalCount: Integer): TArray<TAmbito>;
    function ItemsChanges(sincid, offset, limit: Integer; var totalCount: Integer): TArray<TItem>;
    function VariantesChanges(sincid, offset, limit: Integer; var totalCount: Integer): TArray<TVariante>;
    function CestsChanges(sincid, offset, limit: Integer; var totalCount: Integer): TArray<TCest>;

//    property Consulta: THwServicosJSON read FConsulta write FConsulta;
  end;

implementation

uses
  Hw.Api.Rest,
  HW.Utils.Classes.Registros_DX,
  System.SysUtils,
  REST.Json;

{ TAnexoXVServiceApi }

function TAnexoXVServiceApi.AmbitosChanges(sincid, offset, limit: Integer;
  var totalCount: Integer): TArray<TAmbito>;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := [];
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('anexoxv/ambito/changes/%d', [sincid], ['offset=' + offset.ToString, 'limit=' + limit.ToString]);

      StatCode := Api.Get(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
      begin
        Result := TJsonHw.ToArrayObject<TAmbito>(Api.JSONReponse);

        TryStrToInt(Api.restResponse.Headers.Values['X-Total-Count'], totalCount);
      end
      else if StatCode <> 204 then
        Api.RaiseApiError;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao obter Ambits do Anexo XV';
      FLastError.Local := 'TAnexoXVService.AmbitosChanges';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TAnexoXVServiceApi.CestsChanges(sincid, offset, limit: Integer;
  var totalCount: Integer): TArray<TCest>;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := [];
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('anexoxv/cest/changes/%d', [sincid], ['offset=' + offset.ToString, 'limit=' + limit.ToString]);

      StatCode := Api.Get(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
      begin
        Result := TJsonHw.ToArrayObject<TCest>(Api.JSONReponse);

        TryStrToInt(Api.restResponse.Headers.Values['X-Total-Count'], totalCount);
      end
      else if StatCode <> 204 then
        Api.RaiseApiError;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao obter Cests do Anexo XV';
      FLastError.Local := 'TAnexoXVService.CestsChanges';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TAnexoXVServiceApi.ItemsChanges(sincid,
  offset, limit: Integer; var totalCount: Integer): TArray<TItem>;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := [];
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('anexoxv/item/changes/%d', [sincid], ['offset=' + offset.ToString, 'limit=' + limit.ToString]);

      StatCode := Api.Get(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
      begin
        Result := TJsonHw.ToArrayObject<TItem>(Api.JSONReponse);

        TryStrToInt(Api.restResponse.Headers.Values['X-Total-Count'], totalCount);
      end
      else if StatCode <> 204 then
        Api.RaiseApiError;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao obter Items do Anexo XV';
      FLastError.Local := 'TAnexoXVService.ItemsChanges';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TAnexoXVServiceApi.LastVersion: TVersao;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := nil;
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('anexoxv/versao/last');
      StatCode := Api.Get(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
        Result := TJsonHw.ToObject<TVersao>(Api.JSONReponse)
      else
        Api.RaiseApiError;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao obter Última versão do Anexo XV';
      FLastError.Local := 'TAnexoXVService.LastVersion';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TAnexoXVServiceApi.VariantesChanges(sincid, offset, limit: Integer;
  var totalCount: Integer): TArray<TVariante>;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := [];
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('anexoxv/variante/changes/%d', [sincid], ['offset=' + offset.ToString, 'limit=' + limit.ToString]);

      StatCode := Api.Get(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
      begin
        Result := TJsonHw.ToArrayObject<TVariante>(Api.JSONReponse);

        TryStrToInt(Api.restResponse.Headers.Values['X-Total-Count'], totalCount);
      end
      else if StatCode <> 204 then
        Api.RaiseApiError;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao obter Variantes do Anexo XV';
      FLastError.Local := 'TAnexoXVService.VariantesChanges';
      FLastError.Exception := e.Message;
    end;
  end;
end;

end.
