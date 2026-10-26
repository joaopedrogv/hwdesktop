unit ICalculoBaseCalculoServiceUnit;

interface

uses
  CalcularBaseCalculoModelUnit;

type
  ICalculoBaseCalculoService = interface
    ['{E5838555-9A63-454C-9A4C-A1FC6F371621}']
    function CalculaIS(const Input: BaseCalculoISMercadoriasModel): Currency;
    function CalculaIbsCbs(const Input: BaseCalculoIbsCbsModel): Currency;
  end;

implementation

end.
