unit ICSVReaderUnit;

interface

uses
  System.SysUtils;

type
  ICSVRow = interface
    ['{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}']
    function GetFieldByIndex(const Index: Integer): string;
    function GetFieldByName(const Name: string): string;
    function GetColumnCount: Integer;
    function TryGetFieldByName(const Name: string; out Value: string): Boolean;

    property Fields[const Index: Integer]: string read GetFieldByIndex; default;
    property FieldByName[const Name: string]: string read GetFieldByName;
  end;

  CSVEncoding = (
    ceUTF8,
    ceUTF8WithBOM,
    ceASCII,
    ceANSI,
    ceUTF16,
    ceUTF16LE,
    ceUTF16BE
  );

  CSVConfig = record
  private
    class function GetEncodingObject(const Encoding: CSVEncoding): TEncoding; static;
  public
    Separator: Char;
    QuoteChar: Char;
    Encoding: CSVEncoding;
    HasHeader: Boolean;
    SkipEmptyLines: Boolean;
    TrimFields: Boolean;

    class function Default: CSVConfig; static;
    function GetEncoding: TEncoding;
  end;

  ICSVReader = interface
    ['{B2C3D4E5-F6A7-8901-BCDE-F12345678901}']
    function GetColumnNames: TArray<string>;
    function GetColumnCount: Integer;
    procedure Open(const FileName: string; const Config: CSVConfig);
    procedure Close;
    function HasNext: Boolean;
    function Next: ICSVRow;
    function GetCurrentLineNumber: Integer;
    procedure Reset;
    property ColumnNames: TArray<string> read GetColumnNames;
    property ColumnCount: Integer read GetColumnCount;
  end;

  ECSVException = class(Exception)
  public
    constructor Create(const Message: string; const LineNumber: Integer = 0);
  end;

implementation

{ CSVConfig }

class function CSVConfig.Default: CSVConfig;
begin
  Result.Separator := ';';
  Result.QuoteChar := '"';
  Result.Encoding := ceUTF8WithBOM;
  Result.HasHeader := True;
  Result.SkipEmptyLines := True;
  Result.TrimFields := True;
end;

class function CSVConfig.GetEncodingObject(const Encoding: CSVEncoding): TEncoding;
begin
  case Encoding of
    ceUTF8:          Result := TEncoding.UTF8;
    ceUTF8WithBOM:   Result := TEncoding.UTF8;
    ceASCII:         Result := TEncoding.ASCII;
    ceANSI:          Result := TEncoding.Default;
    ceUTF16:         Result := TEncoding.Unicode;
    ceUTF16LE:       Result := TEncoding.BigEndianUnicode;
    ceUTF16BE:       Result := TEncoding.BigEndianUnicode;
  else
    Result := TEncoding.UTF8;
  end;
end;

function CSVConfig.GetEncoding: TEncoding;
begin
  Result := GetEncodingObject(Self.Encoding);
end;

{ ECSVException }

constructor ECSVException.Create(const Message: string; const LineNumber: Integer);
begin
  if LineNumber > 0 then
    inherited CreateFmt('%s (Linha: %d)', [Message, LineNumber])
  else
    inherited Create(Message);
end;

end.
