unit AtualizarFiscalNFSeUseCaseUnit;

interface       

uses
  SysUtils,
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  ITiposServicosRepositoryUnit,
  TipoServicoEtdUnit,
  AlteracaoFiscalNFSeModelUnit;

type
  IAtualizarFiscalNFSeUseCase = interface
    ['{0D72114E-9D0D-4E2B-9B34-551083762103}']
    procedure Executar(const Input: AlteracaoFiscalNFSeModel);
  end;

  AtualizarFiscalNFSeUseCase = class(TInterfacedBaseUseCase, IAtualizarFiscalNFSeUseCase)
  private
    FTiposServicosRepo: ITiposServicosRepository;
  public
    constructor Create(Connection: IDataBaseConnection; const TiposServicosRepo: ITiposServicosRepository);

    procedure Executar(const Input: AlteracaoFiscalNFSeModel);
  end;

implementation

uses
  EValidacaoNegocioUnit, ITransactionUnit;

{ AtualizarFiscalNFSeUseCase }

constructor AtualizarFiscalNFSeUseCase.Create(Connection: IDataBaseConnection;
  const TiposServicosRepo: ITiposServicosRepository);
begin
  FConnection := Connection;
  FTiposServicosRepo := TiposServicosRepo;
end;

procedure AtualizarFiscalNFSeUseCase.Executar(const Input: AlteracaoFiscalNFSeModel);
begin
  if Length(Input.ServicosId) = 0 then
    raise EValidacaoNegocio.Create('Nenhum serviço selecionado');

  if not Input.CLC116.HasValue
    and not Input.CTribNac.HasValue
    and not Input.CTribMun.HasValue
    and not Input.CNBS.HasValue
    and not Input.CIndOp.HasValue
  then
    raise EValidacaoNegocio.Create('Nenhum campo selecionado para alteração');

  with FConnection.BeginTransaction() do
  try try

    FTiposServicosRepo.AtualizarFiscalNFSe( Input );

    Commit();

  except on E: Exception do
    begin
      Rollback();
      raise;
    end;
  end;
  finally
    FreeTransaction();
  end;
end;

end.
