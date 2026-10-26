unit ITabelasFiscaisNFSeWriterUnit;

interface

uses
  CodigoTributacaoNacionalNFSeEtdUnit,
  CodigoIndicadorOperacaoNFSeEtdUnit,
  CorrelacaoFiscalNFSeEtdUnit;

type
  ITabelasFiscaisNFSeWriter = interface
    ['{D9CD36B5-C5E3-486F-AAC9-B220635FEDD3}']
    procedure ExcluirCodigosTributacaoNacionalNFSe();
    procedure ExcluirCodigosIndicadorOperacaoNFSe();
    procedure ExcluirCorrelacaoFiscalNFSe();
    procedure SalvarCodigosTributacaoNacionalNFSe(const Dados: CodigoTributacaoNacionalNFSeEtdList);
    procedure SalvarCodigosIndicadorOperacaoNFSe(const Dados: CodigoIndicadorOperacaoNFSeEtdList);
    procedure SalvarCorrelacaoFiscalNFSe(const Dados: CorrelacaoFiscalNFSeEtdList);
  end;

implementation

end.
