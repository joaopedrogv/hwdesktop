unit ITributoSituacaoTributariaRepositoryUnit;

interface

uses              
  CacheableRepositoryUnit,
  TributoSituacaoTributariaEtdUnit,
  TipoTributoEnumUnit,
  TipoComunsUnit;

type                                                   
  {$IFDEF INTF_ON}
  ITributoSituacaoTributariaRepository = interface
    ['{2AFC98F5-CF72-4392-AC88-446A99996311}']
    function Obter(const CST: string; TipoTributoId: TipoTributoEnum; Data: TDate): TributoSituacaoTributariaEtd;
  end;
  {$ELSE}
  ITributoSituacaoTributariaRepository = class(CacheableRepository)
  public
    function Obter(const CST: string; TipoTributoId: TipoTributoEnum; Data: TDate): TributoSituacaoTributariaEtd; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
