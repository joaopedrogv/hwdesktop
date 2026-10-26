unit UCadTAG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadrao, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, uClassesCadastrosBasicos, uCadPadraoModal;

type
  TfrmCadTAG = class(TfrmCadPadraoM)
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label_Codigo: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit_Descricao: TDBEdit;
    DBEdit_Codigo: TDBEdit;
    DBComboBox_Tabela: TDBComboBox;
    DBEdit_Nome: TDBEdit;
    DBComboBox_Campo: TDBComboBox;
    GroupBox_Rel: TGroupBox;
    CheckBox_Relacionamento: TCheckBox;
    GroupBox_Buscar: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    DBComboBox_TabelaBuscar: TDBComboBox;
    DBComboBox_CampoBuscar: TDBComboBox;
    Panel4: TPanel;
    Label15: TLabel;
    DBComboBox_Campo2: TDBComboBox;
    GroupBox_Rel2: TGroupBox;
    CheckBox_Relacionamento2: TCheckBox;
    GroupBox_Buscar2: TGroupBox;
    Label7: TLabel;
    Label13: TLabel;
    DBComboBox_TabelaBuscar2: TDBComboBox;
    DBComboBox_CampoBuscar2: TDBComboBox;
    GroupBox_Exibir: TGroupBox;
    Label14: TLabel;
    DBComboBox_CampoExibir: TDBComboBox;
    procedure DBComboBox_TabelaBuscar2Change(Sender: TObject);
    procedure CheckBox_Relacionamento2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboBox_TabelaChange(Sender: TObject);
    procedure DBComboBox_TabelaBuscarChange(Sender: TObject);
    procedure CheckBox_RelacionamentoClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
    procedure _PreencheCampoComTabelas(dbcombobox: TDBComboBox);
    procedure _PreencheCamposComCamposDaTabela(dbcombobox: TDBComboBox; Tabela: string);
  end;

var
  frmCadTAG: TfrmCadTAG;
  TAGs: TTAG;

implementation
uses
  uDtmAtivo, UDtmCadastrosBasicos, DB;
{$R *.dfm}

procedure TfrmCadTAG.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS171]';
  if vDadosIni.PesqPros('BAS167', 'PESQUISAR', '', 'TAG', '',
    TAGs.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not TAGs.ConsultaCampos('MACRO', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not TAGs.ConsultaCampos('MACRO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if TAGs._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadTAG.BitBtn3Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS168', 'INSERIR', '', 'TAG',
      '', TAGs.buscas, true) then
    begin
      if TAGs.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar';
        TabSheet3.TabVisible := true;
        TabSheet3.Show;
        if (Self.Enabled) and (Self.Visible) and (DBEdit_Nome.CanFocus) then
        	DBEdit_Nome.SetFocus;
        DBEdit_Codigo.Visible := false;
        Label_Codigo.Visible := False;
        CheckBox_Relacionamento.Checked := false;
        CheckBox_Relacionamento2.Checked := false;
        CheckBox_RelacionamentoClick(Sender);
        CheckBox_Relacionamento2Click(Sender);
        if (Self.Enabled) and (Self.Visible) and (DBEdit_Nome.CanFocus) then
          DBEdit_Nome.SetFocus;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TAGs.Cancel;
    TAGs.RollBackTransacao;
  end;
end;

procedure TfrmCadTAG.BitBtn4Click(Sender: TObject);
begin
  TAGs._VerificaRelacionamento := CheckBox_Relacionamento.Checked;
  TAGs._VerificaRelacionamento2 := CheckBox_Relacionamento2.Checked;

  if not TAGs.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(TAGs.vNomeCampoErro, TAGs.vMensagemErro);
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
      if TAGs.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit_Nome.CanFocus) then
        	DBEdit_Nome.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadTAG.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS175', 'CANCELAR', '', 'MACRO',
    TAGs.dataSet.FieldByName('MACRO').AsString, TAGs.buscas, true) then
  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    TAGs.Cancel;
    TAGs.RollBackTransacao;
    inherited;
  end;

end;

procedure TfrmCadTAG.CheckBox_Relacionamento2Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    DBComboBox_TabelaBuscar.ItemIndex := DBComboBox_TabelaBuscar.Items.IndexOf(TAGs.dataset.FieldByName('TABELA_RELAC').AsString);
    DBComboBox_TabelaBuscar2.ItemIndex := DBComboBox_TabelaBuscar2.Items.IndexOf(TAGs.dataset.FieldByName('TABELA_RELAC2').AsString);
    if trim(DBComboBox_Tabela.Text) <> '' then
      _PreencheCamposComCamposDaTabela(DBComboBox_Campo, DBComboBox_Tabela.Text);
      
    // atualiza os campos com valores gerados...
    if (CheckBox_Relacionamento.Checked) and (trim(DBComboBox_TabelaBuscar.Text) <> '') then
    	_PreencheCamposComCamposDaTabela(DBComboBox_CampoBuscar, DBComboBox_TabelaBuscar.Text);

    if (CheckBox_Relacionamento.Checked) and (CheckBox_Relacionamento2.Checked) and (trim(DBComboBox_TabelaBuscar.Text) <> '') then
    	_PreencheCamposComCamposDaTabela(DBComboBox_Campo2, DBComboBox_TabelaBuscar.Text);
      
    if (CheckBox_Relacionamento.Checked) and (CheckBox_Relacionamento2.Checked) and (trim(DBComboBox_TabelaBuscar2.Text) <> '') then
    	_PreencheCamposComCamposDaTabela(DBComboBox_CampoBuscar2, DBComboBox_TabelaBuscar2.Text);

    if (CheckBox_Relacionamento.Checked) and (not CheckBox_Relacionamento2.Checked) and (trim(DBComboBox_TabelaBuscar.Text) <> '') then
    	_PreencheCamposComCamposDaTabela(DBComboBox_CampoExibir, DBComboBox_TabelaBuscar.Text)
    else if (CheckBox_Relacionamento.Checked) and (CheckBox_Relacionamento2.Checked) and (trim(DBComboBox_TabelaBuscar2.Text) <> '') then
    	_PreencheCamposComCamposDaTabela(DBComboBox_CampoExibir, DBComboBox_TabelaBuscar2.Text);
    
    DBComboBox_CampoBuscar.ItemIndex := DBComboBox_CampoBuscar.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO_RELAC').AsString);
    DBComboBox_CampoBuscar2.ItemIndex := DBComboBox_CampoBuscar2.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO_RELAC2').AsString);
    
    DBComboBox_Campo.ItemIndex := DBComboBox_Campo.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO').AsString);
    DBComboBox_Campo2.ItemIndex := DBComboBox_Campo2.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO2').AsString);

    DBComboBox_CampoExibir.ItemIndex := DBComboBox_CampoExibir.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO_RETORNO').AsString);

    if (CheckBox_Relacionamento2.Checked) then
    begin
      Panel4.Visible := true;
      GroupBox_Rel2.Visible := false;
      GroupBox_Rel2.Visible := true;
      DBComboBox_Campo2.TabOrder := GroupBox_Rel2.TabOrder + 1;

      GroupBox_Buscar2.Enabled := true;
      GroupBox_Exibir.Enabled := true;

      DBComboBox_TabelaBuscar2.Enabled := true;
      DBComboBox_CampoBuscar2.Enabled := true;

      DBComboBox_Campo2.Enabled := true;
      
      GroupBox_Buscar2.Visible := true;
      GroupBox_Exibir.Visible := false;
      GroupBox_Exibir.Visible := true;
      GroupBox_Exibir.TabOrder := GroupBox_Buscar2.TabOrder + 1;
    end
    else
    begin
    	DBComboBox_Campo2.ItemIndex := -1;
      DBComboBox_TabelaBuscar2.ItemIndex := -1;
      DBComboBox_CampoBuscar2.ItemIndex := -1;
      if (not CheckBox_Relacionamento.Checked) and (not CheckBox_Relacionamento2.Checked) then
      	DBComboBox_CampoExibir.ItemIndex := -1;

      Panel4.Visible := false;
      GroupBox_Buscar2.Visible := false;

      DBComboBox_TabelaBuscar2.Enabled := false;
      DBComboBox_CampoBuscar2.Enabled := false;

      DBComboBox_Campo2.Enabled := false;

      GroupBox_Buscar2.Enabled := false;

      TAGs.dataset.FieldByName('CAMPO2').Value := '';
      TAGs.dataset.FieldByName('TABELA_RELAC2').Value := '';
      TAGs.dataset.FieldByName('CAMPO_RELAC2').Value := '';
      if (not CheckBox_Relacionamento.Checked) and (not CheckBox_Relacionamento2.Checked) then
      	TAGs.dataset.FieldByName('CAMPO_RETORNO').value := '';
    end;
    if (Self.Enabled) and (Self.Visible) and (CheckBox_Relacionamento2.CanFocus) then
     CheckBox_Relacionamento2.SetFocus;
  finally
   Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadTAG.CheckBox_RelacionamentoClick(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    DBComboBox_TabelaBuscar.ItemIndex := DBComboBox_TabelaBuscar.Items.IndexOf(TAGs.dataset.FieldByName('TABELA_RELAC').AsString);
    DBComboBox_TabelaBuscar2.ItemIndex := DBComboBox_TabelaBuscar2.Items.IndexOf(TAGs.dataset.FieldByName('TABELA_RELAC2').AsString);
    if trim(DBComboBox_Tabela.Text) <> '' then
      _PreencheCamposComCamposDaTabela(DBComboBox_Campo, DBComboBox_Tabela.Text);

    // atualiza os campos com valores gerados...
    if (CheckBox_Relacionamento.Checked) and (trim(DBComboBox_TabelaBuscar.Text) <> '') then
      _PreencheCamposComCamposDaTabela(DBComboBox_CampoBuscar, DBComboBox_TabelaBuscar.Text);

    if (CheckBox_Relacionamento.Checked) and (CheckBox_Relacionamento2.Checked) and (trim(DBComboBox_TabelaBuscar.Text) <> '') then
    	_PreencheCamposComCamposDaTabela(DBComboBox_Campo2, DBComboBox_TabelaBuscar.Text);
      
    if (CheckBox_Relacionamento.Checked) and (CheckBox_Relacionamento2.Checked) and (trim(DBComboBox_TabelaBuscar2.Text) <> '') then
    	_PreencheCamposComCamposDaTabela(DBComboBox_CampoBuscar2, DBComboBox_TabelaBuscar2.Text);

    if (CheckBox_Relacionamento.Checked) and (not CheckBox_Relacionamento2.Checked) and (trim(DBComboBox_TabelaBuscar.Text) <> '') then
    	_PreencheCamposComCamposDaTabela(DBComboBox_CampoExibir, DBComboBox_TabelaBuscar.Text)
    else if (CheckBox_Relacionamento.Checked) and (CheckBox_Relacionamento2.Checked) and (trim(DBComboBox_TabelaBuscar.Text) <> '') then
    	_PreencheCamposComCamposDaTabela(DBComboBox_CampoExibir, DBComboBox_TabelaBuscar2.Text);

    DBComboBox_CampoBuscar.ItemIndex := DBComboBox_CampoBuscar.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO_RELAC').AsString);
    DBComboBox_CampoBuscar2.ItemIndex := DBComboBox_CampoBuscar2.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO_RELAC2').AsString);
    
    DBComboBox_Campo.ItemIndex := DBComboBox_Campo.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO').AsString);
    DBComboBox_Campo2.ItemIndex := DBComboBox_Campo2.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO2').AsString);

    DBComboBox_CampoExibir.ItemIndex := DBComboBox_CampoExibir.Items.IndexOf(TAGs.dataset.FieldByName('CAMPO_RETORNO').AsString);

    if (CheckBox_Relacionamento.Checked) then
    begin
      GroupBox_Buscar.Enabled := true;
      GroupBox_Exibir.Enabled := true;
      CheckBox_Relacionamento2.Enabled := true;

      DBComboBox_TabelaBuscar.Enabled := true;
      DBComboBox_CampoBuscar.Enabled := true;
      DBComboBox_CampoExibir.Enabled := true;

      DBComboBox_TabelaBuscar2.Enabled := CheckBox_Relacionamento2.Checked;
      DBComboBox_CampoBuscar2.Enabled := CheckBox_Relacionamento2.Checked;

      DBComboBox_Campo2.Enabled := CheckBox_Relacionamento2.Checked;
    end
    else
    begin
      DBComboBox_TabelaBuscar.ItemIndex := -1;
      DBComboBox_CampoBuscar.ItemIndex := -1;

      DBComboBox_TabelaBuscar2.ItemIndex := -1;
      DBComboBox_CampoBuscar2.ItemIndex := -1;

      DBComboBox_Campo2.ItemIndex := -1;
      
      DBComboBox_CampoExibir.ItemIndex := -1;

      CheckBox_Relacionamento2.Checked := false;
      
      DBComboBox_TabelaBuscar.Enabled := false;
      DBComboBox_CampoBuscar.Enabled := false;

      DBComboBox_TabelaBuscar2.Enabled := false;
      DBComboBox_CampoBuscar2.Enabled := false;

      DBComboBox_Campo2.Enabled := false;
      
      DBComboBox_CampoExibir.Enabled := false;
      CheckBox_Relacionamento2.Enabled := false;

      GroupBox_Buscar.Enabled := false;
      GroupBox_Exibir.Enabled := false;

      TAGs.dataset.FieldByName('TABELA_RELAC').Value := '';
      TAGs.dataset.FieldByName('CAMPO_RELAC').Value := '';
      if (not CheckBox_Relacionamento.Checked) and (not CheckBox_Relacionamento2.Checked) then
      	TAGs.dataset.FieldByName('CAMPO_RETORNO').value := '';
    end;
  finally
   Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadTAG.DBComboBox_TabelaBuscar2Change(Sender: TObject);
begin
  inherited;
  _PreencheCamposComCamposDaTabela(DBComboBox_CampoBuscar2, DBComboBox_TabelaBuscar2.Text);
  _PreencheCamposComCamposDaTabela(DBComboBox_CampoExibir, DBComboBox_TabelaBuscar2.Text);
end;

procedure TfrmCadTAG.DBComboBox_TabelaBuscarChange(Sender: TObject);
begin
  inherited;
  _PreencheCamposComCamposDaTabela(DBComboBox_CampoBuscar, DBComboBox_TabelaBuscar.Text);
  _PreencheCamposComCamposDaTabela(DBComboBox_CampoExibir, DBComboBox_TabelaBuscar.Text);
end;

procedure TfrmCadTAG.DBComboBox_TabelaChange(Sender: TObject);
begin
  inherited;
  _PreencheCamposComCamposDaTabela(DBComboBox_Campo, DBComboBox_Tabela.Text);
end;

procedure TfrmCadTAG.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadTAG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TAGs.Cancel;
  TAGs.RollBackTransacao;
  TAGs.free;
  Action := caFree;
  FrmCadTAG := nil;
end;

procedure TfrmCadTAG.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  inherited;

  if (vDadosIni.vModalOuChild = 'M') then
  begin
    self.FormStyle := fsNormal;
  end;

  TelaCadastro := vDadosIni.vTipoForm;
  TAGs := TTAG.create;
  DBGrid1.DataSource := DtmCadBasicos.dsTAGs;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadTAG.FormKeyDown(Sender: TObject; var Key: Word;
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
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end;

end;

procedure TfrmCadTAG.FormShow(Sender: TObject);
begin
  inherited;
  if (vCriou = 0) and (vShow <> 1) then
  begin
    inherited;
    DBGrid1.DataSource := DtmCadBasicos.dsTAGs;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  CheckBox3.Visible := false;
  CheckBox1.Visible := false;
  SpeedButton3.Visible := false;

  if vCriou = 0 then
  begin
    _PreencheCampoComTabelas(DBComboBox_Tabela);
    _PreencheCampoComTabelas(DBComboBox_TabelaBuscar);
    _PreencheCampoComTabelas(DBComboBox_TabelaBuscar2);
  end;

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadTAG.SpeedButton1Click(Sender: TObject);
begin
  try
    if TAGs.dataSet.IsEmpty then
      exit;
    if TAGs.Edit then
    begin
      inherited;
      PageControl1.ActivePage := TabSheet1;
      TabSheet1.Show;
      TabSheet3.Caption := 'Alterar';
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      GroupBox_Buscar.Enabled := true;
      if (TAGs.dataSet.FieldByName('RELACIONAMENTO').AsInteger = 1) then
        CheckBox_Relacionamento.Checked := true
      else
        CheckBox_Relacionamento.Checked := false;

      if (TAGs.dataSet.FieldByName('RELACIONAMENTO2').AsInteger = 1) then
        CheckBox_Relacionamento2.Checked := true
      else
        CheckBox_Relacionamento2.Checked := false;


      Label_Codigo.Visible := true;
      DBEdit_Codigo.Visible := true;
      CheckBox_RelacionamentoClick(Sender);
      CheckBox_Relacionamento2Click(Sender);
      if (Self.Enabled) and (Self.Visible) and (DBEdit_Nome.CanFocus) then
        DBEdit_Nome.SetFocus;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TAGs.Cancel;
    TAGs.RollBackTransacao;

  end;

end;

procedure TfrmCadTAG.SpeedButton25Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS173', 'ABRIR A LIXEIRA', '', 'TAG',
      '', TAGs.buscas, true) then
    begin
      inherited;
      if not TAGs._AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS171]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS170]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;

  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TAGs.Cancel;
    TAGs.RollBackTransacao;
  end;
end;

procedure TfrmCadTAG.SpeedButton2Click(Sender: TObject);
begin
  try
    if not TAGs.Delete then
      exit;

    if TAGs._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;

  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TAGs.Cancel;
    TAGs.RollBackTransacao;
  end;
end;

procedure TfrmCadTAG.SpeedButton5Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS172', '', '', 'TAG', '', TAGs.buscas, false) then
    begin
      inherited;
      TAGs._RestaurarLixeira;
      if TAGs._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;

  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    TAGs.Cancel;
    TAGs.RollBackTransacao;

  end;
end;

procedure TfrmCadTAG._PreencheCampoComTabelas(dbcombobox: TDBComboBox);
begin
{
     Preenche o campo com as tabelas dos banco
}
  with DtmCadBasicos do
  begin
    dbcombobox.Items.Clear;

    qrBuscaTAG.Close;
    qrBuscaTAG.SQL.Text := ' select distinct RDB$RELATION_NAME from RDB$RELATION_FIELDS ' +
      ' where (RDB$SYSTEM_FLAG = 0 or RDB$SYSTEM_FLAG is null) ' +
      ' order by RDB$RELATION_NAME ';
    qrBuscaTAG.Open;
    qrBuscaTAG.First;
    while not DtmCadBasicos.qrBuscaTAG.Eof do
    begin
      dbcombobox.Items.Add(trim(DtmCadBasicos.QrBuscaTAG.FieldByName('RDB$RELATION_NAME').Text));
      qrBuscaTAG.Next;
    end;
    qrBuscaTAG.Active := False;
  end;
end;

procedure TfrmCadTAG._PreencheCamposComCamposDaTabela(dbcombobox: TDBComboBox;
  Tabela: string);
var
  i: Word;
begin
{
     Preenche com campos da tabela do relacionamento selecionado
}
  dbcombobox.Items.Clear;
  with DtmCadBasicos do
  begin
    if (Tabela <> '') then
    begin
      qrBuscaTAG.Close;
      qrBuscaTAG.SQL.Text := 'select * from ' + trim(Tabela) + '';
      qrBuscaTAG.Open;
      for i := 0 to qrBuscaTAG.FieldCount - 1 do
      begin
        dbcombobox.Items.Add(qrBuscaTAG.Fields[i].DisplayName);
        if (trim(Tabela) = 'CONTROLE_CREDITOS') and (trim(qrBuscaTAG.Fields[i].DisplayName) = 'DATA_VENC_C') then
        begin
        	dbcombobox.Items.Add(trim(qrBuscaTAG.Fields[i].DisplayName) + '_URL');
          dbcombobox.Items.Add(trim(qrBuscaTAG.Fields[i].DisplayName) + '_CORR');
          dbcombobox.Items.Add(trim(qrBuscaTAG.Fields[i].DisplayName) + '_CORR_URL');
          dbcombobox.Items.Add(trim(qrBuscaTAG.Fields[i].DisplayName) + '_ORIG_CORR');
          dbcombobox.Items.Add(trim(qrBuscaTAG.Fields[i].DisplayName) + '_ORIG_CORR_URL');
        end;
      end;
      qrBuscaTAG.Active := False;
    end;
  end;
end;

initialization
  RegisterClass(TfrmCadTAG);
finalization
  UnRegisterClass(TfrmCadTAG);

end.

