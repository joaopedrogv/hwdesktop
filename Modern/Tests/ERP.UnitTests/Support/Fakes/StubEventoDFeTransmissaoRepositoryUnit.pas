unit StubEventoDFeTransmissaoRepositoryUnit;

interface

uses
  System.Generics.Collections,
  IEventoDFeTransmissaoRepositoryUnit,
  EventoDFeTransmissaoEtdUnit,
  EventoDFeTransmissaoTypesUnit,
  FakeTransactionUnit;

type
  TEventoDFeTransmissaoRepositoryStub = class(TInterfacedObject,
    IEventoDFeTransmissaoRepository)
  private
    FState: TTransactionSpyState;
    FTentativas: TObjectList<TEventoDFeTransmissaoEtd>;
    FProximoIdLote: Int64;
    FProximaTentativa: Integer;
    FSalvarRespostaLinhas: Integer;
    FFecharTentativaLinhas: Integer;
    FRegistrarTentativaChamado: Boolean;
    FSalvarRespostaChamado: Boolean;
    FSalvarRespostaConcluir: Boolean;
    FRegistrarEvidenciaChamado: Boolean;
    FRegistrarEvidenciaLinhas: Integer;
    FFecharTentativaChamado: Boolean;
    FTentativaRegistrada: TEventoDFeTransmissaoEtd;
    function Copiar(const AOrigem: TEventoDFeTransmissaoEtd):
      TEventoDFeTransmissaoEtd;
    function IndicePorId(const AId: string): Integer;
  public
    constructor Create(const AState: TTransactionSpyState);
    destructor Destroy; override;

    function ProximoIdLote: Int64;
    function RegistrarTentativa(const ATentativa: TEventoDFeTransmissaoEtd):
      TEventoDFeTransmissaoEtd;
    function SalvarResposta(const ATentativa: TEventoDFeTransmissaoEtd;
      const AConcluir: Boolean): Integer;
    function RegistrarEvidenciaConsulta(const ATentativa: TEventoDFeTransmissaoEtd):
      Integer;
    function FecharTentativaAberta(const AEventoDFeId: string): Integer;
    function ObterPorId(const AId: string): TEventoDFeTransmissaoEtd;
    function ObterUltimaPorEvento(const AEventoDFeId: string):
      TEventoDFeTransmissaoEtd;
    function ObterAbertaPorEvento(const AEventoDFeId: string):
      TEventoDFeTransmissaoEtd;

    procedure AdicionarTentativaAberta(const AEventoDFeId: string;
      const AXmlEnvio: string);
    procedure AdicionarTentativaConcluida(const AEventoDFeId: string;
      const AXmlEnvio, AXmlRetorno: string);

    property RegistrarTentativaChamado: Boolean
      read FRegistrarTentativaChamado;
    property TentativaRegistrada: TEventoDFeTransmissaoEtd
      read FTentativaRegistrada;
    property SalvarRespostaChamado: Boolean read FSalvarRespostaChamado;
    property SalvarRespostaConcluir: Boolean read FSalvarRespostaConcluir;
    property SalvarRespostaLinhas: Integer
      read FSalvarRespostaLinhas write FSalvarRespostaLinhas;
    property RegistrarEvidenciaChamado: Boolean
      read FRegistrarEvidenciaChamado;
    property RegistrarEvidenciaLinhas: Integer
      read FRegistrarEvidenciaLinhas write FRegistrarEvidenciaLinhas;
    property FecharTentativaChamado: Boolean read FFecharTentativaChamado;
    property FecharTentativaLinhas: Integer
      read FFecharTentativaLinhas write FFecharTentativaLinhas;
  end;

implementation

uses
  SysUtils;

constructor TEventoDFeTransmissaoRepositoryStub.Create(
  const AState: TTransactionSpyState);
begin
  inherited Create;

  FState := AState;
  FTentativas := TObjectList<TEventoDFeTransmissaoEtd>.Create(True);
  FProximoIdLote := 10;
  FSalvarRespostaLinhas := 1;
  FRegistrarEvidenciaLinhas := 1;
  FFecharTentativaLinhas := 1;
end;

destructor TEventoDFeTransmissaoRepositoryStub.Destroy;
begin
  FTentativas.Free;
  inherited;
end;

function TEventoDFeTransmissaoRepositoryStub.Copiar(
  const AOrigem: TEventoDFeTransmissaoEtd): TEventoDFeTransmissaoEtd;
begin
  Result := TEventoDFeTransmissaoEtd.Create;
  Result.Id := AOrigem.Id;
  Result.EventoDFeId := AOrigem.EventoDFeId;
  Result.IdLote := AOrigem.IdLote;
  Result.DhEvento := AOrigem.DhEvento;
  Result.DataInicio := AOrigem.DataInicio;
  Result.DataFim := AOrigem.DataFim;
  Result.Concluida := AOrigem.Concluida;
  Result.CStatLote := AOrigem.CStatLote;
  Result.CStatEvento := AOrigem.CStatEvento;
  Result.OrigemResultado := AOrigem.OrigemResultado;
  Result.XmlEnvio := AOrigem.XmlEnvio;
  Result.XmlRetorno := AOrigem.XmlRetorno;
  Result.XmlProcEvento := AOrigem.XmlProcEvento;
end;

function TEventoDFeTransmissaoRepositoryStub.IndicePorId(
  const AId: string): Integer;
var
  Indice: Integer;
begin
  for Indice := 0 to FTentativas.Count - 1 do
    if FTentativas[Indice].Id = AId then
      Exit(Indice);

  Result := -1;
end;

function TEventoDFeTransmissaoRepositoryStub.ProximoIdLote: Int64;
begin
  Result := FProximoIdLote;
  Inc(FProximoIdLote);
end;

function TEventoDFeTransmissaoRepositoryStub.RegistrarTentativa(
  const ATentativa: TEventoDFeTransmissaoEtd): TEventoDFeTransmissaoEtd;
begin
  FRegistrarTentativaChamado := True;
  Inc(FProximaTentativa);

  ATentativa.Id := Format('TENTATIVA-%d', [FProximaTentativa]);
  ATentativa.DataInicio := Now;
  ATentativa.Concluida := False;

  FTentativaRegistrada := Copiar(ATentativa);
  FTentativas.Add(FTentativaRegistrada);

  FState.Registrar('RegistrarTentativa');
  Result := ATentativa;
end;

function TEventoDFeTransmissaoRepositoryStub.SalvarResposta(
  const ATentativa: TEventoDFeTransmissaoEtd; const AConcluir: Boolean): Integer;
var
  Indice: Integer;
begin
  FSalvarRespostaChamado := True;
  FSalvarRespostaConcluir := AConcluir;
  FState.Registrar('SalvarResposta');

  Indice := IndicePorId(ATentativa.Id);

  if Indice >= 0 then
  begin
    FTentativas[Indice].CStatLote := ATentativa.CStatLote;
    FTentativas[Indice].CStatEvento := ATentativa.CStatEvento;
    FTentativas[Indice].OrigemResultado := ATentativa.OrigemResultado;
    FTentativas[Indice].XmlRetorno := ATentativa.XmlRetorno;
    FTentativas[Indice].XmlProcEvento := ATentativa.XmlProcEvento;

    if AConcluir then
    begin
      FTentativas[Indice].Concluida := True;
      FTentativas[Indice].DataFim := Now;
    end;
  end;

  Result := FSalvarRespostaLinhas;
end;

function TEventoDFeTransmissaoRepositoryStub.RegistrarEvidenciaConsulta(
  const ATentativa: TEventoDFeTransmissaoEtd): Integer;
var
  Indice: Integer;
begin
  FRegistrarEvidenciaChamado := True;
  FState.Registrar('RegistrarEvidenciaConsulta');

  Indice := IndicePorId(ATentativa.Id);

  if Indice >= 0 then
  begin
    FTentativas[Indice].CStatEvento := ATentativa.CStatEvento;
    FTentativas[Indice].OrigemResultado := ATentativa.OrigemResultado;
    FTentativas[Indice].XmlProcEvento := ATentativa.XmlProcEvento;
  end;

  Result := FRegistrarEvidenciaLinhas;
end;

function TEventoDFeTransmissaoRepositoryStub.FecharTentativaAberta(
  const AEventoDFeId: string): Integer;
var
  Indice: Integer;
begin
  FFecharTentativaChamado := True;
  FState.Registrar('FecharTentativaAberta');

  for Indice := 0 to FTentativas.Count - 1 do
    if (FTentativas[Indice].EventoDFeId = AEventoDFeId) and
       (not FTentativas[Indice].Concluida) then
    begin
      FTentativas[Indice].Concluida := True;
      FTentativas[Indice].DataFim := Now;
      FTentativas[Indice].CStatLote := 0;
      FTentativas[Indice].CStatEvento := 0;
    end;

  Result := FFecharTentativaLinhas;
end;

function TEventoDFeTransmissaoRepositoryStub.ObterPorId(
  const AId: string): TEventoDFeTransmissaoEtd;
var
  Indice: Integer;
begin
  Indice := IndicePorId(AId);

  if Indice < 0 then
    Exit(nil);

  Result := Copiar(FTentativas[Indice]);
end;

function TEventoDFeTransmissaoRepositoryStub.ObterUltimaPorEvento(
  const AEventoDFeId: string): TEventoDFeTransmissaoEtd;
var
  Indice: Integer;
begin
  Result := nil;

  for Indice := FTentativas.Count - 1 downto 0 do
    if FTentativas[Indice].EventoDFeId = AEventoDFeId then
      Exit(Copiar(FTentativas[Indice]));
end;

function TEventoDFeTransmissaoRepositoryStub.ObterAbertaPorEvento(
  const AEventoDFeId: string): TEventoDFeTransmissaoEtd;
var
  Indice: Integer;
begin
  Result := nil;

  for Indice := FTentativas.Count - 1 downto 0 do
    if (FTentativas[Indice].EventoDFeId = AEventoDFeId) and
       (not FTentativas[Indice].Concluida) then
      Exit(Copiar(FTentativas[Indice]));
end;

procedure TEventoDFeTransmissaoRepositoryStub.AdicionarTentativaAberta(
  const AEventoDFeId: string; const AXmlEnvio: string);
var
  LTentativa: TEventoDFeTransmissaoEtd;
begin
  LTentativa := TEventoDFeTransmissaoEtd.Novo(AEventoDFeId, FProximoIdLote,
    Now);
  try
    Inc(FProximoIdLote);
    Inc(FProximaTentativa);
    LTentativa.Id := Format('TENTATIVA-%d', [FProximaTentativa]);
    LTentativa.XmlEnvio := AXmlEnvio;

    FTentativas.Add(Copiar(LTentativa));
  finally
    LTentativa.Free;
  end;
end;

procedure TEventoDFeTransmissaoRepositoryStub.AdicionarTentativaConcluida(
  const AEventoDFeId: string; const AXmlEnvio, AXmlRetorno: string);
var
  LTentativa: TEventoDFeTransmissaoEtd;
begin
  LTentativa := TEventoDFeTransmissaoEtd.Novo(AEventoDFeId, FProximoIdLote,
    Now);
  try
    Inc(FProximoIdLote);
    Inc(FProximaTentativa);
    LTentativa.Id := Format('TENTATIVA-%d', [FProximaTentativa]);
    LTentativa.CStatLote := 128;
    LTentativa.CStatEvento := 573;
    LTentativa.OrigemResultado := orNenhuma;
    LTentativa.XmlEnvio := AXmlEnvio;
    LTentativa.XmlRetorno := AXmlRetorno;
    LTentativa.Concluida := True;
    LTentativa.DataFim := Now;

    FTentativas.Add(Copiar(LTentativa));
  finally
    LTentativa.Free;
  end;
end;

end.
