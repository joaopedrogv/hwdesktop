unit VincularTiposVendasAOpInternaUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IOpInternasComTpVendasRepositoryUnit,
  OpInternaComTpVendaEtdUnit,
  CreateEntityUseCaseOutputUnit,
  VincularTiposVendasAOpInternaInputUnit;

type
  {$IFDEF INTF_ON}
  IVincularTiposVendasAOpInternaUseCase = interface
    ['{21031AF1-53ED-4FFF-8225-0A35566E7CFE}']
    function Executar(Input: VincularTiposVendasAOpInternaInput): CreateEntityUseCaseOutPut;
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  VincularTiposVendasAOpInternaUseCase = class(BaseUseCase, IVincularTiposVendasAOpInternaUseCase)
  {$ELSE}
  VincularTiposVendasAOpInternaUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FOpInternasComTpVendasRepo: IOpInternasComTpVendasRepository;
  public
    constructor Create(const OpInternasComTpVendasRepo: IOpInternasComTpVendasRepository);

    function Executar(Input: VincularTiposVendasAOpInternaInput): CreateEntityUseCaseOutPut; overload;
  end;

implementation

uses
  Sysutils,
  EntityValidatorFactoryUnit,
  IEntityValidatorUnit,
  OpInternaTpVendaVinculoModelUnit;

{ VincularTiposVendasAOpInternaUseCase }

constructor VincularTiposVendasAOpInternaUseCase.Create(const OpInternasComTpVendasRepo: IOpInternasComTpVendasRepository);
begin
  FOpInternasComTpVendasRepo := OpInternasComTpVendasRepo;
end;

function VincularTiposVendasAOpInternaUseCase.Executar(Input: VincularTiposVendasAOpInternaInput): CreateEntityUseCaseOutPut;
var
  validator: IEntityValidator;
  vinculos: OpInternaTpVendaVinculoModelArray;
  I: Integer;
begin
  validator := EntityValidatorFactory.Builder();

  validator.Field('OpInternaId', Input.OpInternaId)
    .IsRequired();

  if not validator.IsValid() then
    Result := CreateEntityUseCaseOutPut.Create( validator.Result() )

  else
  begin
    SetLength(vinculos, Length(Input.TiposVendas));
    for I := Low(Input.TiposVendas) to High(Input.TiposVendas) do
      vinculos[I] := OpInternaTpVendaVinculoModel.Create(
        Input.OpInternaId,
        Input.TiposVendas[I].CodTpVenda,
        Input.TiposVendas[I].TipoTpVenda,
        False
      );

    FOpInternasComTpVendasRepo.VincularTiposVendasAOperacaoInterna( Input.OpInternaId, vinculos );

    Result := CreateEntityUseCaseOutPut.Create( nil );
  end;
end;

end.
