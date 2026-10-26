unit Teste_PreparacaoCalculoService_ValidacaoDigitos;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  IPreparacaoCalculoServiceUnit,
  PreparacaoCalculoServiceInterUnit,
  CalcularTributoInputUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit,
  PreparacaoResultadoUnit,
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
  CurrencyNullableUnit;

type
  TFakeMunicipiosRepository = class(IMunicipiosRepository)
  public
    constructor Create; reintroduce;
    function ObterMunicipio(Codigo: Integer): MunicipioEtd; override;
    function ListarTodos(): MunicipiosEtd; override;
  end;

  TFakeNcmsRepository = class(INcmsRepository)
  public
    constructor Create; reintroduce;
    function ObterNcm(const Ncm: string; Data: TDate): NcmEtd; override;
    function ObterNcmMaisRecente(const Ncm: string): NcmEtd; override;
  end;

  TFakeNbsRepository = class(INbsRepository)
  public
    constructor Create; reintroduce;
    function ObterNbs(const Nbs: string; Data: TDate): NbsEtd; override;
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

  TFakeClassificacaoTributariaService = class(TInterfacedObject, IClassificacaoTributariaService)
  public
    function ObterClassificacaoTributariaCbsIbs(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
    function ObterClassificacaoTributariaImpostoSeletivo(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
    function ObterClassificacaoTributariaCalculo(Id: Integer): ClassificacaoTributariaCalculoModel;
  end;

  TFakeNcmAplicavelService = class(TInterfacedObject, INcmAplicavelService)
  public
    function Validar(const Ncm: string; ClassificacaoId: Integer; Data: TDate; Tributos: string): ValidacaoOutput;
  end;

  TFakeNbsAplicavelService = class(TInterfacedObject, INbsAplicavelService)
  public
    function Validar(const Nbs: string; ClassificacaoId: Integer; Data: TDate; const Tributos: string): ValidacaoOutput;
  end;

  [TestFixture]
  TTest_PreparacaoCalculoService_ValidacaoDigitos = class
  private
    FService: IPreparacaoCalculoServiceInter;
    FMunicipiosRepo: TFakeMunicipiosRepository;
    FNcmsRepo: TFakeNcmsRepository;
    FNbsRepo: TFakeNbsRepository;
    FTributoSituacaoRepo: TFakeTributoSituacaoTributariaRepository;
    FTratamentoClassRepo: TFakeTratamentoClassificacaoRepository;
    FAliqAdValoremProdRepo: TFakeAliquotaAdValoremProdutoRepository;
    FAliqAdValoremServRepo: TFakeAliquotaAdValoremServicoRepository;
    FAliqAdRemProdRepo: TFakeAliquotaAdRemProdutoRepository;

    function ContarErrosCodigo(const V: ValidacaoOutput; Codigo: Integer): Integer;
    function CriarDocumento: CalcularTributoInput;
    function CriarItem(const &IS: ImpostoSeletivoInput; BaseCalculo, Quantidade: Single; const Unidade: string): ItemCalculoInput;
    function CriarIS(BaseCalculo, Quantidade: Double; const Unidade: string; ImpostoInformado: Double): ImpostoSeletivoInput;
    procedure CriarService;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_BaseCalculo_Item_3Decimais_Falha;
    [Test]
    procedure teste_BaseCalculo_Item_DentroLimites_Aceita;
    [Test]
    procedure teste_Quantidade_Item_DentroLimites_Aceita;
    [Test]
    procedure teste_BaseCalculo_IS_14Inteiros_Falha;
    [Test]
    procedure teste_BaseCalculo_IS_3Decimais_Falha;
    [Test]
    procedure teste_BaseCalculo_IS_DentroLimites_Aceita;
    [Test]
    procedure teste_ImpostoInformado_IS_3Decimais_Falha;
    [Test]
    procedure teste_ImpostoInformado_IS_DentroLimites_Aceita;
    [Test]
    procedure teste_Quantidade_IS_12Inteiros_Falha;
    [Test]
    procedure teste_Quantidade_IS_DentroLimites_Aceita;
  end;

implementation

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

{ TFakeNcmsRepository }

constructor TFakeNcmsRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeNcmsRepository.ObterNcm(const Ncm: string; Data: TDate): NcmEtd;
begin
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

{ TFakeTributoSituacaoTributariaRepository }

constructor TFakeTributoSituacaoTributariaRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeTributoSituacaoTributariaRepository.Obter(const CST: string; TipoTributoId: TipoTributoEnum; Data: TDate): TributoSituacaoTributariaEtd;
begin
  Result := nil;
end;

{ TFakeTratamentoClassificacaoRepository }

constructor TFakeTratamentoClassificacaoRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeTratamentoClassificacaoRepository.ObterTratamentoClassificacaomodel(ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoModel;
begin
  Result := TratamentoClassificacaoModel.Create(1, 1, False, False);
end;

function TFakeTratamentoClassificacaoRepository.ObterTratamentoClassificacao(ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoEtd;
begin
  Result := nil;
end;

function TFakeTratamentoClassificacaoRepository.ObterTratamentoClassificacao(const cClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd;
begin
  Result := nil;
end;

{ TFakeAliquotaAdValoremProdutoRepository }

constructor TFakeAliquotaAdValoremProdutoRepository.Create(const Aliquota: CurrencyNullable);
begin
  inherited Create(nil);
  FAliquota := Aliquota;
end;

function TFakeAliquotaAdValoremProdutoRepository.ObterAliquota(const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate): CurrencyNullable;
begin
  Result := FAliquota;
end;

{ TFakeAliquotaAdValoremServicoRepository }

constructor TFakeAliquotaAdValoremServicoRepository.Create;
begin
  inherited Create(nil);
end;

function TFakeAliquotaAdValoremServicoRepository.ObterAliquotaAdValorem(const Nbs: string; TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate): CurrencyNullable;
begin
  Result := CurrencyNullable.NullInstance();
end;

function TFakeAliquotaAdValoremServicoRepository.ObterAliquotaAdValoremPorClassificacaoTributaria(TipoTributo: TipoTributoEnum; ClassifiscacaoTributariaId: Integer; Data: TDate): CurrencyNullable;
begin
  Result := CurrencyNullable.NullInstance();
end;

{ TFakeAliquotaAdRemProdutoRepository }

constructor TFakeAliquotaAdRemProdutoRepository.Create(const AdRem: AliquotaAdRemModel);
begin
  inherited Create(nil);
  FAdRem := AdRem;
end;

function TFakeAliquotaAdRemProdutoRepository.ObterAliquotaAdRem(const Ncm: string; TipoTributo: TipoTributoEnum; Data: TDate): AliquotaAdRemModel;
begin
  Result := FAdRem;
end;

{ TFakeClassificacaoTributariaService }

function TFakeClassificacaoTributariaService.ObterClassificacaoTributariaCbsIbs(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
begin
  Result := ClassificacaoTributariaModel.Create(1, '000001', '', '000');
end;

function TFakeClassificacaoTributariaService.ObterClassificacaoTributariaImpostoSeletivo(const CClassTrib: string; Data: TDate): ClassificacaoTributariaModel;
begin
  Result := ClassificacaoTributariaModel.Create(1, '000000', '', '000');
end;

function TFakeClassificacaoTributariaService.ObterClassificacaoTributariaCalculo(Id: Integer): ClassificacaoTributariaCalculoModel;
begin
  Result := ClassificacaoTributariaCalculoModel.NullInstance();
end;

{ TFakeNcmAplicavelService }

function TFakeNcmAplicavelService.Validar(const Ncm: string; ClassificacaoId: Integer; Data: TDate; Tributos: string): ValidacaoOutput;
begin
  Result := ValidacaoOutput.Create();
end;

{ TFakeNbsAplicavelService }

function TFakeNbsAplicavelService.Validar(const Nbs: string; ClassificacaoId: Integer; Data: TDate; const Tributos: string): ValidacaoOutput;
begin
  Result := ValidacaoOutput.Create();
end;

{ TTest_PreparacaoCalculoService_ValidacaoDigitos }

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.Setup;
begin
  CriarService;
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.TearDown;
begin
  FService := nil;
  FAliqAdRemProdRepo.Free;
  FAliqAdValoremServRepo.Free;
  FAliqAdValoremProdRepo.Free;
  FTratamentoClassRepo.Free;
  FTributoSituacaoRepo.Free;
  FNbsRepo.Free;
  FNcmsRepo.Free;
  FMunicipiosRepo.Free;
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.CriarService;
var
  classTribService: IClassificacaoTributariaService;
  ncmAplService: INcmAplicavelService;
  nbsAplService: INbsAplicavelService;
begin
  FMunicipiosRepo := TFakeMunicipiosRepository.Create();
  FNcmsRepo := TFakeNcmsRepository.Create();
  FNbsRepo := TFakeNbsRepository.Create();
  FTributoSituacaoRepo := TFakeTributoSituacaoTributariaRepository.Create();
  FTratamentoClassRepo := TFakeTratamentoClassificacaoRepository.Create();
  FAliqAdValoremProdRepo := TFakeAliquotaAdValoremProdutoRepository.Create(CurrencyNullable.NullInstance());
  FAliqAdValoremServRepo := TFakeAliquotaAdValoremServicoRepository.Create();
  FAliqAdRemProdRepo := TFakeAliquotaAdRemProdutoRepository.Create(AliquotaAdRemModel.NullInstance());

  classTribService := TFakeClassificacaoTributariaService.Create();
  ncmAplService := TFakeNcmAplicavelService.Create();
  nbsAplService := TFakeNbsAplicavelService.Create();

  FService := PreparacaoCalculoServiceInter.Create(
    FMunicipiosRepo,
    FNcmsRepo,
    FNbsRepo,
    FTributoSituacaoRepo,
    nil, // IClassificacaoTributariaRepository nao e utilizado por Preparar
    FTratamentoClassRepo,
    ncmAplService,
    nbsAplService,
    FAliqAdValoremProdRepo,
    FAliqAdValoremServRepo,
    FAliqAdRemProdRepo,
    nil, // IRedutorCompraGovernamentalRepository so e consultado com GCompraGov
    classTribService
  );
end;

function TTest_PreparacaoCalculoService_ValidacaoDigitos.CriarDocumento: CalcularTributoInput;
begin
  Result := CalcularTributoInput.Create(EncodeDate(2027, 1, 1), 4314902, 'RS', nil, CompraGovernamentalInput.NullInstance(), 0);
end;

function TTest_PreparacaoCalculoService_ValidacaoDigitos.CriarItem(const &IS: ImpostoSeletivoInput;
  BaseCalculo, Quantidade: Single; const Unidade: string): ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    1,
    '',
    '000001',
    '000',
    &IS,
    TributacaoRegularInput.NullInstance(),
    BaseCalculo,
    Quantidade,
    Unidade
  );
end;

function TTest_PreparacaoCalculoService_ValidacaoDigitos.CriarIS(BaseCalculo, Quantidade: Double;
  const Unidade: string; ImpostoInformado: Double): ImpostoSeletivoInput;
begin
  Result := ImpostoSeletivoInput.Create('000', '000000', BaseCalculo, Quantidade, Unidade, ImpostoInformado);
end;

function TTest_PreparacaoCalculoService_ValidacaoDigitos.ContarErrosCodigo(const V: ValidacaoOutput; Codigo: Integer): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to High(V.Validacoes) do
    if V.Validacoes[i].Codigo = Codigo then
      Inc(Result);
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_BaseCalculo_Item_3Decimais_Falha;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  // 0.125 = 3 casas decimais (representacao exata em Single).
  item := CriarItem(ImpostoSeletivoInput.NullInstance(), 1000.125, 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.IsTrue(ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS) > 0,
    'baseCalculo do item com 3 decimais deve violar o limite de 2 decimais');
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_BaseCalculo_Item_DentroLimites_Aceita;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  item := CriarItem(ImpostoSeletivoInput.NullInstance(), 200, 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.AreEqual(0, ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS),
    'baseCalculo do item dentro dos limites nao deve gerar erro de digitos');
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_Quantidade_Item_DentroLimites_Aceita;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  item := CriarItem(ImpostoSeletivoInput.NullInstance(), 100, 1.5, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.AreEqual(0, ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS),
    'quantidade do item dentro dos limites nao deve gerar erro de digitos');
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_BaseCalculo_IS_14Inteiros_Falha;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  item := CriarItem(CriarIS(12345678901234.0, 1.5, 'UN', 12.34), 200, 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.IsTrue(ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS) > 0,
    'baseCalculo do IS com 14 inteiros deve violar o limite de 13 inteiros');
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_BaseCalculo_IS_3Decimais_Falha;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  item := CriarItem(CriarIS(1.234, 1.5, 'UN', 12.34), 200, 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.IsTrue(ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS) > 0,
    'baseCalculo do IS com 3 decimais deve violar o limite de 2 decimais');
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_BaseCalculo_IS_DentroLimites_Aceita;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  item := CriarItem(CriarIS(12345.67, 1.5, 'UN', 12.34), 200, 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.AreEqual(0, ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS),
    'baseCalculo do IS dentro dos limites nao deve gerar erro de digitos');
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_ImpostoInformado_IS_3Decimais_Falha;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  item := CriarItem(CriarIS(12345.67, 1.5, 'UN', 1.234), 200, 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.IsTrue(ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS) > 0,
    'impostoInformado do IS com 3 decimais deve violar o limite de 2 decimais');
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_ImpostoInformado_IS_DentroLimites_Aceita;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  item := CriarItem(CriarIS(12345.67, 1.5, 'UN', 12.34), 200, 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.AreEqual(0, ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS),
    'impostoInformado do IS dentro dos limites nao deve gerar erro de digitos');
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_Quantidade_IS_12Inteiros_Falha;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  item := CriarItem(CriarIS(12345.67, 123456789012.0, 'UN', 12.34), 200, 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.IsTrue(ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS) > 0,
    'quantidade do IS com 12 inteiros deve violar o limite de 11 inteiros');
end;

procedure TTest_PreparacaoCalculoService_ValidacaoDigitos.teste_Quantidade_IS_DentroLimites_Aceita;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  documento := CriarDocumento;
  item := CriarItem(CriarIS(12345.67, 12345.6789, 'UN', 12.34), 200, 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.AreEqual(0, ContarErrosCodigo(resultado.Validacoes, ECOD_VALIDACAO_DIGITOS),
    'quantidade do IS dentro dos limites nao deve gerar erro de digitos');
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_PreparacaoCalculoService_ValidacaoDigitos);

end.
