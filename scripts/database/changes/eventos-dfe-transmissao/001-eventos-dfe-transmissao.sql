-- =============================================================================
-- HWDESKTOP - Eventos DF-e: transmissao e recuperacao de transmissao
-- Change: eventos-dfe-transmissao
-- Script: 001-eventos-dfe-transmissao.sql
-- Banco:  Firebird 2.5
-- Run:    20261121-eventos-dfe-transmissao
--
-- ESTADO: PREPARADO. NAO EXECUTADO. NAO INCORPORADO EM scripts/versoes.
-- A execucao e a incorporacao exigem autorizacao propria e seguem
-- .ai/rules/database-safety.md e .ai/skills/database-migration/SKILL.md.
--
-- PREREQUISITO: scripts/database/changes/eventos-dfe-consulta-cadastro/
--               001-eventos-dfe.sql deve ser aplicado antes deste script.
--               Este arquivo complementa aquele esquema: nao redeclara
--               EVENTOS_DFE, EVENTOS_DFE_112150 nem EVENTOS_DFE_211130_ITEM.
--
-- Escopo:
--   1. EVENTOS_DFE passa a possuir estado, numeracao nSeqEvento e os dados de
--      envelope do evento (ambiente, CNPJ, cOrgao, tpAutor, cOrgaoAutor).
--   2. Nova tabela EVENTOS_DFE_TRANSMISSAO (material por tentativa, incluindo
--      CSTAT_LOTE, CSTAT_EVENTO, ORIGEM_RESULTADO, DH_EVENTO e os XMLs).
--   3. Indice NAO unico de apoio a checagem de duplicidade.
--
-- Deliberadamente NAO cria:
--   - indice unico sobre (COD_EMPRESA, CHAVE_DOCUMENTO, TIPO_EVENTO), pois o
--     Firebird 2.5 nao possui indice parcial e varias exclusoes logicas de
--     registros em rascunho/rejeitados precisam coexistir (ATIVO = 0);
--   - generator para EVENTOS_DFE_TRANSMISSAO.ID (UUID gerado no repositorio,
--     como em EVENTOS_DFE_211130_ITEM.ID);
--   - qualquer alteracao em EVENTOS_DFE_112150 ou EVENTOS_DFE_211130_ITEM;
--   - coluna de versao de leiaute: a versao e resolvida pelo ACBr na chamada.
--
-- Compatibilidade: Firebird 2.5. NAO usa ALTER COLUMN ... SET NOT NULL (3.0+)
-- nem UPDATE em massa para backfill. As colunas obrigatorias nascem com
-- DEFAULT ... NOT NULL, forma aceita pelo 2.5.
--
-- Nao e idempotente por natureza (ALTER ADD / CREATE); executar uma unica vez.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. EVENTOS_DFE - estado, numeracao e envelope do evento
-- -----------------------------------------------------------------------------

-- DEFAULT ... NOT NULL: o valor padrao vale para as linhas ja existentes.
-- NSEQ_EVENTO = 0 significa "ainda nao alocado"; a alocacao ocorre na primeira
-- transmissao e o valor passa a ser imutavel.
ALTER TABLE EVENTOS_DFE ADD NSEQ_EVENTO INTEGER DEFAULT 0 NOT NULL;
ALTER TABLE EVENTOS_DFE ADD STATUS VARCHAR(15) DEFAULT 'PENDENTE' NOT NULL;

-- Envelope do evento: preenchido na primeira transmissao (T1).
ALTER TABLE EVENTOS_DFE ADD AMBIENTE SMALLINT;
ALTER TABLE EVENTOS_DFE ADD CNPJ VARCHAR(14);
ALTER TABLE EVENTOS_DFE ADD CORGAO SMALLINT;
ALTER TABLE EVENTOS_DFE ADD TP_AUTOR SMALLINT;
ALTER TABLE EVENTOS_DFE ADD C_ORGAO_AUTOR SMALLINT;

-- Dados visiveis do ultimo resultado.
ALTER TABLE EVENTOS_DFE ADD XMOTIVO VARCHAR(255);
ALTER TABLE EVENTOS_DFE ADD NPROT VARCHAR(20);
ALTER TABLE EVENTOS_DFE ADD DH_REG_EVENTO TIMESTAMP;

-- Verificacao pos-ALTER: deve retornar 0. Se retornar > 0, a instalacao nao
-- aplicou o DEFAULT as linhas antigas; nesse caso usar o caminho alternativo
-- documentado no desenho (secao 5.1):
--   1) adicionar as colunas sem NOT NULL;
--   2) UPDATE EVENTOS_DFE SET STATUS = 'PENDENTE' WHERE STATUS IS NULL;
--   3) UPDATE EVENTOS_DFE SET NSEQ_EVENTO = 0 WHERE NSEQ_EVENTO IS NULL;
--   4) manter a obrigatoriedade na aplicacao; nunca usar SET NOT NULL.
-- SELECT COUNT(*) FROM EVENTOS_DFE
--  WHERE STATUS IS NULL OR NSEQ_EVENTO IS NULL;

ALTER TABLE EVENTOS_DFE ADD CONSTRAINT CHK_EVENTOS_DFE_NSEQ
  CHECK (NSEQ_EVENTO >= 0);
ALTER TABLE EVENTOS_DFE ADD CONSTRAINT CHK_EVENTOS_DFE_STATUS
  CHECK (STATUS IN ('PENDENTE', 'ENVIANDO', 'AUTORIZADO', 'REJEITADO'));
ALTER TABLE EVENTOS_DFE ADD CONSTRAINT CHK_EVENTOS_DFE_AMBIENTE
  CHECK (AMBIENTE IS NULL OR AMBIENTE IN (1, 2));

-- Indice de apoio (NAO unico): checagem de duplicidade e MAX(NSEQ_EVENTO)
-- dos eventos autorizados da mesma empresa/chave/tipo.
CREATE INDEX IDX_EVENTOS_DFE_DUP
  ON EVENTOS_DFE (COD_EMPRESA, CHAVE_DOCUMENTO, TIPO_EVENTO, ATIVO, STATUS);

-- -----------------------------------------------------------------------------
-- 2. EVENTOS_DFE_TRANSMISSAO - material especifico da tentativa
--    Nao repete identidade, empresa, ambiente, CNPJ, cOrgao, tpAutor, autor,
--    XMOTIVO, NPROT nem DH_REG_EVENTO, que pertencem a EVENTOS_DFE.
-- -----------------------------------------------------------------------------

CREATE TABLE EVENTOS_DFE_TRANSMISSAO (
  ID              CHAR(36) NOT NULL,
  EVENTO_DFE_ID   CHAR(36) NOT NULL,
  ID_LOTE         BIGINT NOT NULL,
  DH_EVENTO       TIMESTAMP NOT NULL,
  DATA_INICIO     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  DATA_FIM        TIMESTAMP,
  CONCLUIDA       SMALLINT DEFAULT 0 NOT NULL,
  CSTAT_LOTE      INTEGER,
  CSTAT_EVENTO    INTEGER,
  ORIGEM_RESULTADO SMALLINT,
  XML_ENVIO       BLOB SUB_TYPE TEXT,
  XML_RETORNO     BLOB SUB_TYPE TEXT,
  XML_PROC_EVENTO BLOB SUB_TYPE TEXT,
  CONSTRAINT PK_EVENTOS_DFE_TRANSMISSAO PRIMARY KEY (ID),
  CONSTRAINT FK_EVENTOS_DFE_TRANSMISSAO FOREIGN KEY (EVENTO_DFE_ID)
    REFERENCES EVENTOS_DFE (ID) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT CHK_EVT_DFE_TRANS_CONCLUIDA CHECK (CONCLUIDA IN (0, 1)),
  CONSTRAINT CHK_EVT_DFE_TRANS_ORIGEM
    CHECK (ORIGEM_RESULTADO IS NULL OR ORIGEM_RESULTADO IN (0, 1, 2)),
  CONSTRAINT CHK_EVT_DFE_TRANS_LOTE CHECK (ID_LOTE > 0)
);

CREATE INDEX IDX_EVENTOS_DFE_TRANS_EVENTO
  ON EVENTOS_DFE_TRANSMISSAO (EVENTO_DFE_ID, CONCLUIDA);

CREATE INDEX IDX_EVENTOS_DFE_TRANS_LOTE
  ON EVENTOS_DFE_TRANSMISSAO (ID_LOTE);

-- =============================================================================
-- Fim do script. Nada aqui foi executado.
-- =============================================================================
