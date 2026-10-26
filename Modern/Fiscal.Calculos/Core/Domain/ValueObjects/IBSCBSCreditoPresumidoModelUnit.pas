unit IBSCBSCreditoPresumidoModelUnit;

interface

uses
  TipoComunsUnit;

type
  IBSCBSCreditoPresumidoModel = record
  private
    FInstance: RecordInstance;
    FPCredPres: Currency;
    FVCredPres: Currency;
    FVCredPresCondSus: Currency;
  public
    class function NullInstance(): IBSCBSCreditoPresumidoModel; static;

    class function Create(
      PCredPres: Currency;
      VCredPres: Currency;
      VCredPresCondSus: Currency
    ): IBSCBSCreditoPresumidoModel; static;

    function IsNull(): Boolean;

    property PCredPres: Currency read FPCredPres;
    property VCredPres: Currency read FVCredPres;
    property VCredPresCondSus: Currency read FVCredPresCondSus;
  end;

implementation

{ IBSCBSCreditoPresumidoModel }

class function IBSCBSCreditoPresumidoModel.Create(
  PCredPres: Currency;
  VCredPres: Currency;
  VCredPresCondSus: Currency
): IBSCBSCreditoPresumidoModel;
begin
  Result.FInstance := riNotNull;
  Result.FPCredPres := PCredPres;
  Result.FVCredPres := VCredPres;
  Result.FVCredPresCondSus := VCredPresCondSus;
end;

function IBSCBSCreditoPresumidoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function IBSCBSCreditoPresumidoModel.NullInstance: IBSCBSCreditoPresumidoModel;
begin
  Result := IBSCBSCreditoPresumidoModel.Create( 0, 0, 0 );
  Result.FInstance := riNull;
end;

end.
