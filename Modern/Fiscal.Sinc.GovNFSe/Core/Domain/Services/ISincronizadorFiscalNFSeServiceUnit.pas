unit ISincronizadorFiscalNFSeServiceUnit;

interface

type
  ArquivoFiscalNFSeEnum = (fecTribNac, fcIndOp, fcCorrelacao);

  ISincronizadorFiscalNFSeService = interface
    ['{1A5A4CE7-217B-462A-A91D-383F80635A4F}']
    function Executar(const FileName: string): Boolean;
  end;

const
  ArquivoFiscalNFSeEnumName: array[ArquivoFiscalNFSeEnum] of string = (
    'nfs-ctribnac.csv', 'nfs-cindop.csv', 'nfs-correlfiscal.csv'
  );

implementation

end.
