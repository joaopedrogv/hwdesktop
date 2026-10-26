unit efd_ajustes_conf_cond_class;

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
  TEfd_ajustes_conf_cond_class = class(TBaseFb_class)
  private
    Fid         : string;
    Fconf_id    : string;
    Fcod_empresa: Integer;
    Ftipo       : Integer;
    Fcondicao   : string;
    Faliquota   : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id         : string  read Fid          write Fid;
    property conf_id    : string  read Fconf_id     write Fconf_id;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property tipo       : Integer read Ftipo        write Ftipo;
    property condicao   : string  read Fcondicao    write Fcondicao;
    property aliquota   : Variant read Faliquota    write Faliquota;
  end;

  TEfd_ajustes_conf_conds_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TEfd_ajustes_conf_cond_class;
    procedure SetItem(Index: Integer; const Value: TEfd_ajustes_conf_cond_class);
  public
    function New: TEfd_ajustes_conf_cond_class;

    property Items[Index: Integer]: TEfd_ajustes_conf_cond_class read GetItem write SetItem;
  end;

implementation

{ TEfd_ajustes_conf_cond_class }

procedure TEfd_ajustes_conf_cond_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('EFD_AJUSTES_CONF_COND');
  with FTable.Fields do
  begin
    AddField('ID'         , fkString , 36, False, True       );
    AddField('CONF_ID'    , fkString , 36, False, False, True);
    AddField('COD_EMPRESA', fkInteger, 0 , False, True , True);
    AddField('TIPO'       , fkInteger, 0 , False             );
    AddField('CONDICAO'   , fkString , 32, False             );
    AddField('ALIQUOTA'   , fkFloat                          );
  end;
end;

constructor TEfd_ajustes_conf_cond_class.Create;
begin
  InitializeObjects;
end;

{ TEfd_ajustes_conf_conds_class }

function TEfd_ajustes_conf_conds_class.GetItem(Index: Integer): TEfd_ajustes_conf_cond_class;
begin
  Result := TEfd_ajustes_conf_cond_class(inherited Items[Index]);
end;

function TEfd_ajustes_conf_conds_class.New: TEfd_ajustes_conf_cond_class;
begin
  Result := TEfd_ajustes_conf_cond_class.Create;
  Add(Result);
end;

procedure TEfd_ajustes_conf_conds_class.SetItem(Index: Integer; const Value: TEfd_ajustes_conf_cond_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TEfd_ajustes_conf_cond_class);
finalization
  UnRegisterClass(TEfd_ajustes_conf_cond_class);

end.
