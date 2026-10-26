unit notafiscal_sped_c115_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB,
  IBQuery;
{$ELSE}
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ENDIF}

type
  TNotafiscal_sped_c115_class = class(TObject)
  private
    Fcod_nf          : Integer;
    Fcod_empresa     : Integer;
    Fcod_inf         : Integer;
    Fnitem           : Integer;
    Find_carga       : Integer;
    Fcnpj_col        : string;
    Fie_col          : string;
    Fcpf_col         : string;
    Fcod_mun_col     : Integer;
    Fuf_col          : string;
    Fnfe_xlgr_col    : string;
    Fnfe_nro_col     : string;
    Fnfe_xcpl_col    : string;
    Fnfe_xbairro_col : string;
    Fnfe_xmun_col    : string;
    Fcnpj_entg       : string;
    Fie_entg         : string;
    Fcpf_entg        : string;
    Fcod_mun_entg    : Integer;
    Fuf_entg         : string;
    Fnfe_xlgr_entg   : string;
    Fnfe_nro_entg    : string;
    Fnfe_xcpl_entg   : string;
    Fnfe_xbairro_entg: string;
    Fnfe_xmun_entg   : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property cod_nf          : Integer read Fcod_nf           write Fcod_nf;
    property cod_empresa     : Integer read Fcod_empresa      write Fcod_empresa;
    property cod_inf         : Integer read Fcod_inf          write Fcod_inf;
    property nitem           : Integer read Fnitem            write Fnitem;
    property ind_carga       : Integer read Find_carga        write Find_carga;
    property cnpj_col        : string  read Fcnpj_col         write Fcnpj_col;
    property ie_col          : string  read Fie_col           write Fie_col;
    property cpf_col         : string  read Fcpf_col          write Fcpf_col;
    property cod_mun_col     : Integer read Fcod_mun_col      write Fcod_mun_col;
    property uf_col          : string  read Fuf_col           write Fuf_col;
    property nfe_xlgr_col    : string  read Fnfe_xlgr_col     write Fnfe_xlgr_col;
    property nfe_nro_col     : string  read Fnfe_nro_col      write Fnfe_nro_col;
    property nfe_xcpl_col    : string  read Fnfe_xcpl_col     write Fnfe_xcpl_col;
    property nfe_xbairro_col : string  read Fnfe_xbairro_col  write Fnfe_xbairro_col;
    property nfe_xmun_col    : string  read Fnfe_xmun_col     write Fnfe_xmun_col;
    property cnpj_entg       : string  read Fcnpj_entg        write Fcnpj_entg;
    property ie_entg         : string  read Fie_entg          write Fie_entg;
    property cpf_entg        : string  read Fcpf_entg         write Fcpf_entg;
    property cod_mun_entg    : Integer read Fcod_mun_entg     write Fcod_mun_entg;
    property uf_entg         : string  read Fuf_entg          write Fuf_entg;
    property nfe_xlgr_entg   : string  read Fnfe_xlgr_entg    write Fnfe_xlgr_entg;
    property nfe_nro_entg    : string  read Fnfe_nro_entg     write Fnfe_nro_entg;
    property nfe_xcpl_entg   : string  read Fnfe_xcpl_entg    write Fnfe_xcpl_entg;
    property nfe_xbairro_entg: string  read Fnfe_xbairro_entg write Fnfe_xbairro_entg;
    property nfe_xmun_entg   : string  read Fnfe_xmun_entg    write Fnfe_xmun_entg;
  end;

  TNotafiscal_sped_c115_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_sped_c115_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_sped_c115_class);
  public
    function New: TNotafiscal_sped_c115_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_sped_c115_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TNotafiscal_sped_c115_class }

class function TNotafiscal_sped_c115_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @cod_inf, @nitem, @ind_carga, @cnpj_col, @ie_col, @cpf_col, @cod_mun_col, @uf_col,' +
            ' @nfe_xlgr_col, @nfe_nro_col, @nfe_xcpl_col, @nfe_xbairro_col, @nfe_xmun_col, @cnpj_entg, @ie_entg,' +
            ' @cpf_entg, @cod_mun_entg, @uf_entg, @nfe_xlgr_entg, @nfe_nro_entg, @nfe_xcpl_entg, @nfe_xbairro_entg,' +
            ' @nfe_xmun_entg';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_sped_c115_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nf           := ADataSet.FieldByName('COD_NF').AsInteger;
    Fcod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcod_inf          := ADataSet.FieldByName('COD_INF').AsInteger;
    Fnitem            := ADataSet.FieldByName('NITEM').AsInteger;
    Find_carga        := ADataSet.FieldByName('IND_CARGA').AsInteger;
    Fcnpj_col         := Trim(ADataSet.FieldByName('CNPJ_COL').AsString);
    Fie_col           := Trim(ADataSet.FieldByName('IE_COL').AsString);
    Fcpf_col          := Trim(ADataSet.FieldByName('CPF_COL').AsString);
    Fcod_mun_col      := ADataSet.FieldByName('COD_MUN_COL').AsInteger;
    Fuf_col           := Trim(ADataSet.FieldByName('UF_COL').AsString);
    Fnfe_xlgr_col     := Trim(ADataSet.FieldByName('NFE_XLGR_COL').AsString);
    Fnfe_nro_col      := Trim(ADataSet.FieldByName('NFE_NRO_COL').AsString);
    Fnfe_xcpl_col     := Trim(ADataSet.FieldByName('NFE_XCPL_COL').AsString);
    Fnfe_xbairro_col  := Trim(ADataSet.FieldByName('NFE_XBAIRRO_COL').AsString);
    Fnfe_xmun_col     := Trim(ADataSet.FieldByName('NFE_XMUN_COL').AsString);
    Fcnpj_entg        := Trim(ADataSet.FieldByName('CNPJ_ENTG').AsString);
    Fie_entg          := Trim(ADataSet.FieldByName('IE_ENTG').AsString);
    Fcpf_entg         := Trim(ADataSet.FieldByName('CPF_ENTG').AsString);
    Fcod_mun_entg     := ADataSet.FieldByName('COD_MUN_ENTG').AsInteger;
    Fuf_entg          := Trim(ADataSet.FieldByName('UF_ENTG').AsString);
    Fnfe_xlgr_entg    := Trim(ADataSet.FieldByName('NFE_XLGR_ENTG').AsString);
    Fnfe_nro_entg     := Trim(ADataSet.FieldByName('NFE_NRO_ENTG').AsString);
    Fnfe_xcpl_entg    := Trim(ADataSet.FieldByName('NFE_XCPL_ENTG').AsString);
    Fnfe_xbairro_entg := Trim(ADataSet.FieldByName('NFE_XBAIRRO_ENTG').AsString);
    Fnfe_xmun_entg    := Trim(ADataSet.FieldByName('NFE_XMUN_ENTG').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NF'          )) then Fcod_nf           := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'     )) then Fcod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_INF'         )) then Fcod_inf          := ADataSet.FieldByName('COD_INF').AsInteger;
    if Assigned(ADataSet.FindField('NITEM'           )) then Fnitem            := ADataSet.FieldByName('NITEM').AsInteger;
    if Assigned(ADataSet.FindField('IND_CARGA'       )) then Find_carga        := ADataSet.FieldByName('IND_CARGA').AsInteger;
    if Assigned(ADataSet.FindField('CNPJ_COL'        )) then Fcnpj_col         := Trim(ADataSet.FieldByName('CNPJ_COL').AsString);
    if Assigned(ADataSet.FindField('IE_COL'          )) then Fie_col           := Trim(ADataSet.FieldByName('IE_COL').AsString);
    if Assigned(ADataSet.FindField('CPF_COL'         )) then Fcpf_col          := Trim(ADataSet.FieldByName('CPF_COL').AsString);
    if Assigned(ADataSet.FindField('COD_MUN_COL'     )) then Fcod_mun_col      := ADataSet.FieldByName('COD_MUN_COL').AsInteger;
    if Assigned(ADataSet.FindField('UF_COL'          )) then Fuf_col           := Trim(ADataSet.FieldByName('UF_COL').AsString);
    if Assigned(ADataSet.FindField('NFE_XLGR_COL'    )) then Fnfe_xlgr_col     := Trim(ADataSet.FieldByName('NFE_XLGR_COL').AsString);
    if Assigned(ADataSet.FindField('NFE_NRO_COL'     )) then Fnfe_nro_col      := Trim(ADataSet.FieldByName('NFE_NRO_COL').AsString);
    if Assigned(ADataSet.FindField('NFE_XCPL_COL'    )) then Fnfe_xcpl_col     := Trim(ADataSet.FieldByName('NFE_XCPL_COL').AsString);
    if Assigned(ADataSet.FindField('NFE_XBAIRRO_COL' )) then Fnfe_xbairro_col  := Trim(ADataSet.FieldByName('NFE_XBAIRRO_COL').AsString);
    if Assigned(ADataSet.FindField('NFE_XMUN_COL'    )) then Fnfe_xmun_col     := Trim(ADataSet.FieldByName('NFE_XMUN_COL').AsString);
    if Assigned(ADataSet.FindField('CNPJ_ENTG'       )) then Fcnpj_entg        := Trim(ADataSet.FieldByName('CNPJ_ENTG').AsString);
    if Assigned(ADataSet.FindField('IE_ENTG'         )) then Fie_entg          := Trim(ADataSet.FieldByName('IE_ENTG').AsString);
    if Assigned(ADataSet.FindField('CPF_ENTG'        )) then Fcpf_entg         := Trim(ADataSet.FieldByName('CPF_ENTG').AsString);
    if Assigned(ADataSet.FindField('COD_MUN_ENTG'    )) then Fcod_mun_entg     := ADataSet.FieldByName('COD_MUN_ENTG').AsInteger;
    if Assigned(ADataSet.FindField('UF_ENTG'         )) then Fuf_entg          := Trim(ADataSet.FieldByName('UF_ENTG').AsString);
    if Assigned(ADataSet.FindField('NFE_XLGR_ENTG'   )) then Fnfe_xlgr_entg    := Trim(ADataSet.FieldByName('NFE_XLGR_ENTG').AsString);
    if Assigned(ADataSet.FindField('NFE_NRO_ENTG'    )) then Fnfe_nro_entg     := Trim(ADataSet.FieldByName('NFE_NRO_ENTG').AsString);
    if Assigned(ADataSet.FindField('NFE_XCPL_ENTG'   )) then Fnfe_xcpl_entg    := Trim(ADataSet.FieldByName('NFE_XCPL_ENTG').AsString);
    if Assigned(ADataSet.FindField('NFE_XBAIRRO_ENTG')) then Fnfe_xbairro_entg := Trim(ADataSet.FieldByName('NFE_XBAIRRO_ENTG').AsString);
    if Assigned(ADataSet.FindField('NFE_XMUN_ENTG'   )) then Fnfe_xmun_entg    := Trim(ADataSet.FieldByName('NFE_XMUN_ENTG').AsString);
  end;
end;

function TNotafiscal_sped_c115_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_NF').AsInteger          := Fcod_nf;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger     := Fcod_empresa;
    ADataSet.ParamByName('COD_INF').AsInteger         := Fcod_inf;
    ADataSet.ParamByName('NITEM').AsInteger           := Fnitem;
    ADataSet.ParamByName('IND_CARGA').AsInteger       := Find_carga;
    ADataSet.ParamByName('CNPJ_COL').AsString         := Copy(Fcnpj_col        , 1, 18);
    ADataSet.ParamByName('IE_COL').AsString           := Copy(Fie_col          , 1, 18);
    ADataSet.ParamByName('CPF_COL').AsString          := Copy(Fcpf_col         , 1, 18);
    ADataSet.ParamByName('COD_MUN_COL').AsInteger     := Fcod_mun_col;
    ADataSet.ParamByName('UF_COL').AsString           := Copy(Fuf_col          , 1, 2);
    ADataSet.ParamByName('NFE_XLGR_COL').AsString     := Copy(Fnfe_xlgr_col    , 1, 60);
    ADataSet.ParamByName('NFE_NRO_COL').AsString      := Copy(Fnfe_nro_col     , 1, 60);
    ADataSet.ParamByName('NFE_XCPL_COL').AsString     := Copy(Fnfe_xcpl_col    , 1, 60);
    ADataSet.ParamByName('NFE_XBAIRRO_COL').AsString  := Copy(Fnfe_xbairro_col , 1, 60);
    ADataSet.ParamByName('NFE_XMUN_COL').AsString     := Copy(Fnfe_xmun_col    , 1, 60);
    ADataSet.ParamByName('CNPJ_ENTG').AsString        := Copy(Fcnpj_entg       , 1, 18);
    ADataSet.ParamByName('IE_ENTG').AsString          := Copy(Fie_entg         , 1, 18);
    ADataSet.ParamByName('CPF_ENTG').AsString         := Copy(Fcpf_entg        , 1, 18);
    ADataSet.ParamByName('COD_MUN_ENTG').AsInteger    := Fcod_mun_entg;
    ADataSet.ParamByName('UF_ENTG').AsString          := Copy(Fuf_entg         , 1, 2);
    ADataSet.ParamByName('NFE_XLGR_ENTG').AsString    := Copy(Fnfe_xlgr_entg   , 1, 60);
    ADataSet.ParamByName('NFE_NRO_ENTG').AsString     := Copy(Fnfe_nro_entg    , 1, 60);
    ADataSet.ParamByName('NFE_XCPL_ENTG').AsString    := Copy(Fnfe_xcpl_entg   , 1, 60);
    ADataSet.ParamByName('NFE_XBAIRRO_ENTG').AsString := Copy(Fnfe_xbairro_entg, 1, 60);
    ADataSet.ParamByName('NFE_XMUN_ENTG').AsString    := Copy(Fnfe_xmun_entg   , 1, 60);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_NF'          )) then   ADataSet.ParamByName('COD_NF').AsInteger          := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'     )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger     := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('COD_INF'         )) then   ADataSet.ParamByName('COD_INF').AsInteger         := Fcod_inf;
    if Assigned(ADataSet.Params.FindParam('NITEM'           )) then   ADataSet.ParamByName('NITEM').AsInteger           := Fnitem;
    if Assigned(ADataSet.Params.FindParam('IND_CARGA'       )) then   ADataSet.ParamByName('IND_CARGA').AsInteger       := Find_carga;
    if Assigned(ADataSet.Params.FindParam('CNPJ_COL'        )) then   ADataSet.ParamByName('CNPJ_COL').AsString         := Copy(Fcnpj_col        , 1, 18);
    if Assigned(ADataSet.Params.FindParam('IE_COL'          )) then   ADataSet.ParamByName('IE_COL').AsString           := Copy(Fie_col          , 1, 18);
    if Assigned(ADataSet.Params.FindParam('CPF_COL'         )) then   ADataSet.ParamByName('CPF_COL').AsString          := Copy(Fcpf_col         , 1, 18);
    if Assigned(ADataSet.Params.FindParam('COD_MUN_COL'     )) then   ADataSet.ParamByName('COD_MUN_COL').AsInteger     := Fcod_mun_col;
    if Assigned(ADataSet.Params.FindParam('UF_COL'          )) then   ADataSet.ParamByName('UF_COL').AsString           := Copy(Fuf_col          , 1, 2);
    if Assigned(ADataSet.Params.FindParam('NFE_XLGR_COL'    )) then   ADataSet.ParamByName('NFE_XLGR_COL').AsString     := Copy(Fnfe_xlgr_col    , 1, 60);
    if Assigned(ADataSet.Params.FindParam('NFE_NRO_COL'     )) then   ADataSet.ParamByName('NFE_NRO_COL').AsString      := Copy(Fnfe_nro_col     , 1, 60);
    if Assigned(ADataSet.Params.FindParam('NFE_XCPL_COL'    )) then   ADataSet.ParamByName('NFE_XCPL_COL').AsString     := Copy(Fnfe_xcpl_col    , 1, 60);
    if Assigned(ADataSet.Params.FindParam('NFE_XBAIRRO_COL' )) then   ADataSet.ParamByName('NFE_XBAIRRO_COL').AsString  := Copy(Fnfe_xbairro_col , 1, 60);
    if Assigned(ADataSet.Params.FindParam('NFE_XMUN_COL'    )) then   ADataSet.ParamByName('NFE_XMUN_COL').AsString     := Copy(Fnfe_xmun_col    , 1, 60);
    if Assigned(ADataSet.Params.FindParam('CNPJ_ENTG'       )) then   ADataSet.ParamByName('CNPJ_ENTG').AsString        := Copy(Fcnpj_entg       , 1, 18);
    if Assigned(ADataSet.Params.FindParam('IE_ENTG'         )) then   ADataSet.ParamByName('IE_ENTG').AsString          := Copy(Fie_entg         , 1, 18);
    if Assigned(ADataSet.Params.FindParam('CPF_ENTG'        )) then   ADataSet.ParamByName('CPF_ENTG').AsString         := Copy(Fcpf_entg        , 1, 18);
    if Assigned(ADataSet.Params.FindParam('COD_MUN_ENTG'    )) then   ADataSet.ParamByName('COD_MUN_ENTG').AsInteger    := Fcod_mun_entg;
    if Assigned(ADataSet.Params.FindParam('UF_ENTG'         )) then   ADataSet.ParamByName('UF_ENTG').AsString          := Copy(Fuf_entg         , 1, 2);
    if Assigned(ADataSet.Params.FindParam('NFE_XLGR_ENTG'   )) then   ADataSet.ParamByName('NFE_XLGR_ENTG').AsString    := Copy(Fnfe_xlgr_entg   , 1, 60);
    if Assigned(ADataSet.Params.FindParam('NFE_NRO_ENTG'    )) then   ADataSet.ParamByName('NFE_NRO_ENTG').AsString     := Copy(Fnfe_nro_entg    , 1, 60);
    if Assigned(ADataSet.Params.FindParam('NFE_XCPL_ENTG'   )) then   ADataSet.ParamByName('NFE_XCPL_ENTG').AsString    := Copy(Fnfe_xcpl_entg   , 1, 60);
    if Assigned(ADataSet.Params.FindParam('NFE_XBAIRRO_ENTG')) then   ADataSet.ParamByName('NFE_XBAIRRO_ENTG').AsString := Copy(Fnfe_xbairro_entg, 1, 60);
    if Assigned(ADataSet.Params.FindParam('NFE_XMUN_ENTG'   )) then   ADataSet.ParamByName('NFE_XMUN_ENTG').AsString    := Copy(Fnfe_xmun_entg   , 1, 60);
  end;
end;

{ TNotafiscal_sped_c115_classList }

function TNotafiscal_sped_c115_classList.GetItem(Index: Integer): TNotafiscal_sped_c115_class;
begin
  Result := TNotafiscal_sped_c115_class(inherited Items[Index]);
end;

function TNotafiscal_sped_c115_classList.New: TNotafiscal_sped_c115_class;
begin
  Result := TNotafiscal_sped_c115_class.Create;
  Add(Result);
end;

procedure TNotafiscal_sped_c115_classList.SetItem(Index: Integer; const Value: TNotafiscal_sped_c115_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_sped_c115_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
