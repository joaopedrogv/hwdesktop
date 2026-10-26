unit ITiposServicosRepositoryUnit;

interface      

uses  
  CacheableRepositoryUnit,
  TipoServicoEtdUnit,
  AlteracaoFiscalNFSeModelUnit;

type
  ITiposServicosRepository = class(CacheableRepository)
  public
    function GetById(Codigo: Integer): TipoServicoEtd; virtual; abstract;
    procedure AtualizarFiscalNFSe(const Input: AlteracaoFiscalNFSeModel); virtual; abstract;
  end;

implementation

end.
