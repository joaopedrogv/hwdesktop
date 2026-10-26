unit gs1prefix_class;

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
  TGs1prefix_class = class(TBaseFb_class)
  private
    Finicio   : string;
    Ffim      : string;
    Fespecial : Integer;
    Fdescricao: string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property inicio   : string  read Finicio    write Finicio;
    property fim      : string  read Ffim       write Ffim;
    property especial : Integer read Fespecial  write Fespecial;
    property descricao: string  read Fdescricao write Fdescricao;
  end;

  TGs1prefixs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TGs1prefix_class;
    procedure SetItem(Index: Integer; const Value: TGs1prefix_class);
  public
    function New: TGs1prefix_class;

    property Items[Index: Integer]: TGs1prefix_class read GetItem write SetItem;
  end;

implementation

{ TGs1prefix_class }

procedure TGs1prefix_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('GS1PREFIX');
  with FTable.Fields do
  begin
    AddField('INICIO'   , fkString , 3 , False, True);
    AddField('FIM'      , fkString , 3 , False, True);
    AddField('ESPECIAL' , fkInteger, 0 , False      );
    AddField('DESCRICAO', fkString , 64             );
  end;
end;

constructor TGs1prefix_class.Create;
begin
  InitializeObjects;
end;

{ TGs1prefixs_class }

function TGs1prefixs_class.GetItem(Index: Integer): TGs1prefix_class;
begin
  Result := TGs1prefix_class(inherited Items[Index]);
end;

function TGs1prefixs_class.New: TGs1prefix_class;
begin
  Result := TGs1prefix_class.Create;
  Add(Result);
end;

procedure TGs1prefixs_class.SetItem(Index: Integer; const Value: TGs1prefix_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TGs1prefix_class);
finalization
  UnRegisterClass(TGs1prefix_class);

end.
