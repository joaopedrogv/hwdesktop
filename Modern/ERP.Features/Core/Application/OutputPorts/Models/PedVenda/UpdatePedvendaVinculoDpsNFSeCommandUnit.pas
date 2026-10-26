unit UpdatePedvendaVinculoDpsNFSeCommandUnit;

interface

uses
  TipoComunsUnit, IntegerNullableUnit, DateAndTimeNullableUnit;

type
  UpdatePedvendaVinculoDpsNFSeCommand = record
  private
    FNFSeId: string;
    FEmpresaId: Integer;
    FNumeroOS: Integer;
    FNDPS: IntegerNullable;
    FDhEmissao: DateTimeNullable;
  public
    class function Create(
      const ANFSeId: string;
      AEmpresaId: Integer;
      ANumeroOS: Integer;
      ANDPS: IntegerNullable;
      ADhEmissao: DateTimeNullable
    ): UpdatePedvendaVinculoDpsNFSeCommand; static;

    property NFSeId: string read FNFSeId;
    property EmpresaId: Integer read FEmpresaId;
    property NumeroOS: Integer read FNumeroOS;
    property NDPS: IntegerNullable read FNDPS;
    property DhEmissao: DateTimeNullable read FDhEmissao;
  end;

implementation

{ UpdatePedvendaVinculoDpsNFSeCommand }

class function UpdatePedvendaVinculoDpsNFSeCommand.Create(
  const ANFSeId: string;
  AEmpresaId: Integer;
  ANumeroOS: Integer;
  ANDPS: IntegerNullable;
  ADhEmissao: DateTimeNullable
): UpdatePedvendaVinculoDpsNFSeCommand;
begin
  Result.FNFSeId := ANFSeId;
  Result.FEmpresaId := AEmpresaId;
  Result.FNumeroOS := ANumeroOS;
  Result.FNDPS := ANDPS;
  Result.FDhEmissao := ADhEmissao;
end;

end.
