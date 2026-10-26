unit ConcluirDoPortalNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  ConluirNFSeInputUnit,
  ResultadoNFSeOutputUnit,
  INFSeRepositoryUnit,
  ITributosDFeRepositoryUnit,
  IAtualizarSituacaoNFSeServiceUnit,
  CreateEntityUseCaseOutputUnit,
  IClientesRepositoryUnit, ISessionContextUnit;

type
  IConcluirDoPortalNFSeUseCase = interface
    ['{9AA2A45E-5F4F-4488-9841-2A0A91BCDD7B}']
    function Executar(const Input: ConcluirNFSeInput): ResultadoNFSeOutput;
  end;

  ConcluirDoPortalNFSeUseCase = class(TInterfacedBaseUseCase, IConcluirDoPortalNFSeUseCase)
  private
    FSession: ISessionContext;
    FNFSeRepo: INFSeRepository;
    FTributosDFeRepo: ITributosDFeRepository;
    FClientesRepo: IClientesRepository;
    FAtualizarSituacaoNFSe: IAtualizarSituacaoNFSeService;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      Session: ISessionContext;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      ClientesRepo: IClientesRepository;
      AtualizarSituacaoNFSe: IAtualizarSituacaoNFSeService
    );
    function Executar(const Input: ConcluirNFSeInput): ResultadoNFSeOutput;
  end;

implementation

uses
  sYSuTILS, DateUtils,
  NumberServiceUnit, ValidacaoNFSeFactoryUnit,
  NFSeEtdUnit, NFSeModelUnit, IEntityValidatorUnit, EntityValidatorFactoryUnit, NFSeTypesUnit, StringServiceUnit,
  ConfiguracaoNFSeModelUnit, NFSeAtualizarSituacaoTypesUnit, DateAndTimeNullableUnit, ValidationEntityOutputUnit,
  ResultadoOperacaoDFeUIMessagesUnit, ResultadoOperacaoDFeUnit, ITransactionUnit, 
  ClienteEtdUnit, StringNullableUnit, TributoDFeOrigemEnumUnit, TributoDFeContextEtdUnit, NFSeIbsCbsFactoryUnit,
  EValidacaoNegocioUnit, NFSeTypesDisplayUnit, NFSeResumoModelUnit, NFSeResponseTypesUnit;

{ ConcluirDoPortalNFSeUseCase }

constructor ConcluirDoPortalNFSeUseCase.Create(
  Connection: IDataBaseConnection;
  Session: ISessionContext;
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  ClientesRepo: IClientesRepository;
  AtualizarSituacaoNFSe: IAtualizarSituacaoNFSeService
);
begin
  FConnection := Connection;
  FSession := Session;
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
  FClientesRepo := ClientesRepo;
  FAtualizarSituacaoNFSe := AtualizarSituacaoNFSe;
end;

function ConcluirDoPortalNFSeUseCase.Executar(const Input: ConcluirNFSeInput): ResultadoNFSeOutput;
var                        
  transaction: ITransaction;
  validator: IEntityValidator;
  DPS : NFSeEtd;
  NFSeOut: NFSeModel;
  resumoNFSe: NFSeResumoModel;
  autResp: NFSeResponseAutorizacaoModel;
begin
  autResp := nil;
  transaction := FConnection.BeginTransaction();
  try try
    DPS := FNFSeRepo.GetNFSe(Input.NFSeId, FSession.EmpresaId);

    case DPS.Situacao of
      sdpsRascunho, sdpsRejeicao:  
        begin
          validator := ValidacaoNFSeFactory.BuildEmitirNoPortal( DPS );

          validator.Field('serie', DPS.Serie ).IsRequired();
          validator.Field('nnfse', DPS.NNFSe ).IsRequired();

          if not Input.ContinuarSemChave then
            validator.Field('ChaveNFSe', DPS.ChaveNFSe).IsRequired();

          if Assigned(DPS.Substituida) and not DPS.Substituida.SubstituidaId.IsNullOrWhiteSpace() then
          begin
            resumoNFSe := FNFSeRepo.GetResumoNFSe( DPS.Substituida.SubstituidaId.Value );

            if not (resumoNFSe.Situacao in [ sdpsAutorizada ]) then
              validator.Add(ValidationEntityItem.Create('Id', 'NFSe a ser substituída não está "Autorizada"'));
          end;

          if not validator.IsValid() then
          begin
            Result := ResultadoNFSeOutput.Create( validator.Result() );
            Exit;
          end;

          FAtualizarSituacaoNFSe.ExecutarAutorizacaoViaPortal( DPS );

          DPS.Free();
          DPS := FNFSeRepo.GetNFSe(Input.NFSeId, FSession.EmpresaId);

          if DPS.Situacao <> sdpsAutorizada then
            raise EValidacaoNegocio.Create('Sistema não conseguiu alterar a situação da NFSe para Autorizada');

          transaction.Commit();
        end;

      sdpsAutorizada:
        raise EValidacaoNegocio.Create('NFSe já se encontra Autorizada');

      else
        raise EValidacaoNegocio.CreateFmt(
          'NFSe não pode ser concluída, Situação difere do esperado: "%s"', [SituacaoNFSeEnumStr[DPS.Situacao]]
        );
    end;

    NFSeOut := NFSeModel.Create( DPS, FTributosDFeRepo.GetById(Input.NFSeId, tdfoNFSe ));
    DPS := nil;

    Result := ResultadoNFSeOutput.Create( validator.Result(), NFSeOut );

  except on E: Exception do
    begin
      transaction.Rollback();
      raise;
    end;
  end;
  finally
    DPS.Free();
  end;
end;

end.
