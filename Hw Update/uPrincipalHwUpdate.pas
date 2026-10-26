unit uPrincipalHwUpdate;

interface

uses
  Windows, Messages, Classes, Controls, StdCtrls, Forms, Buttons, ExtCtrls, jpeg,
  XPMan, Dialogs, GifImageHw, Menus, Graphics, StrUtils;

const
  HW_MENS_UPDATE = WM_COPYDATA;
  /// Parametros HW_UPDATE
  ///  1 - atualizar
  ///  2 - verificar atualizações
  ///  3 - configurar
  ///  4 - passar versao
  ///  5 - forcar atualizacao


  /// Retorno das mensagens
  ///  0 - Sem resposta
  ///  1 - Mensagem recebida
  ///  2 - Programa em execução
  ///  3 - Atualização recebida com sucesso
  ///  4 - Sair do Sistema para atualizar
  ///  5 - HwGuardUp não encontrado
  ///  6 - Iniciando HwGuardUp não iniciado
  ///  7 - Versao ja atualizada

type

  TfrmHwUpdate = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Image1: TImage;
    Panel1: TPanel;
    XPManifest1: TXPManifest;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Label1: TLabel;
    Label4: TLabel;
    PopupMenu1: TPopupMenu;
    Verificaratualizaesagora1: TMenuItem;
    Verificaratualizaesviaarquivo1: TMenuItem;
    Forarinstalaodosistema1: TMenuItem;
    Montararquivoparainstalaooffline1: TMenuItem;
    Histricodeatualizaes1: TMenuItem;
    N1: TMenuItem;
    Configuraes1: TMenuItem;
    N2: TMenuItem;
    AbrirHwUpdate1: TMenuItem;
    timerFormularios: TTimer;
    procedure timerFormulariosTimer(Sender: TObject);
    procedure AbrirHwUpdate1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    fFormulario: string;

    procedure _hw_up_mensagen(var pMessage: TWMCopyData); message HW_MENS_UPDATE;

    procedure _hw_up_postMessageCharPassword(var Msg: TMessage); message WM_USER + 123;

    procedure _MakeRounded(Control: TWinControl; const Radius: SmallInt);
    procedure _preencheMemoStatus;
  public
    { Public declarations }
    vMainForm: Boolean;
  end;

var
  frmHwUpdate: TfrmHwUpdate;

implementation

uses uClassesHwUpdate, uConfigHwUpdate, uAtualizarViaWEB,
  uAtualizarViaarquivo, uInstalarVersao, SysUtils, uHistoricoHwUpdate;

{$R *.dfm}

procedure TfrmHwUpdate.AbrirHwUpdate1Click(Sender: TObject);
begin
  Application.MainForm.Visible := True;
end;

procedure TfrmHwUpdate.BitBtn1Click(Sender: TObject);
begin
  vAtHw._verificarAtualizacaoTimer;
end;

procedure TfrmHwUpdate.BitBtn2Click(Sender: TObject);
var
  vVersaoSw : string;
  vCopyDataStruct : TCopyDataStruct;
  vLista: TStringList;
  vProgRecep : THandle;
  vRetorno : integer;
begin

  vVersaoSw := PChar('0374');

  if not vAtHw.vConfig._getConfig(False) then
  begin
    Exit;
  end;

  if vAtHw.vConfig.VERSAO_INST <= vVersaoSw  then
  begin
    Exit;
  end;

  if vAtHw.vCopyFiles._novaVersaoAtualizador(vAtHw._getPathNovaVersao) then
  begin
    vProgRecep:=FindWindow('TfrmGuardUp', nil);
    if vProgRecep = 0 then
    begin
      if not FileExists(ExtractFilePath(Application.ExeName) + 'HwGuardUp.exe') then
      begin
        Application.MessageBox('Sistema incompleto. Falta HwGuardUp', 'Atenção', 0 + 64);
        Exit;
      end;

      WinExec(pchar( ExtractFilePath(Application.ExeName) + 'HwGuardUp.exe'), SW_HIDE);
      Application.MessageBox('Iniciando HwGuardUp que não estava em execução', 'Atenção', 0 + 64);
      Exit;
    end;

    vLista := TStringList.Create;
    vLista.Clear;
    vLista.Add('HwUpdate');
    vLista.Add(vVersaoSw);
    vLista.Text := vLista.Text + vAtHw.vCopyFiles.filesAtualizador.Text;
    vCopyDataStruct.dwData := 0; //use it to identify the message contents
    vCopyDataStruct.cbData := 1 + Length(vLista.Text) ;
    vCopyDataStruct.lpData := PChar(vLista.Text);
    vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@vCopyDataStruct));

    if vRetorno = 0 then
    begin
      Application.MessageBox('Sem resposta do HwGuardUp, HwUpdate precisa ser atualizado manualmente para prosseguir!', 'Atenção', 0 + 64);
      Halt(0);
      Exit;
    end
    else if vRetorno = 1 then
    begin
      Halt(0);
    end
    else if vRetorno = 2 then
    begin
      Application.MessageBox('HwGuardUp em execução. Aguarde alguns segundos e tente novamente!', 'Atenção', 0 + 64);
      Exit;
    end
    else
    begin
      Application.MessageBox('Tente novamente!', 'Atenção', 0 + 64);
      Exit;
    end;

  end;

end;

procedure TfrmHwUpdate.BitBtn3Click(Sender: TObject);
begin
  if vAtHw.vConfig._getConfig(False) then
  begin
    vAtHw.vUltVer._getVersao(vAtHw.vConfig.VERSAO_INST);
    vAtHw.vWS._enviaLogWebService(vAtHw.vConfig.CNPJ, vAtHw.vUltVer);
  end;
end;

procedure TfrmHwUpdate.FormCreate(Sender: TObject);
var
  MyMsg: Cardinal;
  Mutex: Cardinal;
begin
  //cria um mutex usando um nome único
  MyMsg := RegisterWindowMessage('HwUpdate.OnlyOne');
  Mutex := CreateMutex(nil, True, 'Global\HwUpdate.OnlyOne');

  //verifica se houve erro na criação
  if (Mutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then
    Halt(0); // cancela execução

  if ParamCount > 0 then
    if ParamStr(1) <> 'HW_MENS_CONFIGURAR' then
      Application.ShowMainForm := False;
  vAtHw := THwUpdate.create;
  vAtHw.trayIconHwAt.PopupMenu := PopupMenu1;

//  vProgRecep := FindWindow('TfrmGuardUp', nil);
//  if vProgRecep = 0 then
//  begin
//    if not FileExists(ExtractFilePath(Application.ExeName) + 'HwGuardUp.exe') then
//    begin
//      Application.MessageBox('Sistema incompleto. Falta HwGuardUp', 'Atenção', 0 + 64);
//      Exit;
//    end;
//
//    WinExec(pchar( ExtractFilePath(Application.ExeName) + 'HwGuardUp.exe'), SW_HIDE);
//  end;
end;

procedure TfrmHwUpdate.FormDestroy(Sender: TObject);
begin
  vAtHw.Free ;
  vAtHw := nil;
end;

procedure TfrmHwUpdate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Classes.ssAlt in Shift then
    if Key = VK_F4 then
      Key := 0;
end;

procedure TfrmHwUpdate.FormShow(Sender: TObject);
begin
  _preencheMemoStatus;
end;

procedure TfrmHwUpdate.Label2Click(Sender: TObject);
begin
//  Close;
  vAtHw._verificarHwUpdateAtivo;
  if vAtHw.vConfig.ATIVO = 0 then
  begin
    if Application.MessageBox('HwUpdate desativado. Deseja sair?', 'Confirmação', MB_ICONEXCLAMATION + MB_YESNO) = IDYES then
      Halt(0);    
  end
  else
    Application.MainForm.Visible := False;
end;

procedure TfrmHwUpdate.Label2MouseEnter(Sender: TObject);
begin
  Label2.Font.Color := clYellow;
end;

procedure TfrmHwUpdate.Label2MouseLeave(Sender: TObject);
begin
  Label2.Font.Color := clWhite;
end;

procedure TfrmHwUpdate.Label3Click(Sender: TObject);
begin
  if vAtHw.EmExecucao then
  begin
    Application.MessageBox('Hw Update esta realizando outra tarefa. Aguarde alguns minutos e tente novamente',
      'Atenção', 0 + 64);
    Exit;
  end;
  try
    vAtHw.EmExecucao := True;

    if vAtHw.vConfig._getConfig(False) then
    begin
      Application.CreateForm(TfrmConfigAtualizador, frmConfigAtualizador);
      frmConfigAtualizador.ShowModal;
      vAtHw._verificarHwUpdateAtivo;
    end;
  finally
    vAtHw.EmExecucao := False;
  end;
end;

procedure TfrmHwUpdate.Label3MouseEnter(Sender: TObject);
begin
  Label3.Font.Color := clYellow;
end;

procedure TfrmHwUpdate.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Color := clWhite;
end;

procedure TfrmHwUpdate.SpeedButton2Click(Sender: TObject);
begin
  if vAtHw.EmExecucao then
  begin
    Application.MessageBox('Hw Update esta realizando outra tarefa. Aguarde alguns minutos e tente novamente',
      'Atenção', 0 + 64);
    Exit;
  end;

  try
    vAtHw.EmExecucao := True;
    if not vAtHw.vConfig._getConfig(False) then
      Exit;

    if Trim(vAtHw.vConfig.CNPJ) = '' then
    begin
      Application.MessageBox('Sem configurações. Faça a configuração para continuar',
        'Atenção', 0 + 64);
      Exit;
    end;

    Application.CreateForm(TfrmAtualizarViaWEB, frmAtualizarViaWEB);
    frmAtualizarViaWEB.ShowModal;
  finally
    _preencheMemoStatus;
    vAtHw.EmExecucao := False;
  end;
end;

procedure TfrmHwUpdate.SpeedButton3Click(Sender: TObject);
begin
  if vAtHw.EmExecucao then
  begin
    Application.MessageBox('Hw Update esta realizando outra tarefa. Aguarde alguns minutos e tente novamente',
      'Atenção', 0 + 64);
    Exit;
  end;

  try
    vAtHw.EmExecucao := True;

    if not vAtHw.vConfig._getConfig(False) then
      Exit;

    if Trim(vAtHw.vConfig.CNPJ) = '' then
    begin
      Application.MessageBox('Sem configurações. Faça a configuração para continuar',
        'Atenção', 0 + 64);
      Exit;
    end;

    if not OpenDialog1.Execute then
      Exit;

    if not FileExists(OpenDialog1.FileName) then
    begin
      Application.MessageBox('Arquivo informado inválido',
        'Atenção', 0 + 64);
      Exit;
    end;

    Application.CreateForm(TfrmAtualizarViaArquivo, frmAtualizarViaArquivo);
    frmAtualizarViaArquivo.lbProcesso.Caption := OpenDialog1.FileName;
    frmAtualizarViaArquivo.lbProcesso.Visible := True;
    frmAtualizarViaArquivo.ShowModal;
  finally
    _preencheMemoStatus;
    vAtHw.EmExecucao := False;
  end;
end;

procedure TfrmHwUpdate.SpeedButton4Click(Sender: TObject);
begin   
  if vAtHw.EmExecucao then
  begin
    Application.MessageBox('Hw Update esta realizando outra tarefa. Aguarde alguns minutos e tente novamente',
      'Atenção', 0 + 64);
    Exit;
  end;

  try
    vAtHw.EmExecucao := True;

    if not vAtHw.vConfig._getConfig(False) then
      Exit;       

    if Trim(vAtHw.vConfig.CNPJ) = '' then
    begin
      Application.MessageBox('Sem configurações. Faça a configuração para continuar',
        'Atenção', 0 + 64);
      Exit;
    end;

    if Trim(vAtHw.vConfig.VERSAO_INST) = '' then
    begin
      Application.MessageBox('Sem versão para instalação', 'Atenção', 0 + 64);
      Exit;
    end;

    Application.CreateForm(TfrmInstalarVersao, frmInstalarVersao);
    frmInstalarVersao.ShowModal;
  finally
    _preencheMemoStatus;
    vAtHw.EmExecucao := False;
  end;
end;

procedure TfrmHwUpdate.SpeedButton5Click(Sender: TObject);
begin  
  if vAtHw.EmExecucao then
  begin
    Application.MessageBox('Hw Update esta realizando outra tarefa. Aguarde alguns minutos e tente novamente',
      'Atenção', 0 + 64);
    Exit;
  end;
  
  try
    vAtHw.EmExecucao := true;
    if vAtHw.vConfig._getConfig(False) then
    begin

      if Trim(vAtHw.vConfig.CNPJ) = '' then
      begin
        Application.MessageBox('Sem configurações. Faça a configuração para continuar',
          'Atenção', 0 + 64);
        Exit;
      end;

      if Trim(vAtHw.vConfig.VERSAO_INST) = '' then
      begin
        Application.MessageBox('Sem versão para montar arquivo', 'Atenção', 0 + 64);
        Exit;
      end;

      if SaveDialog1.Execute then
        vAtHw._prepararArquivoParaInstalarOffLine(SaveDialog1.FileName);
    end;
  finally
    _preencheMemoStatus;
    vAtHw.EmExecucao := false;
  end;
end;

procedure TfrmHwUpdate.SpeedButton6Click(Sender: TObject);
begin
  if vAtHw.EmExecucao then
  begin
    Application.MessageBox('Hw Update esta realizando outra tarefa. Aguarde alguns minutos e tente novamente',
      'Atenção', 0 + 64);
    Exit;
  end;
  try
    vAtHw.EmExecucao := true;
    if vAtHw.vConfig._getConfig(False) then
    begin

      if Trim(vAtHw.vConfig.CNPJ) = '' then
      begin
        Application.MessageBox('Sem configurações. Faça a configuração para continuar',
          'Atenção', 0 + 64);
        Exit;
      end;

      Application.CreateForm(TfrmHistoricoHwUpdate, frmHistoricoHwUpdate);
      frmHistoricoHwUpdate.ShowModal;
    end;
  finally
    _preencheMemoStatus;
    vAtHw.EmExecucao := false;
  end;
end;

procedure TfrmHwUpdate.timerFormulariosTimer(Sender: TObject);
begin
  try
    if not timerFormularios.Enabled then
      Exit;

    timerFormularios.Enabled := False;
    if ContainsStr(fFormulario, '|Forcar') and ContainsStr(fFormulario, 'TfrmAtualizarViaWEB') then
    begin
      Application.CreateForm(TfrmAtualizarViaWEB, frmAtualizarViaWEB);
      frmAtualizarViaWEB.Tag := 1;
      frmAtualizarViaWEB.CheckBox1.Checked := True;
      frmAtualizarViaWEB.ShowModal;
    end
    else if fFormulario = 'TfrmAtualizarViaWEB' then
    begin
      Application.CreateForm(TfrmAtualizarViaWEB, frmAtualizarViaWEB);
      frmAtualizarViaWEB.Tag := 1;
      frmAtualizarViaWEB.ShowModal;
    end
    else if ContainsStr(fFormulario, '|Forcar') and ContainsStr(fFormulario, 'TfrmInstalarVersao') then
    begin
    	Application.CreateForm(TfrmInstalarVersao, frmInstalarVersao);
      frmInstalarVersao.Tag := 1;
      frmInstalarVersao.ShowModal;
    end
    else if fFormulario = 'TfrmInstalarVersao' then
    begin
      Application.CreateForm(TfrmInstalarVersao, frmInstalarVersao);
      frmInstalarVersao.ShowModal;
    end
    else if fFormulario = 'Halt' then
    begin
      Halt(0);
    end;
    fFormulario := '';
  finally
    timerFormularios.Enabled := False;
    vAtHw.EmExecucao := False;
  end;
end;

procedure TfrmHwUpdate._hw_up_postMessageCharPassword(var Msg: TMessage);
var
  vFormIQ : TForm;
  vEdIQ : TEdit;
  i : integer;
begin
  vFormIQ := Screen.ActiveForm;

  if (vFormIQ <> nil) and (vFormIQ.Handle = GetLastActivePopup(Application.Handle) ) then
  begin
    vEdIQ := nil;
    i := 0;
    while (i < vFormIQ.ComponentCount) and (vEdIQ = nil) do
    begin
      if vFormIQ.Components[i] is TEdit then
        vEdIQ := TEdit(vFormIQ.Components[i]);

      Inc(i);
    end;

    if vEdIQ <> nil then
      vEdIQ.PasswordChar := '*';
  end
end;

procedure TfrmHwUpdate._MakeRounded(Control: TWinControl;
  const Radius: SmallInt);
  var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, Radius, Radius);
    Perform(EM_GETRECT, 0, lParam(@R));
    InflateRect(R, -5, -5);
    Perform(EM_SETRECTNP, 0, lParam(@R));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

procedure TfrmHwUpdate._preencheMemoStatus;
var
  vVersao, vDataVersao: string;
begin
  if vAtHw.vConfig._getConfig(False) then
    vAtHw.vUltVer._getVersao(vAtHw.vConfig.VERSAO_HW);

//  vAtHw.vSw.VERSAO := '0374';
//  vAtHw.vConfig.SITUACAO_INST :='DISPONIVEL';
//  vAtHw.vConfig.VERSAO_HW :='0376';
  vVersao := '???';
  vDataVersao := '??/??/????';
  if Trim(vAtHw.vSw.VERSAO) <> '' then
    vVersao := vAtHw.vSw.VERSAO;
  if Trim(vAtHw.vSw.DataVersao) <> '' then
    vDataVersao := vAtHw.vSw.DataVersao;

  if Trim(vAtHw.vSw.VERSAO) = '' then
    Label1.Caption := 'Sem dados do sistema'
  else if (Trim(vAtHw.vConfig.VERSAO_INST) > Trim(vAtHw.vSw.VERSAO)) and (Trim(vAtHw.vConfig.SITUACAO_INST) = 'INSTALADA') then
    Label1.Caption := 'Sistema Desatualizado'
  else if (Trim(vAtHw.vConfig.VERSAO_INST) > Trim(vAtHw.vSw.VERSAO)) and (Trim(vAtHw.vConfig.SITUACAO_INST) = 'DISPONIVEL') then
    Label1.Caption := 'Nova Versão pronta para Instalação'
  else if Trim(vAtHw.vConfig.VERSAO_HW) > Trim(vAtHw.vSw.VERSAO) then
    Label1.Caption := 'Nova Versão Disponível'
  else
    Label1.Caption := 'Sistema Atualizado';

  try
    Memo1.Visible := False;
    Memo1.Clear;
    Memo1.Lines.Add('Versão do sistema instalado: ');
    Memo1.Lines.Add(vAtHw.vConfig._getVersaoCaption(vVersao));
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Data da versão do sistema: ');
    Memo1.Lines.Add(vDataVersao);
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Última versão do sistema: ');
    Memo1.Lines.Add(vAtHw.vConfig._getVersaoCaption(vAtHw.vConfig.VERSAO_HW));
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Data da última Versão: ');
    if vAtHw.vUltVer.DATA_VERSAO > 0 then    
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy', vAtHw.vUltVer.DATA_VERSAO));
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Última consulta de versão: ');
    if vAtHw.vConfig.DATA_CONS_WS > 0 then    
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy', vAtHw.vConfig.DATA_CONS_WS));
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Ultima tentativa de atualização: ');
    if vAtHw.vUltVer.DATA_TENTATIVA_AT > 0 then    
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy', vAtHw.vUltVer.DATA_TENTATIVA_AT));
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Última atualização recebida: ');
    if vAtHw.vUltVer.DATA_DOWNLOAD > 0 then
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy', vAtHw.vUltVer.DATA_DOWNLOAD));
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Próxima consulta agendada: ');
    if vAtHw. vConfig.DATA_CONS_WS > 0 then
      Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy', vAtHw. vConfig.DATA_CONS_WS + 1));
  finally
    Memo1.Visible := True;
  end;
end;

procedure TfrmHwUpdate._hw_up_mensagen(var pMessage: TWMCopyData);
var
  vVersaoSw: string;
  vCopyDataStruct : TCopyDataStruct;
  vLista: TStringList;
  vProgRecep : THandle;
  vRetorno : integer;
begin

  if vAtHw.EmExecucao then
  begin
    pMessage.Result := 2;
    Exit;
  end;
  pMessage.Result := 1;
  vVersaoSw := PChar(pMessage.CopyDataStruct.lpData);

  if pMessage.CopyDataStruct.dwData = 1 then //Atualizar
  begin

    if not vAtHw.vConfig._getConfig(False) then
    begin
      pMessage.Result := 1;
      Exit;
    end;

    if vAtHw.vConfig.VERSAO_INST <= vVersaoSw  then
    begin
      pMessage.Result := 7;
      Exit;
    end;

    pMessage.Result := 4;
    vAtHw.EmExecucao := True;
    try
      vAtHw.vSw.VERSAO := vVersaoSw;
      fFormulario := 'TfrmInstalarVersao';
      timerFormularios.Enabled := True;
    except
    end;

  end
  else if pMessage.CopyDataStruct.dwData = 2 then //Verificar Atualizações
  begin
    try
      if vAtHw.vConfig._getConfig(False) then
      begin
        vAtHw.EmExecucao := True;
        vAtHw.vSw.VERSAO := vVersaoSw;
        if vAtHw._verificarAtualizacaoViaSuiteHw then
        begin

          pMessage.Result := 4;
          fFormulario := 'TfrmAtualizarViaWEB';
          timerFormularios.Enabled := True;
        end
        else
          vAtHw.EmExecucao := False;
      end;
    except
      vAtHw.EmExecucao := False;
    end;
  end
  else if pMessage.CopyDataStruct.dwData = 3 then //Configurar
  begin
    vAtHw.vSw.VERSAO := vVersaoSw;
    _preencheMemoStatus;
    Application.MainForm.Visible := True;
  end
  else if pMessage.CopyDataStruct.dwData = 4 then //Configurar
  begin
    vAtHw.vSw.VERSAO := vVersaoSw;
    _preencheMemoStatus;
  end
  else if pMessage.CopyDataStruct.dwData = 5 then //Forcar Atualizacao
  begin
  	if not vAtHw.vConfig._getConfig(False) then
    begin
      pMessage.Result := 1;
      Exit;
    end;

    if vAtHw.vConfig.STAND_ALONE = 'S' then
  	begin
    	try
        vAtHw.EmExecucao := True;
        vAtHw.vSw.VERSAO := vVersaoSw;
        if vAtHw._verificarAtualizacaoViaSuiteHw(True) then
        begin

          pMessage.Result := 4;
          fFormulario := 'TfrmAtualizarViaWEB|Forcar';
          timerFormularios.Enabled := True;
        end
        else
          vAtHw.EmExecucao := False;
      finally
        vAtHw.EmExecucao := False;
      end;
    end
    else
    begin
      pMessage.Result := 4;
      vAtHw.EmExecucao := True;
      try
        vAtHw.vSw.VERSAO := vVersaoSw;
        fFormulario := 'TfrmInstalarVersao|Forcar';
        timerFormularios.Enabled := True;
      except
      end;
    end;
  end;
end;

end.
