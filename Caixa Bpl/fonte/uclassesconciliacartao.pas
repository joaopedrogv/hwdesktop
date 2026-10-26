//CONTINUAR OS TESTES DA CONCILIACAO DE CARTAO
//DEFINIR O PROCESSAMENTO E AS PASTAS SE VAI SER POR EMPRESA OU TUDO JUNTO (PROVAVELMENTE POR EMPRESA MESMO - EM PASTAS DISTINTAS)
//VER PORQUE NAO ESTA ENCONTRADO TODOS OS CREDITOS PELO CONTEUDO DO ARQUIVO ( SERA QUE É O NUMERO DO TERMINAL )
//VER AS PENDENCIAS PARA PESQUISAR TODAS UNIFICADAS

unit uclassesconciliacartao;

interface

uses
  uDataSet_OOP, Controls, FileCtrl, Gauges, StdCtrls, DBClient,forms,windows,
  DBGrids, Classes, IBQuery, Math, DB;

type
	TCieloFinanc = record
  var
    arquivo: string;
    dataArquivo: string;
    linha: string;

  	matrizPg: string;
  	estabSubmissorPg: string;
    bandeiraPg: string;
  	statusPg: string;
    origemAjuste: string;
    statusTransf: string;
    dataPg: string;
    dataEnvioBancoPg: string;
    dataVencOrigPg: string;
    numEstabPg: string;
    tipoAntecipacaoPg: string;
    numAntecipacaoPg: string;
    taxaAntecipacaoPg: Double;
    bancoPg: string;
    agenciaPg: string;
    contaPg: string;
    digitoContaPg: string;
    valorBrutoPg: Double;
    valorLiqPg: Double;

    matriz: string;
  	estabSubmissor: string;
    tipoLiquidacao: string;
    tipoTransacao: string;
    qtdParcela: Integer;
		totParcela: Integer;
    codAutorizacao: string;
    motivoRejeicao: string;
    tipoCartao: string;
    tipoLancamento: string;
    chaveUR: string;
    codTransRecContr: string;
    codAjuste: string;
    bandeira: string;
    formPag: string;
    grupoCartao: string;
    binCartao: string;
    numCartao: string;
    nsuDoc: string;
    numNota: string;
    valorBrutoVnd: Double;
    valorBrutoParc: Double;
		valorLiqVnd: Double;
    valorLiqParc: Double;
    valorBrutoLote: Double;
    valorLiqLote: Double;
		bandeiraAut: string;
    codUnicoVnd: string;
    codOrigVnd: string;
    codUnAjuste: string;
    meioCaptura: string;
    numTerminal: string;
    dataAutorizacao: string;
		dataCaptura: string;
		dataMovimento: string;
		dataMovimentoOrig: string;
    numTransProcess: string;
    dataVencOrig: string;
    numLote: string;
    banco: string;
    agencia: string;
    conta: string;
    digitoConta: string;
    pixId: string;
    pixOriginalId: string;
  end;

  TadmCartao = class(TDataSet_OOP)
   constructor create;
   function abreadmcartao: boolean;
  end;

  Tconciliacartao = class(TDataSet_OOP)
  private
    vcodtipoextrato,opcaoextrato,vcodRO,vnsuRO: string;
    vidseqbx,vcodempmult,vcodtipotrans,vtipotrans: string;
    vstatus_adm,vcodstatus_adm: string;
    vcodproduto,vdescproduto: string;
    vcodbandeira,vdescbandeira: string;
    vindantec: string;
    vcodindorajust,vindorajust: string;
    varqextrato: string;
    vccbanco,vagbanco: string;
    vcod_cred,vndoc_c,vnome_c,vcodigo_ctrl,vnome_ctrl,vseqidpend: string;
    vvalparc,vvalor_c,vvaltaxa,vvaltarifa,vperctx: currency;
    vqtdparc: integer;
    vvalvnd: currency;
    vdtprocessamento,vdtprevpag,vdtvenda: Tdate;
    datasetpend: TClientDataSet;
    vListaValoresDiferentes, vListaCreditos, vListaCreditosPagos: TStringList;
    buscasadc: TIBQuery;

    function listavmov(vautorizacao,ndoc,nparcela,numterminal: string;vtp: integer): boolean;virtual; abstract;
  protected
    fCodigoUnificada: Integer;
  public
    vLancarComissao, vLancarTarifa, vLancarAjustePositivo,vLancarAjusteNegativo: Boolean;
    constructor create;
    //    function _AbrirQuitCredito: boolean;
    procedure _AbreFormRetorno;
    function criarlistamovimento(vendextrato: string;FileListBoxtxt:TFileListBox;vGauge_HistoricoRetorno: Tgauge;lbl_statusProc: TLabel;vcheckpend: TCheckBox): boolean; virtual; abstract;
    function abredadosrelatoriobx: boolean; virtual; abstract;
    function processadadoscartao(FileListBoxtxt:TFileListBox;vGauge_HistoricoRetorno: Tgauge;lbl_statusProc: TLabel;vdbgridprocess: TDbgrid): boolean; virtual; abstract;
    function filtrodataset(vcredne,vcreden,vcredconfcv,vcrednaoconfcv,vajustes,vtodos,vpagos,venvbanco,agend,aconf: boolean): boolean; virtual; abstract;
    function marcarcredencontrado: boolean; virtual; abstract;
    function buscarpendencias(vGauge_HistoricoRetorno: Tgauge;lbl_statusProc: TLabel): boolean;
    procedure fechatudo;
    function getQtdeTransacoesVinculadas: Integer;
    function getQtdeTransacoesPagas: Integer;
    function apagapendencia: boolean;

    property codigoUnificada: Integer read fCodigoUnificada write fCodigoUnificada;
  var
    _DataInicio, _DataFim: string;
    _ValidarDatas: boolean;
    vmovcartao: TClientDataSet;
    vcod_adm: integer;
    //    vcreditos: TControleCredito;
  end;

  TconciliaCielo = Class(Tconciliacartao)
  private
//    function buscatabelas: boolean;
    Constructor create;
    function criarlistamovimento(vendextrato: string;FileListBoxtxt:TFileListBox;vGauge_HistoricoRetorno: Tgauge;lbl_statusProc:TLabel;vcheckpend: TCheckBox): boolean; override;
    function abredadosrelatoriobx: boolean; override;
    function processadadoscartao(FileListBoxtxt:TFileListBox;vGauge_HistoricoRetorno: Tgauge;lbl_statusProc: TLabel;vdbgridprocess: TDbgrid): boolean; override;
    function listavmov(vautorizacao,ndoc,nparcela,numterminal: string;vtp: integer): boolean;override;
    function filtrodataset(vcreden,vcredne, vcredconfcv,vcrednaoconfcv, vajustes,vtodos,vpagos,venvbanco,agend,aconf: boolean): boolean; override;
    function marcarcredencontrado: boolean; override;
    function buscatabelas: boolean;
  end;

  TRelatorioConciliaCartao = class(TObject)
  private
    fRel: TIBQuery;
  public
    constructor create;
    function abrePesquisaRelatorio(pDataIni, pDataFim,pOrdem: string;vtpdata: string): Boolean;
  end;

  TConciliaUnificadas = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreConciliacartaoUnificadas: boolean;
  end;

  TConciliacartaoNumEst = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreConciliacartaoNumEst: boolean;
  end;

  TConciliacartaoAdmCartao = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreConciliacartaoAdmCartao: boolean;
  end;

  TConciliacartaoBandeira = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreConciliacartaoBandeira: boolean;
  end;

  TConciliaCartaoAdquirente = class(TDataSet_OOP)
  private
  public
  	function ProcessarArquivo: boolean; virtual; abstract;
  end;

  TConciliaCartaoAdquirenteCielo = class(TConciliaCartaoAdquirente)
  private
  public
  	constructor create;
    function ProcessarArquivo: boolean;
    function InserirRegistroFinanceiro: boolean;
  var
  	vCieloFinanc: TCieloFinanc;
  end;

  TCreditosConfere = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreCreditos(pCodCred: Integer; pCodEmpresa: Integer): boolean;
  end;

  TCreditosPendDataConfere = class(TDataSet_OOP)
  private
  public
  	constructor create;
  	function abreCreditos(pTempSqlData: string; pTempSql: string): boolean;
  var
  	vSQL, vUltSQL: string;
  	vTotCredPendData: Double;
  end;

  TCreditosPendConfere = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreCreditos(pTempSqlData: string; pTempSql: string): boolean;
    function localizarCreditos(pNSU: string;
      pNumAutorizacao: string;
      pValorCred: Double;
      pValorLiq: Double;
      pNumParc: Integer): boolean;
    function vincularCreditos(
    	pId: Integer;
      pNumParc: Integer;
      pQtdeParc: Integer;
      pCodEmpresa: Integer;
      pValorBruto: Double;
      pValorLiq: Double;
      pNSU: string;
      pNumAutorizacao: string): boolean;
  var
  	vSQL, vUltSQL: string;
  	vTotCredAbertos: Double;
  end;

  TResolverPendenciasConfere = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreConsultaResolverPendencias(pDataIni: TDateTime; pDataFim: TDateTime; pTempSql: string): boolean;
  var
  	vSQL, vUltSQL: string;
  end;

  TconciliacartaoConfereAdm = class(TDataSet_OOP)
  private
  public
  	destructor Destroy; override;
  	constructor create;
    function abreConsultaFinanceiroAdm(pDataIni, pDataFim: TDateTime; pTempSql: string): boolean;
    procedure somarSelecionados;
  var
  	vSQL, vUltSQL: string;
    vunificadasConcCartao: TConciliaUnificadas;
    vnumestConcCartao: TConciliacartaoNumEst;
  	vadmcartaoConcCartao: TConciliacartaoAdmCartao;
    vbandeiraConcCartao: TConciliacartaoBandeira;
  end;

  TconciliacartaoConfere = class(TDataSet_OOP)
  private
  public
  	vLancarComissao, vLancarTarifa, vLancarAjustePositivo,vLancarAjusteNegativo: Boolean;
  	destructor Destroy; override;
		constructor create;
    function retornaDataConsultaFinanc(pCodEmpresa: Integer): string;
    function atualizarDataConsultaFinanc(pCodEmpresa: Integer): string;
    procedure _AbreFormRetorno(pTipoForm: Integer = 0; pPendencias: boolean = false);
    function abreConsultaFinanceiro(pDataIni, pDataFim: TDateTime; pTempSql: string; pMemo: TMemo): boolean;
    function confirmarConciliacao(Gauge_HistoricoRetorno: TGauge): boolean;
    function montarDatasetAjuste(pMemo: TMemo): boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
    procedure somarSelecionados;
  var
    vSQL, vUltSQL: string;
  	vunificadasConcCartao: TConciliaUnificadas;
    vnumestConcCartao: TConciliacartaoNumEst;
  	vadmcartaoConcCartao: TConciliacartaoAdmCartao;
    vbandeiraConcCartao: TConciliacartaoBandeira;
  	vcreditosConcCartao: TCreditosConfere;
    vmovcartaoConcCartao: TClientDataSet;

    vTotVendasBruto, vTotVendasLiq: Double;
    vTotVendasBrutoAdm, vTotVendasLiqAdm: Double;
    vTotVendasBrutoQuit, vTotVendasLiqQuit: Double;

    vTotAjustesPositivoBruto, vTotAjustesPositivoLiq: Double;
    vTotAjustesPositivoBrutoAdm, vTotAjustesPositivoLiqAdm: Double;
    vTotAjustesPositivoBrutoQuit, vTotAjustesPositivoLiqQuit: Double;

    vTotAjustesNegativoBruto, vTotAjustesNegativoLiq: Double;
    vTotAjustesNegativoBrutoAdm, vTotAjustesNegativoLiqAdm: Double;
    vTotAjustesNegativoBrutoQuit, vTotAjustesNegativoLiqQuit: Double;

    vTotCancelamentosBruto, vTotCancelamentosLiq: Double;
    vTotCancelamentosBrutoAdm, vTotCancelamentosLiqAdm: Double;
    vTotCancelamentosBrutoQuit, vTotCancelamentosLiqQuit: Double;

    vTotChargeBackBruto, vTotChargeBackLiq: Double;
    vTotChargeBackBrutoAdm, vTotChargeBackLiqAdm: Double;
    vTotChargeBackBrutoQuit, vTotChargeBackLiqQuit: Double;

    vTotAntecipacoesBruto, vTotAntecipacoesLiq: Double;
    vTotAntecipacoesBrutoAdm, vTotAntecipacoesLiqAdm: Double;
    vTotAntecipacoesBrutoQuit, vTotAntecipacoesLiqQuit: Double;

    vTotTarifaBruto, vTotTarifaLiq: Double;
    vTotTarifaBrutoQuit, vTotTarifaLiqQuit: Double;

    vTotComissoesBruto, vTotComissoesLiq: Double;
    vTotComissoesBrutoQuit, vTotComissoesLiqQuit: Double;

    vTotCred: Double;
  end;

  TconciliacartaoRecConfere = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreConsultaFinanceiroRec(
    	pconciliacartaoConfere: TconciliacartaoConfere;
    	pDataIni: TDateTime; pDataFim: TDateTime; pTempSql: string): boolean;
  var
  	vSQL, vUltSQL: string;
    vTotFinancRec: Double;
  end;

  TPendenciasConfere = class(TDataSet_OOP)
  private
  public
  	destructor Destroy; override;
		constructor create;
    function abreConsultaPendencias(pDataIni: TDateTime; pDataFim: TDateTime; pTempSql: string): boolean;
    function localizarPendencias(
    	pNSU: string;
      pNumAutorizacao: string;
      pValorCred: Double;
  		pValorLiq: Double;
      pNumParc: Integer): boolean;
    function resolverPendencias(pDataset: TDataset): boolean;
    procedure marcarTodos;
    procedure desmarcarTodos;
    procedure marcaDesmarcaLinha;
    procedure marcarTodosTemp(pDataset: TDataset);
    procedure desmarcarTodosTemp(pDataset: TDataset);
    procedure marcaDesmarcaLinhaTemp(pDataset: TDataset);
    function excluir: boolean;
    function vincularCreditos: boolean;
  var
  	vSQL, vUltSQL: string;
  	vunificadasConcCartao: TConciliaUnificadas;
    vnumestConcCartao: TConciliacartaoNumEst;
  	vadmcartaoConcCartao: TConciliacartaoAdmCartao;
    vbandeiraConcCartao: TConciliacartaoBandeira;
    vcreditosPendConcCartao: TCreditosPendConfere;
    vcreditosPendDataConcCartao: TCreditosPendDataConfere;
    fTempPendConcCartao: TClientDataSet;
    fTempPendConcCartaoDtSource: TDataSource;
  var
  	vTotPendConfere: Double;
  end;

implementation

uses
  uDtmContasAReceber, UConciliaCartao, UConciliacaoCartaoConfere, SysUtils, uDtmAtivo, Variants,
  Dialogs, uDadosIni, IBDatabase, uClassesContasAReceber,uClassesContasAPagar, hw_utils, 
  AccCtrl;

{ Tconciliacartao }

function Tconciliacartao.apagapendencia: boolean;
begin
 if not vmovcartao.IsEmpty then
 begin
   if vmovcartao.FieldByName('SEQID').AsInteger <> 0 then
   begin
     if not vDadosIni.PesqPros('IMPFIN030', 'EXCLUIR', Trim(cadadmcartao.dataSet.FieldByName('DESCRICAO_ADM').AsString)+' NSU RO ADM: '+
     vmovcartao.FieldByName('NSU_RO_ADM').AsString,'PENDENCIA_CARTAO',
     vmovcartao.FieldByName('NUM_DOC_ADM').AsString+'/'+vmovcartao.FieldByName('N_AUT_CART_CRED').AsString, buscas, False) then
      Exit;

     datasetpend.Close;
     datasetpend.CommandText:= ' select * from pendencias_cartao ' +
     		' where SEQID = ' + vmovcartao.FieldByName('SEQID').AsString +
        ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
         	IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);

  //   datasetpend.CommandText:='select * from pendencias_cartao where '+
  //   'NSU_RO_ADM = '''+vmovcartao.FieldByName('NSU_RO_ADM').AsString+''' and '+
  //   'RO_ADM = '+vmovcartao.FieldByName('RO_ADM').AsString+' and nparcela = '+
  //   vmovcartao.FieldByName('NPARCELA').AsString+' and status_adm = '+
  //   vmovcartao.FieldByName('STATUS_ADM').AsString+' and cod_empresa = '+vDadosIni.codEmpresa;
     datasetpend.Open;
     if not datasetpend.IsEmpty then
     begin
       datasetpend.Delete;
       datasetpend.ApplyUpdates(-1);
       vmovcartao.delete;
       CommitaTransacao;
     end;
   end
   else
    Application.MessageBox('Documento selecionado não é pendencia', 'Atenção', MB_ICONERROR + MB_OK);
 end
 else
  Application.MessageBox('Sem registro', 'Atenção', MB_ICONERROR + MB_OK);
end;

function Tconciliacartao.buscarpendencias(vGauge_HistoricoRetorno: Tgauge;lbl_statusProc: TLabel): boolean;
var
 vregind,vtreg,i: integer;
 vJaExisteAlteracaoNoRegistro: Boolean;
begin
	try
     result:=false;
     try
       datasetpend.Close;
       datasetpend.CommandText:= ' select * from pendencias_cartao ' +
          ' where COD_ADM = ' + inttostr(vcod_adm) +
          ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) +
          ' order by SEQID'; // a pendencia vai ficar na unificadora, e quando selecionar a unficada vai encontrar
       datasetpend.Open;
       vtreg:=datasetpend.RecordCount;
       vregind:=0;
       while not datasetpend.eof do
       begin
        vregind:=vregind+1;
        Application.ProcessMessages;
        lbl_statusProc.Caption:='Buscando pendências anteriores: '+datasetpend.FieldByName('N_AUT_CART_CRED').AsString+'/'+
        datasetpend.FieldByName('NUM_DOC_ADM').AsString+'-'+datasetpend.FieldByName('NOME_C').AsString;
        vGauge_HistoricoRetorno.Progress:=trunc((vregind/vtreg)*100);

        vcodempmult:=datasetpend.FieldByName('COD_EMP_MULT').AsString;
        vcodtipotrans:=datasetpend.FieldByName('COD_TIPOTRANS').AsString;
        vtipotrans:=datasetpend.FieldByName('TIPO_TRANSACAO').AsString;
        vcodtipoextrato:=datasetpend.FieldByName('COD_TIPOEXTRATO').AsString;
        opcaoextrato:=datasetpend.FieldByName('TIPOEXTRATO').AsString;
        opcaoextrato:=datasetpend.FieldByName('TIPOEXTRATO').AsString;
        vndoc_c:=datasetpend.FieldByName('NUM_DOC_CRED').AsString;
        vnome_c:=datasetpend.FieldByName('NOME_C').AsString;
        vcodstatus_adm:=datasetpend.FieldByName('STATUS_ADM').AsString;
        vstatus_adm:=datasetpend.FieldByName('DESC_STATUS_ADM').AsString;
        vnsuRO:=datasetpend.FieldByName('NSU_RO_ADM').AsString;
        vcodRO:=datasetpend.FieldByName('RO_ADM').AsString;
        vcodproduto:=datasetpend.FieldByName('TIPO_PROD_ADM').AsString;
        vdescproduto:=datasetpend.FieldByName('DESC_TIPO_PROD_ADM').AsString;
        vcodbandeira:=datasetpend.FieldByName('COD_BANDEIRA_ADM').AsString;
        vdescbandeira:=datasetpend.FieldByName('DESC_BANDEIRA').AsString;
        vindantec:=datasetpend.FieldByName('IND_ANTEC_RO_ADM').AsString;
        vcodindorajust:=datasetpend.FieldByName('IND_OR_AJUSTE_ADM').AsString;
        vindorajust:=datasetpend.FieldByName('IND_OR_DESC_AJUSTE').AsString;
        varqextrato:=datasetpend.FieldByName('ARQ_EXTRATO_ADM').AsString;
        vcod_cred:='0';
        vcodigo_ctrl:=datasetpend.FieldByName('CODIGO_CTRL').AsString;
        vnome_ctrl:=datasetpend.FieldByName('NOME_CTRL').AsString;
        vagbanco:=datasetpend.FieldByName('AGENCIA_CTRL').AsString;
        vccbanco:=datasetpend.FieldByName('N_CONTA_CTRL').AsString;
        vvalparc:=datasetpend.FieldByName('VALORPARCELA').AsCurrency;
        vvalor_c:=datasetpend.FieldByName('VALOR_C').AsCurrency;
        vvaltaxa:=datasetpend.FieldByName('TAXA_CARTAO_CRED').AsCurrency;
        vperctx:=datasetpend.FieldByName('PERCTXCARTAO').AsCurrency;
        vvaltarifa:=datasetpend.FieldByName('TARIFA_CARTAO').AsCurrency;
        vdtprevpag:=datasetpend.FieldByName('DATA_PREV_PAG').AsDateTime;
        vdtprocessamento:=datasetpend.FieldByName('DTPROCESSAMENTO').AsDateTime;
        vcod_adm:=datasetpend.FieldByName('COD_ADM').AsInteger;
        vseqidpend:=datasetpend.FieldByName('seqid').AsString;
        vdtvenda:=datasetpend.FieldByName('DTVENDA').AsDateTime;
  //      if datasetpend.FieldByName('N_AUT_CART_CRED').AsString = '078750' then
  //        showmessage('OK');
        // está faltando testar aqui os cancelamentos pois falta gravar na pendencia se é aceleração...

        try
          vmovcartao.Filter := 'RO_ADM = ' + datasetpend.FieldByName('RO_ADM').AsString +
            ' and NSU_RO_ADM = ' + QuotedStr(datasetpend.FieldByName('NSU_RO_ADM').AsString) +
            ' and NPARCELA = ' + IntToStr(datasetpend.FieldByName('NPARCELA').AsInteger);
          vmovcartao.Filtered := True;
          vJaExisteAlteracaoNoRegistro := Trim(datasetpend.FieldByName('NSU_RO_ADM').AsString) = Trim(vmovcartao.FieldByName('NSU_RO_ADM').AsString);
        finally
          vmovcartao.Filtered := False;
          vmovcartao.Filter := '';
        end;

        if (vcodtipotrans = '1') and (not vJaExisteAlteracaoNoRegistro) then
        begin
          buscasadc.close;
          buscasadc.sql.text:= ' select * from controle_creditos ' +
            ' where RO_ADM =  ' + datasetpend.FieldByName('RO_ADM').AsString +
            ' and NSU_RO_ADM = ''' + datasetpend.FieldByName('NSU_RO_ADM').AsString + ''' ' +
            ' and COALESCE(NPARCELA,01) = ' + datasetpend.FieldByName('NPARCELA').AsString +
            ' and COD_ADM = ' + datasetpend.FieldByName('COD_ADM').AsString +
            ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
              IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) +
            ' and COALESCE(IND_OR_AJUSTE_ADM,0) <> 17' ;
          buscasadc.open;
          if not buscasadc.IsEmpty then
          begin
           while not buscasadc.eof do
           begin
            if (Self is TconciliaCielo) then
            (self as TconciliaCielo).listavmov(datasetpend.FieldByName('N_AUT_CART_CRED').AsString,
            datasetpend.FieldByName('NUM_DOC_ADM').AsString,
            datasetpend.FieldByName('NPARCELA').AsString,datasetpend.FieldByName('COD_TERMINAL_ADM').AsString,1);
          //  listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
            buscasadc.next;
           end;
           end
          else
            if (Self is TconciliaCielo) then
            (self as TconciliaCielo).listavmov(datasetpend.FieldByName('N_AUT_CART_CRED').AsString,
            datasetpend.FieldByName('NUM_DOC_ADM').AsString,
            datasetpend.FieldByName('NPARCELA').AsString,datasetpend.FieldByName('COD_TERMINAL_ADM').AsString,1);
        end
        else if not vJaExisteAlteracaoNoRegistro then
         if (Self is TconciliaCielo) then
          (self as TconciliaCielo).listavmov(datasetpend.FieldByName('N_AUT_CART_CRED').AsString,
          datasetpend.FieldByName('NUM_DOC_ADM').AsString,
          datasetpend.FieldByName('NPARCELA').AsString,datasetpend.FieldByName('COD_TERMINAL_ADM').AsString,2);

  //        listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
        {vmovcartao.Insert;
        for I := 0 to vmovcartao.Fields.Count - 1 do
    //        if dataSet.Fields[i].FieldKind = fkData then
          vmovcartao.FieldByName(vmovcartao.Fields[i].FieldName).Value :=
          datasetpend.FieldByName(vmovcartao.Fields[i].FieldName).Value;
        vmovcartao.Post;}
        datasetpend.Next;
       end;
       Result:=true;
     finally
      vGauge_HistoricoRetorno.Progress:=0;
     end;
  except
  	on e: exception do
    begin
    	Application.MessageBox(pchar('Erro ao buscar pendências cartões. Erro: ' + e.Message),
      	'Erro', MB_ICONERROR + MB_OK);
      registraErro('Erro ao buscar pendências cartões. TconciliaCielo.buscarpendencias: ' + e.Message);
      result := false;
    end;
  end;
end;

constructor Tconciliacartao.create;
begin
  vmovcartao:=TClientDataSet(dtmContasAReceber.CdslistaExtCartao);
  buscas:=TIBQuery(dtmContasAReceber.qrBuscas);
  buscasadc:=TIBQuery(dtmContasAReceber.Qrbuscas1);
  dataSet:=TClientDataSet(dtmContasAReceber.cdsCtrlCrCartao);
  datasetpend:=TClientDataSet(dtmContasAReceber.CdsPendencias_adm);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  vListaValoresDiferentes := TStringList.Create;
  vListaCreditos := TStringList.Create;
  vListaCreditosPagos := TStringList.Create;
end;



procedure Tconciliacartao.fechatudo;
begin
  vmovcartao.EmptyDataSet;
  datasetpend.close;
end;

function Tconciliacartao.getQtdeTransacoesPagas: Integer;
begin
  Result := vListaCreditosPagos.Count;
end;

function Tconciliacartao.getQtdeTransacoesVinculadas: Integer;
begin
  Result := vListaCreditos.Count;
//  vListaCreditos.SaveToFile('C:\Projeto_Fiscal40\bpl\creditos.txt');
//  vListaCreditosPagos.SaveToFile('C:\Projeto_Fiscal40\bpl\creditospagos.txt');
end;

procedure Tconciliacartao._AbreFormRetorno;
begin
//  if (vDadosIni.vEmp.vQuitarBoletoPeloSistema <> 'S') then
//  begin
//    Application.MessageBox('Configure no cadastro da empresa a opção para quitar boletos pelo sistema.',
//      'Atenção', 0 + 64);
//    Exit;
//  end;
//
//  if dtmImportPDVFinan = nil then
//    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);
  if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);
  Application.CreateForm(TFrmConciliaCartao, FrmConciliaCartao);
  FrmConciliaCartao.ShowModal;
end;

{ TconciliaCielo }

function TconciliaCielo.abredadosrelatoriobx: boolean;
begin

end;

function TconciliaCielo.buscatabelas: boolean;
begin
  buscas.close;
  buscas.sql.Text:= ' SELECT * FROM OCORRENCIA_ADM ' +
  	' WHERE TIPO_TABELA_ADM = ''TABELAII'' AND IDTABELA_ADM = ' + vcodtipotrans;
  buscas.open;
  vtipotrans:=buscas.FieldByName('DESC_OCORR_ADM').AsString;
  buscas.close;
  buscas.sql.Text:= ' SELECT * FROM OCORRENCIA_ADM ' +
  	' WHERE TIPO_TABELA_ADM = ''TABELAIII'' AND IDTABELA_ADM = '+vcodstatus_adm;
  buscas.open;
  vstatus_adm:=buscas.FieldByName('DESC_OCORR_ADM').AsString;
  buscas.close;
  buscas.sql.Text:= ' SELECT * FROM OCORRENCIA_ADM ' +
  	' WHERE TIPO_TABELA_ADM = ''TABELAIV'' AND IDTABELA_ADM = '+vcodproduto;
  buscas.open;
  vdescproduto:=buscas.FieldByName('DESC_OCORR_ADM').AsString;
  buscas.close;
  buscas.sql.Text:= ' SELECT * FROM OCORRENCIA_ADM ' +
  	' WHERE TIPO_TABELA_ADM = ''TABELAVI'' AND IDTABELA_ADM = '+vcodbandeira;
  buscas.open;
  vdescbandeira:=buscas.FieldByName('DESC_OCORR_ADM').AsString;
  if trim(vcodindorajust) <> '' then
  begin
    buscas.close;
    buscas.sql.Text:= ' SELECT * FROM OCORRENCIA_ADM ' +
    	' WHERE TIPO_TABELA_ADM = ''TABELAV'' AND IDTABELA_ADM = '+vcodindorajust;
    buscas.open;
    vindorajust:=buscas.FieldByName('DESC_OCORR_ADM').AsString;
  end
  else
  begin
   vcodindorajust:='0';
   vindorajust:='';
  end;
end;

constructor TconciliaCielo.create;
begin
  inherited;
end;

function TconciliaCielo.criarlistamovimento(vendextrato: string;FileListBoxtxt:TFileListBox;vGauge_HistoricoRetorno: Tgauge;lbl_statusProc: TLabel;vcheckpend: TCheckBox): boolean;
var
// FileListBoxtxt: TFileListBox;
 i,vqtparcvnd,ix: integer;
 F,F1: TextFile;
 S,S1: string;
 vautorizacao,ndoc,nparcela,numterminal: string;
 vnumROant: string;
 vnomearq: string;
// vdataatual: Tdate;
begin
	try
    Result := false;
    if not vmovcartao.Active then
    begin
     vmovcartao.CreateDataSet;
     vmovcartao.Tag:=1;
    end;
    vmovcartao.DisableControls;
    vmovcartao.EmptyDataSet;
    vListaValoresDiferentes.Duplicates := dupIgnore;
    vListaValoresDiferentes.Clear;

    vListaCreditos.Sorted := True;
    vListaCreditos.Duplicates := dupIgnore;
    vListaCreditos.Clear;

    vListaCreditosPagos.Sorted := True;
    vListaCreditosPagos.Duplicates := dupIgnore;
    vListaCreditosPagos.Clear;
    try
  //    vdataatual:=vDadosIni.getDataBanco(buscas);
    //  FileListBoxtxt:=TFileListBox.Create(Application);
      if not DirectoryExists(vendextrato) then
        CreateDir(vendextrato);

      if not DirectoryExists(vendextrato) then
      begin
        Application.MessageBox(PChar('Erro ao criar diretório: ' + vendextrato),
          'Erro', MB_ICONERROR + MB_OK);
        registraErro('Erro ao criar diretório: ' + vendextrato);
        Result := false;
        exit;
      end;

      if not DirectoryExists(vendextrato + '\PROCESSADOS') then
        CreateDir(vendextrato+'\PROCESSADOS');

      if not DirectoryExists(vendextrato + '\PROCESSADOS') then
      begin
        Application.MessageBox(PChar('Erro ao criar diretório: ' + vendextrato + '\PROCESSADOS'),
          'Erro', MB_ICONERROR + MB_OK);
        registraErro('Erro ao criar diretório: ' + vendextrato + '\PROCESSADOS');
        Result := false;
        exit;
      end;
  //    FileListBoxtxt.Directory :=vendextrato+'\PROCESSADOS';
  //    FileListBoxtxt.Refresh;
      FileListBoxtxt.Directory :=vendextrato;
      FileListBoxtxt.Update;
      vGauge_HistoricoRetorno.Visible:=true;
      lbl_statusProc.Visible:=true;
      if vcheckpend.Checked then
       buscarpendencias(vGauge_HistoricoRetorno,lbl_statusProc);
      vidseqbx:='0';
      vseqidpend:='0';
      for i := 0 to FileListBoxtxt.Items.Count - 1 do
      begin
        Application.ProcessMessages;
        lbl_statusProc.Caption:='Lendo: '+vDadosIni.StrZero(i+1,5)+'/'+
        vDadosIni.StrZero(FileListBoxtxt.Items.Count,5)+' Arquivo: '+FileListBoxtxt.Items.Strings[i];
        vGauge_HistoricoRetorno.Progress:=trunc((i/FileListBoxtxt.Items.Count)*100);
        vnomearq:=FileListBoxtxt.Items.Strings[i];
    //    if vnomearq = 'EXTVISA06081300.RET' then
    //      showmessage('OK');
        AssignFile(F, vnomearq);
        Reset(F);
        Readln(F, S);
        vcodtipoextrato:=Copy(S,48,2);
        vdtprocessamento:=StrToDate(copy(S,18,2)+'/'+copy(S,16,2)+'/'+copy(S,12,4));
        buscas.close;
        buscas.sql.Text:= ' SELECT * FROM OCORRENCIA_ADM ' +
          ' WHERE TIPO_TABELA_ADM = ''TABELAI'' AND IDTABELA_ADM = ' + vcodtipoextrato;
        buscas.open;
        opcaoextrato:=buscas.FieldByName('DESC_OCORR_ADM').AsString;
        if (vcodtipoextrato = '01') or (vcodtipoextrato = '03') then
        begin
         vnumROant:='';

         while not System.eof(F) do
         begin
          Application.ProcessMessages;
          Readln(F, S);
          if copy(S,1,1) = '1' then
          begin
            vcodempmult:=IntToStr(fCodigoUnificada);
            vcodtipotrans:=copy(S,24,2);
            vcodstatus_adm:=copy(S,123,2);
            if vdtprocessamento >= strtodate('10/11/2013') then
              vcodproduto:=copy(S,233,3)
            else
              vcodproduto:=copy(S,131,2);
            vcodbandeira:=copy(S,185,3);
            vcodindorajust:=copy(S,146,2);
            vdtprevpag:=strtodate(copy(S,36,2)+'/'+copy(S,34,2)+'/'+copy(S,32,2));
            buscatabelas;
            vindantec:=copy(S,161,1);
            if trim(vindantec) = '' then
              vindantec:='Não antecipado';
            if trim(vindantec) = 'A' then
              vindantec:='Antecipado na Cielo - ARV';
            if trim(vindantec) = 'C' then
              vindantec:='Antecipado no Banco - Cessão de Recebíveis';
            varqextrato:=FileListBoxtxt.Items.Strings[i];
            vccbanco:=trim(copy(S,109,14));
            vagbanco:=trim(copy(S,104,5));
            vcodRO:=copy(S,12,7);
            vnsuRO:=copy(S,188,15);
  //          if vnsuRO = '143265010005192' then
  //           showmessage(vnomearq);
            vvalparc:=strtocurr(copy(S,44,12)+','+copy(S,56,2));
            vvaltaxa:=strtocurr(copy(S,58,12)+','+copy(S,70,2));
            vperctx:=strtocurr(copy(S,210,2)+','+copy(S,212,2));
            vvaltarifa:=strtocurr(copy(S,214,3)+','+copy(S,217,2));
            if (vcodtipotrans = '01') then
            begin
              if (trim(copy(s,19,2)) <> '') and (copy(s,19,2) = '01') then
              begin
                AssignFile(F1, FileListBoxtxt.Items.Strings[i]);
                Reset(F1);
                vautorizacao:='';
                ndoc:='';
                nparcela:='01';
                numterminal:='';
                while not System.eof(F1) do
                begin
                  Application.ProcessMessages;
                  Readln(F1,S1);
                  if (copy(S1,1,1) = '2') and (copy(S1,189,15) = vnsuRO) then
                  begin
                      try
                       vqtparcvnd:=strtoint(copy(S1,62,2));
                      except
                       vqtparcvnd:=1;
                      end;
                      vqtdparc:=vqtparcvnd;
                      vautorizacao:=copy(S1,67,6);
                      ndoc:=copy(S1,93,6);
                      nparcela:=copy(S1,60,2);
                      numterminal:=copy(S1,153,8);
                      vvalparc:=strtocurr(copy(S1,46,12)+','+copy(S1,58,2));
                      vdtvenda:=strtodate(copy(S1,44,2)+'/'+copy(S1,42,2)+'/'+copy(S1,38,4));
                      for ix := 1 to vqtparcvnd do
                      begin
                       nparcela:=vDadosIni.StrZero(ix,2);
                       listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
                      end;
                    // pega informações da venda e pesquisa no banco para colocar na tabela temporária
  //                   break;
                  end;
                end;
                CloseFile(F1);
                vnumROant:=vcodRO;
              end
              else
              begin
                if trim(copy(s,19,2)) = '' then
                begin
                  AssignFile(F1, FileListBoxtxt.Items.Strings[i]);
                  Reset(F1);
                  vautorizacao:='';
                  ndoc:='';
                  nparcela:='01';
                  vqtdparc:=1;
                  numterminal:='';
                  while not System.eof(F1) do
                  begin
                    Readln(F1,S1);
                    if (copy(S1,1,1) = '2') and (copy(S1,189,15) = vnsuRO) then
                    begin
                       vautorizacao:=copy(S1,67,6);
                       ndoc:=copy(S1,93,6);
                       nparcela:='01';
                       vvalparc:=strtocurr(copy(S1,46,12)+','+copy(S1,58,2));
                       //copy(S1,60,2);
                       numterminal:=copy(S1,153,8);
                       vdtvenda:=strtodate(copy(S1,44,2)+'/'+copy(S1,42,2)+'/'+copy(S1,38,4));
                       listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
  //                     break; //
                    end;
                  end;
                  CloseFile(F1);
                end
                else
                begin
                 if (copy(S,12,7) = vcodRO) and (copy(S,19,2) <> '01') then
                 begin
                    // colocar as datas de vencimentos para as parcelas do lote em questão
                    nparcela:=copy(s,19,2);
                    if vmovcartao.Locate('NPARCELA;NSU_RO_ADM', VarArrayOf([nparcela,vnsuRO]), []) then
                    begin
                      vmovcartao.Edit;
                      vmovcartao.FieldByName('DATA_PREV_PAG').AsDateTime:=vdtprevpag;
  //                    vmovcartao.FieldByName('TAXA_CARTAO_CRED').AsCurrency:=(-1)*((vperctx/100)*vvalor_c);
  //                    vmovcartao.FieldByName('PERCTXCARTAO').AsCurrency:=vperctx;
  //                    vmovcartao.FieldByName('TARIFA_CARTAO').AsCurrency:=vvaltarifa;
                      vmovcartao.post;
                    end;
  //                  vvalparc:=strtocurr(copy(S1,46,12)+','+copy(S1,58,2));
  //                  listavmov(vautorizacao,ndoc,nparcela,numterminal);
                 end;
                end;
              end;
            end
            else
            begin
             if (vcodtipotrans = '03') then // Pode ser cancelamento de vendas
             begin
              if trim(copy(s,19,2)) = '' then
              begin
                AssignFile(F1, FileListBoxtxt.Items.Strings[i]);
                Reset(F1);
                vautorizacao:='';
                ndoc:='';
                nparcela:='01';
                vqtdparc:=1;
                numterminal:='';
                while not System.eof(F1) do
                begin
                  Readln(F1,S1);
                  if (copy(S1,1,1) = '2') and (copy(S1,189,15) = vnsuRO) then
                  begin
                     vautorizacao:=copy(S1,67,6);
                     ndoc:=copy(S1,93,6);
                     buscasadc.close;
                     buscasadc.sql.text:= ' select nparcela from controle_creditos ' +
                      ' where N_AUT_CART = ''' + vautorizacao + ''' ' +
                      //' and N_DOCNSU_ADM = ''' + ndoc + ''' ' +
                      ' and (SELECT RESULT FROM RETIRAR_ZERO_ESQUERDA(N_DOCNSU_ADM)) = ' + QuotedStr(TrimLeftC(ndoc, '0')) +
                      ' and COD_ADM = ' + IntToStr(vcod_adm)+
                      ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
                        IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
                     buscasadc.open;
                     while not buscasadc.eof do
                     begin
                      nparcela:=buscasadc.FieldByName('NPARCELA').AsString;
                      vvalparc:=strtocurr(copy(S1,46,12)+','+copy(S1,58,2));
                      numterminal:=copy(S1,153,8);
                      vdtvenda:=strtodate(copy(S1,44,2)+'/'+copy(S1,42,2)+'/'+copy(S1,38,4));
                      listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
                      buscasadc.next;
                     end;
                     buscasadc.close;
                  end;
                end;
                CloseFile(F1);
              end
              else
              begin
               if (copy(S,12,7) = vcodRO) and (copy(S,19,2) <> '01') then
               begin
                  // colocar as datas de vencimentos para as parcelas do lote em questão
                  nparcela:=copy(s,19,2);
                  if vmovcartao.Locate('NPARCELA;NSU_RO_ADM', VarArrayOf([nparcela,vnsuRO]), []) then
                  begin
                    vmovcartao.Edit;
                    vmovcartao.FieldByName('DATA_PREV_PAG').AsDateTime:=vdtprevpag;
  //                    vmovcartao.FieldByName('TAXA_CARTAO_CRED').AsCurrency:=(-1)*((vperctx/100)*vvalor_c);
  //                    vmovcartao.FieldByName('PERCTXCARTAO').AsCurrency:=vperctx;
  //                    vmovcartao.FieldByName('TARIFA_CARTAO').AsCurrency:=vvaltarifa;
                    vmovcartao.post;
                  end;
  //                  vvalparc:=strtocurr(copy(S1,46,12)+','+copy(S1,58,2));
  //                  listavmov(vautorizacao,ndoc,nparcela,numterminal);
               end;
              end;
             end
             else
             begin
              buscasadc.close;
              vautorizacao:='';
              ndoc:='';
              nparcela:='01';
              numterminal:='';
              vqtdparc:=1;
              listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
             end;
            end;
          end;

         end;
        end;
        if (vcodtipoextrato = '04') or (vcodtipoextrato = '05') then
        begin
         while not System.eof(F) do
         begin
          Readln(F, S);
          if copy(S,1,1) = '1' then
          begin
            vcodempmult:=IntToStr(fCodigoUnificada);
            vcodtipotrans:=copy(S,24,2);
            vcodstatus_adm:=copy(S,123,2);
            if vdtprocessamento >= strtodate('10/11/2013') then
              vcodproduto:=copy(S,233,3)
            else
             vcodproduto:=copy(S,131,2);
            vcodbandeira:=copy(S,185,3);
            vcodindorajust:=copy(S,146,2);
            vindantec:=copy(S,161,1);
            vdtprevpag:=strtodate(copy(S,36,2)+'/'+copy(S,34,2)+'/'+copy(S,32,2));
            buscatabelas;
            if trim(vindantec) = '' then
              vindantec:='Não antecipado';
            if trim(vindantec) = 'A' then
              vindantec:='Antecipado na Cielo - ARV';
            if trim(vindantec) = 'C' then
              vindantec:='Antecipado no Banco - Cessão de Recebíveis';
    //        vindorajust:='';
            varqextrato:=FileListBoxtxt.Items.Strings[i];
            vccbanco:=trim(copy(S,109,14));
            vagbanco:=trim(copy(S,104,5));
            vcodRO:=copy(S,12,7);
            vnsuRO:=copy(S,188,15);
  //          if vnsuRO = '133185110004025' then
  //          if vnsuRO = '142745150003447' then
  //            showmessage(vnomearq+'  05');
  //          if vnsuRO = '143265010005192' then
  //           showmessage(vnomearq);

            vvalparc:=strtocurr(copy(S,44,12)+','+copy(S,56,2));
            vvaltaxa:=strtocurr(copy(S,58,12)+','+copy(S,70,2));
            vperctx:=strtocurr(copy(S,210,2)+','+copy(S,212,2));
            vvaltarifa:=strtocurr(copy(S,214,3)+','+copy(S,217,2));
            if (vcodtipotrans = '01') then
            begin
              if copy(s,139,1) <> 'A' then // <> Aceleração
              begin
                nparcela:=copy(s,19,2);
                vautorizacao:='';
                ndoc:='';
                numterminal:=copy(S,225,8);
                if trim(nparcela) = '' then
                nparcela:='01';

                buscasadc.close;
                buscasadc.sql.text:= ' select * from controle_creditos ' +
                  ' where RO_ADM = ' + vcodRO +
                  ' and NSU_RO_ADM = ''' + vnsuRO + ''' ' +
                  ' and COALESCE(NPARCELA,01) = ' + nparcela +
                  ' and COD_ADM = ' + IntToStr(vcod_adm) +
                  ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
                    IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) +
                  ' and COALESCE(IND_OR_AJUSTE_ADM,0) <> 17 ';
                buscasadc.open;
                if not buscasadc.IsEmpty then
                begin
                 while not buscasadc.eof do
                 begin
                  listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
                  buscasadc.next;
                 end;
                end
                else
                 listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
                buscasadc.close;
              end;
            end
            else
            begin
             if (vcodtipotrans = '03') then // Pode ser cancelamento de vendas
             begin
              if trim(copy(s,19,2)) = '' then
              begin
                AssignFile(F1, FileListBoxtxt.Items.Strings[i]);
                Reset(F1);
                vautorizacao:='';
                ndoc:='';
                nparcela:='01';
                vqtdparc:=1;
                numterminal:='';
                while not System.eof(F1) do
                begin
                  Readln(F1,S1);
                  if (copy(S1,1,1) = '2') and (copy(S1,189,15) = vnsuRO) then
                  begin

                     vautorizacao:=copy(S1,67,6);
                     ndoc:=copy(S1,93,6);
                     buscasadc.close;
                     buscasadc.sql.text:= ' select * from controle_creditos ' +
                       ' where N_AUT_CART = ''' + vautorizacao + ''' ' +
                       //' and N_DOCNSU_ADM = ''' + ndoc + ''' ' +
                       ' and (SELECT RESULT FROM RETIRAR_ZERO_ESQUERDA(N_DOCNSU_ADM)) = ' + QuotedStr(TrimLeftC(ndoc, '0')) +
                       ' and COD_ADM = ' + IntToStr(vcod_adm) +
                       ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
                        IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) ;
                     buscasadc.open;
                     while not buscasadc.eof do
                     begin
                      nparcela:=buscasadc.FieldByName('NPARCELA').AsString;
                      vvalparc:=strtocurr(copy(S1,46,12)+','+copy(S1,58,2));
                      numterminal:=copy(S1,153,8);
                      vdtvenda:=strtodate(copy(S1,44,2)+'/'+copy(S1,42,2)+'/'+copy(S1,38,4));
                      listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
                      buscasadc.next;
                     end;
                     buscasadc.close;
                  end;
                end;
                CloseFile(F1);
              end
              else
              begin
               if (copy(S,12,7) = vcodRO) and (copy(S,19,2) <> '01') then
               begin
                  // colocar as datas de vencimentos para as parcelas do lote em questão
                  nparcela:='01';
                  if vmovcartao.Locate('NPARCELA;NSU_RO_ADM', VarArrayOf([nparcela,vnsuRO]), []) then
                  begin
                    vmovcartao.Edit;
                    vmovcartao.FieldByName('DATA_PREV_PAG').AsDateTime:=vdtprevpag;
  //                    vmovcartao.FieldByName('TAXA_CARTAO_CRED').AsCurrency:=(-1)*((vperctx/100)*vvalor_c);
  //                    vmovcartao.FieldByName('PERCTXCARTAO').AsCurrency:=vperctx;
  //                    vmovcartao.FieldByName('TARIFA_CARTAO').AsCurrency:=vvaltarifa;
                    vmovcartao.post;
                  end;
  //                  vvalparc:=strtocurr(copy(S1,46,12)+','+copy(S1,58,2));
  //                  listavmov(vautorizacao,ndoc,nparcela,numterminal);
               end;
              end;
             end
             else
             begin
              buscasadc.close;
              vautorizacao:='';
              ndoc:='';
              nparcela:='01';
              numterminal:='';
              vqtdparc:=1;
              listavmov(vautorizacao,ndoc,nparcela,numterminal,1);
             end;
            end;
          end
          else
          begin
            // Colocar a consulta de CV que foram cancelados por meio de ajustes

          end;
         end;
        end;
        CloseFile(F);
      end;
      if vListaValoresDiferentes.Count > 0 then
        Application.MessageBox(pchar('Foram encontrados créditos com valores divergentes dos valores contidos no Extrato' + #13 +
          vListaValoresDiferentes.Text), 'Atenção', 0 + 64)
      else
        Application.MessageBox('Busca de informações concluída', 'Atenção', 0 + 64);
      Result := true;
    finally
      vmovcartao.EnableControls;
      vGauge_HistoricoRetorno.Visible:=false;
      lbl_statusProc.Visible:=False;
    end;
  except
  	on e: exception do
    begin
    	Application.MessageBox(pchar('Erro ao buscar informações do movimento de cartões. Erro: ' + e.Message + ' Arquivo: ' + vnomearq),
      	'Erro', MB_ICONERROR + MB_OK);
      registraErro('Erro ao buscar informações do movimento de cartões. TconciliaCielo.criarlistamovimento: ' + e.Message + ' Arquivo: ' + vnomearq);
      result := false;
    end;
  end;
end;


function TconciliaCielo.filtrodataset(vcreden,vcredne, vcredconfcv,
  vcrednaoconfcv, vajustes,vtodos,vpagos,venvbanco,agend,aconf: boolean): boolean;
var
  vadicfiltro: string;
begin
  vmovcartao.Filtered:=false;
  vmovcartao.Filter:='';
  if vtodos then
    exit;
  if vcredne then
   vmovcartao.Filter:=vmovcartao.Filter+'STATUS_PROC = ''CRED. NAO ENCONTRADO'' ';

  if vcreden then
  begin
   if vmovcartao.Filter = '' then
    vmovcartao.Filter:=vmovcartao.Filter+'(STATUS_PROC = ''CRED. ENCONTRADO'') '
   else
    vmovcartao.Filter:=vmovcartao.Filter+' OR (STATUS_PROC = ''CRED. ENCONTRADO'') ';
  end;
  if vcredconfcv then
  begin
   if vmovcartao.Filter = '' then
    vmovcartao.Filter:=vmovcartao.Filter+' ((COD_TIPOEXTRATO = 1 OR COD_TIPOEXTRATO = 3) AND COD_TIPOTRANS = 1 AND COD_CRED <> 0) '
   else
    vmovcartao.Filter:=vmovcartao.Filter+' OR ((COD_TIPOEXTRATO = 1 OR COD_TIPOEXTRATO = 3) AND COD_TIPOTRANS = 1 AND COD_CRED <> 0) ';
  end;
  if vcrednaoconfcv then
  begin
   if vmovcartao.Filter = '' then
    vmovcartao.Filter:=vmovcartao.Filter+' ((COD_TIPOEXTRATO = 1 OR COD_TIPOEXTRATO = 3) AND COD_TIPOTRANS = 1 AND COD_CRED = 0) '
   else
    vmovcartao.Filter:=vmovcartao.Filter+' OR ((COD_TIPOEXTRATO = 1 OR COD_TIPOEXTRATO = 3) AND COD_TIPOTRANS = 1 AND COD_CRED = 0) ';
  end;
  if vajustes then
  begin
   if vmovcartao.Filter = '' then
    vmovcartao.Filter:=vmovcartao.Filter+' (COD_TIPOTRANS = 2 OR COD_TIPOTRANS = 3 OR COD_TIPOTRANS = 4) '
   else
    vmovcartao.Filter:=vmovcartao.Filter+' OR (COD_TIPOTRANS = 2 OR COD_TIPOTRANS = 3 OR COD_TIPOTRANS = 4) ';
  end;
  if (vpagos) or (venvbanco) or (agend) or (aconf) then
  begin
   vadicfiltro:='';
   if vpagos then
   begin
     if vadicfiltro = '' then
      vadicfiltro:=' (STATUS_ADM = 1) '
     else
     begin
        vadicfiltro:=vadicfiltro+' (STATUS_ADM = 1) ';
     end;
   end;
   if venvbanco then
   begin
     if vadicfiltro = '' then
       vadicfiltro:=' (STATUS_ADM = 2) '
     else
      vadicfiltro:=vadicfiltro+' OR (STATUS_ADM = 2) ';
   end;
   if agend then
   begin
     if vadicfiltro = '' then
       vadicfiltro:=' (STATUS_ADM = 0) '
     else
     vadicfiltro:=vadicfiltro+' OR (STATUS_ADM = 0) ';
   end;
   if aconf then
   begin
     if vadicfiltro = '' then
       vadicfiltro:=' (STATUS_ADM = 3) '
     else
      vadicfiltro:=vadicfiltro+' OR (STATUS_ADM = 3) ';
   end;
   vmovcartao.Filter:='('+vmovcartao.Filter+')';
   vadicfiltro:=' AND ('+vadicfiltro+')';
   vmovcartao.Filter:=vmovcartao.Filter+vadicfiltro;
  end;
  vmovcartao.Filtered:=true;
end;

function TconciliaCielo.listavmov(vautorizacao, ndoc, nparcela,
  numterminal: string;vtp: integer): boolean;
var
  vstatus_c: string;
  vsinal: integer;

begin
  try
    vcod_cred:='0';
    vndoc_c:='';
    vvalor_c:=0;
    vnome_c:='';
    vcodigo_ctrl:='0';
    vnome_ctrl:='';
    vstatus_c := '';
    vvalvnd:=0;
    if trim(vcodindorajust) = '' then
      vcodindorajust:='0';
    if trim(nparcela) = '' then
      nparcela:='01';
    if (vDadosIni.StrZero(vcodtipoextrato,2) = '04') or (vDadosIni.StrZero(vcodtipoextrato,2) = '05') then
    begin
      if vtp = 2 then
      begin
      	buscasadc.close;
        buscasadc.sql.text:= ' select * from controle_creditos ' +
          ' where RO_ADM = ' + vcodRO +
          ' and NSU_RO_ADM = ''' + vnsuRO + ''' ' +
          ' and COALESCE(NPARCELA,01) = ' + nparcela +
          ' and COD_ADM = ' + IntToStr(vcod_adm)+
          ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) ;
       	buscasadc.open;
      end;
      if not buscasadc.isempty then
      begin
        vListaCreditos.Add(IntToStr(buscasadc.FieldByName('COD_CRED').AsInteger));
        if (vcodstatus_adm = '01') then
          vListaCreditosPagos.Add(IntToStr(buscasadc.FieldByName('COD_CRED').AsInteger));
        vcod_cred:=buscasadc.FieldByName('COD_CRED').AsString;
        vndoc_c:=buscasadc.FieldByName('n_doc_c').AsString;
        vnome_c:=buscasadc.FieldByName('nome_c').AsString;
        vvalor_c:=buscasadc.FieldByName('valor_c').AsCurrency;
        vautorizacao:=buscasadc.FieldByName('N_AUT_CART').AsString;
        ndoc:=buscasadc.FieldByName('N_DOCNSU_ADM').AsString;
        nparcela:=buscasadc.FieldByName('NPARCELA').AsString;
        numterminal:=buscasadc.FieldByName('COD_TERMINAL_ADM').AsString;
        vindorajust:=buscasadc.FieldByName('IND_OR_DESC_AJUSTE').AsString;
        vcodindorajust:=buscasadc.FieldByName('IND_OR_AJUSTE_ADM').AsString;
        vstatus_c := Trim(buscasadc.FieldByName('status_c').AsString);


        vvalparc:=vvalor_c;
        if Trim(buscasadc.FieldByName('status_c').AsString) <> 'QUITADO' then
          if buscasadc.FieldByName('IDBAIXA_CARTAO').AsString = '' then
            vidseqbx:='0'
          else
            vidseqbx:=buscasadc.FieldByName('IDBAIXA_CARTAO').AsString;
        if (vcodstatus_adm = '01') and (Trim(buscasadc.FieldByName('status_c').AsString) <> 'QUITADO') and
          (vDadosIni.StrToFloatFormat(vvalparc,2) <> vDadosIni.StrToFloatFormat(buscasadc.FieldByName('valor_c').AsFloat,2)) then
          vListaValoresDiferentes.Add(
            vDadosIni.StrZero(vcod_cred,7) + ' - ' +
            Trim(vndoc_c) + ' - ' +
            'Credito: ' + Format('%0.2f',[buscasadc.FieldByName('valor_c').AsFloat]) + ' - ' +
            'Extrato: ' + Format('%0.2f',[vvalparc])
            );
        vvalvnd:=buscasadc.FieldByName('VL_VENDA').ascurrency;
        vqtdparc:=buscasadc.FieldByName('QTDE_PARC').asinteger;
        if buscasadc.FieldByName('VL_VENDA').AsCurrency <= 0 then
        begin
         buscas.close;
         buscas.sql.text:= ' select sum(valor_c) as vlvenda, count(nparcela) as qtdeparc from controle_creditos ' +
         		' where N_AUT_CART = ''' + vautorizacao + ''' ' +
         		//' and N_DOCNSU_ADM = ''' + ndoc + ''' ' +
            ' and (SELECT RESULT FROM RETIRAR_ZERO_ESQUERDA(N_DOCNSU_ADM)) = ' + QuotedStr(TrimLeftC(ndoc, '0')) +
            ' and COD_ADM = ' + IntToStr(vcod_adm) +
         		' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
            	IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
         buscas.open;
         vvalvnd:=buscas.FieldByName('VLVENDA').AsCurrency;
         vqtdparc:=buscas.FieldByName('qtdeparc').AsInteger;
        end;
      end;
    end;
    if (vDadosIni.StrZero(vcodtipoextrato,2) = '01') or (vDadosIni.StrZero(vcodtipoextrato,2) = '03') then
    begin
     if (vDadosIni.StrZero(vcodtipotrans,2) = '01') or (vDadosIni.StrZero(vcodtipotrans,2) = '03') then
     begin
       buscas.close;
       buscas.sql.text:= ' select * from controle_creditos ' +
       		' where N_AUT_CART = ''' + vautorizacao + ''' ' +
       		//' and N_DOCNSU_ADM = ''' + ndoc + ''' ' +
          ' and (SELECT RESULT FROM RETIRAR_ZERO_ESQUERDA(N_DOCNSU_ADM)) = ' + QuotedStr(TrimLeftC(ndoc, '0')) +
          ' and COALESCE(NPARCELA,01) = ' + nparcela +
          ' and COD_ADM = ' + IntToStr(vcod_adm) +
       		' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
          	IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
       buscas.open;
       if not buscas.isempty then
       begin
        vListaCreditos.Add(IntToStr(buscas.FieldByName('COD_CRED').AsInteger));
        if (vcodstatus_adm = '01') then
          vListaCreditosPagos.Add(IntToStr(buscas.FieldByName('COD_CRED').AsInteger));
        vcod_cred:=buscas.FieldByName('COD_CRED').AsString;
        vndoc_c:=buscas.FieldByName('n_doc_c').AsString;
        vnome_c:=buscas.FieldByName('nome_c').AsString;
        vvalor_c:=buscas.FieldByName('valor_c').AsCurrency;
        vstatus_c := Trim(buscas.FieldByName('status_c').AsString);
        if Trim(buscas.FieldByName('status_c').AsString) <> 'QUITADO' then
          if buscas.FieldByName('IDBAIXA_CARTAO').AsString = '' then
            vidseqbx:='0'
          else
            vidseqbx:=buscas.FieldByName('IDBAIXA_CARTAO').AsString;
        if (vcodstatus_adm = '01') and (Trim(buscas.FieldByName('status_c').AsString) <> 'QUITADO') and
          (vDadosIni.StrToFloatFormat(vvalparc,2) <> vDadosIni.StrToFloatFormat(buscas.FieldByName('valor_c').AsFloat,2)) then
          vListaValoresDiferentes.Add(
            vDadosIni.StrZero(vcod_cred,7) + ' - ' +
            vndoc_c + ' - ' +
            'Credito: ' + Format('%0.2f',[buscas.FieldByName('valor_c').AsFloat]) + ' - ' +
            'Extrato: ' + Format('%0.2f',[vvalparc])
            );
            //
            buscas.close;
            buscas.sql.text:= ' select sum(valor_c) as vlvenda from controle_creditos ' +
            	' where N_AUT_CART = ''' + vautorizacao + ''' ' +
            	//' and N_DOCNSU_ADM = ''' + ndoc + ''' ' +
              ' and (SELECT RESULT FROM RETIRAR_ZERO_ESQUERDA(N_DOCNSU_ADM)) = ' + QuotedStr(TrimLeftC(ndoc, '0')) +
              ' and COD_ADM = ' + IntToStr(vcod_adm)+
            	' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
              	IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
            buscas.open;
            vvalvnd:=buscas.FieldByName('vlvenda').ascurrency;
       end;
     end
     else
     begin
       // Olhar aqui os ajustes de devolução
     (*  if vDadosIni.StrZero(vcodtipotrans,2) = '03' then
       begin

       end;*)
     end;
    end;
    //
    buscas.close;
    buscas.sql.text:='select codigo_ctrl,nome_ctrl from controles ' +
    	' where N_CONTA_CTRL = ''' + vccbanco + ''' ' +
      ' and AGENCIA_CTRL = ''' + vagbanco + ''' ' +
      ' and CODIGO_EMP = ' + vDadosIni.codEmpresa +
      ' and ATIVO = 1 ';
    buscas.open;
    if not buscas.isempty then
    begin
      vcodigo_ctrl:=buscas.FieldByName('CODIGO_CTRL').AsString;
      vnome_ctrl:=buscas.FieldByName('NOME_CTRL').AsString;
    end;
//    ndoc := ndoc + ' ';
    if trim(nparcela) = '' then
      nparcela := '0';
    if not vmovcartao.Locate('NUM_DOC_ADM;N_AUT_CART_CRED;NPARCELA;STATUS_ADM;COD_TIPOEXTRATO;NSU_RO_ADM;COD_TIPOTRANS;COD_EMP_MULT', VarArrayOf([ndoc,vautorizacao,nparcela,vcodstatus_adm,vcodtipoextrato,vnsuRO,vcodtipotrans,vcodempmult]), []) then
    begin
      vmovcartao.Append;
      vmovcartao.FieldByName('COD_EMP_MULT').AsString:=vcodempmult;
      vmovcartao.FieldByName('COD_TIPOTRANS').AsString:=vcodtipotrans;
      vmovcartao.FieldByName('TIPO_TRANSACAO').AsString:=vtipotrans;
      vmovcartao.FieldByName('COD_TIPOEXTRATO').AsString:=vcodtipoextrato;
      vmovcartao.FieldByName('TIPOEXTRATO').AsString:=opcaoextrato;
      vmovcartao.FieldByName('TIPOEXTRATO').AsString:=opcaoextrato;
      if vDadosIni.StrZero(vcodtipotrans,2) = '01' then
      begin
        if vstatus_c = 'QUITADO' then
          vmovcartao.FieldByName('STATUS_PROC').AsString:='CRED. JA QUITADO'
        else if vcod_cred = '0' then
          vmovcartao.FieldByName('STATUS_PROC').AsString:='CRED. NAO ENCONTRADO'
        else
          vmovcartao.FieldByName('STATUS_PROC').AsString:='CRED. ENCONTRADO';
      end;
      vmovcartao.FieldByName('NUM_DOC_ADM').AsString:=ndoc;
      vmovcartao.FieldByName('NUM_DOC_CRED').AsString:=vndoc_c;
      vmovcartao.FieldByName('N_AUT_CART_CRED').AsString:=vautorizacao;
      vmovcartao.FieldByName('COD_TERMINAL_ADM').AsString:=numterminal;
      vmovcartao.FieldByName('NPARCELA').AsString:=nparcela;
      vmovcartao.FieldByName('NOME_C').AsString:=vnome_c;
      vmovcartao.FieldByName('STATUS_ADM').AsString:=vcodstatus_adm;
      vmovcartao.FieldByName('DESC_STATUS_ADM').AsString:=vstatus_adm;
      //vmovcartao.FieldByName('DESC_STATUS_ADM').AsString:=vstatus_adm;
      vmovcartao.FieldByName('NSU_RO_ADM').AsString:=vnsuRO;
      vmovcartao.FieldByName('RO_ADM').AsString:=vcodRO;
      vmovcartao.FieldByName('TIPO_PROD_ADM').AsString:=vcodproduto;
      vmovcartao.FieldByName('DESC_TIPO_PROD_ADM').AsString:=vdescproduto;
      vmovcartao.FieldByName('COD_BANDEIRA_ADM').AsString:=vcodbandeira;
      vmovcartao.FieldByName('DESC_BANDEIRA').AsString:=vdescbandeira;
      vmovcartao.FieldByName('IND_ANTEC_RO_ADM').AsString:=vindantec;
      vmovcartao.FieldByName('IND_OR_AJUSTE_ADM').AsString:=vcodindorajust;
      vmovcartao.FieldByName('IND_OR_DESC_AJUSTE').AsString:=vindorajust;
      vmovcartao.FieldByName('ARQ_EXTRATO_ADM').AsString:=varqextrato;
      vmovcartao.FieldByName('COD_CRED').AsString:=vcod_cred;
      vmovcartao.FieldByName('CODIGO_CTRL').AsString:=vcodigo_ctrl;
      vmovcartao.FieldByName('NOME_CTRL').AsString:=vnome_ctrl;
      vmovcartao.FieldByName('AGENCIA_CTRL').AsString:=vagbanco;
      vmovcartao.FieldByName('N_CONTA_CTRL').AsString:=vccbanco;

      if (vDadosIni.StrZero(vcodtipotrans,2) = '03') then
       vsinal:=-1
      else
       vsinal:=1;
      if strtoint(nparcela) = 1 then
       vmovcartao.FieldByName('VALORPARCELA').AsCurrency:=vvalparc*vsinal
      else
       vmovcartao.FieldByName('VALORPARCELA').AsCurrency:=vvalor_c*vsinal;

      vmovcartao.FieldByName('VALOR_C').AsCurrency:=vvalor_c;
      vmovcartao.FieldByName('TAXA_CARTAO_CRED').AsCurrency:=(-1)*((vperctx/100)*vvalor_c);
      vmovcartao.FieldByName('PERCTXCARTAO').AsCurrency:=vperctx;
      vmovcartao.FieldByName('TARIFA_CARTAO').AsCurrency:=vvaltarifa;
      vmovcartao.FieldByName('DATA_PREV_PAG').AsDateTime:=vdtprevpag;
      vmovcartao.FieldByName('DTPROCESSAMENTO').AsDateTime:=vdtprocessamento;
      vmovcartao.FieldByName('IDBAIXA_CARTAO').AsInteger:=0;
      vmovcartao.FieldByName('COD_ADM').AsInteger:=vcod_adm;
      vmovcartao.FieldByName('DTVENDA').AsDateTime:=vdtvenda;
      vmovcartao.FieldByName('SEQID').AsString:=vseqidpend;
      vmovcartao.FieldByName('QTDE_PARC').AsInteger:=vqtdparc;
      vmovcartao.FieldByName('VL_VENDA').AsCurrency:=vvalvnd;
      vmovcartao.post;
      marcarcredencontrado;
    end;
    result:=true;
  Except
  on e: exception do
  begin
    vmovcartao.Cancel;
    result := false;
    if Application.MessageBox(pchar(vMensagemErro + #13 +
      'Nenhuma crédito será processado. Mostrar Erro?'), 'Confirmação', MB_YESNO +
      MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
      ShowMessage(e.Message);
  end;
  end;
end;


function TconciliaCielo.marcarcredencontrado: boolean;
begin
     if (vmovcartao.FieldByName('IND_OR_AJUSTE_ADM').AsInteger = 0) or (vmovcartao.FieldByName('COD_TIPOTRANS').asinteger = 3)  then
     begin
       if (vmovcartao.FieldByName('COD_CRED').AsInteger <> 0) and (vmovcartao.FieldByName('STATUS_PROC').AsString <> 'CRED. JA QUITADO') then
       begin
        montaSelect('select * from controle_creditos ' +
        	' where COD_CRED = ' + vmovcartao.FieldByName('COD_CRED').AsString +
          ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
	         	IntToStr(fCodigoUnificada), vDadosIni.codEmpresa));
        if not dataset.IsEmpty then
        begin
         if (Trim(dataSet.FieldByName('datq_C').AsString) <> '') then
           raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
           ' já esta quitado. Data: ' + dataSet.FieldByName('datq_C').AsString, '');
         if (dataSet.FieldByName('STATUS_CXL_RQ').AsString = 'R') then
            if (dataSet.FieldByName('op_cxl').AsInteger > 0) then
              raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
                ' já esta sendo recebido ou modificado pelo Caixa Auxiliar' +
                ' pelo usuário de código: ' + dataSet.FieldByName('op_cxl').AsString, '')
            else
              raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
                ' está marcado que esta sendo recebido ou modificado pelo Caixa Auxiliar', '');
         if (dataSet.FieldByName('STATUS_CX').AsString = 'R') then
           if (dataSet.FieldByName('op_cx').AsInteger > 0) then
             raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
               ' já esta sendo recebido ou modificado pelo Financeiro' +
               ' pelo usuário de código: ' + dataSet.FieldByName('op_cx').AsString, '')
           else
             raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
               ' está marcado que esta sendo recebido ou modificado pelo Financeiro', '');

         dataSet.edit;
         dataSet.FieldByName('N_DOCNSU_ADM').AsString:=vmovcartao.FieldByName('NUM_DOC_ADM').AsString;
         dataSet.FieldByName('STATUS_ADM').AsInteger:=vmovcartao.FieldByName('STATUS_ADM').AsInteger;
         dataSet.FieldByName('DESC_STATUS_ADM').AsString:=vmovcartao.FieldByName('DESC_STATUS_ADM').AsString;
         dataSet.FieldByName('NSU_RO_ADM').AsString:=vmovcartao.FieldByName('NSU_RO_ADM').AsString;
         dataSet.FieldByName('RO_ADM').AsInteger:=vmovcartao.FieldByName('RO_ADM').AsInteger;
         dataSet.FieldByName('COD_TERMINAL_ADM').AsString:=vmovcartao.FieldByName('COD_TERMINAL_ADM').AsString;
         dataSet.FieldByName('TIPO_PROD_ADM').AsInteger:=vmovcartao.FieldByName('TIPO_PROD_ADM').AsInteger;
         dataSet.FieldByName('DESC_TIPO_PROD_ADM').AsString:=vmovcartao.FieldByName('DESC_TIPO_PROD_ADM').AsString;
         dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger:=vmovcartao.FieldByName('COD_BANDEIRA_ADM').AsInteger;
         dataSet.FieldByName('DESC_BANDEIRA').AsString:=vmovcartao.FieldByName('DESC_BANDEIRA').AsString;
         dataSet.FieldByName('IND_ANTEC_RO_ADM').AsString:=vmovcartao.FieldByName('IND_ANTEC_RO_ADM').AsString;
         dataSet.FieldByName('IND_OR_AJUSTE_ADM').AsInteger:=vmovcartao.FieldByName('IND_OR_AJUSTE_ADM').AsInteger;
         dataSet.FieldByName('IND_OR_DESC_AJUSTE').AsString:=vmovcartao.FieldByName('IND_OR_DESC_AJUSTE').AsString;
         dataSet.FieldByName('ARQ_EXTRATO_ADM').AsString:=vmovcartao.FieldByName('ARQ_EXTRATO_ADM').AsString;
         dataSet.FieldByName('TAXA_CARTAO_CRED').AsCurrency:=vmovcartao.FieldByName('TAXA_CARTAO_CRED').AsCurrency;
         dataSet.FieldByName('TARIFA_CARTAO_CRED').AsCurrency:=vmovcartao.FieldByName('TARIFA_CARTAO').AsCurrency;
         dataset.FieldByName('CODIGO_CTRL_CRED').AsInteger:=vmovcartao.FieldByName('CODIGO_CTRL').AsInteger;
         dataset.FieldByName('COD_ADM').AsInteger:=vmovcartao.FieldByName('COD_ADM').AsInteger;
         dataset.FieldByName('QTDE_PARC').AsInteger:=vmovcartao.FieldByName('QTDE_PARC').AsInteger;
         dataset.FieldByName('VL_VENDA').AsCurrency:=vmovcartao.FieldByName('VL_VENDA').AsCurrency;

         dataset.Post;
         Apply;
         // Retirando da pendência se for o caso
         buscas.Close;
         buscas.SQL.Text := ' delete from pendencias_cartao ' +
         	 ' where NSU_RO_ADM = ''' + vmovcartao.FieldByName('NSU_RO_ADM').AsString + ''' ' +
           ' and RO_ADM = ' + vmovcartao.FieldByName('RO_ADM').AsString +
           ' and NPARCELA = ' + vmovcartao.FieldByName('NPARCELA').AsString +
           ' and STATUS_ADM = ' + vmovcartao.FieldByName('STATUS_ADM').AsString +
           ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
		       	IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
         buscas.ExecSQL;
//         datasetpend.Close;
//         datasetpend.CommandText:='select * from pendencias_cartao where '+
//         'NSU_RO_ADM = '''+vmovcartao.FieldByName('NSU_RO_ADM').AsString+''' and '+
//         'RO_ADM = '+vmovcartao.FieldByName('RO_ADM').AsString+' and nparcela = '+
//         vmovcartao.FieldByName('NPARCELA').AsString+' and status_adm = '+
//         vmovcartao.FieldByName('STATUS_ADM').AsString+' and cod_empresa = '+vDadosIni.codEmpresa;
//         datasetpend.Open;
//         if not datasetpend.IsEmpty then
//         begin
//           datasetpend.Delete;
//           datasetpend.ApplyUpdates(-1);
//         end;
        end;
       end
     end;
end;

function TconciliaCielo.processadadoscartao(FileListBoxtxt:TFileListBox;vGauge_HistoricoRetorno: Tgauge;lbl_statusProc: TLabel;vdbgridprocess: TDbgrid): boolean;
var
 vlote,vtreg,vregind,i: integer;
 vContaExiste, vContaAtivo, vContaEhCheque,vCTP_Edit_Insert: Boolean;

 procedure gerarLote;
 begin
   buscas.Close;
   buscas.SQL.Text := ' SELECT GEN_ID(INC_LOTE_IDBXCARTAO, 1) lote FROM rdb$Database';
   buscas.Open;
   vlote:=buscas.fieldbyname('lote').Asinteger;
 end;

begin
  try
    if not vDadosIni.PesqPros('IMPFIN028', 'PROCESSAR', Trim(cadadmcartao.dataSet.FieldByName('DESCRICAO_ADM').AsString), '', '', buscas, False) then
      Exit;

    if vListaValoresDiferentes.Count > 0 then
    begin
      Application.MessageBox(pchar('Foram encontrados créditos com valores divergentes dos valores contidos no Extrato' + #13 +
          vListaValoresDiferentes.Text), 'Atenção', 0 + 64);
      if not vDadosIni.PesqPros('IMPFIN029', 'VALIDAR', Trim(cadadmcartao.dataSet.FieldByName('DESCRICAO_ADM').AsString), '', '', buscas, False) then
        Exit;
      if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
    end;

    IniciaTransacao;
    vlote:=0;
    vGauge_HistoricoRetorno.Visible:=true;
    vGauge_HistoricoRetorno.Progress:=0;
    lbl_statusProc.Visible:=true;
    vmovcartao.Filtered:=false;
    vmovcartao.First;
    vtreg:=vmovcartao.RecordCount;
    vregind:=0;
    vmovcartao.DisableControls;
    while not vmovcartao.eof do
    begin
     vregind:=vregind+1;
     Application.ProcessMessages;
     lbl_statusProc.Caption:='Registrando dados controle crédito: '+vmovcartao.FieldByName('N_AUT_CART_CRED').AsString+'/'+
     vmovcartao.FieldByName('NUM_DOC_CRED').AsString+'-'+vmovcartao.FieldByName('NOME_C').AsString;
     vGauge_HistoricoRetorno.Progress:=trunc((vregind/vtreg)*100);
//     if vmovcartao.FieldByName('COD_CRED').AsInteger = 171636 then
     //vmovcartao.FieldByName('N_AUT_CART_CRED').AsString = '160392' then
//       showmessage('OK');
     if (vmovcartao.FieldByName('IND_OR_AJUSTE_ADM').AsInteger = 0) or (vmovcartao.FieldByName('COD_TIPOTRANS').asinteger = 3)  then
     begin
       if (vmovcartao.FieldByName('COD_CRED').AsInteger <> 0) and (vmovcartao.FieldByName('STATUS_PROC').AsString <> 'CRED. JA QUITADO') then
       begin
        montaSelect('select * from controle_creditos ' +
        	' where COD_CRED = ' + vmovcartao.FieldByName('COD_CRED').AsString+
          ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
	         	IntToStr(fCodigoUnificada), vDadosIni.codEmpresa));
        if not dataset.IsEmpty then
        begin
         if (Trim(dataSet.FieldByName('datq_C').AsString) <> '') then
           raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
           ' já esta quitado. Data: ' + dataSet.FieldByName('datq_C').AsString, '');
         if (dataSet.FieldByName('STATUS_CXL_RQ').AsString = 'R') then
            if (dataSet.FieldByName('op_cxl').AsInteger > 0) then
              raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
                ' já esta sendo recebido ou modificado pelo Caixa Auxiliar' +
                ' pelo usuário de código: ' + dataSet.FieldByName('op_cxl').AsString, '')
            else
              raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
                ' está marcado que esta sendo recebido ou modificado pelo Caixa Auxiliar', '');
         if (dataSet.FieldByName('STATUS_CX').AsString = 'R') then
           if (dataSet.FieldByName('op_cx').AsInteger > 0) then
             raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
               ' já esta sendo recebido ou modificado pelo Financeiro' +
               ' pelo usuário de código: ' + dataSet.FieldByName('op_cx').AsString, '')
           else
             raiseExceptionCreate('Documento ' + Trim(dataset.FieldByName('n_doc_c').AsString) +
               ' está marcado que esta sendo recebido ou modificado pelo Financeiro', '');

         dataSet.edit;
         dataSet.FieldByName('N_DOCNSU_ADM').AsString:=vmovcartao.FieldByName('NUM_DOC_ADM').AsString;
         if (dataSet.FieldByName('STATUS_ADM').AsInteger <> 1) then
         begin
         dataSet.FieldByName('STATUS_ADM').AsInteger:=vmovcartao.FieldByName('STATUS_ADM').AsInteger;
         dataSet.FieldByName('DESC_STATUS_ADM').AsString:=vmovcartao.FieldByName('DESC_STATUS_ADM').AsString;
         end;
         dataSet.FieldByName('NSU_RO_ADM').AsString:=vmovcartao.FieldByName('NSU_RO_ADM').AsString;
         dataSet.FieldByName('RO_ADM').AsInteger:=vmovcartao.FieldByName('RO_ADM').AsInteger;
         dataSet.FieldByName('COD_TERMINAL_ADM').AsString:=vmovcartao.FieldByName('COD_TERMINAL_ADM').AsString;
         dataSet.FieldByName('TIPO_PROD_ADM').AsInteger:=vmovcartao.FieldByName('TIPO_PROD_ADM').AsInteger;
         dataSet.FieldByName('DESC_TIPO_PROD_ADM').AsString:=vmovcartao.FieldByName('DESC_TIPO_PROD_ADM').AsString;
         dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger:=vmovcartao.FieldByName('COD_BANDEIRA_ADM').AsInteger;
         dataSet.FieldByName('DESC_BANDEIRA').AsString:=vmovcartao.FieldByName('DESC_BANDEIRA').AsString;
         dataSet.FieldByName('IND_ANTEC_RO_ADM').AsString:=vmovcartao.FieldByName('IND_ANTEC_RO_ADM').AsString;
         dataSet.FieldByName('IND_OR_AJUSTE_ADM').AsInteger:=vmovcartao.FieldByName('IND_OR_AJUSTE_ADM').AsInteger;
         dataSet.FieldByName('IND_OR_DESC_AJUSTE').AsString:=vmovcartao.FieldByName('IND_OR_DESC_AJUSTE').AsString;
         dataSet.FieldByName('ARQ_EXTRATO_ADM').AsString:=vmovcartao.FieldByName('ARQ_EXTRATO_ADM').AsString;
         dataSet.FieldByName('TAXA_CARTAO_CRED').AsCurrency:=vmovcartao.FieldByName('TAXA_CARTAO_CRED').AsCurrency;
         dataSet.FieldByName('TARIFA_CARTAO_CRED').AsCurrency:=vmovcartao.FieldByName('TARIFA_CARTAO').AsCurrency;
         dataset.FieldByName('CODIGO_CTRL_CRED').AsInteger:=vmovcartao.FieldByName('CODIGO_CTRL').AsInteger;
         dataset.FieldByName('COD_ADM').AsInteger:=vmovcartao.FieldByName('COD_ADM').AsInteger;
         dataset.FieldByName('QTDE_PARC').AsInteger:=vmovcartao.FieldByName('QTDE_PARC').AsInteger;
         dataset.FieldByName('VL_VENDA').AsCurrency:=vmovcartao.FieldByName('VL_VENDA').AsCurrency;

         if vmovcartao.FieldByName('STATUS_ADM').AsInteger = 1 then
         begin
           if (vmovcartao.FieldByName('VALORPARCELA').AsCurrency) > 0 then
           begin
            if vlote = 0 then
             gerarLote;
            dataset.FieldByName('DATA_BAIXA').AsDateTime :=  vmovcartao.FieldByName('DTPROCESSAMENTO').AsDateTime;
            dataSet.FieldByName('IDBAIXA_CARTAO').AsInteger:=vlote;
            vmovcartao.edit;
            vmovcartao.FieldByName('IDBAIXA_CARTAO').AsInteger:=vlote;
            vmovcartao.post;
           end;
         end;
         dataset.Post;
         Apply;
         // Retirando da pendência se for o caso
         datasetpend.Close;
         datasetpend.CommandText:= ' select * from pendencias_cartao ' +
         	' where NSU_RO_ADM = ''' + vmovcartao.FieldByName('NSU_RO_ADM').AsString + ''' ' +
          ' and RO_ADM = ' + vmovcartao.FieldByName('RO_ADM').AsString +
          ' and NPARCELA = ' + vmovcartao.FieldByName('NPARCELA').AsString +
          ' and STATUS_ADM = ' + vmovcartao.FieldByName('STATUS_ADM').AsString +
          ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
         		IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
         datasetpend.Open;
         if not datasetpend.IsEmpty then
         begin
           datasetpend.Delete;
           datasetpend.ApplyUpdates(-1);
         end;
        end;
       end
       else if (vmovcartao.FieldByName('STATUS_PROC').AsString <> 'CRED. JA QUITADO') then
       begin
         // Gravando pendências
         datasetpend.Close;
         datasetpend.CommandText := ' select * from pendencias_cartao ' +
          ' where NSU_RO_ADM = ''' + vmovcartao.FieldByName('NSU_RO_ADM').AsString + ''' ' +
          ' and RO_ADM = ' + vmovcartao.FieldByName('RO_ADM').AsString +
          ' and NPARCELA = ' + vmovcartao.FieldByName('NPARCELA').AsString +
          ' and STATUS_ADM = ' + vmovcartao.FieldByName('STATUS_ADM').AsString +
          ' and COD_EMP_MULT = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
         		IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
         datasetpend.Open;
         if datasetpend.IsEmpty then
         begin
          datasetpend.Insert;
          datasetpend.FieldByName('SEQID').AsInteger:=Gencodigo('PENDENCIAS_CARTAO', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
         end
         else
          datasetpend.Edit;
         datasetpend.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
         datasetpend.FieldByName('COD_EMP_MULT').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
           fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
         for I := 0 to vmovcartao.Fields.Count - 1 do
          if (vmovcartao.Fields[i].FieldName <> 'SEQID')
            and (vmovcartao.Fields[i].FieldName <> 'DESCR_OCORRENCIA_CONFERE')
            and (vmovcartao.Fields[i].FieldName <> 'CONFERE')
            and (vmovcartao.Fields[i].FieldName <> 'ID_FINANC_CONFERE') then
              datasetpend.FieldByName(vmovcartao.Fields[i].FieldName).Value := vmovcartao.FieldByName(vmovcartao.Fields[i].FieldName).Value;
         datasetpend.Post;
         datasetpend.ApplyUpdates(-1);
       end;
     end
     else
     begin
      if vlote = 0 then
        gerarLote;
      vmovcartao.edit;
       vmovcartao.FieldByName('IDBAIXA_CARTAO').AsInteger:=vlote;
      vmovcartao.post;
     end;
     vmovcartao.next;
    end;
    CommitaTransacao;
    Result:=true;
  except
    on e: exception do
    begin
      RollBackTransacao;
      vmovcartao.EnableControls;
      result := false;
      if Application.MessageBox(pchar(vMensagemErro + #13 +
        'Nenhum crédito será processado. Mostrar Erro?'), 'Confirmação', MB_YESNO +
        MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
        ShowMessage(e.Message);
      registraErro('TconciliaCielo.processadadoscartao. Erro: ' + e.Message);
      vlote := -1;
      exit;
    end;
  end;
  //chamar o método do jão para baixar os créditos marcados pelo vlote

  if vlote > 0 then
  begin
    try

      vContaExiste := conta <> nil;
      if vContaExiste then
      begin
        vContaAtivo := conta.dataSet.Active;
        vContaEhCheque := conta is TControleCheque;
        if vContaEhCheque then
          conta := TControleCredito.create;
      end
      else
      begin
        vContaAtivo := False;
        conta := TControleCredito.create;
      end;
      Result := conta._baixaCreditosConciliacaoCartao(vlote, vmovcartao, vLancarTarifa, vLancarAjustePositivo, vLancarComissao, fCodigoUnificada);
      if Result then
        for I := 0 to vListaValoresDiferentes.Count - 1 do
          vDadosIni.GravaAuditoria('IMPFIN029', 'VALIDAR', vListaValoresDiferentes[I] , '', '', buscas);
    finally
      if vContaExiste then
      begin
        if vContaEhCheque then
          conta := TControleCheque.create;
        if vContaAtivo then
        begin
          conta.close;
          conta.open;
        end;
      end
      else
      begin
        conta.Free;
        conta := nil;
      end;
    end;
  end
  else if vlote = -1 then
    Result := False
  else
    Result := True;

  if result then
    try
      vContaExiste := CTP <> nil;
      if not vContaExiste then
        CTP := TContasAPagar.Create;
      vCTP_Edit_Insert:= (CTP.dataSet.State in [dsInsert, dsEdit]);
        //    if not (CTP.dataSet.State in [dsInsert, dsEdit]) then
      Result := CTP._quitarContasConciliacaoCartao(vlote, vmovcartao);
    finally
      if vContaExiste and (not vCTP_Edit_Insert) then
      begin
        CTP.montaSelect(CTP.ultimasql);
      end else if not vContaExiste then
      begin
        CTP.Free;
        CTP:=nil;
      end;
    end;

  try
    if Result then
    begin
      lbl_statusProc.Caption:='Processando créditos encontrados...';
      if true {método retornou verdadeiro. Posso passar aqui o gauge e o o lbl_statusproc} then
      begin
        vGauge_HistoricoRetorno.Progress:=0;
        if not DirectoryExists(FileListBoxtxt.Directory+'\PROCESSADOS') then
         CreateDir(FileListBoxtxt.Directory+'\PROCESSADOS');
        for i := 0 to FileListBoxtxt.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          lbl_statusProc.Caption:='Movendo extrato para processados: '+vDadosIni.StrZero(i+1,5)+'/'+
          vDadosIni.StrZero(FileListBoxtxt.Items.Count,5)+' Arquivo: '+FileListBoxtxt.Items.Strings[i];
          vGauge_HistoricoRetorno.Progress:=trunc((i/FileListBoxtxt.Items.Count)*100);
          if CopyFile(Pchar(FileListBoxtxt.Directory+'\'+FileListBoxtxt.Items.Strings[i]),
                  Pchar(FileListBoxtxt.Directory+'\PROCESSADOS\'+FileListBoxtxt.Items.Strings[i]), false) then
            DeleteFile(FileListBoxtxt.Directory+'\'+FileListBoxtxt.Items.Strings[i]);
        end;
        Application.MessageBox('Processo concluído', 'Atenção', 0 + 64);
      end;
      vmovcartao.EmptyDataSet;
    end;
  finally
    vmovcartao.EnableControls;
    vGauge_HistoricoRetorno.Visible:=False;
    lbl_statusProc.Visible:=False;
  end;
end;

{ TadmCartao }

function TadmCartao.abreadmcartao: boolean;
begin
  if vDadosIni.vEmp.vFinanceiroUnificado then
    result:= montaSelect('select (a.cod_adm ||'' - ''|| a.cod_empresa) as cod_adm_temp, ' +
    ' (a.descricao_adm ||'' - EMP ''|| a.cod_empresa) as descricao_adm_temp, ' +
    ' a.* from adm_cartao a ' +
    ' where cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas + ' and a.ativo = 1 ' +
    ' order by a.cod_empresa, a.cod_adm ')
  else
    result:= montaSelect('select (a.cod_adm ||'' - ''|| a.cod_empresa) cod_adm_temp, ' +
    	' a.descricao_adm as descricao_adm_temp, ' +
    	' a.* from adm_cartao a ' +
    	' where a.cod_empresa = ' + vDadosIni.codEmpresa + ' and a.ativo = 1 ' +
      ' order by a.cod_empresa, a.cod_adm ');
end;

constructor TadmCartao.create;
begin
 dataSet:=TClientDataSet(dtmContasAReceber.cdsAdmcartao);
 buscas:=TIBQuery(dtmContasAReceber.qrBuscas);
 transacao := TIBTransaction(dtmContasAReceber.transacao);
end;


{ TRelatorioConciliaCartao }

function TRelatorioConciliaCartao.abrePesquisaRelatorio(pDataIni, pDataFim, pOrdem: string;vtpdata: string): Boolean;
var
  vSqlOrdem: string;
  vtipodatacons: string;
begin
  Result := False;
  fRel.Close;
  if pOrdem = 'Nome do Cliente' then
    vSqlOrdem := '3'
  else if pOrdem = 'Razao Social' then
    vSqlOrdem := '4'
  else if pOrdem = 'Data Vencimento' then
    vSqlOrdem := 'cc.data_venc_c'
  else if pOrdem = 'Data Venda' then
    vSqlOrdem := 'cc.data_venda'
  else if pOrdem = 'Data Quitacao' then
    vSqlOrdem := 'cc.datq_c'
  else if pOrdem = 'Num Documento' then
    vSqlOrdem := 'cc.n_doc_c'
  else if pOrdem = 'Num Aut Cartao' then
    vSqlOrdem := 'cc.n_aut_cart'
  else if pOrdem = 'Num Doc Adm' then
    vSqlOrdem := 'cc.n_docnsu_adm'
  else if pOrdem = 'Parcela' then
    vSqlOrdem := 'cc.nparcela'
  else if pOrdem = 'Produto Adm' then
    vSqlOrdem := 'cc.desc_tipo_prod_adm'
  else if pOrdem = 'Terminal Adm' then
    vSqlOrdem := 'cc.cod_terminal_adm'
  else if pOrdem = 'Valor' then
    vSqlOrdem := 'cc.valor_c'
  else if pOrdem = 'Comissao' then
    vSqlOrdem := 'cc.taxa_cartao_cred'
  else if pOrdem = 'Tarifa' then
    vSqlOrdem := 'cc.tarifa_cartao_cred'
  else
    vSqlOrdem := 'c.nome_cliente';
  if vtpdata = 'Q' then
    vtipodatacons:='cc.datq_c'
  else
    vtipodatacons:='cc.data_baixa';
    
  fRel.SQL.Text :=
    'select cc.valor_c, cc.cod_cred, case when c.cod_cliente is null then cc.nome_c else c.nome_cliente end nome_c,' +
    ' case when c.cod_cliente is null then cc.razao else c.razao end razao,' +
    ' cc.cod_terminal_adm, cc.codigo_ctrl_cred, cc.cod_adm, abs(cc.taxa_cartao_cred) taxa_cartao_cred, abs(cc.tarifa_cartao_cred) tarifa_cartao_cred,' +
    ' a.descricao_adm, ct.nome_ctrl, ct.agencia_ctrl, ct.n_conta_ctrl, rtrim(cc.n_doc_c) n_doc_c, cc.nparcela, a.num_estab_adm,' +
    ' cc.data_venc_c, cc.datq_c, cc.desc_tipo_prod_adm, cc.n_aut_cart, cc.n_docnsu_adm, cc.data_venda,' +
    ' cc.data_baixa,cc.qtde_parc,cc.vl_venda, cc.cod_emp_mult '+
    ' from controle_creditos cc' +
    ' left join clientes c on c.cod_cliente = cc.cod_cliente and c.cod_empresa = cc.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' left join adm_cartao a on a.cod_adm = cc.cod_adm and a.cod_empresa = cc.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' left join controles ct on ct.codigo_ctrl = cc.codigo_ctrl_cred and ct.codigo_emp = cc.codigo_emp' +
    ' where ' + vtipodatacons + ' >= :dataIni ' +
    ' and ' + vtipodatacons + ' <= :dataFim ' +
    //and cc.datq_c >= :dataIni and cc.datq_c <= :dataFim ' +
    ' and cc.idbaixa_cartao > 0 ' +
    vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
    	' and cc.cod_emp_mult in ' + vDadosIni.vEmp.vCodigoUnificadas, ' and cc.codigo_emp = ' + vDadosIni.codEmpresa) +
    ' and cc.status_c = ''QUITADO'' ' +
    ' order by ' +	vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, ' cc.cod_emp_mult,', '') +
    ' cc.cod_adm, cc.codigo_ctrl_cred, ct.agencia_ctrl, ct.n_conta_ctrl,' + vSqlOrdem;
  fRel.ParamByName('dataIni').AsDate := StrToDate(pDataIni);
  fRel.ParamByName('dataFim').AsDate := StrToDate(pDataFim);
  fRel.Open;
  Result := True;
end;

constructor TRelatorioConciliaCartao.create;
begin
  fRel := TIBQuery(dtmContasAReceber.qrRelConciliaCartao);
end;

{ TconciliacartaoConfere }

function TconciliacartaoConfere.abreConsultaFinanceiro(pDataIni,
  pDataFim: TDateTime; pTempSql: string; pMemo: TMemo): boolean;
var
	vtempSql: string;
  vWhere: string;
  vOK: boolean;
  vTempStringList: TStringList;

  procedure SomarTotaisAdministradora;
  begin
  	buscas.First;
    while not buscas.Eof do
    begin
      if trim(buscas.FieldByName('event_type_description').AsString) = 'Venda' then
      begin
        vTotVendasBrutoAdm := vTotVendasBrutoAdm + buscas.FieldByName('event_net_amount').AsFloat;

        vTotVendasLiqAdm := vTotVendasLiqAdm + buscas.FieldByName('event_net_amount').AsFloat;
      end
      else if trim(buscas.FieldByName('event_type_description').AsString) = 'Ajuste' then
      begin
        if (buscas.FieldByName('event_net_amount').AsFloat > 0) then //batch_net_amount
        begin
          vTotAjustesPositivoBrutoAdm := vTotAjustesPositivoBrutoAdm + buscas.FieldByName('event_net_amount').AsFloat;

          vTotAjustesPositivoLiqAdm := vTotAjustesPositivoLiqAdm + Abs(buscas.FieldByName('event_net_amount').AsFloat); //batch_net_amount
        end
        else
        begin
          vTotAjustesNegativoBrutoAdm := vTotAjustesNegativoBrutoAdm + Abs(buscas.FieldByName('event_net_amount').AsFloat);

          vTotAjustesNegativoLiqAdm := vTotAjustesNegativoLiqAdm + Abs(buscas.FieldByName('event_net_amount').AsFloat); //batch_net_amount
        end;
      end
      else if trim(buscas.FieldByName('event_type_description').AsString) = 'Cancelamento' then
      begin
        vTotCancelamentosBrutoAdm := vTotCancelamentosBrutoAdm + buscas.FieldByName('event_net_amount').AsFloat;

        vTotCancelamentosLiqAdm := vTotCancelamentosLiqAdm + buscas.FieldByName('event_net_amount').AsFloat; //batch_net_amount
      end
      else if trim(buscas.FieldByName('event_type_description').AsString) = 'Chargeback' then
      begin
        vTotChargeBackBrutoAdm := vTotChargeBackBrutoAdm + buscas.FieldByName('event_net_amount').AsFloat;

        vTotChargeBackLiqAdm := vTotChargeBackLiqAdm + buscas.FieldByName('event_net_amount').AsFloat; //batch_net_amount
      end
      else if trim(buscas.FieldByName('event_type_description').AsString) = 'Antecipação' then
      begin
        vTotAntecipacoesBrutoAdm := vTotAntecipacoesBrutoAdm + buscas.FieldByName('event_net_amount').AsFloat;

        vTotAntecipacoesLiqAdm := vTotAntecipacoesLiqAdm + buscas.FieldByName('event_net_amount').AsFloat; //batch_net_amount
      end;

      buscas.Next;
    end;
  end;
begin
	try
    vUltSQL := '';

    vOK := true;

    vTotCred := 0;

    vTotVendasBruto := 0;
    vTotVendasBrutoAdm := 0;

    vTotAjustesPositivoBruto := 0;
    vTotAjustesPositivoBrutoAdm := 0;

    vTotAjustesNegativoBruto := 0;
    vTotAjustesNegativoBrutoAdm := 0;

    vTotCancelamentosBruto := 0;
    vTotCancelamentosBrutoAdm := 0;

    vTotChargeBackBruto := 0;
    vTotChargeBackBrutoAdm := 0;

    vTotAntecipacoesBruto := 0;
    vTotAntecipacoesBrutoAdm := 0;

    vTotTarifaBruto := 0;

    vTotVendasLiq := 0;
    vTotVendasLiqAdm := 0;

    vTotAjustesPositivoLiq := 0;
    vTotAjustesPositivoLiqAdm := 0;

    vTotAjustesNegativoLiq := 0;
    vTotAjustesNegativoLiqAdm := 0;

    vTotCancelamentosLiq := 0;
    vTotCancelamentosLiqAdm := 0;

    vTotChargeBackLiq := 0;
    vTotChargeBackLiqAdm := 0;

    vTotAntecipacoesLiq := 0;
    vTotAntecipacoesLiqAdm := 0;

    vTotTarifaLiq := 0;
    vTotComissoesLiq := 0;

    if not vmovcartaoConcCartao.Active then
    begin
     vmovcartaoConcCartao.CreateDataSet;
     vmovcartaoConcCartao.Tag:=1;
    end;
    vmovcartaoConcCartao.DisableControls;
    vmovcartaoConcCartao.EmptyDataSet;

    vDadosIni.abreStatusProcessamento('', 'Consultando totais registros administradora...');

    vWhere :=
      ' where DATA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataIni)) +
      ' and DATA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataFim)) +
      pTempSql;

    vtempSql := vSQL +
      vWhere +
      ' order by DATA, COD_EMPRESA ';

    buscas.Close;
    buscas.SQL.Text := ' select vc.event_type_description, ' +
      ' sum(coalesce(vc.event_net_amount, 0)) event_net_amount, ' +
      ' sum(coalesce(vc.batch_net_amount, 0)) batch_net_amount from vw_conciliacao_adm vc ' +
      vWhere +
      ' and vc.event_type_description <> ''Ajuste'' ' +
      ' group by 1 ';
    buscas.Open;
    SomarTotaisAdministradora;

    buscas.Close;
    buscas.SQL.Text := ' select vc.event_type_description, ' +
      ' sum(coalesce(vc.event_net_amount, 0)) event_net_amount, ' +
      ' sum(coalesce(vc.batch_net_amount, 0)) batch_net_amount from vw_conciliacao_adm vc ' +
      vWhere +
      ' and vc.event_type_description = ''Ajuste'' ' +
      ' and vc.event_net_amount > 0 ' +
      ' group by 1 ';
    buscas.Open;
    SomarTotaisAdministradora;

    buscas.Close;
    buscas.SQL.Text := ' select vc.event_type_description, ' +
      ' sum(coalesce(vc.event_net_amount, 0)) event_net_amount, ' +
      ' sum(coalesce(vc.batch_net_amount, 0)) batch_net_amount from vw_conciliacao_adm vc ' +
      vWhere +
      ' and vc.event_type_description = ''Ajuste'' ' +
      ' and vc.event_net_amount < 0 ' +
      ' group by 1 ';
    buscas.Open;
    SomarTotaisAdministradora;

    vDadosIni.abreStatusProcessamento('', 'Consultando registros administradora...');

    Result := montaSelect(vtempSql);

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
    	if trim(dataSet.FieldByName('event_type_description').AsString) = 'Venda' then
      begin
      	vTotVendasBruto := vTotVendasBruto + dataSet.FieldByName('event_net_amount').AsFloat;

        vTotVendasLiq := vTotVendasLiq + dataSet.FieldByName('event_net_amount').AsFloat;

        vTotCred := vTotCred + dataSet.FieldByName('valor_c').AsFloat;

        if dataSet.FieldByName('event_net_amount').AsFloat > 0 then
        	vTotComissoesLiq :=  vTotComissoesLiq +
          	(dataSet.FieldByName('valor_c').AsFloat - dataSet.FieldByName('event_net_amount').AsFloat);
      end
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Antecipação' then
      begin
      	vTotAntecipacoesBruto := vTotAntecipacoesBruto + dataSet.FieldByName('event_net_amount').AsFloat;

        vTotAntecipacoesLiq := vTotAntecipacoesLiq + dataSet.FieldByName('event_net_amount').AsFloat; //batch_net_amount

        vTotCred := vTotCred + dataSet.FieldByName('valor_c').AsFloat;

        if dataSet.FieldByName('event_net_amount').AsFloat > 0 then
        	vTotComissoesLiq :=  vTotComissoesLiq +
          	(dataSet.FieldByName('valor_c').AsFloat - dataSet.FieldByName('event_net_amount').AsFloat);
      end
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Ajuste' then
      begin
      	if (dataSet.FieldByName('event_net_amount').AsFloat > 0) then //batch_net_amount
        begin
          vTotAjustesPositivoBruto := vTotAjustesPositivoBruto + dataSet.FieldByName('event_net_amount').AsFloat;

        	vTotAjustesPositivoLiq := vTotAjustesPositivoLiq + Abs(dataSet.FieldByName('event_net_amount').AsFloat); //batch_net_amount
        end
        else
        begin
        	vTotAjustesNegativoBruto := vTotAjustesNegativoBruto + Abs(dataSet.FieldByName('event_net_amount').AsFloat);

	        vTotAjustesNegativoLiq := vTotAjustesNegativoLiq + Abs(dataSet.FieldByName('event_net_amount').AsFloat); //batch_net_amount
        end;
      end
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Cancelamento' then
      begin
      	vTotCancelamentosBruto := vTotCancelamentosBruto + dataSet.FieldByName('event_net_amount').AsFloat;

        vTotCancelamentosLiq := vTotCancelamentosLiq + dataSet.FieldByName('event_net_amount').AsFloat; //batch_net_amount

        if (vDadosIni.StrToFloatFormat(Abs(dataSet.FieldByName('gross_amount').AsFloat), 2) = vDadosIni.StrToFloatFormat(Abs(dataSet.FieldByName('valor_c').AsFloat), 2)) then
        	if dataSet.FieldByName('event_net_amount').AsFloat > 0 then
          	vTotComissoesLiq :=  vTotComissoesLiq +
            	(dataSet.FieldByName('valor_c').AsFloat - dataSet.FieldByName('event_net_amount').AsFloat);

      end
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Chargeback' then
      begin
      	vTotChargeBackBruto := vTotChargeBackBruto + dataSet.FieldByName('event_net_amount').AsFloat;

        vTotChargeBackLiq := vTotChargeBackLiq + dataSet.FieldByName('event_net_amount').AsFloat; //batch_net_amount

        if (vDadosIni.StrToFloatFormat(Abs(dataSet.FieldByName('gross_amount').AsFloat), 2) = vDadosIni.StrToFloatFormat(Abs(dataSet.FieldByName('valor_c').AsFloat), 2)) then
        	if dataSet.FieldByName('event_net_amount').AsFloat > 0 then
          	vTotComissoesLiq :=  vTotComissoesLiq +
            	(dataSet.FieldByName('valor_c').AsFloat - dataSet.FieldByName('event_net_amount').AsFloat);
      end;

      if not vOK then
      	montarDatasetAjuste(pMemo)
      else
	      vOK := montarDatasetAjuste(pMemo);

    	dataSet.Edit;
      dataSet.FieldByName('SEL').AsString := 'S';
      dataSet.Post;

      dataSet.Next;
    end;
    Result := vOK;
  finally
    dataSet.First;
	  dataSet.EnableControls;

    if trim(vtempSql) <> '' then
      vUltSQL := vtempSql;

    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TconciliacartaoConfere.atualizarDataConsultaFinanc(
  pCodEmpresa: Integer): string;
begin
	try
  	Result := '01/01/2000 00:00:00';

    buscas.close;
    buscas.sql.Text:= ' update config_sistema set value1_vc = ''2000-01-01 00:00:00'' ' +
      ' where chave = ''conc_cartao_dt_financeiro'' ';
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
    	buscas.Transaction.Commit;

    Result := retornaDataConsultaFinanc(pCodEmpresa);
  except
   	on e: exception do
    begin
      result := '01/01/2000 00:00:00';
      Application.MessageBox(PChar('Falha ao retornar data consulta financeiro'), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('TconciliacartaoConfere.retornaDataConsultaFinanc. Erro: ' + e.Message);
      exit;
    end;
  end;
end;

function TconciliacartaoConfere.confirmarConciliacao(Gauge_HistoricoRetorno: TGauge): boolean;
var
	codigoUnificada: Integer;
	vlote: Integer;
  vcodigo_ctrl: Integer;
  vnome_ctrl: string;
  vdatabanco: TDateTime;
  buscas2: TIBQuery;
  vCodAdm: Integer;
  vContaExiste, vContaAtivo, vContaEhCheque, vCTP_Edit_Insert: boolean;
  vAdicionarAjuste: boolean;

 function localizarControle: boolean;
 begin
 	 Result := true;
   
 	 buscas.close;
   buscas.SQL.text:='select codigo_ctrl,nome_ctrl from controles ' +
     ' where N_CONTA_CTRL = :N_CONTA_CTRL ' +
     ' and AGENCIA_CTRL = :AGENCIA_CTRL ' +
     ' and CODIGO_EMP = :CODIGO_EMP ' +
     ' and ATIVO = 1 ';
   buscas.ParamByName('N_CONTA_CTRL').AsString := dataSet.FieldByName('ACCOUNT_NUMBER').AsString;
   buscas.ParamByName('AGENCIA_CTRL').AsString := dataSet.FieldByName('BRANCH_NUMBER').AsString;
   buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
   buscas.open;
   if buscas.isempty then
   begin
     Application.MessageBox(PChar('Controle não configurado para lançamento de ajuste: ' + #13 +
       'Agência: ' + trim(dataSet.FieldByName('BRANCH_NUMBER').AsString) + #13 +
       'Conta corrente: ' + trim(dataSet.FieldByName('ACCOUNT_NUMBER').AsString)), 'Atenção', MB_ICONERROR + MB_OK);
     vcreditosConcCartao.RollBackTransacao;
     Result := false;
     exit;
   end
   else
   begin
     vcodigo_ctrl := buscas.FieldByName('CODIGO_CTRL').AsInteger;
     vnome_ctrl := buscas.FieldByName('NOME_CTRL').AsString;
   end;
 end;

 procedure gerarLote;
 begin
   buscas.Close;
   buscas.SQL.Text := ' SELECT GEN_ID(INC_LOTE_IDBXCARTAO, 1) lote FROM rdb$Database';
   buscas.Open;
   vlote:=buscas.fieldbyname('lote').Asinteger;
 end;
begin
	try
  	Result := False;
    vlote := 0;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    Gauge_HistoricoRetorno.Progress := 0;
    if dataSet.RecordCount <= 0 then
    begin
      Result := true;
      exit;
    end;

    if not vDadosIni.PesqPros('IMPFIN036', 'CONFIRMAR', '',
	  	'CONCILIACAO_FINANCEIRO', '', buscas, false) then
  	    exit;

    vdatabanco := vDadosIni.getDataBanco(buscas2);

    try
      dataSet.DisableControls;
      dataSet.First;

      while not dataSet.Eof do
      begin
      	if dataSet.FieldByName('SEL').AsString = 'S' then
        begin
          if codigoUnificada = 0 then
            codigoUnificada := dataSet.FieldByName('cod_empresa').AsInteger
          else if codigoUnificada <> dataSet.FieldByName('cod_empresa').AsInteger then
          begin
            Application.MessageBox(pchar('Documento selecionado pertence a Unificada: ' +
              dataSet.FieldByName('cod_empresa').AsString +
              ' diferente dos demais selecionados: ' + IntToStr(codigoUnificada) + #13 +
              'Favor confirmar a conciliação de cada empresa individualmente.'),
              'Atenção', MB_ICONERROR + MB_OK);
            Exit;
          end;
        end;

        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
      dataSet.First;
    end;

    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        Gauge_HistoricoRetorno.Progress := Trunc((dataSet.RecNo / dataSet.RecordCount) * 100);

        if dataSet.FieldByName('SEL').AsString = 'S' then
        begin
          if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Ajuste')
            or (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Venda')
            or (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Antecipação')
            or (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Cancelamento')
            or (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Chargeback') then
          begin
            if vlote = 0 then
              gerarLote;
          end;

          if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Ajuste' then
          begin
            vCodAdm := 0;

            if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsCurrency < 0) and (vLancarAjusteNegativo) then
            begin
              buscas.Close;
              buscas.SQL.Text := ' select coalesce(cod_adm, 0) as cod_adm from adm_cartao adm ' +
                ' where adm.cod_empresa = :cod_empresa ' +
                ' and adm.cod_adquirente = :cod_adquirente ';
              buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
              buscas.ParamByName('cod_adquirente').AsInteger := dataSet.FieldByName('acquirer_id').AsInteger;
              buscas.Open;

              vCodAdm := vDadosIni.IfThen(buscas.IsEmpty, 0, buscas.FieldByName('cod_adm').AsInteger);

              if (vCodAdm <= 0) then
                Application.MessageBox(PChar(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('date_').AsDateTime) + ' -' +
                  ' Adquirente não vinculado a Administradora de Cartão (Conta de Ajuste de Cartões)' +
                  ' Adquirente: ' + IntToStr(dataSet.FieldByName('ACQUIRER_ID').AsInteger) +
                    ' - ' + dataSet.FieldByName('ACQUIRER_NAME').AsString), 'Atenção', MB_ICONERROR + MB_OK)
            end;

            vAdicionarAjuste := false;
            if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsCurrency > 0) and (vLancarAjustePositivo) then
              vAdicionarAjuste := true
            else if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsCurrency < 0) and (vLancarAjusteNegativo) and (vCodAdm > 0) then
              vAdicionarAjuste := true;

            if vAdicionarAjuste then
            begin
              vmovcartaoConcCartao.Append;
              vmovcartaoConcCartao.FieldByName('DATA_PREV_PAG').AsDateTime := dataSet.FieldByName('DATA').AsDateTime;
              vmovcartaoConcCartao.FieldByName('COD_ADM').AsInteger := vCodAdm;
              vmovcartaoConcCartao.FieldByName('NSU_RO_ADM').AsString := dataSet.FieldByName('ID').AsString;
              vmovcartaoConcCartao.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
              vmovcartaoConcCartao.FieldByName('STATUS_ADM').AsString := '1';
              vmovcartaoConcCartao.FieldByName('IND_OR_AJUSTE_ADM').AsFloat := 1;
              vmovcartaoConcCartao.FieldByName('CODIGO_CTRL').AsInteger := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
              vmovcartaoConcCartao.FieldByName('NOME_CTRL').AsString := dataSet.FieldByName('NOME_CTRL').AsString;
              vmovcartaoConcCartao.FieldByName('VALORPARCELA').AsCurrency := dataSet.FieldByName('EVENT_NET_AMOUNT').AsCurrency;
              vmovcartaoConcCartao.FieldByName('DESCR_OCORRENCIA_CONFERE').AsString := trim(dataSet.FieldByName('DESCRIPTION').AsString);
              vmovcartaoConcCartao.FieldByName('CONFERE').AsString := 'S';
              vmovcartaoConcCartao.FieldByName('ID_FINANC_CONFERE').AsInteger := dataSet.FieldByName('ID').AsInteger;
              vmovcartaoConcCartao.FieldByName('ACQUIRER_ID').AsInteger := dataSet.FieldByName('ACQUIRER_ID').AsInteger;
              vmovcartaoConcCartao.FieldByName('COD_AJUSTE_COD').AsString := dataSet.FieldByName('COD_AJUSTE_COD').AsString;
              vmovcartaoConcCartao.FieldByName('TIPO_LANCAMENTO_COD').AsString := dataSet.FieldByName('TIPO_LANCAMENTO_COD').AsString;
              vmovcartaoConcCartao.FieldByName('ARQ_EXTRATO_ADM').AsString := dataSet.FieldByName('ARQUIVO').AsString;
              vmovcartaoConcCartao.FieldByName('DATA_ARQUIVO').AsDateTime := dataSet.FieldByName('DATA_ARQUIVO').AsDateTime;
              vmovcartaoConcCartao.post;
            end;
          end
          else if ( (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Venda')
              or (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Antecipação')
              or (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Cancelamento')
              or (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Chargeback') )
            and (dataSet.FieldByName('COD_CRED').AsInteger > 0) then
          begin
            vcreditosConcCartao.abreCreditos(dataset.FieldByName('COD_CRED').AsInteger,
              dataset.FieldByName('COD_EMPRESA').AsInteger);
            if not vcreditosConcCartao.dataSet.IsEmpty then
            begin
               if (Trim(vcreditosConcCartao.dataSet.FieldByName('datq_C').AsString) <> '') then
                 raiseExceptionCreate('Documento ' + Trim(vcreditosConcCartao.dataSet.FieldByName('n_doc_c').AsString) +
                 ' já esta quitado. Data: ' + FormatDateTime('dd/mm/yyyy', vcreditosConcCartao.dataSet.FieldByName('datq_C').AsDateTime), '');
               if (vcreditosConcCartao.dataSet.FieldByName('STATUS_CXL_RQ').AsString = 'R') then
                  if (vcreditosConcCartao.dataSet.FieldByName('op_cxl').AsInteger > 0) then
                    raiseExceptionCreate('Documento ' + Trim(vcreditosConcCartao.dataSet.FieldByName('n_doc_c').AsString) +
                      ' já esta sendo recebido ou modificado pelo Caixa Auxiliar' +
                      ' pelo usuário de código: ' + vcreditosConcCartao.dataSet.FieldByName('op_cxl').AsString, '')
                  else
                    raiseExceptionCreate('Documento ' + Trim(vcreditosConcCartao.dataSet.FieldByName('n_doc_c').AsString) +
                      ' está marcado que esta sendo recebido ou modificado pelo Caixa Auxiliar', '');
               if (vcreditosConcCartao.dataSet.FieldByName('STATUS_CX').AsString = 'R') then
                 if (vcreditosConcCartao.dataSet.FieldByName('op_cx').AsInteger > 0) then
                   raiseExceptionCreate('Documento ' + Trim(vcreditosConcCartao.dataSet.FieldByName('n_doc_c').AsString) +
                     ' já esta sendo recebido ou modificado pelo Financeiro' +
                     ' pelo usuário de código: ' + vcreditosConcCartao.dataSet.FieldByName('op_cx').AsString, '')
                 else
                   raiseExceptionCreate('Documento ' + Trim(vcreditosConcCartao.dataSet.FieldByName('n_doc_c').AsString) +
                     ' está marcado que esta sendo recebido ou modificado pelo Financeiro', '');

               vcreditosConcCartao.dataSet.Edit;
               vcreditosConcCartao.dataSet.FieldByName('DATA_BAIXA').AsDateTime := vdatabanco;
               if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Venda') then
                 vcreditosConcCartao.dataSet.FieldByName('IDBAIXA_CARTAO').AsInteger := vlote
               else if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Antecipação') then
                 vcreditosConcCartao.dataSet.FieldByName('IDBAIXA_CARTAO').AsInteger := vlote
               else if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Cancelamento') then
                 vcreditosConcCartao.dataSet.FieldByName('IDDEV_CARTAO').AsInteger := vlote
               else if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Chargeback') then
                 vcreditosConcCartao.dataSet.FieldByName('IDDEV_CARTAO').AsInteger := vlote;
               vcreditosConcCartao.dataSet.FieldByName('STATUS_ADM').AsInteger := 1;
               vcreditosConcCartao.dataSet.FieldByName('VALOR_LIQUIDO').AsFloat := dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;
               vcreditosConcCartao.dataSet.FieldByName('ARQ_EXTRATO_ADM').AsString := dataSet.FieldByName('ARQUIVO').AsString;
               vcreditosConcCartao.dataSet.FieldByName('DATA_ARQUIVO').AsDateTime := dataSet.FieldByName('DATA_ARQUIVO').AsDateTime;

               if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Venda') then
               begin
//                 if (dataSet.FieldByName('GROSS_AMOUNT').AsFloat > 0) and (vLancarComissao) then
//                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat :=
//                    RoundTo((dataSet.FieldByName('GROSS_AMOUNT').AsFloat / dataSet.FieldByName('INSTALLMENTS_TOTAL').AsFloat
//                      - dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat), -2)
//                 else
              	 if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0) and (vLancarComissao) then
                	 vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat := RoundTo(
                  	(dataSet.FieldByName('VALOR_C').AsFloat - dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat), -2)
                 else
                   vcreditosConcCartao.dataSet.FieldByName('TARIFA_CARTAO_CRED').AsFloat := 0;
               end
               else if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Antecipação') then
               begin
//                 if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0) and (vLancarComissao) then
//                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat :=
//                    RoundTo((dataSet.FieldByName('GROSS_AMOUNT').AsFloat / dataSet.FieldByName('INSTALLMENTS_TOTAL').AsFloat
//                      - dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat), -2)
              	 if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0) and (vLancarComissao) then
                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat := RoundTo(
                  	(dataSet.FieldByName('VALOR_C').AsFloat - dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat), -2)
                 else
                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat := 0;
                vcreditosConcCartao.dataSet.FieldByName('TARIFA_CARTAO_CRED').AsFloat := 0;
               end
               else if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Cancelamento') then
               begin
//                 if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0) and (vLancarComissao) then
//                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat :=
//                    RoundTo((dataSet.FieldByName('GROSS_AMOUNT').AsFloat / dataSet.FieldByName('INSTALLMENTS_TOTAL').AsFloat
//                      - dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat), -2)
                 if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0) and (vLancarComissao) then
                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat := RoundTo(
                   	(dataSet.FieldByName('VALOR_C').AsFloat - dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat), -2)
                 else
                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat := 0;
                 vcreditosConcCartao.dataSet.FieldByName('TARIFA_CARTAO_CRED').AsFloat := 0;
               end
               else if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Chargeback') then
               begin
//                 if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0) and (vLancarComissao) then
//                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat :=
//                    RoundTo((dataSet.FieldByName('GROSS_AMOUNT').AsFloat / dataSet.FieldByName('INSTALLMENTS_TOTAL').AsFloat
//                      - dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat), -2)
              	 if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0) and (vLancarComissao) then
                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat := RoundTo(
                    (dataSet.FieldByName('VALOR_C').AsFloat - dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat), -2)
                 else
                   vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat := 0;
                 vcreditosConcCartao.dataSet.FieldByName('TARIFA_CARTAO_CRED').AsFloat := 0;
               end
               else
               begin
                 vcreditosConcCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsFloat := 0;
                 vcreditosConcCartao.dataSet.FieldByName('TARIFA_CARTAO_CRED').AsFloat := 0;
               end;

               vcreditosConcCartao.dataSet.FieldByName('CODIGO_CTRL_CRED').AsInteger := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
               vcreditosConcCartao.dataSet.Post;

               vcreditosConcCartao.Apply;
            end
          end;
        end;

        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
      dataSet.First;
    end;

    vcreditosConcCartao.CommitaTransacao;
  except
   	on e: exception do
    begin
      vcreditosConcCartao.RollBackTransacao;
      result := false;
      if Application.MessageBox(pchar(vMensagemErro + #13 +
        'Nenhum crédito será processado. Mostrar Erro?'), 'Confirmação', MB_YESNO +
        MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
        ShowMessage(e.Message);
      registraErro('TconciliacartaoConfere.confirmarConciliacao. Erro: ' + e.Message);
      vlote := -1;
      exit;
    end;
  end;

  if vlote > 0 then
  begin
    try
      vContaExiste := conta <> nil;
      if vContaExiste then
      begin
        vContaAtivo := conta.dataSet.Active;
        vContaEhCheque := conta is TControleCheque;
        if vContaEhCheque then
          conta := TControleCredito.create;
      end
      else
      begin
        vContaAtivo := False;
        conta := TControleCredito.create;
      end;
      try
        conta.dadosReceber.codigoUnificadaBxCartao :=
          vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
            codigoUnificada, vDadosIni.codEmpresa);

        Result := conta._baixaCreditosConciliacaoCartao(vlote, vmovcartaoConcCartao, vLancarTarifa, vLancarAjustePositivo, vLancarComissao, codigoUnificada);

        if Result then
          Result := conta._baixaDevCreditosConciliacaoCartao(vlote, codigoUnificada, vLancarTarifa, vLancarComissao);
      finally
        conta.dadosReceber.codigoUnificadaBxCartao := 0;
      end;
//      if Result then
//      for I := 0 to vListaValoresDiferentes.Count - 1 do
//      	vDadosIni.GravaAuditoria('IMPFIN029', 'VALIDAR', vListaValoresDiferentes[I] , '', '', buscas);
    finally
      if vContaExiste then
      begin
        if vContaEhCheque then
          conta := TControleCheque.create;
        if vContaAtivo then
        begin
          conta.close;
          conta.open;
        end;
      end
      else
      begin
        conta.Free;
        conta := nil;
      end;
    end;
  end
  else if vlote = -1 then
    Result := False
  else
    Result := True;

  if result then
    try
      vContaExiste := CTP <> nil;
      if not vContaExiste then
        CTP := TContasAPagar.Create;
      vCTP_Edit_Insert:= (CTP.dataSet.State in [dsInsert, dsEdit]);
        //    if not (CTP.dataSet.State in [dsInsert, dsEdit]) then
      Result := CTP._quitarContasConciliacaoCartao(vlote, vmovcartaoConcCartao, codigoUnificada);
    finally
      if vContaExiste and (not vCTP_Edit_Insert) then
      begin
        CTP.montaSelect(CTP.ultimasql);
      end
      else if not vContaExiste then
      begin
        CTP.Free;
        CTP:=nil;
      end;
    end;

  if Result then
  	vDadosIni.GravaAuditoria('IMPFIN036', 'VINCULAR', 'SUCESSO', 'CONCILIACAO_FINANCEIRO', '', buscas)
  else
  	vDadosIni.GravaAuditoria('IMPFIN036', 'VINCULAR', 'FALHA', 'CONCILIACAO_FINANCEIRO', '', buscas);
end;

constructor TconciliacartaoConfere.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoFinanceiro);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
  vmovcartaoConcCartao := TClientDataSet(dtmContasAReceber.CdslistaExtCartao);

  vunificadasConcCartao := TConciliaUnificadas.create;
  vnumestConcCartao := TConciliacartaoNumEst.create;
  vadmcartaoConcCartao := TConciliacartaoAdmCartao.create;
  vbandeiraConcCartao := TConciliacartaoBandeira.create;
  vcreditosConcCartao := TCreditosConfere.create;

  vSQL := ' select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, BANK_SHIPPING_DATE, ' +
    ' ID, COD_EMPRESA, ARQUIVO, DATA_ARQUIVO, ESTABLISHMENT_NUMBER, NSU, AUTHORIZATION_NUMBER, ' +
  	' TYPE_, TYPE_DESCRIPTION, ACQUIRER_ID, ACQUIRER_NAME, BRAND_ID, BRAND_NAME, ' +
    ' EVENT_TYPE,  EVENT_TYPE_DESCRIPTION, ' +
    ' DESCRIPTION, BANK_RECON_STATUS, BANK_RECON_DESCRIPTION, ' +
    ' GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT, GROSS_EVENT_AMOUNT, BATCH_GROSS_AMOUNT, ' +
    ' TAX, SALE_TAX, CUSTOMER_TAX, INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, ' +
    ' BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER, ' +
    ' IDENTIFICACAO_EMP, CODIGO_CTRL, NOME_CTRL, CODIGO_CTRL_TX, NOME_CTRL_TX, ' +
    ' N_CONTA_PLC_TX_CARTAO, N_CONTA_PLC_TARIFA_CARTAO, N_CONTA_PLC, DESC_PLC, ' +
    ' COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, ' +
    ' DATA_REC_C, DATA_VENC_C, DATQ_C, TAXA_CRED, STATUS_C, COD_CLIENTE, NOME_CLIENTE, RAZAO, ' +
    ' COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, ' +
    ' COD_BANDEIRA_ADM, DESC_BANDEIRA_ADM, QTDE_REG, PIX_ID, ' +
    ' FORM_PAG_COD, FORM_PAG, COD_AJUSTE_COD, COD_AJUSTE, BANDEIRA_COD, BANDEIRA, ' +
    ' STATUS_PAG_COD, STATUS_PAG, STATUS_PAG_ST, ' +
    ' TIPO_LANCAMENTO_COD, TIPO_LANCAMENTO, TIPO_LIQUIDACAO_COD, TIPO_LIQUIDACAO, ' +
    ' TIPO_ANTECIPACAO_COD, TIPO_ANTECIPACAO, TIPO_CARTAO_COD, TIPO_CARTAO, ' +
    ' MOTIVO_REJ_COD, MOTIVO_REJ, GRUPO_CARTAO_COD, GRUPO_CARTAO, ' +
    ' TIPO_TRANSACAO_COD, TIPO_TRANSACAO, STATUS_TRANSF_COD, STATUS_TRANSF, STATUS_TRANSF_ST, ' +
    ' ORIGEM_AJUSTE_COD, ORIGEM_AJUSTE ' +
    ' from VW_CONCILIACAO_FINANCEIRO ';
end;

destructor TconciliacartaoConfere.Destroy;
begin
	vunificadasConcCartao.Free;
  vunificadasConcCartao := nil;

  vnumestConcCartao.Free;
  vnumestConcCartao := nil;

	vadmcartaoConcCartao.Free;
  vadmcartaoConcCartao := nil;

  vbandeiraConcCartao.Free;
  vbandeiraConcCartao := nil;

  vcreditosConcCartao.Free;
  vcreditosConcCartao := nil;

  inherited;
end;

function TconciliacartaoConfere.montarDatasetAjuste(pMemo: TMemo): boolean;
var
	vcodigo_ctrl: Integer;
  vnome_ctrl: string;
  vIdLancamento: Integer;
  vIdAjuste: Integer;
  vNumContaPlc: Double;
  vCodAdm: Integer;
  vDescrAdm: string;
  vCodCliente: Integer;
begin
	try
    Result := true;

    if (dataSet.FieldByName('ID').AsInteger > 0)
    	and (trim(dataSet.FieldByName('NSU').AsString) <> '')
    	and (dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger > 0)
      and (dataSet.FieldByName('INSTALLMENTS_TOTAL').AsInteger > 0)
      and (dataSet.FieldByName('COD_EMPRESA').AsInteger > 0)
      and (dataSet.FieldByName('QTDE_REG').AsInteger > 1) then
    begin
      pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) +
        ' Registro financeiro vinculado a dois ou mais créditos com mesmo NSU/Parcela/Empresa: ' +
        ' Id: ' + IntToStr(dataSet.FieldByName('ID').AsInteger) +
        ' NSU: ' + dataSet.FieldByName('NSU').AsString +
        ' Nº Parcela: ' + IntToStr(dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger) +
        ' Qtde Parcela: ' + IntToStr(dataSet.FieldByName('INSTALLMENTS_TOTAL').AsInteger) +
        ' Empresa: ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) +
        ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
        ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
      Result := false;
    end;

    if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) <> 'Venda')
    	and (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) <> 'Ajuste') then
      exit;

    if (trim(dataSet.FieldByName('BRANCH_NUMBER').AsString) = '')
    	or (trim(dataSet.FieldByName('ACCOUNT_NUMBER').AsString) = '') then
    begin
    	pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) +
        ' Registro financeiro sem Agência/Número conta: ' +
        ' Id: ' + IntToStr(dataSet.FieldByName('ID').AsInteger) +
        ' NSU: ' + dataSet.FieldByName('NSU').AsString +
        ' Nº Parcela: ' + IntToStr(dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger) +
        ' Qtde Parcela: ' + IntToStr(dataSet.FieldByName('INSTALLMENTS_TOTAL').AsInteger) +
        ' Empresa: ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) +
        ' Num Banco: ' + trim(dataSet.FieldByName('BANK_NUMBER').AsString) +
        ' Banco: ' + trim(dataSet.FieldByName('BANK_NAME').AsString) +
        ' Agência: ' + trim(dataSet.FieldByName('BRANCH_NUMBER').AsString) +
        ' Número Conta: ' + trim(dataSet.FieldByName('ACCOUNT_NUMBER').AsString) +
        ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
        ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
      Result := false;      
      exit;
    end;

    if dataSet.FieldByName('CODIGO_CTRL').AsInteger <= 0 then
    begin
    	pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
      	' Controle para o ' + trim(dataSet.FieldByName('BANK_NAME').AsString) +
        ' não configurado:' +
      	' Agência: ' + trim(dataSet.FieldByName('BRANCH_NUMBER').AsString) +
      	' Conta corrente: ' + trim(dataSet.FieldByName('ACCOUNT_NUMBER').AsString) +
        ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
        ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
    	Result := false;
    end;

    if ((dataSet.FieldByName('TAX').AsFloat > 0) and (dataSet.FieldByName('N_CONTA_PLC_TX_CARTAO').AsFloat <= 0)) then
    begin
      pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
        ' Nº da Conta para taxa de cartão não informado no controle:' +
        ' Código Controle: ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL_TX').AsInteger) +
        ' Controle: ' + trim(dataSet.FieldByName('NOME_CTRL_TX').AsString) +
        ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
        ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
      Result := false;
    end
    else if ((dataSet.FieldByName('TAX').AsFloat > 0) and (dataSet.FieldByName('N_CONTA_PLC_TX_CARTAO').AsFloat > 0)) then
    begin
      buscas.Close;
      buscas.SQL.Text := ' SELECT N_CONTA_PLC, DESC_PLC, TIPO_PLC FROM P_CONTAS ' +
        ' WHERE N_CONTA_PLC = :N_CONTA_PLC ';
      buscas.ParamByName('N_CONTA_PLC').AsFloat := dataSet.FieldByName('N_CONTA_PLC_TX_CARTAO').AsFloat;
      buscas.Open;

      if not buscas.IsEmpty then
        if buscas.FieldByName('TIPO_PLC').AsString <> 'S' then
        begin
          pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
            ' Nº da Conta para taxa de cartão não é de saída:' +
            ' Código Controle: ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL_TX').AsInteger) +
            ' Controle: ' + trim(dataSet.FieldByName('NOME_CTRL_TX').AsString) +
            ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
            ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
          Result := false;
        end;
    end;

    if ((dataSet.FieldByName('TAX').AsFloat > 0) and (dataSet.FieldByName('N_CONTA_PLC_TARIFA_CARTAO').AsFloat <= 0)) then
    begin
      pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
        ' Nº da Conta para tarifa de cartão não informado no controle:' +
        ' Código Controle: ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL_TX').AsInteger) +
        ' Controle: ' + trim(dataSet.FieldByName('NOME_CTRL_TX').AsString) +
        ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
        ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
      Result := false;
    end
    else if ((dataSet.FieldByName('TAX').AsFloat > 0) and (dataSet.FieldByName('N_CONTA_PLC_TARIFA_CARTAO').AsFloat > 0)) then
    begin
      buscas.Close;
      buscas.SQL.Text := ' SELECT N_CONTA_PLC, DESC_PLC, TIPO_PLC FROM P_CONTAS ' +
        ' WHERE N_CONTA_PLC = :N_CONTA_PLC ';
      buscas.ParamByName('N_CONTA_PLC').AsFloat := dataSet.FieldByName('N_CONTA_PLC_TARIFA_CARTAO').AsFloat;
      buscas.Open;

      if not buscas.IsEmpty then
        if buscas.FieldByName('TIPO_PLC').AsString <> 'S' then
        begin
          pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
            ' Nº da Conta para tarifa de cartão não é de saída:' +
            ' Código Controle: ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL_TX').AsInteger) +
            ' Controle: ' + trim(dataSet.FieldByName('NOME_CTRL_TX').AsString) +
            ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
            ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
          Result := false;
        end;
    end;

    if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Cancelamento')
    	or (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Chargeback') then
    begin
      if dataSet.FieldByName('COD_CRED').AsInteger > 0 then
      begin
        if (vDadosIni.StrToFloatFormat(Abs(dataSet.FieldByName('GROSS_AMOUNT').AsFloat), 2) <>
        	vDadosIni.StrToFloatFormat(Abs(dataSet.FieldByName('VALOR_C').AsFloat), 2)) then
        begin
          pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
            ' Valor do ' + trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) + 
            ' diferente do Valor do Crédito: ' +
            ' Nsu: ' + trim(dataSet.FieldByName('NSU').AsString) +
            ' Num Aut: ' + trim(dataSet.FieldByName('AUTHORIZATION_NUMBER').AsString) +
            ' Num Parc: ' + IntToStr(dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger) +
            ' Valor Canc: ' + FormatFloat('0.00', dataSet.FieldByName('GROSS_AMOUNT').AsFloat) +
            ' Valor Cred: ' + FormatFloat('0.00', dataSet.FieldByName('VALOR_C').AsFloat) +
            ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
            ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
          Result := false;
        end;
      end;
    end
    else if (trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Ajuste') then
    begin
    	if trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString) = '' then
      begin
        buscas.Close;
        buscas.SQL.Text := ' SELECT ATL.ID, ATL.N_CONTA_PLC_E, ATL.N_CONTA_PLC_S FROM CONCILIACAO_TIPO_LANC ATL ' +
        	' INNER JOIN CONCILIACAO_TIPO_LANC_ADQ ATL_ADQ ON ATL_ADQ.ID_TIPO_LANC = ATL.ID ' +
          ' WHERE ATL_ADQ.ID_AQUIRENTE = :ADQUIRENTE ' +
          ' AND ATL_ADQ.CODIGO = :CODIGO ';
        buscas.ParamByName('ADQUIRENTE').AsInteger := dataSet.FieldByName('ACQUIRER_ID').AsInteger;
        buscas.ParamByName('CODIGO').AsString := dataSet.FieldByName('TIPO_LANCAMENTO_COD').AsString;
        buscas.Open;

        if buscas.IsEmpty then
        begin
          pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
            ' Nº da Conta para Conta do Tipo de Lançamento não informado: ' +
            ' Código Lançamento: ' + trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString) +
            ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
            ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
          Result := false;
        end
        else
        begin
        	vIdLancamento := buscas.FieldByName('ID').AsInteger;
          if dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0 then
            vNumContaPlc := buscas.FieldByName('N_CONTA_PLC_E').AsFloat
          else
            vNumContaPlc := buscas.FieldByName('N_CONTA_PLC_S').AsFloat;

          if vNumContaPlc <= 0 then
          begin
            pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
              ' Nº da Conta para ' +
              vDadosIni.IfThen(dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0, '(Entrada)', '(Saída)') +
              ' Conta do Tipo de Lançamento não informado: ' +
              ' Id Lançamento: ' + IntToStr(vIdLancamento) +
              ' Código Lançamento: ' + trim(dataSet.FieldByName('TIPO_LANCAMENTO_COD').AsString) +
              ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
              ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
            Result := false;
          end
          else
          begin
            buscas.Close;
            buscas.SQL.Text := ' SELECT N_CONTA_PLC, DESC_PLC, TIPO_PLC FROM P_CONTAS ' +
              ' WHERE N_CONTA_PLC = :N_CONTA_PLC ';
            buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumContaPlc;
            buscas.Open;

            if not buscas.IsEmpty then
            begin
              if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0)
                and (buscas.FieldByName('TIPO_PLC').AsString <> 'E') then
              begin
                pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
                  ' Nº da Conta para Conta do Tipo de Lançamento não é de entrada: ' +
                  ' Id Lançamento: ' + IntToStr(vIdLancamento) +
              		' Código Lançamento: ' + trim(dataSet.FieldByName('TIPO_LANCAMENTO_COD').AsString) +
                  ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
                  ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
                Result := false;
              end
              else if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat < 0)
                and (buscas.FieldByName('TIPO_PLC').AsString <> 'S') then
              begin
                  pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
                    ' Nº da Conta para Conta do Tipo de Lançamento não é de saída: ' +
                    ' Id Lançamento: ' + IntToStr(vIdLancamento) +
              			' Código Lançamento: ' + trim(dataSet.FieldByName('TIPO_LANCAMENTO_COD').AsString) +
                    ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
                    ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
                  Result := false;
              end;
            end;
          end;
        end;
      end
      else
      begin
        buscas.Close;
        buscas.SQL.Text := ' SELECT AJT.ID, AJT.N_CONTA_PLC_E, AJT.N_CONTA_PLC_S FROM CONCILIACAO_COD_AJUSTE AJT  ' +
          ' INNER JOIN CONCILIACAO_COD_AJUSTE_ADQ AJT_ADQ ON AJT_ADQ.ID_COD_AJUSTE = AJT.ID ' +
          ' WHERE AJT_ADQ.ID_ADQUIRENTE = :ADQUIRENTE ' +
          ' AND AJT_ADQ.CODIGO = :CODIGO ';
        buscas.ParamByName('ADQUIRENTE').AsInteger := dataSet.FieldByName('ACQUIRER_ID').AsInteger;
        buscas.ParamByName('CODIGO').AsString := dataSet.FieldByName('COD_AJUSTE_COD').AsString;
        buscas.Open;

        if buscas.IsEmpty then
        begin
          pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
            ' Nº da Conta para Conta de Ajuste de Cartões não informado: ' +
            vDadosIni.IfThen(trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString) <> '',
              ' Código Ajuste: ' + trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString), '') +
            ' Descrição Auste: ' + trim(dataSet.FieldByName('DESCRIPTION').AsString) +
            ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
            ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
          Result := false;
        end
        else
        begin
          vIdAjuste := buscas.FieldByName('ID').AsInteger;
          if dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0 then
            vNumContaPlc := buscas.FieldByName('N_CONTA_PLC_E').AsFloat
          else
            vNumContaPlc := buscas.FieldByName('N_CONTA_PLC_S').AsFloat;

          if vNumContaPlc <= 0 then
          begin
            pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
              ' Nº da Conta para ' +
              vDadosIni.IfThen(dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0, '(Entrada)', '(Saída)') +
              ' Conta de Ajuste de Cartões não informado: ' +
              ' Id Ajuste: ' + IntToStr(vIdAjuste) +
              vDadosIni.IfThen(trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString) <> '',
                ' Código Ajuste: ' + trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString), '') +
              ' Descrição Auste: ' + trim(dataSet.FieldByName('DESCRIPTION').AsString) +
              ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
              ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
            Result := false;
          end
          else
          begin
            buscas.Close;
            buscas.SQL.Text := ' SELECT N_CONTA_PLC, DESC_PLC, TIPO_PLC FROM P_CONTAS ' +
              ' WHERE N_CONTA_PLC = :N_CONTA_PLC ';
            buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumContaPlc;
            buscas.Open;

            if not buscas.IsEmpty then
            begin
              if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat > 0)
                and (buscas.FieldByName('TIPO_PLC').AsString <> 'E') then
              begin
                pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
                  ' Nº da Conta para Conta de Ajuste de Cartões não é de entrada: ' +
                  ' Id Ajuste: ' + IntToStr(vIdAjuste) +
                  vDadosIni.IfThen(trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString) <> '',
                    ' Código Ajuste: ' + trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString), '') +
                  ' Descrição Auste: ' + trim(dataSet.FieldByName('DESCRIPTION').AsString) +
                  ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
                  ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
                Result := false;
              end
              else if (dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat < 0)
                and (buscas.FieldByName('TIPO_PLC').AsString <> 'S') then
              begin
                  pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
                    ' Nº da Conta para Conta de Ajuste de Cartões não é de saída: ' +
                    ' Id Ajuste: ' + IntToStr(vIdAjuste) +
                    vDadosIni.IfThen(trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString) <> '',
                      ' Código Ajuste: ' + trim(dataSet.FieldByName('COD_AJUSTE_COD').AsString), '') +
                    ' Descrição Auste: ' + trim(dataSet.FieldByName('DESCRIPTION').AsString) +
                    ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
                    ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
                  Result := false;
              end;
            end;
          end;
        end;
      end;

      if dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat < 0 then
      begin
      	buscas.Close;
	      buscas.SQL.Text := ' SELECT COD_ADM, DESCRICAO_ADM, COD_CLIENTE FROM ADM_CARTAO ' +
        	'	WHERE COD_EMPRESA = :COD_EMPRESA ' +
          ' AND COD_ADQUIRENTE = :COD_ADQUIRENTE ';
        buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
        buscas.ParamByName('COD_ADQUIRENTE').AsInteger := dataSet.FieldByName('ACQUIRER_ID').AsInteger;
        buscas.Open;

        if buscas.IsEmpty then
        begin
        	pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
            ' Adquirente não vinculado a Administradora de Cartão (Conta de Ajuste de Cartões)' +
            ' Adquirente: ' + IntToStr(dataSet.FieldByName('ACQUIRER_ID').AsInteger) +
            ' - ' + trim(dataSet.FieldByName('ACQUIRER_NAME').AsString) +
            ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
            ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
          Result := false;
        end
        else
        begin
        	vCodAdm     := buscas.FieldByName('COD_ADM').AsInteger;
          vDescrAdm   := buscas.FieldByName('DESCRICAO_ADM').AsString;
        	vCodCliente := buscas.FieldByName('COD_CLIENTE').AsInteger;

        	if vCodCliente <= 0 then
          begin
            pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
              ' Cliente/Fornecedor não informado na Administradora de cartão (Conta de Ajuste de Cartões): ' +
              ' Administradora Cartão: ' + IntToStr(buscas.FieldByName('COD_ADM').AsInteger) +
            	' - ' + trim(buscas.FieldByName('DESCRICAO_ADM').AsString) +
              ' Adquirente: ' + IntToStr(dataSet.FieldByName('ACQUIRER_ID').AsInteger) +
             	' - ' + trim(dataSet.FieldByName('ACQUIRER_NAME').AsString) +
              ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
              ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
            Result := false;
          end
          else
          begin
          	buscas.Close;
			      buscas.SQL.Text := ' SELECT COD_CLIENTE FROM CLIENTES ' +
            	' WHERE COD_CLIENTE = :COD_CLIENTE ' +
              ' AND COD_EMPRESA = :COD_EMPRESA ';
            buscas.ParamByName('COD_CLIENTE').AsInteger := vCodCliente;
            buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
            buscas.Open;

            if buscas.IsEmpty then
            begin
              pMemo.Lines.Add(FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA').AsDateTime) + ' -' +
                ' Cliente/Fornecedor não encontrado na Administradora de cartão (Conta de Ajuste de Cartões):' +
                ' Administradora Cartão: ' + IntToStr(vCodAdm) +
                ' - ' + trim(vDescrAdm) +
                ' Adquirente: ' + IntToStr(dataSet.FieldByName('ACQUIRER_ID').AsInteger) +
                ' - ' + trim(dataSet.FieldByName('ACQUIRER_NAME').AsString) +
                ' Arquivo: ' + trim(dataSet.FieldByName('ARQUIVO').AsString) +
                ' Data Arq: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_ARQUIVO').AsDateTime));
              Result := false;
            end;
          end;
        end;
      end;
    end;
  except
   	on e: exception do
    begin
      result := false;
      Application.MessageBox(PChar('Falha ao montar dataset ajuste'), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('TconciliacartaoConfere.montarDatasetAjuste. Erro: ' + e.Message);
      exit;
    end;
  end;
end;

function TconciliacartaoConfere.retornaDataConsultaFinanc(pCodEmpresa: Integer): string;
begin
	try
  	Result := '01/01/2000 00:00:00';
    
  	buscas.close;
    buscas.sql.Text:= ' select chave, cod_empresa,' +
    	' value1_vc, ' +
      ' case when (coalesce(value1_vc, '''') = '''') then ' +
      '        ''01/01/2000 00:00:00'' ' +
      '      when (char_length(trim(coalesce(value1_vc, ''''))) = ''19'') then ' +
      '        (substring(value1_vc from 9 for 2) ' +
      '        ||''/''|| substring(value1_vc from 6 for 2) ' +
      '        ||''/''|| substring(value1_vc from 1 for 4)) ' +
      '        ||'' '' || substring(value1_vc from 12 for 2) ' +
      '        ||'':''|| substring(value1_vc from 15 for 2) ' +
      '        ||'':''|| substring(value1_vc from 18 for 2) ' +
      '      when (char_length(trim(coalesce(value1_vc, ''''))) = ''10'') then ' +
      '        (substring(value1_vc from 9 for 2) ' +
      '        ||''/''|| substring(value1_vc from 6 for 2)' +
      '        ||''/''|| substring(value1_vc from 1 for 4)) ' +
      '     else ' +
      '        ''01/01/2000 00:00:00'' ' +
      ' end data from config_sistema ' +
      ' where chave = ''conc_cartao_dt_financeiro'' ' +
      ' and cod_empresa = :cod_empresa ';
    buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.IfThen(pCodEmpresa <= 0, StrToInt(vDadosIni.codEmpresa), pCodEmpresa);
    buscas.open;

    if not buscas.IsEmpty then
	    Result := buscas.FieldByName('data').AsString;
	except
   	on e: exception do
    begin
      result := '01/01/2000 00:00:00';
      Application.MessageBox(PChar('Falha ao retornar data consulta financeiro'), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('TconciliacartaoConfere.retornaDataConsultaFinanc. Erro: ' + e.Message);
      exit;
    end;
  end;
end;

procedure TconciliacartaoConfere.somarSelecionados;
var
	vTotalVendas: Double;
  vTotalAntecipacoes: Double;
  vTotalCancelamentos: Double;
  vTotalChargeBack: Double;
  vTotalAjustesPositivo: Double;
  vTotalAjustesNegativo: Double;
begin
	if dataSet.IsEmpty then
    exit;

  try
  	vDadosIni.abreStatusProcessamento('', 'Realizando somatório...');
    vTotalVendas := 0;
    vTotalAntecipacoes := 0;
    vTotalCancelamentos := 0;
    vTotalChargeBack := 0;
    vTotalAjustesPositivo := 0;
    vTotalAjustesNegativo := 0;

    try
    	storeRecNo;
      dataSet.DisableControls;
      dataSet.first;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('SEL').AsString = 'S' then
        begin
        	if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Venda' then
          	vTotalVendas := vTotalVendas + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

          if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Antecipação' then
          	vTotalAntecipacoes := vTotalAntecipacoes + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

          if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Cancelamento' then
          	vTotalCancelamentos := vTotalCancelamentos + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

          if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Chargeback' then
          	vTotalChargeBack := vTotalChargeBack + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

          if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Ajuste' then
          	if dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat >= 0 then
          		vTotalAjustesPositivo := vTotalAjustesPositivo + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

          if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Ajuste' then
          	if dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat < 0 then
          		vTotalAjustesNegativo := vTotalAjustesNegativo + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;
        end;

        dataSet.next;
      end;
    finally
      dataSet.EnableControls;
      restoreRecNo;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    FrmConciliaCartaoConfere.lbTotalVendas.Caption         := format('%m', [vTotalVendas]);
    FrmConciliaCartaoConfere.lbTotalAntecipacoes.Caption   := format('%m', [vTotalAntecipacoes]);
    FrmConciliaCartaoConfere.lbTotalCancelamentos.Caption  := format('%m', [vTotalCancelamentos]);
    FrmConciliaCartaoConfere.lbTotalChargeback.Caption     := format('%m', [vTotalChargeBack]);
    FrmConciliaCartaoConfere.lbTotalAjustePositivo.Caption := format('%m', [vTotalAjustesPositivo]);
    FrmConciliaCartaoConfere.lbTotalAjusteNegativo.Caption := format('%m', [vTotalAjustesNegativo]);
    FrmConciliaCartaoConfere.lbTotal.Caption               := format('%m', [vTotalVendas +
      																																		  vTotalAntecipacoes +
                                                          									vTotalCancelamentos +
                                                          									vTotalChargeBack +
                                                          									vTotalAjustesPositivo +
                                                                            vTotalAjustesNegativo]);
    vDadosIni.abreForm('TOTAL FINANCEIRO:', FrmConciliaCartaoConfere.pnTotalFinanceiro, [ofEscapeExit, ofAlignAllClientWinCtrl]);
  end;
end;

procedure TconciliacartaoConfere._AbreFormRetorno(pTipoForm: Integer; pPendencias: boolean);
begin
	try
  	if pPendencias then
    	vDadosIni.abreStatusProcessamento('', 'Abrindo Conciliação Cartão (Pendências)')
    else
	    vDadosIni.abreStatusProcessamento('', 'Abrindo Conciliação Cartão');

    if dtmContasAReceber = nil then
      dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

    if not vDadosIni.PesqPros('IMPFIN027', 'CONSULTA', '', 'CONCILIACAO_FINANCEIRO', '',
      dtmContasAReceber.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if FrmConciliaCartaoConfere = nil then
    begin
    	if pTipoForm > 0 then
      	vDadosIni.vModalOuChild := 'M';

      if pPendencias then
      	vDadosIni.vPesquisa := 'PENDENCIASCARTAO';

      Application.CreateForm(TFrmConciliaCartaoConfere, FrmConciliaCartaoConfere);
    end;

    if (pTipoForm > 0) and (not FrmConciliaCartaoConfere.Visible) then
      FrmConciliaCartaoConfere.ShowModal
    else if (not FrmConciliaCartaoConfere.Visible) then
      FrmConciliaCartaoConfere.Show
    else if FrmConciliaCartaoConfere.FormStyle = fsMDIChild then
    	FrmConciliaCartaoConfere.Show
    else
	    FrmConciliaCartaoConfere.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TconciliacartaoConfere._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    storeRecNo;
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    restoreRecNo;

  finally
    vDadosIni.fechaStatusProcessamento;
    dataSet.EnableControls;
  end
end;

procedure TconciliacartaoConfere._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TconciliacartaoConfere._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    storeRecNo;
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;

      dataSet.Next;
    end;
    restoreRecNo;

  finally
    vDadosIni.fechaStatusProcessamento;
    dataSet.EnableControls;
  end;
end;

{ TPendenciasConfere }

function TPendenciasConfere.abreConsultaPendencias(pDataIni: TDateTime; pDataFim: TDateTime; pTempSql: string): boolean;
var
	vtempSql: string;
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Consultando pendências administradora...');

    vUltSQL := ''; 

    vTotPendConfere := 0;

    vtempSql := vSQL +
      ' where DATA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataIni)) +
      ' and DATA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataFim)) +
      pTempSql +
      ' order by DATA, COD_EMPRESA ';

    Result := montaSelect(vtempSql);

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
    	if trim(dataSet.FieldByName('event_type_description').AsString) = 'Venda' then
	    	vTotPendConfere := vTotPendConfere + Abs(dataSet.FieldByName('event_net_amount').AsFloat)
      else if (trim(dataSet.FieldByName('event_type_description').AsString) = 'Ajuste') and (dataSet.FieldByName('event_net_amount').AsFloat > 0) then //batch_net_amount
      	vTotPendConfere := vTotPendConfere + Abs(dataSet.FieldByName('event_net_amount').AsFloat) //batch_net_amount
      else if (trim(dataSet.FieldByName('event_type_description').AsString) = 'Ajuste') then
      	vTotPendConfere := vTotPendConfere - Abs(dataSet.FieldByName('event_net_amount').AsFloat) //batch_net_amount
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Cancelamento' then
      	vTotPendConfere := vTotPendConfere - Abs(dataSet.FieldByName('event_net_amount').AsFloat) //batch_net_amount
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Chargeback' then
      	vTotPendConfere := vTotPendConfere - Abs(dataSet.FieldByName('event_net_amount').AsFloat) //batch_net_amount
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Antecipação' then
      	vTotPendConfere := vTotPendConfere + Abs(dataSet.FieldByName('event_net_amount').AsFloat); //batch_net_amount
    	dataSet.Next;
    end;
  finally
  	dataSet.First;
	  dataSet.EnableControls;

    if trim(vtempSql) <> '' then
      vUltSQL := vtempSql;

    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TPendenciasConfere.create;
var
	I: Integer;
  vdataSetTemp: TClientDataSet;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoPendencias);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  vdataSetTemp := TClientDataSet(dtmContasAReceber.cdsConciliacaoPendencias3);

  vunificadasConcCartao := TConciliaUnificadas.create;
  vunificadasConcCartao.dataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoUnificadas2);

  vnumestConcCartao := TConciliacartaoNumEst.create;
  vnumestConcCartao.dataSet := TClientDataSet(dtmContasAReceber.cdsNumEstConciliacao2);

  vadmcartaoConcCartao := TConciliacartaoAdmCartao.create;
  vadmcartaoConcCartao.dataSet := TClientDataSet(dtmContasAReceber.cdsAdmCartaoConciliacao2);

  vbandeiraConcCartao := TConciliacartaoBandeira.create;
  vbandeiraConcCartao.dataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoBandeira2);
  
  vcreditosPendConcCartao := TCreditosPendConfere.create;

  vcreditosPendDataConcCartao := TCreditosPendDataConfere.create;

  fTempPendConcCartao := TClientDataSet.Create(nil);
  fTempPendConcCartao.Name := 'fTempPendConcCartao';
  fTempPendConcCartao.Close;
  fTempPendConcCartao.FieldDefs.Clear;
  for I := 0 to vdataSetTemp.Fields.Count - 1 do
  	fTempPendConcCartao.FieldDefs.Add(vdataSetTemp.Fields[i].FieldName, vdataSetTemp.Fields[i].DataType, vdataSetTemp.Fields[i].Size, False);

  if fTempPendConcCartao.Tag = 0 then
  try
    fTempPendConcCartao.CreateDataSet;
    fTempPendConcCartao.Tag := 1;
                                          
    for I := 0 to vdataSetTemp.Fields.Count - 1 do
    begin
    	fTempPendConcCartao.FieldByName(vdataSetTemp.Fields[i].FieldName).DisplayLabel := vdataSetTemp.Fields[i].DisplayName;
      if vdataSetTemp.Fields[i].FieldName = 'SEL' then
      	fTempPendConcCartao.FieldByName(vdataSetTemp.Fields[i].FieldName).Tag := 2
      else
	      fTempPendConcCartao.FieldByName(vdataSetTemp.Fields[i].FieldName).Tag := vdataSetTemp.Fields[i].Tag;

      if (vdataSetTemp.Fields[i].DataType = ftInteger) or (vdataSetTemp.Fields[i].DataType = ftFloat) then
        TFloatField(fTempPendConcCartao.FieldByName(vdataSetTemp.Fields[i].FieldName)).DisplayFormat :=
          TFloatField(vdataSetTemp.FieldByName(vdataSetTemp.Fields[i].FieldName)).DisplayFormat;
    end;

    fTempPendConcCartaoDtSource := TDataSource.Create(nil);
    fTempPendConcCartaoDtSource.DataSet := fTempPendConcCartao;
  except
  end;

  fTempPendConcCartao.EmptyDataSet;

  vSQL := ' select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, BANK_SHIPPING_DATE, ' +
    ' ID, COD_EMPRESA, ARQUIVO, DATA_ARQUIVO, ESTABLISHMENT_NUMBER, NSU, AUTHORIZATION_NUMBER,  ' +
		' TYPE_, TYPE_DESCRIPTION, ' +
    ' ACQUIRER_ID, ACQUIRER_NAME, ' +
    ' BRAND_ID, BRAND_NAME, ' +
    ' EVENT_TYPE, EVENT_TYPE_DESCRIPTION, DESCRIPTION, ' +
    ' BANK_RECON_STATUS, BANK_RECON_DESCRIPTION, ' +
    ' GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT, GROSS_EVENT_AMOUNT, BATCH_GROSS_AMOUNT, ' +
    ' TAX, SALE_TAX, CUSTOMER_TAX, ' +
    ' INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, ' +
    ' BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER, ' +
    ' IDENTIFICACAO_EMP, ' +
    ' CODIGO_CTRL, NOME_CTRL, ' +
    ' CODIGO_CTRL_TX, NOME_CTRL_TX, N_CONTA_PLC_TX_CARTAO, ' +
    ' N_CONTA_PLC, DESC_PLC, ' +
    ' COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, ' +
    ' VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, DATA_REC_C, DATA_VENC_C, DATQ_C, STATUS_C, TAXA_CRED, ' +
    ' COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, ' +
    ' COD_BANDEIRA_ADM, DESC_BANDEIRA_ADM, PIX_ID, ' +
    ' FORM_PAG_COD, FORM_PAG, COD_AJUSTE_COD, COD_AJUSTE, BANDEIRA_COD, BANDEIRA, ' +
    ' STATUS_PAG_COD, STATUS_PAG, STATUS_PAG_ST, ' +
    ' TIPO_LANCAMENTO_COD, TIPO_LANCAMENTO, TIPO_LIQUIDACAO_COD, TIPO_LIQUIDACAO, ' +
    ' TIPO_ANTECIPACAO_COD, TIPO_ANTECIPACAO, TIPO_CARTAO_COD, TIPO_CARTAO, ' +
    ' MOTIVO_REJ_COD, MOTIVO_REJ, GRUPO_CARTAO_COD, GRUPO_CARTAO, ' +
    ' TIPO_TRANSACAO_COD, TIPO_TRANSACAO, STATUS_TRANSF_COD, STATUS_TRANSF, STATUS_TRANSF_ST, ' +
    ' ORIGEM_AJUSTE_COD, ORIGEM_AJUSTE ' +
    ' from VW_CONCILIACAO_PENDENCIAS_CONF ';
end;

procedure TPendenciasConfere.desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if dataSet.IsEmpty then
    	exit;

    dataset.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
  finally
  	dataSet.First;
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TPendenciasConfere.desmarcarTodosTemp(pDataset: TDataset);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if pDataset.IsEmpty then
    	exit;

    pDataset.DisableControls;
    pDataset.First;
    while not pDataset.Eof do
    begin
      pDataset.Edit;
      pDataset.FieldByName('sel').AsString := '';
      pDataset.Post;
      pDataset.Next;
    end;
  finally
  	pDataset.First;
    pDataset.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

destructor TPendenciasConfere.Destroy;
begin
  vunificadasConcCartao.Free;
  vunificadasConcCartao := nil;

  vnumestConcCartao.Free;
  vnumestConcCartao := nil;

	vadmcartaoConcCartao.Free;
  vadmcartaoConcCartao := nil;

  vbandeiraConcCartao.Free;
  vbandeiraConcCartao := nil;

  vcreditosPendConcCartao.Free;
  vcreditosPendConcCartao := nil;

  vcreditosPendDataConcCartao.Free;
  vcreditosPendDataConcCartao := nil;
  
  inherited;
end;

function TPendenciasConfere.excluir: boolean;
var
	vId, vNumParc, vQtdeParc, vCodEmpresa: Integer;
  vTemp: string;
begin
	try
    Result := False;

    if dataSet.IsEmpty then
    begin
    	Application.MessageBox('Documento selecionado não é pendencia', 'Atenção', MB_ICONERROR + MB_OK);
    	exit;
    end;

    if not vDadosIni.PesqPros('IMPFIN039', 'EXCLUIR', '', 'CONCILIACAO_FINANCEIRO', '', buscas, false) then
  		exit;

    try
      dataset.DisableControls;
      dataSet.Filtered := false;
      dataSet.Filter := 'SEL = ''S'' ';
      dataSet.Filtered := true;

      if dataSet.IsEmpty then
      begin
      	Application.MessageBox('Nenhum registro selecionado', 'Atenção', MB_ICONERROR + MB_OK);
	    	exit;
      end;

      vtemp := 'Tem certeza que deseja excluir os ' +
      	IntToStr(dataSet.RecordCount) + ' registros selecionado' +
        vDadosIni.IfThen(dataSet.RecordCount > 0, 's', '') + '?';

      if Application.MessageBox(PChar(vtemp),
		      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
  			    Exit;

      dataSet.First;
      while not dataSet.Eof do
      begin
      	if dataSet.FieldByName('SEL').AsString = 'S' then
        begin
          vId := dataSet.FieldByName('ID').AsInteger;
          vNumParc := dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger;
          vQtdeParc := dataSet.FieldByName('INSTALLMENTS_TOTAL').AsInteger;
          vCodEmpresa := dataSet.FieldByName('COD_EMPRESA').AsInteger;

          buscas.Close;
          buscas.SQL.Text := 'DELETE FROM CONCILIACAO_FINANCEIRO ' +
          	' WHERE ID = :ID ' +
            ' AND INSTALLMENT_NUMBER = :INSTALLMENT_NUMBER ' +
            ' AND INSTALLMENTS_TOTAL = :INSTALLMENTS_TOTAL ' +
            ' AND COD_EMPRESA = :COD_EMPRESA ';
          buscas.ParamByName('ID').AsInteger := vId;
          buscas.ParamByName('INSTALLMENT_NUMBER').AsInteger := vNumParc;
          buscas.ParamByName('INSTALLMENTS_TOTAL').AsInteger := vQtdeParc;
          buscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
          buscas.ExecSQL;

          vDadosIni.GravaAuditoria('IMPFIN039', 'EXCLUIR',
            'Id ' + IntToStr(vId) +
          	' Num Parc ' + IntToStr(vNumParc) +
            ' Qtde Parc ' + IntToStr(vQtdeParc) +
            ' Cod Emp ' + IntToStr(vCodEmpresa),
          	'CONCILIACAO_FINANCEIRO', IntToStr(vId), buscas);
        end;

       	dataSet.Next;
      end;
    finally
    	dataSet.Filtered := false;
      dataSet.First;
      dataset.EnableControls;
    end;

    if buscas.Transaction.InTransaction then
    	buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('IMPFIN039', 'EXCLUIR', 'SUCESSO', 'CONCILIACAO_FINANCEIRO', '', buscas);

	  Refresh;

    Result := True;
  except
    on e: exception do
    begin
      Result := false;
      vDadosIni.GravaAuditoria('IMPFIN039', 'EXCLUIR', 'FALHA', 'CONCILIACAO_FINANCEIRO', '', buscas);
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TPendenciasConfere.localizarPendencias(
	pNSU: string;
  pNumAutorizacao: string;
  pValorCred: Double;
  pValorLiq: Double;
  pNumParc: Integer): boolean;
var
	vNSU: string;
  vNumAutorizacao: string;
  vNumParc: Integer;
  vValorCred: Double;
  vValorLiq: Double;
  vtempSql: string;

  vIds: string;
  vIdsValor: string;
begin
	vIds := '';
  vIdsValor := '';
	try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
    	vNSU := dataSet.FieldByName('NSU').AsString;
      vNumAutorizacao := dataSet.FieldByName('AUTHORIZATION_NUMBER').AsString;
      vNumParc := dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger;
      vValorCred := dataSet.FieldByName('GROSS_AMOUNT').AsFloat;
      vValorLiq := dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;	

      if (trim(vNSU) <> '')
      	and (trim(pNSU) <> '')
      	and (vDadosIni.localizarCreditoFinanceiro(vNSU, pNSU))
        and (vDadosIni.StrToFloatFormat(Abs(vValorCred), 2) = vDadosIni.StrToFloatFormat(Abs(pValorCred), 2))
        and (Pos(',' + IntToStr(dataSet.FieldByName('ID').AsInteger) + ',', ',' + vIds) <= 0) then
        	vIds := vIds + IntToStr(dataSet.FieldByName('ID').AsInteger) + ','
      else if (trim(vNumAutorizacao) <> '')
      	and (trim(pNumAutorizacao) <> '')
				and (vDadosIni.localizarCreditoFinanceiro(vNumAutorizacao, pNumAutorizacao))
        and (vDadosIni.StrToFloatFormat(Abs(vValorCred), 2) = vDadosIni.StrToFloatFormat(Abs(pValorCred), 2))
        and (Pos(',' + IntToStr(dataSet.FieldByName('ID').AsInteger) + ',', ',' + vIds) <= 0) then
	        	vIds := vIds + IntToStr(dataSet.FieldByName('ID').AsInteger) + ','
      else if (trim(vNSU) <> '')
      	and (trim(pNSU) <> '')
      	and (vDadosIni.localizarCreditoFinanceiro(vNSU, pNSU))
        and (vDadosIni.StrToFloatFormat(Abs(vValorLiq), 2) = vDadosIni.StrToFloatFormat(Abs(pValorLiq), 2))
        and (Pos(',' + IntToStr(dataSet.FieldByName('ID').AsInteger) + ',', ',' + vIds) <= 0) then
        	vIds := vIds + IntToStr(dataSet.FieldByName('ID').AsInteger) + ','
      else if (trim(vNumAutorizacao) <> '')
      	and (trim(pNumAutorizacao) <> '')
				and (vDadosIni.localizarCreditoFinanceiro(vNumAutorizacao, pNumAutorizacao))
        and (vDadosIni.StrToFloatFormat(Abs(vValorLiq), 2) = vDadosIni.StrToFloatFormat(Abs(pValorLiq), 2))
        and (Pos(',' + IntToStr(dataSet.FieldByName('ID').AsInteger) + ',', ',' + vIds) <= 0) then
	        	vIds := vIds + IntToStr(dataSet.FieldByName('ID').AsInteger) + ',';

      dataSet.Next;
    end;
  finally
	  dataSet.First;
    dataSet.EnableControls;
  end;

  if (trim(vIds) <> '') then
  begin
  	try
    	vDadosIni.abreStatusProcessamento('', 'Localizando registros administradora...');
      
      vIds := Copy(vIds, 1, Length(vIds) - 1);

      vtempSql := vSQL +
        ' where id in (' + vIds + ')';
      result := montaSelect(vtempSql);
    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  end;
end;

procedure TPendenciasConfere.marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TPendenciasConfere.marcaDesmarcaLinhaTemp(pDataset: TDataset);
begin
	if pDataset.IsEmpty then
    exit;

  pDataset.Edit;
  if pDataset.FieldByName('SEL').AsString = 'S' then
    pDataset.FieldByName('SEL').AsString := ''
  else
    pDataset.FieldByName('SEL').AsString := 'S';
  pDataset.Post;
end;

procedure TPendenciasConfere.marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if dataSet.IsEmpty then
    	exit;

    dataset.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
  finally
  	dataSet.First;
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TPendenciasConfere.marcarTodosTemp(pDataset: TDataset);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if pDataset.IsEmpty then
    	exit;

    pDataset.DisableControls;
    pDataset.First;
    while not pDataset.Eof do
    begin
      pDataset.Edit;
      pDataset.FieldByName('sel').AsString := 'S';
      pDataset.Post;
      pDataset.Next;
    end;
  finally
  	pDataset.First;
    pDataset.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TPendenciasConfere.resolverPendencias(pDataset: TDataset): boolean;
var
	I: Integer;
begin
	try
  	fTempPendConcCartao.EmptyDataSet;

  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
    	vDadosIni.abreStatusProcessamento('', 'Aguarde. Verificando registros ' +
      	'(' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

      if (trim(dataSet.FieldByName('AUTHORIZATION_NUMBER').AsString) <> '')
        and (dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger > 0) then
      begin
      	try
          pDataset.Filter := 'N_AUT_CART = ' + QuotedStr(dataSet.FieldByName('AUTHORIZATION_NUMBER').AsString) +
          	' AND NPARCELA = ' + IntToStr(dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger) +
            ' AND COD_EMP_MULT = ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger);
          pDataset.Filtered := true;

          if not pDataset.IsEmpty then
          begin
          	fTempPendConcCartao.Insert;
            for I := 0 to fTempPendConcCartao.Fields.Count - 1 do
            	if not dataSet.Fields[I].IsNull then
	              fTempPendConcCartao.FieldByName(dataSet.Fields[I].FieldName).Value := dataSet.Fields[I].Value;
            fTempPendConcCartao.FieldByName('COD_CRED').AsInteger := pDataset.FieldByName('COD_CRED').AsInteger;
            fTempPendConcCartao.FieldByName('N_DOC_V').AsInteger := pDataset.FieldByName('N_DOC_V').AsInteger;
            fTempPendConcCartao.FieldByName('N_DOC_C').AsString := pDataset.FieldByName('N_DOC_C').AsString;
            fTempPendConcCartao.FieldByName('TP_DOC_V').AsString := pDataset.FieldByName('TP_DOC_V').AsString;
            fTempPendConcCartao.FieldByName('VALOR_C').AsFloat := pDataset.FieldByName('VALOR_C').AsFloat;
            fTempPendConcCartao.FieldByName('VALOR_LIQUIDO').AsFloat := pDataset.FieldByName('VALOR_LIQUIDO').AsFloat;
            if (fTempPendConcCartao.FieldByName('VALOR_ORIGINAL').AsFloat > 0)
            	and (pDataset.FieldByName('VALOR_LIQUIDO').AsFloat > 0)
              and (fTempPendConcCartao.FieldByName('VALOR_ORIGINAL').AsFloat <> pDataset.FieldByName('VALOR_LIQUIDO').AsFloat) then
              	fTempPendConcCartao.FieldByName('TAXA_CRED').AsFloat := 100 - ((pDataset.FieldByName('VALOR_LIQUIDO').AsFloat / fTempPendConcCartao.FieldByName('VALOR_ORIGINAL').AsFloat) * 100)
            else if (fTempPendConcCartao.FieldByName('VALOR_C').AsFloat > 0)
            	and (pDataset.FieldByName('VALOR_LIQUIDO').AsFloat > 0)
              and (fTempPendConcCartao.FieldByName('VALOR_C').AsFloat <> pDataset.FieldByName('VALOR_LIQUIDO').AsFloat) then
                fTempPendConcCartao.FieldByName('TAXA_CRED').AsFloat := 100 - ((pDataset.FieldByName('VALOR_LIQUIDO').AsFloat / fTempPendConcCartao.FieldByName('VALOR_C').AsFloat) * 100)
            else
            		fTempPendConcCartao.FieldByName('TAXA_CRED').AsFloat := 0;
            if not pDataset.FieldByName('DATA_REC_C').IsNull then
	            fTempPendConcCartao.FieldByName('DATA_REC_C').AsDateTime := pDataset.FieldByName('DATA_REC_C').AsDateTime;
            if not pDataset.FieldByName('DATA_VENC_C').IsNull then
	            fTempPendConcCartao.FieldByName('DATA_VENC_C').AsDateTime := pDataset.FieldByName('DATA_VENC_C').AsDateTime;
            if not pDataset.FieldByName('DATQ_C').IsNull then
	            fTempPendConcCartao.FieldByName('DATQ_C').AsDateTime := pDataset.FieldByName('DATQ_C').AsDateTime;
            fTempPendConcCartao.FieldByName('STATUS_C').AsString := pDataset.FieldByName('STATUS_C').AsString;
            fTempPendConcCartao.FieldByName('COD_TERMINAL_ADM').AsString := pDataset.FieldByName('COD_TERMINAL_ADM').AsString;
            fTempPendConcCartao.FieldByName('DESC_TERM_ADM').AsString := pDataset.FieldByName('DESC_TERM_ADM').AsString;
            fTempPendConcCartao.FieldByName('COD_ADM').AsInteger := pDataset.FieldByName('COD_ADM').AsInteger;
            fTempPendConcCartao.FieldByName('DESCRICAO_ADM').AsString := pDataset.FieldByName('DESCRICAO_ADM').AsString;
            fTempPendConcCartao.FieldByName('COD_BANDEIRA_ADM').AsInteger := pDataset.FieldByName('COD_BANDEIRA_ADM').AsInteger;
            fTempPendConcCartao.FieldByName('DESC_BANDEIRA_ADM').AsString := pDataset.FieldByName('DESC_BANDEIRA_ADM').AsString;
            fTempPendConcCartao.Post;
          end;
        finally
          pDataset.Filtered := true;
        end;
      end;

      dataSet.Next;
    end;
  finally
  	dataSet.First;
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TPendenciasConfere.vincularCreditos: boolean;
begin
	try
    Result := false;

    if fTempPendConcCartao.IsEmpty then
    begin
    	Application.MessageBox(pchar('Nenhum crédito selecionado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if not vDadosIni.PesqPros('IMPFIN040', 'VINCULAR', '', 'CONTROLE_CREDITOS', '', buscas, True) then
	    Exit;

    try
      fTempPendConcCartao.Filtered := False;
      fTempPendConcCartao.Filter := 'SEL = ''S'' ';
      fTempPendConcCartao.Filtered := True;

      if fTempPendConcCartao.IsEmpty then
      begin
      	Application.MessageBox(pchar('Nenhum crédito selecionado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
        exit;
      end;

      try
      	fTempPendConcCartao.DisableControls;
        fTempPendConcCartao.First;
        while not fTempPendConcCartao.Eof do
        begin
        	vDadosIni.abreStatusProcessamento('', 'Aguarde. Resolvendo pendências ' +
      			'(' + IntToStr(fTempPendConcCartao.RecNo) + '/' + IntToStr(fTempPendConcCartao.RecordCount) + ')');

          buscas.Close;
          buscas.SQL.Text := 'UPDATE CONTROLE_CREDITOS SET ' +
            ' N_DOCNSU_ADM = :N_DOCNSU_ADM,';

          if trim(fTempPendConcCartao.FieldByName('AUTHORIZATION_NUMBER').AsString) <> '' then
            buscas.SQL.Text := buscas.SQL.Text + ' N_AUT_CART = :N_AUT_CART,';

          buscas.SQL.Text := Copy(trim(buscas.SQL.Text), 1, Length(trim(buscas.SQL.Text)) - 1);
          buscas.SQL.Text := buscas.SQL.Text + ' WHERE N_AUT_CART = :N_AUT_CART ';
          buscas.SQL.Text := buscas.SQL.Text + ' AND NPARCELA = :NPARCELA ';
          buscas.SQL.Text := buscas.SQL.Text + ' AND COD_EMP_MULT = :COD_EMP_MULT ';

          buscas.ParamByName('N_DOCNSU_ADM').AsString := fTempPendConcCartao.FieldByName('NSU').AsString;
          buscas.ParamByName('N_AUT_CART').AsString := fTempPendConcCartao.FieldByName('AUTHORIZATION_NUMBER').AsString;
          buscas.ParamByName('NPARCELA').AsInteger := fTempPendConcCartao.FieldByName('INSTALLMENT_NUMBER').AsInteger;
          buscas.ParamByName('COD_EMP_MULT').AsInteger := fTempPendConcCartao.FieldByName('COD_EMPRESA').AsInteger;
          buscas.ExecSQL;

          vDadosIni.GravaAuditoria('IMPFIN040', 'VINCULAR', 'EMP ' + fTempPendConcCartao.FieldByName('COD_EMPRESA').AsString, 'CONTROLE_CREDITOS', fTempPendConcCartao.FieldByName('COD_CRED').AsString, buscas);

          fTempPendConcCartao.Next;
        end;
        fTempPendConcCartao.First;
        Result := True;

        if Result then
        begin
          Result := CommitaTransacao;
          vDadosIni.GravaAuditoria('IMPFIN040', 'VINCULAR', 'SUCESSO', 'CONTROLE_CREDITOS', '', buscas);
        end
        else
        begin
          RollBackTransacao;
          vDadosIni.GravaAuditoria('IMPFIN040', 'VINCULAR', 'FALHA', 'CONTROLE_CREDITOS', '', buscas);
        end;
      finally
        fTempPendConcCartao.EnableControls;
        vDadosIni.fechaStatusProcessamento;
      end;
    finally
    	fTempPendConcCartao.Filtered := False;
    end;
  except
    on e: exception do
    begin
      Result := false;
      RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TCreditosConfere }

function TCreditosConfere.abreCreditos(pCodCred: Integer; pCodEmpresa: Integer): boolean;
begin
	Result := montaSelect('select * from controle_creditos ' +
  	' where COD_CRED = ' + IntToStr(pCodCred) +
    ' and COD_EMP_MULT = ' + IntToStr(pCodEmpresa));
end;

constructor TCreditosConfere.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsCtrlCrConciliacao);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

{ TConciliacartaoAdmCartao }

function TConciliacartaoAdmCartao.abreConciliacartaoAdmCartao: boolean;
begin
  result := montaSelect(' select ''A'' as ordem, ' +
 		' 0 id, ' +
    ' ''Todos'' nome, ' +
    ' 0 cod_adm ' +
    ' from rdb$database ' +
  	' union all ' +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
    	' select conciliacao_adquirente.nome as ordem, ' +
      ' conciliacao_adquirente.id, ' +
      ' conciliacao_adquirente.nome, ' +
      ' coalesce((select first 1 adm_cartao.cod_adquirente from adm_cartao ' +
      ' 			    where adm_cartao.cod_adquirente = conciliacao_adquirente.id ' +
      '           and adm_cartao.cod_empresa = ' + vDadosIni.codEmpresa +
      '           and adm_cartao.ativo = 1), 0) cod_adm ' +
      ' from conciliacao_adquirente ' +
      ' where conciliacao_adquirente.ativo = 1 ',
      ' select distinct conciliacao_adquirente.nome as ordem, ' +
      ' conciliacao_adquirente.id, ' +
      ' conciliacao_adquirente.nome, ' +
      ' case when (coalesce((select first 1 adm_cartao.cod_adquirente from adm_cartao ' +
      ' 				  where adm_cartao.cod_adquirente = conciliacao_adquirente.id ' +
      ' 					and adm_cartao.cod_empresa = ' + vDadosIni.codEmpresa +
      ' 					and adm_cartao.ativo = 1), 0) > 0) then' +
      '							coalesce((select first 1 adm_cartao.cod_adquirente from adm_cartao ' +
      ' 				    where adm_cartao.cod_adquirente = conciliacao_adquirente.id ' +
      ' 					  and adm_cartao.cod_empresa = ' + vDadosIni.codEmpresa +
      ' 					  and adm_cartao.ativo = 1), 0) ' +
      '      else ' +
      '							coalesce((select first 1 adm_cartao.cod_adquirente from adm_cartao ' +
      ' 				    where adm_cartao.cod_adquirente = conciliacao_adquirente.id ' +
      ' 					  and adm_cartao.cod_empresa = ' + vDadosIni.codEmpresa +
      ' 					  and adm_cartao.ativo = 1), 0) ' +
      ' end cod_adm ' +
      ' from conciliacao_adquirente  ' +
      ' where conciliacao_adquirente.ativo = 1 ') +
    ' order by 1 ');
end;

constructor TConciliacartaoAdmCartao.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsAdmCartaoConciliacao);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

{ TConciliaUnificadas }

function TConciliaUnificadas.abreConciliacartaoUnificadas: boolean;
begin
	Result := montaSelect(
  	vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
    	' select ' + vDadosIni.codEmpresa + ' cod_empresa, ' + QuotedStr(vDadosIni.vEmp.vnomeEmpresa) + ' identificacao_emp from rdb$database ',
  		' select 0 cod_empresa, ' +
      ' ''Todos'' identificacao_emp from rdb$database ' +
    	' union all ' +
  		' select cod_empresa, ' +
      ' (coalesce(cod_empresa, 0) || '' - '' || coalesce(identificacao_emp, nome_emp) || '' - '' || coalesce(cgc_emp, '''')) identificacao_emp from empresa ' +
  		' where financeiro_unificado = ''S'' ' +
			' and codigo_unificadora = ' + vDadosIni.codEmpresa +
      ' and ativo = 1 '));
end;

constructor TConciliaUnificadas.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoUnificadas);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

{ TConciliacartaoBandeira }

function TConciliacartaoBandeira.abreConciliacartaoBandeira: boolean;
begin
	Result := montaSelect(' select ''A'' ordem, ' +
  	' 0 id, ' +
    ' ''Todos'' nome, ' +
    ' 0 cod_bandeira ' +
    ' from rdb$database ' +
  	' union all ' +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	    ' select conciliacao_bandeira.nome as ordem, ' +
      ' conciliacao_bandeira.id, ' +
      ' conciliacao_bandeira.nome as nome, ' +
      ' coalesce((select first 1 bandeiras_cartao.cod_bandeira from bandeiras_cartao ' +
      '           where upper(bandeiras_cartao.descricao) = upper(conciliacao_bandeira.nome) ' +
      '           and bandeiras_cartao.ativo = 1), 0) cod_bandeira ' +
      ' from conciliacao_bandeira ' +
  	  ' where conciliacao_bandeira.ativo = 1 ',
      ' select distinct conciliacao_bandeira.nome as ordem, ' +
      ' conciliacao_bandeira.id, ' +
      ' conciliacao_bandeira.nome as nome, ' +
      ' case when (coalesce((select first 1 bandeiras_cartao.cod_bandeira from bandeiras_cartao ' +
      '           where upper(bandeiras_cartao.descricao) = upper(conciliacao_bandeira.nome) ' +
      '           and bandeiras_cartao.cod_empresa = ' + vDadosIni.codEmpresa +
      '						and bandeiras_cartao.ativo = 1), 0) > 0) then ' +
      '             coalesce((select first 1 bandeiras_cartao.cod_bandeira from bandeiras_cartao ' +
      '             where upper(bandeiras_cartao.descricao) = upper(conciliacao_bandeira.nome) ' +
      '             and bandeiras_cartao.cod_empresa = ' + vDadosIni.codEmpresa +
      '						  and bandeiras_cartao.ativo = 1), 0) ' +
      '      else ' +
      '             coalesce((select first 1 bandeiras_cartao.cod_bandeira from bandeiras_cartao ' +
      '             where upper(bandeiras_cartao.descricao) = upper(conciliacao_bandeira.nome) ' +
      '             and bandeiras_cartao.cod_empresa = ' + vDadosIni.codEmpresa +
      '						  and bandeiras_cartao.ativo = 1), 0) ' +
      ' end cod_bandeira ' +
      ' from conciliacao_bandeira ' +
      ' where conciliacao_bandeira.ativo = 1 ') +
      ' order by 1 ');
end;

constructor TConciliacartaoBandeira.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoBandeira);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrConciliacaoCielo);
end;

{ TCreditosPendConfere }

function TCreditosPendConfere.abreCreditos(pTempSqlData: string; pTempSql: string): boolean;
var
	vtempSql: string;
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Consultando registros financeiros não encontrados na conciliação...');

    vUltSQL := '';
    
    vTotCredAbertos := 0;

    vtempSql := vSQL +
      ' where ' + pTempSqlData +
      pTempSql +
      ' order by DATA_REC_C, COD_EMP_MULT ';

    result := montaSelect(vtempSql);

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      vTotCredAbertos := vTotCredAbertos + dataSet.FieldByName('VALOR_LIQUIDO').AsFloat;

    	dataSet.Next;
    end;
  finally
  	dataSet.First;
	  dataSet.EnableControls;

    if trim(vtempSql) <> '' then
      vUltSQL := vtempSql;
      
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TCreditosPendConfere.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsCtrlCrConciliacao2);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  vSQL :=
    ' select COD_CRED, CODIGO_EMP, COD_EMP_MULT, ' +
    ' DATA_REC_C, DATA_VENC_C, ' +
    '	N_DOCNSU_ADM, N_AUT_CART, ' +
    ' NPARCELA, QTDE_PARC, ' +
    ' CODIGO_CTRL, NOME_CTRL, ' +
    ' N_DOC_V, N_DOC_C, TP_DOC_V, ' +
    ' VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, ' +
    ' DATQ_C, STATUS_C, TAXA_CRED, ' +
    ' COD_CLIENTE, ' +
    ' NOME_CLIENTE, ' +
    ' COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, ' +
    ' COD_BANDEIRA_ADM, DESC_BANDEIRA_ADM, ' +
    ' NOME_C, IDENTIFICACAO_EMP ' +
    ' from VW_CONCILIACAO_PENDENCIAS_CRED ';
end;

function TCreditosPendConfere.localizarCreditos(
	pNSU: string;
  pNumAutorizacao: string;
  pValorCred: Double;
  pValorLiq: Double;
  pNumParc: Integer): boolean;
var
  vNSU: string;
  vNumAutorizacao: string;
  vNumParc: Integer;
  vValorCred: Double;
  vValorLiq: Double;
  vtempSql: string;

  vCodCred: string;
begin
	vCodCred      := '';
  try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
    	vNSU := dataSet.FieldByName('N_DOCNSU_ADM').AsString;
      vNumAutorizacao := dataSet.FieldByName('N_AUT_CART').AsString;
      vNumParc := dataSet.FieldByName('NPARCELA').AsInteger;
      vValorCred := dataSet.FieldByName('VALOR_C').AsFloat;
      vValorLiq := dataSet.FieldByName('VALOR_LIQUIDO').AsFloat;

      if (trim(vNSU) <> '')
      	and (trim(pNSU) <> '')
        and (vDadosIni.localizarCreditoFinanceiro(vNSU, pNSU))
        and (vDadosIni.StrToFloatFormat(Abs(vValorCred), 2) = vDadosIni.StrToFloatFormat(Abs(pValorCred), 2)) then
        	vCodCred := vCodCred + IntToStr(dataSet.FieldByName('COD_CRED').AsInteger) + ','
      else if (trim(vNumAutorizacao) <> '')
      	and (trim(pNumAutorizacao) <> '')
        and (vDadosIni.localizarCreditoFinanceiro(vNumAutorizacao, pNumAutorizacao))
        and (vDadosIni.StrToFloatFormat(Abs(vValorCred), 2) = vDadosIni.StrToFloatFormat(Abs(pValorCred), 2)) then
        	vCodCred := vCodCred + IntToStr(dataSet.FieldByName('COD_CRED').AsInteger) + ','
      else if (trim(vNSU) <> '')
      	and (trim(pNSU) <> '')
        and (vDadosIni.localizarCreditoFinanceiro(vNSU, pNSU))
        and (vDadosIni.StrToFloatFormat(Abs(vValorLiq), 2) = vDadosIni.StrToFloatFormat(Abs(pValorLiq), 2)) then
        	vCodCred := vCodCred + IntToStr(dataSet.FieldByName('COD_CRED').AsInteger) + ','
    	else if (trim(vNumAutorizacao) <> '')
      	and (trim(pNumAutorizacao) <> '')
        and (vDadosIni.localizarCreditoFinanceiro(vNumAutorizacao, pNumAutorizacao))
        and (vDadosIni.StrToFloatFormat(Abs(vValorLiq), 2) = vDadosIni.StrToFloatFormat(Abs(pValorLiq), 2)) then
        	vCodCred := vCodCred + IntToStr(dataSet.FieldByName('COD_CRED').AsInteger) + ',';

      dataSet.Next;
    end;
  finally
    dataSet.First;
    dataSet.EnableControls;
  end;

  if (trim(vCodCred) <> '') then
  begin
  	try
    	vDadosIni.abreStatusProcessamento('', 'Localizando registros financeiros em aberto...');

      vCodCred := Copy(vCodCred, 1, Length(vCodCred) - 1);

      vtempSql := vSQL +
        ' where COD_CRED in (' + vCodCred + ')';
      result := montaSelect(vtempSql);

    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  end
end;

function TCreditosPendConfere.vincularCreditos(
	pId: Integer;
  pNumParc: Integer;
  pQtdeParc: Integer;
  pCodEmpresa: Integer;
  pValorBruto: Double;
  pValorLiq: Double;
  pNSU: string;
  pNumAutorizacao: string): boolean;
var
	vCodCred: Integer;
begin
	try
    Result := False;
    if dataset.IsEmpty then
      exit;

    vCodCred := dataset.FieldByName('COD_CRED').AsInteger;

    if not vDadosIni.PesqPros('IMPFIN038', 'VINCULAR', 'Cod Cred ' + IntToStr(vCodCred),
      'CONCILIACAO_FINANCEIRO', IntToStr(pId), buscas, false) then
        exit;

    if pNumParc <> dataset.FieldByName('NPARCELA').AsInteger then
    begin
      Application.MessageBox(Pchar('Número da parcela (Administradora) diferente do número da parcela (Financeiro): ' + #13+
        'Parcela (Administradora): ' + IntToStr(pNumParc) + #13+
        'Parcela (Financeiro): ' + IntToStr(dataset.FieldByName('NPARCELA').AsInteger) + #13+
        'Favor verificar antes de continuar'),
        'Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
      exit;
    end;

    if Abs(pValorBruto) <> Abs(dataset.FieldByName('VALOR_C').AsFloat) then
  	begin
      Application.MessageBox(Pchar('Valor Bruto (Administradora) diferente do valor bruto (Financeiro): ' + #13+
        'Valor Bruto (Administradora): ' + FloatToStr(Abs(pValorBruto)) + #13+
        'Valor Bruto (Financeiro): ' + FloatToStr(Abs(dataset.FieldByName('VALOR_C').AsInteger)) + #13+
        'Favor verificar antes de continuar'),
        'Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
      exit;
    end;

    if pCodEmpresa <> dataset.FieldByName('COD_EMP_MULT').AsInteger then
    begin
      Application.MessageBox(Pchar('Código da Empresa (Administradora) diferente do código da empresa (Financeiro): ' + #13+
        'Empresa (Administradora): ' + IntToStr(pCodEmpresa) + #13+
        'Empresa (Financeiro): ' + IntToStr(dataset.FieldByName('COD_EMP_MULT').AsInteger) + #13 +
        'Favor verificar antes de continuar'),
        'Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
      exit;
    end;

    if Application.MessageBox('Deseja vincular registro da administradora ao registro financeiro em aberto?',
      'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYes then
    begin
      Result := False;
      exit;
    end;

    try
    	vDadosIni.abreStatusProcessamento('', 'Vinculando registro financeiro com registro administradora...');
      
      buscas.Close;
      buscas.SQL.Text := 'UPDATE CONTROLE_CREDITOS SET ';
      if (trim(pNSU) <> '') then
        buscas.SQL.Text := buscas.SQL.Text + ' N_DOCNSU_ADM = :N_DOCNSU_ADM';

      if (trim(pNSU) <> '') and (trim(pNumAutorizacao) <> '') then
        buscas.SQL.Text := buscas.SQL.Text + ',';

      if (trim(pNumAutorizacao) <> '') then
        buscas.SQL.Text := buscas.SQL.Text + ' N_AUT_CART = :N_AUT_CART ';

      buscas.SQL.Text := buscas.SQL.Text +
        ' WHERE COD_CRED = :COD_CRED AND CODIGO_EMP = :CODIGO_EMP ';

      if (trim(pNSU) <> '') then
        buscas.ParamByName('N_DOCNSU_ADM').AsString := pNSU;
      if (trim(pNumAutorizacao) <> '') then
        buscas.ParamByName('N_AUT_CART').AsString := pNumAutorizacao;
      buscas.ParamByName('COD_CRED').AsInteger := dataSet.FieldByName('COD_CRED').AsInteger;
      buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('CODIGO_EMP').AsInteger;;
      buscas.ExecSQL;
      Result := True;

      if Result then
        Result := CommitaTransacao
      else
        RollBackTransacao;

      if Result then
        vDadosIni.GravaAuditoria('IMPFIN038', 'VINCULAR', 'SUCESSO',
          'CONCILIACAO_FINANCEIRO', IntToStr(pId), buscas)
      else
        vDadosIni.GravaAuditoria('IMPFIN038', 'VINCULAR', 'FALHA',
          'CONCILIACAO_FINANCEIRO', IntToStr(pId), buscas);

    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  except
    on e: exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TCreditosPendDataConfere }

function TCreditosPendDataConfere.abreCreditos(pTempSqlData,
  pTempSql: string): boolean;
var
	vtempSql: string;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Consultando registros financeiros com divergência de data...');

    vUltSQL := '';
    
    vTotCredPendData := 0;

    vtempSql := vSQL +
      ' where ' + pTempSqlData +
      pTempSql +
      ' and DATQ_C is null ' +
      ' and DATA_VENC_C is not null ' +
      ' and DATA_VENC_C < DATE_  ' +
      ' and coalesce(N_DOCNSU_ADM, '''') <> '''' ' +
      ' and coalesce(N_AUT_CART, '''') <> '''' ' +
      ' order by DATA_REC_C, COD_EMP_MULT ';

    result := montaSelect(vtempSql);

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      vTotCredPendData := vTotCredPendData + dataSet.FieldByName('VALOR_LIQUIDO').AsFloat;

    	dataSet.Next;
    end;
  finally
  	dataSet.First;
	  dataSet.EnableControls;

    if trim(vtempSql) <> '' then
      vUltSQL := vtempSql;
      
    vDadosIni.fechaStatusProcessamento;
  end;	
end;

constructor TCreditosPendDataConfere.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsCtrlCrConciliacao3);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  vSQL := ' select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, BANK_SHIPPING_DATE, ' +
   	' ID, ARQUIVO, DATA_ARQUIVO, ' +
  	' COD_CRED, CODIGO_EMP, COD_EMP_MULT, ' +
    ' DATA_REC_C, DATA_VENC_C, N_DOCNSU_ADM, N_AUT_CART, NPARCELA, QTDE_PARC, ' +
    ' CODIGO_CTRL, NOME_CTRL, N_DOC_V, N_DOC_C, TP_DOC_V, ' +
    ' VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, DATQ_C, STATUS_C, TAXA_CRED, ' +
    ' COD_CLIENTE, NOME_CLIENTE, ' +
    ' COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, COD_BANDEIRA_ADM, DESC_BANCEIRA_ADM, ' +
    ' NOME_C, IDENTIFICACAO_EMP ' +
    ' from VW_CONCILIACAO_CRED_DIV_DTVALOR ';
end;

{ TResolverPendenciasConfere }

function TResolverPendenciasConfere.abreConsultaResolverPendencias(pDataIni,
  pDataFim: TDateTime; pTempSql: string): boolean;
var
	vtempSql: string;
begin
  try
  	vUltSQL := '';
    
  	vtempSql := vSQL +
      ' where DATA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataIni)) +
      ' and DATA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataFim)) +
      pTempSql;

    Result := montaSelect(vtempSql);


  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
    	vDadosIni.abreStatusProcessamento('', 'Aguarde. Verificando registros ' +
      	'(' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

      if (trim(dataSet.FieldByName('AUTHORIZATION_NUMBER').AsString) <> '')
        and (dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger > 0) then
      begin
        buscas.Close;
        buscas.SQL.Text := ' select cc.cod_cred, cc.n_doc_v, cc.n_doc_c, cc.tp_doc_v, ' +
          ' cc.valor_c, cc.data_rec_c, cc.data_venc_c, cc.datq_c, cc.status_c, ' +
          ' cc.cod_terminal_adm, termc.desc_term_adm, cc.cod_adm, adm.descricao_adm, ' +
          ' cc.cod_bandeira_adm, band.descricao as desc_bandeira_adm from controle_creditos cc ' +
          ' left join terminal_cartao termc on ' +
          '    termc.cod_term_adm = cc.cod_terminal_adm ' +
          '    and termc.cod_empresa = cc.cod_emp_mult ' +
          ' left join adm_cartao adm on ' +
          '    adm.cod_adm = termc.cod_adm ' +
          '    and adm.cod_empresa = termc.cod_empresa ' +
          ' left join bandeiras_cartao band on ' +
          '    band.cod_bandeira = cc.cod_bandeira_adm ' +
          '    and band.cod_empresa = cc.cod_emp_mult ' +
          ' where cc.n_aut_cart = :n_aut_cart ' +
          ' and coalesce(cc.nparcela, 1) = coalesce(:nparcela, 1) ' +
          ' and cc.cod_emp_mult = :cod_emp_mult ';
        buscas.ParamByName('N_AUT_CART').AsString := dataSet.FieldByName('AUTHORIZATION_NUMBER').AsString;
        buscas.ParamByName('NPARCELA').AsInteger := dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger;
        buscas.ParamByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
        buscas.Open;

        if not buscas.IsEmpty then
        begin
          dataSet.Edit;
          dataSet.FieldByName('COD_CRED').AsInteger := buscas.FieldByName('COD_CRED').AsInteger;
          dataSet.FieldByName('N_DOC_V').AsInteger := buscas.FieldByName('N_DOC_V').AsInteger;
          dataSet.FieldByName('N_DOC_C').AsString := buscas.FieldByName('N_DOC_C').AsString;
          dataSet.FieldByName('TP_DOC_V').AsString := buscas.FieldByName('TP_DOC_V').AsString;
          dataSet.FieldByName('VALOR_C').AsFloat := buscas.FieldByName('VALOR_C').AsFloat;
          dataSet.FieldByName('DATA_REC_C').AsDateTime := buscas.FieldByName('DATA_REC_C').AsDateTime;
          dataSet.FieldByName('DATA_VENC_C').AsDateTime := buscas.FieldByName('DATA_VENC_C').AsDateTime;
          dataSet.FieldByName('DATQ_C').AsDateTime := buscas.FieldByName('DATQ_C').AsDateTime;
          dataSet.FieldByName('STATUS_C').AsString := buscas.FieldByName('STATUS_C').AsString;
          dataSet.FieldByName('COD_TERMINAL_ADM').AsString := buscas.FieldByName('COD_TERMINAL_ADM').AsString;
          dataSet.FieldByName('DESC_TERM_ADM').AsString := buscas.FieldByName('DESC_TERM_ADM').AsString;
          dataSet.FieldByName('COD_ADM').AsInteger := buscas.FieldByName('COD_ADM').AsInteger;
          dataSet.FieldByName('DESCRICAO_ADM').AsString := buscas.FieldByName('DESCRICAO_ADM').AsString;
          dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger := buscas.FieldByName('COD_BANDEIRA_ADM').AsInteger;
          dataSet.FieldByName('DESC_BANDEIRA_ADM').AsString := buscas.FieldByName('DESC_BANDEIRA_ADM').AsString;
        end;
      end;
      dataSet.Post;

      dataSet.Next;
    end;
  finally
  	dataSet.First;
    dataSet.EnableControls;

    if trim(vtempSql) <> '' then
      vUltSQL := vtempSql;
      
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TResolverPendenciasConfere.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoPendencias2);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  vSQL := ' select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, BANK_SHIPPING_DATE, ' +
  	' ID, COD_EMPRESA, NSU, AUTHORIZATION_NUMBER,  ' +
		' TYPE_, TYPE_DESCRIPTION, ' +
    ' ACQUIRER_ID, ACQUIRER_NAME, ' +
    ' BRAND_ID, BRAND_NAME, ' +
    ' EVENT_TYPE, EVENT_TYPE_DESCRIPTION, DESCRIPTION, ' +
    ' BANK_RECON_STATUS, BANK_RECON_DESCRIPTION, ' +
    ' GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT, GROSS_EVENT_AMOUNT, BATCH_GROSS_AMOUNT, ' +
    ' TAX, SALE_TAX, CUSTOMER_TAX, ' +
    ' INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, ' +
    ' BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER, ' +
    ' IDENTIFICACAO_EMP, ' +
    ' CODIGO_CTRL, NOME_CTRL, ' +
    ' CODIGO_CTRL_TX, NOME_CTRL_TX, N_CONTA_PLC_TX_CARTAO, ' +
    ' N_CONTA_PLC, DESC_PLC, ' +
    ' COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, ' +
    ' VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, DATA_REC_C, DATA_VENC_C, DATQ_C, STATUS_C, TAXA_CRED, ' +
    ' COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, ' +
    ' COD_BANDEIRA_ADM, DESC_BANDEIRA_ADM, PIX_ID, ' +
    ' FORM_PAG_COD, FORM_PAG, COD_AJUSTE_COD, COD_AJUSTE, BANDEIRA_COD, BANDEIRA, ' +
    ' STATUS_PAG_COD, STATUS_PAG, STATUS_PAG_ST, ' +
    ' TIPO_LANCAMENTO_COD, TIPO_LANCAMENTO, TIPO_LIQUIDACAO_COD, TIPO_LIQUIDACAO, ' +
    ' TIPO_ANTECIPACAO_COD, TIPO_ANTECIPACAO, TIPO_CARTAO_COD, TIPO_CARTAO, ' +
    ' MOTIVO_REJ_COD, MOTIVO_REJ, GRUPO_CARTAO_COD, GRUPO_CARTAO, ' +
    ' TIPO_TRANSACAO_COD, TIPO_TRANSACAO, STATUS_TRANSF_COD, STATUS_TRANSF, STATUS_TRANSF_ST, ' +
    ' ORIGEM_AJUSTE_COD, ORIGEM_AJUSTE ' +
    ' from VW_CONCILIACAO_PENDENCIAS_CONF ';
end;

{ TconciliacartaoRecConfere }

function TconciliacartaoRecConfere.abreConsultaFinanceiroRec(
	pconciliacartaoConfere: TconciliacartaoConfere;
	pDataIni, pDataFim: TDateTime; pTempSql: string): boolean;
var
	vtempSql: string;
  vOK: boolean;
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Consultando registros financeiros (quitados)...');

    vUltSQL := '';
    
    pconciliacartaoConfere.vTotVendasBrutoQuit := 0;

    pconciliacartaoConfere.vTotAjustesPositivoBrutoQuit := 0;

    pconciliacartaoConfere.vTotAjustesNegativoBrutoQuit := 0;

    pconciliacartaoConfere.vTotCancelamentosBrutoQuit := 0;

    pconciliacartaoConfere.vTotChargeBackBrutoQuit := 0;

    pconciliacartaoConfere.vTotAntecipacoesBrutoQuit := 0;

    pconciliacartaoConfere.vTotVendasLiqQuit := 0;

    pconciliacartaoConfere.vTotAjustesPositivoLiqQuit := 0;

    pconciliacartaoConfere.vTotAjustesNegativoLiqQuit := 0;

    pconciliacartaoConfere.vTotCancelamentosLiqQuit := 0;

    pconciliacartaoConfere.vTotChargeBackLiqQuit := 0;

    pconciliacartaoConfere.vTotAntecipacoesLiqQuit := 0;

    pconciliacartaoConfere.vTotTarifaLiqQuit := 0;

    pconciliacartaoConfere.vTotComissoesLiqQuit := 0;

    vTotFinancRec := 0;

    vtempSql := vSQL +
      ' where DATA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataIni)) +
      ' and DATA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataFim)) +
      pTempSql +
      ' order by COD_EMPRESA, DATA ';

    result := montaSelect(vtempSql);

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
    	if trim(dataSet.FieldByName('event_type_description').AsString) = 'Venda' then
      begin
      	pconciliacartaoConfere.vTotVendasBrutoQuit :=
        	pconciliacartaoConfere.vTotVendasBrutoQuit + dataSet.FieldByName('event_net_amount').AsFloat;

	      pconciliacartaoConfere.vTotVendasLiqQuit :=
  	     	pconciliacartaoConfere.vTotVendasLiqQuit + dataSet.FieldByName('event_net_amount').AsFloat;

        if dataSet.FieldByName('event_net_amount').AsFloat > 0 then
        	pconciliacartaoConfere.vTotComissoesLiqQuit := pconciliacartaoConfere.vTotComissoesLiqQuit +
          	(dataSet.FieldByName('valor_c').AsFloat - dataSet.FieldByName('event_net_amount').AsFloat);

	      vTotFinancRec := vTotFinancRec + dataSet.FieldByName('event_net_amount').AsFloat;
      end
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Antecipação' then
      begin
        pconciliacartaoConfere.vTotAntecipacoesBrutoQuit :=
        	pconciliacartaoConfere.vTotAntecipacoesBrutoQuit + dataSet.FieldByName('event_net_amount').AsFloat;

	      pconciliacartaoConfere.vTotAntecipacoesLiqQuit :=
  	     	pconciliacartaoConfere.vTotAntecipacoesLiqQuit + dataSet.FieldByName('event_net_amount').AsFloat;

      	vTotFinancRec := vTotFinancRec + dataSet.FieldByName('event_net_amount').AsFloat; //batch_net_amount
      end
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Ajuste' then
      begin
      	if (dataSet.FieldByName('event_net_amount').AsFloat >= 0) then//batch_net_amount
        begin
          pconciliacartaoConfere.vTotAjustesPositivoBrutoQuit :=
          	pconciliacartaoConfere.vTotAjustesPositivoBrutoQuit + Abs(dataSet.FieldByName('event_net_amount').AsFloat);

          pconciliacartaoConfere.vTotAjustesPositivoLiqQuit :=
          	pconciliacartaoConfere.vTotAjustesPositivoLiqQuit + Abs(dataSet.FieldByName('event_net_amount').AsFloat);

	      	vTotFinancRec := vTotFinancRec + Abs(dataSet.FieldByName('event_net_amount').AsFloat); //batch_net_amount
        end
        else
        begin
        	pconciliacartaoConfere.vTotAjustesNegativoBrutoQuit :=
          	pconciliacartaoConfere.vTotAjustesNegativoBrutoQuit + Abs(dataSet.FieldByName('event_net_amount').AsFloat);

          pconciliacartaoConfere.vTotAjustesNegativoLiqQuit :=
          	pconciliacartaoConfere.vTotAjustesNegativoLiqQuit + Abs(dataSet.FieldByName('event_net_amount').AsFloat);

        	vTotFinancRec := vTotFinancRec - Abs(dataSet.FieldByName('event_net_amount').AsFloat); //batch_net_amount
        end
      end
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Cancelamento' then
      begin
      	pconciliacartaoConfere.vTotCancelamentosBrutoQuit :=
        	pconciliacartaoConfere.vTotCancelamentosBrutoQuit + dataSet.FieldByName('event_net_amount').AsFloat;

	      pconciliacartaoConfere.vTotCancelamentosLiqQuit :=
  	     	pconciliacartaoConfere.vTotCancelamentosLiqQuit + dataSet.FieldByName('event_net_amount').AsFloat;

        if dataSet.FieldByName('event_net_amount').AsFloat > 0 then
          pconciliacartaoConfere.vTotComissoesLiqQuit := pconciliacartaoConfere.vTotComissoesLiqQuit +
            (dataSet.FieldByName('valor_c').AsFloat - dataSet.FieldByName('event_net_amount').AsFloat);

      	vTotFinancRec := vTotFinancRec + dataSet.FieldByName('event_net_amount').AsFloat; //batch_net_amount
      end
      else if trim(dataSet.FieldByName('event_type_description').AsString) = 'Chargeback' then
      begin
      	pconciliacartaoConfere.vTotChargeBackBrutoQuit :=
        	pconciliacartaoConfere.vTotChargeBackBrutoQuit + dataSet.FieldByName('event_net_amount').AsFloat;

	      pconciliacartaoConfere.vTotChargeBackLiqQuit :=
  	     	pconciliacartaoConfere.vTotChargeBackLiqQuit + dataSet.FieldByName('event_net_amount').AsFloat;

        if dataSet.FieldByName('event_net_amount').AsFloat > 0 then
          pconciliacartaoConfere.vTotComissoesLiqQuit := pconciliacartaoConfere.vTotComissoesLiqQuit +
            (dataSet.FieldByName('valor_c').AsFloat - dataSet.FieldByName('event_net_amount').AsFloat);

      	vTotFinancRec := vTotFinancRec + dataSet.FieldByName('event_net_amount').AsFloat; //batch_net_amount
      end;

    	dataSet.Next;
    end;
  finally
  	dataSet.First;
	  dataSet.EnableControls;

    if trim(vtempSql) <> '' then
      vUltSQL := vtempSql;

    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TconciliacartaoRecConfere.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoFinanceiroRec);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  vSQL := ' select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, BANK_SHIPPING_DATE, ' +
  	' ID, COD_EMPRESA, ARQUIVO, DATA_ARQUIVO, ESTABLISHMENT_NUMBER, NSU, AUTHORIZATION_NUMBER, ' +
  	' TYPE_, TYPE_DESCRIPTION, ACQUIRER_ID, ACQUIRER_NAME, BRAND_ID, BRAND_NAME, ' +
    ' EVENT_TYPE,  EVENT_TYPE_DESCRIPTION, ' +
    ' DESCRIPTION, BANK_RECON_STATUS, BANK_RECON_DESCRIPTION, ' +
    ' GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT, GROSS_EVENT_AMOUNT, BATCH_GROSS_AMOUNT, ' +
    ' TAX, SALE_TAX, CUSTOMER_TAX, INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, ' +
    ' BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER, ' +
    ' IDENTIFICACAO_EMP, CODIGO_CTRL, NOME_CTRL, CODIGO_CTRL_TX, NOME_CTRL_TX, ' +
    ' N_CONTA_PLC_TX_CARTAO, N_CONTA_PLC_TARIFA_CARTAO, N_CONTA_PLC, DESC_PLC, ' +
    ' COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, ' +
    ' DATA_REC_C, DATA_VENC_C, DATQ_C, TAXA_CRED, STATUS_C, COD_CLIENTE, NOME_CLIENTE, RAZAO, ' +
    ' COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, ' +
    ' COD_BANDEIRA_ADM, DESC_BANDEIRA_ADM, PIX_ID, ' +
    ' FORM_PAG_COD, FORM_PAG, COD_AJUSTE_COD, COD_AJUSTE, BANDEIRA_COD, BANDEIRA, ' +
    ' STATUS_PAG_COD, STATUS_PAG, STATUS_PAG_ST, ' +
    ' TIPO_LANCAMENTO_COD, TIPO_LANCAMENTO, TIPO_LIQUIDACAO_COD, TIPO_LIQUIDACAO, ' +
    ' TIPO_ANTECIPACAO_COD, TIPO_ANTECIPACAO, TIPO_CARTAO_COD, TIPO_CARTAO, ' +
    ' MOTIVO_REJ_COD, MOTIVO_REJ, GRUPO_CARTAO_COD, GRUPO_CARTAO, ' +
    ' TIPO_TRANSACAO_COD, TIPO_TRANSACAO, STATUS_TRANSF_COD, STATUS_TRANSF, STATUS_TRANSF_ST, ' +
    ' ORIGEM_AJUSTE_COD, ORIGEM_AJUSTE ' +
    ' from VW_CONCILIACAO_FINANCEIRO_REC ';
end;

{ TConciliaCartaoAdquirenteCielo }

constructor TConciliaCartaoAdquirenteCielo.create;
begin
	transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrConciliacaoCielo);
end;

function TConciliaCartaoAdquirenteCielo.InserirRegistroFinanceiro: boolean;
var
	buscas2: TIBQuery;
  vAdquirente: string;
  vAdquirenteId: Integer;
  vAdquirenteDescricao: string;
  vAjusteId: Integer;
  vAjusteDescricao: string;
  vTipoId: Integer;
  vTipoEvento: string;
  vTipoDescricao: string;
  vTipoAntecId: Integer;
  vTipoAntecDescricao: string;
  vBandeiraId: Integer;
  vBandeiraDescricao: string;
  vBancoDescricao: string;
  vCodEmpresa: Integer;
  vTipoLanc: string;
  vTipoTransacaoDescricao: string;
  vWhere: string;
  vtemp: string;
begin
	try
    Result := False;

    try
      vAdquirente := 'Cielo';
      vAdquirenteId := 0;
      vAdquirenteDescricao := '';
      vAjusteId := 0;
      vAjusteDescricao := '';
      vTipoId := 0;
      vTipoEvento := '';
      vTipoDescricao := '';
      vTipoAntecId := 0;
      vTipoDescricao := '';
      vBandeiraId := 0;
      vBandeiraDescricao := '';
      vBancoDescricao := '';
      vCodEmpresa := 0;
      vTipoLanc := '';
      vTipoTransacaoDescricao := '';

      buscas2 := TIBQuery.Create(Application);
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

      buscas2.Close;
      buscas2.SQL.Text := ' select adq.* from conciliacao_adquirente adq ' +
        ' where adq.nome = :nome ';
      buscas2.ParamByName('nome').AsString := vAdquirente;
      buscas2.Open;

      if buscas2.IsEmpty then
      begin
      	vtemp := 'Adquirente não encontrado no cadastro.' + #13 +
          ' ADQUIRENTE' + #13 +
          ' Adquirente: ' + vAdquirente + #13 +
          ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
          ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
          ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
          ' Favor verificar antes de continuar.';

      	FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
      	Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end
      else
      begin
        vAdquirenteId := buscas2.FieldByName('ID').AsInteger;
        vAdquirenteDescricao := buscas2.FieldByName('NOME').AsString;
      end;

      if (vCieloFinanc.matrizPg <> '') then
    	begin
        buscas2.Close;
        buscas2.SQL.Text := ' select est.* from conciliacao_adquirente adq ' +
          ' inner join conciliacao_estab_emp est on est.id_adquirente = adq.id ' +
          ' where adq.nome = :nome ' +
          ' and est.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.matrizPg;
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
        	vtemp := 'Matriz de pagamento do arquivo não encontrado no cadastro.' + #13 +
            ' MATRIZ PAGAMENTO' + #13 +
            ' Codigo: ' + vCieloFinanc.matrizPg + #13 +
            ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
            ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
            ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
            ' Favor verificar antes de continuar.';

          FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
          Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end;
      end
      else if (vCieloFinanc.matriz <> '') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select est.* from conciliacao_adquirente adq  ' +
          ' inner join conciliacao_estab_emp est on est.id_adquirente = adq.id ' +
          ' where adq.nome = :nome ' +
          ' and est.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.matriz;
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
        	vtemp := 'Matriz de pagamento do arquivo não encontrado no cadastro.' + #13 +
            ' MATRIZ PAGAMENTO' + #13 +
            ' Codigo: ' + vCieloFinanc.matriz + #13 +
            ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
            ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
            ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
            ' Favor verificar antes de continuar.';

					FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
          Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end;
      end;

      if (vCieloFinanc.estabSubmissorPg <> '') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select est.* from conciliacao_adquirente adq ' +
          ' inner join conciliacao_estab_emp est on est.id_adquirente = adq.id ' +
          ' where adq.nome = :nome ' +
          ' and est.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.estabSubmissorPg;
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
        	vtemp := 'Estabelecimento Submissor do arquivo não encontrado no cadastro.' + #13 +
            ' ESTABELECIMENTO SUBMISSOR' + #13 +
            ' Codigo: ' + vCieloFinanc.estabSubmissorPg + #13 +
            ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
            ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
            ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
            ' Favor verificar antes de continuar.';

        	FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
          Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end
        else
        begin
          vCodEmpresa := buscas2.FieldByName('cod_estab').AsInteger;

          if (vCodEmpresa <= 0) then
          begin
          	vtemp := 'Empresa para Estabelecimento Submissor não informada no cadastro.' + #13 +
              ' ESTABELECIMENTO SUBMISSOR' + #13 +
              ' Codigo: ' + vCieloFinanc.estabSubmissor + #13 +
              ' Cod Emp: ' + IntToStr(vCodEmpresa) + #13 +
              ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
              ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
              ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
              ' Favor verificar antes de continuar.';

          	FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
            Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
            exit;
          end
        end;
      end
      else if (vCieloFinanc.estabSubmissor <> '') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select est.* from conciliacao_adquirente adq  ' +
          ' inner join conciliacao_estab_emp est on est.id_adquirente = adq.id ' +
          ' where adq.nome = :nome ' +
          ' and est.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.estabSubmissor;
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
          vtemp := 'Estabelecimento Submissor do arquivo não encontrado no cadastro.' + #13 +
            ' ESTABELECIMENTO SUBMISSOR' + #13 +
            ' Codigo: ' + vCieloFinanc.estabSubmissor + #13 +
            ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
            ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
            ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
            ' Favor verificar antes de continuar.';

        	FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
          Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end
        else
        begin
          vCodEmpresa := buscas2.FieldByName('cod_estab').AsInteger;

          if (vCodEmpresa <= 0) then
          begin
          	vtemp := 'Empresa para Estabelecimento Submissor não informada no cadastro.' + #13 +
              ' ESTABELECIMENTO SUBMISSOR' + #13 +
              ' Codigo: ' + vCieloFinanc.estabSubmissor + #13 +
              ' Cod Emp: ' + IntToStr(vCodEmpresa) + #13 +
              ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
              ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
              ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
              ' Favor verificar antes de continuar.';

          	FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
            Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
            exit;
          end
        end;
      end;

      if (vCieloFinanc.tipoAntecipacaoPg <> '') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select tipo_antec.id, tipo_antec.descricao from conciliacao_adquirente adq ' +
        	' inner join conciliacao_tipo_antecip_adq tipo_antec_adq on tipo_antec_adq.id_adquirente = adq.id ' +
          ' inner join conciliacao_tipo_antecip tipo_antec on tipo_antec.id = tipo_antec_adq.id_tipo_antecip ' +
          ' where adq.nome = :nome ' +
          ' and tipo_antec_adq.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.tipoAntecipacaoPg;
        buscas2.Open;

        if not buscas2.IsEmpty then
        begin
        	vTipoAntecId := buscas2.FieldByName('id').AsInteger;
          vTipoAntecDescricao := trim(buscas2.FieldByName('descricao').AsString);
        end;
      end;

      if (vCieloFinanc.codAjuste <> '') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select ajt.id, ajt.descricao from conciliacao_adquirente adq  ' +
          ' inner join conciliacao_cod_ajuste_adq ajt_adq on ajt_adq.id_adquirente = adq.id ' +
          ' inner join conciliacao_cod_ajuste ajt on ajt.id = ajt_adq.id_cod_ajuste ' +
          ' where adq.nome = :nome ' +
          ' and ajt_adq.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.codAjuste;
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
        	vtemp := 'Código de ajuste não encontrado no cadastro.' + #13 +
            ' CÓDIGO DE AJUSTE' + #13 +
            ' Codigo: ' + vCieloFinanc.codAjuste + #13 +
            ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
            ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
            ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
            ' Favor verificar antes de continuar.';

        	FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
        	Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end
        else
        begin
          vAjusteId := buscas2.FieldByName('id').AsInteger;
          vAjusteDescricao := buscas2.FieldByName('descricao').AsString;
        end;
      end;

      if (trim(vCieloFinanc.pixId) <> '')
      	and (trim(vCieloFinanc.tipoTransacao) <> '') then
      begin
      	buscas2.Close;
        buscas2.SQL.Text := ' select orig_ajt.id, orig_ajt.descricao from conciliacao_adquirente adq ' +
        	' inner join conciliacao_origem_ajuste_adq orig_ajt_adq on orig_ajt_adq.id_adquirente = adq.id ' +
          ' inner join conciliacao_origem_ajuste orig_ajt on orig_ajt.id = orig_ajt_adq.id_origem_ajuste ' +
          ' where adq.nome = :nome ' +
          ' and orig_ajt_adq.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.tipoTransacao;
        buscas2.Open;

        if not buscas2.IsEmpty then
        	vTipoDescricao := buscas2.FieldByName('descricao').AsString;

        if (vCieloFinanc.tipoTransacao = '01') then
          vTipoEvento := 'Venda'
        else if (vCieloFinanc.tipoTransacao = '02') then
          vTipoEvento := 'Ajuste'
        else if (vCieloFinanc.tipoTransacao = '03') then
          vTipoEvento := 'Ajuste'
      end
      else if (vCieloFinanc.tipoLancamento <> '') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select tp.id, tp.descricao from conciliacao_adquirente adq ' +
          ' inner join conciliacao_tipo_lanc_adq tp_adq on tp_adq.id_aquirente = adq.id ' +
          ' inner join conciliacao_tipo_lanc tp on tp.id = tp_adq.id_tipo_lanc ' +
          ' where adq.nome = :nome ' +
          ' and tp_adq.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.tipoLancamento;
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
        	vtemp := 'Tipo de lançamento não encontrado no cadastro.' + #13 +
            ' TIPO DE LANÇAMENTO' + #13 +
            ' Codigo: ' + vCieloFinanc.tipoLancamento + #13 +
            ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
            ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
            ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
            ' Favor verificar antes de continuar.';
            
        	FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
          Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end
        else
        begin
          vTipoId := buscas2.FieldByName('id').AsInteger;
          vTipoDescricao := trim(buscas2.FieldByName('descricao').AsString);

          if (trim(vTipoDescricao) = 'Venda a débito')
          	or (trim(vTipoDescricao) = 'Venda a debito')
          	or (trim(vTipoDescricao) = 'Venda a crédito a vista')
            or (trim(vTipoDescricao) = 'Venda a credito a vista')
          	or (trim(vTipoDescricao) = 'Venda crédito parcelado')
            or (trim(vTipoDescricao) = 'Venda credito parcelado') then
          begin
          	if vTipoAntecDescricao = 'Movimento Antecipado' then
            	vTipoEvento := 'Antecipação'
            else
            	vTipoEvento := 'Venda';
          end
        	else if (trim(vTipoDescricao) = 'Cancelamento de venda') then
          begin
            	vTipoEvento := 'Cancelamento';
          end
          else if (trim(vTipoDescricao) = 'Contestação/Chargeback')
          	or (trim(vTipoDescricao) = 'Contestacao/Chargeback') then
          begin
            	vTipoEvento := 'Chargeback';
          end
          else
          		vTipoEvento := 'Ajuste';

          if (vCieloFinanc.tipoLancamento <> '01')
          	and (vCieloFinanc.tipoLancamento <> '02')
          	and (vCieloFinanc.tipoLancamento <> '03')
            and (trim(vAjusteDescricao) <> '') then
          		vTipoDescricao := trim(vAjusteDescricao);
        end;
      end;

      if (vCieloFinanc.formPag <> '') and (vCieloFinanc.formPag <> '000') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select fp.id, fp.descricao from conciliacao_adquirente adq ' +
          ' inner join conciliacao_form_pag_adq fp_adq on adq.id = fp_adq.id_adquirente ' +
          ' inner join conciliacao_form_pag fp on fp.id = fp_adq.id_form_pag ' +
          ' where adq.nome = :nome ' +
          ' and fp_adq.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.formPag;
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
        	vtemp := 'Forma de pagamento não encontrado no cadastro.' + #13 +
            ' FORMA DE PAGAMENTO' + #13 +
            ' Codigo: ' + vCieloFinanc.formPag + #13 +
            ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
            ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
            ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
            ' Favor verificar antes de continuar.';

          FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
        	Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end;
      end;

      if (vCieloFinanc.bandeiraPg <> '') and (vCieloFinanc.bandeiraPg <> '000') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select band.id, band.nome from conciliacao_adquirente adq  ' +
          ' inner join conciliacao_band_adq band_adq on band_adq.id_adquirente = adq.id ' +
          ' inner join conciliacao_bandeira band on band.id = band_adq.id_bandeira ' +
          ' where adq.nome = :nome ' +
          ' and band_adq.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.bandeiraPg;
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
        	vtemp := 'Bandeira não encontrado no cadastro.' + #13 +
            ' BANDEIRA' + #13 +
            ' Codigo: ' + vCieloFinanc.bandeiraPg + #13 +
            ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
            ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
            ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
            ' Favor verificar antes de continuar.';

          FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
          Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end
        else
        begin
          vBandeiraId := buscas2.FieldByName('id').AsInteger;
          vBandeiraDescricao := buscas2.FieldByName('nome').AsString;
        end;
      end
      else if (vCieloFinanc.bandeira <> '') and (vCieloFinanc.bandeira <> '000') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select band.id, band.nome from conciliacao_adquirente adq ' +
          ' inner join conciliacao_band_adq band_adq on band_adq.id_adquirente = adq.id ' +
          ' inner join conciliacao_bandeira band on band.id = band_adq.id_bandeira ' +
          ' where adq.nome = :nome ' +
          ' and band_adq.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.bandeira;
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
        	vtemp := 'Bandeira não encontrado no cadastro.' + #13 +
            ' BANDEIRA' + #13 +
            ' Codigo: ' + vCieloFinanc.bandeira + #13 +
            ' Arquivo: ' + vCieloFinanc.arquivo + #13 +
            ' Data Arq: ' + vCieloFinanc.dataArquivo + #13 +
            ' Linha: ' + Copy(vCieloFinanc.linha, 1, 1) + #13 + #13 +
            ' Favor verificar antes de continuar.';
            
        	FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
          Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
          exit;
        end
        else
        begin
          vBandeiraId := buscas2.FieldByName('ID').AsInteger;
          vBandeiraDescricao := buscas2.FieldByName('NOME').AsString;
        end;
      end;

      if (vCieloFinanc.banco <> '') then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select bancos.codbanco, bancos.nomebanco from bancos ' +
        	' where (select result from strzero(bancos.codbanco, 4)) = ' + QuotedStr(vCieloFinanc.banco);
        buscas2.Open;

        if not buscas2.IsEmpty then
        	vBancoDescricao := buscas2.FieldByName('NOMEBANCO').AsString;
      end;

      if trim(vCieloFinanc.tipoTransacao) <> '' then
      begin
      	buscas2.Close;
        buscas2.SQL.Text := ' select trans.id, trans.descricao from conciliacao_adquirente adq ' +
        	' inner join conciliacao_tipo_transacao_adq trans_adq on trans_adq.id_adquirente = adq.id ' +
          ' inner join conciliacao_tipo_transacao trans on trans.id = trans_adq.id_tipo_transacao ' +
          ' where adq.nome = :nome ' +
          ' and trans_adq.codigo = :codigo ';
        buscas2.ParamByName('nome').AsString := vAdquirente;
        buscas2.ParamByName('codigo').AsString := vCieloFinanc.tipoTransacao;
        buscas2.Open;

        if not buscas2.IsEmpty then
        	vTipoTransacaoDescricao := buscas2.FieldByName('descricao').AsString;
      end;

      buscas.Close;
      buscas.SQL.Text := ' SELECT ID, INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, COD_EMPRESA FROM CONCILIACAO_FINANCEIRO ';

      if Copy(vCieloFinanc.linha, 1, 1) = '8' then
      begin
      	buscas.SQL.Text := buscas.SQL.Text +
          ' WHERE PIX_ID = :PIX_ID ' +
          ' AND COD_EMPRESA = :COD_EMPRESA ' +
          ' AND STATUS_TRANSF_COD = :STATUS_TRANSF_COD ';
        buscas.ParamByName('PIX_ID').AsString := vCieloFinanc.PixId;
        buscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
        buscas.ParamByName('STATUS_TRANSF_COD').AsString := vCieloFinanc.statusTransf;
      end
      else
      begin
        buscas.SQL.Text := buscas.SQL.Text +
          ' WHERE COD_TRANS_REC = :COD_TRANS_REC ' +
          ' AND CHAVE_UR = :CHAVE_UR ' +
          ' AND INSTALLMENT_NUMBER = :INSTALLMENT_NUMBER ' +
          ' AND INSTALLMENTS_TOTAL = :INSTALLMENTS_TOTAL ' +
          ' AND COD_EMPRESA = :COD_EMPRESA ';

        if trim(vCieloFinanc.statusPg) = '' then
        	buscas.SQL.Text := buscas.SQL.Text +
          	' AND STATUS_PAG_COD IS NULL '
        else
        	buscas.SQL.Text := buscas.SQL.Text +
          	' AND STATUS_PAG_COD = :STATUS_PAG_COD ';

        buscas.ParamByName('COD_TRANS_REC').AsString := vCieloFinanc.codTransRecContr;
        buscas.ParamByName('CHAVE_UR').AsString := vCieloFinanc.chaveUR;
        buscas.ParamByName('INSTALLMENT_NUMBER').AsInteger := vCieloFinanc.qtdParcela;
        buscas.ParamByName('INSTALLMENTS_TOTAL').AsInteger := vCieloFinanc.totParcela;
        buscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;

        if trim(vCieloFinanc.statusPg) <> '' then
        	buscas.ParamByName('STATUS_PAG_COD').AsString := trim(vCieloFinanc.statusPg);
      end;
      buscas.Open;

      if not buscas.IsEmpty then
      begin
        buscas.Close;
        buscas.SQL.Text := ' UPDATE CONCILIACAO_FINANCEIRO SET ' +
        	' ID = :ID, INSTALLMENT_NUMBER = :INSTALLMENT_NUMBER, ' +
          ' INSTALLMENTS_TOTAL = :INSTALLMENTS_TOTAL, COD_EMPRESA = :COD_EMPRESA, ' +
          ' EVENT_TYPE = :EVENT_TYPE, EVENT_TYPE_DESCRIPTION = :EVENT_TYPE_DESCRIPTION, ' +
          ' TYPE_ = :TYPE_, TYPE_DESCRIPTION = :TYPE_DESCRIPTION, MERCHANT_ID = :MERCHANT_ID, ' +
          ' MATRIX_NUMBER = :MATRIX_NUMBER, ESTABLISHMENT_NUMBER = :ESTABLISHMENT_NUMBER, ' +
          ' DATE_ = :DATE_, ' +
          ' REQUEST_DATE = :REQUEST_DATE, ' +
          ' EFFECTED_DATE = :EFFECTED_DATE, ' +
          ' PAYMENT_DATE = :PAYMENT_DATE, ' +
          ' BANK_SHIPPING_DATE = :BANK_SHIPPING_DATE, ' +
          ' HOUR_ = :HOUR_, ' +
					' GROSS_AMOUNT = :GROSS_AMOUNT, ' +
          ' GROSS_EVENT_AMOUNT = :GROSS_EVENT_AMOUNT, ' +
					' EVENT_NET_AMOUNT = :EVENT_NET_AMOUNT, ' +
					' BATCH_GROSS_AMOUNT = :BATCH_GROSS_AMOUNT, ' +
					' BATCH_NET_AMOUNT = :BATCH_NET_AMOUNT, ' +
				  ' TAX = :TAX, SALE_TAX = :SALE_TAX, CUSTOMER_TAX = :CUSTOMER_TAX, ' +
          ' DESCRIPTION = :DESCRIPTION, PROTOCOL_NUMBER = :PROTOCOL_NUMBER, ' +
          ' TRANSACTION_TYPE = :TRANSACTION_TYPE, ' +
          ' ACQUIRER_ID = :ACQUIRER_ID, ACQUIRER_NAME = :ACQUIRER_NAME, ' +
          ' BRAND_ID = :BRAND_ID, BRAND_NAME = :BRAND_NAME, ' +
          ' AUTHORIZATION_NUMBER = :AUTHORIZATION_NUMBER, NSU = :NSU, ' +
          ' BANK_NAME = :BANK_NAME, BANK_NUMBER = :BANK_NUMBER, BRANCH_NUMBER = :BRANCH_NUMBER, ' +
          ' ACCOUNT_NUMBER = :ACCOUNT_NUMBER, BATCH_NUMBER = :BATCH_NUMBER, ' +
          ' BANK_RECON_STATUS = :BANK_RECON_STATUS, TERMINAL_NUMBER = :TERMINAL_NUMBER, ' +
          ' PIX_ID = :PIX_ID, PIX_ORIGINAL_ID = :PIX_ORIGINAL_ID, ' +
          ' SALE_ID = :SALE_ID, SALE_ORIGINAL_ID = :SALE_ORIGINAL_ID, ' +
			 	  ' TIPO_ANTECIPACAO_COD = :TIPO_ANTECIPACAO_COD, ' +
					' TIPO_CARTAO_COD = :TIPO_CARTAO_COD, ' +
					' TIPO_LANCAMENTO_COD = :TIPO_LANCAMENTO_COD, ' +
					' TIPO_LIQUIDACAO_COD = :TIPO_LIQUIDACAO_COD, ' +
				  ' TIPO_TRANSACAO_COD = :TIPO_TRANSACAO_COD, ' +
       	  ' BANDEIRA_COD = :BANDEIRA_COD, ' +
					' COD_AJUSTE_COD = :COD_AJUSTE_COD, ' +
        	' FORM_PAG_COD = :FORM_PAG_COD, ' +
					' GRUPO_CARTAO_COD = :GRUPO_CARTAO_COD, ' +
					' MOTIVO_REJ_COD = :MOTIVO_REJ_COD, ' +
					' ORIGEM_AJUSTE_COD = :ORIGEM_AJUSTE_COD, ' +
					' STATUS_PAG_COD = :STATUS_PAG_COD, ' +
					' STATUS_TRANSF_COD = :STATUS_TRANSF_COD, ' +
					' CHAVE_UR = :CHAVE_UR, COD_TRANS_REC = :COD_TRANS_REC, ' +
          ' NUM_TRANS_PROCESS = :NUM_TRANS_PROCESS, NUM_NF = :NUM_NF, ' +
          ' ARQUIVO = :ARQUIVO, DATA_ARQUIVO = :DATA_ARQUIVO ';

        if Copy(vCieloFinanc.linha, 1, 1) = '8' then
        	buscas.SQL.Text := buscas.SQL.Text +
            ' WHERE PIX_ID = :PIX_ID ' +
            ' AND COD_EMPRESA = :COD_EMPRESA ' +
            ' AND STATUS_TRANSF_COD = :STATUS_TRANSF_COD '
        else
        begin
        	buscas.SQL.Text := buscas.SQL.Text +
            ' WHERE COD_TRANS_REC = :COD_TRANS_REC ' +
            ' AND CHAVE_UR = :CHAVE_UR ' +
            ' AND INSTALLMENT_NUMBER = :INSTALLMENT_NUMBER ' +
            ' AND INSTALLMENTS_TOTAL = :INSTALLMENTS_TOTAL ' +
            ' AND COD_EMPRESA = :COD_EMPRESA ';

            
          if trim(vCieloFinanc.statusPg) = '' then
            buscas.SQL.Text := buscas.SQL.Text +
              ' AND STATUS_PAG_COD IS NULL '
          else
            buscas.SQL.Text := buscas.SQL.Text +
              ' AND STATUS_PAG_COD = :STATUS_PAG_COD ';
        end;
      end
      else
      begin
        buscas.Close;
        buscas.SQL.Text :=
          ' INSERT INTO CONCILIACAO_FINANCEIRO ' +
          ' (ID, INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, COD_EMPRESA, ' +
          ' EVENT_TYPE, EVENT_TYPE_DESCRIPTION, TYPE_, TYPE_DESCRIPTION, ' +
          ' MERCHANT_ID, MATRIX_NUMBER, ESTABLISHMENT_NUMBER, ' +
          ' DATE_, REQUEST_DATE, EFFECTED_DATE, ' +
          ' PAYMENT_DATE, BANK_SHIPPING_DATE, ' +
          ' HOUR_, ' +
					' GROSS_AMOUNT, GROSS_EVENT_AMOUNT, EVENT_NET_AMOUNT, BATCH_GROSS_AMOUNT, BATCH_NET_AMOUNT, ' +
					' TAX, SALE_TAX, CUSTOMER_TAX, ' +
          ' DESCRIPTION, PROTOCOL_NUMBER, TRANSACTION_TYPE, ' +
          ' ACQUIRER_ID, ACQUIRER_NAME, BRAND_ID, BRAND_NAME, ' +
          ' AUTHORIZATION_NUMBER, NSU, BANK_NAME, BANK_NUMBER, BRANCH_NUMBER, ' +
          ' ACCOUNT_NUMBER, BATCH_NUMBER, BANK_RECON_STATUS, TERMINAL_NUMBER, ' +
          ' PIX_ID, PIX_ORIGINAL_ID, SALE_ID, SALE_ORIGINAL_ID, ' +
				  ' TIPO_ANTECIPACAO_COD, TIPO_CARTAO_COD, TIPO_LANCAMENTO_COD, ' +
			  	' TIPO_LIQUIDACAO_COD, TIPO_TRANSACAO_COD, ' +
				  ' BANDEIRA_COD, COD_AJUSTE_COD, ' +
				  ' FORM_PAG_COD, GRUPO_CARTAO_COD, ' +
					' MOTIVO_REJ_COD, ORIGEM_AJUSTE_COD, ' +
          ' STATUS_PAG_COD, STATUS_TRANSF_COD, ' +
					' CHAVE_UR, COD_TRANS_REC, NUM_TRANS_PROCESS, NUM_NF, ' +
          ' ARQUIVO, DATA_ARQUIVO)' +
          ' VALUES ' +
          ' (:ID, :INSTALLMENT_NUMBER, :INSTALLMENTS_TOTAL, :COD_EMPRESA, ' +
          ' :EVENT_TYPE, :EVENT_TYPE_DESCRIPTION, :TYPE_, :TYPE_DESCRIPTION, ' +
          ' :MERCHANT_ID, :MATRIX_NUMBER, :ESTABLISHMENT_NUMBER, ' +
          ' :DATE_, :REQUEST_DATE, :EFFECTED_DATE, ' +
          ' :PAYMENT_DATE, :BANK_SHIPPING_DATE, ' +
          ' :HOUR_, ' +
				  ' :GROSS_AMOUNT, :GROSS_EVENT_AMOUNT, :EVENT_NET_AMOUNT, :BATCH_GROSS_AMOUNT, :BATCH_NET_AMOUNT, ' +
					' :TAX, :SALE_TAX, :CUSTOMER_TAX, ' +
          ' :DESCRIPTION, :PROTOCOL_NUMBER, :TRANSACTION_TYPE, ' +
          ' :ACQUIRER_ID, :ACQUIRER_NAME, :BRAND_ID, :BRAND_NAME, ' +
          ' :AUTHORIZATION_NUMBER, :NSU, :BANK_NAME, :BANK_NUMBER, :BRANCH_NUMBER, ' +
          ' :ACCOUNT_NUMBER, :BATCH_NUMBER, :BANK_RECON_STATUS, :TERMINAL_NUMBER, ' +
          ' :PIX_ID, :PIX_ORIGINAL_ID, :SALE_ID, :SALE_ORIGINAL_ID, ' +
					' :TIPO_ANTECIPACAO_COD, :TIPO_CARTAO_COD, :TIPO_LANCAMENTO_COD, ' +
					' :TIPO_LIQUIDACAO_COD, :TIPO_TRANSACAO_COD, ' +
					' :BANDEIRA_COD, :COD_AJUSTE_COD, ' +
					' :FORM_PAG_COD, :GRUPO_CARTAO_COD, ' +
				  ' :MOTIVO_REJ_COD, :ORIGEM_AJUSTE_COD, ' +
					' :STATUS_PAG_COD, :STATUS_TRANSF_COD, ' +
					' :CHAVE_UR, :COD_TRANS_REC, :NUM_TRANS_PROCESS, :NUM_NF, ' +
          ' :ARQUIVO, :DATA_ARQUIVO); ';
      end;
      buscas.ParamByName('ID').AsInteger := vDadosIni.Gencodigo('CONCILIACAO_FINANCEIRO', buscas2, IntToStr(vCodEmpresa));
      buscas.ParamByName('INSTALLMENT_NUMBER').AsInteger := vCieloFinanc.qtdParcela;
      buscas.ParamByName('INSTALLMENTS_TOTAL').AsInteger := vCieloFinanc.totParcela;
      buscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;

      buscas.ParamByName('ACQUIRER_ID').AsInteger := vAdquirenteId;

      if trim(vAdquirenteDescricao) <> '' then
      	buscas.ParamByName('ACQUIRER_NAME').AsString := trim(vAdquirenteDescricao);

      buscas.ParamByName('EVENT_TYPE').AsInteger := vTipoId;

      if trim(vTipoEvento) <> '' then
      	buscas.ParamByName('EVENT_TYPE_DESCRIPTION').AsString := trim(vTipoEvento);

      if trim(vTipoDescricao) <> '' then
      	buscas.ParamByName('DESCRIPTION').AsString := trim(vTipoDescricao)
      else if trim(vTipoTransacaoDescricao) <> '' then
        buscas.ParamByName('DESCRIPTION').AsString := trim(vTipoTransacaoDescricao);

      buscas.ParamByName('BRAND_ID').AsInteger := vBandeiraId;

      if trim(vBandeiraDescricao) <> '' then
      	buscas.ParamByName('BRAND_NAME').AsString := trim(vBandeiraDescricao);

      buscas.ParamByName('TYPE_').AsInteger := 2;
      buscas.ParamByName('TYPE_DESCRIPTION').AsString := 'Confirmado';

      buscas.ParamByName('MERCHANT_ID').AsInteger := 0;

      if trim(vCieloFinanc.matrizPg) <> '' then
      	buscas.ParamByName('MATRIX_NUMBER').AsString := trim(vCieloFinanc.matrizPg);

      if trim(vCieloFinanc.estabSubMissor) <> '' then
      	buscas.ParamByName('ESTABLISHMENT_NUMBER').AsString := trim(vCieloFinanc.estabSubMissor);

      if trim(vCieloFinanc.dataMovimento) <> '' then
      	buscas.ParamByName('DATE_').AsString := vCieloFinanc.dataMovimento;

      if trim(vCieloFinanc.dataCaptura) <> '' then
      	buscas.ParamByName('REQUEST_DATE').AsString := vCieloFinanc.dataCaptura;

      if trim(vCieloFinanc.dataMovimentoOrig) <> '' then
      	buscas.ParamByName('EFFECTED_DATE').AsString := vCieloFinanc.dataMovimentoOrig;

      if trim(vCieloFinanc.dataPg) <> '' then
        buscas.ParamByName('PAYMENT_DATE').AsString := vCieloFinanc.dataPg;

      if trim(vCieloFinanc.dataEnvioBancoPg) <> '' then
      	buscas.ParamByName('BANK_SHIPPING_DATE').AsString := vCieloFinanc.dataEnvioBancoPg;

      buscas.ParamByName('HOUR_').AsString := '00:00';

      if vCieloFinanc.valorBrutoVnd <> 0 then
      	buscas.ParamByName('GROSS_AMOUNT').AsFloat := vCieloFinanc.valorBrutoVnd; // Valor total bruto

      if vCieloFinanc.valorBrutoParc <> 0 then
      	buscas.ParamByName('GROSS_EVENT_AMOUNT').AsFloat := vCieloFinanc.valorBrutoParc; // Valor bruto parcela

      if vCieloFinanc.valorLiqParc <> 0 then
      	buscas.ParamByName('EVENT_NET_AMOUNT').AsFloat := vCieloFinanc.valorLiqParc;  // Valor liquido

      if vCieloFinanc.valorBrutoLote <> 0 then
      	buscas.ParamByName('BATCH_GROSS_AMOUNT').AsFloat := vCieloFinanc.valorBrutoLote; // Valor bruto lote

    	if vCieloFinanc.valorLiqLote <> 0 then
      	buscas.ParamByName('BATCH_NET_AMOUNT').AsFloat := vCieloFinanc.valorLiqLote; // Valor liquido lote

      buscas.ParamByName('TAX').AsFloat := 0;

      buscas.ParamByName('SALE_TAX').AsFloat := 0;

      buscas.ParamByName('CUSTOMER_TAX').AsFloat := 0;

      if trim(vCieloFinanc.tipoAntecipacaoPg) <> '' then
      	buscas.ParamByName('TIPO_ANTECIPACAO_COD').AsString := trim(vCieloFinanc.tipoAntecipacaoPg);

      if trim(vCieloFinanc.tipoCartao) <> '' then
      	buscas.ParamByName('TIPO_CARTAO_COD').AsString := trim(vCieloFinanc.tipoCartao);

      if trim(vCieloFinanc.motivoRejeicao) <> '' then
      	buscas.ParamByName('MOTIVO_REJ_COD').AsString := trim(vCieloFinanc.motivoRejeicao);

      if trim(vCieloFinanc.tipoLancamento) <> '' then
      	buscas.ParamByName('TIPO_LANCAMENTO_COD').AsString := trim(vCieloFinanc.tipoLancamento);

      if trim(vCieloFinanc.tipoLiquidacao) <> '' then
      	buscas.ParamByName('TIPO_LIQUIDACAO_COD').AsString := trim(vCieloFinanc.tipoLiquidacao);

      if trim(vCieloFinanc.tipoTransacao) <> '' then
        buscas.ParamByName('TIPO_TRANSACAO_COD').AsString := trim(vCieloFinanc.tipoTransacao);

      if trim(vCieloFinanc.formPag) <> '' then
      	buscas.ParamByName('FORM_PAG_COD').AsString := trim(vCieloFinanc.formPag);

      if trim(vCieloFinanc.grupoCartao) <> '' then
      	buscas.ParamByName('GRUPO_CARTAO_COD').AsString := vCieloFinanc.grupoCartao;

      if (trim(vCieloFinanc.tipoLancamento) = '01')
      	or (trim(vCieloFinanc.tipoLancamento) = '02')
        or (trim(vCieloFinanc.tipoLancamento) = '03') then
          buscas.ParamByName('COD_AJUSTE_COD').Value := Null
      else if trim(vCieloFinanc.codAjuste) <> '' then
      		buscas.ParamByName('COD_AJUSTE_COD').AsString := trim(vCieloFinanc.codAjuste);

      if trim(vCieloFinanc.bandeiraPg) <> '' then
      	buscas.ParamByName('BANDEIRA_COD').AsString := trim(vCieloFinanc.bandeiraPg)
      else if trim(vCieloFinanc.bandeira) <> '' then
      	buscas.ParamByName('BANDEIRA_COD').AsString := trim(vCieloFinanc.bandeira);

      if trim(vCieloFinanc.origemAjuste) <> '' then
      	buscas.ParamByName('ORIGEM_AJUSTE_COD').AsString := trim(vCieloFinanc.origemAjuste);

      if trim(vCieloFinanc.statusPg) <> '' then
      	buscas.ParamByName('STATUS_PAG_COD').AsString := trim(vCieloFinanc.statusPg);

      if trim(vCieloFinanc.statusTransf) <> '' then
        buscas.ParamByName('STATUS_TRANSF_COD').AsString := trim(vCieloFinanc.statusTransf);

      buscas.ParamByName('PROTOCOL_NUMBER').Value := Null;
      buscas.ParamByName('TRANSACTION_TYPE').Value := Null;

      if trim(vCieloFinanc.codAutorizacao) <> '' then
      	buscas.ParamByName('AUTHORIZATION_NUMBER').AsString := trim(vCieloFinanc.codAutorizacao);

      if trim(vCieloFinanc.nsuDoc) <> '' then
      	buscas.ParamByName('NSU').AsString := trim(vCieloFinanc.nsuDoc);

      buscas.ParamByName('BANK_NAME').AsString := trim(vBancoDescricao);

      if trim(vCieloFinanc.bancoPg) <> '' then
      	buscas.ParamByName('BANK_NUMBER').AsString := trim(vCieloFinanc.bancoPg)
      else if trim(vCieloFinanc.banco) <> '' then
      	buscas.ParamByName('BANK_NUMBER').AsString := trim(vCieloFinanc.banco);

      if trim(vCieloFinanc.agenciaPg) <> '' then
      	buscas.ParamByName('BRANCH_NUMBER').AsString := trim(vCieloFinanc.agenciaPg)
      else if trim(vCieloFinanc.agencia) <> '' then
      	buscas.ParamByName('BRANCH_NUMBER').AsString := trim(vCieloFinanc.agencia);

      if trim(vCieloFinanc.contaPg) <> '' then
      	buscas.ParamByName('ACCOUNT_NUMBER').AsString := vDadosIni.RetirarZerosEsquerda(trim(vCieloFinanc.contaPg)) + trim(vCieloFinanc.digitoContaPg)
      else if trim(vCieloFinanc.conta) <> '' then
      	buscas.ParamByName('ACCOUNT_NUMBER').AsString := vDadosIni.RetirarZerosEsquerda(trim(vCieloFinanc.conta)) + trim(vCieloFinanc.digitoConta);

      if trim(vCieloFinanc.numLote) <> '' then
      	buscas.ParamByName('BATCH_NUMBER').AsString := trim(vCieloFinanc.numLote);

      buscas.ParamByName('BANK_RECON_STATUS').AsString := '';

      if trim(vCieloFinanc.numTerminal) <> '' then
      	buscas.ParamByName('TERMINAL_NUMBER').AsString := trim(vCieloFinanc.numTerminal);

      if trim(vCieloFinanc.PixId) <> '' then
      	buscas.ParamByName('PIX_ID').AsString := trim(vCieloFinanc.PixId);

      if trim(vCieloFinanc.pixOriginalId) <> '' then
      	buscas.ParamByName('PIX_ORIGINAL_ID').AsString := trim(vCieloFinanc.pixOriginalId);

      if trim(vCieloFinanc.codUnicoVnd) <> '' then
      	buscas.ParamByName('SALE_ID').AsString := trim(vCieloFinanc.codUnicoVnd);

      if trim(vCieloFinanc.codOrigVnd) <> '' then
      	buscas.ParamByName('SALE_ORIGINAL_ID').AsString := trim(vCieloFinanc.codOrigVnd);

      if trim(vCieloFinanc.chaveUR) <> '' then
      	buscas.ParamByName('CHAVE_UR').AsString := trim(vCieloFinanc.chaveUR);

      if trim(vCieloFinanc.codTransRecContr) <> '' then
      	buscas.ParamByName('COD_TRANS_REC').AsString := trim(vCieloFinanc.codTransRecContr);

      if trim(vCieloFinanc.numTransProcess) <> '' then
      	buscas.ParamByName('NUM_TRANS_PROCESS').AsString := trim(vCieloFinanc.numTransProcess);

      if trim(vCieloFinanc.numNota) <> '' then
      	buscas.ParamByName('NUM_NF').AsString := trim(vCieloFinanc.numNota);

      if trim(vCieloFinanc.arquivo) <> '' then
      	buscas.ParamByName('ARQUIVO').AsString := trim(vCieloFinanc.arquivo);

      if trim(vCieloFinanc.dataArquivo) <> '' then
      	buscas.ParamByName('DATA_ARQUIVO').AsString := vCieloFinanc.dataArquivo;

      buscas.ExecSQL;

//      if buscas.Transaction.InTransaction then
//        buscas.Transaction.Commit;

      Result := True;
    finally
      if Assigned(buscas2) then
        FreeAndNil(buscas2);
    end;
  except
  	on e: exception do
    begin
    	if buscas.Transaction.InTransaction then
      	buscas.Transaction.Rollback;
    	Application.MessageBox(pchar('Erro ao inserir registros financeiros conciliação cartão. Erro: ' + e.Message), 'Erro', MB_ICONERROR + MB_OK);
      registraErro('Erro ao inserir registros financeiros conciliação cartão. TConciliaCartaoAdquirenteCielo.InserirRegistroFinanceiro: ' + e.Message);
      result := false;
    end;
  end;
end;

function TConciliaCartaoAdquirenteCielo.ProcessarArquivo: boolean;
var
	SR: TSearchRec;
  I: Integer;
  F: TextFile;
  S: string;
  vCodEmpresa: Integer;
  vDiretorio: string;
  vIncArq: Integer;
  vQtdeArq: Integer;
  vListaArq: TStringList;
  vLinha: TStringList;
  linha: string;
  vtemp: string;
  buscasArq: TIBQuery;
  cdsArq: TClientDataSet;

  procedure zerarVariaveis;
  begin
  	vCieloFinanc.matrizPg := '';
  	vCieloFinanc.estabSubmissorPg := '';
    vCieloFinanc.bandeiraPg := '';
  	vCieloFinanc.statusPg := '';
    vCieloFinanc.origemAjuste := '';
    vCieloFinanc.statusTransf := '';
    vCieloFinanc.dataPg := '';
    vCieloFinanc.dataEnvioBancoPg := '';
    vCieloFinanc.dataVencOrigPg := '';
    vCieloFinanc.numEstabPg := '';
    vCieloFinanc.tipoAntecipacaoPg := '';
    vCieloFinanc.numAntecipacaoPg := '';
    vCieloFinanc.taxaAntecipacaoPg := 0;
    vCieloFinanc.bancoPg := '';
    vCieloFinanc.agenciaPg := '';
    vCieloFinanc.contaPg := '';
    vCieloFinanc.digitoContaPg := '';
    vCieloFinanc.valorBrutoPg := 0;
    vCieloFinanc.valorLiqPg := 0;
    vCieloFinanc.PixId := '';
    vCieloFinanc.pixOriginalId := '';

    vCieloFinanc.matriz := '';
  	vCieloFinanc.estabSubmissor := '';
    vCieloFinanc.qtdParcela := 0;
		vCieloFinanc.totParcela := 0;
    vCieloFinanc.codAutorizacao := '';
    vCieloFinanc.tipoCartao := '';
    vCieloFinanc.tipoLancamento := '';
    vCieloFinanc.tipoLiquidacao := '';
    vCieloFinanc.tipoTransacao := '';
    vCieloFinanc.chaveUR := '';
    vCieloFinanc.codTransRecContr := '';
    vCieloFinanc.codAjuste := '';
    vCieloFinanc.bandeira := '';
    vCieloFinanc.formPag := '';
    vCieloFinanc.grupoCartao := '';
    vCieloFinanc.binCartao := '';
    vCieloFinanc.numCartao := '';
    vCieloFinanc.nsuDoc := '';
    vCieloFinanc.numNota := '';
    vCieloFinanc.valorBrutoVnd := 0;
    vCieloFinanc.valorBrutoParc := 0;
		vCieloFinanc.valorLiqVnd := 0;
    vCieloFinanc.valorLiqParc := 0;
    vCieloFinanc.valorBrutoLote := 0;
    vCieloFinanc.valorLiqLote := 0;
		vCieloFinanc.bandeiraAut := '';
    vCieloFinanc.codUnicoVnd := '';
    vCieloFinanc.codOrigVnd := '';
    vCieloFinanc.codUnAjuste := '';
    vCieloFinanc.meioCaptura := '';
    vCieloFinanc.numTerminal := '';
    vCieloFinanc.tipoTransacao := '';
		vCieloFinanc.dataAutorizacao := '';
		vCieloFinanc.dataCaptura := '';
		vCieloFinanc.dataMovimento := '';
		vCieloFinanc.dataMovimentoOrig := '';
    vCieloFinanc.numTransProcess := '';
    vCieloFinanc.dataVencOrig := '';
    vCieloFinanc.numLote := '';
    vCieloFinanc.banco := '';
    vCieloFinanc.agencia := '';
    vCieloFinanc.conta := '';
    vCieloFinanc.digitoConta := '';
  end;

begin
	try
    Result := False;

    buscasArq := TIBQuery.Create(Application);
    buscasArq.Database := buscas.Database;
    buscasArq.Transaction := buscas.Transaction;

    vListaArq := TStringList.Create;
    vlinha := TStringList.Create;

    if trim(vDadosIni.vConcCartao.vVersaoLayoutCieloConcCartao) <> '' then
    begin
      try
        StrToFloat(trim(vDadosIni.vConcCartao.vVersaoLayoutCieloConcCartao))
      except
        vDadosIni.vConcCartao.vVersaoLayoutCieloConcCartao := '';
      end;
    end;

    if trim(vDadosIni.vConcCartao.vDataVersaoCieloConcCartao) <> '' then
    begin
      try
        StrToDate(trim(vDadosIni.vConcCartao.vDataVersaoCieloConcCartao));
      except
        vDadosIni.vConcCartao.vDataVersaoCieloConcCartao := '';
      end;
    end;

    buscasArq.Close;
    if vDadosIni.vEmp.vFinanceiroUnificado then
      buscasArq.SQL.Text := ' select * from adm_cartao adm ' +
        ' inner join empresa emp on emp.cod_empresa = adm.cod_empresa ' +
        ' inner join conciliacao_adquirente adq on adm.cod_adquirente = adq.id ' +
        ' where emp.financeiro_unificado = ''S'' ' +
        ' and emp.codigo_unificadora = ' + vDadosIni.codEmpresa +
        ' and adq.nome = ''Cielo'' ' +
        ' and adm.ativo = 1 ' +
        ' order by adm.cod_empresa '
    else
      buscasArq.SQL.Text := ' select * from adm_cartao adm ' +
        ' inner join conciliacao_adquirente adq on adm.cod_adquirente = adq.id ' +
        ' where adm.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and adq.nome = ''Cielo'' ' +
        ' and adm.ativo = 1 ' +
        ' order by adm.cod_empresa ';
    buscasArq.Open;

    if buscasArq.IsEmpty then
    begin
      vtemp := 'Nenhum administradora de cartão vinculado ao aquirente Cielo.' + #13 + #13 +
        ' Favor verificar antes de continuar.';

      FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
      Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    cdsArq := TClientDataSet.Create(nil);
    cdsArq.Close;
    cdsArq.FieldDefs.Clear;
    cdsArq.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
    cdsArq.FieldDefs.Add('DIRETORIO', ftString, 100, false);

    if cdsArq.Tag = 0 then
    try
      cdsArq.CreateDataSet;
      cdsArq.Tag := 1;
    except
    end;

    cdsArq.EmptyDataSet;

    buscasArq.First;
    while not buscasArq.Eof do
    begin
      vCodEmpresa := buscasArq.FieldByName('COD_EMPRESA').AsInteger;
      vDiretorio  := trim(buscasArq.FieldByName('END_ARQUIVO_ADM').AsString);

      if not DirectoryExists(vDiretorio) then
      begin
        vtemp := 'Diretório da administradora de cartão não encontrado.' + #13 + #13 +
          ' Diretório: ' + vDiretorio + #13 + #13 +
          ' Favor verificar antes de continuar.';

        FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
        Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;

      if not DirectoryExists(vDiretorio + '\PROCESSADOS') then
        CreateDir(vDiretorio + '\PROCESSADOS');

      if not DirectoryExists(vDiretorio + '\PROCESSADOS') then
      begin
        vtemp := 'Não foi possível criar diretório.' + #13 + #13 +
          ' Diretório: ' + vDiretorio + '\PROCESSADOS' + #13 + #13 +
          ' Favor verificar antes de continuar.';

        FrmConciliaCartaoConfere.MemoErros.Lines.Add(vtemp);
        Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;

      cdsArq.Insert;
      cdsArq.FieldByName('COD_EMPRESA').AsInteger := vCodEmpresa;
      cdsArq.FieldByName('DIRETORIO').AsString := vDiretorio;
      cdsArq.Post;

      buscasArq.Next;
    end;

    cdsArq.First;
    while not cdsArq.Eof do
    begin
    	vCodEmpresa := cdsArq.FieldByName('COD_EMPRESA').AsInteger;
      vDiretorio := trim(cdsArq.FieldByName('DIRETORIO').AsString);

      vIncArq  := 0;
      vQtdeArq := 0;

      vListaArq.Clear;

      if SysUtils.FindFirst(vDiretorio + '\' + '*.*', faAnyFile, SR) = 0 then
      begin
        try
          repeat
          if (SR.Name <> '.')
            and (SR.Name <> '..')
            and (Copy(LowerCase(trim(SR.Name)), Length(trim(SR.Name)) - 3, 4) = '.txt') then
          begin
            if (Pos('CIELO03', UpperCase(SR.Name)) > 0)
              or (Pos('CIELO04', UpperCase(SR.Name)) > 0) then
                Inc(vQtdeArq);

            vListaArq.Add(SR.Name);
          end;

          until SysUtils.FindNext(SR) <> 0;
        finally
          SysUtils.FindClose(SR);
        end;
      end;

      if SysUtils.FindFirst(trim(vDiretorio) + '\' + '*.*', faAnyFile, SR) = 0 then
      begin
        try
          repeat
          Application.ProcessMessages;

          if (SR.Name <> '.')
            and (SR.Name <> '..')
            and (Copy(LowerCase(trim(SR.Name)), Length(trim(SR.Name)) - 3, 4) = '.txt') then
          begin
            if (Pos('CIELO03', UpperCase(SR.Name)) > 0)
              or (Pos('CIELO04', UpperCase(SR.Name)) > 0) then
            begin
              Inc(vIncArq);

              vDadosIni.abreStatusProcessamento('',
                'Emp ' + IntToStr(vCodEmpresa) + ' - ' +
                SR.Name + ' (' + IntToStr(vIncArq) + '/' + IntToStr(vQtdeArq) + ')');

              zerarVariaveis;

              vCieloFinanc.arquivo     := SR.Name;

              vLinha.Clear;
              try
                // Lendo arquivo
                AssignFile(F, trim(vDiretorio) + '\' + SR.Name);
                Reset(F);
                while not System.Eof(F) do
                begin
                  Readln(F, linha);
                  vLinha.Add(linha);
                end;
              finally
                closeFile(F);
              end;

              if (Copy(vLinha[0], 43, 5) = 'CIELO')
                and (Copy(vLinha[0], 1, 1) = '0') then
              begin
              	vCieloFinanc.dataArquivo :=
                  Copy(vLinha[0], 18, 2) + '/' +
                  Copy(vLinha[0], 16, 2) + '/' +
                  Copy(vLinha[0], 12, 4);

                if (StrToFloat(Copy(vLinha[0], 71, 3)) >=
                     vDadosIni.IfThen(trim(vDadosIni.vConcCartao.vVersaoLayoutCieloConcCartao) <> '',
                       StrToFloat(trim(vDadosIni.vConcCartao.vVersaoLayoutCieloConcCartao)),
                       15))
                  and (EncodeDate(StrToInt(Copy(vLinha[0], 12, 4)),
                               StrToInt(Copy(vLinha[0], 16, 2)),
                               StrToInt(Copy(vLinha[0], 18, 2))) >=
                                vDadosIni.IfThen(trim(vDadosIni.vConcCartao.vDataVersaoCieloConcCartao) <> '',
                                  StrToDate(vDadosIni.vConcCartao.vDataVersaoCieloConcCartao),
                                  EncodeDate(2024, 1, 16))) then

                if (Pos('CIELO03', UpperCase(SR.Name)) > 0) then // Vendas / capturadas
                begin
                  for I := 0 to vLinha.Count - 1 do
                  begin
                    Application.ProcessMessages;

                    vDadosIni.abreStatusProcessamento('',
                      'Emp ' + IntToStr(vCodEmpresa) + ' - ' +
                      SR.Name + ' ' + IntToStr(vIncArq) + '/' + IntToStr(vQtdeArq) + ' - ' +
                      IntToStr(I + 1) + '/' + IntToStr(vLinha.Count));

                    linha := vLinha[I];

                    vCieloFinanc.linha := linha;

                    if Copy(linha, 1, 1) = 'E' then
                    begin
                      vCieloFinanc.statusPg := '00';

                      vCieloFinanc.estabSubMissor := trim(Copy(linha, 2, 10));
                      vCieloFinanc.bandeira := trim(Copy(linha, 12, 3));
                      vCieloFinanc.tipoLiquidacao := trim(Copy(linha, 15, 3));

                      if (trim(Copy(linha, 18, 2)) <> '') and (trim(Copy(linha, 18, 2)) <> '00') then
                        vCieloFinanc.qtdParcela := StrToInt(trim(Copy(linha, 18, 2)))
                      else
                        vCieloFinanc.qtdParcela := 0;

                      if (trim(Copy(linha, 20, 2)) <> '') and (trim(Copy(linha, 20, 2)) <> '00') then
                        vCieloFinanc.totParcela := StrToInt(Copy(linha, 20, 2))
                      else
                        vCieloFinanc.totParcela := 0;

                      if (trim(Copy(linha, 22, 6)) <> '') and (trim(Copy(linha, 22, 6)) <> '000000') then
                        vCieloFinanc.codAutorizacao := trim(Copy(linha, 22, 6))
                      else
                        vCieloFinanc.codAutorizacao := '';

                      vCieloFinanc.tipoLancamento := trim(Copy(linha, 28, 2));
                      vCieloFinanc.chaveUR := trim(Copy(linha, 30, 100));
                      vCieloFinanc.codTransRecContr := trim(Copy(linha, 130, 22));
                      vCieloFinanc.codAjuste	 := trim(Copy(linha, 152, 4));
                      vCieloFinanc.formPag := trim(Copy(linha, 156, 3));
                      vCieloFinanc.binCartao := trim(Copy(linha, 166, 6));
                      vCieloFinanc.numCartao := trim(Copy(linha, 172, 4));

                      if (trim(Copy(linha, 176, 6)) <> '') and (trim(Copy(linha, 176, 6)) <> '000000') then
                        vCieloFinanc.nsuDoc := trim(Copy(linha, 176, 6))
                      else
                        vCieloFinanc.nsuDoc := '';

                      if (trim(Copy(linha, 182, 10)) <> '') and (trim(Copy(linha, 182, 10)) <> '0000000000') then
                        vCieloFinanc.numNota := trim(Copy(linha, 182, 10))
                      else
                        vCieloFinanc.numNota := '';

                      if (trim(Copy(linha, 248, 13)) <> '') and (trim(Copy(linha, 248, 13)) <> '0000000000000') then
                        vCieloFinanc.valorBrutoVnd := StrToFloat(trim(Copy(linha, 247, 12)) + ',' + trim(Copy(linha, 259, 2)))
                      else
                        vCieloFinanc.valorBrutoVnd := 0;

                      if (trim(Copy(linha, 262, 13)) <> '') and (trim(Copy(linha, 262, 13)) <> '0000000000000') then
                        vCieloFinanc.valorBrutoParc := StrToFloat(trim(Copy(linha, 261, 12)) + ',' + trim(Copy(linha, 273, 2)))
                      else
                        vCieloFinanc.valorBrutoParc := 0;

                      if (trim(Copy(linha, 276, 13)) <> '') and (Copy(linha, 276, 13) <> '0000000000000') then
                        vCieloFinanc.valorLiqParc := StrToFloat(Copy(linha, 275, 12) + ',' + Copy(linha, 287, 2))
                      else
                        vCieloFinanc.valorLiqParc := 0;

                      if (trim(Copy (linha, 477, 2)) <> '') then
                        vCieloFinanc.grupoCartao := trim(Copy (linha, 477, 2))
                      else
                        vCieloFinanc.grupoCartao := '';

                      vCieloFinanc.bandeiraAut := trim(Copy(linha, 493, 3));

                      if (trim(Copy(linha, 496, 15)) <> '') and (trim(Copy(linha, 496, 15)) <> '000000000000000') then
                        vCieloFinanc.codUnicoVnd := trim(Copy(linha, 496, 15))
                      else
                        vCieloFinanc.codUnicoVnd := '';

                      if (trim(Copy(linha, 511, 15)) <> '') and (trim(Copy(linha, 511, 15)) <> '000000000000000') then
                        vCieloFinanc.codOrigVnd := trim(Copy(linha, 511, 15))
                      else
                        vCieloFinanc.codOrigVnd := '';

                      vCieloFinanc.codUnAjuste := trim(Copy(linha, 526, 15));
                      vCieloFinanc.meioCaptura := trim(Copy(linha, 541, 3));

                      if (trim(Copy(linha, 544, 8)) <> '') and (trim(Copy(linha, 544, 8)) <> '00000000')  then
                        vCieloFinanc.numTerminal := trim(Copy(linha, 544, 8))
                      else
                        vCieloFinanc.numTerminal := '';

                      vCieloFinanc.tipoTransacao := trim(Copy(linha, 554, 3));

                      if (trim(Copy(linha, 566, 8)) <> '') and (trim(Copy(linha, 566, 8)) <> '00000000') then
                        vCieloFinanc.dataAutorizacao :=
                          Copy(linha, 566, 2) + '/' +
                          Copy(linha, 568, 2) + '/' +
                          Copy(linha, 570, 4) + '/'
                      else
                        vCieloFinanc.dataAutorizacao := '';

                      if (trim(Copy(linha, 574, 8)) <> '') and (trim(Copy(linha, 574, 8)) <> '00000000') then
                        vCieloFinanc.dataCaptura :=
                          Copy(linha, 574, 2) + '/' +
                          Copy(linha, 576, 2) + '/' +
                          Copy(linha, 578, 4)
                      else
                        vCieloFinanc.dataCaptura := '';

                      if (trim(Copy(linha, 582, 8)) <> '') and (trim(Copy(linha, 582, 8)) <> '00000000') then
                        vCieloFinanc.dataMovimento :=
                          Copy(linha, 582, 2) + '/' +
                          Copy(linha, 584, 2) + '/' +
                          Copy(linha, 586, 4)
                      else
                        vCieloFinanc.dataMovimento := '';

                      if (trim(Copy(linha, 590, 8)) <> '') and (trim(Copy(linha, 590, 8)) <> '00000000') then
                        vCieloFinanc.dataMovimentoOrig :=
                          Copy(linha, 590, 2) + '/' +
                          Copy(linha, 592, 2) + '/' +
                          Copy(linha, 594, 4)
                      else
                        vCieloFinanc.dataMovimentoOrig := '';

                      if (trim(Copy(linha, 598, 7)) <> '') and (trim(Copy(linha, 598, 7)) <> '0000000') then
                        vCieloFinanc.numLote := Copy(linha, 598, 7)
                      else
                        vCieloFinanc.numLote := '';

                      vCieloFinanc.numTransProcess := trim(Copy(linha, 605, 22));

                      if (trim(Copy(linha, 630, 8)) <> '') and (trim(Copy(linha, 630, 8)) <> '00000000') then
                        vCieloFinanc.dataVencOrig :=
                          Copy(linha, 630, 2) + '/' +
                          Copy(linha, 632, 2) + '/' +
                          Copy(linha, 634, 2) + '/'
                      else
                        vCieloFinanc.dataVencOrig := '';

                      if (trim(Copy(linha, 648, 2)) <> '') then
                        vCieloFinanc.tipoCartao := Copy(linha, 648, 2)
                      else
                        vCieloFinanc.tipoCartao := '';

                      vCieloFinanc.matriz := trim(Copy(linha, 638, 10));
                      vCieloFinanc.banco := trim(Copy(linha, 653, 4));
                      vCieloFinanc.agencia := trim(Copy(linha, 657, 5));
                      vCieloFinanc.conta := trim(Copy(linha, 662, 20));
                      vCieloFinanc.digitoConta := trim(Copy(linha, 682, 1));

                      if not InserirRegistroFinanceiro then
                        exit;
                    end;
                  end;

                  if buscas.Transaction.InTransaction then
                    buscas.Transaction.Commit
                end
                else if (Pos('CIELO04', UpperCase(SR.Name)) > 0) then //Pagamentos + PIX
                begin
                  for I := 0 to vLinha.Count - 1 do
                  begin
                    Application.ProcessMessages;

                    vDadosIni.abreStatusProcessamento('',
                      'Emp ' + IntToStr(vCodEmpresa) + ' - ' +
                      SR.Name + ' ' + IntToStr(vIncArq) + '/' + IntToStr(vQtdeArq) + ' - ' +
                      IntToStr(I + 1) + '/' + IntToStr(vLinha.Count));

                    linha := vLinha[I];

                    vCieloFinanc.linha := linha;

                    if Copy(linha, 1, 1) = 'D' then
                    begin
                      vCieloFinanc.estabSubmissorPg := trim(Copy(linha, 2, 10));
                      vCieloFinanc.bandeiraPg := trim(Copy(linha, 54, 3));
                      vCieloFinanc.matrizPg := trim(Copy(linha, 60, 10));
                      vCieloFinanc.statusPg := trim(Copy(linha, 70, 2));

                      if (trim(Copy(linha, 73, 12)) <> '') and (trim(Copy(linha, 73, 13)) <> '0000000000000') then
                        vCieloFinanc.valorBrutoLote := StrToFloat(trim(Copy(linha, 72, 12)) + ',' + trim(Copy(linha, 84, 2)))
                      else
                        vCieloFinanc.valorBrutoLote := 0;

                      if (trim(Copy(linha, 101, 13)) <> '') and (trim(Copy(linha, 101, 13)) <> '0000000000000') then
                        vCieloFinanc.valorLiqLote := StrToFloat(trim(Copy(linha, 100, 12)) + ',' + trim(Copy(linha, 112, 2)))
                      else
                        vCieloFinanc.valorLiqLote := 0;

                      vCieloFinanc.bancoPg := trim(Copy(linha, 114, 4));
                      vCieloFinanc.agenciaPg := trim(Copy(linha, 118, 5));
                      vCieloFinanc.contaPg := trim(Copy(linha, 123, 20));
                      vCieloFinanc.digitoContaPg := trim(Copy(linha, 143, 1));

                      if (trim(Copy(linha, 254, 1)) <> '') then
                        vCieloFinanc.tipoAntecipacaoPg := trim(Copy(linha, 254, 1))
                      else
                        vCieloFinanc.tipoAntecipacaoPg := '';

                      if (trim(Copy(linha, 255, 9)) <> '') and (trim(Copy(linha, 255, 9)) <> '000000000') then
                        vCieloFinanc.numAntecipacaoPg := trim(Copy(linha, 255, 9))
                      else
                        vCieloFinanc.numAntecipacaoPg := '';

                      if (trim(Copy(linha, 268, 8)) <> '') and (trim(Copy(linha, 268, 8)) <> '00000000') then
                        vCieloFinanc.dataPg :=
                          Copy(linha, 268, 2) + '/' +
                          Copy(linha, 270, 2) + '/' +
                          Copy(linha, 272, 4)
                      else
                        vCieloFinanc.dataPg := '';

                      if (trim(Copy(linha, 276, 8)) <> '') and (trim(Copy(linha, 276, 8)) <> '00000000') then
                        vCieloFinanc.dataEnvioBancoPg :=
                          Copy(linha, 276, 2) + '/' +
                          Copy(linha, 278, 2) + '/' +
                          Copy(linha, 280, 4)
                      else
                        vCieloFinanc.dataEnvioBancoPg := '';

                      if (trim(Copy(linha, 284, 8)) <> '') and (trim(Copy(linha, 284, 8)) <> '') then
                        vCieloFinanc.dataVencOrigPg :=
                          Copy(linha, 284, 2) + '/' +
                          Copy(linha, 286, 2) + '/' +
                          Copy(linha, 288, 2)
                      else
                        vCieloFinanc.dataVencOrigPg := '';

                      if (trim(Copy(linha, 284, 8)) <> '') and (trim(Copy(linha, 284, 8)) <> '00000000') then
                        vCieloFinanc.numEstabPg :=
                          Copy(linha, 284, 2) + '/' +
                          Copy(linha, 286, 2) + '/' +
                          Copy(linha, 288, 4)
                      else
                        vCieloFinanc.numEstabPg := '';
                    end
                    else if Copy(linha, 1, 1) = 'E' then
                    begin
                      vCieloFinanc.estabSubMissor := trim(Copy(linha, 2, 10));
                      vCieloFinanc.bandeira := trim(Copy(linha, 12, 3));
                      vCieloFinanc.tipoLiquidacao := trim(Copy(linha, 15, 3));

                      if (trim(Copy(linha, 18, 2)) <> '') and (trim(Copy(linha, 18, 2)) <> '00') then
                        vCieloFinanc.qtdParcela := StrToInt(trim(Copy(linha, 18, 2)))
                      else
                        vCieloFinanc.qtdParcela := 0;

                      if (trim(Copy(linha, 20, 2)) <> '') and (trim(Copy(linha, 20, 2)) <> '00') then
                        vCieloFinanc.totParcela := StrToInt(trim(Copy(linha, 20, 2)))
                      else
                        vCieloFinanc.totParcela := 0;

                      if (trim(Copy(linha, 22, 6)) <> '') and (trim(Copy(linha, 22, 6)) <> '000000') then
                        vCieloFinanc.codAutorizacao := trim(Copy(linha, 22, 6))
                      else
                        vCieloFinanc.codAutorizacao := '';

                      vCieloFinanc.tipoLancamento := trim(Copy(linha, 28, 2));
                      vCieloFinanc.chaveUR := trim(Copy(linha, 30, 100));
                      vCieloFinanc.codTransRecContr := trim(Copy(linha, 130, 22));
                      vCieloFinanc.codAjuste := trim(Copy(linha, 152, 4));
                      vCieloFinanc.formPag := trim(Copy(linha, 156, 3));
                      vCieloFinanc.binCartao := trim(Copy(linha, 166, 6));
                      vCieloFinanc.numCartao := trim(Copy(linha, 172, 4));

                      if (trim(Copy(linha, 176, 6)) <> '') and (trim(Copy(linha, 176, 6)) <> '000000') then
                        vCieloFinanc.nsuDoc := trim(Copy(linha, 176, 6))
                      else
                        vCieloFinanc.nsuDoc := '';

                      if (trim(Copy(linha, 182, 10)) <> '') and (trim(Copy(linha, 182, 10)) <> '0000000000') then
                        vCieloFinanc.numNota := trim(Copy(linha, 182, 10))
                      else
                        vCieloFinanc.numNota := '';

                      if (trim(Copy(linha, 248, 13)) <> '') and (trim(Copy(linha, 248, 13)) <> '0000000000000') then
                        vCieloFinanc.valorBrutoVnd := StrToFloat(trim(Copy(linha, 247, 12)) + ',' + trim(Copy(linha, 259, 2)))
                      else
                        vCieloFinanc.valorBrutoVnd := 0;

                      if (trim(Copy(linha, 262, 13)) <> '') and (trim(Copy(linha, 262, 13)) <> '0000000000000') then
                        vCieloFinanc.valorBrutoParc := StrToFloat(trim(Copy(linha, 261, 12)) + ',' + trim(Copy(linha, 273, 2)))
                      else
                        vCieloFinanc.valorBrutoParc := 0;

                      if (trim(Copy(linha, 276, 13)) <> '') and (trim(Copy(linha, 276, 13)) <> '0000000000000') then
                        vCieloFinanc.valorLiqParc := StrToFloat(trim(Copy(linha, 275, 12)) + ',' + trim(Copy(linha, 287, 2)))
                      else
                        vCieloFinanc.valorLiqParc := 0;

                      if (trim(Copy (linha, 477, 2)) <> '') then
                        vCieloFinanc.grupoCartao := trim(Copy (linha, 477, 2))
                      else
                        vCieloFinanc.grupoCartao := '';

                      vCieloFinanc.bandeiraAut := trim(Copy(linha, 493, 3));

                      if (trim(Copy(linha, 496, 15)) <> '') and (trim(Copy(linha, 496, 15)) <> '000000000000000') then
                        vCieloFinanc.codUnicoVnd := trim(Copy(linha, 496, 15))
                      else
                        vCieloFinanc.codUnicoVnd := '';

                      if (trim(Copy(linha, 511, 15)) <> '') and (trim(Copy(linha, 511, 15)) <> '000000000000000') then
                        vCieloFinanc.codOrigVnd := trim(Copy(linha, 511, 15))
                      else
                        vCieloFinanc.codOrigVnd := '';

                      vCieloFinanc.codUnAjuste := trim(Copy(linha, 526, 15));
                      vCieloFinanc.meioCaptura := trim(Copy(linha, 541, 3));

                      if (trim(Copy(linha, 544, 8)) <> '') and (trim(Copy(linha, 544, 8)) <> '00000000')  then
                        vCieloFinanc.numTerminal := trim(Copy(linha, 544, 8))
                      else
                        vCieloFinanc.numTerminal := '';

                      vCieloFinanc.tipoTransacao := trim(Copy(linha, 554, 3));

                      if (trim(Copy(linha, 566, 8)) <> '') and (trim(Copy(linha, 566, 8)) <> '00000000') then
                        vCieloFinanc.dataAutorizacao :=
                          Copy(linha, 566, 2) + '/' +
                          Copy(linha, 568, 2) + '/' +
                          Copy(linha, 570, 4) + '/'
                      else
                        vCieloFinanc.dataAutorizacao := '';

                      if (trim(Copy(linha, 574, 8)) <> '') and (trim(Copy(linha, 574, 8)) <> '00000000') then
                        vCieloFinanc.dataCaptura :=
                          Copy(linha, 574, 2) + '/' +
                          Copy(linha, 576, 2) + '/' +
                          Copy(linha, 578, 4)
                      else
                        vCieloFinanc.dataCaptura := '';

                      if (trim(Copy(linha, 582, 8)) <> '') and (trim(Copy(linha, 582, 8)) <> '00000000') then
                        vCieloFinanc.dataMovimento :=
                          Copy(linha, 582, 2) + '/' +
                          Copy(linha, 584, 2) + '/' +
                          Copy(linha, 586, 4)
                      else
                        vCieloFinanc.dataMovimento := '';

                      if (trim(Copy(linha, 590, 8)) <> '') and (trim(Copy(linha, 590, 8)) <> '00000000') then
                        vCieloFinanc.dataMovimentoOrig :=
                          Copy(linha, 590, 2) + '/' +
                          Copy(linha, 592, 2) + '/' +
                          Copy(linha, 594, 4)
                      else
                        vCieloFinanc.dataMovimentoOrig := '';

                      if (trim(Copy(linha, 598, 7)) <> '') and (trim(Copy(linha, 598, 7)) <> '0000000') then
                        vCieloFinanc.numLote := Copy(linha, 598, 7)
                      else
                        vCieloFinanc.numLote := '';

                      vCieloFinanc.numTransProcess := trim(Copy(linha, 605, 22));

                      if (trim(Copy(linha, 630, 8)) <> '') and (trim(Copy(linha, 630, 8)) <> '00000000') then
                        vCieloFinanc.dataVencOrig :=
                          Copy(linha, 630, 2) + '/' +
                          Copy(linha, 632, 2) + '/' +
                          Copy(linha, 634, 2) + '/'
                      else
                        vCieloFinanc.dataVencOrig := '';

                      if (trim(Copy(linha, 648, 2)) <> '') then
                        vCieloFinanc.tipoCartao := trim(Copy(linha, 648, 2))
                      else
                        vCieloFinanc.tipoCartao := '';

                      vCieloFinanc.matriz := trim(Copy(linha, 638, 10));
                      vCieloFinanc.banco := trim(Copy(linha, 653, 4));
                      vCieloFinanc.agencia := trim(Copy(linha, 657, 5));
                      vCieloFinanc.conta := trim(Copy(linha, 662, 20));
                      vCieloFinanc.digitoConta := trim(Copy(linha, 682, 1));

                      if not InserirRegistroFinanceiro then
                        exit;
                    end
                    else if Copy(linha, 1, 1) = '8' then // Pix
                    begin
                      zerarVariaveis;

                      vCieloFinanc.estabSubmissorPg := trim(Copy(linha, 2, 10));
                      if (trim(Copy(linha, 12, 2)) <> '') and (trim(Copy(linha, 12, 2)) <> '00') then
                        vCieloFinanc.tipoTransacao := trim(Copy(linha, 12, 2))
                      else
                        vCieloFinanc.tipoTransacao := '';

                      if (trim(Copy(linha, 14, 6)) <> '') and (trim(Copy(linha, 14, 6)) <> '000000') then
                        vCieloFinanc.dataCaptura :=
                          Copy(linha, 18, 2) + '/' +
                          Copy(linha, 16, 2) + '/' +
                          '20' + Copy(linha, 14, 2)
                      else
                        vCieloFinanc.dataCaptura := '';

                      if (trim(Copy(linha, 26, 36)) <> '') then
                        vCieloFinanc.PixId := trim(Copy(linha, 26, 36))
                      else
                        vCieloFinanc.PixId := '';

                      if (trim(Copy(linha, 62, 6)) <> '') and (trim(Copy(linha, 162, 6)) <> '000000') then
                        vCieloFinanc.nsuDoc := Copy(linha, 62, 6)
                      else
                        vCieloFinanc.nsuDoc := '';

                      if (trim(Copy(linha, 68, 6)) <> '') and (trim(Copy(linha, 68, 6)) <> '00000000') then
                        vCieloFinanc.dataMovimento :=
                          Copy(linha, 72, 2) + '/' +
                          Copy(linha, 70, 2) + '/' +
                          '20' + Copy(linha, 68, 2)
                      else
                        vCieloFinanc.dataMovimento := '';

                      if (trim(Copy(linha, 75, 13)) <> '') and (trim(Copy(linha, 75, 13)) <> '0000000000000') then
                        vCieloFinanc.valorBrutoVnd := StrToFloat(trim(Copy(linha, 74, 12)) + ',' + trim(Copy(linha, 86, 2)))
                      else
                        vCieloFinanc.valorBrutoVnd := 0;

                      vCieloFinanc.valorBrutoParc := vCieloFinanc.valorBrutoVnd;

                      vCieloFinanc.valorBrutoLote := vCieloFinanc.valorBrutoVnd;

                      if (trim(Copy(linha, 103, 13)) <> '') and (trim(Copy(linha, 103, 13)) <> '0000000000000') then
                        vCieloFinanc.valorLiqVnd := StrToFloat(trim(Copy(linha, 102, 12)) + ',' + trim(Copy(linha, 114, 2)))
                      else
                        vCieloFinanc.valorLiqVnd := 0;

                      vCieloFinanc.valorLiqParc := vCieloFinanc.valorLiqVnd;

                      vCieloFinanc.valorLiqLote := vCieloFinanc.valorLiqVnd;

                      vCieloFinanc.banco := trim(Copy(linha, 116, 4));
                      vCieloFinanc.agencia := trim(Copy(linha, 120, 5));
                      vCieloFinanc.conta := trim(Copy(linha, 125, 20));
                      vCieloFinanc.digitoConta := '';

                      if (trim(Copy(linha, 145, 6)) <> '') and (trim(Copy(linha, 145, 6)) <> '000000') then
                        vCieloFinanc.dataMovimentoOrig :=
                          Copy(linha, 149, 2) + '/' +
                          Copy(linha, 147, 2) + '/' +
                          '20' + Copy(linha, 145, 2)
                      else
                        vCieloFinanc.dataMovimentoOrig := '';

                      if (trim(Copy(linha, 220, 2)) <> '') and (trim(Copy(linha, 220, 2)) <> '00') then
                        vCieloFinanc.origemAjuste := trim(Copy(linha, 220, 2))
                      else
                        vCieloFinanc.origemAjuste := '';

                      if (trim(Copy(linha, 223, 2)) <> '') and (trim(Copy(linha, 223, 2)) <> '00') then
                        vCieloFinanc.statusTransf := trim(Copy(linha, 223, 2))
                      else
                        vCieloFinanc.statusTransf := '';

                      if (trim(Copy(linha, 162, 8)) <> '') and (trim(Copy(linha, 162, 8)) <> '00000000') then
                        vCieloFinanc.numTerminal := trim(Copy(linha, 162, 8))
                      else
                        vCieloFinanc.numTerminal := '';

                      if (trim(Copy(linha, 182, 36)) <> '') and (trim(Copy(linha, 182, 36)) <> '000000000000000000000000000000000000') then
                        vCieloFinanc.pixOriginalId := trim(Copy(linha, 182, 36))
                      else
                        vCieloFinanc.pixOriginalId := '';

                      if not InserirRegistroFinanceiro then
                        exit;
                    end;
                  end;

                  if buscas.Transaction.InTransaction then
                    buscas.Transaction.Commit
                end;
              end;
            end;
          end;
          until SysUtils.FindNext(SR) <> 0;
        finally
          SysUtils.FindClose(SR);
        end;
      end;

      // Mover para pasta arquivos processados
      for I := 0 to vListaArq.Count - 1 do
      begin
        Application.ProcessMessages;

        if (trim(vListaArq[I]) <> '') then
        begin
          vDadosIni.abreStatusProcessamento('',
            'Movendo extrato para processados: ' +
            'Emp ' + IntToStr(vCodEmpresa) + ' - ' +
            trim(vListaArq[I]) + ' ' +
            IntToStr(I + 1) + '/' + IntToStr(vListaArq.Count));

          if CopyFile(Pchar(trim(vDiretorio) + '\' + trim(vListaArq[I])),
                      Pchar(trim(vDiretorio) + '\PROCESSADOS\' + trim(vListaArq[I])), false) then
            DeleteFile(trim(vDiretorio) + '\' + trim(vListaArq[I]));
        end;
      end;

      cdsArq.Next;
    end;

    Result := True;
  finally
  	if Assigned(cdsArq) then
      FreeAndNil(cdsArq);
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TConciliacartaoNumEst }

function TConciliacartaoNumEst.abreConciliacartaoNumEst: boolean;
begin
	Result := montaSelect(
  	vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
      ' select conciliacao_estab_emp.cod_estab, conciliacao_estab_emp.codigo, ' +
      ' (coalesce(conciliacao_estab_emp.codigo, '''') || '' - '' || coalesce(identificacao_emp, nome_emp) || '' - '' || coalesce(cgc_emp, '''')) identificacao_emp from conciliacao_estab_emp ' +
      ' inner join empresa on empresa.cod_empresa = conciliacao_estab_emp.cod_estab ' +
      ' where conciliacao_estab_emp.cod_estab = ' + vDadosIni.codEmpresa +
      ' order by 1, 2 ',
      ' select 0 cod_empresa, ''Todos'' codigo, ''Todos'' identificacao_emp from rdb$database ' +
      ' union all ' +
      ' select conciliacao_estab_emp.cod_estab, conciliacao_estab_emp.codigo, ' +
      ' (coalesce(conciliacao_estab_emp.codigo, '''') || '' - '' || coalesce(identificacao_emp, nome_emp) || '' - '' || coalesce(cgc_emp, '''')) identificacao_emp from conciliacao_estab_emp ' +
      ' inner join empresa on empresa.cod_empresa = conciliacao_estab_emp.cod_estab ' +
      ' order by 1, 2 '));
end;

constructor TConciliacartaoNumEst.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsNumEstConciliacao);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

{ TconciliacartaoConfereAdm }

function TconciliacartaoConfereAdm.abreConsultaFinanceiroAdm(pDataIni,
  pDataFim: TDateTime; pTempSql: string): boolean;
var
	vtempSql: string;
	vWhere: string;
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Consultando registros financeiro x registros da administradora ...');

		vUltSQL := '';
        
    vWhere :=
      ' where DATA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataIni)) +
      ' and DATA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataFim)) +
      pTempSql;

    vtempSql := vSQL +
      vWhere +
      ' order by DATA, COD_EMPRESA ';

    Result := montaSelect(vtempSql);
  finally
  	dataSet.First;
	  dataSet.EnableControls;
    
  	if trim(vtempSql) <> '' then
      vUltSQL := vtempSql;

    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TconciliacartaoConfereAdm.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoFinanceiroAdm);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  vunificadasConcCartao := TConciliaUnificadas.create;
  vunificadasConcCartao.dataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoUnificadas3);

  vnumestConcCartao := TConciliacartaoNumEst.create;
  vnumestConcCartao.dataSet := TClientDataSet(dtmContasAReceber.cdsNumEstConciliacao3);

  vadmcartaoConcCartao := TConciliacartaoAdmCartao.create;
  vadmcartaoConcCartao.dataSet := TClientDataSet(dtmContasAReceber.cdsAdmCartaoConciliacao3);

  vbandeiraConcCartao := TConciliacartaoBandeira.create;
  vbandeiraConcCartao.dataSet := TClientDataSet(dtmContasAReceber.cdsConciliacaoBandeira3);
  
	vSQL := ' select DATA, DATE_, REQUEST_DATE, EFFECTED_DATE, PAYMENT_DATE, BANK_SHIPPING_DATE, ' +
    ' ID, COD_EMPRESA, ARQUIVO, DATA_ARQUIVO, ESTABLISHMENT_NUMBER, NSU, AUTHORIZATION_NUMBER, ' +
  	' TYPE_, TYPE_DESCRIPTION, ACQUIRER_ID, ACQUIRER_NAME, BRAND_ID, BRAND_NAME, ' +
    ' EVENT_TYPE,  EVENT_TYPE_DESCRIPTION, ' +
    ' DESCRIPTION, BANK_RECON_STATUS, BANK_RECON_DESCRIPTION, ' +
    ' GROSS_AMOUNT, EVENT_NET_AMOUNT, BATCH_NET_AMOUNT, GROSS_EVENT_AMOUNT, BATCH_GROSS_AMOUNT, ' +
    ' TAX, SALE_TAX, CUSTOMER_TAX, INSTALLMENT_NUMBER, INSTALLMENTS_TOTAL, ' +
    ' BANK_NUMBER, BANK_NAME, BRANCH_NUMBER, ACCOUNT_NUMBER, ' +
    ' IDENTIFICACAO_EMP, CODIGO_CTRL, NOME_CTRL, CODIGO_CTRL_TX, NOME_CTRL_TX, ' +
    ' N_CONTA_PLC_TX_CARTAO, N_CONTA_PLC_TARIFA_CARTAO, N_CONTA_PLC, DESC_PLC, ' +
    ' COD_CRED, N_DOC_V, N_DOC_C, TP_DOC_V, VALOR_C, VALOR_LIQUIDO, VALOR_ORIGINAL, ' +
    ' DATA_REC_C, DATA_VENC_C, DATQ_C, STATUSQ_C, TAXA_CRED, STATUS_C, COD_CLIENTE, NOME_CLIENTE, RAZAO, ' +
    ' COD_TERMINAL_ADM, DESC_TERM_ADM, COD_ADM, DESCRICAO_ADM, ' +
    ' COD_BANDEIRA_ADM, DESC_BANDEIRA_ADM, PIX_ID, ' +
    ' FORM_PAG_COD, FORM_PAG, COD_AJUSTE_COD, COD_AJUSTE, BANDEIRA_COD, BANDEIRA, ' +
    ' STATUS_PAG_COD, STATUS_PAG, STATUS_PAG_ST, ' +
    ' TIPO_LANCAMENTO_COD, TIPO_LANCAMENTO, TIPO_LIQUIDACAO_COD, TIPO_LIQUIDACAO, ' +
    ' TIPO_ANTECIPACAO_COD, TIPO_ANTECIPACAO, TIPO_CARTAO_COD, TIPO_CARTAO, ' +
    ' MOTIVO_REJ_COD, MOTIVO_REJ, GRUPO_CARTAO_COD, GRUPO_CARTAO, ' +
    ' TIPO_TRANSACAO_COD, TIPO_TRANSACAO, STATUS_TRANSF_COD, STATUS_TRANSF, STATUS_TRANSF_ST, ' +
    ' ORIGEM_AJUSTE_COD, ORIGEM_AJUSTE ' +
    ' from VW_CONCILIACAO_FINANC_ADM ';

end;

destructor TconciliacartaoConfereAdm.Destroy;
begin
  vunificadasConcCartao.Free;
  vunificadasConcCartao := nil;

  vnumestConcCartao.Free;
  vnumestConcCartao := nil;

	vadmcartaoConcCartao.Free;
  vadmcartaoConcCartao := nil;

  vbandeiraConcCartao.Free;
  vbandeiraConcCartao := nil;
  
  inherited;
end;

procedure TconciliacartaoConfereAdm.somarSelecionados;
var
	vTotalVendas: Double;
  vTotalAntecipacoes: Double;
  vTotalCancelamentos: Double;
  vTotalChargeBack: Double;
  vTotalAjustesPositivo: Double;
  vTotalAjustesNegativo: Double;
begin
	if dataSet.IsEmpty then
    exit;

  try
  	vDadosIni.abreStatusProcessamento('', 'Realizando somatório...');
    vTotalVendas := 0;
    vTotalAntecipacoes := 0;
    vTotalCancelamentos := 0;
    vTotalChargeBack := 0;
    vTotalAjustesPositivo := 0;
    vTotalAjustesNegativo := 0;

    try
    	storeRecNo;
      dataSet.DisableControls;
      dataSet.first;
      while not dataSet.Eof do
      begin
        if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Venda' then
          vTotalVendas := vTotalVendas + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

        if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Antecipação' then
          vTotalAntecipacoes := vTotalAntecipacoes + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

        if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Cancelamento' then
          vTotalCancelamentos := vTotalCancelamentos + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

        if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Chargeback' then
          vTotalChargeBack := vTotalChargeBack + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

        if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Ajuste' then
          if dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat >= 0 then
            vTotalAjustesPositivo := vTotalAjustesPositivo + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

        if trim(dataSet.FieldByName('EVENT_TYPE_DESCRIPTION').AsString) = 'Ajuste' then
          if dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat < 0 then
            vTotalAjustesNegativo := vTotalAjustesNegativo + dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

        dataSet.next;
      end;
    finally
      dataSet.EnableControls;
      restoreRecNo;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    FrmConciliaCartaoConfere.lbTotalVendas.Caption         := format('%m', [vTotalVendas]);
    FrmConciliaCartaoConfere.lbTotalAntecipacoes.Caption   := format('%m', [vTotalAntecipacoes]);
    FrmConciliaCartaoConfere.lbTotalCancelamentos.Caption  := format('%m', [vTotalCancelamentos]);
    FrmConciliaCartaoConfere.lbTotalChargeback.Caption     := format('%m', [vTotalChargeBack]);
    FrmConciliaCartaoConfere.lbTotalAjustePositivo.Caption := format('%m', [vTotalAjustesPositivo]);
    FrmConciliaCartaoConfere.lbTotalAjusteNegativo.Caption := format('%m', [vTotalAjustesNegativo]);
    FrmConciliaCartaoConfere.lbTotal.Caption               := format('%m', [vTotalVendas +
      																																		  vTotalAntecipacoes +
                                                          									vTotalCancelamentos +
                                                          									vTotalChargeBack +
                                                          									vTotalAjustesPositivo +
                                                                            vTotalAjustesNegativo]);
    vDadosIni.abreForm('TOTAL FINANCEIRO X ADM:', FrmConciliaCartaoConfere.pnTotalFinanceiro, [ofEscapeExit, ofAlignAllClientWinCtrl]);
  end;
end;

end.
