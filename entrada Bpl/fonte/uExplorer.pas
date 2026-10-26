unit uExplorer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls;

type
  TfrmExplorer = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Criarconenareadetrabalho1: TMenuItem;
    procedure BitBtn1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    formFiscal, formCxl, formCaixa, formSupervisor, formHwSac: TForm;
    hdFiscal, hdCxl, hdCaixa, hdSupervisor, hdHwSac: THandle;
    procedure verificaPacotesDisponiveis;
    function CreateProcessSimple(cmd: string): boolean;
  public
    { Public declarations }
  end;

var
  frmExplorer: TfrmExplorer;

implementation

uses uDtmEntrada, USenha, uClasseEntrada, USplash, funcoes, ShellAPI, uDtmAtivo;

{$R *.dfm}

procedure TfrmExplorer.BitBtn1Click(Sender: TObject);
begin
  CreateProcessSimple(Application.ExeName + ' pkAutomacao TfrmPrincipalS ' +
    vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' '+ vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) +' '+ vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pHwSac');
end;

procedure TfrmExplorer.BitBtn1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
TBitBtn(Sender).setfocus;
end;

procedure TfrmExplorer.BitBtn2Click(Sender: TObject);
begin
  CreateProcessSimple(Application.ExeName + ' pkFiscal TfrmPrincipalFiscal ' +
    vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' '+ vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) +' '+ vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pFiscal');
end;

procedure TfrmExplorer.BitBtn3Click(Sender: TObject);
begin
  CreateProcessSimple(Application.ExeName + ' pkSupervisor TFrmPrincipalSupervisor ' +
    vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' '+ vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) +' '+ vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pSupervisor');
end;

procedure TfrmExplorer.BitBtn4Click(Sender: TObject);
begin
  CreateProcessSimple(Application.ExeName + ' pkCaixaGeral TfrmPrincipal ' +
    vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' '+ vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) +' '+ vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pCaixa');
end;

procedure TfrmExplorer.BitBtn5Click(Sender: TObject);
begin
  CreateProcessSimple(Application.ExeName + ' pkCxl TFrmPrincipalCxl ' +
    vDadosIni.codifica('-u' + vDadosIni.vNomeUsuario) + ' '+ vDadosIni.codifica('-s' + vDadosIni.decodifica(vDadosIni.vSenhaUsuario)) +' '+ vDadosIni.codifica('-e' + vDadosIni.codEmpresa) + ' -pCxl');
end;

procedure TfrmExplorer.BitBtn6Click(Sender: TObject);
begin
  Application.Terminate;
  Abort;
end;

function TfrmExplorer.CreateProcessSimple(cmd: string): boolean;
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

procedure TfrmExplorer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if hdCxl <> 0 then
    UnloadPackage(hdCxl);
  if hdFiscal <> 0 then
    UnloadPackage(hdFiscal);
end;

procedure TfrmExplorer.FormCreate(Sender: TObject);
begin
  if dtmEnt = nil then
    dtmEnt := TdtmEnt.Create(dtmEnt);
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa,1) = 'LOGGOF' then
  begin
    vDadosIni.vPesquisa := '';
    dtmEnt.verificaEntrada;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmExplorer.FormShow(Sender: TObject);
begin
  //obUser := TUsuario.Create;
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TFrmEntrada, FrmEntrada);
  FrmEntrada.ShowModal;
  if FrmEntrada.ModalResult <> mrOK then
  begin
    Application.Terminate;
    Abort;
  end;
  verificaPacotesDisponiveis;
  StatusBar1.Panels[2].Text := 'Usuário: '+vDadosIni.vNomeUsuario;
end;

procedure TfrmExplorer.verificaPacotesDisponiveis;
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'pkFiscal.bpl') then
    BitBtn2.Enabled := false;
  if not FileExists(ExtractFilePath(Application.ExeName) + 'pkCxl.bpl') then
    BitBtn5.Enabled := false;
  if not FileExists(ExtractFilePath(Application.ExeName) + 'pkCaixaGeral.bpl') then
    BitBtn4.Enabled := false;
  if not FileExists(ExtractFilePath(Application.ExeName) + 'pkAutomacao.bpl') then
    BitBtn1.Enabled := false;
  if not FileExists(ExtractFilePath(Application.ExeName) + 'pkSupervisor.bpl') then
    BitBtn3.Enabled := false;
end;

initialization
  RegisterClass(TfrmExplorer);
finalization
  UnRegisterClass(TfrmExplorer);

end.

