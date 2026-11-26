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
  DecimalCalculoUnit,
  ArredondamentoCalculoUnit;

{ CBSModel }

constructor CBSModel.Create(
  PCBS: Currency;
  const GDif: DiferimentoModel;
  const GDevTrib: DevolucaoTributosModel;
  const GRed: ReducaoAliquotaModel;
  VCBS: Currency;
  const MemoriaCalculo: string
);
var
  valor: DecimalCalculo;
begin
  valor := DecimalCalculo.DeCurrency(PCBS);
  valor := ArredondamentoCalculo.AliquotaPublicada(valor);
  FPCBS := valor.ParaCurrency;
  FGDif := GDif;
  FGDevTrib := GDevTrib;
  FGRed := GRed;
  valor := DecimalCalculo.DeCurrency(VCBS);
  valor := ArredondamentoCalculo.ValorFiscal(valor);
  FVCBS := valor.ParaCurrency;
  FMemoriaCalculo := MemoriaCalculo;
end;

end.
