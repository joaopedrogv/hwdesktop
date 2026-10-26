unit IGruposFiscaisRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  GrupoFiscalEtdUnit;

type                               
  {$IFDEF INTF_ON} 
  IGruposFiscaisRepository = interface
    ['{3A3128EA-D27F-4A28-9B77-F045E4B310B5}']
    function Post(Input: GrupoFiscalEtd): GrupoFiscalEtd;
    function Put(Input: GrupoFiscalEtd): GrupoFiscalEtd;
    function GetById(const Id: string): GrupoFiscalEtd;
    function ListCurrentAndActives(const CurrentId: string): GruposFiscaisEtd;
    function ListarComAnexoVinculado(): GruposFiscaisEtd;
  end;
  {$ELSE}
  IGruposFiscaisRepository = class(BaseRepository)
  public
    function Post(Input: GrupoFiscalEtd): GrupoFiscalEtd; virtual; abstract;
    function Put(Input: GrupoFiscalEtd): GrupoFiscalEtd; virtual; abstract;
    function GetById(const Id: string): GrupoFiscalEtd; virtual; abstract;
    function ListCurrentAndActives(const CurrentId: string): GruposFiscaisEtd; virtual; abstract;
    function ListarComAnexoVinculado(): GruposFiscaisEtd; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
