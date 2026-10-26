unit BoletoModel;

interface

uses
  System.Classes;

type
  TBoletoPdfBase64Model = class(TPersistent)
  private
    FnSeqBol: Integer;
    FidIntegracao: string;
    FpdfBase64: string;
  published
    property nSeqBol: Integer read FnSeqBol write FnSeqBol;
    property idIntegracao: string read FidIntegracao write FidIntegracao;
    property pdfBase64: string read FpdfBase64 write FpdfBase64;
  end;

implementation

end.
