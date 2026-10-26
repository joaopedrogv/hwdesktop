unit ImpostoSeletivoModelUnit;

interface

uses
  TipoComunsUnit;

type
  ImpostoSeletivoModel = record
  private
    FInstance: RecordInstance;
    FCSTIS: Integer;
    FCClassTribIS: string;
    FVBCIS: Currency;
    FPIS: Currency;
    FPISEspec: Currency;
    FUTrib: string;
    FQTrib: Double;
    FVIS: Currency;
    FMemoriaCalculo: string;
  public
    class function NullInstance(): ImpostoSeletivoModel; static;

    class function Create(
      CSTIS: Integer;
      const CClassTribIS: string;
      VBCIS: Currency;
      PIS: Currency;
      PISEspec: Currency;
      const UTrib: string;
      QTrib: Double;
      VIS: Currency;
      const MemoriaCalculo: string = ''
    ): ImpostoSeletivoModel; static;

    function IsNull(): Boolean;

    procedure SetOperacaoComDesoneracao();
    procedure SetMemoriaCalculo(const Value: string);

    property CSTIS: Integer read FCSTIS;
    property CClassTribIS: string read FCClassTribIS;
    property VBCIS: Currency read FVBCIS;
    property PIS: Currency read FPIS;
    property PISEspec: Currency read FPISEspec;
    property UTrib: string read FUTrib;
    property QTrib: Double read FQTrib;
    property VIS: Currency read FVIS;
    property MemoriaCalculo: string read FMemoriaCalculo;

    function GetValorImpostoSeletivo(): Currency;
  end;

implementation

uses
  SysUtils;

{ ImpostoSeletivoModel }

class function ImpostoSeletivoModel.Create(
  CSTIS: Integer;
  const CClassTribIS: string;
  VBCIS: Currency;
  PIS: Currency;
  PISEspec: Currency;
  const UTrib: string;
  QTrib: Double;
  VIS: Currency;
  const MemoriaCalculo: string
): ImpostoSeletivoModel;
begin
  Result.FCSTIS := CSTIS;
  Result.FCClassTribIS := CClassTribIS;
  Result.FVBCIS := VBCIS;
  Result.FPIS := PIS;
  Result.FPISEspec := PISEspec;
  Result.FUTrib := UTrib;
  Result.FQTrib := QTrib;
  Result.FVIS := VIS;
  Result.FMemoriaCalculo := MemoriaCalculo;
  Result.FInstance := riNotNull;
end;

function ImpostoSeletivoModel.GetValorImpostoSeletivo: Currency;
begin
  Result := FVIS;
end;

function ImpostoSeletivoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function ImpostoSeletivoModel.NullInstance: ImpostoSeletivoModel;
begin
  Result := ImpostoSeletivoModel.Create(
    0, '', 0, 0, 0, '', 0, 0
  );
  Result.FInstance := riNull;
end;

procedure ImpostoSeletivoModel.SetMemoriaCalculo(const Value: string);
begin
  FMemoriaCalculo := Value;
end;

procedure ImpostoSeletivoModel.SetOperacaoComDesoneracao;
begin
  // Regra: Suspensão de CBS e IBS não suspende o Imposto Seletivo automaticamente.
  // FVIS := 0;
end;

end.