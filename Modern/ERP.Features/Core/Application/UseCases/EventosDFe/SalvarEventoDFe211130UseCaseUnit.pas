unit SalvarEventoDFe211130UseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  IDataBaseConnectionUnit,
  ISessionContextUnit,
  IEventosDFeRepositoryUnit,
  IEventoDFe211130RepositoryUnit,
  EventoDFe211130EtdUnit,
  CreateEntityUseCaseOutputUnit;

type
  ISalvarEventoDFe211130UseCase = interface
    ['{B17E5F60-8293-4EA4-BFB5-C06B7C8D9EA5}']
    function Executar(AEvento: EventoDFe211130Etd): CreateEntityUseCaseOutPut;
  end;

  SalvarEventoDFe211130UseCase = class(TInterfacedObject,
    ISalvarEventoDFe211130UseCase)
  private
    FConnection: IDataBaseConnection;
    FSession: ISessionContext;
    FEventosRepo: IEventosDFeRepository;
    FRepo211130: IEventoDFe211130Repository;
    function Reler(const AId: string): EventoDFe211130Etd;
  public
    constructor Create(AConnection: IDataBaseConnection;
      ASession: ISessionContext; AEventosRepo: IEventosDFeRepository;
      ARepo211130: IEventoDFe211130Repository);
    function Executar(AEvento: EventoDFe211130Etd): CreateEntityUseCaseOutPut;
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
  TipoComunsUnit,
  StatusRegistroEnumUnit,
  TipoEventoDFeUnit,
  EventoDFe211130ItemEtdUnit,
  EventoDFe211130ItensUnit,
  EventoDFeEtdUnit,
  EventoDFe211130MetadataUnit;

const
  TAMANHO_CHAVE_DOCUMENTO = 44;

function SeqIdEmUso(const AMensagem: string): Boolean;
begin
  Result := Pos('UNQ_EVENTOS_DFE_SEQ', AMensagem) > 0;
end;

{ SalvarEventoDFe211130UseCase }

constructor SalvarEventoDFe211130UseCase.Create(AConnection: IDataBaseConnection;
  ASession: ISessionContext; AEventosRepo: IEventosDFeRepository;
  ARepo211130: IEventoDFe211130Repository);
begin
  FConnection := AConnection;
  FSession := ASession;
  FEventosRepo := AEventosRepo;
  FRepo211130 := ARepo211130;
end;

function SalvarEventoDFe211130UseCase.Executar(
  AEvento: EventoDFe211130Etd): CreateEntityUseCaseOutPut;
var
  Validator: IEntityValidator;
  Erros: TArrayString;
  I: Integer;
  Transacao: ITransaction;
  Header: EventoDFeEtd;
  Existente: EventoDFeEtd;
  Resultado: EventoDFe211130Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Result := nil;

  AEvento.Itens := EventoDFe211130Itens.Normalizar(AEvento.Itens);

  Validator := EntityValidatorFactory.Builder(TEventoDFe211130Metadata.GetMetadata());

  Validator.FieldEnum('FamiliaDocumento', Ord(AEvento.FamiliaDocumento))
    .IsRequired(0)
    .HasValidaValues(ArrayService.MakeArrayInt(FamiliaDocumentoDFeCodigo(fdNFe)));

  Validator.Field('ChaveDocumento', AEvento.ChaveDocumento)
    .IsRequired()
    .HasSize(TAMANHO_CHAVE_DOCUMENTO, TAMANHO_CHAVE_DOCUMENTO);

  if Length(StringService.OnlyNumber(AEvento.ChaveDocumento)) <> TAMANHO_CHAVE_DOCUMENTO then
    Validator.Add('ChaveDocumento', 'Chave da NF-e deve conter 44 dígitos.');

  Validator.FieldEnum('TipoEvento', Ord(AEvento.TipoEvento))
    .IsRequired(0)
    .HasValidaValues(ArrayService.MakeArrayInt(Ord(teImobilizacaoItem)));

  if not EventoDFe211130Itens.Validar(AEvento.Itens, Erros) then
    for I := 0 to High(Erros) do
      Validator.Add('Itens', Erros[I]);

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
        Header := FEventosRepo.Inserir(AEvento);
        try
          FRepo211130.SubstituirItens(Header.Id, AEvento.Itens);
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
       (Existente.TipoEvento <> teImobilizacaoItem) then
      raise EValidacaoNegocio.Create('Tipo de evento divergente.');

    if AEvento.Restaurar then
    begin
      if Existente.Ativo <> saLixeira then
        raise EValidacaoNegocio.Create('O evento não está na lixeira para restauração.');
    end
    else if Existente.Ativo <> saAtivo then
      raise EValidacaoNegocio.Create('O evento está na lixeira; use Restaurar.');
  finally
    Existente.Free;
  end;

  AEvento.Ativo := saAtivo;

  Saida := nil;
  Transacao := FConnection.BeginTransaction();
  try
    try
      Header := FEventosRepo.Atualizar(AEvento);
      try
        FRepo211130.SubstituirItens(AEvento.Id, AEvento.Itens);
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

function SalvarEventoDFe211130UseCase.Reler(const AId: string): EventoDFe211130Etd;
var
  Header: EventoDFeEtd;
  Itens: EventoDFe211130ItemEtdArray;
begin
  Header := FEventosRepo.ObterPorId(AId, FSession.EmpresaId);

  if Header = nil then
    raise EValidacaoNegocio.Create('Evento DF-e não encontrado após a gravação.');

  try
    Itens := FRepo211130.ObterItens(AId);

    if Length(Itens) = 0 then
      raise EValidacaoNegocio.Create('Itens do evento 211130 não encontrados.');

    Result := EventoDFe211130Etd.Create(Header.Id, Header.SeqId,
      Header.ChaveDocumento, Header.CodEmpresa, Header.Ativo, Itens,
      Header.DataCadastro, Header.DataAlteracao, False);
  finally
    Header.Free;
  end;
end;

end.
