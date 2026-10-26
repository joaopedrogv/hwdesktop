unit UModImpG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons;

type
  TFrmModImpG = class(TfrmPadrao)
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmModImpG: TFrmModImpG;

implementation


{$R *.dfm}

procedure TFrmModImpG.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmModImpG.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=1;
//  Combobox1.text := 'Epson'; //vDadosIniPrestacao.vimp_us;
end;

end.

