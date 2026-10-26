unit INotasFiscaisRepositoryUnit;

interface

uses
  CacheableRepositoryUnit,
  UpdateDFeRedBenefPcCalcCommandsUnit, ContextoDocTribPcModelUnit, PeriodoEmpresaVOUnit, NotaFiscalResumoModelUnit,
  NotaFiscalPendenciaSefEtdUnit, UpdateNotaFiscalConverterParaContingenciaCommandUnit,
  ConverterParaContingenciaResultUnit, UpdatePendenciaSefazAvancoCommandUnit, NotaFiscalItemContextoRtcModelUnit,
  UpdateNotaFiscalItemContextoRtcCommandUnit, NotaFiscalPendenciaSefModelUnit;

type
  INotasFiscaisRepository = class(CacheableRepository)
  public
    // Nota
    function ObterNotaFiscalResumo(CodigoNF, EmpresaId: Integer): NotaFiscalResumoModel; virtual; abstract;
    procedure AtualizarRedBenefPcCalculado(const Input: UpdateDFeRedBenefPcCalcCommands); virtual; abstract;
    function ConverterParaContingencia(const Input: UpdateNotaFiscalConverterParaContingenciaCommand): ConverterParaContingenciaResult; virtual; abstract;
    procedure CompletarNFePendenteAutorizada(const NfContigenciaId, NfPendenteId, EmpresaId: Integer); virtual; abstract;
    // Itens -
    function ObterContextoTribPISCOFINS(const ChaveNFe: string; EmpresaId: Integer): ContextoDocTribPcModel; overload; virtual; abstract;
    function ObterContextoTribPISCOFINS(const Input: PeriodoEmpresaVO): ContextoDocTribPcModelList; overload; virtual; abstract;
    function ObterItensContextoRtc(CodigoNF, EmpresaId: Integer): NotaFiscalItemContextoRtcModelList; virtual; abstract;
    procedure AtualizarItemContextoRtc(const Input: UpdateNotaFiscalItemContextoRtcCommand); virtual; abstract;
    // Pendencias Sefaz
    function ObterNotaFiscalPendenciaSef(CodigoNF, EmpresaId: Integer): NotaFiscalPendenciaSefEtd; virtual; abstract;
    function ObterPendenciaSefaz(CodigoNF, EmpresaId: Integer): NotaFiscalPendenciaSefModel; virtual; abstract;
    function ObterQtdePendenciasSefazNaoResolvidas(EmpresaId: Integer): Integer; virtual; abstract;
    procedure InserirPendenciaSEFAZ(const Input: NotaFiscalPendenciaSefEtd); virtual; abstract;
    function AtualizarAvancoPendenciaSEFAZ(const Input: UpdatePendenciaSefazAvancoCommand): NotaFiscalPendenciaSefEtd; virtual; abstract;
  end;

implementation

end.
