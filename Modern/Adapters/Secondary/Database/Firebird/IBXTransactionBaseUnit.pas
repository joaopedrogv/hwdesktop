unit IBXTransactionBaseUnit;

interface

uses
  ITransactionUnit,
  {$IFNDEF VER180}IBX.IBDatabase{$ELSE}IBDatabase{$ENDIF};

type                                     
  IBXTransactionGetEvent = function(): TIBTransaction of object;
                                
  {$IFDEF INTF_ON}
  IBXTransactionBase = class(TInterfacedObject)
  {$ELSE}                                      
  IBXTransactionBase = class(ITransaction)
  {$ENDIF}
  protected
    FId: string;
    FOnNeedTransaction: IBXTransactionGetEvent;
    FTransaction: TIBTransaction;
    function GetIBTransaction: TIBTransaction; virtual;
  public
    constructor Create(); overload;
    constructor Create(NeedTransactionEvent: IBXTransactionGetEvent); overload;

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

    property IBTransaction: TIBTransaction read GetIBTransaction;
    property OnNeedTransaction: IBXTransactionGetEvent read FOnNeedTransaction write FOnNeedTransaction;
  end;

implementation

uses
  GuidServiceUnit;

{ IBXTransactionBase }

procedure IBXTransactionBase.Commit;
begin
  if IBTransaction.InTransaction then
    IBTransaction.Commit;
end;

constructor IBXTransactionBase.Create;
begin
  FId := GuidService.New();
end;

constructor IBXTransactionBase.Create(NeedTransactionEvent: IBXTransactionGetEvent);
begin
  Self.Create();
  FOnNeedTransaction := NeedTransactionEvent;
end;

procedure IBXTransactionBase.FreeTransaction;
begin
  {$IFNDEF INTF_ON}
  Self.Free()
  {$ENDIF}
end;

function IBXTransactionBase.GetIBTransaction: TIBTransaction;
begin
  if Assigned(FOnNeedTransaction) then
    Result := FOnNeedTransaction()
  else
    Result := FTransaction;  
end;

function IBXTransactionBase.GetId: string;
begin
  Result := FId;
end;

procedure IBXTransactionBase.Rollback;
begin
  if IBTransaction.InTransaction then
    IBTransaction.Rollback;
end;

end.
