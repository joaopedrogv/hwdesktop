unit UBaixaParcial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, uEditMoeda, EnterantHw;

type
  TFrmBaixaParcial = class(TfrmPadrao)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditMoeda1: TEditMoeda;
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBaixaParcial: TFrmBaixaParcial;

implementation

{$R *.dfm}

procedure TFrmBaixaParcial.BitBtn1Enter(Sender: TObject);
begin
  inherited;
  if EditMoeda1.Text='' then
    EditMoeda1.Valor:=0;
end;

procedure TFrmBaixaParcial.FormShow(Sender: TObject);
begin
  inherited;
  EditMoeda1.Valor:=0;
  if (Self.Enabled) and (Self.Visible) and (EditMoeda1.CanFocus) then
  	EditMoeda1.SetFocus;
end;

end.
