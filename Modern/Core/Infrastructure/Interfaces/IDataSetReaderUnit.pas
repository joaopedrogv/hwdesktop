unit IDataSetReaderUnit;

interface

uses
  DB, SysUtils, ParameterValueUnit;

type
  // Porta de leitura sob demanda. Nao conhece Next, tela, SQL concreto,
  // parametros, driver, conexao ou Setup.
  IDataSetReader = interface
    ['{B7A4C1D2-3E5F-4A6B-8C9D-0E1F2A3B4C5D}']
    procedure Pesquisar;
    procedure Limpar;
    function DataSet: TDataSet;
  end;

  // Fabrica de leitores sob demanda. Recebe o SQL e os parametros ja montados
  // pela definicao da consulta; nao conhece tela, sessao, driver nem Setup.
  ISqlDataSetReaderFactory = interface
    ['{3C9A5F27-8B14-4D6E-A1C0-5E2F7B93D4A8}']
    function CreateReader(const SQL: string;
      const Params: ParametersValues): IDataSetReader;
  end;

  // Comportamento explicito dos adaptadores que nao implementam leitura.
  EDataSetReaderUnavailable = class(Exception);

implementation

end.
