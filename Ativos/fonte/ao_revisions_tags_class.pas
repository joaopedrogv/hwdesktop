unit ao_revisions_tags_class;

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
  TAo_revisions_tags_class = class(TBaseFb_class)
  private
    Ftemplateid: string;
    Frevisionid: string;
    Fempresaid : Integer;
    Fname      : string;
    Ftablename : string;
    Ffieldname : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property templateid: string  read Ftemplateid write Ftemplateid;
    property revisionid: string  read Frevisionid write Frevisionid;
    property empresaid : Integer read Fempresaid  write Fempresaid;
    property name      : string  read Fname       write Fname;
    property tablename : string  read Ftablename  write Ftablename;
    property fieldname : string  read Ffieldname  write Ffieldname;
  end;

  TAo_revisions_tagss_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TAo_revisions_tags_class;
    procedure SetItem(Index: Integer; const Value: TAo_revisions_tags_class);
  public
    function New: TAo_revisions_tags_class;

    property Items[Index: Integer]: TAo_revisions_tags_class read GetItem write SetItem;
  end;

implementation

{ TAo_revisions_tags_class }

procedure TAo_revisions_tags_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('AO_REVISIONS_TAGS');
  with FTable.Fields do
  begin
    AddField('TEMPLATEID', fkString , 36 , False, True);
    AddField('REVISIONID', fkString , 36 , False, True);
    AddField('EMPRESAID' , fkInteger, 0  , False, True);
    AddField('NAME'      , fkString , 100, False, True);
    AddField('TABLENAME' , fkString , 31              );
    AddField('FIELDNAME' , fkString , 31              );
  end;
end;

constructor TAo_revisions_tags_class.Create;
begin
  InitializeObjects;
end;

{ TAo_revisions_tagss_class }

function TAo_revisions_tagss_class.GetItem(Index: Integer): TAo_revisions_tags_class;
begin
  Result := TAo_revisions_tags_class(inherited Items[Index]);
end;

function TAo_revisions_tagss_class.New: TAo_revisions_tags_class;
begin
  Result := TAo_revisions_tags_class.Create;
  Add(Result);
end;

procedure TAo_revisions_tagss_class.SetItem(Index: Integer; const Value: TAo_revisions_tags_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TAo_revisions_tags_class);
finalization
  UnRegisterClass(TAo_revisions_tags_class);

end.
