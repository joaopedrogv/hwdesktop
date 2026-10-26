unit UpdateNotaFiscalItemContextoRtcCommandUnit;

interface

uses
  SysUtils,
  StringNullableUnit;

type
  UpdateNotaFiscalItemContextoRtcCommand = record
  private
    FCodigoNF: Integer;
    FEmpresaId: Integer;
    FNumItem: Integer;
    FDFeTribId: StringNullable;
  public
    class function Create(
      ACodigoNF: Integer;
      AEmpresaId: Integer;
      ANumItem: Integer;
      const ADFeTribId: StringNullable
    ): UpdateNotaFiscalItemContextoRtcCommand; static;

    property CodigoNF: Integer read FCodigoNF;
    property EmpresaId: Integer read FEmpresaId;
    property NumItem: Integer read FNumItem;
    property DFeTribId: StringNullable read FDFeTribId;
  end;

implementation

{ UpdateNotaFiscalItemContextoRtcCommand }

class function UpdateNotaFiscalItemContextoRtcCommand.Create(
  ACodigoNF: Integer;
  AEmpresaId: Integer;
  ANumItem: Integer;
  const ADFeTribId: StringNullable
): UpdateNotaFiscalItemContextoRtcCommand;
begin
  Result.FCodigoNF := ACodigoNF;
  Result.FEmpresaId := AEmpresaId;
  Result.FNumItem := ANumItem;
  Result.FDFeTribId := ADFeTribId;
end;

end.
