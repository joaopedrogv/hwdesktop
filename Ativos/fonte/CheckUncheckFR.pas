unit CheckUncheckFR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, uDataSet_OOP, Buttons;

type
  TCheckUncheckFrame = class(TFrame)
    btUnCheckAll: TSpeedButton;
    btCheckAll: TSpeedButton;
    procedure btUnCheckAllClick(Sender: TObject);
    procedure btCheckAllClick(Sender: TObject);
  private
    FieldSel: string;
    DataOOP: TDataSet_OOP;
  public
    procedure FillForm(ADataOOP: TDataSet_OOP; AFieldSel: string = 'SEL');
  end;

implementation

{$R *.dfm}

procedure TCheckUncheckFrame.btCheckAllClick(Sender: TObject);
begin
  if not Assigned(DataOOP) then
    raise Exception.Create('DataOOP = nil. Call FillForm');

  Screen.Cursor := crHourGlass;
  try
    DataOOP.CheckUnCheckAllRows(True);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TCheckUncheckFrame.btUnCheckAllClick(Sender: TObject);
begin
  if not Assigned(DataOOP) then
    raise Exception.Create('DataOOP = nil. Call FillForm');

  Screen.Cursor := crHourGlass;
  try
    DataOOP.CheckUnCheckAllRows(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TCheckUncheckFrame.FillForm(ADataOOP: TDataSet_OOP; AFieldSel: string);
begin
  FieldSel := AFieldSel;
  DataOOP := ADataOOP;
end;

end.
