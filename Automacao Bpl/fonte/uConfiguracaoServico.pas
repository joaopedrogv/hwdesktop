unit uConfiguracaoServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, uEditHw, Mask, UClassesConfig, Menus,
  Spin, ComCtrls, Grids, DBGrids;

type
  TfrmConfiguracaoServico = class(TForm)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Panel3: TPanel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    Bevel1: TBevel;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    Removerdobackup1: TMenuItem;
    Timer1: TTimer;
    SpinEdit1: TSpinEdit;
    Label18: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    GroupBox2: TGroupBox;
    MaskEdit1: TMaskEdit;
    BitBtn6: TBitBtn;
    BitBtn22: TBitBtn;
    PageControl2: TPageControl;
    tsBackupBanco: TTabSheet;
    tsLog: TTabSheet;
    tsAtualizacaoHwF: TTabSheet;
    tsBackupOutros: TTabSheet;
    pnBkp: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edbbkpDataBasePath: TEdit;
    edbbkpPathDestino: TEdit;
    ckbbbkpRemoverFbk: TCheckBox;
    cbbbkpFormaBackup: TComboBox;
    cbbbkpTipoSalvamento: TComboBox;
    edbbkpHoraBackup: TMaskEdit;
    cbbbkpStatus: TComboBox;
    edbbkpServerName: TEdit;
    edbbkpDataBase: TEdit;
    edbbkpDiaUltimoBkp: TMaskEdit;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    pnLog: TPanel;
    Panel4: TPanel;
    ListBox1: TListBox;
    Panel6: TPanel;
    BitBtn15: TBitBtn;
    pnTerminal: TPanel;
    Panel10: TPanel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    GroupBox6: TGroupBox;
    Label13: TLabel;
    Label20: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    cbtStatus: TComboBox;
    BitBtn5: TBitBtn;
    BitBtn21: TBitBtn;
    lbtHora: TListBox;
    mdtHora: TMaskEdit;
    edtEnderecoHW: TEdit;
    edtEnderecoHWF: TEdit;
    edtCodEmpresa: TEdit;
    pnBkpOutros: TPanel;
    ListBox2: TListBox;
    Panel7: TPanel;
    BitBtn14: TBitBtn;
    BitBtn16: TBitBtn;
    Panel8: TPanel;
    BitBtn17: TBitBtn;
    BitBtn20: TBitBtn;
    GroupBox4: TGroupBox;
    SpeedButton3: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    edobkpPathDestino: TEdit;
    edobkpHoraBkp: TMaskEdit;
    cbobkpStatus: TComboBox;
    cbobkpTipoSalvamento: TComboBox;
    edobkpDiaUltimoBkp: TMaskEdit;
    tsBuscaPreco: TTabSheet;
    pnBuscaPreco: TPanel;
    Panel9: TPanel;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    SpeedButton7: TSpeedButton;
    cbBpStatus: TComboBox;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    lbBpHora: TListBox;
    edBpHora: TMaskEdit;
    edBpBancoHw: TEdit;
    edBpCOdEmpresa: TEdit;
    BitBtn27: TBitBtn;
    tsHistorico: TTabSheet;
    pnHistorico: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    Label24: TLabel;
    edbbkpDiaUltimoBkpFin: TMaskEdit;
    Label26: TLabel;
    edobkpDiaUltimoBkpFin: TMaskEdit;
    GroupBox7: TGroupBox;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    SpeedButton6: TSpeedButton;
    Label27: TLabel;
    edbbkpPathDestinoExt: TEdit;
    SpeedButton8: TSpeedButton;
    ckbbbkpBackupAuditoria: TCheckBox;
    BitBtn12: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    imgInformation: TImage;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure cbobkpTipoSalvamentoExit(Sender: TObject);
    procedure cbbbkpTipoSalvamentoExit(Sender: TObject);
    procedure cbBpStatusExit(Sender: TObject);
    procedure cbtStatusExit(Sender: TObject);
    procedure cbobkpStatusExit(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure edtEnderecoHWFExit(Sender: TObject);
    procedure edtEnderecoHWExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure Removerdobackup1Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure cbbbkpFormaBackupExit(Sender: TObject);
    procedure cbbbkpStatusExit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    vTempPath: string;
  public
    { Public declarations }
    procedure FormShowBkp(Sender: TObject);
    procedure FormShowBkpOutros(Sender: TObject);
    procedure FormShowTerminal(Sender: TObject);
    procedure FormShowBuscaPreco(Sender: TObject);
    procedure FormShowLog(Sender: TObject);
  end;

var
  frmConfiguracaoServico: TfrmConfiguracaoServico;
  serviceHw: TConfigServiceHw;
  cont_hora: Integer;

implementation

uses UDtmConfig, FileCtrl, TlHelp32, SHFolder, Registry, uDtmAtivo, uDadosIni, IniFiles, WinSock, 
  hw_win_utils;

{$R *.dfm}

procedure TfrmConfiguracaoServico.BitBtn11Click(Sender: TObject);
  function GetSpecialFolderPath(folder: integer): string;
  const
    SHGFP_TYPE_CURRENT = 0;
  var
    path: array[0..MAX_PATH] of char;
  begin
    if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @path[0])) then
      Result := path
    else
      Result := '';
  end;

const
  ConfHwService: string = 'Software\Hw\Configuracao\HwService\';
  ConfHwGuard:   string = 'Software\Microsoft\Windows\CurrentVersion\Run';
var
	ArqConfig: TIniFile;
  Registro: TRegistry;
  vPathArq, vPcScale: string;
  vServer, vDatabase: string;
  AList: TStringList;
  I: Integer;
begin
  if not vDadosIni.PesqPros('CFG035', 'INSTALAR', '', '', '', serviceHw.buscas, True) then
    Exit;
  if not FileExists(ExtractFilePath(Application.ExeName) + 'HwServico.exe') then
    raise exception.Create('Arquivo principal HwServico.exe nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'Compacta.dll') then
    raise exception.Create('Arquivo auxiliar Compacta.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'CompativelHW.dll') then
    raise exception.Create('Arquivo auxiliar CompativelHW.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'auditoria.dll') then
    raise exception.Create('Arquivo auxiliar auditoria.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'hw.auditoria.dx.dll') then
    raise exception.Create('Arquivo auxiliar hw.auditoria.dx.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'cons40.dll') then
    raise exception.Create('Arquivo auxiliar cons40.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'PcScale.dll') then
    if not FileExists(vDadosIni._getSpecialFolderPath(CSIDL_SYSTEM)+ '\PcScale.dll') then
      raise exception.Create('Arquivo auxiliar PcScale.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'MD5XE3.dll') then
    raise exception.Create('Arquivo auxiliar MD5XE3.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'hw.nfe.dx.dll') then
    raise exception.Create('Arquivo auxiliar hw.nfe.dx.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'hw.utils.dx.dll') then
    raise exception.Create('Arquivo auxiliar hw.utils.dx.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'HwScript.dll') then
    raise exception.Create('Arquivo auxiliar HwScript.dll nâo encontrado');

  if not FileExists(ExtractFilePath(Application.ExeName) + 'HwGuard.exe') then
    raise exception.Create('Arquivo auxiliar HwGuard.exe nâo encontrado');

  if vDadosIni.KillTask('HwGuard.exe') > 0 then
    raise exception.Create('Processo do arquivo auxiliar HwGuard.exe nâo pode ser encerrado');

  if vDadosIni.KillTask('HwServico.exe') > 0 then
    raise exception.Create('Processo do arquivo principal HwServico.exe nâo pode ser encerrado');

  vPathArq := GetSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas';

  if not DirectoryExists(vPathArq) then
    CreateDir(vPathArq);

  if not DirectoryExists(vPathArq) then
    raise exception.Create('Diretório padrâo nâo encontrado e não criado: ' + vPathArq);

  sleep(2000);

  if FileExists(vPathArq + '\HwServico.exe') then
    DeleteFile(vPathArq + '\HwServico.exe');

  if FileExists(vPathArq + '\HwServico.exe') then
    raise exception.Create('Arquivo principal HwServico.exe esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\Compacta.dll') then
    DeleteFile(vPathArq + '\Compacta.dll');

  if FileExists(vPathArq + '\Compacta.dll') then
    raise exception.Create('Arquivo auxiliar Compacta.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\CompativelHW.dll') then
    DeleteFile(vPathArq + '\CompativelHW.dll');

  if FileExists(vPathArq + '\CompativelHW.dll') then
    raise exception.Create('Arquivo auxiliar CompativelHW.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\auditoria.dll') then
    DeleteFile(vPathArq + '\auditoria.dll');

  if FileExists(vPathArq + '\auditoria.dll') then
    raise exception.Create('Arquivo auxiliar auditoria.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\hw.auditoria.dx.dll') then
    DeleteFile(vPathArq + '\hw.auditoria.dx.dll');

  if FileExists(vPathArq + '\hw.auditoria.dx.dll') then
    raise exception.Create('Arquivo auxiliar hw.auditoria.dx.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\cons40.dll') then
    DeleteFile(vPathArq + '\cons40.dll');

  if FileExists(vPathArq + '\cons40.dll') then
    raise exception.Create('Arquivo auxiliar cons40.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\PcScale.dll') then
    DeleteFile(vPathArq + '\PcScale.dll');

  if FileExists(vPathArq + '\PcScale.dll') then
    raise exception.Create('Arquivo auxiliar PcScale.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\MD5XE3.dll') then
    DeleteFile(vPathArq + '\MD5XE3.dll');

  if FileExists(vPathArq + '\MD5XE3.dll') then
    raise exception.Create('Arquivo auxiliar MD5XE3.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\hw.utils.dx.dll') then
    DeleteFile(vPathArq + '\hw.utils.dx.dll');

  if FileExists(vPathArq + '\hw.utils.dx.dll') then
    raise exception.Create('Arquivo auxiliar hw.utils.dx.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\hw.nfe.dx.dll') then
    DeleteFile(vPathArq + '\hw.nfe.dx.dll');

  if FileExists(vPathArq + '\hw.nfe.dx.dll') then
    raise exception.Create('Arquivo auxiliar hw.nfe.dx.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\HwScript.dll') then
    DeleteFile(vPathArq + '\HwScript.dll');

  if FileExists(vPathArq + '\HwScript.dll') then
    raise exception.Create('Arquivo auxiliar HwScript.dll esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\HwGuard.exe') then
    DeleteFile(vPathArq + '\HwGuard.exe');

  if FileExists(vPathArq + '\HwGuard.exe') then
    raise exception.Create('Arquivo secundário HwGuard.exe esta sendo usado, operação cancelada');

  if FileExists(ExtractFilePath(Application.Exename) + 'HwService.ini') then
  begin
    try
      ArqConfig := TIniFile.Create(ExtractFilePath(Application.Exename) + 'HwService.ini');

      try
       	if (trim(ArqConfig.ReadString('BancoBkp', 'Forma', 'C')) = 'C')
        	and (trim(ArqConfig.ReadString('BancoBkp', 'Server', '')) + ':' + trim(ArqConfig.ReadString('BancoBkp', 'Database', '')) <> trim(vDadosIni.vBancoHW)) then
        begin
          vServer   := '';
          vDatabase := '';

        	AList := TStringList.Create;
          try
            AList := vDadosIni.Split(vDadosIni.vBancoHW, ':');
            if AList.Count >= 2 then
            begin
              vServer   := AList[0];
              vDatabase := '';
              for I := 1 to AList.Count - 1 do
                vDatabase := vDatabase + vDadosIni.IfThen(trim(vDatabase) = '', '', ':') + AList[I];
            end;
          finally
            FreeAndNil(AList);
          end;

        	ArqConfig.WriteString('BancoBkp', 'Server',   vServer);
          ArqConfig.WriteString('BancoBkp', 'Database', vDatabase);
        end;

      	if trim(ArqConfig.ReadString('BancoHw', 'Endereco', '')) <> trim(vDadosIni.vBancoHW) then
      		ArqConfig.WriteString('BancoHw', 'Endereco', trim(vDadosIni.vBancoHW));

        if trim(ArqConfig.ReadString('BancoHw', 'VerificarBackup', '')) <> trim(vDadosIni.vVerificarBackup) then
        	ArqConfig.WriteString('BancoHw', 'VerificarBackup', trim(vDadosIni.vVerificarBackup));

        if trim(ArqConfig.ReadString('BancoHw', 'TsPlus', '')) <> trim(vDadosIni.vTsPlus) then
        	ArqConfig.WriteString('BancoHw', 'TsPlus', trim(vDadosIni.vTsPlus));
      finally
        ArqConfig.Free;
      end;
    except
      raise exception.Create('Falha ao adicionar o endereço do banco ao HwService.ini, diretório: ' + vPathArq);
    end;
  end;

  if FileExists(vPathArq + '\HwService.ini') then
  begin
    try
      ArqConfig := TIniFile.Create(vPathArq + '\HwService.ini');

      try
        if (trim(ArqConfig.ReadString('BancoBkp', 'Forma', 'C')) = 'C')
        	and (trim(ArqConfig.ReadString('BancoBkp', 'Server', '')) + ':' + trim(ArqConfig.ReadString('BancoBkp', 'Database', '')) <> trim(vDadosIni.vBancoHW)) then
        begin
          vServer   := '';
          vDatabase := '';

        	AList := TStringList.Create;
          try
            AList := vDadosIni.Split(vDadosIni.vBancoHW, ':');
            if AList.Count >= 2 then
            begin
              vServer   := AList[0];
              vDatabase := '';
              for I := 1 to AList.Count - 1 do
                vDatabase := vDatabase + vDadosIni.IfThen(trim(vDatabase) = '', '', ':') + AList[I];
            end;
          finally
            FreeAndNil(AList);
          end;

        	ArqConfig.WriteString('BancoBkp', 'Server',   vServer);
          ArqConfig.WriteString('BancoBkp', 'Database', vDatabase);
        end;

      	if trim(ArqConfig.ReadString('BancoHw', 'Endereco', '')) <> trim(vDadosIni.vBancoHW) then
      		ArqConfig.WriteString('BancoHw', 'Endereco', trim(vDadosIni.vBancoHW));

        if trim(ArqConfig.ReadString('BancoHw', 'VerificarBackup', '')) <> trim(vDadosIni.vVerificarBackup) then
        	ArqConfig.WriteString('BancoHw', 'VerificarBackup', trim(vDadosIni.vVerificarBackup));

        if trim(ArqConfig.ReadString('BancoHw', 'TsPlus', '')) <> trim(vDadosIni.vTsPlus) then
        	ArqConfig.WriteString('BancoHw', 'TsPlus', trim(vDadosIni.vTsPlus));
      finally
        ArqConfig.Free;
      end;
    except
      raise exception.Create('Falha ao adicionar o endereço do banco ao HwService.ini, diretório: ' + vPathArq);
    end;
  end;

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'HwServico.exe'), Pchar(vPathArq + '\HwServico.exe'), False) then
    raise exception.Create('Falha ao copiar arquivo principal HwServico.exe para pasta padrâo: ' + vPathArq);

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'Compacta.dll'), Pchar(vPathArq + '\Compacta.dll'), False) then
    raise exception.Create('Falha ao copiar auxiliar Compacta.dll para pasta padrâo: ' + vPathArq);

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'CompativelHW.dll'), Pchar(vPathArq + '\CompativelHW.dll'), False) then
    raise exception.Create('Falha ao copiar auxiliar CompativelHW.dlll para pasta padrâo: ' + vPathArq);

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'auditoria.dll'), Pchar(vPathArq + '\auditoria.dll'), False) then
    raise exception.Create('Falha ao copiar auxiliar auditoria.dll para pasta padrâo: ' + vPathArq);

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'hw.auditoria.dx.dll'), Pchar(vPathArq + '\hw.auditoria.dx.dll'), False) then
    raise exception.Create('Falha ao copiar auxiliar hw.auditoria.dx.dll para pasta padrâo: ' + vPathArq);

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'cons40.dll'), Pchar(vPathArq + '\cons40.dll'), False) then
    raise exception.Create('Falha ao copiar auxiliar cons40.dll para pasta padrâo: ' + vPathArq);

  if not FileExists(ExtractFilePath(Application.ExeName) + 'PcScale.dll') then
    vPcScale := ExtractFilePath(Application.ExeName) + 'PcScale.dll'
  else if not FileExists(vDadosIni._getSpecialFolderPath(CSIDL_SYSTEM)+ '\PcScale.dll') then
    vPcScale := vDadosIni._getSpecialFolderPath(CSIDL_SYSTEM)+ '\PcScale.dll';

  if FileExists(vPcScale) then
    if not CopyFile(Pchar(vPcScale), Pchar(vPathArq + '\PcScale.dll'), False) then
      raise exception.Create('Falha ao copiar auxiliar PcScale.dll para pasta padrâo: ' + vPathArq); 

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'MD5XE3.dll'), Pchar(vPathArq + '\MD5XE3.dll'), False) then
    raise exception.Create('Falha ao copiar auxiliar MD5XE3.dll para pasta padrâo: ' + vPathArq);

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'hw.utils.dx.dll'), Pchar(vPathArq + '\hw.utils.dx.dll'), False) then
    raise exception.Create('Falha ao copiar auxiliar hw.utils.dx.dll para pasta padrâo: ' + vPathArq);

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'hw.nfe.dx.dll'), Pchar(vPathArq + '\hw.nfe.dx.dll'), False) then
    raise exception.Create('Falha ao copiar auxiliar hw.nfe.dx.dll para pasta padrâo: ' + vPathArq);

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'HwScript.dll'), Pchar(vPathArq + '\HwScript.dll'), False) then
    raise exception.Create('Falha ao copiar auxiliar HwScript.dll para pasta padrâo: ' + vPathArq);

  if not CopyFile(Pchar(ExtractFilePath(Application.ExeName) + 'HwGuard.exe'), Pchar(vPathArq + '\HwGuard.exe'), False) then
    raise exception.Create('Falha ao copiar secundário HwGuard.exe para pasta padrâo: ' + vPathArq);

  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(ConfHwService, True);
      Registro.WriteBool('HwServicoAtivado', True);
      Registro.WriteString('PathHwServico', vPathArq + '\HwServico.exe');
      Registro.WriteInteger('TimeSleepGuardSeconds', SpinEdit1.Value);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
    vdadosini.CreateProcessSimple(vPathArq + '\HwGuard.exe');
  except
  end;

  try
    try
      Registro := TRegistry.Create(KEY_WRITE); // Chama o construtor do objeto
      Registro.RootKey := HKEY_LOCAL_MACHINE; //Define a chave raiz
      Registro.OpenKey(ConfHwGuard, True); //Cria a chave
      Registro.WriteString('HwGuard', vPathArq + '\HwGuard.exe');
      //Grava o endereço da sua aplicação no Registro
      Registro.CloseKey; // Fecha a chave e o objeto
    finally
      Registro.Free;
    end;
  except
  end;
  Application.MessageBox('Processo concluído', 'Informação', 64);
  GroupBox3.Caption := 'Hw Service: ' + vDadosIni.IfThen(serviceHw.verificarSituacaoHwService, 'Rodando', 'Parado');
end;

procedure TfrmConfiguracaoServico.BitBtn12Click(Sender: TObject);
  function GetSpecialFolderPath(folder: integer): string;
  const
    SHGFP_TYPE_CURRENT = 0;
  var
    path: array[0..MAX_PATH] of char;
  begin
    if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @path[0])) then
      Result := path
    else
      Result := '';
  end;

const
  Conf: string = 'Software\Hw\Configuracao\HwService\';
var
  Registro: TRegistry;
  vPathArq: string;
begin
  if not vDadosIni.PesqPros('CFG036', 'DESINSTALAR', '', '', '', serviceHw.buscas, True) then
    Exit;

  if vDadosIni.KillTask('HwGuard.exe') > 0 then
    raise exception.Create('Processo do arquivo auxiliar HwGuard.exe nâo pode ser encerrado');

  if vDadosIni.KillTask('HwServico.exe') > 0 then
    raise exception.Create('Processo do arquivo principal HwServico.exe nâo pode ser encerrado');

  vPathArq := GetSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas';

  if not DirectoryExists(vPathArq) then
    CreateDir(vPathArq);

  if not DirectoryExists(vPathArq) then
    raise exception.Create('Diretório padrâo nâo encontrado e não criado: ' + vPathArq);

  sleep(2000);

  if FileExists(vPathArq + '\HwServico.exe') then
    DeleteFile(vPathArq + '\HwServico.exe');

  if FileExists(vPathArq + '\HwServico.exe') then
    raise
      exception.Create('Arquivo principal HwServico.exe esta sendo usado, operação cancelada');

  if FileExists(vPathArq + '\HwGuard.exe') then
    DeleteFile(vPathArq + '\HwGuard.exe');

  if FileExists(vPathArq + '\Compacta.dll') then
    DeleteFile(vPathArq + '\Compacta.dll');

  if FileExists(vPathArq + '\cons40.dll') then
    DeleteFile(vPathArq + '\cons40.dll');

  if FileExists(vPathArq + '\CompativelHW.dll') then
    DeleteFile(vPathArq + '\CompativelHW.dll');

  if FileExists(vPathArq + '\auditoria.dll') then
    DeleteFile(vPathArq + '\auditoria.dll');

  if FileExists(vPathArq + '\hw.auditoria.dx.dll') then
    DeleteFile(vPathArq + '\hw.auditoria.dx.dll');

  if FileExists(vPathArq + '\MD5XE3.dll') then
    DeleteFile(vPathArq + '\MD5XE3.dll');

  if FileExists(vPathArq + '\hw.utils.dx.dll') then
    DeleteFile(vPathArq + '\hw.utils.dx.dll');

  if FileExists(vPathArq + '\hw.nfe.dx.dll') then
    DeleteFile(vPathArq + '\hw.nfe.dx.dll');

  if FileExists(vPathArq + '\HwScript.dll') then
    DeleteFile(vPathArq + '\HwScript.dll');

  if FileExists(vPathArq + '\PcScale.dll') then
    DeleteFile(vPathArq + '\PcScale.dll');

  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf, True);
      Registro.WriteBool('HwServicoAtivado', False);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
    vdadosini.CreateProcessSimple(vPathArq + '\HwGuard.exe');
  except
  end;

  try
    try
      Registro := TRegistry.Create(KEY_WRITE); // Chama o construtor do objeto
      Registro.RootKey := HKEY_LOCAL_MACHINE; //Define a chave raiz
      Registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', True); //Cria a chave
      Registro.DeleteKey('HwGuard'); // Apaga a entrada de execução automatica
      Registro.CloseKey; // Fecha a chave e o objeto
    finally
      Registro.Free;
    end;
  except
  end;  
  Application.MessageBox('Processo concluído', 'Informação', 64);
  GroupBox3.Caption := 'Hw Service: Não Instalado';
end;

procedure TfrmConfiguracaoServico.BitBtn13Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  //serviceHw._abreFormLog;
  serviceHw._logServidor;
end;

procedure TfrmConfiguracaoServico.BitBtn14Click(Sender: TObject);
var
  vtemp: string;
begin
  vtemp := vTempPath;
  if SelectDirectory('Selecionar Pasta', '', vtemp) then
    if DirectoryExists(vtemp) then
    begin
      ListBox2.Items.Add('D|' + vtemp);
      vTempPath := vtemp;
    end;
end;

procedure TfrmConfiguracaoServico.BitBtn15Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  TForm(pnLog.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmConfiguracaoServico.BitBtn16Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := vTempPath;
  if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
    begin
      ListBox2.Items.Add('A|' + OpenDialog1.FileName);
      vTempPath := ExtractFilePath(OpenDialog1.FileName);
    end;
end;

procedure TfrmConfiguracaoServico.BitBtn17Click(Sender: TObject);
begin
  TForm(pnBkpOutros.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmConfiguracaoServico.BitBtn18Click(Sender: TObject);
var
  i: Integer;
  hora_ant, horas: string;
begin
  try
    i := 0;
    cont_hora := lbtHora.Count;

    if Trim(cbtStatus.Items[cbtStatus.itemIndex]) = '' then
      raise exception.create('Informe se o serviço de atualização de Terminal dados está ativado ou desativado');

    if (lbtHora.Items.Text = '') then
      raise exception.create('Informe a hora de atualização de Terminal');

    if (edtCodEmpresa.Text = '') then
      raise exception.create('Informe o codigo da empresa');

//    if not (fileexists(edtEnderecoHW.Text)) then
//    begin
//      Showmessage('Banco de dados hw não existe existe neste diretório');
//			if (Self.Enabled) and (Self.Visible) and (edEnderecoHw.CanFocus) then
//    	edtEnderecoHW.SetFocus;
//    end;

//    if not (DirectoryExists(edtEnderecoHWF.Text)) then
//    begin
//      Showmessage('Informe somente o caminho do Banco de dados hwf');
//      edtEnderecoHWF.SetFocus;
//    end;

//    if not (FileExists(edtEnderecoHWF.Text + '\hwf.fdb')) then
//    begin
//      Showmessage('Banco de dados hwf não existe existe neste diretório, ' +
//        QuotedStr(edtEnderecoHWF.Text + '\hwf.fdb') + ' ');
//      edtEnderecoHWF.SetFocus;
//    end;

    //    if (edtEnderecoHW.Text = '') then
    //      raise
    //        exception.create('Endereço do banco de dados no servidor não informado');
    //
    //    if (edtEnderecoHWF.Text = '') then
    //      raise
    //        exception.create('Endereço do banco de dados local não informado');

    while (i < cont_hora) do
    begin
      hora_ant := lbtHora.Items[i];
      horas := horas + hora_ant + '|';
      i := i + 1;
    end;

    serviceHw.t_status := Copy(Trim(cbtStatus.Items[cbtStatus.itemIndex]), 1, 1);
    serviceHw.t_hora := horas;
    serviceHw.t_codEmpresa := edtCodEmpresa.Text;
    serviceHw.t_bancoHw := edtEnderecoHW.Text;
    serviceHw.t_bancoHwF := edtEnderecoHWF.Text;

    if (Self.Enabled) and (Self.Visible) and (BitBtn18.CanFocus) then
    	BitBtn18.SetFocus;
    if serviceHw._salvarParametrosTerminal then
      TForm(pnTerminal.Parent).ModalResult := IDOK;

  except
    on e: exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TfrmConfiguracaoServico.BitBtn19Click(Sender: TObject);
begin
  TForm(pnTerminal.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmConfiguracaoServico.BitBtn1Click(Sender: TObject);
begin
  serviceHw._iniciarServico;

  if not FileExists(vDadosIni._GetSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\HwServico.exe') then
  	GroupBox3.Caption := 'Hw Service: Não Instalado'
  else
  	GroupBox3.Caption := 'Hw Service: ' + vDadosIni.IfThen(serviceHw.verificarSituacaoHwService, 'Rodando', 'Parado');
end;

procedure TfrmConfiguracaoServico.BitBtn20Click(Sender: TObject);
var
  I: Integer;
begin
  try

    if Trim(cbobkpStatus.Items[cbobkpStatus.itemIndex]) = '' then
      raise exception.create('Informe se o serviço de Outros Backup''s está ativado ou desativado');

    if cbobkpStatus.ItemIndex = 0 then
    begin
      if Trim(edobkpPathDestino.Text) = '' then
        raise exception.create('Pasta de destino não informada');

      if Trim(cbobkpTipoSalvamento.Items[cbobkpTipoSalvamento.itemIndex]) = '' then
        raise exception.create('Tipo de salvamento não informado');

      if Trim(edobkpHoraBkp.Text) = '  :  ' then
        raise exception.create('Hora do backup não informada');

      try
        StrToTime(edobkpHoraBkp.Text);
      except
        raise exception.create('Hora informada inválida');
      end;

      if ListBox2.Items.Count <= 0 then
        raise exception.create('Nenhum arquivo ou pasta adicionado para backup');
    end;

    serviceHw.obkp_status := Copy(Trim(cbobkpStatus.Items[cbobkpStatus.itemIndex]), 1, 1);
    serviceHw.obkp_pathDestino := Trim(edobkpPathDestino.Text);
    serviceHw.obkp_horaBkp := Trim(edobkpHoraBkp.Text);
    serviceHw.obkp_tipoSalvamento :=
      Copy(Trim(cbobkpTipoSalvamento.Items[cbobkpTipoSalvamento.itemIndex]), 1, 1);

    serviceHw.obkp_listaBackup.Clear;
    for I := 0 to ListBox2.Items.Count - 1 do
      serviceHw.obkp_listaBackup.Add(ListBox2.Items[I]);

    if (Self.Enabled) and (Self.Visible) and (BitBtn20.CanFocus) then
    	BitBtn20.SetFocus;
    if serviceHw._salvarParametrosBkpOutros then
      TForm(pnBkpOutros.Parent).ModalResult := IDOK;

  except
    on e: exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TfrmConfiguracaoServico.BitBtn21Click(Sender: TObject);
begin
  lbtHora.DeleteSelected;
end;

procedure TfrmConfiguracaoServico.BitBtn22Click(Sender: TObject);
begin
  serviceHw._abrirConfig(cfBuscaPreco); //_abreFormConfigAtualizacaoTerminal;
end;

procedure TfrmConfiguracaoServico.BitBtn23Click(Sender: TObject);
var
  i: Integer;
  hora_ant, horas: string;
begin
  try
    i := 0;
    cont_hora := lbBpHora.Count;

    if Trim(cbtStatus.Items[cbBpStatus.itemIndex]) = '' then
      raise exception.create('Informe se a montagem de arquivo do esta ativada ou desativad');

    if (lbBpHora.Items.Text = '') then 
    	raise exception.create('Informe a hora de montagem do arquivo');

    if (edBpCOdEmpresa.Text = '') then
      raise exception.create('Informe o codigo da empresa');

    if (edBpBancoHw.Text = '') then
      raise exception.create('Informe o endereço do banco de dados');

    while (i < cont_hora) do
    begin
      hora_ant := lbBpHora.Items[i];
      horas := horas + hora_ant + '|';
      i := i + 1;
    end;

    serviceHw.bp_status := Copy(Trim(cbBpStatus.Items[cbBpStatus.itemIndex]), 1, 1);
    serviceHw.bp_Hora := horas;
    serviceHw.bp_codEmpresa := edBpCOdEmpresa.Text;
    serviceHw.bp_bancoHw := edBpBancoHw.Text;

    if (Self.Enabled) and (Self.Visible) and (BitBtn23.CanFocus) then
    	BitBtn23.SetFocus;
    if serviceHw._salvarParametrosBuscaPreco then
      TForm(pnBuscaPreco.Parent).ModalResult := IDOK;

  except
    on e: exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TfrmConfiguracaoServico.BitBtn24Click(Sender: TObject);
begin
  TForm(pnBuscaPreco.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmConfiguracaoServico.BitBtn25Click(Sender: TObject);
var
  ult_hora: string;
begin

  if edBpHora.Text = '  :  ' then
  begin
    raise exception.create('Hora deve ser informada');
    if (Self.Enabled) and (Self.Visible) and (edBpHora.CanFocus) then
    	edBpHora.SetFocus;
  end;

  if Pos(edBpHora.Text, lbBpHora.Items.Text) = 0 then
  begin

    if (cont_hora > 0) then
      ult_hora := lbBpHora.Items[lbBpHora.Count - 1];

    if (edBpHora.Text < ult_hora) then
    begin
      Application.MessageBox('Hora atual não pode ser menor que a anterior', 'Atenção');
      if (Self.Enabled) and (Self.Visible) and (edBpHora.CanFocus) then
      	edBpHora.SetFocus;
      exit;
    end;

    lbBpHora.Items.Add(edBpHora.Text);
    edBpHora.Clear;
    if (Self.Enabled) and (Self.Visible) and (edBpHora.CanFocus) then
    	edBpHora.SetFocus;
  end
  else
  begin
    Application.MessageBox('Hora existente neste backup', 'Atenção');
  end;
end;

procedure TfrmConfiguracaoServico.BitBtn26Click(Sender: TObject);
begin
  lbBpHora.DeleteSelected;
end;

procedure TfrmConfiguracaoServico.BitBtn27Click(Sender: TObject);
begin
	serviceHw.historicoBackup;
end;

procedure TfrmConfiguracaoServico.BitBtn28Click(Sender: TObject);
begin
	TForm(pnHistorico.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmConfiguracaoServico.BitBtn29Click(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

		serviceHw.buscarBackup;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmConfiguracaoServico.BitBtn2Click(Sender: TObject);
begin
  serviceHw._pararServico;

  if not FileExists(vDadosIni._GetSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\HwServico.exe') then
  	GroupBox3.Caption := 'Hw Service: Não Instalado'
  else
  	GroupBox3.Caption := 'Hw Service: ' + vDadosIni.IfThen(serviceHw.verificarSituacaoHwService, 'Rodando', 'Parado');
end;

procedure TfrmConfiguracaoServico.BitBtn30Click(Sender: TObject);
begin
	if vDadosIni.vVerificarBackup = 'N' then
  begin
  	GroupBox7.Caption := 'Verificar Backup = Não -> Config.ini - [Sistema - VerificarBackup = N]';
    Exit;
  end
  else if vDadosIni.vTsPlus = 'S' then
  begin
  	GroupBox7.Caption := 'Verificar Backup = Não -> Config.ini - [Sistema - TsPlus = S]';
    Exit;
  end;

	if not serviceHw.verificarBackup(True) then
  	Exit;

//  BitBtn30.Enabled := False;
//  BitBtn31.Enabled := True;
	GroupBox7.Caption := 'Verificar Backup = Sim';
end;

procedure TfrmConfiguracaoServico.BitBtn31Click(Sender: TObject);
begin
	if vDadosIni.vVerificarBackup = 'N' then
  begin
  	GroupBox7.Caption := 'Verificar Backup = Não -> Config.ini - [Sistema - VerificarBackup = N]';
    Exit;
  end
  else if vDadosIni.vTsPlus = 'S' then
  begin
  	GroupBox7.Caption := 'Verificar Backup = Não -> Config.ini - [Sistema - TsPlus = S]';
    Exit;
  end;

	if not serviceHw.verificarBackup(False) then
  	Exit;

//  BitBtn31.Enabled := False;
//  BitBtn30.Enabled := True;
  GroupBox7.Caption := 'Verificar Backup = Não';
end;

procedure TfrmConfiguracaoServico.BitBtn3Click(Sender: TObject);
var
	I: Integer;

  function IpLocal(Ip: string): Boolean;
  var
  	I: Integer;
  	vString: TStrings;
  begin
  	Result := False;

  	vString := GetIpsInterfaces;
    for I := 0 to vString.Count - 1 do
    	if Trim(Ip) = Trim(vString[I]) then
      begin
      	Result := True;
      	Break;
      end
  end;
begin
  try

    if Trim(cbbbkpStatus.Items[cbbbkpStatus.itemIndex]) = '' then
      raise exception.create('Informe se o serviço de Backup do banco de dados está ativado ou desativado');

    if cbbbkpStatus.itemIndex = 0 then
    begin
      if Trim(cbbbkpFormaBackup.Items[cbbbkpFormaBackup.itemIndex]) = '' then
        raise exception.create('Forma de backup não informada');

      if copy(cbbbkpFormaBackup.Items[cbbbkpFormaBackup.itemIndex], 1, 1) = 'C' then
      begin
        if Trim(edbbkpServerName.Text) = '' then
          raise exception.create('Nome ou Ip Servidor do servidor do banco de dados não informado');

        if Trim(edbbkpDataBase.Text) = '' then
          raise exception.create('Banco (Endereço do servidor do banco de dados) não informado');
      end
      else
      begin
        if Trim(edbbkpDataBasePath.Text) = '' then
          raise exception.create('Path Banco (Endereço do banco de dados para efetuar a cópia) não informado');

        if Trim(edbbkpDataBasePath.Text) <> '' then
          if not FileExists(Trim(edbbkpDataBasePath.Text)) then
            raise exception.create('Path Banco (Endereço do banco de dados para efetuar a cópia) não encontrado');
      end;

      if Trim(edbbkpPathDestino.Text) = '' then
        raise exception.create('Pasta de destino não informada');

      if Trim(edbbkpPathDestino.Text) <> '' then
        if not DirectoryExists(Trim(edbbkpPathDestino.Text)) then
        	raise exception.create('Pasta de destino não encontrada');

      if copy(cbbbkpFormaBackup.Items[cbbbkpFormaBackup.itemIndex], 1, 1) = 'C' then
      begin
        if Trim(edbbkpPathDestinoExt.Text) <> '' then
          if not DirectoryExists(Trim(edbbkpPathDestinoExt.Text)) then
            raise exception.create('Pasta de destino externa não encontrada');

        if Trim(edbbkpPathDestino.Text) <> '' then
          if Trim(edbbkpPathDestino.Text) = Trim(edbbkpPathDestinoExt.Text) then
            raise exception.create('Pasta de destino deve ser diferente da pasta de destino externa');

        if (Trim(edbbkpPathDestino.Text) <> '') and (Trim(edbbkpPathDestinoExt.Text) = '') then
        begin
          if (Trim(edbbkpServerName.Text) = Trim(Getcomputer))
          	or (Trim(edbbkpServerName.Text) = '127.0.0.1')
            or (Trim(edbbkpServerName.Text) = 'localhost')
            or (IpLocal(Trim(edbbkpServerName.Text))) then
          begin
            if ExtractFileDrive(Trim(edbbkpDataBase.Text)) = ExtractFileDrive(Trim(edbbkpPathDestino.Text)) then
            begin
            	Application.MessageBox(PChar(
              	'Backup será realizado no próprio servidor de banco de dados, ' +
                'unidade do diretório (Banco de Dados) deve ser diferente da unidade do diretório (Pasta Destino):' + #13 + #13 +
                'Unidade do diretório (Banco de Dados): ' + #13 +
                Trim(edbbkpDataBase.Text) + #13 +
                'Unidade do diretório (Pasta Destino): ' + #13 +
                Trim(edbbkpPathDestino.Text) + #13 + #13 +
                'Favor verificar antes de continuar.'), 'Atenção');

            	if not vDadosIni.PesqPros('CFG062', 'PERMITIR', '', '', '', serviceHw.buscas, true) then
    					begin
                raise exception.create('Backup será realizado no próprio servidor de banco de dados, ' +
                  'unidade do diretório (Banco de Dados) deve ser diferente da unidade do diretório (Pasta Destino):' + #13 + #13 +
                  'Unidade do diretório (Banco de Dados): ' + #13 +
                  Trim(edbbkpDataBase.Text) + #13 +
                  'Unidade do diretório (Pasta Destino): ' + #13 +
                  Trim(edbbkpPathDestino.Text) + #13 + #13 +
                  'Favor verificar antes de continuar.');
              end;
            end;
          end;
        end
        else if (Trim(edbbkpPathDestino.Text) <> '') and (Trim(edbbkpPathDestinoExt.Text) <> '') then
        begin
          if ExtractFileDrive(Trim(edbbkpPathDestino.Text)) = ExtractFileDrive(Trim(edbbkpPathDestinoExt.Text)) then
          begin
            raise exception.create('Backup será realizado na mesma unidade do diretório da pasta externa, ' +
            	'unidade do diretório (Pasta Destino) deve ser diferente da unidade do diretório (Pasta Destino Externa)' + #13 + #13 +
              'Unidade do diretório (Pasta Destino): ' + #13 +
              Trim(edbbkpPathDestino.Text) + #13 +
              'Unidade do diretório (Pasta Destino Externa): ' + #13 +
              Trim(edbbkpPathDestinoExt.Text) + #13 + #13 +
              'Favor verificar antes de continuar.');
          end
          else if (Trim(edbbkpServerName.Text) = Trim(Getcomputer))
            or (Trim(edbbkpServerName.Text) = '127.0.0.1')
            or (Trim(edbbkpServerName.Text) = 'localhost')
            or (IpLocal(Trim(edbbkpServerName.Text))) then
          begin
          	if ExtractFileDrive(Trim(edbbkpDataBase.Text)) = ExtractFileDrive(Trim(edbbkpPathDestinoExt.Text)) then
              raise exception.create('Backup será realizado no próprio servidor de banco de dados, ' +
                'unidade do diretório (Banco de Dados) deve ser diferente da unidade do diretório (Pasta Destino Externa):' + #13 + #13 +
                'Unidade do diretório (Banco de Dados): ' + #13 +
                Trim(edbbkpDataBase.Text) + #13 +
                'Unidade do diretório (Pasta Destino Externa): ' + #13 +
                Trim(edbbkpPathDestinoExt.Text) + #13 + #13 +
                'Favor verificar antes de continuar.');
          end;
        end;
      end;

      if Trim(cbbbkpTipoSalvamento.Items[cbbbkpTipoSalvamento.itemIndex]) = '' then
        raise exception.create('Tipo de salvamento não informado');

      if Trim(edbbkpHoraBackup.Text) = '  :  ' then
        raise exception.create('Hora do backup não informada');

      try
        StrToTime(edbbkpHoraBackup.Text);
      except
        raise exception.create('Hora informada inválida');
      end;
    end;

    serviceHw.bbkp_status := Copy(Trim(cbbbkpStatus.Items[cbbbkpStatus.itemIndex]), 1, 1);
    serviceHw.bbkp_formaBackup := Copy(Trim(cbbbkpFormaBackup.Items[cbbbkpFormaBackup.itemIndex]), 1, 1);
    serviceHw.bbkp_ServerName := Trim(edbbkpServerName.Text);
    serviceHw.bbkp_dataBase := Trim(edbbkpDataBase.Text);
    serviceHw.bbkp_dataBasePath := Trim(edbbkpDataBasePath.Text);
    serviceHw.bbkp_pathDestino := Trim(edbbkpPathDestino.Text);
    serviceHw.bbkp_pathDestinoExt := Trim(edbbkpPathDestinoExt.Text);
    serviceHw.bbkp_horaBkp := Trim(edbbkpHoraBackup.Text);
    serviceHw.bbkp_tipoSalvamento :=
      Copy(Trim(cbbbkpTipoSalvamento.Items[cbbbkpTipoSalvamento.itemIndex]), 1, 1);

//    if ckbbbkpRemoverFbk.Checked then
      serviceHw.bbkp_removerFbk := 'S';
//    else
//      serviceHw.bbkp_removerFbk := 'N';

  	if ckbbbkpBackupAuditoria.Checked then
      serviceHw.bbkp_backup_auditoria := 'S'
    else
    	serviceHw.bbkp_backup_auditoria := 'N';

    if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
    	BitBtn3.SetFocus;
    if serviceHw._salvarParametrosBkpBanco then
      TForm(pnBkp.Parent).ModalResult := IDOK;

  except
    on e: exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TfrmConfiguracaoServico.BitBtn4Click(Sender: TObject);
begin
  TForm(pnBkp.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmConfiguracaoServico.BitBtn5Click(Sender: TObject);
var
  ult_hora: string;
begin

  if mdtHora.Text = '  :  ' then
  begin
    raise exception.create('Hora deve ser informada');
    if (Self.Enabled) and (Self.Visible) and (mdtHora.CanFocus) then
    	mdtHora.SetFocus;
  end;

  if Pos(mdtHora.Text, lbtHora.Items.Text) = 0 then
  begin

    if (cont_hora > 0) then
      ult_hora := lbtHora.Items[lbtHora.Count - 1];

    if (mdtHora.Text < ult_hora) then
    begin
      Application.MessageBox('Hora atual não pode ser menor que a anterior', 'Atenção');
      mdtHora.SetFocus;
      exit;
    end;

    lbtHora.Items.Add(mdtHora.Text);
    mdtHora.Clear;
    if (Self.Enabled) and (Self.Visible) and (mdtHora.CanFocus) then
    	mdtHora.SetFocus;
    // cont_hora := cont_hora + 1;
  end
  else
  begin
    Application.MessageBox('Hora existente neste backup', 'Atenção');
  end;
end;

procedure TfrmConfiguracaoServico.BitBtn6Click(Sender: TObject);
begin
  serviceHw.adress_server := MaskEdit1.Text;
  serviceHw._conectarServer;
  serviceHw._testarConexao;
end;

procedure TfrmConfiguracaoServico.BitBtn7Click(Sender: TObject);
begin
  serviceHw._abrirConfig(cfBackup); //_abreFormConfigBkp;
end;

procedure TfrmConfiguracaoServico.BitBtn8Click(Sender: TObject);
begin
  serviceHw._abrirConfig(cfBackupOutros); //_abreFormConfigBkpOutros;
end;

procedure TfrmConfiguracaoServico.BitBtn9Click(Sender: TObject);
begin
  serviceHw._abrirConfig(cfAtualTerminais); //_abreFormConfigAtualizacaoTerminal;
end;

procedure TfrmConfiguracaoServico.cbbbkpFormaBackupExit(Sender: TObject);
begin
  cbbbkpFormaBackup.Text := cbbbkpFormaBackup.Items[cbbbkpFormaBackup.itemIndex];
  ckbbbkpRemoverFbk.Enabled := Copy(cbbbkpFormaBackup.Text, 1, 1) = 'C';
  edbbkpServerName.Enabled := Copy(cbbbkpFormaBackup.Text, 1, 1) <> 'C'; //False; // ckbbbkpRemoverFbk.Enabled;
  edbbkpDataBase.Enabled := Copy(cbbbkpFormaBackup.Text, 1, 1) <> 'C'; //False; // ckbbbkpRemoverFbk.Enabled;
  ckbbbkpBackupAuditoria.Enabled := Copy(cbbbkpFormaBackup.Text, 1, 1) = 'C';

  ckbbbkpRemoverFbk.Color := vDadosIni.IfThen(ckbbbkpRemoverFbk.Enabled, clWindow, cl3DLight);
  edbbkpServerName.Color  := vDadosIni.IfThen(edbbkpServerName.Enabled, clWindow, cl3DLight);
  edbbkpDataBase.Color    := vDadosIni.IfThen(edbbkpDataBase.Enabled, clWindow, cl3DLight);

  Label1.Enabled := Copy(cbbbkpFormaBackup.Text, 1, 1) <> 'C';
  edbbkpDataBasePath.Enabled := Label1.Enabled;
  SpeedButton1.Enabled := Label1.Enabled;
  if Copy(cbbbkpFormaBackup.Text, 1, 1) = 'C' then
  	edbbkpDataBasePath.Text := '';

  edbbkpDataBasePath.Color := vDadosIni.IfThen(edbbkpDataBasePath.Enabled, clWindow, cl3DLight);
end;

procedure TfrmConfiguracaoServico.cbbbkpStatusExit(Sender: TObject);
begin
  cbbbkpStatus.Text := cbbbkpStatus.Items[cbbbkpStatus.itemIndex];
end;

procedure TfrmConfiguracaoServico.cbbbkpTipoSalvamentoExit(Sender: TObject);
begin
	cbbbkpTipoSalvamento.Text := cbbbkpTipoSalvamento.Items[cbbbkpTipoSalvamento.itemIndex];
end;

procedure TfrmConfiguracaoServico.cbBpStatusExit(Sender: TObject);
begin
	cbBpStatus.Text := cbBpStatus.Items[cbBpStatus.itemIndex];
end;

procedure TfrmConfiguracaoServico.cbobkpStatusExit(Sender: TObject);
begin
  cbobkpStatus.Text := cbobkpStatus.Items[cbobkpStatus.itemIndex];
end;

procedure TfrmConfiguracaoServico.cbobkpTipoSalvamentoExit(Sender: TObject);
begin
	cbobkpTipoSalvamento.Text := cbobkpTipoSalvamento.Items[cbobkpTipoSalvamento.itemIndex];
end;

procedure TfrmConfiguracaoServico.cbtStatusExit(Sender: TObject);
begin
	cbtStatus.Text := cbtStatus.Items[cbtStatus.itemIndex];
end;

procedure TfrmConfiguracaoServico.edtEnderecoHWExit(Sender: TObject);
begin
//  if not (fileexists(edtEnderecoHW.Text)) then
  begin
//    Showmessage('Banco de dados hw não existe existe neste diretório');
//    edtEnderecoHW.SetFocus;
  end;
end;

procedure TfrmConfiguracaoServico.edtEnderecoHWFExit(Sender: TObject);
begin
//  if not (DirectoryExists(edtEnderecoHWF.Text)) then
//  begin
//    Showmessage('Informe somente o caminho do Banco de dados hwf');
//    edtEnderecoHWF.SetFocus;
//  end;

//  if not (FileExists(edtEnderecoHWF.Text + '\hwf.fdb')) then
//  begin
//    Showmessage('Banco de dados hw não existe existe neste diretório, ' +
//      QuotedStr(edtEnderecoHWF.Text + '\hwf.fdb') + ' ');
//    edtEnderecoHWF.SetFocus;
//  end;

end;

procedure TfrmConfiguracaoServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  serviceHw.Free;
  serviceHw := nil;

  Action := caFree;
  frmConfiguracaoServico := nil;

  cont_hora := 0;
end;

procedure TfrmConfiguracaoServico.FormCreate(Sender: TObject);
begin
  cont_hora := 0;
  serviceHw := TConfigServiceHw.create;
  pnBkp.Visible := False;
end;

procedure TfrmConfiguracaoServico.FormShow(Sender: TObject);
var
  I: Integer;
begin
  pnBkp.Visible := False;
  pnLog.Visible := False;
  AutoSize := true;
  Position := poScreenCenter;

  if vDadosIni.vVerificarBackup = 'N' then
  begin
  	GroupBox7.Caption := 'Verificar Backup = Não -> Config.ini - [Sistema - VerificarBackup = N]';
  	BitBtn30.Enabled := false;
    BitBtn31.Enabled := false;
  end
  else if vDadosIni.vTsPlus = 'S' then
  begin
  	GroupBox7.Caption := 'Verificar Backup = Não -> Config.ini - [Sistema - TsPlus = S]';
  	BitBtn30.Enabled := false;
    BitBtn31.Enabled := false;
  end
  else
  begin
    serviceHw.verificarSituacaoBackup;
    GroupBox7.Caption := 'Verificar Backup = ' + vDadosIni.IfThen(serviceHw.vVerificarBackup = 'S', 'Sim', 'Não');
    BitBtn30.Enabled := True;//serviceHw.vVerificarBackup <> 'S';
    BitBtn31.Enabled := True;//serviceHw.vVerificarBackup = 'S';
  end;

  if not FileExists(vDadosIni._GetSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\HwServico.exe') then
  	GroupBox3.Caption := 'Hw Service: Não Instalado'
  else
  	GroupBox3.Caption := 'Hw Service: ' + vDadosIni.IfThen(serviceHw.verificarSituacaoHwService, 'Rodando', 'Parado');

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "CFG062" PERMITIR BACKUP NO SERVIDOR DA PROPRIA UNIDADE DIRETORIO DO BANCO DE DADOS';
end;

procedure TfrmConfiguracaoServico.FormShowBkp(Sender: TObject);
var
	AList: TStringList;
  I: Integer;
begin
  for I := 0 to cbbbkpStatus.Items.Count - 1 do
    if copy(serviceHw.bbkp_status, 1, 1) = Copy(cbbbkpStatus.Items[I], 1, 1) then
    begin
      cbbbkpStatus.ItemIndex := I;
      Break;
    end;

  for I := 0 to cbbbkpFormaBackup.Items.Count - 1 do
    if copy(serviceHw.bbkp_formaBackup, 1, 1) = Copy(cbbbkpFormaBackup.Items[I], 1, 1) then
    begin
      cbbbkpFormaBackup.ItemIndex := I;
      Break;
    end;

  //if (trim(edbbkpDataBase.Text) = '') or (trim(edbbkpDataBase.Text) = '192.168.254.254') then
  if serviceHw.bbkp_formaBackup = 'C' then
  begin
    AList := TStringList.Create;
    try
      AList := vDadosIni.Split(vDadosIni.vBancoHW, ':');
      if AList.Count >= 2 then
      begin
        edbbkpServerName.Text := AList[0];
        edbbkpDataBase.Text   := '';
        for I := 1 to AList.Count - 1 do
        	edbbkpDataBase.Text := edbbkpDataBase.Text + vDadosIni.IfThen(trim(edbbkpDataBase.Text) = '', '', ':') + AList[I];
      end;
    finally
      FreeAndNil(AList);
    end;
  end
  else
  begin
    edbbkpServerName.Text := serviceHw.bbkp_ServerName;
    edbbkpDataBase.Text := serviceHw.bbkp_dataBase;
  end;

  edbbkpDataBasePath.Text := serviceHw.bbkp_dataBasePath;
  edbbkpPathDestino.Text := serviceHw.bbkp_pathDestino;
  edbbkpPathDestinoExt.Text := serviceHw.bbkp_pathDestinoExt;
  edbbkpHoraBackup.Text := serviceHw.bbkp_horaBkp;

  for I := 0 to cbbbkpTipoSalvamento.Items.Count - 1 do
    if copy(serviceHw.bbkp_tipoSalvamento, 1, 1) = Copy(cbbbkpTipoSalvamento.Items[I], 1, 1) then
    begin
      cbbbkpTipoSalvamento.ItemIndex := I;
      Break;
    end;

  ckbbbkpRemoverFbk.Checked := serviceHw.bbkp_removerFbk = 'S';
  ckbbbkpBackupAuditoria.Checked := serviceHw.bbkp_backup_auditoria = 'S';
  edbbkpDiaUltimoBkp.Text := serviceHw.bbkp_diaUltimoBkp;
  edbbkpDiaUltimoBkpFin.Text := serviceHw.bbkp_diaUltimoBkpFin;

  cbbbkpStatusExit(Sender);
  cbbbkpFormaBackupExit(Sender);
  cbbbkpTipoSalvamentoExit(Sender);
end;

procedure TfrmConfiguracaoServico.FormShowBkpOutros(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to cbobkpStatus.Items.Count - 1 do
    if copy(serviceHw.obkp_status, 1, 1) = Copy(cbobkpStatus.Items[I], 1, 1) then
    begin
      cbobkpStatus.ItemIndex := I;
      Break;
    end;

  edobkpPathDestino.Text := serviceHw.obkp_pathDestino;
  edobkpHoraBkp.Text := serviceHw.obkp_horaBkp;

  for I := 0 to cbobkpTipoSalvamento.Items.Count - 1 do
    if copy(serviceHw.obkp_tipoSalvamento, 1, 1) = Copy(cbobkpTipoSalvamento.Items[I], 1, 1) then
    begin
      cbobkpTipoSalvamento.ItemIndex := I;
      Break;
    end;

  edobkpDiaUltimoBkp.Text := serviceHw.obkp_diaUltimoBkp;
  edobkpDiaUltimoBkpFin.Text := serviceHw.obkp_diaUltimoBkpFin;

  ListBox2.Clear;
  for I := 0 to serviceHw.obkp_listaBackup.Count - 1 do
    ListBox2.Items.Add(serviceHw.obkp_listaBackup[I]);

	cbobkpStatusExit(Sender);
  cbobkpTipoSalvamentoExit(Sender);
end;

procedure TfrmConfiguracaoServico.FormShowBuscaPreco(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to cbBpStatus.Items.Count - 1 do
    if copy(serviceHw.bp_status, 1, 1) = Copy(cbBpStatus.Items[I], 1, 1) then
    begin
      cbBpStatus.ItemIndex := I;
      Break;
    end;

  edBpBancoHw.Text := serviceHw.bp_bancoHw;
  edBpCOdEmpresa.Text := serviceHw.bp_codEmpresa;
  if Trim(edBpCOdEmpresa.Text) = '' then
    edBpCOdEmpresa.Text := vDadosIni.codEmpresa;
  if Trim(edBpBancoHw.Text) = '' then
    edBpBancoHw.Text := vDadosIni.vBancoHW;
  
  lbBpHora.Items.Text := StringReplace(serviceHw.bp_Hora, '|', #13, [rfReplaceAll]);

  if (serviceHw.bp_status = 'D') then
  begin
    cbBpStatus.Text := 'Desativado';
  end
  else
  begin
    cbBpStatus.Text := 'Ativado';
  end;

  cbBpStatusExit(Sender);
end;

procedure TfrmConfiguracaoServico.FormShowLog(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'hwService.log') then
    ListBox1.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'hwService.log');

  ListBox1.ItemIndex := ListBox1.Items.Count - 1;
end;

procedure TfrmConfiguracaoServico.FormShowTerminal(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to cbtStatus.Items.Count - 1 do
    if copy(serviceHw.t_status, 1, 1) = Copy(cbtStatus.Items[I], 1, 1) then
    begin
      cbtStatus.ItemIndex := I;
      Break;
    end;

  edtEnderecoHW.Text := serviceHw.t_bancoHw;
  edtEnderecoHWF.Text := serviceHw.t_bancoHwF;
  edtCodEmpresa.Text := serviceHw.t_codEmpresa;
  lbtHora.Items.Text := StringReplace(serviceHw.t_hora, '|', #13, [rfReplaceAll]);

  if (serviceHw.t_status = 'D') then
  begin
    cbtStatus.Text := 'Desativado';
  end
  else
  begin
    cbtStatus.Text := 'Ativado';
  end;

  cbtStatusExit(Sender);
end;

procedure TfrmConfiguracaoServico.ListBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    FormShowLog(Sender);
    Timer1.Interval := 2000;
    Timer1.Enabled := True;
  end;
end;

procedure TfrmConfiguracaoServico.MaskEdit1Exit(Sender: TObject);
begin
  //  serviceHw.adress_server := MaskEdit1.Text;
  //  serviceHw._conectarServer;
end;

procedure TfrmConfiguracaoServico.Removerdobackup1Click(Sender: TObject);
begin
  ListBox2.DeleteSelected;
end;

procedure TfrmConfiguracaoServico.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edbbkpDataBasePath.Text := OpenDialog1.FileName;
end;

procedure TfrmConfiguracaoServico.SpeedButton3Click(Sender: TObject);
begin
  edobkpPathDestino.Text := serviceHw._selectDirectory(edobkpPathDestino.Text);
end;

procedure TfrmConfiguracaoServico.SpeedButton4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtEnderecoHW.Text := OpenDialog1.FileName;
end;

procedure TfrmConfiguracaoServico.SpeedButton5Click(Sender: TObject);
var
  S: string;
begin
  SelectDirectory('Selecionar Pasta', '', S);
  if Trim(S) = '' then
    edtEnderecoHWF.Text := ''
  else
    edtEnderecoHWF.Text := S;
end;

procedure TfrmConfiguracaoServico.SpeedButton6Click(Sender: TObject);
begin
  edbbkpPathDestino.Text := serviceHw._selectDirectory(edbbkpPathDestino.Text);
end;

procedure TfrmConfiguracaoServico.SpeedButton7Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edBpBancoHw.Text := OpenDialog1.FileName;
end;

procedure TfrmConfiguracaoServico.SpeedButton8Click(Sender: TObject);
begin
  edbbkpPathDestinoExt.Text := serviceHw._selectDirectory(edbbkpPathDestinoExt.Text);
end;

procedure TfrmConfiguracaoServico.Timer1Timer(Sender: TObject);
begin
  FormShowLog(Sender)
end;

end.

