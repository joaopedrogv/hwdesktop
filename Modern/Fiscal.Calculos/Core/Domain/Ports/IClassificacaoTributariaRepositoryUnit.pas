unit IClassificacaoTributariaRepositoryUnit;

interface

uses                   
  CacheableRepositoryUnit,
  ClassificacaoTributariaEtdUnit,
  TipoComunsUnit,
  TipoTributoEnumUnit, ClassificacaoTributariaModelUnit, ClassificacaoTributariaCalculoModelUnit;

type
  IClassificacaoTributariaRepository = class(CacheableRepository)
  public
    function ObterClassificacaoTributaria(
      const CClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
    ): ClassificacaoTributariaModel; virtual; abstract;
    function ObterClassificacaoCalculo(Id: Integer): ClassificacaoTributariaCalculoModel; virtual; abstract;
    //De uso do ERP
    function ObterTodasEAtual(const CClassTribAtual: string; TipoTributo: TipoTributoEnum): ClassificacoesTributariasEtd; virtual; abstract;
    function ObterClassificacaoCbsIbs(const CClassTrib: string; Data: TDate): ClassificacaoTributariaEtd; virtual; abstract;
    // Espelho de ClassificacaoTributariaRepository.listarCodigosClassificacoesServicoSemVinculoNbs (C06-04).
    // Nao abstrato (default vazio) para preservar os test doubles existentes sem
    // alteracao fora do escopo do incremento.
    function ListarClassificacoesServicoSemVinculoNbs(Data: TDate): TArrayString; virtual;
  end;

implementation

function IClassificacaoTributariaRepository.ListarClassificacoesServicoSemVinculoNbs(Data: TDate): TArrayString;
begin
  SetLength(Result, 0);
end;

end.