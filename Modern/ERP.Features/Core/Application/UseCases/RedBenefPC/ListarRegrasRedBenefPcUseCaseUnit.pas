unit ListarRegrasRedBenefPcUseCaseUnit;

interface

uses
  SysUtils, Classes,
  TipoComunsUnit, RegraRedBenefPcEtdUnit, IRegrasRedBenefPcRepositoryUnit;

type
  IListarRegrasRedBenefPcVigentesEAtualUseCase = interface
    ['{B8ADE73E-6289-40FF-96FC-02E772B36685}']
    function Executar(const ARegraAtualId: string; ADataReferencia: TDate): RegraRedBenefPcEtdList;
    //function Executar(const Tipo: TipoInfComplementarEnum): RegraRedBenefPcEtdList; overload;
  end;

  ListarRegrasRedBenefPcUseCase = class(TInterfacedObject, IListarRegrasRedBenefPcVigentesEAtualUseCase)
  private
    FRegrasRepo: IRegrasRedBenefPcRepository;
  public
    constructor Create(
      RegrasRepo: IRegrasRedBenefPcRepository
    );

    function Executar(const RegraAtualId: string; DataReferencia: TDate): RegraRedBenefPcEtdList;
  end;

implementation

uses
  EValidacaoNegocioUnit;

{ ListarRegrasRedBenefPcUseCase }

constructor ListarRegrasRedBenefPcUseCase.Create(
  RegrasRepo: IRegrasRedBenefPcRepository
);
begin
  FRegrasRepo := RegrasRepo;
end;


function ListarRegrasRedBenefPcUseCase.Executar(const RegraAtualId: string; DataReferencia: TDate): RegraRedBenefPcEtdList;
begin
  Result := FRegrasRepo.ListarRegrasVigentesEAtual( RegraAtualId, DataReferencia );
end;

end.
