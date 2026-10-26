unit categoria_class;

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
  TCategoria_class = class(TBaseFb_class)
  private
    Fcod_categoria    : Integer;
    Fcod_empresa      : Integer;
    Fdescricao        : string;
    Fcod_categoria_pai: Variant;
    Fid_commerce      : Variant;
    Fativo            : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_categoria    : Integer read Fcod_categoria     write Fcod_categoria;
    property cod_empresa      : Integer read Fcod_empresa       write Fcod_empresa;
    property descricao        : string  read Fdescricao         write Fdescricao;
    property cod_categoria_pai: Variant read Fcod_categoria_pai write Fcod_categoria_pai;
    property id_commerce      : Variant read Fid_commerce       write Fid_commerce;
    property ativo            : Variant read Fativo             write Fativo;
  end;

  TCategorias_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCategoria_class;
    procedure SetItem(Index: Integer; const Value: TCategoria_class);
  public
    function New: TCategoria_class;

    property Items[Index: Integer]: TCategoria_class read GetItem write SetItem;
  end;

implementation

{ TCategoria_class }

procedure TCategoria_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CATEGORIA');
  with FTable.Fields do
  begin
    AddField('COD_CATEGORIA'    , fkInteger, 0 , False, True              );
    AddField('COD_EMPRESA'      , fkInteger, 0 , False, True              );
    AddField('DESCRICAO'        , fkString , 50                           );
    AddField('COD_CATEGORIA_PAI', fkInteger                               );
    AddField('ID_COMMERCE'      , fkInteger                               );
    AddField('ATIVO'            , fkInteger, 0 , True , False, False, True);
  end;
end;

constructor TCategoria_class.Create;
begin
  InitializeObjects;
end;

{ TCategorias_class }

function TCategorias_class.GetItem(Index: Integer): TCategoria_class;
begin
  Result := TCategoria_class(inherited Items[Index]);
end;

function TCategorias_class.New: TCategoria_class;
begin
  Result := TCategoria_class.Create;
  Add(Result);
end;

procedure TCategorias_class.SetItem(Index: Integer; const Value: TCategoria_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCategoria_class);
finalization
  UnRegisterClass(TCategoria_class);

end.
