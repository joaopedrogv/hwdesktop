unit AliquotaAdRemModelUnit;

interface

uses
  TipoComunsUnit;

type
  AliquotaAdRemModel = record
  private
    FInstance: RecordInstance;
    FValor: Currency;
    FUnidadeMedida: string;
  public
    class function NullInstance(): AliquotaAdRemModel; static;

    class function Create( AValor: Currency; const AUnidadeMedida: string ): AliquotaAdRemModel; static;

    function IsNull(): Boolean;

    property Valor: Currency read FValor;
    property UnidadeMedida: string read FUnidadeMedida;

  end;

implementation

{ AliquotaAdRemModel }

class function AliquotaAdRemModel.Create(AValor: Currency; const AUnidadeMedida: string): AliquotaAdRemModel;
begin
  Result.FInstance := riNotNull;
  Result.FValor := AValor;
  Result.FUnidadeMedida := AUnidadeMedida;
end;

function AliquotaAdRemModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function AliquotaAdRemModel.NullInstance: AliquotaAdRemModel;
begin
  Result.FInstance := riNull;
end;

end.
