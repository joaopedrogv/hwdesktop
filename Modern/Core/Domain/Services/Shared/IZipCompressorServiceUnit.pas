unit IZipCompressorServiceUnit;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  IZipCompressorService = interface
    ['{18736EB3-E026-4A1C-9BFE-BC357D28293B}']
    function Comprimir(const Attachments: TArray<TPair<string,TBytes>>; const FileName: string): TPair<string,TBytes>;
  end;

implementation

end.
