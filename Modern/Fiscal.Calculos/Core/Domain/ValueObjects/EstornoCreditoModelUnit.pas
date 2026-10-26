unit EstornoCreditoModelUnit;

interface

uses
  TipoComunsUnit;

type
  EstornoCreditoModel = record
  private
    FInstance: RecordInstance;
    FVCbsEstCred: Currency;
    FVIbsEstCred: Currency;
  public
    class function NullInstance(): EstornoCreditoModel; static;

    class function Create(
      VIbsEstCred: Currency;
      VCbsEstCred: Currency
    ): EstornoCreditoModel; static;

    function IsNull(): Boolean;

    property VIbsEstCred: Currency read FVIbsEstCred;
    property VCbsEstCred: Currency read FVCbsEstCred;

  end;

implementation

{ EstornoCreditoModel }

class function EstornoCreditoModel.Create(
  VIbsEstCred, VCbsEstCred: Currency
): EstornoCreditoModel;
begin
  Result.FInstance := riNotNull;
  Result.FVCbsEstCred := VCbsEstCred;
  Result.FVIbsEstCred := VIbsEstCred;
end;

function EstornoCreditoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function EstornoCreditoModel.NullInstance: EstornoCreditoModel;
begin
  Result := EstornoCreditoModel.Create( 0, 0 );
  Result.FInstance := riNull;
end;

end.

