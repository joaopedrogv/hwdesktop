unit ObterArquivosFiscaisModificadosUseCaseUnit;

interface

uses
  System.Generics.Collections,
  IConfiguracoesRepositoryUnit, ArquivoDownloadModel;

type
  TArquivosDownload = TArray<ArquivoDownload>;

  IObterArquivosFiscaisModificadosUseCase = interface
    ['{14E8364C-E2AC-43E1-8CC3-649DCA06B3E9}']
    function Executar(): TArquivosDownload;
  end;

  ObterArquivosFiscaisModificadosUseCase = class(TInterfacedObject, IObterArquivosFiscaisModificadosUseCase)
  private
    FConfigRepo: IConfiguracoesRepository;
  public
    constructor Create(ConfigRepo: IConfiguracoesRepository);

    function Executar(): TArquivosDownload;
  end;

implementation

uses
  SysUtils, Classes,
  REST.Json,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  ConfiguracaoEtdUnit, ManifestFilesModelUnit;

{ ObterArquivosFiscaisModificadosUseCase }

constructor ObterArquivosFiscaisModificadosUseCase.Create(ConfigRepo: IConfiguracoesRepository);
begin
  FConfigRepo := ConfigRepo;
end;

function ObterArquivosFiscaisModificadosUseCase.Executar: TArquivosDownload;
const
  URL_MANIFEST = 'https://raw.githubusercontent.com/hwsistemas-team/fiscal-dist/main/manifest.json';
var
  config: ConfiguracaoEtd;
  netClient: TNetHTTPClient;
  response: IHTTPResponse;
  respContent: TStringStream;
  hashes: TStrings;
  sJson: string;
  manifest: ManifestModel;
  arquivo: ArquivoDownload;
  I: Integer;
begin
  Result := [];

  config := FConfigRepo.GetByKey('fiscal_dist_manifest', 0);
  hashes := TStringList.Create();
  netClient := TNetHTTPClient.Create(nil);
  respContent := TStringStream.Create();
  try
    if (config <> nil) and (config.ValorStrings <> nil) then
      hashes.AddStrings(config.ValorStrings);

    netClient.SecureProtocols := [THTTPSecureProtocol.TLS12];

    response := netClient.Get(URL_MANIFEST, respContent);

    if response.StatusCode = 200 then
    begin
      sJson := respContent.DataString;

      if String.IsNullOrWhiteSpace( sJson ) then
        Exit();

      manifest := TJson.JsonToObject<ManifestModel>( response.ContentAsString(TEncoding.UTF8), [joDateFormatISO8601] );
      if manifest = nil then
        Exit;

      for I := Low(manifest.files) to High(manifest.files) do
      begin
        arquivo := ArquivoDownload.Create( manifest.files[I].path, manifest.files[I].url, manifest.files[I].hash );

        if hashes.Values[manifest.files[I].path] <> manifest.files[I].hash then
          Result := Result + [ arquivo ];
      end;
    end;

  finally
    config.Free();
    netClient.Free();
    respContent.Free();
    hashes.Free();
    manifest.Free();
  end;
end;

end.
