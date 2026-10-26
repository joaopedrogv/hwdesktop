unit AjusteCompetenciaModelUnit;

interface

uses
  TipoComunsUnit;

type
  AjusteCompetenciaModel = record
  private
    FInstance: RecordInstance;
    FCompetAput: string;
    FVCBS: Currency;
    FVIBS: Currency;
  public
    class function NullInstance(): AjusteCompetenciaModel; static;

    class function Create(
      const CompetAput: string;
      VIBS: Currency;
      VCBS: Currency
    ): AjusteCompetenciaModel; static;

    function IsNull(): Boolean;

    property CompetAput: string read FCompetAput;
    property VIBS: Currency read FVIBS;
    property VCBS: Currency read FVCBS;

  end;

implementation

{ AjusteCompetenciaModel }

class function AjusteCompetenciaModel.Create(
  const CompetAput: string;
  VIBS, VCBS: Currency
): AjusteCompetenciaModel;
begin
  Result.FInstance := riNotNull;
  Result.FCompetAput := CompetAput;
  Result.FVCBS := VCBS;
  Result.FVIBS := VIBS;
end;

function AjusteCompetenciaModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function AjusteCompetenciaModel.NullInstance: AjusteCompetenciaModel;
begin
  Result := AjusteCompetenciaModel.Create( '', 0, 0 );
  Result.FInstance := riNull;
end;

end.
