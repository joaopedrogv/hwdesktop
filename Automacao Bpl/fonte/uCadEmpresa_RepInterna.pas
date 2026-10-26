unit uCadEmpresa_RepInterna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, uClassesReplicaoInterna,
  ComCtrls, CheckLst;

type
  TfrmCadEmpresaRepInterna = class(TfrmPadrao)
    Panel16: TPanel;
    BitBtn6: TBitBtn;
    pg_repint: TPageControl;
    ts_conf: TTabSheet;
    Panel1: TPanel;
    Splitter3: TSplitter;
    Panel4: TPanel;
    Splitter2: TSplitter;
    GroupBox2: TGroupBox;
    Panel8: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    grid_tabelas: TDBGrid;
    Panel5: TPanel;
    Splitter4: TSplitter;
    GroupBox3: TGroupBox;
    grid_exceto_campos: TDBGrid;
    GroupBox1: TGroupBox;
    grid_campos_chave: TDBGrid;
    Panel6: TPanel;
    Splitter1: TSplitter;
    GroupBox4: TGroupBox;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    grid_schema: TDBGrid;
    GroupBox5: TGroupBox;
    grid_emp: TDBGrid;
    Panel7: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ts_log: TTabSheet;
    ts_modais: TTabSheet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pn_empresas: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    grid_sel_emp: TDBGrid;
    TabSheet2: TTabSheet;
    pn_sel_tabelas: TPanel;
    Panel10: TPanel;
    BitBtn4: TBitBtn;
    Panel9: TPanel;
    Splitter5: TSplitter;
    Splitter6: TSplitter;
    GroupBox6: TGroupBox;
    SpeedButton10: TSpeedButton;
    CheckListBoxTabNaoSelecionadas: TCheckListBox;
    GroupBox7: TGroupBox;
    SpeedButton11: TSpeedButton;
    CheckListBoxTabSelecionadas: TCheckListBox;
    GroupBox8: TGroupBox;
    ListBoxTabNaoRepl: TListBox;
    TabSheet3: TTabSheet;
    pn_edit_tabelas: TPanel;
    Panel11: TPanel;
    BitBtn3: TBitBtn;
    GroupBox9: TGroupBox;
    Panel12: TPanel;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Panel13: TPanel;
    ComboBoxExcetoCampo: TComboBox;
    grid_exceto_campos2: TDBGrid;
    GroupBox10: TGroupBox;
    Panel14: TPanel;
    ComboBoxCampoChave: TComboBox;
    Panel15: TPanel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    grid_campos_chave2: TDBGrid;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    grid_log: TDBGrid;
    pn_log_tabs: TPanel;
    clb_log_tabs: TCheckListBox;
    SpeedButton16: TSpeedButton;
    Panel20: TPanel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    SpeedButton17: TSpeedButton;
    Splitter7: TSplitter;
    procedure ts_logShow(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FSchema: TRepSchema;
    { Private declarations }
  public
    { Public declarations }
    property Schema: TRepSchema read FSchema write FSchema;
  end;

var
  frmCadEmpresaRepInterna: TfrmCadEmpresaRepInterna;

implementation

uses uDataSet_OOP, uDtmAtivo, uDadosIni, DB, StrUtils;

{$R *.dfm}

procedure TfrmCadEmpresaRepInterna.BitBtn6Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmCadEmpresaRepInterna.btSelectAllClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to clb_log_tabs.Count - 1 do
    clb_log_tabs.Checked[I] := True;
end;

procedure TfrmCadEmpresaRepInterna.btUnSelectAllClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to clb_log_tabs.Count - 1 do
    clb_log_tabs.Checked[I] := False;
end;

procedure TfrmCadEmpresaRepInterna.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FSchema.Free;

  Action := caFree;
  frmCadEmpresaRepInterna := nil;
end;

procedure TfrmCadEmpresaRepInterna.FormCreate(Sender: TObject);
begin
  inherited;
  FSchema := TRepSchema.Create;

  grid_schema.DataSource := FSchema._dataSourceOOP;
  grid_emp.DataSource := FSchema.Empresas._dataSourceOOP;
  grid_tabelas.DataSource := FSchema.Tabelas._dataSourceOOP;
  grid_exceto_campos.DataSource := FSchema.Tabelas.ExecetoCampo._dataSourceOOP;
  grid_exceto_campos2.DataSource := FSchema.Tabelas.ExecetoCampo._dataSourceOOP;
  grid_campos_chave.DataSource := FSchema.Tabelas.CamposWhere._dataSourceOOP;
  grid_campos_chave2.DataSource := FSchema.Tabelas.CamposWhere._dataSourceOOP;
end;

procedure TfrmCadEmpresaRepInterna.FormShow(Sender: TObject);
begin
  inherited;
  FSchema.Abrir;
  pg_repint.ActivePage := ts_conf;
  ts_modais.TabVisible := False;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton10Click(Sender: TObject);
var
	schema_id: Integer;
begin
	inherited;
	try
  	SpeedButton10.Enabled                  := false;
    SpeedButton11.Enabled                  := false;
    BitBtn4.Enabled                        := false;
    CheckListBoxTabNaoSelecionadas.Visible := false;
    CheckListBoxTabSelecionadas.Visible    := false;
  	schema_id := Schema.f_int('id');
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Adicionando tabelas');
    Schema.Tabelas.Inserir(schema_id, CheckListBoxTabSelecionadas, CheckListBoxTabNaoSelecionadas, ListBoxTabNaoRepl);
  finally
  	SpeedButton10.Enabled                  := true;
    SpeedButton11.Enabled                  := true;
    BitBtn4.Enabled                        := true;
    CheckListBoxTabNaoSelecionadas.Visible := true;
    CheckListBoxTabSelecionadas.Visible    := true;
	  vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton11Click(Sender: TObject);
var
	schema_id: Integer;
begin
  inherited;
  try
  	SpeedButton10.Enabled                  := false;
    SpeedButton11.Enabled                  := false;
    BitBtn4.Enabled                        := false;
    CheckListBoxTabNaoSelecionadas.Visible := false;
    CheckListBoxTabSelecionadas.Visible    := false;
  	schema_id := Schema.f_int('id');
  	Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Removendo tabelas');
    Schema.Tabelas.Remover(schema_id, CheckListBoxTabSelecionadas, CheckListBoxTabNaoSelecionadas, ListBoxTabNaoRepl);
  finally
  	SpeedButton10.Enabled                  := true;
    SpeedButton11.Enabled                  := true;
    BitBtn4.Enabled                        := true;
    CheckListBoxTabNaoSelecionadas.Visible := true;
    CheckListBoxTabSelecionadas.Visible    := true;
  	vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton12Click(Sender: TObject);
begin
  inherited;
	Schema.Tabelas.ExecetoCampo.Inserir(ComboBoxExcetoCampo.Items[ComboBoxExcetoCampo.ItemIndex]);
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton13Click(Sender: TObject);
begin
  inherited;
	Schema.Tabelas.ExecetoCampo.Remover;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  Schema.Tabelas.CamposWhere.Inserir(ComboBoxCampoChave.Items[ComboBoxCampoChave.ItemIndex]);
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton15Click(Sender: TObject);
begin
  inherited;
	Schema.Tabelas.CamposWhere.Remover;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  pn_log_tabs.Visible := not pn_log_tabs.Visible;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton17Click(Sender: TObject);
var
  tabs: TStrings;
  I: Integer;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  tabs := TStringList.Create;
  try
    for I := 0 to clb_log_tabs.Count - 1 do
      if clb_log_tabs.Checked[I] then
        tabs.Add(clb_log_tabs.Items[I]);

    Schema.Log.Abrir(tabs);
    grid_log.DataSource := Schema.Log._dataSourceOOP;
    grid_log.Visible    := Schema.Log.dataSet.RecordCount > 0;

    Panel18.Caption := IfThen(Schema.Log.dataSet.RecordCount = 0, 'Sem registros para apresentar');

  finally
    tabs.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Schema.Inserir;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Schema.Alterar;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Schema.Remover;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton4Click(Sender: TObject);
var
  empresas: TDataSet_OOP;
  empresa_id: Integer;
begin
  inherited;

  empresas := TDataSet_OOP.Create(Schema.buscas.Database);
  try
  	if Schema.IsEmpty then
    begin
    	Application.MessageBox(Pchar('Schema não informado'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if not vDadosIni.PesqPros('BAS441', 'INCLUIR', '', 'RI_SCHEMA_EMP', '', Schema.buscas, true) then
  		exit;

    empresas.ClientOpen('select cod_empresa, (cod_empresa || '' - '' || identificacao_emp) as empresa from empresa order by cod_empresa');
    empresas.dataSet.FieldByName('cod_empresa').Visible := False;
    grid_sel_emp.DataSource := empresas._dataSourceOOP;

    if not vDadosIni.abreForm('Selecione a empresa', pn_empresas, opFormsDefCadEsc) then
      Exit;

    empresa_id := empresas.fint('cod_empresa');

    Schema.Empresas.Inserir(empresa_id);

  finally
    empresas.Free;
  end;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  Schema.Empresas.Remover;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton7Click(Sender: TObject);
var
  tabelas: TDataSet_OOP;
  vidtabela: Integer;
  vnometabela: string;
  schema_id: Integer;
begin
  inherited;

  tabelas := TDataSet_OOP.Create(Schema.buscas.Database);
  try
  	if Schema.IsEmpty then
    begin
    	Application.MessageBox(Pchar('Schema não informado'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if Schema.Empresas.IsEmpty then
    begin
    	Application.MessageBox(Pchar('Empresa não informado'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if Schema.Tabelas.IsEmpty then
    begin
      Application.MessageBox(Pchar('Tabela não informado'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if not vDadosIni.PesqPros('BAS447', 'EDITAR/VISUALIZAR TABELA', 'SCHEMA: ' + IntToStr(schema_id),
    	'RI_SCHEMA_TAB', trim(Schema.Tabelas.dataSet.FieldByName('tabela').AsString), Schema.buscas, true) then
  		exit;

    vidtabela := Schema.Tabelas.dataSet.FieldByName('id').AsInteger;
    vnometabela := trim(Schema.Tabelas.dataSet.FieldByName('tabela').AsString);

    try
    	Screen.Cursor := crHourGlass;
      vDadosIni.abreStatusProcessamento('', 'Aguarde. Listando campos');
      Schema.Tabelas.editarTabelas(schema_id, ComboBoxExcetoCampo, ComboBoxCampoChave);
    finally
      vDadosIni.fechaStatusProcessamento;
      Screen.Cursor := crDefault;
    end;

    Schema.Tabelas.ExecetoCampo.Abrir(vidtabela);
    Schema.Tabelas.CamposWhere.Abrir(vidtabela);
    Schema.Tabelas.ExecetoCampo.vNomeTabela := vnometabela;
    Schema.Tabelas.CamposWhere.vNomeTabela := vnometabela;

    if not vDadosIni.abreForm('Selecione os campos chave e exceções' +
    	' - Tabela ' + vnometabela, pn_edit_tabelas, opFormsDefCadEsc) then
      Exit;
  finally
//    empresas.Free;
  end;
end;

procedure TfrmCadEmpresaRepInterna.SpeedButton9Click(Sender: TObject);
var
  tabelas: TDataSet_OOP;
  schema_id: Integer;
begin
  inherited;

  schema_id := Schema.fint('id');

  tabelas := TDataSet_OOP.Create(Schema.buscas.Database);
  try
  	if Schema.IsEmpty then
    begin
    	Application.MessageBox(Pchar('Schema não informado'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if Schema.Empresas.IsEmpty then
    begin
    	Application.MessageBox(Pchar('Empresa não informado'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if not vDadosIni.PesqPros('BAS444', 'VISUALIZAR TABELAS', 'SCHEMA: ' + IntToStr(schema_id),
    	'RI_SCHEMA_TAB', '', Schema.buscas, true) then
  		exit;

    try
    	Screen.Cursor := crHourGlass;
      vDadosIni.abreStatusProcessamento('', 'Aguarde. Montando lista de tabelas');
      Schema.Tabelas.atualizarCheckList(schema_id, CheckListBoxTabSelecionadas, CheckListBoxTabNaoSelecionadas, ListBoxTabNaoRepl);
    finally
      vDadosIni.fechaStatusProcessamento;
      Screen.Cursor := crDefault;
    end;

    if not vDadosIni.abreForm('Selecione as tabelas', pn_sel_tabelas, opFormsDefCadEsc) then
      Exit;
  finally
//    empresas.Free;
  end;
end;

procedure TfrmCadEmpresaRepInterna.ts_logShow(Sender: TObject);
begin
  inherited;
  if (clb_log_tabs.Count = 0) then
  begin
    clb_log_tabs.Clear;

    Schema.SqlOpen('select trim(c.tabela) tabela from (' +
                   ' select t.tabela from spdb_tables t' +
                   ' inner join spdb_emp_key(t.tabela) ek on 1=1' +
                   ' where ek.campo_emp <> '''' ' +
                   ' union all' +
                   ' select nr.tabela from spri_tables_notrep nr' +
                   ' ) as c' +
                   ' group by 1' +
                   ' having count(tabela) = 1' +
                   ' order by 1').First;
    while not Schema.buscas.Eof do
    begin
      clb_log_tabs.Items.Add(Schema.buscas.FieldByName('tabela').AsString);
      Schema.buscas.Next;
    end;
    Schema.buscas.Close;
    btSelectAll.Click;
  end;
end;

end.
