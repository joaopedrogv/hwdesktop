unit produtos_ec_grade_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB,
  IBQuery,
  basefb_class,
  Classes,
  Variants;
{$ELSE}
  System.Contnrs,
  Data.DB,
  IBX.IBQuery,
  basefb_class,
  System.Classes,
  System.Variants;
{$ENDIF}

type

  TProdutos_ec_grade_class = class(TBaseFb_class)
  private
    Fgrupo_prod     : Integer;
    Fcod_prod       : string;
    Fcod_grade      : Integer;
    Fcod_empresa    : Integer;
    Fsinc_ecommerce : string;
    Fid_commerce    : Integer;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property grupo_prod     : Integer read Fgrupo_prod     write Fgrupo_prod;
    property cod_prod       : string  read Fcod_prod       write Fcod_prod;
    property cod_grade      : Integer read Fcod_grade      write Fcod_grade;
    property cod_empresa    : Integer read Fcod_empresa    write Fcod_empresa;
    property sinc_ecommerce : string  read Fsinc_ecommerce write Fsinc_ecommerce;
    property id_commerce    : Integer read Fid_commerce    write Fid_commerce;
  end;

  TProdutos_ec_grades_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TProdutos_ec_grade_class;
    procedure SetItem(Index: Integer; const Value: TProdutos_ec_grade_class);
  public
    function New: TProdutos_ec_grade_class;

    property Items[Index: Integer]: TProdutos_ec_grade_class read GetItem write SetItem;
  end;

implementation

{ TProdutos_ec_grade_class }

constructor TProdutos_ec_grade_class.Create;
begin
  InitializeObjects;
end;

procedure TProdutos_ec_grade_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('PRODUTOS_EC_GRADE');
  with FTable.Fields do
  begin
    AddField('GRUPO_PROD'    , fkInteger, 0  , False, True              );
    AddField('COD_PROD'      , fkString, 6   , False, True              );
    AddField('COD_GRADE'     , fkInteger, 0  , False, True              );
    AddField('COD_EMPRESA'   , fkInteger, 0  , False, True              );
    AddField('SINC_ECOMMERCE', fkString, 0   , False, True              );
    AddField('ID_COMMERCE'   , fkInteger, 0  , False, True              );
  end;
end;

{ TProdutos_ec_grades_class }

function TProdutos_ec_grades_class.GetItem(
  Index: Integer): TProdutos_ec_grade_class;
begin
  Result := TProdutos_ec_grade_class(inherited Items[Index]);
end;

function TProdutos_ec_grades_class.New: TProdutos_ec_grade_class;
begin
  Result := TProdutos_ec_grade_class.Create;
  Add(Result);
end;

procedure TProdutos_ec_grades_class.SetItem(Index: Integer;
  const Value: TProdutos_ec_grade_class);
begin
  Put(Index, Value);
end;

end.
