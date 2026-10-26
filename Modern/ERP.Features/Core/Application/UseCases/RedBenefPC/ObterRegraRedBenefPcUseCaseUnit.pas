unit ObterRegraRedBenefPcUseCaseUnit;

interface

uses
  SysUtils, Classes, RegraRedBenefPcEtdUnit, IRegrasRedBenefPcRepositoryUnit;

type
  IObterRegraRedBenefPcPorIdUseCase = interface
    ['{91451327-B1D4-4BD4-9E1F-DDFC00635016}']
    function Executar(const Id: string): RegraRedBenefPcEtd;
  end;

  ObterRegraRedBenefPcUseCasePorId = class(TInterfacedObject, IObterRegraRedBenefPcPorIdUseCase)
  private
    FRegrasRedBenefPcRepo: IRegrasRedBenefPcRepository;
  public
    constructor Create(const RegrasFiscaisIbsCbsRepo: IRegrasRedBenefPcRepository);

    function Executar(const Id: string): RegraRedBenefPcEtd;
  end;

implementation

{ ObterRegraRedBenefPcUseCasePorId }

constructor ObterRegraRedBenefPcUseCasePorId.Create(const RegrasFiscaisIbsCbsRepo: IRegrasRedBenefPcRepository);
begin
  FRegrasRedBenefPcRepo := RegrasFiscaisIbsCbsRepo;
end;

function ObterRegraRedBenefPcUseCasePorId.Executar(const Id: string): RegraRedBenefPcEtd;
begin
  Result := FRegrasRedBenefPcRepo.GetById(Id);
end;

end.