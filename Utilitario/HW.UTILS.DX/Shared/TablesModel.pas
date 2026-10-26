unit TablesModel;

interface

uses
  System.Classes;

type
  TField = class//(TPersistent)
  private
    Fname: string;
  published
    property name: string read Fname write Fname;
  end;

  TTable = class//(TPersistent)
  private
    Fname: string;
    FfieldNames: TArray<string>;
//    FfieldProps: TArray<TField>;
  published
    property name: string read Fname write Fname;
    property fieldNames: TArray<string> read FfieldNames write FfieldNames;
//    property fieldProps: TArray<TField> read FfieldProps write FfieldProps;
  end;

implementation

end.
