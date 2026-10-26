unit INcmAplicavelRepositoryUnit;

interface

uses     
  CacheableRepositoryUnit,
  NcmAplicavelEtdUnit,
  TipoComunsUnit;

type                                                          
  {$IFDEF INTF_ON}
  INcmAplicavelRepository = interface
    ['{13C3C3E4-FF7A-4653-841D-FE05603F6DB8}']
    function ObterPorNcmeClassificacaoId(NCM: string; ClassificacaoId: Integer; Data: TDate): NcmsAplicaveisEtd;
    function ExistePorClassificacaoId(ClassificacaoId: Integer; Data: TDate): Boolean;
  end;
  {$ELSE}
  INcmAplicavelRepository = class(CacheableRepository)
  public
    function ObterPorNcmeClassificacaoId(NCM: string; ClassificacaoId: Integer; Data: TDate): NcmsAplicaveisEtd; virtual; abstract;
    function ExistePorClassificacaoId(ClassificacaoId: Integer; Data: TDate): Boolean; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
