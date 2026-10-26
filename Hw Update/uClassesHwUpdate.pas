unit uClassesHwUpdate;

interface

uses
  IBQuery, ExtCtrls, Classes, IniFiles, IBDatabase, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ztvRegister, ztvBase,
  Controls, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, Gauges, StdCtrls, WinSock, ztvConsts, Messages, ztvZip, ztvGbls,
  IBScript, IdAntiFreezeBase, IdAntiFreeze, ztvUnZIP, SysUtils, Windows, UrlMon, ActiveX;

const
  Conf: string = 'Software\Hw\Configuracao\HwUpdate\';

type
  THWuRetornoMultiplo = (rmNenhumArquivo, rmArquivosEmUso, rmOk,
    rmInstaladoSucesso, rmInstaladoFalhas, rmNaoInstalado,
    rmSistemaAberto);

  Thw_gravar_crc = function (ArquivoACompactar: WideString; ArquivoDestinoCRC: WideString): WideString; stdcall;
  Thw_central_suporte_verificar_notificacoes_erp = function (ACnpj: WideString): WideString; stdcall;

  THwUpdate_Pai = class;
  TWebServiceHw = class;
  TDownloadHTTP = class;
  TDescompactadorHw = class;
  TArquivosHW = class;
  TSoftware_HW = class;
  TVersoes_HW = class;
  TConfig_HwUpdate = class;
  THwUpdate = class;

  TSingleton_AT = class
    strict private
      constructor Create;
    class
      var
        FInstance: TSingleton_AT;
    private
      fProgresso: LongInt;
      function _getMeuPC: string;
      procedure SetProgresso(Value: LongInt);
      procedure SetProgressoMaximo(Value: LongInt);
    public
      class function GetInstance: TSingleton_AT;
      function _GetSerialHd: string;
      function _getSpecialFolderPath(folder: integer): string;
      function codifica(wtexto: string): string;
      function decodifica(wtexto: string): string;
      function _getDadosLog: string;
      function _createProcessSimple(pCmd: string; pWait: Boolean): boolean;
      function PosEx(const SubStr, S: string; Offset: Integer): Integer;
    	function Split(const Str: string; const Delimiter: string): TStringList;
      function ArquivoEmUso(CaminhoArquvo: string): Boolean;
      property Progresso: LongInt read fProgresso write SetProgresso;
      property ProgressoMaximo: LongInt write SetProgressoMaximo;
    var
      vMeuPC: string;
      vMeuIP, vMeuSerialHD, vMeuNomePC: string;
      vProducaoHomologacao: string;
      vStandAlone: string;
      DataHoraAtualBanco: TDateTime;
      vGauge: TGauge;
      vLbStatus: TLabel;
      vListBox: TListBox;
  end;

  THwUpdate_Pai = class(TObject)
  protected
    fEnderecoArqIni: string;
    fEnderecoBanco: string;
    fPastaRelFinanceiro: string;
    fPastaRelRetaguarda: string;
    fArqConfig: TIniFile;
    fLogProcessamento: TStringList;

    //componentes para acesso a dados
    fConexao: TIBDataBase;
    fTransacao: TIBTransaction;
    fBuscas, fExec: TIBQuery;

    function _conectarBanco: Boolean;
    function _desconectaBanco: Boolean;

    //funcoes auxiliares
    function GetIni(AChave, AIdentificador, AValorDefault: string): string;
    function _lerConfigIni: Boolean;
    function _getConfiguracoesRegistroString(pClasse, pCampo: string) : string;
    function _getConfiguracoesRegistroInteger(pClasse, pCampo: string) : Integer;
    procedure _setConfiguracoesRegistroString(pClasse, pCampo, pValor: string);
    procedure _setConfiguracoesRegistroInteger(pClasse, pCampo: string; pValor: Integer);

  public

    constructor createComponentes;
    procedure _registraErro(pMenserro: string);
    function _criarTabelas: Boolean;
    function _strZero(pNum: string; pTam: Integer): string;

    property LogProcessamento: TStringList read fLogProcessamento write fLogProcessamento;
  end;

  TSoftware_HW = class(THwUpdate_Pai)
  private
    fVERSAO: string;
    fDataVersao: string;
    procedure setfVERSAO(const Value: string);
  public
    constructor create;
    property VERSAO: string read fVERSAO write setfVERSAO;
    property DataVersao: string read fDataVersao write fDataVersao;
  end;

  TWebServiceHw = class(THwUpdate_Pai)
  private
    fVERSAO_HW: string;
    fSTATUS_VERSAO_HW: string;
    fLINK_DOWNLOAD: string;
    fDATA_VERSAO: TDateTime;
    fSTATUS_CLIENTE_NA_HW: string;
    fSENHA_ARQUIVO: string;
    fLISTA_BUGS: string;
  public
    constructor create;
    function _getVersaoWebService(pCNPJ: string; pSilent: Boolean = True): Boolean;
    function _enviaLogWebService(pCNPJ: string; pVersaoHw: TVersoes_HW): Boolean;

    property VERSAO_HW: string read fVERSAO_HW write fVERSAO_HW;
    property STATUS_VERSAO_HW: string read fSTATUS_VERSAO_HW write fSTATUS_VERSAO_HW;
    property LINK_DOWNLOAD: string read fLINK_DOWNLOAD write fLINK_DOWNLOAD;
    property DATA_VERSAO: TDateTime read fDATA_VERSAO write fDATA_VERSAO;
    property STATUS_CLIENTE_NA_HW: string read fSTATUS_CLIENTE_NA_HW write fSTATUS_CLIENTE_NA_HW;
    property SENHA_ARQUIVO: string read fSENHA_ARQUIVO write fSENHA_ARQUIVO;
    property LISTA_BUGS: string read fLISTA_BUGS write fLISTA_BUGS;
  end;

  TDownloadHTTP = class(THwUpdate_Pai)
  public
    fMax: Int64;
    fPos: Int64;
    fStatus: string;

    idDownloadHTTP: TIdHTTP;
    idAntiFreezeHw: TIdAntiFreeze;

    procedure IdDownloadHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure IdDownloadHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Integer);
    procedure IdDownloadHTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Integer);

    constructor create;
    function _tentarDownloadAlternativo(pLink, pEnderecoArquivo: string): Boolean;
    function _download(pLink, pEnderecoArquivo: string): Boolean;
    procedure _clear;
    property Posicao: Int64 write fPos;
    property Maximo: Int64 write fMax;
    property Status: string write fStatus;
  end;

  TDescompactadorHw = class(THwUpdate_Pai)
  private
    fVERSAO_HW: string;
    fSTATUS_VERSAO_HW: string;
    fDATA_VERSAO: TDateTime;

    fValidandoArquivo: Boolean;
    fSenha: string;
    fDescompactando: Boolean;

    procedure _clear;
    procedure unZipHwProgress(Sender: TObject; ByFile, ByArchive: Byte);
    procedure unZipHwGetPassword(Sender: TObject; FileName: string;
      var Password: string; var HeaderKeys, DataKeys: TSeedKeyRecord;
      var TryAgain: Boolean);
    procedure zipHwProgress(Sender: TObject; ProgressByFile,
         ProgressByArchive: Byte);
  public
    fMax: Integer;
    fPos: Integer;
    fStatus: string;

    unZipHw: TUnZip;
//    unRarHw: TUnRar;
    zipHw: TZip;

    destructor Destroy; override;
    constructor create;
    function _descompactar(pArquivoZip, pPastaDestino, pSenha: string): Boolean;
    function _validarArquivo(pArquivoZip, pSenha: string): Boolean;
    function _compactar(pArquivoZip, pPastaOrigem: string): Boolean;

    property VERSAO_HW: string read fVERSAO_HW write fVERSAO_HW;
    property STATUS_VERSAO_HW: string read fSTATUS_VERSAO_HW write fSTATUS_VERSAO_HW;
    property DATA_VERSAO: TDateTime read fDATA_VERSAO write fDATA_VERSAO;
  end;

  TArquivosHW = class(THwUpdate_Pai)
  private
    fcountArquivos: Smallint;
    fcrc: TStringList;
    fatualizador: TStringList;
    fcrystalbin: TStringList;
    frelfinanceiro : TStringList;
    frelretaguarda: TStringList;
    fschemas: TStringList;
    fsoftware: TStringList;
    fsystem: TStringList;
    fsystem32: TStringList;
    futilitarios: TStringList;
    fwindows: TStringList;

    fpathSoftwareAD: TStringList;
    fpathRelRetaguardaAD: TStringList;

    fpathRelFinanceiro: string;
    fpathRelRetaguarda: string;

    procedure _localizarArquivos(pPath: string; pLista: TStringList);
    function _IsFileInUse(pArquivo: string; pGravarProc: Boolean): Boolean;
    function _alterFileTime(const pArquivo: string; const pData: TDateTime): Boolean;
    function _copyFile(pArquivoOrigem, pArquivoDestino: string): Boolean;
  public
    vFalhaCopia: Boolean;
    constructor create;
    procedure _clear;

    function _novaVersaoAtualizador(pPath: string): Boolean;
    function _validarArquivos(pPath: string): THWuRetornoMultiplo;
    function _copiarArquivos(pApenasValidarEmUso: Boolean): Boolean;
    function _versaoValida(pPath, pVersao: string): Boolean;
    function _registrarDlls(pPath: string): Boolean;
    function _executarAplicativos(pPath: string): Boolean;
    function _arquivosDoSistemaEmUso: Boolean;

    property pathSoftwareAD: TStringList read fpathSoftwareAD write fpathSoftwareAD;
    property pathRelRetaguardaAD: TStringList read fpathRelRetaguardaAD write fpathRelRetaguardaAD;
    property pathRelFinanceiro: string read fpathRelFinanceiro write fpathRelFinanceiro;
    property pathRelRetaguarda: string read fpathRelRetaguarda write fpathRelRetaguarda;
    property filesAtualizador: TStringList read fatualizador write fatualizador;
  end;

  TVersoes_HW = class(THwUpdate_Pai)
  private
    fVERSAO: string;
    fDATA_VERSAO: TDateTime;
    fLINK_DOWNLOAD: string;
    fDATA_DOWNLOAD: TDateTime;
    fSENHA_ARQUIVO: string;
    fLISTA_BUGS: string;
    fQTDE_DOWNLOAD: Integer;
    fQTDE_DESCOMPACTACAO: Integer;
    fSTATUS: string;
    fDATA_TENTATIVA_AT: TDateTime;
    fLOG_ATUALIZACAO: TStringList;
    fLOG_ENVIADO: string;
    fSTATUS_AT_PC: TStringList;
  public
    destructor Destroy; override;
    constructor create;
    procedure _clear;
    function _getVersao(pVersao: string; pSilent: Boolean = True): Boolean;
    function _setUltimaVersao(pUltVersao: string): Boolean;
    function _getTodasVersoes: string;

    function _setLogEnviadoVersao(pVersao: string): Boolean;
    function _gravarLogAtualizacao(pVersao: string): Boolean;
    function _montarStatusParaWS(pVersao, pProcesso: string; pFalha: Boolean): Boolean;

    property VERSAO: string read fVERSAO write fVERSAO;
    property DATA_VERSAO: TDateTime read fDATA_VERSAO write fDATA_VERSAO;
    property LINK_DOWNLOAD: string read fLINK_DOWNLOAD write fLINK_DOWNLOAD;
    property DATA_DOWNLOAD: TDateTime read fDATA_DOWNLOAD write fDATA_DOWNLOAD;
    property SENHA_ARQUIVO: string read fSENHA_ARQUIVO write fSENHA_ARQUIVO;
    property LISTA_BUGS: string read fLISTA_BUGS write fLISTA_BUGS;
    property QTDE_DOWNLOAD: Integer read fQTDE_DOWNLOAD write fQTDE_DOWNLOAD;
    property QTDE_DESCOMPACTACAO: Integer read fQTDE_DESCOMPACTACAO write fQTDE_DESCOMPACTACAO;
    property STATUS: string read fSTATUS write fSTATUS;
    property DATA_TENTATIVA_AT: TDateTime read fDATA_TENTATIVA_AT write fDATA_TENTATIVA_AT;
    property LOG_ATUALIZACAO: TStringList read fLOG_ATUALIZACAO write fLOG_ATUALIZACAO;
    property LOG_ENVIADO: string read fLOG_ENVIADO write fLOG_ENVIADO;
    property STATUS_AT_PC: TStringList read fSTATUS_AT_PC;
  end;

  TConfig_HwUpdate = class(THwUpdate_Pai)
  private
    fHD_PC: string;
    fHD_PC_INST: string;
    fPATHARQUIVOS: string;
    fCNPJ: string;
    fPATHS_AD_SISTEMA: TStringList;
    fPATHS_AD_REL_RET: TStringList;
    fVERSAO_HW: string;
    fSTATUS_VERSAO_HW: string;
    fDATA_CONS_WS: TDateTime;
    fVERSAO_INST: string;
    fSITUACAO_INST: string;
    fSTAND_ALONE: string;
    fHOMOLOGACAO: string;
    fATIVO: Smallint;

    fCNPJClientes: TStringList;
    fMeuHD: string;
  public
    destructor Destroy; override;
    constructor create;
    procedure _clear;
    function _getConfig(pSilent: Boolean = True): Boolean;
    function _setConfigCadastro: Boolean;
    function _setConfigDataHoraConsulta(pSilent: Boolean = True): Boolean;
    function _setConfigVersao: Boolean;
    function _setConfigVersaoInst: Boolean;
    function _getVersaoCaption(pVersao: string): string;
    function _setConfigCrcSeq(pPath: string): Boolean;

    property HD_PC: string read fHD_PC write fHD_PC;
    property HD_PC_INST: string read fHD_PC_INST write fHD_PC_INST;
    property PATHARQUIVOS: string read fPATHARQUIVOS write fPATHARQUIVOS;
    property CNPJ: string read fCNPJ write fCNPJ;
    property PATHS_AD_SISTEMA: TStringList read fPATHS_AD_SISTEMA write fPATHS_AD_SISTEMA;
    property PATHS_AD_REL_RET: TStringList read fPATHS_AD_REL_RET write fPATHS_AD_REL_RET;
    property VERSAO_HW: string read fVERSAO_HW write fVERSAO_HW;
    property STATUS_VERSAO_HW: string read fSTATUS_VERSAO_HW write fSTATUS_VERSAO_HW;
    property DATA_CONS_WS: TDateTime read fDATA_CONS_WS write fDATA_CONS_WS;
    property VERSAO_INST: string read fVERSAO_INST write fVERSAO_INST;
    property SITUACAO_INST: string read fSITUACAO_INST write fSITUACAO_INST;
    property STAND_ALONE: string read fSTAND_ALONE write fSTAND_ALONE;
    property HOMOLOGACAO: string read fHOMOLOGACAO write fHOMOLOGACAO;
    property ATIVO: Smallint read fATIVO write fATIVO;

    property CNPJClientes: TStringList read fCNPJClientes;
    property MeuHD: string read fMeuHD;
  end;

  THwUpdate = class(THwUpdate_Pai)
  private

    /// Forma de registrar dlls e chamar executaveis
    ///  para registrar dll ou o atualizador fazer ou executaveis, ver a melhor forma

    //variaveis
    fEmExecucao: Boolean;
    fArquivoUltVersao: string;
    fStatusExecucao: string; // Vai indicar o processamento da atualização

    // componentes auxiliares
    ftimerAt: TTimer;
    ftrayIconHwAt: TTrayIcon;

    //procedures
    procedure _trayIconHwClick(Sender: TObject);

    //componentes
    procedure _timerTrayIconTimer(Sender: TObject);
    procedure _timerVerificaAtualizacao(Sender: TObject);

    // funcoes principais
    function _descompactarUltVersao: Boolean;
    function _downloadUltVersao: Boolean;

  public
    destructor Destroy; override;
    constructor create;

    procedure _verificarHwUpdateAtivo;

    procedure _verificarAtualizacaoTimer;
    procedure _verificarEnvioLogProcessamento;
    procedure _verificarNotificacoesApiHW;

    function _getPathNovaVersao: string;
    function _getPathVersaoInstalada: string;
    function _verificarAtualizacaoUsuario(pForcarAtualizacao, pSemConsultaSemMensagem: Boolean): boolean;
    function _verificarAtualizacaoViaArquivo(pArquivo: string; pForcarAtualizacao: Boolean = False): Boolean;
    function _instalarNovaVersao: THWuRetornoMultiplo;
    function _prepararArquivoParaInstalarOffLine(pArquivoDestino: string): Boolean;
    function _verificarAtualizacaoViaSuiteHw(pForcar: Boolean = False): Boolean;
    procedure _showHint2(pErro: Boolean; pTitulo, pHint: string);
    
    property EmExecucao: Boolean read fEmExecucao write fEmExecucao;
    property StatusExecucao: string read fStatusExecucao write fStatusExecucao; // Vai indicar o processamento da atualização
    property trayIconHwAt: TTrayIcon read ftrayIconHwAt write ftrayIconHwAt;
  var
  	crcOutput: TStringList;
    vDown: TDownloadHTTP;
    vDescomp: TDescompactadorHw;
    vConfig: TConfig_HwUpdate;
    vUltVer: TVersoes_HW;
    vWS: TWebServiceHw;
    vCopyFiles: TArquivosHW;
    vSw: TSoftware_HW;
  end;

  TBindStatusCallback = class(TObject, IBindStatusCallback)
  protected
    FRefCount: Integer;
    // IUnknown
    function QueryInterface(const IID: TGUID; out Obj): Integer; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    // IBindStatusCallback
    function OnStartBinding(dwReserved: DWORD; pib: IBinding): HResult; stdcall;
    function GetPriority(out nPriority): HResult; stdcall;
    function OnLowResource(reserved: DWORD): HResult; stdcall;
    function OnProgress(ulProgress, ulProgressMax, ulStatusCode: ULONG; szStatusText: LPCWSTR): HResult; stdcall;
    function OnStopBinding(hresult: HResult; szError: LPCWSTR): HResult; stdcall;
    function GetBindInfo(out grfBINDF: DWORD; var bindinfo: TBindInfo): HResult; stdcall;
    function OnDataAvailable(grfBSCF: DWORD; dwSize: DWORD; formatetc: PFormatEtc;
      stgmed: PStgMedium): HResult; stdcall;
    function OnObjectAvailable(const iid: TGUID; punk: IUnknown): HResult; stdcall;
  end;

var
  vAtHw: THwUpdate;
  vDadosIni: TSingleton_AT;

implementation

uses
  Forms, DB, DBClient, SHFolder, ShellAPI, Registry,
  uAtualizarViaWEB, FileCtrl, Dialogs, uPrincipalHwUpdate, Graphics,
  WsAtivaCliente, Contnrs;

function __getSenhaFDB: PChar; stdcall; external 'cons40Up.dll';
function __getUsuarioFDB: PChar; stdcall; external 'cons40Up.dll';
function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40Up.dll';

{ THwUpdate }

constructor THwUpdate.create;
begin
  fEmExecucao := False;

  vDadosIni := TSingleton_AT.GetInstance;

  createComponentes;

  fLogProcessamento := TStringList.Create;

  vWS := TWebServiceHw.create;
  vWS.LogProcessamento := TStringList(fLogProcessamento);

  vDown := TDownloadHTTP.create;
  vDown.LogProcessamento := TStringList(fLogProcessamento);

  vDescomp := TDescompactadorHw.create;
  vDescomp.LogProcessamento := TStringList(fLogProcessamento);

  vConfig := TConfig_HwUpdate.create;
  vConfig.LogProcessamento := TStringList(fLogProcessamento);

  vUltVer := TVersoes_HW.create;
  vUltVer.LogProcessamento := TStringList(fLogProcessamento);

  vCopyFiles := TArquivosHW.create;
  vCopyFiles.LogProcessamento := TStringList(fLogProcessamento);

  vSw := TSoftware_HW.create;
//  vSw.LogProcessamento := TStringList(fLogProcessamento);

  _criarTabelas;

  _verificarHwUpdateAtivo;

  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
    CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update') then
    CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update');

  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
  begin
    Application.MessageBox(pchar('Sistema não conseguiu criar diretório temporário. Deve ser feito para o sistema funcionar corretamente.' + #13 +
    'Diretório: ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas'), 'Atenção', 0 + 64);
    Halt(0);
  end; 

  ftrayIconHwAt := TTrayIcon.Create(Application);
  ftrayIconHwAt.Visible := True;
  ftrayIconHwAt.BalloonFlags := bfInfo;
  ftrayIconHwAt.Hint := 'Hw Update';
  ftrayIconHwAt.OnClick := _trayIconHwClick;

  ftimerAt := TTimer.Create(Application);
  ftimerAt.OnTimer := _timerVerificaAtualizacao;
  ftimerAt.Interval := 15000;
  ftimerAt.Enabled := True;
end;

destructor THwUpdate.Destroy;
begin
  vConfig.Free;
  vUltVer.Free;
  vWS.Free;
  vDown.Free;
  vDescomp.Free;
  vCopyFiles.Free;
  vSw.Free;

  vConfig := nil;
  vUltVer := nil;
  vDown := nil;
  vDescomp := nil;
  vWS := nil;
  vCopyFiles := nil;
  vSw := nil;
  inherited;
end;

function THwUpdate._descompactarUltVersao: Boolean;
var
  vArquivoDownload: string;
  Ahandle: thandle;
  hw_gravar_crc: Thw_gravar_crc;
  Aresposta, vErro: WideString;
  vOrigem: WideString;
  vDestino: WideString;

  procedure ApagaDir(hHandle: THandle; Const sPath : String);
  var
    OpStruc: TSHFileOpStruct;
    FromBuffer, ToBuffer: Array[0..255] of Char;
    vPath: string;
  begin
    //Apaga Pasta, Sub-Pastas e Arquivos

    vPath := Trim(sPath);

    if DirectoryExists(vPath) then
    begin

      if vPath[Length(vPath)] = '\' then
        Delete(vPath, Length(vPath), 1);

      fillChar(OpStruc, Sizeof(OpStruc), 0);
      FillChar(FromBuffer, Sizeof(FromBuffer), 0);
      FillChar(ToBuffer, Sizeof(ToBuffer), 0);
      StrPCopy(FromBuffer, vPath);

      OpStruc.Wnd := hHandle;
      OpStruc.wFunc := FO_DELETE;
      OpStruc.pFrom := @FromBuffer;
      OpStruc.pTo := @ToBuffer;
      OpStruc.fFlags := FOF_NOERRORUI + FOF_SILENT + FOF_NOCONFIRMATION;
      OpStruc.fAnyOperationsAborted := False;
      OpStruc.hNameMappings := nil;

      Result := ((ShFileOperation(OpStruc) = 0) and (not OpStruc.fAnyOperationsAborted));
    end;

  {var
    OpStruc: TSHFileOpStruct;
    FromBuffer, ToBuffer: Array[0..128] of Char;
  begin
    FillChar( OpStruc, Sizeof(OpStruc), 0 );
    FillChar( FromBuffer, Sizeof(FromBuffer), 0 );
    FillChar( ToBuffer, Sizeof(ToBuffer), 0 );
    StrPCopy( FromBuffer, sPath);
    with OpStruc Do
    Begin
      Wnd:= hHandle;
      wFunc:=FO_DELETE;
      pFrom:= @FromBuffer;
      pTo:= @ToBuffer;
      fFlags:= FOF_NOERRORUI + FOF_SILENT + FOF_NOCONFIRMATION;
      fAnyOperationsAborted:=False;
      hNameMappings:=nil;
      //lpszProgressTitle:=nil;
    End;
    ShFileOperation(OpStruc);}
  end;
begin
  try

    vUltVer.QTDE_DESCOMPACTACAO := vUltVer.QTDE_DESCOMPACTACAO + 1;

    if DirectoryExists(_getPathNovaVersao) then
      ApagaDir( Application.Handle, _getPathNovaVersao);

    Result := vDescomp._descompactar(fArquivoUltVersao , _getPathNovaVersao, vUltVer.SENHA_ARQUIVO );

    if Result then
    begin
      vUltVer.STATUS := 'CONCLUIDO';

      vOrigem  := fArquivoUltVersao;
      vDestino := _getPathNovaVersao + 'CRCseq.txt';

      if (not vDadosIni.ArquivoEmUso(vOrigem)) and (not vDadosIni.ArquivoEmUso(vDestino)) then
      begin
        Ahandle := LoadLibrary(PAnsiChar('MD5XE3.dll'));
        try
          try
            if Ahandle <> 0 then
            begin
              hw_gravar_crc := GetProcAddress(Ahandle, PAnsiChar('hw_gravar_crc'));
              Aresposta := hw_gravar_crc(vOrigem, vDestino);
            end;
          except
          end;
        finally
          FreeLibrary(Ahandle);
        end;
      end;
    end
    else if ((vUltVer.QTDE_DOWNLOAD * 2) <= vUltVer.QTDE_DESCOMPACTACAO) and
      ((vUltVer.QTDE_DOWNLOAD = 1) or (vUltVer.QTDE_DOWNLOAD = 2)) then
      vUltVer.STATUS := 'FALHADOWNLOAD'
    else
      vUltVer.STATUS := 'FALHADESCOMP';

    if not Result then
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_descompactarUltVersao] [MS:Descompactacao não efetuada]');

  except
    on e: exception do begin
      Result := False;
      if ((vUltVer.QTDE_DOWNLOAD * 2) <= vUltVer.QTDE_DESCOMPACTACAO) and
        ((vUltVer.QTDE_DOWNLOAD = 1) or (vUltVer.QTDE_DOWNLOAD = 2)) then
        vUltVer.STATUS := 'FALHADOWNLOAD'
      else
        vUltVer.STATUS := 'FALHADESCOMP';
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_descompactarUltVersao] [MS:' + e.Message + ']');
      _registraErro('_descompactarUltVersao. Erro: ' + e.Message);
    end;
  end;
end;

function THwUpdate._downloadUltVersao: Boolean;
begin
  try

    vUltVer.QTDE_DOWNLOAD :=  vUltVer.QTDE_DOWNLOAD + 1;
    Result := vDown._tentarDownloadAlternativo(vUltVer.LINK_DOWNLOAD, fArquivoUltVersao);
    if not Result then
      Result := vDown._download(vUltVer.LINK_DOWNLOAD, fArquivoUltVersao);

    if Result then
    begin
      vUltVer.STATUS := 'BAIXADO';
      vUltVer.DATA_DOWNLOAD := vDadosIni.DataHoraAtualBanco;
    end
    else
      vUltVer.STATUS := 'FALHADOWNLOAD';

  except
    on e: exception do begin
      Result := False;
      vUltVer.STATUS := 'FALHADOWNLOAD';
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_downloadUltVersao] [MS:' + e.Message + ']');
      _registraErro('_downloadUltVersao. Erro: ' + e.Message);
    end;
  end;
end;

function THwUpdate._getPathNovaVersao: string;
begin
  Result := vConfig.PATHARQUIVOS + '\' + vConfig.VERSAO_HW + '\';
end;

function THwUpdate._getPathVersaoInstalada: string;
begin
  Result := vConfig.PATHARQUIVOS + '\' + vConfig.VERSAO_INST + '\';
end;

function THwUpdate._instalarNovaVersao: THWuRetornoMultiplo;
var
  vOK: Boolean;
  vRetornoMult: THWuRetornoMultiplo;
  vPathTemp: string;
begin
  try
    try
      Result := rmNaoInstalado;
      ftrayIconHwAt.Hint := 'Hw Update - Ocupado';

      fLogProcessamento.Clear;

      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Visible := True;
        vDadosIni.vLbStatus.caption := 'Lendo configurações';
        Application.ProcessMessages;
        Sleep(500);
      end;

      _lerConfigIni;

      if not vConfig._getConfig then
        Exit;

      vPathTemp := vConfig.PATHARQUIVOS;
      try
        if (Pos(vConfig.CNPJ, vConfig.CNPJClientes.Text) = 0) then
          if vDadosIni.vLbStatus <> nil then
          begin
            vDadosIni.vLbStatus.Caption := 'HwUpdate não configurado corretamente';
            Application.ProcessMessages;
            Exit;
          end;

        vUltVer._getVersao(vConfig.VERSAO_INST);

        if vDadosIni.vLbStatus <> nil then
        begin
          vDadosIni.vLbStatus.Caption := 'Verificando última versão disponível';
          Application.ProcessMessages;
          Sleep(500);
        end;

        vCopyFiles.pathRelRetaguarda := fPastaRelRetaguarda;
        vCopyFiles.pathRelFinanceiro := fPastaRelFinanceiro;
        vCopyFiles.pathSoftwareAD := TStringList(vConfig.PATHS_AD_SISTEMA);
        vCopyFiles.pathRelRetaguardaAD := TStringList(vConfig.PATHS_AD_REL_RET);

        //colocar o teste de arquivos em uso aqui
        if vCopyFiles._arquivosDoSistemaEmUso then
        begin
          vDadosIni.vLbStatus.Caption := 'HwUpdate não configurado corretamente';
          Application.ProcessMessages;
          Result := rmSistemaAberto;
          Exit;
        end;

        if vDadosIni.vLbStatus <> nil then
        begin
          vDadosIni.vLbStatus.Caption := 'Validando arquivos';
          Application.ProcessMessages;
          Sleep(500);
        end;

        vRetornoMult := vCopyFiles._validarArquivos(_getPathNovaVersao);

        // testes para baixar mesmo se configurado para salvar no servidor e nao conseguir acesso aos arquivos
        if vRetornoMult = rmArquivosEmUso then
          Exit
        else if (vRetornoMult = rmNenhumArquivo) and (vDadosIni.vStandAlone <> 'S') then
        begin // se nao for standalone vai tentar baixar numa pasta local e instalar ele mesmo
          vDadosIni.vListBox.Items.Add('Arquivos não foram localizados ou inacessiveis');
//          vDadosIni.vListBox.Items.Add();
          if Application.MessageBox('Arquivos não foram localizados ou inacessiveis. Baixar arquivos novamente?',
            'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
            Exit;
          vUltVer._getVersao(vConfig.VERSAO_HW, False); // obtendo ultima versao
          if Copy(LowerCase(vUltVer.LINK_DOWNLOAD), 1, 4) <> 'http' then // caso nao tenha o link de donwload
            if not vWS._getVersaoWebService(vConfig.CNPJ) then // obtendo o link para donwload
              Exit
            else
            begin // salvando informacoes do webservice
              vUltVer.LINK_DOWNLOAD := vWS.LINK_DOWNLOAD;
              vUltVer.SENHA_ARQUIVO := vWS.SENHA_ARQUIVO;
              vUltVer.LISTA_BUGS := vWS.LISTA_BUGS;
            end;
          if Copy(LowerCase(vUltVer.LINK_DOWNLOAD), 1, 4) <> 'http' then // caso nao tenha o link de donwload
            Exit;
          fArquivoUltVersao := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + vConfig.VERSAO_HW + '.zip';
          _downloadUltVersao;
          if vUltVer.STATUS <> 'BAIXADO' then
            Exit;
          if FileExists(fArquivoUltVersao) then
          begin
              _descompactarUltVersao;

              if vUltVer.STATUS <> 'CONCLUIDO' then
              begin
              	vConfig.PATHARQUIVOS := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update';
              	_descompactarUltVersao;
              end;

              if vUltVer.STATUS <> 'CONCLUIDO' then
                Exit;
              vRetornoMult := vCopyFiles._validarArquivos(_getPathNovaVersao);
              if vRetornoMult <> rmOk then
                Exit;
          end;
        end
        else if (vRetornoMult = rmNenhumArquivo) then
          Exit;

        vOK := vCopyFiles._copiarArquivos(False);

        if not vCopyFiles._registrarDlls(_getPathNovaVersao) then
          vOK := False;

        if not vCopyFiles._executarAplicativos(_getPathNovaVersao) then
          vOK := False;

        if vOK then
          Result := rmInstaladoSucesso
        else
          Result := rmInstaladoFalhas;

        if Result = rmInstaladoSucesso then
        begin
          fLogProcessamento.Add('[OK] ' + vDadosIni._getDadosLog + ' [MT:_instalarNovaVersao] [MS:CONCLUIDO]');

          vConfig._setConfigVersaoInst;
        end;
      finally
        vConfig.PATHARQUIVOS := vPathTemp;
      end;
    except
      on e: exception do
      begin
        Result := rmNaoInstalado;
        fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_instalarNovaVersao] [MS:' + e.Message + ']');
      end;
    end;
  finally
    if fLogProcessamento.Count > 0 then
    begin
      vUltVer._gravarLogAtualizacao(vConfig.VERSAO_INST);
      vUltVer._montarStatusParaWS( vConfig.VERSAO_INST, 'I', Result <> rmInstaladoSucesso);
    end;
    ftrayIconHwAt.Hint := 'Hw Update';
  end;
end;

function THwUpdate._prepararArquivoParaInstalarOffLine(
  pArquivoDestino: string): Boolean;
var
  vMsgTemp: string;
  vForm: TForm;
  vGauge: TGauge;
begin
  try
    Application.CreateForm(TForm, vForm);
    vGauge := TGauge.Create(vForm);
    vGauge.Parent := vForm;
    vGauge.Width := 350;
    vGauge.Height := 25;
    vGauge.ForeColor := clBlue;
    vForm.AutoSize := True;
    vForm.BorderIcons := [];
    vForm.BorderStyle := bsSizeToolWin;
    vDadosIni.vGauge := TGauge(vGauge);
    vForm.Position := poScreenCenter;
    vForm.FormStyle := fsStayOnTop;
    vForm.Visible := False;
    vForm.Refresh;
    vForm.Show;

    try
      Result := False;
      ftrayIconHwAt.Hint := 'Hw Update - Ocupado';

      fLogProcessamento.Clear;

      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Visible := True;
        vDadosIni.vLbStatus.caption := 'Lendo configurações';
        Application.ProcessMessages;
        Sleep(500);
      end;

      _lerConfigIni;

      if not vConfig._getConfig then
        Exit;

      if ( (Trim(vConfig.VERSAO_HW) = '') or (Trim(vConfig.STATUS_VERSAO_HW) <> 'CONCLUIDO') ) and (Trim(vConfig.VERSAO_INST) = '') then
        raise Exception.Create('Nenhuma versão pronta para montar o arquivo')
      else
      begin
        if (Trim(vConfig.STATUS_VERSAO_HW) <> 'CONCLUIDO') and (Trim(vConfig.VERSAO_INST) <> '') then
          vUltVer._getVersao(vConfig.VERSAO_INST)
        else if (Trim(vConfig.STATUS_VERSAO_HW) = 'CONCLUIDO') then
        begin
          if (Trim(vConfig.SITUACAO_INST) = 'INSTALADA') then
          begin
            if vConfig.VERSAO_HW > vConfig.VERSAO_INST then
            begin
              Application.MessageBox(pchar( 'Nova Versão disponível: ' + vConfig._getVersaoCaption(vConfig.VERSAO_HW) + #13 +
                                            'Versão Instalada: ' + vConfig._getVersaoCaption(vConfig.VERSAO_INST)),
                                            'Informação', 0 + 64);
              if Application.MessageBox(pchar('Deseja montar arquivo da nova versão disponível: ' + vConfig._getVersaoCaption(vConfig.VERSAO_HW) + '?'),
                  'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
                vUltVer._getVersao(vConfig.VERSAO_HW)
              else
                vUltVer._getVersao(vConfig.VERSAO_INST);
            end
            else
              vUltVer._getVersao(vConfig.VERSAO_INST);
          end
          else
            vUltVer._getVersao(vConfig.VERSAO_HW);
        end
        else if (Trim(vConfig.VERSAO_INST) <> '') then
          vUltVer._getVersao(vConfig.VERSAO_INST)
        else
          raise Exception.Create('Nenhuma versão pronta para montar o arquivo');
      end;

      if vCopyFiles._versaoValida(_getPathVersaoInstalada, vUltVer.VERSAO) then
        vDescomp._compactar(pArquivoDestino, _getPathVersaoInstalada);

    except
      on e: exception do
      begin
        Result := False;
        fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_instalarNovaVersao] [MS:' + e.Message + ']');
      end;
    end;
  finally
    vDadosIni.vGauge := nil;
    vForm.Free;
    vForm := nil;
    ftrayIconHwAt.Hint := 'Hw Update';
  end;
end;

procedure THwUpdate._showHint2(pErro: Boolean; pTitulo, pHint: string);
begin
  if ftrayIconHwAt = nil then
    Exit;

  if pErro then
    ftrayIconHwAt.BalloonFlags := bfError
  else
    ftrayIconHwAt.BalloonFlags := bfInfo;
  ftrayIconHwAt.BalloonTitle := pTitulo;
  ftrayIconHwAt.BalloonHint := pHint;
  ftrayIconHwAt.ShowBalloonHint;
end;

procedure THwUpdate._timerTrayIconTimer(Sender: TObject);
var
  vTempExtended: Extended;
begin
  ftrayIconHwAt.BalloonFlags := bfInfo;
  if fStatusExecucao = 'DOWNLOAD' then
  begin
    ftrayIconHwAt.BalloonTitle := 'Hw Update';

    if vDown.fStatus = 'EMANDAMENTO' then
    begin
      vTempExtended := (vDown.fPos/1024)/1024;
      ftrayIconHwAt.BalloonHint := 'Baixando ' + Format('%0.1n',[vTempExtended]) + ' MB  de ' + Format('%0.1n',[(vDown.fMax/1024)/1024])  + ' MB';
    end;
    ftrayIconHwAt.ShowBalloonHint;
  end
  else if fStatusExecucao = 'DESCOMPACTACAO' then
  begin
    if vDescomp.fStatus = 'DESCOMPACTANDO' then
      ftrayIconHwAt.BalloonHint := 'Extraindo arquivos ' + IntToStr(vDescomp.fPos) + '%';
    ftrayIconHwAt.ShowBalloonHint;
  end
  else if fStatusExecucao = 'FALHADESCOMP' then
  begin
    ftrayIconHwAt.BalloonFlags := bfError;
    ftrayIconHwAt.BalloonTitle := 'Falha na extração dos arquivos';

    if (vUltVer.QTDE_DOWNLOAD = 3) then
    begin
      ftrayIconHwAt.BalloonHint := 'Todas as tentativas de extração falharam. Contacte seu suporte';
      ftrayIconHwAt.ShowBalloonHint;
    end
    else if (vUltVer.QTDE_DOWNLOAD < 3) then
    begin
      ftrayIconHwAt.BalloonHint := 'O sistema vai tentar efetuar uma nova extração. Tentativa ' + IntToStr(vUltVer.QTDE_DESCOMPACTACAO + 1) + ' de 6';
      ftrayIconHwAt.ShowBalloonHint;
    end;
  end
  else if fStatusExecucao = 'NOVODOWNLOAD' then
  begin
    ftrayIconHwAt.BalloonFlags := bfError;
    ftrayIconHwAt.BalloonTitle := 'Falha na extração dos arquivos';
    ftrayIconHwAt.BalloonHint := 'Uma nova tentativa de download será feita. O arquivo pode estar corrompido';
    ftrayIconHwAt.ShowBalloonHint;
  end
  else if fStatusExecucao = 'ZERO' then
  begin
    ftrayIconHwAt.BalloonFlags := bfError;
    ftrayIconHwAt.BalloonTitle := 'Falha na atualização';
    ftrayIconHwAt.BalloonHint := 'Todas as tentativas de download e extração falharam. Contacte seu suporte';
    ftrayIconHwAt.ShowBalloonHint;
  end
  else if fStatusExecucao = 'CONCLUIDO' then
  begin
    ftrayIconHwAt.BalloonTitle := 'Atualização Concluída';
    ftrayIconHwAt.BalloonHint := 'Os arquivos estão prontos para serem atualizados nos computadores';
    ftrayIconHwAt.ShowBalloonHint;
  end;
end;

procedure THwUpdate._timerVerificaAtualizacao(Sender: TObject);
begin
  try
    ftimerAt.Enabled := False;
    _verificarAtualizacaoTimer;
    _verificarEnvioLogProcessamento;
    _verificarNotificacoesApiHW;
  finally
    ftimerAt.OnTimer := _timerVerificaAtualizacao;
    ftimerAt.Interval := 1000 * 60 * 30;
    ftimerAt.Enabled := True;
  end;
end;

procedure THwUpdate._trayIconHwClick(Sender: TObject);
begin
  Application.MainForm.Visible := True;
end;

procedure THwUpdate._verificarAtualizacaoTimer;
var
	vTentativasParaDownload, vTentativasParaDescomp: Smallint;
  vConsultaWS: Boolean;
  vLoop: Integer;

  procedure _showHint(pErro: Boolean; pTitulo, pHint: string);
  begin
    if ftrayIconHwAt = nil then
      Exit;

    if pErro then
      ftrayIconHwAt.BalloonFlags := bfError
    else
      ftrayIconHwAt.BalloonFlags := bfInfo;
    ftrayIconHwAt.BalloonTitle := pTitulo;
    ftrayIconHwAt.BalloonHint := pHint;
    ftrayIconHwAt.ShowBalloonHint;
  end;

begin

  if fEmExecucao then
    Exit;

  try
    fEmExecucao := True;
    vConsultaWS := True;
    ftrayIconHwAt.Hint := 'Hw Update - Ocupado';

    ftimerAt.Enabled := False;
    ftimerAt.Interval := 500;
    ftimerAt.OnTimer := _timerTrayIconTimer;

    ftrayIconHwAt.BalloonFlags := bfInfo;
    ftrayIconHwAt.BalloonTimeout := 3000;

    fStatusExecucao := 'INICIO';
    fLogProcessamento.Clear;

    _lerConfigIni;

    if not _conectarBanco then
      Exit;

    if not vConfig._getConfig then
      Exit;

    if vConfig.ATIVO = 0 then
      Exit;

    vUltVer._getVersao(vConfig.VERSAO_HW);

    vConsultaWS := True;
    if Trim(vConfig.HD_PC) = Trim(vConfig.MeuHD) then
    begin
      if (vDadosIni.DataHoraAtualBanco - (vConfig.DATA_CONS_WS + 1)) < (StrToTime('00:00:01')) then
        vConsultaWS := False;
    end
    else if (vDadosIni.DataHoraAtualBanco - (vConfig.DATA_CONS_WS + 1)) < (StrToTime('02:00:00')) then
      vConsultaWS := False;

    if (vConsultaWS) then//or ((vDadosIni.vStandAlone = 'S') and ()) then
    begin
      fStatusExecucao := 'WEBSERVICE';

      if (Pos(vConfig.CNPJ, vConfig.CNPJClientes.Text) = 0) then
      begin
        _showHint(false, 'Hw Update', 'HwUpdate não configurado corretamente');
        Sleep(5000);
        Exit;
      end;

      _showHint(false, 'Hw Update', 'Verificando se existe nova versão disponível');
      Sleep(2000);

      if not vConfig._setConfigDataHoraConsulta then
        exit;

      if not vWS._getVersaoWebService(vConfig.CNPJ) then
        Exit
      else
      begin
        if Trim(vWS.VERSAO_HW) > Trim(vConfig.VERSAO_HW) then
        begin

          if Trim(vWS.STATUS_CLIENTE_NA_HW) = 'BARRADO' then
          begin
            _showHint(false, 'Hw Update - Nova versão disponível', 'Entre em contato com seu fornecedor de Software. Código 113');
            Sleep(15000);
            Exit;
          end;

          if Trim(vWS.STATUS_CLIENTE_NA_HW) = 'SEMCONTRATO' then
          begin
            _showHint(false, 'Hw Update - Nova versão disponível', 'Entre em contato com seu fornecedor de Software para adquidir esta nova versão');
            Sleep(15000);
            Exit;
          end;

          if Trim(vWS.STATUS_CLIENTE_NA_HW) <> 'COMCONTRATO' then
          begin
            _showHint(false, 'Hw Update - Não Encontrado', 'Desculpe, registro não encontrado. Entre em contato com seu fornecedor de Software');
            Sleep(15000);
            Exit;
          end;

          vConfig.VERSAO_HW := vWS.VERSAO_HW;
          vConfig.STATUS_VERSAO_HW := vWS.STATUS_VERSAO_HW;
        end;

        if not vDadosIni.ArquivoEmUso(ExtractFilePath(Application.ExeName) + 'CRCBugList.txt') then
        begin
          try
            crcOutput := TStringList.Create();
            crcOutput := vDadosIni.Split(vWS.LISTA_BUGS, ',');
            crcOutput.SaveToFile(ExtractFilePath(Application.ExeName) + 'CRCBugList.txt');
          finally
            crcOutput.Free;
          end;
        end;

        if Trim(vConfig.VERSAO_HW) > Trim(vUltVer.VERSAO) then
        begin
          vUltVer.VERSAO := vConfig.VERSAO_HW;
          vUltVer.LINK_DOWNLOAD := vWS.LINK_DOWNLOAD;
          vUltVer.DATA_VERSAO := vWS.DATA_VERSAO;
          vUltVer.SENHA_ARQUIVO := vWS.SENHA_ARQUIVO;
          vUltVer.LISTA_BUGS := vWS.LISTA_BUGS;
          vUltVer.QTDE_DOWNLOAD := 0;
          vUltVer.QTDE_DESCOMPACTACAO := 0;
          vUltVer.STATUS := '';
        end
        else if (vUltVer.STATUS = 'CONCLUIDO') then
          Exit
        else if Trim(vConfig.VERSAO_HW) = Trim(vUltVer.VERSAO) then
        begin
          vUltVer.LINK_DOWNLOAD := vWS.LINK_DOWNLOAD;
          vUltVer.SENHA_ARQUIVO := vWS.SENHA_ARQUIVO;
          vUltVer.LISTA_BUGS := vWS.LISTA_BUGS;
          vUltVer.QTDE_DOWNLOAD := 0;
          vUltVer.QTDE_DESCOMPACTACAO := 0;
          vUltVer.STATUS := '';
        end;

        vConfig._setConfigVersao;
        vUltVer._setUltimaVersao(vConfig.VERSAO_HW);
      end;
    end;

    if (Pos(vConfig.CNPJ, vConfig.CNPJClientes.Text) = 0) then
      Exit;

    if (vConfig.VERSAO_HW = vUltVer.VERSAO) and (vUltVer.STATUS = 'CONCLUIDO') then
      Exit
    else if Trim(vUltVer.VERSAO) = '' then
      Exit;

    ftimerAt.Enabled := True;

    fArquivoUltVersao := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + vConfig.VERSAO_HW + '.zip';

    _showHint(false, 'Hw Update', 'Nova versão disponível ' + vConfig._getVersaoCaption(vConfig.VERSAO_HW));
    Sleep(2000);

    vLoop := 0;
    while True do
    begin
      Inc(vLoop);

      if (vUltVer.STATUS = 'CONCLUIDO') or (vLoop >= 12) then
      begin
        fStatusExecucao := 'ZERO';
        Break;
      end;

      vTentativasParaDownload:= 3 - vUltVer.QTDE_DOWNLOAD;

      if (vTentativasParaDownload > 0) and ((vUltVer.STATUS = '') or (vUltVer.STATUS = 'FALHADOWNLOAD')) then
      begin
        _showHint(false, 'Hw Update', 'Iniciando download');
        Sleep(2000);
        fStatusExecucao := 'DOWNLOAD';
        _downloadUltVersao;
        vUltVer._setUltimaVersao(vConfig.VERSAO_HW);
        fStatusExecucao := vUltVer.STATUS;
        if fStatusExecucao = 'BAIXADO' then
          _showHint(false, 'Hw Update', 'Download concluído')
        else
          _showHint(false, 'Hw Update', 'Falha no download');
        Sleep(2000);
      end;

      vTentativasParaDescomp := (vUltVer.QTDE_DOWNLOAD * 2) - vUltVer.QTDE_DESCOMPACTACAO;

      if (vTentativasParaDownload = 0) and (vTentativasParaDescomp = 0) then
      begin
        fStatusExecucao := 'ZERO';
        _showHint(false, 'Hw Update', 'Todas tentativas de atualização falharam');
        Sleep(3000);
        Break;
      end;

      if (vTentativasParaDownload = 0) and (vUltVer.STATUS = 'FALHADOWNLOAD') then
      begin
        _showHint(false, 'Hw Update', 'Todas tentativas de download falharam');
        Sleep(3000);
        Break;
      end;

      if (not FileExists(fArquivoUltVersao)) then
      begin
        vUltVer.STATUS := 'FALHADOWNLOAD';
        _showHint(false, 'Hw Update', 'Arquivo de atualização não encontrado');
        Sleep(3000);
      end;

      if (vTentativasParaDescomp > 0) and ((vUltVer.STATUS = 'BAIXADO') or (vUltVer.STATUS = 'FALHADESCOMP')) then
      begin
        fStatusExecucao := 'DESCOMPACTACAO';
        _showHint(false, 'Hw Update', 'Iniciando extração de arquivos');
        Sleep(2000);
        _descompactarUltVersao;
        if vUltVer.STATUS = 'CONCLUIDO' then
        begin
          _showHint(false, 'Hw Update', 'Extração de arquivos concluída');
          vUltVer._setUltimaVersao(vConfig.VERSAO_HW);
          vConfig.STATUS_VERSAO_HW := 'CONCLUIDO';
          vConfig._setConfigVersao;
          vConfig._setConfigCrcSeq(_getPathNovaVersao);
          fLogProcessamento.Add('[OK] ' + vDadosIni._getDadosLog + ' [MT:_verificarAtualizacaoTimer] [MS:CONCLUIDO]');
          Sleep(2000);
          _showHint(false, 'Hw Update', 'Versão ' + vConfig._getVersaoCaption(vConfig.VERSAO_HW) + ' pronta para ser instalada');
          Sleep(3000);
        end;

        if vUltVer.STATUS = 'FALHADOWNLOAD' then
        begin
          fStatusExecucao := 'NOVODOWNLOAD';
          _showHint(false, 'Hw Update', 'Falha na extração de arquivos. Possivel arquivo corrompido. Novo download será iniciado');
          Sleep(2000);
        end
        else  if vUltVer.STATUS = 'FALHADESCOMP' then
        begin
          _showHint(false, 'Hw Update', 'Falha na extração de arquivos. Tentativa ' + IntToStr(vUltVer.fQTDE_DESCOMPACTACAO));
          Sleep(2000);
          fStatusExecucao := vUltVer.STATUS;
        end;
      end;

    end;

  finally
    if fLogProcessamento.Count > 0 then
    begin
      vUltVer._gravarLogAtualizacao( vConfig.VERSAO_HW);
      vUltVer._montarStatusParaWS( vConfig.VERSAO_HW, 'A', Pos('FALHA', vUltVer.STATUS) > 0);
    end;

    ftimerAt.Interval := 1000;
    ftimerAt.Enabled := False;

    ftrayIconHwAt.BalloonTimeout := 0;
    ftrayIconHwAt.BalloonTitle := '';
    ftrayIconHwAt.BalloonHint := '';
    ftrayIconHwAt.Hint := 'Hw Update';

    fEmExecucao := False;
  end;
end;

function THwUpdate._verificarAtualizacaoUsuario(pForcarAtualizacao,
  pSemConsultaSemMensagem: Boolean): Boolean;
begin

  try
    Result := False;
    ftrayIconHwAt.Hint := 'Hw Update - Ocupado';

    fStatusExecucao := 'INICIO';
    fLogProcessamento.Clear;

    if vDadosIni.vLbStatus <> nil then
    begin
      vDadosIni.vLbStatus.Visible := True;
      vDadosIni.vLbStatus.caption := 'Lendo configurações';
      Application.ProcessMessages;
      Sleep(500);
    end;

    _lerConfigIni;

    if not vConfig._getConfig then
      Exit;

    if (Pos(vConfig.CNPJ, vConfig.CNPJClientes.Text) = 0) then
      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Caption := 'HwUpdate não configurado corretamente';
        Application.ProcessMessages;
        Exit;
      end;

    vUltVer._getVersao(vConfig.VERSAO_HW);

    if vDadosIni.vLbStatus <> nil then
    begin
      vDadosIni.vLbStatus.Caption := 'Verificando ultima versão no WebService';
      Application.ProcessMessages;
      Sleep(500);
    end;

    fStatusExecucao := 'WEBSERVICE';
    if not pSemConsultaSemMensagem then
    begin 
      if not vConfig._setConfigDataHoraConsulta then
        exit;
      if not vWS._getVersaoWebService(vConfig.CNPJ, False) then
        Exit;
    end;

    if (vConfig.VERSAO_HW = vWS.VERSAO_HW) and (vUltVer.STATUS = 'CONCLUIDO') and (not pForcarAtualizacao) then
    begin
      fStatusExecucao := 'SEMATUALIZACAO';

      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Caption := 'Sua versão já é a mais recente';
        Application.ProcessMessages;
        Sleep(500);
      end;
      Exit;
    end
    else if (vConfig.VERSAO_HW > vWS.VERSAO_HW) then
    begin
      fStatusExecucao := 'SEMATUALIZACAO';

      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Caption := 'Sua versão é mais recente que a disponível';
        Application.ProcessMessages;
        Sleep(500);
      end;
      Exit;
    end
    else
    begin
      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Caption := 'Nova versão disponível para download: ' + vConfig._getVersaoCaption(vWS.VERSAO_HW);
        Application.ProcessMessages;
        Sleep(500);
      end;

      if Trim(vWS.STATUS_CLIENTE_NA_HW) = 'BARRADO' then
      begin
        if vDadosIni.vLbStatus <> nil then
        begin
          vDadosIni.vLbStatus.Caption := 'Nova versão disponível. Entre em contato com seu fornecedor de Software. Código 113';
          Application.ProcessMessages;
        end;
        Application.MessageBox('Nova versão disponível. Entre em contato com seu fornecedor de Software. Código 113',
          'Atenção', 0 + 64);
        Exit;
      end;

      if Trim(vWS.STATUS_CLIENTE_NA_HW) = 'SEMCONTRATO' then
      begin
        if vDadosIni.vLbStatus <> nil then
        begin
          vDadosIni.vLbStatus.Caption := 'Nova versão disponível. Entre em contato com seu fornecedor de Software para adquidir esta nova versão';
          Application.ProcessMessages;
        end;
        Application.MessageBox('Nova versão disponível. Entre em contato com seu fornecedor de Software para adquidir esta nova versão',
          'Atenção', 0 + 64);
        Exit;
      end;

      if Trim(vWS.STATUS_CLIENTE_NA_HW) <> 'COMCONTRATO' then
      begin  
        if vDadosIni.vLbStatus <> nil then
        begin
          vDadosIni.vLbStatus.Caption := 'Desculpe, registro não encontrado. Entre em contato com seu fornecedor de Software';
          Application.ProcessMessages;
        end;
        Application.MessageBox('Desculpe, registro não encontrado. Entre em contato com seu fornecedor de Software',
          'Atenção', 0 + 64);
        Exit;
      end;

      if not pSemConsultaSemMensagem then
        if Application.MessageBox(PChar('Existe uma nova versão disponível para download: ' + vConfig._getVersaoCaption(vWS.VERSAO_HW) + '. Deseja atualizar para nova versão?'),
          'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
    end;

    vConfig.VERSAO_HW :=  vWS.VERSAO_HW;
    vConfig.STATUS_VERSAO_HW := vWS.STATUS_VERSAO_HW;

    vUltVer.VERSAO := vConfig.VERSAO_HW;
    vUltVer.DATA_VERSAO := vWS.DATA_VERSAO;
    vUltVer.LINK_DOWNLOAD := vWS.LINK_DOWNLOAD;
    vUltVer.SENHA_ARQUIVO := vWS.SENHA_ARQUIVO;
    vUltVer.LISTA_BUGS := vWS.LISTA_BUGS;
    vUltVer.QTDE_DOWNLOAD := 0;
    vUltVer.QTDE_DESCOMPACTACAO := 0;
    vUltVer.STATUS := '';

    if not vDadosIni.ArquivoEmUso(ExtractFilePath(Application.ExeName) + 'CRCBugList.txt') then
    begin
      try
        crcOutput := TStringList.Create();
        crcOutput := vDadosIni.Split(vWS.LISTA_BUGS, ',');
        crcOutput.SaveToFile(ExtractFilePath(Application.ExeName) + 'CRCBugList.txt');
      finally
        crcOutput.Free;
      end;
    end;

    vConfig._setConfigVersao;
    vUltVer._setUltimaVersao(vConfig.VERSAO_HW);

    if vDadosIni.vLbStatus <> nil then
    begin
      vDadosIni.vLbStatus.Caption := 'Preparando download de nova versão ' + vConfig._getVersaoCaption(vConfig.VERSAO_HW);
      Application.ProcessMessages;
      Sleep(500);
    end;

    fArquivoUltVersao := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + vConfig.VERSAO_HW + '.zip';

    fStatusExecucao := 'DOWNLOAD';
    if not _downloadUltVersao then
    begin
      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Caption := 'Falha ao efetuar download do arquivo';
        Application.ProcessMessages;
        Sleep(500);
      end;
      fStatusExecucao := 'FALHADOWNLOAD';
      Exit;
    end;

    vUltVer._setUltimaVersao(vConfig.VERSAO_HW);
    fStatusExecucao := vUltVer.STATUS;

    if vDadosIni.vLbStatus <> nil then
    begin
      vDadosIni.vLbStatus.Caption := 'Preparando extração de arquivos';
      Application.ProcessMessages;
      Sleep(500);
    end;

    fStatusExecucao := 'DESCOMPACTACAO';
    if not _descompactarUltVersao then
    begin
      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Caption := 'Falha ao extrair arquivos';
        Application.ProcessMessages;
        Sleep(500);
      end;
      fStatusExecucao := 'ERRODESCOMP';
      exit;
    end;
    vUltVer._setUltimaVersao(vConfig.VERSAO_HW);
    fStatusExecucao := vUltVer.STATUS;

    if vUltVer.STATUS = 'CONCLUIDO' then
    begin
      vConfig.STATUS_VERSAO_HW := 'CONCLUIDO';
      vConfig._setConfigVersao;
      vConfig._setConfigCrcSeq(_getPathNovaVersao);
      fLogProcessamento.Add('[OK] ' + vDadosIni._getDadosLog + ' [MT:_verificarAtualizacaoUsuario] [MS:CONCLUIDO]');
      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Caption := 'Nova versão já esta disponível para instalação';
        Application.ProcessMessages;
        Sleep(500);
      end;
    end;

  finally
    if fLogProcessamento.Count > 0 then
    begin
      vUltVer._gravarLogAtualizacao(vConfig.VERSAO_HW);
      vUltVer._montarStatusParaWS( vConfig.VERSAO_HW, 'A', Pos('FALHA', vUltVer.STATUS) > 0);
    end;

    if fStatusExecucao = 'ERROWEBSERVICE' then
      Application.MessageBox('Erro de conexão! Sem internet ou servidor não respondendo', 'Atenção', 0 + 64)
    else if fStatusExecucao = 'SEMATUALIZACAO' then
      Application.MessageBox('Sem atualização disponível no momento', 'Atenção', 0 + 64)
    else if fStatusExecucao = 'ERRODESCOMP' then
      Application.MessageBox('Falha ao extrair arquivos', 'Atenção', 0 + 64)
    else if fStatusExecucao = 'FALHADOWNLOAD' then
      Application.MessageBox('Falha ao efetuar download', 'Atenção', 0 + 64)
    else if fStatusExecucao = 'CONCLUIDO' then
    begin
      Result := True;
      if not pSemConsultaSemMensagem then
      	Application.MessageBox('Atualização pronta para instalação. Instale o sistema agora!', 'Atenção', 0 + 64);
    end;
    
    ftrayIconHwAt.Hint := 'Hw Update';
  end;
end;

function THwUpdate._verificarAtualizacaoViaArquivo(pArquivo: string;
  pForcarAtualizacao: Boolean = False): Boolean;
begin

  try
    Result:= False;
    ftrayIconHwAt.Hint := 'Hw Update - Ocupado';

    fStatusExecucao := 'INICIO';
    fLogProcessamento.Clear;

    if vDadosIni.vLbStatus <> nil then
    begin
      vDadosIni.vLbStatus.Visible := True;
      vDadosIni.vLbStatus.caption := 'Lendo configurações';
    end;

    _lerConfigIni;

    if not vConfig._getConfig then
      Exit;

    if (Pos(vConfig.CNPJ, vConfig.CNPJClientes.Text) = 0) then
      if vDadosIni.vLbStatus <> nil then
      begin
        vDadosIni.vLbStatus.Caption := 'HwUpdate não configurado corretamente';
        Application.ProcessMessages;
        Exit;
      end;

    vUltVer._getVersao(vConfig.VERSAO_HW);

    if vDadosIni.vLbStatus <> nil then
      vDadosIni.vLbStatus.Caption := 'Verificando versão do Arquivo';

    fStatusExecucao := 'VALIDACAO';
    if not vDescomp._validarArquivo(pArquivo, '') then
    begin
      if vDadosIni.vLbStatus <> nil then
        vDadosIni.vLbStatus.Caption := 'Arquivo inválido';
      exit;
    end;

    if (vConfig.VERSAO_HW > vDescomp.VERSAO_HW)  then
    begin
      fStatusExecucao := 'SEMATUALIZACAO';

      if vDadosIni.vLbStatus <> nil then
        vDadosIni.vLbStatus.Caption := 'Sua versão é mais recente que a versão contida no arquivo';
      Exit;
    end
    else if (vConfig.VERSAO_HW = vDescomp.VERSAO_HW) and (vUltVer.STATUS = 'CONCLUIDO') and (not pForcarAtualizacao) then
    begin
      fStatusExecucao := 'SEMATUALIZACAO';

      if vDadosIni.vLbStatus <> nil then
        vDadosIni.vLbStatus.Caption := 'Sua versão é igual a versão contida no arquivo';
      Exit;
    end
    else
    begin
      if vDadosIni.vLbStatus <> nil then
        vDadosIni.vLbStatus.Caption := 'Nova versão no arquivo informado';
      if Application.MessageBox('Existe uma nova versão neste arquivo selecionado. Deseja instalar nova versão?',
        'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
    end;

    vConfig.VERSAO_HW :=  vDescomp.VERSAO_HW;
    vConfig.STATUS_VERSAO_HW := vDescomp.STATUS_VERSAO_HW;

    vUltVer.VERSAO := vConfig.VERSAO_HW;
    vUltVer.DATA_VERSAO := vDescomp.DATA_VERSAO;
    vUltVer.LINK_DOWNLOAD := pArquivo;
    vUltVer.QTDE_DOWNLOAD := -1;
    vUltVer.QTDE_DESCOMPACTACAO := 0;
    vUltVer.STATUS := '';

    vConfig._setConfigVersao;
    vUltVer._setUltimaVersao(vConfig.VERSAO_HW);

    fArquivoUltVersao := pArquivo;
    fStatusExecucao := vUltVer.STATUS;

    if vDadosIni.vLbStatus <> nil then
      vDadosIni.vLbStatus.Caption := 'Preparando extração de arquivos';

    fStatusExecucao := 'DESCOMPACTACAO';
    if not _descompactarUltVersao then
    begin
      if vDadosIni.vLbStatus <> nil then
        vDadosIni.vLbStatus.Caption := 'Falha ao extrair arquivos';
      fStatusExecucao := 'ERRODESCOMP';
      exit;
    end;
    vUltVer._setUltimaVersao(vConfig.VERSAO_HW);
    fStatusExecucao := vUltVer.STATUS;

    if vUltVer.STATUS = 'CONCLUIDO' then
    begin
      vConfig.STATUS_VERSAO_HW := 'CONCLUIDO';
      vConfig._setConfigVersao;
      vConfig._setConfigCrcSeq(_getPathNovaVersao);
      fLogProcessamento.Add('[OK] ' + vDadosIni._getDadosLog + ' [MT:_verificarAtualizacaoUsuario] [MS:CONCLUIDO]');
      if vDadosIni.vLbStatus <> nil then
        vDadosIni.vLbStatus.Caption := 'Nova versão já esta disponível para instalação';
    end;

  finally
    if fLogProcessamento.Count > 0 then
    begin
      vUltVer._gravarLogAtualizacao(vConfig.VERSAO_HW);
      vUltVer._montarStatusParaWS( vConfig.VERSAO_HW, 'A', Pos('FALHA', vUltVer.STATUS) > 0);
    end;

    if fStatusExecucao = 'VALIDACAO' then
      Application.MessageBox('Arquivo inválido', 'Atenção', 0 + 64)
    else if fStatusExecucao = 'SEMATUALIZACAO' then
      Application.MessageBox('Sem atualização disponível no momento', 'Atenção', 0 + 64)
    else if fStatusExecucao = 'ERRODESCOMP' then
      Application.MessageBox('Falha ao extrair arquivos', 'Atenção', 0 + 64)
    else if fStatusExecucao = 'CONCLUIDO' then
    begin
      Result := True;
      Application.MessageBox('Atualização pronta para instalação. Instale o sistema agora!', 'Atenção', 0 + 64);
    end;

    ftrayIconHwAt.Hint := 'Hw Update';
  end;
end;

function THwUpdate._verificarAtualizacaoViaSuiteHw(pForcar: Boolean = False): Boolean;
begin
 try
    Result := False;
    ftrayIconHwAt.Hint := 'Hw Update - Ocupado';

    fStatusExecucao := 'INICIO';

    _lerConfigIni;

    if not vConfig._getConfig then
      Exit;

    if (Pos(vConfig.CNPJ, vConfig.CNPJClientes.Text) = 0) then
    begin
      Application.MessageBox('Desculpe, HwUpdate não configurado corretamente', 'Atenção', 0 + 64);
      Exit;
    end;

    vUltVer._getVersao(vConfig.VERSAO_HW);

    fStatusExecucao := 'WEBSERVICE';
                                          
    if not vConfig._setConfigDataHoraConsulta then
      exit;
    if not vWS._getVersaoWebService(vConfig.CNPJ) then
      Exit;
       
    if (not pForcar) and (vSw.VERSAO >= vWS.VERSAO_HW) then
    begin
      fStatusExecucao := '';
      Application.MessageBox('Sua versão já é a mais recente', 'Atenção', 0 + 64);
      Exit;
    end
    else if (not pForcar) and (vConfig.VERSAO_HW = vWS.VERSAO_HW) and (vUltVer.STATUS = 'CONCLUIDO') then
    begin
      fStatusExecucao := '';
      Application.MessageBox('Sua versão já é a mais recente', 'Atenção', 0 + 64);
      Exit;
    end
    else if (not pForcar) and (vConfig.VERSAO_HW > vWS.VERSAO_HW) then
    begin
      fStatusExecucao := '';
      Application.MessageBox('Sua versão é mais recente que a disponível', 'Atenção', 0 + 64);
      Exit;
    end
    else
    begin
      if Trim(vWS.STATUS_CLIENTE_NA_HW) = 'BARRADO' then
      begin
        fStatusExecucao := '';
        Application.MessageBox('Nova versão disponível. Entre em contato com seu fornecedor de Software. Código 113',
          'Atenção', 0 + 64);
        Exit;
      end;

      if Trim(vWS.STATUS_CLIENTE_NA_HW) = 'SEMCONTRATO' then
      begin
        fStatusExecucao := '';
        Application.MessageBox('Nova versão disponível. Entre em contato com seu fornecedor de Software para adquidir esta nova versão',
          'Atenção', 0 + 64);
        Exit;
      end;

      if Trim(vWS.STATUS_CLIENTE_NA_HW) <> 'COMCONTRATO' then
      begin
        fStatusExecucao := '';
        Application.MessageBox('Desculpe, registro não encontrado. Entre em contato com seu fornecedor de Software',
          'Atenção', 0 + 64);
        Exit;
      end;

      if pForcar then
      	Result := True
      else
      begin
        if Application.MessageBox('Existe uma nova versão disponível para download. Deseja atualizar para nova versão?',
          'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
            Result := True;
      end;

      if Result then
      begin
      	if not vDadosIni.ArquivoEmUso(ExtractFilePath(Application.ExeName) + 'CRCBugList.txt') then
        begin
          try
            crcOutput := TStringList.Create();
            crcOutput := vDadosIni.Split(vWS.LISTA_BUGS, ',');
            crcOutput.SaveToFile(ExtractFilePath(Application.ExeName) + 'CRCBugList.txt');
          finally
            crcOutput.Free;
          end;
        end;
      end;

      fStatusExecucao := '';
    end;
  finally
    if fStatusExecucao = 'ERROWEBSERVICE' then
      Application.MessageBox('Erro de conexão! Sem internet ou servidor não respondendo', 'Atenção', 0 + 64)
    else if fStatusExecucao = 'SEMATUALIZACAO' then
      Application.MessageBox('Sem atualização disponível no momento', 'Atenção', 0 + 64);
    ftrayIconHwAt.Hint := 'Hw Update';
  end;
end;

procedure THwUpdate._verificarEnvioLogProcessamento;
begin

  if fEmExecucao then
    Exit;

  try
    fEmExecucao := True;
    ftrayIconHwAt.Hint := 'Hw Update - Ocupado';
    ftrayIconHwAt.BalloonFlags := bfInfo;
    ftrayIconHwAt.BalloonTimeout := 3000;

    _lerConfigIni;

    if not _conectarBanco then
      Exit;

    if not vConfig._getConfig then
      Exit;

    if vConfig.ATIVO = 0 then
      Exit;

    if (Pos(vConfig.CNPJ, vConfig.CNPJClientes.Text) = 0) then
      Exit;

    if vConfig.VERSAO_HW = vConfig.VERSAO_INST then
      vUltVer._getVersao(vConfig.VERSAO_INST)
    else
      vUltVer._getVersao(vConfig.VERSAO_HW);

    if Trim(vConfig.HD_PC) = Trim(vConfig.MeuHD) then
    begin
      if (vDadosIni.DataHoraAtualBanco - (vUltVer.DATA_TENTATIVA_AT + 1)) < (StrToTime('00:00:01')) then
        Exit;
    end
    else if (vDadosIni.DataHoraAtualBanco - (vUltVer.DATA_TENTATIVA_AT + 1)) < (StrToTime('02:00:00')) then
      Exit;

    if vUltVer.fLOG_ENVIADO <> 'P' then
      Exit;

    if not vWS._enviaLogWebService(vConfig.CNPJ, vUltVer) then
      Exit
    else
      vUltVer._setLogEnviadoVersao(vUltVer.VERSAO);

  finally
    ftimerAt.Interval := 1000;
    ftimerAt.Enabled := False;

    ftrayIconHwAt.BalloonTimeout := 0;
    ftrayIconHwAt.BalloonTitle := '';
    ftrayIconHwAt.BalloonHint := '';
    ftrayIconHwAt.Hint := 'Hw Update';

    fEmExecucao := False;
  end;
end;

procedure THwUpdate._verificarHwUpdateAtivo;
var
  vProgRecep: THandle;

  procedure _setHwUpdateAtivo;
  var
    Registro: TRegistry;
  begin
    try
      try
        Registro := TRegistry.Create(KEY_WRITE);
        Registro.RootKey := HKEY_LOCAL_MACHINE;
        Registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', True);
        Registro.WriteString('HwGuardUp', ExtractFilePath(Application.ExeName) + 'HwGuardUp.exe');
        Registro.CloseKey;
      finally
        Registro.Free;
      end;
    except
    end;
  end;

  procedure _setHwUpdateDesativado;
  var
    Registro: TRegistry;
  begin
    try
      try
        Registro := TRegistry.Create(KEY_ALL_ACCESS);
        Registro.RootKey := HKEY_LOCAL_MACHINE;
        Registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', True);
        Registro.DeleteValue('HwGuardUp');
        Registro.CloseKey;
      finally
        Registro.Free;
      end;
    except
    end;
  end;

begin
  vConfig._getConfig(True);

  if vConfig.ATIVO = 0 then
    _setHwUpdateDesativado
  else
    _setHwUpdateAtivo;

  vProgRecep := FindWindow('TfrmGuardUp', nil);
  if vProgRecep = 0 then
  begin
    if not FileExists(ExtractFilePath(Application.ExeName) + 'HwGuardUp.exe') then
    begin
      Application.MessageBox('Sistema incompleto. Falta HwGuardUp', 'Atenção', 0 + 64);
      Exit;
    end;

    WinExec(pchar( ExtractFilePath(Application.ExeName) + 'HwGuardUp.exe'), SW_HIDE);
  end;
end;

procedure THwUpdate._verificarNotificacoesApiHW;
var
  Acnpj, Aresposta : WideString;
  hw_central_suporte_verificar_notificacoes_erp: Thw_central_suporte_verificar_notificacoes_erp;
  Ahandle: thandle;
begin

  if fEmExecucao then
    Exit;

  try
    fEmExecucao := True;
    ftrayIconHwAt.Hint := 'Hw Update - Ocupado';
    ftrayIconHwAt.BalloonFlags := bfInfo;
    ftrayIconHwAt.BalloonTimeout := 3000;

    _lerConfigIni;

    if not _conectarBanco then
      Exit;

    if not vConfig._getConfig then
      Exit;

    if vConfig.ATIVO = 0 then
      if GetIni('MD', 'APIHWCNERP', '') <> 'S' then //API HW Consulta Notificacoes ERP
        Exit;

    if (Pos(vConfig.CNPJ, vConfig.CNPJClientes.Text) = 0) then
      Exit;

    Acnpj  := Trim(vConfig.CNPJ);

    Ahandle := LoadLibrary(PAnsiChar('hw.utils.dx.dll'));
    try
      try
        if Ahandle <> 0 then
        begin
          hw_central_suporte_verificar_notificacoes_erp := GetProcAddress(Ahandle, PAnsiChar('hw_central_suporte_verificar_notificacoes_erp'));
          Aresposta := hw_central_suporte_verificar_notificacoes_erp(Acnpj);
        end;
      except
      end;
    finally
      FreeLibrary(Ahandle);
    end;

  finally
    ftimerAt.Interval := 1000;
    ftimerAt.Enabled := False;

    ftrayIconHwAt.BalloonTimeout := 0;
    ftrayIconHwAt.BalloonTitle := '';
    ftrayIconHwAt.BalloonHint := '';
    ftrayIconHwAt.Hint := 'Hw Update';

    fEmExecucao := False;
  end;
end;

{ TDownloadHTTP }

constructor TDownloadHTTP.create;
begin
//  idAntiFreezeHw := TIdAntiFreeze.Create;

//  idSSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create;

//  idDownloadHTTP.IOHandler := idSSLIOHandler;

  fMax := 0;
  fPos := 0;
  fStatus := 'Desconectado';

end;

procedure TDownloadHTTP.IdDownloadHTTPWork(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Integer);
var
  vTempExtended: Extended;
begin
  fPos := AWorkCount;
  fStatus := 'EMANDAMENTO';
  if vDadosIni.vLbStatus <> nil then
  begin
    vTempExtended := (AWorkCount/1024)/1024;
    vDadosIni.vLbStatus.Caption := 'Baixando nova versão. ' + Format('%0.1n',[vTempExtended]) + ' MB  de ' + Format('%0.1n',[(fMax/1024)/1024])  + ' MB';
  end;
  if vDadosIni.vGauge <> nil then
    vDadosIni.vGauge.Progress := AWorkCount;
  Application.ProcessMessages;
end;

procedure TDownloadHTTP.IdDownloadHTTPWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Integer);
begin
  fMax := AWorkCountMax;
  fStatus := 'INICIO';
  if vDadosIni.vGauge <> nil then
  begin
    vDadosIni.vGauge.MinValue := 0;
    vDadosIni.vGauge.Progress := 0;
    vDadosIni.vGauge.MaxValue := AWorkCountMax;
    vDadosIni.vGauge.Visible := True;
  end;
end;

procedure TDownloadHTTP.IdDownloadHTTPWorkEnd(ASender: TObject;
  AWorkMode: TWorkMode);
begin
  fStatus := 'CONCLUIDO';
  if vDadosIni.vGauge <> nil then
    vDadosIni.vGauge.Progress := 100;
end;

function TDownloadHTTP._tentarDownloadAlternativo(pLink, pEnderecoArquivo: string): Boolean;
var
  BSC: TBindStatusCallback;
begin
  try
    BSC := TBindStatusCallback.Create;
    try
      result := URLDownloadToFile(nil,
        PChar(pLink),
        PChar(pEnderecoArquivo), 0, BSC) = 0;
    finally
      BSC.Free;
      BSC := nil;
    end;
  except
    Result := False;
  end;
end;

procedure TDownloadHTTP._clear;
begin
  fMax := 0;
  fPos := 0;
  fStatus := 'DESCONECTADO';
end;

function TDownloadHTTP._download(pLink, pEnderecoArquivo: string): Boolean;
var
  vArquivoBaixado: TFileStream;
begin
  Result := False;

  if not (DirectoryExists(ExtractFilePath(pEnderecoArquivo))) then
    CreateDir(ExtractFilePath(pEnderecoArquivo));

  vArquivoBaixado := TFileStream.Create(pEnderecoArquivo, fmCreate);
  _clear;

  idDownloadHTTP := TIdHTTP.Create;
  idDownloadHTTP.OnWork := IdDownloadHTTPWork;
  idDownloadHTTP.OnWorkBegin := IdDownloadHTTPWorkBegin;
  idDownloadHTTP.OnWorkEnd := IdDownloadHTTPWorkEnd;
  idDownloadHTTP.ConnectTimeout := 15000;
  idDownloadHTTP.ReadTimeout := 15000;

  idAntiFreezeHw := TIdAntiFreeze.Create;
  try

    idDownloadHTTP.HandleRedirects := True;
    idDownloadHTTP.Get(pLink, vArquivoBaixado);
    Result := True;
  finally
    idDownloadHTTP.Free;
    idDownloadHTTP := nil;
    idAntiFreezeHw.Free;
    idAntiFreezeHw := nil;
    vArquivoBaixado.Free;
  end;
end;

{ TDescompactadorHw }

constructor TDescompactadorHw.create;
begin
  unZipHw := TUnZip.Create(unZipHw);
  unZipHw.OnProgress := unZipHwProgress;
  unZipHw.OnGetPassword := unZipHwGetPassword;

  zipHw := TZip.Create(zipHw);
  zipHw.OnProgress := zipHwProgress;
  _clear;
end;

destructor TDescompactadorHw.Destroy;
begin
  unZipHw.Free;
  unZipHw := nil;

  zipHw.Free;
  zipHw := nil;
  inherited;
end;

procedure TDescompactadorHw.unZipHwGetPassword(Sender: TObject;
  FileName: string; var Password: string; var HeaderKeys,
  DataKeys: TSeedKeyRecord; var TryAgain: Boolean);
begin
  if not fDescompactando then
    if Trim(fSenha) = '' then
    begin
      PostMessage(frmHwUpdate.Handle, WM_USER + 123, 0, 0);
      if not InputQuery('Senha arquivo', 'Informe a senha do arquivo', fSenha) then
        fSenha := 'semsenha'
      else if Trim(fSenha) = '' then
        fSenha := 'semsenha';
    end;
  Password := fSenha;
  DataKeys.Key[0] := DEFAULT_DATA_KEYS.Key[0];
  DataKeys.Key[1] := DEFAULT_DATA_KEYS.Key[1];
  DataKeys.Key[2] := DEFAULT_DATA_KEYS.Key[2];
  HeaderKeys.Key[0] := DEFAULT_HEAD_KEYS.Key[0];
  HeaderKeys.Key[1] := DEFAULT_HEAD_KEYS.Key[1];
  HeaderKeys.Key[2] := DEFAULT_HEAD_KEYS.Key[2];
end;

procedure TDescompactadorHw.unZipHwProgress(Sender: TObject; ByFile,
  ByArchive: Byte);
begin
  if (fPos = 0) and (ByArchive > 0) then
  begin
    fStatus := 'DESCOMPACTANDO';
    if vDadosIni.vGauge <> nil then
    begin
      vDadosIni.vGauge.MinValue := 0;
      vDadosIni.vGauge.MaxValue := 100;
      vDadosIni.vGauge.Visible := True;
    end;
  end;
  fPos := ByArchive;
  if vDadosIni.vGauge <> nil then
  begin
    vDadosIni.vGauge.Progress := ByArchive;
    Application.ProcessMessages;
  end;
  if vDadosIni.vLbStatus <> nil then
  begin
    if fValidandoArquivo then
      vDadosIni.vLbStatus.Caption := 'Validando arquivo ' + IntToStr(ByArchive) + ' %'
    else
      vDadosIni.vLbStatus.Caption := 'Extraindo arquivos ' + IntToStr(ByArchive) + ' %';
    Application.ProcessMessages;
  end;
end;

procedure TDescompactadorHw.zipHwProgress(Sender: TObject; ProgressByFile,
  ProgressByArchive: Byte);
begin
  if (fPos = 0) and (ProgressByArchive > 0) then
  begin
    fStatus := 'COMPRIMINDO';
    if vDadosIni.vGauge <> nil then
    begin
      vDadosIni.vGauge.MinValue := 0;
      vDadosIni.vGauge.MaxValue := 100;
      vDadosIni.vGauge.Visible := True;
    end;
  end;
  fPos := ProgressByArchive;
  if vDadosIni.vGauge <> nil then
  begin
    vDadosIni.vGauge.Progress := ProgressByArchive;
    Application.ProcessMessages;
  end;
  if vDadosIni.vLbStatus <> nil then
  begin
    if fValidandoArquivo then
      vDadosIni.vLbStatus.Caption := 'Validando arquivo ' + IntToStr(ProgressByArchive) + ' %'
    else
      vDadosIni.vLbStatus.Caption := 'Comprimindo arquivos ' + IntToStr(ProgressByArchive) + ' %';
    Application.ProcessMessages;
  end;
end;

procedure TDescompactadorHw._clear;
begin
  fPos := 0;
  fMax := 100;
  fStatus := '';
  fValidandoArquivo := False;
  fDescompactando := False; 
end;

function TDescompactadorHw._compactar(pArquivoZip,
  pPastaOrigem: string): Boolean;
Var
   vFilesCompressed: Integer;
   vSenha: string;
Begin

  if FileExists(pArquivoZip) Then
    if Application.MessageBox('O arquivo informado já existe. Sobreescrever?', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = IDYES Then
      ztvGbls._EraseFile(pArquivoZip, doAllowUndo) // doAllowUndo = move to recycle bin
    else
      Exit;

  PostMessage(frmHwUpdate.Handle, WM_USER + 123, 0, 0);
  if not InputQuery('Senha arquivo', 'Informe a senha do arquivo', vSenha) then
    vSenha := ''
  else if Trim(vSenha) = '' then
    vSenha := '';

  if Trim(vSenha) <> '' then
    zipHw.EncryptionMethod := emAes2_256
  else
    zipHw.EncryptionMethod := emNone;
  zipHw.ArcType := atZip;
  zipHw.Password := vSenha;
  zipHw.ArchiveFile := pArquivoZip;      // archive filename
  zipHw.DateAttribute := daFileDate;    // default value
  zipHw.StoredDirNames := sdRelative;   // default value
  zipHw.CompressMethod := cmMsZip; //cmDeflate;    // default value
  zipHw.RecurseDirs := True; // default = False
  zipHw.Switch := swAdd;                // default value
  zipHw.StoreEmptySubDirs := False;     // default value
  zipHw.EncryptHeaders := False; // default = False
   // ======================================
  // set seed keys (from frmSeekKeys form)
  // and activate compression
  // ======================================
  ///   If IsSeedKeysSupported(zipHw.ArcType) Then
  ///   Begin
  ///      zipHw.SeedDataKeys.SetKeys(
  ///         frmSeedKeys.edtDataKey0.Text,
  ///         frmSeedKeys.edtDataKey1.Text,
  ///         frmSeedKeys.edtDataKey2.Text);
  ///      zipHw.SeedHeaderKeys.SetKeys(
  ///         frmSeedKeys.edtHeaderKey0.Text,
  ///         frmSeedKeys.edtHeaderKey1.Text,
  ///         frmSeedKeys.edtHeaderKey2.Text);
  ///   End;
  zipHw.ExcludeSpec.Clear();
  zipHw.FileSpec.Clear();
  zipHw.FileSpec.Add(pPastaOrigem + '*.*' );       // test with c:\windows\*.txt
  // ****************************************************************
  // NOTE: for a better understanding of how the Attributes property
  // works with file attributes see demo demos\filescan\fs_demo.dpr.
  // ****************************************************************
  // See the Attributes property in the object inspector
  // Set zipHw Attributes property by calling the SetAttribute method
  zipHw.SetAttribute(fsZeroAttr, True); 		// default
  zipHw.SetAttribute(fsArchive, True);  		// default
  zipHw.SetAttribute(fsDirectory, True); 		// default = False
  zipHw.SetAttribute(fsHidden, True);   		// default = False
  zipHw.SetAttribute(fsReadOnly, True); 		// default
  zipHw.SetAttribute(fsSysFile, True);  		// default = False
  // See the AttributesEx property in teh object inspector
  // Set the AttributesEx property by calling the SetAttributeEx method.
  // Exclude none
  zipHw.SetAttributeEx(fsZeroAttr, False); 	// default
  zipHw.SetAttributeEx(fsArchive, False); 	// default
  zipHw.SetAttributeEx(fsDirectory, False); 	// default
  zipHw.SetAttributeEx(fsHidden, False); 		// default
  zipHw.SetAttributeEx(fsReadOnly, False); 	// default
  zipHw.SetAttributeEx(fsSysFile, False); 	// default
  vFilesCompressed := zipHw.Compress();       // <<--
  Application.MessageBox(pchar('Arquivo de atualização montado. Total de arquivos: ' + IntToStr(vFilesCompressed)),
    'Atenção', 0 + 64);
end;

function TDescompactadorHw._descompactar(pArquivoZip,
  pPastaDestino, pSenha: string): Boolean;
var
  FilesExtracted: Integer;
begin

  Result := False;

  if not FileExists(pArquivoZip) then
    raise Exception.Create('Arquivo não encontrado. Endereço: ' + pArquivoZip);

  if not DirectoryExists(pPastaDestino) then
    CreateDir(pPastaDestino);

  if not DirectoryExists(pPastaDestino) then
    raise Exception.Create('Diretório não encontrado e o sistema não conseguiu criar o mesmo. Diretório: ' + pPastaDestino);

  _clear;
  fSenha := pSenha;

  fStatus := 'INICIO';

  with unZipHw do
  begin
    if Trim(fSenha) <> '' then
      EncryptionMethod := emAes2_256
    else
      EncryptionMethod := emNone;
    ArchiveFile := pArquivoZip;
    ExtractDir := pPastaDestino;
    UseStoredDirs := True;
    DateAttribute := daFileDate;
    ConfirmOverwrites := False;
    OverwriteMode := omOverwrite;
    RestoreFileAttr := True;
    CreateStoredDirs := True;
    TranslateOemChar := True;
    RecurseDirs := True;
    VolumeName := '';
    FileSpec.Clear();
    FileSpec.Add('*.*');
    FilesExtracted := unZipHw.Extract();
    fStatus := 'CONCLUIDO';
  end;

  try
    fDescompactando := True;
    Result := (FilesExtracted > 0) and (_validarArquivo(pArquivoZip, pSenha));

  finally
    fDescompactando := False;
  end;
end;

function TDescompactadorHw._validarArquivo(pArquivoZip,
  pSenha: string): Boolean;
var
  FilesExtracted: Integer;
  vPastaDestino: string;
  vArquivoVersao: TStringList;
begin

  Result := False;

  if not FileExists(pArquivoZip) then
  begin
    if fDescompactando then
      Exit;
    raise Exception.Create('Arquivo não encontrado. Endereço: ' + pArquivoZip);
  end;

  vPastaDestino := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\TempVal' ;

  if not DirectoryExists(  vPastaDestino) then
    CreateDir(vPastaDestino);

  if not DirectoryExists(vPastaDestino) then
  begin
    if fDescompactando then
      Exit;
    raise Exception.Create('O sistema necessita validar o arquivo. Sem permissão para extrair arquivo no diretório: ' + vPastaDestino);
  end;

  if FileExists(vPastaDestino + '\versao.hw') then
    SysUtils.DeleteFile(vPastaDestino + '\versao.hw');

  fSenha := pSenha;

  fStatus := 'INICIO';

  FilesExtracted := 0;

  fValidandoArquivo := True;
  try

    with unZipHw do
    begin
      ArchiveFile := pArquivoZip;
      ExtractDir := vPastaDestino;
      UseStoredDirs := True;
      DateAttribute := daFileDate;
      ConfirmOverwrites := False;
      OverwriteMode := omOverwrite;
      RestoreFileAttr := True;
      CreateStoredDirs := True;
      TranslateOemChar := True;
      RecurseDirs := True;
      VolumeName := '';
      FileSpec.Clear();
      FileSpec.Add('versao.hw');
      FilesExtracted := unZipHw.Extract();
      fStatus := 'CONCLUIDO';
    end;

  finally
    fValidandoArquivo := False;
  end;

  if FilesExtracted <= 0 then
  begin
    if fDescompactando then
      Exit;
    raise Exception.Create('O arquivo informado é inválido. Vazio');
  end;

  if not FileExists(vPastaDestino + '\versao.hw') then
  begin
    if fDescompactando then
      Exit;
    raise Exception.Create('O arquivo informado é inválido. Sem versão');
  end;

  vArquivoVersao := TStringList.Create;
  try
    vArquivoVersao.Clear;
    vArquivoVersao.LoadFromFile(vPastaDestino + '\versao.hw');

    try
      fVERSAO_HW := Trim(vArquivoVersao[0]);
      fDATA_VERSAO := StrToDate(vArquivoVersao[1]);
      fSTATUS_VERSAO_HW := 'DISPONIVEL';
      Result := (fVERSAO_HW <> '') and (fDATA_VERSAO > 0);
    except     
      if fDescompactando then
        Exit;
      raise Exception.Create('Versão do arquivo incompativel');
    end;
  finally
    vArquivoVersao.Free;
  end;
end;

{ TConfig_HwUpdate }

constructor TConfig_HwUpdate.create;
begin
  createComponentes;

  fPATHS_AD_SISTEMA := TStringList.Create;
  fPATHS_AD_REL_RET := TStringList.Create;
  fCNPJClientes := TStringList.Create;
end;

destructor TConfig_HwUpdate.Destroy;
begin
  fPATHS_AD_SISTEMA.Free;
  fPATHS_AD_REL_RET.Free;
  fCNPJClientes.Free;
  fPATHS_AD_SISTEMA := nil;
  fPATHS_AD_REL_RET := nil;
  fCNPJClientes := nil;
  inherited;
end;

procedure TConfig_HwUpdate._clear;
begin
  fHD_PC := '';
  fPATHARQUIVOS := '';
  fCNPJ := '';
  fPATHS_AD_SISTEMA.Clear;
  fPATHS_AD_REL_RET.Clear;
  fVERSAO_HW := '';
  fDATA_CONS_WS := 0;
end;

function TConfig_HwUpdate._getConfig(pSilent: Boolean = True): Boolean;
var
  vTemp: string;
  vVersaoTmp: string;
begin
  Result := False;
  try
    fCNPJClientes.Clear;
    fMeuHD := vDadosIni._getSerialHd;

    _lerConfigIni;

    if not _conectarBanco then
    begin
      Application.MessageBox('Erro ao conectar com o banco de dados. Verifique o erros.log' , 'Atenção', 0 + 64 );
      Exit;
    end;

    try

      fBuscas.Close;
      fBuscas.SQL.Text := 'select CGC_EMP, (select current_ts from sp_current_ts(0)) datahora from EMPRESA';
      fBuscas.Open;

      fBuscas.First;
      while not fBuscas.Eof do
      begin
        fCNPJClientes.Add(Trim(fBuscas.FieldByName('CGC_EMP').AsString));
        fBuscas.Next;
      end;

      vDadosIni.DataHoraAtualBanco := fBuscas.FieldByName('datahora').AsDateTime;

      fBuscas.Close;
      fBuscas.SQL.Text := 'select * from CONFIG_HWUPDATE where COD_HWUPDATE = 1';
      fBuscas.Open;

      _clear;

      if fBuscas.IsEmpty then
      begin
        Result := True;
        Exit;
      end;

      fHD_PC := fBuscas.FieldByName('HD_PC').AsString;
      try fHD_PC_INST := fBuscas.FieldByName('HD_PC_INST').AsString; except end;

      fPATHARQUIVOS := fBuscas.FieldByName('PATHARQUIVOS').AsString;
      fCNPJ := fBuscas.FieldByName('CNPJ').AsString;
//      fPATHS_AD_SISTEMA.Text := fBuscas.FieldByName('PATHS_AD_SISTEMA').AsString;
      if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

      if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update');

      if FileExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update\PathAdSistema.txt') then
        fPATHS_AD_SISTEMA.LoadFromFile(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update\PathAdSistema.txt');
//      fPATHS_AD_REL_RET.Text := fBuscas.FieldByName('PATHS_AD_REL_RET').AsString;
      if FileExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update\PathAdRelatorios.txt') then
        fPATHS_AD_REL_RET.LoadFromFile(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update\PathAdRelatorios.txt');
      fVERSAO_HW := fBuscas.FieldByName('VERSAO_HW').AsString;
      fSTATUS_VERSAO_HW := fBuscas.FieldByName('STATUS_VERSAO_HW').AsString;
      if Trim(fBuscas.FieldByName('DATA_CONS_WS').AsString) <> '' then
        fDATA_CONS_WS := fBuscas.FieldByName('DATA_CONS_WS').AsDateTime
      else
        fDATA_CONS_WS := StrToDate('01/01/1990');
      fVERSAO_INST := Trim(fBuscas.FieldByName('VERSAO_INST').AsString);
      fSITUACAO_INST := Trim(fBuscas.FieldByName('SITUACAO_INST').AsString);
      fSTAND_ALONE := Trim(fBuscas.FieldByName('STAND_ALONE').AsString);
      fATIVO := fBuscas.FieldByName('ATIVO').AsInteger;
      vDadosIni.vStandAlone := fSTAND_ALONE;
      fHOMOLOGACAO := Trim(fBuscas.FieldByName('HOMOLOGACAO').AsString);
      vDadosIni.vProducaoHomologacao := fHOMOLOGACAO;
      if Copy(vDadosIni.vProducaoHomologacao, 1, 1) = 'H' then
        vDadosIni.vProducaoHomologacao := 'H'
      else
        vDadosIni.vProducaoHomologacao := 'P';

      if fSTAND_ALONE = 'S' then
      begin
        fPATHARQUIVOS := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update';
        vVersaoTmp := _getConfiguracoesRegistroString('Config', 'Versao');
        if Trim(vVersaoTmp) <> Trim(fVERSAO_HW) then
          fSTATUS_VERSAO_HW := ''
        else
        begin
          fVERSAO_HW := vVersaoTmp;
          fSTATUS_VERSAO_HW := _getConfiguracoesRegistroString('Config', 'Status');
        end;
//        fPATHS_AD_SISTEMA.Text := _getConfiguracoesRegistroString('Config', 'PathsAdicionais_Sistema');
//        fPATHS_AD_REL_RET.Text := _getConfiguracoesRegistroString('Config', 'PathsAdicionais_Relatorios');
//        vTemp := _getConfiguracoesRegistroString('Config', 'DataConsulta');
//        if Trim(vTemp) = '' then
//          fDATA_CONS_WS := StrToDate('01/01/1990')
//        else
//          fDATA_CONS_WS := StrToDateTime(vTemp);
      end;

      if not DirectoryExists(fPATHARQUIVOS) then
        CreateDir(fPATHARQUIVOS);

      Result := True;
    finally
      _desconectaBanco;
    end;
  except on e: exception do
    begin
      Result := False;
      if not pSilent then
        Application.MessageBox(pchar('Erro ao obter configuração. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_getConfig] [MS:' + e.Message + ']');
      _registraErro('_getConfig. Erro: ' + e.Message);
    end;
  end;
end;

function TConfig_HwUpdate._getVersaoCaption(pVersao: string): string;
var
  vVer, vVer2: string;
  I: Integer;
begin
  vVer := StringReplace(pVersao, '_', '',[rfReplaceAll]);
  if Copy(vVer, 1, 1) = '0' then
    Delete(vVer,1,1);
  vVer2 := '';
  while Length(Trim(vVer)) > 0   do
  begin
    vVer2 := vVer2 + Copy(vVer, 1, 1) + '.';
    vVer := Copy(vVer, 2, Length(Trim(vVer)));
  end;
  Result := Copy(vVer2,1, Length(Trim(vVer2)) - 1 );
end;

function TConfig_HwUpdate._setConfigCadastro: Boolean;
var
  vHDSql: string;
  vAntStandAlone: string;
  vNivelProcesso, vNivelUsuario: Integer;
  vUsuario, vSenha: string;
  vAlterarConfHD: Boolean;
begin
  Result := False;
  try
    if not _conectarBanco then
    begin
      Application.MessageBox('Erro ao conectar com o banco de dados. Verifique o erros.log' , 'Atenção', 0 + 64 );
      Exit;
    end;

    try
      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;

      vAlterarConfHD := False;

      if (Trim(fHD_PC) <> '') or (Trim(fHD_PC_INST) <> 'DEIXAR') then
      begin
        vAlterarConfHD := True;
        fBuscas.Close;
        fBuscas.SQL.Text := 'select cod_processo, NIVEL_PROCESSO from TABELA_PROCESSOS tp' +
          ' inner join empresa e on e.cod_empresa = tp.cod_empresa' +
          ' where e.cgc_emp = ' + QuotedStr(fCNPJ) +
          ' and cod_processo = ''HWU001''';
        fBuscas.Open;
        if Trim(fBuscas.FieldByName('cod_processo').AsString) <> 'HWU001' then
        begin
          Application.MessageBox('Processo "HWU001 - Alterar PC responsável" não encontrado ou empresa não é válida' , 'Atenção', 0 + 64 );
          vAlterarConfHD := False;
        end;
        vNivelProcesso := fBuscas.FieldByName('nivel_processo').AsInteger;

        if vAlterarConfHD then
          if not InputQuery('Processo HWU001 - Alterar PC responsável', 'Alterar PC responsável' + #13 + #13 + 'Informe o seu usuário', vUsuario) then
          begin
            Application.MessageBox('Usuário não informado' , 'Atenção', 0 + 64 );
            vAlterarConfHD := False;
          end;

        if vAlterarConfHD then
        begin
          PostMessage(frmHwUpdate.Handle, WM_USER + 123, 0, 0);
          if not InputQuery('Processo HWU001', 'Alterar PC responsável' + #13 + #13 + 'Informe a sua senha', vSenha) then
          begin
            Application.MessageBox('Senha não informada' , 'Atenção', 0 + 64 );
            vAlterarConfHD := False;
          end;
        end;

        if vAlterarConfHD then
        begin
          vUsuario := Trim(UpperCase(vUsuario));
          vSenha := Trim(UpperCase(vSenha));
          fBuscas.Close;
          fBuscas.SQL.Text := 'select usuario, senha, nivel_us from senhas s' +
            ' inner join empresa e on e.cod_empresa = s.cod_empresa' +
            ' where e.cgc_emp = ' + QuotedStr(Trim(fCNPJ)) +
            ' and s.usuario = ' + QuotedStr(Trim(vUsuario)) +
            ' and s.senha = ' + QuotedStr(vDadosIni.codifica(vSenha)) +
            ' and coalesce(s.usuario, '''') <> ''''';
          fBuscas.Open;
          if Trim(fBuscas.FieldByName('usuario').AsString) <> Trim(vUsuario) then
          begin
            Application.MessageBox('Usuário ou senha inválidos' , 'Atenção', 0 + 64 );
            vAlterarConfHD := False;
          end;
          vNivelUsuario := fBuscas.FieldByName('nivel_us').AsInteger;

          if vNivelUsuario < vNivelProcesso then
          begin
            fBuscas.Close;
            fBuscas.SQL.Text := 'select USUARIO, COD_PROCESSO from TABELA_PROCESSOS_USUARIOS tp' +
              ' inner join empresa e on e.cod_empresa = tp.cod_empresa' +
              ' where e.cgc_emp = ' + QuotedStr(fCNPJ) +
              ' and tp.cod_processo = ''HWU001''' +
              ' and tp.usuario = ' + QuotedStr(Trim(vUsuario));
            fBuscas.Open;

            if (Trim(fBuscas.FieldByName('usuario').AsString) <> Trim(vUsuario)) or
              (Trim(fBuscas.FieldByName('cod_processo').AsString) <> 'HWU001' ) then
            begin
              Application.MessageBox('Processo "HWU001 - Alterar PC responsável" não permitido para o Usuário' , 'Atenção', 0 + 64 );
              vAlterarConfHD := False;
            end;
          end;
        end;
      end;

      fBuscas.Close;
      fBuscas.SQL.Text := 'select * from CONFIG_HWUPDATE where COD_HWUPDATE = 1';
      fBuscas.Open;
      vAntStandAlone := fBuscas.FieldByName('STAND_ALONE').AsString;

      if (vAntStandAlone = 'S') and (fSTAND_ALONE = 'N') then
        if Application.MessageBox('Voce não esta mais usando a configuração para funcionamento em modo StandAlone. Talvez seja necessário refazer as atualizações caso elas não tenham sido completadas. Deseja continuar assim mesmo?',
          'Confirmação' , MB_ICONQUESTION + MB_YESNO ) <> IDYES then
          Exit;
      if (vAntStandAlone = 'N') and (fSTAND_ALONE = 'S') then
        if Application.MessageBox('Voce está configurando o HwUpdate para funcionar em modo StandAlone. Talvez seja necessário refazer as atualizações caso elas não tenham sido completadas. Deseja continuar assim mesmo?',
          'Confirmação' , MB_ICONQUESTION + MB_YESNO ) <> IDYES then
          Exit;

      if fATIVO = 0 then
        if Application.MessageBox('HwUpdate desativado. Deseja ativa-lo agora?',
          'Confirmação' , MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
          fATIVO := 1;

      vHDSql := '';
      fExec.Close;
      if fBuscas.IsEmpty then
        fExec.SQL.Text :=
          'insert into CONFIG_HWUPDATE' +
          ' (COD_HWUPDATE, HD_PC, PATHARQUIVOS, CNPJ, PATHS_AD_SISTEMA,' +
          ' PATHS_AD_REL_RET, STAND_ALONE, HOMOLOGACAO, ATIVO)' +
          ' values' +
          ' (1, ' + QuotedStr(fMeuHD) + ', :PATHARQUIVOS, :CNPJ, :PATHS_AD_SISTEMA,' +
          ' :PATHS_AD_REL_RET, :STAND_ALONE, :HOMOLOGACAO, :ATIVO)'
      else
      begin
        if (Trim(fHD_PC) <> '') and (vAlterarConfHD) then
          vHDSql := 'HD_PC = ' + QuotedStr(fHD_PC)+ ',';
        fExec.SQL.Text :=
          'update CONFIG_HWUPDATE set ' +
          ' PATHARQUIVOS = :PATHARQUIVOS, CNPJ = :CNPJ, STAND_ALONE = :STAND_ALONE,' + vHDSql +
          ' PATHS_AD_SISTEMA = :PATHS_AD_SISTEMA, PATHS_AD_REL_RET = :PATHS_AD_REL_RET,' +
          ' HOMOLOGACAO = :HOMOLOGACAO, ATIVO = :ATIVO' +
          ' where COD_HWUPDATE = 1';
      end;

      fExec.ParamByName('PATHARQUIVOS').AsString := fPATHARQUIVOS;
      fExec.ParamByName('CNPJ').AsString := fCNPJ;
      fExec.ParamByName('STAND_ALONE').AsString := fSTAND_ALONE;
//      fExec.ParamByName('PATHS_AD_SISTEMA').AsString := fPATHS_AD_SISTEMA.Text;
//      fExec.ParamByName('PATHS_AD_REL_RET').AsString := fPATHS_AD_REL_RET.Text;
      fPATHS_AD_SISTEMA.SaveToFile(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update\PathAdSistema.txt');
      fPATHS_AD_REL_RET.SaveToFile(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update\PathAdRelatorios.txt');
      fExec.ParamByName('HOMOLOGACAO').AsString := fHOMOLOGACAO;
      fExec.ParamByName('ATIVO').AsInteger := fATIVO;

      fExec.ExecSQL;

      if (Trim(fHD_PC_INST) <> 'DEIXAR') and (vAlterarConfHD) then
      begin
        fExec.Close;
        fExec.SQL.Text := 'update CONFIG_HWUPDATE set HD_PC_INST = ' +QuotedStr(Trim(fHD_PC_INST)) +
          ' where COD_HWUPDATE = 1';
        try fExec.ExecSQL; except end;
      end;

      if fExec.Transaction.InTransaction then
        fExec.Transaction.Commit;

      if fSTAND_ALONE = 'S' then
      begin
        //fPATHARQUIVOS := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update';
//        _setConfiguracoesRegistroString('Config', 'PathsAdicionais_Sistema', fPATHS_AD_SISTEMA.Text);
//        _setConfiguracoesRegistroString('Config', 'PathsAdicionais_Relatorios', fPATHS_AD_REL_RET.Text);
      end;

      Result := True;
    finally
      _desconectaBanco;
    end;
  except on e: exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao salvar configuração. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
      _registraErro('_setConfigCadastro. Erro: ' + e.Message);
    end;
  end;
end;

function TConfig_HwUpdate._setConfigDataHoraConsulta(pSilent: Boolean = True): Boolean;
begin
  Result := False;
  try

    if not _conectarBanco then
    begin
      Exit;
    end;

    try

      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;

      fBuscas.Close;
      fBuscas.SQL.Text := 'select * from CONFIG_HWUPDATE where COD_HWUPDATE = 1';
      fBuscas.Open;

      fExec.Close;
      if fBuscas.IsEmpty then
        Exit
      else
        fExec.SQL.Text :=
          'update CONFIG_HWUPDATE set' +
          ' DATA_CONS_WS = :DATA_CONS_WS' +
          ' where COD_HWUPDATE = 1';

      fExec.ParamByName('DATA_CONS_WS').AsDateTime := vDadosIni.DataHoraAtualBanco;
      fExec.ExecSQL;

      if fExec.Transaction.InTransaction then
        fExec.Transaction.Commit;

//      if fSTAND_ALONE = 'S' then
//        _setConfiguracoesRegistroString('Config', 'DataConsulta', DateTimeToStr(vDadosIni.DataHoraAtualBanco));

      Result := True;
    finally
      _desconectaBanco;
    end;
  except on e: exception do
    begin
      Result := False;
      if not pSilent then
        Application.MessageBox(pchar('Erro ao salvar configuração. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_setConfigDataHoraConsulta] [MS:' + e.Message + ']');
      _registraErro('_setConfigDataHoraConsulta. Erro: ' + e.Message);
    end;
  end;
end;

function TConfig_HwUpdate._setConfigVersao: Boolean;
var
  vTemp, vVersaoTmp, vVersaoInstTmp, vStatusInstTmp: string;
begin
  Result := False;
  try

    if not _conectarBanco then
    begin
      Application.MessageBox('Erro ao conectar com o banco de dados. Verifique o erros.log' , 'Atenção', 0 + 64 );
      Exit;
    end;

    try

      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;

      fBuscas.Close;
      fBuscas.SQL.Text := 'select * from CONFIG_HWUPDATE where COD_HWUPDATE = 1';
      fBuscas.Open;

      vVersaoTmp := fBuscas.FieldByName('VERSAO_HW').AsString;
      vVersaoInstTmp := fBuscas.FieldByName('VERSAO_INST').AsString;

      fExec.Close;
      if fBuscas.IsEmpty then
        Exit;

      if ((fSTAND_ALONE = 'S') and (vVersaoTmp <> fVERSAO_HW)) or (fSTAND_ALONE <> 'S') then
      begin

        vTemp := '';
        if ((fSTAND_ALONE = 'S') or (fSTATUS_VERSAO_HW = 'CONCLUIDO')) and
          (vVersaoInstTmp <> fVERSAO_HW) then
          vTemp := vTemp + ', VERSAO_INST = ' + QuotedStr(fVERSAO_HW) +
            ', SITUACAO_INST = ''DISPONIVEL''';

        fExec.SQL.Text :=
          'update CONFIG_HWUPDATE set' +
          ' VERSAO_HW = :VERSAO_HW, STATUS_VERSAO_HW = :STATUS_VERSAO_HW' + vTemp +
          ' where COD_HWUPDATE = 1';

        fExec.ParamByName('VERSAO_HW').AsString := fVERSAO_HW;
        if fSTAND_ALONE = 'S' then
          fExec.ParamByName('STATUS_VERSAO_HW').AsString := 'CONCLUIDO'
        else
          fExec.ParamByName('STATUS_VERSAO_HW').AsString := fSTATUS_VERSAO_HW;

        fExec.ExecSQL;

        if fExec.Transaction.InTransaction then
          fExec.Transaction.Commit;

      end;

      if fSTAND_ALONE = 'S' then
      begin
        //fPATHARQUIVOS := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Hw Update';
        _setConfiguracoesRegistroString('Config', 'Versao', fVERSAO_HW);
        _setConfiguracoesRegistroString('Config', 'Status', fSTATUS_VERSAO_HW);
      end;

      Result := True;
    finally
      _desconectaBanco;
    end;
  except on e: exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao salvar configuração. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
      _registraErro('_setConfigVersao. Erro: ' + e.Message);
    end;
  end;
end;

function TConfig_HwUpdate._setConfigVersaoInst: Boolean;
begin
  Result := False;
  try

    if not _conectarBanco then
    begin
      Application.MessageBox('Erro ao conectar com o banco de dados. Verifique o erros.log' , 'Atenção', 0 + 64 );
      Exit;
    end;

    try

      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;

      fBuscas.Close;
      fBuscas.SQL.Text := 'select * from CONFIG_HWUPDATE where COD_HWUPDATE = 1';
      fBuscas.Open;

      fExec.Close;
      if fBuscas.IsEmpty then
        Exit;

      fExec.SQL.Text :=
        'update CONFIG_HWUPDATE set' +
        ' SITUACAO_INST = ''INSTALADA'' ' +
        ' where COD_HWUPDATE = 1';
      fExec.ExecSQL;

      if fExec.Transaction.InTransaction then
        fExec.Transaction.Commit;

      Result := True;
    finally
      _desconectaBanco;
    end;
  except on e: exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao salvar configuração. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
      _registraErro('_setConfigVersao. Erro: ' + e.Message);
    end;
  end;
end;

function TConfig_HwUpdate._setConfigCrcSeq(pPath: string): Boolean;
var
	crcOutput: TStringList;
	vCrcSeq: Double;
begin
  Result := False;

  try

    if not _conectarBanco then
    begin
      Application.MessageBox('Erro ao conectar com o banco de dados. Verifique o erros.log' , 'Atenção', 0 + 64 );
      Exit;
    end;

    try

      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;

      fBuscas.Close;
      fBuscas.SQL.Text := ' select chave, cod_empresa, value1_f from config_sistema ' +
      	' where chave = :chave ' +
        ' and cod_empresa = :cod_empresa ';
      fBuscas.ParamByName('chave').AsString := 'crc_seq';
      fBuscas.ParamByName('cod_empresa').AsInteger := 0;
      fBuscas.Open;

      if fBuscas.IsEmpty then
      begin
      	vCrcSeq := 1;

      	fBuscas.Close;
      	fBuscas.SQL.Text := ' update or insert into config_sistema ' +
        	' (chave, cod_empresa, display_, tag, type1_, value1_vc, value1_f, value1_b, ordem, ativo) ' +
          ' values (:chave, :cod_empresa, :display_, :tag, :type1_, :value1_vc, :value1_f, :value1_b, :ordem, :ativo) ' +
          ' matching (chave, cod_empresa); ';
        fBuscas.ParamByName('chave').AsString := 'crc_seq';
        fBuscas.ParamByName('cod_empresa').AsInteger := 0;
        fBuscas.ParamByName('display_').AsString := 'SEQUENCIAL CRC';
        fBuscas.ParamByName('type1_').AsString := 'integer';
        fBuscas.ParamByName('value1_f').AsFloat := vCrcSeq;
        fBuscas.ParamByName('ativo').AsInteger := 0;
        fBuscas.ExecSQL;

      	if fExec.Transaction.InTransaction then
          fExec.Transaction.Commit;
      end
      else
      begin
      	vCrcSeq := fBuscas.FieldByName('value1_f').AsFloat + 1;

        fBuscas.Close;
      	fBuscas.SQL.Text := ' update config_sistema set value1_f = :value1_f ' +
        	' where chave = :chave ' +
          ' and cod_empresa = :cod_empresa ';
        fBuscas.ParamByName('chave').AsString := 'crc_seq';
        fBuscas.ParamByName('cod_empresa').AsInteger := 0;
        fBuscas.ParamByName('value1_f').AsFloat := vCrcSeq;
        fBuscas.ExecSQL;

      	if fExec.Transaction.InTransaction then
          fExec.Transaction.Commit;
      end;

    finally
      _desconectaBanco;
    end;

    if (FileExists(pPath + 'CRCseq.txt')) and (not vDadosIni.ArquivoEmUso(pPath + 'CRCseq.txt')) then
    begin
      try
        crcOutput := TStringList.Create();
        crcOutput.LoadFromFile(pPath + 'CRCseq.txt');

        if crcOutput.Count = 1 then
          crcOutput.Add(IntToStr(Trunc(vCrcSeq)));
        crcOutput.SaveToFile(pPath + 'CRCseq.txt');
      finally
        crcOutput.Free;
      end;
    end;
  except on e: exception do
  	begin
      Result := False;
      Application.MessageBox(pchar('Erro ao sequencial CRC. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
      _registraErro('_setCrcSeq. Erro: ' + e.Message);
    end;
  end;
end;

{ THwUpdate_Pai }

constructor THwUpdate_Pai.createComponentes;
begin
  fConexao := TIBDatabase.Create(Application);
  fTransacao := TIBTransaction.Create(Application);

  fConexao.Connected := False;
  fConexao.DefaultTransaction := fTransacao;
  fConexao.LoginPrompt := false;
  fConexao.Params.Add('user_name=sysdba');
  fConexao.Params.Add('password=masterkey');

  fTransacao.DefaultDatabase := fConexao;
  fTransacao.Params.Add('read_committed');
  fTransacao.Params.Add('rec_version');
  fTransacao.Params.Add('nowait');

  fBuscas := TIBQuery.Create(Application);
  fBuscas.Database := fConexao;
  fExec := TIBQuery.Create(Application);
  fExec.Database := fConexao;
end;

function THwUpdate_Pai.GetIni(AChave, AIdentificador,
  AValorDefault: string): string;
var
  AFileName: string;
  AFile: TIniFile;
begin
  try
    AFileName := ExtractFilePath(ParamStr(0)) + 'hwsistemas.ini';
    if not FileExists(AFileName) then
      AFileName := ExtractFilePath(ParamStr(0)) + 'Config.ini';
    AFile := TIniFile.Create(AFileName);
    Result := AFile.ReadString(AChave, AIdentificador, AValorDefault);
  finally
    FreeAndNil(AFile);
  end;
end;

function THwUpdate_Pai._conectarBanco: Boolean;
var
  vPw, vUs: string;
begin
  vUs := string(__getUsuarioFDB);
  vPw := string(__getSenhaFDB);
  fConexao.Connected := False;
  if (Trim(vUs) <> '') then
    fConexao.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
  if (Trim(vPw) <> '') then
    fConexao.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
  fConexao.DatabaseName := fEnderecoBanco;
  try
    fConexao.Connected := True;
    Result := True;
  except
    on e: exception do begin
      Result := false;
      _registraErro('Erro ao conectar ao banco. Erro: ' + e.Message);
    end;
  end;
end;

function THwUpdate_Pai._criarTabelas: Boolean;
var
  vScript: TIBScript;
  vLista: TStringList;
  I: Integer;
begin
  Result := True;
  try
    _lerConfigIni;

    if not _conectarBanco then
      raise Exception.Create('Não foi possível conectar ao banco de dados');

    try
      try
        fBuscas.Close;
        fBuscas.SQL.Text := 'select ativo from CONFIG_HWUPDATE where COD_HWUPDATE = 1';
        fBuscas.Open;

        fBuscas.Close;
        fBuscas.SQL.Text := 'select VERSAO from VERSAO_HW where VERSAO = ''0''';
        fBuscas.Open;

        fBuscas.Close;
        fBuscas.SQL.Text := 'select HD_PC_INST from CONFIG_HWUPDATE where COD_HWUPDATE = 1';
        fBuscas.Open;
      except
        vLista := TStringList.Create;
        vLista.Clear;
        vLista.Add('CREATE TABLE CONFIG_HWUPDATE ( COD_HWUPDATE SMALLINT NOT NULL);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD HD_PC CHAR(8);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD PATHARQUIVOS VARCHAR(256);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD CNPJ  VARCHAR(14);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD PATHS_AD_SISTEMA BLOB SUB_TYPE 1 SEGMENT SIZE 80;');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD PATHS_AD_REL_RET BLOB SUB_TYPE 1 SEGMENT SIZE 80;');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD VERSAO_HW VARCHAR(10);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD STATUS_VERSAO_HW VARCHAR(10);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD DATA_CONS_WS TIMESTAMP;');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD VERSAO_INST VARCHAR(10);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD SITUACAO_INST VARCHAR(20);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD STAND_ALONE CHAR(1);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD HOMOLOGACAO CHAR(1);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD ATIVO SMALLINT DEFAULT 1;');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD HD_PC_INST CHAR(8);');
        vLista.Add('ALTER TABLE CONFIG_HWUPDATE ADD CONSTRAINT PK_CONFIG_HWUPDATE PRIMARY KEY (COD_HWUPDATE);)');
        vLista.Add('CREATE TABLE VERSAO_HW (VERSAO VARCHAR(10) NOT NULL);');
        vLista.Add('ALTER TABLE VERSAO_HW ADD DATA_VERSAO TIMESTAMP;');
        vLista.Add('ALTER TABLE VERSAO_HW ADD LINK_DOWNLOAD VARCHAR(256);');
        vLista.Add('ALTER TABLE VERSAO_HW ADD DATA_DOWNLOAD TIMESTAMP DEFAULT CURRENT_DATE;');
        vLista.Add('ALTER TABLE VERSAO_HW ADD QTDE_DOWNLOAD SMALLINT;');
        vLista.Add('ALTER TABLE VERSAO_HW ADD QTDE_DESCOMPACTACAO SMALLINT;');
        vLista.Add('ALTER TABLE VERSAO_HW ADD SENHA_ARQUIVO VARCHAR(32);');
        vLista.Add('ALTER TABLE VERSAO_HW ADD STATUS VARCHAR(20);');
        vLista.Add('ALTER TABLE VERSAO_HW ADD DATA_TENTATIVA_AT TIMESTAMP;');
        vLista.Add('ALTER TABLE VERSAO_HW ADD LOG_ATUALIZACAO BLOB SUB_TYPE 1 SEGMENT SIZE 80;');
        vLista.Add('ALTER TABLE VERSAO_HW ADD LOG_ENVIADO CHAR(1);');
        vLista.Add('ALTER TABLE VERSAO_HW ADD STATUS_AT_PC BLOB SUB_TYPE 1 SEGMENT SIZE 80');
        vLista.Add('ALTER TABLE VERSAO_HW ADD CONSTRAINT PK_VERSAO_HW PRIMARY KEY (VERSAO);');
        vLista.Add('INSERT INTO CONFIG_SISTEMA (CHAVE, COD_EMPRESA, VALUE1_F, ATIVO) VALUES (''crc_seq'', 0, 1, 0);');

        vScript := TIBScript.Create(Application);
        try
          vScript.Database := fConexao;
          vScript.Transaction := fTransacao;


          for I := 0 to vLista.Count - 1 do
            try
              if not vScript.Transaction.InTransaction then
                vScript.Transaction.StartTransaction;
              vScript.Script.Text := vLista[I];
              vScript.ExecuteScript;
              if vScript.Transaction.InTransaction then
                vScript.Transaction.Commit;
            except
            end;
        finally
          vScript.Free;
          vScript := nil;
        end;
      end;

    finally
      _desconectaBanco;
    end;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao obter tabelas no HwUpdate. Erro: ' + E.Message), 'Atenção',
        MB_ICONERROR + MB_OK);
    end;
  end;
end;

function THwUpdate_Pai._desconectaBanco: Boolean;
begin
  try
    if fConexao.Connected then
      fConexao.Connected := False;
  except
    on e: exception do begin
      _registraErro('Erro ao desconectar ao banco. Erro: ' + e.Message);
    end;
  end;
end;

function THwUpdate_Pai._lerConfigIni: Boolean;
begin
  try
    try

      Result := true;
      fEnderecoArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
      if not FileExists(fEnderecoArqIni) then
        fEnderecoArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
      fArqConfig := TIniFile.Create(fEnderecoArqIni);
      fEnderecoBanco := fArqConfig.ReadString('Banco', 'HW', '');
      fPastaRelRetaguarda := fArqConfig.ReadString('Sistema', 'PastaRel', '');
      fPastaRelFinanceiro := fPastaRelRetaguarda + '\CX';

    except
      Result := false;
    end;
    
  finally
    fArqConfig.Free;
  end;
end;

function THwUpdate_Pai._getConfiguracoesRegistroInteger(pClasse,
  pCampo: string): Integer;
var
  Registro: TRegistry;
  vTemp: Integer;
begin
  try
    vTemp := 0;
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + pClasse , True);
      vTemp := Registro.ReadInteger(pCampo);
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function THwUpdate_Pai._getConfiguracoesRegistroString(pClasse,
  pCampo: string): string;
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    vTemp := '';
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + pClasse , True);
      vTemp := Registro.ReadString(pCampo);
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

procedure THwUpdate_Pai._registraErro(pMenserro: string);
var
  vArquivo: TextFile;
  vNomeArq: string;
  vAuxStr: string;
begin
  try
    vNomeArq := ExtractFilePath(Application.Exename) + 'erros.log';
    AssignFile(vArquivo, vNomeArq);
    if not FileExists(vNomeArq) then
      Rewrite(vArquivo)
    else
      append(vArquivo);
    vAuxStr := 'ERRO: ' + pMenserro + ' Dia: ' + datetostr(date) + ' Hora: ' + timetostr(time) + ' HwAtualizador';
    WriteLn(vArquivo, vAuxStr);
    closeFile(vArquivo);
  except
  end;
end;

procedure THwUpdate_Pai._setConfiguracoesRegistroInteger(pClasse,
  pCampo: string; pValor: Integer);
var
  Registro: TRegistry;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + pClasse, True);
      Registro.WriteInteger(pCampo, pValor);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure THwUpdate_Pai._setConfiguracoesRegistroString(pClasse, pCampo,
  pValor: string);
var
  Registro: TRegistry;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + pClasse, True);
      Registro.WriteString(pCampo, pValor);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function THwUpdate_Pai._strZero(pNum: string; pTam: Integer): string;
var
  I: Integer;
  V1: string;
begin
  V1 := Trim(pNum);
  for I := 1 to pTam - Length(V1) do
    V1 := '0' + V1;
  Result := V1;
end;

{ TVersoes_HW }

constructor TVersoes_HW.create;
begin
  createComponentes;
  fLOG_ATUALIZACAO := TStringList.Create;
  fSTATUS_AT_PC:= TStringList.Create;
end;

destructor TVersoes_HW.Destroy;
begin
  fLOG_ATUALIZACAO.Free;
  fLOG_ATUALIZACAO := nil;
  fSTATUS_AT_PC.Free;
  fSTATUS_AT_PC := nil;
  inherited;
end;

procedure TVersoes_HW._clear;
begin
  fVERSAO := '';
  fSENHA_ARQUIVO := '';
  fDATA_DOWNLOAD := 0;
  fQTDE_DOWNLOAD := 0;
  fQTDE_DESCOMPACTACAO := 0;
  fSTATUS := '';
  fDATA_TENTATIVA_AT := 0;
  fLOG_ENVIADO := '';
  fSTATUS_AT_PC.Clear;
end;

function TVersoes_HW._getTodasVersoes: string;
var
  vTemp: string;
  vLista: TStringList;
begin
  Result := '';
  try
    _lerConfigIni;

    if not _conectarBanco then
    begin
      Application.MessageBox('Erro ao conectar com o banco de dados. Verifique o erros.log' , 'Atenção', 0 + 64 );
      Exit;
    end;

    try

      fBuscas.Close;
      fBuscas.SQL.Text := 'select versao from VERSAO_HW order by versao desc';
      fBuscas.Open;

      vLista:= TStringList.Create;
      vLista.Clear;

      fBuscas.First;
      while not fBuscas.Eof do
      begin

        vLista.Add(fBuscas.FieldByName('versao').AsString);
        fBuscas.Next;
      end;
      Result := vLista.Text;

      vLista.Free;

    finally
      _desconectaBanco;
    end;
  except on e: exception do
    begin
      Result := '';
      Application.MessageBox(pchar('Erro ao obter configuração. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
    end;
  end;
end;

function TVersoes_HW._getVersao(
  pVersao: string; pSilent: Boolean): Boolean;
var
  vTemp: string;
begin
  Result := False;
  try
    _lerConfigIni;

    if not _conectarBanco then
    begin
      if not pSilent then
        Application.MessageBox('Erro ao conectar com o banco de dados. Verifique o erros.log' , 'Atenção', 0 + 64 );
      Exit;
    end;

    try

      fBuscas.Close;
      fBuscas.SQL.Text := 'select * from VERSAO_HW where VERSAO = ' + QuotedStr(pVersao);
      fBuscas.Open;

      _clear;
      fLOG_ATUALIZACAO.Clear;

      if fBuscas.IsEmpty then
      begin
        Result := True;
        Exit;
      end;

      fVERSAO := fBuscas.FieldByName('VERSAO').AsString;
      fDATA_VERSAO := fBuscas.FieldByName('DATA_VERSAO').AsDateTime;
      fDATA_DOWNLOAD := fBuscas.FieldByName('DATA_DOWNLOAD').AsDateTime;
      fLINK_DOWNLOAD := fBuscas.FieldByName('LINK_DOWNLOAD').AsString;
      fSENHA_ARQUIVO := vDadosIni.decodifica(fBuscas.FieldByName('SENHA_ARQUIVO').AsString);
      fQTDE_DOWNLOAD := fBuscas.FieldByName('QTDE_DOWNLOAD').AsInteger;
      fQTDE_DESCOMPACTACAO := fBuscas.FieldByName('QTDE_DESCOMPACTACAO').AsInteger;
      fSTATUS := fBuscas.FieldByName('STATUS').AsString;
      fDATA_TENTATIVA_AT := fBuscas.FieldByName('DATA_TENTATIVA_AT').AsDateTime;
      fLOG_ATUALIZACAO.Text := fBuscas.FieldByName('LOG_ATUALIZACAO').AsString;
      fLOG_ENVIADO := fBuscas.FieldByName('LOG_ENVIADO').AsString;              
      fSTATUS_AT_PC.Text := fBuscas.FieldByName('STATUS_AT_PC').AsString;

      if vDadosIni.vStandAlone = 'S' then
      begin
        vTemp := _getConfiguracoesRegistroString('Versao\' + pVersao, 'Versao');
        if Trim(fVERSAO) > Trim(vTemp) then
        begin
          fSTATUS := '';
          fQTDE_DOWNLOAD := 0;
          fQTDE_DESCOMPACTACAO := 0;
          fDATA_DOWNLOAD := 0;
          Result := True;
          Exit;
        end;
        fLINK_DOWNLOAD := _getConfiguracoesRegistroString('Versao\' + pVersao, 'LinkDownload');
        fSENHA_ARQUIVO := vDadosIni.decodifica(_getConfiguracoesRegistroString('Versao\' + pVersao, 'PW'));
        fQTDE_DOWNLOAD := _getConfiguracoesRegistroInteger('Versao\' + pVersao, 'QtdeDownload');
        fQTDE_DESCOMPACTACAO := _getConfiguracoesRegistroInteger('Versao\' + pVersao, 'QtdeExtracao');
        fSTATUS := _getConfiguracoesRegistroString('Versao\' + pVersao, 'Status');

        vTemp := _getConfiguracoesRegistroString('Versao\' + pVersao, 'DataVersao');
        if Trim(vTemp) = '' then
          fDATA_VERSAO := StrToDate('01/01/1990')
        else
          fDATA_VERSAO := StrToDateTime(vTemp);

        vTemp := _getConfiguracoesRegistroString('Versao\' + pVersao, 'DataDownload');
        if Trim(vTemp) = '' then
          fDATA_DOWNLOAD := StrToDate('01/01/1990')
        else
          fDATA_DOWNLOAD := StrToDateTime(vTemp);
      end;

      Result := True;
    finally
      _desconectaBanco;
    end;
  except on e: exception do
    begin
      Result := False;
      if not pSilent then
        Application.MessageBox(pchar('Erro ao obter configuração. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_getVersao] [MS:' + e.Message + ']');
      _registraErro('_getVersao. Erro: ' + e.Message);
    end;
  end;
end;

function TVersoes_HW._gravarLogAtualizacao(pVersao: string): Boolean;
var
  vLista: TStringList;
begin
  Result := False;
  try
    if not _conectarBanco then
      Exit;

    try

      fBuscas.Close;
      fBuscas.SQL.Text := 'select LOG_ATUALIZACAO from VERSAO_HW' +
                          ' where VERSAO = :VERSAO';
      fBuscas.ParamByName('VERSAO').AsString := pVersao;
      fBuscas.Open;

      vLista := TStringList.Create;
      vLista.Text := fBuscas.FieldByName('LOG_ATUALIZACAO').AsString;
      vLista.Text := vLista.Text + (fLogProcessamento.Text);

      fExec.Close;
      fExec.SQL.Text := 'update VERSAO_HW set LOG_ATUALIZACAO = :LOG_ATUALIZACAO' +
                        ' where VERSAO = :VERSAO';
      fExec.ParamByName('VERSAO').AsString := pVersao;
      fExec.ParamByName('LOG_ATUALIZACAO').AsString := vLista.Text;// fLOG_ATUALIZACAO.Text;
      fExec.ExecSQL;

      if fExec.Transaction.InTransaction then
        fExec.Transaction.Commit;

      Result := True;
    finally
      _desconectaBanco;
    end;
  except
    on E: Exception do begin
      Result := False;
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_gravarLogAtualizacao] [MS:' + e.Message + ']');
      _registraErro('_gravarLogAtualizacao. Erro: ' + e.Message);
    end;
  end;
end;

function TVersoes_HW._montarStatusParaWS(pVersao, pProcesso: string;
  pFalha: Boolean): Boolean;
///  pProcesso: A ou I,
///    A: Atualização: Verificação Webservice, download e extração
///    I: Instalação do sistema em cada maquina
///    Quando ocorrer erro gerar um log [MT:_atualizacao] [ERRO]
///      caso a nova tentativa tenha sucesso alterar para [MT:_atualizacao] [OK]
///  O mesmo vale para Instalação, lembrando que por maquina e apenas um status, ou seja
///  se ocorrer erro em 1 maquina o status será [MT:_instacao] [ERRO]
var
  I: Integer;
  vLista: TStringList;
  vAdd: Boolean;
begin

  Result := False;
  try
    if not _conectarBanco then
      Exit;

    try
      fBuscas.Close;
      fBuscas.SQL.Text := 'select VERSAO, STATUS_AT_PC from VERSAO_HW where VERSAO = :VERSAO';
      fBuscas.ParamByName('VERSAO').AsString := pVersao;
      fBuscas.Open;

      vLista := TStringList.Create;
      vLista.Text := fBuscas.FieldByName('STATUS_AT_PC').AsString;

      vAdd := True;
      for I := 0 to vLista.Count - 1 do
        if (Copy(vLista[I], 5, 13)) = ('[SH:' + vDadosIni.vMeuSerialHD+']') then
          if (Copy(pProcesso, 1, 1) = 'A') and ((Copy(vLista[I], 1, 3)) = ('[A]')) then // Atualização
          begin
            if not pFalha then
              vLista[I] := '[A] [SH:' + vDadosIni.vMeuSerialHD + ']' + ' [ST:CONCLUIDA]'
            else
              vLista[I] := '[A] [SH:' + vDadosIni.vMeuSerialHD + ']' + ' [ST:FALHA]';
            vAdd := False;
          end
          else if (Copy(pProcesso, 1, 1) = 'I') and ((Copy(vLista[I], 1, 3)) = ('[I]')) then // Instalação
          begin
            if not pFalha then
              vLista[I] := '[I] [SH:' + vDadosIni.vMeuSerialHD + ']' + ' [ST:CONCLUIDA]'
            else
              vLista[I] := '[I] [SH:' + vDadosIni.vMeuSerialHD + ']' + ' [ST:FALHA]';
            vAdd := False;
          end
          else if (Copy(pProcesso, 1, 1) = 'I') and ((Copy(vLista[I], 1, 3)) = ('[A]')) and (not pFalha) then  // Caso seja instalação e bem sucedida, a atualização sera alterada para CONCLUIDA
            vLista[I] := '[A] [SH:' + vDadosIni.vMeuSerialHD + ']' + ' [ST:CONCLUIDA]';

      if vAdd then
        if (Copy(pProcesso, 1, 1) = 'A') and (not pFalha) then
          vLista.Add('[A] [SH:' + vDadosIni.vMeuSerialHD + ']' + ' [ST:CONCLUIDA]')
        else if (Copy(pProcesso, 1, 1) = 'A') and (pFalha) then
          vLista.Add('[A] [SH:' + vDadosIni.vMeuSerialHD + ']' + ' [ST:FALHA]')
        else if (Copy(pProcesso, 1, 1) = 'I') and (not pFalha) then
          vLista.Add('[I] [SH:' + vDadosIni.vMeuSerialHD + ']' + ' [ST:CONCLUIDA]')
        else if (Copy(pProcesso, 1, 1) = 'I') and (pFalha) then
          vLista.Add('[I] [SH:' + vDadosIni.vMeuSerialHD + ']' + ' [ST:FALHA]');

      fExec.Close;
      fExec.SQL.Text := 'update VERSAO_HW set STATUS_AT_PC = :STATUS_AT_PC, LOG_ENVIADO = ''P''' +
                        ' where VERSAO = :VERSAO';
      fExec.ParamByName('VERSAO').AsString := pVersao;
      fExec.ParamByName('STATUS_AT_PC').AsString := vLista.Text;
      fExec.ExecSQL;

      if fExec.Transaction.InTransaction then
        fExec.Transaction.Commit;

//          '[A] [SH:12345678] [ST:CONCLUIDA]'
//          '[A] [SH:12345678] [ST:FALHA]'
//          '[I] [SH:12345678] [ST:CONCLUIDA]'
//          '[I] [SH:12345678] [ST:FALHA]'

    finally
      _desconectaBanco;
    end;

    Result := True;

  except
    on E: Exception do begin
      Result := False;
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_gravarLogAtualizacao] [MS:' + e.Message + ']');
      _registraErro('_gravarLogAtualizacao. Erro: ' + e.Message);
    end;
  end;



end;

function TVersoes_HW._setLogEnviadoVersao(pVersao: string): Boolean;
begin
  Result := False;
  try
    if not _conectarBanco then
    begin
      Exit;
    end;

    try
      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;

      fBuscas.Close;
      fBuscas.SQL.Text := 'select * from VERSAO_HW where VERSAO = ' + QuotedStr(pVersao);
      fBuscas.Open;

      if fBuscas.IsEmpty then
        Exit;

      fExec.SQL.Text := 'update VERSAO_HW set LOG_ENVIADO = ''S''' +
                        ' where VERSAO = :VERSAO';
      fExec.ParamByName('VERSAO').AsString := fVERSAO;
      fExec.ExecSQL;

      if fExec.Transaction.InTransaction then
        fExec.Transaction.Commit;

      Result := True;
    finally
      _desconectaBanco;
    end;
  except on e: exception do
    begin
      Result := False;
//      Application.MessageBox(pchar('Erro ao salvar configuração. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
      _registraErro('_setLogEnviadoVersao. Erro: ' + e.Message);
    end;
  end;
end;

function TVersoes_HW._setUltimaVersao(
  pUltVersao: string): Boolean;
var
  vUltStatus, vUltLog: string;
begin
  Result := False;
  try
    if not _conectarBanco then
    begin
      Exit;
    end;

    try
      if not fExec.Transaction.InTransaction then
        fExec.Transaction.StartTransaction;

      fBuscas.Close;
      fBuscas.SQL.Text := 'select * from VERSAO_HW where VERSAO = ' + QuotedStr(pUltVersao);
      fBuscas.Open;
      vUltStatus := Trim(fBuscas.FieldByName('STATUS').AsString);
      vUltLog:= Trim(fBuscas.FieldByName('LOG_ENVIADO').AsString);

      fExec.Close;
      if (fBuscas.FieldByName('VERSAO').AsString <> pUltVersao) then
      begin
        fExec.SQL.Text := 'insert into VERSAO_HW (VERSAO, DATA_VERSAO, LINK_DOWNLOAD, QTDE_DOWNLOAD, QTDE_DESCOMPACTACAO, STATUS, LOG_ENVIADO, DATA_TENTATIVA_AT, SENHA_ARQUIVO)' +
                          ' values (:VERSAO, :DATA_VERSAO, :LINK_DOWNLOAD, :QTDE_DOWNLOAD, :QTDE_DESCOMPACTACAO, :STATUS, :LOG_ENVIADO, (select current_ts from sp_current_ts(0)), :SENHA_ARQUIVO)';
        vUltLog := 'P';
      end
      else
      begin
        fExec.SQL.Text := 'update VERSAO_HW set QTDE_DOWNLOAD = :QTDE_DOWNLOAD, QTDE_DESCOMPACTACAO = :QTDE_DESCOMPACTACAO,' +
                          ' STATUS = :STATUS, DATA_VERSAO = :DATA_VERSAO, LINK_DOWNLOAD = :LINK_DOWNLOAD, LOG_ENVIADO = :LOG_ENVIADO, SENHA_ARQUIVO = :SENHA_ARQUIVO' +
                          ' where VERSAO = :VERSAO';
        if (Trim(fSTATUS) <> Trim(vUltStatus)) and (Trim(fSTATUS) <> '') then
          vUltLog := 'P';
      end;
      if (vDadosIni.vStandAlone <> 'S') or ((vDadosIni.vStandAlone = 'S') and (fBuscas.FieldByName('VERSAO').AsString <> pUltVersao)) then
      begin
        fExec.ParamByName('VERSAO').AsString := fVERSAO;
        fExec.ParamByName('DATA_VERSAO').AsDateTime := fDATA_VERSAO;
        fExec.ParamByName('QTDE_DOWNLOAD').AsInteger := fQTDE_DOWNLOAD;
        fExec.ParamByName('QTDE_DESCOMPACTACAO').AsInteger := fQTDE_DESCOMPACTACAO;
        if vDadosIni.vStandAlone = 'S' then
          fExec.ParamByName('STATUS').AsString := 'CONCLUIDO'
        else
          fExec.ParamByName('STATUS').AsString := fSTATUS;
        fExec.ParamByName('LINK_DOWNLOAD').AsString := fLINK_DOWNLOAD;
        fExec.ParamByName('SENHA_ARQUIVO').AsString := vDadosIni.codifica(fSENHA_ARQUIVO);
        fExec.ParamByName('LOG_ENVIADO').AsString := vUltLog;
        fExec.ExecSQL;

        if fExec.Transaction.InTransaction then
          fExec.Transaction.Commit;
      end
      else if (Trim(fLINK_DOWNLOAD) <> Trim(fBuscas.FieldByName('LINK_DOWNLOAD').AsString)) or
        (Trim(fSENHA_ARQUIVO) <> Trim(vDadosIni.decodifica(fBuscas.FieldByName('SENHA_ARQUIVO').AsString)))then
      begin
        fExec.Close;
        fExec.SQL.Text := 'update VERSAO_HW set LINK_DOWNLOAD = :LINK_DOWNLOAD, SENHA_ARQUIVO = :SENHA_ARQUIVO' +
                          ' where VERSAO = :VERSAO';
        fExec.ParamByName('VERSAO').AsString := fVERSAO;
        fExec.ParamByName('LINK_DOWNLOAD').AsString := fLINK_DOWNLOAD;
        fExec.ParamByName('SENHA_ARQUIVO').AsString := vDadosIni.codifica(fSENHA_ARQUIVO);
        fExec.ExecSQL;

        if fExec.Transaction.InTransaction then
          fExec.Transaction.Commit;
      end;

      if vDadosIni.vStandAlone = 'S' then
      begin
        _setConfiguracoesRegistroString('Versao\' + pUltVersao, 'Versao', fVERSAO);
        _setConfiguracoesRegistroString('Versao\' + pUltVersao, 'LinkDownload', fLINK_DOWNLOAD);
        _setConfiguracoesRegistroString('Versao\' + pUltVersao, 'PW', vDadosIni.codifica(fSENHA_ARQUIVO));
        _setConfiguracoesRegistroInteger('Versao\' + pUltVersao, 'QtdeDownload', fQTDE_DOWNLOAD);
        _setConfiguracoesRegistroInteger('Versao\' + pUltVersao, 'QtdeExtracao',fQTDE_DESCOMPACTACAO);
        _setConfiguracoesRegistroString('Versao\' + pUltVersao, 'Status', fSTATUS);
        _setConfiguracoesRegistroString('Versao\' + pUltVersao, 'DataVersao', FormatDateTime('dd/mm/yyyy', fDATA_VERSAO));
        _setConfiguracoesRegistroString('Versao\' + pUltVersao, 'DataDownload', FormatDateTime('dd/mm/yyyy hh:mm:ss', fDATA_DOWNLOAD));
      end;

      Result := True;
    finally
      _desconectaBanco;
    end;
  except on e: exception do
    begin
      Result := False;
//      Application.MessageBox(pchar('Erro ao salvar configuração. Erro: ' + e.Message) , 'Atenção', 0 + 64 );
      _registraErro('_setUltimaVersao. Erro: ' + e.Message);
    end;
  end;
end;

{ TWebServiceHw }

constructor TWebServiceHw.create;
begin

end;

function TWebServiceHw._enviaLogWebService(pCNPJ: string;
  pVersaoHw: TVersoes_HW): Boolean;
var
  vConsultaWS: TClientDataSet;
  vStatus: string;
  vWebService: TwsAtivaClienteSoap;
begin
  try
    Result := False;

    if pos('[ST:FALHA]', pVersaoHw.STATUS_AT_PC.Text) > 0 then
      vStatus := 'FALHA'
    else
      vStatus := 'CONCLUIDA';

    vWebService := GetTwsAtivaClienteSoap();
    vWebService.EnviarLogAtualizacaoCliente('HW', pCNPJ, vDadosIni.vProducaoHomologacao,
      pVersaoHw.VERSAO, vStatus, FormatDateTime('dd/mm/yyyy hh:mm:ss', pVersaoHw.DATA_TENTATIVA_AT));

    Result := True;

  except
    on e: exception do begin
      Result := False;
//      fLogProcessamento.Add('_enviaLogWebService. Erro: ' + e.Message);
      _registraErro('_enviaLogWebService. Erro: ' + e.Message);
    end;
  end;
end;

function TWebServiceHw._getVersaoWebService(pCNPJ: string;
  pSilent: Boolean = True): Boolean;
var
  vConsultaWS: TClientDataSet;
  vWebService: TwsAtivaClienteSoap;
  xXMLData: WideString;
begin
  try
    Result := False;

    vWebService := GetTwsAtivaClienteSoap();
    xXMLData := vWebService.PegarUltimaVersaoSistemaHw('HW', pCNPJ, vDadosIni.vProducaoHomologacao);

    try
      vConsultaWS := TClientDataSet.Create(Application);
      vConsultaWS.XMLData := xXMLData;

      fVERSAO_HW := Trim(vConsultaWS.FieldByName('VERSAO').AsString);
      fLINK_DOWNLOAD := Trim(vConsultaWS.FieldByName('LINK_DOWNLOAD').AsString);
      fDATA_VERSAO := StrToDateTime(Trim(vConsultaWS.FieldByName('DATA_VERSAO').AsString));
      fDATA_VERSAO := StrToDate(FormatDateTime('dd/mm/yyyy', fDATA_VERSAO));
      fSTATUS_VERSAO_HW := 'DISPONIVEL';
      fSTATUS_CLIENTE_NA_HW := Trim(vConsultaWS.FieldByName('STATUS_CLIENTE_NA_HW').AsString);
      fSENHA_ARQUIVO := Trim(vConsultaWS.FieldByName('SENHA_ARQUIVO').AsString);
      fLISTA_BUGS := Trim(vConsultaWS.FieldByName('LISTA_BUGS').AsString);

      if Trim(fVERSAO_HW) = '' then
        raise exception.create('Nenhuma versão retornada pelo webservice. Tipo: ' + vDadosIni.vProducaoHomologacao);
//
//      fUltVersao := QuotedStr(vConsultaWS.FieldByName('VERSAO_HW').AsString);
//      fLinkDonwload := Trim(vConsultaWS.FieldByName('LINK_HW').AsString);


//      Versao 0375
//      fVERSAO_HW := '0375';
//      fLINK_DOWNLOAD := 'http://goo.gl/R0CZlV';
//      fDATA_VERSAO := StrToDate('15/07/2013');
//      fSTATUS_VERSAO_HW := 'DISPONIVEL';
//      fSTATUS_CLIENTE_NA_HW := 'COMCONTRATO';
//      fSENHA_ARQUIVO := '';

//      Versao 0375_1 via arquivo
//      fVERSAO_HW := '0375_1';
//      fLINK_DOWNLOAD := 'http://goo.gl/R0CZlV';
//      fDATA_VERSAO := StrToDate('15/07/2013');
//      fSTATUS_VERSAO_HW := 'DISPONIVEL';
//      fSTATUS_CLIENTE_NA_HW := 'COMCONTRATO';

//       Versao 0376
//      fVERSAO_HW := '0376';
//      fLINK_DOWNLOAD := 'http://goo.gl/NHhtNW';
//      fDATA_VERSAO := StrToDate('01/08/2013');
//      fSTATUS_VERSAO_HW := 'DISPONIVEL';
//      fSTATUS_CLIENTE_NA_HW := 'COMCONTRATO';
//      fSENHA_ARQUIVO := 'ttadmin';

      Result := True;

    finally
      vConsultaWS.Free;
      vConsultaWS := nil;
    end;

  except
    on e: exception do begin
      Result := False;
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_getVersaoWebService] [MS:' + e.Message + ']');
        _registraErro('_getVersaoWebService. Erro: ' + e.Message);
      if not pSilent then
        Application.MessageBox(pchar('Erro ao obter dados pela internet. Verifique sua conexão. Erro: ' + e.Message),
          'Atenção', 0 + 64);
    end;
  end;
end;

{ TSingleton_AT }

function TSingleton_AT.ArquivoEmUso(CaminhoArquvo: string): Boolean;
var
	Arquivo: TFileStream;
begin
  Result := True;

  if not FileExists(CaminhoArquvo) then
  begin
  	Result := False;
    Exit;
  end;

  try
    Arquivo := TFileStream.Create(CaminhoArquvo, fmOpenReadWrite or fmShareExclusive);
    Arquivo.Free;
    Result := False;
  except
  	on E: EFOpenError do
    	Result := True; // Nao consegui abrir -> esta em uso
    on E: Exception do
    	Result := True; // Qualquer outro erro tambem indica que pode estar em uso
  end;
end;

function TSingleton_AT.codifica(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));
  wnormal := '  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*:\/.';
  wcripto := 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºusabcd';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  codifica := wresultado;
end;

constructor TSingleton_AT.Create;
begin
  vMeuPC := _getMeuPC;  
end;

function TSingleton_AT.decodifica(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));
  // wnormal:='  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-';
  // wcripto:='œ!=#$%^&*(|\][›?><:žŸ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+';

  wnormal := 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºusabcd';
  wcripto := '  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*:\/.';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  decodifica := wresultado;
end;

class function TSingleton_AT.GetInstance: TSingleton_AT;
begin
  if FInstance = nil then
  begin
    FInstance := TSingleton_AT.Create();
  end;
  Result := FInstance;
end;

function TSingleton_AT.PosEx(const SubStr, S: string; Offset: Integer): Integer;
var
  i, len, lenSub: Integer;
begin
  Result := 0;
  len := Length(S);
  lenSub := Length(SubStr);
  if (Offset > len) or (lenSub = 0) then
    Exit;

  for i := Offset to len - lenSub + 1 do
  begin
    if Copy(S, i, lenSub) = SubStr then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

procedure TSingleton_AT.SetProgresso(Value: Integer);
begin
  fProgresso := Value;
  if vGauge <> nil then
    vGauge.Progress := Value;
end;

procedure TSingleton_AT.SetProgressoMaximo(Value: Integer);
begin
  if vGauge <> nil then
    if vGauge.Progress <> Value then
       vGauge.MaxValue := Value;
end;

function TSingleton_AT.Split(const Str, Delimiter: string): TStringList;
var
  i: Integer;
  s: string;
  LenDelim: Integer;
  StartPos, EndPos: Integer;
begin
  Result := TStringList.Create;
  try
    LenDelim := Length(Delimiter);
    StartPos := 1;
    while StartPos <= Length(Str) do
    begin
      EndPos := PosEx(Delimiter, Str, StartPos);
      if EndPos = 0 then
        EndPos := Length(Str) + 1;

      s := Copy(Str, StartPos, EndPos - StartPos);
      Result.Add(s);
      StartPos := EndPos + LenDelim;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TSingleton_AT._createProcessSimple(pCmd: string;
  pWait: Boolean): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_SHOW;

  Result := CreateProcess(nil, PChar(pCmd), nil, nil, false, CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil, nil, SUInfo, ProcInfo);

  if (Result) then
  begin
    if pWait then
      WaitForSingleObject(ProcInfo.hProcess, INFINITE)
    else
      WaitForSingleObject(ProcInfo.hProcess, 0);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function TSingleton_AT._getDadosLog: string;
begin
  Result := '[DH:' + FormatDateTime('dd/mm/yyyy hh:mm:ss', DataHoraAtualBanco) + '] ' + vDadosIni.vMeuPC;
end;

function TSingleton_AT._getMeuPC: string;
  function _getcomputer: string;
  var
    vNomePC: string;
    vSize: Cardinal;
  begin
    vSize := 256;
    SetLength(vNomePC, vSize);
    GetComputerName(PChar(vNomePC), vSize);
    SetLength(vNomePC, StrLen(PChar(vNomePC)));
    result := vNomePC;
  end;

  function _getIP: string;
  var
    WSAData: TWSAData;
    HostEnt: PHostEnt;
    Name: string;
  begin
    WSAStartup(2, WSAData);
    SetLength(Name, 255);
    Gethostname(PChar(Name), 255);
    SetLength(Name, StrLen(PChar(Name)));
    HostEnt := gethostbyname(PChar(Name));
    with HostEnt^ do
    begin
      Result := Format('%d.%d.%d.%d',
        [Byte(h_addr^[0]), Byte(h_addr^[1]),
        Byte(h_addr^[2]), Byte(h_addr^[3])]);
    end;
    WSACleanup;
  end;

  function _getSerialHd: string;
  var
    sWinDir:string;
    nTam: integer;
    DLabel: array[0..11] of Char;
    Serial: DWord;
    DirLen, Flags: DWord;
  begin
    try
      nTam := MAX_PATH;
      SetLength(sWinDir, nTam);
      GetSystemDirectory(PChar(sWinDir), nTam);
      GetVolumeInformation(PChar(copy(sWinDir, 1, 1) + ':\'), dLabel, 12, @Serial, DirLen, Flags, nil,
        0);
      Result := IntToHex(Serial, 8);
    except
      Result := '';
    end;
  end;

begin
  vMeuIP := _getIP;
  vMeuSerialHD := _getSerialHd;
  vMeuNomePC := _getcomputer;

  Result := '[SH:' + vMeuSerialHD + '] [IP:' + vMeuIP + '] [PC:' + vMeuNomePC + ']';

end;

function TSingleton_AT._GetSerialHd: string;
var
  sWinDir:string;
  nTam: integer;
  DLabel: array[0..11] of Char;
  Serial: DWord;
  DirLen, Flags: DWord;
begin
  try
    nTam := MAX_PATH;
    SetLength(sWinDir, nTam);
    GetSystemDirectory(PChar(sWinDir), nTam);
    GetVolumeInformation(PChar(copy(sWinDir, 1, 1) + ':\'), dLabel, 12, @Serial, DirLen, Flags, nil,
      0);
    Result := IntToHex(Serial, 8);
  except
    Result := '';
  end;
end;

function TSingleton_AT._getSpecialFolderPath(folder: integer): string;
const
    SHGFP_TYPE_CURRENT = 0;
var
  vPath: array[0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @vPath[0])) then
    Result := vPath
  else
    Result := 'C:\WINDOWS\TEMP';
end;

{ TArquivosHW }

constructor TArquivosHW.create;
begin
	fcrc := TStringList.Create;
	fatualizador := TStringList.Create;
  fcrystalbin := TStringList.Create;
  frelfinanceiro  := TStringList.Create;
  frelretaguarda := TStringList.Create;
  fschemas := TStringList.Create;
  fsoftware := TStringList.Create;
  fsystem := TStringList.Create;
  fsystem32 := TStringList.Create;
  futilitarios := TStringList.Create;
  fwindows := TStringList.Create;

  fpathSoftwareAD := TStringList.Create;
  fpathRelRetaguardaAD := TStringList.Create;

  _clear;
end;

function TArquivosHW._alterFileTime(const pArquivo: string;
  const pData: TDateTime): Boolean;
var
  FileHandle: INTEGER;
begin
  if not fileExists(pArquivo) then
    Result := False
  else
  begin
    try
      FileHandle := FileOpen(pArquivo, fmOpenWrite or fmShareDenyNone);
      if FileHandle > 0 then
      begin
        FileSetDate(FileHandle, DateTimeToFileDate(pData));
        FileClose(FileHandle);
        Result := True;
      end;
    except
      on e: exception do
      begin
        Result := False;
        fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_alterFileTime] [MS:Arquivo: ' + pArquivo + ' - ' + e.Message + ']');
      end;
    end;
  end;
end;

function TArquivosHW._arquivosDoSistemaEmUso: Boolean;
var
  I: Integer;
begin
  Result := _IsFileInUse(ExtractFilePath(Application.ExeName) + 'HwSistemas.exe', False);
  if Result then
    Exit;
  Result := _IsFileInUse(ExtractFilePath(Application.ExeName) + 'Fiscal.exe', False);
  if Result then
    Exit;
  for I := 0 to fpathRelRetaguardaAD.Count - 1 do
  begin
    Result := _IsFileInUse(fpathRelRetaguardaAD[I] + 'HwSistemas.exe', False);
    if Result then
      Exit;
    Result := _IsFileInUse(fpathRelRetaguardaAD[I] + 'Fiscal.exe', False);
    if Result then
      Exit;
  end;
end;

procedure TArquivosHW._clear;
begin
	fcrc.Clear;
  fatualizador.Clear;
  fcrystalbin.Clear;
  frelfinanceiro .Clear;
  frelretaguarda.Clear;
  fschemas.Clear;
  fsoftware.Clear;
  fsystem.Clear;
  fsystem32.Clear;
  futilitarios.Clear;
  fwindows.Clear;

  fpathSoftwareAD.Clear;
  fpathRelRetaguardaAD.Clear;

  fpathRelFinanceiro := '';
  fpathRelRetaguarda := '';
end;

function TArquivosHW._copiarArquivos(pApenasValidarEmUso: Boolean): Boolean;
var
  i: Integer;
  vPathCopia: string;

  procedure _copiar(pPathCopia: string; pLista: TStringList);
  var
    J: Integer;
  begin
    for J := 0 to pLista.Count - 1 do
    begin
      if not DirectoryExists(pPathCopia) then
        CreateDir(pPathCopia);

      if (UpperCase(ExtractFileName(pLista[J])) = 'EXEC.TXT') or (UpperCase(ExtractFileName(pLista[J])) = 'REG.TXT') then
        Continue;

      if pApenasValidarEmUso then
      begin
        if _IsFileInUse(pPathCopia + ExtractFileName(pLista[J]), False) then
        begin
          Result := False;
          vFalhaCopia := True;
          vDadosIni.vListBox.Items.Add(pPathCopia + ExtractFileName(pLista[J]) + ' em uso');
        end;
      end
      else if not _IsFileInUse(pPathCopia + ExtractFileName(pLista[J]), True) then
      begin
        if vDadosIni.vLbStatus <> nil then
        begin
          vDadosIni.vLbStatus.Caption := 'Copiando ' + pPathCopia + ExtractFileName(pLista[J]);
          Application.ProcessMessages;
        end;
        if _copyFile(pLista[J], pPathCopia + ExtractFileName(pLista[J])) then
        begin
          _alterFileTime(pPathCopia + ExtractFileName(pLista[J]),
          FileDateToDateTime(FileAge(pLista[J])));
          if vDadosIni.vListBox <> nil then
          begin
            vDadosIni.vListBox.Items.Add(pPathCopia + ExtractFileName(pLista[J]));
            vDadosIni.vListBox.ItemIndex := vDadosIni.vListBox.Items.Count - 1;
          end;
        end
        else if vDadosIni.vListBox <> nil then
        begin
          vDadosIni.vListBox.Items.Add(pPathCopia + ExtractFileName(pLista[J]) + ' falha');
          if not vFalhaCopia then
            vFalhaCopia := True;
        end;
      end
      else if vDadosIni.vListBox <> nil then
      begin
        vDadosIni.vListBox.Items.Add(pPathCopia + ExtractFileName(pLista[J]) + ' em uso');
        if not vFalhaCopia then
          vFalhaCopia := True;
      end;

      if vDadosIni.vGauge <> nil then
      begin
        vDadosIni.vGauge.Progress := vDadosIni.vGauge.Progress + 1;
        Application.ProcessMessages;
      end;
    end;
  end;

begin
  Result := True;
  vFalhaCopia := False;
  if vDadosIni.vListBox <> nil then
  begin
    vDadosIni.vListBox.Visible := True;
    vDadosIni.vListBox.Items.Clear;
    if pApenasValidarEmUso then
      vDadosIni.vListBox.Items.Add('Validando arquivos')
    else
      vDadosIni.vListBox.Items.Add('Copiando arquivos');
    Application.ProcessMessages;
  end;
  if vDadosIni.vGauge <> nil then
  begin
    vDadosIni.vGauge.Visible := True;
    vDadosIni.vGauge.MinValue := 0;
    vDadosIni.vGauge.MaxValue := fcountArquivos;
    vDadosIni.vGauge.Progress := 0;
    Application.ProcessMessages;
  end;

//  vPathCopia := ExtractFilePath(Application.ExeName);
//  _copiar(vPathCopia, fatualizador);

  vPathCopia :=  vDadosIni._getSpecialFolderPath(CSIDL_PROGRAM_FILES_COMMON) + '\Crystal Decisions\2.5\bin\';
  _copiar(vPathCopia, fcrystalbin);

  vPathCopia :=  ExtractFilePath(Application.ExeName) +'Schemas\';
  _copiar(vPathCopia, fschemas);

  vPathCopia :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\system\';
  _copiar(vPathCopia, fsystem);

  vPathCopia :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\';
  _copiar(vPathCopia, fwindows);

  if DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\SysWOW64\') then
  begin
    vPathCopia :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\SysWOW64\';
    _copiar(vPathCopia, fsystem32);
  end;

  vPathCopia :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\system32\';
  _copiar(vPathCopia, fsystem32);

  vPathCopia :=  vDadosIni._getSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Hw Sistemas\Utilitarios\';
  _copiar(vPathCopia, futilitarios);

  vPathCopia := ExtractFilePath(Application.ExeName);
  _copiar(vPathCopia, fsoftware);
  if fcrc.Count > 0 then
  	_copiar(vPathCopia, fcrc);

  for I := 0 to fpathSoftwareAD.Count - 1 do
  begin
    vPathCopia :=  fpathSoftwareAD[I] + '\';
    _copiar(vPathCopia, fsoftware);
    if fcrc.Count > 0 then
    	_copiar(vPathCopia, fcrc);
  end;

  for I := 0 to fpathSoftwareAD.Count - 1 do
  begin
    vPathCopia :=  fpathSoftwareAD[I] + '\Schemas\';
    _copiar(vPathCopia, fschemas);
  end;

  vPathCopia :=  fpathRelRetaguarda + '\';
  _copiar(vPathCopia, frelretaguarda);

  for I := 0 to fpathRelRetaguardaAD.Count - 1 do
  begin
    vPathCopia :=  fpathRelRetaguardaAD[I] + '\';
    _copiar(vPathCopia, frelretaguarda);
  end;

  vPathCopia :=  fpathRelFinanceiro + '\';
  _copiar(vPathCopia, frelfinanceiro);

  for I := 0 to fpathRelRetaguardaAD.Count - 1 do
  begin
    vPathCopia :=  fpathRelRetaguardaAD[I] + '\CX\';
    _copiar(vPathCopia, frelfinanceiro);
  end;

  Result := not vFalhaCopia;

end;

function TArquivosHW._copyFile(pArquivoOrigem,
  pArquivoDestino: string): Boolean;
begin
  try
    Result := CopyFile(pchar(pArquivoOrigem), pchar(pArquivoDestino), False);
  except
    on e: exception do
    begin
      Result := False;
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_copyFile] [MS:Origem: ' + pArquivoOrigem +
        ' - Destino ' + pArquivoDestino + ' - ' + e.Message + ']');
    end;
  end;
end;

function TArquivosHW._executarAplicativos(pPath: string): Boolean;
var
  vPathTmp: string;
  I: Integer;

  procedure _executar(pFile: string);
  var
    J: Integer;
    vLista: TStringList;
    vFile: string;
  begin
    try
      if not FileExists(pFile) then
        Exit;

      vLista := TStringList.Create;
      vLista.LoadFromFile(pFile);
      for J := 0 to vLista.Count - 1 do
      begin
        vFile := '"'+vPathTmp + copy(vLista[J], 3, Length(vLista[J])) + '"';
        vDadosIni._createProcessSimple(vFile, copy(vLista[J], 1, 1) = 'A');
      end;

    except
      on e: exception do
      begin
        Result := False;
        fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_executarAplicativos] [MS:' + e.Message + ' - Arquivo ' + vFile + ']');
      end;
    end;
  end;

begin

  Result := True;

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_PROGRAM_FILES_COMMON) + '\Crystal Decisions\2.5\bin\';
  _executar(pPath + '\crystalbin\exec.txt');

  vPathTmp :=  ExtractFilePath(Application.ExeName) +'Schemas\';
  _executar(pPath + '\schemas\exec.txt');

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\system\';
  _executar(pPath + '\system\exec.txt');

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\';
  _executar(pPath + '\windows\exec.txt');

  if DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\SysWOW64\') then
  begin
    vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\SysWOW64\';
    _executar(pPath + '\system32\exec.txt');
  end;

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\system32\';
  _executar(pPath + '\system32\exec.txt');

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Hw Sistemas\Utilitarios\';
  _executar(pPath + '\utilitarios\exec.txt');

  vPathTmp := ExtractFilePath(Application.ExeName);
  _executar(pPath + '\software\exec.txt');

  for I := 0 to fpathSoftwareAD.Count - 1 do
  begin
    vPathTmp :=  fpathSoftwareAD[I] + '\';
    _executar(pPath + '\software\exec.txt');
  end;

  vPathTmp :=  fpathRelRetaguarda + '\';
  _executar(pPath + '\relretaguarda\exec.txt');

  for I := 0 to fpathRelRetaguardaAD.Count - 1 do
  begin
    vPathTmp :=  fpathRelRetaguardaAD[I] + '\';
    _executar(pPath + '\relretaguarda\exec.txt');
  end;

  vPathTmp :=  fpathRelFinanceiro + '\';
  _executar(pPath + '\relfinanceiro\exec.txt');

  for I := 0 to fpathRelRetaguardaAD.Count - 1 do
  begin
    vPathTmp :=  fpathRelRetaguardaAD[I] + '\CX\';
    _executar(pPath + '\relfinanceiro\exec.txt');
  end;
end;

function TArquivosHW._IsFileInUse(pArquivo: string; pGravarProc: Boolean): Boolean;
var
  HFileRes: HFILE;
  vLog: Boolean;
begin
  Result := false;
  if not FileExists(pArquivo) then
    exit;

  vLog := True;

  try
    try
      HFileRes := CreateFile(pchar(pArquivo), GENERIC_READ or GENERIC_WRITE, 0 {this is the trick!}, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
      Result := (HFileRes = INVALID_HANDLE_VALUE);
      if not Result then
        CloseHandle(HFileRes);
    except
      on e: exception do
      begin
        vLog := False;
        if pGravarProc then
          fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_IsFileInUse] [MS:Arquivo: ' + pArquivo + ' - ' + e.Message + ']');
      end;
    end;
  finally
    if (Result) and (vLog) and (pGravarProc) then
      fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_IsFileInUse] [MS:Arquivo em uso: ' + pArquivo + ']');
  end;
end;

procedure TArquivosHW._localizarArquivos(pPath: string; pLista: TStringList);
var
  vEncontrou: Integer;
  vRec: TSearchRec;
begin
  pPath := IncludeTrailingPathDelimiter(pPath);
  vEncontrou := FindFirst(pPath + '*.*', 0, vRec);
  try
    pLista.Clear;
    while vEncontrou = 0 do
    begin
      pLista.Add(pPath + vRec.Name);
      vEncontrou := FindNext(vRec);
    end;
  finally
    SysUtils.FindClose(vRec);
  end;
end;

function TArquivosHW._novaVersaoAtualizador(pPath: string): Boolean;
var
  I: Integer;
  vFileExistente, vFileNovo: string;
begin
  _localizarArquivos(pPath + '\atualizador', fatualizador);
  Result := False;
  for I := 0 to fatualizador.Count - 1 do
  begin
    vFileExistente := ExtractFilePath(Application.ExeName) + ExtractFileName(fatualizador[I]);
    vFileNovo := fatualizador[I];
    if not FileExists(vFileExistente) then
    begin
      Result := True;
      Exit;
    end;
    if FormatDateTime( 'dd/mm/yyyy', (FileDateToDateTime(FileAge(vFileNovo)))) >
      FormatDateTime( 'dd/mm/yyyy', (FileDateToDateTime(FileAge(vFileExistente)))) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function TArquivosHW._registrarDlls(pPath: string): Boolean;
var
  vPathSystem32, vPathSysWOW64, vPathTmp: string;
  I: Integer;

  procedure _registrar(pFile: string);
  var
    J: Integer;
    vLista: TStringList;
    vCMD: string;
  begin
    try
      if not FileExists(pFile) then
        Exit;

      vLista := TStringList.Create;
      vLista.LoadFromFile(pFile);
      for J := 0 to vLista.Count - 1 do
      begin
        if FileExists(vPathSysWOW64 + 'cmd.exe') then
          vCMD := vPathSysWOW64 + '\regsvr32.exe /s "' + vPathTmp + vLista[J] + '"'
        else if FileExists(vPathSystem32 + '\cmd.exe') then
          vCMD := vPathSystem32 + '\regsvr32.exe /s "' + vPathTmp + vLista[J] + '"';
        vDadosIni._createProcessSimple(vCMD, True);
      end;
    except
      on e: exception do
      begin
        Result := False;
        fLogProcessamento.Add('[ERRO] ' + vDadosIni._getDadosLog + ' [MT:_registrarDlls] [MS:' + e.Message + ' CMD ' + vCMD + ']');
      end;
    end;
  end;

begin

  Result := True;

  vPathSysWOW64 :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\SysWOW64\';
  vPathSystem32 :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\system32\';

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_PROGRAM_FILES_COMMON) + '\Crystal Decisions\2.5\bin\';
  _registrar(pPath + '\crystalbin\reg.txt');

  vPathTmp :=  ExtractFilePath(Application.ExeName) +'Schemas\';
  _registrar(pPath + '\schemas\reg.txt');

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\system\';
  _registrar(pPath + '\system\reg.txt');

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\';
  _registrar(pPath + '\windows\reg.txt');

  if DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\SysWOW64\') then
  begin
    vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\SysWOW64\';
    _registrar(pPath + '\system32\reg.txt');
  end;

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\system32\';
  _registrar(pPath + '\system32\reg.txt');

  vPathTmp :=  vDadosIni._getSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Hw Sistemas\Utilitarios\';
  _registrar(pPath + '\utilitarios\reg.txt');

  vPathTmp := ExtractFilePath(Application.ExeName);
  _registrar(pPath + '\software\reg.txt');

  for I := 0 to fpathSoftwareAD.Count - 1 do
  begin
    vPathTmp :=  fpathSoftwareAD[I] + '\';
    _registrar(pPath + '\software\reg.txt');
  end;

  vPathTmp :=  fpathRelRetaguarda + '\';
  _registrar(pPath + '\relretaguarda\reg.txt');

  for I := 0 to fpathRelRetaguardaAD.Count - 1 do
  begin
    vPathTmp :=  fpathRelRetaguardaAD[I] + '\';
    _registrar(pPath + '\relretaguarda\reg.txt');
  end;

  vPathTmp :=  fpathRelFinanceiro + '\';
  _registrar(pPath + '\relfinanceiro\reg.txt');

  for I := 0 to fpathRelRetaguardaAD.Count - 1 do
  begin
    vPathTmp :=  fpathRelRetaguardaAD[I] + '\CX\';
    _registrar(pPath + '\relfinanceiro\reg.txt');
  end;
end;

function TArquivosHW._validarArquivos(pPath: string): THWuRetornoMultiplo;
begin

  //armazendando endereço dos arquivos nas listas e fazendo um count

//  _localizarArquivos(pPath + 'atualizador', fatualizador);
  if FileExists(pPath + 'CRCseq.txt') then
  	fcrc.Add(pPath + 'CRCseq.txt');

  _localizarArquivos(pPath + 'crystalbin', fcrystalbin);
  _localizarArquivos(pPath + 'relfinanceiro', frelfinanceiro);
  _localizarArquivos(pPath + 'relretaguarda', frelretaguarda);
  _localizarArquivos(pPath + 'schemas', fschemas);
  _localizarArquivos(pPath + 'software', fsoftware);
  _localizarArquivos(pPath + 'system', fsystem);
  _localizarArquivos(pPath + 'system32', fsystem32);
  _localizarArquivos(pPath + 'utilitarios', futilitarios);
  _localizarArquivos(pPath + 'windows', fwindows);

  fcountArquivos := fatualizador.Count + fcrystalbin.Count + frelfinanceiro.Count +
    frelretaguarda.Count + fschemas.Count + fsoftware.Count + fsystem.Count +
    fsystem32.Count + futilitarios.Count;

  if DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_WINDOWS) + '\SysWOW64\') then
    fcountArquivos := fcountArquivos + fsystem32.Count;

  if fpathSoftwareAD.Count > 0 then
    fcountArquivos := fcountArquivos + (fpathSoftwareAD.Count * fsoftware.Count);

  if fpathSoftwareAD.Count > 0 then
    fcountArquivos := fcountArquivos + (fpathSoftwareAD.Count * fschemas.Count);

  if fpathRelRetaguardaAD.Count > 0 then
    fcountArquivos := fcountArquivos + (fpathRelRetaguardaAD.Count * frelretaguarda.Count);

  if fpathRelRetaguardaAD.Count > 0 then
    fcountArquivos := fcountArquivos + (fpathRelRetaguardaAD.Count * frelfinanceiro.Count);

  // validando se os arquivos das listas estão em uso

  if _copiarArquivos(True) then
  begin
    if fcountArquivos > 0 then
      Result := rmOk
    else
      Result := rmNenhumArquivo;
  end
  else
  begin
    if fcountArquivos > 0 then
      Result := rmArquivosEmUso
    else
      Result := rmNenhumArquivo;
    if Application.MessageBox(pchar('Exitem arquivos em uso. Estes arquivos não serão substituidos. Deseja continuar assim mesmo?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;


    if fcountArquivos > 0 then
      Result := rmOk
    else
      Result := rmNenhumArquivo;
    fLogProcessamento.Add('[INFO] ' + vDadosIni._getDadosLog + ' [MT:_validarArquivos] [MS:Arquivos em Uso. Prosseguir com instalacao]');
  end;
end;

function TArquivosHW._versaoValida(pPath, pVersao: string): Boolean;
var
  vArquivoVersao: TStringList;
  vVersaoArquivo: string;
begin
  Result := False;
  if not FileExists(pPath + '\versao.hw') then
    raise Exception.Create('Arquivos incompletos');

  vArquivoVersao := TStringList.Create;
  try
    vArquivoVersao.Clear;
    vArquivoVersao.LoadFromFile(pPath + '\versao.hw');

    try
      vVersaoArquivo := Trim(vArquivoVersao[0]);

      if Trim(vVersaoArquivo) = '' then
        raise Exception.Create('Versão incompleta');

      if Trim(vVersaoArquivo) <> Trim(pVersao) then
        raise Exception.Create('Versão diferente da versão dos arquivos');

      Result := True;
    except
      raise Exception.Create('Versão do arquivo incompativel');
    end;
  finally
    vArquivoVersao.Free;
  end;
end;

{ TSoftware_HW }

constructor TSoftware_HW.create;
begin
  fVERSAO := '';
  fDataVersao := '??/??/????';
  createComponentes;
end;

procedure TSoftware_HW.setfVERSAO(const Value: string);
begin
  fVERSAO := Value;
  fDataVersao := '??/??/????';

  try
    _lerConfigIni;
    if not _conectarBanco then
      Exit;

    try
      fBuscas.Close;
      fBuscas.SQL.Text := 'select DATA_VERSAO from VERSAO_HW where VERSAO = ' + QuotedStr(fVERSAO);
      fBuscas.Open;

      if fBuscas.IsEmpty then
        Exit;

      fDataVersao := FormatDateTime('dd/mm/yyyy', fBuscas.FieldByName('DATA_VERSAO').AsDateTime);
    finally
      _desconectaBanco;
    end;
  except
  end;  
end;

{ TBindStatusCallback }
 
function TBindStatusCallback.QueryInterface(const IID: TGUID; out Obj): Integer;
begin
  if GetInterface(IID, Obj) then
     Result := S_OK
  else
     Result := E_NOINTERFACE;
end;
 
function TBindStatusCallback._AddRef: Integer;
begin
  Inc(FRefCount);
  Result := FRefCount;
end;
 
function TBindStatusCallback._Release: Integer;
begin
  Dec(FRefCount);
  Result := FRefCount;
end;
 
function TBindStatusCallback.GetBindInfo(out grfBINDF: DWORD;
  var bindinfo: TBindInfo): HResult;
begin
  Result := E_NOTIMPL;
end;
 
function TBindStatusCallback.GetPriority(out nPriority): HResult;
begin
  Result := E_NOTIMPL;
end;
function TBindStatusCallback.OnDataAvailable(grfBSCF: DWORD; dwSize: DWORD; formatetc: PFormatEtc;
      stgmed: PStgMedium): HResult; stdcall;
begin
  Result := E_NOTIMPL;
end;
 
function TBindStatusCallback.OnLowResource(reserved: DWORD): HResult;
begin
  Result := E_NOTIMPL;
end;
 
function TBindStatusCallback.OnObjectAvailable(const iid: TGUID;
  punk: IUnknown): HResult;
begin
  Result := E_NOTIMPL;
end;
 
function TBindStatusCallback.OnStartBinding(dwReserved: DWORD;
  pib: IBinding): HResult;
begin
  Result := E_NOTIMPL;
end;

function TBindStatusCallback.OnStopBinding(hresult: HResult;
  szError: LPCWSTR): HResult;
begin
  Result := E_NOTIMPL;
end;

function TBindStatusCallback.OnProgress(ulProgress, ulProgressMax,
  ulStatusCode: ULONG; szStatusText: LPCWSTR): HResult;
var
  vTempExtended: Extended;
begin
  if vDadosIni.vLbStatus <> nil then
  begin
    vTempExtended := (ulProgress/1024)/1024;
    vDadosIni.vLbStatus.Caption := 'Baixando nova versão. ' + Format('%0.1n',[vTempExtended]) + ' MB  de ' + Format('%0.1n',[(ulProgressMax/1024)/1024])  + ' MB';
    Application.ProcessMessages;
  end;
  if vDadosIni.vGauge <> nil then
  begin
    vDadosIni.ProgressoMaximo := ulProgressMax;
    vDadosIni.Progresso := ulProgress;
    if not vDadosIni.vGauge.Visible then
      vDadosIni.vGauge.Visible := True;
    Application.ProcessMessages;
  end
  else if vAtHw.vDown <> nil then
  begin
    vAtHw.vDown.Posicao := ulProgress;
    vAtHw.vDown.Maximo := ulProgressMax;
    vTempExtended := (ulProgress/1024)/1024;
    Randomize;
    if Random(15) = 3 then
      vAtHw._showHint2(false, 'Download', Format('%0.1n',[vTempExtended]) + ' MB  de ' + Format('%0.1n',[(ulProgressMax/1024)/1024])  + ' MB' );
//    if (Trunc(ulProgressMax/) * 100) <= 1 then
//      vAtHw.vDown.Status :='INICIO'
//    else
//      vAtHw.vDown.Status :='EMANDAMENTO';
  end;
  Result := S_OK;
end;

end.
