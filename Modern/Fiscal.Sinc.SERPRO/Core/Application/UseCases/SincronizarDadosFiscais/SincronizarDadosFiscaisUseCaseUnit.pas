unit SincronizarDadosFiscaisUseCaseUnit;

interface

uses
  SysUtils, Classes, System.Generics.Collections,
  IDataBaseConnectionUnit, IConfiguracoesRepositoryUnit, IProgressObserverUnit, ArquivoDownloadModel, ITransactionUnit,
  ISincronizarDadosFiscaisUseCaseUnit, IDownloadServiceUnit,
  ISincronizadorNCMsSICOMEXServiceUnit,
  ISincronizadorTabelaIbptServiceUnit,
  ISincronizadorFiscalNFSeServiceUnit;

type
  SincronizarDadosFiscaisUseCase = class(TInterfacedObject, ISincronizarDadosFiscaisUseCase)
  private
    FConnection: IDataBaseConnection;
    FConfigRepo: IConfiguracoesRepository;
    FObserver: IProgressObserver;
    FDownloadService: IDownloadService;
    FSincNCMsSICOMEX: ISincronizadorNCMsSICOMEXService;
    FSincTabelaIBPT: ISincronizadorTabelaIbptService;
    FSincFiscalNFSe: ISincronizadorFiscalNFSeService;

    FPathFiles: string;
    FTransaction: ITransaction;
    FDeleteFiles: TStrings;
    FHashs: TStrings;
  private
    procedure DoLog(const Value: string; IncrementStep: Boolean = True);
    procedure HandleSincronizacaoNCMs(const Input: ArquivosDownloadInput);
    procedure SalvarHashs();
  public
    constructor Create(
      Connection: IDataBaseConnection;
      ConfigRepo: IConfiguracoesRepository;
      Observer: IProgressObserver;
      DownloadService: IDownloadService;
      SincNCMsSICOMEX: ISincronizadorNCMsSICOMEXService;
      SincTabelaIBPT: ISincronizadorTabelaIbptService;
      SincFiscalNFSe: ISincronizadorFiscalNFSeService
    );
    destructor Destroy; override;

    procedure Executar(const Input: ArquivosDownloadInput);
  end;

implementation

uses
  StrUtils,
  DateTimeServiceUnit, FilesServiceUnit, ArquivosSICOMEXInputUnit, ConfiguracaoEtdUnit, StringNullableUnit,
  DoubleNullableUnit, DateAndTimeNullableUnit, StatusRegistroEnumUnit;

{ SincronizarDadosFiscaisUseCase }

constructor SincronizarDadosFiscaisUseCase.Create(
  Connection: IDataBaseConnection;
  ConfigRepo: IConfiguracoesRepository;
  Observer: IProgressObserver;
  DownloadService: IDownloadService;
  SincNCMsSICOMEX: ISincronizadorNCMsSICOMEXService;
  SincTabelaIBPT: ISincronizadorTabelaIbptService;
  SincFiscalNFSe: ISincronizadorFiscalNFSeService
);
begin
  FDeleteFiles := TStringList.Create();
  FHashs := TStringList.Create();
  FConnection := Connection;
  FConfigRepo := ConfigRepo;
  FObserver := Observer;
  FDownloadService := DownloadService;
  FSincNCMsSICOMEX := SincNCMsSICOMEX;
  FSincTabelaIBPT := SincTabelaIBPT;
  FSincFiscalNFSe := SincFiscalNFSe;
end;

destructor SincronizarDadosFiscaisUseCase.Destroy;
begin
  FDeleteFiles.Free();
  FHashs.Free();
  FTransaction.Free();
  inherited;
end;

procedure SincronizarDadosFiscaisUseCase.DoLog(const Value: string; IncrementStep: Boolean);
begin
  if Assigned(FObserver) then
  begin
    FObserver.OnMessage(Value);
    if IncrementStep then
    begin
//      Inc(FStepsCurrent);
//      FObserver.OnProgress( Trunc(FStepsCurrent / FStepsCount * 100) );
    end;
  end;
end;

procedure SincronizarDadosFiscaisUseCase.Executar(const Input: ArquivosDownloadInput);
var
  I: Integer;
  sFileName, erro: string;
  downloadResult: TDownloadResult;
begin

  if Assigned(FObserver) then
  begin
    FObserver.OnMessage('>>>> ATUALIZAÇÃO DE ARQUIVOS FISCAIS <<<<');
    if Length(Input) > 0 then
      FObserver.OnMessage(Format('>> Total de arquivos: %d ', [ Length(Input) ]))
    else
      FObserver.OnMessage('>> Banco de dados já possui os arquivos mais recentes');
  end;

  FPathFiles := IncludeTrailingPathDelimiter(FilesService.GetPathTemp(''));
  FTransaction := FConnection.BeginTransaction();
  try try
    HandleSincronizacaoNCMs( Input );

    // Arquivos Individuais
    for I := Low(Input) to High(Input) do
    begin
      // Guarda defensiva: a calculadora passou a ser sincronizada via API
      // Datasette; enquanto o fiscal-dist ainda publicar calculadora.db, o
      // arquivo deve ser ignorado (sem download, sem hash e sem remocao).
      if SameText(Input[I].Name, 'calculadora.db') then
      begin
        DoLog('Arquivo calculadora.db ignorado; a calculadora e sincronizada via API.');
        Continue;
      end;

      sFileName := FPathFiles + Input[I].Name;
      if Input[I].Name.Substring(0, 5).Equals('ibpt-') then
      begin
        FDeleteFiles.Add(sFileName);
        downloadResult := FDownloadService.DownloadFile( Input[I].Link, sFileName );
        if downloadResult.Success and FileExists(downloadResult.FilePath) then
          if FSincTabelaIBPT.Executar( SincronizadorTabelaIbptInput.Create(
            sFileName, Input[I].Name.Substring(5, 2).ToUpper()
          )) then
          begin
            FTransaction.Commit();
            FHashs.Values[Input[I].Name] := Input[I].Hash
          end
          else
            FTransaction.Rollback();
      end
      else if MatchText( Input[I].Name, ArquivoFiscalNFSeEnumName ) then
      begin
        FDeleteFiles.Add(sFileName);
        downloadResult := FDownloadService.DownloadFile( Input[I].Link, sFileName );
        if downloadResult.Success and FileExists(downloadResult.FilePath) then
          if FSincFiscalNFSe.Executar( sFileName ) then
          begin
            FTransaction.Commit();
            FHashs.Values[Input[I].Name] := Input[I].Hash
          end
          else
            FTransaction.Rollback();
      end;
    end;

  except on E: Exception do
    if Assigned(FObserver) then
      FObserver.OnError(E.Message);
  end;
  finally
    try
      SalvarHashs();
    except on E: Exception do
      begin
        if Assigned(FObserver) then
          FObserver.OnError('Erro ao salvar estado da atualizacao: ' + E.Message);
      end;
    end;

    for sFileName in FDeleteFiles do
      if FileExists(sFileName) then
        DeleteFile(sFileName);
  end;
end;

procedure SincronizarDadosFiscaisUseCase.HandleSincronizacaoNCMs(const Input: ArquivosDownloadInput);
var
  I, J: Integer;
  link, ncm: string;
begin
  // Arquivos NCMS, separado pois sao 3 arquivos para 1 Servico, entao faz o download dos 3 caso pelo menos 1 presente
  for I := Low(Input) to High(Input) do
    if MatchText(Input[I].Name, ArquivoSicomexEnumName ) then
    begin
      link := Input[I].Link.Substring( 0, Input[I].Link.Length - Input[I].Name.Length );

      for ncm in ArquivoSicomexEnumName do
      begin
        FDeleteFiles.Add(FPathFiles + ncm);

        if not FDownloadService.DownloadFile( link + ncm, FPathFiles + ncm ).Success
          or not FileExists(FPathFiles + ncm)
        then
          Exit;
      end;

      if FSincNCMsSICOMEX.Executar( ArquivosSICOMEXInput.Create(
        FPathFiles + ArquivoSicomexEnumName[siHistorico],
        FPathFiles + ArquivoSicomexEnumName[siFuturo],
        FPathFiles + ArquivoSicomexEnumName[siVigente]
      )) then
      begin
        FTransaction.Commit();

        for J := Low(Input) to High(Input) do
          if MatchText(Input[J].Name, ArquivoSicomexEnumName ) then
            FHashs.Values[Input[J].Name] := Input[J].Hash;
      end
      else
        FTransaction.Rollback();

      Break;
    end;
end;

procedure SincronizarDadosFiscaisUseCase.SalvarHashs;
var
  config: ConfiguracaoEtd;
  I: Integer;
  doCreate : Boolean;
begin
  config := FConfigRepo.GetByKey('fiscal_dist_manifest', 0);

  doCreate := config = nil;
  if doCreate then
    config := ConfiguracaoEtd.Create(
      'fiscal_dist_manifest', 0, 'Hashes atualizacao arquivos fiscais', 'string', StringNullable.NullInstance(),
      DoubleNullable.NullInstance(), TStringList.Create(), DateTimeNullable.NullInstance(), '', saLixeira
    );

  try
    for I := 0 to FHashs.Count - 1 do
      config.ValorStrings.Values[ FHashs.KeyNames[I] ] := FHashs.ValueFromIndex[I];

    config.ValorDateTime.SetValue( Now() );

    if doCreate then
      FConfigRepo.Post( config )
    else
      FConfigRepo.Put( config );

    Ftransaction.Commit();
  finally
    // GetByKey devolve entidade de propriedade do chamador e ConfiguracaoEtd.Create
    // tambem; Post/Put nao tomam posse. Libera sempre (sucesso ou falha) para nao
    // vazar a configuracao do manifesto.
    config.Free();
  end;
end;

end.
