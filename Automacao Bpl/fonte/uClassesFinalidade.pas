unit uClassesFinalidade;

interface

uses
  Contnrs,
  Classes,
  DB,
  IBDatabase,
  IBQuery,
  DBClient,
  uDataSet_OOP,
  finalidade_class;

type
  TFinalidade = class;

  TFinalidade = class(TDataSet_OOP)
  private
    Fobjeto: TFinalidade_class;
  public
    constructor Create();
    destructor Destroy; override;
    function Edit: Boolean; override;
    function Insert: Boolean;
    function Post: Boolean;
    function Delete: Boolean;

    property objeto: TFinalidade_class read Fobjeto write Fobjeto;
  end;

var
  finalidade: TFinalidade;

implementation

uses
  SysUtils,
  StrUtils,
  Forms,
  uDtmAtivo, 
  FieldsConfigUnit,
  uCadFinalidade,
  base_class;

procedure finalidade_show(Amodal: Boolean);
begin
  vDadosIni.vTipoForm := 0;
  if not Assigned(frmCadFinalidade) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm(TfrmCadFinalidade, frmCadFinalidade);
  end;
  if frmCadFinalidade.FormStyle = fsMDIChild then
    frmCadFinalidade.Show
  else
    frmCadFinalidade.ShowModal;
end;

exports
  finalidade_show;

{ TFinalidade }

constructor TFinalidade.Create;
begin
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_finalidade');
  Fobjeto := TFinalidade_class.Create;
  TableName := 'FINALIDADE';

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('cod_empresa,ativo', fvInvisivel)
      .Add('id', fvSempreVisivel)
  );
end;

function TFinalidade.Delete: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  try
    Fobjeto.SetValuesFrom(dataSet);

    if not vDadosIni.PesqPros('CLI248', 'EXCLUIR', Format('%d - %s', [Fobjeto.id, Fobjeto.descricao]),
      TableName, IntToStr(Fobjeto.id), buscas) then
      exit;

    SqlExec(Fobjeto.SQLMotor().SQLDelete);

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;                  
    DataSet.Refresh;

    vDadosIni.GravaAuditoria('CLI248', 'EXCLUIR', 'SUCESSO', TableName, IntToStr(Fobjeto.id), buscas);

  except on E: Exception do
    begin
      Fobjeto.cancelChanges;
      transacao.Rollback;
      vDadosIni.ShowErro('Erro ao excluir finalidade. Erro: %s', [e.Message]);
      vDadosIni.registraErro('TFinalidade.Delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TFinalidade.Destroy;
begin
  FreeDbComponents(True);
  inherited;
end;

function TFinalidade.Edit: Boolean;
begin
  Result := False;

  dataSet.RefreshRecord;
         
  if not vDadosIni.PesqPros('CLI247', 'ALTERAR', Format('%d - %s', [f_int('id'), f_str('descricao')]),
    TableName, f_str('id'), buscas) then
    Exit;

  Result := inherited Edit;
  if Result then
  begin
    Fobjeto := TFinalidade_class.Create;
    Fobjeto.SetValuesFrom(SqlOpen('select %s from finalidade where id = %d and cod_empresa = %d',
                                       [TFinalidade_class.GetFieldsSql(), fint('id'), fint('cod_empresa')]));
    //Fobjeto.beginChanges;
  end;
end;

function TFinalidade.Insert: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CLI246', 'INSERIR', '',
    TableName, '', buscas) then
    exit;

  if not dataSet.Active then
    montaSelect('select %s from %s where id = 0 and cod_empresa = 0', [TFinalidade_class.GetFieldsSql(), TableName]);

  Result := inherited Insert;
  if Result then
  begin
    Fobjeto := TFinalidade_class.Create;
    Fobjeto.beginChanges(True);

    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  end;
end;

function TFinalidade.Post: Boolean;
var
  Aacao: string;
begin
  Result := False;

  Aacao := IfThen(dataSet.State = dsInsert, 'INSERIR', 'EDITAR');
  if not vDadosIni.PesqPros('CLI249', Aacao, Format('%d - %s', [Fobjeto.id, Fobjeto.descricao]),
    TableName, f_str('id'), buscas) then
    exit;

  try
    checkFieldEmpty('descricao', 'Descrição precisa ser preenchida', '');

    Fobjeto.beginChanges;
    Fobjeto.SetValuesFrom(dataSet);

    with Fobjeto.SQLMotor('id') do
    begin
      Options.FieldsInInsertUpdate := fsNewDifOld;// [muCheckModified];
      if Fobjeto.id = 0 then
      begin
        Fobjeto.id := SqlInsertID(SQLInsertAutoInc, autoIncField);
        vDadosIni.Auditoria('CLI246', 'INSERIR', Format('%d - %s', [Fobjeto.id, Fobjeto.descricao]), TableName, IntToStr(Fobjeto.id));
      end
      else if HasChanges then
      begin
        SqlExec(SQLUpdate);
        vDadosIni.Auditoria('CLI247', 'ALTERAR', Fobjeto.StrChanges, TableName, IntToStr(Fobjeto.id));
      end;
    end;

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;
    DataSet.Cancel;
    DataSet.Refresh;

    vDadosIni.GravaAuditoria('CLI249', Aacao, 'SUCESSO', TableName, IntToStr(Fobjeto.id), buscas);

  except on E: Exception do
    begin
      Fobjeto.cancelChanges;
      transacao.Rollback;
      vDadosIni.ShowErro('Erro ao salvar dados da finalidade. Erro: %s', [e.Message]);
      vDadosIni.registraErro('TFinalidade.post Erro: ' + e.Message);
    end;
  end;
end;

end.

