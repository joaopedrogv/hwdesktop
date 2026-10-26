unit efd_1921_class;

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
  TEfd1921 = class(TBaseFb_class)
  private
    Fid             : string;
    Fcod_empresa    : Integer;
    Fcod_ajuste     : string;
    Fvalor_ajuste   : Double;
    Faliquota_ajuste: Double;
    Fconf_tipo_id   : string;
    Fdescr_compl    : TStrings;
    Fref_id         : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id             : string   read Fid              write Fid;
    property cod_empresa    : Integer  read Fcod_empresa     write Fcod_empresa;
    property cod_ajuste     : string   read Fcod_ajuste      write Fcod_ajuste;
    property valor_ajuste   : Double   read Fvalor_ajuste    write Fvalor_ajuste;
    property aliquota_ajuste: Double   read Faliquota_ajuste write Faliquota_ajuste;
    property conf_tipo_id   : string   read Fconf_tipo_id    write Fconf_tipo_id;
    property descr_compl    : TStrings read Fdescr_compl     write Fdescr_compl;
    property ref_id         : string   read Fref_id          write Fref_id;
  end;

  TEfd1921List = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TEfd1921;
    procedure SetItem(Index: Integer; const Value: TEfd1921);
  public
    function New: TEfd1921;

    property Items[Index: Integer]: TEfd1921 read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TEfd1921 }

procedure TEfd1921.InitializeObjects;
begin
  Ftable := TTableFb.Create('EFD_1921');
  with FTable.Fields do
  begin
    AddField('ID'             , fkString  , 36, False, True              );
    AddField('COD_EMPRESA'    , fkInteger , 0 , False, False, True       );
    AddField('COD_AJUSTE'     , fkString  , 8 , False                    );
    AddField('VALOR_AJUSTE'   , fkFloat   , 0 , False, False, False, True);
    AddField('ALIQUOTA_AJUSTE', fkFloat   , 0 , False, False, False, True);
    AddField('CONF_TIPO_ID'   , fkString  , 36, True , False, True       );
    AddField('DESCR_COMPL'    , fkTStrings                               );
    AddField('REF_ID'         , fkString  , 36, False                    );
  end;
  Fdescr_compl := TStringList.Create;
end;

constructor TEfd1921.Create;
begin
  InitializeObjects;
end;

destructor TEfd1921.Destroy;
begin
  if Assigned(Fdescr_compl) then
    FreeAndNil(Fdescr_compl);
  inherited;
end;

{ TEfd1921List }

function TEfd1921List.GetItem(Index: Integer): TEfd1921;
begin
  Result := TEfd1921(inherited Items[Index]);
end;

function TEfd1921List.New: TEfd1921;
begin
  Result := TEfd1921.Create;
  Add(Result);
end;

procedure TEfd1921List.SetItem(Index: Integer; const Value: TEfd1921);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TEfd1921);
finalization
  UnRegisterClass(TEfd1921);

end.
