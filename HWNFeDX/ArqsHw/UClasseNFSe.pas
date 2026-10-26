unit UClasseNFSe;

interface

uses
  Vcl.Forms,
  ACBrNFSeX,
  ACBrNFSeXConversao,
  ACBrNFSeXDANFSeRLClass,
  blcksock,
  sigiss_ws,
  MidasLib,
  UClasseNFe,
  config_sistema_class,
  System.Classes,
  System.SysUtils,
  IBX.IBDatabase,
  IBX.IBQuery,
  Data.DB,
  Datasnap.DBClient
  ;

type
  TClassNfSe = class;

  TClasstribcid = class
  private
    Ok : Boolean;
    fPathSh, fPathSis : string;
    FibgeId: string;
    function getMd5File(AFileName: string): string;
    function GetPathSchemas: string;
  protected
    vRemoverEnterOBS_OS: Boolean;
    procedure localizarArquivos(pPath, pFilter: string; pLista: TStrings);

    property PathSh: string read fPathSh write fPathSh;
  public
    constructor create;
    destructor destroy; override;
    procedure copiarschemas(tpAmb: string); virtual;
    function montartxtrps(vnotanfs: TClassNfe): string; virtual; abstract;
    function montarRPSAC(var vacbrnfse1: TACBrNFSeX; vnotanfs: TClassNfe): boolean; virtual;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; virtual; abstract;
    procedure HandleValuesBeforePrint(var nfse: TACBrNFSeX; nfs: TClassNfe); virtual;
    property ibgeId: string read FibgeId write FibgeId;
    property PathSchemas: string read GetPathSchemas;
//   var
//    vden: AnsiString;
  end;

  TClasstribcidGV = class(TClasstribcid)
  private
    procedure copiarschemas(tpAmb: string); override;
  public
    constructor create;
    destructor destroy; override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1: TACBrNFSeX; vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
  end;

  TClasstribcidBH = class(TClasstribcid)
  private
    procedure copiarschemas(tpAmb: string); override;
  public
    constructor create;
    destructor destroy; override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1: TACBrNFSeX; vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
  end;

  TClasstribcidTO = class(TClasstribcid)
  private
    procedure copiarschemas(tpAmb: string); override;
  public
    constructor create;
    destructor destroy; override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1: TACBrNFSeX; vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
  end;

  TClassNFSeAbaco = class(TClasstribcid)
  private
    procedure copiarschemas(tpAmb: string); override;
  public
    constructor create;
    destructor destroy; override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1: TACBrNFSeX; vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
  end;

  TClassNFSeDefault = class(TClasstribcid)
  public
    constructor create(_ibgeId: string);
    destructor destroy; override;
    procedure copiarschemas(tpAmb: string); override;
    function montartxtrps(vnotanfs: TClassNfe): string; override;
    function montarRPSAC(var vacbrnfse1: TACBrNFSeX; vnotanfs: TClassNfe): boolean; override;
    function sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps; override;
    procedure HandleValuesBeforePrint(var nfse: TACBrNFSeX; nfs: TClassNfe); override;
  end;

  TAuxItensRateio = class
  private
    Fcod_empresa   : Integer;
    Fvalor_b_nfse  : Extended;
    Fvalor_nfse    : Extended;
    Fissret_servico: Extended;
    Fcod_servico   : Integer;
    Fnitem         : Integer;
    Fnped          : Integer;
    Ftipo          : string;
    Fcodigo_nop    : Double;
    Faliq_iss      : Extended;
    Fbase_rateio   : Double;
  public
    property nped            : Integer  read Fnped             write Fnped;
    property tipo            : string   read Ftipo             write Ftipo;
    property cod_servico     : Integer  read Fcod_servico      write Fcod_servico;
    property nitem           : Integer  read Fnitem            write Fnitem;
    property cod_empresa     : Integer  read Fcod_empresa      write Fcod_empresa;
    property codigo_nop      : Double   read Fcodigo_nop       write Fcodigo_nop;
    property base_rateio     : Double   read Fbase_rateio      write Fbase_rateio;
    property valor_b_nfse    : Extended read Fvalor_b_nfse     write Fvalor_b_nfse;
    property aliq_iss        : Extended read Faliq_iss         write Faliq_iss;
    property valor_nfse      : Extended read Fvalor_nfse       write Fvalor_nfse;
    property issret_servico  : Extended read Fissret_servico   write Fissret_servico;
  end;

  TCollection_DocNFSe = class
  private
    Frps: tcDescricaoRps;
    Fcan_ret: tcRetornoNota;
    Faut_nfse: tcDadosNota;
    Faut_ret: tcRetornoNota;
    Fcan_nfse: tcDadosNota;
    Frps_resc: tcDescricaoRps;
    Famb_prod: Boolean;
    Fdhenvio: string;
    Fsit_orig: string;
  public
    property amb_prod: Boolean        read Famb_prod write Famb_prod default False;
    property dhenvio : string         read Fdhenvio  write Fdhenvio;
    property sit_orig: string         read Fsit_orig write Fsit_orig;

    property rps     : tcDescricaoRps read Frps      write Frps;
    property rps_resc: tcDescricaoRps read Frps_resc write Frps_resc;//rescue
    property aut_ret : tcRetornoNota  read Faut_ret  write Faut_ret;
    property aut_nfse: tcDadosNota    read Faut_nfse write Faut_nfse;
    property can_ret : tcRetornoNota  read Fcan_ret  write Fcan_ret;
    property can_nfse: tcDadosNota    read Fcan_nfse write Fcan_nfse;
  end;

  TErroNFSeWS = class
  private
    FMetodo: string;
    FCodigo: string;
    FMensagem: string;
    FCorrecao: string;
  public
    property Metodo: string read FMetodo write FMetodo;
    property Codigo: string read FCodigo write FCodigo;
    property Mensagem: string read FMensagem write FMensagem;
    property Correcao: string read FCorrecao write FCorrecao;
  end;

  TNFSeConsultaCondicao = (tccComeca, tccIgual, tccDiferente, tccMaior, tccMenor, tccEstaContido);
  TNFSeConsultaStatus = (tcsAmbos, tcsNaoAutorizada, tcsAutorizada);
  TNFSeConsultaTipo = (tctDecimal, tctInteiro, tctTexto, tctData);

  TNFSeConsulta = record
  private
    FStatus: TNFSeConsultaStatus;
    FCondicao: TNFSeConsultaCondicao;
    FCampo: string;
    FOrdem: string;
    FValor: string;
    FData1: string;
    FData2: string;
  public
    class function Create(
      Status: TNFSeConsultaStatus;
      Condicao: TNFSeConsultaCondicao;
      const Campo, Ordem, Valor, Data1, Data2: string
    ): TNFSeConsulta; static;

    property Status: TNFSeConsultaStatus read FStatus;
    property Campo: string read FCampo;
    property Condicao: TNFSeConsultaCondicao read FCondicao;
    property Ordem: string read FOrdem;
    property Valor: string read FValor;
    property Data1: string read FData1;
    property Data2: string read FData2;
  end;

  TErrosNFSeWS = TArray<TErroNFSeWS>;

  TClassNfSe = class(TClassNfe)
  private
   buscaadc: TIBQuery;
   buscanfscanc: TIBQuery;
   FArquivo: AnsiString;
   FGrupo: AnsiString;
   vdados: Ansistring;
   nomearq: string;
   nrloterps: string;
   Fprotoloco: string;
   Fdatacanc,FdataEnvio: Tdate;
   FListaErros: widestring;
   FnumeroNFSe: string;
   Fcodigover: string;
   Fdiscrimina: string;
   FDataEmissaoNFSe: TDateTime;
   Foutrasinf: WideString;
   FCodigoCnae: string;
   FRpsNFSe: string;
   nroLote: string;
   vosNFSe: integer;
   vcoderro: string;
   vvalNFSe: string;
   FdataRPS: TDateTime;
   vcidadegertxt: TClasstribcid;
   Fpis,Fcofins,Finss,Fir,Fcsll,FoutrasRet,Fdeducoes,Fdescadc,FdescCond,
   FbaseCalc,Faliq,Fiss,Fissretido,FvalorLiq,Fvalorbruto: real;
   vcodgar: integer;
   listaMensagemAlertaRetorno,listanfse,ListaMensagemRetorno: Widestring;
   listaMensagemRetornoLote: WideString;
   Fnomecliente: String;
   ACBrNFSeDANFSeQR1: TACBrNFSeXDANFSeRL;
   ACBrNFSe1: TACBrNFSeX;
   ConfSis: TConfig_sistema_class;

   FdocsNFSe: TCollection_DocNFSe;
    FDhDesativacaoModuloLegado: TDateTime;

    procedure NFSeGerarLog(const ALogLine: string; var Tratado: Boolean);
    procedure verificarCaracteresNFSe;
    procedure ClearErrosNFSe();
    function GetErrosNFSe(): string;
    function GetErrosNFSeObj(): TArray<TErroNFSeWS>;
    function loadXMLdoBanco(Aid: string; AGerarNFSe: Boolean): Boolean;
    function GetXMLBanco(id: string): string;
    function GetXmlRPS(rpsId: Integer): string;
    function GetXmlNFSe(nfseId: Integer): string;
    function PostXmlBanco(id, xml: string; query: TIBQuery = nil): Boolean;
    function PostXmlRPS(rpsId: Integer; xml: string; query: TIBQuery = nil): Boolean;
    function PostXmlNFSe(nfseId: Integer; xml: string; query: TIBQuery = nil): Boolean;
  public
    constructor create;
    destructor destroy; override;
    function abrevazio: boolean; override;
    function rExtrai(const nivel: integer; const TagInicio: string; TagFim: string = ''; const item: integer = 1): AnsiString;
    function montarRPSEnv(vos: integer): boolean; overload;
    function montarRPSEnv(vos: string): boolean; overload;
    function montaRPSos(vos: integer): Boolean;
    function ObterSQL(): string;
    function ConsultaGrid(const Input: TNFSeConsulta): boolean;
    function validardadosRPS: boolean;
    function iniciaNFSE(TentarProvedorAntigoSeAtivo: Boolean = False): boolean;
    function EnviarNFSEAC: boolean;
    function VerificaRetornoAC(metodo: EMetodoNFSe): boolean;
    function sigiss_EnviarNFSE: Boolean;
    function sigiss_CancelarNFSE(ANota: Integer): Boolean;
    function sigiss_ConsultarNFSE(ANota: Integer): Boolean;
    function sigiss_GravarDocEletronico: Boolean;
    function sigiss_LoadDocEletronico(Arps: Integer): TCollection_DocNFSe;
    function sigiss_getUrlWS: string; overload;
    function sigiss_getUrlWS(Aamb_prod: Boolean): string; overload;
    function sigiss_setNFetoACBr(Anfs: TACBrNFSeX): Boolean;
    function sigiss_retearDadosRecebidosNFSe(ADadosNota: tcDadosNota; Arps: Integer): Boolean;
    function sigiss_getListRepErrosWS(ADescricaoErros: tcDescricaoErros): TStrings;

    // Métodos para uso da DLL Flexdocs tiveram que ser adaptados para aceitar acbrnfse com o parâmetro vflag
    function enviarRPS(vos: integer): boolean;
    function montarTXT(vflag: integer): boolean;
    function GerarRPS(): boolean;
    Function EnviaWebService(): boolean;
    function VerificaRetornoWs(vmsg: Widestring): boolean;
    function gravaRetornoWs(AXML: string = ''): boolean;
    function gravaProtocoloWs: boolean;

    function verificarerros(componente: EComponente): boolean;
    function Deixarapenasumnivel(venv: string): Widestring;
    function ConsultaDireta(vflag: integer): boolean;
    function ConsultadiretaporRPS(): boolean;
    function consultaPorRPS: Widestring;
    function ConsultaNFSe: WideString;
    function verloteexist: boolean;
    function salvarxmlNFSe: boolean;
    function DetalhesRPS(vtp: integer): boolean;
    function abrirRPSDireto: boolean;
    procedure mostrarmensagem(vmens: string);
    function imprimedireto(vflag: integer): boolean;
    procedure imprimirRPSNFSe(vtp: integer);
    procedure acrescentaendACimp;
    function NFSeregimetrib(vregime: integer): string;
    function NFSNatop(vnatop: integer): string;
    function NFSSimples(vtipo: integer): string;
    function pesqOsNFSe(vnos: integer): boolean;
    function pesqprot(vnos: integer): boolean;
    procedure retirarnprot;
    procedure LimparRpsSelecionado();
    function salvarPDF: boolean;
    function getArquivosBoletoParaAnexos(AidDoc: Integer = 0): TStrings; override;
    function getArquivosNFSeParaAnexos(AloadXML: Boolean = False): TStrings;
    function enviaemailNFSe(vflag: integer; AAnexos: TStrings = nil; AloadXML: Boolean = False): boolean;
    function verificarGARANTIA(vos: integer; pUsarGravado: Boolean = True): boolean;
    procedure zerarAtributos;
    procedure pegadadosRPS;
    function cancelaNFSe(): boolean;
    function cancelawebservice(out XMLCanc: string): boolean;
    function verificapendRPS: boolean;
    function TentarValidarCancelamentoPersonalizado(out AResult: Boolean): Boolean;
    function StrTonumero(var ok: boolean; const s: string; const AString:array of string; const AEnumerados: array of variant): variant;
    function trocaPontoporVirgula(valor: string): string;
    function buscaSiglaest(vcodest: integer): string;
    function rCampo(const Tipo: string; TAG: string): variant;
    function TZero(valor: currency; tam: integer): string;
    procedure FrStatusShowNFSe(Sender: TObject); virtual;
    procedure vercidadeNFSe;
    function getDiscriminacaoServicos(ACodRps: Integer; Acodtpservico: string; AValorNF: Double): string;
    procedure ObterAliquotasRetencao( const CLC116: string; var AliqPIS, ALiqCofins, AliqCSLL: Currency );
    function GetListaRegimeEspecialTributacao(): string;

    property Arquivo: Ansistring read FArquivo write FArquivo;
    property Grupo: Ansistring read FGrupo write FGrupo;
    property protoloco: string read Fprotoloco write Fprotoloco;
    property dataEnvio: Tdate read FdataEnvio write FdataEnvio;
    property datacanc: Tdate read Fdatacanc write Fdatacanc;
    property ListaErros: Widestring read FListaErros write FListaErros;
    property numeroNFSe: string read FnumeroNFSe write FnumeroNFSe;
    property codigover: string read Fcodigover write Fcodigover;
    property discrimina: string read Fdiscrimina write Fdiscrimina;
    property DataEmissaoNFSe: TdateTime read FDataEmissaoNFSe write FDataEmissaoNFSe;
    property outrasinf: Widestring read Foutrasinf write Foutrasinf;
    property CodigoCnae: string read FCodigoCnae write FCodigoCnae;
    property RpsNFSe: string read FRpsNFSe write FRpsNFSe;
    property nomecliente: string read Fnomecliente write Fnomecliente;
    property DhDesativacaoModuloLegado: TDateTime read FDhDesativacaoModuloLegado;
    var
     vospesq,vcodigocancnfse,vdesccancnfse: String;
     osselec: TClientDataSet;
     BuscasMnt: TClientDataSet;
     vden: string;
  end;

  TClssEmpresaHelper = class helper for TClssEmpresa
  public
    function IsValadaresComSigISS: Boolean; overload;
    function IsValadaresComSigISS(const DataDoc: TDateTime): Boolean; overload;
  end;

implementation

{ TClasstribcid }

uses
  Winapi.Windows,
  Vcl.Dialogs,
  IdHashMessageDigest,
  System.Math,
  System.StrUtils,
  System.DateUtils,
  System.Generics.Collections,
  System.IOUtils,
  REST.Json,
  MaskUtils,
  pcnConversao,
  BHISS.GravarXml,
  ACBrNFSeXProviderManager,
  ACBrNFSeXWebserviceBase,
  ACBrNFSeXWebservicesResponse,
  ACBrDFeSSL,
  ACBrMail,
  UDtmHwNFE,
  ufrmStatus,
  UstatusNFSe,
  UmostrarErros,
  hw_utils,
  hw_win_utils,
  HelperDFe,
  IniFIles
  , Query_OOP, HelperTags;

type
  TErrosNFSeWSHelper = record helper for TErrosNFSeWS
  public
    function ToString(): string;
    function RemoverViaCodigo(const ACodig: string): Integer;
    procedure Clear();
  end;

const
  VERSAO_NFSE_HW = 'HwNFSe.v1.00';

{ TErrosNFSeWSHelper }

procedure TErrosNFSeWSHelper.Clear;
var
  I : Integer;
  itemErro: TErroNFSeWS;
begin
  for I := Low(Self) to High(Self) do
  begin
    itemErro := Self[I];
    FreeAndNil( itemErro );
  end;

  Self := [];
end;

function TErrosNFSeWSHelper.RemoverViaCodigo(const ACodig: string): Integer;
var
  I, iFound : Integer;
  itemErro: TErroNFSeWS;
  ALength: Cardinal;
begin
  Result := 0;

  repeat

    iFound := -1;

    for I := Low(Self) to High(Self) do
    begin
      itemErro := Self[I];

      if itemErro.Codigo = ACodig then
        iFound := I;
    end;

    if iFound > -1 then
    begin
      for I := iFound + 1 to Length(Self) - 1 do
        Self[I - 1] := Self[I];

      SetLength(Self, Length(Self) - 1);
    end;

  until
    iFound = -1;
end;

function TErrosNFSeWSHelper.ToString(): string;
var
  I : Integer;
  itemErro: TErroNFSeWS;
begin
  Result := '';

  for I := Low(Self) to High(Self) do
  begin
    itemErro := Self[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          itemErro.Metodo, sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Mensagem, sLineBreak,
                          'Correção: ' + itemErro.Correcao]);
  end;
end;

{ TClasstribcid }

procedure TClasstribcid.copiarschemas(tpAmb: string);
var
  vListaArquivos: TStrings;
  I: Integer;
begin
  if fPathSh = '' then
    Exit;

  vListaArquivos := TStringList.Create;
  try

    localizarArquivos(fPathSh, '*.xsd', vListaArquivos);

    fPathSis := ExtractFilePath(Application.ExeName) + 'schemasNFSe\';

    for I := 0 to vListaArquivos.Count - 1 do
      //if UpperCase(MD5Print(MD5File(vListaArquivos[i]))) <> UpperCase(MD5Print(MD5File(fPathSis + ExtractFileName(vListaArquivos[i]))))   then
      if UpperCase(getMd5File(vListaArquivos[i])) <> UpperCase(getMd5File(fPathSis + ExtractFileName(vListaArquivos[i]))) then
        CopyFile(PWideChar(vListaArquivos[i]), PWideChar( fPathSis + ExtractFileName(vListaArquivos[i])), False);

  finally
    vListaArquivos.Free;
  end;
end;

constructor TClasstribcid.create;
begin

end;

destructor TClasstribcid.destroy;
begin

  inherited;
end;


function TClasstribcid.getMd5File(AFileName: string): string;
var
  IdMD5: TIdHashMessageDigest5;
  FS: TFileStream;
begin
  if not FileExists(AFileName) then
    Exit('');
  IdMD5 := nil;
  FS := nil;
  try
    IdMD5 := TIdHashMessageDigest5.Create;
    FS := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
    Result := IdMD5.HashStreamAsHex(FS);
  finally
    FS.Free;
    IdMD5.Free;
  end;
end;

function TClasstribcid.GetPathSchemas: string;
begin
  Result := IniConf.ReadStr(Format('NFSe_%s', [Self.ibgeId]), 'PathSchemas').Trim();
end;

procedure TClasstribcid.HandleValuesBeforePrint(var nfse: TACBrNFSeX;
  nfs: TClassNfe);
begin

end;

procedure TClasstribcid.localizarArquivos(pPath, pFilter: string; pLista: TStrings);
var
   Rec  : TSearchRec;
   Path : string;
begin
  Path := IncludeTrailingBackslash(pPath);
  if FindFirst(Path + pFilter, faAnyFile - faDirectory, Rec) = 0 then
   try
     repeat
       pLista.Add(Path + Rec.Name);
     until FindNext(Rec) <> 0;
   finally
     System.SysUtils.FindClose(Rec);
   end;

// recursivo
//  if FindFirst(Path + '*.*', faDirectory, Rec) = 0 then
//   try
//     repeat
//      if ((Rec.Attr and faDirectory) <> 0)  and (Rec.Name<>'.') and (Rec.Name<>'..') then
//       localizarArquivos(Path + Rec.Name, pFilter, pLista);
//     until FindNext(Rec) <> 0;
//   finally
//     SysUtils.FindClose(Rec);
//   end;
end;

function TClasstribcid.montarRPSAC(var vacbrnfse1: TACBrNFSeX;
  vnotanfs: TClassNfe): boolean;
var
 vobsos: AnsiString;
 vden: String;
 vunidades: string;
 vquantserv, vlTmpValorISS: currency;
  vRoundMode: TFPURoundingMode;
 tpRetPC: TtpRetPisCofins;
 pAliqPIS, pALiqCofins, pAliqCSLL: Currency;
begin
  //igual a de TO
  vacbrnfse1.NotasFiscais.Clear;
  with vacbrnfse1 do
  begin
    NotasFiscais.NumeroLote:='1';
    NotasFiscais.Transacao := True;

    with NotasFiscais.New.NFSe do
    begin
      verAplic := VERSAO_NFSE_HW;

      IdentificacaoRps.Numero := FormatFloat('#########0', (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger);

      if (vacbrnfse1.Configuracoes.Geral.Provedor = proISSDigital) then
        IdentificacaoRps.Serie := 'E'
      else
        IdentificacaoRps.Serie := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring;

      IdentificacaoRps.Tipo := trRPS;

      DataEmissao := Now;
      Competencia := DataEmissao;
      NaturezaOperacao := no1;//noTributacaoNoMunicipio;
      RegimeEspecialTributacao := vacbrnfse1.Provider.
      StrToRegimeEspecialTributacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
      OptanteSimplesNacional := vacbrnfse1.Provider.
      StrToSimNao(Ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));
      IncentivadorCultural := vacbrnfse1.Provider.
      StrToSimNao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));
      if (vacbrnfse1.Configuracoes.WebServices.Ambiente =  taProducao) then
        Producao := snSim
      else
        Producao :=snNao;
      StatusRps := srNormal;
      OutrasInformacoes := 'Pagamento a Vista';

      if OptanteSimplesNacional <> TnfseSimNao.snSim then
        OptanteSN := TOptanteSN.osnNaoOptante
      else if RegimeEspecialTributacao = TnfseRegimeEspecialTributacao.retMicroempresarioIndividual then
        OptanteSN := TOptanteSN.osnOptanteMEI
      else
        OptanteSN := TOptanteSN.osnOptanteMEEPP;

      Servico.Valores.ValorServicos          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

      Servico.Valores.ValorServicos := StrToFloatDef(  FormatFloat('0.00', Servico.Valores.ValorServicos), Servico.Valores.ValorServicos);
      vlTmpValorISS := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;

      try

        vRoundMode := GetRoundMode;
        SetRoundMode(rmUp);

        servico.Valores.ValorIss               := SimpleRoundTo(vlTmpValorISS, -2);
        servico.valores.Aliquota               :=(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat;

      finally
       SetRoundMode(vRoundMode);
      end;
      Servico.Valores.ValorDeducoes          := 0.00;
      Servico.Valores.ValorPis               := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency;
      Servico.Valores.ValorCofins            := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency;
      Servico.Valores.ValorInss              := 0.00;
      Servico.Valores.ValorIr                := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency;
      Servico.Valores.ValorCsll              := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

      {$REGION 'Tipo Retencao PISCOFINS'}
      if (Servico.Valores.ValorPis > 0) and (Servico.Valores.ValorCofins > 0) and (Servico.Valores.ValorCsll > 0) then
        tpRetPC := TtpRetPisCofins.trpiscofinscsllRetido

      else if (Servico.Valores.ValorPis > 0) and (Servico.Valores.ValorCofins > 0) and (Servico.Valores.ValorCsll = 0)then
        tpRetPC := TtpRetPisCofins.trpiscofinsRetidocsllNaoRetido

      else if (Servico.Valores.ValorPis > 0) and (Servico.Valores.ValorCofins = 0) and (Servico.Valores.ValorCsll = 0)then
        tpRetPC := TtpRetPisCofins.trPisRetidoCofinsCsllNaoRetido

      else if (Servico.Valores.ValorPis = 0) and (Servico.Valores.ValorCofins > 0) and (Servico.Valores.ValorCsll = 0)then
        tpRetPC := TtpRetPisCofins.trCofinsRetidoPisCsllNaoRetido

      else if (Servico.Valores.ValorPis = 0) and (Servico.Valores.ValorCofins > 0) and (Servico.Valores.ValorCsll > 0)then
        tpRetPC := TtpRetPisCofins.trCofinsCsllRetidoPisNaoRetido

      else if (Servico.Valores.ValorPis = 0) and (Servico.Valores.ValorCofins = 0) and (Servico.Valores.ValorCsll > 0)then
        tpRetPC := TtpRetPisCofins.trCsllRetidoPisCofinsNaoRetido

      else if (Servico.Valores.ValorPis > 0) and (Servico.Valores.ValorCofins = 0) and (Servico.Valores.ValorCsll > 0)then
        tpRetPC := TtpRetPisCofins.trPisCsllRetidoCofinsNaoRetido

      else
        tpRetPC := TtpRetPisCofins.trpiscofinscsllNaoRetido; // trpcRetido, trpcNaoRetido,
      {$ENDREGION}

      if (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfse_nacional').AsInteger <> 1 then
      begin
        (vnotanfs as TClassNfSe).ObterAliquotasRetencao(
          (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NFS_SERVICO_TS').AsString,
          pAliqPIS, pALiqCofins, pAliqCSLL );

        Servico.Valores.tribFed.tpRetPisCofins := tpRetPC;

        if (Servico.Valores.ValorPis > 0) or (Servico.Valores.ValorCofins > 0) then
        begin
          Servico.Valores.tribFed.vBCPisCofins := 0;
          Servico.Valores.tribFed.pAliqPis := pAliqPIS;
          Servico.Valores.tribFed.pAliqCofins := pALiqCofins;
          Servico.Valores.tribFed.CST := ACBrNFSeXConversao.TCST.cst01;
        end
        else if OptanteSimplesNacional <> TnfseSimNao.snSim then
        begin
          Servico.Valores.tribFed.pAliqPis := vnotanfs.cadempresa.dataSet.FieldByName('pis_emp').AsFloat;
          Servico.Valores.tribFed.pAliqCofins := vnotanfs.cadempresa.dataSet.FieldByName('cofins_emp').AsFloat;
          if (Servico.Valores.tribFed.pAliqPis > 0) or (Servico.Valores.tribFed.pAliqCofins > 0) then
          begin
            Servico.Valores.tribFed.vBCPisCofins := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency;
            Servico.Valores.tribFed.CST := ACBrNFSeXConversao.TCST.cst01;
          end
          else
            Servico.Valores.tribFed.CST := ACBrNFSeXConversao.TCST.cst00;
        end
        else
          Servico.Valores.tribFed.CST := ACBrNFSeXConversao.TCST.cst00;
      end;

      case (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger of
        1: Servico.Valores.IssRetido := TnfseSituacaoTributaria.stRetencao;
        3: Servico.Valores.IssRetido := TnfseSituacaoTributaria.stSubstituicao;
      else
        Servico.Valores.IssRetido := TnfseSituacaoTributaria.stNormal;
      end;

      if Servico.Valores.IssRetido = stRetencao then
       Servico.Valores.ValorIssRetido:=(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency
      else
       Servico.Valores.ValorIssRetido:= 0.00;

      Servico.Valores.OutrasRetencoes        := 0.00;
      Servico.Valores.DescontoIncondicionado := 0.00;
      Servico.Valores.DescontoCondicionado   := 0.00;

      if (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfse_nacional').AsInteger = 1 then
      begin
        Servico.Valores.totTrib.indTotTrib := TindTotTrib.indSim;
        Servico.Valores.totTrib.pTotTribFed :=
          vnotanfs.cadempresa.dataSet.FieldByName('pis_emp').AsFloat +
          vnotanfs.cadempresa.dataSet.FieldByName('cofins_emp').AsFloat;

        if Servico.Valores.IssRetido = stRetencao then
        begin
          Servico.Valores.tribMun.tpRetISSQN := TtpRetISSQN.trRetidoPeloTomador;
          //Servico.Valores.Aliquota.pAliq := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat / 100;
          Servico.Valores.tribMun.pAliq := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat;
        end
        else
          Servico.Valores.totTrib.pTotTribMun := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat;
        //if OptanteSimplesNacional = TnfseSimNao.snSim then
          //Servico.Valores.totTrib.pTotTribSN := vnotanfs.cadempresa.ffloat('simples_emp');
      end;

      if (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfse_nacional').AsInteger = 1 then
      begin
        Servico.ItemListaServico          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ctribnac').AsString;
        Servico.CodigoTributacaoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ctribmun').AsString;
      end
      else
      begin
        Servico.ItemListaServico          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString;
        servico.CodigoCnae                := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7);
        Servico.CodigoTributacaoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString;
        Servico.CodigoServicoNacional     := FormatMaskText('99.99.99;0', (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ctribnac').AsString);
      end;
      servico.CodigoNBS                 := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnbs').AsString;
      vobsos:='';

      vden := (vnotanfs as TClassNfSe).getDiscriminacaoServicos(StrToInt(IdentificacaoRps.Numero), (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NFS_SERVICO_TS').AsString, Servico.Valores.ValorServicos);
      {
      vRemoverEnterOBS_OS := False;
      try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
      except
       vRemoverEnterOBS_OS := False;
      end;

      (vnotanfs as TClassNfSe).buscaadc.close;
      (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
      ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
      ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
      (vnotanfs as TClassNfSe).buscaadc.open;
      while not (vnotanfs as TClassNfSe).buscaadc.eof do
      begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
        else
          vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
        (vnotanfs as TClassNfSe).buscaadc.next;
      end;
      if vRemoverEnterOBS_OS then
      begin
        vobsos:=Trim(StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]));
        vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
        if Copy(vobsos, Length(vobsos), 1) = ',' then
          System.Delete(vobsos, Length(vobsos), 1);
      end;
      (vnotanfs as TClassNfSe).buscaadc.close;
      (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
      ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
      (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
      (vnotanfs as TClassNfSe).buscaadc.open;
      vobsos:=StringReplace(vobsos, #13#10, ';', [rfReplaceAll]);
      vden:='';
      vunidades:='';
      while not (vnotanfs as TClassNfSe).buscaadc.eof do
      begin
        vquantserv:=(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
        if vquantserv = 0 then
          vquantserv:=1;
        vunidades:=format('%n',[vquantserv])+' X '+
        format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/vquantserv])+
        '=';
        vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
        vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
        vden:=vden+'(O.S.: '+(vnotanfs as TClassNfSe).StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
        if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
         vden:=vden+',';
        (vnotanfs as TClassNfSe).buscaadc.next;
      end;
      vden:=vden+';';
      vden:=vden+'----------------;';
      vden:=vden+vobsos;
      vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      if Pos('Fonte: IBPT', vden) = 0 then
      begin
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.SQL.Text :=
         'select aliqnac from TIPOSERVICONFSE' +
         ' where COD_TPSERVICO = ' + (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico_ts').AsString.QuotedString();
       (vnotanfs as TClassNfSe).buscaadc.Open;
       if (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat > 0 then
       begin
         if vRemoverEnterOBS_OS then
           vden := vden + ','
         else
           vden := vden + ';';
         vden := vden + 'Val Aprox Tributos R$' + Format('%0.2n', [Servico.Valores.ValorServicos *
           (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
           ' (' + Format('%0.2f', [(vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat]) +
           '%) Fonte: IBPT';
       end;
      end;
      }

      (vnotanfs as TClassNfSe).vden:=vden;
      Servico.Discriminacao             := vden;
      Servico.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);
      Servico.ExigibilidadeISS := exiExigivel;
      Servico.MunicipioIncidencia := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;

      Prestador.IdentificacaoPrestador.Cnpj := vnotanfs.cadempresa.fstrNotEsp('CGC_EMP');
      Prestador.Endereco.CodigoMunicipio    := vnotanfs.strzero(vnotanfs.cadempresa.fint('IBGE_COD_CIDADE'), 7);

      if (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfse_nacional').AsInteger = 1 then
      begin
        if (vnotanfs as TClassNfSe).ConfSis.ReadString(FibgeId, 'EnviarInscricaoMunicipal') = 'S' then
          Prestador.IdentificacaoPrestador.InscricaoMunicipal := vnotanfs.cadempresa.fstrNotEsp('IM_EMP');
      end
      else
      begin
        Prestador.IdentificacaoPrestador.InscricaoMunicipal := vnotanfs.cadempresa.fstrNotEsp('IM_EMP');
        Prestador.RazaoSocial                               := StringReplace(vnotanfs.cadempresa.fstrNotEsp('NOME_EMP'), '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      end;

      Tomador.IdentificacaoTomador.CpfCnpj            := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString;
      if trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString) <> '' then
        Tomador.IdentificacaoTomador.InscricaoMunicipal := trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);

      Tomador.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

      Tomador.Endereco.Endereco        := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Numero          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Complemento     := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Bairro          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString;
      Tomador.Endereco.UF              := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString;
      Tomador.Endereco.CEP             := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString;
      Tomador.Endereco.xPais           := 'BRASIL';
      Tomador.Contato.Telefone := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString;

      Tomador.Contato.Email    := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

      var emailList := Tomador.Contato.Email.Split([';', ',', ' ', '/', '\', '|', ':', '!', '#', '$', '%', '¨', '&', '*']);

      if Length(emailList) > 0 then
        Tomador.Contato.Email := emailList[0];

      if (vacbrnfse1.Configuracoes.Geral.Provedor = proBHISS)
       then // de acordo consulta da LUZ BH com a Prefeitura de Belo Horizonte o correto de uma aliquota de 5% é 0.05 conforme manual da prefeitura
       if (not TNFSeW_BHISS.Create(TACBrNFSeXProviderManager.GetProvider(vacbrnfse1)).DivAliq100) then
         raise Exception.Create('Provedor BHISS exige aliquota no formato divido por 100. Atualmente não está configurado. Contacte a HW Sistemas para correção');

      //Testes padrao nacional
      if (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfse_nacional').AsInteger = 1 then
      begin
        if OptanteSimplesNacional <> TnfseSimNao.snSim then
          Servico.Valores.tribMun.pAliq := 0; // Para evitar o erro E0617
      end;

    end;
  end;
end;

{ TClasstribcidGV }

procedure TClasstribcidGV.copiarschemas(tpAmb: string);
var
  vListaArquivos: TStrings;
  vPathSh, vPathSis : string;
  I: Integer;
begin
  if Copy(tpAmb, 1, 1) = 'H' then
    vPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\Actcon\valadares\hom'
  else if Copy(tpAmb, 1, 1) = 'P' then
    vPathSis := ExtractFilePath(Application.ExeName) + 'schemasNFSe\Actcon\valadares\pro';

  inherited;
end;

constructor TClasstribcidGV.create;
begin

  inherited;
end;

destructor TClasstribcidGV.destroy;
begin

  inherited;
end;



function TClasstribcidGV.sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps;
var
  vden: string;
  AValor: Double;
  Aemails: TStrings;
begin
  Result := tcDescricaoRps.Create;

  with Result do
  begin
    ccm                 := Anfs.cadempresa.dataSet.FieldByName('IM_EMP').AsString.
                             Replace('.', '', [rfReplaceAll]).
                             Replace('-', '', [rfReplaceAll]);
    cnpj                := Anfs.cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
    senha               := decodifica(Anfs.cadempresa.dataSet.FieldByName('LICENCANFSE').AsString);

    Anfs.SqlOpen('select contador.crc, estados.sigla_uf from contador' +
                 ' left join estados on estados.codigo_uf = contador.codigo_uf' +
                 ' where contador.cod_contador = ' + Anfs.cadempresa.dataSet.FieldByName('cod_contador').AsInteger.ToString +
                 ' and contador.cod_empresa = ' + Anfs.cadempresa.codempresa.ToString);

    crc              := Anfs.apenasNumeros(Anfs.buscas.FieldByName('crc').AsString.Trim);//, 0);
    crc_estado       := Anfs.buscas.FieldByName('sigla_uf').AsString.Trim;

    aliquota_simples    := IfThen(Anfs.cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger <> 1,
                                  '', Format('%0.2f', [Anfs.buscasmnt.FieldByName('ALIQ_ISS').AsFloat]));

    id_sis_legado       := Anfs.buscasmnt.FieldByName('COD_RPS').AsInteger.ToString;
    servico             := StrToIntDef(Anfs.buscasmnt.FieldByName('nfs_servico').AsString.Replace('.', '', [rfReplaceAll]), 0);
    situacao            := IfThen(Anfs.buscasmnt.FieldByName('ISS_RETIDO').AsInteger = 1, 'tt', 'tp');
    AValor              := Anfs.BuscasMnt.FieldByName('VALOR').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency +
                           Anfs.BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;
    valor               := Format('%0.2f', [AValor]);
    base                := valor;
    descricaoNF         := Anfs.getDiscriminacaoServicos(StrToInt(id_sis_legado), Anfs.buscasmnt.FieldByName('nfs_servico').AsString, AValor);
    tomador_tipo        := IfThen( Length(Anfs.buscasmnt.FieldByName('cpfcgc').AsString.Trim) = 11, 2) +
                           IfThen( Length(Anfs.buscasmnt.FieldByName('cpfcgc').AsString.Trim) = 14,
                                   IfThen( Anfs.cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsInteger = Anfs.buscasmnt.FieldByName('ibge_cod_cidade').AsInteger,
                                           3, 4)
                                 );
    Aemails             := Anfs.GetListaEmails(Anfs.buscasmnt.FieldByName('email').AsString.Trim);
    if Assigned(Aemails) then
      if Aemails.Count > 0 then
        tomador_email   := Aemails[0];

    tomador_cnpj        := Anfs.buscasmnt.FieldByName('cpfcgc').AsString.Trim;
    tomador_ie          := Anfs.buscasmnt.FieldByName('insc_est').AsString.Trim;
    tomador_im          := Anfs.buscasmnt.FieldByName('insc_municipal').AsString.Trim;
    tomador_razao       := Anfs.buscasmnt.FieldByName('razao').AsString.Trim;
    tomador_fantasia    := Anfs.buscasmnt.FieldByName('nome_cliente').AsString.Trim;
    tomador_endereco    := Anfs.buscasmnt.FieldByName('endereco').AsString.Trim;
    tomador_numero      := Anfs.buscasmnt.FieldByName('num_end_cliente').AsString.Trim;
    tomador_complemento := Anfs.buscasmnt.FieldByName('complemento').AsString.Trim;
    tomador_bairro      := Anfs.buscasmnt.FieldByName('bairro').AsString.Trim;
    tomador_CEP         := Anfs.buscasmnt.FieldByName('cep').AsString.Trim;
    tomador_cod_cidade  := Anfs.buscasmnt.FieldByName('ibge_cod_cidade').AsString.Trim;
    tomador_fone        := Anfs.buscasmnt.FieldByName('fone_cliente').AsString.Trim;
    tomador_ramal       := '';
    tomador_fax         := Anfs.buscasmnt.FieldByName('fax').AsString.Trim;
    //rps_num             := Anfs.buscasmnt.FieldByName('cod_rps').AsInteger;//o webservice não aceita
    rps_serie           := Anfs.cadempresa.dataSet.FieldByName('serie_serv_nfe').AsInteger.ToString;
    rps_dia             := DayOf(Now);
    rps_mes             := MonthOf(Now);
    rps_ano             := YearOf(Now);
    //outro_municipio     :=
    //cod_outro_municipio :=
    retencao_iss        := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('issret_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    pis                 := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('pisrf_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    cofins              := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('cofinsrf_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    inss                := Format('%0.02f', [0.00]).Replace('.', ',', [rfReplaceAll]);
    irrf                := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('irrf_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    csll                := Format('%0.02f', [Anfs.BuscasMnt.FieldByName('csslrf_servico').AsFloat]).Replace('.', ',', [rfReplaceAll]);
    tipo_obra           := IfThen(servico = 702, Anfs.BuscasMnt.FieldByName('tipo_obra_nfse').AsInteger);
    //dia_emissao         :=;
    //mes_emissao         :=;
    //ano_emissao         :=;
  end;
end;

function TClasstribcidGV.montarRPSAC(var vacbrnfse1: TACBrNFSeX; vnotanfs: TClassNfe): boolean;
var
 vobsos: AnsiString;
 vden: String;
 vunidades: string;
 vquantserv: currency;
  vRoundMode: TFPURoundingMode;
 vlTmpValorISS: Double;
begin
 vacbrnfse1.NotasFiscais.Clear;
 with vacbrnfse1 do
  begin
   NotasFiscais.NumeroLote:='1';
   NotasFiscais.Transacao := True;
//  for i := 0 to 1 do
  begin

    with NotasFiscais.New.NFSe do
    begin
     IdentificacaoRps.Numero := FormatFloat('#########0', (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger);
//      IdentificacaoRps.Numero := FormatFloat('#########0', i+1);

     // Para o provedor ISS.NET em ambiente de Homologação mudar a série para '8'
     IdentificacaoRps.Serie := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring;

     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     IdentificacaoRps.Tipo := trRPS;

     DataEmissao := Now;

     // TnfseNaturezaOperacao = ( noTributacaoNoMunicipio, noTributacaoForaMunicipio, noIsencao, noImune, noSuspensaDecisaoJudicial, noSuspensaProcedimentoAdministrativo );

     NaturezaOperacao := no1;//noTributacaoNoMunicipio;
//     NaturezaOperacao := noTributacaoNoMunicipio51;

     // TnfseRegimeEspecialTributacao = ( retNenhum, retMicroempresaMunicipal, retEstimativa, retSociedadeProfissionais, retCooperativa, retMicroempresarioIndividual, retMicroempresarioEmpresaPP );
//     RegimeEspecialTributacao := retNenhum;
     RegimeEspecialTributacao := vacbrnfse1.Provider.
     StrToRegimeEspecialTributacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
     //retMicroempresarioEmpresaPP;

     // TnfseSimNao = ( snSim, snNao );
     OptanteSimplesNacional := vacbrnfse1.Provider.
     StrToSimNao(Ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));

     // TnfseSimNao = ( snSim, snNao );
     IncentivadorCultural := vacbrnfse1.Provider.
     StrToSimNao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));

     // TnfseSimNao = ( snSim, snNao );
     // snSim = Ambiente de Produção
     // snNao = Ambiente de Homologação
     if (vacbrnfse1.Configuracoes.WebServices.Ambiente = taProducao) then
       Producao := snSim
     else
       Producao :=snNao;

     // TnfseStatusRPS = ( srNormal, srCancelado );
     StatusRps := srNormal;

     // Somente Os provedores Betha, FISSLex e SimplISS permitem incluir no RPS
     // a TAG: OutrasInformacoes os demais essa TAG é gerada e preenchida pelo
     // WebService do provedor.
     OutrasInformacoes := 'Pagamento a Vista';

     (* Usando quando o RPS for substituir outro
     RpsSubstituido.Numero := FormatFloat('#########0', i);
     RpsSubstituido.Serie  := 'UNICA';
     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     RpsSubstituido.Tipo   := trRPS;
     *)

     Servico.Valores.ValorServicos          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

     Servico.Valores.ValorServicos := StrToFloatDef(  FormatFloat('0.00', Servico.Valores.ValorServicos), Servico.Valores.ValorServicos);
     vlTmpValorISS := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;

     try

//     vRoundMode := GetRoundMode;
//     SetRoundMode(rmUp);

     servico.Valores.ValorIss               := SimpleRoundTo(vlTmpValorISS, -2);
//     servico.Valores.ValorIss               := StrToFloatDef(  FormatFloat('0.00', vlTmpValorISS), vlTmpValorISS);
//     servico.Valores.ValorIss               := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;
     servico.valores.Aliquota               :=(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat/100;

     finally
//       SetRoundMode(vRoundMode);
     end;
     Servico.Valores.ValorDeducoes          := 0.00;
     Servico.Valores.ValorPis               := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency;
     Servico.Valores.ValorCofins            := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency;
     Servico.Valores.ValorInss              := 0.00;
     Servico.Valores.ValorIr                := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency;
     //0.00;
     Servico.Valores.ValorCsll              := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

     // TnfseSituacaoTributaria = ( stRetencao, stNormal, stSubstituicao );
     // stRetencao = snSim
     // stNormal   = snNao

     // Neste exemplo não temos ISS Retido ( stNormal = Não )
     // Logo o valor do ISS Retido é igual a zero.
     Servico.Valores.IssRetido:= vacbrnfse1.Provider.
     StrToSituacaoTributaria(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
     if Servico.Valores.IssRetido = stRetencao then
       Servico.Valores.ValorIssRetido:=(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency
       //servico.Valores.ValorIss
     else
       Servico.Valores.ValorIssRetido:= 0.00;

     Servico.Valores.OutrasRetencoes        := 0.00;
     Servico.Valores.DescontoIncondicionado := 0.00;
     Servico.Valores.DescontoCondicionado   := 0.00;

//     Servico.Valores.BaseCalculo := Servico.Valores.ValorServicos -
//                                    Servico.Valores.ValorDeducoes -
//                                    Servico.Valores.DescontoIncondicionado;

     // No caso do provedor Ginfes devemos informar a aliquota já dividida por 100
     // para outros provedores devemos informar por exemplo 3, mas ao fazer o calculo
     // do valor do ISS devemos dividir por 100

{    Servico.Valores.Aliquota    := 2;}

     // Valor do ISS calculado multiplicando-se a base de calculo pela aliquota
{    ValorISS := Servico.Valores.BaseCalculo * Servico.Valores.Aliquota;}

     // A função RoundTo5 é usada para arredondar valores, sendo que o segundo
     // parametro se refere ao numero de casas decimais.
     // exemplos: RoundTo5(50.532, -2) ==> 50.53
     // exemplos: RoundTo5(50.535, -2) ==> 50.54
     // exemplos: RoundTo5(50.536, -2) ==> 50.54

{    Servico.Valores.ValorIss       := RoundTo5(ValorISS, -2);

     Servico.Valores.ValorLiquidoNfse := Servico.Valores.ValorServicos -
                                         Servico.Valores.ValorPis -
                                         Servico.Valores.ValorCofins -
                                         Servico.Valores.ValorInss -
                                         Servico.Valores.ValorIr -
                                         Servico.Valores.ValorCsll -
                                         Servico.Valores.OutrasRetencoes -
                                         Servico.Valores.ValorIssRetido -
                                         Servico.Valores.DescontoIncondicionado -
                                         Servico.Valores.DescontoCondicionado;}


     Servico.ItemListaServico         := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString;
     servico.CodigoCnae               := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7);

     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo CNAE tem que ser '6511102'
     // Servico.CodigoCnae                := '123'; // Informação Opcional
     Servico.CodigoTributacaoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString;
     vobsos:='';

     vden := (vnotanfs as TClassNfSe).getDiscriminacaoServicos(StrToInt(IdentificacaoRps.Numero), Servico.ItemListaServico, Servico.Valores.ValorServicos);
     {
     vRemoverEnterOBS_OS := False;
     try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
     except
       vRemoverEnterOBS_OS := False;
     end;

     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
     ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
     (vnotanfs as TClassNfSe).buscaadc.open;
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
      else
      vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
      (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     if vRemoverEnterOBS_OS then
     begin
       vobsos:=Trim(StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]));
       vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
       if Copy(vobsos, Length(vobsos), 1) = ',' then
         System.Delete(vobsos, Length(vobsos), 1);
     end;
     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
     (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
     (vnotanfs as TClassNfSe).buscaadc.open;
     vobsos:=StringReplace(vobsos, #13#10, ';', [rfReplaceAll]);
//       vobsos:=StringReplace(vobsos, #10, '|', [rfReplaceAll]);
       //vden:=RetiraCarEsp(vobsos);
     vden:='';
     //'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
     vunidades:='';
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       vquantserv:=(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
       if vquantserv = 0 then
         vquantserv:=1;
       vunidades:=format('%n',[vquantserv])+' X '+
       format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/vquantserv])+
       '=';
       vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
       vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
//         if pos(',',vospesq) > 0 then
//         begin
       vden:=vden+'(O.S.: '+(vnotanfs as TClassNfSe).StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
       if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
        vden:=vden+',';
//         end;
       (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     vden:=vden+';';
     vden:=vden+'----------------;';
     vden:=vden+vobsos;
     vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     if Pos('Fonte: IBPT', vden) = 0 then
     begin
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.SQL.Text := 'select aliqnac from TIPOSERVICONFSE where COD_TPSERVICO = ' + QuotedStr(Servico.ItemListaServico);
       (vnotanfs as TClassNfSe).buscaadc.Open;
       if (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat > 0 then
       begin
         if vRemoverEnterOBS_OS then
           vden := vden + ','
         else
           vden := vden + ';';
         vden := vden + 'Val Aprox Tributos R$' + Format('%0.2n', [Servico.Valores.ValorServicos *
           (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
           ' (' + Format('%0.2f', [(vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat]) +
           '%) Fonte: IBPT';
       end;
     end;
     }

     (vnotanfs as TClassNfSe).vden:=vden;
//     vden:=StringReplace(vden ,';', #13#10, [rfReplaceAll,rfIgnoreCase] );
     Servico.Discriminacao             := vden;


     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo do Municipio tem que ser '999'
     Servico.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);

     // Informar A Exigibilidade ISS para fintelISS [1/2/3/4/5/6/7]
     Servico.ExigibilidadeISS := exiExigivel;

     // Informar para Saatri
{     Servico.CodigoPais := 1058; // Brasil}
     Servico.MunicipioIncidencia := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;

    // Somente o provedor SimplISS permite infomar mais de 1 serviço
//     with Servico.ItemServico.Add do
//      begin
//       Descricao     := 'SERVICO 1';
//       Quantidade    := 1;
//       ValorUnitario := 1.50;
//      end;

      Prestador.IdentificacaoPrestador.Cnpj               := vnotanfs.cadempresa.fstrNotEsp('CGC_EMP');
      Prestador.IdentificacaoPrestador.InscricaoMunicipal := vnotanfs.cadempresa.fstrNotEsp('IM_EMP');
      Prestador.Endereco.CodigoMunicipio                  := vnotanfs.strzero(vnotanfs.cadempresa.fint('IBGE_COD_CIDADE'), 7);
      Prestador.RazaoSocial                               := StringReplace(vnotanfs.cadempresa.fstrNotEsp('NOME_EMP'), '&', 'E', [rfIgnoreCase, rfReplaceAll]);

     Tomador.IdentificacaoTomador.CpfCnpj            := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString;
     if trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString) <> '' then
     Tomador.IdentificacaoTomador.InscricaoMunicipal := trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);

     Tomador.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

     Tomador.Endereco.Endereco        := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Numero          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Complemento     := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Bairro          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString;
     Tomador.Endereco.UF              := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString;
     Tomador.Endereco.CEP             := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString;
     //edtEmitCEP.Text;
	 //Provedor Equiplano é obrigatório o pais e IE
     Tomador.Endereco.xPais           := 'BRASIL';
//     Tomador.IdentificacaoTomador.InscricaoEstadual := 'ISENTO';

     Tomador.Contato.Telefone := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString;
     Tomador.Contato.Email    := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

     (* Usando quando houver um intermediario na prestação do serviço
     IntermediarioServico.RazaoSocial        := 'razao';
     IntermediarioServico.CpfCnpj            := '00000000000';
     IntermediarioServico.InscricaoMunicipal := '12547478';
     *)

     (* Usando quando o serviço for uma obra
     ConstrucaoCivil.CodigoObra := '88888';
     ConstrucaoCivil.Art        := '433';
     *)
    end;

  end;
 end;

end;

function TClasstribcidGV.montartxtrps(vnotanfs: TClassNfe): string;
var
  vobsos: AnsiString;
  vden: String;
  vunidades: string;
begin
   // Governador Valadares ABRASF 2.0
   with vnotanfs do
   begin
       montalinha(0001,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger,15));
       montalinha(0016,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring);
       montalinha(0021,'1');
//       montalinha(0022,FormatDateTime('yyyy-mm-dd"T"hh:nn:ss',buscasmnt.FieldByName('emissao_rps').AsDateTime));
       montalinha(0022,FormatDateTime('yyyy-mm-dd"T"00:00:00',(vnotanfs as TClassNfSe).buscasmnt.FieldByName('emissao_rps').AsDateTime)); // preciso verificar se o padrão será sem data e hora...
       montalinha(0041,'1');
       montalinha(0063,FormatDateTime('yyyy-mm-dd',(vnotanfs as TClassNfSe).buscasmnt.FieldByName('emissao_rps').AsDateTime));
       montalinha(0073,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency,15));
       montalinha(0088,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0103,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0118,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0133,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0148,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency,15));
       montalinha(0163,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0178,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0193,(vnotanfs as TClassNfSe).Tzero(0,15));
//       if BuscasMnt.FieldByName('IBGE_COD_CIDADE').AsString <> cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString then
       if ((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger = 1) and ((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger = 1) then
        montalinha(0208,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency,3)+'00')
       else
        montalinha(0208,(vnotanfs as TClassNfSe).Tzero(0,5));

        //Tzero(0,5));
//       else
//       begin
         // if cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger <> 1 then then
        // Testar aqui se o emitente é optante de simplesnacional e retem o issqn, pois se for deverá
        // o mesmo destacar o issqn
  //       montalinha(0208,Tzero(buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100,3)+'00');
//       end;
       montalinha(0213,(vnotanfs as TClassNfSe).Tzero(0,15));
       montalinha(0228,(vnotanfs as TClassNfSe).Tzero(0,15));
//       montalinha(0243,strzero(2,1));
       montalinha(0243,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
       if (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger = 1 then
         montalinha(0244,strzero(1,1));// Colocar um teste aqui para quando for retido
       montalinha(0245,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString);
       montalinha(0250,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7));
  //     if cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Homologação' then
  //      montalinha(0295,'4320453')
  //     else
        montalinha(0257,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString);
       //montalinha(0257,cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString);
       vobsos:='';
//       if pos(',',(vnotanfs as TClassNfSe).vospesq) <= 0 then
       begin

         vRemoverEnterOBS_OS := False;
         try
           (vnotanfs as TClassNfSe).buscaadc.close;
           (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
           (vnotanfs as TClassNfSe).buscaadc.open;
           vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
         except
           vRemoverEnterOBS_OS := False;
         end;

         (vnotanfs as TClassNfSe).buscaadc.close;
         (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
         ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
         ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
         (vnotanfs as TClassNfSe).buscaadc.open;
         while not (vnotanfs as TClassNfSe).buscaadc.eof do
         begin
           if vRemoverEnterOBS_OS then
             vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
          else
          vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ||-||';
          (vnotanfs as TClassNfSe).buscaadc.next;
         end;
       end;
       if vRemoverEnterOBS_OS then
       begin
         vobsos:=StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]);
         vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
         if Copy(vobsos, Length(vobsos) - 1 , 1) = ',' then
           System.Delete(vobsos, Length(vobsos) - 1, 1);
       end;
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
       ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
       (vnotanfs as TClassNfSe).buscaadc.open;
       vobsos:=StringReplace(vobsos, #13, '|', [rfReplaceAll]);
       vobsos:=StringReplace(vobsos, #10, '|', [rfReplaceAll]);
       //vden:=RetiraCarEsp(vobsos);
       vden:='';
       vunidades:='';
       //'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
       while not (vnotanfs as TClassNfSe).buscaadc.eof do
       begin
         vunidades:=format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency])+' X '+
         format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency])+
         '=';

         vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
         vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
//         if pos(',',vospesq) > 0 then
//         begin
         vden:=vden+'(O.S.: '+StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
         if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
          vden:=vden+',';
//         end;
         (vnotanfs as TClassNfSe).buscaadc.next;
       end;
       vden:=vden+'||';
       vden:=vden+'----------------||';
       vden:=vden+vobsos;
       (vnotanfs as TClassNfSe).vden:=vden;
       montalinha(0277,copy(vden,1,2000));
  //     if cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Homologação' then
  //      montalinha(2315,'4320453')
  //     else
       montalinha(2277,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7));
       montalinha(2284,strzero(0,4));
       montalinha(2288,strzero(1,1)); // Olhar este campo de exigibilidade...
       montalinha(2289,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7));
       montalinha(2326,(vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('CGC_EMP').AsString);
       montalinha(2340,(vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IM_EMP').AsString);
       if Length(trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString)) <= 11 then
         montalinha(2355,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString)
       else
         montalinha(2366,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString);
       montalinha(2380,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);
       montalinha(2395,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString));
       montalinha(2545,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString));
       montalinha(2670,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString);
       montalinha(2680,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString));
       montalinha(2740,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString));
       montalinha(2800,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString);
       montalinha(2807,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString);
       montalinha(2813,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString);
       montalinha(2821,'0'+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString);
       montalinha(2841,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString);
       montalinha(3141,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
       montalinha(3142,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));
       montalinha(3143,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));
   end;
end;

{ TClasstribcidBH }

procedure TClasstribcidBH.copiarschemas(tpAmb: string);
begin
  fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\BHISS';
  inherited;
end;

constructor TClasstribcidBH.create;
begin

end;

destructor TClasstribcidBH.destroy;
begin

  inherited;
end;

function TClasstribcidBH.sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps;
begin
  raise Exception.Create('Nao disponível para esta cidade');
end;

function TClasstribcidBH.montarRPSAC(var vacbrnfse1: TACBrNFSeX;
  vnotanfs: TClassNfe): boolean;
var
 vobsos: AnsiString;
 vden: String;
 vunidades: string;
 vquantserv: currency;
begin
 vacbrnfse1.NotasFiscais.Clear;
 with vacbrnfse1 do
  begin
   NotasFiscais.NumeroLote:='1';
   NotasFiscais.Transacao := True;
//  for i := 0 to 1 do
  begin

    with NotasFiscais.New.NFSe do
    begin
     IdentificacaoRps.Numero := FormatFloat('#########0', (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger);
//      IdentificacaoRps.Numero := FormatFloat('#########0', i+1);

     // Para o provedor ISS.NET em ambiente de Homologação mudar a série para '8'
     IdentificacaoRps.Serie := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring;

     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     IdentificacaoRps.Tipo := trRPS;

     DataEmissao := Now;

     // TnfseNaturezaOperacao = ( noTributacaoNoMunicipio, noTributacaoForaMunicipio, noIsencao, noImune, noSuspensaDecisaoJudicial, noSuspensaProcedimentoAdministrativo );

     NaturezaOperacao :=StrToNaturezaOperacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_natop').AsInteger,1));
//     noTributacaoNoMunicipio;
//     NaturezaOperacao := noTributacaoNoMunicipio51;

     // TnfseRegimeEspecialTributacao = ( retNenhum, retMicroempresaMunicipal, retEstimativa, retSociedadeProfissionais, retCooperativa, retMicroempresarioIndividual, retMicroempresarioEmpresaPP );
//     RegimeEspecialTributacao := retNenhum;
     RegimeEspecialTributacao := vacbrnfse1.Provider.
     StrToRegimeEspecialTributacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
     //retMicroempresarioEmpresaPP;

     // TnfseSimNao = ( snSim, snNao );
     OptanteSimplesNacional := vacbrnfse1.Provider.
     StrToSimNao(Ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));

     // TnfseSimNao = ( snSim, snNao );
     IncentivadorCultural := vacbrnfse1.Provider.
     StrToSimNao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));

     // TnfseSimNao = ( snSim, snNao );
     // snSim = Ambiente de Produção
     // snNao = Ambiente de Homologação
     if (vacbrnfse1.Configuracoes.WebServices.Ambiente = taProducao) then
       Producao := snSim
     else
       Producao :=snNao;

     // TnfseStatusRPS = ( srNormal, srCancelado );
     StatusRps := srNormal;

     // Somente Os provedores Betha, FISSLex e SimplISS permitem incluir no RPS
     // a TAG: OutrasInformacoes os demais essa TAG é gerada e preenchida pelo
     // WebService do provedor.
     OutrasInformacoes := 'Pagamento a Vista';

     (* Usando quando o RPS for substituir outro
     RpsSubstituido.Numero := FormatFloat('#########0', i);
     RpsSubstituido.Serie  := 'UNICA';
     // TnfseTipoRPS = ( trRPS, trNFConjugada, trCupom );
     RpsSubstituido.Tipo   := trRPS;
     *)

     Servico.Valores.ValorServicos          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;
     Servico.Valores.BaseCalculo            := Servico.Valores.ValorServicos;
     //(vnotanfs as TClassNfSe).buscasmnt.FieldByName('valor').Ascurrency;
     servico.Valores.ValorIss               := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;
     //vnotanfs as TClassNfSe).buscasmnt.FieldByName('valor').Ascurrency*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100
//     Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;
     servico.valores.Aliquota               := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat;// atualizacao do acbr já envia com a aliquota correta / 100; //de acordo consulta da LUZ BH com a Prefeitura de Belo Horizonte o correto de uma aliquota de 5% é 0.05 conforme manual da prefeitura
     Servico.Valores.ValorDeducoes          := 0.00;
     Servico.Valores.ValorPis               := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency;
     Servico.Valores.ValorCofins            := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency;
     Servico.Valores.ValorInss              := 0.00;
     Servico.Valores.ValorIr                := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency;
     //0.00;
     Servico.Valores.ValorCsll              := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

     // TnfseSituacaoTributaria = ( stRetencao, stNormal, stSubstituicao );
     // stRetencao = snSim
     // stNormal   = snNao

     // Neste exemplo não temos ISS Retido ( stNormal = Não )
     // Logo o valor do ISS Retido é igual a zero.
     Servico.Valores.IssRetido:= vacbrnfse1.Provider.
     StrToSituacaoTributaria(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
     if Servico.Valores.IssRetido = stRetencao then
       Servico.Valores.ValorIssRetido:=(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency
       //servico.Valores.ValorIss
     else
       Servico.Valores.ValorIssRetido:= 0.00;

     Servico.Valores.OutrasRetencoes        := 0.00;
     Servico.Valores.DescontoIncondicionado := 0.00;
     Servico.Valores.DescontoCondicionado   := 0.00;


//                                    Servico.Valores.ValorDeducoes -
//                                    Servico.Valores.DescontoIncondicionado;

     // No caso do provedor Ginfes devemos informar a aliquota já dividida por 100
     // para outros provedores devemos informar por exemplo 3, mas ao fazer o calculo
     // do valor do ISS devemos dividir por 100

{    Servico.Valores.Aliquota    := 2;}

     // Valor do ISS calculado multiplicando-se a base de calculo pela aliquota
{    ValorISS := Servico.Valores.BaseCalculo * Servico.Valores.Aliquota;}

     // A função RoundTo5 é usada para arredondar valores, sendo que o segundo
     // parametro se refere ao numero de casas decimais.
     // exemplos: RoundTo5(50.532, -2) ==> 50.53
     // exemplos: RoundTo5(50.535, -2) ==> 50.54
     // exemplos: RoundTo5(50.536, -2) ==> 50.54

{    Servico.Valores.ValorIss       := RoundTo5(ValorISS, -2);

     Servico.Valores.ValorLiquidoNfse := Servico.Valores.ValorServicos -
                                         Servico.Valores.ValorPis -
                                         Servico.Valores.ValorCofins -
                                         Servico.Valores.ValorInss -
                                         Servico.Valores.ValorIr -
                                         Servico.Valores.ValorCsll -
                                         Servico.Valores.OutrasRetencoes -
                                         Servico.Valores.ValorIssRetido -
                                         Servico.Valores.DescontoIncondicionado -
                                         Servico.Valores.DescontoCondicionado;}


     Servico.ItemListaServico         := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString;
     servico.CodigoCnae               := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7);

     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo CNAE tem que ser '6511102'
     // Servico.CodigoCnae                := '123'; // Informação Opcional
     Servico.CodigoTributacaoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString;
     vobsos:='';

     vRemoverEnterOBS_OS := False;
     try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
     except
       vRemoverEnterOBS_OS := False;
     end;

     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
     ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
     (vnotanfs as TClassNfSe).buscaadc.open;
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
      else
      vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
      (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     if vRemoverEnterOBS_OS then
     begin
       vobsos:=Trim(StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]));
       vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
       if Copy(vobsos, Length(vobsos), 1) = ',' then
         System.Delete(vobsos, Length(vobsos), 1);
     end;
     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
     (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
     (vnotanfs as TClassNfSe).buscaadc.open;
     vobsos:=StringReplace(vobsos, #13#10, ';', [rfReplaceAll]);
//       vobsos:=StringReplace(vobsos, #10, '|', [rfReplaceAll]);
       //vden:=RetiraCarEsp(vobsos);
     vden:='';
     vunidades:='';
     //'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       vquantserv:=(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
       if vquantserv = 0 then
         vquantserv:=1;
       vunidades:=format('%n',[vquantserv])+' X '+
       format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/vquantserv])+
       '=';
       vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
       vunidades+
       format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
//         if pos(',',vospesq) > 0 then
//         begin
       vden:=vden+'(O.S.: '+(vnotanfs as TClassNfSe).StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
       if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
        vden:=vden+',';
//         end;
       (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     vden:=vden+';';
     vden:=vden+'----------------;';
     vden:=vden+vobsos;
     vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     if Pos('Fonte: IBPT', vden) = 0 then
     begin
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.SQL.Text := 'select aliqnac from TIPOSERVICONFSE where COD_TPSERVICO = ' + QuotedStr(Servico.ItemListaServico);
       (vnotanfs as TClassNfSe).buscaadc.Open;
       if (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat > 0 then
       begin
         if vRemoverEnterOBS_OS then
           vden := vden + ','
         else
           vden := vden + ';';
         vden := vden + 'Val Aprox Tributos R$' + Format('%0.2n', [Servico.Valores.ValorServicos *
           (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
           ' (' + Format('%0.2f', [(vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat]) +
           '%) Fonte: IBPT';
       end;
     end;
     (vnotanfs as TClassNfSe).vden:=vden;
     Servico.Discriminacao             := TClassNfSe(vnotanfs).RetiraCarEsp(vden);

     // Para o provedor ISS.NET em ambiente de Homologação
     // o Codigo do Municipio tem que ser '999'
     Servico.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);

     // Informar A Exigibilidade ISS para fintelISS [1/2/3/4/5/6/7]
     Servico.ExigibilidadeISS := exiExigivel;

     // Informar para Saatri
{     Servico.CodigoPais := 1058; // Brasil}
     Servico.MunicipioIncidencia := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;

      Prestador.IdentificacaoPrestador.Cnpj               := vnotanfs.cadempresa.fstrNotEsp('CGC_EMP');
      Prestador.IdentificacaoPrestador.InscricaoMunicipal := vnotanfs.cadempresa.fstrNotEsp('IM_EMP');
      Prestador.Endereco.CodigoMunicipio                  := vnotanfs.strzero(vnotanfs.cadempresa.fint('IBGE_COD_CIDADE'), 7);
      Prestador.RazaoSocial                               := StringReplace(vnotanfs.cadempresa.fstrNotEsp('NOME_EMP'), '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      
     Tomador.IdentificacaoTomador.CpfCnpj            := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString;
     if trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString) <> '' then
     Tomador.IdentificacaoTomador.InscricaoMunicipal := trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);

     Tomador.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

     Tomador.Endereco.Endereco        := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Numero          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Complemento     := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.Bairro          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
     Tomador.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString;
     Tomador.Endereco.UF              := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString;
     Tomador.Endereco.CEP             := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString;
     //edtEmitCEP.Text;
	 //Provedor Equiplano é obrigatório o pais e IE
     Tomador.Endereco.xPais           := 'BRASIL';
//     Tomador.IdentificacaoTomador.InscricaoEstadual := 'ISENTO';

     Tomador.Contato.Telefone := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString;
     Tomador.Contato.Email    := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString;

     (* Usando quando houver um intermediario na prestação do serviço
     IntermediarioServico.RazaoSocial        := 'razao';
     IntermediarioServico.CpfCnpj            := '00000000000';
     IntermediarioServico.InscricaoMunicipal := '12547478';
     *)

     (* Usando quando o serviço for uma obra
     ConstrucaoCivil.CodigoObra := '88888';
     ConstrucaoCivil.Art        := '433';
     *)
    end;

  end;
 end;
end;

function TClasstribcidBH.montartxtrps(vnotanfs: TClassNfe): string;
var
  vobsos: AnsiString;
  vden: String;
  vvalserv: currency;
  valiqt: string;
  vunidades: string;
begin
   //Belo Horizonte na versão 1.0 ABRASF
  with vnotanfs do
  begin
   montalinha(0001,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger,15));
   montalinha(0016,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring);
   montalinha(0021,'1');
   montalinha(0022,FormatDateTime('yyyy-mm-dd"T"hh:nn:ss',(vnotanfs as TClassNfSe).buscasmnt.FieldByName('emissao_rps').AsDateTime));
   montalinha(0041,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_natop').AsInteger,1));
   montalinha(0042,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
   montalinha(0043,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));
   montalinha(0044,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));
   montalinha(0045,'1');
   // Valor total dos serviços
   vvalserv:=(vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
   (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
   (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency;
   //
   montalinha(0067,(vnotanfs as TClassNfSe).Tzero(vvalserv,15));
   montalinha(0082,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0097,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0112,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0127,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0142,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency,15));
   montalinha(0157,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0172,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
   montalinha(0173,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('valor').Ascurrency*
   ((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100),15));
   if (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger = 1 then
    montalinha(0188,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency,15))
   else
    montalinha(0188,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0203,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0218,(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('valor').Ascurrency,15));
   valiqt:=(vnotanfs as TClassNfSe).Tzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency*1000,5);
   montalinha(0233,valiqt);
//       montalinha(0233,Tzero(buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100,3)+'00');
   montalinha(0238,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0253,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0268,(vnotanfs as TClassNfSe).Tzero(0,15));
   montalinha(0283,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString);
   montalinha(0288,strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7));
//       if cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Homologação' then
//        montalinha(0295,'4320453')
//       else
//       montalinha(0295,cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString);
   montalinha(0295,(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CTISS').AsString);
   vobsos:='';
//       if pos(',',(vnotanfs as TClassNfSe).vospesq) <= 0 then
   begin

     vRemoverEnterOBS_OS := False;
     try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
     except
       vRemoverEnterOBS_OS := False;
     end;

     (vnotanfs as TClassNfSe).buscaadc.close;
     (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
     ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
     ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
     (vnotanfs as TClassNfSe).buscaadc.open;
     while not (vnotanfs as TClassNfSe).buscaadc.eof do
     begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
      else
      vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ||-||';
      (vnotanfs as TClassNfSe).buscaadc.next;
     end;
     if vRemoverEnterOBS_OS then
     begin
       vobsos:=StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]);
       vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
       if Copy(vobsos, Length(vobsos) - 1 , 1) = ',' then
         System.Delete(vobsos, Length(vobsos) - 1, 1);
     end;
   end;
   (vnotanfs as TClassNfSe).buscaadc.close;
   (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
   ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
   (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
   (vnotanfs as TClassNfSe).buscaadc.open;
   vobsos:=StringReplace(vobsos, #13, '|', [rfReplaceAll]);
   vobsos:=StringReplace(vobsos, #10, '|', [rfReplaceAll]);
   //vden:=RetiraCarEsp(vobsos);
   vden:='';
   vunidades:='';
   //'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
   while not (vnotanfs as TClassNfSe).buscaadc.eof do
   begin
     vunidades:=format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency])+' X '+
     format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency])+
     '=';
     vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
     vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
//         if pos(',',vospesq) > 0 then
//         begin
     vden:=vden+'(O.S.: '+StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
     if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
      vden:=vden+',';
//         end;
     (vnotanfs as TClassNfSe).buscaadc.next;
   end;
   vden:=vden+'||';
   vden:=vden+'----------------||';
   vden:=vden+vobsos;
   (vnotanfs as TClassNfSe).vden:=vden;
   montalinha(0315,copy(vden,1,2000));
   if (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Homologação' then
    montalinha(2315,'4320453')
   else
    montalinha(2315,strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7));
   montalinha(2322,(vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('CGC_EMP').AsString);
   montalinha(2336,(vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IM_EMP').AsString);
   if Length(trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString)) <= 11 then
     montalinha(2351,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString)
   else
     montalinha(2362,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString);
   montalinha(2376,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);
   montalinha(2391,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString));
   montalinha(2506,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString));
   montalinha(2631,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString);
   montalinha(2641,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString));
   montalinha(2701,(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString));
   montalinha(2761,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString);
   montalinha(2768,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString);
   montalinha(2770,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString);
   montalinha(2778,'0'+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString);
   montalinha(2789,(vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString);
  end;
end;

{ TEventNFSe }


{ TClasstribcidTO }

procedure TClasstribcidTO.copiarschemas(tpAmb: string);
begin
  fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\GovDigital';
  inherited;
end;

constructor TClasstribcidTO.create;
begin

end;

destructor TClasstribcidTO.destroy;
begin

  inherited;
end;

function TClasstribcidTO.sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps;
begin
  raise Exception.Create('Nao disponível para esta cidade');
end;

function TClasstribcidTO.montarRPSAC(var vacbrnfse1: TACBrNFSeX; vnotanfs: TClassNfe): boolean;
var
 vobsos: AnsiString;
 vden: String;
 vunidades: string;
 vquantserv, vlTmpValorISS: currency;
  vRoundMode: TFPURoundingMode;
begin
  vacbrnfse1.NotasFiscais.Clear;
  with vacbrnfse1 do
  begin
    NotasFiscais.NumeroLote:='1';
    NotasFiscais.Transacao := True;

    with NotasFiscais.New.NFSe do
    begin
      IdentificacaoRps.Numero := FormatFloat('#########0', (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsInteger);
      IdentificacaoRps.Serie := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('serie_serv_nfe').asstring;
      IdentificacaoRps.Tipo := trRPS;

      DataEmissao := Now;
      NaturezaOperacao := no1;//noTributacaoNoMunicipio;
      RegimeEspecialTributacao := vacbrnfse1.Provider.
      StrToRegimeEspecialTributacao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger,1));
      OptanteSimplesNacional := vacbrnfse1.Provider.
      StrToSimNao(Ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger,1));
      IncentivadorCultural := vacbrnfse1.Provider.
      StrToSimNao(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger,1));
      if (vacbrnfse1.Configuracoes.WebServices.Ambiente = taProducao) then
       Producao := snSim
      else
       Producao :=snNao;
      StatusRps := srNormal;
      OutrasInformacoes := 'Pagamento a Vista';
      Servico.Valores.ValorServicos          := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('VALOR').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency+
                                               (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

      Servico.Valores.ValorServicos := StrToFloatDef(  FormatFloat('0.00', Servico.Valores.ValorServicos), Servico.Valores.ValorServicos);
      vlTmpValorISS := Servico.Valores.ValorServicos*(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').Ascurrency/100;

      try

      vRoundMode := GetRoundMode;
      SetRoundMode(rmUp);

      servico.Valores.ValorIss               := SimpleRoundTo(vlTmpValorISS, -2);
      servico.valores.Aliquota               :=(vnotanfs as TClassNfSe).buscasmnt.FieldByName('ALIQ_ISS').AsFloat;

      finally
       SetRoundMode(vRoundMode);
      end;
      Servico.Valores.ValorDeducoes          := 0.00;
      Servico.Valores.ValorPis               := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('PISRF_SERVICO').AsCurrency;
      Servico.Valores.ValorCofins            := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('COFINSRF_SERVICO').AsCurrency;
      Servico.Valores.ValorInss              := 0.00;
      Servico.Valores.ValorIr                := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency;
      Servico.Valores.ValorCsll              := (vnotanfs as TClassNfSe).BuscasMnt.FieldByName('CSSLRF_SERVICO').AsCurrency;

      Servico.Valores.IssRetido := vacbrnfse1.Provider.
      StrToSituacaoTributaria(ok,(vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('ISS_RETIDO').AsInteger,1));
      if Servico.Valores.IssRetido = stRetencao then
       Servico.Valores.ValorIssRetido:=(vnotanfs as TClassNfSe).BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency
      else
       Servico.Valores.ValorIssRetido:= 0.00;

      Servico.Valores.OutrasRetencoes        := 0.00;
      Servico.Valores.DescontoIncondicionado := 0.00;
      Servico.Valores.DescontoCondicionado   := 0.00;
      Servico.ItemListaServico         := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('nfs_servico').AsString;
      servico.CodigoCnae               := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).buscasmnt.FieldByName('cnae_serv').AsInteger,7);

      Servico.CodigoTributacaoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CTISS').AsString;
      vobsos:='';

      vRemoverEnterOBS_OS := False;
      try
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
       (vnotanfs as TClassNfSe).buscaadc.open;
       vRemoverEnterOBS_OS := Trim( (vnotanfs as TClassNfSe).buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString ) = 'S';
      except
       vRemoverEnterOBS_OS := False;
      end;

      (vnotanfs as TClassNfSe).buscaadc.close;
      (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED in ('+(vnotanfs as TClassNfSe).vospesq+
      ') and tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
      ''' AND cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa);
      (vnotanfs as TClassNfSe).buscaadc.open;
      while not (vnotanfs as TClassNfSe).buscaadc.eof do
      begin
       if vRemoverEnterOBS_OS then
         vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+'#* , '
      else
      vobsos:=vobsos+(vnotanfs as TClassNfSe).buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
      (vnotanfs as TClassNfSe).buscaadc.next;
      end;
      if vRemoverEnterOBS_OS then
      begin
       vobsos:=Trim(StringReplace(vobsos, #13#10+'#*', '', [rfReplaceAll]));
       vobsos:=StringReplace(vobsos, '#*', '', [rfReplaceAll]);
       if Copy(vobsos, Length(vobsos), 1) = ',' then
         System.Delete(vobsos, Length(vobsos), 1);
      end;
      (vnotanfs as TClassNfSe).buscaadc.close;
      (vnotanfs as TClassNfSe).buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT WHERE it.tipo = '''+(vnotanfs as TClassNfSe).buscasmnt.FieldByName('TIPO').AsString+
      ''' AND it.cod_empresa = '+inttostr((vnotanfs as TClassNfSe).cadempresa.codempresa)+' and cod_rps = '+
      (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COD_RPS').AsString;
      (vnotanfs as TClassNfSe).buscaadc.open;
      vobsos:=StringReplace(vobsos, #13#10, ';', [rfReplaceAll]);
      vden:='';
      vunidades:='';
      while not (vnotanfs as TClassNfSe).buscaadc.eof do
      begin
       vquantserv:=(vnotanfs as TClassNfSe).buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
       if vquantserv = 0 then
         vquantserv:=1;
       vunidades:=format('%n',[vquantserv])+' X '+
       format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency/vquantserv])+
       '=';
       vden:=vden+(vnotanfs as TClassNfSe).RetiraCarEsp((vnotanfs as TClassNfSe).buscaadc.FieldByName('DESC_SERV_PED').AsString)+' - '+
       vunidades+format('%n',[(vnotanfs as TClassNfSe).buscaadc.FieldByName('VALOR_NFSE').AsCurrency]);
       vden:=vden+'(O.S.: '+(vnotanfs as TClassNfSe).StrZero((vnotanfs as TClassNfSe).buscaadc.FieldByName('NPED').AsInteger,6)+')';
       if pos(',',(vnotanfs as TClassNfSe).vospesq) > 0 then
        vden:=vden+',';
       (vnotanfs as TClassNfSe).buscaadc.next;
      end;
      vden:=vden+';';
      vden:=vden+'----------------;';
      vden:=vden+vobsos;
      vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      if Pos('Fonte: IBPT', vden) = 0 then
      begin
       (vnotanfs as TClassNfSe).buscaadc.close;
       (vnotanfs as TClassNfSe).buscaadc.SQL.Text := 'select aliqnac from TIPOSERVICONFSE where COD_TPSERVICO = ' + QuotedStr(Servico.ItemListaServico);
       (vnotanfs as TClassNfSe).buscaadc.Open;
       if (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat > 0 then
       begin
         if vRemoverEnterOBS_OS then
           vden := vden + ','
         else
           vden := vden + ';';
         vden := vden + 'Val Aprox Tributos R$' + Format('%0.2n', [Servico.Valores.ValorServicos *
           (vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
           ' (' + Format('%0.2f', [(vnotanfs as TClassNfSe).buscaadc.FieldByName('aliqnac').AsFloat]) +
           '%) Fonte: IBPT';
       end;
      end;

      (vnotanfs as TClassNfSe).vden:=vden;
      Servico.Discriminacao             := vden;
      Servico.CodigoMunicipio := (vnotanfs as TClassNfSe).strzero((vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger,7);
      Servico.ExigibilidadeISS := exiExigivel;
      Servico.MunicipioIncidencia := (vnotanfs as TClassNfSe).cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;

      Prestador.IdentificacaoPrestador.Cnpj               := vnotanfs.cadempresa.fstrNotEsp('CGC_EMP');
      Prestador.IdentificacaoPrestador.InscricaoMunicipal := vnotanfs.cadempresa.fstrNotEsp('IM_EMP');
      Prestador.Endereco.CodigoMunicipio                  := vnotanfs.strzero(vnotanfs.cadempresa.fint('IBGE_COD_CIDADE'), 7);
      Prestador.RazaoSocial                               := StringReplace(vnotanfs.cadempresa.fstrNotEsp('NOME_EMP'), '&', 'E', [rfIgnoreCase, rfReplaceAll]);

      Tomador.IdentificacaoTomador.CpfCnpj            := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('cpfcgc').AsString;
      if trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString) <> '' then
      Tomador.IdentificacaoTomador.InscricaoMunicipal := trim((vnotanfs as TClassNfSe).buscasmnt.FieldByName('Insc_municipal').AsString);

      Tomador.RazaoSocial := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('razao').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);

      Tomador.Endereco.Endereco        := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('endereco').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Numero          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('NUM_END_CLIENTE').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Complemento     := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('COMPLEMENTO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.Bairro          := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('BAIRRO').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
      Tomador.Endereco.CodigoMunicipio := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('ibge_cod_cidade').AsString;
      Tomador.Endereco.UF              := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('SIGLA_UF').AsString;
      Tomador.Endereco.CEP             := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('CEP').AsString;
      Tomador.Endereco.xPais           := 'BRASIL';
      Tomador.Contato.Telefone := (vnotanfs as TClassNfSe).buscasmnt.FieldByName('fone_cliente').AsString;
      Tomador.Contato.Email    := StringReplace(
       (vnotanfs as TClassNfSe).buscasmnt.FieldByName('email').AsString,
       '&', 'E', [rfIgnoreCase, rfReplaceAll]);
    end;
  end;
end;

function TClasstribcidTO.montartxtrps(vnotanfs: TClassNfe): string;
begin
  raise Exception.Create('Nao disponivel para FlexDocs');
end;

{ TClassNFSeAbaco }

procedure TClassNFSeAbaco.copiarschemas(tpAmb: string);
begin
  fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\Abaco';
  inherited;
end;

constructor TClassNFSeAbaco.create;
begin

end;

destructor TClassNFSeAbaco.destroy;
begin

  inherited;
end;

function TClassNFSeAbaco.montarRPSAC(var vacbrnfse1: TACBrNFSeX;
  vnotanfs: TClassNfe): boolean;
begin
   inherited;
end;

function TClassNFSeAbaco.montartxtrps(vnotanfs: TClassNfe): string;
begin
  raise Exception.Create('Nao disponivel para FlexDocs');
end;

function TClassNFSeAbaco.sigiss_getRPS(Anfs: TClassNfSe): tcDescricaoRps;
begin
  raise Exception.Create('Nao disponível para este provedor');
end;

{ TClassNFSeDefault }

procedure TClassNFSeDefault.copiarschemas(tpAmb: string);
begin
  if ibgeId = '3127701' then
  begin
    fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\ISSIntel\1.00';
    inherited;
  end
  else if ibgeId = '3131158' then
  begin
    fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\Actcon\2.02';
    inherited;
  end;

//  fPathSh := ExtractFilePath(Application.ExeName) + 'schemasNFSe\Abaco';
//  inherited;
//  fPathSh := IniConf.ReadStr('Sistema', 'SchemasNFSe');
end;

constructor TClassNFSeDefault.create(_ibgeId: string);
begin
  ibgeId := _ibgeId;
end;

destructor TClassNFSeDefault.destroy;
begin

  inherited;
end;

procedure TClassNFSeDefault.HandleValuesBeforePrint(var nfse: TACBrNFSeX;
  nfs: TClassNfe);
var
  data: TClientDataSet;
begin
  inherited;

  data := (nfs as TClassNfSe).buscasmnt;

  if IniConf.ReadStr(Format('NFSe_%s', [ibgeId]), 'Atualizar_Servico_Valores_ValorLiquidoNfse', 'S') = 'S' then
    if nfse.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse > 0 then
      nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse := nfse.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse;

  if IniConf.ReadStr(Format('NFSe_%s', [ibgeId]), 'Atualizar_Servico_Valores_ValorIssRetido ', 'S') = 'S' then
    if (nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.IssRetido = stRetencao) and (nfse.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss > 0) then
        nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido := nfse.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss;

  if (nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota = 0) and
     (data.FieldByName('aliq_iss').AsFloat > 0) then
     nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota := data.FieldByName('aliq_iss').AsFloat;

  if (nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss = 0) and
     (data.FieldByName('aliq_iss').AsFloat > 0) and (not data.FieldByName('iss_retido').AsString.Equals('1')) then  // valor_b_nfse = bruto
     nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss := RoundTo(data.FieldByName('bruto').AsFloat * data.FieldByName('aliq_iss').AsFloat / 100, -2);

  if (nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido = 0) and
     (data.FieldByName('aliq_iss').AsFloat > 0) and (data.FieldByName('iss_retido').AsString.Equals('1')) then  // valor_b_nfse = bruto
     nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido := RoundTo(data.FieldByName('bruto').AsFloat * data.FieldByName('aliq_iss').AsFloat / 100, -2);

  if IniConf.ReadDouble(Format('NFSe_%s', [ibgeId]), 'Fator_Ajuste_Aliquota_ISS', 0) > 0 then
    nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota :=
      nfse.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota * IniConf.ReadDouble(Format('NFSe_%s', [ibgeId]), 'Fator_Ajuste_Aliquota_ISS', 1);

  if nfse.NotasFiscais.Items[0].NFSe.Tomador.IdentificacaoTomador.InscricaoEstadual.Trim = '' then
    nfse.NotasFiscais.Items[0].NFSe.Tomador.IdentificacaoTomador.InscricaoEstadual := data.FieldByName('insc_est').AsString.Trim;

  if nfse.NotasFiscais.Items[0].NFSe.Prestador.IdentificacaoPrestador.InscricaoEstadual.Trim = '' then
    nfse.NotasFiscais.Items[0].NFSe.Prestador.IdentificacaoPrestador.InscricaoEstadual := nfse.Configuracoes.Geral.Emitente.DadosEmitente.InscricaoEstadual.Trim;

  {
  if IniConf.ReadStr(Format('NFSe_%s', [ibgeId]), 'Atualizar_Servico_Valores_ValorIssRetido ', 'S') = 'S' then
  begin
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.RazaoSocial := nfs.cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Endereco := nfs.cadempresa.dataSet.FieldByName('ENDRECO_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Numero := nfs.cadempresa.dataSet.FieldByName('NUMERO_END').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Complemento := nfs.cadempresa.dataSet.FieldByName('COMPLEMENTO_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.Bairro := nfs.cadempresa.dataSet.FieldByName('BAIRRO_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio := nfs.cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.xMunicipio := nfs.cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.UF := buscaSiglaest(nfs.cadempresa.dataSet.FieldByName('UF_EMP').AsInteger);
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CEP := nfs.cadempresa.dataSet.FieldByName('CEP_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Contato.Telefone := nfs.cadempresa.dataSet.FieldByName('TELEFONE_EMP').AsString;
    nfse.NotasFiscais.Items[0].NFSe.PrestadorServico.Contato.Email := nfs.cadempresa.dataSet.FieldByName('EMAIL_EMP').AsString;
  end;
  }
end;

function TClassNFSeDefault.montarRPSAC(var vacbrnfse1: TACBrNFSeX;
  vnotanfs: TClassNfe): boolean;
begin
   inherited;
end;

function TClassNFSeDefault.montartxtrps(vnotanfs: TClassNfe): string;
begin
  raise Exception.Create('Nao disponivel para FlexDocs');
end;

function TClassNFSeDefault.sigiss_getRPS(
  Anfs: TClassNfSe): tcDescricaoRps;
begin
  raise Exception.Create('Nao disponível para este provedor');
end;

{ TClassNfe }

function TClassNFSe.cancelaNFSe(): boolean;
var
  valornfse: currency;
  vcodver: string;
  ASize, ANumOS: Integer;
  ADataEmissaoNFSe: TDateTime;
  buscasTemp: TIBQuery;
  AFinanceiroUnificado: Boolean;
  AnumeroNFSe, XMLCanc: string;
begin
  Result := True;
  try
    if not cancelawebservice(XMLCanc) then
      Exit;
    try

      IniciaTransacao;
      mostrarmensagem('Gravando dados do Cancelamento: '+dataSet.FieldByName('NOME_CLIENTE').AsString);

      if Trim(XMLCanc) <> '' then
      begin
        var Aid := 'NFSe_RPS_Canc' + fstr('cod_rps');
        if SqlOpen('select id_doc from DOC_ELETRONICO where id_doc = ' + QuotedStr(Aid) +
                   ' and cod_empresa = ' +IntToStr(cadempresa.codempresa), buscas).IsEmpty then
          SqlExec('insert into DOC_ELETRONICO (id_doc, cod_empresa, doc)' +
                  ' values (' + QuotedStr(Aid) + ', ' + IntToStr(cadempresa.codempresa) + ', ' + QuotedStr(XMLCanc) +')', buscas);
      end;

      buscas.close;
      buscas.SQL.Text:='INSERT INTO NFSE_CANCELADAS(NUM_NFSE,COD_RPS,COD_EMPRESA,NOME_CLIENTE,DATA_CANC,'+
      'VALOR_NFSE,SERIE,SUB_SERIE,N_OS,MOTIVO_CANCELAMENTO,EMISSAO_NFSE,COD_CLIENTE,CNAE,CTISS,'+
      'ALIQ_ISS,NFS_SERVICO,ISS_RETIDO,CODIGO_VERWSNFSE) '+
      'VALUES(:NUM,:RPS,:COD_EMPRESA,:NOME_CLIENTE,:DATA_CANC,:VALOR_NFSE,:NSERIE,:SUB_SERIE,:N_OS,'+
      ':MOTIVO_CANCELAMENTO,:EMISSAO_NFSE,:COD_CLIENTE,:CNAE,:CTISS,'+
      ':ALIQ_ISS,:NFS_SERVICO,:ISS_RETIDO,:CODIGO_VERWSNFSE)';
      buscas.ParamByName('NUM').AsString:=dataSet.FieldByName('N_NF').AsString;
      buscas.ParamByName('RPS').AsInteger:=dataSet.FieldByName('COD_RPS').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger:=cadempresa.codempresa;
      buscas.ParamByName('NOME_CLIENTE').AsString:=dataSet.FieldByName('NOME_CLIENTE').AsString;
      if datacanc = 0 then
        buscas.ParamByName('DATA_CANC').AsDate:=Date
      else
        buscas.ParamByName('DATA_CANC').AsDate:=datacanc;
      buscas.ParamByName('NSERIE').AsInteger:=cadempresa.dataSet.FieldByName('SERIE_SERV_NFE').AsInteger;
      buscas.ParamByName('SUB_SERIE').AsInteger:=0;
      buscas.ParamByName('N_OS').AsInteger:=dataSet.FieldByName('NPED').AsInteger;
      ANumOS := dataSet.FieldByName('NPED').AsInteger;

      buscaadc.close;
      buscaadc.sql.text:='SELECT IT.emissao_NFSE,PD.COD_CLIENTE,IT.valor_nfse,IT.CODIGO_VERWSNFSE FROM PEDVENDA_SERV IT INNER JOIN PEDVENDA PD ON IT.NPED = '+
      'PD.NPED AND IT.TIPO = PD.TIPO AND IT.COD_EMPRESA = PD.COD_EMPRESA WHERE IT.COD_RPS = '+
      dataSet.FieldByName('COD_RPS').AsString+' AND IT.COD_EMPRESA = '+
      inttostr(cadempresa.codempresa)+' AND COALESCE(IT.STATUS,'''') <> ''CANCELADO''';
      buscaadc.open;
      buscas.ParamByName('MOTIVO_CANCELAMENTO').asstring:=vdesccancnfse;
      buscas.ParamByName('EMISSAO_NFSE').asstring:=buscaadc.FieldByName('EMISSAO_NFSE').AsString;
      ADataEmissaoNFSe := buscaadc.FieldByName('EMISSAO_NFSE').AsDateTime;
      buscas.ParamByName('COD_CLIENTE').asstring:=buscaadc.FieldByName('COD_CLIENTE').AsString;
      vcodver:=buscaadc.FieldByName('CODIGO_VERWSNFSE').AsString;
      buscaadc.First;
      valornfse:=0;
      while not buscaadc.eof do
      begin
        valornfse:=valornfse+buscaadc.FieldByName('VALOR_NFSE').AsCurrency;
        buscaadc.next;
      end;
      buscas.ParamByName('VALOR_NFSE').AsCurrency:=valornfse;
      //dataSet.FieldByName('valorNF').AsCurrency;
      buscaadc.close;
      buscas.ParamByName('CNAE').asstring:=dataSet.FieldByName('CNAE_SERV').AsString;
      buscas.ParamByName('CTISS').asstring:=dataSet.FieldByName('CTISS').AsString;
      buscas.ParamByName('ALIQ_ISS').asstring:=trocaVirgulaPorPonto(dataSet.FieldByName('ALIQ_ISS').AsString);
      buscas.ParamByName('NFS_SERVICO').asstring:=dataSet.FieldByName('NFS_SERVICO').AsString;
      buscas.ParamByName('ISS_RETIDO').asstring:=dataSet.FieldByName('ISS_RETIDO').AsString;
      buscas.ParamByName('CODIGO_VERWSNFSE').asstring:=vcodver;
      buscas.Prepare;
      buscas.ExecSQL;

      //formas de pagamento e creditos
      try
        AnumeroNFSe := Trim(dataSet.FieldByName('N_NF').AsString);
        if StrToIntDef(AnumeroNFSe, -1) = -1 then
          System.Delete(AnumeroNFSe, 1, Length(AnumeroNFSe) - 6);
        if Length(AnumeroNFSe) > 6 then
          ASize := Length(AnumeroNFSe)
        else
          ASize := 6;

        buscaadc.Close;
        buscaadc.SQL.Text := 'update formpagamento fp set' +
          ' fp.num_nota = null' +
          ', fp.sub_serie = null' +
          ', fp.tip_cnt = ''C'' '+
          ', fp.ndoc = ' +QuotedStr(StrZero(ANumOS, 6))+
          '||substring(fp.ndoc from ' + IntToStr(ASize + 1) + ' for (char_length(fp.ndoc) - ' + IntToStr(ASize) + ' ) )'+
          ' where  (((fp.nrequisicao = ' + dataSet.FieldByName('NPED').AsString +
          ') and fp.tpdocs = ' + QuotedStr('OS') +
          ') or ((fp.rec_numvend = ' + dataSet.FieldByName('NPED').AsString +
          ' and fp.tpdocs <> ''LCS'' and fp.rec_tipvend = ' +
          QuotedStr('OS') +
          '))) and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1' +
          ' and fp.num_nota = :num_nota' + //IntToStr(dataSet.FieldByName('N_NF').AsInteger) +
          ' and fp.sub_serie = ' + IntToStr(YearOf(ADataEmissaoNFSe));
        buscaadc.ParamByName('num_nota').AsInteger := StrToIntDef(AnumeroNFSe, -1);
        buscaadc.ExecSQL;

        if buscaadc.RowsAffected >  0then
        begin
          buscaadc.Close;
          buscaadc.SQL.Text :=
            'select FINANCEIRO_UNIFICADO from empresa'+
            ' where cod_empresa = ' + IntToStr(cadempresa.codEmpresa);
          buscaadc.Open;

          AFinanceiroUnificado := Trim(buscaadc.FieldByName('FINANCEIRO_UNIFICADO').AsString) = 'S';

          buscasTemp := TIBQuery.Create(Application);
          buscasTemp.Database := buscaadc.Database;
          buscasTemp.Transaction := buscaadc.Transaction;
          try
            buscasTemp.Close;
            buscasTemp.SQL.Text :=
              'select n_processamento from formpagamento fp'+
              ' where  fp.nrequisicao = ' + dataSet.FieldByName('NPED').AsString +
              ' and fp.tpdocs = ' + QuotedStr('OS') +
              ' and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1 and fp.tipdoc = ''S2'' and fp.n_processamento > 0';
            buscasTemp.Open;

            while not buscasTemp.Eof do
            begin
              buscaadc.Close;
              buscaadc.SQL.Text :=
                'update controle_creditos cc set cc.n_doc_c = '+QuotedStr(StrZero(ANumOS,6))+
                '||substring(cc.n_doc_c from ' + IntToStr(ASize + 1) + ' for (char_length(cc.n_doc_c) - ' + IntToStr(ASize) + ' ) )' +
                ' where cc.cod_cred = ' + IntToStr(buscasTemp.FieldByName('n_processamento').AsInteger) +
                ' and cc.' + System.StrUtils.IfThen(AFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + IntToStr(cadempresa.codEmpresa) +
                ' and char_length(cc.n_doc_c) > 5';
              buscaadc.ExecSQL;

              buscasTemp.Next;
            end;
          finally
            FreeAndNil(buscasTemp);
          end;
        end;
      except
      end;
      /// fim das formas de pagamento e update nos creditos

      buscas.close;
      buscas.sql.text := 'UPDATE PEDVENDA_SERV SET' +
                         ' NFSE_NACIONAL = NULL,' +
                         ' STATUS_NFSE = NULL,' +
                         ' VALOR_NFSE = null,' +
                         ' NPROTNFSE = NULL,' +
                         ' EMISSAO_NFSE = NULL,' +
                         ' LOTE_NFSE = NULL,' +
                         ' N_NF = NULL,' +
                         ' CODIGO_VERWSNFSE = NULL,' +
                         ' COD_RPS = NULL' +
                         ' WHERE COD_RPS = ' + dataSet.FieldByName('COD_RPS').AsString +
                         ' AND COD_EMPRESA = '+inttostr(cadempresa.codempresa)+
                         ' AND COALESCE(STATUS,'''') <> ''CANCELADO''' +
                         ' AND NFSE_ID IS NULL';
      buscas.Prepare;
      buscas.ExecSQL;

      buscaadc.Close;
      buscaadc.SQL.text := 'UPDATE pedvenda set' +
                           ' NUM_NFEEXT = null,' +
                           ' VALOR_NFEXT = null,' +
                           ' DATA_NFEXT = null' +
                           ' where nped = ' + dataset.FieldByName('NPED').AsString +
                           ' and tipo = ''OS'' and cod_empresa = '+ IntToStr(cadempresa.codempresa);
      buscaadc.Prepare;
      buscaadc.ExecSQL;
      CommitaTransacao;

      mostrarmensagem('');

      ShowAtencao('Cancelamento efetuado com sucesso');

    except
      on e: exception do
      begin
        RollBackTransacao;
        mostrarmensagem('');
        result:=false;
        if application.messagebox('Erro ao cancelar o NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
      end;
    end;


  finally
    mostrarmensagem('');
  end;
end;

function TClassNfSe.cancelawebservice(out XMLCanc: string): boolean;
var
  Util: OleVariant;
  msgDados, msgRetWS, msgResultado,  certificado, licenca, usuario, senha, proxy: Widestring;
  ambiente, cResultado: integer;
  versao,cMunicipio, CNPJPrestador, IMPrestador: Widestring;
  NumeroNFSe, CodigoCancelamento, MotivoCancelamento, codigoMunicipio, dataHoraCancelamento, sucesso: Widestring;
  msg:string;
  nfseCancelamento: WideString;
  SoapMsgTx: WideString;
  SoapMsgRx: WideString;
  venv: string;
  varq: string;
  i: integer;
  Aok: Boolean;
  InfCancelamento: TInfCancelamento;
begin

  Result := False;
  XMLCanc := '';

  if cadempresa.IsValadaresComSigISS() then //if cadempresa.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
  begin
    sigiss_LoadDocEletronico(dataSet.FieldByName('cod_rps').AsInteger);
    Result := sigiss_CancelarNFSE(dataSet.FieldByName('N_NF').AsInteger);
  end
  else
  begin

    Aok := loadXMLdoBanco('NFSe_RPS' + dataset.FieldByName('cod_rps').AsString.Trim, False);
    if not Aok then
    begin
      varq := cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe\NFSe\'+trim(dataSet.FieldByName('N_NF').AsString)+ '-nfse.xml';
      if FileExists(Varq) then
      begin
        ACBrNFSe1.NotasFiscais.Clear;
        ACBrNFSe1.NotasFiscais.LoadFromFile(varq, False);
        Aok := True;
      end;
    end;
    if Aok then
    begin
      try
        ClearErrosNFSe;

        if fequals('nfse_nacional', '1') then
        begin
          ACBrNFSe1.ConsultarEvento(
            ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.ID,
            ACBrNFSeXConversao.teCancelamento,
            1
          );

          if ACBrNFSe1.WebService.ConsultarEvento.Sucesso and
            (ACBrNFSe1.WebService.ConsultarEvento.idNota = ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.ID) then
          begin
            Result := True;
            if FileExists(ACBrNFSe1.WebService.ConsultarEvento.PathNome) then
              XMLCanc := TFile.ReadAllText(ACBrNFSe1.WebService.ConsultarEvento.PathNome)
            else
              XMLCanc := ACBrNFSe1.WebService.ConsultarEvento.XmlRetorno;
            Exit;
          end
          else
          begin

            var InfEvento := TInfEvento.Create;

            try
              with InfEvento.pedRegEvento do
              begin
                tpAmb := ACBrNFSe1.Configuracoes.WebServices.AmbienteCodigo;
                verAplic := VERSAO_NFSE_HW;
                dhEvento := Now;
                chNFSe := ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.ID;
                nPedRegEvento := 1;
                tpEvento := ACBrNFSeXConversao.teCancelamento;
                cMotivo := StrToIntDef(vcodigocancnfse, 1);
                xMotivo := vdesccancnfse;
              end;

              ACBrNFSe1.EnviarEvento(InfEvento);
            finally
              InfEvento.Free;
            end;
          end;

        end
        else
        begin
          InfCancelamento := TInfCancelamento.Create;
          with InfCancelamento do
          begin
            NumeroNFSe      := ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero;
            SerieNFSe       := ACBrNFSe1.NotasFiscais.Items[0].NFSe.SeriePrestacao;
            ChaveNFSe       := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ChaveAcesso;
            CodCancelamento := vcodigocancnfse;
            //MotCancelamento := Motivo;
            //NumeroLote      := ACBrNFSe1.NotasFiscais.Items[0].NFSe.NumeroLote;
            //NumeroRps       := ACBrNFSe1.NotasFiscais.Items[0].NFSe.rpnuStrToIntDef(NumRps, 0);
            //SerieRps        := SerRps;
            //ValorNFSe       := StrToFloatDef(ValNFSe, 0);
            //CodVerificacao  := CodVerif;
          end;

          ACBrNFSe1.CancelarNFSe(InfCancelamento);
        end;

        var AResult := False;

        if TentarValidarCancelamentoPersonalizado(AResult) then // Retorna verdadeiro se a conf está ativa, Aresult tem o resultado que anota foi cancelada com sucesso
        begin
          if not AResult then
            raise Exception.Create('Tratamento personalizado do cancelamento não validado');

          Result := AResult
        end

        else
        begin

          var errows := GetErrosNFSe().Trim();

          if not errows.IsEmpty then
            raise Exception.Create(errows);

          if fequals('nfse_nacional', '1') then
          begin
            Result := ACBrNFSe1.WebService.EnviarEvento.SucessoCanc and
              ( ACBrNFSe1.WebService.EnviarEvento.idNota = fstr('codigo_verwsnfse'));
            if Result then
              XMLCanc := ACBrNFSe1.WebService.EnviarEvento.XmlRetorno;
          end
          else
            Result := ACBrNFSe1.WebService.CancelaNFSe.RetCancelamento.Pedido.IdentificacaoNfse.Numero = fstr('N_NF');
        end;

//        if not ACBrNFSe1.WebService.CancelaNFSe.Sucesso then
//          raise Exception.Create('Pedido de cancelamento sem sucesso');

//        Result := True;

      except on E: Exception do
        begin
          if ACBrNFSe1.WebService.CancelaNFSe.Erros.Count > 0 then
          begin
            if MatchText(ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Codigo, ['GOV46']) or
              (ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Codigo.Equals('X999') and
               ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Descricao.Contains('S66 - Erro interno de servidor - Os administradores do sistema foram notificados.')) then
            begin
              ShowAtencao(StrConcat(['Atenção!!!', sLineBreak, sLineBreak,
                                     'A prefeitura não está permitindo o cancelamento de Notas via sistema, somente via site.', sLineBreak,
                                     'Faça o cancelamento via site primeiro, só confirme a mensagem seguinte se o cancelamento já tenha sido efetuado no site da prefeitura!', sLineBreak, sLineBreak,
                                     'Retorno da Prefeitura', sLineBreak, sLineBreak,
                                     'Codigo:', ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Codigo, sLineBreak,
                                     'Mensagem:', ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Descricao, sLineBreak,
                                     'Correção:', ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Correcao]));
              if Application.MessageBox('Atenção, a nota fiscal já está cancelada na prefeitura?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) <> IDYES then
                Exit(False)
              else if Application.MessageBox('Deseja mesmo cancelar a nota fiscal no sistema?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
                Exit(True)
              else
                Exit(False);
            end
            else if MatchText(ACBrNFSe1.WebService.CancelaNFSe.Erros[0].Codigo, ['E906', 'E79']) then
              Exit(ShowConfirmacao('Atenção, Esta NFSe já está cancelada na PREFEITURA. Deseja proceder com o cancelamento no sistema?') = IDYES);

          end;

          if ShowConfirmacao('Deseja Mostrar Erro?', MB_YESNO + MB_DEFBUTTON2) = IDYES then
             ShowErro(E.Message);

          Result := False;
        end;
      end;
    end
    else
     Application.MessageBox(PWideChar('Arquivo XML da NFSe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
  end;
end;

{ TClassNfSe }

function TClassNfSe.abrevazio: boolean;
begin
  montaSelect( ObterSQL() + ' where 1 = 0 ' );
  {
montaSelect('SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,tipo_servico.aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
          'sum(pedvenda_serv.valor_tot_serv+coalesce(pedvenda_serv.rateio_acresc,0)-pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
          'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
          'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
          'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
          'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
          'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
          'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
          'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
          'where pedvenda.data_fech = ''01/01/1901'' and coalesce(pedvenda_serv.status,'''') <> ''CANCELADO'' '+
          'group by nome_cliente,nped,tipo,aliq_iss,nfs_servico,'+
          'cnae_serv,cidade,cod_rps,n_nf,cod_empresa,data_fech,status_nfse,iss_retido,ctiss');
   }
  var conf := TConfig_sistema_class.getConf('nfse_simples_nacional_aliq', buscaadc, cadempresa.codempresa);
  try
    if conf.AsBoolean then
      dataSet.FieldByName('aliq_iss').DisplayLabel := 'EMPRESA.ALIQ_SIMPLES_ISS'
    else
      dataSet.FieldByName('aliq_iss').DisplayLabel := 'TIPO_SERVICO.ALIQ_ISS';
  finally
    conf.Free;
  end;
end;

function TClassNfSe.abrirRPSDireto: boolean;
var
  S: string;
begin
   result:=true;
   vcodgar:=0;
   BuscasMnt.Close;
   {
   if verificarGARANTIA(dataSet.FieldByName('NPED').AsInteger) then
   begin
    BuscasMnt.CommandText:='SELECT emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,cl.insc_est,cl.fax,cl.nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.NPED,it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cl.cidade,it.ctiss,'+
    'sum(VALOR_NFSE) as valor,sum(it.irrf_servico) as irrf_servico,SUM(it.ISSRET_SERVICO) as ISSRET_SERVICO,sum(it.VALOR_B_NFSE) AS bruto '+
    'FROM PEDVENDA_SERV it inner join pedvenda on it.nped = pedvenda.nped and '+
    'it.tipo = pedvenda.tipo and it.cod_empresa = pedvenda.cod_empresa '+
    'inner join clientes cl on cl.cod_cliente = '+IntToStr(vcodgar)+' and pedvenda.cod_empresa = cl.cod_empresa '+
    'inner join empresa emp on it.cod_empresa = emp.cod_empresa inner join cidades cid on cl.cod_cidade = cid.cod_cidade '+
    'inner join estados est on cl.codigo_uf = est.codigo_uf '+
    'where it.cod_rps = '+dataSet.FieldByName('COD_RPS').AsString+' and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
    ' and coalesce(it.status,'''') <> ''CANCELADO'' '+
    ' group by emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,insc_est,fax,nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.NPED,it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cidade,ctiss';
   end
   else
   begin
    BuscasMnt.CommandText:='SELECT emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,cl.insc_est,cl.fax,cl.nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.NPED,it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cl.cidade,it.ctiss,'+
    'sum(VALOR_NFSE) as valor,sum(it.irrf_servico) as irrf_servico,SUM(it.ISSRET_SERVICO) as ISSRET_SERVICO,sum(it.VALOR_B_NFSE) AS bruto '+
    'FROM PEDVENDA_SERV it inner join pedvenda on it.nped = pedvenda.nped and '+
    'it.tipo = pedvenda.tipo and it.cod_empresa = pedvenda.cod_empresa '+
    'inner join clientes cl on cl.cod_cliente = pedvenda.cod_cliente and pedvenda.cod_empresa = cl.cod_empresa '+
    'inner join empresa emp on it.cod_empresa = emp.cod_empresa inner join cidades cid on cl.cod_cidade = cid.cod_cidade '+
    'inner join estados est on cl.codigo_uf = est.codigo_uf '+
    'where it.cod_rps = '+dataSet.FieldByName('COD_RPS').AsString+' and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
    ' and coalesce(it.status,'''') <> ''CANCELADO'' '+
    ' group by emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,insc_est,fax,nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.NPED,it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cidade,ctiss';
   end;
   }

  S := 'n.cod_cliente';
  if verificarGARANTIA(dataSet.FieldByName('NPED').AsInteger) then
    S := vcodgar.ToString();

  buscasmnt.CommandText := Format(
    'select' +
    ' emp.serie_serv_nfe, emp.cgc_emp, emp.im_emp, cl.razao, cl.cpfcgc, cl.Insc_municipal, cl.tipo_obra_nfse,'+
    ' cl.endereco, cl.NUM_END_CLIENTE, cl.COMPLEMENTO, cl.insc_est, cl.fax, cl.nome_cliente,'+
    ' cl.bairro, cl.fone_cliente, cl.email, cid.ibge_cod_cidade, est.sigla_uf, cl.cep,'+
    ' cl.cidade, n.valornf as valor, ' +
    ' n.*' +
    ' from VW_RPS_NFSE_LEGADO n' +
    ' inner join clientes cl on cl.cod_cliente = %s and cl.cod_empresa = n.cod_empresa ' +
    ' inner join empresa emp on n.cod_empresa = emp.cod_empresa ' +
    ' inner join cidades cid on cl.cod_cidade = cid.cod_cidade ' +
    ' inner join estados est on cl.codigo_uf = est.codigo_uf ' +
    ' where n.cod_rps = %d and n.cod_empresa = %d'
    , [ S, fint('COD_RPS'), cadempresa.codempresa ]
  );

  buscasmnt.Open;
end;

procedure TClassNfSe.acrescentaendACimp;
begin
  with ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador do
    RazaoSocial := cadempresa.fstr('NOME_EMP');

  with ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.Endereco do
  begin
    Endereco       := cadempresa.fstrNotEsp('ENDRECO_EMP');
    Numero         := cadempresa.fstrNotEsp('NUMERO_END');
    Complemento    := cadempresa.fstrNotEsp('COMPLEMENTO_EMP');
    Bairro         := cadempresa.fstrNotEsp('BAIRRO_EMP');
    CodigoMunicipio:= cadempresa.fstrNotEsp('IBGE_COD_CIDADE');
    xMunicipio     := cadempresa.fstrNotEsp('CIDADE_EMP');
    UF             := cadempresa.fstrNotEsp('SIGLA_UF');
    CEP            := cadempresa.fstrNotEsp('CEP_EMP');
  end;
  with ACBrNFSe1.NotasFiscais.Items[0].NFSe.Prestador.Contato do
  begin
    Telefone:= cadempresa.fstrNotEsp('TELEFONE_EMP');
    Email   := cadempresa.fstrNotEsp('EMAIL_EMP');
  end;

  if ACBrNFSe1.NotasFiscais.Items[0].NFSe.OptanteSimplesNacional <> TnfseSimNao.snSim then
    ACBrNFSe1.NotasFiscais.Items[0].NFSe.OptanteSN := TOptanteSN.osnNaoOptante
  else if ACBrNFSe1.NotasFiscais.Items[0].NFSe.RegimeEspecialTributacao = retMicroempresarioIndividual then
    ACBrNFSe1.NotasFiscais.Items[0].NFSe.OptanteSN := TOptanteSN.osnOptanteMEI
  else
    ACBrNFSe1.NotasFiscais.Items[0].NFSe.OptanteSN := TOptanteSN.osnOptanteMEEPP;

  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.RazaoSocial := cadempresa.fstrNotEsp('NOME_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.NomeFantasia := cadempresa.fstrNotEsp('FANTASIA_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Identificacao.InscricaoMunicipal := cadempresa.fstrNotEsp('IM_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Identificacao.InscricaoEstadual := cadempresa.fstrNotEsp('IE_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Identificacao.Cnpj := cadempresa.fstrNotEsp('CGC_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Endereco.Endereco := cadempresa.fstrNotEsp('ENDRECO_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Endereco.Numero := cadempresa.fstrNotEsp('NUMERO_END');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Endereco.Complemento := cadempresa.fstrNotEsp('COMPLEMENTO_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Endereco.CodigoMunicipio := cadempresa.fstrNotEsp('IBGE_COD_CIDADE');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Endereco.xMunicipio := cadempresa.fstrNotEsp('CIDADE_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Endereco.UF := cadempresa.fstrNotEsp('SIGLA_UF');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Endereco.CEP := cadempresa.fstrNotEsp('CEP_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Contato.Telefone := cadempresa.fstrNotEsp('TELEFONE_EMP');
  ACBrNFSe1.NotasFiscais.Items[0].NFSe.infNFSe.emit.Contato.EMail := cadempresa.fstrNotEsp('EMAIL_EMP');

  if (ACBrNFSe1.Configuracoes.Geral.Provedor in [proBHISS]) then
    ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
      ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota*100;
end;

function TClassNfSe.buscaSiglaest(vcodest: integer): string;
begin
 buscaadc.close;
 buscaadc.sql.Text:='select sigla_uf from estados where codigo_uf = '+inttostr(vcodest);
 buscaadc.Open;
 result:=buscaadc.FieldByName('SIGLA_UF').AsString;
end;

procedure TClassNfSe.ClearErrosNFSe;
begin
  ACBrNFSe1.WebService.Emite.Erros.Clear;
  ACBrNFSe1.WebService.ConsultaSituacao.Erros.Clear;
  ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Clear;
  ACBrNFSe1.WebService.ConsultaNFSeporRps.Erros.Clear;
  ACBrNFSe1.WebService.CancelaNFSe.Erros.Clear;
end;

function TClassNfSe.ConsultaDireta(vflag: integer): boolean;
var
  vlotenfse: string;
  vteste: string;
begin
  result:=true;
  IF dataSet.FieldByName('COD_RPS').AsInteger <> 0 then
  begin
    buscas.Close;
    buscas.sql.text:=
      'SELECT * FROM PEDVENDA_SERV WHERE COD_RPS = '+ dataSet.FieldByName('COD_RPS').AsString+
      ' AND NFSE_ID IS NULL AND COD_EMPRESA = ' + inttostr(cadempresa.codempresa);
    buscas.open;
    if buscas.FieldByName('nprotNFSe').AsString = '' then
    begin
      Application.MessageBox(PWideChar('RPS sem protocolo. Favor buscar a NFSe por RPS!'),PWideChar('Aviso'), MB_OK);
      result:=false;
    end
    else
    begin
      Fprotoloco:=buscas.FieldByName('nprotNFSe').AsString;
      vlotenfse:=buscas.FieldByName('lote_nfse').AsString;
      mostrarmensagem('Abrindo Tabela O.S....');
      abrirRPSDireto;
      if vflag = 1 then
        VerificaRetornoWs(ConsultaNFSe)
      else
      begin
        mostrarmensagem('');
        try
          ACBrNFSe1.NotasFiscais.Clear;

          ClearErrosNFSe;

          ACBrNFSe1.ConsultarLoteRps(Fprotoloco, vlotenfse);

          var errows := GetErrosNFSe().Trim;

          if not errows.IsEmpty then
            raise Exception.Create(errows);

          //      vteste := 'AP0176061V15732224K7mUSG';
          //      if InputQuery('Consulta Producao', 'Consulta situacao Lote Protocolo: ', vteste) then
          //      begin
          //        AP0176061V15732224K7mUSG
          //        ACBrNFSe1.Configuracoes.WebServices.Ambiente := taProducao;
          //
          //        ACBrNFSe1.ConsultarSituacao(cadempresa.dataSet.FieldByName('CGC_EMP').AsString, cadempresa.dataSet.FieldByName('IM_EMP').AsString, Fprotoloco, '');
          //      end
          //      else
          begin
          //      ACBrNFSe1.Configuracoes.WebServices.Ambiente := taHomologacao;
          //      ACBrNFSe1.ConsultarSituacao(cadempresa.dataSet.FieldByName('CGC_EMP').AsString, cadempresa.dataSet.FieldByName('IM_EMP').AsString, Fprotoloco, vlotenfse);
          end;
        except
          on e: exception do
          begin
            result:=false;
            if application.messagebox('Erro ao Consultar Lote RPS. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
              Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
          end;
        end;
       if result then
        if not VerificaRetornoAC(EMetodoNFSe.ConsultaLote) then
         result:=false;
      end;
    end;
  end
  else
  begin
    Application.MessageBox(PWideChar('Serviço sem RPS. Favor enviar o serviço para gerar um RPS!'),PWideChar('Aviso'), MB_OK);
    result:=false;
  end;

end;

function TClassNfSe.ConsultadiretaporRPS(): boolean;
begin
  Result := True;

  if fint('COD_RPS') = 0 then
  begin
    ShowErro('Serviço sem RPS. Favor enviar o serviço para gerar um RPS!');
    Exit(False);
  end;

  mostrarmensagem('Abrindo Tabela O.S....');
  try

    abrirRPSDireto;

//    if vflag = 1 then
//    begin
//      VerificaRetornoWs(consultaPorRPS);
//    end
//    else

    if cadempresa.IsValadaresComSigISS() then //if cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
    begin
      if dataSet.FieldByName('n_nf').AsInteger <= 0 then
      begin
        Application.MessageBox(PWideChar('Serviço sem numero de NF. Não é possível fazer a consulta no webservice sigiss!'), 'Aviso', MB_OK);
        Exit;
        //     sigiss com problema, começou a retornar notas antigas, comentando essa linha para o cliente conseguir consultar
        //     a nota correta quando o webservice for corrigido
        //     end
        //     else if dataSet.FieldByName('status_nfse').AsString.Trim = 'Autorizada' then
        //     begin
        //       Application.MessageBox(PWideChar('NFS-e já autorizada. Consulta não é necessária!'), 'Aviso', MB_OK);
        //       Exit;
      end;
      FdocsNFSe := sigiss_LoadDocEletronico(dataSet.FieldByName('COD_RPS').AsInteger);
      Result := sigiss_ConsultarNFSE(dataSet.FieldByName('n_nf').AsInteger);
      Exit;
    end;

    ACBrNFSe1.NotasFiscais.Clear;

    var xmlLoaded := False;

    var xmlRPS := GetXmlRPS(fint('COD_RPS'));
    var fileName := '';
    var idRPS := fstr('COD_RPS');

    if xmlRPS.IsEmpty then
    begin
      fileName := StrConcat([ACBrNFSe1.Configuracoes.Arquivos.PathRPS, '\', fstr('COD_RPS'), '1-Rps.xml']);
      if not FileExists(fileName) then
      begin
        ShowErro(StrConcat(['Arquivo XML do RPS não encontrado no caminho: ', sLineBreak, fileName]));
        Exit(False);
      end;

      ACBrNFSe1.NotasFiscais.LoadFromFile(fileName, False);
    end
    else
      ACBrNFSe1.NotasFiscais.LoadFromString(xmlRPS, False);

    if ACBrNFSe1.NotasFiscais.Count = 0 then
    begin
      ShowErro('Nenhuma nota encontrada no xml');
      Exit(False);
    end;

    if fequals('nfse_nacional', '1') then
      idRPS := apenasNumeros(ACBrNFSe1.NotasFiscais.Items[0].NFSe.InfID.ID);

    try
      ClearErrosNFSe;

      if fequals('nfse_nacional', '1') then
      begin
        ACBrNFSe1.ConsultarDPSPorChave( idRPS );

        if ACBrNFSe1.WebService.ConsultaNFSeporRps.Sucesso then
          ACBrNFSe1.ConsultarNFSePorChave( ACBrNFSe1.WebService.ConsultaNFSeporRps.idNota );
      end
      else
        ACBrNFSe1.ConsultarNFSeporRps(
          idRPS, cadempresa.dataSet.FieldByName('serie_serv_nfe').AsString, '1'
        );

      var errows := GetErrosNFSe().Trim;

      if not errows.IsEmpty then
        raise Exception.Create(errows);

      Result := True;

    except on e: exception do
      begin
        Result := False;
        if ShowConfirmacao('Erro ao Consultar Lote RPS. Mostrar Erro?', mb_yesno + MB_DEFBUTTON2) = IDYES then
          ShowErro(E.Message);
      end;
    end;

    if Result then
      if not VerificaRetornoAC(EMetodoNFSe.ConsutaNota) then
        Result := False;

  finally
    mostrarmensagem('');
  end;
end;

function TClassNfSe.ConsultaGrid(const Input: TNFSeConsulta): boolean;
const
  TNFSeConsultaCondicaoStr: array[TNFSeConsultaCondicao] of string =
    ('comeca', '=', '<>', '>', '<', 'like');
var
  I: integer;
  sFiltro, Campo, Ordem: string;
  tipo: TNFSeConsultaTipo;
  condicao: TNFSeConsultaCondicao;
begin

  for I := 0 to DataSet.FieldCount - 1 do
    if UpperCase(DataSet.Fields[I].DisplayName) = UpperCase(Input.Ordem) then
    begin
      ordem := DataSet.Fields[I].FieldName;
      Break;
    end;

  for I := 0 to DataSet.FieldCount - 1 do
    if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(Input.Campo) then
    begin
      Campo := DataSet.Fields[I].FieldName;

      if (Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
        (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField) then
        tipo := tctDecimal
      else if DataSet.Fields[i] is TStringField then
        tipo := tctTexto
      else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
        tipo := tctData
      else
        tipo := tctInteiro;
      break;
    end;

  sFiltro := '';

  case tipo of
    tctDecimal,
    tctInteiro:
      begin
        case Input.Condicao of

          tccIgual,
          tccDiferente,
          tccMaior,
          tccMenor:
            condicao := Input.Condicao;
        else
          condicao := tccIgual;
        end;
        if tipo = tctDecimal then
          sFiltro := tirapontos(Input.Valor, 5)
        else
          sFiltro := Input.Valor;

        sFiltro := Format('%s %s %s', [Campo, TNFSeConsultaCondicaoStr[condicao], sFiltro]);
      end;

    tctTexto:
      begin
        case Input.Condicao of
          tccComeca     : sFiltro := Format('%s like %s', [Campo, QuotedStr(Input.Valor + '%')]);
          tccEstaContido: sFiltro := Format('%s like %s', [Campo, QuotedStr('%' + Input.Valor + '%')]);
        else
          sFiltro  := Format('%s %s %s', [Campo, TNFSeConsultaCondicaoStr[Input.Condicao], QuotedStr(Input.Valor)]);
        end;

      end;

    tctData:
      sFiltro  := Format('%s >= :data1 and %s <= :data2', [ Campo, Campo ]);
  end;

  if sFiltro = '' then
    sFiltro := ' where 1 = 1 '
  else
    sFiltro := ' where ' + sFiltro;

  sFiltro := sFiltro +' and COD_EMPRESA = ' + IntToStR(cadempresa.codempresa);

  case Input.Status of

    tcsNaoAutorizada:
      sFiltro := sFiltro +' and coalesce(n_nf, 0) = 0 and modelo_nfse = ''55'' ';
    tcsAutorizada:
      sFiltro := sFiltro +' and coalesce(n_nf, 0) <> 0 and modelo_nfse = ''55'' ';
  end;

  try

    dataSet.Close;
    dataSet.CommandText := Format('%s %s', [ ObterSQL(), sFiltro]);

    if tipo = tctData then
    begin
      dataSet.Params[0].AsDate := StrToDate(Input.Data1);
      dataSet.Params[1].AsDate := StrToDate(Input.Data2);
    end;

    dataSet.Open;

    Result := True;

  except
    on e: exception do
    begin
      Result := false;
      ShowAtencao('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText);
      registraErro('E0009 ' + e.Message + DataSet.CommandText);
    end;
  end;
end;

function TClassNfSe.ConsultaNFSe: WideString;
var
  Util: OleVariant;
  msgDados, msgRetWS, msgResultado, certificado, licenca, usuario, senha, proxy: Widestring;
  ambiente, cResultado: integer;
  versao,cMunicipio, CNPJPrestador, IMPrestador, protocolo: Widestring;
  msg:string;
  it: integer;
  situacao,SoapMsgTx,SoapMsgRx: WideString;
begin
{

  proxy :='';
  usuario :='';
  senha :='';

  // informar licenca de uso para ambiente de produção
  mostrarmensagem('Verificando Retorno WebService NFSe: '+nomecliente);
  licenca :=cadempresa.dataSet.FieldByName('LICENCANFSE').AsString;
  //'b06ccea9f950a4e62c2be9540efc61c3943736496e217adfff0ad7e925d84ec5bb9c21671ea91562dcc3419e99532c5725a23e3b3cfcc4c18c03e57c368e173a';

  // informar com o assunto da certificado digital
  // Ex.: "CN=NFe - Associacao NF-e:99999090910270, C=BR, L=PORTO ALEGRE, O=Teste Projeto NFe RS, OU=Teste Projeto NFe RS, S=RS"

  // aproveitando o nome certificado que está armazenado no txCertificado
  certificado := cadempresa.dataSet.FieldByName('NFS_CERT').AsString;


  // inicializa parâmetro do ambiente


  If cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Produção' then
   ambiente := 1
  else
   ambiente := 2;


  msgDados := '';
  cResultado := 0;
  msgRetWS :='';
  versao := '1';        // versão do XML, necessário informar para consumir o WS da prefeitura de SP
  msgResultado :='';
  ListaMensagemRetorno :='';
  protocolo := '';
  listaMensagemAlertaRetorno:='';
  listanfse:='';
  ListaMensagemRetorno:='';
  listaMensagemRetornoLote:='';
  situacao:='';

  // pega o CNPJ do emissor

  CNPJPrestador := cadempresa.dataSet.FieldByName('CGC_EMP').AsString;

  // pega código do município do IBGE
  // If cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Produção' then
   cMunicipio :=cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;

  //   As prefeituras de SP/SP, Campo Grande/MS, Belem/PA, Campinas/SP, Nova Iguacu/RJ, Teresina/PI e Uberlandia/MG não oferecem a consulta situação do lote,

  IMPrestador := cadempresa.dataSet.FieldByName('IM_EMP').AsString;

  protocolo := Fprotoloco;

  // instancia a DLL
  Util := CreateOleObject('NFSe_Util.util');


  it:=0;

  if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').asinteger = 2 then
  begin
    if cadempresa.dataSet.FieldByName('USARENVRPSSINCRONO').AsString = 'S' then
    begin
      msgRetWS := Util.ConsultaLoteRPS_v2(cMunicipio, certificado, ambiente, versao, msgDados, cResultado, msgResultado, CNPJPrestador, IMPrestador,
      protocolo, situacao,listaNFSe,listaMensagemAlertaRetorno,listaMensagemRetorno,listaMensagemRetornoLote,SoapMsgTx,SoapMsgRx, proxy, usuario, senha, licenca);
      if ListaMensagemRetorno <> ''  then
      Messagebox(0,PWideChar('Problemas com o Lote!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
    end
    else
    begin
      while it <= 10 do
      begin
       mostrarmensagem('Verificando Retorno por RPS WebService NFSe: '+nomecliente);
       Screen.cursor := crHourglass;
       msgRetWS := Util.ConsultaLoteRPS_v2(cMunicipio, certificado, ambiente, versao, msgDados, cResultado, msgResultado, CNPJPrestador, IMPrestador,
       protocolo, situacao,listaNFSe,listaMensagemAlertaRetorno,listaMensagemRetorno,listaMensagemRetornoLote,SoapMsgTx,SoapMsgRx, proxy, usuario, senha, licenca);
       Screen.cursor := crDefault;
       Arquivo:=msgRetWS;
       if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarLoteRpsResposta') <> '' then
       begin
        if pos('S50',Grupo) > 0 then
         it:=it+1
        else
         break;
       end
       else
        it:=it+1;
       mostrarmensagem('');
       Sleep(3000);
      end;
      if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarLoteRpsResposta') <> '' then
      begin
        if pos('S50',Grupo) > 0 then
        begin
          Messagebox(0,PWideChar('Lote em Processamento. Consulte mais tarde!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
          vcoderro:='S50';
        end;
      end;
    end;
  end
  else
  begin
    while it <= 10 do
    begin
     mostrarmensagem('Verificando Retorno WebService NFSe: '+nomecliente);
     Screen.cursor := crHourglass;
     msgRetWS := Util.ConsultaLoteRPS(cMunicipio, certificado, ambiente, versao, msgDados, cResultado, msgResultado, CNPJPrestador, IMPrestador, protocolo, listaMensagemRetorno, proxy, usuario, senha, licenca);
     Screen.cursor := crDefault;
     Arquivo:=msgRetWS;
     if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarLoteRpsResposta') <> '' then
     begin
      if pos('S50',Grupo) > 0 then
       it:=it+1
      else
       break;
     end
     else
      it:=it+1;
     mostrarmensagem('');
     Sleep(3000);
    end;
    if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarLoteRpsResposta') <> '' then
    begin
      if pos('S50',Grupo) > 0 then
      begin
        Messagebox(0,PWideChar('Lote em Processamento. Consulte mais tarde!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
        vcoderro:='S50';
      end;
    end;
  end;
  result:=msgRetWS;             }
end;

function TClassNfSe.consultaPorRPS: widestring;
var
  Util: OleVariant;
  msgDados, msgRetWS, msgResultado, certificado, licenca, usuario, senha, proxy: Widestring;
  ambiente, cResultado: integer;
  versao,cMunicipio, CNPJPrestador, IMPrestador, protocolo: Widestring;
  msg:string;
  NumeroRPS, SerieRPS, TipoRPS: Widestring;
  SoapMsgTx,SoapMsgRx: WideString;

  it: integer;
//  ListaMensagemRetorno
begin
  {


  proxy :='';
  usuario :='';
  senha :='';

  // informar licenca de uso para ambiente de produção
  mostrarmensagem('Verificando Retorno WebService NFSe: '+nomecliente);
  licenca :=cadempresa.dataSet.FieldByName('LICENCANFSE').AsString;
  //'b06ccea9f950a4e62c2be9540efc61c3943736496e217adfff0ad7e925d84ec5bb9c21671ea91562dcc3419e99532c5725a23e3b3cfcc4c18c03e57c368e173a';

  // informar com o assunto da certificado digital
  // Ex.: "CN=NFe - Associacao NF-e:99999090910270, C=BR, L=PORTO ALEGRE, O=Teste Projeto NFe RS, OU=Teste Projeto NFe RS, S=RS"

  // aproveitando o nome certificado que está armazenado no txCertificado

  certificado := cadempresa.dataSet.FieldByName('NFS_CERT').AsString;


  // inicializa parâmetro do ambiente

  If cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString = 'Produção' then
   ambiente := 1
  else
   ambiente := 2;


  msgDados := '';
  cResultado := 0;
  msgRetWS :='';
  versao := '1';        // versão do XML, necessário informar para consumir o WS da prefeitura de SP
  msgResultado :='';
  ListaMensagemRetorno :='';
  protocolo := '';
  listaMensagemAlertaRetorno:='';
  listanfse:='';
  ListaMensagemRetorno:='';
  SoapMsgTx:='';
  SoapMsgRx:='';

  // pega o CNPJ do emissor

  CNPJPrestador := cadempresa.dataSet.FieldByName('CGC_EMP').AsString;

  // pega código do município do IBGE

   cMunicipio :=cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;
   //cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;



  // limpa text box

  //   As prefeituras de SP/SP, Campo Grande/MS, Belem/PA, Campinas/SP, Nova Iguacu/RJ, Teresina/PI e Uberlandia/MG não oferecem a consulta situação do lote,



  IMPrestador := cadempresa.dataSet.FieldByName('IM_EMP').AsString;
  if dataSet.FieldByName('COD_RPS').AsString <> '' then
   NumeroRPS   := dataSet.FieldByName('COD_RPS').AsString
  else
   NumeroRPS   := BuscasMnt.FieldByName('COD_RPS').AsString;

  SerieRPS    := cadempresa.dataSet.FieldByName('serie_serv_nfe').AsString;

  TipoRPS     :='1';



  Util := CreateOleObject('NFSe_Util.util');

  it:=0;

  if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').asinteger = 2 then
  begin
    if cadempresa.dataSet.FieldByName('USARENVRPSSINCRONO').AsString = 'S' then
    begin
     msgRetWS := Util.ConsultaNFSeRPS_v2(cMunicipio, certificado, ambiente, versao, msgDados, cResultado,
     msgResultado, CNPJPrestador, IMPrestador, NumeroRPS, SerieRPS, TipoRPS,listaNFSe, listaMensagemRetorno,SoapMsgTx,SoapMsgRx, proxy, usuario, senha, licenca);
     if ListaMensagemRetorno <> ''  then
      Messagebox(0,PWideChar('Problemas com o Lote!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
    end
    else
    begin
      while it <= 10 do
      begin
       mostrarmensagem('Verificando Retorno por RPS WebService NFSe: '+nomecliente);
       Screen.cursor := crHourglass;
       msgRetWS := Util.ConsultaNFSeRPS_v2(cMunicipio, certificado, ambiente, versao, msgDados, cResultado,
       msgResultado, CNPJPrestador, IMPrestador, NumeroRPS, SerieRPS, TipoRPS,listaNFSe, listaMensagemRetorno,SoapMsgTx,SoapMsgRx, proxy, usuario, senha, licenca);
       Screen.cursor := crDefault;
       Arquivo:=msgRetWS;
       if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarNfseRpsResposta') <> '' then
       begin
        if pos('S50',Grupo) > 0 then
         it:=it+1
        else
         break;
       end
       else
        it:=it+1;
       mostrarmensagem('');
       Sleep(3000);
      end;
      if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarNfseRpsResposta') <> '' then
      begin
        if pos('S50',Grupo) > 0 then
        begin
          Messagebox(0,PWideChar('Lote em Processamento. Consulte mais tarde!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
          vcoderro:='S50';
        end;
      end;
    end;
  end
  else
  begin
    while it <= 10 do
    begin
     mostrarmensagem('Verificando Retorno por RPS WebService NFSe: '+nomecliente);
     Screen.cursor := crHourglass;
     msgRetWS := Util.ConsultaNfseRPS(cMunicipio, certificado, ambiente, versao, msgDados, cResultado, msgResultado, CNPJPrestador, IMPrestador, NumeroRPS, SerieRPS, TipoRPS, listaMensagemRetorno, proxy, usuario, senha, licenca);
     Screen.cursor := crDefault;
     Arquivo:=msgRetWS;
     if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarNfseRpsResposta') <> '' then
     begin
      if pos('S50',Grupo) > 0 then
       it:=it+1
      else
       break;
     end
     else
      it:=it+1;
     mostrarmensagem('');
     Sleep(3000);
    end;
    if rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ConsultarNfseRpsResposta') <> '' then
    begin
      if pos('S50',Grupo) > 0 then
      begin
        Messagebox(0,PWideChar('Lote em Processamento. Consulte mais tarde!') , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
        vcoderro:='S50';
      end;
    end;
  end;
  result:=msgRetWS;
  }
end;

function TClassNfSe.sigiss_CancelarNFSE(ANota: Integer): Boolean;
var
  AwsSigISS: WebService_SigISSPortType;
  ARetornoNota: tcRetornoNota;
  ADadosCancelaNota: tcDadosCancelaNota;
  ADescricaoErros: tcDescricaoErros;
  I: Integer;
  Afs: TFormatSettings;
begin
  Result := False;
  AwsSigISS := GetWebService_SigISSPortType(False, sigiss_getUrlWS(FdocsNFSe.amb_prod));
  try
    ADadosCancelaNota := tcDadosCancelaNota.Create;
    try
      with ADadosCancelaNota do
      begin
        ccm  := StrToIntDef(cadempresa.dataSet.FieldByName('IM_EMP').AsString.Replace('.', '', [rfReplaceAll]).Replace('-', '', [rfReplaceAll]), 0);
        cnpj := cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
        senha := decodifica(cadempresa.dataSet.FieldByName('LICENCANFSE').AsString);
        nota := ANota;
        motivo := vdesccancnfse;
        if Assigned(FdocsNFSe.aut_nfse) then
          email := FdocsNFSe.aut_nfse.email_tomador;
      end;

    except on E: Exception do
      begin
        Result := False;
        if not SilentMode then
          if Application.MessageBox('Erro ao Cancelar NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar('Erro ao obter dados do prestador: ' = e.Message), PWideChar('Error'), MB_OK);
      end;
    end;

    ARetornoNota := tcRetornoNota.Create;
    try
      AwsSigISS.CancelarNota(ADadosCancelaNota, ARetornoNota, ADescricaoErros);

      if Assigned(ARetornoNota) then
      begin
        if ARetornoNota.Resultado = 1 then
        begin
          FdocsNFSe.can_ret := ARetornoNota;
          sigiss_GravarDocEletronico;

          Result := sigiss_ConsultarNFSE(ANota);
        end
        else
        begin
          for I := Low(ADescricaoErros) to High(ADescricaoErros) do
            if Assigned(ADescricaoErros[I]) then
              if ADescricaoErros[I].DescricaoErro.ToUpper.StartsWith('E48') then //Nota fiscal já se econtra cancelada
              begin
                if Assigned(FdocsNFSe.rps_resc) then
                FdocsNFSe.rps := FdocsNFSe.rps_resc;
                Result := sigiss_ConsultarNFSE(ANota);
              end;

          if not Result then
            raise Exception.Create('Erro ao cancelar nota no webservice da Prefeitura SIGISS');

        end;
      end
      else
        raise Exception.Create('Erro ao cancelar nota no webservice da Prefeitura SIGISS. Sem retorno do WS');

    except on E: Exception do
      begin
        Result := False;
        if not SilentMode then
          if Application.MessageBox('Erro ao Cancelar NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar(E.Message + #13 + sigiss_getListRepErrosWS(ADescricaoErros).Text), PWideChar('Error'), MB_OK);
      end;
    end;
  finally
    AwsSigISS := nil;
  end;
end;

function TClassNfSe.sigiss_ConsultarNFSE(ANota: Integer): Boolean;
var
  AwsSigISS: WebService_SigISSPortType;
  ADadosNota: tcDadosNota;
  ADadosPrestador: tcDadosPrestador;
  ADescricaoErros: tcDescricaoErros;
  I: Integer;
  Afs: TFormatSettings;
begin
  Result := False;
  AwsSigISS := GetWebService_SigISSPortType(False, sigiss_getUrlWS(FdocsNFSe.amb_prod));
  try
    ADadosPrestador := tcDadosPrestador.Create;
    try
      with ADadosPrestador do
      begin
        ccm              := StrToIntDef(cadempresa.dataSet.FieldByName('IM_EMP').AsString.Replace('.', '', [rfReplaceAll]).Replace('-', '', [rfReplaceAll]), 0);
        cnpj             := cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
        senha            := decodifica(cadempresa.dataSet.FieldByName('LICENCANFSE').AsString);
        aliquota_simples := Format('%0.2f', [cadempresa.dataSet.FieldByName('aliq_simples_iss').AsFloat]);

        SqlOpen('select contador.crc, estados.sigla_uf from contador' +
                ' left join estados on estados.codigo_uf = contador.codigo_uf' +
                ' where contador.cod_contador = ' + cadempresa.dataSet.FieldByName('cod_contador').AsInteger.ToString +
                ' and contador.cod_empresa = ' + cadempresa.codempresa.ToString);

        crc              := apenasNumeros(buscas.FieldByName('crc').AsString.Trim);//, 0);
        crc_estado       := buscas.FieldByName('sigla_uf').AsString.Trim;
      end;

    except on E: Exception do
      begin
        Result := False;
        if not SilentMode then
          if Application.MessageBox('Erro ao Consultar NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar('Erro ao obter dados do prestador: ' = e.Message), PWideChar('Error'), MB_OK);
      end;
    end;

    ADadosNota := tcDadosNota.Create;
    try
      AwsSigISS.ConsultarNotaPrestador(ADadosPrestador, ANota, ADadosNota, ADescricaoErros);

      if Assigned(ADadosNota) then
      begin
        ADadosNota.valor              := ADadosNota.valor.Replace('.', '', [rfReplaceAll]);
        ADadosNota.base               := ADadosNota.base.Replace('.', '', [rfReplaceAll]);
        ADadosNota.aliquota_atividade := ADadosNota.aliquota_atividade.Replace('.', '', [rfReplaceAll]);
        ADadosNota.iss                := ADadosNota.iss.Replace('.', '', [rfReplaceAll]);
        ADadosNota.ISSRetido          := IfThen((not FdocsNFSe.amb_prod) and (FdocsNFSe.sit_orig = 'tt'),
                                                'SIM', ADadosNota.ISSRetido);//remover essa linha depois dos testes

        if ADadosNota.StatusNFe.Trim.ToUpper.Equals('ATIVA') then
          FdocsNFSe.aut_nfse := ADadosNota
        else
          FdocsNFSe.can_nfse := ADadosNota;

        sigiss_GravarDocEletronico;

        if ADadosNota.StatusNFe.Trim.ToUpper.Equals('ATIVA') then
        begin
            //Verificar aqui o retorno do webservice
          FnumeroNFSe      := ADadosNota.nota.ToString;
          Fcodigover       := ADadosNota.autenticidade;
          Fdiscrimina      := ADadosNota.descricao;
          Foutrasinf       := ADadosNota.LinkImpressao;
          FCodigoCnae      := '';
          FRpsNFSe         := ADadosNota.id_sis_legado;
          vvalNFSe         := Format('%0.2f', [StrToFloat(ADadosNota.valor)]).Replace(',','.', [rfReplaceAll]);

          Afs := TFormatSettings.Create();
          Afs.DateSeparator := '-';
          Afs.TimeSeparator := ':';
          Afs.ShortDateFormat := 'YYYY-MM-DD';
          Afs.ShortTimeFormat := 'hh:nn:ss';

          FDataEmissaoNFSe := StrToDateTimeDef(ADadosNota.dt_conversao, now, Afs);
          gravaRetornoWs;

          Result := True;
          sigiss_retearDadosRecebidosNFSe(ADadosNota, StrToIntDef(FdocsNFSe.rps.id_sis_legado, 0))
        end;

        Result := True;
      end
      else
        raise Exception.Create('Erro ao consultar nota no webservice da Prefeitura SIGISS. Sem retorno do WS');

    except on E: Exception do
      begin
        Result := False;
        if not SilentMode then
          if Application.MessageBox('Erro ao Consultar NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            Application.MessageBox(PWideChar(E.Message + #13 + sigiss_getListRepErrosWS(ADescricaoErros).Text), PWideChar('Error'), MB_OK);
      end;
    end;
  finally
    AwsSigISS := nil;
  end;
end;

constructor TClassNfSe.create;
begin
  inherited;
 dataSet:=TClientDataSet(DtmNFEHW.CdsNFSe);
 transacao:=TIBTransaction(DtmNFEHW.IbTransNFe);
 buscas:=TIBQuery(DtmNFEHW.IbBuscas);
 buscaadc:=TIBQuery(DtmNFEHW.IbBuscasAdic);
 buscanfscanc:=TIBQuery(DtmNFEHW.IbNFSeCanceladas);
 osselec:=TClientDataSet(DtmNFEHW.cdsOsparaNFSe);
 BuscasMnt:=TClientDataSet(DtmNFEHW.CdsMontaNFSe);
 //FrmRelRPSNFSe:=TFrmRelRPSNFSe.create(Application);
 vospesq:='0';
 nomecliente:='';
// cadempresa.dadosGNfe;
// iniciaNFSE;
// cadclfor:=TClassCliente.create;
// caditens:=TClassItNfVenda.create;
  SilentMode := False;
  SendMail   := True;
  SendBoleto := True;
  Imprimir   := True;
end;

function TClassNfSe.Deixarapenasumnivel(venv: string): WideString;
var
 vtemp: string;
begin
 vtemp:=Arquivo;
 if rExtrai(1,venv+'OrgaoGerador') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 if rExtrai(1,venv+'PrestadorServico') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 if rExtrai(1,venv+'IntermediarioServico') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 if rExtrai(1,venv+'TomadorServico') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 if rExtrai(1,venv+'IdentificacaoRps') <> '' then
   vtemp:=StringReplace(vtemp, FGrupo, '', [rfReplaceAll]);
 Result:=vtemp;
end;

destructor TClassNfSe.destroy;
begin
  dataSet.close;
  buscaadc.Close;
  buscanfscanc.close;
  if Assigned(ConfSis) then
    FreeAndNil(ConfSis);
  inherited;
end;


function TClassNfSe.DetalhesRPS(vtp: integer): boolean;
begin
 if vtp = 1 then
 begin
   Result:=true;
   if not dataSet.IsEmpty then
   begin
     buscanfscanc.close;
     buscanfscanc.sql.text:='select NUM_NFSE as Num_NFSe,COD_RPS as Cod_Rps,N_OS as Num_OrdemServico,COD_CLIENTE as Cod_cliente,'+
     'NOME_CLIENTE as Nome_Cliente,DATA_CANC as DataCancelamento,VALOR_NFSE as Valor_NFSe,SERIE as Numero_Serie,'+
     'SUB_SERIE as Numero_SubSerie,motivo_cancelamento,EMISSAO_NFSE as DataEmissao_NFSE,'+
     'CNAE,CTISS as Cod_Trib_Municipio,ALIQ_ISS as Aliq_Iss,nfs_servico as codigo_serv_nfse,iss_retido,'+
     'CODIGO_VERWSNFSE as Codigo_verificacao from NFSE_CANCELADAS where n_os = '+dataSet.FieldByName('NPED').AsString+
     ' and cod_empresa = '+inttostr(cadempresa.codempresa)+' order by n_os,num_nfse';
     buscanfscanc.open;
     TFloatField(buscanfscanc.FieldByName('VALOR_NFSE')).DisplayFormat:='#,##0.00';
     if dataSet.FieldByName('COD_RPS').AsInteger <> 0  then
     begin
       buscaadc.close;
       buscaadc.sql.text:='select tipo,nped as N_OrdemServico,cod_rps as codigo_rps,'+
       'nfs_servico as codigo_serv_nfse,cnae_serv as cnae_servico,emissao_rps as data_emissao_rps,' +
       'NPROTNFSE as N_ProtocoloRPS,ISS_RETIDO as Iss_retido,LOTE_NFSE as LoteNFSe,RESP_WS_NFSE as Resposta_WS,' +
       'CODIGO_VERWSNFSE as Cod_Verificacao,OUTRAS_INFNFSE as outras_informacoes,emissao_nfse as Data_NFSe,'+
       'IRRF_SERVICO as IRRF,ALIQ_ISS as Aliq_Iss,CTISS as Cod_Trib_Municipio from pedvenda_serv '+
       'where tipo = ''OS'' and cod_rps = '+dataSet.FieldByName('COD_RPS').AsString+
       ' and nfse_id is null and cod_empresa = '+inttostr(cadempresa.codempresa)+' and coalesce(status,'''') <> ''CANCELADO''';
       buscaadc.Open;
     end
     else
     begin
       if buscanfscanc.IsEmpty then
       begin
        Application.MessageBox(PWideChar('O.S. sem RPS e não possui cancelamentos para visualizações. Favor Enviar a RPS!'),PWideChar('Aviso'), MB_OK);
        result:=false;
       end;
     end;
   end;
 end
 else
  buscaadc.close;
end;

function TClassNfSe.enviaemailNFSe(vflag: integer;
  AAnexos: TStrings; AloadXML: Boolean): boolean;
var
 Util: OleVariant; // declarar a interface da DLL
 resultado :integer;
 eMailRemetente, nomeRemetente, emailDestinatario, emailBCC, assunto, mensagem, arquivos:widestring;
 smtpCliente, smtpPorta, smtpUsuario, smtpSenha, msgResultado,usassl,varq: widestring;
 para: string;
 vendarq: string;
 vusassl: boolean;
 mememail: TStrings;
 vListaDestinat: TStringList;
 I: Integer;
 ACBrMail1: TACBrMail;

 procedure verificarDestinatarios(pDestinatarios: string);
  var
    vTemp: string;
  begin
    vTemp := StringReplace(pDestinatarios, ',', ';', [rfReplaceAll]);

    if vListaDestinat = nil then
      vListaDestinat := TStringList.Create;

    vListaDestinat.Clear;

    if Pos(';', vTemp) = 0 then
      vListaDestinat.Add(Trim(vTemp))
    else
    begin
      while Pos(';', vTemp) > 0 do
      begin
        if Trim(Copy(vTemp, 1, Pos(';', vTemp) - 1)) <> '' then
          vListaDestinat.Add(Trim(Copy(vTemp, 1, Pos(';', vTemp) - 1)));
        vTemp := Copy(vTemp, Pos(';', vTemp) + 1, Length(vTemp));
      end;
      if Trim(vTemp) <> '' then
        vListaDestinat.Add(Trim(vTemp));
    end;
  end;

begin
  Result := true;
  ErrorSendEmail := False;
  if not SendMail then
    Exit;

  if (BuscasMnt.FieldByName('COD_RPS').AsInteger = 0) then
  begin
    if not SilentMode then
      Application.MessageBox(PWideChar('O.S. sem RPS e sem NF. Envie o RPS ou Consulte o WS por RPS'),PWideChar('Aviso'), MB_OK);
    Exit(false);
  end;

  para := BuscasMnt.FieldByName('email').AsString;
  if SilentMode then
  begin
    if para.Trim.IsEmpty then
      Exit(False);
  end
  else
  begin
    if para.Trim.IsEmpty  then
      Application.MessageBox(PWideChar('Cliente não tem o email cadastrado'), PWideChar('Error'), MB_OK);

    if not InputQuery(strzero(BuscasMnt.FieldByName('COD_RPS').AsInteger,6)+'-'+BuscasMnt.FieldByName('RAZAO').AsString, 'Email de destino', Para) then
      Exit(False);

    if para.Trim.IsEmpty then
    begin
      Application.MessageBox(PWideChar('Email de destino precisa ser preenchida'),PWideChar('Error'), MB_OK);
      Exit(False);
    end;
  end;

  if vflag = 1 then // Flexdocs
  begin
    {
    if result then
    begin
     zerarAtributos;
     pegadadosRPS;
     imprimirRPSNFSe(2);
     if numeroNFSe <> '' then
      vendarq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\PDFNFSe\NFSe'+numeroNFSe+'.PDF'
     else
      vendarq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').
      AsString+'\NFSe\PDFNFSe\RPS'+strzero(buscasmnt.FieldByName('COD_RPS').AsInteger,14)+'.PDF';
     if FileExists(vendarq) then
     begin
       Util := CreateOleObject('NFSe_Util.util'); // instancia a DLL
       eMailRemetente :=trim(cadempresa.vLOGIN_EMP);
       //cadempresa.dataSet.FieldByName('EMAIL_EMP').AsString;
       nomeRemetente :=cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
       emailDestinatario := para; // destinatários separados por , ou ; se existir mais de um
       //emailBCC := 'contato@gmail.com.br'; // conta bcc;
       assunto := trim(cadempresa.vASSUNTO_NFE)+'(NFSe)'; // assunto
       mensagem := cadempresa.dataset.FieldByName('MENSAGEM_NFE').AsString;
       arquivos := vendarq; // anexos, com o caminho completo separados por , ou ; se existir mais de um
       smtpCliente := trim(cadempresa.vSMTP_EMP);
       smtpPorta :=cadempresa.dataSet.FieldByName('PORTA_SMTPTSL').AsString;
       if cadempresa.dataset.FieldByName('EMAIL_USASSL').AsString = 'S' then
         usassl:='1'
       else
         usassl:='0';
       //'587'; // porta do smtp
       smtpUsuario := trim(cadempresa.vLOGIN_EMP); // usuário do smtp
       smtpSenha := trim(cadempresa.vEMAIL_SENHA); // senha
       msgResultado := '';
       mostrarmensagem('Enviando email: '+nomecliente);
  //     resultado := util.EnvEmail(eMailRemetente, nomeRemetente, emailDestinatario, emailBCC, assunto,
  //     mensagem, arquivos, smtpCliente, smtpPorta,usassl, smtpUsuario, smtpSenha, msgResultado);
       resultado :=util.EnvEmail2(eMailRemetente, nomeRemetente, emailDestinatario, emailBCC, assunto,
       mensagem, arquivos, smtpCliente, smtpPorta,usassl, smtpUsuario, smtpSenha,'0','0', msgResultado);

       mostrarmensagem('');
       if not SilentMode then
         if numeroNFSe <> '' then
           MessageDlg( 'NF Resultado do envio:'#13+#13+msgResultado, mtInformation, [mbOk], 0)
         else
           MessageDlg( 'RPS Resultado do envio:'#13+#13+msgResultado, mtInformation, [mbOk], 0);
     end;
    end;
    }
  end;

  ACBrMail1 := TACBrMail.Create(Application);
  try

    if  (vflag = 2) or (vflag = 3) then
    begin

      if (dataSet.FieldByName('N_NF').AsInteger > 0) and
        //(BuscasMnt.FieldByName('emissao_rps').AsDateTime >= EncodeDate(2018, 04, 02)) and
        (cadempresa.IsValadaresComSigISS(BuscasMnt.FieldByName('emissao_rps').AsDateTime)) then // (cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701') then //valadares sistema sigiss
        vflag := 4;// para nao carregar o xml, nota sigiss

      if vflag = 3 then // Nota não carregada ACBRNFSE
      begin
        if not loadXMLdoBanco('NFSe_RPS' + dataset.FieldByName('cod_rps').AsString.Trim, False) then
        begin
          ACBrNFSe1.NotasFiscais.Clear;
          varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe\NFSe\'+trim(dataset.FieldByName('N_NF').AsString)+
          '-nfse.xml';
          if FileExists(Varq) then
          begin
            ACBrNFSe1.NotasFiscais.LoadFromFile(varq);
            acrescentaendACimp;
            vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
          end
          else
            Application.MessageBox(PWideChar('Arquivo XML da NFSe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
        end
        else
          vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
      end;
      if result then
      begin
        assunto:=trim(cadempresa.vASSUNTO_NFE)+'(NFSe)';
        mensagem := cadempresa.dataset.FieldByName('MENSAGEM_NFE').AsString;
        mememail:=TStringList.Create;
        Mememail.Text:=cadempresa.dataset.FieldByName('MENSAGEM_NFE').AsString;
        if vflag = 4 then
        begin
          Mememail.Add('');
          Mememail.Add('Atenção -- O xml contido neste email não é da NFS-e, o XML da NFS-e é enviado pela própria prefeitura de Governador Valadares');
        end;

        if cadempresa.vEMAIL_USASSL = 'S' then
         vusassl:=true
        else
         vusassl:=false;
        nomeRemetente :=cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
        eMailRemetente :=trim(cadempresa.vLOGIN_EMP);

        ACBrNFSe1.MAIL := ACBrMail1;
        ACBrMail1.Host := trim(cadempresa.vSMTP_EMP);
        ACBrMail1.Port := IntToStr(cadempresa.vPORTA_SMTP);
        ACBrMail1.Username := trim(cadempresa.vLOGIN_EMP);
        ACBrMail1.Password := trim(cadempresa.vEMAIL_SENHA);
        ACBrMail1.From := trim(cadempresa.vLOGIN_EMP);
        ACBrMail1.SetSSL := vusassl; // SSL - ConexÃ£o Segura
        ACBrMail1.SetTLS := cadempresa.vEMAIL_USATLS = 'S'; // Auto TLS
        ACBrMail1.ReadingConfirmation := False; //Pede confirmaÃ§Ã£o de leitura do email
        ACBrMail1.UseThread := False;           //Aguarda Envio do Email(nÃ£o usa thread)
        ACBrMail1.FromName := Trim(cadempresa.dataset.fieldbyname('NOME_EMP').asstring);
        verificarDestinatarios(para);
        para := vListaDestinat[0];
        vListaDestinat.Delete(0);

        if vflag = 4 then
        begin
          FdocsNFSe := sigiss_LoadDocEletronico(dataSet.FieldByName('cod_rps').AsInteger);
          sigiss_setNFetoACBr(ACBrNFSe1);
        end;

        begin
        try
        ACBrNFSe1.NotasFiscais.Items[0].EnviarEmail(Para, assunto,
          Mememail
          , True  // Enviar PDF junto
          , vListaDestinat    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
          , AAnexos); // Lista de anexos - TStringsACBrMail1
        except on E: Exception do
          begin
            ErrorSendEmail := True;
            raise Exception.Create(e.Message);
          end
        end;
        end;
  //      verificarDestinatarios(para);
  //      for I := 0 to vListaDestinat.Count - 1 do
  //      ACBrNFSe1.NotasFiscais.Items[0].EnviarEmail(trim(cadempresa.vSMTP_EMP),
  //                                                 inttostr(cadempresa.vPORTA_SMTP),
  //                                                 trim(cadempresa.vLOGIN_EMP),
  //                                                 trim(cadempresa.vEMAIL_SENHA),
  //                                                 eMailRemetente,
  //                                                 vListaDestinat[I],                 // e-mail do destinatário
  //                                                 assunto, // Assunto
  //                                                 Mememail.Lines,     // Mensagem
  //                                                 vusassl,   // SSL
  //                                                 True,                 // Enviar em PDF
  //                                                 nil,                  // sCC
  //                                                 nil,                  // Anexos
  //                                                 True,                 // Pede Confirmação de Recebimento
  //                                                 True,                 // Aguarda o Envio
  //                                                 nomeremetente,    // Nome do remetente
  //                                                 True,                 // TLS
  //                                                 True);                // Usar Thread
        FreeAndNil(mememail);
        if not SilentMode then
          Application.MessageBox(PWideChar('Email enviado com sucesso'),PWideChar('Aviso'), MB_OK);
      end;
    end;
  finally
    if Assigned(ACBrMail1) then
      FreeAndNil(ACBrMail1);
  end;
end;

function TClassNfSe.EnviarNFSEAC: boolean;
var
  Aerrows: string;
begin
  Result := True;

  var metodoNFSe := EMetodoNFSe.Envio;

  try
    verificarCaracteresNFSe;

    ClearErrosNFSe;

    ACBrNFSe1.Emitir(nroLote, meAutomatico, False);

    Aerrows := GetErrosNFSe().Trim;

    if not Aerrows.IsEmpty then
      raise Exception.Create(Aerrows);

//    if ACBrNFSe1.WebService.Emite.Erros.Count > 0 then // os erros serão montados no try except
//      raise Exception.Create('');

    ClearErrosNFSe;

    var raiseErroConsulta := False;

    if (ACBrNFSe1.WebService.Emite.NumeroNota.Trim.IsEmpty) and
       (not ACBrNFSe1.Provider.ConfigGeral.ConsultaSitLote) and
       (ACBrNFSe1.Provider.ConfigGeral.ConsultaLote) and
       (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero.Trim.IsEmpty) then
    begin
      var tentativasAtuais := 0;
      Sleep(ACBrNFSe1.Configuracoes.WebServices.AguardarConsultaRet);

      while (tentativasAtuais < ACBrNFSe1.Configuracoes.WebServices.Tentativas) do
      begin

        ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Clear;
        ACBrNFSe1.ConsultarLoteRps(ACBrNFSe1.WebService.Emite.Protocolo, ACBrNFSe1.WebService.Emite.NumeroLote);

        if not ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero.Trim.IsEmpty then
        begin
          raiseErroConsulta := False;
          metodoNFSe := EMetodoNFSe.ConsultaLote;
          Break;
        end
        else if ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count > 0 then // os erros serão montados no try except
          raiseErroConsulta := True;

        Inc(tentativasAtuais);
        Sleep(ACBrNFSe1.Configuracoes.WebServices.IntervaloTentativas);
      end;

    end;

    if raiseErroConsulta then
    begin
      Aerrows := GetErrosNFSe().Trim;

      if Aerrows.IsEmpty then
        raise Exception.Create(Aerrows);
    end;

  except
    on e: exception do
    begin

      Result := False;

      if not SilentMode then
      begin
        Aerrows := e.Message.Trim;

        if ShowConfirmacao('Erro ao Enviar o NFSe. Mostrar Erro?', MB_YESNO + MB_DEFBUTTON2) = IDYES then
           ShowErro(Aerrows);
      end;
    end;
  end;

  if (not result) and (cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger <> 2) then
  begin
    try
      if not MatchText(ACBrNFSe1.WebService.ConsultaLoteRps.Protocolo.Trim, ['0', '']) then
      begin
        Fprotoloco := ACBrNFSe1.WebService.ConsultaLoteRps.Protocolo.Trim;
        gravaProtocoloWs;
      end;
    except
    end;
  end;

  if result then
    if not VerificaRetornoAC(metodoNFSe) then
      result:=false;
end;

function TClassNfSe.sigiss_EnviarNFSE: Boolean;
var
  AwsSigISS: WebService_SigISSPortType;
  ARetornoNota: tcRetornoNota;
  ADescricaoErros: tcDescricaoErros;
  I: Integer;
  AlastErro: TStrings;
  NumeroNota: Integer;
  NumeroNotaMensagemErro: string;
begin
  Result := False;
  FdocsNFSe.amb_prod := cadempresa.dataSet.FieldByName('webserv_ambiente').AsString = 'Produção';
  FdocsNFSe.dhenvio  := FormatDateTime('DD/MM/YYYY hh:nn:ss', Now);

  AwsSigISS := GetWebService_SigISSPortType(False, sigiss_getUrlWS(FdocsNFSe.amb_prod));
  try
    ARetornoNota := tcRetornoNota.Create;
    try
      FdocsNFSe.sit_orig     := FdocsNFSe.rps.situacao;
      FdocsNFSe.rps.situacao := IfThen(not FdocsNFSe.amb_prod, 'tp', FdocsNFSe.rps.situacao);//aqui sempre envia como tp., pois o ambiente de homologacao nao aceita tt

      AwsSigISS.GerarNota(FdocsNFSe.rps, ARetornoNota, ADescricaoErros);
      if Assigned(ARetornoNota) then
      begin
        if ARetornoNota.Resultado = 1 then
        begin
          FdocsNFSe.aut_ret  := ARetornoNota;
          sigiss_GravarDocEletronico;

          SqlExec('update pedvenda_serv set codigo_verwsnfse = ' + ARetornoNota.autenticidade.QuotedString +
                  ', modelo_NFSe = ''55'', n_nf = ' + ARetornoNota.Nota.ToString +
                  ' where tipo = ''OS'' and cod_empresa = ' + cadempresa.codempresa.ToString +
                  ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                  ' and coalesce(status,'''') <> ''CANCELADO''').Transaction.Commit;

          Result := sigiss_ConsultarNFSE(ARetornoNota.Nota);
        end
        else
        begin
          for I := Low(ADescricaoErros) to High(ADescricaoErros) do
            if Assigned(ADescricaoErros[I]) then
              if ADescricaoErros[I].DescricaoErro.ToUpper.StartsWith('E38') then //id já utilizado, no caso COD_RPS
              begin
                NumeroNota := SqlOpen('select distinct n_nf from pedvenda_serv' +
                                      ' where tipo = ''OS'' and cod_empresa = '+cadempresa.codempresa.ToString  +
                                      ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                                      ' and coalesce(status,'''') <> ''CANCELADO''').FieldByName('n_nf').AsInteger;
                if NumeroNota <= 0 then
                begin
                  NumeroNotaMensagemErro := ADescricaoErros[I].DescricaoErro;
                  NumeroNotaMensagemErro := NumeroNotaMensagemErro.Substring(NumeroNotaMensagemErro.IndexOf('o da NF-e') + 9,
                                                                             NumeroNotaMensagemErro.Length).Trim;
                  NumeroNotaMensagemErro := NumeroNotaMensagemErro.Substring(0 , NumeroNotaMensagemErro.IndexOf('na data')).Trim;
                  NumeroNota             := StrToIntDef(NumeroNotaMensagemErro, 0);
                end;

                if Assigned(FdocsNFSe.rps_resc) then
                  FdocsNFSe.rps := FdocsNFSe.rps_resc;
                Result := sigiss_ConsultarNFSE( NumeroNota );
              end;

          if not Result then
            raise Exception.Create('Erro ao gerar nota no webservice da Prefeitura SIGISS');
        end;

        if Result then
          if not SilentMode then
            if sigiss_setNFetoACBr(ACBrNFSe1) then
            begin
              ACBrNFSe1.NotasFiscais.Imprimir;
              if cadempresa.vENVIAEMAILNFE = 'S' then
                enviaemailNFSe(2);
            end;
      end
      else
        raise Exception.Create('Erro ao gerar nota no webservice da Prefeitura SIGISS. Sem retorno do WS');

    except on E: Exception do
      begin
        Result := False;
        if not SilentMode then
          if Application.MessageBox('Erro ao Enviar o NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          begin
            Application.MessageBox(PWideChar(E.Message + #13 + sigiss_getListRepErrosWS(ADescricaoErros).Text), PWideChar('Error'), MB_OK);
            if Assigned(FdocsNFSe) then
            begin
              AlastErro := TStringList.Create;
              try
                AlastErro.Add(TJson.JsonEncode(TJson.ObjectToJsonObject(FdocsNFSe)));
                AlastErro.SaveToFile(ExtractFilePath(Application.ExeName) + 'erro_obs_nfse.log');
              finally
                FreeAndNil(AlastErro);
      end;
    end;
          end;
      end;
    end;
  finally
    AwsSigISS := nil;
  end;
end;

function TClassNfSe.sigiss_getListRepErrosWS(ADescricaoErros: tcDescricaoErros): TStrings;
var
  I: Integer;
begin
  Result := TStringList.Create;

  for I := Low(ADescricaoErros) to High(ADescricaoErros) do
    if Assigned(ADescricaoErros[I]) then
      Result.Add('ID: '           + ADescricaoErros[I].id.ToString +
                 ' - Processo: '  + ADescricaoErros[I].DescricaoProcesso +
                 ' - Descrição: ' + UTF8ToString(ADescricaoErros[I].DescricaoErro));
end;

function TClassNfSe.sigiss_getUrlWS(Aamb_prod: Boolean): string;
begin
  Result := IfThen( Aamb_prod, 'https://valadares.sigiss.com.br:443/valadares/ws/sigiss_ws.php',
                               'https://testevaladares.sigiss.com.br:443/testevaladares/ws/sigiss_ws.php');
end;

function TClassNfSe.sigiss_getUrlWS: string;
begin
  Result := sigiss_getUrlWS(cadempresa.dataSet.FieldByName('webserv_ambiente').AsString = 'Produção');
end;

function TClassNfSe.sigiss_GravarDocEletronico: Boolean;
var
  AIDDoc_e: string;
  Aseqid: Integer;
begin
  AIDDoc_e := 'RPS' + FdocsNFSe.rps.id_sis_legado;
  try
    Aseqid := SqlOpen('select count(seqid) seqid from DOC_ELETRONICO' +
                      ' where ID_DOC = ' + AIDDoc_e.QuotedString +
                      ' and COD_EMPRESA = ' + cadempresa.codempresa.ToString).FieldByName('seqid').AsInteger;
    buscas.Close;
    buscas.SQL.Text := IfThen(Aseqid > 0,
                              'update DOC_ELETRONICO set DOC = :doc' +
                              ' where ID_DOC = :id_doc' +
                              ' and COD_EMPRESA = :cod_empresa',
                              'INSERT INTO DOC_ELETRONICO (COD_EMPRESA, ID_DOC, DOC)' +
                              ' VALUES (:cod_empresa, :id_doc, :doc)');
    buscas.ParamByName('cod_empresa').AsInteger := cadempresa.codempresa;
    buscas.ParamByName('id_doc').AsString       := AIDDoc_e;
    buscas.ParamByName('doc').AsString          := TJson.JsonEncode(TJson.ObjectToJsonObject(FdocsNFSe));
    buscas.Prepare;
    buscas.ExecSQL;
    buscas.Transaction.Commit;
    Result := True;

  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TClassNfSe.sigiss_LoadDocEletronico(Arps: Integer): TCollection_DocNFSe;
var
  AIDDoc_e: string;
  Ajson: string;
begin
  try
    if Assigned(FdocsNFSe) then
      FreeAndNil(FdocsNFSe);

    AIDDoc_e := 'RPS' + Arps.ToString;
    try
      Ajson     := SqlOpen('select DOC from DOC_ELETRONICO ' +
                           ' where ID_DOC = ' + AIDDoc_e.QuotedString +
                           ' and COD_EMPRESA = ' + cadempresa.codempresa.ToString).FieldByName('doc').AsString.Trim;
      buscas.Close;

      if not Ajson.IsEmpty then
        FdocsNFSe := TJson.JsonToObject<TCollection_DocNFSe>(Ajson);

      if not Assigned(FdocsNFSe) then
        FdocsNFSe := TCollection_DocNFSe.Create;

    except on E: Exception do
      begin
        if not Assigned(FdocsNFSe) then
          FdocsNFSe := TCollection_DocNFSe.Create;
      end;
    end;
  finally
    Result := FdocsNFSe;
  end;
end;

function TClassNfSe.sigiss_retearDadosRecebidosNFSe(ADadosNota: tcDadosNota; Arps: Integer): Boolean;
var
  Aitens: TObjectList<TAuxItensRateio>;
  Aitem: TAuxItensRateio;
  Avalor_b_nfse, Avalor_nfse, Aissret_servico: Extended;

  AchangeAliqISS: Boolean;

  procedure sumItens;
  var
    Ait: TAuxItensRateio;
  begin
    Avalor_b_nfse   := 0;
    Avalor_nfse     := 0;
    Aissret_servico := 0;
    AchangeAliqISS  := False;
    for Ait in Aitens do
    begin
      Avalor_b_nfse     := Avalor_b_nfse     + Ait.valor_b_nfse;
      Avalor_nfse       := Avalor_nfse       + Ait.valor_nfse;
      Aissret_servico   := Aissret_servico   + Ait.issret_servico;

      if RoundTo(Ait.aliq_iss, -2) <> RoundTo(StrToFloatDef(ADadosNota.aliquota_atividade, 0), -2) then
        AchangeAliqISS  := True;
    end;
  end;

begin
  if ADadosNota.OpcaoSimples.Trim.ToUpper.Substring(0, 1).Equals('S') then
    Exit;

  /// Este metodo tinha o objetivo de atualizar os valores que a própria prefeitura calculou, visto que o webservice
  ///  recusa a nota quando enviado a retenção e o cliente não aceita la na prefeitura, então achei melhor deixar como está
  ///  o valor que a prefeitura calcula é a base enviada no rps e a aliquota também enviada quando simples nacional,
  ///  o retorno da prefeitura vem informando apenas se a nota tem a retenção de iss ou nao, o valor liquido não é alterado, nem existe no retorno
  ///  as outras retenções também nao existem no retorno, mesmo enviando no rps o retorno nao existem os campos,
  ///  o sistema entao armazena as retenções como de costume e faz o calculo do valor liquido subtraindo as retenções

  try
    Aitens := TObjectList<TAuxItensRateio>.Create;
    try
      SqlOpen( 'select nped, tipo, cod_servico, nitem, cod_empresa, codigo_nop, valor_b_nfse, valor_nfse, issret_servico, aliq_iss' +
               ' from pedvenda_serv' +
               ' where tipo = ''OS''' +
               ' and cod_empresa = ' + cadempresa.codempresa.ToString +
               ' and cod_rps = ' + Arps.ToString +
               ' and coalesce(status, '''') <> ''CANCELADO''').First;

      while not buscas.Eof do
      begin
        Aitem := TAuxItensRateio.Create;
        with Aitem do
        begin
          nped             := buscas.FieldByName('nped').AsInteger;
          tipo             := buscas.FieldByName('tipo').AsString;
          cod_servico      := buscas.FieldByName('cod_servico').AsInteger;
          nitem            := buscas.FieldByName('nitem').AsInteger;
          cod_empresa      := buscas.FieldByName('cod_empresa').AsInteger;
          codigo_nop       := buscas.FieldByName('codigo_nop').AsFloat;
          base_rateio      := buscas.FieldByName('valor_b_nfse').AsFloat;
          valor_b_nfse     := buscas.FieldByName('valor_b_nfse').AsFloat;
          aliq_iss         := buscas.FieldByName('aliq_iss').AsFloat;
          valor_nfse       := buscas.FieldByName('valor_nfse').AsFloat;
          issret_servico   := buscas.FieldByName('issret_servico').AsFloat;
        end;
        Aitens.Add(Aitem);

        buscas.Next;
      end;

      sumItens;

      if (RoundTo(StrToFloatDef(ADadosNota.base, 0), -2) <> RoundTo(Avalor_b_nfse, -2)) or
         (RoundTo(StrToFloatDef(ADadosNota.valor, 0), -2) <> RoundTo(Avalor_nfse, -2)) or
         (AchangeAliqISS) or
         ((ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) and //retencao de iss com valor diferente
          (RoundTo(StrToFloatDef(ADadosNota.iss, 0), -2) <> RoundTo(Aissret_servico, -2)))or
         ((not ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) and//sem retencao de iss com valor retido no sistema
          (Aissret_servico > 0)) then
      begin
        for Aitem in Aitens do
        begin
          if RoundTo(StrToFloatDef(ADadosNota.base, 0), -2) <> RoundTo(Avalor_b_nfse, -2) then
            Aitem.valor_b_nfse := RoundTo( StrToFloatDef(ADadosNota.base, 0) / Avalor_b_nfse * Aitem.base_rateio , -2);

          if RoundTo(StrToFloatDef(ADadosNota.valor, 0), -2) <> RoundTo(Avalor_nfse, -2) then
            Aitem.valor_nfse := RoundTo( StrToFloatDef(ADadosNota.valor, 0) / Avalor_b_nfse * Aitem.base_rateio , -2);

          if AchangeAliqISS then
            Aitem.aliq_iss := StrToFloatDef(ADadosNota.aliquota_atividade, 0);

          if ((ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) and
            (RoundTo(StrToFloatDef(ADadosNota.iss, 0), -2) <> RoundTo(Aissret_servico, -2))) then
            Aitem.issret_servico := RoundTo( StrToFloatDef(ADadosNota.iss, 0) / Avalor_b_nfse * Aitem.base_rateio , -2);

          if (not ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) then
            Aitem.issret_servico := 0;
        end;
      end;

      sumItens;

      if (RoundTo(StrToFloatDef(ADadosNota.base, 0), -2) <> RoundTo(Avalor_b_nfse, -2)) then
        Aitens.First.valor_b_nfse := Aitens.First.valor_b_nfse + (StrToFloatDef(ADadosNota.base, 0) - Avalor_b_nfse);

      if (RoundTo(StrToFloatDef(ADadosNota.valor, 0), -2) <> RoundTo(Avalor_nfse, -2)) then
        Aitens.First.valor_nfse := Aitens.First.valor_nfse + (StrToFloatDef(ADadosNota.valor, 0) - Avalor_nfse);

      if ((ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S')) and
         (RoundTo(StrToFloatDef(ADadosNota.iss, 0), -2) <> RoundTo(Aissret_servico, -2))) then
        Aitens.First.issret_servico := Aitens.First.issret_servico + (StrToFloatDef(ADadosNota.iss, 0) - Aissret_servico);

      buscas.Close;
      buscas.SQL.Text := ' update pedvenda_serv set' +
                         ' valor_b_nfse = :valor_b_nfse,' +
                         ' valor_nfse = :valor_nfse - (:issret_servico +' +
                         '   coalesce(irrf_servico, 0) + coalesce(pisrf_servico, 0) + coalesce(cofinsrf_servico, 0) + coalesce(csslrf_servico, 0) ) ,' +
                         ' aliq_iss = :aliq_iss,' +
                         ' issret_servico = :issret_servico,' +
                         ' iss_retido = ' + IfThen(ADadosNota.ISSRetido.Trim.ToUpper.Substring(0, 1).Equals('S'), '1', '2') +
                         ' where nped = :nped' +
                         ' and tipo = :tipo' +
                         ' and cod_servico = :cod_servico' +
                         ' and nitem = :nitem' +
                         ' and cod_empresa = :cod_empresa' +
                         ' and codigo_nop = :codigo_nop';
      for Aitem in Aitens do
      begin
        buscas.ParamByName('nped').AsInteger         := Aitem.nped;
        buscas.ParamByName('tipo').AsString          := Aitem.tipo;
        buscas.ParamByName('cod_servico').AsInteger  := Aitem.cod_servico;
        buscas.ParamByName('nitem').AsInteger        := Aitem.nitem;
        buscas.ParamByName('cod_empresa').AsInteger  := Aitem.cod_empresa;
        buscas.ParamByName('codigo_nop').AsFloat     := Aitem.codigo_nop;
        buscas.ParamByName('issret_servico').AsFloat := Aitem.issret_servico;
        buscas.ParamByName('valor_b_nfse').AsFloat   := Aitem.valor_b_nfse;
        buscas.ParamByName('aliq_iss').AsFloat       := Aitem.aliq_iss;
        buscas.ParamByName('valor_nfse').AsFloat     := Aitem.valor_nfse;
        if not buscas.Prepared then
          buscas.Prepare;
        buscas.ExecSQL;
      end;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

    finally
      FreeAndNil(Aitens);
    end;

  except on E: Exception do
    begin
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
    end;
  end;
end;

function TClassNfSe.sigiss_setNFetoACBr(Anfs: TACBrNFSeX): Boolean;
var
  ok: Boolean;
  Anota: tcDadosNota;
begin

  Result := False;
  if not Assigned(FdocsNFSe) then
    Exit;

  if not Assigned(FdocsNFSe.can_nfse) then
    if not Assigned(FdocsNFSe.aut_nfse) then
      Exit;

  if not Assigned(FdocsNFSe.rps) then
    Exit;

  if Assigned(FdocsNFSe.can_nfse) then
    Anota :=  FdocsNFSe.can_nfse
  else
    Anota := FdocsNFSe.aut_nfse;

  Anfs.Configuracoes.WebServices.QuebradeLinha := ';';
  Anfs.NotasFiscais.Clear;

  with Anfs.NotasFiscais.New.NFSe do
  begin
    //IdentificacaoRps.Numero := FdocsNFSe.rps.id_sis_legado;
    IdentificacaoRps.Serie  := Anota.serie_rps;
    IdentificacaoRps.Tipo := trRPS;
    DataEmissao     := TAuxiliar.ConvertStrToDateTime(Anota.dt_conversao, 'YYYY-MM-DD hh:nn:ss');
    DataEmissaoNFSe := DataEmissao;
    DataEmissaoRps  := EncodeDate(FdocsNFSe.rps.rps_ano, FdocsNFSe.rps.rps_mes, FdocsNFSe.rps.rps_dia);
    NaturezaOperacao := no1;
    RegimeEspecialTributacao := Anfs.Provider.
    StrToRegimeEspecialTributacao(ok, StrZero(cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger, 1));
    if (Anota.OpcaoSimples = '1') or (Anota.OpcaoSimples.Substring(0, 1) = 'S') then
      OptanteSimplesNacional := snSim
    else
      OptanteSimplesNacional := Anfs.Provider.
      StrToSimNao(Ok, IfThen(Anota.OpcaoSimples = 'SIM', '1', '2'));
    IncentivadorCultural := Anfs.Provider.
    StrToSimNao(ok, StrZero(cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger, 1));
    if FdocsNFSe.amb_prod then Producao := snSim else Producao := snNao;
    StatusRps := srNormal;
    OutrasInformacoes := '';

    Servico.Valores.ValorServicos  := StrToFloat(Anota.valor);
    servico.Valores.ValorIss       := StrToFloat(Anota.iss);
    servico.valores.Aliquota       := StrToFloat(Anota.aliquota_atividade);
    servico.valores.BaseCalculo    := StrToFloat(Anota.base);
    Servico.Valores.ValorDeducoes  := 0.00;
    Servico.Valores.ValorPis       := StrToFloat(FdocsNFSe.rps.pis);
    Servico.Valores.ValorCofins    := StrToFloat(FdocsNFSe.rps.cofins);
    Servico.Valores.ValorInss      := 0.00;
    Servico.Valores.ValorIr        := StrToFloat(FdocsNFSe.rps.irrf);
    Servico.Valores.ValorCsll      := StrToFloat(FdocsNFSe.rps.csll);
    Servico.Valores.IssRetido      := Anfs.Provider.
    StrToSituacaoTributaria(ok, IfThen(Anota.iSSRetido.Substring(0, 1).Equals('S'), '1', '2'));
    Servico.Valores.ValorIssRetido := StrToFloat(IfThen(Anota.iSSRetido.Substring(0, 1).Equals('S'), Anota.iss, '0'));
    Servico.Valores.OutrasRetencoes        := 0.00;
    Servico.Valores.DescontoIncondicionado := 0.00;
    Servico.Valores.DescontoCondicionado   := 0.00;
    Servico.ItemListaServico               := Anota.servico.ToString.PadLeft(4, '0').Insert(2, '.');
    Servico.xItemListaServico              := OnlyNumber(Servico.ItemListaServico);
    servico.CodigoCnae                     := buscasmnt.FieldByName('cnae_serv').AsInteger.ToString.PadLeft(7, '0');
    Servico.CodigoTributacaoMunicipio      := buscasmnt.FieldByName('CTISS').AsString;
    Servico.Discriminacao                  := Anota.descricao;
    Servico.CodigoMunicipio                := cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger.ToString.PadLeft(7, '0');
    Servico.ExigibilidadeISS               := exiExigivel;
    Servico.MunicipioIncidencia            := StrToIntDef(Servico.CodigoMunicipio, 0) ;

    Prestador.IdentificacaoPrestador.Cnpj               := FdocsNFSe.rps.cnpj;
    Prestador.IdentificacaoPrestador.InscricaoMunicipal := IfThen(FdocsNFSe.rps.ccm.Trim.IsEmpty, cadempresa.dataSet.FieldByName('im_emp').AsString, FdocsNFSe.rps.ccm) ;
    Prestador.IdentificacaoPrestador.InscricaoEstadual  := cadempresa.dataSet.FieldByName('ie_emp').AsString.Trim;

    Prestador.RazaoSocial                 := RetiraCarEsp(Anota.prestador_razao);
    Prestador.NomeFantasia                := cadempresa.fstrNotEsp('fantasia_emp');
    Prestador.Endereco.TipoLogradouro     := '';
    Prestador.Endereco.Endereco           := RetiraCarEsp(Anota.prestador_endereco);
    Prestador.Endereco.Numero             := RetiraCarEsp(IfThen(Anota.prestador_numero.Trim.IsEmpty, cadempresa.fstr('numero_end'), Anota.prestador_numero));
    Prestador.Endereco.Complemento        := RetiraCarEsp(Anota.prestador_complemento);
    Prestador.Endereco.TipoBairro         := '';
    Prestador.Endereco.Bairro             := RetiraCarEsp(Anota.prestador_bairro);
    Prestador.Endereco.CodigoMunicipio    := RetiraCarEsp(Servico.CodigoMunicipio);
    Prestador.Endereco.UF                 := RetiraCarEsp(Anota.prestador_estado);
    Prestador.Endereco.CEP                := RetiraCarEsp(Anota.prestador_cep);
    Prestador.Endereco.xMunicipio         := RetiraCarEsp(Anota.prestador_cidade);
    Prestador.Endereco.CodigoPais         := 1058;
    Prestador.Endereco.xPais              := 'Brasil';

    Prestador.Contato.Telefone := cadempresa.fstrNotEsp('telefone_emp');
    Prestador.Contato.Email := cadempresa.fstrNotEsp('login_emp');

    Tomador.IdentificacaoTomador.CpfCnpj            := Anota.cnpj_tomador;
    Tomador.IdentificacaoTomador.InscricaoMunicipal := FdocsNFSe.rps.tomador_im;
    Tomador.IdentificacaoTomador.InscricaoEstadual  := FdocsNFSe.rps.tomador_ie;

    Tomador.RazaoSocial              := Anota.razao_tomador;
    Tomador.Endereco.Endereco        := Anota.endereco_tomador;
    Tomador.Endereco.Numero          := Anota.numero_tomador;
    Tomador.Endereco.Complemento     := Anota.complemento_tomador;
    Tomador.Endereco.Bairro          := Anota.bairro_tomador;
    Tomador.Endereco.CodigoMunicipio := FdocsNFSe.rps.tomador_cod_cidade;
    Tomador.Endereco.xMunicipio      := Anota.cidade_tomador;
    Tomador.Endereco.UF              := Anota.estado_tomador;
    Tomador.Endereco.CEP             := Anota.cep_tomador;
    Tomador.Endereco.xPais           := 'BRASIL';
    Tomador.Contato.Telefone         := FdocsNFSe.rps.tomador_fone;
    Tomador.Contato.Email            := Anota.email_tomador;

    ValoresNfse.ValorLiquidoNfse     := StrToFloat(Anota.valor);
    ValoresNfse.ValorIss             := StrToFloat(Anota.iss);
    ValoresNfse.Aliquota             := StrToFloat(Anota.aliquota_atividade);
    ValoresNfse.BaseCalculo          := StrToFloat(Anota.base);

    ValoresNfse.ValorLiquidoNfse     := ValoresNfse.ValorLiquidoNfse -
                                        Servico.Valores.DescontoIncondicionado -
                                        Servico.Valores.DescontoCondicionado -
                                        Servico.Valores.ValorPis -
                                        Servico.Valores.ValorCofins -
                                        Servico.Valores.ValorInss -
                                        Servico.Valores.ValorIr -
                                        Servico.Valores.ValorCsll -
                                        Servico.Valores.OutrasRetencoes -
                                        Servico.Valores.ValorIssRetido;

    Servico.Valores.ValorLiquidoNfse := ValoresNfse.ValorLiquidoNfse;

    Servico.Valores.ValorTotalNotaFiscal := ValoresNfse.ValorLiquidoNfse;

    Competencia       := DataEmissaoNFSe;
    Numero            := Anota.nota.ToString;
    numeroNFSe        := Anota.nota.ToString;
    CodigoVerificacao := Anota.autenticidade;

    if Anota.StatusNFe.Trim.ToUpper.Equals('CANCELADA') then
      NfseCancelamento.DataHora := DataEmissaoNFSe;

  end;
  Result := True;
end;

function TClassNfSe.enviarRPS(vos: integer): boolean;
var
  S: string;
begin
  Result := False;

  if vcidadegertxt = nil then
  begin
    ShowAtencao('Cidade do Webservice não Instanciada. Verifique compatibilidade com a cidade em questão');
    exit;
  end;

  mostrarmensagem('Abrindo Tabela O.S: '+nomecliente);

  vcodgar := 0;
  BuscasMnt.Close;
  {
  if verificarGARANTIA(vos) then
  begin
    BuscasMnt.CommandText:='SELECT emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,cl.insc_est,cl.fax,cl.nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cl.cidade,it.ctiss,'+
    'sum(it.VALOR_NFSE) as valor,SUM(it.irrf_servico) as IRRF_SERVICO,SUM(it.ISSRET_SERVICO) as ISSRET_SERVICO,sum(it.VALOR_B_NFSE) AS bruto,'+
    'SUM(IT.PISRF_SERVICO) AS PISRF_SERVICO, SUM(IT.COFINSRF_SERVICO) AS COFINSRF_SERVICO, SUM(CSSLRF_SERVICO) AS CSSLRF_SERVICO ' +
    'FROM PEDVENDA_SERV it inner join pedvenda on it.nped = pedvenda.nped and '+
    'it.tipo = pedvenda.tipo and it.cod_empresa = pedvenda.cod_empresa '+
    'inner join clientes cl on cl.cod_cliente = '+inttostr(vcodgar)+' and pedvenda.cod_empresa = cl.cod_empresa '+
    'inner join empresa emp on it.cod_empresa = emp.cod_empresa inner join cidades cid on cl.cod_cidade = cid.cod_cidade '+
    'inner join estados est on cl.codigo_uf = est.codigo_uf '+
    'where it.nped in ('+vospesq+') and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
    ' and coalesce(it.status,'''') <> ''CANCELADO'' '+
    ' and (it.n_nf is null or it.n_nf <> 0)  group by emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,insc_est,fax,nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cidade,it.ctiss ';
  end
  else
  begin
    BuscasMnt.CommandText:='SELECT emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,cl.insc_est,cl.fax,cl.nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cl.cidade,it.ctiss,'+
    'sum(IT.VALOR_NFSE) as valor,SUM(it.irrf_servico) as IRRF_SERVICO,sum(it.ISSRET_SERVICO) as ISSRET_SERVICO,sum(it.VALOR_B_NFSE) AS bruto,'+
    'SUM(IT.PISRF_SERVICO) AS PISRF_SERVICO, SUM(IT.COFINSRF_SERVICO) AS COFINSRF_SERVICO, SUM(CSSLRF_SERVICO) AS CSSLRF_SERVICO ' +
    'FROM PEDVENDA_SERV it inner join pedvenda on it.nped = pedvenda.nped and '+
    'it.tipo = pedvenda.tipo and it.cod_empresa = pedvenda.cod_empresa '+
    'inner join clientes cl on pedvenda.cod_cliente = cl.cod_cliente and pedvenda.cod_empresa = cl.cod_empresa '+
    'inner join empresa emp on it.cod_empresa = emp.cod_empresa inner join cidades cid on cl.cod_cidade = cid.cod_cidade '+
    'inner join estados est on cl.codigo_uf = est.codigo_uf '+
    'where it.nped in ('+vospesq+') and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
    ' and coalesce(it.status,'''') <> ''CANCELADO'' '+
    ' and (it.n_nf is null or it.n_nf <> 0)  group by emp.serie_serv_nfe,emp.cgc_emp,emp.im_emp,cl.razao,cl.cpfcgc,cl.Insc_municipal,cl.tipo_obra_nfse,'+
    'cl.endereco,cl.NUM_END_CLIENTE,cl.COMPLEMENTO,insc_est,fax,nome_cliente,'+
    'cl.bairro,cl.fone_cliente,cl.email,cid.ibge_cod_cidade,est.sigla_uf,cl.cep,'+
    'it.tipo,it.aliq_iss,it.nfs_servico,it.cnae_serv,it.aliq_iss,it.cod_rps,it.cod_empresa,it.emissao_rps,it.iss_retido,cidade,it.ctiss ';
  end;
  }

  S := 'n.cod_cliente';
  if verificarGARANTIA(dataSet.FieldByName('NPED').AsInteger) then
    S := vcodgar.ToString();

  buscasmnt.CommandText := Format(
    'select' +
    '   serie_serv_nfe, cgc_emp, im_emp, razao, cpfcgc, insc_municipal, tipo_obra_nfse, endereco, num_end_cliente, complemento,' +
    '   insc_est, fax, nome_cliente, bairro, fone_cliente, email, ibge_cod_cidade, sigla_uf, cep, cidade, aliq_iss,' +
    '   nfs_servico, cnae_serv, cod_rps, n_nf, cod_empresa, status_nfse, iss_retido, ctiss,' +
    '   ctribnac, ctribmun, cnbs, nfse_nacional, modelo_nfse, emissao_rps, cod_cliente, codigo_verwsnfse, nfs_servico_ts,' +
    '   sum(IRRF_SERVICO) IRRF_SERVICO, sum(ISSRET_SERVICO) ISSRET_SERVICO, sum(PISRF_SERVICO) PISRF_SERVICO,' +
    '   sum(COFINSRF_SERVICO) COFINSRF_SERVICO , sum(CSSLRF_SERVICO) CSSLRF_SERVICO, sum(BRUTO) BRUTO, sum(VL_LIQ) VL_LIQ,' +
    '   sum(VALORNF) VALORNF, sum(VALOR) VALOR, min(DATA_FECH) DATA_FECH' +
    ' from (' +
    ' select' +
    '   emp.serie_serv_nfe, emp.cgc_emp, emp.im_emp, cl.razao, cl.cpfcgc, cl.insc_municipal, cl.tipo_obra_nfse, cl.endereco,' +
    '   cl.num_end_cliente, cl.complemento, cl.insc_est, cl.fax, cl.nome_cliente, cl.bairro, cl.fone_cliente, cl.email, cid.ibge_cod_cidade,' +
    '   est.sigla_uf, cl.cep, cl.cidade, n.valornf as valor, n.aliq_iss, n.nfs_servico, n.cnae_serv, n.vl_liq, n.valornf,' +
    '   n.cod_rps, n.n_nf, n.cod_empresa, n.data_fech, n.status_nfse, n.iss_retido, n.ctiss, n.ctribnac, n.ctribmun, n.cnbs,' +
    '   n.nfse_nacional, n.modelo_nfse, n.emissao_rps, n.cod_cliente, n.codigo_verwsnfse, n.nfs_servico_ts, n.irrf_servico,' +
    '   n.issret_servico, n.pisrf_servico, n.cofinsrf_servico, n.csslrf_servico, n.bruto' +
    ' from VW_RPS_NFSE_LEGADO n' +
    '   inner join clientes cl on cl.cod_cliente = %s and cl.cod_empresa = n.cod_empresa ' +
    '   inner join empresa emp on n.cod_empresa = emp.cod_empresa ' +
    '   inner join cidades cid on cl.cod_cidade = cid.cod_cidade ' +
    '   inner join estados est on cl.codigo_uf = est.codigo_uf ' +
    ' where n.nped in (%s) and n.cod_empresa = %d' +
    ' )' +
    ' group by serie_serv_nfe, cgc_emp, im_emp, razao, cpfcgc, insc_municipal, tipo_obra_nfse, endereco, num_end_cliente, complemento,' +
    '   insc_est, fax, nome_cliente, bairro, fone_cliente, email, ibge_cod_cidade, sigla_uf, cep, cidade, aliq_iss,' +
    '   nfs_servico, cnae_serv, cod_rps, n_nf, cod_empresa, status_nfse, iss_retido, ctiss,' +
    '   ctribnac, ctribmun, cnbs, nfse_nacional, modelo_nfse, emissao_rps, cod_cliente, codigo_verwsnfse, nfs_servico_ts'
    , [ S, vospesq, cadempresa.codempresa ]
  );

  buscasmnt.Open;
  if BuscasMnt.IsEmpty then
  begin
    Application.MessageBox(PWideChar('Problemas ao localizar dados da O.S. '+#13+'Verifique a Cidade e estado do cliente ou se a O.S. já tem NF'),PWideChar('Aviso'), MB_OK);
    BuscasMnt.close;
    mostrarmensagem('');
    exit;
  end;

  mostrarmensagem('Validando Dados e Montando RPS: '+nomecliente);
  try

    BuscasMnt.First;
    while not BuscasMnt.eof do
    begin
      if (BuscasMnt.FieldByName('VALOR').ascurrency > 0) and
         (validardadosRPS) then
      begin

        try
          var autorizada := False;

          if cadempresa.IsValadaresComSigISS then // if cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
          begin
            sigiss_LoadDocEletronico(buscasmnt.FieldByName('COD_RPS').AsInteger);
            FdocsNFSe.rps_resc := FdocsNFSe.rps;//rescue, caso ja tenha sido enviado uma vez e autorizado sem resposta do ws
            FdocsNFSe.rps      := vcidadegertxt.sigiss_getRPS(Self);

            autorizada := sigiss_EnviarNFSE
          end
          else
          begin
            if ACBrNFSe1.Configuracoes.WebServices.Ambiente = taProducao then
              vcidadegertxt.copiarschemas('P')
            else
              vcidadegertxt.copiarschemas('H');

            var xmlRPS := GetXmlRPS(buscasmnt.FieldByName('COD_RPS').AsInteger);

            if not xmlRPS.IsEmpty then
            begin
              ACBrNFSe1.NotasFiscais.Clear;
              ACBrNFSe1.NotasFiscais.LoadFromString(xmlRPS);

              var nprot := SqlOpen(Format('select nprotNFSe from pedvenda_serv' +
                                          ' where cod_rps = %d and cod_empresa = %d',
                                          [buscasmnt.FieldByName('COD_RPS').AsInteger, cadempresa.codempresa]))
                                          .FieldByName('nprotNFSe').AsString.Trim();

              try

                if not nprot.IsEmpty then
                begin
                  ACBrNFSe1.ConsultarLoteRps(nprot);

                  if ACBrNFSe1.WebService.ConsultaLoteRps.Sucesso then
                    autorizada := VerificaRetornoAC(EMetodoNFSe.ConsultaLote);
                end
                else
                begin
                  ACBrNFSe1.ConsultarNFSeporRps(buscasmnt.FieldByName('COD_RPS').AsString,
                                                cadempresa.fstr('serie_serv_nfe'), '1');

                  if ACBrNFSe1.WebService.ConsultaNFSeporRps.Sucesso then
                    autorizada := VerificaRetornoAC(EMetodoNFSe.ConsutaNota);
                end;

              except on E: Exception do
                LogApp.Error('TClassNfSe.enviarRPS. Consulta antes de autorizar NPROT %s - RPS %d', [nprot, buscasmnt.FieldByName('COD_RPS').AsInteger]);
              end;

            end;

            if not autorizada then
            begin
              vcidadegertxt.montarRPSAC(ACBrNFSe1, Self);

              if GerarRPS() then
                autorizada := EnviarNFSEAC;
            end;

          end;

          Result := autorizada;

        except on e: exception do
          begin
            if ShowConfirmacao('Erro ao Gerar RPS. Mostrar Erro?', MB_YESNO + MB_DEFBUTTON2) = IDYES then
              ShowErro(E.Message);
          end;
        end;

      end;

      BuscasMnt.next;
    end;

  finally
    mostrarmensagem('');
  end;
end;

function TClassNfSe.EnviaWebService(): boolean;
begin
  Result := False;

  mostrarmensagem('');

  if cadempresa.IsValadaresComSigISS then // if cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
    Result := sigiss_EnviarNFSE
  else
    Result := EnviarNFSEAC;

end;

procedure TClassNfSe.FrStatusShowNFSe(Sender: TObject);
begin
 case ACBrNFSe1.Status of
  stNFSeIdle : begin
            if ( frmStatus <> nil ) then frmStatus.Hide;
           end;
  stNFSeRecepcao : begin
                   if ( frmStatus = nil )
                    then frmStatus := TfrmStatus.Create(Application);
                   frmStatus.lblStatus.Caption := 'Enviando dados da NFSe...';
                   frmStatus.Show;
                   frmStatus.BringToFront;
                  end;
  stNFSeConsulta : begin
                   if ( frmStatus = nil )
                    then frmStatus := TfrmStatus.Create(Application);
                   frmStatus.lblStatus.Caption := 'Consultando...';
                   frmStatus.Show;
                   frmStatus.BringToFront;
                  end;
  stNFSeCancelamento : begin
                       if ( frmStatus = nil )
                        then frmStatus := TfrmStatus.Create(Application);
                       frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFSe...';
                       frmStatus.Show;
                       frmStatus.BringToFront;
                      end;
  stNFSeEmail : begin
                if ( frmStatus = nil )
                 then frmStatus := TfrmStatus.Create(Application);
                frmStatus.lblStatus.Caption := 'Enviando Email...';
                frmStatus.Show;
                frmStatus.BringToFront;
               end;
 end;
 Application.ProcessMessages;
end;

function TClassNfSe.GerarRPS(): boolean;
var
  Fentrada:File;
  NumRead,i, cResultado:integer;
  buf: char;
  S: string;
  Util: OleVariant;
  LoteRPSTXT, certificado, LoteRPSXML, cMunicipio, msgResultado, Erros, licenca: Widestring;
  msg:string;
  vstringlist: TStringList;
begin
  result := False;

  nroLote :='1';

  try
    IniciaTransacao;

    nroLote := inttostr(Gencodigo('LOTENFSe', DtmNFEHW.SpIncCodigo,IntToStr(cadempresa.codempresa)));

    buscaadc.Close;
    buscaadc.SQL.text := 'UPDATE pedvenda_serv set' +
                         ' lote_NFSe = ' + nroLote +
                         ' where tipo = ''OS''' +
                         ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
                         ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                         ' and coalesce(status,'''') <> ''CANCELADO''';
    buscaadc.Prepare;
    buscaadc.ExecSQL;

    ACBrNFSe1.NotasFiscais.GerarNFSe;

//    PostXmlRPS(buscasmnt.FieldByName('COD_RPS').AsInteger, ACBrNFSe1.NotasFiscais.Items[0].XMLOriginal, buscaadc);
    PostXmlRPS(buscasmnt.FieldByName('COD_RPS').AsInteger, ACBrNFSe1.NotasFiscais.Items[0].XmlRps, buscaadc);

    CommitaTransacao;

    Result := True;

  except on E: exception do
    begin
      RollBackTransacao;
      if not SilentMode then
        if ShowConfirmacao('Erro ao Gerar LOTE de RPS. Mostrar Erro?', mb_yesno + MB_DEFBUTTON2) = IDYES then
          ShowErro(E.Message);
    end;
  end;
end;

function TClassNfSe.gravaRetornoWs(AXML: string): boolean;
var
  buscasTemp: TIBQuery;
  AFinanceiroUnificado: Boolean;
  AnumeroNFSe: string;
  Aid: string;
begin
  try
    IniciaTransacao;

    buscaadc.Close;

    Result := TRUE;

    mostrarmensagem('Gravando Retorno WebService NFSe: '+nomecliente);

    Fdiscrimina := Fdiscrimina.Replace('''', '''''' , [rfReplaceAll]);

    if Trim(AXML) <> '' then
    begin
      Aid := 'NFSe_RPS' + BuscasMnt.FieldByName('cod_rps').AsString.Trim;
      if SqlOpen('select id_doc from DOC_ELETRONICO where id_doc = ' + QuotedStr(Aid) +
                 ' and cod_empresa = ' +IntToStr(cadempresa.codempresa), buscaadc).IsEmpty then
        SqlExec('insert into DOC_ELETRONICO (id_doc, cod_empresa, doc)' +
                ' values (' + QuotedStr(Aid) + ', ' + IntToStr(cadempresa.codempresa) + ', ' + QuotedStr(AXML) +')', buscaadc);
    end;

    if Fprotoloco <> '' then
    begin
      buscaadc.SQL.text := 'UPDATE pedvenda_serv set' +
                           ' NPROTNFSE = ''' + Fprotoloco + ''',' +
                           ' modelo_NFSe = ''55'' ' +
                           ' where tipo = ''OS''' +
                           ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
                           ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                           ' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
    end;

    if FListaErros <> '' then
    begin
      buscaadc.SQL.text := 'UPDATE pedvenda_serv set' +
                           ' resp_ws_NFSe= ''' + copy(FListaErros,1,1000) + ''',' +
                           ' modelo_NFSe = ''55'' ' +
                           ' where tipo = ''OS''' +
                           ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
                           ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                           ' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
    end;

    if Fcodigover <> '' then
    begin
      buscaadc.SQL.text := 'UPDATE pedvenda_serv set' +
                           ' codigo_verWSNFSe= ''' + Fcodigover + ''', ' +
                           ' n_nf = ' + FnumeroNFSe + ',' +
                           ' outras_infNFSe= ''' + copy(Foutrasinf,1,400) + ''',' +
                           ' modelo_NFSe = ''55'',' +
                           ' status_nfse = ''Autorizada'',' +
                           ' desc_servico_RPS = ''' + copy(Fdiscrimina,1,2000)+''','+
                           ' cnae_respNFSe = ''' + FCodigoCnae + ''',' +
                           ' emissao_NFSE = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataEmissaoNFSe)) +
                           ' where tipo = ''OS''' +
                           ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
                           ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                           ' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
      buscaadc.Close;

      buscas.close;
      buscas.sql.text:='select distinct its.nped from pedvenda_serv its where its.cod_empresa = '+IntToStr(cadempresa.codempresa)+' and its.cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString;
      buscas.Open;
      while not buscas.eof do
      begin
        buscaadc.Close;
        buscaadc.SQL.text := 'UPDATE pedvenda set' +
                             ' NUM_NFEEXT = ' + FnumeroNFSe + ',' +
                             ' VALOR_NFEXT = ' + vvalNFSe+',' +
                             ' DATA_NFEXT = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',FDataEmissaoNFSe)) +
                             ' where tipo = ''OS''' +
                             ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
                             ' and nped = ' + buscas.FieldByName('NPED').AsString;

        buscaadc.Prepare;
        buscaadc.ExecSQL;
        //formas de pagamento e creditos
        try
          AnumeroNFSe := Trim(FnumeroNFSe);
          if StrToIntDef(AnumeroNFSe, -1) = -1 then
            System.Delete(AnumeroNFSe, 1, Length(AnumeroNFSe) - 6);
          buscaadc.Close;
          buscaadc.SQL.Text := 'update formpagamento fp set' +
            ' fp.num_nota = ' + AnumeroNFSe +
            ', fp.sub_serie = ' + IntToStr(YearOf(DataEmissaoNFSe)) +
            ', fp.tip_cnt = ''C'' '+
            ' where  (((fp.nrequisicao = ' + buscas.FieldByName('NPED').AsString +
            ') and fp.tpdocs = ' + QuotedStr('OS') +
            ') or ((fp.rec_numvend = ' + buscas.FieldByName('NPED').AsString +
            ' and fp.tpdocs <> ''LCS'' and fp.rec_tipvend = ' +
            QuotedStr('OS') +
            '))) and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1' +
            ' and fp.num_nota is null';
          buscaadc.ExecSQL;
          buscaadc.Close;
          buscaadc.SQL.Text :=
            'update formpagamento fp set fp.ndoc = ' +QuotedStr(StrZero(StrToInt(AnumeroNFSe), 6))+
              '||substring(fp.ndoc from 7 for (char_length(fp.ndoc) - 6 ) )'+
              ' where  fp.nrequisicao = ' + buscas.FieldByName('NPED').AsString +
              ' and fp.tpdocs = ' + QuotedStr('OS') +
              ' and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1 and fp.tipdoc = ''S2''' +
              ' and char_length(fp.ndoc) > 5' +
              ' and fp.num_nota = ' + AnumeroNFSe +
              ' and fp.sub_serie = ' + IntToStr(YearOf(DataEmissaoNFSe));
          buscaadc.ExecSQL;

          if buscaadc.RowsAffected >  0then
          begin
            buscaadc.Close;
            buscaadc.SQL.Text :=
              'select FINANCEIRO_UNIFICADO from empresa'+
                ' where cod_empresa = ' + IntToStr(cadempresa.codEmpresa);
            buscaadc.Open;

            AFinanceiroUnificado := Trim(buscaadc.FieldByName('FINANCEIRO_UNIFICADO').AsString) = 'S';

            buscasTemp := TIBQuery.Create(Application);
            buscasTemp.Database := buscaadc.Database;
            buscasTemp.Transaction := buscaadc.Transaction;
            try
              buscasTemp.Close;
              buscasTemp.SQL.Text :=
                'select n_processamento from formpagamento fp'+
                  ' where  fp.nrequisicao = ' + buscas.FieldByName('NPED').AsString +
                  ' and fp.tpdocs = ' + QuotedStr('OS') +
                  ' and fp.cod_empresa = ' + IntToStr(cadempresa.codEmpresa) + ' and fp.ativo = 1 and fp.tipdoc = ''S2'' and fp.n_processamento > 0';
              buscasTemp.Open;

              while not buscasTemp.Eof do
              begin
                buscaadc.Close;
                buscaadc.SQL.Text :=
                  'update controle_creditos cc set cc.n_doc_c = '+QuotedStr(StrZero(StrToInt(AnumeroNFSe),6))+
                  '||substring(cc.n_doc_c from 7 for (char_length(cc.n_doc_c) - 6 ) )' +
                  ' where cc.cod_cred = ' + IntToStr(buscasTemp.FieldByName('n_processamento').AsInteger) +
                  ' and cc.' + System.StrUtils.IfThen(AFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + IntToStr(cadempresa.codEmpresa) +
                  ' and char_length(cc.n_doc_c) > 5';
                buscaadc.ExecSQL;

                buscasTemp.Next;
              end;
            finally
              FreeAndNil(buscasTemp);
            end;
          end;
        except
        end;
        /// fim das formas de pagamento e update nos creditos

        buscas.next;
      end;
      buscas.close;
    end;

    if vcoderro = 'S50' then
    begin
      buscaadc.SQL.text := 'UPDATE pedvenda_serv set' +
                           ' status_nfse = ''Em Processamento''' +
                           ' where tipo = ''OS''' +
                           ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
                           ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                           ' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
    end;

    CommitaTransacao;

    mostrarmensagem('');

  except on E: exception do
    begin
      RollBackTransacao;
      if application.messagebox('Erro ao Gravar Retorno WS NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message+' - '+buscaadc.SQL.Text),PWideChar('Error'), MB_OK);
      result := false;
    end;
  end;
end;

function TClassNfSe.getArquivosBoletoParaAnexos(AidDoc: Integer): TStrings;
var
  AFileHtml: TStrings;
  AFileSettings: TStrings;
  ANameHtml, ANamePDF: string;
begin
  if not SendBoleto then
    Exit;

  Result := TStringList.Create;
  AFileHtml := TStringList.Create;
  AFileSettings := TStringList.Create;
  AFileSettings.Clear;

  try
    AFileSettings.Add('[Settings]');
    AFileSettings.Add('HTML=');
    AFileSettings.Add('PDF=');
    AFileSettings.Add('OpenAfterSave=0');

    buscaadc.Close;
    buscaadc.SQL.Text := 'select n_seq_bol, htmlboleto from boletas' +
                         ' where NUM_NF_VND = ' + dataSet.FieldByName('nped').AsInteger.ToString +
                         ' and TIPO_EMISSAO = ''OS''' +
                         ' and cod_empresa = ' + cadempresa.codempresa.ToString +
                         ' and ativo = 1' +
                         ' order by DATA_VEN_BOL';
    buscaadc.Open;
    while not buscaadc.Eof do
    begin
      AFileHtml.Text := buscaadc.FieldByName('htmlboleto').AsString;
      if AFileHtml.Count > 0 then
      begin
        ANameHtml := ExtractFilePath(Application.ExeName) + 'bol_' + buscaadc.FieldByName('n_seq_bol').AsInteger.ToString + '.html';
        ANamePDF  := ExtractFilePath(Application.ExeName) + 'bol_' + buscaadc.FieldByName('n_seq_bol').AsInteger.ToString + '.pdf';

        AFileHtml.SaveToFile(ANameHtml);

        AFileSettings[1] := 'HTML=' + ANameHtml;
        AFileSettings[2] := 'PDF=' + ANamePDF;
        AFileSettings.SaveToFile(ExtractFilePath(Application.ExeName) + 'htm2pdf.ini');
        CreateProcessSimple('htm2pdf.exe "' + ANameHtml + '" "' + ANamePDF + '" /silent', True);

        if FileExists(ANamePDF) then
          Result.Add(ANamePDF);
        DeleteFile(PWideChar(ANameHtml));
      end;

      buscaadc.Next;
    end;

    buscaadc.Close;
  finally
    FreeAndNil(AFileHtml);
    FreeAndNil(AFileSettings);
  end;
end;

function TClassNfSe.getArquivosNFSeParaAnexos(AloadXML: Boolean): TStrings;
var
 varq: widestring;
 vendarq: string;
 provSigIss: Boolean;
begin
  Result := NewStringList('', ';');

  if (BuscasMnt.FieldByName('COD_RPS').AsInteger = 0) then
    raise Exception.Create('O.S. ainda sem RPS');

  provSigIss := False;
  if (dataSet.FieldByName('N_NF').AsInteger > 0) and
    //(BuscasMnt.FieldByName('emissao_rps').AsDateTime >= EncodeDate(2018, 04, 02)) and
    cadempresa.IsValadaresComSigISS(BuscasMnt.FieldByName('emissao_rps').AsDateTime) then //(cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701') then //valadares sistema sigiss
    provSigIss := True;// para nao carregar o xml, nota sigiss

  ACBrNFSe1.NotasFiscais.Clear;
  if not provSigIss then // Nota não carregada ACBRNFSE
  begin
    if not loadXMLdoBanco('NFSe_RPS' + dataset.FieldByName('cod_rps').AsString.Trim, False) then
    begin
      ACBrNFSe1.NotasFiscais.Clear;
      varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe\NFSe\'+trim(dataset.FieldByName('N_NF').AsString)+
      '-nfse.xml';
      if FileExists(Varq) then
      begin
        ACBrNFSe1.NotasFiscais.LoadFromFile(varq);
        acrescentaendACimp;
        vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
      end
      else
        raise Exception.Create('Arquivo XML da NFSe não encontrado no caminho: ' + sLineBreak + varq);
    end
    else
      vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
  end
  else
  begin
    FdocsNFSe := sigiss_LoadDocEletronico(dataSet.FieldByName('cod_rps').AsInteger);
    sigiss_setNFetoACBr(ACBrNFSe1);
  end;

  if ACBrNFSe1.NotasFiscais.Count = 0 then
    raise Exception.Create('Nenhum XML de nota fiscal carregado');

  if not ACBrNFSe1.NotasFiscais.Items[0].XmlNfse.Trim.IsEmpty() then
  begin
    Result.Add(ExtractFilePath(GetPathTemp('')) + ACBrNFSe1.NotasFiscais.Items[0].NFSe.Numero + '.xml');
    NewStringList(ACBrNFSe1.NotasFiscais.Items[0].XmlNfse).SaveToFile(Result[0]);
  end;
  ACBrNFSe1.NotasFiscais.Items[0].ImprimirPDF;
  Result.Add(ACBrNFSe1.DANFSE.ArquivoPDF);

end;

function TClassNfSe.getDiscriminacaoServicos(ACodRps: Integer; Acodtpservico: string;
  AValorNF: Double): string;
var
  vRemoverEnterOBS_OS: Boolean;
  vobsos: string;
  vunidades: string;
  vquantserv: Extended;
  iNped: Integer;
  Q: TQuery_OOP;
begin
  Q := QueryHelper.CreateObj(buscaadc);
  try
    iNped := StrToIntDef(vospesq.Trim(), 0);
    if iNped = 0 then
      iNped := Q.Scalar(
        'select first 1 nped from pedvenda_serv' +
        ' where cod_rps = %d and tipo = ''OS'' and cod_empresa = %d',
        [ ACodRps, cadempresa.codempresa ]
      ).AsInteger;

    if iNped > 0 then
      Result := Q.Table('DOC_ELETRONICO', 'DOC')
        .Equals('ID_DOC', Format('DISCRIMINACAO_NFS_%s_%d', [ 'OS', iNped ]) )
        .Equals('COD_EMPRESA', cadempresa.codempresa)
        .Scalar().AsString;

    if Result <> '' then
      Exit;

  finally
    Q.Free();
  end;

  if ConfSis.ReadString('Impressao', 'DiscriminacaoSimples', 'N').ToUpper().Substring(0,1) = 'S' then
  begin
    Q := QueryHelper.CreateObj(buscaadc);
    try
      Q.Open( 'SELECT IT.DESC_SERV_PED, it.N_NF, e.NFSE_OBSOS_SEMENTER' +
            ' FROM PEDVENDA_SERV IT' +
            ' inner join empresa e on e.cod_empresa = it.cod_empresa' +
            ' WHERE it.cod_rps = %d and it.tipo = ''OS'' and it.cod_empresa = %d' +
            ' order by 1',
            [ACodRps, cadempresa.codempresa]);
      vRemoverEnterOBS_OS := Q.fequals('NFSE_OBSOS_SEMENTER', 'S');

      while not Q.Eof do
      begin
        if Q.query.RecNo = 1 then
          vden := ''
        else
          vden := vden + IfThen(vRemoverEnterOBS_OS , ';' , sLineBreak );

        vden := vden + Q.fstr('DESC_SERV_PED');

        Q.Next();
      end;
      Q.Close();

    finally
      Q.Free();
    end;
  end
  else
  begin

  vRemoverEnterOBS_OS := False;
  Result := '';

  buscaadc.close;
  buscaadc.sql.text:='SELECT NFSE_OBSOS_SEMENTER FROM EMPRESA WHERE cod_empresa = '+cadempresa.codempresa.ToString;
  buscaadc.open;
  vRemoverEnterOBS_OS := buscaadc.FieldByName('NFSE_OBSOS_SEMENTER').AsString.Trim.Equals('S');

  buscaadc.close;
  buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA' +
                     ' WHERE NPED in ('+vospesq+ ') ' +
                     ' and tipo = ''OS'' ' +
                     ' AND cod_empresa = '+cadempresa.codempresa.ToString;
  buscaadc.open;
  while not buscaadc.eof do
  begin
    if not buscaadc.FieldByName('OBS_OS').AsString.Trim.IsEmpty then
      vobsos := vobsos + buscaadc.FieldByName('OBS_OS').AsString + IfThen(vRemoverEnterOBS_OS, '#* , ', ' ;-;');
//     if vRemoverEnterOBS_OS then
//      vobsos := vobsos + buscaadc.FieldByName('OBS_OS').AsString + '#* , '
//    else
//      vobsos := vobsos + buscaadc.FieldByName('OBS_OS').AsString+' ;-;';
    buscaadc.next;
  end;
  if vRemoverEnterOBS_OS then
  begin
    vobsos := vobsos.Replace(#13#10+'#*', '', [rfReplaceAll]);
    vobsos := vobsos.Replace('#*', '', [rfReplaceAll]);
    if Copy(vobsos, Length(vobsos), 1) = ',' then
      System.Delete(vobsos, Length(vobsos), 1);
  end;

  buscaadc.close;
  buscaadc.sql.text:='SELECT IT.DESC_SERV_PED,IT.NPED,IT.VALOR_NFSE,IT.QUANT_SERV_PED FROM PEDVENDA_SERV IT' +
                     ' WHERE it.tipo = ''OS'' '+
                     ' AND it.cod_empresa = ' + cadempresa.codempresa.ToString +
                     ' and cod_rps = ' + ACodRps.ToString;
  buscaadc.open;
  vobsos := vobsos.Replace(#13#10, ';', [rfReplaceAll]);
  vden:='';

  vunidades := '';
  while not buscaadc.eof do
  begin
   vquantserv := buscaadc.FieldByName('QUANT_SERV_PED').AsCurrency;
   if vquantserv = 0 then
     vquantserv:=1;

   vunidades := format('%n',[vquantserv])+ ' X '+
                format('%n',[buscaadc.FieldByName('VALOR_NFSE').AsFloat / vquantserv] )+ '=';
   vden := vden + RetiraCarEsp(buscaadc.FieldByName('DESC_SERV_PED').AsString) + ' - ' +
           vunidades + format('%n',[buscaadc.FieldByName('VALOR_NFSE').AsFloat]);
   vden := vden + '(O.S.: ' + StrZero(buscaadc.FieldByName('NPED').AsInteger, 6)+')';
   if pos(',', vospesq) > 0 then
     vden := vden+',';

   buscaadc.next;
  end;

  vden := vden +';';
  vden := vden +'----------------;';
  vden := vden + vobsos;

  end;

  vden := StringReplace(vden, '&', 'E', [rfIgnoreCase, rfReplaceAll]);
  if Pos('Fonte: IBPT', vden) = 0 then
  begin
   buscaadc.close;
   buscaadc.SQL.Text := 'select aliqnac from TIPOSERVICONFSE where COD_TPSERVICO = ' + Acodtpservico.QuotedString;
   buscaadc.Open;
   if buscaadc.FieldByName('aliqnac').AsFloat > 0 then
     vden := vden + IfThen(vRemoverEnterOBS_OS, ',', ';') +
       'Val Aprox Tributos R$' + Format('%0.2n', [AValorNF * buscaadc.FieldByName('aliqnac').AsFloat / 100]) +
       ' (' + Format('%0.2f', [buscaadc.FieldByName('aliqnac').AsFloat]) + '%) Fonte: IBPT';
  end;
  Result := vden;
end;

function TClassNfSe.GetErrosNFSeObj(): TArray<TErroNFSeWS>;

  procedure AddErro(AMetodo: string; AErro: TNFSeEventoCollectionItem);
  begin
    var newErro := TErroNFSeWS.Create();
    newErro.Metodo := AMetodo;
    newErro.Codigo := AErro.Codigo;
    newErro.Mensagem := AErro.Descricao;
    newErro.Correcao := AErro.Correcao;

    Result := Result + [ newErro ];
  end;

var
  I : Integer;
  itemErro: TNFSeEventoCollectionItem;
begin
  Result := [];

  for I := 0 to ACBrNFSe1.WebService.Emite.Erros.Count - 1 do
    AddErro( 'Emite', ACBrNFSe1.WebService.Emite.Erros.Items[I] );

  for I := 0 to ACBrNFSe1.WebService.ConsultaSituacao.Erros.Count - 1 do
    AddErro( 'ConsultaSituacao', ACBrNFSe1.WebService.ConsultaSituacao.Erros.Items[I]);

  for I := 0 to ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count - 1 do
    AddErro( 'ConsultaLoteRps', ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Items[I]);

  for I := 0 to ACBrNFSe1.WebService.ConsultaNFSeporRps.Erros.Count - 1 do
    AddErro( 'ConsultaNFSeporRps', ACBrNFSe1.WebService.ConsultaNFSeporRps.Erros.Items[I]);

  for I := 0 to ACBrNFSe1.WebService.ConsultaNFSe.Erros.Count - 1 do
    AddErro( 'ConsultaNFSe', ACBrNFSe1.WebService.ConsultaNFSe.Erros.Items[I]);

  for I := 0 to ACBrNFSe1.WebService.CancelaNFSe.Erros.Count - 1 do
    AddErro( 'CancelaNFSe', ACBrNFSe1.WebService.CancelaNFSe.Erros.Items[I]);

  for I := 0 to ACBrNFSe1.WebService.EnviarEvento.Erros.Count - 1 do
    AddErro( 'EnviarEvento', ACBrNFSe1.WebService.EnviarEvento.Erros.Items[I]);

end;

function TClassNfSe.GetErrosNFSe: string;
//var
//  I : Integer;
//  itemErro: TErroNFSeWS;
begin
  Result := '';

  var erros := Self.GetErrosNFSeObj();

  Result := erros.ToString();

  erros.Clear();

  {
  Result := '';

  for I := 0 to ACBrNFSe1.WebService.Emite.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.Emite.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Emissao', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao, sLineBreak,
                          'Correção: ' + itemErro.Correcao]);

  end;

  for I := 0 to ACBrNFSe1.WebService.ConsultaSituacao.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.ConsultaSituacao.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Consulta Situacao', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao, sLineBreak,
                          'Correção: ' + itemErro.Correcao]);

  end;

  for I := 0 to ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Consulta Lote Rps', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao, sLineBreak,
                          'Correção: ' + itemErro.Correcao]);

  end;

  for I := 0 to ACBrNFSe1.WebService.ConsultaNFSeporRps.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.ConsultaNFSeporRps.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Consulta NFSe por Rps', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao, sLineBreak,
                          'Correção: ' + itemErro.Correcao]);

  end;

  for I := 0 to ACBrNFSe1.WebService.CancelaNFSe.Erros.Count - 1 do
  begin
    itemErro := ACBrNFSe1.WebService.CancelaNFSe.Erros.Items[I];

    Result :=  StrConcat([Result, sLineBreak, '-' , sLineBreak,
                          'Consulta NFSe por Rps', sLineBreak,
                          'Codigo: ' + itemErro.Codigo, sLineBreak,
                          'Mensagem: ' + itemErro.Descricao, sLineBreak,
                          'Correção: ' + itemErro.Correcao]);

  end;
  }

end;

function TClassNfSe.GetListaRegimeEspecialTributacao: string;
begin
  Result := '';

  try

    Self.CadEmpresa.dadosGNfe;




    var nfse1 := TACBrNFSeX.Create(nil);
    try

      nfse1.Configuracoes.Geral.CodigoMunicipio := cadempresa.fint('IBGE_COD_CIDADE');
      nfse1.LerCidades;

      var bOK := False;
      for var iReg := Ord(Low(TnfseRegimeEspecialTributacao)) to Ord(High(TnfseRegimeEspecialTributacao)) do
      begin

        var eReg := nfse1.Provider.StrToRegimeEspecialTributacao(bOK, iReg.ToString());
        if bOK then
        begin
          var sReg := nfse1.Provider.RegimeEspecialTributacaoDescricao(eReg);

          if not sReg.IsEmpty() then
            Result := Result + IfThen(not Result.IsEmpty(), sLineBreak) + sReg;
        end;
      end;

    finally
      nfse1.Free;
    end;

  except on E: Exception do
    begin
      Result := '';
      Exit();
    end;
  end;
end;

function TClassNfSe.GetXMLBanco(id: string): string;
begin
  try

    Result := SqlOpen('select doc from DOC_ELETRONICO where id_doc = ' + QuotedStr(id) +
                      ' and cod_empresa = ' +IntToStr(cadempresa.codempresa), buscaadc).FieldByName('doc').AsString.Trim;

  except on E: Exception do
    begin
      Result := '';
      registraErro('TClassNfSe.GetXMLBanco Erro: ' + e.Message);
    end;
  end;
end;

function TClassNfSe.GetXmlNFSe(nfseId: Integer): string;
begin
  Result := GetXMLBanco(Format('NFSe_RPS%d', [nfseId]));
end;

function TClassNfSe.GetXmlRPS(rpsId: Integer): string;
begin
  Result := GetXMLBanco(Format('RPS%d', [rpsId]));
end;

function TClassNfSe.gravaProtocoloWs: boolean;
begin
  try
    IniciaTransacao;
    buscaadc.Close;
    Result:=TRUE;
    mostrarmensagem('Gravando Retorno WebService NFSe: '+nomecliente);
    if Fprotoloco <> '' then
    begin
      buscaadc.SQL.text := 'UPDATE pedvenda_serv set' +
                           ' NPROTNFSE = ''' + Fprotoloco+''',' +
                           ' modelo_NFSe = ''55'' ' +
                           ' where tipo = ''OS''' +
                           ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
                           ' and cod_rps = ' + buscasmnt.FieldByName('COD_RPS').AsString +
                           ' and coalesce(status,'''') <> ''CANCELADO''';
      buscaadc.Prepare;
      buscaadc.ExecSQL;
    end;
    CommitaTransacao;
    mostrarmensagem('');
  except on e: exception do
    begin
      RollBackTransacao;
      if application.messagebox('Erro ao Gravar Protocolo NFSe. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message+' - '+buscaadc.SQL.Text),PWideChar('Error'), MB_OK);
      result:=false;
      exit;
    end;
  end;
end;

function TClassNfSe.imprimedireto(vflag: integer): boolean;
var
 varq: string;
 vt: currency;
begin
 Result:=true;
 if (dataSet.FieldByName('N_NF').AsInteger <> 0) or (dataSet.FieldByName('COD_RPS').AsInteger <> 0) then
 begin
   abrirRPSDireto;
  if vflag = 1 then
  begin
   zerarAtributos;
   pegadadosRPS;
   imprimirRPSNFSe(1);
  end
  else if (dataSet.FieldByName('N_NF').AsInteger > 0) and
    //(BuscasMnt.FieldByName('emissao_rps').AsDateTime >= EncodeDate(2018, 04, 02)) and
    cadempresa.IsValadaresComSigISS(BuscasMnt.FieldByName('emissao_rps').AsDateTime) then //(cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701') then //valadares sistema sigiss
  begin
    FdocsNFSe := sigiss_LoadDocEletronico(dataSet.FieldByName('COD_RPS').AsInteger);
    if sigiss_setNFetoACBr(ACBrNFSe1) then
      ACBrNFSe1.NotasFiscais.Imprimir;
  end
  else
  begin
    if loadXMLdoBanco('NFSe_RPS' + dataset.FieldByName('cod_rps').AsString.Trim, False) then
    begin
      try
        acrescentaendACimp();
        vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
        ACBrNFSe1.NotasFiscais.Imprimir;
      except
        Result := False
      end;
      Exit;
    end;

   varq:=cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\DadosNFSe\NFSe\'+trim(dataSet.fieldbyname('N_NF').AsString)+
   '-nfse.xml';
   if FileExists(Varq) then
   begin
    ACBrNFSe1.NotasFiscais.Clear;
    ACBrNFSe1.NotasFiscais.LoadFromFile(varq);
    if (ACBrNFSe1.Configuracoes.Geral.Provedor in [proBHISS]) then
    begin
//      ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
//        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota*100;
//      ACBrNFSe1.NotasFiscais.Items[0].NFSe.Tomador.Contato.Email:=buscasmnt.FieldByName('email').AsString;
// O pessoal da Actcon corrigiu o problema da aliquota
//     if ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.BaseCalculo > 0 then
//     begin
//       if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.Aliquota > 0 then
//         ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:= ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.Aliquota / 100
//       else
//       if ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss > 0 then
//        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
//        (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss/ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.BaseCalculo);
//     end;
       if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse > 0 then
        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse;
       if (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.IssRetido = stRetencao) and
         (ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss > 0) then
        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss;
    end;
    try
      acrescentaendACimp;
      vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
      ACBrNFSe1.NotasFiscais.Imprimir;
    except
      result:=false;
    end;
   end
   else
    Application.MessageBox(PWideChar('Arquivo XML da NFSe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
  end;
 end
 else
 begin
  Application.MessageBox(PWideChar('O.S. sem RPS e sem NF. Envie o RPS ou Consulte o WS por RPS'),PWideChar('Aviso'), MB_OK);
  result:=false;
 end;
end;

procedure TClassNfSe.imprimirRPSNFSe(vtp: integer);

begin
(*
 with FrmRelRPSNFSe do
 begin
//  qrpNFS_RPS:=TQuickRep.create(Application);
  try
   QRImage1.Picture.LoadFromFile(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\logocid.jpg'); //ou bmp,jpg,jpeg
   QRImage3.Picture.LoadFromFile(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\logoemp.jpg');
  except
    on e: exception do
    begin
      if application.messagebox('Erro ao carrega imagens da logomarca. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
    end;
  end;
  QRLabel1.Caption:='PREFEITURA MUNICIPAL DE '+cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString;
  QRLabel11.Caption:='Secretaria Municipal de Finanças';
  QRLabel12.Caption:='Integração ISS';
  QRLabel13.Caption:=cadempresa.dataSet.FieldByName('endereco_pref').AsString+' - '+
  cadempresa.dataSet.FieldByName('bairro_pref').AsString;
  QRLabel14.Caption:=cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString+' - '+
  buscaSiglaest(cadempresa.dataSet.FieldByName('UF_EMP').asinteger)+' - '+
  cadempresa.dataSet.FieldByName('cep_pref').AsString;
  if numeroNFSe <> '' then
  begin
//    QRLabel15.Caption:=inttostr(YearOf(DataEmissaoNFSe))+'000';
    QRLabel15.Caption:='';
    QRLabel16.Caption:=strzero(numeroNFSe,15);
    QRLabel102.Caption:='RPS '+strzero(buscasmnt.FieldByName('COD_RPS').AsInteger,14)+' Série: '+
    buscasmnt.FieldByName('serie_serv_nfe').asstring+' emitido em '+buscasmnt.FieldByName('emissao_rps').asstring;
    QRLabel17.Caption:=UpperCase(codigover);
    Qrlabel10.Caption:='Código de verificação';
    Qrlabel9.Caption:='Nota:';
    QRLabel111.Caption:='Código QR';
    QRLabel2.Caption:='NOTA FISCAL ELETRÔNICA';
    QRLabel16.Font.Size:=9;
    QRLabel23.Caption:=DateTimeToStr(DataEmissaoNFSe);
    QRLabel24.Caption:=strzero(MonthOf(DataEmissaoNFSe),2)+'/'+inttostr(YearOf(DataEmissaoNFSe));
    QRLabel7.Caption:='VALOR LIQUIDO DA NOTA = '+Format('%n',[FvalorLiq]);
    QRLabel100.Caption:='VALOR TOTAL DA NOTA = '+Format('%n',[BuscasMnt.FieldByName('BRUTO').AsCurrency]);
    QRLabel101.Caption:='Codigo QR';
  end
  else
  begin
    Qrlabel10.Caption:='Código de verificação';
    Qrlabel9.Caption:='RPS:';
    QRLabel15.Caption:=StrZero(BuscasMnt.FieldByName('cod_rps').asinteger,7);
    QRLabel16.Font.Size:=10;
    QRLabel16.Caption:=DateTimeToStr(FdataRPS);
    QRLabel102.Caption:='';
    QRLabel17.Caption:=buscasmnt.FieldByName('serie_serv_nfe').asstring+'/1';
    Qrlabel10.Caption:='SERIE/TIPO RPS';
    QRLabel111.Caption:='';
    QRLabel2.Caption:='RECIBO PROVISÓRIO DE SERVIÇO - RPS';
    QRLabel23.Caption:='';
    QRLabel24.Caption:='';
    QRLabel7.Caption:='VALOR LIQUIDO DO RPS = '+Format('%n',[FvalorLiq]);
    QRLabel100.Caption:='VALOR TOTAL DO RPS = '+Format('%n',[BuscasMnt.FieldByName('BRUTO').AsCurrency]);
    QRLabel101.Caption:='';
  end;
  //QRLabel101.Caption:='Codigo QR';
  //qrLabels Nota Fiscal
  QRLabel25.Caption:=cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString+' - '+
  buscaSiglaest(cadempresa.dataSet.FieldByName('UF_EMP').asinteger);
  QRLabel26.Caption:=NFSeregimetrib(cadempresa.dataSet.FieldByName('NFs_regimeTrib').AsInteger);
  QRLabel27.Caption:=NFSNatop(cadempresa.dataSet.FieldByName('NFs_natop').AsInteger);
  //qrLabels prestador
  QRLabel33.Caption:=cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
  QRLabel34.Caption:='';
  QRLabel35.Caption:=cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
  QRLabel36.Caption:=NFSSimples(cadempresa.dataSet.FieldByName('NFs_optanteSimples').AsInteger);
  QRLabel37.Caption:=NFSSimples(cadempresa.dataSet.FieldByName('incentivadorCult').AsInteger);
  QRLabel43.Caption:=copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,1,2)+'.'+
                      copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,3,3)+'.'+
                      copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,6,3)+'/'+
                      copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,9,4)+'-'+
                      copy(cadempresa.dataSet.FieldByName('CGC_EMP').AsString,13,2);
{   if length(trim(dtm02.QRYempresaCGC_EMP.value)) = 11 then
  QRLabel47.caption:=copy(dtm02.QRYempresaCGC_EMP.value,1,3)+'.'+
                      copy(dtm02.QRYempresaCGC_EMP.value,4,3)+'.'+
                      copy(dtm02.QRYempresaCGC_EMP.value,7,3)+'-'+
                      copy(dtm02.QRYempresaCGC_EMP.value,10,2)    }
//  QRLabel44.Caption:='Incentivador SIM';
  QRLabel45.Caption:=cadempresa.dataSet.FieldByName('IM_EMP').AsString;
//  QRLabel46.Caption:='Incentivador SIM';
  QRLabel47.Caption:=cadempresa.dataSet.FieldByName('IE_EMP').AsString;
  QRLabel48.Caption:=trim(cadempresa.dataSet.FieldByName('ENDRECO_EMP').AsString)+', '+
  cadempresa.dataSet.FieldByName('NUMERO_END').AsString+' '+
  cadempresa.dataSet.FieldByName('BAIRRO_EMP').AsString+' '+
  cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString+' - '+
  buscaSiglaest(cadempresa.dataSet.FieldByName('UF_EMP').asinteger);
  QRLabel50.Caption:=cadempresa.dataSet.FieldByName('EMAIL_EMP').AsString;
  QRLabel52.Caption:=cadempresa.dataSet.FieldByName('TELEFONE_EMP').AsString;
  //tomador de serviços
  QRLabel56.Caption:=buscasmnt.FieldByName('razao').AsString;
  QRLabel58.Caption:=buscasmnt.FieldByName('razao').AsString;
  if length(trim(buscasmnt.FieldByName('cpfcgc').AsString)) = 11 then
     QRLabel65.Caption:=copy(buscasmnt.FieldByName('cpfcgc').AsString,1,3)+'.'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,4,3)+'.'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,7,3)+'-'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,10,2)
  else
   QRLabel65.Caption:=copy(buscasmnt.FieldByName('cpfcgc').AsString,1,2)+'.'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,3,3)+'.'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,6,3)+'/'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,9,4)+'-'+
                      copy(buscasmnt.FieldByName('cpfcgc').AsString,13,2);
  QRLabel66.Caption:=buscasmnt.FieldByName('Insc_municipal').AsString;
  QRLabel67.Caption:='';
  QRLabel70.Caption:=trim(buscasmnt.FieldByName('email').AsString);
  QRLabel68.Caption:=buscasmnt.FieldByName('endereco').AsString+', '+
  buscasmnt.FieldByName('NUM_END_CLIENTE').AsString+' '+
  buscasmnt.FieldByName('COMPLEMENTO').AsString+' '+buscasmnt.FieldByName('BAIRRO').AsString+' '+
  buscasmnt.FieldByName('CIDADE').AsString+'-'+buscasmnt.FieldByName('SIGLA_UF').AsString;
  QRLabel72.Caption:=buscasmnt.FieldByName('fone_cliente').AsString;
  //dados complementares
  buscaadc.close;
  buscaadc.sql.text:='select DESC_TPSERVICO from TIPOSERVICONFSE where '+
  'COD_TPSERVICO = '''+buscasmnt.FieldByName('nfs_servico').AsString+''' and ativo = 1';
  buscaadc.open;
  QRLabel54.Caption:=buscasmnt.FieldByName('nfs_servico').AsString+' - '+
  buscaadc.FieldByName('DESC_TPSERVICO').AsString;
  buscaadc.close;
  if trim(cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString) <> trim(BuscasMnt.FieldByName('CTISS').asstring)  then
  begin
    buscaadc.sql.text:='select first 1 DESC_CNAE from CNAEFISCAL where '+
   'COD_CNAE like '''+trim(BuscasMnt.FieldByName('CTISS').asstring)+'%'' and ativo = 1';
    buscaadc.open;
    QRLabel53.Caption:='CTISS: ';
    FCodigoCnae:=BuscasMnt.FieldByName('CTISS').asstring;
  end
  else
  begin
   QRLabel53.Caption:='CNAE: ';
   buscaadc.sql.text:='select first 1 DESC_CNAE from CNAEFISCAL where '+
   'COD_CNAE like '''+FCodigoCnae+'%'' and ativo = 1';
   buscaadc.open;
  end;
  QRLabel55.Caption:=FCodigoCnae+' - '+buscaadc.FieldByName('DESC_CNAE').AsString;
  buscaadc.close;
  QRLabel79.Caption:='';
  QRLabel66.Caption:='';
  QRLabel73.Caption:='';
  QRLabel76.Caption:='';
  QRLabel75.Caption:='';

  //Discriminação dos serviços
  QRMemo1.Lines.Clear;
//  Fdiscrimina:=StringReplace(Fdiscrimina, '||',#$D#$A, [rfReplaceAll]);
//  Fdiscrimina:=StringReplace(Fdiscrimina, '|',#10, [rfReplaceAll]);

  buscaadc.close;
  buscaadc.sql.text:='SELECT FIRST 1 IT.DESC_SERVICO_RPS FROM PEDVENDA_SERV IT WHERE cod_rps = '+
  buscasmnt.FieldByName('COD_RPS').AsString+' and it.cod_empresa = '+inttostr(cadempresa.codempresa);
  buscaadc.open;
  Fdiscrimina:=buscaadc.FieldByName('DESC_SERVICO_RPS').AsString;
  qrMemo1.Lines.Add(Fdiscrimina);

  //Valor total da nota
  QRLabel84.Caption:=Format('%n',[Fpis]);
  QRLabel85.Caption:=Format('%n',[Fcofins]);
  QRLabel86.Caption:=Format('%n',[Finss]);
  QRLabel87.Caption:=Format('%n',[Fir]);
  QRLabel88.Caption:=Format('%n',[Fcsll]);
  QRLabel89.Caption:=Format('%n',[FoutrasRet]);
  QRLabel91.Caption:=Format('%n',[Fdeducoes]);
  QRLabel92.Caption:=Format('%n',[Fdescadc]);
  QRLabel95.Caption:=Format('%n',[FdescCond]);
  QRLabel96.Caption:=Format('%n',[FbaseCalc]);
  QRLabel99.Caption:=Format('%n',[Faliq]);
  QRLabel108.Caption:=Format('%n',[Fiss]);
  QRLabel111.Caption:=Format('%n',[Fissretido]);
  QRLabel112.Caption:=Format('%n',[FvalorLiq]);
  QRMemo2.Lines.clear;
  qrmemo2.Lines.Add(outrasinf);
  if numeroNFSe <> '' then
   QRMemo3.Lines.Clear
  else
  begin
   QRMemo3.Lines.Clear;
   QRMemo3.Lines.Add('Este RPS é emitido em caráter provisório, não tem validade fiscal '+
   'e deverá ser convertido, pelo prestador do serviço, em Nota Fiscal de Serviço Eletrônica, '+
   'no prazo de 10 dias. A utilização da mesma numeração de RPS para outro serviço prestado '+
   'constitui infração vigente.');
  end;
  if vtp = 1 then
   FrmRelRPSNFSe.qrpNFS_RPS.Preview
  else
  begin
   if numeroNFSe <> '' then
    FrmRelRPSNFSe.gerarPDF(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\PDFNFSe\NFSe'+numeroNFSe+'.PDF')
   else
    FrmRelRPSNFSe.gerarPDF(cadempresa.dataSet.FieldByName('NFE_LOGPATH').
    AsString+'\NFSe\PDFNFSe\RPS'+strzero(buscasmnt.FieldByName('COD_RPS').AsInteger,14)+'.PDF');
  end;
  //Outras informacoes
 end;
// FrmRelRPSNFSe.Free;
*)
end;

function TClassNfSe.iniciaNFSE(TentarProvedorAntigoSeAtivo: Boolean): boolean;
var
  libNFSe: Integer;
  provedorAntigo: string;
  provedorAntigoDANFSenacional: Boolean;
  IniParams: TMemIniFile;
begin
  if ACBrNFSeDANFSeQR1 = nil then
    ACBrNFSeDANFSeQR1 := TACBrNFSeXDANFSeRL.Create(nil);

  if ACBrNFSe1 = nil then
  begin
    ACBrNFSe1 := TACBrNFSeX.Create(nil);

    ACBrNFSe1.DANFSe := ACBrNFSeDANFSeQR1;
    ACBrNFSe1.OnGerarLog := NFSeGerarLog;
  end;

  var sectionCidade := Format('NFSe_%s', [vcidadegertxt.ibgeId]);

  libNFSe := IniConf.ReadInt('Sistema', 'libNFe', -1);
//  libNFSe := IfThen((libNFSe < 0) or (libNFSe > 2), Integer(libOpenSSL), libNFSe);
  libNFSe := IfThen( TSSLLib(libNFSe) in [TSSLLib.libOpenSSL, TSSLLib.libWinCrypt] , libNFSe, Integer(libOpenSSL));

  if not DirectoryExists(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe') then
    CreateDir(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe');
  if not DirectoryExists(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\PDFNFSe') then
    CreateDir(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\PDFNFSe');

  THelperDFe.Configure(ACBrNFSe1, EnumDfeType.enNFSe, cadempresa, True);

  with ACBrNFSe1.Configuracoes.Geral do
  begin
    Salvar           := True;
    ExibirErroSchema := True;
    RetirarAcentos   := True;
    //FormatoAlerta    := ;
    FormaEmissao     := teNormal;

    ConsultaLoteAposEnvio := True;
    ConsultaAposCancelar  := True;
    MontarPathSchema      := False;

    //CNPJPrefeitura := ;

    Emitente.CNPJ           := cadempresa.fstr('cgc_emp');
    Emitente.InscMun        := cadempresa.fstr('im_emp');
    Emitente.RazSocial      := cadempresa.fstr('nome_emp');

    Emitente.DadosEmitente.NomeFantasia      := cadempresa.fstr('fantasia_emp');
    Emitente.DadosEmitente.InscricaoEstadual := cadempresa.fstr('ie_emp');
    Emitente.DadosEmitente.Endereco          := cadempresa.fstr('endreco_emp');
    Emitente.DadosEmitente.Numero            := cadempresa.fstr('numero_end');
    Emitente.DadosEmitente.CEP               := cadempresa.fstr('cep_emp');
    Emitente.DadosEmitente.Bairro            := cadempresa.fstr('bairro_emp');
    Emitente.DadosEmitente.Complemento       := cadempresa.fstr('complemento_emp');
    Emitente.DadosEmitente.Municipio         := cadempresa.fstr('cidade_emp');
    Emitente.DadosEmitente.UF                := cadempresa.fstr('sigla_uf');
    Emitente.DadosEmitente.CodigoMunicipio   := cadempresa.fstr('ibge_cod_cidade');
    Emitente.DadosEmitente.Telefone          := cadempresa.fstr('telefone_emp');
    Emitente.DadosEmitente.Email             := cadempresa.fstr('email_emp');

    if IniConf.FileReadStr('Cidades', cadempresa.fstr('ibge_cod_cidade'), 'Provedor').ToLower.Trim.Equals('issdigital') then
    begin
      Emitente.WSFraseSecr                   := cadempresa.fstr('nfs_cert');
      Emitente.WSSenha                       := decodifica(cadempresa.fstr('licencanfse'));
    end;
    //Emitente.WSUser         := ;
    //Emitente.WSSenha        := ;
    //Emitente.WSFraseSecr    := ;
    //Emitente.WSChaveAcesso  := ;
    //Emitente.WSChaveAutoriz := ;

    {
      Para o provedor ADM, utilizar as seguintes propriedades de configurações:
      WSChaveAcesso  para o Key
      WSChaveAutoriz para o Auth
      WSUser         para o RequestId

      Essas 3 propriedades são geradas pelo provedor quando o emitente se cadastra
    }
  end;

  with ACBrNFSe1.Configuracoes.WebServices do
  begin
    Ambiente   := TpcnTipoAmbiente(IfThen(cadempresa.fequals('webserv_ambiente', 'Produção'), Ord(taProducao), Ord(taHomologacao)));
    Visualizar := cadempresa.fequals('webserv_visualizar', 'SIM');
    Salvar     := True;
    UF         := buscaSiglaest(cadempresa.fint('UF_EMP'));

    // Usar o retorno do tempo medio de resposta do lote e ajusta para aguardar conforme
    AjustaAguardaConsultaRet := False;
    if (IniConf.ReadInt(sectionCidade, 'AguardarConsultaRet', 0) > 0) then
      AguardarConsultaRet := IniConf.ReadInt(sectionCidade, 'AguardarConsultaRet', 0);
    if (IniConf.ReadInt(sectionCidade, 'Tentativas', 0) > 0) then
      Tentativas := IniConf.ReadInt(sectionCidade, 'Tentativas', 0);
    if (IniConf.ReadInt(sectionCidade, 'IntervaloTentativas', 0) > 0) then
      IntervaloTentativas := IniConf.ReadInt(sectionCidade, 'IntervaloTentativas', 0);

    TimeOut    := IniConf.ReadInt(sectionCidade, 'TimeOut', 5) * 1000;
    //ProxyHost := ?.Text;
    //ProxyPort := ?.Text;
    //ProxyUser := ?.Text;
    //ProxyPass := ?.Text;
  end;

  with ACBrNFSe1.Configuracoes.Arquivos do
  begin
    NomeLongoNFSe    := False;
    Salvar           := True;
    SepararPorMes    := False;
    AdicionarLiteral := True;
    EmissaoPathNFSe  := True;
    SepararPorCNPJ   := False;
    //PathGer          := ;
    //PathMensal       := ;
    //PathCan          := ;
    PathSalvar       := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\DadosNFSe';
    PathRPS          := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\DadosNFSe\RPS';
    PathNFSe         := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\DadosNFSe\NFSe';
    if (vcidadegertxt is TClassNFSeDefault) and
       (not vcidadegertxt.PathSchemas.IsEmpty()) then
    begin
      PathSchemas  := vcidadegertxt.PathSchemas;
    end
    else
      PathSchemas    := ExtractFilePath(Application.Exename) + 'schemasNFSe';
  end;

  if IniConf.ReadStr('MD', 'PathXmlPorCNPJ') <> '' then
  begin
    ACBrNFSe1.Configuracoes.Arquivos.PathSalvar := IncludeTrailingPathDelimiter(IniConf.ReadStr('MD', 'PathXmlPorCNPJ')) + 'DadosNFSe\';
    ACBrNFSe1.Configuracoes.Arquivos.PathRPS    := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar + 'RPS\';
    ACBrNFSe1.Configuracoes.Arquivos.PathNFSe   := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar + 'Autorizadas\';
    ACBrNFSe1.Configuracoes.Arquivos.PathCan    := ACBrNFSe1.Configuracoes.Arquivos.PathSalvar + 'Canceladas\';
    ACBrNFSe1.Configuracoes.Arquivos.SepararPorCNPJ := True;
    ACBrNFSe1.Configuracoes.Arquivos.SepararPorModelo := True;
  end;

  if ACBrNFSe1.DANFSe <> nil then
  begin
    // TTipoDANFSE = ( tpPadrao, tpIssDSF, tpFiorilli );
    ACBrNFSe1.DANFSe.TipoDANFSE := tpGeral;
    ACBrNFSe1.DANFSe.Logo       := cadempresa.fstr('nfe_logpath') + '\NFSe\logocid.jpg';
    ACBrNFSe1.DANFSe.Prefeitura := StrConcat(['PREFEITURA MUNICIPAL DE ', cadempresa.fstr('CIDADE_EMP'), sLineBreak,
                                              cadempresa.fstr('endereco_pref'), ' - ',
                                              cadempresa.fstr('bairro_pref'), sLineBreak,
                                              cadempresa.fstr('cidade_emp'), ' - ',
                                              ACBrNFSe1.Configuracoes.WebServices.UF, ' - ',
                                              cadempresa.fstr('cep_pref')]);

    ACBrNFSe1.DANFSe.PathPDF    := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\PDFNFSe';

    ACBrNFSe1.DANFSe.Prestador.Logo := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\logoemp.jpg';

    ACBrNFSe1.DANFSe.MargemDireita  := 5;
    ACBrNFSe1.DANFSe.MargemEsquerda := 5;
    ACBrNFSe1.DANFSe.MargemSuperior := 5;
    ACBrNFSe1.DANFSe.MargemInferior := 5;
    ACBrNFSe1.DANFSe.Sistema := 'HW SISTEMAS';

    ACBrNFSe1.DANFSe.Prestador.RazaoSocial := cadempresa.fstrNotEsp('NOME_EMP');
    ACBrNFSe1.DANFSe.Prestador.NomeFantasia := cadempresa.fstrNotEsp('FANTASIA_EMP');
    ACBrNFSe1.DANFSe.Prestador.InscricaoMunicipal := cadempresa.fstrNotEsp('IM_EMP');
    ACBrNFSe1.DANFSe.Prestador.InscricaoEstadual := cadempresa.fstrNotEsp('IE_EMP');
    ACBrNFSe1.DANFSe.Prestador.CNPJ := cadempresa.fstrNotEsp('CGC_EMP');
    ACBrNFSe1.DANFSe.Prestador.Endereco := cadempresa.fstrNotEsp('ENDRECO_EMP');
    ACBrNFSe1.DANFSe.Prestador.Complemento := cadempresa.fstrNotEsp('COMPLEMENTO_EMP');
    ACBrNFSe1.DANFSe.Prestador.Municipio := cadempresa.fstrNotEsp('CIDADE_EMP');
    ACBrNFSe1.DANFSe.Prestador.UF := cadempresa.fstrNotEsp('SIGLA_UF');
    ACBrNFSe1.DANFSe.Prestador.Fone := cadempresa.fstrNotEsp('TELEFONE_EMP');
    ACBrNFSe1.DANFSe.Prestador.EMail := cadempresa.fstrNotEsp('EMAIL_EMP');
  end;

  // A propriedade CodigoMunicipio tem que ser a ultima a receber o seu valor
  // Pois ela se utiliza das demais configurações
  var idibge := cadempresa.fint('IBGE_COD_CIDADE');
  ACBrNFSe1.LerCidades;

  if MatchText(idibge.ToString(), ['3168606']) then //TO
  begin
    IniParams := TMemIniFile.Create('');
    try
      IniParams.SetStrings(ACBrNFSe1.Configuracoes.WebServices.Params);
      IniParams.WriteString(idibge.ToString(), 'Params', 'NaoDividir100:');
      IniParams.GetStrings(ACBrNFSe1.Configuracoes.WebServices.Params);
    finally
      IniParams.Free;
    end;
  end;

  ConfSis := TConfig_sistema_class.getConf('nfse_config', buscaadc, cadempresa.codempresa);

  provedorAntigo := ConfSis.ReadString(idibge.ToString(), 'ProvedorAntigo');
  provedorAntigoDANFSenacional := ConfSis.ReadString(idibge.ToString(), 'ProvedorAntigoDANFSeNacional').ToUpper.Substring(0,1) = 'S';
  if TentarProvedorAntigoSeAtivo and not string.IsNullOrWhiteSpace(provedorAntigo) then
  begin
    IniParams := TMemIniFile.Create('');
    try
      IniParams.SetStrings(ACBrNFSe1.Configuracoes.WebServices.Params);
      IniParams.WriteString(idibge.ToString(), 'Provedor', provedorAntigo);
      IniParams.GetStrings(ACBrNFSe1.Configuracoes.WebServices.Params);
    finally
      IniParams.Free();
    end;
  end;

  ACBrNFSe1.Configuracoes.Geral.Emitente.WSChaveAcesso := ConfSis.ReadString(idibge.ToString(), 'WSChaveAcesso');
  ACBrNFSe1.Configuracoes.Geral.CodigoMunicipio := idibge;

  if (not TentarProvedorAntigoSeAtivo
      and (ConfSis.ReadString('Impressao', 'DANFSeNacional').Trim().ToUpper().Substring(0,1) = 'S')
      and (ACBrNFSe1.DANFSe <> nil)
    )
    or ( TentarProvedorAntigoSeAtivo and provedorAntigoDANFSenacional
    ) then
  begin
    ACBrNFSe1.DANFSe.TipoDANFSE := tpPadraoNacional;

    if FileExists(ExtractFilePath(Application.Exename) + 'nfse-nacional.jpg') then
      ACBrNFSe1.DANFSe.LogoNFSe := ExtractFilePath(Application.Exename) + 'nfse-nacional.jpg';
  end;

  if not SilentMode then
    ACBrNFSe1.OnStatusChange:=FrStatusShowNFSe;
end;

procedure TClassNfSe.LimparRpsSelecionado();
begin
  var qryAdic := QueryHelper.CreateObj(buscaadc);
  try
    qryAdic.SQL('select max(NPROTNFSE) NPROTNFSE, max(cod_rps) cod_rps, max(coalesce(N_NF,0)) as N_NF' +
                ' from pedvenda_serv where nped = :nped and cod_empresa = :cod_empresa and tipo = ''OS'' and nfse_id is null ')
      .ParamValue('nped', fint('nped') )
      .ParamValue('cod_empresa', cadempresa.codempresa)
      .Open();

    if qryAdic.fint('N_NF') > 0 then
      raise Exception.Create('O.S. possúi número de nota fiscal. Não é possível utilizar esta funcionalidade');

    if not qryAdic.fempty('NPROTNFSE') then
      raise Exception.Create('O.S. possúi número de protocolo. É necessário remover-lo antes de usar esta funcionalidade');

    if qryAdic.fempty('cod_rps') then // nada ha fazer
      Exit;

    if not PesqPros(true, 'NFS008', ' OS: ' + fstr('NPED')) then
      Exit;

    qryAdic.SQL(
      'update pedvenda_serv set' +
      ' nfse_nacional = null,' +
      ' status_nfse = null,' +
      ' valor_nfse = NULL,' +
      ' nprotnfse = null,' +
      ' emissao_nfse = null,' +
      ' lote_nfse = null,' +
      ' n_nf = null,' +
      ' cod_rps = null' +
      ' where nped = :nped' +
      ' and tipo = ''OS'' ' +
      ' and cod_empresa = :cod_empresa' +
      ' and nfse_id is null' +
      ' and cod_rps = :cod_rps')
      .ParamValue('nped', fint('nped'))
      .ParamValue('cod_empresa', fint('cod_empresa'))
      .ParamValue('cod_rps', fint('cod_rps'))
      .ExecSQL()
      .query.Transaction.Commit;

  finally
    qryAdic.Free();
  end;
end;

function TClassNfSe.loadXMLdoBanco(Aid: string; AGerarNFSe: Boolean): Boolean;
var
  AXML: string;
begin
  try
    ACBrNFSe1.NotasFiscais.Clear;

    AXML := SqlOpen('select doc from DOC_ELETRONICO where id_doc = ' + QuotedStr(Aid) +
                    ' and cod_empresa = ' +IntToStr(cadempresa.codempresa), buscaadc).FieldByName('doc').AsString.Trim;

    if AXML <> '' then
    begin
      ACBrNFSe1.NotasFiscais.LoadFromString(AXML, AGerarNFSe);
      acrescentaendACimp;
      //vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self); como chama em outros lugares então fica chamando duas vezes

      if (ACBrNFSe1.Configuracoes.Geral.Provedor in [proBHISS]) then
      begin
        if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse > 0 then
          ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse;
        if (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.IssRetido = stRetencao) and
          (ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss > 0) then
          ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIssRetido := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorIss;
      end;
    end;

    Result := ACBrNFSe1.NotasFiscais.Count > 0;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TClassNfSe.loadXMLdoBanco Erro: ' + e.Message);
    end;
  end;
end;

function TClassNfSe.montaRPSos(vos: integer): boolean;
type
  TTipoRetencaoFederal = (trfSemRetencao, trfComIR, trfComPisCofinsCSLL, trfComIrPisCofinsCSLL);
var
  valiqint: Double;
  vnfs_servicoint: string;
  ctissint: string;
  vcnae_tpserv: string;
  vretissint: integer;
  vrps: integer;
  vdatadia: TDateTime;
  vratservt, vltotserv, vvalservt, vvalissret: real;
  vretiss: integer;
  //vArrayRPSRetencao: array of integer;
  //vCountArray: Integer;
  I: Integer;
  vValorTmp, vRetencaoIRRF, vTotRetencaoIRRF, vSumRetencaoIRRF, vRetencaoContribPIS, vRetencaoContribCOFINS, vRetencaoContribCSSL, vTotRetencaoContribPIS, vTotRetencaoContribCOFINS, vTotRetencaoContribCSSL, vSumRetencaoContribPIS, vSumRetencaoContribCOFINS, vSumRetencaoContribCSSL: Currency;
  vStrRetencaoIRRF, vStrRetencaoContrib: string;
  vRetencaoClienteIR, vRetencaoClienteContrib, vJaTestouGarantia: Boolean;
  ADiscriminacaoServico: string;
  cTribNac, cTribMun, cNBS, S: string;

  function reterRPSparaCliente(pRPS, pOS: Integer; pvospesq: string; tpRetFed: TTipoRetencaoFederal): Boolean;
  var
    vMensagem: string;
    vSql: string;
    eCliRetFed: TTipoRetencaoFederal;
  begin
    // No regime normal para normal vai haver a retencao (Lucro real e presumido)
    //Quando o simples nacional estiver envolvido não vai haver retenção
    // Agora tem um campo para essas retenções, usando ret_fed para isso
    Result := false;
    vSql := 'pv.cod_cliente';
    if (pOS > 0) and (not vJaTestouGarantia) then
    begin
      if verificarGARANTIA(pOS, False) then
        vSql := IntToStr(vcodgar);
      vJaTestouGarantia := True;
    end
    else if vJaTestouGarantia and (vcodgar > 0) then
      vSql := IntToStr(vcodgar);

    buscaadc.Close;
    buscaadc.SQL.Text :=
    'select first 1 cl.cod_cliente, cl.cpfcgc, cl.regime, cl.nome_cliente, cl.razao, e.regime regime_empresa, cl.ret_fed_nfs from pedvenda pv' +
    ' inner join clientes cl on cl.cod_cliente = ' + vSql + ' and cl.cod_empresa = pv.cod_empresa' +
    ' inner join empresa e on e.cod_empresa = cl.cod_empresa' +
    ' inner join pedvenda_serv ps on ps.nped = pv.nped and ps.tipo = pv.tipo and ps.cod_empresa = pv.cod_empresa' +
    ' where pv.nped in (' + pvospesq + ')' +
    ' and pv.tipo = ''OS''' +
    ' and pv.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
    ' and ps.cod_rps = ' + IntToStr(pRPS) +
    ' and ps.nfse_id is null ';
    buscaadc.Open;

    var retfed := buscaadc.FieldByName('ret_fed_nfs').AsInteger;
    if retfed > 3 then
      Exit(False);

    eCliRetFed := TTipoRetencaoFederal(retfed);

    if eCliRetFed = trfSemRetencao then
      Exit(False);

    Result := (tpRetFed = eCliRetFed) or (eCliRetFed = trfComIrPisCofinsCSLL);

    //Result := buscaadc.FieldByName('ret_fed_nfs').AsInteger = 1;
    Exit;

    if (Trim(buscaadc.FieldByName('regime_empresa').AsString) = 'LUCRO REAL') or (Trim(buscaadc.FieldByName('regime_empresa').AsString) = 'LUCRO PRESUMIDO') then
      Result := True;

    if Result then
      Result := Length(Trim(buscaadc.FieldByName('cpfcgc').AsString)) = 14;

    if (Result) and (Trim(buscaadc.FieldByName('regime').AsString) = '') then
    begin
      vMensagem := 'Cadastro de cliente incompleto para emissão da NFS-e' + #13 + 'Cliente: ' + IntToStr(buscaadc.FieldByName('cod_cliente').AsInteger) + #13 + '         ' + Trim(buscaadc.FieldByName('nome_cliente').AsString) + #13 + '         ' + Trim(buscaadc.FieldByName('razao').AsString) + #13 + #13 + 'Por favor preencha no cadastro o campo Regime Federal, o sistema necessita da informação para reter ou não valores' + ' de IRRF/PIS/COFINS/CSSL';
      Application.MessageBox(PWideChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
      buscaadc.sql.Text := '';
      raise Exception.Create(vMensagem);
    end;

    if (Result) and ((Trim(buscaadc.FieldByName('regime').AsString) = 'SIMPLES') or (Trim(buscaadc.FieldByName('regime').AsString) = 'MEI')) then
      Result := False;

  end;

begin
  var listRpsRetencao := TStringList.Create;
  var qryAdic := QueryHelper.CreateObj(buscaadc);
  try
    // a retenção do IRRF e da Contribuicao esta sendo efetuada no final do metodo
    result := true;
    IniciaTransacao;
    vdatadia := getDatahoraBanco(buscas, cadempresa.vusdataserv);
    vvalservt := 0;
    vltotserv := 0;
    vvalissret := 0;
    //Soma todos os serviços da O.S.
    buscaadc.close;
    buscaadc.sql.text :=
      'select sum(valor_tot_serv+coalesce(rateio_acresc,0)-rateio_desc) as valor from ' +
      'pedvenda_serv where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
      ' and nfse_id is null and coalesce(status,'''') <> ''CANCELADO''';
//buscaadc.sql.text:='select sum(valor_tot_serv-rateio_desc) as valor from '+
//'pedvenda_serv where nped = '+inttostr(vos)+' and tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa);
    buscaadc.open;
    vltotserv := buscaadc.FieldByName('VALOR').AsCurrency;
// busca Serviço de terceiro...
    buscaadc.close;
    buscaadc.sql.text := 'select sum(VL_SERVT) as valor from ' + 'PEDVENDA_SERV_TERC where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa);

//buscaadc.sql.text:='select sum(VL_SERVT) as valor from '+
//'PEDVENDA_SERV_TERC where nped = '+inttostr(vos)+' and tipo = ''OS'' and cod_empresa = '+IntToStr(cadempresa.codempresa);
    buscaadc.open;
    vvalservt := buscaadc.FieldByName('VALOR').AsCurrency;
//Faz a proporcionalidade do Serviço em relação ao Serviço de terceiro...
    BuscasMnt.close;
    BuscasMnt.CommandText :=
      'select it.* from pedvenda_serv it where ' +
      'it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
      ' and (it.status_nfse is null or it.status_nfse = '''') ' +
      ' and it.nfse_id is null and coalesce(it.status,'''') <> ''CANCELADO''';
    BuscasMnt.Open;
    while not BuscasMnt.eof do
    begin
      vretiss := 0;
      BuscasMnt.edit;
      vratservt := 0;
      if vvalservt <> 0 then
      begin
        if vltotserv <> 0 then
        begin
          vratservt := (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency +
            BuscasMnt.FieldByName('rateio_acresc').AsCurrency -
            BuscasMnt.FieldByName('rateio_desc').AsCurrency) / vltotserv) * vvalservt);
        end;
      end;
      buscaadc.close;
      buscaadc.sql.Text := 'select coalesce(iss_retido,0) as iss_retido from clientes where cod_cliente = ' + '(select cod_cliente from pedvenda where nped = ' + BuscasMnt.FieldByName('NPED').AsString + ' and tipo = ''' + BuscasMnt.FieldByName('TIPO').AsString + ''' and cod_empresa = ' + BuscasMnt.FieldByName('COD_EMPRESA').AsString + ') and cod_empresa = ' + BuscasMnt.FieldByName('COD_EMPRESA').AsString;
      buscaadc.Open;
      if buscaadc.FieldByName('iss_retido').AsInteger <> 0 then
        vretiss := buscaadc.FieldByName('iss_retido').AsInteger;

      // qryAdic é igual buscaadc
      qryAdic.SQL('select ts.irrf_servico, ts.vl_teto_irrf, iif(cs.value1_f = 1, e.aliq_simples_iss, ts.aliq_iss) aliq_iss, ts.iss_retido' +
                  ' from tipo_servico ts' +
                  ' inner join empresa e on e.cod_empresa = :cod_empresa' +
                  ' left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = e.cod_empresa' +
                  ' where cod_servico = :cod_servico   ')
        .ParamValue('cod_empresa', cadempresa.codempresa)
        .ParamValue('cod_servico', BuscasMnt.FieldByName('COD_SERVICO').AsInteger)
        .Open();

      if (vretiss = 0) then
      begin
        if buscaadc.FieldByName('ISS_RETIDO').AsInteger <> 0 then
          vretiss := buscaadc.FieldByName('ISS_RETIDO').AsInteger
        else
          vretiss := 2;
      end;
      BuscasMnt.FieldByName('VALOR_B_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency +
        BuscasMnt.FieldByName('rateio_acresc').AsCurrency -
        BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;

      if buscaadc.FieldByName('irrf_servico').AsCurrency <> 0 then
      begin
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency +
          BuscasMnt.FieldByName('rateio_acresc').AsCurrency -
          BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;
        if BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency >= buscaadc.FieldByName('VL_TETO_IRRF').AsCurrency then
        begin
          BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := ((BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency * buscaadc.FieldByName('irrf_servico').AsCurrency) / 100);
          BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency - ((BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency * buscaadc.FieldByName('irrf_servico').AsCurrency) / 100);
        end
        else
        begin
          BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := 0;
          BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency := 0;
        end;
      end
      else
      begin
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency +
          BuscasMnt.FieldByName('rateio_acresc').AsCurrency -
          BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;
        BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := 0;
        BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency := 0;
      end;
      if vretiss = 1 then
      begin
        vvalissret := (BuscasMnt.FieldByName('VALOR_B_NFSE').AsCurrency * (buscaadc.FieldByName('ALIQ_ISS').AsFloat / 100));
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency - vvalissret;
//    (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency-BuscasMnt.FieldByName('rateio_desc').AsCurrency)+vratservt)*
//    (buscaadc.FieldByName('ALIQ_ISS').AsFloat/100));
        BuscasMnt.FieldByName('ISSRET_SERVICO').AsCurrency := vvalissret;
//    (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency-BuscasMnt.FieldByName('rateio_desc').AsCurrency)+vratservt)*
//    (buscaadc.FieldByName('ALIQ_ISS').AsFloat/100));
      end;
      BuscasMnt.FieldByName('iss_retido').AsInteger := vretiss;
      BuscasMnt.Post;
      BuscasMnt.ApplyUpdates(-1);
      BuscasMnt.next;
    end;
//
    BuscasMnt.close;
    BuscasMnt.CommandText := 'select it.* from os_item_serv it where ' + 'it.n_os in (' + vospesq + ') and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and (it.status_nfse is null or it.status_nfse = '''')';

//BuscasMnt.CommandText:='select it.* from os_item_serv it where '+
//'it.n_os = '+inttostr(vos)+' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+' and (it.status_nfse is null or it.status_nfse = '''')';
    BuscasMnt.Open;
    while not BuscasMnt.eof do
    begin
      vretiss := 2;
      BuscasMnt.edit;
      vratservt := 0;
      if vvalservt <> 0 then
      begin
        if vltotserv <> 0 then
        begin
          vratservt := (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency +
            BuscasMnt.FieldByName('rateio_acresc').AsCurrency -
            BuscasMnt.FieldByName('rateio_desc').AsCurrency) / vltotserv) * vvalservt);
        end;
      end;
      buscaadc.close;
      buscaadc.sql.text := 'select irrf_servico,VL_TETO_IRRF from ' + 'TIPO_SERVICO where cod_servico = ' + trocaVirgulaPorPonto(BuscasMnt.FieldByName('COD_SERVICO').AsString);
      buscaadc.open;
      if buscaadc.FieldByName('irrf_servico').AsCurrency <> 0 then
      begin
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency +
          BuscasMnt.FieldByName('rateio_acresc').AsCurrency -
          BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;

        if BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency >= buscaadc.FieldByName('VL_TETO_IRRF').AsCurrency then
        begin
          BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := ((BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency * buscaadc.FieldByName('irrf_servico').AsCurrency) / 100);
          BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency - ((BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency * buscaadc.FieldByName('irrf_servico').AsCurrency) / 100);
        end
        else
          BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := 0;
      end
      else
      begin
        BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency := (BuscasMnt.FieldByName('valor_tot_serv').AsCurrency +
          BuscasMnt.FieldByName('rateio_acresc').AsCurrency -
          BuscasMnt.FieldByName('rateio_desc').AsCurrency) + vratservt;

        BuscasMnt.FieldByName('IRRF_SERVICO').AsCurrency := 0;
      end;
{  BuscasMnt.FieldByName('VALOR_NFSE').AsCurrency:=(BuscasMnt.FieldByName('valor_tot_serv').AsCurrency-
  BuscasMnt.FieldByName('rateio_desc').AsCurrency)+vratservt;}
      BuscasMnt.Post;
      BuscasMnt.ApplyUpdates(-1);
      BuscasMnt.next;
    end;
    CommitaTransacao;
    Sleep(1000);
    IniciaTransacao;

    // qryAdic é igual buscaadc
    {
    qryAdic.SQL('select tp.ctiss, iif(cs.value1_f = 1, e.aliq_simples_iss, tp.aliq_iss) aliq_iss, ' +
                '       tp.nfs_servico, tp.cnae_serv, it.iss_retido, tp.ctribnac, tp.ctribmun, tp.cnbs, ' +
                '       tp.irrf_servico, it.cod_servico, it.nped, it.cod_rps,' +
                '       (it.valor_tot_serv + coalesce(it.rateio_acresc,0) - it.rateio_desc) as valor' +
                ' from tipo_servico tp' +
                '  inner join pedvenda_serv it on tp.cod_servico = it.cod_servico and' +
                '        it.nped in (:vospesq) and' +
                '        it.tipo = ''OS'' and' +
                '        it.cod_empresa = :cod_empresa and' +
                '        (it.n_nf is null or it.n_nf = 0) and' +
                '        coalesce(it.status, '''') <> ''CANCELADO''' +
                ' inner join empresa e on e.cod_empresa = :cod_empresa' +
                ' left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = e.cod_empresa' +
                ' order by 1, 2, 3, 4, 5, 6, 7, 8')
      .ParamValue('cod_empresa', cadempresa.codempresa)
      .ParamReplace('vospesq', vospesq)
      .Open();
    }
    qryAdic.SQL('select  tp.ctiss, iif(cs.value1_f = 1, e.aliq_simples_iss, tp.aliq_iss) aliq_iss, ' +
                '       tp.nfs_servico, tp.cnae_serv, it.iss_retido, tp.ctribnac, tp.ctribmun, tp.cnbs, ' +
                '       tp.irrf_servico, it.cod_servico, it.nped, it.cod_rps,' +
                '       (it.valor_tot_serv + coalesce(it.rateio_acresc,0) - it.rateio_desc) as valor,' +
                '       coalesce(it.nfse_nacional, coalesce(cn.value1_f, 0)) nfse_nacional ' +
                ' from tipo_servico tp' +
                '  inner join pedvenda_serv it on tp.cod_servico = it.cod_servico and' +
                '        it.nped in (:vospesq) and' +
                '        it.tipo = ''OS'' and' +
                '        it.cod_empresa = :cod_empresa and' +
                '        it.nfse_id is null and' +
                '        (it.n_nf is null or it.n_nf = 0) and' +
                '        coalesce(it.status, '''') <> ''CANCELADO''' +
                ' inner join empresa e on e.cod_empresa = :cod_empresa' +
                ' left join config_sistema cs on cs.chave = ''nfse_simples_nacional_aliq'' and cs.cod_empresa = e.cod_empresa ' +
                ' left join config_sistema cn on cn.chave = ''nfse_config'' and cn.cod_empresa = e.cod_empresa ' +
                ' order by 1, 2, 3, 4, 5, 6, 7, 8')
      .ParamValue('cod_empresa', cadempresa.codempresa)
      .ParamReplace('vospesq', vospesq)
      .Open();

    //buscaadc.close;
    //buscaadc.sql.text := 'select tp.ctiss,tp.aliq_iss,tp.nfs_servico,tp.cnae_serv,it.iss_retido,tp.irrf_servico,it.cod_servico,' + 'it.nped,it.cod_rps,(it.valor_tot_serv-it.rateio_desc) as valor  from ' + 'tipo_servico tp inner join pedvenda_serv it on tp.cod_servico = it.cod_servico and ' + 'it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and (it.n_nf is null or it.n_nf = 0) ' + ' and coalesce(it.status,'''') <> ''CANCELADO'' order by 1,2,3,4,5';
//'inner join pedvenda pd on it.nped = pd.nped and it.tipo = pd.tipo and it.cod_empresa = pd.cod_empresa '+
//'inner join clientes cl on pd.cod_cliente = cl.cod_cliente and pd.cod_empresa = cl.cod_empresa ';

//buscaadc.sql.text:='select tp.aliq_iss,tp.nfs_servico,tp.cnae_serv,tp.iss_retido,tp.irrf_servico,it.cod_servico,'+
//'it.nped,it.cod_rps,(it.valor_tot_serv-it.rateio_desc) as valor from '+
//'tipo_servico tp inner join pedvenda_serv it on tp.cod_servico = it.cod_servico and '+
//'it.nped = '+inttostr(vos)+' and it.tipo = ''OS'' and it.cod_empresa = '+IntToStr(cadempresa.codempresa)+
//' and (it.n_nf is null or it.n_nf = 0) ';
    //buscaadc.open;
    valiqint := 0;
    vnfs_servicoint := '';
    ctissint := '';
    vcnae_tpserv := '';
    vretissint := 0;
    cTribNac := '';
    cTribMun := '';
    cNBS := '';
    vosNFSe := vos;
    while not buscaadc.eof do
    begin
      if buscaadc.FieldByName('valor').AsCurrency > 0 then
      begin
        if (RoundTo(valiqint, -4) <> RoundTo(buscaadc.fieldbyname('aliq_iss').AsFloat, -4)) or
          (buscaadc.fieldbyname('nfs_servico').AsString <> vnfs_servicoint) or
          (ctissint <> buscaadc.fieldbyname('ctiss').AsString) or
          (vretissint <> buscaadc.fieldbyname('iss_retido').AsInteger) or
          (vcnae_tpserv <> buscaadc.fieldbyname('cnae_serv').AsString) or
          (not qryAdic.fequals('cTribNac', cTribNac)) or
          (not qryAdic.fequals('cTribMun', cTribMun)) or
          (not qryAdic.fequals('cNBS', cNBS)) then
        begin
          if buscaadc.FieldByName('COD_RPS').AsInteger = 0 then
            vrps := Gencodigo('RPS', DtmNFEHW.SpIncCodigo, IntToStr(cadempresa.codempresa))
          else
            vrps := buscaadc.FieldByName('COD_RPS').AsInteger;
          valiqint := buscaadc.fieldbyname('aliq_iss').AsFloat;
          vnfs_servicoint := buscaadc.fieldbyname('nfs_servico').AsString;
          ctissint := buscaadc.fieldbyname('ctiss').AsString;
          vretissint := buscaadc.fieldbyname('iss_retido').AsInteger;
          vcnae_tpserv := buscaadc.fieldbyname('cnae_serv').AsString;
          cTribNac := qryAdic.fstr('cTribNac');
          cTribMun := qryAdic.fstr('cTribMun');
          cNBS := qryAdic.fstr('cNBS');
        end;

        S := '';
        if buscaadc.FieldByName('COD_RPS').AsInteger = 0 then
          S := ' cod_rps = ' + inttostr(vrps) + ',' +
               ' emissao_rps = ' + QuotedStr(FormatDateTime('mm/dd/yyyy hh:nn:ss', vdatadia)) + ',';

        if qryAdic.fequals('nfse_nacional', '1') then
          S := S +
            ' nfse_nacional = ' + qryAdic.fint('nfse_nacional').ToString() + ',' +
            ' cTribNac = ' + qryAdic.fstr('cTribNac').QuotedString() + ',' +
            ' cTribMun = ' + qryAdic.fstr('cTribMun').QuotedString() + ',' +
            ' cNBS = ' + qryAdic.fstr('cNBS').QuotedString()
        else
          S := S +
            ' cTribNac = ' + qryAdic.fstr('cTribNac').QuotedString() + ',' +
            ' nfs_servico = ''' + buscaadc.fieldbyname('nfs_servico').AsString + ''',' +
            ' cnae_serv = ' + buscaadc.fieldbyname('cnae_serv').AsString + ',' +
            ' ctiss = ''' + buscaadc.fieldbyname('ctiss').AsString + ''' ';

        buscas.close;
        buscas.sql.text := 'UPDATE PEDVENDA_SERV SET' +
                           ' aliq_iss = :aliq_iss,' +
                           ' iss_retido = ' + IfThen( buscaadc.fieldbyname('iss_retido').AsInteger = 1, '1', '2') + ',' +
                           S +
                           ' where nped = ' + buscaadc.fieldbyname('nped').AsString +
                           ' and tipo = ''OS''' +
                           ' and nfse_id is null' +
                           ' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
                           ' and cod_servico = ' + buscaadc.fieldbyname('cod_servico').AsString +
                           ' and coalesce(status,'''') <> ''CANCELADO''';
        buscas.ParamByName('aliq_iss').AsFloat := buscaadc.fieldbyname('aliq_iss').AsFloat;
        buscas.Prepare;
        buscas.ExecSQL;
      end;
      buscaadc.next;
    end;

  //Efetuando as retenções se for o caso
 //Soma todos os serviços da O.S.
    buscaadc.close;
    buscaadc.sql.text := 'select sum(valor_tot_serv + coalesce(rateio_acresc,0) - rateio_desc) as valor from ' +
    'pedvenda_serv where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa) +
    ' and nfse_id is null and coalesce(status,'''') <> ''CANCELADO''';
    buscaadc.open;
    vltotserv := buscaadc.FieldByName('VALOR').AsCurrency;
  // busca Serviço de terceiro...
    buscaadc.close;
    buscaadc.sql.text := 'select sum(VL_SERVT) as valor from ' + 'PEDVENDA_SERV_TERC where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa);
    buscaadc.open;
    vvalservt := buscaadc.FieldByName('VALOR').AsCurrency;

  //soma dos valores totais por rps
    BuscasMnt.close;
    BuscasMnt.CommandText :=
      'select it.cod_rps, tp.nfs_servico, ' +
      '       sum(coalesce(it.valor_tot_serv,0) + coalesce(it.rateio_acresc,0) - coalesce(it.rateio_desc,0)) valor_total' +
      ' from pedvenda_serv it' +
      '   left join tipo_servico tp on tp.cod_servico = it.cod_servico' +
      ' where it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
      ' and (it.status_nfse is null or it.status_nfse = '''') ' +
      ' and it.nfse_id is null ' +
      ' and coalesce(it.status,'''') <> ''CANCELADO''' +
      ' group by 1,2';
    BuscasMnt.Open;

    //vCountArray := 0;
    vStrRetencaoIRRF := '';
    vStrRetencaoContrib := '';
    vRetencaoClienteIR := False;
    vRetencaoClienteContrib := False;
    //SetLength(vArrayRPSRetencao, 0);
    vJaTestouGarantia := False;
    BuscasMnt.First;
    while not BuscasMnt.Eof do // testa o valor de cada rps para ver se passou o teto para efetuar a retencao logo depois
    begin
      ADiscriminacaoServico := getDiscriminacaoServicos(BuscasMnt.FieldByName('cod_rps').AsInteger,
                                                        BuscasMnt.FieldByName('nfs_servico').AsString,
                                                        BuscasMnt.FieldByName('valor_total').AsFloat);
      if ADiscriminacaoServico.Trim.Length > 2000 then
        raise Exception.Create('Discriminação dos serviços excede 2000 caracteres aceitos pelo webservice.' + #13 +
                               'Por favor selecione menos O.S.''s ou diminua as observações' + #13 +
                               'Total de caracteres: ' + ADiscriminacaoServico.Trim.Length.ToString);

      buscas.Close;
      buscas.SQL.Text :=
        'select IRRF_SERVICO, VL_TETO_IRRF, VL_TETO_CONTRIB,' +
        ' ALIQ_PIS_RET, ALIQ_COFINS_RET, ALIQ_CSSL_RET from TIPOSERVICONFSE' +
        ' where COD_TPSERVICO = ' + QuotedStr(BuscasMnt.FieldByName('nfs_servico').AsString);
      buscas.Open;

      if (vvalservt > 0) and (vltotserv > 0) then
        vratservt := (BuscasMnt.FieldByName('valor_total').AsCurrency / vltotserv) * vvalservt
      else
        vratservt := 0;
      vValorTmp := BuscasMnt.FieldByName('valor_total').AsFloat + vratservt;
      vValorTmp := StrToFloat(Format('%0.2f', [vValorTmp]));

      if (vValorTmp > buscas.FieldByName('VL_TETO_CONTRIB').AsFloat) and ((buscas.FieldByName('ALIQ_PIS_RET').AsFloat > 0) or (buscas.FieldByName('ALIQ_COFINS_RET').AsFloat > 0) or (buscas.FieldByName('ALIQ_CSSL_RET').AsFloat > 0)) then
      begin
        vRetencaoClienteContrib := reterRPSparaCliente(BuscasMnt.FieldByName('cod_rps').AsInteger, vos, vospesq, trfComPisCofinsCSLL);
        if vRetencaoClienteContrib then
        begin
          var idRPS := BuscasMnt.FieldByName('cod_rps').AsString;
          if listRpsRetencao.IndexOf(idRPS) = -1 then
            listRpsRetencao.Add(idRPS);
          //vCountArray := vCountArray + 1;
          //SetLength(vArrayRPSRetencao, vCountArray);
          //vArrayRPSRetencao[vCountArray - 1] := BuscasMnt.FieldByName('cod_rps').AsInteger;
        end;
      end;

      if (vValorTmp > buscas.FieldByName('VL_TETO_IRRF').AsFloat) and (buscas.FieldByName('IRRF_SERVICO').AsFloat > 0) then
      begin
        vRetencaoClienteIR := reterRPSparaCliente(BuscasMnt.FieldByName('cod_rps').AsInteger, vos, vospesq, trfComIR);
        if vRetencaoClienteIR then
        begin
          var idRPS := BuscasMnt.FieldByName('cod_rps').AsString;
          if listRpsRetencao.IndexOf(idRPS) = -1 then
            listRpsRetencao.Add(idRPS);
          //vCountArray := vCountArray + 1;
          //SetLength(vArrayRPSRetencao, vCountArray);
          //vArrayRPSRetencao[vCountArray - 1] := BuscasMnt.FieldByName('cod_rps').AsInteger;
        end;
      end;
      if (vRetencaoClienteIR) and (vValorTmp > buscas.FieldByName('VL_TETO_IRRF').AsFloat) and (buscas.FieldByName('IRRF_SERVICO').AsFloat > 0) then
        vStrRetencaoIRRF := vStrRetencaoIRRF + '|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|';

      if (vRetencaoClienteContrib) and (vValorTmp > buscas.FieldByName('VL_TETO_CONTRIB').AsFloat) and ((buscas.FieldByName('ALIQ_PIS_RET').AsFloat > 0) or (buscas.FieldByName('ALIQ_COFINS_RET').AsFloat > 0) or (buscas.FieldByName('ALIQ_CSSL_RET').AsFloat > 0)) then
        vStrRetencaoContrib := vStrRetencaoContrib + '|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|';
      BuscasMnt.Next;
    end;
    {
    buscas.Close;
    buscas.SQL.Text := 'select cod_rps, nfs_servico, sum(valor_tot_serv + coalesce(rateio_acresc,0) - rateio_desc) as valor' +
                       ' from pedvenda_serv' +
                       ' where nped in (' + vospesq + ') and tipo = ''OS'' and cod_empresa = ' + IntToStr(cadempresa.codempresa) + ' and coalesce(status,'''') <> ''CANCELADO''' +
                       ' group by 1,2';
    buscas.open;
    buscas.First;

    while not buscas.Eof do
    begin

      ADiscriminacaoServico := getDiscriminacaoServicos(buscas.FieldByName('cod_rps').AsInteger,
                                                        buscas.FieldByName('nfs_servico').AsString,
                                                        buscas.FieldByName('valor').AsFloat);
      if ADiscriminacaoServico.Trim.Length > 2000 then
      begin
        buscas.sql.Text := '';
        raise Exception.Create('Discriminação dos serviços excede 2000 caracteres aceitos pelo webservice.' + #13 +
                               'Por favor selecione menos O.S.''s ou diminua as observações' + #13 +
                               'Total de caracteres: ' + ADiscriminacaoServico.Trim.Length.ToString);
      end;
      buscas.Next;
    end;
    }

    if ((not vRetencaoClienteIR) and (not vRetencaoClienteContrib)) or (listRpsRetencao.Count = 0) then // (Length(vArrayRPSRetencao) = 0) then // casno não haja retenção a fazer o sistema comita e continua o processamento
    begin
      buscas.Close;
      buscas.SQL.Text := 'update pedvenda_serv it set' +
                         ' it.IRRF_SERVICO = 0,' +
                         ' it.PISRF_SERVICO = 0,' +
                         ' it.COFINSRF_SERVICO = 0,' +
                         ' it.CSSLRF_SERVICO = 0,' +
                         ' it.VALOR_NFSE = coalesce(VALOR_B_NFSE, 0) - coalesce(ISSRET_SERVICO, 0)' +
                         ' where it.nped in (' + vospesq + ')' +
                         ' and it.tipo = ''OS''' +
                         ' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
                         ' and (it.status_nfse is null or it.status_nfse = '''') ' +
                         ' and it.nfse_id is null ' +
                         ' and coalesce(it.status,'''') <> ''CANCELADO''';
      buscas.ExecSQL;
      CommitaTransacao;
      Exit;
    end;

  //confirmei com a Adryele da Tonziro, a retenção deve olhar o valor da nota fiscal, e nao do servico em si. Pois se
  // varias O.S formarem uma unica nota fiscal o valor total da nota deve ser considerado para decidir se vai reter
  //Confirmei tambem que a retenção será apenas de empresa normal para empresa normal, quando for simples nacional não
  // vai reter

    for I := 0 to listRpsRetencao.Count - 1 do //Length(vArrayRPSRetencao) - 1 do // percorre cada rps para fazer a retenção
    begin
      vTotRetencaoIRRF := 0;
      vTotRetencaoContribPIS := 0;
      vTotRetencaoContribCOFINS := 0;
      vTotRetencaoContribCSSL := 0;

    // salvando a retenção total para conferir no final
      BuscasMnt.close;
      BuscasMnt.CommandText :=
        'select tp.nfs_servico, it.cod_rps, sum(coalesce(it.valor_tot_serv,0) + coalesce(it.rateio_acresc,0) - coalesce(it.rateio_desc,0)) valor_total' +
        ' from pedvenda_serv it' +
        ' left join tipo_servico tp on tp.cod_servico = it.cod_servico' +
        ' where it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
        ' and (it.status_nfse is null or it.status_nfse = '''') ' +
        ' and coalesce(it.status,'''') <> ''CANCELADO''' +
        ' and it.cod_rps = ' + listRpsRetencao[i] +
        ' and it.nfse_id is null' +
        ' group by 1,2';
      BuscasMnt.Open;
      if (vvalservt > 0) and (vltotserv > 0) then
        vratservt := (BuscasMnt.FieldByName('valor_total').AsCurrency / vltotserv) * vvalservt
      else
        vratservt := 0;
      vValorTmp := BuscasMnt.FieldByName('valor_total').AsFloat + vratservt;
      vValorTmp := StrToFloat(Format('%0.2f', [vValorTmp]));

      buscaadc.Close;
      buscaadc.SQL.Text := 'select IRRF_SERVICO, VL_TETO_IRRF, VL_TETO_CONTRIB,' + ' ALIQ_PIS_RET, ALIQ_COFINS_RET, ALIQ_CSSL_RET from TIPOSERVICONFSE' + ' where COD_TPSERVICO = ' + QuotedStr(BuscasMnt.FieldByName('nfs_servico').AsString);
      buscaadc.Open;

      if Pos('|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|', vStrRetencaoIRRF) > 0 then
      begin// salva o valor da retencao do IRRF total
        vTotRetencaoIRRF := (vValorTmp) * buscaadc.FieldByName('IRRF_SERVICO').AsFloat / 100;
        vTotRetencaoIRRF := StrToFloat(Format('%0.2f', [vTotRetencaoIRRF]));
      end;
      if Pos('|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|', vStrRetencaoContrib) > 0 then
      begin// salva o valor da retencao da Contribuição total
        vTotRetencaoContribPIS := (vValorTmp) * buscaadc.FieldByName('ALIQ_PIS_RET').AsFloat / 100;
        vTotRetencaoContribPIS := StrToFloat(Format('%0.2f', [vTotRetencaoContribPIS]));

        vTotRetencaoContribCOFINS := (vValorTmp) * buscaadc.FieldByName('ALIQ_COFINS_RET').AsFloat / 100;
        vTotRetencaoContribCOFINS := StrToFloat(Format('%0.2f', [vTotRetencaoContribCOFINS]));

        vTotRetencaoContribCSSL := (vValorTmp) * buscaadc.FieldByName('ALIQ_CSSL_RET').AsFloat / 100;
        vTotRetencaoContribCSSL := StrToFloat(Format('%0.2f', [vTotRetencaoContribCSSL]));
      end;

    //inicio onde vai aplicar a retanção item a item
      BuscasMnt.close;
      BuscasMnt.CommandText :=
        'select it.* from pedvenda_serv it where ' +
        'it.nped in (' + vospesq + ') and it.tipo = ''OS'' and it.cod_empresa = ' + IntToStr(cadempresa.codempresa) +
        ' and (it.status_nfse is null or it.status_nfse = '''') ' +
        ' and coalesce(it.status,'''') <> ''CANCELADO''' +
        ' and it.nfse_id is null ' +
        ' and cod_rps = ' + listRpsRetencao[i];
      BuscasMnt.Open;

      vSumRetencaoIRRF := 0; // variavel onde vai acumulado o valor da retenção
      vSumRetencaoContribPIS := 0; // variavel onde vai acumulado o valor da retenção
      vSumRetencaoContribCOFINS := 0; // variavel onde vai acumulado o valor da retenção
      vSumRetencaoContribCSSL := 0; // variavel onde vai acumulado o valor da retenção
      BuscasMnt.First;
      while not BuscasMnt.Eof do
      begin
      //obtendo o valor liquido do item
        if (vvalservt > 0) and (vltotserv > 0) then
          vratservt := (((BuscasMnt.FieldByName('valor_tot_serv').AsCurrency +
            BuscasMnt.FieldByName('rateio_acresc').AsCurrency -
            BuscasMnt.FieldByName('rateio_desc').AsCurrency) / vltotserv) * vvalservt)
        else
          vratservt := 0;
        vValorTmp := BuscasMnt.FieldByName('valor_tot_serv').AsCurrency +
          BuscasMnt.FieldByName('rateio_acresc').AsCurrency -
          BuscasMnt.FieldByName('rateio_desc').AsCurrency + vratservt;
        vValorTmp := StrToFloat(Format('%0.2f', [vValorTmp]));

        vRetencaoIRRF := 0;
        if Pos('|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|', vStrRetencaoIRRF) > 0 then
        begin//caso a retenção do IRRF deva ser aplicada vai ter o codigo do rps na variavel testada
          vRetencaoIRRF := (vValorTmp) * buscaadc.FieldByName('IRRF_SERVICO').AsFloat / 100;
          vRetencaoIRRF := StrToFloat(Format('%0.2f', [vRetencaoIRRF]));
          vSumRetencaoIRRF := vSumRetencaoIRRF + vRetencaoIRRF;
        end;

        vRetencaoContribPIS := 0;
        vRetencaoContribCOFINS := 0;
        vRetencaoContribCSSL := 0;
        if Pos('|' + IntToStr(BuscasMnt.FieldByName('cod_rps').AsInteger) + '|', vStrRetencaoContrib) > 0 then
        begin//caso a retenção da contribuicao deva ser aplicada vai ter o codigo do rps na variavel testada
          vRetencaoContribPIS := (vValorTmp) * buscaadc.FieldByName('ALIQ_PIS_RET').AsFloat / 100;
          vRetencaoContribPIS := StrToFloat(Format('%0.2f', [vRetencaoContribPIS]));
          vSumRetencaoContribPIS := vSumRetencaoContribPIS + vRetencaoContribPIS;

          vRetencaoContribCOFINS := (vValorTmp) * buscaadc.FieldByName('ALIQ_COFINS_RET').AsFloat / 100;
          vRetencaoContribCOFINS := StrToFloat(Format('%0.2f', [vRetencaoContribCOFINS]));
          vSumRetencaoContribCOFINS := vSumRetencaoContribCOFINS + vRetencaoContribCOFINS;

          vRetencaoContribCSSL := (vValorTmp) * buscaadc.FieldByName('ALIQ_CSSL_RET').AsFloat / 100;
          vRetencaoContribCSSL := StrToFloat(Format('%0.2f', [vRetencaoContribCSSL]));
          vSumRetencaoContribCSSL := vSumRetencaoContribCSSL + vRetencaoContribCSSL;
        end;

      //update no item com o valor calculado da retenção e no valor da NFS
        buscas.Close;
        buscas.SQL.Text := 'update pedvenda_serv set' +
                           ' IRRF_SERVICO = :IRRF_SERVICO,' +
                           ' PISRF_SERVICO = :PISRF_SERVICO,' +
                           ' COFINSRF_SERVICO = :COFINSRF_SERVICO,' +
                           ' CSSLRF_SERVICO = :CSSLRF_SERVICO,' +
                           ' VALOR_NFSE = :VALOR_NFSE' +
                           ' where NPED = ' + IntToStr(BuscasMnt.FieldByName('NPED').AsInteger) +
                           ' AND TIPO = ' + QuotedStr(Trim(BuscasMnt.FieldByName('TIPO').AsString)) +
                           ' AND COD_EMPRESA = ' + IntToStr(BuscasMnt.FieldByName('COD_EMPRESA').AsInteger) +
                           ' AND NITEM = ' + IntToStr(BuscasMnt.FieldByName('NITEM').AsInteger) +
                           ' AND COD_SERVICO = ' + IntToStr(BuscasMnt.FieldByName('COD_SERVICO').AsInteger) +
                           ' AND NFSE_ID IS NULL';

        buscas.ParamByName('IRRF_SERVICO').AsFloat := vRetencaoIRRF;

        buscas.ParamByName('PISRF_SERVICO').AsFloat := vRetencaoContribPIS;
        buscas.ParamByName('COFINSRF_SERVICO').AsFloat := vRetencaoContribCOFINS;
        buscas.ParamByName('CSSLRF_SERVICO').AsFloat := vRetencaoContribCSSL;

        buscas.ParamByName('VALOR_NFSE').AsFloat := BuscasMnt.FieldByName('VALOR_B_NFSE').AsFloat - BuscasMnt.FieldByName('ISSRET_SERVICO').AsFloat - buscas.ParamByName('IRRF_SERVICO').AsFloat - buscas.ParamByName('PISRF_SERVICO').AsFloat - buscas.ParamByName('COFINSRF_SERVICO').AsFloat - buscas.ParamByName('CSSLRF_SERVICO').AsFloat;
        BuscasMnt.Next;

        if BuscasMnt.Eof then
        begin//case seja o ultimo registro aqui o sistema joga a diferenca do valor calculado no inicio com o acumulado, para evitar divergencia quando for somar os valores dos itens
          if (buscas.ParamByName('IRRF_SERVICO').AsFloat + (vTotRetencaoIRRF - vSumRetencaoIRRF)) > 0 then
            buscas.ParamByName('IRRF_SERVICO').AsFloat := buscas.ParamByName('IRRF_SERVICO').AsFloat + (vTotRetencaoIRRF - vSumRetencaoIRRF);

          if (buscas.ParamByName('PISRF_SERVICO').AsFloat + (vTotRetencaoContribPIS - vSumRetencaoContribPIS)) > 0 then
            buscas.ParamByName('PISRF_SERVICO').AsFloat := buscas.ParamByName('PISRF_SERVICO').AsFloat + (vTotRetencaoContribPIS - vSumRetencaoContribPIS);
          if (buscas.ParamByName('COFINSRF_SERVICO').AsFloat + (vTotRetencaoContribCOFINS - vSumRetencaoContribCOFINS)) > 0 then
            buscas.ParamByName('COFINSRF_SERVICO').AsFloat := buscas.ParamByName('COFINSRF_SERVICO').AsFloat + (vTotRetencaoContribCOFINS - vSumRetencaoContribCOFINS);
          if (buscas.ParamByName('CSSLRF_SERVICO').AsFloat + (vTotRetencaoContribCSSL - vSumRetencaoContribCSSL)) > 0 then
            buscas.ParamByName('CSSLRF_SERVICO').AsFloat := buscas.ParamByName('CSSLRF_SERVICO').AsFloat + (vTotRetencaoContribCSSL - vSumRetencaoContribCSSL);

          buscas.ParamByName('VALOR_NFSE').AsFloat := BuscasMnt.FieldByName('VALOR_B_NFSE').AsFloat - BuscasMnt.FieldByName('ISSRET_SERVICO').AsFloat - buscas.ParamByName('IRRF_SERVICO').AsFloat - buscas.ParamByName('PISRF_SERVICO').AsFloat - buscas.ParamByName('COFINSRF_SERVICO').AsFloat - buscas.ParamByName('CSSLRF_SERVICO').AsFloat;
        end;
        buscas.ExecSQL;
      end;
    end;

    CommitaTransacao;

    listRpsRetencao.Free;
    qryAdic.Free;

  except
    on e: exception do
    begin
      listRpsRetencao.Free;
      qryAdic.Free;

      RollBackTransacao;
      Result := false;
      if application.messagebox('Erro ao Gerar RPS. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
        Application.MessageBox(PWideChar(E.Message + ' - ' + buscas.sql.Text), PWideChar('Error'), MB_OK);
    end;
  end;
end;

function TClassNfSe.montarRPSEnv(vos: Integer): boolean;
var
 vstatus: string;
begin
  Result := False;

  if trim(cadempresa.dataSet.FieldByName('MODELO_NF_SERV').AsString) <> '55' then
  begin
    Application.MessageBox(PWideChar('NFSe não configurada para esta empresa'),PWideChar('Aviso'), MB_OK);
    Exit;
  end;

  if not SilentMode then
    if not verificapendRPS then
      if not PesqPros(true,'NFS006','') then
        exit;

  if dataSet.FieldByName('COD_RPS').AsString <> '' then
  begin
    buscaadc.close;
    buscaadc.sql.text := 'select first 1 status_nfse from pedvenda_serv where cod_rps = '+
      dataSet.FieldByName('COD_RPS').AsString+
      ' and nfse_id is null and cod_empresa = '+inttostr(cadempresa.codempresa);
    buscaadc.open;
    vstatus := buscaadc.FieldByName('status_nfse').AsString;
  end
  else
    vstatus:=dataSet.FieldByName('status_nfse').AsString;

  if (vstatus <> '') and (vstatus <> 'Em Processamento') then
  begin
    if not SilentMode then
    begin
      Application.MessageBox(PWideChar('RPS já Enviado e Autorizado'),PWideChar('Aviso'), MB_OK);
      result := false;
    end
    else
      Result := True;
  end
  else
  begin
    zerarAtributos;
    vospesq := IntToStr(vos);
    if montaRPSos(vos) then
      Result := enviarRPS(vos);
  end;

end;

function TClassNfSe.montarRPSEnv(vos: string): boolean;
var
 vstatus: string;
begin
result:=true;
  if trim(cadempresa.dataSet.FieldByName('MODELO_NF_SERV').AsString) <> '55' then
  begin
    Application.MessageBox(PWideChar('NFSe não configurada para esta empresa'),PWideChar('Aviso'), MB_OK);
    result:=false;
  end
  else
  begin
    if not verificapendRPS then
    begin
     if not PesqPros(true,'NFS006','') then
     begin
      Result:=false;
      exit;
     end;
    end;
    zerarAtributos;
    vospesq:=vos;
    if montaRPSos(0) then
    begin
     enviarRPS(0);
    end;
  end;
end;

function TClassNfSe.montarTXT(vflag: integer): boolean;
var
 Arq: TextFile;
begin

  Result := False;

  begin
    if vcidadegertxt = nil then
    begin
      ShowAtencao('Cidade do Webservice não Instanciada. Verifique compatibilidade com a cidade em questão');
      exit;
    end;

    try
      if cadempresa.IsValadaresComSigISS then //if cadempresa.dataSet.FieldByName('ibge_cod_cidade').AsString = '3127701' then //valadares sistema sigiss
      begin
        sigiss_LoadDocEletronico(buscasmnt.FieldByName('COD_RPS').AsInteger);
        FdocsNFSe.rps_resc := FdocsNFSe.rps;//rescue, caso ja tenha sido enviado uma vez e autorizado sem resposta do ws
        FdocsNFSe.rps      := vcidadegertxt.sigiss_getRPS(Self);
      end
      else
      begin
        if ACBrNFSe1.Configuracoes.WebServices.Ambiente = taProducao then
          vcidadegertxt.copiarschemas('P')
        else
          vcidadegertxt.copiarschemas('H');
        vcidadegertxt.montarRPSAC(ACBrNFSe1,Self);
      end;

      Result := True;

    except on e: exception do
      begin
        if ShowConfirmacao('Erro ao Gerar RPS. Mostrar Erro?', MB_YESNO + MB_DEFBUTTON2) = IDYES then
          ShowErro(E.Message);
      end;
    end;
  end;
end;

procedure TClassNfSe.mostrarmensagem(vmens: string);
begin
if FrmStatusNFSe = nil then
begin
 FrmStatusNFSe :=TFrmStatusNFSe.Create(Application);
 FrmStatusNFSe.BorderStyle := bsDialog;
 FrmStatusNFSe.Caption := 'Status';
 FrmStatusNFSe.Position := poScreenCenter;
 FrmStatusNFSe.Width := 489;
 FrmStatusNFSe.Height := 72;
end;
if ( FrmStatusNFSe <> nil ) then
begin
  if vmens = '' then
  begin
   FrmStatusNFSe.Hide;
   application.ProcessMessages;
  end
  else
  begin
   FrmStatusNFSe.lblStatus.Caption := vmens;
   FrmStatusNFSe.Show;
   FrmStatusNFSe.BringToFront;
   application.ProcessMessages;
  end;
end;
end;

procedure TClassNfSe.NFSeGerarLog(const ALogLine: string;
  var Tratado: Boolean);
var
  ArquivoTexto: TextFile;
  NomeArquivo: string;
begin
  NomeArquivo := ExtractFilePath(ParamStr(0)) + 'NFSe.log';
  try
    AssignFile(ArquivoTexto, NomeArquivo);
    try
      if not FileExists(NomeArquivo) then
        Rewrite(ArquivoTexto)
      else
        append(ArquivoTexto);
      WriteLn(ArquivoTexto, ALogLine);
    finally
      closeFile(ArquivoTexto);
    end;
  except
  end;
end;

function TClassNfSe.NFSeregimetrib(vregime: integer): string;
var
 vok: boolean;
begin
  vok:=true;
  result := StrTonumero(vok, inttostr(vregime), ['1', '2', '3','4','0','5','6'], ['Microempresa Municipal', 'Estimativa','Sociedade de Profissionais','Cooperativa','NENHUM','Microempresário Individual (MEI)','Microempresário e Empresa de Pequeno Porte (ME EPP)']);
end;


function TClassNfSe.NFSNatop(vnatop: integer): string;
var
 vok: boolean;
begin
  vok:=true;
  result := StrTonumero(vok, inttostr(vnatop), ['1', '2', '3','4','5','6'], ['Tributação no município', 'Tributação fora do município','Isenção','Imune','Exigibilidade suspensa por decisão judicial','Exigibilidade suspensa por procedimento administrativo']);
end;

function TClassNfSe.NFSSimples(vtipo: integer): string;
var
 vok: boolean;
begin
  vok:=true;
  result := StrTonumero(vok, inttostr(vtipo), ['1', '2'], ['SIM', 'NÃO']);
end;

procedure TClassNfSe.ObterAliquotasRetencao(const CLC116: string; var AliqPIS, ALiqCofins, AliqCSLL: Currency);
var
  Q: TQuery_OOP;
begin
  Q := QueryHelper.CreateObj(buscaadc);
  try
    Q.Table('tiposerviconfse', 'aliq_pis_ret, aliq_cofins_ret, aliq_cssl_ret')
      .Equals('cod_tpservico', CLC116)
      .Open();

    AliqPIS := q.ffloat('aliq_pis_ret');
    ALiqCofins := q.ffloat('aliq_cofins_ret');
    AliqCSLL := q.ffloat('aliq_cssl_ret');

    Q.Close();
  finally
    Q.Free();
  end;
end;

function TClassNfSe.ObterSQL: string;
begin
  // para ficar somente 1 lugar com os campos
  Result :=
    'select ' +
    ' nome_cliente, nped, tipo, aliq_iss, nfs_servico, cnae_serv, vl_liq, valornf, cidade, ' +
    ' cod_rps, n_nf, cod_empresa, data_fech, status_nfse, iss_retido, ctiss, ' +
    ' ctribnac, ctribmun, cnbs, nfse_nacional, modelo_nfse, emissao_rps, codigo_verWSNFSe,' +
    ' cod_cliente, irrf_servico, ' +
    ' issret_servico, pisrf_servico, cofinsrf_servico, csslrf_servico, bruto ' +
    ' from VW_RPS_NFSE_LEGADO ';
end;

procedure TClassNfSe.pegadadosRPS;
var
 vcodrps: string;
begin
   try
    vcodrps:=BuscasMnt.FieldByName('COD_RPS').AsString;
   except
    vcodrps:=dataset.FieldByName('COD_RPS').AsString;
   end;
   buscaadc.close;
   buscaadc.sql.text:='select * from pedvenda_serv where cod_rps = '+
   vcodrps+' and cod_empresa = '+
   dataSet.FieldByName('COD_EMPRESA').AsString+' and ativo = 1';
   buscaadc.open;
   nrloterps:='';
   //buscaadc.FieldByName('LOTE_NFSE').AsString;
   Fprotoloco:=buscaadc.FieldByName('NPROTNFSE').AsString;
   FListaErros:=buscaadc.FieldByName('RESP_WS_NFSE').AsString;
   FnumeroNFSe:=buscaadc.FieldByName('N_NF').AsString;
   Fcodigover:=buscaadc.FieldByName('CODIGO_VERWSNFSE').AsString;
   Fdiscrimina:=buscaadc.FieldByName('DESC_SERVICO_RPS').AsString;
   Foutrasinf:=buscaadc.FieldByName('OUTRAS_INFNFSE').AsString;
   FCodigoCnae:=buscaadc.FieldByName('cnae_respNFSe').AsString;
   FRpsNFSe:=buscaadc.FieldByName('COD_RPS').AsString;
   nroLote:=buscaadc.FieldByName('LOTE_NFSE').AsString;
   vosNFSe:=buscaadc.FieldByName('NPED').AsInteger;
   FDataEmissaoNFSe:=buscaadc.FieldByName('emissao_NFSE').AsDateTime;
   FdataRPS:=buscaadc.FieldByName('EMISSAO_RPS').AsDateTime;
   vcoderro:='';
   Faliq:=buscaadc.FieldByName('aliq_iss').AsCurrency;
   buscaadc.close;
   buscaadc.sql.text:='select sum(valor_nfse) as valor,sum(valor_b_nfse) as bruto,'+
   'sum((valor_b_nfse)*(aliq_iss/100)) as iss,sum(irrf_servico) as irrf_servico,sum(ISSRET_SERVICO) as ISSRET_SERVICO from pedvenda_serv where cod_rps = '+
   vcodrps+' and cod_empresa = '+
   dataSet.FieldByName('COD_EMPRESA').AsString+' and ativo = 1';
   buscaadc.open;
   if cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger <> 1 then
    Fiss:=buscaadc.FieldByName('iss').AsCurrency
   else
   begin
//    FbaseCalc:=0;
//    FvalorLiq:=0;
    Fiss:=0;
    Faliq:=0;
   end;
   Fir:=buscaadc.FieldByName('IRRF_SERVICO').Ascurrency;
   FbaseCalc:=buscaadc.FieldByName('bruto').AsCurrency;
   //buscaadc.FieldByName('valor').AsCurrency+buscaadc.FieldByName('IRRF_SERVICO').Ascurrency;
   FvalorLiq:=buscaadc.FieldByName('valor').AsCurrency;
   Fvalorbruto:=buscaadc.FieldByName('bruto').AsCurrency;
   vvalNFSe:=buscaadc.FieldByName('valor').AsString;
   Fpis:=0;
   Fcofins:=0;
   Finss:=0;
//   Fir:=0;
   Fcsll:=0;
   FoutrasRet:=0;
   Fdeducoes:=0;
   Fdescadc:=0;
   FdescCond:=0;
   if buscaadc.FieldByName('ISSRET_SERVICO').Ascurrency <> 0 then
   begin
     Fissretido:=buscaadc.FieldByName('ISSRET_SERVICO').Ascurrency;
     Fiss:=0;
   end
   else
    Fissretido:=0;
end;

function TClassNfSe.pesqOsNFSe(vnos: integer): boolean;
begin
 result:=true;
 dataset.close;
 {
 DataSet.CommandText :=
        'SELECT clientes.nome_cliente,pedvenda.NPED,pedvenda.tipo,tipo_servico.aliq_iss,tipo_servico.nfs_servico,tipo_servico.cnae_serv,'+
        'sum(pedvenda_serv.valor_tot_serv + coalesce(pedvenda_serv.rateio_acresc,0) - pedvenda_serv.rateio_desc),sum(pedvenda_serv.valor_nfse) as valorNF,clientes.cidade,pedvenda_serv.cod_rps,pedvenda_serv.n_nf,pedvenda_serv.cod_empresa,'+
        'pedvenda.data_fech,pedvenda_serv.status_nfse, '+
        'case when coalesce(clientes.iss_retido,0) <> 0 then clientes.iss_retido else '+
        'tipo_servico.iss_retido end as iss_retido,tipo_servico.ctiss '+
        'FROM PEDVENDA_SERV inner join tipo_servico  on tipo_servico.cod_servico = pedvenda_serv.cod_servico '+
        'inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and '+
        'pedvenda_serv.tipo = pedvenda.tipo and pedvenda_serv.cod_empresa = pedvenda.cod_empresa '+
        'inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa '+
        'where pedvenda_serv.nped = '+inttostr(vnos)+' and pedvenda_serv.tipo = ''OS'' and pedvenda_serv.valor_tot_serv <> 0 and pedvenda.ativo = 1 and '+
        ' pedvenda.cod_empresa = ' + inttostr(cadempresa.codempresa)+
        ' and pedvenda.status_ped = ''FECHADA'' ' +
        ' and coalesce(pedvenda_serv.status,'''') <> ''CANCELADO'' '+
        ' group by nome_cliente,nped,tipo,aliq_iss,nfs_servico,cnae_serv,cidade,cod_rps,n_nf,cod_empresa,data_fech,status_nfse,iss_retido,ctiss ';
 }
 dataSet.CommandText := Format( ' %S where nped = %d and cod_empresa = %d', [ObterSQL(), vnos, cadempresa.codempresa ]);

 dataset.Open;
 if dataset.IsEmpty then
 begin
   Application.MessageBox(PWideChar('O.S. sem serviço ou não Fechada. Não será enviada para a PREFEITURA'),PWideChar('Aviso'), MB_OK);
   Result:=false;
 end;
end;

function TClassNfSe.pesqprot(vnos: integer): boolean;
begin
 buscaadc.close;
 buscaadc.sql.Text:='select NPROTNFSE,coalesce(N_NF,0) as N_NF FROM PEDVENDA_SERV WHERE NPED = '+inttostr(vnos)+
 ' and TIPO = ''OS'' and cod_empresa = '+inttostr(cadempresa.codempresa);
 buscaadc.open;
 if buscaadc.isempty then
  result:=false
 else
 begin
   if (buscaadc.FieldByName('NPROTNFSE').AsString <> '') and
   (buscaadc.FieldByName('N_NF').AsString = '0') then
    result:=false
   else
    result:=true;
 end;
 buscaadc.close;
end;

function TClassNfSe.PostXmlBanco(id, xml: string;
  query: TIBQuery): Boolean;
var
  seqIdDoc: Integer;
begin
  try
    if query = nil then
      query := buscas;

    query.Close;
    query.SQL.Text := Format(' update or insert into doc_eletronico' +
                              ' (cod_empresa, id_doc, doc)' +
                              ' values (%d, ''%s'', :doc)' +
                              ' matching (id_doc, cod_empresa)', [cadempresa.codempresa, id]);
    query.ParamByName('doc').AsString := xml;
    query.Prepare;
    query.ExecSQL;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function TClassNfSe.PostXmlNFSe(nfseId: Integer; xml: string;
  query: TIBQuery): Boolean;
begin
  Result := PostXmlBanco(Format('NFSe_RPS%d', [nfseId]), xml, query);
end;

function TClassNfSe.PostXmlRPS(rpsId: Integer; xml: string;
  query: TIBQuery): Boolean;
begin
  Result := PostXmlBanco(Format('RPS%d', [rpsId]), xml, query);
end;

function TClassNfSe.rCampo(const Tipo: string; TAG: string): variant;
var
  ConteudoTag: string;
  inicio, fim: integer;
  vt: string;
begin
  Tag := UpperCase(Trim(TAG));
  inicio := pos('<' + Tag + '>', UpperCase(FGrupo));
  if inicio = 0 then
    ConteudoTag := ''
  else
  begin
    inicio := inicio + Length(Tag) + 2;
    fim := pos('</' + Tag + '>', UpperCase(FGrupo)) - inicio;
    ConteudoTag := trim(copy(FGrupo, inicio, fim));
  end;
  if tipo = 'C' then
   result:=ConteudoTag;
  if tipo = 'D' then
  begin
   vt:=copy(ConteudoTag, 01, 4)+copy(ConteudoTag, 06, 2)+
   copy(ConteudoTag, 09, 2)+copy(ConteudoTag, 12, 2)+copy(ConteudoTag, 15, 2)+copy(ConteudoTag, 18, 2);
   result:=EncodeDate(StrToInt(copy(ConteudoTag, 01, 4)), StrToInt(copy(ConteudoTag, 06, 2)), StrToInt(copy(ConteudoTag, 09, 2))) +
                      EncodeTime(StrToInt(copy(ConteudoTag, 12, 2)), StrToInt(copy(ConteudoTag, 15, 2)), StrToInt(copy(ConteudoTag, 18, 2)), 0);
  end;
  if tipo = 'F' then
   result:=strtofloat(ConteudoTag);
  if tipo = 'I' then
   result:=strtoint(ConteudoTag);
end;

procedure TClassNfSe.retirarnprot;
begin
 buscaadc.close;
 buscaadc.sql.Text:='update PEDVENDA_SERV SET' +
                    ' NPROTNFSE = NULL' +
                    ' WHERE NPED = ' + dataset.FieldByName('NPED').AsString +
                    ' and TIPO = ''OS''' +
                    ' and cod_empresa = ' + inttostr(cadempresa.codempresa) +
                    ' AND coalesce(NPROTNFSE,'''') <> '''' and coalesce(n_nf,0) = 0' ;
 buscaadc.Prepare;
 buscaadc.ExecSQL;
end;

function TClassNfSe.rExtrai(const nivel: integer; const TagInicio: string; TagFim: string = ''; const item: integer = 1): AnsiString;
var
  Texto: AnsiString;
  i,j: integer;
  FNivel: TStringList;

begin
  //NOTA: Extrai um grupo de dentro do nivel informado
  FNivel := TStringList.Create;
  for i := 1 to 10 do
    FNivel.add('');

  FNivel.strings[0] := FArquivo;
  if Trim(TagFim) = '' then
    TagFim := TagInicio;
  Texto := FNivel.Strings[nivel - 1];
  Result := '';
  FGrupo := '';
  for i := 1 to item do
    if i < item then
      Texto := copy(Texto, pos('</' + Trim(TagFim) + '>', Texto) + length(Trim(TagFim)) + 3, maxInt);
  i := pos('<' + Trim(TagInicio) + '>', Texto);
  if i = 0 then
    i := pos('<' + Trim(TagInicio) + ' ', Texto);
  if i = 0 then
    i := pos('<' + Trim(TagInicio) + ':', Texto); //correção para webservice do Ceará
  if i = 0 then
    exit;
  Texto := copy(Texto, i, maxInt);
  j:=pos('</' + Trim(TagFim) + '>',Texto);
  if j=0 then
   j:=pos('</' + Trim(TagFim) + ':',Texto); //correção para webservice do Ceará
  Result := TrimRight(copy(Texto, 1, j - 1));
  FNivel.strings[nivel] := Result;
  FGrupo := result;
end;

function TClassNfSe.salvarPDF: boolean;
begin

end;

function TClassNfSe.salvarxmlNFSe: boolean;
var
 vstringlist: TStringList;
begin
  if trim(numeroNFSe) <> '' then
  begin
   if not FileExists(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\RetNFSe\NFSe'+numeroNFSe+'.XML') then
   begin
    vstringlist:=TStringList.create;
    vstringlist.Add(Arquivo);
    vstringlist.SaveToFile(cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+'\NFSe\RetNFSe\NFSe'+numeroNFSe+'.XML');
    vstringlist.free;
    mostrarmensagem('');
   end;
  end;
end;

function TClassNfSe.TZero(valor: currency; tam: integer): string;
var
  vl: string;
begin
  vl := format('%n', [valor]);
  while (pos('.', vl) > 0) do
  begin
    vl := copy(vl, 1, pos('.', vl) - 1) + copy(vl, pos('.', vl) + 1, (length(vl) - pos('.', vl) + 1));
  end;
  while (pos(',', vl)) > 0 do
  begin
    vl := copy(vl, 1, pos(',', vl) - 1) + copy(vl, pos(',', vl) + 1, (length(vl) - pos(',', vl) + 1));
  end;
  try
    result := strzero(strtoint64(vl), tam);
  except
    result := strzero(strtoint('0'), tam);
  end;
end;

function TClassNfSe.validardadosRPS: boolean;
begin
  result:=true;

  if buscasmnt.FieldByName('valor').AsFloat <> 0 then
  begin
    if buscasmnt.FieldByName('aliq_iss').AsFloat = 0 then
    begin
      Application.MessageBox(PWideChar('Aliquota ISS não definida para o serviço'),PWideChar('Aviso'), MB_OK);
      result:=false;
    end;
    {
    if buscasmnt.FieldByName('iss_retido').asinteger = 0 then
    begin
      Application.MessageBox(PWideChar('ISS Retido no cadastro de serviço/cliente não definido'),PWideChar('Aviso'), MB_OK);
      result:=false;
    end;
    }
    if cadempresa.dataSet.FieldByName('NFs_natop').asinteger = 0 then
    begin
      Application.MessageBox(PWideChar('Natureza de operação no cadastro de empresa não definido'),PWideChar('Aviso'), MB_OK);
      result:=false;
    end;
    { if cadempresa.dataSet.FieldByName('NFs_regimeTrib').asinteger = 0 then
    begin
    Application.MessageBox(PWideChar('Regime de tributação no cadastro de empresa não definido'),PWideChar('Aviso'), MB_OK);
    result:=false;
    end;}
    if buscasmnt.FieldByName('serie_serv_nfe').asstring = '' then
    begin
      Application.MessageBox(PWideChar('Série de Serviço no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
      result:=false;
    end;
    if (buscasmnt.FieldByName('nfse_nacional').AsInteger = 0) and
      (buscasmnt.FieldByName('cnae_serv').asinteger = 0) then
    begin
      Application.MessageBox(PWideChar('CNAE de Serviço no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
      result:=false;
    end
    else if (buscasmnt.FieldByName('nfse_nacional').AsInteger = 1) and
      (buscasmnt.FieldByName('ctribNac').AsString = '') then
    begin
      ShowAtencao('Código de Tributação Nacional não definido no cadastro do Tipo de serviço');
      result:=false;
    end;
    if cadempresa.dataSet.FieldByName('NFs_optanteSimples').asinteger = 0 then
    begin
      Application.MessageBox(PWideChar('Optante Simples no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
      result:=false;
    end;
    if cadempresa.dataSet.FieldByName('incentivadorCult').asinteger = 0 then
    begin
      Application.MessageBox(PWideChar('Incentivador Cultural no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
      result:=false;
    end;
  //   if cadempresa.dataSet.FieldByName('NFs_cert').asstring = '' then
  //   begin
  //    Application.MessageBox(PWideChar('Endereço Certificado ISS no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
  //    result:=false;
  //   end;
  //   if cadempresa.dataSet.FieldByName('env_NFSe').asstring  = '' then
  //   begin
  //    Application.MessageBox(PWideChar('String de Envelopamento XML(ex.: ii:) no cadastro da Empresa não definido'),PWideChar('Aviso'), MB_OK);
  //    result:=false;
  //   end;
  end;
  // Testar também a licenca para uso da DLL FlexDocs
end;

procedure TClassNfSe.vercidadeNFSe;
begin
  var ibgeId := cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;

  {$REGION 'Validando e certificando que a config esteja pronta para uso'}

  var cfg_nfse := TConfig_sistema_class.getConf('nfse_config', buscaadc, cadempresa.codempresa);
  try
    cfg_nfse.AtivarMapeamentoKeys;

    cfg_nfse.ReadString(ibgeId, 'WSChaveAcesso');
    cfg_nfse.ReadString(ibgeId, 'EnviarInscricaoMunicipal', 'S'); // em homologação não foi necessário

    {$REGION 'Criando as demais configuracoes'}

    var newValue := cfg_nfse.value1_f;
    if MatchText( Trim(cfg_nfse.ReadString(ibgeId, 'PadraoNacional', 'NAO')).ToUpper().Substring(0,1), ['S', '1' ]) then
      newValue := IfThen(cfg_nfse.value1_f <> 1, 1, cfg_nfse.value1_f )
    else
      newValue := IfThen(cfg_nfse.value1_f <> 0, 0, cfg_nfse.value1_f );

    var sIdent := Format('%s_Cancelamento_Personalizado', [ibgeId]);

    cfg_nfse.ReadString(sIdent, 'Ativo' );
    cfg_nfse.ReadString(sIdent, 'IgnorarErro' );
    cfg_nfse.ReadString(sIdent, 'VerificarEmMetodo' );

    if ibgeId = '3127701' then
    begin
      cfg_nfse.ReadString(ibgeId, 'ProvedorAntigo', 'ISSIntel');
      cfg_nfse.ReadString(ibgeId, 'ProvedorAntigoDANFSeNacional', 'NAO');
    end;

    cfg_nfse.ReadString('Impressao', 'DiscriminacaoSimples', 'N');
    cfg_nfse.ReadString('Impressao', 'DANFSeNacional', 'S');

    {$ENDREGION}

    if (newValue <> cfg_nfse.value1_f) or (cfg_nfse.KesyChanges) then
    begin
      cfg_nfse.value1_f := newValue;
      cfg_nfse.SaveConfDB(buscaadc).Transaction.Commit;
    end;

    // Data desativação definitiva
    if EncodeDate(2026, 11, 30) < Now() then
      FDhDesativacaoModuloLegado := EncodeDate(2026, 11, 30)

    else
      FDhDesativacaoModuloLegado := cfg_nfse.value_dt

  finally
    cfg_nfse.Free();
  end;

  {$ENDREGION}

 if cadempresa.IsValadaresComSigISS then //if (cadempresa.fstr('IBGE_COD_CIDADE') = '3127701') then
  vcidadegertxt:=TClasstribcidGV.create
// else if cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString = '3106200' then
//  vcidadegertxt:=TClasstribcidBH.create
// else if cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString = '3168606' then
//  vcidadegertxt:=TClasstribcidTO.create
 else if MatchStr(cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString, ['1302603']) then
   vcidadegertxt := TClassNFSeAbaco.create
 else
   vcidadegertxt := TClassNFSeDefault.create(ibgeId);
end;

function TClassNfSe.verificapendRPS: boolean;
begin
 result:=true;
if cadempresa.dataSet.FieldByName('NFEPENDEMDIAS').AsString <> '' then
 begin
   if cadempresa.vqtdependemdias <> '0' then
   begin
     buscaadc.Close;
     buscaadc.sql.text:='select min(emissao_rps) as dataemissao from pedvenda_serv where '+
     ' (n_nf is null or n_nf = 0) and ((not cod_rps is null) and cod_rps <> 0) and '+
     '(not emissao_rps is null) and (valor_tot_serv <> 0) and cod_empresa = '+inttostr(cadempresa.codempresa)+' and ativo = 1 and modelo_NFSe = ''55'' '+
     ' and coalesce(status,'''') <> ''CANCELADO''';
     buscaadc.open;
     if not buscaadc.IsEmpty then
     begin
       if not buscaadc.FieldByName('dataemissao').IsNull then
       begin
         if (getDataBanco(buscas,cadempresa.vusdataserv)-buscaadc.FieldByName('dataemissao').AsDateTime) >
         StrToInt(cadempresa.vqtdependemdias) then
         begin
           Application.MessageBox(PWideChar('Existem RPSs pendentes com data emissao acima de '+#13+
           cadempresa.vqtdependemdias+' dias definidos na configuração, '+
           'Verifique estes RPS  no Formulário de consulta de NFSe opção ''não autorizadas'''),PWideChar('Error'), MB_OK);
           Result:=false;
           buscaadc.close;
           exit;
         end;
       end;
     end;
   end;
 end;
end;

procedure TClassNfSe.verificarCaracteresNFSe;
var
  I: Integer;
  Alog: TStrings;
begin
  try
    if getini('NFSe', 'LogXML', 'N') = 'S' then
    begin
      Alog := TStringList.Create;
      ACBrNFSe1.NotasFiscais.GerarNFSe();
    end;

    for I := 0 to ACBrNFSe1.NotasFiscais.Count - 1 do
      with ACBrNFSe1.NotasFiscais.Items[I].NFSe do
      begin
        if Assigned(Alog) then
        begin
//          Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XMLOriginal;
          Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XmlRps;
          Alog.SaveToFile(Format('%s01_xml_original_%s.xml', [ExtractFilePath(Application.ExeName),
                                                            ACBrNFSe1.NotasFiscais.Items[I].NFSe.IdentificacaoRps.Numero]));
        end;

        Servico.Discriminacao        := RetiraCarEsp(Servico.Discriminacao);

        Tomador.RazaoSocial          := RetiraCarEsp(Tomador.RazaoSocial);
        Tomador.Contato.Email        := RetiraCarEsp(Tomador.Contato.Email);
        Tomador.Endereco.TipoLogradouro := RetiraCarEsp(Tomador.Endereco.TipoLogradouro);
        Tomador.Endereco.Endereco       := RetiraCarEsp(Tomador.Endereco.Endereco);
        Tomador.Endereco.Numero         := RetiraCarEsp(Tomador.Endereco.Numero);
        Tomador.Endereco.Complemento    := RetiraCarEsp(Tomador.Endereco.Complemento);
        Tomador.Endereco.TipoBairro     := RetiraCarEsp(Tomador.Endereco.TipoBairro);
        Tomador.Endereco.Bairro         := RetiraCarEsp(Tomador.Endereco.Bairro);
        Tomador.Endereco.xMunicipio     := RetiraCarEsp(Tomador.Endereco.xMunicipio);
        Tomador.Endereco.xPais          := RetiraCarEsp(Tomador.Endereco.xPais);
        Tomador.Endereco.xPais          := RetiraCarEsp(Tomador.Endereco.xPais);
      end;

      if Assigned(Alog) then
      begin
        ACBrNFSe1.NotasFiscais.GerarNFSe();
        for I := 0 to ACBrNFSe1.NotasFiscais.Count - 1 do
          with ACBrNFSe1.NotasFiscais.Items[I].NFSe do
          begin
            if Assigned(Alog) then
            begin
//              Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XMLOriginal;
              Alog.Text := ACBrNFSe1.NotasFiscais.Items[I].XmlRps;
              Alog.SaveToFile(Format('%s02_xml_original_%s.xml', [ExtractFilePath(Application.ExeName),
                                                                ACBrNFSe1.NotasFiscais.Items[I].NFSe.IdentificacaoRps.Numero]));
            end;
          end;
      end;


  finally
    if Assigned(Alog) then
      FreeAndNil(Alog);
  end;
end;

function TClassNfSe.verificarerros(componente: EComponente): boolean;
var
 i: integer;
begin
 result:=true;
 FListaErros:='';
 if componente = EComponente.FlexDocs then // Verifica erros no retorno do envio FLEXDOCS
 begin
   if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
   begin
     if ListaMensagemRetorno <> '' then
       FListaErros:=ListaMensagemRetorno;
   end
   else
   begin
    if ((rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ListaMensagemRetorno') <> '')
    or (rExtrai(1,cadempresa.dataSet.FieldByName('ENV_NFSE').asstring+'ListaMensagemRetornoLote') <> '')) then
    begin
       FListaErros:=Grupo;
    end;
   end;
   if FListaErros <> '' then
   begin
     Application.CreateForm(TFrmMostrarErros, FrmMostrarErros);
    //FrmMostrarErros:=TFrmMostrarErros.create(Application);
    FrmMostrarErros.Memo1.Lines.Add(FListaErros);
    FrmMostrarErros.ShowModal;
    FrmMostrarErros.free;
  //  Application.MessageBox(PWideChar('Erros no WS: '+#13+FListaErros) , 'Resultado do envio do Lote de RPS:', MB_OK or MB_ICONINFORMATION);
    result:=false;
   end;
 end;

  if componente = EComponente.ACbr then // Verificar erros no Retorno de envio de NFSe(SINCRONO E ASSINCRONO ACBRNFSE)
  begin
    for i := 0 to ACBrNFSe1.WebService.Emite.Erros.Count - 1 do with ACBrNFSe1.WebService.Emite.Erros[I] do
      if not MatchText(Codigo, ['L000', 'A0000']) then
        FListaErros := StrConcat([FListaErros, 'Código Erro : ', Codigo, '-', 'Mensagem... : ', Descricao, '-', 'Correção... : ', Correcao, '/']);

    if (ACBrNFSe1.Configuracoes.Geral.ConsultaLoteAposEnvio) and
       (ACBrNFSe1.WebService.Emite.Protocolo <> '') then
    begin
      if (ACBrNFSe1.Provider.ConfigGeral.ConsultaSitLote) and
        (ACBrNFSe1.WebService.ConsultaSituacao.Erros.Count > 0) then
        for i := 0 to ACBrNFSe1.WebService.ConsultaSituacao.Erros.Count - 1 do with ACBrNFSe1.WebService.ConsultaSituacao.Erros[I] do
          if not MatchText(Codigo, ['L000', 'A0000']) then
            FListaErros := StrConcat([FListaErros, 'Código Erro : ', Codigo, '-', 'Mensagem... : ', Descricao, '-', 'Correção... : ', Correcao, '/']);

      if (ACBrNFSe1.Provider.ConfigGeral.ConsultaLote) and
         (ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count > 0) then
        for i := 0 to ACBrNFSe1.WebService.ConsultaLoteRps.Erros.Count - 1 do with ACBrNFSe1.WebService.ConsultaLoteRps.Erros[I] do
          if not MatchText(Codigo, ['L000', 'A0000']) then
            FListaErros := StrConcat([FListaErros, 'Código Erro : ', Codigo, '-', 'Mensagem... : ', Descricao, '-', 'Correção... : ', Correcao, '/']);
    end;

    if FListaErros <> '' then
     result := false;
  end;
end;

function TClassNfSe.VerificaRetornoAC(metodo: EMetodoNFSe): boolean;
var
  varq: string;
  vt: currency;
  AXML: string;
begin
  result := true;
  Fcodigover := '';
  FnumeroNFSe := '';
  Fdiscrimina := '';
  Foutrasinf := '';
  FCodigoCnae := '';
  FRpsNFSe := '';
  vvalNFSe := trocaVirgulaPorPonto(BuscasMnt.FieldByName('valor').AsString);
  Fprotoloco := '';
  FListaErros := '';
  AXML := '';
  //FDataEmissaoNFSe:='';
  //vvalNFSe:='';

  case metodo of
    EMetodoNFSe.Envio:
      begin
        if verificarerros(EComponente.ACbr) and
           ACBrNFSe1.WebService.Emite.Sucesso then
        begin
          with ACBrNFSe1.WebService do
          begin
            Fprotoloco  := Emite.Protocolo.Trim;
            FnumeroNFSe := Emite.NumeroNota;
          end;

          with ACBrNFSe1.NotasFiscais.Items[0] do
          begin
            FnumeroNFSe      := IfThen(FnumeroNFSe.IsEmpty, NFSe.Numero, FnumeroNFSe);
            Fcodigover       := NFSe.CodigoVerificacao;
            Fdiscrimina      := NFSe.Servico.Discriminacao;
            Foutrasinf       := NFSe.OutrasInformacoes;
            FCodigoCnae      := NFSe.Servico.CodigoCnae;
            FRpsNFSe         := NFSe.IdentificacaoRps.Numero;
            FDataEmissaoNFSe := NFSe.DataEmissao;
            vt               := NFSe.ValoresNfse.ValorLiquidoNfse;
            //AXML             := StrUtils.IfThen(not string.IsNullOrWhiteSpace(XMLNFSe), XMLNFSe, XMLOriginal).Trim;
            AXML             := XmlNfse;
          end;
        end;
      end;

    EMetodoNFSe.ConsutaNota:
      begin

        if ACBrNFSe1.WebService.ConsultaNFSeporRps.Sucesso then
        begin
          with ACBrNFSe1.WebService do
          begin
            Fprotoloco  := ConsultaNFSeporRps.Protocolo;
            FnumeroNFSe := ConsultaNFSeporRps.NumeroNota.Trim;
          end;

          with ACBrNFSe1.NotasFiscais.Items[0] do
          begin
            FnumeroNFSe      := IfThen(FnumeroNFSe.IsEmpty, NFSe.Numero, FnumeroNFSe);
            Fcodigover       := NFSe.CodigoVerificacao;
            Fdiscrimina      := NFSe.Servico.Discriminacao;
            Foutrasinf       := NFSe.OutrasInformacoes;
            FCodigoCnae      := NFSe.Servico.CodigoCnae;
            FRpsNFSe         := NFSe.IdentificacaoRps.Numero;
            FDataEmissaoNFSe := NFSe.DataEmissao;
            vt               := NFSe.ValoresNfse.ValorLiquidoNfse;
            //AXML             := StrUtils.IfThen(not string.IsNullOrWhiteSpace(XMLNFSe), XMLNFSe, XMLOriginal).Trim;
            AXML             := XmlNfse;
          end;
        end;

      end;

    EMetodoNFSe.ConsultaLote:
      begin

        if ACBrNFSe1.WebService.ConsultaLoteRps.Sucesso then
        begin
          with ACBrNFSe1.WebService do
          begin
            Fprotoloco  := ConsultaLoteRps.Protocolo;
            FnumeroNFSe := ConsultaLoteRps.NumeroNota.Trim;
          end;

          with ACBrNFSe1.NotasFiscais.Items[0] do
          begin
            FnumeroNFSe      := IfThen(FnumeroNFSe.IsEmpty, NFSe.Numero, FnumeroNFSe);
            Fcodigover       := NFSe.CodigoVerificacao;
            Fdiscrimina      := NFSe.Servico.Discriminacao;
            Foutrasinf       := NFSe.OutrasInformacoes;
            FCodigoCnae      := NFSe.Servico.CodigoCnae;
            FRpsNFSe         := NFSe.IdentificacaoRps.Numero;
            FDataEmissaoNFSe := NFSe.DataEmissao;
            vt               := NFSe.ValoresNfse.ValorLiquidoNfse;
            //AXML             := StrUtils.IfThen(not string.IsNullOrWhiteSpace(XMLNFSe), XMLNFSe, XMLOriginal).Trim;
            AXML             := XmlNfse;
          end;
        end;

      end;
  end;

  Result := gravaRetornoWs(AXML);

  if (Fcodigover <> '') and (not SilentMode) then
  begin
    ACBrNFSe1.NotasFiscais.Clear;

    if loadXMLdoBanco('NFSe_RPS' + BuscasMnt.FieldByName('cod_rps').AsString.Trim, False) then
    begin
      acrescentaendACimp;
      vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);

      ACBrNFSe1.NotasFiscais.Items[0].Imprimir;
      if cadempresa.vENVIAEMAILNFE = 'S' then
        enviaemailNFSe(2);

      Exit;
    end;

    varq := cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString + '\NFSe\DadosNFSe\NFSe\' + trim(FnumeroNFSe) + '-nfse.xml';
    if FileExists(Varq) then
    begin
      ACBrNFSe1.NotasFiscais.LoadFromFile(varq);
      acrescentaendACimp;
      vcidadegertxt.HandleValuesBeforePrint(ACBrNFSe1, Self);
      if (ACBrNFSe1.Configuracoes.Geral.Provedor in [proBHISS]) then
      begin
        //      ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
        //        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota*100;
        // O pessoal da Actcon corrigiu o problema da aliquota
        //     if ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.BaseCalculo > 0 then
        //     begin
        //       if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.Aliquota > 0 then
        //         ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:= ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.Aliquota / 100
        //       else if ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss > 0 then
        //        ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.Aliquota:=
        //        (ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorIss/ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.BaseCalculo);
        //     end;
        if ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse > 0 then
          ACBrNFSe1.NotasFiscais.Items[0].NFSe.Servico.Valores.ValorLiquidoNfse := ACBrNFSe1.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse;
      end;

      ACBrNFSe1.NotasFiscais.Items[0].Imprimir;
      if cadempresa.vENVIAEMAILNFE = 'S' then
      begin
        enviaemailNFSe(2);
      end;
    end
    else
      Application.MessageBox(PWideChar('Arquivo XML da NFSe não encontrado no caminho: ' + #13 + varq), PWideChar('Error'), MB_OK);
  end;
end;

function TClassNfSe.VerificaRetornoWs(vmsg: Widestring): boolean;
var
 venv: string;
 vobsos: AnsiString;
 vtemp:string;
begin
// Testar os padrões aqui: Abrasf, etc...
 mostrarmensagem('Verificando Retorno WebService NFSe: '+nomecliente);
 result:=true;
 venv:=trim(cadempresa.dataSet.FieldByName('ENV_NFSE').asstring);
 Arquivo:=vmsg;
 Fcodigover:='';
 FnumeroNFSe:='';
 Fdiscrimina:='';
 Foutrasinf:='';
 FCodigoCnae:='';
 FRpsNFSe:='';
 vvalNFSe:='';
 Fprotoloco:='';
 FListaErros:='';
 if verificarerros(EComponente.ACbr) then
 begin
  if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
  begin
    if cadempresa.dataSet.FieldByName('USARENVRPSSINCRONO').AsString = 'S' then
    begin
      if rExtrai(1,venv+'EnviarLoteRpsSincronoResposta') <> '' then
      begin
        Fprotoloco:=rCampo('C', venv+'Protocolo');
        if verloteexist then
        begin
         gravaRetornoWs;
         vcoderro:='';
  //       Sleep(3000);
  //       vmsg:=ConsultaNFSe;
  //       if vcoderro = 'S50' then
  //        result:=false;
        end
        else
        begin
         mostrarmensagem('Preparando para Verificar RPS no WebService NFSe...');
         Sleep(3000);
         consultaPorRPS;
    //     FListaErros:='Problemas no Envio Tente mais tarde...';
         Fprotoloco:='';
        end;
      end;
    end
    else
    begin
      if rExtrai(1,venv+'EnviarLoteRpsResposta') <> '' then
      begin
        Fprotoloco:=rCampo('C', venv+'Protocolo');
    //    FdataEnvio:=rCampo('D', venv+'DataRecebimento');
        if verloteexist then
        begin
         gravaRetornoWs;
         vcoderro:='';
         Sleep(3000);
         vmsg:=ConsultaNFSe;
         if vcoderro = 'S50' then
          result:=false;
        end
        else
        begin
         mostrarmensagem('Preparando para Verificar RPS no WebService NFSe...');
         Sleep(3000);
         consultaPorRPS;
    //     FListaErros:='Problemas no Envio Tente mais tarde...';
         Fprotoloco:='';
        end;
      end;
    end;
  end
  else
  begin
    if rExtrai(1,venv+'EnviarLoteRpsResposta') <> '' then
    begin
      Fprotoloco:=rCampo('C', venv+'Protocolo');
  //    FdataEnvio:=rCampo('D', venv+'DataRecebimento');
      if verloteexist then
      begin
       gravaRetornoWs;
       vcoderro:='';
       Sleep(3000);
       vmsg:=ConsultaNFSe;
       if vcoderro = 'S50' then
        result:=false;
      end
      else
      begin
       mostrarmensagem('Preparando para Verificar RPS no WebService NFSe...');
       Sleep(3000);
       consultaPorRPS;
  //     FListaErros:='Problemas no Envio Tente mais tarde...';
       Fprotoloco:='';
      end;
    end;
  end;

 //if FListaErros <> 'Problemas no Envio Tente mais tarde...' then
  if verificarerros(EComponente.ACbr) then
  begin
   if rExtrai(1,venv+'InfNfse') <> '' then
   begin
      Grupo:=Deixarapenasumnivel(venv);
      FnumeroNFSe:=rCampo('C', venv+'Numero');
      salvarxmlNFSe;
      Fcodigover:=rCampo('C', venv+'CodigoVerificacao');
      Fdiscrimina:=rCampo('C', venv+'Discriminacao');
      if Fdiscrimina = '' then
      begin
//       buscaadc.close;
//       buscaadc.sql.text:='SELECT OBS_OS FROM PEDVENDA WHERE NPED = '+
//       buscasmnt.FieldByName('NPED').AsString+' and tipo = '''+buscasmnt.FieldByName('TIPO').AsString+
//       ''' AND cod_empresa = '+inttostr(cadempresa.codempresa);
//       buscaadc.open;
//       vobsos:=buscaadc.FieldByName('OBS_OS').AsString;}
//       buscaadc.close;
//       buscaadc.sql.text:='SELECT FIRST 1 IT.DESC_SERVICO_RPS FROM PEDVENDA_SERV IT WHERE cod_rps = '+
//       buscasmnt.FieldByName('COD_RPS').AsString+' and it.cod_empresa = '+inttostr(cadempresa.codempresa);
//       buscaadc.open;
//       vobsos:=StringReplace(vobsos, #13, ' ', [rfReplaceAll]);
//       vobsos:=StringReplace(vobsos, #10, ' ', [rfReplaceAll]);
//       vden:=RetiraCarEsp(vobsos);
//       'NFs-e Conforme OS.: '+dataSet.FieldByName('NPED').AsString+' - ';
//       while not buscaadc.eof do
//       begin
//         vden:=vden+', '+RetiraCarEsp(buscaadc.FieldByName('DESC_SERV_PED').AsString);
//         buscaadc.next;
//       end;
//       buscaadc.Close;
       Fdiscrimina:=vden;
//       buscaadc.FieldByName('DESC_SERVICO_RPS').AsString;
       //vden;
      end;
      FDataEmissaoNFSe:=rCampo('D', venv+'DataEmissao');
      Foutrasinf:=rCampo('C', venv+'OutrasInformacoes');
      FCodigoCnae:=rCampo('C', venv+'CodigoCnae');
      if FCodigoCnae = ''  then
        FCodigoCnae:=BuscasMnt.FieldByName('cnae_serv').AsString;
      if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
       vvalNFSe:=rCampo('C', venv+'ValorLiquidoNfse')
      else
       vvalNFSe:=rCampo('C', venv+'ValorServicos');
      buscaadc.close;
      buscaadc.sql.text:='SELECT SUM(IT.ISSRET_SERVICO) AS ISSRET_SERVICO,SUM(IT.VALOR_B_NFSE) as BRUTO,'+
      'SUM(IT.VALOR_NFSE) AS VALOR_NFSE FROM PEDVENDA_SERV IT '+
      ' WHERE IT.cod_rps = '+buscasmnt.FieldByName('COD_RPS').AsString+' AND it.cod_empresa = '+inttostr(cadempresa.codempresa);
      buscaadc.open;
      FbaseCalc:=buscaadc.FieldByName('BRUTO').AsCurrency;
      //BuscasMnt.FieldByName('valor').AsCurrency+buscasmnt.FieldByName('IRRF_SERVICO').Ascurrency;
      Fir:=buscasmnt.FieldByName('IRRF_SERVICO').Ascurrency;
      if BuscasMnt.FieldByName('ISS_RETIDO').AsInteger = 1 then
      begin
       Fissretido:=buscaadc.FieldByName('ISSRET_SERVICO').Ascurrency;
      end
      else
       Fissretido:=0;
//      buscasmnt.FieldByName('IRRF_SERVICO').Ascurrency;
      if cadempresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').AsInteger <> 1 then
      begin
       Faliq:=BuscasMnt.FieldByName('aliq_iss').AsCurrency;
       if cadempresa.dataSet.FieldByName('VERSAO_ABRASF').AsInteger = 2 then
       begin
         try
          Fiss:=strtocurr(trocaPontoporVirgula(rCampo('C', venv+'ValorIss')));
          Faliq:=strtocurr(trocaPontoporVirgula(rCampo('C', venv+'Aliquota')));
         except
          Fiss:=(FbaseCalc*(Faliq/100));
         end;
       end
       else
        Fiss:=(FbaseCalc*(Faliq/100));
      end
      else
      begin
       Faliq:=0;
//       FbaseCalc:=0;
       Fiss:=0;
      end;
      if rExtrai(1,venv+'IdentificacaoRps') <> '' then
       FRpsNFSe:=rCampo('C', venv+'Numero');
      FvalorLiq:=buscaadc.FieldByName('VALOR_NFSE').Ascurrency;
      //FbaseCalc-buscasmnt.FieldByName('IRRF_SERVICO').Ascurrency;
//      buscasmnt.FieldByName('ISSRET_SERVICO').Ascurrency);
      buscaadc.close;
   end;
  end;
 end;
 Result:=gravaRetornoWs;
 if Fcodigover <> '' then
 begin
  imprimirRPSNFSe(1);
  if cadempresa.vENVIAEMAILNFE = 'S' then
  begin
    enviaemailNFSe(1);
  end;
 end;
 mostrarmensagem('');
end;

function TClassNfSe.verificarGARANTIA(vos: integer; pUsarGravado: Boolean): boolean;
//quando "pUsarGravado=False" vai pedir que o usuario informe o cliente e sera gravado o cliente escolhido,
//  antes de fazer a retenção o metodo será chamado
//quando "pUsarGravado=True" o cliente ja foi definido e gravado no banco de dados, a retenção ja foi definida
var
 vcdgar: string;
begin
result:=true;
buscaadc.close;
buscaadc.sql.text:='select tipo_os, cod_cliente_nfserv from pedvenda where nped = '+inttostr(vos)+
//buscaadc.sql.text:='select tipo_os from pedvenda where nped = '+inttostr(vos)+
' and cod_empresa = '+inttostr(cadempresa.codempresa)+' and tipo = ''OS'' ';
buscaadc.open;
if trim(buscaadc.FieldByName('TIPO_OS').AsString) = 'GARANTIA' then
begin
  while true do
  begin
    if (pUsarGravado) and (buscaadc.FieldByName('cod_cliente_nfserv').AsInteger > 0) then
    begin
      vcdgar := IntToStr(buscaadc.FieldByName('cod_cliente_nfserv').AsInteger);
      vcodgar:=StrToInt(vcdgar);
      buscaadc.close;
      buscaadc.sql.text:='select nome_cliente from clientes where cod_cliente = '+trim(vcdgar)+' and cod_empresa = '+
        inttostr(cadempresa.codempresa);
      buscaadc.open;
      if not buscaadc.IsEmpty then
      begin
        Result := True;
        Break;
      end;
    end;

   if InputQuery('Código do Fabricante', 'Entre com o Cód. Fabricante', vcdgar) then
   begin
     try
      vcodgar:=StrToInt(vcdgar);
      buscaadc.close;
      buscaadc.sql.text:='select nome_cliente from clientes where cod_cliente = '+trim(vcdgar)+' and cod_empresa = '+
      inttostr(cadempresa.codempresa);
      buscaadc.open;
      if buscaadc.IsEmpty then
      begin
       messagedlg('Cliente não encontrado',mtinformation,[mbOK],0);
      end
      else
      begin
       if Application.MessageBox(PWideChar('Atenção, a NFSe será emitida em nome de '+buscaadc.FieldByName('NOME_CLIENTE').asstring+
       '. Continua?'), 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
       begin
         buscaadc.close;
         buscaadc.sql.text:='update pedvenda set cod_cliente_nfserv = ' + IntToStr(vcodgar) +
           ' where nped = '+inttostr(vos)+
           ' and cod_empresa = '+inttostr(cadempresa.codempresa)+' and tipo = ''OS'' ';
         buscaadc.ExecSQL;
         Result:=true;
         break;
       end;
      end;
     except
      messagedlg('Problemas de conversão do código',mtinformation,[mbOK],0);
     end;
   end;
  end;
end
else
 Result:=false;
end;

function TClassNfSe.verloteexist: boolean;
begin
 result:=true;
 buscaadc.close;
 buscaadc.sql.text:='select nprotNFSe,nped from pedvenda_serv where nprotNFSe = '''+Fprotoloco+
 ''' and cod_empresa = '+inttostr(cadempresa.codempresa);
 buscaadc.open;
 if not buscaadc.isempty then
 begin
   if (BuscasMnt.FieldByName('nped').asinteger = buscaadc.FieldByName('nped').asinteger)  then
    result:=true
   else
    Result:=false;
 end;
end;

procedure TClassNfSe.zerarAtributos;
begin
//   nrloterps:=0;
   Fprotoloco:='';
   FListaErros:='';
   FnumeroNFSe:='';
   Fcodigover:='';
   Fdiscrimina:='';
   Foutrasinf:='';
   FCodigoCnae:='';
   FRpsNFSe:='';
   nroLote:='';
   vosNFSe:=0;
   vcoderro:='';
   vvalNFSe:='';
   Fpis:=0;
   Fcofins:=0;
   Finss:=0;
   Fir:=0;
   Fcsll:=0;
   FoutrasRet:=0;
   Fdeducoes:=0;
   Fdescadc:=0;
   FdescCond:=0;
   FbaseCalc:=0;
   Faliq:=0;
   Fiss:=0;
   Fissretido:=0;
   FvalorLiq:=0;
   Fvalorbruto:=0;
end;

function TClassNfSe.StrTonumero(var ok: boolean; const s: string; const AString:
  array of string; const AEnumerados: array of variant): variant;
var
  i: integer;
begin
  result := -1;
  for i := Low(AString) to High(AString) do
    if AnsiSameText(s, AString[i]) then
      result := AEnumerados[i];
  ok := result <> '';
  if not ok then
    result := AEnumerados[0];
end;

function TClassNfSe.TentarValidarCancelamentoPersonalizado(out AResult: Boolean): Boolean;
var
  aPathsTags, aPathsTagsValues: TArray<string>;
begin
  Result := False;

  var sIdent := Format('%d_Cancelamento_Personalizado', [ ACBrNFSe1.Configuracoes.Geral.CodigoMunicipio ]);

  if not ConfSis.ReadString(sIdent, 'Ativo').ToUpper().Trim().Equals('S') then
    Exit();

  Result := True;
  AResult := False; // Nota nao cancelada

  var sValue := ConfSis.ReadString(sIdent, 'IgnorarErro');
  var errows := GetErrosNFSeObj();

  try
    if not sValue.IsEmpty() then
      errows.RemoverViaCodigo(sValue);

    var erros := errows.ToString().Trim();

    if not erros.IsEmpty then
      raise Exception.Create(erros);

  finally
    errows.Clear();
  end;

  sValue := ConfSis.ReadString(sIdent, 'VerificarEmMetodo');

  var sXmlContent := '';

  {$REGION 'ConsultaNFSe'}

  if sValue.ToUpper().Equals('ConsultaNFSe'.ToUpper()) then
    sXmlContent := ACBrNFSe1.WebService.ConsultaNFSe.ArquivoRetorno;

  {$ENDREGION}

  aPathsTags := [];
  var iPos := 1;
  var sTagValue := '';
  var sTagPath := '';
  var sNodeContent := '';

  repeat
    sNodeContent := sXmlContent;
    sTagPath  := ConfSis.ReadString(sIdent, 'VerificarEmTag' + iPos.ToString()).Replace('/', '.', [rfReplaceAll]);
    sTagValue := ConfSis.ReadString(sIdent, 'VerificarValorTagIgual' + iPos.ToString());

    if sTagPath.IsEmpty() then
      Exit();

    aPathsTags := sTagPath.Split(['.']);
    var sCurrentPath := '';

    for sValue in aPathsTags do
    begin
      var sTagI := Format('<%s>', [ sValue ]);
      var sTagF := Format('</%s>', [ sValue ]);

      sCurrentPath := sCurrentPath + IfThen(not sCurrentPath.IsEmpty(), '.') + sValue;

      if sCurrentPath = sTagPath then
      begin
        sNodeContent := TagsHelper.Extract(sNodeContent, sTagI, sTagF, False, False );

        if sTagValue.StartsWith('[@') and sTagValue.EndsWith(']') then
        begin
          var field := dataset.FindField(sTagValue.Substring(2, sTagValue.Length - 3));
          if Assigned(field) then
            AResult := field.AsString = sNodeContent;
        end
        else
          AResult := sTagValue = sNodeContent;

        if not AResult  then
          Exit();
      end
      else
        sNodeContent := TagsHelper.Extract(sNodeContent, sTagI, sTagF, False, False );

    end;

    Inc(iPos);
  until
    sTagPath = '';

end;

function TClassNfSe.trocaPontoporVirgula(valor: string): string;
begin
  Result := StringReplace(valor, '.', ',', [rfReplaceAll, rfIgnoreCase]);
end;

{ TClssEmpresaHelper }

function TClssEmpresaHelper.IsValadaresComSigISS: Boolean;
var
  inicioISSIntel: TDateTime;
begin
  Result := Self.IsValadaresComSigISS(Date);
end;

function TClssEmpresaHelper.IsValadaresComSigISS(
  const DataDoc: TDateTime): Boolean;
begin
  Result := (Self.fstr('IBGE_COD_CIDADE') = '3127701') and
            (DataDoc >= EncodeDate(2018, 04, 02)) and
            (DataDoc <= EncodeDate(2024, 05, 30));
end;

{ TNFSeConsulta }

class function TNFSeConsulta.Create(Status: TNFSeConsultaStatus; Condicao: TNFSeConsultaCondicao; const Campo, Ordem,
  Valor, Data1, Data2: string): TNFSeConsulta;
begin
  Result.FStatus := Status;
  Result.FCondicao := Condicao;
  Result.FCampo := Campo;
  Result.FOrdem := Ordem;
  Result.FValor := Valor;
  Result.FData1 := Data1;
  Result.FData2 := Data2;
end;

end.
