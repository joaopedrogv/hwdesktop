unit uCadNFCe_ConfService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, StdCtrls, Buttons;

const
  EXETHREAD = 'HWNFCThread';
  EXENOTHREAD = 'HWNFCNoThread';
  EXENFCEOFF = 'HWNFCoffline';

  SERV_THREAD = 'HWNFC_Thread';
  SERV_NOTHREAD = 'HWNFC_NoThread';
  SERV_NFCEOFF = 'HWNFC_Offline';

type
  TfrmCadNFCe_ConfService = class(TfrmPadrao)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    bt_aut_start: TBitBtn;
    bt_aut_stop: TBitBtn;
    GroupBox2: TGroupBox;
    bt_imp_start: TBitBtn;
    bt_imp_stop: TBitBtn;
    BitBtn7: TBitBtn;
    bt_aut_inst: TBitBtn;
    bt_aut_des: TBitBtn;
    bt_imp_des: TBitBtn;
    bt_imp_inst: TBitBtn;
    bt_aut_conf: TBitBtn;
    bt_imp_conf: TBitBtn;
    GroupBox3: TGroupBox;
    bt_off_start: TBitBtn;
    bt_off_stop: TBitBtn;
    bt_off_des: TBitBtn;
    bt_off_inst: TBitBtn;
    bt_off_conf: TBitBtn;
    Panel2: TPanel;
    pnConf: TPanel;
    Panel3: TPanel;
    memoConf: TMemo;
    BitBtn3: TBitBtn;
    procedure bt_off_confClick(Sender: TObject);
    procedure bt_off_stopClick(Sender: TObject);
    procedure bt_off_startClick(Sender: TObject);
    procedure bt_off_desClick(Sender: TObject);
    procedure bt_off_instClick(Sender: TObject);
    procedure bt_imp_confClick(Sender: TObject);
    procedure bt_imp_instClick(Sender: TObject);
    procedure bt_imp_desClick(Sender: TObject);
    procedure bt_aut_desClick(Sender: TObject);
    procedure bt_aut_instClick(Sender: TObject);
    procedure bt_aut_confClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn7Click(Sender: TObject);
    procedure bt_imp_stopClick(Sender: TObject);
    procedure bt_imp_startClick(Sender: TObject);
    procedure bt_aut_stopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_aut_startClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    function ServiceStart( sMachine, sService : string ) : boolean;
    function ServiceStop( sMachine, sService : string ) : boolean;
    function ServiceRunning( sMachine, sService : string ) : boolean;
    procedure instalarServico(servico: string);
    procedure desinstalarServico(servico: string);
    procedure configurarServico(servico: string);


    procedure CheckControles;
  public
    { Public declarations }
  end;

var
  frmCadNFCe_ConfService: TfrmCadNFCe_ConfService;

implementation

uses StrUtils, hw_utils, uDtmAtivo, WinSvc, uDadosIni;

{$R *.dfm}

procedure TfrmCadNFCe_ConfService.bt_aut_confClick(Sender: TObject);
begin
  inherited;
  configurarServico(EXETHREAD);
end;

procedure TfrmCadNFCe_ConfService.bt_aut_desClick(Sender: TObject);
begin
  inherited;
  desinstalarServico(EXETHREAD);
end;

procedure TfrmCadNFCe_ConfService.bt_aut_instClick(Sender: TObject);
begin
  inherited;
  instalarServico(EXETHREAD);
end;

procedure TfrmCadNFCe_ConfService.bt_imp_confClick(Sender: TObject);
begin
  inherited;
  configurarServico(EXENOTHREAD);
end;

procedure TfrmCadNFCe_ConfService.bt_imp_desClick(Sender: TObject);
begin
  inherited;
  desinstalarServico(EXENOTHREAD);
end;

procedure TfrmCadNFCe_ConfService.bt_imp_instClick(Sender: TObject);
begin
  inherited;
  instalarServico(EXENOTHREAD);
end;

procedure TfrmCadNFCe_ConfService.bt_off_confClick(Sender: TObject);
begin
  inherited;
  memoConf.Lines.Clear;
  memoConf.Lines.Add('# Preencher no Config.ini do sistema as variaveis que faltam');
  memoConf.Lines.Add('[Banco]');
  memoConf.Lines.Add('HW=ip_local:c:\bases\seubanco.fdb');
  memoConf.Lines.Add('LogNFCeOff=ip_local:c:\bases\seubanco_de_log.fdb');
  memoConf.Lines.Add('CharSet=');
  memoConf.Lines.Add('');
  memoConf.Lines.Add('# O CharSet deve ser identificado no banco');
  memoConf.Lines.Add('# de dados qual o correto, e colocado aqui,');
  memoConf.Lines.Add('# alguns exemplos (ISO8859_1, WIN1252, etc)');
  memoConf.Lines.Add('');
  memoConf.Lines.Add('[NFCeSincOff]');
  memoConf.Lines.Add('Empresa=(Codigo da empresa))');
  memoConf.Lines.Add('Caixa=(Codigo do caixa emissor)');
  memoConf.Lines.Add('IntervaloMinutos=10');

  vDadosIni.abreForm('Configurações para Sincronização de NFCe''s e Serviço', pnConf, opFormsDefCadEsc);

  //configurarServico(EXENFCEOFF);
end;

procedure TfrmCadNFCe_ConfService.bt_off_desClick(Sender: TObject);
begin
  inherited;
  desinstalarServico(EXENFCEOFF);
end;

procedure TfrmCadNFCe_ConfService.bt_off_instClick(Sender: TObject);
begin
  inherited;
  instalarServico(EXENFCEOFF);
end;

procedure TfrmCadNFCe_ConfService.bt_off_startClick(Sender: TObject);
begin
  inherited;
  ServiceStart('', SERV_NFCEOFF);
  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.bt_off_stopClick(Sender: TObject);
begin
  inherited;
  ServiceStop('', SERV_NFCEOFF);
  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.BitBtn1Click(Sender: TObject);
const
  Files: array[1..8] of string = ('HWNFCNoThread.exe', 'HWNFCThread.exe', 'auditoria.dll', 'cons40.dll', 'hw.nfe.dx.dll', 'Config.Ini', 'HWNFC.ini', 'PosPrinter.ini');
var
  DirInst, Diretorio, FileName: string;
  I: Integer;
begin
  inherited;
  DirInst   := ExtractFilePath(Application.ExeName);
  Diretorio := DirInst + 'NFCeService';

  if not DirectoryExists(Diretorio) then
    CreateDir(Diretorio);

  if not DirectoryExists(Diretorio) then
  begin
    ShowMessage('Pasta "NFCeService" não pode ser criada no diretório de instalação. Crie a pasta manualmente por favor');
    Exit;
  end;

  Diretorio := Diretorio + '\';

  for I := Low(Files) to High(Files) do
  begin
    FileName := Files[I];
    if FileExists(DirInst + FileName) then
      CopyFile(PChar(DirInst + FileName), PChar(Diretorio + FileName), False)
    else if not MatchText(FileName, ['HWNFC.ini', 'PosPrinter.ini']) then
    begin
      ShowAtencao('Arquivo "%s" não encontrado no diretório de instalação. Por Favor instale manualmente', [FileName]);
      Exit;
    end;
  end;

  vDadosIni.CreateProcessSimple(Diretorio +  'HWNFCNoThread.exe /install /silent', True);
  vDadosIni.CreateProcessSimple(Diretorio +  'HWNFCThread.exe /install /silent', True);
  
  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.BitBtn2Click(Sender: TObject);
const
  Files: array[1..8] of string = ('HWNFCNoThread.exe', 'HWNFCThread.exe', 'auditoria.dll', 'cons40.dll', 'hw.nfe.dx.dll', 'Config.Ini', 'HWNFC.ini', 'PosPrinter.ini');
var
  DirInst, Diretorio, FileName: string;
  I: Integer;
begin
  inherited;
  DirInst   := ExtractFilePath(Application.ExeName);
  Diretorio := DirInst + 'NFCeService';

  if not DirectoryExists(Diretorio) then
    CreateDir(Diretorio);

  if not DirectoryExists(Diretorio) then
  begin
    ShowMessage('Pasta "NFCeService" não existe');
    Exit;
  end;
  Diretorio := Diretorio + '\';

  vDadosIni.CreateProcessSimple(Diretorio +  'HWNFCNoThread.exe /uninstall /silent', True);
  vDadosIni.CreateProcessSimple(Diretorio +  'HWNFCThread.exe /uninstall /silent', True);

  for I := Low(Files) to High(Files) do
  begin
    FileName := Files[I];
    if FileExists(DirInst + FileName) then
      DeleteFile(PChar(Diretorio + FileName));
  end;

  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.bt_aut_startClick(Sender: TObject);
begin
  inherited;
  ServiceStart('', SERV_THREAD);
  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.bt_aut_stopClick(Sender: TObject);
begin
  inherited;
  ServiceStop('', SERV_THREAD);
  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.bt_imp_startClick(Sender: TObject);
begin
  inherited;
  ServiceStart('', SERV_NOTHREAD);
  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.bt_imp_stopClick(Sender: TObject);
begin
  inherited;
  ServiceStop('', SERV_NOTHREAD);
  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.BitBtn7Click(Sender: TObject);
var
  FileName: string;
begin
  inherited;
  FileName := ExtractFilePath(Application.ExeName) + 'NFCeService\HWNFCThread.exe';

  if not FileExists(FileName) then
  begin
    ShowMessage('Serviço não instalado no diretório "NFCeService" dentro da pasta de instalação');
    Exit;
  end;

  vDadosIni.CreateProcessSimple(FileName +  ' CONF', True);
end;

procedure TfrmCadNFCe_ConfService.CheckControles;
begin

  BitBtn1.Enabled := not FileExists(ExtractFilePath(Application.ExeName) + 'NFCeService\HWNFCThread.exe');
  BitBtn2.Enabled := not BitBtn1.Enabled;

  bt_aut_inst.Enabled := not FileExists(ExtractFilePath(Application.ExeName) + 'NFCeService\' + EXETHREAD + '.exe');
  bt_aut_des.Enabled := not bt_aut_inst.Enabled;
  bt_aut_start.Enabled := ((not ServiceRunning('', SERV_THREAD)) and (bt_aut_des.Enabled));
  bt_aut_stop.Enabled := (not bt_aut_start.Enabled) and (bt_aut_des.Enabled);
  bt_aut_conf.Enabled := bt_aut_des.Enabled;

  bt_imp_inst.Enabled := not FileExists(ExtractFilePath(Application.ExeName) + 'NFCeService\' + EXENOTHREAD + '.exe');
  bt_imp_des.Enabled := not bt_imp_inst.Enabled;
  bt_imp_start.Enabled := ((not ServiceRunning('', SERV_NOTHREAD)) and (bt_imp_des.Enabled));
  bt_imp_stop.Enabled := (not bt_imp_start.Enabled) and (bt_imp_des.Enabled);
  bt_imp_conf.Enabled := bt_imp_des.Enabled;

  bt_off_inst.Enabled := not FileExists(ExtractFilePath(Application.ExeName) + 'NFCeService\' + EXENFCEOFF + '.exe');
  bt_off_des.Enabled := not bt_off_inst.Enabled;
  bt_off_start.Enabled := ((not ServiceRunning('', SERV_NFCEOFF)) and (bt_off_des.Enabled));
  bt_off_stop.Enabled := (not bt_off_start.Enabled) and (bt_off_des.Enabled);
  bt_off_conf.Enabled := bt_off_des.Enabled;

  BitBtn7.Enabled := BitBtn2.Enabled;
end;

procedure TfrmCadNFCe_ConfService.configurarServico(servico: string);
var
  FileName: string;
begin
  inherited;
  FileName := ExtractFilePath(Application.ExeName) + 'NFCeService\' + servico + '.exe';

  if not FileExists(FileName) then
  begin
    ShowMessage('Serviço não instalado no diretório "NFCeService" dentro da pasta de instalação');
    Exit;
  end;

  vDadosIni.CreateProcessSimple(FileName +  ' CONF', True);
end;

procedure TfrmCadNFCe_ConfService.desinstalarServico(servico: string);
const
  Files: array[1..14] of string = ('HWNFCNoThread.exe', 'HWNFCThread.exe', 'HWNFCeOff.exe',
                                   'auditoria.dll', 'cons40.dll', 'hw.nfe.dx.dll', 'hw.utils.dx.dll', 'HwScript.dll',
                                   'hw.auditoria.dx.dll', 'Compacta.dll', 'MD5XE3.dll', 'Config.Ini', 'HWNFC.ini', 'PosPrinter.ini');
var
  DirInst, Diretorio, FileName: string;
  I: Integer;
begin
  inherited;
  DirInst   := ExtractFilePath(Application.ExeName);
  Diretorio := DirInst + 'NFCeService';

  if not DirectoryExists(Diretorio) then
    CreateDir(Diretorio);

  if not DirectoryExists(Diretorio) then
  begin
    ShowMessage('Pasta "NFCeService" não existe');
    Exit;
  end;
  Diretorio := Diretorio + '\';

  vDadosIni.CreateProcessSimple(Diretorio + servico + '.exe /uninstall /silent', True);

  FileName := Diretorio + servico + '.exe';
  if FileExists(DirInst + ExtractFileName(FileName)) then
    DeleteFile(PChar(FileName));

  if (not FileExists(Diretorio + EXETHREAD + '.exe')) and
     (not FileExists(Diretorio + EXENOTHREAD + '.exe')) and
     (not FileExists(Diretorio + EXENFCEOFF + '.exe')) then
    for I := Low(Files) to High(Files) do
    begin
      FileName := Files[I];
      if FileExists(DirInst + FileName) then
        DeleteFile(PChar(Diretorio + FileName));
    end;

  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadNFCe_ConfService := nil;
end;

procedure TfrmCadNFCe_ConfService.FormShow(Sender: TObject);
begin
  inherited;
  CheckControles;
end;

procedure TfrmCadNFCe_ConfService.instalarServico(servico: string);
const
  Files: array[1..11] of string = ('auditoria.dll', 'cons40.dll', 'hw.nfe.dx.dll', 'hw.utils.dx.dll', 'HwScript.dll',
                                   'hw.auditoria.dx.dll', 'Compacta.dll', 'MD5XE3.dll', 'Config.Ini', 'HWNFC.ini', 'PosPrinter.ini');
var
  DirInst, Diretorio, FileName: string;
  I: Integer;
begin
  inherited;
  DirInst   := ExtractFilePath(Application.ExeName);
  Diretorio := DirInst + 'NFCeService';

  if not DirectoryExists(Diretorio) then
    CreateDir(Diretorio);

  if not DirectoryExists(Diretorio) then
  begin
    ShowMessage('Pasta "NFCeService" não pode ser criada no diretório de instalação. Crie a pasta manualmente por favor');
    Exit;
  end;

  Diretorio := Diretorio + '\';

  FileName := ExtractFilePath(Application.ExeName) + servico + '.exe';
  if not FileExists(FileName) then
  begin
    ShowAtencao('Arquivo "%s" não encontrado no diretório de instalação. Por Favor instale manualmente', [FileName]);
    Exit;
  end
  else
    CopyFile(PChar(DirInst + ExtractFileName(FileName)), PChar(Diretorio + ExtractFileName(FileName)), False);

  for I := Low(Files) to High(Files) do
  begin
    FileName := Files[I];
    if FileExists(DirInst + FileName) then
      CopyFile(PChar(DirInst + FileName), PChar(Diretorio + FileName), False)
    else if not MatchText(FileName, ['HWNFC.ini', 'PosPrinter.ini']) then
    begin
      ShowAtencao('Arquivo "%s" não encontrado no diretório de instalação. Por Favor instale manualmente', [FileName]);
      Exit;
    end;
  end;

  vDadosIni.CreateProcessSimple(Diretorio + servico + '.exe /install /silent', True);
  //vDadosIni.CreateProcessSimple(Diretorio +  '.exe /install /silent', True);
  
  CheckControles;
end;

function TfrmCadNFCe_ConfService.ServiceRunning(sMachine,
  sService: string): boolean;
var
  //
  // service control
  // manager handle
  schm,
  //
  // service handle
  schs   : SC_Handle;
  //
  // service status
  ss     : TServiceStatus;
  //
  // temp char pointer
  psTemp : PChar;
  //
  // check point
  dwChkP : DWord;
begin
  ss.dwCurrentState := 0;

  // connect to the service
  // control manager
  schm := OpenSCManager(
    PChar(sMachine),
    Nil,
    SC_MANAGER_CONNECT);

  // if successful...
  if(schm > 0)then
  begin
    // open a handle to
    // the specified service
    schs := OpenService(
      schm,
      PChar(sService),
      // we want to
      // start the service and
      SERVICE_START or
      // query service status
      SERVICE_QUERY_STATUS);

    // if successful...
    if(schs > 0)then
    begin
      psTemp := Nil;
//      if(StartService(
//           schs,
//           0,
//           psTemp))then
      begin
        // check status
        QueryServiceStatus(schs, ss);
      end;

      // close service handle
      CloseServiceHandle(schs);
    end;

    // close service control
    // manager handle
    CloseServiceHandle(schm);
  end;

  // return TRUE if
  // the service status is running
  Result :=
    SERVICE_RUNNING =
      ss.dwCurrentState;
end;

function TfrmCadNFCe_ConfService.ServiceStart(sMachine,
  sService: string): boolean;
var
  //
  // service control
  // manager handle
  schm,
  //
  // service handle
  schs   : SC_Handle;
  //
  // service status
  ss     : TServiceStatus;
  //
  // temp char pointer
  psTemp : PChar;
  //
  // check point
  dwChkP : DWord;
begin
  ss.dwCurrentState := 0;

  // connect to the service
  // control manager
  schm := OpenSCManager(
    PChar(sMachine),
    Nil,
    SC_MANAGER_CONNECT);

  // if successful...
  if(schm > 0)then
  begin
    // open a handle to
    // the specified service
    schs := OpenService(
      schm,
      PChar(sService),
      // we want to
      // start the service and
      SERVICE_START or
      // query service status
      SERVICE_QUERY_STATUS);

    // if successful...
    if(schs > 0)then
    begin
      psTemp := Nil;
      if(StartService(
           schs,
           0,
           psTemp))then
      begin
        // check status
        if(QueryServiceStatus(
             schs,
             ss))then
        begin
          while(SERVICE_RUNNING
            <> ss.dwCurrentState)do
          begin
            //
            // dwCheckPoint contains a
            // value that the service
            // increments periodically
            // to report its progress
            // during a lengthy
            // operation.
            //
            // save current value
            //
            dwChkP := ss.dwCheckPoint;

            //
            // wait a bit before
            // checking status again
            //
            // dwWaitHint is the
            // estimated amount of time
            // the calling program
            // should wait before calling
            // QueryServiceStatus() again
            //
            // idle events should be
            // handled here...
            //
            Sleep(ss.dwWaitHint);

            if(not QueryServiceStatus(
                 schs,
                 ss))then
            begin
              // couldn't check status
              // break from the loop
              break;
            end;

            if(ss.dwCheckPoint <
              dwChkP)then
            begin
              // QueryServiceStatus
              // didn't increment
              // dwCheckPoint as it
              // should have.
              // avoid an infinite
              // loop by breaking
              break;
            end;
          end;
        end;
      end;

      // close service handle
      CloseServiceHandle(schs);
    end;

    // close service control
    // manager handle
    CloseServiceHandle(schm);
  end;

  // return TRUE if
  // the service status is running
  Result :=
    SERVICE_RUNNING =
      ss.dwCurrentState;
end;

function TfrmCadNFCe_ConfService.ServiceStop(sMachine,
  sService: string): boolean;
var
  //
  // service control
  // manager handle
  schm,
  //
  // service handle
  schs   : SC_Handle;
  //
  // service status
  ss     : TServiceStatus;
  //
  // check point
  dwChkP : DWord;
begin
  // connect to the service
  // control manager
  schm := OpenSCManager(
    PChar(sMachine),
    Nil,
    SC_MANAGER_CONNECT);

  // if successful...
  if(schm > 0)then
  begin
    // open a handle to
    // the specified service
    schs := OpenService(
      schm,
      PChar(sService),
      // we want to
      // stop the service and
      SERVICE_STOP or
      // query service status
      SERVICE_QUERY_STATUS);

    // if successful...
    if(schs > 0)then
    begin
      if(ControlService(
           schs,
           SERVICE_CONTROL_STOP,
           ss))then
      begin
        // check status
        if(QueryServiceStatus(
             schs,
             ss))then
        begin
          while(SERVICE_STOPPED
            <> ss.dwCurrentState)do
          begin
            //
            // dwCheckPoint contains a
            // value that the service
            // increments periodically
            // to report its progress
            // during a lengthy
            // operation.
            //
            // save current value
            //
            dwChkP := ss.dwCheckPoint;

            //
            // wait a bit before
            // checking status again
            //
            // dwWaitHint is the
            // estimated amount of time
            // the calling program
            // should wait before calling
            // QueryServiceStatus() again
            //
            // idle events should be
            // handled here...
            //
            Sleep(ss.dwWaitHint);

            if(not QueryServiceStatus(
                 schs,
                 ss))then
            begin
              // couldn't check status
              // break from the loop
              break;
            end;

            if(ss.dwCheckPoint <
              dwChkP)then
            begin
              // QueryServiceStatus
              // didn't increment
              // dwCheckPoint as it
              // should have.
              // avoid an infinite
              // loop by breaking
              break;
            end;
          end;
        end;
      end;

      // close service handle
      CloseServiceHandle(schs);
    end;

    // close service control
    // manager handle
    CloseServiceHandle(schm);
  end;

  // return TRUE if
  // the service status is stopped
  Result :=
    SERVICE_STOPPED =
      ss.dwCurrentState;
end;

end.
