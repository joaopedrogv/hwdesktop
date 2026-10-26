unit MaskEditNullableFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, StringNullableUnit, DateAndTimeNullableUnit;

type
  TMaskEditType = (mtText, mtDate, mtDateTime);

  TMaskEditNullableFrame = class(TFrame)
    ckNotNull: TCheckBox;
    edMask: TMaskEdit;
    procedure ckNotNullClick(Sender: TObject);
  public
    procedure Setup(const Value: DateNullable); overload;
    procedure Setup(const Value: DateTimeNullable); overload;
    procedure Setup(const Value: StringNullable; const EditMask: string = ''); overload;
    function GetDateNullable(): DateNullable;
    function GetDateTimeNullable(): DateTimeNullable;
    function GetStringNullable(): StringNullable;
  end;

implementation

uses DateTimeServiceUnit;

{$R *.dfm}

{ TFrame1 }

procedure TMaskEditNullableFrame.ckNotNullClick(Sender: TObject);
begin
  edMask.Enabled := ckNotNull.Checked;
end;

function TMaskEditNullableFrame.GetDateNullable: DateNullable;
begin
  if ckNotNull.Checked then
    Result := DateNullable.Create( DateService.FromLocalToDate(edMask.Text) )
  else
    Result := DateNullable.NullInstance();
end;

function TMaskEditNullableFrame.GetDateTimeNullable: DateTimeNullable;
begin
  if ckNotNull.Checked then
    Result := DateTimeNullable.Create( DateTimeService.FromLocalToDateTime(edMask.Text) )
  else
    Result := DateTimeNullable.NullInstance();
end;

function TMaskEditNullableFrame.GetStringNullable: StringNullable;
begin
  if ckNotNull.Checked then
    Result := StringNullable.Create( edMask.Text )
  else
    Result := StringNullable.NullInstance();
end;

procedure TMaskEditNullableFrame.Setup(const Value: DateNullable);
begin
  edMask.EditMask := '!99/99/0000;1;_';

  edMask.Enabled := not Value.IsNull;
  ckNotNull.Checked := not Value.IsNull;
  if Value.IsNull then
    edMask.Clear()
  else
    edMask.Text := DateService.ParseLocal( Value.Value );
end;

procedure TMaskEditNullableFrame.Setup(const Value: StringNullable;
  const EditMask: string);
begin
  edMask.EditMask := EditMask;

  edMask.Enabled := not Value.IsNull;
  ckNotNull.Checked := not Value.IsNull;
  if Value.IsNull then
    edMask.Clear()
  else
    edMask.Text := Value.Value;
end;

procedure TMaskEditNullableFrame.Setup(const Value: DateTimeNullable);
begin
  edMask.EditMask := '!99/99/0000;1;_';

  edMask.Enabled := not Value.IsNull;
  ckNotNull.Checked := not Value.IsNull;
  if Value.IsNull then
    edMask.Clear()
  else
    edMask.Text := DateTimeService.ParseLocal( Value.Value );
end;

end.
