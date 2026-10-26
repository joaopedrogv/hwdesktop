unit logmessage_table_class;

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
  TLogmessage_table_class = class(TBaseFb_class)
  private
    Flog_id: string;
    Ftabela: string;
    Fkeys  : string;
    Fcampos: TStrings;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property log_id: string   read Flog_id write Flog_id;
    property tabela: string   read Ftabela write Ftabela;
    property keys  : string   read Fkeys   write Fkeys;
    property campos: TStrings read Fcampos write Fcampos;
  end;

  TLogmessage_tables_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TLogmessage_table_class;
    procedure SetItem(Index: Integer; const Value: TLogmessage_table_class);
  public
    function New: TLogmessage_table_class;

    property Items[Index: Integer]: TLogmessage_table_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TLogmessage_table_class }

procedure TLogmessage_table_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('LOGMESSAGE_TABLE');
  with FTable.Fields do
  begin
    AddField('LOG_ID', fkString  , 36 , False, True, True);
    AddField('TABELA', fkString  , 31 , False            );
    AddField('KEYS'  , fkString  , 128, False            );
    AddField('CAMPOS', fkTStrings, 0  , False            );
  end;
  Fcampos := TStringList.Create;
end;

constructor TLogmessage_table_class.Create;
begin
  InitializeObjects;
end;

destructor TLogmessage_table_class.Destroy;
begin
  if Assigned(Fcampos) then
    FreeAndNil(Fcampos);
  inherited;
end;

{ TLogmessage_tables_class }

function TLogmessage_tables_class.GetItem(Index: Integer): TLogmessage_table_class;
begin
  Result := TLogmessage_table_class(inherited Items[Index]);
end;

function TLogmessage_tables_class.New: TLogmessage_table_class;
begin
  Result := TLogmessage_table_class.Create;
  Add(Result);
end;

procedure TLogmessage_tables_class.SetItem(Index: Integer; const Value: TLogmessage_table_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TLogmessage_table_class);
finalization
  UnRegisterClass(TLogmessage_table_class);

end.
