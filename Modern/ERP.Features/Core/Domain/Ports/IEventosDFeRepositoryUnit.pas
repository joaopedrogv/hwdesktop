unit IEventosDFeRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  EventoDFeEtdUnit;

type
  {$IFDEF INTF_ON}
  IEventosDFeRepository = interface
    ['{7D3A1B2C-4E5F-4A60-9B71-8C2D3E4F5A61}']
    function Inserir(const AEvento: EventoDFeEtd): EventoDFeEtd;
    function Atualizar(const AEvento: EventoDFeEtd): EventoDFeEtd;
    function ObterPorId(const AId: string; AEmpresaId: Integer): EventoDFeEtd;
    function ObterProximoSeqId(AEmpresaId: Integer): Integer;
    procedure RemoverLogicamente(const AId: string; AEmpresaId: Integer);
  end;
  {$ELSE}
  IEventosDFeRepository = class(BaseRepository)
  public
    function Inserir(const AEvento: EventoDFeEtd): EventoDFeEtd; virtual; abstract;
    function Atualizar(const AEvento: EventoDFeEtd): EventoDFeEtd; virtual; abstract;
    function ObterPorId(const AId: string; AEmpresaId: Integer): EventoDFeEtd; virtual; abstract;
    function ObterProximoSeqId(AEmpresaId: Integer): Integer; virtual; abstract;
    procedure RemoverLogicamente(const AId: string; AEmpresaId: Integer); virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
