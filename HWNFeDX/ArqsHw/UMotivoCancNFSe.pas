unit UMotivoCancNFSe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmMotivoCancNFSe = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMotivoCancNFSe: TFrmMotivoCancNFSe;

implementation

{$R *.dfm}

procedure TFrmMotivoCancNFSe.BitBtn1Click(Sender: TObject);
begin
  if Pos(copy(ComboBox1.text,1,1),'123') <= 0 then
  begin
    Application.MessageBox(pchar('Motivo inválido'),Pchar('Aviso'), MB_OK);
    ComboBox1.SetFocus;
  end
  else
  begin
   Close;
  end;
end;

end.
