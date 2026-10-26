unit INbsRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  NbsEtdUnit,
  TipoComunsUnit;

type
  {$IFDEF INTF_ON}
  INbsRepository = interface
    ['{312FFF02-F469-406D-B40B-1F1D48A3CB68}']
    function ObterNbs(const Nbs: string; Data: TDate): NbsEtd;
    function ListarNbs(Data: TDate): NbssEtd;
  end;
  {$ELSE}
  INbsRepository = class(CacheableRepository)
  public
    function ObterNbs(const Nbs: string; Data: TDate): NbsEtd; virtual; abstract;
    // Nao abstrato (default nil) para preservar os test doubles existentes sem
    // alteracao fora do escopo do incremento.
    function ListarNbs(Data: TDate): NbssEtd; virtual;
  end;
  {$ENDIF}

implementation

{$IFNDEF INTF_ON}
function INbsRepository.ListarNbs(Data: TDate): NbssEtd;
begin
  Result := nil;
end;
{$ENDIF}

end.
