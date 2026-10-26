CREATE TABLE NFSE (
    ID               CHAR(36) NOT NULL,
    COD_EMPRESA      INTEGER NOT NULL,
    SEQID            INTEGER NOT NULL,
    COD_CLIENTE      INTEGER,
    INTERMEDIARIO_ID INTEGER,
    DEST_IBSCBS_ID   INTEGER,
    OP_INTERNA_ID    CHAR(36),
    COD_SERVICO      INTEGER,
    LAYOUT_NFSE      SMALLINT NOT NULL CHECK (LAYOUT_NFSE IN (0,1,2)),
    SITUACAO         SMALLINT NOT NULL,           
    NATUREZA_EMISSAO SMALLINT NOT NULL CHECK (NATUREZA_EMISSAO IN (0,1,2)),
    VERAPLIC         VARCHAR(20),
    TPAMB            SMALLINT CHECK ((TPAMB IS NULL) OR (TPAMB IN (1,2))),
    DHEMI            TIMESTAMP,
    SERIE            VARCHAR(5),
    NDPS             INTEGER,
    DCOMPET          TIMESTAMP,
    CLOCPRESTACAO    INTEGER,
    FINNFSE          INTEGER DEFAULT 0 NOT NULL CHECK (FINNFSE = 0),
    CINDOP           VARCHAR(6),
    TPOPER           SMALLINT CHECK (TPOPER IN (1, 2, 3, 4, 5)),
    TPENTEGOV        SMALLINT CHECK ((TPENTEGOV IS NULL) OR (TPENTEGOV IN (1, 2, 3, 4))),
    INDDEST          SMALLINT NOT NULL CHECK (INDDEST IN (0, 1)),
    CCNAE            CHAR(7),
    CLC116           CHAR(5),
    CTRIBNAC         VARCHAR(6),
    CTRIBMUN         VARCHAR(3),
    XDESCSERV        VARCHAR(2000),
    CNBS             VARCHAR(9),
    VSERV            NUMERIC_13_2,
    VDESCINCOND      NUMERIC_13_2,
    TRIBISSQN        SMALLINT CHECK ((TRIBISSQN IS NULL) OR (TRIBISSQN IN (1,2,3,4))),
    TPRETISSQN       SMALLINT CHECK ((TPRETISSQN IS NULL) OR (TPRETISSQN IN (1,2,3))),
    ISS_PALIQ        NUMERIC_3_4,
    ISS_VBC          NUMERIC_13_2,
    VISS             NUMERIC_13_2,
    PC_CST           VARCHAR(2),
    PC_VBCPISCOFINS  NUMERIC_13_2,
    PC_PALIQPIS      NUMERIC_3_4,
    PC_PALIQCOFINS   NUMERIC_3_4,
    PC_VPIS          NUMERIC_13_2,
    PC_VCOFINS       NUMERIC_13_2,
    TPRETPISCOFINS   SMALLINT,
    VRETIRRF         NUMERIC_13_2,
    VRETCSLL         NUMERIC_13_2,
    VRETCP           NUMERIC_13_2,
    VRETPIS          NUMERIC_13_2,
    VRETCOFINS       NUMERIC_13_2,
    PTOTTRIBFED      NUMERIC_3_4,
    PTOTTRIBEST      NUMERIC_3_4,
    PTOTTRIBMUN      NUMERIC_3_4,
    INDTOTTRIB       SMALLINT NOT NULL CHECK (INDTOTTRIB IN (0,1)),
    PTOTTRIBSN       NUMERIC_3_4,    
    NLOTE            VARCHAR(16),
    NPROTOCOLO       VARCHAR(60),
    CHAVE_NFSE       VARCHAR(50),
    DHPROC           TIMESTAMP,
    CSTAT            VARCHAR(4),
    NNFSE            BIGINT,
    NDFSE            BIGINT,
    VLIQ             NUMERIC_13_2,
    VTOTNF           NUMERIC_13_2,
    PREDUTOR         NUMERIC_3_4,
    VTOTALRET        NUMERIC_13_2,
    CVERIFICACAO     VARCHAR(16),
    CANC_ORIGEM      SMALLINT,
    DHCANC           TIMESTAMP,
    DATA_CADASTRO    TIMESTAMP NOT NULL,
    DATA_ALTERACAO   TIMESTAMP NOT NULL,
    CONSTRAINT PK_NFSE PRIMARY KEY (ID),
    CONSTRAINT FK_NFSE_EMP FOREIGN KEY (COD_EMPRESA) REFERENCES EMPRESA (COD_EMPRESA) ON UPDATE CASCADE,
    CONSTRAINT FK_NFSE_CLIENTE FOREIGN KEY (COD_CLIENTE, COD_EMPRESA) REFERENCES CLIENTES (COD_CLIENTE, COD_EMPRESA) ON UPDATE CASCADE,
    CONSTRAINT FK_NFSE_INTERMEDIARIO FOREIGN KEY (INTERMEDIARIO_ID, COD_EMPRESA) REFERENCES CLIENTES (COD_CLIENTE, COD_EMPRESA) ON UPDATE CASCADE,
    CONSTRAINT FK_NFSE_DEST_IBSCBS FOREIGN KEY (DEST_IBSCBS_ID, COD_EMPRESA) REFERENCES CLIENTES (COD_CLIENTE, COD_EMPRESA) ON UPDATE CASCADE,
    CONSTRAINT FK_NFSE_OP_INTERNA FOREIGN KEY (OP_INTERNA_ID) REFERENCES OP_INTERNAS (ID) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_NFSE_TIPOSERVICO FOREIGN KEY (COD_SERVICO) REFERENCES TIPO_SERVICO (COD_SERVICO) ON UPDATE CASCADE
);

CREATE UNIQUE INDEX IDX_NFSE_SEQ ON NFSE (SEQID, COD_EMPRESA);

CREATE INDEX IDX_NFSE_CHACESSO ON NFSE (CHAVE_NFSE);
CREATE INDEX IDX_NFSE_DCOMPET ON NFSE (DCOMPET);
CREATE INDEX IDX_NFSE_DHEMI ON NFSE (DHEMI);

CREATE TABLE NFSE_PART (
    ID          CHAR(36) NOT NULL,
    TIPO_PART   SMALLINT NOT NULL CHECK (TIPO_PART IN (1, 2, 3, 4)),
    CPFCNPJ     VARCHAR(14),
    NIF         VARCHAR(40),
    CNAONIF     SMALLINT CHECK ((CNAONIF IS NULL) OR (CNAONIF IN (0, 1, 2))),
    IM          VARCHAR(15),
    XNOME       VARCHAR(150),
    FONE        VARCHAR(20),
    EMAIL       VARCHAR(80),
    CMUN        INTEGER,
    CEP         VARCHAR(8),
    XLGR        VARCHAR(255),
    NRO         VARCHAR(60),
    XCPL        VARCHAR(156),
    XBAIRRO     VARCHAR(60),
    CONSTRAINT PK_NFSE_PART PRIMARY KEY (ID),
    CONSTRAINT FK_NFSE_PART FOREIGN KEY (ID) REFERENCES NFSE (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE NFSE_DOC (
    ID          CHAR(36) NOT NULL,
    TIPO_DOC    SMALLINT NOT NULL,
    DATA_EVENTO TIMESTAMP NOT NULL,
    DOC         BLOB SUB_TYPE 1 SEGMENT SIZE 4096,
    CONSTRAINT PK_NFSE_DOC PRIMARY KEY (ID, TIPO_DOC),
    CONSTRAINT FK_NFSE_DOC FOREIGN KEY (ID) REFERENCES NFSE (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE NFSE_NFSEREF (
    ID    CHAR(36) NOT NULL,
    CHAVE VARCHAR(50) NOT NULL,                                                                      
    CONSTRAINT PK_NFSE_NFSEREF PRIMARY KEY (ID, CHAVE),
    CONSTRAINT FK_NFSE_NFSEREF FOREIGN KEY (ID) REFERENCES NFSE (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX IDX_NFSE_NFSEREF ON NFSE_NFSEREF (CHAVE);

CREATE TABLE NFSE_HISTORICO (
    NFSE_ID     CHAR(36) NOT NULL,
    SEQID       INTEGER NOT NULL,
    DATA_EVENTO TIMESTAMP NOT NULL,
    SITUACAO    SMALLINT NOT NULL,
    TIPO_EVENTO SMALLINT NOT NULL,
    DESCRICAO   VARCHAR(500),
    CONSTRAINT PK_NFSE_HISTORICO PRIMARY KEY (NFSE_ID, SEQID),
    CONSTRAINT FK_NFSE_HISTORICO FOREIGN KEY (NFSE_ID) REFERENCES NFSE (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE NFSE_EVENTOS (
    ID            CHAR(36) NOT NULL,
    NFSE_ID       CHAR(36) NOT NULL,
    TIPO_EVENTO   SMALLINT NOT NULL,
    DATA_EVENTO   TIMESTAMP NOT NULL,
    SITUACAO      SMALLINT NOT NULL,
    VERAPLIC      VARCHAR(20),
    CMOTIVO       VARCHAR(60),
    XMOTIVO       VARCHAR(255),
    DH_PROC       TIMESTAMP,
    NSEQEVENTO    SMALLINT,
    CONSTRAINT PK_NFSE_EVENTOS PRIMARY KEY (ID),
    CONSTRAINT FK_NFSE_EVENTOS FOREIGN KEY (NFSE_ID) REFERENCES NFSE (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE NFSE_SUBST (
    ID            CHAR(36) NOT NULL,
    SUBST_ID      CHAR(36),
    CHAVE         VARCHAR(50),
    CMOTIVO       VARCHAR(16),
    XMOTIVO       VARCHAR(255),
    SERIE         VARCHAR(5),
    NDPS          INTEGER,
    NNFSE         BIGINT,
    NLOTE         VARCHAR(16),
    CVERIFICACAO  VARCHAR(16),
    CONSTRAINT PK_NFSE_SUBST PRIMARY KEY (ID),
    CONSTRAINT FK_NFSE_SUBST FOREIGN KEY (ID) REFERENCES NFSE (ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_NFSE_SUBST_SUBST FOREIGN KEY (SUBST_ID) REFERENCES NFSE (ID) ON UPDATE CASCADE
);

CREATE TABLE NFSE_OS (
    ID           INTEGER NOT NULL,
    NFSE_ID      CHAR(36) NOT NULL,
    NPED         INTEGER NOT NULL,
    TIPO         CHAR(3) NOT NULL,
    COD_EMPRESA  INTEGER NOT NULL,     
    VSERV        NUMERIC_13_2 NOT NULL,
    VDESCINCOND  NUMERIC_13_2 NOT NULL,     
    VRETIRRF     NUMERIC_13_2 NOT NULL,
    VRETCSLL     NUMERIC_13_2 NOT NULL,
    VRETCP       NUMERIC_13_2 NOT NULL,
    VRETPIS      NUMERIC_13_2 NOT NULL,
    VRETCOFINS   NUMERIC_13_2 NOT NULL,
    VRETISS      NUMERIC_13_2 NOT NULL,
    CONSTRAINT PK_NFSE_OS PRIMARY KEY (ID),
    CONSTRAINT FK_NFSE_OS FOREIGN KEY (NFSE_ID) REFERENCES NFSE (ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_NFSE_PEDVENDA FOREIGN KEY (NPED, TIPO, COD_EMPRESA) REFERENCES PEDVENDA (NPED, TIPO, COD_EMPRESA) ON UPDATE CASCADE
);

ALTER TABLE PEDVENDA_SERV ADD NFSE_ID CHAR(36);
ALTER TABLE PEDVENDA_SERV ADD CONSTRAINT FK_PEDVENDA_SERV_NFSE FOREIGN KEY (NFSE_ID) REFERENCES NFSE (ID) ON UPDATE CASCADE;
ALTER TABLE TIPOSERVICONFSE ADD ALIQ_CP_RET NUMERIC_3_4;
ALTER TABLE TIPO_SERVICO ADD CINDOP CHAR(6);
ALTER TABLE TIPO_SERVICO ADD GRUPO_FISCAL_IBSCBS CHAR(36);
ALTER TABLE TIPO_SERVICO ADD CONSTRAINT FK_TIPO_SERVICO_GRPFSCL_IBSCBS FOREIGN KEY (GRUPO_FISCAL_IBSCBS) REFERENCES GRUPOS_FISCAIS (ID) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE CLIENTES ADD RET_FED_NFS_SET SMALLINT;

CREATE TABLE IBPT_V2 (
  ID              INTEGER NOT NULL,
  CODIGO          VARCHAR(16) NOT NULL,
  UF              CHAR(2) NOT NULL,
  EX              INTEGER NOT NULL,                                                   
  TIPO            VARCHAR(50) NOT NULL,
  DESCRICAO       VARCHAR(150) NOT NULL,
  NACIONAL        NUMERIC_11_2 NOT NULL,
  ESTADUAL        NUMERIC_11_2 NOT NULL,
  IMPORTADO       NUMERIC_11_2 NOT NULL,
  MUNICIPAL       NUMERIC_11_2 NOT NULL,
  VIGENCIAINICIO  TIMESTAMP NOT NULL,
  VIGENCIAFIM     TIMESTAMP,
  CHAVE           VARCHAR(50),
  VERSAO          VARCHAR(50),
  CONSTRAINT PK_IBPT_V2 PRIMARY KEY (ID)
);

CREATE INDEX IDX_IBPT_V2 ON IBPT_V2 (CODIGO, UF, TIPO);
CREATE INDEX IDX_IBPT_V2_DATA ON IBPT_V2 (CODIGO, UF, TIPO, VIGENCIAINICIO, VIGENCIAFIM);
CREATE INDEX IDX_IBPT_CHV_VER ON IBPT_V2 (CHAVE, VERSAO, TIPO);
CREATE SEQUENCE SEQ_IBPT_V2;

CREATE TABLE NFS_FISCAL_CORREL (
  ID           INTEGER NOT NULL,
  CLC116       CHAR(5) NOT NULL,
  CNBS         CHAR(9) NOT NULL,
  CINDOP       CHAR(6) NOT NULL,
  CCLASSTRIB   CHAR(6) NOT NULL,
  CONSTRAINT PK_NFS_FISCAL_CORREL PRIMARY KEY (ID)
);

CREATE INDEX IDX_NFS_FISCAL_CORREL_CLC116 ON NFS_FISCAL_CORREL (CLC116);

CREATE TABLE NFS_FISCAL_CINDOP (
  CINDOP      CHAR(6) NOT NULL,
  DESCRICAO   VARCHAR(120) NOT NULL,
  CONSTRAINT PK_NFS_FISCAL_CINDOP PRIMARY KEY (CINDOP)
);

CREATE TABLE NFS_FISCAL_CTRIBNAC (
  CTRIBNAC    CHAR(6) NOT NULL,
  DESCRICAO   VARCHAR(500) NOT NULL,
  CONSTRAINT PK_NFS_FISCAL_CTRIBNAC PRIMARY KEY (CTRIBNAC)
);

--|BLOCO|
CREATE OR ALTER VIEW VW_RPS_NFSE_LEGADO(
    NOME_CLIENTE,
    NPED,
    TIPO,
    ALIQ_ISS,
    NFS_SERVICO,
    CNAE_SERV,
    VL_LIQ,
    VALORNF,
    CIDADE,
    COD_RPS,
    N_NF,
    COD_EMPRESA,
    DATA_FECH,
    STATUS_NFSE,
    ISS_RETIDO,
    CTISS,
    CTRIBNAC,
    CTRIBMUN,
    CNBS,
    NFSE_NACIONAL,
    MODELO_NFSE,
    EMISSAO_RPS,
    COD_CLIENTE,
    CODIGO_VERWSNFSE,
    NFS_SERVICO_TS,
    IRRF_SERVICO,
    ISSRET_SERVICO,
    PISRF_SERVICO,
    COFINSRF_SERVICO,
    CSSLRF_SERVICO,
    BRUTO)
AS
--Autorizadas versao nao nacional
select clientes.nome_cliente, pedvenda.nped, pedvenda.tipo, pedvenda_serv.aliq_iss,
       pedvenda_serv.nfs_servico, pedvenda_serv.cnae_serv,
       sum(pedvenda_serv.valor_tot_serv + coalesce(pedvenda_serv.rateio_acresc, 0) - pedvenda_serv.rateio_desc) vl_liq,
       sum(pedvenda_serv.valor_nfse) as valornf, clientes.cidade, pedvenda_serv.cod_rps, pedvenda_serv.n_nf, pedvenda_serv.cod_empresa,
       pedvenda.data_fech, pedvenda_serv.status_nfse, pedvenda_serv.iss_retido, pedvenda_serv.ctiss,
       pedvenda_serv.ctribnac, pedvenda_serv.ctribmun, pedvenda_serv.cnbs, 0 nfse_nacional, pedvenda_serv.modelo_nfse,
       pedvenda_serv.emissao_rps, pedvenda.cod_cliente, pedvenda_serv.codigo_verwsnfse, tipo_servico.nfs_servico nfs_servico_ts,
       sum(pedvenda_serv.irrf_servico) as irrf_servico,
       sum(pedvenda_serv.issret_servico) as issret_servico,
       sum(pedvenda_serv.pisrf_servico) as pisrf_servico,
       sum(pedvenda_serv.cofinsrf_servico) as cofinsrf_servico,
       sum(pedvenda_serv.csslrf_servico) as csslrf_servico,
       sum(pedvenda_serv.valor_b_nfse) as bruto
from pedvenda_serv
  inner join tipo_servico on tipo_servico.cod_servico = pedvenda_serv.cod_servico
  inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and
        pedvenda_serv.tipo = pedvenda.tipo and
        pedvenda_serv.cod_empresa = pedvenda.cod_empresa
  inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and
        pedvenda.cod_empresa = clientes.cod_empresa
  inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa
where pedvenda.tipo = 'OS' and pedvenda.status_ped = 'FECHADA'
  and pedvenda_serv.valor_tot_serv <> 0 and coalesce(pedvenda_serv.status, '') <> 'CANCELADO' and pedvenda.ativo = 1
  and pedvenda_serv.n_nf is not null and pedvenda_serv.n_nf > 0
  and coalesce(pedvenda_serv.nfse_nacional, 0) <> 1
  and pedvenda_serv.nfse_id is null
group by nome_cliente, nped, tipo, aliq_iss, nfs_servico, cnae_serv, cidade, cod_rps, n_nf, cod_empresa, data_fech, status_nfse, iss_retido, ctiss,
  ctribnac, ctribmun, cnbs, nfse_nacional, modelo_nfse, emissao_rps, cod_cliente, codigo_verwsnfse, nfs_servico_ts
union   
--Nao autorizadas padrao nacional desativado
select clientes.nome_cliente, pedvenda.nped, pedvenda.tipo, iif(cs.value1_f = 1, empresa.aliq_simples_iss, tipo_servico.aliq_iss) aliq_iss,
       tipo_servico.nfs_servico, tipo_servico.cnae_serv,
       sum(pedvenda_serv.valor_tot_serv + coalesce(pedvenda_serv.rateio_acresc, 0) - pedvenda_serv.rateio_desc) vl_liq,
       sum(pedvenda_serv.valor_nfse) as valornf, clientes.cidade, pedvenda_serv.cod_rps, pedvenda_serv.n_nf, pedvenda_serv.cod_empresa,
       pedvenda.data_fech, pedvenda_serv.status_nfse,
       case
         when coalesce(clientes.iss_retido, 0) <> 0 then clientes.iss_retido
         else tipo_servico.iss_retido
       end as iss_retido,
       tipo_servico.ctiss,
       tipo_servico.ctribnac, tipo_servico.ctribmun, tipo_servico.cnbs, 0 nfse_nacional, pedvenda_serv.modelo_nfse,
       pedvenda_serv.emissao_rps, pedvenda.cod_cliente, pedvenda_serv.codigo_verwsnfse, tipo_servico.nfs_servico nfs_servico_ts,
       sum(pedvenda_serv.irrf_servico) as irrf_servico,
       sum(pedvenda_serv.issret_servico) as issret_servico,
       sum(pedvenda_serv.pisrf_servico) as pisrf_servico,
       sum(pedvenda_serv.cofinsrf_servico) as cofinsrf_servico,
       sum(pedvenda_serv.csslrf_servico) as csslrf_servico,
       sum(pedvenda_serv.valor_b_nfse) as bruto
from pedvenda_serv
  inner join tipo_servico on tipo_servico.cod_servico = pedvenda_serv.cod_servico
  inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and
        pedvenda_serv.tipo = pedvenda.tipo and
        pedvenda_serv.cod_empresa = pedvenda.cod_empresa
  inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and
        pedvenda.cod_empresa = clientes.cod_empresa
  inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa
  left join config_sistema cs on cs.chave = 'nfse_simples_nacional_aliq' and
        cs.cod_empresa = empresa.cod_empresa
  left join config_sistema cn on cn.chave = 'nfse_config' and
        cn.cod_empresa = empresa.cod_empresa
where pedvenda.tipo = 'OS' and pedvenda.status_ped = 'FECHADA'
  and pedvenda_serv.valor_tot_serv <> 0 and coalesce(pedvenda_serv.status, '') <> 'CANCELADO' and pedvenda.ativo = 1
  and coalesce(pedvenda_serv.n_nf, 0) = 0
  and coalesce(pedvenda_serv.nfse_nacional, 0) <> 1
  and coalesce(cn.value1_f, 0) = 0
  and pedvenda_serv.nfse_id is null
group by nome_cliente, nped, tipo, aliq_iss, nfs_servico, cnae_serv, cidade, cod_rps, n_nf, cod_empresa, data_fech, status_nfse, iss_retido, ctiss,
  ctribnac, ctribmun, cnbs, nfse_nacional, modelo_nfse, emissao_rps, cod_cliente, codigo_verwsnfse, nfs_servico_ts
union
--Padrao nacional autorizadas
select clientes.nome_cliente, pedvenda.nped, pedvenda.tipo, pedvenda_serv.aliq_iss,
       null nfs_servico, null cnae_serv,
       sum(pedvenda_serv.valor_tot_serv + coalesce(pedvenda_serv.rateio_acresc, 0) - pedvenda_serv.rateio_desc) vl_liq,
       sum(pedvenda_serv.valor_nfse) as valornf, clientes.cidade, pedvenda_serv.cod_rps, pedvenda_serv.n_nf, pedvenda_serv.cod_empresa,
       pedvenda.data_fech, pedvenda_serv.status_nfse, pedvenda_serv.iss_retido, null ctiss,
       pedvenda_serv.ctribnac, pedvenda_serv.ctribmun, pedvenda_serv.cnbs, pedvenda_serv.nfse_nacional, pedvenda_serv.modelo_nfse,
       pedvenda_serv.emissao_rps, pedvenda.cod_cliente, pedvenda_serv.codigo_verwsnfse, tipo_servico.nfs_servico nfs_servico_ts,
       sum(pedvenda_serv.irrf_servico) as irrf_servico,
       sum(pedvenda_serv.issret_servico) as issret_servico,
       sum(pedvenda_serv.pisrf_servico) as pisrf_servico,
       sum(pedvenda_serv.cofinsrf_servico) as cofinsrf_servico,
       sum(pedvenda_serv.csslrf_servico) as csslrf_servico,
       sum(pedvenda_serv.valor_b_nfse) as bruto
from pedvenda_serv
  inner join tipo_servico on tipo_servico.cod_servico = pedvenda_serv.cod_servico
  inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and
        pedvenda_serv.tipo = pedvenda.tipo and
        pedvenda_serv.cod_empresa = pedvenda.cod_empresa
  inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and
        pedvenda.cod_empresa = clientes.cod_empresa
  inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa
where pedvenda.tipo = 'OS' and pedvenda.status_ped = 'FECHADA'
  and pedvenda_serv.valor_tot_serv <> 0 and coalesce(pedvenda_serv.status, '') <> 'CANCELADO' and pedvenda.ativo = 1
  and pedvenda_serv.n_nf is not null and pedvenda_serv.n_nf > 0
  and pedvenda_serv.nfse_nacional = 1
  and pedvenda_serv.nfse_id is null
group by nome_cliente, nped, tipo, aliq_iss, nfs_servico, cnae_serv, cidade, cod_rps, n_nf, cod_empresa, data_fech, status_nfse, iss_retido, ctiss,
  ctribnac, ctribmun, cnbs, nfse_nacional, modelo_nfse, emissao_rps, cod_cliente, codigo_verwsnfse, nfs_servico_ts
union   
--Nao autorizadas PADRAO NACIONAL ATIVADO
select clientes.nome_cliente, pedvenda.nped, pedvenda.tipo, iif(cs.value1_f = 1, empresa.aliq_simples_iss, tipo_servico.aliq_iss) aliq_iss,
       null nfs_servico, null cnae_serv,
       sum(pedvenda_serv.valor_tot_serv + coalesce(pedvenda_serv.rateio_acresc, 0) - pedvenda_serv.rateio_desc) vl_liq,
       sum(pedvenda_serv.valor_nfse) as valornf, clientes.cidade, pedvenda_serv.cod_rps, pedvenda_serv.n_nf, pedvenda_serv.cod_empresa,
       pedvenda.data_fech, pedvenda_serv.status_nfse,
       case
         when coalesce(clientes.iss_retido, 0) <> 0 then clientes.iss_retido
         else tipo_servico.iss_retido
       end as iss_retido,
       null ctiss,
       tipo_servico.ctribnac, tipo_servico.ctribmun, tipo_servico.cnbs, 1 nfse_nacional, pedvenda_serv.modelo_nfse,
       pedvenda_serv.emissao_rps, pedvenda.cod_cliente, pedvenda_serv.codigo_verwsnfse, tipo_servico.nfs_servico nfs_servico_ts,
       sum(pedvenda_serv.irrf_servico) as irrf_servico,
       sum(pedvenda_serv.issret_servico) as issret_servico,
       sum(pedvenda_serv.pisrf_servico) as pisrf_servico,
       sum(pedvenda_serv.cofinsrf_servico) as cofinsrf_servico,
       sum(pedvenda_serv.csslrf_servico) as csslrf_servico,
       sum(pedvenda_serv.valor_b_nfse) as bruto
from pedvenda_serv
  inner join tipo_servico on tipo_servico.cod_servico = pedvenda_serv.cod_servico
  inner join pedvenda on pedvenda_serv.nped = pedvenda.nped and
        pedvenda_serv.tipo = pedvenda.tipo and
        pedvenda_serv.cod_empresa = pedvenda.cod_empresa
  inner join clientes on pedvenda.cod_cliente = clientes.cod_cliente and
        pedvenda.cod_empresa = clientes.cod_empresa
  inner join empresa on empresa.cod_empresa = pedvenda_serv.cod_empresa
  left join config_sistema cs on cs.chave = 'nfse_simples_nacional_aliq' and
        cs.cod_empresa = empresa.cod_empresa
  left join config_sistema cn on cn.chave = 'nfse_config' and
        cn.cod_empresa = empresa.cod_empresa and cn.value1_f = 1
where pedvenda.tipo = 'OS' and pedvenda.status_ped = 'FECHADA'
  and pedvenda_serv.valor_tot_serv <> 0 and coalesce(pedvenda_serv.status, '') <> 'CANCELADO' and pedvenda.ativo = 1
  and coalesce(pedvenda_serv.n_nf, 0) = 0
  and coalesce(pedvenda_serv.nfse_nacional, coalesce(cn.value1_f, 0)) = 1
  and pedvenda_serv.nfse_id is null
group by nome_cliente, nped, tipo, aliq_iss, nfs_servico, cnae_serv, cidade, cod_rps, n_nf, cod_empresa, data_fech, status_nfse, iss_retido, ctiss,
  ctribnac, ctribmun, cnbs, nfse_nacional, modelo_nfse, emissao_rps, cod_cliente, codigo_verwsnfse, nfs_servico_ts
;
--|/BLOCO|

ALTER TABLE RTC_CLASSIFICACAO_TRIBUTARIA ADD CLTR_DATA_ATUALIZACAO TIMESTAMP;

update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1  where (RDB$FIELD_NAME = 'CLTR_IND_GCREDPRESOPER') and (RDB$RELATION_NAME = 'RTC_CLASSIFICACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1  where (RDB$FIELD_NAME = 'CLTR_IND_GMONOPADRAO') and (RDB$RELATION_NAME = 'RTC_CLASSIFICACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1  where (RDB$FIELD_NAME = 'CLTR_IND_GMONORETEN') and (RDB$RELATION_NAME = 'RTC_CLASSIFICACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1  where (RDB$FIELD_NAME = 'CLTR_IND_GMONORET') and (RDB$RELATION_NAME = 'RTC_CLASSIFICACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1  where (RDB$FIELD_NAME = 'CLTR_IND_GMONODIF') and (RDB$RELATION_NAME = 'RTC_CLASSIFICACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1  where (RDB$FIELD_NAME = 'CLTR_IND_GESTORNOCRED') and (RDB$RELATION_NAME = 'RTC_CLASSIFICACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'SITR_IND_GIBSCBS') and (RDB$RELATION_NAME = 'RTC_SITUACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'SITR_IND_GIBSCBSMONO') and (RDB$RELATION_NAME = 'RTC_SITUACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'SITR_IND_GRED') and (RDB$RELATION_NAME = 'RTC_SITUACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'SITR_IND_GDIF') and (RDB$RELATION_NAME = 'RTC_SITUACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'SITR_IND_GTRANSFCRED') and (RDB$RELATION_NAME = 'RTC_SITUACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'SITR_IND_GCREDPRESIBSZFM') and (RDB$RELATION_NAME = 'RTC_SITUACAO_TRIBUTARIA');
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'SITR_IND_GAJUSTECOMPET') and (RDB$RELATION_NAME = 'RTC_SITUACAO_TRIBUTARIA');

CREATE TABLE REGRAS_REDBENEF_PC (
  ID                 CHAR(36) NOT NULL,
  SEQID              INTEGER NOT NULL,
  DESCRICAO          VARCHAR(64) NOT NULL,
  CST                CHAR(2) NOT NULL,
  PRED               NUMERIC_3_4 NOT NULL, 
  IND_AJ             SMALLINT NOT NULL,
  COD_AJ             SMALLINT NOT NULL,
  DESCR_AJ           VARCHAR(128) NOT NULL,
  INF_COMPL_AJ       VARCHAR(128) NOT NULL,
  COD_CTA            VARCHAR(60) NOT NULL,
  DATA_INI_VIGENCIA  TIMESTAMP NOT NULL,
  DATA_FIM_VIGENCIA  TIMESTAMP DEFAULT NULL,
  ATIVO              SMALLINT DEFAULT 0 NOT NULL,
  CONSTRAINT PK_REGRAS_REDBENEF_PC PRIMARY KEY (ID)
);

CREATE TABLE REGRAS_REDBENEF_PC_EMP (
  REGRA_ID      CHAR(36) NOT NULL,
  COD_EMPRESA   INTEGER NOT NULL,
  CONSTRAINT PK_REGRAS_REDBENEF_PC_EMP PRIMARY KEY (REGRA_ID, COD_EMPRESA),
  CONSTRAINT FK_REGRAS_REDBENEF_PC_EMP FOREIGN KEY (REGRA_ID) REFERENCES REGRAS_REDBENEF_PC(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE REGRAS_REDBENEF_PC_NAT_REC (
    REGRA_ID  CHAR(36) NOT NULL,
    NAT_REC   VARCHAR(3) NOT NULL,
    CONSTRAINT PK_REGRAS_REDBENEF_PC_NAT_REC PRIMARY KEY (REGRA_ID, NAT_REC),
    CONSTRAINT FK_REGRAS_REDBENEF_PC_NAT_REC FOREIGN KEY (REGRA_ID) REFERENCES REGRAS_REDBENEF_PC (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE REGRAS_REDBENEF_PC_NCM_EXC (
  REGRA_ID  CHAR(36) NOT NULL,
  NCM       VARCHAR(8) NOT NULL,
  CONSTRAINT PK_REGRAS_REDBENEF_PC_NCM_EXC PRIMARY KEY (REGRA_ID, NCM),
  CONSTRAINT FK_REGRAS_REDBENEF_PC_NCM_EXC FOREIGN KEY (REGRA_ID) REFERENCES REGRAS_REDBENEF_PC(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AJ_REDBENEF (
  ID           CHAR(36) NOT NULL,
  CHAVE_DFE    VARCHAR(50) NOT NULL,
  COD_EMPRESA  INTEGER NOT NULL,
  REGRA_ID     CHAR(36) NOT NULL,
  IND_AJ       SMALLINT NOT NULL,
  COD_AJ       SMALLINT NOT NULL,
  DATA_REF     TIMESTAMP NOT NULL,
  CST          CHAR(2) NOT NULL,
  VBC          NUMERIC_11_2 NOT NULL,
  PPIS_AJ      NUMERIC_11_4 NOT NULL,
  VPIS_AJ      NUMERIC_11_2 NOT NULL,
  PCOFINS_AJ   NUMERIC_11_4 NOT NULL,
  VCOFINS_AJ   NUMERIC_11_2 NOT NULL,
  AUTOMATICO   SMALLINT NOT NULL,
  CONSTRAINT PK_AJ_REDBENEF PRIMARY KEY (ID),
  CONSTRAINT FK_AJ_REDBENEF FOREIGN KEY (REGRA_ID) REFERENCES REGRAS_REDBENEF_PC(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX IDX_AJ_REDBENEF_CHV ON AJ_REDBENEF (CHAVE_DFE);
CREATE INDEX IDX_AJ_REDBENEF_DATA ON AJ_REDBENEF (DATA_REF);

ALTER TABLE NOTAFISCAL ADD REDBENEFPC_CALC SMALLINT DEFAULT 0;
ALTER TABLE NFCE ADD REDBENEFPC_CALC SMALLINT DEFAULT 0;
CREATE INDEX IDX_NFCE_CHAVE_NFCE ON NFCE (CHAVE_NFCE);

--|BLOCO|
insert into sped_informacao_complementar
  (cod_inf, cod_empresa, txt, txt_compl, tipo, ativo, ativo_em_nfe, ativo_em_nfce)
select
  (select cod from incrementa_codigo(:cod_empresa, 'SPED_INFORMACAO_COMPLEMENTAR')),
  :cod_empresa,
  'Operação sujeita à redução linear de benefícios da LC 224/2025',
  'Operação sujeita à redução linear de benefícios da LC 224/2025',
  'RED_BENEF_PISCOFIN',
  1,
  'S',
  'S'
from rdb$database 
  left join sped_informacao_complementar s on s.cod_empresa = :cod_empresa and s.tipo = 'RED_BENEF_PISCOFIN'
where s.cod_inf is null
--|/BLOCO|

ALTER TABLE NOTAFISCAL ADD TPIMP SMALLINT;

CREATE TABLE DFE_ALERTAS (
    ID         CHAR(36) NOT NULL,
    CHAVE_DFE  VARCHAR(44) NOT NULL,
    CMSG       SMALLINT,
    XMSG       VARCHAR(255) NOT NULL,
    CONSTRAINT PK_DFE_ALERTAS PRIMARY KEY (ID)
);

CREATE INDEX IDX_DFE_ALERTAS ON DFE_ALERTAS (CHAVE_DFE);

CREATE TABLE NOTAFISCAL_PEND_SEFAZ (
    COD_NF            INTEGER NOT NULL,
    COD_EMPRESA       INTEGER NOT NULL,
    DHEMI             TIMESTAMP NOT NULL,
    STATUS_RESOLUCAO  SMALLINT NOT NULL,
    COD_NF_PEND       INTEGER NOT NULL,
    CONSTRAINT PK_NOTAFISCAL_PEND_SEFAZ PRIMARY KEY (COD_NF, COD_EMPRESA),
    CONSTRAINT FK_NOTAFISCAL_PEND_SEFAZ_CONT FOREIGN KEY (COD_NF, COD_EMPRESA) REFERENCES NOTAFISCAL (COD_NF, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_NOTAFISCAL_PEND_SEFAZ_PEND FOREIGN KEY (COD_NF_PEND, COD_EMPRESA) REFERENCES NOTAFISCAL (COD_NF, COD_EMPRESA) ON UPDATE CASCADE
);

ALTER TABLE NOTAFISCAL ADD CINDOP VARCHAR(6);

CREATE TABLE RTC_INDICADOR_OPERACAO_IBS_CBS (
    IOIC_ID INTEGER NOT NULL,
    IOIC_CD CHAR(6) NOT NULL,
    IOIC_LOCAL_INCIDENCIA VARCHAR(64) NOT NULL,
    IOIC_INICIO_VIGENCIA TIMESTAMP NOT NULL,
    IOIC_FIM_VIGENCIA TIMESTAMP CHECK (IOIC_FIM_VIGENCIA IS NULL OR IOIC_FIM_VIGENCIA >= IOIC_INICIO_VIGENCIA),
    IOIC_TIPO_OPERACAO VARCHAR(256),
    IOIC_CD_LOCAL_FORNECIMENTO_DFE INTEGER CHECK (IOIC_CD_LOCAL_FORNECIMENTO_DFE BETWEEN 1 AND 28),
    CONSTRAINT PK_RTC_IND_OP_IBS_CBS PRIMARY KEY (IOIC_ID)
);

CREATE INDEX IDX_RTC_IDNOP_CIBS_LCL_INCDNC ON RTC_INDICADOR_OPERACAO_IBS_CBS(IOIC_LOCAL_INCIDENCIA);
CREATE INDEX IDX_RTC_IDNOP_CIBS_IOIC_CD ON RTC_INDICADOR_OPERACAO_IBS_CBS(IOIC_CD);
CREATE INDEX IDX_RTC_IDNOP_CIBS_INI_VIGENCIA ON RTC_INDICADOR_OPERACAO_IBS_CBS(IOIC_INICIO_VIGENCIA);
CREATE INDEX IDX_RTC_IDNOP_CIBS_FIM_VIGENCIA ON RTC_INDICADOR_OPERACAO_IBS_CBS(IOIC_FIM_VIGENCIA);

CREATE TABLE RTC_LISTA_SERVICOS_LC_116 (
  LSLC_CD VARCHAR(5) NOT NULL,
  LSLC_DESCRICAO VARCHAR(512) NOT NULL,
  LSLC_INICIO_VIGENCIA TIMESTAMP NOT NULL,
  LSLC_FIM_VIGENCIA TIMESTAMP CHECK (LSLC_FIM_VIGENCIA IS NULL OR LSLC_FIM_VIGENCIA >= LSLC_INICIO_VIGENCIA),
  CONSTRAINT PK_RTC_LISTA_SERVICOS_LC_116 PRIMARY KEY(LSLC_CD)
);

CREATE INDEX IDX_LST_SRV_LC116_descricao ON RTC_LISTA_SERVICOS_LC_116(LSLC_DESCRICAO);
CREATE INDEX IDX_LST_SRV_LC116_ini_vigencia ON RTC_LISTA_SERVICOS_LC_116(LSLC_INICIO_VIGENCIA);
CREATE INDEX IDX_LST_SRV_LC116_fim_vigencia ON RTC_LISTA_SERVICOS_LC_116(LSLC_FIM_VIGENCIA);

CREATE TABLE RTC_CLASSIF_NBS_INDOP_LC (
    CNIL_ID INTEGER NOT NULL,
    CNIL_LSLC_CD VARCHAR(5) NOT NULL,
    CNIL_NBS_CD CHAR(9) NOT NULL,
    CNIL_IOIC_ID INTEGER NOT NULL,
    CNIL_CLTR_ID INTEGER NOT NULL,
    CNIL_INICIO_VIGENCIA TIMESTAMP NOT NULL,
    CNIL_FIM_VIGENCIA TIMESTAMP CHECK (CNIL_FIM_VIGENCIA IS NULL OR CNIL_FIM_VIGENCIA >= CNIL_INICIO_VIGENCIA),
    CNIL_IN_PS_ONEROSA INTEGER DEFAULT 1 NOT NULL,
    CNIL_IN_ADQ_EXTERIOR INTEGER DEFAULT 0 NOT NULL,
    CONSTRAINT PK_RTC_CLASSIF_NBS_INDOP_LC PRIMARY KEY(CNIL_ID),
    CONSTRAINT FK_RTC_CLSNBSINDPLC_LC116 FOREIGN KEY(CNIL_LSLC_CD) REFERENCES RTC_LISTA_SERVICOS_LC_116(LSLC_CD) ON UPDATE CASCADE,
    CONSTRAINT FK_RTC_CLSNBSINDPLC_NBS FOREIGN KEY(CNIL_NBS_CD) REFERENCES NBS(COD_NBS) ON UPDATE CASCADE,
    CONSTRAINT FK_RTC_CLSNBSINDPLC_INDOP FOREIGN KEY(CNIL_IOIC_ID) REFERENCES RTC_INDICADOR_OPERACAO_IBS_CBS(IOIC_ID) ON UPDATE CASCADE,
    CONSTRAINT FK_RTC_CLSNBSINDPLC_CTRIB FOREIGN KEY(CNIL_CLTR_ID) REFERENCES RTC_CLASSIFICACAO_TRIBUTARIA(CLTR_ID) ON UPDATE CASCADE
);

CREATE INDEX RTC_CLSNBSINDPLC_LSLC_CD ON RTC_CLASSIF_NBS_INDOP_LC(CNIL_LSLC_CD);
CREATE INDEX RTC_CLSNBSINDPLC_NBS_CD ON RTC_CLASSIF_NBS_INDOP_LC(CNIL_NBS_CD);
CREATE INDEX RTC_CLSNBSINDPLC_IOIC_ID ON RTC_CLASSIF_NBS_INDOP_LC(CNIL_IOIC_ID);
CREATE INDEX RTC_CLSNBSINDPLC_CLTR_ID ON RTC_CLASSIF_NBS_INDOP_LC(CNIL_CLTR_ID);
CREATE INDEX RTC_CLSNBSINDPLC_INI_VIG ON RTC_CLASSIF_NBS_INDOP_LC(CNIL_INICIO_VIGENCIA);
CREATE INDEX RTC_CLSNBSINDPLC_FIM_VIG ON RTC_CLASSIF_NBS_INDOP_LC(CNIL_FIM_VIGENCIA);

CREATE TABLE RTC_REDUTOR (
    RDTO_ID INTEGER NOT NULL,
    RDTO_CLTR_ID INTEGER NOT NULL,
    RDTO_TBTO_ID INTEGER NOT NULL,
    RDTO_VALOR NUMERIC(7,4) NOT NULL,
    RDTO_INICIO_VIGENCIA TIMESTAMP NOT NULL,
    RDTO_FIM_VIGENCIA TIMESTAMP CHECK (RDTO_FIM_VIGENCIA IS NULL OR RDTO_FIM_VIGENCIA >= RDTO_INICIO_VIGENCIA),
    CONSTRAINT PK_RTC_REDUTOR PRIMARY KEY (RDTO_ID),
    CONSTRAINT FK_RTC_REDUTOR_CTRIB FOREIGN KEY(RDTO_CLTR_ID) REFERENCES RTC_CLASSIFICACAO_TRIBUTARIA(CLTR_ID) ON UPDATE CASCADE
);

CREATE TABLE RTC_REDUTOR_COMPRA_GOV (
  RCGO_ID INTEGER NOT NULL,
  RCGO_VALOR NUMERIC(7,4) NOT NULL,
  RCGO_INICIO_VIGENCIA TIMESTAMP NOT NULL,
  RCGO_FIM_VIGENCIA TIMESTAMP CHECK (RCGO_FIM_VIGENCIA IS NULL OR RCGO_FIM_VIGENCIA >= RCGO_INICIO_VIGENCIA),
  CONSTRAINT PK_RTC_REDUTOR_CMPR_GOV PRIMARY KEY (RCGO_ID)
);

CREATE INDEX IDX_RTC_RDTR_CMPR_GOV_INI_VIG ON RTC_REDUTOR_COMPRA_GOV(RCGO_INICIO_VIGENCIA);
CREATE INDEX IDX_RTC_RDTR_CMPR_GOV_FIM_VIG ON RTC_REDUTOR_COMPRA_GOV(RCGO_FIM_VIGENCIA);

CREATE TABLE RTC_TRANSFERENCIA_CBS_ENTE_GOV (
  TCEG_ID INTEGER NOT NULL,
  TCEG_VALOR NUMERIC(7,4) NOT NULL,
  TCEG_INICIO_VIGENCIA TIMESTAMP NOT NULL,
  TCEG_FIM_VIGENCIA TIMESTAMP CHECK (TCEG_FIM_VIGENCIA IS NULL OR TCEG_FIM_VIGENCIA >= TCEG_INICIO_VIGENCIA),
  CONSTRAINT PK_RTC_TRANSF_CBS_ENTE_GOV PRIMARY KEY (TCEG_ID)
);

CREATE INDEX IDX_TRANSF_CBS_ENTE_GOV_IN_VIG ON RTC_TRANSFERENCIA_CBS_ENTE_GOV(TCEG_INICIO_VIGENCIA);
CREATE INDEX IDX_TRANSF_CBS_ENTE_GOV_FIM_VIG ON RTC_TRANSFERENCIA_CBS_ENTE_GOV(TCEG_FIM_VIGENCIA);

--|BLOCO|
INSERT INTO CONFIG_SISTEMA
  (CHAVE, COD_EMPRESA, VALUE1_VC, ATIVO)
VALUES
  (
    'rtc_api_token', 0,
    '8nYcex/t59xhwYbiFQotsM7Yy4PIFUHVSIQTqhzPE00b2Hd+W1oUN8xKRFYANb2ssM5o2w1ILJeywcN1j0x918wYkoF8Cs5TvGRzG+JpSzbV8TBTEMb4F0OMy2mQKNBms1YgAUpSvps3CrOOlihuAdFTNprSKwb72Y7PZdgSm2zxdP1zIyMrfm/7dHQAdoAgLz7k9JGGtK1xegJO7csYm6lIsFqj9hAk5AA=',
    0
  );
--|/BLOCO|

ALTER TABLE RTC_INDICADOR_OPERACAO_IBS_CBS ADD IOIC_CD_LOCAL_INCIDENCIA INTEGER;

--|BLOCO|
ALTER TABLE RTC_CLASSIF_NBS_INDOP_LC DROP CONSTRAINT FK_RTC_CLSNBSINDPLC_LC116;
ALTER TABLE RTC_LISTA_SERVICOS_LC_116 DROP CONSTRAINT PK_RTC_LISTA_SERVICOS_LC_116;
ALTER TABLE RTC_LISTA_SERVICOS_LC_116 ALTER COLUMN LSLC_CD TYPE VARCHAR(8);
ALTER TABLE RTC_CLASSIF_NBS_INDOP_LC ALTER COLUMN CNIL_LSLC_CD TYPE VARCHAR(8);
ALTER TABLE RTC_LISTA_SERVICOS_LC_116 ADD CONSTRAINT PK_RTC_LISTA_SERVICOS_LC_116 PRIMARY KEY (LSLC_CD);
ALTER TABLE RTC_CLASSIF_NBS_INDOP_LC ADD CONSTRAINT FK_RTC_CLSNBSINDPLC_LC116 FOREIGN KEY (CNIL_LSLC_CD) REFERENCES RTC_LISTA_SERVICOS_LC_116 (LSLC_CD) ON UPDATE CASCADE;
--|/BLOCO|