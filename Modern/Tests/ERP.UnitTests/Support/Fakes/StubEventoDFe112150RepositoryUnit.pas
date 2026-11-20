unit StubEventoDFe112150RepositoryUnit;

interface

uses
  Contnrs,
  IEventoDFe112150RepositoryUnit;

type
  TEventoDFe112150DataStub = class
  public
    EventoId: string;
    DataPrevisao: TDate;
  end;

  TEventoDFe112150RepositoryStub = class(IEventoDFe112150Repository)
  private
    FDados: TObjectList;
    FInserirChamado: Boolean;
    FAtualizarChamado: Boolean;
    FFalharNoInserir: Boolean;
    FFalharNoAtualizar: Boolean;
    FUltimoIdInserido: string;
    FUltimaDataInserida: TDate;
    FUltimoIdAtualizado: string;
    FUltimaDataAtualizada: TDate;
    function IndicePorId(const AEventoId: string): Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Inserir(const AEventoId: string;
      ADataPrevisaoEntrega: TDate); override;
    procedure Atualizar(const AEventoId: string;
      ADataPrevisaoEntrega: TDate); override;
    function ObterDataPrevisao(const AEventoId: string;
      out ADataPrevisaoEntrega: TDate): Boolean; override;

    procedure AdicionarDataPrevisao(const AEventoId: string;
      ADataPrevisaoEntrega: TDate);

    property InserirChamado: Boolean read FInserirChamado;
    property AtualizarChamado: Boolean read FAtualizarChamado;
    property FalharNoInserir: Boolean
      read FFalharNoInserir write FFalharNoInserir;
    property FalharNoAtualizar: Boolean
      read FFalharNoAtualizar write FFalharNoAtualizar;
    property UltimoIdInserido: string read FUltimoIdInserido;
    property UltimaDataInserida: TDate read FUltimaDataInserida;
    property UltimoIdAtualizado: string read FUltimoIdAtualizado;
    property UltimaDataAtualizada: TDate read FUltimaDataAtualizada;
  end;

implementation

uses
  SysUtils;

{ TEventoDFe112150RepositoryStub }

constructor TEventoDFe112150RepositoryStub.Create;
begin
  inherited Create(nil);

  FDados := TObjectList.Create(True);
end;

destructor TEventoDFe112150RepositoryStub.Destroy;
begin
  FDados.Free;
  inherited;
end;

function TEventoDFe112150RepositoryStub.IndicePorId(
  const AEventoId: string): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to FDados.Count - 1 do
    if TEventoDFe112150DataStub(FDados[I]).EventoId = AEventoId then
      Exit(I);
end;

procedure TEventoDFe112150RepositoryStub.Inserir(const AEventoId: string;
  ADataPrevisaoEntrega: TDate);
var
  Indice: Integer;
  Dado: TEventoDFe112150DataStub;
begin
  FInserirChamado := True;
  FUltimoIdInserido := AEventoId;
  FUltimaDataInserida := ADataPrevisaoEntrega;

  if FFalharNoInserir then
    raise Exception.Create('Falha simulada na insercao do evento 112150');

  Indice := IndicePorId(AEventoId);

  if Indice >= 0 then
  begin
    TEventoDFe112150DataStub(FDados[Indice]).DataPrevisao := ADataPrevisaoEntrega;
    Exit;
  end;

  Dado := TEventoDFe112150DataStub.Create;
  Dado.EventoId := AEventoId;
  Dado.DataPrevisao := ADataPrevisaoEntrega;
  FDados.Add(Dado);
end;

procedure TEventoDFe112150RepositoryStub.Atualizar(const AEventoId: string;
  ADataPrevisaoEntrega: TDate);
var
  Indice: Integer;
  Dado: TEventoDFe112150DataStub;
begin
  FAtualizarChamado := True;
  FUltimoIdAtualizado := AEventoId;
  FUltimaDataAtualizada := ADataPrevisaoEntrega;

  if FFalharNoAtualizar then
    raise Exception.Create('Falha simulada na atualizacao do evento 112150');

  Indice := IndicePorId(AEventoId);

  if Indice >= 0 then
  begin
    TEventoDFe112150DataStub(FDados[Indice]).DataPrevisao := ADataPrevisaoEntrega;
    Exit;
  end;

  Dado := TEventoDFe112150DataStub.Create;
  Dado.EventoId := AEventoId;
  Dado.DataPrevisao := ADataPrevisaoEntrega;
  FDados.Add(Dado);
end;

function TEventoDFe112150RepositoryStub.ObterDataPrevisao(
  const AEventoId: string; out ADataPrevisaoEntrega: TDate): Boolean;
var
  Indice: Integer;
begin
  ADataPrevisaoEntrega := 0;

  Indice := IndicePorId(AEventoId);
  Result := Indice >= 0;

  if Result then
    ADataPrevisaoEntrega :=
      TEventoDFe112150DataStub(FDados[Indice]).DataPrevisao;
end;

procedure TEventoDFe112150RepositoryStub.AdicionarDataPrevisao(
  const AEventoId: string; ADataPrevisaoEntrega: TDate);
var
  Indice: Integer;
  Dado: TEventoDFe112150DataStub;
begin
  Indice := IndicePorId(AEventoId);

  if Indice >= 0 then
  begin
    TEventoDFe112150DataStub(FDados[Indice]).DataPrevisao := ADataPrevisaoEntrega;
    Exit;
  end;

  Dado := TEventoDFe112150DataStub.Create;
  Dado.EventoId := AEventoId;
  Dado.DataPrevisao := ADataPrevisaoEntrega;
  FDados.Add(Dado);
end;

end.
