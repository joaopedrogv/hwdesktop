unit RestApiBaseRes;

interface

uses
  HW.Api.Rest,
  System.Classes,
  Rest.Client,
  Rest.Types,
  HW.Json;

type
  TToken = class
  private
    FexpiresIn  : TDateTime;
    FaccessToken: string;
    Fcnpj       : string;
    FempresaId  : Integer;
    FcaixaId    : Integer;
  published
    [HandleUtc]
    property expiresIn  : TDateTime read FexpiresIn write FexpiresIn;
    property accessToken: string read FaccessToken write FaccessToken;
    property cnpj       : string read Fcnpj write Fcnpj;
    property empresaId  : Integer read FempresaId write FempresaId;
    property caixaId    : Integer read FcaixaId write FcaixaId;
  end;

  TResponseError = class
  private
    Fmessage: String;
    Fcode   : Integer;
  public
    property code   : Integer read Fcode write Fcode;
    property message: String read Fmessage write Fmessage;
  end;

  TRestApiBase = class(TRestApi)
  private
    FErroApi: TResponseError;
    FToken  : TToken;
  protected
    procedure AfterContentResponse; override;
  public
    procedure RaiseApiError(err: string = '*Erro não catalogado*');
    procedure AssignTokenAuthorization(TToken: TToken);
    procedure ClearTokenAuthorization;

    property ErroApi: TResponseError read FErroApi write FErroApi;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  Rest.Json;

{ TRestApiBase }

procedure TRestApiBase.AfterContentResponse;
begin
  inherited;
  case restResponse.StatusCode of
    200 .. 299:
      begin
        if Assigned(FEventResponse) then
          FEventResponse(restResponse);
      end;

    else
      begin
        if not JSONReponse.IsEmpty then
        begin
          try
            FErroApi := TJson.JsonToObject< TResponseError >(JSONReponse);
          except
          end;
        end
        else
        begin
          ErroApi      := TResponseError.Create;
          ErroApi.code := restResponse.StatusCode;
          case restResponse.StatusCode of
            401:
              ErroApi.message := 'Não Autorizado';
            403:
              ErroApi.message := 'Proibido';
            404:
              ErroApi.message := 'Conteúdo não encontrado';
            else
              ErroApi.message := 'Erro não catalogado';
          end;
        end;

        if Assigned(FEventResponse) then
          FEventResponse(FErroApi);
      end;
  end;
end;

procedure TRestApiBase.AssignTokenAuthorization(TToken: TToken);
begin
  FToken := TToken;
  LogMessage('[AssignTokenAuthorization: %s]', [FToken.cnpj]);

  restRequest.Params.Clear;

  restRequest.Params.Clear;
  with restRequest.Params.AddItem do
  begin
    name    := 'Authorization';
    Value   := 'Bearer ' + FToken.accessToken;
    Kind    := pkHTTPHEADER;
    Options := [poDoNotEncode];
  end;

  with restRequest.Params.AddItem do
  begin
    name    := 'Content-Type';
    Value   := 'application/json';
    Kind    := pkHTTPHEADER;
    Options := [poDoNotEncode];
  end;

  with restRequest.Params.AddItem do
  begin
    name    := 'cnpj';
    Value   := FToken.cnpj;
    Kind    := pkHTTPHEADER;
    Options := [poDoNotEncode];
  end;
end;

procedure TRestApiBase.ClearTokenAuthorization;
begin
  LogMessage('[ClearTokenAuthorization]');
  FToken := nil;
end;

procedure TRestApiBase.RaiseApiError(err: string);
begin
  if Assigned(ErroApi) then
    raise Exception.Create(Format('%d %s', [ErroApi.code, ErroApi.message]))
  else
    raise Exception.Create(err);
end;

end.
