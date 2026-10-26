unit unMensagGc;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, Buttons;

type
  TfrmMensagGc = class(TForm)
    lblLinha4: TLabel;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
  end;

var
  frmMensagGc: TfrmMensagGc;

implementation

{$R *.DFM}

procedure TfrmMensagGc.FormShow(Sender: TObject);
begin
  BringToFront;
end;

end.
