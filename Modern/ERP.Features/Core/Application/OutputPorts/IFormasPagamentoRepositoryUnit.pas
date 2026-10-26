unit IFormasPagamentoRepositoryUnit;

interface

uses
  CacheableRepositoryUnit, FormaPagamentoEtdUnit, UpdateFormaPagamentoVincularNFCommandsUnit;

type
  IFormasPagamentoRepository = class(CacheableRepository)
  public
    function ListarPorNumeroVenda(NumRequisicao: Integer; const Tipo: string): FormaPagamentoEtdList; virtual; abstract;
    procedure VincularNotaFiscal(const Input: UpdateFormaPagamentoVincularNFCommand); virtual; abstract;
    procedure DesvincularNotaFiscal(const Input: UpdateFormaPagamentoDesvincularNFCommand); virtual; abstract;
  end;

implementation

end.
