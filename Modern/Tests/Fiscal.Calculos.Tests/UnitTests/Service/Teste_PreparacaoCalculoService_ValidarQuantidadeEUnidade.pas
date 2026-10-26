unit Teste_PreparacaoCalculoService_ValidarQuantidadeEUnidade;

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
  TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade = class
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

    function PossuiMensagem(const V: ValidacaoOutput; const Trecho: string): Boolean;
    function CriarDocumento: CalcularTributoInput;
    function CriarItemComNCM(const &IS: ImpostoSeletivoInput; Quantidade: Single; const Unidade: string): ItemCalculoInput;
    function CriarIS(BaseCalculo, Quantidade: Double; const Unidade: string; ImpostoInformado: Double): ImpostoSeletivoInput;
    procedure CriarService(const AdValorem: CurrencyNullable; const AdRem: AliquotaAdRemModel);
  public
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_ISAdRem_SemQuantidadeUnidade_Rejeita;
    [Test]
    procedure teste_ISAdRem_QuantidadeUnidadeValidas_Aceita;
    [Test]
    procedure teste_QuantidadeGlobal_Zero_Rejeita;
    [Test]
    procedure teste_QuantidadeGlobal_Positiva_Aceita;
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

{ TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade }

procedure TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.TearDown;
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

procedure TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.CriarService(const AdValorem: CurrencyNullable; const AdRem: AliquotaAdRemModel);
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
  FAliqAdValoremProdRepo := TFakeAliquotaAdValoremProdutoRepository.Create(AdValorem);
  FAliqAdValoremServRepo := TFakeAliquotaAdValoremServicoRepository.Create();
  FAliqAdRemProdRepo := TFakeAliquotaAdRemProdutoRepository.Create(AdRem);

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

function TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.CriarDocumento: CalcularTributoInput;
begin
  Result := CalcularTributoInput.Create(EncodeDate(2027, 1, 1), 4314902, 'RS', nil, CompraGovernamentalInput.NullInstance(), 0);
end;

function TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.CriarItemComNCM(const &IS: ImpostoSeletivoInput;
  Quantidade: Single; const Unidade: string): ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    1,
    '24021000',
    '000001',
    '000',
    &IS,
    TributacaoRegularInput.NullInstance(),
    100,
    Quantidade,
    Unidade
  );
end;

function TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.CriarIS(BaseCalculo, Quantidade: Double;
  const Unidade: string; ImpostoInformado: Double): ImpostoSeletivoInput;
begin
  Result := ImpostoSeletivoInput.Create('000', '000000', BaseCalculo, Quantidade, Unidade, ImpostoInformado);
end;

function TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.PossuiMensagem(const V: ValidacaoOutput; const Trecho: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(V.Validacoes) do
    if Pos(Trecho, V.Validacoes[i].Detalhe) > 0 then
    begin
      Result := True;
      Exit;
    end;
end;

procedure TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.teste_ISAdRem_SemQuantidadeUnidade_Rejeita;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  // IS ad rem: aliquota ad rem presente, com unidade de medida 'UN'.
  CriarService(CurrencyNullable.Create(1), AliquotaAdRemModel.Create(5, 'UN'));

  documento := CriarDocumento;
  // Item com quantidade positiva/unidade compativel, mas IS sem quantidade/unidade.
  item := CriarItemComNCM(CriarIS(100, 0, '', 0), 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.IsTrue(PossuiMensagem(resultado.Validacoes, 'quantidade do Imposto Seletivo deve ser maior do que zero'),
    'IS ad rem sem quantidade deve rejeitar');
  Assert.IsTrue(PossuiMensagem(resultado.Validacoes, 'unidade de medida do Imposto Seletivo deve ser informada'),
    'IS ad rem sem unidade deve rejeitar');
end;

procedure TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.teste_ISAdRem_QuantidadeUnidadeValidas_Aceita;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  CriarService(CurrencyNullable.Create(1), AliquotaAdRemModel.Create(5, 'UN'));

  documento := CriarDocumento;
  // IS ad rem com quantidade/unidade validas e compativeis com a aliquota.
  item := CriarItemComNCM(CriarIS(100, 2, 'UN', 0), 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.IsFalse(PossuiMensagem(resultado.Validacoes, 'quantidade do Imposto Seletivo'),
    'IS ad rem com quantidade valida nao deve rejeitar');
  Assert.IsFalse(PossuiMensagem(resultado.Validacoes, 'unidade de medida do Imposto Seletivo'),
    'IS ad rem com unidade valida nao deve rejeitar');
end;

procedure TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.teste_QuantidadeGlobal_Zero_Rejeita;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  // Item com IS ad valorem (sem ad rem): a validacao global de quantidade positiva se aplica.
  CriarService(CurrencyNullable.Create(1), AliquotaAdRemModel.NullInstance());

  documento := CriarDocumento;
  item := CriarItemComNCM(CriarIS(100, 1, 'UN', 0), 0, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.IsTrue(PossuiMensagem(resultado.Validacoes, 'quantidade do item deve ser maior do que zero'),
    'item com quantidade zero deve rejeitar pela validacao global');
end;

procedure TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade.teste_QuantidadeGlobal_Positiva_Aceita;
var
  documento: CalcularTributoInput;
  item: ItemCalculoInput;
  resultado: PreparacaoResultado;
begin
  CriarService(CurrencyNullable.Create(1), AliquotaAdRemModel.NullInstance());

  documento := CriarDocumento;
  // No Java, quantidade nula recebe default 1; em Delphi o campo e Single, entao o
  // cenario equivalente e quantidade positiva (default informado pelo chamador).
  item := CriarItemComNCM(CriarIS(100, 1, 'UN', 0), 1, 'UN');
  resultado := FService.Preparar(documento, item);

  Assert.IsFalse(PossuiMensagem(resultado.Validacoes, 'quantidade do item deve ser maior do que zero'),
    'item com quantidade positiva (default 1/UN) nao deve rejeitar');
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_PreparacaoCalculoService_ValidarQuantidadeEUnidade);

end.
