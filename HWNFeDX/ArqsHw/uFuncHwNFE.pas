unit uFuncHwNFE;

interface

type
  ArrayBi = array of array of shortstring;
  TVisualizaNFe = function(comveic, vendBanco: WideString; codempresa: integer; vversao: WideString;vusuario: WideString):
    longbool; stdcall;
  TverificarStatusWeb = function(verresultado: WideString): WideString; stdcall;
  TGeraNFe = function(hide, hemit, hDest, temVeic, veiculo, htotal: array of shortstring; tProd:
    ArrayBi; tipoOP: WideString; vNLote: Integer; tipoI_F: Integer; var resposta: WideString; sisint: WideString;
    NFTP: WideString; codempresa: WideString; Ddup: ArrayBi; DTransp: array of shortstring): WideString; stdcall;
  TTerminaNFE = function: LongBool; stdcall;
  TConsultaSefazOr = function(vUF: WideString;vChave: WideString;vserie: WideString;vusuario: WideString;codempresa: integer;vendbanco: WideString): longbool; stdcall;
//  TConsultaRFB=function(vChave: WideString;vusuario: WideString): WideString; stdcall;
  TConsNFEDLL=function(vendBanco: WideString;codempresa: integer;vversao: WideString;vnumnf: integer;tipoNF: WideString;vsubserie:WideString;vusuario: WideString): longbool; stdcall;
  TVisualizaNFSe=function(vendBanco: WideString;codempresa: integer;vusuario: WideString): longbool; stdcall;
  TEnviaOSNFSe=function(vendBanco: WideString;codempresa: integer;vusuario: WideString;vos: integer): longbool; stdcall;

function carregaDLLNfe: boolean;
procedure destroyDLLNfe;

var
  hdNFE: thandle;
  VisualizaNFe: TVisualizaNFe;
  verificarStatusWeb: TverificarStatusWeb;
  GeraNFe: TGeraNFe;
  TerminaNFE: TTerminaNFE;
  ConsultaSefazOr: TConsultaSefazOr;
//  ConsultaRFB: TConsultaRFB;
  ConsNFEDLL: TConsNFEDLL;
  VisualizaNFSe: TVisualizaNFSe;
  EnviaOSNFSe:TEnviaOSNFSe;


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
    @verificarStatusWeb := GetProcAddress(hdNFE, WideString('verificarStatusWeb'));
    @GeraNFe := GetProcAddress(hdNFE, WideString('GeraNFe'));
    @TerminaNFE := GetProcAddress(hdNFE, WideString('TerminaNFE'));
    @ConsultaSefazOr:= GetProcAddress(hdNFE, WideString('ConsultaSefazOr'));
//    @ConsultaRFB:=GetProcAddress(hdNFE, WideString('ConsultaRFB'));
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

