unit CancelarNFSeInputUnit;

interface

uses
  StringNullableUnit,
  DateAndTimeNullableUnit;

type
  CancelarNFSeInput = record
  private
    FId: string;
    FEmpresaId: Integer;
    FCMotivo: StringNullable;
    FXMotivo: StringNullable;
    FCancPortal: Boolean;
    FDhCancelamento: DateTimeNullable;
    FImprimir: Boolean;
    FSilent: Boolean;
  public
    class function Create(
      const AId: string;
      AEmpresaId: Integer;
      const ACMotivo: StringNullable;
      const AXMotivo: StringNullable;
      ACancPortal: Boolean;
      const ADhCancelamento: DateTimeNullable;
      AImprimir: Boolean;
      ASilent: Boolean
    ): CancelarNFSeInput; static;

    property Id: string read FId;
    property EmpresaId: Integer read FEmpresaId;
    property CMotivo: StringNullable read FCMotivo;
    property XMotivo: StringNullable read FXMotivo;
    property CancPortal: Boolean read FCancPortal;
    property DhCancelamento: DateTimeNullable read FDhCancelamento;
    property Imprimir: Boolean read FImprimir;
    property Silent: Boolean read FSilent;
  end;

implementation

{ CancelarNFSeInput }

class function CancelarNFSeInput.Create(
  const AId: string;
  AEmpresaId: Integer;
  const ACMotivo: StringNullable;
  const AXMotivo: StringNullable;
  ACancPortal: Boolean;
  const ADhCancelamento: DateTimeNullable;
  AImprimir: Boolean;
  ASilent: Boolean
): CancelarNFSeInput;
begin
  Result.FId := AId;
  Result.FEmpresaId := AEmpresaId;
  Result.FCMotivo := ACMotivo;
  Result.FXMotivo := AXMotivo;
  Result.FCancPortal := ACancPortal;
  Result.FDhCancelamento := ADhCancelamento;
  Result.FImprimir := AImprimir;
  Result.FSilent := ASilent;
end;

end.
