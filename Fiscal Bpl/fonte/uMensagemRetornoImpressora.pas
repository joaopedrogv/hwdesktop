unit uMensagemRetornoImpressora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TfrmMensagemRetornoImpressora = class(TfrmPadrao)
    pnRetornoImp: TPanel;
    GroupBox3: TGroupBox;
    Memo2: TMemo;
    Panel14: TPanel;
    btOK: TBitBtn;
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagemRetornoImpressora: TfrmMensagemRetornoImpressora;

implementation

{$R *.dfm}

procedure TfrmMensagemRetornoImpressora.btOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

end.
