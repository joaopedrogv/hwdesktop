unit rnv_municipio_class;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type
  TRnv_municipio_class = class(TBaseFb_class)
  private
    Fid    : Integer;
    Fnome  : string;
    Fuf    : string;
    Fibgeid: Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id    : Integer read Fid     write Fid;
    property nome  : string  read Fnome   write Fnome;
    property uf    : string  read Fuf     write Fuf;
    property ibgeid: Variant read Fibgeid write Fibgeid;
  end;

  TRnv_municipios_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TRnv_municipio_class;
    procedure SetItem(Index: Integer; const Value: TRnv_municipio_class);
  public
    function New: TRnv_municipio_class;

    property Items[Index: Integer]: TRnv_municipio_class read GetItem write SetItem;
  end;

implementation

{ TRnv_municipio_class }

procedure TRnv_municipio_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('RNV_MUNICIPIO');
  with FTable.Fields do
  begin
    AddField('ID'    , fkInteger, 0 , False, True);
    AddField('NOME'  , fkString , 40             );
    AddField('UF'    , fkString , 2              );
    AddField('IBGEID', fkInteger                 );
  end;
end;

constructor TRnv_municipio_class.Create;
begin
  InitializeObjects;
end;

{ TRnv_municipios_class }

function TRnv_municipios_class.GetItem(Index: Integer): TRnv_municipio_class;
begin
  Result := TRnv_municipio_class(inherited Items[Index]);
end;

function TRnv_municipios_class.New: TRnv_municipio_class;
begin
  Result := TRnv_municipio_class.Create;
  Add(Result);
end;

procedure TRnv_municipios_class.SetItem(Index: Integer; const Value: TRnv_municipio_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TRnv_municipio_class);
finalization
  UnRegisterClass(TRnv_municipio_class);

end.
