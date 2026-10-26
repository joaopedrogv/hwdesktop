unit Types_OOP;

interface

type

  LogStore = record
    filename: string;
    timeStarted: TDateTime;
  end;

  ScalarValue = record
    Value: Variant;
    AsString: string;
    AsInteger: Integer;
    AsFloat: Double;
    AsCurrency: Currency;
    AsDateTime: TDateTime;
    AsTime: TDateTime;
    AsDate: TDateTime;
  end;

implementation

end.
