unit cest_item_class;

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
  TCest_item_class = class(TBaseFb_class)
  private
    Fitem       : Integer;
    Fcod_empresa: Integer;
    Fdescricao  : string;
    Fversao     : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property item       : Integer read Fitem        write Fitem;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property descricao  : string  read Fdescricao   write Fdescricao;
    property versao     : string  read Fversao      write Fversao;
  end;

  TCest_items_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCest_item_class;
    procedure SetItem(Index: Integer; const Value: TCest_item_class);
  public
    function New: TCest_item_class;

    property Items[Index: Integer]: TCest_item_class read GetItem write SetItem;
  end;

implementation

{ TCest_item_class }

procedure TCest_item_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CEST_ITEM');
  with FTable.Fields do
  begin
    AddField('ITEM'       , fkInteger, 0  , False, True);
    AddField('COD_EMPRESA', fkInteger, 0  , False, True);
    AddField('DESCRICAO'  , fkString , 128, False      );
    AddField('VERSAO'     , fkString , 16              );
  end;
end;

constructor TCest_item_class.Create;
begin
  InitializeObjects;
end;

{ TCest_items_class }

function TCest_items_class.GetItem(Index: Integer): TCest_item_class;
begin
  Result := TCest_item_class(inherited Items[Index]);
end;

function TCest_items_class.New: TCest_item_class;
begin
  Result := TCest_item_class.Create;
  Add(Result);
end;

procedure TCest_items_class.SetItem(Index: Integer; const Value: TCest_item_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCest_item_class);
finalization
  UnRegisterClass(TCest_item_class);

end.
