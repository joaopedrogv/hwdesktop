unit CalculoCbsIbsServiceUnit;

interface

uses
  TipoTributoEnumUnit, TipoComunsUnit, DoubleNullableUnit, ItemCalculoInputUnit, TratamentoClassificacaoModelUnit,
  ResultadoCbsIbsUnit, IPercentualReducaoRepositoryUnit, IAliquotaReferenciaRepositoryUnit, CurrencyNullableUnit,
  IAliquotaPadraoRepositoryUnit, IAliquotaAdRemProdutoRepositoryUnit, ReducaoAliquotaModelUnit, DiferimentoModelUnit,
  ResultadoTributacaoRegularUnit, ResultadoGrupoMonofasiaUnit, ITratamentosTributariosRepositoryUnit,
  IClassificacaoTributariaRepositoryUnit, ClassificacaoTributariaCalculoModelUnit,
  IAliquotaAdValoremServicoRepositoryUnit, IAvaliadorExpressaoAritmeticaServiceUnit,
  TipoEnteGovernamentalEnumUnit, TributacaoCompraGovernamentalModelUnit, ISituacaoTributariaServiceUnit;

type
  /// <summary>
  ///   Responsavel por distribuir as chamadas de calculo do CBS e IBS
  /// </summary>
  ICalculoCbsIbsService = interface
    ['{4C2D9DCF-2CAC-488F-849C-BDD839D7B4C3}']
    function Calcular(
      TipoTributo: TipoTributoEnum;
      CodigoUF: Integer;
      CodigoMun: Integer;
      const Item: ItemCalculoInput;
      const Tratamento: TratamentoClassificacaoModel;
      const ValorImpostoSeletivoCalculado: Currency;
      const TratamentoTribRegular: TratamentoClassificacaoModel;
      TemTributacaoRegular: Boolean;
      Data: TDate;
      TpEnteGov: TipoEnteGovernamental;
      PRedutorCompraGov: Currency
    ): ResultadoCbsIbs;
  end;

  CalculoCbsIbsService = class(TInterfacedObject, ICalculoCbsIbsService)
  private
    FPercentualReducaoRepo: IPercentualReducaoRepository;
    FAliquotaReferenciaRepo: IAliquotaReferenciaRepository;
    FAliquotaPadraoRepo: IAliquotaPadraoRepository;
    FAliquotaAdRemProdutoRepo: IAliquotaAdRemProdutoRepository;
    FAliquotaAdValoremServicoRepo: IAliquotaAdValoremServicoRepository;
    FTratamentosTribRepo: ITratamentosTributariosRepository;
    FClassificacoesTribRepo: IClassificacaoTributariaRepository;
    FAvaliador: IAvaliadorExpressaoAritmeticaService;
    FSituacaoTributariaService: ISituacaoTributariaService;

    function BuscarAliquotaPadrao(
      TipoTributo: TipoTributoEnum;
      CodigoUf: Integer;
      CodigoMunicipio: Integer;
      Data: TDate
    ): Double;

    function BuscarPercentualReducao(
      ClassificacaoTributariaId: Integer; TipoTributo: TipoTributoEnum; Data: TDate
    ): CurrencyNullable;
    function BuscarAliquotaReferencia(TipoTributo: TipoTributoEnum; Data: TDate): Double;
    function BuscarAliquotaUniformeSetorial(
      const CodioNBS: string; TipoTributo: TipoTributoEnum; ClassificacaoTributariaId: Integer; Data: TDate
    ): Double;
    function BuscarAliquotaFixa(
      TipoTributo: TipoTributoEnum; ClassificacaoTributariaId: Integer; Data: TDate
    ): Double;

    function ObterGrupoReducao(
      AliquotaEfetiva, PercentualReducao: CurrencyNullable; AliquotaDivididaPorCem: Boolean
    ): ReducaoAliquotaModel;

    function ObterGrupoCompraGov(
      TpEnteGov: TipoEnteGovernamental;
      TipoTributo: TipoTributoEnum;
      Aliquota, Valor: Currency
    ): TributacaoCompraGovernamentalModel;

    function ObterGrupoDesoneracao(
      const Cst, cClassTrib: string;
      BaseCalculo, Aliquota: Currency;
      PercentualReducao: CurrencyNullable;
      AliquotaDivididaPorCem, PossuiPercentualReducao: Boolean
    ): ResultadoTributacaoRegular;

    function ObterGrupoDiferimento(ValorDiferimento, PercentualDiferimento: DoubleNullable): DiferimentoModel;

    function ObterGrupoMonofasia(
      const ClassificacaoTrib: ClassificacaoTributariaCalculoModel;
      Quantidade: Currency; AliquotaAdRemPrincipal, AliquotaAdRemSecundaria: DoubleNullable;
      TributoCalculado, TributoDevido: Currency; VariacaoPontoPercentual: DoubleNullable
    ): ResultadoGrupoMonofasia;

    function ObterFatorBioCombustivel(): Double;
  public
    constructor Create(
      PercentualReducaoRepo: IPercentualReducaoRepository;
      AliquotaReferenciaRepo: IAliquotaReferenciaRepository;
      AliquotaPadraoRepo: IAliquotaPadraoRepository;
      AliquotaAdRemProdutoRepo: IAliquotaAdRemProdutoRepository;
      AliquotaAdValoremServicoRepo: IAliquotaAdValoremServicoRepository;
      TratamentosTribRepo: ITratamentosTributariosRepository;
      ClassificacoesTribRepo: IClassificacaoTributariaRepository;
      Avaliador: IAvaliadorExpressaoAritmeticaService;
      SituacaoTributariaServ: ISituacaoTributariaService
    );

    function Calcular(
      TipoTributo: TipoTributoEnum;
      CodigoUF: Integer;
      CodigoMun: Integer;
      const Item: ItemCalculoInput;
      const Tratamento: TratamentoClassificacaoModel;
      const ValorImpostoSeletivoCalculado: Currency;
      const TratamentoTribRegular: TratamentoClassificacaoModel; // Paramtro TratamentoTribRegular para geracao correta gred
      TemTributacaoRegular: Boolean;
      Data: TDate;
      TpEnteGov: TipoEnteGovernamental;
      PRedutorCompraGov: Currency
    ): ResultadoCbsIbs;
  end;

implementation

uses
  SysUtils, StrUtils, Math,
  TratamentoTributarioEtdUnit, DateTimeServiceUnit, NumberServiceUnit,
  DecimalCalculoUnit, ArredondamentoCalculoUnit,
  ResultadoGrupoEtapaMonofasiaUnit, ResultadoGrupoDiferimentoMonofasiaUnit, TratamentoClassificacaoEtdUnit,
  ClassificacaoTributariaEtdUnit, SituacaoTributariaEtdUnit, StringNullableUnit, AliquotaResultadoModelUnit,
  IntegerNullableUnit;

type
  TipoAliquotaEnum = (taPadrao, taUniformeNacional, taUniformeSetorial, taFixa, taSemAliquota, taAliquotaCombinada);

const
  CONST_PBIO                     = 30;
  CONST_PDIF                     = 100;
  CONST_VARIACAO_EAC             = 5;
  CONST_ALIQUOTA_EAC             = 0.1922;
  CONST_ALIQUOTA_GASOLINA_TIPO_A = 0.7925;

function PublicarAliquota(const AFracao: DecimalCalculo): DecimalCalculo;
var
  percentual: DecimalCalculo;
begin
  percentual := ArredondamentoCalculo.FracaoParaPercentual(AFracao);
  percentual := ArredondamentoCalculo.AliquotaPublicada(percentual);
  Result := ArredondamentoCalculo.PercentualParaFracao(percentual);
end;

{ CalculoCbsIbsService }

constructor CalculoCbsIbsService.Create(
  PercentualReducaoRepo: IPercentualReducaoRepository;
  AliquotaReferenciaRepo: IAliquotaReferenciaRepository;
  AliquotaPadraoRepo: IAliquotaPadraoRepository;
  AliquotaAdRemProdutoRepo: IAliquotaAdRemProdutoRepository;
  AliquotaAdValoremServicoRepo: IAliquotaAdValoremServicoRepository;
  TratamentosTribRepo: ITratamentosTributariosRepository;
  ClassificacoesTribRepo: IClassificacaoTributariaRepository;
  Avaliador: IAvaliadorExpressaoAritmeticaService;
  SituacaoTributariaServ: ISituacaoTributariaService
);
begin
  FPercentualReducaoRepo        := PercentualReducaoRepo;
  FAliquotaReferenciaRepo       := AliquotaReferenciaRepo;
  FAliquotaPadraoRepo           := AliquotaPadraoRepo;
  FAliquotaAdRemProdutoRepo     := AliquotaAdRemProdutoRepo;
  FAliquotaAdValoremServicoRepo := AliquotaAdValoremServicoRepo;
  FTratamentosTribRepo          := TratamentosTribRepo;
  FClassificacoesTribRepo       := ClassificacoesTribRepo;
  FAvaliador                    := Avaliador;
  FSituacaoTributariaService    := SituacaoTributariaServ;
end;

function CalculoCbsIbsService.ObterFatorBioCombustivel: Double;
var
  fator: DecimalCalculo;
begin
  fator := DecimalCalculo.DeInteiro(CONST_PBIO);
  fator := fator.Dividir(DecimalCalculo.DeInteiro(100 - CONST_PBIO));
  Result := fator.ParaDouble;
end;

function CalculoCbsIbsService.ObterGrupoDesoneracao(
  const Cst, cClassTrib: string;
  BaseCalculo, Aliquota: Currency;
  PercentualReducao: CurrencyNullable;
  AliquotaDivididaPorCem, PossuiPercentualReducao: Boolean
): ResultadoTributacaoRegular;
var
  aliquotaEfetiva, tributoDevido, aliquotaPublicada, redutor, um: DecimalCalculo;
  aliquotaCurrency, tributoCurrency: Currency;
begin
  aliquotaEfetiva := DecimalCalculo.DeCurrency(Aliquota);
  aliquotaEfetiva := ArredondamentoCalculo.PercentualParaFracao(aliquotaEfetiva);

  if PossuiPercentualReducao and not PercentualReducao.IsNull then
  begin
    redutor := DecimalCalculo.DeCurrency(PercentualReducao.Value);
    redutor := ArredondamentoCalculo.PercentualParaFracao(redutor);
    um := DecimalCalculo.DeInteiro(1);
    redutor := um.Subtrair(redutor);
    aliquotaEfetiva := aliquotaEfetiva.Multiplicar(redutor);
  end;

  if AliquotaDivididaPorCem then
    aliquotaEfetiva := PublicarAliquota(aliquotaEfetiva);

  tributoDevido := DecimalCalculo.DeCurrency(BaseCalculo);
  tributoDevido := tributoDevido.Multiplicar(aliquotaEfetiva);
  tributoDevido := ArredondamentoCalculo.ValorFiscal(tributoDevido);

  if AliquotaDivididaPorCem then
    aliquotaPublicada := ArredondamentoCalculo.FracaoParaPercentual(aliquotaEfetiva)
  else
    aliquotaPublicada := aliquotaEfetiva;

  aliquotaCurrency := aliquotaPublicada.ParaCurrency;
  tributoCurrency := tributoDevido.ParaCurrency;
  Result := ResultadoTributacaoRegular.Create(
    Cst, cClassTrib, BaseCalculo, aliquotaCurrency, tributoCurrency
  );
end;

function CalculoCbsIbsService.ObterGrupoDiferimento(ValorDiferimento,
  PercentualDiferimento: DoubleNullable): DiferimentoModel;
begin
  if ValorDiferimento.IsNull or PercentualDiferimento.IsNull then
    Result := DiferimentoModel.NullInstance()

  else
    Result := DiferimentoModel.Create(
      NumberService.RoundHalfUpTo4( NumberService.MovePointRightCurr(PercentualDiferimento.Value, 2)),
      NumberService.RoundHalfUpTo2(ValorDiferimento.Value)
    );
end;

function CalculoCbsIbsService.ObterGrupoMonofasia(
  const ClassificacaoTrib: ClassificacaoTributariaCalculoModel;
  Quantidade: Currency; AliquotaAdRemPrincipal, AliquotaAdRemSecundaria: DoubleNullable;
  TributoCalculado, TributoDevido: Currency; VariacaoPontoPercentual: DoubleNullable
): ResultadoGrupoMonofasia;
var
  grupoGMonoPadrao, grupoGMonoReten, grupoGMonoRet: ResultadoGrupoEtapaMonofasia;
  grupoGMonoDiferimento: ResultadoGrupoDiferimentoMonofasia;
  quantidadeFinal, aliquotaFinal: Double;
begin
  if ClassificacaoTrib.InGrupoMonofasiaPadrao then
  begin
    if not ClassificacaoTrib.InGrupoMonofasiaRet then
    begin
      quantidadeFinal := Quantidade;
      aliquotaFinal := AliquotaAdRemPrincipal.Value;
    end
    else
    begin
      quantidadeFinal := (Quantidade * VariacaoPontoPercentual.Value) / 100;
      aliquotaFinal := AliquotaAdRemSecundaria.Value;
    end;

    grupoGMonoPadrao := ResultadoGrupoEtapaMonofasia.Create(
      quantidadeFinal,
      aliquotaFinal,
      TributoCalculado
    );
  end
  else
    grupoGMonoPadrao := ResultadoGrupoEtapaMonofasia.NullInstance();

  if ClassificacaoTrib.InGrupoMonofasiaReten then
    grupoGMonoReten := ResultadoGrupoEtapaMonofasia.Create(
      Quantidade * ObterFatorBioCombustivel(),
      AliquotaAdRemSecundaria.Value,
      TributoDevido
    )
  else
    grupoGMonoReten := ResultadoGrupoEtapaMonofasia.NullInstance();

  if ClassificacaoTrib.InGrupoMonofasiaRet then
    grupoGMonoRet := ResultadoGrupoEtapaMonofasia.Create(
      Quantidade,
      AliquotaAdRemPrincipal.Value,
      TributoDevido
    )
  else
    grupoGMonoRet := ResultadoGrupoEtapaMonofasia.NullInstance();

  if ClassificacaoTrib.InGrupoMonofasiaDiferimento then
    grupoGMonoDiferimento := ResultadoGrupoDiferimentoMonofasia.Create(
      TributoCalculado - TributoDevido,
      NumberService.MovePointRightCurr((TributoCalculado - TributoDevido) / TributoCalculado, 2)
    )
  else
    grupoGMonoDiferimento := ResultadoGrupoDiferimentoMonofasia.NullInstance();

  if not ClassificacaoTrib.InGrupoMonofasiaPadrao
    and not ClassificacaoTrib.InGrupoMonofasiaReten
    and not ClassificacaoTrib.InGrupoMonofasiaRet
    and not ClassificacaoTrib.InGrupoMonofasiaDiferimento
  then
    Result := ResultadoGrupoMonofasia.NullInstance()

  else
    Result := ResultadoGrupoMonofasia.Create( grupoGMonoPadrao, grupoGMonoReten, grupoGMonoRet, grupoGMonoDiferimento );
end;

function CalculoCbsIbsService.ObterGrupoReducao(
  AliquotaEfetiva, PercentualReducao: CurrencyNullable; AliquotaDivididaPorCem: Boolean
): ReducaoAliquotaModel;
var
  pAliqEfet, pRedAliq: Currency;
  valorDecimal: DecimalCalculo;
begin
  if AliquotaEfetiva.IsNull or PercentualReducao.IsNull then
    Result := ReducaoAliquotaModel.NullInstance()

  else
  begin
    if AliquotaDivididaPorCem then
      pAliqEfet := AliquotaEfetiva.Value
    else
    begin
      valorDecimal := DecimalCalculo.DeCurrency(AliquotaEfetiva.Value);
      valorDecimal := ArredondamentoCalculo.PercentualParaFracao(valorDecimal);
      pAliqEfet := valorDecimal.ParaCurrency;
    end;

    pRedAliq := PercentualReducao.Value;

    Result := ReducaoAliquotaModel.Create(pRedAliq, pAliqEfet);
  end;
end;

function CalculoCbsIbsService.BuscarAliquotaPadrao(
  TipoTributo: TipoTributoEnum; CodigoUf, CodigoMunicipio: Integer; Data: TDate
): Double;
var
  aliquota: AliquotaResultadoModel;
  cMun, cUF: IntegerNullable;
  aliquotaDecimal: DecimalCalculo;
begin
  cMun := IntegerNullable.CreateOrNull(CodigoMunicipio);
  cUF := IntegerNullable.CreateOrNull(CodigoUf);

  aliquota := FAliquotaPadraoRepo.ObterAliquota( TipoTributo, cUF, cMun, Data );

  if aliquota = nil then
    raise Exception.CreateFmt(
      'Alíquota de referencia ou padrão não encontrada para o tributo com id %d, UF %s, município %s e data %s',
      [Ord(TipoTributo), cUF.ToText(), cMun.ToText(), DateToStr(Data) ]
    );

  try
    aliquotaDecimal := ArredondamentoCalculo.PercentualParaFracao(DecimalCalculo.DeCurrency(aliquota.ValorAplicavel));
    Result := aliquotaDecimal.ParaDouble;
  finally
    aliquota.Free();
  end;
end;

function CalculoCbsIbsService.BuscarAliquotaReferencia(TipoTributo: TipoTributoEnum; Data: TDate): Double;
var
  aliquota: CurrencyNullable;
  aliquotaDecimal: DecimalCalculo;
begin
  aliquota := FAliquotaReferenciaRepo.ObterPorTipoTributo( TipoTributo, Data );
  if aliquota.IsNull then
    raise Exception.CreateFmt(
      'Alíquota de referência não encontrada para o tributo com id %s e data %s',
      [Ord(TipoTributo), DateToStr(Data) ]
    );

  aliquotaDecimal := ArredondamentoCalculo.PercentualParaFracao(DecimalCalculo.DeCurrency(aliquota.Value));
  Result := aliquotaDecimal.ParaDouble;
end;

function CalculoCbsIbsService.BuscarAliquotaUniformeSetorial(
  const CodioNBS: string; TipoTributo: TipoTributoEnum; ClassificacaoTributariaId: Integer; Data: TDate
): Double;
var
  aliquotaUniformeSetorial: CurrencyNullable;
  aliquotaDecimal: DecimalCalculo;
begin
  aliquotaUniformeSetorial := FAliquotaAdValoremServicoRepo.ObterAliquotaAdValorem(
    CodioNBS, TipoTributo, ClassificacaoTributariaId, Data
  );
  if aliquotaUniformeSetorial.IsNull then
  begin
    aliquotaUniformeSetorial := FAliquotaAdValoremServicoRepo.ObterAliquotaAdValoremPorClassificacaoTributaria(
      TipoTributo, ClassificacaoTributariaId, Data
    );
    if aliquotaUniformeSetorial.IsNull then
      raise Exception.CreateFmt('Alíquota uniforme setorial não encontrada em %s', [ DateService.ParseLocal(Data) ]);
  end;
  aliquotaDecimal := ArredondamentoCalculo.PercentualParaFracao(DecimalCalculo.DeCurrency(aliquotaUniformeSetorial.Value));
  Result := aliquotaDecimal.ParaDouble;
end;

function CalculoCbsIbsService.BuscarPercentualReducao(ClassificacaoTributariaId: Integer; TipoTributo: TipoTributoEnum;
  Data: TDate): CurrencyNullable;
begin
  Result := FPercentualReducaoRepo.ObterporClassTribETributo( ClassificacaoTributariaId, TipoTributo, Data );

  if Result.IsNull then
    raise Exception.CreateFmt('Percentual de redução não encontrado para classificação tributária com id %d e data %s',
      [ ClassificacaoTributariaId, DateService.Parse(Data) ]);
end;

function CalculoCbsIbsService.BuscarAliquotaFixa(
  TipoTributo: TipoTributoEnum; ClassificacaoTributariaId: Integer; Data: TDate
): Double;
var
  aliquotaFixa: CurrencyNullable;
  aliquotaDecimal: DecimalCalculo;
begin
  aliquotaFixa := FAliquotaAdValoremServicoRepo.ObterAliquotaAdValoremPorClassificacaoTributaria(
    TipoTributo, ClassificacaoTributariaId, Data
  );
  if aliquotaFixa.IsNull then
    raise Exception.CreateFmt('Alíquota fixa não encontrada em %s', [ DateService.ParseLocal(Data) ]);

  aliquotaDecimal := ArredondamentoCalculo.PercentualParaFracao(DecimalCalculo.DeCurrency(aliquotaFixa.Value));
  Result := aliquotaDecimal.ParaDouble;
end;

function CalculoCbsIbsService.Calcular(
  TipoTributo: TipoTributoEnum;
  CodigoUF: Integer;
  CodigoMun: Integer;
  const Item: ItemCalculoInput;
  const Tratamento: TratamentoClassificacaoModel;
  const ValorImpostoSeletivoCalculado: Currency;
  const TratamentoTribRegular: TratamentoClassificacaoModel;
  TemTributacaoRegular: Boolean;
  Data: TDate;
  TpEnteGov: TipoEnteGovernamental;
  PRedutorCompraGov: Currency
): ResultadoCbsIbs;

var
  expressaoAliquota, expressaoBaseCalculo, expressaoAliquotaEfetiva, expressaoTributoCalculado, expressaoTributoDevido,
  expressaoPercentualDiferimento, expressaoValorDiferimento: StringNullable;

  tratamentoTrib: TratamentoTributarioEtd;
  tratTribDesoneracao: TratamentoTributarioEtd; // Adicionado para preencher o grupo gRed, ex: 200024
  resultadoCbsIbsRedDeson: ResultadoCbsIbs;
  classificacaoTrib: ClassificacaoTributariaCalculoModel;
  situacaoTributaria: SituacaoTributariaEtd;
  percentualReducao: CurrencyNullable;
  //inputExpressao: ExpressaoInput;
  variaveisBuilder: IVariaveisAvaliadorBuilder;
  variaveis: VariaveisAvaliador;
  grupoReducao: ReducaoAliquotaModel;
  grupoDesoneracao: ResultadoTributacaoRegular;
  compraGovernamental: TributacaoCompraGovernamentalModel;
  //grupoDiferimento: DiferimentoModel;
  cst, cClassTrib: string;
  possuiAjuste, possuiPercentualReducao, aliquotaDivididaPorCem: Boolean;
  tipoAliquota: TipoAliquotaEnum;
  //TemTributacaoRegular: Boolean;

  valorAjuste, valorRedutor, baseCalculoInformada, quantidade, impostoSeletivoInformado,
  valorAliquotaPadraoOuReferencia, valorAliquotaReferencia, valorAliquotaAdValorem, valorAliquotaAdRem,
  valorAliquotaAdRemPrincipal, valorAliquotaAdRemSecundaria, variacaoPontoPercentual,
  valorPercentualReducao, valorAliquota, pBio, pDif,
  resultadoPercentualDiferimento, resultadoValorDiferimento: DoubleNullable;
  resultadoAliquota, resultadoAliquotaEfetiva, resultadoBaseCalculo,
  resultadoTributoCalculado, resultadoTributoDevido: CurrencyNullable;
  resultadoAliquotaDecimal, resultadoAliquotaEfetivaDecimal, resultadoBaseCalculoDecimal,
  resultadoTributoCalculadoDecimal, resultadoTributoDevidoDecimal,
  resultadoPercentualDiferimentoDecimal, resultadoValorDiferimentoDecimal: DecimalCalculo;
  fatorPercentual, aliquotaDecimal, aliquotaPublicadaDecimal: DecimalCalculo;
  aliquotaFinal: Currency;
begin
  cst := '';
  cClassTrib := '';
  compraGovernamental := TributacaoCompraGovernamentalModel.NullInstance();
  //exprBuilder := nil;
  //valorAliquota := NULL_NUMBER;

  tratamentoTrib := FTratamentosTribRepo.ObterTratamentoTributario( Tratamento.IdTratamentoTributario );
  classificacaoTrib := FClassificacoesTribRepo.ObterClassificacaoCalculo( Tratamento.IdClassificacaoTributaria );

  situacaoTributaria := FSituacaoTributariaService.ConsultarSituacaoTributariaPorCodigo(Item.CST, TipoTributo, Data);

  if TemTributacaoRegular then
  begin
    cst := Item.TributacaoRegular.CST;
    cClassTrib := Item.TributacaoRegular.cClassTrib;
  end;

  expressaoAliquota              := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoAliquota.Value);
  expressaoBaseCalculo           := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoBaseCalculo);
  expressaoAliquotaEfetiva       := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoAliquotaEfetiva.Value);
  expressaoTributoCalculado      := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoTributoCalculado);
  expressaoTributoDevido         := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoTributoDevido);
  expressaoPercentualDiferimento := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoPercentualDiferimento.Value);
  expressaoValorDiferimento      := StringNullable.CreateOrNull(tratamentoTrib.ExpressaoValorDiferimento.Value);

  possuiAjuste := tratamentoTrib.InPossuiAjuste;
  if possuiAjuste then
    raise Exception.CreateFmt('Falta implementar ajuste - Id %d - cClassTrib: %s', [classificacaoTrib.Id, classificacaoTrib.Codigo]);

  {
  boolean incompativelComSuspensao = tratamentoTributario.isInIncompativelComSuspensao();
  boolean exigeGrupoDesoneracao = tratamentoTributario.isInExigeGrupoDesoneracao();
  boolean possuiAjuste = tratamentoTributario.isInPossuiAjuste();
  boolean possuiRedutor = tratamentoTributario.isInPossuiRedutor();
  }

  possuiPercentualReducao := tratamentoTrib.InPossuiPercentualReducao;

  valorPercentualReducao.SetNull();
  valorAjuste.SetNull();
  valorRedutor.SetNull();
  percentualReducao := CurrencyNullable.NullInstance();

  baseCalculoInformada.SetValue( Item.BaseCalculo.Value );
  quantidade.SetValue( Item.QuantidadeEfetiva );
  impostoSeletivoInformado.SetNull();

  if not Item.ImpostoSeletivo.IsNull and (NumberService.RoundHalfUpTo2(ValorImpostoSeletivoCalculado) > 0) then
    impostoSeletivoInformado.SetValue( item.ImpostoSeletivo.ValorImpostoSeletivoInformado );

  /////////////////////////////////
  valorAliquotaPadraoOuReferencia.SetNull();
  valorAliquotaReferencia.SetNull();
  valorAliquotaAdValorem.SetNull();
  valorAliquotaAdRem.SetNull();
  valorAliquota.SetNull();
  // para tratar a monofasia
  valorAliquotaAdRemPrincipal.SetNull();
  valorAliquotaAdRemSecundaria.SetNull();
  variacaoPontoPercentual.SetNull();
  pBio.SetNull();
  pDif.SetNull();
  /////////////////////////////////

  /////////////////////////////
  resultadoAliquota.SetNull();
  resultadoAliquotaEfetiva.SetNull();
  resultadoBaseCalculo.SetNull();
  resultadoTributoCalculado.SetNull();
  // novos
  resultadoTributoDevido.SetNull();
  resultadoPercentualDiferimento.SetNull();
  resultadoValorDiferimento.SetNull();
  resultadoAliquotaDecimal := DecimalCalculo.Zero;
  resultadoAliquotaEfetivaDecimal := DecimalCalculo.Zero;
  /////////////////////////////

  if possuiPercentualReducao then
  begin
    percentualReducao := BuscarPercentualReducao(classificacaoTrib.Id, TipoTributo, Data);


    fatorPercentual := ArredondamentoCalculo.PercentualParaFracao(DecimalCalculo.DeCurrency(percentualReducao.Value));
    valorPercentualReducao.SetValue( fatorPercentual.ParaDouble );
  end;

  tipoAliquota := TipoAliquotaEnum( IndexText(classificacaoTrib.TipoAliquota,
    ['Padrao', 'Uniforme nacional (referencia)', 'Uniforme setorial', 'Fixa', 'Sem aliquota',
     'Aliquotas Combinadas (Ad Valorem e Ad Rem)']
  ));

  aliquotaDivididaPorCem := False;
  case tipoAliquota of
    taPadrao:
      begin
        valorAliquota.SetValue( BuscarAliquotaPadrao( TipoTributo, CodigoUF, CodigoMun, Data ));
        aliquotaDivididaPorCem := True;
      end;

    taUniformeNacional:
      begin
        valorAliquota.SetValue( BuscarAliquotaReferencia( TipoTributo, Data ));
        aliquotaDivididaPorCem := True;
      end;

    taUniformeSetorial:
      // esse tipo de alíquota provavelmente vai exigir vínculo com cClassTrib para serviços financeiros
      begin
        if tratamentoTrib.InPossuiMonofasia then
        begin
          valorAliquotaAdRemPrincipal.SetValue( CONST_ALIQUOTA_GASOLINA_TIPO_A );
          valorAliquotaAdRemSecundaria.SetValue( CONST_ALIQUOTA_EAC );
          fatorPercentual := ArredondamentoCalculo.PercentualParaFracao(DecimalCalculo.DeInteiro(CONST_PBIO));
          pBio.SetValue( fatorPercentual.ParaDouble );
          fatorPercentual := ArredondamentoCalculo.PercentualParaFracao(DecimalCalculo.DeInteiro(CONST_PDIF));
          pDif.SetValue( fatorPercentual.ParaDouble );
          variacaoPontoPercentual.SetValue( CONST_VARIACAO_EAC );
        end
        else
        begin
          valorAliquota.SetValue( BuscarAliquotaUniformeSetorial( Item.NBS, TipoTributo, classificacaoTrib.Id, Data ));
          aliquotaDivididaPorCem := True;
        end;
      end;

    taFixa:
      begin
        valorAliquota.SetValue( BuscarAliquotaFixa( TipoTributo, classificacaoTrib.Id, Data ));
        aliquotaDivididaPorCem := True;
      end;

    taSemAliquota:
      // fixar o valor 0 no tratamento tributário, por enquanto
      valorAliquota.SetValue( ZeroValue );

    taAliquotaCombinada:
      // para fazer
      ;

    else
      raise Exception.CreateFmt('Tipo de alíquota (%s) desconhecido para cClassTrib %s e CST %s',
        [ classificacaoTrib.TipoAliquota, classificacaoTrib.Codigo, cst ]);
  end;

  variaveisBuilder := VariaveisAvaliadorBuilder.Create()
    .Aliquota(valorAliquota.Value)
    .Quantidade(quantidade.Value)
    .PercentualReducao(valorPercentualReducao.Value)
    .AliquotaPadraoOuReferencia(valorAliquotaPadraoOuReferencia.Value)
    .AliquotaReferencia(valorAliquotaReferencia.Value)
    .AliquotaAdValorem(valorAliquotaAdValorem.Value)
    .AliquotaAdRem(valorAliquotaAdRem.Value)
    .Ajuste(valorAjuste.Value)
    .Redutor(valorRedutor.Value)
    .AliquotaAdRemPrincipal(valorAliquotaAdRemPrincipal.Value)
    .AliquotaAdRemSecundaria(valorAliquotaAdRemSecundaria.Value)
    .VariacaoPontoPercentual(variacaoPontoPercentual.Value)
    .PBio(pBio.Value)
    .PercentualDiferimento(pDif.Value);

  //putExpressao := exprBuilder.Build();

  // As aliquotas publicadas internas ficam em percentual (Currency); os grupos
  // convertem para fracao ao replicar as formulas do Java.
  {$REGION 'Aliquota'}
  if not expressaoAliquota.IsNullOrWhiteSpace() then
  begin
    variaveis := variaveisBuilder.Build();
    resultadoAliquotaDecimal := FAvaliador.Evaluate( expressaoAliquota.Value, variaveis );
    if aliquotaDivididaPorCem then
      resultadoAliquotaDecimal := PublicarAliquota(resultadoAliquotaDecimal);
    aliquotaPublicadaDecimal := ArredondamentoCalculo.FracaoParaPercentual(resultadoAliquotaDecimal);
    aliquotaPublicadaDecimal := ArredondamentoCalculo.AliquotaPublicada(aliquotaPublicadaDecimal);
    resultadoAliquota.SetValue(aliquotaPublicadaDecimal.ParaCurrency);
  end;
  variaveisBuilder.SetAliquota(resultadoAliquotaDecimal);
  {$ENDREGION}

  {$REGION 'AliquotaEfetiva'}
  // A variavel pRedutorCompraGov fica disponivel apenas na avaliacao da expressao
  // de aliquota efetiva (espelho de CalculoCbsIbsService.java variaveis1).
  variaveisBuilder.PRedutorCompraGov(PRedutorCompraGov);
  if not expressaoAliquotaEfetiva.IsNullOrWhiteSpace() then
  begin
    variaveis := variaveisBuilder.Build();
    resultadoAliquotaEfetivaDecimal := FAvaliador.Evaluate( expressaoAliquotaEfetiva.Value, variaveis );
    if aliquotaDivididaPorCem then
      resultadoAliquotaEfetivaDecimal := PublicarAliquota(resultadoAliquotaEfetivaDecimal);
    aliquotaPublicadaDecimal := ArredondamentoCalculo.FracaoParaPercentual(resultadoAliquotaEfetivaDecimal);
    aliquotaPublicadaDecimal := ArredondamentoCalculo.AliquotaPublicada(aliquotaPublicadaDecimal);
    resultadoAliquotaEfetiva.SetValue(aliquotaPublicadaDecimal.ParaCurrency);
  end;
  variaveisBuilder.SetAliquotaEfetiva(resultadoAliquotaEfetivaDecimal);
  {$ENDREGION}

  {$REGION 'BaseCalculo'}
  variaveisBuilder
    .ImpostoSeletivoInformado(impostoSeletivoInformado.Value)
    .BaseCalculoInformada(baseCalculoInformada.Value )
    .ImpostoSeletivoCalculado(ValorImpostoSeletivoCalculado);

  variaveis := variaveisBuilder.Build();
  resultadoBaseCalculoDecimal := FAvaliador.Evaluate( expressaoBaseCalculo.Value, variaveis);
  if not tratamentoTrib.InPossuiMonofasia then
    resultadoBaseCalculoDecimal := ArredondamentoCalculo.ValorFiscal(resultadoBaseCalculoDecimal);
  if resultadoBaseCalculoDecimal.MenorQue(DecimalCalculo.Zero) then
  begin
    resultadoBaseCalculoDecimal := DecimalCalculo.Zero;
            // aqui deveria ser lançada uma exceção
            // flexibilidade para a plataforma
  end;

  resultadoBaseCalculo.SetValue( resultadoBaseCalculoDecimal.ParaCurrency );
  variaveisBuilder.SetBaseCalculo(resultadoBaseCalculoDecimal);
  {$ENDREGION}

  {$REGION 'TributoCalculado'}
  variaveis := variaveisBuilder.Build();
  resultadoTributoCalculadoDecimal := FAvaliador.Evaluate(
    expressaoTributoCalculado.Value, variaveis
  );
  resultadoTributoCalculadoDecimal := ArredondamentoCalculo.ValorFiscal(resultadoTributoCalculadoDecimal);
  if resultadoTributoCalculadoDecimal.MenorQue(DecimalCalculo.Zero) then
    resultadoTributoCalculadoDecimal := DecimalCalculo.Zero;
  resultadoTributoCalculado.SetValue( resultadoTributoCalculadoDecimal.ParaCurrency );

  variaveisBuilder.SetTributoCalculado(resultadoTributoCalculadoDecimal);
  {$ENDREGION}

  {$REGION 'TributoDevido'}
  if not ExpressaoTributoDevido.IsNullOrWhiteSpace() then
  begin
    variaveis := variaveisBuilder.Build();
    resultadoTributoDevidoDecimal := FAvaliador.Evaluate(expressaoTributoDevido.Value, variaveis);
    resultadoTributoDevidoDecimal := ArredondamentoCalculo.ValorFiscal(resultadoTributoDevidoDecimal);
    resultadoTributoDevido.SetValue(resultadoTributoDevidoDecimal.ParaCurrency);
  end;
  {$ENDREGION}

  {$REGION 'PercentualDiferimento e ValorDiferimento'}
  if not expressaoPercentualDiferimento.IsNullOrWhiteSpace()
    and not expressaoValorDiferimento.IsNullOrWhiteSpace() then
  begin
    variaveis := variaveisBuilder.Build();
    resultadoPercentualDiferimentoDecimal := FAvaliador.Evaluate(
      ExpressaoPercentualDiferimento.Value, variaveis
    );
    resultadoPercentualDiferimento.SetValue( resultadoPercentualDiferimentoDecimal.ParaDouble); // I09: DiferimentoModel publicado a partir do Double
    variaveisBuilder.SetPercentualDiferimento(resultadoPercentualDiferimentoDecimal);

    variaveis := variaveisBuilder.Build();
    resultadoValorDiferimentoDecimal := FAvaliador.Evaluate(
      expressaoValorDiferimento.Value, variaveis
    );
    resultadoValorDiferimento.SetValue( resultadoValorDiferimentoDecimal.ParaDouble); // I09: DiferimentoModel publicado a partir do Double
  end;
  {$ENDREGION}


  if not situacaoTributaria.InGrupoIbsCbs then
  begin
    Result := ResultadoCbsIbs.NullInstance();
    Exit;
  end;

  {$REGION 'Grupo Reducao e Grupo Desoneracao'}
  if TemTributacaoRegular then
  begin
    if classificacaoTrib.InGrupoReducao then
    begin
      if TpEnteGov <> tegUnassigned then
      begin
        // Compra governamental: nao suprimir o grupo de reducao com tributacao
        // regular + compra gov (espelho de CalculoCbsIbsService.java v0039).
        grupoReducao := ObterGrupoReducao(
          resultadoAliquotaEfetiva, percentualReducao, aliquotaDivididaPorCem
        );
      end
      else
      begin
        // Codigo adicional a calculadora para gerar o grupo gred com base no CST, ao WS fez essa validacao, v0029 ainda nao resolveu
        resultadoCbsIbsRedDeson :=  Self.Calcular(
          TipoTributo,
          CodigoUF,
          CodigoMun,
          Item,
          TratamentoTribRegular,
          ValorImpostoSeletivoCalculado,
          TratamentoClassificacaoModel.NullInstance(),
          False,
          Data,
          TpEnteGov,
          PRedutorCompraGov
        );
        grupoReducao := resultadoCbsIbsRedDeson.GrupoReducao;
      end;
    end
    else
      grupoReducao := ReducaoAliquotaModel.NullInstance();

    grupoDesoneracao := ObterGrupoDesoneracao( cst, cClassTrib,
      resultadoBaseCalculo.Value,
      resultadoAliquota.Value,
      percentualReducao,
      aliquotaDivididaPorCem,
      possuiPercentualReducao
    );
  end
  else
  begin
    if classificacaoTrib.InGrupoReducao then
      grupoReducao := ObterGrupoReducao(resultadoAliquotaEfetiva, percentualReducao, aliquotaDivididaPorCem)
    else
      grupoReducao := ReducaoAliquotaModel.NullInstance();

    grupoDesoneracao := ResultadoTributacaoRegular.NullInstance();
  end;

  {$REGION 'Codigo correspondente a calculadora, como nao passa no WS, fica apenas como registro'}
  {
  if not classificacaoTrib.InGrupoReducao or TemTributacaoRegular then
    grupoReducao := ReducaoAliquotaModel.NullInstance()
  else
    grupoReducao := ObterGrupoReducao( resultadoAliquotaEfetiva, valorPercentualReducao, aliquotaDivididaPorCem );

  if TemTributacaoRegular then
    grupoDesoneracao := ObterGrupoDesoneracao( cst, cClassTrib,
      resultadoBaseCalculo.Value, resultadoAliquota.Value, valorPercentualReducao, aliquotaDivididaPorCem, possuiPercentualReducao
    )
  else
    grupoDesoneracao := ResultadoTributacaoRegular.NullInstance();
  }
  {$ENDREGION}

  {$ENDREGION}

  if TemTributacaoRegular then
    aliquotaFinal := ZeroValue
  else
  begin
    aliquotaDecimal := resultadoAliquotaDecimal;
    if aliquotaDivididaPorCem then
      aliquotaDecimal := ArredondamentoCalculo.FracaoParaPercentual(aliquotaDecimal);
    aliquotaDecimal := ArredondamentoCalculo.AliquotaPublicada(aliquotaDecimal);
    aliquotaFinal := aliquotaDecimal.ParaCurrency;
  end;

  compraGovernamental := ObterGrupoCompraGov(
    TpEnteGov,
    TipoTributo,
    resultadoAliquotaEfetiva.Value,
    resultadoTributoDevido.Value
  );

  Result := ResultadoCbsIbs.Create(
    aliquotaFinal,
    resultadoBaseCalculo,
    quantidade.Value,
    NumberService.IfThenCurr(TemTributacaoRegular, ZeroValue, resultadoTributoCalculado.Value),
    NumberService.IfThenCurr(TemTributacaoRegular, ZeroValue, resultadoTributoDevido.Value),
    grupoReducao,
    grupoDesoneracao{e isso mesmo, na calculadora java esta assim},
    compraGovernamental,
    ObterGrupoDiferimento(resultadoValorDiferimento, resultadoPercentualDiferimento),
    ObterGrupoMonofasia(
      classificacaoTrib,
      quantidade.Value,
      valorAliquotaAdRemPrincipal,
      valorAliquotaAdRemSecundaria,
      resultadoTributoCalculado.Value,
      resultadoTributoDevido.Value,
      variacaoPontoPercentual
    ),
    ''
  );
end;

function CalculoCbsIbsService.ObterGrupoCompraGov(
  TpEnteGov: TipoEnteGovernamental;
  TipoTributo: TipoTributoEnum;
  Aliquota, Valor: Currency
): TributacaoCompraGovernamentalModel;
var
  pAliq, vTrib: Currency;
begin
  if TpEnteGov = tegUnassigned then
  begin
    Result := TributacaoCompraGovernamentalModel.NullInstance();
    Exit;
  end;

  // A aliquota efetiva ja chega publicada em percentual; o Java a obtem com
  // movePointRight(2) sobre a fracao, sem dividir por 100.
  pAliq := Aliquota;
  vTrib := Valor;

  case TipoTributo of
    tbtCBS:
      Result := TributacaoCompraGovernamentalModel.Create( 0, 0, 0, 0, pAliq, vTrib );
    tbtIBSUF:
      Result := TributacaoCompraGovernamentalModel.Create( pAliq, vTrib, 0, 0, 0, 0 );
    tbtIBSMun:
      Result := TributacaoCompraGovernamentalModel.Create( 0, 0, pAliq, vTrib, 0, 0 );
  else
    raise Exception.CreateFmt('Tributo %d não possui compra governamental', [Ord(TipoTributo)]);
  end;
end;

end.
