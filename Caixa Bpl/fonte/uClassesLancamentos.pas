unit uClassesLancamentos;

interface

uses
  uDataSet_OOP, Controls, UClassesCadastrosBasicosCx, DBGrids, RDprint, IBQuery, dialogs,
  DB, DBClient, funcoes;

type
  RLanc = record
    vNContaPlc: Double;
    vDescTipoConta, vTipoConta: string;
  end;
  
  RConsultaLanc = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd, quitados, naoQuitados: Boolean;
    //Opçoes Adicionais
    adicional: boolean;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd: string;
    tipoE, tipoS: string;
  end;

  RPrevisao = record
    strValorAnterior, strValorEntradas, strValorSaidas,
      strValorPosterior, strValorDiferenca, strValorConferencia: string;
  end;

  RTransferencia = record
    valorTransferencia: Currency;
    vControleOrigem, vControleDestino: Integer;
    historicoEntrada, historicoSaida: string;
  end;

  TContrapartida = class;
  TLancamentos = class;
  TPContasLanc = class;
  TControlesLanc = class;
  TSalCtrl = class;
  TFech_dia = class;
  TConciliacaoBanc = class;
  TEmpresasUnificadas = class;

  TPContasLanc = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosPContasLanc(NumContaSelecionada: Double): Boolean;
    function _abreEntSaiPContasLanc(EntSai: string; NumContaSelecionada: Double): Boolean;
  end;

  TEmpresasUnificadas = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosEmpresas: Boolean;
    function _BuscarEmpresas(vCodEmp: Integer): Boolean;
  end;

  TEstornarRecibo = class(TDataSet_OOP)
  public
    constructor create;
    function _abreEstornarReciboLanc(pCodLanc: Integer; pCodEmpresa: Integer): Boolean;
    function _abreEstornarRecibo(pCodRecibo: Integer = 0): Boolean;
    procedure _marcaDesmarcaLinha(DtSet: TDataSet);
    function estornarValeCompra(pCodigo: Integer; pCodEmpresa: Integer): boolean;
    function abreFormReciboValeCompra: boolean;
  var
    vValorRecSel: Double;
    vReciboSelecionados: Integer;
  end;

  TControlesLanc = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosControlesLanc(CodCtrlSelecionado: Integer; pCodEmpMult: Integer = 0): Boolean;
  end;

  TSalCtrl = class(TDataSet_OOP)
  public
    constructor create;
    function _abreSaldos(codcontrole: integer; Vdia: Tdate): Boolean;
  end;

  TFech_dia = class(TDataSet_OOP)
  public
    constructor create;
    function _abreFechamento(Vdia: string): Boolean;
    function retiraMarcaFech: boolean;
    function retiraMarcaImport: boolean;
  end;

  TContrapartida = class(TDataSet_OOP)
  private
    rdp: TRdPrint;
  public
    constructor create;
    function _estornarRecebimento(pCodContrapartida: Integer): Boolean;
    procedure imprimirLancamento(pCodContrapartida: Integer);
  end;

  TLancamentosFP = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function _abreLancamentosFP(
    	pCodLanc: Integer; pDataLanc: TDateTime;
      pLotePagamento: Integer; pLoteEntrada: Integer; pLoteSaida: Integer;
      pCodContrLanc: Integer; pCodContrCtp: Integer): Boolean;
  end;

  TDocSendoRec = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function _abreDocSendoRec: Boolean;
    procedure _marcaDesmarcaLinha;
    procedure _desmarcarTodos;
    procedure _marcarTodos;
    procedure _desmarcarDocumentoComoRecebendo;
  end;

  TLancamentos = class(TDataSet_OOP)
  private
    fLancamentos, fCheques, fCreditos, fCTP: TIBQuery;
    fDSLancamentos, fDSCheques, fDSCreditos, fDSCTP: TDataSource;
    QrBoletim, QrSlCtrl, QrResumo: TIBQuery;
    function _existePContas(pNContaPlc: Double;vtp: smallint): Boolean;
    function _existeControle(pControle: Integer): Boolean;
  protected
    FRdp: TRdPrint;
    ln, pag: integer;
    vdifcontrl: currency;
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _contaPossuiRateio(pNContaPlc: Double): Boolean;
    function _dataAindaNaoProgramada(pData: TDate): Boolean;
    function _dadosNContaPlcValidos(pNContaPlc: Double; pAbreHistPadrao: Boolean): Boolean;
    function testarNumConta(var pMensagem: string; pCodEmpMult: Integer = 0): boolean;
    function _chequeJaUtilizado(pControle: Integer; pNumCheque: string): Boolean;
    procedure _iniciarPrevisao;
    procedure _calcularPrevisao;
    procedure _somatorioLancamentos;
    procedure _enviarModuloTranf;
    procedure _marcarDesmarcarLancamentosComoVenda;
    function _abreFormTransferencia: Boolean;
    function _salvaLancamentosTransferencia: Boolean;
    function _EmiteBoletim(vdata: Tdate; vsintetico, vagrup: boolean): boolean;
    function _EmiteMapaDespRec(
    	vdatini: Tdate;
      vdatfim: Tdate;
    	vdetalhes: boolean;
      vexibirfornec: boolean;
      vtodascontas: boolean;
      vtipoMapa: string;
      vtpcxcomp: Boolean;
      pCodigoUnificada: Integer;
      AgruparEmpUnificada: string): boolean;
    procedure _rdMapaDespesaSendMail(Sender: TObject);
    procedure CabNovaPaginabol;
    procedure CabMapa(
    	vdeta: boolean;
      vfornec: boolean;
    	pCodigoUnificada: Integer;
      pAgruparEmpUnificada: string);
    function verificanmov: integer;
    //    function verificarDiferencas: boolean;
    function FecharDiaCX: boolean;
    function ReabirDiaCX: boolean;
    function verDocsSendoRec: boolean;
    function verFormpagpend: boolean;
    function verificarDocumentosSemRecebimento: boolean;
    function gravarDespesaVeic: boolean;
    function consulta: boolean;
    procedure _rdBoletimSendMail(Sender: TObject);
    function _abreDetalhesRecebimentosModalidade: Boolean;
    function estornaReciboValeCompra(var pCodLanc: Integer): boolean;
    function verificaLancamentoEstornoVale: boolean;
    function abreFormCredChqSendoRec: boolean;

    procedure cadLancamentos(TipoForm: integer);
    procedure datasetFormasPagAfterScroll(DataSet: TDataSet);
    property Rdp: TRdPrint read FRdp write FRdp;
  var
  	vFpLanc: TLancamentosFP;
  	vCodEmpMult: Integer;
    vCodigoCtrl: Integer;
    vDataReferencia: TDateTime;
    vdatamovBol: TDate;
    vdata1, vdata2: Tdate;
    vpermitir: boolean;
    vNumConta: Double;
  var
    //Objetos
    rLanc: RLanc;
    vEstornarRecibo: TEstornarRecibo;
    vPCont: TPContasLanc;
    vCtrl: TControlesLanc;
    vHistPCont: THistPContas;
    vFechDia: TFech_dia;
    vSaldoCtrl: TSalCtrl;
    vEmpresasUnificadas: TEmpresasUnificadas;
    vDocSendoRec: TDocSendoRec;
    //Variaveis
    vCons: RConsultaLanc;
    vPrev: RPrevisao;
    vTransf: RTransferencia;
    vGrid: TDBGrid;

  end;

  TConciliacaoBanc = class(TDataSet_OOP)
  private
//    FAcompens, FControles: TIBQuery;
    FSaldoCtrl, FBuscasGerais: TIBQuery;
    FdsAcompens, FdsControles, FdsSaldoCtrl: TdataSource;
    FcdsAcompens, FcdsControles: TClientDataset;
  protected
    FsaldoCaixa: real;
    FsaldoBanco: real;
    procedure ControlesAfterScroll(DataSet: TDataSet);
    procedure AcompensAfterScroll(DataSet: TDataSet);
  public
    constructor create;
    property cdsAcompens: TClientDataset read FcdsAcompens write FcdsAcompens;
    property cdsControles: TClientDataset read FcdsControles write FcdsControles;
//    property Acompens: TIBQuery read FAcompens write FAcompens;
//    property Controles: TIBQuery read FControles write FControles;
    property SaldoCtrl: TIBQuery read FSaldoCtrl write FSaldoCtrl;
    property BuscasGerais: TIBQuery read FBuscasGerais write FBuscasGerais;
    property saldoCaixa: real read FsaldoCaixa write FsaldoCaixa;
    property dsAcompens: TDataSource read FdsAcompens write FdsAcompens;
    property dsControles: TDataSource read FdsControles write FdsControles;
    property dsSaldoCtrl: TDataSource read FdsSaldoCtrl write FdsSaldoCtrl;

    function _abreControles: boolean;
    function _abreSaldoCtrl(pAbrirGeral: boolean): boolean;
    function _abreFormSaldoControle: boolean;
    function _abreFormAlterarSaldoCtrlBancario: boolean;
    function _alterarSaldoCtrlBancario(pData: string; pValor: Currency): boolean;
    function _abreFormAlterarDataCompensacao(vgrid: Tdbgrid): boolean;
    function _alterarDataCompensacao(pData: string;vgrid: Tdbgrid; pRetirar: boolean = false): boolean;
    function _ConfirmarSaldoConciliado: boolean;
    procedure _marcaDesmarcaLinha(pDataset: TDataSet);
    procedure _marcarTodos(pDataset: TDataSet);
    procedure _desmarcarTodos(pDataset: TDataSet);
    procedure storeRecNoAcompens;
    procedure restoreRecNoAcompens;
    procedure storeRecNoControle;
    procedure restoreRecNoControle;

    procedure CalculaSaldoBancario;
    procedure _abreFormConciliacaoBancaria;
  var
    FrecnoAcompens: Integer;
    FrecnoControle: Integer;
    vDataInicioConcBanc: string;
  end;

implementation

uses
  uDtmLancamentos, uCadLancamentos, uDtmAtivo, Forms, SysUtils, Windows, IBDatabase, uDadosIni, uPadrao, ShlObj,
  uClassesImportacaoFinanceiro, Classes, UParBoletim, UPmapa, UFech_dia, Uconcilia,
  DateUtils, uDetalhesRecebimentoContrapartida, uEditMoeda, Variants;

{ TLancamentos }

function TLancamentos.abreFormCredChqSendoRec: boolean;
begin
  FrmFech_Dia.pnCredChequeSendoRec.Height := 300;
  FrmFech_Dia.pnCredChequeSendoRec.Width  := 900;
  vDocSendoRec._abreDocSendoRec;
  Result := vDadosIni.abreForm('Documentos sendo recebidos', FrmFech_Dia.pnCredChequeSendoRec, [ofEscapeExit, ofAlignAllClientWinCtrl]);
end;

procedure TLancamentos.CabMapa(
	vdeta: boolean;
  vfornec: boolean;
  pCodigoUnificada: Integer;
  pAgruparEmpUnificada: string);
begin
  RDp.Imp(ln, 1, Trim(vDadosIni.vEmp.vnomeEmpresa) +
    vDadosIni.retornoPorCondicao( (vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
      ' EMP: ' + vDadosIni.StrZero(pCodigoUnificada, 3), ''));
  ln := ln + 1;
  RDp.Imp(ln, 1, 'MAPA DE DESPESAS');
  ln := ln + 1;
  RDp.Imp(ln, 1, 'DE: ' + DateToStr(vdata1) + ' A: ' + DateToStr(vdata2));
  if (vDadosIni.vEmp.vFinanceiroUnificado) then
  begin
  	ln := ln + 1;
    Rdp.Imp(ln, 1, 'CODIGO EMPRESA UNIFICADA (0 - TODAS): ' +
    	vDadosIni.IfThen(pCodigoUnificada > 0, IntToStr(pCodigoUnificada), '0'));
    Rdp.Imp(ln, 45, 'AGRUPAR EMPRESAS UNIFICADAS: ' +
    	vDadosIni.IfThen(pAgruparEmpUnificada = 'S', 'SIM', 'NAO'));
  end;
  ln := ln + 2;
  if (vdeta) and (vfornec) then
  	RDp.Imp(ln, 1, Vdadosini.replicate('=', 100))
  else
  	RDp.Imp(ln, 1, Vdadosini.replicate('=', 80));
  ln := ln + 1;
  RDp.Imp(ln, 1, 'Nº CONTA');
  RDp.Imp(ln, 12, 'DESCRICAO DA CONTA');
  RDp.Imp(ln, 52, 'VALOR');
  RDp.Imp(ln, 60, 'GRUPO');
  ln := ln + 1;
  if vdeta then
  begin
    RDp.Imp(ln, 3, 'DATA');
    RDp.Imp(ln, 13, 'HISTORICO');
    RDp.Imp(ln, 52, 'VALOR');
    if (vfornec) then
    	RDp.Imp(ln, 62, 'FORNECEDOR');
  end;
  ln := ln + 1;
  if (vdeta) and (vfornec) then
  	RDp.Imp(ln, 1, Vdadosini.replicate('=', 100))
  else
  	RDp.Imp(ln, 1, Vdadosini.replicate('=', 80));
  ln := ln + 1;
end;

procedure TLancamentos.CabNovaPaginabol;
begin
  Rdp.FonteEstiloPadrao := [Snegrito];
  RDP.Imp(ln, 1, vDadosIni.vEmp.vnomeEmpresa);
  ln := ln + 1;
  RDp.Imp(ln, 1, 'BOLETIM DE CAIXA');
  ln := ln + 1;
  RDp.Imp(ln, 1, 'Nº DO MOVIMENTO: ' + inttostr(verificanmov)); //inttostr(dtmc.QrFecdNmov.value));
  ln := ln + 1;
  pag := pag + 1;
  RDp.Imp(ln, 1, 'DATA: ' + DateToStr(vdatamovBol));
  RDp.Imp(ln, 65, 'Pagina: ' + inttostr(pag));
  ln := ln + 2;
  Rdp.FonteEstiloPadrao := [];
end;

procedure TLancamentos.cadLancamentos(TipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('', 'Abrindo Lançamentos');
  if dtmLancamentos = nil then
    dtmLancamentos := TdtmLancamentos.Create(dtmLancamentos);

  vDadosIni.vTipoForm := TipoForm;
  if TipoForm = 1 then
  begin
    if not vDadosIni.PesqPros('LANC013', 'EMITIR', '', 'LANCAMENTOS', '',
      dtmLancamentos.qrBuscas, True) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    Application.CreateForm(TFrmParBol, FrmParBol);
    vDadosIni.fechaStatusProcessamento;
    FrmParBol.ShowModal;
  end;
  if TipoForm = 2 then
  begin
    if not vDadosIni.PesqPros('LANC015', 'EMITIR', '', 'LANCAMENTOS', '',
      dtmLancamentos.qrBuscas, True) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    Application.CreateForm(TFrmpMapa, FrmpMapa);
    vDadosIni.fechaStatusProcessamento;
    FrmpMapa.ShowModal;
  end;
  if TipoForm = 3 then
  begin
    if not vDadosIni.PesqPros('LANC017', 'ABRIR', '', 'FECH_DIA', datetostr(vDadosIni.diaFFinanceiro + 1),
      dtmLancamentos.qrBuscas, True) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    Application.CreateForm(TFrmFech_Dia, FrmFech_Dia);
    vDadosIni.fechaStatusProcessamento;
    FrmFech_Dia.ShowModal;
    // Chamar o Fechamento do Dia aqui...
  end;

  if TipoForm = 0 then
  begin
    if not vDadosIni.PesqPros('LANC001', 'CONSULTA', '', 'LANCAMENTOS', '',
      dtmLancamentos.qrBuscas, True) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    if frmLancamentos = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmLancamentos, frmLancamentos);
    end;
    vDadosIni.fechaStatusProcessamento;
    
    if (TipoForm > 0) and (not frmLancamentos.Visible) then
      frmLancamentos.ShowModal
    else if (not frmLancamentos.Visible) then
      frmLancamentos.Show
    else if frmLancamentos.FormStyle = fsMDIChild then
      frmLancamentos.Show
    else
      frmLancamentos.ShowModal;
  end;
end;

function TLancamentos.consulta: boolean;
var
  I, erro: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vCampoTemp, vCondicaoTemp: string;
begin
  try

    vsqlAdicional := '';
    if (vCons.quitados) and (vCons.naoQuitados) then
    else if vCons.naoQuitados then
      vsqlAdicional := vsqlAdicional +
        ' (lancamentos.status_l = '''' or lancamentos.status_l is null) and lancamentos.data <= ' +
        QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro + 1))
    else
      vsqlAdicional := vsqlAdicional +
        ' (lancamentos.status_l <> '''' or not lancamentos.status_l is null) and lancamentos.data <= ' +
        QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro + 1));

    if Trim(vsqlAdicional) = '' then
      vsqlAdicional := vsqlAdicional + ' lancamentos.cod_lanc <> -1';

    if vCons.porData then
    begin
      try
        erro := 0;
        StrToDate(vCons.dataIni);
      except
        vCons.dataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vCons.dataFim);
      except
        vCons.dataFim := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
      end;
    end; //porData

    if vCons.condicao = 'Igual' then
      vCondicaoTemp := '='
    else if vCons.condicao = 'Maior' then
      vCondicaoTemp := '>'
    else if vCons.condicao = 'Maior ou Igual' then
      vCondicaoTemp := '>='
    else if vCons.condicao = 'Menor' then
      vCondicaoTemp := '<'
    else if vCons.condicao = 'Menor ou Igual' then
      vCondicaoTemp := '<='
    else if vCons.condicao = 'Diferente' then
      vCondicaoTemp := '<>'
    else if (vCons.condicao = 'Esta contido') then
      vCondicaoTemp := 'like'
    else if (vCons.condicao = 'Começa') then
      vCondicaoTemp := 'Começa'
    else
      vCondicaoTemp := '=';

    if (vCons.campo = 'Unificada') or (vCons.campo = 'Nome Controle')
    	or (vCons.campo = 'Descricao Conta') or (vCons.campo = 'Descricao Grupo Conta') or (vCons.campo = 'Descricao Departamento Conta')
    	or (vCons.campo = 'Descricao Conta Contabil') or (vCons.campo = 'Cod Conta Contabil') then
    begin
      if vCons.campo = 'Unificada' then
      begin
        vCons.campo := 'Todos';
        vCons.ordem := 'empresa.identificacao_emp';
        vCampoTemp := 'empresa.identificacao_emp';
      end
      else if vCons.campo = 'Nome Controle' then
      begin
        vCons.campo := 'Todos';
        vCons.ordem := 'controles.nome_ctrl';
        vCampoTemp := 'controles.nome_ctrl';
      end
      else if vCons.campo = 'Descricao Conta' then
      begin
      	vCons.campo := 'Todos';
        vCons.ordem := 'p_contas.desc_plc';
        vCampoTemp := 'p_contas.desc_plc';
      end
      else if vCons.campo = 'Descricao Grupo Conta' then
      begin
      	vCons.campo := 'Todos';
        vCons.ordem := 'grupos_ct.desc_gr';
        vCampoTemp := 'grupos_ct.desc_gr';
      end
      else if vCons.campo = 'Descricao Departamento Conta' then
      begin
      	vCons.campo := 'Todos';
        vCons.ordem := 'depart_ct.desc_dep';
        vCampoTemp := 'depart_ct.desc_dep';
      end
      else if vCons.campo = 'Descricao Conta Contabil' then
      begin
        vCons.campo := 'Todos';
        vCons.ordem := 'p_contas_contabil.nome_cta';
        vCampoTemp := 'p_contas_contabil.nome_cta';
      end
      else if vCons.campo = 'Cod Conta Contabil' then
      begin
        vCons.campo := 'Todos';
        vCons.ordem := 'p_contas.cod_cta_contabil';
        vCampoTemp := 'p_contas.cod_cta_contabil';
      end;

     if vCondicaoTemp = 'like' then
       vsqlAdicional := vsqlAdicional + ' and ' + vCampoTemp + ' like ' + QuotedStr('%' + vCons.valor + '%')
     else if vCondicaoTemp = 'Começa' then
       vsqlAdicional := vsqlAdicional + ' and ' + vCampoTemp + ' like ' + QuotedStr(vCons.valor + '%')
     else
       vsqlAdicional := vsqlAdicional + ' and ' + vCampoTemp + ' ' + vCondicaoTemp + ' ' +QuotedStr(vCons.valor);
    end;

    if vCons.adicional then
    begin
      vCons.valorAd := UpperCase(vCons.valorAd);
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
          erro := erro + 1;
        end;
        if erro = 2 then
        begin
          Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
            'Atenção', MB_OK + MB_ICONINFORMATION);
        end
        else
        begin
          if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
            formatodata := 'mm/dd/yyyy'
          else if pos('.', ShortDateFormat) <> 0 then
            formatodata := 'dd.mm.yyyy';
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end;
      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Maior ou Igual' then
        vCons.condicaoAd := '>='
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Menor ou Igual' then
        vCons.condicaoAd := '<='
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';
      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            try
              vCons.campoAd := DataSet.Fields[I].FieldName;
              if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
                (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
                ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'Começa')) then
              begin
                vCons.condicaoAd := '=';
                vCons.valorAd := vDadosIni.tirapontos(vCons.valorAd, 4);
              end
              else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              begin
                if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                  vsqlAdicional := vsqlAdicional + ' and lancamentos.' + vCons.campoAd + ' >= ' + vCons.dataIniAd +
                    ' and ' +
                    vCons.campoAd + ' <= ' + vCons.dataFimAd
                else if (vCons.dataFimAd <> '') then
                  vsqlAdicional :=  vsqlAdicional + ' and lancamentos.' + vCons.campoAd + ' <= ' + vCons.dataFimAd
                else if (vCons.dataIniAd <> '') then
                  vsqlAdicional :=  vsqlAdicional + ' and lancamentos.' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
                Break;
              end;
              if vCons.condicaoAd = 'like' then
                vsqlAdicional :=  vsqlAdicional + ' and lancamentos.' + vCons.campoAd + ' like ' + QuotedStr('%' +
                  vCons.valorAd +
                  '%')
              else if vCons.condicaoAd = 'Começa' then
                vsqlAdicional :=  vsqlAdicional + ' and lancamentos.' + vCons.campoAd + ' like ' +
                  QuotedStr(vCons.valorAd + '%')
              else
                vsqlAdicional :=  vsqlAdicional + ' and lancamentos.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' +
                  QuotedStr(vCons.valorAd);
            finally
              if (UpperCase(vCons.campoAd) = 'IDENTIFICACAO_EMP') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'lancamentos.IDENTIFICACAO_EMP', 'empresa.IDENTIFICACAO_EMP', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'NOME_CTRL') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'lancamentos.NOME_CTRL', 'controles.NOME_CTRL', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'DESC_PLC') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'lancamentos.DESC_PLC', 'p_contas.DESC_PLC', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'DESC_GR') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'lancamentos.DESC_GR', 'grupos_ct.DESC_GR', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'DESC_DEP') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'lancamentos.DESC_DEP', 'depart_ct.DESC_DEP', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'NOME_CTA') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'lancamentos.NOME_CTA', 'p_contas_contabil.NOME_CTA', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'COD_CTA_CONTABIL') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'lancamentos.COD_CTA_CONTABIL', 'p_contas.COD_CTA_CONTABIL', [rfIgnoreCase, rfReplaceAll]);
            end;
            Break;
          end;
        end;
      end;
    end; //adicional

  	if (trim(vTipoE) <> '') and (trim(vTipoS) <> '') then
    	vsqlAdicional := vsqlAdicional +
        vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
          '(' +
          '  ((p_contas.tipo_plc = ''E'') and (coalesce(p_contas.tipo_ctp, '''') not in (' + vTipoE + ')))' +
        	'		or ' +
          '  ((p_contas.tipo_plc = ''S'') and (coalesce(p_contas.tipo_ctp, '''') not in (' + vTipoS + ')))' +
          ')'
    else if (trim(vTipoE) <> '') then
      vsqlAdicional := vsqlAdicional +
        vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
          '(' +
          '	 ((p_contas.tipo_plc = ''E'') and (coalesce(p_contas.tipo_ctp, '''') not in (' + vTipoE + ')))' +
          '		or ' +
          '	 (p_contas.tipo_plc = ''S'') ' +
          ')'
    else if (trim(vTipoS) <> '') then
      vsqlAdicional := vsqlAdicional +
        vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
          '(' +
          '	 (p_contas.tipo_plc = ''E'') ' +
          '		 or ' +
          '  ((p_contas.tipo_plc = ''S'') and (coalesce(p_contas.tipo_ctp, '''') not in (' + vTipoS + ')))' +
          ')';
//    if vCons.campo = 'Todos' then
//      vsqlAdicional := vsqlAdicional + ' order by lancamentos.cod_lanc ';

    if vCons.porData then
      result := ConsultaCampos('LANCAMENTOS', vCons.campo, 'lancamentos.cod_lanc', vCons.dataIni,
        vCons.dataFim, vDadosIni.codEmpresa, 1,
        ' lancamentos.*, ' +
        ' controles.nome_ctrl, empresa.identificacao_emp, ' +
        ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, ' +
        ' p_contas.cod_cta_contabil, p_contas_contabil.nome_cta ',
        ' left join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and lancamentos.cod_emp_mult = controles.codigo_emp ' +
        ' left join empresa on empresa.cod_empresa = lancamentos.cod_emp_mult ' +
        ' left join p_contas on p_contas.n_conta_plc = lancamentos.n_conta_plc ' +
        ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
        ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
        ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = lancamentos.codigo_emp ', vsqlAdicional)
    else
      result := ConsultaCampos('LANCAMENTOS', vCons.valor, vCons.campo, vCons.condicao,
        ' lancamentos.cod_lanc', True, vDadosIni.codEmpresa,
        ' lancamentos.*, ' +
        ' controles.nome_ctrl, empresa.identificacao_emp, ' +
        ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, ' +
        ' p_contas.cod_cta_contabil, p_contas_contabil.nome_cta',
        ' left join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and lancamentos.cod_emp_mult = controles.codigo_emp  ' +
        ' left join empresa on empresa.cod_empresa = lancamentos.cod_emp_mult ' +
        ' left join p_contas on p_contas.n_conta_plc = lancamentos.n_conta_plc ' +
        ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
        ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
        ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = lancamentos.codigo_emp ',vsqlAdicional)
  finally

  end;
end;

constructor TLancamentos.create;
begin

  if dtmLancamentos = nil then
    dtmLancamentos := TdtmLancamentos.Create(dtmLancamentos);

  DataSet := TClientDataSet(dtmLancamentos.cdsLancamentos);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    dataSet.FieldByName('COD_EMP_MULT').Tag := 0;
    dataSet.FieldByName('IDENTIFICACAO_EMP').Tag := 0;
  end
  else
  begin
    dataSet.FieldByName('COD_EMP_MULT').Tag := 1;
    dataSet.FieldByName('IDENTIFICACAO_EMP').Tag := 1;
  end;

  vFpLanc := TLancamentosFP.create;
  vEstornarRecibo := TEstornarRecibo.create;
  vPCont := TPContasLanc.create;
  vCtrl := TControlesLanc.create;
  vHistPCont := THistPContas.create;
  vSaldoCtrl := TSalCtrl.create;
  vFechDia := TFech_dia.create;
  vEmpresasUnificadas := TEmpresasUnificadas.create;
  vDocSendoRec := TDocSendoRec.create;
  Rdp := TRdPrint(dtmLancamentos.RdPrint1);
  QrBoletim := TIBQuery(dtmLancamentos.IbQrBoletim);
  QrSlCtrl := TIBQuery(dtmLancamentos.IbQrSlCtrl);
  QrResumo := TIBQuery(dtmLancamentos.IbQrResumo);

  fLancamentos := TIBQuery.Create(Application);
  fLancamentos.Database := transacao.DefaultDatabase;
  fLancamentos.Transaction := transacao;

  fCheques := TIBQuery.Create(Application);
  fCheques.Database := transacao.DefaultDatabase;
  fCheques.Transaction := transacao;

  fCreditos := TIBQuery.Create(Application);
  fCreditos.Database := transacao.DefaultDatabase;
  fCreditos.Transaction := transacao;

  fCTP := TIBQuery.Create(Application);
  fCTP.Database := transacao.DefaultDatabase;
  fCTP.Transaction := transacao;

  fDSLancamentos := TDataSource.Create(Application);
  fDSLancamentos.DataSet := fLancamentos;
  fDSLancamentos.AutoEdit := False;

  fDSCheques := TDataSource.Create(Application);
  fDSCheques.DataSet := fCheques;
  fDSCheques.AutoEdit := False;

  fDSCreditos := TDataSource.Create(Application);
  fDSCreditos.DataSet := fCreditos;
  fDSCreditos.AutoEdit := False;

  fDSCTP := TDataSource.Create(Application);
  fDSCTP.DataSet := fCTP;
  fDSCTP.AutoEdit := False;

  dataSet.AfterScroll := nil;
end;

procedure TLancamentos.datasetFormasPagAfterScroll(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
  	vFpLanc._abreLancamentosFP(
    	0,
      0,
      0,
      0,
      0,
      0,
      0)
  else
		vFpLanc._abreLancamentosFP(
    	DataSet.FieldByName('COD_LANC').AsInteger,
      DataSet.FieldByName('DATA').AsDateTime,
      DataSet.FieldByName('LOTE').AsInteger,
      DataSet.FieldByName('LOTE_ENT').AsInteger,
      DataSet.FieldByName('LOTE_QUIT').AsInteger,
      DataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger,
      DataSet.FieldByName('COD_CONTRAPARTIDA_CTP').AsInteger);
end;

function TLancamentos.delete: Boolean;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('LANC005', 'EXCLUIR', 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString, 'LANCAMENTOS', '',
    buscas, True) then
    exit;

  if not vDadosIni.VerificarinicioFechFinan(buscas) then
    exit;

  if not dataSet.FieldByName('DATQ_L').IsNull then
    Application.MessageBox('Lancamento quitado não pode ser apagado',
      'Atenção', 0 + 64)
  else if Application.MessageBox('Tem Certeza que deseja Apagar este Registro?',
    'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    if not Application.MessageBox('Confirma exclusão do registro?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      exit;

    if (dataSet.FieldByName('TIPO_L').AsString = 'S')
    	and (verificaLancamentoEstornoVale) then
    begin
      Application.MessageBox('Não é possível excluir lançamento este lançamento, ' +
      	' favor realizar o estorno do recibo/vale compra nesta tela!',
        'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;  

    if dataSet.FieldByName('LANC_AVULSO').AsString = 'N' then
    begin
      if Application.MessageBox('Lançamento realizado pelo sistema, deseja excluir assim mesmo?',
        'Atenção', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
        exit;

      if not vDadosIni.PesqPros('LANC045', 'EXCLUIR', 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString, 'LANCAMENTOS', '', buscas, True) then
       exit;
    end;

    if dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger > 0 then
    begin
      if Application.MessageBox('Lançamento possui contrapartida, deseja excluir assim mesmo?',
        'Atenção', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
        exit;

      if not vDadosIni.PesqPros('LANC040', 'EXCLUIR', 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString, 'LANCAMENTOS', '', buscas, True) then
       exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from lancamentos' +
      ' where cod_lanc = :cod_lanc and codigo_emp = :codigo_emp';
    buscas.ParamByName('cod_lanc').AsInteger := dataSet.FieldByName('cod_lanc').AsInteger;
    buscas.ParamByName('codigo_emp').AsInteger := dataSet.FieldByName('codigo_emp').AsInteger;
    try
    	buscas.ExecSQL;
      CommitaTransacao;
      vDadosIni.GravaAuditoria('LANC005', 'EXCLUIR', 'SUCESSO',
        'LANCAMENTOS', dataSet.FieldByName('cod_lanc').AsString, buscas); 
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('LANC005', 'EXCLUIR', 'FALHA',
        'LANCAMENTOS', dataSet.FieldByName('cod_lanc').AsString, buscas);
    end;
    dataSet.Refresh;
  end;
end;

destructor TLancamentos.Destroy;
begin
  vFpLanc.Free;
  vFpLanc := nil;

  vEstornarRecibo.Free;
  vEstornarRecibo := nil;

  vPCont.Free;
  vPCont := nil;

  vCtrl.Free;
  vCtrl := nil;

  vEmpresasUnificadas.Free;
  vEmpresasUnificadas := nil;

  vDocSendoRec.Free;
  vDocSendoRec := nil;

  inherited;
end;

function TLancamentos.edit: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('LANC004', 'ALTERAR',
    'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString, 'LANCAMENTOS', '',
    buscas, True) then
    exit;

  if dataSet.FieldByName('LANC_AVULSO').AsString = 'N' then
  begin
  	if Application.MessageBox('Deseja editar um lançamento realizado pelo sistema?',
    	'Confirmação', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> IDYES then
      Exit;

    if not vDadosIni.PesqPros('LANC048', 'ALTERAR',
      'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString, 'LANCAMENTOS', '',
      buscas, True) then
      exit;
  end;

  if not vDadosIni.VerificarinicioFechFinan(buscas) then
    exit;

  if not vDadosIni.definirDiaFinanceiroFechado(buscas) then
    Exit;

  if (not dataSet.Active) or (dataSet.IsEmpty) then
    Exit;

  if trim(dataSet.FieldByName('Status_L').AsString) = 'QUITADO' then
    if Application.MessageBox('Deseja realmente editar um lançamento de um dia já fechado?', 'Confirmação', MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION) <> IDYES then
      Exit
    else if not vDadosIni.PesqPros('LANC033', 'LIBERAR', 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString, 'LANCAMENTOS',
      dataSet.FieldByName('cod_lanc').AsString, buscas, true) then
      Exit;

  if inherited Edit then
  begin
  	vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vCodigoCtrl := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
    vDataReferencia := dataSet.FieldByName('DTREFERENCIA').AsDateTime;

    if trim(dataSet.FieldByName('Status_L').AsString) = 'QUITADO' then
      vPCont._abreEntSaiPContasLanc(fstr('tipo_l'), ffloat('n_conta_plc'))
    else
      vPCont._abreTodosPContasLanc(ffloat('n_conta_plc'));
    vCtrl._abreTodosControlesLanc(fint('codigo_ctrl'));
    vEmpresasUnificadas._abreTodosEmpresas;

    Result := True;
  end;
end;

function TLancamentos.estornaReciboValeCompra(var pCodLanc: Integer): boolean;
var
  buscas2: TIBQuery;
  vTpBaixa: string;
begin
  try
    Result := False;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    vEstornarRecibo.vReciboSelecionados := 0;
    vEstornarRecibo._abreEstornarRecibo;
    frmLancamentos.BitBtnOKEstornaVale.Visible := false;
    frmLancamentos.BitBtnCancelarEstornarVale.Visible := false;
    frmLancamentos.BitBtnImprimirEstornaVale.Visible := false;
    frmLancamentos.BitBtnEstornarEstornaVale.Visible := false;
    frmLancamentos.BitBtnFecharEstornarVale.Visible := false;
    frmLancamentos.edNumReciboEstornaVale.Visible := false;
    frmLancamentos.lbNumReciboEstornaVale.Visible := false;

    frmLancamentos.BitBtnOKEstornaVale.Visible := true;
    frmLancamentos.BitBtnCancelarEstornarVale.Visible := true;
    frmLancamentos.BitBtnImprimirEstornaVale.Visible := true;
    frmLancamentos.lbNumReciboEstornaVale.Visible := true;
    frmLancamentos.edNumReciboEstornaVale.Visible := true;
    if not vDadosIni.abreForm('Recibos/Vale Compra', frmLancamentos.pnEstonarValeCompra, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
      exit;

    try
      vEstornarRecibo.dataSet.Filter := 'sel = ''S'' ';
      vEstornarRecibo.dataSet.Filtered := true;
      if (vEstornarRecibo.dataSet.IsEmpty) then
      begin
        raiseExceptionCreate('Nenhum recibo/vale compra selecionado!', '');
        exit;
      end;

      vEstornarRecibo.vValorRecSel := 0;
      vEstornarRecibo.dataSet.First;
      while not vEstornarRecibo.dataSet.Eof do
      begin
        if (vEstornarRecibo.vValorRecSel < dataSet.FieldByName('VALOR_L').AsFloat) then
        begin
          if (vdadosini.StrToFloatFormat(dataSet.FieldByName('VALOR_L').AsFloat, 2) - vdadosini.StrToFloatFormat(vEstornarRecibo.vValorRecSel, 2) >
            vdadosini.StrToFloatFormat(vEstornarRecibo.dataset.FieldByName('VALOR').AsCurrency, 2)) then
            frmLancamentos.edValorBaixaReciboEstorna.Valor := vdadosini.StrToFloatFormat(vEstornarRecibo.dataset.FieldByName('VALOR').AsCurrency, 2)
          else
            frmLancamentos.edValorBaixaReciboEstorna.Valor := vdadosini.StrToFloatFormat(dataSet.FieldByName('VALOR_L').AsFloat, 2) - vdadosini.StrToFloatFormat(vEstornarRecibo.vValorRecSel, 2);

          frmLancamentos.lbCabInfReciboEstorna.Caption := 'Recibo Nº ' +
           vDadosIni.IfThen(vEstornarRecibo.dataSet.FieldByName('num_rec_dep').AsString = '',
            vEstornarRecibo.dataSet.FieldByName('nrecibo').AsString, vEstornarRecibo.dataSet.FieldByName('num_rec_dep').AsString);

          if not vDadosIni.abreForm('Quitar Recibo N° ' +
            vDadosIni.IfThen(vEstornarRecibo.dataSet.FieldByName('num_rec_dep').AsString = '',
            vEstornarRecibo.dataSet.FieldByName('nrecibo').AsString, vEstornarRecibo.dataSet.FieldByName('num_rec_dep').AsString),
            frmLancamentos.pnInfReciboEstorna, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
            exit;

          vEstornarRecibo.dataSet.Edit;
          vEstornarRecibo.dataSet.FieldByName('VALOR_ESTORNADO').AsFloat := frmLancamentos.edValorBaixaReciboEstorna.Valor;
          vEstornarRecibo.dataSet.Post;

          vEstornarRecibo.vValorRecSel := vEstornarRecibo.vValorRecSel + vEstornarRecibo.dataSet.FieldByName('VALOR_ESTORNADO').AsFloat;
        end;

        vEstornarRecibo.dataSet.Next;
      end;

      if (vEstornarRecibo.vValorRecSel <> dataSet.FieldByName('VALOR_L').AsFloat) then
      begin
        Application.MessageBox(pchar('Valor do Lançamento não pode ser diferente do valor dos recibos/vale compra selecionados: ' + #13 +
        'Valor do lançamento: R$ ' + FormatFloat('0.00', cadLanc.dataSet.FieldByName('VALOR_L').AsFloat) + #13 +
        'Valor dos recibos/vale compra: R$ ' + FormatFloat('0.00', cadLanc.vEstornarRecibo.vValorRecSel) + #13 +
        'Favor conferir!'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        exit;
      end;

      // Financeiro sendo fechado
	    if vDadosIni.financeiroFechando(buscas2) then
  	    Exit;

      pCodLanc := GenCodigo('LANCAMENTOS', buscas2, vDadosIni.codEmpresa);

      vEstornarRecibo.dataSet.First;
      while not vEstornarRecibo.dataSet.Eof do
      begin
        if vEstornarRecibo.dataSet.FieldByName('VALOR_ESTORNADO').AsFloat > 0 then
        begin
          if (vDadosIni.StrToFloatFormat(vEstornarRecibo.dataset.FieldByName('VALOR_ESTORNADO').AsCurrency, 2) =
            vdadosini.StrToFloatFormat(vEstornarRecibo.dataset.FieldByName('VALOR').AsCurrency, 2)) then
            vTpBaixa := 'T'
          else
            vTpBaixa := 'P';


          if vTpBaixa = 'T' then
          begin
            buscas.Close;
            buscas.SQL.Text := 'update recibos set status_rec = :status_rec, ' +
              ' ndocant = :ndocant, data_baixa = :data_baixa, historico_rec = :historico_rec ' +
              ' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
            buscas.ParamByName('STATUS_REC').AsString := 'RECEBIDO';
            buscas.ParamByName('NDOCANT').AsInteger := pCodLanc;
            buscas.ParamByName('DATA_BAIXA').AsDateTime := vDadosIni.getDataBanco(buscas2);
            buscas.ParamByName('HISTORICO_REC').AsString := copy(vEstornarRecibo.dataset.FieldByName('HISTORICO_REC').AsString, 1, 41) + ' TOTAL';
            buscas.ParamByName('NRECIBO').AsInteger := vEstornarRecibo.dataSet.FieldByName('NRECIBO').AsInteger;
            buscas.ParamByName('COD_EMPRESA').AsInteger := vEstornarRecibo.dataSet.FieldByName('COD_EMPRESA').AsInteger;
            buscas.ExecSQL;
          end
          else
          begin
            buscas.Close;
            buscas.SQL.Text := 'update recibos set valor = :valor, historico_rec = :historico_rec ' +
              ' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
            buscas.ParamByName('VALOR').AsFloat := vDadosIni.StrToFloatFormat(vEstornarRecibo.dataSet.FieldByName('VALOR').AsFloat, 2) -
              vDadosIni.StrToFloatFormat(vEstornarRecibo.dataset.FieldByName('VALOR_ESTORNADO').AsFloat, 2);
            buscas.ParamByName('HISTORICO_REC').AsString := 'RECIBO ESTORNADO LANC Nº ' +
              IntToStr(pCodLanc) + ' PARCIAL';
            buscas.ParamByName('NRECIBO').AsInteger := vEstornarRecibo.dataSet.FieldByName('NRECIBO').AsInteger;
            buscas.ParamByName('COD_EMPRESA').AsInteger := vEstornarRecibo.dataSet.FieldByName('COD_EMPRESA').AsInteger;
            buscas.ExecSQL;
          end;

          buscas.Close;
          buscas.SQL.Text :=
            'INSERT INTO HIST_REC (SEQCAD_REC, COD_EMPRESA, NRECIBO, VALOR_BAIXA, VALOR_RECIBO,' +
            ' DATA_REC, RECANT, NDOCANT, DATA_BAIXA, HISTORICO_REC, COD_US, TP_DOC_BAIXA, TP_BAIXA, LOTE_QUIT)' +
            ' VALUES (:SEQCAD_REC, :COD_EMPRESA, :NRECIBO, :VALOR_BAIXA, :VALOR_RECIBO,' +
            ' :DATA_REC, :RECANT, :NDOCANT, :DATA_BAIXA, :HISTORICO_REC, :COD_US, :TP_DOC_BAIXA, :TP_BAIXA, :LOTE_QUIT)';
          buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
          buscas.ParamByName('NRECIBO').AsInteger := vEstornarRecibo.dataSet.FieldByName('NRECIBO').AsInteger;
          buscas.ParamByName('VALOR_BAIXA').AsCurrency :=
            vEstornarRecibo.dataset.FieldByName('VALOR_ESTORNADO').AsCurrency;
          if vTpBaixa <> 'T' then
            buscas.ParamByName('VALOR_RECIBO').AsCurrency := vDadosIni.StrToFloatFormat(vEstornarRecibo.dataset.FieldByName('VALOR_ESTORNADO').AsCurrency, 2)
          else
            buscas.ParamByName('VALOR_RECIBO').AsCurrency := 0;
          buscas.ParamByName('DATA_REC').AsDateTime := vEstornarRecibo.dataSet.FieldByName('DATA_REC').AsDateTime;
          buscas.ParamByName('RECANT').AsString := vEstornarRecibo.dataSet.FieldByName('RECANT').AsString;
          buscas.ParamByName('NDOCANT').AsInteger := pCodLanc;
          buscas.ParamByName('DATA_BAIXA').AsDate := vDadosIni.getDataBanco(buscas2);
          if vTpBaixa <> 'T' then
            buscas.ParamByName('HISTORICO_REC').AsString := 'BAIXA PARCIAL FINANCEIRO LANC Nº '
              + IntToStr(pCodLanc)
          else
            buscas.ParamByName('HISTORICO_REC').AsString := 'BAIXA TOTAL FINANCEIRO LANC Nº ' +
              IntToStr(pCodLanc);
          buscas.ParamByName('COD_US').AsInteger := vDadosIni.vCodUsuario;
          buscas.ParamByName('SEQCAD_REC').AsInteger := GenCodigo('HIST_REC', buscas2, vDadosIni.codEmpresa);
  //              buscas.ParamByName('SEQCAD_REC').AsInteger := GenCodigo('HIST_REC', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
          buscas.ParamByName('TP_DOC_BAIXA').AsString := 'LNC';
          buscas.ParamByName('TP_BAIXA').AsString := vTpBaixa;
          if vTpBaixa = 'T' then
            buscas.ParamByName('VALOR_RECIBO').AsCurrency := 0;
  //          buscas.ParamByName('LOTE_QUIT').AsCurrency := dadosReceber.loteQuitacao;
          buscas.ExecSQL;
        end;

        vEstornarRecibo.dataSet.Next;
      end;
    finally
      vEstornarRecibo.dataSet.Filtered := false;
    end;
    Result := true;
  except
    on e: exception do
    begin
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TLancamentos.estornaReciboValeCompra Erro: ' + e.Message);
    end;
  end;
end;

function TLancamentos.FecharDiaCX: boolean;
var
  vmesano: array of variant;
  vmes, vano, vdia: word;
  vdiftot, vlsald, vlso, vts, vte, crb, crbUnif: currency;
  vmov, flg, flagSaldoBancario: integer;
  vlsaldodn, vlsobra, EU, vdt1, tempString: string;
  vdtfcd: Tdate;
  vsql, vMensagemSobraQuebra: string;
  vOK, vLancamentoSobraQuebraAtivado: Boolean;
  vLancL: TLancamentosImp;
  vContLigL: TContaLigacaoImp;
  vDiferencas: string;
  vDiaMarcadoFechando: TDate;
  vConfBanc: boolean;
  vtempConfBanc: string;
begin
  try
    Screen.Cursor := crHourGlass;
    Result := false;
    vts := 0;
    Vte := 0;
    Crb := 0;
    CrbUnif := 0;
    flg := 0;
    vdiftot := 0;
    vDiaMarcadoFechando:= 0;
    vDadosIni.abreStatusProcessamento('', 'Verificando Documentos que estão sendo recebidos');
    if not verDocsSendoRec then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    vDadosIni.abreStatusProcessamento('', 'Abrindo Controles');
    vctrl._abreTodosControlesLanc(-1);
    vDadosIni.abreStatusProcessamento('', 'Abrindo Contas');
    vPCont._abreTodosPContasLanc(-1);
    //
    vDadosIni.abreStatusProcessamento('', 'Verificando Diferenças');
    vDiferencas := '';
    vctrl.dataSet.First;
    while not vctrl.dataSet.Eof do
    begin
      _calcularPrevisao;
      if vDadosIni.StrToFloatFormat(vdifcontrl, 2) <> 0 then
      begin
        vdiftot := vdiftot + vdifcontrl;
        Application.MessageBox(Pchar('Conferir em Lançamento/Previsão de Saldo de Caixa. Há Diferença entre Saldo e somatório do controle: ' +
          trim(vCtrl.dataSet.FieldByName('nome_ctrl').AsString) + ' no valor de: ' + format('%n', [vdifcontrl])), 'Atenção',
          MB_OK + MB_ICONINFORMATION);
        vDiferencas := vDiferencas +
          IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) + '-' +
          Copy(trim(vCtrl.dataSet.FieldByName('nome_ctrl').AsString),1,10) + ':' +
          FloatToStr(vDadosIni.StrToFloatFormat(vdifcontrl, 2)) + ' ';
      end;
      vctrl.next;
    end;
    if Trim(vDiferencas) <> '' then
    begin
      vDadosIni.fechaStatusProcessamento;
      if not vDadosIni.PesqPros('LANC021', 'LIBERAR', vDiferencas , 'FECH_DIA', Datetostr(vDadosIni.diaFFinanceiro + 1) + ' DIF: '+  format('%n', [vdiftot]),
        dtmLancamentos.qrBuscas, True) then
        Exit;
    end;
    if verFormpagpend then
    begin
        Application.MessageBox(Pchar('Existem formas de pagamento não importadas ' +
        	' para este dia do financeiro'), 'Atenção',
        MB_OK + MB_ICONINFORMATION);
        if not vDadosIni.PesqPros('LANC027', 'LIBERAR', '', 'FECH_DIA', Datetostr(vDadosIni.diaFFinanceiro + 1) + ' DIF: ' + format('%n', [vdiftot]),
         dtmLancamentos.qrBuscas, True) then
         Exit;
    end;
    if verificarDocumentosSemRecebimento then
    begin
      if not vDadosIni.PesqPros('LANC047', 'LIBERAR', '', 'FECH_DIA', Datetostr(vDadosIni.diaFFinanceiro + 1),
         dtmLancamentos.qrBuscas, True) then
         Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select distinct cc.cod_cliente, cl.nome_cliente, cl.razao, cc.cod_emp_mult from controle_creditos cc' +
      ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp and c.retornos = ''S''' +
      ' inner join notafiscal nf on nf.cod_cliente = cc.cod_cliente and nf.cod_empresa = cc.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
      ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.bx_retorno_fin = ''S''' +
      ' inner join clientes cl on cl.cod_cliente = cc.cod_cliente and cl.cod_empresa = cc.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + 
      ' where cc.datq_c is null and cc.codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Open;

    tempString := '';
    buscas.First;
    while not buscas.Eof do
    begin
      tempString := tempString + vDadosIni.StrZero(buscas.FieldByName('cod_cliente').AsInteger, 5) + ' - ' +
        Trim(buscas.FieldByName('nome_cliente').AsString) + ' / ' +
        Trim(buscas.FieldByName('razao').AsString) + vDadosIni.retornoPorCondicao( vDadosIni.vEmp.vFinanceiroUnificado,
         ' EMP: ' + vDadosIni.StrZero(buscas.FieldByName('cod_emp_mult').AsInteger, 3), '') + #13;
      buscas.Next;
    end;

    if tempString <> '' then
    begin
      Application.MessageBox(pchar('Existem mercadorias retornadas de fornecedores que possuem créditos em aberto,' +
        ' estes estão configurados como retorno de mercadorias pelo cadastro do Controle.' +
        ' Favor baixar o(s) crédito(s) deste(s) fornecedor(es): ' + #13 + tempString), 'Atenção', 0 + 64);

      tempString := '';
      buscas.First;
      while not buscas.Eof do
      begin
        tempString := tempString + buscas.FieldByName('cod_cliente').AsString + ', ';
        buscas.Next;
      end;

      if not vDadosIni.PesqPros('LANC032', 'LIBERAR', 'CRED DE RETORNO COM MERC. CLIENTES: ' + tempString, 'FECH_DIA', Datetostr(vDadosIni.diaFFinanceiro + 1),
        buscas, True, True) then
        Exit;
    end;

    vSaldoCtrl._abreSaldos(0, date);
    //
    if Application.MessageBox(pchar('Deseja Realmente Fechar o dia ' + Datetostr(vDadosIni.diaFFinanceiro + 1) + '?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      vDadosIni.abreStatusProcessamento('', 'Fechando Dia ' + Datetostr(vDadosIni.diaFFinanceiro + 1) + ' do Financeiro');
      buscas.Close;
      buscas.sql.text := ' update fech_dia set INICIA_FECH = ''S'' ' +
      	' where dia_fcd = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro)) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.Prepare;
      buscas.ExecSQL;
      CommitaTransacao;
      vDiaMarcadoFechando := vDadosIni.diaFFinanceiro;
      vFechDia._abreFechamento('1');
      while true do
      begin
        vlsobra := '';
        InputQuery('Sobra ou Quebra de Caixa', ' Valor de Sobra(+) ou Quebra(-) de Caixa:', vlsobra);
        try
          if vlsobra <> '' then
          begin
            vlso := strtocurr(vlsobra);
          end
          else
            vlso := 0.00;
          break;
        except
          messagedlg('Erro de Conversao de Valor, Valor Digitado Inválido', mtinformation, [mbOK], 0);
        end;
      end;
      //
      if vDadosIni.vMostrarSaldoDinheiro = 'N' then
      begin
        while true do
        begin
          vlsaldodn := '0';
          InputQuery('Saldo', ' Valor do Saldo Dinheiro:', vlsaldodn);
          try
            if vlsaldodn <> '' then
            begin
              vlsald := strtocurr(vlsaldodn);
            end
            else
              vlsald := 0.00;
            Break;
          except
            messagedlg('Erro de Conversao de Valor, Valor Digitado Inválido', mtinformation, [mbOK], 0);
          end;
        end;
      end;
      try
        IniciaTransacao;
        SetLength(vmesano, 4);
        decodedate(vDadosIni.diaFFinanceiro + 1, vano, vmes, vdia);
        vmesano[1] := vmes;
        vmesano[2] := vano;
        eu := FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro + 1);
        //        copy(datetostr(vDadosIni.diaFFinanceiro + 1), 4, 3) + copy(datetostr(QrFecdDia_fcd.value + 1), 1, 3) + copy(datetostr(QrFecdDia_fcd.value + 1), 7, 4);

        if vDadosIni.vConcBanc.vHabilitarConcBanc then
        begin
          vConfBanc := true;
          vtempConfBanc := 'Controle(s) sem confirmação do saldo bancária: ' + #13 + #13;

          buscas.Close;
          buscas.SQL.Text := 'select ' +
            ' CODIGO_CTRL "Cod. Controle",' +
            ' FLUXO_CTRL "Fluxo de Caixa",' +
            ' N_BANCO_CTRL "Num. do Banco",' +
            ' NOME_CTRL "Nome do Controle/Banco",' +
            ' N_CONTA_CTRL "Num.Conta Banco",' +
            ' CONTR_BANC "Controle Bancário",' +
            ' FONE_CTRL "Fone do Banco", ' +
            ' DATA_CONF_SALD_BANC "Data Conf" ' +
            ' from controles ' +
            ' where contr_banc = ''S'' ' +
            ' and codigo_emp = ' + vDadosIni.codEmpresa +
            ' order by codigo_ctrl';
          buscas.Open;
          buscas.FetchAll;

          buscas.First;
          while not buscas.Eof do
          begin
            if ((buscas.FieldByName('Data Conf').IsNull)
            	or (vDadosIni.diaFFinanceiro + 1 > buscas.FieldByName('Data Conf').AsDateTime)) then
            begin
              vConfBanc := false;
              vtempConfBanc := vtempConfBanc + IntToStr(buscas.FieldByName('Cod. Controle').AsInteger) +
                ' - ' + trim(buscas.FieldByName('Nome do Controle/Banco').AsString) + #13;
            end;
            buscas.Next;
          end;
          if not vConfBanc then
          begin
            messagedlg(vtempConfBanc, mtinformation, [mbOK], 0);
            if not vDadosIni.PesqPros('LANC041', 'LIBERAR', '', 'FECH_DIA', Datetostr(vDadosIni.diaFFinanceiro + 1),
         			dtmLancamentos.qrBuscas, True) then
		        begin
              flg := 1;
              exit;
            end;
          end;
        end;

        if vDadosIni.vConcBanc.vHabilitarConcBanc then
          flagSaldoBancario := 0
        else if Application.MessageBox('Deseja acrescentar o valor apurado de cada controle externo ao respectivo Saldo bancário?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYES then
          flagSaldoBancario := 1
        else
          flagSaldoBancario := 0;

        dataSet.close;
        dataset.CommandText := ' select l.*, ' +
         ' c.nome_ctrl, emp.identificacao_emp, ' +
         ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, ' +
         ' p_contas.cod_cta_contabil, p_contas_contabil.nome_cta from lancamentos l ' +
         ' left join controles c on l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp ' +
         ' left join empresa emp on emp.cod_empresa = l.cod_emp_mult ' +
         ' left join p_contas on p_contas.n_conta_plc = l.n_conta_plc ' +
         ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
         ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
         ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = l.codigo_emp ' +
         ' where l.data = ''' + eu + ''' AND  l.codigo_emp = ' + vDadosIni.codEmpresa + ' order by codigo_ctrl ';
        dataSet.Open;
        try
        	dataSet.DisableControls;
        	dataSet.First;
          while not dataSet.EOF do
          begin
            if dataSet.FieldByName('Status_l').AsString = '' then
            begin
              if vCtrl.dataset.locate('CODIGO_CTRL', dataSet.FieldByName('Codigo_ctrl').AsInteger, [locaseinsensitive]) and
                ExecutaComandosSql('SELECT * FROM P_CONTAS WHERE N_CONTA_PLC = cast(' +
                vDadosIni.trocaVirgulaPorPonto(dataSet.fieldbyname('N_CONTA_PLC').asstring)+' as double precision)') then
                //QrPcontas.locate('N_CONTA_PLC', QrlancN_conta_Plc.value, [locaseinsensitive])
              begin
                dataSet.edit;
                dataSet.FieldByName('Status_l').AsString := 'QUITADO';
                dataSet.FieldByName('datq_l').value := vDadosIni.diaFFinanceiro + 1;
                if dataSet.FieldByName('LANC_VENDA').AsString = 'S' then
                  dataSet.FieldByName('NMOV').AsInteger := 1;
                if dataSet.FieldByName('TP_MOD').AsString = 'S' then
                  dataSet.FieldByName('NMOV').AsInteger := 2;
                if (dataSet.FieldByName('TP_MOD').IsNull) and (dataSet.FieldByName('LANC_VENDA').IsNull) then
                  dataSet.FieldByName('NMOV').AsInteger := 3;
                if flagSaldoBancario = 1 then
                  dataSet.FieldByName('DT_COMPENSADO').value := vDadosIni.diaFFinanceiro + 1;

                Vmesano[0] := dataSet.FieldByName('N_conta_plc').AsFloat;
                vmesano[3] := vDadosIni.codEmpresa;
                vCtrl.edit;
                if dataSet.FieldByName('Tipo_L').value = 'S' then
                  vCtrl.dataSet.FieldByName('Saldo_At_ctrl').AsCurrency := vCtrl.dataSet.FieldByName('Saldo_At_ctrl').AsCurrency -
                    dataSet.FieldByName('Valor_l').AsCurrency
                else
                  vCtrl.dataSet.FieldByName('Saldo_At_ctrl').AsCurrency := vCtrl.dataSet.FieldByName('Saldo_At_ctrl').AsCurrency +
                    dataSet.FieldByName('Valor_l').AsCurrency;
                if vDadosIni.vMostrarSaldoDinheiro = 'N' then
                begin
                  if vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger = 1 then
                    vCtrl.dataSet.FieldByName('SALDO_AT_CTRL').AsCurrency := vlsald;
                end;
                //       QrPContas
                dataSet.Post;
                Apply;
                vCtrl.Post;
                vCtrl.Apply;
              end
              else
              begin
                messagedlg('Controle ou Conta não encontrado no Caixa. Controle: '+dataSet.FieldByName('Codigo_ctrl').AsString+' Conta: '+vDadosIni.trocaVirgulaPorPonto(dataSet.fieldbyname('N_CONTA_PLC').asstring), mtinformation, [mbOK], 0);
                flg := 1;
              end;
            end;
            dataSet.next;
          end;
        finally
          dataSet.EnableControls;
        end;
        if flg = 0 then
        begin
          //          Apply;
          //          vCtrl.Apply;
          vCtrl.first;
          vDadosIni.fechaStatusProcessamento;
          vDadosIni.abreStatusProcessamento('', 'Fechando Dia ' + Datetostr(vDadosIni.diaFFinanceiro + 1) + ' do Financeiro');
          while not vCtrl.dataSet.EOF do
          begin
            //Somando relação de documentos por controle...
            QrBoletim.close;
            QrBoletim.sql.clear;
            vdt1 := FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro + 1);
            //copy(datetostr(QrFecdDia_fcd.value + 1), 4, 3) + copy(datetostr(QrFecdDia_fcd.value + 1), 1, 3) + copy(datetostr(QrFecdDia_fcd.value + 1), 7, 4);
            QrBoletim.sql.text := 'select sum(coalesce(cc.valor_c, 0)) valor_c from controle_creditos cc ' +
              ' where cc.codigo_ctrl = ' + vCtrl.dataSet.FieldByName('codigo_ctrl').AsString +
              ' and cc.data_rec_c <= :data_rec_c ' +
              ' and ((cc.status_c = '''' or cc.status_c is null) or cc.datq_c > :data_rec_c) ' +
              ' and cc.codigo_emp = ' + vDadosIni.codEmpresa;
            QrBoletim.ParamByName('data_rec_c').AsDate := vDadosIni.diaFFinanceiro + 1;
            QrBoletim.Open;
            while not QrBoletim.EOF do
            begin
              crb := crb + QrBoletim.FieldByName('Valor_c').AsCurrency;
              QrBoletim.next;
            end;

            if (vDadosIni.vEmp.vFinanceiroUnificado) then
            begin
             QrBoletim.close;
             QrBoletim.sql.clear;
//             QrBoletim.SQL.Text := QrBoletim.SQL.Text + ' union ' +
         	   QrBoletim.SQL.Text :=
               ' select sum(coalesce(cc.valor_c, 0)) valor_c from controle_creditos cc ' +
               ' inner join empresa emp on cc.codigo_emp = emp.cod_empresa ' +
               ' where cc.codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) +
               ' and (cc.datq_c = :data_rec_c) ' +
               ' and emp.codigo_unificadora = ' + vDadosIni.codEmpresa +
               ' and cc.codigo_emp <> ' + vDadosIni.codEmpresa;
             QrBoletim.ParamByName('data_rec_c').AsDate := vDadosIni.diaFFinanceiro + 1;
             QrBoletim.Open;
             while not QrBoletim.EOF do
             begin
               crbUnif := crbUnif + QrBoletim.FieldByName('Valor_c').AsCurrency;
               QrBoletim.next;
             end;
            end;

            // Somando relação de Cheques por controle...
            QrBoletim.close;
            QrBoletim.sql.clear;
            QrBoletim.sql.text := 'select sum(coalesce(cc.valor_ch, 0)) valor_ch from controle_cheque cc ' +
              ' where cc.codigo_ctrl = ' + vCtrl.dataSet.FieldByName('codigo_ctrl').AsString +
              ' and cc.data_rec <= :data_rec ' +
              ' and ((cc.status_ch = '''' or cc.status_ch is null) or cc.datq_ch > :data_rec) ' +
              ' and cc.codigo_emp = ' + vDadosIni.codEmpresa;
            QrBoletim.ParamByName('data_rec').AsDate := vDadosIni.diaFFinanceiro + 1;
            QrBoletim.open;
            while not QrBoletim.EOF do
            begin
              crb := crb + QrBoletim.FieldByName('Valor_ch').AsCurrency;
              QrBoletim.next;
            end;

            if (vDadosIni.vEmp.vFinanceiroUnificado) then
            begin
              QrBoletim.close;
              QrBoletim.sql.clear;
            	//QrBoletim.SQL.Text := QrBoletim.SQL.Text + ' union ' +
              QrBoletim.SQL.Text := ' select sum(coalesce(cc.valor_ch, 0)) valor_ch from controle_cheque cc ' +
                ' inner join empresa emp on cc.codigo_emp = emp.cod_empresa ' +
                ' where cc.codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) +
                ' and (cc.datq_ch = :data_rec) ' +
                ' and emp.codigo_unificadora = ' + vDadosIni.codEmpresa +
                ' and cc.codigo_emp <> ' + vDadosIni.codEmpresa;
              QrBoletim.ParamByName('data_rec').AsDate := vDadosIni.diaFFinanceiro + 1;  
              QrBoletim.open;
              while not QrBoletim.EOF do
              begin
                crbUnif := crbUnif + QrBoletim.FieldByName('Valor_ch').AsCurrency;
                QrBoletim.next;
              end;
            end;

            vSaldoCtrl.Insert;
            vSaldoCtrl.dataSet.FieldByName('Codigo_ctrl').AsInteger :=
              vCtrl.dataSet.FieldByName('Codigo_ctrl').AsInteger;
            vSaldoCtrl.dataSet.FieldByName('Data_sld').AsDateTime := vDadosIni.diaFFinanceiro + 1;
            vSaldoCtrl.dataSet.FieldByName('val_sld').AsCurrency := vCtrl.dataSet.FieldByName('saldo_At_ctrl').AsCurrency + crbUnif;

            vLancamentoSobraQuebraAtivado := False;
            if vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger = 1 then
            begin
              buscas.Close;
              buscas.SQL.Text := 'select FIN_LANC_SOBRA_QUEBRA from EMPRESA' +
                                 ' where cod_empresa = ' + vDadosIni.codEmpresa;
              buscas.Open;
              vLancamentoSobraQuebraAtivado := buscas.FieldByName('FIN_LANC_SOBRA_QUEBRA').AsString = 'S';
            end;

            if not vLancamentoSobraQuebraAtivado then
            begin
              if (vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger = 1) and (vlso <> 0) then
              begin
                vSaldoCtrl.dataSet.FieldByName('sobra_sld').AsCurrency := vlso;
                vSaldoCtrl.dataSet.FieldByName('val_sld').AsCurrency := vSaldoCtrl.dataSet.FieldByName('val_sld').AsCurrency + vlso;
              end
              else
                vSaldoCtrl.dataSet.FieldByName('sobra_sld').AsCurrency := 0;
            end
            else if (vlso <> 0) then
            begin                                
              buscas.Close;
              buscas.SQL.Text := 'select ps.n_conta_plc ncont_sobra, pq.n_conta_plc ncont_quebra, ' +
              	' cl.NCON_SOBRA ncon_sobra, cl.NCON_QUEBRA ncon_quebra, ps.tipo_plc tps, pq.tipo_plc tpq from cont_lig cl' +
                ' left join p_contas ps on ps.n_conta_plc = cl.NCON_SOBRA and ps.ativo = 1 and coalesce(ps.sthab, '''') <> ''N'' and ps.tipo_plc = ''E''' +
                ' left join p_contas pq on pq.n_conta_plc = cl.NCON_QUEBRA and pq.ativo = 1 and coalesce(pq.sthab, '''') <> ''N'' and pq.tipo_plc = ''S''' +
                ' where cod_emp = ' + vDadosIni.codEmpresa;
              buscas.Open;
              vOK:= True;

              if (vlso > 0) and ((buscas.FieldByName('ncon_sobra').AsFloat = 0) or
                ( (buscas.FieldByName('ncont_sobra').AsFloat = 0) and (buscas.FieldByName('ncon_sobra').AsFloat > 0) )) then
              begin
                vOK := False;
                if (buscas.FieldByName('ncon_sobra').AsFloat = 0) then
                  vMensagemSobraQuebra := 'Número da conta "Sobra de Caixa" não informada no cadastro da Empresa / Contas de Ligação. A sobra não será lançada. Deseja continuar mesmo assim?'
                else
                  vMensagemSobraQuebra := 'Número da conta "Sobra de Caixa" informada no cadastro da Empresa / Contas de Ligação não encontrada, ativa ou do tipo esperado no cadastro do Plano de Contas. A sobra não será lançada. Deseja continuar mesmo assim?';
                if not (Application.MessageBox(pchar(vMensagemSobraQuebra), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES) then
                begin
                  flg := 1;
                  Break;
                end;
              end
              else if (vlso < 0) and ((buscas.FieldByName('ncon_quebra').AsFloat = 0) or
                ( (buscas.FieldByName('ncont_quebra').AsFloat = 0) and (buscas.FieldByName('ncon_quebra').AsFloat > 0) )) then
              begin
                vOK := False;
                if (buscas.FieldByName('ncon_quebra').AsFloat = 0) then
                  vMensagemSobraQuebra := 'Número da conta "Quebra de Caixa" não informada no cadastro da Empresa / Contas de Ligação. A quebra de Caixa não será lançada. Deseja continuar mesmo assim?'
                else
                  vMensagemSobraQuebra := 'Número da conta "Quebra de Caixa" informada no cadastro da Empresa / Contas de Ligação não encontrada, ativa ou do tipo esperado no cadastro do Plano de Contas. A quebra de Caixa não será lançada. Deseja continuar mesmo assim?';
                if not (Application.MessageBox(pchar(vMensagemSobraQuebra), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES) then
                begin
                  flg := 1;
                  Break;
                end;
              end;

              if vOK then
              begin

                vLancL := TLancamentosImp.create;
                vContLigL := TContaLigacaoImp.create;

                try

                  vLancL._setTransactionComponentes(transacao);
                  vContLigL._AbrirContadeLigacao(True);

                  if (vlso > 0) then
                    vLancL.N_CONTA_PLC := buscas.FieldByName('ncon_sobra').AsFloat
                  else
                    vLancL.N_CONTA_PLC := buscas.FieldByName('ncon_quebra').AsFloat;

                  if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
                  begin
                    flg := 1;
                    Break;
                  end;

                  vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
                  vLancL.CODIGO_CTRL := 1;
                  vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
                  vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
                  if vlso > 0 then
                    vLancL.HISTORICO_L := Format('%0.2n', [vlso]) + ' - SOBRA DE CAIXA'
                  else
                    vLancL.HISTORICO_L := '('+Format('%0.2n', [abs(vlso)]) + ') - QUEBRA DE CAIXA';
                  vLancL.VALOR_L := 0;
                  vLancL.TP_MOD := 'S';

                  vLancL._efetuarLancamento;

                  buscas.Close;
                  buscas.SQL.Text := 'update lancamentos set ' +
                    ' STATUS_L = ''QUITADO'',' +
                    ' DATQ_L = :DATQ_L,' +
                    ' DT_COMPENSADO = :DATQ_L' +
                    ' where COD_LANC = ' + IntToStr(vLancL.COD_LANC) +
                    ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
                  buscas.ParamByName('DATQ_L').AsDate := vDadosIni.diaFFinanceiro + 1;
                  buscas.Open;

                  vSaldoCtrl.dataSet.FieldByName('COD_LANC_SOBRA_QUEBRA').AsInteger := vLancL.COD_LANC;
                finally
                  FreeAndNil(vLancL);
                  FreeAndNil(vContLigL);
                end;
              end;
              if (vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger = 1) and (vlso <> 0) then
              begin
                vSaldoCtrl.dataSet.FieldByName('sobra_sld').AsCurrency := vlso;
                vSaldoCtrl.dataSet.FieldByName('val_sld').AsCurrency := vSaldoCtrl.dataSet.FieldByName('val_sld').AsCurrency + vlso;
              end
              else
                vSaldoCtrl.dataSet.FieldByName('sobra_sld').AsCurrency := 0;
            end;
            if vDadosIni.vMostrarSaldoDinheiro = 'N' then
            begin
              if vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger = 1 then
                vSaldoCtrl.dataSet.FieldByName('VAL_SLD').AsCurrency := vlsald;
            end; { CONTR_BANC}
            vSaldoCtrl.dataSet.FieldByName('vl_crd_sld').value := crb;
            buscas.Close;
            buscas.sql.text := 'select * from Sal_Ctrl where data_sld = ''' +
              FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro) + ''' and ' +
              'codigo_ctrl = ' + vCtrl.dataSet.fieldbyname('codigo_ctrl').asstring +
              ' AND (COD_EMP = ' + vDadosIni.codEmpresa + ') ';
            buscas.Open;
            if (flagSaldoBancario = 1) and (vCtrl.dataSet.FieldByName('CONTR_BANC').asstring = 'S') then
              vSaldoCtrl.dataSet.FieldByName('SALDO_BANCO').AsCurrency := vSaldoCtrl.dataSet.FieldByName('VAL_SLD').AsCurrency
            else if (vDadosIni.vConcBanc.vHabilitarConcBanc) and (buscas.FieldByName('conc_banc').AsString = 'S') then
              vSaldoCtrl.dataSet.FieldByName('SALDO_BANCO').AsCurrency := buscas.FieldByName('SALDO_CONC').AsCurrency
            else
              vSaldoCtrl.dataSet.FieldByName('SALDO_BANCO').AsCurrency := buscas.FieldByName('SALDO_BANCO').AsCurrency;
            vSaldoCtrl.dataSet.FieldByName('COD_EMP').AsString := vDadosIni.codEmpresa;
            vSaldoCtrl.post;
            vSaldoCtrl.Apply;
            buscas.Close;
            vCtrl.edit;
            vCtrl.dataSet.FieldByName('Saldo_ant_ctrl').AsCurrency := vCtrl.dataSet.FieldByName('Saldo_at_ctrl').AsCurrency;
            if (vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger = 1) and (vlso <> 0) then//and (not vLancamentoSobraQuebraAtivado) then
              vCtrl.dataSet.FieldByName('SALDO_AT_CTRL').AsCurrency := vCtrl.dataSet.FieldByName('SALDO_AT_CTRL').AsCurrency + vlso;
            vCtrl.post;
            vCtrl.Apply;
            vCtrl.next;
            crb := 0;
            crbUnif := 0;
          end;
          try
            dataSet.DisableControls;
            dataSet.first;
            while not EOF do
            begin
              if dataSet.FieldByName('Data').AsDateTime = (vDadosIni.diaFFinanceiro + 1) then
              begin
                if dataSet.FieldByName('Tipo_l').AsString = 'S' then
                  vts := vts + dataSet.FieldByName('Valor_l').AsCurrency
                else
                  vte := vte + dataSet.FieldByName('Valor_l').AsCurrency;
              end;
              dataSet.Next;
            end;
          finally
            dataSet.EnableControls;
          end;
          vmov := vFechDia.dataSet.FieldByName('nmov').AsInteger + 1;
          vdtFcd := vFechDia.dataSet.FieldByName('dia_fcd').AsDateTime + 1;
          vFechDia.Insert;
          vFechDia.dataSet.FieldByName('Nmov').AsInteger := vmov;
          vFechDia.dataSet.FieldByName('Dia_fcd').AsDateTime := Vdtfcd;
          vFechDia.dataSet.FieldByName('Tot_e_fcd').AsCurrency := Vte;
          vFechDia.dataSet.FieldByName('Tot_s_fcd').AsCurrency := vts;
          vFechDia.dataSet.FieldByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
          vFechDia.post;
          vFechDia.Apply;
          buscas.Close;
          buscas.sql.text := ' update fech_dia set inicia_fech = '''' ' +
            ' where dia_fcd = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro)) +
            ' and codigo_emp = ' + vDadosIni.codEmpresa;
          buscas.Prepare;
          buscas.ExecSQL;
          if flg = 0 then
            vDiaMarcadoFechando := 0;
          {Application.CreateForm(TFrParBolCT, FrParBolCT);
          dtmc.MultiEmpresa(FrParBolCT, codEmpresa);
          FrParBolCT.maskedit1.text := datetostr(QrFecdDia_fcd.value);
          FrParBolCT.maskedit2.text := datetostr(QrFecdDia_fcd.value);
          if dtmc.QrSalCnt.IsEmpty then
            dtmc.QrSalCnt.append
          else
            dtmc.QrSalCnt.edit;
          Dtmc.QrSalCntdata_sld.value := QrFecdDIA_FCD.value;
          Dtmc.QrSalCntVAL_SLD.value := FrParBolCT.ConfCxCont;
          Dtmc.QrSalCntCODIGO_EMP.text := codEmpresa;
          Dtmc.QrSalCnt.post;
          FrParBolCT.free;}
        end;
        //        QrPContas.close;
        //        QrPContas.sql.text := vsql;
        //        QrPContas.open;
        if flg = 0 then
        begin
         CommitaTransacao;
         vFechDia._abreFechamento('1');
         vDadosIni.definirDiaFinanceiroFechado(buscas);
         vSaldoCtrl.Close;
 //        vCtrl.Close;
         vDadosIni.fechaStatusProcessamento;
         messagedlg('Fechamento Concluído', mtinformation, [mbOK], 0);
         Result := True;
        end
        else
         RollBackTransacao;
      except
        on e: exception do
        begin
          RollBackTransacao;
          Result := false;
          Application.MessageBox(pchar('Erro ao Fechar o Dia do Financeiro. Erro: ' + e.Message), 'Atenção', 0
            + 64);
          registraErro('Erro ao Fechar o dia do Financeiro. Erro: ' + e.Message);
        end;
      end;
    end;
  finally
    if vDiaMarcadoFechando > 0 then
    begin
      buscas.Close;
      buscas.sql.text := 'update fech_dia set inicia_fech = '''' ' +
      	' where dia_fcd = :dia_fcd' +
        ' and codigo_emp = ' + vDadosIni.codEmpresa +
        ' and inicia_fech = ''S''';
      buscas.ParamByName('dia_fcd').AsDate := vDiaMarcadoFechando;
      buscas.ExecSQL;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
      vFechDia._abreFechamento('1');
    end;
    Screen.Cursor := crDefault;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TLancamentos.gravarDespesaVeic: boolean;
var
  vData: TDateTime;
begin
  if not ((vDadosIni.vEmp.vVersaoVeiculos = '4') and (dataSet.FieldByName('COD_DESPESA').AsInteger > 0)) then
    exit;

  vData := vDadosIni.getDataBanco(buscas);

  buscas.Close;
  buscas.SQL.Text := 'UPDATE DESPESAS_VEIC SET STATUS_DESPESA = :STATUS_DESPESA, ' +
   ' DATA_PAGAMENTO = :DATA_PAGAMENTO, COD_LANC = :COD_LANC ' +
   ' WHERE COD_DESPESA = :COD_DESPESA AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas.ParamByName('COD_LANC').AsInteger := dataSet.FieldByName('COD_LANC').AsInteger;
  buscas.ParamByName('STATUS_DESPESA').AsString := 'QUITADA';
  buscas.ParamByName('DATA_PAGAMENTO').AsString := FormatDateTime('DD/MM/YYYY', vData);
  buscas.ParamByName('COD_DESPESA').AsInteger := dataSet.FieldByName('COD_DESPESA').AsInteger;
  buscas.Prepare;
  buscas.ExecSQL;
end;

function TLancamentos.insert: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('LANC003', 'INCLUIR', '', 'LANCAMENTOS', '',
    buscas, True) then
    exit;

  if not vDadosIni.VerificarinicioFechFinan(buscas) then
    exit;

  if not vDadosIni.definirDiaFinanceiroFechado(buscas) then
    Exit;

  if not dataSet.Active then
  begin
    montaSelect('select lancamentos.*, ' +
    	' controles.nome_ctrl, empresa.identificacao_emp, ' +
      ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, ' +
      ' p_contas.cod_cta_contabil, p_contas_contabil.nome_cta from lancamentos' +
      ' inner join controles on lancamentos.codigo_ctrl = controles.codigo_ctrl and lancamentos.codigo_emp = controles.codigo_emp ' +
      ' left join empresa on empresa.cod_empresa = lancamentos.cod_emp_mult ' +
      ' left join p_contas on p_contas.n_conta_plc = lancamentos.n_conta_plc ' +
      ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
      ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
      ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = lancamentos.codigo_emp ' +
      ' where lancamentos.cod_lanc = 0 and lancamentos.codigo_emp = ' + vDadosIni.codEmpresa);
  end;

  if inherited insert then
  begin
    dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('DATA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    dataSet.FieldByName('LANC_AVULSO').AsString := 'S';
    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.PesqPros('LANC034', 'HABILITAR', '', 'LANCAMENTOS', '', buscas, True) then
      dataSet.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;

    vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vCodigoCtrl := 0;
    vDataReferencia := dataSet.FieldByName('DTREFERENCIA').AsDateTime;

    vPCont._abreTodosPContasLanc(-1);
	  vCtrl._abreTodosControlesLanc(-1);
    vEmpresasUnificadas._abreTodosEmpresas;

    Result := True;
  end;
end;

function TLancamentos.post: Boolean;
var
  acao: string;
  vDataRef, vDataLan: TDate;
  vMensagem: string;
  vCampoLanc, vValorLanc: string;
  I: Integer;
  vCodLanc: Integer;
begin
  try
    Result := false;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('LANC010', acao, 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString,
      'LANCAMENTOS', '', buscas, True) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      if dataSet.FieldByName('COD_EMP_MULT').AsInteger <= 0 then
        raiseExceptionCreate('Código Empresa Unificada', 'DBEdit14');

      if not vEmpresasUnificadas._BuscarEmpresas(dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
        raiseExceptionCreate('Código Empresa Unificada não existe ou não encontrada!', 'DBEdit14');
    end
    else
      dataSet.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('CODIGO_EMP').AsInteger;

    if not _existePContas(0,2) then
      raiseExceptionCreate('Nº da Conta precisa de passar pelo controle de processo para prosseguir', 'DBEdit1');

    if dataSet.FieldByName('N_CONTA_PLC').AsFloat <= 0 then
      raiseExceptionCreate('Nº da Conta deve ser preenchido', 'DBEdit1');

    if not _existePContas(0,1) then
      raiseExceptionCreate('Nº da Conta não encontrado no Plano de Contas', 'DBEdit1');

    if not testarNumConta(vMensagem) then
      raiseExceptionCreate(vMensagem, 'DBLookupComboBox1');

    if (vPCont.dataSet.FieldByName('sthab').AsString) = 'N' then
    	raiseExceptionCreate('Nº da Conta Desabilitada, tente outra', 'DBEdit1');

    buscas.Close;
    buscas.SQL.Text := ' select n_conta_plc, ativo from p_contas ' +
    	' where n_conta_plc = :n_conta_plc ';
    buscas.ParamByName('n_conta_plc').AsFloat := dataSet.FieldByName('n_conta_plc').AsFloat;
    buscas.Open;
    if not buscas.IsEmpty then
      if buscas.FieldByName('ativo').AsInteger = 0 then
        raiseExceptionCreate('Nº da Conta Desabilitada, tente outra', 'DBEdit1');

//    if Trim(dataSet.FieldByName('status_l').AsString) = 'QUITADO' then
    begin
       buscas.Close;
       buscas.SQL.Text := 'select n_conta_plc,tipo_plc from p_contas where n_conta_plc = :n_conta_plc';
       buscas.ParamByName('n_conta_plc').AsFloat := dataSet.FieldByName('n_conta_plc').AsFloat;
       buscas.Open;
       if Trim(buscas.FieldByName('tipo_plc').AsString) <> Trim(dataSet.FieldByName('tipo_l').AsString) then
         raiseExceptionCreate('Nº da Conta informada não é do mesmo tipo do lançamento. Por favor selecione uma conta do mesmo tipo: ' + dataSet.FieldByName('tipo_l').AsString, 'DBEdit1');
       buscas.Close;  
    end;               

    if _contaPossuiRateio(0) then
      raiseExceptionCreate('CONTA POSSUI RATEIO CONTA A CONTA. FAVOR UTILIZAR O CADASTRO DE CONTAS A PAGAR', 'DBEdit1');

    if Trim(dataSet.FieldByName('TIPO_L').AsString) = '' then
      raiseExceptionCreate('Natureza do lançamento deve ser preenchida', 'DBComboBox1');

    if Trim(dataSet.FieldByName('HISTORICO_L').AsString) = '' then
      raiseExceptionCreate('Histórico do lançamento deve ser preenchida', 'dbedit6');

    if not (dataSet.FieldByName('TIPO_L').AsString[1] in ['E', 'S']) then
      raiseExceptionCreate('Natureza do lançamento inválida', 'DBComboBox1');

    if _dataAindaNaoProgramada(dataSet.FieldByName('DATA').AsDateTime) then
      raiseExceptionCreate('Data Lançamento ainda não programada', 'DBEdit3');

    if dataSet.FieldByName('DTREFERENCIA').IsNull then
      raiseExceptionCreate('Data Referência não preenchida', 'DBEdit4');

    if _dataAindaNaoProgramada(dataSet.FieldByName('DTREFERENCIA').AsDateTime) then
      raiseExceptionCreate('Data Referência ainda não programada', 'DBEdit4');

//    if Trim(dataSet.FieldByName('TIP_CNT').AsString) = 'C' then
//      if vDadosIni.StrToFloatFormat(dataSet.FieldByName('VL_CONTABIL').AsFloat,2) <= 0 then
//        raiseExceptionCreate('Valor contábil deve ser preenchido', 'DBEdit8');
        
    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_L').AsFloat,2) <= 0 then
      raiseExceptionCreate('Valor deve ser preenchido', 'DBEdit7');

    if not _existeControle(dataSet.FieldByName('codigo_ctrl').AsInteger) then
      raiseExceptionCreate('Controle não encontrado ou não informado', 'DBEdit9');

    if not vCtrl.dataSet.Locate('CODIGO_CTRL', fint('codigo_ctrl'), []) then
      raiseExceptionCreate('Controle não encontrado ou não informado', 'DBEdit9');

    if vCtrl.dataSet.FieldByName('CONTR_BANC').AsString = 'S' then
    begin
     if _chequeJaUtilizado(0, '') then
      if Application.MessageBox('Nº de Cheque já utilizado para este controle. Deseja continuar?',
       'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
      begin
       vNomeCampoErro := 'DBEdit12';
       Exit;
      end;
    end;

    if trim(dataSet.FieldByName('N_CHEQ_L').AsString) <> '' then
	    if dataSet.FieldByName('DATA_VENC_CHEQ_L').IsNull then
       raiseExceptionCreate('Data de vencimento do cheque deve ser informada', 'DBEdit13');

    if trim(dataSet.FieldByName('N_CHEQ_L').AsString) = '' then
    begin
    	dataSet.FieldByName('NOMINAL_L').Value := null;
      dataSet.FieldByName('DATA_VENC_CHEQ_L').Value := null;
    end;

    if Trim(vCtrl.dataSet.FieldByName('CONTR_BANC').AsString) = 'S' then
      dataSet.FieldByName('NATL').AsString := 'S'
    else
      dataSet.FieldByName('NATL').AsString := '';

    if (acao = 'INSERIR') or ((acao = 'EDITAR') and (vDataReferencia <> dataSet.FieldByName('DTREFERENCIA').AsDateTime)) then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select first 1 apuracao_depto.cod_dep, ' +
        ' apuracao_depto.mes, ' +
        ' apuracao_depto.ano, ' +
        ' apuracao_depto.tpdesp, ' +
        ' apuracao_depto.cod_empresa, ' +
        ' apuracao_depto.datacad_ap from apuracao_depto ' +
        ' inner join empresa on empresa.cod_empresa = apuracao_depto.cod_empresa ' +
        ' where apuracao_depto.mes = :mes ' +
        ' and apuracao_depto.ano = :ano ' +
        ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
        '             empresa.codigo_unificadora ' +
        '           else ' +
        '             apuracao_depto.cod_empresa ' +
        '      end) = :cod_empresa ';
      buscas.ParamByName('mes').AsInteger := StrToInt(FormatDateTime('mm', dataSet.FieldByName('dtreferencia').AsDateTime));
      buscas.ParamByName('ano').AsInteger := StrToInt(FormatDateTime('yyyy', dataSet.FieldByName('dtreferencia').AsDateTime));
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;

      if not buscas.IsEmpty then
      begin
      	if Application.MessageBox(PChar('DRE do mês ' + FormatDateTime('mm', dataSet.FieldByName('dtreferencia').AsDateTime) +
          ' ano ' + FormatDateTime('yyyy', dataSet.FieldByName('dtreferencia').AsDateTime) +
          ' salvo, deseja continuar o cadastro/alteração mesmo assim?'),
        	'Confirmação', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDNO then
        begin
        	raiseExceptionCreate('DRE do mês ' + FormatDateTime('mm', dataSet.FieldByName('dtreferencia').AsDateTime) +
            ' ano ' + FormatDateTime('yyyy', dataSet.FieldByName('dtreferencia').AsDateTime) +
            ' salvo, não é permitido utilizar esta data de referência para continuar o cadastro/alteração', 'DBEdit4');
        end;

        if not vDadosIni.PesqPros('LANC049', 'PERMITIR', '', 'LANCAMENTOS',
        	dataSet.FieldByName('COD_LANC').AsString, buscas, True) then
        begin
          raiseExceptionCreate('DRE do mês ' + FormatDateTime('mm', dataSet.FieldByName('dtreferencia').AsDateTime) +
            ' ano ' + FormatDateTime('yyyy', dataSet.FieldByName('dtreferencia').AsDateTime) +
            ' salvo, não é permitido utilizar esta data de referência para continuar o cadastro/alteração', 'DBEdit4');
        end;
      end;
    end;

    vDataLan := StartOfTheMonth(dataSet.FieldByName('data').AsDateTime);
    vDataRef := StartOfTheMonth(dataSet.FieldByName('dtreferencia').AsDateTime);

    if vDataRef >= vDataLan then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select CONTA_REFERENCIA from p_contas' +
        ' where N_CONTA_PLC = :N_CONTA_PLC';
      buscas.ParamByName('N_CONTA_PLC').AsFloat := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
      buscas.Open;
      if buscas.FieldByName('CONTA_REFERENCIA').AsString = 'S' then
      begin
        Application.MessageBox(PChar('Conta do lançamento configurada como conta de referência!' + #13 +
          'O mês de referência do lançamento deve ser inferior ao mes do Financeiro'), 'Atenção', MB_ICONWARNING + MB_OK);
        if not vDadosIni.PesqPros('LANC035', 'VALIDAR', 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString,
          'LANCAMENTOS', '', buscas, True, True) then
          exit;
      end;
    end;

    if dataSet.State = dsInsert then
    begin
      if Trim(vCtrl.dataSet.FieldByName('docs').AsString) <> 'N' then
      begin
        if Application.MessageBox(pchar('O controle selecionado é usado para controle de Documentos' + #13 +
          'Os lançamentos efetuados aqui são feitos para correção de saldo.' + #13 +
          'O cadastro do documento é feito pelo cadastro de Cheques ou Créditos e não pelos Lançamentos.' + #13 +
          'Deseja mesmo continuar com o lançamento?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;

        if not vDadosIni.PesqPros('LANC028', acao, 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString,
          'LANCAMENTOS', '', buscas, True) then
          exit;
      end;
    end;

    if (dataSet.State = dsInsert)
    	and (vPCont.dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S') then
    begin
    	vCampoLanc := '';
      vValorLanc := '';
      dataSet.FieldByName('LANC_AVULSO').AsString := 'N';
      for i := 0 to dataSet.Fields.Count - 1 do
      begin
        vCampoLanc := vCampoLanc + dataSet.Fields[I].FieldName + '|';
        vValorLanc := vValorLanc + dataSet.Fields[I].AsString + '|';
      end;
      if (dataSet.FieldByName('TIPO_L').AsString = 'S') then
	      vDadosIni.gerar_contrapartida(vCampoLanc, vValorLanc, dataSet.Fields.Count)
      else
      	vDadosIni.gerar_contrapartidaCTP(vCampoLanc, vValorLanc, dataSet.Fields.Count);
      dataSet.Cancel;
      RollBackTransacao;
      Result := True;
    end
    else
    begin
       if (dataSet.State = dsInsert) and (vPCont.dataSet.FieldByName('ESTORNAR_VALE').AsString = 'S') then
       begin
         if not estornaReciboValeCompra(vCodLanc) then
           exit;

         dataSet.FieldByName('cod_lanc').AsInteger := vCodLanc;
         dataSet.FieldByName('LANC_AVULSO').AsString := 'N';
       end
       else if (dataSet.State = dsInsert) then
	       dataSet.FieldByName('cod_lanc').AsInteger := Gencodigo('LANCAMENTOS', dtmLancamentos.SpIncCodigo, vDadosIni.codEmpresa);
       dataSet.Post;

       if dataSet.ChangeCount = 0 then
       begin
         Result := True;
         exit;
       end;

       gravarDespesaVeic;

   	   Apply;

	     CommitaTransacao;
    end;

    vDadosIni.GravaAuditoria('LANC010', acao, 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString + ' DOC.: ' + dataSet.FieldByName('NDOC_L').AsString +
      ' SALVO COM SUCESSO', 'LANCAMENTOS', '', buscas);

    Result := true;

    Refresh;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao salvar lançamento. Erro: ' + e.Message), 'Atenção', 0
        + 64);
      registraErro('function TLancamentos.post Erro: ' + e.Message);
    end;
  end;
end;

function TLancamentos.ReabirDiaCX: boolean;
var
  vmes, vano, vdia: word;
  vmesano: array of variant;
  vsobra: currency;
  vdataCompens: Variant;
begin
  try
    Screen.Cursor := crHourGlass;
    Result := False;
    vFechDia.First;
    if Application.MessageBox(Pchar('Atencao!! Para Reabrir Dias já Fechados somente é recomendável ' + #13 +
      'fazê-lo com o Ultimo Dia, Deseja Realmente Prosseguir'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      try
        vDadosIni.abreStatusProcessamento('', 'Reabrindo Dia ' + vFechDia.dataSet.FieldByName('DIA_FCD').asstring + ' do Financeiro');
        buscas.Close;
        buscas.sql.text := ' update fech_dia set inicia_fech = ''S'' ' +
        	' where dia_fcd = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime)) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;
        CommitaTransacao;
        IniciaTransacao;
        vCtrl._abreTodosControlesLanc(-1);
        vCtrl.first;
        while not vCtrl.eof do
        begin
          vsobra := 0;
          vSaldoCtrl._abreSaldos(vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger, vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime);
          vsobra := vSaldoCtrl.dataSet.FieldByName('SOBRA_SLD').AsCurrency;
          vSaldoCtrl._abreSaldos(vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger, vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime - 1);
          vCtrl.dataSet.edit;
          if (vSaldoCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger = 1) then
          begin
//            if (vsobra <> 0) then
//              vCtrl.dataSet.FieldByName('SALDO_AT_CTRL').value := vSaldoCtrl.dataSet.FieldByName('VAL_SLD').AsCurrency -
//                vsobra
//            else
              vCtrl.dataSet.FieldByName('SALDO_AT_CTRL').value := vSaldoCtrl.dataSet.FieldByName('VAL_SLD').AsCurrency;
          end
          else
            vCtrl.dataSet.FieldByName('SALDO_AT_CTRL').value := vSaldoCtrl.dataSet.FieldByName('VAL_SLD').AsCurrency;
          if (vCtrl.dataSet.FieldByName('CONTR_BANC').AsString = 'S') then
          begin
            buscas.Close;
            buscas.sql.text := ' select max(data_sld) data_sld from sal_ctrl ' +
            	' where data_sld < ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime)) +
							' and cod_emp = ' + vDadosIni.codEmpresa +
              ' and codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
              ' and conc_banc = ''S'' ';
            buscas.Open;

            vdataCompens := buscas.FieldByName('DATA_SLD').Value;
            vCtrl.dataSet.FieldByName('DATA_CONF_SALD_BANC').Value := vdataCompens;
          end;

          vCtrl.post;
          vCtrl.Apply;
          //            vSaldoCtrl.Delete;
          vCtrl.next;
        end;

        vSaldoCtrl._abreSaldos(1, vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime);
        if vSaldoCtrl.dataSet.FieldByName('COD_LANC_SOBRA_QUEBRA').AsInteger > 0 then
        begin
          buscas.close;
          buscas.SQL.text := ' delete from lancamentos' +
            ' where cod_lanc = ' + IntToStr(vSaldoCtrl.dataSet.FieldByName('COD_LANC_SOBRA_QUEBRA').AsInteger) +
            ' and codigo_emp = ' + vDadosIni.codEmpresa;
          buscas.Prepare;
          buscas.ExecSQL;
        end;

        buscas.close;
        buscas.SQL.text := ' delete from sal_ctrl ' +
        	' where data_sld = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime)) +
          ' and cod_emp = ' + vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.text := ' update lancamentos set status_l = null, datq_l = null ' +
        	' where datq_l = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime)) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.text := ' update lancamentos set dt_compensado = null ' +
        	' where dt_compensado >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime)) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.text := ' update lancamentos set dia_fcd = null ' +
        	' where dia_fcd >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime)) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.Close;
        buscas.sql.text := ' delete from fech_dia ' +
        	' where dia_fcd = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vFechDia.dataSet.FieldByName('DIA_FCD').AsDateTime)) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa +
          ' and nmov = ' + vFechDia.dataSet.FieldByName('NMOV').AsString;
        buscas.Prepare;
        buscas.ExecSQL;
        //            vFechDia.Delete;
        //            vFechDia.Apply;
        CommitaTransacao;
        vFechDia._abreFechamento('1');
        vDadosIni.fechaStatusProcessamento;
        vDadosIni.definirDiaFinanceiroFechado(buscas);
        messagedlg('Reabertura concluída com sucesso', mtinformation, [mbOK], 0);
        Result := True;
      except
        on e: exception do
        begin
          RollBackTransacao;
          Result := false;
          Application.MessageBox(pchar('Erro ao Reabrir o Dia do Financeiro. Erro: ' + e.Message), 'Atenção', 0
            + 64);
          registraErro('Erro ao Fechar o dia do Financeiro TLancamentos.ReabirDiaCX. Erro: ' + e.Message);
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TLancamentos.testarNumConta(var pMensagem: string; pCodEmpMult: Integer): boolean;
var
  buscas2: TIBQuery;
begin
  try
  	buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;
    
    if ((vNumConta = dataSet.FieldByName('N_CONTA_PLC').AsFloat) or (vpermitir)) then
    begin
    	Result := True;
      Exit;
    end;

    Result := false;

    if dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0 then
    begin
      buscas2.Close;
      buscas2.SQL.Text :=  ' select codigo_ctrl, docs from controles ' +
        ' where codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    			IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
        ' and codigo_ctrl = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger);
      buscas2.Open;
    end;

    buscas.Close;
    buscas.SQL.Text := ' select p.n_conta_plc, p.desc_plc, p.tipo_plc, c.desc_gr, ' +
      ' c.tipo_gr, s.desc_sub_ct, p.tipo_ctp, p.gerar_contrapartida, p.estornar_vale from p_contas p  ' +
    	' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct ' +
      ' where p.n_conta_plc = :n_conta_plc ';
    buscas.ParamByName('N_CONTA_PLC').AsFloat := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
    buscas.Open;

    Result := True;
    
    if buscas.IsEmpty then
      Exit;

    if dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0 then
	   if (trim(buscas2.FieldByName('DOCS').AsString) <> 'N')
      	and (buscas.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S') then
      begin
        pMensagem := 'Conta "' + FloatToStr(dataSet.FieldByName('N_CONTA_PLC').AsFloat) +
         ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" esta configurada como contrapartida: ' + #13 +
         'O controle informado não pode ser do tipo "S1 - CHEQUES" ou "S2 - CRÉDITOS" ' + #13 +
         'Favor verificar antes de continuar!';
        Result := false;
        exit;
      end;

    if dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0 then
	   if (trim(buscas2.FieldByName('DOCS').AsString) <> 'N')
      	and (buscas.FieldByName('ESTORNAR_VALE').AsString = 'S') then
      begin
        pMensagem := 'Conta "' + FloatToStr(dataSet.FieldByName('N_CONTA_PLC').AsFloat) +
         ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" esta configurada como estornar vale: ' + #13 +
         'O controle informado não pode ser do tipo "S1 - CHEQUES" ou "S2 - CRÉDITOS" ' + #13 +
         'Favor verificar antes de continuar!';
        Result := false;
        exit;
      end;  

    if buscas.FieldByName('TIPO_PLC').AsString = 'S' then
    begin
      if buscas.FieldByName('TIPO_GR').AsString = 'S' then //Natureza da conta de saída
        Exit
      else if buscas.FieldByName('TIPO_CTP').AsString = 'F' then // Conta do tipo fornecedor
        Exit
    end
    else
    begin
      if buscas.FieldByName('TIPO_CTP').AsString = 'E' then // Conta do tipo emprestimo
        Exit
      else if buscas.FieldByName('TIPO_CTP').AsString = 'T' then // Conta do tipo transferencia
        Exit;
    end;

    if buscas.FieldByName('TIPO_CTP').AsString = 'O' then // Conta do tipo outras
    	Exit
    else if buscas.FieldByName('TIPO_CTP').AsString = 'Z' then // Conta do tipo correção
    	Exit;
     
    if buscas.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then  //Conta configurada como contrapartida
    	exit;

//    if buscas.FieldByName('TIPO_PLC').AsString = 'S' then
//      if buscas.FieldByName('ESTORNAR_VALE').AsString = 'S' then  //Conta configurada como estornar vale
//        exit;

    Result := False;

    if buscas.FieldByName('TIPO_PLC').AsString = 'S' then
      pMensagem := 'Conta "' + FloatToStr(dataSet.FieldByName('N_CONTA_PLC').AsFloat) +
        ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" não esta configurada!' + #13 +
        'Motivo(s): ' + #13 +
        '* Natureza do grupo da conta não esta definida como "SAÍDA"' + #13 +
        '* Tipo da conta não é de origem "FORNECEDOR"/"OUTRAS SAÍDAS"/"EMPRESTIMO"/"CORRECAO DE SALDO"' + #13 +
        '* Conta não esta configurada como contrapartida' + #13 +
//        '* Conta não esta configurada como estornar vale' + #13 +
        'Favor verificar antes de continuar!'
    else
    	pMensagem := 'Conta "' + FloatToStr(dataSet.FieldByName('N_CONTA_PLC').AsFloat) +
        ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" não esta configurada!' + #13 +
        'Motivo(s): ' +#13 +
        '* Tipo de entrada não é de origem "EMPRESTIMO"/"TRANSFERÊNCIA"/"OUTRAS RECEITAS"/"CORRECAO DE SALDO"' + #13 +
        '* Conta não esta configurada como contrapartida' + #13 +
        'Favor verificar antes de continuar!';
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TLancamentos.verDocsSendoRec: boolean;
begin
  Result := true;

  buscas.close;
  buscas.sql.text :=
    ' select col.nome_vendedor, count(*) as total from controle_creditos cr ' +
    ' inner join empresa on ' +
    '		empresa.cod_empresa = cr.codigo_emp ' +
    '	inner join colaborador col on ' +
    '		col.cod_vendedor = cr.op_cx ' +
    '		and col.cod_empresa = cr.codigo_emp ' +
    ' where cr.status_cx = ''R'' ' +
    ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
    '             empresa.codigo_unificadora ' +
    '           else ' +
    '             cr.codigo_emp ' +
    '      end) = ' + vDadosIni.codEmpresa +
    ' group by col.nome_vendedor ';
  buscas.open;
  if not buscas.IsEmpty then
  begin
    result := False;
    while not buscas.Eof do
    begin
      Application.MessageBox(Pchar('Há ' + vDadosIni.StrZero(buscas.FieldByName('total').AsInteger, 3) +
        ' documento(s) sendo recebido pelo Usuário: ' + buscas.FieldByName('nome_vendedor').AsString), 'Atenção',
        MB_OK + MB_ICONINFORMATION);
      buscas.next;
    end;
  end;

  buscas.close;
  buscas.sql.text :=
    ' select col.nome_vendedor,count(*) as total from controle_cheque cr ' +
    ' inner join empresa on ' +
    '		empresa.cod_empresa = cr.codigo_emp ' +
    ' inner join colaborador col on ' +
    '		col.cod_vendedor = cr.op_cx ' +
    '		and col.cod_empresa = cr.codigo_emp ' +
    ' where cr.status_cx = ''R'' ' +
    ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
    '             empresa.codigo_unificadora ' +
    '           else ' +
    '             cr.codigo_emp ' +
    '      end) = ' + vDadosIni.codEmpresa +
    ' group by col.nome_vendedor ';
  buscas.open;
  if not buscas.IsEmpty then
  begin
    result := False;
    while not buscas.Eof do
    begin
      Application.MessageBox(Pchar('Há ' + vDadosIni.StrZero(buscas.FieldByName('total').AsInteger, 3) +
        ' cheque(s) sendo recebido pelo Usuário: ' + buscas.FieldByName('nome_vendedor').AsString), 'Atenção',
        MB_OK + MB_ICONINFORMATION);
      buscas.next;
    end;
  end;
  buscas.Close;
end;

function TLancamentos.verFormpagpend: boolean;
begin
 result:=true;
 buscas.Close;
 buscas.SQL.Text := 'select count(*) as valor from formpagamento '+
    ' where data_mov = '+quotedstr(FormatDateTime('mm/dd/yyyy', (vDadosIni.diaFFinanceiro + 1)))+
    ' and cod_empresa = '+vDadosIni.codEmpresa+' and (prcss is null or prcss = '''')';
 buscas.open;
 if buscas.FieldByName('valor').asinteger > 0 then
  result:=true
 else
  result:=false;
 buscas.close;
end;

function TLancamentos.verificaLancamentoEstornoVale: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select n_conta_plc, estornar_vale from p_contas ' +
  	' where n_conta_plc = :n_conta_plc ';
  buscas.ParamByName('n_conta_plc').AsFloat := dataSet.FieldByName('n_conta_plc').AsFloat;
  buscas.Open;

  Result := buscas.FieldByName('estornar_vale').AsString = 'S'; 
end;

function TLancamentos.verificanmov: integer;
begin
  buscas.close;
  buscas.sql.Text := 'select * from fech_Dia where CODIGO_EMP = ' + vDadosIni.codEmpresa +
    ' and dia_fcd = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vdatamovBol));
  buscas.Open;
  Result := buscas.FieldByName('Nmov').AsInteger;
end;

function TLancamentos.verificarDocumentosSemRecebimento: boolean;
var
  vMensagem: string;
  vTipo: string;
begin
  if vDadosIni.vEmp.vModoFaturamento = 'S' then
  begin
    Result := false;
    exit;
  end;
  
  result:=true;
  buscas.Close;
  buscas.SQL.Text := ' select nped as num_doc, tipo, cod_empresa from pedvenda ' +
  	' where data_fech = :data ' +
    ' and tipo in (''REQ'', ''OS'') ' +
    ' and status_ped = ''FECHADA'' ' +
    ' and cod_empresa in ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado),
    	vDadosIni.vEmp.vCodigoUnificadas, '(' + vDadosIni.codEmpresa + ')') +
    ' and coalesce(valor_total, 0) > 0 ' +
    ' and (select case when (count(ndoc) > 0) then 1 else 0 end formas from existe_formas ' +
    '		    (nped, tipo, cod_empresa)) = 0 ' +
    ' union all ' +
    ' select n_comando as num_doc, ''MOT'' tipo, cod_empresa from com_fat ' +
    ' where data_fech = :data ' +
    ' and natureza = ''S'' ' +
    ' and status_v = ''FECHADO'' ' +
    ' and cod_empresa in ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado),
    	vDadosIni.vEmp.vCodigoUnificadas, '(' + vDadosIni.codEmpresa + ')') +
    ' and coalesce(valor_a_rec, 0) > 0 ' +
    ' and (select case when (count(ndoc) > 0) then 1 else 0 end formas from existe_formas ' +
    ' 	    (n_comando, ''MOT'', cod_empresa)) = 0 ' +
    ' union all ' +
    ' select nrecibo as num_doc, ''REC'' tipo, cod_empresa from recibos ' +
    ' where data_rec = :data ' +
    ' and nrecibo < 100000 ' +
    ' and cod_empresa in ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado),
    	vDadosIni.vEmp.vCodigoUnificadas, '(' + vDadosIni.codEmpresa + ')') +
    ' and coalesce(valor, 0) > 0 ' +
    ' and (select case when (count(ndoc) > 0) then 1 else 0 end formas from existe_formas ' +
    '    	  (nrecibo, ''REC'', cod_empresa)) = 0 ' +
    ' order by 2, 1 ';
  buscas.ParamByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
  buscas.Open;
  buscas.FetchAll;

 if buscas.IsEmpty then
 	 result:=false
 else
 begin
   Result := true;

   vMensagem := '';

   buscas.First;
   while not buscas.Eof do
   begin
   	 if trim(vMensagem) = '' then
       vMensagem := vMensagem +
          buscas.FieldByName('tipo').AsString + ' - ' +
          IntToStr(buscas.FieldByName('num_doc').AsInteger)
     else
     	 vMensagem := vMensagem + #13 +
          buscas.FieldByName('tipo').AsString + ' - ' +
          IntToStr(buscas.FieldByName('num_doc').AsInteger);

     if buscas.RecNo >= 10 then
     begin
      if buscas.RecordCount > 10 then
	      vMensagem := vMensagem + #13 + '...';
     	break;
     end;

     buscas.Next;
   end;

   Application.MessageBox(Pchar('Documento(s) sem recebimento no dia do financeiro:' +
      #13 + #13 + vMensagem), 'Atenção',  MB_OK + MB_ICONINFORMATION);
 end;  

 buscas.close;
end;

function TLancamentos._abreDetalhesRecebimentosModalidade: Boolean;
var
  vValorLancamentos, vValorCheques, vValorCreditos, vValorCTP: Currency;
begin

  if Self = nil then
    Create;

{$REGION 'selects'}           
  buscas.Close;
  buscas.SQL.Text := ' select lanc.tipo_l, lanc.valor_l from lancamentos lanc' +
     ' where lanc.codigo_emp = ' + vDadosIni.codEmpresa +
     ' and lanc.cod_contrapartida = ' + IntToStr(dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger);
  buscas.Open;

  fLancamentos.Close;
  fLancamentos.SQL.Text :=
    ' select c.nome_ctrl "Controle",' +
    ' l.valor_l "Valor",' +
    ' l.data "Data Lançamento",' +
    ' l.historico_l "Histórico",' +
    ' l.vl_contabil "Valor Contábil",' +
    ' l.n_conta_plc "Nº Conta"' +
    ' from lancamentos l' +
    ' inner join controles ctr on ctr.codigo_ctrl = l.codigo_ctrl and ctr.codigo_emp = l.codigo_emp ' +
    ' inner join controles c on c.codigo_ctrl = l.codigo_ctrl and c.codigo_emp = l.codigo_emp' +
    ' where l.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and l.cod_contrapartida = ' + IntToStr(dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger) +
    vDadosIni.IfThen(buscas.FieldByName('TIPO_L').AsString = 'S', ' and l.tipo_l = ''S'' and c.docs = ''N'' ', ' and l.tipo_l = ''E'' ') +
    ' order by l.cod_lanc ';
  fLancamentos.Open;

  fCheques.Close;
  fCheques.SQL.Text :=
    'select c.nome_ctrl "Controle",' +
    ' cc.valor_ch "Valor",' +
    ' cc.nome_ch "Cliente",' +
    ' cc.status_ch "Status",' +
    ' cc.data_venc "Vencimento",' +
    ' cc.historico_ch "Histórico",' +
    ' cc.n_ch "Nº Cheque",' +
    ' cc.data_rec "Data Cadastro",' +
    ' cc.n_conta_plc "Nº Conta"' +
    ' from controle_cheque cc' +
    ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
    ' where c.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and cc.cod_contrapartida = ' + IntToStr(dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger) +
    ' order by cc.codigo_ch ';
  fCheques.Open;

  fCreditos.Close;
  fCreditos.SQL.Text :=
    ' select cc.COD_CRED "Codigo",' +
    ' c.NOME_CTRL "Controle",' +
    ' cc.VALOR_C "Valor",' +
    ' cc.NOME_C "Cliente",' +
    ' cc.status_c "Status",' +
    ' cc.DATA_VENC_C "Vencimento",' +
    ' cc.HISTORICO_C "Histórico",' +
    ' cc.N_DOC_C "Nº Documento",' +
    ' cc.DATA_REC_C "Data Cadastro",' +
    ' cc.TIPO_DOC_C "Tipo documento",' +
    ' cc.N_CONTA_PLC "Nº Conta"' +
    ' from controle_creditos cc ' +
    ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
    ' where c.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and cc.cod_contrapartida = ' + IntToStr(dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger) +
    //' and cc.status_c is null ' +
    ' union ' +
    ' select bc.SEQ_BXCRED "Codigo",' +
    ' c.NOME_CTRL "Controle",' +
    ' bc.VALOR_QUITADO "Valor",' +
    ' bc.NOME_C "Cliente",' +
    ' ''QUITADO'' "Status",' +
    ' bc.DATA_VENC_C "Vencimento",' +
    ' bc.HISTORICO_C "Histórico",' +
    ' bc.N_DOC_C "Nº Documento",' +
    ' bc.DATA_REC_C "Data Cadastro",' +
    ' bc.TIPO_DOC_C "Tipo documento",' +
    ' 0 "Nº Conta"' +
    ' from baixa_creditos bc ' +
    ' inner join controles c on c.codigo_ctrl = bc.codigo_ctrl and c.codigo_emp = bc.codigo_emp' +
    ' where c.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and bc.cod_contrapartida = ' + IntToStr(dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger) +
    ' and bc.tip_baixa =''P'' ' +
    ' order by 1 ';
  fCreditos.Open;

  fCTP.Close;
  fCTP.SQL.Text :=
    'select c.NOME_CTRL "Controle",' +
    ' ctp.COD_CONTRP "Código Conta",' +
    ' ctp.VALOR_CTP "Valor",' +
    ' ctp.VALOR_PAGO "Valor Pago",' +
    ' ctp.status_ctp "Status",' +
    ' ctp.HISTORICO_CTP "Histórico",' +
    ' ctp.N_DOC_CTP "Nº Documento",' +
    ' ctp.DTREFERENCIA "Referência",' +
    ' ctp.DATA_VENC_CTP "Vencimento",' +
    ' ctp.DATQ_CTP "Data Quitação",' +
    ' ctp.US_BX "Usuario que Quitou",' +
    ' ctp.TIPO_CTP "Tipo de conta",' +
    ' ctp.N_CONTA_PLC "Nº Conta",' +
    ' ctp.NOME_FOR_CTP "Fornecedor",' +
    ' ctp.NOMINAL_CTP "Cliente do Cheque" ' +
    ' from contas_a_Pagar ctp' +
    ' inner join controles c on ctp.codigo_ctrl = c.codigo_ctrl and ctp.codigo_emp = c.codigo_emp' +
    ' where ctp.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ctp.cod_contrapartida = ' + IntToStr(dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger) +
    ' order by ctp.cod_contrp ';
  fCTP.Open;

  TFloatField(fLancamentos.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(fCheques.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(fCreditos.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(fCTP.FieldByName('Valor')).DisplayFormat := '##0.00';

  vValorLancamentos := 0;
  fLancamentos.First;
  while not fLancamentos.Eof do
  begin
    vValorLancamentos := vValorLancamentos + fLancamentos.FieldByName('Valor').AsFloat;
    fLancamentos.Next;
  end;

  vValorCheques := 0;
  fCheques.First;
  while not fCheques.Eof do
  begin
    vValorCheques := vValorCheques + fCheques.FieldByName('Valor').AsFloat;
    fCheques.Next;
  end;

  vValorCreditos := 0;
  fCreditos.First;
  while not fCreditos.Eof do
  begin
    vValorCreditos := vValorCreditos + fCreditos.FieldByName('Valor').AsFloat;
    fCreditos.Next;
  end;

  vValorCTP := 0;
  fCTP.First;
  while not fCTP.Eof do
  begin
    vValorCTP := vValorCTP + fCTP.FieldByName('Valor').AsFloat;
    fCTP.Next;
  end;

  Application.CreateForm(TfrmDetalhesRecebimentoContrapartida, frmDetalhesRecebimentoContrapartida);
  frmDetalhesRecebimentoContrapartida.TabSheet1.TabVisible := false;
  frmDetalhesRecebimentoContrapartida.TabSheet2.TabVisible := false;

  if buscas.FieldByName('TIPO_L').AsString = 'S' then
	 frmDetalhesRecebimentoContrapartida.PageControl1.ActivePage := frmDetalhesRecebimentoContrapartida.TabSheet1
  else
    frmDetalhesRecebimentoContrapartida.PageControl1.ActivePage := frmDetalhesRecebimentoContrapartida.TabSheet2;
  frmDetalhesRecebimentoContrapartida.pnLanc.Caption := 'Total: ' + Format('%n', [vValorLancamentos]);
  frmDetalhesRecebimentoContrapartida.pnCh.Caption := 'Total: ' + Format('%n', [vValorCheques]);
  frmDetalhesRecebimentoContrapartida.pnCred.Caption := 'Total: ' + Format('%n', [vValorCreditos]);
  frmDetalhesRecebimentoContrapartida.pnCTP.Caption := 'Total: ' + Format('%n', [vValorCTP]);
  frmDetalhesRecebimentoContrapartida.pnContrapartida.Caption := Format('%n', [buscas.FieldByName('VALOR_L').AsFloat]);
  frmDetalhesRecebimentoContrapartida.Tag := dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger;
  frmDetalhesRecebimentoContrapartida.BitBtn13.Enabled := dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger > 0;

  frmDetalhesRecebimentoContrapartida.gridLancamento.DataSource := fDSLancamentos;
  frmDetalhesRecebimentoContrapartida.gridCheques.DataSource := fDSCheques;
  frmDetalhesRecebimentoContrapartida.gridCreditos.DataSource := fDSCreditos;
  frmDetalhesRecebimentoContrapartida.gridContasAPagar.DataSource := fDSCTP;

  frmDetalhesRecebimentoContrapartida.ShowModal;

{$ENDREGION}

  fLancamentos.Close;
  fCheques.Close;
  fCreditos.Close;
  fCTP.Close;
end;

function TLancamentos._abreFormTransferencia: Boolean;
var
  formulario: TfrmPadrao;
  buscas2: TIBQuery;
begin
  if not vDadosIni.PesqPros('LANC012', 'INCLUIR', '', 'LANCAMENTOS', '',
    buscas, True) then
    exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Transferência de Saldos entre Controles';
    frmLancamentos.pnTransf.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [];
    frmLancamentos.pnTransf.Visible := True;

    vTransf.valorTransferencia := 0;
    vTransf.historicoSaida := 'SAIDA PARA TRANSFERENCIA CONTROLE';
    vTransf.historicoEntrada := 'ENTRADA DE TRANSFERENCIA CONTROLE';

    formulario.OnShow := frmLancamentos.FormShowTransferencia;

    try
      buscas2 := TIBQuery(dtmLancamentos.qrBuscas2);
      dtmLancamentos.dsBuscas.DataSet := dtmLancamentos.qrBuscas;
      dtmLancamentos.dsBuscas2.DataSet := dtmLancamentos.qrBuscas2;

      frmLancamentos.DBGrid2.DataSource := dtmLancamentos.dsBuscas;
      frmLancamentos.DBGrid3.DataSource := dtmLancamentos.dsBuscas2;

      buscas.close;
      buscas2.Close;

      buscas.SQL.Text := 'select codigo_ctrl, nome_ctrl from controles' +
        ' where docs = ''N'' ' +
        ' and codigo_emp = ' + vdadosini.codempresa +
        ' and ativo = 1' +
        ' order by nome_ctrl';
      buscas2.SQL := buscas.SQL;
      buscas.Open;
      buscas2.Open;

      result := (formulario.ShowModal = IDOK);

    finally

      frmLancamentos.DBGrid2.DataSource := nil;
      frmLancamentos.DBGrid3.DataSource := nil;

      dtmLancamentos.dsBuscas.DataSet := nil;
      dtmLancamentos.dsBuscas2.DataSet := nil;
    end;

  finally
    frmLancamentos.pnTransf.Visible := False;
    frmLancamentos.pnTransf.Parent := frmLancamentos;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TLancamentos._calcularPrevisao;
var
  vValorAnterior, vValorEntradas, vValorSaidas, vValorPosterior,
    vValorDiferenca, vValorConferencia: Currency;
  vSomaCredCh: Currency;
begin
  vValorAnterior := 0;
  vValorEntradas := 0;
  vValorSaidas := 0;
  vValorPosterior := 0;
  vValorDiferenca := 0;
  vValorConferencia := 0;

  try
    // Cheques
    buscas.Close;
    buscas.SQL.Text := ' select sum(coalesce(cc.valor_ch, 0)) soma from controle_cheque cc ' +
      ' where cc.codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) +
      ' and cc.data_rec <= :data_rec ' +
      ' and (cc.datq_ch > :data_rec or (cc.status_ch = '''' or cc.status_ch is null)) ' +
      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa;

    if (vDadosIni.vEmp.vFinanceiroUnificado) then
    	 buscas.SQL.Text := buscas.SQL.Text + ' union ' +
       	' select sum(0 - coalesce(cc.valor_ch, 0)) soma from controle_cheque cc ' +
       	' inner join empresa emp on cc.codigo_emp = emp.cod_empresa ' +
        ' where cc.codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) +
        ' and (cc.datq_ch = :data_rec) ' +
        ' and emp.codigo_unificadora = ' + vDadosIni.codEmpresa +
        ' and cc.codigo_emp <> ' + vDadosIni.codEmpresa;

    buscas.ParamByName('data_rec').AsDate := vDadosIni.diaFFinanceiro + 1;
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
    vValorConferencia := vValorConferencia + buscas.FieldByName('soma').AsFloat;

      buscas.Next;
    end;

    // Creditos
    buscas.Close;
    buscas.SQL.Text := 'select sum(coalesce(cc.valor_c, 0) + coalesce((select sum(bx.valor_quitado) from baixa_creditos bx where bx.cod_cred = '+
      ' cc.cod_cred and bx.codigo_emp = cc.codigo_emp and bx.datq_c > :data_rec_c and bx.tp_operacao = ''P''),0)) '+
      ' soma from controle_creditos cc ' +
      ' where cc.codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) +
      ' and cc.data_rec_c <= :data_rec_c ' +
      ' and (cc.datq_c > :data_rec_c or (cc.status_c = '''' or cc.status_c is null)) ' +
      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa;
      
    if (vDadosIni.vEmp.vFinanceiroUnificado) then
      buscas.SQL.Text := buscas.SQL.Text + ' union ' +
    	 ' select sum(0 - (coalesce(cc.valor_c, 0) + coalesce((select sum(bx.valor_quitado) from baixa_creditos bx where bx.cod_cred = '+
       ' cc.cod_cred and bx.codigo_emp = cc.codigo_emp and bx.datq_c > :data_rec_c and bx.tp_operacao = ''P''),0))) soma from controle_creditos cc ' +
       ' inner join empresa emp on cc.codigo_emp = emp.cod_empresa ' +
       ' where cc.codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) +
       ' and (cc.datq_c = :data_rec_c) ' +
       ' and emp.codigo_unificadora = ' + vDadosIni.codEmpresa +
       ' and cc.codigo_emp <> ' + vDadosIni.codEmpresa;

    buscas.ParamByName('data_rec_c').AsDate := vDadosIni.diaFFinanceiro + 1;
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
    vValorConferencia := vValorConferencia + buscas.FieldByName('soma').AsFloat;

      buscas.Next;
    end;

//    buscas.close;
//    buscas.sql.text:='select sum(valor_quitado) soma from baixa_creditos where codigo_emp = '+vDadosIni.codEmpresa+
//    ' and datq_c > :data_rec_c ';
//    buscas.Open;

//    vValorConferencia := vValorConferencia + buscas.FieldByName('soma').AsFloat;

    // Lancamentos de Entrada
    buscas.Close;
    buscas.SQL.Text := 'select sum(valor_l) soma from lancamentos' +
      ' where codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) +
      ' and data <= :data and (status_l = '''' or status_l is null) and ' +
      ' tipo_l = ''E'' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('data').AsDate := vDadosIni.diaFFinanceiro + 1;
    buscas.Open;

    vValorEntradas := vValorEntradas + buscas.FieldByName('soma').AsFloat;

    // Lancamentos de Saida
    buscas.Close;
    buscas.SQL.Text := 'select sum(valor_l) soma from lancamentos' +
      ' where codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) +
      ' and data <= :data and (status_l = '''' or status_l is null) and ' +
      ' tipo_l = ''S'' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('data').AsDate := vDadosIni.diaFFinanceiro + 1;
    buscas.Open;

    vValorSaidas := vValorSaidas + buscas.FieldByName('soma').AsFloat;

    if (pos('DINHEIRO', vCtrl.dataSet.FieldByName('nome_ctrl').AsString) > 0) and
      (vDadosIni.vMostrarSaldoDinheiro <> 'S') then
    begin
      vValorAnterior := 0;
      vValorEntradas := 0;
      vValorSaidas := 0;
      vValorPosterior := 0;
      vValorDiferenca := 0;
      vValorConferencia := 0;
    end
    else
    begin
      vSaldoCtrl._abreSaldos(vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger, vDadosIni.diaFFinanceiro);
      vValorAnterior :=vSaldoCtrl.dataSet.FieldByName('VAL_SLD').AsCurrency;
      //vCtrl.dataSet.FieldByName('SALDO_AT_CTRL').AsFloat;
      vValorEntradas := vValorEntradas;
      vValorSaidas := vValorSaidas;
      vValorPosterior := vValorAnterior + vValorEntradas - vValorSaidas;
//      if vValorConferencia <> 0 then
      if Trim(vCtrl.dataSet.FieldByName('docs').AsString) <> 'N' then
        vValorDiferenca := vValorPosterior - vValorConferencia
      else
        vValorDiferenca := 0;
      vValorConferencia := vValorConferencia;
    end;

  finally
    vPrev.strValorAnterior := Format('%m', [vValorAnterior]);
    vPrev.strValorEntradas := Format('%m', [vValorEntradas]);
    vPrev.strValorSaidas := Format('%m', [vValorSaidas]);
    vPrev.strValorPosterior := Format('%m', [vValorPosterior]);
    vPrev.strValorDiferenca := Format('%m', [vValorDiferenca]);
    vdifcontrl := vValorDiferenca;
    vPrev.strValorConferencia := Format('%m', [vValorConferencia]);
  end;
end;

function TLancamentos._chequeJaUtilizado(pControle: Integer;
  pNumCheque: string): Boolean;
var
  vControle: Integer;
  vNumCheque: string;
begin
  Result := False;

  if pControle > 0 then
    vControle := pControle
  else if dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0 then
    vControle := dataSet.FieldByName('CODIGO_CTRL').AsInteger
  else
    vControle := 0;

  if Trim(pNumCheque) <> '' then
    vNumCheque := Trim(pNumCheque)
  else if Trim(dataSet.FieldByName('N_CHEQ_L').AsString) <> '' then
    vNumCheque := Trim(dataSet.FieldByName('N_CHEQ_L').AsString)
  else
    vNumCheque := '';

  buscas.Close;

  buscas.SQL.Text := 'select N_CHEQ_L from lancamentos' +
    ' where n_cheq_l = :n_cheq_l and codigo_ctrl = :codigo_ctrl and' +
    ' codigo_emp = :codigo_emp and cod_lanc <> :cod_lanc';
  buscas.ParamByName('n_cheq_l').AsString := vNumCheque;
  buscas.ParamByName('codigo_ctrl').AsInteger := vControle;
  buscas.ParamByName('codigo_emp').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.ParamByName('cod_lanc').AsInteger := dataSet.FieldByName('cod_lanc').AsInteger;
  buscas.Open;

  Result := not buscas.IsEmpty;

  buscas.Close;

end;

function TLancamentos._contaPossuiRateio(pNContaPlc: Double): Boolean;
var
  vNContaPlc: Double;
begin
  Result := False;
  if pNContaPlc > 0 then
    vNContaPlc := pNContaPlc
  else if dataSet.FieldByName('n_conta_plc').AsFloat > 0 then
    vNContaPlc := dataSet.FieldByName('n_conta_plc').AsFloat
  else
    vNContaPlc := 0;

  if vNContaPlc = 0 then
    Exit;

  buscas.Close;
  buscas.SQL.Text :=
    'SELECT COUNT(*) as conta FROM CONTAS_REL_ORIGEM WHERE N_CONTA_PLC_OR = :N_CONTA_PLC_OR';
  buscas.ParamByName('N_CONTA_PLC_OR').AsFloat := vNContaPlc;
  buscas.Open;

  Result := buscas.FieldByName('CONTA').AsInteger > 0;

  buscas.Close;
end;

function TLancamentos._dadosNContaPlcValidos(pNContaPlc: Double;
  pAbreHistPadrao: Boolean): Boolean;
begin
  Result := False;

  if pNContaPlc > 0 then
    rLanc.vNContaPlc := pNContaPlc
  else if dataSet.FieldByName('n_conta_plc').AsFloat > 0 then
    rLanc.vNContaPlc := dataSet.FieldByName('n_conta_plc').AsFloat
  else
    rLanc.vNContaPlc := 0;

  buscas.Close;
  buscas.SQL.Text := 'select gc.DESC_GR,dc.DESC_DEP, pc.TIPO_PLC, pc.TIPO_CTP from p_contas pc '+
  	 ' inner join grupos_ct gc on pc.grup_ct=gc.grup_ct inner join depart_ct dc on gc.cod_dep=dc.cod_dep ' +
    ' where pc.n_conta_plc=:Vncontaplc and pc.ativo=1';
  buscas.ParamByName('Vncontaplc').AsFloat := rLanc.vNContaPlc;
  buscas.Open;

  if buscas.FieldByName('TIPO_PLC').AsString = 'S' then
  	 rLanc.vDescTipoConta := 'Tipo de conta a pagar'
  else
    rLanc.vDescTipoConta := 'Tipo de entrada';
  rLanc.vTipoConta := vDadosIni.retornaDescricaoTipoNumConta(buscas.FieldByName('TIPO_PLC').AsString, buscas.fieldbyname('TIPO_CTP').AsString);

  if rLanc.vNContaPlc = 0 then
    Exit;

  if _contaPossuiRateio(rLanc.vNContaPlc) then
  begin
    Application.MessageBox('CONTA POSSUI RATEIO CONTA A CONTA. FAVOR UTILIZAR O CADASTRO DE CONTAS A PAGAR',
      'Atenção', 0 + 64);
    Exit;
  end;

  if dataSet.State in [dsInsert, dsEdit] then
  begin
    dataSet.FieldByName('TIPO_L').AsString := vPCont.dataSet.FieldByName('tipo_plc').AsString;
    if pAbreHistPadrao then
      if vHistPCont.abreEscolhaHistoricoPadrao(rLanc.vNContaPlc) then
        dataSet.FieldByName('HISTORICO_L').AsString := vDadosIni.vPesquisa;
  end;

  Result := True;

end;

function TLancamentos._dataAindaNaoProgramada(pData: TDate): Boolean;
begin
  Result := False;
  if pData > 0 then
    Result := pData > (vDadosIni.diaFFinanceiro + 1)
  else if not dataSet.FieldByName('DATA').IsNull then
    Result := dataSet.FieldByName('DATA').AsDateTime > (vDadosIni.diaFFinanceiro + 1);
end;

function TLancamentos._EmiteBoletim(vdata: Tdate; vsintetico,
  vagrup: boolean): boolean;
var
  vtttps, vtttpe, vforn, vres, vtott, vtotd, vtotat, vtotant: currency;
  vfl, l: integer;
  fonte: Tfonte;
  eu: string;
  vttlanc, vultvnd, vultmod, vttmod, vttvnd: string;
  vtote, vtots: currency;
begin
  vdatamovBol := vdata;
//  vDadosIni.definirDiaFinanceiroFechado(buscas);
//  if (vdatamovBol >  vDadosIni.diaFFinanceiro)

  if not vDadosIni.ModImp(Rdp) then
    exit;
  Rdp.FonteTamanhoPadrao := S17cpp;
  Rdp.TamanhoQteColunas := 132;
  Rdp.CaptionSetup := 'Configurações de Impressão';
  rdp.OpcoesPreview.CaptionPreview := 'Boletim de Caixa';
  rdp.TitulodoRelatorio := 'Boletim de Caixa';
  rdp.OpcoesPreview.Preview := true;
  rdp.OnSendMail :=nil;
  vDadosIni._LimparVarSendEmail;
  rdp.OnSendMail := vDadosini._SendMailRdPrint;//_rdBoletimSendMail;
  if not Rdp.EstaAberto then
    Rdp.Abrir;
  ln := 1;
  CabNovaPaginabol; //cabeçalho
  vtotant := 0.00;
  vtotat := 0.00;
  vtotd := 0.00;
  vtott := 0.00;
  vtote := 0.00;
  vtots := 0.00;
  l := 1;
  rdp.Imp(ln, 1, vDadosIni.replicate('-', 125));
  ln := ln + 1;
  rdp.Imp(ln, 1, '|');
  rdp.Imp(ln, 1, '                               HISTORICO');
  rdp.Imp(ln, 74, '|');
  rdp.Imp(ln, 75, 'SIG.DSP');
  rdp.Imp(ln, 84, '|');
  rdp.Imp(ln, 85, 'ENTRADA');
  rdp.Imp(ln, 105, '|');
  rdp.Imp(ln, 106, 'SAIDA');
  rdp.Imp(ln, 125, '|');
  ln := ln + 1;
  rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
  vCtrl._abreTodosControlesLanc(-1);
  Qrboletim.close;
  QrBoletim.sql.text := ' select p.n_conta_plc, l.historico_l, g.tipo_gr, l.datq_l, l.valor_l, p.sigla_plc, ' +
    ' l.tipo_l, l.Codigo_ctrl, l.cod_lanc, ct.nome_ctrl, l.lote, l.tp_mod, l.lanc_venda, ' +
    ' l.nmov, l.dtreferencia, l.cod_contrapartida from lancamentos l ' +
    ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
    ' inner join controles ct on l.codigo_ctrl = ct.codigo_ctrl and l.codigo_emp = ct.codigo_emp ' +
    ' inner join grupos_ct g on p.grup_ct = g.grup_ct  ' +
    ' where l.datq_l = :vdat ' +
    ' and ct.compsaldo = ''S'' ' +
    ' and l.codigo_emp = ' + vDadosIni.codEmpresa;
  if vagrup then
    QrBoletim.sql.text := QrBoletim.sql.text + 'order by  l.lanc_venda,l.cod_lanc '
  else
    QrBoletim.sql.Text := QrBoletim.sql.Text + ' order by  l.nmov,l.cod_lanc ';
  Qrboletim.ParamByName('vdat').AsDate := vdatamovBol;
  Qrboletim.open;
  QrSlctrl.close;
  QrSlCtrl.SQL.text := ' select c.nome_ctrl, s.data_sld, s.val_sld, s.vl_crd_sld, s.sobra_sld from sal_ctrl s ' +
    ' inner join controles c on s.codigo_ctrl = c.codigo_ctrl and s.cod_emp = c.codigo_emp ' +
    ' where data_sld = :vdat ' +
    ' and c.compsaldo = ''S'' ' +
    ' and c.codigo_Emp = ' + vDadosIni.codEmpresa +
    ' order by c.codigo_ctrl ';
  QrSlctrl.ParamByName('vdat').AsDate := vdatamovBol - 1;
  QrSlctrl.open;
  while not QrSlCtrl.EOF do
  begin
    if (QrSlCtrl.FieldByName('VL_CRD_SLD').isnull) or (QrSlCtrl.FieldByName('VL_CRD_SLD').AsCurrency = 0) then
      vtotant := vtotant + QrSlCtrl.FieldByName('VAL_SLD').value
    else
      vtotant := vtotant + QrSlCtrl.FieldByName('VL_CRD_SLD').AsCurrency;
    QrSlCtrl.next;
  end;
  QrSlctrl.close;
  QrSlctrl.ParamByName('vdat').AsDate := vdatamovBol;
  QrSlctrl.open;
  eu := QrSlCtrl.Text;
  while not QrSlCtrl.EOF do
  begin
    if (QrSlCtrl.FieldByName('VL_CRD_SLD').isnull) or (QrSlCtrl.FieldByName('VL_CRD_SLD').AsCurrency = 0) then
    begin
      vtott := vtott + QrSlCtrl.FieldByName('VAL_SLD').value;
    end
    else
      vtott := vtott + QrSlCtrl.FieldByName('VL_CRD_SLD').AsCurrency;
    QrSlCtrl.next;
  end;
  vtttps := 0;
  vtttpe := 0;
  vttvnd := QrBoletim.FieldByName('LANC_VENDA').AsString;
  vttmod := QrBoletim.FieldByName('TP_MOD').AsString;
  vttlanc := QrBoletim.FieldByName('NMOV').AsString;
  while not Qrboletim.EOF do
  begin
    vfl := 0;
    if vagrup then
      vfl := 0
    else
    begin
      if vsintetico then
      begin
        if (QrBoletim.FieldByName('TP_MOD').isnull) or (QrBoletim.FieldByName('TP_MOD').AsString = '') then
          vfl := 0
        else
          vfl := 1;
      end
      else
        vfl := 0;
    end;
    if vfl = 0 then
    begin
      ln := ln + 1;
      rdp.Imp(ln, 1, '|');
      if not QrBoletim.FieldByName('COD_CONTRAPARTIDA').IsNull then
        rdp.Imp(ln, 2, trim(copy(QrBoletim.FieldByName('HISTORICO_L').asstring,1,50)) + ' LC:' + QrBoletim.FieldByName('COD_CONTRAPARTIDA').asstring)
      else if not QrBoletim.FieldByName('LOTE').isnull then
        rdp.Imp(ln, 2, trim(copy(QrBoletim.FieldByName('HISTORICO_L').asstring,1,50)) + ' LP:' + QrBoletim.FieldByName('LOTE').asstring)
      else
      begin
        if (QrBoletim.FieldByName('TIPO_GR').value = 'S') and (QrBoletim.FieldByName('LOTE').isnull) then
         rdp.Imp(ln, 2, copy(trim(QrBoletim.FieldByName('HISTORICO_L').asstring),1,50)+' REF.:'+copy(QrBoletim.FieldByName('DTREFERENCIA').asstring,4,7))
        else
         rdp.Imp(ln, 2, trim(QrBoletim.FieldByName('HISTORICO_L').asstring));
      end;
      rdp.Imp(ln, 64, '|');
      rdp.Imp(ln, 65, copy(QrBoletim.FieldByName('NOME_CTRL').value, 1, 9));
      rdp.Imp(ln, 74, '|');
      if (QrBoletim.FieldByName('TIPO_GR').value = 'S') or (not QrBoletim.FieldByName('LOTE').isnull) then
      begin
        rdp.Imp(ln, 75, QrBoletim.FieldByName('SIGLA_PLC').asstring);
        vtotd := vtotd + QrBoletim.FieldByName('VALOR_L').value;
      end;
      rdp.Imp(ln, 84, '|');
      rdp.Imp(ln, 105, '|');
      if QrBoletim.FieldByName('TIPO_L').value = 'E' then
      begin
        if vCtrl.dataSet.locate('codigo_ctrl', QrBoletim.FieldByName('CODIGO_CTRL').AsInteger, []) then
          if (vCtrl.dataSet.FieldByName('COMPSALDO').asstring = 'S') then
          begin
            vtttpe := vtttpe + QrBoletim.FieldByName('VALOR_L').AsCurrency;
            vtote := vtote + QrBoletim.FieldByName('VALOR_L').AsCurrency;
          end;
        rdp.Imp(ln, 85, vDadosIni.alndir(format('%n', [QrBoletim.FieldByName('VALOR_L').AsCurrency]), 12));
      end
      else
      begin
        if vCtrl.dataSet.locate('codigo_ctrl', QrBoletim.FieldByName('CODIGO_CTRL').AsInteger, []) then
          if (vCtrl.dataSet.FieldByName('COMPSALDO').value = 'S') then
          begin
            vtots := vtots + QrBoletim.FieldByName('VALOR_L').AsCurrency;
            vtttps := vtttps + QrBoletim.FieldByName('VALOR_L').AsCurrency;
          end;
        rdp.Imp(ln, 106, vdadosini.alndir(format('%n', [QrBoletim.FieldByName('VALOR_L').AsCurrency]), 12));
      end;
      rdp.Imp(ln, 125, '|');
    end
    else
    begin
      if QrBoletim.FieldByName('TIPO_L').value = 'E' then
      begin
        if vCtrl.dataSet.locate('codigo_ctrl', QrBoletim.FieldByName('CODIGO_CTRL').AsInteger, []) then
          if (vCtrl.dataSet.FieldByName('COMPSALDO').value = 'S') then
          begin
            vtote := vtote + QrBoletim.FieldByName('VALOR_L').AsCurrency;
            vtttpe := vtttpe + QrBoletim.FieldByName('VALOR_L').AsCurrency;
          end;
      end
      else
      begin
        if vCtrl.dataSet.locate('codigo_ctrl', QrBoletim.FieldByName('CODIGO_CTRL').AsInteger, []) then
          if (vCtrl.dataSet.FieldByName('COMPSALDO').value = 'S') then
          begin
            vtots := vtots + QrBoletim.FieldByName('VALOR_L').AsCurrency;
            vtttps := vtttps + QrBoletim.FieldByName('VALOR_L').AsCurrency;
          end;
      end;
    end;
    vultvnd := QrBoletim.FieldByName('LANC_VENDA').AsString;
    vultmod := QrBoletim.FieldByName('TP_MOD').AsString;
    QrBoletim.next;
    // Testar se mudou a venda
    if vagrup then
    else
    begin
      if QrBoletim.eof then
      begin
        ln := ln + 1;
        rdp.Imp(ln, 1, '|');
        if vultmod = 'S' then
          rdp.Imp(ln, 2, '* * * TOTAL DOS LANCAMENTOS NAO MODIFICATIVOS * * *')
        else if vultvnd = 'S' then
          rdp.Imp(ln, 2, '* * * TOTAL DAS VENDAS * * *')
        else
          rdp.Imp(ln, 2, '* * * TOTAL DOS LANCAMENTOS * * *');
        rdp.Imp(ln, 64, '|');
        rdp.Imp(ln, 74, '|');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 85, vdadosini.alndir(format('%n', [vtttpe]), 12));
        rdp.Imp(ln, 106, vdadosini.alndir(format('%n', [vtttps]), 12));
        rdp.Imp(ln, 125, '|');
        ln := ln + 1;
        rdp.Imp(ln, 1, '|');
        rdp.Imp(ln, 64, '|');
        rdp.Imp(ln, 74, '|');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 125, '|');
        ln := ln + 1;
        vtttps := 0.00;
        vtttpe := 0.00;
        vttvnd := QrBoletim.FieldByName('LANC_VENDA').AsString;
        vttmod := QrBoletim.FieldByName('TP_MOD').AsString;
        vttlanc := QrBoletim.FieldByName('NMOV').AsString;
      end
      else
      begin
        if vttlanc <> QrBoletim.FieldByName('NMOV').AsString then
        begin
          ln := ln + 1;
          rdp.Imp(ln, 1, '|');
          if vttlanc = '1' then
            rdp.Imp(ln, 2, '* * * TOTAL DAS VENDAS * * *')
          else if vttlanc = '2' then
            rdp.Imp(ln, 2, '* * * TOTAL DOS LANCAMENTOS NAO MODIFICATIVOS * * *')
          else
            rdp.Imp(ln, 2, '* * * TOTAL DOS LANCAMENTOS * * *');
          rdp.Imp(ln, 64, '|');
          rdp.Imp(ln, 74, '|');
          rdp.Imp(ln, 84, '|');
          rdp.Imp(ln, 105, '|');
          rdp.Imp(ln, 85, vdadosini.alndir(format('%n', [vtttpe]), 12));
          rdp.Imp(ln, 106, vdadosini.alndir(format('%n', [vtttps]), 12));
          rdp.Imp(ln, 125, '|');
          ln := ln + 1;
          rdp.Imp(ln, 1, '|');
          rdp.Imp(ln, 64, '|');
          rdp.Imp(ln, 74, '|');
          rdp.Imp(ln, 84, '|');
          rdp.Imp(ln, 105, '|');
          rdp.Imp(ln, 125, '|');
          ln := ln + 1;
          vtttps := 0.00;
          vtttpe := 0.00;
          vttlanc := QrBoletim.FieldByName('NMOV').AsString;
          vttvnd := QrBoletim.FieldByName('LANC_VENDA').AsString;
          vttmod := QrBoletim.FieldByName('TP_MOD').AsString;
        end;
      end;
    end;
    if ln >= 58 then
    begin
      ln := 1;
      rdp.Novapagina;
      CabNovaPaginabol;
      rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
      ln := ln + 1;
      rdp.Imp(ln, 1, '|');
      rdp.Imp(ln, 1, '                               HISTORICO');
      rdp.Imp(ln, 74, '|');
      rdp.Imp(ln, 75, 'SIG.DSP');
      rdp.Imp(ln, 84, '|');
      rdp.Imp(ln, 85, 'ENTRADA');
      rdp.Imp(ln, 105, '|');
      rdp.Imp(ln, 106, 'SAIDA');
      rdp.Imp(ln, 125, '|');
      ln := ln + 1;
      rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
    end;
  end;
  ln := ln + 1;
  rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
  ln := ln + 1;
  rdp.Imp(ln, 1, 'COMPOSICAO SALDO DE CAIXA: ' + DateToStr(vdatamovBol));
  rdp.Imp(ln, 50, '| TL. DO DIA A TRANSPORTAR: ');
  rdp.Imp(ln, 84, '|');
  rdp.Imp(ln, 85, vdadosini.alndir(format('%n', [vtote]), 12));
  rdp.Imp(ln, 105, '|');
  rdp.Imp(ln, 106, vdadosini.alndir(format('%n', [vtots]), 12));
  rdp.Imp(ln, 125, '|');
  ln := ln + 1;
  rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
  QrSlCtrl.first;
  ln := ln + 1;
  rdp.Imp(ln, 9, 'CONTROLE');
  rdp.Imp(ln, 36, 'VALOR');
  rdp.Imp(ln, 50, '|');
  rdp.Imp(ln, 84, '|');
  rdp.Imp(ln, 105, '|');
  rdp.Imp(ln, 125, '|');
  while not QrSlCtrl.EOF do
  begin
    ln := ln + 1;
    rdp.Imp(ln, 1, QrSlCtrl.FieldByName('NOME_CTRL').value);
    rdp.Imp(ln, 29, ':');
    if (QrSlCtrl.FieldByName('VL_CRD_SLD').isnull) or (QrSlCtrl.FieldByName('VL_CRD_SLD').AsCurrency = 0) then
    begin
      rdp.Imp(ln, 34, vdadosini.alnDir(format('%n', [QrSlCtrl.FieldByName('VAL_SLD').AsCurrency]), 12));
      vtotat := vtotat + QrSlCtrl.FieldByName('VAL_SLD').AsCurrency;
    end
    else
    begin
      rdp.Imp(ln, 34, vdadosini.alnDir(format('%n', [QrSlCtrl.FieldByName('VAL_SLD').AsCurrency]), 12));
      vtotat := vtotat + QrSlCtrl.FieldByName('VL_CRD_SLD').AsCurrency;
    end;
    QrSlCtrl.next;
    if ln >= 58 then
    begin
      ln := 1;
      rdp.Novapagina;
      CabNovaPaginabol;
      rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
      ln := ln + 1;
      rdp.Imp(ln, 1, '|');
      rdp.Imp(ln, 1, '                               HISTORICO');
      rdp.Imp(ln, 74, '|');
      rdp.Imp(ln, 75, 'SIG.DSP');
      rdp.Imp(ln, 84, '|');
      rdp.Imp(ln, 85, 'ENTRADA');
      rdp.Imp(ln, 105, '|');
      rdp.Imp(ln, 106, 'SAIDA');
      rdp.Imp(ln, 125, '|');
      ln := ln + 1;
      rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
      ln := ln + 1;
    end;
    if not QrSlCtrl.EOF then
    begin
      rdp.Imp(ln, 50, '|');
      if l = 1 then
      begin
        rdp.Imp(ln, 62, 'SALDO ANTERIOR.:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [vtotant]), 12));
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 108, ' <---------');
        rdp.Imp(ln, 125, '|');
        l := l + 1;
      end
      else if l = 2 then
      begin
        rdp.Imp(ln, 62, 'SALDO ATUAL....:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 88, '---------->');
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 112, vdadosini.alndir(format('%n', [vtott]), 12));
        rdp.Imp(ln, 125, '|');
        l := l + 1;
      end
      else if l = 3 then
      begin
        rdp.Imp(ln, 62, 'SUBTOTAL......:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [vtotant + vtote]), 12));
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 112, vdadosini.alndir(format('%n', [vtott + vtots]), 12));
        rdp.Imp(ln, 125, '|');
        l := l + 1;
      end
      else if l = 4 then
      begin
        rdp.Imp(ln, 62, 'DIFERENCA.....:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 85, '+');
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 106, '-');
        rdp.Imp(ln, 125, '|');
        if ((vtotant + vtote) - (vtott + vtots)) < 0 then
          rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [abs(((vtotant + vtote) - (vtott + vtots)))]), 12))
        else
          rdp.Imp(ln, 112, vdadosini.alndir(format('%n', [((vtotant + vtote) - (vtott + vtots))]), 12));
        l := l + 1;
      end
      else if l = 5 then
      begin
        rdp.Imp(ln, 62, 'TOTAL.........:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 105, '=');
        //        rdp.Imp(ln,106,'-');
        rdp.Imp(ln, 125, '|');
        if ((vtotant + vtote) < (vtott + vtots)) then
        begin
          rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [((vtotant + vtote) + (vtott + vtots)) - (vtotant + vtote)]), 12));
          rdp.Imp(ln, 112, vdadosini.alndir(format('%n', [(vtott + vtots)]), 12));
        end
        else
        begin
          rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [(vtotant + vtote)]), 12));
          rdp.Imp(ln, 112, vdadosini.alndir(format('%n', [((vtotant + vtote) + (vtott + vtots)) - (vtott + vtots)]), 12));
        end;
        l := l + 1;
      end
      else if l = 6 then
      begin
        rdp.Imp(ln, 50, vdadosini.replicate('-', 76));
        l := 0;
      end;
    end
    else
    begin
      if l = 1 then
      begin
        rdp.Imp(ln, 50, '|');
        rdp.Imp(ln, 62, 'SALDO ANTERIOR.:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [vtotant]), 12));
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 108, ' <---------');
        rdp.Imp(ln, 125, '|');
        l := l + 1;
      end;
      if l = 2 then
      begin
        rdp.Imp(ln, 50, '|');
        rdp.Imp(ln, 62, 'SALDO ATUAL....:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 88, '---------->');
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 106, vdadosini.alndir(format('%n', [vtott]), 12));
        rdp.Imp(ln, 125, '|');
        l := l + 1;
      end;
      if l = 3 then
      begin
        rdp.Imp(ln, 50, '|');
        rdp.Imp(ln, 62, 'SUBTOTAL......:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [vtotant + vtote]), 12));
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 106, vdadosini.alndir(format('%n', [vtott + vtots]), 12));
        l := l + 1;
      end;
      if l = 4 then
      begin
        rdp.Imp(ln, 50, '|');
        rdp.Imp(ln, 62, 'DIFERENCA.....:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 85, '+');
        rdp.Imp(ln, 105, '|');
        rdp.Imp(ln, 106, '-');
        rdp.Imp(ln, 125, '|');
        if ((vtotant + vtote) - (vtott + vtots)) < 0 then
          rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [abs(((vtotant + vtote) - (vtott + vtots)))]), 12))
        else
          rdp.Imp(ln, 112, vdadosini.alndir(format('%n', [((vtotant + vtote) - (vtott + vtots))]), 12));
        l := l + 1;
      end;
      if l = 5 then
      begin
        rdp.Imp(ln, 50, '|');
        rdp.Imp(ln, 62, 'TOTAL.........:');
        rdp.Imp(ln, 84, '|');
        rdp.Imp(ln, 105, '=');
        rdp.Imp(ln, 106, '-');
        rdp.Imp(ln, 125, '|');
        if ((vtotant + vtote) < (vtott + vtots)) then
        begin
          rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [((vtotant + vtote) + (vtott + vtots)) - (vtotant + vtote)]), 12));
          rdp.Imp(ln, 112, vdadosini.alndir(format('%n', [(vtott + vtots)]), 12));
        end
        else
        begin
          rdp.Imp(ln, 87, vdadosini.alndir(format('%n', [(vtotant + vtote)]), 12));
          rdp.Imp(ln, 112, vdadosini.alndir(format('%n', [((vtotant + vtote) + (vtott + vtots)) - (vtott + vtots)]), 12));
        end;
        l := l + 1;
      end;
      if l = 6 then
        rdp.Imp(ln, 50, vdadosini.replicate('-', 76));
    end;
  end;
  ln := ln + 1;
  rdp.Imp(ln, 1, 'TOTAL GERAL................:');
  rdp.Imp(ln, 34, vdadosini.alndir(format('%n', [vtott]), 12));
  if ln >= 58 then
  begin
    ln := 1;
    rdp.Novapagina;
    CabNovaPaginabol;
    rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
    ln := ln + 1;
    rdp.Imp(ln, 1, '|');
    rdp.Imp(ln, 1, '                               HISTORICO');
    rdp.Imp(ln, 74, '|');
    rdp.Imp(ln, 75, 'SIG.DSP');
    rdp.Imp(ln, 84, '|');
    rdp.Imp(ln, 85, 'ENTRADA');
    rdp.Imp(ln, 105, '|');
    rdp.Imp(ln, 106, 'SAIDA');
    rdp.Imp(ln, 125, '|');
    ln := ln + 1;
    rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
  end;
  ln := ln + 1;
  rdp.Imp(ln, 50, '____________________________');
  rdp.Imp(ln, 89, '____________________________');
  ln := ln + 1;
  rdp.Imp(ln, 50, '          EMITENTE          ');
  rdp.Imp(ln, 89, '         CONFERENTE         ');
  ln := ln + 3;
  if ln >= 58 then
  begin
    ln := 1;
    rdp.Novapagina;
    CabNovaPaginabol;
    rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
    ln := ln + 1;
    rdp.Imp(ln, 1, '|');
    rdp.Imp(ln, 1, '                               HISTORICO');
    rdp.Imp(ln, 74, '|');
    rdp.Imp(ln, 75, 'SIG.DSP');
    rdp.Imp(ln, 84, '|');
    rdp.Imp(ln, 85, 'ENTRADA');
    rdp.Imp(ln, 105, '|');
    rdp.Imp(ln, 106, 'SAIDA');
    rdp.Imp(ln, 125, '|');
    ln := ln + 1;
    rdp.Imp(ln, 1, vdadosini.replicate('-', 125));
    ln := ln + 1;
  end;
  // rdp.Imp(ln,50,'TOTAL DESPESAS DO DIA: '+format('%m',[vtotd]));
  // parei
  QrResumo.close;
  vres := 0;
  QrResumo.sql.text := ' select sum(coalesce(l.valor_l, 0)) as total from lancamentos l ' +
    ' inner join controles ct on l.codigo_ctrl = ct.codigo_ctrl and l.codigo_emp = ct.codigo_emp ' +
    ' where l.datq_l = :vdat ' +
    ' and l.lanc_venda = ''S'' ' +
    ' and ct.compsaldo = ''S'' ' +
    ' and l.codigo_emp = ' + vDadosIni.codEmpresa;
  QrResumo.ParamByName('vdat').AsDate := vdatamovBol;
  QrResumo.open;
  vres := QrResumo.FieldByName('TOTAL').AsCurrency;
  rdp.Impf(ln, 1, 'VENDAS DO DIA(+).: ' + vdadosini.alndir(format('%n', [QrResumo.FieldByName('TOTAL').AsCurrency]), 12), [negrito]);
  ln := ln + 1;
  QrResumo.close;
  QrResumo.sql.text := ' select sum(coalesce(l.valor_l, 0)) as total from lancamentos l ' +
    ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
    ' inner join controles ct on l.codigo_ctrl = ct.codigo_ctrl and l.codigo_emp = ct.codigo_emp ' +
    ' inner join grupos_ct g on p.grup_ct = g.grup_ct ' +
    ' where l.datq_l = :vdat ' +
    ' and ct.compsaldo = ''S'' ' +
    ' and g.tipo_gr = ''S'' ' +
    ' and l.lote is null ' +
    ' and l.codigo_emp = ' + vDadosIni.codEmpresa;
  QrResumo.ParamByName('vdat').AsDate := vdatamovBol;
  QrResumo.open;
  vforn := QrResumo.FieldByName('total').AsCurrency;
  vres := vres - QrResumo.FieldByName('total').AsCurrency;
  QrResumo.close;
  QrResumo.sql.text := ' select sum(coalesce(ctr.valor_ctp, 0)) as total from contas_a_pagar ctr ' +
    ' inner join p_contas p on ctr.n_conta_plc = p.n_conta_plc ' +
    ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
    ' where ctr.datq_ctp = :vdat ' +
    ' and c.tipo_gr = ''S'' ' +
    ' and ctr.lote is not null ' +
    ' and ctr.codigo_emp = ' + vDadosIni.codEmpresa;
  QrResumo.ParamByName('vdat').AsDate := vdatamovBol;
  QrResumo.open;
  vforn := vforn + QrResumo.FieldByName('total').AsCurrency;
  rdp.Impf(ln, 1, 'PAG. DESPESAS(-).: ' + vdadosini.alndir(format('%n', [vforn]), 12), [negrito]);
  ln := ln + 1;
  vres := vres - QrResumo.FieldByName('total').AsCurrency;
  QrResumo.close;
  QrResumo.sql.text := ' select sum(coalesce(valor_ctp, 0)) as total from contas_a_pagar ' +
    ' where datq_ctp = :Vdat ' +
    ' and tipo_ctp = ''F'' ' +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  QrResumo.ParamByName('vdat').AsDate := vdatamovBol;
  QrResumo.open;
  rdp.Impf(ln, 1, 'PAG.FORNECEDOR(-): ' + vdadosini.alndir(format('%n', [QrResumo.FieldByName('total').AsCurrency]), 12), [negrito]);
  vres := vres - QrResumo.FieldByName('total').AsCurrency;
  ln := ln + 2;
  rdp.Impf(ln, 1, 'TOTAL............: ' + vdadosini.alndir(format('%n', [vres]), 12), [negrito]);
  rdp.Fechar;
//  vCtrl.close;
  Qrboletim.close;
  QrSlctrl.close;
  QrResumo.close;
end;

function TLancamentos._EmiteMapaDespRec(
	vdatini: Tdate;
  vdatfim: Tdate;
  vdetalhes: boolean;
  vexibirfornec: boolean;
  vtodascontas: boolean;
  vtipoMapa: string;
  vtpcxcomp: Boolean;
  pCodigoUnificada: Integer;
  AgruparEmpUnificada: string): boolean;
var
  ig, ix: integer;
  vgr, vdt1, vdt2: string;
  vtotdep, vtgG, vtg, vtotc, vtot, vtotgrupos: currency;
  vconta: real;
  vdep: real;
  vctrp, vlanc: currency;
  vano, vmes, vdia: word;
  buscasEmp: TIBQuery;
begin
  vtgG := 0.00;
  ln := 1;
  //    rdp.TamanhoQteLinhas := 66;
  //    rdp.PortaComunicacao := 'LPT1';

  buscasEmp := TIBQuery.Create(Application);
  buscasEmp.Database := buscas.Database;
  buscasEmp.Transaction := buscas.Transaction;

  buscasEmp.Close;
  buscasEmp.SQL.Text := ' select cod_empresa, identificacao_emp, cgc_emp from empresa ' +
    ' where ';
  if ((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0)) then
    buscasEmp.SQL.Text := buscasEmp.SQL.Text + ' cod_empresa = ' + vDadosIni.codEmpresa
  else if (pCodigoUnificada > 0) then
    buscasEmp.SQL.Text := buscasEmp.SQL.Text + ' cod_empresa = ' + IntToStr(pCodigoUnificada)
  else
    buscasEmp.SQL.Text := buscasEmp.SQL.Text + ' financeiro_unificado = ''S'' ' +
     ' and codigo_unificadora = ' + vDadosIni.codEmpresa;
  buscasEmp.Open;
  buscasEmp.FetchAll;

  Rdp.FonteTamanhoPadrao := S12cpp;
  if (vdetalhes) and (vexibirfornec) then
  	Rdp.TamanhoQteColunas := 100
  else
  	Rdp.TamanhoQteColunas := 80;
  Rdp.CaptionSetup := 'Configurações de Impressão';
  rdp.OpcoesPreview.CaptionPreview := 'Mapa de Despesas por período';
  rdp.TitulodoRelatorio := 'Mapa de Despesas por periodo';
  rdp.OpcoesPreview.Preview := true;
  rdp.OnSendMail :=nil;
  vDadosIni._LimparVarSendEmail;
  rdp.OnSendMail := vDadosini._SendMailRdPrint;// _rdMapaDespesaSendMail;
  if not Rdp.EstaAberto then
    Rdp.Abrir;
  CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
  qrresumo.close;
  qrresumo.Sql.clear;
  //copy(maskedit2.text, 4, 3) + copy(maskedit2.text, 1, 3) + copy(maskedit2.text, 7, 4);
  buscasEmp.First;
  while not buscasEmp.Eof do
  begin
    if ln >= 58 then
    begin
      ln := 1;
      rdp.Novapagina;
      CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
    end
    else if ((AgruparEmpUnificada <> 'S') and (pCodigoUnificada <= 0)) then
    begin
	    if buscasEmp.RecNo > 1 then
  	  	ln := ln + 2;
    end;

  vdt1 := FormatDateTime('mm/dd/yyyy', vdatini);
  vdt2 := FormatDateTime('mm/dd/yyyy', vdatfim);

    if ((AgruparEmpUnificada <> 'S') and (pCodigoUnificada <= 0)) then
    begin
      Rdp.ImpF(ln, 1, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger) +
        ' ' + trim(buscasEmp.FieldByName('IDENTIFICACAO_EMP').AsString) +
        ' - ' + trim(buscasEmp.FieldByName('CGC_EMP').AsString), [normal, negrito]);
      ln := ln + 2;
    end;

  if vtodascontas then
  begin
    qrresumo.sql.text := ' select p.n_conta_plc, p.desc_plc, c.desc_gr, c.tipo_gr, p.grup_ct, c.cod_dep from p_contas p ' +
      ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' where c.tipo_gr = ''S'' ' +
      ' and p.ativo = 1 ' +
      ' order by c.cod_dep, p.grup_ct, p.n_conta_plc ';
    qrresumo.open;
    //Despesas lançadas diretamente na tabela lançamentos...
    QrSlCtrl.close;
    if vtpcxcomp then
     QrSlCtrl.sql.text := ' select l.n_conta_plc, l.valor_l, l.historico_l, l.data, l.cod_lanc from Lancamentos l ' +
       ' where l.datq_l >= :vdat1 ' +
       ' and l.datq_l <= :vdat2 ' +
       ' and l.n_conta_plc = :vconta ' +
       ' and l.lote is null ' +
       ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
        vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger))
    else
     QrSlCtrl.sql.text := ' select l.n_conta_plc, l.valor_l, l.historico_l, l.data, l.cod_lanc from Lancamentos l ' +
       ' where l.dtreferencia >= :vdat1 ' +
       ' and l.dtreferencia <= :vdat2 ' +
       ' and l.n_conta_plc = :vconta ' +
       ' and l.lote is null ' +
       ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
        vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger));

    //Despesas lançadas no contas a pagar...
    qrboletim.close;
    if vtpcxcomp then
     qrboletim.sql.text := ' select ctr.n_conta_plc, ctr.valor_ctp, ctr.historico_ctp, ' +
       ' ctr.datq_ctp, ctr.cod_contrp, ctr.valor_pago, ctr.nome_for_ctp from contas_a_pagar ctr ' +
       ' where ctr.datq_ctp >= :vdat1 ' +
       ' and ctr.datq_ctp <= :vdat2 ' +
       ' and ctr.n_conta_plc = :vconta ' +
       ' and ctr.lote is not null ' +
       ' and ctr.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
        vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger))
    else
     qrboletim.sql.text := ' select ctr.n_conta_plc, ctr.valor_ctp, ctr.historico_ctp, ' +
       ' ctr.datq_ctp, ctr.cod_contrp, ctr.valor_pago, ctr.nome_for_ctp from contas_a_pagar ctr ' +
       ' where ctr.dtreferencia >= :vdat1 ' +
       ' and ctr.dtreferencia <= :vdat2 ' +
       ' and ctr.n_conta_plc = :vconta ' +
       ' and ctr.lote is not null ' +
       ' and ctr.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
        vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger));

    vgr := trim(qrresumo.FieldByName('desc_gr').AsString);
    vdep := qrresumo.FieldByName('cod_dep').Value;
    Buscas.close;
    buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
    buscas.Open;
    rdp.Imp(ln, 1, 'DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
    ln := ln + 1;
    vtotdep := 0;
    vtotc := 0.00;
    vtot := 0.00;
      vtotgrupos := 0.00;
    vconta := 0;
    ig := 1;
    while not qrresumo.EOF do
    begin
      //       if qrresumo.fields[0].value <> vconta then
      //       begin
      ln := ln + 1;
      vtotc := 0.00;
      rdp.Imp(ln, 1, qrresumo.FieldByName('n_conta_plc').Value);
      rdp.Imp(ln, 12, qrresumo.FieldByName('desc_plc').Value);
      rdp.Imp(ln, 60, trim(qrresumo.FieldByName('desc_gr').value));
      vctrp := 0;
      vlanc := 0;
      QrSlCtrl.close;
      QrSlCtrl.ParamByName('vdat1').AsDate := vdatini;
      QrSlCtrl.ParamByName('vdat2').AsDate := vdatfim;
      QrSlCtrl.ParamByName('vconta').AsFloat := qrresumo.FieldByName('n_conta_plc').AsFloat;
      QrSlCtrl.open;
      qrboletim.close;
      qrboletim.ParamByName('vdat1').AsDate := vdatini;
      qrboletim.ParamByName('vdat2').AsDate := vdatfim;
      qrboletim.ParamByName('vconta').AsFloat := qrresumo.FieldByName('n_conta_plc').AsFloat;
      qrboletim.open;
      while not QrSlCtrl.eof do
      begin
        if vdetalhes then
        begin
          ln := ln + 1;
          rdp.Imp(ln, 3, QrSlCtrl.FieldByName('DATA').asstring);
          rdp.Impf(ln, 14, copy(QrSlCtrl.FieldByName('HISTORICO_L').asstring, 1, 50), [comp17]);
          rdp.Imp(ln, 45, vDadosIni.alndir(format('%n', [QrSlCtrl.FieldByName('VALOR_L').AsCurrency]), 12));
        end;
        vlanc := vlanc + QrSlCtrl.FieldByName('VALOR_L').AsCurrency;
        QrSlCtrl.next;
        if ln >= 58 then
        begin
          ln := 1;
          rdp.Novapagina;
            CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
        end;
      end;
      while not qrboletim.eof do
      begin
        if vdetalhes then
        begin
          ln := ln + 1;
          rdp.Imp(ln, 3, qrboletim.FieldByName('DATQ_CTP').asstring);
          rdp.Impf(ln, 14, copy(qrboletim.FieldByName('HISTORICO_CTP').asstring, 1, 50), [comp17]);
          rdp.Imp(ln, 45, vdadosini.alndir(format('%n', [qrboletim.FieldByName('VALOR_PAGO').AsCurrency]), 12));

        	if vexibirfornec then
          	rdp.Impf(ln, 62, copy(qrboletim.FieldByName('NOME_FOR_CTP').asstring, 1, 35), [comp17]);
        end;
        vlanc := vlanc + qrboletim.FieldByName('VALOR_PAGO').AsCurrency;
        qrboletim.next;
        if ln >= 58 then
        begin
          ln := 1;
          rdp.Novapagina;
            CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
        end;
      end;

      vtotc := vtotc + (vlanc + vctrp);
      vconta := qrresumo.FieldByName('n_conta_plc').AsFloat;
      if vdetalhes then
        ln := ln + 1;
      //       end
      vtot := vtot + (vlanc + vctrp);
        vtotgrupos := vtotgrupos + (vlanc + vctrp);
      vtotdep := vtotdep + (vlanc + vctrp);
      qrresumo.next;
      if qrresumo.EOF then
        rdp.Imp(ln, 45, vdadosini.alndir(format('%n', [vtotc]), 12))
      else
      begin
        if qrresumo.FieldByName('n_conta_plc').AsFloat <> vconta then
        begin
          rdp.Imp(ln, 45, vdadosini.Alndir(format('%n', [vtotc]), 12));
        end;
      end;
      if ln >= 58 then
      begin
        ln := 1;
        rdp.Novapagina;
          CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
      end;
      if (vdep <> qrresumo.FieldByName('cod_dep').value) or (qrresumo.EOF) then
      begin
        ln := ln + 1;
        rdp.FonteEstiloPadrao := [Snegrito];
        rdp.Imp(ln, 1, 'TOTAL DO DEP....:');
        rdp.Imp(ln, 45, vdadosini.Alndir(format('%n', [vtotdep]), 12));
        rdp.FonteEstiloPadrao := [];
        vtotdep := 0.00;
        if not qrresumo.EOF then
        begin
            ln := ln + 2;
          vdep := qrresumo.FieldByName('cod_dep').value;
          Buscas.close;
          buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
          buscas.Open;
          rdp.Imp(ln, 1, 'DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
        end;
        ln := ln + 1;
      end;
        if (trim(vgr) <> trim(qrresumo.FieldByName('desc_gr').Value)) or (qrresumo.EOF) then
        begin
          ln := ln + 1;
          rdp.FonteEstiloPadrao := [Snegrito];
          rdp.Imp(ln, 1, 'TOTAL DO GRUPO....:');
          rdp.Imp(ln, 45, vdadosini.Alndir(format('%n', [vtot]), 12));
          rdp.FonteEstiloPadrao := [];
          ln := ln + 1;
          vtot := 0.00;
          vgr := trim(qrresumo.FieldByName('desc_gr').AsString);
        end;
      if ln >= 58 then
      begin
        ln := 1;
        rdp.Novapagina;
          CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
      end;
    end;
    //
    QrSlCtrl.close;
    qrboletim.close;
  end
  else
  begin
    ln := ln + 1;
    if vtipoMapa = 'DESPESAS' then
    begin
      if vtpcxcomp then
       qrresumo.sql.text := ' select l.n_conta_plc, p.desc_plc, l.valor_l, c.desc_gr, c.tipo_gr, ' +
          ' l.historico_l, l.data, p.grup_ct, l.cod_lanc, c.cod_dep, null nome_for_l from Lancamentos l ' +
          ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
          ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
          ' where l.datq_l >= ' + QuotedStr(vdt1) +
          ' and l.datq_l <= ' + QuotedStr(vdt2) +
          ' and c.tipo_gr = ''S'' ' +
          ' and l.lote is null ' +
          ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
           vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger))
      else
       qrresumo.sql.text := ' select l.n_conta_plc, p.desc_plc, l.valor_l, c.desc_gr, c.tipo_gr, ' +
          ' l.historico_l, l.data, p.grup_ct, l.cod_lanc, c.cod_dep, null nome_for_l from Lancamentos l ' +
          ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
          ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
          ' where l.dtreferencia >= ' + QuotedStr(vdt1) +
          ' and l.dtreferencia <= ' + QuotedStr(vdt2) +
          ' and c.tipo_gr = ''S'' ' +
          ' and l.lote is null ' +
          ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
           vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger));

      // uniao com contas a pagar para olhar contas de lote
      if vtpcxcomp then
       qrresumo.sql.text := qrresumo.sql.text + ' union ' +
       	 ' select ctr.n_conta_plc, p.desc_plc,' +
         ' ctr.valor_pago, c.desc_gr, c.tipo_gr, ctr.historico_ctp, ' +
         ' ctr.datq_ctp, p.grup_ct, ctr.cod_contrp, c.cod_dep, ctr.nome_for_ctp as nome_for_l from contas_a_pagar ctr ' +
         ' inner join p_contas p on ctr.n_conta_plc = p.n_conta_plc ' +
         ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
         ' where ctr.datq_ctp >= ' + QuotedStr(vdt1) +
         ' and ctr.datq_ctp <= ' + QuotedStr(vdt2) +
         ' and c.tipo_gr = ''S'' ' +
         ' and ctr.lote is not null ' +
         ' and ctr.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
          vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
         ' order by 10, 8, 1 '
      else
        qrresumo.sql.text := qrresumo.sql.text + ' union ' +
         ' select ctr.n_conta_plc, p.desc_plc,' +
         ' ctr.valor_pago, c.desc_gr, c.tipo_gr, ctr.historico_ctp,' +
         ' ctr.datq_ctp, p.grup_ct, ctr.cod_contrp, c.cod_dep, ctr.nome_for_ctp as nome_for_l from contas_a_pagar ctr ' +
         ' inner join p_contas p on ctr.n_conta_plc = p.n_conta_plc ' +
         ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
         ' where ctr.dtreferencia >= ' + QuotedStr(vdt1) +
         ' and ctr.dtreferencia <= ' + QuotedStr(vdt2) +
         ' and c.tipo_gr = ''S'' ' +
         ' and ctr.lote is not null ' +
         ' and ctr.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
          vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
         ' order by 10, 8, 1 ';
    end
    else
      qrresumo.sql.text := ' select l.n_conta_plc, p.desc_plc, l.valor_l, c.desc_gr, c.tipo_gr, ' +
         ' l.historico_l, l.data, p.grup_ct, l.cod_lanc, c.cod_dep, null nome_for_l from Lancamentos l ' +
         ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
         ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
         ' where l.datq_l >= ' + QuotedStr(vdt1) +
         ' and l.datq_l <= ' + QuotedStr(vdt2) +
         ' and c.tipo_gr = ''E'' ' +
         ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
          vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
         ' order by c.cod_dep, p.grup_ct, l.n_conta_plc ';
    qrresumo.open;
    qrresumo.first;
    vgr := trim(qrresumo.FieldByName('desc_gr').AsString);
    vdep := qrresumo.FieldByName('cod_dep').asfloat;
    Buscas.close;
    buscas.sql.text := 'select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
    buscas.Open;
    rdp.Imp(ln, 1, 'DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
    ln := ln + 1;
    vtotdep := 0;
    vtotc := 0.00;
    vtot := 0.00;
      vtotgrupos := 0.00;
    vconta := 0;
    ig := 1;
    while not qrresumo.EOF do
    begin
      if qrresumo.FieldByName('n_conta_plc').AsFloat <> vconta then
      begin
        ln := ln + 1;
        vtotc := 0.00;
        rdp.Imp(ln, 1, qrresumo.FieldByName('n_conta_plc').value);
        rdp.Imp(ln, 12, trim(qrresumo.FieldByName('desc_plc').value));
        rdp.Imp(ln, 60, trim(qrresumo.FieldByName('desc_gr').value));
        vtotc := vtotc + qrresumo.FieldByName('valor_l').AsCurrency;
        vconta := qrresumo.FieldByName('n_conta_plc').AsFloat;
        if vdetalhes then
          ln := ln + 1;
      end
      else
        vtotc := vtotc + qrresumo.FieldByName('valor_l').AsCurrency;
      if ln >= 58 then
      begin
        ln := 1;
        rdp.Novapagina;
          CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
      end;
      if vdetalhes then
      begin
        rdp.Imp(ln, 3, qrresumo.FieldByName('data').value);
        rdp.Impf(ln, 14, copy(qrresumo.FieldByName('historico_l').asstring, 1, 50), [comp17]);
        rdp.Imp(ln, 45, vdadosini.alndir(format('%n', [qrresumo.FieldByName('valor_l').AsCurrency]), 12));

        if vexibirfornec then
        	rdp.Impf(ln, 62, copy(qrresumo.FieldByName('nome_for_l').asstring, 1, 35), [comp17]);
        ln := ln + 1;
      end;

      vtot := vtot + qrresumo.FieldByName('valor_l').AsCurrency;
      vtotgrupos := vtotgrupos + QrResumo.FieldByName('valor_l').AsCurrency;
      vtotdep := vtotdep + qrresumo.FieldByName('valor_l').AsCurrency;
      qrresumo.next;
      if qrresumo.EOF then
        rdp.Imp(ln, 45, vDadosIni.alndir(format('%n', [vtotc]), 12))
      else
      begin
        if qrresumo.FieldByName('n_conta_plc').AsFloat <> vconta then
        begin
          rdp.Imp(ln, 45, vDadosIni.Alndir(format('%n', [vtotc]), 12));
        end;
      end;
      if ln >= 58 then
      begin
        ln := 1;
        rdp.Novapagina;
          CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
      end;
      if (vdep <> qrresumo.FieldByName('cod_dep').value) or (qrresumo.EOF) then
      begin
        ln := ln + 1;
        rdp.FonteEstiloPadrao := [Snegrito];
        rdp.Imp(ln, 1, 'TOTAL DO DEP....:');
        rdp.Imp(ln, 45, vDadosIni.Alndir(format('%n', [vtotdep]), 12));
        rdp.FonteEstiloPadrao := [];
        vtotdep := 0.00;
        if not qrresumo.EOF then
        begin
            ln := ln + 2;
          vdep := qrresumo.FieldByName('cod_dep').value;
          Buscas.close;
          buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
          buscas.Open;
          rdp.Imp(ln, 1, 'DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
        end;
        ln := ln + 1;
      end;

      if (trim(vgr) <> trim(qrresumo.FieldByName('desc_gr').value)) or (qrresumo.EOF) then
      begin
        ln := ln + 1;
        rdp.FonteEstiloPadrao := [Snegrito];
        rdp.Imp(ln, 1, 'TOTAL DO GRUPO....:');
        rdp.Imp(ln, 45, vDadosIni.Alndir(format('%n', [vtot]), 12));
        rdp.FonteEstiloPadrao := [];
        ln := ln + 1;
        vtot := 0.00;
        vgr := qrresumo.fields[3].value;
      end;

      if ln >= 58 then
      begin
        ln := 1;
        rdp.Novapagina;
          CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
      end;
    end;
  end;

  if ln >= 58 then
  begin
    ln := 1;
    rdp.Novapagina;
    CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
  end;

  ln := ln + 1;
  rdp.FonteEstiloPadrao := [Snegrito];
  rdp.Imp(ln, 1, 'TOTAL DOS GRUPOS....:');
  rdp.Imp(ln, 45, vDadosIni.Alndir(format('%n', [vtotgrupos]), 12));

  ln := ln + 3;
  qrresumo.close;
  qrresumo.Sql.Clear;

  if vtipoMapa = 'DESPESAS' then
  begin
    if vtpcxcomp then
    	qrresumo.sql.text := ' select cod_dep, cd_grupo, desc_grupo, sum(coalesce(valor_lanc, 0)) valor_lanc from despmes ' +
        ' where data_lanc >= ' + QuotedStr(vdt1) +
        ' and data_lanc <= ' + QuotedStr(vdt2) +
        ' and ' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
         vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
        ' group by cod_dep, cd_grupo, desc_grupo '
    else
      qrresumo.sql.text := ' select cod_dep, cd_grupo, desc_grupo, sum(coalesce(valor_lanc, 0)) valor_lanc from despmes ' +
        ' where dtreferencia >= ' + QuotedStr(vdt1) +
        ' and dtreferencia <= ' + QuotedStr(vdt2) +
        ' and ' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
         vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
        ' group by cod_dep, cd_grupo, desc_grupo ';
  end
  else
  begin
    qrresumo.sql.text := ' select cod_dep, c.grup_ct as cd_grupo, c.desc_gr as desc_grupo, sum(coalesce(l.valor_l, 0)) valor_lanc from Lancamentos l ' +
      ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
      ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' where datq_l >= ' + QuotedStr(vdt1) +
      ' and datq_l <= ' + QuotedStr(vdt2) +
      ' and c.tipo_gr = ''E'' ' +
      ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
       vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
      ' group by cod_dep, c.grup_ct, c.desc_gr ';
  end;
  qrresumo.open;
  qrresumo.first;
  if ln >= 60 then
  begin
    ln := 1;
    rdp.Novapagina;
      CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
  end;
  ln := ln + 1;
  rdp.Imp(ln, 1, 'TOTALIZAÇAO DOS GRUPOS POR DEPTO');
  ln := ln + 1;
  if ln >= 60 then
  begin
    ln := 1;
    rdp.Novapagina;
      CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
  end;
  rdp.Imp(ln, 1, 'GRUPO');
  rdp.Imp(ln, 22, 'VALOR');
  ln := ln + 1;
  if ln >= 60 then
  begin
    ln := 1;
    rdp.Novapagina;
      CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
  end;
  vtg := 0.00;
  rdp.Imp(ln, 1, '-------------------');
  rdp.Imp(ln, 22, '---------------');
  ln := ln + 1;
  if not qrresumo.isempty then
  begin
    vdep := qrresumo.FieldByName('cod_dep').value;
    Buscas.close;
    buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
    buscas.Open;
    rdp.Imp(ln, 1, '* * * DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
  end;
  while not qrresumo.EOF do
  begin
    ln := ln + 1;
    rdp.Imp(ln, 1, trim(qrresumo.FieldByName('desc_grupo').Value));
    rdp.Imp(ln, 22, vDadosIni.Alndir(format('%n', [qrresumo.FieldByName('valor_lanc').AsCurrency]), 12));
    vtg := vtg + qrresumo.FieldByName('valor_lanc').AsCurrency;
    qrresumo.next;
    if (qrresumo.FieldByName('cod_dep').value <> vdep) then
    begin
      ln := ln + 2;
      vdep := qrresumo.FieldByName('cod_dep').value;
      Buscas.close;
      buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
      buscas.Open;
      rdp.Imp(ln, 1, '* * * DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
    end;
    if ln >= 60 then
    begin
      ln := 1;
      rdp.Novapagina;
        CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
    end;
  end;
  ln := ln + 1;
  rdp.Imp(ln, 22, '---------------');
  ln := ln + 1;
  rdp.Imp(ln, 22, vDadosIni.Alndir(format('%n', [vtg]), 12));
  ln := ln + 2;
  rdp.Imp(ln, 1, 'PERC. DO RATEIO POR DEPTO NAS DESPESAS ADMINISTRATIVAS');
  ln := ln + 1;
  rdp.Imp(ln, 1, 'DEPTO');
  rdp.Imp(ln, 27, 'PART(%)');
  ln := ln + 1;
  buscas.Close;
  buscas.Open;
  while not buscas.Eof do
  begin
    if trim(buscas.FieldByName('TP_DEP').AsString) = 'I' then
    begin
      rdp.Imp(ln, 1, trim(buscas.FieldByName('DESC_DEP').value));
      rdp.Imp(ln, 22, vDadosIni.Alndir(format('%n', [buscas.FieldByName('PERC_DEP').AsCurrency]), 12));
      ln := ln + 1;
      if ln >= 60 then
      begin
        ln := 1;
        rdp.Novapagina;
          CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
      end;
    end;
    buscas.Next;
  end;
  // Reinvestimentos
  qrresumo.close;
  qrresumo.sql.text := ' select cod_dep, c.grup_ct, c.desc_gr, sum(coalesce(l.valor_l, 0)) valor_l from Lancamentos l ' +
    ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
    ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
    ' where datq_l >= ' +  QuotedStr(vdt1) +
    ' and datq_l <= ' + QuotedStr(vdt2) +
    ' and c.desc_gr like ''%INVEST%'' ' +
    ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
     vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
    ' group by cod_dep, c.grup_ct, c.desc_gr ';
  qrresumo.open;
  ln := ln + 1;
  rdp.Imp(ln, 1, 'INVESTIMENTOS EFETUADOS NA EMPRESA POR DEPART');
  ln := ln + 2;
  rdp.Imp(ln, 1, 'GRUPO');
  rdp.Imp(ln, 22, 'VALOR');
  ln := ln + 1;
  if ln >= 60 then
  begin
    ln := 1;
    rdp.Novapagina;
      CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
  end;
  vtg := 0.00;
  rdp.Imp(ln, 1, '-------------------');
  rdp.Imp(ln, 22, '---------------');
  ln := ln + 1;
  if not qrresumo.isempty then
  begin
    vdep := qrresumo.FieldByName('cod_dep').value;
    Buscas.close;
    buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
    buscas.Open;
    rdp.Imp(ln, 1, '* * * DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
  end;
  while not qrresumo.EOF do
  begin
    ln := ln + 1;
    rdp.Imp(ln, 1, trim(qrresumo.FieldByName('desc_gr').value));
    rdp.Imp(ln, 22, vDadosIni.Alndir(format('%n', [qrresumo.FieldByName('valor_l').AsCurrency]), 12));
    vtg := vtg + qrresumo.FieldByName('valor_l').AsCurrency;
    qrresumo.next;
    if (qrresumo.FieldByName('cod_dep').value <> vdep) then
    begin
      ln := ln + 2;
      vdep := qrresumo.FieldByName('cod_dep').value;
      Buscas.close;
      buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
      buscas.Open;
      rdp.Imp(ln, 1, '* * * DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
    end;
    if ln >= 60 then
    begin
      ln := 1;
      rdp.Novapagina;
        CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
    end;
  end;
  ln := ln + 1;
  rdp.Imp(ln, 22, '---------------');
  ln := ln + 1;
  rdp.Imp(ln, 22, vDadosIni.Alndir(format('%n', [vtg]), 12));
  //
  ln := ln + 2;
  rdp.Imp(ln, 1, 'ACUMULADO PERÍODO ' + '01/' + copy(DateToStr(vdatini), 4, 3) + copy(DateToStr(vdatini), 7, 4) + ' A ' + DateToStr(vdatfim));
  //
  vdt1 := copy(DateToStr(vdatini), 4, 3) + '01/' + copy(DateToStr(vdatini), 7, 4);
  //
  if vtipoMapa = 'DESPESAS' then
  begin
  	if vtpcxcomp then
    	qrresumo.sql.text := ' select l.n_conta_plc, p.desc_plc, l.valor_l, c.desc_gr, c.tipo_gr, ' +
        ' l.historico_l, l.data, p.grup_ct, l.cod_lanc, c.cod_dep from Lancamentos l ' +
        ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
        ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
        ' where l.datq_l >= ' + QuotedStr(vdt1) +
        ' and l.datq_l <= ' + QuotedStr(vdt2) +
        ' and c.tipo_gr = ''S'' ' +
        ' and l.lote is null ' +
        ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
         vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger))
    else
      qrresumo.sql.text := ' select l.n_conta_plc, p.desc_plc, l.valor_l, c.desc_gr, c.tipo_gr, ' +
        ' l.historico_l, l.data, p.grup_ct, l.cod_lanc, c.cod_dep from Lancamentos l ' +
        ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
        ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
        ' where l.dtreferencia >= ' + QuotedStr(vdt1) +
        ' and l.dtreferencia <= ' + QuotedStr(vdt2) +
        ' and c.tipo_gr = ''S'' and l.lote is null ' +
        ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
         vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger));

    // uniao com contas a pagar para olhar contas de lote
    if vtpcxcomp then
      qrresumo.sql.text := qrresumo.sql.text + ' union ' +
      	' select ctr.n_conta_plc, p.desc_plc,' +
        ' ctr.valor_pago, c.desc_gr, c.tipo_gr, ctr.historico_ctp,' +
        ' ctr.datq_ctp, p.grup_ct, ctr.cod_contrp, c.cod_dep from contas_a_pagar ctr ' +
        ' inner join p_contas p on ctr.n_conta_plc = p.n_conta_plc ' +
        ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
        ' where ctr.datq_ctp >= ' + QuotedStr(vdt1) +
        ' and ctr.datq_ctp <= ' + QuotedStr(vdt2) +
        ' and c.tipo_gr = ''S'' ' +
        ' and ctr.lote is not null ' +
        ' and ctr.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
         vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
        ' order by 10, 8, 1 '
    else
      qrresumo.sql.text := qrresumo.sql.text + ' union ' +
      	' select ctr.n_conta_plc, p.desc_plc,' +
        ' ctr.valor_pago, c.desc_gr, c.tipo_gr, ctr.historico_ctp, ' +
        ' ctr.datq_ctp, p.grup_ct, ctr.cod_contrp, c.cod_dep from contas_a_pagar ctr ' +
        ' inner join p_contas p on ctr.n_conta_plc = p.n_conta_plc ' +
        ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
        ' where ctr.dtreferencia >= ' + QuotedStr(vdt1) +
        ' and ctr.dtreferencia <= ' + QuotedStr(vdt2) +
        ' and c.tipo_gr = ''S'' ' +
        ' and ctr.lote is not null ' +
        ' and ctr.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
         vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
        ' order by 10, 8, 1 ';
  end
  else
    qrresumo.sql.text := ' select l.n_conta_plc, p.desc_plc, l.valor_l, c.desc_gr, c.tipo_gr, ' +
      ' l.historico_l, l.data, p.grup_ct, l.cod_lanc, c.cod_dep from Lancamentos l ' +
      ' inner join p_contas p on l.n_conta_plc = p.n_conta_plc ' +
      ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' where l.datq_l >= ' + QuotedStr(vdt1) +
      ' and l.datq_l <= ' + QuotedStr(vdt2) +
      ' and c.tipo_gr = ''E'' ' +
      ' and l.' + vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), 'CODIGO_EMP', 'COD_EMP_MULT') + ' = ' +
       vDadosIni.retornoPorCondicao((AgruparEmpUnificada = 'S') and (pCodigoUnificada <= 0), vDadosIni.codEmpresa, IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger)) +
      ' order by c.cod_dep, p.grup_ct, l.n_conta_plc ';
  qrresumo.open;
  vgr := trim(qrresumo.FieldByName('cod_dep').AsString);
  vdep := qrresumo.FieldByName('cod_dep').AsFloat;
  vtg := 0;
  Buscas.close;
  buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
  buscas.Open;
  ln := ln + 2;
  rdp.Imp(ln, 1, 'DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
  while not qrresumo.EOF do
  begin
    vtot := vtot + qrresumo.FieldByName('valor_l').AsCurrency;
    vtotdep := vtotdep + qrresumo.FieldByName('valor_l').AsCurrency;
    vtg := vtg + qrresumo.FieldByName('valor_l').AsCurrency;
    vtgG := vtgG + qrresumo.FieldByName('valor_l').AsCurrency;

    qrresumo.next;
    if ln >= 61 then
    begin
      ln := 1;
      rdp.Novapagina;
        CabMapa(vdetalhes, vexibirfornec, pCodigoUnificada, AgruparEmpUnificada);
    end;
    if (trim(vgr) <> trim(qrresumo.FieldByName('desc_gr').value)) or (qrresumo.EOF) then
    begin
      ln := ln + 1;
      rdp.FonteEstiloPadrao := [Snegrito];
      rdp.Imp(ln, 1, 'TOTAL ' + vgr);
      rdp.Imp(ln, 45, vDadosIni.Alndir(format('%n', [vtot]), 12));
      rdp.FonteEstiloPadrao := [];
      ln := ln + 1;
      vtot := 0.00;
      vgr := trim(qrresumo.FieldByName('desc_gr').value);
    end;
    if (vdep <> qrresumo.FieldByName('cod_dep').value) or (qrresumo.EOF) then
    begin
      rdp.FonteEstiloPadrao := [Snegrito];
      Buscas.close;
      buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
      buscas.Open;
      rdp.Imp(ln, 1, 'TOTAL ' + buscas.FieldByName('DESC_DEP').AsString);
      rdp.Imp(ln, 45, vDadosIni.Alndir(format('%n', [vtotdep]), 12));
      rdp.FonteEstiloPadrao := [];
      ln := ln + 2;
      vtotdep := 0.00;
      if not qrresumo.EOF then
      begin
        vdep := qrresumo.FieldByName('cod_dep').value;
        Buscas.close;
        buscas.sql.text := ' select * from depart_ct where cod_dep = ' + FloatToStr(vdep);
        buscas.Open;
        rdp.Imp(ln, 1, 'DEPTO: ' + buscas.FieldByName('DESC_DEP').AsString);
      end;
      ln := ln + 1;
    end;
  end;
    if ((AgruparEmpUnificada <> 'S') and (pCodigoUnificada <= 0)) then
    begin
      rdp.ImpF(ln, 1, 'TOTAL GERAL ACUMULADO - EMP' + IntToStr(buscasEmp.FieldByName('COD_EMPRESA').AsInteger) + ':', [normal, negrito]);
      rdp.ImpF(ln, 43, vDadosIni.Alndir(format('%n', [vtg]), 12), [normal, negrito]);
    end;
    buscasEmp.Next;
  end;
  if ((AgruparEmpUnificada <> 'S') and (pCodigoUnificada <= 0)) then
  begin
    ln := ln + 2;
    rdp.ImpF(ln, 1, 'TOTAL GERAL ACUMULADO:', [normal, negrito]);
    rdp.ImpF(ln, 43, vDadosIni.Alndir(format('%n', [vtgG]), 12), [normal, negrito]);
  end
  else
  begin
    rdp.Imp(ln, 1, 'TOTAL GERAL ACUMULADO:');
  rdp.Imp(ln, 45, vDadosIni.Alndir(format('%n', [vtg]), 12));
  end;
  rdp.Fechar;
  QrResumo.close;
  buscas.close;
end;

procedure TLancamentos._enviarModuloTranf;
var
  vSomaEntrada, vSomaSaida, vSomaEntradaSel, vSomaSaidaSel: Extended;
begin
  if vDadosIni.vTipoProc <> 'Loja2' then
    exit;

  if not vDadosIni.PesqPros('LANC009', 'ALTERAR', '', 'LANCAMENTOS', '',
    buscas, True) then
    exit;

  try

    if not vDadosIni.definirDiaFinanceiroFechado(buscas) then
      Exit;

    dataSet.first;
    while not dataSet.EOF do
    begin
      if vGrid.SelectedRows.CurrentRowSelected then
      begin
        if dataSet.FieldByName('data_cxl').IsNull then
        begin
          dataSet.Edit;
          dataSet.FieldByName('data_cxl').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          dataSet.Post;

          vDadosIni.GravaAuditoria('LANC009', 'ALTERAR', 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString +
            ' INC DT: ' + dataSet.FieldByName('data_cxl').AsString, 'LANCAMENTOS',
            dataSet.FieldByName('cod_lanc').AsString, buscas);
        end
        else
        begin
          if Application.MessageBox('Deseja Retirar Data Caixa Auxiliar?',
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
          begin
            vDadosIni.GravaAuditoria('LANC009', 'ALTERAR', 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString +
              ' DEL DT: ' + dataSet.FieldByName('data_cxl').AsString, 'LANCAMENTOS',
              dataSet.FieldByName('cod_lanc').AsString, buscas);

            dataSet.Edit;
            dataSet.FieldByName('data_cxl').AsString := '';
            dataSet.Post;
          end;
        end;
      end;
      dataSet.next;
    end;

    if dataSet.ChangeCount = 0 then
      exit;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('LANC009', 'ALTERAR', 'CONFIRMADA MODIFICACOES', 'LANCAMENTOS', '', buscas);

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('procedure TLancamentos._enviarModuloTranf Erro: ' + e.Message);
    end;
  end;

end;

function TLancamentos._existeControle(pControle: Integer): Boolean;
var
  vControle: Integer;
begin
  Result := False;

  if pControle > 0 then
    vControle := pControle
  else if dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0 then
    vControle := dataSet.FieldByName('CODIGO_CTRL').AsInteger
  else
    vControle := 0;

  buscas.Close;
  buscas.SQL.Text := 'select codigo_ctrl from controles' +
    ' where codigo_ctrl = :codigo_ctrl ' +
    ' and codigo_emp = :codigo_emp';
  buscas.ParamByName('codigo_ctrl').AsInteger := vControle;
  buscas.ParamByName('codigo_emp').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  Result := not buscas.IsEmpty;

  buscas.Close;
end;

function TLancamentos._existePContas(pNContaPlc: Double;vtp: smallint): Boolean;
var
  vNContaPlc: Double;
begin
  Result := False;
  if pNContaPlc > 0 then
    vNContaPlc := pNContaPlc
  else if dataSet.FieldByName('n_conta_plc').AsFloat > 0 then
    vNContaPlc := dataSet.FieldByName('n_conta_plc').AsFloat
  else
    vNContaPlc := 0;

  if vNContaPlc = 0 then
    Exit;
  if vtp = 1 then
  begin
   buscas.Close;
   buscas.SQL.Text :=
     'SELECT n_conta_plc FROM p_contas WHERE n_conta_plc = :n_conta_plc';
   buscas.ParamByName('n_conta_plc').AsFloat := vNContaPlc;
   buscas.Open;
   Result := not buscas.IsEmpty;
  end
  else
  begin
   buscas.Close;
   buscas.SQL.Text :=
     'SELECT p.n_conta_plc,gr.tipo_gr,p.tipo_plc FROM p_contas p,grupos_ct gr WHERE p.n_conta_plc = :n_conta_plc and '+
     'p.grup_ct = gr.grup_ct' ;
   buscas.ParamByName('n_conta_plc').AsFloat := vNContaPlc;
   buscas.Open;
   if not buscas.IsEmpty then
   begin
    if (buscas.FieldByName('TIPO_GR').AsString = 'D') and (buscas.FieldByName('TIPO_PLC').AsString = 'S')  then
    begin
     if not vDadosIni.PesqPros('LANC029', 'INCLUIR', '', 'LANCAMENTOS', '',dtmLancamentos.qrBuscas, true) then
      result:=False
     else
      result:=true;
    end
    else
     result:=true;
   end
   else
    result:=false;
  end;
  buscas.Close;
end;

procedure TLancamentos._iniciarPrevisao;
begin
  if not vDadosIni.definirDiaFinanceiroFechado(buscas) then
    Exit;
end;

procedure TLancamentos._marcarDesmarcarLancamentosComoVenda;
begin

  try

    if not vDadosIni.PesqPros('LANC011', 'ALTERAR', '', 'LANCAMENTOS', '',
      buscas, True) then
      exit;

    dataSet.first;
    while not dataSet.EOF do
    begin
      if vGrid.SelectedRows.CurrentRowSelected then
      begin
        if Trim(dataSet.FieldByName('LANC_VENDA').AsString) = '' then
        begin
          dataSet.Edit;
          dataSet.FieldByName('LANC_VENDA').AsString := 'S';
          dataSet.Post;

          vDadosIni.GravaAuditoria('LANC011', 'ALTERAR', 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString +
            ' LANC VENDA = SIM', 'LANCAMENTOS',
            dataSet.FieldByName('cod_lanc').AsString, buscas);
        end
        else
        begin
          if Application.MessageBox('Deseja Retirar o Status de Lancamento de Venda para este Lancamento?',
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
          begin
            vDadosIni.GravaAuditoria('LANC011', 'ALTERAR', 'LANC NUM ' + dataSet.FieldByName('cod_lanc').AsString +
              ' LANC VENDA = ""', 'LANCAMENTOS',
              dataSet.FieldByName('cod_lanc').AsString, buscas);

            dataSet.Edit;
            dataSet.FieldByName('LANC_VENDA').AsString := '';
            dataSet.Post;
          end;
        end;
      end;
      dataSet.next;
    end;

    if dataSet.ChangeCount = 0 then
      exit;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('LANC011', 'ALTERAR', 'CONFIRMADA MODIFICACOES', 'LANCAMENTOS', '', buscas);

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('procedure TLancamentos._marcarDesmarcarLancamentosComoVenda Erro: ' + e.Message);
    end;
  end;

end;

procedure TLancamentos._rdBoletimSendMail(Sender: TObject);
var
 pTipo: string;
begin
  try
     pTipo := 'BOLETIM';

     Screen.Cursor := crHourGlass;

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
      exit;

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp');

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
      exit;

      TRdprint(Sender).gerarPDF(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

      vDadosIni.EnvEmail(
      	vDadosIni.getConfSisStr('boletim_caixa_assunto_email', buscas),
      	vDadosIni.getConfSisBlob('boletim_caixa_assunto_email', buscas).Text,
        0,
        cEmail,
        '',
        '',
        cNenhum,
      	vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

     DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf'));
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TLancamentos._rdMapaDespesaSendMail(Sender: TObject);
var
 pTipo: string;
begin
  try
     pTipo := 'MAPADESPESAS';

     Screen.Cursor := crHourGlass;

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
      exit;

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp');

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
      exit;

      TRdprint(Sender).gerarPDF(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

      vDadosIni.EnvEmail(
      	vDadosIni.getConfSisStr('mapa_despesas_assunto_email', buscas),
      	vDadosIni.getConfSisBlob('mapa_despesas_assunto_email', buscas).Text,
        0,
        cEmail,
        '',
        '',
        cNenhum,
      	vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

     DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf'));
  finally
     Screen.Cursor := crDefault;
  end;
end;

function TLancamentos._salvaLancamentosTransferencia: Boolean;
var
  vLancL: TLancamentosImp;
  vContLigL: TContaLigacaoImp;
begin
  Result := False;
  try
    if vTransf.vControleOrigem = vTransf.vControleDestino then
    begin
      Application.MessageBox('Controle de destino igual ao de origem. Operação não Realizada',
        'Atenção', 0 + 64);
      Exit;
    end;

    vLancL := TLancamentosImp.create;
    vContLigL := TContaLigacaoImp.create;

    vContLigL._AbrirContadeLigacao(True);

    if vContLigL.dataSet.FieldByName('NCON_S_TRANSF').AsFloat > 0 then
    	vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_S_TRANSF').AsFloat
    else
    	vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_S_CRD').AsFloat;

//    vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
    if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
      raiseExceptionCreate('Corrija o cadastro para continuar','');

    vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
    vLancL.CODIGO_CTRL := vTransf.vControleOrigem;
    vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
    vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
    vLancL.HISTORICO_L := vTransf.historicoSaida;
    vLancL.VALOR_L := vTransf.valorTransferencia;
    vLancL.TP_MOD := 'S';

    vLancL._efetuarLancamento;

    vDadosIni.GravaAuditoria('LANC012', 'INCLUIR', 'LANC SAIDA NUM ' + IntToStr(vLancL.COD_LANC) + ' CONTROLE ' +
      IntToStr(vTransf.vControleOrigem), 'LANCAMENTOS', IntToStr(vLancL.COD_LANC), buscas);

    if vContLigL.dataSet.FieldByName('NCON_E_TRANSF').AsFloat > 0 then
    	vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_E_TRANSF').AsFloat
    else
    	vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_V_PROD').AsFloat;

//    vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
    if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
      raiseExceptionCreate('Corrija o cadastro para continuar','');

    vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
    vLancL.CODIGO_CTRL := vTransf.vControleDestino;
    vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
    vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
    vLancL.HISTORICO_L := vTransf.historicoEntrada;
    vLancL.VALOR_L := vTransf.valorTransferencia;
    vLancL.TP_MOD := 'S';
    vLancL._efetuarLancamento;

    vDadosIni.GravaAuditoria('LANC012', 'INCLUIR', 'LANC ENTRADA NUM ' + IntToStr(vLancL.COD_LANC) + ' CONTROLE ' +
      IntToStr(vTransf.vControleDestino), 'LANCAMENTOS', IntToStr(vLancL.COD_LANC), buscas);

    vLancL.CommitaTransacao;

    vDadosIni.GravaAuditoria('LANC012', 'INCLUIR', 'CONFIRMADA INCLUSOES', 'LANCAMENTOS', '', buscas);

    Result := True;
    dataSet.Refresh;

  except
    on e: exception do
    begin
      vLancL.RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('procedure TLancamentos._marcarDesmarcarLancamentosComoVenda Erro: ' + e.Message);
    end;
  end;
end;

procedure TLancamentos._somatorioLancamentos;
var
  vSomaEntrada, vSomaSaida, vSomaEntradaSel, vSomaSaidaSel: Extended;
begin

  if not vDadosIni.PesqPros('LANC008', 'SOMATORIO', '', 'LANCAMENTOS', '',
    buscas, False) then
    exit;

  vSomaEntrada := 0.00;
  vSomaSaida := 0.00;
  vSomaEntradaSel := 0.00;
  vSomaSaidaSel := 0.00;

  dataSet.first;
  while not dataSet.EOF do
  begin
    if dataSet.FieldByName('TIPO_L').AsString = 'E' then
      vSomaEntrada := vSomaEntrada + dataSet.FieldByName('VALOR_L').AsFloat
    else
      vSomaSaida := vSomaSaida + dataSet.FieldByName('VALOR_L').AsFloat;
    if vGrid.SelectedRows.CurrentRowSelected then
    begin
      if dataSet.FieldByName('TIPO_L').AsString = 'E' then
        vSomaEntradaSel := vSomaEntradaSel + dataSet.FieldByName('VALOR_L').AsFloat
      else
        vSomaSaidaSel := vSomaSaidaSel + dataSet.FieldByName('VALOR_L').AsFloat;
    end;
    dataSet.next;
  end;

  Application.MessageBox(pchar('Valor das Entradas............: ' + format('%m', [vSomaEntrada]) + #13 +
    'Valor das Saidas..............: ' + format('%m', [vSomaSaida]) + #13 +
    'Valor Total...................: ' + format('%m', [vSomaEntrada - vSomaSaida]) + #13 +
    'Valor Entradas Selecionadas...: ' + format('%m', [vSomaEntradaSel]) + #13 +
    'Valor das Saidas Selecionadas.: ' + format('%m', [vSomaSaidaSel]) + #13 +
    'Valor Total Selecionados......: ' + format('%m', [vSomaEntradaSel - vSomaSaidaSel])), 'Anteção', 0 + 64);

end;

{ TPContasLanc }

constructor TPContasLanc.create;
begin
  DataSet := TClientDataSet(dtmLancamentos.cdsPCont);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
end;

function TPContasLanc._abreEntSaiPContasLanc(EntSai: string; NumContaSelecionada: Double): Boolean;
begin
  Result := montaSelect(
    'select pc.n_conta_plc, pc.desc_plc, pc.sthab, pc.tipo_plc, g.desc_gr, d.desc_dep, pc.gerar_contrapartida from p_contas pc' +
    ' left join grupos_ct g on g.grup_ct = pc.grup_ct' +
    ' left join depart_ct d on d.cod_dep = g.cod_dep' +
    ' where pc.ativo = 1 and pc.tipo_plc = %s and pc.n_conta_plc <> %s' +
    ' union ' +
    'select pc.n_conta_plc, pc.desc_plc, pc.sthab, pc.tipo_plc, g.desc_gr, d.desc_dep, pc.gerar_contrapartida from p_contas pc' +
    ' left join grupos_ct g on g.grup_ct = pc.grup_ct' +
    ' left join depart_ct d on d.cod_dep = g.cod_dep' +
    ' where pc.tipo_plc = %s and pc.n_conta_plc = %s' +
    ' order by 2',
    [QuotedStr(EntSai), ffloat_fb(NumContaSelecionada),
     QuotedStr(EntSai), ffloat_fb(NumContaSelecionada)]);
end;

function TPContasLanc._abreTodosPContasLanc(NumContaSelecionada: Double): Boolean;
begin
  Result := montaSelect(
    'select pc.n_conta_plc,' +
    ' case when coalesce(pc.cod_cta_contabil,'''') <> '''' then rtrim(pc.desc_plc)||'' - ''||pc.cod_cta_contabil||'': ''||pcc.nome_cta ' +
    ' else pc.desc_plc end desc_plc,' +
    ' pc.sthab, pc.tipo_plc, g.desc_gr, d.desc_dep, pc.gerar_contrapartida, pc.estornar_vale from p_contas pc' +
    ' left join grupos_ct g on g.grup_ct = pc.grup_ct' +
    ' left join depart_ct d on d.cod_dep = g.cod_dep' +
    ' left join p_contas_contabil pcc on pcc.cod_cta = pc.cod_cta_contabil and pcc.cod_empresa = ' + vDadosIni.codEmpresa +
    ' where pc.ativo = 1 and pc.n_conta_plc <> %s' +
    ' union ' +
    'select pc.n_conta_plc,' +
    ' case when coalesce(pc.cod_cta_contabil,'''') <> '''' then rtrim(pc.desc_plc)||'' - ''||pc.cod_cta_contabil||'': ''||pcc.nome_cta ' +
    ' else pc.desc_plc end desc_plc,' +
    ' pc.sthab, pc.tipo_plc, g.desc_gr, d.desc_dep, pc.gerar_contrapartida, pc.estornar_vale from p_contas pc' +
    ' left join grupos_ct g on g.grup_ct = pc.grup_ct' +
    ' left join depart_ct d on d.cod_dep = g.cod_dep' +
    ' left join p_contas_contabil pcc on pcc.cod_cta = pc.cod_cta_contabil and pcc.cod_empresa = ' + vDadosIni.codEmpresa +
    ' where pc.n_conta_plc = %s' +
    ' order by 2',
    [ffloat_fb(NumContaSelecionada), ffloat_fb(NumContaSelecionada)]);
end;

{ TControlesLanc }

constructor TControlesLanc.create;
begin
  DataSet := TClientDataSet(dtmLancamentos.cdsCtrl);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
end;

function TControlesLanc._abreTodosControlesLanc(CodCtrlSelecionado: Integer; pCodEmpMult: Integer): Boolean;
begin
  Result := montaSelect(
    ' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.saldo_at_ctrl,c.compsaldo,saldo_ant_ctrl,c.codigo_emp, c.docs, c.data_conf_sald_banc from controles c' +
    ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and c.ativo = 1 ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
    ' and c.codigo_ctrl <> ' + IntToStr(CodCtrlSelecionado) +
    ' union ' +
    ' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.saldo_at_ctrl,c.compsaldo,saldo_ant_ctrl,c.codigo_emp, c.docs, c.data_conf_sald_banc from controles c' +
    ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and c.codigo_ctrl = ' + IntToStr(CodCtrlSelecionado) +
//    ' and coalesce(c.nao_gera_finan, '''') <> ''S''' +
    ' order by 1 ');
end;

{ TSalCtrl }

constructor TSalCtrl.create;
begin
  DataSet := TClientDataSet(dtmLancamentos.cdssaldoCtrl);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
end;

function TSalCtrl._abreSaldos(codcontrole: integer; Vdia: Tdate): Boolean;
begin
  if codcontrole = 0 then
    Result := montaSelect(
      'select * from sal_ctrl where data_sld = ' +
      QuotedStr(FormatDateTime('mm/dd/yyyy', Vdia)) + ' and cod_emp = ' + vDadosIni.codEmpresa)
  else
  begin
    Result := montaSelect(
      'select * from sal_ctrl where codigo_ctrl = ' + IntToStr(codcontrole) +
      ' and cod_emp = ' + vDadosIni.codEmpresa + ' and data_sld = ' +
      QuotedStr(FormatDateTime('mm/dd/yyyy', Vdia)));
  end;
end;

{ TFech_dia }

constructor TFech_dia.create;
begin
  DataSet := TClientDataSet(dtmLancamentos.cdsfechDia);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
end;

function TFech_dia.retiraMarcaFech: boolean;
begin
  if dataSet.FieldByName('INICIA_FECH').AsString = 'S' then
  begin
    dataSet.Edit;
    dataSet.FieldByName('INICIA_FECH').AsString := '';
    dataSet.Post;
    Apply;
    CommitaTransacao;
  end
  else
  begin
    Application.MessageBox('Dia sem marca para retirar!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Result := false;
  end;
end;

function TFech_dia.retiraMarcaImport: boolean;
begin
	if dataSet.FieldByName('INICIA_IMPORT').AsString = 'S' then
  begin
    dataSet.Edit;
    dataSet.FieldByName('INICIA_IMPORT').AsString := '';
    dataSet.Post;
    Apply;
    CommitaTransacao;
  end
  else
  begin
    Application.MessageBox('Dia sem marca para retirar!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Result := false;
  end;
end;

function TFech_dia._abreFechamento(Vdia: string): Boolean;
begin
  if Vdia = '' then
    Result := montaSelect(
      ' select first 1 * from fech_dia ' +
      ' where dia_fcd = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro)) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa +
      ' order by dia_fcd desc')
  else
    Result := montaSelect(
      ' select * from fech_dia ' +
      '	where dia_fcd >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro - 30)) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa +
      ' order by dia_fcd desc');
  dataSet.FieldByName('DIA_FCD').DisplayLabel := 'Dia Fechado';
  dataSet.FieldByName('NMOV').DisplayLabel := 'Número Movimento';
  dataSet.FieldByName('TOT_E_FCD').DisplayLabel := 'Total Geral de Entradas';
  dataSet.FieldByName('TOT_S_FCD').DisplayLabel := 'Total Geral de Saídas';
  dataSet.FieldByName('CODIGO_EMP').DisplayLabel := 'Cód. Empresa';
  dataSet.FieldByName('INICIA_FECH').DisplayLabel := 'Iniciou Fechamento?';
  dataSet.FieldByName('INICIA_IMPORT').DisplayLabel := 'Iniciou Importação?';

  TFloatField(dataSet.FieldByName('TOT_E_FCD')).DisplayFormat   := '#,##0.00';
  TFloatField(dataSet.FieldByName('TOT_S_FCD')).DisplayFormat   := '#,##0.00';
  dataSet.FieldByName('CODIGO_EMP').Visible := False;

  buscas.Close;
  buscas.SQL.Text := ' SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS ' +
    '	WHERE RDB$RELATION_FIELDS.RDB$RELATION_NAME = ''FECH_DIA'' ' +
    ' AND RDB$RELATION_FIELDS.RDB$FIELD_NAME IN (''SEQID_WS'', ''EMP_ALT_WS'') ';
  buscas.open;

  if not buscas.IsEmpty then
  begin
	  dataSet.FieldByName('SEQID_WS').Visible := False;
  	dataSet.FieldByName('EMP_ALT_WS').Visible := False;
  end;

  buscas.Close;
  buscas.SQL.Text := ' SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS ' +
    '	WHERE RDB$RELATION_FIELDS.RDB$RELATION_NAME = ''FECH_DIA'' ' +
    ' AND RDB$RELATION_FIELDS.RDB$FIELD_NAME = ''SEQID_SINC'' ';
  buscas.open;

  if not buscas.IsEmpty then
	  dataSet.FieldByName('SEQID_SINC').Visible := False;
end;

{ TConciliacaoBanc }

procedure TConciliacaoBanc.AcompensAfterScroll(DataSet: TDataSet);
begin
  if FcdsAcompens.IsEmpty then
  begin
    FrmConcilia.BitBtn2.Enabled := false;
    FrmConcilia.BitBtn8.Enabled := false;
  end
//  else if FcdsAcompens.FieldByName('Tipo Pag').AsString = 'AP' then
//  begin
//    FrmConcilia.BitBtn2.Enabled := false;
//    FrmConcilia.BitBtn8.Enabled := false;
//    FrmConcilia.DBGrid2.SelectedRows.CurrentRowSelected:=false;
//  end
  else
  begin
    FrmConcilia.BitBtn2.Enabled := true;
    FrmConcilia.BitBtn8.Enabled := true;
  end;
end;

procedure TConciliacaoBanc.CalculaSaldoBancario;
begin
  FBuscasGerais.Close;
  FBuscasGerais.SQL.Text := 'select max(data_sld) as max_data_sld from sal_ctrl ' +
    ' where codigo_ctrl = ' + IntToStr(FcdsControles.FieldByName('Cod. Controle').asinteger) +
    ' and cod_emp = ' + vDadosIni.codEmpresa;
  FBuscasGerais.Open;

  FSaldoCtrl.Close;
  FSaldoCtrl.SQL.Text := 'select * from Sal_Ctrl where codigo_ctrl = ' + IntToStr(FcdsControles.FieldByName('Cod. Controle').asinteger) +
    ' and data_sld = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', FBuscasGerais.FieldByName('max_data_sld').AsDateTime)) +
    ' and cod_emp =' + vDadosIni.codEmpresa + ' order by data_sld';
  FSaldoCtrl.Open;

  FBuscasGerais.Close;

  FrmConcilia.Label4.Caption := format('%n', [FSaldoCtrl.FieldByName('SALDO_BANCO').AsFloat]);
  FsaldoBanco:=FSaldoCtrl.FieldByName('SALDO_BANCO').AsFloat;

  FcdsAcompens.first;
  FsaldoCaixa := FSaldoCtrl.FieldByName('VAL_SLD').AsFloat;
  while not FcdsAcompens.eof do
  begin
    if FcdsAcompens.FieldByName('Tipo Pag').AsString = 'AV' then
    begin
      //      if not FcdsAcompens.FieldByName('DT_COMPENSADO').isnull then
      //      begin
      FBuscasGerais.Close;
      FBuscasGerais.SQL.Text := 'select data from lancamentos ' +
        ' where cod_lanc = ' + IntToStr(FcdsAcompens.FieldByName('Cod. Lancamento').asinteger) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      FBuscasGerais.Open;
//      if (FBuscasGerais.FieldByName('DATA').AsDateTime <= (vDadosIni.diaFFinanceiro + 1)) then
      if not (FBuscasGerais.FieldByName('DATA').AsDateTime < (vDadosIni.diaFFinanceiro + 1)) then
      begin
//       if FcdsAcompens.FieldByName('Data Compensação').isnull then
        if FcdsAcompens.FieldByName('Tipo Lançamento').AsString = 'E' then
           FsaldoCaixa := FsaldoCaixa + FcdsAcompens.FieldByName('VALOR').AsFloat
        else
          FsaldoCaixa := FsaldoCaixa - FcdsAcompens.FieldByName('VALOR').AsFloat;

      end;
      if (FcdsAcompens.FieldByName('Data Compensação').AsDateTime = (vDadosIni.diaFFinanceiro + 1)) then
      begin
       if FcdsAcompens.FieldByName('Tipo Lançamento').AsString = 'E' then
         FsaldoBanco := FsaldoBanco + FcdsAcompens.FieldByName('VALOR').AsFloat
       else
        FsaldoBanco:= FsaldoBanco - FcdsAcompens.FieldByName('VALOR').AsFloat;
      end;
      //      end;

      FBuscasGerais.close;
    end
    else
      FsaldoCaixa := FsaldoCaixa - FcdsAcompens.FieldByName('VALOR').AsFloat;
    FcdsAcompens.next;
  end;
  FcdsAcompens.First;
  FrmConcilia.label3.Caption := format('%n', [FsaldoCaixa]);
  FrmConcilia.label8.Caption := format('%n', [FsaldoCaixa - FsaldoBanco]);
  FrmConcilia.Label4.Caption := format('%n', [FsaldoBanco]);
//  FSaldoCtrl.FieldByName('SALDO_BANCO').AsFloat
end;

procedure TConciliacaoBanc.ControlesAfterScroll(DataSet: TDataSet);
begin
  vDadosIni.vConcBanc.vDataInicioConcBanc	:= vDadosIni.getConfSisStr('conc_banc_sistema_data_inicio', FBuscasGerais);

  vDadosIni.definirDiaFinanceiroFechado(FBuscasGerais);
  FcdsAcompens.Close;
  FcdsAcompens.CommandText := ' select lancamentos.cod_emp_mult "Cod Unificada", ' +
    ' ''AV'' "Tipo Pag", lancamentos.N_conta_plc "Num.Conta", ' +
    ' lancamentos.ndoc_l "Num. Doc", lancamentos.n_cheq_l "Num.Cheque", ' +
    ' trim(lancamentos.historico_l) || ' +
    '     (case when (lancamentos.cod_lanc > 0 and ' +
    '				(case when (lancamentos.lote_quit > 0) then lancamentos.lote_quit ' +
    '						  when (lancamentos.lote_ent > 0) then lancamentos.lote_ent ' +
    '							when (lancamentos.lote > 0) then lancamentos.lote end) > 0) then ' +
    '               '' - LANC '' || lancamentos.cod_lanc || ' +
    '						  	(case when (lancamentos.lote > 0) then lancamentos.lote ' +
    '                     when (lancamentos.lote_quit > 0) then lancamentos.lote_quit ' +
    '									    when (lancamentos.lote_ent > 0) then lancamentos.lote_ent ' +
    '										  end) ' +
    '           when (lancamentos.cod_lanc > 0) then ' +
    '            '' - LANC  '' || lancamentos.cod_lanc' +
    '           when (lancamentos.lote > 0) then ' +
    '            '' - LT.PG '' || lancamentos.lote ' +
    '           when (lancamentos.lote_quit > 0) then ' +
    '            '' - LT.CRD '' || lancamentos.lote_quit ' +
    '           when (lancamentos.lote_ent > 0) then ' +
    '            '' - LT.CRD '' || lancamentos.lote_ent ' +
    '           else ' +
    '            '''' end) "Histórico", ' +
    ' coalesce(lancamentos.valor_l, 0) "Valor", lancamentos.dia_fcd "Data Compensação",' +
    ' lancamentos.dt_compensado "Dia Conciliação", lancamentos.cod_lanc "Cod. Lancamento", ' +
    ' lancamentos.tipo_l "Tipo Lançamento", lancamentos.data "Data Lançamento", ' +
    ' lancamentos.data_venc_cheq_l "Data Venc Cheque", ' +
    ' empresa.identificacao_emp "Unificada" ' +
    ' from lancamentos ' +
    ' inner join empresa on empresa.cod_empresa = lancamentos.cod_emp_mult ' +
    ' where lancamentos.codigo_ctrl = :codigo_ctrl ' +
    ' and ((lancamentos.dt_compensado = :diaFFinanceiro) or (lancamentos.dt_compensado is null)) ' +
    ' and lancamentos.data <= :vdtfinan and lancamentos.codigo_emp = :codigo_emp ';
//    ' union ' +
//    ' select ''AP'' "Tipo",N_conta_plc, null, n_cheq_ctp, ' +
//    ' trim(historico_ctp) || ' +
//    '     '' - PG '' || contas_a_pagar.cod_contrp || ' +
//    '     case when (lote > 0) then ' +
//    '         '' / LT.PG '' || lote ' +
//    '     else ' +
//    '         '''' end, ' +
//    ' coalesce(valor_ctp, 0),data_venc_ctp, ' +
//    ' dt_compens,cod_contrp,tipo_ctp,data_ent_ctp as data_lancamento from contas_a_pagar ' +
//    ' where codigo_ctrl = :codigo_ctrl ' +
//    ' and (datq_ctp is null) and aceite_ctp = ''S'' and codigo_emp = :codigo_emp ' +
	if trim(vDadosIni.vConcBanc.vDataInicioConcBanc) <> '' then
	  FcdsAcompens.CommandText := FcdsAcompens.CommandText + ' and lancamentos.data >= :data_inicio_conc_banc ';

  FcdsAcompens.CommandText := FcdsAcompens.CommandText +
    ' order by 1, 12, 10, 8';
  FcdsAcompens.Params.ParamByName('codigo_emp').AsInteger := StrToInt(vDadosIni.codEmpresa);
  FcdsAcompens.Params.ParamByName('codigo_ctrl').AsInteger := FcdsControles.FieldByName('Cod. Controle').asinteger;
  FcdsAcompens.Params.ParamByName('diaFFinanceiro').AsDate := vDadosIni.diaFFinanceiro + 1;
  FcdsAcompens.Params.ParamByName('vdtfinan').AsDate := vDadosIni.diaFFinanceiro + 1;
  if trim(vDadosIni.vConcBanc.vDataInicioConcBanc) <> '' then
  	FcdsAcompens.Params.ParamByName('data_inicio_conc_banc').AsDate := StrToDate(trim(vDadosIni.vConcBanc.vDataInicioConcBanc));
  FcdsAcompens.Open;
  TFloatField(FcdsAcompens.FieldByName('Valor')).DisplayFormat := '##0.00';
  FcdsAcompens.FieldByName('Cod Unificada').Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  FcdsAcompens.FieldByName('Unificada').Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  CalculaSaldoBancario;
end;

constructor TConciliacaoBanc.create;
begin
  buscas := TIBQuery(dtmLancamentos.qrBuscas);
  FcdsAcompens := TClientDataSet(dtmLancamentos.cdsAcompens);
  FcdsControles := TClientDataSet(dtmLancamentos.cdsControles);
  FSaldoCtrl := TIBQuery(dtmLancamentos.qrSaldoCtrl);
  FBuscasGerais := TIBQuery(dtmLancamentos.qrBuscasGerais);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  FcdsAcompens.AfterScroll := AcompensAfterScroll;
  FcdsControles.AfterScroll := ControlesAfterScroll;
  FdsAcompens := TDataSource.Create(nil);
  FdsAcompens.DataSet := FcdsAcompens;
  FdsControles := TDataSource.Create(nil);
  FdsControles.DataSet := FcdsControles;
  FdsSaldoCtrl := TDataSource.Create(nil);
  FdsSaldoCtrl.DataSet := FSaldoCtrl;
end;

procedure TConciliacaoBanc.restoreRecNoAcompens;
begin
 if (FrecnoAcompens > 0) and (FrecnoAcompens <= FcdsAcompens.RecordCount) then
    FcdsAcompens.RecNo := FrecnoAcompens;
end;

procedure TConciliacaoBanc.restoreRecNoControle;
begin
  if (FrecnoControle > 0) and (FrecnoControle <= FcdsControles.RecordCount) then
    FcdsControles.RecNo := FrecnoControle;
end;

procedure TConciliacaoBanc.storeRecNoAcompens;
begin
  if (not FcdsAcompens.IsEmpty) and (FcdsAcompens.RecordCount > 0) then
    FrecnoAcompens := FcdsAcompens.RecNo
  else
    FrecnoAcompens := -1;
end;

procedure TConciliacaoBanc.storeRecNoControle;
begin
  if (not FcdsControles.IsEmpty) and (FcdsControles.RecordCount > 0) then
    FrecnoControle := FcdsControles.RecNo
  else
    FrecnoControle := -1;
end;

function TConciliacaoBanc._abreControles: boolean;
begin
  FcdsControles.Close;
  FcdsControles.CommandText := 'select ' +
    ' CODIGO_CTRL "Cod. Controle",' +
    ' FLUXO_CTRL "Fluxo de Caixa",' +
    ' N_BANCO_CTRL "Num. do Banco",' +
    ' NOME_CTRL "Nome do Controle/Banco",' +
    ' N_CONTA_CTRL "Num.Conta Banco",' +
    ' CONTR_BANC "Controle Bancário",' +
    ' FONE_CTRL "Fone do Banco" ' +
    ' from controles ' +
    ' where contr_banc = ''S'' ' +
    ' and codigo_emp = :codigo_emp ' +
    ' and ativo = 1 ' + 
    ' order by codigo_ctrl';
  FcdsControles.Params.ParamByName('codigo_emp').AsInteger := StrToInt(vDadosIni.codEmpresa);
  FcdsControles.Open;
end;

function TConciliacaoBanc._abreFormAlterarDataCompensacao(vgrid: Tdbgrid): boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('LANC025', 'COMPENSAR',	'', 'LANCAMENTOS', '',
    FBuscasGerais, true) then
    exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 250;
    formulario.Height := 130;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Data Real da Compensação';
    formulario.BorderIcons := [];
    vDadosIni.definirDiaFinanceiroFechado(FBuscasGerais);
    FrmConcilia.MaskEdit1.Enabled := false;
    FrmConcilia.MaskEdit1.Text := DateToStr(vDadosIni.diaFFinanceiro + 1);
    FrmConcilia.pnDataRelaCompensacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;
    result := (formulario.ShowModal = IDOK);

  finally
    if Result then
      _alterarDataCompensacao(FrmConcilia.MaskEdit1.Text,vgrid);
    FrmConcilia.pnDataRelaCompensacao.Parent := FrmConcilia.TsSaldoBanco;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConciliacaoBanc._abreFormAlterarSaldoCtrlBancario: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('LANC024', 'EDITAR', '', 'SAL_CTRL', '',
    FBuscasGerais, true) then
    exit;

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 250;
    formulario.Height := 130;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Modificar Saldo de controle Bancário';
    formulario.BorderIcons := [];

    FrmConcilia.pnAlterarSaldoCtrlBancario.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;
    result := (formulario.ShowModal = IDOK);

  finally
    if Result then
      _alterarSaldoCtrlBancario(FrmConcilia.MaskEdit4.Text, FrmConcilia.EdtValorBanco.AsValue);
    FrmConcilia.pnAlterarSaldoCtrlBancario.Parent := FrmConcilia.TsSaldoBanco;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TConciliacaoBanc._abreFormConciliacaoBancaria;
begin
  vDadosIni.abreStatusProcessamento('', 'Abrindo Formulário de Conciliação Bancária');
  if dtmLancamentos = nil then
    dtmLancamentos := TdtmLancamentos.Create(dtmLancamentos);

  if not vDadosIni.PesqPros('LANC022', 'ABRIR', '', 'LANCAMENTOS', '',
    dtmLancamentos.qrBuscasGerais, true) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;
  Application.CreateForm(TFrmConcilia, FrmConcilia);
  FrmConcilia.Show;
end;

function TConciliacaoBanc._abreFormSaldoControle: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('LANC023', 'VISUALIZAR', '', 'SAL_CTRL', '',
    FBuscasGerais, true) then
    exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Saldos dos Controles';
    formulario.BorderIcons := [];

    FrmConcilia.Panel8.Caption := 'VISUALIZAÇÃO DO CONTROLE: ' + FcdsControles.FieldByName('Nome do Controle/Banco').AsString;
    FrmConcilia.pnVisualizarSaldoCtrl.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;
    _abreSaldoCtrl(false);
    result := (formulario.ShowModal = IDOK);

  finally
    FrmConcilia.pnVisualizarSaldoCtrl.Parent := FrmConcilia.TsSaldoCTrl;
    formulario.Free;
    formulario := nil;
  end;
end;

function TConciliacaoBanc._abreSaldoCtrl(pAbrirGeral: boolean): boolean;
begin
  result := false;
  if pAbrirGeral then
  begin
    FSaldoCtrl.Close;
    FSaldoCtrl.SQL.Text := 'select * from Sal_Ctrl ' +
      ' where cod_emp=' + vDadosIni.codEmpresa + ' order by data_sld';
    FSaldoCtrl.open;
  end
  else
  begin
    if FcdsControles.FieldByName('Cod. Controle').AsInteger = 1 then
    begin
      if vDadosIni.vNivel < 10 then
      begin
        Application.MessageBox('Nivel de Acesso Nao permitido.', 'Informação', MB_OK + MB_ICONINFORMATION);
        exit;
      end;
    end;
    FSaldoCtrl.close;
    FSaldoCtrl.sql.text := 'select data_sld "Data Saldo",val_sld,sobra_sld,' +
      'vl_crd_sld,saldo_banco, ' + //data_conc "Data Conciliação", ' +
      'saldo_conc, coalesce(conc_banc, ''N'') conc_banc from Sal_Ctrl ' +
      'where codigo_ctrl = ' + IntToStr(FcdsControles.FieldByName('Cod. Controle').asinteger) +
      'and cod_emp = ' + vDadosIni.codEmpresa + ' order by data_sld';
    FSaldoCtrl.Open;
    TFloatField(FSaldoCtrl.FieldByName('VAL_SLD')).DisplayFormat := '#,##0.00';
    FSaldoCtrl.FieldByName('VAL_SLD').DisplayLabel := 'Saldo';
    TFloatField(FSaldoCtrl.FieldByName('SOBRA_SLD')).DisplayFormat := '#,##0.00';
    FSaldoCtrl.FieldByName('SOBRA_SLD').DisplayLabel := 'Sobra Dia';
    TFloatField(FSaldoCtrl.FieldByName('VL_CRD_SLD')).DisplayFormat := '#,##0.00';
    FSaldoCtrl.FieldByName('VL_CRD_SLD').DisplayLabel := 'Valor Somatório Credito';
    TFloatField(FSaldoCtrl.FieldByName('SALDO_BANCO')).DisplayFormat := '#,##0.00';
    FSaldoCtrl.FieldByName('SALDO_BANCO').DisplayLabel := 'Saldo Bancário';
    TFloatField(FSaldoCtrl.FieldByName('SALDO_CONC')).DisplayFormat := '#,##0.00';
    FSaldoCtrl.FieldByName('SALDO_CONC').DisplayLabel := 'Saldo Conciliação';
    FSaldoCtrl.FieldByName('CONC_BANC').DisplayLabel := 'Conciliado?';
    FSaldoCtrl.Last;
  end;
  result := true;
end;

function TConciliacaoBanc._alterarDataCompensacao(pData: string;vgrid:TdbGrid; pRetirar: boolean = false): boolean;
var
  vData: Tdate;
  vCodLanc: integer;
begin
  Result := false;
  if FcdsAcompens.IsEmpty then
    exit;

  if not pRetirar then
  begin
    try
      vData := StrToDate(pData)
    except
      Application.MessageBox('Erro de Conversão de data, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;
  end
  else if Application.MessageBox('Deseja retirar compensação?',
  	'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> IDYES then
     exit;

  vCodLanc := FcdsAcompens.FieldByName('Cod. Lancamento').Asinteger;
  try
  	FcdsAcompens.DisableControls;
    FcdsAcompens.Filter := 'sel = ''S'' ';
    FcdsAcompens.Filtered := true;

    if FcdsAcompens.IsEmpty then
    begin
      Application.MessageBox('Nenhum lançamento selecionado!', 'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(FBuscasGerais) then
      Exit;

    IniciaTransacao;

    FcdsAcompens.First;
    while not FcdsAcompens.Eof do
    begin
      if not pRetirar then
      begin
        if (FcdsAcompens.FieldByName('Tipo Pag').AsString <> 'AP')
          and (FcdsAcompens.FieldByName('Data Compensação').IsNull) then
        begin
         FBuscasGerais.close;
         FBuscasGerais.sql.text := 'update lancamentos l ' +
           ' set DT_COMPENSADO = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFFinanceiro + 1)) + ',' +
           ' DIA_FCD=' + quotedstr(FormatDateTime('mm/dd/yyyy', vdata)) +
           ' where cod_lanc = ' + inttostr(FcdsAcompens.FieldByName('Cod. Lancamento').Asinteger) +
           ' and codigo_emp = ' + vDadosIni.codEmpresa;
         FBuscasGerais.Prepare;
         FBuscasGerais.ExecSQL;

         vDadosIni.GravaAuditoria('LANC025', 'COMPENSAR', '', 'LANCAMENTOS', inttostr(vCodLanc), FBuscasGerais);
        end;
      end
      else
      begin
        if (FcdsAcompens.FieldByName('Tipo Pag').AsString <> 'AP')
          and not (FcdsAcompens.FieldByName('Data Compensação').IsNull) then
        begin
         FBuscasGerais.close;
         FBuscasGerais.sql.text := 'update lancamentos l ' +
           ' set DT_COMPENSADO = NULL, ' +
           ' DIA_FCD=NULL ' +
           ' where cod_lanc = ' + inttostr(FcdsAcompens.FieldByName('Cod. Lancamento').Asinteger) +
           ' and codigo_emp = ' + vDadosIni.codEmpresa;
         FBuscasGerais.Prepare;
         FBuscasGerais.ExecSQL;

         vDadosIni.GravaAuditoria('LANC025', 'RETIRAR COMPENSACAO', '', 'LANCAMENTOS', inttostr(vCodLanc), FBuscasGerais);
        end;
      end;

     FcdsAcompens.Next;
    end;
  finally
    FcdsAcompens.Filtered := false;
    FcdsAcompens.EnableControls;
  end;

  Result := CommitaTransacao;
  if Result then
  begin
    _abreControles;
    vDadosIni.GravaAuditoria('LANC025', vDadosIni.IfThen(pRetirar, 'COMPENSAR', 'RETIRAR COMPENSACAO'),
    	'SUCESSO', 'LANCAMENTOS', '', FBuscasGerais);
  end
  else
    vDadosIni.GravaAuditoria('LANC025', vDadosIni.IfThen(pRetirar, 'COMPENSAR', 'RETIRAR COMPENSACAO'),
    	'FALHA', 'LANCAMENTOS', '', FBuscasGerais);
end;

function TConciliacaoBanc._alterarSaldoCtrlBancario(pData: string; pValor: Currency): boolean;
var
  vData: Tdate;
  vCodCtrl: integer;
begin
  Result := false;
  try
    vData := StrToDate(pData)
  except
    Application.MessageBox('Erro de Conversão de data, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  FBuscasGerais.close;
  FBuscasGerais.sql.text := 'select * from sal_ctrl ' +
    ' where codigo_ctrl = ' + inttostr(FcdsControles.FieldByName('Cod. Controle').Asinteger) +
    ' and data_sld = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vData)) + ' and cod_emp = ' + vDadosIni.codEmpresa;
  FBuscasGerais.open;
  vCodCtrl := FcdsControles.FieldByName('Cod. Controle').Asinteger;
  if FBuscasGerais.IsEmpty then
  begin
    Application.MessageBox('Data do Controle informado não encontrada, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    Result := false;
  end
  else
  begin
    IniciaTransacao;
    FBuscasGerais.close;
    FBuscasGerais.sql.text := 'update sal_ctrl set saldo_banco = ' + vDadosIni.trocaVirgulaPorPonto(CurrToStr(pValor)) +
      ' where codigo_ctrl = ' + inttostr(FcdsControles.FieldByName('Cod. Controle').Asinteger) +
      ' and data_sld = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vdata)) + ' and cod_emp = ' + vDadosIni.codEmpresa;
    FBuscasGerais.Prepare;
    FBuscasGerais.ExecSQL;
    Result := CommitaTransacao;
    if Result then
    begin
      _abreControles;
      vDadosIni.GravaAuditoria('LANC024', 'EDITAR', 'SUCESSO CTRL: ' + inttostr(vCodCtrl) + ' DATA: ' + pData, 'SAL_CTRL', inttostr(vCodCtrl), FBuscasGerais);
      Application.MessageBox('Saldo Alterado com Sucesso!', 'Informação', MB_ICONINFORMATION + MB_OK);
    end
    else
      vDadosIni.GravaAuditoria('LANC024', 'EDITAR', 'FALHA CTRL: ' + inttostr(vCodCtrl) + ' DATA: ' + pData, 'SAL_CTRL', inttostr(vCodCtrl), FBuscasGerais);
  end;
end;

function TConciliacaoBanc._ConfirmarSaldoConciliado: boolean;
var
  vdataTemp: string;
  vCodCtrl: integer;
begin
  result := false;
  if (Application.MessageBox('Deseja confirmar o saldo conciliado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_NO) then
    exit;

  // Financeiro sendo fechado
  if vDadosIni.financeiroFechando(FBuscasGerais) then
    Exit;

  FBuscasGerais.Close;
  FBuscasGerais.SQL.Text := 'select max(data_sld) as max_data_sld from sal_ctrl ' +
    ' where codigo_ctrl = ' + IntToStr(FcdsControles.FieldByName('Cod. Controle').asinteger) +
    ' and cod_emp = ' + vDadosIni.codEmpresa;
  FBuscasGerais.Open;
  vdataTemp := FormatDateTime('dd/mm/yyyy', FBuscasGerais.FieldByName('max_data_sld').AsDateTime);
  vCodCtrl := FcdsControles.FieldByName('Cod. Controle').Asinteger;

  IniciaTransacao;
//  FSaldoCtrl.close;
//  FSaldoCtrl.sql.text := 'update sal_ctrl set SALDO_CONC = :pSALDO_CONC ,' +
//    ' SALDO_BANCO=:pSALDO_BANCO ' +
//    ' where codigo_ctrl = ' + inttostr(FcdsControles.FieldByName('Cod. Controle').Asinteger) +
//    ' and data_sld = ' + quotedstr(FormatDateTime('mm/dd/yyyy', FBuscasGerais.FieldByName('max_data_sld').AsDateTime)) + ' and cod_emp = ' + vDadosIni.codEmpresa;
//  FSaldoCtrl.ParamByName('pSALDO_CONC').AsFloat :=FsaldoBanco;
//  //FsaldoCaixa;
//  FSaldoCtrl.ParamByName('pSALDO_BANCO').AsFloat :=FsaldoBanco;
//  //FsaldoCaixa;
//  FSaldoCtrl.Prepare;
//  FSaldoCtrl.ExecSQL;

  FSaldoCtrl.close;
  FSaldoCtrl.sql.text := 'update sal_ctrl set CONC_BANC = ''S'', SALDO_CONC = :pSALDO_CONC ' +
    ' where codigo_ctrl = ' + inttostr(FcdsControles.FieldByName('Cod. Controle').Asinteger) +
    ' and data_sld = ' + quotedstr(FormatDateTime('mm/dd/yyyy', FBuscasGerais.FieldByName('max_data_sld').AsDateTime)) + ' and cod_emp = ' + vDadosIni.codEmpresa;
  FSaldoCtrl.ParamByName('pSALDO_CONC').AsFloat :=FsaldoBanco;
  //FsaldoCaixa;
  FSaldoCtrl.Prepare;
  FSaldoCtrl.ExecSQL;

  if vDadosIni.vConcBanc.vHabilitarConcBanc then
  begin
    FSaldoCtrl.close;
    FSaldoCtrl.sql.text := ' select codigo_ctrl, data_conf_sald_banc from controles ' +
      ' where codigo_ctrl = ' + inttostr(FcdsControles.FieldByName('Cod. Controle').Asinteger) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    FSaldoCtrl.Open;

    if ((FSaldoCtrl.FieldByName('data_conf_sald_banc').IsNull)
      or (vDadosIni.diaFFinanceiro + 1 > FSaldoCtrl.FieldByName('data_conf_sald_banc').AsDateTime)) then
    begin
      FSaldoCtrl.close;
      FSaldoCtrl.sql.text := ' update controles set ' +
      	' data_conf_sald_banc = :data_conf_sald_banc ' +
        ' where codigo_ctrl = :codigo_ctrl and codigo_emp = :codigo_emp ';
      FSaldoCtrl.ParamByName('data_conf_sald_banc').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      FSaldoCtrl.ParamByName('codigo_ctrl').AsInteger := FcdsControles.FieldByName('Cod. Controle').Asinteger;
      FSaldoCtrl.ParamByName('codigo_emp').AsInteger := StrToInt(vDadosIni.codEmpresa);
      FSaldoCtrl.Prepare;
      FSaldoCtrl.ExecSQL;
    end;
  end;

  Result := CommitaTransacao;
  if Result then
  begin
    _abreControles;
    vDadosIni.GravaAuditoria('LANC026', 'CONFIRMAR', 'SUCESSO CTRL: ' + inttostr(vCodCtrl) + ' DATA: ' + vdataTemp, 'SAL_CTRL', inttostr(vCodCtrl), FBuscasGerais);
    Application.MessageBox('Confirmação do saldo realizada!', 'Atenção', MB_ICONINFORMATION + MB_OK);
  end
  else
    vDadosIni.GravaAuditoria('LANC026', 'CONFIRMAR', 'FALHA CTRL: ' + inttostr(vCodCtrl) + ' DATA: ' + vdataTemp, 'SAL_CTRL', inttostr(vCodCtrl), FBuscasGerais);
end;

procedure TConciliacaoBanc._desmarcarTodos(pDataset: TDataSet);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

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

procedure TConciliacaoBanc._marcaDesmarcaLinha(pDataset: TDataSet);
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

procedure TConciliacaoBanc._marcarTodos(pDataset: TDataSet);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

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

{ TEmpresasUnficadas }

constructor TEmpresasUnificadas.create;
begin
  DataSet := TClientDataSet(dtmLancamentos.cdsEmpresasUnificadas);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
end;

function TEmpresasUnificadas._abreTodosEmpresas: Boolean;
begin
 Result := montaSelect(' select cod_empresa, (identificacao_emp ||'' - ''|| cgc_emp) identificacao_emp from empresa ' +
  ' where codigo_unificadora = ' + vDadosIni.codEmpresa +
  ' and financeiro_unificado = ''S'' ' +
  ' order by cod_empresa');
end;

function TEmpresasUnificadas._BuscarEmpresas(vCodEmp: Integer): Boolean;
begin
 Result := False;

 buscas.Close;
 buscas.SQL.Text := ' select cod_empresa from empresa ' +
  ' where codigo_unificadora = ' + vDadosIni.codEmpresa +
  ' and financeiro_unificado = ''S'' ';
 buscas.Open;
 buscas.FetchAll;


 buscas.First;
 while not buscas.Eof do
 begin
   if buscas.FieldByName('COD_EMPRESA').AsInteger = vCodEmp then
   begin
     Result := True;
     Break;
   end;
   buscas.Next;
 end;
 buscas.Close;
end;

{ TContrapartida }

constructor TContrapartida.create;
begin
  if dtmLancamentos = nil then
    dtmLancamentos := TdtmLancamentos.Create(dtmLancamentos);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
  Rdp := TRdPrint(dtmLancamentos.RDprint1);
end;

procedure TContrapartida.imprimirLancamento(pCodContrapartida: Integer);
var
  buscas2: TIBQuery;
  vTitulo, vCodCtrl, vpag: integer;
  vtot: currency;
  vDataLanc: TDateTime;
  vLinha: integer;
  vtipctp: string;

  procedure CabNovaPagina;
  begin
  	if vpag > 0 then
     Rdp.Novapagina;
    vLinha := 2;
    Rdp.ImpF(vLinha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
    vLinha := vLinha + 1;
    Rdp.ImpF(vLinha, 1, 'RELATORIO MOVIMENTACAO DA CONTRAPARTIDA', [normal, negrito]);
    vLinha := vLinha + 1;
    Rdp.ImpF(vLinha, 1, 'CONTRAPARTIDA Nº ' + IntToStr(pCodContrapartida) + ' DE: ' + datetostr(vDataLanc), [normal, negrito]);
    vpag := vpag + 1;
    Rdp.ImpD(vLinha, 133, 'PAG: ' + vDadosIni.StrZero(vpag, 3), [normal, negrito]);
    vLinha := vLinha + 2;
  end;
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  if not vDadosIni.PesqPros('LANC039', 'IMPRIMIR', 'LANC CONTRAPARTIDA ' + IntToStr(pCodContrapartida), 'LANCAMENTOS',
     '', buscas, true) then
    Exit;

  buscas.Close;
  buscas.SQL.Text := ' select cod_lanc, tipo_l, data from lancamentos ' +
  	 ' where cod_lanc = ' + IntToStr(pCodContrapartida) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if buscas.IsEmpty then
    exit;

  vDataLanc := buscas.FieldByName('DATA').AsDateTime;


  vpag := 0;
  //Inicia a Impressão.
  if not vDadosIni.ModImp(Rdp) then
    exit;
  Rdp.FonteTamanhoPadrao := S17cpp; 
  Rdp.TamanhoQteColunas := 132;
  Rdp.TamanhoQteLinhas := 70;
  Rdp.CaptionSetup := 'Configurações de Impressão';
  rdp.OpcoesPreview.CaptionPreview := 'Relatório Movimentação da Contrapartida';
  rdp.TitulodoRelatorio := 'Relatorio Movimentacao da Contrapartida';
  vDadosIni._LimparVarSendEmail;
  rdp.OnSendMail := vDadosini._SendMailRdPrint;
  rdp.OpcoesPreview.Preview := true;
  if not Rdp.EstaAberto then
    Rdp.Abrir;

  try
    Screen.Cursor := crHourGlass;
    vtot := 0.00;
    CabNovaPagina;
    //  Rdp.PortaComunicacao := 'LPT1';
    //  if copy(dtmc.QrEmpresaTPIMPRE.value,1,1) = 'G' then
    //   Rdp.impressora:=Grafico;
    buscas2.close;
    buscas2.Sql.Text := ' SELECT * FROM Lancamentos l ' +
      ' inner join controles c on l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp ' +
      ' where l.cod_lanc = ' + IntToStr(pCodContrapartida) +
      ' and l.codigo_emp =  ' + vDadosIni.codEmpresa +
      ' order by l.codigo_ctrl';
    buscas2.open;
    buscas2.first;
    vCodCtrl := 0;
    while not buscas2.EOF do
    begin
       if vCodCtrl <> buscas2.FieldByName('Codigo_ctrl').AsInteger then
       begin
         vLinha := vLinha + 1;
         Rdp.FonteEstiloPadrao := [Snegrito];
         Rdp.Imp(vLinha, 1, ' CONTRAPARTIDA Nº ' + IntToStr(pCodContrapartida) + ' DE: ' + datetostr(vDataLanc));
         vLinha := vLinha + 1;
         Rdp.Imp(vLinha, 1, '* * ' + buscas2.FieldByName('Nome_ctrl').AsString + ' * * ');
         vLinha := vLinha + 1;
         Rdp.ImpF(vLinha, 1, 'Nº DOCUMENTO', [negrito]);
         Rdp.ImpF(vLinha, 15, 'HISTORICO', [negrito]);
         Rdp.ImpD(vLinha, 81, 'VALOR', [negrito]);
         Rdp.FonteEstiloPadrao := [];
         vCodCtrl := buscas2.FieldByName('Codigo_ctrl').AsInteger;
       end;
       vLinha := vLinha + 1;
       Rdp.Imp(vLinha, 1, buscas2.FieldByName('Ndoc_l').AsString);
       Rdp.Imp(vLinha, 15, copy(buscas2.FieldByName('Historico_l').AsString, 1, 50));
       Rdp.ImpD(vLinha, 81, format('%m', [buscas2.FieldByName('Valor_l').AsCurrency]), []);
       if buscas2.FieldByName('TIPO_L').AsString = 'S' then
       	vtot := vtot - buscas2.FieldByName('Valor_l').AsCurrency
       else
       	vtot := vtot + buscas2.FieldByName('Valor_l').AsCurrency;
       if vLinha >= 60 then
         CabNovaPagina;

      buscas2.next;
    end;
    vLinha := vLinha + 1;
    Rdp.Impd(vLinha, 133, 'TOTAL : ' + format('%m', [vtot]), [negrito]);
    vtot := 0.00;

    vLinha := vLinha + 2;
    Rdp.Imp(vLinha, 1, vDadosIni.Replicate('-', 132));
    vLinha := vLinha + 2;

    if trim(buscas.FieldByName('TIPO_L').AsString) = 'S' then
    begin
      buscas2.close;
      buscas2.Sql.Text := ' SELECT * FROM Lancamentos l ' +
        ' inner join controles c on l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp ' +
        ' where l.cod_contrapartida = ' + IntToStr(pCodContrapartida) +
        ' and l.codigo_emp =  ' + vDadosIni.codEmpresa +
        ' and l.tipo_l = ''E'' and c.docs = ''N'' ' +
        ' order by l.codigo_ctrl';
      buscas2.open;
      buscas2.first;

      if not buscas2.IsEmpty then
      begin
         vCodCtrl := 0;
         while not buscas2.EOF do
         begin
            if vCodCtrl <> buscas2.FieldByName('Codigo_ctrl').AsInteger then
            begin
              vLinha := vLinha + 1;
              Rdp.FonteEstiloPadrao := [Snegrito];
              vLinha := vLinha + 1;
              Rdp.Imp(vLinha, 1, '* * ' + buscas2.FieldByName('Nome_ctrl').AsString + ' * * ');
              vLinha := vLinha + 1;
              Rdp.ImpF(vLinha, 1, 'Nº DOCUMENTO', [negrito]);
              Rdp.ImpF(vLinha, 15, 'HISTORICO', [negrito]);
              Rdp.ImpD(vLinha, 81, 'VALOR', [negrito]);
              Rdp.FonteEstiloPadrao := [];
              vCodCtrl := buscas2.FieldByName('Codigo_ctrl').AsInteger;
            end;
            vLinha := vLinha + 1;
            Rdp.Imp(vLinha, 1, buscas2.FieldByName('Ndoc_l').AsString);
            Rdp.Imp(vLinha, 15, copy(buscas2.FieldByName('Historico_l').AsString, 1, 50));
            Rdp.ImpD(vLinha, 81, format('%m', [buscas2.FieldByName('Valor_l').AsCurrency]), []);
            if buscas2.FieldByName('TIPO_L').AsString = 'S' then
               vtot := vtot - buscas2.FieldByName('Valor_l').AsCurrency
            else
               vtot := vtot + buscas2.FieldByName('Valor_l').AsCurrency;
            if vLinha >= 60 then
              CabNovaPagina;

           buscas2.next;
         end;
         vLinha := vLinha + 1;
         if buscas2.IsEmpty then
          Rdp.Imp(vLinha, 1, '* * ' + buscas2.FieldByName('Nome_ctrl').AsString + ' * *');
         Rdp.Impd(vLinha, 133, 'TOTAL : ' + format('%m', [vtot]), [negrito]);
         vtot := 0.00;

         vLinha := vLinha + 2;
         Rdp.Imp(vLinha, 1, vDadosIni.Replicate('-', 132));
         vLinha := vLinha + 2;
      end;

      buscas.Close;
      buscas.Sql.text := 'select ch.codigo_ch, ch.codigo_ctrl, ctr.nome_ctrl, ch.nome_ch, ch.n_ch, ch.valor_ch from controle_cheque ch ' +
        ' inner join controles ctr on ctr.codigo_ctrl = ch.codigo_ctrl and ctr.codigo_emp = ch.codigo_emp ' +
        ' where ch.cod_contrapartida = ' + IntToStr(pCodContrapartida) +
        ' and ch.codigo_emp =' + vDadosIni.codEmpresa +
        ' order by ch.codigo_ctrl';
      buscas.open;
      buscas.First;
  //    vCodCtrl := 0;
      vTitulo := 0;
      while not buscas.EOF do
      begin
        if vTitulo = 0 then
        begin
          vLinha := vLinha + 1;
          Rdp.FonteEstiloPadrao := [Snegrito];
          vLinha := vLinha + 1;
          Rdp.Imp(vLinha, 1, '* * CHEQUES * *');
          vLinha := vLinha + 1;
          Rdp.Imp(vLinha, 1, 'NOME CLIENTE');
          Rdp.Imp(vLinha, 40, 'CONTROLE');
          Rdp.Imp(vLinha, 81, 'Nº CHEQUE');
          Rdp.ImpD(vLinha, 133, 'VALOR', []);
          Rdp.FonteEstiloPadrao := [];
          vTitulo := 1;
        end;
        vLinha := vLinha + 1;
  
        Rdp.Imp(vLinha, 1, buscas.FieldByName('Nome_ch').AsString);
        Rdp.Imp(vLinha, 40, buscas.FieldByName('nome_ctrl').AsString);
        Rdp.Imp(vLinha, 81, buscas.FieldByName('N_ch').AsString);

        Rdp.ImpD(vLinha, 133, format('%n', [buscas.FieldByName('Valor_ch').AsCurrency]), []);
        vtot := vtot + buscas.FieldByName('Valor_ch').AsCurrency;
        if vLinha >= 60 then
          CabNovaPagina;
        buscas.next;
      end;
      vLinha := vLinha + 1;
      if buscas.IsEmpty then
       Rdp.Imp(vLinha, 1, '* * CHEQUES * *');
      Rdp.ImpD(vLinha, 133, 'TOTAL : ' + format('%m', [vtot]), [negrito]);
      vtot := 0.00;

      vLinha := vLinha + 2;
      Rdp.Imp(vLinha, 1, vDadosIni.Replicate('-', 132));
      vLinha := vLinha + 2;

      buscas.Close;
      buscas.Sql.text := ' select cc.cod_cred, cc.codigo_ctrl, ctr.nome_ctrl, cc.nome_c, cc.n_doc_c, cc.valor_c from controle_creditos cc ' +
        ' inner join controles ctr on ctr.codigo_ctrl = cc.codigo_ctrl and ctr.codigo_emp = cc.codigo_emp ' +
        ' where cc.cod_contrapartida = ' + IntToStr(pCodContrapartida) +
        ' and cc.codigo_emp =' + vDadosIni.codEmpresa +
        ' union ' +
        ' select bx.seq_bxcred, bx.codigo_ctrl, ctr.nome_ctrl, bx.nome_c, bx.n_doc_c, bx.valor_quitado from baixa_creditos bx ' +
        ' inner join controles ctr on ctr.codigo_ctrl = bx.codigo_ctrl and ctr.codigo_emp = bx.codigo_emp ' +
        ' where bx.cod_contrapartida = ' + IntToStr(pCodContrapartida) +
        ' and bx.codigo_emp =' + vDadosIni.codEmpresa + ' and bx.tip_baixa =''P'' ' +
        ' order by 2 ';
      buscas.open;
      buscas.First;
  //    vCodCtrl := 0;
      vTitulo := 0;
      while not buscas.EOF do
      begin
        if vTitulo = 0 then
        begin
          vLinha := vLinha + 1;
          Rdp.FonteEstiloPadrao := [Snegrito];
          vLinha := vLinha + 1;
          Rdp.Imp(vLinha, 1, '* * CREDITOS * *');
          vLinha := vLinha + 1;
          Rdp.Imp(vLinha, 1, 'NOME CLIENTE');
          Rdp.Imp(vLinha, 40, 'CONTROLE');
          Rdp.Imp(vLinha, 81, 'Nº DOC');
          Rdp.ImpD(vLinha, 133, 'VALOR', []);
          Rdp.FonteEstiloPadrao := [];
          vTitulo := 1;
        end;
        vLinha := vLinha + 1;

        Rdp.Imp(vLinha, 1, buscas.FieldByName('Nome_c').AsString);
        Rdp.Imp(vLinha, 40, buscas.FieldByName('nome_ctrl').AsString);
        Rdp.Imp(vLinha, 81, buscas.FieldByName('N_doc_c').AsString);

        Rdp.ImpD(vLinha, 133, format('%n', [buscas.FieldByName('Valor_c').AsCurrency]), []);
        vtot := vtot + buscas.FieldByName('Valor_c').AsCurrency;
        if vLinha >= 60 then
          CabNovaPagina;
        buscas.next;
      end;
      vLinha := vLinha + 1;
      if buscas.IsEmpty then
       Rdp.Imp(vLinha, 1, '* * CREDITOS * *');
      Rdp.ImpD(vLinha, 133, 'TOTAL : ' + format('%m', [vtot]), [negrito]);
      vtot := 0.00;
    end
    else
    begin
      buscas2.close;
      buscas2.Sql.text := 'select ctp.*, ctr.nome_ctrl, c.desc_gr, ct.desc_dep from contas_a_pagar ctp ' +
        ' inner join controles ctr on ctr.codigo_ctrl = ctp.codigo_ctrl and ctr.codigo_emp = ctp.codigo_emp ' +
        ' inner join p_contas p on p.n_conta_plc =  ctp.n_conta_plc ' +
        ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
        ' left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct ' +
        ' left join depart_ct ct on ct.cod_dep = c.cod_dep ' +
        ' where ctp.cod_contrapartida = ' + IntToStr(pCodContrapartida) +
        ' and ctp.codigo_emp = ' + vDadosIni.codEmpresa + ' order by ctp.tipo_ctp, ctp.n_doc_ctp';
      vtipctp := '';
      buscas2.open;
      vLinha := vLinha + 1;
      Rdp.FonteEstiloPadrao := [Snegrito];
      Rdp.Imp(vLinha, 1, '* * CONTAS * *');
      vLinha := vLinha + 2;
      Rdp.Imp(vLinha, 1, 'NOME FORNECEDOR');
      Rdp.Imp(vLinha, 42, 'CONTROLE');
      Rdp.Imp(vLinha, 62, 'Nº DOC/REF');
      Rdp.Imp(vLinha, 95, 'DATA VENC.');
      Rdp.ImpD(vLinha, 133, 'VALOR DUPL', []);
      vlinha:=vlinha+1;
      Rdp.Imp(vLinha, 1, 'HISTORICO');
      Rdp.Imp(vLinha, 42, 'GRUPO');
      Rdp.Imp(vLinha, 68, 'DEPARTAMENTO');
      Rdp.FonteEstiloPadrao := [];
      while not buscas2.EOF do
      begin
        if vtipctp <> buscas2.fieldbyName('tipo_ctp').AsString then
        begin
          vLinha := vLinha + 1;
          Rdp.FonteEstiloPadrao := [Snegrito];
          vLinha := vLinha + 1;
          if vtipctp = 'D' then
            Rdp.Imp(vLinha, 1, buscas2.fieldbyName('tipo_ctp').AsString + ' * * DESPESAS * *')
          else
            Rdp.Imp(vLinha, 1, buscas2.fieldbyName('tipo_ctp').AsString + ' * * FORNECEDOR * *');
          Rdp.FonteEstiloPadrao := [];
          vCodCtrl := buscas2.fieldbyName('Codigo_ctrl').value;
        end;
        vLinha := vLinha + 1;
        Rdp.Imp(vLinha, 1, copy(buscas2.FieldByName('Nome_FOR_ctp').AsString, 1, 40));
        Rdp.Imp(vLinha, 42, copy(buscas2.FieldByName('Nome_ctrl').AsString, 1, 37));
        Rdp.Imp(vLinha, 62, copy(buscas2.FieldByName('N_doc_ctp').AsString, 1, 10)+' REF:'+
        copy(buscas2.fieldbyname('DTREFERENCIA').asstring,4,7));
        Rdp.Imp(vLinha, 95, buscas2.FieldByName('Data_venc_ctp').AsString);
        Rdp.ImpD(vLinha, 133, format('%n', [-buscas2.FieldByName('Valor_ctp').ascurrency]), []);
        vtot := vtot - buscas2.FieldByName('Valor_ctp').ascurrency;

        vlinha := vlinha + 1;
        Rdp.Imp(vLinha, 1, Copy(buscas2.FieldByName('historico_ctp').AsString, 1, 23));
        Rdp.Imp(vLinha, 42, Copy(buscas2.FieldByName('desc_gr').AsString, 1, 21) );
        Rdp.Imp(vLinha, 68, buscas2.FieldByName('desc_dep').AsString);

        if vLinha >= 60 then
          CabNovaPagina;
        buscas2.next;
      end;
      vLinha := vLinha + 1;
      Rdp.ImpD(vLinha, 133, 'TOTAL: ' + format('%m', [vtot]), [negrito]);
      vtot := 0.00;
    end;
    if Rdp.EstaAberto then
      Rdp.Fechar;
  finally
    buscas.Close;
    buscas2.Close;
    Screen.Cursor := crDefault;
  end;
 end;

function TContrapartida._estornarRecebimento(pCodContrapartida: Integer): Boolean;
var
  buscas2: TIBQuery;
begin
  try
    Result := false;

    vDadosIni.abreStatusProcessamento('', 'Validando dados');


   if not vDadosIni.PesqPros('LANC037', 'ESTORNAR', 'LANC CONTRAPARTIDA ' + IntToStr(pCodContrapartida), 'LANCAMENTOS',
     '', buscas, true) then
     Exit;

    buscas.Close;
    buscas.SQL.Text := ' select data from lancamentos ' +
        ' where cod_contrapartida = ' + IntToStr(pCodContrapartida) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if (buscas.FieldByName('DATA').AsDateTime <> (vDadosIni.diaFFinanceiro + 1)) then
    begin
      Application.MessageBox(PChar('Data do lançamento não corresponde a data do Financeiro' + #13 +
        'Data do lançamento: ' + FormatDateTime('dd/mm/yyyy', buscas.FieldByName('DATA').AsDateTime) + #13 +
        'Data do Financeiro: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro + 1)) , 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select count(*) valor from controle_cheque' +
      ' where cod_contrapartida = ' + IntToStr(pCodContrapartida) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa +
      ' and not datq_ch is null';
    buscas.Open;

    if buscas.FieldByName('valor').AsInteger > 0 then
    begin
      Application.MessageBox(PChar('Estorno não pode ser feito' + #13 +
        'Cheque(s) usado(s) na quitação da contrapartida já foi quitado ou devolvido'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select count(*) valor from baixa_creditos ' +
      ' where cod_contrapartida = ' + IntToStr(pCodContrapartida) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.FieldByName('valor').AsInteger > 0 then
    begin
      Application.MessageBox(PChar('Estorno não pode ser feito' + #13 +
        'Crédito(s) usado(s) na quitação da contrapartida já foi quitado ou devolvido'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select count(*) valor from controle_creditos' +
      ' where cod_contrapartida = ' + IntToStr(pCodContrapartida) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa +
      ' and not datq_c is null';
    buscas.Open;

    if buscas.FieldByName('valor').AsInteger > 0 then
    begin
      Application.MessageBox(PChar('Estorno não pode ser feito' + #13 +
        'Crédito(s) usado(s) na quitação da contrapartida já foi baixado ou devolvido'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;  
    end;

    buscas.Close;
    buscas.SQL.Text := 'select count(*) valor from contas_a_pagar' +
      ' where cod_contrapartida = ' + IntToStr(pCodContrapartida) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa +
      ' and not datq_ctp is null';
    buscas.Open;

    if buscas.FieldByName('valor').AsInteger > 0 then
    begin
      Application.MessageBox(PChar('Estorno não pode ser feito' + #13 +
        'Conta(s) a pagar usada(s) na quitação da contrapartida já foi baixada'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;  
    end;

    vDadosIni.abreStatusProcessamento('', 'Estornando contrapartida');

    buscas2 := TIBQuery.Create(Application);
  	 buscas2.Database := buscas.Database;
	 buscas2.Transaction := buscas.Transaction;

    buscas2.Close;
    buscas2.SQL.Text := ' select codigo_ch from controle_cheque ' +
      ' where codigo_emp = ' + vDadosIni.codEmpresa + ' and cod_contrapartida = ' + IntToStr(pCodContrapartida);
    buscas2.Open;

    buscas2.First;
    while not buscas2.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := ' delete from LANCCHEQUE' +
        ' where CODIGO_CH = ' + IntToStr(buscas2.FieldByName('CODIGO_CH').AsInteger) +
        ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      buscas2.Next;
    end;

    buscas2.Close;
    buscas2.SQL.Text := ' select cod_cred from controle_creditos ' +
      ' where codigo_emp = ' + vDadosIni.codEmpresa + ' and cod_contrapartida = ' + IntToStr(pCodContrapartida);
    buscas2.Open;

    buscas2.First;
    while not buscas2.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := ' delete from CREDITOS_LANC' +
        ' where COD_CRED = ' + IntToStr(buscas2.FieldByName('COD_CRED').AsInteger) +
        ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      buscas2.Next;
    end;

    buscas.Close;
    buscas.SQL.Text := ' delete from lancamentos ' +
        ' where codigo_emp = ' + vDadosIni.codEmpresa + ' and cod_contrapartida = ' + IntToStr(pCodContrapartida);
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := ' delete from controle_creditos ' +
        ' where codigo_emp = ' + vDadosIni.codEmpresa + ' and cod_contrapartida = ' + IntToStr(pCodContrapartida);
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := ' delete from controle_cheque ' +
        ' where codigo_emp = ' + vDadosIni.codEmpresa + ' and cod_contrapartida = ' + IntToStr(pCodContrapartida);
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := ' delete from contas_a_pagar ' +
        ' where codigo_emp = ' + vDadosIni.codEmpresa + ' and cod_contrapartida = ' + IntToStr(pCodContrapartida);
    buscas.ExecSQL;

    buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('LANC037', 'ESTORNAR', 'SUCESSO LANC CONTRAPARTIDA ' + IntToStr(pCodContrapartida), 'LANCAMENTOS', '', buscas);

    Result := true;
  except
    on e: exception do
    begin
      Result := False;
      vDadosIni.GravaAuditoria('LANC037', 'ESTORNAR', 'FALHA LANC CONTRAPARTIDA ' + IntToStr(pCodContrapartida), 'LANCAMENTOS', '', buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('procedure TLancamentos._marcarDesmarcarLancamentosComoVenda Erro: ' + e.Message);
    end;
  end;
end;

{ TEstornarRecibo }

function TEstornarRecibo.abreFormReciboValeCompra: boolean;
var
  hdTemp: THandle;
  formulario: TForm;
begin
   formulario := Funcoes.AbreForm('pkRecibo','TFrmCadRecibo', hdTemp);
  try
//    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

constructor TEstornarRecibo.create;
begin
  DataSet := TClientDataSet(dtmLancamentos.cdsRecibosEstornar);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
end;

function TEstornarRecibo.estornarValeCompra(pCodigo: Integer; pCodEmpresa: Integer): boolean;
var
  nValorRecibo, nTpBaixa: string;
  vValorRecibo: Double;
  buscas2: TIBQuery;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('LANC044', 'ESTORNAR', '', 'LANCAMENTOS',
    	IntToStr(pCodigo), buscas, False) then
    exit;

    if Application.MessageBox('Tem Certeza que deseja estornar o Lançamento?',
     'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
      exit;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas2.Close;
    buscas2.SQL.Text := ' select r.nrecibo, r.cod_empresa as cod_empresa_rec, ' +
      ' h.cod_empresa, h.ndocant, h.valor_baixa, r.valor, tp_baixa, r.status_rec ' +
      ' from hist_rec h ' +
      ' inner join recibos r on r.nrecibo = h.nrecibo and r.cod_empresa = h.cod_empresa' +
      ' where h.ndocant = ' + IntToStr(pCodigo) +
      ' and h.tp_doc_baixa = ''LNC'' ' +
      ' and h.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas2.Open;

    nValorRecibo := '0';
    if not buscas2.IsEmpty then
    begin
      buscas2.First;

      while not buscas2.Eof do
      begin
        nTpBaixa := buscas2.FieldByName('TP_BAIXA').AsString;

        if nTpBaixa = 'P' then
        begin
          if (trim(buscas2.FieldByName('STATUS_REC').AsString) = 'RECEBIDO') then
            vValorRecibo := buscas2.FieldByName('VALOR_BAIXA').AsFloat
          else
            vValorRecibo := buscas2.FieldByName('VALOR_BAIXA').AsFloat + buscas2.FieldByName('VALOR').AsFloat;

          nValorRecibo := StringReplace(FloatToStr(vValorRecibo), ',', '.', [rfReplaceAll]);
        end;
        buscas.Close;
        buscas.SQL.Text := 'update hist_rec' +
          ' set tp_baixa = ''P''' +
          ' where nrecibo = ' + IntToStr(buscas2.FieldByName('nrecibo').AsInteger) +
          ' and cod_empresa = ' + IntToStr(buscas2.FieldByName('cod_empresa').AsInteger);
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.Text := 'delete from hist_rec ' +
          ' where nrecibo =' + IntToStr(buscas2.FieldByName('nrecibo').AsInteger) +
          ' and tp_doc_baixa = ''LNC'' ' +
          ' and ndocant=' + IntToStr(pCodigo) +
          ' and cod_empresa = ' + IntToStr(buscas2.FieldByName('cod_empresa').AsInteger);
        buscas.Prepare;
        buscas.ExecSQL;

        buscas.Close;
        if nTpBaixa ='P' then
          buscas.SQL.Text := 'update recibos set status_rec = null, data_baixa = null, valor = ' + nValorRecibo + ' ' +
            ' where nrecibo =' + IntToStr(buscas2.FieldByName('nrecibo').AsInteger) +
            ' and cod_empresa = ' + IntToStr(buscas2.FieldByName('cod_empresa_rec').AsInteger)
        else
          buscas.SQL.Text := 'update recibos set status_rec = null, data_baixa = null ' +
            ' where nrecibo =' + IntToStr(buscas2.FieldByName('nrecibo').AsInteger) +
            ' and cod_empresa = ' + IntToStr(buscas2.FieldByName('cod_empresa_rec').AsInteger);
        buscas.Prepare;
        buscas.ExecSQL;

        buscas2.Next;
      end;
    end;
    buscas.Close;
    buscas.SQL.Text := 'delete from lancamentos ' +
      ' where cod_lanc =' + IntToStr(pCodigo) +
      ' and codigo_emp = ' + IntToStr(pCodEmpresa);
    buscas.Prepare;
    buscas.ExecSQL;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('LANC044', 'ESTORNAR', 'SUCESSO', 'LANCAMENTOS',
    	IntToStr(pCodigo), buscas);

    dataSet.Refresh;
    cadLanc.Refresh;  
    Application.MessageBox('Lançamento estornado com sucesso!', 'Atenção', MB_OK + MB_ICONINFORMATION);

    Result := true;
  except
    on e: exception do
    begin
      vDadosIni.GravaAuditoria('LANC044', 'ESTORNAR', 'FALHA', 'LANCAMENTOS',
    	IntToStr(pCodigo), buscas);
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TEstornarRecibo.estornarValeCompra Erro: ' + e.Message);
    end;
  end;
end;

function TEstornarRecibo._abreEstornarRecibo(pCodRecibo: Integer = 0): Boolean;
begin
  if vDadosIni.vRecibo.HabRecPorDepart then
    result := montaSelect('select ' +
      ' case when (trim(coalesce(r.num_rec_dep, '''')) <> '''') then r.num_rec_dep ' +
      ' else r.nrecibo end num_rec_dep, r.*, ' +
      ' (select case when (count(ndoc) > 0) then 1 else 0 end formas ' +
      ' from existe_formas (r.nrecibo, ''REC'', r.cod_empresa)) formas ' +
      ' from recibos r ' +
      ' where ((r.status_rec is null) or (r.status_rec = '''')) ' +
      vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
      ' and r.cod_empresa = ' + vDadosIni.codEmpresa,
      ' and r.cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
      vDadosIni.IfThen(pCodRecibo <> 0, ' and r.nrecibo = ' + IntToStr(pCodRecibo), '') +
      ' and r.ativo = 1' +
      ' order by r.nome_dev, r.data_rec desc')
  else
    result := montaSelect('select r.*, ' +
      ' (select case when (count(ndoc) > 0) then 1 else 0 end formas ' +
      ' from existe_formas (r.nrecibo, ''REC'', r.cod_empresa)) formas ' +
      ' from recibos r ' +
      ' where ((r.status_rec is null) or (r.status_rec = '''')) ' +
      vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
      ' and r.cod_empresa = ' + vDadosIni.codEmpresa,
      ' and r.cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
      vDadosIni.IfThen(pCodRecibo <> 0, ' and r.nrecibo = ' + IntToStr(pCodRecibo), '') +
      ' and r.ativo = 1 ' +
      ' order by r.nome_dev, r.data_rec desc');
end;

function TEstornarRecibo._abreEstornarReciboLanc(pCodLanc,
  pCodEmpresa: Integer): Boolean;
begin
  if vDadosIni.vRecibo.HabRecPorDepart then
    result := montaSelect('select h.valor_baixa as valor, ' +
      ' case when (trim(coalesce(r.num_rec_dep, '''')) <> '''') then r.num_rec_dep ' +
      ' else r.nrecibo end num_rec_dep, r.*, ' +
      ' (select case when (count(ndoc) > 0) then 1 else 0 end formas ' +
      ' from existe_formas (r.nrecibo, ''REC'', r.cod_empresa)) formas ' +
      ' from recibos r ' +
      ' inner join hist_rec h on h.nrecibo = r.nrecibo and h.cod_empresa = r.cod_empresa ' +
      ' where ' + vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
      ' and r.cod_empresa = ' + vDadosIni.codEmpresa, ' and r.cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
      ' and h.ndocant = ' + IntToStr(pCodLanc) + ' and h.tp_doc_baixa = ''LNC'' ' +
      ' and r.ativo = 1' +
      ' order by r.nome_dev, r.data_rec desc')
  else
    result := montaSelect('select h.valor_baixa as valor, r.*, ' +
      ' (select case when (count(ndoc) > 0) then 1 else 0 end formas ' +
      ' from existe_formas (r.nrecibo, ''REC'', r.cod_empresa)) formas ' +
      ' from recibos r ' +
      ' inner join hist_rec h on h.nrecibo = r.nrecibo and h.cod_empresa = r.cod_empresa ' +
      ' where ' + vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
      ' r.cod_empresa = ' + vDadosIni.codEmpresa, ' r.cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
      ' and h.ndocant = ' + IntToStr(pCodLanc) + ' and h.tp_doc_baixa = ''LNC'' ' +
      ' and r.ativo = 1 ' +
      ' order by r.nome_dev, r.data_rec desc');
end;

procedure TEstornarRecibo._marcaDesmarcaLinha(DtSet: TDataSet);
begin
  if DtSet.IsEmpty then
    exit;

  DtSet.Edit;
  if DtSet.FieldByName('SEL').AsString = 'S' then
  begin
    DtSet.FieldByName('SEL').AsString := '';
    vReciboSelecionados := vReciboSelecionados - 1;
  end
  else
  begin
     buscas.Close;
     buscas.SQL.Text := ' select case when (count(ndoc) > 0) then 1 else 0 end formas from existe_formas (:ndoc, :tipo, :cod_empresa); ';
     buscas.ParamByName('ndoc').AsInteger := dataSet.FieldByName('nrecibo').AsInteger;
     buscas.ParamByName('tipo').AsString := 'REC';
     buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
     buscas.Open;

     if (buscas.FieldByName('formas').AsInteger <= 0)
     	and (DtSet.FieldByName('nrecibo').AsInteger < 100000) then //Não fazer nada em caso de vale compra
       Application.MessageBox(pchar('Recibo sem recebimento!'), 'Atenção', MB_ICONERROR + MB_OK)
     else
     begin
       DtSet.FieldByName('SEL').AsString := 'S';
       vReciboSelecionados := vReciboSelecionados + 1;
     end;
  end;
  DtSet.Post;
end;

{ TLancamentosFP }

constructor TLancamentosFP.create;
begin
  DataSet := TClientDataSet(dtmLancamentos.cdsLancFP);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
end;

function TLancamentosFP._abreLancamentosFP(
	pCodLanc: Integer; pDataLanc: TDateTime;
  pLotePagamento: Integer; pLoteEntrada: Integer; pLoteSaida: Integer;
  pCodContrLanc: Integer; pCodContrCtp: Integer): Boolean;
begin
	Result := montaSelect(
  	' select ' +
    ' ''FP'' seqtipo, ' +
    ' formpagamento.seqform, ' +
    IntToStr(pCodLanc) + ' n_processamento, ' +
  	' formpagamento.nrequisicao, ' +
    ' coalesce(formpagamento.ndoc, formpagamento.nrequisicao) ndoc, ' +
    ' formpagamento.tpdocs, ' +
    ' formpagamento.cod_controle, ' +
    ' controles.nome_ctrl, ' +
    ' formpagamento.data_mov, ' +
    ' formpagamento.data_venc, ' +
    ' formpagamento.valordoc, ' +
    ' formpagamento.valordoc as valor_corr, ' +
    ' null status, ' +
    ' null datq, ' +
    ' formpagamento.cod_cliente, ' +
    ' clientes.cpfcgc, ' +
    ' clientes.nome_cliente, ' +
    ' clientes.razao from lancamentos ' +
    ' inner join formpagamento on formpagamento.n_processamento = lancamentos.cod_lanc and formpagamento.cod_empresa = lancamentos.cod_emp_mult ' +
    ' left join controles on controles.codigo_ctrl = formpagamento.cod_controle and controles.codigo_emp = formpagamento.cod_empresa ' +
    ' left join clientes on clientes.cod_cliente = formpagamento.cod_cliente and clientes.cod_empresa = formpagamento.cod_empresa ' +
    ' where lancamentos.cod_lanc = ' + IntToStr(pCodLanc) +
    ' and lancamentos.codigo_emp = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((pCodContrLanc <= 0) and (pCodContrCtp <= 0) and (pLoteEntrada <= 0) and (pLoteSaida <= 0),
      ' union all ' +
      ' select ' +
      ' ''CH'' seqtipo, ' +
      ' controle_cheque.codigo_ch, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
      ' controle_cheque.n_doc_v, ' +
      ' controle_cheque.n_doc_v, ' +
      ' controle_cheque.tp_doc_v, ' +
      ' controle_cheque.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_cheque.data_rec, ' +
      ' controle_cheque.data_venc, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.status_ch, ' +
      ' controle_cheque.datq_ch, ' +
      ' controle_cheque.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_cheque.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_cheque.nome_ch) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_cheque.razao) razao from lanccheque ' +
      ' inner join controle_cheque on controle_cheque.codigo_ch = lanccheque.codigo_ch and controle_cheque.codigo_emp = lanccheque.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_cheque.codigo_ctrl and controles.codigo_emp = controle_cheque.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_cheque.cod_cliente and clientes.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where lanccheque.cod_lanc = ' + IntToStr(pCodLanc) +
      ' and lanccheque.codigo_emp = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CC'' seqtipo, ' +
      ' controle_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
      ' controle_creditos.n_doc_v, ' +
      ' controle_creditos.n_doc_c, ' +
      ' controle_creditos.tp_doc_v, ' +
      ' controle_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_creditos.data_rec_c, ' +
      ' controle_creditos.data_venc_c, ' +
      ' coalesce(controle_creditos.valor_c, controle_creditos.valor_corr) valor_c, ' +
      ' coalesce(controle_creditos.valor_corr, controle_creditos.valor_c) valor_corr, ' +
      ' controle_creditos.status_c, ' +
      ' controle_creditos.datq_c, ' +
      ' controle_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_creditos.razao) razao from creditos_lanc ' +
      ' inner join controle_creditos on controle_creditos.cod_cred = creditos_lanc.cod_cred and controle_creditos.codigo_emp = creditos_lanc.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_creditos.codigo_ctrl and controles.codigo_emp = controle_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_creditos.cod_cliente and clientes.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where creditos_lanc.cod_lanc = ' + IntToStr(pCodLanc) +
      ' and creditos_lanc.codigo_emp = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CC'' seqtipo, ' +
      ' baixa_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' baixa_creditos.n_doc_v, ' +
      ' baixa_creditos.n_doc_c, ' +
      ' baixa_creditos.tp_doc_v, ' +
      ' baixa_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' baixa_creditos.data_rec_c, ' +
      ' baixa_creditos.data_venc_c, ' +
      ' coalesce(baixa_creditos.valor_c, baixa_creditos.valor_corr) valor_c, ' +
      ' coalesce(baixa_creditos.valor_corr, baixa_creditos.valor_c) valor_corr, ' +
      ' ''QUITADO'' status_c, ' +
      ' baixa_creditos.datq_c, ' +
      ' baixa_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, baixa_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, baixa_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, baixa_creditos.razao) razao from creditos_lanc ' +
      '	inner join baixa_creditos on baixa_creditos.cod_cred = creditos_lanc.cod_cred and baixa_creditos.codigo_emp = creditos_lanc.codigo_emp ' +
      ' inner join empresa on empresa.cod_empresa = baixa_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = baixa_creditos.codigo_ctrl and controles.codigo_emp = baixa_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = baixa_creditos.cod_cliente and clientes.cod_empresa = baixa_creditos.cod_emp_mult ' +
      ' where creditos_lanc.cod_lanc = ' + IntToStr(pCodLanc) +
      ' and creditos_lanc.codigo_emp = ' + vDadosIni.codEmpresa +
      ' and baixa_creditos.tp_operacao = ''P'' ', '') +
    vDadosIni.IfThen(((pCodContrLanc <= 0) and (pCodContrCtp <= 0)) and (pLotePagamento > 0),
      ' union all ' +
      ' select ' +
      ' ''CTP'' seqtipo, ' +
      ' contas_a_pagar.cod_contrp, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' case when (contas_a_pagar.num_nota_nfe > 0) then ' +
      '				 contas_a_pagar.num_nota_nfe ' +
      '			 when (contas_a_pagar.nped > 0) then ' +
      '				 contas_a_pagar.nped ' +
      '      else ' +
      '				 null ' +
      ' end n_doc_v, ' +
      ' null n_doc_c, ' +
      ' case when (contas_a_pagar.num_nota_nfe > 0) then ' +
      '				 ''NF'' ' +
      '			 when (contas_a_pagar.nped > 0) then ' +
      '        contas_a_pagar.tipo_nped ' +
      '			 else ' +
      '				 null ' +
      '	end tp_doc_v, ' +
      ' contas_a_pagar.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' contas_a_pagar.data_ent_ctp, ' +
      ' contas_a_pagar.data_venc_ctp, ' +
      ' contas_a_pagar.valor_ctp, ' +
      ' contas_a_pagar.valor_ctp, ' +
      ' contas_a_pagar.status_ctp, ' +
      ' contas_a_pagar.datq_ctp, ' +
      ' contas_a_pagar.cod_forn_nfe, ' +
      ' coalesce(clientes.cpfcgc, contas_a_pagar.cpf_cgc_f) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, contas_a_pagar.nome_for_ctp) nome_cliente, ' +
      ' coalesce(clientes.razao, contas_a_pagar.nome_for_ctp) razao from contas_a_pagar ' +
      ' inner join empresa on empresa.cod_empresa = contas_a_pagar.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = contas_a_pagar.codigo_ctrl and controles.codigo_emp = contas_a_pagar.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = contas_a_pagar.cod_forn_nfe and clientes.cod_empresa = contas_a_pagar.cod_emp_mult ' +
      ' where contas_a_pagar.lote = ' + IntToStr(pLotePagamento) +
      ' and contas_a_pagar.datq_ctp = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataLanc)) +
      ' and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, contas_a_pagar.codigo_emp) = ' + vDadosIni.codEmpresa, '') +
    vDadosIni.IfThen(((pCodContrLanc <= 0) and (pCodContrCtp <= 0)) and ((pLoteEntrada > 0) or (pLoteSaida > 0)),
      ' union all ' +
      ' select ' +
      ' ''CH'' seqtipo, ' +
    	' controle_cheque.codigo_ch, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' controle_cheque.n_doc_v, ' +
      ' controle_cheque.n_doc_v, ' +
      ' controle_cheque.tp_doc_v, ' +
      ' controle_cheque.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_cheque.data_rec, ' +
      ' controle_cheque.data_venc, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.status_ch, ' +
      ' controle_cheque.datq_ch, ' +
      ' controle_cheque.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_cheque.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_cheque.nome_ch) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_cheque.razao) razao from controle_cheque ' +
      ' inner join empresa on empresa.cod_empresa = controle_cheque.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_cheque.codigo_ctrl and controles.codigo_emp = controle_cheque.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_cheque.cod_cliente and clientes.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where controle_cheque.lote_quit = ' + IntToStr(vDadosIni.IfThen(pLoteEntrada > 0, pLoteEntrada, pLoteSaida)) +
      ' and controle_cheque.datq_ch = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataLanc)) +
      '	and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, controle_cheque.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CC'' seqtipo, ' +
      ' controle_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' controle_creditos.n_doc_v, ' +
      ' controle_creditos.n_doc_c, ' +
      ' controle_creditos.tp_doc_v, ' +
      ' controle_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_creditos.data_rec_c, ' +
      ' controle_creditos.data_venc_c, ' +
      ' coalesce(controle_creditos.valor_c, controle_creditos.valor_corr) valor_c, ' +
      ' coalesce(controle_creditos.valor_corr, controle_creditos.valor_c) valor_corr, ' +
      ' controle_creditos.status_c, ' +
      ' controle_creditos.datq_c, ' +
      ' controle_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_creditos.razao) razao from controle_creditos ' +
      ' inner join empresa on empresa.cod_empresa = controle_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_creditos.codigo_ctrl and controles.codigo_emp = controle_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_creditos.cod_cliente and clientes.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where controle_creditos.lote_quit = ' + IntToStr(vDadosIni.IfThen(pLoteEntrada > 0, pLoteEntrada, pLoteSaida)) +
      ' and controle_creditos.datq_c = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataLanc)) +
      ' and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, controle_creditos.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CC'' seqtipo, ' +
      ' baixa_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' baixa_creditos.n_doc_v, ' +
      ' baixa_creditos.n_doc_c, ' +
      ' baixa_creditos.tp_doc_v, ' +
      ' baixa_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' baixa_creditos.data_rec_c, ' +
      ' baixa_creditos.data_venc_c, ' +
      ' coalesce(baixa_creditos.valor_c, baixa_creditos.valor_corr) valor_c, ' +
      ' coalesce(baixa_creditos.valor_corr, baixa_creditos.valor_c) valor_corr, ' +
      ' ''QUITADO'' status_c, ' +
      ' baixa_creditos.datq_c, ' +
      ' baixa_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, baixa_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, baixa_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, baixa_creditos.razao) razao from baixa_creditos ' +
      ' inner join empresa on empresa.cod_empresa = baixa_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = baixa_creditos.codigo_ctrl and controles.codigo_emp = baixa_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = baixa_creditos.cod_cliente and clientes.cod_empresa = baixa_creditos.cod_emp_mult ' +
      ' where baixa_creditos.lote_quit = ' + IntToStr(vDadosIni.IfThen(pLoteEntrada > 0, pLoteEntrada, pLoteSaida)) +
      ' and baixa_creditos.datq_c = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pDataLanc)) +
      ' and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, baixa_creditos.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' and baixa_creditos.tp_operacao = ''P'' ', '') +
    vDadosIni.IfThen((pCodContrLanc > 0),
    	' union all ' +
      ' select ' +
      ' ''CTP'' seqtipo, ' +
      ' contas_a_pagar.cod_contrp, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' case when (contas_a_pagar.num_nota_nfe > 0) then ' +
      '				 contas_a_pagar.num_nota_nfe ' +
      '			 when (contas_a_pagar.nped > 0) then ' +
      '				 contas_a_pagar.nped ' +
      '      else ' +
      '				 null ' +
      ' end n_doc_v, ' +
      ' null n_doc_c, ' +
      ' case when (contas_a_pagar.num_nota_nfe > 0) then ' +
      '				 ''NF'' ' +
      '			 when (contas_a_pagar.nped > 0) then ' +
      '        contas_a_pagar.tipo_nped ' +
      '			 else ' +
      '				 null ' +
      '	end tp_doc_v, ' +
      ' contas_a_pagar.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' contas_a_pagar.data_ent_ctp, ' +
      ' contas_a_pagar.data_venc_ctp, ' +
      ' contas_a_pagar.valor_ctp, ' +
      ' contas_a_pagar.valor_ctp, ' +
      ' contas_a_pagar.status_ctp, ' +
      ' contas_a_pagar.datq_ctp, ' +
      ' contas_a_pagar.cod_forn_nfe, ' +
      ' coalesce(clientes.cpfcgc, contas_a_pagar.cpf_cgc_f) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, contas_a_pagar.nome_for_ctp) nome_cliente, ' +
      ' coalesce(clientes.razao, contas_a_pagar.nome_for_ctp) razao from contas_a_pagar ' +
      ' inner join empresa on empresa.cod_empresa = contas_a_pagar.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = contas_a_pagar.codigo_ctrl and controles.codigo_emp = contas_a_pagar.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = contas_a_pagar.cod_forn_nfe and clientes.cod_empresa = contas_a_pagar.cod_emp_mult ' +
      ' where contas_a_pagar.cod_contrapartida = ' + IntToStr(pCodContrLanc) +
      ' and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, contas_a_pagar.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CH'' seqtipo, ' +
    	' controle_cheque.codigo_ch, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' controle_cheque.n_doc_v, ' +
      ' controle_cheque.n_doc_v, ' +
      ' controle_cheque.tp_doc_v, ' +
      ' controle_cheque.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_cheque.data_rec, ' +
      ' controle_cheque.data_venc, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.status_ch, ' +
      ' controle_cheque.datq_ch, ' +
      ' controle_cheque.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_cheque.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_cheque.nome_ch) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_cheque.razao) razao from controle_cheque ' +
      ' inner join empresa on empresa.cod_empresa = controle_cheque.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_cheque.codigo_ctrl and controles.codigo_emp = controle_cheque.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_cheque.cod_cliente and clientes.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where controle_cheque.cod_contrapartida = ' + IntToStr(pCodContrLanc) +
      '	and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, controle_cheque.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CC'' seqtipo, ' +
      ' controle_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' controle_creditos.n_doc_v, ' +
      ' controle_creditos.n_doc_c, ' +
      ' controle_creditos.tp_doc_v, ' +
      ' controle_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_creditos.data_rec_c, ' +
      ' controle_creditos.data_venc_c, ' +
      ' coalesce(controle_creditos.valor_c, controle_creditos.valor_corr) valor_c, ' +
      ' coalesce(controle_creditos.valor_corr, controle_creditos.valor_c) valor_corr, ' +
      ' controle_creditos.status_c, ' +
      ' controle_creditos.datq_c, ' +
      ' controle_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_creditos.razao) razao from controle_creditos ' +
      ' inner join empresa on empresa.cod_empresa = controle_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_creditos.codigo_ctrl and controles.codigo_emp = controle_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_creditos.cod_cliente and clientes.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where controle_creditos.cod_contrapartida = ' + IntToStr(pCodContrLanc) +
      ' and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, controle_creditos.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CC'' seqtipo, ' +
      ' baixa_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' baixa_creditos.n_doc_v, ' +
      ' baixa_creditos.n_doc_c, ' +
      ' baixa_creditos.tp_doc_v, ' +
      ' baixa_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' baixa_creditos.data_rec_c, ' +
      ' baixa_creditos.data_venc_c, ' +
      ' coalesce(baixa_creditos.valor_c, baixa_creditos.valor_corr) valor_c, ' +
      ' coalesce(baixa_creditos.valor_corr, baixa_creditos.valor_c) valor_corr, ' +
      ' ''QUITADO'' status_c, ' +
      ' baixa_creditos.datq_c, ' +
      ' baixa_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, baixa_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, baixa_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, baixa_creditos.razao) razao  from baixa_creditos ' +
      ' inner join empresa on empresa.cod_empresa = baixa_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = baixa_creditos.codigo_ctrl and controles.codigo_emp = baixa_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = baixa_creditos.cod_cliente and clientes.cod_empresa = baixa_creditos.cod_emp_mult ' +
      ' where baixa_creditos.cod_contrapartida = ' + IntToStr(pCodContrLanc) +
      ' and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, baixa_creditos.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' and baixa_creditos.tp_operacao = ''P'' ', '') +
    vDadosIni.IfThen(pCodContrCtp > 0,
    	' union all ' +
      ' select ' +
      ' ''CH'' seqtipo, ' +
    	' controle_cheque.codigo_ch, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' controle_cheque.n_doc_v, ' +
      ' controle_cheque.n_doc_v, ' +
      ' controle_cheque.tp_doc_v, ' +
      ' controle_cheque.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_cheque.data_rec, ' +
      ' controle_cheque.data_venc, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.status_ch, ' +
      ' controle_cheque.datq_ch, ' +
      ' controle_cheque.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_cheque.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_cheque.nome_ch) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_cheque.razao) razao from controle_cheque ' +
      ' inner join empresa on empresa.cod_empresa = controle_cheque.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_cheque.codigo_ctrl and controles.codigo_emp = controle_cheque.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_cheque.cod_cliente and clientes.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where controle_cheque.cod_contrapartida_ctp = ' + IntToStr(pCodContrCtp) +
      '	and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, controle_cheque.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CC'' seqtipo, ' +
      ' controle_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' controle_creditos.n_doc_v, ' +
      ' controle_creditos.n_doc_c, ' +
      ' controle_creditos.tp_doc_v, ' +
      ' controle_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_creditos.data_rec_c, ' +
      ' controle_creditos.data_venc_c, ' +
      ' coalesce(controle_creditos.valor_c, controle_creditos.valor_corr) valor_c, ' +
      ' coalesce(controle_creditos.valor_corr, controle_creditos.valor_c) valor_corr, ' +
      ' controle_creditos.status_c, ' +
      ' controle_creditos.datq_c, ' +
      ' controle_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_creditos.razao) razao from controle_creditos ' +
      ' inner join empresa on empresa.cod_empresa = controle_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_creditos.codigo_ctrl and controles.codigo_emp = controle_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_creditos.cod_cliente and clientes.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where controle_creditos.cod_contrapartida_ctp = ' + IntToStr(pCodContrCtp) +
      ' and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, controle_creditos.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CC'' seqtipo, ' +
      ' baixa_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
  		' baixa_creditos.n_doc_v, ' +
      ' baixa_creditos.n_doc_c, ' +
      ' baixa_creditos.tp_doc_v, ' +
      ' baixa_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' baixa_creditos.data_rec_c, ' +
      ' baixa_creditos.data_venc_c, ' +
      ' coalesce(baixa_creditos.valor_c, baixa_creditos.valor_corr) valor_c, ' +
      ' coalesce(baixa_creditos.valor_corr, baixa_creditos.valor_c) valor_corr, ' +
      ' ''QUITADO'' status_c, ' +
      ' baixa_creditos.datq_c, ' +
      ' baixa_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, baixa_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, baixa_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, baixa_creditos.razao) razao from baixa_creditos ' +
      ' inner join empresa on empresa.cod_empresa = baixa_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = baixa_creditos.codigo_ctrl and controles.codigo_emp = baixa_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = baixa_creditos.cod_cliente and clientes.cod_empresa = baixa_creditos.cod_emp_mult ' +
      ' where baixa_creditos.cod_contrapartida_ctp = ' + IntToStr(pCodContrCtp) +
      ' and iif(empresa.financeiro_unificado = ''S'', empresa.codigo_unificadora, baixa_creditos.codigo_emp) = ' + vDadosIni.codEmpresa +
      ' and baixa_creditos.tp_operacao = ''P'' ', '') +
    vDadosIni.IfThen((pCodContrLanc <= 0) and (pCodContrCtp <= 0) and (pLoteSaida > 0),
      ' union all ' +
    	' select distinct ' +
      ' ''CH'' seqtipo, ' +
      ' controle_cheque.codigo_ch, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
    	' controle_cheque.n_doc_v, ' +
      ' controle_cheque.n_doc_v, ' +
      ' controle_cheque.tp_doc_v, ' +
      ' controle_cheque.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_cheque.data_rec, ' +
      ' controle_cheque.data_venc, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.status_ch, ' +
      ' controle_cheque.datq_ch, ' +
      ' controle_cheque.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_cheque.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_cheque.nome_ch) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_cheque.razao) razao from lancamentos ' +
      ' inner join controle_cheque on controle_cheque.cod_contrapartida_ctp = lancamentos.cod_contrapartida_ctp and controle_cheque.codigo_emp = lancamentos.codigo_emp ' +
      ' inner join empresa on empresa.cod_empresa = controle_cheque.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_cheque.codigo_ctrl and controles.codigo_emp = controle_cheque.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_cheque.cod_cliente and clientes.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where lancamentos.lote_ent = ' + IntToStr(pLoteSaida) +
      ' and lancamentos.codigo_emp = ' + vDadosIni.codEmpresa +
      ' and lancamentos.cod_contrapartida_ctp > 0 ' +
      ' union all ' +
      ' select distinct ' +
      ' ''CC'' seqtipo, ' +
      ' controle_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
      ' controle_creditos.n_doc_v, ' +
      ' controle_creditos.n_doc_c, ' +
      ' controle_creditos.tp_doc_v, ' +
      ' controle_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_creditos.data_rec_c, ' +
      ' controle_creditos.data_venc_c, ' +
      ' coalesce(controle_creditos.valor_c, controle_creditos.valor_corr) valor_c, ' +
      ' coalesce(controle_creditos.valor_corr, controle_creditos.valor_c) valor_corr, ' +
      ' controle_creditos.status_c, ' +
      ' controle_creditos.datq_c, ' +
      ' controle_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_creditos.razao) razao from lancamentos ' +
      ' inner join controle_creditos on controle_creditos.cod_contrapartida_ctp = lancamentos.cod_contrapartida_ctp and controle_creditos.codigo_emp = lancamentos.codigo_emp ' +
      ' inner join empresa on empresa.cod_empresa = controle_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_creditos.codigo_ctrl and controles.codigo_emp = controle_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_creditos.cod_cliente and clientes.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where lancamentos.lote_ent = ' + IntToStr(pLoteSaida) +
      ' and lancamentos.codigo_emp = ' + vDadosIni.codEmpresa +
      ' and lancamentos.cod_contrapartida_ctp > 0 ' +
      ' union all ' +
      ' select distinct ' +
      ' ''CC'' seqtipo, ' +
      ' baixa_creditos.cod_cred, ' +
      IntToStr(pCodLanc) + ' n_processamento, ' +
      ' baixa_creditos.n_doc_v, ' +
      ' baixa_creditos.n_doc_c, ' +
      ' baixa_creditos.tp_doc_v, ' +
      ' baixa_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' baixa_creditos.data_rec_c, ' +
      ' baixa_creditos.data_venc_c, ' +
      ' coalesce(baixa_creditos.valor_c, baixa_creditos.valor_corr) valor_c, ' +
      ' coalesce(baixa_creditos.valor_corr, baixa_creditos.valor_c) valor_corr, ' +
      ' ''QUITADO'' status_c, ' +
      ' baixa_creditos.datq_c, ' +
      ' baixa_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, baixa_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, baixa_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, baixa_creditos.razao) razao from lancamentos ' +
      ' inner join baixa_creditos on baixa_creditos.cod_contrapartida_ctp = lancamentos.cod_contrapartida_ctp and baixa_creditos.codigo_emp = lancamentos.codigo_emp ' +
      ' inner join empresa on empresa.cod_empresa = baixa_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = baixa_creditos.codigo_ctrl and controles.codigo_emp = baixa_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = baixa_creditos.cod_cliente and clientes.cod_empresa = baixa_creditos.cod_emp_mult ' +
      ' where lancamentos.lote_ent = ' + IntToStr(pLoteSaida) +
      ' and lancamentos.codigo_emp = ' + vDadosIni.codEmpresa +
      ' and lancamentos.cod_contrapartida_ctp > 0 ', ''));
end;

{ TDocSendoRec }

constructor TDocSendoRec.create;
begin
	if dtmLancamentos = nil then
    dtmLancamentos := TdtmLancamentos.Create(dtmLancamentos);

  DataSet := TClientDataSet(dtmLancamentos.cdsDocSendoRec);
  transacao := TIBTransaction(dtmLancamentos.transacao);
  Buscas := TIBQuery(dtmLancamentos.qrBuscas);
end;

function TDocSendoRec._abreDocSendoRec: Boolean;
begin
  Result := montaSelect(
      ' select ' +
      ' ''CC'' seqtipo, ' +
      ' controle_creditos.cod_cred, ' +
      ' controle_creditos.codigo_emp, ' +
      ' controle_creditos.n_doc_v, ' +
      ' controle_creditos.n_doc_c, ' +
      ' controle_creditos.tp_doc_v, ' +
      ' null n_ch, ' +
      ' controle_creditos.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_creditos.data_rec_c, ' +
      ' controle_creditos.data_venc_c, ' +
      ' coalesce(controle_creditos.valor_original, controle_creditos.valor_c) valor_c, ' +
      ' controle_creditos.status_c, ' +
      ' controle_creditos.datq_c, ' +
      ' controle_creditos.op_cx, ' +
      ' controle_creditos.status_cx, ' +
      ' controle_creditos.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_creditos.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_creditos.nome_c) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_creditos.razao) razao from controle_creditos ' +
      ' inner join empresa on empresa.cod_empresa = controle_creditos.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_creditos.codigo_ctrl and controles.codigo_emp = controle_creditos.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_creditos.cod_cliente and clientes.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where controle_creditos.status_cx = ''R'' ' +
      ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
      '             empresa.codigo_unificadora ' +
      '           else ' +
      '             controle_creditos.codigo_emp ' +
      '      end) = ' + vDadosIni.codEmpresa +
      ' union all ' +
      ' select ' +
      ' ''CH'' seqtipo, ' +
      ' controle_cheque.codigo_ch, ' +
      ' controle_cheque.codigo_emp, ' +
      ' controle_cheque.n_doc_v, ' +
      ' controle_cheque.n_doc_v, ' +
      ' controle_cheque.tp_doc_v, ' +
      ' controle_cheque.n_ch, ' +
      ' controle_cheque.codigo_ctrl, ' +
      ' controles.nome_ctrl, ' +
      ' controle_cheque.data_rec, ' +
      ' controle_cheque.data_venc, ' +
      ' controle_cheque.valor_ch, ' +
      ' controle_cheque.status_ch, ' +
      ' controle_cheque.datq_ch, ' +
      ' controle_cheque.op_cx, ' +
      ' controle_cheque.status_cx, ' +
      ' controle_cheque.cod_cliente, ' +
      ' coalesce(clientes.cpfcgc, controle_cheque.cpfcgc) cpfcgc, ' +
      ' coalesce(clientes.nome_cliente, controle_cheque.nome_ch) nome_cliente, ' +
      ' coalesce(clientes.razao, controle_cheque.razao) razao from controle_cheque ' +
      ' inner join empresa on empresa.cod_empresa = controle_cheque.codigo_emp ' +
      ' left join controles on controles.codigo_ctrl = controle_cheque.codigo_ctrl and controles.codigo_emp = controle_cheque.cod_emp_mult ' +
      ' left join clientes on clientes.cod_cliente = controle_cheque.cod_cliente and clientes.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where controle_cheque.status_cx = ''R'' ' +
      ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
      '             empresa.codigo_unificadora ' +
      '           else ' +
      '             controle_cheque.codigo_emp ' +
      '      end) = ' + vDadosIni.codEmpresa);
end;

procedure TDocSendoRec._desmarcarDocumentoComoRecebendo;
var
  vDoc, vDocs, vTabela: string;
  vPointer: Pointer;
  vSelecionado: boolean;
  vCodigo, vCodEmpresa: Integer;
begin
  try

    if Application.MessageBox(pchar(
      'Os documentos selecionados serão desmarcados do recebimento. Deseja mesmo continuar?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    if not vDadosIni.PesqPros('CAR061', 'ALTERAR', 'TIPO S2/S1', 'CONTROLE_CREDITOS',
      '', buscas, True) then
      Exit;

    vPointer := dataSet.GetBookmark;

    vSelecionado := false;

    try
      dataSet.Filter := 'sel = ''S'' ';
      dataSet.Filtered := True;

      try
        dataSet.DisableControls;
        dataSet.first;
        while not dataSet.Eof do
        begin
          if dataSet.FieldByName('sel').AsString = 'S' then
          begin
            vSelecionado := true;
            if dataSet.FieldByName('seqtipo').AsString = 'CH' then
            begin
              vCodigo     := dataSet.FieldByName('cod_cred').AsInteger;
              vCodEmpresa := dataSet.FieldByName('codigo_emp').AsInteger;
              vDocs       := 'S1';
              vDoc        := Trim('Cheque de número ' + dataSet.FieldByName('n_ch').AsString);
              vTabela     := 'CONTROLE_CHEQUE';
            end
            else
            begin
              vCodigo     := dataSet.FieldByName('cod_cred').AsInteger;
              vCodEmpresa := dataSet.FieldByName('codigo_emp').AsInteger;
              vDocs       := 'S2';
              vDoc        := Trim('Documento de número ' + dataSet.FieldByName('n_doc_c').AsString);
              vTabela     := 'CONTROLE_CREDITOS';
            end;

            if dataSet.FieldByName('status_cx').AsString = 'R' then
            begin
              if dataSet.FieldByName('OP_CX').AsInteger <> vDadosIni.vCodUsuario then
              begin
                Application.MessageBox(pchar(vDoc + ' não pode ser desmarcado.' + #13 +
                  'Apenas o usuário de código ' + IntToStr(dataSet.FieldByName('OP_CX').AsInteger) +
                  ' pode desmarcar o registro'), 'Atenção', 0 + 64);
              end
              else
              begin
                buscas.Close;
                if trim(vDocs) = 'S1' then
                  buscas.SQL.Text := ' update controle_cheque set status_cx = null, op_cx = null ' +
                    ' where codigo_ch = ' + IntToStr(vCodigo) +
                    ' and codigo_emp = ' + IntToStr(vCodEmpresa)
                else
                  buscas.SQL.Text := ' update controle_creditos set status_cx = null, op_cx = null ' +
                    ' where cod_cred = ' + IntToStr(vCodigo) +
                    ' and codigo_emp = ' + IntToStr(vCodEmpresa);
                buscas.ExecSQL;

                vDadosIni.GravaAuditoria('CAR061', 'ALTERAR', 'TIPO ' + vDocs +
                  ' ' + vDoc, vTabela, IntToStr(vCodigo) + '/' + vDoc, buscas);

              end;
            end;
          end;
          dataSet.next;
        end;
      finally
        dataSet.EnableControls;
      end;

      if not vSelecionado then
      begin
        Application.MessageBox(pchar('Nenhum documento selecionado, favor selecionar'), 'Atenção', 0 + 64);
        exit;
      end;
    finally
    	dataSet.Filtered := False;
    end;

    if buscas.Transaction.InTransaction then
    	buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('CAR061', 'ALTERAR', 'CONFIRMADA MODIFICACOES', 'CONTROLE_CREDITOS', '', buscas);

    Application.MessageBox(pchar('Processo concluído'), 'Atenção', 0 + 64);

    _abreDocSendoRec;

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message + #13 + ' Tipo Doc S2/S1'), 'Atenção', 0 + 64);
      registraErro('procedure TContasAReceber._desmarcarDocumentoComoRecebendo. Erro: ' + e.Message + ' Tipo Doc S2/S1');
    end;
  end;
end;

procedure TDocSendoRec._desmarcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    try
    	dataSet.DisableControls;
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
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TDocSendoRec._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TDocSendoRec._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    try
    	dataSet.DisableControls;
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
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

end.

