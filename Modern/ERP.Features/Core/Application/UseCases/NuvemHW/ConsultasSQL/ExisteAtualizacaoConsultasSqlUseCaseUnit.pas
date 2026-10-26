unit ExisteAtualizacaoConsultasSqlUseCaseUnit;

interface

uses
  SysUtils, Classes,
  IManifestSincServiceUnit, IHashComparatorServiceUnit, ILocalManifestHashesServiceUnit, IProgressObserverUnit;

type
  IExisteAtualizacaoConsultasSqlUseCase = interface
    ['{09153BDC-26D4-4A99-B508-050A3D2EAEDC}']
    function Executar(): Boolean;
  end;

  ExisteAtualizacaoConsultasSqlUseCase = class(TInterfacedObject, IExisteAtualizacaoConsultasSqlUseCase)
  private
    FManifestService: IManifestSincService;
    FHashComparator: IHashComparatorService;
    FLocalHashes: ILocalManifestHashesService;
    FObserver: IProgressObserver;
  public
    constructor Create(
      ManifestService: IManifestSincService;
      HashComparator: IHashComparatorService;
      LocalHashes: ILocalManifestHashesService;
      Observer: IProgressObserver
    );

    function Executar(): Boolean;
  end;

implementation

uses
  System.Generics.Collections,
  ManifestFilesModelUnit, ArquivoDownloadModel, ArquivosERPConstsUnit;

{ ExisteAtualizacaoConsultasSqlUseCase }

constructor ExisteAtualizacaoConsultasSqlUseCase.Create(
  ManifestService: IManifestSincService;
  HashComparator: IHashComparatorService;
  LocalHashes: ILocalManifestHashesService;
  Observer: IProgressObserver
);
begin
  FManifestService := ManifestService;
  FHashComparator := HashComparator;
  FLocalHashes := LocalHashes;
  FObserver := Observer;
end;

function ExisteAtualizacaoConsultasSqlUseCase.Executar(): Boolean;
var
  manifesto: ManifestModel;
  localHashes, arquivosRemover: TArray<string>;
  arquivosAlterados, arquivosNovos: TArray<ArquivoDownload>;
  I: Integer;
begin
  Result := False;
  FObserver.OnStart();

  manifesto := FManifestService.ObterManifesto(URL_MANIFEST, CONSULTAS_CONTEXT_PATH);

  if manifesto = nil then
    Exit;

  FObserver.OnMessage('Obtendo manifesto online');

  try try
    localHashes := FLocalHashes.ObterLocalHashes(CONSULTAS_CONFIG_ID);

    arquivosAlterados := FHashComparator.ObterAlterados( manifesto, localHashes );

    arquivosNovos := FHashComparator.ObterNovos( manifesto, localHashes );

    arquivosRemover := FHashComparator.ObterHashesAusentes( manifesto, localHashes );

    Result :=  (Length(arquivosNovos) > 0)
      or (Length(arquivosAlterados) > 0)
      or (Length(arquivosRemover) > 0);

    if Result then
      FObserver.OnMessage('Existe atualização')
    else
      FObserver.OnMessage('Não existe nenhuma atualização no momento');

    FObserver.OnComplete();

  except on E: Exception do
    begin
      FObserver.OnError(E.Message);
    end;
  end;
  finally
    Sleep(5000);
    manifesto.Free();
  end;
end;

end.
