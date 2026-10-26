unit UAnexoIVEst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, Grids, DBGrids, 
  UClasseAdig;

type
  TFrmAnexoIVEst = class(TfrmPadrao)
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ProgressBar1: TProgressBar;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    ListBox1: TListBox;
    ListBox2: TListBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    ArqAnexoIV: TRelProdAnexoIV;
  end;

var
  FrmAnexoIVEst: TFrmAnexoIVEst;

implementation

uses
  funcoes, UDtmArqsDig, uDtmAtivo;

{$R *.dfm}

procedure TFrmAnexoIVEst.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ProgressBar1.Visible := True;
    if RadioButton1.Checked then
    begin
      if ArqAnexoIV.MontarArquivo(vdadosini.vPathArquivosDigitais + '\', 'T', ProgressBar1) then
        Close;
    end
    else
    begin
      ArqAnexoIV.vListaCodigo.Clear;
      ArqAnexoIV.vListaDescricao.Clear;
      for I := 0 to ListBox1.Count - 1 do
        ArqAnexoIV.vListaCodigo.Add(ListBox1.Items[i]);
      for I := 0 to ListBox2.Count - 1 do
        ArqAnexoIV.vListaDescricao.Add(ListBox2.Items[i]);
      if ArqAnexoIV.MontarArquivo(vdadosini.vPathArquivosDigitais + '\', 'P', ProgressBar1) then
        Close;
    end;
  finally
    ProgressBar1.Visible := False;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmAnexoIVEst.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if Trim(Edit1.Text) <> '' then
    ListBox1.Items.Add(Trim(Edit1.Text));
end;

procedure TFrmAnexoIVEst.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if Trim(Edit2.Text) <> '' then
    ListBox2.Items.Add(Trim(Edit2.Text));
end;

procedure TFrmAnexoIVEst.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ListBox1.Clear;
end;

procedure TFrmAnexoIVEst.BitBtn6Click(Sender: TObject);
begin
  inherited;
  ListBox2.Clear;
end;

procedure TFrmAnexoIVEst.Edit1Change(Sender: TObject);
begin
  inherited;
  if Trim(Edit1.Text) <> '' then
    Edit2.Clear;
end;

procedure TFrmAnexoIVEst.Edit1Exit(Sender: TObject);
begin
  inherited;
  if Trim(Edit1.Text) <> '' then
    ArqAnexoIV.Abreprodutos(Trim(Edit1.Text),'C');
end;

procedure TFrmAnexoIVEst.Edit2Change(Sender: TObject);
begin
  inherited;
  if Trim(Edit2.Text) <> '' then
    Edit1.Clear;
end;

procedure TFrmAnexoIVEst.Edit2Exit(Sender: TObject);
begin
  inherited;
  if Trim(Edit2.Text) <> '' then
    ArqAnexoIV.Abreprodutos(Trim(Edit2.Text),'D');
end;

procedure TFrmAnexoIVEst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ArqAnexoIV.free;
  Action := caFree;
  FrmAnexoIVEst := nil;
end;

procedure TFrmAnexoIVEst.FormShow(Sender: TObject);
begin
  inherited;
  Panel1.Height := 85;
  Panel3.Visible := False;
  ArqAnexoIV := TRelProdAnexoIV.create;
end;

procedure TFrmAnexoIVEst.RadioButton2Click(Sender: TObject);
begin
  inherited;
  if RadioButton1.Checked then
  begin
    Panel1.Height := 85;
    Panel3.Visible := False;
  end
  else
  begin
    Panel1.Height := 300;
    Panel3.Visible := True;
  end;
end;

initialization
  RegisterClass(TFrmAnexoIVEst);
finalization
  UnRegisterClass(TFrmAnexoIVEst);

end.

