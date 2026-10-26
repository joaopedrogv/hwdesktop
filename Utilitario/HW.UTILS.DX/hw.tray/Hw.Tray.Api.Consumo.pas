unit Hw.Tray.Api.Consumo;

interface

uses
  System.Classes,
  REST.Json,
  Hw.Servicos,
  HW.Json,
  Hw.Tray.Api,
  HW.Tray.Api.Category,
  Hw.Tray.Api.Rest;

type
  TTrayConsumeApi = class(THwTrayApi)
  public
    function Get<T: class, constructor>(controller, name: string; params: TArray<string>; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TArray<T>;
    function GetItem<T: class, constructor>(controller: string; params: TArray<string>; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): T;
    function Delete(controller: string; params: TArray<string>): Boolean;
    function GetConsulta(controller, name: string; params: TArray<string>; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TTrayConsulta;
  end;

implementation

uses
  Hw.Comercio.Api.Rest,
  hw_utils,
  Hw.Api.Rest,
  HW.Utils.Classes.Registros_DX,
  System.SysUtils,
  System.Net.HttpClientComponent,
  IdMultipartFormData,
  IdURI,
  System.Net.HttpClient,
  System.StrUtils;

{ TTrayConsumeApi }

function TTrayConsumeApi.Delete(controller: string;
  params: TArray<string>): Boolean;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := False;

  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      params := ['?access_token=' + Token.access_token] + params;

      Req := TRestApiReq.New(controller, System.string.Join('&', params));

      StatCode := Api.Delete(Req);

      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
        Result := True
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := Format('Erro ao deletar na Api %s', [controller]);
      FLastError.Local := 'TTrayConsumeApi.Delete';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TTrayConsumeApi.Get<T>(controller, name: string; params: TArray<string>;
  AOptions: TJsonOptions): TArray<T>;
var
  StatCode: Integer;
begin
  Result := nil;

  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      StatCode := Api.Get(ReqWithParams(controller, params));

      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(ReqWithParams(controller, params));
      end;
      if StatCode = 200 then
        Result := TTrayConsulta.ToArrayObject<T>(name, Api.JSONReponse, AOptions)
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := Format('Erro ao consultar %s na Api', [name]);
      FLastError.Local := 'TTrayConsumeApi.Get';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TTrayConsumeApi.GetConsulta(controller, name: string;
  params: TArray<string>; AOptions: TJsonOptions): TTrayConsulta;
var
  StatCode: Integer;
begin
  Result := nil;

  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      StatCode := Api.Get(ReqWithParams(controller, params));

      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(ReqWithParams(controller, params));
      end;
      if StatCode = 200 then
        Result := TTrayConsulta.ToObject(name, Api.JSONReponse, AOptions)
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := Format('Erro ao consultar %s na Api', [name]);
      FLastError.Local := 'TTrayConsumeApi.Get';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TTrayConsumeApi.GetItem<T>(controller: string;
  params: TArray<string>; AOptions: TJsonOptions): T;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := nil;

  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      params := ['?access_token=' + Token.access_token] + params;

      Req := TRestApiReq.New(controller, System.string.Join('&', params));

      StatCode := Api.Get(Req);

      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
        Result := TTrayItem.ToObject<T>(Api.JSONReponse, AOptions)
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := Format('Erro ao consultar %s na Api', [controller]);
      FLastError.Local := 'TTrayConsumeApi.Get';
      FLastError.Exception := e.Message;
    end;
  end;
end;

end.
