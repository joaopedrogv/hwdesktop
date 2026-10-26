unit ConfigGlobalNF_RTC;

interface

type

  TConfigGlobalNF_RTC = record
  private
    FInicioVigencia: TDateTime;
    FSNOptanteRegimeRegular: Boolean;
  public
    class function Create(
      InicioVigencia: TDateTime;
      SNOptanteRegimeRegular: Boolean
    ): TConfigGlobalNF_RTC; static;

    function EmVigencia(const Regime: string): Boolean; overload;
    function EmVigencia(const CRT: Integer): Boolean; overload;

    property InicioVigencia: TDateTime read FInicioVigencia;
    property SNOptanteRegimeRegular: Boolean read FSNOptanteRegimeRegular;
  end;

implementation

uses
  SysUtils,
  StrUtils; 

{ TConfigGlobalNF_RTC }

class function TConfigGlobalNF_RTC.Create(InicioVigencia: TDateTime;
  SNOptanteRegimeRegular: Boolean): TConfigGlobalNF_RTC;
begin
  Result.FInicioVigencia := InicioVigencia;
  Result.FSNOptanteRegimeRegular := SNOptanteRegimeRegular;
end;

function TConfigGlobalNF_RTC.EmVigencia(const Regime: string): Boolean;
begin
  if ContainsText(Regime, 'SIMPLES') then // SIMPLES NACIONAL
    Result := (FInicioVigencia <= Date) and FSNOptanteRegimeRegular
  else
    Result := FInicioVigencia <= Date;    // REGIME NORMAL
end;

function TConfigGlobalNF_RTC.EmVigencia(const CRT: Integer): Boolean;
begin
  if CRT = 3 then // regime normal
    Result := FInicioVigencia <= Date
  else
    Result := (FInicioVigencia <= Date) and FSNOptanteRegimeRegular;
end;

end.
