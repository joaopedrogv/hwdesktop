unit ManifestFilesModelUnit;

interface

uses
  SysUtils, Classes;

type
  ManifestFileModel = class
  private
    Fpath: string;
    Fsize: Integer;
    Fhash: string;
    Furl: string;
    Fupdated: TDateTime;
    function GetFileName: string;
  public
    function Clone(): ManifestFileModel;

    property path: string read Fpath write Fpath;
    property size: Integer read Fsize write Fsize;
    property hash: string read Fhash write Fhash;
    property url: string read Furl write Furl;
    property updated: TDateTime read Fupdated write Fupdated;
    property fileName: string read GetFileName;
  end;

  ManifestModel = class
  private
    Fversion: string;
    Fgenerated_at: string;
    Ffiles: TArray<ManifestFileModel>;
  public
    destructor Destroy; override;

    property version: string read Fversion write Fversion;
    property generated_at: string read Fgenerated_at write Fgenerated_at;
    property files: TArray<ManifestFileModel> read Ffiles write Ffiles;
  end;

implementation

{ ManifestModel }

destructor ManifestModel.Destroy;
var
  I: Integer;
begin
  for I := Low(Ffiles) to High(Ffiles) do
    FreeAndNil( Ffiles[I] );

  SetLength( Ffiles, 0 );

  inherited;
end;

{ ManifestFileModel }

function ManifestFileModel.Clone: ManifestFileModel;
begin
  if Self = nil then
    Result := nil
  else
  begin
    Result := ManifestFileModel.Create;
    Result.Fpath := Self.Fpath;
    Result.Fsize := Self.Fsize;
    Result.Fhash := Self.Fhash;
    Result.Furl := Self.Furl;
    Result.Fupdated := Self.Fupdated;
  end;
end;

function ManifestFileModel.GetFileName: string;
begin
  Result := Copy(Fpath, Pos('\', Fpath) + 1, Length(Fpath));
end;

end.
