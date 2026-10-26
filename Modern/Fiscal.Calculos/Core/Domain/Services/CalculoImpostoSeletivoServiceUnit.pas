unit CalculoImpostoSeletivoServiceUnit;

interface

uses
  ImpostoSeletivoModelUnit,
  TipoComunsUnit,
  ItemCalculoInputUnit,
  TratamentoClassificacaoModelUnit,
  AliquotaImpostoSeletivoModelUnit, ITratamentosTributariosRepositoryUnit, IAvaliadorExpressaoAritmeticaServiceUnit;

type
  /// <summary>
  ///   Responsavel pelo calculo do imposto seletivo
  /// </summary>
  ICalculoImpostoSeletivoService = interface
    ['{B0766ED4-997A-4986-817A-25CB53E33D2B}']
    function Calcular(
      const Item: ItemCalculoInput;
      const Tratamento: TratamentoClassificacaoModel;
      const Aliquota: AliquotaImpostoSeletivoModel;
      Data: TDate
    ): ImpostoSeletivoModel;
  end;

  CalculoImpostoSeletivoService = class(TInterfacedObject, ICalculoImpostoSeletivoService)
  private
    FTratamentosTribRepo: ITratamentosTributariosRepository;
    FAvaliador: IAvaliadorExpressaoAritmeticaService;
  public
    constructor Create(
      TratamentosTribRepo: ITratamentosTributariosRepository;
      Avaliador: IAvaliadorExpressaoAritmeticaService
    );

    function Calcular(
      const Item: ItemCalculoInput;
      const Tratamento: TratamentoClassificacaoModel;
      const Aliquota: AliquotaImpostoSeletivoModel;
      Data: TDate
    ): ImpostoSeletivoModel;

  end;

implementation

uses
  SysUtils,
  Math,
  TratamentoTributarioEtdUnit,
  TipoTributoEnumUnit, StringNullableUnit, DoubleNullableUnit, CurrencyNullableUnit, NumberServiceUnit,
  ArredondamentoUtilsUnit;

{ CalculoImpostoSeletivoService }

constructor CalculoImpostoSeletivoService.Create(
  TratamentosTribRepo: ITratamentosTributariosRepository;
  Avaliador: IAvaliadorExpressaoAritmeticaService
);
begin
  FTratamentosTribRepo := TratamentosTribRepo;
  FAvaliador := Avaliador;
end;

function CalculoImpostoSeletivoService.Calcular(
  const Item: ItemCalculoInput;
  const Tratamento: TratamentoClassificacaoModel;
  const Aliquota:
  AliquotaImpostoSeletivoModel;
  Data: TDate
  ): ImpostoSeletivoModel;
var
  tratamentoTrib: TratamentoTributarioEtd;
  expressaoAliquota, expressaoBaseCalculo, expressaoAliquotaEfetiva, expressaoTributoCalculado,
  expressaoTributoDevido: StringNullable;
  cst, cClassTrib, unidade: string;
  variaveisBuilder: IVariaveisAvaliadorBuilder;

  valorPercentualReducao, valorAliquota, valorAliquotaAdValorem, resultadoAliquota,
  resultadoAliquotaEfetiva, resultadoBaseCalculo, resultadoTributoCalculado, resultadoTributoDevido: DoubleNullable;
  valorAjuste, valorRedutor, baseCalculoInformada, quantidade, impostoSeletivoInformado, impostoSeletivoCalculado,
  valorAliquotaPadraoOuReferencia, valorAliquotaReferencia, valorAliquotaAdRem: CurrencyNullable;
  aliquotaFinal: Currency;
begin
  tratamentoTrib := FTratamentosTribRepo.ObterTratamentoTributario( Tratamento.IdTratamentoTributario );

  expressaoAliquota              := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoAliquota.Value);
  expressaoBaseCalculo           := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoBaseCalculo);
  expressaoAliquotaEfetiva       := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoAliquotaEfetiva.Value);
  expressaoTributoCalculado      := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoTributoCalculado);
  expressaoTributoDevido         := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoTributoDevido);
  // String expressaoPercentualDiferimento = tratamentoTributario.getExpressaoPercentualDiferimento();
  // String expressaoValorDiferimento = tratamentoTributario.getExpressaoValorDiferimento();
  // Boolean incompativelComSuspensao = tratamentoTributario.isInIncompativelComSuspensao();
  // Boolean incompativelComSuspensaoDiferimento = tratamentoTributario.isInExigeGrupoDesoneracao();
  // Boolean possuiPercentualReducao = tratamentoTributario.isInPossuiPercentualReducao();
  // Boolean possuiAjuste = tratamentoTributario.isInPossuiAjuste();
  // Boolean possuiRedutor = tratamentoTributario.isInPossuiRedutor();

  valorPercentualReducao.SetNull();
  valorAjuste.SetNull();
  valorRedutor.SetNull();

  cst := Item.ImpostoSeletivo.Cst;
  cClassTrib := Item.ImpostoSeletivo.CClassTrib;
  unidade := Item.ImpostoSeletivo.Unidade;
  baseCalculoInformada.SetValue( Item.ImpostoSeletivo.BaseCalculo );
  quantidade.SetValue( Item.ImpostoSeletivo.Quantidade );
  impostoSeletivoInformado.SetValue( Item.ImpostoSeletivo.ValorImpostoSeletivoInformado );
  impostoSeletivoCalculado.SetNull();

  /////////////////////////////////
  valorAliquotaPadraoOuReferencia.SetNull();
  valorAliquotaReferencia.SetNull();
  valorAliquotaAdValorem.SetNull();
  valorAliquotaAdRem.SetNull();
  valorAliquota.SetNull();
  /////////////////////////////////

  valorAliquotaAdValorem := DoubleNullable.Create( Aliquota.AliquotaAdValorem.Value, Aliquota.AliquotaAdValorem.IsNull );
  if not valorAliquotaAdValorem.IsNull then
    valorAliquotaAdValorem.SetValue( ArredondamentoUtils.DividirPorCem( valorAliquotaAdValorem.Value ));
  valorAliquotaAdRem := CurrencyNullable.Create( Aliquota.AliquotaAdRem.Value, Aliquota.AliquotaAdRem.IsNull );

  /////////////////////////////
  resultadoAliquota.SetNull();
  resultadoAliquotaEfetiva.SetNull();
  resultadoBaseCalculo.SetNull();
  resultadoTributoCalculado.SetNull();
  // novos
  resultadoTributoDevido.SetNull();
  /////////////////////////////

  variaveisBuilder := VariaveisAvaliadorBuilder.Create()
    .Quantidade(quantidade.Value)
    .Aliquota(valorAliquota.Value)
    .PercentualReducao(valorPercentualReducao.Value)
    .AliquotaPadraoOuReferencia(valorAliquotaPadraoOuReferencia.Value)
    .AliquotaReferencia(valorAliquotaReferencia.Value)
    .AliquotaAdValorem(valorAliquotaAdValorem.Value)
    .AliquotaAdRem(valorAliquotaAdRem.Value)
    .Ajuste(valorAjuste.Value)
    .Redutor(valorRedutor.Value);

  {$REGION 'Aliquota'}
  if not expressaoAliquota.IsNullOrWhiteSpace() then
    resultadoAliquota.SetValue(FAvaliador.Evaluate(expressaoAliquota.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA));
  // if (!isNullOrEmpty(expressaoAliquota)) {
  //     var variaveis0 = ofEntries(
  //             entry(ALIQUOTA, valorAliquota)),
  //             entry(QUANTIDADE, quantidade)),
  //             entry(PERCENTUAL_REDUCAO, valorPercentualReducao)),
  //             entry(ALIQUOTA_PADRAO_OU_REFERENCIA, valorAliquotaPadraoOuReferencia)),
  //             entry(ALIQUOTA_REFERENCIA, valorAliquotaReferencia)),
  //             entry(ALIQUOTA_AD_VALOREM, valorAliquotaAdValorem)),
  //             entry(ALIQUOTA_AD_REM, valorAliquotaAdRem)),
  //             entry(AJUSTE, valorAjuste)),
  //             entry(REDUTOR, valorRedutor)));
  //     resultadoAliquota = avaliador.evaluate(expressaoAliquota, variaveis0, 4);
  // }
  {$ENDREGION}

  {$REGION 'AliquotaEfetiva'}
  if not expressaoAliquotaEfetiva.IsNullOrWhiteSpace() then
    resultadoAliquotaEfetiva.SetValue(FAvaliador.Evaluate(expressaoAliquotaEfetiva.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA));
  // if (!isNullOrEmpty(expressaoAliquotaEfetiva)) {
  //     var variaveis1 = ofEntries(
  //             entry(QUANTIDADE, quantidade),
  //             entry(ALIQUOTA, resultadoAliquota),
  //             entry(PERCENTUAL_REDUCAO, valorPercentualReducao),
  //             entry(ALIQUOTA_PADRAO_OU_REFERENCIA, valorAliquotaPadraoOuReferencia),
  //             entry(ALIQUOTA_REFERENCIA, valorAliquotaReferencia),
  //             entry(ALIQUOTA_AD_VALOREM, valorAliquotaAdValorem),
  //             entry(ALIQUOTA_AD_REM, valorAliquotaAdRem),
  //             entry(AJUSTE, valorAjuste),
  //             entry(REDUTOR, valorRedutor));
  //     resultadoAliquotaEfetiva = avaliador.evaluate(expressaoAliquotaEfetiva, variaveis1, 4);
  // }
  {$ENDREGION}

  variaveisBuilder.Aliquota(resultadoAliquota.Value);// isso viria do que esta comentado, aqui ainda esta null
  variaveisBuilder.AliquotaEfetiva(resultadoAliquotaEfetiva.Value); // aqui também

  {$REGION 'BaseCalculo'}
  variaveisBuilder
    .ImpostoSeletivoInformado(impostoSeletivoInformado.Value)
    .BaseCalculoInformada(baseCalculoInformada.Value )
    .ImpostoSeletivoCalculado(impostoSeletivoCalculado.Value);

  resultadoBaseCalculo.SetValue( FAvaliador.Evaluate( expressaoBaseCalculo.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA));

  if NumberService.RoundHalfUpTo2(resultadoBaseCalculo.Value) < ZeroValue then
  begin
    resultadoBaseCalculo.SetValue( ZeroValue );
            // aqui deveria ser lançada uma exceção
            // flexibilidade para a plataforma
  end;

  variaveisBuilder.BaseCalculo(resultadoBaseCalculo.Value);
  {$ENDREGION}

  {$REGION 'TributoCalculado'}
  resultadoTributoCalculado.SetValue( FAvaliador.Evaluate(
    expressaoTributoCalculado.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA
  ));

  if SimpleRoundTo(resultadoTributoCalculado.Value, -2) < ZeroValue then
    resultadoTributoCalculado.SetValue( ZeroValue );

  variaveisBuilder.TributoCalculado(resultadoTributoCalculado.Value);
  {$ENDREGION}

  {$REGION 'TributoDevido'}
  if not ExpressaoTributoDevido.IsNullOrWhiteSpace() then
    resultadoTributoDevido.SetValue(FAvaliador.Evaluate(expressaoTributoDevido.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA));
  {$ENDREGION}

  // pIS e a aliquota ad valorem em percentual (nao dividida por 100), conforme
  // CalculoImpostoSeletivoService.java (movePointRight(2) de dividirPorCem(rate)).
  // Usar o valor original evita o round-trip Double->Currency que colapsaria
  // aliquotas com 3-4 casas decimais.
  if Aliquota.AliquotaAdValorem.HasValue then
    aliquotaFinal := Aliquota.AliquotaAdValorem.Value
  else
    aliquotaFinal := 0;

  Result := ImpostoSeletivoModel.Create(
    Item.CSTInt,
    item.cClassTrib,
    NumberService.RoundHalfUpTo2(resultadoBaseCalculo.Value),
    aliquotaFinal,
    valorAliquotaAdRem.Value,
    unidade,
    quantidade.Value,
    NumberService.RoundHalfUpTo2(resultadoTributoDevido.Value),
    ''
  );
end;

end.
