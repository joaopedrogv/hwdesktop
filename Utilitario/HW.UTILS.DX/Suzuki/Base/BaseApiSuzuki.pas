unit BaseApiSuzuki;

interface

uses
  Hw.Api.Rest, System.Generics.Collections, Vcl.AxCtrls, superobject, hw_utils,
  REST.Json;

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
  //  private
  //    FErroApi: string;
  protected
      procedure AfterContentResponse; override;
  public
    procedure AssignUsuarioSenhaAuthorization(usuario, senha, cliente: string; req: TReq = nil);
    procedure AssignTokenAuthorization(token: string; req: TReq = nil);
  //    property ErroApi: string read FErroApi write FErroApi;
  end;

  TBaseApiSuzuki = class
  strict private
    DevelopmentMode: Boolean;
  private
    FURLApi: string;
    FCertificateId: string;
    FLastErrorApi: string;
    FraiseError: Boolean;
    FApi: TRestApiBase;
    Fusuario: string;
    Fsenha: string;
    Fcliente: string;
    Facess_token: string;
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure InitApi(URL: string; usuario: string; senha: string; cliente: string); overload;
    procedure InitApi(URL: string; acess_token: string); overload;

    function Call(req   : TReq; method: ReqMethod = rmUndefined): TResponseBase; overload;
    function Call(pContentType: string; pTipoMethod: string; pNomeMethod: string; pBody: string): TResponseBase; overload;
    function Call2(req   : TReq; method: ReqMethod = rmUndefined): TResponseBase; overload;
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

procedure TRestApiBase.AssignTokenAuthorization(token: string; req: TReq);
begin
  restRequest.ClearBody;
  restRequest.Params.Clear;

  if not token.Trim.IsEmpty then
    with restRequest.Params.AddItem do
    begin
      name    := 'Authorization';
      Value   := 'Bearer ' + token;
      Kind    := pkHTTPHEADER;
      Options := [poDoNotEncode];
    end;
end;

procedure TRestApiBase.AssignUsuarioSenhaAuthorization(
  usuario, senha, cliente: string; req: TReq);
var
  I: Integer;
begin
  restRequest.ClearBody;
  restRequest.Params.Clear;

  if not usuario.Trim.IsEmpty then
    with restRequest.Params.AddItem do
    begin
      name    := 'usuario';
      Value   := usuario;
      Kind    := pkREQUESTBODY;
      Options := [poDoNotEncode];
    end;

  if not senha.Trim.IsEmpty then
    with restRequest.Params.AddItem do
    begin
      name    := 'senha';
      Value   := senha;
      Kind    := pkREQUESTBODY;
      Options := [poDoNotEncode];
    end;

  if not cliente.Trim.IsEmpty then
    with restRequest.Params.AddItem do
    begin
      name    := 'cliente';
      Value   := cliente;
      Kind    := pkREQUESTBODY;
      Options := [poDoNotEncode];
    end;

  restRequest.Accept := 'application/json; charset=utf-8'; //'application/json';

  if Assigned(req) and (not req.Accept.IsEmpty) then
    restRequest.Accept := req.Accept;
end;

{ TBaseApiSuzuki }

function TBaseApiSuzuki.Call(req: TReq;
  method: ReqMethod): TResponseBase;
begin
  Result := TResponseBase.Create;

  if method in [rmPATCH, rmUndefined] then
    raise Exception.Create('Metodo não implementado ou indefinido');

  Api.AssignUsuarioSenhaAuthorization(Self.Fusuario, Self.Fsenha, Self.Fcliente, req);

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

function TBaseApiSuzuki.Call(
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

function TBaseApiSuzuki.Call2(req: TReq; method: ReqMethod): TResponseBase;
begin
  Result := TResponseBase.Create;

  if method in [rmPATCH, rmUndefined] then
    raise Exception.Create('Metodo não implementado ou indefinido');

  Api.AssignTokenAuthorization(Self.Facess_token, req);

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

constructor TBaseApiSuzuki.Create;
begin
  FApi := TRestApiBase.Create('', True, False);
end;

destructor TBaseApiSuzuki.Destroy;
begin
  if Assigned(FApi) then
    FreeAndNil(FApi);
  inherited;
end;

function TBaseApiSuzuki.Get(req: TReq): TResponseBase;
begin
  Result := Call(req, rmGET);
end;

procedure TBaseApiSuzuki.InitApi(URL, acess_token: string);
begin
  FURLApi      := URL;
  Facess_token := acess_token;

  FApi.BaseUrl := URL;
end;

procedure TBaseApiSuzuki.InitApi(URL: string; usuario: string; senha: string; cliente: string);
begin
  FURLApi  := URL;
  Fusuario := usuario;
  Fsenha   := senha;
  Fcliente := cliente;

  FApi.BaseUrl := URL;
end;

function TBaseApiSuzuki.Post(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPOST);
end;

function TBaseApiSuzuki.Put(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPUT);
end;

{ TResponseBase }

function TResponseBase.GetIsSuccess: Boolean;
begin
  Result := (code >= 200) and (code <= 299);
end;

end.
