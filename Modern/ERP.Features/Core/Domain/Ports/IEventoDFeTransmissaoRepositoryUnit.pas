unit IEventoDFeTransmissaoRepositoryUnit;

interface

uses
  EventoDFeTransmissaoEtdUnit;

type
  IEventoDFeTransmissaoRepository = interface
  ['{0C9D5A62-3B77-4E19-A2F8-5D6C1E4B7A02}']
    function ProximoIdLote: Int64;
    function RegistrarTentativa(const ATentativa: TEventoDFeTransmissaoEtd):
      TEventoDFeTransmissaoEtd;
    // Preserva CSTAT_LOTE e XML_RETORNO já gravados na tentativa aberta quando os valores recebidos são 0 e vazio.
    function SalvarResposta(const ATentativa: TEventoDFeTransmissaoEtd;
      const AConcluir: Boolean): Integer;
    // Registra a consulta em tentativa já concluída, preservando CSTAT_LOTE, XML_ENVIO e XML_RETORNO.
    function RegistrarEvidenciaConsulta(const ATentativa: TEventoDFeTransmissaoEtd):
      Integer;
    function FecharTentativaAberta(const AEventoDFeId: string): Integer;
    function ObterPorId(const AId: string): TEventoDFeTransmissaoEtd;
    function ObterUltimaPorEvento(const AEventoDFeId: string):
      TEventoDFeTransmissaoEtd;
    function ObterAbertaPorEvento(const AEventoDFeId: string):
      TEventoDFeTransmissaoEtd;
  end;

implementation

end.
