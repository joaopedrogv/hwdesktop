unit StubEventoDFe211130RepositoryUnit;

interface

uses
  IEventoDFe211130RepositoryUnit,
  EventoDFe211130ItemEtdUnit;

type
  TEventoDFe211130RepositoryStub = class(IEventoDFe211130Repository)
  private
    FEventoId: string;
    FItens: EventoDFe211130ItemEtdArray;
    FSubstituirChamado: Boolean;
    FFalharNaSubstituicao: Boolean;
    FUltimoIdSubstituido: string;
    function ItensOrdenados: EventoDFe211130ItemEtdArray;
  public
    procedure SubstituirItens(const AEventoId: string;
      const AItens: EventoDFe211130ItemEtdArray); override;
    function ObterItens(
      const AEventoId: string): EventoDFe211130ItemEtdArray; override;

    procedure AdicionarItens(const AEventoId: string;
      const AItens: EventoDFe211130ItemEtdArray);

    property SubstituirChamado: Boolean read FSubstituirChamado;
    property FalharNaSubstituicao: Boolean
      read FFalharNaSubstituicao write FFalharNaSubstituicao;
    property UltimoIdSubstituido: string read FUltimoIdSubstituido;
    property ItensSalvos: EventoDFe211130ItemEtdArray read FItens;
  end;

implementation

uses
  SysUtils,
  EventoDFe211130ItensUnit;

{ TEventoDFe211130RepositoryStub }

procedure TEventoDFe211130RepositoryStub.SubstituirItens(
  const AEventoId: string; const AItens: EventoDFe211130ItemEtdArray);
begin
  FSubstituirChamado := True;
  FUltimoIdSubstituido := AEventoId;

  if FFalharNaSubstituicao then
    raise Exception.Create('Falha simulada na substituicao dos itens');

  FEventoId := AEventoId;
  FItens := Copy(AItens, 0, Length(AItens));
end;

function TEventoDFe211130RepositoryStub.ItensOrdenados:
  EventoDFe211130ItemEtdArray;
begin
  Result := EventoDFe211130Itens.Normalizar(FItens);
end;

function TEventoDFe211130RepositoryStub.ObterItens(
  const AEventoId: string): EventoDFe211130ItemEtdArray;
begin
  if AEventoId <> FEventoId then
  begin
    SetLength(Result, 0);
    Exit;
  end;

  Result := ItensOrdenados;
end;

procedure TEventoDFe211130RepositoryStub.AdicionarItens(
  const AEventoId: string; const AItens: EventoDFe211130ItemEtdArray);
begin
  FEventoId := AEventoId;
  FItens := Copy(AItens, 0, Length(AItens));
end;

end.
