unit SalvarTributoDFeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  ITributosDFeRepositoryUnit,
  TributoDFeContextEtdUnit,
  CreateEntityUseCaseOutputUnit,
  ISalvarTributoDFeUseCaseUnit;

type                                                      
  {$IFDEF INTF_ON}                                                            
  SalvarTributoDFeUseCase = class(BaseUseCase, ISalvarTributoDFeUseCase)
  {$ELSE}
  SalvarTributoDFeUseCase = class(ISalvarTributoDFeUseCase)
  {$ENDIF}
  private
    FTributosDFeRepo: ITributosDFeRepository;
  public
    constructor Create(const TributosDFeRepo: ITributosDFeRepository);

    function Executar(Input: TributoDFeContextEtd): CreateEntityUseCaseOutPut; override;
  end;

implementation

uses
  Sysutils, EntityValidatorFactoryUnit, IEntityValidatorUnit,
  TipoRegraTributoDFeEnumUnit,
  LimitesBasicosUnit, StringNullableUnit;

{ SalvarTributoDFeUseCase }

constructor SalvarTributoDFeUseCase.Create(const TributosDFeRepo: ITributosDFeRepository);
begin
  FTributosDFeRepo := TributosDFeRepo;
end;

function SalvarTributoDFeUseCase.Executar(Input: TributoDFeContextEtd): CreateEntityUseCaseOutPut;
var
  validator: IEntityValidator;
begin
  validator := EntityValidatorFactory.Builder();

  validator.Field('Id', Input.Id)
    .IsRequired().HasSize( 36, 36 );

  if (Input.IbsCbs <> nil) and (Input.IbsCbs.TipoRegra = tctNenhuma) then
    Input.IbsCbs.RegraFiscalId := StringNullable.NullInstance();

  if not validator.IsValid() then
    Result := CreateEntityUseCaseOutPut.Create( validator.Result() )

  else
    Result := CreateEntityUseCaseOutPut.Create(
      FTributosDFeRepo.Post( Input )
    );
end;

end.
