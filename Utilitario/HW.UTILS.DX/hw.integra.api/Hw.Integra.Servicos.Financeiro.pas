unit Hw.Integra.Servicos.Financeiro;

interface

uses
  Hw.Integra.Api.CreditoBoleto,
  Hw.Integra.Api.NotificacaoContasEmAberto,
  Hw.Integra.Servicos,
  HW.Servicos;

const
  HW_SERV_FIN_CONS_DIARIA = 'financeiro_service_consulta_diaria';
  HW_SERV_FIN_NOTIFICACAO = 'financeiro_service_notificacao_contas';
  HW_SERV_FIN_CREDAVISOS  = 'financeiro_service_creditos_aviso';

type

  THwIntegraServicosFinanceiro = class(THwIntegraServicos)
  private
    procedure Consultar(dadosConsulta: THwServicosJSON); override; //aqui usa a api
  public
    function FinanceiroService_NotificacaoContas(email: string): Boolean;
    function FinanceiroService_Consultar(DadosConsulta: THwServicosJSON): TNotificacaoContasEmAberto; //aqui usa a api
    procedure FinanceiroService_ConsultaDiaria;
    procedure FinanceiroService_QtdeDocumentosVencidos(email: string; usuarioFinanceiro: Boolean; var dadosnotificacao: string; Empresas: TArray<Integer>);
    procedure FinanceiroService_ShowCreditosEmAberto(empresas: TArray<Integer>; usuarioId: Integer);
    procedure FinanceiroService_Cadastrar_Contas_Como_APagar(credito: TCreditoBoleto; usuarioId: Integer);
  end;

implementation

uses
  REST.Json,
  HW.Utils.Classes.Registros_DX,
  Hw.Integra.Api.Rest,
  Hw.Integra.Api.FinanceiroService,
  config_sistema_class,
  contas_a_pagar_class,
  hw_utils,
  hw_win_utils,
  System.SysUtils,
  System.Math,
  Vcl.Forms,
  Hw.Integra.Api.Form.Creditos,
  Hw.Integra.Api.ContatoCliente,
  Hw.Integra.Credito.Aviso,
  System.Classes;

{ THwIntegraServicosFinanceiro }

procedure THwIntegraServicosFinanceiro.Consultar(
  dadosConsulta: THwServicosJSON);
begin
  inherited;
  raise Exception.Create('Não usar pois nao foi implementado');
end;

procedure THwIntegraServicosFinanceiro.FinanceiroService_Cadastrar_Contas_Como_APagar(credito: TCreditoBoleto; usuarioId: Integer);
var
  conta: TContas_a_pagar_class;
  empresaId, unificadora, empf, hwclienteid, nnota: Integer;
  nconta: Double;
  nome, razao: string;
begin
  try
    with SqlOpen('select e.cod_empresa, e.codigo_unificadora, coalesce(ef.cod_empresa, e.cod_empresa) empf, cl.ncon_s_crd' +
                 ' from empresa e' +
                 ' left join empresa_fisica ef on ef.cod_empresa > 0' +
                 ' left join cont_lig cl on cl.cod_emp = e.cod_empresa' +
                 ' where e.cgc_emp = %s', [credito.Cnpj.QuotedString]) do
    begin
      empresaId   := FieldByName('cod_empresa').AsInteger;
      unificadora := FieldByName('codigo_unificadora').AsInteger;
      empf        := FieldByName('empf').AsInteger;
      nconta      := FieldByName('ncon_s_crd').AsFloat;
      if unificadora = 0 then unificadora := empresaId;
    end;

    if SqlOpen('select cta.hwcredid from contas_a_pagar cta where cta.hwcredid = %d and cta.cod_emp_mult = %d',
               [credito.CreditoId, empresaId]).FieldByName('hwcredid').AsInteger = credito.CreditoId then
    begin
      if not SilentMod then
        ShowAtencao('Essa conta já foi cadastrada anteriormente');
      Exit;
    end;

    with SqlOpen('select cod_cliente, nome_cliente, razao from clientes where cpfcgc = ''03530705000109'' and cod_empresa = %d', [empresaId]) do
    begin
      hwclienteid := FieldByName('cod_cliente').AsInteger;
      nome        := FieldByName('nome_cliente').AsString;
      razao       := FieldByName('razao').AsString;
    end;

    if (hwclienteid = 0) and (empresaId <> empf) then
    begin
      if not SilentMod then
        ShowErro('Conta não pode ser cadastrada. O cadastro da Hw Sistemas no Sistema não foi encontrado na empresa %s', [credito.Cnpj]);
      Exit;
    end;

    with SqlOpen('select first 1 n_conta_plc from contas_a_pagar where cod_forn_nfe = %d and cod_emp_mult = %d order by data_ent_ctp desc', [hwclienteid, empresaId]) do
      if FieldByName('n_conta_plc').AsFloat > 0 then
        nconta := FieldByName('n_conta_plc').AsFloat;

    conta := TContas_a_pagar_class.Create;
    conta.beginChanges;
    conta.hwcredid := credito.CreditoId;
    conta.codigo_emp := unificadora;
    conta.cod_emp_mult := empresaId;
    //conta.num_nota_nfe := credito.CreditoId;
    conta.cod_forn_nfe := hwclienteid;
    conta.codigo_ctrl := 1;
    conta.n_conta_plc := nconta;
    conta.nome_for_ctp := nome;
    conta.data_ent_ctp := Date;
    conta.dtreferencia := Date;
    conta.n_doc_ctp := credito.NumeroDocumento;
    conta.valor_ctp := credito.Valor;
    conta.vl_contabil := credito.Valor;
    conta.valor_ctp_orig := credito.Valor;
    conta.data_venc_ctp := credito.DataVencimento;
    conta.natl_ctp := 'C';
    conta.tipo_ctp := 'D';
    conta.aceite_ctp := 'S';
    conta.entra_previsao := 'S';
    conta.us_cad := usuarioId;
    conta.nparcela := credito.ParcelaSeq;
    conta.qtde_parc := credito.ParcelaQtd;
    conta.historico_ctp := 'CONTRATO HW SISTEMAS';
    if TryStrToInt(credito.NumeroDocumento.Trim, nnota) then
      conta.num_nota_nfe := nnota;

    with SqlExec(conta.SQLMotor('cod_contrp').SQLInsertAutoInc) do
      if Transaction.InTransaction then
        Transaction.Commit;

    if not SilentMod then
      ShowAtencao('Conta a Pagar cadastrada com Sucesso');

  except on E: Exception do
    begin
      LogError('THwIntegraServicos.FinanceiroService_Cadastrar_Contas_Como_APagar %s', [e.Message]);
      ShowErro('Erro ao cadastrar Contas a Pagar' + sLineBreak + e.Message);
    end;
  end;
end;

procedure THwIntegraServicosFinanceiro.FinanceiroService_ConsultaDiaria;
var
  DadosConsulta: THwServicosJSON;
  MomentoDeConsulta: Boolean;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try
    if (not GetDadosApi) then// obtem hora do servidor no metodo GetCNPJ
      Exit;

    {$REGION 'Verificar se é o momento da consulta'}

    DadosConsulta := THwClassRegistros.FromJsonString<THwServicosJSON>(GetJson(HW_SERV_FIN_CONS_DIARIA));
    if DadosConsulta = nil then
    begin
      DadosConsulta := THwServicosJSON.Create;
      DadosConsulta.Status := HW_STS_CONSULTANDO;
      DadosConsulta.Servico := HW_SERV_FIN_CONS_DIARIA;
      DadosConsulta.DataConsulta := DataHoraAtual;

      SaveJSON(DadosConsulta.Servico, TJson.ObjectToJsonString(DadosConsulta));//.ToJsonStringEncode);

      DadosConsulta.DataConsulta := DataHoraAtual - 2;
    end;
    DadosConsulta.Servico := HW_SERV_FIN_CONS_DIARIA;

    {$ENDREGION}

    try
      MomentoDeConsulta := ((DataHoraAtual - DadosConsulta.DataConsulta) >= 1) or // maior que 1 dia consultar
                           (((DataHoraAtual - DadosConsulta.DataConsulta) > EncodeTime(0,30,0,0)) and (DadosConsulta.Status.Equals(HW_STS_CONSULTANDO))); // no intervalo de 30 minutos 1 maquina consultou e nao concluiu a consulta

      if not MomentoDeConsulta then
        Exit;

      FinanceiroService_Consultar(DadosConsulta);
    finally
      DadosConsulta.Free;
    end;

  finally
    desconectar;
  end;
end;

function THwIntegraServicosFinanceiro.FinanceiroService_Consultar(DadosConsulta: THwServicosJSON): TNotificacaoContasEmAberto;
var
  FinanceiroService: TFinanceiroService;
  UpdateToken: Boolean;
begin
  Result := nil;
  try

    if not GetCNPJ then
      raise Exception.Create('CNPJ não localizado para empresa ' + IntToStr(CodEmpresa));

    DadosConsulta.DataConsulta := DataHoraAtual;

    FinanceiroService := TFinanceiroService.Create(UrlApi, FCnpj);
    try
      FinanceiroService.OnLog   := Self.OnLog;
      FinanceiroService.Token   := THwClassRegistros.FromJsonString<TIntegraTokenApi>(GetJson(HW_SERV_TOKEN_API));

      Result := FinanceiroService.NotificacaoContasEmAberto;

      if not FinanceiroService.LastError.Msg.IsEmpty then
      begin
        DadosConsulta.Status := HW_STS_ERROR_API;
        if not SilentMod then
          ShowErro(FinanceiroService.LastError.Msg + sLineBreak + FinanceiroService.LastError.Exception);
        SaveJSON(HW_SERV_FIN_NOTIFICACAO, '');
      end
      else
      begin
        DadosConsulta.Status := HW_STS_CONCLUIDA;
        if Result <> nil then
          SaveJSON(HW_SERV_FIN_NOTIFICACAO, TJson.ObjectToJsonString(Result))
        else
          SaveJSON(HW_SERV_FIN_NOTIFICACAO, EmptyStr);
      end;

      if FinanceiroService.Token <> nil then
      begin
        if not Assigned(FToken) then
          UpdateToken := True
        else if FToken.accessToken <> FinanceiroService.Token.accessToken then
          UpdateToken := True
        else
          UpdateToken := False;

        if UpdateToken then
        begin
          FToken := FinanceiroService.Token;
          SaveJSON(HW_SERV_TOKEN_API, TJson.ObjectToJsonString(FToken, [joDateIsUTC, joDateFormatISO8601, joIgnoreEmptyStrings, joIgnoreEmptyArrays]));
        end;
      end;

      SaveJSON(DadosConsulta.Servico, TJson.ObjectToJsonString(DadosConsulta));//.ToJsonStringEncode);

    finally
      FinanceiroService.Free;
    end;

  except on E: Exception do
    begin
      DadosConsulta.Status := HW_STS_ERROR;
      SaveJSON(DadosConsulta.Servico, TJson.ObjectToJsonString(DadosConsulta));//.ToJsonStringEncode);
      SaveJSON(HW_SERV_FIN_NOTIFICACAO, '');

      LogError('THwIntegraServicos.FinanceiroService_Consultar %s', [e.Message]);
      if not SilentMod then
        ShowErro('Erro ao consultar' + sLineBreak + e.Message);
    end;
  end;
end;

function THwIntegraServicosFinanceiro.FinanceiroService_NotificacaoContas(email: string): Boolean;
var
  contato: TContatoCliente;
  notificacao: TNotificacaoContasEmAberto;
begin
  Result := False;

  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      notificacao := THwClassRegistros.FromJsonString<TNotificacaoContasEmAberto>(GetJson(HW_SERV_FIN_NOTIFICACAO));

      for contato in notificacao.Contatos do
        if contato.email.ToLower().Contains(email.ToLower.Trim) then
        begin
          Result := True;
          Exit;
        end;

    except
    end;
  finally
    desconectar;
  end;

end;

procedure THwIntegraServicosFinanceiro.FinanceiroService_QtdeDocumentosVencidos(
  email: string; usuarioFinanceiro: Boolean;
  var dadosnotificacao: string;
  Empresas: TArray<Integer>);
var
  Creditos: TArray<TCreditoBoleto>;
  notificacao: TNotificacaoContasEmAberto;
  E, I, J, vencidos, abertos, hoje: Integer;
  conf: TConfig_sistema_class;
  Continuar: Boolean;
  recorrencia: Integer;
  warning: Boolean;
  contaAtual: TCreditoBoleto;
  mensagem, serialHd, str: string;
  avisos, avisosgeral: TArray<TCreditoAviso>;
  avisado, registrado, changesAviso: Boolean;
  empRescue: Integer;
  emails: TStrings;

  procedure VerificaConta(conta: TCreditoBoleto);
  begin
    if contaAtual = nil then
      contaAtual := conta
    else if conta.DataVencimento < contaAtual.DataVencimento then
      contaAtual := conta;
  end;

begin
  if not conectar(DataBasePath, True)  then
    Exit;

  vencidos := 0;
  abertos := 0;
  hoje := 0;
  dadosnotificacao := '';
  changesAviso := False;

  try

    try
    
      {$REGION 'logica para saber se vai notificar o usuario com base nos dados da empresa/unificadora'}
      notificacao := THwClassRegistros.FromJsonString<TNotificacaoContasEmAberto>(GetJson(HW_SERV_FIN_NOTIFICACAO));

      if notificacao = nil then
        Exit;

      if notificacao.Contas = nil then
        Exit;

      if (not notificacao.NotificacaoPorContatoCobranca) and (not notificacao.NotificacaoPorAcessoModuloFinanceiroERP) then
        Exit;

      Continuar := (notificacao.NotificacaoPorAcessoModuloFinanceiroERP) and (usuarioFinanceiro);
      if (not Continuar) and (notificacao.NotificacaoPorContatoCobranca) then
        for I := Low(notificacao.Contatos) to High(notificacao.Contatos) do
        begin
          emails := NewStringList(True, StrReplace(notificacao.Contatos[I].email, [';', ' ', '|'], ',').Trim.ToLower, ',');
          Continuar := emails.IndexOf(email.Trim.ToLower) >= 0;
          if Continuar then
            Break;
        end;

      if not Continuar then
        Exit;      
      {$ENDREGION}

      serialHd := GetSerialHd;
      contaAtual := nil;
        
      empRescue := CodEmpresa;
      for E := Low(Empresas) to High(Empresas) do
      begin
        CodEmpresa := Empresas[E];
        
        notificacao := THwClassRegistros.FromJsonString<TNotificacaoContasEmAberto>(GetJson(HW_SERV_FIN_NOTIFICACAO));
                               
        avisos := THwClassRegistros.FromJsonToArray<TCreditoAviso>(GetJson(HW_SERV_FIN_CREDAVISOS));
        SetLength(avisosgeral, Length(avisosgeral) + Length(avisos));
        for I := Low(avisos) to High(avisos) do
          avisosgeral[I] := avisos[I];       
        
        if Assigned(notificacao.Contas) then
        begin
          for I := Low(notificacao.Contas) to High(notificacao.Contas) do
            if notificacao.Contas[I].DataVencimento = Date then
            begin
              hoje := hoje + 1;
              VerificaConta(notificacao.Contas[I]);
            end
            else if (notificacao.Contas[I].DataVencimento <= notificacao.DiaFechado) then
            begin
              if ((notificacao.Contas[I].DataVencimento + notificacao.DiasAviso.EmAtraso) <= Date) then
              begin
                vencidos := vencidos + 1;
                VerificaConta(notificacao.Contas[I]);
                warning := True;
              end;
            end
            else if (notificacao.Contas[I].DataVencimento <= (Date + notificacao.DiasAviso.AVencer)) then
            begin
              avisado := False;
              registrado := False;
              for J := Low(avisosgeral) to High(avisosgeral) do
                if avisado then
                  Break
                else if (avisosgeral[J].CreditoId = notificacao.Contas[I].CreditoId) and
                        (avisosgeral[J].SerialHd = serialHd) and
                        (avisosgeral[J].Email = email) then
                begin
                  registrado := True;
                  avisado    := avisosgeral[J].DataAviso < Date;
                end;

              if not avisado then
              begin
                abertos := abertos + 1;
                VerificaConta(notificacao.Contas[I]);
              end;

              if not registrado then
              begin
                SetLength(avisosgeral, Length(avisosgeral) + 1);
                avisosgeral[High(avisosgeral)] := TCreditoAviso.Create;
                avisosgeral[High(avisosgeral)].CreditoId := notificacao.Contas[I].CreditoId;
                avisosgeral[High(avisosgeral)].DataAviso := Date;
                avisosgeral[High(avisosgeral)].DataVencimento := notificacao.Contas[I].DataVencimento;
                avisosgeral[High(avisosgeral)].Email := email;
                avisosgeral[High(avisosgeral)].SerialHd := serialHd;
                changesAviso := True;
              end;
            end;
        end;
        
      end;
      CodEmpresa := empRescue;

      for J := High(avisosgeral) downto Low(avisosgeral) do
        if avisosgeral[J].DataVencimento <= Date then
        begin
          Delete(avisosgeral, J, 1);
          changesAviso := True;
        end;

      if contaAtual = nil then
        Exit;

      warning := False;
      if contaAtual.DataVencimento = Date then
      begin
        mensagem    := notificacao.Mensagem.DiaVencimento;
        recorrencia := notificacao.Recorrencia.DiaVencimento;
      end
      else if contaAtual.DataVencimento <= notificacao.DiaFechado then
      begin
        mensagem    := notificacao.Mensagem.EmAtraso;
        recorrencia := notificacao.Recorrencia.EmAtraso;
        warning     := True;
      end
      else
      begin
        mensagem    := notificacao.Mensagem.AVencer;
        recorrencia := notificacao.Recorrencia.AVencer;
      end;
      mensagem := mensagem.Replace('<@diavencimento>', FormatDateTime('dd/MM/yyyy', contaAtual.DataVencimento), [rfReplaceAll, rfIgnoreCase])
                          .Replace('<@valor>', Format('%0.2m', [contaAtual.Valor]), [rfReplaceAll, rfIgnoreCase])
                          .Replace('<@numerodocumento>', contaAtual.NumeroDocumento, [rfReplaceAll, rfIgnoreCase])
                          .Replace('<@cnpj>', contaAtual.Cnpj, [rfReplaceAll, rfIgnoreCase]);
      if mensagem.ToLower.Contains('<@identificacao_emp>') or mensagem.ToLower.Contains('<@nome_emp>') then
        with SqlOpen('select identificacao_emp, nome_emp from empresa where cgc_emp = %s', [contaAtual.Cnpj.QuotedString]) do
          for I := 0 to Fields.Count - 1 do
            mensagem := mensagem.Replace('<@' + Fields[I].FieldName.ToLower + '>', ProperCase(Fields[I].AsString).Trim, [rfReplaceAll, rfIgnoreCase]);

      conf := TConfig_sistema_class.Create;
      conf.WriteInteger('Notificacao', 'Recorrencia', recorrencia);
      conf.WriteInteger('Notificacao', 'Warning'    , IfThen(warning, 1));
      conf.WriteString( 'Notificacao', 'Mensagem'   , mensagem);

      dadosnotificacao := conf.value1_b.Text;

      conf.Free;

    except
      vencidos := -1;
      abertos := -1;
      hoje := -1;
      changesAviso := False;
    end;

  finally
    if changesAviso then
      SaveJSON(HW_SERV_FIN_CREDAVISOS, THwClassRegistros.ArrayObjectToJsonStringEncode<TCreditoAviso>(avisosgeral));

    desconectar;
  end;
end;

procedure THwIntegraServicosFinanceiro.FinanceiroService_ShowCreditosEmAberto(empresas: TArray<Integer>;
  usuarioId: Integer);
var
//  FinanceiroService: TFinanceiroService;
  DadosConsulta: THwServicosJSON;
  notificacao: TNotificacaoContasEmAberto;
  Creditos: TArray<TCreditoBoleto>;
  I, J, EmpRescue: Integer;
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  try

    try
      GetDadosApi;

      DadosConsulta := nil;
      EmpRescue := CodEmpresa;
      for I := Low(Empresas) to High(Empresas) do
      begin
        CodEmpresa := Empresas[I];

        DadosConsulta := THwClassRegistros.FromJsonString<THwServicosJSON>(GetJson(HW_SERV_FIN_CONS_DIARIA));
        if DadosConsulta = nil then
        begin
          DadosConsulta := THwServicosJSON.Create;
          DadosConsulta.DataConsulta := DataHoraAtual;
          DadosConsulta.Status := HW_STS_SEM_CONSULTA;
        end;
        DadosConsulta.Servico := HW_SERV_FIN_CONS_DIARIA;

        notificacao := FinanceiroService_Consultar(DadosConsulta);

        if notificacao = nil then
          notificacao := THwClassRegistros.FromJsonString<TNotificacaoContasEmAberto>(GetJson(HW_SERV_FIN_NOTIFICACAO));

        if notificacao <> nil then
          for J := Low(notificacao.Contas) to High(notificacao.Contas) do
          begin
            SetLength(Creditos, Length(Creditos) + 1);
            Creditos[High(Creditos)] := notificacao.Contas[J];
          end;
      end;
      CodEmpresa := EmpRescue;

      Application.CreateForm(TFrmCreditosHw, FrmCreditosHw);
      FrmCreditosHw.Integra  := Self;
      FrmCreditosHw.Creditos := Creditos;
      FrmCreditosHw.Consulta := DadosConsulta;
      FrmCreditosHw.Empresas := Empresas;
      FrmCreditosHw.UsuarioId := usuarioId;
      Self.OnLog := FrmCreditosHw.LogApi;
      FrmCreditosHw.ShowModal;
    finally
      desconectar;
    end;

  except on E: Exception do
    begin
      LogError('THwIntegraServicos.FinanceiroService_ShowCreditosEmAberto %s', [e.Message]);
      ShowErro('Erro ao cadastrar carregar' + sLineBreak + e.Message);
    end;
  end;
end;

end.
