unit ISincronizadorNCMsSICOMEXServiceUnit;

interface

uses
  IProgressObserverUnit,
  ArquivosSICOMEXInputUnit;

type
  ArquivoSicomexEnum = (siHistorico, siFuturo, siVigente);

  ISincronizadorNCMsSICOMEXService = interface
    ['{D4F8EFC8-ACCD-4A14-9425-EAE21A3ED537}']
    function Executar(const Input: ArquivosSICOMEXInput): Boolean;
  end;

const
  ArquivoSicomexEnumName: array[ArquivoSicomexEnum] of string = (
    'ncm-historica.json', 'ncm-futura.json', 'ncm-vigentes.json'
  );

implementation

end.
