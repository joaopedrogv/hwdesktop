unit SalvarOperacaoFiscalIbsCbsUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  OperacaoFiscalIbsCbsEtdUnit,
  CreateEntityUseCaseOutputUnit;

type                                         
  {$IFDEF INTF_ON}
  ISalvarOperacaoFiscalIbsCbsUseCase = interface
    ['{2A910E0B-C2C8-4E81-9169-A088283A8063}']
    function Executar(Input: OperacaoFiscalIbsCbsEtd): CreateEntityUseCaseOutPut;
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  SalvarOperacaoFiscalIbsCbsUseCase = class(BaseUseCase, ISalvarOperacaoFiscalIbsCbsUseCase)
  {$ELSE}
  SalvarOperacaoFiscalIbsCbsUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
  public
    constructor Create(const OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository);

    function Executar(Input: OperacaoFiscalIbsCbsEtd): CreateEntityUseCaseOutPut;
  end;

implementation

uses
  Sysutils, EntityValidatorFactoryUnit, IEntityValidatorUnit,
  LimitesBasicosUnit;

{ SalvarOperacaoFiscalIbsCbsUseCase }

constructor SalvarOperacaoFiscalIbsCbsUseCase.Create(const OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository);
begin
  FOperacoesFiscaisIbsCbsRepo := OperacoesFiscaisIbsCbsRepo;
end;

function SalvarOperacaoFiscalIbsCbsUseCase.Executar(Input: OperacaoFiscalIbsCbsEtd): CreateEntityUseCaseOutPut;
var
  validator: IEntityValidator;
begin
  validator := EntityValidatorFactory.Builder();

  validator.Field('OperacaoInternaId', Input.OperacaoInternaId)
    .IsRequired();

  validator.Field('RegraFiscalId', Input.RegraFiscalId)
    .IsRequired();

  validator.FieldD('InicioVigencia', Input.InicioVigencia)
    .IsRequired();

  validator.Field('FimVigencia', Input.FimVigencia)
    .HasMinValue( Input.InicioVigencia, 'Final da vigência [@Value] menor que início [@MinValue] ' );

  if not validator.IsValid() then
    Result := CreateEntityUseCaseOutPut.Create( validator.Result() )

  else if Input.Id = '' then
    Result := CreateEntityUseCaseOutPut.Create(
      FOperacoesFiscaisIbsCbsRepo.Post( input )
    )
  else
    Result := CreateEntityUseCaseOutPut.Create(
      FOperacoesFiscaisIbsCbsRepo.Put( input )
    );
end;

end.
