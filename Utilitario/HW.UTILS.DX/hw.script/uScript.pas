unit uScript;

interface

uses
  uClasseConexao;

type
  TTiposSql = (tsInsert, tsUpdate, tsUpdateInsert, tsDelete, tsUpdateFieldMetadata, tsUpdateMetadata,
               tsCreateTable, tsDropTable, tsCreateView, tsDropView, tsCreateTrigger, tsDropTrigger,
               tsCreateProcedure, tsDropProcedure, tsCreateIndex, tsCreateUniqueIndex, tsDropIndex,
               tsCreateSequence, tsDropSequence,
               tsOutros);

  THwScript = class(TConexao)
  private
    function IsScriptAndResolve(keystart: string; text: string; var name: string): Boolean;
    procedure DefinirTipos;
    procedure ResolveFields;
  public
    function HwRecriarView(banco: string; codempresa: Integer): boolean;
  end;

  THw_NBACKUP = class(TConexao)
  private
    Fgui: Boolean;
    FBanco: string;
    Fparams: string;
    Fcmd: string;
    function GetFileNameXMLTaskSchedule(banco: string): string;
    function GetFileNameXMLTaskScheduleHoraExata(banco: string; dh: TDateTime): string;
    function GetFireBirdFolderBin: string;
    procedure ShowLastBackupHistory(banco, params: string);
    procedure ShowComandLine(cmd: string);
    function GetLastBackupHistory(level: Integer): TConexao_OOP;
    function getPartFileName(tipo: string; data: TDateTime): string;
    function IsTimeBackup(tipo: string; dh_atual, dh_lastbkp: TDateTime; offsetHora: Integer = 0): Boolean;
    procedure RegistraLogExecucao(status, log: string; data: TDateTime; level: Integer);
    procedure ResolverDiretorio(dir: string);
    function RenameFileExt(filename, ext: string; randoext: Boolean): string;
    function RemoverArquivoExistente(filename: string): Boolean;
  public
    function GetHistoryData(data_base: TDateTime; level_str: string = ''; first_records: integer = 0): THw_NBACKUP;

    procedure InitGUI(banco, params: string);

    procedure Executar(banco, params: string);

  end;

implementation

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  System.DateUtils,
  System.Math,
  System.IOUtils,
  Vcl.Forms,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Controls,
  Vcl.Clipbrd,
  Winapi.Windows,
  Winapi.ShellAPI,
//  Winapi.SHFolder,
//  Winapi.ShlObj,
  IBX.IBQuery,
  hw_utils,
  hw_win_utils,
  config_sistema_class,
  HW.Utils.Classes.Funcoes_DX,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Form.NbackupHw;

function hw_sql_script_exec(EnderecoBanco, Usuario, Senha, Script: WideString; Commitar: LongBool): WideString; stdcall; external 'HwScript.dll';
procedure hw_sql_script_free; stdcall; external 'HwScript.dll';

{ THwScript }

function THwScript.IsScriptAndResolve(keystart: string; text: string; var name: string): Boolean;
begin
  if text.StartsWith(keystart, True) then
  begin
    Result := True;
    System.Delete(text, 1, keystart.Length);
    name :=  OnlyNumberAndLetters(text, '_', True, 32).Trim();
    if Pos(' ', name) > 0 then
      name := Copy(name, 1, Pos(' ', name) - 1);
  end
  else
    Result := False;
end;

procedure THwScript.ResolveFields;
const
  sqlVIEW_EXEC = 'ALTER TABLE REESTRURURA_SQL ADD VIEW_EXEC CHAR(1);';
  sqlDATA_ULT_EXEC = 'ALTER TABLE REESTRURURA_SQL ADD DATA_ULT_EXEC TIMESTAMP;';
  sqlTIPO = 'ALTER TABLE REESTRURURA_SQL ADD TIPO SMALLINT;';
  sqlTIPONAME = 'ALTER TABLE REESTRURURA_SQL ADD TIPONAME VARCHAR(31);';
  sqlIDX_REESTRURURA_SQL_TIPO = 'CREATE INDEX IDX_REESTRURURA_SQL_TIPO ON REESTRURURA_SQL (TIPO);';
var
  list: TStringList;
  I: Integer;
begin
  list := NewStringList(True);
  list.Add(sqlVIEW_EXEC);
  list.Add(sqlDATA_ULT_EXEC);
  list.Add(sqlTIPO);
  list.Add(sqlTIPONAME);
  list.Add(sqlIDX_REESTRURURA_SQL_TIPO);

  ClientOOP(' select trim(r.rdb$relation_name) tabela, trim(r.rdb$field_name) campo from rdb$relation_fields r ' +
            ' join rdb$fields f on f.rdb$field_name = rdb$field_source ' +
            ' where (r.rdb$relation_name = ''REESTRURURA_SQL'') and (r.rdb$field_name in' +
            ' (''VIEW_EXEC'', ''DATA_ULT_EXEC'', ''TIPO'', ''TIPONAME''))' +
            ' union' +
            ' select trim(i.rdb$relation_name) tabela, trim(i.rdb$index_name) campo from RDB$INDICES i' +
            ' where (i.rdb$relation_name = ''REESTRURURA_SQL'')' +
            ' and (i.rdb$index_name in (''IDX_REESTRURURA_SQL_TIPO''))').First;

  while not Client.Eof do
  begin
    if Client.fequals('campo', 'VIEW_EXEC') then
      if list.IndexOf(sqlVIEW_EXEC) >= 0 then
        list.Delete(list.IndexOf(sqlVIEW_EXEC));

    if Client.fequals('campo', 'DATA_ULT_EXEC') then
      if list.IndexOf(sqlDATA_ULT_EXEC) >= 0 then
        list.Delete(list.IndexOf(sqlDATA_ULT_EXEC));

    if Client.fequals('campo', 'TIPO') then
      if list.IndexOf(sqlTIPO) >= 0 then
        list.Delete(list.IndexOf(sqlTIPO));

    if Client.fequals('campo', 'TIPONAME') then
      if list.IndexOf(sqlTIPONAME) >= 0 then
        list.Delete(list.IndexOf(sqlTIPONAME));

    if Client.fequals('campo', 'IDX_REESTRURURA_SQL_TIPO') then
      if list.IndexOf(sqlIDX_REESTRURURA_SQL_TIPO) >= 0 then
        list.Delete(list.IndexOf(sqlIDX_REESTRURURA_SQL_TIPO));

    Client.Next;
  end;

  for I := 0 to list.Count - 1 do
    SqlExec(list[I]);

  list.Free;

  if Transacao.InTransaction then
    Transacao.Commit;

end;

procedure THwScript.DefinirTipos;
var
  text: string;
  tipo: TTiposSql;
  inttipo: Integer;
  name: string;
begin
  ClientOOP('select * from reestrurura_sql' +
            ' where versao_script >= 21 and tipo is null and (not opcoes like ''%INATIVO%'')').First;
  while not Client.Eof do
  begin
    text := Client.fstr('sqltext')
                  .ToUpper()
                  .Replace(sLineBreak, ' ')
                  .Replace('  ', ' ');

    while Pos('  ', text) > 0 do
      text := text.Replace('  ', ' ');

    text := text.Replace('CREATE VIEW', 'CREATE OR ALTER VIEW')
                .Replace('CREATE TRIGGER', 'CREATE OR ALTER TRIGGER')
                .Replace('CREATE PROCEDURE', 'CREATE OR ALTER PROCEDURE')
                .Replace('RDB$RELATION_NAME=', 'RDB$RELATION_NAME =');

    if IsScriptAndResolve('INSERT INTO', text, name) then
      tipo := tsInsert
    else if IsScriptAndResolve('UPDATE RDB$', text, name) then
    begin
      if IsScriptAndResolve('UPDATE RDB$FIELDS SET', text, name) then
        tipo := tsUpdateFieldMetadata
      else if IsScriptAndResolve('UPDATE RDB$RELATION_FIELDS SET', text, name) then
        tipo := tsUpdateMetadata;

      name := '';
      if Pos('RDB$RELATION_NAME =', text) > 0 then
      begin
        text := Copy(text, Pos('RDB$RELATION_NAME =', text), text.Length);

        IsScriptAndResolve('RDB$RELATION_NAME =', text, name);
      end;
    end
    else if IsScriptAndResolve('UPDATE OR INSERT INTO', text, name) then
      tipo := tsUpdateInsert
    else if IsScriptAndResolve('UPDATE', text, name) then
      tipo := tsUpdate
    else if IsScriptAndResolve('DELETE FROM', text, name) then
      tipo := tsDelete
    else if IsScriptAndResolve('CREATE TABLE', text, name) then
      tipo := tsCreateTable
    else if IsScriptAndResolve('DROP TABLE', text, name) then
      tipo := tsDropTable
    else if IsScriptAndResolve('CREATE OR ALTER VIEW', text, name) then
      tipo := tsCreateView
    else if IsScriptAndResolve('DROP VIEW', text, name) then
      tipo := tsDropView
    else if IsScriptAndResolve('CREATE OR ALTER TRIGGER', text, name) then
      tipo := tsCreateTrigger
    else if IsScriptAndResolve('DROP TRIGGER', text, name) then
      tipo := tsDropTrigger
    else if IsScriptAndResolve('CREATE OR ALTER PROCEDURE', text, name) then
      tipo := tsCreateProcedure
    else if IsScriptAndResolve('DROP PROCEDURE', text, name) then
      tipo := tsDropProcedure
    else if IsScriptAndResolve('CREATE UNIQUE INDEX', text, name) then
      tipo := tsCreateUniqueIndex
    else if IsScriptAndResolve('CREATE INDEX', text, name) then
      tipo := tsCreateIndex
    else if IsScriptAndResolve('DROP INDEX', text, name) then
      tipo := tsDropIndex
    else if IsScriptAndResolve('CREATE SEQUENCE', text, name) or IsScriptAndResolve('CREATE GENERATOR', text, name) then
      tipo := tsCreateSequence
    else if IsScriptAndResolve('DROP SEQUENCE', text, name) or IsScriptAndResolve('DROP GENERATOR', text, name) then
      tipo := tsDropSequence
    else
    begin
      tipo := tsOutros;
      name := '';
    end;

    if tipo = tsOutros then
      inttipo := 99
    else
      inttipo := Ord(tipo);

    SqlExec('update reestrurura_sql set tipo = %d, tiponame = %s' +
            ' where versao_script = %d and nitem = %d and tipo is null',
            [inttipo, name.Substring(0,31).QuotedString, Client.fint('versao_script'), Client.fint('nitem')]);

    Client.Next;
  end;

  if QrAux.Transaction.InTransaction then
    QrAux.Transaction.Commit;

  Client.DataSet.Close;
end;

function THwScript.HwRecriarView(banco: string; codempresa: Integer): boolean;
var
  I: Integer;
//  vListaVersaoScript: TStringList;
//  vListaNitemScript: TStringList;
//  vListaScript: TStringList;
  vNomeTabela: string;
  vNomeView: string;
  vScriptVersao: Integer;
  vScriptNItem: Integer;
  vScriptView: string;
  vScriptDataUltExec: TDate;
  QrAux2: TIBQuery;
  vRetornoDLL: string;
  vDataBanco: TDate;
  vtempScritp: string;
  conf: TConfig_sistema_class;
begin
  Result := False;

  if not conectar(banco, True)  then
    Exit;

  QrAux2 := TIBQuery.Create(nil);
  QrAux2.Database := QrAux.Database;
  QrAux2.Transaction := QrAux.Transaction;

  try
    conf := TCfg_sis.getConf('recriar_view', QrAux, 0);

    vDataBanco := DateOf(Date);

    // Método já verificado hoje
    if vDataBanco = DateOf(conf.AsDate) then
    begin
      Result := true;
      exit;
    end;

    with conf do
    begin
      chave := 'recriar_view';
      cod_empresa := 0;
      display_ := 'Data última atualização views';
      tag := ';recriar_view;';
      type1_ := 'string';
      value1_f := 0;
      value1_vc := FormatDateTime('yyyy-mm-dd hh:mm:ss', vDataBanco);
      value_dt := vDataBanco;
      ativo := 0;
    end;
    conf.SaveConfDB(QrAux).Transaction.Commit;

    ResolveFields;

    DefinirTipos;

    ClientOOP('select rs.versao_script, rs.nitem, rs.tiponame from reestrurura_sql rs' +
             ' where rs.tipo = ' + Ord(tsUpdateFieldMetadata).ToString +
             ' and rs.versao_script >= 21' +
             ' and (not rs.opcoes like ''%INATIVO%'')' +
             ' and coalesce(rs.view_exec, ''N'') = ''N''' +
             ' order by rs.versao_script, rs.nitem');
    while not Client.Eof do
    begin
      vNomeTabela := Client.fstr('tiponame');//retornaNomeTabela(vListaScript[I]);
      vNomeView := '';
      vScriptView := '';
      vRetornoDLL := 'OK';

      if trim(vNomeTabela) <> '' then
      begin
        SqlOpen(' select distinct rdb$view_relations.rdb$view_name as nome_view from rdb$view_relations ' +
          ' where rdb$view_relations.rdb$relation_name = ' + QuotedStr(Trim(vNomeTabela)), QrAux).FetchAll;

        if not QrAux.IsEmpty then
        begin
          QrAux.First;
          while not QrAux.Eof do
          begin
            vNomeView := trim(QrAux.FieldByName('nome_view').AsString);
            vScriptVersao := 0;
            vScriptNItem := 0;
            vScriptView := '';
            vScriptDataUltExec := StrToDate('01/01/1990');
            {
            SqlOpen(' select first 1 rs.versao_script, rs.nitem, rs.sqltext, rs.data_ult_exec from reestrurura_sql rs' +
              ' where ( ((select result from pos(upper(''VIEW ' + vNomeView + ' ''), substring(upper(rs.sqltext) from 1 for 55))) > 0) or' +
              '         ((select result from pos(upper(''VIEW ' + vNomeView + '(''), substring(upper(rs.sqltext) from 1 for 55))) > 0) )' +
              ' and (select result from pos(''INATIVO'', coalesce(rs.opcoes, ''''))) = 0' +
              ' order by rs.versao_script desc, rs.nitem desc ', QrAux2).FetchAll;
            }
            SqlOpen(' select first 1 rs.versao_script, rs.nitem, rs.sqltext, rs.data_ult_exec from reestrurura_sql rs' +
              ' where rs.tipo = ' + Ord(tsCreateView).ToString +
              ' and rs.tiponame = ' + vNomeView.QuotedString +
              ' and (not rs.opcoes like ''%INATIVO%'')' +
              ' order by rs.versao_script desc, rs.nitem desc ', QrAux2).FetchAll;

            if not QrAux2.IsEmpty then
            begin
              vScriptVersao := QrAux2.FieldByName('versao_script').AsInteger;
              vScriptNItem := QrAux2.FieldByName('nitem').AsInteger;
              vScriptView := QrAux2.FieldByName('sqltext').AsString;

              vScriptView := StringReplace(vScriptView, 'CREATE VIEW', 'CREATE OR ALTER VIEW', [rfReplaceAll]);

              if QrAux2.FieldByName('data_ult_exec').IsNull then
                vScriptDataUltExec := StrToDate('01/01/1990')
              else
                vScriptDataUltExec := QrAux2.FieldByName('data_ult_exec').AsDateTime;

              if vDataBanco = vScriptDataUltExec then
                vRetornoDLL := 'OK'
              else
              begin
                vRetornoDLL := hw_sql_script_exec(WideString(banco), WideString('sysdba'), WideString('masterkey'), WideString(vScriptView), true);

                if (vRetornoDLL <> 'OK') then
                begin
                  if (Pos('SET TERM ^', UpperCase(Trim(vScriptView))) = 0) then
                  begin
                    vScriptView := 'SET TERM ^ ; ' + vScriptView + ' ^ SET TERM ; ^';
                    vRetornoDLL := hw_sql_script_exec(WideString(banco), WideString('sysdba'), WideString('masterkey'), WideString(vScriptView), true);
                  end;
                end;

                if vRetornoDLL <> 'OK' then
                  break;

                // Gravar no script da view que a mesma foi excecutada com sucesso
                if vRetornoDLL = 'OK' then
                begin
                  vtempScritp := ' UPDATE REESTRURURA_SQL SET ' +
                     ' DATA_ULT_EXEC = ' + QuotedStr(FormatDateTime('yyyy/MM/dd', vDataBanco)) +
                     ' WHERE VERSAO_SCRIPT = ' + IntToStr(vScriptVersao) +
                     ' AND NITEM = ' + IntToStr(vScriptNItem);

                  hw_sql_script_exec(WideString(banco), WideString('sysdba'), WideString('masterkey'), WideString(vtempScritp), true);
                end;
              end;
            end;
            QrAux.Next;
          end;
        end;

        {
        // Gravar no script da alteração do campo que a mesma view foi excecutada com sucesso
        if vRetornoDLL = 'OK' then
        begin
         vtempScritp := ' UPDATE REESTRURURA_SQL SET ' +
           ' VIEW_EXEC = ''S'' ' +
           ' WHERE VERSAO_SCRIPT = ' + vListaVersaoScript[I] +
           ' AND NITEM = ' + vListaNitemScript[I];

         hw_sql_script_exec(WideString(banco), WideString('sysdba'), WideString('masterkey'), WideString(vtempScritp), true);
        end;
        }
        with SqlExec('update reestrurura_sql set view_exec = ''S'' where versao_script = %d and nitem = %d',
                     [Client.fint('versao_script'), Client.fint('nitem')]) do
          if Transaction.InTransaction then
            Transaction.Commit;
      end;

      Client.Next;
    end;

  finally
    desconectar;
  end;
end;

{ THw_NBACKUP }

procedure THw_NBACKUP.Executar(banco, params: string);
const
  fmt: array[1..6] of string = ('YYYY\MM\DD', 'YYYY\MM-DD', 'YYYY-MM\DD', 'YYYY-MM-DD', 'YYYY\MM', 'YYYY-MM');
  sem: array[1..7] of string = ('dom', 'seg', 'ter', 'qua', 'qui', 'sex', 'sab');
var
  conf: TConfig_sistema_class;
  tplevel_0, tplevel_1, tplevel_2, tplevel_3: string;
  niveis: TStrings;
  nbackupname, diretorio, hostadress, fb_user, fb_pass, str, bkpexist, logexecucao: string;
  dh_last, dh_atual, dh_test, dh_next, dh_diff_serv: TDateTime;
  runHost, isTrue: Boolean;
  idPath, level, int1, int2: Integer;
  cmd: string;
  silentMode: Boolean;
  testMode: Boolean;
  forcelevel, intervalo: SmallInt;
  timeStart, timeEnd, timeCheck: TTime;
begin
  //Anual, Mensal, Quinzenal, Decendial, Semanal, Diaria, Hora
  //A, M, Q, X, S, D, H

  if Fgui then
  begin
    banco := FBanco;
    params := params + ' -nosilent';
  end;

  params := params + ' ';

  if params.ToLower.Contains('-help ') then
  begin
    str := 'Comandos disponiveis' + sLineBreak + sLineBreak +
           '  -nosilent : Ativa a mensagem em caso de falhas' + sLineBreak + sLineBreak +
           '  -test : Executa tudo e no final apresenta o comando que seria enviado para o nbackup' + sLineBreak + sLineBreak +
           '  -forceN : Força um backup, onde o N deve ser o level(0,1,2,3)' + sLineBreak + sLineBreak +
           '  -taskschedule : Cria uma tarefa agendada no windows' + sLineBreak + sLineBreak +
           '  -history [f] [l] : Apresenta os ultimos historicos de backup, onde f é a qtde de registros e l o level. Ex: ' +
           ' -history 10 0,1 que corresponde ao ultimos 10 backups level 0 e 1' + sLineBreak +
           'O comando -history de nao deve ser seguido de outros parametros diferentes do f e l, para l nao colocar espacos entre as virgulas';

    ShowAtencao(str);
    exit;
  end
  else if params.ToLower.Contains('-history ') then
  begin
    ShowLastBackupHistory(banco, params.Substring(params.IndexOf('-history ') + 9, params.Length).Trim);
    exit;
  end;

  level      := -1;
  bkpexist   := '';
  niveis     := NewStringList('M,Q,X,S,D,H',',');
  testMode   := params.ToLower.Contains('-test ');
  silentMode := (not params.ToLower.Contains('-nosilent ')) and (not testMode);
  forcelevel := -1;
  if params.ToLower.Contains('-force') then
  begin
    forcelevel := StrToIntDef(params.Substring(params.ToLower.IndexOf('-force') + 6, 1), -1);
    if (forcelevel < 0) or (forcelevel > 3) then
      raise Exception.Create('Parametro -force inválido. Informe >-forceN' + sLineBreak +
                             'Ex: -force0');
  end;

  if not Fgui then
    if not conectar(banco, not silentMode) then
      Exit;
  try

    try
      conf := TCfg_sis.getConf('hw_nbackup', QrAux, 0);

      if not conf.AsBoolean  then
      begin
        if not silentMode then
          ShowAtencao('Configuração NBackup(hw_nbackup) não ativa');
        Exit;
      end;

      if params.ToLower.Contains('-gui ') then
      begin
        InitGUI(banco, params);
        Exit;
      end
      else if params.ToLower.Contains('-taskschedule ') then
      begin
        cmd := Format('/create /f /tn "NBackup %s" /xml "%s"',
                      [conf.ReadString('Configuracao', 'Task_Schedule_Id', 'HwAuto'),
                       GetFileNameXMLTaskSchedule(banco.Replace('"', '', [rfReplaceAll]))]);

        if silentMode then
          ShellExecute(0, nil, 'schtasks', PWideChar(cmd), nil, SW_HIDE)
        else
          ShellExecute(0, nil, 'schtasks', PWideChar(cmd), nil, SW_NORMAL);

        Exit;
      end;


      {$REGION 'lendo configurações'}
      tplevel_0 := conf.ReadString('Backup_Completo_level_0', 'Tipo').Trim.Substring(0, 1).ToUpper.Trim;
      tplevel_1 := conf.ReadString('Backup_Incremental_level_1', 'Tipo').Trim.Substring(0, 1).ToUpper.Trim;
      tplevel_2 := conf.ReadString('Backup_Incremental_level_2', 'Tipo').Trim.Substring(0, 1).ToUpper.Trim;
      tplevel_3 := conf.ReadString('Backup_Incremental_level_3', 'Tipo').Trim.Substring(0, 1).ToUpper.Trim;

      idPath    := conf.ReadInteger('Configuracao', 'Estrutura_pasta');
      runHost   := conf.ReadString('Configuracao', 'Executar_no_servidor').Trim.Equals('S');
      fb_user   := conf.ReadString('Configuracao', 'Firebird_User');
      fb_pass   := conf.ReadString('Configuracao', 'Firebird_Password').Trim;
      fb_user   := IfThen(not fb_user.IsEmpty, fb_user, 'sysdba');
      fb_pass   := IfThen(not fb_pass.IsEmpty, THwUtilsClass.DecodeASCIIBase64(fb_pass), 'masterkey');

      intervalo := conf.ReadInteger('Hora_monitoramento', 'Intervalo_em_horas', 1);

      if (intervalo < 1) or (intervalo > 12) then
        raise Exception.Create('Hora_monitoramento Intervalo_em_horas inválida. Favor informar um numero de 1 a 12');
      {$ENDREGION}

      {$REGION 'obtendo configurações e validando level'}

      if tplevel_0.IsEmpty then
        raise Exception.Create('Backup completo(level 0) não configurado');

      if niveis.IndexOf(tplevel_0) = -1 then
        raise Exception.Create('Backup completo(level 0) configurado incorretamente');

      if tplevel_0 = 'H' then
        raise Exception.Create('Backup completo(level 0) não pode ser configurado a cada hora');

      while niveis.IndexOf(tplevel_0) >= 0 do
        niveis.Delete(0);

      if not tplevel_1.IsEmpty then
      begin
        if niveis.IndexOf(tplevel_1) = -1 then
          raise Exception.Create('Backup completo(level 1) configurado incorretamente' + sLineBreak +
                                 'Para backup level 0 tipo ' + tplevel_0 + ' os tipos permitidos para o level 1 são ' +
                                 niveis.Text);

        if MatchStr(tplevel_1, ['M', 'Q', 'X', 'S']) then
        begin
          if niveis.IndexOf('M') >= 0 then niveis.Delete(niveis.IndexOf('M'));
          if niveis.IndexOf('Q') >= 0 then niveis.Delete(niveis.IndexOf('Q'));
          if niveis.IndexOf('X') >= 0 then niveis.Delete(niveis.IndexOf('X'));
          if niveis.IndexOf('S') >= 0 then niveis.Delete(niveis.IndexOf('S'));
        end;

        while niveis.IndexOf(tplevel_1) >= 0 do
          niveis.Delete(0);

        if not tplevel_2.IsEmpty then
        begin
          if niveis.IndexOf(tplevel_2) = -1 then
            raise Exception.Create('Backup incremental(level 2) configurado incorretamente' + sLineBreak +
                                   'Para backup level 1 tipo ' + tplevel_1 + ' os tipos permitidos para o level 2 são ' +
                                   niveis.Text);

          while niveis.IndexOf(tplevel_2) >= 0 do
            niveis.Delete(0);

          if not tplevel_3.IsEmpty then
          begin
            if niveis.IndexOf(tplevel_3) = -1 then
              raise Exception.Create('Backup incremental(level 3) configurado incorretamente' + sLineBreak +
                                     'Para backup level 2 tipo ' + tplevel_2 + ' os tipos permitidos para o level 3 é ' +
                                     niveis.Text);
          end;
        end;
      end;

      {$ENDREGION}

      {$REGION 'identificando o level do backup e se deve ser feito feito'}

      dh_next := Now;//obtendo a hora atual para usar depois no agendador de tarefas
      dh_diff_serv := 0;
      GetLastBackupHistory(0);
      if forcelevel > -1 then
      begin
        if ((forcelevel = 1) and (tplevel_1.Trim.IsEmpty)) or
           ((forcelevel = 2) and (tplevel_2.Trim.IsEmpty)) or
           ((forcelevel = 3) and (tplevel_3.Trim.IsEmpty)) then
          raise Exception.Create('Level de backup selecionando não configurado');

        level := forcelevel;
      end
      else if IsTimeBackup(tplevel_0, Client.fdatet('dh_current'), Client.fdatet('dh_bkp'), intervalo) then
        level := 0
      else if not tplevel_1.Trim.IsEmpty then with GetLastBackupHistory(1) do
        if IsTimeBackup(tplevel_1, Client.fdatet('dh_current'), Client.fdatet('dh_bkp'), intervalo) then
          level := 1
        else if not tplevel_2.Trim.IsEmpty then with GetLastBackupHistory(2) do
          if IsTimeBackup(tplevel_2, Client.fdatet('dh_current'), Client.fdatet('dh_bkp'), intervalo) then
            level := 2
          else if not tplevel_3.Trim.IsEmpty then with GetLastBackupHistory(3) do
            if IsTimeBackup(tplevel_3, Client.fdatet('dh_current'), Client.fdatet('dh_bkp'), intervalo) then
              level := 3
            else if not testMode then
              Exit;

      if (level = -1) and ((not Fgui) and (not testMode)) then
        Exit;

      {$REGION 'Verificando se o backup de level anterior permite o level atual, se nao força o level anterior'}
      if (forcelevel <= -1) and (level > 0) then
      begin
        GetLastBackupHistory(3);
        if Client.fint('level') = -1 then
          raise Exception.Create('Sem registro de backup completo(level 0) no banco. Um backup completo deve ser efetuado imediatamente');

        if level > Client.fint('level') then //comando atual maior que o ultimo brackup ja gravado
          if (level - 1) > Client.fint('level') then //Testa se é um level abaixo do ultimo bkp, pois so pode ser dessa forma, subir 1 level por backup
            level := Client.fint('level') + 1;
      end;
      {$ENDREGION}

      dh_atual := Client.fdatet('dh_current');
      if dh_atual < dh_next then //hora do servidor atrasada entao deve atrasar tambem no agendador de tarefas
        dh_diff_serv := Abs(dh_atual - dh_next);
      {$ENDREGION}

      {$REGION 'checando intervalo'}

      timeStart := 0;
      timeEnd   := 0;
      timeCheck := 0;
      str       := conf.ReadString('Hora_monitoramento', 'Inicial');
      if str.Contains(':') then
      begin
        if not TryStrToInt(str.Substring(0, str.IndexOf(':')).Trim, int1) then
          raise Exception.Create('Hora_monitoramento Inicial inválida. Favor informar somente a hora ou a hora e minutos. Ex: 7, ou 7:30');

        if not TryStrToInt(str.Substring(str.IndexOf(':') + 1, str.Length).Trim, int2) then
          raise Exception.Create('Hora_monitoramento Inicial inválida. Favor informar somente a hora ou a hora e minutos. Ex: 7, ou 7:30');

        if (int1 < 0) or (int1 > 23) then
          raise Exception.Create('Hora_monitoramento Inicial inválida. Favor informar das 0 horas até as 23:59');

        if (int2 < 0) or (int2 > 59) then
          raise Exception.Create('Hora_monitoramento Inicial inválida. Minutos inválidos, favor informar de 0 a 59');

        timeStart := EncodeTime(int1, int2, 0, 0);
      end;

      str       := conf.ReadString('Hora_monitoramento', 'Final');
      if str.Contains(':') then
      begin
        if not TryStrToInt(str.Substring(0, str.IndexOf(':')).Trim, int1) then
          raise Exception.Create('Hora_monitoramento Final inválida. Favor informar somente a hora ou a hora e minutos. Ex: 7, ou 7:30');

        if not TryStrToInt(str.Substring(str.IndexOf(':') + 1, str.Length).Trim, int2) then
          raise Exception.Create('Hora_monitoramento Final inválida. Favor informar somente a hora ou a hora e minutos. Ex: 7, ou 7:30');

        if (int1 < 0) or (int1 > 23) then
          raise Exception.Create('Hora_monitoramento Final inválida. Favor informar das 0 horas até as 23:59');

        if (int2 < 0) or (int2 > 59) then
          raise Exception.Create('Hora_monitoramento Final inválida. Minutos inválidos, favor informar de 0 a 59');

        timeEnd := EncodeTime(int1, int2, 0, 0);
      end;

      str       := conf.ReadString('Hora_monitoramento', 'Tipo_Diferente_Hora_comeca_apos');
      if str.Contains(':') then
      begin
        if not TryStrToInt(str.Substring(0, str.IndexOf(':')).Trim, int1) then
          raise Exception.Create('Hora_monitoramento Tipo_Diferente_Hora_comeca_apos inválida. Favor informar somente a hora ou a hora e minutos. Ex: 7, ou 7:30');

        if not TryStrToInt(str.Substring(str.IndexOf(':') + 1, str.Length).Trim, int2) then
          raise Exception.Create('Hora_monitoramento Tipo_Diferente_Hora_comeca_apos inválida. Favor informar somente a hora ou a hora e minutos. Ex: 7, ou 7:30');

        if (int1 < 0) or (int1 > 23) then
          raise Exception.Create('Hora_monitoramento Tipo_Diferente_Hora_comeca_apos inválida. Favor informar das 0 horas até as 23:59');

        if (int2 < 0) or (int2 > 59) then
          raise Exception.Create('Hora_monitoramento Tipo_Diferente_Hora_comeca_apos inválida. Minutos inválidos, favor informar de 0 a 59');

        timeCheck := EncodeTime(int1, int2, 0, 0);
      end;

      if (timeStart > 0) or (timeEnd > 0) then
      begin

        if (timeStart < timeEnd) then
          isTrue := ((TimeOf(dh_atual) >= timeStart) and (TimeOf(dh_atual) <= timeEnd))
        else
          isTrue := ((TimeOf(dh_atual) >= timeStart) or (TimeOf(dh_atual) <= timeEnd));

        if ((level = 0) and (not tplevel_0.Trim.Equals('H'))) or
           ((level = 1) and (not tplevel_1.Trim.Equals('H'))) or
           ((level = 2) and (not tplevel_2.Trim.Equals('H'))) or
           ((level = 3) and (not tplevel_3.Trim.Equals('H'))) then
          if isTrue and (timeCheck > 0) then
            isTrue := TimeOf(dh_atual) >= timeCheck;

        if not isTrue then
          if forcelevel = -1 then
            if not testMode then
              Exit
            else
            begin
              ShowAtencao('Hora de backup fora do invervalo configurado. ' + sLineBreak + sLineBreak +
                          'Hora atual    : %s' + sLineBreak + sLineBreak +
                          'Hora inicial  : %s' + sLineBreak +
                          'Hora final    : %s' + sLineBreak +
                          'Começa após<>D: %s',
                          [FormatDateTime('hh:mm', TimeOf(dh_atual)),
                           FormatDateTime('hh:mm', timeStart),
                           FormatDateTime('hh:mm', timeEnd),
                           IfThen(timeCheck > 0, FormatDateTime('hh:mm', timeCheck))]);
              Exit;
            end;
      end;

      {$ENDREGION}

      diretorio := conf.ReadString('Configuracao', 'Diretorio_backup_especifico_level_' + level.ToString).Trim;

      if diretorio.IsEmpty then
        diretorio := conf.ReadString('Configuracao', 'Diretorio_backup_padrao').Trim;

      diretorio := IncludeTrailingPathDelimiter(diretorio);

      {$REGION 'montando estrutura e o nome do arquivo'}
      if diretorio.Trim.Length <= 2 then
        raise Exception.Create('Diretório para o backup não informado');

      if not runHost then
      begin
        if (idPath < 0) or (idPath > 6) then
          raise Exception.Create('Estrutura de pastas Diretório para o backup inválida, valores válidos: 0, 1, 2, 3, 4');

        if (idPath > 0) then
        begin
          diretorio := IncludeTrailingPathDelimiter(diretorio + FormatDateTime(fmt[idPath], dh_atual));
          ResolverDiretorio(diretorio);
        end;
      end;

      nbackupname := TPath.GetFileNameWithoutExtension(banco);
      if conf.ReadString('Configuracao', 'Anexar_ano_nome_bkp', 'N').Equals('S') then
        nbackupname := nbackupname + getPartFileName('A', dh_atual);

      if (level = 0) and (tplevel_0 = 'D') and
        (MatchText(conf.ReadString('Quando_Backup_Diario_Level_0_Ativo', 'Formato_sufixo', '')
                   .Trim.Substring(0, 1), ['S', 'M'])) then
      begin

        if runHost then
          raise Exception.Create('Formato_sufixo não pode ser usado quando o o comando é enviado diretamente pelo ervidor');

        if string(conf.ReadString('Quando_Backup_Diario_Level_0_Ativo', 'Formato_sufixo', ''.Trim)[1])
          .Equals('S') then
          nbackupname :=  nbackupname + '-' + sem[DayOfWeek(dh_atual)]
        else
          nbackupname :=  nbackupname + '-' + PadL(DayOfTheMonth(dh_atual), 2);
      end
      else
      begin
        if not tplevel_0.IsEmpty then
          nbackupname := nbackupname + getPartFileName(tplevel_0, dh_atual);

        if (not tplevel_1.IsEmpty) and (level >= 1) then
          nbackupname := nbackupname + getPartFileName(tplevel_1, dh_atual);

        if (not tplevel_2.IsEmpty) and (level >= 2) then
          nbackupname := nbackupname + getPartFileName(tplevel_2, dh_atual);

        if (not tplevel_3.IsEmpty) and (level = 3) then
          nbackupname := nbackupname + getPartFileName(tplevel_3, dh_atual);
      end;

      nbackupname := IncludeTrailingPathDelimiter(diretorio) + nbackupname + '.nbk';
      {$ENDREGION}

      {$REGION 'montando o comando'}
      if runHost then
      begin
        hostadress := Copy(banco, 1, Pos(':', banco) - 1);

        banco := Copy(banco, Pos(':', banco) + 1, Banco.Length);

        cmd := GetFireBirdFolderBin + 'fbsvcmgr.exe';

        cmd := Format('"%s" %s:service_mgr -user %s -password %s -action_nbak -nbk_level %d -dbname "%s" -nbk_file "%s"',
                      [cmd, hostadress, fb_user, fb_pass, level, banco, nbackupname]);
      end
      else
      begin
        hostadress := Copy(banco, 1, Pos(':', banco) - 1);
        if hostadress.Trim.IsEmpty then
          raise Exception.Create('Endereço do Servidor não encontrado' + sLineBreak + banco);

        banco := Copy(banco, Pos(':', banco) + 1, Banco.Length);

        cmd := GetFireBirdFolderBin + 'nbackup.exe';

        cmd := Format('"%s" -user %s -password %s -b %d "%s" "%s"',
                      [cmd, fb_user, fb_pass, level, banco, nbackupname]);
      end;
      {$ENDREGION}

      if not testMode then
      begin
        bkpexist := '';

        if (not runHost) then
        begin
          {$REGION 'testando se é esse PC pode fazer o backup'}
          if not hostadress.Trim.ToLower.Equals(GetIP.ToLower.Trim) then
            if not hostadress.ToLower.Trim.Equals(GetComputer.ToLower.Trim) then
              if not hostadress.Trim.ToLower.Equals('127.0.0.1') then
                if not conf.ReadString('Configuracao', 'PC_Responsavel_SerialHD').Trim.ToLower.Equals(GetSerialHd) then
                  Exit;
          {$ENDREGION}

          bkpexist := RenameFileExt(nbackupname, 'deleted', True);
        end;

        if bkpexist.Equals('ERRO') then
          raise Exception.Create('Arquivo de backup já existe, o sistema não conseguiu acesso no arquivo para continuar' + sLineBreak + bkpexist)
        else if not bkpexist.Trim.IsEmpty then
          logexecucao := Format('%sArquivo de backup anterior foi renomeado para %s', [logexecucao, bkpexist]) + sLineBreak;

        logexecucao := Format('%s>%s', [logexecucao, cmd]) + sLineBreak;

        cmd := CreateProcessWithOutPut(cmd).Trim;

        if not cmd.IsEmpty then
          raise Exception.Create(cmd);

        if not bkpexist.IsEmpty then
        begin
          if RemoverArquivoExistente(bkpexist) then
            logexecucao := Format('%sExcluído backup anterior %s', [logexecucao, bkpexist]) + sLineBreak
          else
            logexecucao := Format('%sArquivo anterior não foi excluido. Sem permissão', [logexecucao]) + sLineBreak;
        end;

        logexecucao := Format('%sSucesso na execução', [logexecucao]) + sLineBreak;

        Sleep(2000);

        RegistraLogExecucao('Sucesso', logexecucao, dh_atual, level);

        {$REGION 'Verificando proximo horario de backup'}
        dh_next := EncodeDateTime(YearOf(dh_next),
                                  MonthOf(dh_next),
                                  DayOf(dh_next),
                                  HourOf(dh_next) + 1, 0, 15, 0);
        dh_next := dh_next + dh_diff_serv;

        cmd := Format('/create /f /tn "NBackup %s Hora Exata" /xml "%s"',
                      [conf.ReadString('Configuracao', 'Task_Schedule_Id', 'HwAuto'),
                       GetFileNameXMLTaskScheduleHoraExata(banco.Replace('"', '', [rfReplaceAll]), dh_next)]);

        if silentMode then
          ShellExecute(0, nil, 'schtasks', PWideChar(cmd), nil, SW_HIDE)
        else
          ShellExecute(0, nil, 'schtasks', PWideChar(cmd), nil, SW_NORMAL);

        {$ENDREGION}

      end
      else if Fgui then
        Fcmd := IfThen(level = -1, '**Não é hora de backup**') + '>' + cmd
      else
        ShowComandLine(cmd);

    except on E: Exception do
      begin
        logexecucao := Format('%sErro no processo: %s', [logexecucao, E.Message]) + sLineBreak;

        if (not bkpexist.Equals('ERRO')) and (not bkpexist.IsEmpty) then
        begin
          str := bkpexist;
          bkpexist := RenameFileExt(bkpexist, ExtractFileExt(nbackupname), False);
          if bkpexist.Equals('ERRO') then
            logexecucao := Format('%sArquivo de backup foi renomeado durante o processo. Não foi possivel reverter a opreação' + sLineBreak +
                               'Nome anterior: %s' + sLineBreak +
                               'Nome atual: %s', [logexecucao, nbackupname, str]) + sLineBreak;
        end;

        registraErro('hw.utils.dx.hw_nbackup ' + E.Message);
        if not silentMode then
          ShowErro('Erro ao executar nbackup' + sLineBreak + sLineBreak + E.Message);

        if not testMode then
          RegistraLogExecucao('Erro', logexecucao, dh_atual, level);
      end;
    end;

  finally
    if not Fgui then
      desconectar;
  end;
end;

procedure THw_NBACKUP.InitGUI(banco, params: string);
var
  logview: Boolean;
begin
  FBanco  := banco;

  logview := string(params + ' ').Contains('-log ');

  Fparams := params.Replace('-gui', '', [rfReplaceAll, rfIgnoreCase])
                   .Replace('-log', '', [rfReplaceAll, rfIgnoreCase]);
  Fgui    := True;

  try
    with TFormNbackupHw.Create(nil) do
    begin
      nbackup := Self;

      Self.Executar(banco, '-test');

      Memo1.Lines.Text := Fcmd;

      GetHistoryData(EncodeDateTime(2050, 12, 31, 23, 59, 59, 999), '', 100);

      DBGrid1.DataSource := Client.DataSourceOOP;

      ed_data.Text := DateToStr(Date);

      if logview then
        bt_log.Click;

      ShowModal;

      Fgui := False;

      Free;
    end;
  finally
    Fgui := False;
  end;

end;

function THw_NBACKUP.IsTimeBackup(tipo: string;
  dh_atual, dh_lastbkp: TDateTime; offsetHora: Integer): Boolean;

  function getDateStart(dtbase: TDateTime): TDateTime;
  begin
    if tipo.Equals('M') then
      Result := EncodeDate(YearOf(dtbase), MonthOf(dtbase), 1)
    else if tipo.Equals('Q') then
      Result := EncodeDate(YearOf(dtbase), MonthOf(dtbase), IfThen(DayOf(dtbase) <= 15, 1, 16))
    else if tipo.Equals('X') then
      Result := EncodeDate(YearOf(dtbase), MonthOf(dtbase), IfThen(DayOf(dtbase) <= 10, 1, IfThen(DayOf(dtbase) <= 20, 11, 21)))
    else if tipo.Equals('S') then
    begin
      if (YearOf(dtbase) > YearOf(dh_lastbkp)) or
         ((YearOf(dtbase) = YearOf(dh_lastbkp)) and (WeekOfTheYear(dtbase) > WeekOfTheYear(dh_lastbkp))) then //sim backup
        Result := EncodeDate(YearOf(dh_lastbkp) + 1, MonthOf(dh_lastbkp), DayOf(dh_lastbkp))
      else
        Result := EncodeDate(YearOf(dh_lastbkp) - 1, MonthOf(dh_lastbkp), DayOf(dh_lastbkp))
    end
    else if tipo.Equals('D') then
      Result := EncodeDate(YearOf(dtbase), MonthOf(dtbase), DayOf(dtbase))
    else if tipo.Equals('H') then
      Result := EncodeDateTime(YearOf(dtbase), MonthOf(dtbase), DayOf(dtbase), HourOf(dtbase), 0, 0, 0)
    else
      Result := EncodeDate(YearOf(dh_lastbkp) - 1, MonthOf(dh_lastbkp), DayOf(dh_lastbkp));

  end;

var
  dtest, dbkp: TDateTime;
begin
  dtest := getDateStart(dh_atual - EncodeTime(IfThen(tipo.Equals('H'), offsetHora - 1), 0, 0, 0));
  dbkp := getDateStart(dh_lastbkp);

  Result := dtest > dbkp;
end;

procedure THw_NBACKUP.RegistraLogExecucao(status, log: string; data: TDateTime; level: Integer);
var
  conf: TConfig_sistema_class;
  idlog: string;
begin
  try
    try
      conf := TCfg_sis.getConf('hw_nbackup_last_exec', QrAux, 0);

      idlog := Format('[%s - PC: %s - IP: %s - Usuario: %s - Level: %d - Status: %s]',
                      [FormatDateTime('DD/MM/YYYY hh:nn:ss', data),
                       GetComputer, GetIP, GetUserLoggedName, level, status]);
      log := idlog + sLineBreak + log;

      conf.chave := 'hw_nbackup_last_exec';
      conf.display_ := 'Log da ultima execução do nbackup';
      conf.type1_ := 'string';
      conf.tag := ';log;erro;nbackup;backup;';
      conf.value1_vc := idlog;
      conf.value1_b.Insert(0, log);// :=  log + conf.value1_b.Text;
      conf.value_dt := data;

      while conf.value1_b.Count > 50000 do
        conf.value1_b.Delete(conf.value1_b.Count - 1);

      conf.SaveConfDB(QrAux).Transaction.Commit;

    except on F: Exception do
      registraErro('hw.utils.dx.hw_nbackup Log config nao salvo: ' + F.Message);
    end;
  finally
    if conf <> nil then
      conf.Free;
  end;
end;

function THw_NBACKUP.GetFileNameXMLTaskSchedule(banco: string): string;
var
  filexml: TStrings;
begin
  filexml := TStringList.Create;
  Result := '<?xml version="1.0" encoding="UTF-16"?>' +
            '<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">  ' +
            '  <Triggers>' +
            '    <RegistrationTrigger>' +
            '      <Repetition>' +
            '        <Interval>PT30M</Interval>' +
            '        <StopAtDurationEnd>false</StopAtDurationEnd>' +
            '      </Repetition>' +
            '      <Enabled>true</Enabled>' +
            '    </RegistrationTrigger>' +
            '    <LogonTrigger>' +
            '      <Repetition>' +
            '        <Interval>PT30M</Interval>' +
            '        <StopAtDurationEnd>false</StopAtDurationEnd>' +
            '      </Repetition>' +
            '      <Enabled>true</Enabled>' +
            '    </LogonTrigger>' +
            '  </Triggers>' +
            '  <Principals>' +
            '    <Principal id="Author">' +
            '      <LogonType>InteractiveToken</LogonType>' +
            '      <RunLevel>HighestAvailable</RunLevel>' +
            '    </Principal>' +
            '  </Principals>' +
            '  <Settings>' +
            '    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>' +
            '    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>' +
            '    <StopIfGoingOnBatteries>true</StopIfGoingOnBatteries>' +
            '    <AllowHardTerminate>true</AllowHardTerminate>' +
            '    <StartWhenAvailable>false</StartWhenAvailable>' +
            '    <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>' +
            '    <IdleSettings>' +
            '      <StopOnIdleEnd>true</StopOnIdleEnd>' +
            '      <RestartOnIdle>false</RestartOnIdle>' +
            '    </IdleSettings>' +
            '    <AllowStartOnDemand>true</AllowStartOnDemand>' +
            '    <Enabled>true</Enabled>' +
            '    <Hidden>false</Hidden>' +
            '    <RunOnlyIfIdle>false</RunOnlyIfIdle>' +
            '    <WakeToRun>false</WakeToRun>' +
            '    <ExecutionTimeLimit>PT72H</ExecutionTimeLimit>' +
            '    <Priority>7</Priority>' +
            '  </Settings>' +
            '  <Actions Context="Author">' +
            '    <Exec>' +
            '      <Command>' + ExtractFilePath(Application.ExeName) + 'hw.run.tasks.exe</Command>' +
            '      <Arguments>hw.nbackup "' + banco + '"</Arguments>' +
            '    </Exec>' +
            '  </Actions>' +
            '</Task>';
  try
    try
      filexml.Text := Result;

      Result := IncludeTrailingPathDelimiter(GetPathTemp('Temp')) + 'hw.nbackup.task.schedule.xml';

      filexml.SaveToFile(Result);

      if not FileExists(Result) then
        raise Exception.Create('Arquivo não foi criado no diretório : ' + Result);

    finally
      filexml.Free;
    end;
  except on E: Exception do
    begin
      Result := '';
      registraErro('THw_NBACKUP.GetFileNameXMLTaskSchedule ' + E.Message);
    end;
  end;
end;

function THw_NBACKUP.GetFileNameXMLTaskScheduleHoraExata(banco: string;
  dh: TDateTime): string;
var
  filexml: TStrings;
begin
  filexml := TStringList.Create;
  Result := '<?xml version="1.0" encoding="UTF-16"?>' +
            '<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">  ' +
            '  <Triggers>' +
            '    <TimeTrigger>' +
            '      <StartBoundary>' + FormatDateTime('YYYY-MM-DD"T"hh:mm:ss', dh) + '</StartBoundary>' +
            '      <EndBoundary>' + FormatDateTime('YYYY-MM-DD"T"hh:mm:ss', dh + EncodeTime(1,0,0,0)) + '</EndBoundary>' +
            '      <Enabled>true</Enabled>' +
            '    </TimeTrigger>' +
            '  </Triggers>' +
            '  <Principals>' +
            '    <Principal id="Author">' +
            '      <LogonType>InteractiveToken</LogonType>' +
            '      <RunLevel>HighestAvailable</RunLevel>' +
            '    </Principal>' +
            '  </Principals>' +
            '  <Settings>' +
            '    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>' +
            '    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>' +
            '    <StopIfGoingOnBatteries>true</StopIfGoingOnBatteries>' +
            '    <AllowHardTerminate>true</AllowHardTerminate>' +
            '    <StartWhenAvailable>false</StartWhenAvailable>' +
            '    <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>' +
            '    <IdleSettings>' +
            '      <StopOnIdleEnd>true</StopOnIdleEnd>' +
            '      <RestartOnIdle>false</RestartOnIdle>' +
            '    </IdleSettings>' +
            '    <AllowStartOnDemand>true</AllowStartOnDemand>' +
            '    <Enabled>true</Enabled>' +
            '    <Hidden>false</Hidden>' +
            '    <RunOnlyIfIdle>false</RunOnlyIfIdle>' +
            '    <WakeToRun>false</WakeToRun>' +
            '    <ExecutionTimeLimit>PT72H</ExecutionTimeLimit>' +
            '    <DeleteExpiredTaskAfter>PT0S</DeleteExpiredTaskAfter>' +
            '    <Priority>7</Priority>' +
            '  </Settings>' +
            '  <Actions Context="Author">' +
            '    <Exec>' +
            '      <Command>' + ExtractFilePath(Application.ExeName) + 'hw.run.tasks.exe</Command>' +
            '      <Arguments>hw.nbackup "' + banco + '"</Arguments>' +
            '    </Exec>' +
            '  </Actions>' +
            '</Task>';
  try
    try
      filexml.Text := Result;

      Result := IncludeTrailingPathDelimiter(GetPathTemp('Temp')) + 'hw.nbackup.task.schedule.xml';

      filexml.SaveToFile(Result);

      if not FileExists(Result) then
        raise Exception.Create('Arquivo não foi criado no diretório : ' + Result);

    finally
      filexml.Free;
    end;
  except on E: Exception do
    begin
      Result := '';
      registraErro('THw_NBACKUP.GetFileNameXMLTaskSchedule ' + E.Message);
    end;
  end;
end;

function THw_NBACKUP.GetFireBirdFolderBin: string;
  function GetEnvVarValue(const VarName: string): string;
  var
    BufSize: Integer;
  begin
    BufSize := GetEnvironmentVariable(PChar(VarName), nil, 0);
    if BufSize > 0 then
    begin
      SetLength(Result, BufSize - 1);
      GetEnvironmentVariable(PChar(VarName),
        PChar(Result), BufSize);
    end
    else
      Result := '';
  end;

var
  fb_folder: string;
  switchFolder86: Boolean;
  searchResult : TSearchRec;
  szBuffer: PWideChar;
  nBufferSize: Cardinal;
begin
  Result := '';
  switchFolder86 := False;
  while True do
  begin

    if not switchFolder86 then
      fb_folder := GetEnvVarValue('ProgramFiles')
    else
      fb_folder := GetEnvVarValue('ProgramW6432');

    fb_folder := IncludeTrailingPathDelimiter(fb_folder) + 'Firebird\';

    if FindFirst(fb_folder + '*', faDirectory, searchResult) = 0 then
      try

        repeat
          if (searchResult.Attr = faDirectory) then
            if (not MatchText(string(searchResult.Name).Trim, ['Firebird_1_5', 'Firebird_2_0', 'Firebird_2_1', 'Firebird_2_5'])) then
              if DirectoryExists(fb_folder + string(searchResult.Name) + '\bin\') then
              begin
                Result := fb_folder + string(searchResult.Name) + '\bin\';
                exit;
              end;

        until
          (FindNext(searchResult) <> 0);

      finally
        System.SysUtils.FindClose(searchResult);
      end;

    if switchFolder86 then
      Break
    else
      switchFolder86 := True;
  end;

  if Result.Trim.IsEmpty then
    if DirectoryExists('C:\Program Files\Firebird\Firebird_2_5\bin\') then
      Result := 'C:\Program Files\Firebird\Firebird_2_5\bin\'
    else if DirectoryExists('C:\Program Files (x86)\Firebird\Firebird_2_5\bin\') then
      Result := 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\';
end;

function THw_NBACKUP.GetHistoryData(data_base: TDateTime;
  level_str: string; first_records: integer): THw_NBACKUP;
begin
  Result := Self;

  ClientOOP('select %s c.rdb$backup_id Id, c.rdb$timestamp "Data", c.rdb$backup_level "Level", c.rdb$file_name "Arquivo"' +
            ' from rdb$backup_history c' +
            ' where c.rdb$timestamp <= %s and c.rdb$backup_level in (%s)' +
            ' order by id desc',
            [IfThen(first_records > 0, 'first ' + first_records.ToString),
             datet_fb(data_base), IfThen(level_str.Trim.IsEmpty, '0,1,2,3', level_str)]);
end;

function THw_NBACKUP.GetLastBackupHistory(level: Integer): TConexao_OOP;
begin
  Result := ClientOOP('select c.rdb$backup_id id, c.rdb$timestamp dh_bkp, (select current_ts from sp_current_ts) dh_current, c.rdb$backup_level level, c.rdb$file_name filename' +
                      ' from (' +
                      ' select * from (select first 1 * from rdb$backup_history bh where rdb$backup_level = 0 order by bh.rdb$backup_id desc)' +
                      ' union all' +
                      ' select * from (select first 1 * from rdb$backup_history bh where rdb$backup_level = 1 order by bh.rdb$backup_id desc)' +
                      ' union all' +
                      ' select * from (select first 1 * from rdb$backup_history bh where rdb$backup_level = 2 order by bh.rdb$backup_id desc)' +
                      ' union all' +
                      ' select * from (select first 1 * from rdb$backup_history bh where rdb$backup_level = 3 order by bh.rdb$backup_id desc)' +
                      ' ) as c' +
                      ' where c.rdb$backup_level <= %d' +
                      ' order by id desc', [level]);

  if Client.IsEmpty then
    ClientOOP('select 0 id, cast(null as timestamp) dh_bkp, current_ts dh_current, -1 level, '' '' filename from sp_current_ts')
end;

function THw_NBACKUP.getPartFileName(tipo: string;
  data: TDateTime): string;
begin
  if tipo.Equals('A') then
    Result := tipo + YearOf(data).ToString
  else if tipo.Equals('M') then
    Result := tipo + PadL(MonthOf(data), 2)
  else if tipo.Equals('Q') then
    Result := tipo + IfThen(DayOf(data) <= 15, '1', '2')
  else if tipo.Equals('X') then
    Result := tipo + IfThen(DayOf(data) <= 10, '1', IfThen(DayOf(data) <= 20, '2', '3'))
  else if tipo.Equals('S') then
    Result := tipo + PadL(WeekOfTheYear(data), 2)
  else if tipo.Equals('D') then
    Result := tipo + PadL(DayOf(data), 2)
  else if tipo.Equals('H') then
    Result := tipo + PadL(HourOf(data), 2)
  else
    Result := '';

  if not Result.IsEmpty then
    Result := '-' + Result;
end;

function THw_NBACKUP.RemoverArquivoExistente(filename: string): Boolean;
var
  int: Integer;
begin
  if not FileExists(filename) then
    Exit(True);

  int := 0;
  while FileExists(filename) do
  begin
    int := int + 1;
    if int > 10 then
      Exit(False);

    DeleteFile(PWideChar(filename));
    Sleep(500);
  end;
  Result := True;
end;

function THw_NBACKUP.RenameFileExt(filename, ext: string;
  randoext: Boolean): string;
var
  int: Integer;
begin
  Result := '';

  int := 0;
  while FileExists(filename) do
  begin
    int := int + 1;
    if int > 10 then
      Exit('ERRO');

    Result := ChangeFileExt(filename, '.' + IfThen(randoext, int.ToString + '_') + ext);
    //Result := ChangeFileExt(filename, '.' + int.ToString + '_' + 'deleted');

    RenameFile(filename, Result);

    Sleep(500);
  end;
end;

procedure THw_NBACKUP.ResolverDiretorio(dir: string);
var
  idx: Integer;
  strdir: string;
begin
  dir := IncludeTrailingPathDelimiter(dir.Replace('/', '\', [rfReplaceAll]).Trim);
  dir := Copy(dir, 1, 2) + string(Copy(dir, 3, dir.Length)).Replace('\\', '\', [rfReplaceAll]);

  if DirectoryExists(dir) then
    Exit;

  idx := IfThen(dir.StartsWith('\\'), 2, 3);

  if idx = 2 then //rede, desconsiderar o primeiro caminha q é o nome do host
  begin
    idx := Pos('\', dir, idx + 1);

    if idx <= 0  then
      raise Exception.Create('Diretório para o backup não foi criado. Sem permissão' + sLineBreak + dir);

    idx := Pos('\', dir, idx + 1);
  end
  else
    idx := Pos('\', dir, idx + 1);

  strdir := Copy(dir, 1, idx);

  if idx <= 0  then
    raise Exception.Create('Diretório para o backup não foi criado. Sem permissão' + sLineBreak + dir);

  while idx > 0 do
  begin
    if not DirectoryExists(strdir) then
      CreateDir(strdir);

    if not DirectoryExists(strdir) then
      raise Exception.Create('Diretório para o backup não foi criado. Sem permissão' + sLineBreak + strdir);

    idx := Pos('\', dir, idx + 1);

    if idx > 0 then
    begin
      strdir := Copy(dir, 1, idx);
    end
    else
      idx := -1;
  end;
end;

procedure THw_NBACKUP.ShowComandLine(cmd: string);
var
    form: TForm;
begin
  form := TForm.CreateNew(nil);
  with form do
  begin
    Caption := 'Histórico de Backups';
    Width := 600;
    Height := 500;
    Position := poScreenCenter;

    with TMemo.Create(form) do
    begin
      Align := alClient;
      WordWrap := True;
      Parent := form;
      Lines.Text := cmd;
    end;

  end;
  form.ShowModal;
  form.Free;
end;

procedure THw_NBACKUP.ShowLastBackupHistory(banco, params: string);
var
  form: TForm;
  days: integer;
  first: Integer;
  strlevel: string;
begin
  params := params.Trim + ' ';
  if params.Contains(' ') and (params.Length > 1) then
    if not TryStrToInt(params.Substring(0, params.IndexOf(' ')).Trim, first) then
      raise Exception.Create('Primeiro parametros history inválido')
    else
      System.Delete(params, 1, params.IndexOf(' ') + 1);

  params := params.Replace(', ', ',', [rfReplaceAll])
                  .Replace(' ,', ',', [rfReplaceAll])
                  .Trim + ' ';

  if params.Contains(' ') and (params.Length > 1) then
  begin
    strlevel := params.Substring(0, params.IndexOf(' ')).Trim;
    if strlevel <> OnlyNumber(strlevel, ',') then
      raise Exception.Create('Segundo parametros history inválido')
    else
      System.Delete(params, 1, params.IndexOf(' ') + 1);
  end;

  params := params.Trim + ' ';

  days := 0;
  if params.Contains(' ') and (params.Length > 1) then
    if not TryStrToInt(params.Trim, days) then
      raise Exception.Create('Terceiro parametros history inválido');

  if not conectar(banco, False) then
    Exit;
  try

    ClientOOP('select %s c.rdb$backup_id Id, c.rdb$timestamp "Data", c.rdb$backup_level "Level", c.rdb$file_name "Arquivo"' +
              ' from rdb$backup_history c' +
              ' where c.rdb$timestamp <= (select current_ts from sp_current_ts) - %d' +
              IfThen(not strlevel.Trim.IsEmpty, ' and c.rdb$backup_level in (' + strlevel + ')') +
              ' order by id desc',
                [IfThen(first > 0, 'first ' + IntToStr(first)), days]).First;

    form := TForm.CreateNew(nil);
    with form do
    begin
      Caption := 'Histórico de Backups';
      Width := 600;
      Height := 500;
      Position := poScreenCenter;

      with TDBGrid.Create(form) do
      begin
        Align := alClient;
        Options := Options - [dgEditing];
        DataSource := Client.DataSourceOOP;
        Parent := form;
      end;

    end;
    form.ShowModal;
    form.Free;

    Client.DataSet.Close;

  finally
    desconectar;
  end;

end;

end.
