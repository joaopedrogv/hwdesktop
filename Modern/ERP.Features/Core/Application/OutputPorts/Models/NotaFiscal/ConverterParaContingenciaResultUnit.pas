unit ConverterParaContingenciaResultUnit;
    
interface
    
uses
  SysUtils, Classes;

type
  ConverterParaContingenciaResult = record
  private
    FNotaFiscalIdAInvalidar: Integer;
  public
    class function Create(ANotaFiscalIdAInvalidar: Integer): ConverterParaContingenciaResult; static;
    
    property NotaFiscalIdAInvalidar: Integer read FNotaFiscalIdAInvalidar;
  end;
    
implementation

{ ConverterParaContingenciaResult }

class function ConverterParaContingenciaResult.Create(ANotaFiscalIdAInvalidar: Integer): ConverterParaContingenciaResult;
begin
  Result.FNotaFiscalIdAInvalidar := ANotaFiscalIdAInvalidar;
end;
    
end.