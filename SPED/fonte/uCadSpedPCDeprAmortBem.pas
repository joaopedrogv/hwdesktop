unit uCadSpedPCDeprAmortBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, DB;

type
  TfrmCadSpedPCDeprecAmortBem = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox7: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBComboBox2: TDBComboBox;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    GroupBox9: TGroupBox;
    DBComboBox3: TDBComboBox;
    GroupBox10: TGroupBox;
    DBEdit14: TDBEdit;
    edNomeConta: TEdit;
    GroupBox11: TGroupBox;
    DBEdit16: TDBEdit;
    edNomeCusto: TEdit;
    GroupBox12: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox13: TGroupBox;
    Panel5: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Edit1: TEdit;
    ComboBox4: TComboBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel4: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    DBGrid2: TDBGrid;
    DBRadioGroup2: TDBRadioGroup;
    DataSource1: TDataSource;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBEdit2: TDBEdit;
    Label20: TLabel;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSpedPCDeprecAmortBem: TfrmCadSpedPCDeprecAmortBem;

implementation

uses
  uDtmAtivo, uClassesSpedPCBlocoF, uDtmSPED;

{$R *.dfm}

procedure TfrmCadSpedPCDeprecAmortBem.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  try
  SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED034]';
  
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('SPED031', 'CONSULTA', '', 'SPED_DEPREC_AMORT_BENS', '', credDeprec.buscas, False) then
      Exit;

    inherited;
    
    if MaskEdit2.Visible then
    begin
      if not credDeprec.ConsultaCampos('SPED_DEPREC_AMORT_BENS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if credDeprec.ConsultaCampos('SPED_DEPREC_AMORT_BENS', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    for I := 0 to DBGrid1.Columns.Count - 1 do
    begin
      if DBGrid1.Columns[i].FieldName = 'DESC_BEM_IMOB' THEN
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
      else if DBGrid1.Columns[i].FieldName = 'PROCESSOS_REF' THEN
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
    end;

    lixeiraVazia(not credDeprec._statuslixeira);
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCDeprecAmortBem.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not credDeprec.Insert then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
      DBComboBox3.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCDeprecAmortBem.BitBtn4Click(Sender: TObject);
begin
  if not credDeprec.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(credDeprec.vNomeCampoErro);
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
      if credDeprec.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
        	DBComboBox3.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadSpedPCDeprecAmortBem.BitBtn5Click(Sender: TObject);
begin
  credDeprec.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadSpedPCDeprecAmortBem.BitBtn7Click(Sender: TObject);
begin
  inherited;
  credDeprec.vProcRef.ind_proc := Trim(ComboBox4.Text);
  if credDeprec._salvarProcessoRef then
    BitBtn8.Click
  else if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
    ComboBox4.SetFocus;
end;

procedure TfrmCadSpedPCDeprecAmortBem.BitBtn8Click(Sender: TObject);
begin
  inherited;
  Panel4.Visible := True;
  if DBGrid2.DataSource <> nil then
    DBGrid2.DataSource.DataSet.Cancel;
  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
  	DBGrid2.SetFocus;
  Panel5.Visible := False;
end;

procedure TfrmCadSpedPCDeprecAmortBem.ComboBox4Exit(Sender: TObject);
begin
  inherited;
  ComboBox4.Text := ComboBox4.Items[ComboBox4.ItemIndex];
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox1.ItemIndex <= -1 then
  begin
    credDeprec._calcularPISCOFINS;
    Exit;
  end;
  if DBComboBox1.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString :=
      Trim(DBComboBox1.Items[DBComboBox1.ItemIndex]);
    DBComboBox2.DataSource.DataSet.FieldByName(DBComboBox2.DataField).AsString :=
      DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString;
    DBComboBox2.ItemIndex := DBComboBox1.ItemIndex;
  end;
  credDeprec._calcularPISCOFINS;
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox2.ItemIndex <= -1 then
  begin
    credDeprec._calcularPISCOFINS;
    Exit;
  end;
  if DBComboBox2.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    DBComboBox2.DataSource.DataSet.FieldByName(DBComboBox2.DataField).AsString :=
      Trim(DBComboBox2.Items[DBComboBox2.ItemIndex]);
    DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString :=
      DBComboBox2.DataSource.DataSet.FieldByName(DBComboBox2.DataField).AsString;
    DBComboBox1.ItemIndex := DBComboBox2.ItemIndex;
  end;
  credDeprec._calcularPISCOFINS;
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBComboBox3Exit(Sender: TObject);
begin
  inherited;  
  if DBComboBox3.ItemIndex <= -1 then
    Exit;
  if DBComboBox3.DataSource.DataSet.State in [dsEdit, dsInsert] then
    DBComboBox3.DataSource.DataSet.FieldByName(DBComboBox3.DataField).AsString :=
      Trim(DBComboBox3.Items[DBComboBox3.ItemIndex]);
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  credDeprec._calcularPISCOFINS;
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  credDeprec._existeContaContabil;
  edNomeConta.Text := credDeprec.NomeContaAnalitica;
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBEdit14KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    if DBEdit14.DataSource.DataSet.State in [dsEdit, dsInsert] then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
      if Trim(vDadosIni.vPesquisa) <> '' then
        DBEdit14.DataSource.DataSet.FieldByName(DBEdit14.DataField).AsString :=
          vDadosIni.vPesquisa;
    end;
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  credDeprec._existeCentroCusto;
  edNomeCusto.Text := credDeprec.NomeCentroCusto;
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBEdit16KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    if DBEdit16.DataSource.DataSet.State in [dsEdit, dsInsert] then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CENTRO_CUSTOS'));
      if Trim(vDadosIni.vPesquisa) <> '' then
        DBEdit16.DataSource.DataSet.FieldByName(DBEdit16.DataField).AsString :=
          vDadosIni.vPesquisa;
    end;
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
    BitBtn3Click(Sender);
end;

procedure TfrmCadSpedPCDeprecAmortBem.DBMemo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := AnsiUpperCase( Key )[1];
end;

procedure TfrmCadSpedPCDeprecAmortBem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DataSource1.DataSet := nil;

  credDeprec.Free;
  credDeprec := nil;

  Action := caFree;
  frmCadSpedPCDeprecAmortBem := nil;
end;

procedure TfrmCadSpedPCDeprecAmortBem.FormCreate(Sender: TObject);
begin

  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  credDeprec := TCredDepreciacaoAmortBem.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadSpedPCDeprecAmortBem.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (credDeprec.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadSpedPCDeprecAmortBem.FormShow(Sender: TObject);
begin

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmSPED.dsCredDepr;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not credDeprec._statuslixeira);
  end;

  DataSource1.DataSet := credDeprec.vProcRef.dataSet;
  edNomeConta.Text := '';
  edNomeCusto.Text := '';

  vDadosIni.fechaStatusProcessamento;

end;

procedure TfrmCadSpedPCDeprecAmortBem.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  Panel4.Visible := True;
  Panel5.Visible := False;
  Panel4.Align := alTop ;
  Panel5.Align := alTop ;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
  	DBComboBox3.SetFocus;
end;

procedure TfrmCadSpedPCDeprecAmortBem.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if credDeprec._inserirProcAdm then
  begin
    Edit1.Text := credDeprec.vProcRef.num_proc;

    ComboBox4.Clear;
    ComboBox4.Items.Add('3 – Secretaria da Receita Federal do Brasil');
    ComboBox4.Items.Add('9 – Outros.');

    ComboBox4.ItemIndex := 0;
    Panel5.Visible := True;
    if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
    	ComboBox4.SetFocus;
    Panel4.Visible := False;
  end;
end;

procedure TfrmCadSpedPCDeprecAmortBem.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if not credDeprec.vProcRef.dataSet.IsEmpty then
    credDeprec.vProcRef.dataSet.Delete;
end;

procedure TfrmCadSpedPCDeprecAmortBem.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not credDeprec.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
      DBComboBox3.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCDeprecAmortBem.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    credDeprec.Delete;
    lixeiraVazia(not credDeprec._statuslixeira);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCDeprecAmortBem.SpeedButton4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('SPED037', 'ABRIR A LIXEIRA', '', 'SPED_DEPREC_AMORT_BENS',
    '', credDeprec.buscas, true) then
    Exit;

  inherited;
  if not credDeprec._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED034]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [SPED034]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadSpedPCDeprecAmortBem.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('SPED036', '', '', 'SPED_DEPREC_AMORT_BENS', '', credDeprec.buscas, false) then
    if credDeprec._restauraLixeira then
      lixeiraVazia(not credDeprec._statuslixeira);
end;

procedure TfrmCadSpedPCDeprecAmortBem.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if credDeprec._inserirAcaoJud then
  begin
    Edit1.Text := credDeprec.vProcRef.num_proc;

    ComboBox4.Clear;
    ComboBox4.Items.Add('1 - Justiça Federal;');
    ComboBox4.Items.Add('9 – Outros.');

    ComboBox4.ItemIndex := 0;
    Panel5.Visible := True;
    if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
    	ComboBox4.SetFocus;
    Panel4.Visible := False;
  end;
end;

end.
