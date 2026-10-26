unit ApiAssineOn;

interface

uses
  BaseApiAO,
  AccountModel,
  TemplateModel,
  BaseSingleton,
  System.Classes, DocumentsModel;

const
  ASSINEON_KEY_TRIGGER = 'SECRET-GENERATE-TOKEN-2';

type
  TPaging<T> = class
  private
    Ftotal: Integer;
    Fpage: Integer;
    FpageSize: Integer;
    Frows: TArray<T>;
  published
    property total: Integer read Ftotal write Ftotal;
    property page: Integer read Fpage write Fpage;
    property pageSize: Integer read FpageSize write FpageSize;
    property rows: TArray<T> read Frows write Frows;

//    class function ToArrayObject<T: class, constructor>(json: string): TArray<T>;
  end;

//  TPagingHelper = class
//  public
//    class function ToArrayObject<T: class, constructor>(json, attName: string): TArray<T>;
//  end;


  TApiAssineOn = class(TBaseApiAO)
  public
    function GetMe(): TAccount;

    // account, auth
    function GetLoginToken(): TLoginByToken;
    function PostNewUser(payload: TNewAccountModel): TIntegrationModel;
    function PostAccountLoginByToken(): TLoginByToken;
    function GetIntegration(email: string): TIntegrationModel;

    // revisions
    function GetRevisions(pageNumber, pageSize: Integer): TArray<TRevisionModel>;
    function GetRevision(id: string): TRevisionModel;

    // tags
    function GetDefaultsTags(): TStrings;

    // documents

    function GetDocuments(pageNumber, pageSize: Integer; externalCode: string): TArray<TDocument>;


  end;

  TApiAssineOnSingleton = TSingleton<TApiAssineOn>;

implementation

{ TApiAssineOn }

uses
  Hw.Json,
  System.SysUtils,
  System.StrUtils,
  System.JSON,
  REST.Json, hw_utils;

function TApiAssineOn.GetDefaultsTags: TStrings;
begin
  Result := nil;
  with Call(TReq.New('templates/defaulttags'), rmGET, True) do
    if isSuccess then
      Result :=  NewStringList(TJsonHw.ToArrayString(data));
end;

function TApiAssineOn.GetDocuments(pageNumber, pageSize: Integer;
  externalCode: string): TArray<TDocument>;
begin
  Result := [];
   with GetT < TPaging<TRevisionModel> > (TReq.New('documents?pageNumber=%d&pageSize=%d&SignatoryExternalCode=%s', [pageNumber, pageSize, externalCode])) do
    if isSuccess then
    begin
      Result := TJsonHW.ToArrayObject<TDocument>(data, 'rows');
//      var page := TJsonHw.ToObject< TPaging<TRevisionModel> >(data);
//      Result := page.rows;
    end;
end;

function TApiAssineOn.GetIntegration(email: string): TIntegrationModel;
begin
  Result := nil;
  with Call(TReq.New('account/integration/hw?email=%s&tokenHw=%s', [email, ASSINEON_KEY_TRIGGER]), rmGET, True) do
    if isSuccess then
      Result := TJsonHw.ToObject<TIntegrationModel>(data);
end;

function TApiAssineOn.GetLoginToken: TLoginByToken;
begin
  with PostT<TAccount>(TReq.New('account/login/token')) do
    if isSuccess then
      Result := TJsonHw.ToObject< TLoginByToken >(data);
end;

function TApiAssineOn.GetMe: TAccount;
begin
  with GetT<TAccount>(TReq.New('account/me')) do
    if isSuccess then
      Result := TJsonHw.ToObject< TAccount >(data);
end;

function TApiAssineOn.GetRevision(id: string): TRevisionModel;
begin
  Result := nil;
  with Call(TReq.New('templates/revisions/%s', [id]), rmGET, True) do
    if isSuccess then
      Result := TJsonHw.ToObject<TRevisionModel>(data);
end;

function TApiAssineOn.GetRevisions(pageNumber,
  pageSize: Integer): TArray<TRevisionModel>;
begin
  Result := [];
   with GetT < TPaging<TRevisionModel> > (TReq.New('templates/revisions?pageNumber=%d&pageSize=%d', [pageNumber, pageSize])) do
    if isSuccess then
    begin
      Result := TJsonHW.ToArrayObject<TRevisionModel>(data, 'rows');
//      var page := TJsonHw.ToObject< TPaging<TRevisionModel> >(data);
//      Result := page.rows;
    end;
end;

function TApiAssineOn.PostAccountLoginByToken: TLoginByToken;
begin
  Result := nil;
  with Post(TReq.New('account/login/token')) do
    if isSuccess then
      Result := TJsonHw.ToObject<TLoginByToken>(data);
end;

function TApiAssineOn.PostNewUser(payload: TNewAccountModel): TIntegrationModel;
begin
  Result := nil;
  with Call(TReq.New('account', '', TJsonHw.ToJsonString(payload)), rmPost, True) do
    if isSuccess then
      Result := TJsonHw.ToObject<TIntegrationModel>(data);
end;

//{ TPagingHelper }
//
//class function TPagingHelper.ToArrayObject<T>(json: string): TArray<T>;
//var
//  O: TArray<T>;
//begin
//
//  Result := [];
//
//  if MatchText(json.Trim, ['', 'null', '[]']) then
//    Exit;
//
//  var jsonObj := TJsonHw.ToJsonObject<T>(json);
//
//  if jsonObj.Count = 0 then
//    Exit;
//
//  for var pair in jsonObj do
//    if pair.JsonString.Value.ToLower().Trim.Equals('rows') then
//    begin
//      if pair.JsonValue is TJSONArray then
//        Result := TJsonHw.ToArrayObject<T>(pair.JsonValue.ToJSON, [])
//      else if pair.JsonValue is TJSONObject then
//      begin
//
//        SetLength(O, 1);
//
//        O[High(O)] := TJsonHw.ToObject<T>(pair.JsonValue as TJSONObject, []);
//
//        Result := O;
//      end;
//      Break;
//    end;
//end;

initialization

finalization
  TApiAssineOnSingleton.ReleaseInstance();

end.
