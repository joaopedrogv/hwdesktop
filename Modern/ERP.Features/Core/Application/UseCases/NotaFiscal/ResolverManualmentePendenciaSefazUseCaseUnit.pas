unit ResolverManualmentePendenciaSefazUseCaseUnit;

interface

uses
  SysUtils, Classes,
  IDataBaseConnectionUnit, INotasFiscaisRepositoryUnit, SituacaoNFeEnumUnit,
  ITributosDFeRepositoryUnit;

type
  IResolverManualmentePendenciaSefazUseCase = interface
    ['{F98A3780-DB41-41D4-9072-4684DDC4C953}']
    procedure Executar(NfContingenciaId, EmpresaId: Integer);
  end;

  ResolverManualmentePendenciaSefazUseCase = class(TInterfacedObject, IResolverManualmentePendenciaSefazUseCase)
  public
    FConnection: IDataBaseConnection;
    FNotasRepo: INotasFiscaisRepository;
    FTributosRtcRepo: ITributosDFeRepository;
  public
    constructor Create(
      Connection: IDataBaseConnection; NotasRepo: INotasFiscaisRepository; TributosRtcRepo: ITributosDFeRepository
    );
    procedure Executar(NfContingenciaId, EmpresaId: Integer);
  end;

implementation

uses
  UpdatePendenciaSefazAvancoCommandUnit, StatusResolucaoNFeSefEnumUnit, NotaFiscalItemContextoRtcModelUnit,
  TributoDFeContextEtdUnit, GuidServiceUnit, UpdateNotaFiscalItemContextoRtcCommandUnit, StringNullableUnit,
  EValidacaoNegocioUnit, ITransactionUnit, NotaFiscalPendenciaSefEtdUnit, NotaFiscalPendenciaSefModelUnit;

{ ResolverManualmentePendenciaSefazUseCase }

constructor ResolverManualmentePendenciaSefazUseCase.Create(
  Connection: IDataBaseConnection; NotasRepo: INotasFiscaisRepository; TributosRtcRepo: ITributosDFeRepository
);
begin
  FConnection := Connection;
  FNotasRepo := NotasRepo;
  FTributosRtcRepo := TributosRtcRepo;
end;

procedure ResolverManualmentePendenciaSefazUseCase.Executar(NfContingenciaId, EmpresaId: Integer);
var
  ItensNF: NotaFiscalItemContextoRtcModelList;
  ItensTrib: TributoDFeContextEtdList;
  ItemNF: NotaFiscalItemContextoRtcModel;
  ItemTrib: TributoDFeContextEtd;
  I: Integer;
  Pendencia: NotaFiscalPendenciaSefModel;
  Entidade: NotaFiscalPendenciaSefEtd;
  Transaction: ITransaction;
begin
  Pendencia := nil;
  Entidade := nil;
  Transaction := FConnection.BeginTransaction();
  try try

    Pendencia := FNotasRepo.ObterPendenciaSefaz(NfContingenciaId, EmpresaId);

    if Pendencia = nil then
      raise EValidacaoNegocio.Create('Nenhuma pendência encontrada');

    if Pendencia.StatusResolucao in [srsResolvida, srsResolvidaManual] then
      raise EValidacaoNegocio.Create('Pendência já marcada como resolvida');

    Entidade := FNotasRepo.AtualizarAvancoPendenciaSEFAZ(UpdatePendenciaSefazAvancoCommand.Create(
      NfContingenciaId, EmpresaId, srsResolvidaManual
    ));

    Transaction.Commit();

  except
    Transaction.Rollback();
    raise;
  end;
  finally
    Pendencia.Free();
    Entidade.Free();
    Transaction.FreeTransaction();
  end;
end;

end.
