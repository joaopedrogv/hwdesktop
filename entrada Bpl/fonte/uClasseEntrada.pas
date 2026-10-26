unit uClasseEntrada;

interface

uses
  uDataSet_OOP;

type
  TvalidaEmail = function(pEmail: PChar; pKeyWSCEP: PChar): Integer; stdcall;
  TEmpresa = class(TDataSet_OOP)
  private
    //function getDadosNFe: boolean;
  public
    constructor Create;
    function selecionaEmpresa(codigo: string): boolean;
    function getTodos: boolean; overload;
    function getTodos(pUsuario: string): boolean; overload;
    function GetDadosEmpresa: boolean;
    function getCNPJ: string;
    procedure setAmbienteHomologacao;
  end;
  TEmDesenvolvedora = class(TDataSet_OOP)
  private
  public
    constructor Create;
    function abreEmpresa: boolean;
  end;

  TUsuario = class(TDataSet_OOP)
  private
    procedure corrigeEmpPadrao(pUsuario: string; pEmpPadrao: Integer);
    procedure insereHw(pCodEmpresa, pEmpPadrao: Integer);
  public
    vCodEmpPadrao: Integer;
    vCorrigirEmpPadrao: Boolean;
    constructor Create;
    destructor destroy; override;
    {function Codifica(Wtexto: string): string;
    function Decodifica(Wtexto: string): string;}
    function validaSenha(usuario, senha: string): Boolean; overload;
    function validaSenha(usuario, senha, sistema: string): boolean; overload;
    procedure setSistemasUsuarios;
    procedure registraaltersenha;
    function verificarHorarioTrabalho(pUsuario: string): Boolean;
    procedure setEmpresaSelecionada(pUsuario: string);
    function modificarEmpresaPadrao: Boolean;
    function getEmpresaTreinamento: string;

  var
    vEmpresa: TEmpresa;
    vEmpDes: TEmDesenvolvedora;
  end;

implementation

uses
  SysUtils, DBClient, uDtmEntrada, Dialogs, DB, uDtmAtivo, IBQuery, Forms,
  uDadosIni, Classes, USenha, Windows, funcoes, ContainerUnit, ISessionContextUnit, DFeDLLAdapterUnit, DFeHwLibUnit;

{ TUsuario }

(*
function TUsuario.Codifica(Wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));
  wnormal := '  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-';
  wcripto := 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  codifica := wresultado;
end;             *)

procedure TUsuario.corrigeEmpPadrao(pUsuario: string; pEmpPadrao: Integer);
begin
  buscas.Close;
  buscas.SQL.Text := 'update senhas set emp_padrao = ' + IntToStr(pEmpPadrao) +
    ' where usuario = ' + QuotedStr(Trim(pUsuario)) +
    ' and emp_padrao <> ' + IntToStr(pEmpPadrao);
  buscas.ExecSQL;
  
  buscas.Close;
  buscas.SQL.Text := 'update senhas set emp_padrao = ' + IntToStr(pEmpPadrao) +
    ' where usuario = ' + QuotedStr(Trim(pUsuario)) +
    ' and emp_padrao is null';
  buscas.ExecSQL;

  if buscas.Transaction.InTransaction then
    buscas.Transaction.Commit;
end;

constructor TUsuario.Create;
var
  i: integer;
begin
  DataSet := TClientDataSet(dtmEnt.cdsSenha);
  buscas := TIBQuery(dtmEnt.qrBuscas);
  vEmpresa := TEmpresa.Create;
  vEmpDes := TEmDesenvolvedora.Create;
  vEmpDes.abreEmpresa;
end;

(*
function TUsuario.Decodifica(Wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));
  // wnormal:='  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-';
  // wcripto:='œ!=#$%^&*(|\][›?><:žŸ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+';

  wnormal := 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+';
  wcripto := '  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  decodifica := wresultado;
end;
*)

destructor TUsuario.destroy;
begin
  vEmpresa.Free;
  vEmpresa := nil;

  vEmpDes.Free;
  vEmpDes := nil;

  inherited;
end;

function TUsuario.getEmpresaTreinamento: string;
var
  formulario: TForm;
begin
  Result := '';
  try
    formulario := TForm.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Empresa';
    frmEntrada.Label4.Caption := 'Selecione a empresa para buscar o endereço do banco de Treinamento';
    frmEntrada.pnEmpPadrao.Visible := True;
    frmEntrada.pnEmpPadrao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    if (formulario.ShowModal = IDOK) then
      Result := vEmpresa.getCNPJ;
  finally
    frmEntrada.pnEmpPadrao.Parent := frmEntrada;
    frmEntrada.pnEmpPadrao.Visible := False;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TUsuario.insereHw(pCodEmpresa, pEmpPadrao: Integer);
begin
  buscas.Close;
  buscas.SQL.Text := 'select * from senhas' +
    ' where usuario = ' + QuotedStr('HW') +
    ' and cod_empresa = :cod_empresa';
  buscas.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
  buscas.Open;

  if buscas.IsEmpty then
  begin
     buscas.Close;
     buscas.SQL.Text := 'insert into senhas (codigo, usuario, cod_empresa, emp_padrao, senha, contra_senha, ativo, nivel_us)' +
                        ' values (:codigo, :usuario, :cod_empresa, :emp_padrao, :senha, :contra_senha, :ativo, 10)';
     buscas.ParamByName('codigo').AsInteger := 0;
     buscas.ParamByName('usuario').AsString := 'HW';
     buscas.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
     if pEmpPadrao > 0 then
       buscas.ParamByName('emp_padrao').AsInteger := pEmpPadrao;
     buscas.ParamByName('senha').AsString := Copy(Trim(vDadosIni.vSenhaUsuario),1,6);
     buscas.ParamByName('contra_senha').AsString := Copy(Trim(vDadosIni.vSenhaUsuario),1,6);
     buscas.ParamByName('ativo').AsInteger := 1;
     buscas.ExecSQL;
     
     if buscas.Transaction.InTransaction then
       buscas.Transaction.Commit;
  end;
end;

function TUsuario.modificarEmpresaPadrao: Boolean;
var
  formulario: TForm;
begin
  try
    formulario := TForm.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poMainFormCenter;
    formulario.Caption := 'Alteração de Empresa padrão';
    frmEntrada.Label4.Caption := 'Selecione a empresa padrão deste usuário para continuar';
    frmEntrada.pnEmpPadrao.Visible := True;
    frmEntrada.pnEmpPadrao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);
    if Result then
      corrigeEmpPadrao(vDadosIni.vNomeUsuario, vEmpresa.dataSet.FieldByName('cod_empresa').AsInteger);

  finally
    frmEntrada.pnEmpPadrao.Parent := frmEntrada;
    frmEntrada.pnEmpPadrao.Visible := False;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TUsuario.registraaltersenha;
begin
vDadosIni.GravaAuditoria('CFG032', 'ALTERAR', 'SUCESSO', 'SENHAS',vDadosIni.vNomeUsuario, buscas);
end;

procedure TUsuario.setEmpresaSelecionada(pUsuario: string);
type
  TsetPadraoEmpresaId = procedure(value: Integer; dbName: string);

  function EmailDuplicado(AEmail: string): Boolean;
  var
    AMensagem, AEmails: TStrings;
    I: Integer;
  begin
    Result := False;
    AEmails := vDadosIni.SplitS(Trim(AEmail), [';', ',', '/', '\', '|', ' ']);
    for I := AEmails.Count - 1 to 0 do if Trim(AEmails[I]) = '' then AEmails.Delete(I);
    if AEmails.Count > 1 then
      AEmail := AEmails[0];

    buscas.Close;
    buscas.SQL.Text := 'select cod_vendedor, nome_vendedor, email from colaborador' +
      ' where lower(email) like :email' +
      ' and cod_vendedor <> ' + IntToStr(vDadosIni.vCodUsuario) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('email').AsString := LowerCase(AEmail) + '%';
    buscas.Open;
    buscas.FetchAll;
    if buscas.RecordCount >= 1 then
    begin
      AMensagem := TStringList.Create;
      try
        AMensagem.Add('Seu email está duplicado: ' + LowerCase(AEmail));
        if buscas.RecordCount = 1 then
          AMensagem.Add('Outro cadastro de colaborador também está utilizando o mesmo email')
        else
          AMensagem.Add('Outros cadastros de colaboradores também estão utilizando o mesmo email');
        AMensagem.Add('');
        buscas.First;
        while not buscas.Eof do
        begin
          AMensagem.Add(vDadosIni.StrZero(buscas.FieldByName('cod_vendedor').AsInteger, 3) + ' - ' +
                        Trim(buscas.FieldByName('nome_vendedor').AsString)
                       );
          buscas.Next;
        end;

        vDadosIni.ShowAtencao(AMensagem.Text);
      finally
        FreeAndNil(AMensagem);
      end;
      Result := True;
    end;
  end;

var
  tempData: string;
  vEmailUsuario: string;
  validaEmail: TvalidaEmail;
  hdValidaEmail: THandle;
  vRetornoEmailValido: Integer;
  setPadraoEmpresaId: TsetPadraoEmpresaId;
  Session: ISessionContext;
begin
  vDadosIni.codEmpresa := vEmpresa.dataSet.FieldByName('cod_empresa').AsString;

  try
    if vDadosIni.vFormularios.AHandle = 0 then
      CarregaPacote('pkFormularios', vDadosIni.vFormularios.AHandle);
    @setPadraoEmpresaId := GetProcAddress(vDadosIni.vFormularios.AHandle, PChar('setPadraoEmpresaId'));
    if Assigned(setPadraoEmpresaId) then
      setPadraoEmpresaId(vDadosIni.cod_empresa, vDadosIni.vBancoHW);
  except on E: Exception do
  end;

  if vDadosIni.vModoTreino = 'S' then
    vEmpresa.setAmbienteHomologacao;

  if Trim(pUsuario) = 'HW' then
    insereHw(vEmpresa.dataSet.FieldByName('cod_empresa').AsInteger,
      vCodEmpPadrao);

  if Trim(pUsuario) = 'HW' then
    montaSelect('select '' '' nome_vendedor, s.codigo, s.depart, '' '' desc_funcao, ' +
    ' s.usuario, s.senha, s.cod_empresa, s.nivel_us,' +
    ' s.ALT_IMP, s.IMP_US, s.estoq_neg, e.nome_emp, e.CGC_EMP, ' +
    ' s.exibir_mensagem_consorcio, s.cod_perfil_horas_trab, '' '' email' +
    ' from SENHAS S' +
    ' inner join empresa e on e.cod_empresa = s.cod_empresa' +
    ' where S.USUARIO = ' + QuotedStr(trim(pusuario)) +
    ' and S.cod_empresa = ' + vDadosIni.codEmpresa + ' and S.ativo = 1')
  else
  begin
    if (vDadosIni.vSistema <> 'Fiscal') or (vDadosIni.vTipoConexao <> 'off') then
      montaSelect(' select col.nome_vendedor, s.codigo, dep.nome_depto depart, f.desc_funcao, ' +
        ' s.usuario, s.senha, s.cod_empresa, s.nivel_us, ' +
        ' s.ALT_IMP, s.IMP_US, s.estoq_neg, e.nome_emp, e.CGC_EMP, ' +
        ' s.exibir_mensagem_consorcio, s.cod_perfil_horas_trab, col.email' +
        ' from SENHAS S ' +
        ' inner join empresa e on e.cod_empresa = s.cod_empresa ' +
        ' inner join colaborador col on col.cod_vendedor = s.codigo and col.cod_empresa = s.cod_empresa ' +
        ' left join funcoes f on f.cod_funcao = col.cod_funcao ' +
        ' left join depto dep on dep.cod_depto = f.cod_depto ' +
        ' where S.USUARIO = ' + QuotedStr(trim(pusuario)) +
        ' and S.cod_empresa = ' + vDadosIni.codEmpresa + ' and S.ativo = 1')
    else
      montaSelect(' select col.nome_vendedor, s.codigo, s.depart, f.desc_funcao, ' +
        ' s.usuario, s.senha, s.cod_empresa, s.nivel_us, ' +
        ' s.ALT_IMP, s.IMP_US, s.estoq_neg, e.nome_emp, e.CGC_EMP, ' +
        ' s.exibir_mensagem_consorcio, s.cod_perfil_horas_trab, col.email' +
        ' from SENHAS S ' +
        ' inner join empresa e on e.cod_empresa = s.cod_empresa ' +
        ' inner join colaborador col on col.cod_vendedor = s.codigo and col.cod_empresa = s.cod_empresa ' +
        ' left join funcoes f on f.cod_funcao = col.cod_funcao ' +
        ' where S.USUARIO = ' + QuotedStr(trim(pusuario)) +
        ' and S.cod_empresa = ' + vDadosIni.codEmpresa + ' and S.ativo = 1');
  end;

  vDadosIni.vCodUsuario := DataSet.FieldByName('CODIGO').AsInteger;
  vDadosIni.vNivel := DataSet.FieldByName('NIVEL_US').AsInteger;
  vDadosIni.vNomeUsuario := trim(DataSet.FieldByName('USUARIO').AsString);
  vDadosIni.vDpto := trim(DataSet.FieldByName('depart').AsString);
//  vDadosIni.vSenhaUsuario := trim(DataSet.FieldByName('senha').AsString);
  vDadosIni.vAltImp := trim(DataSet.FieldByName('alt_imp').AsString);
  vDadosIni.vImp_Us := trim(DataSet.FieldByName('Imp_us').AsString);
  vDadosIni.vEstoqueNegativo := trim(DataSet.FieldByName('estoq_neg').AsString);
  vDadosIni.vMensagemConsorcio := trim(DataSet.FieldByName('exibir_mensagem_consorcio').AsString);
  vDadosIni.EmailColab := trim(DataSet.FieldByName('email').AsString);
  vDadosIni.vCodPerfilHorasTrab  := DataSet.FieldByName('cod_perfil_horas_trab').AsInteger;
  vDadosIni.vLoginPosHorarioTrab := False;
  vDadosIni.vAvisoFechaExibido   := False;
  vDadosIni.vAvisoFechaHorasTrab := False;
  vDadosIni.vFecharSistema       := False;

  vEmpresa.GetDadosEmpresa;

  Session := Container.GetInstance().GetSessionContext();
  Session.SetEmpresa( vDadosIni.cod_empresa, vDadosIni.vEmp.vnomeEmpresa, vDadosIni.vEmp.vCNPJ );
  Session.SetUsuario( vDadosIni.vCodUsuario, vDadosIni.vNomeUsuario, vDadosIni.EmailColab );
  Session.SetFinanceiro( vDadosIni.vEmp.vFinanceiroUnificado, vDadosIni.vEmp.vCodigoUnificadora );
  DFeDLLAdapter.SetupSession(
    Session.EmpresaId, Session.EmpresaNome, Session.EmpresaCNPJ,
    Session.UsuarioId, Session.UsuarioLogin, Session.UsuarioEmail,
    Session.CaixaUnificado, Session.UnificadoraId
  );
  DFeHwLib.Setup(vDadosIni.vBancoHW, vDadosIni.cod_empresa);

  if vDadosIni.vCodPerfilHorasTrab > 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := ' select codigo, cod_empresa from perfil_horas_trabalho perfil ' +
      ' where perfil.codigo = :codigo ' +
      ' and perfil.cod_empresa = :cod_empresa ' +
      ' and perfil.ativo = 1 ';
    buscas.ParamByName('codigo').AsInteger := vDadosIni.vCodPerfilHorasTrab;
    buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.IsEmpty then
      vDadosIni.vCodPerfilHorasTrab := 0;
  end;

  try
    if Trim(pUsuario) = 'HW' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select col.nome_vendedor, col.token, f.desc_funcao from colaborador col'+
        ' left join funcoes f on f.cod_funcao = col.cod_funcao' +
        ' where cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +
        ' and cod_empresa = ' +vDadosIni.codEmpresa;
      buscas.Open;
      vDadosIni.apiHw.accessTokenJSON := trim(buscas.FieldByName('token').AsString);
      if buscas.IsEmpty then
      begin
        if (vDadosIni.vNomeUsuario) = 'HW' then
          raise exception.create('Usuário HW esta sendo usado. Não foi encontrado um colaborador para o codigo encontrado no login. Codigo: '+
            IntToStr(vDadosIni.vCodUsuario))
        else
          raise exception.create('Colaborador não encontrado com o código associado no cadastro do login. Codigo: '+
            IntToStr(vDadosIni.vCodUsuario))
      end
      else
      begin
        vDadosIni.vNomeFuncionario := trim(buscas.FieldByName('nome_vendedor').AsString);
        if trim(buscas.FieldByName('desc_funcao').AsString) = '' then
        begin
          if (vDadosIni.vNomeUsuario) <> 'HW' then
            raise exception.create('Função do Colaborador não definida ou não encontrada no cadastro')
        end
        else
          vDadosIni.vFuncao := trim(buscas.FieldByName('desc_funcao').AsString);
      end;
    end
    else
    begin
      if dataSet.IsEmpty then
      begin
        if (vDadosIni.vNomeUsuario) = 'HW' then
          raise exception.create('Usuário HW esta sendo usado. Não foi encontrado um colaborador para o codigo encontrado no login. Codigo: '+
            IntToStr(vDadosIni.vCodUsuario))
        else
          raise exception.create('Colaborador não encontrado com o código associado no cadastro do login. Codigo: '+
            IntToStr(vDadosIni.vCodUsuario))
      end
      else
      begin
        vDadosIni.vNomeFuncionario := trim(dataSet.FieldByName('nome_vendedor').AsString);
        if trim(dataSet.FieldByName('desc_funcao').AsString) = '' then
        begin
          if (vDadosIni.vNomeUsuario) <> 'HW' then
            raise exception.create('Função do Colaborador não definida ou não encontrada no cadastro')
        end
        else
          vDadosIni.vFuncao := trim(dataSet.FieldByName('desc_funcao').AsString);
      end;
    end;

  except
    on e : exception do
      Application.MessageBox(pchar(e.Message), 'Atenção', 0+64 );
  end;

  if (vDadosIni.vNomeUsuario) <> 'HW' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select cod_vendedor, token, email from colaborador' +
      ' where cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +
      ' and cod_empresa = ' +vDadosIni.codEmpresa;
    buscas.Open;
    vDadosIni.apiHw.accessTokenJSON := trim(buscas.FieldByName('token').AsString);

    if not buscas.IsEmpty then
      if buscas.FieldByName('cod_vendedor').AsInteger > 0 then
        if Trim(buscas.FieldByName('email').AsString) = ''  then
        begin
          Application.MessageBox('O seu cadastro está incompleto no sistema, favor informar seu email!', 'Atenção', 0 + 64);
          vEmailUsuario := '';
          while True do
          begin
            if not InputQuery('Email do colaborador', 'Informe o seu email', vEmailUsuario) then
              if Application.MessageBox('Deseja sair sem informar o email?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
                Break;

              vRetornoEmailValido := 0;
              if Trim(vEmailUsuario) <> '' then
              begin
                try
                  vDadosIni.abreStatusProcessamento('Validando email', 'Aguarde');
                  try
                    hdValidaEmail := 0;
                    hdValidaEmail := LoadLibrary(Pchar('cons40.dll'));
                    if hdValidaEmail <> 0 then
                    begin
                      @validaEmail := GetProcAddress(hdValidaEmail, PChar('validaEmail'));
                      vRetornoEmailValido := validaEmail(PChar(Trim(LowerCase(vEmailUsuario))), PChar(''));
                    end;
                  finally
                    vDadosIni.fechaStatusProcessamento;
                    if hdValidaEmail <> 0 then
                      FreeLibrary(hdValidaEmail);
                  end;
                except
                end;
                if vRetornoEmailValido = 0 then
                  if Application.MessageBox(PChar('Email: "' + LowerCase(Trim(vEmailUsuario)) + '" inválido ou não pode ser validado. Deseja salvar este email mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
                    vRetornoEmailValido := 1;

                if vRetornoEmailValido = 1 then
                if not EmailDuplicado(LowerCase(Trim(vEmailUsuario))) then
                begin
                  try
                    buscas.Close;
                    buscas.SQL.Text := 'update colaborador set email = ' + QuotedStr(Trim(LowerCase(vEmailUsuario))) +
                      ' where cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario) +
                      ' and cod_empresa = ' +vDadosIni.codEmpresa;
                    buscas.ExecSQL;

                    if buscas.Transaction.InTransaction then
                      buscas.Transaction.Commit;

                    vDadosIni.EmailColab := Trim(LowerCase(vEmailUsuario));
                  except
                    on E: Exception do
                    begin
                      Application.MessageBox(Pchar('Erro ao salvar email no cadastro. Erro: ' + e.Message), 'Atenção', 0 + 64);
                      registraErro('erro ao salvar email. Erro: ' + e.Message);
                    end;
                  end;
                  Break;
                end;
              end;
          end;
        end;
        //else
          //EmailDuplicado;
  end;

  if vDadosIni.vSistema = 'Cxl' then
  begin
    vDadosIni.vCodOpCxl := vDadosIni.vCodUsuario;
    tempData :=
      retornaValor('select first 1 fdx.dia_f_cxl as valor from fecd_cxl fdx where op_cxl = ' +
      IntToStr(vDadosIni.vCodOpCxl) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa + ' order by dia_f_cxl descending');
    try
      vDadosIni.diaFCxl := StrToDate(tempData);
    except
      vDadosIni.diaFCxl := vDadosIni.getDataBanco(buscas) - 1;
    end;
  end
  else
    vDadosIni.vCodOpCxl := 0;

  vDadosIni.hw_registra_estatistica_pc_e_us;

  setSistemasUsuarios;

  SqlOpen('select RDB$SET_CONTEXT(''USER_SESSION'', ''COD_EMPRESA'', ''%s'') from RDB$DATABASE', [Trim(vDadosIni.codEmpresa)]);

  SqlExec('update senhas set data_login_ant = data_login, data_login = ' + vDadosIni.FusoSqlDateTime +
          ' where usuario = %s and cod_empresa = %d', [QuotedStr(Trim(pUsuario)), vDadosIni.cod_empresa]).Transaction.Commit;

  SqlOpen('select RDB$SET_CONTEXT(''USER_SESSION'', ''USERNAME'', ''%s'') from RDB$DATABASE', [Trim(Copy(pUsuario, 1, 32))])
    .Close;
end;

procedure TUsuario.setSistemasUsuarios;
begin
  buscas.Close;


  if SqlScalar('select DADOS_OFFLINE from EMPDESVOLV where COD_EMPDES = 1').AsString = 'C' then
  begin
    buscas.SQL.Text := 'select distinct(erp.nome_aplicativo) from senhas_erp se' +
      ' inner join erp on erp.cod_aplicativo = se.cod_aplicativo' +
      ' where se.cod_aplicativo = 1 and se.usuario = ' + QuotedStr(vDadosIni.vNomeUsuario)
  end
  else
  if vDadosIni.vNomeUsuario = 'HW' then
  begin
    buscas.SQL.Text := 'select distinct(erp.nome_aplicativo) from senhas_erp se' +
      ' inner join erp on erp.cod_aplicativo = se.cod_aplicativo' +
      ' where se.usuario = ' + QuotedStr(vDadosIni.vNomeUsuario)
  end
  else
    buscas.SQL.Text := 'select se.usuario,erp.nome_aplicativo from senhas_erp se' +
      ' inner join erp on erp.cod_aplicativo = se.cod_aplicativo' +
      ' where se.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and se.usuario = ' + QuotedStr(vDadosIni.vNomeUsuario);
  buscas.Open;
  vDadosIni.vSistemasUsuario.vSisAutomacao := false;
  vDadosIni.vSistemasUsuario.vSisCaixaGeral := false;
  vDadosIni.vSistemasUsuario.vSisCaixaAuxiliar := false;
  vDadosIni.vSistemasUsuario.vSisPAFECF := false;
  vDadosIni.vSistemasUsuario.vSisVeiculos := false;
  vDadosIni.vSistemasUsuario.vSisCRM := false;
  vDadosIni.vSistemasUsuario.vSisGestor := false;
  vDadosIni.vSistemasUsuario.vSisSupervisor := false;
  buscas.First;
  while not buscas.Eof do
  begin
    if trim(UpperCase(buscas.FieldByName('nome_aplicativo').AsString)) = 'AUTOMACAO' then
      vDadosIni.vSistemasUsuario.vSisAutomacao := true
    else if trim(UpperCase(buscas.FieldByName('nome_aplicativo').AsString)) = 'CAIXA GERAL' then
      vDadosIni.vSistemasUsuario.vSisCaixaGeral := true
    else if trim(UpperCase(buscas.FieldByName('nome_aplicativo').AsString)) = 'CAIXA AUXILIAR' then
      vDadosIni.vSistemasUsuario.vSisCaixaAuxiliar := true
    else if trim(UpperCase(buscas.FieldByName('nome_aplicativo').AsString)) = 'PAF-ECF' then
      vDadosIni.vSistemasUsuario.vSisPAFECF := true
    else if trim(UpperCase(buscas.FieldByName('nome_aplicativo').AsString)) = 'VEICULOS' then
      vDadosIni.vSistemasUsuario.vSisVeiculos := true
    else if trim(UpperCase(buscas.FieldByName('nome_aplicativo').AsString)) = 'CRM' then
      vDadosIni.vSistemasUsuario.vSisCRM := true
    else if trim(UpperCase(buscas.FieldByName('nome_aplicativo').AsString)) = 'GESTOR' then
      vDadosIni.vSistemasUsuario.vSisGestor := true
    else if trim(UpperCase(buscas.FieldByName('nome_aplicativo').AsString)) = 'SUPERVISOR' then
      vDadosIni.vSistemasUsuario.vSisSupervisor := true;
    buscas.Next;
  end;
  buscas.Close;
end;

function TUsuario.validaSenha(usuario, senha, sistema: string): boolean;
var
  vMultEmpresa: Boolean;
begin
  if Trim(vDadosIni.codEmpresa) = '' then
    vDadosIni.codEmpresa := '0';

  vCodEmpPadrao := 0;
  vCorrigirEmpPadrao := False;
  vMultEmpresa := False;
  Result := False;
  try

    buscas.Close;
    buscas.SQL.Text := 'select * from senhas' +
      ' where usuario = ' + QuotedStr(Trim(usuario)) +
      ' and emp_padrao > 0 and ativo = 1';
    buscas.Open;
    if (not buscas.IsEmpty) then
    begin

      buscas.FetchAll;
      vMultEmpresa := buscas.RecordCount > 1;

      if vMultEmpresa then
        vCodEmpPadrao := buscas.FieldByName('emp_padrao').AsInteger
      else
        vCodEmpPadrao := buscas.FieldByName('cod_empresa').AsInteger;

      buscas.Close;
      buscas.SQL.Text := 'select * from senhas' +
        ' where usuario = ' + QuotedStr(Trim(usuario)) +
        ' and cod_empresa = :cod_empresa' +
        ' and senha = ' + QuotedStr(vDadosIni.codifica(senha));
      buscas.ParamByName('cod_empresa').AsInteger := vCodEmpPadrao;
      buscas.Open;

      if buscas.IsEmpty then
        Exit;

      vDadosIni.vSenhaUsuario := vDadosIni.codifica(Trim(senha));

      if (vMultEmpresa) then
        vEmpresa.getTodos(usuario)
      else
        vEmpresa.selecionaEmpresa(buscas.FieldByName('COD_EMPRESA').AsString);

      try
        vEmpresa.dataSet.Filter := ' cod_empresa = ' + vDadosIni.codEmpresa;
        vEmpresa.dataSet.Filtered := True;

        if vEmpresa.dataSet.FieldByName('cod_empresa').AsInteger > 0 then
          setEmpresaSelecionada(Trim(usuario))
        else
        begin
          Application.MessageBox(pchar('Usuário não tem acesso a empresa: ' + vDadosIni.codEmpresa),
            'Atenção', 0 + 64);
          Exit;
        end;
      finally
        vEmpresa.dataSet.Filtered := False;
        vEmpresa.dataSet.Filter := '';
      end;
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select first 1 * from senhas' +
        ' where usuario = ' + QuotedStr(Trim(usuario)) +
        ' and senha = ' + QuotedStr(vDadosIni.codifica(senha)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1';
      buscas.Open;

      if buscas.IsEmpty then
        Exit;

      vDadosIni.vSenhaUsuario := vDadosIni.codifica(senha);


      vEmpresa.selecionaEmpresa(IntToStr(buscas.FieldByName('cod_empresa').AsInteger));

      try
        vEmpresa.dataSet.Filter := ' cod_empresa = ' + vDadosIni.codEmpresa;
        vEmpresa.dataSet.Filtered := True;

        if vEmpresa.dataSet.FieldByName('cod_empresa').AsInteger > 0 then
          setEmpresaSelecionada(Trim(usuario))
        else
        begin
          Application.MessageBox(pchar('Usuário não tem acesso a empresa: ' + vDadosIni.codEmpresa),
            'Atenção', 0 + 64);
          Exit;
        end;
      finally
        vEmpresa.dataSet.Filtered := False;
        vEmpresa.dataSet.Filter := '';
      end;
    end;
//var
//  tempData: string;
//begin
//  Result := False;
//  Result := true;
//  try
//    montaSelect('select s.codigo, s.depart, s.usuario, s.senha, s.cod_empresa, s.nivel_us,' +
//      ' s.ALT_IMP, s.IMP_US, s.estoq_neg, e.nome_emp, e.CGC_EMP' +
//      ' from SENHAS S' +
//      ' inner join empresa e on e.cod_empresa = s.cod_empresa' +
//      ' where S.USUARIO = ' + QuotedStr(trim(usuario)) + ' and S.SENHA = ' +
//      QuotedStr(vDadosIni.codifica(senha)) + ' and S.ativo = 1');
//    if DataSet.IsEmpty then
//    begin
//      result := false;
//      Exit
//    end;
//
//    vDadosIni.vCodUsuario := DataSet.FieldByName('CODIGO').AsInteger;
//    vDadosIni.vNivel := DataSet.FieldByName('NIVEL_US').AsInteger;
//    vDadosIni.vNomeUsuario := trim(DataSet.FieldByName('USUARIO').AsString);
//    vDadosIni.vDpto := trim(DataSet.FieldByName('depart').AsString);
//    vDadosIni.vSenhaUsuario := trim(DataSet.FieldByName('senha').AsString);
//    vDadosIni.vAltImp := trim(DataSet.FieldByName('alt_imp').AsString);
//    vDadosIni.vImp_Us := trim(DataSet.FieldByName('Imp_us').AsString);
//    vDadosIni.vEstoqueNegativo := trim(DataSet.FieldByName('estoq_neg').AsString);
//    
//    if Trim(DataSet.FieldByName('USUARIO').AsString) = 'HW' then
//      vEmpresa.getTodos
//    else
//    begin
//      vEmpresa.selecionaEmpresa(DataSet.FieldByName('COD_EMPRESA').AsString);
//      setEmpresaSelecionada(usuario);
//    end;

    vDadosIni.vSistema := sistema;

    if (usuario <> 'HW') then
    begin
      if (sistema = 'Cxl') and (vDadosIni.vDpto <> 'CAIXA') then
      begin
        Application.MessageBox(pchar('Usuário não é caixa! Não pode acessar este módulo do Sistema'),
          'Atenção', 0 + 64);
        Exit;
      end
      else if (sistema = 'Caixa') and (vDadosIni.vDpto <> 'CAIXA') then
      begin
        Application.MessageBox(pchar('Usuário não é caixa! Não pode acessar este módulo do Sistema'),
          'Atenção', 0 + 64);
        Exit;
      end;
    end;

    Result := True;
     
  except
    on e : exception do
    begin
      result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0+64 );
    end;
  end;
end;

function TUsuario.verificarHorarioTrabalho(pUsuario: string): Boolean;
var
	vDiaSemana: string;
begin
	try
    Result := True;

    if vDadosIni.vCodPerfilHorasTrab <= 0 then
    	Exit;

    buscas.Close;
    buscas.SQL.Text := ' select codigo, cod_empresa from perfil_horas_trabalho perfil ' +
    	' where perfil.codigo = :codigo ' +
      ' and perfil.cod_empresa = :cod_empresa ' +
      ' and perfil.ativo = 1 ';
    buscas.ParamByName('codigo').AsInteger := vDadosIni.vCodPerfilHorasTrab;
    buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.IsEmpty then
    	Exit;

    buscas.Close;
    buscas.SQL.Text := ' select extract(weekday from current_date) dia_semana, ' +
      ' (dia.hora_ini || '':'' || dia.minuto_ini || '':00'') hora_ini, ' +
      ' (dia.hora_fim || '':'' || dia.minuto_fim || '':59'') hora_fim, ' +
      ' current_time as hora_atual, ' +
      ' perfil.ativo from perfil_horas_trabalho perfil  ' +
      ' inner join perfil_horas_trabalho_dia dia on ' +
      '		dia.codigo = perfil.codigo ' +
      '		and dia.cod_empresa = perfil.cod_empresa ' +
      ' 	and dia.dia_semana = extract(weekday from current_date) ' +
      ' where perfil.codigo = :codigo ' +
      ' and perfil.cod_empresa = :cod_empresa ';
    buscas.ParamByName('codigo').AsInteger := vDadosIni.vCodPerfilHorasTrab;
    buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.IsEmpty then
    begin
      Result := False;

      buscas.Close;
      buscas.SQL.Text := ' select extract(weekday from current_date) dia_semana from rdb$database ';
      buscas.Open;

      if buscas.FieldByName('dia_semana').AsInteger = 0 then
        vDiaSemana := 'Domingo'
      else if buscas.FieldByName('dia_semana').AsInteger = 1 then
        vDiaSemana := 'Segunda-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 2 then
        vDiaSemana := 'Terça-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 3 then
        vDiaSemana := 'Quarta-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 4 then
        vDiaSemana := 'Quinta-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 5 then
        vDiaSemana := 'Sexta-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 6 then
        vDiaSemana := 'Sábado';

      Application.MessageBox(pchar('Usuário sem permissão para acessar o sistema neste dia: ' + #13 + #13 +
        'HORÁRIO DE TRABALHO' + #13 +
        'Dia Semana: ' + trim(vDiaSemana) + #13 + #13 +
        'Favor verificar antes de continuar.'), 'Atenção', MB_ICONWARNING + MB_OK);

      vDadosIni.vInibeMensPesqPros := 'S';
      if vDadosIni.PesqPros('CFG058', 'LIBERAR', '', 'SENHAS', trim(pUsuario), buscas, False) then
      begin
      	vDadosIni.vLoginPosHorarioTrab := True;
        Result := True;
      end;

      Exit;
    end;

    if buscas.FieldByName('ativo').AsInteger <> 1 then
      Exit;

    if buscas.FieldByName('hora_ini').IsNull then
      Exit;

    if buscas.FieldByName('hora_fim').IsNull then
      Exit;

    if (vDadosIni.apenasNumeros(trim(buscas.FieldByName('hora_atual').AsString)) >= vDadosIni.apenasNumeros(trim(buscas.FieldByName('hora_ini').AsString)))
      and (vDadosIni.apenasNumeros(trim(buscas.FieldByName('hora_atual').AsString)) <= vDadosIni.apenasNumeros(trim(buscas.FieldByName('hora_fim').AsString))) then
    begin
      Result := True;
    end
    else
    begin
      Result := False;

      if buscas.FieldByName('dia_semana').AsInteger = 0 then
        vDiaSemana := 'Domingo'
      else if buscas.FieldByName('dia_semana').AsInteger = 1 then
        vDiaSemana := 'Segunda-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 2 then
        vDiaSemana := 'Terça-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 3 then
        vDiaSemana := 'Quarta-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 4 then
        vDiaSemana := 'Quinta-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 5 then
        vDiaSemana := 'Sexta-Feira'
      else if buscas.FieldByName('dia_semana').AsInteger = 6 then
        vDiaSemana := 'Sábado';

      Application.MessageBox(pchar('Usuário sem permissão para acessar o sistema neste horário: ' + #13 + #13 +
        'HORÁRIO DE TRABALHO' + #13 +
        'Dia Semana: ' + trim(vDiaSemana) + #13 +
        'Inicial: ' + Copy(trim(buscas.FieldByName('hora_ini').AsString), 1, 5) + #13 +
        'Final: ' + Copy(trim(buscas.FieldByName('hora_fim').AsString), 1, 5) + #13 + #13 +
        'Favor verificar antes de continuar.'), 'Atenção', MB_ICONWARNING + MB_OK);

      vDadosIni.vInibeMensPesqPros := 'S';
      if vDadosIni.PesqPros('CFG058', 'LIBERAR', '', 'SENHAS', trim(pUsuario), buscas, False) then
      begin
      	vDadosIni.vLoginPosHorarioTrab := True;
        Result := True;
      end;

      Exit;
    end;
  except
    on e : exception do
    begin
      result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0+64 );
    end;
  end;
end;

function TUsuario.validaSenha(usuario, senha: string): Boolean;
var
  vMultEmpresa,vOK: Boolean;
begin
  vCodEmpPadrao := 0;
  vCorrigirEmpPadrao := False;
  vMultEmpresa := False;
  Result := False;
  try

    if vDadosIni.vModoTreino = 'S' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select BASETREINO from EMPDESVOLV' +
        ' where COD_EMPDES = 1';
      try
        buscas.Open;
        vOK := buscas.FieldByName('BASETREINO').AsString = 'S';
      except
        vOK := False;
      end;
      if not vOK then
      begin
        Result := false;
        Application.MessageBox('Banco de dados de Treinamento não configurado corretamente. Deve ser informado como banco de treino nos dados do Desenvolvedor', 'Atenção', 0 + 64);
        Exit;
      end
      else
      begin
        buscas.Close;
        buscas.SQL.Text := 'update empresa set NFE_LOGPATH = ''C:\Treinamento\Hw\NFe'', WEBSERV_AMBIENTE=''Homologação'' ';
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.Text := 'update COBREBEM set ENDERECOREMESSARETORNO = ''C:\Treinamento\Hw\Remessa\''';
        buscas.ExecSQL;

        if buscas.Transaction.InTransaction then
          buscas.Transaction.Commit;
      end;
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select BASETREINO from EMPDESVOLV' +
        ' where COD_EMPDES = 1';
      vOK := False;
      try
        buscas.Open;
        vOK := buscas.FieldByName('BASETREINO').AsString = 'S';
      except
      end;
      if vOK then
        raiseExceptionCreate('Banco de dados disponível apenas no modo de Treinamento', '');
    end;

    buscas.Close;
    buscas.SQL.Text := 'select * from senhas' +
      ' where usuario = ' + QuotedStr(Trim(usuario)) +
      ' and emp_padrao > 0 and ativo = 1';
    buscas.Open;
    if (not buscas.IsEmpty) then
    begin

      buscas.FetchAll;
      vMultEmpresa := buscas.RecordCount > 1;

      if vMultEmpresa then
        vCodEmpPadrao := buscas.FieldByName('emp_padrao').AsInteger
      else
        vCodEmpPadrao := buscas.FieldByName('cod_empresa').AsInteger;

      buscas.Close;
      buscas.SQL.Text := 'select * from senhas' +
        ' where usuario = ' + QuotedStr(Trim(usuario)) +
        ' and cod_empresa = :cod_empresa' +
        ' and ativo = 1';
      if vDadosIni.vModoTreino <> 'S' then
        buscas.SQL.Text := buscas.SQL.Text +
        ' and senha = ' + QuotedStr(vDadosIni.codifica(senha));
      buscas.ParamByName('cod_empresa').AsInteger := vCodEmpPadrao;
      buscas.Open;

      if buscas.IsEmpty then
        Exit;

      vDadosIni.vSenhaUsuario := vDadosIni.codifica(Trim(senha));

      if (vMultEmpresa) or (Trim(usuario) = 'HW') then
      begin
        if Trim(usuario) = 'HW' then
          vEmpresa.getTodos
        else
          vEmpresa.getTodos(usuario);
      end
      else
        vEmpresa.selecionaEmpresa(buscas.FieldByName('COD_EMPRESA').AsString);
      Result := True;
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select first 1 * from senhas' +
        ' where usuario = ' + QuotedStr(Trim(usuario)) +
        ' and ativo = 1';
      if vDadosIni.vModoTreino <> 'S' then
        buscas.SQL.Text := buscas.SQL.Text +
        ' and senha = ' + QuotedStr(vDadosIni.codifica(senha));
      buscas.Open;

      if buscas.IsEmpty then
        Exit;

      vDadosIni.vSenhaUsuario := vDadosIni.codifica(senha);
      
      if Trim(usuario) = 'HW' then
        vEmpresa.getTodos
      else
        vEmpresa.selecionaEmpresa(buscas.FieldByName('COD_EMPRESA').AsString);
      vCodEmpPadrao := buscas.FieldByName('cod_empresa').AsInteger;
      
      Result := True;
    end;
    Exit;

    if Trim(usuario) = 'HW' then
      montaSelect('select '' '' nome_vendedor, s.codigo, s.depart, '' '' desc_funcao, ' +
      ' s.usuario, s.senha, s.cod_empresa, s.nivel_us,' +
      ' s.ALT_IMP, s.IMP_US, s.estoq_neg, e.nome_emp, e.CGC_EMP, ' +
      ' s.exibir_mensagem_consorcio, s.cod_perfil_horas_trab, '' '' email ' +
      ' from SENHAS S' +
      ' inner join empresa e on e.cod_empresa = s.cod_empresa' +
      ' where S.USUARIO = ' + QuotedStr(trim(usuario)) + ' and S.SENHA = ' +
      QuotedStr(vDadosIni.codifica(senha)) + ' and S.ativo = 1')
    else
      montaSelect(' select col.nome_vendedor, s.codigo, dep.nome_depto depart, f.desc_funcao, ' +
      ' s.usuario, s.senha, s.cod_empresa, s.nivel_us, ' +
      ' s.ALT_IMP, s.IMP_US, s.estoq_neg, e.nome_emp, e.CGC_EMP, ' +
      ' s.exibir_mensagem_consorcio, s.cod_perfil_horas_trab, col.email' +
      ' from SENHAS S ' +
      ' inner join empresa e on e.cod_empresa = s.cod_empresa ' +
      ' inner join colaborador col on col.cod_vendedor = s.codigo and col.cod_empresa = s.cod_empresa ' +
      ' left join funcoes f on f.cod_funcao = col.cod_funcao ' +
      ' left join depto dep on dep.cod_depto = f.cod_depto ' +
      ' where S.USUARIO = ' + QuotedStr(trim(usuario)) +
      ' and S.cod_empresa = ' + vDadosIni.codEmpresa + ' and S.ativo = 1');

    if DataSet.IsEmpty then
    begin
      result := false;
      Exit
    end;

    vDadosIni.vCodUsuario := DataSet.FieldByName('CODIGO').AsInteger;
    vDadosIni.vNivel := DataSet.FieldByName('NIVEL_US').AsInteger;
    vDadosIni.vNomeUsuario := trim(DataSet.FieldByName('USUARIO').AsString);
    vDadosIni.vDpto := trim(DataSet.FieldByName('depart').AsString);
    vDadosIni.vSenhaUsuario := trim(DataSet.FieldByName('senha').AsString);
    vDadosIni.vAltImp := trim(DataSet.FieldByName('alt_imp').AsString);
    vDadosIni.vImp_Us := trim(DataSet.FieldByName('Imp_us').AsString);
    vDadosIni.vEstoqueNegativo := trim(DataSet.FieldByName('estoq_neg').AsString);
    vDadosIni.vMensagemConsorcio := trim(DataSet.FieldByName('exibir_mensagem_consorcio').AsString);
    vDadosIni.EmailColab := trim(DataSet.FieldByName('email').AsString);
    vDadosIni.vCodPerfilHorasTrab  := DataSet.FieldByName('cod_perfil_horas_trab').AsInteger;
    vDadosIni.vLoginPosHorarioTrab := False;
    vDadosIni.vAvisoFechaExibido   := False;
  	vDadosIni.vAvisoFechaHorasTrab := False;
    vDadosIni.vFecharSistema       := False;
    
    if vDadosIni.vCodPerfilHorasTrab > 0 then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select codigo, cod_empresa from perfil_horas_trabalho perfil ' +
        ' where perfil.codigo = :codigo ' +
        ' and perfil.cod_empresa = :cod_empresa ' +
        ' and perfil.ativo = 1 ';
      buscas.ParamByName('codigo').AsInteger := vDadosIni.vCodPerfilHorasTrab;
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;

      if buscas.IsEmpty then
        vDadosIni.vCodPerfilHorasTrab := 0;
    end;

    if Trim(DataSet.FieldByName('USUARIO').AsString) = 'HW' then
      vEmpresa.getTodos
    else
    begin
      vEmpresa.selecionaEmpresa(DataSet.FieldByName('COD_EMPRESA').AsString);
      setEmpresaSelecionada(usuario);
    end;

  except
    on e : exception do
    begin
      result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0+64 );
    end;
  end;
end;

{ TEmpresa }

constructor TEmpresa.Create;
begin
  DataSet := TClientDataSet(dtmEnt.cdsEmpresa);
  Buscas := TIBQuery(dtmEnt.qrBuscas);
end;

function TEmpresa.getCNPJ: string;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cgc_emp from empresa where cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
  buscas.Open;
  Result := buscas.FieldByName('cgc_emp').AsString;
  buscas.Close;
end;

function TEmpresa.GetDadosEmpresa: boolean;
begin
  vDadosIni.atualizarVariaveisEmpresa(buscas);
end;

function TEmpresa.getTodos(pUsuario: string): boolean;
begin
  if Trim(pUsuario) = 'HW' then
    Result := getTodos
  else
    Result := montaSelect('select e.cod_empresa,(e.cod_empresa||'' - ''||e.identificacao_emp||'' - ''||e.cgc_emp) as nome_emp from empresa e' +
      ' inner join senhas s on s.cod_empresa = e.cod_empresa' +
      ' where s.usuario = ' + QuotedStr(pUsuario) + ' and s.ativo = 1 order by 1');
end;

function TEmpresa.getTodos: boolean;
begin
  Result := montaSelect('select cod_empresa,(cod_empresa||'' - ''||identificacao_emp||'' - ''||cgc_emp) as nome_emp from empresa order by 1');
end;

function TEmpresa.selecionaEmpresa(codigo: string): boolean;
begin
  result := montaSelect('select cod_empresa,(cod_empresa||'' - ''||identificacao_emp||'' - ''||cgc_emp) as nome_emp from empresa where cod_empresa  = ' + codigo);
end;

procedure TEmpresa.setAmbienteHomologacao;
var
  vWEBSERV_AMBIENTE: string;
begin
  buscas.Close;
  buscas.SQL.Text := 'select webserv_ambiente from empresa where cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  vWEBSERV_AMBIENTE := Trim(buscas.FieldByName('webserv_ambiente').AsString);
  if Trim(vWEBSERV_AMBIENTE) <> 'Homologação' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'update empresa set webserv_ambiente =  ''Homologação'' where cod_empresa = ' + vDadosIni.codEmpresa;
    try
      buscas.ExecSQL;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    except on E: Exception do
      begin
        Application.MessageBox('Cuidado! Modo Treinamento ativado e o ambiente da NF-e não é "Homologação"', 'Atenção', 0 + 64);
      end;
    end;
  end;
  buscas.Close;
end;

{ TEmDesenvolvedora }

function TEmDesenvolvedora.abreEmpresa: boolean;
begin
  Result := montaSelect('select * from EMPDESVOLV');
  if not dataSet.IsEmpty then
  begin
    vDadosIni.vEmpDesNomeEmp := dataSet.FieldByName('NOME_EMPDES').AsString;
    vDadosIni.vEmpDesFone := dataSet.FieldByName('FONE_EMPDES').AsString;
    vDadosIni.vEmpDesSite := dataSet.FieldByName('SITE').AsString;
  end;
  dataSet.Close;
end;

constructor TEmDesenvolvedora.Create;
begin
  DataSet := TClientDataSet(dtmEnt.cdsEmpDes);
  Buscas := TIBQuery(dtmEnt.qrBuscas);
end;

end.

