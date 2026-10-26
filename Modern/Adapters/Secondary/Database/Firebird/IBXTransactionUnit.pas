unit IBXTransactionUnit;

interface

uses
  ITransactionUnit,
  IBXTransactionBaseUnit,
  IBXDatabaseConnectionUnit,
  Classes,
  {$IFNDEF VER180}IBX.IBDatabase{$ELSE}IBDatabase{$ENDIF};

type                        
  {$IFDEF INTF_ON}
  IBXTransaction = class(IBXTransactionBase, ITransaction)
  {$ELSE}
  IBXTransaction = class(IBXTransactionBase)
  {$ENDIF}
  private
    FConnection: IBXDatabaseConnection;
    function GetIBTransaction: TIBTransaction; override;
  public
    constructor Create(const Database: TIBDatabase; const Connection: IBXDatabaseConnection);
    destructor Destroy; override;
  end;

implementation

uses
  SysUtils;

{ IBXTransaction }

constructor IBXTransaction.Create(
  const Database: TIBDatabase;
  const Connection: IBXDatabaseConnection);
begin
  inherited Create();

  FConnection := Connection;
  FTransaction := TIBTransaction.Create(nil);
  FTransaction.DefaultDatabase := Database;
  FTransaction.Params.Add('read_committed');
  FTransaction.Params.Add('rec_version');
  FTransaction.Params.Add('nowait');
  FTransaction.StartTransaction;

  FOnNeedTransaction := GetIBTransaction;
end;

destructor IBXTransaction.Destroy;
begin
  FConnection.ReleaseTransaction(FId);

  FTransaction.Free();

  inherited;
end;

function IBXTransaction.GetIBTransaction: TIBTransaction;
begin
  Result := FTransaction;
end;

end.
