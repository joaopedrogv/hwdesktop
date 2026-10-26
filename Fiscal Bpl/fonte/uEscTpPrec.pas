unit uEscTpPrec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TfrmEscPolPreco = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscPolPreco: TfrmEscPolPreco;

implementation

uses
  uPrincipalF;

{$R *.dfm}

procedure TfrmEscPolPreco.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmEscPolPreco.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

end.
