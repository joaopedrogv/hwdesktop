unit BaseDatabaseConnectionUnit;

interface

uses
  IDataBaseConnectionUnit,
  ISqlLoggerUnit, ScalarResultUnit, DB, ParameterValueUnit, TipoComunsUnit, IErrorLoggerUnit;

type
  CreateAndExecuteQueryCmd = (rcOpen, rcExec);
                        
  {$IFDEF INTF_ON}
  BaseDatabaseConnection = class(TInterfacedObject)
  {$ELSE}
  BaseDatabaseConnection = class(IDataBaseConnection)
  {$ENDIF}
  protected
    FOwnsDatabase: Boolean;
    FConnectionString: string;
    FSqlLogger: ISqlLogger;
    FErrorLogger: IErrorLogger;
    FCharSet: string;
    procedure LogError(const Value: string);
    procedure SetCharSet(const Value: string);
    function GetScalarFromField(const Field: TField): ScalarResult; virtual;
  public                                 
  {$IFDEF INTF_ON}
    procedure SetLogger(const SqlLogger: ISqlLogger); overload;
    procedure SetLogger(const ErrorLogger: IErrorLogger); overload;
  {$ELSE}
    procedure SetLogger(const SqlLogger: ISqlLogger); overload; override;
    procedure SetLogger(const ErrorLogger: IErrorLogger); overload; override;
  {$ENDIF}
  end;

implementation

uses
  SysUtils, StrUtils;

{ BaseDatabaseConnection }

function BaseDatabaseConnection.GetScalarFromField(const Field: TField): ScalarResult;
begin
  case Field.DataType of
    ftDate, ftTime, ftDateTime, ftTimeStamp:
      Result := ScalarResult.FromDateTime( Field.AsDateTime );

		ftCurrency:
			Result := ScalarResult.FromCurrency( Field.AsCurrency );

		ftFloat{$IFNDEF VER180}, ftExtended{$ENDIF}:
			Result := ScalarResult.FromDouble( Field.AsFloat );

    {$IFNDEF VER180} ftObject, ftConnection, ftParams, ftStream, {$ENDIF}
    ftInterface, ftIDispatch,
    ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, ftGraphic:
      raise Exception.Create('GetScalarFromField Formato de campo não implementado');

    ftBoolean:
      Result := ScalarResult.FromBool( Field.AsBoolean )

    else
      Result := ScalarResult.FromString( Field.AsString );
  end;
end;

procedure BaseDatabaseConnection.LogError(const Value: string);
begin
  if Assigned(FErrorLogger) then
    FErrorLogger.LogError(Value);
end;

procedure BaseDatabaseConnection.SetCharSet(const Value: string);
begin
  FCharSet := AnsiUpperCase(Value);
end;

procedure BaseDatabaseConnection.SetLogger(const ErrorLogger: IErrorLogger);
begin
  FErrorLogger := ErrorLogger;
end;

procedure BaseDatabaseConnection.SetLogger(const SqlLogger: ISqlLogger);
begin
  FSqlLogger := SqlLogger;
end;

end.

