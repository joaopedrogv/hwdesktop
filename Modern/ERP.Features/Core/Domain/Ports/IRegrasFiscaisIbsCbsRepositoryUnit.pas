unit IRegrasFiscaisIbsCbsRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  RegraFiscalIbsCbsEtdUnit;

type   
  {$IFDEF INTF_ON}
  IRegrasFiscaisIbsCbsRepository= interface
    ['{B8CAB281-D246-441F-BE16-7572ABA25BD8}']
    function Post(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd;
    function Put(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd;
    function GetById(const Id: string): RegraFiscalIbsCbsEtd;
    function ListCurrentAndActives(const CurrentId: string): RegrasFiscaisIbsCbsEtd;
  end;
  {$ELSE}
  IRegrasFiscaisIbsCbsRepository= class(BaseRepository)
  public
    function Post(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd; virtual; abstract;
    function Put(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd; virtual; abstract;
    function GetById(const Id: string): RegraFiscalIbsCbsEtd; virtual; abstract;
    function ListCurrentAndActives(const CurrentId: string): RegrasFiscaisIbsCbsEtd; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
