unit IEventosDFeRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  EventoDFeEtdUnit,
  TipoEventoDFeUnit,
  EventoDFeStatusUnit,
  EventoDFeTransmissaoTypesUnit;

type
  IEventosDFeRepository = class(BaseRepository)
  public
    function Inserir(const AEvento: EventoDFeEtd): EventoDFeEtd; virtual; abstract;
    function Atualizar(const AEvento: EventoDFeEtd): EventoDFeEtd; virtual; abstract;
    function ObterPorId(const AId: string; AEmpresaId: Integer): EventoDFeEtd; virtual; abstract;
    function ObterProximoSeqId(AEmpresaId: Integer): Integer; virtual; abstract;
    procedure RemoverLogicamente(const AId: string; AEmpresaId: Integer); virtual; abstract;
    function ObterConflitoEvento(const ACodEmpresa: Integer;
      const AChaveDocumento: string; const ATipoEvento: TipoEventoDFe;
      const AIdIgnorado: string): TEventoDFeConflito; virtual; abstract;
    function GarantirNseqEvento(const AId: string;
      const ACodEmpresa: Integer; const AChaveDocumento: string;
      const ATipoEvento: TipoEventoDFe): Integer; virtual; abstract;
    function RegistrarEnvio(const AId: string; const AAmbiente: Integer;
      const ACnpj: string; const ACOrgao, ATpAutor, ACOrgaoAutor: Integer): Integer;
      virtual; abstract;
    function ConcluirEvento(const AId: string;
      const AStatusEsperado, ANovoStatus: TStatusEventoDFe;
      const AXMotivo, ANProt: string; const ADhRegEvento: TDateTime): Integer;
      virtual; abstract;
  end;

implementation

end.
