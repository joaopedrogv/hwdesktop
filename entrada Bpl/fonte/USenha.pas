unit USenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DBCtrls, TeeProcs, TeEngine, Chart;

type
  TFrmEntrada = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    Chart3: TChart;
    Label2: TLabel;
    Label1: TLabel;
    edUsuario: TEdit;
    edSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    pnEmpPadrao: TPanel;
    Panel2: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    lbClose: TLabel;
    procedure edUsuarioEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    horaClose: TTime;
    horaLabel: TTime;
    timerOneInstance: TTimer;
    timerTrimAppSize: TTimer;
    procedure setTimeOutNow;
    procedure timerOneInstanceTimer(Sender: TObject);
    procedure timerTrimAppSizeTimerTimer(Sender: TObject);
  public
  end;

var
  FrmEntrada: TFrmEntrada;
  Tentativas: Integer;

implementation

uses uDtmEntrada, USplash, uClasseEntrada, uDtmAtivo, uDadosIni, DB, hw_utils, hw_win_utils;

function alterarSenha(vendBanco, vUsuario: PChar; codempresa: integer): longbool; stdcall;
  external 'CompativelHW.dll';

function _getEnderecoBancoTreino(pCNPJ: PChar): PChar; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TFrmEntrada.BitBtn1Click(Sender: TObject);
begin
  try

    edUsuario.Enabled := False;
    edSenha.Enabled := False;

    Tentativas := Tentativas + 1;
  //  if (DBLookupComboBox1.Visible) then
  //  begin
  //    if DBLookupComboBox1.Text = '' then
  //    begin
  //      MessageDlg('Selecione a empresa para prosseguir', mtInformation, [mbOK], 0);
  //      DBLookupComboBox1.SetFocus;
  //      exit;
  //    end;
  //    obUser.setEmpresaSelecionada;
  //    ModalResult := IDOK;
  //    exit;
  //  end;

    if Trim(edUsuario.Text) = '' then
    begin
      Application.MessageBox('Informe o usuário!', 'Anteção', 0 + 64);
      edUsuario.Enabled := True;
      edUsuario.SetFocus;
      Exit;
    end
    else if Trim(edSenha.Text) = '' then
    begin
      Application.MessageBox('Informe a senha!', 'Anteção', 0 + 64);
      edSenha.Enabled := True;
      edSenha.SetFocus;
      Exit;
    end
    else if not GetOrCreateGlobaUser.validaSenha(edUsuario.Text, edSenha.Text) then
    begin
      Application.MessageBox('Usuário ou Senha inválidos, ou não existe. Verifique por favor!', 'Anteção', 0 + 64);
      edUsuario.Enabled := True;
      edUsuario.SetFocus;
      exit;
    end
    else
    begin
      if GetOrCreateGlobaUser.vEmpresa.dataSet.RecordCount > 1 then
      begin
        Label3.Visible := False;
        Label5.Visible := False;
        DBLookupComboBox1.Visible := True;
        DBLookupComboBox1.SetFocus;
        if GetOrCreateGlobaUser.vCodEmpPadrao > 0 then
          DBLookupComboBox1.KeyValue := GetOrCreateGlobaUser.vCodEmpPadrao
        else
          DBLookupComboBox1.KeyValue := GetOrCreateGlobaUser.vEmpresa.dataSet.FieldByName('cod_empresa').AsInteger;
        BitBtn3.Visible := True;
        BitBtn1.Visible := False;
        SpeedButton1.Visible := False;
      end
      else
      begin
        GetOrCreateGlobaUser.setEmpresaSelecionada(Trim(edUsuario.Text));

        if not GetOrCreateGlobaUser.verificarHorarioTrabalho(Trim(edUsuario.Text)) then
 				 	exit;

        with vDadosIni do if GetIni('MD', 'SLA', 'N') = 'S' then //SALVAR LOGIN AUTOMATICAMENTE
          if _LerConfiguracoesRegistroString('LA', 'N') <> 'S' then
            if ShowConfirmacao('Salvar senha para proximo login') = IDYES then
            begin
              _GravaConfiguracoesString('LA', 'S');
              _GravaConfiguracoesString('S1', codifica(edUsuario.Text));
              _GravaConfiguracoesString('S2', codifica(edSenha.Text));
              _GravaConfiguracoesString('S3', codifica(codEmpresa));
            end;

        ModalResult := IDOK;
      end;
    end;
  //  else if (not DBLookupComboBox1.Visible) and (Trim(edUsuario.Text) = 'HW') then
  //  begin
  //    DBLookupComboBox1.Visible := True;
  //    DBLookupComboBox1.SetFocus;
  //    edUsuario.Enabled := False;
  //    edSenha.Enabled := False;
  //    exit;
  //  end
  //  else
  //    ModalResult := IDOK;

  finally
    if not DBLookupComboBox1.Visible then
    begin
      edUsuario.Enabled := True;
      edSenha.Enabled := True;
    end;
  end;
end;

procedure TFrmEntrada.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmEntrada.BitBtn3Click(Sender: TObject);
begin
  GetOrCreateGlobaUser.setEmpresaSelecionada(Trim(edUsuario.Text));

  if not GetOrCreateGlobaUser.verificarHorarioTrabalho(Trim(edUsuario.Text)) then
  	exit;

  ModalResult := IDOK;
end;

procedure TFrmEntrada.BitBtn4Click(Sender: TObject);
begin
  TForm(pnEmpPadrao.Parent).ModalResult := IDOK;
end;

procedure TFrmEntrada.BitBtn5Click(Sender: TObject);
begin
  TForm(pnEmpPadrao.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmEntrada.edUsuarioEnter(Sender: TObject);
begin
  if Assigned(timerOneInstance) then
    setTimeOutNow;
end;

procedure TFrmEntrada.edUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
  if Assigned(timerOneInstance) then
    setTimeOutNow;
end;

procedure TFrmEntrada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Trim(vDadosIni.vModoTreino) = '' then
    vDadosIni.vModoTreino := 'N';
  action := cafree;
  //ObUser.Free;
end;

procedure TFrmEntrada.FormCreate(Sender: TObject);
begin
  //OnbUser := TUsuario.Create;
  if UpperCase(vDadosIni.vChaveEmpresa) <> 'HW'then
  begin
    Caption := frmSplash.getFrasePrimeiraLetraMaiuscula(vDadosIni.vEmpDesNomeEmp);
  end;
  if FrmSplash <> nil then
    FrmSplash.Showmodal
end;

procedure TFrmEntrada.FormShow(Sender: TObject);
var
  sWinDir: AnsiString;
  nTam, i: Integer;
  vcodResposta, vcodResposta1, vCNPJ, vCNPJResposta, vCNPJResposta1: string;
  n_arquivo, auxstr, vcod, vgera: string;
  arq: TextFile;
begin
  DBLookupComboBox1.Visible := False;
  edUsuario.Enabled := True;
  edSenha.Enabled := True;
  edUsuario.Text := vDadosIni.vNomeUsuario;
  edSenha.Text := '';
  BitBtn3.Left := BitBtn1.Left;
  BitBtn3.Top := BitBtn1.Top;
  BitBtn1.Visible := True;
  BitBtn3.Visible := False;
  edUsuario.SetFocus;
  Tentativas := 0;
  if Trim(vDadosIni.vNomeUsuario) <> '' then
  begin
    Label5.Caption := 'Clique aqui para modificar a empresa padrão do usuário: ' + vDadosIni.vNomeUsuario;
    Label3.Caption := 'Clique aqui para modificar a senha do usuário: ' + vDadosIni.vNomeUsuario;
    Label3.Visible := True;
    Label5.Visible := True;
  end;
//  if vDadosIni.vStarColor<> '' then
//    Chart3.Gradient.StartColor := StrToInt64(vDadosIni.vStarColor);
//  if vDadosIni.vEndColor <> '' then
//    Chart3.Gradient.EndColor := StrToInt64(vDadosIni.vEndColor);
  if vDadosIni.vModoTreino <> '' then
    SpeedButton1.Visible := False;

  lbClose.Caption := '';
  if (IniConf.ReadStr('OneInstance', 'Ativo', 'N') = 'S')
    and (vDadosIni.vNomeUsuario = '') then
  begin
    timerOneInstance := TTimer.Create(Self);
    timerOneInstance.OnTimer := timerOneInstanceTimer;
    setTimeOutNow;
  end;

  if (IniConf.ReadStr('TrimAppMemorySize', 'Ativo', 'N') = 'S')
    and (vDadosIni.vNomeUsuario = '') then
  begin
    vDadosIni.TrimAppMemorySize;

    timerTrimAppSize := TTimer.Create(Self);
    timerTrimAppSize.Interval := 60 * 1000;
    timerTrimAppSize.OnTimer := timerTrimAppSizeTimerTimer;
    timerTrimAppSize.Enabled := True;
  end;
end;

procedure TFrmEntrada.Label3Click(Sender: TObject);
begin
  if AlterarSenha(pchar(vDadosIni.vBancoHW),pchar(vDadosIni.vNomeUsuario),StrToInt(vDadosIni.codEmpresa)) then
    GetOrCreateGlobaUser.registraaltersenha;
end;

procedure TFrmEntrada.Label5Click(Sender: TObject);
begin
  GetOrCreateGlobaUser.vEmpresa.getTodos(vDadosIni.vNomeUsuario);
  DBLookupComboBox2.KeyValue := GetOrCreateGlobaUser.vEmpresa.dataSet.FieldByName('cod_empresa').AsInteger;
  GetOrCreateGlobaUser.modificarEmpresaPadrao;
end;

procedure TFrmEntrada.setTimeOutNow;
begin
  lbClose.Caption := '';
  horaLabel := Time + EncodeTime(0, 0, 30, 0);
  horaClose := horaLabel + EncodeTime(0, 0, 30, 0);
  timerOneInstance.Enabled := False;
  timerOneInstance.Interval := 1000;
  timerOneInstance.Enabled := True;
end;

procedure TFrmEntrada.SpeedButton1Click(Sender: TObject);
var
  vBancoTemp: string;
  vVersaoHw: Integer;
  vVersaoProcessos: Integer;
  vBancoHWtemp: string;

  function testarConectarBancos: boolean;
  var
    vBanco1, vBanco2: string;
  begin
    Result := False;
    if Trim(vBancoTemp) = '' then
      if not InputQuery('Banco de Dados', 'Endereço do banco de dados:', vBancoTemp ) then
        Exit;
    vBanco1 := UpperCase(Trim(vBancoTemp));
    while vDadosIni.CountSubString(':', vBanco1) > 1 do
      vBanco1 := Copy(vBanco1, Pos(':', vBanco1) + 1 , Length(vBanco1));
    vBanco2 := UpperCase(Trim(vDadosIni.vBancoHW));
    while vDadosIni.CountSubString(':', vBanco2) > 1 do
      vBanco2 := Copy(vBanco2, Pos(':', vBanco2) + 1 , Length(vBanco2));

    if UpperCase(Trim(vBanco1)) = UpperCase(Trim(vBanco2)) then
    begin
      Result := False;
      Application.MessageBox(PChar('Enderenço do banco de dados de Treinamento não deve ser igual ao banco da empresa' + #13 +
       'Treinamento: ' + Trim(vBancoTemp) + #13 +
       'Empresa: ' + Trim(vDadosIni.vBancoHW)), 'Atenção', 0 + 64);
      Exit;
    end;

    if ExtractFilePath(UpperCase(Trim(vBanco1))) = ExtractFilePath(UpperCase(Trim(vBanco2))) then
    begin
      Result := False;
      Application.MessageBox(PChar('Diretório do banco de dados de Treinamento não deve ser igual ao da empresa' + #13 +
       'Treinamento: ' + ExtractFilePath((Trim(vBanco1))) + #13 +
       'Empresa: ' + ExtractFilePath((Trim(vBanco2)))), 'Atenção', 0 + 64);
      Exit;
    end;

    try
      Result := vDadosIni.conectaBanco(dtmAtivo.bancoHw, vBancoTemp, False);
    finally
      if not Result then
      begin
        vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, False);
        Application.MessageBox('Não foi possível conectar ao banco de Treinamento', 'Atenção', 0 + 64);
      end;
    end;
  end;

begin
  try
    Screen.Cursor := crHourGlass;
    vBancoTemp := Trim(vDadosIni.vBancoTreino);

    if Trim(vBancoTemp) <> '' then
      if Application.MessageBox(PChar('Banco de Treinamento configurado.' + #13 +
        Trim(vBancoTemp) + #13 +
        'Deseja continuar?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO ) <> IDYES then
        if Application.MessageBox('Deseja alterar endereço do banco de Treinamento?',
          'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = IDYES then
          vBancoTemp := '';

    if Trim(vBancoTemp) <> '' then
    begin
      if not testarConectarBancos then
        Exit;
      vDadosIni.vBancoTreino := vBancoTemp;
    end
    else
    begin
      GetOrCreateGlobaUser.vEmpresa.getTodos('HW');
      DBLookupComboBox2.KeyValue := GetOrCreateGlobaUser.vEmpresa.dataSet.FieldByName('cod_empresa').AsInteger;
      vDadosIni.vEmp.vCNPJ := GetOrCreateGlobaUser.getEmpresaTreinamento;

      vBancoTemp := _getEnderecoBancoTreino(PChar(vDadosIni.vEmp.vCNPJ));
      if Pos('OK', vBancoTemp) > 0 then
      begin
        vBancoTemp := Copy(vBancoTemp, Pos('|', vBancoTemp) + 1, Length(vBancoTemp));
        if Trim(vBancoTemp) <> '' then  // Existe banco retornado pelo webservice
        begin
          if not testarConectarBancos then // testa o banco retornado pelo webservice
          begin
            vBancoTemp := '';  // nao validou o banco retornado pelo webservice, entao limpa o endereco para o usuario digitar
            if not testarConectarBancos then  // valida o banco que vai ser digitado pelo usuario
              Exit;
          end;
        end
        else if not testarConectarBancos then  // webservice nao retornou nada, valida o banco que vai ser digitado pelo usuario
          Exit;
      end
      else
      begin
        Application.MessageBox(PChar('Erro ao obter dados do webservice. Erro: ' + vBancoTemp), 'Atenção', 0 + 64);
        vBancoTemp := '';
        if not testarConectarBancos then
          Exit;
      end;
      vDadosIni.vBancoTreino := vBancoTemp;
    end;
    vDadosIni.GravaIni('Banco', 'Treino', vDadosIni.vBancoTreino);

    try
      vBancoHWtemp:= vDadosIni.vBancoHW;
      vDadosIni.vBancoHW := vDadosIni.vBancoTreino;
      dtmAtivo.bancoHw.Connected := False;
      dtmEnt.verificaEstruturaBancoDeDados;
    finally
      vDadosIni.vBancoHW := vBancoHWtemp;
    end;

    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoTreino, True) then
    begin
      Exit;
      Abort;
    end;

    GetOrCreateGlobaUser.buscas.Close;
    GetOrCreateGlobaUser.buscas.Close;
    GetOrCreateGlobaUser.buscas.SQL.Text := 'select versaobancofiscal, versaobancohwf, versaobancohw, versaoprocessos from EMPDESVOLV where COD_EMPDES = 1';
    try
      GetOrCreateGlobaUser.buscas.Open;
      vVersaoHw := GetOrCreateGlobaUser.buscas.FieldByName('versaobancohw').AsInteger;
      vVersaoProcessos := GetOrCreateGlobaUser.buscas.FieldByName('versaoprocessos').AsInteger;
    except
      vVersaoHw := 0;
      vVersaoProcessos := 0;
    end;
    if vVersaoHw < vDadosIni.vVersaoBancoHw  then
    begin
      Application.MessageBox('Reestruturação do banco de dados pendente!!!', 'Atenção', 0 + 64);
      vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True);
      Exit;
    end;
    if vVersaoProcessos < vDadosIni.vVersaoTabelaProcessos  then
    begin
      Application.MessageBox('Reestruturação da Tabela de Processos pendente!!!', 'Atenção', 0 + 64);
      vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True);
      Exit;
    end;

    vDadosIni.vBancoHW := vDadosIni.vBancoTreino;

    vDadosIni.vModoTreino := 'S';
    SpeedButton1.Visible := False;
    if Trim(edUsuario.Text) = '' then
      edUsuario.Text := 'HW';
    if Trim(edSenha.Text) = '' then
      edSenha.Text := 'EUJJ';
    Application.MessageBox('Modo Treinamento ativado. Por favor entre no sistema com o usuário desejado', 'Atenção', 0 + 64);
  finally
    GetOrCreateGlobaUser.buscas.Close;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmEntrada.Timer1Timer(Sender: TObject);
begin
  if Tentativas > 3 then
  begin
    MessageDlg('Tentativas de acessar o sistema esgotadas, procure o responsável pelo sistema e verifique sua senha, evite transtorno.', mtInformation, [mbOk], 0);
    BitBtn2Click(Sender);
    Application.Terminate;
  end;
end;

procedure TFrmEntrada.timerOneInstanceTimer(Sender: TObject);
var
  sec: Integer;
begin
  if Time >= horaClose then
    Halt(0);

  if Time >= horaLabel then
    lbClose.Caption := FormatDateTime('s', horaClose - Time + EncodeTime(0, 0, 1, 0)) + 's'
  else
    lbClose.Caption := '';
end;

procedure TFrmEntrada.timerTrimAppSizeTimerTimer(Sender: TObject);
begin
  vDadosIni.TrimAppMemorySize;
end;

end.

