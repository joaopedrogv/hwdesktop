unit opf_icms_dest_params_class;

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
  TOpf_icms_dest_params_class = class(TBaseFb_class)
  private
    Fid              : Integer;
    Fopf_icms_dest_id: Integer;
    Fcod_empresa     : Integer;
    Faliq_icms       : Double;
    Faliq_fcp        : Double;
    Faliq_red_bc     : Double;
    Faliq_icms_dif   : Double;
    Faliq_fcp_dif    : Double;
    Fufs             : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id              : Integer read Fid               write Fid;
    property opf_icms_dest_id: Integer read Fopf_icms_dest_id write Fopf_icms_dest_id;
    property cod_empresa     : Integer read Fcod_empresa      write Fcod_empresa;
    property aliq_icms       : Double  read Faliq_icms        write Faliq_icms;
    property aliq_fcp        : Double  read Faliq_fcp         write Faliq_fcp;
    property aliq_red_bc     : Double  read Faliq_red_bc      write Faliq_red_bc;
    property aliq_icms_dif   : Double  read Faliq_icms_dif    write Faliq_icms_dif;
    property aliq_fcp_dif    : Double  read Faliq_fcp_dif     write Faliq_fcp_dif;
    property ufs             : string  read Fufs              write Fufs;
  end;

  TOpf_icms_dest_paramss_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TOpf_icms_dest_params_class;
    procedure SetItem(Index: Integer; const Value: TOpf_icms_dest_params_class);
  public
    function New: TOpf_icms_dest_params_class;

    property Items[Index: Integer]: TOpf_icms_dest_params_class read GetItem write SetItem;
  end;

implementation

{ TOpf_icms_dest_params_class }

procedure TOpf_icms_dest_params_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('OPF_ICMS_DEST_PARAMS');
  with FTable.Fields do
  begin
    AddField('ID'              , fkInteger, 0  , False, True              );
    AddField('OPF_ICMS_DEST_ID', fkInteger, 0  , False, False, True       );
    AddField('COD_EMPRESA'     , fkInteger, 0  , False, True , True       );
    AddField('ALIQ_ICMS'       , fkFloat  , 0  , False, False, False, True);
    AddField('ALIQ_FCP'        , fkFloat  , 0  , False, False, False, True);
    AddField('ALIQ_RED_BC'     , fkFloat  , 0  , False, False, False, True);
    AddField('ALIQ_ICMS_DIF'   , fkFloat  , 0  , False, False, False, True);
    AddField('ALIQ_FCP_DIF'    , fkFloat  , 0  , False, False, False, True);
    AddField('UFS'             , fkString , 128                           );
  end;
end;

constructor TOpf_icms_dest_params_class.Create;
begin
  InitializeObjects;
end;

{ TOpf_icms_dest_paramss_class }

function TOpf_icms_dest_paramss_class.GetItem(Index: Integer): TOpf_icms_dest_params_class;
begin
  Result := TOpf_icms_dest_params_class(inherited Items[Index]);
end;

function TOpf_icms_dest_paramss_class.New: TOpf_icms_dest_params_class;
begin
  Result := TOpf_icms_dest_params_class.Create;
  Add(Result);
end;

procedure TOpf_icms_dest_paramss_class.SetItem(Index: Integer; const Value: TOpf_icms_dest_params_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TOpf_icms_dest_params_class);
finalization
  UnRegisterClass(TOpf_icms_dest_params_class);

end.
