unit CheckListBoxEntityPickerFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Contnrs;

type
  TOnEntityEvent = procedure(Sender: TObject; Entity: TObject; out DisplayInfo: string) of object;
  TOnEntityAdd = procedure(Sender: TObject; Entity: TObject; out DisplayInfo: string; out SetSelected: Boolean) of object;

  TCheckListBoxEntityPickerFrame = class(TFrame)
    ckListEntities: TCheckListBox;
  private
    FOwnerList: TObjectList;
    FOnEntitySelected: TOnEntityEvent;
    FOnEntityAdd: TOnEntityAdd;
  public
    destructor Destroy; override;
    //procedure Clear();
    //procedure Add(const Display: string; Value: TObject);
    procedure LoadEntities(Entities: TObjectList; ClaimAsOwner: Boolean);

    function GetSelecteds: TObjectList;

    property OnEntitySelected: TOnEntityEvent read FOnEntitySelected write FOnEntitySelected;
    property OnEntityAdd: TOnEntityAdd read FOnEntityAdd write FOnEntityAdd;
  end;

implementation

{$R *.dfm}

destructor TCheckListBoxEntityPickerFrame.Destroy;
begin
  FOwnerList.Free();
  inherited;
end;

function TCheckListBoxEntityPickerFrame.GetSelecteds: TObjectList;
var
  I: Integer;
begin
  Result := TObjectList.Create(False);
  for I := 0 to ckListEntities.Items.Count - 1 do
    if ckListEntities.Checked[I] then
      Result.Add(ckListEntities.Items.Objects[I]);
end;

procedure TCheckListBoxEntityPickerFrame.LoadEntities(Entities: TObjectList;
  ClaimAsOwner: Boolean);
var
  I: Integer;
  display: string;
  setSelected: Boolean;
begin
  ckListEntities.Items.Clear;

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

      ckListEntities.AddItem(display, Entities[0]);
      FOwnerList.Add(Entities.Extract(Entities[0]));
      ckListEntities.Checked[ ckListEntities.Count - 1 ] := setSelected;
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

      ckListEntities.AddItem(display, Entities[I]);
      ckListEntities.Checked[ ckListEntities.Count - 1 ] := setSelected;
    end;
  end;
end;

end.
