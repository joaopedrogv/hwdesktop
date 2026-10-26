// Delphi Rio
unit ControleVersaoCalculadoraApiUnit;

interface

uses
  SysUtils,
  IHttpJsonClientUnit,
  IControleVersaoCalculadoraApiUnit,
  CompatibilidadeRtcModelUnit,
  PublicacaoRtcModelUnit;

type
  ControleVersaoCalculadoraApi = class(TInterfacedObject, IControleVersaoCalculadoraApi)
  private
    FHttp: IHttpJsonClient;
    FBaseUrl: string;
    FToken: string;
    FIsStaging: Boolean;

    function RemoverBarraFinal(const AUrl: string): string;
    function MontarUrlCompatibilidade(const AAppName: string; ARtcVersion: Integer): string;
    function MontarUrlDisponivel(const AAppName: string): string;
    function MontarUrlPublicacao(const ACalcVersion: string): string;
    /// <summary>
    ///   `_shape=array` com um registro vem como `[{objeto}]`; remove `[`/`]` e devolve o objeto.
    ///   Conteudo vazio/`[]` devolve string vazia; falha de deserializacao propaga excecao.
    /// </summary>
    function ExtrairObjetoUnico(const AConteudo: string): string;
    function Consultar(const AUrl: string): string;
  public
    constructor Create(AHttp: IHttpJsonClient);

    /// <summary>
    ///   Configura instancia para chamadas a API.
    /// <param name="AIsStaging">
    ///   Ajusta URL's para retornar registros na fase de desenvolvimento
    /// </param>
    /// </summary>
    procedure Configurar(const ABaseUrl, AToken: string; AIsStaging: Boolean);
    function ObterUltimaCompativel(const AAppName: string; ARtcVersion: Integer): CompatibilidadeRtcModel;
    function ObterUltimaDisponivel(const AAppName: string): CompatibilidadeRtcModel;
    function ObterPublicacao(const ACalcVersion: string): PublicacaoRtcModel;
  end;

implementation

uses
  REST.Json;

const
  RTC_VERSIONS_PATH = '/rtc-versions';
  RTC_STAGE_VALUES: array[Boolean] of string = ('release', 'release,dev');

{ ControleVersaoCalculadoraApi }

constructor ControleVersaoCalculadoraApi.Create(AHttp: IHttpJsonClient);
begin
  inherited Create;
  FHttp := AHttp;
end;

procedure ControleVersaoCalculadoraApi.Configurar(const ABaseUrl, AToken: string; AIsStaging: Boolean);
begin
  FBaseUrl := RemoverBarraFinal(ABaseUrl.Trim);
  FToken := AToken;
  FIsStaging := AIsStaging;
end;

function ControleVersaoCalculadoraApi.RemoverBarraFinal(const AUrl: string): string;
begin
  Result := AUrl;

  // A URL base operacional pode vir com "/" final; evita "//" ao compor o endpoint.
  while (Result <> '') and Result.EndsWith('/') do
    Result := Result.Substring(0, Result.Length - 1);
end;

function ControleVersaoCalculadoraApi.MontarUrlCompatibilidade(
  const AAppName: string;
  ARtcVersion: Integer
): string;
begin
  Result := Format(
    '%s%s/compatibility.json?app_name=%s&rtc_version=%d&_sort_desc=calc_version&_size=1&_shape=array&status__in=%s',
    [FBaseUrl, RTC_VERSIONS_PATH, AAppName, ARtcVersion, RTC_STAGE_VALUES[FIsStaging]]
  );
end;

function ControleVersaoCalculadoraApi.MontarUrlDisponivel(const AAppName: string): string;
begin
  Result := Format(
    '%s%s/compatibility.json?app_name=%s&_sort_desc=calc_version&_size=1&_shape=array&status__in=%s',
    [FBaseUrl, RTC_VERSIONS_PATH, AAppName, RTC_STAGE_VALUES[FIsStaging]]
  );
end;

function ControleVersaoCalculadoraApi.MontarUrlPublicacao(const ACalcVersion: string): string;
begin
  Result := Format(
    '%s%s/databases.json?calc_version=%s&_size=1&_shape=array',
    [FBaseUrl, RTC_VERSIONS_PATH, ACalcVersion]
  );
end;

function ControleVersaoCalculadoraApi.ExtrairObjetoUnico(const AConteudo: string): string;
begin
  Result := AConteudo.Trim;

  if (Result = '') or (Result = '[]') then
  begin
    Result := '';
    Exit;
  end;

  if (Length(Result) >= 2) and (Result[1] = '[') and (Result[Length(Result)] = ']') then
    Result := Result.Substring(1, Length(Result) - 2).Trim;

  if Result = '[]' then
    Result := '';
end;

function ControleVersaoCalculadoraApi.Consultar(const AUrl: string): string;
var
  Resposta: THttpJsonResult;
begin
  Resposta := FHttp.Get(AUrl, FToken);

  if not Resposta.Success then
    // Mensagem inclui apenas status/erro; nunca o header Authorization.
    raise Exception.Create(Format(
      'Falha ao consultar a API de versoes da calculadora (status=%d): %s',
      [Resposta.StatusCode, Resposta.ErrorMessage]
    ));

  Result := ExtrairObjetoUnico(Resposta.Content);
end;

function ControleVersaoCalculadoraApi.ObterUltimaCompativel(
  const AAppName: string;
  ARtcVersion: Integer
): CompatibilidadeRtcModel;
var
  Conteudo: string;
begin
  Result := nil;

  Conteudo := Consultar(MontarUrlCompatibilidade(AAppName, ARtcVersion));

  if Conteudo = '' then
    Exit;

  Result := TJson.JsonToObject<CompatibilidadeRtcModel>(Conteudo);
end;

function ControleVersaoCalculadoraApi.ObterUltimaDisponivel(
  const AAppName: string
): CompatibilidadeRtcModel;
var
  Conteudo: string;
begin
  Result := nil;

  // Sem rtc_version: ultima publicada independente de dominio (ver MontarUrlDisponivel).
  Conteudo := Consultar(MontarUrlDisponivel(AAppName));

  if Conteudo = '' then
    Exit;

  Result := TJson.JsonToObject<CompatibilidadeRtcModel>(Conteudo);
end;

function ControleVersaoCalculadoraApi.ObterPublicacao(const ACalcVersion: string): PublicacaoRtcModel;
var
  Conteudo: string;
begin
  Result := nil;

  Conteudo := Consultar(MontarUrlPublicacao(ACalcVersion));

  if Conteudo = '' then
    Exit;

  Result := TJson.JsonToObject<PublicacaoRtcModel>(Conteudo);
end;

end.
