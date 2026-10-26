unit ScalarResultUnit;

interface

type
  ScalarResultTypeEnum = (srtNull, srtString, srtDateTime, srtDouble, srtCurrency, srtInt, srtBool);
  ScalarResult = record
  private
    FValue: string;
    FIsNull: Boolean;
    FDataType: ScalarResultTypeEnum;
  public
    class function FromString(const Value: string): ScalarResult; static;
    class function FromDateTime(const Value: TDateTime): ScalarResult; static;
		class function FromDouble(const Value: Double): ScalarResult; static;
		class function FromCurrency(const Value: Currency): ScalarResult; static;
    class function FromInt(const Value: Int64): ScalarResult; static;
    class function FromBool(const Value: Boolean): ScalarResult; static;
    class function Null: ScalarResult; static;

    function AsString: string;
    function AsInteger: Integer;
    function AsInt64: Int64;
    function AsFloat: Double;
    function AsCurrency: Currency;
    function AsDateTime: TDateTime;
    function AsBoolean: Boolean;
    function IsNull: Boolean;

    property DataType: ScalarResultTypeEnum read FDataType;
  end;

implementation

uses
  SysUtils, StrUtils;

var
  FSISO: TFormatSettings;

{ ScalarResult }

class function ScalarResult.FromBool(const Value: Boolean): ScalarResult;
begin
  Result.FValue := BoolToStr(Value, True);
  Result.FIsNull := False;
  Result.FDataType := srtBool;
end;

class function ScalarResult.FromCurrency(const Value: Currency): ScalarResult;
begin
  Result.FValue := CurrToStr(Value);
	Result.FIsNull := False;
  Result.FDataType := srtCurrency;
end;

class function ScalarResult.FromDateTime(const Value: TDateTime): ScalarResult;
begin
  Result.FValue := DateTimeToStr( Value, FSISO );
  Result.FIsNull := False;
  Result.FDataType := srtDateTime;
end;

class function ScalarResult.FromDouble(const Value: Double): ScalarResult;
begin
	Result.FValue := FloatToStr(Value);
  Result.FIsNull := False;
  Result.FDataType := srtDouble;
end;

class function ScalarResult.FromInt(const Value: Int64): ScalarResult;
begin
  Result.FValue := IntToStr(Value);
  Result.FIsNull := False;
  Result.FDataType := srtInt;
end;

class function ScalarResult.FromString(const Value: string): ScalarResult;
begin
  Result.FValue := Value;
  Result.FIsNull := False;
  Result.FDataType := srtString;
end;

function ScalarResult.IsNull: Boolean;
begin
  Result := FIsNull;
end;

class function ScalarResult.Null: ScalarResult;
begin
  Result.FValue := '';
  Result.FIsNull := True;
  Result.FDataType := srtNull;
end;

function ScalarResult.AsString: string;
begin
  if FIsNull then
    Result := ''
  else
    Result := FValue;
end;

function ScalarResult.AsInt64: Int64;
begin
  if FIsNull then
    Result := 0
  else
    Result := StrToInt64Def(FValue, 0);
end;

function ScalarResult.AsInteger: Integer;
begin
  if FIsNull then
    Result := 0
  else
    Result := StrToIntDef(FValue, 0);
end;

function ScalarResult.AsBoolean: Boolean;
begin
  Result := MatchText(FValue, ['1', 'true', 'sim']);
end;

function ScalarResult.AsCurrency: Currency;
begin
  if FIsNull then
    Result := 0.0
  else
    Result := StrToCurrDef(FValue, 0.0);
end;

function ScalarResult.AsDateTime: TDateTime;
begin
  if FIsNull then
    Result := 0
  else
    Result := StrToDateTime( FValue, FSISO );
end;

function ScalarResult.AsFloat: Double;
begin
  if FIsNull then
    Result := 0.0
  else
    Result := StrToFloatDef(FValue, 0.0);
end;

initialization
  with FSISO do
  begin
    ShortDateFormat := 'yyyy-mm-dd';
    DateSeparator := '-';
    TimeSeparator := ':';
  end;

finalization

end.
