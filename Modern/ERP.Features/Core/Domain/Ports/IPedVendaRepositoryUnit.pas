unit IPedVendaRepositoryUnit;

interface               

uses
  CacheableRepositoryUnit,
  TipoComunsUnit,
  OSItemFiscalEtdUnit,
  UpdatePedvendaVinculoNFSeCommandsUnit,
  UpdatePedvendaEmissaoNFSeCommandsUnit,
  UpdatePedvendaVinculoDpsNFSeCommandUnit,
  UpdatePedvendaVinculoNFSeSubstituidaCommandUnit;

type
  IPedVendaRepository = class(CacheableRepository)
  public
    function ListarItensFiscaisOS(const NumerosOS: TArrayInteger): OSItemFiscalEtdlList; virtual; abstract;
    procedure VincularComNFSe(const Input: UpdatePedvendaVinculoNFSeCommand); virtual; abstract;
    procedure RemoverVinculoComNFSe(const Input: UpdatePedvendaRemoverVinculoNFSeCommand); virtual; abstract;
    procedure AtualizarVinculoEmissaoNFSe(const Input: UpdatePedvendaEmissaoNFSeCommand); virtual; abstract;
    procedure AtualizarVinculoDPS(const Input: UpdatePedvendaVinculoDpsNFSeCommand); virtual; abstract;
    procedure AtualizarVinculoNFSeSubstituicao(const Input: UpdatePedvendaVinculoNFSeSubstituidaCommand); virtual; abstract;
  end;

implementation

end.
