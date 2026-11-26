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
  DecimalCalculoUnit,
  ArredondamentoCalculoUnit;

{ IBSMunModel }

constructor IBSMunModel.Create(
  PIBSMun: Extended;
  const GDif: DiferimentoModel;
  const GDevTrib: DevolucaoTributosModel;
  const GRed: ReducaoAliquotaModel;
  VIBSMun: Extended;
  const MemoriaCalculo: string
);
var
  valor: DecimalCalculo;
begin
  valor := DecimalCalculo.DeDouble(PIBSMun);
  valor := ArredondamentoCalculo.AliquotaPublicada(valor);
  FPIBSMun := valor.ParaDouble;
  FGDif := GDif;
  FGDevTrib := GDevTrib;
  FGRed := GRed;
  valor := DecimalCalculo.DeDouble(VIBSMun);
  valor := ArredondamentoCalculo.ValorFiscal(valor);
  FVIBSMun := valor.ParaDouble;
  FMemoriaCalculo := MemoriaCalculo;
end;

end.
