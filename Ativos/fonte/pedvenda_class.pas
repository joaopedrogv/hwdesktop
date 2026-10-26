unit pedvenda_class;

interface

uses
{$IFDEF VER180}
  base_class,
  Classes,
  Contnrs,
  DB;
{$ELSE}
  base_class,
  System.Classes,
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  TPedvenda_class = class(TBase_class)
  private
    Fnped                   : Integer;
    Ftipo                   : string;
    Fcod_empresa            : Integer;
    Fcod_cliente            : Integer;
    Fcod_vendedor           : Integer;
    Fcod_cond_pag           : Integer;
    Fcod_us_fech            : Integer;
    Fn_mov_cxl              : Integer;
    Fdia_cxl                : TDateTime;
    Fdata_ped               : TDateTime;
    Fdata_fech              : TDateTime;
    Fdatvenc                : TDateTime;
    Fvalor_total            : Double;
    Fdesc_p_prod            : Double;
    Fdesc_p_serv            : Double;
    Fdesconto               : Double;
    Fobs_ped                : string;
    Fstatus_ped             : string;
    Ftipv                   : string;
    Fobs_cxl_rq             : string;
    Fstatus_cxl_rq          : string;
    Fvl_pago_cxl            : Double;
    Fselec                  : string;
    Ftipor                  : string;
    Fhoraabertura           : Integer;
    Fminabertura            : Integer;
    Fhorafechamento         : Integer;
    Fminfechamento          : Integer;
    Fhorasubtotal           : Integer;
    Fminsubtotal            : Integer;
    Fncupom                 : Integer;
    Foperador               : Integer;
    Fdata_cupom             : TDateTime;
    Fda                     : string;
    Fnserieecf              : string;
    Fnome_receb             : string;
    Fend_receb              : string;
    Fbairro_receb           : string;
    Fcida_receb             : string;
    Fcep_receb              : string;
    Ffone_receb             : string;
    Fobs_minuta             : TStrings;
    Fgrupo_prod             : Integer;
    Fcod_prod               : string;
    Fop_cxl                 : Integer;
    Fcod_cidade_receb       : Integer;
    Fcod_bairro_receb       : Integer;
    Fvl_entrada             : Double;
    Fcodigo_ctrl            : Integer;
    Fnprevenda              : Integer;
    Fstat_req               : string;
    Facresc_p_prod          : Double;
    Facresc_p_serv          : Double;
    Facrescimo              : Double;
    Fplaca                  : string;
    Fchassi                 : string;
    Fkm_v                   : Integer;
    Forc_prod               : Integer;
    Fdt_prometida           : TDateTime;
    Fobs_os                 : TStrings;
    Faparelho_ped           : string;
    Fguarda_vol             : string;
    Fcombust_veic           : string;
    Fdefeito                : TStrings;
    Festado_veic            : TStrings;
    Facessorios             : TStrings;
    Ftipo_os                : string;
    Fh_ent                  : TDateTime;
    Fh_prometida            : TDateTime;
    Fdata_nf                : TDateTime;
    Fdt_nfgarantia          : TDateTime;
    Ftot_prod               : Double;
    Ftot_serv               : Double;
    Ftp_abord               : string;
    Ffr_pagbosch            : string;
    Fseq_fech               : Integer;
    Fem_nf                  : string;
    Fcod_equip              : Integer;
    Fn_serie                : string;
    Fnum_nf                 : Integer;
    Fobs_livro_reg          : string;
    Fvalor_nf               : Double;
    Fnf_pgarantia           : Integer;
    Fnome_nf_garantia       : string;
    Fhora_fech              : string;
    Fst_term_serv           : string;
    Fregistro_de_entrega    : string;
    Fativo                  : Integer;
    Ftipo_orc               : string;
    Fstatus_cupom           : string;
    Fcodterm_status         : Integer;
    Fcpfcgc                 : string;
    Fnome_cli_orc           : string;
    Fcod_orcamento          : Integer;
    Fobs_red_os             : string;
    Fcod_veiculo            : Integer;
    Fnum_nfeext             : Int64;
    Fdata_nfext             : TDateTime;
    Fvalor_nfext            : Double;
    Fserie_nf               : string;
    Fccf_cupom              : Integer;
    Flibtrava               : string;
    Fmd5                    : string;
    Fdav_impresso           : string;
    Fdependente             : Integer;
    Fsubtipo_os             : string;
    Fcod_carga              : Integer;
    Faprovada_gerente       : string;
    Fnpedmob                : Integer;
    Fidmobile               : Integer;
    Fdata_libtrava          : TDateTime;
    Fcod_nf                 : Integer;
    Fnf_gerou               : string;
    Fcod_agendamento        : Integer;
    Fstatus_contrato        : string;
    Fnome_clientedav        : string;
    Fmd52                   : string;
    Fcoo_impressao          : Integer;
    Fnseriecf_impressao     : string;
    Foperador_impressao     : Integer;
    Fpaf_num_prevenda       : Integer;
    Fpaf_status_prevenda    : string;
    Fnped_originado         : Integer;
    Ftipo_originado         : string;
    Fcod_agenda             : Integer;
    Fstatus_conta_cliente   : string;
    Fcoo_conta_cliente      : Integer;
    Fcer_conta_cliente      : Integer;
    Fcodpesquisa            : Integer;
    Forcparavnd             : string;
    Fcod_controle           : Integer;
    Fgerente_aprovou        : string;
    Fvalor_desc_avista      : Double;
    Fmetodo_entrega         : string;
    Fautorizado_financeiro  : string;
    Fn_comando              : Integer;
    Fenv_mobile             : string;
    Freaberto               : string;
    Fregras_descontos       : string;
    Fstatus_sep_conf        : string;
    Fnserieecf_conta_cliente: string;
    Fsaveauto               : string;
    Fcalc                   : string;
    Fus_edit                : Integer;
    Fdata_estoque           : TDateTime;
    Fcod_cliente_nfserv     : Integer;
    Fqtde_libtrava          : Integer;
    Fqtde_impressao         : Integer;
    Fend_avl                : string;
    Fbairro_avl             : string;
    Fcida_avl               : string;
    Fcep_avl                : string;
    Festa_avl               : string;
    Fcod_vendedor1          : Integer;
    Fselos_col              : TStrings;
    Fselos_rem              : TStrings;
    Flacres_col             : TStrings;
    Flacres_rem             : TStrings;
    Fn_nfd                  : Integer;
    Fserie_nfd              : string;
    Fnfd_gerou              : string;
    Fdata_nfd               : TDateTime;
    Fvalor_nfd              : Double;
    Fcod_cli_fat            : Integer;
    Fcod_gerador            : Integer;
    Fcod_nfce               : Integer;
    Fenv_email_nfs          : string;
    Ftot_serv_terc          : Double;
    Ftot_prod_terc          : Double;
    Ftp_venda               : string;
    Fcl_clultimacompra      : string;
    Fcl_status_f            : string;
    Ftp_gerar_pontos        : string;
    Fvale_troca             : string;
    Fvalor_vale_prg         : Double;
    Fdest_seqid             : Integer;
    Fdest_seqid_entrg       : Integer;
    Fcod_fatura             : Integer;
    Fvl_comissao_vend       : Double;
    Fperc_comissao_vend     : Double;
    Fvl_comissao_vend1      : Double;
    Fperc_comissao_vend1    : Double;
    Fcont_alt               : Integer;
    Flocal_incidencia       : Integer;
    Fnf_ac_calctrib         : string;
    Fnf_ac_seguro           : Double;
    Fnf_ac_outras           : Double;
    Fnf_ac_frete            : Double;
    Fnf_ac_ipi              : Double;
    Fnf_ac_icmsst           : Double;
    Fnf_ac_fcpst            : Double;
    Fnf_ac_imposto_ii       : Double;
    Fnf_freteconta          : string;
    Fid_commerce            : Integer;
    Fcod_forma_rast         : Integer;
    Fdata_envio_rast        : TDateTime;
    Fcod_rastreamento       : string;
    Fidsitped_ec            : Integer;
    Fstatus_ec              : string;
    Fnf_cf_deson_emb        : string;
    Fnf_dc_desconto         : Double;
    Fnf_dc_vicmdeson        : Double;
    Fnf_ac_vicmdeson        : Double;
    Ffinalidadeid           : Integer;
    procedure Setnped(const Value: Integer);
    procedure Settipo(const Value: string);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_cliente(const Value: Integer);
    procedure Setcod_vendedor(const Value: Integer);
    procedure Setcod_cond_pag(const Value: Integer);
    procedure Setcod_us_fech(const Value: Integer);
    procedure Setn_mov_cxl(const Value: Integer);
    procedure Setdia_cxl(const Value: TDateTime);
    procedure Setdata_ped(const Value: TDateTime);
    procedure Setdata_fech(const Value: TDateTime);
    procedure Setdatvenc(const Value: TDateTime);
    procedure Setvalor_total(const Value: Double);
    procedure Setdesc_p_prod(const Value: Double);
    procedure Setdesc_p_serv(const Value: Double);
    procedure Setdesconto(const Value: Double);
    procedure Setobs_ped(const Value: string);
    procedure Setstatus_ped(const Value: string);
    procedure Settipv(const Value: string);
    procedure Setobs_cxl_rq(const Value: string);
    procedure Setstatus_cxl_rq(const Value: string);
    procedure Setvl_pago_cxl(const Value: Double);
    procedure Setselec(const Value: string);
    procedure Settipor(const Value: string);
    procedure Sethoraabertura(const Value: Integer);
    procedure Setminabertura(const Value: Integer);
    procedure Sethorafechamento(const Value: Integer);
    procedure Setminfechamento(const Value: Integer);
    procedure Sethorasubtotal(const Value: Integer);
    procedure Setminsubtotal(const Value: Integer);
    procedure Setncupom(const Value: Integer);
    procedure Setoperador(const Value: Integer);
    procedure Setdata_cupom(const Value: TDateTime);
    procedure Setda(const Value: string);
    procedure Setnserieecf(const Value: string);
    procedure Setnome_receb(const Value: string);
    procedure Setend_receb(const Value: string);
    procedure Setbairro_receb(const Value: string);
    procedure Setcida_receb(const Value: string);
    procedure Setcep_receb(const Value: string);
    procedure Setfone_receb(const Value: string);
    procedure Setobs_minuta(const Value: TStrings);
    procedure Setgrupo_prod(const Value: Integer);
    procedure Setcod_prod(const Value: string);
    procedure Setop_cxl(const Value: Integer);
    procedure Setcod_cidade_receb(const Value: Integer);
    procedure Setcod_bairro_receb(const Value: Integer);
    procedure Setvl_entrada(const Value: Double);
    procedure Setcodigo_ctrl(const Value: Integer);
    procedure Setnprevenda(const Value: Integer);
    procedure Setstat_req(const Value: string);
    procedure Setacresc_p_prod(const Value: Double);
    procedure Setacresc_p_serv(const Value: Double);
    procedure Setacrescimo(const Value: Double);
    procedure Setplaca(const Value: string);
    procedure Setchassi(const Value: string);
    procedure Setkm_v(const Value: Integer);
    procedure Setorc_prod(const Value: Integer);
    procedure Setdt_prometida(const Value: TDateTime);
    procedure Setobs_os(const Value: TStrings);
    procedure Setaparelho_ped(const Value: string);
    procedure Setguarda_vol(const Value: string);
    procedure Setcombust_veic(const Value: string);
    procedure Setdefeito(const Value: TStrings);
    procedure Setestado_veic(const Value: TStrings);
    procedure Setacessorios(const Value: TStrings);
    procedure Settipo_os(const Value: string);
    procedure Seth_ent(const Value: TDateTime);
    procedure Seth_prometida(const Value: TDateTime);
    procedure Setdata_nf(const Value: TDateTime);
    procedure Setdt_nfgarantia(const Value: TDateTime);
    procedure Settot_prod(const Value: Double);
    procedure Settot_serv(const Value: Double);
    procedure Settp_abord(const Value: string);
    procedure Setfr_pagbosch(const Value: string);
    procedure Setseq_fech(const Value: Integer);
    procedure Setem_nf(const Value: string);
    procedure Setcod_equip(const Value: Integer);
    procedure Setn_serie(const Value: string);
    procedure Setnum_nf(const Value: Integer);
    procedure Setobs_livro_reg(const Value: string);
    procedure Setvalor_nf(const Value: Double);
    procedure Setnf_pgarantia(const Value: Integer);
    procedure Setnome_nf_garantia(const Value: string);
    procedure Sethora_fech(const Value: string);
    procedure Setst_term_serv(const Value: string);
    procedure Setregistro_de_entrega(const Value: string);
    procedure Setativo(const Value: Integer);
    procedure Settipo_orc(const Value: string);
    procedure Setstatus_cupom(const Value: string);
    procedure Setcodterm_status(const Value: Integer);
    procedure Setcpfcgc(const Value: string);
    procedure Setnome_cli_orc(const Value: string);
    procedure Setcod_orcamento(const Value: Integer);
    procedure Setobs_red_os(const Value: string);
    procedure Setcod_veiculo(const Value: Integer);
    procedure Setnum_nfeext(const Value: Int64);
    procedure Setdata_nfext(const Value: TDateTime);
    procedure Setvalor_nfext(const Value: Double);
    procedure Setserie_nf(const Value: string);
    procedure Setccf_cupom(const Value: Integer);
    procedure Setlibtrava(const Value: string);
    procedure Setmd5(const Value: string);
    procedure Setdav_impresso(const Value: string);
    procedure Setdependente(const Value: Integer);
    procedure Setsubtipo_os(const Value: string);
    procedure Setcod_carga(const Value: Integer);
    procedure Setaprovada_gerente(const Value: string);
    procedure Setnpedmob(const Value: Integer);
    procedure Setidmobile(const Value: Integer);
    procedure Setdata_libtrava(const Value: TDateTime);
    procedure Setcod_nf(const Value: Integer);
    procedure Setnf_gerou(const Value: string);
    procedure Setcod_agendamento(const Value: Integer);
    procedure Setstatus_contrato(const Value: string);
    procedure Setnome_clientedav(const Value: string);
    procedure Setmd52(const Value: string);
    procedure Setcoo_impressao(const Value: Integer);
    procedure Setnseriecf_impressao(const Value: string);
    procedure Setoperador_impressao(const Value: Integer);
    procedure Setpaf_num_prevenda(const Value: Integer);
    procedure Setpaf_status_prevenda(const Value: string);
    procedure Setnped_originado(const Value: Integer);
    procedure Settipo_originado(const Value: string);
    procedure Setcod_agenda(const Value: Integer);
    procedure Setstatus_conta_cliente(const Value: string);
    procedure Setcoo_conta_cliente(const Value: Integer);
    procedure Setcer_conta_cliente(const Value: Integer);
    procedure Setcodpesquisa(const Value: Integer);
    procedure Setorcparavnd(const Value: string);
    procedure Setcod_controle(const Value: Integer);
    procedure Setgerente_aprovou(const Value: string);
    procedure Setvalor_desc_avista(const Value: Double);
    procedure Setmetodo_entrega(const Value: string);
    procedure Setautorizado_financeiro(const Value: string);
    procedure Setn_comando(const Value: Integer);
    procedure Setenv_mobile(const Value: string);
    procedure Setreaberto(const Value: string);
    procedure Setregras_descontos(const Value: string);
    procedure Setstatus_sep_conf(const Value: string);
    procedure Setnserieecf_conta_cliente(const Value: string);
    procedure Setsaveauto(const Value: string);
    procedure Setcalc(const Value: string);
    procedure Setus_edit(const Value: Integer);
    procedure Setdata_estoque(const Value: TDateTime);
    procedure Setcod_cliente_nfserv(const Value: Integer);
    procedure Setqtde_libtrava(const Value: Integer);
    procedure Setqtde_impressao(const Value: Integer);
    procedure Setend_avl(const Value: string);
    procedure Setbairro_avl(const Value: string);
    procedure Setcida_avl(const Value: string);
    procedure Setcep_avl(const Value: string);
    procedure Setesta_avl(const Value: string);
    procedure Setcod_vendedor1(const Value: Integer);
    procedure Setselos_col(const Value: TStrings);
    procedure Setselos_rem(const Value: TStrings);
    procedure Setlacres_col(const Value: TStrings);
    procedure Setlacres_rem(const Value: TStrings);
    procedure Setn_nfd(const Value: Integer);
    procedure Setserie_nfd(const Value: string);
    procedure Setnfd_gerou(const Value: string);
    procedure Setdata_nfd(const Value: TDateTime);
    procedure Setvalor_nfd(const Value: Double);
    procedure Setcod_cli_fat(const Value: Integer);
    procedure Setcod_gerador(const Value: Integer);
    procedure Setcod_nfce(const Value: Integer);
    procedure Setenv_email_nfs(const Value: string);
    procedure Settot_serv_terc(const Value: Double);
    procedure Settot_prod_terc(const Value: Double);
    procedure Settp_venda(const Value: string);
    procedure Setcl_clultimacompra(const Value: string);
    procedure Setcl_status_f(const Value: string);
    procedure Settp_gerar_pontos(const Value: string);
    procedure Setvale_troca(const Value: string);
    procedure Setvalor_vale_prg(const Value: Double);
    procedure Setdest_seqid(const Value: Integer);
    procedure Setdest_seqid_entrg(const Value: Integer);
    procedure Setcod_fatura(const Value: Integer);
    procedure Setvl_comissao_vend(const Value: Double);
    procedure Setperc_comissao_vend(const Value: Double);
    procedure Setvl_comissao_vend1(const Value: Double);
    procedure Setperc_comissao_vend1(const Value: Double);
    procedure Setcont_alt(const Value: Integer);
    procedure Setlocal_incidencia(const Value: Integer);
    procedure Setnf_ac_calctrib(const Value: string);
    procedure Setnf_ac_seguro(const Value: Double);
    procedure Setnf_ac_outras(const Value: Double);
    procedure Setnf_ac_frete(const Value: Double);
    procedure Setnf_ac_ipi(const Value: Double);
    procedure Setnf_ac_icmsst(const Value: Double);
    procedure Setnf_ac_fcpst(const Value: Double);
    procedure Setnf_ac_imposto_ii(const Value: Double);
    procedure Setnf_freteconta(const Value: string);
    procedure Setid_commerce(const Value: Integer);
    procedure Setcod_forma_rast(const Value: Integer);
    procedure Setdata_envio_rast(const Value: TDateTime);
    procedure Setcod_rastreamento(const Value: string);
    procedure Setidsitped_ec(const Value: Integer);
    procedure Setstatus_ec(const Value: string);
    procedure Setnf_cf_deson_emb(const Value: string);
    procedure Setnf_dc_desconto(const Value: Double);
    procedure Setnf_dc_vicmdeson(const Value: Double);
    procedure Setnf_ac_vicmdeson(const Value: Double);
    procedure Setfinalidadeid(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function SQLMotor(AautoIncField: string = ''; AignoreFields: string = 'ativo'): TSQLBase_fb; override;

    property nped                   : Integer   read Fnped                    write Setnped;
    property tipo                   : string    read Ftipo                    write Settipo;
    property cod_empresa            : Integer   read Fcod_empresa             write Setcod_empresa;
    property cod_cliente            : Integer   read Fcod_cliente             write Setcod_cliente;
    property cod_vendedor           : Integer   read Fcod_vendedor            write Setcod_vendedor;
    property cod_cond_pag           : Integer   read Fcod_cond_pag            write Setcod_cond_pag;
    property cod_us_fech            : Integer   read Fcod_us_fech             write Setcod_us_fech;
    property n_mov_cxl              : Integer   read Fn_mov_cxl               write Setn_mov_cxl;
    property dia_cxl                : TDateTime read Fdia_cxl                 write Setdia_cxl;
    property data_ped               : TDateTime read Fdata_ped                write Setdata_ped;
    property data_fech              : TDateTime read Fdata_fech               write Setdata_fech;
    property datvenc                : TDateTime read Fdatvenc                 write Setdatvenc;
    property valor_total            : Double    read Fvalor_total             write Setvalor_total;
    property desc_p_prod            : Double    read Fdesc_p_prod             write Setdesc_p_prod;
    property desc_p_serv            : Double    read Fdesc_p_serv             write Setdesc_p_serv;
    property desconto               : Double    read Fdesconto                write Setdesconto;
    property obs_ped                : string    read Fobs_ped                 write Setobs_ped;
    property status_ped             : string    read Fstatus_ped              write Setstatus_ped;
    property tipv                   : string    read Ftipv                    write Settipv;
    property obs_cxl_rq             : string    read Fobs_cxl_rq              write Setobs_cxl_rq;
    property status_cxl_rq          : string    read Fstatus_cxl_rq           write Setstatus_cxl_rq;
    property vl_pago_cxl            : Double    read Fvl_pago_cxl             write Setvl_pago_cxl;
    property selec                  : string    read Fselec                   write Setselec;
    property tipor                  : string    read Ftipor                   write Settipor;
    property horaabertura           : Integer   read Fhoraabertura            write Sethoraabertura;
    property minabertura            : Integer   read Fminabertura             write Setminabertura;
    property horafechamento         : Integer   read Fhorafechamento          write Sethorafechamento;
    property minfechamento          : Integer   read Fminfechamento           write Setminfechamento;
    property horasubtotal           : Integer   read Fhorasubtotal            write Sethorasubtotal;
    property minsubtotal            : Integer   read Fminsubtotal             write Setminsubtotal;
    property ncupom                 : Integer   read Fncupom                  write Setncupom;
    property operador               : Integer   read Foperador                write Setoperador;
    property data_cupom             : TDateTime read Fdata_cupom              write Setdata_cupom;
    property da                     : string    read Fda                      write Setda;
    property nserieecf              : string    read Fnserieecf               write Setnserieecf;
    property nome_receb             : string    read Fnome_receb              write Setnome_receb;
    property end_receb              : string    read Fend_receb               write Setend_receb;
    property bairro_receb           : string    read Fbairro_receb            write Setbairro_receb;
    property cida_receb             : string    read Fcida_receb              write Setcida_receb;
    property cep_receb              : string    read Fcep_receb               write Setcep_receb;
    property fone_receb             : string    read Ffone_receb              write Setfone_receb;
    property obs_minuta             : TStrings  read Fobs_minuta              write Setobs_minuta;
    property grupo_prod             : Integer   read Fgrupo_prod              write Setgrupo_prod;
    property cod_prod               : string    read Fcod_prod                write Setcod_prod;
    property op_cxl                 : Integer   read Fop_cxl                  write Setop_cxl;
    property cod_cidade_receb       : Integer   read Fcod_cidade_receb        write Setcod_cidade_receb;
    property cod_bairro_receb       : Integer   read Fcod_bairro_receb        write Setcod_bairro_receb;
    property vl_entrada             : Double    read Fvl_entrada              write Setvl_entrada;
    property codigo_ctrl            : Integer   read Fcodigo_ctrl             write Setcodigo_ctrl;
    property nprevenda              : Integer   read Fnprevenda               write Setnprevenda;
    property stat_req               : string    read Fstat_req                write Setstat_req;
    property acresc_p_prod          : Double    read Facresc_p_prod           write Setacresc_p_prod;
    property acresc_p_serv          : Double    read Facresc_p_serv           write Setacresc_p_serv;
    property acrescimo              : Double    read Facrescimo               write Setacrescimo;
    property placa                  : string    read Fplaca                   write Setplaca;
    property chassi                 : string    read Fchassi                  write Setchassi;
    property km_v                   : Integer   read Fkm_v                    write Setkm_v;
    property orc_prod               : Integer   read Forc_prod                write Setorc_prod;
    property dt_prometida           : TDateTime read Fdt_prometida            write Setdt_prometida;
    property obs_os                 : TStrings  read Fobs_os                  write Setobs_os;
    property aparelho_ped           : string    read Faparelho_ped            write Setaparelho_ped;
    property guarda_vol             : string    read Fguarda_vol              write Setguarda_vol;
    property combust_veic           : string    read Fcombust_veic            write Setcombust_veic;
    property defeito                : TStrings  read Fdefeito                 write Setdefeito;
    property estado_veic            : TStrings  read Festado_veic             write Setestado_veic;
    property acessorios             : TStrings  read Facessorios              write Setacessorios;
    property tipo_os                : string    read Ftipo_os                 write Settipo_os;
    property h_ent                  : TDateTime read Fh_ent                   write Seth_ent;
    property h_prometida            : TDateTime read Fh_prometida             write Seth_prometida;
    property data_nf                : TDateTime read Fdata_nf                 write Setdata_nf;
    property dt_nfgarantia          : TDateTime read Fdt_nfgarantia           write Setdt_nfgarantia;
    property tot_prod               : Double    read Ftot_prod                write Settot_prod;
    property tot_serv               : Double    read Ftot_serv                write Settot_serv;
    property tp_abord               : string    read Ftp_abord                write Settp_abord;
    property fr_pagbosch            : string    read Ffr_pagbosch             write Setfr_pagbosch;
    property seq_fech               : Integer   read Fseq_fech                write Setseq_fech;
    property em_nf                  : string    read Fem_nf                   write Setem_nf;
    property cod_equip              : Integer   read Fcod_equip               write Setcod_equip;
    property n_serie                : string    read Fn_serie                 write Setn_serie;
    property num_nf                 : Integer   read Fnum_nf                  write Setnum_nf;
    property obs_livro_reg          : string    read Fobs_livro_reg           write Setobs_livro_reg;
    property valor_nf               : Double    read Fvalor_nf                write Setvalor_nf;
    property nf_pgarantia           : Integer   read Fnf_pgarantia            write Setnf_pgarantia;
    property nome_nf_garantia       : string    read Fnome_nf_garantia        write Setnome_nf_garantia;
    property hora_fech              : string    read Fhora_fech               write Sethora_fech;
    property st_term_serv           : string    read Fst_term_serv            write Setst_term_serv;
    property registro_de_entrega    : string    read Fregistro_de_entrega     write Setregistro_de_entrega;
    property ativo                  : Integer   read Fativo                   write Setativo;
    property tipo_orc               : string    read Ftipo_orc                write Settipo_orc;
    property status_cupom           : string    read Fstatus_cupom            write Setstatus_cupom;
    property codterm_status         : Integer   read Fcodterm_status          write Setcodterm_status;
    property cpfcgc                 : string    read Fcpfcgc                  write Setcpfcgc;
    property nome_cli_orc           : string    read Fnome_cli_orc            write Setnome_cli_orc;
    property cod_orcamento          : Integer   read Fcod_orcamento           write Setcod_orcamento;
    property obs_red_os             : string    read Fobs_red_os              write Setobs_red_os;
    property cod_veiculo            : Integer   read Fcod_veiculo             write Setcod_veiculo;
    property num_nfeext             : Int64     read Fnum_nfeext              write Setnum_nfeext;
    property data_nfext             : TDateTime read Fdata_nfext              write Setdata_nfext;
    property valor_nfext            : Double    read Fvalor_nfext             write Setvalor_nfext;
    property serie_nf               : string    read Fserie_nf                write Setserie_nf;
    property ccf_cupom              : Integer   read Fccf_cupom               write Setccf_cupom;
    property libtrava               : string    read Flibtrava                write Setlibtrava;
    property md5                    : string    read Fmd5                     write Setmd5;
    property dav_impresso           : string    read Fdav_impresso            write Setdav_impresso;
    property dependente             : Integer   read Fdependente              write Setdependente;
    property subtipo_os             : string    read Fsubtipo_os              write Setsubtipo_os;
    property cod_carga              : Integer   read Fcod_carga               write Setcod_carga;
    property aprovada_gerente       : string    read Faprovada_gerente        write Setaprovada_gerente;
    property npedmob                : Integer   read Fnpedmob                 write Setnpedmob;
    property idmobile               : Integer   read Fidmobile                write Setidmobile;
    property data_libtrava          : TDateTime read Fdata_libtrava           write Setdata_libtrava;
    property cod_nf                 : Integer   read Fcod_nf                  write Setcod_nf;
    property nf_gerou               : string    read Fnf_gerou                write Setnf_gerou;
    property cod_agendamento        : Integer   read Fcod_agendamento         write Setcod_agendamento;
    property status_contrato        : string    read Fstatus_contrato         write Setstatus_contrato;
    property nome_clientedav        : string    read Fnome_clientedav         write Setnome_clientedav;
    property md52                   : string    read Fmd52                    write Setmd52;
    property coo_impressao          : Integer   read Fcoo_impressao           write Setcoo_impressao;
    property nseriecf_impressao     : string    read Fnseriecf_impressao      write Setnseriecf_impressao;
    property operador_impressao     : Integer   read Foperador_impressao      write Setoperador_impressao;
    property paf_num_prevenda       : Integer   read Fpaf_num_prevenda        write Setpaf_num_prevenda;
    property paf_status_prevenda    : string    read Fpaf_status_prevenda     write Setpaf_status_prevenda;
    property nped_originado         : Integer   read Fnped_originado          write Setnped_originado;
    property tipo_originado         : string    read Ftipo_originado          write Settipo_originado;
    property cod_agenda             : Integer   read Fcod_agenda              write Setcod_agenda;
    property status_conta_cliente   : string    read Fstatus_conta_cliente    write Setstatus_conta_cliente;
    property coo_conta_cliente      : Integer   read Fcoo_conta_cliente       write Setcoo_conta_cliente;
    property cer_conta_cliente      : Integer   read Fcer_conta_cliente       write Setcer_conta_cliente;
    property codpesquisa            : Integer   read Fcodpesquisa             write Setcodpesquisa;
    property orcparavnd             : string    read Forcparavnd              write Setorcparavnd;
    property cod_controle           : Integer   read Fcod_controle            write Setcod_controle;
    property gerente_aprovou        : string    read Fgerente_aprovou         write Setgerente_aprovou;
    property valor_desc_avista      : Double    read Fvalor_desc_avista       write Setvalor_desc_avista;
    property metodo_entrega         : string    read Fmetodo_entrega          write Setmetodo_entrega;
    property autorizado_financeiro  : string    read Fautorizado_financeiro   write Setautorizado_financeiro;
    property n_comando              : Integer   read Fn_comando               write Setn_comando;
    property env_mobile             : string    read Fenv_mobile              write Setenv_mobile;
    property reaberto               : string    read Freaberto                write Setreaberto;
    property regras_descontos       : string    read Fregras_descontos        write Setregras_descontos;
    property status_sep_conf        : string    read Fstatus_sep_conf         write Setstatus_sep_conf;
    property nserieecf_conta_cliente: string    read Fnserieecf_conta_cliente write Setnserieecf_conta_cliente;
    property saveauto               : string    read Fsaveauto                write Setsaveauto;
    property calc                   : string    read Fcalc                    write Setcalc;
    property us_edit                : Integer   read Fus_edit                 write Setus_edit;
    property data_estoque           : TDateTime read Fdata_estoque            write Setdata_estoque;
    property cod_cliente_nfserv     : Integer   read Fcod_cliente_nfserv      write Setcod_cliente_nfserv;
    property qtde_libtrava          : Integer   read Fqtde_libtrava           write Setqtde_libtrava;
    property qtde_impressao         : Integer   read Fqtde_impressao          write Setqtde_impressao;
    property end_avl                : string    read Fend_avl                 write Setend_avl;
    property bairro_avl             : string    read Fbairro_avl              write Setbairro_avl;
    property cida_avl               : string    read Fcida_avl                write Setcida_avl;
    property cep_avl                : string    read Fcep_avl                 write Setcep_avl;
    property esta_avl               : string    read Festa_avl                write Setesta_avl;
    property cod_vendedor1          : Integer   read Fcod_vendedor1           write Setcod_vendedor1;
    property selos_col              : TStrings  read Fselos_col               write Setselos_col;
    property selos_rem              : TStrings  read Fselos_rem               write Setselos_rem;
    property lacres_col             : TStrings  read Flacres_col              write Setlacres_col;
    property lacres_rem             : TStrings  read Flacres_rem              write Setlacres_rem;
    property n_nfd                  : Integer   read Fn_nfd                   write Setn_nfd;
    property serie_nfd              : string    read Fserie_nfd               write Setserie_nfd;
    property nfd_gerou              : string    read Fnfd_gerou               write Setnfd_gerou;
    property data_nfd               : TDateTime read Fdata_nfd                write Setdata_nfd;
    property valor_nfd              : Double    read Fvalor_nfd               write Setvalor_nfd;
    property cod_cli_fat            : Integer   read Fcod_cli_fat             write Setcod_cli_fat;
    property cod_gerador            : Integer   read Fcod_gerador             write Setcod_gerador;
    property cod_nfce               : Integer   read Fcod_nfce                write Setcod_nfce;
    property env_email_nfs          : string    read Fenv_email_nfs           write Setenv_email_nfs;
    property tot_serv_terc          : Double    read Ftot_serv_terc           write Settot_serv_terc;
    property tot_prod_terc          : Double    read Ftot_prod_terc           write Settot_prod_terc;
    property tp_venda               : string    read Ftp_venda                write Settp_venda;
    property cl_clultimacompra      : string    read Fcl_clultimacompra       write Setcl_clultimacompra;
    property cl_status_f            : string    read Fcl_status_f             write Setcl_status_f;
    property tp_gerar_pontos        : string    read Ftp_gerar_pontos         write Settp_gerar_pontos;
    property vale_troca             : string    read Fvale_troca              write Setvale_troca;
    property valor_vale_prg         : Double    read Fvalor_vale_prg          write Setvalor_vale_prg;
    property dest_seqid             : Integer   read Fdest_seqid              write Setdest_seqid;
    property dest_seqid_entrg       : Integer   read Fdest_seqid_entrg        write Setdest_seqid_entrg;
    property cod_fatura             : Integer   read Fcod_fatura              write Setcod_fatura;
    property vl_comissao_vend       : Double    read Fvl_comissao_vend        write Setvl_comissao_vend;
    property perc_comissao_vend     : Double    read Fperc_comissao_vend      write Setperc_comissao_vend;
    property vl_comissao_vend1      : Double    read Fvl_comissao_vend1       write Setvl_comissao_vend1;
    property perc_comissao_vend1    : Double    read Fperc_comissao_vend1     write Setperc_comissao_vend1;
    property cont_alt               : Integer   read Fcont_alt                write Setcont_alt;
    property local_incidencia       : Integer   read Flocal_incidencia        write Setlocal_incidencia;
    property nf_ac_calctrib         : string    read Fnf_ac_calctrib          write Setnf_ac_calctrib;
    property nf_ac_seguro           : Double    read Fnf_ac_seguro            write Setnf_ac_seguro;
    property nf_ac_outras           : Double    read Fnf_ac_outras            write Setnf_ac_outras;
    property nf_ac_frete            : Double    read Fnf_ac_frete             write Setnf_ac_frete;
    property nf_ac_ipi              : Double    read Fnf_ac_ipi               write Setnf_ac_ipi;
    property nf_ac_icmsst           : Double    read Fnf_ac_icmsst            write Setnf_ac_icmsst;
    property nf_ac_fcpst            : Double    read Fnf_ac_fcpst             write Setnf_ac_fcpst;
    property nf_ac_imposto_ii       : Double    read Fnf_ac_imposto_ii        write Setnf_ac_imposto_ii;
    property nf_freteconta          : string    read Fnf_freteconta           write Setnf_freteconta;
    property id_commerce            : Integer   read Fid_commerce             write Setid_commerce;
    property cod_forma_rast         : Integer   read Fcod_forma_rast          write Setcod_forma_rast;
    property data_envio_rast        : TDateTime read Fdata_envio_rast         write Setdata_envio_rast;
    property cod_rastreamento       : string    read Fcod_rastreamento        write Setcod_rastreamento;
    property idsitped_ec            : Integer   read Fidsitped_ec             write Setidsitped_ec;
    property status_ec              : string    read Fstatus_ec               write Setstatus_ec;
    property nf_cf_deson_emb        : string    read Fnf_cf_deson_emb         write Setnf_cf_deson_emb;
    property nf_dc_desconto         : Double    read Fnf_dc_desconto          write Setnf_dc_desconto;
    property nf_dc_vicmdeson        : Double    read Fnf_dc_vicmdeson         write Setnf_dc_vicmdeson;
    property nf_ac_vicmdeson        : Double    read Fnf_ac_vicmdeson         write Setnf_ac_vicmdeson;
    property finalidadeid           : Integer   read Ffinalidadeid            write Setfinalidadeid;
  end;

  TPedvenda_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TPedvenda_class;
    procedure SetItem(Index: Integer; const Value: TPedvenda_class);
  public
    function New: TPedvenda_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TPedvenda_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TPedvenda_class }

constructor TPedvenda_class.Create;
begin
  Ftable      := TTable_fb.Create('PEDVENDA',
                                  'NPED, TIPO, COD_EMPRESA',
                                  'COD_VENDEDOR1, COD_CLI_FAT, COD_CLIENTE, COD_CONTROLE, COD_COND_PAG, COD_EMPRESA',
                                  GetFieldsSql());
  obs_minuta  := TStringList.Create;
  obs_os      := TStringList.Create;
  defeito     := TStringList.Create;
  estado_veic := TStringList.Create;
  acessorios  := TStringList.Create;
  Fativo      := 1;
  selos_col   := TStringList.Create;
  selos_rem   := TStringList.Create;
  lacres_col  := TStringList.Create;
  lacres_rem  := TStringList.Create;
end;

destructor TPedvenda_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  if Assigned(Fobs_minuta) then
    FreeAndNil(Fobs_minuta);
  if Assigned(Fobs_os) then
    FreeAndNil(Fobs_os);
  if Assigned(Fdefeito) then
    FreeAndNil(Fdefeito);
  if Assigned(Festado_veic) then
    FreeAndNil(Festado_veic);
  if Assigned(Facessorios) then
    FreeAndNil(Facessorios);
  if Assigned(Fselos_col) then
    FreeAndNil(Fselos_col);
  if Assigned(Fselos_rem) then
    FreeAndNil(Fselos_rem);
  if Assigned(Flacres_col) then
    FreeAndNil(Flacres_col);
  if Assigned(Flacres_rem) then
    FreeAndNil(Flacres_rem);
  inherited;
end;

class function TPedvenda_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@nped, @tipo, @cod_empresa, @cod_cliente, @cod_vendedor, @cod_cond_pag, @cod_us_fech, @n_mov_cxl, @dia_cxl,' +
            ' @data_ped, @data_fech, @datvenc, @valor_total, @desc_p_prod, @desc_p_serv, @desconto, @obs_ped, @status_ped,' +
            ' @tipv, @obs_cxl_rq, @status_cxl_rq, @vl_pago_cxl, @selec, @tipor, @horaabertura, @minabertura,' +
            ' @horafechamento, @minfechamento, @horasubtotal, @minsubtotal, @ncupom, @operador, @data_cupom, @da,' +
            ' @nserieecf, @nome_receb, @end_receb, @bairro_receb, @cida_receb, @cep_receb, @fone_receb, @obs_minuta,' +
            ' @grupo_prod, @cod_prod, @op_cxl, @cod_cidade_receb, @cod_bairro_receb, @vl_entrada, @codigo_ctrl,' +
            ' @nprevenda, @stat_req, @acresc_p_prod, @acresc_p_serv, @acrescimo, @placa, @chassi, @km_v, @orc_prod,' +
            ' @dt_prometida, @obs_os, @aparelho_ped, @guarda_vol, @combust_veic, @defeito, @estado_veic, @acessorios,' +
            ' @tipo_os, @h_ent, @h_prometida, @data_nf, @dt_nfgarantia, @tot_prod, @tot_serv, @tp_abord, @fr_pagbosch,' +
            ' @seq_fech, @em_nf, @cod_equip, @n_serie, @num_nf, @obs_livro_reg, @valor_nf, @nf_pgarantia,' +
            ' @nome_nf_garantia, @hora_fech, @st_term_serv, @registro_de_entrega, @ativo, @tipo_orc, @status_cupom,' +
            ' @codterm_status, @cpfcgc, @nome_cli_orc, @cod_orcamento, @obs_red_os, @cod_veiculo, @num_nfeext,' +
            ' @data_nfext, @valor_nfext, @serie_nf, @ccf_cupom, @libtrava, @md5, @dav_impresso, @dependente, @subtipo_os,' +
            ' @cod_carga, @aprovada_gerente, @npedmob, @idmobile, @data_libtrava, @cod_nf, @nf_gerou, @cod_agendamento,' +
            ' @status_contrato, @nome_clientedav, @md52, @coo_impressao, @nseriecf_impressao, @operador_impressao,' +
            ' @paf_num_prevenda, @paf_status_prevenda, @nped_originado, @tipo_originado, @cod_agenda,' +
            ' @status_conta_cliente, @coo_conta_cliente, @cer_conta_cliente, @codpesquisa, @orcparavnd, @cod_controle,' +
            ' @gerente_aprovou, @valor_desc_avista, @metodo_entrega, @autorizado_financeiro, @n_comando, @env_mobile,' +
            ' @reaberto, @regras_descontos, @status_sep_conf, @nserieecf_conta_cliente, @saveauto, @calc, @us_edit,' +
            ' @data_estoque, @cod_cliente_nfserv, @qtde_libtrava, @qtde_impressao, @end_avl, @bairro_avl, @cida_avl,' +
            ' @cep_avl, @esta_avl, @cod_vendedor1, @selos_col, @selos_rem, @lacres_col, @lacres_rem, @n_nfd, @serie_nfd,' +
            ' @nfd_gerou, @data_nfd, @valor_nfd, @cod_gerador, @cod_nfce, @env_email_nfs, @tot_serv_terc, @tot_prod_terc,' +
            ' @tp_venda, @cl_clultimacompra, @cl_status_f, @tp_gerar_pontos, @vale_troca, @valor_vale_prg, @dest_seqid,' +
            ' @dest_seqid_entrg, @cod_fatura, @vl_comissao_vend, @perc_comissao_vend, @vl_comissao_vend1,' +
            ' @perc_comissao_vend1, @cont_alt, @local_incidencia, @nf_ac_calctrib, @nf_ac_seguro, @nf_ac_outras,' +
            ' @nf_ac_frete, @nf_ac_ipi, @nf_ac_icmsst, @nf_ac_fcpst, @nf_ac_imposto_ii, @nf_freteconta, @id_commerce,' +
            ' @cod_forma_rast, @data_envio_rast, @cod_rastreamento, @idsitped_ec, @status_ec, @nf_cf_deson_emb,' +
            ' @nf_dc_desconto, @nf_dc_vicmdeson, @nf_ac_vicmdeson, @finalidadeid, @cod_cli_fat';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedvenda_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    nped                    := ADataSet.FieldByName('NPED').AsInteger;
    tipo                    := Trim(ADataSet.FieldByName('TIPO').AsString);
    cod_empresa             := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    cod_cliente             := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    cod_vendedor            := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    cod_cond_pag            := ADataSet.FieldByName('COD_COND_PAG').AsInteger;
    cod_us_fech             := ADataSet.FieldByName('COD_US_FECH').AsInteger;
    n_mov_cxl               := ADataSet.FieldByName('N_MOV_CXL').AsInteger;
    dia_cxl                 := ADataSet.FieldByName('DIA_CXL').AsDateTime;
    data_ped                := ADataSet.FieldByName('DATA_PED').AsDateTime;
    data_fech               := ADataSet.FieldByName('DATA_FECH').AsDateTime;
    datvenc                 := ADataSet.FieldByName('DATVENC').AsDateTime;
    valor_total             := ADataSet.FieldByName('VALOR_TOTAL').AsFloat;
    desc_p_prod             := ADataSet.FieldByName('DESC_P_PROD').AsFloat;
    desc_p_serv             := ADataSet.FieldByName('DESC_P_SERV').AsFloat;
    desconto                := ADataSet.FieldByName('DESCONTO').AsFloat;
    obs_ped                 := Trim(ADataSet.FieldByName('OBS_PED').AsString);
    status_ped              := Trim(ADataSet.FieldByName('STATUS_PED').AsString);
    tipv                    := Trim(ADataSet.FieldByName('TIPV').AsString);
    obs_cxl_rq              := Trim(ADataSet.FieldByName('OBS_CXL_RQ').AsString);
    status_cxl_rq           := Trim(ADataSet.FieldByName('STATUS_CXL_RQ').AsString);
    vl_pago_cxl             := ADataSet.FieldByName('VL_PAGO_CXL').AsFloat;
    selec                   := Trim(ADataSet.FieldByName('SELEC').AsString);
    tipor                   := Trim(ADataSet.FieldByName('TIPOR').AsString);
    horaabertura            := ADataSet.FieldByName('HORAABERTURA').AsInteger;
    minabertura             := ADataSet.FieldByName('MINABERTURA').AsInteger;
    horafechamento          := ADataSet.FieldByName('HORAFECHAMENTO').AsInteger;
    minfechamento           := ADataSet.FieldByName('MINFECHAMENTO').AsInteger;
    horasubtotal            := ADataSet.FieldByName('HORASUBTOTAL').AsInteger;
    minsubtotal             := ADataSet.FieldByName('MINSUBTOTAL').AsInteger;
    ncupom                  := ADataSet.FieldByName('NCUPOM').AsInteger;
    operador                := ADataSet.FieldByName('OPERADOR').AsInteger;
    data_cupom              := ADataSet.FieldByName('DATA_CUPOM').AsDateTime;
    da                      := Trim(ADataSet.FieldByName('DA').AsString);
    nserieecf               := Trim(ADataSet.FieldByName('NSERIEECF').AsString);
    nome_receb              := Trim(ADataSet.FieldByName('NOME_RECEB').AsString);
    end_receb               := Trim(ADataSet.FieldByName('END_RECEB').AsString);
    bairro_receb            := Trim(ADataSet.FieldByName('BAIRRO_RECEB').AsString);
    cida_receb              := Trim(ADataSet.FieldByName('CIDA_RECEB').AsString);
    cep_receb               := Trim(ADataSet.FieldByName('CEP_RECEB').AsString);
    fone_receb              := Trim(ADataSet.FieldByName('FONE_RECEB').AsString);
    obs_minuta.Text         := Trim(ADataSet.FieldByName('OBS_MINUTA').AsString);
    Setobs_minuta(Fobs_minuta);
    grupo_prod              := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    cod_prod                := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    op_cxl                  := ADataSet.FieldByName('OP_CXL').AsInteger;
    cod_cidade_receb        := ADataSet.FieldByName('COD_CIDADE_RECEB').AsInteger;
    cod_bairro_receb        := ADataSet.FieldByName('COD_BAIRRO_RECEB').AsInteger;
    vl_entrada              := ADataSet.FieldByName('VL_ENTRADA').AsFloat;
    codigo_ctrl             := ADataSet.FieldByName('CODIGO_CTRL').AsInteger;
    nprevenda               := ADataSet.FieldByName('NPREVENDA').AsInteger;
    stat_req                := Trim(ADataSet.FieldByName('STAT_REQ').AsString);
    acresc_p_prod           := ADataSet.FieldByName('ACRESC_P_PROD').AsFloat;
    acresc_p_serv           := ADataSet.FieldByName('ACRESC_P_SERV').AsFloat;
    acrescimo               := ADataSet.FieldByName('ACRESCIMO').AsFloat;
    placa                   := Trim(ADataSet.FieldByName('PLACA').AsString);
    chassi                  := Trim(ADataSet.FieldByName('CHASSI').AsString);
    km_v                    := ADataSet.FieldByName('KM_V').AsInteger;
    orc_prod                := ADataSet.FieldByName('ORC_PROD').AsInteger;
    dt_prometida            := ADataSet.FieldByName('DT_PROMETIDA').AsDateTime;
    obs_os.Text             := Trim(ADataSet.FieldByName('OBS_OS').AsString);
    Setobs_os(Fobs_os);
    aparelho_ped            := Trim(ADataSet.FieldByName('APARELHO_PED').AsString);
    guarda_vol              := Trim(ADataSet.FieldByName('GUARDA_VOL').AsString);
    combust_veic            := Trim(ADataSet.FieldByName('COMBUST_VEIC').AsString);
    defeito.Text            := Trim(ADataSet.FieldByName('DEFEITO').AsString);
    Setdefeito(Fdefeito);
    estado_veic.Text        := Trim(ADataSet.FieldByName('ESTADO_VEIC').AsString);
    Setestado_veic(Festado_veic);
    acessorios.Text         := Trim(ADataSet.FieldByName('ACESSORIOS').AsString);
    Setacessorios(Facessorios);
    tipo_os                 := Trim(ADataSet.FieldByName('TIPO_OS').AsString);
    h_ent                   := ADataSet.FieldByName('H_ENT').AsDateTime;
    h_prometida             := ADataSet.FieldByName('H_PROMETIDA').AsDateTime;
    data_nf                 := ADataSet.FieldByName('DATA_NF').AsDateTime;
    dt_nfgarantia           := ADataSet.FieldByName('DT_NFGARANTIA').AsDateTime;
    tot_prod                := ADataSet.FieldByName('TOT_PROD').AsFloat;
    tot_serv                := ADataSet.FieldByName('TOT_SERV').AsFloat;
    tp_abord                := Trim(ADataSet.FieldByName('TP_ABORD').AsString);
    fr_pagbosch             := Trim(ADataSet.FieldByName('FR_PAGBOSCH').AsString);
    seq_fech                := ADataSet.FieldByName('SEQ_FECH').AsInteger;
    em_nf                   := Trim(ADataSet.FieldByName('EM_NF').AsString);
    cod_equip               := ADataSet.FieldByName('COD_EQUIP').AsInteger;
    n_serie                 := Trim(ADataSet.FieldByName('N_SERIE').AsString);
    num_nf                  := ADataSet.FieldByName('NUM_NF').AsInteger;
    obs_livro_reg           := Trim(ADataSet.FieldByName('OBS_LIVRO_REG').AsString);
    valor_nf                := ADataSet.FieldByName('VALOR_NF').AsFloat;
    nf_pgarantia            := ADataSet.FieldByName('NF_PGARANTIA').AsInteger;
    nome_nf_garantia        := Trim(ADataSet.FieldByName('NOME_NF_GARANTIA').AsString);
    hora_fech               := Trim(ADataSet.FieldByName('HORA_FECH').AsString);
    st_term_serv            := Trim(ADataSet.FieldByName('ST_TERM_SERV').AsString);
    registro_de_entrega     := Trim(ADataSet.FieldByName('REGISTRO_DE_ENTREGA').AsString);
    ativo                   := ADataSet.FieldByName('ATIVO').AsInteger;
    tipo_orc                := Trim(ADataSet.FieldByName('TIPO_ORC').AsString);
    status_cupom            := Trim(ADataSet.FieldByName('STATUS_CUPOM').AsString);
    codterm_status          := ADataSet.FieldByName('CODTERM_STATUS').AsInteger;
    cpfcgc                  := Trim(ADataSet.FieldByName('CPFCGC').AsString);
    nome_cli_orc            := Trim(ADataSet.FieldByName('NOME_CLI_ORC').AsString);
    cod_orcamento           := ADataSet.FieldByName('COD_ORCAMENTO').AsInteger;
    obs_red_os              := Trim(ADataSet.FieldByName('OBS_RED_OS').AsString);
    cod_veiculo             := ADataSet.FieldByName('COD_VEICULO').AsInteger;
    num_nfeext              := ADataSet.FieldByName('NUM_NFEEXT').AsInteger;
    data_nfext              := ADataSet.FieldByName('DATA_NFEXT').AsDateTime;
    valor_nfext             := ADataSet.FieldByName('VALOR_NFEXT').AsFloat;
    serie_nf                := Trim(ADataSet.FieldByName('SERIE_NF').AsString);
    ccf_cupom               := ADataSet.FieldByName('CCF_CUPOM').AsInteger;
    libtrava                := Trim(ADataSet.FieldByName('LIBTRAVA').AsString);
    md5                     := Trim(ADataSet.FieldByName('MD5').AsString);
    dav_impresso            := Trim(ADataSet.FieldByName('DAV_IMPRESSO').AsString);
    dependente              := ADataSet.FieldByName('DEPENDENTE').AsInteger;
    subtipo_os              := Trim(ADataSet.FieldByName('SUBTIPO_OS').AsString);
    cod_carga               := ADataSet.FieldByName('COD_CARGA').AsInteger;
    aprovada_gerente        := Trim(ADataSet.FieldByName('APROVADA_GERENTE').AsString);
    npedmob                 := ADataSet.FieldByName('NPEDMOB').AsInteger;
    idmobile                := ADataSet.FieldByName('IDMOBILE').AsInteger;
    data_libtrava           := ADataSet.FieldByName('DATA_LIBTRAVA').AsDateTime;
    cod_nf                  := ADataSet.FieldByName('COD_NF').AsInteger;
    nf_gerou                := Trim(ADataSet.FieldByName('NF_GEROU').AsString);
    cod_agendamento         := ADataSet.FieldByName('COD_AGENDAMENTO').AsInteger;
    status_contrato         := Trim(ADataSet.FieldByName('STATUS_CONTRATO').AsString);
    nome_clientedav         := Trim(ADataSet.FieldByName('NOME_CLIENTEDAV').AsString);
    md52                    := Trim(ADataSet.FieldByName('MD52').AsString);
    coo_impressao           := ADataSet.FieldByName('COO_IMPRESSAO').AsInteger;
    nseriecf_impressao      := Trim(ADataSet.FieldByName('NSERIECF_IMPRESSAO').AsString);
    operador_impressao      := ADataSet.FieldByName('OPERADOR_IMPRESSAO').AsInteger;
    paf_num_prevenda        := ADataSet.FieldByName('PAF_NUM_PREVENDA').AsInteger;
    paf_status_prevenda     := Trim(ADataSet.FieldByName('PAF_STATUS_PREVENDA').AsString);
    nped_originado          := ADataSet.FieldByName('NPED_ORIGINADO').AsInteger;
    tipo_originado          := Trim(ADataSet.FieldByName('TIPO_ORIGINADO').AsString);
    cod_agenda              := ADataSet.FieldByName('COD_AGENDA').AsInteger;
    status_conta_cliente    := Trim(ADataSet.FieldByName('STATUS_CONTA_CLIENTE').AsString);
    coo_conta_cliente       := ADataSet.FieldByName('COO_CONTA_CLIENTE').AsInteger;
    cer_conta_cliente       := ADataSet.FieldByName('CER_CONTA_CLIENTE').AsInteger;
    codpesquisa             := ADataSet.FieldByName('CODPESQUISA').AsInteger;
    orcparavnd              := Trim(ADataSet.FieldByName('ORCPARAVND').AsString);
    cod_controle            := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    gerente_aprovou         := Trim(ADataSet.FieldByName('GERENTE_APROVOU').AsString);
    valor_desc_avista       := ADataSet.FieldByName('VALOR_DESC_AVISTA').AsFloat;
    metodo_entrega          := Trim(ADataSet.FieldByName('METODO_ENTREGA').AsString);
    autorizado_financeiro   := Trim(ADataSet.FieldByName('AUTORIZADO_FINANCEIRO').AsString);
    n_comando               := ADataSet.FieldByName('N_COMANDO').AsInteger;
    env_mobile              := Trim(ADataSet.FieldByName('ENV_MOBILE').AsString);
    reaberto                := Trim(ADataSet.FieldByName('REABERTO').AsString);
    regras_descontos        := Trim(ADataSet.FieldByName('REGRAS_DESCONTOS').AsString);
    status_sep_conf         := Trim(ADataSet.FieldByName('STATUS_SEP_CONF').AsString);
    nserieecf_conta_cliente := Trim(ADataSet.FieldByName('NSERIEECF_CONTA_CLIENTE').AsString);
    saveauto                := Trim(ADataSet.FieldByName('SAVEAUTO').AsString);
    calc                    := Trim(ADataSet.FieldByName('CALC').AsString);
    us_edit                 := ADataSet.FieldByName('US_EDIT').AsInteger;
    data_estoque            := ADataSet.FieldByName('DATA_ESTOQUE').AsDateTime;
    cod_cliente_nfserv      := ADataSet.FieldByName('COD_CLIENTE_NFSERV').AsInteger;
    qtde_libtrava           := ADataSet.FieldByName('QTDE_LIBTRAVA').AsInteger;
    qtde_impressao          := ADataSet.FieldByName('QTDE_IMPRESSAO').AsInteger;
    end_avl                 := Trim(ADataSet.FieldByName('END_AVL').AsString);
    bairro_avl              := Trim(ADataSet.FieldByName('BAIRRO_AVL').AsString);
    cida_avl                := Trim(ADataSet.FieldByName('CIDA_AVL').AsString);
    cep_avl                 := Trim(ADataSet.FieldByName('CEP_AVL').AsString);
    esta_avl                := Trim(ADataSet.FieldByName('ESTA_AVL').AsString);
    cod_vendedor1           := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    selos_col.Text          := Trim(ADataSet.FieldByName('SELOS_COL').AsString);
    Setselos_col(Fselos_col);
    selos_rem.Text          := Trim(ADataSet.FieldByName('SELOS_REM').AsString);
    Setselos_rem(Fselos_rem);
    lacres_col.Text         := Trim(ADataSet.FieldByName('LACRES_COL').AsString);
    Setlacres_col(Flacres_col);
    lacres_rem.Text         := Trim(ADataSet.FieldByName('LACRES_REM').AsString);
    Setlacres_rem(Flacres_rem);
    n_nfd                   := ADataSet.FieldByName('N_NFD').AsInteger;
    serie_nfd               := Trim(ADataSet.FieldByName('SERIE_NFD').AsString);
    nfd_gerou               := Trim(ADataSet.FieldByName('NFD_GEROU').AsString);
    data_nfd                := ADataSet.FieldByName('DATA_NFD').AsDateTime;
    valor_nfd               := ADataSet.FieldByName('VALOR_NFD').AsFloat;
    cod_cli_fat             := ADataSet.FieldByName('COD_CLI_FAT').AsInteger;
    cod_gerador             := ADataSet.FieldByName('COD_GERADOR').AsInteger;
    cod_nfce                := ADataSet.FieldByName('COD_NFCE').AsInteger;
    env_email_nfs           := Trim(ADataSet.FieldByName('ENV_EMAIL_NFS').AsString);
    tot_serv_terc           := ADataSet.FieldByName('TOT_SERV_TERC').AsFloat;
    tot_prod_terc           := ADataSet.FieldByName('TOT_PROD_TERC').AsFloat;
    tp_venda                := Trim(ADataSet.FieldByName('TP_VENDA').AsString);
    cl_clultimacompra       := Trim(ADataSet.FieldByName('CL_CLULTIMACOMPRA').AsString);
    cl_status_f             := Trim(ADataSet.FieldByName('CL_STATUS_F').AsString);
    tp_gerar_pontos         := Trim(ADataSet.FieldByName('TP_GERAR_PONTOS').AsString);
    vale_troca              := Trim(ADataSet.FieldByName('VALE_TROCA').AsString);
    valor_vale_prg          := ADataSet.FieldByName('VALOR_VALE_PRG').AsFloat;
    dest_seqid              := ADataSet.FieldByName('DEST_SEQID').AsInteger;
    dest_seqid_entrg        := ADataSet.FieldByName('DEST_SEQID_ENTRG').AsInteger;
    cod_fatura              := ADataSet.FieldByName('COD_FATURA').AsInteger;
    vl_comissao_vend        := ADataSet.FieldByName('VL_COMISSAO_VEND').AsFloat;
    perc_comissao_vend      := ADataSet.FieldByName('PERC_COMISSAO_VEND').AsFloat;
    vl_comissao_vend1       := ADataSet.FieldByName('VL_COMISSAO_VEND1').AsFloat;
    perc_comissao_vend1     := ADataSet.FieldByName('PERC_COMISSAO_VEND1').AsFloat;
    cont_alt                := ADataSet.FieldByName('CONT_ALT').AsInteger;
    local_incidencia        := ADataSet.FieldByName('LOCAL_INCIDENCIA').AsInteger;
    nf_ac_calctrib          := Trim(ADataSet.FieldByName('NF_AC_CALCTRIB').AsString);
    nf_ac_seguro            := ADataSet.FieldByName('NF_AC_SEGURO').AsFloat;
    nf_ac_outras            := ADataSet.FieldByName('NF_AC_OUTRAS').AsFloat;
    nf_ac_frete             := ADataSet.FieldByName('NF_AC_FRETE').AsFloat;
    nf_ac_ipi               := ADataSet.FieldByName('NF_AC_IPI').AsFloat;
    nf_ac_icmsst            := ADataSet.FieldByName('NF_AC_ICMSST').AsFloat;
    nf_ac_fcpst             := ADataSet.FieldByName('NF_AC_FCPST').AsFloat;
    nf_ac_imposto_ii        := ADataSet.FieldByName('NF_AC_IMPOSTO_II').AsFloat;
    nf_freteconta           := Trim(ADataSet.FieldByName('NF_FRETECONTA').AsString);
    id_commerce             := ADataSet.FieldByName('ID_COMMERCE').AsInteger;
    cod_forma_rast          := ADataSet.FieldByName('COD_FORMA_RAST').AsInteger;
    data_envio_rast         := ADataSet.FieldByName('DATA_ENVIO_RAST').AsDateTime;
    cod_rastreamento        := Trim(ADataSet.FieldByName('COD_RASTREAMENTO').AsString);
    idsitped_ec             := ADataSet.FieldByName('IDSITPED_EC').AsInteger;
    status_ec               := Trim(ADataSet.FieldByName('STATUS_EC').AsString);
    nf_cf_deson_emb         := Trim(ADataSet.FieldByName('NF_CF_DESON_EMB').AsString);
    nf_dc_desconto          := ADataSet.FieldByName('NF_DC_DESCONTO').AsFloat;
    nf_dc_vicmdeson         := ADataSet.FieldByName('NF_DC_VICMDESON').AsFloat;
    nf_ac_vicmdeson         := ADataSet.FieldByName('NF_AC_VICMDESON').AsFloat;
    finalidadeid            := ADataSet.FieldByName('FINALIDADEID').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('NPED'                   )) then nped                    := ADataSet.FieldByName('NPED').AsInteger;
    if Assigned(ADataSet.FindField('TIPO'                   )) then tipo                    := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA'            )) then cod_empresa             := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_CLIENTE'            )) then cod_cliente             := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('COD_VENDEDOR'           )) then cod_vendedor            := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    if Assigned(ADataSet.FindField('COD_COND_PAG'           )) then cod_cond_pag            := ADataSet.FieldByName('COD_COND_PAG').AsInteger;
    if Assigned(ADataSet.FindField('COD_US_FECH'            )) then cod_us_fech             := ADataSet.FieldByName('COD_US_FECH').AsInteger;
    if Assigned(ADataSet.FindField('N_MOV_CXL'              )) then n_mov_cxl               := ADataSet.FieldByName('N_MOV_CXL').AsInteger;
    if Assigned(ADataSet.FindField('DIA_CXL'                )) then dia_cxl                 := ADataSet.FieldByName('DIA_CXL').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_PED'               )) then data_ped                := ADataSet.FieldByName('DATA_PED').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_FECH'              )) then data_fech               := ADataSet.FieldByName('DATA_FECH').AsDateTime;
    if Assigned(ADataSet.FindField('DATVENC'                )) then datvenc                 := ADataSet.FieldByName('DATVENC').AsDateTime;
    if Assigned(ADataSet.FindField('VALOR_TOTAL'            )) then valor_total             := ADataSet.FieldByName('VALOR_TOTAL').AsFloat;
    if Assigned(ADataSet.FindField('DESC_P_PROD'            )) then desc_p_prod             := ADataSet.FieldByName('DESC_P_PROD').AsFloat;
    if Assigned(ADataSet.FindField('DESC_P_SERV'            )) then desc_p_serv             := ADataSet.FieldByName('DESC_P_SERV').AsFloat;
    if Assigned(ADataSet.FindField('DESCONTO'               )) then desconto                := ADataSet.FieldByName('DESCONTO').AsFloat;
    if Assigned(ADataSet.FindField('OBS_PED'                )) then obs_ped                 := Trim(ADataSet.FieldByName('OBS_PED').AsString);
    if Assigned(ADataSet.FindField('STATUS_PED'             )) then status_ped              := Trim(ADataSet.FieldByName('STATUS_PED').AsString);
    if Assigned(ADataSet.FindField('TIPV'                   )) then tipv                    := Trim(ADataSet.FieldByName('TIPV').AsString);
    if Assigned(ADataSet.FindField('OBS_CXL_RQ'             )) then obs_cxl_rq              := Trim(ADataSet.FieldByName('OBS_CXL_RQ').AsString);
    if Assigned(ADataSet.FindField('STATUS_CXL_RQ'          )) then status_cxl_rq           := Trim(ADataSet.FieldByName('STATUS_CXL_RQ').AsString);
    if Assigned(ADataSet.FindField('VL_PAGO_CXL'            )) then vl_pago_cxl             := ADataSet.FieldByName('VL_PAGO_CXL').AsFloat;
    if Assigned(ADataSet.FindField('SELEC'                  )) then selec                   := Trim(ADataSet.FieldByName('SELEC').AsString);
    if Assigned(ADataSet.FindField('TIPOR'                  )) then tipor                   := Trim(ADataSet.FieldByName('TIPOR').AsString);
    if Assigned(ADataSet.FindField('HORAABERTURA'           )) then horaabertura            := ADataSet.FieldByName('HORAABERTURA').AsInteger;
    if Assigned(ADataSet.FindField('MINABERTURA'            )) then minabertura             := ADataSet.FieldByName('MINABERTURA').AsInteger;
    if Assigned(ADataSet.FindField('HORAFECHAMENTO'         )) then horafechamento          := ADataSet.FieldByName('HORAFECHAMENTO').AsInteger;
    if Assigned(ADataSet.FindField('MINFECHAMENTO'          )) then minfechamento           := ADataSet.FieldByName('MINFECHAMENTO').AsInteger;
    if Assigned(ADataSet.FindField('HORASUBTOTAL'           )) then horasubtotal            := ADataSet.FieldByName('HORASUBTOTAL').AsInteger;
    if Assigned(ADataSet.FindField('MINSUBTOTAL'            )) then minsubtotal             := ADataSet.FieldByName('MINSUBTOTAL').AsInteger;
    if Assigned(ADataSet.FindField('NCUPOM'                 )) then ncupom                  := ADataSet.FieldByName('NCUPOM').AsInteger;
    if Assigned(ADataSet.FindField('OPERADOR'               )) then operador                := ADataSet.FieldByName('OPERADOR').AsInteger;
    if Assigned(ADataSet.FindField('DATA_CUPOM'             )) then data_cupom              := ADataSet.FieldByName('DATA_CUPOM').AsDateTime;
    if Assigned(ADataSet.FindField('DA'                     )) then da                      := Trim(ADataSet.FieldByName('DA').AsString);
    if Assigned(ADataSet.FindField('NSERIEECF'              )) then nserieecf               := Trim(ADataSet.FieldByName('NSERIEECF').AsString);
    if Assigned(ADataSet.FindField('NOME_RECEB'             )) then nome_receb              := Trim(ADataSet.FieldByName('NOME_RECEB').AsString);
    if Assigned(ADataSet.FindField('END_RECEB'              )) then end_receb               := Trim(ADataSet.FieldByName('END_RECEB').AsString);
    if Assigned(ADataSet.FindField('BAIRRO_RECEB'           )) then bairro_receb            := Trim(ADataSet.FieldByName('BAIRRO_RECEB').AsString);
    if Assigned(ADataSet.FindField('CIDA_RECEB'             )) then cida_receb              := Trim(ADataSet.FieldByName('CIDA_RECEB').AsString);
    if Assigned(ADataSet.FindField('CEP_RECEB'              )) then cep_receb               := Trim(ADataSet.FieldByName('CEP_RECEB').AsString);
    if Assigned(ADataSet.FindField('FONE_RECEB'             )) then fone_receb              := Trim(ADataSet.FieldByName('FONE_RECEB').AsString);
    if Assigned(ADataSet.FindField('OBS_MINUTA'             )) then obs_minuta.Text         := Trim(ADataSet.FieldByName('OBS_MINUTA').AsString);
    if Assigned(ADataSet.FindField('OBS_MINUTA'             )) then Setobs_minuta(Fobs_minuta);
    if Assigned(ADataSet.FindField('GRUPO_PROD'             )) then grupo_prod              := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'               )) then cod_prod                := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('OP_CXL'                 )) then op_cxl                  := ADataSet.FieldByName('OP_CXL').AsInteger;
    if Assigned(ADataSet.FindField('COD_CIDADE_RECEB'       )) then cod_cidade_receb        := ADataSet.FieldByName('COD_CIDADE_RECEB').AsInteger;
    if Assigned(ADataSet.FindField('COD_BAIRRO_RECEB'       )) then cod_bairro_receb        := ADataSet.FieldByName('COD_BAIRRO_RECEB').AsInteger;
    if Assigned(ADataSet.FindField('VL_ENTRADA'             )) then vl_entrada              := ADataSet.FieldByName('VL_ENTRADA').AsFloat;
    if Assigned(ADataSet.FindField('CODIGO_CTRL'            )) then codigo_ctrl             := ADataSet.FieldByName('CODIGO_CTRL').AsInteger;
    if Assigned(ADataSet.FindField('NPREVENDA'              )) then nprevenda               := ADataSet.FieldByName('NPREVENDA').AsInteger;
    if Assigned(ADataSet.FindField('STAT_REQ'               )) then stat_req                := Trim(ADataSet.FieldByName('STAT_REQ').AsString);
    if Assigned(ADataSet.FindField('ACRESC_P_PROD'          )) then acresc_p_prod           := ADataSet.FieldByName('ACRESC_P_PROD').AsFloat;
    if Assigned(ADataSet.FindField('ACRESC_P_SERV'          )) then acresc_p_serv           := ADataSet.FieldByName('ACRESC_P_SERV').AsFloat;
    if Assigned(ADataSet.FindField('ACRESCIMO'              )) then acrescimo               := ADataSet.FieldByName('ACRESCIMO').AsFloat;
    if Assigned(ADataSet.FindField('PLACA'                  )) then placa                   := Trim(ADataSet.FieldByName('PLACA').AsString);
    if Assigned(ADataSet.FindField('CHASSI'                 )) then chassi                  := Trim(ADataSet.FieldByName('CHASSI').AsString);
    if Assigned(ADataSet.FindField('KM_V'                   )) then km_v                    := ADataSet.FieldByName('KM_V').AsInteger;
    if Assigned(ADataSet.FindField('ORC_PROD'               )) then orc_prod                := ADataSet.FieldByName('ORC_PROD').AsInteger;
    if Assigned(ADataSet.FindField('DT_PROMETIDA'           )) then dt_prometida            := ADataSet.FieldByName('DT_PROMETIDA').AsDateTime;
    if Assigned(ADataSet.FindField('OBS_OS'                 )) then obs_os.Text             := Trim(ADataSet.FieldByName('OBS_OS').AsString);
    if Assigned(ADataSet.FindField('OBS_OS'                 )) then Setobs_os(Fobs_os);
    if Assigned(ADataSet.FindField('APARELHO_PED'           )) then aparelho_ped            := Trim(ADataSet.FieldByName('APARELHO_PED').AsString);
    if Assigned(ADataSet.FindField('GUARDA_VOL'             )) then guarda_vol              := Trim(ADataSet.FieldByName('GUARDA_VOL').AsString);
    if Assigned(ADataSet.FindField('COMBUST_VEIC'           )) then combust_veic            := Trim(ADataSet.FieldByName('COMBUST_VEIC').AsString);
    if Assigned(ADataSet.FindField('DEFEITO'                )) then defeito.Text            := Trim(ADataSet.FieldByName('DEFEITO').AsString);
    if Assigned(ADataSet.FindField('DEFEITO'                )) then Setdefeito(Fdefeito);
    if Assigned(ADataSet.FindField('ESTADO_VEIC'            )) then estado_veic.Text        := Trim(ADataSet.FieldByName('ESTADO_VEIC').AsString);
    if Assigned(ADataSet.FindField('ESTADO_VEIC'            )) then Setestado_veic(Festado_veic);
    if Assigned(ADataSet.FindField('ACESSORIOS'             )) then acessorios.Text         := Trim(ADataSet.FieldByName('ACESSORIOS').AsString);
    if Assigned(ADataSet.FindField('ACESSORIOS'             )) then Setacessorios(Facessorios);
    if Assigned(ADataSet.FindField('TIPO_OS'                )) then tipo_os                 := Trim(ADataSet.FieldByName('TIPO_OS').AsString);
    if Assigned(ADataSet.FindField('H_ENT'                  )) then h_ent                   := ADataSet.FieldByName('H_ENT').AsDateTime;
    if Assigned(ADataSet.FindField('H_PROMETIDA'            )) then h_prometida             := ADataSet.FieldByName('H_PROMETIDA').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_NF'                )) then data_nf                 := ADataSet.FieldByName('DATA_NF').AsDateTime;
    if Assigned(ADataSet.FindField('DT_NFGARANTIA'          )) then dt_nfgarantia           := ADataSet.FieldByName('DT_NFGARANTIA').AsDateTime;
    if Assigned(ADataSet.FindField('TOT_PROD'               )) then tot_prod                := ADataSet.FieldByName('TOT_PROD').AsFloat;
    if Assigned(ADataSet.FindField('TOT_SERV'               )) then tot_serv                := ADataSet.FieldByName('TOT_SERV').AsFloat;
    if Assigned(ADataSet.FindField('TP_ABORD'               )) then tp_abord                := Trim(ADataSet.FieldByName('TP_ABORD').AsString);
    if Assigned(ADataSet.FindField('FR_PAGBOSCH'            )) then fr_pagbosch             := Trim(ADataSet.FieldByName('FR_PAGBOSCH').AsString);
    if Assigned(ADataSet.FindField('SEQ_FECH'               )) then seq_fech                := ADataSet.FieldByName('SEQ_FECH').AsInteger;
    if Assigned(ADataSet.FindField('EM_NF'                  )) then em_nf                   := Trim(ADataSet.FieldByName('EM_NF').AsString);
    if Assigned(ADataSet.FindField('COD_EQUIP'              )) then cod_equip               := ADataSet.FieldByName('COD_EQUIP').AsInteger;
    if Assigned(ADataSet.FindField('N_SERIE'                )) then n_serie                 := Trim(ADataSet.FieldByName('N_SERIE').AsString);
    if Assigned(ADataSet.FindField('NUM_NF'                 )) then num_nf                  := ADataSet.FieldByName('NUM_NF').AsInteger;
    if Assigned(ADataSet.FindField('OBS_LIVRO_REG'          )) then obs_livro_reg           := Trim(ADataSet.FieldByName('OBS_LIVRO_REG').AsString);
    if Assigned(ADataSet.FindField('VALOR_NF'               )) then valor_nf                := ADataSet.FieldByName('VALOR_NF').AsFloat;
    if Assigned(ADataSet.FindField('NF_PGARANTIA'           )) then nf_pgarantia            := ADataSet.FieldByName('NF_PGARANTIA').AsInteger;
    if Assigned(ADataSet.FindField('NOME_NF_GARANTIA'       )) then nome_nf_garantia        := Trim(ADataSet.FieldByName('NOME_NF_GARANTIA').AsString);
    if Assigned(ADataSet.FindField('HORA_FECH'              )) then hora_fech               := Trim(ADataSet.FieldByName('HORA_FECH').AsString);
    if Assigned(ADataSet.FindField('ST_TERM_SERV'           )) then st_term_serv            := Trim(ADataSet.FieldByName('ST_TERM_SERV').AsString);
    if Assigned(ADataSet.FindField('REGISTRO_DE_ENTREGA'    )) then registro_de_entrega     := Trim(ADataSet.FieldByName('REGISTRO_DE_ENTREGA').AsString);
    if Assigned(ADataSet.FindField('ATIVO'                  )) then ativo                   := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_ORC'               )) then tipo_orc                := Trim(ADataSet.FieldByName('TIPO_ORC').AsString);
    if Assigned(ADataSet.FindField('STATUS_CUPOM'           )) then status_cupom            := Trim(ADataSet.FieldByName('STATUS_CUPOM').AsString);
    if Assigned(ADataSet.FindField('CODTERM_STATUS'         )) then codterm_status          := ADataSet.FieldByName('CODTERM_STATUS').AsInteger;
    if Assigned(ADataSet.FindField('CPFCGC'                 )) then cpfcgc                  := Trim(ADataSet.FieldByName('CPFCGC').AsString);
    if Assigned(ADataSet.FindField('NOME_CLI_ORC'           )) then nome_cli_orc            := Trim(ADataSet.FieldByName('NOME_CLI_ORC').AsString);
    if Assigned(ADataSet.FindField('COD_ORCAMENTO'          )) then cod_orcamento           := ADataSet.FieldByName('COD_ORCAMENTO').AsInteger;
    if Assigned(ADataSet.FindField('OBS_RED_OS'             )) then obs_red_os              := Trim(ADataSet.FieldByName('OBS_RED_OS').AsString);
    if Assigned(ADataSet.FindField('COD_VEICULO'            )) then cod_veiculo             := ADataSet.FieldByName('COD_VEICULO').AsInteger;
    if Assigned(ADataSet.FindField('NUM_NFEEXT'             )) then num_nfeext              := ADataSet.FieldByName('NUM_NFEEXT').AsInteger;
    if Assigned(ADataSet.FindField('DATA_NFEXT'             )) then data_nfext              := ADataSet.FieldByName('DATA_NFEXT').AsDateTime;
    if Assigned(ADataSet.FindField('VALOR_NFEXT'            )) then valor_nfext             := ADataSet.FieldByName('VALOR_NFEXT').AsFloat;
    if Assigned(ADataSet.FindField('SERIE_NF'               )) then serie_nf                := Trim(ADataSet.FieldByName('SERIE_NF').AsString);
    if Assigned(ADataSet.FindField('CCF_CUPOM'              )) then ccf_cupom               := ADataSet.FieldByName('CCF_CUPOM').AsInteger;
    if Assigned(ADataSet.FindField('LIBTRAVA'               )) then libtrava                := Trim(ADataSet.FieldByName('LIBTRAVA').AsString);
    if Assigned(ADataSet.FindField('MD5'                    )) then md5                     := Trim(ADataSet.FieldByName('MD5').AsString);
    if Assigned(ADataSet.FindField('DAV_IMPRESSO'           )) then dav_impresso            := Trim(ADataSet.FieldByName('DAV_IMPRESSO').AsString);
    if Assigned(ADataSet.FindField('DEPENDENTE'             )) then dependente              := ADataSet.FieldByName('DEPENDENTE').AsInteger;
    if Assigned(ADataSet.FindField('SUBTIPO_OS'             )) then subtipo_os              := Trim(ADataSet.FieldByName('SUBTIPO_OS').AsString);
    if Assigned(ADataSet.FindField('COD_CARGA'              )) then cod_carga               := ADataSet.FieldByName('COD_CARGA').AsInteger;
    if Assigned(ADataSet.FindField('APROVADA_GERENTE'       )) then aprovada_gerente        := Trim(ADataSet.FieldByName('APROVADA_GERENTE').AsString);
    if Assigned(ADataSet.FindField('NPEDMOB'                )) then npedmob                 := ADataSet.FieldByName('NPEDMOB').AsInteger;
    if Assigned(ADataSet.FindField('IDMOBILE'               )) then idmobile                := ADataSet.FieldByName('IDMOBILE').AsInteger;
    if Assigned(ADataSet.FindField('DATA_LIBTRAVA'          )) then data_libtrava           := ADataSet.FieldByName('DATA_LIBTRAVA').AsDateTime;
    if Assigned(ADataSet.FindField('COD_NF'                 )) then cod_nf                  := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('NF_GEROU'               )) then nf_gerou                := Trim(ADataSet.FieldByName('NF_GEROU').AsString);
    if Assigned(ADataSet.FindField('COD_AGENDAMENTO'        )) then cod_agendamento         := ADataSet.FieldByName('COD_AGENDAMENTO').AsInteger;
    if Assigned(ADataSet.FindField('STATUS_CONTRATO'        )) then status_contrato         := Trim(ADataSet.FieldByName('STATUS_CONTRATO').AsString);
    if Assigned(ADataSet.FindField('NOME_CLIENTEDAV'        )) then nome_clientedav         := Trim(ADataSet.FieldByName('NOME_CLIENTEDAV').AsString);
    if Assigned(ADataSet.FindField('MD52'                   )) then md52                    := Trim(ADataSet.FieldByName('MD52').AsString);
    if Assigned(ADataSet.FindField('COO_IMPRESSAO'          )) then coo_impressao           := ADataSet.FieldByName('COO_IMPRESSAO').AsInteger;
    if Assigned(ADataSet.FindField('NSERIECF_IMPRESSAO'     )) then nseriecf_impressao      := Trim(ADataSet.FieldByName('NSERIECF_IMPRESSAO').AsString);
    if Assigned(ADataSet.FindField('OPERADOR_IMPRESSAO'     )) then operador_impressao      := ADataSet.FieldByName('OPERADOR_IMPRESSAO').AsInteger;
    if Assigned(ADataSet.FindField('PAF_NUM_PREVENDA'       )) then paf_num_prevenda        := ADataSet.FieldByName('PAF_NUM_PREVENDA').AsInteger;
    if Assigned(ADataSet.FindField('PAF_STATUS_PREVENDA'    )) then paf_status_prevenda     := Trim(ADataSet.FieldByName('PAF_STATUS_PREVENDA').AsString);
    if Assigned(ADataSet.FindField('NPED_ORIGINADO'         )) then nped_originado          := ADataSet.FieldByName('NPED_ORIGINADO').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_ORIGINADO'         )) then tipo_originado          := Trim(ADataSet.FieldByName('TIPO_ORIGINADO').AsString);
    if Assigned(ADataSet.FindField('COD_AGENDA'             )) then cod_agenda              := ADataSet.FieldByName('COD_AGENDA').AsInteger;
    if Assigned(ADataSet.FindField('STATUS_CONTA_CLIENTE'   )) then status_conta_cliente    := Trim(ADataSet.FieldByName('STATUS_CONTA_CLIENTE').AsString);
    if Assigned(ADataSet.FindField('COO_CONTA_CLIENTE'      )) then coo_conta_cliente       := ADataSet.FieldByName('COO_CONTA_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('CER_CONTA_CLIENTE'      )) then cer_conta_cliente       := ADataSet.FieldByName('CER_CONTA_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('CODPESQUISA'            )) then codpesquisa             := ADataSet.FieldByName('CODPESQUISA').AsInteger;
    if Assigned(ADataSet.FindField('ORCPARAVND'             )) then orcparavnd              := Trim(ADataSet.FieldByName('ORCPARAVND').AsString);
    if Assigned(ADataSet.FindField('COD_CONTROLE'           )) then cod_controle            := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    if Assigned(ADataSet.FindField('GERENTE_APROVOU'        )) then gerente_aprovou         := Trim(ADataSet.FieldByName('GERENTE_APROVOU').AsString);
    if Assigned(ADataSet.FindField('VALOR_DESC_AVISTA'      )) then valor_desc_avista       := ADataSet.FieldByName('VALOR_DESC_AVISTA').AsFloat;
    if Assigned(ADataSet.FindField('METODO_ENTREGA'         )) then metodo_entrega          := Trim(ADataSet.FieldByName('METODO_ENTREGA').AsString);
    if Assigned(ADataSet.FindField('AUTORIZADO_FINANCEIRO'  )) then autorizado_financeiro   := Trim(ADataSet.FieldByName('AUTORIZADO_FINANCEIRO').AsString);
    if Assigned(ADataSet.FindField('N_COMANDO'              )) then n_comando               := ADataSet.FieldByName('N_COMANDO').AsInteger;
    if Assigned(ADataSet.FindField('ENV_MOBILE'             )) then env_mobile              := Trim(ADataSet.FieldByName('ENV_MOBILE').AsString);
    if Assigned(ADataSet.FindField('REABERTO'               )) then reaberto                := Trim(ADataSet.FieldByName('REABERTO').AsString);
    if Assigned(ADataSet.FindField('REGRAS_DESCONTOS'       )) then regras_descontos        := Trim(ADataSet.FieldByName('REGRAS_DESCONTOS').AsString);
    if Assigned(ADataSet.FindField('STATUS_SEP_CONF'        )) then status_sep_conf         := Trim(ADataSet.FieldByName('STATUS_SEP_CONF').AsString);
    if Assigned(ADataSet.FindField('NSERIEECF_CONTA_CLIENTE')) then nserieecf_conta_cliente := Trim(ADataSet.FieldByName('NSERIEECF_CONTA_CLIENTE').AsString);
    if Assigned(ADataSet.FindField('SAVEAUTO'               )) then saveauto                := Trim(ADataSet.FieldByName('SAVEAUTO').AsString);
    if Assigned(ADataSet.FindField('CALC'                   )) then calc                    := Trim(ADataSet.FieldByName('CALC').AsString);
    if Assigned(ADataSet.FindField('US_EDIT'                )) then us_edit                 := ADataSet.FieldByName('US_EDIT').AsInteger;
    if Assigned(ADataSet.FindField('DATA_ESTOQUE'           )) then data_estoque            := ADataSet.FieldByName('DATA_ESTOQUE').AsDateTime;
    if Assigned(ADataSet.FindField('COD_CLIENTE_NFSERV'     )) then cod_cliente_nfserv      := ADataSet.FieldByName('COD_CLIENTE_NFSERV').AsInteger;
    if Assigned(ADataSet.FindField('QTDE_LIBTRAVA'          )) then qtde_libtrava           := ADataSet.FieldByName('QTDE_LIBTRAVA').AsInteger;
    if Assigned(ADataSet.FindField('QTDE_IMPRESSAO'         )) then qtde_impressao          := ADataSet.FieldByName('QTDE_IMPRESSAO').AsInteger;
    if Assigned(ADataSet.FindField('END_AVL'                )) then end_avl                 := Trim(ADataSet.FieldByName('END_AVL').AsString);
    if Assigned(ADataSet.FindField('BAIRRO_AVL'             )) then bairro_avl              := Trim(ADataSet.FieldByName('BAIRRO_AVL').AsString);
    if Assigned(ADataSet.FindField('CIDA_AVL'               )) then cida_avl                := Trim(ADataSet.FieldByName('CIDA_AVL').AsString);
    if Assigned(ADataSet.FindField('CEP_AVL'                )) then cep_avl                 := Trim(ADataSet.FieldByName('CEP_AVL').AsString);
    if Assigned(ADataSet.FindField('ESTA_AVL'               )) then esta_avl                := Trim(ADataSet.FieldByName('ESTA_AVL').AsString);
    if Assigned(ADataSet.FindField('COD_VENDEDOR1'          )) then cod_vendedor1           := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    if Assigned(ADataSet.FindField('SELOS_COL'              )) then selos_col.Text          := Trim(ADataSet.FieldByName('SELOS_COL').AsString);
    if Assigned(ADataSet.FindField('SELOS_COL'              )) then Setselos_col(Fselos_col);
    if Assigned(ADataSet.FindField('SELOS_REM'              )) then selos_rem.Text          := Trim(ADataSet.FieldByName('SELOS_REM').AsString);
    if Assigned(ADataSet.FindField('SELOS_REM'              )) then Setselos_rem(Fselos_rem);
    if Assigned(ADataSet.FindField('LACRES_COL'             )) then lacres_col.Text         := Trim(ADataSet.FieldByName('LACRES_COL').AsString);
    if Assigned(ADataSet.FindField('LACRES_COL'             )) then Setlacres_col(Flacres_col);
    if Assigned(ADataSet.FindField('LACRES_REM'             )) then lacres_rem.Text         := Trim(ADataSet.FieldByName('LACRES_REM').AsString);
    if Assigned(ADataSet.FindField('LACRES_REM'             )) then Setlacres_rem(Flacres_rem);
    if Assigned(ADataSet.FindField('N_NFD'                  )) then n_nfd                   := ADataSet.FieldByName('N_NFD').AsInteger;
    if Assigned(ADataSet.FindField('SERIE_NFD'              )) then serie_nfd               := Trim(ADataSet.FieldByName('SERIE_NFD').AsString);
    if Assigned(ADataSet.FindField('NFD_GEROU'              )) then nfd_gerou               := Trim(ADataSet.FieldByName('NFD_GEROU').AsString);
    if Assigned(ADataSet.FindField('DATA_NFD'               )) then data_nfd                := ADataSet.FieldByName('DATA_NFD').AsDateTime;
    if Assigned(ADataSet.FindField('VALOR_NFD'              )) then valor_nfd               := ADataSet.FieldByName('VALOR_NFD').AsFloat;
    if Assigned(ADataSet.FindField('COD_CLI_FAT'            )) then cod_cli_fat             := ADataSet.FieldByName('COD_CLI_FAT').AsInteger;
    if Assigned(ADataSet.FindField('COD_GERADOR'            )) then cod_gerador             := ADataSet.FieldByName('COD_GERADOR').AsInteger;
    if Assigned(ADataSet.FindField('COD_NFCE'               )) then cod_nfce                := ADataSet.FieldByName('COD_NFCE').AsInteger;
    if Assigned(ADataSet.FindField('ENV_EMAIL_NFS'          )) then env_email_nfs           := Trim(ADataSet.FieldByName('ENV_EMAIL_NFS').AsString);
    if Assigned(ADataSet.FindField('TOT_SERV_TERC'          )) then tot_serv_terc           := ADataSet.FieldByName('TOT_SERV_TERC').AsFloat;
    if Assigned(ADataSet.FindField('TOT_PROD_TERC'          )) then tot_prod_terc           := ADataSet.FieldByName('TOT_PROD_TERC').AsFloat;
    if Assigned(ADataSet.FindField('TP_VENDA'               )) then tp_venda                := Trim(ADataSet.FieldByName('TP_VENDA').AsString);
    if Assigned(ADataSet.FindField('CL_CLULTIMACOMPRA'      )) then cl_clultimacompra       := Trim(ADataSet.FieldByName('CL_CLULTIMACOMPRA').AsString);
    if Assigned(ADataSet.FindField('CL_STATUS_F'            )) then cl_status_f             := Trim(ADataSet.FieldByName('CL_STATUS_F').AsString);
    if Assigned(ADataSet.FindField('TP_GERAR_PONTOS'        )) then tp_gerar_pontos         := Trim(ADataSet.FieldByName('TP_GERAR_PONTOS').AsString);
    if Assigned(ADataSet.FindField('VALE_TROCA'             )) then vale_troca              := Trim(ADataSet.FieldByName('VALE_TROCA').AsString);
    if Assigned(ADataSet.FindField('VALOR_VALE_PRG'         )) then valor_vale_prg          := ADataSet.FieldByName('VALOR_VALE_PRG').AsFloat;
    if Assigned(ADataSet.FindField('DEST_SEQID'             )) then dest_seqid              := ADataSet.FieldByName('DEST_SEQID').AsInteger;
    if Assigned(ADataSet.FindField('DEST_SEQID_ENTRG'       )) then dest_seqid_entrg        := ADataSet.FieldByName('DEST_SEQID_ENTRG').AsInteger;
    if Assigned(ADataSet.FindField('COD_FATURA'             )) then cod_fatura              := ADataSet.FieldByName('COD_FATURA').AsInteger;
    if Assigned(ADataSet.FindField('VL_COMISSAO_VEND'       )) then vl_comissao_vend        := ADataSet.FieldByName('VL_COMISSAO_VEND').AsFloat;
    if Assigned(ADataSet.FindField('PERC_COMISSAO_VEND'     )) then perc_comissao_vend      := ADataSet.FieldByName('PERC_COMISSAO_VEND').AsFloat;
    if Assigned(ADataSet.FindField('VL_COMISSAO_VEND1'      )) then vl_comissao_vend1       := ADataSet.FieldByName('VL_COMISSAO_VEND1').AsFloat;
    if Assigned(ADataSet.FindField('PERC_COMISSAO_VEND1'    )) then perc_comissao_vend1     := ADataSet.FieldByName('PERC_COMISSAO_VEND1').AsFloat;
    if Assigned(ADataSet.FindField('CONT_ALT'               )) then cont_alt                := ADataSet.FieldByName('CONT_ALT').AsInteger;
    if Assigned(ADataSet.FindField('LOCAL_INCIDENCIA'       )) then local_incidencia        := ADataSet.FieldByName('LOCAL_INCIDENCIA').AsInteger;
    if Assigned(ADataSet.FindField('NF_AC_CALCTRIB'         )) then nf_ac_calctrib          := Trim(ADataSet.FieldByName('NF_AC_CALCTRIB').AsString);
    if Assigned(ADataSet.FindField('NF_AC_SEGURO'           )) then nf_ac_seguro            := ADataSet.FieldByName('NF_AC_SEGURO').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_OUTRAS'           )) then nf_ac_outras            := ADataSet.FieldByName('NF_AC_OUTRAS').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_FRETE'            )) then nf_ac_frete             := ADataSet.FieldByName('NF_AC_FRETE').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_IPI'              )) then nf_ac_ipi               := ADataSet.FieldByName('NF_AC_IPI').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_ICMSST'           )) then nf_ac_icmsst            := ADataSet.FieldByName('NF_AC_ICMSST').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_FCPST'            )) then nf_ac_fcpst             := ADataSet.FieldByName('NF_AC_FCPST').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_IMPOSTO_II'       )) then nf_ac_imposto_ii        := ADataSet.FieldByName('NF_AC_IMPOSTO_II').AsFloat;
    if Assigned(ADataSet.FindField('NF_FRETECONTA'          )) then nf_freteconta           := Trim(ADataSet.FieldByName('NF_FRETECONTA').AsString);
    if Assigned(ADataSet.FindField('ID_COMMERCE'            )) then id_commerce             := ADataSet.FieldByName('ID_COMMERCE').AsInteger;
    if Assigned(ADataSet.FindField('COD_FORMA_RAST'         )) then cod_forma_rast          := ADataSet.FieldByName('COD_FORMA_RAST').AsInteger;
    if Assigned(ADataSet.FindField('DATA_ENVIO_RAST'        )) then data_envio_rast         := ADataSet.FieldByName('DATA_ENVIO_RAST').AsDateTime;
    if Assigned(ADataSet.FindField('COD_RASTREAMENTO'       )) then cod_rastreamento        := Trim(ADataSet.FieldByName('COD_RASTREAMENTO').AsString);
    if Assigned(ADataSet.FindField('IDSITPED_EC'            )) then idsitped_ec             := ADataSet.FieldByName('IDSITPED_EC').AsInteger;
    if Assigned(ADataSet.FindField('STATUS_EC'              )) then status_ec               := Trim(ADataSet.FieldByName('STATUS_EC').AsString);
    if Assigned(ADataSet.FindField('NF_CF_DESON_EMB'        )) then nf_cf_deson_emb         := Trim(ADataSet.FieldByName('NF_CF_DESON_EMB').AsString);
    if Assigned(ADataSet.FindField('NF_DC_DESCONTO'         )) then nf_dc_desconto          := ADataSet.FieldByName('NF_DC_DESCONTO').AsFloat;
    if Assigned(ADataSet.FindField('NF_DC_VICMDESON'        )) then nf_dc_vicmdeson         := ADataSet.FieldByName('NF_DC_VICMDESON').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_VICMDESON'        )) then nf_ac_vicmdeson         := ADataSet.FieldByName('NF_AC_VICMDESON').AsFloat;
    if Assigned(ADataSet.FindField('FINALIDADEID'           )) then finalidadeid            := ADataSet.FieldByName('FINALIDADEID').AsInteger;
  end;
end;

function TPedvenda_class.SQLMotor(AautoIncField, AignoreFields: string): TSQLBase_fb;
begin
  Setobs_minuta(Fobs_minuta  );
  Setobs_os(Fobs_os          );
  Setdefeito(Fdefeito        );
  Setestado_veic(Festado_veic);
  Setacessorios(Facessorios  );
  Setselos_col(Fselos_col    );
  Setselos_rem(Fselos_rem    );
  Setlacres_col(Flacres_col  );
  Setlacres_rem(Flacres_rem  );
  Result := inherited SQLMotor(AautoIncField, AignoreFields);
end;

procedure TPedvenda_class.Setnped(const Value: Integer);
begin
  Fnped := Value;
  ChangeField('NPED', Fnped);
end;

procedure TPedvenda_class.Settipo(const Value: string);
begin
  Ftipo := Value;
  ChangeField('TIPO', strq(Ftipo, 3));
end;

procedure TPedvenda_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TPedvenda_class.Setcod_cliente(const Value: Integer);
begin
  Fcod_cliente := Value;
  ChangeField('COD_CLIENTE', Fcod_cliente);
end;

procedure TPedvenda_class.Setcod_vendedor(const Value: Integer);
begin
  Fcod_vendedor := Value;
  ChangeField('COD_VENDEDOR', Fcod_vendedor);
end;

procedure TPedvenda_class.Setcod_cond_pag(const Value: Integer);
begin
  Fcod_cond_pag := Value;
  ChangeField('COD_COND_PAG', Fcod_cond_pag);
end;

procedure TPedvenda_class.Setcod_us_fech(const Value: Integer);
begin
  Fcod_us_fech := Value;
  ChangeField('COD_US_FECH', Fcod_us_fech);
end;

procedure TPedvenda_class.Setn_mov_cxl(const Value: Integer);
begin
  Fn_mov_cxl := Value;
  ChangeField('N_MOV_CXL', Fn_mov_cxl);
end;

procedure TPedvenda_class.Setdia_cxl(const Value: TDateTime);
begin
  Fdia_cxl := Value;
  ChangeField_dt('DIA_CXL', Fdia_cxl);
end;

procedure TPedvenda_class.Setdata_ped(const Value: TDateTime);
begin
  Fdata_ped := Value;
  ChangeField_dt('DATA_PED', Fdata_ped);
end;

procedure TPedvenda_class.Setdata_fech(const Value: TDateTime);
begin
  Fdata_fech := Value;
  ChangeField_dt('DATA_FECH', Fdata_fech);
end;

procedure TPedvenda_class.Setdatvenc(const Value: TDateTime);
begin
  Fdatvenc := Value;
  ChangeField_dt('DATVENC', Fdatvenc);
end;

procedure TPedvenda_class.Setvalor_total(const Value: Double);
begin
  Fvalor_total := Value;
  ChangeField_f('VALOR_TOTAL', Fvalor_total);
end;

procedure TPedvenda_class.Setdesc_p_prod(const Value: Double);
begin
  Fdesc_p_prod := Value;
  ChangeField_f('DESC_P_PROD', Fdesc_p_prod);
end;

procedure TPedvenda_class.Setdesc_p_serv(const Value: Double);
begin
  Fdesc_p_serv := Value;
  ChangeField_f('DESC_P_SERV', Fdesc_p_serv);
end;

procedure TPedvenda_class.Setdesconto(const Value: Double);
begin
  Fdesconto := Value;
  ChangeField_f('DESCONTO', Fdesconto);
end;

procedure TPedvenda_class.Setobs_ped(const Value: string);
begin
  Fobs_ped := Value;
  ChangeField('OBS_PED', strq(Fobs_ped, 130));
end;

procedure TPedvenda_class.Setstatus_ped(const Value: string);
begin
  Fstatus_ped := Value;
  ChangeField('STATUS_PED', strq(Fstatus_ped, 10));
end;

procedure TPedvenda_class.Settipv(const Value: string);
begin
  Ftipv := Value;
  ChangeField('TIPV', strq(Ftipv, 1));
end;

procedure TPedvenda_class.Setobs_cxl_rq(const Value: string);
begin
  Fobs_cxl_rq := Value;
  ChangeField('OBS_CXL_RQ', strq(Fobs_cxl_rq, 50));
end;

procedure TPedvenda_class.Setstatus_cxl_rq(const Value: string);
begin
  Fstatus_cxl_rq := Value;
  ChangeField('STATUS_CXL_RQ', strq(Fstatus_cxl_rq, 1));
end;

procedure TPedvenda_class.Setvl_pago_cxl(const Value: Double);
begin
  Fvl_pago_cxl := Value;
  ChangeField_f('VL_PAGO_CXL', Fvl_pago_cxl);
end;

procedure TPedvenda_class.Setselec(const Value: string);
begin
  Fselec := Value;
  ChangeField('SELEC', strq(Fselec, 1));
end;

procedure TPedvenda_class.Settipor(const Value: string);
begin
  Ftipor := Value;
  ChangeField('TIPOR', strq(Ftipor, 1));
end;

procedure TPedvenda_class.Sethoraabertura(const Value: Integer);
begin
  Fhoraabertura := Value;
  ChangeField('HORAABERTURA', Fhoraabertura);
end;

procedure TPedvenda_class.Setminabertura(const Value: Integer);
begin
  Fminabertura := Value;
  ChangeField('MINABERTURA', Fminabertura);
end;

procedure TPedvenda_class.Sethorafechamento(const Value: Integer);
begin
  Fhorafechamento := Value;
  ChangeField('HORAFECHAMENTO', Fhorafechamento);
end;

procedure TPedvenda_class.Setminfechamento(const Value: Integer);
begin
  Fminfechamento := Value;
  ChangeField('MINFECHAMENTO', Fminfechamento);
end;

procedure TPedvenda_class.Sethorasubtotal(const Value: Integer);
begin
  Fhorasubtotal := Value;
  ChangeField('HORASUBTOTAL', Fhorasubtotal);
end;

procedure TPedvenda_class.Setminsubtotal(const Value: Integer);
begin
  Fminsubtotal := Value;
  ChangeField('MINSUBTOTAL', Fminsubtotal);
end;

procedure TPedvenda_class.Setncupom(const Value: Integer);
begin
  Fncupom := Value;
  ChangeField('NCUPOM', Fncupom);
end;

procedure TPedvenda_class.Setoperador(const Value: Integer);
begin
  Foperador := Value;
  ChangeField('OPERADOR', Foperador);
end;

procedure TPedvenda_class.Setdata_cupom(const Value: TDateTime);
begin
  Fdata_cupom := Value;
  ChangeField_dt('DATA_CUPOM', Fdata_cupom);
end;

procedure TPedvenda_class.Setda(const Value: string);
begin
  Fda := Value;
  ChangeField('DA', strq(Fda, 1));
end;

procedure TPedvenda_class.Setnserieecf(const Value: string);
begin
  Fnserieecf := Value;
  ChangeField('NSERIEECF', strq(Fnserieecf, 20));
end;

procedure TPedvenda_class.Setnome_receb(const Value: string);
begin
  Fnome_receb := Value;
  ChangeField('NOME_RECEB', strq(Fnome_receb, 40));
end;

procedure TPedvenda_class.Setend_receb(const Value: string);
begin
  Fend_receb := Value;
  ChangeField('END_RECEB', strq(Fend_receb, 35));
end;

procedure TPedvenda_class.Setbairro_receb(const Value: string);
begin
  Fbairro_receb := Value;
  ChangeField('BAIRRO_RECEB', strq(Fbairro_receb, 20));
end;

procedure TPedvenda_class.Setcida_receb(const Value: string);
begin
  Fcida_receb := Value;
  ChangeField('CIDA_RECEB', strq(Fcida_receb, 30));
end;

procedure TPedvenda_class.Setcep_receb(const Value: string);
begin
  Fcep_receb := Value;
  ChangeField('CEP_RECEB', strq(Fcep_receb, 8));
end;

procedure TPedvenda_class.Setfone_receb(const Value: string);
begin
  Ffone_receb := Value;
  ChangeField('FONE_RECEB', strq(Ffone_receb, 14));
end;

procedure TPedvenda_class.Setobs_minuta(const Value: TStrings);
begin
  Fobs_minuta := Value;
  ChangeField('OBS_MINUTA', Fobs_minuta);
end;

procedure TPedvenda_class.Setgrupo_prod(const Value: Integer);
begin
  Fgrupo_prod := Value;
  ChangeField('GRUPO_PROD', Fgrupo_prod);
end;

procedure TPedvenda_class.Setcod_prod(const Value: string);
begin
  Fcod_prod := Value;
  ChangeField('COD_PROD', strq(Fcod_prod, 6));
end;

procedure TPedvenda_class.Setop_cxl(const Value: Integer);
begin
  Fop_cxl := Value;
  ChangeField('OP_CXL', Fop_cxl);
end;

procedure TPedvenda_class.Setcod_cidade_receb(const Value: Integer);
begin
  Fcod_cidade_receb := Value;
  ChangeField('COD_CIDADE_RECEB', Fcod_cidade_receb);
end;

procedure TPedvenda_class.Setcod_bairro_receb(const Value: Integer);
begin
  Fcod_bairro_receb := Value;
  ChangeField('COD_BAIRRO_RECEB', Fcod_bairro_receb);
end;

procedure TPedvenda_class.Setvl_entrada(const Value: Double);
begin
  Fvl_entrada := Value;
  ChangeField_f('VL_ENTRADA', Fvl_entrada);
end;

procedure TPedvenda_class.Setcodigo_ctrl(const Value: Integer);
begin
  Fcodigo_ctrl := Value;
  ChangeField('CODIGO_CTRL', Fcodigo_ctrl);
end;

procedure TPedvenda_class.Setnprevenda(const Value: Integer);
begin
  Fnprevenda := Value;
  ChangeField('NPREVENDA', Fnprevenda);
end;

procedure TPedvenda_class.Setstat_req(const Value: string);
begin
  Fstat_req := Value;
  ChangeField('STAT_REQ', strq(Fstat_req, 1));
end;

procedure TPedvenda_class.Setacresc_p_prod(const Value: Double);
begin
  Facresc_p_prod := Value;
  ChangeField_f('ACRESC_P_PROD', Facresc_p_prod);
end;

procedure TPedvenda_class.Setacresc_p_serv(const Value: Double);
begin
  Facresc_p_serv := Value;
  ChangeField_f('ACRESC_P_SERV', Facresc_p_serv);
end;

procedure TPedvenda_class.Setacrescimo(const Value: Double);
begin
  Facrescimo := Value;
  ChangeField_f('ACRESCIMO', Facrescimo);
end;

procedure TPedvenda_class.Setplaca(const Value: string);
begin
  Fplaca := Value;
  ChangeField('PLACA', strq(Fplaca, 10));
end;

procedure TPedvenda_class.Setchassi(const Value: string);
begin
  Fchassi := Value;
  ChangeField('CHASSI', strq(Fchassi, 17));
end;

procedure TPedvenda_class.Setkm_v(const Value: Integer);
begin
  Fkm_v := Value;
  ChangeField('KM_V', Fkm_v);
end;

procedure TPedvenda_class.Setorc_prod(const Value: Integer);
begin
  Forc_prod := Value;
  ChangeField('ORC_PROD', Forc_prod);
end;

procedure TPedvenda_class.Setdt_prometida(const Value: TDateTime);
begin
  Fdt_prometida := Value;
  ChangeField_dt('DT_PROMETIDA', Fdt_prometida);
end;

procedure TPedvenda_class.Setobs_os(const Value: TStrings);
begin
  Fobs_os := Value;
  ChangeField('OBS_OS', Fobs_os);
end;

procedure TPedvenda_class.Setaparelho_ped(const Value: string);
begin
  Faparelho_ped := Value;
  ChangeField('APARELHO_PED', strq(Faparelho_ped, 128));
end;

procedure TPedvenda_class.Setguarda_vol(const Value: string);
begin
  Fguarda_vol := Value;
  ChangeField('GUARDA_VOL', strq(Fguarda_vol, 10));
end;

procedure TPedvenda_class.Setcombust_veic(const Value: string);
begin
  Fcombust_veic := Value;
  ChangeField('COMBUST_VEIC', strq(Fcombust_veic, 3));
end;

procedure TPedvenda_class.Setdefeito(const Value: TStrings);
begin
  Fdefeito := Value;
  ChangeField('DEFEITO', Fdefeito);
end;

procedure TPedvenda_class.Setestado_veic(const Value: TStrings);
begin
  Festado_veic := Value;
  ChangeField('ESTADO_VEIC', Festado_veic);
end;

procedure TPedvenda_class.Setacessorios(const Value: TStrings);
begin
  Facessorios := Value;
  ChangeField('ACESSORIOS', Facessorios);
end;

procedure TPedvenda_class.Settipo_os(const Value: string);
begin
  Ftipo_os := Value;
  ChangeField('TIPO_OS', strq(Ftipo_os, 40));
end;

procedure TPedvenda_class.Seth_ent(const Value: TDateTime);
begin
  Fh_ent := Value;
  ChangeField_dt('H_ENT', Fh_ent);
end;

procedure TPedvenda_class.Seth_prometida(const Value: TDateTime);
begin
  Fh_prometida := Value;
  ChangeField_dt('H_PROMETIDA', Fh_prometida);
end;

procedure TPedvenda_class.Setdata_nf(const Value: TDateTime);
begin
  Fdata_nf := Value;
  ChangeField_dt('DATA_NF', Fdata_nf);
end;

procedure TPedvenda_class.Setdt_nfgarantia(const Value: TDateTime);
begin
  Fdt_nfgarantia := Value;
  ChangeField_dt('DT_NFGARANTIA', Fdt_nfgarantia);
end;

procedure TPedvenda_class.Settot_prod(const Value: Double);
begin
  Ftot_prod := Value;
  ChangeField_f('TOT_PROD', Ftot_prod);
end;

procedure TPedvenda_class.Settot_serv(const Value: Double);
begin
  Ftot_serv := Value;
  ChangeField_f('TOT_SERV', Ftot_serv);
end;

procedure TPedvenda_class.Settp_abord(const Value: string);
begin
  Ftp_abord := Value;
  ChangeField('TP_ABORD', strq(Ftp_abord, 3));
end;

procedure TPedvenda_class.Setfr_pagbosch(const Value: string);
begin
  Ffr_pagbosch := Value;
  ChangeField('FR_PAGBOSCH', strq(Ffr_pagbosch, 3));
end;

procedure TPedvenda_class.Setseq_fech(const Value: Integer);
begin
  Fseq_fech := Value;
  ChangeField('SEQ_FECH', Fseq_fech);
end;

procedure TPedvenda_class.Setem_nf(const Value: string);
begin
  Fem_nf := Value;
  ChangeField('EM_NF', strq(Fem_nf, 1));
end;

procedure TPedvenda_class.Setcod_equip(const Value: Integer);
begin
  Fcod_equip := Value;
  ChangeField('COD_EQUIP', Fcod_equip);
end;

procedure TPedvenda_class.Setn_serie(const Value: string);
begin
  Fn_serie := Value;
  ChangeField('N_SERIE', strq(Fn_serie, 32));
end;

procedure TPedvenda_class.Setnum_nf(const Value: Integer);
begin
  Fnum_nf := Value;
  ChangeField('NUM_NF', Fnum_nf);
end;

procedure TPedvenda_class.Setobs_livro_reg(const Value: string);
begin
  Fobs_livro_reg := Value;
  ChangeField('OBS_LIVRO_REG', strq(Fobs_livro_reg, 32));
end;

procedure TPedvenda_class.Setvalor_nf(const Value: Double);
begin
  Fvalor_nf := Value;
  ChangeField_f('VALOR_NF', Fvalor_nf);
end;

procedure TPedvenda_class.Setnf_pgarantia(const Value: Integer);
begin
  Fnf_pgarantia := Value;
  ChangeField('NF_PGARANTIA', Fnf_pgarantia);
end;

procedure TPedvenda_class.Setnome_nf_garantia(const Value: string);
begin
  Fnome_nf_garantia := Value;
  ChangeField('NOME_NF_GARANTIA', strq(Fnome_nf_garantia, 60));
end;

procedure TPedvenda_class.Sethora_fech(const Value: string);
begin
  Fhora_fech := Value;
  ChangeField('HORA_FECH', strq(Fhora_fech, 8));
end;

procedure TPedvenda_class.Setst_term_serv(const Value: string);
begin
  Fst_term_serv := Value;
  ChangeField('ST_TERM_SERV', strq(Fst_term_serv, 40));
end;

procedure TPedvenda_class.Setregistro_de_entrega(const Value: string);
begin
  Fregistro_de_entrega := Value;
  ChangeField('REGISTRO_DE_ENTREGA', strq(Fregistro_de_entrega, 100));
end;

procedure TPedvenda_class.Setativo(const Value: Integer);
begin
  Fativo := Value;
  ChangeField('ATIVO', Fativo);
end;

procedure TPedvenda_class.Settipo_orc(const Value: string);
begin
  Ftipo_orc := Value;
  ChangeField('TIPO_ORC', strq(Ftipo_orc, 1));
end;

procedure TPedvenda_class.Setstatus_cupom(const Value: string);
begin
  Fstatus_cupom := Value;
  ChangeField('STATUS_CUPOM', strq(Fstatus_cupom, 1));
end;

procedure TPedvenda_class.Setcodterm_status(const Value: Integer);
begin
  Fcodterm_status := Value;
  ChangeField('CODTERM_STATUS', Fcodterm_status);
end;

procedure TPedvenda_class.Setcpfcgc(const Value: string);
begin
  Fcpfcgc := Value;
  ChangeField('CPFCGC', strq(Fcpfcgc, 18));
end;

procedure TPedvenda_class.Setnome_cli_orc(const Value: string);
begin
  Fnome_cli_orc := Value;
  ChangeField('NOME_CLI_ORC', strq(Fnome_cli_orc, 35));
end;

procedure TPedvenda_class.Setcod_orcamento(const Value: Integer);
begin
  Fcod_orcamento := Value;
  ChangeField('COD_ORCAMENTO', Fcod_orcamento);
end;

procedure TPedvenda_class.Setobs_red_os(const Value: string);
begin
  Fobs_red_os := Value;
  ChangeField('OBS_RED_OS', strq(Fobs_red_os, 50));
end;

procedure TPedvenda_class.Setcod_veiculo(const Value: Integer);
begin
  Fcod_veiculo := Value;
  ChangeField('COD_VEICULO', Fcod_veiculo);
end;

procedure TPedvenda_class.Setnum_nfeext(const Value: Int64);
begin
  Fnum_nfeext := Value;
  ChangeField('NUM_NFEEXT', Fnum_nfeext);
end;

procedure TPedvenda_class.Setdata_nfext(const Value: TDateTime);
begin
  Fdata_nfext := Value;
  ChangeField_dt('DATA_NFEXT', Fdata_nfext);
end;

procedure TPedvenda_class.Setvalor_nfext(const Value: Double);
begin
  Fvalor_nfext := Value;
  ChangeField_f('VALOR_NFEXT', Fvalor_nfext);
end;

procedure TPedvenda_class.Setserie_nf(const Value: string);
begin
  Fserie_nf := Value;
  ChangeField('SERIE_NF', strq(Fserie_nf, 5));
end;

procedure TPedvenda_class.Setccf_cupom(const Value: Integer);
begin
  Fccf_cupom := Value;
  ChangeField('CCF_CUPOM', Fccf_cupom);
end;

procedure TPedvenda_class.Setlibtrava(const Value: string);
begin
  Flibtrava := Value;
  ChangeField('LIBTRAVA', strq(Flibtrava, 1));
end;

procedure TPedvenda_class.Setmd5(const Value: string);
begin
  Fmd5 := Value;
  ChangeField('MD5', strq(Fmd5, 256));
end;

procedure TPedvenda_class.Setdav_impresso(const Value: string);
begin
  Fdav_impresso := Value;
  ChangeField('DAV_IMPRESSO', strq(Fdav_impresso, 1));
end;

procedure TPedvenda_class.Setdependente(const Value: Integer);
begin
  Fdependente := Value;
  ChangeField('DEPENDENTE', Fdependente);
end;

procedure TPedvenda_class.Setsubtipo_os(const Value: string);
begin
  Fsubtipo_os := Value;
  ChangeField('SUBTIPO_OS', strq(Fsubtipo_os, 10));
end;

procedure TPedvenda_class.Setcod_carga(const Value: Integer);
begin
  Fcod_carga := Value;
  ChangeField('COD_CARGA', Fcod_carga);
end;

procedure TPedvenda_class.Setaprovada_gerente(const Value: string);
begin
  Faprovada_gerente := Value;
  ChangeField('APROVADA_GERENTE', strq(Faprovada_gerente, 1));
end;

procedure TPedvenda_class.Setnpedmob(const Value: Integer);
begin
  Fnpedmob := Value;
  ChangeField('NPEDMOB', Fnpedmob);
end;

procedure TPedvenda_class.Setidmobile(const Value: Integer);
begin
  Fidmobile := Value;
  ChangeField('IDMOBILE', Fidmobile);
end;

procedure TPedvenda_class.Setdata_libtrava(const Value: TDateTime);
begin
  Fdata_libtrava := Value;
  ChangeField_dt('DATA_LIBTRAVA', Fdata_libtrava);
end;

procedure TPedvenda_class.Setcod_nf(const Value: Integer);
begin
  Fcod_nf := Value;
  ChangeField('COD_NF', Fcod_nf);
end;

procedure TPedvenda_class.Setnf_gerou(const Value: string);
begin
  Fnf_gerou := Value;
  ChangeField('NF_GEROU', strq(Fnf_gerou, 1));
end;

procedure TPedvenda_class.Setcod_agendamento(const Value: Integer);
begin
  Fcod_agendamento := Value;
  ChangeField('COD_AGENDAMENTO', Fcod_agendamento);
end;

procedure TPedvenda_class.Setstatus_contrato(const Value: string);
begin
  Fstatus_contrato := Value;
  ChangeField('STATUS_CONTRATO', strq(Fstatus_contrato, 1));
end;

procedure TPedvenda_class.Setnome_clientedav(const Value: string);
begin
  Fnome_clientedav := Value;
  ChangeField('NOME_CLIENTEDAV', strq(Fnome_clientedav, 35));
end;

procedure TPedvenda_class.Setmd52(const Value: string);
begin
  Fmd52 := Value;
  ChangeField('MD52', strq(Fmd52, 256));
end;

procedure TPedvenda_class.Setcoo_impressao(const Value: Integer);
begin
  Fcoo_impressao := Value;
  ChangeField('COO_IMPRESSAO', Fcoo_impressao);
end;

procedure TPedvenda_class.Setnseriecf_impressao(const Value: string);
begin
  Fnseriecf_impressao := Value;
  ChangeField('NSERIECF_IMPRESSAO', strq(Fnseriecf_impressao, 20));
end;

procedure TPedvenda_class.Setoperador_impressao(const Value: Integer);
begin
  Foperador_impressao := Value;
  ChangeField('OPERADOR_IMPRESSAO', Foperador_impressao);
end;

procedure TPedvenda_class.Setpaf_num_prevenda(const Value: Integer);
begin
  Fpaf_num_prevenda := Value;
  ChangeField('PAF_NUM_PREVENDA', Fpaf_num_prevenda);
end;

procedure TPedvenda_class.Setpaf_status_prevenda(const Value: string);
begin
  Fpaf_status_prevenda := Value;
  ChangeField('PAF_STATUS_PREVENDA', strq(Fpaf_status_prevenda, 10));
end;

procedure TPedvenda_class.Setnped_originado(const Value: Integer);
begin
  Fnped_originado := Value;
  ChangeField('NPED_ORIGINADO', Fnped_originado);
end;

procedure TPedvenda_class.Settipo_originado(const Value: string);
begin
  Ftipo_originado := Value;
  ChangeField('TIPO_ORIGINADO', strq(Ftipo_originado, 3));
end;

procedure TPedvenda_class.Setcod_agenda(const Value: Integer);
begin
  Fcod_agenda := Value;
  ChangeField('COD_AGENDA', Fcod_agenda);
end;

procedure TPedvenda_class.Setstatus_conta_cliente(const Value: string);
begin
  Fstatus_conta_cliente := Value;
  ChangeField('STATUS_CONTA_CLIENTE', strq(Fstatus_conta_cliente, 32));
end;

procedure TPedvenda_class.Setcoo_conta_cliente(const Value: Integer);
begin
  Fcoo_conta_cliente := Value;
  ChangeField('COO_CONTA_CLIENTE', Fcoo_conta_cliente);
end;

procedure TPedvenda_class.Setcer_conta_cliente(const Value: Integer);
begin
  Fcer_conta_cliente := Value;
  ChangeField('CER_CONTA_CLIENTE', Fcer_conta_cliente);
end;

procedure TPedvenda_class.Setcodpesquisa(const Value: Integer);
begin
  Fcodpesquisa := Value;
  ChangeField('CODPESQUISA', Fcodpesquisa);
end;

procedure TPedvenda_class.Setorcparavnd(const Value: string);
begin
  Forcparavnd := Value;
  ChangeField('ORCPARAVND', strq(Forcparavnd, 1));
end;

procedure TPedvenda_class.Setcod_controle(const Value: Integer);
begin
  Fcod_controle := Value;
  ChangeField('COD_CONTROLE', Fcod_controle);
end;

procedure TPedvenda_class.Setgerente_aprovou(const Value: string);
begin
  Fgerente_aprovou := Value;
  ChangeField('GERENTE_APROVOU', strq(Fgerente_aprovou, 20));
end;

procedure TPedvenda_class.Setvalor_desc_avista(const Value: Double);
begin
  Fvalor_desc_avista := Value;
  ChangeField_f('VALOR_DESC_AVISTA', Fvalor_desc_avista);
end;

procedure TPedvenda_class.Setmetodo_entrega(const Value: string);
begin
  Fmetodo_entrega := Value;
  ChangeField('METODO_ENTREGA', strq(Fmetodo_entrega, 100));
end;

procedure TPedvenda_class.Setautorizado_financeiro(const Value: string);
begin
  Fautorizado_financeiro := Value;
  ChangeField('AUTORIZADO_FINANCEIRO', strq(Fautorizado_financeiro, 1));
end;

procedure TPedvenda_class.Setn_comando(const Value: Integer);
begin
  Fn_comando := Value;
  ChangeField('N_COMANDO', Fn_comando);
end;

procedure TPedvenda_class.Setenv_mobile(const Value: string);
begin
  Fenv_mobile := Value;
  ChangeField('ENV_MOBILE', strq(Fenv_mobile, 1));
end;

procedure TPedvenda_class.Setreaberto(const Value: string);
begin
  Freaberto := Value;
  ChangeField('REABERTO', strq(Freaberto, 1));
end;

procedure TPedvenda_class.Setregras_descontos(const Value: string);
begin
  Fregras_descontos := Value;
  ChangeField('REGRAS_DESCONTOS', strq(Fregras_descontos, 128));
end;

procedure TPedvenda_class.Setstatus_sep_conf(const Value: string);
begin
  Fstatus_sep_conf := Value;
  ChangeField('STATUS_SEP_CONF', strq(Fstatus_sep_conf, 24));
end;

procedure TPedvenda_class.Setnserieecf_conta_cliente(const Value: string);
begin
  Fnserieecf_conta_cliente := Value;
  ChangeField('NSERIEECF_CONTA_CLIENTE', strq(Fnserieecf_conta_cliente, 20));
end;

procedure TPedvenda_class.Setsaveauto(const Value: string);
begin
  Fsaveauto := Value;
  ChangeField('SAVEAUTO', strq(Fsaveauto, 1));
end;

procedure TPedvenda_class.Setcalc(const Value: string);
begin
  Fcalc := Value;
  ChangeField('CALC', strq(Fcalc, 1));
end;

procedure TPedvenda_class.Setus_edit(const Value: Integer);
begin
  Fus_edit := Value;
  ChangeField('US_EDIT', Fus_edit);
end;

procedure TPedvenda_class.Setdata_estoque(const Value: TDateTime);
begin
  Fdata_estoque := Value;
  ChangeField_dt('DATA_ESTOQUE', Fdata_estoque);
end;

procedure TPedvenda_class.Setcod_cliente_nfserv(const Value: Integer);
begin
  Fcod_cliente_nfserv := Value;
  ChangeField('COD_CLIENTE_NFSERV', Fcod_cliente_nfserv);
end;

procedure TPedvenda_class.Setqtde_libtrava(const Value: Integer);
begin
  Fqtde_libtrava := Value;
  ChangeField('QTDE_LIBTRAVA', Fqtde_libtrava);
end;

procedure TPedvenda_class.Setqtde_impressao(const Value: Integer);
begin
  Fqtde_impressao := Value;
  ChangeField('QTDE_IMPRESSAO', Fqtde_impressao);
end;

procedure TPedvenda_class.Setend_avl(const Value: string);
begin
  Fend_avl := Value;
  ChangeField('END_AVL', strq(Fend_avl, 25));
end;

procedure TPedvenda_class.Setbairro_avl(const Value: string);
begin
  Fbairro_avl := Value;
  ChangeField('BAIRRO_AVL', strq(Fbairro_avl, 17));
end;

procedure TPedvenda_class.Setcida_avl(const Value: string);
begin
  Fcida_avl := Value;
  ChangeField('CIDA_AVL', strq(Fcida_avl, 25));
end;

procedure TPedvenda_class.Setcep_avl(const Value: string);
begin
  Fcep_avl := Value;
  ChangeField('CEP_AVL', strq(Fcep_avl, 8));
end;

procedure TPedvenda_class.Setesta_avl(const Value: string);
begin
  Festa_avl := Value;
  ChangeField('ESTA_AVL', strq(Festa_avl, 12));
end;

procedure TPedvenda_class.Setcod_vendedor1(const Value: Integer);
begin
  Fcod_vendedor1 := Value;
  ChangeField('COD_VENDEDOR1', Fcod_vendedor1);
end;

procedure TPedvenda_class.Setselos_col(const Value: TStrings);
begin
  Fselos_col := Value;
  ChangeField('SELOS_COL', Fselos_col);
end;

procedure TPedvenda_class.Setselos_rem(const Value: TStrings);
begin
  Fselos_rem := Value;
  ChangeField('SELOS_REM', Fselos_rem);
end;

procedure TPedvenda_class.Setlacres_col(const Value: TStrings);
begin
  Flacres_col := Value;
  ChangeField('LACRES_COL', Flacres_col);
end;

procedure TPedvenda_class.Setlacres_rem(const Value: TStrings);
begin
  Flacres_rem := Value;
  ChangeField('LACRES_REM', Flacres_rem);
end;

procedure TPedvenda_class.Setn_nfd(const Value: Integer);
begin
  Fn_nfd := Value;
  ChangeField('N_NFD', Fn_nfd);
end;

procedure TPedvenda_class.Setserie_nfd(const Value: string);
begin
  Fserie_nfd := Value;
  ChangeField('SERIE_NFD', strq(Fserie_nfd, 5));
end;

procedure TPedvenda_class.Setnfd_gerou(const Value: string);
begin
  Fnfd_gerou := Value;
  ChangeField('NFD_GEROU', strq(Fnfd_gerou, 1));
end;

procedure TPedvenda_class.Setdata_nfd(const Value: TDateTime);
begin
  Fdata_nfd := Value;
  ChangeField_dt('DATA_NFD', Fdata_nfd);
end;

procedure TPedvenda_class.Setvalor_nfd(const Value: Double);
begin
  Fvalor_nfd := Value;
  ChangeField_f('VALOR_NFD', Fvalor_nfd);
end;

procedure TPedvenda_class.Setcod_gerador(const Value: Integer);
begin
  Fcod_gerador := Value;
  ChangeField('COD_GERADOR', Fcod_gerador);
end;

procedure TPedvenda_class.Setcod_nfce(const Value: Integer);
begin
  Fcod_nfce := Value;
  ChangeField('COD_NFCE', Fcod_nfce);
end;

procedure TPedvenda_class.Setenv_email_nfs(const Value: string);
begin
  Fenv_email_nfs := Value;
  ChangeField('ENV_EMAIL_NFS', strq(Fenv_email_nfs, 1));
end;

procedure TPedvenda_class.Settot_serv_terc(const Value: Double);
begin
  Ftot_serv_terc := Value;
  ChangeField_f('TOT_SERV_TERC', Ftot_serv_terc);
end;

procedure TPedvenda_class.Settot_prod_terc(const Value: Double);
begin
  Ftot_prod_terc := Value;
  ChangeField_f('TOT_PROD_TERC', Ftot_prod_terc);
end;

procedure TPedvenda_class.Settp_venda(const Value: string);
begin
  Ftp_venda := Value;
  ChangeField('TP_VENDA', strq(Ftp_venda, 1));
end;

procedure TPedvenda_class.Setcl_clultimacompra(const Value: string);
begin
  Fcl_clultimacompra := Value;
  ChangeField('CL_CLULTIMACOMPRA', strq(Fcl_clultimacompra, 2));
end;

procedure TPedvenda_class.Setcl_status_f(const Value: string);
begin
  Fcl_status_f := Value;
  ChangeField('CL_STATUS_F', strq(Fcl_status_f, 10));
end;

procedure TPedvenda_class.Settp_gerar_pontos(const Value: string);
begin
  Ftp_gerar_pontos := Value;
  ChangeField('TP_GERAR_PONTOS', strq(Ftp_gerar_pontos, 1));
end;

procedure TPedvenda_class.Setvale_troca(const Value: string);
begin
  Fvale_troca := Value;
  ChangeField('VALE_TROCA', strq(Fvale_troca, 1));
end;

procedure TPedvenda_class.Setvalor_vale_prg(const Value: Double);
begin
  Fvalor_vale_prg := Value;
  ChangeField_f('VALOR_VALE_PRG', Fvalor_vale_prg);
end;

procedure TPedvenda_class.Setdest_seqid(const Value: Integer);
begin
  Fdest_seqid := Value;
  ChangeField('DEST_SEQID', Fdest_seqid);
end;

procedure TPedvenda_class.Setdest_seqid_entrg(const Value: Integer);
begin
  Fdest_seqid_entrg := Value;
  ChangeField('DEST_SEQID_ENTRG', Fdest_seqid_entrg);
end;

procedure TPedvenda_class.Setcod_fatura(const Value: Integer);
begin
  Fcod_fatura := Value;
  ChangeField('COD_FATURA', Fcod_fatura);
end;

procedure TPedvenda_class.Setvl_comissao_vend(const Value: Double);
begin
  Fvl_comissao_vend := Value;
  ChangeField_f('VL_COMISSAO_VEND', Fvl_comissao_vend);
end;

procedure TPedvenda_class.Setperc_comissao_vend(const Value: Double);
begin
  Fperc_comissao_vend := Value;
  ChangeField_f('PERC_COMISSAO_VEND', Fperc_comissao_vend);
end;

procedure TPedvenda_class.Setvl_comissao_vend1(const Value: Double);
begin
  Fvl_comissao_vend1 := Value;
  ChangeField_f('VL_COMISSAO_VEND1', Fvl_comissao_vend1);
end;

procedure TPedvenda_class.Setperc_comissao_vend1(const Value: Double);
begin
  Fperc_comissao_vend1 := Value;
  ChangeField_f('PERC_COMISSAO_VEND1', Fperc_comissao_vend1);
end;

procedure TPedvenda_class.Setcont_alt(const Value: Integer);
begin
  Fcont_alt := Value;
  ChangeField('CONT_ALT', Fcont_alt);
end;

procedure TPedvenda_class.Setlocal_incidencia(const Value: Integer);
begin
  Flocal_incidencia := Value;
  ChangeField('LOCAL_INCIDENCIA', Flocal_incidencia);
end;

procedure TPedvenda_class.Setnf_ac_calctrib(const Value: string);
begin
  Fnf_ac_calctrib := Value;
  ChangeField('NF_AC_CALCTRIB', strq(Fnf_ac_calctrib, 1));
end;

procedure TPedvenda_class.Setnf_ac_seguro(const Value: Double);
begin
  Fnf_ac_seguro := Value;
  ChangeField_f('NF_AC_SEGURO', Fnf_ac_seguro);
end;

procedure TPedvenda_class.Setnf_ac_outras(const Value: Double);
begin
  Fnf_ac_outras := Value;
  ChangeField_f('NF_AC_OUTRAS', Fnf_ac_outras);
end;

procedure TPedvenda_class.Setnf_ac_frete(const Value: Double);
begin
  Fnf_ac_frete := Value;
  ChangeField_f('NF_AC_FRETE', Fnf_ac_frete);
end;

procedure TPedvenda_class.Setnf_ac_ipi(const Value: Double);
begin
  Fnf_ac_ipi := Value;
  ChangeField_f('NF_AC_IPI', Fnf_ac_ipi);
end;

procedure TPedvenda_class.Setnf_ac_icmsst(const Value: Double);
begin
  Fnf_ac_icmsst := Value;
  ChangeField_f('NF_AC_ICMSST', Fnf_ac_icmsst);
end;

procedure TPedvenda_class.Setnf_ac_fcpst(const Value: Double);
begin
  Fnf_ac_fcpst := Value;
  ChangeField_f('NF_AC_FCPST', Fnf_ac_fcpst);
end;

procedure TPedvenda_class.Setnf_ac_imposto_ii(const Value: Double);
begin
  Fnf_ac_imposto_ii := Value;
  ChangeField_f('NF_AC_IMPOSTO_II', Fnf_ac_imposto_ii);
end;

procedure TPedvenda_class.Setnf_freteconta(const Value: string);
begin
  Fnf_freteconta := Value;
  ChangeField('NF_FRETECONTA', strq(Fnf_freteconta, 1));
end;

procedure TPedvenda_class.Setid_commerce(const Value: Integer);
begin
  Fid_commerce := Value;
  ChangeField('ID_COMMERCE', Fid_commerce);
end;

procedure TPedvenda_class.Setcod_forma_rast(const Value: Integer);
begin
  Fcod_forma_rast := Value;
  ChangeField('COD_FORMA_RAST', Fcod_forma_rast);
end;

procedure TPedvenda_class.Setdata_envio_rast(const Value: TDateTime);
begin
  Fdata_envio_rast := Value;
  ChangeField_dt('DATA_ENVIO_RAST', Fdata_envio_rast);
end;

procedure TPedvenda_class.Setcod_rastreamento(const Value: string);
begin
  Fcod_rastreamento := Value;
  ChangeField('COD_RASTREAMENTO', strq(Fcod_rastreamento, 30));
end;

procedure TPedvenda_class.Setidsitped_ec(const Value: Integer);
begin
  Fidsitped_ec := Value;
  ChangeField('IDSITPED_EC', Fidsitped_ec);
end;

procedure TPedvenda_class.Setstatus_ec(const Value: string);
begin
  Fstatus_ec := Value;
  ChangeField('STATUS_EC', strq(Fstatus_ec, 100));
end;

procedure TPedvenda_class.Setnf_cf_deson_emb(const Value: string);
begin
  Fnf_cf_deson_emb := Value;
  ChangeField('NF_CF_DESON_EMB', strq(Fnf_cf_deson_emb, 1));
end;

procedure TPedvenda_class.Setnf_dc_desconto(const Value: Double);
begin
  Fnf_dc_desconto := Value;
  ChangeField_f('NF_DC_DESCONTO', Fnf_dc_desconto);
end;

procedure TPedvenda_class.Setnf_dc_vicmdeson(const Value: Double);
begin
  Fnf_dc_vicmdeson := Value;
  ChangeField_f('NF_DC_VICMDESON', Fnf_dc_vicmdeson);
end;

procedure TPedvenda_class.Setnf_ac_vicmdeson(const Value: Double);
begin
  Fnf_ac_vicmdeson := Value;
  ChangeField_f('NF_AC_VICMDESON', Fnf_ac_vicmdeson);
end;

procedure TPedvenda_class.Setfinalidadeid(const Value: Integer);
begin
  Ffinalidadeid := Value;
  ChangeField('FINALIDADEID', Ffinalidadeid);
end;

procedure TPedvenda_class.Setcod_cli_fat(const Value: Integer);
begin
  Fcod_cli_fat := Value;
  ChangeField('COD_CLI_FAT', Fcod_cli_fat);
end;

{ TPedvenda_classList }

function TPedvenda_classList.GetItem(Index: Integer): TPedvenda_class;
begin
  Result := TPedvenda_class(inherited Items[Index]);
end;

function TPedvenda_classList.New: TPedvenda_class;
begin
  Result := TPedvenda_class.Create;
  Add(Result);
end;

procedure TPedvenda_classList.SetItem(Index: Integer; const Value: TPedvenda_class);
begin
  Put(Index, Value);
end;

procedure TPedvenda_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
