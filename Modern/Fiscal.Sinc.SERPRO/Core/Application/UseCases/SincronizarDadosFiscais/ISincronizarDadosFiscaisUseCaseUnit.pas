unit ISincronizarDadosFiscaisUseCaseUnit;

interface

uses
  ArquivoDownloadModel;

type
  ArquivosDownloadInput = TArray<ArquivoDownload>;

  ISincronizarDadosFiscaisUseCase = interface
    ['{ED70DBDE-94A5-481E-9FE0-E7CC07C3B32C}']
    procedure Executar(const Input: ArquivosDownloadInput);
  end;

implementation

end.
