unit kentro.Api.EnviarMensagem;

interface

type
  TEnviarMensagemKentro = class;

  TEnviarMensagemKentro = class
  private
    FApiKey: string;
    FNumber: string;
    FQueueId: Integer;
    FText: string;
  published
    property ApiKey: string read FApiKey write FApiKey;
    property Number: string read FNumber write FNumber;
    property QueueId: Integer read FQueueId write FQueueId;
    property Text: string read FText write FText;
  end;

implementation

end.
