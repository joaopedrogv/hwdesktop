unit SalvarRegraFiscalIbsCbsUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IRegrasFiscaisIbsCbsRepositoryUnit,
  ITratamentoClassificacaoRepositoryUnit,
  RegraFiscalIbsCbsEtdUnit,
  CreateEntityUseCaseOutputUnit,
  SalvarRegraFiscalIbsCbsTypesUnit;

type
  {$IFDEF INTF_ON}
  ISalvarRegraFiscalIbsCbsUseCase = interface
    ['{8706C460-D4E2-48F5-999C-357F3BD2DCCB}']
    function Executar(Input: SalvarRegraFiscalIbsCbsUseCaseInput): CreateEntityUseCaseOutPut;
  end;
  {$ENDIF}

  {$IFDEF INTF_ON}
  SalvarRegraFiscalIbsCbsUseCase = class(BaseUseCase, ISalvarRegraFiscalIbsCbsUseCase)
  {$ELSE}
  SalvarRegraFiscalIbsCbsUseCase = class(BaseUseCase)
  {$ENDIF}
  private
    FRegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
    FTratamentoClassificacaoRepo: ITratamentoClassificacaoRepository;
  public
    constructor Create(
      const RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
      const TratamentoClassificacaoRepo: ITratamentoClassificacaoRepository
    );

    function Executar(Input: SalvarRegraFiscalIbsCbsUseCaseInput): CreateEntityUseCaseOutPut;
  end;

implementation

uses
  Sysutils, EntityValidatorFactoryUnit, IEntityValidatorUnit,
  LimitesBasicosUnit, TipoTributoEnumUnit, TratamentoClassificacaoEtdUnit,
  TratamentoClassificacaoRepositoryUnit, ValidationEntityOutputUnit,
  StringNullableUnit;

{ SalvarRegraFiscalIbsCbsUseCase }

constructor SalvarRegraFiscalIbsCbsUseCase.Create(
    const RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
    const TratamentoClassificacaoRepo: ITratamentoClassificacaoRepository
);
begin
  FRegrasFiscaisIbsCbsRepo := RegrasFiscaisIbsCbsRepo;
  FTratamentoClassificacaoRepo := TratamentoClassificacaoRepo;
end;

function SalvarRegraFiscalIbsCbsUseCase.Executar(Input: SalvarRegraFiscalIbsCbsUseCaseInput): CreateEntityUseCaseOutPut;
var
  validator: IEntityValidator;
  regraFiscal: RegraFiscalIbsCbsEtd;
  trClass: TratamentoClassificacaoEtd;
begin
  regraFiscal := Input.RegraFiscal;

  validator := EntityValidatorFactory.Builder();

  validator.Field('Descricao', regraFiscal.Descricao)
    .IsRequired().HasSize( 2, 128);

  validator.Field('CClassTrib', regraFiscal.CClassTrib)
    .IsRequired().HasSize( 6, 6 );
  {
  validator.Field('paliqcbs', regraFiscal.PAliqCbs)
    .HasMinValue( ZERO ).HasMaxValue( DECIMAL_0304_MAX );

  validator.Field('paliqibsuf', regraFiscal.PAliqIbsUF)
    .HasMinValue( ZERO ).HasMaxValue( DECIMAL_0304_MAX );

  validator.Field('paliqibsmun', regraFiscal.PAliqIbsMun)
    .HasMinValue( ZERO ).HasMaxValue( DECIMAL_0304_MAX );
  }

  validator.Field('pdifcbs', regraFiscal.PDifCbs)
    .HasMinValue( ZERO ).HasMaxValue( DECIMAL_0304_MAX );

  validator.Field('pdifibsuf', regraFiscal.PDifIbsUF)
    .HasMinValue( ZERO ).HasMaxValue( DECIMAL_0304_MAX );

  validator.Field('pdifibsmun', regraFiscal.PDifIbsMun)
    .HasMinValue( ZERO ).HasMaxValue( DECIMAL_0304_MAX );

  validator.FieldD('InicioVigencia', regraFiscal.InicioVigencia)
    .IsRequired();

  validator.Field('FimVigencia', regraFiscal.FimVigencia)
    .HasMinValue( regraFiscal.InicioVigencia, 'Final da vigência [@Value] menor que início [@MinValue] ' );


  if (regraFiscal.Id <> '')
    and not regraFiscal.RegraFiscalTribRegularId.IsNull
    and (regraFiscal.Id = regraFiscal.RegraFiscalTribRegularId.Value) then
    validator.Add(
      ValidationEntityItem.Create('RegraFiscalTribRegularId', 'Regra Fiscal da Tributação regular não pode ser a mesma, referencia circular não permitida')
    )
  else
  begin
    trClass := FTratamentoClassificacaoRepo.ObterTratamentoClassificacao(
      regraFiscal.CClassTrib, tbtCBS, regraFiscal.InicioVigencia
    );
    try
      if (trClass <> nil) and
        not trClass.TratamentoTributario.IsNull() then
      begin
        if trClass.TratamentoTributario.InExigeGrupoDesoneracao // Exige trib regula
          and not Input.ExigeTribRegENaoInformada               // Usuario nao preencheu e nao permitiu em tela
        then
          validator.Field('RegraFiscalTribRegularId', regraFiscal.RegraFiscalTribRegularId)
            .IsRequired();

        if not trClass.TratamentoTributario.InExigeGrupoDesoneracao  // Nao exige trib regular
          and not Input.TribRegInformadaIndevidamente                    // Usuario preencheu indevidamente
        then
          validator.Field('RegraFiscalTribRegularId', regraFiscal.RegraFiscalTribRegularId)
            .IsNull();
      end;
    finally
      trClass.Free();
    end;
  end;

  if not validator.IsValid() then
    Result := CreateEntityUseCaseOutPut.Create( validator.Result() )

  else if regraFiscal.Id = '' then
    Result := CreateEntityUseCaseOutPut.Create(
      FRegrasFiscaisIbsCbsRepo.Post( regraFiscal )
    )
  else
    Result := CreateEntityUseCaseOutPut.Create(
      FRegrasFiscaisIbsCbsRepo.Put( regraFiscal )
    );
end;

end.
