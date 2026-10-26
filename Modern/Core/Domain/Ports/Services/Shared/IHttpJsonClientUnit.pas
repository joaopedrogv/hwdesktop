unit IHttpJsonClientUnit;

interface

type
  THttpJsonResult = record
    Success: Boolean;
    StatusCode: Integer;
    Content: string;
    ErrorMessage: string;
  end;

  IHttpJsonClient = interface
    ['{9A955045-D7BA-465D-AA6B-71789D88C1D0}']
    /// <summary>
    ///   Executa um GET HTTPS retornando o corpo como JSON.
    ///   O token nunca deve ser registrado, serializado ou exibido.
    /// </summary>
    function Get(const AUrl, ABearerToken: string): THttpJsonResult;
  end;

implementation

end.
