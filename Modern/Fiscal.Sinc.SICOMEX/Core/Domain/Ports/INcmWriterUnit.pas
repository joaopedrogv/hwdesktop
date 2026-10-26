unit INcmWriterUnit;

interface

uses
  NcmEtdUnit;

type
  INcmWriter = interface
    ['{D4BA46C8-D1D1-4DCE-A85E-C5701ECC21EC}']
    procedure ExcluirNCMs();
    procedure SalvarNCMs(const Dados: NcmsEtd);
  end;

implementation

end.
