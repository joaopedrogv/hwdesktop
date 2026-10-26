unit uClasseExterna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uCupom, ShellAPI, Menus;

const
  WM_ICONTRAY = WM_USER + 1;

type
  TfrmSegundoPlano = class(TForm)
    BitBtn1: TBitBtn;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    VerificarSolicitaes1: TMenuItem;
    ResetaremcasodeErro1: TMenuItem;
    Timer2: TTimer;
    AbrirSistemaFiscal1: TMenuItem;
    N1: TMenuItem;
    procedure AbrirSistemaFiscal1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ResetaremcasodeErro1Click(Sender: TObject);
    procedure VerificarSolicitaes1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    TrayIconData: TNotifyIconData;
    nped: string;
    tipo: string;
    executando: boolean;
    pathReq, pathResp: string;
    requisicao, resposta: string;
    comunicFiscal: TComunic;
    function CreateProcessSimple(cmd: string): boolean;
    function IsFileInUse(fName: string): boolean;
    function respostaEmArquivo(valorResposta: string): boolean;
    function lerSolicitacaoEmArquivo: boolean;
    function enviaVendaProdCupom: boolean;
    procedure TrayMessage(var Msg: TMessage);
      message WM_ICONTRAY;
  public
    { Public declarations }
  end;

var
  frmSegundoPlano: TfrmSegundoPlano;

implementation
uses uPrincipalF, uDtmFiscalHwF, uDtmFiscal, Funcoes,
  udtmTef, uDtmConfigF, uDtmAtivo, uDtmEntrada, uDtmSincF,
  UDtmArqsDig, UdtmTerminalF, unFuncoesTEF, uDtmDAVF, uDadosIni,
  uDadosIniFiscal;

{$R *.dfm}

procedure TfrmSegundoPlano.AbrirSistemaFiscal1Click(Sender: TObject);
begin
  //  frmprincipalfiscal.Visible := true;
  //  frmprincipalfiscal.Refresh;
  if FindWindow('TfrmPrincipalFiscal', 'Sistema ECF - Teclado PDV') > 0 then
    SetForegroundWindow(FindWindow('TfrmPrincipalFiscal', 'Sistema ECF - Teclado PDV'))
  else if FindWindow('TfrmPrincipalFiscal', 'Sistema ECF - Teclado Padrão') > 0 then
    SetForegroundWindow(FindWindow('TfrmPrincipalFiscal', 'Sistema ECF - Teclado Padrão'))
  else
    CreateProcessSimple(Application.ExeName + ' pkFiscal TfrmPrincipalFiscal ' +
      vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' ' + vDadosIni.codifica('-s' +
        vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) + ' ' + vDadosIni.codifica('-e' +
        vDadosIni.codEmpresa) + ' -pFiscal');
end;

procedure TfrmSegundoPlano.BitBtn1Click(Sender: TObject);
begin
  comunicFiscal := TComunic.Create;
  frmprincipalfiscal.Visible := True;
  frmprincipalfiscal.Refresh;
  comunicFiscal.receberVendaDoRetaguardaPelaDll(StrToInt(nped), tipo);
  Sleep(1000);
  frmprincipalfiscal.Visible := False;
  frmprincipalfiscal.Refresh;
  frmprincipalfiscal.Visible := False;
  frmprincipalfiscal.Refresh;
end;

function TfrmSegundoPlano.CreateProcessSimple(cmd: string): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_SHOW;

  Result := CreateProcess(nil, PChar(cmd), nil, nil, false, CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil, nil, SUInfo, ProcInfo);

  if (Result) then
  begin
    WaitForSingleObject(ProcInfo.hProcess, 0);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function TfrmSegundoPlano.enviaVendaProdCupom: boolean;
begin
  frmPrincipalFiscal.Hide;
  frmprincipalfiscal.Visible := False;
  frmprincipalfiscal.Refresh;
  //  while frmPrincipalFiscal.Visible do
  //  begin
  //    frmPrincipalFiscal.Visible := false;
  //    frmPrincipalFiscal.Refresh;
  //    frmPrincipalFiscal.Hide;
  Sleep(500);
  //  end;
  comunicFiscal := TComunic.Create;
  frmprincipalfiscal.Visible := True;
  frmprincipalfiscal.Refresh;
  Result := comunicFiscal.receberVendaDoRetaguardaPelaDll(StrToInt(nped), tipo);
  //  while frmPrincipalFiscal.Visible do
  //  begin
  //    frmPrincipalFiscal.Visible := false;
  //    frmPrincipalFiscal.Refresh;
  //    frmPrincipalFiscal.Hide;
  Sleep(500);
  //  end;
  frmPrincipalFiscal.Hide;
  frmPrincipalFiscal.Visible := false;
  frmPrincipalFiscal.Refresh;
end;

procedure TfrmSegundoPlano.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := False;
  with TrayIconData do
  begin
    cbSize := SizeOf(TrayIconData);
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;
  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
end;

procedure TfrmSegundoPlano.FormShow(Sender: TObject);
var
  hdAtivo: THandle;
  hdConfigF: THandle;
  hdTEF: THandle;
  hdlFormPag: THandle;
  hdDavF: THandle;
  hdTerminalF: THandle;
  hdArqDig1: THandle;
  I: Integer;
  temp: string;
begin
  pathReq := ExtractFilePath(Application.ExeName) + 'Req';
  pathResp := ExtractFilePath(Application.ExeName) + 'Resp';
  executando := false;
  if not DirectoryExists(pathReq) then
    CreateDir(pathReq);
  if not DirectoryExists(pathResp) then
    CreateDir(pathResp);

  if FileExists(pathResp + '\resp.001') then
  begin
    if not IsFileInUse(pathResp + '\resp.001') then
      DeleteFile(PCHAR(pathResp + '\resp.001'))
    else
      Sleep(3000);
  end;
  if FileExists(pathResp + '\resp.001') then
    if not IsFileInUse(pathResp + '\resp.001') then
      DeleteFile(PCHAR(pathResp + '\resp.001'));

  try
    resposta := '';
    lerSolicitacaoEmArquivo;
  finally
    respostaEmArquivo(resposta);
  end;

  //Instanciando o pacote Ativo
  CarregaPacote('pkAtivosF', hdAtivo);
  dtmAtivo := TdtmAtivo.Create(dtmAtivo);

  //Instanciando DTM usados no Fiscal
  TSingleton(vDadosIniF) := TIni.GetInstance;
  vDadosIniF.vModoSistema := 'S';
  Application.createform(tfrmprincipalfiscal, frmprincipalfiscal);
  frmPrincipalFiscal.Show;
  if vDadosIniF.vRespModoSistema = '1' then
  begin
    Application.Terminate;
    Exit;
  end;
  frmPrincipalFiscal.Visible := False;
  frmPrincipalFiscal.Refresh;
  Timer2.Enabled := True;
  Timer1.Enabled := true;
end;

function TfrmSegundoPlano.IsFileInUse(fName: string): boolean;
var
  HFileRes: HFILE;
begin
  Result := false;
  if not FileExists(fName) then
  begin
    exit;
  end;
  HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE, 0 {this is the trick!}, nil,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
  begin
    CloseHandle(HFileRes);
  end;
end;

function TfrmSegundoPlano.lerSolicitacaoEmArquivo: boolean;
var
  arqReq001: TextFile;
  Linha, ret: string;
begin
  if FileExists(pathReq + '\req.001') then
  begin
    if IsFileInUse(pathReq + '\req.001') then
    begin
      resposta := 'EMUSO';
      Exit;
    end;
    AssignFile(arqReq001, pathReq + '\req.001');
    Reset(arqReq001);
    if EOF(arqReq001) then
    begin
      resposta := 'VAZIO';
      exit;
    end;
    ReadLn(arqReq001, Linha);
    requisicao := Linha;
    if UpperCase(requisicao) = 'ATV' then
    begin
      resposta := 'ATV';
      CloseFile(arqReq001);
      if resposta <> 'EMUSO' then
        DeleteFile(pathReq + '\req.001');
    end
    else if UpperCase(requisicao) = 'CUPOM' then
    begin
      ReadLn(arqReq001, Linha);
      if Trim(Linha) = '' then
      begin
        resposta := 'NPEDVAZIO';
        Exit;
      end;
      nped := Linha;
      ReadLn(arqReq001, Linha);
      if Trim(Linha) = '' then
      begin
        resposta := 'TIPOVAZIO';
        Exit;
      end;
      tipo := Linha;
      CloseFile(arqReq001);
      if resposta <> 'EMUSO' then
        DeleteFile(pathReq + '\req.001');
      if enviaVendaProdCupom then
        resposta := 'OK'
      else
        resposta := 'ERRO';
    end;
  end;
end;

procedure TfrmSegundoPlano.ResetaremcasodeErro1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  if FileExists(pathResp + '\resp.001') then
    if not IsFileInUse(pathResp + '\resp.001') then
      DeleteFile(PCHAR(pathResp + '\resp.001'));
  if FileExists(pathReq + '\req.001') then
    if IsFileInUse(pathReq + '\req.001') then
      DeleteFile(PCHAR(pathReq + '\req.001'));
  respostaEmArquivo('ATV');
  Application.Terminate;
end;

function TfrmSegundoPlano.respostaEmArquivo(valorResposta: string): boolean;
var
  arqResp001: TextFile;
begin
  if valorResposta = '' then
    Exit;
  if not FileExists(pathResp + '\resp.001') then
  begin
    if IsFileInUse(pathResp + '\resp.001') then
      Exit;
    AssignFile(arqResp001, pathResp + '\resp.001');
    Rewrite(arqResp001);
    WriteLn(arqResp001, valorResposta);
    CloseFile(arqResp001);
  end;
end;

procedure TfrmSegundoPlano.Timer1Timer(Sender: TObject);
var
  arqReq001: TextFile;
  Linha, ret: string;
begin
  //  if executando then
  //    Exit;
  try
    Timer1.Enabled := false;
    //    executando := true;
    resposta := '';
    try
      lerSolicitacaoEmArquivo;
    finally
      respostaEmArquivo(resposta);
    end;
  finally
    Timer1.Enabled := true;
    //    executando := false;
  end;
end;

procedure TfrmSegundoPlano.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := false;
  Application.MainForm.Visible := false;
end;

procedure TfrmSegundoPlano.TrayMessage(var Msg: TMessage);
begin
  case Msg.LParam of
    WM_RBUTTONDOWN:
      begin
        PopupMenu1.Popup(Mouse.CursorPos.X - Self.Left, Mouse.CursorPos.Y - Self.Left);
      end;
    WM_LBUTTONDOWN:
      begin
        PopupMenu1.Popup(Mouse.CursorPos.X - Self.Left, Mouse.CursorPos.Y - Self.Left);
      end;
    WM_LBUTTONDBLCLK:
      begin
        PopupMenu1.Popup(Mouse.CursorPos.X - Self.Left, Mouse.CursorPos.Y - Self.Left);
      end;
  end;
end;

procedure TfrmSegundoPlano.VerificarSolicitaes1Click(Sender: TObject);
begin
  Timer1Timer(Timer1);
end;

initialization
  RegisterClass(TfrmSegundoPlano);
finalization
  UnRegisterClass(TfrmSegundoPlano);

end.

