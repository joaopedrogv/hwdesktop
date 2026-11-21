unit ValidadorItemEventoDFe211130Unit;

interface

uses
  ValidationEntityOutputUnit,
  EventoDFe211130ItemEtdUnit;

type
  IValidadorItemEventoDFe211130 = interface
    ['{C1E7B4A2-8F53-4D61-9C2B-7A4E5D8F1B32}']
    function Validar(const AItem: EventoDFe211130ItemEtd): ValidationEntityOutput;
  end;

  ValidadorItemEventoDFe211130 = class(TInterfacedObject,
    IValidadorItemEventoDFe211130)
  public
    function Validar(const AItem: EventoDFe211130ItemEtd): ValidationEntityOutput;
  end;

implementation

uses
  SysUtils,
  EntityValidatorFactoryUnit,
  IEntityValidatorUnit,
  EventoDFe211130ItensUnit,
  EventoDFe211130ItemMetadataUnit;

procedure ValidarValor(const AValidator: IEntityValidator; const ACampo,
  ADescricao: string; const AValor: Currency; ACasas: Integer);
begin
  if AValor < 0 then
    AValidator.Add(ACampo, ADescricao + ' não pode ser negativo.')
  else if not EventoDFe211130Itens.CasasDecimaisValidas(AValor, ACasas) then
    AValidator.Add(ACampo, Format('%s deve ter no máximo %d casas decimais.',
      [ADescricao, ACasas]));
end;

{ ValidadorItemEventoDFe211130 }

function ValidadorItemEventoDFe211130.Validar(
  const AItem: EventoDFe211130ItemEtd): ValidationEntityOutput;
var
  Validator: IEntityValidator;
begin
  Validator := EntityValidatorFactory.Builder(
    TEventoDFe211130ItemMetadata.GetMetadata);

  if (AItem.NItem < EVENTO_DFE_211130_NITEM_MINIMO) or
     (AItem.NItem > EVENTO_DFE_211130_NITEM_MAXIMO) then
    Validator.Add('NItem', Format('nItem %d deve estar entre %d e %d.',
      [AItem.NItem, EVENTO_DFE_211130_NITEM_MINIMO,
       EVENTO_DFE_211130_NITEM_MAXIMO]));

  ValidarValor(Validator, 'VIbs', 'Valor IBS', AItem.VIbs,
    EVENTO_DFE_211130_CASAS_VALOR);
  ValidarValor(Validator, 'VCbs', 'Valor CBS', AItem.VCbs,
    EVENTO_DFE_211130_CASAS_VALOR);
  ValidarValor(Validator, 'QImobilizado', 'Quantidade imobilizada',
    AItem.QImobilizado, EVENTO_DFE_211130_CASAS_QUANTIDADE);

  Validator.Field('UImobilizado', AItem.UImobilizado)
    .HasSize(1, EVENTO_DFE_211130_TAMANHO_MAXIMO_UNIDADE);

  Result := Validator.Result();
end;

end.