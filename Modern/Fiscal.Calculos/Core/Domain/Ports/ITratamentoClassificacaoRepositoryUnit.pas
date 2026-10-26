unit ITratamentoClassificacaoRepositoryUnit;

interface

uses                        
  CacheableRepositoryUnit,
  TratamentoClassificacaoEtdUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit, TratamentoClassificacaoModelUnit;

type
  ITratamentoClassificacaoRepository = class(CacheableRepository)
  public
    /// <summary>
    ///   Espelho de TratamentoClassificacaoRepository.buscarTratamentoClassificacao
    ///   (metodo usado por TratamentoClassificacaoService). Filtra vigencia do
    ///   proprio tratamento de classificacao (TRCL) e retorna o modelo de 4
    ///   campos. Nao retorna SITR_IND_GRED, pois o DTO Java equivalente nao o
    ///   expoe (o indicador de reducao e obtido via ClassificacaoTributariaCalculoModel).
    /// </summary>
    function ObterTratamentoClassificacaomodel(ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoModel; virtual; abstract;
    function ObterTratamentoClassificacao(ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoEtd; overload; virtual; abstract;
    function ObterTratamentoClassificacao(const cClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd; overload; virtual; abstract;
  end;

implementation

end.
