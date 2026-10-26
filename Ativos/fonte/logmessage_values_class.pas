unit logmessage_values_class;

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
  TLogmessage_values_class = class(TBaseFb_class)
  private
    Flog_id: string;
    Fseq   : Integer;
    Fdata  : TStrings;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property log_id: string   read Flog_id write Flog_id;
    property seq   : Integer  read Fseq    write Fseq;
    property data  : TStrings read Fdata   write Fdata;
  end;

  TLogmessage_valuess_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TLogmessage_values_class;
    procedure SetItem(Index: Integer; const Value: TLogmessage_values_class);
  public
    function New: TLogmessage_values_class;

    property Items[Index: Integer]: TLogmessage_values_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TLogmessage_values_class }

procedure TLogmessage_values_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('LOGMESSAGE_VALUES');
  with FTable.Fields do
  begin
    AddField('LOG_ID', fkString  , 36, False, True, True);
    AddField('SEQ'   , fkInteger , 0 , False, True      );
    AddField('DATA'  , fkTStrings, 0 , False            );
  end;
  Fdata := TStringList.Create;
end;

constructor TLogmessage_values_class.Create;
begin
  InitializeObjects;
end;

destructor TLogmessage_values_class.Destroy;
begin
  if Assigned(Fdata) then
    FreeAndNil(Fdata);
  inherited;
end;

{ TLogmessage_valuess_class }

function TLogmessage_valuess_class.GetItem(Index: Integer): TLogmessage_values_class;
begin
  Result := TLogmessage_values_class(inherited Items[Index]);
end;

function TLogmessage_valuess_class.New: TLogmessage_values_class;
begin
  Result := TLogmessage_values_class.Create;
  Add(Result);
end;

procedure TLogmessage_valuess_class.SetItem(Index: Integer; const Value: TLogmessage_values_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TLogmessage_values_class);
finalization
  UnRegisterClass(TLogmessage_values_class);

end.
