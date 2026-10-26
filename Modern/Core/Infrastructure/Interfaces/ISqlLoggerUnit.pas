unit ISqlLoggerUnit;

interface

uses ParameterValueUnit;

type
  SqlLoggerOption = (loQuery, loParam);
  SqlLoggerOptions = set of SqlLoggerOption;
                    
  {$IFDEF INTF_ON}
  ISqlLogger = interface
    ['{51A57979-0037-4786-99DC-65491B89F8C4}']
    procedure BeginQuery(const SQL: string; const Parameters: ParametersValues); overload;
    procedure BeginQuery(const SQL: string; BatchCount: Integer; const Parameters: ParametersValues); overload;
    procedure EndQuerySuccess(RowsAffected: Integer = 0);
    procedure EndQueryError(const Error: string; const Parameters: ParametersValues; BatchIndex: Integer = -1);
    procedure SetOptions(Options: SqlLoggerOptions = [ loQuery ]);
    procedure WriteToLog(const Content: string);
  end;
  {$ELSE}
  ISqlLogger = class abstract
  public
    procedure BeginQuery(const SQL: string; const Parameters: ParametersValues); overload; virtual; abstract;
    procedure BeginQuery(const SQL: string; BatchCount: Integer; const Parameters: ParametersValues); overload; virtual; abstract;
    procedure EndQuerySuccess(RowsAffected: Integer = 0); virtual; abstract;
    procedure EndQueryError(const Error: string; const Parameters: ParametersValues; BatchIndex: Integer = -1); virtual; abstract;
    procedure SetOptions(Options: SqlLoggerOptions = [ loQuery ]); virtual; abstract;
    procedure WriteToLog(const Content: string); virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
