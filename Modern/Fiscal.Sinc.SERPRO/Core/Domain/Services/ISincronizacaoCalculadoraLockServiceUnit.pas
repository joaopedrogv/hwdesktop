unit ISincronizacaoCalculadoraLockServiceUnit;

interface

uses
  SincronizacaoCalculadoraLeaseUnit;

type
  /// <summary>
  ///   Porta de lease de sincronizacao da calculadora (escritor unico).
  ///   Unidade 2006-compativel (sem marcador).
  /// </summary>
  ISincronizacaoCalculadoraLockService = interface
    ['{CDEBF110-24AF-4332-AEAA-31A630259FA6}']
    /// <summary>
    ///   Tenta adquirir o lease. Retorna False quando outra instancia esta
    ///   aplicando (lease valido) ou quando a criacao colide com outra instancia.
    ///   Em caso de sucesso, ALease contem o token da instancia e a expiracao.
    /// </summary>
    function TryAcquire(out ALease: SincronizacaoCalculadoraLease): Boolean;

    /// <summary>
    ///   Libera o lease gravando a data atual apenas quando o token armazenado
    ///   ainda pertence a esta instancia. Sem renovacao/heartbeat.
    /// </summary>
    procedure Release;
  end;

implementation

end.
