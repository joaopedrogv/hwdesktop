unit UqrBuscaDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ShellAPI;

type
  TFrmQrBuscaDlg = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cancel : boolean;
    procedure GetText( var atext : string);
    function GetCase : boolean;
  end;

var
  FrmQrBuscaDlg: TFrmQrBuscaDlg;

implementation

{$R *.dfm}

procedure TFrmQrBuscaDlg.GetText( var atext : string);
begin
    atext := edit1.text;
end;

procedure TFrmQrBuscaDlg.FormShow(Sender: TObject);
begin
Self.Icon.Handle := ExtractIcon(Handle, PChar(Application.ExeName), 0);
end;

function TFrmQrBuscaDlg.GetCase : boolean;
begin
   result := self.CheckBox1.Checked;
end;

procedure TFrmQrBuscaDlg.SpeedButton1Click(Sender: TObject);
begin
     cancel := true;
     close;
end;

procedure TFrmQrBuscaDlg.SpeedButton2Click(Sender: TObject);
begin
     cancel := false;
     close;

end;

end.
