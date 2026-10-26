unit CancelarNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  CancelarNFSeInputUnit,
  ResultadoNFSeOutputUnit,
  INFSeRepositoryUnit,
  ITributosDFeRepositoryUnit,
  CreateEntityUseCaseOutputUnit,
  ConfiguracaoNFSeServiceUnit,
  IAtualizarSituacaoNFSeServiceUnit;

type
  ICancelarNFSeUseCase = interface
    ['{8BE70F3E-EB41-4AFB-A4FB-97BC54BB2B71}']
    function Executar(const Input: CancelarNFSeInput): ResultadoNFSeOutput;
  end;

  CancelarNFSeUseCase = class(TInterfacedBaseUseCase, ICancelarNFSeUseCase)
  private
    FNFSeRepo: INFSeRepository;
    FTributosDFeRepo: ITributosDFeRepository;
    FAtualizarSituacaoService: IAtualizarSituacaoNFSeService;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      AtualizarSituacaoService: IAtualizarSituacaoNFSeService
    );
    function Executar(const Input: CancelarNFSeInput): ResultadoNFSeOutput;
  end;

implementation

uses
  sYSuTILS, DateUtils,
  NumberServiceUnit, ValidacaoNFSeFactoryUnit,
  NFSeEtdUnit, NFSeModelUnit, IEntityValidatorUnit, EntityValidatorFactoryUnit, NFSeTypesUnit, StringServiceUnit,
  ConfiguracaoNFSeModelUnit, NFSeAtualizarSituacaoTypesUnit, DateAndTimeNullableUnit, ValidationEntityOutputUnit,
  DFeDLLAdapterUnit, ResultadoOperacaoDFeUIMessagesUnit, ResultadoOperacaoDFeUnit, EValidacaoNegocioUnit,
  NFSeEventoEtdUnit, NFSeEventoModelUnit, NFSeResponseTypesUnit, IntegerNullableUnit, StringNullableUnit,
  NFSeResumoModelUnit, NFSeTypesDisplayUnit, ITransactionUnit, VersaoAplicacaoUnit, DFeDLLHeader,
  TributoDFeOrigemEnumUnit, TributoDFeContextEtdUnit, NFSeIbsCbsFactoryUnit;

{ CancelarNFSeUseCase }

constructor CancelarNFSeUseCase.Create(
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  AtualizarSituacaoService: IAtualizarSituacaoNFSeService
);
begin
  FConnection := Connection;
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
  FAtualizarSituacaoService := AtualizarSituacaoService;
end;

function CancelarNFSeUseCase.Executar(const Input: CancelarNFSeInput): ResultadoNFSeOutput;
var
  validator: IEntityValidator;
  NfEve: NFSeEventoModel;
  NfResumo: NFSeResumoModel;
  EveInput, EveOutput: NFSeEventoEtd;
  dllResponse: ResultadoOperacaoDFe;
  transaction: ITransaction;
  TipoEvento: TipoEventoNFSeEnum;
  NFseOut: NFSeModel;
  trib: TributoDFeContextEtd;
  cancSituacao: NFSeAtualizarCancelamentoModel;
  calls: DFeDLLFeatureSet;
begin
  TipoEvento := tenCancelamento;
  validator := EntityValidatorFactory.Builder();
  transaction := FConnection.BeginTransaction();
  try try
    NfEve := FNFSeRepo.GetEventoNFSe( Input.Id, Input.EmpresaId, TipoEvento );

    if NfEve = nil then
      raise EValidacaoNegocio.Create('NFSe não encontrada');

    if NfEve.Situacao <> sdpsAutorizada then
      validator.Add(
        ValidationEntityItem.Create( 'situacao', 'Só é possivel cancelar uma NFSe com situação = "Autorizada"'
      ));

    validator.Field('cmotivo', Input.CMotivo ).IsRequired;

    if NfEve.IsPadraoNacional() then
      validator.Field('xmotivo', Input.XMotivo ).IsRequired().HasSize(15, 255);

    if Input.CancPortal then // Cancelamento feito direto no portal da prefeitura
      validator.Field('DhCancelamento', Input.DhCancelamento ).IsRequired().HasMinValue(
        NfEve.DhEmi.Value, 'Data do cancelamento [@Value] precisa ser menor que a data de emissão [@MinValue]'
      );

    if (NfEve.Evento <> nil)
      and not (NfEve.Evento.Situacao in [ sdpsRascunho, sdpsRejeicao, sdpsEmissao, sdpsEmProcessamento ])
    then
      validator.Add( ValidationEntityItem.Create( 'situacao', Format(
        'Cancelamento não pode prosseguir com a situação atual: %s', [ SituacaoNFSeEnumStr[NfEve.Evento.Situacao] ]
      )));

    if not validator.IsValid() then
    begin
      Result := ResultadoNFSeOutput.Create( validator.Result() );
      Exit;
    end;

    if NfEve.Evento = nil then
    begin
      EveInput := NFSeEventoEtd.Create(
        '', NfEve.NFSeId, TipoEvento, Now(), sdpsRascunho, StringNullable.Create(VERSAO_APP_HW),
        Input.CMotivo, Input.XMotivo, Input.DhCancelamento, IntegerNullable.NullInstance()
      );
      EveOutput := FNFSeRepo.PostNFSeEvento(EveInput);

      NfEve.Free();
      NfEve := FNFSeRepo.GetEventoNFSe( Input.Id, Input.EmpresaId, TipoEvento );
    end
    else
    begin
      EveInput := FNFSeRepo.GetNFSeEvento( NfEve.Evento.Id );
      EveInput.DataEvento := Now();
      EveInput.CMotivo := Input.CMotivo;
      EveInput.XMotivo := Input.XMotivo;
      EveInput.DhProc := Input.DhCancelamento;

      EveOutput := FNFSeRepo.PutNFSeEvento(EveInput);
    end;

    if Input.CancPortal then // Cancelamento feito direto no portal da prefeitura
    begin
//      cancSituacao :=
//      NFSeAtualizarCancelamentoModel.Create(
//        NfEve.NFSeId, EveOutput.Id,
//        NFSeResponseCancelamentoModel.Create(
//          Input.DhCancelamento.Value, IntegerNullable.NullInstance(), StringNullable.NullInstance(), ocnPortalWebSite
//        )
//      );
      try
        FAtualizarSituacaoService.ExecutarCancelamento( NfEve, NFSeResponseCancelamentoModel.Create(
          Input.DhCancelamento.Value, IntegerNullable.NullInstance(), StringNullable.NullInstance(), ocnPortalWebSite
        ));

        //NfResumo := FNFSeRepo.AtualizarNFSe( cancSituacao );

        transaction.Commit();

        NFSeOut := NFSeModel.Create(
          FNFSeRepo.GetNFSe(Input.Id, Input.EmpresaId),
          FTributosDFeRepo.GetById(Input.Id, tdfoNFSe)
        );

        Result := ResultadoNFSeOutput.Create( validator.Result(), NFSeOut );

      finally
//        cancSituacao.Free()
      end;

      Exit;
    end
    else
    begin
      transaction.Commit();

      calls := [ dftCancelar ];
      if Input.Imprimir then
        calls := calls + [ dftImprimir ];

      dllResponse := DFeDLLAdapter.CallFeaturesNFSe( DFeDLLAdapter.InputNFSe(
        Input.Id, Input.EmpresaId, Input.Silent, calls
      ));

      NFseOut := nil;

      case dllResponse of
        rodOK:
          NFSeOut := NFSeModel.Create(
            FNFSeRepo.GetNFSe(Input.Id, Input.EmpresaId),
            FTributosDFeRepo.GetById(Input.Id, tdfoNFSe)
          );

        rodFalhaRegistrada, rodFalhaNaoTratada:
            validator.Add( ValidationEntityItem.Create('situacao', ResultadoOperacaoDFeMessage[dllResponse]));

        else
          raise Exception.Create('CancelarNFSeUseCase.Executar Retorno não tratado');
      end;

      Result := ResultadoNFSeOutput.Create( validator.Result(), NFSeOut );
    end;

  except on E: Exception do
    begin
      transaction.Rollback();
      raise;
    end;
  end;
  finally
    transaction.Free();
    NfEve.Free();
    EveInput.Free();
    EveOutput.Free();
  end;
end;

end.
