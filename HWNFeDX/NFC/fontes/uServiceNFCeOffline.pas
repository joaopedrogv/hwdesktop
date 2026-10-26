unit uServiceNFCeOffline;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs, 
  uNFC_Types, Registry, hw_win_utils, Vcl.ExtCtrls;

type

  THWNFC_Offline = class(TService)
    TimerSinc: TTimer;
    procedure ServiceExecute(Sender: TService);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceShutdown(Sender: TService);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceAfterUninstall(Sender: TService);
    procedure TimerSincTimer(Sender: TObject);
  private
    SincBusy: Boolean;
    function ConfiguracoesPreenchidas: Boolean;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  HWNFC_Offline: THWNFC_Offline;
  Utils         : TServiceUtils;


implementation

function nfce_serv_verificar_central_acoes_no_thread(CodigoEmpresa: Longint; token: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';
function cloud_sinc(paramsList: WideString): Longint; stdcall; external 'hw.utils.dx.dll';

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  HWNFC_Offline.Controller(CtrlCode);
end;

function THWNFC_Offline.ConfiguracoesPreenchidas: Boolean;
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);

  if (Utils.NFCeOff.EmpresaId = 0) or
    (Utils.NFCeOff.CaixaId = 0) or
    (Trim(Utils.NFCeOff.BancoHwauto) = '') or
    (Trim(Utils.NFCeOff.BancoLogNFCeOff) = '') then
    Result := False
  else
    Result := True;
end;

function THWNFC_Offline.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure THWNFC_Offline.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  Utils.SalvarLog('Servico Instalado');

  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'Serviço de sincronização NFCe - HwSistemas');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure THWNFC_Offline.ServiceAfterUninstall(Sender: TService);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  Utils.SalvarLog('Servico Desinstalado');
end;

procedure THWNFC_Offline.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  TimerSinc.Interval := 1000 * 10;
  TimerSinc.Enabled := True;
  Utils.SalvarLog('Servico Continuado');
end;

procedure THWNFC_Offline.ServiceCreate(Sender: TObject);
begin
  SincBusy := False;
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
end;

procedure THWNFC_Offline.ServiceDestroy(Sender: TObject);
begin
  if Utils <> nil then
    FreeAndNil(Utils);
end;

procedure THWNFC_Offline.ServiceExecute(Sender: TService);
begin
  while not Terminated do
    ServiceThread.ProcessRequests(True);
  {
  if Utils = nil then
  begin
    Utils := TServiceUtils.create(Self.Name);
    Utils.LerConfig;
  end;

  while not self.Terminated do
  begin
    if not ConfiguracoesPreenchidas then
    begin
      LogApp.Log(Self.Name + '_Status', 'Sem Configurações');
      Sleep(1000 * 30);
    end
    else
    begin
      Utils.LerConfig;
      LogApp.Log(Self.Name + '_Status', 'Ativo');

      var s:= Format(';silent=true;empresaId=%d;caixaId=%d', [Utils.NFCeOff.EmpresaId, Utils.NFCeOff.CaixaId]);

      cloud_sinc(WideString(s));

      Sleep(1000 * 60 * Utils.NFCeOff.IntervaloMinutos);
    end;
  end;
  }
end;

procedure THWNFC_Offline.ServicePause(Sender: TService; var Paused: Boolean);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  TimerSinc.Enabled := False;
  Utils.SalvarLog('Servico pausado');
end;

procedure THWNFC_Offline.ServiceShutdown(Sender: TService);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  TimerSinc.Enabled := False;
  Utils.SalvarLog('Service ShutDown');
end;

procedure THWNFC_Offline.ServiceStart(Sender: TService; var Started: Boolean);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);

  Utils.lerConfig;
  TimerSinc.Interval := 1000 * 10;
  TimerSinc.Enabled := True;
  if ConfiguracoesPreenchidas then
    Utils.SalvarLog('Servico Iniciado - Empresa %d - Caixa %d - Intervalor em minutos %d- Banco principal %s - Banco de log %s',
                    [Utils.NFCeOff.EmpresaId, Utils.NFCeOff.CaixaId, Utils.NFCeOff.IntervaloMinutos, Utils.NFCeOff.BancoHwauto, Utils.NFCeOff.BancoLogNFCeOff])
  else
    Utils.SalvarLog('Servico Iniciado - Sem configurações. Empresa %d - Caixa %d - Intervalor em minutos %d - Banco principal %s - Banco de log %s',
                    [Utils.NFCeOff.EmpresaId, Utils.NFCeOff.CaixaId, Utils.NFCeOff.IntervaloMinutos, Utils.NFCeOff.BancoHwauto, Utils.NFCeOff.BancoLogNFCeOff]);
end;

procedure THWNFC_Offline.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  TimerSinc.Enabled := False;
  Utils.SalvarLog('Servico Parado');
end;

procedure THWNFC_Offline.TimerSincTimer(Sender: TObject);
begin
  if SincBusy then
    Exit;

  if Self.Terminated then
    Exit;
  try
    SincBusy := True;

    if Utils = nil then
      Utils := TServiceUtils.create(Self.Name);
    Utils.LerConfig;

    if not ConfiguracoesPreenchidas then
    begin
      LogApp.Log(Self.Name + '_Status', 'Sem Configurações', True, True);
      TimerSinc.Interval := 1000 * 60;
    end
    else
    begin
      LogApp.Log(Self.Name + '_Status', 'Ativo', True, True);

      var s:= Format(';silent=true;empresaId=%d;caixaId=%d', [Utils.NFCeOff.EmpresaId, Utils.NFCeOff.CaixaId]);

      cloud_sinc(WideString(s));

      TimerSinc.Interval := 1000 * 60 * Utils.NFCeOff.IntervaloMinutos;
    end;

  finally
    SincBusy := False;
  end;
end;

end.
