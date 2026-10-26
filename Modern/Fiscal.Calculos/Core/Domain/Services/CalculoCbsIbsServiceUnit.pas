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
      AliquotaEfetiva, PercentualReducao: DoubleNullable; AliquotaDivididaPorCem: Boolean
    ): ReducaoAliquotaModel;

    function ObterGrupoCompraGov(
      TpEnteGov: TipoEnteGovernamental;
      TipoTributo: TipoTributoEnum;
      Aliquota, Valor: Double
    ): TributacaoCompraGovernamentalModel;

    function ObterGrupoDesoneracao(
      const Cst, cClassTrib: string;
      BaseCalculo, Aliquota: Double;
      PercentualReducao: DoubleNullable;
      AliquotaDivididaPorCem, PossuiPercentualReducao: Boolean
    ): ResultadoTributacaoRegular;

    function ObterGrupoDiferimento(ValorDiferimento, PercentualDiferimento: DoubleNullable): DiferimentoModel;

    function ObterGrupoMonofasia(
      const ClassificacaoTrib: ClassificacaoTributariaCalculoModel;
      Quantidade: Currency; AliquotaAdRemPrincipal, AliquotaAdRemSecundaria, TributoCalculado, TributoDevido,
      VariacaoPontoPercentual: DoubleNullable
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
  TratamentoTributarioEtdUnit, DateTimeServiceUnit, NumberServiceUnit, ArredondamentoUtilsUnit,
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
begin
  Result := ArredondamentoUtils.ArredondarInterno(
    CONST_PBIO / (100 - CONST_PBIO)
  );
end;

function CalculoCbsIbsService.ObterGrupoDesoneracao(
  const Cst, cClassTrib: string;
  BaseCalculo, Aliquota: Double;
  PercentualReducao: DoubleNullable;
  AliquotaDivididaPorCem, PossuiPercentualReducao: Boolean
): ResultadoTributacaoRegular;
var
  aliquotaEfetiva, redutor, tributoDevido: Double;
begin

  aliquotaEfetiva := Aliquota;

  if PossuiPercentualReducao and not PercentualReducao.IsNull then
  begin
    redutor := 1 - PercentualReducao.Value;
    aliquotaEfetiva := Aliquota * redutor;
  end;

  tributoDevido := BaseCalculo * aliquotaEfetiva;

  if AliquotaDivididaPorCem then
    aliquotaEfetiva := NumberService.MovePointRight( aliquotaEfetiva, 2);

  Result := ResultadoTributacaoRegular.Create(
    Cst, cClassTrib, BaseCalculo, aliquotaEfetiva, tributoDevido
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
  Quantidade: Currency; AliquotaAdRemPrincipal, AliquotaAdRemSecundaria, TributoCalculado, TributoDevido,
  VariacaoPontoPercentual: DoubleNullable
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
      TributoCalculado.Value
    );
  end
  else
    grupoGMonoPadrao := ResultadoGrupoEtapaMonofasia.NullInstance();

  if ClassificacaoTrib.InGrupoMonofasiaReten then
    grupoGMonoReten := ResultadoGrupoEtapaMonofasia.Create(
      Quantidade * ObterFatorBioCombustivel(),
      AliquotaAdRemSecundaria.Value,
      TributoDevido.Value
    )
  else
    grupoGMonoReten := ResultadoGrupoEtapaMonofasia.NullInstance();

  if ClassificacaoTrib.InGrupoMonofasiaRet then
    grupoGMonoRet := ResultadoGrupoEtapaMonofasia.Create(
      Quantidade,
      AliquotaAdRemPrincipal.Value,
      TributoDevido.Value
    )
  else
    grupoGMonoRet := ResultadoGrupoEtapaMonofasia.NullInstance();

  if ClassificacaoTrib.InGrupoMonofasiaDiferimento then
    grupoGMonoDiferimento := ResultadoGrupoDiferimentoMonofasia.Create(
      TributoCalculado.Value - TributoDevido.Value,
      NumberService.MovePointRightCurr((TributoCalculado.Value - TributoDevido.Value) / TributoCalculado.Value, 2)
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
  AliquotaEfetiva, PercentualReducao: DoubleNullable; AliquotaDivididaPorCem: Boolean
): ReducaoAliquotaModel;
var
  aliquotaEfet: Double;
begin
  if AliquotaEfetiva.IsNull or PercentualReducao.IsNull then
    Result := ReducaoAliquotaModel.NullInstance()

  else
  begin
    if not AliquotaEfetiva.IsNull and AliquotaDivididaPorCem then
      aliquotaEfet := NumberService.MovePointRight(AliquotaEfetiva.Value, 2)
    else
      aliquotaEfet := AliquotaEfetiva.Value;

    Result := ReducaoAliquotaModel.Create(
      NumberService.MovePointRightCurr(PercentualReducao.Value, 2),
      aliquotaEfet
    );
  end;
end;

function CalculoCbsIbsService.BuscarAliquotaPadrao(
  TipoTributo: TipoTributoEnum; CodigoUf, CodigoMunicipio: Integer; Data: TDate
): Double;
var
  aliquota: AliquotaResultadoModel;
  cMun, cUF: IntegerNullable;
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
    Result := ArredondamentoUtils.DividirPorCem( aliquota.ValorAplicavel );
  finally
    aliquota.Free();
  end;
end;

function CalculoCbsIbsService.BuscarAliquotaReferencia(TipoTributo: TipoTributoEnum; Data: TDate): Double;
var
  aliquota: CurrencyNullable;
begin
  aliquota := FAliquotaReferenciaRepo.ObterPorTipoTributo( TipoTributo, Data );
  if aliquota.IsNull then
    raise Exception.CreateFmt(
      'Alíquota de referência não encontrada para o tributo com id %s e data %s',
      [Ord(TipoTributo), DateToStr(Data) ]
    );

  Result := ArredondamentoUtils.DividirPorCem( aliquota.Value );
end;

function CalculoCbsIbsService.BuscarAliquotaUniformeSetorial(
  const CodioNBS: string; TipoTributo: TipoTributoEnum; ClassificacaoTributariaId: Integer; Data: TDate
): Double;
var
  aliquotaUniformeSetorial: CurrencyNullable;
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
  Result := ArredondamentoUtils.DividirPorCem( aliquotaUniformeSetorial.Value );
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
begin
  aliquotaFixa := FAliquotaAdValoremServicoRepo.ObterAliquotaAdValoremPorClassificacaoTributaria(
    TipoTributo, ClassificacaoTributariaId, Data
  );
  if aliquotaFixa.IsNull then
    raise Exception.CreateFmt('Alíquota fixa não encontrada em %s', [ DateService.ParseLocal(Data) ]);

  Result := ArredondamentoUtils.DividirPorCem( aliquotaFixa.Value );
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
  valorPercentualReducao, valorAliquota, pBio, pDif, resultadoAliquota, resultadoAliquotaEfetiva,
  resultadoBaseCalculo, resultadoTributoCalculado, resultadoTributoDevido,
  resultadoPercentualDiferimento, resultadoValorDiferimento: DoubleNullable;
  aliquotaFinal: Double;
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

  baseCalculoInformada.SetValue( Item.BaseCalculo );
  quantidade.SetValue( Item.Quantidade );
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
  /////////////////////////////

  if possuiPercentualReducao then
  begin
    percentualReducao := BuscarPercentualReducao(classificacaoTrib.Id, TipoTributo, Data);


    valorPercentualReducao.SetValue( ArredondamentoUtils.DividirPorCem( percentualReducao.Value ) );
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
          pBio.SetValue( ArredondamentoUtils.DividirPorCem( CONST_PBIO ));
          pDif.SetValue( ArredondamentoUtils.DividirPorCem( CONST_PDIF ));
          variacaoPontoPercentual.SetValue( CONST_ALIQUOTA_EAC );
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

  {$REGION 'Aliquota'}
  if not expressaoAliquota.IsNullOrWhiteSpace() then
    resultadoAliquota.SetValue( FAvaliador.Evaluate( expressaoAliquota.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA ));
  variaveisBuilder.Aliquota(resultadoAliquota.Value);
  {$ENDREGION}

  {$REGION 'AliquotaEfetiva'}
  // A variavel pRedutorCompraGov fica disponivel apenas na avaliacao da expressao
  // de aliquota efetiva (espelho de CalculoCbsIbsService.java variaveis1).
  variaveisBuilder.PRedutorCompraGov(PRedutorCompraGov);
  if not expressaoAliquotaEfetiva.IsNullOrWhiteSpace() then
    resultadoAliquotaEfetiva.SetValue(
      FAvaliador.Evaluate( expressaoAliquotaEfetiva.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA )
    );
  variaveisBuilder.AliquotaEfetiva(resultadoAliquotaEfetiva.Value);
  {$ENDREGION}

  {$REGION 'BaseCalculo'}
  variaveisBuilder
    .ImpostoSeletivoInformado(impostoSeletivoInformado.Value)
    .BaseCalculoInformada(baseCalculoInformada.Value )
    .ImpostoSeletivoCalculado(ValorImpostoSeletivoCalculado);

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

  if NumberService.RoundHalfUpTo2(resultadoTributoCalculado.Value) < ZeroValue then
    resultadoTributoCalculado.SetValue( ZeroValue );

  variaveisBuilder.TributoCalculado(resultadoTributoCalculado.Value);
  {$ENDREGION}

  {$REGION 'TributoDevido'}
  if not ExpressaoTributoDevido.IsNullOrWhiteSpace() then
    resultadoTributoDevido.SetValue(FAvaliador.Evaluate(expressaoTributoDevido.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA));
  {$ENDREGION}

  {$REGION 'PercentualDiferimento e ValorDiferimento'}
  if not expressaoPercentualDiferimento.IsNullOrWhiteSpace()
    and not expressaoValorDiferimento.IsNullOrWhiteSpace() then
  begin
    resultadoPercentualDiferimento.SetValue( FAvaliador.Evaluate(
      ExpressaoPercentualDiferimento.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA
    ));
    variaveisBuilder.PercentualDiferimento(resultadoPercentualDiferimento.Value);

    resultadoValorDiferimento.SetValue( FAvaliador.Evaluate(
      expressaoValorDiferimento.Value, variaveisBuilder.Build(), ArredondamentoUtils.PRECISAO_INTERNA
    ));
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
          resultadoAliquotaEfetiva, valorPercentualReducao, aliquotaDivididaPorCem
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
      valorPercentualReducao,
      aliquotaDivididaPorCem,
      possuiPercentualReducao
    );
  end
  else
  begin
    if classificacaoTrib.InGrupoReducao then
      grupoReducao := ObterGrupoReducao(resultadoAliquotaEfetiva, valorPercentualReducao, aliquotaDivididaPorCem)
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
  else if aliquotaDivididaPorCem then
    aliquotaFinal := NumberService.MovePointRightCurr( NumberService.RoundHalfUpTo4( resultadoAliquota.Value ), 2)
  else
    aliquotaFinal := NumberService.RoundHalfUpTo4( resultadoAliquota.Value );

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
    IfThen(TemTributacaoRegular, ZeroValue, resultadoTributoCalculado.Value),
    IfThen(TemTributacaoRegular, ZeroValue, resultadoTributoDevido.Value),
    grupoReducao,
    grupoDesoneracao{e isso mesmo, na calculadora java esta assim},
    compraGovernamental,
    ObterGrupoDiferimento(resultadoValorDiferimento, resultadoPercentualDiferimento),
    ObterGrupoMonofasia(
      classificacaoTrib,
      quantidade.Value,
      valorAliquotaAdRemPrincipal,
      valorAliquotaAdRemSecundaria,
      resultadoTributoCalculado,
      resultadoTributoDevido,
      variacaoPontoPercentual
    ),
    ''
  );
end;

function CalculoCbsIbsService.ObterGrupoCompraGov(
  TpEnteGov: TipoEnteGovernamental;
  TipoTributo: TipoTributoEnum;
  Aliquota, Valor: Double
): TributacaoCompraGovernamentalModel;
var
  pAliq, vTrib: Currency;
begin
  if TpEnteGov = tegUnassigned then
  begin
    Result := TributacaoCompraGovernamentalModel.NullInstance();
    Exit;
  end;

  // A aliquota e armazenada movendo-se a aliquota efetiva duas casas decimais
  // para a direita (nao divide por 100), conforme CalculoCbsIbsService.java.
  pAliq := NumberService.MovePointRight(Aliquota, 2);
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
