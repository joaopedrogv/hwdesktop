unit CBSModelUnit;

interface

uses
  DiferimentoModelUnit,
  DevolucaoTributosModelUnit,
  ReducaoAliquotaModelUnit,
  TipoComunsUnit;

type
  CBSModel = class
  private
    FPCBS: Currency;
    FGDif: DiferimentoModel;
    FGDevTrib: DevolucaoTributosModel;
    FGRed: ReducaoAliquotaModel;
    FVCBS: Currency;
    FMemoriaCalculo: string;
  public
    constructor Create(
      PCBS: Currency;
      const GDif: DiferimentoModel;
      const GDevTrib: DevolucaoTributosModel;
      const GRed: ReducaoAliquotaModel;
      VCBS: Currency;
      const MemoriaCalculo: string
    );

    property PCBS: Currency read FPCBS;
    property GDif: DiferimentoModel read FGDif;
    property GDevTrib: DevolucaoTributosModel read FGDevTrib;
    property GRed: ReducaoAliquotaModel read FGRed;
    property VCBS: Currency read FVCBS;
    property MemoriaCalculo: string read FMemoriaCalculo;
  end;

implementation

uses
  NumberServiceUnit;

{ CBSModel }

constructor CBSModel.Create(
  PCBS: Currency;
  const GDif: DiferimentoModel;
  const GDevTrib: DevolucaoTributosModel;
  const GRed: ReducaoAliquotaModel;
  VCBS: Currency;
  const MemoriaCalculo: string
);
begin
  FPCBS := NumberService.RoundHalfUpTo4(PCBS);
  FGDif := GDif;
  FGDevTrib := GDevTrib;
  FGRed := GRed;
  FVCBS := NumberService.RoundHalfUpTo2(VCBS);
  FMemoriaCalculo := MemoriaCalculo;
end;

end.
