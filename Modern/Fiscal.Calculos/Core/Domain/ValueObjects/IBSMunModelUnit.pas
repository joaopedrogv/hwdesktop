unit IBSMunModelUnit;

interface

uses
  DiferimentoModelUnit,
  DevolucaoTributosModelUnit,
  ReducaoAliquotaModelUnit,
  TipoComunsUnit;

type
  IBSMunModel = class
  private
    FPIBSMun: Extended;
    FGDif: DiferimentoModel;
    FGDevTrib: DevolucaoTributosModel;
    FGRed: ReducaoAliquotaModel;
    FVIBSMun: Extended;
    FMemoriaCalculo: string;
  public
    constructor Create(
      PIBSMun: Extended;
      const GDif: DiferimentoModel;
      const GDevTrib: DevolucaoTributosModel;
      const GRed: ReducaoAliquotaModel;
      VIBSMun: Extended;
      const MemoriaCalculo: string
    );

    property PIBSMun: Extended read FPIBSMun;
    property GDif: DiferimentoModel read FGDif;
    property GDevTrib: DevolucaoTributosModel read FGDevTrib;
    property GRed: ReducaoAliquotaModel read FGRed;
    property VIBSMun: Extended read FVIBSMun;
    property MemoriaCalculo: string read FMemoriaCalculo;
  end;

implementation

uses
  NumberServiceUnit;

{ IBSMunModel }

constructor IBSMunModel.Create(
  PIBSMun: Extended;
  const GDif: DiferimentoModel;
  const GDevTrib: DevolucaoTributosModel;
  const GRed: ReducaoAliquotaModel;
  VIBSMun: Extended;
  const MemoriaCalculo: string
);
begin
  FPIBSMun := NumberService.RoundHalfUpTo4(PIBSMun);
  FGDif := GDif;
  FGDevTrib := GDevTrib;
  FGRed := GRed;
  FVIBSMun := NumberService.RoundHalfUpTo2(VIBSMun);
  FMemoriaCalculo := MemoriaCalculo;
end;

end.
