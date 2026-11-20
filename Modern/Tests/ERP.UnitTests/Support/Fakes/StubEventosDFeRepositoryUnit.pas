unit StubEventosDFeRepositoryUnit;

interface

uses
  Contnrs,
  IEventosDFeRepositoryUnit,
  EventoDFeEtdUnit;

type
  TEventosDFeRepositoryStub = class(IEventosDFeRepository)
  private
    FEventos: TObjectList;
    FInserirChamado: Boolean;
    FAtualizarChamado: Boolean;
    FRemoverChamado: Boolean;
    FObterProximoSeqIdChamado: Boolean;
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
    function CriarHeader(const AOrigem: EventoDFeEtd;
      const AId: string): EventoDFeEtd;
    function IndicePorId(const AId: string; AEmpresaId: Integer): Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function Inserir(const AEvento: EventoDFeEtd): EventoDFeEtd; override;
    function Atualizar(const AEvento: EventoDFeEtd): EventoDFeEtd; override;
    function ObterPorId(const AId: string;
      AEmpresaId: Integer): EventoDFeEtd; override;
    function ObterProximoSeqId(AEmpresaId: Integer): Integer; override;
    procedure RemoverLogicamente(const AId: string; AEmpresaId: Integer); override;

    procedure AdicionarEventoExistente(const AEvento: EventoDFeEtd);
    function EventoArmazenado(const AId: string): EventoDFeEtd;

    property InserirChamado: Boolean read FInserirChamado;
    property AtualizarChamado: Boolean read FAtualizarChamado;
    property RemoverChamado: Boolean read FRemoverChamado;
    property ObterProximoSeqIdChamado: Boolean read FObterProximoSeqIdChamado;
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
  FProximoSeqId := 1;
end;

destructor TEventosDFeRepositoryStub.Destroy;
begin
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
    AOrigem.DataAlteracao,
    AOrigem.Restaurar
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

procedure TEventosDFeRepositoryStub.AdicionarEventoExistente(
  const AEvento: EventoDFeEtd);
begin
  FEventos.Add(CriarHeader(AEvento, AEvento.Id));
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
