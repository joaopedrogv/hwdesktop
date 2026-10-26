unit SalvarOperacaoInternaUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IOperacoesInternasRepositoryUnit,
  OperacaoInternaEtdUnit,
  CreateEntityUseCaseOutputUnit;

type    
  {$IFDEF INTF_ON}
  ISalvarOperacaoInternaUseCase = interface
    ['{DF713185-ACF4-4255-BFA6-41F044C5B3C1}']
    function Executar(Input: OperacaoInternaEtd): CreateEntityUseCaseOutPut;
  end;
  {$ENDIF}
        
  {$IFDEF INTF_ON}
  SalvarOperacaoInternaUseCase = class(BaseUseCase, ISalvarOperacaoInternaUseCase)
  {$ELSE}                                                                               
  SalvarOperacaoInternaUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOperacoesInternasRepo: IOperacoesInternasRepository;
  public
    constructor Create(const OperacoesInternasRepo: IOperacoesInternasRepository);

    function Executar(Input: OperacaoInternaEtd): CreateEntityUseCaseOutPut;
  end;

implementation

uses
  Sysutils, EntityValidatorFactoryUnit, IEntityValidatorUnit;

{ SalvarOperacaoInternaUseCase }

constructor SalvarOperacaoInternaUseCase.Create(const OperacoesInternasRepo: IOperacoesInternasRepository);
begin
  FOperacoesInternasRepo := OperacoesInternasRepo;
end;

function SalvarOperacaoInternaUseCase.Executar(Input: OperacaoInternaEtd): CreateEntityUseCaseOutPut;
var
  validator: IEntityValidator;
begin
  validator := EntityValidatorFactory.Builder();

  validator.Field('Descricao', Input.Descricao)
    .IsRequired().HasSize( 2, 128);

  if not validator.IsValid() then
    Result := CreateEntityUseCaseOutPut.Create( validator.Result() )

  else if Input.Id = '' then
    Result := CreateEntityUseCaseOutPut.Create(
      FOperacoesInternasRepo.Post( input )
    )
  else
    Result := CreateEntityUseCaseOutPut.Create(
      FOperacoesInternasRepo.Put( input )
    );
end;

end.
