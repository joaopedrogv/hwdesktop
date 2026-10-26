unit UPesProsSPED;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFrmPesqProsSPED = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Panel2: TPanel;
    procedure BitBtn1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqProsSPED: TFrmPesqProsSPED;

implementation

{$R *.dfm}

procedure TFrmPesqProsSPED.BitBtn1Enter(Sender: TObject);
begin
  inherited;
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MessageDlg('Campo usuário em branco!', mtInformation, [mbOk], 0);
    MaskEdit1.SetFocus;
  end
  else if (Trim(MaskEdit2.Text) = '') then
  begin
    MessageDlg('Campo senha em branco!', mtInformation, [mbOk], 0);
    MaskEdit2.SetFocus;
  end;
end;

end.

