unit IRatearRetencoesNFSeOSServiceUnit;

interface

uses
  NFSeEtdUnit, NFSeOSEtdUnit;

type
  IRatearRetencoesNFSeOSService = interface
    ['{CAF52603-2502-436F-B87A-8B9AB3E3B6AD}']
    procedure Executar(const NFSe: NFSeEtd; NFOsList: NFSeOSEtdList; out HouveRateio: Boolean);
  end;

implementation

end.
