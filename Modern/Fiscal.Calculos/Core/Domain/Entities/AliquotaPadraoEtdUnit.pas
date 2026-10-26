unit AliquotaPadraoEtdUnit;

interface

uses
  TipoComunsUnit, AliquotaReferenciaEtdUnit, IntegerNullableUnit, DateAndTimeNullableUnit;

type
  AliquotaPadraoFormaAplicacao = (faSubstituicao, faAcrescimo, faDecrescimo);

  AliquotaPadraoEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FFormaAplicacao: AliquotaPadraoFormaAplicacao;
    FValor: Currency;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FAliquotaReferenciaId: Integer;
    FAliquotaReferencia: AliquotaReferenciaEtd;
    FMunicipioId: IntegerNullable;
    FUfId: IntegerNullable;
  public
    class function NullInstance(): AliquotaPadraoEtd; static;

    class function Create(
      Id: Integer;
      FormaAplicacao: AliquotaPadraoFormaAplicacao;
      Valor: Currency;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      AliquotaReferencia: AliquotaReferenciaEtd;
      const MunicipioId: IntegerNullable;
      const UfId: IntegerNullable
    ): AliquotaPadraoEtd; static;

    class function CreateEtd(
      Id: Integer;
      FormaAplicacao: AliquotaPadraoFormaAplicacao;
      Valor: Currency;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      AliquotaReferenciaId: Integer;
      const MunicipioId: IntegerNullable;
      const UfId: IntegerNullable
    ): AliquotaPadraoEtd; static;

    function IsNull(): Boolean;
    function GetValorAplicavel(): Currency;

    property Id: Integer read FId;
    property FormaAplicacao: AliquotaPadraoFormaAplicacao read FFormaAplicacao;
    property Valor: Currency read FValor;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property AliquotaReferenciaId: Integer read FAliquotaReferenciaId;
    property AliquotaReferencia: AliquotaReferenciaEtd read FAliquotaReferencia;
    property MunicipioId: IntegerNullable read FMunicipioId;
    property UfId: IntegerNullable read FUfId;
  end;

  AliquotasPadraoEtd = array of AliquotaPadraoEtd;

  AliquotaPadraoFormaAplicacaoUtils = class
  public
    class function FromString(const Value: string): AliquotaPadraoFormaAplicacao;
    class function FromEnum(const Value: AliquotaPadraoFormaAplicacao): string;
  end;

implementation

uses
  SysUtils, StrUtils;

const
  AliquotaPadraoFormaAplicacaoStr: array[AliquotaPadraoFormaAplicacao] of string =
   ( 'SUBSTITUICAO', 'ACRESCIMO', 'DECRESCIMO' );

{ AliquotaPadraoEtd }

class function AliquotaPadraoEtd.Create(
  Id: Integer;
  FormaAplicacao: AliquotaPadraoFormaAplicacao;
  Valor: Currency;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  AliquotaReferencia: AliquotaReferenciaEtd;
  const MunicipioId: IntegerNullable;
  const UfId: IntegerNullable
): AliquotaPadraoEtd;
begin
  Result.FId := Id;
  Result.FFormaAplicacao := FormaAplicacao;
  Result.FValor := Valor;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FAliquotaReferencia := AliquotaReferencia;
  Result.FMunicipioId := MunicipioId;
  Result.FUfId := UfId;
  Result.FInstance := riNotNull;
end;

function AliquotaPadraoEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function AliquotaPadraoEtd.NullInstance: AliquotaPadraoEtd;
begin
  Result.FInstance := riNull;
end;

class function AliquotaPadraoEtd.CreateEtd(Id: Integer; FormaAplicacao: AliquotaPadraoFormaAplicacao; Valor: Currency;
  InicioVigencia: TDate; const FimVigencia: DateNullable; AliquotaReferenciaId: Integer; const MunicipioId,
  UfId: IntegerNullable): AliquotaPadraoEtd;
begin
  Result.FId := Id;
  Result.FFormaAplicacao := FormaAplicacao;
  Result.FValor := Valor;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FAliquotaReferenciaId := AliquotaReferenciaId;
  Result.FMunicipioId := MunicipioId;
  Result.FUfId := UfId;
  Result.FInstance := riNotNull;
end;

function AliquotaPadraoEtd.GetValorAplicavel(): Currency;
begin
  case FFormaAplicacao of
    faSubstituicao:
      Result := FValor;
    faAcrescimo:
      Result := FAliquotaReferencia.Valor + FValor;
    faDecrescimo:
      Result := FAliquotaReferencia.Valor - FValor;
  else
    raise Exception.Create('Forma de aplicação não definida');
  end;
end;

{ AliquotaPadraoFormaAplicacaoUtils }

class function AliquotaPadraoFormaAplicacaoUtils.FromEnum(const Value: AliquotaPadraoFormaAplicacao): string;
begin
  Result := AliquotaPadraoFormaAplicacaoStr[Value];
end;

class function AliquotaPadraoFormaAplicacaoUtils.FromString(const Value: string): AliquotaPadraoFormaAplicacao;
begin
  Result := AliquotaPadraoFormaAplicacao( IndexText(Value, AliquotaPadraoFormaAplicacaoStr) );
end;

end.
