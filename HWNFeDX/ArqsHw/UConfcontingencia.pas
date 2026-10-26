unit UConfcontingencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,UClasseNFe;

type
  TFrmConfContingencia = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    BitBtn3: TBitBtn;
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cadempresa: TClssEmpresa;
  end;

var
  FrmConfContingencia: TFrmConfContingencia;

implementation

uses uDataSet_OOP_DX, DB, UFuncoesDll;

{$R *.dfm}

procedure TFrmConfContingencia.BitBtn1Click(Sender: TObject);
begin
  if cadempresa.Gravacontingencia(edit1.text,combobox1.Text) then
    Application.MessageBox('Alteração realizada com sucesso', 'Atenção', MB_ICONWARNING + MB_OK);
end;

procedure TFrmConfContingencia.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TFrmConfContingencia.BitBtn3Click(Sender: TObject);
begin
// VerificarSCAN;
 VerificarSVC(cadempresa.vWEBSERV_UF);
end;

procedure TFrmConfContingencia.ComboBox1Exit(Sender: TObject);
begin
 if pos(ComboBox1.Text,'NORMAL') > 0  then
 else
  if pos(ComboBox1.Text,'SVC') > 0 then
  else
   if pos(ComboBox1.Text,'DPEC') > 0 then
   else
    if pos(ComboBox1.Text,'CONTINGENCIA') > 0 then
    else
    begin
      Application.MessageBox('Tipo de emissão inválida', 'Atenção', MB_ICONWARNING + MB_OK);
      combobox1.setfocus;
      exit;
    end;
 if ComboBox1.Text = 'NORMAL' then
   panel2.Enabled:=false
 else
 begin
   Panel2.Enabled:=true;
   if Trim(Edit1.Text) = '' then
     if Edit1.CanFocus then
       Edit1.setfocus;
 end;
end;

procedure TFrmConfContingencia.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFrmConfContingencia.Edit1Exit(Sender: TObject);
begin
 if ActiveControl <> BitBtn2 then
 begin
  if edit1.text = '' then
  begin
   Application.MessageBox('Justificativa Precisa ser preenchida', 'Atenção', MB_ICONWARNING + MB_OK);
   Edit1.setfocus;
  end;
 end;
end;

procedure TFrmConfContingencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// cadempresa.free;
end;

procedure TFrmConfContingencia.FormShow(Sender: TObject);
var
  I: Integer;
begin
  ComboBox1.ItemIndex := -1;
  for I := 0 to ComboBox1.Items.Count - 1 do
    if Trim(ComboBox1.Items[I]) = Trim(cadempresa.dataSet.FieldByName('NFE_DANFE_FOREMISS').asstring) then
      ComboBox1.ItemIndex := I;
//  ComboBox1.text:=cadempresa.dataSet.FieldByName('NFE_DANFE_FOREMISS').asstring;
  edit1.Text:=cadempresa.dataSet.FieldByName('NFE_XJUST').asstring;
end;

end.

