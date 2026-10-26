unit IBSUFModelUnit;

interface

uses
  DiferimentoModelUnit,
  DevolucaoTributosModelUnit,
  ReducaoAliquotaModelUnit,
  TipoComunsUnit;

type
  IBSUFModel = class
  private
    FPIBSUF: Currency;
    FGDif: DiferimentoModel;
    FGDevTrib: DevolucaoTributosModel;
    FGRed: ReducaoAliquotaModel;
    FVIBSUF: Currency;
    FMemoriaCalculo: string;
  public
    constructor Create(
      PIBSUF: Currency;
      const GDif: DiferimentoModel;
      const GDevTrib: DevolucaoTributosModel;
      const GRed: ReducaoAliquotaModel;
      VIBSUF: Currency;
      const MemoriaCalculo: string
    );

    property PIBSUF: Currency read FPIBSUF;
    property GDif: DiferimentoModel read FGDif;
    property GDevTrib: DevolucaoTributosModel read FGDevTrib;
    property GRed: ReducaoAliquotaModel read FGRed;
    property VIBSUF: Currency read FVIBSUF;
    property MemoriaCalculo: string read FMemoriaCalculo;
  end;

implementation

uses
  NumberServiceUnit;

{ IBSUFModel }

constructor IBSUFModel.Create(
  PIBSUF: Currency;
  const GDif: DiferimentoModel;
  const GDevTrib: DevolucaoTributosModel;
  const GRed: ReducaoAliquotaModel;
  VIBSUF: Currency;
  const MemoriaCalculo: string
);
begin
  FPIBSUF := NumberService.RoundHalfUpTo4(PIBSUF);
  FGDif := GDif;
  FGDevTrib := GDevTrib;
  FGRed := GRed;
  FVIBSUF := NumberService.RoundHalfUpTo2(VIBSUF);
  FMemoriaCalculo := MemoriaCalculo;
end;

end.
