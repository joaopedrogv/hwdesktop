	/* Relação de contas para fazer rateio de valores de acordo com o que for definido aqui*/
CREATE TABLE CONTAS_REL_ORIGEM (
    N_CONTA_PLC_OR  "T_N_GERAL" NOT NULL,
    N_CONTA_PLC_VAL  T_N_GERAL NOT NULL
);

/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/
ALTER TABLE CONTAS_REL_ORIGEM ADD CONSTRAINT PK_REL_ORIGEM PRIMARY KEY (N_CONTA_PLC_OR, N_CONTA_PLC_VAL);



/* Relação de contas para fazer rateio de valores de acordo com o que for definido aqui*/
CREATE TABLE CONTAS_RAT_VALOR (
    N_CONTA_PLC_DEST  "T_N_GERAL" NOT NULL,
    N_CONTA_PLC_OR  T_N_GERAL NOT NULL
);

/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/
ALTER TABLE CONTAS_RAT_VALOR ADD CONSTRAINT PK_REL_VALOR PRIMARY KEY (N_CONTA_PLC_DEST, N_CONTA_PLC_OR);


CREATE TABLE REL_DEPTO (
    COD_DEP       INTEGER NOT NULL,
    COD_DEPRAT    INTEGER NOT NULL,
    TPRAT         VARCHAR(40) CHARACTER SET NONE NOT NULL,
    MEDQTDRATFAT  INTEGER NOT NULL,
    ATIVO         INTEGER DEFAULT 1,
    RATEM         VARCHAR(40) CHARACTER SET NONE NOT NULL
);


/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE REL_DEPTO ADD CONSTRAINT PK_REL_DEPTO PRIMARY KEY (COD_DEP,COD_DEPRAT);

/* Dados que serão impressos nos balanço patrimonial gerencial dentro de ativo e passivo */

CREATE TABLE DADOS_BALANCO (
    CODSEQ_BALANCO INTEGER NOT NULL,
    TIPO_BALANCO VARCHAR(7) NOT NULL, /* ATIVO OU PASSIVO */
    CODIGO_INT_BAL  VARCHAR(10) NOT NULL,/* 1.01 OU 1.01.01, ETC */
    DESC_BALANCO     CHAR(30) CHARACTER SET NONE NOT NULL,
    ATIVO        INTEGER DEFAULT 1
);

ALTER TABLE DADOS_BALANCO ADD CONSTRAINT PK_DADOS_BALANCO PRIMARY KEY (CODSEQ_BALANCO,TIPO_BALANCO,CODIGO_INT_BAL);


CREATE TABLE APURACAO_DEPTO (
    COD_DEP      INTEGER NOT NULL,
    MES          INTEGER NOT NULL,
    ANO          INTEGER NOT NULL,
    TPDESP       CHAR(4) CHARACTER SET NONE NOT NULL,/* Podendo ser CF(Valor), CMV(%), OCV(%) */
    COD_EMPRESA  INTEGER NOT NULL,
    VALOR        T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    PE           T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    DNADEP       CHAR(50),
    ATIVO        INTEGER DEFAULT 1
);



/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE APURACAO_DEPTO ADD CONSTRAINT PK_APURACAO_DEPTO PRIMARY KEY (COD_DEP, MES, ANO, TPDESP,COD_EMPRESA);


CREATE TABLE PERCRATFAT (
    TIPOFAT     VARCHAR(40),
    PERCFAT     T_N_GERAL,
    COD_EMPRESA  INTEGER NOT NULL,
    ATIVO        INTEGER DEFAULT 1
);


CREATE TABLE APURACAO_BALANCO (
    COD_SEQBALANCO  INTEGER NOT NULL,
    MES             INTEGER NOT NULL,
    ANO             INTEGER NOT NULL,
    COD_EMPRESA     INTEGER NOT NULL,
    VALOR           T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    ATIVO           INTEGER DEFAULT 1
);




/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE APURACAO_BALANCO ADD CONSTRAINT PK_APURACAO_BALANCO PRIMARY KEY (COD_SEQBALANCO, MES, ANO, COD_EMPRESA);


CREATE TABLE INDICES_BALANCO (
    NOME_INDICE  VARCHAR(50) NOT NULL,
    MES          INTEGER NOT NULL,
    ANO          INTEGER NOT NULL,
    COD_EMPRESA  INTEGER NOT NULL,
    VALOR        T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    ATIVO        INTEGER DEFAULT 1
);




/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE INDICES_BALANCO ADD CONSTRAINT PK_INDICES_BALANCO PRIMARY KEY (NOME_INDICE, MES, ANO, COD_EMPRESA);


CREATE TABLE CONTROLES_BALANCO (
    CODIGO_CTRL     INTEGER NOT NULL,
    CODSEQ_BALANCO  INTEGER NOT NULL,
    COD_EMPRESA     INTEGER NOT NULL,
    ATIVO           INTEGER DEFAULT 1
);




/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE CONTROLES_BALANCO ADD CONSTRAINT PK_CONTROLES_BALANCO PRIMARY KEY (CODIGO_CTRL, CODSEQ_BALANCO, COD_EMPRESA);


/******************************************************************************/
/****                             Foreign Keys                             ****/
/******************************************************************************/

ALTER TABLE CONTROLES_BALANCO ADD CONSTRAINT FK_CONTROLES_BALANCO_2 FOREIGN KEY (CODIGO_CTRL, COD_EMPRESA) REFERENCES CONTROLES (CODIGO_CTRL, CODIGO_EMP) ON DELETE CASCADE ON UPDATE CASCADE;



CREATE TABLE P_CONTAS_BALANCO (
    N_CONTA_PLC     T_N_GERAL NOT NULL,
    CODSEQ_BALANCO  INTEGER NOT NULL,
    COD_EMPRESA     INTEGER NOT NULL,
    ATIVO           INTEGER DEFAULT 1
);




/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE P_CONTAS_BALANCO ADD CONSTRAINT PK_P_CONTAS_BALANCO PRIMARY KEY (N_CONTA_PLC, CODSEQ_BALANCO, COD_EMPRESA);


/******************************************************************************/
/****                             Foreign Keys                             ****/
/******************************************************************************/

ALTER TABLE P_CONTAS_BALANCO ADD CONSTRAINT FK_P_CONTAS_BALANCO_2 FOREIGN KEY (N_CONTA_PLC) REFERENCES P_CONTAS (N_CONTA_PLC) ON DELETE CASCADE ON UPDATE CASCADE;



CREATE TABLE DADOS_DRE (
    COD_DRE   INTEGER NOT NULL,
    NOME_DRE  VARCHAR(40),
    ATIVO       INTEGER default 1
);




/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE DADOS_DRE ADD CONSTRAINT PK_DADOS_DRE PRIMARY KEY (COD_DRE);




ALTER TABLE GRUPOS_CT ADD COD_DRE INTEGER; /* Este código será o mesmo dos códigos do DRE exemplo: 2 - Impostos pagos na Venda, 9 - Despesas Variaveis, etc */
ALTER TABLE DEPART_CT ADD     TIPDEVDEP  VARCHAR(15), add TIPOFAT    CHAR(40)


ALTER TABLE P_CONTAS ADD TPRAT CHAR(1) DEFAULT 'N' NOT NULL; /* Se este estiver marcado para ser por venda vai ser igual a 'N'=Sem Rateio,'V' ou 'O'=Outras Contas */
ALTER TABLE P_CONTAS ADD TP_VEICULOS VARCHAR(1); /* No Plano de Contas quando o tipo Despesas o usuário poderá escolher se esta conta é para Veículo */

ALTER TABLE CONTAS_A_PAGAR ADD COD_EQUIP INTEGER; 
ALTER TABLE LANCAMENTOS ADD COD_EQUIP INTEGER;
ALTER TABLE CONTAS_A_PAGAR ADD N_CONTA_PLC_OR T_N_GERAL,ADD TPRAT CHAR(1),ADD HISTRAT VARCHAR(50); /* Se este estiver marcado para ser por venda vai ser igual a 'V' */
ALTER TABLE LANCAMENTOS ADD N_CONTA_PLC_OR T_N_GERAL,ADD TIPRAT CHAR(1),ADD HISTRAT VARCHAR(50);

ALTER TABLE EQUIPAMENTO ADD CODSEQ_BALANCO INTEGER;
ALTER TABLE EQUIPAMENTO ADD TIPEQUIP VARCHAR(1) /* E - Equipamentos,V - Veículos, F - Ferramentas, M - Móveis, I - Imóveis */


ALTER TABLE EMPRESA ADD REGIME Varchar(20) /* Lucro Real, Lucro Presumido,SuperSimples */
ALTER TABLE EMPRESA ADD CODDEPPRODUTOS INTEGER,ADD CODDEPOFICINA INTEGER,ADD CODDEPVEICULOS INTEGER; /* Para efeito de cálculo de preço de venda dos produtos com base nos depto */
ALTER TABLE EMPRESA ADD CODDEPVEICULOSUS INTEGER;
ALTER TABLE EMPRESA ADD DIAS_TRABALHO_MES INTEGER

ALTER TABLE CONTAS_A_PAGAR
ADD ENTRA_PREVISAO CHAR(1)

ALTER TABLE TIPMODELO ADD CUSTO_UNITARIO

/* :pserver;username=fabio;password=1254Ae5:fabiop@192.168.254.50:2401/fabio */
CREATE TABLE COMISSAO_CONSORCIO (
    CODSEQ_COMISSAO  INTEGER NOT NULL,
    COD_EMPRESA      INTEGER NOT NULL,
    DATA_EM_NF       TIMESTAMP NOT NULL,
    NUM_NF_COMISSAO  INTEGER NOT NULL,
    COD_CLIENTE      INTEGER,
    NOME_CLIENTE     VARCHAR(40),
    GRUPO_COTA       VARCHAR(20),
    VALOR            T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    ATIVO            INTEGER DEFAULT 1,
    TIPO_REG         CHAR(4) NOT NULL,
    COD_VENDA        INTEGER,
    DESCRICAO        VARCHAR(60),
    COD_VENDEDOR     INTEGER
);

ALTER TABLE COMISSAO_CONSORCIO ADD CONSTRAINT PK_COMISSAOCONSORCIO PRIMARY KEY (CODSEQ_COMISSAO,COD_EMPRESA);

ALTER TABLE ENT_MOTO ADD VALOR_DEV T_VL_TODOS; /* Acrescentar este campo na nf de entrada e colocar a regra para que quando for devolução, que será */
                                               /* vista a partir do cfop então o sistema exige este o preenchimento deste campo */ 


CREATE TABLE INV_BALANCO (
    CODSEQ_BALANCO  INTEGER NOT NULL,
    MES             INTEGER NOT NULL,
    ANO             INTEGER NOT NULL,
    GRUPO_PROD      INTEGER NOT NULL,
    COD_PROD        VARCHAR(17) NOT NULL,
    CHASSI_MT       CHAR(17) NOT NULL,
    COD_EMPRESA     INTEGER NOT NULL,
    QUANTIDADE      T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    VALOR_PROD      T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    OBSOLETO        VARCHAR(1),
    VERSAOV         INTEGER
);

/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE INV_BALANCO ADD CONSTRAINT PK_INV_BALANCO PRIMARY KEY (CODSEQ_BALANCO, MES, ANO, GRUPO_PROD, COD_PROD, CHASSI_MT, COD_EMPRESA);





CREATE TABLE COTACAO (
    COD_COTACAO   INTEGER NOT NULL,
    TIPOOP        VARCHAR(15) NOT NULL,
    COD_EMPRESA   INTEGER NOT NULL,
    DATA_COTACAO  TIMESTAMP,
    COD_VENDEDOR  INTEGER
);




/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE COTACAO ADD CONSTRAINT PK_COTACAO PRIMARY KEY (COD_COTACAO, TIPOOP, COD_EMPRESA);

CREATE TABLE COTACAO_ITENS (
    COD_COTACAO         INTEGER NOT NULL,
    TIPOOP              VARCHAR(15) NOT NULL,
    COD_EMPRESA         INTEGER NOT NULL,
    CODSEQ_ITEM         INTEGER NOT NULL,
    TIPODEP             INTEGER NOT NULL,
    GRUPO               INTEGER NOT NULL,
    COD_PROD            VARCHAR(20) NOT NULL,
    NUM_FAB_PROD        VARCHAR(20) NOT NULL,
    DESCR_PROD          VARCHAR(75),
    CURVA               VARCHAR(2),
    QTDE_VENDIDA        T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    QTDE_SIMULADA       T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    VALOR_MEDIO_VENDA   T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    VALOR_VENDA_SIM     T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    QTDE_EQUILIBRIO     T_N_GERAL,
    VALOR_EQUILIBRIO    T_VL_TODOS,
    CMV_PRODUTO         T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    CUSTO_FIXO_PROP     T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    CUSTO_VARIAVEL      T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    PERC_DESC           T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    DESCONTO_VALOR      T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    LUCRO_APURADO       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION DEFAULT 000000000.00 */,
    MARKUP_PRATICADO    T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    MARKUP_SIMULADO     T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    MARGEM_PRATICADA    T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    MARGEM_SIMULADA     T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    QTDE_VENDA_DIARIA   T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    VALOR_VENDA_DIARIA  T_N_GERAL /* T_N_GERAL = DOUBLE PRECISION DEFAULT 000.00 */,
    CLASS_FREQ          VARCHAR(2),
    CLASS_AT            VARCHAR(2)
);




/******************************************************************************/
/****                             Primary Keys                             ****/
/******************************************************************************/

ALTER TABLE COTACAO_ITENS ADD CONSTRAINT PK_COTACAO_ITENS PRIMARY KEY (COD_COTACAO, TIPOOP, COD_EMPRESA, CODSEQ_ITEM);


/******************************************************************************/
/****                             Foreign Keys                             ****/
/******************************************************************************/

ALTER TABLE COTACAO_ITENS ADD CONSTRAINT FK_COTACAO_ITENS_COTACAO FOREIGN KEY (COD_COTACAO, TIPOOP, COD_EMPRESA) REFERENCES COTACAO (COD_COTACAO, TIPOOP, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;







tipv
V - Varejo
A - Atacado
C - Consignado
T - Televenda
L - Aplicadores
O - Outras Empresas
P - Produção


Tipor
V  - Vendas Normais
P  - Promoções
D  - Descartes
T - Transferencia
A - Ajuste de Inventario

TIPO_OS
GARANTIA
CORTESIA
INTERNA
CLIENTE
EXTERNA



UPDATES DEPOIS DA MIGRAÇÃO PARA A TABELA PEDVENDA_PROD

UPDATE PEDVENDA_PROD SET RATEIO_ACRESC = 0 WHERE (RATEIO_ACRESC IS NULL)
UPDATE PEDVENDA_PROD SET RATEIO_DESC = 0 WHERE RATEIO_DESC is NULL
UPDATE pedvenda_serv SET RATEIO_ACRESC = 0 WHERE RATEIO_ACRESC IS NULL
UPDATE PEDVENDA_serv SET RATEIO_DESC = 0 WHERE RATEIO_DESC is NULL
update pedvenda_prod i set i.cod_vendedor =
(select p.cod_vendedor from pedvenda p where i.nped = p.nped and
i.tipo = p.tipo and i.cod_empresa = p.cod_empresa) where i.tipo = 'REQ' and i.cod_vendedor is null


observações:
 - Pensar no BI quando vários vendedores recebem comissão de um mesmo serviço
 - Olhar o campo qperf para o fluxo de caixa mudar talvez o nome para ficar melhor entendido
 - Colocar o tipo de Conta como obrigatório


CREATE PROCEDURE STRZERO (

valor integer,

QTD Integer Default 0

)

RETURNS (

RESULT Varchar(50)

)
AS
DECLARE VARIABLE i Integer;
declare variable vval varchar(50);
BEGIN

i = 0;

RESULT = rtrim(cast(:valor as varchar(50)));
vval = cast(:valor as varchar(50));
vval=rtrim(vval);

while (i < (:QTD - char_length(:vval)))do
begin

RESULT = '0' || RESULT;

i = i + 1;

end

SUSPEND;

END


CREATE VIEW CRED_JUR(
    N_CONTA_PLC,
    NOME,
    DATA_REC,
    TIPO_DOC,
    N_DOC,
    HISTORICO,
    DATA_VENC,
    VALOR,
    TERCEIRO,
    CONTROLE,
    DATA_QUITACAO,
    CODIGO_EMP,
    TIPODOC_V,
    DATA_VENDA,
    NDOC_V)
AS
select c.n_conta_plc,c.nome_c,c.data_rec_c,c.tipo_doc_c,c.n_doc_c,
       c.historico_c,c.data_venc_c,c.valor_c,c.nome_terc,c.codigo_ctrl,c.datq_c,c.codigo_emp,c.TP_DOC_V,c.DATA_VENDA,c.n_doc_v
       from controle_creditos c
union
select ch.n_conta_plc,ch.nome_ch,ch.data_rec,CAST('CHQ            ' as CHAR(15)),ch.n_ch,
       ch.historico_ch,ch.data_venc,ch.valor_ch,CAST(ch.nome_terc AS CHAR(35)),ch.codigo_ctrl,ch.datq_ch,ch.codigo_emp,ch.TP_DOC_V,ch.DATA_VENDA,ch.n_doc_v
       from controle_cheque ch
;


http://www.sebraemg.com.br/Geral/VisualizadorConteudo.aspx?cod_conteudo=4863&cod_areasuperior=5&cod_areaconteudo=868&cod_pasta=1757&navegacao=APRENDA_COM_O_SEBRAE/Quarta_Gerencial/1_Ciclo_2010_-_Maro/Abril/1+Ciclo+2010+-+Maro/Abril&__akacao=233024&__akcnt=af4e3617&__akvkey=8173&utm_source=akna&utm_medium=email&utm_campaign=Quarta+Gerencial+-+1%BA+Ciclo+2010+-+Transmiss%E3o+On+line+com+Beth+Seixas



CREATE VIEW VENDASMESES4(
    TIPO,
    GRUPO_PROD,
    COD_PROD,
    VMES,
    VANO,
    VQT,
    VTOT_VENDA,
    DATA_OS_RQ,
    NDOC,
    COD_CLIENTE,
    COD_PPS,
    SUB_G_PROD,
    DESCONTO,
    CUSTOMC,
    CUSTOMR,
    ATIVO,
    COD_EMPRESA)
AS
select p.tipo,pp.grupo_prod,pp.cod_prod,
extract(month from p.data_fech),extract(year from p.data_fech),
pp.quant_ped_item,pp.vltot_ped_item,p.data_fech,p.nped,p.cod_cliente,
pr.cod_pps, pr.sub_g_prod,pp.rateio_desc,
(pp.quant_ped_item * pp.pcust_mc),(pp.quant_ped_item * pp.pcust_mr),pp.ATIVO,p.COD_EMPRESA
from pedvenda p,pedvenda_prod pp,produtos pr where pp.nped = p.nped and pp.tipo = p.tipo
and pp.cod_empresa = p.cod_empresa and pp.grupo_prod = pr.grupo_prod and
pp.cod_prod = pr.cod_prod and pp.cod_empresa = pr.cod_empresa
and ((p.tipo = 'OS' and p.tipo_os = 'CLIENTE') or (p.tipo = 'REQ' and p.tipv <> 'C' and p.tipv <> 'E'))
and (p.status_ped <> '' or not p.status_ped is null)
and p.ativo = 1 order by 8
;

MUDANÇAS PARA CRIAR O MÓDULO PESQUISAS GERAIS....

CREATE TABLE PARAMETROS_SQL (
    COD_PARAMETRO    VARCHAR(30) NOT NULL,
    TIPO_PARAMETRO   VARCHAR(30) NOT NULL,
    CONTEUDO_PARAMETRO   VARCHAR(30) NOT NULL,
    DISPLAY_PARAMETRO  VARCHAR(30),
    ATIVO            INTEGER default 1
);
ALTER TABLE PARAMETROS_SQL ADD CONSTRAINT PK_PARAMETROS_SQL PRIMARY KEY (COD_PARAMETRO,TIPO_PARAMETRO,CONTEUDO_PARAMETRO);

COD_PARAMETRO   TIPO_PARAMETRO  CONTEUDO_PARAMETRO DISPLAY_PARAMETRO
DATA            DATE            NULL               Data Inicial:
DATA1           DATE            NULL               Data Final:
TIPOVENDA       STRING          A                  Tipo de Venda:
TIPOVENDA       STRING          V                  Tipo de Venda:
TIPOVENDA       STRING          C                  Tipo de Venda:
CODIGO          INTEGER         NULL               Código da empresa:
CODIGOTERMINAL  INTEGER         NULL               Código do Terminal:


FORMATO DOS SUMÁRIOS
CREATE TABLE FIELDSOLAP (
    COD_CONSULTA  INTEGER NOT NULL,
    NOME_CAMPO    VARCHAR(30) NOT NULL,
    SEQINT        INTEGER NOT NULL,
    COD_EMPRESA   INTEGER NOT NULL,
    TIPO_CAMPO    VARCHAR(1),
    TIPO_POS      VARCHAR(10),
    FORMATSTRING  VARCHAR(30),
    ATIVO         INTEGER default 1
);

ALTER TABLE FIELDSOLAP ADD CONSTRAINT PK_FIELDSOLAP PRIMARY KEY (COD_CONSULTA, NOME_CAMPO, SEQINT, COD_EMPRESA);

CREATE TABLE SQLCONSULTASDIV (
    COD_CONSULTA  INTEGER NOT NULL,
    COD_EMPRESA   INTEGER NOT NULL, 
    TIPOCONSULTA  VARCHAR(40),
    DESCRICAOCONS VARCHAR(40),
    CONSULTASQL   BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    ATIVO            INTEGER default 1
);
ALTER TABLE SQLCONSULTASDIV ADD CONSTRAINT PK_SQLCONSULTASDIV PRIMARY KEY (COD_CONSULTA,COD_EMPRESA);


CREATE TABLE USER_CONSULTASDIV (
    COD_CONSULTA  INTEGER NOT NULL,
    COD_EMPRESA   INTEGER NOT NULL, 
    USUARIO  VARCHAR(10) NOT NULL,
    COD_USUARIO INTEGER,
    ATIVO INTEGER default 1
);
ALTER TABLE USER_CONSULTASDIV ADD CONSTRAINT PK_USERCONSULTASDIV PRIMARY KEY (COD_CONSULTA,COD_EMPRESA,USUARIO);



select cp.data,it.codbarra,it.aliquota_it,sum(it.quantidade),
sum((it.total-(it.perc_desc+Rat_dg))+it.Rat_Acres) from 
cupom2 it,cupom cp where it.cupom = cp.cupom and it.ordem = cp.registro and 
cp.data >= :DATA and cp.data <=:DATA1 and cp.cod_terminal = :CODIGO
and cp.cod_terminal = it.cod_terminal and cp.cod_empresa = :CODIGO
and cp.cod_empresa = it.cod_empresa 
group by cp.data,it.codbarra,it.aliquota_it

// Localizador de parametros
var
 i,j,k: integer;
 vnovopar,vstr: string;
 vpar: array of string;
begin
 vstr:=IBQuery1.SQL.text;
 vstr:=StringReplace(vstr, #13, ' ', [rfReplaceAll]);
 vstr:=StringReplace(vstr, #10, ' ', [rfReplaceAll]);
 SetLength(vpar,30);
 for i:=0 to 30 do
  vpar[i]:='';
 k:=0;
 i:=0;
 vnovopar:='';
 while i <= Length(vstr) do
 begin
  if vstr[i] = ':' then
  begin
   vnovopar:='';
   for j:=i+1 to Length(vstr)-1 do
   begin
     if (vstr[j] = ' ') or (j >=Length(vstr)-1) then
     begin
       vpar[k]:=vnovopar;
       k:=k+1;
       i:=j;
       break;
     end
     else
      vnovopar:=vnovopar+vstr[j];
   end;
  end;
  i:=i+1;
 end;
end;

var
 vteste: AnsiString;
 vteste1: string;
 i: integer;

  vteste:='';
  IbTeste.Close;
  ibteste.SQL.text:='select * from sqlconsultasdiv';
  ibteste.Open;
  vteste:=IbTeste.FieldByName('consultasql').AsString;
  vteste:=StringReplace(vteste, #13, ' ', [rfReplaceAll]);
  vteste:=StringReplace(vteste, #10, ' ', [rfReplaceAll]);
  Ibrecebe.Close;
  ibrecebe.SQL.text:=vteste;
  ibrecebe.ParamByName('DATA1').Value:=strtodate('01/01/2010');
  ibrecebe.ParamByName('DATA2').Value:=strtodate('31/01/2010');
  Ibrecebe.Open;
  for i:= 0 to Ibrecebe.FieldCount-1 do
  begin
   vteste1:=Ibrecebe.Fields[i].FieldName;
   if Ibrecebe.Fields[i].DataType = ftFloat then
     showmessage('ok');
  end;




  if Crpe1.LogOnServer.Retrieve then
  begin
   // Depois olhar nos Summary...
    for cnt := 0 to (Crpe1.LogOnServer.Count - 1) do
      Crpe1.LogOnServer[cnt].Password:=vsenharel;

//   Crpe1.LogOnServer.Password:=vsenharel;
//   'masterkey';
   x:=16;
   y:=19;
   crpe1.ParamFields.Retrieve;
   for i := 0 to (Crpe1.ParamFields.Count - 1) do
   begin
    if  (pos('DATE',UPPERCASE(GetEnumName(TypeInfo(TCrParamFieldType),Ord(Crpe1.ParamFields[i].ParamType)))) > 0) and
    (pos('Pm-',(Crpe1.ParamFields[i].Name)) = 0) then
    begin
      ClassRef := TLabel;
      NewCtrl := ClassRef.Create (self);
      // hide it temporarily, to avoid flickering
      NewCtrl.Visible := False;
      // set parent and position
      NewCtrl.Parent := ScrollBox1;
      NewCtrl.Left := X;
      NewCtrl.Top := Y;
      // compute the unique name (and caption)
      MyName := ClassRef.ClassName + IntToStr (i);
      Delete (MyName, 1, 1);
      NewCtrl.Name := MyName;
      // now show it
      NewCtrl.Visible := True;
      (newctrl as TLabel).Caption:=Crpe1.ParamFields[i].Prompt;
      tamant:=160;
      //
      ClassRef := TMaskedit;
      NewCtrl := ClassRef.Create (self);
      // hide it temporarily, to avoid flickering
      NewCtrl.Visible := False;
      // set parent and position
      NewCtrl.Parent := ScrollBox1;
      //self;
      NewCtrl.Left := tamant;
      NewCtrl.Top := Y;
      // compute the unique name (and caption)
      MyName := crpe1.ParamFields[i].Name;
//      ClassRef.ClassName + IntToStr (i);
//      Delete (MyName, 1, 1);
      NewCtrl.Name := MyName;
      // now show it
      NewCtrl.Visible := True;
     (newctrl as Tmaskedit).clear;
     (newctrl as Tmaskedit).editmask:='!99/99/0000;1;_';
     y:=y+NewCtrl.Height+10;
    end
    else
    begin
//    if  pos('STRING',UPPERCASE(GetEnumName(TypeInfo(TCrParamFieldType),Ord(Crpe1.ParamFields[i].ParamType)))) > 0 then
//    begin
       if pos('Pm-',(Crpe1.ParamFields[i].Name)) > 0 then
       else
        Crpe1.ParamFields[i].RetrieveValues;
       if (Crpe1.ParamFields[i].Name <> 'NomeEmpresa') and (Crpe1.ParamFields[i].Name <> 'OutrosDados') and
       (pos('Pm-',(Crpe1.ParamFields[i].Name)) = 0) and (Crpe1.ParamFields[i].Name <> 'CodEmpresa') then
       begin
        ClassRef := TLabel;
        NewCtrl := ClassRef.Create (self);
        // hide it temporarily, to avoid flickering
        NewCtrl.Visible := False;
        // set parent and position
        NewCtrl.Parent := ScrollBox1;
  //      self;
        NewCtrl.Left := X;
        NewCtrl.Top := Y;
        // compute the unique name (and caption)
        MyName := ClassRef.ClassName + IntToStr (i);
        Delete (MyName, 1, 1);
        NewCtrl.Name := MyName;
        // now show it
        NewCtrl.Visible := True;
        (newctrl as TLabel).Caption:=Crpe1.ParamFields[i].Prompt;
        tamant:=160;
  //      x+(newctrl as TLabel).width+20;
        //
        ClassRef := TCombobox;
        NewCtrl := ClassRef.Create (self);
        // hide it temporarily, to avoid flickering
        NewCtrl.Visible := False;
        // set parent and position
        NewCtrl.Parent := ScrollBox1;
        //self;
        NewCtrl.Left := tamant;
        NewCtrl.Top := Y;
        // compute the unique name (and caption)
        MyName := crpe1.ParamFields[i].Name;
  //      ClassRef.ClassName + IntToStr (i);
  //      Delete (MyName, 1, 1);
        NewCtrl.Name := MyName;
        // now show it
        DValues := Crpe1.ParamFields.DefaultValues;
        NewCtrl.Visible := True;
        for itx := 0 to (DValues.Count - 1) do
         (newctrl as TCombobox).Items.Add(DValues[itx]);
       (newctrl as TCombobox).ItemIndex:=0;
        y:=y+NewCtrl.Height+10;
       end;
    end;
   end;
   for cnt := 0 to (Crpe1.LogOnServer.Count - 1) do
    Crpe1.LogOnServer[cnt].LogOff;
//   crpe1.LogOnServer.LogOff;
  end;
  scrollbox1.Refresh;
  For iimp := 0 to ComponentCount-1 do
  Begin
   if (Components[iimp] is Tmaskedit) then
   begin
    ActiveControl:=(Components[iimp] as TMaskedit);
    break;
   end;
   if (Components[iimp] is TCombobox) then
   begin
    ActiveControl:=(Components[iimp] as TCombobox);
    break;
   end;

  end;
  crpe1.Selection.Retrieve;
  memo1.Lines.Assign(Crpe1.Selection.Formula);

