unit nota_ajuste_class;

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
  TNotaAjusteDb = class(TBaseFb_class)
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
    Fguidt         : string;
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
    property guidt         : string  read Fguidt          write Fguidt;
  end;

  TNotaAjusteDbList = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TNotaAjusteDb;
    procedure SetItem(Index: Integer; const Value: TNotaAjusteDb);
  public
    function New: TNotaAjusteDb;

    property Items[Index: Integer]: TNotaAjusteDb read GetItem write SetItem;
  end;

implementation

{ TNotaAjusteDb }

procedure TNotaAjusteDb.InitializeObjects;
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
    AddField('GUIDT'         , fkString , 36                            );
  end;
end;

constructor TNotaAjusteDb.Create;
begin
  InitializeObjects;
end;

{ TNotaAjusteDbList }

function TNotaAjusteDbList.GetItem(Index: Integer): TNotaAjusteDb;
begin
  Result := TNotaAjusteDb(inherited Items[Index]);
end;

function TNotaAjusteDbList.New: TNotaAjusteDb;
begin
  Result := TNotaAjusteDb.Create;
  Add(Result);
end;

procedure TNotaAjusteDbList.SetItem(Index: Integer; const Value: TNotaAjusteDb);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TNotaAjusteDb);
finalization
  UnRegisterClass(TNotaAjusteDb);

end.
