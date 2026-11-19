unit IProcessosProviderUnit;

interface

uses
  ProcessoAtualizacaoModelUnit;

type
  IProcessosProvider = interface
    ['{B3F7A2C4-9D18-4E6B-8F52-7A1C0D94E3B6}']
    function ObterPendentes(AVersaoAtual: Integer): AtualizacaoProcessosModel;
  end;

implementation

end.
