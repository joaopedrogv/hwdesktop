unit ConfigFactoryUnit;

interface

uses
  IConfigReaderAndWriterUnit,
  Classes;

type
  ConfigFactory = class
  public
    class function IniReader(Config: TStrings): IConfigReader;
    class function IniWriter(Config: TStrings): IConfigWriter;
  end;

implementation

uses
  IniConfigReaderAndWriterUnit;

{ ConfigFactory }

class function ConfigFactory.IniReader(Config: TStrings): IConfigReader;
begin
  Result := IniConfigReaderAndWriter.Create(Config);
end;

class function ConfigFactory.IniWriter(Config: TStrings): IConfigWriter;
begin
  Result := IniConfigReaderAndWriter.Create(Config);
end;

end.
