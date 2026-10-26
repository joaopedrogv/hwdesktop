unit ManifestSincServiceUnit;

interface

uses
  System.Generics.Collections,
  IManifestSincServiceUnit, ManifestFilesModelUnit;

type
  ManifestSincService = class(TInterfacedObject, IManifestSincService)
  private
    procedure ResolverFilterManifest(var Manifest: ManifestModel; const ContextFilterPath: string);
  public
    function ObterManifesto(const Url, ContextFilterPath: string): ManifestModel;
  end;

implementation

uses
  SysUtils, Classes,
  REST.Json,
  System.Net.HttpClient,
  System.Net.HttpClientComponent;

{ ManifestSincService }

function ManifestSincService.ObterManifesto(const Url, ContextFilterPath: string): ManifestModel;
var
  netClient: TNetHTTPClient;
  response: IHTTPResponse;
  respContent: TStringStream;
  hashes: TStrings;
  sJson: string;
  I: Integer;
begin
  Result := nil;
  netClient := TNetHTTPClient.Create(nil);
  respContent := TStringStream.Create();
  try
    netClient.SecureProtocols := [THTTPSecureProtocol.TLS12];

    response := netClient.Get(Url, respContent);

    if response.StatusCode = 200 then
    begin
      sJson := respContent.DataString;

      if String.IsNullOrWhiteSpace( sJson ) then
        Exit();

      Result := TJson.JsonToObject<ManifestModel>( response.ContentAsString(TEncoding.UTF8), [joDateFormatISO8601] );

      ResolverFilterManifest(Result, ContextFilterPath);
    end;

  finally
    netClient.Free();
    respContent.Free();
  end;
end;

procedure ManifestSincService.ResolverFilterManifest(var Manifest: ManifestModel; const ContextFilterPath: string);
var
  filterFiles: TArray<ManifestFileModel>;
  fileManifest: ManifestFileModel;
  count: Integer;
begin
  if ContextFilterPath.Trim().IsEmpty() then
    Exit;

  SetLength(filterFiles, Length(Manifest.files));
  count := 0;

  for fileManifest in Manifest.files do
  begin
    if fileManifest.url.Contains(ContextFilterPath) then
    begin
      filterFiles[count] := fileManifest.Clone();
      Inc(count);
    end;

    fileManifest.Free();
  end;

  SetLength(filterFiles, count);

  Manifest.files := filterFiles;
end;

end.
