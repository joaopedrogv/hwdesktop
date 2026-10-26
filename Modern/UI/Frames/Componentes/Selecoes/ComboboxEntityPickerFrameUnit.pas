unit ComboboxEntityPickerFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Contnrs, ExtCtrls;

type
  TOnEntityEvent = procedure(Sender: TObject; Entity: TObject; out DisplayInfo: string) of object;
  TOnEntityAdd = procedure(Sender: TObject; Entity: TObject; out DisplayInfo: string; out SetSelected: Boolean) of object;

  TComboboxEntityPickerFrame = class(TFrame)
    edEntity: TComboBox;
    pnVigencia: TPanel;
    lbInfo: TLabel;
    procedure edEntityChange(Sender: TObject);
  private
    FOwnerList: TObjectList;
    FOnEntitySelected: TOnEntityEvent;
    FOnEntityAdd: TOnEntityAdd;
  public
    destructor Destroy; override;
    //procedure Clear();
    //procedure Add(const Display: string; Value: TObject);
    procedure LoadEntities(Entities: TObjectList; ClaimAsOwner: Boolean);

    function GetSelectedEntity: TObject;

    property OnEntitySelected: TOnEntityEvent read FOnEntitySelected write FOnEntitySelected;
    property OnEntityAdd: TOnEntityAdd read FOnEntityAdd write FOnEntityAdd;
  end;

implementation

{$R *.dfm}

destructor TComboboxEntityPickerFrame.Destroy;
begin
  FOwnerList.Free();
  inherited;
end;

procedure TComboboxEntityPickerFrame.edEntityChange(Sender: TObject);
var
  Entity: TObject;
  SInfo: string;
begin
  Entity := edEntity.Items.Objects[edEntity.ItemIndex];
  if Assigned(FOnEntitySelected) then
  begin
    SInfo := '';
    FOnEntitySelected(Self, Entity, SInfo);
    lbInfo.Caption := SInfo;
  end;
end;

function TComboboxEntityPickerFrame.GetSelectedEntity: TObject;
begin   
  if edEntity.ItemIndex >= 0 then
    Result := edEntity.Items.Objects[edEntity.ItemIndex]
  else
    Result := nil;
end;

procedure TComboboxEntityPickerFrame.LoadEntities(Entities: TObjectList;
  ClaimAsOwner: Boolean);
var
  I: Integer;
  display, SInfo: string;
  setSelected: Boolean;
begin
  edEntity.Items.Clear;
  lbInfo.Caption := '';

  if ClaimAsOwner then
  begin
    if not Assigned(FOwnerList) then
      FOwnerList := TObjectList.Create();

    while (Entities.Count > 0) do
    begin
      display := '';
      setSelected := False;
      if Assigned(FOnEntityAdd) then
        FOnEntityAdd(Self, Entities[0], display, setSelected);

      edEntity.Items.AddObject(display, Entities[0]);
      FOwnerList.Add(Entities.Extract(Entities[0]));
      if setSelected then
      begin
        edEntity.ItemIndex := edEntity.Items.Count - 1;
        if Assigned(FOnEntitySelected) then
        begin
          SInfo := '';
          FOnEntitySelected(Self, FOwnerList[FOwnerList.Count - 1], SInfo);
          lbInfo.Caption := SInfo;
        end;
      end;
    end;

  end
  else
  begin
    for I := 0 to Entities.Count - 1 do
    begin
      display := '';
      setSelected := False;
      if Assigned(FOnEntityAdd) then
        FOnEntityAdd(Self, Entities[I], display, setSelected);

      edEntity.Items.AddObject(display, Entities[I]);
      if setSelected then
        edEntity.ItemIndex := edEntity.Items.Count - 1;
    end;
  end;
end;

end.
