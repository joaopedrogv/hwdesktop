unit SalvarGrupoFiscalUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IGruposFiscaisRepositoryUnit,
  GrupoFiscalEtdUnit,
  CreateEntityUseCaseOutputUnit;

type       
  {$IFDEF INTF_ON}
  ISalvarGrupoFiscalUseCase = interface
    ['{A2E09023-1406-48D8-BC2E-6CBE8BD377E7}']
    function Executar(Input: GrupoFiscalEtd): CreateEntityUseCaseOutPut;
  end;
  {$ENDIF}
        
  {$IFDEF INTF_ON}    
  SalvarGrupoFiscalUseCase = class(BaseUseCase, ISalvarGrupoFiscalUseCase)
  {$ELSE}          
  SalvarGrupoFiscalUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FGruposFiscaisRepo: IGruposFiscaisRepository;
  public
    constructor Create(const GruposFiscaisRepo: IGruposFiscaisRepository);

    function Executar(Input: GrupoFiscalEtd): CreateEntityUseCaseOutPut;
  end;

implementation

uses
  Sysutils, EntityValidatorFactoryUnit, IEntityValidatorUnit,
  TipoTributoFiscalEnumUnit, ArrayServiceUnit;

{ SalvarGrupoFiscalUseCase }

constructor SalvarGrupoFiscalUseCase.Create(const GruposFiscaisRepo: IGruposFiscaisRepository);
begin
  FGruposFiscaisRepo := GruposFiscaisRepo;
end;

function Vai(Min, Max: Cardinal): Boolean;
begin
  Result :=  min = max ;

end;

function SalvarGrupoFiscalUseCase.Executar(Input: GrupoFiscalEtd): CreateEntityUseCaseOutPut;
var
  validator: IEntityValidator;
begin
  validator := EntityValidatorFactory.Builder();

  validator.Field('Descricao', Input.Descricao)
    .IsRequired().HasSize( 2, 128);

  validator.FieldEnum('TipoTributo', Ord(Input.TipoTributo))
    .IsRequired( Ord(tfIndefinido) ).HasValidaValues( ArrayService.MakeArrayInt(Ord(tfIBSCBS), Ord(tfIS)) );

  if not validator.IsValid() then
    Result := CreateEntityUseCaseOutPut.Create( validator.Result() )

  else if Input.Id = '' then
    Result := CreateEntityUseCaseOutPut.Create(
      FGruposFiscaisRepo.Post( input )
    )
  else
    Result := CreateEntityUseCaseOutPut.Create(
      FGruposFiscaisRepo.Put( input )
    );
end;

end.
