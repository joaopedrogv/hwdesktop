unit IManifestSincServiceUnit;

interface

uses
  System.Generics.Collections,
  ManifestFilesModelUnit;

type
  IManifestSincService = interface
    ['{DFD86DDE-37DE-44AB-A9E3-44B546E73106}']
    function ObterManifesto(const Url, ContextFilterPath: string): ManifestModel;
  end;

implementation

end.
