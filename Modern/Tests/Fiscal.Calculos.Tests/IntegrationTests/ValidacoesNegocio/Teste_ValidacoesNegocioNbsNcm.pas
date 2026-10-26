unit Teste_ValidacoesNegocioNbsNcm;

// ============================================================================
// Incremento dedicado de cobertura M-01
// change_ids: case_nbs_ncm_aplicabilidade-01 / -02 / -03
//
// Objetivo: reproduzir, no nivel de servico Modern mais proximo e com
// infraestrutura isolada (fakes em memoria), os oito cenarios de teste de
// integracao da suite oficial RTC (Teste_validacao_1..8), consumindo os
// payloads JSON ja existentes em
// Tests/Fiscal.Calculos.Tests/resources/Entradas/validacoes/.
//
// Nenhum comportamento de producao e alterado. Nao se usa banco de dados,
// controller HTTP, package, build, scripts, Java ou infraestrutura real.
//
// Mapeamento cenario -> payload -> codigo esperado (CodigosErroValidacao):
//   1 NcmNaoEncontrada             -> ECOD_NCM_NAO_ENCONTRADO              (013)
//   2 NcmNaoVinculada              -> ECOD_NCM_NAO_VINC_CLASSIFICACAO      (015)
//   3 NbsNaoEncontrada             -> ECOD_NBS_NAO_ENCONTRADO              (016)
//   4 NbsNaoVinculada              -> ECOD_NBS_NAO_VINC_CLASSIFICACAO      (018)
//   5 NcmNbsNaoInformadas          -> Java @Disabled (paridade explicita)
//   6 NcmNbsSimultaneas            -> ECOD_NCM_E_NBS_SIMULTANEOS           (012)
//   7 ClassificacaoNaoEncontrada   -> ECOD_CLASSTRIB_NAO_ENCONTRADA        (007)
//   8 ClassificacaoNaoVinculadaCST -> ECOD_CLASSTRIB_NAO_VINCULADA_COM_CST (009)
//
// Nivel Modern escolhido por cenario:
//   - 1, 3, 5, 6, 7, 8: PreparacaoCalculoServiceInter.Preparar, que e o ponto
//     do pipeline onde NCM/NBS nao encontrados (013/016), NCM+NBS simultaneos
//     (012) e classificacao tributaria (007/009) sao validados;
//   - 2 e 4: NcmAplicavelService.Validar / NbsAplicavelService.Validar, que sao
//     os servicos que produzem 015/018. O Modern chama esses servicos dentro de
//     ObterTratamentoOperacao mas descarta o ValidacaoOutput retornado, portanto
//     o codigo so e observavel no proprio servico (limitacao registrada).
//
// Limitacoes registradas (sem alterar producao):
//   - L-01: ItemCalculoInput.Create escolhe NCM (8 caracteres) ou NBS
//     (9 caracteres) a partir de um unico campo e TCalculoInputConverter
//     prioriza NCM. O contrato de entrada Modern nao representa NCM e NBS
//     simultaneamente, tornando o ramo de ECOD_NCM_E_NBS_SIMULTANEOS
//     inalcancavel a partir dos payloads aprovados (ver teste 6).
//   - L-02: os tres cenarios HTTP 400 da suite Java (validacao de request) nao
//     possuem controller/validacao equivalente no Modern, fora deste ownership.
// ============================================================================

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  JsonResourceUnit,
  CalculoInputTestModel,
  IPreparacaoCalculoServiceUnit,
  PreparacaoCalculoServiceInterUnit,
  PreparacaoResultadoUnit,
  CalcularTributoInputUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit,
  ValidacaoOutputUnit,
  ValidacaoItemOutputUnit,
  CodigosErroValidacao,
  TipoTributoEnumUnit,
  IMunicipiosRepositoryUnit,
  MunicipioEtdUnit,
  INcmsRepositoryUnit,
  NcmEtdUnit,
  INbsRepositoryUnit,
  NbsEtdUnit,
  ITributoSituacaoTributariaRepositoryUnit,
  TributoSituacaoTributariaEtdUnit,
  ITratamentoClassificacaoRepositoryUnit,
  TratamentoClassificacaoEtdUnit,
  IAliquotaAdValoremProdutoRepositoryUnit,
  IAliquotaAdValoremServicoRepositoryUnit,
  IAliquotaAdRemProdutoRepositoryUnit,
  IClassificacaoTributariaServiceUnit,
  NcmAplicavelServiceUnit,
  NbsAplicavelServiceUnit,
  ClassificacaoTributariaModelUnit,
  ClassificacaoTributariaCalculoModelUnit,
  TratamentoClassificacaoModelUnit,
  AliquotaAdRemModelUnit,
  CompraGovernamentalInputUnit,
  CurrencyNullableUnit,
  INcmAplicavelRepositoryUnit,
  NcmAplicavelEtdUnit,
  INbsAplicavelRepositoryUnit,
  NbsAplicavelEtdUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  StringNullableUnit;

type
  /// <summary>
  ///   Double de INcmsRepository (classe abstrata). Devolve um NcmEtd novo a
  ///   cada chamada quando Encontrado=True, pois Preparar assume a propriedade
  ///   do objeto retornado; devolve nil quando Encontrado=False.
  /// </summary>
  TFakeNcmsRepository = class(INcmsRepository)
  private
    FEncontrado: Boolean;
  public
    constructor Create; reintroduce;
    function ObterNcm(const Ncm: string; Data: TDate): NcmEtd; override;
    function ObterNcmMaisRecente(const Ncm: string): NcmEtd; override;

    property Encontrado: Boolean read FEncontrado write FEncontrado;
  end;

  /// <summary>
  ///   Double de INbsRepository. Neste incremento o NBS nunca e encontrado,
  ///   caracterizando ECOD_NBS_NAO_ENCONTRADO quando ha NBS informado.
  /// </summary>
  TFakeNbsRepository = class(INbsRepository)
  public
    constructor Create; reintroduce;
    function ObterNbs(const Nbs: string; Data: TDate): NbsEtd; override;
  end;

  TFakeMunicipiosRepository = class(IMunicipiosRepository)
  public
    constructor Create; reintroduce;
    function ObterMunicipio(Codigo: Integer): MunicipioEtd; override;
    function ListarTodos(): MunicipiosEtd; override;
  end;

  TFakeTributoSituacaoTributariaRepository = class(ITributoSituacaoTributariaRepository)
  public
    constructor Create; reintroduce;
    function Obter(const CST: string; TipoTributoId: TipoTributoEnum; Data: TDate): TributoSituacaoTributariaEtd; override;
  end;

  TFakeTratamentoClassificacaoRepository = class(ITratamentoClassificacaoRepository)
  public
    constructor Create; reintroduce;
    function ObterTratamentoClassificacaomodel(ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoModel; override;
    function ObterTratamentoClassificacao(ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoEtd; override;
    function ObterTratamentoClassificacao(const cClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd; override;
  end;

  TFakeAliquotaAdValoremProdutoRepository = class(IAliquotaAdValoremProdutoRepository)
  private
    FAliquota: CurrencyNullable;
  public
    constructor Create(const Aliquota: CurrencyNullable); reintroduce;
    function ObterAliquota(const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate): CurrencyNullable; override;
  end;

  TFakeAliquotaAdValoremServicoRepository = class(IAliquotaAdValoremServicoRepository)
  public
    constructor Create; reintroduce;
    function ObterAliquotaAdValorem(const Nbs: string; TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate): CurrencyNullable; override;
    function ObterAliquotaAdValoremPorClassificacaoTributaria(TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate): CurrencyNullable; override;
  end;

  TFakeAliquotaAdRemProdutoRepository = class(IAliquotaAdRemProdutoRepository)
  private
    FAdRem: AliquotaAdRemModel;
  public
    constructor Create(const AdRem: AliquotaAdRemModel); reintroduce;
    function ObterAliquotaAdRem(const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate): AliquotaAdRemModel; override;
  end;

  /// <summary>
  ///   Double de IClassificacaoTributariaService. Devolve o modelo configurado
  ///   por cenario; NullInstance reproduz ECOD_CLASSTRIB_NAO_ENCONTRADA e um
  ///   modelo com CST divergente reproduz ECOD_CLASSTRIB_NAO_VINCULADA_COM_CST.
  /// </summary>
  TFakeClassificacaoTributariaService = class(TInterfacedObject, IClassificacaoTributariaService)
  private
    FModelo: ClassificacaoTributariaModel;
  public
    function ObterClassificacaoTributariaCbsIbs(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
    function ObterClassificacaoTributariaImpostoSeletivo(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
    function ObterClassificacaoTributariaCalculo(Id: Integer): ClassificacaoTributariaCalculoModel;

    property Modelo: ClassificacaoTributariaModel read FModelo write FModelo;
  end;

  /// <summary>
  ///   Double neutro de INcmAplicavelService usado no nivel de Preparacao,
  ///   onde o ValidacaoOutput retornado e descartado pela producao.
  /// </summary>
  TFakeNcmAplicavelService = class(TInterfacedObject, INcmAplicavelService)
  public
    function Validar(const Ncm: string; ClassificacaoId: Integer; Data: TDate; Tributos: string): ValidacaoOutput;
  end;

  /// <summary>
  ///   Double neutro de INbsAplicavelService usado no nivel de Preparacao.
  /// </summary>
  TFakeNbsAplicavelService = class(TInterfacedObject, INbsAplicavelService)
  public
    function Validar(const Nbs: string; ClassificacaoId: Integer; Data: TDate; const Tributos: string): ValidacaoOutput;
  end;

  /// <summary>
  ///   Double de INcmAplicavelRepository para exercitar o NcmAplicavelService
  ///   real (cenario 2 NcmNaoVinculada). Lista vazia com classificacao existente
  ///   reproduz a condicao B do Java.
  /// </summary>
  TFakeNcmAplicavelRepository = class(INcmAplicavelRepository)
  private
    FExistePorClassificacaoId: Boolean;
  public
    constructor Create(AExistePorClassificacaoId: Boolean); reintroduce;
    function ObterPorNcmeClassificacaoId(NCM: string; ClassificacaoId: Integer; Data: TDate): NcmsAplicaveisEtd; override;
    function ExistePorClassificacaoId(ClassificacaoId: Integer; Data: TDate): Boolean; override;
  end;

  /// <summary>
  ///   Double de INbsAplicavelRepository para exercitar o NbsAplicavelService
  ///   real (cenario 4 NbsNaoVinculada e cenario 5 NBS ausente).
  /// </summary>
  TFakeNbsAplicavelRepository = class(INbsAplicavelRepository)
  private
    FExistePorClassificacaoId: Boolean;
    FTemNbsAplicavel: Boolean;
    FTemExcecaoNbsAplicavel: Boolean;
    FTemNbsAplicavelSemExcecao: Boolean;
  public
    constructor Create(
      AExistePorClassificacaoId: Boolean;
      ATemNbsAplicavel: Boolean;
      ATemExcecaoNbsAplicavel: Boolean;
      ATemNbsAplicavelSemExcecao: Boolean
    ); reintroduce;
    function ObterPorNbseClassificacaoId(NCM: string; ClassificacaoId: Integer; Data: TDate): NbssAplicaveisEtd; override;
    function ExistePorClassificacaoId(ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function TemNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function TemExcecaoNbsAplicavel(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; override;
    function TemNbsAplicavelSemExcecao(const Nbs: string; ClassificacaoId: Integer; Data: TDate): Boolean; override;
  end;

  [TestFixture]
  TTeste_ValidacoesNegocioNbsNcm = class
  private
    FJsonService: JsonResource;
    FMunicipiosRepo: TFakeMunicipiosRepository;
    FNcmsRepo: TFakeNcmsRepository;
    FNbsRepo: TFakeNbsRepository;
    FTributoSituacaoRepo: TFakeTributoSituacaoTributariaRepository;
    FTratamentoClassRepo: TFakeTratamentoClassificacaoRepository;
    FAliqAdValoremProdRepo: TFakeAliquotaAdValoremProdutoRepository;
    FAliqAdValoremServRepo: TFakeAliquotaAdValoremServicoRepository;
    FAliqAdRemProdRepo: TFakeAliquotaAdRemProdutoRepository;

    function CarregarInputJson(const ARecurso: string): CalcularTributoTestInput;
    function CriarPreparacao(
      ANcmEncontrado: Boolean;
      const AModeloClassificacao: ClassificacaoTributariaModel
    ): IPreparacaoCalculoServiceInter;
    function ContarCodigo(const AValidacao: ValidacaoOutput; ACodigo: Integer): Integer;
    function CodigoDoItem(const AItem: ItemCalculoInput): Integer;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_1_NcmNaoEncontrada;

    [Test]
    procedure teste_2_NcmNaoVinculada;

    [Test]
    procedure teste_3_NbsNaoEncontrada;

    [Test]
    procedure teste_4_NbsNaoVinculada;

    [Test]
    procedure teste_5_NcmNbsNaoInformadas_paridadeJavaDisabled;

    [Test]
    procedure teste_6_NcmNbsSimultaneas_contratoDeEntradaNaoRepresentaAmbos;

    [Test]
    procedure teste_7_ClassificacaoTributariaNaoEncontrada;

    [Test]
    procedure teste_8_ClassificacaoTributariaNaoVinculada;
  end;

implementation

const
  FIXTURE_VALIDACAO_1 = 'Entradas\validacoes\Teste_validacao_1_NcmNaoEncontradaException.json';
  FIXTURE_VALIDACAO_2 = 'Entradas\validacoes\Teste_validacao_2_NcmNaoVinculadaException.json';
  FIXTURE_VALIDACAO_3 = 'Entradas\validacoes\Teste_validacao_3_NbsNaoEncontradaException.json';
  FIXTURE_VALIDACAO_4 = 'Entradas\validacoes\Teste_validacao_4_NbsNaoVinculadaException.json';
  FIXTURE_VALIDACAO_5 = 'Entradas\validacoes\Teste_validacao_5_NcmNbsNaoInformadasException.json';
  FIXTURE_VALIDACAO_6 = 'Entradas\validacoes\Teste_validacao_6_NcmNbsSimultaneasException.json';
  FIXTURE_VALIDACAO_7 = 'Entradas\validacoes\Teste_validacao_7_ClassificacaoTributariaNaoEncontradaException.json';
  FIXTURE_VALIDACAO_8 = 'Entradas\validacoes\Teste_validacao_8_ClassificacaoTributariaNaoVinculadaException.json';

function ModeloClassificacao(const ACodigo, ACST: string): ClassificacaoTributariaModel;
begin
  Result := ClassificacaoTributariaModel.Create(StrToIntDef(ACodigo, 0), ACodigo, '', ACST);
end;

{ TFakeNcmsRepository }

constructor TFakeNcmsRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeNcmsRepository.ObterNcm(const Ncm: string; Data: TDate): NcmEtd;
begin
  if FEncontrado then
    Result := NcmEtd.Create(
      Ncm,
      'NCM de teste',
      EncodeDate(2020, 1, 1),
      DateNullable.NullInstance(),
      '',
      StringNullable.NullInstance(),
      '',
      StringNullable.NullInstance(),
      nsPresent
    )
  else
    Result := nil;
end;

function TFakeNcmsRepository.ObterNcmMaisRecente(const Ncm: string): NcmEtd;
begin
  Result := nil;
end;

{ TFakeNbsRepository }

constructor TFakeNbsRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeNbsRepository.ObterNbs(const Nbs: string; Data: TDate): NbsEtd;
begin
  Result := nil;
end;

{ TFakeMunicipiosRepository }

constructor TFakeMunicipiosRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeMunicipiosRepository.ObterMunicipio(Codigo: Integer): MunicipioEtd;
begin
  Result := nil;
end;

function TFakeMunicipiosRepository.ListarTodos: MunicipiosEtd;
begin
  Result := nil;
end;

{ TFakeTributoSituacaoTributariaRepository }

constructor TFakeTributoSituacaoTributariaRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeTributoSituacaoTributariaRepository.Obter(
  const CST: string; TipoTributoId: TipoTributoEnum; Data: TDate
): TributoSituacaoTributariaEtd;
begin
  Result := nil;
end;

{ TFakeTratamentoClassificacaoRepository }

constructor TFakeTratamentoClassificacaoRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeTratamentoClassificacaoRepository.ObterTratamentoClassificacaomodel(
  ClassificacaoFiscalId: Integer; Data: TDate
): TratamentoClassificacaoModel;
begin
  Result := TratamentoClassificacaoModel.Create(1, 1, False, False);
end;

function TFakeTratamentoClassificacaoRepository.ObterTratamentoClassificacao(
  ClassificacaoFiscalId: Integer; Data: TDate
): TratamentoClassificacaoEtd;
begin
  Result := nil;
end;

function TFakeTratamentoClassificacaoRepository.ObterTratamentoClassificacao(
  const cClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate
): TratamentoClassificacaoEtd;
begin
  Result := nil;
end;

{ TFakeAliquotaAdValoremProdutoRepository }

constructor TFakeAliquotaAdValoremProdutoRepository.Create(const Aliquota: CurrencyNullable);
begin
  inherited Create(nil);
  FAliquota := Aliquota;
end;

function TFakeAliquotaAdValoremProdutoRepository.ObterAliquota(
  const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate
): CurrencyNullable;
begin
  Result := FAliquota;
end;

{ TFakeAliquotaAdValoremServicoRepository }

constructor TFakeAliquotaAdValoremServicoRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeAliquotaAdValoremServicoRepository.ObterAliquotaAdValorem(
  const Nbs: string; TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate
): CurrencyNullable;
begin
  Result := CurrencyNullable.NullInstance();
end;

function TFakeAliquotaAdValoremServicoRepository.ObterAliquotaAdValoremPorClassificacaoTributaria(
  TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate
): CurrencyNullable;
begin
  Result := CurrencyNullable.NullInstance();
end;

{ TFakeAliquotaAdRemProdutoRepository }

constructor TFakeAliquotaAdRemProdutoRepository.Create(const AdRem: AliquotaAdRemModel);
begin
  inherited Create(nil);
  FAdRem := AdRem;
end;

function TFakeAliquotaAdRemProdutoRepository.ObterAliquotaAdRem(
  const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate
): AliquotaAdRemModel;
begin
  Result := FAdRem;
end;

{ TFakeClassificacaoTributariaService }

function TFakeClassificacaoTributariaService.ObterClassificacaoTributariaCbsIbs(
  const CClassTrib: string; Data: TDate
): ClassificacaoTributariaModel;
begin
  Result := FModelo;
end;

function TFakeClassificacaoTributariaService.ObterClassificacaoTributariaImpostoSeletivo(
  const CClassTrib: string; Data: TDate
): ClassificacaoTributariaModel;
begin
  Result := ClassificacaoTributariaModel.NullInstance();
end;

function TFakeClassificacaoTributariaService.ObterClassificacaoTributariaCalculo(
  Id: Integer
): ClassificacaoTributariaCalculoModel;
begin
  Result := ClassificacaoTributariaCalculoModel.NullInstance();
end;

{ TFakeNcmAplicavelService }

function TFakeNcmAplicavelService.Validar(
  const Ncm: string; ClassificacaoId: Integer; Data: TDate; Tributos: string
): ValidacaoOutput;
begin
  Result := ValidacaoOutput.Create();
end;

{ TFakeNbsAplicavelService }

function TFakeNbsAplicavelService.Validar(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate; const Tributos: string
): ValidacaoOutput;
begin
  Result := ValidacaoOutput.Create();
end;

{ TFakeNcmAplicavelRepository }

constructor TFakeNcmAplicavelRepository.Create(AExistePorClassificacaoId: Boolean);
begin
  inherited Create(nil);
  FExistePorClassificacaoId := AExistePorClassificacaoId;
end;

function TFakeNcmAplicavelRepository.ObterPorNcmeClassificacaoId(
  NCM: string; ClassificacaoId: Integer; Data: TDate
): NcmsAplicaveisEtd;
begin
  // Lista vazia: sem NCM_APLICAVEL vinculado. O servico libera o objeto.
  Result := NcmsAplicaveisEtd.Create();
end;

function TFakeNcmAplicavelRepository.ExistePorClassificacaoId(
  ClassificacaoId: Integer; Data: TDate
): Boolean;
begin
  Result := FExistePorClassificacaoId;
end;

{ TFakeNbsAplicavelRepository }

constructor TFakeNbsAplicavelRepository.Create(
  AExistePorClassificacaoId: Boolean;
  ATemNbsAplicavel: Boolean;
  ATemExcecaoNbsAplicavel: Boolean;
  ATemNbsAplicavelSemExcecao: Boolean
);
begin
  inherited Create(nil);
  FExistePorClassificacaoId := AExistePorClassificacaoId;
  FTemNbsAplicavel := ATemNbsAplicavel;
  FTemExcecaoNbsAplicavel := ATemExcecaoNbsAplicavel;
  FTemNbsAplicavelSemExcecao := ATemNbsAplicavelSemExcecao;
end;

function TFakeNbsAplicavelRepository.ObterPorNbseClassificacaoId(
  NCM: string; ClassificacaoId: Integer; Data: TDate
): NbssAplicaveisEtd;
begin
  Result := nil;
end;

function TFakeNbsAplicavelRepository.ExistePorClassificacaoId(
  ClassificacaoId: Integer; Data: TDate
): Boolean;
begin
  Result := FExistePorClassificacaoId;
end;

function TFakeNbsAplicavelRepository.TemNbsAplicavel(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate
): Boolean;
begin
  Result := FTemNbsAplicavel;
end;

function TFakeNbsAplicavelRepository.TemExcecaoNbsAplicavel(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate
): Boolean;
begin
  Result := FTemExcecaoNbsAplicavel;
end;

function TFakeNbsAplicavelRepository.TemNbsAplicavelSemExcecao(
  const Nbs: string; ClassificacaoId: Integer; Data: TDate
): Boolean;
begin
  Result := FTemNbsAplicavelSemExcecao;
end;

{ TTeste_ValidacoesNegocioNbsNcm }

procedure TTeste_ValidacoesNegocioNbsNcm.Setup;
begin
  FJsonService := JsonResource.Create();

  FMunicipiosRepo := TFakeMunicipiosRepository.Create();
  FNcmsRepo := TFakeNcmsRepository.Create();
  FNbsRepo := TFakeNbsRepository.Create();
  FTributoSituacaoRepo := TFakeTributoSituacaoTributariaRepository.Create();
  FTratamentoClassRepo := TFakeTratamentoClassificacaoRepository.Create();
  FAliqAdValoremProdRepo := TFakeAliquotaAdValoremProdutoRepository.Create(CurrencyNullable.NullInstance());
  FAliqAdValoremServRepo := TFakeAliquotaAdValoremServicoRepository.Create();
  FAliqAdRemProdRepo := TFakeAliquotaAdRemProdutoRepository.Create(AliquotaAdRemModel.NullInstance());
end;

procedure TTeste_ValidacoesNegocioNbsNcm.TearDown;
begin
  FJsonService.Free();
  FAliqAdRemProdRepo.Free();
  FAliqAdValoremServRepo.Free();
  FAliqAdValoremProdRepo.Free();
  FTratamentoClassRepo.Free();
  FTributoSituacaoRepo.Free();
  FNbsRepo.Free();
  FNcmsRepo.Free();
  FMunicipiosRepo.Free();
end;

function TTeste_ValidacoesNegocioNbsNcm.CarregarInputJson(
  const ARecurso: string
): CalcularTributoTestInput;
begin
  Result := FJsonService.DeserializeObject<CalcularTributoTestInput>(ARecurso);
  Assert.IsNotNull(Result, 'Fixture de validacao nao carregada: ' + ARecurso);
  Assert.AreEqual(1, Length(Result.Itens),
    'Cada fixture de validacao possui um unico item: ' + ARecurso);
end;

function TTeste_ValidacoesNegocioNbsNcm.CriarPreparacao(
  ANcmEncontrado: Boolean;
  const AModeloClassificacao: ClassificacaoTributariaModel
): IPreparacaoCalculoServiceInter;
var
  classificacaoService: TFakeClassificacaoTributariaService;
  ncmAplicavelService: INcmAplicavelService;
  nbsAplicavelService: INbsAplicavelService;
begin
  FNcmsRepo.Encontrado := ANcmEncontrado;

  classificacaoService := TFakeClassificacaoTributariaService.Create();
  classificacaoService.Modelo := AModeloClassificacao;

  ncmAplicavelService := TFakeNcmAplicavelService.Create();
  nbsAplicavelService := TFakeNbsAplicavelService.Create();

  Result := PreparacaoCalculoServiceInter.Create(
    FMunicipiosRepo,
    FNcmsRepo,
    FNbsRepo,
    FTributoSituacaoRepo,
    nil, // IClassificacaoTributariaRepository nao e utilizado por Preparar
    FTratamentoClassRepo,
    ncmAplicavelService,
    nbsAplicavelService,
    FAliqAdValoremProdRepo,
    FAliqAdValoremServRepo,
    FAliqAdRemProdRepo,
    nil, // IRedutorCompraGovernamentalRepository so e consultado com GCompraGov
    classificacaoService
  );
end;

function TTeste_ValidacoesNegocioNbsNcm.ContarCodigo(
  const AValidacao: ValidacaoOutput; ACodigo: Integer
): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to High(AValidacao.Validacoes) do
    if AValidacao.Validacoes[I].Codigo = ACodigo then
      Inc(Result);
end;

function TTeste_ValidacoesNegocioNbsNcm.CodigoDoItem(const AItem: ItemCalculoInput): Integer;
begin
  Result := StrToIntDef(AItem.cClassTrib, 0);
end;

procedure TTeste_ValidacoesNegocioNbsNcm.teste_1_NcmNaoEncontrada;
var
  inputJson: CalcularTributoTestInput;
  input: CalcularTributoInput;
  service: IPreparacaoCalculoServiceInter;
  resultado: PreparacaoResultado;
begin
  // Teste_validacao_1_NcmNaoEncontradaException (Java: NcmNaoEncontradaException).
  // NCM 99999999 nao existe no repositorio -> ECOD_NCM_NAO_ENCONTRADO (013).
  inputJson := CarregarInputJson(FIXTURE_VALIDACAO_1);
  try
    Assert.AreEqual('99999999', inputJson.Itens[0].NCM,
      'Fixture 1 deve informar o NCM nao encontrado');

    input := TCalculoInputConverter.ToInput(inputJson);
    service := CriarPreparacao(False, ModeloClassificacao('000001', '000'));
    try
      resultado := service.Preparar(input, input.Itens[0]);

      Assert.AreEqual(1, ContarCodigo(resultado.Validacoes, ECOD_NCM_NAO_ENCONTRADO),
        'Cenario 1: NCM inexistente deve gerar ECOD_NCM_NAO_ENCONTRADO');
      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_NBS_NAO_ENCONTRADO),
        'Cenario 1: sem NBS informado nao deve gerar ECOD_NBS_NAO_ENCONTRADO');
    finally
      service := nil;
    end;
  finally
    inputJson.Free();
  end;
end;

procedure TTeste_ValidacoesNegocioNbsNcm.teste_2_NcmNaoVinculada;
var
  inputJson: CalcularTributoTestInput;
  input: CalcularTributoInput;
  repo: TFakeNcmAplicavelRepository;
  service: NcmAplicavelService;
  output: ValidacaoOutput;
begin
  // Teste_validacao_2_NcmNaoVinculadaException (Java: NcmNaoVinculadaException).
  // NCM 24021000 existe e a classificacao existe, mas nao ha NCM_APLICAVEL
  // vinculado -> condicao B do NcmAplicavelService Java ->
  // ECOD_NCM_NAO_VINC_CLASSIFICACAO (015).
  // O resultado do NcmAplicavelService nao e propagado por Preparar (producao
  // descarta o ValidacaoOutput em ObterTratamentoOperacao), por isso o cenario e
  // exercitado no proprio servico, que e o nivel Modern mais proximo.
  inputJson := CarregarInputJson(FIXTURE_VALIDACAO_2);
  try
    Assert.AreEqual('24021000', inputJson.Itens[0].NCM,
      'Fixture 2 deve informar o NCM existente porem nao vinculado');

    input := TCalculoInputConverter.ToInput(inputJson);

    repo := TFakeNcmAplicavelRepository.Create(True);
    try
      service := NcmAplicavelService.Create(repo);
      try
        output := service.Validar(
          input.Itens[0].NCM,
          CodigoDoItem(input.Itens[0]),
          input.GetFatoGeradorAplicavel(),
          'CBS e IBS'
        );

        Assert.AreEqual(1, ContarCodigo(output, ECOD_NCM_NAO_VINC_CLASSIFICACAO),
          'Cenario 2: NCM sem vinculo com a classificacao deve gerar ECOD_NCM_NAO_VINC_CLASSIFICACAO');
        Assert.IsFalse(output.IsValid(),
          'Cenario 2: a validacao deve resultar invalida');
      finally
        service.Free();
      end;
    finally
      repo.Free();
    end;
  finally
    inputJson.Free();
  end;
end;

procedure TTeste_ValidacoesNegocioNbsNcm.teste_3_NbsNaoEncontrada;
var
  inputJson: CalcularTributoTestInput;
  input: CalcularTributoInput;
  service: IPreparacaoCalculoServiceInter;
  resultado: PreparacaoResultado;
begin
  // Teste_validacao_3_NbsNaoEncontradaException (Java: NbsNaoEncontradaException).
  // NBS 999999999 nao existe no repositorio -> ECOD_NBS_NAO_ENCONTRADO (016).
  inputJson := CarregarInputJson(FIXTURE_VALIDACAO_3);
  try
    Assert.AreEqual('999999999', inputJson.Itens[0].NBS,
      'Fixture 3 deve informar o NBS nao encontrado');

    input := TCalculoInputConverter.ToInput(inputJson);
    Assert.AreEqual('', input.Itens[0].NCM, 'Cenario 3 nao deve possuir NCM');
    Assert.AreEqual('999999999', input.Itens[0].NBS,
      'O contrato de entrada preserva o NBS completo de nove caracteres');

    service := CriarPreparacao(False, ModeloClassificacao('000001', '000'));
    try
      resultado := service.Preparar(input, input.Itens[0]);

      Assert.AreEqual(1, ContarCodigo(resultado.Validacoes, ECOD_NBS_NAO_ENCONTRADO),
        'Cenario 3: NBS inexistente deve gerar ECOD_NBS_NAO_ENCONTRADO');
      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_NCM_NAO_ENCONTRADO),
        'Cenario 3: sem NCM informado nao deve gerar ECOD_NCM_NAO_ENCONTRADO');
    finally
      service := nil;
    end;
  finally
    inputJson.Free();
  end;
end;

procedure TTeste_ValidacoesNegocioNbsNcm.teste_4_NbsNaoVinculada;
var
  inputJson: CalcularTributoTestInput;
  input: CalcularTributoInput;
  repo: TFakeNbsAplicavelRepository;
  service: NbsAplicavelService;
  output: ValidacaoOutput;
begin
  // Teste_validacao_4_NbsNaoVinculadaException (Java: NbsNaoVinculadaException).
  // NBS 114052200 existe e a classificacao existe, mas nao ha NBS_APLICAVEL
  // vigente nem excecao -> condicao B do NbsAplicavelService Java ->
  // ECOD_NBS_NAO_VINC_CLASSIFICACAO (018).
  inputJson := CarregarInputJson(FIXTURE_VALIDACAO_4);
  try
    Assert.AreEqual('114052200', inputJson.Itens[0].NBS,
      'Fixture 4 deve informar o NBS existente porem nao vinculado');

    input := TCalculoInputConverter.ToInput(inputJson);

    repo := TFakeNbsAplicavelRepository.Create(True, False, False, False);
    try
      service := NbsAplicavelService.Create(repo);
      try
        output := service.Validar(
          input.Itens[0].NBS,
          CodigoDoItem(input.Itens[0]),
          input.GetFatoGeradorAplicavel(),
          'CBS e IBS'
        );

        Assert.AreEqual(1, ContarCodigo(output, ECOD_NBS_NAO_VINC_CLASSIFICACAO),
          'Cenario 4: NBS sem vinculo com a classificacao deve gerar ECOD_NBS_NAO_VINC_CLASSIFICACAO');
        Assert.IsFalse(output.IsValid(),
          'Cenario 4: a validacao deve resultar invalida');
      finally
        service.Free();
      end;
    finally
      repo.Free();
    end;
  finally
    inputJson.Free();
  end;
end;

procedure TTeste_ValidacoesNegocioNbsNcm.teste_5_NcmNbsNaoInformadas_paridadeJavaDisabled;
var
  inputJson: CalcularTributoTestInput;
  input: CalcularTributoInput;
  service: IPreparacaoCalculoServiceInter;
  resultado: PreparacaoResultado;
  ncmRepo: TFakeNcmAplicavelRepository;
  nbsRepo: TFakeNbsAplicavelRepository;
  ncmService: NcmAplicavelService;
  nbsService: NbsAplicavelService;
  ncmOutput: ValidacaoOutput;
  nbsOutput: ValidacaoOutput;
begin
  // Teste_validacao_5_NcmNbsNaoInformadasException e @Disabled no Java e espera
  // um erro HTTP "NCM e NBS nao informadas" (validacao de request no controller).
  // O Modern nao possui esse controller nem esse codigo de erro, e a producao
  // nao pode ser alterada neste incremento. Em vez de inventar comportamento,
  // este teste registra a paridade de forma explicita:
  //   (a) no nivel de Preparar, ambos ausentes nao produzem falso positivo de
  //       NCM/NBS (012/013/016) nem excecao;
  //   (b) os validadores existentes (NcmAplicavelService/NbsAplicavelService),
  //       quando a classificacao existe, sinalizam o codigo ausente com
  //       ECOD_NCM_COMPLETO_NECESSARIO (014) e ECOD_NBS_COMPLETO_NECESSARIO (017),
  //       que e o comportamento de validacao existente e seguro para ambos os
  //       campos ausentes.
  // A expectativa literal do @Disabled permanece sem equivalente Modern.
  inputJson := CarregarInputJson(FIXTURE_VALIDACAO_5);
  try
    Assert.AreEqual('', inputJson.Itens[0].NCM, 'Fixture 5 nao deve informar NCM');
    Assert.AreEqual('', inputJson.Itens[0].NBS, 'Fixture 5 nao deve informar NBS');

    input := TCalculoInputConverter.ToInput(inputJson);
    Assert.AreEqual('', input.Itens[0].NCM, 'NCM ausente deve permanecer ausente');
    Assert.AreEqual('', input.Itens[0].NBS, 'NBS ausente deve permanecer ausente');

    service := CriarPreparacao(True, ModeloClassificacao('000001', '000'));
    try
      resultado := service.Preparar(input, input.Itens[0]);

      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_NCM_E_NBS_SIMULTANEOS),
        'Cenario 5: nao deve haver falso positivo de NCM e NBS simultaneos');
      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_NCM_NAO_ENCONTRADO),
        'Cenario 5: nao deve haver falso positivo de NCM nao encontrado');
      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_NBS_NAO_ENCONTRADO),
        'Cenario 5: nao deve haver falso positivo de NBS nao encontrado');
    finally
      service := nil;
    end;

    ncmRepo := TFakeNcmAplicavelRepository.Create(True);
    try
      ncmService := NcmAplicavelService.Create(ncmRepo);
      try
        ncmOutput := ncmService.Validar('', CodigoDoItem(input.Itens[0]),
          input.GetFatoGeradorAplicavel(), 'CBS e IBS');
        Assert.AreEqual(1, ContarCodigo(ncmOutput, ECOD_NCM_COMPLETO_NECESSARIO),
          'Cenario 5: NCM ausente com classificacao existente gera ECOD_NCM_COMPLETO_NECESSARIO');
      finally
        ncmService.Free();
      end;
    finally
      ncmRepo.Free();
    end;

    nbsRepo := TFakeNbsAplicavelRepository.Create(True, False, False, False);
    try
      nbsService := NbsAplicavelService.Create(nbsRepo);
      try
        nbsOutput := nbsService.Validar('', CodigoDoItem(input.Itens[0]),
          input.GetFatoGeradorAplicavel(), 'CBS e IBS');
        Assert.AreEqual(1, ContarCodigo(nbsOutput, ECOD_NBS_COMPLETO_NECESSARIO),
          'Cenario 5: NBS ausente com classificacao existente gera ECOD_NBS_COMPLETO_NECESSARIO');
      finally
        nbsService.Free();
      end;
    finally
      nbsRepo.Free();
    end;
  finally
    inputJson.Free();
  end;
end;

procedure TTeste_ValidacoesNegocioNbsNcm.teste_6_NcmNbsSimultaneas_contratoDeEntradaNaoRepresentaAmbos;
var
  inputJson: CalcularTributoTestInput;
  input: CalcularTributoInput;
  service: IPreparacaoCalculoServiceInter;
  resultado: PreparacaoResultado;
begin
  // Teste_validacao_6_NcmNbsSimultaneasException (Java: NcmNbsSimultaneasException).
  // O payload informa NCM e NBS simultaneamente e o Java produz
  // ECOD_NCM_E_NBS_SIMULTANEOS (012) em NcmNbsService.validar.
  //
  // L-01: o contrato de entrada Modern (ItemCalculoInput.Create) classifica o
  // unico campo NCMouNBS por comprimento (8=NCM, 9=NBS) e
  // TCalculoInputConverter.ToInput prioriza NCM, portanto NCM e NBS nunca ficam
  // preenchidos ao mesmo tempo. O ramo de producao que gera 012 permanece, mas e
  // inalcancavel a partir dos payloads aprovados. Este teste caracteriza a
  // limitacao de forma explicita, sem alterar producao e sem inventar entrada.
  // A cobertura plena do cenario 6 exige decisao de contrato sobre o input.
  inputJson := CarregarInputJson(FIXTURE_VALIDACAO_6);
  try
    Assert.AreEqual('24021000', inputJson.Itens[0].NCM,
      'Fixture 6 deve informar NCM (rastreabilidade do cenario)');
    Assert.AreEqual('114052200', inputJson.Itens[0].NBS,
      'Fixture 6 deve informar NBS (rastreabilidade do cenario)');

    input := TCalculoInputConverter.ToInput(inputJson);
    Assert.AreEqual('24021000', input.Itens[0].NCM,
      'Cenario 6: o contrato de entrada preserva o NCM');
    Assert.AreEqual('', input.Itens[0].NBS,
      'Cenario 6 (L-01): o contrato de entrada nao representa NCM e NBS simultaneamente');

    service := CriarPreparacao(True, ModeloClassificacao('000001', '000'));
    try
      resultado := service.Preparar(input, input.Itens[0]);

      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_NCM_E_NBS_SIMULTANEOS),
        'Cenario 6 (L-01): ECOD_NCM_E_NBS_SIMULTANEOS e inalcancavel enquanto NCM e NBS nao coexistem no input');
    finally
      service := nil;
    end;
  finally
    inputJson.Free();
  end;
end;

procedure TTeste_ValidacoesNegocioNbsNcm.teste_7_ClassificacaoTributariaNaoEncontrada;
var
  inputJson: CalcularTributoTestInput;
  input: CalcularTributoInput;
  service: IPreparacaoCalculoServiceInter;
  resultado: PreparacaoResultado;
begin
  // Teste_validacao_7_ClassificacaoTributariaNaoEncontradaException
  // (Java: ClassificacaoTributariaNaoEncontradaException).
  // cClassTrib 999999 inexistente -> ECOD_CLASSTRIB_NAO_ENCONTRADA (007).
  inputJson := CarregarInputJson(FIXTURE_VALIDACAO_7);
  try
    Assert.AreEqual('999999', inputJson.Itens[0].cClassTrib,
      'Fixture 7 deve informar a classificacao tributaria inexistente');
    Assert.AreEqual('24021000', inputJson.Itens[0].NCM,
      'Fixture 7 deve informar NCM existente');

    input := TCalculoInputConverter.ToInput(inputJson);
    service := CriarPreparacao(True, ClassificacaoTributariaModel.NullInstance());
    try
      resultado := service.Preparar(input, input.Itens[0]);

      Assert.AreEqual(1, ContarCodigo(resultado.Validacoes, ECOD_CLASSTRIB_NAO_ENCONTRADA),
        'Cenario 7: classificacao tributaria inexistente deve gerar ECOD_CLASSTRIB_NAO_ENCONTRADA');
      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_NCM_NAO_ENCONTRADO),
        'Cenario 7: NCM existente nao deve gerar ECOD_NCM_NAO_ENCONTRADO');
      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_CLASSTRIB_NAO_VINCULADA_COM_CST),
        'Cenario 7: sem classificacao nao ha validacao de CST');
    finally
      service := nil;
    end;
  finally
    inputJson.Free();
  end;
end;

procedure TTeste_ValidacoesNegocioNbsNcm.teste_8_ClassificacaoTributariaNaoVinculada;
var
  inputJson: CalcularTributoTestInput;
  input: CalcularTributoInput;
  service: IPreparacaoCalculoServiceInter;
  resultado: PreparacaoResultado;
begin
  // Teste_validacao_8_ClassificacaoTributariaNaoVinculadaException
  // (Java: ClassificacaoTributariaNaoVinculadaSituacaoTributariaException).
  // A classificacao 200003 existe mas possui CST 200 divergente do CST 000
  // informado -> ECOD_CLASSTRIB_NAO_VINCULADA_COM_CST (009).
  inputJson := CarregarInputJson(FIXTURE_VALIDACAO_8);
  try
    Assert.AreEqual('200003', inputJson.Itens[0].cClassTrib,
      'Fixture 8 deve informar a classificacao tributaria existente');
    Assert.AreEqual('000', inputJson.Itens[0].CST,
      'Fixture 8 deve informar o CST divergente da classificacao');
    Assert.AreEqual('24021000', inputJson.Itens[0].NCM,
      'Fixture 8 deve informar NCM existente');

    input := TCalculoInputConverter.ToInput(inputJson);
    service := CriarPreparacao(True, ModeloClassificacao('200003', '200'));
    try
      resultado := service.Preparar(input, input.Itens[0]);

      Assert.AreEqual(1, ContarCodigo(resultado.Validacoes, ECOD_CLASSTRIB_NAO_VINCULADA_COM_CST),
        'Cenario 8: CST divergente deve gerar ECOD_CLASSTRIB_NAO_VINCULADA_COM_CST');
      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_CLASSTRIB_NAO_ENCONTRADA),
        'Cenario 8: a classificacao existe, logo nao deve gerar ECOD_CLASSTRIB_NAO_ENCONTRADA');
      Assert.AreEqual(0, ContarCodigo(resultado.Validacoes, ECOD_NCM_NAO_ENCONTRADO),
        'Cenario 8: NCM existente nao deve gerar ECOD_NCM_NAO_ENCONTRADO');
    finally
      service := nil;
    end;
  finally
    inputJson.Free();
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_ValidacoesNegocioNbsNcm);

end.
