unit IFundamentacaoClassificacaoRepositoryUnit;

interface

uses                                                                              
  CacheableRepositoryUnit,
  FundamentacaoClassificacaoModelUnit, //FundamentacaoClassificacaoEtdUnit,
  TipoComunsUnit;

type
  IFundamentacaoClassificacaoRepository = class(CacheableRepository)
  public
    function ObterPorClassificacaoTributariaId(ClassificacaoTributariaId: Integer; Data: TDate): FundamentacaoClassificacaoModel; virtual; abstract;
    //function ObterPorClassificacaoTributariaId(ClassificacaoTributariaId: Integer; Data: TDate): FundamentacaoClassificacaoEtd; virtual; abstract;
  end;

implementation

end.
