unit ImpostoCalculadoModelUnit;

interface

uses
  DiferimentoModelUnit,
  DevolucaoTributosModelUnit,
  ReducaoAliquotaModelUnit,
  TipoComunsUnit;

type
  ImpostoCalculadoModel = class
  private
    FAliquota: Currency;
    FGDif: DiferimentoModel;
    FGDevTrib: DevolucaoTributosModel;
    FGRed: ReducaoAliquotaModel;
    FValorImposto: Currency;
    FMemoriaCalculo: string;
  public
    constructor Create(
      Aliquota: Currency;
      const GDif: DiferimentoModel;
      const GDevTrib: DevolucaoTributosModel;
      const GRed: ReducaoAliquotaModel;
      ValorImposto: Currency;
      const MemoriaCalculo: string
    );

    property Aliquota: Currency read FAliquota;
    property GDif: DiferimentoModel read FGDif;
    property GDevTrib: DevolucaoTributosModel read FGDevTrib;
    property GRed: ReducaoAliquotaModel read FGRed;
    property ValorImposto: Currency read FValorImposto;
    property MemoriaCalculo: string read FMemoriaCalculo;

    function GetVDif: Currency;
    function GetVDevTrib: Currency;
  end;

implementation

{ ImpostoCalculadoModel }

constructor ImpostoCalculadoModel.Create(
  Aliquota: Currency;
  const GDif: DiferimentoModel;
  const GDevTrib: DevolucaoTributosModel;
  const GRed: ReducaoAliquotaModel;
  ValorImposto: Currency;
  const MemoriaCalculo: string
);
begin
  FAliquota := Aliquota;
  FGDif := GDif;
  FGDevTrib := GDevTrib;
  FGRed := GRed;
  FValorImposto := ValorImposto;
  FMemoriaCalculo := MemoriaCalculo;
end;

function ImpostoCalculadoModel.GetVDif(): Currency;
begin
  Result := FGDif.VDif;
end;

function ImpostoCalculadoModel.GetVDevTrib(): Currency;
begin
  Result := FGDevTrib.VDevTrib;
end;

end.
