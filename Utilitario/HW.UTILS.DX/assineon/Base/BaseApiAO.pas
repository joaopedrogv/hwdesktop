unit BaseApiAO;

interface

uses
  Hw.Api.Rest,
  System.SysUtils;

const
  URLBaseProd = 'assineon.com.br/api';
  URLBaseHom = '192.168.254.50:5000/api';
  SECRET_KEY = 'DfEhYs9Jm7DU';
  ERRO_DEFAULT = 'Erro não catalogado de execução na API. Consulte o erros.log para mais detalhes';

type
  ReqMethod = (rmPOST, rmPUT, rmGET, rmDELETE, rmPATCH, rmUndefined);

  TReq = TRestApiReq;

  TResponseBase = class
  private
    Fcode: Integer;
    Fdata: string;
    function GetIsSuccess: Boolean;
  public
    property code     : Integer read Fcode write Fcode;
    property data     : string read Fdata write Fdata;
    property isSuccess: Boolean read GetIsSuccess;
  end;

  TResp< T > = class(TResponseBase)
  private
    Fobj: T;
  public
    property obj: T read Fobj write Fobj;
  end;

//  TResponseError = record
//  private
//    FMessage: string;
//    Fcode: Integer;
//  public
//    procedure RaiseApiError;
//  published
//    property code: Integer read Fcode write Fcode;
//    property Message: string read FMessage write FMessage;
//  end;
  TResponseError = class
  private
    Fmessage: string;
    Fdetail: string;
  published
    function FormatDetail: string;

    property message: string read Fmessage write Fmessage;
    property detail: string read Fdetail write Fdetail;
  end;


  TRestApiBase = class(TRestApi)
  private
    FErroApi: string;
  protected
    procedure AfterContentResponse; override;
  public
    procedure AssignTokenAuthorization(token: string);
    property ErroApi: string read FErroApi write FErroApi;
  end;

  TBaseApiAO = class
  private
    FApi      : TRestApiBase;
    FbearerToken: string;
  public
    destructor Destroy; override;
    procedure InitApi(URL: string);

    function ConcederAcesso: TResponseBase; virtual;
    function Call(
      req   : TReq;
      method: ReqMethod = rmUndefined;
      doNotRaiseError: Boolean = False): TResponseBase;
    function Get(req: TReq): TResponseBase;
    function GetT< T >(req: TReq): TResp< T >;
    function Post(req: TReq): TResponseBase;
    function PostT< T >(req: TReq): TResp< T >;
    function Put(req: TReq): TResponseBase;

    property Api: TRestApiBase read FApi write FApi;
    property bearerToken: string read FbearerToken write FbearerToken;
  end;

implementation

uses
  System.StrUtils,
  Rest.Json,
  hw_win_utils, REST.Types, hw_utils;

{ TBaseApiAO }

function TBaseApiAO.ConcederAcesso: TResponseBase;
begin
  Result := TResponseBase.Create;
  Result.code := 200;
end;

destructor TBaseApiAO.Destroy;
begin
  if Assigned(FApi) then
    FreeAndNil(FApi);
  inherited;
end;

function TBaseApiAO.Get(req: TReq): TResponseBase;
begin
  Result := Call(req, rmGET);
end;

function TBaseApiAO.GetT< T >(req: TReq): TResp< T >;
begin
  Result := TResp< T >.Create;
  with Call(req, rmGET) do
  begin
    Result.code := code;
    Result.data := data;
  end;
end;

function TBaseApiAO.Call(
  req   : TReq;
  method: ReqMethod;
  doNotRaiseError: Boolean): TResponseBase;
const D = 'TBaseApi.Call';
begin
  Result := TResponseBase.Create;

  if method in [rmPATCH, rmUndefined] then
    raise Exception.Create('Metodo não implementado ou indefinido');

  Api.AssignTokenAuthorization(bearerToken);

  case method of
    rmPOST:
      Result.code := Api.Post(req);
    rmPUT:
      Result.code := Api.Put(req);
    rmGET:
      Result.code := Api.Get(req);
    rmDELETE:
      Result.code := Api.Delete(req);
    else
      raise Exception.Create('Metodo não implementado ou indefinido')
  end;

  if Result.isSuccess then
    Result.data := Api.JSONReponse
  else if not doNotRaiseError then
    raise Exception.Create(StrDefault(StrDefault(Api.ErroApi, Api.LastError.Exception), ERRO_DEFAULT))
  else
    Result.data := Api.JSONReponse
end;

procedure TBaseApiAO.InitApi(URL: string);
begin
  if not Assigned(Api) then
    FApi := TRestApiBase.Create(URL);

  FApi.BaseUrl := URL;
end;

function TBaseApiAO.Post(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPOST);
end;

function TBaseApiAO.PostT<T>(req: TReq): TResp<T>;
begin
  Result := TResp< T >.Create;
  with Call(req, rmPOST) do
  begin
    Result.code := code;
    Result.data := data;
  end;
end;

function TBaseApiAO.Put(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPUT);
end;

{ TResponseBase }

function TResponseBase.GetIsSuccess: Boolean;
begin
  Result := (code >= 200) and (code <= 299);
end;

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
            var respError := TJson.JsonToObject< TResponseError >(JSONReponse);
            ErroApi := StrConcat([respError.message, _DLB, respError.FormatDetail]);

            if Assigned(FEventResponse) then
              FEventResponse(Self);
            Exit;

          except
          end;
        end;


        case restResponse.StatusCode of
          401:
            ErroApi := 'Não Autorizado';
          403:
            ErroApi := 'Proibido';
          404:
            ErroApi := 'Conteúdo não encontrado';
          else
            ErroApi := 'Erro não catalogado';
        end;

        if Assigned(FEventResponse) then
          FEventResponse(Self);
      end;
  end;
end;

procedure TRestApiBase.AssignTokenAuthorization(token: string);
begin
  restRequest.Params.Clear;
  if not token.Trim.IsEmpty then
    with restRequest.Params.AddItem do
    begin
      name    := 'Authorization';
      Value   := 'Bearer ' + token;
      Kind    := pkHTTPHEADER;
      Options := [poDoNotEncode];
    end;

  restRequest.Accept := 'application/json';
end;

{ TResponseError }

function TResponseError.FormatDetail: string;
begin
  Result := Fdetail;
end;

end.
