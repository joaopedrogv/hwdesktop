unit IIbptWriterUnit;

interface

uses
  ItemIbptEtdUnit;

type
  IIbptWriter = interface
    ['{C699D6DF-C17C-420B-BD6B-86420ED508DB}']
    procedure ExcluirItensIBPT(const UF: string);
    procedure SalvarItensIBPT(const Dados: ItemIbptEtdList);
  end;

implementation

end.
