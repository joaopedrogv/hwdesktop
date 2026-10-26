unit FakeHttpJsonClientUnit;

interface

uses
  System.Generics.Collections,
  IHttpJsonClientUnit;

type
  /// <summary>
  ///   Fake de IHttpJsonClient com respostas configuradas por URL.
  ///   Falha (levanta excecao) em chamada inesperada para nao mascarar dependencias.
  /// </summary>
  TFakeHttpJsonClient = class(TInterfacedObject, IHttpJsonClient)
  private
    FRespostas: TDictionary<string, THttpJsonResult>;
    FUrlsChamadas: TList<string>;
    FTokenFoiEnviado: Boolean;
    FFalharEmChamadaInesperada: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure ConfigurarResposta(const AUrl, AConteudo: string; AStatusCode: Integer = 200); overload;
    procedure ConfigurarResposta(const AUrl: string; const AResposta: THttpJsonResult); overload;
    procedure ConfigurarFalha(const AUrl, AErrorMessage: string; AStatusCode: Integer = 0);

    function Get(const AUrl, ABearerToken: string): THttpJsonResult;

    function FoiChamado(const AUrl: string): Boolean;
    function TotalDeChamadas: Integer;

    property TokenFoiEnviado: Boolean read FTokenFoiEnviado;
    property FalharEmChamadaInesperada: Boolean read FFalharEmChamadaInesperada write FFalharEmChamadaInesperada;
  end;

implementation

uses
  SysUtils;

{ TFakeHttpJsonClient }

constructor TFakeHttpJsonClient.Create;
begin
  inherited Create;
  FRespostas := TDictionary<string, THttpJsonResult>.Create;
  FUrlsChamadas := TList<string>.Create;
  FTokenFoiEnviado := False;
  FFalharEmChamadaInesperada := True;
end;

destructor TFakeHttpJsonClient.Destroy;
begin
  FUrlsChamadas.Free;
  FRespostas.Free;
  inherited;
end;

procedure TFakeHttpJsonClient.ConfigurarResposta(
  const AUrl, AConteudo: string;
  AStatusCode: Integer
);
var
  Resposta: THttpJsonResult;
begin
  Resposta.Success := AStatusCode = 200;
  Resposta.StatusCode := AStatusCode;
  Resposta.Content := AConteudo;
  Resposta.ErrorMessage := '';

  ConfigurarResposta(AUrl, Resposta);
end;

procedure TFakeHttpJsonClient.ConfigurarResposta(const AUrl: string; const AResposta: THttpJsonResult);
begin
  FRespostas.AddOrSetValue(AUrl, AResposta);
end;

procedure TFakeHttpJsonClient.ConfigurarFalha(
  const AUrl, AErrorMessage: string;
  AStatusCode: Integer
);
var
  Resposta: THttpJsonResult;
begin
  Resposta.Success := False;
  Resposta.StatusCode := AStatusCode;
  Resposta.Content := '';
  Resposta.ErrorMessage := AErrorMessage;

  ConfigurarResposta(AUrl, Resposta);
end;

function TFakeHttpJsonClient.Get(const AUrl, ABearerToken: string): THttpJsonResult;
begin
  FUrlsChamadas.Add(AUrl);
  FTokenFoiEnviado := ABearerToken <> '';

  if not FRespostas.TryGetValue(AUrl, Result) then
  begin
    if FFalharEmChamadaInesperada then
      raise Exception.Create('FakeHttpJsonClient: chamada inesperada para a URL ' + AUrl);

    Result.Success := False;
    Result.StatusCode := 0;
    Result.Content := '';
    Result.ErrorMessage := 'URL nao configurada no fake.';
  end;
end;

function TFakeHttpJsonClient.FoiChamado(const AUrl: string): Boolean;
begin
  Result := FUrlsChamadas.Contains(AUrl);
end;

function TFakeHttpJsonClient.TotalDeChamadas: Integer;
begin
  Result := FUrlsChamadas.Count;
end;

end.
