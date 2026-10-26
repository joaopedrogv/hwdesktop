unit Test_CalculadoraApiReader;

interface

uses
  System.SysUtils,
  DUnitX.TestFramework,
  IHttpJsonClientUnit,
  FakeHttpJsonClientUnit,
  IDadosFiscaisReaderUnit,
  CalculadoraApiReaderUnit,
  VersaoSerproEtdUnit,
  EstadoEtdUnit,
  MunicipioEtdUnit,
  NbsAplicavelEtdUnit,
  ListaServicosLC116EtdUnit,
  IndicadorOperacaoEtdUnit,
  IndicadorOpNbsClassificacaoEtdUnit,
  LocalIncidenciaEnumUnit;

type
  [TestFixture]
  TTestCalculadoraApiReader = class
  private
    FHttp: TFakeHttpJsonClient;
    FHttpIntf: IHttpJsonClient;
    FReader: IDadosFiscaisReader;
    FToken: string;

    function Url(const ATabela: string): string;
    function UrlVersao: string;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveMontarUrlComShapeETamanhoDePagina;

    [Test]
    procedure DeveLerMultiplasPaginasSeguindoNextUrl;

    [Test]
    procedure DeveEncerrarQuandoNextUrlNulo;

    [Test]
    procedure DeveConverterNextUrlHttpParaHttps;

    [Test]
    procedure DeveFalharQuandoTruncatedVerdadeiro;

    [Test]
    procedure DeveFalharQuandoOkFalso;

    [Test]
    procedure DeveFalharNoMeioSemListaParcial;

    [Test]
    procedure DeveLerUltimaVersaoComSortDesc;

    [Test]
    procedure DeveRetornarVersaoNulaQuandoTabelaVazia;

    [Test]
    procedure DeveLerNbsAplicavelComAnxoIdDireto;

    [Test]
    procedure DeveEncaminharToken;

    [Test]
    procedure DeveLerListaServicosLC116ComDatasENulos;

    [Test]
    procedure DeveLerIndicadoresOperacaoIbsCbsEmDuasPaginas;

    [Test]
    procedure DeveFalharQuandoCodigoLocalIncidenciaInvalido;

    [Test]
    procedure DeveLerClassificacoesNbsIndOpLcComFlagsEDatas;

    [Test]
    procedure DeveFalharQuandoTruncatedNaListaServicosLC116;
  end;

implementation

const
  BASE_URL = 'https://data.exemplo.test';
  DATABASE = 'rtc-v0039';

  NEXT_UF_HTTPS = BASE_URL + '/' + DATABASE + '/UF.json?_shape=objects&_next=1';
  NEXT_UF_HTTP = 'http://data.exemplo.test/' + DATABASE + '/UF.json?_shape=objects&_next=1';
  NEXT_MUNI_HTTPS = BASE_URL + '/' + DATABASE + '/MUNICIPIO.json?_shape=objects&_next=1';

  ENVELOPE_UF_PAGINA_1 =
    '{"ok":true,"next":"1","next_url":"' + NEXT_UF_HTTPS + '",' +
    '"rows":[{"UF_CD":35,"UF_NOME":"Sao Paulo","UF_SIGLA":"SP"}],"truncated":false}';

  ENVELOPE_UF_PAGINA_1_HTTP =
    '{"ok":true,"next":"1","next_url":"' + NEXT_UF_HTTP + '",' +
    '"rows":[{"UF_CD":35,"UF_NOME":"Sao Paulo","UF_SIGLA":"SP"}],"truncated":false}';

  ENVELOPE_UF_PAGINA_2 =
    '{"ok":true,"next":null,"next_url":null,' +
    '"rows":[{"UF_CD":33,"UF_NOME":"Rio de Janeiro","UF_SIGLA":"RJ"}],"truncated":false}';

  ENVELOPE_UF_UNICA =
    '{"ok":true,"next":null,"next_url":null,' +
    '"rows":[{"UF_CD":35,"UF_NOME":"Sao Paulo","UF_SIGLA":"SP"}],"truncated":false}';

  ENVELOPE_UF_VAZIO =
    '{"ok":true,"next":null,"next_url":null,"rows":[],"truncated":false}';

  ENVELOPE_UF_TRUNCADO =
    '{"ok":true,"next":"1","next_url":"' + NEXT_UF_HTTPS + '",' +
    '"rows":[{"UF_CD":35,"UF_NOME":"Sao Paulo","UF_SIGLA":"SP"}],"truncated":true}';

  ENVELOPE_UF_OK_FALSO =
    '{"ok":false,"next":null,"next_url":null,"rows":[],"truncated":false}';

  ENVELOPE_MUNI_PAGINA_1 =
    '{"ok":true,"next":"1","next_url":"' + NEXT_MUNI_HTTPS + '",' +
    '"rows":[{"MUNI_CD":3550308,"MUNI_UF_CD":35,"MUNI_NOME":"Sao Paulo"}],"truncated":false}';

  ENVELOPE_VERSAO =
    '{"ok":true,"next":null,"next_url":null,' +
    '"rows":[{"VRBD_ID":39,"VRBD_DATA":"2026-01-01","VRBD_DESCRICAO":"versao alvo",' +
    '"VRBD_VERSAO_BASE_DADO":null}],"truncated":false}';

  ENVELOPE_VERSAO_VAZIO =
    '{"ok":true,"next":null,"next_url":null,"rows":[],"truncated":false}';

  ENVELOPE_NBS_APLICAVEL =
    '{"ok":true,"next":null,"next_url":null,' +
    '"rows":[{"NBSA_ID":1,"NBSA_NBS_CD":"1.01","NBSA_CLTR_ID":2,"NBSA_ANXO_ID":null,' +
    '"NBSA_INICIO_VIGENCIA":"2026-01-01","NBSA_FIM_VIGENCIA":null}],"truncated":false}';

  NEXT_LC116_HTTPS =
    BASE_URL + '/' + DATABASE + '/LISTA_SERVICOS_LC_116.json?_shape=objects&_next=1';

  NEXT_INDICADOR_HTTPS =
    BASE_URL + '/' + DATABASE + '/INDICADOR_OPERACAO_IBS_CBS.json?_shape=objects&_next=1';

  ENVELOPE_LC116_UNICO =
    '{"ok":true,"next":null,"next_url":null,' +
    '"rows":[' +
    '{"LSLC_CD":"1.01","LSLC_DESCRICAO":"Servico A",' +
    '"LSLC_INICIO_VIGENCIA":"2026-01-01","LSLC_FIM_VIGENCIA":null},' +
    '{"LSLC_CD":"1.02","LSLC_DESCRICAO":"Servico B",' +
    '"LSLC_INICIO_VIGENCIA":"2026-02-01","LSLC_FIM_VIGENCIA":"2026-12-31"}' +
    '],"truncated":false}';

  ENVELOPE_LC116_TRUNCADO =
    '{"ok":true,"next":"1","next_url":"' + NEXT_LC116_HTTPS + '",' +
    '"rows":[{"LSLC_CD":"1.01","LSLC_DESCRICAO":"Servico A",' +
    '"LSLC_INICIO_VIGENCIA":"2026-01-01","LSLC_FIM_VIGENCIA":null}],"truncated":true}';

  ENVELOPE_INDICADOR_PAGINA_1 =
    '{"ok":true,"next":"1","next_url":"' + NEXT_INDICADOR_HTTPS + '",' +
    '"rows":[{"IOIC_ID":10,"IOIC_CD":"000001","IOIC_LOCAL_INCIDENCIA":"Local da Prestacao",' +
    '"IOIC_INICIO_VIGENCIA":"2026-01-01","IOIC_FIM_VIGENCIA":null,' +
    '"IOIC_TIPO_OPERACAO":null,"IOIC_CD_LOCAL_FORNECIMENTO_DFE":28,' +
    '"IOIC_CD_LOCAL_INCIDENCIA":4}],"truncated":false}';

  ENVELOPE_INDICADOR_PAGINA_2 =
    '{"ok":true,"next":null,"next_url":null,' +
    '"rows":[{"IOIC_ID":11,"IOIC_CD":"000002","IOIC_LOCAL_INCIDENCIA":"",' +
    '"IOIC_INICIO_VIGENCIA":"2026-03-01","IOIC_FIM_VIGENCIA":"2026-12-31",' +
    '"IOIC_TIPO_OPERACAO":"Tipo X","IOIC_CD_LOCAL_FORNECIMENTO_DFE":null,' +
    '"IOIC_CD_LOCAL_INCIDENCIA":null}],"truncated":false}';

  ENVELOPE_INDICADOR_ENUM_INVALIDO =
    '{"ok":true,"next":null,"next_url":null,' +
    '"rows":[{"IOIC_ID":12,"IOIC_CD":"000003","IOIC_LOCAL_INCIDENCIA":"",' +
    '"IOIC_INICIO_VIGENCIA":"2026-01-01","IOIC_FIM_VIGENCIA":null,' +
    '"IOIC_TIPO_OPERACAO":null,"IOIC_CD_LOCAL_FORNECIMENTO_DFE":null,' +
    '"IOIC_CD_LOCAL_INCIDENCIA":99}],"truncated":false}';

  ENVELOPE_CLASSIF =
    '{"ok":true,"next":null,"next_url":null,' +
    '"rows":[' +
    '{"CNIL_ID":100,"CNIL_LSLC_CD":"1.01","CNIL_NBS_CD":"1.0101",' +
    '"CNIL_IOIC_ID":10,"CNIL_CLTR_ID":2,"CNIL_INICIO_VIGENCIA":"2026-01-01",' +
    '"CNIL_FIM_VIGENCIA":null,"CNIL_IN_PS_ONEROSA":1,"CNIL_IN_ADQ_EXTERIOR":0},' +
    '{"CNIL_ID":101,"CNIL_LSLC_CD":"1.02","CNIL_NBS_CD":"1.0102",' +
    '"CNIL_IOIC_ID":11,"CNIL_CLTR_ID":3,"CNIL_INICIO_VIGENCIA":"2026-02-01",' +
    '"CNIL_FIM_VIGENCIA":"2026-12-31","CNIL_IN_PS_ONEROSA":0,"CNIL_IN_ADQ_EXTERIOR":1}' +
    '],"truncated":false}';

{ TTestCalculadoraApiReader }

procedure TTestCalculadoraApiReader.Setup;
begin
  // Placeholder gerado em runtime; nenhum token real no fixture.
  FToken := StringOfChar('t', 12);

  FHttp := TFakeHttpJsonClient.Create;
  FHttpIntf := FHttp;

  FReader := CalculadoraApiReader.Create(FHttpIntf);
  FReader.Configurar(BASE_URL, FToken, DATABASE);
end;

procedure TTestCalculadoraApiReader.TearDown;
begin
  // O reader e o fake sao TInterfacedObject; liberados ao soltar a ultima referencia.
  FReader := nil;
  FHttpIntf := nil;
  FHttp := nil;
end;

function TTestCalculadoraApiReader.Url(const ATabela: string): string;
begin
  Result := BASE_URL + '/' + DATABASE + '/' + ATabela + '.json?_shape=objects&_size=1000';
end;

function TTestCalculadoraApiReader.UrlVersao: string;
begin
  Result := Url('VERSAO_BASE_DADO') + '&_sort_desc=VRBD_ID&_size=1';
end;

procedure TTestCalculadoraApiReader.DeveMontarUrlComShapeETamanhoDePagina;
var
  Estados: EstadosEtd;
begin
  FHttp.ConfigurarResposta(Url('UF'), ENVELOPE_UF_UNICA);

  Estados := FReader.ObterEstados();

  Assert.AreEqual(1, Length(Estados));
  Assert.AreEqual('SP', Estados[0].Sigla);
  Assert.IsTrue(FHttp.FoiChamado(Url('UF')));
end;

procedure TTestCalculadoraApiReader.DeveLerMultiplasPaginasSeguindoNextUrl;
var
  Estados: EstadosEtd;
begin
  FHttp.ConfigurarResposta(Url('UF'), ENVELOPE_UF_PAGINA_1);
  FHttp.ConfigurarResposta(NEXT_UF_HTTPS, ENVELOPE_UF_PAGINA_2);

  Estados := FReader.ObterEstados();

  Assert.AreEqual(2, Length(Estados));
  Assert.AreEqual('SP', Estados[0].Sigla);
  Assert.AreEqual('RJ', Estados[1].Sigla);
  Assert.IsTrue(FHttp.FoiChamado(Url('UF')));
  Assert.IsTrue(FHttp.FoiChamado(NEXT_UF_HTTPS));
end;

procedure TTestCalculadoraApiReader.DeveEncerrarQuandoNextUrlNulo;
var
  Estados: EstadosEtd;
begin
  FHttp.ConfigurarResposta(Url('UF'), ENVELOPE_UF_UNICA);

  Estados := FReader.ObterEstados();

  Assert.AreEqual(1, Length(Estados));
  Assert.AreEqual(1, FHttp.TotalDeChamadas);
end;

procedure TTestCalculadoraApiReader.DeveConverterNextUrlHttpParaHttps;
var
  Estados: EstadosEtd;
begin
  FHttp.ConfigurarResposta(Url('UF'), ENVELOPE_UF_PAGINA_1_HTTP);
  FHttp.ConfigurarResposta(NEXT_UF_HTTPS, ENVELOPE_UF_PAGINA_2);

  Estados := FReader.ObterEstados();

  Assert.AreEqual(2, Length(Estados));
  Assert.IsTrue(FHttp.FoiChamado(NEXT_UF_HTTPS));
  Assert.IsFalse(FHttp.FoiChamado(NEXT_UF_HTTP));
end;

procedure TTestCalculadoraApiReader.DeveFalharQuandoTruncatedVerdadeiro;
var
  Falhou: Boolean;
begin
  FHttp.ConfigurarResposta(Url('UF'), ENVELOPE_UF_TRUNCADO);

  Falhou := False;
  try
    FReader.ObterEstados();
  except
    on E: Exception do
    begin
      Falhou := True;
      Assert.IsTrue(E.Message.Contains('truncated'));
      Assert.IsFalse(E.Message.Contains(FToken));
    end;
  end;

  Assert.IsTrue(Falhou, 'Deveria abortar quando truncated=true.');
  Assert.AreEqual(1, FHttp.TotalDeChamadas);
end;

procedure TTestCalculadoraApiReader.DeveFalharQuandoOkFalso;
var
  Falhou: Boolean;
begin
  FHttp.ConfigurarResposta(Url('UF'), ENVELOPE_UF_OK_FALSO);

  Falhou := False;
  try
    FReader.ObterEstados();
  except
    on E: Exception do
      Falhou := True;
  end;

  Assert.IsTrue(Falhou, 'Deveria abortar quando ok=false.');
end;

procedure TTestCalculadoraApiReader.DeveFalharNoMeioSemListaParcial;
var
  Municipios: MunicipiosEtd;
  Falhou: Boolean;
begin
  FHttp.ConfigurarResposta(Url('MUNICIPIO'), ENVELOPE_MUNI_PAGINA_1);
  FHttp.ConfigurarFalha(NEXT_MUNI_HTTPS, 'falha simulada na segunda pagina', 500);

  Falhou := False;
  try
    Municipios := FReader.ObterMunicipios();
    Municipios.Free;
  except
    on E: Exception do
    begin
      Falhou := True;
      Assert.IsTrue(E.Message.Contains('500'));
    end;
  end;

  Assert.IsTrue(Falhou, 'Deveria propagar a falha da pagina intermediaria.');
  Assert.IsTrue(FHttp.FoiChamado(Url('MUNICIPIO')));
  Assert.IsTrue(FHttp.FoiChamado(NEXT_MUNI_HTTPS));
end;

procedure TTestCalculadoraApiReader.DeveLerUltimaVersaoComSortDesc;
var
  Versao: VersaoSerproEtd;
begin
  FHttp.ConfigurarResposta(UrlVersao, ENVELOPE_VERSAO);

  Versao := FReader.ObterUltimaVersao();

  Assert.IsFalse(Versao.IsNull);
  Assert.AreEqual(39, Versao.Id);
  Assert.AreEqual('versao alvo', Versao.Descricao);
  Assert.IsTrue(Versao.Data = EncodeDate(2026, 1, 1));
  Assert.IsTrue(Versao.Versao.IsNull);
  Assert.IsTrue(FHttp.FoiChamado(UrlVersao));
end;

procedure TTestCalculadoraApiReader.DeveRetornarVersaoNulaQuandoTabelaVazia;
var
  Versao: VersaoSerproEtd;
begin
  FHttp.ConfigurarResposta(UrlVersao, ENVELOPE_VERSAO_VAZIO);

  Versao := FReader.ObterUltimaVersao();

  Assert.IsTrue(Versao.IsNull);
end;

procedure TTestCalculadoraApiReader.DeveLerNbsAplicavelComAnxoIdDireto;
var
  Lista: NbssAplicaveisEtd;
begin
  FHttp.ConfigurarResposta(Url('NBS_APLICAVEL'), ENVELOPE_NBS_APLICAVEL);

  Lista := FReader.ObterNBSsAplicaveis();
  try
    Assert.AreEqual(1, Lista.Count);
    Assert.AreEqual('1.01', NbsAplicavelEtd(Lista[0]).Nbs);
    Assert.IsTrue(NbsAplicavelEtd(Lista[0]).AnexoId.IsNull);
  finally
    Lista.Free;
  end;

  // Sem LEFT JOIN: a leitura usa a propria tabela NBS_APLICAVEL.
  Assert.IsTrue(FHttp.FoiChamado(Url('NBS_APLICAVEL')));
end;

procedure TTestCalculadoraApiReader.DeveEncaminharToken;
begin
  FHttp.ConfigurarResposta(Url('UF'), ENVELOPE_UF_UNICA);

  FReader.ObterEstados();

  Assert.IsTrue(FHttp.TokenFoiEnviado);
end;

procedure TTestCalculadoraApiReader.DeveLerListaServicosLC116ComDatasENulos;
var
  Lista: ListaServicosLC116EtdList;
begin
  FHttp.ConfigurarResposta(Url('LISTA_SERVICOS_LC_116'), ENVELOPE_LC116_UNICO);

  Lista := FReader.ObterListaServicosLC116();
  try
    Assert.AreEqual(2, Lista.Count);
    Assert.AreEqual('1.01', Lista[0].Codigo);
    Assert.AreEqual('Servico A', Lista[0].Descricao);
    Assert.IsTrue(Lista[0].InicioVigencia = EncodeDate(2026, 1, 1));
    Assert.IsTrue(Lista[0].FimVigencia.IsNull, 'Vigencia final nula deve ser preservada.');
    Assert.AreEqual('1.02', Lista[1].Codigo);
    Assert.IsTrue(Lista[1].FimVigencia.HasValue);
    Assert.IsTrue(Lista[1].FimVigencia.Value = EncodeDate(2026, 12, 31));
  finally
    Lista.Free;
  end;

  Assert.IsTrue(FHttp.FoiChamado(Url('LISTA_SERVICOS_LC_116')));
end;

procedure TTestCalculadoraApiReader.DeveLerIndicadoresOperacaoIbsCbsEmDuasPaginas;
var
  Lista: IndicadoresOperacaoEtd;
begin
  FHttp.ConfigurarResposta(Url('INDICADOR_OPERACAO_IBS_CBS'), ENVELOPE_INDICADOR_PAGINA_1);
  FHttp.ConfigurarResposta(NEXT_INDICADOR_HTTPS, ENVELOPE_INDICADOR_PAGINA_2);

  Lista := FReader.ObterIndicadoresOperacaoIbsCbs();

  Assert.AreEqual(2, Length(Lista));
  Assert.AreEqual(10, Lista[0].Id);
  Assert.AreEqual('000001', Lista[0].Codigo);
  Assert.IsTrue(Lista[0].InicioVigencia = EncodeDate(2026, 1, 1));
  Assert.IsTrue(Lista[0].FimVigencia.IsNull, 'Vigencia final nula deve ser preservada.');
  Assert.IsTrue(Lista[0].TipoOperacao.IsNull, 'Tipo de operacao nulo deve ser preservado.');
  Assert.IsTrue(Lista[0].CodigoLocalFornecimentoDfe.HasValue);
  Assert.AreEqual(28, Lista[0].CodigoLocalFornecimentoDfe.Value);
  Assert.IsTrue(
    Lista[0].CodigoLocalIncidencia = LocalIncidenciaEnumUnit.liLocalPrestacao,
    'Codigo 4 deve mapear para liLocalPrestacao.'
  );

  Assert.AreEqual(11, Lista[1].Id);
  Assert.IsTrue(Lista[1].FimVigencia.Value = EncodeDate(2026, 12, 31));
  Assert.AreEqual('Tipo X', Lista[1].TipoOperacao.ToText(''));
  Assert.IsTrue(Lista[1].CodigoLocalFornecimentoDfe.IsNull, 'Codigo DFe nulo deve ser preservado.');
  Assert.IsTrue(
    Lista[1].CodigoLocalIncidencia = LocalIncidenciaEnumUnit.liUnassigned,
    'Ausencia do codigo tipado deve mapear para liUnassigned.'
  );

  Assert.IsTrue(FHttp.FoiChamado(Url('INDICADOR_OPERACAO_IBS_CBS')));
  Assert.IsTrue(FHttp.FoiChamado(NEXT_INDICADOR_HTTPS));
end;

procedure TTestCalculadoraApiReader.DeveFalharQuandoCodigoLocalIncidenciaInvalido;
var
  Falhou: Boolean;
begin
  FHttp.ConfigurarResposta(Url('INDICADOR_OPERACAO_IBS_CBS'), ENVELOPE_INDICADOR_ENUM_INVALIDO);

  Falhou := False;
  try
    FReader.ObterIndicadoresOperacaoIbsCbs();
  except
    on E: Exception do
      Falhou := True;
  end;

  Assert.IsTrue(Falhou, 'Codigo de local de incidencia fora de 1..7 deve abortar a leitura.');
end;

procedure TTestCalculadoraApiReader.DeveLerClassificacoesNbsIndOpLcComFlagsEDatas;
var
  Lista: IndicadoresOpNbsClassificacaoEtd;
begin
  FHttp.ConfigurarResposta(Url('CLASSIF_NBS_INDOP_LC'), ENVELOPE_CLASSIF);

  Lista := FReader.ObterClassificacoesNbsIndOpLc();

  Assert.AreEqual(2, Length(Lista));
  Assert.AreEqual(100, Lista[0].Id);
  Assert.AreEqual('1.01', Lista[0].ListaServicosCd);
  Assert.AreEqual('1.0101', Lista[0].NbsCd);
  Assert.AreEqual(10, Lista[0].IndiceOperacaoId);
  Assert.AreEqual(2, Lista[0].ClassificacaoTributariaId);
  Assert.IsTrue(Lista[0].InicioVigencia = EncodeDate(2026, 1, 1));
  Assert.IsTrue(Lista[0].FimVigencia.IsNull, 'Vigencia final nula deve ser preservada.');
  Assert.IsTrue(Lista[0].InPrestacaoOnerosa, 'Flag 1 deve mapear para True.');
  Assert.IsFalse(Lista[0].InAquisicaoExterior, 'Flag 0 deve mapear para False.');

  Assert.AreEqual(101, Lista[1].Id);
  Assert.IsTrue(Lista[1].FimVigencia.Value = EncodeDate(2026, 12, 31));
  Assert.IsFalse(Lista[1].InPrestacaoOnerosa, 'Flag 0 deve mapear para False.');
  Assert.IsTrue(Lista[1].InAquisicaoExterior, 'Flag 1 deve mapear para True.');

  Assert.IsTrue(FHttp.FoiChamado(Url('CLASSIF_NBS_INDOP_LC')));
end;

procedure TTestCalculadoraApiReader.DeveFalharQuandoTruncatedNaListaServicosLC116;
var
  Falhou: Boolean;
begin
  FHttp.ConfigurarResposta(Url('LISTA_SERVICOS_LC_116'), ENVELOPE_LC116_TRUNCADO);

  Falhou := False;
  try
    FReader.ObterListaServicosLC116();
  except
    on E: Exception do
    begin
      Falhou := True;
      Assert.IsTrue(E.Message.Contains('truncated'));
      Assert.IsFalse(E.Message.Contains(FToken));
    end;
  end;

  Assert.IsTrue(Falhou, 'Deveria abortar quando truncated=true.');
  Assert.AreEqual(1, FHttp.TotalDeChamadas);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestCalculadoraApiReader);

end.
