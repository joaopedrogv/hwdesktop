unit LegacyDFeDLLAdapterUnit;

interface

type
  LegacyDFeDLLAdapter = class
  public
    class function EmiteNFSe(const DatabaseName, UsuarioLogin: string; EmpresaId, NumeroOS: Integer; Silent: Boolean): Boolean;
    class function GeraPdfNFSe(const DatabaseName, UsuarioLogin: string; EmpresaId, NumeroOS: Integer; Silent: Boolean): string;
    class function GeraArquivosNFe(CodigosNF: array of Integer; EmpresaId: Integer; ComPDF, ComEventos, ComBoletos: Boolean; const DatabaseName: string): string;
    class function GeraArquivosNFCe(CodigosNFCe: array of Integer; EmpresaId: Integer; ComPDF: Boolean): string;
    class procedure ShowModuloNFSe(DataBaseName: string; EmpresaId: Integer; UsuarioLogin: string);

    class function ResolverPendenciaNFeSefaz(CodigoNF, EmpresaId: Integer; const DatabaseName: string; var AErros: WideString): Boolean;
  end;

implementation

uses
  SysUtils, StrUtils;

  {$REGION 'Declaracoes'}
const
  DLL_NAME = 'hw.nfe.dx.dll';

  function EnviaOSNFSe(vendBanco: WideString; codempresa: integer; vusuario: WideString; vos: integer): longbool;
    stdcall; external DLL_NAME;
  function EnviaOSNFSe_Silent(vendBanco: WideString; codempresa: integer; vusuario: WideString; vos: integer;
    var AEnviarEmail, AEnviarBoleto, AImprimir: Boolean): LongBool; stdcall; external DLL_NAME;
  function GerarPdfNFSe(parametros: WideString): WideString; stdcall; external DLL_NAME;
  function VisualizaNFSe(vendBanco: WideString;codempresa: integer;vusuario: WideString): longbool;
    stdcall; external DLL_NAME;

  function nfe_anexos(Acod_nf: array of Integer; params: WideString): WideString; stdcall;
    external DLL_NAME;
  function nfce_anexos(Acod_nf: array of Integer; params: WideString): WideString; stdcall;
    external DLL_NAME;
  function nfe_resolver_pendencia_sefaz(CodigoNF: Integer; EmpresaId: Integer; AdbName: WideString; var Aerros: WideString): Boolean; stdcall;
    external DLL_NAME;
  {$ENDREGION}

{ LegacyDFeDLLAdapter }

class function LegacyDFeDLLAdapter.EmiteNFSe(
  const DatabaseName, UsuarioLogin: string; EmpresaId, NumeroOS: Integer; Silent: Boolean
): Boolean;
var
  SendMail, SendBoleto, Print: Boolean;
begin
  if not Silent then
    Result  := EnviaOSNFSe( DatabaseName, EmpresaId, UsuarioLogin, NumeroOS )
  else
  begin
    SendMail := False;
    SendBoleto := False;
    Print := False;
    Result  := EnviaOSNFSe_Silent( DatabaseName, EmpresaId, UsuarioLogin, NumeroOS, SendMail, SendBoleto, Print );
  end;
end;

class function LegacyDFeDLLAdapter.GeraArquivosNFCe(CodigosNFCe: array of Integer; EmpresaId: Integer; ComPDF: Boolean): string;
var
  resultDLL: WideString;
begin
  resultDLL := nfce_anexos( CodigosNFCe,
    Format('EmpresaId=%d;ComPDF=%s', [ EmpresaId, BoolToStr(ComPDF) ])
  );

  Result := resultDLL;

  if StartsText('ERRO|', Result) then
    raise Exception.Create( Copy(Result, 6, Length(Result)));
end;

class function LegacyDFeDLLAdapter.GeraArquivosNFe(CodigosNF: array of Integer; EmpresaId: Integer; ComPDF, ComEventos, ComBoletos: Boolean; const DatabaseName: string): string;
var
  resultDLL: WideString;
begin
  resultDLL := nfe_anexos( CodigosNF,
    Format('DatabaseName=%s;EmpresaId=%d;ComPDF=%s;ComEventos=%s;ComBoletos=%s',
    [ DatabaseName, EmpresaId, BoolToStr(ComPDF), BoolToStr(ComEventos), BoolToStr(ComBoletos) ])
  );

  Result := resultDLL;

  if StartsText('ERRO|', Result) then
    raise Exception.Create( Copy(Result, 6, Length(Result)));
end;

class function LegacyDFeDLLAdapter.GeraPdfNFSe(const DatabaseName, UsuarioLogin: string; EmpresaId, NumeroOS: Integer;
  Silent: Boolean): string;
var
  resultDLL: WideString;
begin
  resultDLL := GerarPdfNFSe(
    Format('databaseName=%s;codempresa=%d;usuario=%s;nped=%d', [ DatabaseName, EmpresaId, UsuarioLogin, NumeroOS ])
  );
  Result := resultDLL;
end;

class function LegacyDFeDLLAdapter.ResolverPendenciaNFeSefaz(
  CodigoNF, EmpresaId: Integer; const DatabaseName: string; var AErros: WideString
): Boolean;
begin
  Result := nfe_resolver_pendencia_sefaz(CodigoNF, EmpresaId, DatabaseName, AErros);
end;

class procedure LegacyDFeDLLAdapter.ShowModuloNFSe(DataBaseName: string; EmpresaId: Integer; UsuarioLogin: string);
begin
  VisualizaNFSe( DataBaseName, EmpresaId, UsuarioLogin );
end;

end.

