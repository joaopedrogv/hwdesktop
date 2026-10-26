unit IConsultasSqlRepositoryUnit;

interface

uses
  CacheableRepositoryUnit, ConsultaSqlEtdUnit;

type
  IConsultasSqlRepository = class(CacheableRepository)
  public
    function ObterTodos(): ConsultaSqlEtdList; virtual; abstract;
    procedure Incluir(const Input: ConsultaSqlEtdList); virtual; abstract;
    procedure Atualizar(const Input: ConsultaSqlEtdList); virtual; abstract;
    procedure Remover(const Ids: TArray<string>); virtual; abstract;
  end;

implementation

end.
