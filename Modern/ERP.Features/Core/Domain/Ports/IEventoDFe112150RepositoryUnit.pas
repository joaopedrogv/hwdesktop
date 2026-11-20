unit IEventoDFe112150RepositoryUnit;

interface

uses
  BaseRepositoryUnit;

type
  {$IFDEF INTF_ON}
  IEventoDFe112150Repository = interface
    ['{8E4B2C3D-5F60-4B71-8C82-9D3E4F5A6B72}']
    procedure Inserir(const AEventoId: string; ADataPrevisaoEntrega: TDate);
    procedure Atualizar(const AEventoId: string; ADataPrevisaoEntrega: TDate);
    function ObterDataPrevisao(const AEventoId: string;
      out ADataPrevisaoEntrega: TDate): Boolean;
  end;
  {$ELSE}
  IEventoDFe112150Repository = class(BaseRepository)
  public
    procedure Inserir(const AEventoId: string; ADataPrevisaoEntrega: TDate); virtual; abstract;
    procedure Atualizar(const AEventoId: string; ADataPrevisaoEntrega: TDate); virtual; abstract;
    function ObterDataPrevisao(const AEventoId: string;
      out ADataPrevisaoEntrega: TDate): Boolean; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
