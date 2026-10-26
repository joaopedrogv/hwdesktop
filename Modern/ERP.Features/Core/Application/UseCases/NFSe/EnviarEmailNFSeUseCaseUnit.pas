unit EnviarEmailNFSeUseCaseUnit;

interface

uses
  SysUtils, Classes,
  NFSeComACBrUseCaseBaseUnit,
  ResultadoOperacaoDFeUnit,
  IEnviarEmailUseCaseUnit,
  IEmailComposerServiceUnit,
  IErrorLoggerUnit,
  IProgressObserverUnit,
  INFSeRepositoryUnit,
  IConfiguracoesRepositoryUnit,
  IConfiguracaoNFSeServiceUnit,
  NFSeResumoModelUnit,
  EmailConfigModelUnit,
  EmailMessageTypesUnit,
  TipoComunsUnit,
  IZipCompressorServiceUnit,
  INFSeAnexosServiceUnit;

type
  ResultadoOperacaoDFeArray = TArrayInteger;

  EnviarEmailNFSeUseCaseInput = record
  private
    NFSeIDs, Emails: TArrayString;
    EmpresaId: Integer;
    UnicoEmail, AnexarPDF: Boolean;
  public
    class function Create(
      const NFSeIDs, Emails: TArrayString;
      EmpresaId: Integer;
      UnicoEmail, AnexarPDF: Boolean
    ): EnviarEmailNFSeUseCaseInput; static;
  end;

  IEnviarEmailNFSeUseCase = interface
    ['{55AA0A54-A464-4A68-A045-561A42365CE3}']
    function Executar(Input: EnviarEmailNFSeUseCaseInput): Integer;
  end;

  EnviarEmailNFSeUseCase = class(NFSeComACBrUseCaseClean, IEnviarEmailNFSeUseCase)
  private
    type
      EmailMessageInternal = record
        EMessage: EmailMessageModel;
        NFSeIDs: TArrayString;
        //Resultado: ResultadoOperacaoDFe;
      end;
      EmailMessageModelArray = array of EmailMessageInternal;

  private
    FConfigRepo: IConfiguracoesRepository;
    FEmailFComposer: IEmailComposerService;
    FEnviarEmailUseCase: IEnviarEmailUseCase;
    FCompressor: IZipCompressorService;
    FLogError: IErrorLogger;
    FObserver: IProgressObserver;
    FNFSeAnexosService: INFSeAnexosService;
  private
    function ObterMensagens(
      const Emails: TArrayString;
      const Anexos: NFSeAnexosResultArray;
      const NFSeIds: TArrayString;
      const EmailConfig: EmailConfigModel;
      UnicoEmail: Boolean
    ): EmailMessageModelArray;

    procedure ResolverCompressaoMensagens(var Mensagens: EmailMessageModelArray);

  public
    constructor Create(
      NFSeRepo: INFSeRepository;
      ConfigRepo: IConfiguracoesRepository;
      EmailFComposer: IEmailComposerService;
      Compressor: IZipCompressorService;
      NFSeAnexosService: INFSeAnexosService;
      EnviarEmailUseCase: IEnviarEmailUseCase;
      LogError: IErrorLogger;
      Observer: IProgressObserver
    );

    function Executar(Input: EnviarEmailNFSeUseCaseInput): Integer;
  end;

implementation

uses
  IOUtils, System.Generics.Collections,
  EmailNFSeInputUnit, NFSeTypesUnit, WebServiceResponseTypesUnit,
  EmailConfigRemetenteEnumUnit, ITransactionUnit, NFSeHistoricoTypesUnit,
  DFeTypesUnit;

{ EnviarEmailNFSeUseCaseInput }

class function EnviarEmailNFSeUseCaseInput.Create(
  const NFSeIDs, Emails: TArrayString;
  EmpresaId: Integer;
  UnicoEmail, AnexarPDF: Boolean): EnviarEmailNFSeUseCaseInput;
begin
  Result.NFSeIDs := NFSeIDs;
  Result.Emails := Emails;
  Result.EmpresaId := EmpresaId;
  Result.UnicoEmail := UnicoEmail;
  Result.AnexarPDF := AnexarPDF;
end;

{ EnviarEmailNFSeUseCase }

constructor EnviarEmailNFSeUseCase.Create(
  NFSeRepo: INFSeRepository;
  ConfigRepo: IConfiguracoesRepository;
  EmailFComposer: IEmailComposerService;
  Compressor: IZipCompressorService;
  NFSeAnexosService: INFSeAnexosService;
  EnviarEmailUseCase: IEnviarEmailUseCase;
  LogError: IErrorLogger;
  Observer: IProgressObserver
);
begin
  FNFSeRepo := NFSeRepo;
  FConfigRepo := ConfigRepo;
  FEmailFComposer := EmailFComposer;
  FCompressor := Compressor;
  FNFSeAnexosService := NFSeAnexosService;
  FEnviarEmailUseCase := EnviarEmailUseCase;
  FLogError := LogError;
  FObserver := Observer;
end;

function EnviarEmailNFSeUseCase.ObterMensagens(
  const Emails: TArrayString;
  const Anexos: NFSeAnexosResultArray;
  const NFSeIds: TArrayString;
  const EmailConfig: EmailConfigModel;
  UnicoEmail: Boolean): EmailMessageModelArray;
var
  I, J: Integer;
  eMessage: EmailMessageModel;
begin
  if UnicoEmail then
  begin
    SetLength(Result, 1);

    //Result[0].Resultado := rodOK;
    Result[0].NFSeIDs   := NFSeIds;
    Result[0].EMessage  := FEmailFComposer.ComporEmailNFSe(
      EmailNFSeInput.Create(string.Join(';', Emails), EmailConfig)
    );

    for I := 0 to High(Anexos) do
      if Length(Anexos[I].Content) > 0 then
        Result[0].EMessage.AddAttachment(Anexos[I].FileName, Anexos[I].Content);
  end
  else
  begin
    SetLength(Result, Length(NFSeIds));
    for I := 0 to High(NFSeIds) do
    begin
      eMessage := FEmailFComposer.ComporEmailNFSe(
        EmailNFSeInput.Create(Emails[I], EmailConfig)
      );
      for J := 0 to High(Anexos) do
        if (NFSeIds[I] = Anexos[J].NFSeId) and (Length(Anexos[J].Content) > 0) then
          eMessage.AddAttachment(Anexos[J].FileName, Anexos[J].Content);

      if Length(eMessage.Attachments) > 0 then
      begin
        SetLength(Result[I].NFSeIDs, 1);

        //Result[I].Resultado  := rodOK;
        Result[I].NFSeIDs[0] := NFSeIds[I];
        Result[I].EMessage   := eMessage;
      end;
    end;
  end;

  ResolverCompressaoMensagens(Result);
end;

procedure EnviarEmailNFSeUseCase.ResolverCompressaoMensagens(
  var Mensagens: EmailMessageModelArray);
var
  files: TArray<TPair<string, TBytes>>;
  fileOutput: TPair<string, TBytes>;
  I: Integer;
begin
  if (Length(Mensagens) <> 1)
    or (Length(Mensagens[0].EMessage.Attachments) <= 3) then
    Exit;

  SetLength(files, Length(Mensagens[0].EMessage.Attachments));
  for I := 0 to High(files) do
  begin
    files[I].Key := Mensagens[0].EMessage.Attachments[I].FileName;
    files[I].Value := Mensagens[0].EMessage.Attachments[I].Content;
  end;

  fileOutput := FCompressor.Comprimir(files, 'ArquivosNFSe.zip');

  Mensagens[0].EMessage := EmailMessageModel.Create(
    Mensagens[0].EMessage.Subject,
    Mensagens[0].EMessage.Body,
    Mensagens[0].EMessage.BodyIsHtml,
    Mensagens[0].EMessage.ToAddresses,
    [EmailAttachmentModel.Create(fileOutput.Key, fileOutput.Value)]
  );
end;

function EnviarEmailNFSeUseCase.Executar(Input: EnviarEmailNFSeUseCaseInput): Integer;
var
  I, J: Integer;
  anexo: NFSeAnexoResult;
  anexosArray: NFSeAnexosServiceResult;
  eMessages: EmailMessageModelArray;
  eMailConfig: EmailConfigModel;
  eMessage: EmailMessageModel;
begin
  Result := 0;

  FObserver.OnMessage('Obtendo NFSe e validando');

  try
    eMailConfig := FConfigRepo.GetEmailConfig(cerDFes);

    // NOVO: Delega a criação dos anexos para o serviço dedicado
    FObserver.OnMessage('Criando Anexos');
    anexosArray := FNFSeAnexosService.CriarAnexos(Input.NFSeIDs, Input.EmpresaId, Input.AnexarPDF);

    if Length(anexosArray.Anexos) = 0 then
    begin
      FObserver.OnMessage('Nenhum anexo gerado');
      Exit;
    end;

    // Monta as mensagens com os anexos
    FObserver.OnMessage('Montando emails');
    eMessages := ObterMensagens(
      Input.Emails,
      anexosArray.Anexos,
      Input.NFSeIDs,
      eMailConfig,
      Input.UnicoEmail
    );

    // Envia os emails
    FObserver.OnMessage('Enviando email''s');
    for I := 0 to High(eMessages) do
    begin
      FObserver.OnCounter(I + 1, Length(eMessages));
      eMessage := eMessages[I].EMessage;

      try
        if Length(eMessage.ToAddresses) = 0 then
          raise Exception.Create('Email não informado ou em branco');

        for J := 0 to High(eMessage.ToAddresses) do
          if string.IsNullOrWhiteSpace(eMessage.ToAddresses[J].Email) then
            raise Exception.Create('Email não informado ou em branco');

        if FEnviarEmailUseCase.Executar(eMailConfig, eMessage) then
        begin
          for J := 0 to High(eMessages[I].NFSeIDs) do
          begin
            FNFSeRepo.PostNFSeHistorico(NFSeHistoricoModel.Create(
              eMessages[I].NFSeIDs[J],
              Input.EmpresaId,
              TipoHistoricoNFSeEnum.thEmailEnviado,
              Input.Emails[I]
            ));
          end;
          Inc(Result);
        end
        else
        begin
          for J := 0 to High(eMessages[I].NFSeIDs) do
            RetornarFalhaSalva(eMessages[I].NFSeIDs[J], Input.EmpresaId, HIST_RESP_ENV_EMAIL_EMPTY);
        end;
      except
        on E: Exception do
        begin
          for J := 0 to High(eMessages[I].NFSeIDs) do
            RetornarFalhaSalva(eMessages[I].NFSeIDs[J], Input.EmpresaId, Format('Falha email: %s', [E.Message]));
        end;
      end;
    end;

    for I := 0 to High(anexosArray.Erros) do
      RetornarFalhaSalva(
        anexosArray.Erros[I].Key, Input.EmpresaId, Format('Falha email: %s', [anexosArray.Erros[I].Value])
      );

    FObserver.OnComplete();
  except
    on E: Exception do
    begin
      FLogError.LogError('EnviarEmailNFSeUseCase.Executar Erro: %s', [E.Message]);
      FObserver.OnError('Falha no processo. Consulte o log para detalhes');
    end;
  end;
end;

end.
