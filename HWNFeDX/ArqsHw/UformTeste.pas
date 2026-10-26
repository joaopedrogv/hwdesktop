unit UformTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.Mask, Vcl.ExtCtrls, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, DFeDLLHeader{, EnterantHw};

type
  ArrayBi = array of array of shortstring;
  TfrmTestes_DFe = class(TForm)
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    tabDPSNFSE: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    BitBtn1: TBitBtn;
    Button1: TButton;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn18: TBitBtn;
    ckEnvEmail: TCheckBox;
    ckEnvBolet: TCheckBox;
    ckImprimir: TCheckBox;
    GroupBox3: TGroupBox;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    GroupBox2: TGroupBox;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn11: TBitBtn;
    Edit1: TEdit;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    Button4: TButton;
    BitBtn2: TBitBtn;
    Button6: TButton;
    BitBtn9: TBitBtn;
    Button14: TButton;
    BitBtn17: TBitBtn;
    memoNFe400: TMemo;
    Panel1: TPanel;
    cbBancos: TComboBox;
    spedCodEmp: TSpinEdit;
    Panel2: TPanel;
    btNFe4_Enviar: TBitBtn;
    edNumNota: TMaskEdit;
    BitBtn19: TBitBtn;
    edLote: TMaskEdit;
    BitBtn20: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    ckPrint: TCheckBox;
    ckPDF: TCheckBox;
    FileOpenDialog1: TFileOpenDialog;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    edSeqidInut: TMaskEdit;
    Label4: TLabel;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    ckBol: TCheckBox;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    TabSheet8: TTabSheet;
    GroupBox4: TGroupBox;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    FAZNFe: TTabSheet;
    BitBtn35: TBitBtn;
    edFazNFEPathPdf: TMaskEdit;
    TabSheet9: TTabSheet;
    edBancoNFSeX1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edEmpresaNFSeX: TSpinEdit;
    BitBtn36: TBitBtn;
    edBancoNFSeX: TComboBox;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    edEmpConf: TSpinEdit;
    edBancoConf: TComboBox;
    BitBtn39: TBitBtn;
    edLogNFSeConfig: TMemo;
    TabSheet10: TTabSheet;
    BitBtn40: TBitBtn;
    memoGrid9999: TMemo;
    lbProgressDownload: TLabel;
    NetHTTPClient1: TNetHTTPClient;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    edLogNFSe: TMemo;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    ckImprimirNFSeTo: TCheckBox;
    BitBtn46: TBitBtn;
    ckSalvarNFSeTo: TCheckBox;
    BitBtn47: TBitBtn;
    BitBtn43: TBitBtn;
    btnNFeConverterNFeEmContingencia: TBitBtn;
    btnNFeResolverContigencia: TBitBtn;
    edSecret: TEdit;
    edInput: TEdit;
    edOutput: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn48: TBitBtn;
    BitBtn49: TBitBtn;
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btNFe4_EnviarClick(Sender: TObject);
    procedure edNumNotaExit(Sender: TObject);
    procedure cbBancosExit(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure edLoteExit(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure edSeqidInutExit(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure edBancoConfChange(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure btnNFeConverterNFeEmContingenciaClick(Sender: TObject);
    procedure btnNFeResolverContigenciaClick(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
  private
    { Private declarations }
    procedure RegEditW(AName, AValue: string); overload;
    procedure RegEditW(AMaskEdit: TMaskEdit); overload;
    procedure RegEditW(AComboBox: TComboBox); overload;
    function RegEditR(AName, ADefault: string): string;

    procedure processarRetornoNFe400(Aretorno: Boolean; AstrRetorno: WideString);
    procedure SetupSessionDLL();
  public
    procedure DownloadLog(const AMessage: string);
    procedure DownloadProgress(Percent: Integer);
  end;

//  function LerConfiguracao(certif, geral, webservice: array of shortstring;vescolhacert: Pchar): Pchar; stdcall; external 'HWNFe.dll';
//
//  function leCertificadoNFe: Pchar; stdcall; external 'HWNFe.dll';
//
//  function GeraNFe(hide, hemit, hDest, temVeic, veiculo, htotal: array of shortstring; detProd: ArrayBi; tipoOP: pchar; vnLote: Integer; tipoI_F: Integer;var resposta: Pchar;Ddup: ArrayBi;DTransp:array of shortstring): Pchar; stdcall; external 'HWNFe.dll';
//
//  function Status: Pchar; stdcall; external 'HWNFe.dll';
//
//  procedure StatusChange; external 'HWNFe.dll';
//
//  function ExecutarDLL(ttipo: pchar; Aux: Pchar; Just: Pchar;var resposta:Pchar;sisint: Pchar;NFTP: Pchar;codempresa: Pchar;vtipocons: Pchar;statusNFE: Pchar): Pchar; stdcall; external 'HWNFe.dll';
//
//  function InutilizarNFe(justificativa, cnpjemit, modelo, serie, ano, numeroinicial, numerofinal: pchar): Pchar; stdcall; external 'HWNFe.dll';
//
//  function VisualizaNFe(comveic,vendBanco: PChar;codempresa: integer;vversao: Pchar): longbool; stdcall; external 'HWNFe.dll';
//
//  function verificarStatusWeb: PChar;  stdcall; external 'HWNFe.dll';
//
//  function TerminaNFE: LongBool;stdcall;external 'HWNFe.dll';
//
//  function EnviarNFeHW(comveic,vendBanco: PChar;codempresa: integer;vversao: Pchar;vnumnf: integer;tipoNF: Pchar;tpop: Pchar;vsubserie:Pchar): longbool; stdcall;external 'HWNFe.dll';
//function EnviarNFeHW(comveic: Pchar;vendBanco: PChar;codempresa: integer;vversao: Pchar;vnumnf: integer;tipoNF: Pchar;tpop: Pchar;vsubserie:Pchar;vusuario: Pchar): longbool; stdcall; external 'HWNFe.dll';
// function ConsultaRFB(vChave: PChar;vusuario: Pchar): Pchar; stdcall;external 'hw.nfe.dx.dll';
 function ValidaChaveNFe(vchave: Pchar): longbool; stdcall;external 'hw.nfe.dx.dll';
 function GeraChaveNFe(codigo_uf: integer;cnf: integer;modelo: integer;
 serie: integer;nnf: integer;tpemi: integer;vdata: Pchar;cnpj: Pchar): Pchar; stdcall; external 'hw.nfe.dx.dll';
 function EnviarEvento(vendBanco: PChar; codempresa, idLote: integer; vusuario: Pchar;tpop: Pchar): longbool; stdcall; external 'hw.nfe.dx.dll';
 procedure closeallAuditoria ;stdcall; external 'auditoria.dll';
 function NFDestinadas(vendBanco: WideString; codempresa:integer; vusuario: WideString;indNFe,indemi: WideString;vtpultnsu: integer;vtpcons: integer;nsuespec: string): longbool; stdcall; external 'hw.nfe.dx.dll';
 function NFDownload(vendBanco: PChar; codempresa:integer; vusuario: Pchar;vchave: pchar): longbool; stdcall;external 'hw.nfe.dx.dll';
 function EnviarMDFE(vnumMDF: integer;codempresa: integer;vnumlote: integer;vendBanco: PChar;vusuario: Pchar): Pchar;stdcall;external 'hw.nfe.dx.dll';
 function ConsultarMDFE(vnummdfe,vnumloteconsulta,codempresa: integer;vendBanco: PChar;vusuario: Pchar): LongBool;stdcall;external 'hw.nfe.dx.dll';
 function EnviaEventoMDFE(nmdfe: integer; codempresa: integer;vendBanco: PChar;vusuario: Pchar): LongBool;stdcall;external 'hw.nfe.dx.dll';
 function ImprimirMDFE(vnummdfe: integer;codempresa: integer;vendBanco: PChar;vusuario: Pchar):LongBool;stdcall;external 'hw.nfe.dx.dll';
 function ImprimirEventoMDFE(vnmdfe: integer;codempresa: integer;vendBanco: PChar;vusuario: Pchar):LongBool;stdcall;external 'hw.nfe.dx.dll';
 function EnviarEmailMDFE(vnmdfe: integer;codempresa,vtpop: integer;vendBanco: PChar;vusuario: Pchar):LongBool;stdcall;external 'hw.nfe.dx.dll';
 function hw_LerXMLNFe(AListParams: WideString): WideString; stdcall; external 'hw.nfe.dx.dll';
 function EnviarEmailNFSe(vendBanco: WideString;codempresa: integer;vusuario: WideString; vos: integer; var AEnviarEmail, AEnviarBoleto, AImprimir: Boolean): LongBool; stdcall;external 'hw.nfe.dx.dll';
// vtpop = 2 Email MDFe vtpop = 3 Email do Evento Anexado ao MDFe

  function EnviaOSNFSe_Silent(vendBanco: WideString;codempresa: integer;vusuario: WideString; vos: integer; var AEnviarEmail, AEnviarBoleto, AImprimir: Boolean): LongBool; stdcall; external 'hw.nfe.dx.dll';



  //NFe v4.00
  function nfe_autorizar(Acod_nf: array of Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_imprimir(Acod_nf: array of Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_email(Acod_nf: array of Integer; AemailUnico, AcomEventos, AcomPDF, AcomBol: Boolean; Aemail, Aanexos: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_consultar(Acod_nf: array of Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_inutilizacao_enviar(Aseqid: Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_inutilizacao_imprimir(Aseqid: Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_inutilizacao_email(Aseqid: array of Integer; Aemail, Aanexos: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_evento_enviar(Acod_nf, Alote: Integer; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_evento_imprimir(Acod_nf, Alote: Integer; Aprint, AsavePDF: Boolean; ApathPDF: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_evento_email(Acod_nf, Alote: Integer; Aemail, Aanexos: WideString; Acod_empresa: Longint; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
   function dfe_dados_certificado(cod_empresa: Longint; dbName, modelo: WideString; var Aerros: WideString): WideString; stdcall; external 'hw.nfe.dx.dll';
  function nfe_converter_em_contingencia(CodigoNF: Integer; EmpresaId: Integer; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';
  function nfe_resolver_pendencia_sefaz(CodigoNF: Integer; EmpresaId: Integer; AdbName: WideString; var Aerros: WideString): Boolean; stdcall; external 'hw.nfe.dx.dll';

  // FAZNFe
  function PrintDanfe(xml, pathPDF, paramValues: PWideChar): Integer; stdcall; external 'faznfe.print.dll';
  function GetLastError(var resp: PWideChar; var BufferSize: Integer ): Boolean; stdcall; external 'faznfe.print.dll';

  // Sinc Dados Fiscais
  procedure FiscalSincDadosComandarAtualizacao(); stdcall; external 'hw.nfe.dx.dll';
  procedure FiscalSincDadosResolverAtualizacao(); stdcall; external 'hw.nfe.dx.dll';

  //DPS/NFSe
  function NFSeListaRegimesEspeciaisTributacao(const EmpresaId: Integer): WideString; stdcall; external 'hw.nfe.dx.dll';
  function NFSeCallFeatures( const Input: DFeDLLCallFeatureInput ): Integer; stdcall; external 'hw.nfe.dx.dll';

var
  frmTestes_DFe: TfrmTestes_DFe;

implementation

uses
  uFuncHwNFE, strutils, registry, hw_win_utils, hw_utils, DFeDLLAdapterUnit, ITokenDecryptorUnit, ITokenEncryptorUnit;

var
  GProgressForm: TfrmTestes_DFe;


procedure ProgressCallback(Percent: Integer); stdcall;
begin
  if Assigned(GProgressForm) then
    GProgressForm.DownloadProgress(Percent);
end;
procedure MessageCallback(Msg: WideString); stdcall;
begin
  if Assigned(GProgressForm) then
    GProgressForm.DownloadLog(string(Msg));
end;

{$R *.dfm}

procedure TfrmTestes_DFe.BitBtn10Click(Sender: TObject);
begin
  EnviaOSNFSe('127.0.0.1:D:\Hw\bases\hw\Hwauto.gdb',1,'HW',11026);
end;

procedure TfrmTestes_DFe.BitBtn11Click(Sender: TObject);
begin
  EnviaOSNFSe('127.0.0.1:D:\Hw\bases\luzbh\Hwauto.fdb', StrToInt(Edit1.Text),'HW',17173);
end;

procedure TfrmTestes_DFe.BitBtn12Click(Sender: TObject);
begin
  VisualizaNFSe('127.0.0.1:d:\Hw\Bases\luzbh\Hwauto.fdb',StrToInt(Edit1.Text),'HW');
end;

procedure TfrmTestes_DFe.BitBtn13Click(Sender: TObject);
var
 vos: string;
begin
  if (InputQuery('Enviar OS NFSe', 'N. OS', vos)) then
    EnviaOSNFSe('127.0.0.1:D:\Hw\bases\luzbh\Hwauto.fdb', StrToInt(Edit1.Text),'HW',strtoint(vos));
end;

procedure TfrmTestes_DFe.BitBtn14Click(Sender: TObject);
var
  dpsId, pdfSalvar: string;
  features: DFeDLLFeatureSet;
begin
  dpsId := 'B12E07D1-875F-4994-986C-921A1B1C09F4';
  if not InputQuery('Id DPS', 'Informe o ID do DPS', dpsId) then
    Exit;

  pdfSalvar := GetFileNameRandom('', 'pdf');

  features := [ dftEmitir ];

  if ckSalvarNFSeTo.Checked then
  begin
    if not InputQuery('Salvar PDF', 'Arquivo', pdfSalvar) then
      Exit;

    features := features + [ dftSalvarPDF ];
  end
  else if ckImprimirNFSeTo.Checked then
    features := features + [ dftImprimir ];

  DFeDLLAdapter.CallFeaturesNFSe( DFeDLLAdapter.InputNFSe(
    dpsId, 1, False, features, pdfSalvar, ''
  ));
end;

procedure TfrmTestes_DFe.BitBtn15Click(Sender: TObject);
begin
  edLogNFSe.Lines.Text := NFSeListaRegimesEspeciaisTributacao(1);
end;

procedure TfrmTestes_DFe.BitBtn16Click(Sender: TObject);
begin
  SetupSessionDLL();
end;

procedure TfrmTestes_DFe.BitBtn17Click(Sender: TObject);
begin
  NFDestinadas('127.0.0.1:D:\Hw\bases\motomol\hwauto.fdb',
    1,
    'HW',
    '0',
    '0',
    1, 2, '23180')
end;

procedure TfrmTestes_DFe.BitBtn18Click(Sender: TObject);
var
 vos: string;
 AEnvEmail, AEnvBolet, AImprimir, AResult: Boolean;
begin
  vos := '18187';
  Label1.Caption := vos;

  AEnvEmail := ckEnvEmail.Checked;
  AEnvBolet := ckEnvBolet.Checked;
  AImprimir := ckImprimir.Checked;

  if (InputQuery('Enviar OS NFSe', 'N. OS', vos)) then
  begin
    Label1.Caption := vos;
    AResult := EnviaOSNFSe_Silent('127.0.0.1:D:\Hw\bases\hw\Hwauto.gdb',1,'HW',strtoint(vos), AEnvEmail, AEnvBolet, AImprimir);
    Label1.Caption := vos + IfThen( AResult, ' OK', ' ERRO');
  end;
end;

procedure TfrmTestes_DFe.BitBtn19Click(Sender: TObject);
var
  AnumNota: Array of Integer;
  Astr, Astr2: string;
  Anum, Alote: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
begin
  Astr := edNumNota.Text;
  Anum := 0;
  for Astr2 in Astr.Split([' ', ',', ';']) do
    if TryStrToInt(Astr2, Anum)  then
      Break;

  if (Anum > 0) and (TryStrToInt(edLote.Text, Alote))  then
  else
    Exit;

  Aretorno := nfe_evento_enviar(Anum, Alote, spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.BitBtn1Click(Sender: TObject);
var
 vnf: string;
begin
//VisualizaNFe('N','127.0.0.1:c:\clientes\motomol\Hwauto.gdb',1,'4.0');
EnviarNFeHW('N','127.0.0.1:D:\Hw\Bases\precoce\Hwauto.fdb', 1, '4.0', 272, 'NOTAFISCAL','1','1','HW');
//if (InputQuery('Enviar NF', 'N. NF', vnf)) then
//  EnviarNFeHW('N','127.0.0.1:D:\Hw\Bases\producao\Hwauto.fdb', 1, '4.0', strtoint(vnf), 'NOTAFISCAL','1','20','HW');
//  EnviarNFeHW('N','192.168.254.5:C:\BasesAuto\design\Hwauto.fdb', 1, '4.0', strtoint(vnf), 'NOTAFISCAL','1','1','HW');
//  EnviarNFeHW('N','192.168.254.5:C:\BasesAuto\producao\Hwauto.fdb', 1, '4.0', strtoint(vnf), 'NOTAFISCAL','1','20','HW');
//  EnviarNFeHW('N','192.168.254.11:d:\clientes\exemplo\novo\Hwauto.fdb',1,'4.0',strtoint(vnf),'NOTAFISCAL','1','2','HW');
//  EnviarNFeHW('N','192.168.1.100:/bases/Hwauto.fdb',1,'4.0',strtoint(vnf),'NOTAFISCAL','1','3','HW');
//EnviarNFeHW('N','192.168.254.11:d:\clientes\exemplo\Hwauto.fdb',1,'4.0',18390,'NOTAFISCAL','3','2','HW');
//EnviarNFeHW('N','127.0.0.1:d:\clientes\motomol\Hwauto.fdb',1,'4.0',18234,'NF_VENDA','1','2');
//EnviarNFeHW('N','linux:/bases/Hwauto.gdb',1,'4.0',495,'OUTRAS_NF','1','3');
end;

procedure TfrmTestes_DFe.BitBtn20Click(Sender: TObject);
var
  AnumNota: Array of Integer;
  Astr, Astr2, Apath: string;
  Anum: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
begin
  Astr := edNumNota.Text;
  for Astr2 in Astr.Split([' ', ',', ';']) do
    if TryStrToInt(Astr2, Anum)  then
    begin
      SetLength(AnumNota, Length(AnumNota) + 1);
      AnumNota[High(AnumNota)] := Anum;
    end;

  Apath := '';
  if ckPDF.Checked then
  begin
    FileOpenDialog1.DefaultFolder := RegEditR('FileOpenDialog1.DefaultFolder', FileOpenDialog1.DefaultFolder);
    if not FileOpenDialog1.Execute then
      Exit;
    RegEditW('FileOpenDialog1.DefaultFolder', FileOpenDialog1.FileName);
    Apath := FileOpenDialog1.FileName;
  end;

  Aretorno := nfe_imprimir(AnumNota, ckPrint.Checked, ckPDF.Checked, Apath,
                            spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.BitBtn21Click(Sender: TObject);
var
  Astr, Astr2, Apath: string;
  AnumNota, Alote: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
begin
  Astr := edNumNota.Text;
  AnumNota := 0;
  for Astr2 in Astr.Split([' ', ',', ';']) do
    if TryStrToInt(Astr2, AnumNota)  then
      Break;

  if (AnumNota > 0) and (TryStrToInt(edLote.Text, Alote))  then
  else
    Exit;

  Apath := '';
  if ckPDF.Checked then
  begin
    FileOpenDialog1.DefaultFolder := RegEditR('FileOpenDialog1.DefaultFolder', FileOpenDialog1.DefaultFolder);
    if not FileOpenDialog1.Execute then
      Exit;
    RegEditW('FileOpenDialog1.DefaultFolder', FileOpenDialog1.FileName);
    Apath := FileOpenDialog1.FileName;
  end;

  Aretorno := nfe_evento_imprimir(AnumNota, Alote, ckPrint.Checked, ckPDF.Checked, Apath,
                                  spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.BitBtn22Click(Sender: TObject);
var
  Aseqid: Integer;
  Astr: string;
  Aretorno: Boolean;
  Aerros: TStringList;
  AstrRetorno: WideString;
begin

  if not TryStrToInt(edSeqidInut.Text, Aseqid)  then
    Exit;

  Aretorno := nfe_inutilizacao_enviar(Aseqid, spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.BitBtn23Click(Sender: TObject);
var
  Astr, Astr2, Apath: string;
  Aseqid: Integer;
  Aretorno: Boolean;
  Aerros : TStringList;
  AstrRetorno: WideString;
begin
   if not TryStrToInt(edSeqidInut.Text, Aseqid)  then
      Exit;

  Apath := '';
  if ckPDF.Checked then
  begin
    FileOpenDialog1.DefaultFolder := RegEditR('FileOpenDialog1.DefaultFolder', FileOpenDialog1.DefaultFolder);
    if not FileOpenDialog1.Execute then
      Exit;
    RegEditW('FileOpenDialog1.DefaultFolder', FileOpenDialog1.FileName);
    Apath := FileOpenDialog1.FileName;
  end;

  Aretorno := nfe_inutilizacao_imprimir(Aseqid, ckPrint.Checked, ckPDF.Checked, Apath,
                                        spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.BitBtn24Click(Sender: TObject);
var
  AnumNota: Array of Integer;
  Astr, Astr2: string;
  Anum: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
begin
  Astr := edNumNota.Text;
  for Astr2 in Astr.Split([' ', ',', ';']) do
    if TryStrToInt(Astr2, Anum)  then
    begin
      SetLength(AnumNota, Length(AnumNota) + 1);
      AnumNota[High(AnumNota)] := Anum;
    end;

  Aretorno := nfe_email(AnumNota, false, true, ckPDF.Checked, ckBol.Checked, 'joaopedrogv@gmail.com', '', spedCodEmp.Value, cbBancos.Text, AstrRetorno);
//  Aretorno := nfe_email(AnumNota, False, true, ckPDF.Checked, ckBol.Checked, '', spedCodEmp.Value, cbBancos.Text, AstrRetorno);
//  Aretorno := nfe_email(AnumNota, True, true, ckPDF.Checked, ckBol.Checked, '', '', spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.BitBtn25Click(Sender: TObject);
var
  AnumNota: Array of Integer;
  Astr, Astr2: string;
  Anum, Alote: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
begin
  Astr := edNumNota.Text;
  Anum := 0;
  for Astr2 in Astr.Split([' ', ',', ';']) do
    if TryStrToInt(Astr2, Anum)  then
      Break;

  if (Anum > 0) and (TryStrToInt(edLote.Text, Alote))  then
  else
    Exit;

//  Aretorno := nfe_evento_email(Anum, Alote, 'joaopedrogv@gmail.com', '', spedCodEmp.Value, cbBancos.Text, AstrRetorno);
  Aretorno := nfe_evento_email(Anum, Alote, '', '', spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.BitBtn26Click(Sender: TObject);
var
  Aseqid: Array of Integer;
  Astr, Astr2: string;
  Anum: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
  Aanexos: string;
begin
  Astr := edSeqidInut.Text;
  for Astr2 in Astr.Split([' ', ',', ';']) do
    if TryStrToInt(Astr2, Anum)  then
    begin
      SetLength(Aseqid, Length(Aseqid) + 1);
      Aseqid[High(Aseqid)] := Anum;
    end;

  Aanexos := 'D:\Hw\Projeto_Fiscal40\Ativos\fonte\notafiscal_inut_class.pas' + sLineBreak +
             'D:\Hw\Projeto_Fiscal40\Ativos\fonte\notafiscal_item_adi_class.pas' + ',' +
             'D:\Hw\Projeto_Fiscal40\Ativos\fonte\libeay32.dcu' + ';' +
             'D:\Downloads\DOCsXLSs\prod_boa_praca.xlsx' + sLineBreak;

  Aretorno := nfe_inutilizacao_email(Aseqid, 'joaopedrogv@gmail.com;joaopedro@hwsistemas.com.br', Aanexos, spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.BitBtn27Click(Sender: TObject);
var
  AnumNota: Array of Integer;
  Astr, Astr2: string;
  Anum: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
begin
  Astr := edNumNota.Text;
  for Astr2 in Astr.Split([' ', ',', ';']) do
    if TryStrToInt(Astr2, Anum)  then
    begin
      SetLength(AnumNota, Length(AnumNota) + 1);
      AnumNota[High(AnumNota)] := Anum;
    end;

  Aretorno := nfe_consultar(AnumNota, spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.BitBtn28Click(Sender: TObject);
var
  AListParams: TStringList;
  Aretorno: WideString;
begin
  if not OpenDialog1.Execute then
    Exit;

  AListParams := TStringList.Create;
  try
    AListParams.Clear;
    AListParams.Add('ASisAuto=True');
    AListParams.Add('ASisVeic=True');
    AListParams.Add('AUsarCorFabDenatran=True');
    AListParams.Add('ACodEmpresa=1');
    AListParams.Add('ACodUsuario=1');
    AListParams.Add('ACodNF=1935');
    AListParams.Add('AUsuario=HW');
    AListParams.Add('ANivel=10');
    AListParams.Add('ACNPJ=03530705000109');
    AListParams.Add('AUFDest=MG');
    AListParams.Add('AFileName=' + OpenDialog1.FileName);
    AListParams.Add('ADabaseName=joaopedro-pc:D:\Hw\bases\producao\Hwauto.fdb');
    AListParams.Add('ABuscaCodNoProduto=False');
    AListParams.Add('ADigitosProd=5');
    AListParams.Add('AUsarCodigoSequencialProduto=S');
    AListParams.Add('ACadProdAberto=N');
    AListParams.Add('ANatureza=E');
    AListParams.Add('CNPJsEntrada=');
    AListParams.Add('CNPJsCadastroProduto=');

    ARetorno := hw_LerXMLNFe(AListParams.Text);
    if ARetorno <> 'OK' then
      ShowMessage(ARetorno);
  finally
    FreeAndNil(AListParams);
  end;
end;

procedure TfrmTestes_DFe.BitBtn29Click(Sender: TObject);
var
  AListParams: TStringList;
  Aretorno: WideString;
begin
  if not OpenDialog1.Execute then
    Exit;

  AListParams := TStringList.Create;
  try
    AListParams.Clear;
    AListParams.Add('ASisAuto=True');
    AListParams.Add('ASisVeic=True');
    AListParams.Add('AUsarCorFabDenatran=True');
    AListParams.Add('ACodEmpresa=1');
    AListParams.Add('ACodUsuario=1');
    AListParams.Add('ACodNF=24088');
    AListParams.Add('ACNPJ=03530705000109');
    AListParams.Add('AFileName=' + OpenDialog1.FileName);
    AListParams.Add('ADabaseName=127.0.0.1:D:\Hw\bases\livraria jp\Hwauto.fdb');
    AListParams.Add('ABuscaCodNoProduto=False');

    ARetorno := hw_LerXMLNFe(AListParams.Text);
    if ARetorno <> 'OK' then
      ShowMessage(ARetorno);
  finally
    FreeAndNil(AListParams);
  end;
end;

procedure TfrmTestes_DFe.BitBtn2Click(Sender: TObject);
var
 vchaveNF: string;
 vnf: string;
begin
 if (InputQuery('Cancelar NF', 'N. NF', vnf)) then
  EnviarNFeHW('N','127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb',1,'4.0',strtoint(vnf),'NOTAFISCAL','3','20','HW');
{   OpenDialog1.Title := 'Selecione a NFE';
   OpenDialog1.DefaultExt := '*-nfe.XML';
   OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
//   OpenDialog1.InitialDir := edtPathLogs.Text;
   if OpenDialog1.Execute then
   vChaveNF:=extractfilename(opendialog1.filename);
//   ConfiguracoesDLL;
//   verificarStatusWeb;
   ACBrNFe1.NotasFiscais.Clear;
//      try
//       StrToInt('A');
   ACBrNFe1.NotasFiscais.clear;
   ACBrNFe1.NotasFiscais.LoadFromFile(vChaveNF);// Para este caso
                                                // Serão enviados a pasta e o nome do arquivo
   try
    ACBrNFe1.NotasFiscais.Valida;
   except
   end;
//           CopyFile(Pchar(ACBrNFe1.Configuracoes.Geral.PathSalvar+'\'+
//            vAux),
//            Pchar(vcaminho + '\Validado\'+vAux), true);
   ACBrNFe1.NotasFiscais.clear;

//   ExecutarDLL('Validar', pchar(vChaveNF),'',vresposta,'1','NF_VENDA','1','NORMAL','Autorizada');
 }
end;

procedure TfrmTestes_DFe.BitBtn30Click(Sender: TObject);
var
  AListParams: TStringList;
  Aretorno: WideString;
begin
  if not OpenDialog1.Execute then
    Exit;

  AListParams := TStringList.Create;
  try
    AListParams.Clear;
    AListParams.Add('ASisAuto=True');
    AListParams.Add('ASisVeic=True');
    AListParams.Add('AUsarCorFabDenatran=True');
    AListParams.Add('ACodEmpresa=1');
    AListParams.Add('ACodUsuario=1');
    AListParams.Add('ACodNF=6243');
    AListParams.Add('ACNPJ=20604526000198');
    AListParams.Add('AFileName=' + OpenDialog1.FileName);
    AListParams.Add('ADabaseName=127.0.0.1:D:\Hw\bases\predileta\Hwauto.fdb');
    AListParams.Add('ABuscaCodNoProduto=False');

    ARetorno := hw_LerXMLNFe(AListParams.Text);
    if ARetorno <> 'OK' then
      ShowMessage(ARetorno);
  finally
    FreeAndNil(AListParams);
  end;
end;

procedure TfrmTestes_DFe.BitBtn31Click(Sender: TObject);
begin
  VisualizaNFSe('192.168.254.50:e:\bases\Hwauto.gdb',1,'HW');
end;

procedure TfrmTestes_DFe.BitBtn32Click(Sender: TObject);
var
  db: WideString;
begin
  db := edBancoConf.Text;

  VisualizaNFSe(db, edEmpConf.Value, 'HW');
end;

procedure TfrmTestes_DFe.BitBtn33Click(Sender: TObject);
var
  vos: string;
begin
 if (InputQuery('Enviar OS NFSe', 'N. OS', vos)) then
   EnviaOSNFSe('127.0.0.1:D:\Hw\bases\amazon\Hwauto.fdb',1,'HW',strtoint(vos));
end;

procedure TfrmTestes_DFe.BitBtn34Click(Sender: TObject);
begin
  EnviaOSNFSe('127.0.0.1:D:\Hw\bases\amazon\Hwauto.fdb',1,'HW', 2);
end;

procedure TfrmTestes_DFe.BitBtn35Click(Sender: TObject);
var
  resp : PWideChar;
begin
  OpenDialog1.Title := 'Escolher arquivo XML';

  if OpenDialog1.Execute then
  begin
    var xml := TStringList.Create;
    xml.LoadFromFile(OpenDialog1.FileName);


    var bfize := 1024;
    resp :=PWideChar(''.PadLeft(bfize, ' '));

    if PrintDanfe(PWideChar(xml.Text), PWideChar(edFazNFEPathPdf.Text), PWideChar('')) <> 1 then
    begin
      if GetLastError(resp, bfize) then
        ShowMessage(string(resp));

    end;
  end;

end;

procedure TfrmTestes_DFe.BitBtn36Click(Sender: TObject);
begin
  VisualizaNFSe(WideString(edBancoNFSeX.Text), edEmpresaNFSeX.Value, 'HW');
end;

procedure TfrmTestes_DFe.BitBtn37Click(Sender: TObject);
var
  valores: TStrings;
  erros, retorno: WideString;
begin
  retorno := dfe_dados_certificado(spedCodEmp.Value, cbBancos.Text, OnlyNumber(TBitBtn(Sender).Caption), erros);

  valores := NewStringList(retorno, ';');

  for var str in valores do
    memoNFe400.Lines.Add(str);
end;

procedure TfrmTestes_DFe.BitBtn39Click(Sender: TObject);
var
  db: WideString;
begin
  db := edBancoConf.Text;

  var envEmail := false;
  var impBol := false;
  var imprimir := True;

  try
    var foi := EnviarEmailNFSe(db, edEmpConf.Value, 'HW', 2430, envEmail, impBol, imprimir);

    edLogNFSeConfig.Lines.Add(IfThen(foi, 'Retorno True', 'Retorno False'));
    edLogNFSeConfig.Lines.Add(IfThen(imprimir, 'Var Imprimir True', 'Var Imprimir False'));

  except on E: Exception do
    begin
      edLogNFSeConfig.Lines.Add('-- Erro: ' + e.Message);
      edLogNFSeConfig.Lines.Add('');
    end;
  end;
end;

procedure TfrmTestes_DFe.BitBtn3Click(Sender: TObject);
var
 vuf,vchave,vserie: string;
begin
 if (InputQuery('UF', 'Entre com a UF', vuf)) then
 begin
   if (InputQuery('Chave NFe', 'Entre com a Chave', vchave)) then
     if (InputQuery('Serie Nfe', 'Entre com o N. Série', vserie)) then
       ConsultaSefazOr(Pchar(vuf),Pchar(vchave),pchar(vserie),'HW',1,'127.0.0.1:d:\Hwauto.fdb');
       //'192.168.254.11:d:\clientes\exemplo\Hwauto.fdb');
 end;

end;

procedure TfrmTestes_DFe.BitBtn40Click(Sender: TObject);
type
  TMessageCallback = procedure(const AMessage: WideString); stdcall;
  TProgressCallback = procedure(Percent: Integer); stdcall;
  //TProcUpdate = function (var BufferError: PAnsiChar; var BufferSize: Integer; callBack: TProgressCallback): Boolean; stdcall;
  TProcUpdate = function (
    MessageCallBack: TMessageCallback;
    ProgressCallBack: TProgressCallback
  ): Boolean; stdcall;
var
  dllHandle: THandle;
  procUpdate: TProcUpdate;
  buff: string;
  buffSize, newBuffSize: Integer;
  pbuff: PAnsiChar;
begin
  dllHandle := LoadLibrary(PWideChar('hw.nfe.dx.dll'));

  if dllHandle = 0 then
  begin
    ShowAtencao('Módulo de atualização não pode ser carregado. Contacte o suporte técnico');
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  Self.Enabled := False;
  memoGrid9999.Lines.Clear;
  lbProgressDownload.Caption := '';
  lbProgressDownload.Visible := True;
  try
    @procUpdate := GetProcAddress(dllHandle, PChar('FiscalSincDadosFiscais'));

    GProgressForm := Self;
    try
      procUpdate( @MessageCallback, @ProgressCallback );
    finally
      GProgressForm := nil;
    end;
  finally
    FreeLibrary( dllHandle );
    lbProgressDownload.Visible := False;
    Self.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmTestes_DFe.BitBtn41Click(Sender: TObject);
begin
  var netClient := TNetHTTPClient.Create(nil);
      var fileDownload := TFileStream.Create('C:\Users\joaop\AppData\Roaming\Hw Sistemas\Temp\fiscal-rtc.zip', fmCreate);
  try

    netClient.Get('http://hwsistemas.homelinux.com/hwupdate/fiscal-rtc.zip', fileDownload);

  finally
    fileDownload.Free;
    netClient.Free;
  end;
end;

procedure TfrmTestes_DFe.BitBtn42Click(Sender: TObject);
var
  AListParams: TStrings;
  Aretorno: WideString;
begin
  if not OpenDialog1.Execute then
    Exit;

  AListParams := TStringList.Create;
  try
    AListParams.LoadFromFile( OpenDialog1.FileName );

    ARetorno := hw_LerXMLNFe(AListParams.Text);

    if ARetorno <> 'OK' then
      ShowMessage(ARetorno);

  finally
    FreeAndNil(AListParams);
  end;
end;

procedure TfrmTestes_DFe.BitBtn43Click(Sender: TObject);
begin
  SetupSessionDLL();
  FiscalSincDadosComandarAtualizacao();
end;

procedure TfrmTestes_DFe.BitBtn44Click(Sender: TObject);
var
  dpsId, pdfSalvar: string;
  features: DFeDLLFeatureSet;
begin
  dpsId := '5682EFD5-CA16-4A4D-8D55-F40803139EA1';
  if not InputQuery('Id DPS', 'Informe o ID do DPS', dpsId) then
    Exit;

  pdfSalvar := GetFileNameRandom('', 'pdf');

  features := [ dftConsultar ];

  if ckSalvarNFSeTo.Checked then
  begin
    if not InputQuery('Salvar PDF', 'Arquivo', pdfSalvar) then
      Exit;

    features := features + [ dftSalvarPDF ];
  end
  else if ckImprimirNFSeTo.Checked then
    features := features + [ dftImprimir ];

  DFeDLLAdapter.CallFeaturesNFSe( DFeDLLAdapter.InputNFSe(
    dpsId, 1, False, features, pdfSalvar, ''
  ));
end;

procedure TfrmTestes_DFe.BitBtn45Click(Sender: TObject);
var
  NFSeId: string;
begin
  NFSeId := '5682EFD5-CA16-4A4D-8D55-F40803139EA1';
  if not InputQuery('Id NFSe', 'Informe o ID da NFSe', NFSeId) then
    Exit;

  DFeDLLAdapter.CallFeaturesNFSe( DFeDLLAdapter.InputNFSe(
    NFSeId, 1, False, [dftImprimir], '', ''
  ));
end;

procedure TfrmTestes_DFe.BitBtn46Click(Sender: TObject);
var
  NFSeId: string;
begin
  NFSeId := '5682EFD5-CA16-4A4D-8D55-F40803139EA1';
  if not InputQuery('Id NFSe', 'Informe o ID da NFSe', NFSeId) then
    Exit;

  DFeDLLAdapter.CallFeaturesNFSe( DFeDLLAdapter.InputNFSe(
    NFSeId, 1, False, [dftCancelar], '', ''
  ));
end;

procedure TfrmTestes_DFe.BitBtn47Click(Sender: TObject);
begin
  SetupSessionDLL();
  FiscalSincDadosResolverAtualizacao();
end;

procedure TfrmTestes_DFe.BitBtn48Click(Sender: TObject);
var
  Service: ITokenEncryptor;
  W: WideString;
begin
  Service := TDFeDLLCypher.Create(edSecret.Text);
  W := Service.Encrypt(edInput.Text);
  edOutput.Text := W;
end;

procedure TfrmTestes_DFe.BitBtn49Click(Sender: TObject);
var
  Service: ITokenDecryptor;
  W: WideString;
begin
  Service := TDFeDLLCypher.Create(edSecret.Text);
  W := Service.Decrypt(edInput.Text);
  edOutput.Text := W;
end;

procedure TfrmTestes_DFe.BitBtn4Click(Sender: TObject);
var
 vChave: string;
 vresp: string;
begin
// if (InputQuery('Chave NFe', 'Entre com a Chave', vchave)) then
//  vresp:=ConsultaRFB(Pchar(vchave),'HW');
 ShowMessage(vresp);
end;

procedure TfrmTestes_DFe.BitBtn5Click(Sender: TObject);
begin
  VerificaSCAN(1,'192.168.254.11:d:\clientes\exemplo\Hwauto.fdb');
end;

procedure TfrmTestes_DFe.BitBtn6Click(Sender: TObject);
var
 vnf: string;
begin
if (InputQuery('Enviar NF', 'N. NF', vnf)) then
  ConsNFEDLL('127.0.0.1:d:\clientes\exemplo\novo\Hwauto.fdb',1,'4.0',strtoint(vnf),'NOTAFISCAL','2','HW');
end;

procedure TfrmTestes_DFe.BitBtn7Click(Sender: TObject);
begin
  VisualizaNFSe('127.0.0.1:D:\Hw\bases\hw\Hwauto.gdb',1,'HW');

//                         joaopedro-pc:D:\Hw\bases\ang\ipa\Hwauto.fdb

//  VisualizaNFSe('127.0.0.1:d:\clientes\hw\Hwauto.gdb',1,'HW');
  //VisualizaNFSe('127.0.0.1:d:\clientes\exemplo\novo\Hwauto.fdb',1,'HW');
// VisualizaNFSe('127.0.0.1:d:\clientes\hw\Hwauto.gdb',1,'HW');
//  VisualizaNFSe('192.168.254.50:e:\bases\Hwauto.gdb',1,'HW');
//  VisualizaNFSe('127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb',1,'HW');
//    VisualizaNFSe('127.0.0.1:D:\clientes\TurboKit\dados13052014\Hwauto.fdb',1,'HW');
//   VisualizaNFSe('127.0.0.1:D:\clientes\luz\BH\Hw.fdb',2,'HW');
  //VisualizaNFSe('192.168.254.10:C:\Basesauto\Luz BH\Hw.fdb',2,'HW');
// VisualizaNFSe('linux:/bases/Hwauto.fdb',1,'HW');
end;

procedure TfrmTestes_DFe.BitBtn8Click(Sender: TObject);
var
 vos: string;
begin
  vos := '11026';
 if (InputQuery('Enviar OS NFSe', 'N. OS', vos)) then
   EnviaOSNFSe('127.0.0.1:D:\Hw\bases\hw\Hwauto.gdb',1,'HW',strtoint(vos));
//   EnviaOSNFSe('127.0.0.1:C:\basesauto\hw\Hwauto.gdb',1,'HW',strtoint(vos));


//   EnviaOSNFSe('127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb',1,'HW',strtoint(vos));
//  EnviaOSNFSe('192.168.254.50:e:\bases\Hwauto.gdb',1,'HW',strtoint(vos));
//  EnviaOSNFSe('127.0.0.1:D:\clientes\TurboKit\dados13052014\Hwauto.fdb',1,'HW',strtoint(vos));
//   EnviaOSNFSe('127.0.0.1:d:\clientes\hw\Hwauto.gdb',1,'HW',strtoint(vos));
//   EnviaOSNFSe('127.0.0.1:D:\clientes\luz\BH\Hw.fdb',2,'HW',strtoint(vos));
end;

procedure TfrmTestes_DFe.BitBtn9Click(Sender: TObject);
var
 vchave: string;
begin
 if (InputQuery('Chave NFe', 'Entre com a Chave', vchave)) then
  if not NFDownload('127.0.0.1:d:\Hwauto.fdb',1,'HW',pchar(vchave)) then
     ShowMessage('PROBLEMAS NO DOWNLOAD')
  else
   ShowMessage('OK');

end;

procedure TfrmTestes_DFe.btNFe4_EnviarClick(Sender: TObject);
var
  AnumNota: Array of Integer;
  Astr, Astr2: string;
  Anum: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
begin
  Astr := edNumNota.Text;
  for Astr2 in Astr.Split([' ', ',', ';']) do
    if TryStrToInt(Astr2, Anum)  then
    begin
      SetLength(AnumNota, Length(AnumNota) + 1);
      AnumNota[High(AnumNota)] := Anum;
    end;

  Aretorno := nfe_autorizar(AnumNota, spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.btnNFeConverterNFeEmContingenciaClick(Sender: TObject);
var
  AnumNota: Integer;
  Astr: string;
  Anum: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
begin
  SetupSessionDLL();

  Astr := edNumNota.Text;
  if not TryStrToInt(Astr, AnumNota)  then
    exit;

  Aretorno := nfe_converter_em_contingencia(AnumNota, spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.btnNFeResolverContigenciaClick(Sender: TObject);
var
  AnumNota: Integer;
  Astr: string;
  Anum: Integer;
  Aretorno: Boolean;
  AstrRetorno: WideString;
begin
  SetupSessionDLL();

  Astr := edNumNota.Text;
  if not TryStrToInt(Astr, AnumNota)  then
    exit;

  Aretorno := nfe_resolver_pendencia_sefaz(AnumNota, spedCodEmp.Value, cbBancos.Text, AstrRetorno);

  processarRetornoNFe400(Aretorno, AstrRetorno);
end;

procedure TfrmTestes_DFe.Button10Click(Sender: TObject);
var
 vnummdfe: string;
begin
 if (InputQuery('Impressão  MDFe:', 'N. MDFe:', vnummdfe)) then
  ImprimirMDFE(strtoint(vnummdfe),1,'127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb','HW');
end;

procedure TfrmTestes_DFe.Button11Click(Sender: TObject);
var
 vnummdfe: string;
begin
 if (InputQuery('Impressão de Evento  MDFe:', 'N. MDFe:', vnummdfe)) then
  ImprimirEventoMDFE(strtoint(vnummdfe),1,'127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb','HW');
end;

procedure TfrmTestes_DFe.Button12Click(Sender: TObject);
var
 vnummdfe: string;
begin
 if (InputQuery('Impressão  MDFe:', 'N. MDFe:', vnummdfe)) then
 EnviarEmailMDFE(strtoint(vnummdfe),1,2,'127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb','HW');
end;

procedure TfrmTestes_DFe.Button13Click(Sender: TObject);
var
 vnummdfe: string;
begin
 if (InputQuery('Impressão  MDFe:', 'N. MDFe:', vnummdfe)) then
 EnviarEmailMDFE(strtoint(vnummdfe),1,3,'127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb','HW');
end;

procedure TfrmTestes_DFe.Button14Click(Sender: TObject);
var
 indNFe,indemi,indultnsu: string;
 nsuespec: string;
begin
 (*veja NT 2012/002 pág. 11 para identificar os valores possíveis
Indicador de NF-e consultada:
0=Todas as NF-e;
1=Somente as NF-e que ainda não tiveram manifestação do destinatário
  (Desconhecimento da operação, Operação não Realizada ou Confirmação da Operação);
2=Idem anterior, incluindo as NF-e que também não tiveram a Ciência da Operação.*)
 indNFe := '0';
 IndEmi := '0';
 indultnsu := '1';
 if not(InputQuery('WebServices Distribuição DFe', 'Indicador de utilização ultimo NSU:', indultnsu)) then
  exit;
 nsuespec:='0'; // Valor zerado não busca um nsu especifico
 if not(InputQuery('WebServices Distribuição DFe ', 'NSU Específico: ', nsuespec)) then
  exit;
// O PARAMETRO indultnsu IGUAL A 1 O SISTEMA PEGA O ULTNSU QUE ESTÁ NA EMPRESA CASO CONTRARIO O ULT
//NSU SERÁ 0
// NFDestinadas('127.0.0.1:D:\Hw\bases\motomol\hwauto.fdb',1,
 NFDestinadas(IniConf.ReadStr('Banco', 'HW'),
   1,
   'HW',
   pchar(indNFe),
   pchar(indemi),
   strtoint(indultnsu), 2 {1 consulta; 2 download}, nsuespec);
end;

procedure TfrmTestes_DFe.Button1Click(Sender: TObject);
begin
//  VisualizaNFe('N','127.0.0.1:C:\basesauto\hw\Hwauto.gdb',1,'4.0','HW');
  VisualizaNFe('N','127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb',1,'4.0','HW');

//  VisualizaNFe('N','127.0.0.1:D:\Hw\bases\precoce\Hwauto.fdb',1,'4.0','HW');
//  VisualizaNFe('N','linux:/bases/Hwauto.fdb',1,'4.0','HW');
end;

procedure TfrmTestes_DFe.Button2Click(Sender: TObject);
var
 vChave: string;
begin
 if (InputQuery('Chave NFe', 'Entre com a Chave', vchave)) then
  if not ValidaChaveNFe(pchar(vchave)) then
     ShowMessage('CHAVE INVÁLIDA')
  else
   ShowMessage('OK');
end;


procedure TfrmTestes_DFe.Button3Click(Sender: TObject);
var
 vlote: string;
begin
 if (InputQuery('Enviar Evento', 'N. LOTE', vlote)) then
 // QUANDO O ULTIMO PARAMETRO FOR 4 É PARA ENVIO DE ENVENTO DE MANIFESTACAO            
//  EnviarEvento('127.0.0.1:C:\BasesAuto\fabvelas\Hwauto.fdb',1,strtoint(vlote),'HW','1');
  EnviarEvento('127.0.0.1:D:\HW\bases\producao\Hwauto.fdb',1,strtoint(vlote),'HW','1');
 //   EnviarEvento('192.168.254.5:D:\Hw\bases\producao\Hwauto.fdb',1,strtoint(vlote),'HW','1');
 //  EnviarEvento('127.0.0.1:d:\clientes\exemplo\Hwauto.fdb',1,strtoint(vlote),'HW','1');
end;

procedure TfrmTestes_DFe.Button4Click(Sender: TObject);
var
 vlote: string;
begin
 if (InputQuery('Imprimir Evento', 'N. LOTE', vlote)) then
  EnviarEvento('127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb',1,strtoint(vlote),'HW','2');
end;

procedure TfrmTestes_DFe.Button5Click(Sender: TObject);
var
 vlote: string;
begin
 if (InputQuery('Enviar Evento por Email', 'N. LOTE', vlote)) then
  EnviarEvento('127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb',1,strtoint(vlote),'HW','3');
end;

procedure TfrmTestes_DFe.Button6Click(Sender: TObject);
var
 indNFe,indemi,indultnsu: string;
begin
 (*veja NT 2012/002 pág. 11 para identificar os valores possíveis
Indicador de NF-e consultada:
0=Todas as NF-e;
1=Somente as NF-e que ainda não tiveram manifestação do destinatário
  (Desconhecimento da operação, Operação não Realizada ou Confirmação da Operação);
2=Idem anterior, incluindo as NF-e que também não tiveram a Ciência da Operação.*)
 indNFe := '0';
 if not(InputQuery('WebServices Consulta NFe Destinadas', 'Indicador de NF-e consultada', indNFe)) then
   exit;

 (*veja NT 2012/002 pág. 11 para identificar os valores possíveis
 Indicador do Emissor da NF-e:
 0=Todos os Emitentes / Remetentes;
 1=Somente as NF-e emitidas por emissores / remetentes que não tenham a mesma
  raiz do CNPJ do destinatário (para excluir as notas fiscais de transferência
  entre filiais).*)
 IndEmi := '0';
 if not(InputQuery('WebServices Consulta NFe Destinadas', 'Indicador do Emissor da NF-e', IndEmi)) then
  exit;

 indultnsu := '1'; // 2 vai pedir para o método trazer todas as NFes dos ultimos 15 dias. 1 será
                   // para trazer as nfes a partir do último nsu REGISTRADO NA EMPRESA.
 if not(InputQuery('WebServices Consulta NFe Destinadas', 'Indicador do Emissor da NF-e', indultnsu)) then
  exit;
// O ÚLTIMO PARAMETRO IGUAL A 1 O SISTEMA PEGA O ULTNSU QUE ESTÁ NA EMPRESA CASO CONTRARIO O ULT
//NSU SERÁ 0
 NFDestinadas(IniConf.ReadStr('Banco', 'HW'),
   1,
   'HW',
   pchar(indNFe),
   pchar(indemi),
   strtoint(indultnsu), 1 {1 consulta; 2 download}, '23180');

end;

procedure TfrmTestes_DFe.Button7Click(Sender: TObject);
var
 vnumlote: string;
begin
 if (InputQuery('Enviar MDFe:', 'N. Lote', vnumlote)) then
 EnviarMDFE(2,1,strtoint(vnumlote),'127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb','HW');
end;

procedure TfrmTestes_DFe.Button8Click(Sender: TObject);
var
 vnumloteconsulta: string;
begin
 if (InputQuery('Enviar MDFe:', 'N. Lote Consulta:', vnumloteconsulta)) then
  ConsultarMDFE(2,strtoint(vnumloteconsulta),1,'127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb','HW');
end;

procedure TfrmTestes_DFe.Button9Click(Sender: TObject);
var
 vnummdfe: string;
begin
 if (InputQuery('Evento  MDFe:', 'N. MDFe:', vnummdfe)) then
  EnviaEventoMDFE(strtoint(vnummdfe),1,'127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb','HW');

end;

procedure TfrmTestes_DFe.cbBancosExit(Sender: TObject);
begin
  RegEditW(cbBancos);
end;

procedure TfrmTestes_DFe.DownloadLog(const AMessage: string);
begin
  memoGrid9999.Lines.Add(AMessage);
end;

procedure TfrmTestes_DFe.DownloadProgress(Percent: Integer);
begin
  lbProgressDownload.Caption :=  IntToStr(Percent) + '%';
  Application.ProcessMessages;
end;

procedure TfrmTestes_DFe.edBancoConfChange(Sender: TObject);
begin
  RegistroWin.Write(Self.Name, edBancoConf.Name, string(edBancoConf.Text));
end;

procedure TfrmTestes_DFe.edLoteExit(Sender: TObject);
begin
  RegEditW(edLote);
end;

procedure TfrmTestes_DFe.edNumNotaExit(Sender: TObject);
begin
  RegEditW(edNumNota);
end;

procedure TfrmTestes_DFe.edSeqidInutExit(Sender: TObject);
begin
  RegEditW(edSeqidInut);
end;

procedure TfrmTestes_DFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//destroyDLLNfe;

  RegistroWin.Write(Self.ClassName, 'edEmpresaNFSeX', edEmpresaNFSeX.Value);
end;

procedure TfrmTestes_DFe.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 closeallAuditoria;
end;

procedure TfrmTestes_DFe.FormCreate(Sender: TObject);
begin
  carregaDLLNfe;
end;

procedure TfrmTestes_DFe.FormShow(Sender: TObject);
var
  Alist: TStrings;
  I: Integer;
begin
  edBancoConf.Items.Clear;

  Alist := TStringList.Create;
  try
    if FileExists(ExtractFilePath(Application.ExeName) + 'Config.ini') then
    begin
      Alist.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Config.ini');
      for I := 0 to Alist.Count - 1 do
        if Copy(Alist[I], 1, 3) = 'HW=' then
        begin
          cbBancos.Items.Add(Copy(Alist[I], 4, Length(Alist[I])));
          edBancoConf.Items.Add(Copy(Alist[I], 4, Length(Alist[I])));
        end;
    end
    else
      cbBancos.Items.Add('127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb');

    if cbBancos.Items.Count > 0 then
      cbBancos.ItemIndex := 0;

  finally
    FreeAndNil(Alist);
  end;
  edNumNota.Text := RegEditR(edNumNota.Name, edNumNota.Text);
  edLote.Text := RegEditR(edLote.Name, edLote.Text);
  edSeqidInut.Text := RegEditR(edSeqidInut.Name, edSeqidInut.Text);
  cbBancos.Text  := RegEditR(cbBancos.Name, cbBancos.Text);
  edFazNFEPathPdf.Text := ExtractFilePath(Application.ExeName);


  edEmpresaNFSeX.Value := Integer(RegistroWin.Read(Self.ClassName, 'edEmpresaNFSeX', Integer(1)));
  edBancoNFSeX.Text := IniConf.ReadStr('Banco', 'HW');

  var db := string(RegistroWin.Read(Self.Name, edBancoConf.Name, ''));

  if not db.IsEmpty then
    edBancoConf.Text := db;
end;

procedure TfrmTestes_DFe.processarRetornoNFe400(Aretorno: Boolean; AstrRetorno: WideString);
var
  Alist: TStringList;
  Astr: string;
begin
  Alist := TStringList.Create;
  try
    Alist.Text := AstrRetorno;

    memoNFe400.Lines.Clear;
    memoNFe400.Lines.Add('Retorno: ' + IfThen(Aretorno, 'True', 'False'));
    for Astr in Alist do
      memoNFe400.Lines.Add(Astr);
  finally
    FreeAndNil(Alist);
  end;
end;

function TfrmTestes_DFe.RegEditR(AName, ADefault: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  Result := ADefault;
  try
    vTemp := ADefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(AName) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadString(AName);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmTestes_DFe.RegEditW(AComboBox: TComboBox);
begin
  RegEditW(AComboBox.Name, AComboBox.Text);
end;

procedure TfrmTestes_DFe.SetupSessionDLL;
begin
  DFeDLLAdapter.SetupSession(
    spedCodEmp.Value,
    cbBancos.Text,
    '03530705000109',
    1,
    'HW',
    '',
    False,
    0
  );
end;

procedure TfrmTestes_DFe.RegEditW(AMaskEdit: TMaskEdit);
begin
  RegEditW(AMaskEdit.Name, AMaskEdit.Text);
end;

procedure TfrmTestes_DFe.RegEditW(AName, AValue: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(AName, AValue);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

end.
