unit IndicadorOpNbsClassificacaoEtdUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/model/entity/IndicadorOpNbsClassificacao.java

interface

uses
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  /// <summary>
  ///   Entidade da tabela RTC_CLASSIF_NBS_INDOP_LC que relaciona NBS, indicador
  ///   de operacao, lista de servicos e classificacao tributaria para operacoes
  ///   de servicos em NFS-e.
  ///   Equivale a IndicadorOpNbsClassificacao.java (CNIL_LSLC_CD, CNIL_NBS_CD,
  ///   CNIL_IOIC_ID, CNIL_CLTR_ID, CNIL_IN_PS_ONEROSA, CNIL_IN_ADQ_EXTERIOR e
  ///   CNIL_INICIO_VIGENCIA obrigatorios; CNIL_FIM_VIGENCIA opcional).
  /// </summary>
  IndicadorOpNbsClassificacaoEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FListaServicosCd: string;
    FNbsCd: string;
    FIndiceOperacaoId: Integer;
    FClassificacaoTributariaId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FInPrestacaoOnerosa: Boolean;
    FInAquisicaoExterior: Boolean;
  public
    class function NullInstance(): IndicadorOpNbsClassificacaoEtd; static;

    class function CreateEtd(
      Id: Integer;
      const ListaServicosCd: string;
      const NbsCd: string;
      IndiceOperacaoId: Integer;
      ClassificacaoTributariaId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      InPrestacaoOnerosa: Boolean;
      InAquisicaoExterior: Boolean
    ): IndicadorOpNbsClassificacaoEtd; static;

    function IsNull(): Boolean;

    function Clone(): IndicadorOpNbsClassificacaoEtd;

    property Id: Integer read FId;
    property ListaServicosCd: string read FListaServicosCd;
    property NbsCd: string read FNbsCd;
    property IndiceOperacaoId: Integer read FIndiceOperacaoId;
    property ClassificacaoTributariaId: Integer read FClassificacaoTributariaId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property InPrestacaoOnerosa: Boolean read FInPrestacaoOnerosa;
    property InAquisicaoExterior: Boolean read FInAquisicaoExterior;
  end;

  IndicadoresOpNbsClassificacaoEtd = array of IndicadorOpNbsClassificacaoEtd;

implementation

{ IndicadorOpNbsClassificacaoEtd }

function IndicadorOpNbsClassificacaoEtd.Clone: IndicadorOpNbsClassificacaoEtd;
begin
  Result.FInstance := FInstance;
  Result.FId := FId;
  Result.FListaServicosCd := FListaServicosCd;
  Result.FNbsCd := FNbsCd;
  Result.FIndiceOperacaoId := FIndiceOperacaoId;
  Result.FClassificacaoTributariaId := FClassificacaoTributariaId;
  Result.FInicioVigencia := FInicioVigencia;
  Result.FFimVigencia := FFimVigencia;
  Result.FInPrestacaoOnerosa := FInPrestacaoOnerosa;
  Result.FInAquisicaoExterior := FInAquisicaoExterior;
end;

class function IndicadorOpNbsClassificacaoEtd.CreateEtd(
  Id: Integer;
  const ListaServicosCd: string;
  const NbsCd: string;
  IndiceOperacaoId: Integer;
  ClassificacaoTributariaId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  InPrestacaoOnerosa: Boolean;
  InAquisicaoExterior: Boolean
): IndicadorOpNbsClassificacaoEtd;
begin
  Result.FInstance := riNotNull;
  Result.FId := Id;
  Result.FListaServicosCd := ListaServicosCd;
  Result.FNbsCd := NbsCd;
  Result.FIndiceOperacaoId := IndiceOperacaoId;
  Result.FClassificacaoTributariaId := ClassificacaoTributariaId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FInPrestacaoOnerosa := InPrestacaoOnerosa;
  Result.FInAquisicaoExterior := InAquisicaoExterior;
end;

function IndicadorOpNbsClassificacaoEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function IndicadorOpNbsClassificacaoEtd.NullInstance: IndicadorOpNbsClassificacaoEtd;
begin
  Result.FInstance := riNull;
end;

end.
