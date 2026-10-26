unit SincronizacaoCalculadoraLeaseUnit;

interface

uses
  TipoComunsUnit;

type
  /// <summary>
  ///   Lease de sincronizacao da calculadora. Record com NullInstance para
  ///   representar "sem lease" sem depender de nil.
  ///   Owner e o token da instancia (GUID) e NUNCA o bearer token da API.
  ///   Unidade 2006-compativel (sem marcador).
  /// </summary>
  SincronizacaoCalculadoraLease = record
  private
    FInstance: RecordInstance;
    FOwner: string;
    FExpiresAt: TDateTime;
  public
    class function NullInstance(): SincronizacaoCalculadoraLease; static;
    class function Create(
      const AOwner: string;
      const AExpiresAt: TDateTime
    ): SincronizacaoCalculadoraLease; static;

    function IsNull(): Boolean;

    property Owner: string read FOwner;
    property ExpiresAt: TDateTime read FExpiresAt;
  end;

implementation

{ SincronizacaoCalculadoraLease }

class function SincronizacaoCalculadoraLease.Create(
  const AOwner: string;
  const AExpiresAt: TDateTime
): SincronizacaoCalculadoraLease;
begin
  Result.FInstance := riNotNull;
  Result.FOwner := AOwner;
  Result.FExpiresAt := AExpiresAt;
end;

function SincronizacaoCalculadoraLease.IsNull(): Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function SincronizacaoCalculadoraLease.NullInstance(): SincronizacaoCalculadoraLease;
begin
  Result := SincronizacaoCalculadoraLease.Create('', 0);
  Result.FInstance := riNull;
end;

end.
