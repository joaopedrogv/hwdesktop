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
  DecimalCalculoUnit,
  ArredondamentoCalculoUnit;

{ IBSUFModel }

constructor IBSUFModel.Create(
  PIBSUF: Currency;
  const GDif: DiferimentoModel;
  const GDevTrib: DevolucaoTributosModel;
  const GRed: ReducaoAliquotaModel;
  VIBSUF: Currency;
  const MemoriaCalculo: string
);
var
  valor: DecimalCalculo;
begin
  valor := DecimalCalculo.DeCurrency(PIBSUF);
  valor := ArredondamentoCalculo.AliquotaPublicada(valor);
  FPIBSUF := valor.ParaCurrency;
  FGDif := GDif;
  FGDevTrib := GDevTrib;
  FGRed := GRed;
  valor := DecimalCalculo.DeCurrency(VIBSUF);
  valor := ArredondamentoCalculo.ValorFiscal(valor);
  FVIBSUF := valor.ParaCurrency;
  FMemoriaCalculo := MemoriaCalculo;
end;

end.
