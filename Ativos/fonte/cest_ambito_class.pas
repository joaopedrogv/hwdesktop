unit cest_ambito_class;

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
  TCest_ambito_class = class(TBaseFb_class)
  private
    Fitem       : Integer;
    Fcod_empresa: Integer;
    Fambito     : Integer;
    Fdescricao  : TStrings;
    Fversao     : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property item       : Integer  read Fitem        write Fitem;
    property cod_empresa: Integer  read Fcod_empresa write Fcod_empresa;
    property ambito     : Integer  read Fambito      write Fambito;
    property descricao  : TStrings read Fdescricao   write Fdescricao;
    property versao     : string   read Fversao      write Fversao;
  end;

  TCest_ambitos_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCest_ambito_class;
    procedure SetItem(Index: Integer; const Value: TCest_ambito_class);
  public
    function New: TCest_ambito_class;

    property Items[Index: Integer]: TCest_ambito_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TCest_ambito_class }

procedure TCest_ambito_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CEST_AMBITO');
  with FTable.Fields do
  begin
    AddField('ITEM'       , fkInteger , 0 , False, True, True);
    AddField('COD_EMPRESA', fkInteger , 0 , False, True, True);
    AddField('AMBITO'     , fkInteger , 0 , False, True      );
    AddField('DESCRICAO'  , fkTStrings                       );
    AddField('VERSAO'     , fkString  , 16                   );
  end;
  Fdescricao := TStringList.Create;
end;

constructor TCest_ambito_class.Create;
begin
  InitializeObjects;
end;

destructor TCest_ambito_class.Destroy;
begin
  if Assigned(Fdescricao) then
    FreeAndNil(Fdescricao);
  inherited;
end;

{ TCest_ambitos_class }

function TCest_ambitos_class.GetItem(Index: Integer): TCest_ambito_class;
begin
  Result := TCest_ambito_class(inherited Items[Index]);
end;

function TCest_ambitos_class.New: TCest_ambito_class;
begin
  Result := TCest_ambito_class.Create;
  Add(Result);
end;

procedure TCest_ambitos_class.SetItem(Index: Integer; const Value: TCest_ambito_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCest_ambito_class);
finalization
  UnRegisterClass(TCest_ambito_class);

end.
