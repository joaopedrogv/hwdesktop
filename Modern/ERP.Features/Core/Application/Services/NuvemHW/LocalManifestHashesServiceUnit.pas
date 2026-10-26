unit LocalManifestHashesServiceUnit;

interface

uses
  SysUtils, Classes, System.Generics.Collections,
  ILocalManifestHashesServiceUnit, IConfiguracoesRepositoryUnit;

type
  LocalManifestHashesService = class(TInterfacedObject, ILocalManifestHashesService)
  private
    FConfigRepo: IConfiguracoesRepository;
  public
    constructor Create(ConfigRepo: IConfiguracoesRepository);

    function ObterLocalHashes(const ConfigId: string): TArray<string>;
    procedure SalvarHashes(const ConfigId: string; Hashes: TArray<string>);
  end;

implementation

uses
  ConfiguracaoEtdUnit, StringNullableUnit, DoubleNullableUnit, DateAndTimeNullableUnit, StatusRegistroEnumUnit;

{ LocalManifestHashesService }

constructor LocalManifestHashesService.Create(ConfigRepo: IConfiguracoesRepository);
begin
  FConfigRepo := ConfigRepo;
end;

function LocalManifestHashesService.ObterLocalHashes(const ConfigId: string): TArray<string>;
var
  config: ConfiguracaoEtd;
begin
  Result := [];
  config := FConfigRepo.GetByKey(ConfigId, 0);

  if config = nil then
    Exit;

  try
    Result := config.ValorStrings.ToStringArray();

  finally
    config.Free();
  end;
end;

procedure LocalManifestHashesService.SalvarHashes(const ConfigId: string; Hashes: TArray<string>);
var
  config: ConfiguracaoEtd;
  I: Integer;
  doCreate : Boolean;
  hash: TPair<string,string>;
begin
  config := FConfigRepo.GetByKey(ConfigId, 0);

  doCreate := config = nil;
  if doCreate then
    config := ConfiguracaoEtd.Create(
      ConfigId, 0, 'Hashes atualizacao', 'string', StringNullable.NullInstance(),
      DoubleNullable.NullInstance(), TStringList.Create(), DateTimeNullable.NullInstance(), '', saLixeira
    );

  config.ValorStrings.Clear();
  config.ValorStrings.AddStrings(Hashes);

  //for hash in Hashes do
    //config.ValorStrings.Values[ hash.Key ] := hash.Value;

  config.ValorDateTime.SetValue( Now() );

  if doCreate then
    FConfigRepo.Post( config )
  else
    FConfigRepo.Put( config );
end;

end.
