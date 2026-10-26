unit uParcela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, StdCtrls, uEditMoeda, Mask, ExtCtrls;

type
  TfrmParcela = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    edCrDoc: TEdit;
    Label20: TLabel;
    edCrVenc: TMaskEdit;
    Label21: TLabel;
    mValorParcelaCr: TEditMoeda;
    Label22: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParcela: TfrmParcela;

implementation

{$R *.dfm}

procedure TfrmParcela.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn2.CanFocus) then
    BitBtn2.SetFocus;
  if edCrDoc.Text = '' then
  begin
    MessageDlg('Numero do documento não preenchido', mtInformation, [mbOK], 0);
    exit;
  end;
  try
    StrToDate(edCrVenc.Text);
  except
    on e: exception do
      MessageDlg(e.Message, mtInformation, [mbOK], 0);
  end;
  if mValorParcelaCr.Valor <= 0 then
  begin
    MessageDlg('Valor da parcela não informado', mtInformation, [mbOK], 0);
    exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmParcela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    BitBtn1.Click;
  end
  else if (Key = VK_ESCAPE) then
  begin
    if ActiveControl <> edCrVenc then    
      BitBtn2.Click;
  end;
end;

end.

