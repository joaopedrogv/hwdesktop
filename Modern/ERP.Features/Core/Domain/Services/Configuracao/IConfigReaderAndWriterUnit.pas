unit IConfigReaderAndWriterUnit;

interface

type

  IConfigReader = interface
    ['{473D72D9-2449-4863-B384-FB98F1D15860}']
    function ReadString(const Section, Ident: string; DefaultValue: string = ''): string;
    function ReadInteger(const Section, Ident: string; DefaultValue: Integer = 0): Integer;
    function ReadBool(const Section, Ident: string; DefaultValue: Boolean): Boolean;
  end;

  IConfigWriter = interface
    ['{C7DA4F39-A3EA-4812-909B-C11250AB80AE}']
    procedure WriteString(const Section, Ident: string; Value: string);
    procedure WriteInteger(const Section, Ident: string; Value: Integer);
    function GetStrings(): string;
  end;

implementation

end.
