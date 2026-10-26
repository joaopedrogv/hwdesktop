unit ConsolidadorContextoFiscalPcServiceUnit;

interface

uses
  SysUtils, Classes,
  IConsolidadorContextoFiscalPcServiceUnit, ContextoDocTribPcModelUnit, INotasConsumidorRepositoryUnit,
  INotasFiscaisRepositoryUnit, PeriodoEmpresaVOUnit;

type
  ConsolidadorContextoFiscalPcService = class(TInterfacedObject, IConsolidadorContextoFiscalPcService)
  private
    FNotasFiscaisRepo: INotasFiscaisRepository;
    FNotasConsumiRepo: INotasConsumidorRepository;
  public
    constructor Create(NotasFiscaisRepo: INotasFiscaisRepository; NotasConsumiRepo: INotasConsumidorRepository);

    function ObterDocumentoConsolidado(const ChaveDFe: string; EmpresaId: Integer): ContextoDocTribPcModel;
    function ObterDocumentosConsolidados(const Input: PeriodoEmpresaVO): ContextoDocTribPcModelList;
    procedure MarcarDocumentoComoCalculado(const Input: ContextoDocTribPcModel);
  end;

implementation

uses
  StrUtils,
  ModelosDFeEnumUnit, UpdateDFeRedBenefPcCalcCommandsUnit;

{ ConsolidadorContextoFiscalPcService }

constructor ConsolidadorContextoFiscalPcService.Create(NotasFiscaisRepo: INotasFiscaisRepository;
  NotasConsumiRepo: INotasConsumidorRepository);
begin
  FNotasFiscaisRepo := NotasFiscaisRepo;
  FNotasConsumiRepo := NotasConsumiRepo;
end;

procedure ConsolidadorContextoFiscalPcService.MarcarDocumentoComoCalculado(const Input: ContextoDocTribPcModel);
begin
  case Input.ModeloDFe of
    mdNFe:
      FNotasFiscaisRepo.AtualizarRedBenefPcCalculado(UpdateDFeRedBenefPcCalcCommands.Create(
        Input.CodigoDoc, Input.EmpresaId, True
      ));

    mdNFCe:
      FNotasConsumiRepo.AtualizarRedBenefPcCalculado(UpdateDFeRedBenefPcCalcCommands.Create(
        Input.CodigoDoc, Input.EmpresaId, True
      ));
    else
      raise Exception.CreateFmt('Modelo de Documento (seq %d) para marcar como calculado não implementado',
        [Ord(Input.ModeloDFe)]
      );
  end;
end;

function ConsolidadorContextoFiscalPcService.ObterDocumentoConsolidado(const ChaveDFe: string;
  EmpresaId: Integer): ContextoDocTribPcModel;
var
  modelo: ModelosDFeEnum;
begin
  modelo := ModelosDFeEnumUtils.StrToEnum( Copy(ChaveDFe, 21, 2) );

  case modelo of
    mdNFe:
      Result := FNotasFiscaisRepo.ObterContextoTribPISCOFINS( ChaveDFe, EmpresaId);

    mdNFCe:
      Result := FNotasConsumiRepo.ObterContextoTribPISCOFINS( ChaveDFe, EmpresaId);

    else
      raise Exception.CreateFmt('Modelo de Documento (seq %d) para obter dados não implementado',
        [Ord(modelo)]
      );
  end;
end;

function ConsolidadorContextoFiscalPcService.ObterDocumentosConsolidados(
  const Input: PeriodoEmpresaVO
): ContextoDocTribPcModelList;
var
  nfces: ContextoDocTribPcModelList;
  I: Integer;
begin
  Result := FNotasFiscaisRepo.ObterContextoTribPISCOFINS(Input);

  nfces := FNotasConsumiRepo.ObterContextoTribPISCOFINS(Input);
  try
    for I := 0 to nfces.Count - 1 do
      Result.Add(nfces.Items[I]);
  finally
    nfces.OwnsObjects := False;
    nfces.Free();
  end;
end;

end.
