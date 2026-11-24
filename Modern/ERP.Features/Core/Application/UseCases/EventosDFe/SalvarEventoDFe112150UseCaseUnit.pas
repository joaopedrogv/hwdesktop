unit SalvarEventoDFe112150UseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  ISessionContextUnit,
  IEventosDFeRepositoryUnit,
  IEventoDFe112150RepositoryUnit,
  EventoDFe112150EtdUnit,
  CreateEntityUseCaseOutputUnit;

type
  ISalvarEventoDFe112150UseCase = interface
    ['{A06D4E5F-7182-4D93-AEA4-BF5A6B7C8D94}']
    function Executar(AEvento: EventoDFe112150Etd): CreateEntityUseCaseOutPut;
  end;

  SalvarEventoDFe112150UseCase = class(TInterfacedObject,
    ISalvarEventoDFe112150UseCase)
  private
    FConnection: IDataBaseConnection;
    FSession: ISessionContext;
    FEventosRepo: IEventosDFeRepository;
    FRepo112150: IEventoDFe112150Repository;
    function Reler(const AId: string): EventoDFe112150Etd;
  public
    constructor Create(AConnection: IDataBaseConnection;
      ASession: ISessionContext; AEventosRepo: IEventosDFeRepository;
      ARepo112150: IEventoDFe112150Repository);
    function Executar(AEvento: EventoDFe112150Etd): CreateEntityUseCaseOutPut;
  end;

implementation

uses
  SysUtils,
  EntityValidatorFactoryUnit,
  IEntityValidatorUnit,
  ITransactionUnit,
  ArrayServiceUnit,
  StringServiceUnit,
  EValidacaoNegocioUnit,
  StatusRegistroEnumUnit,
  TipoEventoDFeUnit,
  EventoDFeEtdUnit,
  EventoDFe112150MetadataUnit,
  EventoDFeStatusUnit,
  EventoDFeDuplicidadeValidatorUnit;

const
  TAMANHO_CHAVE_DOCUMENTO = 44;

function SeqIdEmUso(const AMensagem: string): Boolean;
begin
  Result := Pos('UNQ_EVENTOS_DFE_SEQ', AMensagem) > 0;
end;

{ SalvarEventoDFe112150UseCase }

constructor SalvarEventoDFe112150UseCase.Create(AConnection: IDataBaseConnection;
  ASession: ISessionContext; AEventosRepo: IEventosDFeRepository;
  ARepo112150: IEventoDFe112150Repository);
begin
  FConnection := AConnection;
  FSession := ASession;
  FEventosRepo := AEventosRepo;
  FRepo112150 := ARepo112150;
end;

function SalvarEventoDFe112150UseCase.Executar(
  AEvento: EventoDFe112150Etd): CreateEntityUseCaseOutPut;
var
  Validator: IEntityValidator;
  Transacao: ITransaction;
  Header: EventoDFeEtd;
  Existente: EventoDFeEtd;
  Resultado: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
  StatusAtual: TStatusEventoDFe;
  NseqAtual: Integer;
  ChaveAtual: string;
  Restaurando: Boolean;
begin
  Result := nil;

  Validator := EntityValidatorFactory.Builder(TEventoDFe112150Metadata.GetMetadata());

  Validator.FieldEnum('FamiliaDocumento', Ord(AEvento.FamiliaDocumento))
    .IsRequired(0)
    .HasValidaValues(ArrayService.MakeArrayInt(FamiliaDocumentoDFeCodigo(fdNFe)));

  Validator.Field('ChaveDocumento', AEvento.ChaveDocumento)
    .IsRequired()
    .HasSize(TAMANHO_CHAVE_DOCUMENTO, TAMANHO_CHAVE_DOCUMENTO);

  if Length(StringService.OnlyNumber(AEvento.ChaveDocumento)) <> TAMANHO_CHAVE_DOCUMENTO then
    Validator.Add('ChaveDocumento', 'Chave da NF-e deve conter 44 dígitos.');

  Validator.FieldD('DataPrevisaoEntrega', AEvento.DataPrevisaoEntrega)
    .IsRequired()
    .HasMinValue(Date)
    .HasMaxValue(EncodeDate(2099, 12, 31));

  Validator.FieldEnum('TipoEvento', Ord(AEvento.TipoEvento))
    .IsRequired(0)
    .HasValidaValues(ArrayService.MakeArrayInt(Ord(teAtualizacaoPrevisaoEntrega)));

  AEvento.CodEmpresa := FSession.EmpresaId;

  if (AEvento.Id = '') and (AEvento.SeqId <= 0) then
    Validator.Add('SeqId', 'Código obrigatório para inclusão.');

  if not Validator.IsValid() then
  begin
    Result := CreateEntityUseCaseOutPut.Create(Validator.Result());
    Exit;
  end;

  if AEvento.Id = '' then
  begin
    Saida := nil;
    Transacao := FConnection.BeginTransaction();
    try
      try
        ValidarDuplicidadeEventoDFe(FEventosRepo, AEvento.CodEmpresa,
          AEvento.ChaveDocumento, AEvento.TipoEvento, '');

        Header := FEventosRepo.Inserir(AEvento);
        try
          FRepo112150.Inserir(Header.Id, AEvento.DataPrevisaoEntrega);
          Resultado := Reler(Header.Id);
        finally
          Header.Free;
        end;

        Saida := CreateEntityUseCaseOutPut.Create(Resultado);
        Transacao.Commit();
        Result := Saida;
      except
        on E: Exception do
        begin
          Transacao.Rollback();
          FreeAndNil(Saida);

          if SeqIdEmUso(E.Message) then
            raise EValidacaoNegocio.Create(
              Format('Código %d já utilizado; tente novamente.', [AEvento.SeqId]));

          raise;
        end;
      end;
    finally
      Transacao.FreeTransaction();
    end;

    Exit;
  end;

  Existente := FEventosRepo.ObterPorId(AEvento.Id, FSession.EmpresaId);
  if Existente = nil then
    raise EValidacaoNegocio.Create('Evento DF-e não encontrado.');

  try
    if (Existente.FamiliaDocumento <> fdNFe) or
       (Existente.TipoEvento <> teAtualizacaoPrevisaoEntrega) then
      raise EValidacaoNegocio.Create('Tipo de evento divergente.');

    Restaurando := Existente.Ativo = saLixeira;
    StatusAtual := Existente.Status;
    NseqAtual := Existente.NseqEvento;
    ChaveAtual := Existente.ChaveDocumento;
  finally
    Existente.Free;
  end;

  AEvento.Ativo := saAtivo;

  Saida := nil;
  Transacao := FConnection.BeginTransaction();
  try
    try
      if not Restaurando then
      begin
        if StatusAtual = seAutorizado then
          raise EValidacaoNegocio.Create(
            'O evento autorizado não pode ser alterado.');

        if StatusAtual = seEnviando then
          raise EValidacaoNegocio.Create(
            'O evento em transmissão não pode ser alterado. Consulte a situação do evento.');
      end;

      if (NseqAtual > 0) and (AEvento.ChaveDocumento <> ChaveAtual) then
        raise EValidacaoNegocio.Create(
          'A chave do documento não pode ser alterada depois que o evento recebeu número de sequência.');

      ValidarDuplicidadeEventoDFe(FEventosRepo, AEvento.CodEmpresa,
        AEvento.ChaveDocumento, AEvento.TipoEvento, AEvento.Id);

      Header := FEventosRepo.Atualizar(AEvento);
      try
        FRepo112150.Atualizar(AEvento.Id, AEvento.DataPrevisaoEntrega);
        Resultado := Reler(AEvento.Id);
      finally
        Header.Free;
      end;

      Saida := CreateEntityUseCaseOutPut.Create(Resultado);
      Transacao.Commit();
      Result := Saida;
    except
      on E: Exception do
      begin
        Transacao.Rollback();
        FreeAndNil(Saida);
        raise;
      end;
    end;
  finally
    Transacao.FreeTransaction();
  end;
end;

function SalvarEventoDFe112150UseCase.Reler(const AId: string): EventoDFe112150Etd;
var
  Header: EventoDFeEtd;
  DataPrevisao: TDate;
begin
  Header := FEventosRepo.ObterPorId(AId, FSession.EmpresaId);

  if Header = nil then
    raise EValidacaoNegocio.Create('Evento DF-e não encontrado após a gravação.');

  try
    if not FRepo112150.ObterDataPrevisao(AId, DataPrevisao) then
      raise EValidacaoNegocio.Create('Dados do evento 112150 não encontrados.');

    Result := EventoDFe112150Etd.Create(Header.Id, Header.SeqId,
      Header.ChaveDocumento, Header.CodEmpresa, Header.Ativo, DataPrevisao,
      Header.DataCadastro, Header.DataAlteracao);
  finally
    Header.Free;
  end;
end;

end.
