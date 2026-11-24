unit DataSetFieldDefinitionUnit;

interface

uses
  DB;

type
  TDataSetFieldDefinition = record
    Name: string;
    DataType: TFieldType;
    Size: Integer;
    Precision: Integer;
    Scale: Integer;
  end;

  TDataSetFieldDefinitions = array of TDataSetFieldDefinition;

implementation

end.
