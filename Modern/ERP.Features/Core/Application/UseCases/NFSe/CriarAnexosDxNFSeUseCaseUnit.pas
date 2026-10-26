unit CriarAnexosDxNFSeUseCaseUnit;

interface

uses
  SysUtils, Classes,
  ResultadoOperacaoDFeUnit,
  IEnviarEmailUseCaseUnit,
  IEmailComposerServiceUnit,
  IErrorLoggerUnit,
  IProgressObserverUnit,
  IConfiguracoesRepositoryUnit,
  IConfiguracaoNFSeServiceUnit,
  NFSeResumoModelUnit,
  EmailConfigModelUnit,
  EmailMessageTypesUnit,
  TipoComunsUnit,
  IZipCompressorServiceUnit,
  INFSeAnexosServiceUnit, ISessionContextUnit;

type
  ResultadoOperacaoDFeArray = TArrayInteger;

  CriarAnexosDxNFSeUseCaseInput = record
  private
    NFSeIDs: TArrayString;
    EmpresaId: Integer;
    AnexarPDF: Boolean;
  public
    class function Create(
      const NFSeIDs: TArrayString;
      EmpresaId: Integer;
      AnexarPDF: Boolean
    ): CriarAnexosDxNFSeUseCaseInput; static;
  end;

  ICriarAnexosDxNFSeUseCase = interface
    ['{402EC97E-78D0-4263-A433-8A14C5DDC115}']
    function Executar(Input: CriarAnexosDxNFSeUseCaseInput): TArrayString;
  end;

  CriarAnexosDxNFSeUseCase = class(TInterfacedObject, ICriarAnexosDxNFSeUseCase)
  private
    FSession: ISessionContext;
    FConfigRepo: IConfiguracoesRepository;
    FEmailFComposer: IEmailComposerService;
    FEnviarEmailUseCase: IEnviarEmailUseCase;
    FCompressor: IZipCompressorService;
    FLogError: IErrorLogger;
    FObserver: IProgressObserver;
    FNFSeAnexosService: INFSeAnexosService;
  private
    procedure ResolverCompressaoAnexos(var Anexos: NFSeAnexosResultArray);
  public
    constructor Create(
      Session: ISessionContext;
      ConfigRepo: IConfiguracoesRepository;
      Compressor: IZipCompressorService;
      NFSeAnexosService: INFSeAnexosService;
      LogError: IErrorLogger;
      Observer: IProgressObserver
    );

    function Executar(Input: CriarAnexosDxNFSeUseCaseInput): TArrayString;
  end;

implementation

uses
  IOUtils, System.Generics.Collections,
  EmailNFSeInputUnit, NFSeTypesUnit, WebServiceResponseTypesUnit,
  EmailConfigRemetenteEnumUnit, ITransactionUnit, NFSeHistoricoTypesUnit,
  DFeTypesUnit;

{ CriarAnexosDxNFSeUseCaseInput }

class function CriarAnexosDxNFSeUseCaseInput.Create(
  const NFSeIDs: TArrayString;
  EmpresaId: Integer;
  AnexarPDF: Boolean): CriarAnexosDxNFSeUseCaseInput;
begin
  Result.NFSeIDs := NFSeIDs;
  Result.EmpresaId := EmpresaId;
  Result.AnexarPDF := AnexarPDF;
end;

{ CriarAnexosDxNFSeUseCase }

constructor CriarAnexosDxNFSeUseCase.Create(
  Session: ISessionContext;
  ConfigRepo: IConfiguracoesRepository;
  Compressor: IZipCompressorService;
  NFSeAnexosService: INFSeAnexosService;
  LogError: IErrorLogger;
  Observer: IProgressObserver
);
begin
  FSession := Session;
  FConfigRepo := ConfigRepo;
  FCompressor := Compressor;
  FNFSeAnexosService := NFSeAnexosService;
  FLogError := LogError;
  FObserver := Observer;
end;

procedure CriarAnexosDxNFSeUseCase.ResolverCompressaoAnexos(
  var Anexos: NFSeAnexosResultArray);
var
  files: TArray<TPair<string, TBytes>>;
  fileOutput: TPair<string, TBytes>;
  I: Integer;
begin
  if Length(Anexos) <= 3 then
    Exit;

  SetLength(files, Length(Anexos));
  for I := 0 to High(files) do
  begin
    files[I].Key := Anexos[I].FileName;
    files[I].Value := Anexos[I].Content;
  end;

  fileOutput := FCompressor.Comprimir(files, 'ArquivosNFSe.zip');

  SetLength(Anexos, 1);
  Anexos[0].FileName := fileOutput.Key;
  Anexos[0].Content := fileOutput.Value;
end;

function CriarAnexosDxNFSeUseCase.Executar(Input: CriarAnexosDxNFSeUseCaseInput): TArrayString;
var
  I, J: Integer;
  anexo: NFSeAnexoResult;
  anexos: NFSeAnexosResultArray;
  anexosResult: NFSeAnexosServiceResult;
  fileName, erro: string;
begin
  SetLength(Result, 0);

  FObserver.OnMessage('Criando Anexos');
  try
    anexosResult := FNFSeAnexosService.CriarAnexos(Input.NFSeIDs, Input.EmpresaId, Input.AnexarPDF);

    if (Length(anexosResult.Anexos) = 0) and (Length(anexosResult.Erros) = 0) then
    begin
      FObserver.OnMessage('Nenhum anexo gerado');
      Exit;
    end;

    anexos := anexosResult.Anexos;

    ResolverCompressaoAnexos(anexos);

    anexosResult.Anexos := anexos;

    SetLength(Result, Length(anexosResult.Anexos) + Length(anexosResult.Erros));

    for I := 0 to High(anexosResult.Anexos) do
    begin
      fileName := IncludeTrailingPathDelimiter(FSession.TemporaryFolder) + anexosResult.Anexos[I].FileName;
        TFile.WriteAllBytes(fileName, anexosResult.Anexos[I].Content);

      Result[I] := fileName;
    end;

    for I := 0 to High(anexosResult.Erros) do
    begin
      erro := 'ERRO|' + anexosResult.Erros[I].Value;

      Result[I + Length(anexosResult.Anexos)] := erro;
    end;

    FObserver.OnComplete();
  except
    on E: Exception do
    begin
      FLogError.LogError('CriarAnexosDxNFSeUseCase.Executar Erro: %s', [E.Message]);
      FObserver.OnError('Falha no processo. Consulte o log para detalhes');
    end;
  end;
end;

end.
