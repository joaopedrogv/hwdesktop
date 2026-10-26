unit BaseApiHwCloud;

interface

uses
  Hw.Api.Rest, System.Generics.Collections, Vcl.AxCtrls, superobject, hw_utils,
  REST.Json;

const
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

  TRestApiBase = class(TRestApi)
  //  private
  //    FErroApi: string;
  protected
      procedure AfterContentResponse; override;
  public
    procedure AssignAuthorization(authorization: string; req: TReq = nil);
  //    property ErroApi: string read FErroApi write FErroApi;
  end;

  TBaseApiHwCloud = class
  strict private
    DevelopmentMode: Boolean;
  private
    FURLApi: string;
    FCertificateId: string;
    FLastErrorApi: string;
    FraiseError: Boolean;
    FApi: TRestApiBase;
    Fauthorization: string;
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure InitApi(URL: string; authorization: string); overload;

    function Call(req   : TReq; method: ReqMethod = rmUndefined): TResponseBase; overload;
    function Call(pContentType: string; pTipoMethod: string; pNomeMethod: string; pBody: string): TResponseBase; overload;
    function Get(req: TReq): TResponseBase;
    function Post(req: TReq): TResponseBase;
    function Put(req: TReq): TResponseBase;

    property Api: TRestApiBase read FApi write FApi;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  hw_win_utils,
  REST.Types, System.Win.ComObj, Winapi.ActiveX, System.Variants,
  System.Classes;

{ TRestApiBase }

procedure TRestApiBase.AfterContentResponse;
begin
  inherited;

end;

procedure TRestApiBase.AssignAuthorization(authorization: string; req: TReq);
begin
  restRequest.ClearBody;
  restRequest.Params.Clear;

  if not authorization.Trim.IsEmpty then
    with restRequest.Params.AddItem do
    begin
      name    := 'Authorization';
      Value   := authorization;
      Kind    := pkHTTPHEADER;
      Options := [poDoNotEncode];
    end;

  restRequest.Accept := 'application/json';
end;

{ TBaseApiHwCloud }

function TBaseApiHwCloud.Call(req: TReq;
  method: ReqMethod): TResponseBase;
begin
  Result := TResponseBase.Create;

  if method in [rmPATCH, rmUndefined] then
    raise Exception.Create('Metodo não implementado ou indefinido');

  Api.AssignAuthorization(Self.Fauthorization, req);

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

  Result.data := Api.JSONReponse;
end;

function TBaseApiHwCloud.Call(
  pContentType: string; pTipoMethod: string; pNomeMethod: string; pBody: string): TResponseBase;
var
  Request: OleVariant;
  HttpStream :IStream;
  OleStream: TOleStream;
  _StringStream: TStringStream;
  _Objeto: ISuperObject;
begin
  Result := TResponseBase.Create;

  CoInitialize(nil);
  _StringStream:= TStringStream.Create;
  try
    Request := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    Request.Open(pTipoMethod,
      IfThen((not ContainsStr(Self.FURLApi, 'http://')) and (not ContainsStr(Self.FURLApi, 'https://')), 'http://') +
        Self.FURLApi + '/' + pNomeMethod, False);
    Request.SetRequestHeader('Content-Type', pContentType);
    Request.Send(pBody);
    HttpStream := IUnknown(Request.ResponseStream) as IStream;

    OleStream:= TOleStream.Create(HttpStream);
    _StringStream.LoadFromStream(OleStream);

    _Objeto := SO(Utf8ToAnsi(_StringStream.DataString));

    Result.data := _Objeto.AsJSon(true);
    Result.code := 200;
    Result.GetIsSuccess;
  finally
    Request := Unassigned;
  end;
end;

constructor TBaseApiHwCloud.Create;
begin
  FApi := TRestApiBase.Create('', True, False);
end;

destructor TBaseApiHwCloud.Destroy;
begin
  if Assigned(FApi) then
    FreeAndNil(FApi);
  inherited;
end;

function TBaseApiHwCloud.Get(req: TReq): TResponseBase;
begin
  Result := Call(req, rmGET);
end;

procedure TBaseApiHwCloud.InitApi(URL, authorization: string);
begin
  FURLApi        := URL;
  Fauthorization := authorization;

  FApi.BaseUrl   := URL;
end;

function TBaseApiHwCloud.Post(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPOST);
end;

function TBaseApiHwCloud.Put(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPUT);
end;

{ TResponseBase }

function TResponseBase.GetIsSuccess: Boolean;
begin
  Result := (code >= 200) and (code <= 299);
end;

end.
