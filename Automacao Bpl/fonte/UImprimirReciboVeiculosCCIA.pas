unit UImprimirReciboVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TfrmImprimirReciboVeiculosCCIA = class(TfrmPadrao)
    Panel1: TPanel;
    GroupBox16: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox7: TCheckBox;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimirReciboVeiculosCCIA: TfrmImprimirReciboVeiculosCCIA;

implementation

{$R *.dfm}

procedure TfrmImprimirReciboVeiculosCCIA.BitBtn4Click(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TfrmImprimirReciboVeiculosCCIA.BitBtn5Click(Sender: TObject);
begin
  inherited;
Close;
end;

end.
