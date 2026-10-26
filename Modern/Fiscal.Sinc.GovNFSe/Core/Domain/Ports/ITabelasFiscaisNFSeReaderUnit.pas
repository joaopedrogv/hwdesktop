unit ITabelasFiscaisNFSeReaderUnit;

interface

uses
  CodigoTributacaoNacionalNFSeEtdUnit,
  CodigoIndicadorOperacaoNFSeEtdUnit,
  CorrelacaoFiscalNFSeEtdUnit;

type
  ITabelasFiscaisNFSeReader = interface
    ['{4B6C8464-C7A0-4938-AF22-8D56D36905BF}']
    function ObterCodigosTributacaoNacional(const FileName: string): CodigoTributacaoNacionalNFSeEtdList;
    function ObterCodigosIndicadorOperacao(const FileName: string): CodigoIndicadorOperacaoNFSeEtdList;
    function ObterCorrelacoesFiscais(const FileName: string): CorrelacaoFiscalNFSeEtdList;
  end;

implementation

end.
