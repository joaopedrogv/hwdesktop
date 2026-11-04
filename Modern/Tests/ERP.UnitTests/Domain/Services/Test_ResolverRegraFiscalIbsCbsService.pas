unit Test_ResolverRegraFiscalIbsCbsService;

interface

uses
  DUnitX.TestFramework,
  TipoComunsUnit,
  DFeTypesUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit,
  OperacaoFiscalIbsCbsEtdUnit,
  RegraFiscalIbsCbsEtdUnit,
  ResolverRegraFiscalIbsCbsTypesUnit,
  IResolverRegraFiscalIbsCbsServiceUnit,
  StubOperacoesFiscaisIbsCbsRepositoryUnit,
  StubRegrasFiscaisIbsCbsRepositoryUnit;

type
  [TestFixture]
  TTestResolverRegraFiscalIbsCbsService = class
  private
    FOperacoesRepo: TOperacoesFiscaisIbsCbsRepositoryStub;
    FRegrasRepo: TRegrasFiscaisIbsCbsRepositoryStub;
    FService: IResolverRegraFiscalIbsCbsService;

    function CriarRegra(const Id, CClassTrib: string): RegraFiscalIbsCbsEtd;
    function CriarRegraCom(const Id, CClassTrib: string;
      PDifCbs: Currency; TpOperGov: Integer): RegraFiscalIbsCbsEtd;
    function CriarRegraComRegular(const Id, CClassTrib, RegraRegularId,
      CClassTribRegular: string): RegraFiscalIbsCbsEtd;
    function CriarCandidato(const Id, RegraFiscalId, GrupoFiscalId: string;
      const Condicoes: array of OperacaoFiscalIbsCbsCondicaoEtd): OperacaoFiscalIbsCbsEtd;

    procedure AdicionarCandidato(const Id, RegraFiscalId, GrupoFiscalId: string;
      const Condicoes: array of OperacaoFiscalIbsCbsCondicaoEtd);
    procedure AdicionarRegraSimples(const Id, CClassTrib: string);

    function Executar(const TipoEmissao: TipoEmissaoOcorrencia;
      const Natureza: NaturezaEmissaoOcorrencia;
      TipoOrgaoPublico: TipoEnteGovEnum): ResolverRegraFiscalIbsCbsResult;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveRetornarNenhumaRegraSemCandidatos;

    [Test]
    procedure DeveDeterminarUnicaHipotese;

    [Test]
    procedure DeveSinalizarRedundanciaComRespostasEquivalentes;

    [Test]
    procedure DeveEscolherHipoteseMaisRestritiva;

    [Test]
    procedure DeveDetectarConflitoEntreHipotesesIncomparaveis;

    [Test]
    procedure DeveDetectarConflitoQuandoDiferencaDeDiferimento;

    [Test]
    procedure DeveDetectarConflitoQuandoDiferencaDeOperacaoGovernamental;

    [Test]
    procedure DeveDetectarConflitoQuandoDiferencaDeRegraRegular;

    [Test]
    procedure DeveDescartarCandidatoComCondicaoFalsa;

    [Test]
    procedure DeveDescartarCandidatoComCondicaoFalsaMesmoComFatoDesconhecido;

    [Test]
    procedure DeveRetornarPendenciaQuandoFatoDesconhecidoAlteraResposta;

    [Test]
    procedure DeveIgnorarPendenciaQuandoTodosOsPreenchimentosSaoEquivalentes;

    [Test]
    procedure DeveListarAtributosPendentesCorretos;

    [Test]
    procedure DeveSinalizarRedundanciaEntreInstanciasEquivalentes;

    [Test]
    procedure DeveRetornarConfiguracaoInvalidaNoEscopoEspecifico;

    [Test]
    procedure DeveIgnorarConfiguracaoInvalidaNoPadraoInalcancavel;

    [Test]
    procedure DeveRetornarConfiguracaoInvalidaNoPadraoAlcancavel;

    [Test]
    procedure DeveRetornarConfiguracaoInvalidaQuandoFatoDesconhecidoAlcancaPadraoInvalido;

    [Test]
    procedure DeveRetornarConfiguracaoInvalidaQuandoRegraAusente;

    [Test]
    procedure DeveRejeitarEntradaSomenteAnaliseNaDeterminacao;

    [Test]
    procedure DevePreferirEscopoEspecifico;

    [Test]
    procedure DeveUsarPadraoQuandoEspecificoNaoAplicavel;

    [Test]
    procedure DeveDecidirIndependenteDaOrdemDosCandidatos;

    [Test]
    procedure DeveAnalisarConfiguracao;

    [Test]
    procedure DeveIdentificarVinculoPorDescricoes;

    [Test]
    procedure DeveAnalisarRascunhoNoLugarDoPersistido;

    [Test]
    procedure DeveAnalisarComRotuloSemExporIdentificador;
  end;

implementation

uses
  SysUtils,
  StringNullableUnit,
  DateAndTimeNullableUnit,
  IntegerNullableUnit,
  CurrencyNullableUnit,
  StatusRegistroEnumUnit,
  ResolverRegraFiscalIbsCbsServiceUnit;

const
  OP_INTERNA_ID = 'OP-1';
  EMPRESA_ID = 1;

function CriarCondicao(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  const Valores: array of Integer): OperacaoFiscalIbsCbsCondicaoEtd;
var
  lista: TArrayInteger;
  i: Integer;
begin
  SetLength(lista, Length(Valores));
  for i := 0 to High(Valores) do
    lista[i] := Valores[i];
  Result := OperacaoFiscalIbsCbsCondicaoEtd.Create(Atributo, lista);
end;

function MensagensContem(const Analise: ResolverRegraFiscalIbsCbsAnalise;
  const Trecho: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(Analise.Mensagens) do
    if Pos(LowerCase(Trecho), LowerCase(Analise.Mensagens[i])) > 0 then
    begin
      Result := True;
      Exit;
    end;
end;

function ApontamentosContemTipo(const Analise: ResolverRegraFiscalIbsCbsAnalise;
  Tipo: ResolverRegraFiscalIbsCbsApontamentoTipo): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(Analise.Apontamentos) do
    if Analise.Apontamentos[i].Tipo = Tipo then
    begin
      Result := True;
      Exit;
    end;
end;

{ TTestResolverRegraFiscalIbsCbsService }

procedure TTestResolverRegraFiscalIbsCbsService.Setup;
begin
  FOperacoesRepo := TOperacoesFiscaisIbsCbsRepositoryStub.Create;
  FRegrasRepo := TRegrasFiscaisIbsCbsRepositoryStub.Create;
  FService := ResolverRegraFiscalIbsCbsService.Create(FOperacoesRepo, FRegrasRepo);
end;

procedure TTestResolverRegraFiscalIbsCbsService.TearDown;
begin
  // Liberar a interface antes dos repositorios que ela referencia.
  FService := nil;
  FOperacoesRepo.Free;
  FRegrasRepo.Free;
end;

function TTestResolverRegraFiscalIbsCbsService.CriarRegra(
  const Id, CClassTrib: string): RegraFiscalIbsCbsEtd;
begin
  Result := CriarRegraCom(Id, CClassTrib, 0, 0);
end;

function TTestResolverRegraFiscalIbsCbsService.CriarRegraCom(
  const Id, CClassTrib: string; PDifCbs: Currency; TpOperGov: Integer): RegraFiscalIbsCbsEtd;
begin
  Result := RegraFiscalIbsCbsEtd.Create(
    Id,
    'Regra ' + Id,
    CClassTrib,
    CurrencyNullable.Create(PDifCbs),
    CurrencyNullable.Create(0),
    CurrencyNullable.Create(0),
    IntegerNullable.Create(TpOperGov),
    EncodeDate(2024, 1, 1),
    DateNullable.NullInstance(),
    EncodeDate(2024, 1, 1),
    EncodeDate(2024, 1, 1),
    saAtivo,
    StringNullable.NullInstance(),
    StringNullable.NullInstance(),
    nil);
end;

function TTestResolverRegraFiscalIbsCbsService.CriarRegraComRegular(
  const Id, CClassTrib, RegraRegularId, CClassTribRegular: string): RegraFiscalIbsCbsEtd;
begin
  Result := RegraFiscalIbsCbsEtd.Create(
    Id,
    'Regra ' + Id,
    CClassTrib,
    CurrencyNullable.Create(0),
    CurrencyNullable.Create(0),
    CurrencyNullable.Create(0),
    IntegerNullable.Create(0),
    EncodeDate(2024, 1, 1),
    DateNullable.NullInstance(),
    EncodeDate(2024, 1, 1),
    EncodeDate(2024, 1, 1),
    saAtivo,
    StringNullable.Create(RegraRegularId),
    StringNullable.Create(CClassTribRegular),
    nil);
end;

function TTestResolverRegraFiscalIbsCbsService.CriarCandidato(
  const Id, RegraFiscalId, GrupoFiscalId: string;
  const Condicoes: array of OperacaoFiscalIbsCbsCondicaoEtd): OperacaoFiscalIbsCbsEtd;
var
  grupo: StringNullable;
  lista: OperacaoFiscalIbsCbsCondicaoEtdArray;
  i: Integer;
begin
  if Trim(GrupoFiscalId) = '' then
    grupo := StringNullable.NullInstance()
  else
    grupo := StringNullable.Create(GrupoFiscalId);

  Result := OperacaoFiscalIbsCbsEtd.Create(
    Id,
    OP_INTERNA_ID,
    RegraFiscalId,
    grupo,
    EncodeDate(2024, 1, 1),
    DateNullable.NullInstance(),
    EncodeDate(2024, 1, 1),
    EncodeDate(2024, 1, 1),
    saAtivo,
    nil);

  // A descricao de operacao interna padrao do fixture reproduz o rotulo
  // utilizado nas mensagens reais, sem depender do GUID do vinculo.
  Result.OperacaoInternaDescricao := Id;

  SetLength(lista, Length(Condicoes));
  for i := 0 to High(Condicoes) do
    lista[i] := Condicoes[i];
  Result.Condicoes := lista;
end;

procedure TTestResolverRegraFiscalIbsCbsService.AdicionarCandidato(
  const Id, RegraFiscalId, GrupoFiscalId: string;
  const Condicoes: array of OperacaoFiscalIbsCbsCondicaoEtd);
begin
  FOperacoesRepo.AdicionarCandidato(
    CriarCandidato(Id, RegraFiscalId, GrupoFiscalId, Condicoes));
end;

procedure TTestResolverRegraFiscalIbsCbsService.AdicionarRegraSimples(
  const Id, CClassTrib: string);
begin
  FRegrasRepo.AdicionarRegra(CriarRegra(Id, CClassTrib));
end;

function TTestResolverRegraFiscalIbsCbsService.Executar(
  const TipoEmissao: TipoEmissaoOcorrencia;
  const Natureza: NaturezaEmissaoOcorrencia;
  TipoOrgaoPublico: TipoEnteGovEnum): ResolverRegraFiscalIbsCbsResult;
begin
  Result := FService.Executar(ResolverRegraFiscalIbsCbsInput.Create(
    OP_INTERNA_ID, '', EMPRESA_ID, EncodeDate(2026, 1, 1),
    TipoEmissao, Natureza, TipoOrgaoPublico));
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveRetornarNenhumaRegraSemCandidatos;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrNenhumaRegra);
    Assert.IsTrue(resultado.RegraFiscal = nil);
    Assert.AreEqual(0, Length(resultado.AtributosPendentes));
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveDeterminarUnicaHipotese;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarCandidato('C1', 'R1', '', []);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado);
    Assert.IsTrue(Assigned(resultado.RegraFiscal));
    Assert.AreEqual('R1', resultado.RegraFiscal.Id);
    Assert.IsFalse(resultado.Redundante);
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveSinalizarRedundanciaComRespostasEquivalentes;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarCandidato('C1', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  AdicionarCandidato('C2', 'R1', 'G1',
    [CriarCondicao(ocaNaturezaEmissao, [2])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado);
    Assert.AreEqual('R1', resultado.RegraFiscal.Id);
    Assert.IsTrue(resultado.Redundante);
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveEscolherHipoteseMaisRestritiva;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');
  AdicionarCandidato('BASE', 'R1', '', []);
  AdicionarCandidato('EXCECAO', 'R2', '',
    [CriarCondicao(ocaTipoOrgaoPublico, [1])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvUniao);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado);
    Assert.AreEqual('R2', resultado.RegraFiscal.Id,
      'a hipotese mais restritiva deve prevalecer');
  finally
    resultado.Free;
  end;

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado);
    Assert.AreEqual('R1', resultado.RegraFiscal.Id,
      'sem correspondencia da excecao, a base deve prevalecer');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveDetectarConflitoEntreHipotesesIncomparaveis;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');
  AdicionarCandidato('C1', 'R1', '',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  AdicionarCandidato('C2', 'R2', '',
    [CriarCondicao(ocaNaturezaEmissao, [2])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrConflito);
    Assert.IsTrue(resultado.RegraFiscal = nil);
    Assert.IsTrue(Pos('conflito', LowerCase(resultado.Mensagem)) > 0);
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveDetectarConflitoQuandoDiferencaDeDiferimento;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  FRegrasRepo.AdicionarRegra(CriarRegraCom('R1', '000001', 0, 0));
  FRegrasRepo.AdicionarRegra(CriarRegraCom('R2', '000001', 10, 0));
  AdicionarCandidato('C1', 'R1', '',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  AdicionarCandidato('C2', 'R2', '',
    [CriarCondicao(ocaNaturezaEmissao, [2])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrConflito,
      'diferimento distinto com o mesmo cClassTrib nao e equivalencia');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveDetectarConflitoQuandoDiferencaDeOperacaoGovernamental;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  FRegrasRepo.AdicionarRegra(CriarRegraCom('R1', '000001', 0, 0));
  FRegrasRepo.AdicionarRegra(CriarRegraCom('R2', '000001', 0, 1));
  AdicionarCandidato('C1', 'R1', '',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  AdicionarCandidato('C2', 'R2', '',
    [CriarCondicao(ocaNaturezaEmissao, [2])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrConflito,
      'operacao governamental distinta nao e equivalencia');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveDetectarConflitoQuandoDiferencaDeRegraRegular;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  FRegrasRepo.AdicionarRegra(CriarRegraComRegular('R1', '000001', 'RR1', 'CT1'));
  FRegrasRepo.AdicionarRegra(CriarRegraComRegular('R2', '000001', 'RR2', 'CT1'));
  AdicionarCandidato('C1', 'R1', '',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  AdicionarCandidato('C2', 'R2', '',
    [CriarCondicao(ocaNaturezaEmissao, [2])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrConflito,
      'regra regular distinta nao e equivalencia');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveDescartarCandidatoComCondicaoFalsa;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');
  AdicionarCandidato('BASE', 'R1', '', []);
  AdicionarCandidato('EXCECAO', 'R2', '',
    [CriarCondicao(ocaTipoEmissao, [1])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecTerceiros),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado);
    Assert.AreEqual('R1', resultado.RegraFiscal.Id,
      'a condicao falsa deve descartar a excecao');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveDescartarCandidatoComCondicaoFalsaMesmoComFatoDesconhecido;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarCandidato('C1', 'R1', '',
    [CriarCondicao(ocaTipoEmissao, [1]),
     CriarCondicao(ocaNaturezaEmissao, [1])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecTerceiros),
    NaturezaEmissaoOcorrencia.Desconhecido,
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrNenhumaRegra,
      'condicao falsa descarta o vinculo mesmo com natureza desconhecida');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveRetornarPendenciaQuandoFatoDesconhecidoAlteraResposta;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
  pendentes: OperacaoFiscalIbsCbsCondicaoAtributoArray;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');
  AdicionarCandidato('BASE', 'R1', '', []);
  AdicionarCandidato('EXCECAO', 'R2', '',
    [CriarCondicao(ocaTipoEmissao, [1])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Desconhecido,
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrInformacaoPendente);
    Assert.IsTrue(resultado.RegraFiscal = nil);
    pendentes := resultado.AtributosPendentes;
    Assert.AreEqual(1, Length(pendentes));
    Assert.IsTrue(pendentes[0] = ocaTipoEmissao);
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveIgnorarPendenciaQuandoTodosOsPreenchimentosSaoEquivalentes;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarCandidato('BASE', 'R1', '', []);

  resultado := Executar(
    TipoEmissaoOcorrencia.Desconhecido,
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado);
    Assert.AreEqual('R1', resultado.RegraFiscal.Id);
    Assert.AreEqual(0, Length(resultado.AtributosPendentes));
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveSinalizarRedundanciaEntreInstanciasEquivalentes;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  FRegrasRepo.AdicionarRegra(CriarRegraCom('R1', '000001', 0, 0));
  FRegrasRepo.AdicionarRegra(CriarRegraCom('R2', '000001', 0, 0));
  AdicionarCandidato('C1', 'R1', '',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  AdicionarCandidato('C2', 'R2', '',
    [CriarCondicao(ocaTipoEmissao, [2])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Desconhecido,
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado);
    Assert.IsTrue(resultado.Redundante,
      'instancias equivalentes distintas devem ser redundantes');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveListarAtributosPendentesCorretos;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
  pendentes: OperacaoFiscalIbsCbsCondicaoAtributoArray;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');
  AdicionarCandidato('C1', 'R1', '',
    [CriarCondicao(ocaTipoEmissao, [1]),
     CriarCondicao(ocaNaturezaEmissao, [1])]);
  AdicionarCandidato('C2', 'R2', '',
    [CriarCondicao(ocaTipoEmissao, [2]),
     CriarCondicao(ocaNaturezaEmissao, [2])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Desconhecido,
    NaturezaEmissaoOcorrencia.Desconhecido,
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrInformacaoPendente);
    pendentes := resultado.AtributosPendentes;
    Assert.AreEqual(2, Length(pendentes));
    Assert.IsTrue(pendentes[0] = ocaTipoEmissao);
    Assert.IsTrue(pendentes[1] = ocaNaturezaEmissao);
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveRetornarConfiguracaoInvalidaNoEscopoEspecifico;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarCandidato('VALIDO', 'R1', 'G1', []);
  AdicionarCandidato('INVALIDO', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrConfiguracaoInvalida,
      'candidato invalido no escopo especifico sempre e relevante');
    Assert.IsTrue(Pos('INVALIDO', resultado.Mensagem) > 0);
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveIgnorarConfiguracaoInvalidaNoPadraoInalcancavel;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');
  AdicionarCandidato('ESPECIFICO', 'R1', 'G1', []);
  AdicionarCandidato('PADRAO_INVALIDO', 'R2', '',
    [CriarCondicao(ocaTipoOrgaoPublico, [])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado,
      'o padrao inalcancavel nao deve propagar sua invalidez');
    Assert.IsTrue(Assigned(resultado.RegraFiscal));
    Assert.AreEqual('R1', resultado.RegraFiscal.Id,
      'o vinculo especifico aplicavel prevalece sobre o padrao');
    Assert.AreEqual('000001', resultado.RegraFiscal.CClassTrib,
      'a resposta efetiva deve ser a da regra do vinculo especifico');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveRetornarConfiguracaoInvalidaNoPadraoAlcancavel;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarCandidato('ESPECIFICO', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  AdicionarCandidato('PADRAO_INVALIDO', 'R1', '',
    [CriarCondicao(ocaTipoOrgaoPublico, [])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecTerceiros),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrConfiguracaoInvalida,
      'o padrao alcancado tem configuracao invalida');
    Assert.IsTrue(Pos('PADRAO_INVALIDO', resultado.Mensagem) > 0);
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveRetornarConfiguracaoInvalidaQuandoFatoDesconhecidoAlcancaPadraoInvalido;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  // Preenchimento propria alcanca o especifico aplicavel; preenchimento
  // terceiros o descarta e alcanca o padrao invalido. A invalidez relevante
  // tem prioridade sobre a pendencia do fato desconhecido.
  AdicionarRegraSimples('R1', '000001');
  AdicionarCandidato('ESPECIFICO', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  AdicionarCandidato('PADRAO_INVALIDO', 'R1', '',
    [CriarCondicao(ocaTipoOrgaoPublico, [])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Desconhecido,
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrConfiguracaoInvalida,
      'fato desconhecido que torna o padrao alcancavel nao pode mascarar a invalidez');
    Assert.IsTrue(Pos('PADRAO_INVALIDO', resultado.Mensagem) > 0);
    Assert.IsTrue(resultado.RegraFiscal = nil);
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveRetornarConfiguracaoInvalidaQuandoRegraAusente;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarCandidato('C1', 'R-AUSENTE', '', []);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrConfiguracaoInvalida);
    Assert.IsTrue(Pos('nao encontrada', resultado.Mensagem) > 0);
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveRejeitarEntradaSomenteAnaliseNaDeterminacao;
var
  entradaAnalise: ResolverRegraFiscalIbsCbsInput;
  entradaDeterminacao: ResolverRegraFiscalIbsCbsInput;
  rejeitada: Boolean;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarCandidato('BASE', 'R1', '', []);

  entradaDeterminacao := ResolverRegraFiscalIbsCbsInput.Create(
    OP_INTERNA_ID, '', EMPRESA_ID, EncodeDate(2026, 1, 1),
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  Assert.IsFalse(entradaDeterminacao.SomenteAnalise,
    'a entrada de determinacao nao carrega o marcador de analise');

  entradaAnalise := ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
    OP_INTERNA_ID, '', EMPRESA_ID, EncodeDate(2026, 1, 1));
  Assert.IsTrue(entradaAnalise.SomenteAnalise,
    'CreateParaAnalise deve marcar a entrada como restrita a analise');

  rejeitada := False;
  try
    FService.Executar(entradaAnalise).Free;
  except
    on E: Exception do
      rejeitada := Pos('analise', LowerCase(E.Message)) > 0;
  end;

  Assert.IsTrue(rejeitada,
    'Executar deve rejeitar explicitamente a entrada criada para analise');
end;

procedure TTestResolverRegraFiscalIbsCbsService.DevePreferirEscopoEspecifico;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');
  AdicionarCandidato('ESPECIFICO', 'R1', 'G1', []);
  AdicionarCandidato('PADRAO', 'R2', '', []);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado);
    Assert.IsTrue(Assigned(resultado.RegraFiscal));
    Assert.AreEqual('R1', resultado.RegraFiscal.Id,
      'o vinculo especifico prevalece; R2 pertence ao padrao');
    Assert.AreEqual('000001', resultado.RegraFiscal.CClassTrib,
      'a resposta efetiva deve ser a da regra do escopo especifico');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveUsarPadraoQuandoEspecificoNaoAplicavel;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');
  AdicionarCandidato('ESPECIFICO', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [2])]);
  AdicionarCandidato('PADRAO', 'R2', '', []);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrDeterminado);
    Assert.IsTrue(Assigned(resultado.RegraFiscal));
    Assert.AreEqual('R2', resultado.RegraFiscal.Id,
      'o especifico nao aplicavel deve ser descartado e o padrao R2 usado');
    Assert.AreEqual('000002', resultado.RegraFiscal.CClassTrib,
      'a resposta efetiva deve ser a do vinculo padrao');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveDecidirIndependenteDaOrdemDosCandidatos;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');

  AdicionarCandidato('BASE', 'R1', '', []);
  AdicionarCandidato('EXCECAO', 'R2', '',
    [CriarCondicao(ocaTipoOrgaoPublico, [1])]);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvUniao);
  try
    Assert.AreEqual('R2', resultado.RegraFiscal.Id);
  finally
    resultado.Free;
  end;

  FOperacoesRepo.LimparCandidatos;
  AdicionarCandidato('EXCECAO', 'R2', '',
    [CriarCondicao(ocaTipoOrgaoPublico, [1])]);
  AdicionarCandidato('BASE', 'R1', '', []);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvUniao);
  try
    Assert.AreEqual('R2', resultado.RegraFiscal.Id,
      'a ordem devolvida pelo repositorio nao decide a resposta');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveAnalisarConfiguracao;
var
  analise: ResolverRegraFiscalIbsCbsAnalise;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');

  AdicionarCandidato('UNIVERSAL', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [1, 2])]);
  AdicionarCandidato('REDUNDANTE', 'R1', 'G1',
    [CriarCondicao(ocaTipoOrgaoPublico, [1])]);
  AdicionarCandidato('CRUZAMENTO', 'R2', 'G1',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  AdicionarCandidato('INVALIDO', 'R1', '',
    [CriarCondicao(ocaTipoEmissao, [])]);
  AdicionarCandidato('SEM_REGRA', 'R-AUSENTE', '', []);

  analise := FService.Analisar(ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
    OP_INTERNA_ID, '', EMPRESA_ID, EncodeDate(2026, 1, 1)));
  try
    Assert.IsTrue(MensagensContem(analise, 'aceita todas as opções'),
      'condicao universal deve ser sinalizada');
    Assert.IsTrue(MensagensContem(analise, 'mesmo resultado tributário'),
      'possivel duplicidade deve ser sinalizada');
    Assert.IsTrue(MensagensContem(analise, 'resultados tributários diferentes'),
      'cruzamento potencial deve ser sinalizado');
    Assert.IsTrue(MensagensContem(analise, 'não reconhece'),
      'configuracao invalida deve ser reportada');
    Assert.IsTrue(MensagensContem(analise, 'não foi encontrada'),
      'referencia de regra ausente deve ser reportada');
    Assert.IsFalse(MensagensContem(analise, 'R-AUSENTE'),
      'a mensagem nao deve expor o identificador da regra ausente');

    Assert.IsTrue(ApontamentosContemTipo(analise, ratObservacaoOpcoes),
      'a observacao de opcoes deve ter tipo proprio');
    Assert.IsTrue(ApontamentosContemTipo(analise, ratDuplicidade),
      'a duplicidade deve ter tipo proprio');
    Assert.IsTrue(ApontamentosContemTipo(analise, ratConflito),
      'o conflito deve ter tipo proprio');
    Assert.IsTrue(ApontamentosContemTipo(analise, ratRegraAusente),
      'a regra ausente deve ter tipo proprio');
    Assert.IsTrue(ApontamentosContemTipo(analise, ratValorInvalido),
      'o valor invalido deve ter tipo proprio');
    Assert.AreEqual(Length(analise.Mensagens), Length(analise.Apontamentos),
      'cada apontamento deve espelhar uma mensagem da analise');
  finally
    analise.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveIdentificarVinculoPorDescricoes;
var
  resultado: ResolverRegraFiscalIbsCbsResult;
  candidato: OperacaoFiscalIbsCbsEtd;
begin
  AdicionarRegraSimples('R1', '000001');
  candidato := CriarCandidato('C-GUID-NAO-EXIBIR', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [])]);
  candidato.OperacaoInternaDescricao := 'Venda';
  candidato.GrupoFiscalDescricao := 'Grupo A';
  candidato.RegraFiscalDescricao := 'Regra A';
  FOperacoesRepo.AdicionarCandidato(candidato);

  resultado := Executar(
    TipoEmissaoOcorrencia.Conhecido(tecPropria),
    NaturezaEmissaoOcorrencia.Conhecido(necSaida),
    tgvNenhum);
  try
    Assert.IsTrue(resultado.Status = rrConfiguracaoInvalida);
    Assert.IsTrue(Pos('Venda', resultado.Mensagem) > 0);
    Assert.IsTrue(Pos('Grupo A', resultado.Mensagem) > 0);
    Assert.IsTrue(Pos('Regra A', resultado.Mensagem) > 0);
    Assert.IsTrue(Pos('01/01/2024', resultado.Mensagem) > 0);
    Assert.IsTrue(Pos('C-GUID-NAO-EXIBIR', resultado.Mensagem) = 0,
      'a identificacao nao deve expor o GUID');
  finally
    resultado.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveAnalisarRascunhoNoLugarDoPersistido;
var
  analise: ResolverRegraFiscalIbsCbsAnalise;
  entrada: ResolverRegraFiscalIbsCbsInput;
  entradaSemRascunho: ResolverRegraFiscalIbsCbsInput;
  persistido: OperacaoFiscalIbsCbsEtd;
  rascunho: OperacaoFiscalIbsCbsEtd;
begin
  AdicionarRegraSimples('R1', '000001');
  AdicionarRegraSimples('R2', '000002');

  // Vinculo persistido de mesmo Id; deve ser substituido pelo rascunho.
  persistido := CriarCandidato('VINCULO-1', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [1])]);
  persistido.OperacaoInternaDescricao := 'Persistido Venda';
  persistido.GrupoFiscalDescricao := 'Grupo Persistido';
  persistido.RegraFiscalDescricao := 'Regra Persistida';
  FOperacoesRepo.AdicionarCandidato(persistido);

  AdicionarCandidato('OUTRO', 'R2', 'G1',
    [CriarCondicao(ocaNaturezaEmissao, [2])]);

  rascunho := CriarCandidato('VINCULO-1', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [1, 2])]);
  rascunho.OperacaoInternaDescricao := 'Rascunho Venda';
  rascunho.GrupoFiscalDescricao := 'Grupo Rascunho';
  rascunho.RegraFiscalDescricao := 'Regra Rascunho';

  try
    entradaSemRascunho := ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
      OP_INTERNA_ID, 'G1', EMPRESA_ID, EncodeDate(2026, 1, 1));
    Assert.IsTrue(entradaSemRascunho.CandidatoRascunho = nil,
      'a sobrecarga de quatro argumentos nao deve carregar rascunho');

    entrada := ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
      OP_INTERNA_ID, 'G1', EMPRESA_ID, EncodeDate(2026, 1, 1), rascunho);
    Assert.IsTrue(entrada.CandidatoRascunho = rascunho);

    analise := FService.Analisar(entrada);
    try
      Assert.IsTrue(MensagensContem(analise,
        'Tipo de emissão permite tanto emissão própria quanto de terceiros.'),
        'a observação universal do rascunho deve ser um bullet curto');
      Assert.IsFalse(MensagensContem(analise, 'Persistido Venda'),
        'o vinculo persistido de mesmo Id deve ser substituido');
      Assert.IsFalse(MensagensContem(analise, 'VINCULO-1'),
        'a mensagem nao deve expor o identificador do vinculo');
    finally
      analise.Free;
    end;
  finally
    rascunho.Free;
  end;
end;

procedure TTestResolverRegraFiscalIbsCbsService.DeveAnalisarComRotuloSemExporIdentificador;
var
  analise: ResolverRegraFiscalIbsCbsAnalise;
  candidato: OperacaoFiscalIbsCbsEtd;
begin
  AdicionarRegraSimples('R1', '000001');
  candidato := CriarCandidato('ID-TECNICO-NAO-EXIBIR', 'R1', 'G1',
    [CriarCondicao(ocaTipoEmissao, [1, 2])]);
  candidato.OperacaoInternaDescricao := 'Venda';
  candidato.GrupoFiscalDescricao := 'Grupo A';
  candidato.RegraFiscalDescricao := 'Regra A';
  FOperacoesRepo.AdicionarCandidato(candidato);

  analise := FService.Analisar(ResolverRegraFiscalIbsCbsInput.CreateParaAnalise(
    OP_INTERNA_ID, 'G1', EMPRESA_ID, EncodeDate(2026, 1, 1)));
  try
    Assert.IsTrue(MensagensContem(analise, 'Venda'),
      'a mensagem deve identificar a configuracao pelo rotulo');
    Assert.IsFalse(MensagensContem(analise, 'ID-TECNICO-NAO-EXIBIR'),
      'a mensagem nao deve expor o identificador tecnico');
    Assert.IsTrue(ApontamentosContemTipo(analise, ratObservacaoOpcoes),
      'a condicao universal deve gerar observacao tipada');
  finally
    analise.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestResolverRegraFiscalIbsCbsService);

end.
