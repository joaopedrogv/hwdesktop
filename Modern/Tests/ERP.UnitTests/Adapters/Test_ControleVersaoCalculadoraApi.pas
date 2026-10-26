unit Test_ControleVersaoCalculadoraApi;

interface

uses
  DUnitX.TestFramework,
  IHttpJsonClientUnit,
  FakeHttpJsonClientUnit,
  IControleVersaoCalculadoraApiUnit,
  ControleVersaoCalculadoraApiUnit,
  CompatibilidadeRtcModelUnit,
  PublicacaoRtcModelUnit;

type
  [TestFixture]
  TTestControleVersaoCalculadoraApi = class
  private
    FHttp: TFakeHttpJsonClient;
    FHttpIntf: IHttpJsonClient;
    FControle: IControleVersaoCalculadoraApi;
    FToken: string;

    function UrlCompatibilidade: string;
    function UrlDisponivel: string;
    function UrlPublicacao(const ACalcVersion: string): string;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveDeserializarCompatibilidadeDeArrayComUmObjeto;

    [Test]
    procedure DeveRetornarNilQuandoCompatibilidadeVazia;

    [Test]
    procedure DeveRetornarNilQuandoCompatibilidadeArrayVazio;

    [Test]
    procedure DeveDeserializarUltimaDisponivelSemRtcVersionNaUrl;

    [Test]
    procedure DeveRetornarNilQuandoDisponivelVazio;

    [Test]
    procedure DeveFalharQuandoRespostaDisponivelNaoTemSucesso;

    [Test]
    procedure DeveFalharQuandoConteudoNaoDeserializa;

    [Test]
    procedure DeveFalharQuandoRespostaHttpNaoTemSucesso;

    [Test]
    procedure DeveDeserializarPublicacaoComPublishedAtComoString;

    [Test]
    procedure DeveRetornarNilQuandoPublicacaoVazia;

    [Test]
    procedure DeveEncaminharTokenNaConsulta;
  end;

implementation

uses
  SysUtils;

const
  BASE_URL = 'https://data.exemplo.test';
  APP_NAME = 'HW-DESKTOP';
  RTC_VERSION = 12;

  JSON_COMPATIBILIDADE =
    '[{"id":1,"app_name":"HW-DESKTOP","calc_version":"v0029","rtc_version":12}]';

  JSON_PUBLICACAO =
    '[{"calc_version":"v0029",' +
    '"sha256":"feabd3cdd0267aade49a28874f6455e8efeee2e8f491a202be8bb21bba138413",' +
    '"release_tag":"v0029","published_at":"2026-09-09T01:28:47Z"}]';

procedure TTestControleVersaoCalculadoraApi.Setup;
begin
  // Placeholder gerado em runtime; nenhum token real ou literal de segredo no fixture.
  FToken := StringOfChar('t', 12);

  FHttp := TFakeHttpJsonClient.Create;
  FHttpIntf := FHttp;
  FControle := ControleVersaoCalculadoraApi.Create(FHttpIntf);
  FControle.Configurar(BASE_URL, FToken, True);
end;

procedure TTestControleVersaoCalculadoraApi.TearDown;
begin
  // O fake e um TInterfacedObject: liberado ao soltar a ultima referencia de interface.
  FControle := nil;
  FHttpIntf := nil;
  FHttp := nil;
end;

function TTestControleVersaoCalculadoraApi.UrlCompatibilidade: string;
begin
  Result := BASE_URL + '/rtc-versions/compatibility.json?app_name=' + APP_NAME +
    '&rtc_version=' + IntToStr(RTC_VERSION) +
    '&_sort_desc=calc_version&_size=1&_shape=array&status__in=release,dev';
end;

function TTestControleVersaoCalculadoraApi.UrlDisponivel: string;
begin
  // Ultima publicada: sem filtro de dominio (rtc_version).
  Result := BASE_URL + '/rtc-versions/compatibility.json?app_name=' + APP_NAME +
    '&_sort_desc=calc_version&_size=1&_shape=array&status__in=release,dev';
end;

function TTestControleVersaoCalculadoraApi.UrlPublicacao(const ACalcVersion: string): string;
begin
  Result := BASE_URL + '/rtc-versions/databases.json?calc_version=' + ACalcVersion +
    '&_size=1&_shape=array';
end;

procedure TTestControleVersaoCalculadoraApi.DeveDeserializarCompatibilidadeDeArrayComUmObjeto;
var
  Model: CompatibilidadeRtcModel;
begin
  FHttp.ConfigurarResposta(UrlCompatibilidade, JSON_COMPATIBILIDADE);

  Model := FControle.ObterUltimaCompativel(APP_NAME, RTC_VERSION);
  try
    Assert.IsNotNull(Model);
    Assert.AreEqual(1, Model.id);
    Assert.AreEqual('HW-DESKTOP', Model.app_name);
    Assert.AreEqual('v0029', Model.calc_version);
    Assert.AreEqual(RTC_VERSION, Model.rtc_version);
    Assert.IsTrue(FHttp.FoiChamado(UrlCompatibilidade));
  finally
    Model.Free;
  end;
end;

procedure TTestControleVersaoCalculadoraApi.DeveRetornarNilQuandoCompatibilidadeVazia;
var
  Model: CompatibilidadeRtcModel;
begin
  FHttp.ConfigurarResposta(UrlCompatibilidade, '');

  Model := FControle.ObterUltimaCompativel(APP_NAME, RTC_VERSION);
  try
    Assert.IsNull(Model);
  finally
    Model.Free;
  end;
end;

procedure TTestControleVersaoCalculadoraApi.DeveRetornarNilQuandoCompatibilidadeArrayVazio;
var
  Model: CompatibilidadeRtcModel;
begin
  FHttp.ConfigurarResposta(UrlCompatibilidade, '[]');

  Model := FControle.ObterUltimaCompativel(APP_NAME, RTC_VERSION);
  try
    Assert.IsNull(Model);
  finally
    Model.Free;
  end;
end;

procedure TTestControleVersaoCalculadoraApi.DeveDeserializarUltimaDisponivelSemRtcVersionNaUrl;
var
  Model: CompatibilidadeRtcModel;
begin
  FHttp.ConfigurarResposta(UrlDisponivel, JSON_COMPATIBILIDADE);

  Model := FControle.ObterUltimaDisponivel(APP_NAME);
  try
    Assert.IsNotNull(Model);
    Assert.AreEqual(1, Model.id);
    Assert.AreEqual('HW-DESKTOP', Model.app_name);
    Assert.AreEqual('v0029', Model.calc_version);
    Assert.AreEqual(RTC_VERSION, Model.rtc_version);
    // A URL consultada nao contem rtc_version (ultima publicada sem filtro de dominio).
    Assert.IsTrue(FHttp.FoiChamado(UrlDisponivel));
    Assert.IsFalse(FHttp.FoiChamado(UrlCompatibilidade));
  finally
    Model.Free;
  end;
end;

procedure TTestControleVersaoCalculadoraApi.DeveRetornarNilQuandoDisponivelVazio;
var
  Model: CompatibilidadeRtcModel;
begin
  FHttp.ConfigurarResposta(UrlDisponivel, '[]');

  Model := FControle.ObterUltimaDisponivel(APP_NAME);
  try
    Assert.IsNull(Model);
  finally
    Model.Free;
  end;
end;

procedure TTestControleVersaoCalculadoraApi.DeveFalharQuandoRespostaDisponivelNaoTemSucesso;
var
  Falhou: Boolean;
begin
  FHttp.ConfigurarFalha(UrlDisponivel, 'falha simulada de transporte', 500);

  Falhou := False;
  try
    FControle.ObterUltimaDisponivel(APP_NAME);
  except
    on E: Exception do
    begin
      Falhou := True;
      Assert.IsTrue(E.Message.Contains('500'));
      Assert.IsFalse(E.Message.Contains(FToken));
    end;
  end;

  Assert.IsTrue(Falhou, 'Deveria ter lancado excecao quando a resposta HTTP nao tem sucesso.');
end;

procedure TTestControleVersaoCalculadoraApi.DeveFalharQuandoConteudoNaoDeserializa;
var
  Falhou: Boolean;
begin
  FHttp.ConfigurarResposta(UrlCompatibilidade, '[{"id":1,"rtc_version":}]');

  Falhou := False;
  try
    FControle.ObterUltimaCompativel(APP_NAME, RTC_VERSION);
  except
    on E: Exception do
    begin
      Falhou := True;
      Assert.IsFalse(E.Message.Contains(FToken));
    end;
  end;

  Assert.IsTrue(Falhou, 'Deveria ter lancado excecao na falha de deserializacao.');
end;

procedure TTestControleVersaoCalculadoraApi.DeveFalharQuandoRespostaHttpNaoTemSucesso;
var
  Falhou: Boolean;
begin
  FHttp.ConfigurarFalha(UrlCompatibilidade, 'falha simulada de transporte', 500);

  Falhou := False;
  try
    FControle.ObterUltimaCompativel(APP_NAME, RTC_VERSION);
  except
    on E: Exception do
    begin
      Falhou := True;
      Assert.IsTrue(E.Message.Contains('500'));
      Assert.IsFalse(E.Message.Contains(FToken));
    end;
  end;

  Assert.IsTrue(Falhou, 'Deveria ter lancado excecao quando a resposta HTTP nao tem sucesso.');
end;

procedure TTestControleVersaoCalculadoraApi.DeveDeserializarPublicacaoComPublishedAtComoString;
var
  Model: PublicacaoRtcModel;
begin
  FHttp.ConfigurarResposta(UrlPublicacao('v0029'), JSON_PUBLICACAO);

  Model := FControle.ObterPublicacao('v0029');
  try
    Assert.IsNotNull(Model);
    Assert.AreEqual('v0029', Model.calc_version);
    Assert.AreEqual('feabd3cdd0267aade49a28874f6455e8efeee2e8f491a202be8bb21bba138413', Model.sha256);
    Assert.AreEqual('v0029', Model.release_tag);
    Assert.AreEqual('2026-09-09T01:28:47Z', Model.published_at);
    Assert.IsTrue(FHttp.FoiChamado(UrlPublicacao('v0029')));
  finally
    Model.Free;
  end;
end;

procedure TTestControleVersaoCalculadoraApi.DeveRetornarNilQuandoPublicacaoVazia;
var
  Model: PublicacaoRtcModel;
begin
  FHttp.ConfigurarResposta(UrlPublicacao('v0029'), '[]');

  Model := FControle.ObterPublicacao('v0029');
  try
    Assert.IsNull(Model);
  finally
    Model.Free;
  end;
end;

procedure TTestControleVersaoCalculadoraApi.DeveEncaminharTokenNaConsulta;
begin
  FHttp.ConfigurarResposta(UrlCompatibilidade, JSON_COMPATIBILIDADE);

  FControle.ObterUltimaCompativel(APP_NAME, RTC_VERSION).Free;

  Assert.IsTrue(FHttp.TokenFoiEnviado);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestControleVersaoCalculadoraApi);

end.
