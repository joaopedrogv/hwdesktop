unit SalvarRegraRedBenefPcUseCaseUnit;

interface

uses
  SysUtils, Classes,
  IDataBaseConnectionUnit, RegraRedBenefPcEtdUnit, CreateEntityUseCaseOutputUnit, IRegrasRedBenefPcRepositoryUnit;

type
  ISalvarRegraRedBenefPcUseCase = interface
    ['{28CBF9D0-7140-4ADB-96DC-F50C2C6F335E}']
    function Executar(Input: RegraRedBenefPcEtd): CreateEntityUseCaseOutput;
  end;

  SalvarRegraRedBenefPcUseCase = class(TInterfacedObject, ISalvarRegraRedBenefPcUseCase)
  private
    FConnection: IDataBaseConnection;
    FRegrasRedbenfPcRepo: IRegrasRedBenefPcRepository;
  public
    constructor Create(Connection: IDataBaseConnection; RegrasRedbenfPcRepo: IRegrasRedBenefPcRepository);

    function Executar(Input: RegraRedBenefPcEtd): CreateEntityUseCaseOutput;
  end;

implementation

uses
  RegraRedBenefPcValidacaoFactoryUnit, IEntityValidatorUnit, ITransactionUnit;

{ SalvarRegraRedBenefPcUseCase }

constructor SalvarRegraRedBenefPcUseCase.Create(
  Connection: IDataBaseConnection; RegrasRedbenfPcRepo: IRegrasRedBenefPcRepository);
begin
  FConnection := Connection;
  FRegrasRedbenfPcRepo := RegrasRedbenfPcRepo;
end;

function SalvarRegraRedBenefPcUseCase.Executar(Input: RegraRedBenefPcEtd): CreateEntityUseCaseOutput;
var
  validator: IEntityValidator;
  transaction: ITransaction;
begin
  validator := RegraRedBenefPcValidacaoFactory.Build( Input );

  transaction := FConnection.BeginTransaction;
  try try
    if not validator.IsValid() then
    begin
      Result := CreateEntityUseCaseOutPut.Create( validator.Result() );
      Exit;
    end

    else if Input.Id = '' then
      Result := CreateEntityUseCaseOutPut.Create(
        FRegrasRedbenfPcRepo.Incluir( input )
      )
    else
      Result := CreateEntityUseCaseOutPut.Create(
        FRegrasRedbenfPcRepo.Alterar( input )
      );

    transaction.Commit();

  except
    transaction.Rollback();
    raise;
  end;
  finally
    transaction.Free();
  end;
end;

end.