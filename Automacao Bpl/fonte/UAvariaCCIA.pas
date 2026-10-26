unit UAvariaCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UClassesVeiculosCCIA, Grids, DBGrids,
  ComCtrls, Menus, DB;

type
  TfrmAvariaCCIA = class(TForm)
    ComboBox1: TComboBox;
    Panel34: TPanel;
    BitBtn35: TBitBtn;
    BitBtn19: TBitBtn;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvariaCCIA: TfrmAvariaCCIA;

implementation

uses
  Registry, uDtmAtivo, DBClient, Clipbrd;
  
{$R *.dfm}

procedure TfrmAvariaCCIA.BitBtn19Click(Sender: TObject);
begin
 if (Copy(trim(ComboBox1.Text), 1, 1) <> 'N') and (Copy(trim(ComboBox1.Text), 1, 1) <> 'S') then
 begin
   Application.MessageBox('Campo informado incorretamente, favor informar "S" para SIM ou "N" para Não.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
   if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
     ComboBox1.SetFocus;
   exit;
 end; 
 ModalResult := mrOk;
end;

procedure TfrmAvariaCCIA.BitBtn35Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TfrmAvariaCCIA.FormShow(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
    ComboBox1.SetFocus;
end;

end.
