unit uAlteraPrecoDescricao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Mask, StdCtrls, Buttons, ExtCtrls, uEditMoeda;

type
  TfrmAltPreco = class(TfrmPadrao)
    EditMoeda1: TEditMoeda;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAltPreco: TfrmAltPreco;

implementation

{$R *.dfm}

procedure TfrmAltPreco.BitBtn1Click(Sender: TObject);
begin
  inherited;
ModalResult := IDOK;
end;

procedure TfrmAltPreco.BitBtn2Click(Sender: TObject);
begin
  inherited;
ModalResult :=IDCANCEL;
end;

procedure TfrmAltPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    ModalResult := idok
  else if key = VK_ESCAPE then
       ModalResult := IDCANCEL;
end;

end.
