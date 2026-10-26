{******************************************************************************}
{ Projeto: REST HW                                                             }
{  Biblioteca para ser usada em maior parte para consumir a api da HW Sistemas }
{ outras apis também são podem ser consumidas utilizando esta biblioteca       }
{                                                                              }
{ Direitos Autorais Reservados (c) 2017   Hw Sistemas e Computadores           }
{                                                                              }
{ Autor: João Pedro Rodrigues Costa                                            }
{                                                                              }
{            HW Sistemas e Computadores Ltda - www.hwsistemas.com.br           }
{    Rua Mogno, 236, Santo Agostinho - Governador Valadares - MG - 35.065-019  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 23/02/2017: João Pedro
|*  - Criação e distribuição da Primeira Versao
*******************************************************************************}

unit HW.Utils.Classes.Estatisticas_DX;

interface

uses
  uClasseConexao, Windows, System.SysUtils;

type

  THW_Estatisticas = class(TConexao)
  private
    FCodEmpresa: Integer;
    FDataBaseName: string;
    FPassWord: string;
    FUserNameHW: string;
    FUserName: string;

    procedure SetCodEmpresa(const Value: Integer);
    procedure SetDataBaseName(const Value: string);
    procedure SetPassWord(const Value: string);
    procedure SetUserName(const Value: string);
    procedure SetUserNameHW(const Value: string);

    procedure HomeGetStatusApiHw;

  public
    destructor Destroy; override;
    constructor create;

    function EnviarEstatiticasWSHW: Integer;

    property DataBaseName: string read FDataBaseName write SetDataBaseName;
    property UserName: string read FUserName write SetUserName;
    property PassWord: string read FPassWord write SetPassWord;
    property UserNameHW: string read FUserNameHW write SetUserNameHW;
    property CodEmpresa: Integer read FCodEmpresa write SetCodEmpresa;
  end;

implementation

uses
  System.Generics.Collections,
  System.DateUtils,
  System.Classes,
  IPPeerAPI,
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Funcoes_DX,
  HW.Utils.Classes.Rest_DX,
  Data.DB, System.StrUtils,
  HW.Utils.Classes.Rtti;

{ THW_Estatisticas }

constructor THW_Estatisticas.create;
begin

  inherited;
end;

destructor THW_Estatisticas.Destroy;
begin

  inherited;
end;

function THW_Estatisticas.EnviarEstatiticasWSHW: Integer;
var
  dataHoraBanco, dataHoraEnvio: TDateTime;
  diferencaHora: TTime;
  Status, AUrlAPI: string;
  eHoraDeEnviar, existeConf: Boolean;
  Lote: Integer;
  item: TEstatistica;
  estatisticas: TRegistrosEstatisticas;
  rest: TRestHW;
  resp: THWRest_ResponseInformation;
begin
  Result := 0;
  try
    if (FDataBaseName <> '') and (FUserName <> '') and (FPassWord <> '') then
    begin
      Banco.DataBaseName := FDataBaseName;
      Banco.Params.Clear;
      Banco.Params.Add('user_name=' + FUserName);
      Banco.Params.Add('password=' + FPassWord);

      if not conectar then
        Exit;
    end
    else if not conectar(False) then
      Exit;

    try

      {$REGION 'ja é hora de enviar? eHoraDeEnviar'}
      QrAux.Close;
      QrAux.SQL.Text :=
        'select current_ts as datahora from sp_current_ts';
      QrAux.Open;

      dataHoraBanco := QrAux.FieldByName('datahora').AsDateTime;

      // datahoraenvio|status|
      QrAux.Close;
      QrAux.SQL.Text := 'select VALUE1_VC, VALUE1_F from CONFIG_SISTEMA' +
        ' where CHAVE = ' + QuotedStr('hw_ws_envio_statisticas') +
        ' and COD_EMPRESA = ' + IntToStr(FCodEmpresa);
      QrAux.Open;
      existeConf := not QrAux.IsEmpty;

      dataHoraEnvio := StrToDateTimeDef(THwUtilsClass.getCampoPipe(QrAux.FieldByName('value1_vc').AsString, 1), 0);
      Status := THwUtilsClass.getCampoPipe(QrAux.FieldByName('value1_vc').AsString, 2);
      Lote := Trunc(QrAux.FieldByName('value1_f').AsFloat);

      if (DateOf(dataHoraEnvio) < DateOf(dataHoraBanco)) then
      begin
        eHoraDeEnviar := True;
      end
      else if ((DateOf(dataHoraEnvio) = DateOf(dataHoraBanco)) and
        (Status <> 'C')) then
      begin
        diferencaHora := dataHoraBanco - dataHoraEnvio;
        eHoraDeEnviar := (diferencaHora > StrToTimeDef('02:00:00', 0));
      end
      else
        eHoraDeEnviar := False;

      if (not eHoraDeEnviar) then
        Exit;

      if not existeConf then
      begin
        QrAux.Close;
        QrAux.SQL.Text :=
          'insert into CONFIG_SISTEMA (CHAVE, COD_EMPRESA, DISPLAY_, TYPE1_, VALUE1_VC, VALUE1_F, ATIVO)'
          + ' values (:CHAVE, :COD_EMPRESA, ''Datas de envido estatisticas'', ''string'', :VALUE1_VC, 1, 0)';
        QrAux.ParamByName('CHAVE').AsString := 'hw_ws_envio_statisticas';
        QrAux.ParamByName('COD_EMPRESA').AsInteger := FCodEmpresa;
        QrAux.ParamByName('VALUE1_VC').AsString :=
          FormatDateTime('dd/mm/yyyy hh:mm:ss', dataHoraBanco) + '||';
        QrAux.ExecSQL;
      end
      else
      begin
        QrAux.Close;
        QrAux.SQL.Text := 'update CONFIG_SISTEMA' +
          ' set VALUE1_VC = :VALUE1_VC, VALUE1_F = VALUE1_F + 1' +
          ' where CHAVE = ' + QuotedStr('hw_ws_envio_statisticas') +
          ' and COD_EMPRESA = ' + IntToStr(FCodEmpresa) +
          ' and VALUE1_F = :VALUE1_F';
        QrAux.ParamByName('VALUE1_VC').AsString :=
          FormatDateTime('dd/mm/yyyy hh:mm:ss', dataHoraBanco) + '||';
        QrAux.ParamByName('VALUE1_F').AsFloat := Lote;
        QrAux.ExecSQL;
      end;

      QrAux.Close;
      QrAux.SQL.Text := 'select VALUE1_VC, VALUE1_F from CONFIG_SISTEMA' +
        ' where CHAVE = ' + QuotedStr('hw_ws_envio_statisticas') +
        ' and COD_EMPRESA = ' + IntToStr(FCodEmpresa);
      QrAux.Open;

      if (Trunc(QrAux.FieldByName('VALUE1_F').AsFloat) <> (Lote + 1)) then
      begin
        eHoraDeEnviar := False;
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Rollback;
      end
      else
      begin
        Lote := Trunc(QrAux.FieldByName('VALUE1_F').AsFloat);
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Commit;
      end;

      if (not eHoraDeEnviar) then
        Exit;

      {$ENDREGION}

      {$REGION 'enviando dados'}
      estatisticas := TRegistrosEstatisticas.create;

      QrAux.Close;
      QrAux.SQL.Text := 'select first 100 * from STS_USO' +
        ' where seq_envio is null and dia < (select current_d from sp_current_ts) order by dia asc';
      QrAux.Open;

      QrAux.First;
      while not QrAux.Eof do
      begin

        item := TEstatistica.create;
        item.SetData(QrAux.FieldByName('dia').AsDateTime);
        item.Descricao := QrAux.FieldByName('STS_DESCRICAO').AsString;
        item.Quantidade := QrAux.FieldByName('QUANTIDADE').AsInteger;
        estatisticas.Add(item);

        QrAux.Next;
      end;

      QrAux.Close;
      QrAux.SQL.Text := 'select cgc_emp from empresa where cod_empresa = ' +
        IntToStr(FCodEmpresa);
      QrAux.Open;
      estatisticas.cnpj := QrAux.FieldByName('cgc_emp').AsString.Trim;

      if High(estatisticas.estatisticas) > -1 then
      begin
        try
          if StrToDateDef(THwUtilsClass.GetIni('MD', 'DATA_PROX_CONS_URL', ''), Date) <= Date  then
            HomeGetStatusApiHw;

          if THwUtilsClass.GetIni('MD', 'CUSTOM_URL', '') = 'S' then
            AUrlAPI := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
          else if THwUtilsClass.GetIni('MD', 'NOVA_URL', '') = 'S' then
            AUrlAPI := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
          else
            AUrlAPI := IfThen(THwUtilsClass.ComputadorDaRedeHwSistemas, AUrlApiHomologacao, AUrlApiProducao);

          rest := TRestHW.create( AUrlAPI, 'security/token');
          if not rest.LoginApiHw('HW.ENVIO.ESTATISTICAS', 'ŸŸ=%[-›459') then
            raise Exception.create(rest.GetLastError);

          rest.metodo := 'Estatisticas/Inserir';

          rest.AddParametro([paramRestHwCodUsuario, paramRestHwCodEmpresa,
            paramRestHwAutorization], True);

          rest.ExecutarPOST(estatisticas.ToJsonStringEncode);

          if rest.restResponse.StatusCode = 200 then
          begin
            resp := THWRest_ResponseInformation.FromJsonString(rest.restResponse.JSONValue.ToJSON);
            if resp.valid <> 'OK' then
              raise Exception.Create(resp.valid);
          end
          else
            raise Exception.Create(rest.GetLastError);

        finally
          FreeAndNil(rest);
        end;
      end;
      {$ENDREGION}

      {$REGION 'atualizando registros enviados'}
      QrAux.Close;
      QrAux.SQL.Text := 'update STS_USO set SEQ_ENVIO = ' + IntToStr(Lote) +
        ' where DIA = :DIA and STS_DESCRICAO = :STS_DESCRICAO';

      for item in estatisticas.estatisticas do
      begin
        QrAux.ParamByName('DIA').AsDate := item.GetDateTimeVal(item.Data);
        QrAux.ParamByName('STS_DESCRICAO').AsString :=
          Copy(item.Descricao, 1, 64);
        if not QrAux.Prepared then
          QrAux.Prepare;
        QrAux.ExecSQL;
      end;

      QrAux.Close;
      QrAux.SQL.Text := 'delete from STS_USO' +
        ' where seq_envio > 0 and dia < ((select current_d from sp_current_ts) - 30)';
      QrAux.ExecSQL;

      QrAux.Close;
      QrAux.SQL.Text := 'select count(dia) contador from STS_USO' +
        ' where seq_envio is null and dia < (select current_d from sp_current_ts)';
      QrAux.Open;

      Result := QrAux.FieldByName('contador').AsInteger;
      if Result = 0 then
      begin
        QrAux.Close;
        QrAux.SQL.Text := 'update CONFIG_SISTEMA' +
          ' set VALUE1_VC = :VALUE1_VC' + ' where CHAVE = ' +
          QuotedStr('hw_ws_envio_statisticas') + ' and COD_EMPRESA = ' +
          IntToStr(FCodEmpresa) + ' and VALUE1_F = :VALUE1_F';
        QrAux.ParamByName('VALUE1_VC').AsString :=
          FormatDateTime('dd/mm/yyyy hh:mm:ss', dataHoraBanco) + '|C|';
        QrAux.ParamByName('VALUE1_F').AsFloat := Lote;
        QrAux.ExecSQL;
      end;

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;

      QrAux.Close;

      {$ENDREGION}

    except
      on E: Exception do
      begin
        Result := 0;
        registraErro(E.Message);
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Rollback;
      end;
    end;

  finally
    desconectar;
  end;
end;

procedure THW_Estatisticas.HomeGetStatusApiHw;
var
  AstatusApi: THW_StatusApi;
  ARest: TRestHW;
begin
  ARest := TRestHW.Create('', '');
  try

    if THwUtilsClass.GetIni('MD', 'CUSTOM_URL', '') = 'S' then
      ARest.urlApi := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
    else if THwUtilsClass.GetIni('MD', 'NOVA_URL', '') = 'S' then
      ARest.urlApi := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
    else
      ARest.urlApi := IfThen(THwUtilsClass.ComputadorDaRedeHwSistemas, AUrlApiHomologacao, AUrlApiProducao);

    try

      ARest.urlApi := THwUtilsClass.IncludeTrailingBackslash(ARest.urlApi);
      ARest.urlApi := ARest.urlApi.Replace('/api/', '/');

      ARest.metodo := 'home/getstatus';
      ARest.restRequest.Params.Clear;
      ARest.ExecutarGET;

      if not Assigned(ARest.restResponse) then
      begin
        THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', FormatDateTime('dd/mm/yyyy', Date + 1));
        Exit;
      end;

      if ARest.restResponse.StatusCode <> 200 then
      begin
        THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', FormatDateTime('dd/mm/yyyy', Date + 1));
        Exit;
      end;

      AstatusApi := THwClassRegistros.FromJsonString<THW_StatusApi>(ARest.restResponse.JSONValue.ToString);
      if not Assigned(AstatusApi) then
      begin
        THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', FormatDateTime('dd/mm/yyyy', Date + 1));
        Exit;
      end;

      if AstatusApi.status.Trim.ToUpper = 'INATIVO' then
      begin
        //testar a nova url antes de alterar no config, se der erro não muda
        ARest.urlApi := THwUtilsClass.IncludeTrailingBackslash(AstatusApi.api_url);
        ARest.urlApi := ARest.urlApi.Replace('/api/', '/');

        ARest.ExecutarGET;
        if not Assigned(ARest.restResponse) then
          Exit;
        if not ARest.restResponse.StatusCode = 200 then
          Exit;
        if THwClassRegistros.FromJsonString<THW_StatusApi>(ARest.restResponse.JSONValue.ToString).status.Trim.ToUpper = 'INATIVO' then
          Exit;
        //final do teste da url

        if AstatusApi.data_inat.Trim.IsEmpty then
          AstatusApi.data_inat := FormatDateTime('dd/mm/yyyy', Date + 1)
        else
          AstatusApi.data_inat := THwConvertDateTimeFormatUtils.ConvertDateTime(AstatusApi.data_inat, 'mongo', 'dd/mm/yyyy');

        THwUtilsClass.SetIni('MD', 'NOVA_URL', 'S');
        THwUtilsClass.SetIni('MD', 'URL_API' , THwUtilsClass.IncludeTrailingBackslash(AstatusApi.api_url));
        THwUtilsClass.SetIni('MD', 'URL_SITE', THwUtilsClass.IncludeTrailingBackslash(AstatusApi.site_url));
        THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', AstatusApi.data_inat);
      end
      else
      begin
        if AstatusApi.data_inat.Trim.IsEmpty then
          AstatusApi.data_inat := FormatDateTime('dd/mm/yyyy', Date + 1)
        else
        begin
          AstatusApi.data_inat := THwConvertDateTimeFormatUtils.ConvertDateTime(AstatusApi.data_inat, 'mongo', 'dd/mm/yyyy');

          if StrToDateTimeDef(AstatusApi.data_inat, Date) <= Date then
            AstatusApi.data_inat := FormatDateTime('dd/mm/yyyy', Date + 1)
        end;

        THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', AstatusApi.data_inat);
      end;
    except
      THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', FormatDateTime('dd/mm/yyyy', Date + 1));
    end;
  finally
  end;
end;

procedure THW_Estatisticas.SetCodEmpresa(const Value: Integer);
begin
  FCodEmpresa := Value;
end;

procedure THW_Estatisticas.SetDataBaseName(const Value: string);
begin
  FDataBaseName := Value;
end;

procedure THW_Estatisticas.SetPassWord(const Value: string);
begin
  FPassWord := Value;
end;

procedure THW_Estatisticas.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure THW_Estatisticas.SetUserNameHW(const Value: string);
begin
  FUserNameHW := Value;
end;

end.
