unit hw_prod_trib_ad_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB;
{$ELSE}
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  THw_prod_trib_ad_class = class(TObject)
  private
    Fgrupo_prod         : Integer;
    Fcod_prod           : string;
    Fcod_trib_pf        : Integer;
    Fcod_empresa        : Integer;
    Fdescricao_pf       : string;
    Fsigla_uf           : string;
    Fcontribuinte       : string;
    Fpessoa             : string;
    Fcst_icms           : string;
    Fcodigo_nop         : Double;
    Faliq_intra         : Double;
    Faliq_inter         : Double;
    Fmva                : Double;
    Fperc_red_prod      : Double;
    Freducao_cad_produto: string;
    Fativo              : Integer;
    Fconsumidor_final   : string;
    Ffcp_aliq           : Double;
    Fdest_seqid         : Integer;
    Fcod_cliente        : Integer;
    Find_desoneracao    : Integer;
    Ffinalidadeid       : Integer;
    Fusar_mva_anexoxv   : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property grupo_prod         : Integer read Fgrupo_prod          write Fgrupo_prod;
    property cod_prod           : string  read Fcod_prod            write Fcod_prod;
    property cod_trib_pf        : Integer read Fcod_trib_pf         write Fcod_trib_pf;
    property cod_empresa        : Integer read Fcod_empresa         write Fcod_empresa;
    property descricao_pf       : string  read Fdescricao_pf        write Fdescricao_pf;
    property sigla_uf           : string  read Fsigla_uf            write Fsigla_uf;
    property contribuinte       : string  read Fcontribuinte        write Fcontribuinte;
    property pessoa             : string  read Fpessoa              write Fpessoa;
    property cst_icms           : string  read Fcst_icms            write Fcst_icms;
    property codigo_nop         : Double  read Fcodigo_nop          write Fcodigo_nop;
    property aliq_intra         : Double  read Faliq_intra          write Faliq_intra;
    property aliq_inter         : Double  read Faliq_inter          write Faliq_inter;
    property mva                : Double  read Fmva                 write Fmva;
    property perc_red_prod      : Double  read Fperc_red_prod       write Fperc_red_prod;
    property reducao_cad_produto: string  read Freducao_cad_produto write Freducao_cad_produto;
    property ativo              : Integer read Fativo               write Fativo;
    property consumidor_final   : string  read Fconsumidor_final    write Fconsumidor_final;
    property fcp_aliq           : Double  read Ffcp_aliq            write Ffcp_aliq;
    property cod_cliente        : Integer read Fcod_cliente         write Fcod_cliente;
    property dest_seqid         : Integer read Fdest_seqid          write Fdest_seqid;
    property ind_desoneracao    : Integer read Find_desoneracao     write Find_desoneracao;
    property finalidadeid       : Integer read Ffinalidadeid        write Ffinalidadeid;
    property usar_mva_anexoxv   : string  read Fusar_mva_anexoxv    write Fusar_mva_anexoxv;
  end;

  THw_prod_trib_ad_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): THw_prod_trib_ad_class;
    procedure SetItem(Index: Integer; const Value: THw_prod_trib_ad_class);
  public
    function New: THw_prod_trib_ad_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: THw_prod_trib_ad_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ THw_prod_trib_ad_class }

constructor THw_prod_trib_ad_class.Create;
begin
  Fativo := 1;
end;

destructor THw_prod_trib_ad_class.Destroy;
begin
  inherited;
end;

procedure THw_prod_trib_ad_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fgrupo_prod          := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod            := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fcod_trib_pf         := ADataSet.FieldByName('COD_TRIB_PF').AsInteger;
    Fcod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fdescricao_pf        := Trim(ADataSet.FieldByName('DESCRICAO_PF').AsString);
    Fsigla_uf            := Trim(ADataSet.FieldByName('SIGLA_UF').AsString);
    Fcontribuinte        := Trim(ADataSet.FieldByName('CONTRIBUINTE').AsString);
    Fpessoa              := Trim(ADataSet.FieldByName('PESSOA').AsString);
    Fcst_icms            := Trim(ADataSet.FieldByName('CST_ICMS').AsString);
    Fcodigo_nop          := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    Faliq_intra          := ADataSet.FieldByName('ALIQ_INTRA').AsFloat;
    Faliq_inter          := ADataSet.FieldByName('ALIQ_INTER').AsFloat;
    Fmva                 := ADataSet.FieldByName('MVA').AsFloat;
    Fperc_red_prod       := ADataSet.FieldByName('PERC_RED_PROD').AsFloat;
    Freducao_cad_produto := Trim(ADataSet.FieldByName('REDUCAO_CAD_PRODUTO').AsString);
    Fativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    Fconsumidor_final    := Trim(ADataSet.FieldByName('CONSUMIDOR_FINAL').AsString);
    Ffcp_aliq            := ADataSet.FieldByName('FCP_ALIQ').AsFloat;
    Find_desoneracao     := ADataSet.FieldByName('IND_DESONERACAO').AsInteger;
    Ffinalidadeid        := ADataSet.FieldByName('FINALIDADEID').AsInteger;
    Fusar_mva_anexoxv    := Trim(ADataSet.FieldByName('USAR_MVA_ANEXOXV').AsString);
    Fcod_cliente         := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    Fdest_seqid          := ADataSet.FieldByName('DEST_SEQID').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('GRUPO_PROD'         )) then Fgrupo_prod          := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'           )) then Fcod_prod            := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('COD_TRIB_PF'        )) then Fcod_trib_pf         := ADataSet.FieldByName('COD_TRIB_PF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'        )) then Fcod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('DESCRICAO_PF'       )) then Fdescricao_pf        := Trim(ADataSet.FieldByName('DESCRICAO_PF').AsString);
    if Assigned(ADataSet.FindField('SIGLA_UF'           )) then Fsigla_uf            := Trim(ADataSet.FieldByName('SIGLA_UF').AsString);
    if Assigned(ADataSet.FindField('CONTRIBUINTE'       )) then Fcontribuinte        := Trim(ADataSet.FieldByName('CONTRIBUINTE').AsString);
    if Assigned(ADataSet.FindField('PESSOA'             )) then Fpessoa              := Trim(ADataSet.FieldByName('PESSOA').AsString);
    if Assigned(ADataSet.FindField('CST_ICMS'           )) then Fcst_icms            := Trim(ADataSet.FieldByName('CST_ICMS').AsString);
    if Assigned(ADataSet.FindField('CODIGO_NOP'         )) then Fcodigo_nop          := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_INTRA'         )) then Faliq_intra          := ADataSet.FieldByName('ALIQ_INTRA').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_INTER'         )) then Faliq_inter          := ADataSet.FieldByName('ALIQ_INTER').AsFloat;
    if Assigned(ADataSet.FindField('MVA'                )) then Fmva                 := ADataSet.FieldByName('MVA').AsFloat;
    if Assigned(ADataSet.FindField('PERC_RED_PROD'      )) then Fperc_red_prod       := ADataSet.FieldByName('PERC_RED_PROD').AsFloat;
    if Assigned(ADataSet.FindField('REDUCAO_CAD_PRODUTO')) then Freducao_cad_produto := Trim(ADataSet.FieldByName('REDUCAO_CAD_PRODUTO').AsString);
    if Assigned(ADataSet.FindField('ATIVO'              )) then Fativo               := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('CONSUMIDOR_FINAL'   )) then Fconsumidor_final    := Trim(ADataSet.FieldByName('CONSUMIDOR_FINAL').AsString);
    if Assigned(ADataSet.FindField('FCP_ALIQ'           )) then Ffcp_aliq            := ADataSet.FieldByName('FCP_ALIQ').AsFloat;
    if Assigned(ADataSet.FindField('IND_DESONERACAO'    )) then Find_desoneracao     := ADataSet.FieldByName('IND_DESONERACAO').AsInteger;
    if Assigned(ADataSet.FindField('FINALIDADEID'       )) then Ffinalidadeid        := ADataSet.FieldByName('FINALIDADEID').AsInteger;
    if Assigned(ADataSet.FindField('USAR_MVA_ANEXOXV'   )) then Fusar_mva_anexoxv    := Trim(ADataSet.FieldByName('USAR_MVA_ANEXOXV').AsString);
    if Assigned(ADataSet.FindField('COD_CLIENTE'        )) then Fcod_cliente         := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('DEST_SEQID'         )) then Fdest_seqid          := ADataSet.FieldByName('DEST_SEQID').AsInteger;
  end;
end;

{ THw_prod_trib_ad_classList }

function THw_prod_trib_ad_classList.GetItem(Index: Integer): THw_prod_trib_ad_class;
begin
  Result := THw_prod_trib_ad_class(inherited Items[Index]);
end;

function THw_prod_trib_ad_classList.New: THw_prod_trib_ad_class;
begin
  Result := THw_prod_trib_ad_class.Create;
  Add(Result);
end;

procedure THw_prod_trib_ad_classList.SetItem(Index: Integer; const Value: THw_prod_trib_ad_class);
begin
  Put(Index, Value);
end;

procedure THw_prod_trib_ad_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
