unit UPesPros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFrmPesqPros = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    procedure BitBtn3Click(Sender: TObject);
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

uses uDadosIni, uDtmAtivo;

{$R *.dfm}

procedure TFrmPesqPros.BitBtn1Enter(Sender: TObject);
begin
  inherited;
  if (Trim(MaskEdit1.Text) = '') then
  begin
    MessageDlg('Campo usuário em branco!', mtInformation, [mbOk], 0);
    MaskEdit1.SetFocus;
  end
  else if (Trim(MaskEdit2.Text) = '') then
  begin
    MessageDlg('Campo senha em branco!', mtInformation, [mbOk], 0);
    MaskEdit2.SetFocus;
  end;
end;

procedure TFrmPesqPros.BitBtn3Click(Sender: TObject);
var
 vUsuario, vSenha: string;
begin
  inherited;
  if not vDadosIni.verificarLiberacaoPesqPros(FrmPesqPros.Tag, dtmAtivo.IbBuscas, vUsuario, vSenha) then
     Application.MessageBox('Liberação de acesso pendente!', 'Atenção', MB_ICONERROR + MB_OK)
  else
  begin
     Application.MessageBox('Acesso liberado!', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
     MaskEdit1.Text := vUsuario;
     MaskEdit2.Text := vSenha;
     ModalResult := mrOk;
  end;
end;

procedure TFrmPesqPros.FormCreate(Sender: TObject);
begin
  inherited;
  //  PesPros := TPendPrest.create;
end;

end.

