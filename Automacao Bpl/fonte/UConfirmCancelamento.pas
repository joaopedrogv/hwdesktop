unit UConfirmCancelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmConfirmCancelamento = class(TForm)
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfirmCancelamento: TFrmConfirmCancelamento;

implementation

{$R *.dfm}

procedure TFrmConfirmCancelamento.BitBtn3Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmConfirmCancelamento.BitBtn4Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmConfirmCancelamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_ESCAPE) then
   BitBtn4Click(Sender);
end;

end.
