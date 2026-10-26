unit AssineonRepo;

interface

uses
  HW.Servicos,
  BaseSingleton,
  AccountModel,
  ConfigurationModel,
  TemplateModel,
  ao_revisions_tags_class, TablesModel;

const
  HW_CONF_KEY = 'hw_assineon_api';
  HW_EMAIL_SUFIX = '@assineon.com.br';

type
  TParticipanteRevisao = (prCliente, prColaborador);

  TAssineOnRepo = class(THwServicos)
  strict private
    inicializado: Boolean;
  public
//    procedure Inicializar(params: string);
//    procedure InitRepo(params: string);

    function GetTableList(): TArray<TTable>;

    //account
    function GetAccount(): TConfigurationModel;
    function PostAccount(payload: TIntegrationModel): Boolean;

    //Revision
    function SetRevisionId(id: string; participante: TParticipanteRevisao): Boolean;
    function GetRevisionTagList(revision: TRevisionModel): TArray<TAo_revisions_tags_class>;
    function PostRevision(payload: TRevisionHwModel): Boolean;

    //Pessoas
    //talvez um metodo que junte todos os cpfs pelo id do cliente/colaborador, e das demais empresas

    //Docs
//    function GetDocuments()

  end;

  TAssineOnRepoSingleton = TSingleton<TAssineOnRepo>;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  hw_utils,
  Hw.Convert;

{ TAssineOnRepo }

function TAssineOnRepo.GetAccount: TConfigurationModel;
const D = 'GetAccount';
begin
  try
    var tokken := GetConfig(HW_CONF_KEY, CodEmpresa);

    Result := TConfigurationModel.Create;

    Result.cnpj := Self.CnpjEmp;
    Result.bearerToken := tokken.ReadString('Account', 'Token');
    Result.ClienteRevisaoId := tokken.ReadString('Revisoes', 'ClienteRevisaoId');
    Result.ColaboradorRevisaoId := tokken.ReadString('Revisoes', 'ColaboradorRevisaoId');
    Result.email := StrConcat(['hw.', Self.CnpjEmp, HW_EMAIL_SUFIX])

  except
    on E: Exception do
    begin
      LogError('%s.%s - %s', [Self.ClassName, D, e.Message]);
      raise Exception.Create(StrConcat(['Erro ao obter dados da conta', _DLB, E.Message]));
    end;
  end;
end;

function TAssineOnRepo.GetRevisionTagList(
  revision: TRevisionModel): TArray<TAo_revisions_tags_class>;
const D = 'GetRevisionTagList';
begin
  try
    Result := [];

    var tabsDb := GetTableList();

    var tagsDb := Converter.NewArrayObj<TAo_revisions_tags_class>(
      SqlOpen('select * from ao_revisions_tags' +
              ' where templateId = ''%s'' and revisionId = ''%s'' and empresaid = %d',
              [revision.templateId, revision.revisionId, CodEmpresa]));

    for var tagName in revision.tagList do
      if not tagName.Contains(':') then
      begin
        var rev := TAo_revisions_tags_class.Create;
        rev.templateid := revision.templateId;
        rev.revisionid := revision.revisionId;
        rev.empresaid := CodEmpresa;
        rev.name := tagName;

        for var tagDb in tagsDb do
          if tagDb.name.Equals(rev.name) then
          begin
            rev.tablename := tagDb.tablename;
            rev.fieldname := tagDb.fieldname;
            Break;
          end;

        if rev.tablename.Trim.IsEmpty and rev.fieldname.Trim.IsEmpty then
          for var tab in tabsDb do
            for var field in tab.fieldNames do
            if tagName.ToUpper.Equals(tab.name.ToUpper + '_' +  field.ToUpper)  then
            begin
              rev.tablename := tab.name.ToUpper;
              rev.fieldname := field.ToUpper;
            end;

        Result := Result + [rev];
      end;

  except
    on E: Exception do
    begin
      LogError('%s.%s - %s', [Self.ClassName, D, e.Message]);
      raise Exception.Create(StrConcat(['Erro ao obter tags do modelo/revisão do banco de dados', _DLB, E.Message]));
    end;
  end;
end;

function TAssineOnRepo.GetTableList: TArray<TTable>;
const D = 'GetTableList';
begin
  try
    Result := [];

    var tab := TTable.Create;
    tab.name := 'CLIENTES';
    Result := Result + [tab];

    tab := TTable.Create;
    tab.name := 'COLABORADOR';
    Result := Result + [tab];

    tab := TTable.Create;
    tab.name := 'EMPRESA';
    Result := Result + [tab];

    for tab in Result do
    begin
      tab.fieldNames := [];
      Client.Open('select f.fieldname from spdb_fields(''%s'') f order by f.fieldname', [tab.name]).First;

//  exit;
      while not Client.Eof do
      begin
//        Client.DataSet.Fields[0].AsString;//.('fieldname');
//        Client.DataSet.FieldByName('fieldname').AsString;

        tab.fieldNames := tab.fieldNames + [Client.fstr('fieldname')];//tab.fieldNames.Add(Client.fstr('fieldname'));
        Client.Next;
      end;
      Client.Close;

      if MatchText(tab.name, ['CLIENTES', 'COLABORADOR']) then
        tab.fieldNames := tab.fieldNames + ['SIGLA_UF'];
        //tab.fieldNames.Add('SIGLA_UF');
    end;

  except
    on E: Exception do
    begin
      LogError('%s.%s - %s', [Self.ClassName, D, e.Message]);
      raise Exception.Create(StrConcat(['Erro ao obter tabelas e campos do banco de dados', _DLB, E.Message]));
    end;
  end;
end;

function TAssineOnRepo.PostAccount(payload: TIntegrationModel): Boolean;
const D = 'PostAccount';
begin
  try
    var account := GetConfig(HW_CONF_KEY, CodEmpresa);
    account.WriteString('Account', 'Token', payload.token);
    SaveConfig(account);
//    SqlExec().Transaction.Commit;

    Result := True;

  except
    on E: Exception do
    begin
      LogError('%s.%s - %s', [Self.ClassName, D, e.Message]);
      raise Exception.Create(StrConcat(['Erro ao salvar dados da conta', _DLB, E.Message]));
    end;
  end;
end;

function TAssineOnRepo.PostRevision(payload: TRevisionHwModel): Boolean;
const D = 'PostRevision';
begin
  try
    //quando tiver e se tiver a tabela com id do modelo e id da revisao salvar aqui




    //salvando tags
    SqlExec('delete from ao_revisions_tags' +
            ' where templateid = ''%s'' and revisionid = ''%s'' and empresaid = %d',
            [payload.templateId, payload.revisionId, CodEmpresa]);

    for var tag in payload.tagsHW do
      SqlExec(tag.SQLMotor().SQLUpdateOrInsert);

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;

  except
    on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      LogError('%s.%s - %s', [Self.ClassName, D, e.Message]);
      raise Exception.Create(StrConcat(['Erro ao salvar dados do Modelo/Revisao', _DLB, E.Message]));
    end;
  end;
end;

function TAssineOnRepo.SetRevisionId(id: string;
  participante: TParticipanteRevisao): Boolean;
const D = 'SetRevisionId';
begin
  try
    var account := GetConfig(HW_CONF_KEY, CodEmpresa);
    var key := IfThen(participante = prCliente, 'ClienteRevisaoId') +
               IfThen(participante = prColaborador, 'ColaboradorRevisaoId');
    account.WriteString('Revisoes', key, id);

    SaveConfig(account);

    Result := True;

  except
    on E: Exception do
    begin
      LogError('%s.%s - %s', [Self.ClassName, D, e.Message]);
      raise Exception.Create(StrConcat(['Erro ao salvar dados da conta', _DLB, E.Message]));
    end;
  end;
end;

end.
