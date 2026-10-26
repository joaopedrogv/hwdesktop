unit tipo_grade_ec_class;

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
  TTipo_grade_ec_class = class(TBaseFb_class)
  private
    Fcod_empresa  : Integer;
    Fdescricao    : string;
    Fativo        : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property descricao    : string  read Fdescricao     write Fdescricao;
    property ativo        : Variant read Fativo         write Fativo;
  end;

  TTipos_grade_ec_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TTipo_grade_ec_class;
    procedure SetItem(Index: Integer; const Value: TTipo_grade_ec_class);
  public
    function New: TTipo_grade_ec_class;

    property Items[Index: Integer]: TTipo_grade_ec_class read GetItem write SetItem;
  end;

implementation

{ TTipo_grade_ec_class }

constructor TTipo_grade_ec_class.Create;
begin
  InitializeObjects;
end;

procedure TTipo_grade_ec_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('TIPO_GRADE_EC');
  with FTable.Fields do
  begin
    AddField('COD_TIPO'     , fkInteger, 0  , False, True              );
    AddField('COD_EMPRESA'  , fkInteger, 0  , False, True              );
    AddField('DESCRICAO'    , fkString , 100                           );
    AddField('ATIVO'        , fkInteger, 0  , True , False, False, True);
  end;
end;

{ TTipos_grade_ec_class }

function TTipos_grade_ec_class.GetItem(Index: Integer): TTipo_grade_ec_class;
begin
  Result := TTipo_grade_ec_class(inherited Items[Index]);
end;

function TTipos_grade_ec_class.New: TTipo_grade_ec_class;
begin
  Result := TTipo_grade_ec_class.Create;
  Add(Result);
end;

procedure TTipos_grade_ec_class.SetItem(Index: Integer;
  const Value: TTipo_grade_ec_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TTipo_grade_ec_class);
finalization
  UnRegisterClass(TTipo_grade_ec_class);

end.
