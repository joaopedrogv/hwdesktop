unit SituacaoTributariaEtdUnit;

interface
          
uses
  TipoComunsUnit, DateAndTimeNullableUnit;

type
  SituacaoTributariaEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FCodigo: string;
    FDescricao: string;
    FInGrupoAjusteCompetencia: Boolean;
    FInGrupoReducao: Boolean;
    FInGrupoIbsCbs: Boolean;
    FInGrupoCreditoPresumidoIbsZfm: Boolean;
    FInGrupoTranferenciaCredito: Boolean;
    FInGrupoDiferimento: Boolean;
    FInGrupoIbsCbsMono: Boolean;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function NullInstance(): SituacaoTributariaEtd; static;
    class function Create(
      Id: Integer;
      const Codigo: string;
      const Descricao: string;
      InGrupoAjusteCompetencia: Boolean;
      InGrupoReducao: Boolean;
      InGrupoIbsCbs: Boolean;
      InGrupoCreditoPresumidoIbsZfm: Boolean;
      InGrupoTranferenciaCredito: Boolean;
      InGrupoDiferimento: Boolean;
      InGrupoIbsCbsMono: Boolean;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): SituacaoTributariaEtd; static;

    function Clone(): SituacaoTributariaEtd;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property Codigo: string read FCodigo;
    property Descricao: string read FDescricao;
    property InGrupoIbsCbs: Boolean read FInGrupoIbsCbs;
    property InGrupoIbsCbsMono: Boolean read FInGrupoIbsCbsMono;
    property InGrupoReducao: Boolean read FInGrupoReducao;
    property InGrupoDiferimento: Boolean read FInGrupoDiferimento;
    property InGrupoTranferenciaCredito: Boolean read FInGrupoTranferenciaCredito;
    property InGrupoCreditoPresumidoIbsZfm: Boolean read FInGrupoCreditoPresumidoIbsZfm;
    property InGrupoAjusteCompetencia: Boolean read FInGrupoAjusteCompetencia;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  SituacoesTributariasEtd = array of SituacaoTributariaEtd;

implementation

{ SituacaoTributariaEtd }

function SituacaoTributariaEtd.Clone: SituacaoTributariaEtd;
begin
  Result.FId := FId;
  Result.FCodigo := FCodigo;
  Result.FDescricao := FDescricao;
  Result.FInicioVigencia := FInicioVigencia;
  Result.FInGrupoAjusteCompetencia := FInGrupoAjusteCompetencia;
  Result.FInGrupoReducao := FInGrupoReducao;
  Result.FInGrupoIbsCbs := FInGrupoIbsCbs;
  Result.FInGrupoCreditoPresumidoIbsZfm := FInGrupoCreditoPresumidoIbsZfm;
  Result.FInGrupoTranferenciaCredito := FInGrupoTranferenciaCredito;
  Result.FInGrupoDiferimento := FInGrupoDiferimento;
  Result.FInGrupoIbsCbsMono := FInGrupoIbsCbsMono;
  Result.FFimVigencia := FFimVigencia;
  Result.FInstance := FInstance;
end;

class function SituacaoTributariaEtd.Create(
  Id: Integer;
  const Codigo: string;
  const Descricao: string;
  InGrupoAjusteCompetencia: Boolean;
  InGrupoReducao: Boolean;
  InGrupoIbsCbs: Boolean;
  InGrupoCreditoPresumidoIbsZfm: Boolean;
  InGrupoTranferenciaCredito: Boolean;
  InGrupoDiferimento: Boolean;
  InGrupoIbsCbsMono: Boolean;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): SituacaoTributariaEtd;
begin
  Result.FId := Id;
  Result.FCodigo := Codigo;
  Result.FDescricao := Descricao;
  Result.FInicioVigencia := InicioVigencia;
  Result.FInGrupoAjusteCompetencia := InGrupoAjusteCompetencia;
  Result.FInGrupoReducao := InGrupoReducao;
  Result.FInGrupoIbsCbs := InGrupoIbsCbs;
  Result.FInGrupoCreditoPresumidoIbsZfm := InGrupoCreditoPresumidoIbsZfm;
  Result.FInGrupoTranferenciaCredito := InGrupoTranferenciaCredito;
  Result.FInGrupoDiferimento := InGrupoDiferimento;
  Result.FInGrupoIbsCbsMono := InGrupoIbsCbsMono;
  Result.FFimVigencia := FimVigencia;
  Result.FInstance := riNotNull;
end;

function SituacaoTributariaEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function SituacaoTributariaEtd.NullInstance: SituacaoTributariaEtd;
begin
  Result.FInstance := riNull;
end;

end.
