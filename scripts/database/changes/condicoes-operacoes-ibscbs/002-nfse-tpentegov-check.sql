--|BLOCO|
-- Demanda: condicoes-operacoes-ibscbs (INC-4)
-- NFSE.TPENTEGOV: permitir tambem os valores 5 e 6 do catalogo oficial.
--
-- O CHECK original foi criado sem nome (029.sql), gerando INTEG_<n> distinto
-- em cada instalacao. Este bloco reconhece apenas as formas conhecidas do
-- predicado e substitui a forma legada 1..4 pela forma desejada 1..6.
--
-- Normalizacao de RDB$TRIGGER_SOURCE:
--   1. converte para maiusculas;
--   2. remove espacos, TAB, CR e LF;
--   3. remove aspas duplas de identificador;
--   4. remove TODOS os parenteses;
--   5. remove um eventual prefixo CHECK do wrapper da constraint.
-- Os dois nucleos aceitos, ja normalizados, sao exatamente:
--   legado  : TPENTEGOVISNULLORTPENTEGOVIN1,2,3,4
--   desejado: TPENTEGOVISNULLORTPENTEGOVIN1,2,3,4,5,6
-- A comparacao e igualdade do texto inteiro. Remover parenteses nao amplia o
-- reconhecimento: qualquer token extra (AND, OR, NOT, outro literal, etc.)
-- altera o nucleo e a constraint nao e reconhecida. Aspas simples de literais
-- nao sao removidas, portanto uma forma com literais textuais tambem falha.
--
-- Regra de falha fechada: antes de qualquer DDL, todo CHECK de NFSE e lido.
-- Se um CHECK citar TPENTEGOV e o nucleo nao for exatamente uma das duas
-- formas, ou se CK_NFSE_TPENTEGOV existir com predicado nao desejado, o bloco
-- aborta sem executar DDL. Constraints compostas ou nao relacionadas nunca sao
-- removidas: a lista de remocao recebe apenas nomes cujo nucleo e igual ao
-- legado. O nome CK_NFSE_TPENTEGOV nao e reutilizado se ja pertencer a uma
-- constraint que nao seja CHECK.
--
-- Idempotente:
--   * somente legado          -> remove o legado e cria CK_NFSE_TPENTEGOV;
--   * legado + desejado       -> remove o legado e preserva o desejado;
--   * somente desejado        -> nenhuma DDL;
--   * nenhum                  -> cria CK_NFSE_TPENTEGOV;
--   * reexecucao              -> reconhece o desejado e nao executa DDL.
--
-- Dados/ordem: o predicado desejado e superconjunto estrito do legado conhecido
-- (NULL e 1..4 continuam validos; 5/6 passam a ser aceitos). Sem DML/backfill.
-- A garantia sobre dados existentes pressupoe o CHECK legado presente; se ele
-- nao existir, a criacao pode falhar caso ja existam valores fora de NULL/1..6.
-- Aplicar o banco antes do codigo que grava 5/6. schema.sql permanece a
-- referencia anterior a migracao. Sem COMMIT explicito: as DDL do bloco ficam
-- no comando/transacao do executor. Sintaxe compativel com Firebird 2.5.
EXECUTE BLOCK AS
DECLARE VARIABLE v_nome          VARCHAR(31);
DECLARE VARIABLE v_fonte         VARCHAR(8192);
DECLARE VARIABLE v_core          VARCHAR(8192);
DECLARE VARIABLE v_core_legado   VARCHAR(64);
DECLARE VARIABLE v_core_desejado VARCHAR(64);
DECLARE VARIABLE v_legados       VARCHAR(4000);
DECLARE VARIABLE v_alvo          VARCHAR(4096);
DECLARE VARIABLE v_busca         VARCHAR(64);
DECLARE VARIABLE v_nome_sql      VARCHAR(64);
DECLARE VARIABLE v_sql           VARCHAR(512);
DECLARE VARIABLE v_pos           INTEGER;
DECLARE VARIABLE v_sep           VARCHAR(1);
DECLARE VARIABLE v_tem_desejado  SMALLINT;
DECLARE VARIABLE v_invalido      SMALLINT;
DECLARE VARIABLE v_conflito_tipo BIGINT;
DECLARE VARIABLE v_erro          VARCHAR(255);
DECLARE VARIABLE v_falha         INTEGER;
BEGIN
  v_sep           = ';';
  v_core_legado   = 'TPENTEGOVISNULLORTPENTEGOVIN1,2,3,4';
  v_core_desejado = 'TPENTEGOVISNULLORTPENTEGOVIN1,2,3,4,5,6';
  v_legados       = '';
  v_tem_desejado  = 0;
  v_invalido      = 0;
  v_erro          = 'falha de validacao; nenhuma DDL foi executada.';

  /* O nome estavel nao pode pertencer a outro tipo de constraint. */
  SELECT COUNT(*)
    FROM RDB$RELATION_CONSTRAINTS rc
    WHERE TRIM(rc.RDB$CONSTRAINT_NAME) = 'CK_NFSE_TPENTEGOV'
      AND TRIM(rc.RDB$RELATION_NAME) <> 'NFSE'
    INTO :v_conflito_tipo;

  IF (COALESCE(v_conflito_tipo, 0) > 0) THEN
  BEGIN
    v_falha = CAST('INC4-F04 CK_NFSE_TPENTEGOV ja existe em outra relacao; nenhuma DDL foi executada.' AS INTEGER);
  END

  SELECT COUNT(*)
    FROM RDB$RELATION_CONSTRAINTS rc
    WHERE TRIM(rc.RDB$CONSTRAINT_NAME) = 'CK_NFSE_TPENTEGOV'
      AND TRIM(rc.RDB$RELATION_NAME) = 'NFSE'
      AND COALESCE(TRIM(rc.RDB$CONSTRAINT_TYPE), '') <> 'CHECK'
    INTO :v_conflito_tipo;

  IF (COALESCE(v_conflito_tipo, 0) > 0) THEN
  BEGIN
    v_falha = CAST('CK_NFSE_TPENTEGOV ja existe em NFSE como constraint nao-CHECK; nenhuma DDL foi executada.' AS INTEGER);
  END

  /* Fase 1: le e valida o conjunto inteiro. Nenhuma DDL nesta fase. */
  FOR SELECT TRIM(rc.RDB$CONSTRAINT_NAME),
             COALESCE(CAST(t.RDB$TRIGGER_SOURCE AS VARCHAR(8192)), '')
      FROM RDB$RELATION_CONSTRAINTS rc
      INNER JOIN RDB$CHECK_CONSTRAINTS cc
        ON cc.RDB$CONSTRAINT_NAME = rc.RDB$CONSTRAINT_NAME
      INNER JOIN RDB$TRIGGERS t
        ON t.RDB$TRIGGER_NAME = cc.RDB$TRIGGER_NAME
      WHERE TRIM(rc.RDB$RELATION_NAME) = 'NFSE'
        AND rc.RDB$CONSTRAINT_TYPE = 'CHECK'
      INTO :v_nome, :v_fonte
  DO
  BEGIN
    v_core = UPPER(v_fonte);
    v_core = REPLACE(v_core, ' ', '');
    v_core = REPLACE(v_core, ASCII_CHAR(9), '');
    v_core = REPLACE(v_core, ASCII_CHAR(10), '');
    v_core = REPLACE(v_core, ASCII_CHAR(13), '');
    v_core = REPLACE(v_core, '"', '');
    v_core = REPLACE(v_core, '(', '');
    v_core = REPLACE(v_core, ')', '');

    IF (v_core STARTING WITH 'CHECK') THEN
      v_core = SUBSTRING(v_core FROM 6);

    IF (v_nome = 'CK_NFSE_TPENTEGOV') THEN
    BEGIN
      IF (v_core = v_core_desejado) THEN
        v_tem_desejado = 1;
      ELSE
      BEGIN
        v_invalido = 1;
        v_erro = 'CK_NFSE_TPENTEGOV existe com predicado nao desejado; nenhuma DDL foi executada.';
      END
    END
    ELSE IF (POSITION('TPENTEGOV' IN v_core) > 0) THEN
    BEGIN
      /* POSITION apenas detecta a mencao para validar/falhar fechado.
         A remocao exige igualdade exata com o nucleo legado. */
      IF (v_core = v_core_legado) THEN
      BEGIN
        IF (POSITION(v_sep IN v_nome) > 0) THEN
        BEGIN
          v_invalido = 1;
          v_erro = 'CHECK legado com separador interno no nome; nenhuma DDL foi executada.';
        END
        ELSE
        BEGIN
          v_busca = v_sep || v_nome || v_sep;
          v_alvo  = v_sep || v_legados;
          IF (POSITION(v_busca IN v_alvo) = 0) THEN
          BEGIN
            IF ((CHAR_LENGTH(v_legados) + CHAR_LENGTH(v_nome) + 1) > 4000) THEN
            BEGIN
              v_invalido = 1;
              v_erro = 'lista de CHECKs legados excede o buffer; nenhuma DDL foi executada.';
            END
            ELSE
              v_legados = v_legados || v_nome || v_sep;
          END
        END
      END
      ELSE IF (v_core = v_core_desejado) THEN
        v_tem_desejado = 1;
      ELSE
      BEGIN
        v_invalido = 1;
        v_erro = 'CHECK ' || v_nome || ' cita TPENTEGOV fora das formas reconhecidas; nenhuma DDL foi executada.';
      END
    END
  END

  /* Fase 2: falha fechada antes de qualquer DDL.
     Firebird 2.5 nao oferece um SIGNAL ad-hoc com mensagem sem criar um objeto
     persistente. A conversao invalida e deliberada e aborta o bloco com
     "conversion error from string ..." contendo a mensagem acima. Nenhum objeto
     persistente e criado e a excecao nao e capturada. */
  IF (v_invalido = 1) THEN
  BEGIN
    v_falha = CAST(('INC4-F02 ' || v_erro) AS INTEGER);
  END

  /* Fase 3: remove somente os CHECKs legados reconhecidos. */
  WHILE (v_legados <> '') DO
  BEGIN
    v_pos = POSITION(v_sep IN v_legados);
    v_nome = SUBSTRING(v_legados FROM 1 FOR v_pos - 1);
    v_legados = SUBSTRING(v_legados FROM v_pos + 1);
    v_nome_sql = REPLACE(v_nome, '"', '""');
    v_sql = 'ALTER TABLE NFSE DROP CONSTRAINT "' || v_nome_sql || '"';
    EXECUTE STATEMENT :v_sql;
  END

  /* Fase 4: cria o nome estavel apenas quando nao ha forma desejada. */
  IF (v_tem_desejado = 0) THEN
    EXECUTE STATEMENT 'ALTER TABLE NFSE ADD CONSTRAINT CK_NFSE_TPENTEGOV CHECK ((TPENTEGOV IS NULL) OR (TPENTEGOV IN (1,2,3,4,5,6)))';
END;
--|/BLOCO|
