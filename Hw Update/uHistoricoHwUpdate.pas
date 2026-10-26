unit uHistoricoHwUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmHistoricoHwUpdate = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Panel4: TPanel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    ListBox1: TListBox;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure _filtrar;
  public
    { Public declarations }
  end;

var
  frmHistoricoHwUpdate: TfrmHistoricoHwUpdate;

implementation

uses uClassesHwUpdate;

{$R *.dfm}

procedure TfrmHistoricoHwUpdate.BitBtn1Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex > -1 then
    if vAtHw.vUltVer._getVersao(ComboBox1.Text, False) then
      ListBox1.Items := vAtHw.vUltVer.LOG_ATUALIZACAO;
end;

procedure TfrmHistoricoHwUpdate.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmHistoricoHwUpdate.BitBtn3Click(Sender: TObject);
begin
  _filtrar;
end;

procedure TfrmHistoricoHwUpdate.FormShow(Sender: TObject);
begin
  ComboBox1.Clear;
  ComboBox1.Items.Text := vAtHw.vUltVer._getTodasVersoes;
  Edit1.Text := vDadosIni.vMeuSerialHD;
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  if ComboBox1.Items.Count > 0 then
    ComboBox1.ItemIndex := 0;
end;

procedure TfrmHistoricoHwUpdate._filtrar;
var
  I: Integer;
  vAdd: Boolean;
begin
  ListBox1.Items.Clear;
  for I := 0 to vAtHw.vUltVer.LOG_ATUALIZACAO.Count - 1 do
  begin
    vAdd := True;

    if (RadioGroup1.ItemIndex = 1) and (Pos('[ERRO]', vAtHw.vUltVer.LOG_ATUALIZACAO[I]) = 0) then
      vAdd := False
    else if (RadioGroup1.ItemIndex = 2) and (Pos('[ERRO]', vAtHw.vUltVer.LOG_ATUALIZACAO[I]) > 0) then
      vAdd := False;
    if (Trim(Edit1.Text) <> '') then
    begin
      if (not CheckBox1.Checked) then
        if (Pos('[SH:' + Edit1.Text, vAtHw.vUltVer.LOG_ATUALIZACAO[I]) = 0) then
          vAdd := False;
      if (CheckBox1.Checked) then
        if (Pos('[SH:' + Edit1.Text, vAtHw.vUltVer.LOG_ATUALIZACAO[I]) > 0) then
          vAdd := False;
    end;
    if (Trim(Edit2.Text) <> '') then
    begin
      if (not CheckBox2.Checked) then
        if (Pos('[IP:' + Edit2.Text, vAtHw.vUltVer.LOG_ATUALIZACAO[I]) = 0) then
          vAdd := False;
      if (CheckBox2.Checked) then
        if (Pos('[IP:' + Edit2.Text, vAtHw.vUltVer.LOG_ATUALIZACAO[I]) > 0) then
          vAdd := False;
    end;
    if (Trim(Edit3.Text) <> '') then
    begin
      if (not CheckBox3.Checked) then
        if (Pos('[PC:' + Edit3.Text, vAtHw.vUltVer.LOG_ATUALIZACAO[I]) = 0) then
          vAdd := False;
      if (CheckBox3.Checked) then
        if (Pos('[PC:' + Edit3.Text, vAtHw.vUltVer.LOG_ATUALIZACAO[I]) > 0) then
          vAdd := False;
    end;
    if (Trim(Edit4.Text) <> '') then
    begin
      if (not CheckBox4.Checked) then
        if (Pos('[MT:' + Edit4.Text, vAtHw.vUltVer.LOG_ATUALIZACAO[I]) = 0) then
          vAdd := False;
      if (CheckBox4.Checked) then
        if (Pos('[MT:' + Edit4.Text, vAtHw.vUltVer.LOG_ATUALIZACAO[I]) > 0) then
          vAdd := False;
    end;

    if vAdd then
      ListBox1.Items.Add(vAtHw.vUltVer.LOG_ATUALIZACAO[I]);
  end;
end;

end.
