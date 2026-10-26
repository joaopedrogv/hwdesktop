unit FakeControleVersaoCalculadoraApiUnit;

interface

uses
  System.Generics.Collections,
  IControleVersaoCalculadoraApiUnit,
  CompatibilidadeRtcModelUnit,
  PublicacaoRtcModelUnit;

type
  /// <summary>
  ///   Fake de IControleVersaoCalculadoraApi.
  ///   - Templates configurados sao clonados a cada retorno (o use case libera o retorno).
  ///   - URL/token recebidos via Configurar sao expostos apenas para assercao.
  ///   - ConfigurarFalha simula erro de HTTP/JSON sem expor token.
  /// </summary>
  TFakeControleVersaoCalculadoraApi = class(TInterfacedObject, IControleVersaoCalculadoraApi)
  private
    FBaseUrl: string;
    FToken: string;
    FCompatibilidade: CompatibilidadeRtcModel;
    FDisponivel: CompatibilidadeRtcModel;
    FPublicacoes: TObjectDictionary<string, PublicacaoRtcModel>;
    FFalhar: Boolean;
    FMensagemFalha: string;
    FCompatibilidadeChamada: Boolean;
    FDisponivelChamada: Boolean;
    FPublicacaoChamada: Boolean;
    FUltimoAppName: string;
    FUltimoRtcVersion: Integer;
    FUltimoAppNameDisponivel: string;
    FUltimaCalcVersion: string;

    function ClonarCompatibilidade(const AOrigem: CompatibilidadeRtcModel): CompatibilidadeRtcModel;
    function ClonarPublicacao(const AOrigem: PublicacaoRtcModel): PublicacaoRtcModel;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Configurar(const ABaseUrl, AToken: string; AIsStaging: Boolean);
    function ObterUltimaCompativel(const AAppName: string; ARtcVersion: Integer): CompatibilidadeRtcModel;
    function ObterUltimaDisponivel(const AAppName: string): CompatibilidadeRtcModel;
    function ObterPublicacao(const ACalcVersion: string): PublicacaoRtcModel;

    procedure ConfigurarCompatibilidade(
      const ACalcVersion: string;
      ARtcVersion: Integer;
      const AAppName: string = 'HW-DESKTOP'
    );
    procedure ConfigurarDisponible(
      const ACalcVersion: string;
      ARtcVersion: Integer;
      const AAppName: string = 'HW-DESKTOP'
    );
    procedure ConfigurarPublicacao(
      const ACalcVersion, ASha256, AReleaseTag, APublishedAt: string
    );
    procedure ConfigurarFalha(const AMensagem: string);
    procedure LimparFalha;

    property BaseUrl: string read FBaseUrl;
    property Token: string read FToken;
    property CompatibilidadeChamada: Boolean read FCompatibilidadeChamada;
    property DisponivelChamada: Boolean read FDisponivelChamada;
    property PublicacaoChamada: Boolean read FPublicacaoChamada;
    property UltimoAppName: string read FUltimoAppName;
    property UltimoRtcVersion: Integer read FUltimoRtcVersion;
    property UltimoAppNameDisponivel: string read FUltimoAppNameDisponivel;
    property UltimaCalcVersion: string read FUltimaCalcVersion;
  end;

implementation

uses
  SysUtils;

{ TFakeControleVersaoCalculadoraApi }

constructor TFakeControleVersaoCalculadoraApi.Create;
begin
  inherited Create;
  FCompatibilidade := nil;
  FDisponivel := nil;
  FPublicacoes := TObjectDictionary<string, PublicacaoRtcModel>.Create([doOwnsValues]);
  FFalhar := False;
  FMensagemFalha := '';
end;

destructor TFakeControleVersaoCalculadoraApi.Destroy;
begin
  FCompatibilidade.Free;
  FDisponivel.Free;
  FPublicacoes.Free;
  inherited;
end;

function TFakeControleVersaoCalculadoraApi.ClonarCompatibilidade(
  const AOrigem: CompatibilidadeRtcModel
): CompatibilidadeRtcModel;
begin
  if AOrigem = nil then
    Exit(nil);

  Result := CompatibilidadeRtcModel.Create;
  Result.id := AOrigem.id;
  Result.app_name := AOrigem.app_name;
  Result.calc_version := AOrigem.calc_version;
  Result.rtc_version := AOrigem.rtc_version;
end;

function TFakeControleVersaoCalculadoraApi.ClonarPublicacao(
  const AOrigem: PublicacaoRtcModel
): PublicacaoRtcModel;
begin
  if AOrigem = nil then
    Exit(nil);

  Result := PublicacaoRtcModel.Create;
  Result.calc_version := AOrigem.calc_version;
  Result.sha256 := AOrigem.sha256;
  Result.release_tag := AOrigem.release_tag;
  Result.published_at := AOrigem.published_at;
end;

procedure TFakeControleVersaoCalculadoraApi.Configurar(const ABaseUrl, AToken: string; AIsStaging: Boolean);
begin
  FBaseUrl := ABaseUrl;
  FToken := AToken;
end;

function TFakeControleVersaoCalculadoraApi.ObterUltimaCompativel(
  const AAppName: string;
  ARtcVersion: Integer
): CompatibilidadeRtcModel;
begin
  FCompatibilidadeChamada := True;
  FUltimoAppName := AAppName;
  FUltimoRtcVersion := ARtcVersion;

  if FFalhar then
    raise Exception.Create(FMensagemFalha);

  Result := ClonarCompatibilidade(FCompatibilidade);
end;

function TFakeControleVersaoCalculadoraApi.ObterUltimaDisponivel(
  const AAppName: string
): CompatibilidadeRtcModel;
begin
  FDisponivelChamada := True;
  FUltimoAppNameDisponivel := AAppName;

  if FFalhar then
    raise Exception.Create(FMensagemFalha);

  Result := ClonarCompatibilidade(FDisponivel);
end;

function TFakeControleVersaoCalculadoraApi.ObterPublicacao(
  const ACalcVersion: string
): PublicacaoRtcModel;
var
  Publicacao: PublicacaoRtcModel;
begin
  FPublicacaoChamada := True;
  FUltimaCalcVersion := ACalcVersion;

  if FFalhar then
    raise Exception.Create(FMensagemFalha);

  if FPublicacoes.TryGetValue(ACalcVersion, Publicacao) then
    Result := ClonarPublicacao(Publicacao)
  else
    Result := nil;
end;

procedure TFakeControleVersaoCalculadoraApi.ConfigurarCompatibilidade(
  const ACalcVersion: string;
  ARtcVersion: Integer;
  const AAppName: string
);
begin
  FCompatibilidade.Free;
  FCompatibilidade := CompatibilidadeRtcModel.Create;
  FCompatibilidade.id := 1;
  FCompatibilidade.app_name := AAppName;
  FCompatibilidade.calc_version := ACalcVersion;
  FCompatibilidade.rtc_version := ARtcVersion;
end;

procedure TFakeControleVersaoCalculadoraApi.ConfigurarDisponible(
  const ACalcVersion: string;
  ARtcVersion: Integer;
  const AAppName: string
);
begin
  FDisponivel.Free;
  FDisponivel := CompatibilidadeRtcModel.Create;
  FDisponivel.id := 1;
  FDisponivel.app_name := AAppName;
  FDisponivel.calc_version := ACalcVersion;
  FDisponivel.rtc_version := ARtcVersion;
end;

procedure TFakeControleVersaoCalculadoraApi.ConfigurarPublicacao(
  const ACalcVersion, ASha256, AReleaseTag, APublishedAt: string
);
var
  Publicacao: PublicacaoRtcModel;
begin
  Publicacao := PublicacaoRtcModel.Create;
  Publicacao.calc_version := ACalcVersion;
  Publicacao.sha256 := ASha256;
  Publicacao.release_tag := AReleaseTag;
  Publicacao.published_at := APublishedAt;

  if FPublicacoes.ContainsKey(ACalcVersion) then
    FPublicacoes.Remove(ACalcVersion);

  FPublicacoes.Add(ACalcVersion, Publicacao);
end;

procedure TFakeControleVersaoCalculadoraApi.ConfigurarFalha(const AMensagem: string);
begin
  FFalhar := True;
  FMensagemFalha := AMensagem;
end;

procedure TFakeControleVersaoCalculadoraApi.LimparFalha;
begin
  FFalhar := False;
  FMensagemFalha := '';
end;

end.
