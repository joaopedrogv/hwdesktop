unit hw.utils.dx.migracao.Classes;

interface

uses
  uClasseConexao,
  hw.utilis.migracao.registro.Solicitacao,
  HW.Utils.Classes.Registros.Usuario_DX,
  hw.utils.dx.teste.Unit2,
  HW.Utils.Classes.Rest_DX,
  Data.Win.ADODB;

type
  TConexaoPostgreSQL = class;

  TMigracaoSolicitacoes = class(TConexao)
  private
    FAssuntos        : TArray<TAssunto>;
    FRest            : TRestHW;
    FModulos         : TArray<TModulo>;
    FUsuarios        : TArray<TUsuario>;
    FLastMessage     : string;
    FDataBaseName    : string;
    FstringPostGre   : string;
    FLastURL         : string;
    FPostGre         : TConexaoPostgreSQL;
    function GetUsuarioByEmail(Aemail: string): TUsuario;
    function Logar(Ausuario: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function Iniciar(Ausuario: string): Boolean;
    function GetRegistroRank: TSolicitacaoSC;
    function GetAssunto(Adescricao: string): TAssunto; overload;
    function GetAssunto(AsubString: string; AIndex: Integer): Integer; overload;
    function GetModulo(Adescricao: string): TModulo; overload;
    function GetModulo(AsubString: string; AIndex: Integer): TModulo; overload;

    procedure Migrar(ASolicitacao: TSolicitacaoSC);
    procedure Naomigrar(ASolicitacao: TSolicitacaoSC);

    property Assuntos: TArray<TAssunto> read FAssuntos write FAssuntos;
    property Modulos: TArray<TModulo> read FModulos write FModulos;
    property Usuarios: TArray<TUsuario> read FUsuarios write FUsuarios;
    property LastMessage: string read FLastMessage write FLastMessage;
    property LastURL: string read FLastURL write FLastURL;

  end;

  TConexaoPostgreSQL = class
    FBanco : TADOConnection;
    FBuscas: TADOQuery;
    FQrAux : TADOQuery;
  public
    destructor Destroy; override;
    constructor create;

    property Banco : TADOConnection read FBanco  write FBanco;
    property QrAux : TADOQuery      read FQrAux  write FQrAux;
    property Buscas: TADOQuery      read FBuscas write FBuscas;
  end;

var
  Migracao: TMigracaoSolicitacoes;

implementation

uses
  System.SysUtils, System.StrUtils,
  System.Math, System.Classes,
  HW.Utils.Classes.Funcoes_DX,
  REST.Types;

{ TMigracaoSolicitacoes }

constructor TMigracaoSolicitacoes.Create;
begin
  inherited;
  FDataBaseName := '192.168.254.50:E:\Bases\Hwauto.gdb';
//  FstringPostGre := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=hwsite_teste1';
  FstringPostGre := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=hwsite_producao';
  FRest := TRestHW.Create('', '');
  FPostGre := TConexaoPostgreSQL.create;
end;

destructor TMigracaoSolicitacoes.Destroy;
begin
  FreeAndNil(FRest);
  FreeAndNil(FPostGre);
  inherited;
end;

function TMigracaoSolicitacoes.GetAssunto(Adescricao: string): TAssunto;
var
  Aassunto: TAssunto;
begin
  for Aassunto in FAssuntos do
    if THwUtilsClass.ReplaceCaracteresEspeciais(Aassunto.descricao).ToUpper.Trim =
       THwUtilsClass.ReplaceCaracteresEspeciais(Adescricao).ToUpper.Trim  then
      Exit(Aassunto);

  Aassunto := nil;
end;

function TMigracaoSolicitacoes.GetModulo(Adescricao: string): TModulo;
var
  Amodulo: TModulo;
begin
  for Amodulo in FModulos do
    if THwUtilsClass.ReplaceCaracteresEspeciais(Amodulo.descricao).ToUpper.Trim =
       THwUtilsClass.ReplaceCaracteresEspeciais(Adescricao).ToUpper.Trim  then
      Exit(Amodulo);

  Amodulo := nil;
end;

function TMigracaoSolicitacoes.GetRegistroRank: TSolicitacaoSC;
var
  ASolicitacao: TSolicitacaoSC;
  ACliente: TClienteSolicitacaoSC;
  AClientes: TArray<TClienteSolicitacaoSC>;
  AListSubstring: TStrings;
  ASubstring: string;
  AIndex: Integer;
begin
  ASolicitacao := TSolicitacaoSC.Create;
  try
    if not Banco.Connected then
      if not conectar(FDataBaseName, True) then
      begin
        with ASolicitacao do
        begin
          titulo := '***ERRO AO CONECTAR COM O BANCO***';
          descricao := '***ERRO AO CONECTAR COM O BANCO***';
        end;
        Exit;
      end;

    QrAux.Close;
    QrAux.SQL.Text := 'select first 1 sc.codigo, sc.cod_analista, sc.status_res, sc.codigo, sc.titulo, sc.tipo,' +
      ' cl.cod_cl_integra, sc.data_cadastro, col.email, sc.prop_erro, sc.nome_produto, sc.assunto, rs.total_peso,' +
      ' sc.prioridade, sc.observacao, cl.nome_cliente' +
      ' from sug_cliente sc' +
      ' inner join rank_sug_clientes rs on rs.cod_sug_cl = sc.codigo' +
      ' inner join clientes cl on cl.cod_cliente = sc.cod_cliente and cl.cod_empresa = 1' +
      ' left join colaborador col on col.cod_vendedor = sc.cod_analista and col.cod_empresa = 1' +
      ' where cl.cod_empresa = 1' +
      ' and sc.migrado is null' +
      ' order by sc.data_cadastro asc';
    QrAux.Open;
    if QrAux.IsEmpty then
    begin
      with ASolicitacao do
      begin
        titulo := '***SEM SOLICITACOES***';
        descricao := '***SEM SOLICITACOES***';
      end;
      Exit;
    end;

    AListSubstring := TStringList.Create;
    AListSubstring.LineBreak := ' ';

    ACliente := TClienteSolicitacaoSC.Create;
    ACliente.cod_cl_solic := QrAux.FieldByName('cod_cl_integra').AsInteger;
    ACliente.cod_empresa := 1;

    SetLength(AClientes, 1);
    AClientes[Low(AClientes)] := ACliente;

    with ASolicitacao do
    begin
      cod_empresa := 1;
      cod_cliente := ACliente.cod_cl_solic;
      cod_solicitacao := 0;
      data_criacao := FormatDateTime('DD/MM/YYYY hh:nn', QrAux.FieldByName('data_cadastro').AsDateTime);
      tipo := ifthen(QrAux.FieldByName('tipo').AsString = 'Correção', 1);
      status := 1;
      titulo := THwUtilsClass.ReplaceCaracteresEspeciais(QrAux.FieldByName('titulo').AsString).Trim.ToUpper;
      descricao := QrAux.FieldByName('prop_erro').AsString.Trim;
      prioridade := QrAux.FieldByName('prioridade').AsInteger;
      ativo := True;
      //mensagem
      data_status_mod := data_criacao;
      //release
      info_comp := IfThen( (not QrAux.FieldByName('observacao').AsString.Trim.Equals('..')) and
                           (not QrAux.FieldByName('observacao').AsString.Trim.Equals('SEM MAIS.')) and
                           (not QrAux.FieldByName('observacao').AsString.Trim.Equals('SEM MAIS')),
                           QrAux.FieldByName('observacao').AsString.Trim);
      info_comp := 'C: ' + QrAux.FieldByName('codigo').AsInteger.ToString +
                           IfThen(not info_comp.Trim.IsEmpty, #13 + info_comp);
      //cod_estagio
      peso_tipo := QrAux.FieldByName('codigo').AsInteger;
      criado_por := GetUsuarioByEmail(QrAux.FieldByName('email').AsString.Trim);
      if Assigned(criado_por) then
        cod_us_cad := criado_por.cod_usuario;

      Advertencia_Modulo := False;
      modulo := GetModulo( THwUtilsClass.ReplaceCaracteresEspeciais(
                          QrAux.FieldByName('nome_produto').AsString.ToUpper.
                          Replace(' 4.0', '', [rfReplaceAll]).
                          Replace('SPED CONTRIBUIÇÕES', 'EFD CONTRIBUIÇÕES', [rfReplaceAll]).
                          Replace('SPED FISCAL', 'EFD ICMS IPI', [rfReplaceAll])
                         ));

      if not Assigned(modulo) then
      begin
        AListSubstring.Text := titulo;
        for ASubstring in AListSubstring do
          if ASubstring.Trim.Length >= 4  then
          begin
            modulo := GetModulo(ASubstring, -1);
            if Assigned(modulo) then
            begin
              Advertencia_Modulo := True;
              Break;
            end;

//            AIndex := GetModulo(ASubstring, -1);
//            if AIndex > -1 then
//            begin
//              modulo := FModulos[AIndex];
//              Advertencia_Modulo := True;
//              Break;
//            end;
          end;
      end;

      if Assigned(modulo) then
        cod_modulo := modulo.cod_modulo;

      Advertencia_Assunto := False;
      assunto := GetAssunto(QrAux.FieldByName('assunto').AsString);

      if not Assigned(assunto) then
      begin
        AListSubstring.Text := titulo;
        for ASubstring in AListSubstring do
          if ASubstring.Trim.Length >= 4  then
          begin
            AIndex := GetAssunto(ASubstring, -1);
            if AIndex > -1 then
            begin
              assunto := FAssuntos[AIndex];
              Advertencia_Assunto := True;
              Break;
            end;
          end;
      end;

      if Assigned(assunto) then
        cod_assunto := assunto.cod_tp_assunto;

      clientes := AClientes;

      NomeCliente := QrAux.FieldByName('nome_cliente').AsString.Trim;
    end;


  finally
    Result := ASolicitacao;
    if Banco.Connected then
      desconectar;
  end;
end;

function TMigracaoSolicitacoes.GetUsuarioByEmail(Aemail: string): TUsuario;
var
  AUsuario: TUsuario;
begin
  try
    for AUsuario in FUsuarios do
      if AUsuario.email.ToLower = Aemail.ToLower  then
        Exit(AUsuario);

    AUsuario := nil;
  finally
    Result := AUsuario;
  end;
end;

function TMigracaoSolicitacoes.Iniciar(Ausuario: string): Boolean;
var
  I: Integer;
  AUsuariosInativos: TArray<TUsuario>;
  AUser: TUsuario;
begin
  if not Logar(Ausuario) then
    Exit(False);

  {$REGION 'Obtendo lista de assuntos'}

  FRest.metodo := 'TipoAssunto/GetTiposDeAssuntos';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_empresa', FRest.acessToken.cod_empresa.ToString(), pkGETorPOST, [], True);

  FRest.ExecutarGET();

  if FRest.restResponse.StatusCode <> 200 then
    Exit(False);

  FLastURL := FRest.urlApi + FRest.metodo;

  FAssuntos := TAssunto.FromJsonToArray<TAssunto>(FRest.restResponse.JSONValue);
  {$ENDREGION}

  {$REGION 'Obtendo lista de modulos'}
  FRest.metodo := 'Modulo/GetModulos';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_empresa', FRest.acessToken.cod_empresa.ToString(), pkGETorPOST, [], True);

  FRest.ExecutarGET();

  if FRest.restResponse.StatusCode <> 200 then
    Exit(False);

  FLastURL := FRest.urlApi + FRest.metodo;

  FModulos := TModulo.FromJsonToArray<TModulo>(FRest.restResponse.JSONValue);
  {$ENDREGION}

  {$REGION 'Obtendo lista de usuarios'}
  FRest.metodo := 'Usuario/getUsuarios';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_empresa', FRest.acessToken.cod_empresa.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_cliente', FRest.acessToken.cod_cliente.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('ativo', '1', pkGETorPOST, [], True);

  FRest.ExecutarGET();

  if FRest.restResponse.StatusCode <> 200 then
    Exit(False);

  FLastURL := FRest.urlApi + FRest.metodo;

  FUsuarios := TUsuario.FromJsonToArray<TUsuario>(FRest.restResponse.JSONValue);

  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_empresa', FRest.acessToken.cod_empresa.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_cliente', FRest.acessToken.cod_cliente.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('ativo', '0', pkGETorPOST, [], True);

  FRest.ExecutarGET();

  if FRest.restResponse.StatusCode <> 200 then
    Exit(False);

  FLastURL := FRest.urlApi + FRest.metodo;

  AUsuariosInativos := TUsuario.FromJsonToArray<TUsuario>(FRest.restResponse.JSONValue);

  for AUser in AUsuariosInativos do
  begin
    SetLength(FUsuarios, Length(FUsuarios) + 1);
    FUsuarios[High(FUsuarios)] := AUser;
  end;

  Result := True;
  {$ENDREGION}

end;

function TMigracaoSolicitacoes.Logar(Ausuario: string): Boolean;
var
  AUrl: string;
  ASenha: string;
  I: Integer;
  AValInArray: Boolean;
  Auser: TUsuario;
  Atoken: TResp_AcessTokent;
begin

  {$REGION 'Definindo URL e senha'}
  if THwUtilsClass.GetIni('MD', 'CUSTOM_URL', '') = 'S' then
    AUrl   := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
  else
    AUrl   := IfThen(THwUtilsClass.ComputadorDaRedeHwSistemas, AUrlApiHomologacao, AUrlApiProducao);

  ASenha := THwUtilsClass.CalculaChaveLoginChatWeb(Ausuario, '03530705000109');
  {$ENDREGION}

  {$REGION 'Login'}
  FRest.urlApi := AUrl;
  FRest.metodo := 'security/token';

  if not FRest.LoginApiHw(Ausuario, ASenha, nil) then
    Exit(False);

  if not Assigned(FRest.acessToken) then
    Exit(False);
  Result := True;
  {$ENDREGION}

  FLastURL := FRest.urlApi + FRest.metodo;

end;

procedure TMigracaoSolicitacoes.Migrar(ASolicitacao: TSolicitacaoSC);
var
  Acod_site: Integer;
  AFormatS: TFormatSettings;
  ALoop: SmallInt;
begin
  FLastMessage := 'OK';

  if not Assigned(ASolicitacao.modulo) then
  begin
    FLastMessage := '***SEM MÓDULO***';
    Exit;
  end;

  if not Assigned(ASolicitacao.assunto) then
  begin
    FLastMessage := '***SEM ASSUNTO***';
    Exit;
  end;

  FRest.metodo := 'SolicitacaoSC/Inserir';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_empresa', FRest.acessToken.cod_empresa.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);

  ASolicitacao.criado_por := nil;
  ASolicitacao.modulo     := nil;
  ASolicitacao.assunto    := nil;

  FRest.ExecutarPOST(ASolicitacao.ToJsonStringEncode);

  if FRest.restResponse.StatusCode <> 200 then
    Exit();

  FLastURL := FRest.urlApi + FRest.metodo;

  try
    if not Banco.Connected then
      if not conectar(FDataBaseName, True) then
      begin
        FLastMessage := '***ERRO AO CONECTAR COM O BANCO***';
        Exit;
      end;

      try
        QrAux.Close;
        QrAux.SQL.Text := 'update sug_cliente set migrado = 1' +
          ' where codigo = ' + ASolicitacao.peso_tipo.ToString;
        QrAux.ExecSQL;
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Commit;

      except on E: Exception do
        begin
          FLastMessage := e.Message;
          if QrAux.Transaction.InTransaction then
            QrAux.Transaction.Rollback;
        end;
      end;
  finally
    if Banco.Connected then
      desconectar;
  end;

  try
    FPostGre.Banco.Connected := False;
    FPostGre.Banco.ConnectionString := FstringPostGre;
    try
      FPostGre.Banco.Connected := True;
    except on E: Exception do
      begin
        FLastMessage := '***ERRO AO CONECTAR COM O BANCO DO SITE***';
        Exit;
      end;
    end;

    FPostGre.Banco.BeginTrans;
    try

      with FPostGre.Buscas do
      begin
        Close;
        SQL.Text := 'select cod_solicitacao from sugestoes_correcoes' +
                    ' where cod_empresa = 1 ' +
                    ' and peso_tipo = ' + ASolicitacao.peso_tipo.ToString +
                    ' and date_trunc(''day'', data_criacao) = current_date';
        Open;
        ALoop := 0;
        while (IsEmpty) and (ALoop < 5) do
        begin
          Sleep(1000 * 2);
          Close;
          Open;
          ALoop := ALoop + 1;
        end;

        if IsEmpty then
        begin
          FLastMessage := '***SOLICITAÇÃO NAO ENCONTRADA NO SITE***';
          Exit;
        end;

        Acod_site := FieldByName('cod_solicitacao').AsInteger;

        AFormatS := TFormatSettings.Create();
        AFormatS.DateSeparator := '/';
        AFormatS.TimeSeparator := ':';
        AFormatS.ShortDateFormat := 'DD/MM/YYYY';

        Close;
        SQL.Text := 'update sug_cor_hist_status set' +
          ' data_mod = ' + FormatDateTime('YYYY-MM-DD', StrToDate(ASolicitacao.data_criacao.Substring(0, 10), AFormatS)).QuotedString +
          ', cod_us_mod = ' + ASolicitacao.cod_us_cad.ToString +
          ' where cod_empresa = 1 and status = ' + ASolicitacao.status.ToString +
          ' and cod_solicitacao = ' + Acod_site.ToString +
          ' and date_trunc(''day'', data_mod) = current_date';
        ExecSQL;

        Sleep(500);

        Close;
        SQL.Text := 'update sug_cor_clientes set' +
          ' data_criacao = ' + FormatDateTime('YYYY-MM-DD', StrToDate(ASolicitacao.data_criacao.Substring(0, 10), AFormatS)).QuotedString +
          ', cod_us_cad = ' + ASolicitacao.cod_us_cad.ToString +
          ' where cod_empresa = 1' +
          ' and cod_solicitacao = ' + Acod_site.ToString +
          ' and date_trunc(''day'', data_criacao) = current_date';
        ExecSQL;

        Sleep(500);

        Close;
        SQL.Text := 'update sugestoes_correcoes set' +
          ' data_criacao = ' + FormatDateTime('YYYY-MM-DD', StrToDate(ASolicitacao.data_criacao.Substring(0, 10), AFormatS)).QuotedString +
          ', peso_tipo = null' +
          ', cod_us_cad = ' + ASolicitacao.cod_us_cad.ToString +
          ' where cod_empresa = 1' +
          ' and cod_solicitacao = ' + Acod_site.ToString +
          ' and date_trunc(''day'', data_criacao) = current_date';
        ExecSQL;
      end;

      FPostGre.Banco.CommitTrans;

    except on E: Exception do
      begin
        FPostGre.Banco.RollbackTrans;
        FLastMessage := '***ERRO AO EXECUTAR SQL NO SITE***' + #13 +
          E.Message + #13 +
          'sql: ' + FPostGre.Buscas.SQL.Text;
        Exit;
      end;
    end;

  finally
    FPostGre.Banco.Connected := False;
  end;
end;

procedure TMigracaoSolicitacoes.Naomigrar(ASolicitacao: TSolicitacaoSC);
begin
  FLastMessage := 'OK';
  try
    if not Banco.Connected then
      if not conectar(FDataBaseName, True) then
      begin
        FLastMessage := '***ERRO AO CONECTAR COM O BANCO***';
        Exit;
      end;

      try
        QrAux.Close;
        QrAux.SQL.Text := 'update sug_cliente set migrado = 0' +
          ' where codigo = ' + ASolicitacao.peso_tipo.ToString;
        QrAux.ExecSQL;
        if QrAux.Transaction.InTransaction then
          QrAux.Transaction.Commit;

      except on E: Exception do
        begin
          FLastMessage := e.Message;
          if QrAux.Transaction.InTransaction then
            QrAux.Transaction.Rollback;
        end;
      end;
  finally
    if Banco.Connected then
      desconectar;
  end;
end;

function TMigracaoSolicitacoes.GetAssunto(AsubString: string; AIndex: Integer): Integer;
var
  I: Integer;
begin
  if AIndex > High(FAssuntos) then
    Exit(AIndex);

  for I := AIndex + 1 to High(FAssuntos) do
    if FAssuntos[I].descricao.ToUpper.Contains(AsubString.ToUpper) then
      Exit(I);

  for I := Low(FAssuntos) to AIndex do
    if FAssuntos[I].descricao.ToUpper.Contains(AsubString.ToUpper) then
      Exit(I);

  Result := AIndex;
end;

function TMigracaoSolicitacoes.GetModulo(AsubString: string; AIndex: Integer): TModulo;
var
  I: Integer;
begin
  if AIndex > High(FModulos) then
    Exit(nil);

  for I := AIndex + 1 to High(FModulos) do
    if THwUtilsClass.ReplaceCaracteresEspeciais(FModulos[I].descricao).ToUpper.Contains(THwUtilsClass.ReplaceCaracteresEspeciais(AsubString).ToUpper) then
      Exit(FModulos[I]);

  for I := Low(FModulos) to AIndex do
    if THwUtilsClass.ReplaceCaracteresEspeciais(FModulos[I].descricao).ToUpper.Contains(THwUtilsClass.ReplaceCaracteresEspeciais(AsubString).ToUpper) then
      Exit(FModulos[I]);

  Result := nil;
end;

{ TConexaoPostgreSQL }

constructor TConexaoPostgreSQL.create;
var
  rdm: string;
begin
  Randomize;
  rdm := IntToStr(Random(99999999));

  FBanco := TADOConnection.Create(nil);
  FBanco.Name := 'adoconnection' + rdm;
  FBanco.LoginPrompt := False;
  FBanco.ConnectionString := '';

  FQrAux := TADOQuery.Create(nil);
  FQrAux.Connection := FBanco;

  FBuscas := TADOQuery.Create(nil);
  FBuscas.Connection := FBanco;
end;

destructor TConexaoPostgreSQL.Destroy;
begin
  FreeAndNil(FBuscas);
  FreeAndNil(FQrAux);
  FreeAndNil(FBanco);
  inherited;
end;

end.
