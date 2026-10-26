unit IDFeAlertasRepositoryUnit;

interface

uses
  SysUtils, Classes,
  CacheableRepositoryUnit, DFeAlertaEdtUnit;

type
  IDFeAlertasRepository = class(CacheableRepository)
  public
    function ObterPelodDFe(const ChaveDFe: string): DFeAlertaEdtList; virtual; abstract;
    function ExisteAlertaPelodDFe(const ChaveDFe: string): Boolean; virtual; abstract;
    procedure Incluir(const Input: DFeAlertaEdtList); virtual; abstract;
  end;

implementation

end.