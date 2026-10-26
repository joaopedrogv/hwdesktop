unit RegraRedBenefPcValidacaoFactoryUnit;

interface

uses
  SysUtils, Classes,
  IEntityValidatorUnit, RegraRedBenefPcEtdUnit;

type
  RegraRedBenefPcValidacaoFactory = class
  public
    class function Build(const Entity: RegraRedBenefPcEtd): IEntityValidator;
  end;

implementation

uses
  EntityValidatorFactoryUnit, RegraRedBenefPcMetadataUnit;

{ RegraRedBenefPcValidacaoFactory }

class function RegraRedBenefPcValidacaoFactory.Build(const Entity: RegraRedBenefPcEtd): IEntityValidator;
const
  CSTS_PC: array[1..6] of string = ('04', '05', '06', '07', '08', '09');
begin
  Result := EntityValidatorFactory.Builder( RegraRedBenefPcMetadata.GetMetadata() );

  Result.Field('Cst'                      , Entity.Cst).IsIn(CSTS_PC);
  Result.Field('Descricao'                , Entity.Descricao).IsRequired();
  Result.Field('PercReducao'              , Entity.PercReducao).IsRequired();
  Result.Field('DescricaoAjusteEFD'       , Entity.DescricaoAjusteEFD).IsRequired();
  Result.Field('InfComplementarAjusteEFD' , Entity.InfComplementarAjusteEFD).IsRequired();
  Result.Field('CodContaContabil'         , Entity.CodContaContabil).IsRequired();
  Result.Field('InicioVigencia'           , Entity.InicioVigencia).IsRequired();
  Result.Field('FimVigencia'              , Entity.FimVigencia).HasMinValue(Entity.InicioVigencia);

  if Length(Entity.NaturezasReceita) = 0 then
    Result.Add('NaturezasReceita', 'Informe pelo menos 1 item');
end;

end.