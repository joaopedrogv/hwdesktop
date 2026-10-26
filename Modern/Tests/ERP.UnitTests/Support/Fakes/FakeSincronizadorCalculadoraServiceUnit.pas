unit FakeSincronizadorCalculadoraServiceUnit;

interface

uses
  Classes,
  ISincronizadorCalculadoraServiceUnit,
  SincronizacaoCalculadoraSnapshotUnit;

type
  /// <summary>
  ///   Fake de ISincronizadorCalculadoraService em duas fases.
  ///   - Registra a ordem das chamadas (LerTodos / Aplicar) para testes de
  ///     leitura-antes-de-escrita do use case de aplicacao.
  ///   - Snapshot configurado e de propriedade do chamador (o fake nao libera).
  ///   - Quando nenhum snapshot e configurado, LerTodos devolve uma instancia
  ///     nova (propriedade do chamador).
  ///   - Falhas de leitura/aplicacao podem ser simuladas sem token/segredo.
  /// </summary>
  TFakeSincronizadorCalculadoraService = class(TInterfacedObject, ISincronizadorCalculadoraService)
  private
    FOrdemChamadas: TStringList;
    FSnapshot: SincronizacaoCalculadoraSnapshot;
    FLerTodosChamado: Boolean;
    FAplicarChamado: Boolean;
    FAplicarResultado: Boolean;
    FLerTodosFalhar: Boolean;
    FLerTodosMensagemFalha: string;
    FAplicarFalhar: Boolean;
    FAplicarMensagemFalha: string;
    FUltimoSnapshotAplicado: SincronizacaoCalculadoraSnapshot;
  public
    constructor Create;
    destructor Destroy; override;

    function LerTodos(): SincronizacaoCalculadoraSnapshot;
    function Aplicar(const ASnapshot: SincronizacaoCalculadoraSnapshot): Boolean;

    procedure ConfigurarSnapshot(const ASnapshot: SincronizacaoCalculadoraSnapshot);
    procedure ConfigurarResultadoAplicar(const AResultado: Boolean);
    procedure ConfigurarFalhaLeitura(const AMensagem: string);
    procedure ConfigurarFalhaAplicacao(const AMensagem: string);
    procedure LimparFalhas;

    function FoiChamado(const AChamada: string): Boolean;
    function IndiceDaChamada(const AChamada: string): Integer;

    property OrdemChamadas: TStringList read FOrdemChamadas;
    property LerTodosChamado: Boolean read FLerTodosChamado;
    property AplicarChamado: Boolean read FAplicarChamado;
    property UltimoSnapshotAplicado: SincronizacaoCalculadoraSnapshot read FUltimoSnapshotAplicado;
  end;

implementation

uses
  SysUtils;

{ TFakeSincronizadorCalculadoraService }

constructor TFakeSincronizadorCalculadoraService.Create;
begin
  inherited Create;
  FOrdemChamadas := TStringList.Create;
  FSnapshot := nil;
  FLerTodosChamado := False;
  FAplicarChamado := False;
  FAplicarResultado := True;
  FLerTodosFalhar := False;
  FAplicarFalhar := False;
  FUltimoSnapshotAplicado := nil;
end;

destructor TFakeSincronizadorCalculadoraService.Destroy;
begin
  FOrdemChamadas.Free;
  inherited;
end;

function TFakeSincronizadorCalculadoraService.LerTodos(): SincronizacaoCalculadoraSnapshot;
begin
  FLerTodosChamado := True;
  FOrdemChamadas.Add('LerTodos');

  if FLerTodosFalhar then
    raise Exception.Create(FLerTodosMensagemFalha);

  if Assigned(FSnapshot) then
    Result := FSnapshot
  else
    Result := SincronizacaoCalculadoraSnapshot.Create();
end;

function TFakeSincronizadorCalculadoraService.Aplicar(
  const ASnapshot: SincronizacaoCalculadoraSnapshot): Boolean;
begin
  FAplicarChamado := True;
  FUltimoSnapshotAplicado := ASnapshot;
  FOrdemChamadas.Add('Aplicar');

  if FAplicarFalhar then
    raise Exception.Create(FAplicarMensagemFalha);

  Result := FAplicarResultado;
end;

procedure TFakeSincronizadorCalculadoraService.ConfigurarSnapshot(
  const ASnapshot: SincronizacaoCalculadoraSnapshot);
begin
  FSnapshot := ASnapshot;
end;

procedure TFakeSincronizadorCalculadoraService.ConfigurarResultadoAplicar(
  const AResultado: Boolean);
begin
  FAplicarResultado := AResultado;
end;

procedure TFakeSincronizadorCalculadoraService.ConfigurarFalhaLeitura(const AMensagem: string);
begin
  FLerTodosFalhar := True;
  FLerTodosMensagemFalha := AMensagem;
end;

procedure TFakeSincronizadorCalculadoraService.ConfigurarFalhaAplicacao(const AMensagem: string);
begin
  FAplicarFalhar := True;
  FAplicarMensagemFalha := AMensagem;
end;

procedure TFakeSincronizadorCalculadoraService.LimparFalhas;
begin
  FLerTodosFalhar := False;
  FAplicarFalhar := False;
  FLerTodosMensagemFalha := '';
  FAplicarMensagemFalha := '';
end;

function TFakeSincronizadorCalculadoraService.FoiChamado(const AChamada: string): Boolean;
begin
  Result := FOrdemChamadas.IndexOf(AChamada) >= 0;
end;

function TFakeSincronizadorCalculadoraService.IndiceDaChamada(const AChamada: string): Integer;
begin
  Result := FOrdemChamadas.IndexOf(AChamada);
end;

end.
