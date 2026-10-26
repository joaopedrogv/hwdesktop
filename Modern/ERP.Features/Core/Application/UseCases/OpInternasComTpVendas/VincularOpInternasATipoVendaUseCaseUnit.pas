unit VincularOpInternasATipoVendaUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IOpInternasComTpVendasRepositoryUnit,
  OpInternaComTpVendaEtdUnit,
  CreateEntityUseCaseOutputUnit,
  VincularOpInternasATipoVendaInputUnit;

type      
  {$IFDEF INTF_ON}
  IVincularOpInternasATipoVendaUseCase = interface
    ['{F773A85C-108E-4A39-AC37-15A315715717}']
    function Executar(Input: VincularOpInternasATipoVendaInput): CreateEntityUseCaseOutPut;
  end;
  {$ENDIF}
         
  {$IFDEF INTF_ON}
  VincularOpInternasATipoVendaUseCase = class(BaseUseCase, IVincularOpInternasATipoVendaUseCase)
  {$ELSE}
  VincularOpInternasATipoVendaUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOpInternasComTpVendasRepo: IOpInternasComTpVendasRepository;
  public
    constructor Create(const OpInternasComTpVendasRepo: IOpInternasComTpVendasRepository);

    function Executar(Input: VincularOpInternasATipoVendaInput): CreateEntityUseCaseOutPut; overload;
  end;

implementation

uses
  Sysutils,
  EntityValidatorFactoryUnit,
  IEntityValidatorUnit,
  OpInternaTpVendaVinculoModelUnit;

{ VincularOpInternasATipoVendaUseCase }

constructor VincularOpInternasATipoVendaUseCase.Create(const OpInternasComTpVendasRepo: IOpInternasComTpVendasRepository);
begin
  FOpInternasComTpVendasRepo := OpInternasComTpVendasRepo;
end;

function VincularOpInternasATipoVendaUseCase.Executar(Input: VincularOpInternasATipoVendaInput): CreateEntityUseCaseOutPut;
var
  validator: IEntityValidator;
  vinculos: OpInternaTpVendaVinculoModelArray;
  I: Integer;
begin
  validator := EntityValidatorFactory.Builder();

  validator.Field('CodTpVenda', Input.CodTpVenda)
    .IsRequired();

  validator.Field('TipoTpVenda', Input.TipoTpVenda)
    .IsRequired();

  if not validator.IsValid() then
    Result := CreateEntityUseCaseOutPut.Create( validator.Result() )

  else
  begin
    SetLength(vinculos, Length(Input.OpInternas));
    for I := Low(Input.OpInternas) to High(Input.OpInternas) do
      vinculos[I] := OpInternaTpVendaVinculoModel.Create(
        Input.OpInternas[I].OpInternaId,
        Input.CodTpVenda,
        Input.TipoTpVenda,
        Input.OpInternas[I].Padrao
      );

    FOpInternasComTpVendasRepo.VincularOperacoesInternasATipoVenda(
      OpInternaTpVendaVinculoModel.Create(
        '', Input.CodTpVenda, Input.TipoTpVenda, False
      ),
      vinculos
    );

    Result := CreateEntityUseCaseOutPut.Create( nil );
  end;
end;

end.
