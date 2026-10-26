unit nbm_class;

interface

uses
  Contnrs,
  DB;

type
  TNbm_class = class(TObject)
  private
    Fcod_ncm                 : string;
    Fnome_ncm                : string;
    Fusar_mva_ajustado       : string;
    Freferencia              : string;
    Fmva                     : Double;
    Fmva_inter               : Double;
    Faliq_intra              : Double;
    Fcod_nbm                 : string;
    Fnome_nbm                : string;
    Fcst_pis                 : string;
    Fcst_cofins              : string;
    Fcst_pis_ent             : string;
    Fcst_cofins_ent          : string;
    Faliq_pis_diferenciada   : Double;
    Faliq_cofins_diferenciada: Double;
    Fcalc_st_saida           : string;
    Fnat_rec                 : string;
    Fcod_inf                 : Integer;
    Faliq_cred_pis           : Double;
    Faliq_cred_cofins        : Double;
    Faliqnac                 : Double;
    Faliqimp                 : Double;
    Fmodbcst                 : Integer;
    Fvlbcst                  : Double;
    Fdata_mod_cad            : TDateTime;
    Fnve                     : string;
    Fcenq_ipi_nfe            : string;
    Fcest                    : string;
    Ffcp_aliq                : Double;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property cod_ncm                 : string    read Fcod_ncm                  write Fcod_ncm;
    property nome_ncm                : string    read Fnome_ncm                 write Fnome_ncm;
    property usar_mva_ajustado       : string    read Fusar_mva_ajustado        write Fusar_mva_ajustado;
    property referencia              : string    read Freferencia               write Freferencia;
    property mva                     : Double    read Fmva                      write Fmva;
    property mva_inter               : Double    read Fmva_inter                write Fmva_inter;
    property aliq_intra              : Double    read Faliq_intra               write Faliq_intra;
    property cod_nbm                 : string    read Fcod_nbm                  write Fcod_nbm;
    property nome_nbm                : string    read Fnome_nbm                 write Fnome_nbm;
    property cst_pis                 : string    read Fcst_pis                  write Fcst_pis;
    property cst_cofins              : string    read Fcst_cofins               write Fcst_cofins;
    property cst_pis_ent             : string    read Fcst_pis_ent              write Fcst_pis_ent;
    property cst_cofins_ent          : string    read Fcst_cofins_ent           write Fcst_cofins_ent;
    property aliq_pis_diferenciada   : Double    read Faliq_pis_diferenciada    write Faliq_pis_diferenciada;
    property aliq_cofins_diferenciada: Double    read Faliq_cofins_diferenciada write Faliq_cofins_diferenciada;
    property calc_st_saida           : string    read Fcalc_st_saida            write Fcalc_st_saida;
    property nat_rec                 : string    read Fnat_rec                  write Fnat_rec;
    property cod_inf                 : Integer   read Fcod_inf                  write Fcod_inf;
    property aliq_cred_pis           : Double    read Faliq_cred_pis            write Faliq_cred_pis;
    property aliq_cred_cofins        : Double    read Faliq_cred_cofins         write Faliq_cred_cofins;
    property aliqnac                 : Double    read Faliqnac                  write Faliqnac;
    property aliqimp                 : Double    read Faliqimp                  write Faliqimp;
    property modbcst                 : Integer   read Fmodbcst                  write Fmodbcst;
    property vlbcst                  : Double    read Fvlbcst                   write Fvlbcst;
    property data_mod_cad            : TDateTime read Fdata_mod_cad             write Fdata_mod_cad;
    property nve                     : string    read Fnve                      write Fnve;
    property cenq_ipi_nfe            : string    read Fcenq_ipi_nfe             write Fcenq_ipi_nfe;
    property cest                    : string    read Fcest                     write Fcest;
    property fcp_aliq                : Double    read Ffcp_aliq                 write Ffcp_aliq;
  end;

  TNbm_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNbm_class;
    procedure SetItem(Index: Integer; const Value: TNbm_class);
  public
    function New: TNbm_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNbm_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TNbm_class }

class function TNbm_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_ncm, @nome_ncm, @usar_mva_ajustado, @referencia, @mva, @mva_inter, @aliq_intra, @cod_nbm, @nome_nbm,' +
            ' @cst_pis, @cst_cofins, @cst_pis_ent, @cst_cofins_ent, @aliq_pis_diferenciada, @aliq_cofins_diferenciada,' +
            ' @calc_st_saida, @nat_rec, @cod_inf, @aliq_cred_pis, @aliq_cred_cofins, @aliqnac, @aliqimp, @modbcst,' +
            ' @vlbcst, @data_mod_cad, @nve, @cenq_ipi_nfe, @cest, @fcp_aliq';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNbm_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_ncm                  := Trim(ADataSet.FieldByName('COD_NCM').AsString);
    Fnome_ncm                 := Trim(ADataSet.FieldByName('NOME_NCM').AsString);
    Fusar_mva_ajustado        := Trim(ADataSet.FieldByName('USAR_MVA_AJUSTADO').AsString);
    Freferencia               := Trim(ADataSet.FieldByName('REFERENCIA').AsString);
    Fmva                      := ADataSet.FieldByName('MVA').AsFloat;
    Fmva_inter                := ADataSet.FieldByName('MVA_INTER').AsFloat;
    Faliq_intra               := ADataSet.FieldByName('ALIQ_INTRA').AsFloat;
    Fcod_nbm                  := Trim(ADataSet.FieldByName('COD_NBM').AsString);
    Fnome_nbm                 := Trim(ADataSet.FieldByName('NOME_NBM').AsString);
    Fcst_pis                  := Trim(ADataSet.FieldByName('CST_PIS').AsString);
    Fcst_cofins               := Trim(ADataSet.FieldByName('CST_COFINS').AsString);
    Fcst_pis_ent              := Trim(ADataSet.FieldByName('CST_PIS_ENT').AsString);
    Fcst_cofins_ent           := Trim(ADataSet.FieldByName('CST_COFINS_ENT').AsString);
    Faliq_pis_diferenciada    := ADataSet.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat;
    Faliq_cofins_diferenciada := ADataSet.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat;
    Fcalc_st_saida            := Trim(ADataSet.FieldByName('CALC_ST_SAIDA').AsString);
    Fnat_rec                  := Trim(ADataSet.FieldByName('NAT_REC').AsString);
    Fcod_inf                  := ADataSet.FieldByName('COD_INF').AsInteger;
    Faliq_cred_pis            := ADataSet.FieldByName('ALIQ_CRED_PIS').AsFloat;
    Faliq_cred_cofins         := ADataSet.FieldByName('ALIQ_CRED_COFINS').AsFloat;
    Faliqnac                  := ADataSet.FieldByName('ALIQNAC').AsFloat;
    Faliqimp                  := ADataSet.FieldByName('ALIQIMP').AsFloat;
    Fmodbcst                  := ADataSet.FieldByName('MODBCST').AsInteger;
    Fvlbcst                   := ADataSet.FieldByName('VLBCST').AsFloat;
    Fdata_mod_cad             := ADataSet.FieldByName('DATA_MOD_CAD').AsDateTime;
    Fnve                      := Trim(ADataSet.FieldByName('NVE').AsString);
    Fcenq_ipi_nfe             := Trim(ADataSet.FieldByName('CENQ_IPI_NFE').AsString);
    Fcest                     := Trim(ADataSet.FieldByName('CEST').AsString);
    Ffcp_aliq                 := ADataSet.FieldByName('FCP_ALIQ').AsFloat;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NCM'                 )) then Fcod_ncm                  := Trim(ADataSet.FieldByName('COD_NCM').AsString);
    if Assigned(ADataSet.FindField('NOME_NCM'                )) then Fnome_ncm                 := Trim(ADataSet.FieldByName('NOME_NCM').AsString);
    if Assigned(ADataSet.FindField('USAR_MVA_AJUSTADO'       )) then Fusar_mva_ajustado        := Trim(ADataSet.FieldByName('USAR_MVA_AJUSTADO').AsString);
    if Assigned(ADataSet.FindField('REFERENCIA'              )) then Freferencia               := Trim(ADataSet.FieldByName('REFERENCIA').AsString);
    if Assigned(ADataSet.FindField('MVA'                     )) then Fmva                      := ADataSet.FieldByName('MVA').AsFloat;
    if Assigned(ADataSet.FindField('MVA_INTER'               )) then Fmva_inter                := ADataSet.FieldByName('MVA_INTER').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_INTRA'              )) then Faliq_intra               := ADataSet.FieldByName('ALIQ_INTRA').AsFloat;
    if Assigned(ADataSet.FindField('COD_NBM'                 )) then Fcod_nbm                  := Trim(ADataSet.FieldByName('COD_NBM').AsString);
    if Assigned(ADataSet.FindField('NOME_NBM'                )) then Fnome_nbm                 := Trim(ADataSet.FieldByName('NOME_NBM').AsString);
    if Assigned(ADataSet.FindField('CST_PIS'                 )) then Fcst_pis                  := Trim(ADataSet.FieldByName('CST_PIS').AsString);
    if Assigned(ADataSet.FindField('CST_COFINS'              )) then Fcst_cofins               := Trim(ADataSet.FieldByName('CST_COFINS').AsString);
    if Assigned(ADataSet.FindField('CST_PIS_ENT'             )) then Fcst_pis_ent              := Trim(ADataSet.FieldByName('CST_PIS_ENT').AsString);
    if Assigned(ADataSet.FindField('CST_COFINS_ENT'          )) then Fcst_cofins_ent           := Trim(ADataSet.FieldByName('CST_COFINS_ENT').AsString);
    if Assigned(ADataSet.FindField('ALIQ_PIS_DIFERENCIADA'   )) then Faliq_pis_diferenciada    := ADataSet.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_COFINS_DIFERENCIADA')) then Faliq_cofins_diferenciada := ADataSet.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat;
    if Assigned(ADataSet.FindField('CALC_ST_SAIDA'           )) then Fcalc_st_saida            := Trim(ADataSet.FieldByName('CALC_ST_SAIDA').AsString);
    if Assigned(ADataSet.FindField('NAT_REC'                 )) then Fnat_rec                  := Trim(ADataSet.FieldByName('NAT_REC').AsString);
    if Assigned(ADataSet.FindField('COD_INF'                 )) then Fcod_inf                  := ADataSet.FieldByName('COD_INF').AsInteger;
    if Assigned(ADataSet.FindField('ALIQ_CRED_PIS'           )) then Faliq_cred_pis            := ADataSet.FieldByName('ALIQ_CRED_PIS').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_CRED_COFINS'        )) then Faliq_cred_cofins         := ADataSet.FieldByName('ALIQ_CRED_COFINS').AsFloat;
    if Assigned(ADataSet.FindField('ALIQNAC'                 )) then Faliqnac                  := ADataSet.FieldByName('ALIQNAC').AsFloat;
    if Assigned(ADataSet.FindField('ALIQIMP'                 )) then Faliqimp                  := ADataSet.FieldByName('ALIQIMP').AsFloat;
    if Assigned(ADataSet.FindField('MODBCST'                 )) then Fmodbcst                  := ADataSet.FieldByName('MODBCST').AsInteger;
    if Assigned(ADataSet.FindField('VLBCST'                  )) then Fvlbcst                   := ADataSet.FieldByName('VLBCST').AsFloat;
    if Assigned(ADataSet.FindField('DATA_MOD_CAD'            )) then Fdata_mod_cad             := ADataSet.FieldByName('DATA_MOD_CAD').AsDateTime;
    if Assigned(ADataSet.FindField('NVE'                     )) then Fnve                      := Trim(ADataSet.FieldByName('NVE').AsString);
    if Assigned(ADataSet.FindField('CENQ_IPI_NFE'            )) then Fcenq_ipi_nfe             := Trim(ADataSet.FieldByName('CENQ_IPI_NFE').AsString);
    if Assigned(ADataSet.FindField('CEST'                    )) then Fcest                     := Trim(ADataSet.FieldByName('CEST').AsString);
    if Assigned(ADataSet.FindField('FCP_ALIQ'                )) then Ffcp_aliq                 := ADataSet.FieldByName('FCP_ALIQ').AsFloat;
  end;
end;

{ TNbm_classList }

function TNbm_classList.GetItem(Index: Integer): TNbm_class;
begin
  Result := TNbm_class(inherited Items[Index]);
end;

function TNbm_classList.New: TNbm_class;
begin
  Result := TNbm_class.Create;
  Add(Result);
end;

procedure TNbm_classList.SetItem(Index: Integer; const Value: TNbm_class);
begin
  Put(Index, Value);
end;
procedure TNbm_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
