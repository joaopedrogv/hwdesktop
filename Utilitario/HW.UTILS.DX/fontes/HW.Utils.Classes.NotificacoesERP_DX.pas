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

unit HW.Utils.Classes.NotificacoesERP_DX;

interface

uses
  uClasseConexao, Windows, System.SysUtils,
  HW.Utils.Classes.Registros.NotificacoesNaoLidas_DX,
  HW.Utils.Classes.CentralAcoes,
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Rtti;

type
  TTipoVerificacao = (TiSetarData, TiRetirarData);

  [THwDBTableName('NOTIFICACAO_API')]
  THWDB_Notificacao_API = class(THwClassRegistros)
  private
    Fcnpj: string;
    Fdataconsulta: TDateTime;
    Fseqrandom: Integer;
    Ftoken: string;
    FdataHoraDB: TDateTime;
    Fdatafaturamento: TDateTime;
    Fcod_faturamento: Integer;
  public
    [THwDBField('cnpj', 14)]
    property cnpj: string read Fcnpj write Fcnpj;
    property token: string read Ftoken write Ftoken;
    property seqrandom: Integer read Fseqrandom write Fseqrandom;
    property dataconsulta: TDateTime read Fdataconsulta write Fdataconsulta;
    property datafaturamento: TDateTime read Fdatafaturamento write Fdatafaturamento;
    property cod_faturamento: Integer read Fcod_faturamento write Fcod_faturamento;
    [THwDBFieldNotIn()]
    property dataHoraDB: TDateTime read FdataHoraDB write FdataHoraDB;
  end;

  THWDB_Notificacao_Api_Usuarios = class

  end;

  TVerificarBakup = class(TConexao)
  private
    FCodEmpresa: Integer;
    FDataBasePath: string;
    FDevelopmentMode: Boolean;
    SilentMod: Boolean;
  public
    constructor Create(); overload; override;
    constructor Create(silentMode: Boolean); overload; virtual;
    function dataVerificacaoNotificacaoBackup: Boolean;
    function verificarNotificacaoBackupERP(pCodEmpresa: Integer; pUsuario: WideString;
      var pDataAtual: TDateTime; var pDataUltBackup: TDateTime; var pMensagem: string): Boolean;
    function atualizarDataVerificacaoBackup(pTipoVerificacao: TTipoVerificacao): Boolean;
    function atualizarDataNotificacaoBackup: Boolean;

    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property DataBasePath: string read FDataBasePath write FDataBasePath;
    property DevelopmentMode: Boolean read FDevelopmentMode write FDevelopmentMode;
  end;

  TCentralNotificacoesDB_ERP = class(TConexao)
  private
    FCentralSuporte: THW_CentralSuporte;
    FdbToken: THWDB_Notificacao_API;
    FdbNofificacoes : THWDB_Notificacao_Api_Usuarios;

    Fcnpj, Femail: string;
    FLastError: string;
    function db_inserirNotificacaoUsuario(Aemail: string; Anotificacao: TNotificacoesNaoLidas): string;
    function db_getNotificacoesERP(var Anotificacoes_db: TArray<TNotificacoesNaoLidas>): string;
    function db_getNotificacoesLidasERP(var Anotificacoes_db: TArray<TNotificacoesNaoLidas>): string;
    function db_salvarNotificacoes(AjsonNotificacoes: string): string;
    function db_excluirNotificacao(Acod_notif: Integer): string;
    function db_getToken: string;
    function db_setSequenciaParaConsultaToken: string;
    function db_setToken: string;

    function api_marcarNotificacoesLidas(var AjsonNotificacoes: string): string;

  public
    destructor Destroy; override;
    constructor create(Acnpj: string; Aemail: string = '');

    function verificarNotificacoesNaApi: string;

    function db_getNotificacoesnNaoLidasERP(var Anotificacoes_db: TArray<TNotificacoesNaoLidas>): Boolean;
    function db_NotificacaoMarcarComoLida(var Anotificacoes: TArray<TNotificacoesNaoLidas>; ANotificacao: TNotificacoesNaoLidas): boolean;

    property LastError: string read FLastError write FLastError;
  end;

implementation

uses
  HW.Utils.Classes.Funcoes_DX,
  HW.Utils.Classes.Registros.NotificacoesNaoLidasERP_DX,
  Data.DB, System.DateUtils, HW.Utils.Classes.Registros.Cliente_DX,
  hw_win_utils;

{ TCentralNotificacoesDB_ERP }

function TCentralNotificacoesDB_ERP.api_marcarNotificacoesLidas(var AjsonNotificacoes: string): string;
var
  AresultNotificacoesERP: TArray<TNotificacoesNaoLidasERP>;
  AnotificacaoERP: TNotificacoesNaoLidasERP;

  AresultNotificacoesUs: TArray<TNotificacoesNaoLidas>;
  AnotificacaoUs: TNotificacoesNaoLidas;

  AnotificacoesLidas_db: TArray<TNotificacoesNaoLidas>;
  AnotificacaoLida_db: TNotificacoesNaoLidas;

  ANotifiLida, ANotifiNaApi: Boolean;
  Aresp: string;

begin
  try
    SetLength(AresultNotificacoesERP, 0);

    Aresp := db_getNotificacoesLidasERP(AnotificacoesLidas_db);
    if Aresp <> 'OK' then raise Exception.Create(Aresp);

    //for nos usuarios para marcar na api as notificoes lidas do banco e exclui-las
    for AnotificacaoERP in THwClassRegistros.FromJsonToArray<TNotificacoesNaoLidasERP>(AjsonNotificacoes) do
    begin
      SetLength(AresultNotificacoesERP, Length(AresultNotificacoesERP) + 1);

      SetLength(AresultNotificacoesUs, 0);

      //for nas notificacoes do usuario
      for AnotificacaoUs in AnotificacaoERP.notificacoes do
      begin
//        AnotificacaoERP.email;
//        AnotificacaoUs.cod_notif;

        //verificar notificacao lida no
        ANotifiLida := False;
        for AnotificacaoLida_db in AnotificacoesLidas_db do
          if AnotificacaoLida_db.cod_notif = AnotificacaoUs.cod_notif then
          begin
            ANotifiLida := True;
            Break;
          end;

        if ANotifiLida then // notificacao lida, marcar lida na api e exclui do banco
        begin
          //tenta marcar como lida na api
          if FCentralSuporte.NotificacaoMarcarComoLida(AnotificacaoERP.cod_usuario, AnotificacaoUs) then
          begin
            Aresp := db_excluirNotificacao(AnotificacaoUs.cod_notif);
            if Aresp <> 'OK' then raise Exception.Create(Aresp);
          end
          else
          begin
            SetLength(AresultNotificacoesUs, Length(AresultNotificacoesUs) + 1);
            AresultNotificacoesUs[High(AresultNotificacoesUs)] := AnotificacaoUs;
          end;
        end
        else
        begin
          SetLength(AresultNotificacoesUs, Length(AresultNotificacoesUs) + 1);
          AresultNotificacoesUs[High(AresultNotificacoesUs)] := AnotificacaoUs;
        end;
      end;
      AnotificacaoERP.notificacoes := AresultNotificacoesUs;
      AresultNotificacoesERP[High(AresultNotificacoesERP)] := AnotificacaoERP;
    end;

    Aresp := db_getNotificacoesERP(AnotificacoesLidas_db);
    if Aresp <> 'OK' then raise Exception.Create(Aresp);
    // for nas notificacoes do banco que estao lidas para excluir caso nao estejam na api
    for AnotificacaoLida_db in AnotificacoesLidas_db do
    begin
      ANotifiNaApi := False;

      for AnotificacaoERP in AresultNotificacoesERP do
        for AnotificacaoUs in AnotificacaoERP.notificacoes do//AresultNotificacoesUs do
          if AnotificacaoUs.cod_notif = AnotificacaoLida_db.cod_notif then
          begin
            ANotifiNaApi := True;
            Break;
          end;
      if not ANotifiNaApi then
      begin
        Aresp := db_excluirNotificacao(AnotificacaoLida_db.cod_notif);
        if Aresp <> 'OK' then raise Exception.Create(Aresp);
      end;
    end;

    AjsonNotificacoes := THwClassRegistros.ArrayObjectToJsonStringEncode<TNotificacoesNaoLidasERP>(AresultNotificacoesERP);

    Result := 'OK';
  except on E: Exception do
    begin
      Result := e.Message;
      FLastError := e.Message;
    end;
  end;
end;

constructor TCentralNotificacoesDB_ERP.create(Acnpj: string; Aemail: string);
begin
  inherited Create;
  Fcnpj := Acnpj;
  Femail := Aemail;
  FLastError := '';
end;

function TCentralNotificacoesDB_ERP.db_excluirNotificacao(Acod_notif: Integer): string;
begin
  try

    QrAux.Close;
    QrAux.SQL.Text := 'delete FROM NOTIFICACAO_API_USUARIOS' +
      ' where cnpj = :cnpj' +
      ' and cod_notif = :cod_notif';
    QrAux.ParamByName('cnpj').AsString := Fcnpj;
    QrAux.ParamByName('cod_notif').AsInteger := Acod_notif;
    QrAux.ExecSQL;

    Result := 'OK';
  except on E: Exception do
    begin
      Result := E.Message;
      FLastError := e.Message;
    end;
  end;
end;

function TCentralNotificacoesDB_ERP.db_getNotificacoesLidasERP(var Anotificacoes_db: TArray<TNotificacoesNaoLidas>): string;
var
  Anotificacao: TNotificacoesNaoLidas;
begin
  try

    QrAux.Close;
    QrAux.SQL.Text := 'select * from NOTIFICACAO_API_USUARIOS' +
      ' where cnpj = :cnpj and lido = 1';
    QrAux.ParamByName('cnpj').AsString := Fcnpj;
    QrAux.Open;
    QrAux.FetchAll;
    SetLength(Anotificacoes_db, 0);

    QrAux.First;
    while not QrAux.Eof do
    begin
      Anotificacao := TNotificacoesNaoLidas.Create;
      Anotificacao.cod_notif := QrAux.FieldByName('cod_notif').AsInteger;

      SetLength(Anotificacoes_db, Length(Anotificacoes_db) + 1);
      Anotificacoes_db[High(Anotificacoes_db)] := Anotificacao;

      QrAux.Next;
    end;
    QrAux.Close;

    Result := 'OK';
  except on E: Exception do
    begin
      Result := E.Message;
      FLastError := e.Message;
    end;
  end;
end;

function TCentralNotificacoesDB_ERP.db_getNotificacoesnNaoLidasERP(
  var Anotificacoes_db: TArray<TNotificacoesNaoLidas>): Boolean;
var
  Anotificacao: TNotificacoesNaoLidas;
begin
  try

    QrAux.Close;
    QrAux.SQL.Text := 'select * from NOTIFICACAO_API_USUARIOS' +
      ' where cnpj = :cnpj and usuario = :usuario and lido = 0';
    QrAux.ParamByName('cnpj').AsString := Fcnpj;
    QrAux.ParamByName('usuario').AsString := Femail;
    QrAux.Open;
    QrAux.FetchAll;
    SetLength(Anotificacoes_db, 0);

    QrAux.First;
    while not QrAux.Eof do
    begin
      Anotificacao := THwClassRegistros.FromJsonString<TNotificacoesNaoLidas>(QrAux.FieldByName('notificacoes').AsString);
      if Assigned(Anotificacao) then
      begin
        SetLength(Anotificacoes_db, Length(Anotificacoes_db) + 1);
        Anotificacoes_db[High(Anotificacoes_db)] := Anotificacao;
      end;

      QrAux.Next;
    end;
    QrAux.Close;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      FLastError := e.Message;
    end;
  end;
end;

function TCentralNotificacoesDB_ERP.db_getNotificacoesERP(
  var Anotificacoes_db: TArray<TNotificacoesNaoLidas>): string;
var
  Anotificacao: TNotificacoesNaoLidas;
begin
  try

    QrAux.Close;
    QrAux.SQL.Text := 'select * from NOTIFICACAO_API_USUARIOS' +
      ' where cnpj = :cnpj';
    QrAux.ParamByName('cnpj').AsString := Fcnpj;
    QrAux.Open;
    QrAux.FetchAll;
    SetLength(Anotificacoes_db, 0);

    QrAux.First;
    while not QrAux.Eof do
    begin
      Anotificacao := TNotificacoesNaoLidas.Create;
      Anotificacao.cod_notif := QrAux.FieldByName('cod_notif').AsInteger;

      SetLength(Anotificacoes_db, Length(Anotificacoes_db) + 1);
      Anotificacoes_db[High(Anotificacoes_db)] := Anotificacao;

      QrAux.Next;
    end;
    QrAux.Close;

    Result := 'OK';
  except on E: Exception do
    begin
      Result := E.Message;
      FLastError := e.Message;
    end;
  end;
end;

function TCentralNotificacoesDB_ERP.db_getToken: string;
begin
  try
    if Assigned(FdbToken) then
      FreeAndNil(FdbToken);

    QrAux.Close;
    QrAux.SQL.Text := 'select napi.*, (select current_ts from sp_current_ts) datahorabanco from NOTIFICACAO_API napi' +
      ' where cnpj = :cnpj';
    QrAux.ParamByName('cnpj').AsString := Fcnpj;
    QrAux.Open;

    if QrAux.IsEmpty then
    begin
      QrAux.Close;
      QrAux.SQL.Text := 'select (current_ts - 1) dataconsulta, current_ts datahorabanco from sp_current_ts';
      QrAux.Open;

      FdbToken                 := THWDB_Notificacao_API.Create;
      FdbToken.cnpj            := Fcnpj;
      FdbToken.token           := '';
      FdbToken.seqrandom       := 0;
      FdbToken.dataconsulta    := QrAux.FieldByName('dataconsulta').AsDateTime;
      FdbToken.dataHoraDB      := QrAux.FieldByName('datahorabanco').AsDateTime;
      FdbToken.datafaturamento := FdbToken.dataconsulta;
      FdbToken.cod_faturamento := 0;

      QrAux.Close;
      QrAux.SQL.Text := THwRttiConverter.ClassToSqlInsert(FdbToken.ClassType, []);

      FdbToken.SetObjectToDataSetParams(QrAux.Params);
      QrAux.ExecSQL;
      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;
    end
    else
    begin
      FdbToken := THwDbConverter.DataSetRowToObject<THWDB_Notificacao_API>(TDataSet(QrAux));
      FdbToken.dataHoraDB := QrAux.FieldByName('datahorabanco').AsDateTime;
    end;

    Result := 'OK';
  except on E: Exception do
    begin
      Result := e.Message;
      FLastError := e.Message;
    end;
  end;
end;

function TCentralNotificacoesDB_ERP.db_inserirNotificacaoUsuario(Aemail: string; Anotificacao: TNotificacoesNaoLidas): string;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text := 'insert into NOTIFICACAO_API_USUARIOS (CNPJ, USUARIO, COD_NOTIF, NOTIFICACOES)' +
                      ' values (:CNPJ, :USUARIO, :COD_NOTIF, :NOTIFICACOES)';
    QrAux.ParamByName('cnpj').AsString := Fcnpj;
    QrAux.ParamByName('usuario').AsString := Aemail;
    QrAux.ParamByName('cod_notif').AsInteger := Anotificacao.cod_notif;
    QrAux.ParamByName('notificacoes').AsString := Anotificacao.ToJsonStringEncode;
    QrAux.ExecSQL;

    Result := 'OK';
  except on E: Exception do
    begin
      Result := e.Message;
      FLastError := e.Message;
    end;
  end;
end;

function TCentralNotificacoesDB_ERP.db_NotificacaoMarcarComoLida(var Anotificacoes: TArray<TNotificacoesNaoLidas>;
  ANotificacao: TNotificacoesNaoLidas): boolean;
var
  ATempNotificacoes: TArray<TNotificacoesNaoLidas>;
  AItem: TNotificacoesNaoLidas;
begin
  try

    QrAux.Close;
    QrAux.SQL.Text := 'update NOTIFICACAO_API_USUARIOS set lido = 1' +
      ' where cnpj = :cnpj' +
      ' and cod_notif = :cod_notif';
    QrAux.ParamByName('cnpj').AsString := Fcnpj;
    QrAux.ParamByName('cod_notif').AsInteger := ANotificacao.cod_notif;
    QrAux.ExecSQL;

    Result := QrAux.RowsAffected > 0;

    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;

    if Result then
    begin
      try
        SetLength(ATempNotificacoes, 0);
        for AItem in Anotificacoes do
        begin

//          if AItem.cod_notif <> ANotificacao.cod_notif then
//          begin
//            SetLength(ATempNotificacoes, Length(ATempNotificacoes) + 1);
//            ATempNotificacoes[High(ATempNotificacoes)] := AItem;
          //end;
          if AItem.cod_notif = ANotificacao.cod_notif then
            AItem.data_visualizacao := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(now, 'mongo');

          SetLength(ATempNotificacoes, Length(ATempNotificacoes) + 1);
          ATempNotificacoes[High(ATempNotificacoes)] := AItem;
        end;

        Anotificacoes := ATempNotificacoes;
      except
      end;
    end;

  except on E: Exception do
    begin
      Result := False;
      FLastError := e.Message;
    end;
  end;
end;

function TCentralNotificacoesDB_ERP.db_salvarNotificacoes(AjsonNotificacoes: string): string;
var
  AnotificacoesERP_DB: TArray<TNotificacoesNaoLidas>;
  AnotificacaoERP: TNotificacoesNaoLidasERP;
  AnotificacaoERP_US, AnotificacaoERP_DB: TNotificacoesNaoLidas;


  Aresp: string;
  ANewNotif: Boolean;
begin
  try
    Aresp := db_getNotificacoesERP(AnotificacoesERP_DB);
    if Aresp <> 'OK' then raise Exception.Create(Aresp);

    for AnotificacaoERP in THwClassRegistros.FromJsonToArray<TNotificacoesNaoLidasERP>(AjsonNotificacoes) do
    begin
      for AnotificacaoERP_US in AnotificacaoERP.notificacoes do
      begin
        ANewNotif := True;
        for AnotificacaoERP_DB in AnotificacoesERP_DB do
          if AnotificacaoERP_DB.cod_notif = AnotificacaoERP_US.cod_notif then
          begin
            ANewNotif := False;
            Break;
          end;
        if ANewNotif then
        begin
          Aresp := db_inserirNotificacaoUsuario(AnotificacaoERP.email, AnotificacaoERP_US);
          if Aresp <> 'OK' then raise Exception.Create(Aresp);
        end;
      end;
    end;

    Result := 'OK';
  except on E: Exception do
    begin
      Result := E.Message;
      FLastError := e.Message;
    end;
  end;
end;

function TCentralNotificacoesDB_ERP.db_setSequenciaParaConsultaToken: string;
var
  ARandom: Word;
  ArowsAffected: Boolean;
begin
  try
    QrAux.Close;
    Randomize();
    ARandom := Random(MAXWORD);

    QrAux.SQL.Text := 'update NOTIFICACAO_API set seqrandom = :seqrandom, dataconsulta = :datahorabanco' +
      ' where cnpj = :cnpj and seqrandom = ' + FdbToken.seqrandom.ToString +
      ' and dataconsulta = :dataconsulta';
    QrAux.ParamByName('cnpj').AsString := Fcnpj;
    QrAux.ParamByName('seqrandom').AsInteger := ARandom;
    QrAux.ParamByName('dataconsulta').AsDateTime  := FdbToken.dataconsulta;
    QrAux.ParamByName('datahorabanco').AsDateTime := FdbToken.dataHoraDB;
    QrAux.ExecSQL;

    ArowsAffected := QrAux.RowsAffected > 0;
    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;

    QrAux.Close;
    QrAux.SQL.Text := 'select napi.*, (select current_ts from sp_current_ts) datahorabanco from NOTIFICACAO_API napi' +
      ' where cnpj = :cnpj';
    QrAux.ParamByName('cnpj').AsString := Fcnpj;
    QrAux.Open;

    if QrAux.FieldByName('seqrandom').AsInteger = ARandom then
    begin
      QrAux.Close;
      FdbToken.seqrandom := ARandom;
      Result := 'OK';
    end
    else
      Result := 'ERRO';
  except on E: Exception do
    begin
      Result := e.Message;
      FLastError := e.Message;
    end;
  end;
end;

function TCentralNotificacoesDB_ERP.db_setToken: string;
begin
  try
    QrAux.Close;
    QrAux.SQL.Text := 'update NOTIFICACAO_API set token = :token,' +
      ' datafaturamento = :datafaturamento, cod_faturamento = :cod_faturamento' +
      ' where cnpj = :cnpj and seqrandom = :seqrandom';
    QrAux.ParamByName('cnpj').AsString             := Fcnpj;
    QrAux.ParamByName('seqrandom').AsInteger       := FdbToken.seqrandom;
    QrAux.ParamByName('token').AsString            := FdbToken.token;
    QrAux.ParamByName('datafaturamento').AsDate    := DateOf(FdbToken.datafaturamento);
    QrAux.ParamByName('cod_faturamento').AsInteger := FdbToken.cod_faturamento;
    QrAux.ExecSQL;
    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;
    Result := 'OK';
  except on E: Exception do
    begin
      Result := e.Message;
      FLastError := e.Message;
    end;
  end;
end;

destructor TCentralNotificacoesDB_ERP.Destroy;
begin
  if Assigned(FCentralSuporte) then
    FreeAndNil(FCentralSuporte);
  inherited;
end;

function TCentralNotificacoesDB_ERP.verificarNotificacoesNaApi: string;
var
  AJson: string;
  Aresp: string;
  AIntervalo: TDateTime;
  ACliente: TCliente;
//  Atoken_: string;
begin
  Result := 'OK';

  if not conectar(False) then
    Exit;

  try
    try
      //obtendo os dados do banco para verificar data e hora
      Aresp := db_getToken;
      if Aresp <> 'OK' then raise Exception.Create(Aresp);
//      AIntervalo := DaySpan(now);
//                                    dayspan(now, now);
      AIntervalo := DaySpan(FdbToken.dataHoraDB , FdbToken.dataconsulta);
      if AIntervalo < EncodeTime(0, 30, 0, 0) then
        Exit;

      //alterando a data de consulta para poder iniciar o processo
      Aresp := db_setSequenciaParaConsultaToken;
      if Aresp <> 'OK' then raise Exception.Create(Aresp);

      //iniciando o processo
      FCentralSuporte := THW_CentralSuporte.create('', '*@EMPRESA@*', string(Fcnpj), FdbToken.Ftoken);
      try

        if not FCentralSuporte.LoginExecutar then
          Exit('ERRO');

        Aresp := FCentralSuporte.NotificacaoNotificarERP;
        if not Aresp.Equals('OK') then
          if Aresp.Contains('A Conexão foi interrompida') then
          begin
            FCentralSuporte.resposta.accesstoken := '';

            if not FCentralSuporte.LoginExecutar then
              Exit('ERRO');

            Aresp := FCentralSuporte.NotificacaoNotificarERP;
            if not Aresp.Equals('OK') then
              Exit(Aresp);
          end
          else
            Exit('ERRO');

        if not FCentralSuporte.resposta.clienteHw.Trim.IsEmpty then
        begin
          ACliente := TCliente.FromJsonString<TCliente>(FCentralSuporte.resposta.clienteHw);
          if Assigned(ACliente) then
          begin
            if Assigned(FCentralSuporte.acessToken) then
              FdbToken.datafaturamento := DateOf(
                                            THwConvertDateTimeFormatUtils.ConvertStrToDateTime(
                                              FCentralSuporte.acessToken.data_servidor, 'mongo')
                                          );
            FdbToken.cod_faturamento := ACliente.cod_faturamento;
          end;
        end;

        AJson := FCentralSuporte.resposta.notificacoesERPJson;

        Aresp := api_marcarNotificacoesLidas( AJson );
        if Aresp <> 'OK' then raise Exception.Create(Aresp);
        FCentralSuporte.resposta.notificacoesERPJson := AJson;

        Aresp := db_salvarNotificacoes(
          FCentralSuporte.resposta.notificacoesERPJson
        );
        if Aresp <> 'OK' then raise Exception.Create(Aresp);

        FCentralSuporte.resposta.notificacoesERPJson := '';
        FCentralSuporte.resposta.notificacoesJson := '';

        FdbToken.token := THwUtilsClass.EncodeASCIIBase64(FCentralSuporte.resposta.ToJsonStringEncode) ;

        Aresp := db_setToken;
        if Aresp <> 'OK' then raise Exception.Create(Aresp);

      finally
        FreeAndNil(FCentralSuporte);
      end;

    except on E: Exception do
      begin
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Rollback;
        Result := E.message;
        FLastError := e.Message;
      end;
    end;
  finally
    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;
    desconectar;
  end;
end;

{ TVerificarBakup }

function TVerificarBakup.atualizarDataNotificacaoBackup: Boolean;
begin
  try
    Result := False;

    QrAux.Close;
    QrAux.SQL.Text := ' update empdesvolv set data_notificacao_backup = current_date ' +
      ' where cod_empdes = :cod_empdes ';
    QrAux.ParamByName('cod_empdes').AsInteger := 1;
    QrAux.ExecSQL;

    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TVerificarBakup.atualizarDataVerificacaoBackup(pTipoVerificacao: TTipoVerificacao): Boolean;
begin
  try
    Result := False;

    QrAux.Close;
    if pTipoVerificacao = TiSetarData then
      QrAux.SQL.Text := ' update empdesvolv set data_verificacao_backup = current_date ' +
        ' where cod_empdes = :cod_empdes '
    else
      QrAux.SQL.Text := ' update empdesvolv set data_verificacao_backup = null ' +
        ' where cod_empdes = :cod_empdes ';
    QrAux.ParamByName('cod_empdes').AsInteger := 1;
    QrAux.ExecSQL;

    if QrAux.Transaction.InTransaction then
      QrAux.Transaction.Commit;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

constructor TVerificarBakup.Create;
begin
  inherited Create();
  SilentMod := False;
  FDevelopmentMode := THwUtilsClass.GetIni('MD', 'MODODEVAPIS', 'N') = 'S';//ModoDesenvolvimentoApis
end;

constructor TVerificarBakup.Create(silentMode: Boolean);
begin
  Create;
  SilentMod := silentMode;
end;

function TVerificarBakup.dataVerificacaoNotificacaoBackup: Boolean;
begin
  try
    Result := False;

    QrAux.Close;
    QrAux.SQL.Text := ' select empdesvolv.verificar_backup, ' +
      ' cast(empdesvolv.data_backup_banco as date) data_backup_banco, ' +
      ' cast(empdesvolv.data_backup_outros as date) data_backup_outros, ' +
      ' case when (empdesvolv.notificar_backup_apos_dias > 1) then empdesvolv.notificar_backup_apos_dias else 1 end notificar_backup_apos_dias, ' +
      ' case when (empdesvolv.enviar_notificacao_cada_dias > 1) then empdesvolv.enviar_notificacao_cada_dias else 1 end enviar_notificacao_cada_dias, ' +
      ' cast(empdesvolv.data_verificacao_backup as date) data_verificacao_backup, ' +
      ' cast(empdesvolv.data_notificacao_backup as date) data_notificacao_backup, ' +
      ' current_date from empdesvolv ' +
      ' where empdesvolv.cod_empdes = :cod_empdes ';
    QrAux.ParamByName('cod_empdes').AsInteger := 1;
    QrAux.Open;

    // Enviar notificacao
    if QrAux.FieldByName('verificar_backup').AsString <> 'S' then
      Exit;

    // Notificar apos x dias
    if (QrAux.FieldByName('current_date').AsDateTime - QrAux.FieldByName('notificar_backup_apos_dias').AsInteger >= QrAux.FieldByName('data_backup_banco').AsDateTime) then
      Result := True;
//    else if (QrAux.FieldByName('current_date').AsDateTime - QrAux.FieldByName('notificar_backup_apos_dias').AsInteger >= QrAux.FieldByName('data_backup_outros').AsDateTime) then
//      Result := True;

    // Notificar a cada x dias (data_verificacao_backup)
    if Result then
    begin
      if (QrAux.FieldByName('current_date').AsDateTime - 1 >= QrAux.FieldByName('data_verificacao_backup').AsDateTime) then
        Result := True
      else
        Result := False;
    end;

    // Notificar a cada x dias (data_notificacao_backup)
    if Result then
    begin
      if (QrAux.FieldByName('current_date').AsDateTime  - QrAux.FieldByName('enviar_notificacao_cada_dias').AsInteger >= QrAux.FieldByName('data_notificacao_backup').AsDateTime) then
        Result := True
      else
        Result := False;
    end;

  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TVerificarBakup.verificarNotificacaoBackupERP(pCodEmpresa: Integer; pUsuario: WideString;
  var pDataAtual: TDateTime; var pDataUltBackup: TDateTime; var pMensagem: string): Boolean;
var
  vEmpresaFis: boolean;
  vNomePC, vIP, vSerialHd: string;
  vDataBackupBanco: TDateTime;
  vDataBackupOutros: TDateTime;
  vDataBackupUlt: TDateTime;
begin
  try
    Result := False;

    QrAux.Close;
    QrAux.SQL.Text := ' select current_date, empdesvolv.data_backup_banco, empdesvolv.data_backup_outros from empdesvolv' +
      ' where empdesvolv.cod_empdes = 1 ';
    QrAux.Open;

    pDataAtual  := QrAux.FieldByName('current_date').AsDateTime;
    pDataUltBackup := QrAux.FieldByName('data_backup_banco').AsDateTime;

    vDataBackupBanco  := QrAux.FieldByName('data_backup_banco').AsDateTime;
    vDataBackupOutros := QrAux.FieldByName('data_backup_outros').AsDateTime;

//    if vDataBackupOutros > vDataBackupBanco then
//      vDataBackupUlt := vDataBackupOutros
//    else
    vDataBackupUlt := vDataBackupBanco;


    QrAux.Close;
    QrAux.SQL.Text := ' select empresa.cod_empresa from empresa ' +
      ' inner join empresa_fisica on empresa_fisica.cod_empresa = empresa.cod_empresa ' +
      ' where empresa_fisica.cod_empresa > 0 ' +
      ' and empresa.ativo = 1 ' +
      ' and empresa.cgc_emp <> ''03530705000109'' ';
    QrAux.Open;

    vEmpresaFis := QrAux.RecordCount > 0;

    if vEmpresaFis then
    begin
      QrAux.Close;
      QrAux.SQL.Text := ' select empresa.nome_emp, empresa.fantasia_emp, empresa.cgc_emp from empresa ' +
        ' inner join empresa_fisica on empresa_fisica.cod_empresa = empresa.cod_empresa ' +
        ' where empresa_fisica.cod_empresa > 0 ' +
        ' and empresa.ativo = 1 ' +
        ' and empresa.cgc_emp <> ''03530705000109'' ';
      QrAux.Open;
      QrAux.FetchAll;
    end
    else
    begin
      QrAux.Close;
      QrAux.SQL.Text := ' select empresa.nome_emp, empresa.fantasia_emp, empresa.cgc_emp from empresa ' +
        ' inner join empdesvolv on coalesce(empdesvolv.cod_empresa_fisica, ' + IntToStr(pCodEmpresa) + ') = empresa.cod_empresa ' +
        ' where empdesvolv.cod_empdes = :cod_empdes ' +
        ' and empresa.cod_empresa > 0 '  +
        ' and empresa.ativo = 1 ' +
        ' and empresa.cgc_emp <> ''03530705000109'' ';
      QrAux.ParamByName('cod_empdes').AsInteger := 1;
      QrAux.Open;
      QrAux.FetchAll;

      if QrAux.RecordCount <= 0 then
      begin
        if pCodEmpresa > 0 then
        begin
          QrAux.Close;
          QrAux.SQL.Text := ' select empresa.nome_emp, empresa.fantasia_emp, empresa.cgc_emp from empresa ' +
            ' where empresa.cod_empresa = ' + IntToStr(pCodEmpresa);
          QrAux.Open;
          QrAux.FetchAll;
        end
        else
        begin
          QrAux.Close;
          QrAux.SQL.Text := ' select empresa.nome_emp, empresa.fantasia_emp, empresa.cgc_emp from empresa ' +
            ' where empresa.cod_empresa > 0 ' +
            ' and empresa.ativo = 1 ' +
            ' and empresa.cgc_emp <> ''03530705000109'' ';
          QrAux.Open;
        end;
        QrAux.FetchAll;
      end;
    end;

    vNomePC   := getComputer;
    vIP       := getIP;
    vSerialHd := getSerialHd;

    if trim(pUsuario) <> '' then
      pMensagem := pMensagem +
        '<b>USUARIO: </b>' + trim(pUsuario) + '<br />';

    if trim(vNomePC) <> '' then
      pMensagem := pMensagem +
        '<b>NOMECOMPUTADOR: </b>' + trim(vNomePC) + '<br />';

    if trim(vIP) <> '' then
      pMensagem := pMensagem +
        '<b>IP: </b>' + trim(vIP) + '<br />';

    if trim(vSerialHd) <> '' then
      pMensagem := pMensagem +
        '<b>SERIAL HD: </b>' + trim(vSerialHd) + '<br />';

    pMensagem := pMensagem +
        '<b>DATA ULT BACKUP: </b>' + FormatDateTime('dd/mm/yyyy', vDataBackupUlt) + '<br />';

    pMensagem := pMensagem + '<br /> ';

    QrAux.First;
    while not QrAux.Eof do
    begin
      pMensagem := pMensagem +
        '<b>RAZAO: </b>' + trim(QrAux.FieldByName('NOME_EMP').AsString) + '<br />' +
        '<b>FANTASIA: </b>' + trim(QrAux.FieldByName('FANTASIA_EMP').AsString) + '<br />' +
        '<b>CNPJ:</b> ' + trim(QrAux.FieldByName('CGC_EMP').AsString) + '<br /><br />';

      QrAux.Next;
    end;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

end.
