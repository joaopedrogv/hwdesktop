unit opf_rettrib_class;

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
  TOpf_rettrib_class = class(TBaseFb_class)
  private
    Fid         : Integer;
    Fopf_id     : Integer;
    Fcod_empresa: Integer;
    Fpir        : Variant;
    Fpcsll      : Variant;
    Fppis       : Variant;
    Fpcofins    : Variant;
    Fativo      : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id         : Integer read Fid          write Fid;
    property opf_id     : Integer read Fopf_id      write Fopf_id;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property pir        : Variant read Fpir         write Fpir;
    property pcsll      : Variant read Fpcsll       write Fpcsll;
    property ppis       : Variant read Fppis        write Fppis;
    property pcofins    : Variant read Fpcofins     write Fpcofins;
    property ativo      : Variant read Fativo       write Fativo;
  end;

  TOpf_rettribs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TOpf_rettrib_class;
    procedure SetItem(Index: Integer; const Value: TOpf_rettrib_class);
  public
    function New: TOpf_rettrib_class;

    property Items[Index: Integer]: TOpf_rettrib_class read GetItem write SetItem;
  end;

implementation

{ TOpf_rettrib_class }

procedure TOpf_rettrib_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('OPF_RETTRIB');
  with FTable.Fields do
  begin
    AddField('ID'         , fkInteger, 0, False, True              );
    AddField('OPF_ID'     , fkInteger, 0, False, False, True       );
    AddField('COD_EMPRESA', fkInteger, 0, False, True , True       );
    AddField('PIR'        , fkFloat  , 0, True , False, False, True);
    AddField('PCSLL'      , fkFloat  , 0, True , False, False, True);
    AddField('PPIS'       , fkFloat  , 0, True , False, False, True);
    AddField('PCOFINS'    , fkFloat  , 0, True , False, False, True);
    AddField('ATIVO'      , fkInteger, 0, True , False, False, True);
  end;
end;

constructor TOpf_rettrib_class.Create;
begin
  InitializeObjects;
end;

{ TOpf_rettribs_class }

function TOpf_rettribs_class.GetItem(Index: Integer): TOpf_rettrib_class;
begin
  Result := TOpf_rettrib_class(inherited Items[Index]);
end;

function TOpf_rettribs_class.New: TOpf_rettrib_class;
begin
  Result := TOpf_rettrib_class.Create;
  Add(Result);
end;

procedure TOpf_rettribs_class.SetItem(Index: Integer; const Value: TOpf_rettrib_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TOpf_rettrib_class);
finalization
  UnRegisterClass(TOpf_rettrib_class);

end.
