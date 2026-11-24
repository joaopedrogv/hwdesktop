// Delphi Rio
unit FireDACTransactionUnit;

interface

uses
  ITransactionUnit,
  FireDACDatabaseConnectionUnit,
  FireDAC.Comp.Client;

type
  FireDACTransactionGetEvent = function(): TFDTransaction of object;

  FireDACTransaction = class(ITransaction)
  protected
    FId: string;
    FConnection: FireDACDatabaseConnection;
    FOnNeedTransaction: FireDACTransactionGetEvent;
    FTransaction: TFDTransaction;
    function GetFDTransaction: TFDTransaction; virtual;
  public
    constructor Create(); overload;
    constructor Create(NeedTransactionEvent: FireDACTransactionGetEvent); overload;
    constructor Create(const Database: TFDConnection; const Connection: FireDACDatabaseConnection); overload;
    destructor Destroy; override;

    procedure Commit(); override;
    procedure Rollback(); override;
    function GetId(): string; override;
    procedure FreeTransaction(); override;

    property FDTransaction: TFDTransaction read GetFDTransaction;
    property OnNeedTransaction: FireDACTransactionGetEvent read FOnNeedTransaction write FOnNeedTransaction;
  end;

implementation

uses
  GuidServiceUnit;

{ FireDACTransaction }

procedure FireDACTransaction.Commit;
var
  LTrans: TFDTransaction;
begin
  LTrans := GetFDTransaction;
  if Assigned(LTrans) and LTrans.Active then
    LTrans.Commit;
end;

constructor FireDACTransaction.Create;
begin
  FId := GuidService.New();
end;

constructor FireDACTransaction.Create(NeedTransactionEvent: FireDACTransactionGetEvent);
begin
  Self.Create();
  FOnNeedTransaction := NeedTransactionEvent;
end;

constructor FireDACTransaction.Create(
  const Database: TFDConnection;
  const Connection: FireDACDatabaseConnection);
begin
  Self.Create();

  FConnection := Connection;
  FTransaction := TFDTransaction.Create(nil);
  FTransaction.Connection := Database;
  FTransaction.Options.Params.Add('read_committed');
  FTransaction.Options.Params.Add('rec_version');
  FTransaction.Options.Params.Add('nowait');
  FTransaction.StartTransaction;
end;

destructor FireDACTransaction.Destroy;
begin
  if Assigned(FConnection) then
    FConnection.ReleaseTransaction(FId);

  if Assigned(FTransaction) then
    FTransaction.Free();

  inherited;
end;

procedure FireDACTransaction.FreeTransaction;
begin
  Self.Free();
end;

function FireDACTransaction.GetFDTransaction: TFDTransaction;
begin
  if Assigned(FOnNeedTransaction) then
    Result := FOnNeedTransaction()
  else
    Result := FTransaction;
end;

function FireDACTransaction.GetId: string;
begin
  Result := FId;
end;

procedure FireDACTransaction.Rollback;
var
  LTrans: TFDTransaction;
begin
  LTrans := GetFDTransaction;
  if Assigned(LTrans) and LTrans.Active then
    LTrans.Rollback;
end;

end.
