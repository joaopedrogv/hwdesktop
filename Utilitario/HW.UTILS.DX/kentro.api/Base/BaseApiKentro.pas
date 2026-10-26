unit BaseApiKentro;

interface

uses
  Hw.Api.Rest, System.Generics.Collections, Vcl.AxCtrls, superobject, hw_utils;

const
  ERRO_DEFAULT = 'Erro não catalogado de execução na API. Consulte o erros.log para mais detalhes';

type
  ReqMethod = (rmPOST, rmPUT, rmGET, rmDELETE, rmPATCH, rmUndefined);

  TReq = TRestApiReq;

  TResponseGenericDados = class
  private
    F_sucesso: string;
    F_falha: string;
  published
    property _sucesso: string read F_sucesso write F_sucesso;
    property _falha: string read F_falha write F_falha;
  end;

  TResponseGeneric = class
  private
    F_status: string;
    F_dados: TResponseGenericDados;
    F_mensagem: string;
  public
    property _status  : string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados   : TResponseGenericDados read F_dados write F_dados;
  end;

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
  private
  protected
      procedure AfterContentResponse; override;
  public
    procedure AssignTokenAuthorization(req: TReq = nil);
  end;

  TBaseApiKentro = class
  strict private
    DevelopmentMode: Boolean;
  private
    FURLApi: string;
    FCertificateId: string;
    FLastErrorApi: string;
    FraiseError: Boolean;
    FApi: TRestApiBase;
    Ftoken: string;
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure InitApi(URL: string);

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

procedure TRestApiBase.AssignTokenAuthorization(req: TReq);
var
  I: Integer;
begin
  restRequest.ClearBody;
  restRequest.Params.Clear;


  restRequest.Accept := 'application/json; charset=utf-8'; //'application/json';

  if Assigned(req) and (not req.Accept.IsEmpty) then
    restRequest.Accept := req.Accept;
end;

{ TBaseApiKentro }

function TBaseApiKentro.Call(pContentType, pTipoMethod, pNomeMethod,
  pBody: string): TResponseBase;
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

function TBaseApiKentro.Call(req: TReq; method: ReqMethod): TResponseBase;
begin
  Result := TResponseBase.Create;

  if method in [rmPATCH, rmUndefined] then
    raise Exception.Create('Metodo não implementado ou indefinido');

  Api.AssignTokenAuthorization(req);

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

constructor TBaseApiKentro.Create;
begin
  FApi := TRestApiBase.Create('');
end;

destructor TBaseApiKentro.Destroy;
begin
  if Assigned(FApi) then
    FreeAndNil(FApi);
  inherited;
end;

function TBaseApiKentro.Get(req: TReq): TResponseBase;
begin
  Result := Call(req, rmGET);
end;

procedure TBaseApiKentro.InitApi(URL: string);
begin
  FURLApi := URL;

  FApi.BaseUrl := URL;
end;

function TBaseApiKentro.Post(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPOST);
end;

function TBaseApiKentro.Put(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPUT);
end;

{ TResponseBase }

function TResponseBase.GetIsSuccess: Boolean;
begin
  Result := (code >= 200) and (code <= 299);
end;

end.
