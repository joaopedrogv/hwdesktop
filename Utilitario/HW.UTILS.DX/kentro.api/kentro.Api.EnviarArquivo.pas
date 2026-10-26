unit kentro.Api.EnviarArquivo;

interface

type
  TEnviarArquivoKentro = class;

  TEnviarArquivoKentro = class
  private
    FApiKey: string;
    FFileId: Integer;
    FNumber: string;
    FQueueId: Integer;
  published
    property ApiKey: string read FApiKey write FApiKey;
    property FileId: Integer read FFileId write FFileId;
    property Number: string read FNumber write FNumber;
    property QueueId: Integer read FQueueId write FQueueId;
  end;

implementation

end.
