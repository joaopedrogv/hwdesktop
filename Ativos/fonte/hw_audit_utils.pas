unit hw_audit_utils;

interface

uses
{$IFDEF VER180}
  IBQuery,
  IBDatabase;
{$ELSE}
  hw_auditoria_class,
  hw_processo_class,
  IBX.IBDatabase,
  IBX.IBQuery;
{$ENDIF}

const
  strAlterar    = 'ALTERAR';
  strCancelar   = 'CANCELAR';
  strExcluir    = 'EXCLUIR';
  strFalha      = 'FALHA';
  strHabilitar  = 'HABILITAR';
  strInserir    = 'INSERIR';
  strSalvar     = 'SALVAR';
  strSucesso    = 'SUCESSO';
  strValidar    = 'VALIDAR';
  strVisualizar = 'VISUALIZAR';

type

  TAux_Query = class
  private
    FQuery: TIBQuery;
    FTransaction: TIBTransaction;
  public
    constructor Create; overload;
    constructor Create(banco: TIBDatabase); overload;
    destructor Destroy; override;

    property Query      : TIBQuery       read FQuery       write FQuery;
    property Transaction: TIBTransaction read FTransaction write FTransaction;
  end;

  TAudit_OOP = class
  private
    FDB              : TIBDatabase;
    FCodEmpresa      : Integer;
    FUsuario         : string;
    FCodProcesso     : string;
    FAcao            : string;
    FMensagem        : string;
    FChave           : string;
    FTabela          : string;
    FDepartamento    : string;
    FResultado       : string;
    FGravaAuditoria  : Boolean;
    FSenhaGerente    : Boolean;
    FInibeMensagens  : Boolean;
    FExigeConfirmacao: Boolean;

    {$IFNDEF VER180}
    Flistauditoria   : THw_auditoria_classList;

    function AcaoPermitidaExecutar(var Alist: THw_auditoria_classList; Aquery: TIBQuery): Boolean;
    {$ENDIF}

  public
    constructor Create; overload;
    constructor Create(usuario: string; codempresa: Integer; banco: TIBDatabase); overload;
    destructor Destroy; override;
    function Clear: TAudit_OOP;

    function AcaoPermitida(AcaoUsuario: string): Boolean;
    function Permitido(): Boolean;

    procedure GravarMensagem(Texto: string); overload;
    procedure GravarMensagem(Texto: string; const Args: array of const); overload;
    procedure GravarMensagemProcesso(Texto: string); overload;
    procedure GravarMensagemProcesso(Texto: string; const Args: array of const); overload;
    
    class function Auditoria_OOP(ProcessoID: string; Msg: string = ''; Key: string = ''; Table: string = ''): TAudit_OOP;
    function Processo(ProcessoID: string; Msg: string; Key: string): TAudit_OOP; overload;
    function Processo(ProcessoID: string; clearTxts: Boolean = True): TAudit_OOP; overload;
    function SetTabela(Table: string): TAudit_OOP;
    function SetChave(Key: string): TAudit_OOP;
    function SetMensagem(Msg: string): TAudit_OOP; overload;
    function SetMensagem(Msg: string; const Args: array of const): TAudit_OOP; overload;
    function Msg(value: string): TAudit_OOP; overload;
    function Msg(value: string; const Args: array of const): TAudit_OOP; overload;
    function Table(value: string): TAudit_OOP; overload;
    function Table(value: string; const Args: array of const): TAudit_OOP; overload;
    function Key(value: string): TAudit_OOP; overload;
    function Key(value: string; const Args: array of const): TAudit_OOP; overload;

    {$IFNDEF VER180}
    function AddProcesso(clearTxts: Boolean = True): TAudit_OOP;
    {$ENDIF}

    function Inserir: TAudit_OOP;
    function Alterar: TAudit_OOP;
    function Excluir: TAudit_OOP;
    function Validar: TAudit_OOP;
    function Visualizar: TAudit_OOP;
    function Salvar: TAudit_OOP;
    function Habilitar: TAudit_OOP;
    function Cancelar: TAudit_OOP;
    function Sucesso: TAudit_OOP;
    function Falha: TAudit_OOP;
    function InibirMensagens: TAudit_OOP;
    function InibirAuditoria: TAudit_OOP;
    function ExigirConfirmacao: TAudit_OOP;

    property CodProcesso     : string  read FCodProcesso      write FCodProcesso;
    property Acao            : string  read FAcao             write FAcao;
    property Mensagem        : string  read FMensagem         write FMensagem;
    property Chave           : string  read FChave            write FChave;
    property Tabela          : string  read FTabela           write FTabela;
    property Departamento    : string  read FDepartamento     write FDepartamento;
    property GravaAuditoria  : Boolean read FGravaAuditoria   write FGravaAuditoria;
    property SenhaGerente    : Boolean read FSenhaGerente     write FSenhaGerente;
    property InibeMensagens  : Boolean read FInibeMensagens   write FInibeMensagens;
    property ExigeConfirmacao: Boolean read FExigeConfirmacao write FExigeConfirmacao;

    {$IFNDEF VER180}
    property listauditoria   : THw_auditoria_classList read Flistauditoria write Flistauditoria;
    {$ENDIF}
  end;

implementation

uses
{$IFDEF VER180}
  uDtmAtivo,
{$ELSE}
  Winapi.Windows,
  senhas_class,
  tabela_processos_class,
  tabela_processos_usuarios_class,
  solicitacoes_acesso_class,
  Vcl.Forms,
  uPesqPros_lote,
  Vcl.Controls,
  Vcl.Dialogs,
  System.Generics.Collections,
{$ENDIF}
  hw_utils,
  StrUtils,
  SysUtils;

{$IFNDEF VER180}
function RegistrarAuditoria(usuario, usuariogerenteliberou,
  processo, acao, mensagem, tabela, codigotabmov, cod_empresa: WideString): boolean; stdcall; external
  'hw.auditoria.dx.dll';
{$ENDIF}

{ TAudit_OOP }

function TAudit_OOP.AcaoPermitida(AcaoUsuario: string): Boolean;
var
  Busca: TAux_Query;
  {$IFNDEF VER180}
  processos: THw_auditoria_classList;
  processo: THw_auditoria_class;
  disconected: Boolean;
  {$ENDIF}
begin
  FAcao := AcaoUsuario;
  Busca := TAux_Query.Create{$IFNDEF VER180}(FDB){$ENDIF};
  try
    {$IFNDEF VER180}
    disconected := not FDB.Connected;
    if disconected then
      FDB.Connected := True;

    try
      if not FCodProcesso.Trim.IsEmpty then
      begin
        processo              := THw_auditoria_class.Create;
        processo.cod_processo := FCodProcesso;
        processo.acao         := FAcao;
        processo.mensagem     := FMensagem;
        processo.tabela       := FTabela;
        processo.codigo       := FChave;
        processo.gravar       := FGravaAuditoria;

        //processos := THw_auditoria_classList.Create;;
        Flistauditoria.Add(processo);
      end;
      Result  := AcaoPermitidaExecutar(Flistauditoria, Busca.Query);
    finally
      if disconected then
        FDB.Connected := False;
    end;
    {$ELSE}
    Result := vDadosIni.PesqPros(FCodProcesso,
                                 FAcao,
                                 FMensagem,
                                 FTabela,
                                 FChave,
                                 Busca.Query,
                                 FGravaAuditoria,
                                 FExigeConfirmacao,
                                 FInibeMensagens,
                                 FDepartamento);
    {$ENDIF}
  finally
    Busca.Free;
    {$IFNDEF VER180}
    Flistauditoria.Clear;
    {$ENDIF}
    FInibeMensagens   := False;
    FExigeConfirmacao := False;
    FGravaAuditoria   := True;
    FResultado        := '';
  end;
end;

{$IFNDEF VER180}
function TAudit_OOP.AcaoPermitidaExecutar(
  var Alist: THw_auditoria_classList; Aquery: TIBQuery): Boolean;
const
  Amsg_senha_invalida: string = 'Usuário ou senha inválida ' + sLineBreak + 'Verifique se o usuário está ativo e tem permissão de acesso na empresa';
var
  Aaux_sql  : string;
  Aprcs     : TTabela_processos_classList;
  Aexs_us   : TTabela_processos_usuarios_classList;
  Aexs_ger  : TTabela_processos_usuarios_classList;
  Aliberado : THw_auditoria_classList;
  Anegado   : TObjectList<THw_auditoria_class>;//THw_auditoria_classList;
  Apendente : TObjectList<THw_auditoria_class>;//THw_auditoria_classList;
  Aprc      : THw_auditoria_class;
  Asolits   : TSolicitacoes_acesso_classList;
  Auser_at  : TSenhas_class;
  Auser_ger : TSenhas_class;
  I, J, Z   : Integer;
  Avalid    : Boolean;
  Amsg, Astr: string;
  Alotesol  : Integer;
  Aexec     : TIBQuery;
  Atran     : TIBTransaction;
  MsgNaoPer : TArray<string>;

  function SqlOpen(ASql: string; Query: TIBQuery = nil): TIBQuery; overload;
  begin
    if Query = nil then
      Query := Aquery;

    Query.Close;
    Query.SQL.Text := ASql;
    Query.Open;

    Result := Query;
  end;

  function SqlOpen(ASql: string; const Args: array of const; AQuery: TIBQuery = nil): TIBQuery; overload;
  begin
    Result := SqlOpen(Format(ASql, Args), AQuery);
  end;

  {$REGION 'montando listas'}
  procedure montar_listas(Auser: TSenhas_class; Aexs: TTabela_processos_usuarios_classList; AcheckGeren: Boolean);
  var
    A, B : Integer;
    Aitem: THw_auditoria_class;
  begin
    Aliberado.Clear;
    Apendente.Clear;
    Anegado.Clear;
    for A := 0 to Pred(Alist.Count) do
    begin
      Aitem  := Alist.Items[A];

      if ((not AcheckGeren) and (Aitem.status = '')) or           //primeiro momento da validacao
         ((    AcheckGeren) and (Aitem.status = 'Pendente')) then //segunda etapa apos a digitacao da senha do gerente
        for B := 0 to Pred(Aexs.Count) do with Aprcs.Items[B] do
          if cod_processo = Aitem.cod_processo then
          begin
            Aitem.status := 'Liberado';
            Break;
          end;

      if MatchText(Aitem.status, ['', 'Pendente']) then
        for B := 0 to Pred(Aprcs.Count) do with Aprcs.Items[B] do
          if cod_processo = Aitem.cod_processo then
          begin
            if (not AcheckGeren) and (senha_gerente = 'S') then
              Aitem.status := 'Pendente'
            else if (nivel_processo <= Auser.nivel_us) then
            begin
              Aitem.status := 'Liberado';
              Aitem.usuario_lib := IfThen(AcheckGeren, Auser.usuario, Aitem.usuario_lib);
            end
            else
              Aitem.status := 'Negado';
            Break;
          end;

      case IndexText(Aitem.status, ['Liberado', 'Pendente']) of
        0 :  Aliberado.Add(Aitem.Clone);
        1 :  Apendente.Add(Aitem.Clone);
        else Anegado.Add(Aitem.Clone);
      end;
    end;
  end;
  {$ENDREGION}
begin
//  SqlOpen()
  Result     := False;
  Aaux_sql := '';
  for I := 0 to Pred(Alist.Count) do with Alist.Items[I] do
    Aaux_sql := Aaux_sql + StrUtils.IfThen(I = 0, '(') + QuotedStr(cod_processo) + StrUtils.IfThen(Pred(Alist.Count) = I, ')', ',');

  Aprcs     := TTabela_processos_classList.Create;
  Aexs_us   := TTabela_processos_usuarios_classList.Create;
  Aliberado := THw_auditoria_classList.Create;
  Apendente := TObjectList<THw_auditoria_class>.Create;//THw_auditoria_classList.Create;
  Anegado   := TObjectList<THw_auditoria_class>.Create;//THw_auditoria_classList.Create;
  Auser_at  := TSenhas_class.Create;
  try
    Auser_at.SetValuesFrom(SqlOpen('select %s from senhas where usuario = %s and cod_empresa = %d and ativo = 1', [TSenhas_class.GetFieldsSql(), QuotedStr(FUsuario), FCodEmpresa], Aquery));

    Aprcs.SetValuesFrom(SqlOpen('select %s from TABELA_PROCESSOS where cod_processo in %s and cod_empresa = %d',
                                [TTabela_processos_class.GetFieldsSql(), Aaux_sql, FCodEmpresa], Aquery));

    Aexs_us.SetValuesFrom(SqlOpen('select %s from TABELA_PROCESSOS_USUARIOS where cod_processo in %s and cod_empresa = %d and usuario = %s',
                                [TTabela_processos_usuarios_class.GetFieldsSql(), Aaux_sql, FCodEmpresa, QuotedStr(FUsuario)], Aquery));

    for I := 0 to Pred(Alist.Count) do
    begin
      Alist.Items[I].usuario := FUsuario;
      Alist.Items[I].nome_processo := 'Processo não cadastrado';
      for J := 0 to Pred(Aprcs.Count) do if Alist.Items[I].cod_processo = Aprcs.Items[J].cod_processo then
      begin
        Alist.Items[I].nome_processo := Aprcs.Items[J].nome_processo;
        Alist.Items[I].gravar        := Aprcs.Items[J].gravar_auditoria = 'S';
        Break;
      end;
    end;

    montar_listas(Auser_at, Aexs_us, False);

    try

      if Anegado.Count > 0 then
        Exit;

      if Apendente.Count = 0 then
        Exit;

      Atran := TIBTransaction.Create(nil);
      Atran.DefaultDatabase := Aquery.Database;
      Atran.Params.Add('read_committed');
      Atran.Params.Add('rec_version');
      Atran.Params.Add('nowait');

      Aexec := TIBQuery.Create(nil);
      Aexec.Transaction := Atran;
      try
        Asolits := TSolicitacoes_acesso_classList.Create;

        Alotesol := 0;
        if Alist.Count > 1 then
        begin
          Aexec.Close;
          Aexec.SQL.Text := Format('select cod from incrementa_codigo(%d, %s)', [FCodEmpresa, QuotedStr('SOLICITACOES_ACESSO_LOTE')]);
          Aexec.Open;

          Alotesol := Aexec.FieldByName('cod').AsInteger;
        end;

        for I := 0 to Alist.Count - 1 do if Alist.Items[I].status = 'Pendente' then
          with Asolits.New do
          begin

            cod_solicitacao     := SqlOpen('select cod, (select fh.current_ts from sp_current_ts(%d) fh) datahora from incrementa_codigo(%d, %s)',
                                           [FCodEmpresa, FCodEmpresa, QuotedStr('SOLICITACOES_ACESSO')], Aexec).FieldByName('cod').AsInteger;
            cod_empresa         := FCodEmpresa;
            usuario_solicitante := FUsuario;
            data_solicitacao    := Aexec.FieldByName('datahora').AsDateTime;
            processo            := Alist.Items[I].cod_processo;
            mensagem            := Alist.Items[I].mensagem;
            lote                := Alotesol;

            Alist.Items[I].id   := cod_solicitacao;

            if Alist.Count = 1 then
              Alotesol          := cod_solicitacao;
          end;
        Astr := 'cod_solicitacao, cod_empresa, usuario_solicitante, data_solicitacao, processo, mensagem' + IfThen(Alist.Count > 1, ', lote');
        Aexec.Close;
        Aexec.SQL.Text := Format('insert into SOLICITACOES_ACESSO (%s) values (:%s)',
                                 [Astr, StringReplace(Astr, ', ', ', :', [rfReplaceAll])]);
        for I := 0 to Pred(Asolits.Count) do
          Asolits.Items[I].SetValuesInParams(Aexec, True).ExecSQL;
        if Aexec.Transaction.InTransaction then
          Aexec.Transaction.Commit;

        Auser_ger := TSenhas_class.Create;
        Aexs_ger  := TTabela_processos_usuarios_classList.Create;
        Application.CreateForm(TfrmPesqPros_lote, frmPesqPros_lote);
        frmPesqPros_lote.ed_user.Text := FUsuario;
        while True do with frmPesqPros_lote do
        begin
          loteLib.popular(Apendente, Aprcs);
          lb_lote.Caption := Format('%s: %d', [IfThen(Alist.Count > 1, 'LOTE', 'COD LIB'), Alotesol]);

          case ShowModal of
            mrOk :
            begin
              Amsg := '';

              if modal_origem = 'LIB' then
              begin
                Asolits.Clear;
                Asolits.SetValuesFrom(SqlOpen('select %s from SOLICITACOES_ACESSO where %s = %d and cod_empresa = %d',
                                              [TSolicitacoes_acesso_class.GetFieldsSql(),
                                               IfThen(Alist.Count > 1, 'lote',  'cod_solicitacao'), Alotesol, FCodEmpresa], Aquery));
                for I := 0 to Pred(Asolits.Count) do
                  if Asolits.Items[I].usuario_gerente = '' then
                    Amsg := 'Existem solicitações pendentes'
                  else
                    for J := 0 to Pred(Alist.Count) do
                      if Alist.Items[J].id = Asolits.Items[I].cod_solicitacao then
                      begin
                        Alist.Items[J].usuario_lib := Asolits.Items[I].usuario_gerente;
                        Alist.Items[J].status      := 'Liberado';
                        Break;
                      end;

                montar_listas(Auser_at, Aexs_us, False);
                if Amsg <> ''  then
                  ShowErro(Amsg)
                else
                  Break;
              end
              else if modal_origem = 'OK' then
              begin

                Auser_ger.SetValuesFrom(SqlOpen('select %s from senhas where usuario = %s and cod_empresa = %d and ativo = 1', [TSenhas_class.GetFieldsSql(), QuotedStr(ed_user.Text), FCodEmpresa], Aquery));
                if (Auser_ger.usuario = ed_user.Text) and (Auser_ger.emp_padrao > 0) and (Auser_ger.emp_padrao <> Auser_ger.cod_empresa) then
                begin
                  Auser_ger.SetValuesFrom(SqlOpen('select %s from senhas where usuario = %s and cod_empresa = %d', [TSenhas_class.GetFieldsSql(), QuotedStr(ed_user.Text), Auser_ger.emp_padrao], Aquery));
                  if (Auser_ger.usuario = '') or (Auser_ger.ativo <> 1) then
                    Amsg := Amsg_senha_invalida;
                end;

                if (Amsg = '') and ((Auser_ger.usuario = '') or (Auser_ger.usuario <> ed_user.Text) or (decodifica(Auser_ger.senha) <> ed_pass.Text)) then
                  Amsg := Amsg_senha_invalida;

                if Amsg <> '' then
                  ShowErro(Amsg)
                else
                begin
                  Aexs_ger.SetValuesFrom(SqlOpen('select %s from TABELA_PROCESSOS_USUARIOS where cod_processo in %s and cod_empresa = %d and usuario = %s',
                                                 [TTabela_processos_usuarios_class.GetFieldsSql(), Aaux_sql, FCodEmpresa, QuotedStr(Auser_ger.usuario)], Aquery));
                  //percorrer a lista das liberacoes e permitir de acordo o nivel do usuário
                  montar_listas(Auser_ger, Aexs_ger, True);
                  Break;
                end;
              end;

            end;
            else
              Break;
          end;
        end;

      finally
        Aexec.Close;
        Aexec.SQL.Text :=  Format('delete from SOLICITACOES_ACESSO where %s = %d and cod_empresa = %d',
                                  [IfThen(Alist.Count > 1, 'lote',  'cod_solicitacao'), Alotesol, FCodEmpresa]);
        Aexec.ExecSQL;
        if Aexec.Transaction.InTransaction then
          Aexec.Transaction.Commit;
      end;

    finally
      if (Apendente.Count > 0) or (Anegado.Count > 0) then
      begin
        Result := False;
        if not FInibeMensagens  then
        begin
          MsgNaoPer := [];

          for Aprc in Anegado do
            MsgNaoPer := MsgNaoPer + [Aprc.cod_processo + ' ' + Aprc.nome_processo];

          for Aprc in Apendente do
            MsgNaoPer := MsgNaoPer + [Aprc.cod_processo + ' ' + Aprc.nome_processo];

          ShowErro('Processo não permitido para o usuário %s%s', [sLineBreak, string.Join(sLineBreak, MsgNaoPer)]);
        end;
      end
      else 
      begin

        if not FExigeConfirmacao then
          Avalid := True
        else
          Avalid := ShowConfirmacao('Deseja continuar mesmo assim?') <> ID_YES ;

        if Avalid then
        begin
          Result := True;

          for I := 0 to Pred(Alist.Count) do with Alist.Items[I] do if gravar then
            RegistrarAuditoria(usuario,
                               usuario_lib,
                               cod_processo,
                               acao,
                               nome_processo + ' - ' + mensagem,
                               tabela,
                               codigo,
                               FCodEmpresa.ToString);
        end;
      end;
    end;

  finally
    if Assigned(Auser_at)  then FreeAndNil(Auser_at);
    if Assigned(Auser_ger)  then FreeAndNil(Auser_ger);
    if Assigned(Aexs_us)  then FreeAndNil(Aexs_us);
    if Assigned(Aexs_ger)  then FreeAndNil(Aexs_ger);
    if Assigned(Aprcs)     then FreeAndNil(Aprcs);
    if Assigned(Aliberado) then FreeAndNil(Aliberado);
    if Assigned(Apendente) then FreeAndNil(Apendente);
    if Assigned(Anegado)   then FreeAndNil(Anegado);
    if Assigned(Asolits)   then FreeAndNil(Asolits);
    if Assigned(Aexec)     then FreeAndNil(Aexec);
    if Assigned(Atran)     then FreeAndNil(Atran);
  end;
end;

function TAudit_OOP.AddProcesso(clearTxts: Boolean): TAudit_OOP;
var
  proc: THw_auditoria_class;
begin
  proc                := THw_auditoria_class.Create;
  try
    proc.cod_processo := FCodProcesso;
    proc.acao         := FAcao;
    proc.mensagem     := FMensagem;
    proc.tabela       := FTabela;
    proc.codigo       := FChave;
    proc.gravar       := FGravaAuditoria;

    Flistauditoria.Add(proc);
  finally
    if clearTxts then
      Processo('', clearTxts);
    FGravaAuditoria := True;
  end;
end;

{$ENDIF}

function TAudit_OOP.Alterar: TAudit_OOP;
begin
  FAcao := strAlterar;
  Result := Self;
end;

function TAudit_OOP.Permitido: Boolean;
begin
  Result := AcaoPermitida(FAcao);
end;

function TAudit_OOP.Processo(ProcessoID: string; clearTxts: Boolean): TAudit_OOP;
begin
  Result           := Self;
  Self.CodProcesso := ProcessoID;
  if clearTxts then
  begin
    Self.Mensagem    := '';
    Self.Chave       := '';
  end;
end;

function TAudit_OOP.Processo(ProcessoID, Msg, Key: string): TAudit_OOP;
begin
  Result           := Self;
  Self.CodProcesso := ProcessoID;
  Self.Mensagem    := Msg;
  Self.Chave       := Key;
end;

class function TAudit_OOP.Auditoria_OOP(ProcessoID, Msg, Key,
  Table: string): TAudit_OOP;
begin
  Result             := TAudit_OOP.Create;
  Result.CodProcesso := ProcessoID;
  Result.Mensagem    := Msg;
  Result.Chave       := Key;
  Result.Tabela      := Table;
end;

function TAudit_OOP.Cancelar: TAudit_OOP;
begin
  FAcao := strCancelar;
  Result := Self;
end;

function TAudit_OOP.Clear: TAudit_OOP;
begin
  Result            := Self;
  FCodProcesso      := '';
  FMensagem         := '';
  FChave            := '';
  FTabela           := '';
  FDepartamento     := '';
  FResultado        := '';
  FGravaAuditoria   := True;
  FSenhaGerente     := False;
  FInibeMensagens   := False;
  FExigeConfirmacao := False;
end;

constructor TAudit_OOP.Create(usuario: string; codempresa: Integer;
  banco: TIBDatabase);
begin
  FDB := banco;
  FUsuario := usuario;
  FCodEmpresa := codempresa;
  Create;
end;

destructor TAudit_OOP.Destroy;
begin
  {$IFNDEF VER180}
  Flistauditoria.Free;
  {$ENDIF}
  inherited;
end;

constructor TAudit_OOP.Create;
begin
  {$IFNDEF VER180}
  Flistauditoria := THw_auditoria_classList.Create;
  {$ENDIF}

  Clear;
end;

function TAudit_OOP.Excluir: TAudit_OOP;
begin
  FAcao := strExcluir;
  Result := Self;
end;

function TAudit_OOP.ExigirConfirmacao: TAudit_OOP;
begin
  FExigeConfirmacao := True;
  Result := Self;
end;

function TAudit_OOP.Falha: TAudit_OOP;
begin
  FResultado := strFalha;
  Result := Self;
end;

procedure TAudit_OOP.GravarMensagem(Texto: string);
begin
  try
    {$IFDEF VER180}
    vDadosIni.Auditoria(FCodProcesso, FAcao,
                        Trim(IfThen(Trim(FResultado) <> '', FResultado + ' ') + Texto),
                        FTabela, FChave);
    {$ELSE}
      RegistrarAuditoria(FUsuario, '',
                         FCodProcesso,
                         FAcao,
                         Trim(IfThen(not FResultado.IsEmpty, FResultado + ' ') + Texto),
                         FTabela,
                         FChave,
                         FCodEmpresa.ToString);
    {$ENDIF}
  finally
    FResultado := '';
  end;
end;

procedure TAudit_OOP.GravarMensagem(Texto: string;
  const Args: array of const);
begin
  GravarMensagem(Format(Texto, Args));
end;

procedure TAudit_OOP.GravarMensagemProcesso(Texto: string;
  const Args: array of const);
begin
  GravarMensagemProcesso(Format(Texto, Args));
end;

procedure TAudit_OOP.GravarMensagemProcesso(Texto: string);
var
  Busca: TAux_Query;
  {$IFNDEF VER180}
  processo: TTabela_processos_class;
  disconected: Boolean;
  {$ENDIF}
begin
  Busca := TAux_Query.Create{$IFNDEF VER180}(FDB){$ENDIF};
  try
    {$IFDEF VER180}
    vDadosIni.GravaAuditoria(FCodProcesso, FAcao,
                             IfThen(Trim(FResultado) <> '', FResultado + ' ') + Texto,
                             FTabela, FChave, Busca.Query);
    {$ELSE}
    disconected := not FDB.Connected;
    if disconected then
      FDB.Connected := True;

    try

      Busca.Query.Close;
      Busca.Query.SQL.Text := Format('select %s from TABELA_PROCESSOS where cod_processo = %s and cod_empresa = %d',
                                     [TTabela_processos_class.GetFieldsSql(), FCodProcesso, FCodEmpresa]);
      Busca.Query.Open;

      processo              := TTabela_processos_class.Create;
      processo.SetValuesFrom(Busca. FQuery);

      RegistrarAuditoria(FUsuario, '',
                         FCodProcesso,
                         FAcao,
                         (IfThen(not processo.nome_processo.IsEmpty, processo.nome_processo + ' - ') +
                          IfThen(not FResultado.IsEmpty, FResultado + ' ') + Texto),
                         FTabela,
                         FChave,
                         FCodEmpresa.ToString);

      processo.Free;

    finally
      if disconected then
        FDB.Connected := False;
    end;
    {$ENDIF}
  finally
    FResultado := '';
    Busca.Free;
  end;
end;

function TAudit_OOP.Habilitar: TAudit_OOP;
begin
  FAcao := strHabilitar;
  Result := Self;
end;

function TAudit_OOP.InibirAuditoria: TAudit_OOP;
begin
  FGravaAuditoria := False;
  Result := Self;
end;

function TAudit_OOP.InibirMensagens: TAudit_OOP;
begin
  FInibeMensagens := True;
  Result := Self;
end;

function TAudit_OOP.Inserir: TAudit_OOP;
begin
  FAcao := strInserir;
  Result := Self;     
end;

function TAudit_OOP.Key(value: string;
  const Args: array of const): TAudit_OOP;
begin
  Result := Key(Format(value, Args));
end;

function TAudit_OOP.Key(value: string): TAudit_OOP;
begin
  FChave := value;
  Result := Self;
end;

function TAudit_OOP.Msg(value: string;
  const Args: array of const): TAudit_OOP;
begin
  Result := Msg(Format(value, Args));
end;

function TAudit_OOP.Msg(value: string): TAudit_OOP;
begin
  FMensagem := value;
  Result := Self;
end;

function TAudit_OOP.SetTabela(Table: string): TAudit_OOP;
begin
  FTabela := Table;
  Result := Self;
end;

function TAudit_OOP.Salvar: TAudit_OOP;
begin
  FAcao := strSalvar;
  Result := Self;
end;

function TAudit_OOP.Sucesso: TAudit_OOP;
begin
  FResultado := strSucesso;
  Result := Self;
end;

function TAudit_OOP.Table(value: string;
  const Args: array of const): TAudit_OOP;
begin
  Result := Table(Format(value, Args));
end;

function TAudit_OOP.Table(value: string): TAudit_OOP;
begin
  FTabela := value;
  Result := Self;
end;

function TAudit_OOP.SetChave(Key: string): TAudit_OOP;
begin
  FChave := Key;
  Result := Self;
end;

function TAudit_OOP.SetMensagem(Msg: string;
  const Args: array of const): TAudit_OOP;
begin
  Result := SetMensagem(Format(Msg, Args));
end;

function TAudit_OOP.SetMensagem(Msg: string): TAudit_OOP;
begin
  FMensagem := Msg;
  Result := Self;
end;

function TAudit_OOP.Validar: TAudit_OOP;
begin
  FAcao := strValidar;
  Result := Self;
end;

function TAudit_OOP.Visualizar: TAudit_OOP;
begin
  FAcao := strVisualizar;
  Result := Self;
end;

{ TAux_Query }

constructor TAux_Query.Create;
begin
  {$IFNDEF VER180}
  raise Exception.Create('Use o Create(banco)');
  {$ELSE}
  Create(dtmAtivo.bancoHw);
  {$ENDIF}
end;

constructor TAux_Query.Create(banco: TIBDatabase);
begin
  FTransaction                 := TIBTransaction.Create(banco);
  FTransaction.DefaultDatabase := banco;
  FTransaction.Params.Add('read_committed');
  FTransaction.Params.Add('rec_version');
  FTransaction.Params.Add('nowait');

  FQuery                       := TIBQuery.Create(banco);
  FQuery.Database              := banco;
  FQuery.Transaction           := FTransaction;
end;

destructor TAux_Query.Destroy;
begin
  FQuery.Free;
  FTransaction.Free;
  inherited;
end;

end.
