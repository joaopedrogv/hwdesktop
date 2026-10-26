unit ValidacaoNFSeFactoryUnit;

interface

uses
  SysUtils, Classes,
  NFSeEtdUnit, IEntityValidatorUnit;

type
  ValidacaoNFSeFactory = class
  private
    class function BuildComum(const Entity: NFSeEtd): IEntityValidator;
    class procedure BuildEmissaoPropria(const Entity: NFSeEtd; Validador: IEntityValidator );
  public
    class function BuildSalvarRascunho(const Entity: NFSeEtd): IEntityValidator;
    class function BuildEmitirNoWebService(const Entity: NFSeEtd): IEntityValidator;
    class function BuildEmitirNoPortal(const Entity: NFSeEtd): IEntityValidator;
  end;

implementation

uses
  StrUtils,
  EntityValidatorFactoryUnit, NumberServiceUnit, NFSeTypesUnit, NFSeTypesDisplayUnit, ValidationEntityOutputUnit,
  TipoComunsUnit, NFSeMetadataUnit;

{ ValidacaoNFSeFactory }

class function ValidacaoNFSeFactory.BuildEmitirNoWebService(const Entity: NFSeEtd): IEntityValidator;
begin
  Result := ValidacaoNFSeFactory.BuildComum( Entity );

  if Entity = nil then
    Exit;

  ValidacaoNFSeFactory.BuildEmissaoPropria( Entity, Result );

  case Entity.Situacao of
    sdpsExcluido:
      Result.Add( ValidationEntityItem.Create('Situacao', 'Registro não encontrado') );

    // sdpsRascunho: ; OK
    // sdpsRejeicao: ; OK
    sdpsEmissao,
    sdpsEmProcessamento,
    sdpsAutorizada,
    sdpsCancelada,
    sdpsSubstituida:
      Result.Add( ValidationEntityItem.Create('Situacao',
        Format( 'Situação atual [%s] atual não permite alterações', [SituacaoNFSeEnumStr[Entity.Situacao]])
      ));
  end;

  //Result.Field('NDps', Entity.NDps).IsRequired();

  if not Entity.DhEmi.IsNull then
    Result.FieldD('DCompet', Entity.DCompet.Value)
      .HasMaxValue(Entity.DhEmi.Value, 'Data Prestação não pode ser superior a data de emissão [@MaxValue]');

  Result.Field('CodServico', Entity.CodServico).IsRequired();
  if not Entity.IsPadraoNacional() then
  begin
    Result.Field('CCNAE', Entity.CCNAE).IsRequired();
    Result.Field('CLC116', Entity.CLC116).IsRequired();
    Result.Field('XDescServ', Entity.XDescServ)
      .IsRequired().HasSize( 1, 2000 );
  end
  else
  begin
    if Entity.LayoutNFSeComIbsCbs and (Entity.IndDest = 1) then
      Result.Field('DestIbsCbsId', Entity.DestIbsCbsId)
        .IsRequired('O indicador "Destinatário diferente do Tomador/Prestador" está marcado e o mesmo não foi informado');

    Result.Field('CTribNac', Entity.CTribNac).IsRequired();
    Result.Field('XDescServ', Entity.XDescServ)
      .IsRequired().HasSize( 1, 1000 );
  end;

  if Entity.Substituida <> nil then
  begin
    Result.Field('Substituida.CMotivo', Entity.Substituida.CMotivo).IsRequired();
    if Entity.IsPadraoNacional() then
    begin
      Result.Field('Substituida.Chave', Entity.Substituida.Chave).IsRequired();
      Result.Field('Substituida.XMotivo', Entity.Substituida.XMotivo).IsRequired().HasSize(15, 255);
    end
    else
      Result.Field('Substituida.NNFSe', Entity.Substituida.NNFSe).IsRequired();
  end;

  Result.Field('VServ', Entity.VServ)
    .HasToBeGreaterOrEqualsThan( (Entity.VDescIncond.Value
      + Entity.VRetIrrf.Value
      + Entity.VRetCsll.Value
      + NumberService.IfThenCurr( Entity.TpRetIssQn in [trRetidoPeloTomador, trRetidoPeloIntermediario], Entity.VIss.Value )
      + Entity.VRetPis.Value
      + Entity.VRetCofins.Value),
      'Valor do serviço prestado([@Value]) precisa ser maior ou igual que o valor do desconto somado as retenços dos tributos quando houver ([@MinValue])'
    );
end;

class function ValidacaoNFSeFactory.BuildComum(const Entity: NFSeEtd): IEntityValidator;
begin
  Result := EntityValidatorFactory.Builder( NFSeMetadata.GetMetadata() );

  if Entity = nil then
    Result.Add(ValidationEntityItem.Create('Id', 'Nenhuma NFSe encontrada com ID informado'))
  else if Entity.IsEmissaoPropria then
    Result.Field('TomadorId', Entity.CodCliente).IsRequired('Tomador de preenchimento obrigatório')
  else
    Result.Field('PrestadorId', Entity.CodCliente).IsRequired('Prestador de preenchimento obrigatório');
end;

class procedure ValidacaoNFSeFactory.BuildEmissaoPropria(const Entity: NFSeEtd; Validador: IEntityValidator);
const
  PIS_RETIDO_MSG = 'Quando PIS é retido o valor precisa ser maior que zero';
  COFINS_RETIDO_MSG = 'Quando COFINS é retido o valor precisa ser maior que zero';

begin
  if Entity.IsPisRetido() then
    Validador.Field('VRetPis', Entity.VRetPis).IsRequired(PIS_RETIDO_MSG)
      .HasToBeGreaterThan(0, PIS_RETIDO_MSG);

  if Entity.IsCofinsRetido() then
    Validador.Field('VRetCofins', Entity.VRetCofins).IsRequired(COFINS_RETIDO_MSG)
      .HasToBeGreaterThan(0, COFINS_RETIDO_MSG);

  if Entity.VRetPis.HasValue and (Entity.VRetPis.Value > 0) and not Entity.IsPisRetido() then
    Validador.Add(ValidationEntityItem.Create(
      'TpRetPisCofins', 'Valor PIS Retido preenchido, indicador de retenção do PIS não correspondente'
    ));
  if Entity.VRetCofins.HasValue and (Entity.VRetCofins.Value > 0) and not Entity.IsPisRetido() then
    Validador.Add(ValidationEntityItem.Create(
      'TpRetPisCofins', 'Valor COFINS Retido preenchido, indicador de retenção do COFINS não correspondente'
    ));
end;

class function ValidacaoNFSeFactory.BuildEmitirNoPortal(const Entity: NFSeEtd): IEntityValidator;
begin
  Result := ValidacaoNFSeFactory.BuildComum( Entity );

  if Entity.IsEmissaoPropria() then
    ValidacaoNFSeFactory.BuildEmissaoPropria( Entity, Result );

  case Entity.Situacao of
    sdpsExcluido:
      Result.Add( ValidationEntityItem.Create('Situacao', 'Registro não encontrado') );

    // sdpsRascunho: ; OK
    // sdpsRejeicao: ; OK
    sdpsEmissao,
    sdpsEmProcessamento,
    sdpsAutorizada,
    sdpsCancelada,
    sdpsSubstituida:
      Result.Add( ValidationEntityItem.Create('Situacao',
        Format( 'Situação atual [%s] atual não permite alterações', [SituacaoNFSeEnumStr[Entity.Situacao]])
      ));
  end;

  Result.Field('Serie', Entity.Serie).IsRequired();
  Result.Field('NNFSe', Entity.NNFSe).IsRequired();
  Result.Field('DhEmi', Entity.DhEmi).IsRequired();

  if not Entity.DhEmi.IsNull then
    Result.FieldD('DCompet', Entity.DCompet.Value)
      .HasMaxValue(Entity.DhEmi.Value, 'Data Prestação não pode ser superior a data de emissão [@MaxValue]');

  if not Entity.DhEmi.IsNull then
    Result.FieldD('DhProc', Entity.DhProc.Value)
      .HasMinValue(Entity.DhEmi.Value, 'Data Processamento não pode ser inferior a data de emissão [@MinValue]');

  Result.Field('CodServico', Entity.CodServico).IsRequired();
  Result.Field('XDescServ', Entity.XDescServ).IsRequired().HasSize( 1, 1000 );
  Result.Field('VServ', Entity.VServ).IsRequired()
    .HasMinValue(0)
    .HasToBeGreaterOrEqualsThan( (Entity.VDescIncond.Value
      + Entity.VRetIrrf.Value
      + Entity.VRetCsll.Value
      + NumberService.IfThenCurr( Entity.TpRetIssQn in [trRetidoPeloTomador, trRetidoPeloIntermediario], Entity.VIss.Value )
      + Entity.VRetPis.Value
      + Entity.VRetCofins.Value),
      'Valor do serviço prestado([@Value]) precisa ser maior ou igual que o valor do desconto somado as retenços dos tributos quando houver ([@MinValue])'
    );
end;

class function ValidacaoNFSeFactory.BuildSalvarRascunho(const Entity: NFSeEtd): IEntityValidator;
begin
  Result := ValidacaoNFSeFactory.BuildComum( Entity );

  case Entity.Situacao of
    sdpsExcluido:
      Result.Add( ValidationEntityItem.Create('Situacao', 'Registro não encontrado') );
    // sdpsRascunho: ; OK
    // sdpsRejeicao: ; OK
    sdpsEmissao,
    sdpsEmProcessamento,
    sdpsAutorizada,
    sdpsCancelada,
    sdpsSubstituida:
      Result.Add( ValidationEntityItem.Create('Situacao',
        Format( 'Situação atual [%s] atual não permite alterações', [SituacaoNFSeEnumStr[Entity.Situacao]])
      ));
  end;
end;

end.
