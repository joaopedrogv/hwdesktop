unit cest_variante_class;

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
  TCest_variante_class = class(TBaseFb_class)
  private
    Fid                  : Integer;
    Fcod_empresa         : Integer;
    Fdescricao           : string;
    Ftipo                : Variant;
    Ftipo_valor          : Variant;
    Faliq_icms_especifica: Variant;
    Fdescricao_original  : TStrings;
    Fversao              : string;
    Fapi_id              : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id                  : Integer  read Fid                   write Fid;
    property cod_empresa         : Integer  read Fcod_empresa          write Fcod_empresa;
    property descricao           : string   read Fdescricao            write Fdescricao;
    property tipo                : Variant  read Ftipo                 write Ftipo;
    property tipo_valor          : Variant  read Ftipo_valor           write Ftipo_valor;
    property aliq_icms_especifica: Variant  read Faliq_icms_especifica write Faliq_icms_especifica;
    property descricao_original  : TStrings read Fdescricao_original   write Fdescricao_original;
    property versao              : string   read Fversao               write Fversao;
    property api_id              : Variant  read Fapi_id               write Fapi_id;
  end;

  TCest_variantes_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCest_variante_class;
    procedure SetItem(Index: Integer; const Value: TCest_variante_class);
  public
    function New: TCest_variante_class;

    property Items[Index: Integer]: TCest_variante_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TCest_variante_class }

procedure TCest_variante_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CEST_VARIANTE');
  with FTable.Fields do
  begin
    AddField('ID'                  , fkInteger , 0 , False, True              );
    AddField('COD_EMPRESA'         , fkInteger , 0 , False, True              );
    AddField('DESCRICAO'           , fkString  , 64                           );
    AddField('TIPO'                , fkInteger                                );
    AddField('TIPO_VALOR'          , fkInteger                                );
    AddField('ALIQ_ICMS_ESPECIFICA', fkFloat   , 0 , True , False, False, True);
    AddField('DESCRICAO_ORIGINAL'  , fkTStrings                               );
    AddField('VERSAO'              , fkString  , 16                           );
    AddField('API_ID'              , fkInteger                                );
  end;
  Fdescricao_original := TStringList.Create;
end;

constructor TCest_variante_class.Create;
begin
  InitializeObjects;
end;

destructor TCest_variante_class.Destroy;
begin
  if Assigned(Fdescricao_original) then
    FreeAndNil(Fdescricao_original);
  inherited;
end;

{ TCest_variantes_class }

function TCest_variantes_class.GetItem(Index: Integer): TCest_variante_class;
begin
  Result := TCest_variante_class(inherited Items[Index]);
end;

function TCest_variantes_class.New: TCest_variante_class;
begin
  Result := TCest_variante_class.Create;
  Add(Result);
end;

procedure TCest_variantes_class.SetItem(Index: Integer; const Value: TCest_variante_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCest_variante_class);
finalization
  UnRegisterClass(TCest_variante_class);

end.
