unit KentroModels;

interface

type
  TMensagemKentro = class;
  TArquivoKentro = class;
  TUploadArquivoKentro = class;

  TMensagemKentro = class
  private
    FapiKey: string;
    Fnumber: string;
    FqueueId: Integer;
    Ftext: string;
  published
    property apiKey: string read FapiKey write FapiKey;
    property number: string read Fnumber write Fnumber;
    property queueId: Integer read FqueueId write FqueueId;
    property text: string read Ftext write Ftext;
  end;

  TArquivoKentro = class
  private
    FapiKey: string;
    Fnumber: string;
    FqueueId: Integer;
    FfileId: Integer;
  published
    property apiKey: string read FapiKey write FapiKey;
    property number: string read Fnumber write Fnumber;
    property queueId: Integer read FqueueId write FqueueId;
    property fileId: Integer read FfileId write FfileId;
  end;

  TMensagemArquivoKentro = class
  private
    FapiKey: string;
    Fnumber: string;
    FqueueId: Integer;
    FfileId: Integer;
    Ftext: string;
  published
    property apiKey: string read FapiKey write FapiKey;
    property number: string read Fnumber write Fnumber;
    property queueId: Integer read FqueueId write FqueueId;
    property fileId: Integer read FfileId write FfileId;
    property text: string read Ftext write Ftext;
  end;

  TUploadKentro = class
  private
    FapiKey: string;
    Fdata: string;
    FfileName: string;
    FmimeType: string;
    FqueueId: Integer;
    FsaveToGallery: Boolean;
    Ftitle: string;
  published
    property apiKey: string read FapiKey write FapiKey;
    property data: string read Fdata write Fdata;
    property fileName: string read FfileName write FfileName;
    property mimeType: string read FmimeType write FmimeType;
    property queueId: Integer read FqueueId write FqueueId;
    property saveToGallery: Boolean read FsaveToGallery write FsaveToGallery;
    property title: string read Ftitle write Ftitle;
  end;

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
