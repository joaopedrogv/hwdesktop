unit FakeTransactionUnit;

interface

uses
  Classes, SysUtils, ITransactionUnit;

type
  TTransactionSpyState = class
  private
    FAcoes: TStringList;
  public
    CommitCalled: Boolean;
    RollbackCalled: Boolean;
    FreeTransactionCalled: Boolean;
    TransactionDestroyed: Boolean;
    TransactionId: string;
    TransacoesAbertas: Integer;

    constructor Create;
    destructor Destroy; override;

    procedure Registrar(const AAcao: string);
    function IndiceDe(const AAcao: string; AOcorrencia: Integer = 0): Integer;
    function Ocorrencias(const AAcao: string): Integer;
  end;

  TFakeTransaction = class(ITransaction)
  private
    FState: TTransactionSpyState;
    FFechada: Boolean;
    procedure RegistrarFechamento(const AAcao: string);
  public
    constructor Create(AState: TTransactionSpyState);
    destructor Destroy; override;

    procedure Commit(); override;
    procedure Rollback(); override;
    function GetId(): string; override;
    procedure FreeTransaction(); override;
  end;

implementation

{ TTransactionSpyState }

constructor TTransactionSpyState.Create;
begin
  inherited Create;

  FAcoes := TStringList.Create;
end;

destructor TTransactionSpyState.Destroy;
begin
  FAcoes.Free;
  inherited;
end;

procedure TTransactionSpyState.Registrar(const AAcao: string);
begin
  FAcoes.Add(AAcao);
end;

function TTransactionSpyState.IndiceDe(const AAcao: string;
  AOcorrencia: Integer): Integer;
var
  Indice: Integer;
  Encontradas: Integer;
begin
  Encontradas := 0;

  for Indice := 0 to FAcoes.Count - 1 do
    if SameText(FAcoes[Indice], AAcao) then
    begin
      if Encontradas = AOcorrencia then
        Exit(Indice);

      Inc(Encontradas);
    end;

  Result := -1;
end;

function TTransactionSpyState.Ocorrencias(const AAcao: string): Integer;
var
  Indice: Integer;
begin
  Result := 0;

  for Indice := 0 to FAcoes.Count - 1 do
    if SameText(FAcoes[Indice], AAcao) then
      Inc(Result);
end;

{ TFakeTransaction }

constructor TFakeTransaction.Create(AState: TTransactionSpyState);
begin
  inherited Create;

  FState := AState;
  FFechada := False;
  Inc(FState.TransacoesAbertas);
  FState.Registrar('BeginTransaction');
end;

destructor TFakeTransaction.Destroy;
begin
  if Assigned(FState) then
  begin
    if not FFechada then
    begin
      FFechada := True;
      Dec(FState.TransacoesAbertas);
    end;

    FState.TransactionDestroyed := True;
  end;

  inherited;
end;

procedure TFakeTransaction.RegistrarFechamento(const AAcao: string);
begin
  if FFechada then
    Exit;

  FFechada := True;
  Dec(FState.TransacoesAbertas);
  FState.Registrar(AAcao);
end;

procedure TFakeTransaction.Commit;
begin
  FState.CommitCalled := True;
  RegistrarFechamento('Commit');
end;

procedure TFakeTransaction.Rollback;
begin
  FState.RollbackCalled := True;
  RegistrarFechamento('Rollback');
end;

function TFakeTransaction.GetId: string;
begin
  Result := FState.TransactionId;
end;

procedure TFakeTransaction.FreeTransaction;
begin
  FState.FreeTransactionCalled := True;
  FState.Registrar('FreeTransaction');
  Self.Free();
end;

end.
