unit IIbptReaderUnit;

interface

uses
  ItemIbptEtdUnit;

type

  IbptReaderInput = record
  private
    FFileName: string;
    FUF: string;
  public
    class function Create(const AFileName, AUF: string): IbptReaderInput; static;
    property FileName: string read FFileName;
    property UF: string read FUF;
  end;

  IIbptReader = interface
    ['{4B6C8464-C7A0-4938-AF22-8D56D36905BF}']
    function ObterItens(const Input: IbptReaderInput): ItemIbptEtdList;
  end;

implementation

{ IbptReaderInput }

class function IbptReaderInput.Create(const AFileName, AUF: string): IbptReaderInput;
begin
  Result.FFileName := AFileName;
  Result.FUF := AUF;
end;

end.
