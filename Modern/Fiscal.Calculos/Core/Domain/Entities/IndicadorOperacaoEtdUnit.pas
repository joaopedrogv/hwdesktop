unit IndicadorOperacaoEtdUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/model/entity/IndicadorOperacao.java

interface

uses
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  LocalIncidenciaEnumUnit;

type
  /// <summary>
  ///   Entidade da tabela RTC_INDICADOR_OPERACAO_IBS_CBS que armazena os
  ///   indicadores de operacao do IBS/CBS, com local de incidencia, tipo de
  ///   operacao e codigo de local de fornecimento DFe.
  ///   Equivale a IndicadorOperacao.java (IOIC_LOCAL_INCIDENCIA e
  ///   IOIC_INICIO_VIGENCIA obrigatorios; IOIC_FIM_VIGENCIA, IOIC_TIPO_OPERACAO,
  ///   IOIC_CD_LOCAL_FORNECIMENTO_DFE e IOIC_CD_LOCAL_INCIDENCIA opcionais).
  ///   IOIC_CD_LOCAL_INCIDENCIA (CodigoLocalIncidencia) coexiste com a string
  ///   IOIC_LOCAL_INCIDENCIA (LocalIncidencia), sem remove-la nem renomea-la.
  /// </summary>
  IndicadorOperacaoEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FCodigo: string;
    FLocalIncidencia: string;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FTipoOperacao: StringNullable;
    FCodigoLocalFornecimentoDfe: IntegerNullable;
    // Tipo qualificado pelo unit porque o parametro LocalIncidencia (string) de
    // CreateEtd oculta o identificador do enum no escopo da rotina.
    FCodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia;
  public
    class function NullInstance(): IndicadorOperacaoEtd; static;

    class function CreateEtd(
      Id: Integer;
      const Codigo: string;
      const LocalIncidencia: string;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      const TipoOperacao: StringNullable;
      const CodigoLocalFornecimentoDfe: IntegerNullable;
      CodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia
    ): IndicadorOperacaoEtd; static;

    function IsNull(): Boolean;

    function Clone(): IndicadorOperacaoEtd;

    property Id: Integer read FId;
    property Codigo: string read FCodigo;
    property LocalIncidencia: string read FLocalIncidencia;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property TipoOperacao: StringNullable read FTipoOperacao;
    property CodigoLocalFornecimentoDfe: IntegerNullable read FCodigoLocalFornecimentoDfe;
    property CodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia read FCodigoLocalIncidencia;
  end;

  IndicadoresOperacaoEtd = array of IndicadorOperacaoEtd;

implementation

{ IndicadorOperacaoEtd }

function IndicadorOperacaoEtd.Clone: IndicadorOperacaoEtd;
begin
  Result.FInstance := FInstance;
  Result.FId := FId;
  Result.FCodigo := FCodigo;
  Result.FLocalIncidencia := FLocalIncidencia;
  Result.FInicioVigencia := FInicioVigencia;
  Result.FFimVigencia := FFimVigencia;
  Result.FTipoOperacao := FTipoOperacao;
  Result.FCodigoLocalFornecimentoDfe := FCodigoLocalFornecimentoDfe;
  Result.FCodigoLocalIncidencia := FCodigoLocalIncidencia;
end;

class function IndicadorOperacaoEtd.CreateEtd(
  Id: Integer;
  const Codigo: string;
  const LocalIncidencia: string;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  const TipoOperacao: StringNullable;
  const CodigoLocalFornecimentoDfe: IntegerNullable;
  CodigoLocalIncidencia: LocalIncidenciaEnumUnit.LocalIncidencia
): IndicadorOperacaoEtd;
begin
  Result.FInstance := riNotNull;
  Result.FId := Id;
  Result.FCodigo := Codigo;
  Result.FLocalIncidencia := LocalIncidencia;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FTipoOperacao := TipoOperacao;
  Result.FCodigoLocalFornecimentoDfe := CodigoLocalFornecimentoDfe;
  Result.FCodigoLocalIncidencia := CodigoLocalIncidencia;
end;

function IndicadorOperacaoEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function IndicadorOperacaoEtd.NullInstance: IndicadorOperacaoEtd;
begin
  Result.FInstance := riNull;
end;

end.
