unit rnv_estoque_restr_class;

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
  TRnv_estoque_restr_class = class(TBaseFb_class)
  private
    Fid                 : Int64;
    Fidx                : Integer;
    Fcod_empresa        : Integer;
    Fcodigotiporestricao: string;
    Ftiporestricao      : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id                 : Int64   read Fid                  write Fid;
    property idx                : Integer read Fidx                 write Fidx;
    property cod_empresa        : Integer read Fcod_empresa         write Fcod_empresa;
    property codigotiporestricao: string  read Fcodigotiporestricao write Fcodigotiporestricao;
    property tiporestricao      : string  read Ftiporestricao       write Ftiporestricao;
  end;

  TRnv_estoque_restrs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TRnv_estoque_restr_class;
    procedure SetItem(Index: Integer; const Value: TRnv_estoque_restr_class);
  public
    function New: TRnv_estoque_restr_class;

    property Items[Index: Integer]: TRnv_estoque_restr_class read GetItem write SetItem;
  end;

implementation

{ TRnv_estoque_restr_class }

procedure TRnv_estoque_restr_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('RNV_ESTOQUE_RESTR');
  with FTable.Fields do
  begin
    AddField('ID'                 , fkInteger, 0 , False, True, True);
    AddField('IDX'                , fkInteger, 0 , False, True      );
    AddField('COD_EMPRESA'        , fkInteger, 0 , False, True, True);
    AddField('CODIGOTIPORESTRICAO', fkString , 32                   );
    AddField('TIPORESTRICAO'      , fkString , 64                   );
  end;
end;

constructor TRnv_estoque_restr_class.Create;
begin
  InitializeObjects;
end;

{ TRnv_estoque_restrs_class }

function TRnv_estoque_restrs_class.GetItem(Index: Integer): TRnv_estoque_restr_class;
begin
  Result := TRnv_estoque_restr_class(inherited Items[Index]);
end;

function TRnv_estoque_restrs_class.New: TRnv_estoque_restr_class;
begin
  Result := TRnv_estoque_restr_class.Create;
  Add(Result);
end;

procedure TRnv_estoque_restrs_class.SetItem(Index: Integer; const Value: TRnv_estoque_restr_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TRnv_estoque_restr_class);
finalization
  UnRegisterClass(TRnv_estoque_restr_class);

end.
