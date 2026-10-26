unit efd_ajustes_conf_tipo_class;

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
  TEfd_ajustes_conf_tipo_class = class(TBaseFb_class)
  private
    Fid         : string;
    Fconf_id    : string;
    Fcod_empresa: Integer;
    Ftipo       : Integer;
    Fcod_obs    : Variant;
    Fcod_ajuste : string;
    Faliquota   : Variant;
    Fconf       : TStrings;
    Fdescr_compl: TStrings;
    Fativo      : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id         : string   read Fid          write Fid;
    property conf_id    : string   read Fconf_id     write Fconf_id;
    property cod_empresa: Integer  read Fcod_empresa write Fcod_empresa;
    property tipo       : Integer  read Ftipo        write Ftipo;
    property cod_obs    : Variant  read Fcod_obs     write Fcod_obs;
    property cod_ajuste : string   read Fcod_ajuste  write Fcod_ajuste;
    property aliquota   : Variant  read Faliquota    write Faliquota;
    property conf       : TStrings read Fconf        write Fconf;
    property descr_compl: TStrings read Fdescr_compl write Fdescr_compl;
    property ativo      : Variant  read Fativo       write Fativo;
  end;

  TEfd_ajustes_conf_tipos_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TEfd_ajustes_conf_tipo_class;
    procedure SetItem(Index: Integer; const Value: TEfd_ajustes_conf_tipo_class);
  public
    function New: TEfd_ajustes_conf_tipo_class;

    property Items[Index: Integer]: TEfd_ajustes_conf_tipo_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TEfd_ajustes_conf_tipo_class }

procedure TEfd_ajustes_conf_tipo_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('EFD_AJUSTES_CONF_TIPO');
  with FTable.Fields do
  begin
    AddField('ID'         , fkString  , 36, False, True              );
    AddField('CONF_ID'    , fkString  , 36, False, False, True       );
    AddField('COD_EMPRESA', fkInteger , 0 , False, True , True       );
    AddField('TIPO'       , fkInteger , 0 , False                    );
    AddField('COD_OBS'    , fkInteger , 0 , True , False, True       );
    AddField('COD_AJUSTE' , fkString  , 10, False                    );
    AddField('ALIQUOTA'   , fkFloat                                  );
    AddField('CONF'       , fkTStrings                               );
    AddField('DESCR_COMPL', fkTStrings                               );
    AddField('ATIVO'      , fkInteger , 0 , True , False, False, True);
  end;
  Fconf        := TStringList.Create;
  Fdescr_compl := TStringList.Create;
end;

constructor TEfd_ajustes_conf_tipo_class.Create;
begin
  InitializeObjects;
end;

destructor TEfd_ajustes_conf_tipo_class.Destroy;
begin
  if Assigned(Fconf) then
    FreeAndNil(Fconf);
  if Assigned(Fdescr_compl) then
    FreeAndNil(Fdescr_compl);
  inherited;
end;

{ TEfd_ajustes_conf_tipos_class }

function TEfd_ajustes_conf_tipos_class.GetItem(Index: Integer): TEfd_ajustes_conf_tipo_class;
begin
  Result := TEfd_ajustes_conf_tipo_class(inherited Items[Index]);
end;

function TEfd_ajustes_conf_tipos_class.New: TEfd_ajustes_conf_tipo_class;
begin
  Result := TEfd_ajustes_conf_tipo_class.Create;
  Add(Result);
end;

procedure TEfd_ajustes_conf_tipos_class.SetItem(Index: Integer; const Value: TEfd_ajustes_conf_tipo_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TEfd_ajustes_conf_tipo_class);
finalization
  UnRegisterClass(TEfd_ajustes_conf_tipo_class);

end.
