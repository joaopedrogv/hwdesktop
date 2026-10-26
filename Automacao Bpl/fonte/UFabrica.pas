unit UFabrica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Mask, FileCtrl, ExtCtrls,inifiles, uclassesFabrica;

type
  TFrmFabrica = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFabrica: TFrmFabrica;
  cadintegraFab: TFabrica;

implementation

uses uDtmAtivo, uDadosIni, UintegraHonda, URelHonda, funcoes;


{$R *.dfm}

procedure TFrmFabrica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(cadintegraFab) then
  begin
   cadintegraFab.free;
   cadintegraFab := nil;
  end;

  Action := caFree;
  if (FrmFabrica <> nil) then
  FrmFabrica.Free;
  FrmFabrica := nil;
end;

procedure TFrmFabrica.FormShow(Sender: TObject);
var
   hdTemp: THandle;
  formulario: TForm;
begin
  if ((vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'INTEGRAFABRICA')
  	or (vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'RELARQUIVOVENDAPORCHASSI')
  	or (vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'RELARQUIVOCLIENTES')
    or (vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'MONTARARQUIVOPEDIDO')
    or (vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'ASSOHONDAVENDAESTOQUE')) then
  begin
    if UpperCase(vDadosIni.vfabrica) <> 'HONDA' then
    begin
      try
        Timer2.Enabled := False;
        Application.MessageBox('Empresa não configurada para Usar Modulo de Fabrica "HONDA"!', 'Atenção', 0 + 64);
      finally
         Timer2.Enabled := True;
      end;
    end
    else
    begin
      if vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'INTEGRAFABRICA' then
      begin
         formulario := Funcoes.AbreForm('pkFabrica', 'TFrmIntegraHonda', hdTemp);
      end
      else if vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'RELARQUIVOVENDAPORCHASSI' then
      begin
        formulario := Funcoes.AbreForm('pkFabrica', 'TfrmRelHonda', hdTemp);
      end
      else if vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'RELARQUIVOCLIENTES' then
      begin
        formulario := Funcoes.AbreForm('pkFabrica', 'TfrmRelHonda', hdTemp);
      end
      else if vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'MONTARARQUIVOPEDIDO' then
      begin
        cadintegraFab.free;
        cadintegraFab := TFabricaHonda.create;
        cadintegraFab.MontarArquivoPedido(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2) , vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3));
      end
      else if vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'ASSOHONDAVENDAESTOQUE' then
      begin
         formulario := Funcoes.AbreForm('pkFabrica', 'TFrmEnvAssoHonda', hdTemp);
      end
    end;
  end
  else if vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'INTEGRAFABRICAYAMAHA' then
  begin
    if UpperCase(vDadosIni.vfabrica) <> 'YAMAHA' then
    begin
      try
        Timer2.Enabled := False;
        Application.MessageBox('Empresa não configurada para Usar Modulo de Fabrica "YAMAHA"!', 'Atenção', 0 + 64);
      finally
        Timer2.Enabled := True;
      end;
    end
    else
    begin
      if vDadosIni.getCampoPipe(UpperCase(vDadosIni.vPesquisa), 1) = 'INTEGRAFABRICAYAMAHA' then
      begin
         formulario := Funcoes.AbreForm('pkFabrica', 'TFrmIntegraYamaha', hdTemp);
      end
    end;
  end;

end;

procedure TFrmFabrica.Timer2Timer(Sender: TObject);
begin
 Close;
end;

initialization
  RegisterClass(TFrmFabrica);
finalization
  UnRegisterClass(TFrmFabrica);

end.
