unit RemoverRegraRedBenefPcUseCaseUnit;

interface

uses
  IRegrasRedBenefPcRepositoryUnit,
  RegraRedBenefPcEtdUnit,
  CreateEntityUseCaseOutputUnit, IDataBaseConnectionUnit;

type
  IRemoverRegraRedBenefPcUseCase = interface
    ['{889EF5F2-107E-41FC-B18E-84EDF5025705}']
    procedure Executar(const Id: string);
  end;

  RemoverRegraRedBenefPcUseCase = class(TInterfacedObject, IRemoverRegraRedBenefPcUseCase)
  private
    FConnection: IDataBaseConnection; 
    FRegrasRedBenefPcRepo: IRegrasRedBenefPcRepository;
  public
    constructor Create(Connection: IDataBaseConnection; RegrasRedBenefPcCbsRepo: IRegrasRedBenefPcRepository);

    procedure Executar(const Id: string);
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, StatusRegistroEnumUnit, ITransactionUnit;

{ RemoverRegraRedBenefPcUseCase }

constructor RemoverRegraRedBenefPcUseCase.Create(Connection: IDataBaseConnection; RegrasRedBenefPcCbsRepo: IRegrasRedBenefPcRepository);
begin
  FConnection := Connection;
  FRegrasRedBenefPcRepo := RegrasRedBenefPcCbsRepo;
end;

procedure RemoverRegraRedBenefPcUseCase.Executar(const Id: string);
var
  itemDb: RegraRedBenefPcEtd;
  transaction: ITransaction;
begin
  transaction := FConnection.BeginTransaction();
  try try
    itemDb := FRegrasRedBenefPcRepo.GetById(Id);

    if itemDb = nil then
      raise EValidacaoNegocio.Create('Registro não encontrado');

    if itemDb.Ativo = saLixeira then
      raise EValidacaoNegocio.Create('Registro já se encontra na Lixeira');

    itemDb.Ativo := saLixeira;

    FRegrasRedBenefPcRepo.Alterar(itemDb);

    transaction.Commit();
    
  except
    transaction.Rollback();
    raise;
  end;
  finally
    transaction.FreeTransaction();
  end;
end;

end.
