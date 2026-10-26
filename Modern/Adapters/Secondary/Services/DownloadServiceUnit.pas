unit DownloadServiceUnit;

interface

uses
  SysUtils, Classes,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  IDownloadServiceUnit;

type
  DownloadService = class(TInterfacedObject, IDownloadService)
  strict private
    function DownloadHTTP(const URL: string; const DestPath: string): TDownloadResult;
    function DownloadToMemoryHTTP(const URL: string): TBytes;
    function DownloadDisk(const URL: string; const DestPath: string): TDownloadResult;
    function DownloadToMemoryDisk(const URL: string): TBytes;
  private
    FHttpClient: TNetHTTPClient;
    procedure ConfigureHTTP;
  public
    constructor Create;
    destructor Destroy; override;

    function DownloadFile(const URL: string; const DestPath: string): TDownloadResult;
    function DownloadFileToMemory(const URL: string): TBytes;
    function GetFileSize(const URL: string): Int64;
  end;

implementation

uses
  System.IOUtils;

constructor DownloadService.Create;
begin
  inherited Create;
  FHttpClient := TNetHTTPClient.Create(nil);
  ConfigureHTTP;
end;

destructor DownloadService.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

procedure DownloadService.ConfigureHTTP;
begin
//  FHttpClient.Request.UserAgent := 'ERP Fiscal Sync/1.0';
//  FHttpClient.Request.ContentType := 'application/octet-stream';
//  FHttpClient.ConnectTimeout := 30000; // 30 segundos
//  FHttpClient.ReadTimeout := 60000;    // 60 segundos

  // Configurar SSL se necessário
  // FHTTP.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(FHTTP);
  FHttpClient.SecureProtocols := [ THTTPSecureProtocol.TLS12 ];
end;

function DownloadService.DownloadDisk(const URL, DestPath: string): TDownloadResult;
var
  S, D: TFileStream;
begin
  Result.Success := False;
  Result.FilePath := DestPath;

  if not URL.ToLower().StartsWith('file://') then
  begin
    Result.ErrorMessage := 'URL não inicia como o esperador "file://"';
    Exit;
  end;

  try
    S := TFileStream.Create(URL.Substring(7), fmOpenRead or fmShareDenyWrite);
    D := TFileStream.Create(DestPath, fmCreate);
    try
      D.CopyFrom(S, S.Size);

      Result.FileSize := D.Size;
      Result.Success := True;
    finally
      D.Free;
      S.Free;
    end;
  except
    on E: Exception do
    begin
      Result.ErrorMessage := E.Message;
      if FileExists(DestPath) then
        DeleteFile(DestPath);
    end;
  end;
end;

function DownloadService.DownloadFile(const URL: string; const DestPath: string): TDownloadResult;
begin
  if URL.ToLower().StartsWith('file://') then
    Result := DownloadDisk(URL, DestPath)
  else
    Result := DownloadHTTP(URL, DestPath);
end;

function DownloadService.DownloadFileToMemory(const URL: string): TBytes;
begin
  if URL.ToLower().StartsWith('file://') then
    Result := DownloadToMemoryDisk( URL )
  else
    Result := DownloadToMemoryHTTP( URL );
end;

function DownloadService.DownloadHTTP(const URL, DestPath: string): TDownloadResult;
var
  Stream: TFileStream;
begin
  Result.Success := False;
  Result.FilePath := DestPath;

  try
    Stream := TFileStream.Create(DestPath, fmCreate);
    try
      FHttpClient.Get(URL, Stream);
      Result.FileSize := Stream.Size;
      Result.Success := True;
    finally
      Stream.Free;
    end;
  except
    on E: Exception do
    begin
      Result.ErrorMessage := E.Message;
      if FileExists(DestPath) then
        DeleteFile(DestPath);
    end;
  end;
end;

function DownloadService.DownloadToMemoryDisk(const URL: string): TBytes;
var
  Stream: TFileStream;
begin
  if not URL.ToLower().StartsWith('file://') then
    raise Exception.Create('URL não inicia como o esperador "file://"');

  try
    Stream := TFileStream.Create(URL.Substring(7), fmOpenRead or fmShareDenyWrite);
    SetLength(Result, Stream.Size);
    Stream.Position := 0;
    Stream.ReadBuffer(Result[0], Stream.Size);
  finally
    Stream.Free();
  end;
end;

function DownloadService.DownloadToMemoryHTTP(const URL: string): TBytes;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    FHttpClient.Get(URL, Stream);
    SetLength(Result, Stream.Size);
    Stream.Position := 0;
    Stream.ReadBuffer(Result[0], Stream.Size);
  finally
    Stream.Free;
  end;
end;

function DownloadService.GetFileSize(const URL: string): Int64;
var
  Response : IHTTPResponse;
begin
  try
    Response := FHttpClient.Head(URL);
    Result := Response.ContentLength;
  except
    Result := -1;
  end;
end;

end.
