unit Hw.Integra.Api.Rest;

interface

uses
  HW.Api.Rest,
  System.Classes,
  REST.Client,
  REST.Types;

type
  TIntegraTokenApi = class
  private
    Fauthenticated: Boolean;
    Fexpiration: TDateTime;
    Fcnpj: String;
    Fmessage: String;
    FaccessToken: String;
    FhwId: Integer;
    Fcreated: TDateTime;
  public
    property authenticated: Boolean read Fauthenticated write Fauthenticated;
    property created: TDateTime read Fcreated write Fcreated;
    property expiration: TDateTime read Fexpiration write Fexpiration;
    property accessToken: String read FaccessToken write FaccessToken;
    property message: String read Fmessage write Fmessage;
    property cnpj: String read Fcnpj write Fcnpj;
    property hwId: Integer read FhwId write FhwId;
  end;

  TIntegraApiError = class
  private
    FstatusDescription: String;
    FstatusCode: Integer;
  public
    property statusCode: Integer read FstatusCode write FstatusCode;
    property statusDescription: String read FstatusDescription write FstatusDescription;
  end;

  TIntegraRestApi = class(TRestApi)
  private
    FErroApi: TIntegraApiError;
    FToken: TIntegraTokenApi;
  protected
    procedure AfterContentResponse; override;
  public
    procedure RaiseApiError;
    procedure AssignTokenAuthorization(Token: TIntegraTokenApi);
    procedure ClearTokenAuthorization;

    property ErroApi: TIntegraApiError read FErroApi write FErroApi;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  REST.Json;

{ TIntegraRestApi }


procedure TIntegraRestApi.AfterContentResponse;
begin
  inherited;
  case restResponse.StatusCode of
    200 :
    begin
      if Assigned(FEventResponse) then
        FEventResponse(restResponse);
    end;

    401, 403, 404, 500 :
    begin
      if not JSONReponse.IsEmpty then
        FErroApi := TJson.JsonToObject<TIntegraApiError>(JSONReponse)
      else
      begin
        ErroApi := TIntegraApiError.Create;
        ErroApi.statusCode := restResponse.StatusCode;
        ErroApi.statusDescription := Format('%d %s', [restResponse.StatusCode, IfThen( restResponse.StatusCode = 401,  'Nao Autorizado') +
                                                                               IfThen( restResponse.StatusCode = 404,  'Sem Conteudo') +
                                                                               IfThen( restResponse.StatusCode = 500,  'Erro Interno do Servidor')]);
      end;

      if Assigned(FEventResponse) then
        FEventResponse( FErroApi );
    end;
  end;
end;

procedure TIntegraRestApi.AssignTokenAuthorization(Token: TIntegraTokenApi);
begin
  FToken := Token;
  LogMessage('[AssignTokenAuthorization: %s]', [FToken.cnpj]);

  restRequest.Params.Clear;
  with restRequest.Params.AddItem do
  begin
    name    := 'Authorization';
    Value   := 'Bearer ' + FToken.accessToken;
    Kind    := pkHTTPHEADER;
    Options := [poDoNotEncode];
  end;
end;

procedure TIntegraRestApi.ClearTokenAuthorization;
begin
  LogMessage('[ClearTokenAuthorization]');
  FToken := nil;
end;

procedure TIntegraRestApi.RaiseApiError;
begin
  if Assigned(ErroApi) then
    raise Exception.Create(Format('%d %s', [ErroApi.statusCode, ErroApi.statusDescription]));
end;

end.
