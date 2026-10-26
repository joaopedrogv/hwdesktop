unit uDadosAvulso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmDadosAvulso = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    Edit7: TEdit;
    Edit11: TEdit;
    BitBtn3: TBitBtn;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit6Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosAvulso: TfrmDadosAvulso;

implementation

uses uPrincipalF;

{$R *.dfm}

procedure TfrmDadosAvulso.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

procedure TfrmDadosAvulso.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmDadosAvulso.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Edit1.Text := 'CONSUMIDOR';
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
end;

procedure TfrmDadosAvulso.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmDadosAvulso.Edit6Exit(Sender: TObject);
begin
  inherited;
  if Length(Trim(Edit6.Text)) = 11 then
  begin
    if not obCliente.Cpf(Trim(edit6.text)) then
    begin
      Application.MessageBox('Cpf inválido','Antenção',MB_ICONINFORMATION +MB_OK);
      edit6.SetFocus;
    end;
  end
  else if Length(Trim(Edit6.Text)) = 14 then
  begin
    if not obCliente.cgc(Trim(edit6.text)) then
    begin
      Application.MessageBox('CNPJ inválido','Antenção',MB_ICONINFORMATION +MB_OK);
      Edit6.SetFocus;
    end;
  end
  else
  begin
    if Application.MessageBox('Cpf ou CNPJ não informado corretamente. Deseja continuar','Antenção',MB_ICONQUESTION +MB_YESNO) = idyes then
    begin
      Edit6.Text :='';
      exit;
    end
    else
      Edit6.SetFocus;
  end;
end;

procedure TfrmDadosAvulso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_F3)   then
    ModalResult := IDOK
  else if key = VK_ESCAPE then
    ModalResult := IDCANCEL;  
end;

procedure TfrmDadosAvulso.FormShow(Sender: TObject);
begin
  inherited;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  if Tag = 1 then
  begin
    TabSheet1.Show;
    Edit1.SetFocus;
  end
  else
  begin


  end;
end;

end.

