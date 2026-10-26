unit IItensIbptRepositoryUnit;

interface 

uses               
  CacheableRepositoryUnit,
  ItemIbptEtdUnit,
  TipoComunsUnit;

type
  IItensIbptRepository = class(CacheableRepository)
  public
    procedure SalvarItens(Input: ItemIbptEtdList); virtual; abstract;
    function ObterItemIbpt(const Codigo, UF: string; Data: TDate; Excecao: Smallint = 0): ItemIbptEtd; virtual; abstract;
  end;

implementation

end.
