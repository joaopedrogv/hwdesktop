unit Hw.Nuvemshop.Api.Consumo;

interface

uses
  System.Classes,
  REST.Json,
  Hw.Servicos,
  HW.Json,
  Hw.Nuvemshop.Api,
  HW.Nuvemshop.Api.Category,
  Hw.Nuvemshop.Api.Rest;

type
  TNuvemshopConsumeApi = class(THwNuvemshopApi)
  public
    function Get<T: class, constructor>(controller, name: string; params: TArray<string>; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TArray<T>;
    function GetCount<T: class, constructor>(controller, name: string; params: TArray<string>; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): Integer;
    function GetItem<T: class, constructor>(controller: string; params: TArray<string>; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): T;
    function Delete(controller: string; params: TArray<string>): Boolean;
    function GetConsulta(controller, name: string; params: TArray<string>; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TNuvemshopConsulta;
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

{ TNuvemshopConsumeApi }

function TNuvemshopConsumeApi.Delete(controller: string;
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
      params := ['?Authentication=' + Token] + params;

      Req := TRestApiReq.New(controller, System.string.Join('&', params));

      StatCode := Api.Delete(Req);

      if StatCode = 401 then
      begin
        Token := '';
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
      FLastError.Local := 'TNuvemshopConsumeApi.Delete';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TNuvemshopConsumeApi.Get<T>(controller, name: string; params: TArray<string>;
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
        Token := '';
        if ConcederAcesso > 0 then
          StatCode := Api.Get(ReqWithParams(controller, params));
      end;
      if StatCode = 200 then
        Result := TJsonHw.ToArrayObject<T>(Api.JSONReponse, AOptions) //Result := TNuvemshopConsulta.ToArrayObject<T>(name, Api.JSONReponse, AOptions)
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := Format('Erro ao consultar %s na Api', [name]);
      FLastError.Local := 'TNuvemshopConsumeApi.Get';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TNuvemshopConsumeApi.GetConsulta(controller, name: string;
  params: TArray<string>; AOptions: TJsonOptions): TNuvemshopConsulta;
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
        Token := '';
        if ConcederAcesso > 0 then
          StatCode := Api.Get(ReqWithParams(controller, params));
      end;
      if StatCode = 200 then
        Result := TNuvemshopConsulta.FromJson(Api.JSONReponse)//TNuvemshopConsulta.ToObject(name, Api.JSONReponse, AOptions)
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := Format('Erro ao consultar %s na Api', [name]);
      FLastError.Local := 'TNuvemshopConsumeApi.Get';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TNuvemshopConsumeApi.GetCount<T>(controller, name: string;
  params: TArray<string>; AOptions: TJsonOptions): Integer;
var
  StatCode: Integer;
begin
  Result := 0;

  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      StatCode := Api.Get(ReqWithParams(controller, params));

      if StatCode = 401 then
      begin
        Token := '';
        if ConcederAcesso > 0 then
          StatCode := Api.Get(ReqWithParams(controller, params));
      end;
      if StatCode = 200 then
        Result := Api.Count(ReqWithParams(controller, params))
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := Format('Erro ao consultar %s na Api', [name]);
      FLastError.Local := 'TNuvemshopConsumeApi.Get';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TNuvemshopConsumeApi.GetItem<T>(controller: string;
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
      params := ['?Authentication=' + Token] + params;

      Req := TRestApiReq.New(controller, System.string.Join('&', params));

      StatCode := Api.Get(Req);

      if StatCode = 401 then
      begin
        Token := '';
        if ConcederAcesso > 0 then
          StatCode := Api.Get(Req);
      end;
      if StatCode = 200 then
        Result := TJsonHw.ToObject<T>(Api.JSONReponse, AOptions) //Result := TNuvemshopItem.ToObject<T>(Api.JSONReponse, AOptions)
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := Format('Erro ao consultar %s na Api', [controller]);
      FLastError.Local := 'TNuvemshopConsumeApi.Get';
      FLastError.Exception := e.Message;
    end;
  end;
end;

end.
