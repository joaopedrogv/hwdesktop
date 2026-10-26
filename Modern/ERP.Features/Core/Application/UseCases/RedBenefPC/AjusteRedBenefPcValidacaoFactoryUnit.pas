unit AjusteRedBenefPcValidacaoFactoryUnit;

interface

uses
  SysUtils, Classes,
  IEntityValidatorUnit, AjusteRedBenefPcModelUnit;

type
  AjusteRedBenefPcValidacaoFactory = class
  public
    class function Build(const Entity: AjusteRedBenefPcModel): IEntityValidator;
  end;

implementation

uses
  EntityValidatorFactoryUnit, AjusteRedBenefPcMetadataUnit, StringServiceUnit;

{ AjusteRedBenefPcValidacaoFactory }

class function AjusteRedBenefPcValidacaoFactory.Build(const Entity: AjusteRedBenefPcModel): IEntityValidator;
const
  CSTS_PC: array[1..6] of string = ('04', '05', '06', '07', '08', '09');
begin
  Result := EntityValidatorFactory.Builder( AjusteRedBenefPcMetadata.GetMetadata() );

  Result.Field('Cst'     , Entity.Cst).IsIn(CSTS_PC);
  Result.Field('ChaveDfe', Entity.ChaveDfe).IsRequired();
  Result.Field('RegraId' , Entity.RegraId).IsRequired();
  Result.Field('IndAj'   , Entity.IndAj).IsRequired();
  Result.Field('CodAj'   , Entity.CodAj).IsRequired();
  Result.Field('DataRef' , Entity.DataRef).IsRequired();

  if Length(StringService.OnlyNumber(Entity.ChaveDfe)) <> 44 then
    Result.Add('ChaveDfe', 'Chave da NFe ou NFCe inválida');
end;

end.
