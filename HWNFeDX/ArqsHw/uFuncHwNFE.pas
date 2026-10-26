unit uFuncHwNFE;

interface

type
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
  TConsultaSefazOr = function(vUF: WideString;vChave: WideString;vserie: WideString;vusuario: WideString;codempresa: integer;vendbanco: WideString): longbool; stdcall;
//  TConsultaRFB=function(vChave: WideString;vusuario: WideString): WideString; stdcall;
  TVerificaSCAN=function(codempresa: integer;vendbanco: WideString): integer; stdcall;
  TConsNFEDLL=function(vendBanco: WideString;codempresa: integer;vversao: WideString;vnumnf: integer;tipoNF: WideString;vsubserie:WideString;vusuario: WideString): longbool; stdcall;
  TVisualizaNFSe=function(vendBanco: WideString;codempresa: integer;vusuario: WideString): longbool; stdcall;
  TEnviaOSNFSe=function(vendBanco: WideString;codempresa: integer;vusuario: WideString;vos: integer): longbool; stdcall;

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
  ConsultaSefazOr: TConsultaSefazOr;
//  ConsultaRFB: TConsultaRFB;
  VerificaSCAN: TVerificaSCAN;
  ConsNFEDLL: TConsNFEDLL;
  VisualizaNFSe: TVisualizaNFSe;
  EnviaOSNFSe:TEnviaOSNFSe;

  Status :TStatus;

implementation

uses
  Windows;

function carregaDLLNfe: boolean;
begin
  hdNFE := 0;
  hdNFE := LoadLibrary(WideString('hw.nfe.dx.dll'));
  if hdNFE <> 0 then
  begin
    @VisualizaNFe := GetProcAddress(hdNFE, WideString('VisualizaNFe'));
    @EnviarNFeHW := GetProcAddress(hdNFE, WideString('EnviarNFeHW'));
    @LerConfiguracao := GetProcAddress(hdNFE, WideString('LerConfiguracao'));
    @leCertificadoNFe := GetProcAddress(hdNFE, WideString('leCertificadoNFe'));
    @verificarStatusWeb := GetProcAddress(hdNFE, WideString('verificarStatusWeb'));
    @GeraNFe := GetProcAddress(hdNFE, WideString('GeraNFe'));
    @TerminaNFE := GetProcAddress(hdNFE, WideString('TerminaNFE'));
    @ExecutarDLL := GetProcAddress(hdNFE, WideString('ExecutarDLL'));
    @ConsultaSefazOr:= GetProcAddress(hdNFE, WideString('ConsultaSefazOr'));
//    @ConsultaRFB:=GetProcAddress(hdNFE, WideString('ConsultaRFB'));
    @VerificaSCAN:=GetProcAddress(hdNFE, WideString('VerificaSCAN'));
    @ConsNFEDLL:=GetProcAddress(hdNFE, WideString('ConsNFEDLL'));
    @VisualizaNFSe:=GetProcAddress(hdNFE, WideString('VisualizaNFSe'));
    @EnviaOSNFSe:=GetProcAddress(hdNFE, WideString('EnviaOSNFSe'));
  end;
end;

procedure destroyDLLNfe;
begin
  if hdNFE <> 0 then
   FreeLibrary(hdNFE);
end;

end.

