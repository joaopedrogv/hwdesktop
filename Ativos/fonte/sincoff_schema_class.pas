unit sincoff_schema_class;

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
  TSincoff_schema_class = class(TBaseFb_class)
  private
    Fid         : Integer;
    Ftabela     : string;
    Fempresas_id: string;
    Fcampos     : TStrings;
    Fativo      : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id         : Integer  read Fid          write Fid;
    property tabela     : string   read Ftabela      write Ftabela;
    property empresas_id: string   read Fempresas_id write Fempresas_id;
    property campos     : TStrings read Fcampos      write Fcampos;
    property ativo      : Variant  read Fativo       write Fativo;
  end;

  TSincoff_schemas_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TSincoff_schema_class;
    procedure SetItem(Index: Integer; const Value: TSincoff_schema_class);
  public
    function New: TSincoff_schema_class;

    property Items[Index: Integer]: TSincoff_schema_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TSincoff_schema_class }

procedure TSincoff_schema_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('SINCOFF_SCHEMA');
  with FTable.Fields do
  begin
    AddField('ID'         , fkInteger , 0  , False, True);
    AddField('TABELA'     , fkString  , 31 , False      );
    AddField('EMPRESAS_ID', fkString  , 256             );
    AddField('CAMPOS'     , fkTStrings                  );
    AddField('ATIVO'      , fkInteger                   );
  end;
  Fcampos := TStringList.Create;
end;

constructor TSincoff_schema_class.Create;
begin
  InitializeObjects;
end;

destructor TSincoff_schema_class.Destroy;
begin
  if Assigned(Fcampos) then
    FreeAndNil(Fcampos);
  inherited;
end;

{ TSincoff_schemas_class }

function TSincoff_schemas_class.GetItem(Index: Integer): TSincoff_schema_class;
begin
  Result := TSincoff_schema_class(inherited Items[Index]);
end;

function TSincoff_schemas_class.New: TSincoff_schema_class;
begin
  Result := TSincoff_schema_class.Create;
  Add(Result);
end;

procedure TSincoff_schemas_class.SetItem(Index: Integer; const Value: TSincoff_schema_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TSincoff_schema_class);
finalization
  UnRegisterClass(TSincoff_schema_class);

end.
