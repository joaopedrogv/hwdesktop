unit IEmpresasRepositoryUnit;

interface

uses              
  CacheableRepositoryUnit,
  EmpresaEtdUnit;

type     
  {$IFDEF INTF_ON}
  IEmpresasRepository = interface
    ['{07C1EDC9-22F4-4FCF-BF83-F04BA7733E68}']
    function ListarPorUsuarioPermitido(const Usuario: string): EmpresasEtd;
    function ListarTodas(): EmpresasEtd;
  end;
  {$ELSE}
  IEmpresasRepository = class(CacheableRepository)
  public
    function ListarPorUsuarioPermitido(const Usuario: string): EmpresasEtd; virtual; abstract;
    function ListarTodas(): EmpresasEtd; virtual; abstract;
    function GetByKey(EmpresaId: Integer): EmpresaEtd; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
