unit ReducaoAliquotaModelUnit;

interface

uses
  TipoComunsUnit;

type
  ReducaoAliquotaModel = record
  private
    FInstance: RecordInstance;
    FPAliqEfet: Currency;
    FPRedAliq: Currency;
  public
    class function NullInstance(): ReducaoAliquotaModel; static;

    class function Create(
      PRedAliq: Currency;
      PAliqEfet: Currency
    ): ReducaoAliquotaModel; static;

    function IsNull(): Boolean;

    property PRedAliq: Currency read FPRedAliq;
    property PAliqEfet: Currency read FPAliqEfet;
  end;

implementation

{ ReducaoAliquotaModel }

class function ReducaoAliquotaModel.Create(PRedAliq: Currency;
  PAliqEfet: Currency): ReducaoAliquotaModel;
begin
  Result.FInstance := riNotNull;
  Result.FPRedAliq := PRedAliq;
  Result.FPAliqEfet := PAliqEfet;
end;

function ReducaoAliquotaModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function ReducaoAliquotaModel.NullInstance: ReducaoAliquotaModel;
begin
  Result := ReducaoAliquotaModel.Create( 0, 0 );
  Result.FInstance := riNull;
end;

end.
