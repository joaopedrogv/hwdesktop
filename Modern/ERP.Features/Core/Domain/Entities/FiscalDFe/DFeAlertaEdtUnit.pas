unit DFeAlertaEdtUnit;

interface

uses
  Classes, SysUtils, Contnrs,
  EntityBaseUnit, IntegerNullableUnit;

type
  DFeAlertaEdt = class(EntityBase)
  private
    FId: string;
    FChaveDfe: string;
    FCmsg: IntegerNullable;
    FXmsg: string;
  public
    constructor Create(); overload;
    constructor Create(
      const AId: string;
      const AChaveDfe: string;
      const ACmsg: IntegerNullable;
      const AXmsg: string
    ); overload;

    function Clone(): EntityBase; override;

    property Id: string read FId write FId;
    property ChaveDfe: string read FChaveDfe write FChaveDfe;
    property Cmsg: IntegerNullable read FCmsg write FCmsg;
    property Xmsg: string read FXmsg write FXmsg;
  end;

  DFeAlertaEdtList = class(TObjectList)
  private
    function GetItem(Index: Integer): DFeAlertaEdt;
    procedure SetItem(Index: Integer; const Value: DFeAlertaEdt);
  public
    property Items[Index: Integer]: DFeAlertaEdt read GetItem write SetItem;
  end;

implementation

{ DFeAlertaEdt }

constructor DFeAlertaEdt.Create();
begin
  inherited Create;
end;

function DFeAlertaEdt.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := DFeAlertaEdt.Create(
      FId,
      FChaveDfe,
      FCmsg,
      FXmsg
    );
end;

constructor DFeAlertaEdt.Create(
  const AId: string;
  const AChaveDfe: string;
  const ACmsg: IntegerNullable;
  const AXmsg: string
);
begin
  Create();
  FId := AId;
  FChaveDfe := AChaveDfe;
  FCmsg := ACmsg;
  FXmsg := AXmsg;
end;

{ DFeAlertaEdtList }

function DFeAlertaEdtList.GetItem(Index: Integer): DFeAlertaEdt;
begin
  Result := DFeAlertaEdt(inherited Items[Index]);
end;

procedure DFeAlertaEdtList.SetItem(Index: Integer; const Value: DFeAlertaEdt);
begin
  Put(Index, Value);
end;

end.
