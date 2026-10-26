unit BaseApi_45;

interface

uses
  Hw.Api.Rest;

const
  URLBaseProd = 'localhost:910/posprinter/api';
  URLBaseHom = 'localhost:59289/api';
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

  TResponseError = class
  private
    FMessage: string;
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
    property Message: string read FMessage write FMessage;
  end;

  TRestApiBase_45 = class(TRestApi)
  private
    FErroApi: TResponseError;
  protected
    procedure AfterContentResponse; override;
  public
    property ErroApi: TResponseError read FErroApi write FErroApi;
  end;

  TBaseApi_45 = class
  private
    FApi      : TRestApiBase_45;
    cnpj: string;
  protected
  public
    constructor Create(params: string);
    destructor Destroy; override;

    function Call(
      req   : TReq;
      method: ReqMethod = rmUndefined): TResponseBase;
//    function Get(req: TReq): TResponseBase;
//    function GetT< T >(req: TReq): TResp< T >;
//    function Post(req: TReq): TResponseBase;
//    function PostT< T >(req: TReq): TResp< T >;
//    function Put(req: TReq): TResponseBase;

    property Api: TRestApiBase_45 read FApi write FApi;
  end;

implementation

{ TBaseApi_45 }

uses
  System.SysUtils,
  System.StrUtils,
  REST.Json,
  hw_utils,
  hw_win_utils;

function TBaseApi_45.Call(req: TReq; method: ReqMethod): TResponseBase;
begin
  Result := TResponseBase.Create;

  if method in [rmPATCH, rmUndefined] then
    raise Exception.Create('Metodo não implementado ou indefinido');

  req.ParamsURL := Format('key=%s&cnpj=%s',[SECRET_KEY, cnpj]);
  // se o token ja foi carregado e nao expirado nao vai fazer login na primeira tentativa

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
      raise Exception.Create('Metodo não implementado ou indefinido');
  end;

  if Result.isSuccess then
    Result.data := Api.JSONReponse
  else if Assigned(Api.ErroApi) then
  begin
    LogApp.Error('[ERRO] [Local:TBaseApi_45.Call] [Code:%d] [Msg:%s]', [Api.ErroApi.code, Api.ErroApi.Message]);

    raise Exception.Create(Format('%d %s', [Api.ErroApi.code, Api.ErroApi.Message]))
  end
  else
  begin
    if not Api.LastError.Exception.IsEmpty then
      LogApp.Error('[ERRO] [Local:%s] [Msg:%s] [Exception:%s]', [Api.LastError.Local, Api.LastError.Msg, Api.LastError.Exception]);

    raise Exception.Create(ERRO_DEFAULT);
  end;
end;

constructor TBaseApi_45.Create(params: string);
begin
  var paramsList := NewStringList(params, ';');

  FApi := TRestApiBase_45.Create(IfThen(IniConf.ReadStr('MD', 'MODODEVAPIS') = 'S', URLBaseHom, URLBaseProd), True);
  if IniConf.ReadStr('MD', 'URLAGENTESINALR') <> '' then
    FApi.BaseUrl := IniConf.ReadStr('MD', 'URLAGENTESINALR');


  cnpj := paramsList.Values['cnpj'];
end;

destructor TBaseApi_45.Destroy;
begin
  if Assigned(FApi) then
    FreeAndNil(FApi);
  inherited;
end;

{ TRestApiBase_45 }

procedure TRestApiBase_45.AfterContentResponse;
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
            FErroApi.code := restResponse.StatusCode;
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

{ TResponseBase }

function TResponseBase.GetIsSuccess: Boolean;
begin
  Result := (code >= 200) and (code <= 299);
end;

end.
