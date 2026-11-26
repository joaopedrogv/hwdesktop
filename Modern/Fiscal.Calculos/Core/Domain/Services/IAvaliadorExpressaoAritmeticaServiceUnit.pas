unit IAvaliadorExpressaoAritmeticaServiceUnit;

interface

uses
  SysUtils, Math,
  DecimalCalculoUnit;

type
  VariaveisAvaliador = record
  private
    FAliquota                   : DecimalCalculo;
    FAliquotaEfetiva            : DecimalCalculo;
    FAliquotaPadraoOuReferencia : DecimalCalculo;
    FAliquotaReferencia         : DecimalCalculo;
    FAliquotaAdValorem          : DecimalCalculo;
    FAliquotaAdRem              : DecimalCalculo;
    FAjuste                     : DecimalCalculo;
    FPercentualReducao          : DecimalCalculo;
    FPRedutorCompraGov          : DecimalCalculo;
    FPercentualDiferimento      : DecimalCalculo;
    FBaseCalculo                : DecimalCalculo;
    FBaseCalculoInformada       : DecimalCalculo;
    FQuantidade                 : DecimalCalculo;
    FTributoCalculado           : DecimalCalculo;
    FImpostoSeletivoInformado   : DecimalCalculo;
    FImpostoSeletivoCalculado   : DecimalCalculo;
    FRedutor                    : DecimalCalculo;
    FPBio                       : DecimalCalculo;
    FAliquotaAdRemPrincipal     : DecimalCalculo;
    FAliquotaAdRemSecundaria    : DecimalCalculo;
    FVariacaoPontoPercentual    : DecimalCalculo;
  public
    class function Create(): VariaveisAvaliador; static;

    property Aliquota                   : DecimalCalculo read FAliquota;
    property AliquotaEfetiva            : DecimalCalculo read FAliquotaEfetiva;
    property AliquotaPadraoOuReferencia : DecimalCalculo read FAliquotaPadraoOuReferencia;
    property AliquotaReferencia         : DecimalCalculo read FAliquotaReferencia;
    property AliquotaAdValorem          : DecimalCalculo read FAliquotaAdValorem;
    property AliquotaAdRem              : DecimalCalculo read FAliquotaAdRem;
    property Ajuste                     : DecimalCalculo read FAjuste;
    property PercentualReducao          : DecimalCalculo read FPercentualReducao;
    property PRedutorCompraGov          : DecimalCalculo read FPRedutorCompraGov;
    property PercentualDiferimento      : DecimalCalculo read FPercentualDiferimento;
    property BaseCalculo                : DecimalCalculo read FBaseCalculo;
    property BaseCalculoInformada       : DecimalCalculo read FBaseCalculoInformada;
    property Quantidade                 : DecimalCalculo read FQuantidade;
    property TributoCalculado           : DecimalCalculo read FTributoCalculado;
    property ImpostoSeletivoInformado   : DecimalCalculo read FImpostoSeletivoInformado;
    property ImpostoSeletivoCalculado   : DecimalCalculo read FImpostoSeletivoCalculado;
    property Redutor                    : DecimalCalculo read FRedutor;
    property PBio                       : DecimalCalculo read FPBio;
    property AliquotaAdRemPrincipal     : DecimalCalculo read FAliquotaAdRemPrincipal;
    property AliquotaAdRemSecundaria    : DecimalCalculo read FAliquotaAdRemSecundaria;
    property VariacaoPontoPercentual    : DecimalCalculo read FVariacaoPontoPercentual;
  end;

  IAvaliadorExpressaoAritmeticaService = interface
    ['{F4761342-D8D1-470C-8BEE-53526E48A139}']
    /// <summary>
    ///   Avalia a expressao em DecimalCalculo sem arredondar o resultado. Quem publica
    ///   aplica o arredondamento uma unica vez (conformidade com
    ///   AvaliadorExpressaoAritmetica.java); a divisao usa 34 digitos significativos.
    /// </summary>
    function Evaluate(const Expressao: string; const Variaveis: VariaveisAvaliador): DecimalCalculo;
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
    function SetAliquota(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
    function SetAliquotaEfetiva(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
    function SetBaseCalculo(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
    function SetTributoCalculado(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
    function SetPercentualDiferimento(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
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
    function SetAliquota(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
    function SetAliquotaEfetiva(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
    function SetBaseCalculo(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
    function SetTributoCalculado(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
    function SetPercentualDiferimento(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
    function Build: VariaveisAvaliador;
  end;


{ VariaveisBuilder }

function VariaveisBuilder.Aliquota(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquota := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.AliquotaEfetiva(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaEfetiva := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.AliquotaPadraoOuReferencia(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaPadraoOuReferencia := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.AliquotaReferencia(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaReferencia := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.AliquotaAdValorem(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaAdValorem := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.AliquotaAdRem(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaAdRem := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.AliquotaAdRemPrincipal(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaAdRemPrincipal := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.AliquotaAdRemSecundaria(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaAdRemSecundaria := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.Ajuste(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FAjuste := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.PercentualReducao(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FPercentualReducao := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.PRedutorCompraGov(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FPRedutorCompraGov := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.PBio(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FPBio := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.PercentualDiferimento(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FPercentualDiferimento := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.BaseCalculo(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FBaseCalculo := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.BaseCalculoInformada(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FBaseCalculoInformada := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.Quantidade(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FQuantidade := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.TributoCalculado(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FTributoCalculado := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.VariacaoPontoPercentual(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FVariacaoPontoPercentual := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.ImpostoSeletivoInformado(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FImpostoSeletivoInformado := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.ImpostoSeletivoCalculado(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FImpostoSeletivoCalculado := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.Redutor(Value: Double): IVariaveisAvaliadorBuilder;
begin
  FData.FRedutor := DecimalCalculo.DeDouble(Value);
  Result := Self;
end;

function VariaveisBuilder.SetAliquota(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquota := Value;
  Result := Self;
end;

function VariaveisBuilder.SetAliquotaEfetiva(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
begin
  FData.FAliquotaEfetiva := Value;
  Result := Self;
end;

function VariaveisBuilder.SetBaseCalculo(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
begin
  FData.FBaseCalculo := Value;
  Result := Self;
end;

function VariaveisBuilder.SetTributoCalculado(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
begin
  FData.FTributoCalculado := Value;
  Result := Self;
end;

function VariaveisBuilder.SetPercentualDiferimento(const Value: DecimalCalculo): IVariaveisAvaliadorBuilder;
begin
  FData.FPercentualDiferimento := Value;
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
  Result.FAliquota                   := DecimalCalculo.Zero;
  Result.FAliquotaEfetiva            := DecimalCalculo.Zero;
  Result.FAliquotaPadraoOuReferencia := DecimalCalculo.Zero;
  Result.FAliquotaReferencia         := DecimalCalculo.Zero;
  Result.FAliquotaAdValorem          := DecimalCalculo.Zero;
  Result.FAliquotaAdRem              := DecimalCalculo.Zero;
  Result.FAjuste                     := DecimalCalculo.Zero;
  Result.FPercentualReducao          := DecimalCalculo.Zero;
  Result.FPRedutorCompraGov          := DecimalCalculo.Zero;
  Result.FPercentualDiferimento      := DecimalCalculo.Zero;
  Result.FBaseCalculo                := DecimalCalculo.Zero;
  Result.FBaseCalculoInformada       := DecimalCalculo.Zero;
  Result.FQuantidade                 := DecimalCalculo.Zero;
  Result.FTributoCalculado           := DecimalCalculo.Zero;
  Result.FImpostoSeletivoInformado   := DecimalCalculo.Zero;
  Result.FImpostoSeletivoCalculado   := DecimalCalculo.Zero;
  Result.FRedutor                    := DecimalCalculo.Zero;
  Result.FPBio                       := DecimalCalculo.Zero;
  Result.FAliquotaAdRemPrincipal     := DecimalCalculo.Zero;
  Result.FAliquotaAdRemSecundaria    := DecimalCalculo.Zero;
  Result.FVariacaoPontoPercentual    := DecimalCalculo.Zero;
end;

{ VariaveisAvaliadorBuilder }

class function VariaveisAvaliadorBuilder.Create: IVariaveisAvaliadorBuilder;
begin
  Result := VariaveisBuilder.Create();
end;

end.
