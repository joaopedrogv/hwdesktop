unit Teste_MemoriaCalculoService;

interface

uses
  DUnitX.TestFramework,
  SysUtils,
  MemoriaCalculoServiceUnit,
  IFundamentacaoClassificacaoRepositoryUnit,
  FundamentacaoClassificacaoModelUnit,
  ITratamentosTributariosRepositoryUnit,
  TratamentoTributarioEtdUnit,
  TratamentoClassificacaoModelUnit,
  ResultadoCbsIbsUnit,
  DoubleNullableUnit,
  ReducaoAliquotaModelUnit,
  ResultadoTributacaoRegularUnit,
  TributacaoCompraGovernamentalModelUnit,
  DiferimentoModelUnit,
  ResultadoGrupoMonofasiaUnit,
  StringNullableUnit,
  DateAndTimeNullableUnit;

type
  TFakeFundamentacaoClassificacaoRepository = class(IFundamentacaoClassificacaoRepository)
  private
    FModelo: FundamentacaoClassificacaoModel;
  public
    constructor Create(const Modelo: FundamentacaoClassificacaoModel); reintroduce;
    function ObterPorClassificacaoTributariaId(
      ClassificacaoTributariaId: Integer; Data: TDate
    ): FundamentacaoClassificacaoModel; override;
  end;

  TFakeTratamentosTributariosRepository = class(ITratamentosTributariosRepository)
  private
    FTratamento: TratamentoTributarioEtd;
  public
    constructor Create(const Tratamento: TratamentoTributarioEtd); reintroduce;
    function ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd; override;
  end;

  [TestFixture]
  TTeste_MemoriaCalculoService = class
  private
    FFundamentacaoRepo: TFakeFundamentacaoClassificacaoRepository;
    FTratamentosRepo: TFakeTratamentosTributariosRepository;
    FService: IMemoriaCalculoService;

    procedure CriarService(const TemplateMemoria: string);
    function CriarTratamento(): TratamentoTributarioEtd;
    function CriarTributoNulo(): ResultadoCbsIbs;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure teste_DesoneracaoMontante_ResultamZero;

    [Test]
    procedure teste_CamposNulosOuZerados_ProduzemZeroSemExcecao;
  end;

implementation

{ TFakeFundamentacaoClassificacaoRepository }

constructor TFakeFundamentacaoClassificacaoRepository.Create(const Modelo: FundamentacaoClassificacaoModel);
begin
  inherited Create(nil);
  FModelo := Modelo;
end;

function TFakeFundamentacaoClassificacaoRepository.ObterPorClassificacaoTributariaId(
  ClassificacaoTributariaId: Integer; Data: TDate): FundamentacaoClassificacaoModel;
begin
  Result := FModelo;
end;

{ TFakeTratamentosTributariosRepository }

constructor TFakeTratamentosTributariosRepository.Create(const Tratamento: TratamentoTributarioEtd);
begin
  inherited Create(nil);
  FTratamento := Tratamento;
end;

function TFakeTratamentosTributariosRepository.ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd;
begin
  Result := FTratamento;
end;

{ TTeste_MemoriaCalculoService }

procedure TTeste_MemoriaCalculoService.Setup;
begin
  FFundamentacaoRepo := nil;
  FTratamentosRepo := nil;
  FService := nil;
end;

procedure TTeste_MemoriaCalculoService.TearDown;
begin
  FService := nil;
  FTratamentosRepo.Free();
  FFundamentacaoRepo.Free();
  FTratamentosRepo := nil;
  FFundamentacaoRepo := nil;
end;

procedure TTeste_MemoriaCalculoService.CriarService(const TemplateMemoria: string);
begin
  FFundamentacaoRepo := TFakeFundamentacaoClassificacaoRepository.Create(
    FundamentacaoClassificacaoModel.Create('Norma teste', TemplateMemoria)
  );
  FTratamentosRepo := TFakeTratamentosTributariosRepository.Create(CriarTratamento());
  FService := MemoriaCalculoService.Create(FFundamentacaoRepo, FTratamentosRepo);
end;

function TTeste_MemoriaCalculoService.CriarTratamento: TratamentoTributarioEtd;
var
  sn: StringNullable;
  dn: DateNullable;
begin
  sn := StringNullable.NullInstance();
  dn := DateNullable.NullInstance();
  Result := TratamentoTributarioEtd.Create(
    1,
    'Tratamento teste',
    sn,
    sn,
    '',
    '',
    '',
    sn,
    sn,
    False, False, False, False, False, False,
    0,
    dn
  );
end;

function TTeste_MemoriaCalculoService.CriarTributoNulo: ResultadoCbsIbs;
begin
  // C09-01/02/03/05: base nula, aliquota 0 e quantidade 0 nao devem lancar excecao;
  // a memoria deve ser gerada com zero nos placeholders correspondentes.
  Result := ResultadoCbsIbs.Create(
    0,                               // Aliquota (nao anulavel) zerada
    DoubleNullable.NullInstance(),  // BaseCalculo nula
    0,                               // Quantidade
    0,                               // TributoCalculado
    0,                               // TributoDevido
    ReducaoAliquotaModel.NullInstance(),
    ResultadoTributacaoRegular.NullInstance(),
    TributacaoCompraGovernamentalModel.NullInstance(),
    DiferimentoModel.NullInstance(),
    ResultadoGrupoMonofasia.NullInstance(),
    ''                               // MemoriaCalculo
  );
end;

procedure TTeste_MemoriaCalculoService.teste_DesoneracaoMontante_ResultamZero;
var
  memoria: string;
begin
  CriarService('[aliquota_desoneracao]|[montante_desoneracao]');

  memoria := FService.GerarMemoriaCalculoCbsIbs(
    TratamentoClassificacaoModel.Create(1, 1, False, False),
    CriarTributoNulo(),
    0,
    'UN',
    EncodeDate(2026, 1, 1)
  );

  // C09-04: placeholders de desoneracao e montante desonerado devem resultar em '0'
  // (nao mais string vazia), conforme MemoriaCalculoService.java v0039.
  Assert.AreEqual('0|0', memoria, 'Desoneracao e montante desonerado devem ser "0"');
end;

procedure TTeste_MemoriaCalculoService.teste_CamposNulosOuZerados_ProduzemZeroSemExcecao;
var
  memoria: string;
begin
  CriarService(
    '[base_calculo]|[aliquota_ad_valorem]|[aliquota_ad_rem]|[quantidade]|' +
    '[percentual_reducao]|[percentual_diferimento]|[valor_diferimento]'
  );

  memoria := FService.GerarMemoriaCalculoCbsIbs(
    TratamentoClassificacaoModel.Create(1, 1, False, False),
    CriarTributoNulo(),
    0,
    'UN',
    EncodeDate(2026, 1, 1)
  );

  // Nenhum placeholder deve permanecer sem substituicao e deve haver zero na saida.
  Assert.IsFalse(Pos('[base_calculo]', memoria) > 0, 'base_calculo deve ser substituido');
  Assert.IsFalse(Pos('[aliquota_ad_valorem]', memoria) > 0, 'aliquota_ad_valorem deve ser substituida');
  Assert.IsFalse(Pos('[aliquota_ad_rem]', memoria) > 0, 'aliquota_ad_rem deve ser substituida');
  Assert.IsFalse(Pos('[quantidade]', memoria) > 0, 'quantidade deve ser substituida');
  Assert.IsFalse(Pos('[percentual_reducao]', memoria) > 0, 'percentual_reducao deve ser substituido');
  Assert.IsFalse(Pos('[percentual_diferimento]', memoria) > 0, 'percentual_diferimento deve ser substituido');
  Assert.IsFalse(Pos('[valor_diferimento]', memoria) > 0, 'valor_diferimento deve ser substituido');
  Assert.IsTrue(Pos('0', memoria) > 0, 'Valor zero deve estar presente na memoria');
end;

initialization
  TDUnitX.RegisterTestFixture(TTeste_MemoriaCalculoService);

end.
