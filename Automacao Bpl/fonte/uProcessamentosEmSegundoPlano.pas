unit uProcessamentosEmSegundoPlano;

interface

uses
  uDtmAtivo, IBQuery, IBDatabase, Classes, Controls, ExtCtrls;

type
  TProcessamentosEmSegundoPlano = class
  private
    fQuery: TIBQuery;
    fQuery2: TIBQuery;
    fExec: TIBQuery;
    fTransaction: TIBTransaction;
    fProcessarProdutosSemDataEstoque_30_12_1899: Boolean;

    FTimeNewCheckSts: TDateTime;
    FTimeNewCheckDestsNF: TDateTime;
    FTimeTrimAppMemorySize: TDateTime;
    FTimeIntegraFiscal: TDateTime;

    procedure verificarProdutosSemDataEstoque_30_12_1899;
    procedure verificarProdutosSemDataEstoque_30_12_1899_2;
    procedure verificarEnvioEstatisticas;
    procedure verificarDestinatariosNotaFiscal;
    procedure verificarIntegra;

  public
    destructor Destroy; override;
    constructor create;

    procedure verificarProcessamentos;
    procedure verificarNotificacoesApiHw;
    procedure verificarServiceLessNFCe;
    procedure verificarTrimAppMemorySize;
  end;

  TThreadProcessamentoSegundoPlano = class(TThread)
  private
    FSleepTime: Integer;
    procedure SetSleepTime(const Value: Integer);
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    property SleepTime: Integer read FSleepTime write SetSleepTime;
  end;

implementation

uses
  Forms, uDadosIni, DB, SysUtils, uClasseConexao, notafiscal_class, Contnrs, StrUtils, hw_win_utils, Math;

function hw_enviar_estatisticas( Banco, Usuario, Senha: WideString; CodEmpresa: Integer): Integer; stdcall; external 'hw.utils.dx.dll';// Retorna a quantidade pendente

function hw_central_suporte_notificar_abrir( AEmail, ACnpj: WideString): WideString; stdcall; external 'hw.utils.dx.dll'; // Abre as notificacoes e Retorna o token e abre

{ TProcessamentosEmSegundoPlano }

constructor TProcessamentosEmSegundoPlano.create;
begin
  fTransaction := TIBTransaction.Create(Application);
  fTransaction.DefaultDatabase := dtmAtivo.bancoHw;
  fTransaction.Params.Add('read_committed');
  fTransaction.Params.Add('rec_version');
  fTransaction.Params.Add('nowait');

  fQuery := TIBQuery.Create(Application);
  fQuery.Database := fTransaction.DefaultDatabase;
  fQuery.Transaction := fTransaction;

  fQuery2 := TIBQuery.Create(Application);
  fQuery2.Database := fTransaction.DefaultDatabase;
  fQuery2.Transaction := fTransaction;

  fExec := TIBQuery.Create(Application);
  fExec.Database := fTransaction.DefaultDatabase;
  fExec.Transaction := fTransaction;

  fProcessarProdutosSemDataEstoque_30_12_1899 := vDadosIni.getConfSisBool('prcss_montar_estoque_diario_30_12_1899', fQuery);
  FTimeNewCheckSts := 0;  
  FTimeIntegraFiscal := 0;
  FTimeNewCheckDestsNF := 0;
  FTimeTrimAppMemorySize := 0;
end;

destructor TProcessamentosEmSegundoPlano.Destroy;
begin
  fQuery.Close;
  fQuery2.Close;
  fExec.Close;

  FreeAndNil(fTransaction);
  FreeAndNil(fExec);
  FreeAndNil(fQuery2);
  FreeAndNil(fQuery);

  inherited;
end;

procedure TProcessamentosEmSegundoPlano.verificarDestinatariosNotaFiscal;
var
  ATimeCompare: TDateTime;
  ACheck, AreplAtivo, AhouveProcessamento: Boolean;

  con: TConexao;
  Astr: string;
  Anotas: TNotafiscal_classList;
  Anota: TNotafiscal_class;
  Alist: TStrings;
  I, J, C: Integer;
  AcodEmpresa: array of Integer;

  procedure checkarPermissaoREPL;
  var
    Atabelas, Aprocedu: TStringList;
    Ainc: Integer;
  begin
    try
      Atabelas := TStringList.Create;
      Atabelas.Sorted := True;
      Atabelas.Duplicates := dupIgnore;
      
      Aprocedu := TStringList.Create;
      Aprocedu.Sorted := True;
      Aprocedu.Duplicates := dupIgnore;
      try

        con.Banco.Connected := False;
        con.Banco.Params.Clear;
        con.Banco.Params.Add('user_name=sysdba');
        con.Banco.Params.Add('password=masterkey');
        if not con.conectar(vDadosIni.vBancoHW, False) then
          Exit;

        con.SqlOpen('select ''T'' tipo, R.RDB$RELATION_NAME tabela' +
                    ' from RDB$RELATIONS R' +
                    ' where ((R.RDB$SYSTEM_FLAG = 0) or (R.RDB$SYSTEM_FLAG is null)) and (R.RDB$VIEW_SOURCE is null) and' +
                    ' ((select count(*) permissao from rdb$user_privileges rp where rp.rdb$user = ''REPL'' and rp.rdb$relation_name = R.RDB$RELATION_NAME) < 5)' +
                    ' union' +
                    ' select ''P'' tipo, p.rdb$procedure_name tabela from rdb$procedures p' +
                    ' where' +
                    ' ((select count(*) permissao from rdb$user_privileges rp where rp.rdb$user = ''REPL'' and rp.rdb$relation_name = p.rdb$procedure_name) < 1)' +
                    '  order by 1 desc,2', con.QrAux).First;
        while not con.QrAux.Eof do
        begin
          if Trim(con.QrAux.FieldByName('tipo').AsString) = 'T' then
            Atabelas.Add(Trim(con.QrAux.FieldByName('tabela').AsString))
          else
            Aprocedu.Add(Trim(con.QrAux.FieldByName('tabela').AsString));
          con.QrAux.Next;
        end;

        for Ainc := 0 to Aprocedu.Count - 1 do
        begin
          con.SqlExec('grant execute on procedure ' + Aprocedu[Ainc] + ' to REPL');
          if con.QrAux.Transaction.InTransaction then
            con.QrAux.Transaction.Commit;
        end;
        for Ainc := 0 to Atabelas.Count - 1 do
        begin
          con.SqlExec('grant all on ' + Atabelas[Ainc] + ' to REPL');
          if con.QrAux.Transaction.InTransaction then
            con.QrAux.Transaction.Commit;
        end;
      finally
        if Assigned(Atabelas) then
          FreeAndNil(Atabelas);
        if Assigned(Aprocedu) then
          FreeAndNil(Aprocedu);
      end;
    except
    end;
  end;

begin
  ACheck := False;

  if FTimeNewCheckDestsNF > 0 then
  begin
    ATimeCompare := Now;
    if ATimeCompare > FTimeNewCheckDestsNF then
      ACheck := True;
  end
  else
    ACheck := True;

  if not ACheck then
    Exit;

  if vDadosIni.GetIni('Processamento', 'DestinatariosNF', 'N') = 'S' then
  begin
    FTimeNewCheckDestsNF := Now + 1;
    Exit;
  end;

  if FileExists(ExtractFilePath(Application.ExeName) + 'update_dest_nf.exe') then
  begin
    try
      try
        vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'update_dest_nf.exe' + ' ' + vDadosIni.vBancoHW, False, True);

        fQuery.Close;
        fQuery.SQL.Text := 'select count(*) contador from notafiscal' +
                           ' where dest_seqid is null and cod_cliente > 0';
        fQuery.Open;
        if fQuery.FieldByName('contador').AsInteger = 0 then
          vDadosIni.GravaIni('Processamento', 'DestinatariosNF', 'S');

      except
      end;
    finally
      fQuery.Close;
      FTimeNewCheckDestsNF := Now + EncodeTime(0, 0, 30, 0);
    end;
    Exit;
  end;

  con := TConexao.create;
  try
    try
      AreplAtivo := False;
      if not con.conectar(vDadosIni.vBancoHW, 'REPL', 'masterkey', Astr) then
      begin
        con.Banco.Params.Clear;
        con.Banco.Params.Add('user_name=sysdba');
        con.Banco.Params.Add('password=masterkey');
        if Pos('USER NAME AND PASSWORD ARE NOT DEFINED', UpperCase(Astr)) > 0 then
          if not con.conectar(False) then
            Exit;
      end
      else
        AreplAtivo := True;

      SetLength(AcodEmpresa, 1);
      AcodEmpresa[High(AcodEmpresa)] := StrToInt(vDadosIni.codEmpresa);

      con.SqlOpen('select cod_empresa from empresa where cod_empresa <> ' + vDadosIni.codEmpresa);
      while not con.QrAux.Eof do
      begin
        SetLength(AcodEmpresa, Length(AcodEmpresa) + 1);
        AcodEmpresa[High(AcodEmpresa)] := con.QrAux.FieldByName('cod_empresa').AsInteger;
        con.QrAux.Next;
      end;

      AhouveProcessamento := False;
      for C := Low(AcodEmpresa) to High(AcodEmpresa) do
      begin
        if con.SqlOpen('select first 25 ' + Anota.GetFieldsSql + ' from notafiscal' +
                       ' where dest_seqid is null and cod_cliente > 0' +
                       ' and cod_empresa = ' + IntToStr(AcodEmpresa[C]) +
                       ' order by cod_nf desc').IsEmpty then
        begin

        end
        else
        begin
          AhouveProcessamento := True;

          Anotas := TNotafiscal_classList.Create;
          while not con.QrAux.eof do
          begin
            Anota := TNotafiscal_class.Create;
            Anota.SetValuesFrom(con.QrAux);
            Anotas.Add(Anota);
            con.QrAux.Next;
          end;

          for I := 0 to Anotas.Count - 1 do
          begin
            con.SqlOpen('select cl.nome_cliente, cl.razao, cl.cpfcgc, cl.nfe_idestrangeiro, cl.insc_municipal,' +
                        ' cl.email, cl.endereco, cl.num_end_cliente, cl.complemento, cl.bairro, cl.cidade,' +
                        ' cl.cep, cl.cod_pais, cl.fone_cliente, cl.insc_est,' +
                        ' cd.ibge_cod_cidade, es.sigla_uf, pa.nome_pais' +
                        ' from clientes cl' +
                        ' left join cidades cd on cd.cod_cidade = cl.cod_cidade' +
                        ' left join estados es on es.codigo_uf = cl.codigo_uf' +
                        ' left join paises pa on pa.cod_pais = cl.cod_pais' +
                        ' where cl.cod_cliente = ' + IntToStr(Anotas.Items[I].cod_cliente) +
                        ' and cl.cod_empresa = ' + IntToStr(Anotas.Items[I].cod_empresa));

            with Anotas.Items[I] do
            begin
              nome_cliente       := Copy(con.QrAux.FieldByName('nome_cliente').AsString, 1, 60);
              razao              := Copy(con.QrAux.FieldByName('razao').AsString, 1, 60);
              cpfcgc             := Copy(con.QrAux.FieldByName('cpfcgc').AsString, 1, 14);
              dest_idestrangeiro := Copy(con.QrAux.FieldByName('nfe_idestrangeiro').AsString, 1, 20);
              //dest_isuf          := Acliente.dest_isuf;
              dest_im            := Copy(con.QrAux.FieldByName('insc_municipal').AsString, 1, 15);
              dest_email         := Copy(con.QrAux.FieldByName('email').AsString, 1, 60);
              dest_xlgr          := Copy(con.QrAux.FieldByName('endereco').AsString, 1, 60);
              dest_nro           := Copy(con.QrAux.FieldByName('num_end_cliente').AsString, 1, 60);
              dest_xcpl          := Copy(con.QrAux.FieldByName('complemento').AsString, 1, 60);
              dest_xbairro       := Copy(con.QrAux.FieldByName('bairro').AsString, 1, 60);
              dest_cmun          := con.QrAux.FieldByName('ibge_cod_cidade').AsInteger;
              dest_xmun          := Copy(con.QrAux.FieldByName('cidade').AsString, 1, 60);
              dest_uf            := Copy(con.QrAux.FieldByName('sigla_uf').AsString, 1, 2);
              dest_cep           := Copy(con.QrAux.FieldByName('cep').AsString, 1, 8);
              dest_cpais         := con.QrAux.FieldByName('cod_pais').AsInteger;
              dest_xpais         := Copy(con.QrAux.FieldByName('nome_pais').AsString, 1, 60);
              dest_fone          := Copy(con.QrAux.FieldByName('fone_cliente').AsString, 1, 14);
              insc_est           := Copy(con.QrAux.FieldByName('insc_est').AsString, 1, 14);
              dest_seqid         := 0;

              Astr := '';
              Alist := vDadosIni.StrToTStrings(dest_email, [',', ';', '|', sLineBreak, ' ']);
              for J := 0 to Alist.Count - 1 do
              if Length(Astr +  IfThen(Astr <> '', ',') + Alist[J]) > 60 then
                Break
              else
                Astr := Astr + IfThen(Astr <> '', ',') + Alist[J];
              dest_email := Astr;
            end;
          end;

          for I := 0 to Anotas.Count - 1 do
            if Trim(Anotas.Items[I].nome_cliente) <> '' then
              with Anotas.Items[I] do
              begin
                try
                  con.SqlExec('update notafiscal set nome_cliente = ' + QuotedStr(nome_cliente) +
                              ' ,razao = '              + QuotedStr(razao) +
                              ' ,cpfcgc = '             + QuotedStr(cpfcgc) +
                              ' ,dest_idestrangeiro = ' + QuotedStr(dest_idestrangeiro) +
                              ' ,dest_im = '            + QuotedStr(dest_im) +
                              ' ,dest_email = '         + QuotedStr(dest_email) +
                              ' ,dest_xlgr = '          + QuotedStr(dest_xlgr) +
                              ' ,dest_nro = '           + QuotedStr(dest_nro) +
                              ' ,dest_xcpl = '          + QuotedStr(dest_xcpl) +
                              ' ,dest_xbairro = '       + QuotedStr(dest_xbairro) +
                              ' ,dest_cmun = '          + IntToStr(dest_cmun) +
                              ' ,dest_xmun = '          + QuotedStr(dest_xmun) +
                              ' ,dest_uf = '            + QuotedStr(dest_uf) +
                              ' ,dest_cep = '           + QuotedStr(dest_cep) +
                              ' ,dest_cpais = '         + IntToStr(dest_cpais) +
                              ' ,dest_xpais = '         + QuotedStr(dest_xpais) +
                              ' ,dest_fone = '          + QuotedStr(dest_fone) +
                              ' ,insc_est = '           + QuotedStr(insc_est) +
                              ' ,dest_seqid = '         + IntToStr(dest_seqid) +
                              ' where cod_nf = '        + IntToStr(cod_nf) +
                              ' and cod_empresa = '     + IntToStr(cod_empresa) +
                              ' and dest_seqid is null');
                  if con.QrAux.Transaction.InTransaction then
                    con.QrAux.Transaction.Commit;
                except
                  on e: exception do
                  begin
                    if con.QrAux.Transaction.InTransaction then
                      con.QrAux.Transaction.Rollback;

                    if AreplAtivo then
                      if Pos('no permission for ', e.Message) > 0 then
                        checkarPermissaoREPL;
                  end;
                end;
              end;
        end;
      end;

      if not AhouveProcessamento then
        vDadosIni.GravaIni('Processamento', 'DestinatariosNF', 'S');

    except
      on e: exception do
      begin
        if con.QrAux.Transaction.InTransaction then
          con.QrAux.Transaction.Rollback;
        if AreplAtivo then
          if Pos('no permission for ', e.Message) > 0 then
            checkarPermissaoREPL;
      end;
    end;
  finally
    con.desconectar;
    if Assigned(Alist) then
      FreeAndNil(Alist);
    if Assigned(Anotas) then
      FreeAndNil(Anotas);
    
    FreeAndNil(con);
    FTimeNewCheckDestsNF := Now + EncodeTime(0, 0, 30, 0);
  end;
end;

procedure TProcessamentosEmSegundoPlano.verificarEnvioEstatisticas;
var
  ATimeCompare: TDateTime;
  ACheck: Boolean;
  ARetorno: Integer;
begin
  if (vDadosIni.vCodEmpresaFisica > 0) and (vDadosIni.vCodEmpresaFisica <> StrToInt(vDadosIni.codEmpresa)) then
     exit;

  ACheck := False;

  if FTimeNewCheckSts > 0 then
  begin
    ATimeCompare := Now;
    if ATimeCompare > FTimeNewCheckSts then
      ACheck := True;
  end
  else
    ACheck := True;

  if ACheck then
  begin
    ARetorno := hw_enviar_estatisticas( widestring(vDadosIni.vBancoHW), widestring(vDadosIni.fdbUsuario), widestring(vDadosIni.fdbSenha), StrToInt(vDadosIni.codEmpresa));
    if ARetorno > 0 then
      FTimeNewCheckSts := Now + EncodeTime( 02, 01, 00, 00)
    else
      FTimeNewCheckSts := Now + EncodeTime( 01, 01, 00, 00);
  end;
end;

procedure TProcessamentosEmSegundoPlano.verificarIntegra;
var
  interval: Integer;
  ATimeCompare: TDateTime;
  ACheck: Boolean;
begin
  ACheck := False;
  if FTimeIntegraFiscal > 0 then
  begin
    ATimeCompare := Now;
    if ATimeCompare > FTimeIntegraFiscal then
      ACheck := True;
  end
  else
    ACheck := True;

  if ACheck then
  begin

    vDadosIni.CreateProcessSimple(
        ExtractFilePath(Application.ExeName) +
        'hw.run.tasks.exe ' +
        'hw.integra.anexoxv.consulta ' +
        '"'+ vDadosIni.vBancoHW + '" ' +
        vDadosIni.codEmpresa + ' ' + 
        'hw.integra.gs1prefix.consulta ', False, True);

    FTimeIntegraFiscal := Now + EncodeTime(0, 30, 0, 0);
  end;
end;

procedure TProcessamentosEmSegundoPlano.verificarNotificacoesApiHw;
var
  AEmail: string;
begin
  if vDadosIni.ApiHwemailColaboradorValidoParaAcesso(fQuery, AEmail, False) then
    hw_central_suporte_notificar_abrir( AEmail, Trim(vDadosIni.vEmp.vCNPJ));
end;

procedure TProcessamentosEmSegundoPlano.verificarProcessamentos;
begin
  if fProcessarProdutosSemDataEstoque_30_12_1899 then
    verificarProdutosSemDataEstoque_30_12_1899;
  verificarEnvioEstatisticas;
  verificarNotificacoesApiHw;
  verificarDestinatariosNotaFiscal;
  verificarTrimAppMemorySize;
  verificarIntegra;
end;

procedure TProcessamentosEmSegundoPlano.verificarProdutosSemDataEstoque_30_12_1899;
var
  vTemp: string;
  vTempCodUs: Integer;
  vTempDate: TDate;
  vOK, vSetConfSis: Boolean;
begin
  ///  Aqui o sistema vai verificar os produtos que nao possuem registros na tabela estoque_diario assim que cadastrados
  ///  Por padrao um usuario por dia vai fazer o processamento a cada intervalo
  ///  O processamento é feito de 10 em 10 produtos

  if (vDadosIni.vCodEmpresaFisica > 0) and (vDadosIni.vCodEmpresaFisica <> StrToInt(vDadosIni.codEmpresa)) then
     exit;

  vTemp := vDadosIni.getConfSisStr('prcss_montar_estoque_diario_30_12_1899', fQuery); //'|cod_usuario|data|'
  vTempCodUs := StrToIntDef(vDadosIni.getValue(vTemp, 1), 0);
  vTempDate := StrToDateDef(vDadosIni.getValue(vTemp, 2), 0);

  vOK := False;
  vSetConfSis := False;
  // codigo = 0, nunca foi feito o processamento ou ja foi concluido o processamento do dia
  if (vTempCodUs = 0) and (vTempDate <= Date) then
    vSetConfSis := True
  else if (vTempCodUs = vDadosIni.vCodUsuario) and (vTempDate = Date) then
    vOK := True
  else if (vTempDate < date) then
    vSetConfSis := True;

  if vSetConfSis then
  begin
    vOK := True;
    vTemp := '|' + IntToStr(vDadosIni.vCodUsuario) + '|' + DateToStr(Date) + '|';

    fExec.Close;
    fExec.SQL.Text := 'update config_sistema set value1_vc = ' + QuotedStr(vTemp) +
      ' where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and chave = ' + QuotedStr('prcss_montar_estoque_diario_30_12_1899');
    fExec.ExecSQL;

    if fExec.Transaction.InTransaction then
      fExec.Transaction.Commit;
  end;

  if not vOK then
    Exit;

  try
    fQuery.Close;
    fQuery.SQL.Text := 'select first 10 cg.cod_grade, p.grupo_prod, p.cod_prod, p.cod_empresa, ed.dia from produtos p' +
      ' left join cod_grade_prod cg on cg.grupo_prod = p.grupo_prod and cg.cod_prod = p.cod_prod and cg.cod_empresa = p.cod_empresa' +
      ' left join estoque_diario ed on ed.grupo_prod = p.grupo_prod and ed.cod_prod = p.cod_prod and ed.cod_empresa = p.cod_empresa' +
      ' and ed.cod_grade = coalesce(cg.cod_grade, 0) and ed.dia = :dia' +
      ' where p.grupo_prod > -1 and p.cod_prod <> '''' and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ed.dia is null';
    fQuery.ParamByName('dia').AsDate := 0;
    fQuery.Open;

    if fQuery.IsEmpty then // quando nao encontrar registros o processamento foi concluido
    begin
      vTemp := '|' + IntToStr(0) + '|' + DateToStr(Date + 1) + '|';

      fExec.Close;
      fExec.SQL.Text := 'update config_sistema set value1_vc = ' + QuotedStr(vTemp) +
        ' where cod_empresa = ' + vDadosIni.codEmpresa +
        ' and chave = ' + QuotedStr('prcss_montar_estoque_diario_30_12_1899');
      fExec.ExecSQL;

      if fExec.Transaction.InTransaction then
        fExec.Transaction.Commit;
      
      fExec.Close;
      fQuery.Close;

      verificarProdutosSemDataEstoque_30_12_1899_2;

      Exit;
    end;

    fExec.SQL.Text := 'insert into estoque_diario (tipo, seqid, cod_empresa, dia, grupo_prod, cod_prod, cod_grade, estoque, custo_medio)' +
      ' values (''P'', gen_id(INC_ESTOQUE_DIARIO, 1),' + vDadosIni.codEmpresa + ', ' +
      ' :dia, :grupo_prod, :cod_prod, :cod_grade, 0, 0)';

    fQuery.First;
    while not fQuery.Eof do
    begin
      fExec.ParamByName('dia').AsDate := 0;
      fExec.ParamByName('grupo_prod').AsInteger := fQuery.FieldByName('grupo_prod').AsInteger;
      fExec.ParamByName('cod_prod').AsString := fQuery.FieldByName('cod_prod').AsString;
      fExec.ParamByName('cod_grade').AsInteger := fQuery.FieldByName('cod_grade').AsInteger;
      fExec.ExecSQL;

      fQuery.Next;
    end;
    if fExec.Transaction.InTransaction then
      fExec.Transaction.Commit;

    fExec.Close;
    fQuery.Close;

    verificarProdutosSemDataEstoque_30_12_1899_2;

  except on E: Exception do
    begin
      fExec.Close;
      fQuery.Close;
      if fExec.Transaction.InTransaction then
        fExec.Transaction.Rollback;
      vDadosIni.registraErro('verificarProdutosSemDataEstoque_30_12_1899. Erro' + e.Message);
    end;
  end;
end;

procedure TProcessamentosEmSegundoPlano.verificarProdutosSemDataEstoque_30_12_1899_2;
var
  I: Integer;
begin
  try
    fQuery.Close;
    fQuery.SQL.Text := 'select first 10 grupo_prod, cod_prod, cod_grade, count(*) qtde from estoque_diario' +
      ' where dia = :dia and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and grupo_prod > -1 and cod_prod <> ''''' +
      ' group by 1,2,3 ' +
      ' having count(*) > 1';
    fQuery.ParamByName('dia').AsDate := 0;
    fQuery.Open;

    fQuery.First;
    while not fQuery.Eof do
    begin
      fQuery2.Close;
      fQuery2.SQL.Text := 'select first ' + IntToStr(fQuery.FieldByName('qtde').AsInteger - 1) +
        ' TIPO, SEQID from estoque_diario' +
        ' where dia = :dia and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and grupo_prod = :grupo_prod and cod_prod = :cod_prod';
      fQuery2.ParamByName('dia').AsDate := 0;
      fQuery2.ParamByName('grupo_prod').AsInteger := fQuery.FieldByName('grupo_prod').AsInteger;
      fQuery2.ParamByName('cod_prod').AsString := fQuery.FieldByName('cod_prod').AsString;
      fQuery2.Open;

      fQuery2.First;
      while not fQuery2.Eof do
      begin
        fExec.Close;
        fExec.SQL.Text := 'delete from estoque_diario' +
          ' where tipo = :tipo and seqid = :seqid and cod_empresa = ' + vDadosIni.codEmpresa;
        fExec.ParamByName('tipo').AsString := fQuery2.FieldByName('tipo').AsString;
        fExec.ParamByName('seqid').AsInteger := fQuery2.FieldByName('seqid').AsInteger;
        fExec.ExecSQL;

        fQuery2.Next;
      end;

      fQuery.Next;
    end;

    if fExec.Transaction.InTransaction then
      fExec.Transaction.Commit;

    fExec.Close;
    fQuery.Close;
    fQuery2.Close;
  except on E: Exception do
    begin
      fExec.Close;
      fQuery.Close;
      if fExec.Transaction.InTransaction then
        fExec.Transaction.Rollback;
      vDadosIni.registraErro('verificarProdutosSemDataEstoque_30_12_1899. Erro' + e.Message);
    end;
  end;
end;

procedure TProcessamentosEmSegundoPlano.verificarServiceLessNFCe;
begin
  if (Trim(vDadosIni.vNFConsumidor.token) <> '') and
     ((not vDadosIni.vNFConsumidor.UsaServidorAutorizacao) or
      (vDadosIni.vNFConsumidor.NFCeOffline = noClient))
    then
      vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) + 'HWNFCServiceLess.exe ' +
        Format('LESS cnpj=%s empresaId=%d caixaId=%d', [vDadosIni.vEmp.vCNPJ, vDadosIni.cod_empresa, vDadosIni.vNFConsumidor.CodEmissor]));
end;

procedure TProcessamentosEmSegundoPlano.verificarTrimAppMemorySize;
var
  interval: Integer;
  ATimeCompare: TDateTime;
  ACheck: Boolean;
begin
  ACheck := False;
  if FTimeTrimAppMemorySize > 0 then
  begin
    ATimeCompare := Now;
    if ATimeCompare > FTimeTrimAppMemorySize then
      ACheck := True;
  end
  else
    ACheck := True;

  if ACheck then
  begin
    if IniConf.ReadStr('TrimAppMemorySize', 'Ativo', 'N') = 'S' then
      vDadosIni.TrimAppMemorySize;
    interval := IniConf.ReadInt('TrimAppMemorySize', 'Intervalo', 5);
    interval := IfThen(interval <= 0, 5, interval);
    FTimeTrimAppMemorySize := Now + EncodeTime(0, interval, 0, 0);
  end;
end;

{ TThreadProcessamentoSegundoPlano }

constructor TThreadProcessamentoSegundoPlano.Create(CreateSuspended: Boolean);
begin
  inherited Create (CreateSuspended);
  Self.FreeOnTerminate := False;
  Self.Priority := tpLower;
  FSleepTime := 10000;
end;

procedure TThreadProcessamentoSegundoPlano.Execute;
var
  Processamentos: TProcessamentosEmSegundoPlano;
begin
  inherited;
  Sleep(FSleepTime);
  if FSleepTime > 0 then
  begin
    Processamentos := TProcessamentosEmSegundoPlano.create;
    while (not Self.Terminated) do
    begin
      try
        Processamentos.verificarProcessamentos;
      except
      end;
      Sleep(FSleepTime);
    end;
  end;
end;

procedure TThreadProcessamentoSegundoPlano.SetSleepTime(const Value: Integer);
begin
  FSleepTime := Value;
end;

end.
