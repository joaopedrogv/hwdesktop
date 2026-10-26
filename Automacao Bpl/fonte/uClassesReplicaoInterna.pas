unit uClassesReplicaoInterna;

interface

uses
  uDataSet_OOP, DBClient, DB, IBQuery, Provider, Classes, CheckLst, StdCtrls;

type
  TipoTabela = (tabSelected, tabNotSelected, tabNotReplicable);
  TRepSchema = class;
  TRepSchemaEmpresa = class;
  TRepSchemaTabela = class;
  TRepSchemaExcetoCampo = class;
  TRepSchemaCampoWhere = class;

  TRepSchemaCampoWhere = class(TDataSet_OOP)
  private
  	FOwner: TRepSchemaTabela;
  public
  	constructor Create(AOwner: TRepSchemaTabela);
    destructor Destroy; override;
    procedure Abrir; overload;
    procedure Abrir(pTabela_id: Integer); overload;

    procedure Remover;
    procedure Inserir(campo: string);
  var
  	vNomeTabela: string;
  end;

  TRepSchemaExcetoCampo = class(TDataSet_OOP)
  private
  	FOwner: TRepSchemaTabela;
  public
  	constructor Create(AOwner: TRepSchemaTabela);
    destructor Destroy; override;
    procedure Abrir; overload;
    procedure Abrir(pTabela_id: Integer); overload;

    procedure Remover;
    procedure Inserir(campo: string);
  var
  	vNomeTabela: string;
  end;

	TRepSchemaEmpresa = class(TDataSet_OOP)
  private
    FOwner: TRepSchema;
  public
    constructor Create(AOwner: TRepSchema);
    destructor Destroy; override;

    procedure Abrir; overload;
    procedure Abrir(pSchema_id: Integer); overload;

    procedure Remover;
    procedure Inserir(pEmpresa_id: Integer);
  end;

	TRepSchemaTabela = class(TDataSet_OOP)
  private
    FOwner: TRepSchema;
    FCamposWhere: TRepSchemaCampoWhere;
    FExecetoCampo: TRepSchemaExcetoCampo;

    procedure TabelaAfterScroll(DataSet: TDataSet);
  public
    constructor Create(AOwner: TRepSchema);
    destructor Destroy; override;

    procedure Abrir; overload;
    procedure Abrir(pSchema_id: Integer); overload;

    procedure editarTabelas(pSchema_id: Integer; pComboboxExcetoCampo: TComboBox; pComboboxCampoChave: TComboBox);
    procedure atualizarCheckList(pSchema_id: Integer;
    	pCheckListBoxTabSel: TCheckListBox; pCheckListBoxTabNaoSel: TCheckListBox; pListBox: TListBox);
    procedure Inserir(pSchema_id: Integer;
    	pCheckListBoxTabSel: TCheckListBox; pCheckListBoxTabNaoSel: TCheckListBox; pListBox: TListBox); overload;//tabelas: TStrings); overload;
    procedure Remover(pSchema_id: Integer;
    	pCheckListBoxTabSel: TCheckListBox; pCheckListBoxTabNaoSel: TCheckListBox; pListBox: TListBox);  //tabelas: TStrings); overload;
    procedure Alterar(tabela: string; exceto, chaves: TStrings); overload;

    function GetTabelas(tipoTab: TipoTabela): TStrings;

    property CamposWhere:  TRepSchemaCampoWhere  read FCamposWhere  write FCamposWhere;
    property ExecetoCampo: TRepSchemaExcetoCampo read FExecetoCampo write FExecetoCampo;
  end;

  TRepSchemaLog = class(TDataSet_OOP)
  private
    procedure dataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create;
    procedure Abrir(tabelas: TStrings);
  end;

	TRepSchema = class(TDataSet_OOP)
  private
    FEmpresas: TRepSchemaEmpresa;
    FTabelas: TRepSchemaTabela;
    FLog: TRepSchemaLog;

    procedure SchemaAfterScroll(DataSet: TDataSet);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Abrir;

    procedure Remover;
    procedure Alterar;
    procedure Inserir;

    property Empresas: TRepSchemaEmpresa read FEmpresas write FEmpresas;
    property Tabelas: TRepSchemaTabela read FTabelas write FTabelas;
    property Log: TRepSchemaLog read FLog write FLog;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  uDtmAtivo,
  Dialogs,
  Windows,
  hw_utils;

{ TRepSchema }

procedure TRepSchema.Abrir;
begin
  ClientOpen('select * from ri_schema order by id');
  FEmpresas.Abrir;
  FTabelas.Abrir;
end;

procedure TRepSchema.Alterar;
var
	vIdSchema: Integer;
  nome: string;
begin
	if dataSet.IsEmpty then
  	raiseExceptionCreate('Nenhum registro para alterar');

  vIdSchema := fint('id');

  if not vDadosIni.PesqPros('BAS438', 'ALTERAR', '', 'RI_SCHEMA',  IntToStr(fint('id')), buscas, true) then
  	exit;
    
  nome := fstr('nome');// 'SCHEMA ' + IntToStr(SqlOpen('select max(id)maxid from ri_schema').FieldByName('maxid').AsInteger + 1);

  if not InputQuery('Nome do schema', 'Informe o nome do schema', nome) then
    Exit;

  nome := Trim(UpperCase(nome));

  try
    if nome = '' then
      raiseExceptionCreate('Nome do schema deve ser preenchido');

    if SqlOpen('select id from ri_schema where nome = %s and id <> %d', [QuotedStr(nome), fint('id')]).FieldByName('id').AsInteger > 0 then
      raiseExceptionCreate('Já existe schema com esse nome');

    SqlExec('update ri_schema set nome = %s where id = %d', [QuotedStr(nome), fint('id')]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS440', 'SALVAR', 'SUCESSO', 'RI_SCHEMA', IntToStr(vIdSchema), buscas);

    Refresh;

  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS440', 'SALVAR', 'FALHA', 'RI_SCHEMA', IntToStr(vIdSchema), buscas);
      registraErro('TRepSchema.Alterar ' + e.Message);
      ShowAtencao('Erro ao Alterar: ' + e.Message);
    end;
  end;
end;

constructor TRepSchema.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  FEmpresas := TRepSchemaEmpresa.Create(Self);
  FTabelas  := TRepSchemaTabela.Create(Self);
  FLog      := TRepSchemaLog.Create;
  dataSet.AfterScroll := SchemaAfterScroll;
end;

destructor TRepSchema.Destroy;
begin
  FEmpresas.Free;
  FTabelas.Free;
  FLog.Free;
  inherited;
end;

procedure TRepSchema.Inserir;
var
	vIdSchema: Integer;
  nome: string;
begin
  vIdSchema := 0;
  
	if not vDadosIni.PesqPros('BAS437', 'INLCUIR', '', 'RI_SCHEMA', '', buscas, true) then
  	exit;

  nome := 'SCHEMA ' + IntToStr(SqlOpen('select max(id)maxid from ri_schema').FieldByName('maxid').AsInteger + 1);

  if not InputQuery('Nome do schema', 'Informe o nome do schema', nome) then
    Exit;

  nome := Trim(UpperCase(nome));

  try
    if nome = '' then
      raiseExceptionCreate('Nome do schema deve ser preenchido');

    if SqlOpen('select id from ri_schema where nome = %s', [QuotedStr(nome)]).FieldByName('id').AsInteger > 0 then
      raiseExceptionCreate('Já existe schema com esse nome');

    SqlExec('insert into ri_schema (nome) values (%s)', [QuotedStr(nome)]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS440', 'SALVAR', 'SUCESSO', 'RI_SCHEMA', IntToStr(vIdSchema), buscas);

    Refresh;

  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS440', 'SALVAR', 'FALHA', 'RI_SCHEMA', IntToStr(vIdSchema), buscas);
      registraErro('TRepSchema.Inserir ' + e.Message);
      ShowAtencao('Erro ao inserir: ' + e.Message);
    end;
  end;
end;

procedure TRepSchema.Remover;
var
	vIdSchema: Integer;
begin
  try
    if dataSet.IsEmpty then
      raiseExceptionCreate('Nenhum registro para excluir');

    vIdSchema := fint('id');

    if not vDadosIni.PesqPros('BAS439', 'EXCLUIR', '', 'RI_SCHEMA',  IntToStr(vIdSchema), buscas, true) then
  		exit;

    if ShowConfirmacao('Ao excluir o schema, todos os objetos relacionados serão excluídos' + sLineBreak +
                       'Deseja excluir mesmo assim o registro?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> ID_YES then
      Exit;

    SqlExec('delete from ri_schema where id = %d', [fint('id')]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS439', 'EXCLUIR', 'SUCESSO', 'RI_SCHEMA', IntToStr(vIdSchema), buscas);

    Refresh;
    SchemaAfterScroll(dataSet);

  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS439', 'EXCLUIR', 'FALHA', 'RI_SCHEMA', IntToStr(vIdSchema), buscas);
      registraErro('TRepSchema.Alterar ' + e.Message);
      ShowAtencao('Erro ao Alterar: ' + e.Message);
    end;
  end;
end;

procedure TRepSchema.SchemaAfterScroll(DataSet: TDataSet);
begin
  FEmpresas.Abrir;
  FTabelas.Abrir;
  FTabelas.FExecetoCampo.Abrir(FTabelas.dataSet.FieldByName('id').AsInteger);
  FTabelas.FCamposWhere.Abrir(FTabelas.dataSet.FieldByName('id').AsInteger);
end;

{ TRepSchemaEmpresa }

procedure TRepSchemaEmpresa.Abrir;
begin
  ClientOpen('select r.schema_id, r.empresa_id , (r.empresa_id || '' - '' || e.identificacao_emp) empresa' +
             ' from ri_schema_emp r' +
             ' inner join empresa e on e.cod_empresa = r.empresa_id' +
             ' where schema_id = %d' +
             ' order by empresa_id', [FOwner.fint('id')]);
end;

procedure TRepSchemaEmpresa.Abrir(pSchema_id: Integer);
begin
	ClientOpen('select r.schema_id, r.empresa_id , (r.empresa_id || '' - '' || e.identificacao_emp) empresa' +
             ' from ri_schema_emp r' +
             ' inner join empresa e on e.cod_empresa = r.empresa_id' +
             ' where schema_id = %d' +
             ' order by empresa_id', [pSchema_id]);
end;

constructor TRepSchemaEmpresa.Create(AOwner: TRepSchema);
begin
  inherited Create(dtmAtivo.bancoHw);
  FOwner := AOwner;
end;

destructor TRepSchemaEmpresa.Destroy;
begin

  inherited;
end;

procedure TRepSchemaEmpresa.Inserir(pEmpresa_id: Integer);
var
	vIdSchema: Integer;
  vIdEmpresa: Integer;
begin
  try
  	if FOwner.fint('id') <= 0 then
    	raiseExceptionCreate('Schema não informado');

    if pEmpresa_id <= 0 then
      raiseExceptionCreate('Empresa não informada');

    vIdSchema := FOwner.fint('id');
    vIdEmpresa := pEmpresa_id;

    if SqlOpen('select empresa_id from ri_schema_emp where empresa_id = %d and schema_id = %d', [pEmpresa_id, FOwner.fint('id')]).FieldByName('empresa_id').AsInteger > 0 then
      raiseExceptionCreate('Já existe empresa para esse schema');

    SqlExec('insert into ri_schema_emp (schema_id, empresa_id) values (%d, %d)', [FOwner.fint('id'), pEmpresa_id]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS442', 'EXCLUIR', 'SCHEMA: ' + IntToStr(vIdSchema) + ' - SUCESSO',
    	'RI_SCHEMA_EMP', IntToStr(vIdEmpresa), buscas);

    Abrir(FOwner.fint('id'));

  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS442', 'EXCLUIR', 'SCHEMA: ' + IntToStr(vIdSchema) + ' - FALHA',
    	'RI_SCHEMA_EMP', IntToStr(vIdEmpresa), buscas);
      registraErro('TRepSchemaEmpresa.Inserir ' + e.Message);
      ShowAtencao('Erro ao inserir: ' + e.Message);
    end;
  end;
end;

procedure TRepSchemaEmpresa.Remover;
var
	vIdSchema: Integer;
  vIdEmpresa: Integer;
begin
  try
    if dataSet.IsEmpty then
      raiseExceptionCreate('Nenhum registro para excluir');

    vIdSchema  := fint('schema_id');
    vIdEmpresa := fint('empresa_id');

    if not vDadosIni.PesqPros('BAS442', 'EXCLUIR', 'SCHEMA: ' + IntToStr(vIdSchema),
    	'RI_SCHEMA_EMP',  IntToStr(vIdEmpresa), buscas, true) then
  		exit;

    if ShowConfirmacao('Ao excluir a empresa, todas a tabelas relacionadas não serão mais replicadas' + sLineBreak +
                       'Deseja excluir mesmo assim o registro?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> ID_YES then
      Exit;

    SqlExec('delete from ri_schema_emp where schema_id = %d and empresa_id = %d', [fint('schema_id'), fint('empresa_id')]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS442', 'EXCLUIR', 'SCHEMA: ' + IntToStr(vIdSchema) + ' - SUCESSO',
    	'RI_SCHEMA_EMP', IntToStr(vIdEmpresa), buscas);

    Refresh;

  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS442', 'EXCLUIR', 'SCHEMA: ' + IntToStr(vIdSchema) + ' - FALHA',
	    	'RI_SCHEMA_EMP', IntToStr(vIdEmpresa), buscas);
      registraErro('TRepSchema.Remover ' + e.Message);
      ShowAtencao('Erro ao Remover: ' + e.Message);
    end;
  end;
end;

{ TRepSchemaTabela }

procedure TRepSchemaTabela.Abrir;
begin
  ClientOpen('select * from ri_schema_tab' +
             ' where schema_id = %d' +
             ' and (select count(*) from spri_tables_notrep ' +
					   '		  where spri_tables_notrep.tabela = ri_schema_tab.tabela) = 0 ' +
             ' order by ri_schema_tab.tabela', [FOwner.fint('id')]);
end;

procedure TRepSchemaTabela.Abrir(pSchema_id: Integer);
begin
	ClientOpen('select * from ri_schema_tab' +
             ' where schema_id = %d' +
             ' and (select count(*) from spri_tables_notrep ' +
					   '		  where spri_tables_notrep.tabela = ri_schema_tab.tabela) = 0 ' +
             ' order by ri_schema_tab.tabela', [pSchema_id]);
end;

procedure TRepSchemaTabela.Alterar(tabela: string; exceto, chaves: TStrings);
begin


end;

procedure TRepSchemaTabela.atualizarCheckList(pSchema_id: Integer;
	pCheckListBoxTabSel: TCheckListBox; pCheckListBoxTabNaoSel: TCheckListBox; pListBox: TListBox);
begin
	 try
    dataSet.DisableControls;
   	dataSet.AfterScroll := nil;
  	ClientOpen('select d.tabela, d.schema_id from( ' +
    	' select c.tabela, c.schema_id from ( ' +
      ' select t.tabela, sc.id schema_id ' +
      ' from spdb_tables t ' +
      ' inner join ri_schema sc on sc.id = %d ' +
      ' left join  ri_schema_tab ts on ts.tabela = t.tabela ' +
      ' inner join spdb_emp_key(t.tabela) ek on 1=1 ' +
      ' where ek.campo_emp <> '''' ' +
      ' union all ' +
      ' select nr.tabela, sc.id schema_id from spri_tables_notrep nr ' +
      ' inner join ri_schema sc on sc.id = %d) as c ' +
      ' group by 1,2 ' +
      ' having count(tabela) = 1) as d ' +
      ' left join  ri_schema_tab ts on ts.schema_id = d.schema_id and ts.tabela = d.tabela ' +
      ' where ts.tabela is null ', [pSchema_id, pSchema_id]);

    pCheckListBoxTabNaoSel.Clear;
    pCheckListBoxTabSel.Clear;
    pListBox.Clear;

    dataSet.First;
    while not dataSet.Eof do
    begin
      pCheckListBoxTabNaoSel.Items.Add(trim(dataSet.FieldByName('tabela').AsString));

      dataSet.Next;
    end;

    ClientOpen('select tabela from ri_schema_tab ' +
      ' where schema_id = ' + IntToStr(pSchema_id) +
      ' order by 1 ');

    dataSet.First;
    while not dataSet.Eof do
    begin
      pCheckListBoxTabSel.Items.Add(trim(dataSet.FieldByName('tabela').AsString));

      dataSet.Next;
    end;

    ClientOpen('select tabela from spri_tables_notrep ' +
      ' order by 1 ');

    dataSet.First;
    while not dataSet.Eof do
    begin
      pListBox.Items.Add(trim(dataSet.FieldByName('tabela').AsString));

      dataSet.Next;
    end;
  finally
  	dataSet.AfterScroll := TabelaAfterScroll;
  	dataSet.EnableControls;
    Abrir(pSchema_id);
  end;
end;

constructor TRepSchemaTabela.Create(AOwner: TRepSchema);
begin
  inherited Create(dtmAtivo.bancoHw);
  FOwner := AOwner;
  FExecetoCampo := TRepSchemaExcetoCampo.Create(Self);
  FCamposWhere  := TRepSchemaCampoWhere.Create(Self);
  dataSet.AfterScroll := TabelaAfterScroll;
end;

destructor TRepSchemaTabela.Destroy;
begin
  ExecetoCampo.Free;
  CamposWhere.Free;
  inherited;
end;

procedure TRepSchemaTabela.editarTabelas(pSchema_id: Integer;
	pComboboxExcetoCampo, pComboboxCampoChave: TComboBox);
begin
  CamposWhere.ClientOpen('select rdb$relation_name as tabela, rdb$field_name campo from rdb$relation_fields ' +
    ' where rdb$relation_name = %s ' +
    ' order by rdb$field_name ', [QuotedStr(fstr('tabela'))]);

	try
  	pComboboxExcetoCampo.Clear;
	  pComboboxCampoChave.Clear;

    try
    	CamposWhere.dataSet.DisableControls;
      CamposWhere.dataSet.First;
      while not CamposWhere.dataSet.Eof do
      begin
        pComboboxExcetoCampo.Items.Add(trim(CamposWhere.dataSet.FieldByName('campo').AsString));
        pComboboxCampoChave.Items.Add(trim(CamposWhere.dataSet.FieldByName('campo').AsString));

        CamposWhere.dataSet.Next;
      end;
    finally
      CamposWhere.dataSet.EnableControls;
    end;

    if CamposWhere.dataSet.RecordCount > 0 then
    begin
      pComboboxExcetoCampo.ItemIndex := 0;
      pComboboxCampoChave.ItemIndex  := 0;
    end;
  finally
    CamposWhere.Abrir(fint('id'));
    ExecetoCampo.Abrir(fint('id'));
  end;
end;

function TRepSchemaTabela.GetTabelas(tipoTab: TipoTabela): TStrings;
begin
{  if tipoTab = tabNotReplicable then
    SqlOpen('select tabela from spdb_tables')
  else
    SqlOpen('select d.tabela, d.schema_id from(' +
            ' select c.tabela, c.schema_id from (' +
            '   select t.tabela, sc.id schema_id' +
            '   from spdb_tables t' +
            '     inner join ri_schema sc on sc.id = %d' +
            '     inner join spdb_emp_key(t.tabela) ek on 1=1' +
            '   where ek.campo_emp <> '''' ' +
            '   union distinct' +
            '   select nr.tabela, sc.id schema_id from spri_tables_notrep nr' +
            '     inner join ri_schema sc on sc.id = %d) as c' +
            '   group by 1,2' +
            '   having count(tabela) = 1) as d' +
            ' left join  ri_schema_tab ts on ts.schema_id = d.schema_id and ts.tabela = d.tabela' +
            ' where ts.tabela is %s null' +
            ' order by 1', [FOwner.fint('id'), FOwner.fint('id'), IfThen(tipoTab = tabSelected, 'not')]);

  buscas.First;
  while not buscas.Eof do
  
         }
end;

procedure TRepSchemaTabela.Inserir(pSchema_id: Integer;
	pCheckListBoxTabSel: TCheckListBox; pCheckListBoxTabNaoSel: TCheckListBox; pListBox: TListBox); //tabelas: TStrings);
var
	I: Integer;
  vNomeTabela: string;
begin
	try
  	if not vDadosIni.PesqPros('BAS445', 'INCLUIR', 'SCHEMA: ' + IntToStr(pSchema_id), 'RI_SCHEMA_TAB', '', buscas, true) then
  		exit;

    for I := 0 to pCheckListBoxTabNaoSel.Items.Count - 1 do
    begin
    	vNomeTabela := trim(pCheckListBoxTabNaoSel.Items[I]);

      if pCheckListBoxTabNaoSel.Checked[I] = true then
      begin
      	SqlExec(' insert into ri_schema_tab (schema_id, tabela) values (%d, %s); ', [pSchema_id, QuotedStr(vNomeTabela)]);

        vDadosIni.GravaAuditoria('BAS445', 'INCLUIR', 'SCHEMA: ' + IntToStr(pSchema_id) + ' TAB: ' + vNomeTabela, 'RI_SCHEMA_TAB', '', buscas);
      end;
    end;

	  CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS445', 'EXCLUIR', 'SCHEMA: ' + IntToStr(pSchema_id) + ' - SUCESSO', 'RI_SCHEMA_TAB', '', buscas);

    atualizarCheckList(pSchema_id, pCheckListBoxTabSel, pCheckListBoxTabNaoSel, pListBox);

    Refresh;
  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS445', 'EXCLUIR', 'SCHEMA: ' + IntToStr(pSchema_id) + ' - FALHA', 'RI_SCHEMA_TAB', '', buscas);
      registraErro('TRepSchemaTabela.Inserir ' + e.Message);
      ShowAtencao('Erro ao Inserir: ' + e.Message);
    end;
  end;
end;

procedure TRepSchemaTabela.Remover(pSchema_id: Integer;
	pCheckListBoxTabSel, pCheckListBoxTabNaoSel: TCheckListBox; pListBox: TListBox);
var
	I: Integer;
  vNomeTabela: string;
begin
	try
  	if not vDadosIni.PesqPros('BAS446', 'EXCLUIR', 'SCHEMA: ' + IntToStr(pSchema_id), 'RI_SCHEMA_TAB', '', buscas, true) then
  		exit;
      
    for I := 0 to pCheckListBoxTabSel.Items.Count - 1 do
    begin
    	vNomeTabela := trim(pCheckListBoxTabSel.Items[I]);

      if pCheckListBoxTabSel.Checked[I] = true then
      begin
      	SqlExec(' delete from ri_schema_tab where schema_id = %d and tabela = %s; ', [pSchema_id, QuotedStr(vNomeTabela)]);

        vDadosIni.GravaAuditoria('BAS446', 'EXCLUIR', 'SCHEMA: ' + IntToStr(pSchema_id) + ' TAB: ' + vNomeTabela, 'RI_SCHEMA_TAB', '', buscas);
      end;
    end;

    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS446', 'EXCLUIR', 'SCHEMA: ' + IntToStr(pSchema_id) + ' - SUCESSO', 'RI_SCHEMA_TAB', '', buscas);

    atualizarCheckList(pSchema_id, pCheckListBoxTabSel, pCheckListBoxTabNaoSel, pListBox);

    Refresh;
  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS446', 'EXCLUIR', 'SCHEMA: ' + IntToStr(pSchema_id) + ' - FALHA', 'RI_SCHEMA_TAB', '', buscas);
      registraErro('TRepSchemaTabela.Remover ' + e.Message);
      ShowAtencao('Erro ao Remover: ' + e.Message);
    end;
  end;
end;

procedure TRepSchemaTabela.TabelaAfterScroll(DataSet: TDataSet);
begin
	FExecetoCampo.Abrir(DataSet.FieldByName('id').AsInteger);
  FCamposWhere.Abrir(DataSet.FieldByName('id').AsInteger);
end;

{ TRepSchemaExcetoCampo }

procedure TRepSchemaExcetoCampo.Abrir;
begin
	ClientOpen(' select * from ri_schema_tab_exce ' +
  	' where ri_schema_tab_exce.tabela_id = %d ' +
    ' order by ri_schema_tab_exce.campo ', [FOwner.fint('id')]);
end;

procedure TRepSchemaExcetoCampo.Abrir(pTabela_id: Integer);
begin
	ClientOpen(' select * from ri_schema_tab_exce ' +
  	' where ri_schema_tab_exce.tabela_id = %d ' +
    ' order by ri_schema_tab_exce.campo ', [pTabela_id]);
end;

constructor TRepSchemaExcetoCampo.Create(AOwner: TRepSchemaTabela);
begin
	inherited Create(dtmAtivo.bancoHw);
  FOwner := AOwner;
end;

destructor TRepSchemaExcetoCampo.Destroy;
begin

  inherited;
end;

procedure TRepSchemaExcetoCampo.Inserir(campo: string);
var
	vIdTabela: Integer;
begin
	try
  	if FOwner.fint('id') <= 0 then
    	raiseExceptionCreate('Tabela não informado');

    vIdTabela := FOwner.fint('id');

    if not vDadosIni.PesqPros('BAS448', 'INCLUIR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela,
    	'RI_SCHEMA_TAB_EXCE', trim(campo), buscas, true) then
  		exit;

    if SqlOpen('select tabela_id from ri_schema_tab_exce where tabela_id = %d and campo = %s', [FOwner.fint('id'), QuotedStr(trim(campo))]).FieldByName('tabela_id').AsInteger > 0 then
      raiseExceptionCreate('Já existe o campo para esse exeção');

    SqlExec('insert into ri_schema_tab_exce (tabela_id, campo) values (%d, %s);', [FOwner.fint('id'), QuotedStr(trim(campo))]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS448', 'SALVAR', 'TABELA_ID: ' + IntToStr(vIdTabela)  + ' TABELA: ' + vNomeTabela + ' - SUCESSO', 'RI_SCHEMA_TAB_EXCE', trim(campo), buscas);

    Refresh;

  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS448', 'SALVAR', 'TABELA_ID: ' + IntToStr(vIdTabela)  + ' TABELA: ' + vNomeTabela + ' - FALHA', 'RI_SCHEMA_TAB_EXCE', trim(campo), buscas);
      registraErro('TRepSchemaExcetoCampo.Inserir ' + e.Message);
      ShowAtencao('Erro ao inserir: ' + e.Message);
    end;
  end;
end;

procedure TRepSchemaExcetoCampo.Remover;
var
	vIdTabela: Integer;
  vCampo: string;
begin
	try
    if dataSet.IsEmpty then
      raiseExceptionCreate('Nenhum registro para excluir');

    vIdTabela := fint('tabela_id');
    vCampo := fstr('campo');

    if not vDadosIni.PesqPros('BAS449', 'EXCLUIR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela, 'RI_SCHEMA_TAB_EXCE', trim(vCampo), buscas, true) then
  		exit;

    SqlExec('delete from ri_schema_tab_exce where tabela_id = %d and campo = %s;', [fint('tabela_id'), QuotedStr(fstr('campo'))]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS449', 'EXCLUIR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela + ' - SUCESSO', 'RI_SCHEMA_TAB_EXCE', trim(vCampo), buscas);

    Refresh;

  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS449', 'EXCLUIR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela + ' - FALHA', 'RI_SCHEMA_TAB_EXCE', trim(vCampo), buscas);
      registraErro('TRepSchemaExcetoCampo.Remover ' + e.Message);
      ShowAtencao('Erro ao Remover: ' + e.Message);
    end;
  end;
end;

{ TRepSchemaCampoWhere }

procedure TRepSchemaCampoWhere.Abrir;
begin
	ClientOpen(' select * from ri_schema_tab_where ' +
  	' where ri_schema_tab_where.tabela_id = %d ' +
    ' order by ri_schema_tab_where.campo ', [FOwner.fint('id')]);
end;

procedure TRepSchemaCampoWhere.Abrir(pTabela_id: Integer);
begin
	ClientOpen(' select * from ri_schema_tab_where ' +
  	' where ri_schema_tab_where.tabela_id = %d ' +
    ' order by ri_schema_tab_where.campo ', [pTabela_id]);
end;

constructor TRepSchemaCampoWhere.Create(AOwner: TRepSchemaTabela);
begin
	inherited Create(dtmAtivo.bancoHw);
  FOwner := AOwner;
end;

destructor TRepSchemaCampoWhere.Destroy;
begin

  inherited;
end;

procedure TRepSchemaCampoWhere.Inserir(campo: string);
var
	vIdTabela: Integer;
begin
	try
  	if FOwner.fint('id') <= 0 then
    	raiseExceptionCreate('Tabela não informado');

    vIdTabela := FOwner.fint('id');

    if not vDadosIni.PesqPros('BAS450', 'INCLUIR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela,
    	'RI_SCHEMA_TAB_WHERE', trim(campo), buscas, true) then
  		exit;

    if SqlOpen('select tabela_id from ri_schema_tab_where where tabela_id = %d and campo = %s', [FOwner.fint('id'), QuotedStr(trim(campo))]).FieldByName('tabela_id').AsInteger > 0 then
      raiseExceptionCreate('Já existe o campo para esse exeção');

    SqlExec('insert into ri_schema_tab_where (tabela_id, campo) values (%d, %s);', [FOwner.fint('id'), QuotedStr(trim(campo))]);

  	//SqlExec('update ri_schema_tab set tipo_id = 1 where id = %d;', [FOwner.fint('id')]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS450', 'SALVAR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela + ' - SUCESSO', 'RI_SCHEMA_TAB_WHERE', trim(campo), buscas);

    Refresh;

  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS450', 'SALVAR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela + ' - FALHA', 'RI_SCHEMA_TAB_WHERE', trim(campo), buscas);
      registraErro('TRepSchemaCampoWhere.Inserir ' + e.Message);
      ShowAtencao('Erro ao inserir: ' + e.Message);
    end;
  end;
end;

procedure TRepSchemaCampoWhere.Remover;
var
	vIdTabela: Integer;
  vCampo: string;
	vTipoId: boolean;
begin
	try
  	vTipoId := false;
    
    if dataSet.IsEmpty then
      raiseExceptionCreate('Nenhum registro para excluir');

  	vIdTabela := fint('tabela_id');
    vCampo := fstr('campo');

	  if not vDadosIni.PesqPros('BAS451', 'EXCLUIR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela, 'RI_SCHEMA_TAB_WHERE', trim(vCampo), buscas, true) then
  		exit;

    if dataSet.RecordCount <= 1 then
    	vTipoId := true;

    SqlExec('delete from ri_schema_tab_where where tabela_id = %d and campo = %s;', [fint('tabela_id'), QuotedStr(fstr('campo'))]);

//    if vTipoId then
//    	SqlExec('update ri_schema_tab set tipo_id = 0 where id = %d;', [fint('tabela_id')]);
      
    CommitaTransacao;

    vDadosIni.GravaAuditoria('BAS451', 'EXCLUIR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela + ' - SUCESSO', 'RI_SCHEMA_TAB_WHERE', trim(vCampo), buscas);

    Refresh;

  except on E: Exception do
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('BAS451', 'EXCLUIR', 'TABELA_ID: ' + IntToStr(vIdTabela) + ' TABELA: ' + vNomeTabela + ' - FALHA', 'RI_SCHEMA_TAB_WHERE', trim(vCampo), buscas);
      registraErro('TRepSchemaCampoWhere.Remover ' + e.Message);
      ShowAtencao('Erro ao Remover: ' + e.Message);
    end;
  end;
end;

{ TRepSchemaLog }

procedure TRepSchemaLog.Abrir(tabelas: TStrings);
var
  tabs: string;
  I: Integer;
begin
  tabs := '';
  for I := 0 to tabelas.Count - 1 do
    tabs := tabs + IfThen(tabs <> '', ',') + QuotedStr(tabelas[I]);

  tabs := IfThen(tabs <> '', ' where tabela in (' + tabs +') ');

  ClientOpen('select * from RI_TAB_LOG %s order by seqid desc', [tabs]);
  dataSet.FieldByName('exclusao').OnGetText := dataSetGetText;
  dataSet.FieldByName('exclusao').Alignment := taLeftJustify;
end;

constructor TRepSchemaLog.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
end;

procedure TRepSchemaLog.dataSetGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'EXCLUSAO' then
    Text := IfThen(fint('exclusao') = 1, 'Sim', 'Nao');
end;

end.
