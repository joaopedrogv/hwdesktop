unit uValorRecibo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, uEditMoeda, Buttons, ExtCtrls;

type
  TfrmValorRecibo = class(TfrmPadrao)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edValor: TEditMoeda;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValorRecibo: TfrmValorRecibo;

implementation

uses uDtmFormPag, uClasseFP, uFormPag2;

{$R *.dfm}

procedure TfrmValorRecibo.BitBtn1Click(Sender: TObject);
var
  vrTemp: currency;
begin
  inherited;
  vrTemp := edValor.Valor;
  {if obformpag <> nil then
  begin
    if vrtemp <= 0 then
    begin
      MessageDlg('Valor não pode ser zero', mtInformation, [mbOK], 0);
      if (Self.Enabled) and (Self.Visible) and (edValor.CanFocus) then
      	edValor.SetFocus;
      exit;
    end
    else if vrTemp > obFormPag.vRecibo.getValorRecibo then
    begin
      MessageDlg('Valor maior que o valor do Recibo', mtInformation, [mbOK], 0);
      if (Self.Enabled) and (Self.Visible) and (edValor.CanFocus) then
      	edValor.SetFocus;
      exit;
    end
    else if vrTemp > obFormPag.vRecibo.getValorPendenteRecibo then
    begin
//      MessageDlg('Valor maior que o valor do Pendente: ' + Format('m%',
//        [obFormPag.vRecibo.getValorPendenteRecibo]), mtInformation, [mbOK], 0);
//			if (Self.Enabled) and (Self.Visible) and (edValor.CanFocus) then
//        edValor.SetFocus;
//      exit;
    end;
  end
  else} if obformpag2 <> nil then
  begin
    if vrtemp <= 0 then
    begin
      MessageDlg('Valor não pode ser zero', mtInformation, [mbOK], 0);
      if (Self.Enabled) and (Self.Visible) and (edValor.CanFocus) then
      	edValor.SetFocus;
      exit;
    end
    else if vrTemp > obFormPag2.vRecibo.getValorRecibo then
    begin
      MessageDlg('Valor maior que o valor do Recibo', mtInformation, [mbOK], 0);
      if (Self.Enabled) and (Self.Visible) and (edValor.CanFocus) then
      	edValor.SetFocus;
      exit;
    end
    else if vrTemp > obFormPag2.vRecibo.getValorPendenteRecibo then
    begin
//      MessageDlg('Valor maior que o valor do Pendente: ' + Format('m%',
//        [obFormPag2.vRecibo.getValorPendenteRecibo]), mtInformation, [mbOK], 0);
//			if (Self.Enabled) and (Self.Visible) and (edValor.CanFocus) then
//      	edValor.SetFocus;
//      exit;
    end;
  end;
  ModalResult := mrOK;
end;

end.

