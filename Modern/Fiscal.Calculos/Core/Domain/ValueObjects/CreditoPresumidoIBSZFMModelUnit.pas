unit CreditoPresumidoIBSZFMModelUnit;

interface

uses
  TipoComunsUnit;

type
  CreditoPresumidoIBSZFMModel = record
  private
    FInstance: RecordInstance;
    FVCredPresIBSZFM: Currency;
    FTpCredPresIBSZFM: Integer;
  public
    class function NullInstance(): CreditoPresumidoIBSZFMModel; static;

    class function Create(
      TpCredPresIBSZFM: Integer;
      VCredPresIBSZFM: Currency
    ): CreditoPresumidoIBSZFMModel; static;

    function IsNull(): Boolean;

    //property CompetApur: string read FCompetApur; // Sem influencia em qualquer calculo
    property TpCredPresIBSZFM: Integer read FTpCredPresIBSZFM;
    property VCredPresIBSZFM: Currency read FVCredPresIBSZFM;
  end;

implementation

{ CreditoPresumidoIBSZFMModel }

class function CreditoPresumidoIBSZFMModel.Create(TpCredPresIBSZFM: Integer;
  VCredPresIBSZFM: Currency): CreditoPresumidoIBSZFMModel;
begin
  Result.FInstance := riNotNull;
  Result.FTpCredPresIBSZFM := TpCredPresIBSZFM;
  Result.FVCredPresIBSZFM := VCredPresIBSZFM;
end;

function CreditoPresumidoIBSZFMModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function CreditoPresumidoIBSZFMModel.NullInstance: CreditoPresumidoIBSZFMModel;
begin
  Result := CreditoPresumidoIBSZFMModel.Create( 0, 0 );
  Result.FInstance := riNull;
end;

end.