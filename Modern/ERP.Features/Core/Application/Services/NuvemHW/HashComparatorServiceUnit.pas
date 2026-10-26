unit HashComparatorServiceUnit;

interface

uses
  System.Generics.Collections,
  IHashComparatorServiceUnit, ArquivoDownloadModel, ManifestFilesModelUnit;

type
  HashComparatorService = class(TInterfacedObject, IHashComparatorService)
  public
    function ObterAlterados(
      const ManifestoRemoto: ManifestModel; const LocalHashes: TArray<string>
    ): TArray<ArquivoDownload>;

    function ObterNovos(
      const ManifestoRemoto: ManifestModel; const LocalHashes: TArray<string>
    ): TArray<ArquivoDownload>;

    function ObterHashesAusentes(
      const ManifestoRemoto: ManifestModel; const LocalHashes: TArray<string>
    ): TArray<string>;
  end;

implementation

uses
  SysUtils, Classes;

{ HashComparatorService }

function HashComparatorService.ObterAlterados(
  const ManifestoRemoto: ManifestModel; const LocalHashes: TArray<string>
): TArray<ArquivoDownload>;
var
  hashes: TStrings;
  arquivo: ArquivoDownload;
  I: Integer;
begin
  Result := [];

  hashes := TStringList.Create();
  try
    hashes.AddStrings(LocalHashes);
      
    for I := Low(ManifestoRemoto.files) to High(ManifestoRemoto.files) do
    begin
      arquivo := ArquivoDownload.Create( ManifestoRemoto.files[I].fileName, ManifestoRemoto.files[I].url, ManifestoRemoto.files[I].hash );

      if (hashes.IndexOfName(ManifestoRemoto.files[I].fileName) > -1)
        and (hashes.Values[ManifestoRemoto.files[I].fileName] <> ManifestoRemoto.files[I].hash)
      then
        Result := Result + [ arquivo ];
    end;

  finally
    hashes.Free();
  end;
end;

function HashComparatorService.ObterHashesAusentes(const ManifestoRemoto: ManifestModel;
  const LocalHashes: TArray<string>): TArray<string>;
var
  hashesManifesto, hashesAusentes, hashesLocais: TStrings;
  hash: string;
  I: Integer;
begin
  hashesAusentes := TStringList.Create();
  hashesManifesto := TStringList.Create();
  hashesLocais := TStringList.Create();
  try
    for I := Low(ManifestoRemoto.files) to High(ManifestoRemoto.files) do
      hashesManifesto.Add(ManifestoRemoto.files[I].fileName);

    hashesLocais.AddStrings(LocalHashes);

    //for hash in LocalHashes do
    for I := 0 to hashesLocais.Count - 1 do
      if hashesManifesto.IndexOf(hashesLocais.Names[I]) = -1 then
        hashesAusentes.Add(hashesLocais.Names[I]);

    Result := hashesAusentes.ToStringArray();

  finally
    hashesAusentes.Free();
    hashesManifesto.Free();
    hashesLocais.Free();
  end;
end;

function HashComparatorService.ObterNovos(const ManifestoRemoto: ManifestModel;
  const LocalHashes: TArray<string>): TArray<ArquivoDownload>;
var
  hashes: TStrings;
  arquivo: ArquivoDownload;
  I: Integer;
begin
  Result := [];

  hashes := TStringList.Create();
  try
    hashes.AddStrings(LocalHashes);

    for I := Low(ManifestoRemoto.files) to High(ManifestoRemoto.files) do
    begin
      arquivo := ArquivoDownload.Create( ManifestoRemoto.files[I].fileName, ManifestoRemoto.files[I].url, ManifestoRemoto.files[I].hash );

      if hashes.IndexOfName(ManifestoRemoto.files[I].fileName) = -1 then
        Result := Result + [ arquivo ];
    end;

  finally
    hashes.Free();
  end;
end;

end.
