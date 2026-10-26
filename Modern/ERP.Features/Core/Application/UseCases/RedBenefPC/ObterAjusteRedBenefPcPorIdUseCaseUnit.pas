unit ObterAjusteRedBenefPcPorIdUseCaseUnit;

interface

uses
  SysUtils, Classes, AjusteRedBenefPcModelUnit, IAjustesRedBenefPcRepositoryUnit;

type
  IObterAjusteRedBenefPcPorIdUseCase = interface
    ['{2F558917-2C4C-4916-AAFF-37047A2D996F}']
    function Executar(const Id: string): AjusteRedBenefPcModel;
  end;

  ObterAjusteRedBenefPcPorIdUseCase = class(TInterfacedObject, IObterAjusteRedBenefPcPorIdUseCase)
  private
    FAjustesRedBenefPcRepo: IAjustesRedBenefPcRepository;
  public
    constructor Create(const AjustesRedBenefPcRepo: IAjustesRedBenefPcRepository);

    function Executar(const Id: string): AjusteRedBenefPcModel;
  end;

implementation

{ ObterAjusteRedBenefPcPorIdUseCase }

constructor ObterAjusteRedBenefPcPorIdUseCase.Create(const AjustesRedBenefPcRepo: IAjustesRedBenefPcRepository);
begin
  FAjustesRedBenefPcRepo := AjustesRedBenefPcRepo;
end;

function ObterAjusteRedBenefPcPorIdUseCase.Executar(const Id: string): AjusteRedBenefPcModel;
begin
  Result := FAjustesRedBenefPcRepo.GetById(Id);
end;

end.
