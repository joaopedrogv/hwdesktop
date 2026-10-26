unit IAvaliadorExpressaoAritmeticaServiceUnit;

interface

uses
  SysUtils, Math;

type
  ScaleRange = 0..8;

  VariaveisAvaliador = record
  private
    FAliquota                   : Double;
    FAliquotaEfetiva            : Double;
    FAliquotaPadraoOuReferencia : Double;
    FAliquotaReferencia         : Double;
    FAliquotaAdValorem          : Double;
    FAliquotaAdRem              : Double;
    FAjuste                     : Double;
    FPercentualReducao          : Double;
    FPRedutorCompraGov          : Double;
    FPercentualDiferimento      : Double;
    FBaseCalculo                : Double;
    FBaseCalculoInformada       : Double;
    FQuantidade                 : Double;
    FTributoCalculado           : Double;
    FImpostoSeletivoInformado   : Double;
    FImpostoSeletivoCalculado   : Double;
    FRedutor                    : Double;
    FPBio                       : Double;
    FAliquotaAdRemPrincipal     : Double;
    FAliquotaAdRemSecundaria    : Double;
    FVariacaoPontoPercentual    : Double;
  public
    class function Create(): VariaveisAvaliador; static;

    property Aliquota                   : Double read FAliquota;
    property AliquotaEfetiva            : Double read FAliquotaEfetiva;
    property AliquotaPadraoOuReferencia : Double read FAliquotaPadraoOuReferencia;
    property AliquotaReferencia         : Double read FAliquotaReferencia;
    property AliquotaAdValorem          : Double read FAliquotaAdValorem;
    property AliquotaAdRem              : Double read FAliquotaAdRem;
    property Ajuste                     : Double read FAjuste;
    property PercentualReducao          : Double read FPercentualReducao;
    property PRedutorCompraGov          : Double read FPRedutorCompraGov;
    property PercentualDiferimento      : Double read FPercentualDiferimento;
    property BaseCalculo                : Double read FBaseCalculo;
    property BaseCalculoInformada       : Double read FBaseCalculoInformada;
    property Quantidade                 : Double read FQuantidade;
    property TributoCalculado           : Double read FTributoCalculado;
    property ImpostoSeletivoInformado   : Double read FImpostoSeletivoInformado;
    property ImpostoSeletivoCalculado   : Double read FImpostoSeletivoCalculado;
    property Redutor                    : Double read FRedutor;
    property PBio                       : Double read FPBio;
    property AliquotaAdRemPrincipal     : Double read FAliquotaAdRemPrincipal;
    property AliquotaAdRemSecundaria    : Double read FAliquotaAdRemSecundaria;
    property VariacaoPontoPercentual    : Double read FVariacaoPontoPercentual;
  end;

  IAvaliadorExpressaoAritmeticaService = interface
    ['{F4761342-D8D1-470C-8BEE-53526E48A139}']
    /// <summary>
    ///   Avalia uma expressao aritmetica. O resultado de expressao composta e
    ///   arredondado com ArredondamentoUtils.ArredondarInterno (8 casas, HALF_EVEN);
    ///   expressao de variavel unica retorna o valor bruto. O parametro Scale e
    ///   ignorado (conformidade com AvaliadorExpressaoAritmetica.java).
    /// </summary>
    function Evaluate(const Expressao: string; const Variaveis: VariaveisAvaliador; Scale: ScaleRange): Double;
  end;

  IVariaveisAvaliadorBuilder = interface
    ['{9544FF60-F7DE-40AD-B2F0-D27253195EBC}']
    function Aliquota(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaEfetiva(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaPadraoOuReferencia(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaReferencia(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaAdValorem(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaAdRem(Value: Double): IVariaveisAvaliadorBuilder;
    function Ajuste(Value: Double): IVariaveisAvaliadorBuilder;
    function PercentualReducao(Value: Double): IVariaveisAvaliadorBuilder;
    function PRedutorCompraGov(Value: Double): IVariaveisAvaliadorBuilder;
    function PercentualDiferimento(Value: Double): IVariaveisAvaliadorBuilder;
    function BaseCalculo(Value: Double): IVariaveisAvaliadorBuilder;
    function BaseCalculoInformada(Value: Double): IVariaveisAvaliadorBuilder;
    function Quantidade(Value: Double): IVariaveisAvaliadorBuilder;
    function TributoCalculado(Value: Double): IVariaveisAvaliadorBuilder;
    function ImpostoSeletivoInformado(Value: Double): IVariaveisAvaliadorBuilder;
    function ImpostoSeletivoCalculado(Value: Double): IVariaveisAvaliadorBuilder;
    function Redutor(Value: Double): IVariaveisAvaliadorBuilder;
    function PBio(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaAdRemPrincipal(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaAdRemSecundaria(Value: Double): IVariaveisAvaliadorBuilder;
    function VariacaoPontoPercentual(Value: Double): IVariaveisAvaliadorBuilder;
    function Build: VariaveisAvaliador;
  end;

  VariaveisAvaliadorBuilder = class
  public
    class function Create(): IVariaveisAvaliadorBuilder; static;
  end;

implementation

type

  VariaveisBuilder = class(TInterfacedObject, IVariaveisAvaliadorBuilder)
  private
    FData: VariaveisAvaliador;
  public
    constructor Create();
    function Aliquota(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaEfetiva(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaPadraoOuReferencia(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaReferencia(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaAdValorem(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaAdRem(Value: Double): IVariaveisAvaliadorBuilder;
    function Ajuste(Value: Double): IVariaveisAvaliadorBuilder;
    function PercentualReducao(Value: Double): IVariaveisAvaliadorBuilder;
    function PRedutorCompraGov(Value: Double): IVariaveisAvaliadorBuilder;
    function PercentualDiferimento(Value: Double): IVariaveisAvaliadorBuilder;
    function BaseCalculo(Value: Double): IVariaveisAvaliadorBuilder;
    function BaseCalculoInformada(Value: Double): IVariaveisAvaliadorBuilder;
    function Quantidade(Value: Double): IVariaveisAvaliadorBuilder;
    function TributoCalculado(Value: Double): IVariaveisAvaliadorBuilder;
    function ImpostoSeletivoInformado(Value: Double): IVariaveisAvaliadorBuilder;
    function ImpostoSeletivoCalculado(Value: Double): IVariaveisAvaliadorBuilder;
    function Redutor(Value: Double): IVariaveisAvaliadorBuilder;
    function PBio(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaAdRemPrincipal(Value: Double): IVariaveisAvaliadorBuilder;
    function AliquotaAdRemSecundaria(Value: Double): IVariaveisAvaliadorBuilder;
    function VariacaoPontoPercentual(Value: Double): IVariaveisAvaliadorBuilder;
    function Build: VariaveisAvaliador;
  end;


{ VariaveisBuilder }

function VariaveisBuilder.Aliquota(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquota := Value;
  Result := Self;
end;

function VariaveisBuilder.AliquotaEfetiva(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaEfetiva := Value;
  Result := Self;
end;

function VariaveisBuilder.AliquotaPadraoOuReferencia(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaPadraoOuReferencia := Value;
  Result := Self;
end;

function VariaveisBuilder.AliquotaReferencia(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaReferencia := Value;
  Result := Self;
end;

function VariaveisBuilder.AliquotaAdValorem(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaAdValorem := Value;
  Result := Self;
end;

function VariaveisBuilder.AliquotaAdRem(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaAdRem := Value;
  Result := Self;
end;

function VariaveisBuilder.AliquotaAdRemPrincipal(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaAdRemPrincipal := Value;
  Result := Self;
end;

function VariaveisBuilder.AliquotaAdRemSecundaria(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaAdRemSecundaria := Value;
  Result := Self;
end;

function VariaveisBuilder.Ajuste(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAjuste := Value;
  Result := Self;
end;

function VariaveisBuilder.PercentualReducao(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FPercentualReducao := Value;
  Result := Self;
end;

function VariaveisBuilder.PRedutorCompraGov(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FPRedutorCompraGov := Value;
  Result := Self;
end;

function VariaveisBuilder.PBio(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FPBio := Value;
  Result := Self;
end;

function VariaveisBuilder.PercentualDiferimento(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FPercentualDiferimento := Value;
  Result := Self;
end;

function VariaveisBuilder.BaseCalculo(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FBaseCalculo := Value;
  Result := Self;
end;

function VariaveisBuilder.BaseCalculoInformada(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FBaseCalculoInformada := Value;
  Result := Self;
end;

function VariaveisBuilder.Quantidade(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FQuantidade := Value;
  Result := Self;
end;

function VariaveisBuilder.TributoCalculado(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FTributoCalculado := Value;
  Result := Self;
end;

function VariaveisBuilder.VariacaoPontoPercentual(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FVariacaoPontoPercentual := Value;
  Result := Self;
end;

function VariaveisBuilder.ImpostoSeletivoInformado(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FImpostoSeletivoInformado := Value;
  Result := Self;
end;

function VariaveisBuilder.ImpostoSeletivoCalculado(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FImpostoSeletivoCalculado := Value;
  Result := Self;
end;

function VariaveisBuilder.Redutor(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FRedutor := Value;
  Result := Self;
end;

function VariaveisBuilder.Build: VariaveisAvaliador;
begin
  Result := FData;
end;

constructor VariaveisBuilder.Create();
begin
  FData := VariaveisAvaliador.Create();
end;

{ VariaveisAvaliador }

class function VariaveisAvaliador.Create: VariaveisAvaliador;
begin
  Result.FAliquota                   := 0.00;
  Result.FAliquotaEfetiva            := 0.00;
  Result.FAliquotaPadraoOuReferencia := 0.00;
  Result.FAliquotaReferencia         := 0.00;
  Result.FAliquotaAdValorem          := 0.00;
  Result.FAliquotaAdRem              := 0.00;
  Result.FAjuste                     := 0.00;
  Result.FPercentualReducao          := 0.00;
  Result.FPRedutorCompraGov          := 0.00;
  Result.FPercentualDiferimento      := 0.00;
  Result.FBaseCalculo                := 0.00;
  Result.FBaseCalculoInformada       := 0.00;
  Result.FQuantidade                 := 0.00;
  Result.FTributoCalculado           := 0.00;
  Result.FImpostoSeletivoInformado   := 0.00;
  Result.FImpostoSeletivoCalculado   := 0.00;
  Result.FRedutor                    := 0.00;
  Result.FPBio                       := 0.00;
  Result.FAliquotaAdRemPrincipal     := 0.00;
  Result.FAliquotaAdRemSecundaria    := 0.00;
  Result.FVariacaoPontoPercentual    := 0.00;
end;

{ VariaveisAvaliadorBuilder }

class function VariaveisAvaliadorBuilder.Create: IVariaveisAvaliadorBuilder;
begin
  Result := VariaveisBuilder.Create();
end;

end.
