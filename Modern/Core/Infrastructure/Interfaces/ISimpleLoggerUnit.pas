unit ISimpleLoggerUnit;

interface

type
  ISimpleLogger = interface
    ['{34D5F03A-01A7-4ED8-915D-293B7502DB1E}']
    procedure Log(const Value: string); overload;
    procedure Log(const Value: string; const Args: array of const); overload;
  end;

implementation

end.
