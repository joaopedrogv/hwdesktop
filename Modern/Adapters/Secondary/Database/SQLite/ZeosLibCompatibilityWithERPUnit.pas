unit ZeosLibCompatibilityWithERPUnit;

interface

{$IFDEF VER180}

uses
  Classes, ZConnection, DB;

type
  TZParam = TParam;

  TZTransaction= class
  private
    FConnection: TZConnection;
    procedure SetConnection(const Value: TZConnection);
  public
    constructor Create(AOwner: TComponent);

    procedure StartTransaction();
    procedure Commit();
    procedure Rollback();

    property Connection: TZConnection write SetConnection;
  end;

implementation

uses
  SysUtils;

{ TZTransaction }

procedure TZTransaction.Commit;
begin
  FConnection.Commit();
end;

constructor TZTransaction.Create(AOwner: TComponent);
begin
  if AOwner <> nil then
    raise Exception.Create('Delphi 2006 TZTransaction.Create AOwner need to bee nil');
end;

procedure TZTransaction.Rollback;
begin
  FConnection.Rollback();
end;

procedure TZTransaction.SetConnection(const Value: TZConnection);
begin
  FConnection := Value;
end;

procedure TZTransaction.StartTransaction;
begin
  FConnection.StartTransaction();
end;

{$ELSE}

implementation

{$ENDIF}

end.
