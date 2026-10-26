unit ISincronizadorCalculadoraServiceUnit;

interface

uses
  SincronizacaoCalculadoraSnapshotUnit;

type
  ISincronizadorCalculadoraService = interface
    ['{EA598EB3-E007-45C1-8263-2F09691AF9CC}']
    /// <summary>
    ///   Fase 1 - leitura de todas as colecoes fiscais da calculadora, sem
    ///   transacao. Preenche o snapshot retornado (propriedade do chamador).
    ///   Excecoes de leitura sao propagadas (re-lancadas); nenhuma escrita e
    ///   realizada nesta fase.
    /// </summary>
    function LerTodos(): SincronizacaoCalculadoraSnapshot;

    /// <summary>
    ///   Fase 2 - aplicacao do snapshot sob a transacao do use case.
    ///   Retorna False em falha (o chamador nao deve commitar). Esta
    ///   implementacao nao abre nem commita transacao.
    /// </summary>
    function Aplicar(const ASnapshot: SincronizacaoCalculadoraSnapshot): Boolean;
  end;

implementation

end.
