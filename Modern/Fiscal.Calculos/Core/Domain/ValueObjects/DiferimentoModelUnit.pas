unit DiferimentoModelUnit;

interface

uses
  TipoComunsUnit;

type
  DiferimentoModel = record
  private
    FInstance: RecordInstance;
    FVDif: Currency;
    FPDif: Currency;
  public
    class function NullInstance(): DiferimentoModel; static;

    class function Create(
      PDif: Currency;
      VDif: Currency
    ): DiferimentoModel; static;

    function IsNull(): Boolean;

    property PDif: Currency read FPDif;
    property VDif: Currency read FVDif;
  end;

implementation

uses
  NumberServiceUnit;

{ DiferimentoModel }

class function DiferimentoModel.Create(PDif: Currency;
  VDif: Currency): DiferimentoModel;
begin
  Result.FInstance := riNotNull;
  Result.FPDif := NumberService.RoundHalfUpTo4(PDif);
  Result.FVDif := NumberService.RoundHalfUpTo2(VDif);
end;

function DiferimentoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function DiferimentoModel.NullInstance: DiferimentoModel;
begin
  Result := DiferimentoModel.Create( 0, 0 );
  Result.FInstance := riNull;
end;

end.
