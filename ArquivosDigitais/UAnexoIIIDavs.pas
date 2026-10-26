unit UAnexoIIIDavs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, ExtCtrls;

type
  TFrmAnexoIII = class(TfrmPadrao)
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    var
      hrAnexoV: THandle;
  public
    { Public declarations }
  end;

var
  FrmAnexoIII: TFrmAnexoIII;

implementation

uses
  funcoes, UDtmArqsDig, UClasseAdig, uDtmAtivo;

{$R *.dfm}

procedure TFrmAnexoIII.BitBtn1Click(Sender: TObject);
var
 ArqAnexoIII: TRelProdAnexoIII;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ProgressBar1.Visible := True;
    ArqAnexoIII:=TRelProdAnexoIII.create;
    if ArqAnexoIII.MontarArquivoIII(MaskEdit1.text,MaskEdit2.text,
      vdadosini.vPathArquivosDigitais+'\',ProgressBar1) then
      Close;
  finally
    ProgressBar1.Visible := False;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmAnexoIII.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmAnexoIII.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  UnloadPackage(hrAnexoV);
end;

procedure TFrmAnexoIII.FormCreate(Sender: TObject);
begin
  inherited;
  CarregaPacote('pkativos',hrAnexoV);
  if DtmArqsDig = nil then
  begin
   DtmArqsDig := TDtmArqsDig.Create(Self);
   DtmArqsDig.criaDtm;
  end;
end;

procedure TFrmAnexoIII.FormShow(Sender: TObject);
begin
  inherited;
  //MaskEdit3.Text:=vdadosini.vPathArquivosDigitais+'\';//ExtractFilePath(Application.Exename);
end;

initialization
  RegisterClass(TFrmAnexoIII);
finalization
  UnRegisterClass(TFrmAnexoIII);

end.
