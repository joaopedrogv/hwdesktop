unit BaseSqlLoggerUnit;

interface

uses
  SysUtils, Classes, ISqlLoggerUnit, ParameterValueUnit, TipoComunsUnit;

type

  {$IFDEF INTF_ON}
  BaseSqlLogger = class(TInterfacedObject)
  {$ELSE}
  BaseSqlLogger = class(ISqlLogger)
  {$ENDIF}
  protected
    FOptions: SqlLoggerOptions;
    FSemaphor: IReadWriteSync;
    FQueryStart: TDateTime;
    FCurrentSQL: string;
  {$IFDEF INTF_ON}
    procedure WriteToLog(const Content: string); virtual; abstract;
  {$ENDIF}
    function FormatParams(const Params: ParametersValues): string;
  public                      
  {$IFDEF INTF_ON}        
    procedure BeginQuery(const SQL: string; const Parameters: ParametersValues); overload; virtual;
    procedure BeginQuery(const SQL: string; BatchCount: Integer; const Parameters: ParametersValues); overload; virtual;
    procedure EndQuerySuccess(RowsAffected: Integer = 0); virtual;
    procedure EndQueryError(const Error: string; const Parameters: ParametersValues; BatchIndex: Integer = -1); virtual;
    procedure SetOptions(Options: SqlLoggerOptions = [ loQuery ]); virtual;
  {$ELSE}
    procedure BeginQuery(const SQL: string; const Parameters: ParametersValues); overload; override;
    procedure BeginQuery(const SQL: string; BatchCount: Integer; const Parameters: ParametersValues); overload; override;
    procedure EndQuerySuccess(RowsAffected: Integer = 0); override;
    procedure EndQueryError(const Error: string; const Parameters: ParametersValues; BatchIndex: Integer = -1); override;
    procedure SetOptions(Options: SqlLoggerOptions = [ loQuery ]); override;
  {$ENDIF}
  end;

implementation

uses
  StrUtils, DateUtils;

{ BaseSqlLogger }

procedure BaseSqlLogger.BeginQuery(const SQL: string; const Parameters: ParametersValues);
var
  SParams: string;
begin
  if not (loQuery in FOptions) then Exit;

  FCurrentSQL := SQL;
  FQueryStart := Now;

  WriteToLog(Format('/* BEGIN %s */'#13#10'%s',
    [FormatDateTime('yyyy-MM-dd hh:nn:ss.zzz', FQueryStart), SQL]));

  SParams := FormatParams(Parameters);

  if SParams <> '' then
    WriteToLog(Format('-- Params: [ %s ]', [SParams]));
end;

procedure BaseSqlLogger.EndQuerySuccess(RowsAffected: Integer);
var
  Duration: Double;
  DurationStr: string;
begin
  if not (loQuery in FOptions) then Exit;

  Duration := MilliSecondsBetween(Now, FQueryStart);
  if Duration < 1000 then
    DurationStr := Format('%.0f ms', [Duration])
  else
    DurationStr := Format('%.1f s', [Duration / 1000]);

  WriteToLog(Format('/* END SUCCESS - %s (%d rows) */',
    [DurationStr, RowsAffected]));
  WriteToLog('');
end;

function BaseSqlLogger.FormatParams(const Params: ParametersValues): string;
var
  I: Integer;
  Parts: TArrayString;
  sParams: string;
begin
  Result := '';

  if not (loParam in FOptions) then
    Exit;

  SetLength(Parts, Length(Params));
  for I := 0 to High(Params) do
  begin
    case Params[I].ParamType of
      ptNull:
        sParams := 'NULL';
      ptInteger:
        sParams := IntToStr(Params[I].AsInteger);
      ptInt64:
        {$IFNDEF VER180}
        sParams := IntToStr(Params[I].AsInt64);
        {$ELSE}
        sParams := IntToStr(Params[I].AsInt64);
        {$ENDIF}
      ptCurrency:
        sParams := FloatToStr(Params[I].AsCurrency);
      ptDouble:
        sParams := FloatToStr(Params[I].AsDouble);
      ptString:
        sParams := '''' + Params[I].AsString + '''';
      ptDate:
        sParams := '''' + FormatDateTime('yyyy-mm-dd', Params[I].AsDateTime) + '''';
      ptDateTime:
        sParams := '''' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Params[I].AsDateTime) + '''';
      else
        sParams := 'UNKNOWN';
    end;

    Parts[I] := IfThen( Params[I].Name <> '', Params[I].Name, 'P_' + IntToStr(I) ) + ' = ' + sParams;
  end;

  SParams := '';
  for I := Low(Parts) to High(Parts) do
    SParams := SParams + IfThen(I > 0, ', ') + Parts[I];
//    SParams := SParams + IfThen(I > 0, ', ') + 'P_' + IntToStr(I) + ' = ' + Parts[I];

  Result := sParams;
end;

procedure BaseSqlLogger.SetOptions(Options: SqlLoggerOptions);
begin
  FOptions := Options;
end;

procedure BaseSqlLogger.BeginQuery(const SQL: string; BatchCount: Integer; const Parameters: ParametersValues);
var
  SParams: string;
begin
  if not (loQuery in FOptions) then Exit;

  FCurrentSQL := SQL;
  FQueryStart := Now;

  WriteToLog(Format('/* BEGIN %s */'#13#10'%s',
    [FormatDateTime('yyyy-MM-dd hh:nn:ss.zzz', FQueryStart), SQL]));
  WriteToLog(Format('-- %d records in batch', [BatchCount]));

  SParams := FormatParams(Parameters);

  if SParams <> '' then
    WriteToLog(Format('-- Params: [ %s ]', [SParams]));
end;

procedure BaseSqlLogger.EndQueryError(const Error: string; const Parameters: ParametersValues; BatchIndex: Integer);
var
  Duration: Double;
  DurationStr: string;
  SParams: string;
  //AParams: TArrayString;
  //I: Integer;
begin
  if not (loQuery in FOptions) then Exit;

  Duration := MilliSecondsBetween(Now, FQueryStart);
  if Duration < 1000 then
    DurationStr := Format('%.0f ms', [Duration])
  else
    DurationStr := Format('%.1f s', [Duration / 1000]);

  // Sempre loga os parametros nos erros
  if (BatchIndex >= 0) or
    not (loParam in FOptions) then // Paramtros já logados em BeginQuery nao precisam ser logados novamente
  begin
    SParams := FormatParams(Parameters);

    if SParams <> '' then
      WriteToLog(Format('-- Params: [ %s ]', [SParams]));
  end;

  WriteToLog(Format('/* END ERROR - %s */'#13#10'-- %s',
    [DurationStr, Error]));
  WriteToLog('');
end;

end.


