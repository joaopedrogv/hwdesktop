unit SalvarGrupoFiscalUseCaseUnit;

interface

uses
  IGruposFiscaisRepositoryUnit,
  IDataBaseConnectionUnit,
  GrupoFiscalEtdUnit,
  CreateEntityUseCaseOutputUnit;

type

  ISalvarGrupoFiscalUseCase = interface
    ['{A2E09023-1406-48D8-BC2E-6CBE8BD377E7}']
    function Executar(Input: GrupoFiscalEtd): CreateEntityUseCaseOutPut;
  end;

  SalvarGrupoFiscalUseCase = class(TInterfacedObject, ISalvarGrupoFiscalUseCase)
  private
    FConnection: IDataBaseConnection;
    FGruposFiscaisRepo: IGruposFiscaisRepository;
  public
    constructor Create(AConnection: IDataBaseConnection; AGruposFiscaisRepo: IGruposFiscaisRepository);

    function Executar(Input: GrupoFiscalEtd): CreateEntityUseCaseOutPut;
  end;

implementation

uses
  Sysutils, EntityValidatorFactoryUnit, IEntityValidatorUnit,
  TipoTributoFiscalEnumUnit, ArrayServiceUnit, ITransactionUnit;

{ SalvarGrupoFiscalUseCase }

constructor SalvarGrupoFiscalUseCase.Create(AConnection: IDataBaseConnection; AGruposFiscaisRepo: IGruposFiscaisRepository);
begin
  FConnection := AConnection;
  FGruposFiscaisRepo := AGruposFiscaisRepo;
end;

function SalvarGrupoFiscalUseCase.Executar(Input: GrupoFiscalEtd): CreateEntityUseCaseOutPut;
var
  validator: IEntityValidator;
  transaction: ITransaction;
begin
  validator := EntityValidatorFactory.Builder();

  validator.Field('Descricao', Input.Descricao)
    .IsRequired().HasSize( 2, 128);

  validator.FieldEnum('TipoTributo', Ord(Input.TipoTributo))
    .IsRequired( Ord(tfIndefinido) ).HasValidaValues( ArrayService.MakeArrayInt(Ord(tfIBSCBS), Ord(tfIS)) );

  if not validator.IsValid() then
    Result := CreateEntityUseCaseOutPut.Create( validator.Result() )

  else
  begin
    transaction := FConnection.BeginTransaction();
    try try
      if Input.Id = '' then
        Result := CreateEntityUseCaseOutPut.Create(
          FGruposFiscaisRepo.Post( input )
        )
      else
        Result := CreateEntityUseCaseOutPut.Create(
          FGruposFiscaisRepo.Put( input )
        );
      transaction.Commit();
    except
      on E: Exception do
        begin
          transaction.Rollback();
          raise;
        end;
    end;
    finally
      transaction.FreeTransaction();
    end;
  end;
end;

end.
