unit Hw.Integra.Api;

interface

uses
  Hw.Api,
  Hw.Api.Rest,
  Hw.Integra.Api.Rest;

type
  THwIntegraApi = class(THwApi)
  private
    FApi: TIntegraRestApi;
    FToken: TIntegraTokenApi;
  public
    destructor Destroy; override;
                             
    procedure InitApi(URL: string); override;
    function ConcederAcesso: Integer; override;
    function GrantAccess: Integer;

    property Api      : TIntegraRestApi  read FApi    write FApi;
    property Token    : TIntegraTokenApi read FToken  write FToken;
  end;

implementation

uses
  System.SysUtils, HW.Utils.Classes.Funcoes_DX, REST.Json;

{ THwIntegraApi }

function THwIntegraApi.ConcederAcesso: Integer;
var
  Logar: Boolean;
begin
  Result := 0;
  FLastError.Msg := '';
  FLastError.Local := '';
  FLastError.Exception := '';

  try
    Logar := not Assigned(Token);
    if not Logar then
      Logar := Now > Token.expiration;

    if Logar then
    begin
      Api.OnLog := FLogEvent;
      if Api.Post( TRestApiReq.New('Login', '', Format('{"UserID":"%s","Password":"%s"}',
                                                        [CNPJ, THwUtilsClass.CalculaChaveLoginChatWeb(CNPJ)]))) = 200 then
      begin
        FToken := TJson.JsonToObject<TIntegraTokenApi>(Api.JSONReponse);

        if not Assigned(FToken) then
        begin
          FLastError.Msg := 'Token de usuário não veio como esperado';
          FLastError.Exception := FLastError.Msg;
          Exit;
        end;
      end
      else if Assigned(api.ErroApi) then
      begin
        FLastError.Msg := 'Api: ' + IntToStr(Api.ErroApi.statusCode);
        FLastError.Exception := Api.ErroApi.statusDescription;
        Exit;
      end
      else
      begin
        FLastError.Msg := Api.LastError.Msg;
        FLastError.Exception := Api.LastError.Exception;
      end;
    end;

    Api.AssignTokenAuthorization(Token);

    Result := 1;

  finally
    if not FLastError.Msg.Trim.IsEmpty then
      FLastError.Local := 'THwIntegraApi.ConcederAcesso';
  end;
end;

destructor THwIntegraApi.Destroy;
begin
  if Assigned(FApi) then
    FreeAndNil(FApi);
  inherited;
end;

function THwIntegraApi.GrantAccess: Integer;
var
  Logar: Boolean;
begin
  Result := 0;
  FLastError.Msg := '';
  FLastError.Local := '';
  FLastError.Exception := '';

  try
    Logar := not Assigned(Token);
    if not Logar then
      Logar := Now > Token.expiration;

    if Logar then
    begin
      Api.OnLog := FLogEvent;
      Result := Api.Post( TRestApiReq.New('Login', '', Format('{"UserID":"%s","Password":"%s"}',
                                                        [CNPJ, THwUtilsClass.CalculaChaveLoginChatWeb(CNPJ)])));
      if Result = 200 then
      begin
        FToken := TJson.JsonToObject<TIntegraTokenApi>(Api.JSONReponse);

        if not Assigned(FToken) then
        begin
          FLastError.Msg := 'Token de usuário não veio como esperado';
          FLastError.Exception := FLastError.Msg;
          Exit;
        end;
      end
      else if Assigned(api.ErroApi) then
      begin
        FLastError.Msg := 'Api: ' + IntToStr(Api.ErroApi.statusCode);
        FLastError.Exception := Api.ErroApi.statusDescription;
        Exit;
      end
      else
      begin
        FLastError.Msg := Api.LastError.Msg;
        FLastError.Exception := Api.LastError.Exception;
      end;
    end
    else
      Result := 200;

    Api.AssignTokenAuthorization(Token);

  finally
    if not FLastError.Msg.Trim.IsEmpty then
      FLastError.Local := 'THwIntegraApi.GrantAccess';
  end;
end;

procedure THwIntegraApi.InitApi(URL: string);
begin
  if not Assigned(Api) then
    Api := TIntegraRestApi.Create(URL);
  Api.OnLog := OnLog;
end;

end.
