unit uCadSpedAcaoJudicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadSpedAcaoJudicial = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    DBComboBox1: TDBComboBox;
    GroupBox5: TGroupBox;
    DBEdit6: TDBEdit;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSpedAcaoJudicial: TfrmCadSpedAcaoJudicial;

implementation

uses uClassesSped, uDtmSPED, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadSpedAcaoJudicial.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('SPED011', 'CONSULTA', '', 'SPED_PROC_REF_ACAO_JUDICIAL', '', acaoJudic.buscas, False) then
      Exit;

    inherited;
    
    if MaskEdit2.Visible then
    begin
      if not acaoJudic.ConsultaCampos('SPED_PROC_REF_ACAO_JUDICIAL', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if acaoJudic.ConsultaCampos('SPED_PROC_REF_ACAO_JUDICIAL', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedAcaoJudicial.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not acaoJudic.Insert then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedAcaoJudicial.BitBtn4Click(Sender: TObject);
begin
  if not acaoJudic.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(acaoJudic.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if acaoJudic.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadSpedAcaoJudicial.BitBtn5Click(Sender: TObject);
begin
  acaoJudic.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadSpedAcaoJudicial.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox1.DataSource.DataSet.State in [dsEdit, dsInsert] then
    DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString := DBComboBox1.Items[DBComboBox1.ItemIndex];
end;

procedure TfrmCadSpedAcaoJudicial.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
    BitBtn3Click(Sender);
end;

procedure TfrmCadSpedAcaoJudicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  acaoJudic.Free;
  acaoJudic := nil;

  Action := caFree;
  frmCadSpedAcaoJudicial := nil;
end;

procedure TfrmCadSpedAcaoJudicial.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  acaoJudic := TAcaoJudicialSPED.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadSpedAcaoJudicial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (acaoJudic.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadSpedAcaoJudicial.FormShow(Sender: TObject);
begin

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmSPED.dsAcaoJud;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadSpedAcaoJudicial.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not acaoJudic.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedAcaoJudicial.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    acaoJudic.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
