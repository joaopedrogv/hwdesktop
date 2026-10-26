unit uPOSVirtualDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, IBQuery, uEditHw;

type
  TfrmPOSVirtualDados = class(TForm)
    pnTransacoesCartao: TPanel;
    pnDadosTransacaoCartao: TPanel;
    dbgridDadosCartoes: TDBGrid;
    pnDadosCartaoBotoes: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    lbMesAno: TLabel;
    btDadosCartaoVoltar: TBitBtn;
    btCancelarTransacaoSistema: TBitBtn;
    btEfetuarTransacaoAvulsa: TBitBtn;
    btOperacaoADM: TBitBtn;
    pnContSelTermnalAdm: TPanel;
    pnSelTermnalAdm: TPanel;
    groupSelTermnalAdm: TGroupBox;
    lbNaoEstaNaListaTermAdm: TLabel;
    dblkListaTermAdm: TDBLookupComboBox;
    edNumTerminalAdm: TEdit;
    pnSelTermnalAdmBotoes: TPanel;
    btSelTermnalAdmContinuar: TBitBtn;
    dsDiversos: TDataSource;
    btVisualizarComprovante: TBitBtn;
    pnBotoesSelAVL: TPanel;
    btSelecionarTrAVL: TBitBtn;
    btCancelarSelAVL: TBitBtn;
    SpeedButton1: TSpeedButton;
    lbMesAno2: TLabel;
    SpeedButton2: TSpeedButton;
    btAlterarCodTermADM: TBitBtn;
    btAlterarTpOperacaoDiasCred: TBitBtn;
    pnEscolhaOperacao: TPanel;
    pnEscolhaOperacaoDados: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    ListBox2: TListBox;
    EditHw2: TEditHw;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    lbCVencimento: TLabel;
    lbVencimento: TLabel;
    btDesvincularTransacao: TBitBtn;
    bt_outras_nf: TSpeedButton;
    procedure bt_outras_nfClick(Sender: TObject);
    procedure btDesvincularTransacaoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure ListBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btAlterarTpOperacaoDiasCredClick(Sender: TObject);
    procedure dbgridDadosCartoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btAlterarCodTermADMClick(Sender: TObject);
    procedure btSelecionarTrAVLClick(Sender: TObject);
    procedure btVisualizarComprovanteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbNaoEstaNaListaTermAdmClick(Sender: TObject);
    procedure pnSelTermnalAdmEnter(Sender: TObject);
    procedure pnSelTermnalAdmExit(Sender: TObject);
    procedure btOperacaoADMClick(Sender: TObject);
    procedure btCancelarTransacaoSistemaClick(Sender: TObject);
    procedure btEfetuarTransacaoAvulsaClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure dbgridDadosCartoesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnDadosTransacaoCartaoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btDadosCartaoVoltarClick(Sender: TObject);
    procedure btSelTermnalAdmContinuarClick(Sender: TObject);
  private
    { Private declarations }
    vMesCartao: TDate;
    cCartaoQ, cQuery: TIBQuery;
    vTerminalF, vRecNoGrid: Integer;

    vAUT_, vNSU_, vTpVND_, vNumVND_, vTermADM_, vID_: string;
    vVl_: Extended;
    procedure abreMesCartao;
    procedure atribuirDadosTransacao;
    procedure desabilitarTodosBotoes;
    procedure habilitarTodosBotoes(pFoco: TWinControl);
  public
    { Public declarations }
  end;

var
  frmPOSVirtualDados: TfrmPOSVirtualDados;

implementation

uses
  uDtmAtivo, DateUtils, uDadosIni, Funcoes;

{$R *.dfm}

procedure TfrmPOSVirtualDados.abreMesCartao;
begin
  cCartaoQ.Close;
  cCartaoQ.SQL.Text := 'select SEQID ID, TPDOCS "Tip VND", NREQUISICAO "Num VND", SECAO "Secao",' +
    ' PARCELAS "Parc", VALOR_OPERACAO "Valor Operacao", VALOR_TRANSACAO "Valor Transacao",' +
    ' N_AUT_CART "Num Aut", n_docnsu_adm "Num Doc Adm", cod_terminal_adm "Term Adm", status "Status",' +
    ' REDE  "Rede", DATA_TRANSACAO "Data Transacao", DATA_HORA "Data Registro",' +
    ' COD_USUARIO "Cod User", LOGIN_USUARIO "Login User", COD_USUARIO_CANC "Cod User Canc", LOGIN_USUARIO_CANC "Login User Canc",' +
    ' DATA_HORA_CANC "Data Cancelamento", OPERACAO "Operacao", DIAS_PARA_CRED "Dias p Cred", impressao "Comprovante"' +
    ' from TRANSACAO_CARTAO' +
    ' where DATA_HORA >= :dataIni and data_hora <= :dataFim' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  if pnBotoesSelAVL.Visible then
    cCartaoQ.SQL.Text := cCartaoQ.SQL.Text + ' and TPDOCS = ''AVL'' and status = ''A''';
  cCartaoQ.SQL.Text := cCartaoQ.SQL.Text + ' order by DATA_HORA desc';
  cCartaoQ.ParamByName('dataIni').AsDate := StartOfTheMonth(vMesCartao);
  cCartaoQ.ParamByName('dataFim').AsDateTime := EndOfTheMonth(vMesCartao) + StrToTime('23:59:59');
  cCartaoQ.Open;

  TFloatField(cCartaoQ.FieldByName('Valor Operacao')).DisplayFormat := '##0.00';
  TFloatField(cCartaoQ.FieldByName('Valor Transacao')).DisplayFormat := '##0.00';

  try
    if not cCartaoQ.IsEmpty then    
      cCartaoQ.RecNo := vRecNoGrid;
  except
  end;
end;

procedure TfrmPOSVirtualDados.btVisualizarComprovanteClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    desabilitarTodosBotoes;
    if Trim(cCartaoQ.FieldByName('Comprovante').AsString) <> '' then
    begin

      if cCartaoQ.IsEmpty then
        Exit;

      atribuirDadosTransacao;

      if not vDadosIni.PesqPros('POSV007', 'VISUALIZAR', vTpVND_ + ' ' + vNumVND_ +
        'VL: ' + Format('%0.2n', [vVl_]) + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO',
        vID_, cQuery, True) then
        Exit;

      if vDadosIni.vModoImpressao.vLinhasImpressao = nil then
        vDadosIni.vModoImpressao.vLinhasImpressao := TStringList.Create;
      vDadosIni.vModoImpressao.vLinhasImpressao.Clear;
      if cCartaoQ.FieldByName('status').AsString = 'C' then
      begin
        vDadosIni.vModoImpressao.vLinhasImpressao.Add('  TRANSACAO CANCELADA NO SISTEMA  ');
        vDadosIni.vModoImpressao.vLinhasImpressao.Add('**********************************');
      end;                                                                                
      vDadosIni.vModoImpressao.TxtNaoFiscal := vDadosIni.vModoImpressao.vLinhasImpressao.Text +
        vdadosIni.PosVirtualGetComprovantes(cCartaoQ.FieldByName('Comprovante').AsString, true);
      vDadosIni.vModoImpressao.vLinhasImpressao.Text := vDadosIni.vModoImpressao.vLinhasImpressao.Text +
        vdadosIni.PosVirtualGetComprovantes(cCartaoQ.FieldByName('Comprovante').AsString);

      vDadosIni.abreFormCadastro('pkPedidoVenda', 'TfrmImpressaoNaECF');
    end;
  finally
    habilitarTodosBotoes(TWinControl(Sender));
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPOSVirtualDados.bt_outras_nfClick(Sender: TObject);
begin
  vDadosIni.configurarSistema('pos_virtual_%', cQuery);
end;

procedure TfrmPOSVirtualDados.btSelecionarTrAVLClick(Sender: TObject);
begin
  if cCartaoQ.IsEmpty then
    vDadosIni.vPesquisa := 'VAZIO||'
  else
    vDadosIni.vPesquisa := 'OK|' +
      IntToStr(cCartaoQ.FieldByName('ID').AsInteger) + '|';
  ModalResult := IDOK;
end;

procedure TfrmPOSVirtualDados.atribuirDadosTransacao;
begin
  vTpVND_ := Trim(cCartaoQ.FieldByName('Tip VND').AsString);
  vNumVND_ := Trim(cCartaoQ.FieldByName('Num VND').AsString);
  vAUT_ := Trim(cCartaoQ.FieldByName('Num Aut').AsString);
  vNSU_ := Trim(cCartaoQ.FieldByName('Num Doc Adm').AsString);
  vVl_ := cCartaoQ.FieldByName('Valor Operacao').AsFloat;
  vTermADM_ := Trim(cCartaoQ.FieldByName('Term Adm').AsString);
  vID_:= IntToStr(cCartaoQ.FieldByName('id').AsInteger);
end;

procedure TfrmPOSVirtualDados.BitBtn1Click(Sender: TObject);
begin
  TForm(pnEscolhaOperacaoDados.Parent).ModalResult := IDOK
end;

procedure TfrmPOSVirtualDados.btAlterarCodTermADMClick(Sender: TObject);
var
  vNovoTermAdm: string;
  vListaTmp: TStringList;
  I, vCodADM: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    desabilitarTodosBotoes;
    if cCartaoQ.IsEmpty then
      Exit;
    vRecNoGrid := cCartaoQ.RecNo;

    if cCartaoQ.FieldByName('STATUS').AsString = 'C' then
    begin
      Application.MessageBox('Transação esta cancelada', 'Atenção', 0 + 64);
      Exit;
    end;

    if Trim(cCartaoQ.FieldByName('Num Aut').AsString) = '' then
    begin
      Application.MessageBox('Sem número de autorização. Não tem necessidade de informar o terminal Adm', 'Atenção', 0 + 64);
      Exit;
    end;  

    if cCartaoQ.FieldByName('operacao').AsString = 'P' then
    begin
      Application.MessageBox('Operação de Carteiras Digitais não permite alteração', 'Atenção', 0 + 64);
      Exit;
    end;

    atribuirDadosTransacao;

    if not vDadosIni.PesqPros('POSV008', 'ALTERAR', 'TERM ADM:' + vTermADM_ + ' ' +  vTpVND_ + ' ' + vNumVND_ +
      'VL: ' + Format('%0.2n', [vVl_]) + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO',
      vID_, cQuery, True) then
      Exit;

    vNovoTermAdm := vDadosIni.getTerminalADM(cQuery, True);

    if trim(vNovoTermAdm) = '' then
      Exit;

    vDadosIni.gravaTransacaoPosVirtual(cCartaoQ.FieldByName('id').AsInteger, '', vNovoTermAdm, 0, 0, 0, cQuery);

    vDadosIni.GravaAuditoria('POSV008', 'ALTERAR', 'TERM ADM NOVO:' + vNovoTermAdm, 'TRANSACAO_CARTAO', vID_, cQuery);

    cQuery.Close;
    cQuery.SQL.Text := 'select n_processamento from formpagamento' +
      ' where tpdocs = ' + QuotedStr(cCartaoQ.FieldByName('Tip VND').AsString) +
      ' and nrequisicao = ' + IntToStr(cCartaoQ.FieldByName('Num VND').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and coalesce(n_processamento, 0) > 0' +
      ' and N_AUT_CART = ' + QuotedStr(cCartaoQ.FieldByName('Num Aut').AsString) +
      ' and N_DOCNSU_ADM = ' + QuotedStr(cCartaoQ.FieldByName('Num Doc Adm').AsString);
    cQuery.Open;

    if not cQuery.IsEmpty then
    begin

      vListaTmp := TStringList.Create;
      vListaTmp.Clear;
      cQuery.First;
      while not cQuery.Eof do
      begin
        vListaTmp.Add(IntToStr(cQuery.FieldByName('n_processamento').AsInteger));
        cQuery.Next;
      end;

      for I := 0 to vListaTmp.Count - 1 do
      begin
        vCodADM := 0;
        cQuery.Close;
        cQuery.SQL.Text := 'select COD_ADM from TERMINAL_CARTAO' +
          ' where COD_TERM_ADM = ' + QuotedStr(Trim(vNovoTermAdm)) +
          ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
        cQuery.Open;
        vCodADM := cQuery.FieldByName('COD_ADM').AsInteger;

        cQuery.Close;
        cQuery.SQL.Text := 'update controle_creditos' +
          ' set COD_TERMINAL_ADM = ' + QuotedStr(vNovoTermAdm);
        if vCodADM > 0 then
          cQuery.SQL.Text := cQuery.SQL.Text + ', COD_ADM = ' + IntToStr(vCodADM);
        cQuery.SQL.Text := cQuery.SQL.Text +
          ' where cod_cred = ' + IntToStr(StrToIntDef( vListaTmp[i], 0)) +
          ' and ' +
          vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
          ' = ' + vDadosIni.codEmpresa;
        cQuery.ExecSQL;

        vDadosIni.GravaAuditoria('POSV008', 'ALTERAR', 'TERM ADM NOVO:' + vNovoTermAdm + 'COD CRED:' + vListaTmp[I], 'CONTROLE_CREDITOS', '', cQuery);
      end;
    end;

    cQuery.Close;
    cQuery.SQL.Text := 'update formpagamento' +
      ' set COD_TERMINAL_ADM = ' + QuotedStr(vNovoTermAdm) +
      ' where tpdocs = ' + QuotedStr(cCartaoQ.FieldByName('Tip VND').AsString) +
      ' and nrequisicao = ' + IntToStr(cCartaoQ.FieldByName('Num VND').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and N_AUT_CART = ' + QuotedStr(cCartaoQ.FieldByName('Num Aut').AsString) +
      ' and N_DOCNSU_ADM = ' + QuotedStr(cCartaoQ.FieldByName('Num Doc Adm').AsString);
    cQuery.ExecSQL;

    vDadosIni.GravaAuditoria('POSV008', 'ALTERAR', 'TERM ADM NOVO:' + vNovoTermAdm +
      vTpVND_ + ' ' + vNumVND_ + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'FORMPAGAMENTO', '', cQuery);

    cQuery.Transaction.Commit;

    abreMesCartao;
  finally
    habilitarTodosBotoes(TWinControl(Sender));
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPOSVirtualDados.btAlterarTpOperacaoDiasCredClick(Sender: TObject);
var
  vOpAnt, vOpNova: string;
  vDiasAnt, vDiasNovo: Smallint;
begin
  if cCartaoQ.IsEmpty then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    desabilitarTodosBotoes;
    vRecNoGrid := cCartaoQ.RecNo;

    if cCartaoQ.FieldByName('STATUS').AsString = 'C' then
    begin
      Application.MessageBox('Transação esta cancelada', 'Atenção', 0 + 64);
      Exit;
    end;

    if cCartaoQ.FieldByName('Tip VND').AsString = 'ADM' then
    begin
      Application.MessageBox('Tipo VND não permite alteração', 'Atenção', 0 + 64);
      Exit;
    end;

    if cCartaoQ.FieldByName('operacao').AsString = 'P' then
    begin
      Application.MessageBox('Operação de Carteiras Digitais não permite alteração', 'Atenção', 0 + 64);
      Exit;
    end;

    atribuirDadosTransacao;
    vOpAnt := Trim(cCartaoQ.FieldByName('Operacao').AsString);
    vDiasAnt := cCartaoQ.FieldByName('Dias p Cred').AsInteger;

    if not vDadosIni.PesqPros('POSV009', 'ALTERAR',
      'OP:' + vOpAnt + ' ' +
      'DIAS:' + IntToStr(vDiasAnt) + ' ' +
      vTpVND_ + ' ' + vNumVND_ + 'VL: ' + Format('%0.2n', [vVl_]) + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO',
      vID_, cQuery, True) then
      Exit;

    if cCartaoQ.FieldByName('STATUS').AsString = 'C' then
    begin
      Application.MessageBox('Transação esta cancelada', 'Atenção', 0 + 64);
      Exit;
    end;

    if Trim(cCartaoQ.FieldByName('Num Aut').AsString) = '' then
    begin
      Application.MessageBox('Sem número de autorização. Não tem necessidade de informar a operação', 'Atenção', 0 + 64);
      Exit;
    end;
    ListBox2.ItemIndex := vDadosIni.retornoPorCondicao(vOpAnt = 'D', 0, 1);// invertido
    EditHw2.AsValue := vDadosIni.retornoPorCondicao(vOpAnt = 'D', 30, 0);// invertido
    lbVencimento.Caption := FormatDateTime('DD/MM/YYYY', DateOf(cCartaoQ.FieldByName('Data Transacao').AsDateTime) + EditHw2.AsInteger);

    if vDadosIni.abreForm('Tipo de Operação', pnEscolhaOperacaoDados, pnEscolhaOperacao) then
    begin
      vOpNova := vDadosIni.retornoPorCondicao(ListBox2.ItemIndex = 1, 'D', 'C');
      vDiasNovo := EditHw2.AsInteger;
      if vOpAnt = vOpNova then
        if vDiasAnt = vDiasNovo then
        begin
          Application.MessageBox('Dados informados iguais aos dados já gravados', 'Atenção', 0 + 64);
          vDadosIni.GravaAuditoria('POSV009', 'ALTERAR', 'SEM ALTERACOES PARA GRAVAR', 'TRANSACAO_CARTAO', vID_, cQuery);
        end;

        try
          if vDadosIni.gravaTransacaoPosVirtual(cCartaoQ.FieldByName('id').AsInteger, '', vTermADM_, 0, 0, 0, cQuery,
            False, vOpNova, vDiasNovo) > 0 then
            vDadosIni.GravaAuditoria('POSV009', 'ALTERAR', 'SUCESSO - OP NOVA:' + vOpNova + ' ' +
              'DIAS NOVO:' + IntToStr(vDiasNovo), 'TRANSACAO_CARTAO', vID_, cQuery);

          cQuery.Transaction.Commit;
        finally
          abreMesCartao;
        end;
    end;
  finally
    habilitarTodosBotoes(TWinControl(Sender));
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmPOSVirtualDados.btOperacaoADMClick(Sender: TObject);
var
  vID: Integer;
begin
  try

    Screen.Cursor := crHourGlass;
    desabilitarTodosBotoes;
    vRecNoGrid := cCartaoQ.RecNo;

    if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
    begin
      Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
      Exit;
    end;
    if not vDadosIni.PesqPros('POSV002', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery, True) then
      Exit;
    if not vDadosIni.operacaoPosVirtual(posADM, 'Operação Administrativo', '', 0, cQuery) then
    begin
      vDadosIni.GravaAuditoria('POSV002', 'INICIAR', 'OPERACAO CANCELADA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery);
      Exit;
    end
    else if vDadosIni.vPOSV.vLinhasImpressao.Count > 0 then
    begin
      if vDadosIni.vPOSV.retorno = retSucesso then
      begin

        vID := vDadosIni.gravaTransacaoPosVirtual(0, 'ADM', vDadosIni.getTerminalADM(cQuery), 0, 0, 0, cQuery);

        cQuery.Transaction.Commit;
      end;
    end;

    if vDadosIni.vPOSV.retorno = retSucesso then
      vDadosIni.GravaAuditoria('POSV002', 'INICIAR', 'SUCESSO - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', IntToStr(vID), cQuery)
    else
      vDadosIni.GravaAuditoria('POSV002', 'INICIAR', 'FALHA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery);
  finally
    abreMesCartao;
    habilitarTodosBotoes(TWinControl(Sender));
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPOSVirtualDados.btCancelarTransacaoSistemaClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    desabilitarTodosBotoes;
    vRecNoGrid := cCartaoQ.RecNo;
    try
      if cCartaoQ.IsEmpty then
        Exit;

      if cCartaoQ.FieldByName('STATUS').AsString = 'C' then
      begin
        Application.MessageBox('Transação já esta cancelada', 'Atenção', 0 + 64);
        Exit;
      end;

      if cCartaoQ.FieldByName('Tip VND').AsString = 'ADM' then
      begin
        Application.MessageBox('Transação não permite cancelamento', 'Atenção', 0 + 64);
        Exit;
      end;

      atribuirDadosTransacao;

      if not vDadosIni.PesqPros('POSV004', 'CANCELAR', vTpVND_ + ' ' + vNumVND_ +
        'VL: ' + Format('%0.2n', [vVl_]) + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO',
        vID_, cQuery, True) then
        Exit;

      if Application.MessageBox(Pchar('Este processo somente irá efetuar o cancelamento da transação no sistema.' + #13 +
        'Certifique-se que ja tenha cancelado ou de cancelar a transação TEF com a Adm do Cartão' + #13 +
        'Para cancelar a transação TEF você deve usar a opção "Administrativo"' + #13 +
        'Deseja mesmo cancelar a transacao no sistema?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

      if vTpVND_ <> 'AVL' then
      begin
        Application.MessageBox('Transação TEF não é uma transação Avulsa', 'Atenção', 0 + 64);

        if not vDadosIni.PesqPros('POSV005', 'CANCELAR', vTpVND_ + ' ' + vNumVND_ +
          'VL: ' + Format('%0.2n', [vVl_]) + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO',
          vID_, cQuery, True, True) then
          Exit;
        cQuery.Close;
        cQuery.SQL.Text := 'select count(fp.nrequisicao) contador from formpagamento fp' +
          ' where  fp.nrequisicao = ' + vNumVND_ +
          ' and fp.tpdocs = ' + QuotedStr(vTpVND_) +
          ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and fp.N_AUT_CART = ' + QuotedStr(vAUT_) +
          ' and fp.N_DOCNSU_ADM = ' + QuotedStr(vNSU_) +
          ' and coalesce(fp.COD_TERMINAL_ADM, '''') = ' + QuotedStr(Trim(vTermADM_));
        cQuery.Open;

        if cQuery.FieldByName('contador').AsInteger > 0 then
        begin
          Application.MessageBox('Transação TEF com recebimento na venda', 'Atenção', 0 + 64);

          if not vDadosIni.PesqPros('POSV006', 'CANCELAR', vTpVND_ + ' ' + vNumVND_ +
            'VL: ' + Format('%0.2n', [vVl_]) + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO',
            vID_, cQuery, True, True) then
            Exit;
        end;
      end;

      vDadosIni.gravaTransacaoPosVirtual(cCartaoQ.FieldByName('id').AsInteger, '', '', 0, 0, 0, cQuery, True);

      cQuery.Transaction.Commit;

      vDadosIni.GravaAuditoria('POSV004', 'CANCELAR', 'SUCESSO - ' + vTpVND_ + ' ' + vNumVND_ +
        'VL: ' + Format('%0.2n', [vVl_]) + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO',
        vID_, cQuery);

    except on E: Exception do
      begin
        cQuery.Transaction.Rollback;

        vDadosIni.GravaAuditoria('POSV004', 'CANCELAR', 'FALHA - ' + vTpVND_ + ' ' + vNumVND_ +
          'VL: ' + Format('%0.2n', [vVl_]) + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO',
          vID_, cQuery);
      end;
    end;
  finally
    abreMesCartao;
    habilitarTodosBotoes(TWinControl(Sender));
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPOSVirtualDados.btEfetuarTransacaoAvulsaClick(Sender: TObject);
var
  vTerminalAdm: string;
  vID: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    desabilitarTodosBotoes;
    vRecNoGrid := cCartaoQ.RecNo;
    dbgridDadosCartoes.Visible := False;

    if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
    begin
      Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
      Exit;
    end;
    if not vDadosIni.PesqPros('POSV001', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery, True) then
      Exit;
    if not vDadosIni.operacaoPosVirtual(posCartaoMaisCarteiras, 'Informe o valor da operação', '', 0, cQuery) then
    begin
      vDadosIni.GravaAuditoria('POSV001', 'INICIAR', 'OPERACAO CANCELADA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery);
      Exit;
    end;

    if vDadosIni.vPOSV.retorno = retSucesso then
    begin
      vTerminalAdm := '';
      if Trim(vDadosIni.vPOSV.idCarteiraDigital) = '' then
      begin
        if vDadosIni.vPOSV.operacao <> posADM then
          vTerminalAdm := vDadosIni.getTerminalADM(cQuery);
      end;

      vID := vDadosIni.gravaTransacaoPosVirtual(0, 'AVL', vTerminalAdm, StrToIntDef(vDadosIni.vPOSV.numeroDocumento,0), 0, 0, cQuery);

      cQuery.Transaction.Commit;

      vDadosIni.GravaAuditoria('POSV001', 'INICIAR',
        'SUCESSO - AVL ' + vDadosIni.vPOSV.numeroDocumento + 'VL: ' + Format('%0.2n', [vDadosIni.vPOSV.valorOperacao]) +
        '-AUT:' + vDadosIni.vPOSV.retornoAUT + '-NSU:' + vDadosIni.vPOSV.retornoNSU, 'TRANSACAO_CARTAO', IntToStr(vID), cQuery);
    end
    else
      vDadosIni.GravaAuditoria('POSV001', 'INICIAR', 'FALHA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', cQuery);
  finally
    abreMesCartao;
    habilitarTodosBotoes(TWinControl(Sender));
    dbgridDadosCartoes.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPOSVirtualDados.btDadosCartaoVoltarClick(Sender: TObject);
begin
  ModalResult := IDCANCEL;
end;

procedure TfrmPOSVirtualDados.btDesvincularTransacaoClick(Sender: TObject);
var
  vTpVndAnt, vNumVndAnt: string;
  vNumVNDAVL: Integer;
begin
  if cCartaoQ.IsEmpty then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    desabilitarTodosBotoes;
    vRecNoGrid := cCartaoQ.RecNo;

    if cCartaoQ.FieldByName('STATUS').AsString = 'C' then
    begin
      Application.MessageBox('Transação esta cancelada', 'Atenção', 0 + 64);
      Exit;
    end;

    if cCartaoQ.FieldByName('Tip VND').AsString = 'ADM' then
    begin
      Application.MessageBox('Tipo VND não permite alteração', 'Atenção', 0 + 64);
      Exit;
    end
    else if cCartaoQ.FieldByName('Tip VND').AsString = 'AVL' then
    begin
      Application.MessageBox('Tipo VND não permite alteração', 'Atenção', 0 + 64);
      Exit;
    end;

    atribuirDadosTransacao;

    cQuery.Close;
    cQuery.SQL.Text := 'select count(fp.nrequisicao) contador from formpagamento fp' +
      ' where  fp.nrequisicao = ' + vNumVND_ +
      ' and fp.tpdocs = ' + QuotedStr(vTpVND_) +
      ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and fp.N_AUT_CART = ' + QuotedStr(vAUT_) +
      ' and fp.N_DOCNSU_ADM = ' + QuotedStr(vNSU_) +
      ' and coalesce(fp.COD_TERMINAL_ADM, '''') = ' + QuotedStr(Trim(vTermADM_));
    cQuery.Open;

    if cQuery.FieldByName('contador').AsInteger > 0 then
    begin
      Application.MessageBox('Transação TEF com recebimento na venda', 'Atenção', 0 + 64);
      Exit;
    end;

    if not vDadosIni.PesqPros('POSV010', 'ALTERAR',
      vTpVND_ + ' ' + vNumVND_ + 'VL: ' + Format('%0.2n', [vVl_]) + '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO',
      vID_, cQuery, True) then
      Exit;

    if cCartaoQ.FieldByName('STATUS').AsString = 'C' then
    begin
      Application.MessageBox('Transação esta cancelada', 'Atenção', 0 + 64);
      Exit;
    end;

    if (Trim(cCartaoQ.FieldByName('operacao').AsString) <> 'P') and
      (Trim(cCartaoQ.FieldByName('Num Aut').AsString) = '') then
    begin
      Application.MessageBox('Sem número de autorização. Não tem necessidade de informar a operação', 'Atenção', 0 + 64);
      Exit;
    end;

    if Application.MessageBox('A transação selecionada será desvinculada da venda. Deseja mesmo remover o vinculo de venda?', 'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    cQuery.Close;
    cQuery.SQL.Text := 'select COD from INCREMENTA_CODIGO(' + vDadosIni.codEmpresa + ', ''POSVIRTUAL'')';
    cQuery.Open;

    if cQuery.FieldByName('COD').AsInteger > 0 then
      vNumVNDAVL := cQuery.FieldByName('COD').AsInteger
    else
    begin
      Randomize;
      vNumVNDAVL := Random(999999);
    end;

    try
      if vDadosIni.gravaTransacaoPosVirtual(cCartaoQ.FieldByName('id').AsInteger, 'AVL', vTermADM_, vNumVNDAVL, 0, 0, cQuery,
        False) > 0 then
        vDadosIni.GravaAuditoria('POSV010', 'ALTERAR', 'SUCESSO - AVL ' + IntToStr(vNumVNDAVL), 'TRANSACAO_CARTAO', vID_, cQuery);

      cQuery.Transaction.Commit;
    finally
      abreMesCartao;
    end;
  finally
    habilitarTodosBotoes(TWinControl(Sender));
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPOSVirtualDados.btSelTermnalAdmContinuarClick(Sender: TObject);
begin
  if dblkListaTermAdm.KeyValue = Null then
    Exit;

  if Trim(edNumTerminalAdm.Text) <> '' then
    vDadosIni.vPesquisa := Trim(edNumTerminalAdm.Text)
  else
    vDadosIni.vPesquisa := string(dblkListaTermAdm.KeyValue);

  dblkListaTermAdm.KeyField := '';
  dblkListaTermAdm.ListField := '';
  dblkListaTermAdm.ListSource := nil;
  dsDiversos.DataSet := nil;

  ModalResult := IDOK;
end;

procedure TfrmPOSVirtualDados.dbgridDadosCartoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('status').AsString = 'C' then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := clBtnFace;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else
  begin

    with dbgridDadosCartoes do
    begin
      if  DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
        if (Rect.Top = TStringGrid(dbgridDadosCartoes).CellRect( DataCol ,TStringGrid(dbgridDadosCartoes).Row).Top)
          or( gdSelected in State)  then
         begin
           Canvas.FillRect(Rect);
           Canvas.Font.Color := clblue;
           DefaultDrawDataCell(Rect,Column.Field,State)
        end;
    end;
  end;
end;

procedure TfrmPOSVirtualDados.dbgridDadosCartoesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btDadosCartaoVoltar.Click
  else if Key = VK_RETURN then
    if pnSelTermnalAdm.Visible then
      btSelecionarTrAVL.Click;  
end;

procedure TfrmPOSVirtualDados.desabilitarTodosBotoes;
begin
  btEfetuarTransacaoAvulsa.Enabled := False;
  btCancelarTransacaoSistema.Enabled := False;
  btOperacaoADM.Enabled := False;
  btVisualizarComprovante.Enabled := False;
  btAlterarCodTermADM.Enabled := False;
  btAlterarTpOperacaoDiasCred.Enabled := False;
  btDadosCartaoVoltar.Enabled := False;
  btDesvincularTransacao.Enabled := False;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
end;

procedure TfrmPOSVirtualDados.EditHw2Exit(Sender: TObject);
begin
  if EditHw2.AsInteger < 0 then
  begin
    Application.MessageBox('Dias para crédito inválido. Informe de 0 a 30 dias', 'Atenção', 0 + 64);
    EditHw2.AsValue := vDadosIni.retornoPorCondicao(ListBox2.ItemIndex = 1, 2, 30);
  end
  else
    lbVencimento.Caption := FormatDateTime('DD/MM/YYYY', DateOf(cCartaoQ.FieldByName('Data Transacao').AsDateTime) + EditHw2.AsInteger);
end;

procedure TfrmPOSVirtualDados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsDiversos.DataSet := nil;
  dbgridDadosCartoes.DataSource := nil;

  Action := caFree;
  frmPOSVirtualDados := nil
end;

procedure TfrmPOSVirtualDados.FormShow(Sender: TObject);
begin
  vRecNoGrid := 1;
  cCartaoQ := TIBQuery.Create(Application);
  cCartaoQ.Database := dtmAtivo.bancoHw;
  cCartaoQ.Transaction := dtmAtivo.IbTransCol;

  cQuery := TIBQuery.Create(Application);
  cQuery.Database := dtmAtivo.bancoHw;
  cQuery.Transaction := dtmAtivo.IbTransCol;

  if StrToIntDef(vDadosIni.vCodTerminal, 0) > 0 then
    vTerminalF := StrToIntDef(vDadosIni.vCodTerminal, 0)
  else
    vTerminalF := StrToIntDef(Trim(vDadosIni.GetIni('TEF', 'TerminalF', '0')), 0);

  if pnTransacoesCartao.Visible then
  begin
    dsDiversos.DataSet := cCartaoQ;
    dbgridDadosCartoes.DataSource := dsDiversos;
    vMesCartao := StartOfTheMonth(vDadosIni.getDataBanco(cQuery));

    abreMesCartao;

    lbMesAno.Caption := FormatDateTime('MM/YYYY', vMesCartao);
    lbMesAno2.Caption := FormatDateTime('MM/YYYY', vMesCartao);
  end
  else if pnContSelTermnalAdm.Visible then
  begin
    cQuery.Close;
    cQuery.SQL.Text :=
      'select t.cod_term_adm, a.descricao_adm, t.desc_term_adm from adm_cartao a' +
      ' inner join terminal_cartao t on t.cod_adm = a.cod_adm and t.cod_empresa = a.cod_empresa' +
      ' where a.cod_empresa = :cod_empresa and t.tipo = ''D''';
    if vTerminalF > 0 then
    begin
      cQuery.SQL.Text := cQuery.SQL.Text + ' and t.cod_terminalf = :cod_terminalf';
      cQuery.ParamByName('COD_TERMINALF').AsInteger := vTerminalF;
    end;
    cQuery.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    cQuery.Open;
  end;
end;

procedure TfrmPOSVirtualDados.habilitarTodosBotoes(pFoco: TWinControl);
begin
  btEfetuarTransacaoAvulsa.Enabled := vDadosIni.GetIni('TEF', 'POSVirtual', 'N') = 'S';
  btCancelarTransacaoSistema.Enabled := True;
  btOperacaoADM.Enabled := btEfetuarTransacaoAvulsa.Enabled;
  btVisualizarComprovante.Enabled := True;
  btAlterarCodTermADM.Enabled := True;
  btAlterarTpOperacaoDiasCred.Enabled := True;
  btDadosCartaoVoltar.Enabled := True;
  btDesvincularTransacao.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  if pFoco.CanFocus then
    pFoco.SetFocus;
end;

procedure TfrmPOSVirtualDados.lbNaoEstaNaListaTermAdmClick(Sender: TObject);
begin
  edNumTerminalAdm.Visible := True;
  if edNumTerminalAdm.CanFocus then
    edNumTerminalAdm.SetFocus;
end;

procedure TfrmPOSVirtualDados.ListBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if EditHw2.CanFocus then
      EditHw2.SetFocus;
end;

procedure TfrmPOSVirtualDados.pnDadosTransacaoCartaoEnter(Sender: TObject);
begin
  btEfetuarTransacaoAvulsa.Enabled := vDadosIni.GetIni('TEF', 'POSVirtual', 'N') = 'S';
  btCancelarTransacaoSistema.Enabled := True;
  btOperacaoADM.Enabled := btEfetuarTransacaoAvulsa.Enabled;
end;

procedure TfrmPOSVirtualDados.pnSelTermnalAdmEnter(Sender: TObject);
begin
  edNumTerminalAdm.Text := '';
  edNumTerminalAdm.Visible := False;
  dsDiversos.DataSet := cQuery;
  dblkListaTermAdm.ListSource := dsDiversos;
  dblkListaTermAdm.ListField := 'COD_TERM_ADM;DESC_TERM_ADM;DESCRICAO_ADM';
  dblkListaTermAdm.KeyField := 'COD_TERM_ADM';
end;

procedure TfrmPOSVirtualDados.pnSelTermnalAdmExit(Sender: TObject);
begin
  dblkListaTermAdm.ListSource := nil;
  dblkListaTermAdm.ListField := '';
  dblkListaTermAdm.KeyField := '';
  dsDiversos.DataSet := nil;
end;

procedure TfrmPOSVirtualDados.SpeedButton3Click(Sender: TObject);
begin
  vRecNoGrid := 1;
  vMesCartao := IncMonth(vMesCartao, -1);
  abreMesCartao;
  lbMesAno.Caption := FormatDateTime('MM/YYYY', vMesCartao);
  lbMesAno2.Caption := FormatDateTime('MM/YYYY', vMesCartao);
end;

procedure TfrmPOSVirtualDados.SpeedButton4Click(Sender: TObject);
begin
  vRecNoGrid := 1;
  vMesCartao := IncMonth(vMesCartao, 1);
  abreMesCartao;
  lbMesAno.Caption := FormatDateTime('MM/YYYY', vMesCartao);
  lbMesAno2.Caption := FormatDateTime('MM/YYYY', vMesCartao);
end;

end.
