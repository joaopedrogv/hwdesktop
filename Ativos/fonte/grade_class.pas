unit grade_class;

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
  TGrade_class = class(TBaseFb_class)
  private
    Fcod_grade    : Integer;
    Fcod_empresa  : Integer;
    Fdescricao    : string;
    Fdescricao1   : string;
    Fativo        : Variant;
    Ftipo_ec      : string;
    Fdescricao_ec : string;
    Ftipo_ec1     : string;
    Fdescricao_ec1: string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_grade    : Integer read Fcod_grade     write Fcod_grade;
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property descricao    : string  read Fdescricao     write Fdescricao;
    property descricao1   : string  read Fdescricao1    write Fdescricao1;
    property ativo        : Variant read Fativo         write Fativo;
    property tipo_ec      : string  read Ftipo_ec       write Ftipo_ec;
    property descricao_ec : string  read Fdescricao_ec  write Fdescricao_ec;
    property tipo_ec1     : string  read Ftipo_ec1      write Ftipo_ec1;
    property descricao_ec1: string  read Fdescricao_ec1 write Fdescricao_ec1;
  end;

  TGrades_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TGrade_class;
    procedure SetItem(Index: Integer; const Value: TGrade_class);
  public
    function New: TGrade_class;

    property Items[Index: Integer]: TGrade_class read GetItem write SetItem;
  end;

implementation

{ TGrade_class }

procedure TGrade_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('GRADE');
  with FTable.Fields do
  begin
    AddField('COD_GRADE'    , fkInteger, 0  , False, True              );
    AddField('COD_EMPRESA'  , fkInteger, 0  , False, True              );
    AddField('DESCRICAO'    , fkString , 32                            );
    AddField('DESCRICAO1'   , fkString , 32                            );
    AddField('ATIVO'        , fkInteger, 0  , True , False, False, True);
    AddField('TIPO_EC'      , fkString , 100                           );
    AddField('DESCRICAO_EC' , fkString , 100                           );
    AddField('TIPO_EC1'     , fkString , 100                           );
    AddField('DESCRICAO_EC1', fkString , 100                           );
  end;
end;

constructor TGrade_class.Create;
begin
  InitializeObjects;
end;

{ TGrades_class }

function TGrades_class.GetItem(Index: Integer): TGrade_class;
begin
  Result := TGrade_class(inherited Items[Index]);
end;

function TGrades_class.New: TGrade_class;
begin
  Result := TGrade_class.Create;
  Add(Result);
end;

procedure TGrades_class.SetItem(Index: Integer; const Value: TGrade_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TGrade_class);
finalization
  UnRegisterClass(TGrade_class);

end.
