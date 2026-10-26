unit sp_efd_ajustes_class;

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
  TSpEfdAjustes = class(TBaseFb_class)
  private
    Fid          : string;
    Fconf_1921_id: string;
    Fcod_obs     : Integer;
    Faj_c197     : string;
    Faliq_c197   : Double;
    Fconf_c197   : TStrings;
    Faj_1921     : string;
    Faliq_1921   : Double;
    Fconf_1921   : TStrings;
    Ftipo        : Integer;
    Ftipostr     : string;
    Fcondicao    : string;
    Fcondicaofim : string;
    Faliquota    : Double;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id          : string   read Fid           write Fid;
    property conf_1921_id: string   read Fconf_1921_id write Fconf_1921_id;
    property cod_obs     : Integer  read Fcod_obs      write Fcod_obs;
    property aj_c197     : string   read Faj_c197      write Faj_c197;
    property aliq_c197   : Double   read Faliq_c197    write Faliq_c197;
    property conf_c197   : TStrings read Fconf_c197    write Fconf_c197;
    property aj_1921     : string   read Faj_1921      write Faj_1921;
    property aliq_1921   : Double   read Faliq_1921    write Faliq_1921;
    property conf_1921   : TStrings read Fconf_1921    write Fconf_1921;
    property tipo        : Integer  read Ftipo         write Ftipo;
    property tipostr     : string   read Ftipostr      write Ftipostr;
    property condicao    : string   read Fcondicao     write Fcondicao;
    property condicaofim : string   read Fcondicaofim  write Fcondicaofim;
    property aliquota    : Double   read Faliquota     write Faliquota;
  end;

  TSpEfdAjustesList = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TSpEfdAjustes;
    procedure SetItem(Index: Integer; const Value: TSpEfdAjustes);
  public
    function New: TSpEfdAjustes;

    property Items[Index: Integer]: TSpEfdAjustes read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TSpEfdAjustes }

procedure TSpEfdAjustes.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
  Fconf_c197 := TStringList.Create;
  Fconf_1921 := TStringList.Create;
end;

constructor TSpEfdAjustes.Create;
begin
  InitializeObjects;
end;

destructor TSpEfdAjustes.Destroy;
begin
  if Assigned(Fconf_c197) then
    FreeAndNil(Fconf_c197);
  if Assigned(Fconf_1921) then
    FreeAndNil(Fconf_1921);
  inherited;
end;

{ TSpEfdAjustesList }

function TSpEfdAjustesList.GetItem(Index: Integer): TSpEfdAjustes;
begin
  Result := TSpEfdAjustes(inherited Items[Index]);
end;

function TSpEfdAjustesList.New: TSpEfdAjustes;
begin
  Result := TSpEfdAjustes.Create;
  Add(Result);
end;

procedure TSpEfdAjustesList.SetItem(Index: Integer; const Value: TSpEfdAjustes);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TSpEfdAjustes);
finalization
  UnRegisterClass(TSpEfdAjustes);

end.
