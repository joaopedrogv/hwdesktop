unit uClassesCEST;

interface

uses
  Contnrs,
  Classes,
  DB,
  IBDatabase,
  IBQuery,
  DBClient,
  uDataSet_OOP,
  cest__class,
  cest_variante_class,
  cest_ncm_class,
  cest_mva_class,
  cest_mva_uf_class,
  CestVarianteMvaNcmUf_Model,
  CestMvaVariante_Model,
  uCadCEST_ConsultaDet;

type
  TCEST_ = class;

  TCEST_Exclusao = class(Tobject)
  private
    FNCMs: TCest_ncms_class;
    FMVAs: TCest_mvas_class;
    FUFs : TCest_mva_ufs_class;
  public
    constructor Create;
    destructor Destroy; override;

    property NCMs: TCest_ncms_class    read FNCMs write FNCMs;
    property MVAs: TCest_mvas_class    read FMVAs write FMVAs;
    property UFs : TCest_mva_ufs_class read FUFs  write FUFs;
  end;

  TCEST_ = class(TDataSet_OOP)
  private
    Fobjeto: TCestM;
    Fexclusoes: TCEST_Exclusao;
    FChange: TNotifyEvent;
    FCestItemAmbitos: TCestItemAmbitosM;
    procedure DataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure check_variante_regra_geral;
  public
    constructor Create();
    destructor Destroy; override;
    function Edit: Boolean; override;
    function Insert: Boolean;
    function Post: Boolean;
    function Delete: Boolean;
    function Restaurar: Boolean;

    function GetCestItemText(Cest: string): string;
    function GetCestAmbitoText(Cest: string; Ambito: Integer): string;

    property objeto   : TCestM         read Fobjeto    write Fobjeto;
    property exclusoes: TCEST_Exclusao read Fexclusoes write Fexclusoes;
    property OnChange : TNotifyEvent   read FChange    write FChange;
  end;

  TCest_Consulta = class(TDataSet_OOP)
  private
//    FDados       : TCestGs;
//    FClientMVA   : TDataSet_OOP;
//    FClientMVA_AJ: TDataSet_OOP;
    FTipoFiltro  : string;
    FSQL         : string;
    FcacheMVAs   : TCestMvaVariantes_Model;
    FChangeMVA   : TNotifyEvent;
    function GetSQL(Ncm: string = ''): string;
    procedure DataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure AfterScroll(DataSet: TDataSet);
  public
    constructor Create;
    destructor Destroy; override;

    function Iniciar(Ncm: string): TCest_Consulta;
    procedure Filtrar(Filtro: string);

//    procedure ed_consultaChange(Sender: TObject);

//    property Dados       : TCestGs      read FDados        write FDados;
//    property ClientMVA   : TDataSet_OOP read FClientMVA    write FClientMVA;
//    property ClientMVA_AJ: TDataSet_OOP read FClientMVA_AJ write FClientMVA_AJ;
    property TipoFiltro  : string       read FTipoFiltro   write FTipoFiltro;
    property OnChangeMVA : TNotifyEvent read FChangeMVA    write FChangeMVA;
  end;


var
  Anexo: TCEST_;
  Consulta: TCest_Consulta;

implementation

uses
  Forms,
  SysUtils,
  StrUtils,
  hw_utils,
  Windows,
  uDtmAtivo,
  uCadCEST_v2,
  uDadosIni,
  Variants,
  basefb_class,
  FieldsConfigUnit,
  cest_ambito_class;

procedure cest_show(Amodal: Boolean);
begin
  vDadosIni.vTipoForm := 0;
  if not Assigned(frmCadCEST_v2) then
  begin
    vDadosIni.vModalOuChild := IfThen(Amodal, 'M', 'C');
    Application.CreateForm(TfrmCadCEST_v2, frmCadCEST_v2);
  end;

  if (Amodal) and (not frmCadCEST_v2.Visible) then
    frmCadCEST_v2.ShowModal
  else if (not frmCadCEST_v2.Visible) then
    frmCadCEST_v2.Show
  else if frmCadCEST_v2.FormStyle = fsMDIChild then
    frmCadCEST_v2.Show
  else
    frmCadCEST_v2.ShowModal;
end;

function cest_search(Ncm: string): string;
begin
  Result := '';
  Application.CreateForm(TfrmCadCEST_ConsultaDet, frmCadCEST_ConsultaDet);
  try
    frmCadCEST_ConsultaDet.ModoSelecaoCEST := True;
    frmCadCEST_ConsultaDet.NcmModoSelecao  := Ncm;
    if frmCadCEST_ConsultaDet.ShowModal = IDOK then
      Result := frmCadCEST_ConsultaDet.CestSelecionado;
  finally
    vDadosIni.enterTela.Enabled := True;
    FreeAndNil(frmCadCEST_ConsultaDet);
  end;
end;

exports
  cest_show,
  cest_search;

{ TCEST_Exclusao }

constructor TCEST_Exclusao.Create;
begin
  inherited Create;
  FNCMs := TCest_ncms_class.Create;
  FMVAs := TCest_mvas_class.Create;
  FUFs  := TCest_mva_ufs_class.Create;
end;

destructor TCEST_Exclusao.Destroy;
begin
  if Assigned(FNCMs) then FreeAndNil(FNCMs);
  if Assigned(FMVAs) then FreeAndNil(FMVAs);
  if Assigned(FUFs ) then FreeAndNil(FUFs);
  inherited;
end;

{ TCEST_ }

procedure TCEST_.check_variante_regra_geral;
var
  Variante: TCest_variante_class;
begin
  Variante := TCest_variante_class.Create;
  try
    Variante.CopyFrom(SqlOpen('select id from cest_variante where cod_empresa = %s and descricao = ''Regra Geral'' ', [vDadosIni.codEmpresa]));
    if Variante.id = 0 then
    begin
      Variante                         := TCest_variante_class.Create;
      Variante.descricao               := 'Regra Geral';
      Variante.descricao_original.Text := Variante.descricao;
      Variante.cod_empresa             := StrToInt(vDadosIni.codEmpresa);
      Variante.id                      := SqlInsertID(Variante.SQLMotor('id').SQLInsertAutoInc, 'id');
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    end;
  finally
    FreeAndNil(Variante);
  end;
end;

constructor TCEST_.Create;
begin
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_cest_');
  Fobjeto := TCestM.Create;
  Fexclusoes := TCEST_Exclusao.Create;
  TableName := 'CEST_';

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('ativo,cod_empresa', fvInvisivel)
      .Add('id', fvSempreVisivel)
      .Add('CEST', 'CEST', '00.000.00;0;')  
      .Add('descricao', '', DataSetGetText)
  );
end;

procedure TCEST_.DataSetGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'DESCRICAO' then
    Text := StringReplace(Sender.AsString, sLineBreak, ' ', [rfReplaceAll]);
end;

function TCEST_.Delete: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  try
    Fobjeto.CopyFrom(dataSet);

    if not vDadosIni.PesqPros('PRO295', 'EXCLUIR', Format('%d - %s', [VarToInt(Fobjeto.id), Fobjeto.cest]),
      TableName, IntToStr(Fobjeto.id), buscas) then
      exit;

    Fobjeto.ativo := 0;
    SqlExec(Fobjeto.SQLMotor().SQLUpdate);

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;                  
    DataSet.Refresh;

    vDadosIni.GravaAuditoria('PRO295', 'EXCLUIR', 'SUCESSO', TableName, IntToStr(Fobjeto.id), buscas);

  except on E: Exception do
    begin
      transacao.Rollback;
      vDadosIni.ShowErro('Erro ao excluir CEST. Erro: %s', [e.Message]);
      vDadosIni.registraErro('TCEST_.Delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TCEST_.Destroy;
begin
  FreeDbComponents(True);
  
  if Assigned(Fobjeto   ) then FreeAndNil(Fobjeto);
  if Assigned(Fexclusoes) then FreeAndNil(Fexclusoes);
  inherited;
end;

function TCEST_.Edit: Boolean;
begin
  Result := False;

  dataSet.RefreshRecord;

  if not vDadosIni.PesqPros('PRO293', 'ALTERAR', Format('%d - %s', [fint('id'), fstr('cest')]),
    TableName, fstr('id'), buscas) then
    Exit;

  Result := inherited Edit;
  if Result then
  begin
    if Assigned(Fobjeto) then FreeAndNil(Fobjeto);

    Fobjeto := TCest_Builder.GetCest(fint('id'), dtmAtivo.bancoHw, vDadosIni.codEmpresa);
    Fobjeto.beginChanges;

    if Assigned(FChange) then FChange(Self);
    
//    Fobjeto. CopyFrom(SqlOpen('select * from cest_ where id = %d and cod_empresa = %d',
//                              [fint('id'), fint('cod_empresa')]));

  end;
end;

function TCEST_.GetCestAmbitoText(Cest: string; Ambito: Integer): string;
var
  I: Integer;
begin                                                
  if not Assigned(FCestItemAmbitos) then
    FCestItemAmbitos := TCest_Builder.GetCestItens(dtmAtivo.bancoHw, vDadosIni.codEmpresa);

  Result := '';
  for I := 0 to FCestItemAmbitos.Count - 1 do
    if Result <> '' then
      Break
    else if (FCestItemAmbitos.Items[I].item   = StrToIntDef(Copy(Cest, 1, 2), -1)) and
            (FCestItemAmbitos.Items[I].ambito = Ambito) then
      Result := FCestItemAmbitos.Items[I].descricao.Text;
end;

function TCEST_.GetCestItemText(Cest: string): string;
var
  I: Integer;
begin                                                
  if not Assigned(FCestItemAmbitos) then
    FCestItemAmbitos := TCest_Builder.GetCestItens(dtmAtivo.bancoHw, vDadosIni.codEmpresa);

  Result := '';
  for I := 0 to FCestItemAmbitos.Count - 1 do
    if Result <> '' then
      Break
    else if FCestItemAmbitos.Items[I].item = StrToIntDef(Copy(Cest, 1, 2), -1) then
      Result := FCestItemAmbitos.Items[I].descricao_item;
end;

function TCEST_.Insert: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('PRO292', 'INSERIR', '',
    TableName, '', buscas) then
    exit;

  check_variante_regra_geral;

  if not dataSet.Active then
    montaSelect('select * from %s where id = 0 and cod_empresa = 1', [TableName]);

  Result := inherited Insert;
  if Result then
  begin
    if Assigned(Fobjeto) then FreeAndNil(Fobjeto);

    Fobjeto := TCestM.Create;

    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);

    if Assigned(FChange) then FChange(Self);
  end;
end;

function TCEST_.Post: Boolean;
var
  Acao, Str: string;
  I, J: Integer;
  NovoNCM: TCest_ncm_class;
  NovoMVA: TCest_mva_class;
  NovoMVAUF: TCest_mva_uf_class;
  DateTimeNow: TDateTime;
  ufsConvenio: TStrings;
begin
  Result := False;

  Acao := IfThen(dataSet.State = dsInsert, 'INSERIR', 'EDITAR');
  with Fobjeto do
    if not vDadosIni.PesqPros('PRO294', Acao, Format('%d - %s', [fint('id'), fstr('cest')]),
      TableName, fstr('id'), buscas) then
      exit;

  try
    if fstrin('origem', ['1', '2']) then
    begin
      if fdif('descricao', objeto.descricao.Text) or fdif('cest', objeto.cest) then
        ShowAtencao('Alteração da descrição e CEST não permitida em cadastros com origem Anexo XV ou API');

      if fdif('descricao', objeto.descricao.Text) then
        dataSet.FieldByName('descricao').AsString := objeto.descricao.Text;
      if fdif('cest', objeto.cest) then
        dataSet.FieldByName('cest').AsString := objeto.cest;
    end;

    checkFieldEmpty('cest'     , 'CEST precisa ser preenchido'     , '');
    //checkFieldEmpty('ambito'   , 'Ambito precisa ser preenchido'   , '');
    checkFieldEmpty('descricao', 'Descrição precisa ser preenchida', '');

    {
    if fint('id') = 0 then
      if not SqlOpen('select cest from %s where cest = %s and ambito = %d and cod_empresa = %s and ativo = 1',
                     [TableName, fstrq('cest'), fint('ambito'), vDadosIni.codEmpresa]).IsEmpty then
        raiseExceptionCreate('CEST "%s" já existe para o Ambito "%d" informado', [fstr('cest'), fint('ambito')]);
    }

    if Fobjeto.MVAs.Count = 0 then
      if ShowConfirmacao('Nenhum MVA informado. Continuar mesmo assim?') <> IDYES then
        Exit;

    if Fobjeto.NCMs.Count = 0 then
      if ShowConfirmacao('Nenhum NCM informado. Continuar mesmo assim?') <> IDYES then
        Exit;

    ufsConvenio := NewStringList(True, fstr('ufs_convenio'), ',');
    if ufsConvenio.Count = 0 then
      raiseExceptionCreate('Nenhuma uf informada ');

    dataSet.FieldByName('ufs_convenio').AsString := Copy(ufsConvenio.Text, 1, Length(ufsConvenio.Text) - 1);

    DateTimeNow := vDadosIni.getDataHoraBanco(buscas);
    Fobjeto.CopyFrom(dataSet, False);

    if VarToInt(Fobjeto.id) = 0 then
    begin
      Fobjeto.data_cadastro    := DateTimeNow;
      Fobjeto.data_modificacao := DateTimeNow;
      Fobjeto.cod_empresa      := StrToInt(vDadosIni.codEmpresa);
      Fobjeto.ambito           := 99;
      Fobjeto.origem           := ord(tcUsuario);
      with Fobjeto.SQLMotor('ID', 'ATIVO') do
        Fobjeto.id             := SqlInsertID(SQLInsertAutoInc, 'id');
    end
    else if Fobjeto.FoundChanges then
    begin
      Fobjeto.data_modificacao := DateTimeNow;
      SqlExec(Fobjeto.SQLMotor().SQLUpdate);
    end;

    for I := 0 to Fexclusoes.NCMs.Count - 1 do
      SqlExec(Fexclusoes.NCMs.Items[I].SQLMotor().SQLDelete);

    for I := 0 to Fexclusoes.UFs.Count - 1 do
      SqlExec(Fexclusoes.UFs.Items[I].SQLMotor().SQLDelete);

    for I := 0 to Fexclusoes.MVAs.Count - 1 do
      SqlExec(Fexclusoes.MVAs.Items[I].SQLMotor().SQLDelete);

    for I := 0 to Fobjeto.NCMs.Count - 1 do
      if VarToInt(Fobjeto.NCMs.Items[I].cest_id) = 0 then
      begin
        NovoNCM               := TCest_ncm_class.Create;
        NovoNCM.ncm           := Fobjeto.NCMs.Items[I].ncm;
        NovoNCM.cest_id       := Fobjeto.id;
        NovoNCM.cod_empresa   := Fobjeto.cod_empresa;
        NovoNCM.data_cadastro := DateTimeNow;

        if not SqlOpen('select ncm from cest_ncm where cest_id = %d and cod_empresa = %d and ncm = %s',
                       [VarToInt(NovoNCM.cest_id), VarToInt(NovoNCM.cod_empresa), QuotedStr(NovoNCM.ncm)]).IsEmpty then
          raiseExceptionCreate('NCM "%s" já existe no banco de dados para o CEST', [NovoNCM.ncm] );

        //vDadosIni.Auditoria();  

        with NovoNCM.SQLMotor() do
          SqlExec(SQLUpdateOrInsert);
      end;

    for I := 0 to Fobjeto.MVAs.Count - 1 do with Fobjeto.MVAs.Items[I] do
    begin
      if VarToInt(cest_id) = 0 then
      begin
        NovoMVA                  := TCest_mva_class.Create;
        NovoMVA.cod_empresa      := Fobjeto.cod_empresa;
        NovoMVA.cest_id          := Fobjeto.id;
        NovoMVA.cest_variante_id := cest_variante_id;
        NovoMVA.mva              := mva;
        NovoMVA.ncm_excecao      := ncm_excecao;
        NovoMVA.data_cadastro    := DateTimeNow;
        NovoMVA.data_modificacao := DateTimeNow;
        NovoMVA.origem           := ord(tcUsuario);
        NovoMVA.ufs_aliq         := ufs_aliq;

//        if not SqlOpen('select mva from cest_mva where cest_id = %d and cod_empresa = %d and cest_variante_id = %d',
//                       [VarToInt(NovoMVA.cest_id), VarToInt(NovoMVA.cod_empresa), VarToInt(NovoMVA.cest_variante_id)]).IsEmpty then
//          raiseExceptionCreate('Já existe no banco de dados para a combinação CEST/Ambito/Variante um MVA(%n)',
//                               [buscas.FieldByName('mva').AsFloat]);

        with NovoMVA.SQLMotor('id') do
          NovoMVA.id := SqlInsertID(SQLInsertAutoInc, 'id');

        for J := 0 to UFs.Count - 1 do
          if VarToInt(UFs.Items[J].cest_mva_id) = 0 then
          begin
            NovoMVAUF             := TCest_mva_uf_class.Create;
            NovoMVAUF.cest_mva_id := NovoMVA.id;
            NovoMVAUF.cod_empresa := NovoMVA.cod_empresa;
            NovoMVAUF.uf          := UFs.Items[J].uf;

            SqlExec(NovoMVAUF.SQLMotor().SQLUpdateOrInsert);
          end;
      end
      else
      begin
        if FoundChanges then
          SqlExec(SQLMotor().SQLUpdate);

        {
        for J := 0 to UFs.Count - 1 do
          if VarToInt(UFs.Items[J].cest_mva_id) = 0 then
          begin
            NovoMVAUF             := TCest_mva_uf_class.Create;
            NovoMVAUF.cest_mva_id := id;
            NovoMVAUF.cod_empresa := cod_empresa;
            NovoMVAUF.uf          := UFs.Items[J].uf;

            SqlExec(NovoMVAUF.SQLMotor().SQLUpdateOrInsert);
          end;
        }
      end;
    end;

    Str := Fobjeto.StrChanges;
    if Trim(Str) <> '' then with Fobjeto do
      vDadosIni.Auditoria(IfThen(Acao = 'INSERIR', 'PRO292', 'PRO293'), Acao,
                          IfThen(Acao = 'INSERIR', Format('%d - %s', [VarToInt(id), cest]), Str),
                          TableName, IntToStr(id));

    if transacao.InTransaction then
      transacao.Commit;
    Result := True;

    vDadosIni.GravaAuditoria('PRO294', Acao, 'SUCESSO', TableName, IntToStr(Fobjeto.id), buscas);

    DataSet.Cancel;
    if EndsText('where id = 0 and cod_empresa = 1', dataSet.CommandText) then
      montaSelect('select * from %s where id = %d and cod_empresa = %s', [TableName, VarToInt(Fobjeto.id), vDadosIni.codEmpresa])
    else
      DataSet.Refresh;

  except on E: Exception do
    begin
      transacao.Rollback;
      vDadosIni.ShowErro('Erro ao salvar dados do CEST. Erro: %s', [e.Message]);
      vDadosIni.registraErro('TCEST_.Post Erro: ' + e.Message);
    end;
  end;
end;

function TCEST_.Restaurar: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  try
    Fobjeto.CopyFrom(dataSet);

    if not vDadosIni.PesqPros('PRO342', 'RESTAURAR', Format('%d - %s', [VarToInt(Fobjeto.id), Fobjeto.cest]),
      TableName, IntToStr(Fobjeto.id), buscas) then
      exit;

    if SqlOpen('select id from cest_ where cest = %s and ambito = %d and cod_empresa = %d and id <> %d',
               [QuotedStr(Fobjeto.cest), VarToInt(Fobjeto.ambito), vDadosIni.cod_empresa, VarToInt(Fobjeto.id)]).
                FieldByName('id').AsInteger > 0 then
    begin
      ShowAtencao('Já existe CEST ativo com a cobinação CEST/Ambito (%s - %d)', [Fobjeto.cest, VarToInt(Fobjeto.ambito)]);
      Exit;
    end;

    Fobjeto.ativo := 1;
    SqlExec(Fobjeto.SQLMotor().SQLUpdate);

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;                  
    DataSet.Refresh;

    vDadosIni.GravaAuditoria('PRO342', 'RESTAURAR', 'SUCESSO', TableName, IntToStr(Fobjeto.id), buscas);

  except on E: Exception do
    begin
      transacao.Rollback;
      vDadosIni.ShowErro('Erro ao Restaurar CEST. Erro: %s', [e.Message]);
      vDadosIni.registraErro('TCEST_.Restaurar Erro: ' + e.Message);
    end;
  end;
end;

{ TCest_Consulta }

procedure TCest_Consulta.AfterScroll(DataSet: TDataSet);
var
  Retorno: TCestMvaVariantes_Model;
  I: Integer;
begin
  Retorno := TCestMvaVariantes_Model.Create;

  try

    for I := 0 to FcacheMVAs.Count - 1 do
      if FcacheMVAs.Items[I].cest_id = fint('id') then // encontrou o id no cache
        Retorno.Add(FcacheMVAs.Items[I].Clone)
      else if Retorno.Count > 0 then                   //caso tenha encontrado
        Break;

    if Retorno.Count = 0 then
    begin
      Retorno.CopyFrom(TCestMvaVariante_Model,
                       SqlOpen('select cm.cest_id, cm.id cest_mva_id, cm.cod_empresa, cm.mva, cv.descricao variante,' +
                               ' (select mva_aj from sp_ajustar_mva(cm.mva, 12, 18)) mva_12_18,' +
                               ' (select mva_aj from sp_ajustar_mva(cm.mva, 07, 17)) mva_7_17,' +
                               ' (select mva_aj from sp_ajustar_mva(cm.mva, 04, 17)) mva_4_17,' +
                               ' (select mva_aj from sp_ajustar_mva(cm.mva, 04, 18)) mva_4_18' +
                               ' from cest_mva cm' +
                               ' inner join cest_variante cv on cv.id = cm.cest_variante_id and cv.cod_empresa = cm.cod_empresa' +
                               ' where cm.cest_id = %d and cm.cod_empresa = %d' +
                               ' order by cm.id', [fint('id'), vDadosIni.cod_empresa]));

      for I := 0 to Retorno.Count - 1 do
        FcacheMVAs.Insert(0, Retorno.Items[I].Clone);
    end;

    if Assigned(FChangeMVA) then
      FChangeMVA(Retorno);

  finally
    FreeAndNil(Retorno);
  end;

//  FClientMVA.montaSelect('select cm.mva, cv.descricao variante,' +
//                         ' (select mva_aj from sp_ajustar_mva(cm.mva, 12, 18)) mva_12_18,' +
//                         ' (select mva_aj from sp_ajustar_mva(cm.mva, 07, 17)) mva_7_17,' +
//                         ' (select mva_aj from sp_ajustar_mva(cm.mva, 04, 17)) mva_4_17,' +
//                         ' (select mva_aj from sp_ajustar_mva(cm.mva, 04, 18)) mva_4_18' +
//                         ' from cest_mva cm' +
//                         ' inner join cest_variante cv on cv.id = cm.cest_variante_id and cv.cod_empresa = cm.cod_empresa' +
//                         ' where cm.cest_id = %d and cm.cod_empresa = %d', [fint('id'), vDadosIni.cod_empresa]);
//  if Assigned(FChangeMVA) then
//    FChangeMVA(FClientMVA);

  //talvez nao usar isso aqui e buscar por demanda e armazenar em um objeto
//  nao usar o after o dataset, e usar por demanda criar um objeto com o sql abaixo
//quando cair aqui percorrer o objeto, se nao encontrar mva para o cest procurar no banco e adicionar na em uma lista 

//select cm.cest_id, cm.id cest_mva_id, cm.cod_empresa, cm.mva, cv.descricao variante,
//(select mva_aj from sp_ajustar_mva(cm.mva, 12, 18)) mva_12_18,
//(select mva_aj from sp_ajustar_mva(cm.mva, 07, 17)) mva_7_17,
//(select mva_aj from sp_ajustar_mva(cm.mva, 04, 17)) mva_4_17,
//(select mva_aj from sp_ajustar_mva(cm.mva, 04, 18)) mva_4_18
// from cest_mva cm
//inner join cest_variante cv on cv.id = cm.cest_variante_id and cv.cod_empresa = cm.cod_empresa
//where cm.cest_id = 1 and cm.cod_empresa = 1
//--where cv.id in (12,13)
//order by cm.mva desc
end;

constructor TCest_Consulta.Create;
begin
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_cest_consulta');
//  FDados        := TCestGs.Create;
//  FClientMVA    := TDataSet_OOP.Create();
//  FClientMVA_AJ := TDataSet_OOP.Create;
  FcacheMVAs    := TCestMvaVariantes_Model.Create;

  dataSet.PacketRecords := 50;
  dataSet.AfterScroll   := AfterScroll;

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('ID', fvInvisivel)
      .Add('CEST', 'CEST', '00.000.00;0;')
      .Add('descricao', '', DataSetGetText)
      .Add('ncm', 'NCM', DataSetGetText)
  );
end;

procedure TCest_Consulta.DataSetGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if IndexText(Sender.FieldName, ['NCM', 'DESCRICAO']) >= 0 then
    Text := StringReplace(Sender.AsString, sLineBreak, ' ', [rfReplaceAll]);
end;

destructor TCest_Consulta.Destroy;
begin
  FreeDbComponents(True);

//  if Assigned(FDados    ) then FreeAndNil(FDados);
//  if Assigned(FClientMVA) then FreeAndNil(FClientMVA);
  if Assigned(FcacheMVAs) then FreeAndNil(FcacheMVAs);
  inherited;
end;

procedure TCest_Consulta.Filtrar(Filtro: string);
begin
  if (TipoFiltro = 'NCM') or (Trim(Filtro) = '') then // ncm não tem filtro e sim select
    filterClear
  else if TipoFiltro = 'CEST' then
    filterStr('cest like %s', [QuotedStr(Filtro + '%')])
  else if TipoFiltro = 'Descrição' then
    filterStr('descricao like %s', [QuotedStr('%' + Filtro + '%')]);
end;

function TCest_Consulta.GetSQL(Ncm: string): string;
var
  Str, Sql, SqlI, SqlE: string;
begin
  SqlI := 'select distinct c.id,' +
          ' (select text from sp_sql_single_record(''select cn.ncm from cest_ncm cn where cn.cest_id = ''||c.id||'' and cn.cod_empresa = ''||c.cod_empresa)) ncm,' +
          ' c.cest, c.descricao, iif(ca.ambito is null, c.ambito, ca.item||''.''||ca.ambito) ambito,' +
          ' ci.item ||''. ''|| ci.descricao item, ca.descricao ambito_d' +
          ' from cest_ c' +
          ' left join cest_item ci on ci.item = cast(substring(c.cest from 1 for 2) as integer) and ci.cod_empresa = c.cod_empresa' +
          ' left join cest_ambito ca on ca.item = ci.item and ca.cod_empresa = c.cod_empresa and ca.ambito = c.ambito';
  SqlE := ' where c.ativo = 1 and c.cod_empresa = ' + vDadosIni.codEmpresa;
  if Ncm = '' then
  begin
    Result := SqlI + SqlE + ' order by 3';
    Exit;
  end;

  Sql := '';
  Str := Copy(Ncm, 1, 8);
  while Length(Str) >= 2 do
  begin
    Sql := IfThen(Sql <> '', Sql + sLineBreak + ' union ' + sLineBreak) +
           Format('%s inner join cest_ncm cn on cn.cest_id = c.id and cn.cod_empresa = c.cod_empresa' +
                    ' %s and cn.ncm like %s and position(substring(cn.ncm from 1 for %d), %s) > 0' , [SqlI, SqlE, QuotedStr(Str + '%'), Length(Ncm), QuotedStr(Ncm)]);
    Str := Copy(Str, 1, Length(Str) -1);
  end;

  Result := Format('select r.id, min(r.ncm) ncm, min(r.cest) cest, min(r.descricao) descricao, min(r.ambito) ambito, min(r.item) item, min(r.ambito_d) ambito_d' +
                   ' from (' + sLineBreak +
                   '%s' + sLineBreak +
                   ') as r group by r.id order by 3', [Sql]);
end;

function TCest_Consulta.Iniciar(Ncm: string): TCest_Consulta;
begin
  Result := Self;
  //FClientMVA.dataSet.Close;
  montaSelect(GetSQL(Copy(OnlyNumber(Ncm),1,8)));
end;

end.
