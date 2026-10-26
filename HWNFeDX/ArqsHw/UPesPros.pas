unit UPesPros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmPesqPros = class(Tform)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqPros: TFrmPesqPros;
  //  PesPros: TpendPrest;
  //  vDadoIni: TSingleton;
implementation


{$R *.dfm}

procedure TFrmPesqPros.BitBtn1Enter(Sender: TObject);
begin
  inherited;
  if (Trim(Edit1.Text) = '') then
  begin
    MessageDlg('Campo usuário em branco!', mtInformation, [mbOk], 0);
    Edit1.SetFocus;
  end
  else if (Trim(Edit2.Text) = '') then
  begin
    MessageDlg('Campo senha em branco!', mtInformation, [mbOk], 0);
    Edit2.SetFocus;
  end;
end;

procedure TFrmPesqPros.FormCreate(Sender: TObject);
begin
  inherited;
  //  PesPros := TPendPrest.create;
end;

end.

