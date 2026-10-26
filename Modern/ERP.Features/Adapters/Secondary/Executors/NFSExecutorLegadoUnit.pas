unit NFSExecutorLegadoUnit;

interface

uses
  INFSExecutorUnit, ISessionContextUnit, TipoComunsUnit;

type
  NFSExecutorLegado = class(TInterfacedObject, INFSExecutor)
  private
    FSession: ISessionContext;
  public
    constructor Create(Session: ISessionContext);
    function PodeExecutar(const Context: NFSExecutorContext): Boolean;
    function Emitir(const Context: NFSExecutorContext): INFSExecutorResult;
    function CriarAnexosEmail(const Context: NFSExecutorContext): TArrayString;
  end;

implementation

uses
  SysUtils,
  LegacyDFeDLLAdapterUnit, StringServiceUnit;

function NFSExecutorLegado.PodeExecutar(const Context: NFSExecutorContext): Boolean;
var
  existeRPS, existeNFSeId: Boolean;
  I: Integer;
begin
  existeRPS := False;
  for I := 0 to High(Context.NumerosRPS) do
    if Context.NumerosRPS[I] > 0 then
    begin
      existeRPS := True;
      Break;
    end;

  existeNFSeId := False;
  for I := 0 to High(Context.NFSeIDs) do
    if Trim(Context.NFSeIDs[I]) <> '' then
    begin
      existeNFSeId := True;
      Break;
    end;

  if existeRPS and not existeNFSeId then
    Result := True

  else
    Result := not Context.EmissaLegadaDesativada;
end;

constructor NFSExecutorLegado.Create(Session: ISessionContext);
begin
  FSession := Session;
end;

function NFSExecutorLegado.Emitir(const Context: NFSExecutorContext): INFSExecutorResult;
begin
  Result.MensagemErro := '';
  try
    // Chama método legado da DLL
    LegacyDFeDLLAdapter.EmiteNFSe(
      FSession.DatabaseName, FSession.UsuarioLogin, FSession.EmpresaId, Context.NumeroOS, Context.SendSilent
    );
  except on E: Exception do
    Result.MensagemErro := E.Message;
  end;
end;

function NFSExecutorLegado.CriarAnexosEmail(const Context: NFSExecutorContext): TArrayString;
var
  resultLegacy: string;
begin
  resultLegacy := LegacyDFeDLLAdapter.GeraPdfNFSe(
    FSession.DatabaseName, FSession.UsuarioLogin, FSession.EmpresaId, Context.NumeroOS, Context.SendSilent
  );

  Result := StringService.Split( [';'], resultLegacy );
end;

end.
