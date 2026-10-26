program HWNFCThread;

uses
  Vcl.SvcMgr,
  Vcl.Forms,
  uServiceThread in '..\fontes\uServiceThread.pas' {HWNFC_Thread: TService},
  uNFC_Types in '..\fontes\uNFC_Types.pas',
  uServiceConfig in '..\fontes\uServiceConfig.pas' {frmConfServicoNFC},
  uServiceConfigSerial in '..\fontes\uServiceConfigSerial.pas' {frConfiguraSerial},
  uServiceConfPosPrinter in '..\fontes\uServiceConfPosPrinter.pas' {frmConfPosPrinterServiceNFC},
  uServiceTest in '..\fontes\uServiceTest.pas' {frmNFCTest};

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //

//  Forms.Application.CreateForm(THWNFCServico, HWNFCServico);
  if (ParamStr(1) = 'GUI') or (ParamStr(1) = 'CONF') then
  begin
    Vcl.Forms.Application.Initialize;
    Vcl.Forms.Application.MainFormOnTaskbar := True;
    Vcl.Forms.Application.CreateForm(TfrmNFCTest, frmNFCTest);
    Vcl.Forms.Application.Run;
  end
  else
  begin
    if not Vcl.SvcMgr.Application.DelayInitialize or Vcl.SvcMgr.Application.Installing then
      Vcl.SvcMgr.Application.Initialize;
    Vcl.SvcMgr.Application.CreateForm(THWNFC_Thread, HWNFC_Thread);
    Vcl.SvcMgr.Application.Run;
  end;
end.
