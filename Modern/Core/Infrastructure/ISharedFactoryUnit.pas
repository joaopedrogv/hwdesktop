unit ISharedFactoryUnit;

interface

uses
  IServiceFactoryUnit,
  ICalculadorROCServiceUnit,
  ICalculadorBaseCalculoServiceUnit;

type
  ISharedFactory = interface(IServiceFactory)
    ['{5D0FFB06-E645-437F-8472-64F4978565B1}']
    function CreateCalculadorROCService(): ICalculadorROCService;
    function CreateCalculadorBaseCalculoService(): ICalculadorBaseCalculoService;
  end;

implementation

end.
