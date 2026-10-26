unit marca_prod_ec_class;

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
  TMarca_prod_ec_class = class(TBaseFb_class)
  private
    Fcod_marca      : Integer;
    Fcod_empresa    : Integer;
    Fid_commerce    : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_marca      : Integer read Fcod_marca       write Fcod_marca;
    property cod_empresa    : Integer read Fcod_empresa     write Fcod_empresa;
    property id_commerce    : Variant read Fid_commerce     write Fid_commerce;
  end;

  TMarca_prod_ecs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TMarca_prod_ec_class;
    procedure SetItem(Index: Integer; const Value: TMarca_prod_ec_class);
  public
    function New: TMarca_prod_ec_class;

    property Items[Index: Integer]: TMarca_prod_ec_class read GetItem write SetItem;
  end;

implementation

{ TMarca_prod_ec_class }

constructor TMarca_prod_ec_class.Create;
begin
  InitializeObjects;
end;

procedure TMarca_prod_ec_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('MARCA_PROD_EC');
  with FTable.Fields do
  begin
    AddField('COD_MARCA'      , fkInteger, 0 , False, True              );
    AddField('COD_EMPRESA'    , fkInteger, 0 , False, True              );
    AddField('ID_COMMERCE'    , fkInteger                               );
  end;
end;

{ TMarca_prod_ecs_class }

function TMarca_prod_ecs_class.GetItem(Index: Integer): TMarca_prod_ec_class;
begin
  Result := TMarca_prod_ec_class(inherited Items[Index]);
end;

function TMarca_prod_ecs_class.New: TMarca_prod_ec_class;
begin
  Result := TMarca_prod_ec_class.Create;
  Add(Result);
end;

procedure TMarca_prod_ecs_class.SetItem(Index: Integer;
  const Value: TMarca_prod_ec_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TMarca_prod_ec_class);
finalization
  UnRegisterClass(TMarca_prod_ec_class);

end.
