unit uClassesDesoneracao;

interface   

uses
  Contnrs,
  Classes,
  DB,
  IBDatabase,
  IBQuery,
  DBClient,
  uDataSet_OOP,
  desoneracao_class,
  desoneracao_regras_class,
  desoneracao_excecoes_class;

type
  TDesoneracao = class;
  TDesoneracao_Regras = class;//(); criar a class e a lista
  TDesoneracao_Excecoes = class;//(); criar a class e a lista


  TDesoneracao_Regras = class(TDesoneracao_regras_classList)
  private
    FOwner  : TDesoneracao;
    Fdeleted: TDesoneracao_regras_classList;
    Fcurrent: TDesoneracao_regras_class;
  public
    constructor Create(AOwner: TDesoneracao);
    destructor Destroy; override;
    procedure Clear; override;
    procedure DeleteItem(Index: Integer); override;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); override;

    property deleted: TDesoneracao_regras_classList read Fdeleted;
    property current: TDesoneracao_regras_class read Fcurrent write Fcurrent;
  end;

  TDesoneracao_Excecoes = class(TDesoneracao_excecoes_classList)
  private
    FOwner  : TDesoneracao;
    Fdeleted: TDesoneracao_excecoes_classList;
  public
    constructor Create(AOwner: TDesoneracao);
    destructor Destroy; override;
    procedure Clear; override;
    procedure DeleteItem(Index: Integer); override;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); override;
    procedure Incluir(Ancm: string);

    property deleted: TDesoneracao_excecoes_classList read Fdeleted;
  end;

  TDesoneracao = class(TDataSet_OOP)
  private
    Fobjeto: TDesoneracao_class;
    Fexcecoes: TDesoneracao_Excecoes;
    Fregras: TDesoneracao_Regras;
  public
    constructor Create();
    destructor Destroy; override;
    function Edit: Boolean; override;
    function Insert: Boolean;
    function Post: Boolean;
    function Delete: Boolean;

    property regras: TDesoneracao_Regras read Fregras write Fregras ;
    property excecoes: TDesoneracao_Excecoes read Fexcecoes write Fexcecoes;
    property objeto: TDesoneracao_class read Fobjeto write Fobjeto;
  end;

var
  deson: TDesoneracao;

implementation

uses
  uDtmAtivo,
  SysUtils,
  StrUtils,
  Windows,
  Forms,
  base_class, 
  FieldsConfigUnit,
  hw_auditoria_class,
  uCadDesoneracao;

procedure desoneracao_show(Amodal: Boolean);
begin
  vDadosIni.vTipoForm := 0;
  if not Assigned(frmCadDesoneracao) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm(TfrmCadDesoneracao, frmCadDesoneracao);
  end;

  if (Amodal) and (not frmCadDesoneracao.Visible) then
    frmCadDesoneracao.ShowModal
  else if (not frmCadDesoneracao.Visible) then
    frmCadDesoneracao.Show
  else if frmCadDesoneracao.FormStyle = fsMDIChild then
    frmCadDesoneracao.Show
  else
    frmCadDesoneracao.ShowModal;
end;

exports
  desoneracao_show;

{ TDesoneracao }

constructor TDesoneracao.Create;
begin
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_deson');

  Fobjeto := TDesoneracao_class.Create;
  Fregras := TDesoneracao_Regras.Create(Self);
  Fexcecoes := TDesoneracao_Excecoes.Create(Self);
  TableName := 'DESONERACAO';

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('cod_empresa,ativo', fvInvisivel)
      .Add('id', fvSempreVisivel)
  );
end;

function TDesoneracao.Delete: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  try
    Fobjeto.SetValuesFrom(dataSet);
    
    if not vDadosIni.PesqPros('PRO325', 'EXCLUIR', Format('%d - %s - %d', [Fobjeto.id, Fobjeto.descricao, Fobjeto.ind_desoneracao]),
      TableName, IntToStr(Fobjeto.id), buscas) then
      exit;

    SqlExec(Fobjeto.SQLMotor().SQLDelete);

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;                  
    DataSet.Refresh;

    vDadosIni.GravaAuditoria('PRO325', 'EXCLUIR', 'SUCESSO', TableName, '', buscas);

  except on E: Exception do
    begin
      Fobjeto.cancelChanges;
      transacao.Rollback;
      vDadosIni.ShowErro('Erro ao excluir desoneração. Erro: %s', [e.Message]);
      vDadosIni.registraErro('TDesoneracao.Delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TDesoneracao.Destroy;
begin
  FreeAndNil(Fobjeto);
  FreeAndNil(Fregras);
  FreeAndNil(Fexcecoes);
  FreeDbComponents(True);
  inherited;
end;

function TDesoneracao.Edit: Boolean;
begin
  Result := False;

  dataSet.RefreshRecord;

  if not vDadosIni.PesqPros('PRO324', 'ALTERAR', Format('%d - %s - %s', [f_int('id'), f_str('descricao'), f_str('ind_desoneracao')]),
    TableName, f_str('id'), buscas) then
    Exit;

  Result := inherited Edit;
  if Result then
  begin
    Fobjeto := TDesoneracao_class.Create;
    Fobjeto.SetValuesFrom(SqlOpen('select %s from desoneracao where id = %d and cod_empresa = %d',
                                       [TDesoneracao_class.GetFieldsSql(), fint('id'), fint('cod_empresa')]));
    Fobjeto.beginChanges;

    Fregras.Clear;
    Fregras.SetValuesFrom(SqlOpen('select %s from desoneracao_regras where desoneracaoid = %d and cod_empresa = %d',
                                  [TDesoneracao_regras_class.GetFieldsSql(), Fobjeto.id, Fobjeto.cod_empresa]));
                                  
    Fexcecoes.Clear;
    Fexcecoes.SetValuesFrom(SqlOpen('select %s from desoneracao_excecoes where desoneracaoid = %d and cod_empresa = %d',
                                    [TDesoneracao_excecoes_class.GetFieldsSql(), Fobjeto.id, Fobjeto.cod_empresa]));
  end;
end;

function TDesoneracao.insert: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('PRO323', 'INSERIR', '',
    TableName, '', buscas) then
    exit;

  if not dataSet.Active then
    montaSelect('select %s from desoneracao where id = 0 and cod_empresa = 0');

  Result := inherited Insert;
  if Result then
  begin
    Fobjeto := TDesoneracao_class.Create;
    Fobjeto.beginChanges(True);

    Fregras.Clear;
    Fexcecoes.Clear;

    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  end;
end;

function TDesoneracao.post: Boolean;
var
  I: Integer;
  Aacao: string;
  ListaAuditoria: THw_auditoria_classList;
begin
  Result := False;

  Aacao := IfThen(dataSet.State = dsInsert, 'INSERIR', 'EDITAR');
  if not vDadosIni.PesqPros('PRO326', Aacao, Format('%d - %s - %d', [Fobjeto.id, Fobjeto.descricao, Fobjeto.ind_desoneracao]),
    TableName, IntToStr(Fobjeto.id), buscas) then
    exit;

  try
    checkFieldEmpty('descricao', 'Descrição precisa ser preenchida', '');
    checkFieldEmpty('ind_desoneracao', 'Indicador do motivo da desoneração não preenchido', '');

    if Fregras.Count = 0 then
      if vDadosIni.ShowConfirmacao('Sem regras configuradas. Continuar mesmo assim?') <> ID_YES then
        Exit;

    Fobjeto.beginChanges;
    Fobjeto.SetValuesFrom(dataSet);

    ListaAuditoria := THw_auditoria_classList.Create;
    try

      with Fobjeto.SQLMotor('id') do
      begin
        Options.FieldsInInsertUpdate := fsNewDifOld;// [muCheckModified];
        if Fobjeto.id = 0 then
        begin
          Fobjeto.id := SqlInsertID(SQLInsertAutoInc, autoIncField);
          ListaAuditoria.New('PRO323', 'INSERIR', Format('%d - %s - %d', [Fobjeto.id, Fobjeto.descricao, Fobjeto.ind_desoneracao]), TableName, IntToStr(Fobjeto.id));
        end
        else if HasChanges then
        begin
          SqlExec(SQLUpdate);
          ListaAuditoria.New('PRO324', 'ALTERAR', Fobjeto.StrChanges, TableName, IntToStr(Fobjeto.id));
        end;
      end;

      for I := 0 to Fregras.Count - 1 do with Fregras.Items[I] do if recordState in [rsNew, rsUpdated] then
      begin
        desoneracaoid := Fobjeto.id;
        cod_empresa   := Fobjeto.cod_empresa;
        with SQLMotor('id_regras') do                                     
        begin
          Options.FieldsInInsertUpdate := fsNewDifOld;// [muCheckModified];
          if id_regras = 0 then
          begin
            id_regras := SqlInsertID(SQLInsertAutoInc, autoIncField);
            ListaAuditoria.New('PRO327', 'INCLUIR', Format('%d - %s [%d - %s - %s]', [fint('id'), fstr('descricao'), id_regras, sigla_uf, csts]), MetaTable.name, IntToStr(id_regras));
          end
          else if HasChanges then
          begin
            SqlExec(SQLUpdate);
            ListaAuditoria.New('PRO328', 'ALTERAR', StrChanges, MetaTable.name, IntToStr(id_regras));
          end;
        end;
      end;

      for I := 0 to Fexcecoes.Count - 1 do with Fexcecoes.Items[I] do if recordState in [rsNew, rsUpdated] then
      begin
        desoneracaoid := Fobjeto.id;
        cod_empresa   := Fobjeto.cod_empresa;
        with SQLMotor() do
        begin
          Options.FieldsInInsertUpdate := fsAllFields;// [muCheckModified];
          SqlExec(SQLUpdateOrInsert);
          ListaAuditoria.New('PRO331', 'SALVAR', ncm, MetaTable.name, ncm);
        end;
      end;

      for I := 0 to Fregras.deleted.Count - 1 do with Fregras.deleted.Items[I] do if desoneracaoid > 0 then
        with SQLMotor() do
        begin
          SqlExec(SQLDelete);
          ListaAuditoria.New('PRO330', 'EXCLUIR', 'EXCLUIDO - ' + Format('%d - %s [%d - %s - %s]', [fint('id'), fstr('descricao'), id_regras, sigla_uf, csts]), MetaTable.name, IntToStr(id_regras));
        end;

      for I := 0 to Fexcecoes.deleted.Count - 1 do with Fexcecoes.deleted.Items[I] do if desoneracaoid > 0 then
        with SQLMotor() do
        begin
          SqlExec(SQLDelete);
          ListaAuditoria.New('PRO332', 'EXCLUIR', 'EXCLUIDO - ' + Format('%d - %s [%s]', [fint('id'), fstr('descricao'), ncm]), MetaTable.name, ncm);
        end;

      if transacao.InTransaction then
        transacao.Commit;

      Result := True;
      DataSet.Cancel;
      DataSet.Refresh;

      for I := 0 to ListaAuditoria.Count - 1 do with ListaAuditoria.Items[I] do
        vDadosIni.Auditoria(cod_processo, acao, mensagem, tabela, codigo);

      vDadosIni.GravaAuditoria('PRO326', Aacao, 'SUCESSO', TableName, IntToStr(Fobjeto.id), buscas);

    finally
      FreeAndNil(ListaAuditoria);
    end;

  except on E: Exception do
    begin
      Fobjeto.cancelChanges;
      transacao.Rollback;
      vDadosIni.ShowErro('Erro ao salvar dados da desoneração. Erro: %s', [e.Message]);
      vDadosIni.registraErro('TDesoneracao.post Erro: ' + e.Message);
    end;
  end;
end;

{ TDesoneracao_Excecoes }

procedure TDesoneracao_Excecoes.Clear;
begin
  inherited;
  if Assigned(Fdeleted) then  
    Fdeleted.Clear;
end;

constructor TDesoneracao_Excecoes.Create(AOwner: TDesoneracao);
begin
  FOwner   := AOwner;
  Fdeleted := TDesoneracao_excecoes_classList.Create;
end;

procedure TDesoneracao_Excecoes.DeleteItem(Index: Integer);
begin
  if OutOfBounds(Index) then
    Exit;

  with FOwner do with Self.Items[Index] do
    if not vDadosIni.PesqPros('PRO332', 'EXCLUIR', Format('%d - %s [%s]', [fint('id'), fstr('descricao'), ncm]),
      'DESONERACAO_EXCECOES', '', buscas, False) then
      Exit;

  Self.Items[Index].recordState := rsDeleted;
  Fdeleted.Add(Self.Items[Index].Clone);
  inherited DeleteItem(Index);
end;

destructor TDesoneracao_Excecoes.Destroy;
begin
  inherited;
  FreeAndNil(Fdeleted);
end;

procedure TDesoneracao_Excecoes.Incluir(Ancm: string);
var
  I: Integer;
  excecao: TDesoneracao_excecoes_class;
begin

  Ancm := vDadosIni.apenasNumeros(Ancm);
  if Length(Ancm) <> 8 then
    raise exception.Create('NCM inválido. Apenas números e com tamanho de 8 caractéres');

  for I := 0 to Self.Count - 1 do
    if Self.Items[I].ncm = Ancm then
      raise exception.Create('NCM já consta na lista');

  excecao := TDesoneracao_excecoes_class.Create;
  excecao.ncm := Ancm;
  excecao.recordState := rsNew;

  AddItem(excecao);
end;

procedure TDesoneracao_Excecoes.SetValuesFrom(ADataSet: TDataSet;
  AcheckFields: Boolean);
begin
  inherited;
  if Assigned(FChange) then
    FChange(Self);  
end;

{ TDesoneracao_Regras }

procedure TDesoneracao_Regras.Clear;
begin
  inherited;
  if Assigned(Fdeleted) then
    Fdeleted.Clear;
end;

constructor TDesoneracao_Regras.Create(AOwner: TDesoneracao);
begin
  FOwner   := AOwner;
  Fdeleted := TDesoneracao_regras_classList.Create;
end;

procedure TDesoneracao_Regras.DeleteItem(Index: Integer);
begin
  if OutOfBounds(Index) then
    Exit;

  with FOwner do with Self.Items[Index] do
    if not vDadosIni.PesqPros('PRO330', 'EXCLUIR', Format('%d - %s [%d - %s - %s]', [fint('id'), fstr('descricao'), id_regras, sigla_uf, csts]),
      'DESONERACAO_REGRAS', '', buscas, False) then
      Exit;

  Self.Items[Index].recordState := rsDeleted;
  Fdeleted.Add(Self.Items[Index].Clone);
  inherited DeleteItem(Index);
end;

destructor TDesoneracao_Regras.Destroy;
begin
  inherited;
  FreeAndNil(Fdeleted);
end;

procedure TDesoneracao_Regras.SetValuesFrom(ADataSet: TDataSet;
  AcheckFields: Boolean);
begin
  inherited;
  if Assigned(FChange) then
    FChange(Self);
end;

end.
