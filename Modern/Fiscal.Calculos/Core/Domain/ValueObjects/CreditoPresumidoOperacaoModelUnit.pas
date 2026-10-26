unit CreditoPresumidoOperacaoModelUnit;

interface

uses
  TipoComunsUnit,
  IBSCBSCreditoPresumidoModelUnit;

type
  CreditoPresumidoOperacaoModel = record
  private
    FInstance: RecordInstance;
    FVBCCredPres: Currency;
    FCCredPres: Integer;
    FGIbsCredPres: IBSCBSCreditoPresumidoModel;
    FGCbsCredPres: IBSCBSCreditoPresumidoModel;
  public
    class function NullInstance(): CreditoPresumidoOperacaoModel; static;

    class function Create(
      AVBCCredPres: Currency;
      ACCredPres: Integer;
      const AGIbsCredPres: IBSCBSCreditoPresumidoModel;
      const AGCbsCredPres: IBSCBSCreditoPresumidoModel
    ): CreditoPresumidoOperacaoModel; static;

    function IsNull(): Boolean;

    property VBCCredPres: Currency read FVBCCredPres;
    property CCredPres: Integer read FCCredPres;
    property GIbsCredPres: IBSCBSCreditoPresumidoModel read FGIbsCredPres;
    property GCbsCredPres: IBSCBSCreditoPresumidoModel read FGCbsCredPres;
  end;

implementation

{ CreditoPresumidoOperacaoModel }

class function CreditoPresumidoOperacaoModel.Create(
  AVBCCredPres: Currency;
  ACCredPres: Integer;
  const AGIbsCredPres: IBSCBSCreditoPresumidoModel;
  const AGCbsCredPres: IBSCBSCreditoPresumidoModel
): CreditoPresumidoOperacaoModel;
begin
  Result.FInstance := riNotNull;
  Result.FVBCCredPres := AVBCCredPres;
  Result.FCCredPres := ACCredPres;
  Result.FGIbsCredPres := AGIbsCredPres;
  Result.FGCbsCredPres := AGCbsCredPres;
end;

function CreditoPresumidoOperacaoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function CreditoPresumidoOperacaoModel.NullInstance: CreditoPresumidoOperacaoModel;
begin
  Result := CreditoPresumidoOperacaoModel.Create( 0, 0,
    IBSCBSCreditoPresumidoModel.NullInstance(),
    IBSCBSCreditoPresumidoModel.NullInstance()
  );
  Result.FInstance := riNull;
end;

end.
