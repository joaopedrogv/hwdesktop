// Delphi Rio
unit JsonQueryResultUnit;

interface

uses
  System.JSON,
  DateAndTimeNullableUnit,
  IntegerNullableUnit,
  StringNullableUnit,
  DoubleNullableUnit;

type
  /// <summary>
  ///   Superficie de leitura de um unico objeto JSON retornado pela API Datasette,
  ///   equivalente ao QueryResult do fluxo SQLite. Preserva a distincao entre nulo,
  ///   string vazia, zero e falso. Nao possui o objeto JSON: o envelope de paginacao
  ///   e o responsavel pela liberacao (FOwnsJson = False no reader).
  /// </summary>
  JsonQueryResult = class
  private
    FJson: TJSONObject;
    FOwnsJson: Boolean;
    FRowIndex: Integer;

    function ObterValor(const AFieldName: string): TJSONValue;
    function ValorVazio(const AValue: TJSONValue): Boolean;
    function ValorParaString(const AValue: TJSONValue; ATrimSpace: Boolean): string;
    function ValorParaInteger(const AValue: TJSONValue): Integer;
    function ValorParaDouble(const AValue: TJSONValue): Double;
  public
    constructor Create(const AJson: TJSONObject; AOwnsJson: Boolean; ARowIndex: Integer = 0);
    destructor Destroy; override;

    function FieldAsString(const AFieldName: string; ATrimSpace: Boolean = True): string;
    function FieldAsStringNullable(const AFieldName: string; ATrimSpace: Boolean = True): StringNullable;
    function FieldAsInteger(const AFieldName: string): Integer;
    function FieldAsIntNullable(const AFieldName: string): IntegerNullable;
    function FieldAsDouble(const AFieldName: string): Double;
    function FieldAsDoubleNullable(const AFieldName: string): DoubleNullable;
    function FieldAsFloat(const AFieldName: string): Double;
    function FieldAsDate(const AFieldName: string): TDate;
    function FieldAsDateTimeNullable(const AFieldName: string): DateTimeNullable;
    function FieldIsNull(const AFieldName: string): Boolean;
    function FieldIsNullOrWhiteSpace(const AFieldName: string): Boolean;
    function FieldAreEquals(const AFieldName, AValue: string; ATrimSpace: Boolean = True): Boolean; overload;
    function FieldAreEquals(const AFieldName: string; AValue: Integer): Boolean; overload;

    /// <summary>
    ///   Contador explicito de linha, substitui a indexacao DataSet.RecNo - 1 do
    ///   reader SQLite.
    /// </summary>
    property RowIndex: Integer read FRowIndex;
  end;

implementation

uses
  System.SysUtils,
  DateTimeServiceUnit;

var
  FmtJSON: TFormatSettings;

{ JsonQueryResult }

constructor JsonQueryResult.Create(
  const AJson: TJSONObject;
  AOwnsJson: Boolean;
  ARowIndex: Integer
);
begin
  inherited Create;
  FJson := AJson;
  FOwnsJson := AOwnsJson;
  FRowIndex := ARowIndex;
end;

destructor JsonQueryResult.Destroy;
begin
  if FOwnsJson then
    FJson.Free;
  inherited;
end;

function JsonQueryResult.ObterValor(const AFieldName: string): TJSONValue;
begin
  if FJson = nil then
    Exit(nil);

  Result := FJson.GetValue(AFieldName);
end;

function JsonQueryResult.ValorVazio(const AValue: TJSONValue): Boolean;
begin
  Result := (AValue = nil) or (AValue is TJSONNull);
end;

function JsonQueryResult.ValorParaString(const AValue: TJSONValue; ATrimSpace: Boolean): string;
begin
  // TJSONNumber herda de TJSONString: a verificacao de numero precisa vir antes
  // da de string, senao o ramo de numero nunca e alcancado e o valor acaba
  // saindo localizado por TJSONNumber.Value (FloatToStr com a localidade do thread).
  if AValue is TJSONNumber then
    // A API JSON usa "." como separador decimal. Formata sempre com o formato
    // canonico invariante (FmtJSON), independente da localidade do thread, para
    // nao vazar separador decimal localizado nas comparacoes de negocio.
    // Inteiros sem parte fracionaria sao preservados sem casas decimais.
    Result := FormatFloat('0.################', TJSONNumber(AValue).AsDouble, FmtJSON)

  else if AValue is TJSONString then
    Result := TJSONString(AValue).Value

  else if AValue is TJSONBool then
  begin
    if TJSONBool(AValue).AsBoolean then
      Result := '1'
    else
      Result := '0';
  end

  else
    Result := AValue.Value;

  if ATrimSpace then
    Result := Trim(Result);
end;

function JsonQueryResult.ValorParaInteger(const AValue: TJSONValue): Integer;
begin
  if AValue is TJSONNumber then
    Result := TJSONNumber(AValue).AsInt

  else if AValue is TJSONBool then
  begin
    if TJSONBool(AValue).AsBoolean then
      Result := 1
    else
      Result := 0;
  end

  else
    Result := StrToIntDef(Trim(AValue.Value), 0);
end;

function JsonQueryResult.ValorParaDouble(const AValue: TJSONValue): Double;
begin
  if AValue is TJSONNumber then
    Result := TJSONNumber(AValue).AsDouble

  else if AValue is TJSONBool then
  begin
    if TJSONBool(AValue).AsBoolean then
      Result := 1
    else
      Result := 0;
  end

  else
    Result := StrToFloatDef(Trim(AValue.Value), 0, FmtJSON);
end;

function JsonQueryResult.FieldAsString(const AFieldName: string; ATrimSpace: Boolean): string;
var
  Valor: TJSONValue;
begin
  Valor := ObterValor(AFieldName);

  if ValorVazio(Valor) then
    Result := ''
  else
    Result := ValorParaString(Valor, ATrimSpace);
end;

function JsonQueryResult.FieldAsStringNullable(
  const AFieldName: string;
  ATrimSpace: Boolean
): StringNullable;
var
  Valor: TJSONValue;
begin
  Valor := ObterValor(AFieldName);

  if ValorVazio(Valor) then
    Result := StringNullable.NullInstance()
  else
    // String JSON vazia ("") produz valor vazio, porem NAO nulo.
    Result := StringNullable.Create(ValorParaString(Valor, ATrimSpace));
end;

function JsonQueryResult.FieldAsInteger(const AFieldName: string): Integer;
var
  Valor: TJSONValue;
begin
  Valor := ObterValor(AFieldName);

  if ValorVazio(Valor) then
    Result := 0
  else
    Result := ValorParaInteger(Valor);
end;

function JsonQueryResult.FieldAsIntNullable(const AFieldName: string): IntegerNullable;
var
  Valor: TJSONValue;
begin
  Valor := ObterValor(AFieldName);

  if ValorVazio(Valor) then
    Result := IntegerNullable.NullInstance()
  else
    // Numero 0 produz valor 0, porem NAO nulo.
    Result := IntegerNullable.Create(ValorParaInteger(Valor));
end;

function JsonQueryResult.FieldAsDouble(const AFieldName: string): Double;
var
  Valor: TJSONValue;
begin
  Valor := ObterValor(AFieldName);

  if ValorVazio(Valor) then
    Result := 0
  else
    Result := ValorParaDouble(Valor);
end;

function JsonQueryResult.FieldAsDoubleNullable(const AFieldName: string): DoubleNullable;
var
  Valor: TJSONValue;
begin
  Valor := ObterValor(AFieldName);

  if ValorVazio(Valor) then
    Result := DoubleNullable.NullInstance()
  else
    Result := DoubleNullable.Create(ValorParaDouble(Valor));
end;

function JsonQueryResult.FieldAsFloat(const AFieldName: string): Double;
begin
  Result := FieldAsDouble(AFieldName);
end;

function JsonQueryResult.FieldAsDate(const AFieldName: string): TDate;
var
  Valor: string;
begin
  Valor := FieldAsString(AFieldName, True);

  if Valor = '' then
    Result := 0
  else
    Result := DateService.ISOToDate(Valor);
end;

function JsonQueryResult.FieldAsDateTimeNullable(const AFieldName: string): DateTimeNullable;
var
  Valor: string;
begin
  Valor := FieldAsString(AFieldName, True);

  if Valor = '' then
    Result := DateTimeNullable.NullInstance()
  else
    Result := DateTimeNullable.Create(DateService.ISOToDate(Valor));
end;

function JsonQueryResult.FieldIsNull(const AFieldName: string): Boolean;
begin
  Result := ValorVazio(ObterValor(AFieldName));
end;

function JsonQueryResult.FieldIsNullOrWhiteSpace(const AFieldName: string): Boolean;
begin
  Result := FieldIsNull(AFieldName) or (Trim(FieldAsString(AFieldName, False)) = '');
end;

function JsonQueryResult.FieldAreEquals(
  const AFieldName, AValue: string;
  ATrimSpace: Boolean
): Boolean;
begin
  Result := FieldAsString(AFieldName, ATrimSpace) = AValue;
end;

function JsonQueryResult.FieldAreEquals(const AFieldName: string; AValue: Integer): Boolean;
begin
  Result := FieldAsInteger(AFieldName) = AValue;
end;

initialization
  FmtJSON := TFormatSettings.Create;
  FmtJSON.DecimalSeparator := '.';
  FmtJSON.ThousandSeparator := #0;
  FmtJSON.DateSeparator := '-';
  FmtJSON.ShortDateFormat := 'yyyy-mm-dd';

end.
