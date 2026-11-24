unit IEventoDFeFiscalGatewayUnit;

interface

uses
  TipoEventoDFeUnit, EventoDFeTransmissaoTypesUnit;

type
  IEventoDFeFiscalGateway = interface
  ['{6F1B2C47-9E3A-4C55-8E0D-2B4E7A1C9D31}']
    function Preparar(const ARequisicao: TEventoDFeRequisicaoPreparo):
      TEventoDFePreparacao;
    function Transmitir(const APreparado: IEventoDFeEnvioPreparado):
      TEventoDFeResultadoTransmissao;
    function ConsultarSituacao(const AUf: string;
      const AChaveDocumento: string; const ATipoEvento: TipoEventoDFe;
      const ANSeqEvento: Integer): TEventoDFeResultadoConsulta;
  end;

implementation

end.
