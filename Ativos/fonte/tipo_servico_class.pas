unit tipo_servico_class;

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
  TTipo_servico_class = class(TObject)
  private
    Fcod_servico                 : Integer;
    Fdesc_servico                : string;
    Fvalor_servico               : Double;
    Fshonda                      : string;
    Faltcod                      : string;
    Fdata_cad_tipo               : TDateTime;
    Fdata_mod_tipo               : TDateTime;
    Fstipo                       : string;
    Ftmo                         : Double;
    Faliq_iss                    : Double;
    Fativo                       : Integer;
    Fcod_espe_seg                : Integer;
    Fcodigo_nop                  : Double;
    Ftmoservsimult               : string;
    Falt_desc                    : string;
    Fserv_prop_terc              : string;
    Fisento_serv                 : string;
    Fn_incidencia_serv           : string;
    Farredondar_truncar          : string;
    Fclasse_serv                 : string;
    Fclasse_qtd                  : string;
    Fclasse_pop                  : string;
    Fclasse_atl                  : string;
    Fdmd                         : Double;
    Fcod_serv_leicomplementar_166: string;
    Fisento_pis                  : string;
    Fcodigo_tributacao           : string;
    Funidade                     : string;
    Fnfs_servico                 : string;
    Fcnae_serv                   : Integer;
    Fiss_retido                  : Integer;
    Fcst_pis                     : string;
    Fcst_cofins                  : string;
    Fmd5                         : string;
    Firrf_servico                : Double;
    Fvl_teto_irrf                : Double;
    Fcst_pis_ent                 : string;
    Fcst_cofins_ent              : string;
    Fnat_rec                     : string;
    Fseq_revisao                 : Integer;
    Fctiss                       : string;
    Fcod_empresa                 : Integer;
    Fcsdecvlunt                  : string;
    Fsit_trib                    : string;
    Fctribnac                    : string;
    Fctribmun                    : string;
    Fcnbs                        : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TTipo_servico_class; virtual;

    property cod_servico                 : Integer   read Fcod_servico                  write Fcod_servico;
    property desc_servico                : string    read Fdesc_servico                 write Fdesc_servico;
    property valor_servico               : Double    read Fvalor_servico                write Fvalor_servico;
    property shonda                      : string    read Fshonda                       write Fshonda;
    property altcod                      : string    read Faltcod                       write Faltcod;
    property data_cad_tipo               : TDateTime read Fdata_cad_tipo                write Fdata_cad_tipo;
    property data_mod_tipo               : TDateTime read Fdata_mod_tipo                write Fdata_mod_tipo;
    property stipo                       : string    read Fstipo                        write Fstipo;
    property tmo                         : Double    read Ftmo                          write Ftmo;
    property aliq_iss                    : Double    read Faliq_iss                     write Faliq_iss;
    property ativo                       : Integer   read Fativo                        write Fativo;
    property cod_espe_seg                : Integer   read Fcod_espe_seg                 write Fcod_espe_seg;
    property codigo_nop                  : Double    read Fcodigo_nop                   write Fcodigo_nop;
    property tmoservsimult               : string    read Ftmoservsimult                write Ftmoservsimult;
    property alt_desc                    : string    read Falt_desc                     write Falt_desc;
    property serv_prop_terc              : string    read Fserv_prop_terc               write Fserv_prop_terc;
    property isento_serv                 : string    read Fisento_serv                  write Fisento_serv;
    property n_incidencia_serv           : string    read Fn_incidencia_serv            write Fn_incidencia_serv;
    property arredondar_truncar          : string    read Farredondar_truncar           write Farredondar_truncar;
    property classe_serv                 : string    read Fclasse_serv                  write Fclasse_serv;
    property classe_qtd                  : string    read Fclasse_qtd                   write Fclasse_qtd;
    property classe_pop                  : string    read Fclasse_pop                   write Fclasse_pop;
    property classe_atl                  : string    read Fclasse_atl                   write Fclasse_atl;
    property dmd                         : Double    read Fdmd                          write Fdmd;
    property cod_serv_leicomplementar_166: string    read Fcod_serv_leicomplementar_166 write Fcod_serv_leicomplementar_166;
    property isento_pis                  : string    read Fisento_pis                   write Fisento_pis;
    property codigo_tributacao           : string    read Fcodigo_tributacao            write Fcodigo_tributacao;
    property unidade                     : string    read Funidade                      write Funidade;
    property nfs_servico                 : string    read Fnfs_servico                  write Fnfs_servico;
    property cnae_serv                   : Integer   read Fcnae_serv                    write Fcnae_serv;
    property iss_retido                  : Integer   read Fiss_retido                   write Fiss_retido;
    property cst_pis                     : string    read Fcst_pis                      write Fcst_pis;
    property cst_cofins                  : string    read Fcst_cofins                   write Fcst_cofins;
    property md5                         : string    read Fmd5                          write Fmd5;
    property irrf_servico                : Double    read Firrf_servico                 write Firrf_servico;
    property vl_teto_irrf                : Double    read Fvl_teto_irrf                 write Fvl_teto_irrf;
    property cst_pis_ent                 : string    read Fcst_pis_ent                  write Fcst_pis_ent;
    property cst_cofins_ent              : string    read Fcst_cofins_ent               write Fcst_cofins_ent;
    property nat_rec                     : string    read Fnat_rec                      write Fnat_rec;
    property seq_revisao                 : Integer   read Fseq_revisao                  write Fseq_revisao;
    property ctiss                       : string    read Fctiss                        write Fctiss;
    property cod_empresa                 : Integer   read Fcod_empresa                  write Fcod_empresa;
    property csdecvlunt                  : string    read Fcsdecvlunt                   write Fcsdecvlunt;
    property sit_trib                    : string    read Fsit_trib                     write Fsit_trib;
    property ctribnac                    : string    read Fctribnac                     write Fctribnac;
    property ctribmun                    : string    read Fctribmun                     write Fctribmun;
    property cnbs                        : string    read Fcnbs                         write Fcnbs;
  end;

  TTipo_servico_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TTipo_servico_class;
    procedure SetItem(Index: Integer; const Value: TTipo_servico_class);
  public
    function New: TTipo_servico_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TTipo_servico_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TTipo_servico_class }

constructor TTipo_servico_class.Create;
begin
  Fativo := 1;
end;

destructor TTipo_servico_class.Destroy;
begin
  inherited;
end;

function TTipo_servico_class.Clone: TTipo_servico_class;
begin
  Result                              := TTipo_servico_class.Create;
  Result.cod_servico                  := Self.cod_servico;
  Result.desc_servico                 := Self.desc_servico;
  Result.valor_servico                := Self.valor_servico;
  Result.shonda                       := Self.shonda;
  Result.altcod                       := Self.altcod;
  Result.data_cad_tipo                := Self.data_cad_tipo;
  Result.data_mod_tipo                := Self.data_mod_tipo;
  Result.stipo                        := Self.stipo;
  Result.tmo                          := Self.tmo;
  Result.aliq_iss                     := Self.aliq_iss;
  Result.ativo                        := Self.ativo;
  Result.cod_espe_seg                 := Self.cod_espe_seg;
  Result.codigo_nop                   := Self.codigo_nop;
  Result.tmoservsimult                := Self.tmoservsimult;
  Result.alt_desc                     := Self.alt_desc;
  Result.serv_prop_terc               := Self.serv_prop_terc;
  Result.isento_serv                  := Self.isento_serv;
  Result.n_incidencia_serv            := Self.n_incidencia_serv;
  Result.arredondar_truncar           := Self.arredondar_truncar;
  Result.classe_serv                  := Self.classe_serv;
  Result.classe_qtd                   := Self.classe_qtd;
  Result.classe_pop                   := Self.classe_pop;
  Result.classe_atl                   := Self.classe_atl;
  Result.dmd                          := Self.dmd;
  Result.cod_serv_leicomplementar_166 := Self.cod_serv_leicomplementar_166;
  Result.isento_pis                   := Self.isento_pis;
  Result.codigo_tributacao            := Self.codigo_tributacao;
  Result.unidade                      := Self.unidade;
  Result.nfs_servico                  := Self.nfs_servico;
  Result.cnae_serv                    := Self.cnae_serv;
  Result.iss_retido                   := Self.iss_retido;
  Result.cst_pis                      := Self.cst_pis;
  Result.cst_cofins                   := Self.cst_cofins;
  Result.md5                          := Self.md5;
  Result.irrf_servico                 := Self.irrf_servico;
  Result.vl_teto_irrf                 := Self.vl_teto_irrf;
  Result.cst_pis_ent                  := Self.cst_pis_ent;
  Result.cst_cofins_ent               := Self.cst_cofins_ent;
  Result.nat_rec                      := Self.nat_rec;
  Result.seq_revisao                  := Self.seq_revisao;
  Result.ctiss                        := Self.ctiss;
  Result.cod_empresa                  := Self.cod_empresa;
  Result.csdecvlunt                   := Self.csdecvlunt;
  Result.sit_trib                     := Self.sit_trib;
  Result.ctribnac                     := Self.ctribnac;
  Result.ctribmun                     := Self.ctribmun;
  Result.cnbs                         := Self.cnbs;
end;

class function TTipo_servico_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_servico, @desc_servico, @valor_servico, @shonda, @altcod, @data_cad_tipo, @data_mod_tipo, @stipo, @tmo,' +
            ' @aliq_iss, @ativo, @cod_espe_seg, @codigo_nop, @tmoservsimult, @alt_desc, @serv_prop_terc, @isento_serv,' +
            ' @n_incidencia_serv, @arredondar_truncar, @classe_serv, @classe_qtd, @classe_pop, @classe_atl, @dmd,' +
            ' @cod_serv_leicomplementar_166, @isento_pis, @codigo_tributacao, @unidade, @nfs_servico, @cnae_serv,' +
            ' @iss_retido, @cst_pis, @cst_cofins, @md5, @irrf_servico, @vl_teto_irrf, @cst_pis_ent, @cst_cofins_ent,' +
            ' @nat_rec, @seq_revisao, @ctiss, @cod_empresa, @csdecvlunt, @sit_trib, @ctribnac, @ctribmun, @cnbs';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TTipo_servico_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_servico                  := ADataSet.FieldByName('COD_SERVICO').AsInteger;
    Fdesc_servico                 := Trim(ADataSet.FieldByName('DESC_SERVICO').AsString);
    Fvalor_servico                := ADataSet.FieldByName('VALOR_SERVICO').AsFloat;
    Fshonda                       := Trim(ADataSet.FieldByName('SHONDA').AsString);
    Faltcod                       := Trim(ADataSet.FieldByName('ALTCOD').AsString);
    Fdata_cad_tipo                := ADataSet.FieldByName('DATA_CAD_TIPO').AsDateTime;
    Fdata_mod_tipo                := ADataSet.FieldByName('DATA_MOD_TIPO').AsDateTime;
    Fstipo                        := Trim(ADataSet.FieldByName('STIPO').AsString);
    Ftmo                          := ADataSet.FieldByName('TMO').AsFloat;
    Faliq_iss                     := ADataSet.FieldByName('ALIQ_ISS').AsFloat;
    Fativo                        := ADataSet.FieldByName('ATIVO').AsInteger;
    Fcod_espe_seg                 := ADataSet.FieldByName('COD_ESPE_SEG').AsInteger;
    Fcodigo_nop                   := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    Ftmoservsimult                := Trim(ADataSet.FieldByName('TMOSERVSIMULT').AsString);
    Falt_desc                     := Trim(ADataSet.FieldByName('ALT_DESC').AsString);
    Fserv_prop_terc               := Trim(ADataSet.FieldByName('SERV_PROP_TERC').AsString);
    Fisento_serv                  := Trim(ADataSet.FieldByName('ISENTO_SERV').AsString);
    Fn_incidencia_serv            := Trim(ADataSet.FieldByName('N_INCIDENCIA_SERV').AsString);
    Farredondar_truncar           := Trim(ADataSet.FieldByName('ARREDONDAR_TRUNCAR').AsString);
    Fclasse_serv                  := Trim(ADataSet.FieldByName('CLASSE_SERV').AsString);
    Fclasse_qtd                   := Trim(ADataSet.FieldByName('CLASSE_QTD').AsString);
    Fclasse_pop                   := Trim(ADataSet.FieldByName('CLASSE_POP').AsString);
    Fclasse_atl                   := Trim(ADataSet.FieldByName('CLASSE_ATL').AsString);
    Fdmd                          := ADataSet.FieldByName('DMD').AsFloat;
    Fcod_serv_leicomplementar_166 := Trim(ADataSet.FieldByName('COD_SERV_LEICOMPLEMENTAR_166').AsString);
    Fisento_pis                   := Trim(ADataSet.FieldByName('ISENTO_PIS').AsString);
    Fcodigo_tributacao            := Trim(ADataSet.FieldByName('CODIGO_TRIBUTACAO').AsString);
    Funidade                      := Trim(ADataSet.FieldByName('UNIDADE').AsString);
    Fnfs_servico                  := Trim(ADataSet.FieldByName('NFS_SERVICO').AsString);
    Fcnae_serv                    := ADataSet.FieldByName('CNAE_SERV').AsInteger;
    Fiss_retido                   := ADataSet.FieldByName('ISS_RETIDO').AsInteger;
    Fcst_pis                      := Trim(ADataSet.FieldByName('CST_PIS').AsString);
    Fcst_cofins                   := Trim(ADataSet.FieldByName('CST_COFINS').AsString);
    Fmd5                          := Trim(ADataSet.FieldByName('MD5').AsString);
    Firrf_servico                 := ADataSet.FieldByName('IRRF_SERVICO').AsFloat;
    Fvl_teto_irrf                 := ADataSet.FieldByName('VL_TETO_IRRF').AsFloat;
    Fcst_pis_ent                  := Trim(ADataSet.FieldByName('CST_PIS_ENT').AsString);
    Fcst_cofins_ent               := Trim(ADataSet.FieldByName('CST_COFINS_ENT').AsString);
    Fnat_rec                      := Trim(ADataSet.FieldByName('NAT_REC').AsString);
    Fseq_revisao                  := ADataSet.FieldByName('SEQ_REVISAO').AsInteger;
    Fctiss                        := Trim(ADataSet.FieldByName('CTISS').AsString);
    Fcod_empresa                  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcsdecvlunt                   := Trim(ADataSet.FieldByName('CSDECVLUNT').AsString);
    Fsit_trib                     := Trim(ADataSet.FieldByName('SIT_TRIB').AsString);
    Fctribnac                     := Trim(ADataSet.FieldByName('CTRIBNAC').AsString);
    Fctribmun                     := Trim(ADataSet.FieldByName('CTRIBMUN').AsString);
    Fcnbs                         := Trim(ADataSet.FieldByName('CNBS').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_SERVICO'                 )) then Fcod_servico                  := ADataSet.FieldByName('COD_SERVICO').AsInteger;
    if Assigned(ADataSet.FindField('DESC_SERVICO'                )) then Fdesc_servico                 := Trim(ADataSet.FieldByName('DESC_SERVICO').AsString);
    if Assigned(ADataSet.FindField('VALOR_SERVICO'               )) then Fvalor_servico                := ADataSet.FieldByName('VALOR_SERVICO').AsFloat;
    if Assigned(ADataSet.FindField('SHONDA'                      )) then Fshonda                       := Trim(ADataSet.FieldByName('SHONDA').AsString);
    if Assigned(ADataSet.FindField('ALTCOD'                      )) then Faltcod                       := Trim(ADataSet.FieldByName('ALTCOD').AsString);
    if Assigned(ADataSet.FindField('DATA_CAD_TIPO'               )) then Fdata_cad_tipo                := ADataSet.FieldByName('DATA_CAD_TIPO').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_MOD_TIPO'               )) then Fdata_mod_tipo                := ADataSet.FieldByName('DATA_MOD_TIPO').AsDateTime;
    if Assigned(ADataSet.FindField('STIPO'                       )) then Fstipo                        := Trim(ADataSet.FieldByName('STIPO').AsString);
    if Assigned(ADataSet.FindField('TMO'                         )) then Ftmo                          := ADataSet.FieldByName('TMO').AsFloat;
    if Assigned(ADataSet.FindField('ALIQ_ISS'                    )) then Faliq_iss                     := ADataSet.FieldByName('ALIQ_ISS').AsFloat;
    if Assigned(ADataSet.FindField('ATIVO'                       )) then Fativo                        := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('COD_ESPE_SEG'                )) then Fcod_espe_seg                 := ADataSet.FieldByName('COD_ESPE_SEG').AsInteger;
    if Assigned(ADataSet.FindField('CODIGO_NOP'                  )) then Fcodigo_nop                   := ADataSet.FieldByName('CODIGO_NOP').AsFloat;
    if Assigned(ADataSet.FindField('TMOSERVSIMULT'               )) then Ftmoservsimult                := Trim(ADataSet.FieldByName('TMOSERVSIMULT').AsString);
    if Assigned(ADataSet.FindField('ALT_DESC'                    )) then Falt_desc                     := Trim(ADataSet.FieldByName('ALT_DESC').AsString);
    if Assigned(ADataSet.FindField('SERV_PROP_TERC'              )) then Fserv_prop_terc               := Trim(ADataSet.FieldByName('SERV_PROP_TERC').AsString);
    if Assigned(ADataSet.FindField('ISENTO_SERV'                 )) then Fisento_serv                  := Trim(ADataSet.FieldByName('ISENTO_SERV').AsString);
    if Assigned(ADataSet.FindField('N_INCIDENCIA_SERV'           )) then Fn_incidencia_serv            := Trim(ADataSet.FieldByName('N_INCIDENCIA_SERV').AsString);
    if Assigned(ADataSet.FindField('ARREDONDAR_TRUNCAR'          )) then Farredondar_truncar           := Trim(ADataSet.FieldByName('ARREDONDAR_TRUNCAR').AsString);
    if Assigned(ADataSet.FindField('CLASSE_SERV'                 )) then Fclasse_serv                  := Trim(ADataSet.FieldByName('CLASSE_SERV').AsString);
    if Assigned(ADataSet.FindField('CLASSE_QTD'                  )) then Fclasse_qtd                   := Trim(ADataSet.FieldByName('CLASSE_QTD').AsString);
    if Assigned(ADataSet.FindField('CLASSE_POP'                  )) then Fclasse_pop                   := Trim(ADataSet.FieldByName('CLASSE_POP').AsString);
    if Assigned(ADataSet.FindField('CLASSE_ATL'                  )) then Fclasse_atl                   := Trim(ADataSet.FieldByName('CLASSE_ATL').AsString);
    if Assigned(ADataSet.FindField('DMD'                         )) then Fdmd                          := ADataSet.FieldByName('DMD').AsFloat;
    if Assigned(ADataSet.FindField('COD_SERV_LEICOMPLEMENTAR_166')) then Fcod_serv_leicomplementar_166 := Trim(ADataSet.FieldByName('COD_SERV_LEICOMPLEMENTAR_166').AsString);
    if Assigned(ADataSet.FindField('ISENTO_PIS'                  )) then Fisento_pis                   := Trim(ADataSet.FieldByName('ISENTO_PIS').AsString);
    if Assigned(ADataSet.FindField('CODIGO_TRIBUTACAO'           )) then Fcodigo_tributacao            := Trim(ADataSet.FieldByName('CODIGO_TRIBUTACAO').AsString);
    if Assigned(ADataSet.FindField('UNIDADE'                     )) then Funidade                      := Trim(ADataSet.FieldByName('UNIDADE').AsString);
    if Assigned(ADataSet.FindField('NFS_SERVICO'                 )) then Fnfs_servico                  := Trim(ADataSet.FieldByName('NFS_SERVICO').AsString);
    if Assigned(ADataSet.FindField('CNAE_SERV'                   )) then Fcnae_serv                    := ADataSet.FieldByName('CNAE_SERV').AsInteger;
    if Assigned(ADataSet.FindField('ISS_RETIDO'                  )) then Fiss_retido                   := ADataSet.FieldByName('ISS_RETIDO').AsInteger;
    if Assigned(ADataSet.FindField('CST_PIS'                     )) then Fcst_pis                      := Trim(ADataSet.FieldByName('CST_PIS').AsString);
    if Assigned(ADataSet.FindField('CST_COFINS'                  )) then Fcst_cofins                   := Trim(ADataSet.FieldByName('CST_COFINS').AsString);
    if Assigned(ADataSet.FindField('MD5'                         )) then Fmd5                          := Trim(ADataSet.FieldByName('MD5').AsString);
    if Assigned(ADataSet.FindField('IRRF_SERVICO'                )) then Firrf_servico                 := ADataSet.FieldByName('IRRF_SERVICO').AsFloat;
    if Assigned(ADataSet.FindField('VL_TETO_IRRF'                )) then Fvl_teto_irrf                 := ADataSet.FieldByName('VL_TETO_IRRF').AsFloat;
    if Assigned(ADataSet.FindField('CST_PIS_ENT'                 )) then Fcst_pis_ent                  := Trim(ADataSet.FieldByName('CST_PIS_ENT').AsString);
    if Assigned(ADataSet.FindField('CST_COFINS_ENT'              )) then Fcst_cofins_ent               := Trim(ADataSet.FieldByName('CST_COFINS_ENT').AsString);
    if Assigned(ADataSet.FindField('NAT_REC'                     )) then Fnat_rec                      := Trim(ADataSet.FieldByName('NAT_REC').AsString);
    if Assigned(ADataSet.FindField('SEQ_REVISAO'                 )) then Fseq_revisao                  := ADataSet.FieldByName('SEQ_REVISAO').AsInteger;
    if Assigned(ADataSet.FindField('CTISS'                       )) then Fctiss                        := Trim(ADataSet.FieldByName('CTISS').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA'                 )) then Fcod_empresa                  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('CSDECVLUNT'                  )) then Fcsdecvlunt                   := Trim(ADataSet.FieldByName('CSDECVLUNT').AsString);
    if Assigned(ADataSet.FindField('SIT_TRIB'                    )) then Fsit_trib                     := Trim(ADataSet.FieldByName('SIT_TRIB').AsString);
    if Assigned(ADataSet.FindField('CTRIBNAC'                    )) then Fctribnac                     := Trim(ADataSet.FieldByName('CTRIBNAC').AsString);
    if Assigned(ADataSet.FindField('CTRIBMUN'                    )) then Fctribmun                     := Trim(ADataSet.FieldByName('CTRIBMUN').AsString);
    if Assigned(ADataSet.FindField('CNBS'                        )) then Fcnbs                         := Trim(ADataSet.FieldByName('CNBS').AsString);
  end;
end;

function TTipo_servico_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_SERVICO').AsInteger                 := Fcod_servico;
    ADataSet.ParamByName('DESC_SERVICO').AsString                 := Copy(Fdesc_servico                , 1, 60);
    ADataSet.ParamByName('VALOR_SERVICO').AsFloat                 := Fvalor_servico;
    ADataSet.ParamByName('SHONDA').AsString                       := Copy(Fshonda                      , 1, 1);
    ADataSet.ParamByName('ALTCOD').AsString                       := Copy(Faltcod                      , 1, 1);
    ADataSet.ParamByName('DATA_CAD_TIPO').AsDateTime              := Fdata_cad_tipo;
    ADataSet.ParamByName('DATA_MOD_TIPO').AsDateTime              := Fdata_mod_tipo;
    ADataSet.ParamByName('STIPO').AsString                        := Copy(Fstipo                       , 1, 1);
    ADataSet.ParamByName('TMO').AsFloat                           := Ftmo;
    ADataSet.ParamByName('ALIQ_ISS').AsFloat                      := Faliq_iss;
    ADataSet.ParamByName('ATIVO').AsInteger                       := Fativo;
    ADataSet.ParamByName('COD_ESPE_SEG').AsInteger                := Fcod_espe_seg;
    ADataSet.ParamByName('CODIGO_NOP').AsFloat                    := Fcodigo_nop;
    ADataSet.ParamByName('TMOSERVSIMULT').AsString                := Copy(Ftmoservsimult               , 1, 1);
    ADataSet.ParamByName('ALT_DESC').AsString                     := Copy(Falt_desc                    , 1, 1);
    ADataSet.ParamByName('SERV_PROP_TERC').AsString               := Copy(Fserv_prop_terc              , 1, 1);
    ADataSet.ParamByName('ISENTO_SERV').AsString                  := Copy(Fisento_serv                 , 1, 1);
    ADataSet.ParamByName('N_INCIDENCIA_SERV').AsString            := Copy(Fn_incidencia_serv           , 1, 1);
    ADataSet.ParamByName('ARREDONDAR_TRUNCAR').AsString           := Copy(Farredondar_truncar          , 1, 1);
    ADataSet.ParamByName('CLASSE_SERV').AsString                  := Copy(Fclasse_serv                 , 1, 1);
    ADataSet.ParamByName('CLASSE_QTD').AsString                   := Copy(Fclasse_qtd                  , 1, 2);
    ADataSet.ParamByName('CLASSE_POP').AsString                   := Copy(Fclasse_pop                  , 1, 2);
    ADataSet.ParamByName('CLASSE_ATL').AsString                   := Copy(Fclasse_atl                  , 1, 2);
    ADataSet.ParamByName('DMD').AsFloat                           := Fdmd;
    ADataSet.ParamByName('COD_SERV_LEICOMPLEMENTAR_166').AsString := Copy(Fcod_serv_leicomplementar_166, 1, 4);
    ADataSet.ParamByName('ISENTO_PIS').AsString                   := Copy(Fisento_pis                  , 1, 1);
    ADataSet.ParamByName('CODIGO_TRIBUTACAO').AsString            := Copy(Fcodigo_tributacao           , 1, 1);
    ADataSet.ParamByName('UNIDADE').AsString                      := Copy(Funidade                     , 1, 3);
    ADataSet.ParamByName('NFS_SERVICO').AsString                  := Copy(Fnfs_servico                 , 1, 5);
    ADataSet.ParamByName('CNAE_SERV').AsInteger                   := Fcnae_serv;
    ADataSet.ParamByName('ISS_RETIDO').AsInteger                  := Fiss_retido;
    ADataSet.ParamByName('CST_PIS').AsString                      := Copy(Fcst_pis                     , 1, 2);
    ADataSet.ParamByName('CST_COFINS').AsString                   := Copy(Fcst_cofins                  , 1, 2);
    ADataSet.ParamByName('MD5').AsString                          := Copy(Fmd5                         , 1, 256);
    ADataSet.ParamByName('IRRF_SERVICO').AsFloat                  := Firrf_servico;
    ADataSet.ParamByName('VL_TETO_IRRF').AsFloat                  := Fvl_teto_irrf;
    ADataSet.ParamByName('CST_PIS_ENT').AsString                  := Copy(Fcst_pis_ent                 , 1, 2);
    ADataSet.ParamByName('CST_COFINS_ENT').AsString               := Copy(Fcst_cofins_ent              , 1, 2);
    ADataSet.ParamByName('NAT_REC').AsString                      := Copy(Fnat_rec                     , 1, 3);
    ADataSet.ParamByName('SEQ_REVISAO').AsInteger                 := Fseq_revisao;
    ADataSet.ParamByName('CTISS').AsString                        := Copy(Fctiss                       , 1, 9);
    ADataSet.ParamByName('COD_EMPRESA').AsInteger                 := Fcod_empresa;
    ADataSet.ParamByName('CSDECVLUNT').AsString                   := Copy(Fcsdecvlunt                  , 1, 1);
    ADataSet.ParamByName('SIT_TRIB').AsString                     := Copy(Fsit_trib                    , 1, 1);
    ADataSet.ParamByName('CTRIBNAC').AsString                     := Copy(Fctribnac                    , 1, 6);
    ADataSet.ParamByName('CTRIBMUN').AsString                     := Copy(Fctribmun                    , 1, 3);
    ADataSet.ParamByName('CNBS').AsString                         := Copy(Fcnbs                        , 1, 9);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_SERVICO'                 )) then   ADataSet.ParamByName('COD_SERVICO').AsInteger                 := Fcod_servico;
    if Assigned(ADataSet.Params.FindParam('DESC_SERVICO'                )) then   ADataSet.ParamByName('DESC_SERVICO').AsString                 := Copy(Fdesc_servico                , 1, 60);
    if Assigned(ADataSet.Params.FindParam('VALOR_SERVICO'               )) then   ADataSet.ParamByName('VALOR_SERVICO').AsFloat                 := Fvalor_servico;
    if Assigned(ADataSet.Params.FindParam('SHONDA'                      )) then   ADataSet.ParamByName('SHONDA').AsString                       := Copy(Fshonda                      , 1, 1);
    if Assigned(ADataSet.Params.FindParam('ALTCOD'                      )) then   ADataSet.ParamByName('ALTCOD').AsString                       := Copy(Faltcod                      , 1, 1);
    if Assigned(ADataSet.Params.FindParam('DATA_CAD_TIPO'               )) then   ADataSet.ParamByName('DATA_CAD_TIPO').AsDateTime              := Fdata_cad_tipo;
    if Assigned(ADataSet.Params.FindParam('DATA_MOD_TIPO'               )) then   ADataSet.ParamByName('DATA_MOD_TIPO').AsDateTime              := Fdata_mod_tipo;
    if Assigned(ADataSet.Params.FindParam('STIPO'                       )) then   ADataSet.ParamByName('STIPO').AsString                        := Copy(Fstipo                       , 1, 1);
    if Assigned(ADataSet.Params.FindParam('TMO'                         )) then   ADataSet.ParamByName('TMO').AsFloat                           := Ftmo;
    if Assigned(ADataSet.Params.FindParam('ALIQ_ISS'                    )) then   ADataSet.ParamByName('ALIQ_ISS').AsFloat                      := Faliq_iss;
    if Assigned(ADataSet.Params.FindParam('ATIVO'                       )) then   ADataSet.ParamByName('ATIVO').AsInteger                       := Fativo;
    if Assigned(ADataSet.Params.FindParam('COD_ESPE_SEG'                )) then   ADataSet.ParamByName('COD_ESPE_SEG').AsInteger                := Fcod_espe_seg;
    if Assigned(ADataSet.Params.FindParam('CODIGO_NOP'                  )) then   ADataSet.ParamByName('CODIGO_NOP').AsFloat                    := Fcodigo_nop;
    if Assigned(ADataSet.Params.FindParam('TMOSERVSIMULT'               )) then   ADataSet.ParamByName('TMOSERVSIMULT').AsString                := Copy(Ftmoservsimult               , 1, 1);
    if Assigned(ADataSet.Params.FindParam('ALT_DESC'                    )) then   ADataSet.ParamByName('ALT_DESC').AsString                     := Copy(Falt_desc                    , 1, 1);
    if Assigned(ADataSet.Params.FindParam('SERV_PROP_TERC'              )) then   ADataSet.ParamByName('SERV_PROP_TERC').AsString               := Copy(Fserv_prop_terc              , 1, 1);
    if Assigned(ADataSet.Params.FindParam('ISENTO_SERV'                 )) then   ADataSet.ParamByName('ISENTO_SERV').AsString                  := Copy(Fisento_serv                 , 1, 1);
    if Assigned(ADataSet.Params.FindParam('N_INCIDENCIA_SERV'           )) then   ADataSet.ParamByName('N_INCIDENCIA_SERV').AsString            := Copy(Fn_incidencia_serv           , 1, 1);
    if Assigned(ADataSet.Params.FindParam('ARREDONDAR_TRUNCAR'          )) then   ADataSet.ParamByName('ARREDONDAR_TRUNCAR').AsString           := Copy(Farredondar_truncar          , 1, 1);
    if Assigned(ADataSet.Params.FindParam('CLASSE_SERV'                 )) then   ADataSet.ParamByName('CLASSE_SERV').AsString                  := Copy(Fclasse_serv                 , 1, 1);
    if Assigned(ADataSet.Params.FindParam('CLASSE_QTD'                  )) then   ADataSet.ParamByName('CLASSE_QTD').AsString                   := Copy(Fclasse_qtd                  , 1, 2);
    if Assigned(ADataSet.Params.FindParam('CLASSE_POP'                  )) then   ADataSet.ParamByName('CLASSE_POP').AsString                   := Copy(Fclasse_pop                  , 1, 2);
    if Assigned(ADataSet.Params.FindParam('CLASSE_ATL'                  )) then   ADataSet.ParamByName('CLASSE_ATL').AsString                   := Copy(Fclasse_atl                  , 1, 2);
    if Assigned(ADataSet.Params.FindParam('DMD'                         )) then   ADataSet.ParamByName('DMD').AsFloat                           := Fdmd;
    if Assigned(ADataSet.Params.FindParam('COD_SERV_LEICOMPLEMENTAR_166')) then   ADataSet.ParamByName('COD_SERV_LEICOMPLEMENTAR_166').AsString := Copy(Fcod_serv_leicomplementar_166, 1, 4);
    if Assigned(ADataSet.Params.FindParam('ISENTO_PIS'                  )) then   ADataSet.ParamByName('ISENTO_PIS').AsString                   := Copy(Fisento_pis                  , 1, 1);
    if Assigned(ADataSet.Params.FindParam('CODIGO_TRIBUTACAO'           )) then   ADataSet.ParamByName('CODIGO_TRIBUTACAO').AsString            := Copy(Fcodigo_tributacao           , 1, 1);
    if Assigned(ADataSet.Params.FindParam('UNIDADE'                     )) then   ADataSet.ParamByName('UNIDADE').AsString                      := Copy(Funidade                     , 1, 3);
    if Assigned(ADataSet.Params.FindParam('NFS_SERVICO'                 )) then   ADataSet.ParamByName('NFS_SERVICO').AsString                  := Copy(Fnfs_servico                 , 1, 5);
    if Assigned(ADataSet.Params.FindParam('CNAE_SERV'                   )) then   ADataSet.ParamByName('CNAE_SERV').AsInteger                   := Fcnae_serv;
    if Assigned(ADataSet.Params.FindParam('ISS_RETIDO'                  )) then   ADataSet.ParamByName('ISS_RETIDO').AsInteger                  := Fiss_retido;
    if Assigned(ADataSet.Params.FindParam('CST_PIS'                     )) then   ADataSet.ParamByName('CST_PIS').AsString                      := Copy(Fcst_pis                     , 1, 2);
    if Assigned(ADataSet.Params.FindParam('CST_COFINS'                  )) then   ADataSet.ParamByName('CST_COFINS').AsString                   := Copy(Fcst_cofins                  , 1, 2);
    if Assigned(ADataSet.Params.FindParam('MD5'                         )) then   ADataSet.ParamByName('MD5').AsString                          := Copy(Fmd5                         , 1, 256);
    if Assigned(ADataSet.Params.FindParam('IRRF_SERVICO'                )) then   ADataSet.ParamByName('IRRF_SERVICO').AsFloat                  := Firrf_servico;
    if Assigned(ADataSet.Params.FindParam('VL_TETO_IRRF'                )) then   ADataSet.ParamByName('VL_TETO_IRRF').AsFloat                  := Fvl_teto_irrf;
    if Assigned(ADataSet.Params.FindParam('CST_PIS_ENT'                 )) then   ADataSet.ParamByName('CST_PIS_ENT').AsString                  := Copy(Fcst_pis_ent                 , 1, 2);
    if Assigned(ADataSet.Params.FindParam('CST_COFINS_ENT'              )) then   ADataSet.ParamByName('CST_COFINS_ENT').AsString               := Copy(Fcst_cofins_ent              , 1, 2);
    if Assigned(ADataSet.Params.FindParam('NAT_REC'                     )) then   ADataSet.ParamByName('NAT_REC').AsString                      := Copy(Fnat_rec                     , 1, 3);
    if Assigned(ADataSet.Params.FindParam('SEQ_REVISAO'                 )) then   ADataSet.ParamByName('SEQ_REVISAO').AsInteger                 := Fseq_revisao;
    if Assigned(ADataSet.Params.FindParam('CTISS'                       )) then   ADataSet.ParamByName('CTISS').AsString                        := Copy(Fctiss                       , 1, 9);
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'                 )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger                 := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('CSDECVLUNT'                  )) then   ADataSet.ParamByName('CSDECVLUNT').AsString                   := Copy(Fcsdecvlunt                  , 1, 1);
    if Assigned(ADataSet.Params.FindParam('SIT_TRIB'                    )) then   ADataSet.ParamByName('SIT_TRIB').AsString                     := Copy(Fsit_trib                    , 1, 1);
    if Assigned(ADataSet.Params.FindParam('CTRIBNAC'                    )) then   ADataSet.ParamByName('CTRIBNAC').AsString                     := Copy(Fctribnac                    , 1, 6);
    if Assigned(ADataSet.Params.FindParam('CTRIBMUN'                    )) then   ADataSet.ParamByName('CTRIBMUN').AsString                     := Copy(Fctribmun                    , 1, 3);
    if Assigned(ADataSet.Params.FindParam('CNBS'                        )) then   ADataSet.ParamByName('CNBS').AsString                         := Copy(Fcnbs                        , 1, 9);
  end;
end;

{ TTipo_servico_classList }

function TTipo_servico_classList.GetItem(Index: Integer): TTipo_servico_class;
begin
  Result := TTipo_servico_class(inherited Items[Index]);
end;

function TTipo_servico_classList.New: TTipo_servico_class;
begin
  Result := TTipo_servico_class.Create;
  Add(Result);
end;

procedure TTipo_servico_classList.SetItem(Index: Integer; const Value: TTipo_servico_class);
begin
  Put(Index, Value);
end;

procedure TTipo_servico_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.

