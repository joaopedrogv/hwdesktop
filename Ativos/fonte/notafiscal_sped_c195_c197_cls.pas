unit notafiscal_sped_c195_c197_cls;

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
  TNotafiscal_sped_c195_c197_cls = class(TBaseFb_class)
  private
    Fcod_nf        : Integer;
    Fcod_empresa   : Integer;
    Fcod_obs       : Integer;
    Fnitem         : Integer;
    Fcod_aj        : string;
    Fdescr_compl_aj: string;
    Fvl_bc_icms    : Variant;
    Faliq_icms     : Variant;
    Fvl_icms       : Variant;
    Fvl_outros     : Variant;
    Ftxt_compl_c195: string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_nf        : Integer read Fcod_nf         write Fcod_nf;
    property cod_empresa   : Integer read Fcod_empresa    write Fcod_empresa;
    property cod_obs       : Integer read Fcod_obs        write Fcod_obs;
    property nitem         : Integer read Fnitem          write Fnitem;
    property cod_aj        : string  read Fcod_aj         write Fcod_aj;
    property descr_compl_aj: string  read Fdescr_compl_aj write Fdescr_compl_aj;
    property vl_bc_icms    : Variant read Fvl_bc_icms     write Fvl_bc_icms;
    property aliq_icms     : Variant read Faliq_icms      write Faliq_icms;
    property vl_icms       : Variant read Fvl_icms        write Fvl_icms;
    property vl_outros     : Variant read Fvl_outros      write Fvl_outros;
    property txt_compl_c195: string  read Ftxt_compl_c195 write Ftxt_compl_c195;
  end;

  TNotafiscal_sped_c195_c197s_cls = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TNotafiscal_sped_c195_c197_cls;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_sped_c195_c197_cls);
  public
    function New: TNotafiscal_sped_c195_c197_cls;

    property Items[Index: Integer]: TNotafiscal_sped_c195_c197_cls read GetItem write SetItem;
  end;

implementation

{ TNotafiscal_sped_c195_c197_cls }

procedure TNotafiscal_sped_c195_c197_cls.InitializeObjects;
begin
  Ftable := TTableFb.Create('NOTAFISCAL_SPED_C195_C197');
  with FTable.Fields do
  begin
    AddField('COD_NF'        , fkInteger, 0  , False, True , True       );
    AddField('COD_EMPRESA'   , fkInteger, 0  , False, True , True       );
    AddField('COD_OBS'       , fkInteger, 0  , False, True , True       );
    AddField('NITEM'         , fkInteger, 0  , False, True              );
    AddField('COD_AJ'        , fkString , 10 , False, True              );
    AddField('DESCR_COMPL_AJ', fkString , 128                           );
    AddField('VL_BC_ICMS'    , fkFloat  , 0  , True , False, False, True);
    AddField('ALIQ_ICMS'     , fkFloat  , 0  , True , False, False, True);
    AddField('VL_ICMS'       , fkFloat  , 0  , True , False, False, True);
    AddField('VL_OUTROS'     , fkFloat  , 0  , True , False, False, True);
    AddField('TXT_COMPL_C195', fkString , 128                           );
  end;
end;

constructor TNotafiscal_sped_c195_c197_cls.Create;
begin
  InitializeObjects;
end;

{ TNotafiscal_sped_c195_c197s_cls }

function TNotafiscal_sped_c195_c197s_cls.GetItem(Index: Integer): TNotafiscal_sped_c195_c197_cls;
begin
  Result := TNotafiscal_sped_c195_c197_cls(inherited Items[Index]);
end;

function TNotafiscal_sped_c195_c197s_cls.New: TNotafiscal_sped_c195_c197_cls;
begin
  Result := TNotafiscal_sped_c195_c197_cls.Create;
  Add(Result);
end;

procedure TNotafiscal_sped_c195_c197s_cls.SetItem(Index: Integer; const Value: TNotafiscal_sped_c195_c197_cls);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TNotafiscal_sped_c195_c197_cls);
finalization
  UnRegisterClass(TNotafiscal_sped_c195_c197_cls);

end.

