unit uCadVeiculoTransporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadVeicTransp = class(TfrmCadPadraoM)
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
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBComboBox3: TDBComboBox;
    DBRadioGroup3: TDBRadioGroup;
    CheckBox2: TCheckBox;
    procedure GroupBox4Enter(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DBEdit12KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit12Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVeicTransp: TfrmCadVeicTransp;

implementation

uses uDtmOrdemCarregamento, uDtmAtivo, uClassesOrdemCarregamento, DB, uDadosIni;

{$R *.dfm}

procedure TfrmCadVeicTransp.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('OCR020', 'CONSULTA', '', 'VEICULOS_TRANSPORTE', '',
    cadVeic.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not cadVeic.ConsultaCampos('VEICULOS_TRANSPORTE', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1, 'VEICULOS_TRANSPORTE.*, C.NOME_VENDEDOR',
      ' LEFT JOIN COLABORADOR C ON C.COD_VENDEDOR = VEICULOS_TRANSPORTE.COD_VENDEDOR AND' +
      ' C.COD_EMPRESA = VEICULOS_TRANSPORTE.COD_EMPRESA', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus
  end
  else
    if cadVeic.ConsultaCampos('VEICULOS_TRANSPORTE', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa, 'VEICULOS_TRANSPORTE.*, C.NOME_VENDEDOR',
      ' LEFT JOIN COLABORADOR C ON C.COD_VENDEDOR = VEICULOS_TRANSPORTE.COD_VENDEDOR AND' +
      ' C.COD_EMPRESA = VEICULOS_TRANSPORTE.COD_EMPRESA', '') then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;

	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadVeicTransp.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not cadVeic.Insert then
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

procedure TfrmCadVeicTransp.BitBtn4Click(Sender: TObject);
begin
  if not cadVeic.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(cadVeic.vNomeCampoErro);
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
      if cadVeic.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadVeicTransp.BitBtn5Click(Sender: TObject);
begin       
  cadVeic.Cancel;
  inherited;
end;

procedure TfrmCadVeicTransp.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if CheckBox2.Checked then
    _GravaConfiguracoesBoolean(CheckBox2.Name, CheckBox2.Checked);

  if CheckBox2.Checked then
    DBLookupComboBox1.ListField := 'RAZAO;CPFCGC'
  else
    DBLookupComboBox1.ListField := 'NOME_CLIENTE;CPFCGC';
end;

procedure TfrmCadVeicTransp.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  GroupBox5.Enabled := cadVeic.dataSet.FieldByName('TERCEIRO').AsString = 'S';  
end;

procedure TfrmCadVeicTransp.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  if not cadVeic._existeTerceiro(cadVeic.dataSet.FieldByName('COD_PROP_TERCEIRO').AsInteger) then
    Application.MessageBox('Terceiro não encontrado','Atenção', 64);
end;

procedure TfrmCadVeicTransp.DBEdit12KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if (Trim(vDadosIni.vPesquisa) <> '') and (cadVeic.dataSet.State in [dsEdit, dsInsert]) then
      cadVeic.dataSet.FieldByName('COD_PROP_TERCEIRO').AsInteger := StrToInt(Trim(vDadosIni.vPesquisa));
  end;
end;

procedure TfrmCadVeicTransp.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadVeicTransp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  cadVeic.Free;
  cadVeic := nil;

  Action := caFree;
  frmCadVeicTransp := nil;
end;

procedure TfrmCadVeicTransp.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  cadVeic := TVeiculoDeTransporte.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadVeicTransp.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (cadVeic.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadVeicTransp.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmOrdemCarregamento.dsVeicTr;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [OCR023]';
    DBComboBox2.Items.Text := vDadosIni.getListaUF;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(cadVeic._lixeiraVazia);
  end;

  CheckBox2.Checked := _LerConfiguracoesRegistroBoolean(CheckBox2.Name);

  if CheckBox2.Checked then
    DBLookupComboBox1.ListField := 'RAZAO;CPFCGC'
  else
    DBLookupComboBox1.ListField := 'NOME_CLIENTE;CPFCGC';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadVeicTransp.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  GroupBox5.Enabled := cadVeic.dataSet.FieldByName('TERCEIRO').AsString = 'S';
end;

procedure TfrmCadVeicTransp.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not cadVeic.Edit then
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

procedure TfrmCadVeicTransp.SpeedButton25Click(Sender: TObject);
begin
  if not cadVeic._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [OCR023]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [OCR024]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadVeicTransp.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    cadVeic.Delete;
    lixeiraVazia( cadVeic._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadVeicTransp.SpeedButton5Click(Sender: TObject);
begin
  if cadVeic._restaurarRegistroDaLixeira then
    lixeiraVazia(cadVeic._lixeiraVazia);
end;

end.
