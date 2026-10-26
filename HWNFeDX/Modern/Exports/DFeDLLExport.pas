unit DFeDLLExport;

interface

implementation

uses
  SysUtils, IOUtils,
  SetupDFeUnit, ContainerDFeUnit, SetupUnit, UIFormObserverFactoryUnit, IProgressObserverUnit, ResultadoOperacaoDFeUnit,
  WebServiceResponseTypesUnit, DFeDLLHeader, ResultadoExecucaoTransmissaoDFeOutputUnit, TipoComunsUnit,
  StringServiceUnit, EmitirWsNFSeUseCaseUnit, ArrayServiceUnit, EnviarEmailNFSeUseCaseUnit,
  CriarAnexosDxNFSeUseCaseUnit, TwofishTokenDecryptorUnit, TwofishTokenEncryptorUnit, ITokenDecryptorUnit,
  ITokenEncryptorUnit;


procedure CallDisconnectAndSetupDFeShutDown();
begin
  // Como a conexao é criada por essa classe entao precisei chamar o disconect para nao dar erro
  AppSetup.DatabaseConnection.Disconnect();
  SetupDFeShutDown();
end;

function NFSeListaRegimesEspeciaisTributacao(const EmpresaId: Integer): WideString; stdcall;
var
  W: WideString;
begin
  SetupDFeInitialize();
  try
    W := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateListarRegimesEspeciaisDeTributacaoNFSeUseCase()
      .Executar(EmpresaId);

    Result := W;

  finally
    CallDisconnectAndSetupDFeShutDown();
  end;
end;

function NFSeCallFeaturesInternal( const Input: DFeDLLCallFeatureInput ): Integer;
var
  FeaturesSet: DFeDLLFeatureSet;
  observer: IProgressObserver;
  transmitResult: ResultadoExecucaoTransmissaoDFeOutput;
  titleObs: string;
begin
  FeaturesSet := CardinalToFeatures(Input.Features);

  transmitResult := ResultadoExecucaoTransmissaoDFeOutput.Create(
    ResultadoOperacaoDFe.rodOK, // Para assegurar Salvar PDF ou Imprimir ou Enviar Email
    True
  );

  if dftEmitir in FeaturesSet then
    titleObs := 'Autorização de NFS-e'
  else if dftConsultar in FeaturesSet then
    titleObs := 'Consulta de NFS-e'
  else if (dftImprimir in FeaturesSet) or (dftSalvarPDF in FeaturesSet) then
    titleObs := 'Impressão de NFS-e'
  else if dftEmail in FeaturesSet then
    titleObs := 'Enviando emails da NFS-e';

  observer := UIFormObserverFactory.CreateSimple(titleObs, Input.Silent);

  if dftEmitir in FeaturesSet then //if (dftEmitir in FeaturesSet) or (dftConsultar in FeaturesSet) then
  begin
    Result := Ord( ContainerDFe.GetInstance().DFeFeaturesFactory.CreateEmitirWsNFSeUseCase( observer )
      .Executar( EmitirWsNFSeInput.Create( Input.NFSeId, Input.Email, Input.EmpresaId, Input.Silent )));
    Exit;
  end

  else if dftConsultar in FeaturesSet then
  begin
    Result := Ord( ContainerDFe.GetInstance().DFeFeaturesFactory.CreateConsultarWsNFSeUseCase( observer )
      .Executar( EmitirWsNFSeInput.Create( Input.NFSeId, Input.Email, Input.EmpresaId, Input.Silent )));
    Exit;
  end;

  if dftCancelar in FeaturesSet then
    transmitResult := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateCancelarWsNFSeUseCase( observer )
      .Executar(Input.NFSeId, Input.EmpresaId);

  if not ((dftEmitir in FeaturesSet) or (dftConsultar in FeaturesSet)) // Emitir/Consultar já resolve email e pdf
    and (transmitResult.ResultadoDFe = ResultadoOperacaoDFe.rodOK )
    and transmitResult.SucessoAutorizacao then
  begin
    if dftEmail in FeaturesSet then
      if ContainerDFe.GetInstance().DFeFeaturesFactory.CreateEnviarEmailNFSeUseCase( observer )
        .Executar(EnviarEmailNFSeUseCaseInput.Create( [Input.NFSeId], [Input.Email], Input.EmpresaId, True, True)
        ) > 0 then
      Result := Ord(ResultadoOperacaoDFe.rodOK);

    if dftImprimir in FeaturesSet then
      Result := Ord(ContainerDFe.GetInstance().DFeFeaturesFactory.CreateImprimirNFSeUseCase( observer )
        .Executar(Input.NFSeId, Input.EmpresaId));

    // Enviar email também gera PDF, aqui somente vai gerar se lá não foi gerado
    if (dftSalvarPDF in FeaturesSet)
      and ( not (dftEmail in FeaturesSet) or (not TFile.Exists( Input.PdfFileName )))
    then
      Result := Ord(ContainerDFe.GetInstance().DFeFeaturesFactory.CreateSalvarPdfNFSeUseCase( observer )
        .Executar(Input.NFSeId, Input.EmpresaId, Input.PdfFileName ));

    // Algum erro na sequencia depois do envio do email e sobrou o PDF criado, entao apaga
    if (ResultadoOperacaoDFe(Result) <> rodOK)
      and (dftEmail in FeaturesSet)
      and not String.IsNullOrWhiteSpace( Input.PdfFileName )
      and TFile.Exists( Input.PdfFileName )
    then
      DeleteFile( Input.PdfFileName );
  end;

  Result := Ord(transmitResult.ResultadoDFe);

end;

function NFSeCallFeatures( const Input: DFeDLLCallFeatureInput ): Integer; stdcall;
begin
  SetupDFeInitialize();
  try

    Result := NFSeCallFeaturesInternal( Input );

  finally
    CallDisconnectAndSetupDFeShutDown();
  end;
end;

function NFSeCallEmitirLote( const Input: NFSeCallEmitirLoteInput ): WideString; stdcall;
var
  observer: IProgressObserver;
  emitirResult: ResultadoOperacaoDFeArray;
  I: Integer;

  hInput: DFeDLLCallFeatureInput;
  NFSeIds: TArrayString;
  Emails: TArrayString;
  Results: TArrayString;
  S: string;
begin
  NFSeIds := StringService.Split([';'], Input.NFSeIDs );
  Emails  := StringService.Split([';'], Input.Emails );

  SetupDFeInitialize();
  try
    observer := UIFormObserverFactory.CreateSimple('Emitir', Input.Silent);

    // Chamada metodo emitir
    emitirResult :=  ContainerDFe.GetInstance().DFeFeaturesFactory.CreateEmitirLoteWsNFSeUseCase(observer)
      .Executar( EmitirLoteWsNFSeInput.Create(
        NFSeIds, Emails, Input.EmpresaId, Input.Silent
    ));

    Result := StringService.Join(';', ArrayService.IntArrayToStringArray( emitirResult ));

  finally
    observer := nil;
    CallDisconnectAndSetupDFeShutDown();
  end;
end;

function NFSeCallEnviarEmail( const Input: NFSeCallEnviarEmailInput ): Integer; stdcall;
var
  observer: IProgressObserver;
  hInput: DFeDLLCallFeatureInput;
  NFSeIds, Emails: TArrayString;
begin
  NFSeIds := StringService.Split([';'], Input.NFSeIDs );
  Emails  := StringService.Split([';'], Input.Emails );

  SetupDFeInitialize();
  try
    observer := UIFormObserverFactory.CreateSimple('Enviar email', Input.Silent);

    Result :=  ContainerDFe.GetInstance().DFeFeaturesFactory.CreateEnviarEmailNFSeUseCase(observer)
      .Executar( EnviarEmailNFSeUseCaseInput.Create(
        NFSeIds, Emails, Input.EmpresaId, Input.UnicoEmail, Input.AnexarPDF
    ));

  finally
    observer := nil;
    CallDisconnectAndSetupDFeShutDown();
  end;
end;

function NFSeCallCriarAnexos( const Input: NFSeCallCriarAnexoslInput ): WideString; stdcall;
var
  observer: IProgressObserver;
  hInput: DFeDLLCallFeatureInput;
  NFSeIds, ResultArray: TArrayString;
begin
  NFSeIds := StringService.Split([';'], Input.NFSeIDs );

  SetupDFeInitialize();
  try
    observer := UIFormObserverFactory.CreateSimple('Criação de anexos', Input.Silent);

    ResultArray :=  ContainerDFe.GetInstance().DFeFeaturesFactory.CreateCriarAnexosNFSeUseCase(observer)
      .Executar( CriarAnexosDxNFSeUseCaseInput.Create(
        NFSeIds, Input.EmpresaId, Input.AnexarPDF
    ));

    Result := string.Join(';', ResultArray);

  finally
    observer := nil;
    CallDisconnectAndSetupDFeShutDown();
  end;
end;

function NFSeCallCriarAnexosCSharp(NFSeID: WideString; EmpresaId: Integer; var AResultado: WideString): Integer; stdcall;
var
  Input: NFSeCallCriarAnexoslInput;
begin
  Input.NFSeIDs := NFSeID;
  Input.EmpresaId := EmpresaId;
  Input.Silent := True;
  Input.AnexarPDF := True;

  AResultado := NFSeCallCriarAnexos(Input);

  if (string(AResultado).Substring(0,6) = 'ERROR|') then
    Result := 0
  else
    Result := 1;
end;

function NFSeCallCriarAnexosCSharpBuffer(NFSeID: WideString; EmpresaId: Integer; var AResultado: PAnsiChar; var AResultadoSize: Integer): Integer; stdcall;
var
  Input: NFSeCallCriarAnexoslInput;
  Resposta: AnsiString;
  S: AnsiString;
  P: PAnsiChar;
begin
  Input.NFSeIDs := NFSeID;
  Input.EmpresaId := EmpresaId;
  Input.Silent := True;
  Input.AnexarPDF := True;

  Resposta := NFSeCallCriarAnexos(Input);

  if Assigned(AResultado) and (AResultadoSize >= Length(Resposta) + 1) then
  begin //StrLCopy(AResultado, PAnsiChar(Resposta), AResultadoSize - 1);
    StrPCopy(AResultado, PAnsiChar(Resposta));
    if (string(AResultado).Substring(0,6) = 'ERROR|') then
      Result := 0
    else
      Result := 1;
  end
  else
    Result := 0;

  AResultadoSize := Length(Resposta) + 1;
end;

function EncryptTextTwofish(const ASecret, AText: WideString): WideString; stdcall;
var
  Service: ITokenEncryptor;
begin
  Service := TwofishTokenEncryptor.Create(ASecret);
  Result := Service.Encrypt(AText);
end;

function DecryptTextTwofish(const ASecret, AEncryptedText: WideString): WideString; stdcall;
var
  Service: ITokenDecryptor;
begin
  Service := TwofishTokenDecryptor.Create(ASecret);
  Result := Service.Decrypt(AEncryptedText);
end;

exports
  NFSeListaRegimesEspeciaisTributacao,
  NFSeCallFeatures,
  NFSeCallEmitirLote,
  NFSeCallEnviarEmail,
  NFSeCallCriarAnexos,
  NFSeCallCriarAnexosCSharp,
  NFSeCallCriarAnexosCSharpBuffer,
  EncryptTextTwofish,
  DecryptTextTwofish;

initialization
  // Valida que o enumerado tem a mesma ordem/valores nos dois lados
  Assert(Ord(dftEmitir) = 0, 'cfEmitir deve ser 0');
  Assert(Ord(dftConsultar) = 1, 'cfConsultar deve ser 1');
  Assert(Ord(dftCancelar) = 2, 'cfCancelar deve ser 2');
  Assert(Ord(dftImprimir) = 3, 'cfImprimir deve ser 3');
  Assert(Ord(dftSalvarPDF) = 4, 'cfSalvarPDF deve ser 4');
  Assert(Ord(dftEmail) = 5, 'cfEmail deve ser 5');

end.
