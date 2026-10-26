unit RemoverNFSeOSUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  INFSeRepositoryUnit,
  IDataBaseConnectionUnit, ITributosDFeRepositoryUnit, ICalcularTributosNFSeServiceUnit, IPedVendaRepositoryUnit,
  NFSeModelUnit, INFSeCalculoAplicadorServiceUnit;

type
  IRemoverNFSeOSUseCase = interface
    ['{1276B37F-779D-4617-B43D-7E5ADF10EB35}']
    procedure Executar(const NFSeId: string; NumeroOS, EmpresaId: Integer);
  end;

  RemoverNFSeOSUseCase = class(TInterfacedBaseUseCase, IRemoverNFSeOSUseCase)
  private
    FNFSeRepo: INFSeRepository;
    FTributosDFeRepo: ITributosDFeRepository;
    FOSRepo: IPedVendaRepository;
    FCalcularTributos: ICalcularTributosNFSeService;
    FCalculoAplicador: INFSeCalculoAplicadorService;

    procedure CalcularTributosNFSe(Nota: NFSeModel);
  public
    constructor Create(
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      OSRepo: IPedVendaRepository;
      CalcularTributos: ICalcularTributosNFSeService;
      CalculoAplicador: INFSeCalculoAplicadorService
    );
    procedure Executar(const NFSeId: string; NumeroOS, EmpresaId: Integer);
  end;

implementation

uses
  SysUtils, Classes,
  NFSeOSEtdUnit, EValidacaoNegocioUnit, ITransactionUnit, TributoDFeOrigemEnumUnit, CalculoTributosNFSeOutputUnit,
  CalculoTributosNFSeInputUnit, NFSeEtdUnit, TributoDFeContextEtdUnit, UpdatePedvendaVinculoNFSeCommandsUnit;

{ RemoverNFSeOSUseCase }

procedure RemoverNFSeOSUseCase.CalcularTributosNFSe(Nota: NFSeModel);
var
	Tributos: CalculoTributosNFSeOutput;
  TribInput: CalculoTributosNFSeInput;
  NFSe: NFSeEtd;
  I: Integer;
begin
	try
		Tributos := FCalcularTributos.Executar( CalculoTributosNFSeInput.Create( Nota, True, True ));
		try
      FCalculoAplicador.AplicarCalculo( Nota, Tributos, True, True );
    finally
			Tributos.Free();
		end;

	except on E: Exception do
    raise EValidacaoNegocio.Create( 'Erro de execução: ' + E.Message );
	end;
end;

constructor RemoverNFSeOSUseCase.Create(Connection: IDataBaseConnection; NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  OSRepo: IPedVendaRepository;
  CalcularTributos: ICalcularTributosNFSeService;
  CalculoAplicador: INFSeCalculoAplicadorService);
begin
  FConnection := Connection;
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
  FOSRepo := OSRepo;
  FCalcularTributos := CalcularTributos;
  FCalculoAplicador := CalculoAplicador;
end;

procedure RemoverNFSeOSUseCase.Executar(const NFSeId: string; NumeroOS, EmpresaId: Integer);
var
  nfseOSs: NFSeOSEtdList;
  nfseOS: NFSeOSEtd;
  transaction: ITransaction;
  Nota: NFSeModel;
  notaAlterada: NFSeEtd;
  tributoAlterado: TributoDFeContextEtd;
  I: Integer;
begin
  Nota := nil;
  nfseOSs := nil;
  transaction := FConnection.BeginTransaction();
  try try
    Nota := NFSeModel.Create(
      FNFSeRepo.GetNFSe(NFSeId, EmpresaId),
      FTributosDFeRepo.GetById(NFSeId, tdfoNFSe)
    );
    if Nota.NFSe = nil then
      raise EValidacaoNegocio.Create('NFSe não encontrada');

    if not Nota.NFSe.EstaEmDigitacao then
      raise EValidacaoNegocio.Create('NFSe não permite alteração no momento');

    nfseOSs := FNFSeRepo.ListarRelacionamento(NFSeId);
    if nfseOSs.Count = 0 then
      raise EValidacaoNegocio.Create('Nenhum relacionamento encontrado para NFSe');

    for I := 0 to nfseOSs.Count - 1 do
    begin
      nfseOS := NFSeOSEtd(nfseOSs.Items[I]);

      if nfseOS.NumPed = NumeroOS then
      begin

        if nfseOS.VServicos <= Nota.NFSe.VServ.Value then
          Nota.NFSe.VServ.SubtractValue( nfseOS.VServicos );

        if nfseOS.VDescontos <= Nota.NFSe.VDescIncond.Value then
          Nota.NFSe.VDescIncond.SubtractValue( nfseOS.VDescontos );

        // As descricoes, se necessario pode pegar o metodo em CriarEmitirNFSeAgrupadas e tranformar em um Service

        CalcularTributosNFSe( Nota );

        notaAlterada := FNFSeRepo.AlterarNFSeParaEmissao( Nota.NFSe );

        if Nota.Tributo <> nil then
          tributoAlterado := FTributosDFeRepo.Post( Nota.Tributo );

        FNFSeRepo.RemoverRelacionamento( nfseOS );

        FOSRepo.RemoverVinculoComNFSe( UpdatePedvendaRemoverVinculoNFSeCommand.Create(
          nfseOS.NumPed,
          EmpresaId,
          nfseOS.NFSeId
        ));

        transaction.Commit();

        Exit;
      end;
    end;

    raise EValidacaoNegocio.CreateFmt('Nenhum relacionamento encontrado com a O.S. %d e a NFSe', [ NumeroOS ]);

  except
    transaction.Rollback();
    raise;
  end;
  finally
    nfseOSs.Free();
    Nota.Free();
    transaction.FreeTransaction();
  end;
end;

end.
