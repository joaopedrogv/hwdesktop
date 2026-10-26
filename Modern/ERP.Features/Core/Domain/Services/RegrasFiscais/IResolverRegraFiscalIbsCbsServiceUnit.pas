unit IResolverRegraFiscalIbsCbsServiceUnit;

interface

uses
  ResolverRegraFiscalIbsCbsTypesUnit,
  RegraFiscalIbsCbsEtdUnit;

type
  IResolverRegraFiscalIbsCbsService = interface
    ['{C0EE22C1-C572-4553-80AE-AECDC4BE5518}']
    function Executar(const Input: ResolverRegraFiscalIbsCbsInput): RegraFiscalIbsCbsEtd;
  end;

implementation

end.
