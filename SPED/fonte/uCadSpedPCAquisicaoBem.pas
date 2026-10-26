unit uCadSpedPCAquisicaoBem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, DB;

type
  TfrmCadSpedPCAquisicaoBem = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label20: TLabel;
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
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBEdit2: TDBEdit;
    DBRadioGroup4: TDBRadioGroup;
    DBEdit3: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit4: TDBEdit;
    Label23: TLabel;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    Label24: TLabel;
    DataSource1: TDataSource;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBRadioGroup4Exit(Sender: TObject);
    procedure DBEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSpedPCAquisicaoBem: TfrmCadSpedPCAquisicaoBem;

implementation

uses uDtmSPED, uDtmAtivo, uClassesSpedPCBlocoF;

{$R *.dfm}

procedure TfrmCadSpedPCAquisicaoBem.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED042]';
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('SPED039', 'CONSULTA', '', 'SPED_AQUISICAO_BENS', '', aquisicBem.buscas, False) then
      Exit;

    inherited;
    
    if MaskEdit2.Visible then
    begin
      if not aquisicBem.ConsultaCampos('SPED_AQUISICAO_BENS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if aquisicBem.ConsultaCampos('SPED_AQUISICAO_BENS', MaskEdit3.text, ComboBox1.Text,
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

    lixeiraVazia(not aquisicBem._statuslixeira);
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCAquisicaoBem.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not aquisicBem.Insert then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBRadioGroup2.CanFocus) then
      DBRadioGroup2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCAquisicaoBem.BitBtn4Click(Sender: TObject);
begin
  if not aquisicBem.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(aquisicBem.vNomeCampoErro);
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
      if aquisicBem.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBRadioGroup2.CanFocus) then
        	DBRadioGroup2.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadSpedPCAquisicaoBem.BitBtn5Click(Sender: TObject);
begin
  aquisicBem.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadSpedPCAquisicaoBem.BitBtn7Click(Sender: TObject);
begin
  inherited;
  aquisicBem.vProcRef.ind_proc := Trim(ComboBox4.Text);
  if aquisicBem._salvarProcessoRef then
    BitBtn8.Click
  else if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
    ComboBox4.SetFocus;
end;

procedure TfrmCadSpedPCAquisicaoBem.BitBtn8Click(Sender: TObject);
begin
  inherited;
  Panel4.Visible := True;
  if DBGrid2.DataSource <> nil then
    DBGrid2.DataSource.DataSet.Cancel;
  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
  	DBGrid2.SetFocus;
  Panel5.Visible := False;
end;

procedure TfrmCadSpedPCAquisicaoBem.ComboBox4Exit(Sender: TObject);
begin
  inherited;
  ComboBox4.Text := ComboBox4.Items[ComboBox4.ItemIndex];
end;

procedure TfrmCadSpedPCAquisicaoBem.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (DBComboBox1.ItemIndex <= -1) then
    if vDadosIni.textoInTStrings(DBComboBox1.Text, DBComboBox1.Items) then
      begin
        aquisicBem._calcularPISCOFINS;
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
  aquisicBem._calcularPISCOFINS;

  {Exit;
  if DBComboBox1.ItemIndex <= -1 then
  begin
    aquisicBem._calcularPISCOFINS;
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
  aquisicBem._calcularPISCOFINS; }
end;

procedure TfrmCadSpedPCAquisicaoBem.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (DBComboBox2.ItemIndex <= -1) then
    if vDadosIni.textoInTStrings(DBComboBox2.Text, DBComboBox2.Items) then
      begin
        aquisicBem._calcularPISCOFINS;
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
  aquisicBem._calcularPISCOFINS;

{  if DBComboBox2.ItemIndex <= -1 then
  begin
    aquisicBem._calcularPISCOFINS;
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
  aquisicBem._calcularPISCOFINS;}
end;

procedure TfrmCadSpedPCAquisicaoBem.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  aquisicBem._existeContaContabil;
  edNomeConta.Text := aquisicBem.NomeContaAnalitica;
end;

procedure TfrmCadSpedPCAquisicaoBem.DBEdit14KeyDown(Sender: TObject;
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

procedure TfrmCadSpedPCAquisicaoBem.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  aquisicBem._existeCentroCusto;
  edNomeCusto.Text := aquisicBem.NomeCentroCusto;
end;

procedure TfrmCadSpedPCAquisicaoBem.DBEdit16KeyDown(Sender: TObject;
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

procedure TfrmCadSpedPCAquisicaoBem.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  aquisicBem._calcularPISCOFINS;
end;

procedure TfrmCadSpedPCAquisicaoBem.DBGrid1KeyDown(Sender: TObject;
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

procedure TfrmCadSpedPCAquisicaoBem.DBMemo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := AnsiUpperCase( Key )[1];
end;

procedure TfrmCadSpedPCAquisicaoBem.DBRadioGroup4Exit(Sender: TObject);
begin
  inherited;
  DBEdit3.Enabled := (DBRadioGroup4.ItemIndex = 5);
  aquisicBem._calcularPISCOFINS;  
end;

procedure TfrmCadSpedPCAquisicaoBem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DataSource1.DataSet := nil;

  aquisicBem.Free;
  aquisicBem := nil;

  Action := caFree;
  frmCadSpedPCAquisicaoBem := nil;
end;

procedure TfrmCadSpedPCAquisicaoBem.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  aquisicBem := TCredAquisicaoBem.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadSpedPCAquisicaoBem.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (aquisicBem.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadSpedPCAquisicaoBem.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmSPED.dsAqBem;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not aquisicBem._statuslixeira);
  end;

  DataSource1.DataSet := aquisicBem.vProcRef.dataSet;
  edNomeConta.Text := '';
  edNomeCusto.Text := '';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadSpedPCAquisicaoBem.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  Panel4.Visible := True;
  Panel5.Visible := False;
  Panel4.Align := alTop ;
  Panel5.Align := alTop ;
  DBEdit3.Enabled := (DBRadioGroup4.ItemIndex = 5);
  if (Self.Enabled) and (Self.Visible) and (DBRadioGroup2.CanFocus) then
  	DBRadioGroup2.SetFocus;
end;

procedure TfrmCadSpedPCAquisicaoBem.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if aquisicBem._inserirProcAdm then
  begin
    Edit1.Text := aquisicBem.vProcRef.num_proc;

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

procedure TfrmCadSpedPCAquisicaoBem.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if not aquisicBem.vProcRef.dataSet.IsEmpty then
    aquisicBem.vProcRef.dataSet.Delete;
end;

procedure TfrmCadSpedPCAquisicaoBem.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not aquisicBem.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBRadioGroup2.CanFocus) then
      DBRadioGroup2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCAquisicaoBem.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('SPED045', 'ABRIR A LIXEIRA', '', 'SPED_AQUISICAO_BENS',
    '', aquisicBem.buscas, true) then
    Exit;

  inherited;
  if not aquisicBem._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED042]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [SPED042]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadSpedPCAquisicaoBem.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    aquisicBem.Delete;
    lixeiraVazia(not aquisicBem._statuslixeira);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCAquisicaoBem.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('SPED044', '', '', 'SPED_AQUISICAO_BENS', '', aquisicBem.buscas, false) then
    if aquisicBem._restauraLixeira then
      lixeiraVazia(not aquisicBem._statuslixeira);
end;

procedure TfrmCadSpedPCAquisicaoBem.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if aquisicBem._inserirAcaoJud then
  begin
    Edit1.Text := aquisicBem.vProcRef.num_proc;

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
