unit ListarDFeAlertasUseCaseUnit;

interface

uses
  IDFeAlertasRepositoryUnit, DFeAlertaEdtUnit;

type
  IListarDFeAlertasUseCase = interface
    ['{9BF8BD64-8106-4751-B06F-956B4EBDB54B}']
    function Executar(const ChaveDFe: string): DFeAlertaEdtList;
  end;

  ListarDFeAlertasUseCase = class(TInterfacedObject, IListarDFeAlertasUseCase)
  private
    FDFeAlertasRepo: IDFeAlertasRepository;
  public
    constructor Create( ADFeAlertasRepo: IDFeAlertasRepository);
    function Executar(const ChaveDFe: string): DFeAlertaEdtList;
  end;

implementation

{ ListarDFeAlertasUseCase }

constructor ListarDFeAlertasUseCase.Create(ADFeAlertasRepo: IDFeAlertasRepository);
begin
  FDFeAlertasRepo := ADFeAlertasRepo;
end;

function ListarDFeAlertasUseCase.Executar(const ChaveDFe: string): DFeAlertaEdtList;
begin
  Result := FDFeAlertasRepo.ObterPelodDFe(ChaveDFe);
end;

end.
