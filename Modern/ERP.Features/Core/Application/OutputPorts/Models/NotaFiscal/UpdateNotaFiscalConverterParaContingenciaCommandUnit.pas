unit UpdateNotaFiscalConverterParaContingenciaCommandUnit;

interface

uses
  SysUtils, TipoAmbienteNFeEnumUnit;

type
  UpdateNotaFiscalConverterParaContingenciaCommand = record
  private
    FCodNf: Integer;
    FEmpresaId: Integer;
    FAmbiente: TipoAmbienteNFeEnum;
    FDhCont: TDateTime;
    FXJustCont: string;
  public
    class function Create(
      ACodNf: Integer;
      AEmpresaId: Integer;
      AAmbiente: TipoAmbienteNFeEnum;
      ADhCont: TDateTime;
      const AXJustCont: string
    ): UpdateNotaFiscalConverterParaContingenciaCommand; static;

    property CodNf: Integer read FCodNf;
    property EmpresaId: Integer read FEmpresaId;
    property Ambiente: TipoAmbienteNFeEnum read FAmbiente;
    property DhCont: TDateTime read FDhCont;
    property XJustCont: string read FXJustCont;
  end;

implementation

{ UpdateConverterParaContingenciaCommand }

class function UpdateNotaFiscalConverterParaContingenciaCommand.Create(
  ACodNf: Integer;
  AEmpresaId: Integer;
  AAmbiente: TipoAmbienteNFeEnum;
  ADhCont: TDateTime;
  const AXJustCont: string
): UpdateNotaFiscalConverterParaContingenciaCommand;
begin
  Result.FCodNf := ACodNf;
  Result.FEmpresaId := AEmpresaId;
  Result.FAmbiente := AAmbiente;
  Result.FDhCont := ADhCont;
  Result.FXJustCont := AXJustCont;
end;

end.
