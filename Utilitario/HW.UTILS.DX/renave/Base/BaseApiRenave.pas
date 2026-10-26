unit BaseApiRenave;

interface

uses
  System.Net.HttpClientComponent,
  System.Net.URLClient,
  System.Net.HttpClient,
  Hw.Api.Rest;

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
    procedure SetResp(response: IHTTPResponse);

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

  TResponse401 = class
  private
    Fstatus: SmallInt;
    Ferror: string;
    Fmessage: string;
    Fpath: string;
    Ftimestamp: TDateTime;
  public
    procedure RaiseError;
  published
    property status: SmallInt read Fstatus write Fstatus;
    property error: string read Ferror write Ferror;
    property message: string read Fmessage write Fmessage;
    property path: string read Fpath write Fpath;
    property timestamp: TDateTime read Ftimestamp write Ftimestamp;
  end;

  TResponseError = class
  private
    FdataHora: TDateTime;
    Fdetalhe: string;
    FmensagemParaUsuarioFinal: string;
    Ftitulo: string;
    FlogIdRastreabilidade: string;
  public
    procedure RaiseError;
  published
    property dataHora: TDateTime read FdataHora write FdataHora;
    property detalhe: string read Fdetalhe write Fdetalhe;
    property mensagemParaUsuarioFinal: string read FmensagemParaUsuarioFinal write FmensagemParaUsuarioFinal;
    property titulo: string read Ftitulo write Ftitulo;
    property logIdRastreabilidade: string read FlogIdRastreabilidade write FlogIdRastreabilidade;
  end;

  TBaseApiRenave = class
  strict private
    DevelopmentMode: Boolean;
  private
    FURLApi: string;
    FCertificateId: string;
    FOnNeedClientCertificate: TNeedClientCertificateEvent;
    FLastErrorApi: string;
    FraiseError: Boolean;
//    FErroApi: TResponseError;
//    FLastErrorApi: string;

    procedure NeedCertificate(const Sender: TObject;
      const ARequest: TURLRequest;
      const ACertificateList: TCertificateList; var AnIndex: Integer);
    procedure RequestCompleted(const Sender: TObject;
      const AResponse: IHTTPResponse);
//    function GetErroApi: TResponseError;
  protected
    netClient: TNetHTTPClient;
    netRequest: TNetHTTPRequest;

    function UrlResolve(urls: array of string): string;

  public
    constructor Create;
    destructor Destroy; override;
    procedure Reset;

    function Call(
      req   : TReq;
      method: ReqMethod = rmUndefined): TResponseBase;
    function Get(req: TReq): TResponseBase;
    function GetT< T >(req: TReq): TResp< T >;
    function Post(req: TReq): TResponseBase;

    property URLApi: string read FURLApi write FURLApi;
    property CertificateId: string read FCertificateId write FCertificateId;
    property OnNeedClientCertificate: TNeedClientCertificateEvent read FOnNeedClientCertificate write FOnNeedClientCertificate;
    property LastErrorApi: string read FLastErrorApi write FLastErrorApi;
    property raiseError: Boolean read FraiseError write FraiseError;
    //property ErroApi: TResponseError read GetErroApi;
  end;

implementation

uses
  REST.Json,
  hw_utils,
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  hw_win_utils;

{ TBaseApiRenave }

function TBaseApiRenave.UrlResolve(urls: array of string): string;
begin
  Result := FURLApi;
  for var u in urls do
    Result := Result + IfThen(Result <> '', '/') + u;

  Result := ReplaceText(Result, '//', '/');
  Result := ReplaceText(Result, '/?', '?');

  Result := Format('https://%s', [Result]);
end;

function TBaseApiRenave.Call(req: TReq; method: ReqMethod
  ): TResponseBase;
//var
//  AFormData: TIdMultiPartFormDataStream;
begin

  Result := TResponseBase.Create;
  FLastErrorApi := '';

  if Assigned(FOnNeedClientCertificate) then
    netClient.OnNeedClientCertificate := FOnNeedClientCertificate;
//  else
//    netClient.OnNeedClientCertificate := NeedCertificate;

  netClient.ContentType := 'application/json;charset=UTF-8';
  netClient.CustomHeaders['ContentType'] := 'application/json;charset=UTF-8';


//  netClient.Post(urlRequest, '', [], [], [TNameValuePair.Create('ContentType', 'application/json;charset=UTF-8')]);
//  var json := TStringStream.Create(req.JSONString, TEncoding.UTF8);

  if method in [rmPATCH, rmUndefined] then
    raise Exception.Create('Metodo não implementado ou indefinido');

  var urlRequest := UrlResolve([req.Controller, req.ParamsURL]);

  case method of
    rmPOST:
      Result.SetResp(
        netClient.Post(urlRequest,
          TStringStream.Create(req.BodyString, TEncoding.UTF8),
          nil,
          [TNameValuePair.Create('Content-Type', 'application/json;charset=UTF-8')]));
    rmPUT:
      Result.SetResp(netClient.Put(urlRequest, NewStringList(req.BodyString)));
    rmGET:
      Result.SetResp(netClient.Get(urlRequest));
    rmDELETE:
      Result.SetResp(netClient.Delete(urlRequest));
    else
      raise Exception.Create('Metodo não implementado ou indefinido')
  end;

//  if not Result.isSuccess then
//  begin
//    LogApp.Error(StrDefault(ErroApi.Detail, ERRO_DEFAULT));
//    if not doNotRaiseError then
//      raise Exception.Create(StrDefault(ErroApi.Detail, ERRO_DEFAULT));
//  end;
end;

constructor TBaseApiRenave.Create;
begin

  FCertificateId := '';
  FraiseError := True;
  DevelopmentMode := IniConf.ReadStr('MD', 'MODODEVAPIS', 'N') = 'S';

  netClient := TNetHTTPClient.Create(nil);
  netClient.OnNeedClientCertificate := NeedCertificate;
  netClient.OnRequestCompleted := RequestCompleted;

//  netRequest := TNetHTTPRequest.Create(nil);
//  netRequest.Client := netClient;
//  netRequest.cusaaddh

end;

destructor TBaseApiRenave.Destroy;
begin
  netClient.Free;
//  if Assigned(FErroApi) then
//    FreeAndNil(FErroApi);
  inherited;
end;

function TBaseApiRenave.Get(req: TReq): TResponseBase;
begin
  Result := Call(req, rmGET);
end;

function TBaseApiRenave.GetT<T>(req: TReq): TResp<T>;
begin
  Result := TResp< T >.Create;
  with Call(req, rmGET) do
  begin
    Result.code := code;
    Result.data := data;
  end;
end;

procedure TBaseApiRenave.NeedCertificate(const Sender: TObject;
  const ARequest: TURLRequest; const ACertificateList: TCertificateList;
  var AnIndex: Integer);
begin

  if (not DevelopmentMode) and (CertificateId = '') then
    raise Exception.Create('CertificateId empty')
  else if DevelopmentMode then
    Exit;

  for var I := 0 to ACertificateList.Count - 1 do
  begin

    if ACertificateList[I].SerialNum = CertificateId then
    begin
      AnIndex := I;
      Break;
    end;
  end;

end;

function TBaseApiRenave.Post(req: TReq): TResponseBase;
begin
  Result := Call(req, rmPOST);
end;

procedure TBaseApiRenave.RequestCompleted(const Sender: TObject;
  const AResponse: IHTTPResponse);
var
   e401: TResponse401;
   err: TResponseError;
   json: string;
begin
  FLastErrorApi := '';
  try

    try

      json := AResponse.ContentAsString().Trim;

      case AResponse.StatusCode of
        200 .. 299: ;
        400, 401, 404, 415, 422:
          begin
            if (not json.IsEmpty) then
            begin

              try
                err := TJson.JsonToObject< TResponseError >(json);
              except
              end;

              if Assigned(err) and ((not err.mensagemParaUsuarioFinal.IsEmpty) or (not err.detalhe.IsEmpty)) then
                err.RaiseError
              else
              begin
                try
                  e401 := TJson.JsonToObject< TResponse401 >(json);
                except
                end;

                if Assigned(e401) and (not e401.message.IsEmpty) then
                  e401.RaiseError;

                raise Exception.Create('Erro não catalogado !');
              end;

              raise Exception.Create('Erro não catalogado !');
            end;

          end;

        {
        400, 401, 415:
          begin

            if (not AResponse.ContentAsString().IsEmpty) then
            begin

              try
                e401 := TJson.JsonToObject< TResponse401 >(json);
              except
              end;

              if Assigned(e401) and (not e401.message.IsEmpty) then
                e401.RaiseError;

              raise Exception.Create('Erro não catalogado !');
            end;

          end;

        404, 422:
          begin

            if (not AResponse.ContentAsString().IsEmpty) then
            begin

              try
                err := TJson.JsonToObject< TResponseError >(json);
              except
              end;

              if Assigned(err) and (not err.mensagemParaUsuarioFinal.IsEmpty) then
                err.RaiseError;

              raise Exception.Create('Erro não catalogado !');
            end;

          end;
          }

        403:
          raise Exception.Create('Proibido');

        else
          raise Exception.Create('Erro não catalogado');
      end;

    except on E: Exception do
      begin
        FLastErrorApi := e.Message;
        LogApp.Error('Code: %d - %s | %s', [AResponse.StatusCode, e.Message, json]);
        if raiseError then
          raise Exception.Create(E.Message);
      end;
    end;
  finally
    FraiseError := True;
  end;
end;

procedure TBaseApiRenave.Reset;
begin
  netClient.Free;
  netClient := TNetHTTPClient.Create(nil);
  netClient.OnNeedClientCertificate := NeedCertificate;
  netClient.OnRequestCompleted := RequestCompleted;
end;

{ TResponseBase }

function TResponseBase.GetIsSuccess: Boolean;
begin
  Result := (code >= 200) and (code <= 299);
end;

procedure TResponseBase.SetResp(response: IHTTPResponse);
begin
  Self.code := response.StatusCode;
  Self.data := response.ContentAsString();
end;

{ TResponse401 }

procedure TResponse401.RaiseError;
begin
  raise Exception.Create(
    Format('Code: %d - Error: %s - Message: %s - Path: %s', [Self.status, Self.error, Self.message, Self.path]));
end;

{ TResponseError }

procedure TResponseError.RaiseError;
begin
  raise Exception.Create(
    Format('Detalhe: %s - Titulo: %s - Message: %s - logIdRastreabilidade: %s',
           [Self.detalhe, Self.titulo, Self.mensagemParaUsuarioFinal, Self.logIdRastreabilidade]));
end;

end.
