unit uHistoricoProd;

interface

uses
  uClasseConexao;

type

  THwHistoricoProd = class(TConexao)
  private
    procedure RecriarCamposProcedureAuditoria;
  public
    function HwCorrigirHistProd(banco: string; codempresa: Integer): boolean;
  end;

implementation

uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  System.Math,
  IBX.IBQuery,
  hw_utils,
  config_sistema_class,
  System.DateUtils,
  produtos_tmp_class;

function hw_sql_script_exec(EnderecoBanco, Usuario, Senha, Script: WideString; Commitar: LongBool): WideString; stdcall; external 'HwScript.dll';
procedure hw_sql_script_free; stdcall; external 'HwScript.dll';

{ THwHistoricoProd }

function THwHistoricoProd.HwCorrigirHistProd(banco: string;
  codempresa: Integer): boolean;
var
  vbancoAuditoria: string;
  vDataBanco: TDate;
  vDataUltVerificacaoHistoricoProd: TDate;
  vAtualizacaoHistoricoProdAlteracao: string;
  vAtualizacaoHistoricoProdAuditoria: string;
  vListaUpdates: TStringList;
  I: Integer;
  vQtdeReg: Integer;
  vRetornoDLL, sql: string;
  confs: TConfig_sistema_classList;
  conf: TConfig_sistema_class;
  prods: TProdutos_tmp_classList;
  prod: TProdutos_tmp_class;
begin
  Result := False;
  vListaUpdates := TStringList.Create;
  confs := TConfig_sistema_classList.Create;

  try
    if not conectar(banco, True)  then
      Exit;

    confs.AddKey('verificar_hist_prod')
         .AddKey('atualizacao_historicoprod_prod_alt')
         .AddKey('atualizacao_historicoprod_auditoria')
         .MakeAll(QrAux, codempresa);

    vDataBanco := DateOf(Date);
    vDataUltVerificacaoHistoricoProd   := DateOf(confs.GetConf('verificar_hist_prod').AsDate);
    vAtualizacaoHistoricoProdAlteracao := confs.GetConf('atualizacao_historicoprod_prod_alt').AsString.Trim;
    vAtualizacaoHistoricoProdAuditoria := confs.GetConf('atualizacao_historicoprod_auditoria').AsString.Trim;

    // Métodos já atualizados
    if (vAtualizacaoHistoricoProdAlteracao = 'S') and (vAtualizacaoHistoricoProdAuditoria = 'S') then
    begin
      Result := true;
      exit;
    end;

    // Métodos já verificados hoje
    if (vDataBanco = vDataUltVerificacaoHistoricoProd) then
      //if confs.GetConf('verificar_hist_prod').AsFloat >= 5 then
      begin
        Result := true;
        exit;
      end;

    conf := confs.GetConf('verificar_hist_prod');
    with conf do
    begin
      chave := 'verificar_hist_prod';
      cod_empresa := codempresa;
      display_ := 'Data última verificação histórico do produto';
      tag := ';verificar_hist_prod;';
      type1_ := 'string';
      value1_f := value1_f + 1;
      value1_vc := FormatDateTime('yyyy-mm-dd hh:mm:ss', vDataBanco);
      value_dt := vDataBanco;
      ativo := 0;
    end;
    conf.SaveConfDB(QrAux).Transaction.Commit;

    if (vAtualizacaoHistoricoProdAlteracao <> 'S') then
    begin
      SqlOpen(' SELECT COUNT(*) QTDE FROM RDB$PROCEDURES ' +
        ' WHERE UPPER(RDB$PROCEDURE_NAME) = ''VINC_HIST_PROD'' ', QrAux);

      if QrAux.FieldByName('QTDE').AsInteger <= 0 then
      begin
        Result := false;
        exit;
      end;

      SqlOpen(' SELECT RESULT FROM VINC_HIST_PROD(' + IntToStr(codempresa) + ');', QrAux);
      if QrAux.FieldByName('RESULT').AsString <> 'OK' then
      begin
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Rollback;
        Result := false;
        exit;
      end
      else
      begin
        prods := TProdutos_tmp_classList.Create;
        prods.SetValuesFrom(SqlOpen('select distinct he.grupo_prod, he.cod_prod from hist_estoque_diario he' +
                                    ' left join produtos pr on he.grupo_prod = pr.grupo_prod and he.cod_prod = pr.cod_prod' +
                                    '   and he.cod_empresa = pr.cod_empresa' +
                                    ' where he.tipo = ''P'' and he.cod_empresa = %d and pr.grupo_prod is null', [codempresa]), True);

        conf := confs.GetConf('atualizacao_historicoprod_prod_alt');
        with conf do
        begin
          chave := 'atualizacao_historicoprod_prod_alt';
          cod_empresa := codempresa;
          display_ := 'Histórico do produto atualizado (PRODUTOS_ALTERACAO)';
          tag := ';atualizacao_historicoprod_prod_alt;';
          type1_ := 'string';
          value1_f := value1_f + 1;
          value1_vc := 'S';//IfThen(prods.Count = 0, 'S', 'N');
          ativo := 0;
        end;
        conf.SaveConfDB(QrAux).Transaction.Commit;
      end;
    end;

  finally
    desconectar;
  end;

  if (vAtualizacaoHistoricoProdAuditoria <> 'S') then
  begin
    try
      for I := Length(banco) - 1 downto 0 do
        if (copy(banco,I,1) = '/') or (copy(banco,I,1) = '\') then
        begin
          vbancoAuditoria := copy(banco, 1, i) + 'auditoria.fdb';
          Break;
        end;

      if not conectar(vbancoAuditoria, True)  then
        Exit;

      RecriarCamposProcedureAuditoria;

      sql := 'select codigo,' +
          '      (select result from sonumeros (substring(mensagem ' +
          '          from ' +
          '            (select result from pos(''Gr Novo:'', mensagem)) + 8 ' +
          '          for 8))) grupo_prod_new, ' +
          '      (select result from sonumeros (substring(mensagem ' +
          '          from ' +
          '            (select result from pos(''Gr Novo:'', mensagem)) + 16 ' +
          '          for 10))) cod_prod_new, ' +
          '      substring(mensagem ' +
          '          from ' +
          '            (select result from pos(''Gr Ant:'', mensagem)) + 8 ' +
          '          for ' +
          '            (select result from pos(''Cod Ant:'', mensagem)) ' +
          '            - (select result from pos(''Gr Ant:'', mensagem)) - 8) grupo_prod_old, ' +
          '      (select result from sonumeros (substring(mensagem ' +
          '          from ' +
          '            (select result from pos(''Cod Ant:'', mensagem)) + 9 ' +
          '          for 6))) cod_prod_old,  ' +
          '  cod_empresa, data from auditoria a ' +
          '  where processo = ''PRO362'' ' +
          '  and cod_empresa = ' + IntToStr(codempresa) +
          '  and data >= ''01.01.2019'' ';

      for prod in prods do
      begin

        SqlOpen(sql + 'and mensagem like ''%Gr Ant: ' + IntToStr(prod.grupo_prod) +
                      'Cod Ant: ' + prod.cod_prod.Trim + 'Gr Novo:%''' +
                ' union ' +
                sql + 'and mensagem like ''%Gr Novo: ' + IntToStr(prod.grupo_prod) +
                      'Cod Ant: ' + prod.cod_prod.Trim + '%''' +
                '  order by 1', QrAux);

        QrAux.First;
        while not QrAux.Eof do
        begin
          vListaUpdates.Add(
            ' UPDATE HIST_ESTOQUE_DIARIO SET  ' +
            '   GRUPO_PROD = ' + IntToStr(QrAux.FieldByName('GRUPO_PROD_NEW').AsInteger) + ', ' +
            '   COD_PROD = ' + QuotedStr(QrAux.FieldByName('COD_PROD_NEW').AsString) + ', ' +
            '   GRUPO_PROD_OLD = ' + IntToStr(QrAux.FieldByName('GRUPO_PROD_OLD').AsInteger) + ', ' +
            '   COD_PROD_OLD = ' + QuotedStr(QrAux.FieldByName('COD_PROD_OLD').AsString) +
            ' WHERE ' +
            '   GRUPO_PROD = ' + IntToStr(QrAux.FieldByName('GRUPO_PROD_OLD').AsInteger) +
            '   AND COD_PROD = ' + QuotedStr(QrAux.FieldByName('COD_PROD_OLD').AsString) +
            '   AND COD_EMPRESA = ' + IntToStr(QrAux.FieldByName('COD_EMPRESA').AsInteger) +
            '   AND DATA <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd', QrAux.FieldByName('DATA').AsDateTime)) + ';');

          QrAux.Next;
        end;
      end;

      Result := true;
    finally
      desconectar;
    end;

    try
      if not conectar(banco, True)  then
        Exit;

      if vListaUpdates.Count > 0 then
      begin

        vQtdeReg := 0;
        for I := 0 to vListaUpdates.Count - 1 do
        begin
          Inc(vQtdeReg);

          SqlExec(vListaUpdates[I], QrAux);
          if vQtdeReg >= 500 then
          begin
            if QrAux.Transaction.InTransaction then
              QrAux.Transaction.Commit;

            vQtdeReg := 0;
          end;
        end;

        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Commit;
      end;

      conf := confs.GetConf('atualizacao_historicoprod_auditoria');
      with conf do
      begin
        chave := 'atualizacao_historicoprod_auditoria';
        cod_empresa := codempresa;
        display_ := 'Histórico do produto atualizado (AUDITORIA)';
        tag := ';atualizacao_historicoprod_auditoria;';
        type1_ := 'string';
        value1_f := 0;
        value1_vc := 'S';
        ativo := 0;
      end;
      conf.SaveConfDB(QrAux).Transaction.Commit;
    finally
      desconectar;
    end;
  end;

end;

procedure THwHistoricoProd.RecriarCamposProcedureAuditoria;
begin
  SqlOpen(' SELECT COUNT(*) QTDE FROM RDB$PROCEDURES ' +
    ' WHERE UPPER(RDB$PROCEDURE_NAME) = ''POS'' ', QrAux);

  if QrAux.FieldByName('QTDE').AsInteger <= 0 then
  begin
    try
      SqlExec(
        ' create or alter procedure POS ( ' +
        '    SUBSTR varchar(100), ' +
        '    STR varchar(100)) ' +
        ' returns ( ' +
        '    RESULT integer) ' +
        ' as ' +
        '    declare variable SUBSTR2 varchar(201); ' +
        '    declare variable TMP varchar(100); ' +
        ' begin ' +
        '   if (SubStr IS NULL OR Str IS NULL) then ' +
        '   begin ' +
        '     result = NULL; ' +
        '     exit; ' +
        '   end ' +
        '   SubStr2 = SubStr || ''%''; ' +
        '   Tmp = ''''; ' +
        '   result = 1; ' +
        '   while (Str NOT LIKE SubStr2 AND Str NOT LIKE Tmp) do ' +
        '   begin ' +
        '     SubStr2 = ''_'' || SubStr2; ' +
        '     Tmp = Tmp || ''_''; ' +
        '     result = result + 1; ' +
        '   end ' +
        '   if (Str LIKE Tmp) THEN result = 0; ' +
        '    SUSPEND; ' +
        ' end; ', QrAux);

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;
    except
      if (Pos('SET TERM ^', UpperCase(Trim(QrAux.SQL.Text))) = 0) then
      begin
        SqlExec('SET TERM ^ ; ' + QrAux.SQL.Text + ' ^ SET TERM ; ^', QrAux);

        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Commit;
      end;
    end;
  end;

  SqlOpen(' SELECT COUNT(*) QTDE FROM RDB$PROCEDURES ' +
    ' WHERE UPPER(RDB$PROCEDURE_NAME) = ''SONUMEROS'' ', QrAux);

  if QrAux.FieldByName('QTDE').AsInteger <= 0 then
  begin
    try
      SqlExec(
        ' create or alter procedure SONUMEROS ( ' +
        '   TEXTO varchar(100)) ' +
        ' returns ( ' +
        '   RESULT varchar(100)) ' +
        ' as ' +
        '   declare variable INDICE integer; ' +
        '   declare variable CARACTER char(1); ' +
        ' begin ' +
        '   if (texto is null) then ' +
        '     result = null; ' +
        '   else ' +
        '   begin ' +
        '     result = texto; ' +
        '     indice = char_length(result); ' +
        '     while (indice > 0) do ' +
        '     begin ' +
        '       caracter = cast(substring(result from indice for 1) as char(1)); ' +
        '       if (not(caracter between ''0'' and ''9'')) then ' +
        '         result = substring(result from 1 for (indice - 1)) || ' +
        '           substring(result from (indice + 1) for ' +
        '           (char_length(result) - indice)); ' +
        '           indice = indice - 1; ' +
        '     end ' +
        '   end ' +
        '   suspend; ' +
        ' end; ', QrAux);

      if QrAux.Transaction.InTransaction then
        QrAux.Transaction.Commit;
    except
      if (Pos('SET TERM ^', UpperCase(Trim(QrAux.SQL.Text))) = 0) then
      begin
        SqlExec('SET TERM ^ ; ' + QrAux.SQL.Text + ' ^ SET TERM ; ^', QrAux);

        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Commit;
      end;
    end;
  end;
end;

end.
