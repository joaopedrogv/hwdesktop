unit IBaseCalculoUnificadaServiceUnit;

interface

uses
  IntegerNullableUnit,
  BaseCalculoNaturezaEnumUnit,
  ComponentesBaseCalculoInputUnit,
  BaseCalculoUnificadaOutputUnit;

type
  IBaseCalculoUnificadaService = interface
    ['{6C0F3B7E-2D4A-4E63-9A1B-5F8C7D2E4A90}']
    function Calcular(const AComponentes: ComponentesBaseCalculoInput; AAno: Integer;
      ANatureza: BaseCalculoNatureza;
      const ATipoDocumento: IntegerNullable): BaseCalculoUnificadaOutput;
    function CalcularExato(const AComponentes: ComponentesBaseCalculoInput;
      AAno: Integer; ANatureza: BaseCalculoNatureza;
      const ATipoDocumento: IntegerNullable): BaseCalculoUnificadaOutput;
  end;

implementation

end.
