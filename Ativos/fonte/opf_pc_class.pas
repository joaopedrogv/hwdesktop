unit opf_pc_class;

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
  TOpf_pc_class = class(TBaseFb_class)
  private
    Fid         : Integer;
    Fopf_id     : Integer;
    Fcod_empresa: Integer;
    Fcst        : string;
    Fmotdespc   : Variant;
    Faliq_pis   : Variant;
    Faliq_cofins: Variant;
    Fconf_calc  : TStrings;
    Fnat_rec    : string;
    Fativo      : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id         : Integer  read Fid          write Fid;
    property opf_id     : Integer  read Fopf_id      write Fopf_id;
    property cod_empresa: Integer  read Fcod_empresa write Fcod_empresa;
    property cst        : string   read Fcst         write Fcst;
    property motdespc   : Variant  read Fmotdespc    write Fmotdespc;
    property aliq_pis   : Variant  read Faliq_pis    write Faliq_pis;
    property aliq_cofins: Variant  read Faliq_cofins write Faliq_cofins;
    property conf_calc  : TStrings read Fconf_calc   write Fconf_calc;
    property nat_rec    : string   read Fnat_rec     write Fnat_rec;
    property ativo      : Variant  read Fativo       write Fativo;
  end;

  TOpf_pcs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TOpf_pc_class;
    procedure SetItem(Index: Integer; const Value: TOpf_pc_class);
  public
    function New: TOpf_pc_class;

    property Items[Index: Integer]: TOpf_pc_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TOpf_pc_class }

procedure TOpf_pc_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('OPF_PC');
  with FTable.Fields do
  begin
    AddField('ID'         , fkInteger , 0, False, True              );
    AddField('OPF_ID'     , fkInteger , 0, False, False, True       );
    AddField('COD_EMPRESA', fkInteger , 0, False, True , True       );
    AddField('CST'        , fkString  , 2, False                    );
    AddField('MOTDESPC'   , fkInteger                               );
    AddField('ALIQ_PIS'   , fkFloat   , 0, True , False, False, True);
    AddField('ALIQ_COFINS', fkFloat   , 0, True , False, False, True);
    AddField('CONF_CALC'  , fkTStrings                              );
    AddField('NAT_REC'    , fkString  , 3                           );
    AddField('ATIVO'      , fkInteger , 0, True , False, False, True);
  end;
  Fconf_calc := TStringList.Create;
end;

constructor TOpf_pc_class.Create;
begin
  InitializeObjects;
end;

destructor TOpf_pc_class.Destroy;
begin
  if Assigned(Fconf_calc) then
    FreeAndNil(Fconf_calc);
  inherited;
end;

{ TOpf_pcs_class }

function TOpf_pcs_class.GetItem(Index: Integer): TOpf_pc_class;
begin
  Result := TOpf_pc_class(inherited Items[Index]);
end;

function TOpf_pcs_class.New: TOpf_pc_class;
begin
  Result := TOpf_pc_class.Create;
  Add(Result);
end;

procedure TOpf_pcs_class.SetItem(Index: Integer; const Value: TOpf_pc_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TOpf_pc_class);
finalization
  UnRegisterClass(TOpf_pc_class);

end.
