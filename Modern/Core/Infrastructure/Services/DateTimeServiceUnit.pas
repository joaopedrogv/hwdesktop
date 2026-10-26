unit DateTimeServiceUnit;

interface

uses
  SysUtils,
  TipoComunsUnit;

type
  DateService = class
  public
    class function Parse(Value: TDate; const FormatString: string = 'dd/MM/yyyy'): string; static;
    class function TryISOToDate(const ISOString: string; out DateValue: TDate): Boolean; static;
    class function ISOToDate(const ISOString: string): TDate; static;
    class function FromLocalToDate(const LocalString: string): TDate; static;
    class function FromLocalToDateDef(const LocalString: string; DefaultDate: TDate): TDate; static;
    class function ParseLocal(Value: TDate): string; static;
    class function ParseISO(Value: TDateTime): string; static;
  end;

  DateTimeService = class
  public
    //class function Parse(Value: TDate; const FormatString: string = 'dd/MM/yyyy'): string; static;
    //class function TryISOToDateTime(const ISOString: string; out DateValue: TDate): Boolean; static;
    //class function ISOToDateTime(const ISOString: string): TDate; static;
    class function FromLocalToDateTime(const LocalString: string): TDateTime; static;
    //class function FromLocalToDateTimeDef(const LocalString: string; DefaultDate: TDateTime): TDateTime; static;
    class function ParseLocal(Value: TDateTime): string; static;
    class function Default(const Value, Default: TDateTime): TDateTime; static;
    //class function ParseISO(Value: TDateTime): string; static;
  end;

implementation

uses
  DateUtils;

var
  FSISO: TFormatSettings;
  FSLOCAL: TFormatSettings;

{ DateService }

class function DateService.FromLocalToDate(const LocalString: string): TDate;
begin
  Result := StrToDate( LocalString, FSLOCAL );
end;

class function DateService.FromLocalToDateDef(const LocalString: string; DefaultDate: TDate): TDate;
begin
  Result := StrToDateDef( LocalString, DefaultDate, FSLOCAL );
end;

class function DateService.ISOToDate(const ISOString: string): TDate;
begin
  if not DateService.TryISOToDate(ISOString, Result) then
    raise Exception.Create('Data ISO inválida: ' + ISOString);
end;

class function DateService.Parse(Value: TDate; const FormatString: string): string;
begin
  Result := FormatDateTime(FormatString, Value);
end;


class function DateService.ParseISO(Value: TDateTime): string;
begin
  Result := DateTimeToStr(Value, FSISO);
end;

class function DateService.ParseLocal(Value: TDate): string;
begin
  Result := DateTimeToStr( DateOf(Value), FSLOCAL );
end;

class function DateService.TryISOToDate(const ISOString: string; out DateValue: TDate): Boolean;
var
  Temp: TDateTime;
begin
  Result := TryStrToDateTime(ISOString, Temp, FSISO);
  if Result then
    DateValue := DateOf(Temp);
end;

{ DateTimeService }

class function DateTimeService.Default(const Value, Default: TDateTime): TDateTime;
begin
  if Value > 0 then
    Result := Value
  else
    Result := Default;
end;

class function DateTimeService.FromLocalToDateTime(
  const LocalString: string): TDateTime;
begin
  Result := StrToDateTime( LocalString, FSLOCAL );
end;

class function DateTimeService.ParseLocal(Value: TDateTime): string;
begin
  Result := FormatDateTime( 'dd/MM/yyyy hh:mm:ss', Value, FSLOCAL );
end;

initialization
  with FSISO do
  begin
    ShortDateFormat := 'yyyy-mm-dd';
    ShortTimeFormat := 'hh:mm:ss';
    DateSeparator := '-';
    TimeSeparator := ':';
  end;
  with FSLOCAL do
  begin
    ShortDateFormat := 'dd/MM/yyyy';
    ShortTimeFormat := 'hh:mm:ss';
    DateSeparator := '/';
    TimeSeparator := ':';
  end;

finalization

end.
