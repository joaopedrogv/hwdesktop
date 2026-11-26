// Java: source/src/main/java/br/gov/serpro/rtc/api/model/output/CbsIbsOutput.java
// Mapeamento: valores publicados em Currency/CurrencyNullable, sem Double
// Decisao: DEC-05

unit ResultadoCbsIbsUnit;

interface

uses
  ReducaoAliquotaModelUnit,
  ResultadoTributacaoRegularUnit,
  DiferimentoModelUnit,
  ResultadoGrupoMonofasiaUnit,
  TributacaoCompraGovernamentalModelUnit,
  TipoComunsUnit,
  CurrencyNullableUnit;

type

  /// <summary>
  ///   Resultado temporario do calculo do CBS e IBS
  ///   <p>Equivale a CbsIbsOutput.java</p>
  /// </summary>
  ResultadoCbsIbs = record
  private
    FInstance: RecordInstance;
    FAliquota: Currency;
    FBaseCalculo: CurrencyNullable;
    FQuantidade: Currency;
    FTributoCalculado: Currency;
    FTributoDevido: Currency;
    FGrupoReducao: ReducaoAliquotaModel;
    FTributacaoRegular: ResultadoTributacaoRegular;
    FCompraGovernamental: TributacaoCompraGovernamentalModel;
    FGrupoDiferimento: DiferimentoModel;
    FGrupoMonofasia: ResultadoGrupoMonofasia;
    FMemoriaCalculo: string;
  public
    class function NullInstance(): ResultadoCbsIbs; static;
    class function Create(
      Aliquota: Currency;
      const BaseCalculo: CurrencyNullable;
      Quantidade: Currency;
      TributoCalculado: Currency;
      TributoDevido: Currency;
      const GrupoReducao: ReducaoAliquotaModel;
      const TributacaoRegular: ResultadoTributacaoRegular;
      const CompraGovernamental: TributacaoCompraGovernamentalModel;
      const GrupoDiferimento: DiferimentoModel;
      const GrupoMonofasia: ResultadoGrupoMonofasia;
      const MemoriaCalculo: string
    ): ResultadoCbsIbs; static;

    procedure SetMemoriaCalculo(const Value: string);
    procedure SetGrupoReducao(const Value: ReducaoAliquotaModel);
    procedure SetTributoDevido(const Value: Currency);
    procedure SetTributacaoRegular(const Value: ResultadoTributacaoRegular);
    function IsNull(): Boolean;
    /// <summary>Retorna true somente quando compraGovernamental nao e nulo.</summary>
    function PossuiCompraGov(): Boolean;

    property Aliquota: Currency read FAliquota;
    property BaseCalculo: CurrencyNullable read FBaseCalculo;
    property Quantidade: Currency read FQuantidade;
    property TributoCalculado: Currency read FTributoCalculado;
    property TributoDevido: Currency read FTributoDevido;
    property GrupoReducao: ReducaoAliquotaModel read FGrupoReducao;
    property TributacaoRegular: ResultadoTributacaoRegular read FTributacaoRegular;
    property CompraGovernamental: TributacaoCompraGovernamentalModel read FCompraGovernamental;
    property GrupoDiferimento: DiferimentoModel read FGrupoDiferimento;
    property GrupoMonofasia: ResultadoGrupoMonofasia read FGrupoMonofasia;
    property MemoriaCalculo: string read FMemoriaCalculo;
  end;

implementation

{ ResultadoCbsIbs }

class function ResultadoCbsIbs.Create(
  Aliquota: Currency;
  const BaseCalculo: CurrencyNullable;
  Quantidade: Currency;
  TributoCalculado: Currency;
  TributoDevido: Currency;
  const GrupoReducao: ReducaoAliquotaModel;
  const TributacaoRegular: ResultadoTributacaoRegular;
  const CompraGovernamental: TributacaoCompraGovernamentalModel;
  const GrupoDiferimento: DiferimentoModel;
  const GrupoMonofasia: ResultadoGrupoMonofasia;
  const MemoriaCalculo: string
): ResultadoCbsIbs;
begin
  Result.FAliquota := Aliquota;
  Result.FBaseCalculo := BaseCalculo;
  Result.FQuantidade := Quantidade;
  Result.FTributoCalculado := TributoCalculado;
  Result.FTributoDevido := TributoDevido;
  Result.FGrupoReducao := GrupoReducao;
  Result.FTributacaoRegular := TributacaoRegular;
  Result.FCompraGovernamental := CompraGovernamental;
  Result.FGrupoDiferimento := GrupoDiferimento;
  Result.FGrupoMonofasia := GrupoMonofasia;
  Result.FMemoriaCalculo := MemoriaCalculo;
  Result.FInstance := riNotNull;
end;

function ResultadoCbsIbs.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function ResultadoCbsIbs.PossuiCompraGov: Boolean;
begin
  Result := not FCompraGovernamental.IsNull();
end;

class function ResultadoCbsIbs.NullInstance: ResultadoCbsIbs;
begin
  Result.FInstance := riNull;
  Result.FCompraGovernamental := TributacaoCompraGovernamentalModel.NullInstance();
end;

procedure ResultadoCbsIbs.SetMemoriaCalculo(const Value: string);
begin
  FMemoriaCalculo := Value;
end;

procedure ResultadoCbsIbs.SetGrupoReducao(const Value: ReducaoAliquotaModel);
begin
  FGrupoReducao := Value;
end;

procedure ResultadoCbsIbs.SetTributoDevido(const Value: Currency);
begin
  FTributoDevido := Value;
end;

procedure ResultadoCbsIbs.SetTributacaoRegular(const Value: ResultadoTributacaoRegular);
begin
  FTributacaoRegular := Value;
end;

end.