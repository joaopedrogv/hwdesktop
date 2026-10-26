unit uServiceThread;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  ActiveX, uNFC_Types, Registry;

type

  THWNFC_Thread = class(TService)
    procedure ServiceDestroy(Sender: TObject);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceShutdown(Sender: TService);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceAfterUninstall(Sender: TService);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceExecute(Sender: TService);
  private
    { Private declarations }
    function ConfiguracoesPreenchidas: Boolean;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  HWNFC_Thread: THWNFC_Thread;
  Utils       : TServiceUtils;

implementation

function nfce_serv_verificar_central_acoes_thread(CodigoEmpresa: Longint; token: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  HWNFC_Thread.Controller(CtrlCode);
end;

function THWNFC_Thread.ConfiguracoesPreenchidas: Boolean;
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  if (Utils.Conf.CodEmpresa = 0) or (Trim(Utils.Conf.Token) = '') or (Trim(Utils.Conf.EnderecoBancoDeDados) = '') {or
    ( (not Utils.Conf.ServidorDeEnvioNFCe) and (not Utils.Conf.ServidorDeEnvioSAT)
      and (not Utils.Conf.ServidorDeImpressao) and (not Utils.Conf.ServidorDeEmail) )} then
    Result := False
  else
    Result := True;
end;

function THWNFC_Thread.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure THWNFC_Thread.ServiceAfterInstall(Sender: TService);
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
      Reg.WriteString('Description', 'Serviço de consumo de WebServices da NFCe - HwSistemas');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure THWNFC_Thread.ServiceAfterUninstall(Sender: TService);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  Utils.SalvarLog('Servico Desinstalado');
end;

procedure THWNFC_Thread.ServiceContinue(Sender: TService; var Continued: Boolean);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  Utils.SalvarLog('Servico Continuado');
end;

procedure THWNFC_Thread.ServiceCreate(Sender: TObject);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
end;

procedure THWNFC_Thread.ServiceDestroy(Sender: TObject);
begin
  if Utils <> nil then
    FreeAndNil(Utils);
end;

procedure THWNFC_Thread.ServiceExecute(Sender: TService);
var
  Retorno: Integer;
//  UltimoErroDll: string;
  SleepTime, SleepTimeConf: Smallint;
  //TimeUltimoErro, TimeAtual: TTime;
begin
  if Utils = nil then
  begin
    Utils := TServiceUtils.create(Self.Name);
    Utils.LerConfig;
  end;
  SleepTimeConf := 0;
  while not self.Terminated do
  begin
    if not ConfiguracoesPreenchidas then
      Sleep(5000)
    else
    begin
      SleepTime := Utils.Conf.SleepTimeServiceThread;
      if (Utils.Conf.ServidorDeEnvioNFCe) {or (Utils.Conf.ServidorDeEnvioSAT)}  then
      begin
        Retorno := nfce_serv_verificar_central_acoes_thread(Utils.Conf.CodEmpresa, PChar(Utils.Conf.Token));
        if Retorno > 1 then//encontrou registros para processar
          SleepTime := 100
        else if Retorno < 0 then//erro
          SleepTime := 1000;
        if Utils.Conf.LogRespostaServico then
          Utils.SalvarLog('Retorno ' + IntToStr(Retorno));
      end;
      Sleep(SleepTime);
      SleepTimeConf := SleepTimeConf + SleepTime;
      if SleepTimeConf >= (1000 * 60) then //60s
        Utils.LerConfig;
    end;
    ServiceThread.ProcessRequests(False);
  end;
end;

procedure THWNFC_Thread.ServicePause(Sender: TService; var Paused: Boolean);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  Utils.SalvarLog('Servico pausado');
end;

procedure THWNFC_Thread.ServiceShutdown(Sender: TService);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  Utils.SalvarLog('Service ShutDown');
end;

procedure THWNFC_Thread.ServiceStart(Sender: TService; var Started: Boolean);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);

  Utils.lerConfig;
  if ConfiguracoesPreenchidas then
    Utils.SalvarLog('Servico Iniciado Toke %s - NFCe %d - Email %d - Impressão %d', [Utils.Conf.Token,
                                          Integer(Utils.Conf.ServidorDeEnvioNFCe),
                                          Integer(Utils.Conf.ServidorDeEmail),
                                          Integer(Utils.Conf.ServidorDeImpressao)])
  else
    Utils.SalvarLog('Servico Iniciado - Sem configurações');
end;

procedure THWNFC_Thread.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  if Utils = nil then
    Utils := TServiceUtils.create(Self.Name);
  Utils.SalvarLog('Servico Parado');
end;

end.
