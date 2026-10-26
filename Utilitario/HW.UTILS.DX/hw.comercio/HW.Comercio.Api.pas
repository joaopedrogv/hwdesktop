unit HW.Comercio.Api;

interface

uses
  Hw.Api,
  Hw.Api.Rest,
  Hw.Comercio.Api.Rest;

type
  THwComercioApi = class(THwApi)
  private
    FApi: TComercioRestApi;
    FToken: TComercioTokenApi;
  protected
    procedure RetornoResolverErro(retorno: TComercioRetorno);
  public
    destructor Destroy; override;
                             
    procedure InitApi(URL: string); override;
    function ConcederAcesso: Integer; override;

    property Api      : TComercioRestApi  read FApi    write FApi;
    property Token    : TComercioTokenApi read FToken  write FToken;
  end;

implementation

uses
  System.SysUtils, HW.Utils.Classes.Funcoes_DX, REST.Json, REST.Types, System.StrUtils;

{ THwComercioApi }

function THwComercioApi.ConcederAcesso: Integer;
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
    Logar := not Assigned(Token);
    if not Logar then
    begin
      if (Token.expires_in > 0) then
      begin                       //8h      30min     40s
        //Token.expires_in := 28800 + (30 * 60) + (40);

        hours   := Token.expires_in div 3600;
        minutes := Token.expires_in mod 3600;
        minutes := minutes          div   60;
        seconds := Token.expires_in mod   60;
        dataLimite := Token.DataLogin + EncodeTime(hours, minutes, seconds, 0);
      end;

      Logar := Token.DataHoraAtual > dataLimite;
    end;

    if Logar then
    begin
      if Assigned(FLogEvent) then
        Api.OnLog := FLogEvent;

      with Api.restRequest.Params.AddItem do
      begin
        Kind := pkGETorPOST;
        name := 'grant_type';
        Value := 'password';
      end;
      with Api.restRequest.Params.AddItem do
      begin
        Kind := pkGETorPOST;
        name := 'username';
        Value := '#' + CNPJ + '#';
      end;
      with Api.restRequest.Params.AddItem do
      begin
        Options := [poDoNotEncode];
        Kind := pkGETorPOST;
        name := 'password';
        Value := UTF8ToString(THwUtilsClass.EncodeURIParameter( THwUtilsClass.CalculaChaveLoginChatWeb(CNPJ) ));
      end;

      if Api.Post( TRestApiReq.New('security/token')) = 200 then//, '', Format('{"UserID":"%s","Password":"%s"}',
                                                        //[CNPJ, THwUtilsClass.CalculaChaveLoginChatWeb(CNPJ)]))) = 200 then
      begin
        FToken := TJson.JsonToObject<TComercioTokenApi>(Api.JSONReponse);

        if not Assigned(FToken) then
        begin
          FLastError.Msg := 'Token de usuário não veio como esperado';
          FLastError.Exception := FLastError.Msg;
          Exit;
        end;
        DoAfterLogin := True;
      end
      else if Assigned(api.ErroApi) then
      begin
        FLastError.Msg := 'Api: ' + IntToStr(Api.ErroApi.statusCode);
        FLastError.Exception := Api.ErroApi.error_description;
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
      FLastError.Local := 'THwComercioApi.ConcederAcesso';
    if DoAfterLogin  then
      if Assigned(AfterLogin) then
        AfterLogin(Token);
  end;
end;

destructor THwComercioApi.Destroy;
begin
  if Assigned(FApi) then
    FreeAndNil(FApi);
  inherited;
end;

procedure THwComercioApi.RetornoResolverErro(retorno: TComercioRetorno);
var
  I: Integer;
begin
  if retorno = nil then
    Exit;

  if retorno.DescricaoDoErro <> '' then
    FLastError.Msg := retorno.DescricaoDoErro
  else if Length(retorno.Erros) > 0 then
    for I := Low(retorno.Erros) to High(retorno.Erros) do
      FLastError.Msg := IfThen(I > Low(retorno.Erros), sLineBreak + ' ') + retorno.Erros[I].Value;
end;

procedure THwComercioApi.InitApi(URL: string);
begin
  if not Assigned(Api) then
    Api := TComercioRestApi.Create(URL, True, not URL.Trim.ToLower.StartsWith('https'));
  Api.OnLog := OnLog;
end;

end.
