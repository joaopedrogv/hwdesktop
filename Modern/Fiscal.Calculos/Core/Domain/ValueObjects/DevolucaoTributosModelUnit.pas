unit DevolucaoTributosModelUnit;

interface

uses
  TipoComunsUnit;

type
  DevolucaoTributosModel = record
  private
    FInstance: RecordInstance;
    FVDevTrib: Currency;
  public
    class function NullInstance(): DevolucaoTributosModel; static;

    class function Create(
      VDevTrib: Currency
    ): DevolucaoTributosModel; static;

    function IsNull(): Boolean;

    property VDevTrib: Currency read FVDevTrib;
  end;

implementation

{ DevolucaoTributosModel }

class function DevolucaoTributosModel.Create(VDevTrib: Currency): DevolucaoTributosModel;
begin
  Result.FInstance := riNotNull;
  Result.FVDevTrib := VDevTrib;
end;

function DevolucaoTributosModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function DevolucaoTributosModel.NullInstance: DevolucaoTributosModel;
begin
  Result := DevolucaoTributosModel.Create( 0 );
  Result.FInstance := riNull;
end;

end.
