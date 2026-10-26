unit DFeHwLibUnit;

interface

type
  DFeHwLib = class
  public
    class procedure Setup(const DataBaseName: string; CodEmpresa: Integer);

    // nfe_autorizar
    class function Autorizar(CodigosNF: array of Integer; var AErros: WideString): Boolean;
    // demais metodos refatorados
    // nfe_imprimir
    //class function Imprimir(CodigosNF: array of Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; var AErros: WideString): Boolean;
    // ...
    // nfe_converter_em_contingencia
    class function ConverterEmContingencia(CodigoNF: Integer; var AErros: WideString): Boolean;
    // nfe_resolver_pendencia_sefaz
    class function ResolverPendenciaNFeSefaz(CodigoNF: Integer; var AErros: WideString): Boolean;
  end;

  Tnfe_imprimir              = function (Acod_nf: array of Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_print                 = function (Acod_nf: array of Integer; params: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_email                 = function (Acod_nf: array of Integer; AemailUnico, AcomEventos, AcomPDF, AcomBol: Boolean; Aemail, Aanexos: WideString; Acod_empresa: Longint; AdbName, Ausuario: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_consultar             = function (Acod_nf: array of Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_status_servico        = function (AtpEmiss: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_inutilizacao_enviar   = function (Aseqid: Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_inutilizacao_imprimir = function (Aseqid: Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_inutilizacao_email    = function (Aseqid: array of Integer; Aemail, Aanexos: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_evento_enviar         = function (Acod_nf, Alote: Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_evento_imprimir       = function (Acod_nf, Alote: Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
  Tnfe_evento_email          = function (Acod_nf, Alote: Integer; Aemail, Aanexos: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
  Tdfe_dados_certificado     = function (cod_empresa: Longint; dbName, modelo: WideString; var Aerros: WideString): WideString; stdcall;
  Tfile_open_dialog          = function (var Afolter: WideString): Boolean; stdcall;


  ArrayBi = array of array of shortstring;

  TVisualizaNFe = function(comveic, vendBanco: WideString; codempresa: integer; vversao: WideString;vusuario: WideString):
    longbool; stdcall;
  TEnviarNFeHW = function(comveic: WideString; vendBanco: WideString; codempresa: integer; vversao: WideString;
    vnumnf: integer; tipoNF: WideString; tpop: WideString; vsubserie: WideString;vusuario: WideString): longbool; stdcall;
  TLerConfiguracao = function(certif, geral, webservice: array of shortstring; vescolhacert: WideString):
    WideString; stdcall;
  TleCertificadoNFe = function: WideString; stdcall;
  TverificarStatusWeb = function(verresultado: WideString): WideString; stdcall;
  TGeraNFe = function(hide, hemit, hDest, temVeic, veiculo, htotal: array of shortstring; tProd:
    ArrayBi; tipoOP: WideString; vNLote: Integer; tipoI_F: Integer; var resposta: WideString; sisint: WideString;
    NFTP: WideString; codempresa: WideString; Ddup: ArrayBi; DTransp: array of shortstring): WideString; stdcall;
  TTerminaNFE = function: LongBool; stdcall;
  TExecutarDLL = function(ttipo: WideString; Aux: WideString; Just: WideString; var resposta: WideString; sisint: WideString;
    NFTP: WideString; codempresa: WideString; vtipocons: WideString; statusNFE: WideString): WideString; stdcall;
   TStatus= function : WideString; stdcall;
//  TConsultaRFB=function(vChave: WideString;vusuario: WideString): WideString; stdcall;
  TConsultaSefazOr = function(vUF: WideString;vChave: WideString;vserie: WideString;vusuario: WideString;codempresa: integer;vendbanco: WideString): longbool; stdcall;
  //TVerificaSCAN = function(codempresa: integer;vendbanco: WideString): integer; stdcall;
  TConsNFEDLL=function(vendBanco: WideString;codempresa: integer; vversao: WideString; vnumnf: integer; tipoNF: WideString; vsubserie:WideString; vusuario: WideString): longbool; stdcall;
  TValidaChaveNFe = function (vchave: WideString): longbool; stdcall;
//  TEnviarCCe = function(vendBanco: WideString; codempresa, idLote: integer; vusuario: WideString): longbool; stdcall;
  TEnviarEvento = function (vendBanco: WideString; codempresa, idLote: integer; vusuario: WideString;tpop: WideString): longbool; stdcall;
  TNFDownload = function(vendBanco: WideString; codempresa:integer; vusuario: WideString;vchave: WideString): longbool; stdcall;
  TNFDestinadas = function(vendBanco: WideString; codempresa:integer; vusuario: WideString;indNFe,indemi: WideString;vtpultnsu: integer;vtpcons: integer;nsuespec: string): longbool; stdcall;
  TEnviarEmailNFe = function (vendBanco: WideString; codempresa: integer; vversao: WideString; vnumnf: integer; tipoNF: WideString;vsubserie:WideString;vusuario: WideString): LongBool; stdcall;
  {
  TVisualizaNFe = function(comveic, vendBanco: PChar; codempresa: integer; vversao: PChar;vusuario: PChar):
    longbool; stdcall;
  TEnviarNFeHW = function(comveic: PChar; vendBanco: PChar; codempresa: integer; vversao: PChar;
    vnumnf: integer; tipoNF: PChar; tpop: PChar; vsubserie: PChar;vusuario: PChar): longbool; stdcall;
  TLerConfiguracao = function(certif, geral, webservice: array of shortstring; vescolhacert: PChar):
    PChar; stdcall;
  TleCertificadoNFe = function: PChar; stdcall;
  TverificarStatusWeb = function(verresultado: PChar): PChar; stdcall;
  TGeraNFe = function(hide, hemit, hDest, temVeic, veiculo, htotal: array of shortstring; tProd:
    ArrayBi; tipoOP: PChar; vNLote: Integer; tipoI_F: Integer; var resposta: PChar; sisint: PChar;
    NFTP: PChar; codempresa: PChar; Ddup: ArrayBi; DTransp: array of shortstring): PChar; stdcall;
  TTerminaNFE = function: LongBool; stdcall;
  TExecutarDLL = function(ttipo: PChar; Aux: PChar; Just: PChar; var resposta: PChar; sisint: PChar;
    NFTP: PChar; codempresa: PChar; vtipocons: PChar; statusNFE: PChar): PChar; stdcall;
   TStatus= function : PChar; stdcall;
  TConsultaRFB=function(vChave: PChar;vusuario: PChar): PChar; stdcall;
  TConsultaSefazOr = function(vUF: PChar;vChave: PChar;vserie: PChar;vusuario: PChar;codempresa: integer;vendbanco: PChar): longbool; stdcall;
  TVerificaSCAN = function(codempresa: integer;vendbanco: PChar): integer; stdcall;
  TConsNFEDLL=function(vendBanco: PChar;codempresa: integer; vversao: PChar; vnumnf: integer; tipoNF: PChar; vsubserie:PChar; vusuario: PChar): longbool; stdcall;
  TValidaChaveNFe = function (vchave: PChar): longbool; stdcall;
//  TEnviarCCe = function(vendBanco: PChar; codempresa, idLote: integer; vusuario: PChar): longbool; stdcall;
  TEnviarEvento = function (vendBanco: PChar; codempresa, idLote: integer; vusuario: PChar;tpop: PChar): longbool; stdcall;
  TNFDownload = function(vendBanco: PChar; codempresa:integer; vusuario: PChar;vchave: PChar): longbool; stdcall;
  TNFDestinadas = function(vendBanco: PChar; codempresa:integer; vusuario: PChar;indNFe,indemi: PChar;vtpultnsu: integer;vtpcons: integer;nsuespec: string): longbool; stdcall;
  }
  //MDFe
//  TEnviarMDFE = function(vnumMDF: integer;codempresa: integer;vnumlote: integer;vendBanco: PChar;vusuario: PChar): PChar;stdcall;
//  TConsultarMDFE = function(vnummdfe,vnumloteconsulta,codempresa: integer;vendBanco: PChar;vusuario: PChar): LongBool;stdcall;
//  TEnviaEventoMDFE = function(nmdfe: integer; codempresa: integer;vendBanco: PChar;vusuario: PChar): LongBool;stdcall;
//  TImprimirMDFE = function(vnummdfe: integer;codempresa: integer;vendBanco: PChar;vusuario: PChar):LongBool;stdcall;
//  TImprimirEventoMDFE = function(vnmdfe: integer;codempresa: integer;vendBanco: PChar;vusuario: PChar):LongBool;stdcall;
//  TEnviarEmailMDFE = function(vnmdfe: integer;codempresa,vtpop: integer;vendBanco: PChar;vusuario: PChar):LongBool;stdcall;

function carregaDLLNfe: boolean;
procedure destroyDLLNfe;

var
  hdNFE: thandle;
  VisualizaNFe: TVisualizaNFe;
  EnviarNFeHW: TEnviarNFeHW;
  LerConfiguracao: TLerConfiguracao;
  leCertificadoNFe: TleCertificadoNFe;
  verificarStatusWeb: TverificarStatusWeb;
  GeraNFe: TGeraNFe;
  TerminaNFE: TTerminaNFE;
  ExecutarDLL: TExecutarDLL;
  Status :TStatus;
//  ConsultaRFB: TConsultaRFB;
  ConsultaSefazOr: TConsultaSefazOr;
//  VerificaSCAN: TVerificaSCAN;
  ConsNFEDLL: TConsNFEDLL;
  ValidaChaveNFe: TValidaChaveNFe;
//  EnviarCCe: TEnviarCCe;
  EnviarEvento: TEnviarEvento;
  NFDownload: TNFDownload;
  NFDestinadas: TNFDestinadas;
  EnviarEmailNFe: TEnviarEmailNFe;
  //MDFe
//  EnviarMDFE: TEnviarMDFE;
//  ConsultarMDFE: TConsultarMDFE;
//  EnviaEventoMDFE: TEnviaEventoMDFE;
//  ImprimirMDFE: TImprimirMDFE;
//  ImprimirEventoMDFE: TImprimirEventoMDFE;
//  EnviarEmailMDFE: TEnviarEmailMDFE;

implementation

uses
  Windows;

  {$REGION 'Declarações'}
const
  DLL_NAME = 'hw.nfe.dx.dll';

  function nfe_autorizar(Acod_nf: array of Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external DLL_NAME;
  function nfe_converter_em_contingencia(CodigoNF: Integer; EmpresaId: Integer; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external DLL_NAME;
  function nfe_resolver_pendencia_sefaz(CodigoNF: Integer; EmpresaId: Integer; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external DLL_NAME;

  {$ENDREGION}

var
   DBNameState: WideString;
   EmpresaIdState: Integer;

function carregaDLLNfe: boolean;
begin
  hdNFE := 0;
  hdNFE := LoadLibrary(PAnsiChar('hw.nfe.dx.dll'));
  if hdNFE <> 0 then
  begin
    @VisualizaNFe := GetProcAddress(hdNFE, PAnsiChar('VisualizaNFe'));
    @EnviarNFeHW := GetProcAddress(hdNFE, PAnsiChar('EnviarNFeHW'));
    @LerConfiguracao := GetProcAddress(hdNFE, PAnsiChar('LerConfiguracao'));
    @leCertificadoNFe := GetProcAddress(hdNFE, PAnsiChar('leCertificadoNFe'));
    @verificarStatusWeb := GetProcAddress(hdNFE, PAnsiChar('verificarStatusWeb'));
    @GeraNFe := GetProcAddress(hdNFE, PAnsiChar('GeraNFe'));
    @TerminaNFE := GetProcAddress(hdNFE, PAnsiChar('TerminaNFE'));
    @ExecutarDLL := GetProcAddress(hdNFE, PAnsiChar('ExecutarDLL'));
//    @ConsultaRFB:=GetProcAddress(hdNFE, PAnsiChar('ConsultaRFB'));
    @ConsultaSefazOr:= GetProcAddress(hdNFE, PAnsiChar('ConsultaSefazOr'));
//    @VerificaSCAN:= GetProcAddress(hdNFE, PAnsiChar('VerificaSCAN'));
    @ConsNFEDLL := GetProcAddress(hdNFE, PAnsiChar('ConsNFEDLL'));
    @ValidaChaveNFe:=GetProcAddress(hdNFE, PAnsiChar('ValidaChaveNFe'));
//    @EnviarCCe:=GetProcAddress(hdNFE, PAnsiChar('EnviarCCe'));
    @EnviarEvento :=GetProcAddress(hdNFE, PAnsiChar('EnviarEvento'));
    @NFDownload := GetProcAddress(hdNFE, PAnsiChar('NFDownload'));
    @NFDestinadas := GetProcAddress(hdNFE, PAnsiChar('NFDestinadas'));
    @EnviarEmailNFe := GetProcAddress(hdNFE, PAnsiChar('EnviarEmailNFe'));
    //MDFe
//    @EnviarMDFE := GetProcAddress(hdNFE, PChar('EnviarMDFE'));
//    @ConsultarMDFE := GetProcAddress(hdNFE, PChar('ConsultarMDFE'));
//    @EnviaEventoMDFE := GetProcAddress(hdNFE, PChar('EnviaEventoMDFE'));
//    @ImprimirMDFE := GetProcAddress(hdNFE, PChar('ImprimirMDFE'));
//    @ImprimirEventoMDFE := GetProcAddress(hdNFE, PChar('ImprimirEventoMDFE'));
//    @EnviarEmailMDFE := GetProcAddress(hdNFE, PChar('EnviarEmailMDFE'));
  end;
end;

procedure destroyDLLNfe;
begin
  if hdNFE <> 0 then
   FreeLibrary(hdNFE);
end;

{ DFeHwLib }

class function DFeHwLib.Autorizar(CodigosNF: array of Integer; var AErros: WideString): Boolean;
begin
  Result := nfe_autorizar(CodigosNF, EmpresaIdState, DBNameState, AErros);
end;

class function DFeHwLib.ConverterEmContingencia(CodigoNF: Integer; var AErros: WideString): Boolean;
begin
  Result := nfe_converter_em_contingencia(CodigoNF, EmpresaIdState, DBNameState, AErros);
end;

class function DFeHwLib.ResolverPendenciaNFeSefaz(CodigoNF: Integer; var AErros: WideString): Boolean;
begin
  Result := nfe_resolver_pendencia_sefaz(CodigoNF, EmpresaIdState, DBNameState, AErros);
end;

class procedure DFeHwLib.Setup(const DataBaseName: string; CodEmpresa: Integer);
begin
  DBNameState := DataBaseName;
  EmpresaIdState := CodEmpresa;
end;

end.

