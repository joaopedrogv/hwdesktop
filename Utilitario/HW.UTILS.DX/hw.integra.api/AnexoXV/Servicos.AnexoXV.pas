unit Servicos.AnexoXV;

interface

uses
  Api.AnexoxVService,
  Hw.Integra.Servicos,
  AnexoXV,
  HW.Servicos;

const
  HW_ANEXOXV_CONS_DIARIA = 'anexoxv_service_consulta_diaria';

type

  TAnexoXVServico = class(THwIntegraServicos)
  strict private
    function ResolverItem(itemApi: TItem; versao: string): Integer;
    function ResolverVariante(varianteApi: TVariante; versao: string): Integer;
    procedure Consultar(dadosConsulta: THwServicosJSON); override; //aqui usa a api
  public
    constructor Create(silentMode: Boolean); override;
  end;

implementation

uses
  HW.Utils.Classes.Registros_DX,
  Hw.Integra.Api.Rest,
  REST.Json,
  System.SysUtils,
  config_sistema_class,
  cest_ambito_class,
  cest_item_class,
  cest_versao_class,
  cest_variante_class,
  cest__class,
  cest_ncm_class,
  cest_mva_class,
  cest_mva_uf_class,
  System.Classes,
  System.Variants,
  System.Math,
  anexoxv_utils,
  basefb_class,
  hw_utils,
  hw_progress_utils;

{ TAnexoXVServico }

procedure TAnexoXVServico.Consultar(
  DadosConsulta: THwServicosJSON);
const
  limit = 50;
  MSG_CONF = 'Para desativar a consulta pela API informe qualquer valor negativo no valor da configuração';
var
  AnexoServiceXV: TAnexoXVServiceApi;
  UpdateToken: Boolean;
  versionApi: TVersao;
  itemsApi: TArray<TItem>;
  itemApi: TItem;
  ambitosApi: TArray<TAmbito>;
  ambitoApi: TAmbito;
  variantesApi: TArray<TVariante>;
  varianteApi: TVariante;
  cestsApi: TArray<TCest>;
  cestApi: TCest;
  ncmsApi: TArray<TNCM>;
  ncmApi: TNCM;
  mvaApi: TMVA;
  mvasApi : TArray<TMVA>;
  versaoDb: TCest_versao_class;
  itemDb: TCest_item_class;
  ambitoDb: TCest_ambito_class;
  variantesDb: TCest_variantes_class;
  varianteDb: TCest_variante_class;
  cestDb: TCest__class;
  ncmDb: TCest_ncm_class;
  ncmsDb: TCest_ncms_class;
  mvaDb: TCest_mva_class;
  mvasDb: TCest_mvas_class;
  ufmva: TCest_mva_uf_class;
  ufsmva: TCest_mva_ufs_class;
  lastSinc: TConfig_sistema_class;
  lastId, offset, cont, pages: Integer;
  done: Boolean;
  iDB, iApi: Integer;
  estados: TStrings;
  uf: string;
begin
  try
    try
      if not SilentMod then
        ProgressUtil.DoMessage('Iniciando consulta', 'Consulta Api Anexo XV');

      if not GetCNPJ then
        raise Exception.Create('CNPJ não localizado para empresa ' + IntToStr(CodEmpresa));

      if DataSearch = nil then
        raise Exception.Create('DadosConsulta = nil');

      DataSearch.DataConsulta := DataHoraAtual;

      lastSinc := TCfg_sis.getConf('hw_integra_api_anexoxv_last_sincid', QrAux, CodEmpresa);
      if lastSinc.chave.IsEmpty then
      begin
        lastSinc.chave := 'hw_integra_api_anexoxv_last_sincid';
        lastSinc.display_ := 'Id da última sincronização do Anexo XV';
        lastSinc.ativo := 1;
        lastSinc.cod_empresa := CodEmpresa;
        lastSinc.type1_ := typeInt;
        lastSinc.value1_b.Add(MSG_CONF);
        lastSinc.SaveConfDB(QrAux).Transaction.Commit;
      end
      else if lastSinc.value1_f < 0 then
      begin
        Exit;
        FreeAndNil(DataSearch);
      end
      else if lastSinc.value1_vc.Trim.IsEmpty then
      begin
        SqlExec('update cest_mva set origem = -1 where cod_empresa = %d and origem is null', [CodEmpresa]);
        SqlExec('update cest_ set origem = -1 where cod_empresa = %d and origem is null', [CodEmpresa]);
        lastSinc.value1_vc := 'v1.0';
        lastSinc.value1_f := 0;
      end;

      lastId := Trunc(lastSinc.value1_f);

      AnexoServiceXV := TAnexoXVServiceApi.Create(UrlApi, FCnpj);

      AnexoServiceXV.OnLog   := Self.OnLog;
      AnexoServiceXV.Token   := THwClassRegistros.FromJsonString<TIntegraTokenApi>(GetJson(HW_SERV_TOKEN_API));

      if not SilentMod then
        ProgressUtil.Msg('Obtendo ultima versão');

      {$REGION 'Ultima versao'}
      //logconf := '';
      versionApi := AnexoServiceXV.LastVersion();
      versaoDb := TCest_versao_class.Create;
      versaoDb.CopyFrom(SqlOpen('select first 1 * from cest_versao where versao = %s and ativo = 1 order by data_versao desc', [versionApi.Versao.QuotedString]));


      if (versaoDb.versao.IsEmpty) or (versionApi.DataVersao > VarToDateTime(versaoDb.data_versao)) then
      begin
        versaoDb := TCest_versao_class.Create;
        versaoDb.cod_empresa := CodEmpresa;
        versaoDb.data_cadastro := DataSearch.DataConsulta;
        versaoDb.tipo_cadastro := tcApi;;
        versaoDb.versao := versionApi.Versao;
        versaoDb.data_versao := versionApi.DataVersao;
        versaoDb.ativo := versionApi.Ativo;

        with versaoDb.SQLMotor('id') do
          if versaoDb.id = 0 then
            versaoDb.id := SqlInsertID(SQLInsertAutoInc, 'id', QrAux)
          else
            SqlExec(SQLUpdate);

        //logcount := 'Versão ' + versaoDb.versao + ' ' + FormatDateTime('DD/MM/YYYY', versionApi.DataVersao);
      end;
      //else
        //logcount := '*Versão ' + versaoDb.versao + ' ' + FormatDateTime('DD/MM/YYYY', versionApi.DataVersao);
      {$ENDREGION}

      if not SilentMod then
        ProgressUtil.Msg('Obtendo classificação: Items');

      {$REGION 'baixando Items'}
      offset := 0;
      //logcount := 0;
      done := False;

      while not done do
      begin
        itemsApi := AnexoServiceXV.ItemsChanges(lastId, offset, limit, cont);
        for itemApi in itemsApi do
          ResolverItem(itemApi, versionApi.Versao);

        offset := offset + limit;
        done := Length(itemsApi) = 0;

        //logcount := logcount + Length(itemsApi);
      end;

      //if logcount > 0 then
        //logconf := logconf + sLineBreak + 'Item=' + logcount.ToString;
      {$ENDREGION}

      if not SilentMod then
        ProgressUtil.Msg('Obtendo classificação: Ambitos');

      {$REGION 'baixando ambitos'}
      offset := 0;
      //logcount := 0;
      done := False;

      while not done do
      begin
        ambitosApi := AnexoServiceXV.AmbitosChanges(lastId, offset, limit, cont);
        for ambitoApi in ambitosApi do
        begin
          ambitoDb := TCest_ambito_class.Create;
          ambitoDb.CopyFrom(SqlOpen('select * from cest_ambito where item = %d and cod_empresa = %d and ambito = %d', [ambitoApi.ItemId, CodEmpresa, ambitoApi.Ambito]));
          if ambitoDb.item = 0 then
          begin
            ambitoDb.cod_empresa := CodEmpresa;
            ambitoDb.versao := versionApi.versao;
            ambitoDb.item := ambitoApi.ItemId;
            ambitoDb.ambito := ambitoApi.Ambito;
          end;
          ambitoDb.descricao.Text := ambitoApi.Descricao;

          if ambitoDb.FoundChanges then
            SqlExec(ambitoDb.SQLMotor().SQLUpdateOrInsert);
        end;


        offset := offset + limit;
        done := Length(ambitosApi) = 0;
      end;

      {$ENDREGION}

      if not SilentMod then
        ProgressUtil.Msg('Obtendo tabela do CEST');

      {$REGION 'baixando cest'}
      offset := 0;
      //logcount := 0;
      done := False;
      ncmsDb := TCest_ncms_class.Create;
      mvasDb := TCest_mvas_class.Create;
      ufsmva := TCest_mva_ufs_class.Create;

      while not done do
      begin
        cestsApi := AnexoServiceXV.CestsChanges(lastId, offset, limit, cont);

        if not SilentMod then
        begin
          if offset = 0 then
          begin
            pages := Trunc(cont / limit) + IfThen(not(cont mod limit = 0), 1);
            ProgressUtil.ObjInitProgress(nil)
              .MaxSteps(pages)
              .MaxProgress(cont);
          end;
          ProgressUtil.IncStep();
        end;

        for cestApi in cestsApi do
        begin
          if not SilentMod then
            ProgressUtil.IncProgress();

          cestDb := TCest__class.Create;
          cestDb.CopyFrom(SqlOpen('select * from cest_' +
                                  ' where cest = %s and cod_empresa = %d and ambito = %d and ativo = 1 ' +
                                  ' and origem in (1, 2)',
                                  [cestApi.CEST.QuotedString, CodEmpresa, cestApi.Ambito]));

          if cestDb.cest.IsEmpty then
          begin
            cestDb.cod_empresa := CodEmpresa;
            cestDb.cest := cestApi.cest;
            cestDb.ambito := cestApi.ambito;
            cestDb.data_cadastro := DataHoraAtual;
            cestDb.origem := ord(tcApi);
          end;
          cestDb.descricao.Text := cestApi.descricao;
          cestDb.versao := versionApi.versao;
          cestDb.data_modificacao := DataHoraAtual;
          cestDb.ativo := cestApi.Ativo;
          cestDb.ufs_convenio := cestApi.Estados;


          if (cestApi.Ativo = 0) then
          begin
            if (cestDb.id > 0) then
            begin
              SqlExec('update cest_mva set ativo = 0 where cest_id = %d and cod_empresa = %d and origem in (1, 2)', [cestDb.id, cestDb.cod_empresa]);
              SqlExec('update cest_ set ativo = 0 where id = %d and cod_empresa = %d and origem in (1, 2)', [cestDb.id, cestDb.cod_empresa]);
            end;
          end
          else
          begin
            if cestDb.id = 0 then
              cestDb.id := SqlInsertID(cestDb.SQLMotor('id').SQLInsertAutoInc, 'id')
            else
            begin
              SqlExec(cestDb.SQLMotor().SQLUpdate);

              SqlExec('delete from cest_ncm where cest_id = %d and cod_empresa = %d', [cestDb.id, cestDb.cod_empresa]);
              SqlExec('delete from cest_mva where cest_id = %d and cod_empresa = %d and origem in (1,2)', [cestDb.id, cestDb.cod_empresa]);
            end;

            for ncmApi in cestApi.Ncms do
              if ncmApi.Ativo = 1 then
              begin
                ncmDb := TCest_ncm_class.Create;
                ncmDb.cest_id := cestDb.id;
                ncmDb.cod_empresa := cestDb.cod_empresa;
                ncmDb.ncm := ncmApi.NCM;
                ncmDb.data_cadastro  := DataHoraAtual;
                SqlExec(ncmDb.SQLMotor('id').SQLInsertAutoInc);
              end;

            for mvaApi in cestApi.Mvas do
              if mvaApi.Ativo = 1 then
              begin
                mvaDb := TCest_mva_class.Create;
                mvaDb.cod_empresa := cestDb.cod_empresa;
                mvaDb.cest_id := cestDb.id;
                mvaDb.cest_variante_id := ResolverVariante(mvaApi.Variante, versionApi.versao);
                mvaDb.mva := mvaApi.MVA;
                mvaDb.ncm_excecao.Text := mvaApi.NcmExcecao;
                mvaDb.versao := versionApi.Versao;
                mvaDb.data_cadastro := DataHoraAtual;
                mvaDb.data_modificacao := DataHoraAtual;
                mvaDb.origem := Ord(tcApi);
                mvaDb.ufs_aliq := 'Padrao';

                mvaDb.id := SqlInsertID(mvaDb.SQLMotor('id').SQLInsertAutoInc, 'id');
                { os convenios ficam agora no estado, e caso necessario o usuario vai cadastrar as aliquodas especificas por uf, caso contrario
                   desenvolver algo para a api retornar as aliquodas por UF
                estados :=  NewStringList(cestApi.Estados, ',');
                for uf in estados do
                  if not uf.Trim.IsEmpty then
                  begin
                    ufmva := TCest_mva_uf_class.Create;
                    ufmva.cest_mva_id := mvaDb.id;
                    ufmva.cod_empresa := mvaDb.cod_empresa;
                    ufmva.uf := uf;

                    SqlExec(ufmva.SQLMotor().SQLInsert);
                  end;
                }
              end;
          end;

          if cestApi.SincId > lastSinc.value1_f then
            lastSinc.value1_f := cestApi.SincId;

        end;

        lastSinc.SaveConfDB(QrAux);

        if Transacao.InTransaction then
          Transacao.Commit;

        offset := offset + limit;
        done := Length(cestsApi) = 0;

        //logcount := logcount + Length(cestsApi);
      end;

      //if logcount > 0 then
        //logconf := logconf + sLineBreak + 'Cests=' + logcount.ToString;
      {$ENDREGION}

      if not SilentMod then
        ProgressUtil.Msg('Finalizando');

      SqlExec('update cest_mva set ativo = 0 where cod_empresa = %d and origem = -1', [CodEmpresa]);
      with SqlExec('update cest_ set ativo = 0 where cod_empresa = %d and origem = -1', [CodEmpresa]) do
      begin
        if Transaction.InTransaction then
          Transaction.Commit;
      end;

      if not AnexoServiceXV.LastError.Msg.IsEmpty then
      begin
        DataSearch.Status := HW_STS_ERROR_API;
        if not SilentMod then
          ShowErro(AnexoServiceXV.LastError.Msg + sLineBreak + AnexoServiceXV.LastError.Exception);
      end
      else
        DataSearch.Status := HW_STS_CONCLUIDA;

      if AnexoServiceXV.Token <> nil then
      begin
        if not Assigned(FToken) then
          UpdateToken := True
        else if FToken.accessToken <> AnexoServiceXV.Token.accessToken then
          UpdateToken := True
        else
          UpdateToken := False;

        if UpdateToken then
        begin
          FToken := AnexoServiceXV.Token;
          SaveJSON(HW_SERV_TOKEN_API, TJson.ObjectToJsonString(FToken, [joDateIsUTC, joDateFormatISO8601, joIgnoreEmptyStrings, joIgnoreEmptyArrays]));
        end;
      end;

      SaveJSON(DataSearch.Servico, TJson.ObjectToJsonString(DataSearch));

    finally
      if Assigned(AnexoServiceXV) then
        AnexoServiceXV.Free;
      if not SilentMod then
        ProgressUtil.Terminate;
    end;

  except on E: Exception do
    begin
      if Assigned(DataSearch) then
      begin
        DataSearch.Status := HW_STS_ERROR;
        SaveJSON(DataSearch.Servico, TJson.ObjectToJsonString(DataSearch));
      end;

      LogError('THwIntegraServicosAnexoXV.Consultar %s', [e.Message]);
      if not SilentMod then
        ShowErro('Erro ao consultar' + sLineBreak + e.Message);
    end;
  end;
end;

constructor TAnexoXVServico.Create(silentMode: Boolean);
begin
  inherited Create(silentMode, HW_ANEXOXV_CONS_DIARIA);
end;

function TAnexoXVServico.ResolverItem(itemApi: TItem;
  versao: string): Integer;
var
  itemDb: TCest_item_class;
begin
  try
    itemDb := TCest_item_class.Create;
    itemDb.CopyFrom(SqlOpen('select * from cest_item where item = %d and cod_empresa = %d', [itemApi.Id, CodEmpresa]));
    if itemDb.item = 0 then
    begin
      itemDb.cod_empresa := CodEmpresa;
      itemDb.item := itemApi.Id;
    end;
    itemDb.descricao := itemApi.Descricao;

    if itemDb.FoundChanges then
    begin
      itemDb.versao := versao;
      SqlExec(itemDb.SQLMotor().SQLUpdateOrInsert)
    end;

    Result := itemDb.item;

  except on E: Exception do
    begin
      raise Exception.Create('ResolverItem ' + E.Message);
    end;
  end;
end;

function TAnexoXVServico.ResolverVariante(
  varianteApi: TVariante; versao: string): Integer;
var
  varianteDb: TCest_variante_class;
begin
  try
    varianteDb := TCest_variante_class.Create;
    varianteDb.CopyFrom(SqlOpen('select * from cest_variante where cod_empresa = %d and descricao = %s',
                                [CodEmpresa, AnxXVUtils.DescrOrigToDescr(varianteApi.Descricao).QuotedString]));
    if varianteDb.descricao.Trim.IsEmpty then
    begin
      varianteDb.Free;
      varianteDb := AnxXVUtils.NovaVariante(varianteApi.Descricao);
      varianteDb.cod_empresa := CodEmpresa;
      varianteDb.versao := versao;
      varianteDb.api_id := varianteApi.Id;

      with varianteDb.SQLMotor('id') do
      begin
        Options.UpdateFields := buAll;
        varianteDb.id := SqlInsertID(SQLInsertAutoInc, 'id');
      end;
    end
    else if varianteApi.Id <> VarToInt(varianteDb.api_id) then
    begin
      varianteDb.api_id := varianteApi.Id;
      SqlExec(varianteDb.SQLMotor().SQLUpdate);
    end;

    Result := varianteDb.id;

  except on E: Exception do
    begin
      raise Exception.Create('ResolverVariante ' + E.Message);
    end;
  end;
end;

end.
