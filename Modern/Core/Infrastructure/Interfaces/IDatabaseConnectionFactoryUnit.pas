unit IDatabaseConnectionFactoryUnit;

interface

uses
  IDataBaseConnectionUnit, ISqlLoggerUnit;

type
  IDatabaseConnectionFactory = interface
    ['{BC088862-09BE-4242-8B0F-75AC5DFDDB0D}']
    /// <summary>
    ///   Cria uma implementacao IDatabaseConnection e abre a conexao. Não trata erros
    /// </summary>
    function CreateConnection(const ConnectionString: string; Logger: ISqlLogger; out Erro: string): IDatabaseConnection; overload;
    /// <summary>
    ///   Cria uma implementacao IDatabaseConnection e abre a conexao. Não trata erros
    /// </summary>
    function CreateConnection(const ConnectionString: string): IDatabaseConnection; overload;
    /// <summary>
    ///   Cria uma implementacao IDatabaseConnection e abre a conexao. Se uma exceção for levantada o result é nil e Erro recebe a mensagem
    /// </summary>
    function CreateConnection(const ConnectionString: string; out Erro: string): IDatabaseConnection; overload;
  end;

implementation

end.
