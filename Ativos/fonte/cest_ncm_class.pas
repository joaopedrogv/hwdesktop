unit cest_ncm_class;

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
  TCest_ncm_class = class(TBaseFb_class)
  private
    Fcest_id      : Integer;
    Fcod_empresa  : Integer;
    Fncm          : string;
    Ftipo_cadastro: Variant;
    Fdata_cadastro: Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cest_id      : Integer read Fcest_id       write Fcest_id;
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property ncm          : string  read Fncm           write Fncm;
    property tipo_cadastro: Variant read Ftipo_cadastro write Ftipo_cadastro;
    property data_cadastro: Variant read Fdata_cadastro write Fdata_cadastro;
  end;

  TCest_ncms_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCest_ncm_class;
    procedure SetItem(Index: Integer; const Value: TCest_ncm_class);
  public
    function New: TCest_ncm_class;

    property Items[Index: Integer]: TCest_ncm_class read GetItem write SetItem;
  end;

implementation

{ TCest_ncm_class }

procedure TCest_ncm_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CEST_NCM');
  with FTable.Fields do
  begin
    AddField('CEST_ID'      , fkInteger , 0, False, True , True       );
    AddField('COD_EMPRESA'  , fkInteger , 0, False, True , True       );
    AddField('NCM'          , fkString  , 8, False, True              );
    AddField('TIPO_CADASTRO', fkInteger                               );
    AddField('DATA_CADASTRO', fkDateTime, 0, True , False, False, True);
  end;
end;

constructor TCest_ncm_class.Create;
begin
  InitializeObjects;
end;

{ TCest_ncms_class }

function TCest_ncms_class.GetItem(Index: Integer): TCest_ncm_class;
begin
  Result := TCest_ncm_class(inherited Items[Index]);
end;

function TCest_ncms_class.New: TCest_ncm_class;
begin
  Result := TCest_ncm_class.Create;
  Add(Result);
end;

procedure TCest_ncms_class.SetItem(Index: Integer; const Value: TCest_ncm_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCest_ncm_class);
finalization
  UnRegisterClass(TCest_ncm_class);

end.
