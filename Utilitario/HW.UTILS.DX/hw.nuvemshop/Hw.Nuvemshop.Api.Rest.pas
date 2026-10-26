unit Hw.Nuvemshop.Api.Rest;

interface

uses
  HW.Api.Rest,
  System.Classes,
  REST.Client,
  REST.Types,
  REST.Json;

type

  TNuvemshopErrorApi = class
  private
    Fname: String;
    Fcode: Integer;
    Fcauses: TArray<string>;
    Ferror_code: Integer;
    Furl: String;
  published
    property code: Integer read Fcode write Fcode;
    property url: String read Furl write Furl;
    property name: String read Fname write Fname;
    property error_code: Integer read Ferror_code write Ferror_code;
    property causes: TArray<string> read Fcauses write Fcauses;// Collection
  end;

  TNuvemshopTokenApi = class
  private
    Fstore_id: String;
    Fdate_activated: TDateTime;
    Fcode: Integer;
    Fmessage: String;
    Fdate_expiration_access_token: TDateTime;
    Fapi_host: String;
    Frefresh_token: String;
    Faccess_token: String;
    Fdate_expiration_refresh_token: TDateTime;
  published
    property message: String read Fmessage write Fmessage;
    property code: Integer read Fcode write Fcode;
    property access_token: String read Faccess_token write Faccess_token;
    property refresh_token: String read Frefresh_token write Frefresh_token;
    property date_expiration_access_token: TDateTime read Fdate_expiration_access_token write Fdate_expiration_access_token;
    property date_expiration_refresh_token: TDateTime read Fdate_expiration_refresh_token write Fdate_expiration_refresh_token;
    property date_activated: TDateTime read Fdate_activated write Fdate_activated;
    property api_host: String read Fapi_host write Fapi_host;
    property store_id: String read Fstore_id write Fstore_id;
  end;

  TNuvemshopPaging = class
  private
    Flimit: Integer;
    FmaxLimit: Integer;
    Ftotal: Integer;
    Foffset: Integer;
    Fpage: Integer;
  published
    property total: Integer read Ftotal write Ftotal;
    property page: Integer read Fpage write Fpage;
    property offset: Integer read Foffset write Foffset;
    property limit: Integer read Flimit write Flimit;
    property maxLimit: Integer read FmaxLimit write FmaxLimit;
  end;

  TNuvemshopSort = class
  private
    Fid: String;
  published
    property id: String read Fid write Fid;
  end;

  TNuvemshopDelete = class
  private
    Fcode: Integer;
    Fmessage: String;
    Fid: String;
  published
    property message: String read Fmessage write Fmessage;
    property id: String read Fid write Fid;
    property code: Integer read Fcode write Fcode;
  end;

  TNuvemshopConsulta = class
  private
    Fsort: TArray<TNuvemshopSort>;
    FavailableFilters: TArray<string>;
    //FappliedFilters: TArray<TObject>;
    Fpaging: TNuvemshopPaging;
    FdadosDinamicos: string;
    FtotalNotFiltered: Integer;
    Ftotal: Integer;
    Frows: string;
  published
    class function FromJson(AJson: string): TNuvemshopConsulta;
    class function ToArrayObject<T: class, constructor>(name, json: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TArray<T>;
    class function ToObject(name, json: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): TNuvemshopConsulta;

    property paging: TNuvemshopPaging read Fpaging write Fpaging;// class
    property sort: TArray<TNuvemshopSort> read Fsort write Fsort;// Collection
    property availableFilters: TArray<string> read FavailableFilters write FavailableFilters;// Collection
    //property appliedFilters: TArray<TObject> read FappliedFilters write FappliedFilters;// Collection
    property dadosDinamicos: string read FdadosDinamicos write FdadosDinamicos;

    property total: Integer read Ftotal write Ftotal;
    property totalNotFiltered: Integer read FtotalNotFiltered write FtotalNotFiltered;
    property rows: string read Frows write Frows;// Collection
  end;

  TNuvemshopItem = class
  published
    class function ToObject<T: class, constructor>(json: string; AOptions: TJsonOptions = [joDateIsUTC, joDateFormatISO8601]): T;
  end;

  TNuvemshopRestApi = class(TRestApiNuvemshop)
  private
    FErroApi: TNuvemshopErrorApi;
    FToken: TNuvemshopTokenApi;
  protected
    procedure AfterContentResponse; override;
  public
    procedure RaiseApiError;
    procedure AssignTokenAuthorization(Token: TNuvemshopTokenApi);
    procedure ClearTokenAuthorization;

    property ErroApi: TNuvemshopErrorApi read FErroApi write FErroApi;
  end;

implementation
uses
  System.SysUtils,
  System.StrUtils,
  System.Json,
  HW.Json;

{ TNuvemshopRestApi }

procedure TNuvemshopRestApi.AfterContentResponse;
begin
  inherited;
  case restResponse.StatusCode of
    200 :
      begin
        if Assigned(FEventResponse) then
          FEventResponse(restResponse);
      end;

    400:
      begin
        if not JSONReponse.IsEmpty then
          FErroApi := TJson.JsonToObject<TNuvemshopErrorApi>(JSONReponse)
        else
        begin
          ErroApi := TNuvemshopErrorApi.Create;
          ErroApi.code := restResponse.StatusCode;
          ErroApi.name := 'Requisição Inválida';
        end;

        if Assigned(FEventResponse) then
          FEventResponse( FErroApi );
      end;

    401:
      begin
        if not JSONReponse.IsEmpty then
          FErroApi := TJson.JsonToObject<TNuvemshopErrorApi>(JSONReponse)
        else
        begin
          ErroApi := TNuvemshopErrorApi.Create;
          ErroApi.code := restResponse.StatusCode;
          ErroApi.name := 'Acesso não Autorizado';
        end;

        if Assigned(FEventResponse) then
          FEventResponse( FErroApi );
      end;
  end;
end;

procedure TNuvemshopRestApi.AssignTokenAuthorization(Token: TNuvemshopTokenApi);
begin
  if Token = nil then
    Exit;

  FToken := Token;
  LogMessage('[AssignTokenAuthorization: %s]', [FToken.api_host]);

  restRequest.Params.Clear;
//  with restRequest.Params.AddItem do
//  begin
//    name    := 'access_token';
//    Value   := FToken.access_token;
//    Kind    := pkGETorPOST;
//    //Options := [poDoNotEncode];
//  end;
end;

procedure TNuvemshopRestApi.ClearTokenAuthorization;
begin
  LogMessage('[ClearTokenAuthorization]');
  FToken := nil;
end;

procedure TNuvemshopRestApi.RaiseApiError;
begin
  if Assigned(ErroApi) then
    raise Exception.Create(Format('%d %s - %s', [ErroApi.error_code, ErroApi.name, System.String.Join(', ', ErroApi.causes)]));
end;

{ TNuvemshopConsulta }

class function TNuvemshopConsulta.FromJson(AJson: string): TNuvemshopConsulta;
var
  root: TJSONObject;
  pair: TJSONPair;
begin
  if (AJson.Trim = '') or (AJson.Trim.ToLower = 'null') then
    Exit(nil);

  Result := TJsonHw.ToObject<TNuvemshopConsulta>(AJson);

  if Result = nil then
    Exit;

  root := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJson),0) as TJSONObject;

  if root.Count = 0 then
    Exit;

  for pair in root do
    if pair.JsonString.Value.ToLower.Trim.Equals('rows') then
    begin
      Result.rows := pair.JsonValue.ToJSON;
      Exit;
    end;
end;

class function TNuvemshopConsulta.ToArrayObject<T>(name, json: string; AOptions: TJsonOptions): TArray<T>;
var
  jsonObj: TJSONObject;
  pair: TJSONPair;
  str: string;
  O: TArray<T>;
begin
  if MatchStr(json.Trim, ['', 'null', '[]']) then
    Exit(nil);

  jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;

  if jsonObj.Count = 0 then
    Exit;

  for pair in jsonObj do
    if pair.JsonString.Value.ToLower().Trim.Equals(name.Trim().ToLower()) then
    begin
      if pair.JsonValue is TJSONArray then
        Result := TJsonHw.ToArrayObject<T>(pair.JsonValue.ToJSON, AOptions)
      else if pair.JsonValue is TJSONObject then
      begin

        SetLength(O, 1);

        O[High(O)] := TJsonHw.ToObject<T>(pair.JsonValue as TJSONObject, AOptions);

        Result := O;
      end;
      Break;
    end;

end;

class function TNuvemshopConsulta.ToObject(name, json: string;
  AOptions: TJsonOptions): TNuvemshopConsulta;
var
  jsonObj: TJSONObject;
  pair: TJSONPair;
  str: string;
begin
  if MatchStr(json.Trim, ['', 'null', '[]']) then
    Exit(nil);

  Result := TJsonHw.ToObject<TNuvemshopConsulta>(json, AOptions);

  if Result = nil then
    Exit(nil);

    jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;

  if jsonObj.Count = 0 then
    Exit;

  for pair in jsonObj do
    if pair.JsonString.Value.ToLower().Trim.Equals(name.Trim().ToLower()) then
    begin
      Result.dadosDinamicos := pair.JsonValue.ToString;
      Break;
    end;
end;

{ TNuvemshopItem }

class function TNuvemshopItem.ToObject<T>(json: string;
  AOptions: TJsonOptions): T;
var
  jsonObj: TJSONObject;
  pair: TJSONPair;
begin
  if MatchStr(json.Trim, ['', 'null', '[]']) then
    Exit(nil);

  jsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(json), 0) as TJSONObject;

  if jsonObj.Count = 0 then
    Exit;

  for pair in jsonObj do
    if pair.JsonValue is TJSONObject then
    begin
      Result := TJsonHw.ToObject<T>(pair.JsonValue as TJSONObject, AOptions);
      Break;
    end;
end;

end.
