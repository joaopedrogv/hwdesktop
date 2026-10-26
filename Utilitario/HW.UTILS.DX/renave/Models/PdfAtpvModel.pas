unit PdfAtpvModel;

interface

uses
  SYstem.Classes;

type

  TPdfAtpvModel = class(TPersistent)
  private
    FnumeroAtpv: string;
    FpdfAtpvBase64: string;
    FxmlAtpvBase64: string;
  published
    property numeroAtpv: string read FnumeroAtpv write FnumeroAtpv;
    property pdfAtpvBase64: string read FpdfAtpvBase64 write FpdfAtpvBase64;
    property xmlAtpvBase64: string read FxmlAtpvBase64 write FxmlAtpvBase64;
  end;

implementation

end.
