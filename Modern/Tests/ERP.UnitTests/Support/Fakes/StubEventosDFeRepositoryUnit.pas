unit StubEventosDFeRepositoryUnit;

interface

uses
  Contnrs,
  System.Generics.Collections,
  IEventosDFeRepositoryUnit,
  EventoDFeEtdUnit,
  EventoDFeStatusUnit,
  EventoDFeTransmissaoTypesUnit,
  TipoEventoDFeUnit;

type
  TEventosDFeRepositoryStub = class(IEventosDFeRepository)
  private
    FEventos: TObjectList;
    FStatusPorId: TDictionary<string, TStatusEventoDFe>;
    FNseqPorId: TDictionary<string, Integer>;
    FInserirChamado: Boolean;
    FAtualizarChamado: Boolean;
    FRemoverChamado: Boolean;
    FObterProximoSeqIdChamado: Boolean;
    FGarantirNseqChamado: Boolean;
    FRegistrarEnvioChamado: Boolean;
    FConcluirEventoChamado: Boolean;
    FFalharNoInserir: Boolean;
    FFalharNoAtualizar: Boolean;
    FFalharNaRemocao: Boolean;
    FColidirSeqId: Integer;
    FProximoSeqId: Integer;
    FProximoId: Integer;
    FInserirChamadas: Integer;
    FUltimoSeqIdInserido: Integer;
    FUltimoIdAtualizado: string;
    FUltimoIdRemovido: string;
    FUltimoIdObterPorId: string;
    FUltimaEmpresaObterPorId: Integer;
    FUltimaEmpresaRemovida: Integer;
    FUltimaEmpresaProximoSeqId: Integer;
    FRegistrarEnvioLinhas: Integer;
    FConcluirEventoLinhas: Integer;
    FUltimoAmbienteRegistrado: Integer;
    FUltimoCnpjRegistrado: string;
    FUltimoCOrgaoRegistrado: Integer;
    FUltimoTpAutorRegistrado: Integer;
    FUltimoCOrgaoAutorRegistrado: Integer;
    FUltimoStatusEsperado: TStatusEventoDFe;
    FUltimoNovoStatus: TStatusEventoDFe;
    FUltimoMotivo: string;
    FUltimoNProt: string;
    FUltimoDhRegEvento: TDateTime;
    function CriarHeader(const AOrigem: EventoDFeEtd;
      const AId: string): EventoDFeEtd;
    function IndicePorId(const AId: string; AEmpresaId: Integer): Integer;
    function StatusDe(const AId: string): TStatusEventoDFe;
    function NseqDe(const AId: string): Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function Inserir(const AEvento: EventoDFeEtd): EventoDFeEtd; override;
    function Atualizar(const AEvento: EventoDFeEtd): EventoDFeEtd; override;
    function ObterPorId(const AId: string;
      AEmpresaId: Integer): EventoDFeEtd; override;
    function ObterProximoSeqId(AEmpresaId: Integer): Integer; override;
    procedure RemoverLogicamente(const AId: string; AEmpresaId: Integer); override;
    function ObterConflitoEvento(const ACodEmpresa: Integer;
      const AChaveDocumento: string; const ATipoEvento: TipoEventoDFe;
      const AIdIgnorado: string): TEventoDFeConflito; override;
    function GarantirNseqEvento(const AId: string;
      const ACodEmpresa: Integer; const AChaveDocumento: string;
      const ATipoEvento: TipoEventoDFe): Integer; override;
    function RegistrarEnvio(const AId: string; const AAmbiente: Integer;
      const ACnpj: string; const ACOrgao, ATpAutor, ACOrgaoAutor: Integer): Integer;
      override;
    function ConcluirEvento(const AId: string;
      const AStatusEsperado, ANovoStatus: TStatusEventoDFe;
      const AXMotivo, ANProt: string; const ADhRegEvento: TDateTime): Integer;
      override;

    procedure AdicionarEventoExistente(const AEvento: EventoDFeEtd;
      const AStatus: TStatusEventoDFe = sePendente;
      const ANseqEvento: Integer = 0);
    function EventoArmazenado(const AId: string): EventoDFeEtd;

    property InserirChamado: Boolean read FInserirChamado;
    property AtualizarChamado: Boolean read FAtualizarChamado;
    property RemoverChamado: Boolean read FRemoverChamado;
    property ObterProximoSeqIdChamado: Boolean read FObterProximoSeqIdChamado;
    property GarantirNseqChamado: Boolean read FGarantirNseqChamado;
    property RegistrarEnvioChamado: Boolean read FRegistrarEnvioChamado;
    property ConcluirEventoChamado: Boolean read FConcluirEventoChamado;
    property FalharNoInserir: Boolean
      read FFalharNoInserir write FFalharNoInserir;
    property FalharNoAtualizar: Boolean
      read FFalharNoAtualizar write FFalharNoAtualizar;
    property FalharNaRemocao: Boolean
      read FFalharNaRemocao write FFalharNaRemocao;
    property ColidirSeqId: Integer read FColidirSeqId write FColidirSeqId;
    property ProximoSeqId: Integer read FProximoSeqId write FProximoSeqId;
    property InserirChamadas: Integer read FInserirChamadas;
    property UltimoSeqIdInserido: Integer read FUltimoSeqIdInserido;
    property UltimoIdAtualizado: string read FUltimoIdAtualizado;
    property UltimoIdRemovido: string read FUltimoIdRemovido;
    property UltimoIdObterPorId: string read FUltimoIdObterPorId;
    property UltimaEmpresaObterPorId: Integer read FUltimaEmpresaObterPorId;
    property UltimaEmpresaRemovida: Integer read FUltimaEmpresaRemovida;
    property UltimaEmpresaProximoSeqId: Integer
      read FUltimaEmpresaProximoSeqId;
    property RegistrarEnvioLinhas: Integer
      read FRegistrarEnvioLinhas write FRegistrarEnvioLinhas;
    property ConcluirEventoLinhas: Integer
      read FConcluirEventoLinhas write FConcluirEventoLinhas;
    property UltimoAmbienteRegistrado: Integer
      read FUltimoAmbienteRegistrado;
    property UltimoCnpjRegistrado: string read FUltimoCnpjRegistrado;
    property UltimoCOrgaoRegistrado: Integer read FUltimoCOrgaoRegistrado;
    property UltimoTpAutorRegistrado: Integer read FUltimoTpAutorRegistrado;
    property UltimoCOrgaoAutorRegistrado: Integer
      read FUltimoCOrgaoAutorRegistrado;
    property UltimoStatusEsperado: TStatusEventoDFe
      read FUltimoStatusEsperado;
    property UltimoNovoStatus: TStatusEventoDFe read FUltimoNovoStatus;
    property UltimoMotivo: string read FUltimoMotivo;
    property UltimoNProt: string read FUltimoNProt;
    property UltimoDhRegEvento: TDateTime read FUltimoDhRegEvento;
  end;

implementation

uses
  SysUtils,
  StatusRegistroEnumUnit;

{ TEventosDFeRepositoryStub }

constructor TEventosDFeRepositoryStub.Create;
begin
  inherited Create(nil);

  FEventos := TObjectList.Create(True);
  FStatusPorId := TDictionary<string, TStatusEventoDFe>.Create;
  FNseqPorId := TDictionary<string, Integer>.Create;
  FProximoSeqId := 1;
  FRegistrarEnvioLinhas := 1;
  FConcluirEventoLinhas := 1;
end;

destructor TEventosDFeRepositoryStub.Destroy;
begin
  FNseqPorId.Free;
  FStatusPorId.Free;
  FEventos.Free;
  inherited;
end;

function TEventosDFeRepositoryStub.CriarHeader(const AOrigem: EventoDFeEtd;
  const AId: string): EventoDFeEtd;
begin
  Result := EventoDFeEtd.Create(
    AId,
    AOrigem.SeqId,
    AOrigem.FamiliaDocumento,
    AOrigem.TipoEvento,
    AOrigem.ChaveDocumento,
    AOrigem.CodEmpresa,
    AOrigem.Ativo,
    AOrigem.DataCadastro,
    AOrigem.DataAlteracao
  );
end;

function TEventosDFeRepositoryStub.IndicePorId(const AId: string;
  AEmpresaId: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to FEventos.Count - 1 do
    if (EventoDFeEtd(FEventos[I]).Id = AId) and
       (EventoDFeEtd(FEventos[I]).CodEmpresa = AEmpresaId) then
      Exit(I);
end;

function TEventosDFeRepositoryStub.StatusDe(
  const AId: string): TStatusEventoDFe;
begin
  if not FStatusPorId.TryGetValue(AId, Result) then
    Result := sePendente;
end;

function TEventosDFeRepositoryStub.NseqDe(const AId: string): Integer;
begin
  if not FNseqPorId.TryGetValue(AId, Result) then
    Result := 0;
end;

function TEventosDFeRepositoryStub.Inserir(
  const AEvento: EventoDFeEtd): EventoDFeEtd;
var
  Id: string;
begin
  FInserirChamado := True;
  Inc(FInserirChamadas);

  if FFalharNoInserir then
    raise Exception.Create('Falha simulada na insercao do cabecalho');

  if (FColidirSeqId > 0) and (AEvento.SeqId = FColidirSeqId) then
    raise Exception.Create(
      'violation of PRIMARY or UNIQUE KEY constraint ' +
      '"UNQ_EVENTOS_DFE_SEQ" on table "EVENTOS_DFE"');

  FUltimoSeqIdInserido := AEvento.SeqId;

  Inc(FProximoId);
  Id := Format('EVENTO-%d', [FProximoId]);

  FEventos.Add(CriarHeader(AEvento, Id));
  FStatusPorId.AddOrSetValue(Id, sePendente);
  FNseqPorId.AddOrSetValue(Id, 0);

  Result := CriarHeader(AEvento, Id);
end;

function TEventosDFeRepositoryStub.Atualizar(
  const AEvento: EventoDFeEtd): EventoDFeEtd;
var
  Indice: Integer;
begin
  FAtualizarChamado := True;
  FUltimoIdAtualizado := AEvento.Id;

  if FFalharNoAtualizar then
    raise Exception.Create('Falha simulada na atualizacao do cabecalho');

  Indice := IndicePorId(AEvento.Id, AEvento.CodEmpresa);

  if Indice < 0 then
    raise Exception.Create('Evento DF-e nao encontrado apos a atualizacao.');

  FEventos.Delete(Indice);
  FEventos.Add(CriarHeader(AEvento, AEvento.Id));

  Result := CriarHeader(AEvento, AEvento.Id);
end;

function TEventosDFeRepositoryStub.ObterPorId(const AId: string;
  AEmpresaId: Integer): EventoDFeEtd;
var
  Indice: Integer;
begin
  FUltimoIdObterPorId := AId;
  FUltimaEmpresaObterPorId := AEmpresaId;

  Indice := IndicePorId(AId, AEmpresaId);

  if Indice < 0 then
    Exit(nil);

  Result := CriarHeader(EventoDFeEtd(FEventos[Indice]), AId);
  Result.Status := StatusDe(AId);
  Result.NseqEvento := NseqDe(AId);
end;

function TEventosDFeRepositoryStub.ObterProximoSeqId(
  AEmpresaId: Integer): Integer;
begin
  FObterProximoSeqIdChamado := True;
  FUltimaEmpresaProximoSeqId := AEmpresaId;

  Result := FProximoSeqId;
end;

procedure TEventosDFeRepositoryStub.RemoverLogicamente(const AId: string;
  AEmpresaId: Integer);
var
  Indice: Integer;
begin
  FRemoverChamado := True;
  FUltimoIdRemovido := AId;
  FUltimaEmpresaRemovida := AEmpresaId;

  if FFalharNaRemocao then
    raise Exception.Create('Falha simulada na remocao logica');

  Indice := IndicePorId(AId, AEmpresaId);

  if Indice >= 0 then
    EventoDFeEtd(FEventos[Indice]).Ativo := saLixeira;
end;

function TEventosDFeRepositoryStub.ObterConflitoEvento(
  const ACodEmpresa: Integer; const AChaveDocumento: string;
  const ATipoEvento: TipoEventoDFe;
  const AIdIgnorado: string): TEventoDFeConflito;
var
  I: Integer;
  Evento: EventoDFeEtd;
  Status: TStatusEventoDFe;
begin
  Result.Existe := False;
  Result.IdExistente := '';
  Result.SeqIdExistente := 0;
  Result.StatusExistente := sePendente;

  for I := 0 to FEventos.Count - 1 do
  begin
    Evento := EventoDFeEtd(FEventos[I]);
    Status := StatusDe(Evento.Id);

    if (Evento.CodEmpresa = ACodEmpresa) and
       (Evento.ChaveDocumento = AChaveDocumento) and
       (Evento.TipoEvento = ATipoEvento) and
       (Evento.Ativo = saAtivo) and
       (Evento.Id <> AIdIgnorado) and
       (Status <> seAutorizado) then
    begin
      Result.Existe := True;
      Result.IdExistente := Evento.Id;
      Result.SeqIdExistente := Evento.SeqId;
      Result.StatusExistente := Status;
      Exit;
    end;
  end;
end;

function TEventosDFeRepositoryStub.GarantirNseqEvento(const AId: string;
  const ACodEmpresa: Integer; const AChaveDocumento: string;
  const ATipoEvento: TipoEventoDFe): Integer;
var
  I: Integer;
  NseqAtual: Integer;
  MaiorNseq: Integer;
  Evento: EventoDFeEtd;
begin
  FGarantirNseqChamado := True;

  NseqAtual := NseqDe(AId);
  if NseqAtual > 0 then
    Exit(NseqAtual);

  MaiorNseq := 0;
  for I := 0 to FEventos.Count - 1 do
  begin
    Evento := EventoDFeEtd(FEventos[I]);

    if (Evento.CodEmpresa = ACodEmpresa) and
       (Evento.ChaveDocumento = AChaveDocumento) and
       (Evento.TipoEvento = ATipoEvento) and
       (StatusDe(Evento.Id) = seAutorizado) and
       (NseqDe(Evento.Id) > MaiorNseq) then
      MaiorNseq := NseqDe(Evento.Id);
  end;

  Result := MaiorNseq + 1;
  FNseqPorId.AddOrSetValue(AId, Result);
end;

function TEventosDFeRepositoryStub.RegistrarEnvio(const AId: string;
  const AAmbiente: Integer; const ACnpj: string;
  const ACOrgao, ATpAutor, ACOrgaoAutor: Integer): Integer;
begin
  FRegistrarEnvioChamado := True;
  FUltimoAmbienteRegistrado := AAmbiente;
  FUltimoCnpjRegistrado := ACnpj;
  FUltimoCOrgaoRegistrado := ACOrgao;
  FUltimoTpAutorRegistrado := ATpAutor;
  FUltimoCOrgaoAutorRegistrado := ACOrgaoAutor;
  Result := FRegistrarEnvioLinhas;

  if Result = 1 then
    FStatusPorId.AddOrSetValue(AId, seEnviando);
end;

function TEventosDFeRepositoryStub.ConcluirEvento(const AId: string;
  const AStatusEsperado, ANovoStatus: TStatusEventoDFe;
  const AXMotivo, ANProt: string; const ADhRegEvento: TDateTime): Integer;
begin
  FConcluirEventoChamado := True;
  FUltimoStatusEsperado := AStatusEsperado;
  FUltimoNovoStatus := ANovoStatus;
  FUltimoMotivo := AXMotivo;
  FUltimoNProt := ANProt;
  FUltimoDhRegEvento := ADhRegEvento;
  Result := FConcluirEventoLinhas;

  if Result = 1 then
    FStatusPorId.AddOrSetValue(AId, ANovoStatus);
end;

procedure TEventosDFeRepositoryStub.AdicionarEventoExistente(
  const AEvento: EventoDFeEtd; const AStatus: TStatusEventoDFe;
  const ANseqEvento: Integer);
begin
  FEventos.Add(CriarHeader(AEvento, AEvento.Id));
  FStatusPorId.AddOrSetValue(AEvento.Id, AStatus);
  FNseqPorId.AddOrSetValue(AEvento.Id, ANseqEvento);
end;

function TEventosDFeRepositoryStub.EventoArmazenado(
  const AId: string): EventoDFeEtd;
var
  I: Integer;
begin
  for I := 0 to FEventos.Count - 1 do
    if EventoDFeEtd(FEventos[I]).Id = AId then
      Exit(EventoDFeEtd(FEventos[I]));

  Result := nil;
end;

end.
