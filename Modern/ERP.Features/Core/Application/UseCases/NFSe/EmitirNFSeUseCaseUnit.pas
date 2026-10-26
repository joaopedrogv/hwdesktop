unit EmitirNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit, EmitirNFSeInputUnit, ResultadoNFSeOutputUnit, IEmitirNFSeServiceUnit, IDataBaseConnectionUnit,
  IPrepararNFSeParaEmissaoServiceUnit, EmissaoLoteNFSeOutputUnit, INFSeRepositoryUnit, ITributosDFeRepositoryUnit,
  IClientesRepositoryUnit, IConfiguracaoNFSeServiceUnit, ValidacaoOutputUnit, NFSeEtdUnit, ConfiguracaoNFSeModelUnit,
  NFSeModelUnit, EValidacaoNegocioUnit;

type
  IEmitirNFSeUseCase = interface
    ['{015C9620-96E8-470D-8E7B-1BCDBDBAEB35}']
    function Executar(const Input: EmitirNFSeInput): ResultadoNFSeOutput;
  end;

  IEmitirLoteNFSeUseCase = interface
    ['{8C893CBB-2A3E-408A-B29A-CBDBE98A0F34}']
    function Executar(const Input: EmitirLoteNFSeInput): EmissaoLoteNFSeOutput;
  end;

  EmitirNFSeUseCase = class(TInterfacedBaseUseCase, IEmitirNFSeUseCase, IEmitirLoteNFSeUseCase)
  private
    FConnection: IDataBaseConnection;
    FNFSeRepo: INFSeRepository;
    FTributosDFeRepo: ITributosDFeRepository;
    FConfigNFSeFactory: IConfiguracaoNFSeService;
    FEmitirNFSe: IEmitirNFSeService;
    FPrepararParaEmissao: IPrepararNFSeParaEmissaoService;

    FConfigNFSe: ConfiguracaoNFSeModel;
    procedure CarregarConfiguracaoNFSe(EmpresaId: Integer);
  public
    constructor Create(
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      ConfigNFSeFactory: IConfiguracaoNFSeService;
      PrepararParaEmissao: IPrepararNFSeParaEmissaoService;
      EmitirNFSe: IEmitirNFSeService
    );
    function Executar(const Input: EmitirNFSeInput): ResultadoNFSeOutput; overload;
    function Executar(const Input: EmitirLoteNFSeInput): EmissaoLoteNFSeOutput; overload;
  end;

implementation

uses
  SysUtils, StrUtils, DateUtils,
  ITransactionUnit, IEntityValidatorUnit, TributoDFeContextEtdUnit, ClienteEtdUnit, TipoComunsUnit,
  ResultadoOperacaoDFeUIMessagesUnit, ResultadoOperacaoDFeUnit, NFSeTypesUnit, EntityValidatorFactoryUnit,
  ValidationEntityOutputUnit, ValidacaoNFSeFactoryUnit, NFSeAtualizarSituacaoTypesUnit, EmitirNFSeCommandUnit,
  TributoDFeOrigemEnumUnit, StringServiceUnit, EmitirLoteNFSeCommandUnit;

{ EmitirNFSeUseCase }

procedure EmitirNFSeUseCase.CarregarConfiguracaoNFSe(EmpresaId: Integer);
begin
  FConfigNFSe := FConfigNFSeFactory.Executar(EmpresaId);

  if Trim(FConfigNFSe.Serie) = '' then
    raise EValidacaoNegocio.Create('Série da NFSe não configurada nos parametros do Sistema');
end;

constructor EmitirNFSeUseCase.Create(
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  ConfigNFSeFactory: IConfiguracaoNFSeService;
  PrepararParaEmissao: IPrepararNFSeParaEmissaoService;
  EmitirNFSe: IEmitirNFSeService
);
begin
  FConnection := Connection;
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
  FConfigNFSeFactory := ConfigNFSeFactory;
  FPrepararParaEmissao  := PrepararParaEmissao;
  FEmitirNFSe := EmitirNFSe;
end;

function EmitirNFSeUseCase.Executar(const Input: EmitirNFSeInput): ResultadoNFSeOutput;
var
  transaction: ITransaction;
  DPS : NFSeEtd;
  NFSeOut: NFSeModel;
  dhEmi: TDateTime;
  emitResponseCode: ResultadoOperacaoDFe;
  EmailTomador: string;
  Imprimir: Boolean;
  preparacaoResult: PreparacaoNFSeResult;
  validacoes: ValidationEntityOutput;
begin
  CarregarConfiguracaoNFSe(Input.EmpresaId);

  transaction := FConnection.BeginTransaction();
  try try
    preparacaoResult := FPrepararParaEmissao.Preparar( Input.Id, Input.EmpresaId, FConfigNFSe );
    DPS := preparacaoResult.NFSe;
    validacoes := preparacaoResult.Validacoes;

    transaction.Commit();

    if not validacoes.IsValid then
    begin
      Result := ResultadoNFSeOutput.Create( validacoes );
      Exit;
    end;

    EmailTomador := '';
    // Nao envia email se ja estava autorizada antes
    if not FConfigNFSe.UsarMensageriaAI and (DPS.Situacao <> sdpsAutorizada) and DPS.CodCliente.HasValue then
      EmailTomador := StringService.Join(',', DPS.ParticipantePrincipal.ListaEmails );

    emitResponseCode := FEmitirNFSe.Emitir(EmitirNFSeCommand.Create(
      Input.Id,
      Input.EmpresaId,
      Input.Silent,
      EmailTomador
    ));

    NFSeOut := nil;
    case emitResponseCode of
      rodOK:
        NFSeOut := NFSeModel.Create(
          FNFSeRepo.GetNFSe(Input.Id, Input.EmpresaId),
          FTributosDFeRepo.GetById(Input.Id, tdfoNFSe)
        );

      rodFalhaRegistrada, rodFalhaNaoTratada:
          validacoes.Add( 'Id', ResultadoOperacaoDFeMessage[emitResponseCode]);

      else
        raise Exception.Create('EmitirNFSeUseCase.Executar Retorno não tratado');
    end;

    Result := ResultadoNFSeOutput.Create( validacoes, NFSeOut );

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

function EmitirNFSeUseCase.Executar(const Input: EmitirLoteNFSeInput): EmissaoLoteNFSeOutput;
var
  transaction: ITransaction;
  I: Integer;
  nfse: NFSeEtd;
  nfseValidadas, emailsValidados, dpsComFalha, nfseNaoCompat, nfsePortal: TArrayString;
  iValid, iFalhas, iNaoCompativeis, iPortal: Integer;
  emitServiceResult: EmissaoLoteNFSeOutput;
  validInt: ValidacaoOutput;
  preparacaoResult: PreparacaoNFSeResult;
  validacoes: ValidationEntityOutput;
begin
  CarregarConfiguracaoNFSe(Input.EmpresaId);

  nfse := nil;
  transaction := FConnection.BeginTransaction();
  try
    iValid := 0;
    iFalhas := 0;
    iPortal := 0;
    iNaoCompativeis := 0;
    SetLength(nfseValidadas, Length(Input.NFSeIDs));
    SetLength(emailsValidados, Length(Input.NFSeIDs));
    SetLength(dpsComFalha, Length(Input.NFSeIDs));
    SetLength(nfseNaoCompat, Length(Input.NFSeIDs));
    SetLength(nfsePortal, Length(Input.NFSeIDs));

    for I := 0 to High(Input.NFSeIDs) do
    begin
      preparacaoResult := FPrepararParaEmissao.Preparar( Input.NFSeIDs[I], Input.EmpresaId, FConfigNFSe );
      nfse := preparacaoResult.NFSe;
      validacoes := preparacaoResult.Validacoes;

      transaction.Commit();

      try
        if nfse = nil  then
          Continue

        else if nfse.NaturezaEmissao <> nemtPrestadorWS then
        begin
          nfsePortal[iPortal] := IntToStr(nfse.SeqId);
          Inc(iPortal);
        end

        else if validacoes.IsValid or (nfse.Situacao = sdpsAutorizada) then
        begin
          nfseValidadas[iValid] := Input.NFSeIDs[I];
          if not FConfigNFSe.UsarMensageriaAI then
            emailsValidados[iValid] := ''
          else
            emailsValidados[iValid] := Input.Emails[I];
          Inc(iValid);
        end
        else if not (nfse.Situacao in [ sdpsEmissao, sdpsEmProcessamento, sdpsAutorizada, sdpsRascunho, sdpsRejeicao]) then
        begin
          nfseNaoCompat[iNaoCompativeis] := IntToStr(nfse.NNFSe.Value);
          Inc(iNaoCompativeis);
        end
        else
        begin
          dpsComFalha[iFalhas] := IntToStr(nfse.NDps.Value);
          Inc(iFalhas);
        end;
      finally
        nfse.Free();
      end;
    end;
    SetLength(nfseValidadas, iValid);
    SetLength(emailsValidados, iValid);
    SetLength(dpsComFalha, iFalhas);
    SetLength(nfseNaoCompat, iNaoCompativeis);
    SetLength(nfsePortal, iPortal);

    validInt := ValidacaoOutput.Create();

    if iFalhas > 0 then
      validInt.Add(
        'A lista de DPS/RPS abaixo não pode ser transmitida por conter falhas de validação %s%s',
        [ sLineBreak, StringService.Join(', ', dpsComFalha) ]
      );

    if iNaoCompativeis > 0 then
      validInt.Add(
        'A lista de NFSe''s abaixo já se encontra na sua situação final %s%s',
        [ sLineBreak, StringService.Join(', ', nfseNaoCompat) ]
      );

    if iPortal > 0 then
      validInt.Add(
        'A lista de códigos de NFSe abaixo é de emissão no Portal, não pode ser transmitida %s%s',
        [ sLineBreak, StringService.Join(', ', nfsePortal) ]
      );

    if iValid = 0 then
    begin
      validInt.Add('Nenhuma NFSe válidada para transmissão com os parametros informados');
      validInt.RaiseIfNotIsValid();
    end;

    emitServiceResult := FEmitirNFSe.Emitir( EmitirLoteNFSeCommand.Create(
      nfseValidadas,
      Input.EmpresaId,
      Input.Silent,
      emailsValidados
    ));

    transaction.Commit();

    if (iFalhas > 0) or (iNaoCompativeis > 0) then
    begin
      validInt.Add(emitServiceResult.Validacoes.Validacoes);

      Result := EmissaoLoteNFSeOutput.Create(
        nfseValidadas,
        validInt,
        emitServiceResult.TotalNotasCriadas,
        emitServiceResult.TotalNotasAutorizadas,
        emitServiceResult.TotalEmEmissao,
        emitServiceResult.TotalNotasRejeitadas,
        emitServiceResult.TotalFalhaRegistradas,
        emitServiceResult.TotalFalhasNaoTratadas,
        emitServiceResult.ArquivosPDF,
        emitServiceResult.NFSeIDsAutorizadas
      );
    end
    else
      Result := emitServiceResult;

  except on E: Exception do
    begin
      transaction.Rollback();
      raise;
    end;
  end;
end;

end.
