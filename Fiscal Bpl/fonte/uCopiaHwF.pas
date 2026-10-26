unit uCopiaHwF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmCopiaDadosServidor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    Memo1: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCopiaDadosServidor: TfrmCopiaDadosServidor;

implementation

uses uCadastrosF;

{$R *.dfm}

procedure TfrmCopiaDadosServidor.BitBtn1Click(Sender: TObject);
begin
  if not BitBtn1.Enabled then
    Exit;
  try
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;

    vConfImp.CopyFileWithProgressBar(vConfImp.ArquivoServidor, vConfImp.ArquivoLocal, ProgressBar1);

    ModalResult := IDOK;

  finally
    BitBtn1.Enabled := True;
    BitBtn2.Enabled := True;
  end;
end;

procedure TfrmCopiaDadosServidor.BitBtn2Click(Sender: TObject);
begin
  ModalResult := IDCANCEL;
end;

procedure TfrmCopiaDadosServidor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCopiaDadosServidor := nil;
end;

procedure TfrmCopiaDadosServidor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BitBtn2.Click
  else if Key = VK_F4 then
    if Classes.ssAlt in Shift then
      Key := 0;
end;

procedure TfrmCopiaDadosServidor.FormShow(Sender: TObject);
begin
  KeyPreview := True;  
end;

end.
