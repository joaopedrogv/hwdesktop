unit RemoverAjusteRedBenefPcUseCaseUnit;

interface

uses
  IAjustesRedBenefPcRepositoryUnit,
  AjusteRedBenefPcModelUnit,
  CreateEntityUseCaseOutputUnit, IDataBaseConnectionUnit;

type
  IRemoverAjusteRedBenefPcUseCase = interface
    ['{D7FAB7CB-FECE-47FC-A9FF-63A998482F07}']
    procedure Executar(const Id: string);
  end;

  RemoverAjusteRedBenefPcUseCase = class(TInterfacedObject, IRemoverAjusteRedBenefPcUseCase)
  private
    FConnection: IDataBaseConnection;
    FAjustesRedBenefPcRepo: IAjustesRedBenefPcRepository;
  public
    constructor Create(Connection: IDataBaseConnection; AjustesRedBenefPcCbsRepo: IAjustesRedBenefPcRepository);

    procedure Executar(const Id: string);
  end;

implementation

uses
  Sysutils, EValidacaoNegocioUnit, ITransactionUnit;

{ RemoverAjusteRedBenefPcUseCase }

constructor RemoverAjusteRedBenefPcUseCase.Create(
  Connection: IDataBaseConnection; AjustesRedBenefPcCbsRepo: IAjustesRedBenefPcRepository
);
begin
  FConnection := Connection;
  FAjustesRedBenefPcRepo := AjustesRedBenefPcCbsRepo;
end;

procedure RemoverAjusteRedBenefPcUseCase.Executar(const Id: string);
var
  itemDb: AjusteRedBenefPcModel;
  transaction: ITransaction;
begin
  transaction := FConnection.BeginTransaction();
  try try
    itemDb := FAjustesRedBenefPcRepo.GetById(Id);

    if itemDb = nil then
      raise EValidacaoNegocio.Create('Registro não encontrado');

    //  if itemDb.Ativo = saLixeira then
    //    raise EValidacaoNegocio.Create('Registro já se encontra na Lixeira');

    //  itemDb.Ativo := saLixeira;


    FAjustesRedBenefPcRepo.Excluir(itemDb.Id, itemDb.CodEmpresa);

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
