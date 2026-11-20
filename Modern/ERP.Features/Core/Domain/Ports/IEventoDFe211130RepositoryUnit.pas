unit IEventoDFe211130RepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  EventoDFe211130ItemEtdUnit;

type
  {$IFDEF INTF_ON}
  IEventoDFe211130Repository = interface
    ['{9F5C3D4E-6071-4C82-9D93-AE4F5A6B7C83}']
    procedure SubstituirItens(const AEventoId: string;
      const AItens: EventoDFe211130ItemEtdArray);
    function ObterItens(const AEventoId: string): EventoDFe211130ItemEtdArray;
  end;
  {$ELSE}
  IEventoDFe211130Repository = class(BaseRepository)
  public
    procedure SubstituirItens(const AEventoId: string;
      const AItens: EventoDFe211130ItemEtdArray); virtual; abstract;
    function ObterItens(const AEventoId: string): EventoDFe211130ItemEtdArray; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
