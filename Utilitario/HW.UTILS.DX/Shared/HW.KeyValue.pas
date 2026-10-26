unit HW.KeyValue;

interface

type
  TKeyValue = class
  private
    FKey: string;
    FValue: string;
  published
    property Key: string read FKey write FKey;
    property Value: string read FValue write FValue;
  end;

implementation

end.
