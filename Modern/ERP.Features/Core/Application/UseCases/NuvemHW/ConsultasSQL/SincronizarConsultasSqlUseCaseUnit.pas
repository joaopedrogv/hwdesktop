unit SincronizarConsultasSqlUseCaseUnit;

interface

uses
  SysUtils, Classes,
  IDataBaseConnectionUnit, IManifestSincServiceUnit, IDownloadServiceUnit, IHashComparatorServiceUnit,
  IConfiguracoesRepositoryUnit, ILocalManifestHashesServiceUnit, IConsultasSqlRepositoryUnit, IProgressObserverUnit;

type
  ISincronizarConsultasSqlUseCase = interface
    ['{B753060B-6C3E-4616-AA96-CFEC51802DD2}']
    procedure Executar();
  end;

  SincronizarConsultasSqlUseCase = class(TInterfacedObject, ISincronizarConsultasSqlUseCase)
  private
    FConnection: IDataBaseConnection;
    FConsultasSqlRepo: IConsultasSqlRepository;
    FManifestService: IManifestSincService;
    FDownloadService: IDownloadService;
    FHashComparator: IHashComparatorService;
    FLocalHashes: ILocalManifestHashesService;
    FObserver: IProgressObserver;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      ConsultasSqlRepo: IConsultasSqlRepository;
      ManifestService: IManifestSincService;
      DownloadService: IDownloadService;
      HashComparator: IHashComparatorService;
      LocalHashes: ILocalManifestHashesService;
      Observer: IProgressObserver
    );

    procedure Executar();
  end;

implementation

uses
  System.Generics.Collections,
  ManifestFilesModelUnit, ArquivoDownloadModel, ConsultaSqlEtdUnit, ITransactionUnit, ArquivosERPConstsUnit;

{ SincronizarConsultasSqlUseCase }

constructor SincronizarConsultasSqlUseCase.Create(
  Connection: IDataBaseConnection;
  ConsultasSqlRepo: IConsultasSqlRepository;
  ManifestService: IManifestSincService;
  DownloadService: IDownloadService;
  HashComparator: IHashComparatorService;
  LocalHashes: ILocalManifestHashesService;
  Observer: IProgressObserver
);
begin
  FConnection := Connection;
  FConsultasSqlRepo := ConsultasSqlRepo;
  FManifestService := ManifestService;
  FDownloadService := DownloadService;
  FHashComparator := HashComparator;
  FLocalHashes := LocalHashes;
  FObserver := Observer;
end;

procedure SincronizarConsultasSqlUseCase.Executar;
var
  manifesto: ManifestModel;
  localHashes, arquivosRemover: TArray<string>;
  arquivosAlterados, arquivosNovos: TArray<ArquivoDownload>;
  salvarHashes: TStrings;
  arquivo: ArquivoDownload;
  contentBytes: TBytes;
  contentFile, S: string;
  consultas: ConsultaSqlEtdList;
  I: Integer;
  transaction: ITransaction;
begin
  FObserver.OnStart();

  manifesto := FManifestService.ObterManifesto(URL_MANIFEST, CONSULTAS_CONTEXT_PATH);

  if manifesto = nil then
    Exit;

  FObserver.OnMessage('Obtendo manifesto online');

  consultas := ConsultaSqlEtdList.Create();
  salvarHashes := TStringList.Create();
  transaction := FConnection.BeginTransaction();
  try try
    localHashes := FLocalHashes.ObterLocalHashes(CONSULTAS_CONFIG_ID);

    salvarHashes.AddStrings( localHashes );

    arquivosAlterados := FHashComparator.ObterAlterados( manifesto, localHashes );

    arquivosNovos := FHashComparator.ObterNovos( manifesto, localHashes );

    arquivosRemover := FHashComparator.ObterHashesAusentes( manifesto, localHashes );

    if (Length(arquivosNovos) = 0)
      and (Length(arquivosAlterados) = 0)
      and (Length(arquivosRemover) = 0)
    then
    begin
      FObserver.OnMessage('Nenhuma modificação a fazer');
      Exit;
    end;

    FObserver.OnMessage('Incluindo novos registros');

    // Inclusao
    for arquivo in arquivosNovos do
    begin
      FObserver.OnMessage('Novo ' + arquivo.Name);

      contentBytes := FDownloadService.DownloadFileToMemory(arquivo.Link);

      contentFile := TEncoding.UTF8.GetString(contentBytes);

      consultas.Add(ConsultaSqlEtd.Create(arquivo.Name, contentFile));

      salvarHashes.Values[arquivo.Name] := arquivo.Hash;
    end;

    FConsultasSqlRepo.Incluir(consultas);

    consultas.Clear();

    FObserver.OnMessage('Atualizando registros');

    // Alteracao
    for arquivo in arquivosAlterados do
    begin
      FObserver.OnMessage('Atualizacao ' + arquivo.Name);

      contentBytes := FDownloadService.DownloadFileToMemory(arquivo.Link);

      contentFile := TEncoding.UTF8.GetString(contentBytes);

      consultas.Add(ConsultaSqlEtd.Create(arquivo.Name, contentFile));

      salvarHashes.Values[arquivo.Name] := arquivo.Hash;
    end;

    FConsultasSqlRepo.Atualizar(consultas);

    FObserver.OnMessage('Removendo registros obsoletos');

    // Exclusao

    FConsultasSqlRepo.Remover(arquivosRemover);

    for S in arquivosRemover do
    begin
      FObserver.OnMessage('Obsoleto ' + S);
      if salvarHashes.IndexOfName(S) > -1 then
        salvarHashes.Delete(salvarHashes.IndexOfName(S));
    end;

    FLocalHashes.SalvarHashes( CONSULTAS_CONFIG_ID, salvarHashes.ToStringArray() );

    FObserver.OnMessage('Processo concluído');

    transaction.Commit();

    FObserver.OnComplete();

  except on E: Exception do
    begin
      transaction.Rollback;
      FObserver.OnError(E.Message);
    end;
  end;
  finally
    manifesto.Free();
    consultas.Free();
    Sleep(10000);
  end;
end;

end.
