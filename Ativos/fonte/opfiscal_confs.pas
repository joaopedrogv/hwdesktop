unit opfiscal_confs;

interface

uses
  Classes,
  Contnrs,
  config_sistema_class,
  ConfigGlobalNF_RTC;

type

  TConfigGlobalNF_FCP = class
  private
    FUsarFCPdoNCM    : Boolean;
    FCalcularFCP     : Boolean;
    FUsarFCPdoEstado : Boolean;
    FUsarFCPdoProduto: Boolean;
    FUsarFCPTribAdProd: Boolean;
  public
    property CalcularFCP      : Boolean read FCalcularFCP       write FCalcularFCP;
    property UsarFCPdoEstado  : Boolean read FUsarFCPdoEstado   write FUsarFCPdoEstado;
    property UsarFCPdoNCM     : Boolean read FUsarFCPdoNCM      write FUsarFCPdoNCM;
    property UsarFCPdoProduto : Boolean read FUsarFCPdoProduto  write FUsarFCPdoProduto;
    property UsarFCPTribAdProd: Boolean read FUsarFCPTribAdProd write FUsarFCPTribAdProd;

  end;

  TConfigGlobalNF_Frete = class
  private
    FEntra_base_icm_quando_conta_destinatario        : Boolean;
    FSomar_despesa_pedvenda_quando_conta_destinatario: Boolean;
    FEntra_base_icm_quando_conta_terceiros           : Boolean;
    FSomar_despesa_pedvenda_quando_conta_terceiros   : Boolean;
    FEntra_base_icm_quando_conta_emitente            : Boolean;
    FSomar_despesa_pedvenda_quando_conta_emitente    : Boolean;
  public
    property Somar_despesa_pedvenda_quando_conta_emitente    : Boolean read FSomar_despesa_pedvenda_quando_conta_emitente     write FSomar_despesa_pedvenda_quando_conta_emitente;
    property Somar_despesa_pedvenda_quando_conta_destinatario: Boolean read FSomar_despesa_pedvenda_quando_conta_destinatario write FSomar_despesa_pedvenda_quando_conta_destinatario;
    property Somar_despesa_pedvenda_quando_conta_terceiros   : Boolean read FSomar_despesa_pedvenda_quando_conta_terceiros    write FSomar_despesa_pedvenda_quando_conta_terceiros;
    property Entra_base_icm_quando_conta_emitente            : Boolean read FEntra_base_icm_quando_conta_emitente             write FEntra_base_icm_quando_conta_emitente;
    property Entra_base_icm_quando_conta_destinatario        : Boolean read FEntra_base_icm_quando_conta_destinatario         write FEntra_base_icm_quando_conta_destinatario;
    property Entra_base_icm_quando_conta_terceiros           : Boolean read FEntra_base_icm_quando_conta_terceiros            write FEntra_base_icm_quando_conta_terceiros;
  end;

  array_string = array of string;

  TCest_v2_st = class(TConfig_sistema_Class)
  private
    FCalcularSTSaida: Boolean;
    FAjustarMVA     : Boolean;
    FAtiva          : Boolean;
    FRamoAtividade  : Integer;
  public
    function GetRamoAtividade(natureza_nf, cnpj: string): Integer;
    function Configura(Conf: TConfig_sistema_Class): TCest_v2_st;

    property CalcularSTSaida: Boolean read FCalcularSTSaida write FCalcularSTSaida;
    property AjustarMVA     : Boolean read FAjustarMVA      write FAjustarMVA;
    property Ativa          : Boolean read FAtiva           write FAtiva;
    property RamoAtividade  : Integer read FRamoAtividade   write FRamoAtividade;
  end;

  Tnf_s_icms_interestadual = class(TCfg_sis)
  public
    function Destacar(const UFDestino, IndIEDest, Consumo: string): Boolean;
  end;

  TConfigGlobalNF_ICMS = class
  private
    FCSTCSOSNNaoCalcularICMSInterestadual: string;
    //Ficms_efetivo_ufs                    : array_string;
    Ficms_efetivo_calc_entrada           : Boolean;
    Fnf_exececoes_codigo_anp             : TStringList;
    Femp_us_cfg_cst_saida_nfst           : Boolean;
    Fprod_cad_relacao_cst_csosn          : TStrings;
    Fnf_e_hab_cst_60_calculo_st_icms     : Boolean;
    Fnf_icmsst_cest_v2                   : TCest_v2_st;
    FUsarCSOSN300Para041                 : Boolean;
    FUFsBaseDupla: string;
    Fnf_s_icms_interestadual: Tnf_s_icms_interestadual;
  public
    icms_efetivo_ufs: array_string;
                                 
    constructor Create;
    destructor Destroy; override;

    //function getCsosnPorCst(cst, csosn, indiedest: string): string;
    function getCsosnPorCst1(cst, csosn, indiedest: string): string;

    property CSTCSOSNNaoCalcularICMSInterestadual: string       read FCSTCSOSNNaoCalcularICMSInterestadual write FCSTCSOSNNaoCalcularICMSInterestadual;
    //property icms_efetivo_ufs                    : array_string read Ficms_efetivo_ufs                     write Ficms_efetivo_ufs;
    property icms_efetivo_calc_entrada           : Boolean      read Ficms_efetivo_calc_entrada            write Ficms_efetivo_calc_entrada;
    property nf_exececoes_codigo_anp             : TStringList  read Fnf_exececoes_codigo_anp              write Fnf_exececoes_codigo_anp;
    property emp_us_cfg_cst_saida_nfst           : Boolean      read Femp_us_cfg_cst_saida_nfst            write Femp_us_cfg_cst_saida_nfst;
    property prod_cad_relacao_cst_csosn          : TStrings     read Fprod_cad_relacao_cst_csosn           write Fprod_cad_relacao_cst_csosn;
    property nf_e_hab_cst_60_calculo_st_icms     : Boolean      read Fnf_e_hab_cst_60_calculo_st_icms      write Fnf_e_hab_cst_60_calculo_st_icms;
    property nf_icmsst_cest_v2                   : TCest_v2_st  read Fnf_icmsst_cest_v2                    write Fnf_icmsst_cest_v2;
    property UsarCSOSN300Para041                 : Boolean      read FUsarCSOSN300Para041                  write FUsarCSOSN300Para041;
    property UFsBaseDupla                        : string       read FUFsBaseDupla                         write FUFsBaseDupla;
    property nf_s_icms_interestadual             : Tnf_s_icms_interestadual     read Fnf_s_icms_interestadual              write Fnf_s_icms_interestadual;
  end;

  THw_conf_piscofins_ad_class = class(TObject)
  private
    Fncm          : string;
    Fcfop         : Integer;
    Fcst          : string;
    Fnat_rec      : string;
    Faliq_pis     : string;
    Faliq_cofins  : string;
    Faliq_r_pis   : string;
    Faliq_r_cofins: string;
  public
    property ncm          : string  read Fncm           write Fncm;
    property cfop         : Integer read Fcfop          write Fcfop;
    property cst          : string  read Fcst           write Fcst;
    property nat_rec      : string  read Fnat_rec       write Fnat_rec;
    property aliq_pis     : string  read Faliq_pis      write Faliq_pis;
    property aliq_cofins  : string  read Faliq_cofins   write Faliq_cofins;
    property aliq_r_pis   : string  read Faliq_r_pis    write Faliq_r_pis;
    property aliq_r_cofins: string  read Faliq_r_cofins write Faliq_r_cofins;
  end;

  THw_conf_piscofins_ad_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): THw_conf_piscofins_ad_class;
    procedure SetItem(Index: Integer; const Value: THw_conf_piscofins_ad_class);
  public
    procedure Make(AlistConf: TStrings);
    function get_by_ncm_cfop(Ancm: string; Acfop: Integer): THw_conf_piscofins_ad_class;

    property Items[Index: Integer]: THw_conf_piscofins_ad_class read GetItem write SetItem;
  end;

  TConfigGlobalNF_PISCOFINS = class
  private
    Fdados_ncm_cfop                       : THw_conf_piscofins_ad_classList;
    Fnf_piscofins_bases                   : TCfg_sis;
    Fnf_piscofins_cst_05_revenda_base_zero: Boolean;
  public
    destructor Destroy; override;
    constructor Create;

    property dados_ncm_cfop                       : THw_conf_piscofins_ad_classList read Fdados_ncm_cfop                        write Fdados_ncm_cfop;
    property nf_piscofins_bases                   : TCfg_sis                        read Fnf_piscofins_bases                    write Fnf_piscofins_bases;
    property nf_piscofins_cst_05_revenda_base_zero: Boolean                         read Fnf_piscofins_cst_05_revenda_base_zero write Fnf_piscofins_cst_05_revenda_base_zero;

//    property nf_conf_ncm_cfop_piscofins: TStringList read Fnf_conf_ncm_cfop_piscofins write Fnf_conf_ncm_cfop_piscofins;
  end;

  TConfigGlobalNF_Geral = class
  private
    Fnf_mudanca_cfop_com_opcoes             : Boolean;
    Fnf_e_add_calc_recomposicao_ao_custo    : Boolean;
    Fnf_e_hab_conversao_embalagem_produto   : Boolean;
    Fnf_hab_digitacao_valor_total           : Boolean;
    Fnf_habilitar_fat_usar_valor_ped        : Boolean;
    Fnf_e_hab_validacao_alternativa_modelo  : TConfig_sistema_class;
    Fnf_hab_alerta_calc_ant_st_itens_por_cst: TConfig_sistema_class;
    Fnf_hab_validacao_antecipacao_st        : TConfig_sistema_class;
    Fnf_hab_antecipacao_st_usar_icms_xml    : Boolean;
    Fnf_s_hab_dadosadicionais_digitacao_fech: Boolean;
    Fnfe_pag_carta_tpintegra_padrao         : Integer;
    Fnf_s_hab_digitacao_peso                : Boolean;
    Fnf_s_obs_pad_bol                       : string;
    Fnf_ibpt_consulta_tributos              : TConfig_sistema_class;
    Fnf_campos_default                      : TConfig_sistema_class;
    Fprod_ean_prefixos_invalidos            : string;
    Fnfe_nt_2020_006_data                   : TDateTime;
    Fnf_desoneracao_zfm_alc                 : TConfig_sistema_class;
    Fnf_inf_pedido_compra                   : TConfig_sistema_class;
    Fnf_e_cnpj_import_xml                   : TConfig_sistema_class;
    Fnfe_inf_compl_op_interna_dest_outra_uf: Integer;
    Fnf_e_compra_conferencia: TConfig_sistema_class;
    Fnfs_devolucao_referencia_por_item: Boolean;
    FUsarMensageriaAI: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function nf_campos_default_indicadordepresenca(natureza: string): string;

    property nf_mudanca_cfop_com_opcoes             : Boolean               read Fnf_mudanca_cfop_com_opcoes              write Fnf_mudanca_cfop_com_opcoes;
    property nf_e_add_calc_recomposicao_ao_custo    : Boolean               read Fnf_e_add_calc_recomposicao_ao_custo     write Fnf_e_add_calc_recomposicao_ao_custo;
    property nf_e_hab_conversao_embalagem_produto   : Boolean               read Fnf_e_hab_conversao_embalagem_produto    write Fnf_e_hab_conversao_embalagem_produto;
    property nf_hab_digitacao_valor_total           : Boolean               read Fnf_hab_digitacao_valor_total            write Fnf_hab_digitacao_valor_total;
    property nf_habilitar_fat_usar_valor_ped        : Boolean               read Fnf_habilitar_fat_usar_valor_ped         write Fnf_habilitar_fat_usar_valor_ped;
    property nf_e_hab_validacao_alternativa_modelo  : TConfig_sistema_class read Fnf_e_hab_validacao_alternativa_modelo   write Fnf_e_hab_validacao_alternativa_modelo;
    property nf_hab_validacao_antecipacao_st        : TConfig_sistema_class read Fnf_hab_validacao_antecipacao_st         write Fnf_hab_validacao_antecipacao_st;
    property nf_hab_alerta_calc_ant_st_itens_por_cst: TConfig_sistema_class read Fnf_hab_alerta_calc_ant_st_itens_por_cst write Fnf_hab_alerta_calc_ant_st_itens_por_cst;
    property nf_hab_antecipacao_st_usar_icms_xml    : Boolean               read Fnf_hab_antecipacao_st_usar_icms_xml     write Fnf_hab_antecipacao_st_usar_icms_xml;
    property nf_s_hab_dadosadicionais_digitacao_fech: Boolean               read Fnf_s_hab_dadosadicionais_digitacao_fech write Fnf_s_hab_dadosadicionais_digitacao_fech;
    property nfe_pag_carta_tpintegra_padrao         : Integer               read Fnfe_pag_carta_tpintegra_padrao          write Fnfe_pag_carta_tpintegra_padrao;
    property nf_s_hab_digitacao_peso                : Boolean               read Fnf_s_hab_digitacao_peso                 write Fnf_s_hab_digitacao_peso;
    property nf_s_obs_pad_bol                       : string                read Fnf_s_obs_pad_bol                        write Fnf_s_obs_pad_bol;
    property nf_ibpt_consulta_tributos              : TConfig_sistema_class read Fnf_ibpt_consulta_tributos               write Fnf_ibpt_consulta_tributos;
    property nf_campos_default                      : TConfig_sistema_class read Fnf_campos_default                       write Fnf_campos_default;
    property prod_ean_prefixos_invalidos            : string                read Fprod_ean_prefixos_invalidos             write Fprod_ean_prefixos_invalidos;
    property nfe_nt_2020_006_data                   : TDateTime             read Fnfe_nt_2020_006_data                    write Fnfe_nt_2020_006_data;
    property nf_desoneracao_zfm_alc                 : TConfig_sistema_class read Fnf_desoneracao_zfm_alc                  write Fnf_desoneracao_zfm_alc;
    property nf_inf_pedido_compra                   : TConfig_sistema_class read Fnf_inf_pedido_compra                    write Fnf_inf_pedido_compra;
    property nf_e_cnpj_import_xml                   : TConfig_sistema_class read Fnf_e_cnpj_import_xml                    write Fnf_e_cnpj_import_xml;
    property nfe_inf_compl_op_interna_dest_outra_uf : Integer               read Fnfe_inf_compl_op_interna_dest_outra_uf  write Fnfe_inf_compl_op_interna_dest_outra_uf; //nfe_info_complementar_op_interna_dest_outra_uf
    property nf_e_compra_conferencia                : TConfig_sistema_class read Fnf_e_compra_conferencia                 write Fnf_e_compra_conferencia;
    property nfs_devolucao_referencia_por_item      : Boolean               read Fnfs_devolucao_referencia_por_item       write Fnfs_devolucao_referencia_por_item;
    property UsarMensageriaAI                       : Boolean               read FUsarMensageriaAI                        write FUsarMensageriaAI;
    //depois com mais tempo continuar a pegar as variaveis que sao buscadas a todo momento e colocalas nessa classe
    //procurar "vDadosIni.getConfSis" nessa unit e transferir sua consulta para aqui, assim como as outras de exemplo
  end;

  TConfigGlobalNF_Lote = class
  private
    Fagrupar_por_cliente: Boolean;
    Fusar_obs_pedido    : Boolean;
  public
    property agrupar_por_cliente: Boolean read Fagrupar_por_cliente write Fagrupar_por_cliente;
    property usar_obs_pedido    : Boolean read Fusar_obs_pedido     write Fusar_obs_pedido;
  end;

  TConfigGlobalNF_AltPreco = class
  private
    FAlteraPrecoNaEntrada: Boolean;
    FUsarPercAdicional: Boolean;
    FCalcUsandoMagem: Boolean;
    FUsarPerc30ParaVarejo: Boolean;
  public
    property AlteraPrecoNaEntrada: Boolean read FAlteraPrecoNaEntrada write FAlteraPrecoNaEntrada;
    property UsarPercAdicional: Boolean read FUsarPercAdicional write FUsarPercAdicional;
    property CalcUsandoMagem: Boolean read FCalcUsandoMagem write FCalcUsandoMagem;
    property UsarPerc30ParaVarejo: Boolean read FUsarPerc30ParaVarejo write FUsarPerc30ParaVarejo;
  end;

  TConfigGlobalNF_Custos = class
  private
    FAbaterCreditoPisCofis: Boolean;
    FAbaterCreditoIcms: Boolean;
  public
    property AbaterCreditoIcms: Boolean read FAbaterCreditoIcms write FAbaterCreditoIcms;
    property AbaterCreditoPisCofins: Boolean read FAbaterCreditoPisCofis write FAbaterCreditoPisCofis;
  end;

  TConfigGlobalNotaFiscal = class
  protected
    Finicializado: Boolean;
    Fnatureza_nf : string;
//    Fbuscas      : TIBQuery;
    FConf_FCP    : TConfigGlobalNF_FCP;
    FConf_Frete  : TConfigGlobalNF_Frete;
    FConf_ICMS   : TConfigGlobalNF_ICMS;
    FConf_PIS    : TConfigGlobalNF_PISCOFINS;
    FConf_Geral  : TConfigGlobalNF_Geral;
    FConf_Lote   : TConfigGlobalNF_Lote;
    Fversao_calc : Smallint;                  
    FConf_Custo  : TConfigGlobalNF_Custos;
    FConf_RTC    : TConfigGlobalNF_RTC;
//    FConf_Preco  : TConfigGlobalNF_AltPreco;

    function AsTrueValue(Avalue: Double): Boolean;
  protected
    procedure nf_s_lote_faturamento_check; virtual; abstract;
  public
//    constructor Create(Abuscas: TIBQuery; Anatureza_nf: string);
//    destructor Destroy; override;
//
//    procedure ExecutarLeitura(Anatureza_nf: string = 'S');
//    procedure ExecutarConferenciaVariaveis;
    procedure reset;

    property inicializado: Boolean                   read Finicializado write Finicializado;
    property versao_calc : Smallint                  read Fversao_calc  write Fversao_calc;
    property Conf_FCP    : TConfigGlobalNF_FCP       read FConf_FCP     write FConf_FCP;
    property Conf_Frete  : TConfigGlobalNF_Frete     read FConf_Frete   write FConf_Frete;
    property Conf_ICMS   : TConfigGlobalNF_ICMS      read FConf_ICMS    write FConf_ICMS;
    property Conf_PIS    : TConfigGlobalNF_PISCOFINS read FConf_PIS     write FConf_PIS;
    property Conf_Geral  : TConfigGlobalNF_Geral     read FConf_Geral   write FConf_Geral;
    property Conf_Lote   : TConfigGlobalNF_Lote      read FConf_Lote    write FConf_Lote;
    property Conf_Custo  : TConfigGlobalNF_Custos    read FConf_Custo   write FConf_Custo;
    property Conf_RTC    : TConfigGlobalNF_RTC       read FConf_RTC     write FConf_RTC;


//    property Conf_Preco  : TConfigGlobalNF_AltPreco  read FConf_Preco   write FConf_Preco;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  hw_utils;

{ TCest_v2_st }

function TCest_v2_st.Configura(Conf: TConfig_sistema_Class): TCest_v2_st;
begin
  Self.value1_b.Text   := Conf.value1_b.Text;
  Self.Ativa           := Conf.value1_f = 1;
  Self.CalcularSTSaida := Conf.ReadString( 'Conf', 'CalcularSTSaida', 'S') = 'S';
  Self.AjustarMVA      := Conf.ReadString( 'Conf', 'AjustarMVA'     , 'S') = 'S';
  Self.RamoAtividade   := Conf.ReadInteger('Conf', 'RamoAtividade'  , 3);
end;

function TCest_v2_st.GetRamoAtividade(natureza_nf, cnpj: string): Integer;
begin
  if natureza_nf = 'S' then
    Result := RamoAtividade
  else
  begin
    Result := ReadInteger('Conf', 'RamoAtividade_' + cnpj, -1);
    if Result = -1 then
      Result := ReadInteger('Conf', 'RamoAtividade_Fornecedor' + cnpj, 3);
  end;
end;

{ THw_conf_piscofins_ad_classList }

function THw_conf_piscofins_ad_classList.GetItem(Index: Integer): THw_conf_piscofins_ad_class;
begin
  Result := THw_conf_piscofins_ad_class(inherited Items[Index]);
end;

function THw_conf_piscofins_ad_classList.get_by_ncm_cfop(Ancm: string;
  Acfop: Integer): THw_conf_piscofins_ad_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Pred(Self.Count) do
    if ((Self.Items[I].ncm = '99999999') or (Self.Items[I].ncm = Ancm)) and
        (Self.Items[I].cfop = Acfop) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

procedure THw_conf_piscofins_ad_classList.Make(AlistConf: TStrings);
var
  Aitem: THw_conf_piscofins_ad_class;
  Astr: string;
begin
  Self.Clear;
  for Astr in AlistConf do
    if (Length(OnlyNumber(StrByPosition(Astr, 1))) = 8)
      or ((Length(OnlyNumber(StrByPosition(Astr, 1))) = 2) and (StrByPosition(Astr, 1) = '00')) then
    begin
      Aitem               := THw_conf_piscofins_ad_class.Create;
      Aitem.ncm           := OnlyNumber(StrByPosition(Astr, 1));
      Aitem.cfop          := StrToIntDef(StrByPosition(Astr, 2), -1);
      Aitem.cst           := OnlyNumber(StrByPosition(Astr, 3));
      Aitem.nat_rec       := OnlyNumber(StrByPosition(Astr, 4));
      Aitem.aliq_pis      := Trim(StrByPosition(Astr, 5));
      Aitem.aliq_cofins   := Trim(StrByPosition(Astr, 6));
      Aitem.aliq_r_pis    := Trim(StrByPosition(Astr, 7));
      Aitem.aliq_r_cofins := Trim(StrByPosition(Astr, 8));

      Self.Add(Aitem);
    end;
end;

procedure THw_conf_piscofins_ad_classList.SetItem(Index: Integer; const Value: THw_conf_piscofins_ad_class);
begin
  Put(Index, Value);
end;     

{ TConfigGlobalNF_PISCOFINS }

constructor TConfigGlobalNF_PISCOFINS.Create;
begin
  Fdados_ncm_cfop     := THw_conf_piscofins_ad_classList.Create;
  Fnf_piscofins_bases := TCfg_sis.Create;
end;

destructor TConfigGlobalNF_PISCOFINS.Destroy;
begin
  if Assigned(Fdados_ncm_cfop) then
  begin
    Fdados_ncm_cfop.Clear;
    FreeAndNil(Fdados_ncm_cfop);
  end;
  if Assigned(Fnf_piscofins_bases) then
    Fnf_piscofins_bases.Free;

  inherited;
end;

{ TConfigGlobalNF_Geral }

constructor TConfigGlobalNF_Geral.Create;
begin
  Fnf_desoneracao_zfm_alc := TConfig_sistema_class.Create;
  Fnf_inf_pedido_compra   := TConfig_sistema_class.Create;
  Fnf_e_cnpj_import_xml   := TConfig_sistema_class.Create;
  Fnf_e_compra_conferencia:= TConfig_sistema_class.Create;
  Fnf_ibpt_consulta_tributos := TConfig_sistema_class.Create;
end;

destructor TConfigGlobalNF_Geral.Destroy;
begin

  if Assigned(Fnf_desoneracao_zfm_alc) then
    FreeAndNil(Fnf_desoneracao_zfm_alc);

  if Assigned(Fnf_inf_pedido_compra) then
    FreeAndNil(Fnf_inf_pedido_compra);

  if Assigned(Fnf_e_cnpj_import_xml) then
    FreeAndNil(Fnf_e_cnpj_import_xml);

  if Assigned(Fnf_ibpt_consulta_tributos) then
    FreeAndNil(Fnf_ibpt_consulta_tributos);

  Fnf_e_compra_conferencia.Free;

  inherited;
end;

function TConfigGlobalNF_Geral.nf_campos_default_indicadordepresenca(
  natureza: string): string;
var
  indpres: Integer;
begin
  Result := '9';
  if not Assigned(Fnf_campos_default) then
    Exit;

  indpres := Fnf_campos_default.ReadInteger(IfThen(natureza = 'E', 'Entrada', 'Saida'), 'IndicadorDePresenca', 9);
  case indpres of
    0, 1, 2, 3, 5, 9 : Result := IntToStr(indpres);
    else Result := '9';
  end;
end;

{ TConfigGlobalNF }

function TConfigGlobalNotafiscal.AsTrueValue(Avalue: Double): Boolean;
begin
  Result := Avalue = 1;
end;

procedure TConfigGlobalNotafiscal.reset;
begin
  Finicializado := False;
end;

{ TConfigGlobalNF_ICMS }

constructor TConfigGlobalNF_ICMS.Create;
begin
  Fnf_s_icms_interestadual := Tnf_s_icms_interestadual.Create;
end;

destructor TConfigGlobalNF_ICMS.Destroy;
begin
  if Assigned(Fnf_s_icms_interestadual) then
    FreeAndNil(Fnf_s_icms_interestadual);

  inherited;
end;

function TConfigGlobalNF_ICMS.getCsosnPorCst1(cst, csosn, indiedest: string): string;
var
  Acsosn, Acst, Aorig, Adig: string;
  I: Integer;
begin
  if Length(Trim(cst)) <> 3 then
    raise Exception.Create('Metodo getCsosnPorCst com parametro invalido, cst < 3');

  Aorig := Copy(cst, 1, 1);
  Acst  := Copy(cst, 2, 2);

  Acsosn := '';
  for I := 0 to Pred(prod_cad_relacao_cst_csosn.Count) do
  begin
    if Acst = StrByPosition(prod_cad_relacao_cst_csosn[I], 1) then //por padrao vai utilizar o primeiro Acsosn que encontrar
      Acsosn := Copy( prod_cad_relacao_cst_csosn[I], 4, Length(prod_cad_relacao_cst_csosn[I]));
    if Acsosn <> '' then
    begin
      if (Trim(csosn) <> '') and (Pos('|' + csosn + '|',  Acsosn) > 0) then
        Acsosn := csosn
      else
        Acsosn := StrByPosition(Acsosn, 1);
      Break;
    end;
  end;

  if not MatchStr(Acsosn, ['101', '102', '103', '201', '202', '203', '300', '400', '500', '900']) then
    Acsosn := '';

  try
    if Acsosn = '' then // caso nao tenha configuracao o padrao é este abaixo
    begin
      Adig   := IfThen(Acst[1] in ['0', '2', '1', '7'], IfThen(indiedest = '1', '1', '2'));
      Acsosn := IfThen(Acst[1] in ['0', '2'], '10' ) +
                IfThen(Acst[1] in ['1', '7'], '20' ) +
                IfThen(Acst = '30'          , '203') +
                IfThen(Acst = '40'          , '103') +
                IfThen(Acst = '41'          , IfThen(UsarCSOSN300Para041, '300', '400')) +
                IfThen(Acst = '50'          , '103') +
                IfThen(Acst = '51'          , '900') +
                IfThen(Acst = '60'          , '500') +
                IfThen(Acst = '90'          , '900') +
                Adig;
    end;
    { Não vai mais ajustar quando contribuinte, pois a contabilidade da Bellanona é muito chata, a conf global prod_cad_relacao_cst_csosn é a regra que vai prevalecer
    else if ((FOwnerNF.emissao_propria = 'S') and (FOwnerNF.devolucao <> 'SIM')) then
      if oner.strIn(Acsosn, ['101', '102', '201', '202']) then
        Acsosn := Copy(Acsosn, 1, 2) + IfThen(FOwnerNF.nfe_indiedest = 1, '1', '2');
    }
  finally
    Result := Acsosn;
  end;
end;

{ Tnf_s_icms_interestadual }

function Tnf_s_icms_interestadual.Destacar(const UFDestino, IndIEDest,
  Consumo: string): Boolean;
var
  section: string;
  bIndIE, bConsumo: Boolean;
begin

  section := 'Regra_UF_' + UFDestino;

  if not value1_b.ini.SectionExists(section) then
    section := 'Regra_UF_99';


  if IndIEDest = '1' then
    bIndIE := ReadString(section, 'Destacar_quando_cliente_contribuinte', 'S') = 'S'

  else if IndIEDest = '2' then
    bIndIE := ReadString(section, 'Destacar_quando_cliente_isento', 'N') = 'S'

  else if IndIEDest = '9' then
    bIndIE := ReadString(section, 'Destacar_quando_cliente_nao_contribuinte', 'N') = 'S'

  else
    bIndIE := False;
    
  if Consumo = 'S' then
    bConsumo := ReadString(section, 'Destacar_quando_consumo_final_sim', 'N') = 'S'

  else if Consumo = 'N' then
    bConsumo := ReadString(section, 'Destacar_quando_consumo_final_nao', 'S') = 'S'

  else
    bConsumo := False;

  Result := bIndIE and bConsumo;  
end;

end.
