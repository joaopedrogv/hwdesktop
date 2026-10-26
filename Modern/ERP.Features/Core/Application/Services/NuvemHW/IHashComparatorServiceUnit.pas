unit IHashComparatorServiceUnit;

interface

uses
  System.Generics.Collections,
  ArquivoDownloadModel, ManifestFilesModelUnit;

type
  IHashComparatorService = interface
    ['{1AB22283-2FF8-4BF5-86B7-711839DC6622}']
    function ObterAlterados(
      const ManifestoRemoto: ManifestModel; const LocalHashes: TArray<string>
    ): TArray<ArquivoDownload>;

    function ObterNovos(
      const ManifestoRemoto: ManifestModel; const LocalHashes: TArray<string>
    ): TArray<ArquivoDownload>;

    function ObterHashesAusentes(
      const ManifestoRemoto: ManifestModel; const LocalHashes: TArray<string>
    ): TArray<string>;
  end;

implementation

end.
