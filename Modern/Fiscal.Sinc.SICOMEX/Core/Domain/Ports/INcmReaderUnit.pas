unit INcmReaderUnit;

interface

uses
  NcmEtdUnit, ArquivosSICOMEXInputUnit;

type
  INcmReader = interface
    ['{AC807196-00B9-4355-ADB1-8620FC70D59D}']
    //procedure Setup(const ConnectionString: string);
    function ObterNCMs(const Arquivos: ArquivosSICOMEXInput): NcmsEtd;
  end;

implementation

end.
