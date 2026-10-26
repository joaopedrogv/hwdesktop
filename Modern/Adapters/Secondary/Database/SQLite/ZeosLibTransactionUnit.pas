unit ZeosLibTransactionUnit;

interface

uses
  ITransactionUnit,
  ZeosLibDatabaseConnectionUnit,
  ZeosLibCompatibilityWithERPUnit,
  ZConnection;

type
  ZeosLibTransactionEvent = function(): TZTransaction of object;

  {$IFDEF INTF_ON}
  ZeosLibTransaction = class(TInterfacedObject, ITransaction)
  {$ELSE}
  ZeosLibTransaction = class(ITransaction)
  {$ENDIF}
  private
    //FDatabase: TZConnection;
    FId: string;
    FTransaction: TZTransaction;
    FConnection: ZeosLibDatabaseConnection;
    FOnNeedTransaction: ZeosLibTransactionEvent;
    function GetTransaction: TZTransaction; virtual;
  public
    constructor Create(const Database: TZConnection; const Connection: ZeosLibDatabaseConnection);
    destructor Destroy; override;

  {$IFDEF INTF_ON}
    procedure Commit();
    procedure Rollback();
    function GetId(): string;
    procedure FreeTransaction();
  {$ELSE}
    procedure Commit(); override;
    procedure Rollback(); override;
    function GetId(): string; override;
    procedure FreeTransaction(); override;
  {$ENDIF}

    property Transaction: TZTransaction read FTransaction;
    //property BeforeDestroy: ZeosLibTransactionEvent write FBeforeDestroy;
    property OnNeedTransaction: ZeosLibTransactionEvent read FOnNeedTransaction write FOnNeedTransaction;
  end;

implementation

uses
  SysUtils, GuidServiceUnit;

{ ZeosLibTransaction }

procedure ZeosLibTransaction.Commit;
begin
  FTransaction.Commit;
end;

constructor ZeosLibTransaction.Create(const Database: TZConnection; const Connection: ZeosLibDatabaseConnection);
begin
  FId := GuidService.New();
  FConnection  := Connection;
  FTransaction := TZTransaction.Create(nil );
  FTransaction.Connection := Database;
  FTransaction.StartTransaction;
end;

destructor ZeosLibTransaction.Destroy;
begin
  FConnection.ReleaseTransaction(FId);

  FTransaction.Free();

  inherited;
end;

procedure ZeosLibTransaction.FreeTransaction;
begin
  {$IFNDEF INTF_ON}
  Self.Free()
  {$ENDIF}
end;

function ZeosLibTransaction.GetId: string;
begin
  Result := FId;
end;

function ZeosLibTransaction.GetTransaction: TZTransaction;
begin
  if Assigned(FOnNeedTransaction) then
    Result := FOnNeedTransaction()
  else
    Result := FTransaction;
end;

procedure ZeosLibTransaction.Rollback;
begin
  FTransaction.Rollback;
end;

end.
