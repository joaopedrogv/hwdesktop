unit UAnexoV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, Mask, Menus, ExtCtrls;

type
  TFrmAnexoV = class(TfrmPadrao)
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    hrpesquisa: THandle;
  end;

var
  FrmAnexoV: TFrmAnexoV;

implementation

uses UClasseAdig, UdtmArqsDig, funcoes, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TFrmAnexoV.BitBtn1Click(Sender: TObject);
var
  ArqAnexoV: TRelProdAnexoV;
begin
  inherited;
  ArqAnexoV := TRelProdAnexoV.create;
  if ArqAnexoV.MontarArquivo(vdadosini.vPathArquivosDigitais + '\', ProgressBar1) then
    Close;
end;

procedure TFrmAnexoV.BitBtn3Click(Sender: TObject);
var
  ArqAnexoV: TRelProdAnexoV;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ProgressBar1.Visible := True;
    ArqAnexoV := TRelProdAnexoV.create;
    if ArqAnexoV.MontarArquivo(vdadosini.vPathArquivosDigitais + '\', ProgressBar1) then
      Close;
  finally
    ProgressBar1.Visible := False;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmAnexoV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmAnexoV := nil;
end;

initialization
  RegisterClass(TFrmAnexoV);
finalization
  UnRegisterClass(TFrmAnexoV);
end.

