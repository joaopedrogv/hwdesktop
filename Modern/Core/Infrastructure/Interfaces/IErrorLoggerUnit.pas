unit IErrorLoggerUnit;

interface

type      
  {$IFDEF INTF_ON}  
  IErrorLogger = interface
    ['{0C305D50-F208-4402-915C-9909DCD873B4}']
    procedure LogError(const Value: string);
  end;
  {$ELSE}
  IErrorLogger = class abstract
  public
    procedure LogError(const Value: string); overload; virtual; abstract;
    procedure LogError(const Value: string; const Args: array of const); overload; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
