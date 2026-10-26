unit ObterGruposFiscaisUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IGruposFiscaisRepositoryUnit,
  GrupoFiscalEtdUnit;

type            
  {$IFDEF INTF_ON}
  IObterGrupoFiscalPorIdUseCase = interface
    ['{A2F4A37A-9D22-4E29-9657-A57575CE2B0A}']
    function Executar(const Id: string): GrupoFiscalEtd;
  end;
  {$ENDIF}
          
  {$IFDEF INTF_ON}             
  ObterGrupoFiscalPorIdUseCase = class(BaseUseCase, IObterGrupoFiscalPorIdUseCase)
  {$ELSE}
  ObterGrupoFiscalPorIdUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FGruposFiscaisRepo: IGruposFiscaisRepository;
  public
    constructor Create(const GruposFiscaisRepo: IGruposFiscaisRepository);

    function Executar(const Id: string): GrupoFiscalEtd;
  end;

implementation

{ ObterGrupoFiscalPorIdUseCase }

constructor ObterGrupoFiscalPorIdUseCase.Create(const GruposFiscaisRepo: IGruposFiscaisRepository);
begin
  FGruposFiscaisRepo := GruposFiscaisRepo;
end;

function ObterGrupoFiscalPorIdUseCase.Executar(const Id: string): GrupoFiscalEtd;
begin
  Result := FGruposFiscaisRepo.GetById(Id);
end;

end.
