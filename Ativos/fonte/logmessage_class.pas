unit logmessage_class;

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
  TLogmessage_class = class(TBaseFb_class)
  private
    Fid       : string;
    Fcnpj     : string;
    Fseq      : Int64;
    Fcreatedat: Variant;
    Fdirection: Integer;
    Flevel_   : Integer;
    Fsource   : string;
    Ftext     : TStrings;
    Flog_id   : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id       : string   read Fid        write Fid;
    property cnpj     : string   read Fcnpj      write Fcnpj;
    property seq      : Int64    read Fseq       write Fseq;
    property createdat: Variant  read Fcreatedat write Fcreatedat;
    property direction: Integer  read Fdirection write Fdirection;
    property level_   : Integer  read Flevel_    write Flevel_;
    property source   : string   read Fsource    write Fsource;
    property text     : TStrings read Ftext      write Ftext;
    property log_id   : string   read Flog_id    write Flog_id;
  end;

  TLogmessages_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TLogmessage_class;
    procedure SetItem(Index: Integer; const Value: TLogmessage_class);
  public
    function New: TLogmessage_class;

    property Items[Index: Integer]: TLogmessage_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TLogmessage_class }

procedure TLogmessage_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('LOGMESSAGE');
  with FTable.Fields do
  begin
    AddField('ID'       , fkString  , 36, False, True);
    AddField('CNPJ'     , fkString  , 14, False      );
    AddField('SEQ'      , fkInteger                  );
    AddField('CREATEDAT', fkDateTime                 );
    AddField('DIRECTION', fkInteger , 0 , False      );
    AddField('LEVEL_'   , fkInteger , 0 , False      );
    AddField('SOURCE'   , fkString  , 64, False      );
    AddField('TEXT'     , fkTStrings, 0 , False      );
    AddField('LOG_ID'   , fkString  , 36             );
  end;
  Ftext := TStringList.Create;
end;

constructor TLogmessage_class.Create;
begin
  InitializeObjects;
end;

destructor TLogmessage_class.Destroy;
begin
  if Assigned(Ftext) then
    FreeAndNil(Ftext);
  inherited;
end;

{ TLogmessages_class }

function TLogmessages_class.GetItem(Index: Integer): TLogmessage_class;
begin
  Result := TLogmessage_class(inherited Items[Index]);
end;

function TLogmessages_class.New: TLogmessage_class;
begin
  Result := TLogmessage_class.Create;
  Add(Result);
end;

procedure TLogmessages_class.SetItem(Index: Integer; const Value: TLogmessage_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TLogmessage_class);
finalization
  UnRegisterClass(TLogmessage_class);

end.
