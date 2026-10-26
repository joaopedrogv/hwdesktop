unit Servicos.GS1;

interface

uses
  Api.GS1Service,
  Hw.Integra.Servicos,
  GS1Prefix,
  HW.Servicos;

const
  HW_GS1_CONS_DIARIA = 'gs1_service_consulta_diaria';

type
  TGS1Servico = class(THwIntegraServicos)
  strict private
    procedure Consultar(DadosConsulta: THwServicosJSON); override; //aqui usa a api
  public

  end;

implementation

uses
  System.Classes,
  System.SysUtils,
  System.DateUtils,
  gs1prefix_class,
  config_sistema_class,
  hw_progress_utils,
  hw_utils,
  HW.Utils.Classes.Registros_DX,
  Hw.Integra.Api.Rest,
  REST.Json;

{ TGS1Servico }


procedure TGS1Servico.Consultar(DadosConsulta: THwServicosJSON);
var
  integraApi: TGS1ServiceApi;
  UpdateToken: Boolean;
  dateGS1: TGS1PrefixDateUpdate;
  prefixsApi: TArray<TGS1Prefix>;
  prefixApi: TGS1Prefix;
  prefixDb: TGs1prefix_class;
  done: Boolean;
  iDB, iApi: Integer;
  estados: TStrings;
  uf: string;
  lastSinc: TConfig_sistema_class;
  lastDate: TDateTime;
begin
  try
    if not SilentMod then
      ProgressUtil.DoMessage('Iniciando consulta', 'Consulta Api GS1');

    if not GetCNPJ then
      raise Exception.Create('CNPJ não localizado para empresa ' + IntToStr(CodEmpresa));

    if DataSearch = nil then
      raise Exception.Create('DadosConsulta = nil');

    DataSearch.DataConsulta := DataHoraAtual;

    lastSinc := TCfg_sis.getConf('hw_integra_api_gs1_prefix_lastdate', QrAux, 0);
    if lastSinc.chave.IsEmpty then
    begin
      lastSinc.chave := 'hw_integra_api_gs1_prefix_lastdate';
      lastSinc.display_ := 'Data da ultima sincronização da tabela de prefixo do GS1';
      lastSinc.ativo := 1;
      lastSinc.cod_empresa := 0;
      lastSinc.type1_ := typeBool;
      lastSinc.SaveConfDB(QrAux).Transaction.Commit;
    end
    else if TryStrToDateTime(lastSinc.ReadString('Conf', 'DataHoraConsultaDia'), lastDate) then
      if lastDate < (DataHoraAtual + EncodeTime(4,0,0,0)) then
        Exit;

    if not TryISO8601ToDate(lastSinc.value1_vc, lastDate) then
      lastDate := 0;

    integraApi := TGS1ServiceApi.Create(UrlApi, FCnpj);

    try
      integraApi.OnLog   := Self.OnLog;
      integraApi.Token   := THwClassRegistros.FromJsonString<TIntegraTokenApi>(GetJson(HW_SERV_TOKEN_API));

      if not SilentMod then
        ProgressUtil.Msg('Obtendo ultima versão');

      {$REGION 'Consumo da API'}
      //logconf := '';
      dateGS1 := integraApi.DateUpdate();

      lastSinc.WriteString('Conf', 'DataHoraConsultaDia', DateTimeToStr(DataHoraAtual));
      if dateGS1.DateUpdate <= lastDate then
      begin
        lastSinc.SaveConfDB(QrAux);
        Exit;
      end;

      prefixsApi := integraApi.GS1Prefix();

      SqlExec('delete from GS1PREFIX');

      for prefixApi in prefixsApi do
      begin
        prefixDb := TGs1prefix_class.Create;
        with prefixDb do
        begin
          inicio := prefixApi.Starts;
          fim := prefixApi.Ends;
          especial := prefixApi.Special;
          descricao := prefixApi.Description;
          SqlExec(SQLMotor().SQLUpdateOrInsert);
        end;
      end;

      lastSinc.value1_vc := DateToISO8601(dateGS1.DateUpdate);

      lastSinc.SaveConfDB(QrAux);

      if Transacao.InTransaction then
        Transacao.Commit;

      {$ENDREGION}

      if not SilentMod then
        ProgressUtil.Msg('Finalizando');

      if not integraApi.LastError.Msg.IsEmpty then
      begin
        DataSearch.Status := HW_STS_ERROR_API;
        if not SilentMod then
          ShowErro(integraApi.LastError.Msg + sLineBreak + integraApi.LastError.Exception);
      end
      else
        DataSearch.Status := HW_STS_CONCLUIDA;

      HandleUpdateToken(integraApi.Token);

      SaveJSON(DataSearch.Servico, TJson.ObjectToJsonString(DataSearch));

    finally
      integraApi.Free;
      if not SilentMod then
        ProgressUtil.Terminate;
    end;

    registraErro('TGS1Servico.Consultar Sem Error');

  except on E: Exception do
    begin
      if Assigned(DataSearch) then
      begin
        DataSearch.Status := HW_STS_ERROR;
        SaveJSON(DataSearch.Servico, TJson.ObjectToJsonString(DataSearch));
      end;

      LogError('TGS1Servico.Consultar %s', [e.Message]);
      if not SilentMod then
        ShowErro('Erro ao consultar' + sLineBreak + e.Message);
    end;
  end;
end;

end.
