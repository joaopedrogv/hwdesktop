
unit uCadSpedPCOutRecCred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, DB;

type
  TfrmCadSpedPCOutRecCred = class(TfrmCadPadraoM)
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
    DBRadioGroup1: TDBRadioGroup;
    GroupBox5: TGroupBox;
    DBEdit2: TDBEdit;
    GroupBox6: TGroupBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
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
    GroupBox11: TGroupBox;
    DBEdit16: TDBEdit;
    GroupBox12: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox13: TGroupBox;
    Panel4: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Panel5: TPanel;
    Label18: TLabel;
    Edit1: TEdit;
    ComboBox4: TComboBox;
    Label19: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    edNomeParticipante: TEdit;
    edNomeConta: TEdit;
    edNomeCusto: TEdit;
    DBRadioGroup2: TDBRadioGroup;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton16: TSpeedButton;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox4Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBRadioGroup1Exit(Sender: TObject);
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
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSpedPCOutRecCred: TfrmCadSpedPCOutRecCred;

implementation

uses uDtmSPED, uClassesSpedPCBlocoF, uDtmAtivo, uDadosIni, uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadSpedPCOutRecCred.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  try
   SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED026]';
   
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('SPED023', 'CONSULTA', '', 'SPED_OUTRAS_RECEITAS_CREDITOS', '', outRecCred.buscas, False) then
      Exit;

    inherited;
    
    if MaskEdit2.Visible then
    begin
      if not outRecCred.ConsultaCampos('SPED_OUTRAS_RECEITAS_CREDITOS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if outRecCred.ConsultaCampos('SPED_OUTRAS_RECEITAS_CREDITOS', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    for I := 0 to DBGrid1.Columns.Count - 1 do
    begin
      if DBGrid1.Columns[i].FieldName = 'DESC_DOC_OPER' THEN
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
      else if DBGrid1.Columns[i].FieldName = 'PROCESSOS_REF' THEN
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
    end;

    lixeiraVazia(not outRecCred._statuslixeira);
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;
    if not outRecCred.Insert then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBRadioGroup1.CanFocus) then
      DBRadioGroup1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.BitBtn4Click(Sender: TObject);
begin
  if not outRecCred.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(outRecCred.vNomeCampoErro);
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
      if outRecCred.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBRadioGroup1.CanFocus) then
        	DBRadioGroup1.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;

end;

procedure TfrmCadSpedPCOutRecCred.BitBtn5Click(Sender: TObject);
begin
  outRecCred.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    Exit;
  end;
  inherited;
end;

procedure TfrmCadSpedPCOutRecCred.BitBtn7Click(Sender: TObject);
begin
  inherited;
  outRecCred.vProcRef.ind_proc := Trim(ComboBox4.Text);
  if outRecCred._salvarProcessoRef then
    BitBtn8.Click
  else if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
    ComboBox4.SetFocus;
end;

procedure TfrmCadSpedPCOutRecCred.BitBtn8Click(Sender: TObject);
begin
  inherited;
  Panel4.Visible := True;
  if DBGrid2.DataSource <> nil then
    DBGrid2.DataSource.DataSet.Cancel;
  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
  	DBGrid2.SetFocus;
  Panel5.Visible := False;
end;

procedure TfrmCadSpedPCOutRecCred.ComboBox4Exit(Sender: TObject);
begin
  inherited;
  ComboBox4.Text := ComboBox4.Items[ComboBox4.ItemIndex];
end;

procedure TfrmCadSpedPCOutRecCred.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox1.ItemIndex <= -1 then
    Exit;
  if DBComboBox1.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString :=
      Trim(DBComboBox1.Items[DBComboBox1.ItemIndex]);
    DBComboBox2.DataSource.DataSet.FieldByName(DBComboBox2.DataField).AsString :=
      DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString;
    DBComboBox2.ItemIndex := DBComboBox1.ItemIndex;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox2.ItemIndex <= -1 then
    Exit;
  if DBComboBox2.DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
    DBComboBox2.DataSource.DataSet.FieldByName(DBComboBox2.DataField).AsString :=
      Trim(DBComboBox2.Items[DBComboBox2.ItemIndex]);
    DBComboBox1.DataSource.DataSet.FieldByName(DBComboBox1.DataField).AsString :=
      DBComboBox2.DataSource.DataSet.FieldByName(DBComboBox2.DataField).AsString;
    DBComboBox1.ItemIndex := DBComboBox2.ItemIndex;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox3.DataSource.DataSet.State in [dsEdit, dsInsert] then
    DBComboBox3.DataSource.DataSet.FieldByName(DBComboBox3.DataField).AsString :=
      Trim(DBComboBox3.Items[DBComboBox3.ItemIndex]);
end;

procedure TfrmCadSpedPCOutRecCred.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  outRecCred._existeContaContabil;
  edNomeConta.Text := outRecCred.NomeContaAnalitica;
end;

procedure TfrmCadSpedPCOutRecCred.DBEdit14KeyDown(Sender: TObject;
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

procedure TfrmCadSpedPCOutRecCred.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  outRecCred._existeCentroCusto;
  edNomeCusto.Text := outRecCred.NomeCentroCusto;
end;

procedure TfrmCadSpedPCOutRecCred.DBEdit16KeyDown(Sender: TObject;
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

procedure TfrmCadSpedPCOutRecCred.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  outRecCred._existeParticipante;
  edNomeParticipante.Text := outRecCred.NomeParticipante;
end;

procedure TfrmCadSpedPCOutRecCred.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    if DBEdit2.DataSource.DataSet.State in [dsEdit, dsInsert] then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CLIENTES'));
      if Trim(vDadosIni.vPesquisa) <> '' then
        DBEdit2.DataSource.DataSet.FieldByName(DBEdit2.DataField).AsString :=
          vDadosIni.vPesquisa;
    end;
end;

procedure TfrmCadSpedPCOutRecCred.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  outRecCred._calcularPISCOFINS;
end;

procedure TfrmCadSpedPCOutRecCred.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadSpedPCOutRecCred.DBMemo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := AnsiUpperCase( Key )[1];
end;

procedure TfrmCadSpedPCOutRecCred.DBRadioGroup1Exit(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  vTemp := DBComboBox1.Text;
  DBComboBox1.Clear;
  if DBRadioGroup1.ItemIndex = 0 then
  begin
    DBComboBox1.Items.add('50 - Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno');
    DBComboBox1.Items.add('51 - Operação com Direito a Crédito – Vinculada Exclusivamente a Receita Não Tributada no Mercado Interno');
    DBComboBox1.Items.add('52 - Operação com Direito a Crédito - Vinculada Exclusivamente a Receita de Exportação');
    DBComboBox1.Items.add('53 - Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno');
    DBComboBox1.Items.add('54 - Operação com Direito a Crédito - Vinculada a Receitas Tributadas no Mercado Interno e de Exportação');
    DBComboBox1.Items.add('55 - Operação com Direito a Crédito - Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação');
    DBComboBox1.Items.add('56 - Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação');
    DBComboBox1.Items.add('60 - Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Tributada no Mercado Interno');
    DBComboBox1.Items.add('61 - Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno');
    DBComboBox1.Items.add('62 - Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação');
    DBComboBox1.Items.add('63 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno');
    DBComboBox1.Items.add('64 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação');
    DBComboBox1.Items.add('65 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação');
    DBComboBox1.Items.add('66 - Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação');
  end
  else if DBRadioGroup1.ItemIndex = 1 then
  begin
    DBComboBox1.Items.add('01 - Operação Tributável com Alíquota Básica');
    DBComboBox1.Items.add('02 - Operação Tributável com Alíquota Diferenciada');
    DBComboBox1.Items.add('03 - Operação Tributável com Alíquota por Unidade de Medida de Produto');
    DBComboBox1.Items.add('05 - Operação Tributável por Substituição Tributária');
  end
  else
  begin
    DBComboBox1.Items.add('04 - Operação Tributável Monofásica - Revenda a Alíquota Zero');
    DBComboBox1.Items.add('06 - Operação Tributável a Alíquota Zero');
    DBComboBox1.Items.add('07 - Operação Isenta da Contribuição');
    DBComboBox1.Items.add('08 - Operação sem Incidência da Contribuição');
    DBComboBox1.Items.add('09 - Operação com Suspensão da Contribuição');
    DBComboBox1.Items.add('49 - Outras Operações de Saída');
    DBComboBox1.Items.add('99 - Outras Operações');
  end;
  DBComboBox2.Items := DBComboBox1.Items;

  DBComboBox1.Text := vTemp;
  DBComboBox2.Text := vTemp;

end;

procedure TfrmCadSpedPCOutRecCred.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DataSource1.DataSet := nil;

  outRecCred.Free;
  outRecCred := nil;

  Action := caFree;
  frmCadSpedPCOutRecCred := nil;
end;

procedure TfrmCadSpedPCOutRecCred.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  outRecCred := TOutrasReceitasOuCreditosSPEDPC.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadSpedPCOutRecCred.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (outRecCred.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end
end;

procedure TfrmCadSpedPCOutRecCred.FormShow(Sender: TObject);
begin

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmSPED.dsOutRecCred;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not outRecCred._statuslixeira);
  end;

  DataSource1.DataSet := outRecCred.vProcRef.dataSet;
  edNomeParticipante.Text := '';
  edNomeConta.Text := '';
  edNomeCusto.Text := '';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadSpedPCOutRecCred.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  Panel4.Visible := True;
  Panel5.Visible := False;
  Panel4.Align := alTop ;
  Panel5.Align := alTop ;
  if (Self.Enabled) and (Self.Visible) and (DBRadioGroup1.CanFocus) then
  	DBRadioGroup1.SetFocus;
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if outRecCred._inserirProcAdm then
  begin
    Edit1.Text := outRecCred.vProcRef.num_proc;

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

procedure TfrmCadSpedPCOutRecCred.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if not outRecCred.vProcRef.dataSet.IsEmpty then
    outRecCred.vProcRef.dataSet.Delete;
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vPesquisa := '';
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    DBEdit3.DataSource.DataSet.FieldByName(DBEdit3.DataField).AsString := 'P|'+
      vDadosIni.vPesquisaGrupo_prod+'|'+Trim(vDadosIni.vPesquisaCod_prod)+'|';
    DBEdit4.DataSource.DataSet.FieldByName(DBEdit4.DataField).AsString :=
      outRecCred.retornaValor('select descr_prod as valor from produtos' +
        ' where grupo_prod = ' + vDadosIni.vPesquisaGrupo_prod +
        ' and cod_prod = ' + QuotedStr(Trim(vDadosIni.vPesquisaCod_prod))+
        ' and cod_empresa = ' + vDadosIni.codEmpresa);
    DBEdit4.Enabled := False;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vPesquisa := '';
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('TIPO_SERVICO');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    DBEdit3.DataSource.DataSet.FieldByName(DBEdit3.DataField).AsString := 'S|' +
      vDadosIni.vPesquisa+'|';
    DBEdit4.DataSource.DataSet.FieldByName(DBEdit4.DataField).AsString :=
      outRecCred.retornaValor('select desc_servico as valor from tipo_servico' +
        ' where cod_servico = ' + vDadosIni.vPesquisa);
    DBEdit4.Enabled := False;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  DBEdit3.DataSource.DataSet.FieldByName(DBEdit3.DataField).AsString := '';
  DBEdit4.DataSource.DataSet.FieldByName(DBEdit4.DataField).AsString := '';
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vPesquisa := '';
  if InputQuery('Informe o código', 'Informe o código do Item no campo abaixo', vDadosIni.vPesquisa) then  
    if Trim(vDadosIni.vPesquisa) <> '' then
    begin
      DBEdit3.DataSource.DataSet.FieldByName(DBEdit3.DataField).AsString := 'A|' +
        vDadosIni.vPesquisa+'|';
      DBEdit4.Enabled := True;
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      	DBEdit4.SetFocus;
    end;
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not outRecCred.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBRadioGroup1.CanFocus) then
      DBRadioGroup1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('SPED029', 'ABRIR A LIXEIRA', '', 'SPED_OUTRAS_RECEITAS_CREDITOS',
    '', outRecCred.buscas, true) then
  Exit;

  inherited;

  if not outRecCred._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [SPED026]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [SPED026]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    outRecCred.Delete;
    lixeiraVazia(not outRecCred._statuslixeira);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('SPED029', 'ABRIR A LIXEIRA', '', 'SPED_OUTRAS_RECEITAS_CREDITOS',
    '', outRecCred.buscas, true) then
    Exit;

  inherited;
  if not outRecCred._abrelixeira then
  begin
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('SPED028', '', '', 'SPED_OUTRAS_RECEITAS_CREDITOS', '', outRecCred.buscas, false) then
    if outRecCred._restauraLixeira then
      lixeiraVazia(not outRecCred._statuslixeira);
end;

procedure TfrmCadSpedPCOutRecCred.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if outRecCred._inserirAcaoJud then
  begin
    Edit1.Text := outRecCred.vProcRef.num_proc;

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
