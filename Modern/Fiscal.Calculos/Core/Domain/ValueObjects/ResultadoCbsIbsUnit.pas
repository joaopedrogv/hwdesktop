unit ResultadoCbsIbsUnit;

interface

uses
  ReducaoAliquotaModelUnit,
  ResultadoTributacaoRegularUnit,
  DiferimentoModelUnit,
  ResultadoGrupoMonofasiaUnit,
  TributacaoCompraGovernamentalModelUnit,
  TipoComunsUnit,
  DoubleNullableUnit;

type

  /// <summary>
  ///   Resultado temporario do calculo do CBS e IBS
  ///   <p>Equivale a CbsIbsOutput.java</p>
  /// </summary>
  ResultadoCbsIbs = record
  private
    FInstance: RecordInstance;
    FAliquota: Double;
    FBaseCalculo: DoubleNullable;
    FQuantidade: Currency;
    FTributoCalculado: Double;
    FTributoDevido: Double;
    FGrupoReducao: ReducaoAliquotaModel;
    FTributacaoRegular: ResultadoTributacaoRegular;
    FCompraGovernamental: TributacaoCompraGovernamentalModel;
    FGrupoDiferimento: DiferimentoModel;
    FGrupoMonofasia: ResultadoGrupoMonofasia;
    FMemoriaCalculo: string;
  public
    class function NullInstance(): ResultadoCbsIbs; static;
    class function Create(
      Aliquota: Double;
      const BaseCalculo: DoubleNullable;
      Quantidade: Currency;
      TributoCalculado: Double;
      TributoDevido: Double;
      const GrupoReducao: ReducaoAliquotaModel;
      const TributacaoRegular: ResultadoTributacaoRegular;
      const CompraGovernamental: TributacaoCompraGovernamentalModel;
      const GrupoDiferimento: DiferimentoModel;
      const GrupoMonofasia: ResultadoGrupoMonofasia;
      const MemoriaCalculo: string
    ): ResultadoCbsIbs; static;

    procedure SetMemoriaCalculo(const Value: string);
    procedure SetGrupoReducao(const Value: ReducaoAliquotaModel);
    procedure SetTributoDevido(const Value: Double);
    procedure SetTributacaoRegular(const Value: ResultadoTributacaoRegular);
    function IsNull(): Boolean;
    /// <summary>Retorna true somente quando compraGovernamental nao e nulo.</summary>
    function PossuiCompraGov(): Boolean;

    property Aliquota: Double read FAliquota;
    property BaseCalculo: DoubleNullable read FBaseCalculo;
    property Quantidade: Currency read FQuantidade;
    property TributoCalculado: Double read FTributoCalculado;
    property TributoDevido: Double read FTributoDevido;
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
  Aliquota: Double;
  const BaseCalculo: DoubleNullable;
  Quantidade: Currency;
  TributoCalculado: Double;
  TributoDevido: Double;
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

procedure ResultadoCbsIbs.SetTributoDevido(const Value: Double);
begin
  FTributoDevido := Value;
end;

procedure ResultadoCbsIbs.SetTributacaoRegular(const Value: ResultadoTributacaoRegular);
begin
  FTributacaoRegular := Value;
end;

end.