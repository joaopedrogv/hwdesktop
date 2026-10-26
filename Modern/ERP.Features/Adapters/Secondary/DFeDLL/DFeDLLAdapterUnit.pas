unit DFeDLLAdapterUnit;

interface

uses
  TipoComunsUnit, ResultadoOperacaoDFeUnit, DFeDLLHeader, ITokenDecryptorUnit, ITokenEncryptorUnit;

type
//  DFeDLLAdapterInput = record
//  private
//    NFSeId: WideString;
//    EmpresaId: Integer;
//    Silent: Boolean;
//    Features: Cardinal;
//    PdfFileName: WideString;
//    Email: WideString;
//  public
//  end;

  DFeDLLAdapter = class
  public
    class function ListarRegimesEspeciaisTributacaoNFSe(const EmpresaId: Integer): WideString;

    class function InputNFSe(
      const NFSeId: WideString;
      EmpresaId: Integer;
      Silent: Boolean;
      Features: DFeDLLFeatureSet;
      const PdfFileName: WideString = '';
      const Email: WideString = ''
    ): DFeDLLCallFeatureInput;

    class function InputLoteNFSe(
      const  NFSeIDs: WideString;
      EmpresaId: Integer;
      Silent: Boolean;
      const Emails: WideString
    ): NFSeCallEmitirLoteInput;

    class function InputEmailNFSe(
      const  NFSeIDs, Emails: WideString;
      EmpresaId: Integer;
      UnicoEmail, AnexarPDF, Silent: Boolean
    ): NFSeCallEnviarEmailInput;

    class function InputAnexosNFSe(
      const  NFSeIDs: WideString;
      EmpresaId: Integer;
      AnexarPDF, Silent: Boolean
    ): NFSeCallCriarAnexoslInput;

    class function CallFeaturesNFSe( const Input: DFeDLLCallFeatureInput ): ResultadoOperacaoDFe;
    class function CallEmitirLoteNFSe( const Input: NFSeCallEmitirLoteInput ): ResultadoOperacaoDFeArray;
    class function CallEnviarEmail( const Input: NFSeCallEnviarEmailInput ): Integer;
    class function CallCriarAnexos( const Input: NFSeCallCriarAnexoslInput ): TArrayString;

    class procedure SetupSession(
      EmpresaId: Integer; const EmpresaNome, EmpresaCNPJ: WideString;
      UsuarioId: Integer; const UsuarioLogin, UsuarioEmail: WideString;
      CaixaUnificado: Boolean; UnificadoraId: Integer
    );
    class procedure ResolverAtualizacaoDadosFiscais();
    class procedure ComandarAtualizacaoDadosFiscais();

    class procedure SincronizarConsultasSQL(Silent: Boolean = False);
    class function ExisteAtualizacaoConsultasSQL(Silent: Boolean = False): Boolean;
  end;
  
  TDFeDLLCypher = class(TInterfacedObject, ITokenEncryptor, ITokenDecryptor)
  private
    FSecret: WideString;
  public
    constructor Create(const ASecret: string);
    function Decrypt(const AEncryptedToken: string): string;
    function Encrypt(const AToken: string): string;
  end;

implementation

uses
  SysUtils, StringServiceUnit;

  {$REGION 'Declaracoes'}
const
  DLL_NAME = 'hw.nfe.dx.dll';
  // Setup Session
  procedure SetupSessionDLL(
    EmpresaId: Integer; const EmpresaNome, EmpresaCNPJ: WideString;
    UsuarioId: Integer; const UsuarioLogin, UsuarioEmail: WideString;
    CaixaUnificado: Boolean; UnificadoraId: Integer
  ); stdcall; external DLL_NAME;
  // NFSe
  function NFSeListaRegimesEspeciaisTributacao(const EmpresaId: Integer): WideString; stdcall; external DLL_NAME;
  function NFSeCallFeatures( const Input: DFeDLLCallFeatureInput ): Integer; stdcall; external DLL_NAME;
  function NFSeCallEmitirLote( const Input: NFSeCallEmitirLoteInput ): WideString; stdcall; external DLL_NAME;
  function NFSeCallEnviarEmail( const Input: NFSeCallEnviarEmailInput ): Integer; stdcall; external DLL_NAME;
  function NFSeCallCriarAnexos( const Input: NFSeCallCriarAnexoslInput ): WideString; stdcall; external DLL_NAME;
  // Dados Fiscais
  procedure FiscalSincDadosResolverAtualizacao(); stdcall; external DLL_NAME;
  procedure FiscalSincDadosComandarAtualizacao(); stdcall; external DLL_NAME;
  // Consultas SQL
  procedure ErpSincConsultasSQL(Silent: Boolean); stdcall; external DLL_NAME;
  function ErpSincConsultasExisteAtualizacao(Silent: Boolean): Boolean; stdcall; external DLL_NAME;
  // Criptografia
  function DecryptTextTwofish(const ASecret, AEncryptedText: WideString): WideString; stdcall; external DLL_NAME;
  function EncryptTextTwofish(const ASecret, AText: WideString): WideString; stdcall; external DLL_NAME;
  {$ENDREGION}

{ DFeDLLAdapter }

class function DFeDLLAdapter.ListarRegimesEspeciaisTributacaoNFSe(const EmpresaId: Integer): WideString;
var
  S: string;
begin
  S := NFSeListaRegimesEspeciaisTributacao( EmpresaId );
  Result := S;
end;   

class procedure DFeDLLAdapter.ResolverAtualizacaoDadosFiscais;
begin
  FiscalSincDadosResolverAtualizacao();
end;

class procedure DFeDLLAdapter.ComandarAtualizacaoDadosFiscais;
begin
  FiscalSincDadosComandarAtualizacao();
end;

class procedure DFeDLLAdapter.SetupSession(
  EmpresaId: Integer; const EmpresaNome, EmpresaCNPJ: WideString;
  UsuarioId: Integer; const UsuarioLogin, UsuarioEmail: WideString;
  CaixaUnificado: Boolean; UnificadoraId: Integer
);
begin
  SetupSessionDLL(
    EmpresaId, EmpresaNome, EmpresaCNPJ, UsuarioId, UsuarioLogin, UsuarioEmail, CaixaUnificado, UnificadoraId
  );
end;

class procedure DFeDLLAdapter.SincronizarConsultasSQL(Silent: Boolean);
begin
  ErpSincConsultasSQL(Silent);
end;

class function DFeDLLAdapter.CallCriarAnexos(const Input: NFSeCallCriarAnexoslInput): TArrayString;
var
  dllInput: NFSeCallCriarAnexoslInput;
  ResultDLL: WideString;
begin
  FillChar(dllInput, SizeOf(dllInput), 0); // Zera o record

  dllInput.NFSeIDs    := Input.NFSeIDs;
  dllInput.EmpresaId  := Input.EmpresaId;
  dllInput.AnexarPDF  := Input.AnexarPDF;
  dllInput.Silent     := Input.Silent;

  ResultDLL := NFSeCallCriarAnexos( dllInput );

  Result := StringService.Split([';'], ResultDLL);
end;

class function DFeDLLAdapter.CallEmitirLoteNFSe(const Input: NFSeCallEmitirLoteInput): ResultadoOperacaoDFeArray;
var
  dllInput: NFSeCallEmitirLoteInput;
  ResultDLL: WideString;
  ResultCodes: TArrayString;
  I, iResult: Integer;
begin
  FillChar(dllInput, SizeOf(dllInput), 0); // Zera o record

  dllInput.NFSeIDs   := Input.NFSeIDs;
  dllInput.EmpresaId := Input.EmpresaId;
  dllInput.Silent    := Input.Silent;
  dllInput.Emails    := Input.Emails;

  ResultDLL := NFSeCallEmitirLote( dllInput );

  ResultCodes := StringService.Split( [';'], ResultDLL );

  SetLength(Result, Length(ResultCodes));
  for I := Low(ResultCodes) to High(ResultCodes) do
    Result[I] := ResultadoOperacaoDFe( StrToIntDef( ResultCodes[I], Ord(rodFalhaNaoTratada) ));
end;

class function DFeDLLAdapter.CallEnviarEmail(const Input: NFSeCallEnviarEmailInput): Integer;
var
  dllInput: NFSeCallEnviarEmailInput;
  ResultDLL: WideString;
  ResultCodes: TArrayString;
  I, iResult: Integer;
begin
  FillChar(dllInput, SizeOf(dllInput), 0); // Zera o record

  dllInput.NFSeIDs    := Input.NFSeIDs;
  dllInput.Emails     := Input.Emails;
  dllInput.EmpresaId  := Input.EmpresaId;
  dllInput.UnicoEmail := Input.UnicoEmail;
  dllInput.AnexarPDF  := Input.AnexarPDF;
  dllInput.Silent     := Input.Silent;

  Result := NFSeCallEnviarEmail( dllInput );
end;

class function DFeDLLAdapter.CallFeaturesNFSe(const Input: DFeDLLCallFeatureInput): ResultadoOperacaoDFe;
var
  dllInput: DFeDLLCallFeatureInput;
  ResultCode: Integer;
begin
  FillChar(dllInput, SizeOf(dllInput), 0); // Zera o record

  dllInput.NFSeId      := Input.NFSeId;
  dllInput.EmpresaId   := Input.EmpresaId;
  dllInput.Silent      := Input.Silent;
  dllInput.Features    := Input.Features;
  dllInput.PdfFileName := Input.PdfFileName;
  dllInput.Email       := Input.Email;

  Result := ResultadoOperacaoDFe( NFSeCallFeatures( dllInput ));
end;

class function DFeDLLAdapter.ExisteAtualizacaoConsultasSQL(Silent: Boolean): Boolean;
begin
  Result := ErpSincConsultasExisteAtualizacao(Silent); 
end;

class function DFeDLLAdapter.InputEmailNFSe(
  const  NFSeIDs, Emails: WideString;
  EmpresaId: Integer;
  UnicoEmail, AnexarPDF, Silent: Boolean
): NFSeCallEnviarEmailInput;
begin
  Result.NFSeIDs    := NFSeIDs;
  Result.Emails     := Emails;
  Result.EmpresaId  := EmpresaId;
  Result.UnicoEmail := UnicoEmail;
  Result.AnexarPDF  := AnexarPDF;
  Result.Silent     := Silent;
end;

class function DFeDLLAdapter.InputAnexosNFSe(
  const  NFSeIDs: WideString;
  EmpresaId: Integer;
  AnexarPDF, Silent: Boolean
): NFSeCallCriarAnexoslInput;
begin
  Result.NFSeIDs    := NFSeIDs;
  Result.EmpresaId  := EmpresaId;
  Result.AnexarPDF  := AnexarPDF;
  Result.Silent     := Silent;
end;

class function DFeDLLAdapter.InputLoteNFSe(
  const NFSeIDs: WideString; EmpresaId: Integer; Silent: Boolean;
  const Emails: WideString
): NFSeCallEmitirLoteInput;
begin
  Result.NFSeIDs   := NFSeIDs;
  Result.EmpresaId := EmpresaId;
  Result.Silent    := Silent;
  Result.Emails    := Emails;
end;

class function DFeDLLAdapter.InputNFSe(const NFSeId: WideString; EmpresaId: Integer; Silent: Boolean;
  Features: DFeDLLFeatureSet; const PdfFileName, Email: WideString): DFeDLLCallFeatureInput;
begin
  Result.NFSeId      := NFSeId;
  Result.EmpresaId   := EmpresaId;
  Result.Silent      := Silent;
  Result.Features    := FeaturesToCardinal( Features );
  Result.PdfFileName := PdfFileName;
  Result.Email       := Email;
end;

{ TDFeDLLCypher }

constructor TDFeDLLCypher.Create(const ASecret: string);
begin
  FSecret := ASecret;
end;

function TDFeDLLCypher.Decrypt(const AEncryptedToken: string): string;
var
  Input, Output: WideString;
begin
  Input := AEncryptedToken;
  Output := DecryptTextTwofish(FSecret, Input);
  Result := Output;
end;

function TDFeDLLCypher.Encrypt(const AToken: string): string;
var
  Input, Output: WideString;
begin
  Input := AToken;
  Output := EncryptTextTwofish(FSecret, Input);
  Result := Output;
end;

end.