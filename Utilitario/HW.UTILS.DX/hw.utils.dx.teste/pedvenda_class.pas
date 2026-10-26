unit pedvenda_class;

interface

uses
{$IFDEF VER180}
  Classes,
  Contnrs,
  DB;
{$ELSE}
  System.Classes,
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  TPedvenda_class = class(TObject)
  private
    Fnped                   : Integer;
    Ftipo                   : string;
    Fcod_empresa            : Integer;
    Fcod_cliente            : Integer;
    Fcod_vendedor           : Integer;
    Fcod_cond_pag           : Integer;
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
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property nped                   : Integer   read Fnped                    write Fnped;
    property tipo                   : string    read Ftipo                    write Ftipo;
    property cod_empresa            : Integer   read Fcod_empresa             write Fcod_empresa;
    property cod_cliente            : Integer   read Fcod_cliente             write Fcod_cliente;
    property cod_vendedor           : Integer   read Fcod_vendedor            write Fcod_vendedor;
    property cod_cond_pag           : Integer   read Fcod_cond_pag            write Fcod_cond_pag;
    property n_mov_cxl              : Integer   read Fn_mov_cxl               write Fn_mov_cxl;
    property dia_cxl                : TDateTime read Fdia_cxl                 write Fdia_cxl;
    property data_ped               : TDateTime read Fdata_ped                write Fdata_ped;
    property data_fech              : TDateTime read Fdata_fech               write Fdata_fech;
    property datvenc                : TDateTime read Fdatvenc                 write Fdatvenc;
    property valor_total            : Double    read Fvalor_total             write Fvalor_total;
    property desc_p_prod            : Double    read Fdesc_p_prod             write Fdesc_p_prod;
    property desc_p_serv            : Double    read Fdesc_p_serv             write Fdesc_p_serv;
    property desconto               : Double    read Fdesconto                write Fdesconto;
    property obs_ped                : string    read Fobs_ped                 write Fobs_ped;
    property status_ped             : string    read Fstatus_ped              write Fstatus_ped;
    property tipv                   : string    read Ftipv                    write Ftipv;
    property obs_cxl_rq             : string    read Fobs_cxl_rq              write Fobs_cxl_rq;
    property status_cxl_rq          : string    read Fstatus_cxl_rq           write Fstatus_cxl_rq;
    property vl_pago_cxl            : Double    read Fvl_pago_cxl             write Fvl_pago_cxl;
    property selec                  : string    read Fselec                   write Fselec;
    property tipor                  : string    read Ftipor                   write Ftipor;
    property horaabertura           : Integer   read Fhoraabertura            write Fhoraabertura;
    property minabertura            : Integer   read Fminabertura             write Fminabertura;
    property horafechamento         : Integer   read Fhorafechamento          write Fhorafechamento;
    property minfechamento          : Integer   read Fminfechamento           write Fminfechamento;
    property horasubtotal           : Integer   read Fhorasubtotal            write Fhorasubtotal;
    property minsubtotal            : Integer   read Fminsubtotal             write Fminsubtotal;
    property ncupom                 : Integer   read Fncupom                  write Fncupom;
    property operador               : Integer   read Foperador                write Foperador;
    property data_cupom             : TDateTime read Fdata_cupom              write Fdata_cupom;
    property da                     : string    read Fda                      write Fda;
    property nserieecf              : string    read Fnserieecf               write Fnserieecf;
    property nome_receb             : string    read Fnome_receb              write Fnome_receb;
    property end_receb              : string    read Fend_receb               write Fend_receb;
    property bairro_receb           : string    read Fbairro_receb            write Fbairro_receb;
    property cida_receb             : string    read Fcida_receb              write Fcida_receb;
    property cep_receb              : string    read Fcep_receb               write Fcep_receb;
    property fone_receb             : string    read Ffone_receb              write Ffone_receb;
    property obs_minuta             : TStrings  read Fobs_minuta              write Fobs_minuta;
    property grupo_prod             : Integer   read Fgrupo_prod              write Fgrupo_prod;
    property cod_prod               : string    read Fcod_prod                write Fcod_prod;
    property op_cxl                 : Integer   read Fop_cxl                  write Fop_cxl;
    property cod_cidade_receb       : Integer   read Fcod_cidade_receb        write Fcod_cidade_receb;
    property cod_bairro_receb       : Integer   read Fcod_bairro_receb        write Fcod_bairro_receb;
    property vl_entrada             : Double    read Fvl_entrada              write Fvl_entrada;
    property codigo_ctrl            : Integer   read Fcodigo_ctrl             write Fcodigo_ctrl;
    property nprevenda              : Integer   read Fnprevenda               write Fnprevenda;
    property stat_req               : string    read Fstat_req                write Fstat_req;
    property acresc_p_prod          : Double    read Facresc_p_prod           write Facresc_p_prod;
    property acresc_p_serv          : Double    read Facresc_p_serv           write Facresc_p_serv;
    property acrescimo              : Double    read Facrescimo               write Facrescimo;
    property placa                  : string    read Fplaca                   write Fplaca;
    property chassi                 : string    read Fchassi                  write Fchassi;
    property km_v                   : Integer   read Fkm_v                    write Fkm_v;
    property orc_prod               : Integer   read Forc_prod                write Forc_prod;
    property dt_prometida           : TDateTime read Fdt_prometida            write Fdt_prometida;
    property obs_os                 : TStrings  read Fobs_os                  write Fobs_os;
    property aparelho_ped           : string    read Faparelho_ped            write Faparelho_ped;
    property guarda_vol             : string    read Fguarda_vol              write Fguarda_vol;
    property combust_veic           : string    read Fcombust_veic            write Fcombust_veic;
    property defeito                : TStrings  read Fdefeito                 write Fdefeito;
    property estado_veic            : TStrings  read Festado_veic             write Festado_veic;
    property acessorios             : TStrings  read Facessorios              write Facessorios;
    property tipo_os                : string    read Ftipo_os                 write Ftipo_os;
    property h_ent                  : TDateTime read Fh_ent                   write Fh_ent;
    property h_prometida            : TDateTime read Fh_prometida             write Fh_prometida;
    property data_nf                : TDateTime read Fdata_nf                 write Fdata_nf;
    property dt_nfgarantia          : TDateTime read Fdt_nfgarantia           write Fdt_nfgarantia;
    property tot_prod               : Double    read Ftot_prod                write Ftot_prod;
    property tot_serv               : Double    read Ftot_serv                write Ftot_serv;
    property tp_abord               : string    read Ftp_abord                write Ftp_abord;
    property fr_pagbosch            : string    read Ffr_pagbosch             write Ffr_pagbosch;
    property seq_fech               : Integer   read Fseq_fech                write Fseq_fech;
    property em_nf                  : string    read Fem_nf                   write Fem_nf;
    property cod_equip              : Integer   read Fcod_equip               write Fcod_equip;
    property n_serie                : string    read Fn_serie                 write Fn_serie;
    property num_nf                 : Integer   read Fnum_nf                  write Fnum_nf;
    property obs_livro_reg          : string    read Fobs_livro_reg           write Fobs_livro_reg;
    property valor_nf               : Double    read Fvalor_nf                write Fvalor_nf;
    property nf_pgarantia           : Integer   read Fnf_pgarantia            write Fnf_pgarantia;
    property nome_nf_garantia       : string    read Fnome_nf_garantia        write Fnome_nf_garantia;
    property hora_fech              : string    read Fhora_fech               write Fhora_fech;
    property st_term_serv           : string    read Fst_term_serv            write Fst_term_serv;
    property registro_de_entrega    : string    read Fregistro_de_entrega     write Fregistro_de_entrega;
    property ativo                  : Integer   read Fativo                   write Fativo;
    property tipo_orc               : string    read Ftipo_orc                write Ftipo_orc;
    property status_cupom           : string    read Fstatus_cupom            write Fstatus_cupom;
    property codterm_status         : Integer   read Fcodterm_status          write Fcodterm_status;
    property cpfcgc                 : string    read Fcpfcgc                  write Fcpfcgc;
    property nome_cli_orc           : string    read Fnome_cli_orc            write Fnome_cli_orc;
    property cod_orcamento          : Integer   read Fcod_orcamento           write Fcod_orcamento;
    property obs_red_os             : string    read Fobs_red_os              write Fobs_red_os;
    property cod_veiculo            : Integer   read Fcod_veiculo             write Fcod_veiculo;
    property num_nfeext             : Int64     read Fnum_nfeext              write Fnum_nfeext;
    property data_nfext             : TDateTime read Fdata_nfext              write Fdata_nfext;
    property valor_nfext            : Double    read Fvalor_nfext             write Fvalor_nfext;
    property serie_nf               : string    read Fserie_nf                write Fserie_nf;
    property ccf_cupom              : Integer   read Fccf_cupom               write Fccf_cupom;
    property libtrava               : string    read Flibtrava                write Flibtrava;
    property md5                    : string    read Fmd5                     write Fmd5;
    property dav_impresso           : string    read Fdav_impresso            write Fdav_impresso;
    property dependente             : Integer   read Fdependente              write Fdependente;
    property subtipo_os             : string    read Fsubtipo_os              write Fsubtipo_os;
    property cod_carga              : Integer   read Fcod_carga               write Fcod_carga;
    property aprovada_gerente       : string    read Faprovada_gerente        write Faprovada_gerente;
    property npedmob                : Integer   read Fnpedmob                 write Fnpedmob;
    property idmobile               : Integer   read Fidmobile                write Fidmobile;
    property data_libtrava          : TDateTime read Fdata_libtrava           write Fdata_libtrava;
    property cod_nf                 : Integer   read Fcod_nf                  write Fcod_nf;
    property nf_gerou               : string    read Fnf_gerou                write Fnf_gerou;
    property cod_agendamento        : Integer   read Fcod_agendamento         write Fcod_agendamento;
    property status_contrato        : string    read Fstatus_contrato         write Fstatus_contrato;
    property nome_clientedav        : string    read Fnome_clientedav         write Fnome_clientedav;
    property md52                   : string    read Fmd52                    write Fmd52;
    property coo_impressao          : Integer   read Fcoo_impressao           write Fcoo_impressao;
    property nseriecf_impressao     : string    read Fnseriecf_impressao      write Fnseriecf_impressao;
    property operador_impressao     : Integer   read Foperador_impressao      write Foperador_impressao;
    property paf_num_prevenda       : Integer   read Fpaf_num_prevenda        write Fpaf_num_prevenda;
    property paf_status_prevenda    : string    read Fpaf_status_prevenda     write Fpaf_status_prevenda;
    property nped_originado         : Integer   read Fnped_originado          write Fnped_originado;
    property tipo_originado         : string    read Ftipo_originado          write Ftipo_originado;
    property cod_agenda             : Integer   read Fcod_agenda              write Fcod_agenda;
    property status_conta_cliente   : string    read Fstatus_conta_cliente    write Fstatus_conta_cliente;
    property coo_conta_cliente      : Integer   read Fcoo_conta_cliente       write Fcoo_conta_cliente;
    property cer_conta_cliente      : Integer   read Fcer_conta_cliente       write Fcer_conta_cliente;
    property codpesquisa            : Integer   read Fcodpesquisa             write Fcodpesquisa;
    property orcparavnd             : string    read Forcparavnd              write Forcparavnd;
    property cod_controle           : Integer   read Fcod_controle            write Fcod_controle;
    property gerente_aprovou        : string    read Fgerente_aprovou         write Fgerente_aprovou;
    property valor_desc_avista      : Double    read Fvalor_desc_avista       write Fvalor_desc_avista;
    property metodo_entrega         : string    read Fmetodo_entrega          write Fmetodo_entrega;
    property autorizado_financeiro  : string    read Fautorizado_financeiro   write Fautorizado_financeiro;
    property n_comando              : Integer   read Fn_comando               write Fn_comando;
    property env_mobile             : string    read Fenv_mobile              write Fenv_mobile;
    property reaberto               : string    read Freaberto                write Freaberto;
    property regras_descontos       : string    read Fregras_descontos        write Fregras_descontos;
    property status_sep_conf        : string    read Fstatus_sep_conf         write Fstatus_sep_conf;
    property nserieecf_conta_cliente: string    read Fnserieecf_conta_cliente write Fnserieecf_conta_cliente;
    property saveauto               : string    read Fsaveauto                write Fsaveauto;
    property calc                   : string    read Fcalc                    write Fcalc;
    property us_edit                : Integer   read Fus_edit                 write Fus_edit;
    property data_estoque           : TDateTime read Fdata_estoque            write Fdata_estoque;
    property cod_cliente_nfserv     : Integer   read Fcod_cliente_nfserv      write Fcod_cliente_nfserv;
    property qtde_libtrava          : Integer   read Fqtde_libtrava           write Fqtde_libtrava;
    property qtde_impressao         : Integer   read Fqtde_impressao          write Fqtde_impressao;
    property end_avl                : string    read Fend_avl                 write Fend_avl;
    property bairro_avl             : string    read Fbairro_avl              write Fbairro_avl;
    property cida_avl               : string    read Fcida_avl                write Fcida_avl;
    property cep_avl                : string    read Fcep_avl                 write Fcep_avl;
    property esta_avl               : string    read Festa_avl                write Festa_avl;
    property cod_vendedor1          : Integer   read Fcod_vendedor1           write Fcod_vendedor1;
    property selos_col              : TStrings  read Fselos_col               write Fselos_col;
    property selos_rem              : TStrings  read Fselos_rem               write Fselos_rem;
    property lacres_col             : TStrings  read Flacres_col              write Flacres_col;
    property lacres_rem             : TStrings  read Flacres_rem              write Flacres_rem;
    property n_nfd                  : Integer   read Fn_nfd                   write Fn_nfd;
    property serie_nfd              : string    read Fserie_nfd               write Fserie_nfd;
    property nfd_gerou              : string    read Fnfd_gerou               write Fnfd_gerou;
    property data_nfd               : TDateTime read Fdata_nfd                write Fdata_nfd;
    property valor_nfd              : Double    read Fvalor_nfd               write Fvalor_nfd;
    property cod_gerador            : Integer   read Fcod_gerador             write Fcod_gerador;
    property cod_nfce               : Integer   read Fcod_nfce                write Fcod_nfce;
    property env_email_nfs          : string    read Fenv_email_nfs           write Fenv_email_nfs;
    property tot_serv_terc          : Double    read Ftot_serv_terc           write Ftot_serv_terc;
    property tot_prod_terc          : Double    read Ftot_prod_terc           write Ftot_prod_terc;
    property tp_venda               : string    read Ftp_venda                write Ftp_venda;
    property cl_clultimacompra      : string    read Fcl_clultimacompra       write Fcl_clultimacompra;
    property cl_status_f            : string    read Fcl_status_f             write Fcl_status_f;
    property tp_gerar_pontos        : string    read Ftp_gerar_pontos         write Ftp_gerar_pontos;
    property vale_troca             : string    read Fvale_troca              write Fvale_troca;
    property valor_vale_prg         : Double    read Fvalor_vale_prg          write Fvalor_vale_prg;
    property dest_seqid             : Integer   read Fdest_seqid              write Fdest_seqid;
    property dest_seqid_entrg       : Integer   read Fdest_seqid_entrg        write Fdest_seqid_entrg;
    property cod_fatura             : Integer   read Fcod_fatura              write Fcod_fatura;
    property vl_comissao_vend       : Double    read Fvl_comissao_vend        write Fvl_comissao_vend;
    property perc_comissao_vend     : Double    read Fperc_comissao_vend      write Fperc_comissao_vend;
    property vl_comissao_vend1      : Double    read Fvl_comissao_vend1       write Fvl_comissao_vend1;
    property perc_comissao_vend1    : Double    read Fperc_comissao_vend1     write Fperc_comissao_vend1;
    property cont_alt               : Integer   read Fcont_alt                write Fcont_alt;
    property local_incidencia       : Integer   read Flocal_incidencia        write Flocal_incidencia;
    property nf_ac_calctrib         : string    read Fnf_ac_calctrib          write Fnf_ac_calctrib;
    property nf_ac_seguro           : Double    read Fnf_ac_seguro            write Fnf_ac_seguro;
    property nf_ac_outras           : Double    read Fnf_ac_outras            write Fnf_ac_outras;
    property nf_ac_frete            : Double    read Fnf_ac_frete             write Fnf_ac_frete;
    property nf_ac_ipi              : Double    read Fnf_ac_ipi               write Fnf_ac_ipi;
    property nf_ac_icmsst           : Double    read Fnf_ac_icmsst            write Fnf_ac_icmsst;
    property nf_ac_fcpst            : Double    read Fnf_ac_fcpst             write Fnf_ac_fcpst;
    property nf_ac_imposto_ii       : Double    read Fnf_ac_imposto_ii        write Fnf_ac_imposto_ii;
    property nf_freteconta          : string    read Fnf_freteconta           write Fnf_freteconta;
    property id_commerce            : Integer   read Fid_commerce             write Fid_commerce;
    property cod_forma_rast         : Integer   read Fcod_forma_rast          write Fcod_forma_rast;
    property data_envio_rast        : TDateTime read Fdata_envio_rast         write Fdata_envio_rast;
    property cod_rastreamento       : string    read Fcod_rastreamento        write Fcod_rastreamento;
    property idsitped_ec            : Integer   read Fidsitped_ec             write Fidsitped_ec;
    property status_ec              : string    read Fstatus_ec               write Fstatus_ec;
    property nf_cf_deson_emb        : string    read Fnf_cf_deson_emb         write Fnf_cf_deson_emb;
    property nf_dc_desconto         : Double    read Fnf_dc_desconto          write Fnf_dc_desconto;
    property nf_dc_vicmdeson        : Double    read Fnf_dc_vicmdeson         write Fnf_dc_vicmdeson;
    property nf_ac_vicmdeson        : Double    read Fnf_ac_vicmdeson         write Fnf_ac_vicmdeson;
  end;

  TPedvenda_classList = class(TObjectList)
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
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TPedvenda_class }

constructor TPedvenda_class.Create;
begin
  Fobs_minuta  := TStringList.Create;
  Fobs_os      := TStringList.Create;
  Fdefeito     := TStringList.Create;
  Festado_veic := TStringList.Create;
  Facessorios  := TStringList.Create;
  Fativo       := 1;
  Fselos_col   := TStringList.Create;
  Fselos_rem   := TStringList.Create;
  Flacres_col  := TStringList.Create;
  Flacres_rem  := TStringList.Create;
end;

destructor TPedvenda_class.Destroy;
begin
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
  Result := '@nped, @tipo, @cod_empresa, @cod_cliente, @cod_vendedor, @cod_cond_pag, @n_mov_cxl, @dia_cxl, @data_ped,' +
            ' @data_fech, @datvenc, @valor_total, @desc_p_prod, @desc_p_serv, @desconto, @obs_ped, @status_ped, @tipv,' +
            ' @obs_cxl_rq, @status_cxl_rq, @vl_pago_cxl, @selec, @tipor, @horaabertura, @minabertura, @horafechamento,' +
            ' @minfechamento, @horasubtotal, @minsubtotal, @ncupom, @operador, @data_cupom, @da, @nserieecf, @nome_receb,' +
            ' @end_receb, @bairro_receb, @cida_receb, @cep_receb, @fone_receb, @obs_minuta, @grupo_prod, @cod_prod,' +
            ' @op_cxl, @cod_cidade_receb, @cod_bairro_receb, @vl_entrada, @codigo_ctrl, @nprevenda, @stat_req,' +
            ' @acresc_p_prod, @acresc_p_serv, @acrescimo, @placa, @chassi, @km_v, @orc_prod, @dt_prometida, @obs_os,' +
            ' @aparelho_ped, @guarda_vol, @combust_veic, @defeito, @estado_veic, @acessorios, @tipo_os, @h_ent,' +
            ' @h_prometida, @data_nf, @dt_nfgarantia, @tot_prod, @tot_serv, @tp_abord, @fr_pagbosch, @seq_fech, @em_nf,' +
            ' @cod_equip, @n_serie, @num_nf, @obs_livro_reg, @valor_nf, @nf_pgarantia, @nome_nf_garantia, @hora_fech,' +
            ' @st_term_serv, @registro_de_entrega, @ativo, @tipo_orc, @status_cupom, @codterm_status, @cpfcgc,' +
            ' @nome_cli_orc, @cod_orcamento, @obs_red_os, @cod_veiculo, @num_nfeext, @data_nfext, @valor_nfext, @serie_nf,' +
            ' @ccf_cupom, @libtrava, @md5, @dav_impresso, @dependente, @subtipo_os, @cod_carga, @aprovada_gerente,' +
            ' @npedmob, @idmobile, @data_libtrava, @cod_nf, @nf_gerou, @cod_agendamento, @status_contrato,' +
            ' @nome_clientedav, @md52, @coo_impressao, @nseriecf_impressao, @operador_impressao, @paf_num_prevenda,' +
            ' @paf_status_prevenda, @nped_originado, @tipo_originado, @cod_agenda, @status_conta_cliente,' +
            ' @coo_conta_cliente, @cer_conta_cliente, @codpesquisa, @orcparavnd, @cod_controle, @gerente_aprovou,' +
            ' @valor_desc_avista, @metodo_entrega, @autorizado_financeiro, @n_comando, @env_mobile, @reaberto,' +
            ' @regras_descontos, @status_sep_conf, @nserieecf_conta_cliente, @saveauto, @calc, @us_edit, @data_estoque,' +
            ' @cod_cliente_nfserv, @qtde_libtrava, @qtde_impressao, @end_avl, @bairro_avl, @cida_avl, @cep_avl, @esta_avl,' +
            ' @cod_vendedor1, @selos_col, @selos_rem, @lacres_col, @lacres_rem, @n_nfd, @serie_nfd, @nfd_gerou, @data_nfd,' +
            ' @valor_nfd, @cod_gerador, @cod_nfce, @env_email_nfs, @tot_serv_terc, @tot_prod_terc, @tp_venda,' +
            ' @cl_clultimacompra, @cl_status_f, @tp_gerar_pontos, @vale_troca, @valor_vale_prg, @dest_seqid,' +
            ' @dest_seqid_entrg, @cod_fatura, @vl_comissao_vend, @perc_comissao_vend, @vl_comissao_vend1,' +
            ' @perc_comissao_vend1, @cont_alt, @local_incidencia, @nf_ac_calctrib, @nf_ac_seguro, @nf_ac_outras,' +
            ' @nf_ac_frete, @nf_ac_ipi, @nf_ac_icmsst, @nf_ac_fcpst, @nf_ac_imposto_ii, @nf_freteconta, @id_commerce,' +
            ' @cod_forma_rast, @data_envio_rast, @cod_rastreamento, @idsitped_ec, @status_ec, @nf_cf_deson_emb,' +
            ' @nf_dc_desconto, @nf_dc_vicmdeson, @nf_ac_vicmdeson';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedvenda_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fnped                    := ADataSet.FieldByName('NPED').AsInteger;
    Ftipo                    := Trim(ADataSet.FieldByName('TIPO').AsString);
    Fcod_empresa             := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcod_cliente             := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    Fcod_vendedor            := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    Fcod_cond_pag            := ADataSet.FieldByName('COD_COND_PAG').AsInteger;
    Fn_mov_cxl               := ADataSet.FieldByName('N_MOV_CXL').AsInteger;
    Fdia_cxl                 := ADataSet.FieldByName('DIA_CXL').AsDateTime;
    Fdata_ped                := ADataSet.FieldByName('DATA_PED').AsDateTime;
    Fdata_fech               := ADataSet.FieldByName('DATA_FECH').AsDateTime;
    Fdatvenc                 := ADataSet.FieldByName('DATVENC').AsDateTime;
    Fvalor_total             := ADataSet.FieldByName('VALOR_TOTAL').AsFloat;
    Fdesc_p_prod             := ADataSet.FieldByName('DESC_P_PROD').AsFloat;
    Fdesc_p_serv             := ADataSet.FieldByName('DESC_P_SERV').AsFloat;
    Fdesconto                := ADataSet.FieldByName('DESCONTO').AsFloat;
    Fobs_ped                 := Trim(ADataSet.FieldByName('OBS_PED').AsString);
    Fstatus_ped              := Trim(ADataSet.FieldByName('STATUS_PED').AsString);
    Ftipv                    := Trim(ADataSet.FieldByName('TIPV').AsString);
    Fobs_cxl_rq              := Trim(ADataSet.FieldByName('OBS_CXL_RQ').AsString);
    Fstatus_cxl_rq           := Trim(ADataSet.FieldByName('STATUS_CXL_RQ').AsString);
    Fvl_pago_cxl             := ADataSet.FieldByName('VL_PAGO_CXL').AsFloat;
    Fselec                   := Trim(ADataSet.FieldByName('SELEC').AsString);
    Ftipor                   := Trim(ADataSet.FieldByName('TIPOR').AsString);
    Fhoraabertura            := ADataSet.FieldByName('HORAABERTURA').AsInteger;
    Fminabertura             := ADataSet.FieldByName('MINABERTURA').AsInteger;
    Fhorafechamento          := ADataSet.FieldByName('HORAFECHAMENTO').AsInteger;
    Fminfechamento           := ADataSet.FieldByName('MINFECHAMENTO').AsInteger;
    Fhorasubtotal            := ADataSet.FieldByName('HORASUBTOTAL').AsInteger;
    Fminsubtotal             := ADataSet.FieldByName('MINSUBTOTAL').AsInteger;
    Fncupom                  := ADataSet.FieldByName('NCUPOM').AsInteger;
    Foperador                := ADataSet.FieldByName('OPERADOR').AsInteger;
    Fdata_cupom              := ADataSet.FieldByName('DATA_CUPOM').AsDateTime;
    Fda                      := Trim(ADataSet.FieldByName('DA').AsString);
    Fnserieecf               := Trim(ADataSet.FieldByName('NSERIEECF').AsString);
    Fnome_receb              := Trim(ADataSet.FieldByName('NOME_RECEB').AsString);
    Fend_receb               := Trim(ADataSet.FieldByName('END_RECEB').AsString);
    Fbairro_receb            := Trim(ADataSet.FieldByName('BAIRRO_RECEB').AsString);
    Fcida_receb              := Trim(ADataSet.FieldByName('CIDA_RECEB').AsString);
    Fcep_receb               := Trim(ADataSet.FieldByName('CEP_RECEB').AsString);
    Ffone_receb              := Trim(ADataSet.FieldByName('FONE_RECEB').AsString);
    Fobs_minuta.Text         := Trim(ADataSet.FieldByName('OBS_MINUTA').AsString);
    Fgrupo_prod              := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod                := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fop_cxl                  := ADataSet.FieldByName('OP_CXL').AsInteger;
    Fcod_cidade_receb        := ADataSet.FieldByName('COD_CIDADE_RECEB').AsInteger;
    Fcod_bairro_receb        := ADataSet.FieldByName('COD_BAIRRO_RECEB').AsInteger;
    Fvl_entrada              := ADataSet.FieldByName('VL_ENTRADA').AsFloat;
    Fcodigo_ctrl             := ADataSet.FieldByName('CODIGO_CTRL').AsInteger;
    Fnprevenda               := ADataSet.FieldByName('NPREVENDA').AsInteger;
    Fstat_req                := Trim(ADataSet.FieldByName('STAT_REQ').AsString);
    Facresc_p_prod           := ADataSet.FieldByName('ACRESC_P_PROD').AsFloat;
    Facresc_p_serv           := ADataSet.FieldByName('ACRESC_P_SERV').AsFloat;
    Facrescimo               := ADataSet.FieldByName('ACRESCIMO').AsFloat;
    Fplaca                   := Trim(ADataSet.FieldByName('PLACA').AsString);
    Fchassi                  := Trim(ADataSet.FieldByName('CHASSI').AsString);
    Fkm_v                    := ADataSet.FieldByName('KM_V').AsInteger;
    Forc_prod                := ADataSet.FieldByName('ORC_PROD').AsInteger;
    Fdt_prometida            := ADataSet.FieldByName('DT_PROMETIDA').AsDateTime;
    Fobs_os.Text             := Trim(ADataSet.FieldByName('OBS_OS').AsString);
    Faparelho_ped            := Trim(ADataSet.FieldByName('APARELHO_PED').AsString);
    Fguarda_vol              := Trim(ADataSet.FieldByName('GUARDA_VOL').AsString);
    Fcombust_veic            := Trim(ADataSet.FieldByName('COMBUST_VEIC').AsString);
    Fdefeito.Text            := Trim(ADataSet.FieldByName('DEFEITO').AsString);
    Festado_veic.Text        := Trim(ADataSet.FieldByName('ESTADO_VEIC').AsString);
    Facessorios.Text         := Trim(ADataSet.FieldByName('ACESSORIOS').AsString);
    Ftipo_os                 := Trim(ADataSet.FieldByName('TIPO_OS').AsString);
    Fh_ent                   := ADataSet.FieldByName('H_ENT').AsDateTime;
    Fh_prometida             := ADataSet.FieldByName('H_PROMETIDA').AsDateTime;
    Fdata_nf                 := ADataSet.FieldByName('DATA_NF').AsDateTime;
    Fdt_nfgarantia           := ADataSet.FieldByName('DT_NFGARANTIA').AsDateTime;
    Ftot_prod                := ADataSet.FieldByName('TOT_PROD').AsFloat;
    Ftot_serv                := ADataSet.FieldByName('TOT_SERV').AsFloat;
    Ftp_abord                := Trim(ADataSet.FieldByName('TP_ABORD').AsString);
    Ffr_pagbosch             := Trim(ADataSet.FieldByName('FR_PAGBOSCH').AsString);
    Fseq_fech                := ADataSet.FieldByName('SEQ_FECH').AsInteger;
    Fem_nf                   := Trim(ADataSet.FieldByName('EM_NF').AsString);
    Fcod_equip               := ADataSet.FieldByName('COD_EQUIP').AsInteger;
    Fn_serie                 := Trim(ADataSet.FieldByName('N_SERIE').AsString);
    Fnum_nf                  := ADataSet.FieldByName('NUM_NF').AsInteger;
    Fobs_livro_reg           := Trim(ADataSet.FieldByName('OBS_LIVRO_REG').AsString);
    Fvalor_nf                := ADataSet.FieldByName('VALOR_NF').AsFloat;
    Fnf_pgarantia            := ADataSet.FieldByName('NF_PGARANTIA').AsInteger;
    Fnome_nf_garantia        := Trim(ADataSet.FieldByName('NOME_NF_GARANTIA').AsString);
    Fhora_fech               := Trim(ADataSet.FieldByName('HORA_FECH').AsString);
    Fst_term_serv            := Trim(ADataSet.FieldByName('ST_TERM_SERV').AsString);
    Fregistro_de_entrega     := Trim(ADataSet.FieldByName('REGISTRO_DE_ENTREGA').AsString);
    Fativo                   := ADataSet.FieldByName('ATIVO').AsInteger;
    Ftipo_orc                := Trim(ADataSet.FieldByName('TIPO_ORC').AsString);
    Fstatus_cupom            := Trim(ADataSet.FieldByName('STATUS_CUPOM').AsString);
    Fcodterm_status          := ADataSet.FieldByName('CODTERM_STATUS').AsInteger;
    Fcpfcgc                  := Trim(ADataSet.FieldByName('CPFCGC').AsString);
    Fnome_cli_orc            := Trim(ADataSet.FieldByName('NOME_CLI_ORC').AsString);
    Fcod_orcamento           := ADataSet.FieldByName('COD_ORCAMENTO').AsInteger;
    Fobs_red_os              := Trim(ADataSet.FieldByName('OBS_RED_OS').AsString);
    Fcod_veiculo             := ADataSet.FieldByName('COD_VEICULO').AsInteger;
    Fnum_nfeext              := ADataSet.FieldByName('NUM_NFEEXT').AsInteger;
    Fdata_nfext              := ADataSet.FieldByName('DATA_NFEXT').AsDateTime;
    Fvalor_nfext             := ADataSet.FieldByName('VALOR_NFEXT').AsFloat;
    Fserie_nf                := Trim(ADataSet.FieldByName('SERIE_NF').AsString);
    Fccf_cupom               := ADataSet.FieldByName('CCF_CUPOM').AsInteger;
    Flibtrava                := Trim(ADataSet.FieldByName('LIBTRAVA').AsString);
    Fmd5                     := Trim(ADataSet.FieldByName('MD5').AsString);
    Fdav_impresso            := Trim(ADataSet.FieldByName('DAV_IMPRESSO').AsString);
    Fdependente              := ADataSet.FieldByName('DEPENDENTE').AsInteger;
    Fsubtipo_os              := Trim(ADataSet.FieldByName('SUBTIPO_OS').AsString);
    Fcod_carga               := ADataSet.FieldByName('COD_CARGA').AsInteger;
    Faprovada_gerente        := Trim(ADataSet.FieldByName('APROVADA_GERENTE').AsString);
    Fnpedmob                 := ADataSet.FieldByName('NPEDMOB').AsInteger;
    Fidmobile                := ADataSet.FieldByName('IDMOBILE').AsInteger;
    Fdata_libtrava           := ADataSet.FieldByName('DATA_LIBTRAVA').AsDateTime;
    Fcod_nf                  := ADataSet.FieldByName('COD_NF').AsInteger;
    Fnf_gerou                := Trim(ADataSet.FieldByName('NF_GEROU').AsString);
    Fcod_agendamento         := ADataSet.FieldByName('COD_AGENDAMENTO').AsInteger;
    Fstatus_contrato         := Trim(ADataSet.FieldByName('STATUS_CONTRATO').AsString);
    Fnome_clientedav         := Trim(ADataSet.FieldByName('NOME_CLIENTEDAV').AsString);
    Fmd52                    := Trim(ADataSet.FieldByName('MD52').AsString);
    Fcoo_impressao           := ADataSet.FieldByName('COO_IMPRESSAO').AsInteger;
    Fnseriecf_impressao      := Trim(ADataSet.FieldByName('NSERIECF_IMPRESSAO').AsString);
    Foperador_impressao      := ADataSet.FieldByName('OPERADOR_IMPRESSAO').AsInteger;
    Fpaf_num_prevenda        := ADataSet.FieldByName('PAF_NUM_PREVENDA').AsInteger;
    Fpaf_status_prevenda     := Trim(ADataSet.FieldByName('PAF_STATUS_PREVENDA').AsString);
    Fnped_originado          := ADataSet.FieldByName('NPED_ORIGINADO').AsInteger;
    Ftipo_originado          := Trim(ADataSet.FieldByName('TIPO_ORIGINADO').AsString);
    Fcod_agenda              := ADataSet.FieldByName('COD_AGENDA').AsInteger;
    Fstatus_conta_cliente    := Trim(ADataSet.FieldByName('STATUS_CONTA_CLIENTE').AsString);
    Fcoo_conta_cliente       := ADataSet.FieldByName('COO_CONTA_CLIENTE').AsInteger;
    Fcer_conta_cliente       := ADataSet.FieldByName('CER_CONTA_CLIENTE').AsInteger;
    Fcodpesquisa             := ADataSet.FieldByName('CODPESQUISA').AsInteger;
    Forcparavnd              := Trim(ADataSet.FieldByName('ORCPARAVND').AsString);
    Fcod_controle            := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    Fgerente_aprovou         := Trim(ADataSet.FieldByName('GERENTE_APROVOU').AsString);
    Fvalor_desc_avista       := ADataSet.FieldByName('VALOR_DESC_AVISTA').AsFloat;
    Fmetodo_entrega          := Trim(ADataSet.FieldByName('METODO_ENTREGA').AsString);
    Fautorizado_financeiro   := Trim(ADataSet.FieldByName('AUTORIZADO_FINANCEIRO').AsString);
    Fn_comando               := ADataSet.FieldByName('N_COMANDO').AsInteger;
    Fenv_mobile              := Trim(ADataSet.FieldByName('ENV_MOBILE').AsString);
    Freaberto                := Trim(ADataSet.FieldByName('REABERTO').AsString);
    Fregras_descontos        := Trim(ADataSet.FieldByName('REGRAS_DESCONTOS').AsString);
    Fstatus_sep_conf         := Trim(ADataSet.FieldByName('STATUS_SEP_CONF').AsString);
    Fnserieecf_conta_cliente := Trim(ADataSet.FieldByName('NSERIEECF_CONTA_CLIENTE').AsString);
    Fsaveauto                := Trim(ADataSet.FieldByName('SAVEAUTO').AsString);
    Fcalc                    := Trim(ADataSet.FieldByName('CALC').AsString);
    Fus_edit                 := ADataSet.FieldByName('US_EDIT').AsInteger;
    Fdata_estoque            := ADataSet.FieldByName('DATA_ESTOQUE').AsDateTime;
    Fcod_cliente_nfserv      := ADataSet.FieldByName('COD_CLIENTE_NFSERV').AsInteger;
    Fqtde_libtrava           := ADataSet.FieldByName('QTDE_LIBTRAVA').AsInteger;
    Fqtde_impressao          := ADataSet.FieldByName('QTDE_IMPRESSAO').AsInteger;
    Fend_avl                 := Trim(ADataSet.FieldByName('END_AVL').AsString);
    Fbairro_avl              := Trim(ADataSet.FieldByName('BAIRRO_AVL').AsString);
    Fcida_avl                := Trim(ADataSet.FieldByName('CIDA_AVL').AsString);
    Fcep_avl                 := Trim(ADataSet.FieldByName('CEP_AVL').AsString);
    Festa_avl                := Trim(ADataSet.FieldByName('ESTA_AVL').AsString);
    Fcod_vendedor1           := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    Fselos_col.Text          := Trim(ADataSet.FieldByName('SELOS_COL').AsString);
    Fselos_rem.Text          := Trim(ADataSet.FieldByName('SELOS_REM').AsString);
    Flacres_col.Text         := Trim(ADataSet.FieldByName('LACRES_COL').AsString);
    Flacres_rem.Text         := Trim(ADataSet.FieldByName('LACRES_REM').AsString);
    Fn_nfd                   := ADataSet.FieldByName('N_NFD').AsInteger;
    Fserie_nfd               := Trim(ADataSet.FieldByName('SERIE_NFD').AsString);
    Fnfd_gerou               := Trim(ADataSet.FieldByName('NFD_GEROU').AsString);
    Fdata_nfd                := ADataSet.FieldByName('DATA_NFD').AsDateTime;
    Fvalor_nfd               := ADataSet.FieldByName('VALOR_NFD').AsFloat;
    Fcod_gerador             := ADataSet.FieldByName('COD_GERADOR').AsInteger;
    Fcod_nfce                := ADataSet.FieldByName('COD_NFCE').AsInteger;
    Fenv_email_nfs           := Trim(ADataSet.FieldByName('ENV_EMAIL_NFS').AsString);
    Ftot_serv_terc           := ADataSet.FieldByName('TOT_SERV_TERC').AsFloat;
    Ftot_prod_terc           := ADataSet.FieldByName('TOT_PROD_TERC').AsFloat;
    Ftp_venda                := Trim(ADataSet.FieldByName('TP_VENDA').AsString);
    Fcl_clultimacompra       := Trim(ADataSet.FieldByName('CL_CLULTIMACOMPRA').AsString);
    Fcl_status_f             := Trim(ADataSet.FieldByName('CL_STATUS_F').AsString);
    Ftp_gerar_pontos         := Trim(ADataSet.FieldByName('TP_GERAR_PONTOS').AsString);
    Fvale_troca              := Trim(ADataSet.FieldByName('VALE_TROCA').AsString);
    Fvalor_vale_prg          := ADataSet.FieldByName('VALOR_VALE_PRG').AsFloat;
    Fdest_seqid              := ADataSet.FieldByName('DEST_SEQID').AsInteger;
    Fdest_seqid_entrg        := ADataSet.FieldByName('DEST_SEQID_ENTRG').AsInteger;
    Fcod_fatura              := ADataSet.FieldByName('COD_FATURA').AsInteger;
    Fvl_comissao_vend        := ADataSet.FieldByName('VL_COMISSAO_VEND').AsFloat;
    Fperc_comissao_vend      := ADataSet.FieldByName('PERC_COMISSAO_VEND').AsFloat;
    Fvl_comissao_vend1       := ADataSet.FieldByName('VL_COMISSAO_VEND1').AsFloat;
    Fperc_comissao_vend1     := ADataSet.FieldByName('PERC_COMISSAO_VEND1').AsFloat;
    Fcont_alt                := ADataSet.FieldByName('CONT_ALT').AsInteger;
    Flocal_incidencia        := ADataSet.FieldByName('LOCAL_INCIDENCIA').AsInteger;
    Fnf_ac_calctrib          := Trim(ADataSet.FieldByName('NF_AC_CALCTRIB').AsString);
    Fnf_ac_seguro            := ADataSet.FieldByName('NF_AC_SEGURO').AsFloat;
    Fnf_ac_outras            := ADataSet.FieldByName('NF_AC_OUTRAS').AsFloat;
    Fnf_ac_frete             := ADataSet.FieldByName('NF_AC_FRETE').AsFloat;
    Fnf_ac_ipi               := ADataSet.FieldByName('NF_AC_IPI').AsFloat;
    Fnf_ac_icmsst            := ADataSet.FieldByName('NF_AC_ICMSST').AsFloat;
    Fnf_ac_fcpst             := ADataSet.FieldByName('NF_AC_FCPST').AsFloat;
    Fnf_ac_imposto_ii        := ADataSet.FieldByName('NF_AC_IMPOSTO_II').AsFloat;
    Fnf_freteconta           := Trim(ADataSet.FieldByName('NF_FRETECONTA').AsString);
    Fid_commerce             := ADataSet.FieldByName('ID_COMMERCE').AsInteger;
    Fcod_forma_rast          := ADataSet.FieldByName('COD_FORMA_RAST').AsInteger;
    Fdata_envio_rast         := ADataSet.FieldByName('DATA_ENVIO_RAST').AsDateTime;
    Fcod_rastreamento        := Trim(ADataSet.FieldByName('COD_RASTREAMENTO').AsString);
    Fidsitped_ec             := ADataSet.FieldByName('IDSITPED_EC').AsInteger;
    Fstatus_ec               := Trim(ADataSet.FieldByName('STATUS_EC').AsString);
    Fnf_cf_deson_emb         := Trim(ADataSet.FieldByName('NF_CF_DESON_EMB').AsString);
    Fnf_dc_desconto          := ADataSet.FieldByName('NF_DC_DESCONTO').AsFloat;
    Fnf_dc_vicmdeson         := ADataSet.FieldByName('NF_DC_VICMDESON').AsFloat;
    Fnf_ac_vicmdeson         := ADataSet.FieldByName('NF_AC_VICMDESON').AsFloat;
  end
  else
  begin
    if Assigned(ADataSet.FindField('NPED'                   )) then Fnped                    := ADataSet.FieldByName('NPED').AsInteger;
    if Assigned(ADataSet.FindField('TIPO'                   )) then Ftipo                    := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA'            )) then Fcod_empresa             := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_CLIENTE'            )) then Fcod_cliente             := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('COD_VENDEDOR'           )) then Fcod_vendedor            := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    if Assigned(ADataSet.FindField('COD_COND_PAG'           )) then Fcod_cond_pag            := ADataSet.FieldByName('COD_COND_PAG').AsInteger;
    if Assigned(ADataSet.FindField('N_MOV_CXL'              )) then Fn_mov_cxl               := ADataSet.FieldByName('N_MOV_CXL').AsInteger;
    if Assigned(ADataSet.FindField('DIA_CXL'                )) then Fdia_cxl                 := ADataSet.FieldByName('DIA_CXL').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_PED'               )) then Fdata_ped                := ADataSet.FieldByName('DATA_PED').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_FECH'              )) then Fdata_fech               := ADataSet.FieldByName('DATA_FECH').AsDateTime;
    if Assigned(ADataSet.FindField('DATVENC'                )) then Fdatvenc                 := ADataSet.FieldByName('DATVENC').AsDateTime;
    if Assigned(ADataSet.FindField('VALOR_TOTAL'            )) then Fvalor_total             := ADataSet.FieldByName('VALOR_TOTAL').AsFloat;
    if Assigned(ADataSet.FindField('DESC_P_PROD'            )) then Fdesc_p_prod             := ADataSet.FieldByName('DESC_P_PROD').AsFloat;
    if Assigned(ADataSet.FindField('DESC_P_SERV'            )) then Fdesc_p_serv             := ADataSet.FieldByName('DESC_P_SERV').AsFloat;
    if Assigned(ADataSet.FindField('DESCONTO'               )) then Fdesconto                := ADataSet.FieldByName('DESCONTO').AsFloat;
    if Assigned(ADataSet.FindField('OBS_PED'                )) then Fobs_ped                 := Trim(ADataSet.FieldByName('OBS_PED').AsString);
    if Assigned(ADataSet.FindField('STATUS_PED'             )) then Fstatus_ped              := Trim(ADataSet.FieldByName('STATUS_PED').AsString);
    if Assigned(ADataSet.FindField('TIPV'                   )) then Ftipv                    := Trim(ADataSet.FieldByName('TIPV').AsString);
    if Assigned(ADataSet.FindField('OBS_CXL_RQ'             )) then Fobs_cxl_rq              := Trim(ADataSet.FieldByName('OBS_CXL_RQ').AsString);
    if Assigned(ADataSet.FindField('STATUS_CXL_RQ'          )) then Fstatus_cxl_rq           := Trim(ADataSet.FieldByName('STATUS_CXL_RQ').AsString);
    if Assigned(ADataSet.FindField('VL_PAGO_CXL'            )) then Fvl_pago_cxl             := ADataSet.FieldByName('VL_PAGO_CXL').AsFloat;
    if Assigned(ADataSet.FindField('SELEC'                  )) then Fselec                   := Trim(ADataSet.FieldByName('SELEC').AsString);
    if Assigned(ADataSet.FindField('TIPOR'                  )) then Ftipor                   := Trim(ADataSet.FieldByName('TIPOR').AsString);
    if Assigned(ADataSet.FindField('HORAABERTURA'           )) then Fhoraabertura            := ADataSet.FieldByName('HORAABERTURA').AsInteger;
    if Assigned(ADataSet.FindField('MINABERTURA'            )) then Fminabertura             := ADataSet.FieldByName('MINABERTURA').AsInteger;
    if Assigned(ADataSet.FindField('HORAFECHAMENTO'         )) then Fhorafechamento          := ADataSet.FieldByName('HORAFECHAMENTO').AsInteger;
    if Assigned(ADataSet.FindField('MINFECHAMENTO'          )) then Fminfechamento           := ADataSet.FieldByName('MINFECHAMENTO').AsInteger;
    if Assigned(ADataSet.FindField('HORASUBTOTAL'           )) then Fhorasubtotal            := ADataSet.FieldByName('HORASUBTOTAL').AsInteger;
    if Assigned(ADataSet.FindField('MINSUBTOTAL'            )) then Fminsubtotal             := ADataSet.FieldByName('MINSUBTOTAL').AsInteger;
    if Assigned(ADataSet.FindField('NCUPOM'                 )) then Fncupom                  := ADataSet.FieldByName('NCUPOM').AsInteger;
    if Assigned(ADataSet.FindField('OPERADOR'               )) then Foperador                := ADataSet.FieldByName('OPERADOR').AsInteger;
    if Assigned(ADataSet.FindField('DATA_CUPOM'             )) then Fdata_cupom              := ADataSet.FieldByName('DATA_CUPOM').AsDateTime;
    if Assigned(ADataSet.FindField('DA'                     )) then Fda                      := Trim(ADataSet.FieldByName('DA').AsString);
    if Assigned(ADataSet.FindField('NSERIEECF'              )) then Fnserieecf               := Trim(ADataSet.FieldByName('NSERIEECF').AsString);
    if Assigned(ADataSet.FindField('NOME_RECEB'             )) then Fnome_receb              := Trim(ADataSet.FieldByName('NOME_RECEB').AsString);
    if Assigned(ADataSet.FindField('END_RECEB'              )) then Fend_receb               := Trim(ADataSet.FieldByName('END_RECEB').AsString);
    if Assigned(ADataSet.FindField('BAIRRO_RECEB'           )) then Fbairro_receb            := Trim(ADataSet.FieldByName('BAIRRO_RECEB').AsString);
    if Assigned(ADataSet.FindField('CIDA_RECEB'             )) then Fcida_receb              := Trim(ADataSet.FieldByName('CIDA_RECEB').AsString);
    if Assigned(ADataSet.FindField('CEP_RECEB'              )) then Fcep_receb               := Trim(ADataSet.FieldByName('CEP_RECEB').AsString);
    if Assigned(ADataSet.FindField('FONE_RECEB'             )) then Ffone_receb              := Trim(ADataSet.FieldByName('FONE_RECEB').AsString);
    if Assigned(ADataSet.FindField('OBS_MINUTA'             )) then Fobs_minuta.Text         := Trim(ADataSet.FieldByName('OBS_MINUTA').AsString);
    if Assigned(ADataSet.FindField('GRUPO_PROD'             )) then Fgrupo_prod              := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'               )) then Fcod_prod                := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('OP_CXL'                 )) then Fop_cxl                  := ADataSet.FieldByName('OP_CXL').AsInteger;
    if Assigned(ADataSet.FindField('COD_CIDADE_RECEB'       )) then Fcod_cidade_receb        := ADataSet.FieldByName('COD_CIDADE_RECEB').AsInteger;
    if Assigned(ADataSet.FindField('COD_BAIRRO_RECEB'       )) then Fcod_bairro_receb        := ADataSet.FieldByName('COD_BAIRRO_RECEB').AsInteger;
    if Assigned(ADataSet.FindField('VL_ENTRADA'             )) then Fvl_entrada              := ADataSet.FieldByName('VL_ENTRADA').AsFloat;
    if Assigned(ADataSet.FindField('CODIGO_CTRL'            )) then Fcodigo_ctrl             := ADataSet.FieldByName('CODIGO_CTRL').AsInteger;
    if Assigned(ADataSet.FindField('NPREVENDA'              )) then Fnprevenda               := ADataSet.FieldByName('NPREVENDA').AsInteger;
    if Assigned(ADataSet.FindField('STAT_REQ'               )) then Fstat_req                := Trim(ADataSet.FieldByName('STAT_REQ').AsString);
    if Assigned(ADataSet.FindField('ACRESC_P_PROD'          )) then Facresc_p_prod           := ADataSet.FieldByName('ACRESC_P_PROD').AsFloat;
    if Assigned(ADataSet.FindField('ACRESC_P_SERV'          )) then Facresc_p_serv           := ADataSet.FieldByName('ACRESC_P_SERV').AsFloat;
    if Assigned(ADataSet.FindField('ACRESCIMO'              )) then Facrescimo               := ADataSet.FieldByName('ACRESCIMO').AsFloat;
    if Assigned(ADataSet.FindField('PLACA'                  )) then Fplaca                   := Trim(ADataSet.FieldByName('PLACA').AsString);
    if Assigned(ADataSet.FindField('CHASSI'                 )) then Fchassi                  := Trim(ADataSet.FieldByName('CHASSI').AsString);
    if Assigned(ADataSet.FindField('KM_V'                   )) then Fkm_v                    := ADataSet.FieldByName('KM_V').AsInteger;
    if Assigned(ADataSet.FindField('ORC_PROD'               )) then Forc_prod                := ADataSet.FieldByName('ORC_PROD').AsInteger;
    if Assigned(ADataSet.FindField('DT_PROMETIDA'           )) then Fdt_prometida            := ADataSet.FieldByName('DT_PROMETIDA').AsDateTime;
    if Assigned(ADataSet.FindField('OBS_OS'                 )) then Fobs_os.Text             := Trim(ADataSet.FieldByName('OBS_OS').AsString);
    if Assigned(ADataSet.FindField('APARELHO_PED'           )) then Faparelho_ped            := Trim(ADataSet.FieldByName('APARELHO_PED').AsString);
    if Assigned(ADataSet.FindField('GUARDA_VOL'             )) then Fguarda_vol              := Trim(ADataSet.FieldByName('GUARDA_VOL').AsString);
    if Assigned(ADataSet.FindField('COMBUST_VEIC'           )) then Fcombust_veic            := Trim(ADataSet.FieldByName('COMBUST_VEIC').AsString);
    if Assigned(ADataSet.FindField('DEFEITO'                )) then Fdefeito.Text            := Trim(ADataSet.FieldByName('DEFEITO').AsString);
    if Assigned(ADataSet.FindField('ESTADO_VEIC'            )) then Festado_veic.Text        := Trim(ADataSet.FieldByName('ESTADO_VEIC').AsString);
    if Assigned(ADataSet.FindField('ACESSORIOS'             )) then Facessorios.Text         := Trim(ADataSet.FieldByName('ACESSORIOS').AsString);
    if Assigned(ADataSet.FindField('TIPO_OS'                )) then Ftipo_os                 := Trim(ADataSet.FieldByName('TIPO_OS').AsString);
    if Assigned(ADataSet.FindField('H_ENT'                  )) then Fh_ent                   := ADataSet.FieldByName('H_ENT').AsDateTime;
    if Assigned(ADataSet.FindField('H_PROMETIDA'            )) then Fh_prometida             := ADataSet.FieldByName('H_PROMETIDA').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_NF'                )) then Fdata_nf                 := ADataSet.FieldByName('DATA_NF').AsDateTime;
    if Assigned(ADataSet.FindField('DT_NFGARANTIA'          )) then Fdt_nfgarantia           := ADataSet.FieldByName('DT_NFGARANTIA').AsDateTime;
    if Assigned(ADataSet.FindField('TOT_PROD'               )) then Ftot_prod                := ADataSet.FieldByName('TOT_PROD').AsFloat;
    if Assigned(ADataSet.FindField('TOT_SERV'               )) then Ftot_serv                := ADataSet.FieldByName('TOT_SERV').AsFloat;
    if Assigned(ADataSet.FindField('TP_ABORD'               )) then Ftp_abord                := Trim(ADataSet.FieldByName('TP_ABORD').AsString);
    if Assigned(ADataSet.FindField('FR_PAGBOSCH'            )) then Ffr_pagbosch             := Trim(ADataSet.FieldByName('FR_PAGBOSCH').AsString);
    if Assigned(ADataSet.FindField('SEQ_FECH'               )) then Fseq_fech                := ADataSet.FieldByName('SEQ_FECH').AsInteger;
    if Assigned(ADataSet.FindField('EM_NF'                  )) then Fem_nf                   := Trim(ADataSet.FieldByName('EM_NF').AsString);
    if Assigned(ADataSet.FindField('COD_EQUIP'              )) then Fcod_equip               := ADataSet.FieldByName('COD_EQUIP').AsInteger;
    if Assigned(ADataSet.FindField('N_SERIE'                )) then Fn_serie                 := Trim(ADataSet.FieldByName('N_SERIE').AsString);
    if Assigned(ADataSet.FindField('NUM_NF'                 )) then Fnum_nf                  := ADataSet.FieldByName('NUM_NF').AsInteger;
    if Assigned(ADataSet.FindField('OBS_LIVRO_REG'          )) then Fobs_livro_reg           := Trim(ADataSet.FieldByName('OBS_LIVRO_REG').AsString);
    if Assigned(ADataSet.FindField('VALOR_NF'               )) then Fvalor_nf                := ADataSet.FieldByName('VALOR_NF').AsFloat;
    if Assigned(ADataSet.FindField('NF_PGARANTIA'           )) then Fnf_pgarantia            := ADataSet.FieldByName('NF_PGARANTIA').AsInteger;
    if Assigned(ADataSet.FindField('NOME_NF_GARANTIA'       )) then Fnome_nf_garantia        := Trim(ADataSet.FieldByName('NOME_NF_GARANTIA').AsString);
    if Assigned(ADataSet.FindField('HORA_FECH'              )) then Fhora_fech               := Trim(ADataSet.FieldByName('HORA_FECH').AsString);
    if Assigned(ADataSet.FindField('ST_TERM_SERV'           )) then Fst_term_serv            := Trim(ADataSet.FieldByName('ST_TERM_SERV').AsString);
    if Assigned(ADataSet.FindField('REGISTRO_DE_ENTREGA'    )) then Fregistro_de_entrega     := Trim(ADataSet.FieldByName('REGISTRO_DE_ENTREGA').AsString);
    if Assigned(ADataSet.FindField('ATIVO'                  )) then Fativo                   := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_ORC'               )) then Ftipo_orc                := Trim(ADataSet.FieldByName('TIPO_ORC').AsString);
    if Assigned(ADataSet.FindField('STATUS_CUPOM'           )) then Fstatus_cupom            := Trim(ADataSet.FieldByName('STATUS_CUPOM').AsString);
    if Assigned(ADataSet.FindField('CODTERM_STATUS'         )) then Fcodterm_status          := ADataSet.FieldByName('CODTERM_STATUS').AsInteger;
    if Assigned(ADataSet.FindField('CPFCGC'                 )) then Fcpfcgc                  := Trim(ADataSet.FieldByName('CPFCGC').AsString);
    if Assigned(ADataSet.FindField('NOME_CLI_ORC'           )) then Fnome_cli_orc            := Trim(ADataSet.FieldByName('NOME_CLI_ORC').AsString);
    if Assigned(ADataSet.FindField('COD_ORCAMENTO'          )) then Fcod_orcamento           := ADataSet.FieldByName('COD_ORCAMENTO').AsInteger;
    if Assigned(ADataSet.FindField('OBS_RED_OS'             )) then Fobs_red_os              := Trim(ADataSet.FieldByName('OBS_RED_OS').AsString);
    if Assigned(ADataSet.FindField('COD_VEICULO'            )) then Fcod_veiculo             := ADataSet.FieldByName('COD_VEICULO').AsInteger;
    if Assigned(ADataSet.FindField('NUM_NFEEXT'             )) then Fnum_nfeext              := ADataSet.FieldByName('NUM_NFEEXT').AsInteger;
    if Assigned(ADataSet.FindField('DATA_NFEXT'             )) then Fdata_nfext              := ADataSet.FieldByName('DATA_NFEXT').AsDateTime;
    if Assigned(ADataSet.FindField('VALOR_NFEXT'            )) then Fvalor_nfext             := ADataSet.FieldByName('VALOR_NFEXT').AsFloat;
    if Assigned(ADataSet.FindField('SERIE_NF'               )) then Fserie_nf                := Trim(ADataSet.FieldByName('SERIE_NF').AsString);
    if Assigned(ADataSet.FindField('CCF_CUPOM'              )) then Fccf_cupom               := ADataSet.FieldByName('CCF_CUPOM').AsInteger;
    if Assigned(ADataSet.FindField('LIBTRAVA'               )) then Flibtrava                := Trim(ADataSet.FieldByName('LIBTRAVA').AsString);
    if Assigned(ADataSet.FindField('MD5'                    )) then Fmd5                     := Trim(ADataSet.FieldByName('MD5').AsString);
    if Assigned(ADataSet.FindField('DAV_IMPRESSO'           )) then Fdav_impresso            := Trim(ADataSet.FieldByName('DAV_IMPRESSO').AsString);
    if Assigned(ADataSet.FindField('DEPENDENTE'             )) then Fdependente              := ADataSet.FieldByName('DEPENDENTE').AsInteger;
    if Assigned(ADataSet.FindField('SUBTIPO_OS'             )) then Fsubtipo_os              := Trim(ADataSet.FieldByName('SUBTIPO_OS').AsString);
    if Assigned(ADataSet.FindField('COD_CARGA'              )) then Fcod_carga               := ADataSet.FieldByName('COD_CARGA').AsInteger;
    if Assigned(ADataSet.FindField('APROVADA_GERENTE'       )) then Faprovada_gerente        := Trim(ADataSet.FieldByName('APROVADA_GERENTE').AsString);
    if Assigned(ADataSet.FindField('NPEDMOB'                )) then Fnpedmob                 := ADataSet.FieldByName('NPEDMOB').AsInteger;
    if Assigned(ADataSet.FindField('IDMOBILE'               )) then Fidmobile                := ADataSet.FieldByName('IDMOBILE').AsInteger;
    if Assigned(ADataSet.FindField('DATA_LIBTRAVA'          )) then Fdata_libtrava           := ADataSet.FieldByName('DATA_LIBTRAVA').AsDateTime;
    if Assigned(ADataSet.FindField('COD_NF'                 )) then Fcod_nf                  := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('NF_GEROU'               )) then Fnf_gerou                := Trim(ADataSet.FieldByName('NF_GEROU').AsString);
    if Assigned(ADataSet.FindField('COD_AGENDAMENTO'        )) then Fcod_agendamento         := ADataSet.FieldByName('COD_AGENDAMENTO').AsInteger;
    if Assigned(ADataSet.FindField('STATUS_CONTRATO'        )) then Fstatus_contrato         := Trim(ADataSet.FieldByName('STATUS_CONTRATO').AsString);
    if Assigned(ADataSet.FindField('NOME_CLIENTEDAV'        )) then Fnome_clientedav         := Trim(ADataSet.FieldByName('NOME_CLIENTEDAV').AsString);
    if Assigned(ADataSet.FindField('MD52'                   )) then Fmd52                    := Trim(ADataSet.FieldByName('MD52').AsString);
    if Assigned(ADataSet.FindField('COO_IMPRESSAO'          )) then Fcoo_impressao           := ADataSet.FieldByName('COO_IMPRESSAO').AsInteger;
    if Assigned(ADataSet.FindField('NSERIECF_IMPRESSAO'     )) then Fnseriecf_impressao      := Trim(ADataSet.FieldByName('NSERIECF_IMPRESSAO').AsString);
    if Assigned(ADataSet.FindField('OPERADOR_IMPRESSAO'     )) then Foperador_impressao      := ADataSet.FieldByName('OPERADOR_IMPRESSAO').AsInteger;
    if Assigned(ADataSet.FindField('PAF_NUM_PREVENDA'       )) then Fpaf_num_prevenda        := ADataSet.FieldByName('PAF_NUM_PREVENDA').AsInteger;
    if Assigned(ADataSet.FindField('PAF_STATUS_PREVENDA'    )) then Fpaf_status_prevenda     := Trim(ADataSet.FieldByName('PAF_STATUS_PREVENDA').AsString);
    if Assigned(ADataSet.FindField('NPED_ORIGINADO'         )) then Fnped_originado          := ADataSet.FieldByName('NPED_ORIGINADO').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_ORIGINADO'         )) then Ftipo_originado          := Trim(ADataSet.FieldByName('TIPO_ORIGINADO').AsString);
    if Assigned(ADataSet.FindField('COD_AGENDA'             )) then Fcod_agenda              := ADataSet.FieldByName('COD_AGENDA').AsInteger;
    if Assigned(ADataSet.FindField('STATUS_CONTA_CLIENTE'   )) then Fstatus_conta_cliente    := Trim(ADataSet.FieldByName('STATUS_CONTA_CLIENTE').AsString);
    if Assigned(ADataSet.FindField('COO_CONTA_CLIENTE'      )) then Fcoo_conta_cliente       := ADataSet.FieldByName('COO_CONTA_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('CER_CONTA_CLIENTE'      )) then Fcer_conta_cliente       := ADataSet.FieldByName('CER_CONTA_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('CODPESQUISA'            )) then Fcodpesquisa             := ADataSet.FieldByName('CODPESQUISA').AsInteger;
    if Assigned(ADataSet.FindField('ORCPARAVND'             )) then Forcparavnd              := Trim(ADataSet.FieldByName('ORCPARAVND').AsString);
    if Assigned(ADataSet.FindField('COD_CONTROLE'           )) then Fcod_controle            := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    if Assigned(ADataSet.FindField('GERENTE_APROVOU'        )) then Fgerente_aprovou         := Trim(ADataSet.FieldByName('GERENTE_APROVOU').AsString);
    if Assigned(ADataSet.FindField('VALOR_DESC_AVISTA'      )) then Fvalor_desc_avista       := ADataSet.FieldByName('VALOR_DESC_AVISTA').AsFloat;
    if Assigned(ADataSet.FindField('METODO_ENTREGA'         )) then Fmetodo_entrega          := Trim(ADataSet.FieldByName('METODO_ENTREGA').AsString);
    if Assigned(ADataSet.FindField('AUTORIZADO_FINANCEIRO'  )) then Fautorizado_financeiro   := Trim(ADataSet.FieldByName('AUTORIZADO_FINANCEIRO').AsString);
    if Assigned(ADataSet.FindField('N_COMANDO'              )) then Fn_comando               := ADataSet.FieldByName('N_COMANDO').AsInteger;
    if Assigned(ADataSet.FindField('ENV_MOBILE'             )) then Fenv_mobile              := Trim(ADataSet.FieldByName('ENV_MOBILE').AsString);
    if Assigned(ADataSet.FindField('REABERTO'               )) then Freaberto                := Trim(ADataSet.FieldByName('REABERTO').AsString);
    if Assigned(ADataSet.FindField('REGRAS_DESCONTOS'       )) then Fregras_descontos        := Trim(ADataSet.FieldByName('REGRAS_DESCONTOS').AsString);
    if Assigned(ADataSet.FindField('STATUS_SEP_CONF'        )) then Fstatus_sep_conf         := Trim(ADataSet.FieldByName('STATUS_SEP_CONF').AsString);
    if Assigned(ADataSet.FindField('NSERIEECF_CONTA_CLIENTE')) then Fnserieecf_conta_cliente := Trim(ADataSet.FieldByName('NSERIEECF_CONTA_CLIENTE').AsString);
    if Assigned(ADataSet.FindField('SAVEAUTO'               )) then Fsaveauto                := Trim(ADataSet.FieldByName('SAVEAUTO').AsString);
    if Assigned(ADataSet.FindField('CALC'                   )) then Fcalc                    := Trim(ADataSet.FieldByName('CALC').AsString);
    if Assigned(ADataSet.FindField('US_EDIT'                )) then Fus_edit                 := ADataSet.FieldByName('US_EDIT').AsInteger;
    if Assigned(ADataSet.FindField('DATA_ESTOQUE'           )) then Fdata_estoque            := ADataSet.FieldByName('DATA_ESTOQUE').AsDateTime;
    if Assigned(ADataSet.FindField('COD_CLIENTE_NFSERV'     )) then Fcod_cliente_nfserv      := ADataSet.FieldByName('COD_CLIENTE_NFSERV').AsInteger;
    if Assigned(ADataSet.FindField('QTDE_LIBTRAVA'          )) then Fqtde_libtrava           := ADataSet.FieldByName('QTDE_LIBTRAVA').AsInteger;
    if Assigned(ADataSet.FindField('QTDE_IMPRESSAO'         )) then Fqtde_impressao          := ADataSet.FieldByName('QTDE_IMPRESSAO').AsInteger;
    if Assigned(ADataSet.FindField('END_AVL'                )) then Fend_avl                 := Trim(ADataSet.FieldByName('END_AVL').AsString);
    if Assigned(ADataSet.FindField('BAIRRO_AVL'             )) then Fbairro_avl              := Trim(ADataSet.FieldByName('BAIRRO_AVL').AsString);
    if Assigned(ADataSet.FindField('CIDA_AVL'               )) then Fcida_avl                := Trim(ADataSet.FieldByName('CIDA_AVL').AsString);
    if Assigned(ADataSet.FindField('CEP_AVL'                )) then Fcep_avl                 := Trim(ADataSet.FieldByName('CEP_AVL').AsString);
    if Assigned(ADataSet.FindField('ESTA_AVL'               )) then Festa_avl                := Trim(ADataSet.FieldByName('ESTA_AVL').AsString);
    if Assigned(ADataSet.FindField('COD_VENDEDOR1'          )) then Fcod_vendedor1           := ADataSet.FieldByName('COD_VENDEDOR1').AsInteger;
    if Assigned(ADataSet.FindField('SELOS_COL'              )) then Fselos_col.Text          := Trim(ADataSet.FieldByName('SELOS_COL').AsString);
    if Assigned(ADataSet.FindField('SELOS_REM'              )) then Fselos_rem.Text          := Trim(ADataSet.FieldByName('SELOS_REM').AsString);
    if Assigned(ADataSet.FindField('LACRES_COL'             )) then Flacres_col.Text         := Trim(ADataSet.FieldByName('LACRES_COL').AsString);
    if Assigned(ADataSet.FindField('LACRES_REM'             )) then Flacres_rem.Text         := Trim(ADataSet.FieldByName('LACRES_REM').AsString);
    if Assigned(ADataSet.FindField('N_NFD'                  )) then Fn_nfd                   := ADataSet.FieldByName('N_NFD').AsInteger;
    if Assigned(ADataSet.FindField('SERIE_NFD'              )) then Fserie_nfd               := Trim(ADataSet.FieldByName('SERIE_NFD').AsString);
    if Assigned(ADataSet.FindField('NFD_GEROU'              )) then Fnfd_gerou               := Trim(ADataSet.FieldByName('NFD_GEROU').AsString);
    if Assigned(ADataSet.FindField('DATA_NFD'               )) then Fdata_nfd                := ADataSet.FieldByName('DATA_NFD').AsDateTime;
    if Assigned(ADataSet.FindField('VALOR_NFD'              )) then Fvalor_nfd               := ADataSet.FieldByName('VALOR_NFD').AsFloat;
    if Assigned(ADataSet.FindField('COD_GERADOR'            )) then Fcod_gerador             := ADataSet.FieldByName('COD_GERADOR').AsInteger;
    if Assigned(ADataSet.FindField('COD_NFCE'               )) then Fcod_nfce                := ADataSet.FieldByName('COD_NFCE').AsInteger;
    if Assigned(ADataSet.FindField('ENV_EMAIL_NFS'          )) then Fenv_email_nfs           := Trim(ADataSet.FieldByName('ENV_EMAIL_NFS').AsString);
    if Assigned(ADataSet.FindField('TOT_SERV_TERC'          )) then Ftot_serv_terc           := ADataSet.FieldByName('TOT_SERV_TERC').AsFloat;
    if Assigned(ADataSet.FindField('TOT_PROD_TERC'          )) then Ftot_prod_terc           := ADataSet.FieldByName('TOT_PROD_TERC').AsFloat;
    if Assigned(ADataSet.FindField('TP_VENDA'               )) then Ftp_venda                := Trim(ADataSet.FieldByName('TP_VENDA').AsString);
    if Assigned(ADataSet.FindField('CL_CLULTIMACOMPRA'      )) then Fcl_clultimacompra       := Trim(ADataSet.FieldByName('CL_CLULTIMACOMPRA').AsString);
    if Assigned(ADataSet.FindField('CL_STATUS_F'            )) then Fcl_status_f             := Trim(ADataSet.FieldByName('CL_STATUS_F').AsString);
    if Assigned(ADataSet.FindField('TP_GERAR_PONTOS'        )) then Ftp_gerar_pontos         := Trim(ADataSet.FieldByName('TP_GERAR_PONTOS').AsString);
    if Assigned(ADataSet.FindField('VALE_TROCA'             )) then Fvale_troca              := Trim(ADataSet.FieldByName('VALE_TROCA').AsString);
    if Assigned(ADataSet.FindField('VALOR_VALE_PRG'         )) then Fvalor_vale_prg          := ADataSet.FieldByName('VALOR_VALE_PRG').AsFloat;
    if Assigned(ADataSet.FindField('DEST_SEQID'             )) then Fdest_seqid              := ADataSet.FieldByName('DEST_SEQID').AsInteger;
    if Assigned(ADataSet.FindField('DEST_SEQID_ENTRG'       )) then Fdest_seqid_entrg        := ADataSet.FieldByName('DEST_SEQID_ENTRG').AsInteger;
    if Assigned(ADataSet.FindField('COD_FATURA'             )) then Fcod_fatura              := ADataSet.FieldByName('COD_FATURA').AsInteger;
    if Assigned(ADataSet.FindField('VL_COMISSAO_VEND'       )) then Fvl_comissao_vend        := ADataSet.FieldByName('VL_COMISSAO_VEND').AsFloat;
    if Assigned(ADataSet.FindField('PERC_COMISSAO_VEND'     )) then Fperc_comissao_vend      := ADataSet.FieldByName('PERC_COMISSAO_VEND').AsFloat;
    if Assigned(ADataSet.FindField('VL_COMISSAO_VEND1'      )) then Fvl_comissao_vend1       := ADataSet.FieldByName('VL_COMISSAO_VEND1').AsFloat;
    if Assigned(ADataSet.FindField('PERC_COMISSAO_VEND1'    )) then Fperc_comissao_vend1     := ADataSet.FieldByName('PERC_COMISSAO_VEND1').AsFloat;
    if Assigned(ADataSet.FindField('CONT_ALT'               )) then Fcont_alt                := ADataSet.FieldByName('CONT_ALT').AsInteger;
    if Assigned(ADataSet.FindField('LOCAL_INCIDENCIA'       )) then Flocal_incidencia        := ADataSet.FieldByName('LOCAL_INCIDENCIA').AsInteger;
    if Assigned(ADataSet.FindField('NF_AC_CALCTRIB'         )) then Fnf_ac_calctrib          := Trim(ADataSet.FieldByName('NF_AC_CALCTRIB').AsString);
    if Assigned(ADataSet.FindField('NF_AC_SEGURO'           )) then Fnf_ac_seguro            := ADataSet.FieldByName('NF_AC_SEGURO').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_OUTRAS'           )) then Fnf_ac_outras            := ADataSet.FieldByName('NF_AC_OUTRAS').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_FRETE'            )) then Fnf_ac_frete             := ADataSet.FieldByName('NF_AC_FRETE').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_IPI'              )) then Fnf_ac_ipi               := ADataSet.FieldByName('NF_AC_IPI').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_ICMSST'           )) then Fnf_ac_icmsst            := ADataSet.FieldByName('NF_AC_ICMSST').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_FCPST'            )) then Fnf_ac_fcpst             := ADataSet.FieldByName('NF_AC_FCPST').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_IMPOSTO_II'       )) then Fnf_ac_imposto_ii        := ADataSet.FieldByName('NF_AC_IMPOSTO_II').AsFloat;
    if Assigned(ADataSet.FindField('NF_FRETECONTA'          )) then Fnf_freteconta           := Trim(ADataSet.FieldByName('NF_FRETECONTA').AsString);
    if Assigned(ADataSet.FindField('ID_COMMERCE'            )) then Fid_commerce             := ADataSet.FieldByName('ID_COMMERCE').AsInteger;
    if Assigned(ADataSet.FindField('COD_FORMA_RAST'         )) then Fcod_forma_rast          := ADataSet.FieldByName('COD_FORMA_RAST').AsInteger;
    if Assigned(ADataSet.FindField('DATA_ENVIO_RAST'        )) then Fdata_envio_rast         := ADataSet.FieldByName('DATA_ENVIO_RAST').AsDateTime;
    if Assigned(ADataSet.FindField('COD_RASTREAMENTO'       )) then Fcod_rastreamento        := Trim(ADataSet.FieldByName('COD_RASTREAMENTO').AsString);
    if Assigned(ADataSet.FindField('IDSITPED_EC'            )) then Fidsitped_ec             := ADataSet.FieldByName('IDSITPED_EC').AsInteger;
    if Assigned(ADataSet.FindField('STATUS_EC'              )) then Fstatus_ec               := Trim(ADataSet.FieldByName('STATUS_EC').AsString);
    if Assigned(ADataSet.FindField('NF_CF_DESON_EMB'        )) then Fnf_cf_deson_emb         := Trim(ADataSet.FieldByName('NF_CF_DESON_EMB').AsString);
    if Assigned(ADataSet.FindField('NF_DC_DESCONTO'         )) then Fnf_dc_desconto          := ADataSet.FieldByName('NF_DC_DESCONTO').AsFloat;
    if Assigned(ADataSet.FindField('NF_DC_VICMDESON'        )) then Fnf_dc_vicmdeson         := ADataSet.FieldByName('NF_DC_VICMDESON').AsFloat;
    if Assigned(ADataSet.FindField('NF_AC_VICMDESON'        )) then Fnf_ac_vicmdeson         := ADataSet.FieldByName('NF_AC_VICMDESON').AsFloat;
  end;
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
