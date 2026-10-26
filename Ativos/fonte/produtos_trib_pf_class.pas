unit produtos_trib_pf_class;

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
  TProdutos_trib_pf_class = class(TObject)
  private
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
    Find_desoneracao    : Integer;
    Ffinalidadeid       : Integer;
    Fusar_mva_anexoxv   : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TProdutos_trib_pf_class; virtual;

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
    property ind_desoneracao    : Integer read Find_desoneracao     write Find_desoneracao;
    property finalidadeid       : Integer read Ffinalidadeid        write Ffinalidadeid;
    property usar_mva_anexoxv   : string  read Fusar_mva_anexoxv    write Fusar_mva_anexoxv;
  end;

  TProdutos_trib_pf_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TProdutos_trib_pf_class;
    procedure SetItem(Index: Integer; const Value: TProdutos_trib_pf_class);
  public
    function New: TProdutos_trib_pf_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TProdutos_trib_pf_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TProdutos_trib_pf_class }

constructor TProdutos_trib_pf_class.Create;
begin
  Fativo := 1;
end;

destructor TProdutos_trib_pf_class.Destroy;
begin
  inherited;
end;

function TProdutos_trib_pf_class.Clone: TProdutos_trib_pf_class;
begin
  Result                     := TProdutos_trib_pf_class.Create;
  Result.cod_trib_pf         := Self.cod_trib_pf;
  Result.cod_empresa         := Self.cod_empresa;
  Result.descricao_pf        := Self.descricao_pf;
  Result.sigla_uf            := Self.sigla_uf;
  Result.contribuinte        := Self.contribuinte;
  Result.pessoa              := Self.pessoa;
  Result.cst_icms            := Self.cst_icms;
  Result.codigo_nop          := Self.codigo_nop;
  Result.aliq_intra          := Self.aliq_intra;
  Result.aliq_inter          := Self.aliq_inter;
  Result.mva                 := Self.mva;
  Result.perc_red_prod       := Self.perc_red_prod;
  Result.reducao_cad_produto := Self.reducao_cad_produto;
  Result.ativo               := Self.ativo;
  Result.consumidor_final    := Self.consumidor_final;
  Result.fcp_aliq            := Self.fcp_aliq;
  Result.ind_desoneracao     := Self.ind_desoneracao;
  Result.finalidadeid        := Self.finalidadeid;
  Result.usar_mva_anexoxv    := Self.usar_mva_anexoxv;
end;

class function TProdutos_trib_pf_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_trib_pf, @cod_empresa, @descricao_pf, @sigla_uf, @contribuinte, @pessoa, @cst_icms, @codigo_nop,' +
            ' @aliq_intra, @aliq_inter, @mva, @perc_red_prod, @reducao_cad_produto, @ativo, @consumidor_final, @fcp_aliq,' +
            ' @ind_desoneracao, @finalidadeid, @usar_mva_anexoxv';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TProdutos_trib_pf_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
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
  end
  else
  begin
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
  end;
end;

{ TProdutos_trib_pf_classList }

function TProdutos_trib_pf_classList.GetItem(Index: Integer): TProdutos_trib_pf_class;
begin
  Result := TProdutos_trib_pf_class(inherited Items[Index]);
end;

function TProdutos_trib_pf_classList.New: TProdutos_trib_pf_class;
begin
  Result := TProdutos_trib_pf_class.Create;
  Add(Result);
end;

procedure TProdutos_trib_pf_classList.SetItem(Index: Integer; const Value: TProdutos_trib_pf_class);
begin
  Put(Index, Value);
end;

procedure TProdutos_trib_pf_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
