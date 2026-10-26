program HWNFCServiceLess;

uses
  Vcl.Forms,
  uServiceLess in '..\fontes\uServiceLess.pas' {frmNFCServiceLess},
  uNFC_Types in '..\fontes\uNFC_Types.pas',
  uServiceConfig in '..\fontes\uServiceConfig.pas' {frmConfServicoNFC},
  uServiceConfigSerial in '..\fontes\uServiceConfigSerial.pas' {frConfiguraSerial},
  uServiceConfPosPrinter in '..\fontes\uServiceConfPosPrinter.pas' {frmConfPosPrinterServiceNFC},
  uServiceTest in '..\fontes\uServiceTest.pas' {frmNFCTest},
  hw_win_utils in '..\..\..\Ativos\fonte\hw_win_utils.pas',
  System.SysUtils,
  hw_utils in '..\..\..\Ativos\fonte\hw_utils.pas';

{$R *.RES}

begin
  if ParamApp.Exists('killtask') then
  begin
    sleep(500);

    var hndl := ParamApp.Value('handle');
    var ihndl := Cardinal(StrToInt(hndl));
    KillProcess(ihndl);
  end
  else

  if (ParamStr(1) = 'LESS') or (ParamStr(1) = 'LOGSINCNFCE') then
  begin
    Vcl.Forms.Application.Initialize;
    Vcl.Forms.Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmNFCServiceLess, frmNFCServiceLess);
    Vcl.Forms.Application.Run;
  end
  else if (ParamStr(1) = 'GUI') or (ParamStr(1) = 'CONF') then
  begin
    Vcl.Forms.Application.Initialize;
    Vcl.Forms.Application.MainFormOnTaskbar := True;
    Vcl.Forms.Application.CreateForm(TfrmNFCTest, frmNFCTest);
    Vcl.Forms.Application.Run;
  end
  else
  begin
    Application.MessageBox('Parametro Incorreto("LESS" ou "LOGSINCNFCE")', 'Anteção', 0);
  end;
end.
