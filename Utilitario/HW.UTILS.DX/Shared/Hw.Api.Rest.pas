unit Hw.Api.Rest;

interface

uses
  System.Classes, REST.Client, REST.Types, Hw.Types;

type
  TLastError = record
    Msg: string;
    Local: string;
    Exception: string;
  end;

  TBodyReq = class
  private
    Fname: string;
    Fvalue: string;
    FcontentType: TRESTContentType;
    Foptions: TRESTRequestParameterOptions;
  published
    property name: string read Fname write Fname;
    property value: string read Fvalue write Fvalue;
    property contentType: TRESTContentType read FcontentType write FcontentType;
    property options: TRESTRequestParameterOptions read Foptions write Foptions;
  end;

  TRestApiReq = class
  private
    FMethod    : TRESTRequestMethod;
    FController: string;
    FParamsURL : string;
    FHeadersUrl: string;
    FParams: TArray<string>;
    FHeaders: TArray<string>;
    FBodyString: string;
    FAccept: string;
    FCustomBody: TBodyReq;
    procedure SetParamsURL(const Value: string);
  public
    destructor Destroy; override;
    class function New(AController: string = ''; AParamsURL: string = ''; AJSONString: string = ''): TRestApiReq; overload;
    class function New(AController: string; const Args: array of const; AJSONString: string = ''): TRestApiReq; overload;
    class function New(AController: string; const Args: array of const; params: TArray<string>): TRestApiReq; overload;
    class function New(AController: string; AJSONString: string; params: TArray<string>): TRestApiReq; overload;
    class function New(AController: string; AJSONString: string; params: TArray<string>; headers: TArray<string>): TRestApiReq; overload;
    function LogReq: string;
    procedure ChangeBody(name, value: string; ContentType: TRESTContentType; options: TRESTRequestParameterOptions = [poDoNotEncode]);
    property Method    : TRESTRequestMethod read FMethod      write FMethod;
    property Controller: string             read FController  write FController;
    property ParamsURL : string             read FParamsURL   write SetParamsURL;
    property HeadersUrl: string             read FHeadersUrl  write FHeadersUrl;
    property Params: TArray<string>         read FParams      write FParams;
    property Headers: TArray<string>        read FHeaders     write FHeaders;
    property BodyString: string             read FBodyString  write FBodyString;
    property Accept: string                 read FAccept      write FAccept;
    property CustomBody: TBodyReq           read FCustomBody  write FCustomBody;
    //caso seja necessário criar os parametros aqui em forma de lista
  end;

  TRestApi = class
  private
    FrestClient: TRESTClient;
    FrestRequest: TRESTRequest;
    FrestResponse: TRESTResponse;
    FUseEncode: Boolean;
    FController: string;
    FParamsURL: string;
    FLastError: TLastError;
    FBaseUrl: string;
    FJSONReponse: string;
    //FErroApi: TApiError;
    //FToken: TTokenApi;
    FLogEvent: TLogText;
    FHideProtocol: Boolean;

    function UrlResolve(Params: array of string): string;
    procedure MessageErrorResolve(AError: string);
    //procedure HttpProtocolError(Sender: TCustomRESTClient);
  protected
    FEventResponse: TNotifyEvent;
    procedure LogMessage(Msg: string); overload;
    procedure LogMessage(Msg: string; const Args: array of const); overload;
    procedure AfterContentResponse; virtual; abstract;
  public
    constructor Create(UrlApi: string; UseEncode: Boolean = True; hideProtocol_: Boolean = True);
    destructor Destroy; override;
//    procedure RaiseApiError;

    //procedure AddParam(ParamKey: string; ParamValue: string);

    //procedure AssignTokenAuthorization(Token: TTokenApi);
    //procedure ClearTokenAuthorization;
    function Exec(Req: TRestApiReq): Integer; virtual;
    function Get(Req: TRestApiReq = nil): Integer; virtual;
    function Post(Req: TRestApiReq = nil): Integer; virtual;
    function Put(Req: TRestApiReq = nil): Integer; virtual;
    function Delete(Req: TRestApiReq = nil): Integer; virtual;
//    function Post(ControllerApi: string): Integer; overload;
//    function ExecutarPOST(): Boolean; overload;
//    function ExecutarPOST(BodyString: string): Boolean; overload;

    property BaseUrl: string read FBaseUrl write FBaseUrl;
    property Controller: string read FController write FController;
    property ParamsURL: string read FParamsURL write FParamsURL;
    property restClient: TRESTClient read FrestClient write FrestClient;
    property restRequest: TRESTRequest read FrestRequest write FrestRequest;
    property restResponse: TRESTResponse read FrestResponse write FrestResponse;

    property LastError: TLastError read FLastError write FLastError;
    property JSONReponse: string read FJSONReponse write FJSONReponse;
    property OnResponse: TNotifyEvent read FEventResponse write FEventResponse;
    property HideProtocol: Boolean read FHideProtocol write FHideProtocol;
    property OnLog: TLogText read FLogEvent write FLogEvent;
  end;

  TRestApiNuvemshop = class
  private
    FrestClient: TRESTClient;
    FrestRequest: TRESTRequest;
    FrestResponse: TRESTResponse;
    FUseEncode: Boolean;
    FController: string;
    FParamsURL: string;
    FHeadersUrl: string;
    FLastError: TLastError;
    FBaseUrl: string;
    FJSONReponse: string;
    //FErroApi: TApiError;
    //FToken: TTokenApi;
    FLogEvent: TLogText;
    FHideProtocol: Boolean;

    function UrlResolve(Params: array of string): string;
    procedure MessageErrorResolve(AError: string);
    //procedure HttpProtocolError(Sender: TCustomRESTClient);
  protected
    FEventResponse: TNotifyEvent;
    procedure LogMessage(Msg: string); overload;
    procedure LogMessage(Msg: string; const Args: array of const); overload;
    procedure AfterContentResponse; virtual; abstract;
  public
    constructor Create(UrlApi: string; UseEncode: Boolean = True; hideProtocol_: Boolean = True);
    destructor Destroy; override;
    function Exec(Req: TRestApiReq): Integer; virtual;
    function Count(Req: TRestApiReq = nil): Integer; virtual;
    function ExecCount(Req: TRestApiReq): Integer; virtual;
    function Get(Req: TRestApiReq = nil): Integer; virtual;
    function Post(Req: TRestApiReq = nil): Integer; virtual;
    function Put(Req: TRestApiReq = nil): Integer; virtual;
    function Delete(Req: TRestApiReq = nil): Integer; virtual;

    function Split(Expression:string; Delimiter:string): TStringList;

    property BaseUrl: string read FBaseUrl write FBaseUrl;
    property Controller: string read FController write FController;
    property ParamsURL: string read FParamsURL write FParamsURL;
    property restClient: TRESTClient read FrestClient write FrestClient;
    property restRequest: TRESTRequest read FrestRequest write FrestRequest;
    property restResponse: TRESTResponse read FrestResponse write FrestResponse;

    property LastError: TLastError read FLastError write FLastError;
    property JSONReponse: string read FJSONReponse write FJSONReponse;
    property OnResponse: TNotifyEvent read FEventResponse write FEventResponse;
    property HideProtocol: Boolean read FHideProtocol write FHideProtocol;
    property OnLog: TLogText read FLogEvent write FLogEvent;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  REST.Json, Winapi.Windows;

{ TRestApi }

constructor TRestApi.Create(UrlApi: string; UseEncode, hideProtocol_: Boolean);
begin

  if (not UrlApi.ToLower.StartsWith('http')) and UrlApi.Substring(6, UrlApi.Length).Contains(':') then
  begin
    UrlApi := 'http://' + UrlApi;
    hideProtocol_ := False;
  end;

  FBaseUrl := UrlApi;

  FrestClient := TRESTClient.Create(FBaseUrl);
  FrestRequest := TRESTRequest.Create(FrestClient);
  FrestResponse := TRESTResponse.Create(FrestClient);
  FrestRequest.Response := FrestResponse;
  FUseEncode := UseEncode;
  FrestClient.RaiseExceptionOn500 := False;
  FHideProtocol := hideProtocol_;
end;

function TRestApi.Delete(Req: TRestApiReq): Integer;
begin
  if Req = nil then
    Req := TRestApiReq.New('', '', '');

  Req.LogReq;
  Req.Method := rmDELETE;
  Result := Exec(Req);
end;

destructor TRestApi.Destroy;
begin
  FrestResponse.Free;
  FrestRequest.Free;
  FrestClient.Free;

  inherited;
end;

function TRestApi.Exec(Req: TRestApiReq): Integer;
begin
  Result := 0;
  FJSONReponse := '';
  FLastError.Msg := '';
  FLastError.Local := '';
  FLastError.Exception := '';

//  if Assigned(FErroApi) then
//    FreeAndNil(FErroApi);
  try

    try
      if not Assigned(restClient) then
        raise Exception.Create('REST Client não definido');

      if not Assigned(restRequest) then
        raise Exception.Create('REST Request não definido');

      if not Assigned(restResponse) then
        raise Exception.Create('REST Response não definido');

      if not Assigned(restRequest.Response) then
        restRequest.Response := restResponse;

      if not Assigned(restRequest.Response) then
        raise Exception.Create('REST Response não definido');

      if not Assigned(Req) then
        raise Exception.Create('Param Req não definido');

      FrestRequest.Method := Req.Method;

      if Assigned(Req.CustomBody) then
      begin
        restRequest.ClearBody;
        with restRequest.Params.AddItem do
        begin
          Name := Req.CustomBody.name;
          Value := Req.CustomBody.value;
          ContentType := Req.CustomBody.contentType;
          Options := Req.CustomBody.options;
        end;
        LogMessage('[Body [%s]: %s=%s', [ContentTypeToString(Req.CustomBody.contentType), Req.CustomBody.name, Req.CustomBody.value]);
      end
      else
      if not Req.BodyString.Trim.IsEmpty  then
      begin
        restRequest.ClearBody;
        restRequest.AddBody(TStringStream.Create(Req.BodyString), ctAPPLICATION_JSON);
        LogMessage('[JSON: %s', [Req.BodyString]);
      end;

      if not Req.Controller.IsEmpty then FController := Req.Controller;
      if not Req.ParamsURL.IsEmpty  then FParamsURL  := IfThen(Req.ParamsURL.Trim <> '?', Req.ParamsURL, '');

      restClient.BaseURL := UrlResolve([FBaseUrl, FController, FParamsURL]);

      LogMessage('[Url Request: %s]', [restClient.BaseURL]);

      restResponse.ResetToDefaults;

      restRequest.Execute;

      if not Assigned(FrestResponse) then
        raise Exception.Create('Erro de execução interna');

      Result := restResponse.StatusCode;

      if Assigned(restResponse.JSONValue) then
      begin
        if FUseEncode then
          FJSONReponse := TJson.JsonEncode(restResponse.JSONValue)
        else
          FJSONReponse := TJson.Format(restResponse.JSONValue);
        LogMessage('[Execute StatusCode %d JSON Response: %s]', [Result, FJSONReponse]);
      end;

      AfterContentResponse;
    finally
      FParamsURL := '';
      FrestRequest.ClearBody;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro de execução';
      FLastError.Local := 'TRestApi.Exec';
      MessageErrorResolve(E.message);
      LogMessage('[ERRO] [Local:%s] [Msg:%s] [Exception:%s]', [FLastError.Local, FLastError.Msg, FLastError.Exception]);
    end;
  end;
end;

function TRestApi.Get(Req: TRestApiReq): Integer;
begin
  if Req = nil then
    Req := TRestApiReq.New('', '', '');

  Req.LogReq;
  Req.Method := rmGET;
  Result := Exec(Req);
end;

procedure TRestApi.LogMessage(Msg: string; const Args: array of const);
begin
  LogMessage(Format(Msg, Args));
end;

procedure TRestApi.LogMessage(Msg: string);
begin
  if Assigned(FLogEvent) then
    FLogEvent(Format('[%s]', [Self.ClassName]) + Msg);
end;

procedure TRestApi.MessageErrorResolve(AError: string);
begin
  FLastError.Exception := AError;
  if AError.ToLower.Contains('the server name or address could not be resolved') then
    FLastError.Msg := 'Problema de conexão'
  else if AError.ToLower.Contains('a connection with the server could not be established') then
    FLastError.Msg := 'Problema de conexão, verifique sua rede local'
  else if AError.ToLower.Contains('the operation timed out') then
    FLastError.Msg := 'Problema de conexão, Time out'
  else if AError.ToLower.Contains('the connection with the server was terminated abnormally') then
    FLastError.Msg := 'A Conexão foi interrompida'
end;

function TRestApi.Post(Req: TRestApiReq): Integer;
begin
  if Req = nil then
    Req := TRestApiReq.New('', '', '');

  Req.LogReq;
  Req.Method := rmPOST;
  Result := Exec(Req);
end;

function TRestApi.Put(Req: TRestApiReq): Integer;
begin
  if Req = nil then
    Req := TRestApiReq.New('', '', '');

  Req.LogReq;
  Req.Method := rmPUT;
  Result := Exec(Req);
end;

//procedure TRestApi.RaiseApiError;
//begin
//  if Assigned(ErroApi) then
//    raise Exception.Create(Format('%d %s', [ErroApi.statusCode, ErroApi.statusDescription]));
//end;

function TRestApi.UrlResolve(Params: array of string): string;
var
  I: Integer;
  protocol: string;
begin
  Result := '';
  for I := Low(Params) to High(Params) do
    Result := Result + IfThen(I > Low(Params), '/') + Params[I] +
                       IfThen(I = High(Params), '/');

  protocol := IfThen(Result.StartsWith('https:'), 'https', 'http');


  Result := ReplaceStr(Result, 'https:', '');
  Result := ReplaceStr(Result, 'http:', '');

  while Result.StartsWith('/') or Result.StartsWith('\') do
    System.Delete(Result, 1, 1);

  Result := ReplaceStr(Result, '//', '/');
  Result := ReplaceStr(Result, '/?', '?');

  if not HideProtocol then
    Result := Format('%s://%s', [protocol, Result])
end;

{ TRestApiReq }

procedure TRestApiReq.ChangeBody(name, value: string;
  ContentType: TRESTContentType; options: TRESTRequestParameterOptions);
begin
  if not Assigned(FCustomBody) then
    FCustomBody := TBodyReq.Create;

  FCustomBody.name := name;
  FCustomBody.value := value;
  FCustomBody.contentType := ContentType;
  FCustomBody.options := options;
end;

destructor TRestApiReq.Destroy;
begin
  if Assigned(FCustomBody) then
    FreeAndNil(FCustomBody);

  inherited;
end;

function TRestApiReq.LogReq: string;
begin
  case FMethod of
    rmPOST: Result := '[POST]';
    rmPUT: Result := '[PUT]';
    rmGET: Result := '[GET]';
    rmDELETE: Result := '[DELETE]';
    rmPATCH: Result := '[PATCH]';
  end;
  if not FController.IsEmpty then Result := Result + Format(' [Controller: %s]', [FController]);
  if not FParamsURL.IsEmpty then  Result := Result + Format(' [ParamsURL: %s]' , [FParamsURL]);
  if not FBodyString.IsEmpty then Result := Result + Format(' [Body: %s]'      , [FBodyString]);
end;

class function TRestApiReq.New(AController, AParamsURL, AJSONString: string): TRestApiReq;
begin
  Result := TRestApiReq.Create;
  Result.Controller := AController;
  Result.ParamsURL := AParamsURL;
  Result.BodyString := AJSONString;
end;

class function TRestApiReq.New(AController: string; const Args: array of const; AJSONString: string): TRestApiReq;
begin
  Result := TRestApiReq.Create;
  Result.Controller := Format(AController, Args);
  Result.BodyString := AJSONString;
end;

class function TRestApiReq.New(AController: string;
  const Args: array of const; params: TArray<string>): TRestApiReq;
begin
  Result := TRestApiReq.New(Acontroller, Args);
  Result.ParamsURL  := IfThen(Length(params) > 0, '?') + System.string.Join('&', params);
end;

procedure TRestApiReq.SetParamsURL(const Value: string);
begin
  FParamsURL := IfThen(not Value.StartsWith('?'), '?') + Value;
end;

class function TRestApiReq.New(AController, AJSONString: string;
  params: TArray<string>; headers: TArray<string>): TRestApiReq;
begin
  Result := TRestApiReq.Create;
  Result.Controller := AController;
  Result.BodyString := AJSONString;
  Result.FParams    := params;
  Result.FHeaders   := headers;
end;

class function TRestApiReq.New(AController, AJSONString: string;
  params: TArray<string>): TRestApiReq;
begin
  Result := TRestApiReq.Create;
  Result.Controller := AController;
  Result.BodyString := AJSONString;
  Result.FParams    := params;
end;

{ TRestApiNuvemshop }

function TRestApiNuvemshop.Count(Req: TRestApiReq): Integer;
begin
  if Req = nil then
    Req := TRestApiReq.New('', '', '');

  Req.LogReq;
  Req.Method := rmGET;
  Result := ExecCount(Req);
end;

constructor TRestApiNuvemshop.Create(UrlApi: string; UseEncode,
  hideProtocol_: Boolean);
begin
  if (not UrlApi.ToLower.StartsWith('http')) and UrlApi.Substring(6, UrlApi.Length).Contains(':') then
  begin
    UrlApi := 'http://' + UrlApi;
    hideProtocol_ := False;
  end;

  FBaseUrl := UrlApi;

  FrestClient := TRESTClient.Create(FBaseUrl);
  FrestRequest := TRESTRequest.Create(FrestClient);
  FrestResponse := TRESTResponse.Create(FrestClient);
  FrestRequest.Response := FrestResponse;
  FUseEncode := UseEncode;
  FrestClient.RaiseExceptionOn500 := False;
  FHideProtocol := hideProtocol_;
end;

function TRestApiNuvemshop.Delete(Req: TRestApiReq): Integer;
begin
  if Req = nil then
    Req := TRestApiReq.New('', '', '');

  Req.LogReq;
  Req.Method := rmDELETE;
  Result := Exec(Req);
end;

destructor TRestApiNuvemshop.Destroy;
begin
  FrestResponse.Free;
  FrestRequest.Free;
  FrestClient.Free;

  inherited;
end;

function TRestApiNuvemshop.Exec(Req: TRestApiReq): Integer;
var
  I: Integer;
  vParams: TStringList;
  vHeaders: TStringList;
begin
  Result := 0;
  FJSONReponse := '';
  FLastError.Msg := '';
  FLastError.Local := '';
  FLastError.Exception := '';

//  if Assigned(FErroApi) then
//    FreeAndNil(FErroApi);
  try

    try
      if not Assigned(restClient) then
        raise Exception.Create('REST Client não definido');

      if not Assigned(restRequest) then
        raise Exception.Create('REST Request não definido');

      if not Assigned(restResponse) then
        raise Exception.Create('REST Response não definido');

      if not Assigned(restRequest.Response) then
        restRequest.Response := restResponse;

      if not Assigned(restRequest.Response) then
        raise Exception.Create('REST Response não definido');

      if not Assigned(Req) then
        raise Exception.Create('Param Req não definido');

      FrestRequest.Method := Req.Method;
      if not Req.BodyString.Trim.IsEmpty  then
      begin
        restRequest.ClearBody;
        restRequest.AddBody(Req.BodyString, ctAPPLICATION_JSON);
        LogMessage('[JsonBody: %s', [Req.BodyString]);
      end;

      if Length(Req.FParams) > 0 then
      begin
        for I := 0 to Length(Req.FParams) - 1 do
        begin
          vParams := TStringList.Create;
          vParams.Clear;
          vParams := Split(Req.FParams[I], '|');

          if vParams.Count > 1 then
            restRequest.AddParameter(vParams[0], vParams[1]);
        end;
      end;

      if Length(Req.FHeaders) > 0 then
      begin
        for I := 0 to Length(Req.FHeaders) - 1 do
        begin
          vHeaders := TStringList.Create;
          vHeaders.Clear;
          vHeaders := Split(Req.FHeaders[I], '|');

          if vHeaders.Count > 1 then
            restRequest.Params.AddHeader(vHeaders[0], vHeaders[1]);
        end;
      end;


      if not Req.Controller.IsEmpty then FController := Req.Controller;
      if not Req.ParamsURL.IsEmpty  then FParamsURL  := Req.ParamsURL;
      if not Req.HeadersUrl.IsEmpty then FHeadersUrl := Req.HeadersUrl;

      restClient.BaseURL := UrlResolve([FBaseUrl, FController, FParamsURL]);

      LogMessage('[Url Request: %s]', [restClient.BaseURL]);

      restResponse.ResetToDefaults;

      restRequest.Execute;

      if not Assigned(FrestResponse) then
        raise Exception.Create('Erro de execução interna');

      Result := restResponse.StatusCode;

      if Assigned(restResponse.JSONValue) then
      begin
        if FUseEncode then
          FJSONReponse := TJson.JsonEncode(restResponse.JSONValue)
        else
          FJSONReponse := TJson.Format(restResponse.JSONValue);
        LogMessage('[Execute StatusCode %d JSON Response: %s]', [Result, FJSONReponse]);
      end;

      AfterContentResponse;
    finally
      FParamsURL := '';
      FrestRequest.ClearBody;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro de execução';
      FLastError.Local := 'TRestApi.Exec';
      MessageErrorResolve(E.message);
      LogMessage('[ERRO] [Local:%s] [Msg:%s] [Exception:%s]', [FLastError.Local, FLastError.Msg, FLastError.Exception]);
    end;
  end;
end;

function TRestApiNuvemshop.ExecCount(Req: TRestApiReq): Integer;
var
  I: Integer;
  vParams: TStringList;
  vHeaders: TStringList;
begin
  Result := 0;
  FJSONReponse := '';
  FLastError.Msg := '';
  FLastError.Local := '';
  FLastError.Exception := '';

//  if Assigned(FErroApi) then
//    FreeAndNil(FErroApi);
  try

    try
      if not Assigned(restClient) then
        raise Exception.Create('REST Client não definido');

      if not Assigned(restRequest) then
        raise Exception.Create('REST Request não definido');

      if not Assigned(restResponse) then
        raise Exception.Create('REST Response não definido');

      if not Assigned(restRequest.Response) then
        restRequest.Response := restResponse;

      if not Assigned(restRequest.Response) then
        raise Exception.Create('REST Response não definido');

      if not Assigned(Req) then
        raise Exception.Create('Param Req não definido');

      FrestRequest.Method := Req.Method;
      if not Req.BodyString.Trim.IsEmpty  then
      begin
        restRequest.ClearBody;
        restRequest.AddBody(Req.BodyString, ctAPPLICATION_JSON);
        LogMessage('[JsonBody: %s', [Req.BodyString]);
      end;

      if Length(Req.FParams) > 0 then
      begin
        for I := 0 to Length(Req.FParams) - 1 do
        begin
          vParams := TStringList.Create;
          vParams.Clear;
          vParams := Split(Req.FParams[I], '|');

          if vParams.Count > 1 then
            restRequest.AddParameter(vParams[0], vParams[1]);
        end;
      end;

      if Length(Req.FHeaders) > 0 then
      begin
        for I := 0 to Length(Req.FHeaders) - 1 do
        begin
          vHeaders := TStringList.Create;
          vHeaders.Clear;
          vHeaders := Split(Req.FHeaders[I], '|');

          if vHeaders.Count > 1 then
            restRequest.Params.AddHeader(vHeaders[0], vHeaders[1]);
        end;
      end;


      if not Req.Controller.IsEmpty then FController := Req.Controller;
      if not Req.ParamsURL.IsEmpty  then FParamsURL  := Req.ParamsURL;

      restClient.BaseURL := UrlResolve([FBaseUrl, FController, FParamsURL]);

      LogMessage('[Url Request: %s]', [restClient.BaseURL]);

      restResponse.ResetToDefaults;

      restRequest.Execute;

      if not Assigned(FrestResponse) then
        raise Exception.Create('Erro de execução interna');

      if restResponse.Headers.Count > 0 then
      begin
        for I := 0 to restResponse.Headers.Count - 1 do
          if (Pos('X-Total-Count', restResponse.Headers[I]) > 0) then
          begin
            Result := StrToInt(StringReplace(restResponse.Headers[I], 'X-Total-Count=', '', []));
            break;
          end;
      end;

      if Assigned(restResponse.JSONValue) then
      begin
        if FUseEncode then
          FJSONReponse := TJson.JsonEncode(restResponse.JSONValue)
        else
          FJSONReponse := TJson.Format(restResponse.JSONValue);
        LogMessage('[Execute StatusCode %d JSON Response: %s]', [Result, FJSONReponse]);
      end;

      AfterContentResponse;
    finally
      FParamsURL := '';
      FrestRequest.ClearBody;
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro de execução';
      FLastError.Local := 'TRestApi.Exec';
      MessageErrorResolve(E.message);
      LogMessage('[ERRO] [Local:%s] [Msg:%s] [Exception:%s]', [FLastError.Local, FLastError.Msg, FLastError.Exception]);
    end;
  end;
end;

function TRestApiNuvemshop.Get(Req: TRestApiReq): Integer;
begin
  if Req = nil then
    Req := TRestApiReq.New('', '', '');

  Req.LogReq;
  Req.Method := rmGET;
  Result := Exec(Req);
end;

procedure TRestApiNuvemshop.LogMessage(Msg: string; const Args: array of const);
begin
  LogMessage(Format(Msg, Args));
end;

procedure TRestApiNuvemshop.LogMessage(Msg: string);
begin
  if Assigned(FLogEvent) then
    FLogEvent(Format('[%s]', [Self.ClassName]) + Msg);
end;

procedure TRestApiNuvemshop.MessageErrorResolve(AError: string);
begin
  FLastError.Exception := AError;
  if AError.ToLower.Contains('the server name or address could not be resolved') then
    FLastError.Msg := 'Problema de conexão'
  else if AError.ToLower.Contains('a connection with the server could not be established') then
    FLastError.Msg := 'Problema de conexão, verifique sua rede local'
  else if AError.ToLower.Contains('the operation timed out') then
    FLastError.Msg := 'Problema de conexão, Time out'
  else if AError.ToLower.Contains('the connection with the server was terminated abnormally') then
    FLastError.Msg := 'A Conexão foi interrompida'
end;

function TRestApiNuvemshop.Post(Req: TRestApiReq): Integer;
begin
  if Req = nil then
    Req := TRestApiReq.New('', '', '');

  Req.LogReq;
  Req.Method := rmPOST;
  Result := Exec(Req);
end;

function TRestApiNuvemshop.Put(Req: TRestApiReq): Integer;
begin
  if Req = nil then
    Req := TRestApiReq.New('', '', '');

  Req.LogReq;
  Req.Method := rmPUT;
  Result := Exec(Req);
end;

function TRestApiNuvemshop.Split(Expression, Delimiter: string): TStringList;
var
  Res:        TStringList;
  ResCount:   DWORD;
  dLength:    DWORD;
  StartIndex: DWORD;
  sTemp:      string;
begin
  Res := TStringList.Create;
  Res.Clear;
  dLength := Length(Expression);
  StartIndex := 1;
  ResCount := 0;
  repeat
    sTemp := Copy(Expression, StartIndex, Pos(Delimiter, Copy(Expression, StartIndex, Length(Expression))) - 1);
//    SetLength(Res, Length(Res) + 1);
//    SetLength(Res[ResCount], Length(sTemp));
//    Res[ResCount] := sTemp;
    if trim(sTemp) <> '' then
      Res.Add(sTemp);
    StartIndex := StartIndex + Length(sTemp) + Length(Delimiter);
    ResCount := ResCount + 1;
  until StartIndex > dLength;
  Result := Res;

end;

function TRestApiNuvemshop.UrlResolve(Params: array of string): string;
var
  I: Integer;
  protocol: string;
begin
  Result := '';
  for I := Low(Params) to High(Params) do
    Result := Result + IfThen(I > Low(Params), '/') + Params[I] +
                       IfThen(I = High(Params), '/');

  protocol := IfThen(Result.StartsWith('https:'), 'https', 'http');


  Result := ReplaceStr(Result, 'https:', '');
  Result := ReplaceStr(Result, 'http:', '');

  while Result.StartsWith('/') or Result.StartsWith('\') do
    System.Delete(Result, 1, 1);

  Result := ReplaceStr(Result, '//', '/');
  Result := ReplaceStr(Result, '/?', '?');

  if not HideProtocol then
    Result := Format('%s://%s', [protocol, Result])
end;

end.
