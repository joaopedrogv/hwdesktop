unit TransferenciaCreditoModelUnit;

interface

uses
  TipoComunsUnit;

type
  TransferenciaCreditoModel = record
  private
    FInstance: RecordInstance;
    FVCBS: Currency;
    FVIBS: Currency;
  public
    class function NullInstance(): TransferenciaCreditoModel; static;

    class function Create(
      VIBS: Currency;
      VCBS: Currency
    ): TransferenciaCreditoModel; static;

    function IsNull(): Boolean;

    property VIBS: Currency read FVIBS;
    property VCBS: Currency read FVCBS;
  end;

implementation

uses
  NumberServiceUnit;

{ TransferenciaCreditoModel }

class function TransferenciaCreditoModel.Create(VIBS: Currency;
  VCBS: Currency): TransferenciaCreditoModel;
begin
  Result.FInstance := riNotNull;
  Result.FVIBS := NumberService.RoundHalfUpTo2(VIBS);
  Result.FVCBS := NumberService.RoundHalfUpTo2(VCBS);
end;

function TransferenciaCreditoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function TransferenciaCreditoModel.NullInstance: TransferenciaCreditoModel;
begin
  Result := TransferenciaCreditoModel.Create( 0, 0 );
  Result.FInstance := riNull;
end;

end.