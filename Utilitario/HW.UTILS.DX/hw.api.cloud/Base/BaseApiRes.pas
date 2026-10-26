unit BaseApiRes;

interface

uses
  Hw.Api.Rest,
  Hw.Types,
  RestApiBaseRes,
  RepoLog,
  System.SysUtils,
  ErrorApiRes;

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

  TBaseApi = class
  private
    FApi      : TRestApiBase;
    FToken    : TToken;
    FempresaId: Integer;
    Fcaixaid  : Integer;
    FCNPJ     : string;
    FLog      : TLogText;
    FrepoLog  : TRepoLog;
  protected
    caixaCode: string;
    FLastError: TErrorDetail;
    procedure HandleLog(text: string); overload;
    procedure HandleLog(
      text      : string;
      const args: array of const); overload;
  public
    constructor Create();
    destructor Destroy; override;
    procedure InitApi(
      URL, CNPJEmp, emissorCode: string;
      cod_empresa, cod_emissor : Integer);

    function ConcederAcesso: TResponseBase; virtual;
    function Call(
      req   : TReq;
      method: ReqMethod = rmUndefined): TResponseBase;
    function Get(req: TReq): TResponseBase;
    function GetT< T >(req: TReq): TResp< T >;
    function Post(req: TReq): TResponseBase;
    function PostT< T >(req: TReq): TResp< T >;
    function Put(req: TReq): TResponseBase;

    property Api: TRestApiBase read FApi write FApi;
    property Token: TToken read FToken write FToken;
    property LastError: TErrorDetail read FLastError write FLastError;
    property OnLog: TLogText read FLog write FLog;
    property repoLog: TRepoLog read FrepoLog write FrepoLog;
  end;

implementation

uses
  System.StrUtils,
  Rest.Json,
  hw_win_utils;

{ TBaseApi }

function TBaseApi.ConcederAcesso: TResponseBase;
const D = 'TBaseApi.ConcederAcesso';
var
  Logar: Boolean;
begin
  Result      := TResponseBase.Create;
  Result.code := 0;
  FLastError.Clear;

  Logar := not Assigned(Token);
  if not Logar then
    Logar := Now > Token.expiresIn;

  if Logar then
  begin
    // Api.OnLog := FLogEvent;
    Api.restRequest.Params.Clear;
    Api.restRequest.Params.AddHeader('cnpj', FCNPJ);

    Result.code := Api.Post(TRestApiReq.New('auth', '', Format('{"empresaId":"%d","cnpj":"%s","code":"%s"}',
      [FempresaId, FCNPJ, caixaCode])));
    if Result.isSuccess then
    begin
      FToken := TJson.JsonToObject< TToken >(Api.JSONReponse);

      if not Assigned(FToken) then
        raise ExceptionApp.Create('Token de usuário não veio como esperado', D);
    end
    else if Assigned(Api.ErroApi) then
      raise ExceptionApp.Create(Format('Api: %d - %s', [Api.ErroApi.code, Api.ErroApi.message]), D)
    else
      raise Exception.Create(Format('%s - %s', [Api.LastError.msg, Api.LastError.Exception]));
  end
  else
    Result.code := 200;

  if (not FToken.CNPJ.Trim.Equals(FCNPJ.Trim)) or
    (FToken.caixaId <> Fcaixaid) or
    (FToken.empresaId <> FempresaId)
  then
  begin
    FToken      := nil;
    Result.code := 0;
    raise ExceptionApp.Create(Format('Token de acesso incompativel com parametros do sistema' + sLineBreak +
      'CNPJ: %s' + sLineBreak +
      'Empresa Id: %d' + sLineBreak +
      'Caixa Id: %d' + sLineBreak +
      'Caixa Code: %s' + sLineBreak,
      [FCNPJ, FempresaId, Fcaixaid, caixaCode]), D);
  end;

  Api.AssignTokenAuthorization(Token);

end;

constructor TBaseApi.Create();
begin
  FLastError := TErrorDetail.Create;
end;

destructor TBaseApi.Destroy;
begin
  if Assigned(FApi) then
    FreeAndNil(FApi);
  FLastError.Free;
  inherited;
end;

function TBaseApi.Get(req: TReq): TResponseBase;
begin
  Result := Call(req, rmGET);
end;

function TBaseApi.GetT< T >(req: TReq): TResp< T >;
begin
  Result := TResp< T >.Create;
  with Call(req, rmGET) do
  begin
    Result.code := code;
    Result.data := data;
  end;
end;

function TBaseApi.Call(
  req   : TReq;
  method: ReqMethod): TResponseBase;
const D = 'TBaseApi.Call';
begin
  Result := TResponseBase.Create;
  FLastError.Clear;

  if method in [rmPATCH, rmUndefined] then
    raise ExceptionApp.Create('Metodo não implementado ou indefinido', D);

  // se o token ja foi carregado e nao expirado nao vai fazer login na primeira tentativa


  Result := ConcederAcesso;
  if Result.isSuccess then
  begin
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
        raise ExceptionApp.Create('Metodo não implementado ou indefinido', D);
    end;

    // caso a consulta na api retorne não autorizado então vai tentar obter um novo token
    if Result.code = 401 then
    begin
      Token  := nil;
      Result := ConcederAcesso;
      if not Result.isSuccess then
        FLastError.RaiseErrorIfExists;

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
          raise ExceptionApp.Create('Metodo não implementado ou indefinido', D);
      end;
    end;

    if Result.isSuccess then
      Result.data := Api.JSONReponse
    else
      Api.RaiseApiError;
  end
  else
    FLastError.RaiseErrorIfExists('*Erro não catalogado no processo de autorização*');
end;

procedure TBaseApi.InitApi(
  URL, CNPJEmp, emissorCode: string;
  cod_empresa, cod_emissor : Integer);
begin
  if not Assigned(Api) then
    FApi := TRestApiBase.Create(URL);
//  FApi.OnLog   := OnLog;
  FApi.BaseUrl := URL;
  FCNPJ        := CNPJEmp;
  caixaCode   := emissorCode;
  FempresaId   := cod_empresa;
  Fcaixaid     := cod_emissor;
end;

procedure TBaseApi.HandleLog(
  text      : string;
  const args: array of const);
begin
  HandleLog(Format(text, args));
end;

procedure TBaseApi.HandleLog(text: string);
begin
  if Assigned(FLog) then
    FLog(Format('[%s]', [Self.ClassName]) + text);
end;

function TBaseApi.Post(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPOST);
end;

function TBaseApi.PostT<T>(req: TReq): TResp<T>;
begin
  Result := TResp< T >.Create;
  with Call(req, rmPOST) do
  begin
    Result.code := code;
    Result.data := data;
  end;
end;

function TBaseApi.Put(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPUT);
end;

{ TResponseBase }

function TResponseBase.GetIsSuccess: Boolean;
begin
  Result := (code >= 200) and (code <= 299);
end;

end.
