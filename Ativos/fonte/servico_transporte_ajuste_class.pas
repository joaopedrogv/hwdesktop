unit servico_transporte_ajuste_class;

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
  TServico_transporte_ajuste_class = class(TBaseFb_class)
  private
    Fid            : string;
    Fservtr_id     : string;
    Fcod_empresa   : Integer;
    Fcod_obs       : Integer;
    Fcod_aj        : string;
    Fdescr_compl_aj: string;
    Fvl_bc_icms    : Variant;
    Faliq_icms     : Variant;
    Fvl_icms       : Variant;
    Fvl_outros     : Variant;
    Ftxt_compl_d195: string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id            : string  read Fid             write Fid;
    property servtr_id     : string  read Fservtr_id      write Fservtr_id;
    property cod_empresa   : Integer read Fcod_empresa    write Fcod_empresa;
    property cod_obs       : Integer read Fcod_obs        write Fcod_obs;
    property cod_aj        : string  read Fcod_aj         write Fcod_aj;
    property descr_compl_aj: string  read Fdescr_compl_aj write Fdescr_compl_aj;
    property vl_bc_icms    : Variant read Fvl_bc_icms     write Fvl_bc_icms;
    property aliq_icms     : Variant read Faliq_icms      write Faliq_icms;
    property vl_icms       : Variant read Fvl_icms        write Fvl_icms;
    property vl_outros     : Variant read Fvl_outros      write Fvl_outros;
    property txt_compl_d195: string  read Ftxt_compl_d195 write Ftxt_compl_d195;
  end;

  TServico_transporte_ajustes_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TServico_transporte_ajuste_class;
    procedure SetItem(Index: Integer; const Value: TServico_transporte_ajuste_class);
  public
    function New: TServico_transporte_ajuste_class;

    property Items[Index: Integer]: TServico_transporte_ajuste_class read GetItem write SetItem;
  end;

implementation

{ TServico_transporte_ajuste_class }

procedure TServico_transporte_ajuste_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('SERVICO_TRANSPORTE_AJUSTE');
  with FTable.Fields do
  begin
    AddField('ID'            , fkString , 36 , False, True              );
    AddField('SERVTR_ID'     , fkString , 36 , False                    );
    AddField('COD_EMPRESA'   , fkInteger, 0  , False, False, True       );
    AddField('COD_OBS'       , fkInteger, 0  , False, False, True       );
    AddField('COD_AJ'        , fkString , 10 , False                    );
    AddField('DESCR_COMPL_AJ', fkString , 128                           );
    AddField('VL_BC_ICMS'    , fkFloat  , 0  , True , False, False, True);
    AddField('ALIQ_ICMS'     , fkFloat  , 0  , True , False, False, True);
    AddField('VL_ICMS'       , fkFloat  , 0  , True , False, False, True);
    AddField('VL_OUTROS'     , fkFloat  , 0  , True , False, False, True);
    AddField('TXT_COMPL_D195', fkString , 128                           );
  end;
end;

constructor TServico_transporte_ajuste_class.Create;
begin
  InitializeObjects;
end;

{ TServico_transporte_ajustes_class }

function TServico_transporte_ajustes_class.GetItem(Index: Integer): TServico_transporte_ajuste_class;
begin
  Result := TServico_transporte_ajuste_class(inherited Items[Index]);
end;

function TServico_transporte_ajustes_class.New: TServico_transporte_ajuste_class;
begin
  Result := TServico_transporte_ajuste_class.Create;
  Add(Result);
end;

procedure TServico_transporte_ajustes_class.SetItem(Index: Integer; const Value: TServico_transporte_ajuste_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TServico_transporte_ajuste_class);
finalization
  UnRegisterClass(TServico_transporte_ajuste_class);

end.

