unit UpdatePedvendaEmissaoNFSeCommandsUnit;

interface

uses
  TipoComunsUnit, IntegerNullableUnit, DateAndTimeNullableUnit;

type
  UpdatePedvendaEmissaoNFSeCommand = record
  private
    FNFSeId: string;
    FEmpresaId: Integer;
    FNumeroOS: Integer;
    FNNFSe: Int64Nullable;
    FNDPS: IntegerNullable;
    FDhEmissao: DateTimeNullable;
    FDhProcessamento: DateTimeNullable;
    FValorLiquido: Currency;
  public
    class function Create(
      const ANFSeId: string;
      AEmpresaId: Integer;
      ANumeroOS: Integer;
      const ANNFSe: Int64Nullable;
      const ANDPS: IntegerNullable;
      const ADhEmissao: DateTimeNullable;
      const ADhProcessamento: DateTimeNullable;
      AValorLiquido: Currency
    ): UpdatePedvendaEmissaoNFSeCommand; static;

    property NFSeId: string read FNFSeId;
    property EmpresaId: Integer read FEmpresaId;
    property NumeroOS: Integer read FNumeroOS;
    property NNFSe: Int64Nullable read FNNFSe;
    property NDPS: IntegerNullable read FNDPS;
    property DhEmissao: DateTimeNullable read FDhEmissao;
    property DhProcessamento: DateTimeNullable read FDhProcessamento;
    property ValorLiquido: Currency read FValorLiquido;
  end;

  UpdatePedvendaSubstituicaoNFSeCommand = record
  private
    FNumeroOS: Integer;
    FNFSeId: string;
  public
    class function Create(
      ANumeroOS: Integer;
      const ANFSeId: string
    ): UpdatePedvendaSubstituicaoNFSeCommand; static;

    property NumeroOS: Integer read FNumeroOS;
    property NFSeId: string read FNFSeId;
  end;

implementation

{ UpdatePedvendaEmissaoNFSeCommand }

class function UpdatePedvendaEmissaoNFSeCommand.Create(
  const ANFSeId: string;
  AEmpresaId: Integer;
  ANumeroOS: Integer;
  const ANNFSe: Int64Nullable;
  const ANDPS: IntegerNullable;
  const ADhEmissao: DateTimeNullable;
  const ADhProcessamento: DateTimeNullable;
  AValorLiquido: Currency
): UpdatePedvendaEmissaoNFSeCommand;
begin
  Result.FNFSeId := ANFSeId;
  Result.FEmpresaId := AEmpresaId;
  Result.FNumeroOS := ANumeroOS;
  Result.FNNFSe := ANNFSe;
  Result.FNDPS := ANDPS;
  Result.FDhEmissao := ADhEmissao;
  Result.FDhProcessamento := ADhProcessamento;
  Result.FValorLiquido := AValorLiquido;
end;

{ UpdatePedvendaSubstituicaoNFSeCommand }

class function UpdatePedvendaSubstituicaoNFSeCommand.Create(ANumeroOS: Integer;
  const ANFSeId: string): UpdatePedvendaSubstituicaoNFSeCommand;
begin
  Result.FNumeroOS := ANumeroOS;
  Result.FNFSeId := ANFSeId;
end;

end.
