unit ObterResumoDadosFiscaisUseCaseUnit;

interface

uses
  IAnexosRepositoryUnit,
  IGruposFiscaisRepositoryUnit,
  //INcmsRepositoryUnit,
  IProdutosRepositoryUnit,
  ObterResumoDadosFiscaisInputUnit,
  ObterResumoDadosFiscaisOutputUnit;

type
  IObterResumoDadosFiscaisUseCase = interface
    ['{21A45F8F-9DE6-4FAF-87B2-711B77D71BBA}']
    function Executar(const Input: ObterResumoDadosFiscaisInput): ObterResumoDadosFiscaisOutput;
  end;

  ObterResumoDadosFiscaisUseCase = class(TInterfacedObject, IObterResumoDadosFiscaisUseCase)
  private
    FAnexosRepo: IAnexosRepository;
    FGruposFiscaisRepo: IGruposFiscaisRepository;
    //FNcmsRepo: INcmsRepository;
    FProdutosRepo: IProdutosRepository;
  public
    constructor Create(
      const AnexosRepo: IAnexosRepository;
      const GruposFiscaisRepo: IGruposFiscaisRepository;
      //const NcmsRepo: INcmsRepository;
      const ProdutosRepo: IProdutosRepository
    );

    function Executar(const Input: ObterResumoDadosFiscaisInput): ObterResumoDadosFiscaisOutput;
  end;

implementation

uses AnexoEtdUnit,
  TipoComunsUnit,
  AnexosServiceUnit,
  TipoTributoEnumUnit,
  TiposTributosServiceUnit;//TipoTributoFiscalEnumUnit;

{ ObterResumoDadosFiscaisUseCase }

constructor ObterResumoDadosFiscaisUseCase.Create(
  const AnexosRepo: IAnexosRepository;
  const GruposFiscaisRepo: IGruposFiscaisRepository;
  //const NcmsRepo: INcmsRepository;
  const ProdutosRepo: IProdutosRepository
);
begin
  FAnexosRepo := AnexosRepo;
  FGruposFiscaisRepo := GruposFiscaisRepo;
  //FNcmsRepo := NcmsRepo;
  FProdutosRepo := ProdutosRepo;
end;

function ObterResumoDadosFiscaisUseCase.Executar(const Input: ObterResumoDadosFiscaisInput): ObterResumoDadosFiscaisOutput;
var
  anexos, anexosCompat: AnexosEtd;
  tiposTrib: TipoTributoEnumSet;
begin

  tiposTrib := TiposTributosService.FiscalToRtcSet(Input.TipoTributo);
  anexos := FAnexosRepo.ListarAnexos( tiposTrib, Input.Data );
  anexosCompat := FAnexosRepo.ListarAnexosCompativeisComEstoque( Input.EmpresaId, tiposTrib, Input.Data );

  Result := ObterResumoDadosFiscaisOutput.Create(
    Input.TipoTributo,
    anexos,
    anexosCompat,
    AnexosSerice.Agrupar( anexos ),
    AnexosSerice.Agrupar( anexosCompat ),
    FGruposFiscaisRepo.ListarComAnexoVinculado(),
    //FNcmsRepo.ListarNcmsEstoqueCompativeisComAnexo( Input.EmpresaId, tiposTrib, Input.Data ),
    FProdutosRepo.ObterResumoProdutosComAnexo( Input.EmpresaId, tiposTrib, Input.Data )
  );
end;

end.
