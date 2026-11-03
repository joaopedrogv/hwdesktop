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
    Assert.IsTrue(MensagensContem(analise, 'conjunto universal'),
      'condicao universal deve ser sinalizada');
    Assert.IsTrue(MensagensContem(analise, 'mesma resposta efetiva'),
      'redundancia deve ser sinalizada');
    Assert.IsTrue(MensagensContem(analise, 'respostas distintas'),
      'cruzamento potencial deve ser sinalizado');
    Assert.IsTrue(MensagensContem(analise, 'configuracao invalida'),
      'configuracao invalida deve ser reportada');
    Assert.IsTrue(MensagensContem(analise, 'nao encontrada'),
      'referencia de regra ausente deve ser reportada');
  finally
    analise.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestResolverRegraFiscalIbsCbsService);

end.
