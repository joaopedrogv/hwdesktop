unit ResultadoGrupoMonofasiaUnit;

interface

uses
  ResultadoGrupoEtapaMonofasiaUnit,
  ResultadoGrupoDiferimentoMonofasiaUnit, TipoComunsUnit;

type
  ResultadoGrupoMonofasia = record
  private
    FInstance: RecordInstance;
    FTributoMonofasico: ResultadoGrupoEtapaMonofasia;
    FTributoSujeitoRetencao: ResultadoGrupoEtapaMonofasia;
    FTributoRetido: ResultadoGrupoEtapaMonofasia;
    FTributoDiferido: ResultadoGrupoDiferimentoMonofasia;
  public
    class function NullInstance(): ResultadoGrupoMonofasia; static;

    class function Create(
      const TributoMonofasico: ResultadoGrupoEtapaMonofasia;
      const TributoSujeitoRetencao: ResultadoGrupoEtapaMonofasia;
      const TributoRetido: ResultadoGrupoEtapaMonofasia;
      const TributoDiferido: ResultadoGrupoDiferimentoMonofasia
    ): ResultadoGrupoMonofasia; static;

    function IsNull(): Boolean;

    property TributoMonofasico: ResultadoGrupoEtapaMonofasia read FTributoMonofasico;
    property TributoSujeitoRetencao: ResultadoGrupoEtapaMonofasia read FTributoSujeitoRetencao;
    property TributoRetido: ResultadoGrupoEtapaMonofasia read FTributoRetido;
    property TributoDiferido: ResultadoGrupoDiferimentoMonofasia read FTributoDiferido;
  end;

implementation

{ ResultadoGrupoMonofasia }

class function ResultadoGrupoMonofasia.Create(
  const TributoMonofasico: ResultadoGrupoEtapaMonofasia;
  const TributoSujeitoRetencao: ResultadoGrupoEtapaMonofasia;
  const TributoRetido: ResultadoGrupoEtapaMonofasia;
  const TributoDiferido: ResultadoGrupoDiferimentoMonofasia
): ResultadoGrupoMonofasia;
begin
  Result.FTributoMonofasico := TributoMonofasico;
  Result.FTributoSujeitoRetencao := TributoSujeitoRetencao;
  Result.FTributoRetido := TributoRetido;
  Result.FTributoDiferido := TributoDiferido;
  Result.FInstance := riNotNull;
end;

function ResultadoGrupoMonofasia.IsNull(): Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function ResultadoGrupoMonofasia.NullInstance: ResultadoGrupoMonofasia;
begin
  Result.FInstance := riNull;
end;

end.
