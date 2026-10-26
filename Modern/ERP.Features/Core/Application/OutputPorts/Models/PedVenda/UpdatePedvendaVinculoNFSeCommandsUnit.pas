unit UpdatePedvendaVinculoNFSeCommandsUnit;

interface

uses
  TipoComunsUnit;

type
  UpdatePedvendaVinculoNFSeCommand = record
  private
    FNumeroOS: Integer;
    FEmpresaId: Integer;
    FServicosId: TArrayInteger;
    FNFSeId: string;
  public
    class function Create(
      ANumeroOS, AEmpresaId: Integer;
      const AServicosId: TArrayInteger;
      const ANFSeId: string
    ): UpdatePedvendaVinculoNFSeCommand; static;

    property NumeroOS: Integer read FNumeroOS;
    property EmpresaId: Integer read FEmpresaId;
    property ServicosId: TArrayInteger read FServicosId;
    property NFSeId: string read FNFSeId;
  end;

  UpdatePedvendaRemoverVinculoNFSeCommand = record
  private
    FNumeroOS: Integer;
    FEmpresaId: Integer;
    FNFSeId: string;
  public
    class function Create(
      ANumeroOS, AEmpresaId: Integer;
      const ANFSeId: string
    ): UpdatePedvendaRemoverVinculoNFSeCommand; static;

    property NumeroOS: Integer read FNumeroOS;
    property EmpresaId: Integer read FEmpresaId;
    property NFSeId: string read FNFSeId;
  end;

implementation

{ UpdatePedvendaVinculoNFSeCommand }

class function UpdatePedvendaVinculoNFSeCommand.Create(
  ANumeroOS, AEmpresaId: Integer;
  const AServicosId: TArrayInteger;
  const ANFSeId: string
): UpdatePedvendaVinculoNFSeCommand;
begin
  Result.FNumeroOS := ANumeroOS;
  Result.FEmpresaId := AEmpresaId;
  Result.FServicosId := AServicosId;
  Result.FNFSeId := ANFSeId;
end;

{ UpdatePedvendaRemoverVinculoNFSeCommand }

class function UpdatePedvendaRemoverVinculoNFSeCommand.Create(
  ANumeroOS, AEmpresaId: Integer;
  const ANFSeId: string
): UpdatePedvendaRemoverVinculoNFSeCommand;
begin
  Result.FNumeroOS := ANumeroOS;
  Result.FEmpresaId := AEmpresaId;
  Result.FNFSeId := ANFSeId;
end;

end.
