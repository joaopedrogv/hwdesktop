unit uConfigHwUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TfrmConfigAtualizador = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btCancelar: TBitBtn;
    btSalvar: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    RadioGroup1: TRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigAtualizador: TfrmConfigAtualizador;

implementation

uses uClassesHwUpdate, FileCtrl ;

{$R *.dfm}

procedure TfrmConfigAtualizador.btCancelarClick(Sender: TObject);
begin
  ModalResult := IDCANCEL;
end;

procedure TfrmConfigAtualizador.btSalvarClick(Sender: TObject);
begin

  if Trim(ComboBox1.Text) = '' then
  begin
    Application.MessageBox('CNPJ deve ser informado','Atenção', 0 + 64);
    ComboBox1.SetFocus;
    Exit;
  end;

  if (Trim(Edit1.Text) = '') and (not CheckBox2.Checked) then
  begin
    Application.MessageBox('Diretório padrão deve ser informado','Atenção', 0 + 64);
    Edit1.SetFocus;
    Exit;
  end;

  if (not CheckBox2.Checked) then
    if not DirectoryExists(Trim(Edit1.Text)) then
    begin
      Application.MessageBox('Diretório padrão não existe','Atenção', 0 + 64);
      Edit1.SetFocus;
      Exit;
    end;

  if CheckBox1.Checked then
    vAtHw.vConfig.HD_PC := vAtHw.vConfig.MeuHD
  else
    vAtHw.vConfig.HD_PC := '';

  if RadioGroup1.ItemIndex = 0 then
    vAtHw.vConfig.HD_PC_INST := 'DEIXAR'
  else if RadioGroup1.ItemIndex = 1 then
    vAtHw.vConfig.HD_PC_INST := vAtHw.vConfig.MeuHD
  else
    vAtHw.vConfig.HD_PC_INST := '';
  vAtHw.vConfig.PATHARQUIVOS := Edit1.Text;
  vAtHw.vConfig.CNPJ := ComboBox1.Text;
  vAtHw.vConfig.PATHARQUIVOS := Edit1.Text;
  vAtHw.vConfig.PATHS_AD_SISTEMA.Text := ListBox1.Items.Text;
  vAtHw.vConfig.PATHS_AD_REL_RET.Text := ListBox2.Items.Text;
  
  if CheckBox3.Checked then
    vAtHw.vConfig.HOMOLOGACAO := 'H'
  else
    vAtHw.vConfig.HOMOLOGACAO := 'P';

  if CheckBox2.Checked then
    vAtHw.vConfig.STAND_ALONE := 'S'
  else
    vAtHw.vConfig.STAND_ALONE := 'N';

  if vAtHw.vConfig._setConfigCadastro then
    ModalResult := IDOK;

end;

procedure TfrmConfigAtualizador.CheckBox2Click(Sender: TObject);
begin
  Edit1.Enabled := not CheckBox2.Checked;
  SpeedButton1.Enabled := not CheckBox2.Checked;  
end;

procedure TfrmConfigAtualizador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vAtHw.EmExecucao := False;
end;

procedure TfrmConfigAtualizador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Classes.ssCtrl in Shift then
    if Key = VK_F2 then
      CheckBox3.Checked := not CheckBox3.Checked;
end;

procedure TfrmConfigAtualizador.FormShow(Sender: TObject);
var
  I: Integer;
begin
  ComboBox1.Items.Text := vAtHw.vConfig.CNPJClientes.Text;
  for I := 0 to ComboBox1.Items.Count - 1 do
    if ComboBox1.Items[i] = vAtHw.vConfig.CNPJ then
    begin
      ComboBox1.ItemIndex := i;
      Break
    end;
  Edit1.Text := vAtHw.vConfig.PATHARQUIVOS;
  ListBox1.Items := vAtHw.vConfig.PATHS_AD_SISTEMA;
  ListBox2.Items := vAtHw.vConfig.PATHS_AD_REL_RET;
  if ListBox1.Items.Count > 0 then
    ListBox1.Selected[0] := True;

  CheckBox2.Checked := vAtHw.vConfig.STAND_ALONE = 'S';
  if CheckBox2.Checked then
    Edit1.Text := '';

  Edit1.Enabled := not CheckBox2.Checked;
  SpeedButton1.Enabled := not CheckBox2.Checked;

  if Trim(vAtHw.vConfig.HD_PC) = '' then
  begin
    Label7.Visible := False;
    CheckBox1.Visible := False;
  end
  else if (Trim(vAtHw.vConfig.HD_PC) = Trim(vAtHw.vConfig.MeuHD)) then
  begin
    Label7.Caption := 'Este computador esta responsavel por verificar novas versões do sistema';
    Label7.Font.Color := clBlue;
    Label7.Visible := True;
    CheckBox1.Visible := False;
  end
  else
  begin
    Label7.Caption := 'Outro computador está selecionado para verificar novas versões';
    Label7.Font.Color := clRed;
    Label7.Visible := True;
    CheckBox1.Visible := True;
  end;

  if (Trim(vAtHw.vConfig.HD_PC_INST) = Trim(vAtHw.vConfig.MeuHD)) and (Trim(vAtHw.vConfig.HD_PC_INST) <> '') then
    RadioGroup1.Caption := 'Responsável pela instalação do sistema - Este computador esta responsavel por instalar novas versões do sistema'
  else if Trim(vAtHw.vConfig.HD_PC_INST) = '' then
    RadioGroup1.Caption := 'Responsável pela instalação do sistema - Qualquer computador esta responsavel por instalar novas versões do sistema'
  else
    RadioGroup1.Caption := 'Responsável pela instalação do sistema - Outro computador esta responsavel por instalar novas versões do sistema';
end;

procedure TfrmConfigAtualizador.SpeedButton1Click(Sender: TObject);
var
  vTemp: string;
begin
  if SelectDirectory('Selecionar Diretório', '', vTemp, [sdNewFolder, sdNewUI, sdValidateDir]) then
    Edit1.Text := vTemp;
end;

procedure TfrmConfigAtualizador.SpeedButton2Click(Sender: TObject);
var
  vTemp: string;
begin
  if SelectDirectory('Selecionar Diretório', '', vTemp, [sdNewFolder, sdNewUI, sdValidateDir]) then
    ListBox1.Items.Add(vTemp);
end;

procedure TfrmConfigAtualizador.SpeedButton3Click(Sender: TObject);
var
  vTemp: string;
begin
  if SelectDirectory('Selecionar Diretório', '', vTemp, [sdNewFolder, sdNewUI, sdValidateDir]) then
    ListBox2.Items.Add(vTemp);
end;

procedure TfrmConfigAtualizador.SpeedButton5Click(Sender: TObject);
begin
  if ListBox1.Items.Count = 0 then
    Exit;
  ListBox1.DeleteSelected;
  if ListBox1.Items.Count > 0 then
    ListBox1.Selected[0] := True;
end;

procedure TfrmConfigAtualizador.SpeedButton6Click(Sender: TObject);
begin
  if ListBox2.Items.Count = 0 then
    Exit;
  ListBox2.DeleteSelected;
  if ListBox2.Items.Count > 0 then
    ListBox2.Selected[0] := True;
end;

end.
