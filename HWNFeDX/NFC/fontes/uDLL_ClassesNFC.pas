unit uDLL_ClassesNFC;

interface

uses
  uClasseConexao, IBX.IBQuery, Classes, ACBrNFe, ACBrMail, ACBrNFeDANFeESCPOS,
    ACBrPosPrinter, ACBrNFeDANFeRLClass, uNFC_Types, uHelperPosPrinter,
    nfce_class,
    nfce_dest_class,
    nfce_item_class,
    nfce_status_servico_class,
    nfce_pagamento_class,
    transp_nfce_class,
    TributoDFeContextEtdUnit,
    System.Generics.Collections;

const
  strVerVazio = '';
  strVer310   = '3.10';
  strVer400   = '4.00';

  sitVazio           = '';                 // Em branco apenas quando vem pela primeira vez para autorizar
  sitEnviando        = 'Enviando';         // Apenas quando o usuario dá o comando de Autorizar que vai gravar Enviando
  sitEmProcessamento = 'Em Processamento'; // Quando retorno status do lote em processamento
  sitDuplicidade     = 'Duplicidade';      // Quando ha duplicidade, porem o sistema ja trata isso antes de gravar
  sitAutorizada      = 'Autorizada';       // cstat = acbr.processada
  sitDenegada        = 'Denegada';         // cstat = denegada
  sitCancelada       = 'Cancelada';        // cstat = cancelada
  sitInutilizada     = 'Inutilizada';      // cstat = inutilizada
  sitRejeitada       = 'Rejeitada';        // qualquer rejeicao retornada pelo webservice

  stsFechada         = 'Fechada';    // nota pronta para autorizar
  stsACancelar       = 'A Cancelar'; // nota que nao pode ser autorizada por qualquer motivo e foi gerada uma contigencia a partir dela
                                     //   um espelho é gerado e essa nota fica para cancelar ou inutilizar

  actAutorizar     = 'autorizar';
  actCancelar      = 'cancelar';
  actInutilizar    = 'inutilizar';
  actImprimir      = 'imprimir';
  actEnviarEmail   = 'enviaremail';
  actAutorizarCont = 'enviarcontingencias';

  msgJustContingencia = 'Sem comunicação com webservice estadual';

type
  RParentMode = (pmUndefined, pmClient, pmServer);
  RMetodoWS   = (mwUndefined, mwAutorizacao, mwCancelamento, mwInutilizacao);
  RTasks      = (tsNone, tsCancelamento, tsInutilizacao, tsAutorizacao, tsConsulta, tsStsatusServico, tsRetornoAutorizacao);

  THwConf         = class; // Configurações, classe pai
  THwConfImp      = class; // Configurações de Impressão
  THwConfNFCe     = class; // Configurações da NFC-e
  THwNFC          = class; // Nota Fiscal de Consumidor, classe pai
  THwNFCe         = class; // NFC-e, serviços de comunicacao com webservice (envico, cancelamento, etc.)
  THwCentralAcoes = class; // Central de Acoes, verifica no banco o q fazer e cria as threads
  TThreadHwNFC    = class; // Thread de servicos, classe pai
  TImpressaoNFC   = class; // Thread de serviços de impressão da NFC
  TEnvioNFCe      = class; // Thread de servicos de envio da NFC-e
  TTaskNFCes      = class; // Tasks adicionais para cancelamento e inutilizacao quando necessari

  RCertificado = record
    DadosPFX, ArquivoPFX, NumeroSerie : string;
    Senha: AnsiString;
  end;

  RGeral = record
    IdCSC, CSC: string;
    TpEmis    : Smallint;
  end;

  RWebServices = record
  private
    function GetEnviarSincrono: Boolean;
    function GetEnviarAssincrono: Boolean;
  public
    UF, Ambiente, EnvSincAssinc               : string;
    Aguardar, Tentativas, Intervalo, TimeOut  : SmallInt;
    ProxyHost, ProxyPort, ProxyUser, ProxyPass: string;
    Visualizar                                : Boolean;
    SSLLib                                    : Integer;

    property EnviarSincrono: Boolean read GetEnviarSincrono ;
    //property EnviarAssincrono: Boolean read GetEnviarAssincrono;
  end;

  RValidacoes = record
    UsarStatusServico: Boolean;
    LimMinCancNormal: SmallInt;//Limite em minutos para cancelamento tipo de emissao normal
    LimDiasDEmiAtrasoCont: SmallInt; //Limite em dias para nao causar a rejeicao de data muito atrasada na contingencia
    LimDiasEntradaCont: SmallInt;//Limite em dias para data de entrada em contingência em nao dar rejeicao
    RejeicoesSemCtrl: string;
  end;

  RManutencao = record
    DiasHistoricoStatusServico: Integer;
    UltimoDiaManutencao: TDateTime;
  end;

  RArquivos = record
    PathSalvar, PathSchemas: string;
    LogoEmpresa: string;
  end;

  REmitente = record
    CNPJCPF, IE, Nome, Fant, Fone, CEP, Lgr, Nro, Cpl, Bairro,
    xMun, UF, xPais, IM, CNAE, CRT: string;
    cMun_IBGE                     : Integer;
    cPais                         : Smallint;
  end;

  REmail = record
    Host, Usuario, Senha, Porta, Assunto: string;
    DeUsuario: string;
    UsarSSL                             : Boolean;
    Mensagem                            : TStrings;
  end;

  RContingencia = record
    dataHora     : TDateTime;
    Justificativa: string;
    JustificativaAuto: string;
    AtivacaoAutomatica: Boolean;
    QtdeFalhasParaAtivar: Integer;
    QtdeSucessoParaDesativar: Integer;
    TentarAutorizarMesmoContingenciaAtivada: Boolean;
  end;

  RResposta = record
    cStat                        : Integer;
    xMotivo, nProt, chNFe, digVal: string;
    dhRecbto                     : TDateTime;
    XMLResp                      : string;
    MsgRetorno                   : string;
    Processada                   : Boolean;
    HashNFCe                     : string;
    verAplic                     : string;
    cMsg                         : Integer;
    xMsg                         : string;
  end;

  RPeriodicoEnvioContingencia = record
    IdThreadResponsavel  : Cardinal;
    UtltimaConsulta      : TDateTime;
    cStat_StatusServico  : Integer;
  end;

  RStatusServico = record
    Servico : RTasks;
    Mensagem: string;
    Sucess  : Boolean;
  end;

  TNfceItemModel = class(TNfce_item_class)
  private
    FTributoRtc: TributoDFeContextEtd;
    procedure SetTributoRtc(const Value: TributoDFeContextEtd);
  public
    destructor Destroy; override;
    property TributoRtc: TributoDFeContextEtd read FTributoRtc write SetTributoRtc;
  end;

  TributosDFeDict = TDictionary<string, TributoDFeContextEtd>;

  TNfceModel = class(TNfce_class)
  private
    FTributos  : TributosDFeDict;
  public
    constructor Create(ATributos: TributoDFeContextEtdList);
    destructor Destroy; override;

    property Tributos: TributosDFeDict read FTributos;
  end;

  THwConf = class
  private
    FContThreadsInativas  : Smallint;
    FSalvarLogNFC         : Boolean;
    FSalvarLogCentralAcoes: Boolean;
    FFilaThread           : TStrings;
    FMaxThreadsAtivas     : Smallint;
    procedure SetFilaThread(const Value: TStrings);
    procedure SetMaxThreadsAtivas(const Value: Smallint);
    procedure SetSalvarLogCentralAcoes(const Value: Boolean);
    procedure SetSalvarLogNFC(const Value: Boolean);
  public
    constructor create;
    destructor Destroy; override;
    function VerificarThreasInativas: Boolean;

    property FilaThread           : TStrings read FFilaThread            write SetFilaThread;
    property MaxThreadsAtivas     : Smallint read FMaxThreadsAtivas      write SetMaxThreadsAtivas;
    property SalvarLogNFC         : Boolean  read FSalvarLogNFC          write SetSalvarLogNFC;
    property SalvarLogCentralAcoes: Boolean  read FSalvarLogCentralAcoes write SetSalvarLogCentralAcoes;
  end;

  THwConfImp = class(THwConf)
  private
    FPosPrinter: RPosPrinter;
    FImpressao : RImpressaoNaoFiscal;
    procedure SetImpressao(const Value: RImpressaoNaoFiscal);
    procedure SetPosPrinter(const Value: RPosPrinter);
    procedure lerConfig;
  public
    constructor create;
    destructor Destroy; override;

    property PosPrinter: RPosPrinter         read FPosPrinter write SetPosPrinter;
    property Impressao : RImpressaoNaoFiscal read FImpressao  write SetImpressao;
  end;

  THwConfNFCe = class(THwConf)
  private
    FCodmpresa    : Integer;
    FCertificado  : RCertificado;
    FGeral        : RGeral;
    FArquivos     : RArquivos;
    FWebServices  : RWebServices;
    FEmitente     : REmitente;
    FEmail        : REmail;
    FContingencia : RContingencia;
    FPeriodicoCont: RPeriodicoEnvioContingencia;
    FVersaoQrCode: Integer;
//    FNT_2018_005  : Boolean;
    FValidacoes   : RValidacoes;
    FManutencao   : RManutencao;
    FLibSSLDFe    : RLibSSLDFe;
    FPrintSemPrev : string;
    Fnfc_nt_2020_006_data: TDateTime;
    FIdCSRT: string;
    FCSRT: string;
    procedure SetPeriodicoCont(const Value: RPeriodicoEnvioContingencia);
  public
    constructor Create;
    destructor Destroy; override;
    procedure SwitchJustificativaAuto;
    procedure SetNewUltimoDiaManutencao(CurrentDate: TDateTime);

    function LerConfiguracoes(CodigoEmpresa, CodigoEmissor: Integer; buscas: TIBQuery; IdToken: Integer = 1): Boolean;
    property Certificado  : RCertificado                read FCertificado;
    property Geral        : RGeral                      read FGeral;
    property WebServices  : RWebServices                read FWebServices;
    property Arquivos     : RArquivos                   read FArquivos;
    property CodEmpresa   : Integer                     read FCodmpresa;
    property Emitente     : REmitente                   read FEmitente;
    property Email        : REmail                      read FEmail;
    property Contingencia : RContingencia               read FContingencia;
    property PeriodicoCont: RPeriodicoEnvioContingencia read FPeriodicoCont write SetPeriodicoCont;
    property VersaoQrCode : Integer                     read FVersaoQrCode;
//    property NT_2018_005  : Boolean                     read FNT_2018_005;
    property Validacoes   : RValidacoes                 read FValidacoes;
    property Manutencao   : RManutencao                 read FManutencao;
    property nfc_nt_2020_006_data: TDateTime            read Fnfc_nt_2020_006_data write Fnfc_nt_2020_006_data;
    property LibSSLDFe    : RLibSSLDFe                  read FLibSSLDFe;
    property PrintSemPrev : string                      read FPrintSemPrev;
    property IdCSRT       : string                      read FIdCSRT;
    property CSRT         : string                      read FCSRT;
  end;

  TNFCe_StatusServico = class(TConexao)
  private
    FOwner  : THwNFCe;
    Fnfce_ss: TNfce_status_servico_class;
  public
    constructor Create(AOwner: THwNFCe);
    destructor Destroy; override;

    procedure Registrar(Sucess: Boolean = True);
    procedure StartLog(Service: RTasks; Msg: string);
  end;

  THwNFC = class(TConexao)
  private
    FCodEmissor: Integer;
  protected
    Buscas         : TIBQuery;
    FCodEmpresa    : Integer;
    FMensagemErro  : string;
    FClientOrServer: RParentMode;
    StatusServ     : TNFCe_StatusServico;
    FLogServ       : RStatusServico;
    procedure SetClientOrServer(const Value: RParentMode);
    procedure SetMensagemErro(const Value: string);
    procedure SetCodEmpresa(const Value: Integer);
    function retornaSerialHd: string;
    function cpfCnpjValido(cpfCnpj: string): Boolean;
  public
    destructor Destroy; override;
    constructor create;

    property CodEmpresa    : Integer     read FCodEmpresa     write SetCodEmpresa;
    property CodEmissor    : Integer     read FCodEmissor     write FCodEmissor;
    property MensagemErro  : string      read FMensagemErro   write SetMensagemErro;
    property ClientOrServer: RParentMode read FClientOrServer write SetClientOrServer;
  end;

  THwNFCe = class(THwNFC)
  strict private
    function ResolverRejeicao539(digVal: string; var xmlNFCe: string): Boolean;
  private
    ANFCe                 : TACBrNFe;
    AMail                 : TACBrMail;
    //FStandAlone           : Boolean;
    //FUseThread            : Boolean;
    UsaServidorAutorizacao: Boolean;
    UsaServidorImpressao  : Boolean;
    UsaServidorEmail      : Boolean;
    Ftoken                : string;
    FCodNFCe              : Integer;
    FUltimoLog            : string;
    FResp                 : RResposta;
    FAcoesAdicionais      : string;
    FBufferPosPrinter     : TStringList;
    FMetodoWS             : RMetodoWS;
    FArrayNFCe            : Array of Integer;
    FTask                 : TTaskNFCes;
    procedure SetAcoesAdicionais(const Value: string);
    procedure Settoken(const Value: string);
    procedure SetCodNFCe(const Value: Integer);
    procedure montarExecutarInsertSelect(Tabela, Select, CamposBloqueados, CamposChaveAdicionais,
      ValoresChavesEadcionais, CondicaoWhere: string);
    procedure ANFCeGerarLog(const ALogLine: string; var Tratado: Boolean);
    procedure ANFCeTransmitError(const HttpError, InternalError: Integer;
      const URL, DadosEnviados, SoapAction: String; var Retentar: Boolean; var Tratado: Boolean);
    procedure ClearResp;
    procedure AtualizarResultadoEnvioNFCe;
    procedure ChangeBufferPosPrinter(Sender: TObject);

    function StatusServico: Integer;
    function AcessoValido: Boolean;
    function NFCeValida(NewCOD_NFCE: Integer = 0; AutoCommit: Boolean = True; Contingencia: Boolean = False): Boolean;
    function ConfigurarACBr(Value: TACBrNFe): Boolean;
    function AddNFCeToACBr(CodigNFCe: Integer): Boolean;
    function AddNFCeToACBr_v400(CodigNFCe: Integer; var HashNFCe: string): Boolean;
    function RegistraCentralDeAcoes(Acao: string): Integer;

    function ConsultaNFCe: Integer;
    function ImprimirDANFE(TpImp: Integer):  Integer;
    function ImprimirInutilizacao: Integer;
    function EnviarNFCe(PeriodicoContigencia: Boolean = False): Integer;
    function CancelarNFCe: Integer;
    function InutilizarNFCe: Integer;
    function EnviarEmailNFCe: Integer;

  public
    destructor Destroy; override;
    constructor create;

    //function com prefixo Client sao usadas apenas para validar o acesso do usuario usando o token
    // ou seja, sao usadas pelo ERP da HW, o Serviço ja utiliza outras funções diratamente que nao validam esse acesso
    function ClientEnviar: Integer;
    function ClientCancelar: Integer;
    function ClientInutilizar: Integer;
    function ClientEnviarEmail(UsarServidor: Boolean): Integer;
    function ClientGerarContingencia: Integer;
    function ClientImprimirDANFe(TpImp: Integer): Integer;
    function ClientImprimirInutilizacao: Integer;
    function ServImprimirDANFe: Integer; //somente o serviço usa chamar este metodo
    function ServEnviarPendenciasNFCe(Emissor: Integer = 0): Integer; // Envio periodico de notas pendentes
    function ServiceLessEnviarContingenciasNFCe: Integer; //Somente o sem Servico

    function AbrirGaveta(params: string): Integer;

    function CriarAnexos(Acod_nfce: array of Integer; AComPDF: Boolean): string;


    procedure SetArrayNFCe(ArrayInt: array of Integer);

    property token          : string     read Ftoken           write Settoken;
    property CodNFCe        : Integer    read FCodNFCe         write SetCodNFCe;
    property AcoesAdicionais: string     read FAcoesAdicionais write SetAcoesAdicionais;
    property Task           : TTaskNFCes read FTask            write FTask;
  end;

  THwCentralAcoes = class(THwNFC)
  private
    Ftoken             : string;
    ServidorAutorizacao: Boolean;
    ServidorImpressao  : Boolean;
    ServidorEmail      : Boolean;
    procedure Settoken(const Value: string);
    procedure ValidarAcesso;
    procedure SalvarLog(Log: string);
    procedure VerificarThreadsInativas(NoThreads: Boolean; CurrentCAID: Integer);
    procedure FinalizarCentralDeAcoes(SeqId: Int64; MsgRetorno: string);
    procedure VerificarNFCeEmContigencia(var Msg: string);
  public
    destructor Destroy; override;
    constructor create;

    procedure SetTokenAndEmpresa;
    function VerificaCentralDeAcoesThreads: Integer;
    function VerificaCentralDeAcoesNoThreads: Integer;

    property token: string read Ftoken write Settoken;
  end;

  TThreadHwNFC = class(TThread)
  private
    FCodEmissor: Integer;
    FToken: string;
  protected
    FAcao            : string;
    FSeqIdCentraAcoes: Int64;
    FCodEmpresa      : Integer;
    FID              : string;
    FClientOrServer  : RParentMode;
    FCodNFC          : Integer;
    FAcoesAdicionais : string;
    FArrayNFCe       : Array of Integer;
    procedure SetAcoesAdicionais(const Value: string);
    procedure SetAcao(const Value: string);
    procedure SetClientOrServer(const Value: RParentMode);
    procedure SetCodEmpresa(const Value: Integer);
    procedure SetCodNFC(const Value: Integer);
    procedure SetID(const Value: string);
    procedure SetSeqIdCentraAcoes(const Value: Int64);
    procedure FinalizarCentralDeAcoes(Buscas: TIBQuery; MsgRetorno: string);
  public
    constructor Create(CreateSuspended: Boolean);
    procedure SetArrayNFCe(ArrayInt: array of Integer);

    property CodEmpresa      : Integer read FCodEmpresa       write SetCodEmpresa;
    property CodEmissor      : Integer read FCodEmissor       write FCodEmissor;
    property CodNFC          : Integer read FCodNFC           write SetCodNFC;
    property Acao            : string  read FAcao             write SetAcao;
    property ID              : string  read FID               write SetID;
    property SeqIdCentraAcoes: Int64   read FSeqIdCentraAcoes write SetSeqIdCentraAcoes;
    property ClientOrServer  : RParentMode read FClientOrServer write SetClientOrServer;
    property AcoesAdicionais : string  read FAcoesAdicionais  write SetAcoesAdicionais;
    property Token           : string  read FToken            write FToken;
  end;

  TImpressaoNFC = class(TThreadHwNFC) //pode ser NFCe ou SAT
  private
    FTipo: string;
    procedure SetTipo(const Value: string);
    procedure ImprimirNFCe;
    //procedure ImprimirSAT;
  protected
    procedure Execute; override;

    property Tipo: string read FTipo write SetTipo;
  end;

  TEnvioNFCe = class(TThreadHwNFC)
  private
    procedure EnviarNFCe;
    procedure CancelarNFCe;
    procedure InutilizarNFCe;
    procedure EnviarEmailNFCe;
    procedure EnviarContingenciasNFCe;
  protected
    procedure Execute; override;
  end;

  TTaskNFCe = class
  private
    FTask      : RTasks;
    FCodigoNFCe: Integer;
    FCodigoEmp : Integer;
  public
    property Task      : RTasks  read FTask       write FTask;
    property CodigoNFCe: Integer read FCodigoNFCe write FCodigoNFCe;
    property CodigoEmp : Integer read FCodigoEmp  write FCodigoEmp;
  end;

  TTaskNFCes = class
  private
    FOwner: THwNFCe;
    FTaks : TObjectList<TTaskNFCe>;
  public
    constructor Create(AOwner: THwNFCe);
    destructor Destroy; override;

    function New: TTaskNFCe;

    function Run: Integer;
  end;

var
  ConfNFCe: THwConfNFCe;
  ConfImp : THwConfImp;

implementation

uses
  Windows, SysUtils, DB, pcnConversaoNFe, pcnConversao, ACBrNFeNotasFiscais,
  ACBrNFeWebServices, ACBrDFeWebService, ACBrDFeConfiguracoes,
  ACBrNFeConfiguracoes, {pcnEnvEventoNFe, pcnProcNFe, pcnEventoNFe, }DateUtils,
  pcnAuxiliar, IniFiles, ACBrDFeSSL, {pcnRetEnvEventoNFe, pcnRetConsSitNFe, }Variants,
  ACBrDANFCeFortesFr, ACBrDANFCeFortesFrA4, System.StrUtils, ACBrDFeUtil,
  ACBrNFeDANFEClass, System.Math, ACBrDFeDANFeReport, config_sistema_class, hw_utils,
  hw_win_utils, System.Hash, synacode, RLPrinters, doc_eletronico_class,
  ACBrNFe.Classes, ACBrDFe.RTC.Classes, SetupDFeUnit, ContainerDFeUnit, TributosDFeFactoryUnit,
  ACBrNFe.EventoClass, RegistradorAlertasDFeUtils;

function CompactarVariosArquivos_dx(ListaArquivos, Destino: WideString): Boolean; stdcall; external 'Compacta.dll';

{ THwNFC }

function THwNFC.cpfCnpjValido(cpfCnpj: string): Boolean;
var
  I: Integer;
  invalido: Boolean;
begin
  try
    invalido := False;
    for I := 0 to 9 do
      if invalido then
        Exit
      else
        invalido := (PadL(I, 11, I.ToString()) = cpfCnpj) or
                    (PadL(I, 14, I.ToString()) = cpfCnpj);
  finally
    Result := not invalido;
  end;
end;

constructor THwNFC.create;
begin
  FCodEmpresa          := 0;
  FMensagemErro        := '';
  FClientOrServer      := pmUndefined;

  if ConfNFCe = nil then
    ConfNFCe := THwConfNFCe.Create;

  if ConfImp = nil then
    ConfImp := THwConfImp.Create;

  inherited;

  buscas             := TIBQuery.Create(nil);
  buscas.Database    := Banco;
  buscas.Transaction := Transacao;

  SetupDFeInitialize( Self.Banco );
end;

destructor THwNFC.Destroy;
begin
  if Assigned(StatusServ) then FreeAndNil(StatusServ);

  SetupDFeShutDown();

  inherited;
end;

function THwNFC.retornaSerialHd: string;
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
    GetSystemDirectory(PWideChar(sWinDir), nTam);
    GetVolumeInformation(PWideChar(copy(sWinDir, 1, 1) + ':\'), dLabel, 12, @Serial, DirLen, Flags, nil,
      0);
    Result := IntToHex(Serial, 8);
  except
    Result := '';
  end;
end;

procedure THwNFC.SetClientOrServer(const Value: RParentMode);
begin
  FClientOrServer := Value;
end;

procedure THwNFC.SetCodEmpresa(const Value: Integer);
begin
  FCodEmpresa := Value;
end;

procedure THwNFC.SetMensagemErro(const Value: string);
begin
  FMensagemErro := Value;
end;

{ THwNFCe }

function THwNFCe.CriarAnexos(Acod_nfce: array of Integer; AComPDF: Boolean): string;
var
  I: Integer;
  FilesList: TStringList;
  TempPath, XMLFilePath, PDFFIlePath, XMLStr, Situacao, ChaveNFCe: string;
  LocalACBr: TACBrNFe;
  ADANFe: TACBrNFeDANFCeFortes;
  CodNFCEAtual: Integer;
begin
  Result := '';
  FilesList := TStringList.Create;
  LocalACBr := TACBrNFe.Create(nil);
  try
    // Configura o componente ACBr com os dados da empresa/emissor
    if not ConfigurarACBr(LocalACBr) then
      Exit;

    // Obtém o diretório temporário (mesma função usada em EnviarEmailNFCe)
    TempPath := GetPathTemp('PDFTemp');
    if not DirectoryExists(TempPath) then
      ForceDirectories(TempPath);

    // Garante que as configurações de impressão estejam carregadas
    if ConfImp = nil then
      ConfImp := THwConfImp.Create;
    ConfImp.lerConfig;

    for I := Low(Acod_nfce) to High(Acod_nfce) do
    begin
      CodNFCEAtual := Acod_nfce[I];

      // Busca o XML e a situação no banco de dados
      Buscas.Close;
      Buscas.SQL.Text := 'select xml_nfce, situacao_nfce, chave_nfce from nfce' +
                         ' where cod_nfce = ' + IntToStr(CodNFCEAtual) +
                         ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      Buscas.Open;

      if not Buscas.IsEmpty then
      begin
        XMLStr := Buscas.FieldByName('xml_nfce').AsString;
        Situacao := Buscas.FieldByName('situacao_nfce').AsString;
        ChaveNFCe := Buscas.FieldByName('chave_nfce').AsString;

        if Trim(XMLStr) <> '' then
        begin
          // 1. Salvar o arquivo XML
          XMLFilePath := TempPath + ChaveNFCe + '-nfe.xml';
          with TStringList.Create do
          try
            Text := XMLStr;
            SaveToFile(XMLFilePath);
          finally
            Free;
          end;

          FilesList.Add(XMLFilePath);

          // 2. Gerar o PDF do DANFCe, se solicitado
          if AComPDF then
          begin
            LocalACBr.NotasFiscais.Clear;
            LocalACBr.NotasFiscais.LoadFromString(XMLStr);

            if LocalACBr.NotasFiscais.Count > 0 then
            begin
              ADANFe := TACBrNFeDANFCeFortes.Create(nil);
              try
                ADANFe.Sistema := 'Hw Sistemas';
                ADANFe.TipoDANFE := tiNFCe;
                ADANFe.PathPDF := TempPath;
                ADANFe.Cancelada := (Situacao = sitCancelada);

                // Aplica configurações de impressão definidas no sistema
                ADANFe.ImprimeNomeFantasia := ConfImp.Impressao.ImprimeNomeFantasia;
                ADANFe.ImprimeInfContr := ConfImp.Impressao.ImprimeInfContr;
                TACBrNFeDANFCEClass(ADANFe).ImprimeQRCodeLateral := ConfImp.Impressao.QRCodeLateral;
                TACBrNFeDANFCEClass(ADANFe).ViaConsumidor := True;
                TACBrNFeDANFCEClass(ADANFe).ImprimeEmUmaLinha := ConfImp.Impressao.ImprimeEmUmaLinha;
                TACBrNFeDANFCEClass(ADANFe).ImprimeDescAcrescItem := ConfImp.Impressao.ImprimeDescAcrescItem;
                TACBrNFeDANFCEClass(ADANFe).ImprimeTributos := TpcnTributos(
                  IfThen(ConfImp.Impressao.ImprimirTributos, 0,
                  IfThen(ConfImp.Impressao.TributosSeparadamente, 1, 2))
                );

                LocalACBr.DANFE := ADANFe;

                // Gera o PDF
                LocalACBr.NotasFiscais.ImprimirPDF;

                PDFFIlePath := LocalACBr.DANFE.ArquivoPDF;
                if FileExists(PDFFIlePath) then
                  FilesList.Add(PDFFIlePath);
              finally
                FreeAndNil(ADANFe);
              end;
            end;
          end;
        end;
      end;
    end;

    Result := string.Join(';', FilesList.ToStringArray);// .ToStringArray StringReplace(FilesList.CommaText, ',', ';', [rfReplaceAll]);

  finally
    FreeAndNil(LocalACBr);
    FreeAndNil(FilesList);
  end;
end;

function THwNFCe.AbrirGaveta(params: string): Integer;
var
  APosPrinter : TACBrPosPrinter;


  procedure desativarPosPrinter;
  begin
    if Assigned(APosPrinter) then
      while APosPrinter.Ativo do
      begin
        APosPrinter.Desativar;
        if APosPrinter.Ativo then
          Sleep(100);
      end;
  end;
begin
  var helperNaoFiscal := THelperPosPrinter.Create;
  try
    Result := helperNaoFiscal.OpenDrawer(params);
  finally
    FMensagemErro := helperNaoFiscal.LastError;
    helperNaoFiscal.Free();
  end;
  {
  Result := 0;
  try

    if ConfImp = nil then
      ConfImp := THwConfImp.create;
    ConfImp.lerConfig;

    if not ConfImp.Impressao.AbrirGaveta then
      Exit;

    APosPrinter        := TACBrPosPrinter.Create(nil);
    APosPrinter.Modelo := TACBrPosPrinterModelo(ConfImp.PosPrinter.Modelo);
    APosPrinter.Porta  := ConfImp.PosPrinter.Porta;

    desativarPosPrinter;

    APosPrinter.Porta  := ConfImp.PosPrinter.Porta;

    if not APosPrinter.Ativo then
      APosPrinter.Ativar;

    if ConfImp.Impressao.AbrirGaveta then
      if ConfImp.Impressao.AbrirGavetaEspecifica > 0 then
        APosPrinter.AbrirGaveta(ConfImp.Impressao.AbrirGavetaEspecifica)
      else
        APosPrinter.AbrirGaveta();

    desativarPosPrinter;

    Result := 1;

  except on E: Exception do
    begin
      FMensagemErro := e.Message;
    end;
  end;
  }
end;

function THwNFCe.AcessoValido: Boolean;
begin
  Result := False;
  try
    if Trim(Ftoken) = '' then
    begin
      FMensagemErro := 'Token não informado';
      Exit;
    end;

    if not conectar(False) then
    begin
      FMensagemErro := 'Erro de conexão ao banco de dados';
      Exit;
    end;

    SqlOpen('select cod_emissor, server_autorizacao, server_impressao, server_email' +
            ' from NFC_EMISSOR' +
            ' where cod_empresa = ' + IntToStr(CodEmpresa) +
            ' and token = ' + QuotedStr(Ftoken), Buscas);

    if Buscas.IsEmpty then
    begin
      FMensagemErro := 'Pedido de emissão não permitido. Token não encontrado';
      Exit;
    end
    else
    begin
      FCodEmissor            := Buscas.FieldByName('cod_emissor').AsInteger;
      UsaServidorAutorizacao := Buscas.FieldByName('server_autorizacao').AsString = 'S';
      UsaServidorImpressao   := Buscas.FieldByName('server_impressao').AsString = 'S';
      UsaServidorEmail       := Buscas.FieldByName('server_email').AsString = 'S';
//      FStandAlone := (Pos('|5|', Buscas.FieldByName('tipo').AsString) > 0) or
//                     (Pos('|6|', Buscas.FieldByName('tipo').AsString) > 0);
      //FUseThread  := (Pos('|5|', Buscas.FieldByName('tipo').AsString) > 0);
    end;
    Result := True;

  finally
    Buscas.Close;
    if not Result then
      desconectar;
  end;
end;

function THwNFCe.AddNFCeToACBr(CodigNFCe: Integer): Boolean;
var
  vOK: Boolean;
begin
  try
    Buscas.Close;
    Buscas.SQL.Text := 'select * from nfce' +
      ' where cod_nfce = ' + IntToStr(CodigNFCe) +
      ' and cod_empresa = ' + IntToStr(FCodEmpresa);
    Buscas.Open;

    if Buscas.IsEmpty then
      raise Exception.Create('NFCe codigo ' + IntToStr(CodigNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' nao localizada');

    ANFCe.Configuracoes.Geral.VersaoDF := ve310;
    with ANFCe.NotasFiscais.Add.NFe do
    begin
      Ide.cNF       := Buscas.FieldByName('cnf').AsInteger;
      Ide.natOp     := Trim(Buscas.FieldByName('natop').AsString);
      Ide.indPag    := ipVista; //ao ler o tpag mudar se necessário, ou colocar aqui na tela para o sismtema montar e o usuario alterar
      Ide.modelo    := StrToIntDef(Trim(Buscas.FieldByName('modelo').AsString), 65);
      Ide.serie     := Buscas.FieldByName('serie').AsInteger;
      Ide.nNF       := Buscas.FieldByName('num_nf').AsInteger;
      Ide.dEmi      := Now;
      //Ide.dSaiEnt   := ; // caso necessari oadcionar na tela
      //Ide.hSaiEnt   := now;
      Ide.tpNF      := tnSaida;
      Ide.tpEmis    := StrToTpEmis(vOK, Buscas.FieldByName('tpemis').AsString);
      Ide.tpAmb     := StrToTpAmb(vOK, Buscas.FieldByName('tpamb').AsString);
      Ide.cUF       := UFtoCUF(ConfNFCe.WebServices.UF);
      Ide.cMunFG    := ConfNFCe.Emitente.cMun_IBGE;
      Ide.finNFe    := fnNormal;
      Ide.tpImp     := StrToTpImp(vOK, Buscas.FieldByName('tpimp').AsString);
      Ide.indFinal  := cfConsumidorFinal;
      Ide.indPres   := StrToPresencaComprador(vOK, Buscas.FieldByName('indpres').AsString);

      if Ide.tpEmis = teOffLine then
      begin
        Ide.dhCont := Buscas.FieldByName('cont_dhcont').AsDateTime;
        Ide.xJust  := Buscas.FieldByName('cont_xjust').AsString;
      end;

      Emit.CNPJCPF           := ConfNFCe.Emitente.CNPJCPF;
      Emit.xNome             := ConfNFCe.Emitente.Nome;
      Emit.xFant             := ConfNFCe.Emitente.Fant;
      Emit.IE                := ConfNFCe.Emitente.IE;
      //Emit.IEST              := '';
      //Emit.IM                := ConfNFCe.Emitente.IM; // Preencher no caso de existir serviços na nota
      //Emit.CNAE              := ConfNFCe.Emitente.CNAE; // Preencher no caso de existir serviços na nota
      Emit.CRT               := StrToCRT(vOK, ConfNFCe.Emitente.CRT);

      Emit.EnderEmit.fone    := ConfNFCe.Emitente.Fone;
      Emit.EnderEmit.CEP     := StrToInt(ConfNFCe.Emitente.CEP);
      Emit.EnderEmit.xLgr    := ConfNFCe.Emitente.Lgr;
      Emit.EnderEmit.nro     := ConfNFCe.Emitente.Nro;
      Emit.EnderEmit.xCpl    := ConfNFCe.Emitente.Cpl;
      Emit.EnderEmit.xBairro := ConfNFCe.Emitente.Bairro;
      Emit.EnderEmit.cMun    := ConfNFCe.Emitente.cMun_IBGE;
      Emit.EnderEmit.xMun    := ConfNFCe.Emitente.xMun;
      Emit.EnderEmit.UF      := ConfNFCe.Emitente.UF;
      Emit.enderEmit.cPais   := ConfNFCe.Emitente.cPais;
      Emit.enderEmit.xPais   := ConfNFCe.Emitente.xPais;

//      if Buscas.FieldByName('cod_cliente').AsInteger > 0 then
//      begin
        QrAux.Close;
        QrAux.SQL.Text := 'select * from nfce_dest' +
                          ' where cod_nfce = ' + IntToStr(CodigNFCe) +
                          ' and cod_empresa = ' + IntToStr(FCodEmpresa);
        {QrAux.SQL.Text :=
          'select clientes.cpfcgc, clientes.razao, clientes.endereco, clientes.num_end_cliente,' +
          ' clientes.complemento, clientes.bairro, cidades.ibge_cod_cidade, cidades.nome_cidade,' +
          ' estados.sigla_uf, clientes.cep, clientes.cod_pais, paises.nome_pais, clientes.fone_cliente,' +
          ' clientes.insc_est' +
          ' from clientes' +
          ' left join cidades on cidades.cod_cidade = clientes.cod_cidade' +
          ' left join estados on estados.codigo_uf = clientes.codigo_uf' +
          ' left join paises on paises.cod_pais = clientes.cod_pais' +
          ' where clientes.cod_cliente = ' + IntToStr(Buscas.FieldByName('cod_cliente').AsInteger) +
          ' and clientes.cod_empresa = ' + IntToStr(Buscas.FieldByName('cod_empresa').AsInteger);}
        QrAux.Open;
        if not QrAux.IsEmpty then
        begin
          Dest.CNPJCPF           := Trim(QrAux.FieldByName('CNPJCPF').AsString);
          //Dest.idEstrangeiro     := '';
          //Dest.ISUF              := '';
          Dest.xNome             := Trim(QrAux.FieldByName('xNome').AsString);
          Dest.EnderDest.xLgr    := Trim(QrAux.FieldByName('xLgr').AsString);
          Dest.EnderDest.nro     := Trim(QrAux.FieldByName('nro').AsString);
          Dest.EnderDest.xCpl    := Trim(QrAux.FieldByName('xCpl').AsString);
          Dest.EnderDest.xBairro := Trim(QrAux.FieldByName('xBairro').AsString);
          Dest.EnderDest.cMun    := QrAux.FieldByName('cMun').AsInteger;
          Dest.EnderDest.xMun    := Trim(QrAux.FieldByName('xMun').AsString);
          Dest.EnderDest.UF      := Trim(QrAux.FieldByName('UF').AsString);
          Dest.EnderDest.CEP     := StrToIntDef(Trim(QrAux.FieldByName('CEP').AsString), 0);
          //Dest.EnderDest.cPais   := '';
          //Dest.EnderDest.xPais   := '';
          Dest.EnderDest.fone    := Trim(QrAux.FieldByName('fone').AsString);
        end;

        {if (Trim(QrAux.FieldByName('CPFCGC').AsString) <> '') and
          (Trim(QrAux.FieldByName('SIGLA_UF').AsString) = ConfNFCe.Emitente.UF) and
          ((Trim(QrAux.FieldByName('COD_PAIS').AsString) = '') or
          (Trim(QrAux.FieldByName('COD_PAIS').AsString) = '1058')) then
        begin
          Dest.CNPJCPF           := Trim(QrAux.FieldByName('CPFCGC').AsString);
          //Dest.idEstrangeiro     := '';
          //Dest.ISUF              := '';
          Dest.xNome             := Trim(QrAux.FieldByName('RAZAO').AsString);
          Dest.EnderDest.xLgr    := Trim(QrAux.FieldByName('ENDERECO').AsString);
          Dest.EnderDest.nro     := Trim(QrAux.FieldByName('NUM_END_CLIENTE').AsString);
          Dest.EnderDest.xCpl    := Trim(QrAux.FieldByName('COMPLEMENTO').AsString);
          Dest.EnderDest.xBairro := Trim(QrAux.FieldByName('BAIRRO').AsString);
          Dest.EnderDest.cMun    := QrAux.FieldByName('IBGE_COD_CIDADE').AsInteger;
          Dest.EnderDest.xMun    := Trim(QrAux.FieldByName('NOME_CIDADE').AsString);
          Dest.EnderDest.UF      := Trim(QrAux.FieldByName('SIGLA_UF').AsString);
          Dest.EnderDest.CEP     := StrToIntDef(Trim(QrAux.FieldByName('CEP').AsString), 0);
          Dest.EnderDest.cPais   := QrAux.FieldByName('COD_PAIS').AsInteger;
          Dest.EnderDest.xPais   := Trim(QrAux.FieldByName('NOME_PAIS').AsString);
          Dest.EnderDest.fone    := Trim(QrAux.FieldByName('FONE_CLIENTE').AsString);
        end;
      end
      else
      begin
//        Dest.CNPJCPF := Trim(Buscas.FieldByName('CPFCNPJ').AsString);
//        Dest.xNome   := Trim(Buscas.FieldByName('XNOME').AsString);
//        Dest.Email   := Trim(Buscas.FieldByName('EMAIL').AsString);
      end;
      }
      Dest.indIEDest := inNaoContribuinte;
      Dest.IE        := '';

      QrAux.Close;
      QrAux.SQL.Text := 'select * from nfce_item' +
        ' where cod_nfce = ' + IntToStr(CodigNFCe) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
        ' order by nitem';
      QrAux.Open;

      QrAux.First;
      while not QrAux.Eof do
      begin
        with Det.New do
        begin
          Prod.cProd    := Trim(QrAux.FieldByName('NUM_FAB_PROD').AsString);
          Prod.nItem    := QrAux.FieldByName('NITEM').AsInteger;
          Prod.cEAN     := Trim(QrAux.FieldByName('CEAN').AsString);
          Prod.xProd    := Trim(QrAux.FieldByName('XPROD').AsString);
          Prod.NCM      := Trim(QrAux.FieldByName('NCM').AsString);
          Prod.CEST     := Trim(QrAux.FieldByName('CEST').AsString);
          Prod.nFCI     := Trim(QrAux.FieldByName('NFCI').AsString);
          //Prod.NVE    := '';
          //Prod.EXTIPI := '';
          Prod.CFOP     := Trim(QrAux.FieldByName('CFOP').AsString);
          Prod.uCom     := Trim(QrAux.FieldByName('UCOM').AsString);
          Prod.qCom     := QrAux.FieldByName('QCOM').AsFloat;
          Prod.vUnCom   := QrAux.FieldByName('VUNCOM').AsFloat;
          Prod.vProd    := QrAux.FieldByName('VPROD').AsFloat;
          Prod.cEANTrib := Prod.cEAN;
          Prod.uTrib    := Prod.uCom;
          Prod.qTrib    := Prod.qCom;
          Prod.vUnTrib  := Prod.vUnCom;
          Prod.vFrete   := QrAux.FieldByName('VFRETE').AsFloat;
          Prod.vSeg     := QrAux.FieldByName('VSEG').AsFloat;
          Prod.vDesc    := QrAux.FieldByName('VDESC').AsFloat;
          Prod.vOutro   := QrAux.FieldByName('VOUTRO').AsFloat;
          Prod.IndTot   := itSomaTotalNFe;


          with Imposto do
          begin
            vTotTrib := QrAux.FieldByName('VTOTTRIB').AsFloat;

            if Emit.CRT <> crtSimplesNacional then
            begin
              with PIS do
              begin
                CST       := StrToCSTPIS(vOK, QrAux.FieldByName('PIS_CST').AsString);
                vBC       := QrAux.FieldByName('PIS_VBC').AsFloat;
                pPIS      := QrAux.FieldByName('PIS_PPIS').AsFloat;
                vPIS      := QrAux.FieldByName('PIS_VPIS').AsFloat;
                qBCProd   := QrAux.FieldByName('PIS_QBCPROD').AsFloat;
                vAliqProd := QrAux.FieldByName('PIS_VALIQPROD').AsFloat;
              end;//with PIS do

              with COFINS do
              begin
                CST       := StrToCSTCOFINS(vOK, QrAux.FieldByName('COFINS_CST').AsString);
                vBC       := QrAux.FieldByName('COFINS_VBC').AsFloat;
                pCOFINS   := QrAux.FieldByName('COFINS_PCOFINS').AsFloat;
                vCOFINS   := QrAux.FieldByName('COFINS_VCOFINS').AsFloat;
                qBCProd   := QrAux.FieldByName('COFINS_QBCPROD').AsFloat;
                vAliqProd := QrAux.FieldByName('COFINS_VALIQPROD').AsFloat;
              end;//with COFINS do

            end;//if Emit.CRT <> crtSimplesNacional then

            if (QrAux.FieldByName('tipo_item').AsString) = 'P' then
            begin
              with ICMS do
              begin
                orig := StrToOrig(vOK, QrAux.FieldByName('ICM_ORIG').AsString);
                if Trim(QrAux.FieldByName('ICM_CSOSN').AsString) <> '' then
                begin
                  CSOSN       := StrToCSOSNIcms(vOK, Trim(QrAux.FieldByName('ICM_CSOSN').AsString));
                  pCredSN     := QrAux.FieldByName('ICM_PCREDSN').AsFloat;
                  vCredICMSSN := QrAux.FieldByName('ICM_VCREDICMSSN').AsFloat;
                end
                else
                begin
                  CST        := StrToCSTICMS(vOK, QrAux.FieldByName('ICM_CST').AsString);
                  modBC      := StrTomodBC(vOK,   QrAux.FieldByName('ICM_MODBC').AsString);
                  pRedBC     := QrAux.FieldByName('ICM_PREDBC').AsFloat;
                  vBC        := QrAux.FieldByName('ICM_VBC').AsFloat;
                  pICMS      := QrAux.FieldByName('ICM_PICMS').AsFloat;
                  vICMS      := QrAux.FieldByName('ICM_VICMS').AsFloat;
                  vBCSTRet   := QrAux.FieldByName('ICM_VBCSTRET').AsFloat;
                  vICMSSTRet := QrAux.FieldByName('ICM_VICMSSTRET').AsFloat;
                end;
              end;//with ICMS do
              Total.ICMSTot.vBC      := Total.ICMSTot.vBC      + ICMS.vBC;
              Total.ICMSTot.vICMS    := Total.ICMSTot.vICMS    + ICMS.vICMS;
              Total.ICMSTot.vProd    := Total.ICMSTot.vProd    + Prod.vProd;
              Total.ICMSTot.vFrete   := Total.ICMSTot.vFrete   + Prod.vFrete;
              Total.ICMSTot.vSeg     := Total.ICMSTot.vSeg     + Prod.vSeg;
              Total.ICMSTot.vDesc    := Total.ICMSTot.vDesc    + Prod.vDesc;
              Total.ICMSTot.vPIS     := Total.ICMSTot.vPIS     + PIS.vPIS;
              Total.ICMSTot.vCOFINS  := Total.ICMSTot.vCOFINS  + COFINS.vCOFINS;
              Total.ICMSTot.vOutro   := Total.ICMSTot.vOutro   + Prod.vOutro;
              Total.ICMSTot.vTotTrib := Total.ICMSTot.vTotTrib + vTotTrib;
            end
            else if (QrAux.FieldByName('tipo_item').AsString) = 'S' then
            begin
              with ISSQN do
              begin
                vBC          := QrAux.FieldByName('ISS_VBC').AsFloat;
                vAliq        := QrAux.FieldByName('ISS_VALIQ').AsFloat;
                vISSQN       := QrAux.FieldByName('ISS_VISSQN').AsFloat;
                cMunFG       := ConfNFCe.Emitente.cMun_IBGE;
                cListServ    := Trim(QrAux.FieldByName('ISS_CLISTSERV').AsString);
                vDeducao     := QrAux.FieldByName('ISS_VDEDUCAO').AsFloat;
                vOutro       := QrAux.FieldByName('ISS_VOUTRO').AsFloat;
                vDescIncond  := QrAux.FieldByName('ISS_VDESCINCOND').AsFloat;
                vDescCond    := QrAux.FieldByName('ISS_VDESCCOND').AsFloat;
                vISSRet      := QrAux.FieldByName('ISS_VISSRET').AsFloat;
                indISS       := StrToindISS(vok, Trim(QrAux.FieldByName('ISS_INDISS').AsString));
                cServico     := Trim(QrAux.FieldByName('NUM_FAB_PROD').AsString);
                cMun         := ConfNFCe.Emitente.cMun_IBGE;
                cPais        := ConfNFCe.Emitente.cPais;
                indIncentivo := StrToindIncentivo(vOK, Trim(QrAux.FieldByName('ISS_INDINCENTIVO').AsString));
                if (Trim(QrAux.FieldByName('ISS_RETIDO').AsString) = 'C') or
                  (Trim(QrAux.FieldByName('ISS_RETIDO').AsString) = 'S') then
                  indISSRet  := iirSim
                else
                  indISSRet  := iirNao;
              end;//with ISSQN do
              Total.ISSQNtot.vBC         := Total.ISSQNtot.vBC         + ISSQN.vBC;
              Total.ISSQNtot.vServ       := Total.ISSQNtot.vServ       + Prod.vProd;
              Total.ISSQNtot.vISS        := Total.ISSQNtot.vISS        + ISSQN.vISSQN;
              Total.ISSQNtot.vPIS        := Total.ISSQNtot.vPIS        + PIS.vPIS;
              Total.ISSQNtot.vCOFINS     := Total.ISSQNtot.vCOFINS     + COFINS.vCOFINS;
              //Total.ISSQNtot.dCompet   := ;
              Total.ISSQNtot.vDeducao    := Total.ISSQNtot.vDeducao    + ISSQN.vDeducao;
              Total.ISSQNtot.vOutro      := Total.ISSQNtot.vOutro      + ISSQN.vOutro;
              Total.ISSQNtot.vDescIncond := Total.ISSQNtot.vDescIncond + ISSQN.vDescIncond;
              Total.ISSQNtot.vDescCond   := Total.ISSQNtot.vDescCond   + ISSQN.vDescCond;
              Total.ISSQNtot.vISSRet     := Total.ISSQNtot.vISSRet     + ISSQN.vISSRet;
              //Total.ISSQNtot.cRegTrib  := ;
            end;
          end;//with Imposto do

        end;//with Det.Add do

        QrAux.Next;
      end;//while not QrAux.Eof do//itens da nfce

      Total.ICMSTot.vNF := Buscas.FieldByName('vnf').AsFloat;
      
      QrAux.Close;
      QrAux.SQL.Text := 'select * from nfce_pagamento' +
        ' where cod_nfce = ' + IntToStr(CodigNFCe) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
        ' order by seqid';
      QrAux.Open;

      QrAux.First;
      while not QrAux.Eof do
      begin
        with pag.New do
        begin
          tPag      := StrToFormaPagamento(vOK, QrAux.FieldByName('TPAG').AsInteger.ToString.PadLeft(2, '0'));
          tpIntegra := StrTotpIntegra(     vOK, QrAux.FieldByName('TPINTEGRA').AsString);
          tBand     := StrToBandeiraCartao(vOK, QrAux.FieldByName('TBAND').AsString);
          vPag      := QrAux.FieldByName('VPAG').AsFloat;
          CNPJ      := Trim(QrAux.FieldByName('CNPJ').AsString);
          cAut      := Trim(QrAux.FieldByName('CAUT').AsString);
        end;
        QrAux.Next;
      end;

      Transp.modFrete := StrTomodFrete(vOK, Trim(Buscas.FieldByName('MODFRETE').AsString));
      if (Transp.modFrete <> mfSemFrete) and (Buscas.FieldByName('tr_codigo').AsInteger > 0) then
      begin
        QrAux.Close;
        QrAux.SQL.Text :=
          'select clientes.cpfcgc, clientes.razao, clientes.endereco, clientes.num_end_cliente,' +
          ' clientes.complemento, clientes.bairro, cidades.ibge_cod_cidade, cidades.nome_cidade,' +
          ' estados.sigla_uf, clientes.cep, clientes.cod_pais, paises.nome_pais, clientes.fone_cliente,' +
          ' clientes.insc_est' +
          ' from clientes' +
          ' left join cidades on cidades.cod_cidade = clientes.cod_cidade' +
          ' left join estados on estados.codigo_uf = clientes.codigo_uf' +
          ' left join paises on paises.cod_pais = clientes.cod_pais' +
          ' where clientes.cod_cliente = ' + IntToStr(Buscas.FieldByName('tr_codigo').AsInteger) +
          ' and clientes.cod_empresa = ' + IntToStr(Buscas.FieldByName('cod_empresa').AsInteger);
        QrAux.Open;

        if (Trim(QrAux.FieldByName('CPFCGC').AsString) <> '') and
          (Trim(QrAux.FieldByName('SIGLA_UF').AsString) = ConfNFCe.Emitente.UF) and
          ((Trim(QrAux.FieldByName('COD_PAIS').AsString) = '') or
          (Trim(QrAux.FieldByName('COD_PAIS').AsString) = '1058')) then
        begin
          with Transp.Transporta do
          begin
            CNPJCPF := Trim(QrAux.FieldByName('CPFCGC').AsString);
            xNome := Trim(QrAux.FieldByName('RAZAO').AsString);
            if Trim(QrAux.FieldByName('INSC_EST').AsString) <> 'ISENTO' then
              IE := Trim(QrAux.FieldByName('INSC_EST').AsString);
            xEnder := Trim(QrAux.FieldByName('ENDERECO').AsString) + ',' +
              Trim(QrAux.FieldByName('NUM_END_CLIENTE').AsString);
              if Trim(QrAux.FieldByName('COMPLEMENTO').AsString) <> '' then
                xEnder := xEnder + ',' + Trim(QrAux.FieldByName('COMPLEMENTO').AsString);
            xMun := Trim(QrAux.FieldByName('NOME_CIDADE').AsString);
            UF := Trim(QrAux.FieldByName('SIGLA_UF').AsString);
          end;
        end;
      end;

      if Trim(Buscas.FieldByName('INFADFISCO').AsString) <> '' then
        InfAdic.infAdFisco := Trim(Buscas.FieldByName('INFADFISCO').AsString);
      if Trim(Buscas.FieldByName('INFCPL').AsString) <> '' then
        InfAdic.infCpl := Trim(Buscas.FieldByName('INFCPL').AsString);

    end;//with ANFCe.NotasFiscais.Add.NFe do

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      FMensagemErro := 'AddNFCe -> ' + e.Message;
    end;
  end;
end;

function THwNFCe.AddNFCeToACBr_v400(CodigNFCe: Integer; var HashNFCe: string): Boolean;
var
  nfc       : TNfceModel;
  Aitens    : TObjectList<TNfceItemModel>;
  Aitem     : TNfceItemModel;
  Apags     : TNfce_pagamentos_class;
  Apag      : TNfce_pagamento_class;
  Adest     : TNfce_dest_class;
  Atr       : Ttransp_nfce_class;
  vOK       : Boolean;
  I         : Integer;
  SitOld    : string;
  RescDhEmi : TDateTime;
  RescDhCont: TDateTime;
  SameHash  : Boolean;
  ATributos : TributoDFeContextEtdList;
  tmpIbsCbs : TIBSCBS;
begin
  try

    try
//      if SqlOpen('select ' + nfc.GetFieldsSql() + ' from nfce' +
      if SqlOpen('select * from nfce' +
                 ' where cod_nfce = ' + IntToStr(CodigNFCe) +
                 ' and cod_empresa = ' + IntToStr(FCodEmpresa),
                 [TNfce_class.GetFieldsSql()], QrAux).IsEmpty then
        raise Exception.Create('NFCe codigo ' + IntToStr(CodigNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' nao localizada');

      {$REGION 'obtendo do banco e salvando nos objetos'}
      ATributos := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateListarTributosNFCePorIdUseCase()
        .Executar( CodigNFCe, FCodEmpresa );
      try
        nfc := TNfceModel.Create(ATributos);
      finally
        ATributos.Free();
      end;

      nfc.SetValuesFrom(QrAux);
//      nfc.CopyFrom(QrAux);

      if not SqlOpen('select ' + Adest.GetFieldsSql() +  ' from nfce_dest' +
                     ' where cod_nfce = ' + IntToStr(CodigNFCe) +
                     ' and cod_empresa = ' + IntToStr(FCodEmpresa), QrAux).IsEmpty then
      begin
        Adest := TNfce_dest_class.Create;
        Adest.SetValuesFrom(QrAux);
      end;

      if nfc.tr_codigo > 0 then
        if not SqlOpen('select clientes.cpfcgc, clientes.razao, clientes.endereco, clientes.num_end_cliente,' +
              ' clientes.complemento, clientes.bairro, cidades.ibge_cod_cidade, cidades.nome_cidade,' +
              ' estados.sigla_uf, clientes.cep, clientes.cod_pais, paises.nome_pais, clientes.fone_cliente,' +
              ' clientes.insc_est' +
              ' from clientes' +
              ' left join cidades on cidades.cod_cidade = clientes.cod_cidade' +
              ' left join estados on estados.codigo_uf = clientes.codigo_uf' +
              ' left join paises on paises.cod_pais = clientes.cod_pais' +
              ' where clientes.cod_cliente = ' + nfc.tr_codigo.ToString +
              ' and clientes.cod_empresa = ' + FCodEmpresa.ToString, QrAux).IsEmpty then
        begin
          Atr := Ttransp_nfce_class.Create;
          Atr.SetValuesFrom(QrAux);
        end;

      if not SqlOpen('select ' + TNfceItemModel.GetFieldsSql() +  ' from nfce_item' +
                     ' where cod_nfce = ' + IntToStr(CodigNFCe) +
                     ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
                     ' order by nitem', QrAux).IsEmpty then
      begin
        Aitens := TObjectList<TNfceItemModel>.Create();
        QrAux.First;
        while not QrAux.Eof do
        begin
          Aitem := TNfceItemModel.Create;
          Aitens.Add( Aitem );
          Aitem.SetValuesFrom(QrAux);
          Aitem.uvnd := IfThen(Aitem.uvnd.Trim.IsEmpty, Aitem.ucom, Aitem.uvnd).Trim;
          Aitem.uvnd_fator := IfThen(Aitem.uvnd_fator = 0, 1, Aitem.uvnd_fator);

          if not Aitem.dfe_trib_id.Trim().IsEmpty() then
            if nfc.Tributos.ContainsKey(Aitem.dfe_trib_id) then
            begin
              Aitem.TributoRtc := nfc.Tributos[Aitem.dfe_trib_id];
              nfc.Tributos.Remove(Aitem.dfe_trib_id);
            end;

          QrAux.Next;
        end;
      end;

      if not SqlOpen('select np.*, c.nome_ctrl from nfce_pagamento np' +
                     ' left join controles c on c.codigo_ctrl = np.cod_controle and c.codigo_emp = np.cod_empresa' +
                     ' where np.cod_nfce = ' + IntToStr(CodigNFCe) +
                     ' and np.cod_empresa = ' + IntToStr(FCodEmpresa) +
                     ' order by np.seqid', QrAux).IsEmpty then
      begin
        Apags := TNfce_pagamentos_class.Create;
        QrAux.First;
        while not QrAux.Eof do
        begin
          with Apags.New do
          begin
            CopyFrom(QrAux);
            if xpag.Trim.IsEmpty  then
              xPag := QrAux.FieldByName('nome_ctrl').AsString;
          end;

          QrAux.Next;
        end;
      end;
      {$ENDREGION}

      var eQrCode := StrToVersaoQrCode(vOK, ConfNFCe.VersaoQrCode.ToString());
      if not vOK or not (eQrCode in [ TpcnVersaoQrCode.veqr200, TpcnVersaoQrCode.veqr300]) then
        eQrCode := TpcnVersaoQrCode.veqr200;

      ANFCe.Configuracoes.Geral.VersaoDF     := ve400;
      ANFCe.Configuracoes.Geral.VersaoQRCode := eQrCode;

      {$REGION 'atribuindo ao acbr'}
      with ANFCe.NotasFiscais.Add.NFe do
      begin
        Ide.cNF       := nfc.cnf;
        Ide.natOp     := nfc.natop.Trim;
        Ide.indPag    := ipVista; //ao ler o tpag mudar se necessário, ou colocar aqui na tela para o sismtema montar e o usuario alterar
        Ide.modelo    := StrToIntDef(nfc.modelo.Trim, 65);
        Ide.serie     := nfc.serie;
        Ide.nNF       := nfc.num_nf;
        Ide.dEmi      := nfc.dhemi;
        if not nfc.status.Equals(stsACancelar) then// "A Cancelar" quer dizer que foi gerada uma contigencia e essa é a orignal e precisa ser cancelada ou inutilizada
          if not nfc.tpemis.Equals('9') then
            Ide.dEmi   := Now
          else if (ConfNFCe.Validacoes.LimDiasDEmiAtrasoCont > 0) and
                  ((Now - Ide.dEmi) > ConfNFCe.Validacoes.LimDiasDEmiAtrasoCont) then
            Ide.dEmi   := Now;

        Ide.tpNF      := tnSaida;
        Ide.tpEmis    := StrToTpEmis(vOK, nfc.tpemis);
        Ide.tpAmb     := StrToTpAmb(vOK, nfc.tpamb);
        Ide.cUF       := UFtoCUF(ConfNFCe.WebServices.UF);
        Ide.cMunFG    := ConfNFCe.Emitente.cMun_IBGE;
        Ide.finNFe    := fnNormal;
        Ide.tpImp     := StrToTpImp(vOK, nfc.tpimp);
        Ide.indFinal  := cfConsumidorFinal;
        Ide.indPres   := StrToPresencaComprador(vOK, nfc.indpres);
        if Ide.dEmi >= ConfNFCe.nfc_nt_2020_006_data then
          Ide.indIntermed := TindIntermed(StrToIntDef(nfc.indintermed.Trim, -1) + 1);

        Ide.cMunFGIBS := nfc.cmunfgibs;

        if Ide.tpEmis = teOffLine then
        begin
          if nfc.cont_dhcont > 0 then
            Ide.dhCont := nfc.cont_dhcont
          else
            Ide.dhCont := Ide.dEmi;
          if Abs(Ide.dEmi - Ide.dhCont) > ConfNFCe.Validacoes.LimDiasEntradaCont then
            Ide.dhCont := Ide.dEmi;
          Ide.xJust  := IfThen(not nfc.cont_xjust.Trim.IsEmpty, nfc.cont_xjust, msgJustContingencia);
        end;

        Emit.CNPJCPF           := ConfNFCe.Emitente.CNPJCPF;
        Emit.xNome             := ConfNFCe.Emitente.Nome;
        Emit.xFant             := ConfNFCe.Emitente.Fant;
        Emit.IE                := ConfNFCe.Emitente.IE;
        //Emit.IEST              := '';
        //Emit.IM                := ConfNFCe.Emitente.IM; // Preencher no caso de existir serviços na nota
        //Emit.CNAE              := ConfNFCe.Emitente.CNAE; // Preencher no caso de existir serviços na nota
        Emit.CRT               := StrToCRT(vOK, ConfNFCe.Emitente.CRT);

        Emit.EnderEmit.fone    := ConfNFCe.Emitente.Fone;
        Emit.EnderEmit.CEP     := StrToInt(ConfNFCe.Emitente.CEP);
        Emit.EnderEmit.xLgr    := ConfNFCe.Emitente.Lgr;
        Emit.EnderEmit.nro     := ConfNFCe.Emitente.Nro;
        Emit.EnderEmit.xCpl    := ConfNFCe.Emitente.Cpl;
        Emit.EnderEmit.xBairro := ConfNFCe.Emitente.Bairro;
        Emit.EnderEmit.cMun    := ConfNFCe.Emitente.cMun_IBGE;
        Emit.EnderEmit.xMun    := ConfNFCe.Emitente.xMun;
        Emit.EnderEmit.UF      := ConfNFCe.Emitente.UF;
        Emit.enderEmit.cPais   := ConfNFCe.Emitente.cPais;
        Emit.enderEmit.xPais   := ConfNFCe.Emitente.xPais;

        if Assigned(Adest) then
        begin
          Dest.CNPJCPF           := Adest.CNPJCPF.Trim;
          if not cpfCnpjValido(Dest.CNPJCPF) then
            Dest.CNPJCPF := '';
          //Dest.idEstrangeiro     := '';
          //Dest.ISUF              := '';
          Dest.xNome             := Adest.xNome.Trim;
          Dest.EnderDest.xLgr    := Adest.xLgr.Trim;
          Dest.EnderDest.nro     := Adest.nro.Trim;
          Dest.EnderDest.xCpl    := Adest.xCpl.Trim;
          Dest.EnderDest.xBairro := Adest.xBairro.Trim;
          Dest.EnderDest.cMun    := Adest.cmun;
          Dest.EnderDest.xMun    := Adest.xMun.Trim;
          Dest.EnderDest.UF      := Adest.UF.Trim;
          Dest.EnderDest.CEP     := StrToIntDef(Adest.CEP.Trim, 0);
          //Dest.EnderDest.cPais   := '';
          //Dest.EnderDest.xPais   := '';
          Dest.EnderDest.fone    := Adest.fone.Trim;
        end;

        Dest.indIEDest := inNaoContribuinte;
        Dest.IE        := '';

        if Dest.EnderDest.xLgr <> '' then
          Ide.cMunFGIBS := 0;

        for I := 0 to Aitens.Count - 1 do
        begin
          Aitem := Aitens.Items[I];
          with Det.New do
          begin
            vItem := Aitem.vitem;

            Prod.cProd      := Aitem.num_fab_prod.Trim;
            Prod.nItem      := Aitem.nitem;
            Prod.cEAN       := Aitem.cean.Trim;
            Prod.cEAN       := IfThen(Prod.cEAN.IsEmpty, 'SEM GTIN', Prod.cEAN);
            Prod.xProd     := Aitem.xprod.Trim;
            Prod.NCM       := Aitem.ncm.Trim;
            Prod.CEST      := Aitem.cest.Trim;
            Prod.nFCI      := Aitem.nfci.Trim;
            //Prod.NVE     := '';
            //Prod.EXTIPI  := '';
            Prod.CFOP      := Aitem.cfop.ToString;
            Prod.uCom      := Aitem.uvnd;
            Prod.qCom      := Aitem.qcom * Aitem.uvnd_fator;
            Prod.vProd     := Aitem.vprod;
            if Prod.qCom > 0 then
              Prod.vUnCom  := Aitem.vprod / Prod.qCom;
            Prod.cEANTrib  := Prod.cEAN;
            {
            Prod.uTrib     := Prod.uCom;
            Prod.qTrib     := Prod.qCom;
            Prod.vUnTrib   := Prod.vUnCom;
            }
            Prod.uTrib    := IfThen(Aitem.utrib.IsEmpty, Prod.uCom, Aitem.utrib);
            Prod.qTrib    := IfThen(Aitem.qtrib > 0, Aitem.qtrib , 1) * Aitem.qcom;

            if Prod.qTrib > 0 then
              Prod.vUnTrib := IfThen( RoundTo(Prod.qCom, -4) = RoundTo(Prod.qTrib, -4), Prod.vUnCom, (Prod.vProd / Prod.qTrib));

            Prod.vFrete    := Aitem.vfrete;
            Prod.vSeg      := Aitem.vseg;
            Prod.vDesc     := Aitem.vdesc;
            Prod.vOutro    := Aitem.voutro;
            Prod.IndTot    := itSomaTotalNFe;
            Prod.indEscala := StrToIndEscala(vOK, IfThen(Aitem.esc_indescala.IsEmpty, 'S', Aitem.esc_indescala));
            Prod.CNPJFab   := Aitem.esc_cnpjfab;

            if not Aitem.comb_cprodanp.IsEmpty then
              with Prod.comb do
              begin
                cProdANP  := StrToInt64Def(Aitem.comb_cprodanp, 0);
                descANP   := Aitem.comb_descanp;
                pGLP      := Aitem.comb_pglp;
                pGNn      := Aitem.comb_pgnn;
                pGNi      := Aitem.comb_pgni;
                vPart     := Aitem.comb_vpart;
                CODIF     := Aitem.comb_codif;
                if Aitem.comb_ufcons.IsEmpty and Assigned(Adest) then
                  UFcons  := Adest.uf
                else
                  UFcons  := Aitem.comb_ufcons;
              end;

            with Imposto do
            begin
              vTotTrib := Aitem.vtottrib;

              if Emit.CRT <> crtSimplesNacional then
              begin
                with PIS do
                begin
                  CST       := StrToCSTPIS(vOK, Aitem.pis_cst.Trim);
                  vBC       := Aitem.pis_vbc;
                  pPIS      := Aitem.pis_ppis;
                  vPIS      := Aitem.pis_vpis;
                  qBCProd   := Aitem.pis_qbcprod;
                  vAliqProd := Aitem.pis_valiqprod;
                end;//with PIS do

                with COFINS do
                begin
                  CST       := StrToCSTCOFINS(vOK, Aitem.cofins_cst.Trim);
                  vBC       := Aitem.cofins_vbc;
                  pCOFINS   := Aitem.cofins_pcofins;
                  vCOFINS   := Aitem.cofins_vcofins;
                  qBCProd   := Aitem.cofins_qbcprod;
                  vAliqProd := Aitem.cofins_valiqprod;
                end;//with COFINS do

              end;//if Emit.CRT <> crtSimplesNacional then

              if Aitem.tipo_item.Equals('P') then
              begin
                with ICMS do
                begin
                  orig := StrToOrig(vOK, Aitem.icm_orig.Trim);
                  if not Aitem.ICM_CSOSN.Trim.IsEmpty then
                  begin
                    CSOSN       := StrToCSOSNIcms(vOK, Aitem.icm_csosn.Trim);
                    pCredSN     := Aitem.icm_pcredsn;
                    vCredICMSSN := Aitem.icm_vcredicmssn;
                  end
                  else
                  begin
                    CST        := StrToCSTICMS(vOK, Aitem.icm_cst.Trim);
                    modBC      := StrTomodBC(vOK,   Trunc(Aitem.icm_modbc).ToString);
                    pRedBC     := Aitem.icm_predbc;
                    vBC        := Aitem.icm_vbc;
                    pICMS      := Aitem.icm_picms;
                    vICMS      := Aitem.icm_vicms;
                    vBCSTRet   := Aitem.icm_vbcstret;
                    vICMSSTRet := Aitem.icm_vicmsstret;
                  end;
                  pFCP        := Aitem.fcp_pfcp;
                  vFCP        := Aitem.fcp_vfcp;
                  vBCFCP      := Aitem.fcp_vbcfcp;
                  vBCFCPST    := Aitem.fcp_vbcfcpst;
                  pFCPST      := Aitem.fcp_pfcpst;
                  vFCPST      := Aitem.fcp_vfcpst;
                  pST         := Aitem.fcp_pst;
                  vBCFCPSTRet := Aitem.fcp_vbcfcpstret;
                  pFCPSTRet   := Aitem.fcp_pfcpstret;
                  vFCPSTRet   := Aitem.fcp_vfcpstret;
                  pRedBCEfet  := Aitem.icm_predbcefet;
                  vBCEfet     := Aitem.icm_vbcefet;
                  pICMSEfet   := Aitem.icm_picmsefet;
                  vICMSEfet   := Aitem.icm_vicmsefet;
                  qBCMonoRet   := Aitem.qbcmonoret;
                  adRemICMSRet := Aitem.adremicmsret;
                  vICMSMonoRet := Aitem.vicmsmonoret;
                end;//with ICMS do
                Total.ICMSTot.vBC       := Total.ICMSTot.vBC       + ICMS.vBC;
                Total.ICMSTot.vICMS     := Total.ICMSTot.vICMS     + ICMS.vICMS;
                Total.ICMSTot.vProd     := Total.ICMSTot.vProd     + Prod.vProd;
                Total.ICMSTot.vFrete    := Total.ICMSTot.vFrete    + Prod.vFrete;
                Total.ICMSTot.vSeg      := Total.ICMSTot.vSeg      + Prod.vSeg;
                Total.ICMSTot.vDesc     := Total.ICMSTot.vDesc     + Prod.vDesc;
                Total.ICMSTot.vPIS      := Total.ICMSTot.vPIS      + PIS.vPIS;
                Total.ICMSTot.vCOFINS   := Total.ICMSTot.vCOFINS   + COFINS.vCOFINS;
                Total.ICMSTot.vOutro    := Total.ICMSTot.vOutro    + Prod.vOutro;
                Total.ICMSTot.vTotTrib  := Total.ICMSTot.vTotTrib  + vTotTrib;
                Total.ICMSTot.vFCP      := Total.ICMSTot.vFCP      + ICMS.vFCP;
                Total.ICMSTot.vFCPST    := Total.ICMSTot.vFCPST    + ICMS.vFCPST;
                Total.ICMSTot.vFCPSTRet := Total.ICMSTot.vFCPSTRet + ICMS.vFCPSTRet;

                Total.ICMSTot.qBCMono        := Total.ICMSTot.qBCMono        + ICMS.qBCMono;
                Total.ICMSTot.vICMSMono      := Total.ICMSTot.vICMSMono      + ICMS.vICMSMono;
                Total.ICMSTot.qBCMonoReten   := Total.ICMSTot.qBCMonoReten   + ICMS.qBCMonoReten;
                Total.ICMSTot.vICMSMonoReten := Total.ICMSTot.vICMSMonoReten + ICMS.vICMSMonoReten;
                Total.ICMSTot.qBCMonoRet     := Total.ICMSTot.qBCMonoRet     + ICMS.qBCMonoRet;
                Total.ICMSTot.vICMSMonoRet   := Total.ICMSTot.vICMSMonoRet   + ICMS.vICMSMonoRet;
              end
              else if Aitem.tipo_item.Trim.Equals('S') then
              begin
                with ISSQN do
                begin
                  vBC          := Aitem.iss_vbc;
                  vAliq        := Aitem.iss_valiq;
                  vISSQN       := Aitem.iss_vissqn;
                  cMunFG       := ConfNFCe.Emitente.cMun_IBGE;
                  cListServ    := Aitem.iss_clistserv.Trim;
                  vDeducao     := Aitem.iss_vdeducao;
                  vOutro       := Aitem.iss_voutro;
                  vDescIncond  := Aitem.iss_vdescincond;
                  vDescCond    := Aitem.iss_vdesccond;
                  vISSRet      := Aitem.iss_vissret;
                  indISS       := StrToindISS(vok, Aitem.iss_indiss.Trim);
                  cServico     := Aitem.num_fab_prod.Trim;
                  cMun         := ConfNFCe.Emitente.cMun_IBGE;
                  cPais        := ConfNFCe.Emitente.cPais;
                  indIncentivo := StrToindIncentivo(vOK, Aitem.iss_indincentivo.Trim);
                  if (Aitem.iss_retido.Trim = 'C') or (Aitem.iss_retido.Trim = 'S') then
                    indISSRet  := iirSim
                  else
                    indISSRet  := iirNao;
                end;//with ISSQN do
                Total.ISSQNtot.vBC         := Total.ISSQNtot.vBC         + ISSQN.vBC;
                Total.ISSQNtot.vServ       := Total.ISSQNtot.vServ       + Prod.vProd;
                Total.ISSQNtot.vISS        := Total.ISSQNtot.vISS        + ISSQN.vISSQN;
                Total.ISSQNtot.vPIS        := Total.ISSQNtot.vPIS        + PIS.vPIS;
                Total.ISSQNtot.vCOFINS     := Total.ISSQNtot.vCOFINS     + COFINS.vCOFINS;
                //Total.ISSQNtot.dCompet   := ;
                Total.ISSQNtot.vDeducao    := Total.ISSQNtot.vDeducao    + ISSQN.vDeducao;
                Total.ISSQNtot.vOutro      := Total.ISSQNtot.vOutro      + ISSQN.vOutro;
                Total.ISSQNtot.vDescIncond := Total.ISSQNtot.vDescIncond + ISSQN.vDescIncond;
                Total.ISSQNtot.vDescCond   := Total.ISSQNtot.vDescCond   + ISSQN.vDescCond;
                Total.ISSQNtot.vISSRet     := Total.ISSQNtot.vISSRet     + ISSQN.vISSRet;
                //Total.ISSQNtot.cRegTrib  := ;
              end;

              {$REGION 'IS'}

              {$ENDREGION}

              {$REGION 'IBS e CBS'}

              tmpIbsCbs := TributosDFeFactory.GetIBSCBS(Aitem.TributoRtc);
              if tmpIbsCbs <> nil then
              begin
                //IBSCBS.Assign(tmpIbsCbs);
                //tmpIbsCbs.Free();
                IBSCBS := tmpIbsCbs;
                tmpIbsCbs := nil;
              end;

              {$ENDREGION}

            end;//with Imposto do

          end;//with Det.Add do
        end;

        Total.ICMSTot.vNF := nfc.vnf;

        Total.vNFTot := nfc.vnftot;

        {$REGION 'IBSCBSTot'}

        with Total.IBSCBSTot do
        begin
          vBCIBSCBS := nfc.vbcibscbs;

          {$REGION 'gIBS'}

          with gIBS do
          begin

            with gIBSUFTot do
            begin
              vDif := nfc.ibsuf_vdif;
              vDevTrib := nfc.ibsuf_vdevtrib;
              vIBSUF := nfc.vibsuf;
            end;

            with gIBSMunTot do
            begin
              vDif := nfc.ibsmun_vdif;
              vDevTrib := nfc.ibsmun_vdevtrib;
              vIBSMun := nfc.vibsmun;
            end;

            vIBS := nfc.vibs;
            vCredPres := {ibs_vcredpres} 0;
            vCredPresCondSus := {ibs_vcredprescondsus} 0;
          end;

          {$ENDREGION}

          {$REGION 'gCBS'}

          with gCBS do
          begin
            vDif := nfc.cbs_vdif;
            vDevTrib := nfc.cbs_vdevtrib;
            vCBS := nfc.vcbs;
            vCredPres := {cbs_vcredpres} 0;
            vCredPresCondSus := {cbs_vcredprescondsus} 0;
          end;

          {$ENDREGION}

          {$REGION 'gMono'}

          with gMono do
          begin
            vIBSMono := nfc.vibsmono;
            vCBSMono := nfc.vcbsmono;
            vIBSMonoReten := nfc.vibsmonoreten;
            vCBSMonoReten := nfc.vcbsmonoreten;
            vIBSMonoRet := nfc.vibsmonoret;
            vCBSMonoRet := nfc.vcbsmonoret;
          end;

          {$ENDREGION}

          {$REGION 'gEstornoCred'}

          with gEstornoCred do
          begin
            vIBSEstCred := {vibsestcred} 0;
            vCBSEstCred := {vcbsestcred} 0;
          end;

          {$ENDREGION}
        end;

        {$ENDREGION}

        for I := 0 to Apags.Count - 1 do
        begin
          Apag := Apags.Items[i];
          with pag.New do
          begin
            tPag      := StrToFormaPagamento(vOK, VarToStr(Apag.tpag).PadLeft(2, '0'));

            if MatchText(VarToStr(Apag.tpag).PadLeft(2, '0'), ['03', '04', '10', '11', '12', '13', '15', '17', '18']) then
              tpIntegra := StrTotpIntegra(     vOK, Apag.tpintegra)
            else
              tpIntegra := TtpIntegra.tiNaoInformado;

            tBand     := StrToBandeiraCartao(vOK, VarToStr(Apag.tband));
            vPag      := Apag.VPAG;
            CNPJ      := Apag.CNPJ.Trim;
            cAut      := Apag.CAUT.Trim;
            indPag    := StrToIndpag(vOK, Apag.indpag);
            xPag      := IfThen( tPag = TpcnFormaPagamento.fpOutro, Apag.xpag);
          end;
        end;
        pag.vTroco := nfc.vtroco;

        Transp.modFrete := StrTomodFrete(vOK, nfc.modfrete.Trim);
        if (Transp.modFrete <> mfSemFrete) and (nfc.tr_codigo > 0) and (Assigned(Atr)) then
        begin
          if (not Atr.cpfcgc.Trim.IsEmpty) and (Atr.sigla_uf.Trim = ConfNFCe.Emitente.UF) and
            ((Atr.cod_pais = 0) or (Atr.cod_pais = 1058)) then
          begin
            with Transp.Transporta do
            begin
              CNPJCPF := Atr.cpfcgc.Trim;
              xNome := Atr.razao.Trim;
              if Atr.insc_est.Trim <> 'ISENTO' then
                IE := Atr.insc_est.Trim;
              xEnder := Atr.endereco.Trim + ',' +
                Atr.num_end_cliente.Trim;
              if Atr.complemento.Trim <> '' then
                xEnder := xEnder + ',' + Atr.complemento.Trim;
              xMun := Atr.nome_cidade.Trim;
              UF := Atr.sigla_uf.Trim;
            end;
          end;
        end;

        if Ide.indIntermed = iiOperacaoComIntermediador then
        begin
          infIntermed.CNPJ := nfc.infintermed_cnpj;
          infIntermed.idCadIntTran := nfc.infintermed_idcadinttran;
        end;

        if not nfc.infadfisco.Text.Trim.IsEmpty then
          InfAdic.infAdFisco := nfc.infadfisco.Text.Trim;
        if not nfc.INFCPL.Text.Trim.IsEmpty then
          InfAdic.infCpl := nfc.INFCPL.Text.Trim;

        {$REGION 'responsavel técnico'}
//        if ConfNFCe.NT_2018_005 then
          with infRespTec do
          begin
            CNPJ     := '03530705000109';
            xContato := 'HW SISTEMAS';
            email    := 'contato@hwsistemas.com.br';
            fone     := '3332725351';
            //idCSRT
            //hashCSRT
          end;
        {$ENDREGION}

      end;//with ANFCe.NotasFiscais.Add.NFe do
      {$ENDREGION}

      {$REGION 'gerando hash dos dados para nao enviar novamente notas sem alteracoes'}
      SameHash := False;
      SitOld   := nfc.situacao_nfce;
      with ANFCe.NotasFiscais.Items[ANFCe.NotasFiscais.Count - 1] do
      begin
        RescDhEmi  := NFe.Ide.dEmi;
        RescDhCont := NFe.Ide.dhCont;

        NFe.Ide.dEmi   := 0;
        NFe.Ide.dhCont := 0;

        try
          HashNFCe := THashMD5.GetHashString(GerarXML).Trim;
        except on E: Exception do
          begin
            HashNFCe := '';
            registraErro('Erro Hash NFCe THashMD5.GetHashString ' + E.Message);
          end;
        end;

        if SitOld.Equals(sitRejeitada) and (not HashNFCe.IsEmpty) and (not nfc.xmotivo.ToLower.Contains('certificado assinatura data validade')) then
          //SameHash := HashNFCe.Equals(nfc.hashnfc) and (not StrIn(nfc.cstat, ['228', '569', '704']));//rejeicoes de data atrasada e contingencia
          SameHash := HashNFCe.Equals(nfc.hashnfc) and (not ContainsText(ConfNFCe.Validacoes.RejeicoesSemCtrl, ',' + nfc.cstat + ','));//rejeicoes de data atrasada e contingencia e outras configuradas

        NFe.Ide.dEmi   := RescDhEmi;
        NFe.Ide.dhCont := RescDhCont;
      end;
      {$ENDREGION}


      Result := True;
    finally
      if Assigned(Atr) then
        FreeAndNil(Atr);
      if Assigned(Adest) then
        FreeAndNil(Adest);
      if Assigned(Apags) then
        FreeAndNil(Apags);
      if Assigned(Aitens) then
        FreeAndNil(Aitens);
      if Assigned(nfc) then
        FreeAndNil(nfc);
    end;
  except on E: Exception do
    begin
      Result := False;
      FMensagemErro := 'AddNFCe_v400 -> ' + e.Message;
    end;
  end;

  if SameHash then
  begin
    Result        := False;
    FMensagemErro := 'NFCe já rejeitada e sem correções para enviar novamente';
  end;
end;

procedure THwNFCe.ANFCeGerarLog(const ALogLine: string; var Tratado: Boolean);
var
  ArquivoTexto: TextFile;
  NomeArquivo: string;
begin
  if (Trim(ALogLine) = 'ERRO:') then
  begin
    Tratado := True;
    Exit;
  end;
  FUltimoLog := ALogLine;
//  if (not ConfNFCe.SalvarLogNFC) then
//  begin
//    Tratado := True;
//    Exit;
//  end;

  NomeArquivo := ExtractFilePath(ParamStr(0)) + 'NFCe.log';
  try
    AssignFile(ArquivoTexto, NomeArquivo);
    try
      if not FileExists(NomeArquivo) then
        Rewrite(ArquivoTexto)
      else
        append(ArquivoTexto);
      WriteLn(ArquivoTexto, FUltimoLog);
      Tratado := True;
    finally
      closeFile(ArquivoTexto);
    end;
  except
  end;
end;

procedure THwNFCe.ANFCeTransmitError(const HttpError, InternalError: Integer; const URL, DadosEnviados,
  SoapAction: String; var Retentar, Tratado: Boolean);
begin
  StatusServ.Registrar(False);
end;

procedure THwNFCe.AtualizarResultadoEnvioNFCe;
var
  SituacaoNFCe: string;
  CamposUpdate: string;
  Prefixo: string;
begin
  FResp.xMotivo    := StringReplace(FResp.xMotivo, '''', '"', [rfReplaceAll]);
  FResp.MsgRetorno := StringReplace(FResp.MsgRetorno, '''', '"', [rfReplaceAll]);

  FResp.xMotivo    := Copy(Trim(FResp.xMotivo)   , 1, 255);
  FResp.nProt      := Copy(Trim(FResp.nProt)     , 1,  17);
  FResp.chNFe      := Copy(Trim(FResp.chNFe)     , 1,  44);
  FResp.digVal     := Copy(Trim(FResp.digVal)    , 1,  28);
  FResp.MsgRetorno := Copy(Trim(FResp.MsgRetorno), 1, 255);

  case FResp.cStat of
    0                 : SituacaoNFCe := '';                 // Nao houve comunicacao com o ws
    103, 104, 105     : SituacaoNFCe := sitEmProcessamento; // Em Processamento
    204               : SituacaoNFCe := sitEnviando;        // Duplicidade, grava enviando para poder enviar novamente e fazer a consulta
    100, 120, 150     : SituacaoNFCe := sitAutorizada;
    110, 301, 302, 303: SituacaoNFCe := sitDenegada;
    135, 136, 155     : SituacaoNFCe := sitCancelada;
    102, 563          : SituacaoNFCe := sitInutilizada;
    else                SituacaoNFCe := sitRejeitada;
  end;
  if      SituacaoNFCe = sitCancelada   then Prefixo := 'canc_'
  else if SituacaoNFCe = sitInutilizada then Prefixo := 'inut_'
  else                                      Prefixo := '';

  if ((FMetodoWS = mwCancelamento) and (SituacaoNFCe <> sitCancelada)) or
     ((FMetodoWS = mwInutilizacao) and (SituacaoNFCe <> sitInutilizada)) then
  begin
    SituacaoNFCe := '';
    FResp.chNFe := '';
    FResp.digVal := '';
    Prefixo := IfThen(FMetodoWS = mwCancelamento, 'canc_', 'inut_');
  end;

  CamposUpdate := ' msgretorno = :msgretorno, cont_msg = coalesce(cont_msg, 0) + 1' +
                  IfThen(not FResp.HashNFCe.IsEmpty, Format(', hashnfc = %s', [FResp.HashNFCe.Substring(0, 32).QuotedString]));
  if Trim(SituacaoNFCe) <> '' then
    CamposUpdate := CamposUpdate + ', situacao_nfce = ' + QuotedStr(SituacaoNFCe);
  if FResp.cStat > 0 then
    CamposUpdate := CamposUpdate + ', ' + Prefixo + 'cstat = ' + IntToStr(FResp.cStat);
  if Trim(FResp.xMotivo) <> '' then
    CamposUpdate := CamposUpdate + ', ' + Prefixo + 'xmotivo = ' + QuotedStr(FResp.xMotivo);
  if Trim(FResp.nProt) <> '' then
    CamposUpdate := CamposUpdate + ', ' + Prefixo + 'nprot = ' + QuotedStr(FResp.nProt);
  if Trim(FResp.chNFe) <> '' then
    CamposUpdate := CamposUpdate + ', chave_nfce = ' + QuotedStr(FResp.chNFe);
  if (Trim(FResp.digVal) <> '') and (Prefixo = '') then
    CamposUpdate := CamposUpdate + ', digVal = ' + QuotedStr(FResp.digVal);
  if FResp.dhRecbto > 0 then
    CamposUpdate := CamposUpdate + ', ' + Prefixo + 'dhRecbto = :dhRecbto';
  if Trim(FResp.XMLResp) <> '' then
    CamposUpdate := CamposUpdate + ', ' + Prefixo + 'xml_nfce = :xml_nfce';

  {
  case FResp.cStat of
    100, 150,
    110, 301, 302, 303: CamposUpdate := ' cstat = ' + IntToStr(FResp.cStat) + ', xmotivo = ' +  QuotedStr(Copy(FResp.xMotivo, 1, 255),' +
                                        ' chave_nfce = :chave_nfce, dhRecbto = :dhRecbto, nProt = :nProt, digVal = :digVal,' +
                                        ' msgretorno = :msgretorno, situacao_nfce = :situacao_nfce, xml_nfce = :xml_nfce';
    135, 136, 155     : CamposUpdate := ' canc_cstat = ' + IntToStr(FResp.cStat) + ', canc_xmotivo = ' + QuotedStr(Copy(FResp.xMotivo, 1, 255),' +
                                        ' canc_nprot = :nprot, canc_dhrecbto = :dhRecbto, canc_xml_nfce = :xml_nfce';
    102, 563          : CamposUpdate := ' inut_cstat = ' + IntToStr(FResp.cStat) + ', inut_xmotivo = ' + QuotedStr(Copy(FResp.xMotivo, 1, 255),' +
                                        ' inut_nprot = :nprot, inut_dhRecbto = :dhRecbto, inut_xml_nfce = :xml_nfce';
    else
    begin
      CamposUpdate := ' msgretorno = :msgretorno, cont_msg = coalesce(cont_msg, 0) + 1';
      if FResp.cStat > 0 then
        CamposUpdate :=  CamposUpdate + ', cstat = ' + IntToStr(FResp.cStat);
      if Trim(FResp.xMotivo) <> '' then
        CamposUpdate := CamposUpdate + ', xmotivo = ' + QuotedStr(Copy(FResp.xMotivo, 1, 255));
    end;
  end;
  olhar aqui as condicoes do update, provavelmente vao ser varias, ver se tem um jeito de ficar facil de entender e nao embolar
  }

//  if Trim(SituacaoNFCe) <> '' then
//    CamposUpdate := 'situacao_nfce = ' + QuotedStr(SituacaoNFCe) + ',' + CamposUpdate;

  Buscas.Close;
  Buscas.SQL.Text := 'update nfce set ' + CamposUpdate +
    ' where cod_nfce = ' + IntToStr(FCodNFCe) +
    ' and cod_empresa = ' + IntToStr(FCodEmpresa);
//  Buscas.ParamByName('situacao_nfce').AsString := SituacaoNFCe;
  if FResp.dhRecbto > 0 then
    Buscas.ParamByName('dhRecbto').AsDateTime := FResp.dhRecbto;
//  Buscas.ParamByName('nProt').AsString         := Copy(FResp.nProt  , 1,  17);
  if Trim(FResp.XMLResp) <> '' then
    Buscas.ParamByName('xml_nfce').AsString   := FResp.XMLResp;
  Buscas.ParamByName('msgretorno').AsString   := FResp.MsgRetorno;
//  if (SituacaoNFCe = sitAutorizada) or (SituacaoNFCe = sitDenegada) then
//  begin
//    Buscas.ParamByName('chave_nfce').AsString  := Copy(FResp.chNFe  , 1,  44);
//    Buscas.ParamByName('digVal').AsString      := Copy(FResp.digVal , 1,  28);
//  end;
  Buscas.ExecSQL;

  if MatchText(SituacaoNFCe, [sitAutorizada, sitDenegada, sitCancelada, sitInutilizada]) then
  begin
    SqlExec('delete from doc_eletronico where id_doc = %s and cod_empresa = %d',
            [QuotedStr('NFCE-' + PadL(FCodNFCe, 11)), FCodEmpresa], Buscas);
  end;

  if Buscas.Transaction.InTransaction then
    Buscas.Transaction.Commit;
end;

function THwNFCe.ConfigurarACBr(Value: TACBrNFe): Boolean;
var
  vOK: Boolean;
begin
  Result := False;
  if not Assigned(Value) then
    Exit;
  try
    if ConfNFCe = nil then
      ConfNFCe := THwConfNFCe.Create;

//    if ConfNFCe.CodEmpresa <> FCodEmpresa then
      if not ConfNFCe.LerConfiguracoes(FCodEmpresa, FCodEmissor,  Buscas) then
        raise Exception.Create('Não foi possivel ler configurações. NFCE_CONFIG');

    Value.Configuracoes.Geral.ModeloDF                  := moNFCe;
    Value.Configuracoes.Geral.VersaoDF                  := ve400;
    Value.Configuracoes.Geral.AtualizarXMLCancelado     := True;
    Value.Configuracoes.Geral.IdCSC                     := ConfNFCe.Geral.IdCSC;
    Value.Configuracoes.Geral.CSC                       := ConfNFCe.Geral.CSC;
//    Value.Configuracoes.Geral.IncluirQRCodeXMLNFCe      := True;
    Value.Configuracoes.Geral.FormaEmissao              := StrToTpEmis(vOK, IntToStr(ConfNFCe.Geral.TpEmis));
    Value.Configuracoes.Geral.Salvar                    := True;
    Value.Configuracoes.Geral.ExibirErroSchema          := True;
    Value.Configuracoes.Geral.RetirarAcentos            := True;
    Value.Configuracoes.Geral.ValidarDigest             := False;
    Value.Configuracoes.Geral.VersaoQRCode              := veqr200;
    Value.Configuracoes.Geral.ForcarGerarTagRejeicao938 := fgtNunca;
    if ConfNFCe.FLibSSLDFe.SSLLib = 0 then
      Value.Configuracoes.Geral.SSLLib                  := TSSLLib( IfThen(ConfNFCe.FWebServices.SSLLib = 0, Integer(libCapicom)) +
                                                                    IfThen(ConfNFCe.FWebServices.SSLLib = 1, Integer(libOpenSSL)) +
                                                                    IfThen(ConfNFCe.FWebServices.SSLLib = 2, Integer(libWinCrypt)))
    else if ConfNFCe.FLibSSLDFe.SSLLib = 5 then
    begin
      Value.Configuracoes.Geral.SSLLib                  := TSSLLib(ConfNFCe.FLibSSLDFe.SSLLib);
      Value.Configuracoes.Geral.SSLCryptLib             := TSSLCryptLib(ConfNFCe.FLibSSLDFe.SSLCryptLib);
      Value.Configuracoes.Geral.SSLHttpLib              := TSSLHttpLib(ConfNFCe.FLibSSLDFe.SSLHttpLib);
      Value.Configuracoes.Geral.SSLXmlSignLib           := TSSLXmlSignLib(ConfNFCe.FLibSSLDFe.SSLXmlSignLib);
    end
    else if ConfNFCe.FLibSSLDFe.SSLLib in [1..4] then
      Value.Configuracoes.Geral.SSLLib                  := TSSLLib(ConfNFCe.FLibSSLDFe.SSLLib)
    else
      Value.Configuracoes.Geral.SSLLib                  := libCapicom;

    if (ConfNFCe.Certificado.DadosPFX <> '') and (Value.Configuracoes.Geral.SSLLib <> libCapicom) then
      Value.Configuracoes.Certificados.DadosPFX         := DecodeBase64(ConfNFCe.Certificado.DadosPFX)
    else
      Value.Configuracoes.Certificados.ArquivoPFX       := ConfNFCe.Certificado.ArquivoPFX;
    Value.Configuracoes.Certificados.Senha              := ConfNFCe.Certificado.Senha;

    if Value.Configuracoes.Geral.SSLLib <> libOpenSSL then
      Value.Configuracoes.Certificados.NumeroSerie        := ConfNFCe.Certificado.NumeroSerie;
    Value.Configuracoes.Certificados.VerificarValidade  := False;
    {
    if FClientOrServer = pmServer then
      Value.Configuracoes.Geral.SSLLib                    := libCapicom
    else
      Value.Configuracoes.Geral.SSLLib                    := libCapicom;
    }
    Value.Configuracoes.WebServices.UF                  := ConfNFCe.WebServices.UF;
    if ConfNFCe.WebServices.Ambiente = '1' then
      Value.Configuracoes.WebServices.Ambiente          := taProducao
    else
      Value.Configuracoes.WebServices.Ambiente          := taHomologacao;

    Value.Configuracoes.WebServices.ProxyHost           := ConfNFCe.WebServices.ProxyHost;
    Value.Configuracoes.WebServices.ProxyPort           := ConfNFCe.WebServices.ProxyPort;
    Value.Configuracoes.WebServices.ProxyUser           := ConfNFCe.WebServices.ProxyUser;
    Value.Configuracoes.WebServices.ProxyPass           := ConfNFCe.WebServices.ProxyPass;
    Value.Configuracoes.WebServices.AguardarConsultaRet := ConfNFCe.WebServices.Aguardar;
    Value.Configuracoes.WebServices.Tentativas          := ConfNFCe.WebServices.Tentativas;
    Value.Configuracoes.WebServices.IntervaloTentativas := ConfNFCe.WebServices.Intervalo;
    Value.Configuracoes.WebServices.Salvar              := True;
    Value.Configuracoes.WebServices.TimeOut             := ConfNFCe.WebServices.TimeOut;
    Value.Configuracoes.WebServices.QuebradeLinha       := ';';
    if FClientOrServer = pmServer then
      Value.Configuracoes.WebServices.Visualizar        := False
    else
      Value.Configuracoes.WebServices.Visualizar        := ConfNFCe.WebServices.Visualizar;

    Value.Configuracoes.Arquivos.PathSalvar       := ConfNFCe.Arquivos.PathSalvar;
    Value.Configuracoes.Arquivos.PathSchemas      := ConfNFCe.Arquivos.PathSchemas;
    Value.Configuracoes.Arquivos.AdicionarLiteral := True;

    if Assigned(Value.MAIL) then
    begin
      with Value.MAIL do
      begin
        Host                := ConfNFCe.Email.Host;
        Port                := ConfNFCe.Email.Porta;
        Username            := ConfNFCe.Email.Usuario;
        Password            := ConfNFCe.Email.Senha;
        From                := ConfNFCe.Email.DeUsuario;
        SetSSL              := ConfNFCe.Email.UsarSSL;
        FromName            := ConfNFCe.Emitente.Nome;
        SetTLS              := True;
        ReadingConfirmation := False;
        UseThread           := False;
      end;
    end;

    Value.Configuracoes.RespTec.IdCSRT := StrToIntDef(ConfNFCe.IdCSRT, 0);
    Value.Configuracoes.RespTec.CSRT   := ConfNFCe.CSRT;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      FMensagemErro := 'ConfigurarANFCe -> ' +  e.message;
    end;
  end;
end;

function THwNFCe.ConsultaNFCe: Integer;
var
  AssignedObj   : Boolean;
  NFCeProcessada: Boolean;
  RescueMetodoWS: RMetodoWS;
  Status        : string;
  nfce: TNfce_class;
begin
  Result := 0;
  RescueMetodoWS := FMetodoWS;

  ClearResp;

  FResp.MsgRetorno := '';
  NFCeProcessada   := False;

  AssignedObj := Assigned(ANFCe);

  if not AssignedObj then
    ANFCe := TACBrNFe.Create(nil);

  try
    FMetodoWS := mwAutorizacao;
    try
      nfce := TNfce_class.Create;
      nfce.SetValuesFrom(SqlOpen('select status, situacao_nfce, digval, xml_nfce from nfce' +
                                 ' where cod_nfce = %d and cod_empresa = %d',
                                 [FCodNFCe, FCodEmpresa], Buscas), True);

      Status := Buscas.FieldByName('status').AsString;

      if Buscas.IsEmpty then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' nao localizada');

      if StrIn(nfce.situacao_nfce, [ sitAutorizada, sitCancelada, sitDenegada ]) then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' ' + nfce.situacao_nfce);

      if not AssignedObj then
      begin
        ANFCe.OnGerarLog := ANFCeGerarLog;
        ANFCe.OnTransmitError := ANFCeTransmitError;
        if FClientOrServer = pmUndefined then
          raise Exception.Create('ClientOrServer Undefined. Configure antes da chamada');

        if not ConfigurarACBr(ANFCe) then
          Exit;
      end;

      ANFCe.NotasFiscais.Clear;
      if not nfce.digval.Trim.IsEmpty then
      begin
        ANFCe.NotasFiscais.LoadFromString(nfce.xml_nfce.Text);
        if ANFCe.NotasFiscais.Count = 0 then
          raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' sem XML');

        ANFCe.Configuracoes.WebServices.Ambiente := ANFCe.NotasFiscais.Items[0].NFe.Ide.tpAmb;
      end
      else
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' sem DigestValue');

      StatusServ.StartLog(tsConsulta, ANFCe.NotasFiscais.Items[0].NumID);
      try
        ANFCe.Consultar();
      finally
        StatusServ.Registrar();
      end;

      if not ANFCe.NotasFiscais.Items[0].Processada then
      begin
        NFCeProcessada   := False;
        FResp.cStat      := ANFCe.WebServices.Consulta.cStat;
        FResp.xMotivo    := ANFCe.WebServices.Consulta.xMotivo;
        FResp.MsgRetorno := ANFCe.WebServices.Consulta.Msg;
        
        if Trim(FResp.MsgRetorno) = '' then
          FResp.MsgRetorno := FResp.cStat.ToString + ' - ' + FUltimoLog
        else
          FResp.MsgRetorno := FResp.cStat.ToString + ' - ' + FResp.MsgRetorno;
        Result := FResp.cStat;
      end;

      if ANFCe.NotasFiscais.Items[0].Processada then
      begin
        ClearResp;

        FResp.cStat      := ANFCe.NotasFiscais.Items[0].NFe.procNFe.cStat;
        FResp.xMotivo    := ANFCe.NotasFiscais.Items[0].NFe.procNFe.xMotivo;
        FResp.nProt      := ANFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
        FResp.chNFe      := ANFCe.NotasFiscais.Items[0].NFe.procNFe.chDFe;
        FResp.digVal     := ANFCe.NotasFiscais.Items[0].NFe.procNFe.digVal;
        FResp.dhRecbto   := ANFCe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto;
        FResp.XMLResp    := ANFCe.NotasFiscais.Items[0].XMLOriginal;
        FResp.MsgRetorno := FResp.xMotivo;

        AtualizarResultadoEnvioNFCe;

        RegistradorAlertasDFeUtil.ResolverAlertas(ANFCe.NotasFiscais.Items[0].NFe.procNFe);

        NFCeProcessada := True;
        Result         := FResp.cStat;

        if Status = stsACancelar then
          with Task.New do
          begin
            Task       := tsCancelamento;
            CodigoNFCe := FCodNFCe;
            CodigoEmp  := FCodEmpresa;
          end;
      end;

      //Result := ANFCe.NotasFiscais.Items[0].NFe.procNFe.cStat;

    except on E: Exception do
      begin
        FResp.MsgRetorno := 'Consulta -> ' + e.Message;
        Exit;
      end;
    end;

  finally
    if Trim(FResp.MsgRetorno) <> '' then
      FResp.MsgRetorno := 'ConsultaNFCe -> ' + FResp.MsgRetorno;

    FMensagemErro := FResp.MsgRetorno;

    if (FResp.MsgRetorno <> '') and (not NFCeProcessada) then
      AtualizarResultadoEnvioNFCe;

    FMetodoWS := RescueMetodoWS;
    if not AssignedObj then
      if Assigned(ANFCe) then
        FreeAndNil(ANFCe);
  end;
end;

constructor THwNFCe.create;
begin
  inherited;
  FCodEmissor            := 0;
  //FStandAlone      := False;
  //FUseThread       := False;
  UsaServidorAutorizacao := False;
  UsaServidorImpressao   := False;
  UsaServidorEmail       := False;
  FMetodoWS              := mwUndefined;
  FAcoesAdicionais       := '';
  FTask                  := TTaskNFCes.Create(Self);
  StatusServ             := TNFCe_StatusServico.Create(Self);

end;

destructor THwNFCe.Destroy;
begin
  FreeAndNil(FTask);
  inherited;
end;

function THwNFCe.CancelarNFCe: Integer;
var
  Lote: Integer;
  NFCeCancelada, EventoProcessado: Boolean;

  Justificativa: string;
  I, J: Integer;
  RetInfEventoCanc: TRetInfEvento;

  CodNFCeCont, ConsultaStat: Integer;
  OK: Boolean;
begin
  Result := 0;
  if not conectar(False) then
    Exit;

  ClearResp;
  NFCeCancelada   := False;
  FMetodoWS       := mwCancelamento;
  try
    try    
      if FClientOrServer = pmUndefined then
        raise Exception.Create('ClientOrServer Undefined. Configure antes da chamada');

      ANFCe            := TACBrNFe.Create(nil);
      ANFCe.OnGerarLog := ANFCeGerarLog;
      ANFCe.OnTransmitError := ANFCeTransmitError;
      AMail            := TACBrMail.Create(nil);
      ANFCe.MAIL       := TACBrMail(AMail);
      RetInfEventoCanc := nil;
      if not ConfigurarACBr(ANFCe) then
        Exit;

      if not NFCeValida then
        Exit;

      Buscas.Close;
      Buscas.SQL.Text := 'select status, canc_xjust, situacao_nfce, xml_nfce, cod_nfce_conting from nfce' +
        ' where cod_nfce = ' + IntToStr(FCodNFCe) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      Buscas.Open;

      if Buscas.IsEmpty then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' nao localizada');


      if (Trim(Buscas.FieldByName('status').AsString) = stsACancelar) and
         (Trim(Buscas.FieldByName('situacao_nfce').AsString) <> sitAutorizada) then
      begin //Consultar antes, Se retorno de nao consta entao Inutiliza, se autorizada continua
        ConsultaStat := ConsultaNFCe;

        if ConsultaStat = 0 then
          raise Exception.Create('Sem retorno na Consulta para NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa));

        SqlOpen('select canc_xjust, situacao_nfce, xml_nfce, cod_nfce_conting from nfce' +
                  ' where cod_nfce = %d and cod_empresa = %d',
                  [FCodNFCe, FCodEmpresa], Buscas);

        if ConsultaStat = 217 then //? nao consta resta apenas inutilizar
        begin
          with FTask.New do
          begin
            Task       := tsInutilizacao;
            CodigoNFCe := FCodNFCe;
            CodigoEmp  := FCodEmpresa;
          end;
          Exit;
        end;
      end
      else if (Trim(Buscas.FieldByName('situacao_nfce').AsString) <> sitAutorizada) then
      begin
        // poderia fazer igual o Status A Cancelar, so nao faz porque nao foi um comando do usuario, emquanto A Cancelar é mais especifico
        if (Buscas.FieldByName('cod_nfce_conting').AsInteger = 0) then
          raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' não está Autorizada');

        ConsultaNFCe;

        SqlOpen('select canc_xjust, situacao_nfce, xml_nfce, cod_nfce_conting from nfce' +
                ' where cod_nfce = %d and cod_empresa = %d',
                [FCodNFCe, FCodEmpresa], Buscas);
      end;

      if (Trim(Buscas.FieldByName('situacao_nfce').AsString) <> 'Autorizada') then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' não está Autorizada');

      Justificativa := Trim(Buscas.FieldByName('canc_xjust').AsString);
      CodNFCeCont   := Buscas.FieldByName('cod_nfce_conting').AsInteger;

      if (CodNFCeCont > 0) and (Justificativa.Trim.IsEmpty) then
      begin
        Justificativa := 'CANCELAMENTO POR SUBSTITUIÇÃO DE NFC EMITIDA EM CONTINGÊNCIA';
        SqlExec('update nfce set canc_xjust = %s where cod_nfce = %d and cod_empresa = %d and coalesce(canc_xjust,'''') = '''' ',
                [Justificativa.Substring(0,255).QuotedString, FCodNFCe, FCodEmpresa]);
      end;

      if Length(Justificativa) < 15 then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' com justificativa menor que 15 caracteres');

      if Length(Justificativa) > 255 then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' com justificativa maior que 255 caracteres');

      ANFCe.NotasFiscais.Clear;
      ANFCe.NotasFiscais.LoadFromString(Buscas.FieldByName('xml_nfce').AsString);
      if ANFCe.NotasFiscais.Count = 0 then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' não foi localizado o XML');

      ANFCe.Configuracoes.WebServices.Ambiente := ANFCe.NotasFiscais.Items[0].NFe.Ide.tpAmb;

      Buscas.Close;
      Buscas.SQL.Text := 'select COD from incrementa_codigo(' + IntToStr(FCodEmpresa) + ', ''NFCE_CAN_LOTE'')';
      Buscas.Open;
      Lote := Buscas.FieldByName('COD').AsInteger;
      if Buscas.Transaction.InTransaction then
        Buscas.Transaction.Commit;
      Buscas.Close;

      try
        ClearResp;
        ANFCe.EventoNFe.Evento.Clear;
        ANFCe.EventoNFe.idLote := Lote;

        with ANFCe.EventoNFe.Evento.New do
        begin
          InfEvento.tpAmb                := ANFCe.NotasFiscais.Items[0].NFe.Ide.tpAmb;
          InfEvento.CNPJ                 := ANFCe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
          InfEvento.chNFe                := ANFCe.NotasFiscais.Items[0].NumID;
          InfEvento.dhEvento             := Now;
          InfEvento.tpEvento             := teCancelamento;
          InfEvento.nSeqEvento           := 1;
          InfEvento.detEvento.descEvento := 'Cancelamento';
          InfEvento.detEvento.nProt      := ANFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
          InfEvento.detEvento.xJust      := Justificativa;

          if (CodNFCeCont > 0) and
             ((InfEvento.dhEvento - ANFCe.NotasFiscais.Items[0].NFe.Ide.dEmi) > MinToDay(ConfNFCe.Validacoes.LimMinCancNormal)) then
          begin
            SqlOpen('select situacao_nfce, chave_nfce from nfce where cod_nfce = %d and cod_empresa = %d', [CodNFCeCont, FCodEmpresa], Buscas);

            if not StrIn(Buscas.FieldByName('situacao_nfce').AsString, [sitAutorizada, sitCancelada, sitDenegada, sitInutilizada]) then
              raise Exception.Create('Cancelamento por Substituição NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ', NFCe em contingência ainda não Autorizada, Cancelada ou Denegada');

            InfEvento.tpEvento              := teCancSubst;
            InfEvento.detEvento.descEvento  := 'Cancelamento por substituicao';
            InfEvento.detEvento.cOrgaoAutor := StrToIntDef(Buscas.FieldByName('chave_nfce').AsString.Substring(0, 2), 0) ;
            InfEvento.detEvento.tpAutor     := StrToTipoAutor(OK, '1');
            InfEvento.detEvento.verAplic    := ANFCe.NotasFiscais.Items[0].NFe.Ide.verProc;
            InfEvento.detEvento.nProt       := ANFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
            InfEvento.detEvento.chNFeRef    := Buscas.FieldByName('chave_nfce').AsString;
          end;
        end;

        StatusServ.StartLog(tsCancelamento, ANFCe.NotasFiscais.Items[0].NumID);
        try
          EventoProcessado := ANFCe.EnviarEvento(Lote);
        finally
          StatusServ.Registrar();
        end;

        case ANFCe.EventoNFe.Evento.Items[0].RetInfEvento.cStat of
          135, 136, 155:
            begin
              NFCeCancelada := True;
              RetInfEventoCanc := TRetInfEvento(ANFCe.EventoNFe.Evento.Items[0].RetInfEvento);
            end
          else
            NFCeCancelada := False;
        end;

        if not NFCeCancelada then
        begin
          if EventoProcessado then
          begin
            FResp.cStat      := ANFCe.EventoNFe.Evento.Items[0].RetInfEvento.cStat;
            FResp.xMotivo    := ANFCe.EventoNFe.Evento.Items[0].RetInfEvento.xMotivo;
            FResp.MsgRetorno := ANFCe.EventoNFe.Evento.Items[0].RetInfEvento.xMotivo;
          end
          else
          begin
            FResp.cStat      := ANFCe.WebServices.EnvEvento.cStat;
            FResp.xMotivo    := ANFCe.WebServices.EnvEvento.xMotivo;
            FResp.MsgRetorno := ANFCe.WebServices.EnvEvento.Msg;
          end;
          if Trim(FResp.MsgRetorno) = '' then
            FResp.MsgRetorno := FUltimoLog;

          if FResp.cStat = 573 then // Alguma consulta para verificar se ha fiu cancelada
          begin
            StatusServ.StartLog(tsConsulta, ANFCe.NotasFiscais.Items[0].NumID);
            try
              ANFCe.Consultar();
            finally
              StatusServ.Registrar();
            end;
            for I := 0 to ANFCe.WebServices.Consulta.procEventoNFe.Count - 1 do
              for J := 0 to ANFCe.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Count - 1 do
                if ((ANFCe.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Items[J].RetInfEvento.tpEvento in [teCancelamento, teCancSubst]) or
                   (Pos('<tpEvento>110112</tpEvento>', ANFCe.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Items[J].RetInfEvento.XML) > 0 ))  then
                  with ANFCe.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Items[J] do
                    case RetInfEvento.cStat of
                      135, 136, 155:
                        begin
                          NFCeCancelada := True;
                          RetInfEventoCanc := TRetInfEvento(RetInfEvento);
                        end;
                    end;
          end;
        end;

        if (NFCeCancelada) and (RetInfEventoCanc <> nil) then
        begin
          with RetInfEventoCanc do
          begin
            ClearResp;
            FResp.cStat      := cStat;
            FResp.xMotivo    := xMotivo;
            FResp.nProt      := nProt;
            FResp.dhRecbto   := dhRegEvento;
            FResp.XMLResp    := XML;
            FResp.MsgRetorno := FResp.xMotivo;
          end;

          AtualizarResultadoEnvioNFCe;

          Result := 1;
        end;

      except on E: Exception do
        begin
          FResp.MsgRetorno := 'Envio -> ' + e.Message;
          Exit;
        end;
      end;

    except on E: Exception do
      begin
        FResp.MsgRetorno := e.Message;
      end;
    end;

  finally
    if Trim(FResp.MsgRetorno) <> '' then
    begin
      FResp.MsgRetorno := 'CancelarNFCe -> ' + FResp.MsgRetorno;
      FMensagemErro := FResp.MsgRetorno;
    end;

    if (FResp.MsgRetorno <> '') and (not NFCeCancelada) then
      AtualizarResultadoEnvioNFCe;

    if ANFCe <> nil then
      FreeAndNil(ANFCe);
    if AMail <> nil then
      FreeAndNil(AMail);

//    if Assigned(TaskInut) then
//    begin
//      Result := TaskInut.Run;
//      FreeAndNil(TaskInut);
//    end;

    desconectar;
  end;
end;

procedure THwNFCe.ChangeBufferPosPrinter(Sender: TObject);
begin
  if FBufferPosPrinter <> nil then
    if TStringList(Sender).Text <> '' then
      FBufferPosPrinter.Text := TStringList(Sender).Text;
end;

procedure THwNFCe.ClearResp;
begin
  FResp.cStat      := 0;
  FResp.xMotivo    := '';
  FResp.nProt      := '';
  FResp.chNFe      := '';
  FResp.digVal     := '';
  FResp.dhRecbto   := 0;
  FResp.XMLResp    := '';
  FResp.MsgRetorno := '';
  FResp.HashNFCe   := '';
  FResp.verAplic   := '';
  FResp.cMsg       := 0;
  FResp.xMsg       := '';
  FResp.Processada := False;
end;

function THwNFCe.ClientCancelar: Integer;
var
  client: TEnvioNFCe;//Thread
  SeqID : Integer;
begin
  Result := 0;
  try
    if not AcessoValido then
      Exit;

    try
      if UsaServidorAutorizacao then
      begin
        SeqID  := RegistraCentralDeAcoes(actCancelar);
        Result := SeqID;
      end
      else
        Result := CancelarNFCe;
      {
      else if not FUseThread then
      begin
        Result := CancelarNFCe;
      end
      else
      begin
        client                := TEnvioNFCe.Create(True);
        client.CodEmpresa     := CodEmpresa;
        client.CodEmissor     := CodEmissor;
        client.Token          := Ftoken;
        client.CodNFC         := CodNFCe;
        client.Acao           := actCancelar;
        client.ClientOrServer := FClientOrServer;
        client.Resume;

        Result := 1;
      end;
      }
    except on E: Exception do
      begin
        FMensagemErro := e.Message;
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNFCe.ClientEnviar: Integer;
var
  client  : TEnvioNFCe;//Thread
  SeqID, I: Integer;
begin
  Result := 0;
  try
    if not AcessoValido then
      Exit;

    try
      if UsaServidorAutorizacao then
      begin
        SeqID := RegistraCentralDeAcoes(actAutorizar);
        Result := SeqID;
      end
      else
      begin
        if Length(FArrayNFCe) > 0 then
        begin
          for I := Low(FArrayNFCe) to High(FArrayNFCe) do
          begin
            FCodNFCe := FArrayNFCe[I];

            try

              Result := Result + EnviarNFCe;

            except on E: Exception do
              begin
                FMensagemErro := FMensagemErro + IfThen(not FMensagemErro.IsEmpty, sLineBreak) + E.Message;
              end;
            end;
          end;

        end
        else
        begin
          Result := EnviarNFCe;
          if Result > 0 then
            if Trim(FAcoesAdicionais) <> '' then
              EnviarEmailNFCe;
        end;
      end;

    except on E: Exception do
      begin
        FMensagemErro := e.Message;
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNFCe.ClientEnviarEmail(UsarServidor: Boolean): Integer;
var
  client: TEnvioNFCe;//Thread
  SeqID : Integer;
begin
  Result := 0;
  try
    // 735	Correção	ERRO AO ENVIAR EMAIL NFC-E PELO RETAGUARDA
    //if not AcessoValido then
    //  Exit;

    try
      //if (not FStandAlone) and (UsarServidor) then
      if UsaServidorEmail then
      begin
        SeqID := RegistraCentralDeAcoes(actEnviarEmail);
        Result := SeqID;
      end
      else
        Result := EnviarEmailNFCe;
      {
      else if not FUseThread then
      begin
        Result := EnviarEmailNFCe;
      end
      else
      begin
        client                 := TEnvioNFCe.Create(True);
        client.CodEmpresa      := CodEmpresa;
        client.CodEmissor      := CodEmissor;
        client.Token           := Ftoken;
        client.CodNFC          := CodNFCe;
        client.Acao            := actEnviarEmail;
        client.ClientOrServer  := FClientOrServer;
        client.AcoesAdicionais := FAcoesAdicionais;
        client.SetArrayNFCe(FArrayNFCe);
        client.Resume;

        Result := 1;
      end;
      }
    except on E: Exception do
      begin
        FMensagemErro := e.Message;
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNFCe.EnviarEmailNFCe: Integer;
var
  EmailEnviado: Boolean;
  ADANFe      : TACBrNFeDANFCeFortes;
  Cancelada   : Boolean;
  MsgAdicional: string;
  xmlCancMail : TStrings;
  xmlPathArq  : string;
  I           : Integer;
  StrID       : string;
  XMLNFCe     : TStrings;
  FilesToDel  : TStrings;
  FilesAttach : TStrings;
  Erros       : TStrings;
  PathTemp    : string;
  FileTemp    : string;
  CountNF     : Integer;
  AnexarPDF   : Boolean;
  AnexarCanc  : Boolean;
  matriz      : array of array of Integer;
begin
  Result    := 0;
  Cancelada := False;
  if not conectar(False) then
    Exit;

  ClearResp;
  EmailEnviado := False;
  try
    try
      if FClientOrServer = pmUndefined then
        raise Exception.Create('ClientOrServer Undefined. Configure antes da chamada');

      ANFCe            := TACBrNFe.Create(nil);
      ANFCe.OnGerarLog := ANFCeGerarLog;
      ANFCe.OnTransmitError := ANFCeTransmitError;
      AMail            := TACBrMail.Create(nil);
      ANFCe.MAIL       := TACBrMail(AMail);

      if not ConfigurarACBr(ANFCe) then
        Exit;

      if FCodNFCe > 0 then
      begin
        SetLength(FArrayNFCe, Length(FArrayNFCe) + 1);
        FArrayNFCe[High(FArrayNFCe)] := FCodNFCe;
      end;

      StrID := '';

      var limit := 1500;
      var SQL := '';
      var StrSQL := Format('select cod_nfce, canc_xml_nfce, situacao_nfce, xml_nfce, inut_xml_nfce, num_nf from nfce' +
                           ' where cod_nfce in (%%s) and cod_empresa = %d and situacao_nfce in  (%s, %s)',
                           [FCodEmpresa, sitCancelada.QuotedString, sitAutorizada.QuotedString]);


      if Length(FArrayNFCe) > limit then
      begin
        var rows := Ceil(Length(FArrayNFCe) / limit);
        var iRow := 0;
        var iColl := 0;

        SetLength(matriz, rows);
        SetLength(matriz[0], 0);

        for I := Low(FArrayNFCe) to High(FArrayNFCe) do
        begin
          if Length(matriz[iRow]) >= limit then
          begin
            iRow := iRow + 1;
            iColl := 0;
          end;

          SetLength(matriz[iRow], iColl + 1);
          matriz[iRow, iColl] := FArrayNFCe[I];

          iColl := iColl + 1;
        end;

        for iRow := Low(matriz) to High(matriz) do
        begin
          strId := '';
          for iColl := Low(matriz[iRow]) to High(matriz[iRow]) do
            StrID := StrID + IfThen(not StrID.IsEmpty, ',') + IntToStr(matriz[iRow, iColl]);

          SQL := SQL + IfThen(not SQL.IsEmpty, ' union ') + Format(StrSQL, [STRID]);
        end;
      end
      else
      begin
        for I := Low(FArrayNFCe) to High(FArrayNFCe) do
          StrID := StrID + IfThen(not StrID.IsEmpty, ',') + IntToStr(FArrayNFCe[I]);

        SQL := Format(StrSQL, [STRID]);
      end;

      SqlOpen('select * from (%s) as c order by c.num_nf', [SQL], Buscas);
      {
      SqlOpen('select cod_nfce, canc_xml_nfce, situacao_nfce, xml_nfce, inut_xml_nfce from nfce' +
              ' where cod_nfce in (%s) and cod_empresa = %d and situacao_nfce in  (%s, %s)',
              [StrId, FCodEmpresa, sitCancelada.QuotedString, sitAutorizada.QuotedString], Buscas);
     }

      if Buscas.IsEmpty then
        raise Exception.Create('NFCe codigo ' + StrID + ' emp ' + IntToStr(FCodEmpresa) + ' nao localizada');

      XMLNFCe     := TStringList.Create;
      FilesToDel  := TStringList.Create;
      FilesAttach := TStringList.Create;
      Erros       := TStringList.Create;
      PathTemp    := GetPathTemp('PDFTemp');
      CountNF     := 0;
      AnexarPDF   := not FAcoesAdicionais.Substring(0, 1).Equals('*');
      if not AnexarPDF then
        FAcoesAdicionais := FAcoesAdicionais.Substring(1, FAcoesAdicionais.Length);

      AnexarCanc  := not FAcoesAdicionais.Substring(0, 1).Equals('#');
      if not AnexarCanc then
        FAcoesAdicionais := FAcoesAdicionais.Substring(1, FAcoesAdicionais.Length);

      if AnexarPDF then
      begin
        ADANFe              := TACBrNFeDANFCeFortes.Create(nil);
        ADANFe.Sistema      := 'Hw Sistemas';
        ADANFe.TipoDANFE    := tiNFCe;
        ADANFe.PathPDF      := PathTemp;
      end;

      while not Buscas.Eof do
      begin
        XMLNFCe.Text := Buscas.FieldByName('xml_nfce').AsString;
        ANFCe.NotasFiscais.Clear;
        ANFCe.NotasFiscais.LoadFromString(Buscas.FieldByName('xml_nfce').AsString);
        if ANFCe.NotasFiscais.Count = 0 then
          Erros.Add(Format('NF COD: %d XML Vazio', [Buscas.FieldByName('cod_nfce').AsInteger]))
        else if not ANFCe.NotasFiscais.Items[0].NFe.procNFe.cStat in [100, 120, 150] then
          Erros.Add(Format('NF COD: %d XML sem Autorizacao', [Buscas.FieldByName('cod_nfce').AsInteger]))
        else
        begin
          xmlPathArq := PathTemp + ANFCe.NotasFiscais.Items[0].NumID + '-nfe.xml';
          XMLNFCe.SaveToFile(xmlPathArq);
          FilesAttach.Add(xmlPathArq);
          FilesToDel.Add(xmlPathArq);

          if Buscas.FieldByName('situacao_nfce').AsString.Equals(sitCancelada)
            and AnexarCanc then
          begin
            XMLNFCe.Text := Buscas.FieldByName('canc_xml_nfce').AsString;
            xmlPathArq   := PathTemp + ANFCe.NotasFiscais.Items[0].NumID + '-canc.xml';
            XMLNFCe.SaveToFile(xmlPathArq);
            FilesAttach.Add(xmlPathArq);
            FilesToDel.Add(xmlPathArq);
            if MsgAdicional = '' then
              MsgAdicional := ' Contém NFC-e Cancelada';
          end;

          if AnexarPDF then
          begin
            ADANFe.Cancelada    := Buscas.FieldByName('situacao_nfce').AsString.Equals(sitCancelada);
            ANFCe.DANFE         := ADANFe;
            ANFCe.DANFE.ImprimeNomeFantasia                        := ConfImp.Impressao.ImprimeNomeFantasia;
            ANFCe.DANFE.ImprimeInfContr                            := ConfImp.Impressao.ImprimeInfContr;
            TACBrNFeDANFCEClass(ANFCe.DANFE).ImprimeQRCodeLateral  := ConfImp.Impressao.QRCodeLateral;
            TACBrNFeDANFCEClass(ANFCe.DANFE).ViaConsumidor         := True;
            TACBrNFeDANFCEClass(ANFCe.DANFE).ImprimeEmUmaLinha     := ConfImp.Impressao.ImprimeEmUmaLinha;
            TACBrNFeDANFCEClass(ANFCe.DANFE).ImprimeDescAcrescItem := ConfImp.Impressao.ImprimeDescAcrescItem;
            TACBrNFeDANFCEClass(ANFCe.DANFE).ImprimeTributos       := TpcnTributos(IfThen(ConfImp.Impressao.ImprimirTributos, 0, IfThen(ConfImp.Impressao.TributosSeparadamente, 1, 2)));

            ANFCe.NotasFiscais.ImprimirPDF;
            if FileExists(ANFCe.DANFE.ArquivoPDF) then
            begin
              FilesAttach.Add(ANFCe.DANFE.ArquivoPDF);
              FilesToDel.Add(ANFCe.DANFE.ArquivoPDF);
            end;
          end;

          CountNF := CountNF + 1;
        end;

        Buscas.Next;
      end;

      if FilesAttach.Count > 3 then
      begin
        FileTemp := ExtractFilePath(PathTemp) + 'ArquivosNFCe.zip';

        if CompactarVariosArquivos_dx(FilesAttach.Text, FileTemp) then
          if FileExists(FileTemp) then
          begin
            FilesToDel.Add(FileTemp);
            FilesAttach.Clear;
            FilesAttach.Add(FileTemp);
          end;
      end;

      try
        if CountNF > 0 then
        begin
          ANFCe.EnviarEmail(FAcoesAdicionais.Trim,
                            ConfNFCe.Email.Assunto + MsgAdicional,
                            ConfNFCe.Email.Mensagem,
                            nil,
                            FilesAttach);
          EmailEnviado := True;
          Result       := CountNF;
        end;
      except on E: Exception do
        begin
          FResp.MsgRetorno := 'Envio -> ' + e.Message;
          Exit;
        end;
      end;

    except on E: Exception do
      begin
        FResp.MsgRetorno := e.Message;
      end;
    end;

  finally
    Buscas.Close;
    if Trim(FResp.MsgRetorno) <> '' then
      FResp.MsgRetorno := 'EnviarEmailNFCe -> ' + FResp.MsgRetorno;
    FMensagemErro := FResp.MsgRetorno;

    if (FCodNFCe > 0) and (FResp.MsgRetorno <> '') and (not EmailEnviado) then
      AtualizarResultadoEnvioNFCe;

    if Cancelada then
    begin
      if xmlCancMail <> nil then
        FreeAndNil(xmlCancMail);
//      if FileExists(xmlPathArq) then
//        DeleteFile(xmlPathArq);
    end;

    if Assigned(Erros      ) then FreeAndNil(Erros);
    if Assigned(FilesAttach) then FreeAndNil(FilesAttach);
    if Assigned(XMLNFCe    ) then FreeAndNil(XMLNFCe);
    if Assigned(FilesToDel) then
    begin
      for I := 0 to FilesToDel.Count - 1 do
        if FileExists(FilesToDel[I]) then
          DeleteFile(PWideChar(FilesToDel[I]));

      FreeAndNil(FilesToDel);
    end;

    if ADANFe <> nil then
    if Assigned(ADANFe) then FreeAndNil(ADANFe);
    if ANFCe <> nil then
    if Assigned(ANFCe ) then FreeAndNil(ANFCe);
    if AMail <> nil then
    if Assigned(AMail ) then FreeAndNil(AMail);
    desconectar;
  end;
end;

function THwNFCe.EnviarNFCe(PeriodicoContigencia: Boolean): Integer;
var
  Lote           : Integer;
  NFCeEnviada    : Boolean;
  ConsultarAntes : Boolean;
  CodNFCeOriginal: Integer;
  HashNFCe       : string;
  nrec539        : string;
  chv539         : string;
  cStat_Serv     : Integer;
  doc_eletronico : TDoc_eletronico_class;
  resrescue      : RResposta;
begin
  Result := 0;
  if not conectar(False) then
    Exit;

  ClearResp;

  FResp.MsgRetorno := '';
  NFCeEnviada      := False;
  FMetodoWS        := mwAutorizacao;
  try
    try
      if FClientOrServer = pmUndefined then
        raise Exception.Create('ClientOrServer Undefined. Configure antes da chamada');

      ANFCe            := TACBrNFe.Create(nil);
      ANFCe.OnGerarLog := ANFCeGerarLog;
      ANFCe.OnTransmitError := ANFCeTransmitError;
      if FClientOrServer = pmUndefined then
        raise Exception.Create('ClientOrServer Undefined. Configure antes da chamada');

      if not ConfigurarACBr(ANFCe) then
        Exit;

      if not NFCeValida then
      begin
        FResp.MsgRetorno := FMensagemErro;
        Exit;
      end;

      Buscas.Close;
      Buscas.SQL.Text := 'select digval, tpamb, situacao_nfce, xml_nfce, cod_nfce_conting, cod_nfce_original, nfe_versao' +
                         ' from nfce' +
                         ' where cod_nfce = ' + IntToStr(FCodNFCe) +
                         ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      Buscas.Open;
      CodNFCeOriginal := Buscas.FieldByName('cod_nfce_original').AsInteger;

      if Buscas.IsEmpty then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' nao localizada');

      if Buscas.FieldByName('cod_nfce_conting').AsInteger > 0 then
      begin
        with Task.New do
        begin
          Task       := tsConsulta;
          CodigoNFCe := FCodNFCe;
          CodigoEmp  := FCodEmpresa;
        end;
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' não pode ser enviada, pois já foi gerada outra em contingência. Favor tentar Cancelar ou Inutilizar');
      end;

      if (Trim(Buscas.FieldByName('situacao_nfce').AsString) = sitAutorizada) or
         (Trim(Buscas.FieldByName('situacao_nfce').AsString) = sitCancelada) or
         (Trim(Buscas.FieldByName('situacao_nfce').AsString) = sitDenegada) then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' ' + Buscas.FieldByName('situacao_nfce').AsString);

      ConsultarAntes := False;
      ANFCe.NotasFiscais.Clear;
      if (Trim(Buscas.FieldByName('digval').AsString) <> '') then
      begin
        if (Trim(Buscas.FieldByName('situacao_nfce').AsString) <> sitRejeitada) then  // caso foi rejeitada o xml salvo não é valido, montar novamente
        begin
          ANFCe.NotasFiscais.LoadFromString(Buscas.FieldByName('xml_nfce').AsString);
          if ANFCe.NotasFiscais.Count = 0 then
            ANFCe.NotasFiscais.Clear
          else
            ConsultarAntes := True;
        end;
      end;
      if ANFCe.NotasFiscais.Count = 0 then
      begin
        if Buscas.FieldByName('nfe_versao').AsString.Trim = strVer400 then
        begin
          if not AddNFCeToACBr_v400(FCodNFCe, HashNFCe) then
          begin
            FResp.MsgRetorno := FMensagemErro;
            Exit;
          end;
        end
        else if not AddNFCeToACBr(FCodNFCe) then
        begin
          FResp.MsgRetorno := FMensagemErro;
          Exit;
        end;

        if Buscas.FieldByName('tpamb').AsString = '1'  then
          ANFCe.Configuracoes.WebServices.Ambiente := taProducao
        else
          ANFCe.Configuracoes.WebServices.Ambiente := taHomologacao;

        try
          ANFCe.NotasFiscais.GerarNFe;
        except on E: Exception do
          begin
            LogApp.Log('nfce_gerarnfe', ANFCe.NotasFiscais.Items[0].XMLOriginal);
            FResp.MsgRetorno := 'GerarNFe -> ' + e.Message;
            Exit;
          end;
        end;

        try
          ANFCe.NotasFiscais.Assinar;
        except on E: Exception do
          begin
            LogApp.Log('nfce_assinar', ANFCe.NotasFiscais.Items[0].XMLOriginal);
            FResp.MsgRetorno := 'Assinar -> ' + e.Message;
            Exit;
          end;
        end;

        try
          ANFCe.NotasFiscais.Validar;
        except on E: Exception do
          begin
            LogApp.Log('nfce_validar', ANFCe.NotasFiscais.Items[0].XMLOriginal);
            FResp.MsgRetorno := 'Validar -> ' + e.Message;
            Exit;
          end;
        end;

        doc_eletronico := TDoc_eletronico_class.Create;
        try
          {
          doc_eletronico.cod_empresa := FCodEmpresa;
          doc_eletronico.id_doc := 'NFCE-' + PadL(FCodNFCe, 11);
          doc_eletronico.doc.Text :=  ANFCe.NotasFiscais.Items[0].XMLOriginal;
          SqlExec(doc_eletronico.SQLMotor().SQLInsert);
          }

          Buscas.Close;
          Buscas.SQL.Text := Format('insert into DOC_ELETRONICO (SEQID, COD_EMPRESA, ID_DOC, DOC) values (0, %d, %s, :doc)',
                                    [FCodEmpresa, QuotedStr('NFCE-' + PadL(FCodNFCe, 11))]);
          Buscas.ParamByName('doc').AsString := ANFCe.NotasFiscais.Items[0].XMLOriginal;

          logs(Buscas.SQL.Text + sLineBreak + 'Parm doc: ' + Buscas.ParamByName('doc').AsString, Self.ClassName + '.Avulso_ExecSQL');

          Buscas.ExecSQL;

          logs_elapsed_time();

        finally
          doc_eletronico.Free;
        end;

        //gravar os  dados gerados no banco de dados
        Buscas.Close;
        Buscas.SQL.Text := 'update nfce set situacao_nfce = :situacao_nfce, xml_nfce = :xml_nfce, digval = :digval, dhemi = :dhemi, ativo = 1' + //, hashnfc = :hashnfc' +
          IfThen(ANFCe.NotasFiscais.Items[0].NFe.Ide.tpEmis = teContingencia,
                 ', cont_dhcont = :cont_dhcont, cont_xjust = :cont_xjust') +
          ' where cod_nfce = ' + IntToStr(FCodNFCe) +
          ' and cod_empresa = ' + IntToStr(FCodEmpresa);
        Buscas.ParamByName('situacao_nfce').AsString := sitEnviando;
        Buscas.ParamByName('xml_nfce').AsString      := ANFCe.NotasFiscais.Items[0].XMLOriginal;
        Buscas.ParamByName('digval').AsString        := Copy(ANFCe.NotasFiscais.Items[0].NFe.signature.DigestValue, 1, 28);
        Buscas.ParamByName('dhemi').AsDateTime       := ANFCe.NotasFiscais.Items[0].NFe.Ide.dEmi;
        //Buscas.ParamByName('hashnfc').AsString       := HashNFCe;
        //isso aqui caso fiquem nulas as datas e justificativas
        if ANFCe.NotasFiscais.Items[0].NFe.Ide.tpEmis = teContingencia then
        begin
          Buscas.ParamByName('cont_dhcont').AsDateTime := ANFCe.NotasFiscais.Items[0].NFe.Ide.dhCont;
          Buscas.ParamByName('cont_xjust').AsString    := ANFCe.NotasFiscais.Items[0].NFe.Ide.xJust;
        end;
        Buscas.ExecSQL;
        if Buscas.Transaction.InTransaction then
          Buscas.Transaction.Commit;
      end
      else // mudando para o ambiente que esa salvo no xml
        ANFCe.Configuracoes.WebServices.Ambiente := ANFCe.NotasFiscais.Items[0].NFe.Ide.tpAmb;

      if (ANFCe.NotasFiscais.Items[0].NFe.Ide.tpEmis = teNormal) or
       (ConfNFCe.Geral.TpEmis = 1) or (PeriodicoContigencia) or
       (ConfNFCe.Contingencia.TentarAutorizarMesmoContingenciaAtivada) then
      begin

        Buscas.Close;
        Buscas.SQL.Text := 'select COD from incrementa_codigo(' + IntToStr(FCodEmpresa) + ', ''NFCE_LOTE'')';
        Buscas.Open;
        Lote := Buscas.FieldByName('COD').AsInteger;
        if Buscas.Transaction.InTransaction then
          Buscas.Transaction.Commit;
        Buscas.Close;
        try
          ClearResp;

          if ConsultarAntes then // Caso o xml foi carregado anteriormente, verifica antes se a NFC ja existe na sefaz
          begin
            StatusServ.StartLog(tsConsulta, ANFCe.NotasFiscais.Items[0].NumID);
            try
              ANFCe.Consultar();
            finally
              StatusServ.Registrar();
            end;
            if not ANFCe.NotasFiscais.Items[0].Processada then // nota fiscal encontrada e processada, nao precisa enviar
              ConsultarAntes := False;
          end;

          if not ConsultarAntes then
          begin
            if not ConfNFCe.Validacoes.UsarStatusServico then
              cStat_Serv := 107
            else
              cStat_Serv := StatusServico;

            if cStat_Serv <> 107 then
              NFCeEnviada := False
            else
            begin
              StatusServ.StartLog(tsAutorizacao, ANFCe.NotasFiscais.Items[0].NumID);
              try
                //NFCeEnviada := ANFCe.WebServices.Envia(Lote, ConfNFCe.WebServices.EnvSincAssinc = 'S');
                NFCeEnviada := ANFCe.Enviar(Lote, False, ConfNFCe.WebServices.EnviarSincrono);
              finally
                StatusServ.Registrar();
              end;
            end;
          end;

          if not ANFCe.NotasFiscais.Items[0].Processada then
          begin
            NFCeEnviada := False;
            if ConfNFCe.WebServices.EnviarSincrono then //sincrono
            begin
              FResp.cStat      := ANFCe.WebServices.Enviar.cStat;
              FResp.xMotivo    := ANFCe.WebServices.Enviar.xMotivo;
              FResp.MsgRetorno := ANFCe.WebServices.Enviar.Msg;
            end
            else
            begin
              FResp.cStat      := ANFCe.WebServices.Retorno.cStat;
              FResp.xMotivo    := ANFCe.WebServices.Retorno.xMotivo;
              FResp.MsgRetorno := ANFCe.WebServices.Retorno.Msg;
            end;
            FResp.HashNFCe     := IfThen(FResp.cStat > 0, HashNFCe.Trim);
            FResp.MsgRetorno   := FResp.cStat.ToString + ' - ' + IfThen(FResp.MsgRetorno.Trim.IsEmpty, FUltimoLog, FResp.MsgRetorno);

            if FResp.cStat = 204 then // Duplicidade
            begin
              StatusServ.StartLog(tsConsulta, ANFCe.NotasFiscais.Items[0].NumID);
              try
                ANFCe.Consultar();
              finally
                StatusServ.Registrar();
              end;
            end
            else if FResp.cStat = 539 then // Duplicidade com divergencia na chave
            begin
              chv539  := FResp.xMotivo.Substring(FResp.xMotivo.IndexOf('[chNFe:') + 7,  44);
              nrec539 := FResp.xMotivo.Substring(FResp.xMotivo.IndexOf('[nRec:' ) + 6,  15);

              resrescue.cStat      := FResp.cStat;
              resrescue.xMotivo    := FResp.xMotivo;
              resrescue.MsgRetorno := FResp.MsgRetorno;
              resrescue.HashNFCe   := FResp.HashNFCe;

              try
                ClearResp;

                if OnlyNumber(nrec539) = nrec539 then
                begin
                  ANFCe.NotasFiscais.Clear;

                  StatusServ.StartLog(tsRetornoAutorizacao, nrec539);
                  try
                    ANFCe.WebServices.Retorno.Recibo := nrec539;
                    ANFCe.WebServices.Retorno.Executar;

                    if ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Count > 0 then
                    begin
                      FResp.cStat    := ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat;
                      FResp.verAplic := ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].verAplic;
                      FResp.chNFe    := ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].chDFe;
                      FResp.dhRecbto := ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].dhRecbto;
                      FResp.nProt    := ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].nProt;
                      FResp.digVal   := ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].digVal;
                      FResp.xMotivo  := ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
                      FResp.cMsg     := ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cMsg;
                      FResp.xMsg     := ANFCe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMsg;

                      FResp.MsgRetorno := FResp.xMotivo;

                    end;
                  finally
                    StatusServ.Registrar();
                  end;
                end;

                if FResp.digVal.IsEmpty and (OnlyNumber(chv539) = chv539) then
                begin
                  StatusServ.StartLog(tsConsulta, ANFCe.NotasFiscais.Items[0].NumID);
                  try
                    ANFCe.Consultar(chv539);

                    FResp.cStat    := ANFCe.WebServices.Consulta.protNFe.cStat;
                    FResp.verAplic := ANFCe.WebServices.Consulta.protNFe.verAplic;
                    FResp.chNFe    := ANFCe.WebServices.Consulta.protNFe.chDFe;
                    FResp.dhRecbto := ANFCe.WebServices.Consulta.protNFe.dhRecbto;
                    FResp.nProt    := ANFCe.WebServices.Consulta.protNFe.nProt;
                    FResp.digVal   := ANFCe.WebServices.Consulta.protNFe.digVal;
                    FResp.xMotivo  := ANFCe.WebServices.Consulta.protNFe.xMotivo;
                    FResp.cMsg     := ANFCe.WebServices.Consulta.protNFe.cMsg;
                    FResp.xMsg     := ANFCe.WebServices.Consulta.protNFe.xMsg;

                    FResp.MsgRetorno := FResp.xMotivo;

                  finally
                    StatusServ.Registrar();
                  end;
                end;

                if (not FResp.digVal.IsEmpty) and ResolverRejeicao539(FResp.digVal, FResp.XMLResp) then
                begin

                  ANFCe.NotasFiscais.Clear;
                  ANFCe.NotasFiscais.LoadFromString(FResp.XMLResp);
                  if ANFCe.NotasFiscais.Count > 0 then
                  begin
                    with ANFCe.NotasFiscais.Items[0].NFe do
                    begin
                      procNFe.cStat := FResp.cStat;
                      procNFe.tpAmb := Ide.tpAmb;
                      procNFe.verAplic := FResp.verAplic;
                      procNFe.chDFe := FResp.chNFe;
                      procNFe.dhRecbto := FResp.dhRecbto;
                      procNFe.nProt := FResp.nProt;
                      procNFe.digVal := FResp.digVal;
                      procNFe.xMotivo := FResp.xMotivo;
                      procNFe.cMsg := FResp.cMsg;
                      procNFe.xMsg := FResp.xMsg;
                    end;
                    FResp.XMLResp := ANFCe.NotasFiscais.Items[0].GerarXML;

                    if not ANFCe.NotasFiscais.Items[0].Processada then
                      Exit;
                  end
                  else
                    Exit;
                end
                else
                  Exit;
              finally
                if (ANFCe.NotasFiscais.Count = 0) or (not ANFCe.NotasFiscais.Items[0].Processada) then
                begin
                  FResp.cStat      := resrescue.cStat;
                  FResp.xMotivo    := resrescue.xMotivo;
                  FResp.MsgRetorno := resrescue.MsgRetorno;
                  FResp.HashNFCe   := resrescue.HashNFCe;
                end;
              end;
            end;
          end;

          if ANFCe.NotasFiscais.Items[0].Processada then
          begin
            ClearResp;

            FResp.cStat      := ANFCe.NotasFiscais.Items[0].NFe.procNFe.cStat;
            FResp.xMotivo    := ANFCe.NotasFiscais.Items[0].NFe.procNFe.xMotivo;
            FResp.nProt      := ANFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
            FResp.chNFe      := ANFCe.NotasFiscais.Items[0].NFe.procNFe.chDFe;
            FResp.digVal     := ANFCe.NotasFiscais.Items[0].NFe.procNFe.digVal;
            FResp.dhRecbto   := ANFCe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto;
            FResp.XMLResp    := ANFCe.NotasFiscais.Items[0].XMLOriginal;
            FResp.MsgRetorno := FResp.xMotivo;

            AtualizarResultadoEnvioNFCe;

            RegistradorAlertasDFeUtil.ResolverAlertas(ANFCe.NotasFiscais.Items[0].NFe.procNFe);

            NFCeEnviada := True;
            Result := 1;

            if Trim(FAcoesAdicionais) <> '' then
              case FResp.cStat of
                100, 120, 150:
                begin
                  if ClientOrServer = pmServer then
                    RegistraCentralDeAcoes(actEnviarEmail);
                end;
              end;
          end;
        except on E: Exception do
          begin
            FResp.MsgRetorno := 'Envio -> ' + e.Message;
            Exit;
          end;
        end;

      end
      //ver isso aqui se vai ser necessario, analisar e se for o caso remover
      else if ANFCe.NotasFiscais.Items[0].NFe.Ide.tpEmis = teOffLine then
      begin
        NFCeEnviada := False;// nao gravar retorno
        FResp.MsgRetorno := 'Gerada em contingencia';
        Result := 1; // retorno positivo, nota em contingencia e contingencia ativada
      end;

      if (ANFCe.NotasFiscais.Items[0].NFe.Ide.tpEmis = teOffLine) and
        (CodNFCeOriginal > 0) and (Result > 0) then
      begin
        with FTask.New do
        begin
          Task       := tsCancelamento;
          CodigoNFCe := CodNFCeOriginal;
          CodigoEmp  := FCodEmpresa;
        end;
      end;

    except on E: Exception do
      begin
        FResp.MsgRetorno := e.Message;
      end;
    end;

  finally
    if Trim(FResp.MsgRetorno) <> '' then
      FResp.MsgRetorno := 'EnviarNFCe -> ' + FResp.MsgRetorno;

    FMensagemErro := FResp.MsgRetorno;

    if (FResp.MsgRetorno <> '') and (not NFCeEnviada) then
      AtualizarResultadoEnvioNFCe;

    if ANFCe <> nil then
      FreeAndNil(ANFCe);
    if AMail <> nil then
      FreeAndNil(AMail);

//    if Assigned(TaskCanc) then
//    begin
//      TaskCanc.Run;
//      FreeAndNil(TaskCanc);
//    end;
    desconectar;
  end;
end;

function THwNFCe.ClientGerarContingencia: Integer;
var
  NewCOD_NFCE: Integer;
  NewGuidNFCE: string;
  GuidNFCE   : string;
  MsgRetorno : string;
  ContAltNFCe: Smallint;
  TpAmb      : string;
  ANumNF     : Integer;
  serie      : Integer;
  caixaId    : Integer;
  Anfe_versao: string;
  HashNFCe   : string;
begin
  Result     := 0;
  MsgRetorno := '';

  if not conectar(False) then
    Exit;

  try
    if not AcessoValido then
      Exit;

    try
      Buscas.Close;
      Buscas.SQL.Text := 'select cod_nfce, situacao_nfce, cod_nfce_conting, tpemis, num_nf, cont_alt, nfe_versao, serie, cod_emissor, guidt from nfce' +
        ' where cod_nfce = ' + IntToStr(FCodNFCe) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      Buscas.Open;

      if Buscas.IsEmpty then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' nao localizada');

      if Trim(Buscas.FieldByName('situacao_nfce').AsString) = sitAutorizada then
      begin
        Result := Buscas.FieldByName('cod_nfce').AsInteger;
        Exit;
      end;

      if Buscas.FieldByName('cod_nfce_conting').AsInteger > 0 then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' ja possui NF de contingencia ' + Buscas.FieldByName('cod_nfce_conting').AsString);
        
      if Trim(Buscas.FieldByName('tpemis').AsString) = '9' then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' já está em Contingência');

      ContAltNFCe := Buscas.FieldByName('cont_alt').AsInteger;
      ANumNF      := Buscas.FieldByName('num_nf').AsInteger;
      Anfe_versao := Buscas.FieldByName('nfe_versao').AsString;
      serie       := Buscas.FieldByName('serie').AsInteger;
      caixaId     := Buscas.FieldByName('cod_emissor').AsInteger;
      GuidNFCE    := Buscas.FieldByName('guidt').AsString;

      if ANumNF > 0 then
      begin
        QrAux.Close;
        QrAux.SQL.Text := 'select cod from incrementa_codigo(' +IntToStr(FCodEmpresa) + ', ''NFCE'')';
        QrAux.Open;
        NewCOD_NFCE := QrAux.FieldByName('COD').AsInteger;
        NewGuidNFCE := TGuid.NewGuid.ToString().Replace('{', '').Replace('}','').ToUpper().Substring(0, 36);
        if NewCOD_NFCE = 0 then
          raise Exception.Create('Numero de NF para contingencia não foi gerado');

        case IndexText(SqlScalar('select DADOS_OFFLINE from EMPDESVOLV where COD_EMPDES = 1').AsString, ['C', 'S']) of
          0 :
            serie := SqlScalar('select serie_nfce_off from NFC_EMISSOR where cod_emissor = %d and cod_empresa = %d', [caixaId, CodEmpresa]).AsInteger;
          1 :
            serie := SqlScalar('select serie_nfce from NFC_EMISSOR where cod_emissor = %d and cod_empresa = %d', [caixaId, CodEmpresa]).AsInteger;
        end;

        montarExecutarInsertSelect(
          'NFCE',
          'SELECT * FROM NFCE WHERE COD_NFCE = 0 AND COD_EMPRESA = 0',
          '|COD_NFCE|NUM_NF|TPEMIS|SERIE|SITUACAO_NFCE|CHAVE_NFCE||NPROT|CSTAT|XMOTIVO|' +
          '|DIGVAL|DHRECBTO|MSGRETORNO|XML_NFCE|CONT_ALT|COD_NFCE_CONTING|DHCONT|XJUST|COD_NFCE_ORIGINAL|GUIDT|',
          'COD_NFCE,COD_NFCE_ORIGINAL,TPEMIS,SERIE,GUIDT,GUID_NFCE_ORIGINAL',
          Format('%d, %d, ''9'', %d, ''%s'', ''%s''', [NewCOD_NFCE, FCodNFCe, serie, NewGuidNFCE, GuidNFCE]),
          'COD_NFCE = ' + IntToStr(FCodNFCe) + ' AND COD_EMPRESA = ' + IntToStr(FCodEmpresa)
        );

        montarExecutarInsertSelect(
          'NFCE_ITEM',
          'SELECT * FROM NFCE_ITEM WHERE COD_NFCE = 0 AND COD_EMPRESA = 0 AND SEQID = 0',
          '|COD_NFCE|GUIDT|',
          'COD_NFCE,GUID_NFCE',
          Format('%d, ''%s''', [NewCOD_NFCE, NewGuidNFCE]),
          'COD_NFCE = ' + IntToStr(FCodNFCe) + ' AND COD_EMPRESA = ' + IntToStr(FCodEmpresa)
        );

        montarExecutarInsertSelect(
          'NFCE_PAGAMENTO',
          'SELECT * FROM NFCE_PAGAMENTO WHERE COD_NFCE = 0 AND COD_EMPRESA = 0 AND SEQID = 0',
          '|COD_NFCE|GUIDT|',
          'COD_NFCE,GUID_NFCE',
          Format('%d, ''%s''', [NewCOD_NFCE, NewGuidNFCE]),
          'COD_NFCE = ' + IntToStr(FCodNFCe) + ' AND COD_EMPRESA = ' + IntToStr(FCodEmpresa)
        );

        montarExecutarInsertSelect(
          'NFCE_DEST',
          'SELECT * FROM NFCE_DEST WHERE COD_NFCE = 0 AND COD_EMPRESA = 0',
          '|COD_NFCE|GUIDT|',
          'COD_NFCE, GUID_NFCE',
          Format('%d, ''%s''', [NewCOD_NFCE, NewGuidNFCE]),
          'COD_NFCE = ' + IntToStr(FCodNFCe) + ' AND COD_EMPRESA = ' + IntToStr(FCodEmpresa)
        );

        montarExecutarInsertSelect(
          'NFCE_INFADIC',
          'SELECT * FROM NFCE_INFADIC WHERE COD_NFCE = 0 AND COD_EMPRESA = 0',
          '|COD_NFCE|GUIDT|',
          'COD_NFCE,GUID_NFCE',
          Format('%d, ''%s''', [NewCOD_NFCE, NewGuidNFCE]),
          'COD_NFCE = ' + IntToStr(FCodNFCe) + ' AND COD_EMPRESA = ' + IntToStr(FCodEmpresa)
        );
      end
      else
      begin
        SqlExec('update nfce set tpemis = ''9'' ' +
                ' where cod_nfce = %d and cod_empresa = %d and num_nf is null',
                [FCodNFCe, FCodEmpresa], Buscas);

        Buscas.Close;
        Buscas.SQL.Text := 'select cod_nfce, num_nf, tpemis, cont_alt from nfce' +
          ' where cod_nfce = ' + IntToStr(FCodNFCe) +
          ' and cod_empresa = ' + IntToStr(FCodEmpresa);
        Buscas.Open;
        if (Buscas.FieldByName('cod_nfce').AsInteger > 0) and (Buscas.FieldByName('num_nf').AsInteger > 0) then
          raise Exception.Create('NFC foi alterada por outro usuário. Processamento abortado. Tente novamente');

        if (Buscas.FieldByName('tpemis').AsString <> '9') then
          raise Exception.Create('Sistema não conseguir mudar a NFC para Contingência. Tente novamente');

        ContAltNFCe := ContAltNFCe + 1;
        NewCOD_NFCE := FCodNFCe;
        NewGuidNFCE := GuidNFCE;
      end;

      ANFCe            := TACBrNFe.Create(nil);
      ANFCe.OnGerarLog := ANFCeGerarLog;
      ANFCe.OnTransmitError := ANFCeTransmitError;

      if (ANumNF = 0) and (FCodNFCe = NewCOD_NFCE) then// se num_nf 0 e codigos igual no NFCEValida vai dar update, entao inc a variavel abaixo
        ContAltNFCe := ContAltNFCe + 1;

      if not ConfigurarACBr(ANFCe) then
      begin
        MsgRetorno := FMensagemErro;
        Exit;
      end;

      //aqui vai usar a justificativa automatica da contingencia
      ConfNFCe.SwitchJustificativaAuto;

      if not NFCeValida(NewCOD_NFCE, False, True) then
      begin
        MsgRetorno := FMensagemErro;
        Exit;
      end;

      if Anfe_versao.Trim = strVer400 then
      begin
        if not AddNFCeToACBr_v400(NewCOD_NFCE, HashNFCe) then
        begin
          MsgRetorno := FMensagemErro;
          Exit;
        end;
      end
      else
      if not AddNFCeToACBr(NewCOD_NFCE) then
      begin
        MsgRetorno := FMensagemErro;
        Exit;
      end;

      Buscas.Close;
      Buscas.SQL.Text := 'select * from nfce' +
        ' where cod_nfce = ' + IntToStr(NewCOD_NFCE) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      Buscas.Open;

      if Trim(Buscas.FieldByName('tpamb').AsString) <> '' then
        TpAmb := Trim(Buscas.FieldByName('tpamb').AsString)
      else
        TpAmb := ConfNFCe.WebServices.Ambiente;

      if TpAmb = '1' then
        ANFCe.Configuracoes.WebServices.Ambiente := taProducao
      else
        ANFCe.Configuracoes.WebServices.Ambiente := taHomologacao;

      try
        ANFCe.NotasFiscais.GerarNFe;
      except on E: Exception do
        begin
          MsgRetorno := 'GerarNFe ' + e.Message;
          raise Exception.Create(MsgRetorno);
        end;
      end;

      try
        ANFCe.NotasFiscais.Assinar;
      except on E: Exception do
        begin
          MsgRetorno := 'Assinar ' + e.Message;
          raise Exception.Create(MsgRetorno);
        end;
      end;

      try
        ANFCe.NotasFiscais.Validar;
      except on E: Exception do
        begin
          MsgRetorno := 'Validar ' + e.Message;
          raise Exception.Create(MsgRetorno);
        end;
      end;

      //gravar os dados gerados no banco de dados

      Buscas.Close;
      Buscas.SQL.Text := 'update nfce set situacao_nfce = :situacao_nfce, xml_nfce = :xml_nfce, digval = :digval, hashnfc = :hashnfc,' +
        ' tpamb = :tpamb, chave_nfce = :chave_nfce' +
        ' where cod_nfce = ' + IntToStr(NewCOD_NFCE) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      Buscas.ParamByName('situacao_nfce').AsString := sitEnviando;
      Buscas.ParamByName('xml_nfce').AsString      := ANFCe.NotasFiscais.Items[0].XMLOriginal;
      Buscas.ParamByName('tpamb').AsString         := TpAmb;
      Buscas.ParamByName('chave_nfce').AsString    := ANFCe.NotasFiscais.Items[0].NumID;
      Buscas.ParamByName('digval').AsString        := Copy(ANFCe.NotasFiscais.Items[0].NFe.signature.DigestValue, 1, 28);
      Buscas.ParamByName('hashnfc').AsString       := HashNFCe;

      Buscas.ExecSQL;

      if FCodNFCe = NewCOD_NFCE then
        ContAltNFCe := ContAltNFCe + 1;

      ANFCe.NotasFiscais.Clear;

      if FCodNFCe <> NewCOD_NFCE then
      begin
        {
        Buscas.Close;
        Buscas.SQL.Text := 'update nfce set cod_nfce_conting = ' + IntToStr(NewCOD_NFCE) +
          ' where cod_nfce = ' + IntToStr(FCodNFCe) +
          ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
          ' and cont_alt = ' + IntToStr(ContAltNFCe) +
          ' and cod_nfce_conting is null';
        Buscas.ExecSQL;
        }
        SqlExec('update transacao_cartao c set c.nrequisicao = %d' +
                ' where c.tpdocs = ''NFCE'' and c.nrequisicao = %d and c.cod_empresa = %d',
                [NewCOD_NFCE, FCodNFCe, FCodEmpresa]);

        SqlExec('update nfce set cod_nfce_conting = %d, guid_nfce_conting = %s, status = %s, ' +
                ' ped_origem_num = null, ped_origem_tip = null, ped_destino_num = null, ped_destino_tip = null' +
                ' where cod_nfce = %d and cod_empresa = %d and cont_alt = %d' +
                ' and cod_nfce_conting is null',
                [NewCOD_NFCE, NewGuidNFCE.QuotedString, stsACancelar.QuotedString, FCodNFCe, FCodEmpresa, ContAltNFCe], Buscas);

        Buscas.Close;
        Buscas.SQL.Text := 'select cod_nfce_conting from nfce' +
          ' where cod_nfce = ' + IntToStr(FCodNFCe) +
          ' and cod_empresa = ' + IntToStr(FCodEmpresa);
        Buscas.Open;

        if (Buscas.FieldByName('cod_nfce_conting').AsInteger = 0) or
          (Buscas.FieldByName('cod_nfce_conting').AsInteger <> NewCOD_NFCE) then
          raise Exception.Create('NF original foi alterada durante a contingencia. Favor verificar');
      end
      else
      begin
        Buscas.Close;
        Buscas.SQL.Text := 'select cod_nfce from nfce' +
          ' where cod_nfce = ' + IntToStr(FCodNFCe) +
          ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
          ' and cont_alt = ' + IntToStr(ContAltNFCe);
        Buscas.Open;
        if (Buscas.FieldByName('cod_nfce').AsInteger = 0) or
          (Buscas.FieldByName('cod_nfce').AsInteger <> NewCOD_NFCE) then
          raise Exception.Create('NF foi alterada durante a contingencia. Favor verificar');
      end;

      if Buscas.Transaction.InTransaction then
        Buscas.Transaction.Commit;

      Result := NewCOD_NFCE;

    except on E: Exception do
      begin
        MsgRetorno := E.Message;
        if Buscas.Transaction.InTransaction then
          Buscas.Transaction.Rollback;
        FMensagemErro := MsgRetorno;
      end;
    end;

  finally
    if MsgRetorno <> '' then
      FMensagemErro := 'Contingencia -> ' +MsgRetorno;
    if Buscas.Transaction.InTransaction then
      Buscas.Transaction.Rollback;

    if ANFCe <> nil then
      FreeAndNil(ANFCe);
    desconectar;
  end;
end;

function THwNFCe.ImprimirDANFE(TpImp: Integer): Integer;
var //tpImp = 1: NaoFiscal, 0 Normal
  ADANFeNormal: TACBrNFeDANFCeFortes;
  ADANFeFormA4: TACBrNFeDANFCeFortesA4;
  {
  ADANFeTerm  : TACBrNFeDANFeESCPOS;
  APosPrinter : TACBrPosPrinter;
  }
  I           : Integer;
  K           : Integer;
  FormatoA4   : Boolean;
  Resumido    : Boolean;
  ViaCon      : Boolean;
  ViaEst      : Boolean;
  ViaCan      : Boolean;
  NFCeCanc    : Boolean;
  FreeImpTerm : Boolean;
  FreeImpNorm : Boolean;
  FreeImpA4   : Boolean;
  Em2Vias     : Boolean;

  {
  procedure desativarPosPrinter;
  begin
    if Assigned(APosPrinter) then
      while APosPrinter.Ativo do
      begin
        APosPrinter.Desativar;
        if APosPrinter.Ativo then
          Sleep(100);
      end;
  end;
  }

begin
  Result := 0;
  FreeImpTerm := False;
  FreeImpNorm := False;
  FreeImpA4   := False;
  try
    try
      if FClientOrServer = pmUndefined then
        raise Exception.Create('ClientOrServer Undefined. Configure antes da chamada');

      ANFCe            := TACBrNFe.Create(nil);
      ANFCe.OnGerarLog := ANFCeGerarLog;
      ANFCe.OnTransmitError := ANFCeTransmitError;

      if not ConfigurarACBr(ANFCe) then
        Exit;

      Buscas.Close;
      Buscas.SQL.Text := 'select situacao_nfce, tpemis, xml_nfce, canc_xml_nfce from nfce' +
        ' where cod_nfce = ' + IntToStr(FCodNFCe) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      Buscas.Open;

      if (Buscas.FieldByName('situacao_nfce').AsString = sitInutilizada) then
      begin
        Result := ImprimirInutilizacao;
        Exit;
      end;

      NFCeCanc  := (Buscas.FieldByName('situacao_nfce').AsString = sitCancelada);
      ViaCan    := (Pos('|viacanc|', FAcoesAdicionais) > 0) and NFCeCanc;
      FormatoA4 := (Pos('|a4|', FAcoesAdicionais) > 0);
      Resumido  := (Pos('|res|', FAcoesAdicionais) > 0);
      ViaCon    := (Pos('|viacon|', FAcoesAdicionais) > 0);
      ViaEst    := (Pos('|viaest|', FAcoesAdicionais) > 0);

      if not ViaEst then
        ViaCon := True;
      if FormatoA4 then
      begin
        ViaCon := True;
        ViaEst := False;
      end;
      Em2Vias := ViaCon and ViaEst and (not ViaCan);

      FreeImpTerm := False;
      FreeImpNorm := False;
      FreeImpA4   := False;

      if ConfImp = nil then
        ConfImp := THwConfImp.create;
      ConfImp.lerConfig;

      if (TpImp = 1) then // and (not FormatoA4)
      begin
        var params := NewStringList(FAcoesAdicionais.Replace('|', ';'), ';');
        var helperNaoFiscal := THelperPosPrinter.Create;
        try
          Result := helperNaoFiscal
            .PrintNFCe(Buscas.FieldByName('xml_nfce').AsString,
                       Buscas.FieldByName('canc_xml_nfce').AsString,
                       params.Values['confName'],
                       params.Values['nfceConfName'],
                       Format('|%s|%s', [IfThen(NFCeCanc, 'nfcecanc'), FAcoesAdicionais]));
        finally
          FMensagemErro := helperNaoFiscal.LastError;
          helperNaoFiscal.Free();
        end;
        Exit;

        {
        APosPrinter                            := TACBrPosPrinter.Create(nil);
        APosPrinter.Modelo                     := TACBrPosPrinterModelo(ConfImp.PosPrinter.Modelo);
        APosPrinter.Porta                      := ConfImp.PosPrinter.Porta;
        APosPrinter.ColunasFonteNormal         := ConfImp.PosPrinter.Colunas;
        APosPrinter.EspacoEntreLinhas          := ConfImp.PosPrinter.EspacoEntreLinhas;
        APosPrinter.LinhasBuffer               := ConfImp.PosPrinter.LinhasBuffer;
        APosPrinter.ControlePorta              := ConfImp.PosPrinter.ControlePorta;
        APosPrinter.TraduzirTags               := ConfImp.PosPrinter.TraduzirTags;
        APosPrinter.IgnorarTags                := ConfImp.PosPrinter.IgnorarTags;
        APosPrinter.ArqLOG                     := ConfImp.PosPrinter.ArqLOG;
        APosPrinter.PaginaDeCodigo             := TACBrPosPaginaCodigo(ConfImp.PosPrinter.PaginaDeCodigo);
        APosPrinter.ConfigBarras.LarguraLinha  := ConfImp.PosPrinter.Barras_LarguraLinha;
        APosPrinter.ConfigBarras.Altura        := ConfImp.PosPrinter.Barras_Altura;
        APosPrinter.ConfigBarras.MostrarCodigo := ConfImp.PosPrinter.Barras_MostrarCodigo;
        APosPrinter.ConfigQRCode.Tipo          := ConfImp.PosPrinter.QRCode_Tipo;
        APosPrinter.ConfigQRCode.LarguraModulo := ConfImp.PosPrinter.QRCode_LarguraModulo;
        APosPrinter.ConfigQRCode.ErrorLevel    := ConfImp.PosPrinter.QRCode_ErrorLevel;
        APosPrinter.ConfigLogo.KeyCode1        := ConfImp.PosPrinter.Logo_KeyCode1;
        APosPrinter.ConfigLogo.KeyCode2        := ConfImp.PosPrinter.Logo_KeyCode2;
        APosPrinter.ConfigLogo.FatorX          := ConfImp.PosPrinter.Logo_FatorX;
        APosPrinter.ConfigLogo.FatorY          := ConfImp.PosPrinter.Logo_FatorY;
        APosPrinter.Device.ParamsString        := ConfImp.PosPrinter.Device_ParamsString;
        APosPrinter.CortaPapel                 := False;//ConfImp.Impressao.CortarPapelAposImpressao;
        APosPrinter.LinhasEntreCupons          := ConfImp.Impressao.QtdeLinhasAvancoPapelAposNFC;

        ADANFeTerm                      := TACBrNFeDANFeESCPOS.Create(nil);
        ADANFeTerm.PosPrinter           := APosPrinter;
        ADANFeTerm.ImprimeLogoLateral   := ConfImp.Impressao.ImprimeLogoLateral;
        ADANFeTerm.Site                 := '';
        ANFCe.DANFE := ADANFeTerm;
        FreeImpTerm := True;
        }
      end
      else
      begin
        if (FormatoA4) then
        begin
          ADANFeFormA4     := TACBrNFeDANFCeFortesA4.Create(nil);
          ANFCe.DANFE      := ADANFeFormA4;
          ANFCe.DANFE.Logo := ConfNFCe.Arquivos.LogoEmpresa;
          FreeImpA4        := True;
        end
        else
        begin
          ADANFeNormal                    := TACBrNFeDANFCeFortes.Create(nil);
          ADANFeNormal.TamanhoLogoHeight  := ConfImp.Impressao.Logo_Height;
          ADANFeNormal.TamanhoLogoWidth   := ConfImp.Impressao.Logo_Width;
          ADANFeNormal.MargemInferior     := ConfImp.Impressao.MargemInferior;
          ADANFeNormal.MargemSuperior     := ConfImp.Impressao.MargemSuperior;
          ADANFeNormal.MargemEsquerda     := ConfImp.Impressao.MargemEsquerda;
          ADANFeNormal.MargemDireita      := ConfImp.Impressao.MargemDireita;
          ANFCe.DANFE                     := ADANFeNormal;
          ANFCe.DANFE.Logo                := ConfNFCe.Arquivos.LogoEmpresa;
          FreeImpNorm                     := True;

          var newList := NewStringList(RLPrinter.Printers.Text.Replace('|?', ''));
//          LogApp.Log('printlog', '1 = ' + ConfNFCe.PrintSemPrev);
//          LogApp.Log('printlog', '2 = ' + newList.Text);
//          LogApp.Log('printlog', '3 = ' + newList.IndexOf(ConfNFCe.PrintSemPrev).ToString);
          if ConfNFCe.PrintSemPrev <> '' then
            //if RLPrinter.Printers.IndexOf(ConfNFCe.PrintSemPrev) > -1 then
            if newList.IndexOf(ConfNFCe.PrintSemPrev.Replace('|?', '')) > -1 then
            begin
              ADANFeNormal.Impressora := ConfNFCe.PrintSemPrev.Replace('|?', '');
              ADANFeNormal.MostraPreview := False;
            end;

        end;
      end;
      ANFCe.DANFE.Sistema               := 'Hw NFC-e';
      ANFCe.DANFE.TipoDANFE             := tiNFCe;
      ANFCe.DANFE.Cancelada             := NFCeCanc;
      //ANFCe.DANFE.ImprimirItens         := not Resumido;
      ANFCe.DANFE.ImprimeNomeFantasia   := ConfImp.Impressao.ImprimeNomeFantasia;
      ANFCe.DANFE.ImprimeInfContr       := ConfImp.Impressao.ImprimeInfContr;
      TACBrNFeDANFCEClass(ANFCe.DANFE).ImprimeQRCodeLateral  := ConfImp.Impressao.QRCodeLateral;
      TACBrNFeDANFCEClass(ANFCe.DANFE).ViaConsumidor         := ViaCon;
      TACBrNFeDANFCEClass(ANFCe.DANFE).ImprimeEmUmaLinha     := ConfImp.Impressao.ImprimeEmUmaLinha;
      TACBrNFeDANFCEClass(ANFCe.DANFE).ImprimeDescAcrescItem := ConfImp.Impressao.ImprimeDescAcrescItem;
      TACBrNFeDANFCEClass(ANFCe.DANFE).ImprimeTributos       := TpcnTributos(IfThen(not ConfImp.Impressao.ImprimirTributos, 0, IfThen(ConfImp.Impressao.TributosSeparadamente, 1, 2)));
      //ANFCe.DANFE.TributosSeparadamente := ConfImp.Impressao.TributosSeparadamente;

      ANFCe.EventoNFe.Evento.Clear;
      ANFCe.NotasFiscais.Clear;
      ANFCe.NotasFiscais.LoadFromString(Buscas.FieldByName('xml_nfce').AsString);
      if NFCeCanc then
        ANFCe.EventoNFe.LerXMLFromString(Buscas.FieldByName('canc_xml_nfce').AsString);

      {
      if TpImp = 1 then
      begin
        desativarPosPrinter;

        APosPrinter.Porta := ConfImp.PosPrinter.Porta;

        if not APosPrinter.Ativo then
          APosPrinter.Ativar;
        if ViaCan then
          ADANFeTerm.ImprimirDANFECancelado()
        else
        begin
          if Resumido then
            ANFCe.NotasFiscais.ImprimirResumido
          else
            ANFCe.NotasFiscais.Imprimir;

          if Em2Vias then
          begin
            TACBrNFeDANFCEClass(ANFCe.DANFE).ViaConsumidor := False;
            if Resumido then
              ANFCe.NotasFiscais.ImprimirResumido
            else
              ANFCe.NotasFiscais.Imprimir;

            if ConfImp.Impressao.CortarPapelAposImpressao then
              APosPrinter.CortarPapel(True);
          end
          else if ConfImp.Impressao.CortarPapelAposImpressao then
            APosPrinter.CortarPapel(True);
        end;

        if ConfImp.Impressao.AbrirGaveta then
          if ConfImp.Impressao.AbrirGavetaEspecifica > 0 then
            APosPrinter.AbrirGaveta(ConfImp.Impressao.AbrirGavetaEspecifica)
          else
            APosPrinter.AbrirGaveta();

        desativarPosPrinter;

      end
      else
      }
      if FormatoA4 then
      begin
        if Resumido then
          ANFCe.DANFE.ImprimirDANFEResumido()
        else
          ANFCe.DANFE.ImprimirDANFE();
      end
      else
      begin
        if Resumido then
          TACBrNFeDANFCeFortes(ANFCe.DANFE).ImprimirDANFEResumido()
        else
          ANFCe.NotasFiscais.Imprimir;
      end;

      if not ViaCan then
        AbrirGaveta(FAcoesAdicionais.Replace('|', ';'));

      Result := 1;
    except on E: Exception do
      begin
        FMensagemErro := e.Message;
      end;
    end;

  finally
    {
    if FreeImpTerm then
    begin
      FreeAndNil(APosPrinter);
      FreeAndNil(ADANFeTerm);
    end;
    }
    if FreeImpA4 then
      FreeAndNil(ADANFeFormA4);
    if FreeImpNorm then
      FreeAndNil(ADANFeNormal);
    if ANFCe <> nil then
      FreeAndNil(ANFCe);
    desconectar;
  end;
end;

function THwNFCe.ImprimirInutilizacao: Integer;
var
  ADANFeInut : TACBrNFeDANFeRL;
begin
  Result := 0;
  try
    try
      if FClientOrServer = pmUndefined then
        raise Exception.Create('ClientOrServer Undefined. Configure antes da chamada');

      Buscas.Close;
      Buscas.SQL.Text := 'select situacao_nfce, inut_xml_nfce from nfce' +
        ' where cod_nfce = ' + IntToStr(FCodNFCe) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      Buscas.Open;

      ANFCe := TACBrNFe.Create(nil);
      ANFCe.OnGerarLog := ANFCeGerarLog;
      ANFCe.OnTransmitError := ANFCeTransmitError;

      ADANFeInut := TACBrNFeDANFeRL.Create(nil);
      ANFCe.DANFE := ADANFeInut;

      ANFCe.InutNFe.LerXMLFromString(Buscas.FieldByName('inut_xml_nfce').AsString);
      ANFCe.ImprimirInutilizacao;

      Result := 1;
    except on E: Exception do
      begin
        FMensagemErro := e.Message;
      end;
    end;

  finally
    if ANFCe <> nil then
      FreeAndNil(ANFCe);
    if ADANFeInut <> nil then
      FreeAndNil(ADANFeInut);
    desconectar;
  end;
end;

function THwNFCe.InutilizarNFCe: Integer;
var
  NFCeInutilizada: Boolean;
  Justificativa  : string;
  vOK            : Boolean;
  FXML           : string;
  ChaveNCe       : AnsiString;
  FNumNF, FSerie : Integer;
  FDHEmi         : TDateTime;
  I, J           : Integer;
begin
  Result := 0;
  if not conectar(False) then
    Exit;

  ClearResp;

  FResp.MsgRetorno := '';
  NFCeInutilizada := False;
  FMetodoWS       := mwInutilizacao;
  try
    try
      if FClientOrServer = pmUndefined then
        raise Exception.Create('ClientOrServer Undefined. Configure antes da chamada');

      ANFCe            := TACBrNFe.Create(nil);
      ANFCe.OnGerarLog := ANFCeGerarLog;
      ANFCe.OnTransmitError := ANFCeTransmitError;
      AMail            := TACBrMail.Create(nil);
      ANFCe.MAIL       := TACBrMail(AMail);

      if not ConfigurarACBr(ANFCe) then
        Exit;

      Buscas.Close;
      Buscas.SQL.Text := 'select situacao_nfce, num_nf, serie, inut_xjust, xml_nfce, chave_nfce, dhemi, cod_nfce_conting from nfce' +
        ' where cod_nfce = ' + IntToStr(FCodNFCe) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      Buscas.Open;

      if Buscas.IsEmpty then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' nao localizada');

      if (Trim(Buscas.FieldByName('situacao_nfce').AsString) = sitAutorizada) then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' está Autorizada');

      if (Trim(Buscas.FieldByName('situacao_nfce').AsString) = sitCancelada) then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' está Cancelada');

      if (Trim(Buscas.FieldByName('situacao_nfce').AsString) = sitDenegada) then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' está Denegada');

      FNumNF   := Buscas.FieldByName('num_nf').AsInteger;
      FSerie   := Buscas.FieldByName('serie').AsInteger;
      ChaveNCe := Buscas.FieldByName('chave_nfce').AsString;
      FXML     := Buscas.FieldByName('xml_nfce').AsString;
      FDHEmi   := Buscas.FieldByName('dhemi').AsDateTime;

      if (FNumNF = 0) then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' não possui número. Ela pode ser excluída');

      Justificativa := Trim(Buscas.FieldByName('inut_xjust').AsString);
      if (Buscas.FieldByName('cod_nfce_conting').AsInteger > 0) and (Justificativa.Trim.IsEmpty) then
      begin
        Justificativa := 'CANCELAMENTO POR SUBSTITUIÇÃO DE NFC EMITIDA EM CONTINGÊNCIA';
        SqlExec('update nfce set inut_xjust = %s where cod_nfce = %d and cod_empresa = %d and coalesce(inut_xjust,'''') = '''' ',
                [Justificativa.Substring(0,255).QuotedString, FCodNFCe, FCodEmpresa]);
      end;

      if Length(Justificativa) < 15 then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' com justificativa menor que 15 caracteres');

      if Length(Justificativa) > 255 then
        raise Exception.Create('NFCe codigo ' + IntToStr(FCodNFCe) + ' emp ' + IntToStr(FCodEmpresa) + ' com justificativa maior que 255 caracteres');

      if Trim(ChaveNCe) = '' then
      begin
        if not String.IsNullOrWhiteSpace(FXML) then
        begin
          ANFCe.NotasFiscais.LoadFromString(FXML);
          if ANFCe.NotasFiscais.Count > 0 then
            ChaveNCe := ANFCe.NotasFiscais.Items[0].NumID;
        end;

        if Trim(ChaveNCe) = '' then
        begin
          ChaveNCe := GerarChaveAcesso(UFtoCUF(ConfNFCe.WebServices.UF), FDHEmi, ConfNFCe.Emitente.CNPJCPF, FSerie, FNumNF, 1, FCodNFCe, 65).Substring(0, 44);
          //if GerarChave(ChaveNCe, UFtoCUF(ConfNFCe.WebServices.UF), FCodNFCe, 65, FSerie, FNumNF, 1, FDHEmi, ConfNFCe.Emitente.CNPJCPF) then
            //ChaveNCe := Copy(ChaveNCe, 4, 44);
        end;

        if Trim(ChaveNCe) <> '' then
        begin
          Buscas.Close;
          Buscas.SQL.Text := 'update nfce set chave_nfce = ' + QuotedStr(ChaveNCe) +
            ' where cod_nfce = ' + IntToStr(FCodNFCe) +
            ' and cod_empresa = ' + IntToStr(FCodEmpresa);
          Buscas.ExecSQL;
          if Buscas.Transaction.InTransaction then
            Buscas.Transaction.Commit;
        end;
      end;

      ANFCe.NotasFiscais.Clear;
      ANFCe.Configuracoes.WebServices.Ambiente := StrToTpAmb(vOK, ConfNFCe.WebServices.Ambiente);

      try
        StatusServ.StartLog(tsInutilizacao, Format('%s 65 %d %d %s', [ConfNFCe.Emitente.CNPJCPF, FSerie, FNumNF, Justificativa]));
        try
          ANFCe.WebServices.Inutiliza(ConfNFCe.Emitente.CNPJCPF, Justificativa, YearOf(date), 65, FSerie, FNumNF, FNumNF);
        finally
          StatusServ.Registrar();
        end;

        FResp.cStat        := ANFCe.WebServices.Inutilizacao.cStat;
        FResp.nProt        := ANFCe.WebServices.Inutilizacao.Protocolo;
        FResp.xMotivo      := ANFCe.WebServices.Inutilizacao.xMotivo;
        FResp.dhRecbto     := ANFCe.WebServices.Inutilizacao.dhRecbto;
        FResp.XMLResp      := ANFCe.WebServices.Inutilizacao.XML_ProcInutNFe;
        FResp.MsgRetorno   := FResp.xMotivo;

        if FResp.cStat = 241 then
        begin
          ANFCe.NotasFiscais.LoadFromString(FXML);
          StatusServ.StartLog(tsConsulta, ANFCe.NotasFiscais.Items[0].NumID);
          try
            if ANFCe.NotasFiscais.Count = 0 then
              ANFCe.Consultar(ChaveNCe)
            else
              ANFCe.Consultar();
          finally
            StatusServ.Registrar();
          end;

          for I := 0 to ANFCe.WebServices.Consulta.procEventoNFe.Count - 1 do
            for J := 0 to ANFCe.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Count - 1 do
              if (ANFCe.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Items[J].RetInfEvento.tpEvento = teCancelamento) then
                with ANFCe.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Items[J] do
                  case RetInfEvento.cStat of
                    135, 136, 155:
                      begin
                        ClearResp;
                        // aqui indica que a NFCe foi cancelada, entao irá atualizar a situação da NFCe, portém vai retornar false  para apresentar erro ao usuário
                        FResp.cStat    := RetInfEvento.cStat;
                        FResp.xMotivo  := RetInfEvento.xMotivo;
                        FResp.nProt    := RetInfEvento.nProt;
                        FResp.dhRecbto := RetInfEvento.dhRegEvento;
                        FResp.XMLResp  := RetInfEvento.XML;

                        raise Exception.Create('NFC-e está cancelada não permite ser Inutilizada');
                      end;
                  end;

          if ANFCe.NotasFiscais.Count > 0 then
            if ANFCe.NotasFiscais.Items[0].Processada then
            begin
              ClearResp;
              // aqui indica que a NFCe foi cancelada, entao irá atualizar a situação da NFCe, portém vai retornar false  para apresentar erro ao usuário
              FResp.cStat    := ANFCe.NotasFiscais.Items[0].NFe.procNFe.cStat;
              FResp.xMotivo  := ANFCe.NotasFiscais.Items[0].NFe.procNFe.xMotivo;
              FResp.nProt    := ANFCe.NotasFiscais.Items[0].NFe.procNFe.nProt;
              FResp.chNFe    := ANFCe.NotasFiscais.Items[0].NFe.procNFe.chDFe;
              FResp.digVal   := ANFCe.NotasFiscais.Items[0].NFe.procNFe.digVal;
              FResp.dhRecbto := ANFCe.NotasFiscais.Items[0].NFe.procNFe.dhRecbto;
              FResp.XMLResp  := ANFCe.NotasFiscais.Items[0].XMLOriginal;

              raise Exception.Create('NFC-e está Processada "' + FResp.xMotivo + '" não permite ser Inutilizada');
            end;
        end;

        case FResp.cStat of
          206 :
            begin
              ClearResp;

              NFCeInutilizada  := True;
              FResp.cStat      := 102;
              FResp.nProt      := '';
              FResp.xMotivo    := 'Inutilizacao de numero homologado';
              FResp.dhRecbto   := ANFCe.WebServices.Consulta.dhRecbto;
              FResp.XMLResp    := '';
              FResp.MsgRetorno := FResp.xMotivo;
            end;
          102, 563: NFCeInutilizada := True;
          else      NFCeInutilizada := False;
        end;

        if NFCeInutilizada then
        begin
          AtualizarResultadoEnvioNFCe;

          Result := 1;
        end;

      except on E: Exception do
        begin
          FResp.MsgRetorno := 'Envio -> ' + e.Message;
          Exit;
        end;
      end;

    except on E: Exception do
      begin
        FResp.MsgRetorno := e.Message;
      end;
    end;

  finally
    if Trim(FResp.MsgRetorno) <> '' then
      FResp.MsgRetorno := 'InutilizarNFCe -> ' + FResp.MsgRetorno;
    FMensagemErro := FResp.MsgRetorno;

    if (FResp.MsgRetorno <> '') and (not NFCeInutilizada) then
      AtualizarResultadoEnvioNFCe;

    if ANFCe <> nil then
      FreeAndNil(ANFCe);
    if AMail <> nil then
      FreeAndNil(AMail);
    desconectar;
  end;
end;

procedure THwNFCe.montarExecutarInsertSelect(Tabela, Select, CamposBloqueados,
  CamposChaveAdicionais, ValoresChavesEadcionais, CondicaoWhere: string);
var
  Campos      : string;
  CamposSelect: string;
  SqlComand   : string;
  I           : Integer;
begin
  Buscas.Close;
  Buscas.SQL.Text := Select;
  Buscas.Open;
  Campos := '';
  CamposBloqueados := CamposBloqueados.ToUpper() + '|' + CamposChaveAdicionais.Replace(',', '|').Replace(' ', '').ToUpper()  + '|';
  for I := 0 to Buscas.FieldCount - 1 do
    if Pos('|' + Buscas.Fields[I].FieldName + '|', CamposBloqueados) = 0 then
      Campos := Campos + Buscas.Fields[I].FieldName + ',';

  Delete(Campos, Length(Campos), 1);
  CamposSelect := ValoresChavesEadcionais + ',' + Campos;
  Campos := CamposChaveAdicionais + ',' + Campos;

  SqlComand := 'insert into ' + Tabela + ' ( ' + Campos + ')' +
    ' select ' + CamposSelect + ' from ' + Tabela + ' where ' + CondicaoWhere;

  SqlExec(SqlComand, Buscas);
//  Buscas.Close;
//  Buscas.SQL.Text := SqlComand;
//  Buscas.ExecSQL;
end;

function THwNFCe.ClientImprimirDANFe(TpImp: Integer): Integer;
//TpImp = 1: impressora nao fiscal, senao normal
begin
  Result := 0;
  try
    if not AcessoValido then
      Exit;

    try
      if (UsaServidorImpressao) and (TpImp = 1) then
        Result := RegistraCentralDeAcoes(actImprimir)
      else
        Result := ImprimirDANFE(TpImp);

    except on E: Exception do
      begin
        FMensagemErro := e.Message;
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNFCe.ClientImprimirInutilizacao: Integer;
begin
  Result := 0;
  try
    if not AcessoValido then
      Exit;

    try
      Result := ImprimirInutilizacao;

    except on E: Exception do
      begin
        FMensagemErro := e.Message;
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNFCe.ClientInutilizar: Integer;
var
  client: TEnvioNFCe;//Thread
  SeqID : Integer;
begin
  Result := 0;
  try
    if not AcessoValido then
      Exit;

    try
      if UsaServidorAutorizacao then
      begin
        SeqID := RegistraCentralDeAcoes(actInutilizar);
        Result := SeqID;
      end
      else
        Result := InutilizarNFCe;
      {
      else if not FUseThread then
      begin
        Result := InutilizarNFCe;
      end
      else
      begin
        client                := TEnvioNFCe.Create(True);
        client.CodEmpresa     := CodEmpresa;
        client.CodEmissor     := CodEmissor;
        client.Token          := Ftoken;
        client.CodNFC         := CodNFCe;
        client.Acao           := actInutilizar;
        client.ClientOrServer := FClientOrServer;
        client.Resume;

        Result := 1;
      end;
      }
    except on E: Exception do
      begin
        FMensagemErro := e.Message;
      end;
    end;

  finally
    desconectar;
  end;
end;

function THwNFCe.NFCeValida(NewCOD_NFCE: Integer;
  AutoCommit, Contingencia: Boolean): Boolean;
var
  Serie          : Integer;
  CodNFTestar    : Integer;
  TpEmissAndTpAmb: string;
  ACNF          : Integer;
begin
  // ver a mensagem de erro como vai ficar, igual ao configuracabr:?:?:
  //aqui vai gerar o num da nfce validar os dados da NFC-e
  try
    if Contingencia then
    begin
      if ConfNFCe.Contingencia.dataHora <= 0 then
        raise Exception.Create('Data de entrada em contingência não informada. Verifique');

      if ConfNFCe.Contingencia.dataHora >= Now then
        raise Exception.Create('Data de entrada em contingência configurada maior que a data atual. Verifique');

      if (Length(ConfNFCe.Contingencia.Justificativa) < 15) or
        (Length(Trim(ConfNFCe.Contingencia.Justificativa)) > 256) then
        raise Exception.Create('Justificativa de entrada em contingência configurada deve ter de 15 a 256 caracteres. Verifique');
    end;

    //efetuar os testes basicos aqui
    if NewCOD_NFCE > 0 then
      CodNFTestar := NewCOD_NFCE
    else
      CodNFTestar := FCodNFCe;

    //gravar o numero da nf de acordo com a serie somente depois da nfce valida
    Buscas.Close;
    Buscas.SQL.Text := 'select num_nf, tpemis, serie, status from nfce' +
      ' where cod_nfce = ' + IntToStr(CodNFTestar) +
      ' and cod_empresa = ' + IntToStr(FCodEmpresa);
    Buscas.Open;

    if (Trim(Buscas.FieldByName('status').AsString) <> stsFechada) and
       (Trim(Buscas.FieldByName('status').AsString) <> stsACancelar) then
      raise Exception.Create('Status da NFC "' + Trim(Buscas.FieldByName('status').AsString) +
      '" difere de "Fechada". Proceda com o fechamento primeiro');

    if Buscas.FieldByName('num_nf').AsInteger <= 0 then
    begin
      Serie := Buscas.FieldByName('serie').AsInteger;
      Randomize;
      ACNF := 0;
      while ACNF = 0 do
        ACNF := Random(99999999);

      if Contingencia then
        TpEmissAndTpAmb := ', cont_dhcont = :dhcont, cont_xjust = :xjust, tpamb = ' + QuotedStr(ConfNFCe.WebServices.Ambiente)
      else
        TpEmissAndTpAmb := ', tpemis = ' + IntToStr(ConfNFCe.Geral.TpEmis) +
                           ', tpamb = ' + QuotedStr(ConfNFCe.WebServices.Ambiente);

      Buscas.Close;
      Buscas.SQL.Text := 'update nfce set num_nf = ' +
        '(SELECT COD FROM incrementa_codigo( ' + IntToStr(FCodEmpresa) + ', ' + QuotedStr('NFCE_SERIE_' + IntToStr(Serie)) +
        '))' + ', cnf = ' + ACNF.ToString + TpEmissAndTpAmb +
        ' where cod_nfce = ' + IntToStr(CodNFTestar) +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa);
      if Contingencia then
      begin
        Buscas.ParamByName('dhcont').AsDateTime := ConfNFCe.Contingencia.dataHora;
        Buscas.ParamByName('xjust').AsString    := ConfNFCe.Contingencia.Justificativa;
      end;
      Buscas.ExecSQL;
      if AutoCommit then
        if Buscas.Transaction.InTransaction then
          Buscas.Transaction.Commit;
    end;
    Result := True;

  except on E: Exception do
    begin
      Result := False;
      FMensagemErro := 'NFCeValida -> ' + e.Message;
    end;
  end;
end;

function THwNFCe.RegistraCentralDeAcoes(Acao: string): Integer;
var
  SeqID: Integer;
  StrID: string;

  function GetStrID: string;
  var
    I: Integer;
  begin
    Result := '';
    if FCodNFCe > 0 then
      Result := IntToStr(FCodNFCe)
    else if Length(FArrayNFCe) > 0 then
      for I := Low(FArrayNFCe) to High(FArrayNFCe) do
        Result := Result + IfThen(not Result.IsEmpty, ',') + IntToStr(FArrayNFCe[I]);
  end;

begin
  Result := 0;
  try
    //if not FStandAlone then
    begin
      Buscas.Close;
      Buscas.SQL.Text := 'select seqid, acao from NFC_CENTRAL_ACOES' +
        ' where tipo = ''NFCE''' +
        ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
        ' and id = ' + QuotedStr(IntToStr(FCodNFCe)) +
        //' and acao = ' + QuotedStr(Acao) +
        ' and data_prcss is null' +
        ' and abortar is null';
      Buscas.Open;

      if (Buscas.FieldByName('seqid').AsInteger > 0) and
        (Buscas.FieldByName('acao').AsString = Acao) then
        SeqID :=  Buscas.FieldByName('seqid').AsInteger
      else if (Buscas.FieldByName('seqid').AsInteger > 0) then
      begin
        SeqID := Buscas.FieldByName('seqid').AsInteger * (-1);
        FMensagemErro := 'Já existe uma ação pendente de processamento: ' + Buscas.FieldByName('acao').AsString;
      end
      else
      begin
        Buscas.Close;
        Buscas.SQL.Text := 'select (gen_id(GEN_NFC_CENTRAL_ACOES, ' + IntToStr(FCodEmpresa) + ')) seqid from rdb$database';
        Buscas.Open;
        SeqID := Buscas.FieldByName('seqid').AsInteger;
        if Buscas.Transaction.InTransaction then
          Buscas.Transaction.Commit;

       registraErro('count2 ' + IntToStr(Length(FArrayNFCe)));

        StrID := GetStrID;

        registraErro('StrID ' + StrID);

        Buscas.Close;
        Buscas.SQL.Text := Format('insert into NFC_CENTRAL_ACOES' +
                                  ' ( seqid, cod_empresa, tipo, acao, %s, cod_emiss_client, adicional)' +
                                  ' values' +
                                  ' ( :seqid, :cod_empresa, :tipo, :acao, :id, :cod_emiss_client, :adicional)',
                                  [IfThen(StrID.Length > 64, 'id_adicional', 'id')]);
        Buscas.ParamByName('seqid').AsInteger            := SeqID;
        Buscas.ParamByName('cod_empresa').AsInteger      := FCodEmpresa;
        Buscas.ParamByName('tipo').AsString              := 'NFCE';
        Buscas.ParamByName('id').AsString                := StrID;
        Buscas.ParamByName('acao').AsString              := Acao;
        Buscas.ParamByName('cod_emiss_client').AsInteger := FCodEmissor;
        if Trim(FAcoesAdicionais) <> '' then
          Buscas.ParamByName('adicional').AsString       := Copy(FAcoesAdicionais, 1, 64)
        else
          Buscas.ParamByName('adicional').Value          := Null;
        Buscas.ExecSQL;
        if Buscas.Transaction.InTransaction then
          Buscas.Transaction.Commit;
      end;
      Buscas.Close;
      Result := SeqID;
    end
  except on E: Exception do
    begin
      FMensagemErro := e.Message;
    end;
  end;
end;

function THwNFCe.ResolverRejeicao539(digVal: string;
  var xmlNFCe: string): Boolean;
var
  docs: TDoc_eletronicos_class;
  doc : TDoc_eletronico_class;
  dfe : TACBrNFe;
  nfce: TNfce_class;
begin
  Result := False;
  docs   := TDoc_eletronicos_class.Create;
  dfe    := TACBrNFe.Create(nil);
  nfce   := TNfce_class.Create;

  try
    docs.CopyFrom(TDoc_eletronico_class, SqlOpen('select * from doc_eletronico where id_doc = ''NFCE-%s'' and cod_empresa = %d',
                                                 [PadL(FCodNFCe, 11), FCodEmpresa]));
    for doc in docs do
    begin
      dfe.NotasFiscais.Clear;
      dfe.NotasFiscais.LoadFromString(doc.doc.Text);
      if (dfe.NotasFiscais.Count > 0) and
         (dfe.NotasFiscais.Items[0].NFe.signature.DigestValue.ToLower.Equals(digVal.ToLower)) then
      with dfe.NotasFiscais.Items[0].NFe do
      begin
        nfce.SetValuesFrom(SqlOpen('select num_nf, serie, cnf from nfce' +
                                   ' where cod_nfce = %d and cod_empresa = %d',
                                   [FCodNFCe, FCodEmpresa], Buscas), True);
        if (nfce.num_nf = Ide.nNF) and
           (nfce.serie = Ide.serie) and
           (nfce.cnf = Ide.cNF) then
        begin
          QrAux.Close;
          QrAux.SQL.Text := Format('update nfce set xml_nfce = :xml_nfce,' +
                                   ' situacao_nfce = %s,  ' +
                                   ' digval = %s,' +
                                   ' dhemi = %s,' +
                                   ' data_lanc = %s,' +
                                   ' chave_nfce = %s,' +
                                   IfThen(Ide.tpEmis = teContingencia,
                                          Format('cont_dhcont = %s, cont_xjust = %s,', [date_fb(Ide.dhCont), Ide.xJust.Replace('''', '''''').QuotedString])) +
                                   ' ativo = 1' +
                                   ' where cod_nfce = %d and cod_empresa = %d',
                                   [sitEnviando.QuotedString, digVal.QuotedString, date_fb(Ide.dEmi), date_fb(DateOf(Ide.dEmi)),
                                    OnlyNumber(dfe.NotasFiscais.Items[0].NumID).QuotedString ,
                                    FCodNFCe, FCodEmpresa]);
          QrAux.ParamByName('xml_nfce').AsString := doc.doc.Text;
          QrAux.ExecSQL;
          QrAux.Transaction.Commit;

          xmlNFCe := doc.doc.Text;

          Result  := True;
        end;

      end;
    end;

  finally
    docs.Clear;
    docs.Free;
    dfe.Free;
    nfce.Free;
  end;
end;

function THwNFCe.ServEnviarPendenciasNFCe(Emissor: Integer): Integer;
var
  NotasContingencia: TStrings;
  I, ACountAutorizadas: Integer;
  P: RPeriodicoEnvioContingencia;
begin
  Result := 0;
  P := ConfNFCe.PeriodicoCont;
  try
    if not conectar(False) then
      Exit;

    if not AcessoValido then
      Exit;

    try
      NotasContingencia := TStringList.Create;
      NotasContingencia.Clear;
      // Notas em contingencia com situação em branco, Em Processamento e Enviando
      SqlOpen(
        'select cod_nfce from nfce where nfce.num_nf > 0' +
        ' and nfce.cod_empresa = %d' +
        ' and nfce.tpemis = ''9''' +
        ' and nfce.digval <> ''''' +
        ' and nfce.status = %s' +
        ' and coalesce(nfce.situacao_nfce, %s) in (%s, %s, %s)' +
        IfThen(Emissor > 0, Format(' and nfce.cod_emissor = %d', [Emissor])) +
        ' order by nfce.dhemi',
        [FCodEmpresa, stsFechada.QuotedString, sitVazio.QuotedString,
         sitVazio.QuotedString, sitEmProcessamento.QuotedString, sitEnviando.QuotedString], Buscas).First;

      while not Buscas.Eof do
      begin
        NotasContingencia.Add(IntToStr(Buscas.FieldByName('cod_nfce').AsInteger));
        Buscas.Next;
      end;
      Buscas.Close;

      //Notas em emissao normal com situação Enviando e Em Processamento
      SqlOpen(
        'select cod_nfce from nfce where nfce.num_nf > 0' +
        ' and nfce.cod_empresa = %d' +
        ' and nfce.tpemis = ''1''' +
        ' and nfce.digval <> ''''' +
        ' and nfce.status = %s' +
        ' and coalesce(nfce.situacao_nfce, %s) in (%s, %s)' +
        IfThen(Emissor > 0, Format(' and nfce.cod_emissor = %d', [Emissor])) +
        ' order by nfce.dhemi',
        [FCodEmpresa, stsFechada.QuotedString, sitVazio.QuotedString,
         sitEmProcessamento.QuotedString, sitEnviando.QuotedString], Buscas).First;

      while not Buscas.Eof do
      begin
        NotasContingencia.Add(IntToStr(Buscas.FieldByName('cod_nfce').AsInteger));
        Buscas.Next;
      end;
      Buscas.Close;

      if (NotasContingencia.Count > 0) and (not (P.cStat_StatusServico in [107])) then
        if not ConfNFCe.Validacoes.UsarStatusServico then
          p.cStat_StatusServico := 107
        else
          p.cStat_StatusServico := StatusServico;

      ACountAutorizadas := 0;
      if P.cStat_StatusServico in [107] then
        for I := 0 to NotasContingencia.Count - 1 do
        begin
          FCodNFCe := StrToIntDef(NotasContingencia[I], 0);
          if EnviarNFCe(True) <= 0 then
            P.cStat_StatusServico := StatusServico
          else
            ACountAutorizadas := ACountAutorizadas + 1;
          if not (P.cStat_StatusServico in [107]) then
            Break;
        end;

      Result := ACountAutorizadas;

    except on E: Exception do
      begin
        P.cStat_StatusServico := 0;
        FMensagemErro := e.Message;
      end;
    end;

  finally
    desconectar;
    P.UtltimaConsulta := Now;
    ConfNFCe.PeriodicoCont := P;
  end;
end;

function THwNFCe.ServiceLessEnviarContingenciasNFCe: Integer;
var
  StrLog: string;
  token_id: Integer;
begin
  token_id := 0;
  TryStrToInt(Ftoken, token_id);

  try

    try
      StrLog := 'Conectando';
      if not conectar(False) then
        Exit;

      StrLog := StrLog + sLineBreak + 'Validando acesso';

      //O sistema passou a enviar o codigo do emissor, sendo assim o Service less nunca vai parar por token invalido
      if token_id > 0 then
        Ftoken :=  SqlOpen('select token from NFC_EMISSOR' +
                           ' where cod_empresa = %d and cod_emissor = %d',
                           [FCodEmpresa, token_id], Buscas).FieldByName('token').AsString.Trim;

      if not AcessoValido then
      begin
        Result := 0;
        Exit;
      end
      else
        Result := 1;

      StrLog := StrLog + sLineBreak + 'Consultando servico';
      //procurando um servico de autorizacao ativo, o servico usa o campo abaixo pra dizer que esta rodando
      with SqlOpen('select DH_LAST_ACTIVE, (select current_ts from sp_current_ts(%d)) datahora from NFC_EMISSOR' +
                   ' where cod_empresa = %d and client_or_server = ''S''',
                   [FCodEmpresa, FCodEmpresa]) do
      begin
        StrLog := StrLog + sLineBreak + 'Validando servico ativo';
        QrAux.First;
        while not QrAux.Eof do
        begin

          if not FieldByName('DH_LAST_ACTIVE').IsNull then
            if FieldByName('DH_LAST_ACTIVE').AsDateTime >=
              (FieldByName('datahora').AsDateTime - EncodeTime(0, 10, 0, 0)) then
            begin
              FMensagemErro := Format('Já existe um servidor de autorização em execução nos ultimos 10 minutos %s',
                                      [FormatDateTime('dd/MM/yyyy hh:mm:ss', FieldByName('DH_LAST_ACTIVE').AsDateTime)]);
              Result := 0;
              Exit;
            end;
          QrAux.Next;
        end;
      end;

      StrLog := StrLog + sLineBreak + 'Atualizando data SericeLess';
      with SqlExec('update NFC_EMISSOR set DH_LAST_ACTIVE = (select current_ts from sp_current_ts(%d))' +
                   ' where cod_emissor = %d and cod_empresa = %d',
                   [FCodEmpresa, FCodEmissor, FCodEmpresa]).Transaction do
        if InTransaction then
          Commit;

      StrLog := StrLog + sLineBreak + 'Verificando contingencias';
      ServEnviarPendenciasNFCe;

    finally
      desconectar;
    end;
  except on E: Exception do
    begin
      StrLog := StrLog + sLineBreak + E.Message;
      raise Exception.Create(StrLog);
    end;
  end;
end;

function THwNFCe.ServImprimirDANFe: Integer;
begin
  Result := 0;
  try
    if not conectar(False) then
      Exit;

    try

      Result := ImprimirDANFE(1);

    except on E: Exception do
      begin
        FMensagemErro := e.Message;
      end;
    end;

  finally
    desconectar;
  end;
end;

procedure THwNFCe.SetAcoesAdicionais(const Value: string);
begin
  FAcoesAdicionais := Value;
end;

procedure THwNFCe.SetArrayNFCe(ArrayInt: array of Integer);
var
  I: Integer;
begin
  SetLength(FArrayNFCe, Length(ArrayInt));

  for I := Low(ArrayInt) to High(ArrayInt) do
    FArrayNFCe[I] := ArrayInt[I];
end;

procedure THwNFCe.SetCodNFCe(const Value: Integer);
begin
  FCodNFCe := Value;
end;

procedure THwNFCe.Settoken(const Value: string);
begin
  Ftoken := Value;
end;

function THwNFCe.StatusServico: Integer;
var
  AStatus: TACBrNFe;
  cStat: Integer;
begin
  Result := 0;
  cStat := 0;
  AStatus := TACBrNFe.Create(nil);
  try
    AStatus.OnGerarLog := ANFCeGerarLog;
    AStatus.OnTransmitError := ANFCeTransmitError;
    try
      if not ConfigurarACBr(AStatus) then
        Exit;
      StatusServ.StartLog(tsStsatusServico,'');
      try
        AStatus.WebServices.StatusServico.Executar;
      finally
        StatusServ.Registrar();
      end;
      cStat := AStatus.WebServices.StatusServico.cStat;
    except
    end;
  finally
    FreeAndNil(AStatus);
    Result := cStat;
  end;
end;

{ TEnvioNFCe }

procedure TEnvioNFCe.CancelarNFCe;
var
  nfce: THwNFCe;
  Msg: string;
begin
  inherited;
  nfce := THwNFCe.create;
  try
    nfce.CodEmpresa      := FCodEmpresa;
    nfce.CodEmissor      := FCodEmissor;
    nfce.token           := FToken;
    if FCodNFC > 0 then
      nfce.CodNFCe       := FCodNFC
    else
      nfce.CodNFCe       := StrToIntDef(Trim(FID), 0);
    nfce.ClientOrServer  := FClientOrServer;
    nfce.AcoesAdicionais := FAcoesAdicionais;

    nfce.CancelarNFCe;

    Msg := nfce.MensagemErro;

    nfce.Task.Run;

    FinalizarCentralDeAcoes(nfce.Buscas, Msg);
  finally
    FreeAndNil(nfce);
  end;
end;

procedure TEnvioNFCe.EnviarContingenciasNFCe;
var
  nfce: THwNFCe;
  P   : RPeriodicoEnvioContingencia;
begin
  inherited;
  nfce := THwNFCe.create;
  try
    nfce.CodEmpresa      := FCodEmpresa;
    nfce.CodEmissor      := FCodEmissor;
    nfce.token           := FToken;
    nfce.CodNFCe         := 0;
    nfce.ClientOrServer  := FClientOrServer;
    nfce.AcoesAdicionais := FAcoesAdicionais;

    nfce.ServEnviarPendenciasNFCe;

    nfce.Task.Run;

  finally
    P                      := ConfNFCe.PeriodicoCont;
    P.IdThreadResponsavel  := 0;
    ConfNFCe.PeriodicoCont := P;

    FreeAndNil(nfce);
  end;
end;

procedure TEnvioNFCe.EnviarEmailNFCe;
var
  nfce: THwNFCe;
begin
  inherited;
  nfce := THwNFCe.create;
  try
    nfce.CodEmpresa      := FCodEmpresa;
    nfce.CodEmissor      := FCodEmissor;
    nfce.token           := FToken;
    if FCodNFC > 0 then
      nfce.CodNFCe       := FCodNFC
    else
      nfce.CodNFCe       := StrToIntDef(Trim(FID), 0);
    nfce.ClientOrServer  := FClientOrServer;
    nfce.AcoesAdicionais := FAcoesAdicionais;
    nfce.SetArrayNFCe(FArrayNFCe);

    nfce.EnviarEmailNFCe;

    FinalizarCentralDeAcoes(nfce.Buscas, nfce.MensagemErro);
  finally
    FreeAndNil(nfce);
  end;
end;

procedure TEnvioNFCe.EnviarNFCe;
var
  nfce: THwNFCe;
  Msg: string;
  ArrayInt : array of Integer;
  StrID: string;
  IntID: Integer;
begin
  inherited;
  Msg := '';
  nfce := THwNFCe.create;
  try
    nfce.CodEmpresa      := FCodEmpresa;
    nfce.CodEmissor      := FCodEmissor;
    nfce.token           := FToken;
    if FCodNFC > 0 then
      nfce.CodNFCe       := FCodNFC
    else
      nfce.CodNFCe       := StrToIntDef(Trim(FID), 0);
    nfce.ClientOrServer  := FClientOrServer;
    nfce.AcoesAdicionais := FAcoesAdicionais;

    SetLength(ArrayInt, 0);
    for StrID in ID.Split([',']) do
      if TryStrToInt(StrID, IntID) then
        if (IntID > 0) and (IntID <> nfce.CodNFCe) then
        begin
          SetLength(ArrayInt, Length(ArrayInt) + 1);
          ArrayInt[High(ArrayInt)] := IntID;
        end;

    if (nfce.CodNFCe = 0) and (Length(ArrayInt) > 1) then
    begin
      for IntID := Low(ArrayInt) to High(ArrayInt) do
      begin
        nfce.CodNFCe := ArrayInt[IntID];
        nfce.EnviarNFCe;
        if not nfce.MensagemErro.Trim.IsEmpty then
          Msg := Msg + IfThen(not Msg.IsEmpty, sLineBreak) + nfce.MensagemErro;
      end;
    end
    else
    begin
      if nfce.EnviarNFCe > 0 then                    // Envio da NFCe
        if (nfce.ClientOrServer = pmClient) then     // Client entao é standalone
          if  Trim(nfce.AcoesAdicionais) <> '' then  // Email de envio no parametro
            nfce.EnviarEmailNFCe;                    // Envio de Email

      Msg := nfce.MensagemErro;
    end;

    nfce.Task.Run;

    FinalizarCentralDeAcoes(nfce.Buscas, Msg);
  finally
    FreeAndNil(nfce);
  end;
end;

procedure TEnvioNFCe.Execute;
var
  IndexOf: Integer;
begin
  inherited;
  if ConfNFCe <> nil then
    if ConfNFCe.FilaThread <> nil then
      ConfNFCe.FilaThread.Add(IntToStr(Self.ThreadID));
  try

    if FAcao = actAutorizar then
      EnviarNFCe
    else if FAcao = actCancelar then
      CancelarNFCe
    else if FAcao = actInutilizar then
      InutilizarNFCe
    else if FAcao = actEnviarEmail then
      EnviarEmailNFCe
    else if FAcao = actAutorizarCont then
      EnviarContingenciasNFCe;

  finally
    if ConfNFCe <> nil then
      if ConfNFCe.FilaThread <> nil then
      begin
        IndexOf := ConfNFCe.FilaThread.IndexOf(IntToStr(Self.ThreadID));
        if IndexOf > -1 then
          ConfNFCe.FilaThread.Delete(IndexOf);
      end;
  end;
end;

procedure TEnvioNFCe.InutilizarNFCe;
var
  nfce: THwNFCe;
begin
  inherited;
  nfce := THwNFCe.create;
  try
    nfce.CodEmpresa      := FCodEmpresa;
    nfce.CodEmissor      := FCodEmissor;
    nfce.token           := FToken;
    if FCodNFC > 0 then
      nfce.CodNFCe       := FCodNFC
    else
      nfce.CodNFCe       := StrToIntDef(Trim(FID), 0);
    nfce.ClientOrServer  := FClientOrServer;
    nfce.AcoesAdicionais := FAcoesAdicionais;

    nfce.InutilizarNFCe;

    FinalizarCentralDeAcoes(nfce.Buscas, nfce.MensagemErro);
  finally
    FreeAndNil(nfce);
  end;
end;

{ TConfig }

constructor THwConfNFCe.Create;
begin
  inherited;
  FCodmpresa        := 0;
  FMaxThreadsAtivas := 10;
  if FEmail.Mensagem = nil then
    FEmail.Mensagem := TStringList.Create;
  FPeriodicoCont.IdThreadResponsavel   := 0;
  FPeriodicoCont.UtltimaConsulta       := Now - StrToTime('01:00:00');
  FPeriodicoCont.cStat_StatusServico   := 0;
end;

destructor THwConfNFCe.Destroy;
begin
  if FEmail.Mensagem <> nil then
    FreeAndNil(FEmail.Mensagem);
  inherited;
end;

function THwConfNFCe.LerConfiguracoes(CodigoEmpresa, CodigoEmissor: Integer;
  buscas: TIBQuery; IdToken: Integer): Boolean;
var
  Utils: TServiceUtils;
  Aconfs: TConfig_sistema_classList;
  Aconf: TConfig_sistema_class;
  I: Integer;
  Sect: string;
begin
  try
    Utils := TServiceUtils.create('');
    try
      Utils.LerConfig;
      FMaxThreadsAtivas      := Utils.Conf.ThreadsAtivasNFCe;
      FSalvarLogNFC          := Utils.Conf.SalvarLogNFCe;
//      FSalvarLogCentralAcoes := Utils.Conf.SalvarLogCentralAcoes;
      FSalvarLogCentralAcoes := True;
    finally
      FreeAndNil(Utils);
    end;
  except
  end;

  try
    FCodmpresa := CodigoEmpresa;
    buscas.Close;
    buscas.SQL.Text := 'select n.*, e.email_emp from NFCE_CONFIG n' +
      ' left join empresa e on e.cod_empresa = n.cod_empresa' +
      ' where n.cod_empresa = ' + IntToStr(FCodmpresa);
    buscas.Open;

    if IdToken = 1 then
    begin
      FGeral.IdCSC := Trim(buscas.FieldByName('CSC_ID1').AsString);
      FGeral.CSC   := Trim(buscas.FieldByName('CSC_TOKEN1').AsString);
    end
    else
    begin
      FGeral.IdCSC := Trim(buscas.FieldByName('CSC_ID2').AsString);
      FGeral.CSC   := Trim(buscas.FieldByName('CSC_TOKEN2').AsString);
    end;
    FGeral.TpEmis                          := buscas.FieldByName('TPEMIS').AsInteger;
    FWebServices.EnvSincAssinc             := Trim(buscas.FieldByName('WS_SINC_ASSINC').AsString);
    FContingencia.JustificativaAuto        := buscas.FieldByName('XJUST_AUTO').AsString;
    FContingencia.JustificativaAuto        := IfThen(not FContingencia.JustificativaAuto.Trim.IsEmpty, FContingencia.JustificativaAuto, msgJustContingencia);

    //if buscas.FieldByName('USAR_CONF_NFE').AsString = 'N' then
    begin
      FCertificado.NumeroSerie    := Trim(buscas.FieldByName('CERT_NUM_SERIE').AsString);
      FCertificado.DadosPFX       := Trim(buscas.FieldByName('CERT_DADOSPFX').AsString);
      FCertificado.ArquivoPFX     := Trim(buscas.FieldByName('CERT_ARQUIVOPFX').AsString);
      FCertificado.Senha          := Trim(buscas.FieldByName('CERT_SENHA').AsAnsiString);

      FWebServices.UF             := Trim(buscas.FieldByName('WS_UF').AsString);
      FWebServices.Ambiente       := Trim(buscas.FieldByName('WS_TBAMB').AsString);
      FWebServices.ProxyHost      := Trim(buscas.FieldByName('WS_PROXY_HOST').AsString);
      FWebServices.ProxyPort      := Trim(buscas.FieldByName('WS_PROXY_PORT').AsString);
      FWebServices.ProxyUser      := Trim(buscas.FieldByName('WS_PROXY_USER').AsString);
      FWebServices.ProxyPass      := Trim(buscas.FieldByName('WS_PROXY_PASS').AsString);
      FWebServices.Tentativas     := buscas.FieldByName('WS_TENTATIVAS').AsInteger;
      FWebServices.Aguardar       := buscas.FieldByName('WS_AGUARDAR').AsInteger * 1000;
      FWebServices.Intervalo      := buscas.FieldByName('WS_INTERVALO').AsInteger * 1000;
      FWebServices.TimeOut        := buscas.FieldByName('WS_TIMEOUT').AsInteger * 1000;
      FWebServices.Visualizar     := buscas.FieldByName('WS_VISUALIZAR').AsString = 'S';
      FWebServices.SSLLib         := buscas.FieldByName('WS_LIB_SSL').AsInteger;//0: Capicom, 1: OpenSSL; 2: WinCrypt

      FArquivos.PathSalvar        := Trim(buscas.FieldByName('ARQ_PATH_SALVAR').AsString);
      FArquivos.PathSchemas       := Trim(buscas.FieldByName('ARQ_PATH_SCHEMA').AsString);
      FArquivos.LogoEmpresa       := Trim(buscas.FieldByName('ARQ_LOGO_EMP').AsString);

      FEmail.Host                 := buscas.FieldByName('EMAIL_SMPT_HOST').AsString;
      FEmail.Usuario              := buscas.FieldByName('EMAIL_USERNAME').AsString;
      FEmail.DeUsuario            := buscas.FieldByName('EMAIL_EMP').AsString;
      FEmail.Senha                := buscas.FieldByName('EMAIL_PASSWORD').AsString;
      FEmail.Porta                := buscas.FieldByName('EMAIL_SMTP_PORTA').AsString;
      FEmail.Assunto              := buscas.FieldByName('EMAIL_ASSUNTO').AsString;
      FEmail.UsarSSL              := buscas.FieldByName('EMAIL_USA_SSL').AsString = 'S';
      FEmail.Mensagem.Text        := buscas.FieldByName('EMAIL_MENSAGEM').AsString;

      FContingencia.dataHora      := buscas.FieldByName('DHCONT').AsDateTime;
      FContingencia.Justificativa := Trim(buscas.FieldByName('XJUST').AsString);
    end;
    {
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select NFE_NUMSERIE_CERT, WEBSERV_UF, WEBSERV_AMBIENTE, NFE_LOGOMARCA,' +
        ' NFE_LOGPATH, SMTP_EMP, PORTA_SMTP, LOGIN_EMP, EMAIL_SENHA, EMAIL_USASSL, ASSUNTO_NFE,' +
        ' NFE_XJUST, NFE_DHCONT, WEBSERV_VISUALIZAR, MENSAGEM_NFE' +
        ' from empresa' +
        ' where cod_empresa = ' + IntToStr(FCodmpresa);
      buscas.Open;
      
      FCertificado.NumeroSerie    := Trim(buscas.FieldByName('nfe_numserie_cert').AsString);
      FCertificado.ArquivoPFX     := '';
      FCertificado.Senha          := '';

      FWebServices.UF             := Trim(buscas.FieldByName('webserv_uf').AsString);
      FWebServices.Ambiente       := Trim(buscas.FieldByName('webserv_ambiente').AsString);
      FWebServices.ProxyHost      := '';
      FWebServices.ProxyPort      := '';
      FWebServices.ProxyUser      := '';
      FWebServices.ProxyPass      := '';
      FWebServices.Tentativas     := 5;
      FWebServices.Aguardar       := 0;
      FWebServices.Intervalo      := 1000;
      FWebServices.TimeOut        := 5000;
      FWebServices.Visualizar     := buscas.FieldByName('webserv_visualizar').AsString = 'S';

      FArquivos.PathSalvar        := Trim(buscas.FieldByName('nfe_logpath').AsString);
      FArquivos.PathSchemas       := '';
      FArquivos.LogoEmpresa       := Trim(buscas.FieldByName('nfe_logomarca').AsString);

      FEmail.Host                 := buscas.FieldByName('SMTP_EMP').AsString;
      FEmail.Usuario              := buscas.FieldByName('LOGIN_EMP').AsString;
      FEmail.Senha                := buscas.FieldByName('EMAIL_SENHA').AsString;
      FEmail.Porta                := buscas.FieldByName('PORTA_SMTP').AsString;
      FEmail.Assunto              := buscas.FieldByName('ASSUNTO_NFE').AsString;
      FEmail.UsarSSL              := buscas.FieldByName('EMAIL_USASSL').AsString = 'S';
      FEmail.Mensagem.Text        := buscas.FieldByName('MENSAGEM_NFE').AsString;

      FContingencia.dataHora      := buscas.FieldByName('NFE_DHCONT').AsDateTime;
      FContingencia.Justificativa := buscas.FieldByName('NFE_XJUST').AsString;

      if Copy(FWebServices.Ambiente, 1, 1) = 'P' then
        FWebServices.Ambiente := '1'
      else
        FWebServices.Ambiente := '2';
    end;
    }
    if FWebServices.TimeOut < 5000 then
      FWebServices.TimeOut := 5000;

    buscas.Close;
    buscas.SQL.Text := Format('select LIB_SSL, LIB_SSLCRYPTLIB, LIB_SSLHTTPLIB, LIB_SSLXMLSIGNLIB from nfc_emissor' +
                              ' where cod_emissor = %d and cod_empresa = %d', [CodigoEmissor, CodigoEmpresa]);
    buscas.Open;
    with FLibSSLDFe do
    begin
      SSLLib        := buscas.FieldByName('LIB_SSL').AsInteger;
      SSLCryptLib   := buscas.FieldByName('LIB_SSLCRYPTLIB').AsInteger;
      SSLHttpLib    := buscas.FieldByName('LIB_SSLHTTPLIB').AsInteger;
      SSLXmlSignLib := buscas.FieldByName('LIB_SSLXMLSIGNLIB').AsInteger;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select CGC_EMP, IE_EMP, NOME_EMP, FANTASIA_EMP, TELEFONE_EMP,' +
      ' CEP_EMP, ENDRECO_EMP, NUMERO_END, COMPLEMENTO_EMP, BAIRRO_EMP, CIDADE_EMP,' +
      ' WEBSERV_UF, IBGE_COD_CIDADE, REGIME, CNAE_FISCAL, IM_EMP' +
      ' from empresa' +
      ' where cod_empresa = ' + IntToStr(FCodmpresa);
    buscas.Open;

    FEmitente.CNPJCPF   := Trim(buscas.FieldByName('CGC_EMP').AsString);
    FEmitente.IE        := Trim(buscas.FieldByName('IE_EMP').AsString);
    FEmitente.Nome      := Trim(buscas.FieldByName('NOME_EMP').AsString);
    FEmitente.Fant      := Trim(buscas.FieldByName('FANTASIA_EMP').AsString);
    FEmitente.Fone      := Trim(buscas.FieldByName('TELEFONE_EMP').AsString);
    FEmitente.CEP       := Trim(buscas.FieldByName('CEP_EMP').AsString);
    FEmitente.Lgr       := Trim(buscas.FieldByName('ENDRECO_EMP').AsString);
    FEmitente.Nro       := Trim(buscas.FieldByName('NUMERO_END').AsString);
    FEmitente.Cpl       := Trim(buscas.FieldByName('COMPLEMENTO_EMP').AsString);
    FEmitente.Bairro    := Trim(buscas.FieldByName('BAIRRO_EMP').AsString);
    FEmitente.xMun      := Trim(buscas.FieldByName('CIDADE_EMP').AsString);
    FEmitente.UF        := Trim(buscas.FieldByName('WEBSERV_UF').AsString);
    FEmitente.xPais     := 'BRASIL';
    FEmitente.cPais     := 1058;
    FEmitente.cMun_IBGE := buscas.FieldByName('IBGE_COD_CIDADE').AsInteger;
    FEmitente.IM        := Trim(buscas.FieldByName('IM_EMP').AsString);
    FEmitente.CNAE      := Trim(buscas.FieldByName('CNAE_FISCAL').AsString);
    if UpperCase(Trim(buscas.FieldByName('REGIME').AsString)) = 'SIMPLES' then
      FEmitente.CRT     := '1'
    else if Pos('LUCRO', UpperCase(buscas.FieldByName('REGIME').AsString)) > 0 then
      FEmitente.CRT     := '3'
    else
      FEmitente.CRT     := '2';

    Aconfs := TConfig_sistema_classList.Create;
    Aconfs.AddKey('nfc_nfce_qrcode_versao').
//           AddKey('nfc_nfce_tag_nt_2018_005').
           AddKey('nfc_nfce_config_emissor_geral').
           AddKey('nfc_nfce_rejeicoes_sem_ctrl').
           AddKey('nfc_nt_2020_006_data').
           AddKey('nfe_nfce_csrt').
           MakeAll(buscas, FCodmpresa);

    FVersaoQrCode := 0;
    Aconf := Aconfs.GetConf('nfc_nfce_qrcode_versao');
    if Assigned(Aconf) then
      FVersaoQrCode := Trunc(Aconf.value1_f);

    // Versao 3 é Opcional, por padrao entao a 2 permanece, se necessario inverter entao é abaixo
    FVersaoQrCode := Min(3, Max(2, FVersaoQrCode)) ;

//    Aconf := Aconfs.GetConf('nfc_nfce_tag_nt_2018_005');
//    if Assigned(Aconf) then
//      FNT_2018_005 := Date >= StrToDateDef(Aconf.value1_vc, EncodeDate(2019, 05, 07));

    Aconf := Aconfs.GetConf('nfc_nt_2020_006_data');
    ConfNFCe.nfc_nt_2020_006_data := StrToDateDef(Aconf.value1_vc, EncodeDate(2021, 04, 05));

    Aconf := Aconfs.GetConf('nfe_nfce_csrt');
    if Assigned(Aconf) then
    begin
      FIdCSRT := Aconf.ReadString('NFCe_' + FWebServices.UF, 'IdCSRT');
      FCSRT   := Aconf.ReadString('NFCe_' + FWebServices.UF, 'CSRT');
    end;

    Aconf := Aconfs.GetConf('nfc_nfce_config_emissor_geral');
    {$REGION 'lendo configuracao e recriando chaves inexistentes'}
    if not Assigned(Aconf) then
    begin
      Aconf             := TConfig_sistema_class.Create;
      Aconf.chave       := 'nfc_nfce_config_emissor_geral';
      Aconf.cod_empresa := FCodmpresa;
      Aconf.display_    := 'Configurações gerais para emisão de NFC-e';
      Aconf.type1_      := 'blob';
      Aconf.tag         := ';nfce;contingencia;nfc;';
    end;

    with Aconf do
    begin
      AtivarMapeamentoKeys;
      Sect := 'Manutencao';
      with FManutencao do
      begin
        DiasHistoricoStatusServico := ReadInteger(Sect, 'DiasHistoricoStatusServico', 15);
        if not TryStrToDate(ReadString(Sect, 'UltimoDiaManutencao', ''), UltimoDiaManutencao) then
          UltimoDiaManutencao := 0;
      end;
      Sect := 'Contingencia';
      with FContingencia do
      begin
        AtivacaoAutomatica                      := ReadString( Sect, 'AtivacaoAutomatica'                     , 'S').Equals('S');
        QtdeFalhasParaAtivar                    := ReadInteger(Sect, 'QuantidadeFalhasParaAtivar'             , 5);
        QtdeSucessoParaDesativar                := ReadInteger(Sect, 'QuantidadeSucessoParaDesativar'         , 3);
        TentarAutorizarMesmoContingenciaAtivada := ReadString( Sect, 'TentarAutorizarMesmoContingenciaAtivada', 'N').Equals('S');
      end;
      Sect := 'Validacao_' + FWebServices.UF;
      with FValidacoes do
      begin
        UsarStatusServico          := ReadString(Sect, 'UsarStatusServico', 'S').Equals('S');
        LimMinCancNormal           := ReadInteger(Sect, 'LimiteMinutosCancelamentoNormal', 30);
        LimMinCancNormal           := IfThen(LimMinCancNormal > 0, LimMinCancNormal, 30);
        LimDiasDEmiAtrasoCont      := ReadInteger(Sect, 'LimiteDiasEmissaoAtrasoContigencia', 7);
        LimDiasDEmiAtrasoCont      := IfThen(LimDiasDEmiAtrasoCont > 0, LimDiasDEmiAtrasoCont, 7);
        LimDiasEntradaCont         := ReadInteger(Sect, 'LimiteDiasEntradaEmContigencia', 30);
        LimDiasEntradaCont         := IfThen(LimDiasEntradaCont > 0, LimDiasEntradaCont, 30);
      end;
      FPrintSemPrev                := ReadString('NFCe_Impressora_Sem_Preview', 'Caixa_' + IntToStr(CodigoEmissor).PadLeft(3, '0'), '');
    end;

    Aconf := Aconfs.GetConf('nfc_nfce_rejeicoes_sem_ctrl');
    if Assigned(Aconf) then
      FValidacoes.RejeicoesSemCtrl := Aconf.value1_b.Text;

    FValidacoes.RejeicoesSemCtrl := FValidacoes.RejeicoesSemCtrl.Replace(sLineBreak, ',').
                                                                 Replace(';', ',').
                                                                 Replace('-', ',').
                                                                 Replace('.', ',').
                                                                 Replace(' ', ',').
                                                                 Insert(0, '230,231,240,244,245,246,781,203,228,234,464,569,703,704,395,878').
                                                                 Replace(',,', ',') + ',';

    if Aconf.KesyChanges then
      with Aconf.SaveConfDB(buscas).Transaction do
        if InTransaction then
          Commit;
    {$ENDREGION}

    Result := True;

  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

procedure THwConfNFCe.SetNewUltimoDiaManutencao(CurrentDate: TDateTime);
begin
  FManutencao.UltimoDiaManutencao := CurrentDate;
end;

procedure THwConfNFCe.SetPeriodicoCont(
  const Value: RPeriodicoEnvioContingencia);
begin
  FPeriodicoCont := Value;
end;

procedure THwConfNFCe.SwitchJustificativaAuto;
begin
  FContingencia.Justificativa := FContingencia.JustificativaAuto;
end;

{ THwCentralAcoes }

constructor THwCentralAcoes.create;
begin
  inherited;
  FCodEmissor         := 0;
  Ftoken              := '';
  ServidorAutorizacao := False;
  ServidorImpressao   := False;
  ServidorEmail       := False;
end;

destructor THwCentralAcoes.Destroy;
begin

  inherited;
end;

procedure THwCentralAcoes.FinalizarCentralDeAcoes(SeqId: Int64;
  MsgRetorno: string);
var
  SqlMSG: string;
begin
  MsgRetorno := StringReplace(MsgRetorno, '''', '"', [rfReplaceAll]);
  if SeqId > 0 then
  begin
    if Trim(MsgRetorno) <> '' then
      SqlMSG := Format(', %s = %s', [IfThen(MsgRetorno.Length > 255, 'msgcompleta', 'msgretorno'), MsgRetorno.QuotedString])
    else
      SqlMSG := '';

    SqlExec('update NFC_CENTRAL_ACOES set data_prcss = (select current_ts from sp_current_ts(%d)) %s' +
            ' where seqid = %d and cod_empresa = %d', [FCodEmpresa, SqlMSG, SeqId, FCodEmpresa], Buscas);
    {
    Buscas.Close;
    Buscas.SQL.Text := 'update NFC_CENTRAL_ACOES' +
      ' set data_prcss = dasdasd' + SqlMSG +
      ' where seqid = ' + IntToStr(SeqId) +
      ' and cod_empresa = ' + IntToStr(FCodEmpresa);
    if Trim(MsgRetorno) <> '' then
      Buscas.ParamByName('msgretorno').AsString := Copy(MsgRetorno,1 , 255);
    Buscas.ExecSQL;
    }
    if Buscas.Transaction.InTransaction then
      Buscas.Transaction.Commit;
  end;
end;

procedure THwCentralAcoes.SalvarLog(Log: string);
var
  ArquivoTexto: TextFile;
  NomeArquivo: string;
begin
  NomeArquivo := ExtractFilePath(ParamStr(0)) + 'HWNFCService.log';
  try
    AssignFile(ArquivoTexto, NomeArquivo);
    try
      if not FileExists(NomeArquivo) then
        Rewrite(ArquivoTexto)
      else
        append(ArquivoTexto);
      WriteLn(ArquivoTexto, FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + Log);
    finally
      CloseFile(ArquivoTexto);
    end;
  except
  end;
end;

procedure THwCentralAcoes.Settoken(const Value: string);
begin
  Ftoken := Value;
end;

procedure THwCentralAcoes.SetTokenAndEmpresa;
var
  Utils: TServiceUtils;
begin
  try
    Utils := TServiceUtils.create('');
    try
      Utils.LerConfig;
      FCodEmpresa := Utils.Conf.CodEmpresa;
      Ftoken      := Utils.Conf.Token;
    finally
      FreeAndNil(Utils);
    end;
  except
  end;
end;

procedure THwCentralAcoes.ValidarAcesso;
var
  Utils: TServiceUtils;
begin
  SqlOpen('select cod_emissor, server_autorizacao, server_impressao, server_email from NFC_EMISSOR' +
          ' where identificador = %s and cod_empresa = %d and client_or_server = ''S''',
          [Ftoken.QuotedString, FCodEmpresa], Buscas);
  if (Trim(Ftoken) <> '') and (Buscas.FieldByName('cod_emissor').AsInteger > 0) then
  begin
    ServidorAutorizacao := Buscas.FieldByName('server_autorizacao').AsString = 'S';
    ServidorImpressao   := Buscas.FieldByName('server_impressao').AsString = 'S';
    ServidorEmail       := Buscas.FieldByName('server_email').AsString = 'S';
    FCodEmissor         := Buscas.FieldByName('cod_emissor').AsInteger;
//    FEmissorDeNFCe     := Pos('|3|', Buscas.FieldByName('tipo').AsString) > 0;
//    FServidorImpressao := Pos('|4|', Buscas.FieldByName('tipo').AsString) > 0;
//    if FEmissorDeNFCe then
//      FCodEmissorNFCe := Buscas.FieldByName('cod_emissor').AsInteger;
//    FServidorEmail     := FServidorImpressao;
    Utils := TServiceUtils.create('');
    try
      Utils.LerConfig;
//      FEmissorDeNFCe     := Utils.Conf.ServidorDeEnvioNFCe;
//      FServidorImpressao := Utils.Conf.ServidorDeImpressao;
//      FServidorEmail     := Utils.Conf.ServidorDeEmail;
    finally
      FreeAndNil(Utils);
    end;
  end
end;

function THwCentralAcoes.VerificaCentralDeAcoesNoThreads: Integer;
var
  nfce     : THwNFCe;
  SeqId    : Int64;
  tipo, ID : string;
  Adicional: string;
  Acao     : string;
  IndexOf  : Integer;
  Utils    : TServiceUtils;
  ArrayInt : array of Integer;
  StrID    : string;
  IntID    : Integer;
begin
  Result := 0;
  SeqId  := 0;
  Utils := TServiceUtils.create('HWNFC_NoThread_Status');
  try
    Utils.SalvarLog('Ativo', False);
    try
      Utils.SalvarLog('Conectando');
      if not conectar(False) then
        Exit;
      try
        Utils.SalvarLog('Validando acesso');
        ValidarAcesso;

        if (not ServidorImpressao) and (not ServidorEmail) then
          Exit;
        {
        tipo := ' and acao in (';
        if ServidorImpressao then
          tipo := tipo + QuotedStr(actImprimir) + ',';
        if ServidorEmail then
          tipo := tipo + QuotedStr(actEnviarEmail) + ',';

        Delete(tipo, Length(tipo), 1);
        tipo := tipo + ')';
        }
        tipo := '';
        tipo := IfThen(ServidorImpressao, actImprimir.QuotedString);
        tipo := ' and acao in (' +
                tipo + IfThen(not tipo.IsEmpty, ',') + IfThen(ServidorEmail, actEnviarEmail.QuotedString) +
                ')';

        Utils.SalvarLog('Verificando central de ações');
        SqlOpen('select first 2 seqid, tipo, acao, coalesce(id, id_adicional) id,' +
                ' abortar, adicional from NFC_CENTRAL_ACOES' +
                ' where cod_empresa = %d' +
                ' and cod_emiss_serv is null and threadid is null %s' +
                ' order by seqid', [FCodEmpresa, tipo], Buscas);

        Result := Buscas.RecordCount;
        Utils.SalvarLog('Total de ações ' + IntToStr(Result));
      
        if Trim(Buscas.FieldByName('abortar').AsString) = 'S' then
        begin
          Utils.SalvarLog('Ação abortada');
          SalvarLog( Buscas.FieldByName('seqid').AsString + ' ' +
            Buscas.FieldByName('tipo').AsString + ' ' +
            Buscas.FieldByName('acao').AsString + ' ' +
            Buscas.FieldByName('id').AsString + ' abortada');

          SeqId := Buscas.FieldByName('seqid').AsInteger;
          Buscas.Close;
          Buscas.SQL.Text := 'update NFC_CENTRAL_ACOES' +
            ' set cod_emiss_serv = ' + IntToStr(FCodEmissor) +
            ', data_prcss = (select current_ts from sp_current_ts(' + FCodEmpresa.ToString + '))' +
            ', data_leitura_serv = (select current_ts from sp_current_ts(' + FCodEmpresa.ToString + '))' +
            ', msgretorno = ''Abortado por tempo limite atingido''' +
            ' where seqid = ' + IntToStr(SeqId) +
            ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
            ' and cod_emiss_serv is null and threadid is null';
          Buscas.ExecSQL;
          if Buscas.Transaction.InTransaction then
            Buscas.Transaction.Commit;
        end
        else if (Buscas.FieldByName('tipo').AsString = 'NFCE') then
        begin
          if ((ServidorEmail)     and (LowerCase(Buscas.FieldByName('acao').AsString) = actEnviarEmail)) or
             ((ServidorImpressao) and (LowerCase(Buscas.FieldByName('acao').AsString) = actImprimir)) then
          begin
            if (ConfImp.FilaThread.Count >= ConfImp.MaxThreadsAtivas ) then
            begin
              Utils.SalvarLog('Limite de threads atingido');
              SalvarLog( Buscas.FieldByName('seqid').AsString + ' ' +
                Buscas.FieldByName('tipo').AsString + ' ' +
                Buscas.FieldByName('acao').AsString + ' ' +
                Buscas.FieldByName('id').AsString + ' aguardando. Limite de Threads atingido' + IntToStr(ConfImp.MaxThreadsAtivas));
            end
            else
            begin
              if ConfImp <> nil then
                if ConfImp.FilaThread <> nil then
                  ConfImp.FilaThread.Add(IntToStr(MainThreadID));
              try

                SeqId     := Buscas.FieldByName('seqid').AsInteger;
                ID        := Buscas.FieldByName('ID').AsString;
                Adicional := Buscas.FieldByName('adicional').AsString;
                Acao      := Buscas.FieldByName('acao').AsString;

                Buscas.Close;
                Buscas.SQL.Text := 'update NFC_CENTRAL_ACOES' +
                  ' set cod_emiss_serv = ' + IntToStr(FCodEmissor) +
                  ', threadid = ' + IntToStr(MainThreadID) +
                  ', data_leitura_serv = (select current_ts from sp_current_ts(' + FCodEmpresa.ToString + '))' +
                  ' where seqid = ' + IntToStr(SeqId) +
                  ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
                  ' and cod_emiss_serv is null and threadid is null';
                Buscas.ExecSQL;
                if Buscas.Transaction.InTransaction then
                  Buscas.Transaction.Commit;

                Buscas.Close;
                Buscas.SQL.Text := 'select seqid, threadid from NFC_CENTRAL_ACOES' +
                  ' where cod_empresa = ' + IntToStr(FCodEmpresa) +
                  ' and SEQID = ' + IntToStr(SeqId) +
                  ' and cod_emiss_serv = ' + IntToStr(FCodEmissor) +
                  ' and threadid = ' + IntToStr(MainThreadID);
                Buscas.Open;

                if (Buscas.FieldByName('seqid').AsInteger > 0) and
                  (Int64(Buscas.FieldByName('threadid').AsInteger) = MainThreadID) then
                begin

                  Utils.SalvarLog('Criando ação');
                  nfce                   := THwNFCe.Create;
                  try
                    nfce.CodEmpresa      := CodEmpresa;
                    nfce.CodNFCe         := StrToIntDef(Trim(ID), 0);
                    nfce.ClientOrServer  := pmServer;
                    nfce.AcoesAdicionais := Adicional;

                    Utils.SalvarLog('Startando ação ' + LowerCase(Acao));
                    if LowerCase(Acao) = actImprimir then
                      nfce.ServImprimirDANFe
                    else
                    begin
                      for StrID in ID.Split([',']) do
                        if TryStrToInt(StrID, IntID) then
                          if (IntID > 0) and (IntID <> nfce.CodNFCe) then
                          begin
                            SetLength(ArrayInt, Length(ArrayInt) + 1);
                            ArrayInt[High(ArrayInt)] := IntID;
                          end;

                      if Length(ArrayInt) > 0 then
                        nfce.SetArrayNFCe(ArrayInt);

                      nfce.EnviarEmailNFCe;
                    end;

                    FinalizarCentralDeAcoes(SeqId, nfce.MensagemErro);
                  finally
                    FreeAndNil(nfce);
                  end;
                end;
              finally
                if ConfImp <> nil then
                  if ConfImp.FilaThread <> nil then
                  begin
                    IndexOf := ConfImp.FilaThread.IndexOf(IntToStr(MainThreadID));
                    if IndexOf > -1 then
                      ConfImp.FilaThread.Delete(IndexOf);
                  end;
              end;
            end;
          end;
        end;

        Utils.SalvarLog('VerificarThreadsInativas');
        //verificando processamentos nao finalizados que o proprio servidor nao finalizou
        VerificarThreadsInativas(True, SeqId);

        Buscas.Close;
        Utils.SalvarLog('Fim');
      finally
        desconectar;
      end;
    except
      on E: Exception do
      begin
        Result := -1;
        FMensagemErro := 'THwCentralAcoes.VerificaCentralDeAcoesNoThreads ' + e.Message;
      end;
    end;
  finally
    if Assigned(Utils) then FreeAndNil(Utils);
  end;
end;

function THwCentralAcoes.VerificaCentralDeAcoesThreads: Integer;
var
  server   : TEnvioNFCe;
  impressao: TImpressaoNFC;
  SeqId    : Int64;
  tipo     : string;
  Utils    : TServiceUtils;
  MsgContg : string;
begin
  Result := 0;
  SeqId  := 0;
  Utils := TServiceUtils.create('HWNFC_Thread_Status');
  try
    Utils.SalvarLog('Ativo', False);
    try
      Utils.SalvarLog('Conectando');
      if not conectar(False) then
        Exit;
      try
        Utils.SalvarLog('Validando acesso');
        ValidarAcesso;

        if not ServidorAutorizacao then
          Exit;

        //tipo := ' and acao in (';
  //      if FServidorImpressao then
  //        tipo := tipo + QuotedStr(actImprimir) + ',';
  //      if FEmissorDeNFCe then
//          tipo := tipo + QuotedStr(actAutorizar)     + ',' + QuotedStr(actCancelar)    + ',' +
//                         QuotedStr(actInutilizar) + ')';

  //      Delete(tipo, Length(tipo), 1);
  //      tipo := tipo + ')';
        tipo := Format(' and acao in (%s, %s, %s)',
                       [actAutorizar.QuotedString, actCancelar.QuotedString, actInutilizar.QuotedString]);

        Utils.SalvarLog('Verificando central de ações');
        SqlOpen('select first 2 seqid, tipo, acao, coalesce(id, id_adicional) id,' +
                ' abortar, adicional from NFC_CENTRAL_ACOES' +
                ' where cod_empresa = %d' +
                ' and cod_emiss_serv is null and threadid is null %s' +
                ' order by seqid', [FCodEmpresa, tipo], Buscas);

        Result := Buscas.RecordCount;

        Utils.SalvarLog('Total de ações ' + IntToStr(Result));
      
        if Trim(Buscas.FieldByName('abortar').AsString) = 'S' then
        begin
          Utils.SalvarLog('Ação abortada');
          SalvarLog( Buscas.FieldByName('seqid').AsString + ' ' +
            Buscas.FieldByName('tipo').AsString + ' ' +
            Buscas.FieldByName('acao').AsString + ' ' +
            Buscas.FieldByName('id').AsString + ' abortada');

          SeqId := Buscas.FieldByName('seqid').AsInteger;
          Buscas.Close;
          Buscas.SQL.Text := 'update NFC_CENTRAL_ACOES' +
            ' set cod_emiss_serv = ' + IntToStr(FCodEmissor) +
            ', data_prcss = (select current_ts from sp_current_ts(' + FCodEmpresa.ToString + '))' +
            ', data_leitura_serv = (select current_ts from sp_current_ts(' + FCodEmpresa.ToString + '))' +
            ', msgretorno = ''Abortado por tempo limite atingido''' +
            ' where seqid = ' + IntToStr(SeqId) +
            ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
            ' and cod_emiss_serv is null and threadid is null';
          Buscas.ExecSQL;
          if Buscas.Transaction.InTransaction then
            Buscas.Transaction.Commit;
        end
        else if (Buscas.FieldByName('tipo').AsString = 'NFCE') then
        begin
//          if (ServidorAutorizacao) and
//            (LowerCase(Buscas.FieldByName('acao').AsString) <> actImprimir) then
          begin
            Utils.SalvarLog('Ação ' + Buscas.FieldByName('acao').AsString);
            if (ConfNFCe.FilaThread.Count >= ConfNFCe.MaxThreadsAtivas ) then
            begin
              Utils.SalvarLog('Limite de threads atingido');
              SalvarLog( Buscas.FieldByName('seqid').AsString + ' ' +
                Buscas.FieldByName('tipo').AsString + ' ' +
                Buscas.FieldByName('acao').AsString + ' ' +
                Buscas.FieldByName('id').AsString + ' aguardando. Limite de Threads atingido' + IntToStr(ConfNFCe.MaxThreadsAtivas));
            end
            else
            begin
              Utils.SalvarLog('Criando thread');
              server                 := TEnvioNFCe.Create(True);
              server.CodEmpresa      := CodEmpresa;
              server.CodEmissor      := CodEmissor;
              server.Token           := Ftoken;
              server.Acao            := Buscas.FieldByName('acao').AsString;
              server.ID              := Buscas.FieldByName('id').AsString;
              server.ClientOrServer  := pmServer;
              server.AcoesAdicionais := Buscas.FieldByName('adicional').AsString;
              server.Token           := Ftoken;

              SeqId := Buscas.FieldByName('seqid').AsInteger;

              Buscas.Close;
              Buscas.SQL.Text := 'update NFC_CENTRAL_ACOES' +
                ' set cod_emiss_serv = ' + IntToStr(FCodEmissor) +
                ', threadid = ' + IntToStr(server.ThreadID) +
                ', data_leitura_serv = (select current_ts from sp_current_ts(' + FCodEmpresa.ToString + '))' +
                ' where seqid = ' + IntToStr(SeqId) +
                ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
                ' and cod_emiss_serv is null and threadid is null';
              Buscas.ExecSQL;
              if Buscas.Transaction.InTransaction then
                Buscas.Transaction.Commit;

              Buscas.Close;
              Buscas.SQL.Text := 'select seqid, threadid from NFC_CENTRAL_ACOES' +
                ' where cod_empresa = ' + IntToStr(FCodEmpresa) +
                ' and SEQID = ' + IntToStr(SeqId) +
                ' and cod_emiss_serv = ' + IntToStr(FCodEmissor) +
                ' and threadid = ' + IntToStr(server.ThreadID);
              Buscas.Open;

              if (Buscas.FieldByName('seqid').AsInteger > 0) and
                (Int64(Buscas.FieldByName('threadid').AsInteger) = server.ThreadID) then
              begin
                Utils.SalvarLog('Startando thread');
                server.SeqIdCentraAcoes := SeqId;
                server.Resume;
              end
              else
                FreeAndNil(server);
            end;
          end;
          {else if (ServidorImpressao) and
            (LowerCase(Buscas.FieldByName('acao').AsString) = actImprimir) and
            (ConfImp.FilaThread.Count = 0) then
          begin
            Utils.SalvarLog('Ação Imprimir');
            impressao                 := TImpressaoNFC.Create(True);
            impressao.CodEmpresa      := CodEmpresa;
            impressao.CodEmissor      := CodEmissor;
            impressao.Acao            := Buscas.FieldByName('acao').AsString;
            impressao.Tipo            := Buscas.FieldByName('tipo').AsString;
            impressao.ID              := Buscas.FieldByName('id').AsString;
            impressao.ClientOrServer  := pmServer;
            impressao.AcoesAdicionais := Buscas.FieldByName('adicional').AsString;


            SeqId := Buscas.FieldByName('seqid').AsInteger;

            Buscas.Close;
            Buscas.SQL.Text := 'update NFC_CENTRAL_ACOES' +
              ' set cod_emiss_serv = ' + IntToStr(FCodEmissor) +
              ', threadid = ' + IntToStr(impressao.ThreadID) +
              ', data_leitura_serv = asdasd' +
              ' where seqid = ' + IntToStr(SeqId) +
              ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
              ' and cod_emiss_serv is null and threadid is null';
            Buscas.ExecSQL;
            if Buscas.Transaction.InTransaction then
              Buscas.Transaction.Commit;

            Buscas.Close;
            Buscas.SQL.Text := 'select seqid, threadid from NFC_CENTRAL_ACOES' +
              ' where cod_empresa = ' + IntToStr(FCodEmpresa) +
              ' and SEQID = ' + IntToStr(SeqId) +
              ' and cod_emiss_serv = ' + IntToStr(FCodEmissor) +
              ' and threadid = ' + IntToStr(impressao.ThreadID);
            Buscas.Open;

            if (Buscas.FieldByName('seqid').AsInteger > 0) and
              (Int64(Buscas.FieldByName('threadid').AsInteger) = impressao.ThreadID) then
            begin
              Utils.SalvarLog('Startando Impressão');
              impressao.SeqIdCentraAcoes := SeqId;
              impressao.Resume;
            end
            else
              FreeAndNil(impressao);
          end;
          }
        end;

        Utils.SalvarLog('VerificarThreadsInativas');
        //verificando processamentos nao finalizados que o proprio servidor nao finalizou
        VerificarThreadsInativas(False, SeqId);

        VerificarNFCeEmContigencia(MsgContg);
        Utils.SalvarLog(MsgContg);

        Buscas.Close;
        Utils.SalvarLog('Fim');
      finally
        desconectar;
      end;
    except
      on E: Exception do
      begin
        Result := -1;
        FMensagemErro := 'THwCentralAcoes.VerificaCentralDeAcoesThreads ' + e.Message;
        Utils.SalvarLog('Erro ' + e.Message);
      end;
    end;
  finally
    if Assigned(Utils) then FreeAndNil(Utils);
  end;
end;

procedure THwCentralAcoes.VerificarNFCeEmContigencia(var Msg: string);
var
  Datahora : TDateTime;
  Minutos  : string;
  Utils    : TServiceUtils;
  server   : TEnvioNFCe;
  P        : RPeriodicoEnvioContingencia;
  FreeUtils: Boolean;
begin
  try
    Msg := 'Ult cont ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', ConfNFCe.PeriodicoCont.UtltimaConsulta) +
           ' Thread ' + IntToStr(ConfNFCe.PeriodicoCont.IdThreadResponsavel);

    if ConfNFCe.PeriodicoCont.IdThreadResponsavel > 0 then
      if ConfNFCe.FilaThread.IndexOf(IntToStr(ConfNFCe.PeriodicoCont.IdThreadResponsavel)) > -1 then
        Exit;

    Utils := TServiceUtils.create('');
    try
      Utils.LerConfig;
      if (Utils.Conf.TimeVerificarEnvioContingencia > 59) or (Utils.Conf.TimeVerificarEnvioContingencia < 1) then
        Minutos := '05'
      else
        Minutos := IntToStr(Utils.Conf.TimeVerificarEnvioContingencia);
    finally
      FreeAndNil(Utils);
    end;
    if Length(Minutos) = 1 then
      Minutos := '0' + Minutos;
    Minutos := '00:' + Copy(Minutos, 1, 2) + ':00';

    Msg := 'Ultima contingencia verificada ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', ConfNFCe.PeriodicoCont.UtltimaConsulta) + ' a cada ' + Minutos;

    Datahora := ConfNFCe.PeriodicoCont.UtltimaConsulta + StrToTime(Minutos);

    if Now > Datahora then
    begin
      if ServidorAutorizacao then
        with SqlExec('update NFC_EMISSOR set DH_LAST_ACTIVE = (select current_ts from sp_current_ts(%d))' +
                     ' where cod_emissor = %d and cod_empresa = %d',
                     [FCodEmpresa, FCodEmissor, FCodEmpresa]).Transaction do
          if InTransaction then
            Commit;

      server                  := TEnvioNFCe.Create(True);
      server.CodEmpresa       := FCodEmpresa;
      server.CodEmissor       := FCodEmissor;
      server.Token            := Ftoken;
      server.Acao             := actAutorizarCont;
      server.ID               := '';
      server.ClientOrServer   := pmServer;
      server.AcoesAdicionais  := '';
      server.SeqIdCentraAcoes := 0;

      P                       := ConfNFCe.PeriodicoCont;
      P.IdThreadResponsavel   := server.ThreadID;
      ConfNFCe.PeriodicoCont  := P;

      Msg := 'Verificando contingencias agora ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now) + ' a cada ' + Minutos + ' min';

      server.Resume;
    end;
  except
  end;
end;

procedure THwCentralAcoes.VerificarThreadsInativas(NoThreads: Boolean; CurrentCAID: Integer);
var
  tipo: string;
  threadAtiva: Boolean;
  SeqId: Integer;
begin
  try
    if (not ServidorImpressao) or (not ServidorAutorizacao) or (not ServidorEmail) then
        Exit;
//    tipo := ' and acao in (';
//    if FServidorImpressao then
//      tipo := tipo + QuotedStr(actImprimir) + ',';
//    if FEmissorDeNFCe then
//      tipo := tipo + QuotedStr(actAutorizar)     + ',' + QuotedStr(actCancelar)    + ',' +
//                     QuotedStr(actInutilizar) + ',' + QuotedStr(actEnviarEmail) + ',';
//
//    Delete(tipo, Length(tipo), 1);
//    tipo := tipo + ')';

    if (ServidorImpressao) and (ConfImp.VerificarThreasInativas) and (NoThreads) then
    begin
      {
      tipo := ' and acao in (';
      if ServidorImpressao then
        tipo := tipo + QuotedStr(actImprimir) + ',';
      if ServidorEmail then
        tipo := tipo + QuotedStr(actEnviarEmail) + ',';
      Delete(tipo, Length(tipo), 1);
      tipo := tipo + ')';
      }
      tipo := '';
      tipo := IfThen(ServidorImpressao, actImprimir.QuotedString);
      tipo := ' and acao in (' +
              tipo + IfThen(not tipo.IsEmpty, ',') + IfThen(ServidorEmail, actEnviarEmail.QuotedString) +
              ')';
      SqlOpen('select seqid, tipo, acao, id, abortar, threadid from NFC_CENTRAL_ACOES' +
              ' where cod_empresa = %d' +
              ' and cod_emiss_serv = %d' +
              ' and data_prcss is null %s' +
              ' and seqid <> %d' +
              ' order by seqid',
              [FCodEmpresa, FCodEmissor, tipo, CurrentCAID], Buscas).First;

      while not Buscas.Eof do
      begin
        threadAtiva := (ConfImp.FilaThread.IndexOf(Buscas.FieldByName('threadid').AsString) > -1);
        if not threadAtiva then
        begin
          SeqId := Buscas.FieldByName('seqid').AsInteger;
          QrAux.Close;
          QrAux.SQL.Text := 'update NFC_CENTRAL_ACOES' +
            ' set cod_emiss_serv = ' + IntToStr(FCodEmissor) +
            ', data_prcss = (select current_ts from sp_current_ts(' + FCodEmpresa.ToString + '))' +
            ', msgretorno = ''Abortado pelo servidor, finalizacao inesperada no meio do processamento''' +
            ', abortar = ''S''' +
            ' where seqid = ' + IntToStr(SeqId) +
            ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
            ' and data_prcss is null';
          QrAux.ExecSQL;
        end;

        Buscas.Next;
      end;
    end;
    if (ServidorAutorizacao) and (ConfNFCe.VerificarThreasInativas) then
    begin
      tipo := Format(' and acao in (%s, %s, %s)',
                       [actAutorizar.QuotedString, actCancelar.QuotedString, actInutilizar.QuotedString]);
      SqlOpen('select seqid, tipo, acao, id, abortar, threadid from NFC_CENTRAL_ACOES' +
              ' where cod_empresa = %d' +
              ' and cod_emiss_serv = %d' +
              ' and data_prcss is null %s' +
              ' and tipo = ''NFCE''' +
              ' and seqid <> %d' +
              ' order by seqid',
              [FCodEmpresa, FCodEmissor, tipo, CurrentCAID], Buscas).First;
      while not Buscas.Eof do
      begin
        threadAtiva := (ConfImp.FilaThread.IndexOf(Buscas.FieldByName('threadid').AsString) > -1);
        if not threadAtiva then
        begin
          SeqId := Buscas.FieldByName('seqid').AsInteger;
          QrAux.Close;
          QrAux.SQL.Text := 'update NFC_CENTRAL_ACOES' +
            ' set cod_emiss_serv = ' + IntToStr(FCodEmissor) +
            ', data_prcss = (select current_ts from sp_current_ts(' + FCodEmpresa.ToString + '))' +
            ', msgretorno = ''Abortado pelo servidor, finalizacao inesperada no meio do processamento''' +
            ', abortar = ''S''' +
            ' where seqid = ' + IntToStr(SeqId) +
            ' and cod_empresa = ' + IntToStr(FCodEmpresa) +
            ' and data_prcss is null';
          QrAux.ExecSQL;
        end;

        Buscas.Next;
      end;
    end;
  except
  end;
end;

{ TImpressaoNFC }

procedure TImpressaoNFC.Execute;
var
  IndexOf: Integer;
begin
  inherited;
  if ConfNFCe <> nil then
    if ConfNFCe.FilaThread <> nil then
      ConfNFCe.FilaThread.Add(IntToStr(Self.ThreadID));
  try
    if (UpperCase(FTipo) = 'NFCE') and (LowerCase(FAcao) = actImprimir) then
      ImprimirNFCe
    {else if (UpperCase(FTipo) = 'sat') and (LowerCase(FAcao) = actImprimir) then
      ImprimirSAT};

  finally
    if ConfNFCe <> nil then
      if ConfNFCe.FilaThread <> nil then
      begin
        IndexOf := ConfNFCe.FilaThread.IndexOf(IntToStr(Self.ThreadID));
        if IndexOf > -1 then
          ConfNFCe.FilaThread.Delete(IndexOf);
      end;
  end;
end;

procedure TImpressaoNFC.ImprimirNFCe;
var
  nfce: THwNFCe;
begin
  inherited;
  nfce := THwNFCe.create;
  try
    nfce.CodEmpresa      := FCodEmpresa;
    nfce.CodEmissor      := FCodEmissor;
    nfce.token           := FToken;
    nfce.CodNFCe         := StrToIntDef(Trim(FID), 0);
    nfce.ClientOrServer  := FClientOrServer;
    nfce.AcoesAdicionais := FAcoesAdicionais;

    nfce.ServImprimirDANFe;

    if nfce.MensagemErro <> '' then
      FinalizarCentralDeAcoes(nfce.Buscas, nfce.MensagemErro)
    else
      FinalizarCentralDeAcoes(nfce.Buscas, '');
  finally
    FreeAndNil(nfce);
  end;
end;

procedure TImpressaoNFC.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

{ THwConfImp }

constructor THwConfImp.create;
begin
  FMaxThreadsAtivas := 1;
  inherited;
end;

destructor THwConfImp.Destroy;
begin
  inherited;
end;

procedure THwConfImp.lerConfig;
var
  Utils: TServiceUtils;
begin
  try
    Utils := TServiceUtils.create('');
    try
      Utils.LerConfigImpressao;
      FImpressao := Utils.Impr;
      {
      FImpressao.QtdeLinhasAvancoPapelAposNFC := Utils.Impr.QtdeLinhasAvancoPapelAposNFC;
      FImpressao.SleepAfterPrint              := Utils.Impr.SleepAfterPrint;
      FImpressao.CortarPapelAposImpressao     := Utils.Impr.CortarPapelAposImpressao;
      FImpressao.ImprimeEmUmaLinha            := Utils.Impr.ImprimeEmUmaLinha;
      FImpressao.ImprimeDescAcrescItem        := Utils.Impr.ImprimeDescAcrescItem;
      FImpressao.Logo_Height                  := Utils.Impr.Logo_Height;
      FImpressao.Logo_Width                   := Utils.Impr.Logo_Width;
      FImpressao.ImprimeNomeFantasia          := Utils.Impr.ImprimeNomeFantasia;
      FImpressao.ImprimirTributos             := Utils.Impr.ImprimirTributos;
      FImpressao.TributosSeparadamente        := Utils.Impr.TributosSeparadamente;
      FImpressao.ImprimeLogoLateral           := Utils.Impr.ImprimeLogoLateral;
      FImpressao.QRCodeLateral                := Utils.Impr.QRCodeLateral;
      FImpressao.AbrirGaveta                  := Utils.Impr.AbrirGaveta;
      FImpressao.AbrirGavetaEspecifica        := Utils.Impr.AbrirGavetaEspecifica;
      }

      Utils.LerConfigPosPrinter;

      FPosPrinter.Modelo                      := Utils.PosPrinter.Modelo;
      FPosPrinter.Porta                       := Utils.PosPrinter.Porta;
      FPosPrinter.Colunas                     := Utils.PosPrinter.Colunas;
      FPosPrinter.EspacoEntreLinhas           := Utils.PosPrinter.EspacoEntreLinhas;
      FPosPrinter.LinhasBuffer                := Utils.PosPrinter.LinhasBuffer;
      FPosPrinter.LinhasEntreCupons           := Utils.PosPrinter.LinhasEntreCupons;
      FPosPrinter.ControlePorta               := Utils.PosPrinter.ControlePorta;
      FPosPrinter.TraduzirTags                := Utils.PosPrinter.TraduzirTags;
      FPosPrinter.IgnorarTags                 := Utils.PosPrinter.IgnorarTags;
      FPosPrinter.ArqLOG                      := Utils.PosPrinter.ArqLOG;
      FPosPrinter.PaginaDeCodigo              := Utils.PosPrinter.PaginaDeCodigo;
      FPosPrinter.Barras_LarguraLinha         := Utils.PosPrinter.Barras_LarguraLinha;
      FPosPrinter.Barras_Altura               := Utils.PosPrinter.Barras_Altura;
      FPosPrinter.Barras_MostrarCodigo        := Utils.PosPrinter.Barras_MostrarCodigo;
      FPosPrinter.QRCode_Tipo                 := Utils.PosPrinter.QRCode_Tipo;
      FPosPrinter.QRCode_LarguraModulo        := Utils.PosPrinter.QRCode_LarguraModulo;
      FPosPrinter.QRCode_ErrorLevel           := Utils.PosPrinter.QRCode_ErrorLevel;
      FPosPrinter.Logo_KeyCode1               := Utils.PosPrinter.Logo_KeyCode1;
      FPosPrinter.Logo_KeyCode2               := Utils.PosPrinter.Logo_KeyCode2;
      FPosPrinter.Logo_FatorX                 := Utils.PosPrinter.Logo_FatorX;
      FPosPrinter.Logo_FatorY                 := Utils.PosPrinter.Logo_FatorY;
      FPosPrinter.Device_ParamsString         := Utils.PosPrinter.Device_ParamsString;

      if FImpressao.SleepAfterPrint > 5000 then
        FImpressao.SleepAfterPrint := 5000;
    finally
      FreeAndNil(Utils);
    end;
  except
  end;
end;

procedure THwConfImp.SetImpressao(const Value: RImpressaoNaoFiscal);
begin
  FImpressao := Value;
end;

procedure THwConfImp.SetPosPrinter(const Value: RPosPrinter);
begin
  FPosPrinter := Value;
end;

{ THwConf }

constructor THwConf.create;
begin
  FContThreadsInativas   := 0;
  FSalvarLogNFC          := False;
  FSalvarLogCentralAcoes := True;
  FFilaThread            := TStringList.Create;
  FFilaThread.Clear;
end;

destructor THwConf.Destroy;
begin
  if FFilaThread <> nil then
    FreeAndNil(FFilaThread);
  inherited;
end;

procedure THwConf.SetFilaThread(const Value: TStrings);
begin
  FFilaThread := Value;
end;

procedure THwConf.SetMaxThreadsAtivas(const Value: Smallint);
begin
  FMaxThreadsAtivas := Value;
end;

procedure THwConf.SetSalvarLogCentralAcoes(const Value: Boolean);
begin
  FSalvarLogCentralAcoes := Value;
end;

procedure THwConf.SetSalvarLogNFC(const Value: Boolean);
begin
  FSalvarLogNFC := Value;
end;

function THwConf.VerificarThreasInativas: Boolean;
begin
  Result := FContThreadsInativas = 0;
  if FContThreadsInativas >= 50 then
    FContThreadsInativas := 0
  else
    FContThreadsInativas := FContThreadsInativas + 1;
end;

{ TThreadHwNFC }

constructor TThreadHwNFC.Create(CreateSuspended: Boolean);
begin
  FAcao             := '';
  FSeqIdCentraAcoes := 0;
  FCodEmpresa       := 0;
  FID               := '';
  FClientOrServer   := pmUndefined;
  FCodNFC           := 0;
  FAcoesAdicionais  := '';
  inherited Create(CreateSuspended);
end;

procedure TThreadHwNFC.FinalizarCentralDeAcoes(Buscas: TIBQuery;
  MsgRetorno: string);
var
  SqlMSG: string;
begin
  MsgRetorno := StringReplace(MsgRetorno, '''', '"', [rfReplaceAll]);
  if FSeqIdCentraAcoes > 0 then
  begin
    if Trim(MsgRetorno) <> '' then
      SqlMSG := Format(', %s = %s', [IfThen(MsgRetorno.Length > 255, 'msgcompleta', 'msgretorno'), MsgRetorno.QuotedString])
    else
      SqlMSG := '';
    Buscas.Close;
    Buscas.SQL.Text := 'update NFC_CENTRAL_ACOES' +
      ' set data_prcss = (select current_ts from sp_current_ts(' + FCodEmpresa.ToString + '))' + SqlMSG +
      ' where seqid = ' + IntToStr(FSeqIdCentraAcoes) +
      ' and cod_empresa = ' + IntToStr(FCodEmpresa);
    //if Trim(MsgRetorno) <> '' then
    //  Buscas.ParamByName('msgretorno').AsString := Copy(MsgRetorno,1 , 255);
    Buscas.ExecSQL;
    if Buscas.Transaction.InTransaction then
      Buscas.Transaction.Commit;
  end;
end;

procedure TThreadHwNFC.SetAcao(const Value: string);
begin
  FAcao := Value;
end;

procedure TThreadHwNFC.SetAcoesAdicionais(const Value: string);
begin
  FAcoesAdicionais := Value;
end;

procedure TThreadHwNFC.SetArrayNFCe(ArrayInt: array of Integer);
var
  I: Integer;
begin
  SetLength(FArrayNFCe, Length(ArrayInt));

  for I := Low(ArrayInt) to High(ArrayInt) do
    FArrayNFCe[I] := ArrayInt[I];
end;

procedure TThreadHwNFC.SetClientOrServer(const Value: RParentMode);
begin
  FClientOrServer := Value;
end;

procedure TThreadHwNFC.SetCodEmpresa(const Value: Integer);
begin
  FCodEmpresa := Value;
end;

procedure TThreadHwNFC.SetCodNFC(const Value: Integer);
begin
  FCodNFC := Value;
end;

procedure TThreadHwNFC.SetID(const Value: string);
begin
  FID := Value;
end;

procedure TThreadHwNFC.SetSeqIdCentraAcoes(const Value: Int64);
begin
  FSeqIdCentraAcoes := Value;
end;

{ TTaskNFCes }

constructor TTaskNFCes.Create(AOwner: THwNFCe);
begin
  inherited Create;
  FOwner    := AOwner;
  FTaks     := TObjectList<TTaskNFCe>.Create;
end;

destructor TTaskNFCes.Destroy;
begin
  FTaks.Clear;
  FreeAndNil(FTaks);
  inherited;
end;

function TTaskNFCes.New: TTaskNFCe;
begin
  Result := TTaskNFCe.Create;
  FTaks.Add(Result);
end;

function TTaskNFCes.Run: Integer;
begin
  Result := 0;
  while FTaks.Count > 0 do with FTaks.Items[0] do
  begin
    FOwner.CodNFCe    := CodigoNFCe;
    FOwner.CodEmpresa := CodigoEmp;
    if Task = tsConsulta then
      Result := THwNFCe(FOwner).ConsultaNFCe

    else if Task = tsCancelamento then
      Result := THwNFCe(FOwner).CancelarNFCe

    else if Task = tsInutilizacao then
      Result := THwNFCe(FOwner).InutilizarNFCe;

    FTaks.Delete(0);
  end;
end;

{ TNFCe_StatusServico }

constructor TNFCe_StatusServico.Create(AOwner: THwNFCe);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor TNFCe_StatusServico.Destroy;
begin
  desconectar;
  if Assigned(Fnfce_ss) then FreeAndNil(Fnfce_ss);
  inherited;
end;

procedure TNFCe_StatusServico.Registrar(Sucess: Boolean);
var
  Qtde: Integer;
  TipoEmissao: Integer;
  CurrentDate: TDate;
  Conf: TConfig_sistema_class;
begin
  try

    if not Banco.Connected then
      if not conectar(False) then
        Exit;

    if not Assigned(Fnfce_ss) then
      Exit;

    try
      with Fnfce_ss do
      begin
        status   := IfThen(Sucess, 1);

        with SQLMotor('datahora') do
          with SqlExec(SQLInsert).Transaction do
            if InTransaction then
              Commit;

        if Assigned(ConfNFCe) then
        begin
          CurrentDate := 0;
          if ConfNFCe.Contingencia.AtivacaoAutomatica then
          begin
            TipoEmissao := ConfNFCe.Geral.TpEmis;
            Qtde := IfThen(TipoEmissao = 9,
                           ConfNFCe.Contingencia.QtdeSucessoParaDesativar,
                           ConfNFCe.Contingencia.QtdeFalhasParaAtivar);
            SqlOpen('select sum(SS.STATUS) QTDE, (select current_ts from sp_current_ts(%d)) datahora' +
                    ' from (select first %d COD_EMPRESA, STATUS ' +
                    '       from NFCE_STATUS_SERVICO' +
                    '       where COD_EMPRESA = %d and SERVICO = ''Autorizacao''' +
                    '      order by DATAHORA desc) as SS',
                    [FOwner.CodEmpresa, Qtde, FOwner.CodEmpresa]);
            CurrentDate := DateOf(QrAux.FieldByName('datahora').AsDateTime);

            if ((TipoEmissao  = 9) and (QrAux.FieldByName('qtde').AsInteger >= Qtde)) or
               ((TipoEmissao <> 9) and (QrAux.FieldByName('qtde').AsInteger = 0)) then
              with SqlExec('update NFCE_CONFIG set dhcont = %s, tpemis = %d,' +
                           ' xjust = %s where cod_empresa = %d',
                           [FormatDateTime('YYYY-MM-DD hh:mm:ss', QrAux.FieldByName('datahora').AsDateTime).QuotedString,//TIVE QUE COLOCAR ISSO, POIS DIRETO NO SQL = adsasd FAZIA DAR ERRO PELO SISTEMA QUANDO ATIVAVA A CONTINGENCIA
                            IfThen(TipoEmissao = 9, 1, 9),
                            ConfNFCe.Contingencia.JustificativaAuto.Substring(0, 256).QuotedString,
                            FOwner.CodEmpresa]).Transaction do
                if InTransaction then
                  Commit;
          end;

          if DateOf(ConfNFCe.Manutencao.UltimoDiaManutencao) < CurrentDate then
          begin
            SqlExec('delete from nfce_status_servico' +
                    ' where datahora < (select current_d from sp_current_ts(%d)) - %d and cod_empresa = %d',
                    [FOwner.CodEmpresa,
                     IfThen(ConfNFCe.Manutencao.DiasHistoricoStatusServico > 90, 90, ConfNFCe.Manutencao.DiasHistoricoStatusServico),
                     FOwner.CodEmpresa]);
            Conf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_geral', QrAux, FOwner.CodEmpresa);
            try
              if Conf.chave.Equals('nfc_nfce_config_emissor_geral') then
              begin
                Conf.WriteString('Manutencao', 'UltimoDiaManutencao', FormatDateTime('dd/mm/yyyy', CurrentDate));
                Conf.SaveConfDB(QrAux);
              end;
            finally
              FreeAndNil(Conf);
            end;

            if QrAux.Transaction.InTransaction then
              QrAux.Transaction.Commit;

            ConfNFCe.SetNewUltimoDiaManutencao(CurrentDate);
          end;
        end;
      end;

    finally
      FreeAndNil(Fnfce_ss);
    end;
  except on E: Exception do

  end;
end;

procedure TNFCe_StatusServico.StartLog(Service: RTasks; Msg: string);
begin
  Fnfce_ss := TNfce_status_servico_class.Create;
  with Fnfce_ss do
  begin
    cod_empresa := FOwner.CodEmpresa;
    cod_emissor := THwNFCe(FOwner).FCodEmissor;
    case Service of
      tsCancelamento       : servico := 'Cancelamento';
      tsInutilizacao       : servico := 'Inutilizacao';
      tsAutorizacao        : servico := 'Autorizacao';
      tsConsulta           : servico := 'Consulta';
      tsStsatusServico     : servico := 'StatusServico';
      tsRetornoAutorizacao : servico := 'RetornoAutorizacao';
    end;
    mensagem := Msg;
    status   := 1;
  end;
end;

{ RWebServices }

function RWebServices.GetEnviarAssincrono: Boolean;
begin
  Result := EnvSincAssinc.Trim.Equals('A');
end;

function RWebServices.GetEnviarSincrono: Boolean;
begin
  Result := True; //EnvSincAssinc.Trim.Equals('S');
end;

{ TNfceModel }

constructor TNfceModel.Create(ATributos: TributoDFeContextEtdList);
var
  trib: TributoDFeContextEtd;
begin
  inherited Create();

  if not Assigned(ATributos) then
    FTributos := TributosDFeDict.Create(0)
  else
  begin
    FTributos := TributosDFeDict.Create(ATributos.Count);
    while ATributos.Count > 0 do
    begin
      trib := TributoDFeContextEtd(ATributos.Items[0]);

      FTributos.Add(trib.Id, TributoDFeContextEtd(ATributos.Extract(trib)) );
    end;
  end;
end;

destructor TNfceModel.Destroy;
begin
  FTributos.Clear();

  FreeAndNil(FTributos);

  inherited;
end;

{ TNfceItemModel }

destructor TNfceItemModel.Destroy;
begin
  if Assigned(FTributoRtc) then
    FreeAndNil(FTributoRtc);

  inherited;
end;

procedure TNfceItemModel.SetTributoRtc(const Value: TributoDFeContextEtd);
begin
  if FTributoRtc = Value then
    Exit;

  if Assigned(FTributoRtc) then
    FreeAndNil(FTributoRtc);

  FTributoRtc := Value;
end;

end.
