unit IConsolidadorContextoFiscalPcServiceUnit;

interface

uses
  SysUtils, Classes,
  ContextoDocTribPcModelUnit, PeriodoEmpresaVOUnit;

type
  IConsolidadorContextoFiscalPcService = interface
    ['{AE8C2417-8B62-455E-9C4C-093B510468AF}']
    function ObterDocumentoConsolidado(const ChaveDFe: string; EmpresaId: Integer): ContextoDocTribPcModel;
    function ObterDocumentosConsolidados(const Input: PeriodoEmpresaVO): ContextoDocTribPcModelList;
    procedure MarcarDocumentoComoCalculado(const Input: ContextoDocTribPcModel);
  end;

implementation

end.