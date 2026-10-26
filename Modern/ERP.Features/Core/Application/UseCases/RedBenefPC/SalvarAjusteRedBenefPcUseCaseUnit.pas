unit SalvarAjusteRedBenefPcUseCaseUnit;

interface

uses
  SysUtils, Classes,
  IDataBaseConnectionUnit, ISessionContextUnit, AjusteRedBenefPcModelUnit, CreateEntityUseCaseOutputUnit,
  IAjustesRedBenefPcRepositoryUnit;

type
  ISalvarAjusteRedBenefPcUseCase = interface
    ['{F2CF9F05-17A8-4C0E-B243-BCD392BCFCD1}']
    function Executar(Input: AjusteRedBenefPcModel): CreateEntityUseCaseOutput;
  end;

  SalvarAjusteRedBenefPcUseCase = class(TInterfacedObject, ISalvarAjusteRedBenefPcUseCase)
  private
    FConnection: IDataBaseConnection;
    FSession: ISessionContext;
    FAjustesRedbenfPcRepo: IAjustesRedBenefPcRepository;
  public
    constructor Create(
      Connection: IDataBaseConnection; Session: ISessionContext; RegrasRedbenfPcRepo: IAjustesRedBenefPcRepository
    );

    function Executar(Input: AjusteRedBenefPcModel): CreateEntityUseCaseOutput;
  end;

implementation

uses
  AjusteRedBenefPcValidacaoFactoryUnit, IEntityValidatorUnit, ITransactionUnit;

{ SalvarAjusteRedBenefPcUseCase }

constructor SalvarAjusteRedBenefPcUseCase.Create(
  Connection: IDataBaseConnection; Session: ISessionContext; RegrasRedbenfPcRepo: IAjustesRedBenefPcRepository
);
begin
  FConnection := Connection;
  FSession := Session;
  FAjustesRedbenfPcRepo := RegrasRedbenfPcRepo;
end;

function SalvarAjusteRedBenefPcUseCase.Executar(Input: AjusteRedBenefPcModel): CreateEntityUseCaseOutput;
var
  validator: IEntityValidator;
  transaction: ITransaction;
begin
  validator := AjusteRedBenefPcValidacaoFactory.Build( Input );

  transaction := FConnection.BeginTransaction;
  try try
    if not validator.IsValid() then
    begin
      Result := CreateEntityUseCaseOutPut.Create( validator.Result() );
      Exit;
    end

    else if Input.Id = '' then
    begin
      Input.CodEmpresa := FSession.EmpresaId;
      Result := CreateEntityUseCaseOutPut.Create(
        FAjustesRedbenfPcRepo.Incluir( input )
      )
    end
    else
      Result := CreateEntityUseCaseOutPut.Create(
        FAjustesRedbenfPcRepo.Alterar( input )
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
