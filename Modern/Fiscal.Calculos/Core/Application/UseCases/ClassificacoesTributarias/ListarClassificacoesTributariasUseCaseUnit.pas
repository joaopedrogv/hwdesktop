unit ListarClassificacoesTributariasUseCaseUnit;

interface

uses          
  BaseUseCaseUnit,
  ClassificacaoTributariaEtdUnit,
  IClassificacaoTributariaRepositoryUnit,
  TipoTributoEnumUnit;

type                           
  (*
  IListarClassificacoesTributariasUseCase = interface
    ['{C817F6A2-0A1E-4E66-AA7D-4604D689C18C}']
    function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum): ClassificacoesTributariasEtd;
  end;
  *)
  IListarClassificacoesTributariasUseCase = class(BaseUseCase)
  public
    function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum): ClassificacoesTributariasEtd; virtual; abstract;
  end;

  //ListarClassificacoesTributariasUseCase = class(TInterfacedObject, IListarClassificacoesTributariasUseCase)
  ListarClassificacoesTributariasUseCase = class(IListarClassificacoesTributariasUseCase)
  private
    FClassTribRepo: IClassificacaoTributariaRepository;
  public
    constructor Create(const ClassTribRepo: IClassificacaoTributariaRepository);

    //function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum): ClassificacoesTributariasEtd;
    function Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum): ClassificacoesTributariasEtd; override;
  end;

implementation

{ ListarClassificacoesTributariasUseCase }

constructor ListarClassificacoesTributariasUseCase.Create(
  const ClassTribRepo: IClassificacaoTributariaRepository);
begin
  FClassTribRepo := ClassTribRepo;
end;

function ListarClassificacoesTributariasUseCase.Executar(const CClassTrib: string; TipoTributo: TipoTributoEnum
): ClassificacoesTributariasEtd;
begin
  Result := FClassTribRepo.ObterTodasEAtual( CClassTrib, TipoTributo );
end;

end.
