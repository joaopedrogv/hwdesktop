unit cest_mva_uf_class;

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
  TCest_mva_uf_class = class(TBaseFb_class)
  private
    Fcest_mva_id: Variant;
    Fcod_empresa: Variant;
    Fuf         : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cest_mva_id: Variant read Fcest_mva_id write Fcest_mva_id;
    property cod_empresa: Variant read Fcod_empresa write Fcod_empresa;
    property uf         : string  read Fuf          write Fuf;
  end;

  TCest_mva_ufs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCest_mva_uf_class;
    procedure SetItem(Index: Integer; const Value: TCest_mva_uf_class);
  public
    function New: TCest_mva_uf_class;

    property Items[Index: Integer]: TCest_mva_uf_class read GetItem write SetItem;
  end;

implementation

{ TCest_mva_uf_class }

procedure TCest_mva_uf_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CEST_MVA_UF');
  with FTable.Fields do
  begin
    AddField('CEST_MVA_ID', fkInteger, 0, False, True, True);
    AddField('COD_EMPRESA', fkInteger, 0, False, True, True);
    AddField('UF'         , fkString , 0, False, True      );
  end;
end;

constructor TCest_mva_uf_class.Create;
begin
  InitializeObjects;
end;

{ TCest_mva_ufs_class }

function TCest_mva_ufs_class.GetItem(Index: Integer): TCest_mva_uf_class;
begin
  Result := TCest_mva_uf_class(inherited Items[Index]);
end;

function TCest_mva_ufs_class.New: TCest_mva_uf_class;
begin
  Result := TCest_mva_uf_class.Create;
  Add(Result);
end;

procedure TCest_mva_ufs_class.SetItem(Index: Integer; const Value: TCest_mva_uf_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCest_mva_uf_class);
finalization
  UnRegisterClass(TCest_mva_uf_class);

end.
