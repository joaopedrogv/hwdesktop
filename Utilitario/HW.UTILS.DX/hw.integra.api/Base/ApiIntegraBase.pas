unit ApiIntegraBase;

interface

uses
  Hw.Api.Rest,
  Hw.Integra.Api,
  UsuarioClienteEtd;

const
  ERRO_DEFAULT = 'Erro não catalogado de execução na API. Consulte o erros.log para mais detalhes';

type
  ReqMethod = (rmPOST, rmPUT, rmGET, rmDELETE, rmPATCH, rmUndefined);

  TReq = TRestApiReq;

  TResponseBase = class
  private
    Fcode: Integer;
    Fdata: string;
    Fmessage: string;
    function GetIsSuccess: Boolean;
  public
    procedure RaiseError(msgDef: string = '');
    property code     : Integer read Fcode    write Fcode;
    property message  : string  read Fmessage write Fmessage;
    property data     : string  read Fdata    write Fdata;
    property isSuccess: Boolean read GetIsSuccess;
  end;

  TResp< T > = class(TResponseBase)
  private
    Fobj: T;
  public
    property obj: T read Fobj write Fobj;
  end;

  TApiIntegraBase = class(THwIntegraApi)
  public
    function Call(
      req   : TReq;
      method: ReqMethod = rmUndefined;
      doNotRaiseError: Boolean = False): TResponseBase;
    function GetT< T >(req: TReq): TResp< T >;

  end;

implementation

uses
  Hw.Json,
  System.SysUtils;

{ TApiIntegraBase }

function TApiIntegraBase.Call(req: TReq;
  method: ReqMethod;
  doNotRaiseError: Boolean): TResponseBase;
const D = 'THwIntegraApiHandle.Call';
begin
  Result := TResponseBase.Create;

  if method in [rmPATCH, rmUndefined] then
    raise Exception.Create(Format('%s - Metodo não implementado ou indefinido', [D]));

  Result.code := GrantAccess;
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
        raise Exception.Create(Format('%s - Metodo não implementado ou indefinido', [D]));
    end;

    // caso a consulta na api retorne não autorizado então vai tentar obter um novo token
    if Result.code = 401 then
    begin
      Token  := nil;
      Result.code := GrantAccess;
      if not Result.isSuccess then
        Result.RaiseError('Acesso não permitido. Se persistir o problema contacte o suporte técnico');

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
          raise Exception.Create(Format('%s - Metodo não implementado ou indefinido', [D]));
      end;
    end;

    if Result.isSuccess then
      Result.data := Api.JSONReponse
    else if doNotRaiseError then
      Result.data := Api.JSONReponse
    else
      Api.RaiseApiError

  end
  else if doNotRaiseError then
    Result.data := Api.JSONReponse
  else
    raise Exception.Create(ERRO_DEFAULT);
end;

function TApiIntegraBase.GetT<T>(req: TReq): TResp<T>;
begin
  Result := TResp< T >.Create;
  with Call(req, rmGET) do
  begin
    Result.code := code;
    Result.data := data;
  end;
end;

{ TResponseBase }

function TResponseBase.GetIsSuccess: Boolean;
begin
  Result := (code >= 200) and (code <= 299);
end;

procedure TResponseBase.RaiseError(msgDef: string);
begin
  if not Fmessage.Trim.IsEmpty then
    raise Exception.Create(Fmessage)
  else if not msgDef.Trim.IsEmpty then
    raise Exception.Create(msgDef)
  else
    raise Exception.Create(ERRO_DEFAULT);
end;

end.
