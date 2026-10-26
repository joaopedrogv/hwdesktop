unit ArquivoDownloadModel;

interface

type
  ArquivoDownload = record
  private
    FName: string;
    FLink: string;
    FHash: string;
  public
    class function Create( const AName, ALink, AHash: string ): ArquivoDownload; static;
    property Name: string read FName;
    property Link: string read FLink;
    property Hash: string read FHash;
  end;

implementation

{ ArquivoDownload }

class function ArquivoDownload.Create(const AName, ALink, AHash: string): ArquivoDownload;
begin
  Result.FName := AName;
  Result.FLink := ALink;
  Result.FHash := AHash;
end;

end.
