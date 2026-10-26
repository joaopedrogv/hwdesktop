unit CalculoTributosNFSeInputUnit;

interface

uses
  NFSeModelUnit;

type
  CalculoTributosNFSeInput = record
  private
    FNota: NFSeModel;
    FCalcularRTC: Boolean;    // IBS, CBS
    FCalcularLegado: Boolean; // ISS, PIS, COFINS
  public
    class function Create(
      const ANota: NFSeModel; ACalcularRTC, ACalcularLegado: Boolean
    ): CalculoTributosNFSeInput; static;

    property Nota: NFSeModel read FNota;
    property CalcularRTC: Boolean read FCalcularRTC;
    property CalcularLegado: Boolean read FCalcularLegado;
  end;

implementation

{ CalculoTributosNFSeInput }

class function CalculoTributosNFSeInput.Create(
  const ANota: NFSeModel;
  ACalcularRTC, ACalcularLegado: Boolean
): CalculoTributosNFSeInput;
begin
  Result.FNota := ANota;
  Result.FCalcularRTC := ACalcularRTC;
  Result.FCalcularLegado := ACalcularLegado;
end;

end.
