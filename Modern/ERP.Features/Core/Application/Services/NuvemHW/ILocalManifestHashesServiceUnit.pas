unit ILocalManifestHashesServiceUnit;

interface

uses
  SysUtils, Classes;

type
  ILocalManifestHashesService = interface
    ['{E6F7868B-BCD6-4F5B-A2C8-9BC06C7FC686}']
    function ObterLocalHashes(const ConfigId: string): TArray<string>;
    procedure SalvarHashes(const ConfigId: string; Hashes: TArray<string>);
  end;

implementation

end.
