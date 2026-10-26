// Delphi Rio
unit NetHttpJsonClientUnit;

interface

uses
  SysUtils, Classes,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  IHttpJsonClientUnit;

type
  NetHttpJsonClient = class(TInterfacedObject, IHttpJsonClient)
  private
    FHttpClient: TNetHTTPClient;
    procedure Configurar;
    procedure ValidarHttps(const AUrl: string);
  public
    constructor Create;
    destructor Destroy; override;

    function Get(const AUrl, ABearerToken: string): THttpJsonResult;
  end;

implementation

const
  TIMEOUT_MS = 30000;

{ NetHttpJsonClient }

constructor NetHttpJsonClient.Create;
begin
  inherited Create;
  FHttpClient := TNetHTTPClient.Create(nil);
  Configurar;
end;

destructor NetHttpJsonClient.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

procedure NetHttpJsonClient.Configurar;
begin
  FHttpClient.SecureProtocols := [THTTPSecureProtocol.TLS12];
  FHttpClient.ConnectionTimeout := TIMEOUT_MS;
  FHttpClient.ResponseTimeout := TIMEOUT_MS;
end;

procedure NetHttpJsonClient.ValidarHttps(const AUrl: string);
begin
  // Somente https e aceito; a conversao http -> https pertence ao reader da API.
  if not AUrl.Trim.ToLower.StartsWith('https://') then
    raise Exception.Create('URL insegura: apenas "https://" e aceito para a API da calculadora.');
end;

function NetHttpJsonClient.Get(const AUrl, ABearerToken: string): THttpJsonResult;
var
  Response: IHTTPResponse;
  Stream: TStringStream;
begin
  Result.Success := False;
  Result.StatusCode := 0;
  Result.Content := '';
  Result.ErrorMessage := '';

  try
    ValidarHttps(AUrl);

    FHttpClient.CustomHeaders['Accept'] := 'application/json';
    FHttpClient.CustomHeaders['Authorization'] := 'Bearer ' + ABearerToken;

    Stream := TStringStream.Create('', TEncoding.UTF8);
    try
      Response := FHttpClient.Get(AUrl, Stream);

      Result.StatusCode := Response.StatusCode;
      Result.Success := Response.StatusCode = 200;
      Result.Content := Response.ContentAsString(TEncoding.UTF8);

      if Result.Content = '' then
        Result.Content := Stream.DataString;
    finally
      Stream.Free;
    end;
  except
    on E: Exception do
    begin
      Result.Success := False;
      Result.ErrorMessage := E.Message;
    end;
  end;
end;

end.
