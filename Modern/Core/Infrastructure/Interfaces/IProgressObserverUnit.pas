unit IProgressObserverUnit;

interface

type
  IProgressObserver = interface
    ['{E6951B84-0554-4412-BD5E-12FD7B9F6CE0}']
    procedure OnMessage(const Message: string);
    procedure OnWarning(const Warning: string);
    procedure OnError(const Error: string);

    /// <summary>
    ///   Progresso em percentual de 1 a 100
    /// </summary>
    procedure OnProgress(Progress: Integer);
    procedure OnCounter(Current, Total: Integer);

    // Chamada de star do processos
    procedure OnStart;
    // Conclusao do processamento
    procedure OnComplete;
    // Processamento cancelado
    procedure OnCancel;

    // Pedido de cancelamento
    procedure CancelRequest;

    // Permite que o caso de uso verifique se deve parar
    function IsCancellationRequested: Boolean;
  end;

implementation

end.
