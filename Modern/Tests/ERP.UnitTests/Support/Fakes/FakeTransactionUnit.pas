unit FakeTransactionUnit;

interface

uses
  ITransactionUnit;

type
  TTransactionSpyState = class
  public
    CommitCalled: Boolean;
    RollbackCalled: Boolean;
    FreeTransactionCalled: Boolean;
    TransactionDestroyed: Boolean;
    TransactionId: string;
  end;

  TFakeTransaction = class(ITransaction)
  private
    FState: TTransactionSpyState;
  public
    constructor Create(AState: TTransactionSpyState);
    destructor Destroy; override;

    procedure Commit(); override;
    procedure Rollback(); override;
    function GetId(): string; override;
    procedure FreeTransaction(); override;
  end;

implementation

constructor TFakeTransaction.Create(AState: TTransactionSpyState);
begin
  inherited Create;
  FState := AState;
end;

destructor TFakeTransaction.Destroy;
begin
  if Assigned(FState) then
    FState.TransactionDestroyed := True;

  inherited;
end;

procedure TFakeTransaction.Commit;
begin
  FState.CommitCalled := True;
end;

procedure TFakeTransaction.Rollback;
begin
  FState.RollbackCalled := True;
end;

function TFakeTransaction.GetId: string;
begin
  Result := FState.TransactionId;
end;

procedure TFakeTransaction.FreeTransaction;
begin
  FState.FreeTransactionCalled := True;
end;

end.
