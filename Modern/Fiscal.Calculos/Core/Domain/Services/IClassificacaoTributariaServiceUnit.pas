unit IClassificacaoTributariaServiceUnit;

interface

uses
  ClassificacaoTributariaModelUnit, TipoTributoEnumUnit, ClassificacaoTributariaCalculoModelUnit, TipoComunsUnit;

type
  IClassificacaoTributariaService = interface
    ['{68A1D821-E9AC-4125-AFB9-1B3EC4020422}']
    function ObterClassificacaoTributariaCbsIbs(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
    function ObterClassificacaoTributariaImpostoSeletivo(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
    function ObterClassificacaoTributariaCalculo(Id: Integer): ClassificacaoTributariaCalculoModel;
  end;

implementation


end.

