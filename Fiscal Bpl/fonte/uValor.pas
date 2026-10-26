unit uValor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, uEditMoeda;

type
  TfrmValor = class(TfrmPadrao)
    EditMoeda1: TEditMoeda;
    Label1: TLabel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmValor: TfrmValor;

implementation

{$R *.dfm}

procedure TfrmValor.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
  close;
end;

procedure TfrmValor.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  close;
end;

procedure TfrmValor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) or (key = VK_F3) then
    ModalResult := mrOk
  else  if (key = VK_ESCAPE) then
    ModalResult := mrCancel
  else
    Exit;
  close;
end;

end.
