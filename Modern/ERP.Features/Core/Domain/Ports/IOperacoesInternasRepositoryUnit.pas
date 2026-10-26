unit IOperacoesInternasRepositoryUnit;

interface

uses
  BaseRepositoryUnit,
  OperacaoInternaEtdUnit;

type  
  {$IFDEF INTF_ON}
  IOperacoesInternasRepository = interface
    ['{D36C104B-2D5E-4EAE-846B-68E232D6569D}']
    function Post(Input: OperacaoInternaEtd): OperacaoInternaEtd;
    function Put(Input: OperacaoInternaEtd): OperacaoInternaEtd;
    function GetById(const Id: string): OperacaoInternaEtd;
    function ListCurrentAndActives(const CurrentId: string): OperacoesInternasEtd;
  end;
  {$ELSE}
  IOperacoesInternasRepository = class(BaseRepository)
  public
    function Post(Input: OperacaoInternaEtd): OperacaoInternaEtd; virtual; abstract;
    function Put(Input: OperacaoInternaEtd): OperacaoInternaEtd; virtual; abstract;
    function GetById(const Id: string): OperacaoInternaEtd; virtual; abstract;
    function ListCurrentAndActives(const CurrentId: string): OperacoesInternasEtd; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
