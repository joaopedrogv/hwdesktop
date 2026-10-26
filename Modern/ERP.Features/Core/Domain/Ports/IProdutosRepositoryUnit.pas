unit IProdutosRepositoryUnit;

interface

uses          
  CacheableRepositoryUnit,
  ProdutoEtdUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit,
  ProdutoGrupoFiscalUpdateModelUnit,
  ProdutoNcmGrupoFiscalUpdateModelUnit,
  ProdutoAnexoResumoModelUnit;

type
  IProdutosRepository = class(CacheableRepository)
  public
    function ObterResumoProdutosComAnexo(EmpresaId: Integer; TiposTributos: TipoTributoEnumSet; Data: TDate): ProdutoAnexoResumoModel; virtual; abstract;
    procedure AtualizarGrupoFiscalEmLote(const Dados: ProdutoGrupoFiscalUpdateModelArray); overload; virtual; abstract;
    procedure AtualizarGrupoFiscalEmLote(const Dados: ProdutoNcmGrupoFiscalUpdateModelArray); overload; virtual; abstract;
  end;

implementation

end.
