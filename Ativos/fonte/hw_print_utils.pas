unit hw_print_utils;

interface

type
  PrintHelper = class
  public
    class function GetDefaultPrinter(): string;
  end;

implementation

uses
  StrUtils,
  Printers,
  hw_win_utils;

{ PrintHelper }

class function PrintHelper.GetDefaultPrinter: string;
var
  printPrefix, printIdentify: string;
  I: Integer;
begin

  if IniConf.ReadStr('Sistema', 'TSPlus', '') = 'S' then
  begin
    printPrefix   := IniConf.ReadStr('Sistema', 'TSPlusPrintPrefix'  , 'Universal');
    printIdentify := IniConf.ReadStr('Sistema', 'TSPlusPrintIdentify', 'redirecionada');

    for I := 0 to Printer.Printers.Count - 1 do
      if StartsText(printPrefix, Printer.Printers[I])
        and ContainsText(Printer.Printers[I], printIdentify) then
      begin
        Result := Printer.Printers[I];
        Exit;
      end;
  end;

  Printer.PrinterIndex := -1;
  Result :=  Printer.Printers[Printer.PrinterIndex];

end;

end.
