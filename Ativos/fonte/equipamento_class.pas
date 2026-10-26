unit equipamento_class;

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
  TEquipamento_class = class(TBaseFb_class)
  private
    Fcod_equip       : Integer;
    Fcod_empresa     : Integer;
    Fdat_cad_equi    : Variant;
    Festado_equi     : TStrings;
    Ftip_equip       : string;
    Fvlr_equi        : Variant;
    Find_deprec      : Variant;
    Fcod_depart      : Variant;
    Fcod_prop        : Variant;
    Fnom_equip       : string;
    Fn_serie         : string;
    Fmarca           : string;
    Fmodelo          : string;
    Fcor             : string;
    Fativo           : Variant;
    Fcod_marca       : Integer;
    Fidentificacao   : string;
    Fn_serie_fab     : string;
    Fn_memoria_fiscal: string;
    Fcodseq_balanco  : Variant;
    Ftipequip        : string;
    Fn_conta_plc     : Variant;
    Fident_merc      : string;
    Fcod_prnc        : Variant;
    Fcod_cta         : Variant;
    Fnr_parc         : Variant;
    Fcod_ccus        : Variant;
    Ffunc            : TStrings;
    Fvida_util       : Variant;
    Fsped            : string;
    Fcod_cta_eq      : string;
    Ftipoosvinc      : string;
    Fcomcontrato     : string;
    Fcod_estmoto     : Variant;
    Fstatus_v        : string;
    Fdata_ven        : Variant;
    Fcod_nf_ent      : Variant;
    Fnitem_ent       : Variant;
    Fcod_nf_sai      : Variant;
    Fnitem_sai       : Variant;
    Fus_cad          : Variant;
    Fportaria_modelo : string;
    Forigem_equip_id : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property cod_equip       : Integer  read Fcod_equip        write Fcod_equip;
    property cod_empresa     : Integer  read Fcod_empresa      write Fcod_empresa;
    property dat_cad_equi    : Variant  read Fdat_cad_equi     write Fdat_cad_equi;
    property estado_equi     : TStrings read Festado_equi      write Festado_equi;
    property tip_equip       : string   read Ftip_equip        write Ftip_equip;
    property vlr_equi        : Variant  read Fvlr_equi         write Fvlr_equi;
    property ind_deprec      : Variant  read Find_deprec       write Find_deprec;
    property cod_depart      : Variant  read Fcod_depart       write Fcod_depart;
    property cod_prop        : Variant  read Fcod_prop         write Fcod_prop;
    property nom_equip       : string   read Fnom_equip        write Fnom_equip;
    property n_serie         : string   read Fn_serie          write Fn_serie;
    property marca           : string   read Fmarca            write Fmarca;
    property modelo          : string   read Fmodelo           write Fmodelo;
    property cor             : string   read Fcor              write Fcor;
    property ativo           : Variant  read Fativo            write Fativo;
    property cod_marca       : Integer  read Fcod_marca        write Fcod_marca;
    property identificacao   : string   read Fidentificacao    write Fidentificacao;
    property n_serie_fab     : string   read Fn_serie_fab      write Fn_serie_fab;
    property n_memoria_fiscal: string   read Fn_memoria_fiscal write Fn_memoria_fiscal;
    property codseq_balanco  : Variant  read Fcodseq_balanco   write Fcodseq_balanco;
    property tipequip        : string   read Ftipequip         write Ftipequip;
    property n_conta_plc     : Variant  read Fn_conta_plc      write Fn_conta_plc;
    property ident_merc      : string   read Fident_merc       write Fident_merc;
    property cod_prnc        : Variant  read Fcod_prnc         write Fcod_prnc;
    property cod_cta         : Variant  read Fcod_cta          write Fcod_cta;
    property nr_parc         : Variant  read Fnr_parc          write Fnr_parc;
    property cod_ccus        : Variant  read Fcod_ccus         write Fcod_ccus;
    property func            : TStrings read Ffunc             write Ffunc;
    property vida_util       : Variant  read Fvida_util        write Fvida_util;
    property sped            : string   read Fsped             write Fsped;
    property cod_cta_eq      : string   read Fcod_cta_eq       write Fcod_cta_eq;
    property tipoosvinc      : string   read Ftipoosvinc       write Ftipoosvinc;
    property comcontrato     : string   read Fcomcontrato      write Fcomcontrato;
    property cod_estmoto     : Variant  read Fcod_estmoto      write Fcod_estmoto;
    property status_v        : string   read Fstatus_v         write Fstatus_v;
    property data_ven        : Variant  read Fdata_ven         write Fdata_ven;
    property cod_nf_ent      : Variant  read Fcod_nf_ent       write Fcod_nf_ent;
    property nitem_ent       : Variant  read Fnitem_ent        write Fnitem_ent;
    property cod_nf_sai      : Variant  read Fcod_nf_sai       write Fcod_nf_sai;
    property nitem_sai       : Variant  read Fnitem_sai        write Fnitem_sai;
    property us_cad          : Variant  read Fus_cad           write Fus_cad;
    property portaria_modelo : string   read Fportaria_modelo  write Fportaria_modelo;
    property origem_equip_id : Variant  read Forigem_equip_id  write Forigem_equip_id;
  end;

  TEquipamentos_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TEquipamento_class;
    procedure SetItem(Index: Integer; const Value: TEquipamento_class);
  public
    function New: TEquipamento_class;

    property Items[Index: Integer]: TEquipamento_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TEquipamento_class }

procedure TEquipamento_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('EQUIPAMENTO');
  with FTable.Fields do
  begin
    AddField('COD_EQUIP'       , fkInteger , 0 , False, True              );
    AddField('COD_EMPRESA'     , fkInteger , 0 , False, True , True       );
    AddField('DAT_CAD_EQUI'    , fkDateTime                               );
    AddField('ESTADO_EQUI'     , fkTStrings                               );
    AddField('TIP_EQUIP'       , fkString  , 1                            );
    AddField('VLR_EQUI'        , fkFloat   , 0 , True , False, False, True);
    AddField('IND_DEPREC'      , fkFloat   , 0 , True , False, False, True);
    AddField('COD_DEPART'      , fkInteger                                );
    AddField('COD_PROP'        , fkInteger                                );
    AddField('NOM_EQUIP'       , fkString  , 32                           );
    AddField('N_SERIE'         , fkString  , 32                           );
    AddField('MARCA'           , fkString  , 32                           );
    AddField('MODELO'          , fkString  , 32                           );
    AddField('COR'             , fkString  , 16                           );
    AddField('ATIVO'           , fkInteger , 0 , True , False, False, True);
    AddField('COD_MARCA'       , fkInteger , 0 , False                    );
    AddField('IDENTIFICACAO'   , fkString  , 6                            );
    AddField('N_SERIE_FAB'     , fkString  , 20                           );
    AddField('N_MEMORIA_FISCAL', fkString  , 20                           );
    AddField('CODSEQ_BALANCO'  , fkInteger                                );
    AddField('TIPEQUIP'        , fkString  , 1                            );
    AddField('N_CONTA_PLC'     , fkFloat   , 0 , True , False, False, True);
    AddField('IDENT_MERC'      , fkString  , 1 , True , False, False, True);
    AddField('COD_PRNC'        , fkInteger                                );
    AddField('COD_CTA'         , fkInteger                                );
    AddField('NR_PARC'         , fkInteger , 0 , True , False, False, True);
    AddField('COD_CCUS'        , fkInteger , 0 , True , False, False, True);
    AddField('FUNC'            , fkTStrings                               );
    AddField('VIDA_UTIL'       , fkInteger , 0 , True , False, False, True);
    AddField('SPED'            , fkString  , 1 , True , False, False, True);
    AddField('COD_CTA_EQ'      , fkString  , 60                           );
    AddField('TIPOOSVINC'      , fkString  , 10                           );
    AddField('COMCONTRATO'     , fkString  , 1 , True , False, False, True);
    AddField('COD_ESTMOTO'     , fkInteger                                );
    AddField('STATUS_V'        , fkString  , 1                            );
    AddField('DATA_VEN'        , fkDateTime                               );
    AddField('COD_NF_ENT'      , fkInteger                                );
    AddField('NITEM_ENT'       , fkInteger                                );
    AddField('COD_NF_SAI'      , fkInteger                                );
    AddField('NITEM_SAI'       , fkInteger                                );
    AddField('US_CAD'          , fkInteger                                );
    AddField('PORTARIA_MODELO' , fkString  , 64                           );
    AddField('ORIGEM_EQUIP_ID' , fkInteger , 0 , True , False, True       );
  end;
  Festado_equi := TStringList.Create;
  Ffunc        := TStringList.Create;
end;

constructor TEquipamento_class.Create;
begin
  InitializeObjects;
end;

destructor TEquipamento_class.Destroy;
begin
  if Assigned(Festado_equi) then
    FreeAndNil(Festado_equi);
  if Assigned(Ffunc) then
    FreeAndNil(Ffunc);
  inherited;
end;

{ TEquipamentos_class }

function TEquipamentos_class.GetItem(Index: Integer): TEquipamento_class;
begin
  Result := TEquipamento_class(inherited Items[Index]);
end;

function TEquipamentos_class.New: TEquipamento_class;
begin
  Result := TEquipamento_class.Create;
  Add(Result);
end;

procedure TEquipamentos_class.SetItem(Index: Integer; const Value: TEquipamento_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TEquipamento_class);
finalization
  UnRegisterClass(TEquipamento_class);

end.
