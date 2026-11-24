unit IDataSetSorterUnit;

interface

uses
  DB;

type
  // Especificacao neutra de ordenacao aceita pelo conjunto carregado. A
  // prioridade segue a ordem do array; o adaptador do driver traduz cada item
  // para a ordenacao nativa.
  TDataSetSortField = record
    FieldName: string;
    Ascending: Boolean;
  end;

  TDataSetSortFields = array of TDataSetSortField;

  // Porta de ordenacao do conjunto ja carregado. Nao conhece tela, SQL, driver,
  // conexao nem Setup.
  IDataSetSorter = interface
    ['{8D623512-5626-4662-AB18-65F32EB24E30}']
    function CanSort(const ADataSet: TDataSet;
      const AFieldName: string): Boolean;
    function ApplySort(const ADataSet: TDataSet;
      const ASorts: TDataSetSortFields): Boolean;
  end;

implementation

end.
