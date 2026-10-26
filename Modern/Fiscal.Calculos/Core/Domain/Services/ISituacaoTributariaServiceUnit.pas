unit ISituacaoTributariaServiceUnit;

interface

uses
  TipoComunsUnit, SituacaoTributariaEtdUnit, TipoTributoEnumUnit;

type
  ISituacaoTributariaService = interface
    ['{003683EE-8F84-4230-8306-74848368900D}']
    function ConsultarSituacaoTributariaPorCodigo(const CST: string; IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd;
  end;

implementation

end.