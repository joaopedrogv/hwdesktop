unit Hw.Nuvemshop.Api;

interface

uses
  Hw.Api,
  Hw.Api.Rest,
  Hw.Nuvemshop.Api.Rest;

type
  THwNuvemshopApi = class(THwApi)
  private
    FApi: TNuvemshopRestApi;
    FToken: string;
    FReq: TRestApiReq;
  protected
    //procedure RetornoResolverErro(retorno: TNuvemshopComercioRetorno);
    function ReqWithParams(controller: string; params: TArray<string>): TRestApiReq;
  public
    destructor Destroy; override;

    procedure InitApi(URL: string); override;
    function ConcederAcesso: Integer; override;

    property Api           : TNuvemshopRestApi  read FApi            write FApi;
    property Token         : string             read FToken          write FToken;
  end;

implementation

uses
  System.SysUtils, HW.Utils.Classes.Funcoes_DX, REST.Json, REST.Types, System.StrUtils;

{ THwNuvemshopApi }

function THwNuvemshopApi.ConcederAcesso: Integer;
var
  Logar: Boolean;
  hours, minutes, seconds: Integer;
  dataLimite: TDateTime;
  DoAfterLogin: Boolean;
begin
  Result := 0;
  FLastError.Msg := '';
  FLastError.Local := '';
  FLastError.Exception := '';
  DoAfterLogin := False;

  try

    if Assigned(FLogEvent) then
      Api.OnLog := FLogEvent;

    if Token.Trim <> '' then
      Result := 1;

//    Logar := not Assigned(Token);
//    if not Logar then
//    begin
//      Logar := Token.date_expiration_access_token > Now;
//
//      if (Logar) and (Token.date_expiration_refresh_token < Now) then
//      begin
//        Api.restRequest.Params.Clear;
//        with Api.restRequest.Params.AddItem do
//        begin
//          Options := [];
//          Kind := pkURLSEGMENT;
//          name := 'refresh_token';
//          Value := Token.refresh_token;
//        end;
//
//        if Api.Get( TRestApiReq.New('auth')) = 200 then
//        begin
//          FToken := TJson.JsonToObject<TNuvemshopTokenApi>(Api.JSONReponse);
//
//          if not Assigned(FToken) then
//          begin
//            FLastError.Msg := 'Token de usuário não veio como esperado';
//            FLastError.Exception := FLastError.Msg;
//            Exit;
//          end;
//          DoAfterLogin := True;
//          Logar := False;
//
//        end;
//      end;
//    end;
//
//    if Logar then
//    begin
//
//      Api.restRequest.ClearBody;
//      Api.restRequest.Params.Clear;
//      with Api.restRequest.Params.AddItem do
//      begin
//        Kind := pkGETorPOST;
//        name := 'consumer_key';
//        Value := FConsumerKey;
//      end;
//      with Api.restRequest.Params.AddItem do
//      begin
//        Kind := pkGETorPOST;
//        name := 'consumer_secret';
//        Value := FConsumerSecret;
//      end;
//      with Api.restRequest.Params.AddItem do
//      begin
//        Kind := pkGETorPOST;
//        name := 'code';
//        Value := FCode;
//      end;
//
//      if Api.Post( TRestApiReq.New('auth')) = 200 then
//      begin
//        FToken := TJson.JsonToObject<TNuvemshopTokenApi>(Api.JSONReponse);
//
//        if not Assigned(FToken) then
//        begin
//          FLastError.Msg := 'Token de usuário não veio como esperado';
//          FLastError.Exception := FLastError.Msg;
//          Exit;
//        end;
//        DoAfterLogin := True;
//      end
//      else if Assigned(api.ErroApi) then
//      begin
//        FLastError.Msg := 'Api: ' + IntToStr(Api.ErroApi.code);
//        FLastError.Exception := Api.ErroApi.name + ' - ' + System.String.Join(', ', Api.ErroApi.causes);
//        Exit;
//      end
//      else
//      begin
//        FLastError.Msg := Api.LastError.Msg;
//        FLastError.Exception := Api.LastError.Exception;
//      end;
//    end;
//
//    Api.AssignTokenAuthorization(Token);
//
//    Result := 1;

  finally
    if not FLastError.Msg.Trim.IsEmpty then
      FLastError.Local := 'THwNuvemshopApi.ConcederAcesso';
//    if DoAfterLogin  then
//      if Assigned(AfterLogin) then
//        AfterLogin(Token);
  end;
end;

destructor THwNuvemshopApi.Destroy;
begin
  if Assigned(FApi) then
    FreeAndNil(FApi);
  inherited;
end;

procedure THwNuvemshopApi.InitApi(URL: string);
begin
  inherited;
  if not Assigned(Api) then
    Api := TNuvemshopRestApi.Create(URL, True, not URL.Trim.ToLower.StartsWith('https'));
  Api.OnLog := OnLog;
end;

function THwNuvemshopApi.ReqWithParams(controller: string;
  params: TArray<string>): TRestApiReq;
var
  headers: TArray<string>;
begin
  SetLength(headers, 2);
  headers[0] := 'Authentication|' + Token +'|';
  headers[1] := 'User-Agent|HW app(contato@hwsistemas.com.br)|';

//  if FReq = nil then
    FReq := TRestApiReq.New(controller, '', params, headers); // System.string.Join('&', params))
//  else
//  begin
//    FReq.Controller := controller;
//    FReq.ParamsURL  := System.string.Join('&', params);
//  end;

  Result := FReq;
end;

end.
