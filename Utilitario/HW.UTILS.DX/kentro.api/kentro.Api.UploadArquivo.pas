unit kentro.Api.UploadArquivo;

interface

type
  TUploadArquivoKentro = class;

  TUploadArquivoKentro = class
  private
    FApiKey: string;
    FData: string;
    FDuration: Integer;
    FFileName: string;
    FHeight: Integer;
    FMimeType: string;
    FQueueId: Integer;
    FSaveToGallery: Boolean;
    FTitle: string;
    FWidth: Integer;
  published
    property ApiKey: string read FApiKey write FApiKey;
    property Data: string read FData write FData;
    property Duration: Integer read FDuration write FDuration;
    property FileName: string read FFileName write FFileName;
    property Height: Integer read FHeight write FHeight;
    property MimeType: string read FMimeType write FMimeType;
    property QueueId: Integer read FQueueId write FQueueId;
    property SaveToGallery: Boolean read FSaveToGallery write FSaveToGallery;
    property Title: string read FTitle write FTitle;
    property Width: Integer read FWidth write FWidth;
  end;

implementation

end.
