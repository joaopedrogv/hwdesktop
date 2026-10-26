unit IOpInternasComTpVendasRepositoryUnit;

interface

uses                   
  CacheableRepositoryUnit,
  OpInternaComTpVendaEtdUnit, OpInternaTpVendaVinculoModelUnit;

type                                 
  {$IFDEF INTF_ON}
  IOpInternasComTpVendasRepository = interface
    ['{1D86D134-0678-4DC1-B4A4-F11862B3CE75}']
    function ListarPorTpVenda(CodTpVenda: Integer; const TipoTpVenda: string): OpInternasComTpVendasEtd;
    function ListarPorOpInterna(const OpInternaId: string): OpInternasComTpVendasEtd;
    function ListarPorVenda(const TipoVenda, TipoSigla: string; EmpresaId: Integer): OpInternasComTpVendasEtd;
    procedure VincularOperacoesInternasATipoVenda(const TipoVenda: OpInternaTpVendaVinculoModel; const OpInternas: OpInternaTpVendaVinculoModelArray);
    procedure VincularTiposVendasAOperacaoInterna(const OpInternaId: string; const TiposVendas: OpInternaTpVendaVinculoModelArray);
  end;
  {$ELSE}
  IOpInternasComTpVendasRepository = class(CacheableRepository)
  public
    function ListarPorTpVenda(CodTpVenda: Integer; const TipoTpVenda: string): OpInternasComTpVendasEtd; virtual; abstract;
    function ListarPorOpInterna(const OpInternaId: string): OpInternasComTpVendasEtd; virtual; abstract;
    function ListarPorVenda(const TipoVenda, TipoSigla: string; EmpresaId: Integer): OpInternasComTpVendasEtd; virtual; abstract;
    procedure VincularOperacoesInternasATipoVenda(const TipoVenda: OpInternaTpVendaVinculoModel; const OpInternas: OpInternaTpVendaVinculoModelArray); virtual; abstract;
    procedure VincularTiposVendasAOperacaoInterna(const OpInternaId: string; const TiposVendas: OpInternaTpVendaVinculoModelArray); virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
