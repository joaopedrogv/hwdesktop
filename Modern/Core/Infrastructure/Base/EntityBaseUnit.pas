unit EntityBaseUnit;

interface

type
  // Entidade base para ser usada no cache de repositorios, o metodo clone precisa se implementadp 
  EntityBase = class
  public
    function Clone(): EntityBase; virtual; abstract;
    function GetAuditLabel(const Additional: string = ''): string; virtual; abstract;
    function GetAuditKey(): string; virtual; abstract;
  end;

implementation

end.
