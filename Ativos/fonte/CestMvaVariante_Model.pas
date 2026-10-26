unit CestMvaVariante_Model;

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
  TCestMvaVariante_Model = class(TBaseFb_class)
  private
    Fcest_id    : Integer;
    Fcest_mva_id: Integer;
    Fcod_empresa: Integer;
    Fmva        : Double;
    Fvariante   : string;
    Fncm_excecao: TStrings;
    Fmva_12_18  : Double;
    Fmva_7_17   : Double;
    Fmva_4_17   : Double;
    Fmva_4_18   : Double;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property cest_id    : Integer  read Fcest_id     write Fcest_id;
    property cest_mva_id: Integer  read Fcest_mva_id write Fcest_mva_id;
    property cod_empresa: Integer  read Fcod_empresa write Fcod_empresa;
    property mva        : Double   read Fmva         write Fmva;
    property variante   : string   read Fvariante    write Fvariante;
    property ncm_excecao: TStrings read Fncm_excecao write Fncm_excecao;
    property mva_12_18  : Double   read Fmva_12_18   write Fmva_12_18;
    property mva_7_17   : Double   read Fmva_7_17    write Fmva_7_17;
    property mva_4_17   : Double   read Fmva_4_17    write Fmva_4_17;
    property mva_4_18   : Double   read Fmva_4_18    write Fmva_4_18;
  end;

  TCestMvaVariantes_Model = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCestMvaVariante_Model;
    procedure SetItem(Index: Integer; const Value: TCestMvaVariante_Model);
  public
    function New: TCestMvaVariante_Model;

    property Items[Index: Integer]: TCestMvaVariante_Model read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TCestMvaVariante_Model }

procedure TCestMvaVariante_Model.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
  Fncm_excecao := TStringList.Create;
end;

constructor TCestMvaVariante_Model.Create;
begin
  InitializeObjects;
end;

destructor TCestMvaVariante_Model.Destroy;
begin
  if Assigned(Fncm_excecao) then
    FreeAndNil(Fncm_excecao);
  inherited;
end;

{ TCestMvaVariantes_Model }

function TCestMvaVariantes_Model.GetItem(Index: Integer): TCestMvaVariante_Model;
begin
  Result := TCestMvaVariante_Model(inherited Items[Index]);
end;

function TCestMvaVariantes_Model.New: TCestMvaVariante_Model;
begin
  Result := TCestMvaVariante_Model.Create;
  Add(Result);
end;

procedure TCestMvaVariantes_Model.SetItem(Index: Integer; const Value: TCestMvaVariante_Model);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCestMvaVariante_Model);
finalization
  UnRegisterClass(TCestMvaVariante_Model);

end.
