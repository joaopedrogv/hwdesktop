unit ICalculoTributoServiceUnit;

interface

uses
  OperacaoTributacaoModelUnit,
  TributosModelUnit;

type
  ICalculoTributoService = interface
    ['{8B7CD389-6CE6-4BC2-A5E4-79F96806D4A9}']
    function Calcular(const Operacao: OperacaoTributacaoModel): TributosModel;
  end;

implementation

end.
