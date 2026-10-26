unit Nummus.Client;

interface

uses
  System.Classes,
  System.Generics.Collections,
  System.Net.HttpClientComponent,
  System.Net.HttpClient,
  BaseSingleton;

type
  THttpMethod = (httpUnknow, httpGET, httpPOST, httpDELETE, httpPUT);

  TQueryPair = TPair<string,string>;

  QueryParameters = TArray<TQueryPair>;

  TArrayString  = TArray<string>;

  RequestInput = record
  private
    Frecurso: string;
    Fquery: QueryParameters;
    FPath: TArrayString;
    Fmethod: THttpMethod;
    //FJsonBody: string;
    FContentType: string;
    FAcceptEncoding: string;
    FPrivatePath: Boolean;
    FUrlBase: string;
    FRawBody: string;
//    function GetRawBody: string;
//    procedure SetRawBody(const Value: string);
  public
    property method: THttpMethod read Fmethod write Fmethod;
    property recurso: string read Frecurso write Frecurso;
    property UrlBase: string read FUrlBase write FUrlBase;
    property Path: TArrayString read FPath write FPath;
    property query: QueryParameters read Fquery write Fquery;
//    property JsonBody: string read GetRawBody write SetRawBody;
    property RawBody: string read FRawBody write FRawBody;
//    property ContentAsStream: TStream read GetContentAsStream;
    property ContentType: string read FContentType write FContentType;
    property AcceptEncoding: string read FAcceptEncoding write FAcceptEncoding;

  public
    function GetContentAsStream: TStream;
    function AddQuery(const Pair: TQueryPair): RequestInput; overload;
    function AddQuery(const Key, Value: string): RequestInput; overload;
    function AddQuery(const Key: string; const Value: Integer): RequestInput; overload;
    function AddBody(const Value: string): RequestInput; overload;
  public
    class function New(const recurso: string; const AMethod: THttpMethod = httpUnknow): RequestInput; overload; static;
    class function New(const recurso: string; const Paths: TArrayString; const AMethod: THttpMethod = httpUnknow): RequestInput; overload; static;
  end;

  NummusClient = class
  private
    FApiKey: string;
    FClientId: string;
  protected
    FLastError: string;
    FLastUri: string;

    procedure HandleResponseError(AResponse: IHTTPResponse); virtual;
    function GetNetHTTPClientAuth: TNetHTTPClient; virtual;
  public
    constructor Create(); virtual;

    function RawExecute(input: RequestInput): IHTTPResponse; virtual;

    property ApiKey: string read FApiKey write FApiKey;
    property ClientId: string read FClientId write FClientId;
    property LastError: string read FLastError write FLastError;
    property LastUri: string read FLastUri write FLastUri;
  end;

  NummusClientSingleton = TSingleton<NummusClient>;

implementation

uses
  System.SysUtils,
  System.StrUtils;

type
  TQueryPairHelper = record helper for TQueryPair
  end;

  QueryParameterHelper = record helper for QueryParameters
  public
    function Add(const Pair: TQueryPair): QueryParameters; overload;
    function Add(const Key, Value: string): QueryParameters; overload;
    function Add(const Key: string; const Value: Integer): QueryParameters; overload;
    function ToString(): string;
  end;

  UriBuilder = class
  strict private
    baseURI: string;
    queryCount: SmallInt;
  public
    function AddBase(const uriBase: string): UriBuilder;
    function AddPath(const path: string): UriBuilder;
//    function AddQuery(const name, value: string): UriBuilder; overload;
//    function AddQuery(const name: string; value: Integer): UriBuilder; overload;
//    function AddQuery(const name: string; value: TDateTime; const format: string): UriBuilder; overload;
    function AddQuery(query: TArray<TQueryPair>): UriBuilder;
//    function Result(const path: string = ''): string; overload;
    function Result(const input: RequestInput): string; overload;
    function Result(const path: string = ''): string; overload;
  end;


{ UriBuilder }

function UriBuilder.AddBase(const uriBase: string): UriBuilder;
begin
  queryCount := 0;
  baseURI := IfThen(uriBase.Trim().EndsWith('\') or uriBase.Trim().EndsWith('/') , uriBase.Trim().Substring(0, uriBase.Trim().Length - 1) , uriBase.Trim());
  Result := Self;
end;

function UriBuilder.AddPath(const path: string): UriBuilder;
begin
  if path.IsEmpty then
    Exit(Self);

  baseURI := Format('%s/%s', [baseURI, path.Trim(['\', '/'])]);
  Result := Self;
end;

function UriBuilder.AddQuery(query: TArray<TQueryPair>): UriBuilder;
begin
  Result := Self;

  if Length(query) = 0 then
    Exit;

  baseURI := Format('%s%s%s', [baseURI, IfThen(queryCount = 0, '?','&'), query.ToString()]);

  Inc(queryCount, Length(query));
end;

function UriBuilder.Result(const path: string): string;
begin
  if not string.IsNullOrWhiteSpace(path) then
    AddPath(path);

  Result := baseURI;
end;

function UriBuilder.Result(const input: RequestInput): string;
begin
  if not input.UrlBase.IsEmpty then
    Self.AddBase(input.UrlBase);

  if not input.recurso.IsEmpty then
    Self.AddPath(input.recurso);

  for var sPath in input.Path do
    Self.AddPath(sPath);

  Result := Self.AddQuery(input.query).Result();
end;

{ QueryParameterHelper }

function QueryParameterHelper.Add(const Pair: TQueryPair): QueryParameters;
begin
  Self := Self + [ Pair ];

  Result := Self;
end;

function QueryParameterHelper.Add(const Key, Value: string): QueryParameters;
begin
  Self.Add(TQueryPair.Create(Key, Value));

  Result := Self;
end;

function QueryParameterHelper.Add(const Key: string; const Value: Integer): QueryParameters;
begin
  Self.Add( TQueryPair.Create(Key, Value.ToString()) );

  Result := Self;
end;

function QueryParameterHelper.ToString: string;
var
  values: TArrayString;
begin
  SetLength( values, 0);

  for var qr in Self do
    values := values + [ Format('%s=%s', [qr.Key, qr.Value]) ];

  Result := String.Join('&', values);
end;

{ NummusClient }

constructor NummusClient.Create;
begin

end;

function NummusClient.GetNetHTTPClientAuth: TNetHTTPClient;
begin
  Result := TNetHTTPClient.Create(nil);
//  Result.SecureProtocols := [THTTPSecureProtocol.SSL2, THTTPSecureProtocol.SSL3, THTTPSecureProtocol.TLS1, THTTPSecureProtocol.TLS11, THTTPSecureProtocol.TLS12];
  Result.CustomHeaders['Accept'] := 'application/json';
  Result.CustomHeaders['Content-Type'] := 'application/json';
  Result.CustomHeaders['x-api-key'] := ApiKey;
  Result.CustomHeaders['x-client-id'] := ClientId;
end;

procedure NummusClient.HandleResponseError(AResponse: IHTTPResponse);
begin
  FLastError := '';

  if AResponse.StatusCode = 400 then
    FLastError := '400 - Bad request'

  else if AResponse.StatusCode = 401 then
    FLastError := '401 - Não autorizado'

  else if AResponse.StatusCode = 403 then
    FLastError := '403 - Proibido'


  else if AResponse.StatusCode = 415 then
    FLastError := '415 - Tipo de mídia não suportada';
end;

function NummusClient.RawExecute(input: RequestInput): IHTTPResponse;
var
 netClient: TNetHTTPClient;
 uri: UriBuilder;
 Content: TStream;
begin
  FLastError := '';
  FLastUri   := '';

  netClient := GetNetHTTPClientAuth();
  Content := nil;
  uri := UriBuilder.Create();
  try

    FLastUri := uri.Result(input);

    try
      case input.method of
        httpUnknow:
          raise Exception.Create('Input Method = httpUnknow');

        httpGET:
          Result := netClient.Get(FLastUri);

        httpPOST:
          begin

            netClient.ContentType    := IfThen(not input.ContentType.IsEmpty(), input.ContentType, 'application/json');
            netClient.AcceptEncoding := IfThen(not input.AcceptEncoding.IsEmpty, input.AcceptEncoding, 'UTF-8');

            Result := netClient.Post( FLastUri, input.GetContentAsStream );
          end;

        httpPUT:
          begin

            netClient.ContentType    := IfThen(not input.ContentType.IsEmpty(), input.ContentType, 'application/json');
            netClient.AcceptEncoding := IfThen(not input.AcceptEncoding.IsEmpty, input.AcceptEncoding, 'UTF-8');

            Result := netClient.Put( FLastUri, input.GetContentAsStream );
          end;

        httpDELETE:
          Result := netClient.Delete(FLastUri);

        else
          raise Exception.Create('Input Method = %s not implemented');

      end;

      if Result.StatusCode >= 400 then
        HandleResponseError(Result);

    except on E: Exception do
      begin
        //if Result = nil then
          //Result := THTTPResponseInternalError.Create(999);

        LastError := E.Message;
      end;
    end;

  finally
    uri.Free;
    netClient.Free;
    if Assigned(Content) then
       FreeAndNil(Content);
  end;
end;

{ RequestInput }

function RequestInput.AddBody(const Value: string): RequestInput;
begin
  Self.RawBody := Value;

  Result := Self;
end;

function RequestInput.AddQuery(const Key: string; const Value: Integer): RequestInput;
begin
  Self.query.Add(Key, Value);

  Result := Self;
end;

function RequestInput.AddQuery(const Key, Value: string): RequestInput;
begin
  Self.query.Add(Key, Value);

  Result := Self;
end;

function RequestInput.AddQuery(const Pair: TQueryPair): RequestInput;
begin
  Self.query.Add(Pair);

  Result := Self;
end;

function RequestInput.GetContentAsStream: TStream;
begin
  Result := TStringStream.Create(FRawBody, TEncoding.UTF8);
end;

class function RequestInput.New(const recurso: string; const Paths: TArrayString;
  const AMethod: THttpMethod): RequestInput;
begin
  Result.recurso := recurso;
  Result.Path := Paths;
  Result.query := [];
  Result.method := AMethod;
end;

class function RequestInput.New(const recurso: string; const AMethod: THttpMethod): RequestInput;
begin
  Result := RequestInput.New(recurso, [], AMethod);
end;

initialization

finalization
  NummusClientSingleton.ReleaseInstance;

end.
