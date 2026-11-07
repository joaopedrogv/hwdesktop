unit IDatabaseReaderUnit;

interface

uses
  DB, SysUtils;

type
  // Porta de leitura sob demanda. Nao conhece Next, tela, SQL concreto,
  // parametros, driver, conexao ou Setup.
  IDatabaseReader = interface
    ['{B7A4C1D2-3E5F-4A6B-8C9D-0E1F2A3B4C5D}']
    procedure Pesquisar;
    procedure Limpar;
    function DataSet: TDataSet;
  end;

  // Comportamento explicito dos adaptadores que nao implementam leitura.
  EDatabaseReaderUnavailable = class(Exception);

implementation

end.
