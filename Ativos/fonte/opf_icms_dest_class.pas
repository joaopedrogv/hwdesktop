unit opf_icms_dest_class;

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
  TOpf_icms_dest_class = class(TBaseFb_class)
  private
    Fid         : Integer;
    Fopf_icms_id: Integer;
    Fcod_empresa: Integer;
    Fiddest     : string;
    Fcfop       : Integer;
    Fativo      : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id         : Integer read Fid          write Fid;
    property opf_icms_id: Integer read Fopf_icms_id write Fopf_icms_id;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property iddest     : string  read Fiddest      write Fiddest;
    property cfop       : Integer read Fcfop        write Fcfop;
    property ativo      : Variant read Fativo       write Fativo;
  end;

  TOpf_icms_dests_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TOpf_icms_dest_class;
    procedure SetItem(Index: Integer; const Value: TOpf_icms_dest_class);
  public
    function New: TOpf_icms_dest_class;

    property Items[Index: Integer]: TOpf_icms_dest_class read GetItem write SetItem;
  end;

implementation

{ TOpf_icms_dest_class }

procedure TOpf_icms_dest_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('OPF_ICMS_DEST');
  with FTable.Fields do
  begin
    AddField('ID'         , fkInteger, 0, False, True              );
    AddField('OPF_ICMS_ID', fkInteger, 0, False, False, True       );
    AddField('COD_EMPRESA', fkInteger, 0, False, True , True       );
    AddField('IDDEST'     , fkString , 1, False                    );
    AddField('CFOP'       , fkInteger, 0, False                    );
    AddField('ATIVO'      , fkInteger, 0, True , False, False, True);
  end;
end;

constructor TOpf_icms_dest_class.Create;
begin
  InitializeObjects;
end;

{ TOpf_icms_dests_class }

function TOpf_icms_dests_class.GetItem(Index: Integer): TOpf_icms_dest_class;
begin
  Result := TOpf_icms_dest_class(inherited Items[Index]);
end;

function TOpf_icms_dests_class.New: TOpf_icms_dest_class;
begin
  Result := TOpf_icms_dest_class.Create;
  Add(Result);
end;

procedure TOpf_icms_dests_class.SetItem(Index: Integer; const Value: TOpf_icms_dest_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TOpf_icms_dest_class);
finalization
  UnRegisterClass(TOpf_icms_dest_class);

end.
