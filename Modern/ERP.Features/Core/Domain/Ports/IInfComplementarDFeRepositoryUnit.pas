unit IInfComplementarDFeRepositoryUnit;

interface

uses
  SysUtils, Classes,
  CacheableRepositoryUnit,
  InfComplementarDFeEtdUnit,
  TipoInfComplementarEnumUnit;

type
  IInfComplementarDFeRepository = class(CacheableRepository)
  public
    //function GetById(Id: Integer): InfComplementarDFeEtd; virtual; abstract;
    function ListarPorTipo(Tipo: TipoInfComplementarEnum): InfComplementarDFeEtdList; virtual; abstract;
  end;

implementation

end.