unit marca_prod_class;

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
  TMarca_prod_class = class(TBaseFb_class)
  private
    Fcod_marca      : Integer;
    Fdescricao_marca: string;
    Fcod_usuario    : Variant;
    Fcod_usuario_alt: Variant;
    Fativo          : Variant;
    Ftipo_marca     : string;
    Fid_commerce    : Variant;
    Fdescricao_ec   : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_marca      : Integer read Fcod_marca       write Fcod_marca;
    property descricao_marca: string  read Fdescricao_marca write Fdescricao_marca;
    property cod_usuario    : Variant read Fcod_usuario     write Fcod_usuario;
    property cod_usuario_alt: Variant read Fcod_usuario_alt write Fcod_usuario_alt;
    property ativo          : Variant read Fativo           write Fativo;
    property tipo_marca     : string  read Ftipo_marca      write Ftipo_marca;
    property id_commerce    : Variant read Fid_commerce     write Fid_commerce;
    property descricao_ec   : string  read Fdescricao_ec    write Fdescricao_ec;
  end;

  TMarca_prods_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TMarca_prod_class;
    procedure SetItem(Index: Integer; const Value: TMarca_prod_class);
  public
    function New: TMarca_prod_class;

    property Items[Index: Integer]: TMarca_prod_class read GetItem write SetItem;
  end;

implementation

{ TMarca_prod_class }

procedure TMarca_prod_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('MARCA_PROD');
  with FTable.Fields do
  begin
    AddField('COD_MARCA'      , fkInteger, 0 , False, True              );
    AddField('DESCRICAO_MARCA', fkString , 30                           );
    AddField('COD_USUARIO'    , fkInteger                               );
    AddField('COD_USUARIO_ALT', fkInteger                               );
    AddField('ATIVO'          , fkInteger, 0 , True , False, False, True);
    AddField('TIPO_MARCA'     , fkString , 1                            );
    AddField('ID_COMMERCE'    , fkInteger                               );
    AddField('DESCRICAO_EC'   , fkString , 30                           );
  end;
end;

constructor TMarca_prod_class.Create;
begin
  InitializeObjects;
end;

{ TMarca_prods_class }

function TMarca_prods_class.GetItem(Index: Integer): TMarca_prod_class;
begin
  Result := TMarca_prod_class(inherited Items[Index]);
end;

function TMarca_prods_class.New: TMarca_prod_class;
begin
  Result := TMarca_prod_class.Create;
  Add(Result);
end;

procedure TMarca_prods_class.SetItem(Index: Integer; const Value: TMarca_prod_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TMarca_prod_class);
finalization
  UnRegisterClass(TMarca_prod_class);

end.
