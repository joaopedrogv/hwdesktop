unit CestNcmMva_Model;

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
  TCestNcmMva_Model = class(TBaseFb_class)
  private
    Fcest_id         : Integer;
    Fcest            : string;
    Fambito          : Integer;
    Fdescricao       : TStrings;
    Fmva_id          : Integer;
    Fcest_variante_id: Integer;
    Fmva             : Double;
    Ftipo_cadastro   : Integer;
    Fncm_excecao     : TStrings;
    Fncm             : string;
    Festados         : string;
    Fncm_id          : Integer;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property cest_id         : Integer  read Fcest_id          write Fcest_id;
    property cest            : string   read Fcest             write Fcest;
    property ambito          : Integer  read Fambito           write Fambito;
    property descricao       : TStrings read Fdescricao        write Fdescricao;
    property mva_id          : Integer  read Fmva_id           write Fmva_id;
    property cest_variante_id: Integer  read Fcest_variante_id write Fcest_variante_id;
    property mva             : Double   read Fmva              write Fmva;
    property tipo_cadastro   : Integer  read Ftipo_cadastro    write Ftipo_cadastro;
    property ncm_id          : Integer  read Fncm_id           write Fncm_id;
    property ncm_excecao     : TStrings read Fncm_excecao      write Fncm_excecao;
    property ncm             : string   read Fncm              write Fncm;
    property estados         : string   read Festados          write Festados;
  end;

  TCestNcmMvas_Model = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCestNcmMva_Model;
    procedure SetItem(Index: Integer; const Value: TCestNcmMva_Model);
  public
    function New: TCestNcmMva_Model;

    property Items[Index: Integer]: TCestNcmMva_Model read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TCestNcmMva_Model }

procedure TCestNcmMva_Model.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
  Fdescricao   := TStringList.Create;
  Fncm_excecao := TStringList.Create;
end;

constructor TCestNcmMva_Model.Create;
begin
  InitializeObjects;
end;

destructor TCestNcmMva_Model.Destroy;
begin
  if Assigned(Fdescricao) then
    FreeAndNil(Fdescricao);
  if Assigned(Fncm_excecao) then
    FreeAndNil(Fncm_excecao);
  inherited;
end;

{ TCestNcmMvas_Model }

function TCestNcmMvas_Model.GetItem(Index: Integer): TCestNcmMva_Model;
begin
  Result := TCestNcmMva_Model(inherited Items[Index]);
end;

function TCestNcmMvas_Model.New: TCestNcmMva_Model;
begin
  Result := TCestNcmMva_Model.Create;
  Add(Result);
end;

procedure TCestNcmMvas_Model.SetItem(Index: Integer; const Value: TCestNcmMva_Model);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCestNcmMva_Model);
finalization
  UnRegisterClass(TCestNcmMva_Model);

end.

