unit UClassesPrestacao;

interface

uses uDataSet_OOP, UDtmPrestacao, DBClient, Controls, RDprint, Forms, StdCtrls, Windows, 
  uCupom, Classes; //,Messages,StdCtrls

type
  Tcl_abreExtrato_form = function(ACodCliente: Integer): boolean;

  TipoImpressoraRecibo = (tirNenhuma, tirComum, tirEPL, tirNaoFiscal);

  RClientes = record
    AHandle: THandle;
  end;
  
  TGenerico = class(TDataSet_OOP)
  protected
    comucFiscal: TComunic;
  public
    procedure showFiscal;
    procedure verificaFiscalAtivo;
    procedure enviarPrestacaoParaCupom;
  end;

  TpendPrest = class(TGenerico)
  private
    valorPendenteRecibo: Currency;
    Fprintlote: Boolean;
    Fprinttype: TipoImpressoraRecibo;
    FChosePrintLote: TNotifyEvent;
  protected
    FCheckDif : boolean;
    fRemoverDesconto: Boolean;
    FDescontoAcrescimo: string;
    FDescontoValor, FDescontoPercentual, FValorOperacao, FValorCorrigido: Real;
  public
    constructor create;
    destructor destroy; override;
    function recebendo: boolean;
    function jarecebida: boolean;
    function post: boolean; override;
    function marcaRec(vtp: integer): boolean;
    function selecPrestacao(pExibirMsg:boolean = false): boolean;
    function DeselecPrestacao: boolean;
    function DeselecPrestacaoImediata: boolean;
    function ChecaMesmoCli(vCodCliOld: integer; vCodCliNew: integer): boolean;
    function ChecaMesmoVendedor(vCodVendOld: integer; vCodVendNew: integer): boolean;
    function ChecaMesmocontrole(vCodcontOld,vCodcontNew: integer): boolean;
    function atualizarValorCorr: boolean; //(tipoCorrecao: integer; ValorCred: currency): boolean;
    function corrigeValor: boolean; //(tipoCorrecao: integer; ValorCred: currency): boolean;
    function abrePendPrestacao: boolean;
    function atualizaPendPrestacao(vFlagAtualiza: integer): boolean;
    function ChecaDiferencaPendPrestacao: boolean;
    function LacamentoDeTroco: boolean;
    function DelLacamentoDeTroco(codLancamento: integer): boolean;
    function CancelaRecPrestacao: boolean;
    function CorrigeSaldoECxl(vsaldo_cxl: currency; vtotalEntradacxl: currency): boolean;
    function CorrigeSaldoSCxl(vsaldo_cxl: currency; vtotalSaidaCxl: currency; vtroco: currency): boolean;
    function ChecaUsuarioSenha(usuario: string; senha: string; CodProcesso: string): boolean;
    function confirmarecebimento(vTipoBaixaCxl: string; vlpag, vlCorrigido: Double): boolean;
    function Naoconfirmarecebimento(vTipoRecebimento: string): boolean;
    procedure PegaInfDiaFec; //: boolean;
    procedure PegaInfEmpresa;
    function GravaLoteCxl: boolean;
    function DeletaLoteCxl(vLoteCxl: integer): boolean;
    function CancelaProcesso: boolean;
    function CancelaProcessoImediato: boolean;
    procedure imprimeRecG(vTipoiImp: integer; vTipoRec: integer; pLoteImp: Integer = 0);
    function Recibo_PrintNaoFiscal(loteid: Integer): Boolean;
    function extenso(valor: real): string;
    function ValorRecParcial(lote_cxl: integer): currency;
    procedure ModImp(Print: TRDPrint; vtipo: string);
    function PesquisaPendPrestacao(fimSql: string): boolean;
    function DescontoPermitido: boolean;
    function GravaDesconto: boolean;
    procedure GeraBoleta(Contador, NumBoletas: Integer);
    function Centraliza(Texto: string; NumChar: Integer): string;
    function refreshDataset: boolean;
    function validaRecebimentoPrestacao(pPrestacoesMarcadas: string): Boolean;
    function _abreFormDesconto(pValorOperacao: Real): Boolean;
    function _concederAcrescimoDesconto: Boolean;
    function _altervalorcorrigido: Boolean;
    function _descontoPermitido: Boolean;
    procedure retornaMensagemRecebimento(pMensagem: string = '');
    function cl_abreExtrato_form(ACodCliente: Integer): boolean;
    property CheckDif: boolean read FCheckDif write FCheckDif;
    {    function marcaRecibo: boolean;
        function desmarcaRecibo: boolean;
        function selecionaRecibosAntecipados: boolean;
        function somatorioRecibos: Currency;
        function baixaRecibo(nVenda: integer; tpDoc: string; vrRestante: Currency): Currency;
        function getValorRecibo: Currency;
        function getValorPendenteRecibo: Currency;}

    property DescontoValor: Real read FDescontoValor write FDescontoValor;
    property DescontoPercentual: Real read FDescontoPercentual write FDescontoPercentual;
    property DescontoAcrescimo: string read FDescontoAcrescimo write FDescontoAcrescimo;
    property ValorOperacao: Real read FValorOperacao write FValorOperacao;
    property ValorCorrigido: Real read FValorCorrigido write FValorCorrigido;
    property printtype: TipoImpressoraRecibo read  Fprinttype write Fprinttype;
    property printlote: Boolean read Fprintlote write Fprintlote;
    property OnChosePrintLote: TNotifyEvent read FChosePrintLote write FChosePrintLote;
  var
    vtipdoc: string;
    vsrec, vlVnd, vlrec: Currency;
    vTotalECxl: Currency; //Valor Total de Entradas no Cxl para o operador (TOT_E_CXL)
    vTotalSCxl: Currency; //Valor Total de Saídas no Cxl para o operador   (TOT_E_CXL)
    vSaldoCxl: Currency; //Saldo no Cxl para o operador                   (SALDO_CXL)
    vCodLancCxl: integer; //Código de um lançamento no Cxl                  (COD_LANCXL)
    vValorLanc: Currency; //Valor de um lançamento no Cxl                   (VALOR_CXL)
    vUsuarioGerente: string;
    vNivelGerente: integer;
    qtdvnd: Integer;
    vLoteCxlAtual: integer; //Valor do lote atual para possível cancelamento caso necessário (N_LOTE_CXL)
    vFlagImpRecibo: Integer; //Impressão EPL=1 ,Impressora Normal=2
    vCancela: boolean;
    vCodificado: string; //Valor codificado para senha do usuário gerente durante cancelamento de prestação

    vTxJuros: double; //Taxa de juros da empresa (TX_JUROS)
    vMultas: double; //Multa por atraso no recebimento de cheque e crédito vencidos.
    vDiasCareciaJuros: integer; //Dias de carência para iniciar o cálculo de juros.
    vPercDescontoCalc: double; //Valor em Percetual calculado para o desconto
    vValorCorrComDesc: currency; //Valor corrigido do crédito com desconto
    vValorCorrSemDesc: currency; //Valor corrigido do crédito sem desconto
    vPercDescEmp: double; //Valor do desconto percentual máximo em prestação.
    vMensagemEmp: AnsiString; //TextFile;//Tmemo;
    statusbotoes: boolean;
    vClientePrest: RClientes; //Variaveis de configuracao do cliente
  end;
implementation

uses
  uDadosIni, SysUtils, IBDatabase, IBQuery, Dialogs, Variants, DB, uDtmAtivo,
  StrUtils, uPadrao, upendPrestacao, funcoes, config_sistema_class,
  hw_utils, hw_naofiscal_utils, MaskUtils, Math;

function HwPosPrintFromText(Text, ConfName: WideString; QtdeVias: Integer): Integer; stdcall; external 'HWPosPrinter.dll';
function HwPosUltimoErro: WideString; stdcall; external 'HWPosPrinter.dll';
function cloud_agente_print_text(text: WideString; params: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';
function cloud_agente_last_error: WideString; stdcall; external 'hw.utils.dx.dll';

function TpendPrest.abrePendPrestacao: boolean;
begin
  result := montaSelect('select cr.selec,cr.cod_cred,cr.n_doc_c,cr.cod_cliente,cr.Nome_c,cr.Valor_c,cr.data_venc_c,' +
    ' cr.vl_rq_pg_cxl,cr.status_cxl_rq,cr.dia_cxl,cr.op_cxl,cr.valor_corr,cr.valor_desc,cr.valor_acresc,cr.LOTE_CXL,' +
    ' cr.tp_rec_cxl,cr.cpfcgc,cr.juros_cob,cr.tp_doc_v,cr.N_doc_v,cr.CODIGO_EMP,cr.COD_EMP_MULT,cr.CODIGO_CTRL,' +
    ' cr.COONAOFISCAL,cr.US_CANCELOU,cr.DT_US_CANCELOU,cr.OBS_PARACREDITO,cr.CODIGO_VEND,cr.TIP_CNT,cr.NSERIEECF,' +
    ' cr.COD_TERMINAL,cr.TIPO_DOC_C,cr.DATA_VENDA,cr.OP_CX,ctrl.NOME_CTRL ' +
    ' from CONTROLE_CREDITOS cr ' +
    ' inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp ' +
    ' Where (cr.dia_cxl is null or cr.dia_cxl = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) + ') and' +
    ' (cr.status_c is null or cr.status_c = '''') and' +
    ' (cr.op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' or cr.op_cxl is null or cr.op_cxl = 0) ' +
    ' and ctrl.entra_prest_cxl = ''S''' +
    ' and cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
    ' = ' + vDadosIni.codEmpresa +
    ' order by cr.nome_c,cr.n_doc_c');
  dataSet.Filtered := false;
end;

function TpendPrest.refreshDataset: boolean;
begin
  result := montaSelect(dataset.CommandText);
end;

procedure TpendPrest.retornaMensagemRecebimento(pMensagem: string);
var
  buscas2: TIBQuery;
  vtemp: string;
begin
 buscas2 := TIBQuery.Create(Application);
 buscas2.Database := buscas.Database;
 buscas2.Transaction := buscas.Transaction;

 SqlOpen(' select cr.cod_cred, cr.codigo_emp, cr.n_doc_c, cr.op_cxl, col.nome_vendedor as nome_cxl, ' +
 	'	cr.op_cx, col2.nome_vendedor as nome_cx from controle_creditos cr ' +
  ' left join colaborador col on col.cod_vendedor = cr.op_cxl and col.cod_empresa = cr.codigo_emp ' +
  ' left join colaborador col2 on col2.cod_vendedor = cr.op_cx and col2.cod_empresa = cr.codigo_emp ' +
  ' where cr.cod_cred = ' + IntToStr(dataSet.FieldByName('COD_CRED').AsInteger) +
  ' and cr.codigo_emp = ' + vDadosIni.codEmpresa, buscas2);
  
  if buscas2.IsEmpty then
  	exit;

  vtemp := '';
  if trim(pMensagem ) <> '' then
	  vtemp := trim(pMensagem) + #13 + #13;

  if buscas2.FieldByName('op_cxl').AsInteger > 0 then
    Application.MessageBox(PChar(
	    vtemp +
      'Documento ' + Trim(buscas2.FieldByName('n_doc_c').AsString) +
      ' já esta sendo recebido ou modificado pelo Caixa Auxiliar.' + #13 +
      'Usuário: ' + buscas2.FieldByName('op_cxl').AsString + ' - '+
      Trim(buscas2.FieldByName('nome_cxl').AsString)),
      'Informação', MB_OK+MB_ICONINFORMATION)
  else if buscas2.FieldByName('op_cx').AsInteger > 0 then
    Application.MessageBox(PChar(
      vtemp +
      'Documento ' + Trim(buscas2.FieldByName('n_doc_c').AsString) +
      ' já esta sendo recebido ou modificado pelo Financeiro.' + #13 +
      'Usuário: ' + buscas2.FieldByName('op_cx').AsString + ' - '+
      Trim(buscas2.FieldByName('nome_cx').AsString)),
      'Informação', MB_OK+MB_ICONINFORMATION)
  else
    Application.MessageBox(PChar(
      vtemp +
    	'Documento já recebido ou sendo recebido por outro usuário.'),
    	'Informação', MB_OK +MB_ICONINFORMATION+ MB_DEFBUTTON1);
end;

function TpendPrest.cl_abreExtrato_form(ACodCliente: Integer): boolean;
var
  AProcedure: Tcl_abreExtrato_form;
  AQueryRescue: TIBQuery;
  AUseQueryIni: Boolean;
begin
  try
  	if not vDadosIni._mdiAberto('TFrmCadClientes', 'Cadastro do cliente ja esta aberto, feche o cadastro para utilizar esta funcionalidade') then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;
    
    if vClientePrest.AHandle = 0 then
      CarregaPacote('pkClientes', vClientePrest.AHandle);

    if vClientePrest.AHandle = 0 then
    begin
      Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
      Exit;
    end;
    @AProcedure := GetProcAddress(vClientePrest.AHandle, 'cl_abreExtrato_form');

    if Assigned(AProcedure) then
      Result := AProcedure(ACodCliente);
  finally
  end;
end;

function TpendPrest.confirmarecebimento(vTipoBaixaCxl: string; vlpag, vlCorrigido: Double): boolean;
var
  vImpLote: Boolean;
begin
  Result := false;
  try
    if vTipoBaixaCxl='P' then
      dataSet.Filter := 'SELEC = ''S'' and COD_CRED = '+dataSet.FieldByName('COD_CRED').AsString
    else
      dataSet.Filter := 'SELEC = ''S''';
    dataSet.Filtered := True;
    {
    vImpLote := False;
    if (dataSet.RecordCount > 1) and (vFlagImpRecibo=2) then
      vImpLote := Application.MessageBox('Imprimir em um único Recibo?', 'Confirmação',
          MB_ICONQUESTION + MB_YESNO) = IDYES;
    }
    if dataSet.RecordCount > 1 then
      if not Assigned(FChosePrintLote) then
        vImpLote := ShowConfirmacao('Imprimir em um único Recibo?') = IDYES
      else
      begin
        FChosePrintLote(Self);
        vImpLote := Fprintlote;
      end;

    dataSet.First;
    while not dataSet.eof do
    begin
      if dataSet.FieldByName('SELEC').value = 'S' then
      begin
        try
         if not transacao.InTransaction then
          transacao.StartTransaction;

          if edit then
          begin
            dataSet.FieldByName('DIA_CXL').value := vDadosIni.diaFCxl;
            dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
  //          dataSet.FieldByName('LOTE_CXL').value := vLoteCxlAtual;
            if vTipoBaixaCxl = 'T' then
            begin
              dataSet.FieldByName('TP_REC_CXL').value := 'T';
              if RoundTo(vlCorrigido, -2) > RoundTo(vlpag, -2) then
                dataSet.FieldByName('VL_RQ_PG_CXL').AsFloat := RoundTo(ffloat('VALOR_CORR') / vlCorrigido * vlpag, -2)
              else
              dataSet.FieldByName('VL_RQ_PG_CXL').AsFloat := dataset.FieldByName('VALOR_CORR').AsFloat;
              if dataSet.FieldByName('VL_RQ_PG_CXL').AsFloat > dataSet.FieldByName('VALOR_C').AsFloat then
                dataSet.FieldByName('JUROS_COB').AsFloat := dataSet.FieldByName('VL_RQ_PG_CXL').AsFloat - dataSet.FieldByName('VALOR_C').AsFloat
              else
                dataSet.FieldByName('JUROS_COB').AsFloat := 0;
            end
            else
            begin
              dataSet.FieldByName('TP_REC_CXL').AsString := 'P';
              dataSet.FieldByName('VL_RQ_PG_CXL').AsFloat := vlpag;
              dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_CORR').AsFloat - vlpag;
              if vlpag > dataSet.FieldByName('VALOR_C').AsFloat then
                dataSet.FieldByName('JUROS_COB').AsFloat := vlpag - dataSet.FieldByName('VALOR_C').AsFloat
              else
                dataSet.FieldByName('JUROS_COB').AsFloat := 0;

            end;

//            dataSet.FieldByName('SELEC').value := null;
            Post;
            if Apply then
            begin
              result := true;
              try
                if Fprinttype = tirEPL then
                  ImprimeREcG(1, IfThen(fequals('tp_rec_cxl', 'T'), 1, 2))
                else if (Fprinttype <> tirNenhuma) and (not vImpLote) then
                  if Fprinttype = tirComum then
                    ImprimeREcG(2, IfThen(fequals('tp_rec_cxl', 'T'), 1, 2))
                  else if Fprinttype = tirNaoFiscal then
                    Recibo_PrintNaoFiscal(0);
               {
               if dataSet.FieldByName('TP_REC_CXL').value = 'T' then
               begin
                if vFlagImpRecibo = 1 then
                  ImprimeREcG(1, 1)
                else if not vImpLote then
                  ImprimeREcG(2, 1);
               end
               else
               begin
                if vFlagImpRecibo = 1 then
                  ImprimeREcG(1, 2)
                else if not vImpLote then
                  ImprimeREcG(2, 2);
               end;
               }
              except
                if vFlagImpRecibo = 1 then
                  messagedlg('Erro ao imprimir recibo em EPL.', mterror, [mbOK], 0)
                else
                  messagedlg('Erro ao imprimir recibo.', mterror, [mbOK], 0)
              end;
            end
            else
              Result := false;
          end;
          if transacao.InTransaction then
           transacao.Commit;
          vDadosIni.GravaAuditoria('CXL004','CONFIRMAR SIM', 'LOTE_CXL: '+dataSet.FieldByName('LOTE_CXL').AsString+' N_DOC_C: '+dataSet.FieldByName('N_DOC_C').AsString,
            'CONTROLE_CREDITOS',dataSet.FieldByName('COD_CRED').AsString, Buscas);
          if (Result) and (dataSet.FieldByName('TIP_CNT').AsString = 'C') then
            enviarPrestacaoParaCupom;
        except
         on e: exception do
         begin
          if transacao.InTransaction then
           transacao.Rollback;
          Result := false;
          Application.MessageBox(pchar(e.Message), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
          vDadosIni.registraErro(e.Message);
         end;
        end;
      end;
      dataSet.next;
    end;

    if vImpLote then
      if Fprinttype = tirNaoFiscal then
        Recibo_PrintNaoFiscal(vLoteCxlAtual)
      else if Fprinttype = tirComum then
        ImprimeREcG(2, IfThen(fequals('tp_rec_cxl', 'T'), 1, 2), vLoteCxlAtual)
    {
    if vImpLote then
      if vFlagImpRecibo <> 1 then
        if dataSet.FieldByName('TP_REC_CXL').value = 'T' then
          ImprimeREcG(2, 1, vLoteCxlAtual)
        else
          ImprimeREcG(2, 2, vLoteCxlAtual);
    }
  finally
    dataSet.Filter := '';
    dataSet.Filtered := False;
  end;
  Refresh;
end;

function TpendPrest.Naoconfirmarecebimento(vTipoRecebimento: string): boolean;
var
  vNumLote,vNumDoc,vCodCred:string;
begin
  result := false;
  if vTipoRecebimento = 'T' then
  begin
    try
      dataSet.Filter := 'SELEC = ''S''';
      dataSet.Filtered := True;
      First;
      while not dataSet.eof do
      begin
        vNumLote := dataSet.FieldByName('LOTE_CXL').AsString;
        vCodCred:=dataSet.FieldByName('COD_CRED').AsString;
        vNumDoc:=trim(dataSet.FieldByName('N_DOC_C').AsString);
        if dataSet.FieldByName('SELEC').AsString = 'S' then
        begin
          if marcaRec(0) then
          begin
            vDadosIni.GravaAuditoria('CXL003','CONFIRMAR NÃO', 'LOTE_CXL: '+vNumLote+' N_DOC_C: '+vNumDoc,
              'CONTROLE_CREDITOS',vCodCred, Buscas);
            result := true;
          end
          else
            result := false;
        end;
//          next;
      end;
    finally
      dataSet.Filtered := false;
    end;
  end
  else
  begin
    vNumLote := dataSet.FieldByName('LOTE_CXL').AsString;
    vCodCred:=dataSet.FieldByName('COD_CRED').AsString;
    vNumDoc:=trim(dataSet.FieldByName('N_DOC_C').AsString);
    if marcaRec(0) then
    begin
      vDadosIni.GravaAuditoria('CXL003','CONFIRMAR NÃO', 'LOTE_CXL: '+vNumLote+' N_DOC_C: '+vNumDoc,
        'CONTROLE_CREDITOS',vCodCred, Buscas);
      result := true;
    end
    else
      result := false;
  end;
end;

constructor TpendPrest.create;
begin
  DataSet := TClientDataSet(DtmPrestacao.CdsPendPrestacao);
  transacao := TIBTransaction(DtmPrestacao.IbTransPrestacao);
  Buscas := TIBQuery(DtmPrestacao.qrBuscas);
end;

destructor TpendPrest.destroy;
begin
  inherited;
  Close;
end;

function TpendPrest.extenso(valor: real): string;
var
  Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
  Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco',
    'Seis', 'Sete', 'Oito', 'Nove');
  Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze',
    'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
  Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta',
    'Cinquenta', 'Sessenta', 'Setenta',
    'Oitenta', 'Noventa');
  Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos',
    'Quatrocentos', 'Quinhentos', 'Seiscentos',
    'Setecentos', 'Oitocentos', 'Novecentos');

  function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: string): string;
  begin
    if Expressao then
      Result := CasoVerdadeiro
    else
      Result := CasoFalso;
  end;

  function MiniExtenso(trio: string): string;
  var
    Unidade, Dezena, Centena: string;
  begin
    Unidade := '';
    Dezena := '';
    Centena := '';
    if (trio[2] = '1') and (trio[3] <> '0') then
    begin
      Unidade := Dez[strtoint(trio[3])];
      Dezena := '';
    end
    else
    begin
      if trio[2] <> '0' then
        Dezena := Dezenas[strtoint(trio[2])];
      if trio[3] <> '0' then
        Unidade := Unidades[strtoint(trio[3])];
    end;

    if (trio[1] = '1') and (Unidade = '') and (Dezena = '') then
      Centena := 'Cem'
    else if trio[1] <> '0' then
      Centena := Centenas[strtoint(trio[1])]
    else
      Centena := '';

    Result := Centena + ifs((Centena <> '') and ((Dezena <> '') or (Unidade <> '')), ' e ', '')
      + Dezena + ifs((Dezena <> '') and (Unidade <> ''), ' e ', '') + Unidade;
  end;

begin
  if (valor > 999999.99) or (valor < 0) then
  begin
    msg := 'O valor está fora do intervalo permitido.';
    msg := msg + 'O número deve ser maior ou igual a zero e menor que 999.999,99.';
    msg := msg + ' Se não for corrigido o número não será escrito por extenso.';
    showmessage(msg);
    Result := '';
    exit;
  end;

  if valor = 0 then
  begin
    Result := '';
    Exit;
  end;

  Texto := formatfloat('000000.00', valor);
  Milhar := MiniExtenso(Copy(Texto, 1, 3));
  Centena := MiniExtenso(Copy(Texto, 4, 3));
  Centavos := MiniExtenso('0' + Copy(Texto, 8, 2));
  Result := Milhar;
  if Milhar <> '' then
    if copy(texto, 4, 3) = '000' then
      Result := Result + ' Mil Reais'
    else
      Result := Result + ' Mil, ';
  if (((copy(texto, 4, 2) = '00') and (Milhar <> '')
    and (copy(texto, 6, 1) <> '0')) or (centavos = ''))

  //Problema da Função - Corrigido Breno Dias - 16/01/2001
  and (Centena <> '') then
    Result := Result + '  ';
  if (Milhar + Centena <> '') then
    Result := Result + Centena;
  if (Milhar = '') and (copy(texto, 4, 3) = '001') then
    Result := Result + ' Real'
  else if (copy(texto, 4, 3) <> '000') then
    Result := Result + ' Reais';
  if Centavos = '' then
  begin
    Result := Result + '.';
    Exit;
  end
  else
  begin
    if Milhar + Centena = '' then
      Result := Centavos
    else
      Result := Result + ', e ' + Centavos;
    if (copy(texto, 8, 2) = '01') and (Centavos <> '') then
      Result := Result + ' Centavo.'
    else
      Result := Result + ' Centavos.';
  end;
end;

function TpendPrest.GravaDesconto: boolean;
var
 vprop: real;
begin
  try
    Result := true;
    if not transacao.InTransaction then
      transacao.StartTransaction;
    if edit then
    begin
      vprop:=((dataSet.FieldByName('VALOR_CORR').value/vValorCorrSemDesc)*100);
      vprop:=(vprop/100)*(vValorCorrSemDesc - vValorCorrComDesc);
      dataSet.FieldByName('VALOR_DESC').value :=formatfloat('0.00', (vprop));
      dataSet.FieldByName('VALOR_CORR').value :=dataSet.FieldByName('VALOR_CORR').value-dataSet.FieldByName('VALOR_DESC').value;
      if dataSet.FieldByName('VALOR_CORR').value < dataSet.FieldByName('VALOR_C').value then
      begin
        Application.MessageBox(pchar('Valor corrigido menor que valor da Parcela.'),'Atenção',MB_ICONEXCLAMATION + MB_OK);
       if not vDadosIni.PesqPros('CXL055','DESCONTO',' N.DOC: '+dataSet.fieldbyname('N_DOC_C').AsString,'','',Buscas,True) then
       begin
        Application.MessageBox(pchar('Valor corrigido menor que valor da Parcela, Operação não permitida para este Caixa'),
        'Atenção',MB_ICONEXCLAMATION + MB_OK);
        result:=false;
        Cancel;
       end;
      end
      else
      begin
       post;
       if Apply then
         result := true
       else
         Result := false;
      end;
    end;
    transacao.Commit;
  except
    if transacao.InTransaction then
      transacao.Rollback;
    Result := false;
    MessageDlg('Erro ao gravar desconto', mterror, [mbOK], 0);
  end;
end;

function TpendPrest.GravaLoteCxl: boolean;
begin
  vLoteCxlAtual := 0;
  try
    result := true;
    if not transacao.InTransaction then
      transacao.StartTransaction;
    vLoteCxlAtual := Gencodigo('LOTE_CXL', DtmPrestacao.SpIncCodigoCxl, vDadosIni.codEmpresa);
    buscas.close;
    buscas.SQL.Text := 'INSERT INTO LOTE_CXL (N_LOTE_CXL, COD_EMPRESA, DATA_L_CXL, CODIGO_EMP, SELEC, DATA_CXL_QUIT, OP_CXL, ATIVO)' +
      'VALUES (' + inttostr(vLoteCxlAtual) +
      ' ,' + vDadosIni.codEmpresa +
      ' ,' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) +
      ' , NULL, NULL, NULL' +
      ' ,' + IntToStr(vDadosIni.vCodOpCxl) +
      ' ,1)';
    buscas.ExecSQL;
    transacao.Commit;
  except
    result := false;
    transacao.Rollback;
  end;
end;

function TpendPrest.ValorRecParcial(lote_cxl: integer): currency;
begin
  result := 0;
  try
//    if not transacao.InTransaction then
//      transacao.StartTransaction;
    buscas.Close;
    buscas.SQL.Text := 'select sum(fp.valordoc) as valordoc from formpagamento fp' +
      ' inner join controles c on c.codigo_ctrl = fp.cod_controle and c.codigo_emp = fp.cod_empresa' +
      ' where fp.ativo = 1 and fp.nrequisicao = ' + IntToStr(lote_cxl) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and fp.tpdocs = ''PRE''';
    buscas.Open;
    if not buscas.IsEmpty then
      result := buscas.FieldByName('valordoc').AsCurrency
    else
      result := 0;
    buscas.Close;
//    transacao.Commit;
  except
//    transacao.Rollback;
  end;
end;

function TpendPrest._abreFormDesconto(pValorOperacao: Real): Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Desconto/Acréscimo em valor corrigido';
    FrmPendPrestacao.pnDesconto.Visible := true;
    FrmPendPrestacao.pnDesconto.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    FrmPendPrestacao.pnValorDaOperacao.Caption := Format('%0.2n', [pValorOperacao]);
    FrmPendPrestacao.edDescPerc.AsValue := 0;
    FrmPendPrestacao.edDescValor.AsValue := 0;
    FrmPendPrestacao.RadioGroupDescontoAcrescimo.ItemIndex := _LerConfiguracoesRegistroInteger(FrmPendPrestacao.RadioGroupDescontoAcrescimo.Name);
    result := (formulario.ShowModal = IDOK);

  finally
    FrmPendPrestacao.pnDesconto.Parent := FrmPendPrestacao;
    FrmPendPrestacao.pnDesconto.Visible := false;
    formulario.Free;
    formulario := nil;
  end;
end;

function TpendPrest._altervalorcorrigido: Boolean;
var
  vMensagem: string;
  vPercApurado: Real;
  vOK: Boolean;
  vSumDescPrest: Double;
  vvalorcorr: string;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CXL083', 'ALTERAR', '', 'CONTROLE_CREDITOS', '', buscas, True) then
    Exit;

  try

    FValorCorrigido := 0;
    if recebendo then
    begin
      retornaMensagemRecebimento('Alteração do valor corrigido não foi realizada, favor verificar');
      exit;
    end;
//      raiseExceptionCreate('Alteração do valor corrigido não foi realizada, favor verificar', '');

    fRemoverDesconto := True;
    corrigeValor;

    vvalorcorr := FloatToStr(dataSet.FieldByName('VALOR_CORR').AsFloat);
    if not InputQuery('Atenção', ' Informe o novo valor corrigido do crédito.', vvalorcorr) then
      exit;

    try
      StrToFloat(vvalorcorr);
    except
      raiseExceptionCreate('Valor informado do crédito não inválido', '');
    end;

    if StrToFloat(vvalorcorr) <= 0 then
      raiseExceptionCreate('Valor corrigido do crédito não informado', '');

    FValorOperacao := dataSet.FieldByName('VALOR_CORR').AsFloat;
    FValorCorrigido := StrToFloat(vvalorcorr);

    if FValorOperacao > FValorCorrigido then
    begin
      if not vDadosIni.PesqPros('CXL012', 'DESCONTO', '', 'CONTROLE_CREDITOS',
      dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
        Exit;
    end
    else
    begin
      if not vDadosIni.PesqPros('CXL081', 'ACRESCIMO', '', 'CONTROLE_CREDITOS',
      dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
        Exit;
    end;

    if FValorOperacao > FValorCorrigido then
    begin
      FDescontoValor := FValorOperacao - FValorCorrigido;
      vPercApurado := vDadosIni.StrToFloatFormat((((FValorOperacao - FValorCorrigido) * 100) / FValorOperacao), 2);

      vMensagem := 'Percentual máximo de desconto permitido = ' +
        FloatToStr(vDadosIni.vEmp.vMaxDescontoParcela) + '%' + #13 +
        'Percentual apurado de desconto = ' + formatfloat('0.00', vPercApurado) + '%' + #13 +
        'Valor da Prestação = R$' + formatfloat('0.00', FValorOperacao) + #13 +
        'Valor do desconto = R$' + formatfloat('0.00', (FValorOperacao - FValorCorrigido)) + #13 +
        'Valor da Prestação com desconto = R$' + formatfloat('0.00', FValorCorrigido) + #13 + #13 +
        'Deseja permitir este desconto?';

      vOK := Application.MessageBox(pchar(vMensagem), 'Confirmar Desconto?', MB_ICONQUESTION +
        MB_YESNO) = IDYES;

      if (not vOK) then
        exit;
      if (not _descontoPermitido) then
        if not vDadosIni.PesqPros('CXL082', 'PERMITIR', 'N.DOC: ' +
          dataSet.fieldbyname('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
          dataSet.fieldbyname('COD_CRED').AsString + '/' + dataSet.fieldbyname('N_DOC_C').AsString,
          Buscas, True) then
          exit;
    end
    else
    begin
      FDescontoValor := FValorCorrigido - FValorOperacao;
      vPercApurado := vDadosIni.StrToFloatFormat((((FValorCorrigido - FValorOperacao) * 100) / FValorOperacao), 2);
    end;

    if (dataSet.FieldByName('VALOR_CORR').AsFloat > 0) and (not recebendo) then
    begin
      dataSet.Edit;
      if FValorOperacao > FValorCorrigido then
      begin
        dataSet.FieldByName('VALOR_DESC').AsFloat := FDescontoValor;
        dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;
        dataSet.FieldByName('VALOR_CORR').AsFloat := FValorCorrigido;
      end
      else
      begin
        dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
        dataSet.FieldByName('VALOR_ACRESC').AsFloat := FDescontoValor;
        dataSet.FieldByName('VALOR_CORR').AsFloat := FValorCorrigido;
      end;

      if dataSet.FieldByName('VALOR_CORR').AsFloat <= 0 then
        raiseExceptionCreate('Valor corrigido menor ou igual a zero, Operação não permitida', '')
      else if (FValorOperacao > FValorCorrigido) // É Desconto
       and (FValorCorrigido < dataSet.FieldByName('VALOR_C').AsFloat) then
      begin
        Application.MessageBox(pchar('Valor corrigido menor que valor da Parcela.'),
          'Atenção', MB_ICONEXCLAMATION + MB_OK);
        if not vDadosIni.PesqPros('CXL012', 'DESCONTO', 'N.DOC ' +
          Trim(dataSet.FieldByName('N_DOC_C').AsString) +
          ' VALOR_CORR ' + dataSet.FieldByName('VALOR_CORR').AsString +
          ' MENOR QUE VALOR_C ' + dataSet.FieldByName('VALOR_C').AsString, 'CONTROLE_CREDITOS',
          dataSet.FieldByName('cod_cred').AsString + '/' +
          Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
        begin
          //vDadosIni.GravaAuditoria('CXL012', 'DESCONTO', 'NAO PERMITIDO N.DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) + ' DESCONTO ' + dataSet.FieldByName('VALOR_DESC').AsString + ' LIQUIDO ' + dataSet.FieldByName('VALOR_CORR').AsString, FTable, dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
          raiseExceptionCreate('Valor corrigido menor que valor da Parcela, Operação não permitida para este Caixa', '');
        end;
      end;

      dataSet.Post;
    end;

    if dataSet.ChangeCount > 0 then
    begin
      if Apply then
      begin
        CommitaTransacao;
        if (FValorOperacao > FValorCorrigido) then
          vDadosIni.GravaAuditoria('CXL012', 'DESCONTO', 'SUCESSO', 'CONTROLE_CREDITOS',
            dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas)
        else
          vDadosIni.GravaAuditoria('CXL081', 'ACRESCIMO', 'SUCESSO', 'CONTROLE_CREDITOS',
            dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
        vDadosIni.GravaAuditoria('CXL083', 'ALTERAR', 'SUCESSO', 'CONTROLE_CREDITOS',
          dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
      end;
    end;
  except on E: Exception do
    begin
      dataSet.Cancel;
      dataSet.CancelUpdates;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TpendPrest._altervalorcorrigido. Erro: ' + e.Message);
//      verificaErroDataSetOpen(E.Message);
    end;
  end;
end;

function TpendPrest._concederAcrescimoDesconto: Boolean;
var
  vMensagem: string;
  vPercApurado: Real;
  vOK, vSelecao: Boolean;
  vSumDescPrest, vDifDesc: Double;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CXL080', 'ALTERAR', '', 'CONTROLE_CREDITOS', '', buscas, True) then
    Exit;

  try

    FValorCorrigido := 0;
    vSelecao := False;
    dataSet.First;
    while not dataSet.Eof do
    begin

      if (dataSet.FieldByName('SELEC').AsString = 'S') then
      begin
        if recebendo then
        begin
          retornaMensagemRecebimento('Desconto/Acréscimo não foi concedido');
          exit;
        end;
//          raiseExceptionCreate('Desconto/Acréscimo não foi concedido', '');

        fRemoverDesconto := True;
        corrigeValor;
//        _corrigirValor(False);

        if (dataSet.FieldByName('VALOR_CORR').AsFloat > 0) then
          FValorCorrigido := FValorCorrigido + dataSet.FieldByName('VALOR_CORR').AsFloat;

        vSelecao := true;
      end;

      dataSet.Next;
    end;
    if not vSelecao then
      raiseExceptionCreate('Nenhum registro selecionado','');

    FValorOperacao := FValorCorrigido;

    if _abreFormDesconto(FValorOperacao) then
    begin
      if DescontoAcrescimo = 'D' then
      begin
        if FDescontoValor > 0 then
          FValorCorrigido := FValorOperacao - FDescontoValor
        else if FDescontoPercentual > 0 then
          FValorCorrigido := vDadosIni.StrToFloatFormat(FValorOperacao - (FValorOperacao * FDescontoPercentual / 100), 2);//
        FDescontoValor := FValorOperacao - FValorCorrigido;
        vPercApurado := vDadosIni.StrToFloatFormat((((FValorOperacao - FValorCorrigido) * 100) / FValorOperacao), 2);

        vMensagem := 'Percentual máximo de desconto permitido = ' +
          FloatToStr(vDadosIni.vEmp.vMaxDescontoParcela) + '%' + #13 +
          'Percentual apurado de desconto = ' + formatfloat('0.00', vPercApurado) + '%' + #13 +
          'Valor da Prestação = R$' + formatfloat('0.00', FValorOperacao) + #13 +
          'Valor do desconto = R$' + formatfloat('0.00', (FValorOperacao - FValorCorrigido)) + #13 +
          'Valor da Prestação com desconto = R$' + formatfloat('0.00', FValorCorrigido) + #13 + #13 +
          'Deseja permitir este desconto?';

        vOK := Application.MessageBox(pchar(vMensagem), 'Confirmar Desconto?', MB_ICONQUESTION +
          MB_YESNO) = IDYES;

        if (not vOK) then
          exit;
        if (not _descontoPermitido) then
          if not vDadosIni.PesqPros('CXL082', 'PERMITIR', 'N.DOC: ' +
            dataSet.fieldbyname('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
            dataSet.fieldbyname('COD_CRED').AsString + '/' + dataSet.fieldbyname('N_DOC_C').AsString,
            Buscas, True) then
            exit;
      end
      else
      begin
        if FDescontoValor > 0 then
          FValorCorrigido := FValorOperacao + FDescontoValor
        else if FDescontoPercentual > 0 then
          FValorCorrigido := vDadosIni.StrToFloatFormat(FValorOperacao + (FValorOperacao * FDescontoPercentual / 100), 2);//
        FDescontoValor := FValorCorrigido - FValorOperacao;
        vPercApurado := vDadosIni.StrToFloatFormat((((FValorCorrigido - FValorOperacao) * 100) / FValorOperacao), 2);
      end;

      vSumDescPrest := 0;
      dataSet.First;
      while not dataSet.Eof do
      begin

        if (dataSet.FieldByName('SELEC').AsString = 'S') and (dataSet.FieldByName('VALOR_CORR').AsFloat > 0) and
          (not recebendo) then
        begin

          dataSet.Edit;
          if DescontoAcrescimo = 'D' then
          begin
            dataSet.FieldByName('VALOR_DESC').AsFloat := vDadosIni.StrToFloatFormat(
              (dataSet.FieldByName('VALOR_CORR').AsFloat * vPercApurado / 100), 2);
            dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;  
            dataSet.FieldByName('VALOR_CORR').AsFloat := vDadosIni.StrToFloatFormat(
              (dataSet.FieldByName('VALOR_CORR').AsFloat -
              dataSet.FieldByName('VALOR_DESC').AsFloat), 2);
            vSumDescPrest := vSumDescPrest + vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_DESC').AsFloat, 2);
          end
          else
          begin
            dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
            dataSet.FieldByName('VALOR_ACRESC').AsFloat := vDadosIni.StrToFloatFormat(
              (dataSet.FieldByName('VALOR_CORR').AsFloat * vPercApurado / 100), 2);
            dataSet.FieldByName('VALOR_CORR').AsFloat := vDadosIni.StrToFloatFormat(
              (dataSet.FieldByName('VALOR_CORR').AsFloat +
              dataSet.FieldByName('VALOR_ACRESC').AsFloat), 2);
            vSumDescPrest := vSumDescPrest + vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_ACRESC').AsFloat, 2);
          end;

          if dataSet.FieldByName('VALOR_CORR').value <= 0 then
            raiseExceptionCreate('Valor corrigido menor ou igual a zero, Operação não permitida', '')
          else if (DescontoAcrescimo = 'D')
           and (dataSet.FieldByName('VALOR_CORR').value < dataSet.FieldByName('VALOR_C').value) then
          begin
            Application.MessageBox(pchar('Valor corrigido menor que valor da Parcela.'),
              'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if not vDadosIni.PesqPros('CXL012', 'DESCONTO', 'N.DOC ' +
              Trim(dataSet.FieldByName('N_DOC_C').AsString) + ' VALOR_CORR ' +
              dataSet.FieldByName('VALOR_CORR').AsString +
              ' MENOR QUE VALOR_C ' + dataSet.FieldByName('VALOR_C').AsString, 'CONTROLE_CREDITOS',
              dataSet.FieldByName('cod_cred').AsString + '/' +
              Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
            begin
              //vDadosIni.GravaAuditoria('CXL012', 'DESCONTO', 'NAO PERMITIDO N.DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) + ' DESCONTO ' + dataSet.FieldByName('VALOR_DESC').AsString + ' LIQUIDO ' + dataSet.FieldByName('VALOR_CORR').AsString, FTable, dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
              raiseExceptionCreate('Valor corrigido menor que valor da Parcela, Operação não permitida para este Caixa', '');
            end;
          end;

          dataSet.Post;
          if DescontoAcrescimo = 'D' then
            vDadosIni.GravaAuditoria('CXL012', 'DESCONTO', 'N.DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) + ' DESCONTO ' +
              dataSet.FieldByName('VALOR_DESC').AsString + ' LIQUIDO ' + dataSet.FieldByName('VALOR_CORR').AsString, 'CONTROLE_CREDITOS',
              dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas)
          else
            vDadosIni.GravaAuditoria('CXL081', 'ACRESCIMO', 'N.DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) + ' ACRESCIMO ' +
              dataSet.FieldByName('VALOR_ACRESC').AsString + ' LIQUIDO ' + dataSet.FieldByName('VALOR_CORR').AsString, 'CONTROLE_CREDITOS',
              dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
        end;

        dataSet.Next;
      end;

      vDifDesc := vDadosIni.StrToFloatFormat(FDescontoValor, 2) - vDadosIni.StrToFloatFormat(vSumDescPrest, 2);

      if vDifDesc <> 0 then
      begin
        dataSet.First;
        while not dataSet.Eof do
        begin
          if (dataSet.FieldByName('SELEC').AsString = 'S') and (dataSet.FieldByName('VALOR_CORR').AsFloat > 0) then
          begin
            if DescontoAcrescimo = 'D' then
            begin
              if (dataSet.FieldByName('VALOR_CORR').AsFloat - vDifDesc) > 0 then
              begin
                dataSet.Edit;
                dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_CORR').AsFloat - vDifDesc;
                dataSet.FieldByName('VALOR_DESC').AsFloat := dataSet.FieldByName('VALOR_DESC').AsFloat + vDifDesc;
                dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;
                dataSet.Post;
                Break;
              end;
            end
            else
            begin
              if (dataSet.FieldByName('VALOR_CORR').AsFloat + vDifDesc) > 0 then
              begin
                dataSet.Edit;
                dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_CORR').AsFloat + vDifDesc;
                dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
                dataSet.FieldByName('VALOR_ACRESC').AsFloat := dataSet.FieldByName('VALOR_ACRESC').AsFloat + vDifDesc;
                dataSet.Post;
                Break;
              end;
            end;
          end;
          dataSet.Next;
        end;
      end;

      if dataSet.ChangeCount > 0 then
      begin
        if Apply then
        begin
          CommitaTransacao;

          if DescontoAcrescimo = 'D' then
            vDadosIni.GravaAuditoria('CXL012', 'DESCONTO', 'SUCESSO', 'CONTROLE_CREDITOS', '', buscas)
          else
            vDadosIni.GravaAuditoria('CXL081', 'ACRESCIMO', 'SUCESSO', 'CONTROLE_CREDITOS', '', buscas);
          if FrmPendPrestacao <> nil then
            _GravaConfiguracoesInteger(FrmPendPrestacao.RadioGroupDescontoAcrescimo.Name, FrmPendPrestacao.RadioGroupDescontoAcrescimo.ItemIndex);
        end;
      end;

    end;
  except on E: Exception do
    begin
      dataSet.Cancel;
      dataSet.CancelUpdates;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TpendPrest._concederAcrescimoDesconto. Erro: ' + e.Message);
//      verificaErroDataSetOpen(E.Message);
    end;
  end;
end;

function TpendPrest._descontoPermitido: Boolean;
begin
  Result := True;
  if vDadosIni.vEmp.vMaxDescontoParcela > 0 then
  begin
    FDescontoPercentual := vDadosIni.StrToFloatFormat((((FValorOperacao - FValorCorrigido) * 100) /
      FValorOperacao), 2);
    if (FDescontoPercentual > vDadosIni.vEmp.vMaxDescontoParcela) then
    begin
      Result := False;
      Application.MessageBox(pchar('Percentual apurado de desconto maior que o permitido de: ' +
        FloatToStr(vDadosIni.vEmp.vMaxDescontoParcela) + '%'), 'Atenção', 0 + 64);
    end;
  end
  else
  begin
    Result := False;
    Application.MessageBox('Nenhum desconto é permitido pela empresa', 'Atenção', 0 + 64);
  end;
end;

procedure TpendPrest.ImprimeREcG(vTipoiImp: integer; vTipoRec: integer; pLoteImp: Integer = 0);
var
  vlrec: currency;
  Arquivo: TextFile;
  //  i: Integer;
  NumNota, CodCliente, NomeCliente, ValorNota, Vencimento, Cidade: string;
//  NomeEmpresa, EndEmpresa, CEPEmpresa, CidadeEmpresa, UFEmpresa, InscEstadual, CNPJ: string;
  vlinha, vlnListData, vlnListDoc: integer;
  docDoRecibo, dataVencRecibos: TStringList;
  I: Integer;
begin
  try
    if pLoteImp > 0 then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select cc.n_doc_c, cc.vl_rq_pg_cxl valor, cc.cod_cliente, cc.nome_c, cc.data_venc_c from controle_creditos cc' +
        ' where cc.lote_cxl = ' + IntToStr(pLoteImp) +
        ' and cc.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa +
        ' order by 1';
      buscas.Open;

      buscas.FetchAll;
      if buscas.RecordCount <= 1 then
        pLoteImp := 0;

      CodCliente := buscas.FieldByName('cod_cliente').AsString;
      NomeCliente := buscas.FieldByName('nome_c').AsString;
//      dataVencRecibos := '';
//      docDoRecibo := '';
      dataVencRecibos := TStringList.Create;
      docDoRecibo := TStringList.Create;
      dataVencRecibos.Clear;
      docDoRecibo.Clear;
      vlrec := 0;
      vlnListData := 0;
      vlnListDoc := 0;
      docDoRecibo.Add('');
      dataVencRecibos.Add('');

      buscas.First;
      while not buscas.Eof do
      begin
        docDoRecibo[vlnListDoc] := docDoRecibo[vlnListDoc] + Trim(buscas.FieldByName('N_DOC_C').AsString) + ' / ';
        dataVencRecibos[vlnListData] := dataVencRecibos[vlnListData] + buscas.FieldByName('DATA_VENC_C').AsString + ' - ';
        if Length(docDoRecibo[vlnListDoc]) >= 75 then
        begin
          docDoRecibo[vlnListDoc] := Copy(docDoRecibo[vlnListDoc], 1, Length(docDoRecibo[vlnListDoc]) - 3);
          docDoRecibo.Add('');
          vlnListDoc := vlnListDoc + 1;
        end;
        if Length(dataVencRecibos[vlnListData]) >= 75 then
        begin
          dataVencRecibos[vlnListData] := Copy(dataVencRecibos[vlnListData], 1, Length(dataVencRecibos[vlnListData]) - 3);
          dataVencRecibos.Add('');
          vlnListData := vlnListData + 1;
        end;

        vlrec := vlrec + buscas.FieldByName('valor').AsFloat;
        buscas.Next;
      end;
      if copy(docDoRecibo[docDoRecibo.Count- 1], Length(docDoRecibo[docDoRecibo.Count- 1]) - 1, 1) = '/' then
        docDoRecibo[docDoRecibo.Count- 1] := Copy(docDoRecibo[docDoRecibo.Count- 1], 1, Length(docDoRecibo[docDoRecibo.Count- 1]) - 3);
      if copy(dataVencRecibos[dataVencRecibos.Count- 1], Length(dataVencRecibos[dataVencRecibos.Count- 1]) - 1, 1) = '-' then
        dataVencRecibos[dataVencRecibos.Count - 1] := Copy(dataVencRecibos[dataVencRecibos.Count - 1], 1, Length(dataVencRecibos[dataVencRecibos.Count - 1]) - 3);
//      System.Delete(docDoRecibo, Length(docDoRecibo) - 2, 3);
//      System.Delete(dataVencRecibos, Length(dataVencRecibos) - 2, 3);

    end;
    if pLoteImp > 0 then
    else
    if vTipoRec = 1 then
      vlrec := dataSet.FieldByName('VL_RQ_PG_CXL').value
    else
    begin
      vlrec := ValorRecParcial(vLoteCxlAtual);
    end;
    if vlrec <= 0 then
    begin
      messagedlg('Sem pagamento para o Documento', mtinformation, [mbOK], 0);
      exit;
    end;
    if vTipoiImp = 1 then // Impressora EPL
    begin
      NumNota := dataSet.FieldByName('N_DOC_C').value;
      CodCliente := dataSet.FieldByName('COD_CLIENTE').asstring;
      NomeCliente := dataSet.FieldByName('NOME_C').asstring;
      ValorNota := format('%8.2f', [vlrec]);
      Vencimento := dataSet.FieldByName('DATA_VENC_C').asstring;
      AssignFile(Arquivo, vDadosIni.vPortaImpressora); // depois mudar este parâmetro para vDadosIni.vimpEpl
      Rewrite(Arquivo);
      WriteLn(Arquivo, 'N');
      WriteLn(Arquivo, 'q560');
      WriteLn(Arquivo, 'Q0,0');
      WriteLn(Arquivo, 'ON');
      WriteLn(Arquivo, 'D8');
      WriteLn(Arquivo, 'JF');
      WriteLn(Arquivo, 'A540,15,1,3,1,1,N,"RECIBO"');
      WriteLn(Arquivo, 'A500,15,1,3,1,1,N,"CLIENTE: ' + CodCliente + ' Operador: ' + vDadosIni.vNomeUsuario + '"');
      WriteLn(Arquivo, 'A460,15,1,3,1,1,N,"RECEBEMOS DE: ' + NomeCliente + '"');
      WriteLn(Arquivo, 'A420,15,1,3,1,1,N,"A QUANTIA DE ' + Format('%m', [StrToFloat(ValorNota)]) + '"');
      WriteLn(Arquivo, 'A400,15,1,2,1,1,N,"' + UpperCase(Copy(Extenso(StrToFloat(ValorNota)), 1, 50)) + '"');
      WriteLn(Arquivo, 'A380,15,1,2,1,1,N,"' + UpperCase(Copy(Extenso(StrToFloat(ValorNota)), 51, 100)) + '"');

      WriteLn(Arquivo, 'A340,15,1,3,1,1,N,"REFERENTE A NOTA : ' + NumNota + '"');
      WriteLn(Arquivo, 'A300,15,1,3,1,1,N,"COM VENCIMENTO EM: ' + Vencimento + '"');
      WriteLn(Arquivo, 'A240,15,1,2,1,1,N,"' + trim(vDadosIni.vEmp.vCidade) + ', ' + DateToStr(Date) + '"');
      WriteLn(Arquivo, 'A180,15,1,1,1,1,N,"ASS.:____________________________________"');
      WriteLn(Arquivo, 'A160,15,1,3,1,1,N,"' + trim(vDadosIni.vEmp.vnomeEmpresa) + '"');

      WriteLn(Arquivo, 'A100,15,1,2,1,1,N,"' + trim(vDadosIni.vEmp.vEndereco) +', '+trim(vDadosIni.vEmp.vNumeroEnd) + '  CEP: ' + trim(vDadosIni.vEmp.vCEP) + '"');
      WriteLn(Arquivo, 'A80,15,1,2,1,1,N,"' + trim(vDadosIni.vEmp.vCidade) + ' - ' + trim(vDadosIni.vEmp.vSiglaUF) + '"');
      WriteLn(Arquivo, 'A60,15,1,2,1,1,N,"INSC. ESTADUAL: ' + trim(vDadosIni.vEmp.vIE) + ' - CNPJ: ' + trim(vDadosIni.vEmp.vCNPJ) + '"');
      WriteLn(Arquivo, 'LO20,705,520,3'); //Linha invisível
      WriteLn(Arquivo, 'P1');
      CloseFile(Arquivo);
    end
    else
    begin
      try
        if not vDadosIni.ModImp(DtmPrestacao.RdImpRec) then
          exit;
        vlinha := 1;
        DtmPrestacao.RdImpRec.OpcoesPreview.Preview := true;
        DtmPrestacao.RdImpRec.abrir;
        DtmPrestacao.RdImpRec.Imp(vlinha, 1, vDadosIni.replicate('_', 80));
        vlinha := vlinha + 2;
        if pLoteImp > 0 then
          DtmPrestacao.RdImpRec.ImpC(vlinha, 40, 'RECIBO : Lote ' + IntToStr(pLoteImp), [normal])
        else
          DtmPrestacao.RdImpRec.ImpC(vlinha, 40, 'RECIBO : ' + trim(dataSet.FieldByName('N_DOC_C').AsString), [normal]);
        vlinha := vlinha + 1;
        if pLoteImp > 0 then
          DtmPrestacao.RdImpRec.ImpC(vlinha, 40, 'CLIENTE: ' + vDadosIni.strzero(CodCliente, 6), [normal])
        else
          DtmPrestacao.RdImpRec.ImpC(vlinha, 40, 'CLIENTE: ' + vDadosIni.strzero(dataSet.FieldByName('COD_CLIENTE').asinteger, 6), [normal]);
        vlinha := vlinha + 1;
        if pLoteImp > 0 then
          DtmPrestacao.RdImpRec.Imp(vlinha, 7, 'Recebemos de: ' + copy(NomeCliente, 1, 27) + ' a  quantia supra de ' + format('%m', [vlrec]))
        else
          DtmPrestacao.RdImpRec.Imp(vlinha, 7, 'Recebemos de: ' + copy(dataSet.FieldByName('NOME_C').AsString, 1, 27) + ' a  quantia supra de ' + format('%m', [vlrec]));
        vlinha := vlinha + 1;
        if length(extenso(vlrec)) < 70 then
        begin
          DtmPrestacao.RdImpRec.imp(vlinha, 1, extenso(vlrec) + vDadosIni.replicate('*', 80 - length(extenso(vlrec))));
          vlinha := vlinha + 1;
          DtmPrestacao.RdImpRec.imp(vlinha, 1, vDadosIni.replicate('*', 80));
          vlinha := vlinha + 1;
        end
        else
        begin
          DtmPrestacao.RdImpRec.imp(vlinha, 1, copy(extenso(vlrec), 1, 80));
          vlinha := vlinha + 1;
          DtmPrestacao.RdImpRec.imp(vlinha, 1, copy(extenso(vlrec), 71, length(extenso(vlrec)) - 70) +
            vDadosIni.replicate('*', 80 - (length(extenso(vlrec)) - 80)));
          vlinha := vlinha + 1;
        end;
          //
        if pLoteImp > 1 then
        begin
          DtmPrestacao.RdImpRec.Imp(vlinha, 1, 'Referente as notas promissorias: ');
          vlinha := vlinha + 1;
          for I := 0 to docDoRecibo.Count - 1 do
          begin
            DtmPrestacao.RdImpRec.Imp(vlinha, 1, docDoRecibo[I]);
            vlinha := vlinha + 1;
          end;
          DtmPrestacao.RdImpRec.Imp(vlinha, 1, 'Com respectivos Vencimentos em: ');
          vlinha := vlinha + 1;
          for I := 0 to dataVencRecibos.Count - 1 do
          begin
            DtmPrestacao.RdImpRec.Imp(vlinha, 1, dataVencRecibos[I]);
            vlinha := vlinha + 1;
          end;
        end
        else
          DtmPrestacao.RdImpRec.Imp(vlinha, 1, 'Referente a nota promissória: ' + trim(dataSet.FieldByName('N_DOC_C').AsString) + ' Com Vencimento em: ' + dataSet.FieldByName('DATA_VENC_C').asstring);
        vlinha := vlinha + 2;
        DtmPrestacao.RdImpRec.Imp(vlinha, 30, trim(vDadosIni.vEmp.vCidade) + ', ' + datetostr(date));
        vlinha := vlinha + 3;
        DtmPrestacao.RdImpRec.Imp(vlinha, 30, vDadosIni.replicate('_', length(trim(vDadosIni.vEmp.vnomeEmpresa))));
        vlinha := vlinha + 1;
        DtmPrestacao.RdImpRec.Imp(vlinha, 30, trim(vDadosIni.vEmp.vnomeEmpresa));
        vlinha := vlinha + 2;
        DtmPrestacao.RdImpRec.Imp(vlinha, 1, vDadosIni.replicate('_', 80));
        vlinha := vlinha + 2;
        DtmPrestacao.RdImpRec.ImpC(vlinha, 40, trim(vDadosIni.vEmp.vEndereco) + ', '+trim(vDadosIni.vEmp.vNumeroEnd) + ' - ' + trim(vDadosIni.vEmp.vBairro)  + ' CEP: ' + trim(vDadosIni.vEmp.vCEP), [normal]);
        vlinha := vlinha + 1;
        DtmPrestacao.RdImpRec.ImpC(vlinha, 40, trim(vDadosIni.vEmp.vCidade) + ' - ' + vDadosIni.vEmp.vSiglaUF, [normal]);
        vlinha := vlinha + 1;
        DtmPrestacao.RdImpRec.ImpC(vlinha, 40, 'Inscr. Estadual: ' +trim(vDadosIni.vEmp.vIE) + ' - CNPJ: ' + vDadosIni.vEmp.vCNPJ, [normal]);
        vlinha := vlinha + 1;
        DtmPrestacao.RdImpRec.Imp(vlinha, 1, vDadosIni.replicate('_', 80));
      finally
        if DtmPrestacao.RdImpRec.EstaAberto then
          DtmPrestacao.RdImpRec.Fechar;
      end;
    end;
    buscas.Close;
  except
  end;
end;

procedure TpendPrest.ModImp(Print: TRDPrint; vtipo: string);
begin
  if vtipo = 'Epson' then
    (Print as TRDPrint).Impressora := Epson
  else if vtipo = 'Grafico' then
    (Print as TRDPrint).Impressora := Grafico
  else if vtipo = 'HP' then
    (Print as TRDPrint).Impressora := HP
  else if vtipo = 'Rima' then
    (Print as TRDPrint).Impressora := Rima;
end;

procedure TpendPrest.GeraBoleta(Contador, NumBoletas: Integer);
var
  Arquivo: TextFile;
  I, cont, j, b, a1, a2: Integer;
  msgStrTemp: string;
  //  ArqIni, PortaImpressora: string;
  //  ArqConfig: TiniFile;
begin
  AssignFile(Arquivo, vDadosIni.vPortaImpressora);
  try
    Rewrite(Arquivo);

    WriteLn(Arquivo, 'N'); //Limpa o buffer de impressão
    WriteLn(Arquivo, 'ZT'); //Direção da impressçao (de baixo pra cima)

    WriteLn(Arquivo, 'Q15,0'); //Comprimento (ou altura) da fita
    WriteLn(Arquivo, 'D15'); //Densidade da impressão - 1 a 15
    WriteLn(Arquivo, 'q565'); //Largura da cabeça de impressão (largura da fita)
    WriteLn(Arquivo, 'S4'); //Velocidade de impressão;
    WriteLn(Arquivo, 'ON');
    WriteLn(Arquivo, 'JF'); //Volta a fita para começar a imprimir;

    WriteLn(Arquivo, 'FK"CANHOTO"'); //Apaga o Form se ele já existir
    WriteLn(Arquivo, 'FS"CANHOTO"'); //Cria um novo Form
    WriteLn(Arquivo, 'V00,30,N,"prompt:"'); //Variável onde entra: NOME_CLIENTE
    WriteLn(Arquivo, 'V01,10,C,"prompt:"'); //Variável onde entra: PRESTACAO
    WriteLn(Arquivo, 'V02,13,N,"prompt:"'); //Variável onde entra: VENCIMENTO
    WriteLn(Arquivo, 'V03,13,C,"prompt:"'); //Variável onde entra: VALOR PREST.
    WriteLn(Arquivo, 'V04,10,C,"prompt:"'); //Variável onde entra: COD_CLIENTE
    WriteLn(Arquivo, 'V05,13,C,"prompt:"'); //Variável onde entra: APROVACAO
    WriteLn(Arquivo, 'V06,13,C,"prompt:"'); //Variável onde entra: CONTRATO
    WriteLn(Arquivo, 'V07,12,C,"prompt:"'); //Variável onde entra: GARANTIA
    WriteLn(Arquivo, 'V08,36,C,"prompt:"'); //Variável onde entra: NOME_EMPRESA

    //################# IMPRESSÃO DAS LINHAS DA TABELA ##############################

    WriteLn(Arquivo, 'LO20,10,3,620'); //Primeira vertical - lateral esquerda
    WriteLn(Arquivo, 'LO175,160,3,160'); //Segunda Vertical
    WriteLn(Arquivo, 'LO350,160,3,160'); //Terceira Vertical
    WriteLn(Arquivo, 'LO540,10,3,620'); //Última vertical - lateral direita

    WriteLn(Arquivo, 'LO20,10,520,3'); //Primeira Horizontal
    WriteLn(Arquivo, 'LO20,80,520,3'); //Segunda horizontal
    WriteLn(Arquivo, 'LO20,160,520,3'); //Terceira horizontal
    WriteLn(Arquivo, 'LO20,240,520,3'); //Quarta horizontal
    WriteLn(Arquivo, 'LO20,320,520,3'); //Quinta horizontal

    WriteLn(Arquivo, 'LO20,480,520,3'); //Sexta horizontal
    WriteLn(Arquivo, 'LO20,630,525,3'); //Sétima horizontal autenticacao

    WriteLn(Arquivo, 'LO20,705,520,3'); //Linha invisível

    //################# IMPRESSÃO DOS TÍTULOS DOS CAMPOS ##############################

    WriteLn(Arquivo, 'A30,40,0,3,1,1,N,""V08'); //Variável NOME_EMPRESA

    WriteLn(Arquivo, 'A25,90,0,1,1,1,N,"NOME CLIENTE"'); //1 campo Horiz.
    WriteLn(Arquivo, 'A30,135,0,2,1,1,N,""V00'); //Variável NOME_CLIENTE

    WriteLn(Arquivo, 'A25,170,0,1,1,1,N,"PRESTACAO"'); //2 linha Horiz. 1 vert.
    WriteLn(Arquivo, 'A30,215,0,3,1,1,N,""V01'); //Variável PRESTACAO

    WriteLn(Arquivo, 'A185,170,0,1,1,1,N,"VENCIMENTO"'); //2 linha Horiz. 2 vert.
    WriteLn(Arquivo, 'A190,215,0,3,1,1,N,""V02'); //Variável VENCIMENTO.

    WriteLn(Arquivo, 'A360,170,0,1,1,1,N,"VALOR PREST."'); //2 linha Horiz. 3 vert.
    WriteLn(Arquivo, 'A365,215,0,3,1,1,N,""V03'); //Variável VALOR PREST.

    WriteLn(Arquivo, 'A25,250,0,1,1,1,N,"COD. CLIENTE"'); //3 linha Horiz. 1 vert.
    WriteLn(Arquivo, 'A30,295,0,2,1,1,N,""V04'); //Variável COD_CLIENTE

    WriteLn(Arquivo, 'A185,250,0,1,1,1,N,"COD. VENDEDOR"'); //3 linha Horiz. 2 vert.
    WriteLn(Arquivo, 'A190,295,0,2,1,1,N,""V05'); //Variável COD. VENDEDOR

    WriteLn(Arquivo, 'A360,250,0,1,1,1,N,"CONTRATO"'); //3 linha Horiz. 3 vert.
    WriteLn(Arquivo, 'A365,295,0,2,1,1,N,""V06'); //Variável CONTRATO

    WriteLn(Arquivo, 'A30,375,0,2,1,1,N,""V07'); //Variável GARANTIA

    //No campo OBS_DECL_OS da empresa cada linha deve ter no máximo 36 caracteres para não cortar na impressão dos carnês da impressora térmica INTERMEC.
    cont := 355;
    for i := 0 to 5 do
    begin
      if pos(#13, vMensagemEmp) = 0 then
        msgStrTemp := copy(vMensagemEmp, 1, length(vMensagemEmp))
      else
        msgStrTemp := copy(vMensagemEmp, 1, pos(#13, vMensagemEmp) - 1);
      vMensagemEmp := copy(vMensagemEmp, length(msgStrTemp) + 3, length(vMensagemEmp));
//      WriteLn(Arquivo, 'A30,' + IntToStr(cont) + ',0,3,1,1,N,"' + Centraliza(msgStrTemp, 35) + '"'); //Entrada da variável:  MENSAGEM_EMPRESA
      WriteLn(Arquivo, 'A30,' + IntToStr(cont) + ',0,3,1,1,N,"' + msgStrTemp + '"'); //Entrada da variável:  MENSAGEM_EMPRESA - OBS_DECL_OS
      cont := cont + 20;
    end;

    WriteLn(Arquivo, 'A25,500,0,1,1,1,N,"AUTENTICACAO"'); //5 linha Horiz. 1 vert.
    WriteLn(Arquivo, 'FE'); //Salva o Form acima na memória da impressora

    WriteLn(Arquivo, 'N');
    WriteLn(Arquivo, 'FR"CANHOTO"'); //Abre o Form para receber as variáveis
    WriteLn(Arquivo, '?'); //Pega as variáveis para q elas sejam preenchidas abaixo
    WriteLn(Arquivo, '' + dataSet.FieldByName('NOME_C').Text + ''); //Entrada da variável:  NOME_CLIENTE
    WriteLn(Arquivo, '' + IntToStr(Contador) + '/' + IntToStr(NumBoletas) + ''); //Entrada da variável:  PRESTACAO
    WriteLn(Arquivo, '' + dataSet.FieldByName('DATA_VENC_C').Text + ''); //Entrada da variável:  VENCIMENTO
    WriteLn(Arquivo, '' + Format('%m', [dataSet.FieldByName('VALOR_C').AsCurrency]) + ''); //Entrada da variável:  VALOR PREST.
    WriteLn(Arquivo, '' + dataSet.FieldByName('COD_CLIENTE').Text + ''); //Entrada da variável:  COD_CLIENTE
    WriteLn(Arquivo, '' + dataSet.FieldByName('OP_CXL').Text + ''); //Entrada da variável:  APROVACAO
    WriteLn(Arquivo, '' + dataSet.FieldByName('N_DOC_V').Text + ''); //Entrada da variável:  CONTRATO
    WriteLn(Arquivo, ''); //Entrada da variável:  GARANTIA
    //  WriteLn(Arquivo, ''); //Entrada da variável:  MENSAGEM_EMPRESA
    WriteLn(Arquivo, '' + vDadosIni.vEmp.vRazaoSocial + ''); //Entrada da variável:  NOME_EMPRESA
    WriteLn(Arquivo, 'P1'); //Imprime o Form

    //-----------------------------BOLETA------------------------------------------------------------

    WriteLn(Arquivo, 'FK"BOLETA"'); //Apaga o Form da memória da impressora se ele já existir
    WriteLn(Arquivo, 'FS"BOLETA"'); //Abre e cria um novo Form na memória da impressora
    WriteLn(Arquivo, 'V00,30,N,"prompt:"'); //Variável onde entra: NOME_CLIENTE
    WriteLn(Arquivo, 'V01,10,C,"prompt:"'); //Variável onde entra: PRESTACAO
    WriteLn(Arquivo, 'V02,13,N,"prompt:"'); //Variável onde entra: VENCIMENTO
    WriteLn(Arquivo, 'V03,13,C,"prompt:"'); //Variável onde entra: VALOR PREST.
    WriteLn(Arquivo, 'V04,10,C,"prompt:"'); //Variável onde entra: COD_CLIENTE
    WriteLn(Arquivo, 'V05,13,C,"prompt:"'); //Variável onde entra: APROVACAO
    WriteLn(Arquivo, 'V06,13,C,"prompt:"'); //Variável onde entra: CONTRATO
    WriteLn(Arquivo, 'V07,12,C,"prompt:"'); //Variável onde entra: GARANTIA
    WriteLn(Arquivo, 'V08,13,C,"prompt:"'); //Variável onde entra: EMISSAO
    WriteLn(Arquivo, 'V09,13,C,"prompt:"'); //Variável onde entra: JUROS
    WriteLn(Arquivo, 'V10,36,C,"prompt:"'); //Variável onde entra: NOME_EMPRESA

    //################# IMPRESSÃO DAS LINHAS DA TABELA ##############################

    WriteLn(Arquivo, 'LO20,10,3,540'); //Primeira vertical - lateral esquerda
    WriteLn(Arquivo, 'LO175,80,3,240'); //Segunda Vertical
    WriteLn(Arquivo, 'LO350,80,3,240'); //Terceira Vertical
    WriteLn(Arquivo, 'LO540,10,3,540'); //Última vertical - lateral direita

    WriteLn(Arquivo, 'LO20,10,520,3'); //Primeira Horizontal
    WriteLn(Arquivo, 'LO20,80,520,3'); //Segunda horizontal
    WriteLn(Arquivo, 'LO20,160,520,3'); //Terceira horizontal
    WriteLn(Arquivo, 'LO20,240,520,3'); //Quarta horizontal
    WriteLn(Arquivo, 'LO20,320,520,3'); //Quinta horizontal
    WriteLn(Arquivo, 'LO20,400,520,3'); //Sexta horizontal
    WriteLn(Arquivo, 'LO20,550,525,3'); //Sétima horizontal autenticacao

    WriteLn(Arquivo, 'LO20,705,520,3'); //Linha invisível

    //################# IMPRESSÃO DOS TÍTULOS DOS CAMPOS ##############################

    WriteLn(Arquivo, 'A25,20,0,1,1,1,N,"NOME CLIENTE"'); //1 campo Horiz.
    WriteLn(Arquivo, 'A30,60,0,2,1,1,N,""V00'); //Variável NOME_CLIENTE

    WriteLn(Arquivo, 'A25,90,0,1,1,1,N,"PRESTACAO"'); //2 linha Horiz. 1 vert.
    WriteLn(Arquivo, 'A30,135,0,3,1,1,N,""V01'); //Variável PRESTACAO

    WriteLn(Arquivo, 'A185,90,0,1,1,1,N,"VENCIMENTO"'); //2 linha Horiz. 2 vert.
    WriteLn(Arquivo, 'A190,135,0,3,1,1,N,""V02'); //Variável VENCIMENTO.

    WriteLn(Arquivo, 'A360,90,0,1,1,1,N,"VALOR PREST."'); //2 linha Horiz. 3 vert.
    WriteLn(Arquivo, 'A365,135,0,3,1,1,N,""V03'); //Variável VALOR PREST.

    WriteLn(Arquivo, 'A25,170,0,1,1,1,N,"COD. CLIENTE"'); //3 linha Horiz. 1 vert.
    WriteLn(Arquivo, 'A30,215,0,2,1,1,N,""V04'); //Variável COD_CLIENTE

    WriteLn(Arquivo, 'A185,170,0,1,1,1,N,"COD. VENDEDOR"'); //3 linha Horiz. 2 vert.
    WriteLn(Arquivo, 'A190,215,0,2,1,1,N,""V05'); //Variável APROVACAO

    WriteLn(Arquivo, 'A360,170,0,1,1,1,N,"CONTRATO"'); //3 linha Horiz. 3 vert.
    WriteLn(Arquivo, 'A365,215,0,2,1,1,N,""V06'); //Variável CONTRATO

    WriteLn(Arquivo, 'A25,250,0,1,1,1,N,"GARANTIA"'); //4 linha Horiz. 1 vert.
    WriteLn(Arquivo, 'A30,295,0,2,1,1,N,""V07'); //Variável GARANTIA

    WriteLn(Arquivo, 'A185,250,0,1,1,1,N,"EMISSAO"'); //4 linha Horiz. 1 vert.
    WriteLn(Arquivo, 'A190,295,0,2,1,1,N,""V08'); //Variável EMISSAO

    WriteLn(Arquivo, 'A360,250,0,1,1,1,N,"JUROS"'); //4 linha Horiz. 1 vert.
    WriteLn(Arquivo, 'A365,295,0,2,1,1,N,""V09'); //Variável JUROS

    WriteLn(Arquivo, 'A30,355,0,3,1,1,N,""V10'); //Variável NOME_EMPRESA

    WriteLn(Arquivo, 'A25,420,0,1,1,1,N,"AUTENTICACAO"'); //5 linha Horiz. 1 vert.

    //################# IMPRESSÃO DAS VARIÁVEIS NOS CAMPOS ##############################

    WriteLn(Arquivo, 'FE'); //Fecha e Salva o Form na memória da impressora

    WriteLn(Arquivo, 'N');
    WriteLn(Arquivo, 'FR"BOLETA"'); //Abre o Form para receber as variáveis
    WriteLn(Arquivo, '?'); //Pega as variáveis para q elas sejam preenchidas abaixo
    WriteLn(Arquivo, '' + dataSet.FieldByName('NOME_C').Text + ''); //Entrada da variável:  NOME_CLIENTE
    WriteLn(Arquivo, '' + IntToStr(Contador) + '/' + IntToStr(NumBoletas) + ''); //Entrada da variável:  PRESTACAO
    WriteLn(Arquivo, '' + dataSet.FieldByName('DATA_VENC_C').Text + ''); //Entrada da variável:  VENCIMENTO
    WriteLn(Arquivo, '' + Format('%m', [dataSet.FieldByName('VALOR_C').AsCurrency]) + ''); //Entrada da variável:  VALOR PREST.
    WriteLn(Arquivo, '' + dataSet.FieldByName('COD_CLIENTE').Text + ''); //Entrada da variável:  COD_CLIENTE
    WriteLn(Arquivo, '' + dataSet.FieldByName('OP_CXL').AsString + ''); //Entrada da variável:  APROVACAO
    Buscas.Close;
    if dataSet.FieldByName('N_DOC_V').Asstring <> '' then
    begin
     Buscas.SQL.Text := 'SELECT NPREVENDA FROM REQVENDA WHERE NREQ = ' + dataSet.FieldByName('N_DOC_V').Asstring + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and ATIVO = 1';
     Buscas.Open;
    end;
    if not Buscas.IsEmpty then
      if not Buscas.FieldByName('NPREVENDA').isnull then
        WriteLn(Arquivo, '' + vDadosIni.strZero(Buscas.FieldByName('NPREVENDA').AsInteger, 7) + '') //Entrada da variável:  CONTRATO
      else
        WriteLn(Arquivo, '' + dataSet.FieldByName('N_DOC_V').Asstring + '') //Entrada da variável:  CONTRATO
    else
      WriteLn(Arquivo, '' + dataSet.FieldByName('N_DOC_V').Asstring + ''); //Entrada da variável:  CONTRATO
    WriteLn(Arquivo, ''); //Entrada da variável:  GARANTIA
    WriteLn(Arquivo, '' + DateToStr(Date) + ''); //Entrada da variável:  EMISSAO
    WriteLn(Arquivo, ''); //Entrada da variável:  JUROS
    WriteLn(Arquivo, '' + vDadosIni.vEmp.vRazaoSocial + ''); //Entrada da variável:  NOME_EMPRESA
    //if not dtmc.qrBuscas1.IsEmpty then
    //  WriteLn(Arquivo, '' + strZero(dtmc.qrBuscas1.FieldByName('NPREVENDA').Asinteger,7) + '')
    //else
    WriteLn(Arquivo, 'B120,570,0,3,2,5,75,B,"' + trim(dataSet.FieldByName('N_DOC_C').Asstring) + '"'); //Variável COD_BARRA
    WriteLn(Arquivo, 'P1');
  except
    CloseFile(Arquivo);
  end;
  CloseFile(Arquivo);
end;

function TpendPrest.Centraliza(Texto: string; NumChar: Integer): string;
var
  cont, i: Integer;
  strTemp:string;
begin
  strTemp:='';
  if Length(trim(Texto)) < NumChar then
  begin
    Texto := Trim(Texto);
    cont := NumChar - Length(trim(Texto));
    if cont>1 then
      for i := 0 to Round(cont / 2) do
       strTemp:=strTemp+' ';
  end;
  Result := strTemp + trim(Texto) + strTemp;
end;

function TpendPrest.DeletaLoteCxl(vLoteCxl: integer): boolean;
begin
  try
    result := true;
    if not transacao.InTransaction then
      transacao.StartTransaction;
    buscas.close;
    buscas.SQL.Text := 'delete from Lote_cxl where N_LOTE_CXL=' + intToStr(vLoteCxl) +
      ' and COD_EMPRESA =' + vDadosIni.codEmpresa + ' and ativo=1';
    buscas.ExecSQL;
    transacao.Commit;
  except
    result := false;
    transacao.Rollback;
  end;
end;

function TpendPrest.marcaRec(vtp: integer): boolean;
begin
  try
    result := true;
    if not transacao.InTransaction then
      transacao.StartTransaction;
    if edit then
    begin
      if vtp = 1 then
      begin
        dataSet.FieldByName('DIA_CXL').Value := vDadosIni.diaFCxl;
        dataSet.FieldByName('STATUS_CXL_RQ').value := 'R';
        dataset.FieldByName('OP_CXL').value := vDadosIni.vCodOpCxl;
        dataSet.FieldByName('LOTE_CXL').value := vLoteCxlAtual;
      end
      else
      begin
        dataSet.FieldByName('SELEC').value := null;
        dataSet.FieldByName('DIA_CXL').Value := null;
        dataSet.FieldByName('STATUS_CXL_RQ').value := null;
        dataset.FieldByName('OP_CXL').value := null;
        dataSet.FieldByName('LOTE_CXL').value := null;
        dataSet.FieldByName('TP_REC_CXL').value := null;
      end;
      Post;
      if Apply then
        result := true
      else
        Result := false;
    end;
    transacao.Commit;
  except
    if transacao.InTransaction then
      transacao.Rollback;
    Result := false;
    Application.MessageBox('Erro ao marcar o documento para recebimento','Erro', MB_OK+MB_ICONERROR);
  end;
end;

function TpendPrest.selecPrestacao(pExibirMsg:boolean = false): boolean;
begin
  try
    Result := true;
//    if dataSet.FieldByName('STATUS_CXL_RQ').AsString = '' then
//      dataSet.RefreshRecord;
    if dataSet.FieldByName('STATUS_CXL_RQ').AsString <> 'R' then
    begin
      if edit then
      begin
        if dataSet.FieldByName('SELEC').AsString = 'S' then
          dataSet.FieldByName('SELEC').value := null
        else
        begin
          dataSet.FieldByName('SELEC').AsString := 'S';
        end;
        post;
      end;
    end
    else if pExibirMsg then
      Application.MessageBox('Prestação já recebida, Cancele o recebimento caso queira corrigir algo.','Informação',MB_OK+MB_ICONINFORMATION);
  except
    Result := false;
    Application.MessageBox('Erro ao selecionar prestação para recebimento.'+chr(13)+'Possivelmente esta prestação já foi ou está sendo recebida por outro usuário.','Erro', MB_OK+MB_ICONERROR);
    dataset.CancelUpdates;
    dataset.refresh;
  end;
end;

function TpendPrest.validaRecebimentoPrestacao(pPrestacoesMarcadas: string): Boolean;
var
  vMensagemUS, vHistAuditoria: string;
  vOK: Boolean;
begin
  Result := True;

  if dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
    Exit;

  if pPrestacoesMarcadas = '' then
  	pPrestacoesMarcadas := IntToStr(dataSet.FieldByName('COD_CRED').AsInteger);

  pPrestacoesMarcadas := StringReplace(pPrestacoesMarcadas, '||', ',', [rfReplaceAll]);
  pPrestacoesMarcadas := StringReplace(pPrestacoesMarcadas, '|', '', [rfReplaceAll]);
  pPrestacoesMarcadas := ' and not cr.cod_cred in ( ' + pPrestacoesMarcadas + ')';

  buscas.Close;
  buscas.SQL.Text := 'select cr.selec,cr.cod_cred,cr.n_doc_c,cr.cod_cliente,cr.Nome_c,cr.Valor_c,cr.data_venc_c,' +
    ' cr.vl_rq_pg_cxl,cr.status_cxl_rq,cr.dia_cxl,cr.op_cxl,cr.valor_corr,cr.valor_desc,cr.valor_acresc,cr.LOTE_CXL,' +
    ' cr.tp_rec_cxl,cr.cpfcgc,cr.juros_cob,cr.tp_doc_v,cr.N_doc_v,cr.CODIGO_EMP,cr.COD_EMP_MULT,cr.CODIGO_CTRL,' +
    ' cr.COONAOFISCAL,cr.US_CANCELOU,cr.DT_US_CANCELOU,cr.OBS_PARACREDITO,cr.CODIGO_VEND,cr.TIP_CNT,cr.NSERIEECF,' +
    ' cr.COD_TERMINAL,cr.TIPO_DOC_C,cr.DATA_VENDA,cr.OP_CX,ctrl.NOME_CTRL ' +
    ' from CONTROLE_CREDITOS cr ' +
    ' inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp' +
    ' Where cr.dia_cxl is null and' +
    ' (cr.status_c is null or cr.status_c = '''') and' +
    ' (cr.op_cxl is null or cr.op_cxl = 0) and ctrl.entra_prest_cxl = ''S'' ' +
    ' and cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa +
    ' and cr.data_venc_c < ' + QuotedStr(FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('data_venc_c').AsDateTime)) +
    ' and cr.cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) + pPrestacoesMarcadas +
    ' order by cr.data_venc_c';
  buscas.Open;

  if buscas.IsEmpty then
    Exit;

  vMensagemUS := 'Cliente selecionado possui';
  buscas.FetchAll;

  if buscas.RecordCount > 1 then
    vMensagemUS := vMensagemUS + ' prestações'
  else
    vMensagemUS := vMensagemUS + ' prestação';
  vMensagemUS := vMensagemUS + ' com vencimento anterior a prestação selecionada' + #13;
  if buscas.RecordCount > 1 then
    vMensagemUS := vMensagemUS + 'Prestações:' + #13
  else
    vMensagemUS := vMensagemUS + 'Prestação:' + #13;

  vHistAuditoria := '';
  buscas.First;
  while not buscas.Eof do
  begin
    vMensagemUS := vMensagemUS + 'Doc: ' + Trim(buscas.fieldbyname('N_DOC_C').AsString) + ' - Vencimento: ' +buscas.fieldbyname('data_venc_c').AsString + #13;
    vHistAuditoria := vHistAuditoria + Trim(buscas.fieldbyname('N_DOC_C').AsString) + ',';
    buscas.Next;
  end;

  Application.MessageBox(PChar(vMensagemUS), 'Atenção', MB_ICONEXCLAMATION + MB_OK);

  if not vDadosIni.PesqPros('CXL075', 'PERMITIR', 'N.DOC: '+ vHistAuditoria, 'CONTROLE_CREDITOS', vHistAuditoria, Buscas, True, True) then
    Result := False;
end;

function TpendPrest.DeselecPrestacao: boolean;
begin
  try
    Result := true;
    if dataSet.FieldByName('STATUS_CXL_RQ').value <> 'R' then
    begin
      if not transacao.InTransaction then
        transacao.StartTransaction;
      if edit then
      begin
        if dataSet.FieldByName('SELEC').value = 'S' then
          dataSet.FieldByName('SELEC').value := null;
        post;
        if Apply then
          result := true
        else
          Result := false;
      end;
      transacao.Commit;
    end;
  except
    if transacao.InTransaction then
      transacao.Rollback;
    Result := false;
    MessageDlg('Erro ao Tirar seleção prestação marcada', mterror, [mbOK], 0);
  end;
end;

function TpendPrest.DeselecPrestacaoImediata: boolean;
var
  sqltemp: string;
begin
  sqltemp := dataset.CommandText;
  montaSelect('select op_cxl from controle_creditos where cod_cred = ' + dataset.FieldByName('COD_CRED').AsString +
    ' and (op_cxl is null or op_cxl = 0 or op_cxl = ' + inttostr(vDadosIni.vcodopcxl) + ')' +
    ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' = ' + vDadosIni.codEmpresa + ' and selec=''S''');
  try
    Result := true;
    First;
    while not dataset.Eof do
    begin
      if dataSet.FieldByName('STATUS_CXL_RQ').value <> 'R' then
      begin
        if not transacao.InTransaction then
          transacao.StartTransaction;
        if edit then
        begin
          if recebendo then
            dataSet.FieldByName('SELEC').value := null;
          post;
          if Apply then
            result := true
          else
            Result := false;
        end;
        transacao.Commit;
      end;
      dataset.Next;
    end;
  except
    if transacao.InTransaction then
      transacao.Rollback;
    Result := false;
    MessageDlg('Erro ao Tirar seleção da prestação.', mterror, [mbOK], 0);
  end;
end;

function TpendPrest.ChecaMesmoCli(vCodCliOld: integer; vCodCliNew: integer): boolean;
begin
  if vCodCliOld = vCodCliNew then
    result := true
  else
  begin
    Application.MessageBox('Cliente diferente do cliente da prestação marcada anteriormente', 'Informação', MB_OK+MB_ICONINFORMATION);
    result := false;
  end;
end;

function TpendPrest.ChecaMesmoVendedor(vCodVendOld,
  vCodVendNew: integer): boolean;
begin
  if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional <> 'S'  then
    Result := True
  else if vCodVendOld = vCodVendNew then
    result := true
  else
  begin
    Application.MessageBox('Vendedor diferente do vendedor da prestação marcada anteriormente', 'Informação', MB_OK+MB_ICONINFORMATION);
    result := false;
  end;
end;

function TpendPrest.ChecaMesmocontrole(vCodcontOld,
  vCodcontNew: integer): boolean;
begin
  if vCodcontOld = vCodcontNew then
    result := true
  else
  begin
    Application.MessageBox('Controle diferente do controle da prestação marcada anteriormente', 'Informação', MB_OK+MB_ICONINFORMATION);
    result := false;
  end;
end;


function TpendPrest.corrigeValor: boolean;
var
  txJuros, multas: double;
begin
  try
    Result := false;
    if dataSet.FieldByName('LOTE_CXL').asinteger <> 0 then
    begin
      Buscas.Close;
      Buscas.SQL.Text := 'SELECT * FROM FORMPAGAMENTO WHERE NREQUISICAO = ' + dataSet.FieldByName('LOTE_CXL').asstring +
        ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND TPDOCS = ''PRE'' AND ATIVO = 1';
      Buscas.Open;
      if not Buscas.IsEmpty then
      begin
        Application.MessageBox('Prestação já recebida neste dia, favor cancelar o recebimento para efetuar esta operação','Atenção' ,MB_OK+MB_ICONINFORMATION);
        exit;
      end;
    end;
    if not transacao.InTransaction then
      transacao.StartTransaction;
    if edit then
    begin
      PegaInfEmpresa;
      //        if (dataSet.FieldByName('DATA_VENC_C').value + Buscas.FieldByName('DIAS_CAR_JUROS').asinteger) < Date then
      if (dataSet.FieldByName('DATA_VENC_C').value + vDiasCareciaJuros) < vDadosIni.getDataBanco(buscas) then
      begin
        txJuros := (vDadosIni.getDataBanco(buscas) - dataSet.FieldByName('DATA_VENC_C').value) * (vTxJuros / 30);
        //          txJuros := (date - dataSet.FieldByName('DATA_VENC_C').value) * (Buscas.FieldByName('TX_JUROS').value / 30);
        multas := vMultas;
        //          multas := Buscas.FieldByName('MULTAS').value;

        Buscas.Close;
        Buscas.SQL.Text := 'select VALOR_CORR from baixa_creditos where cod_cred = ' + intTostr(dataSet.FieldByName('COD_CRED').AsInteger) +
          ' and tp_operacao = ''P'' AND ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
          ' = ' + vDadosIni.codEmpresa + ' order by SEQ_BXCRED desc';
        //          Buscas.ParamByName('vcodcred').Value := dataSet.FieldByName('COD_CRED').value;
        Buscas.Open;

        if Buscas.IsEmpty then
          dataSet.FieldByName('VALOR_CORR').value := formatfloat('0.00', (dataSet.FieldByName('VALOR_C').value + (((dataSet.FieldByName('VALOR_C').value * txJuros) / 100) +
            ((dataSet.FieldByName('VALOR_C').value * multas) / 100))))
        else
        begin
          if dataSet.FieldByName('VALOR_C').value = 0 then
            dataSet.FieldByName('VALOR_CORR').value := formatfloat('0.00', Buscas.FieldByName('VALOR_CORR').value + (((Buscas.FieldByName('VALOR_CORR').value * txJuros) / 100) +
              ((Buscas.FieldByName('VALOR_CORR').value * multas) / 100)))
          else
            dataSet.FieldByName('VALOR_CORR').value := formatfloat('0.00', Buscas.FieldByName('VALOR_CORR').value + (((dataSet.FieldByName('VALOR_C').value * txJuros) / 100) +
              ((dataSet.FieldByName('VALOR_C').value * multas) / 100)));
        end;
        Buscas.close;

        buscas.SQL.Text := 'select tp_plano from controles' +
          ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
          ' and tp_plano = ''C'' and codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if not buscas.IsEmpty then
          dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;

        dataSet.FieldByName('VALOR_DESC').value := 0;
        dataSet.FieldByName('VALOR_ACRESC').value := 0;
        Post;
      end
      else
      begin
        if (dataSet.FieldByName('VL_RQ_PG_CXL').value = 0) or (dataSet.FieldByName('VL_RQ_PG_CXL').isnull) then
          if dataSet.FieldByName('VALOR_C').AsFloat>0 then
             dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;
        buscas.Close;
        buscas.SQL.Text := 'select tp_plano from controles' +
          ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
          ' and tp_plano = ''C'' and codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if not buscas.IsEmpty then
          if dataSet.FieldByName('VALOR_C').AsFloat>0 then
             dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;
        dataSet.FieldByName('VALOR_DESC').value := 0;
        dataSet.FieldByName('VALOR_ACRESC').value := 0;
        Post;
      end;
      if Apply then
        result := true
      else
        Result := false;
    end;
    transacao.Commit;
  except
    if transacao.InTransaction then
      transacao.Rollback;
    Result := false;
    //        MessageDlg('Erro ao corrigirmarcar o documento para recebimento', mterror, [mbOK], 0);
  end;
end;

function TpendPrest.atualizaPendPrestacao(vFlagAtualiza: integer): boolean;
var
  vSql: string;
begin
  {
  if vFlagAtualiza = 1 then
  begin
    Result := montaSelect('select cr.selec,cr.cod_cred,cr.n_doc_c,cr.cod_cliente,cr.Nome_c,cr.Valor_c,cr.data_venc_c,' +
      ' cr.vl_rq_pg_cxl,cr.status_cxl_rq,cr.dia_cxl,cr.op_cxl,cr.valor_corr,cr.valor_desc,cr.valor_acresc,cr.LOTE_CXL,' +
      ' cr.tp_rec_cxl,cr.cpfcgc,cr.juros_cob,cr.tp_doc_v,cr.N_doc_v,cr.CODIGO_EMP,cr.COD_EMP_MULT,cr.CODIGO_CTRL,' +
      ' cr.COONAOFISCAL,cr.US_CANCELOU,cr.DT_US_CANCELOU,cr.OBS_PARACREDITO,cr.CODIGO_VEND,cr.TIP_CNT,cr.NSERIEECF,cr.COD_TERMINAL' +
      ' from CONTROLE_CREDITOS cr inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp' +
      ' Where (cr.dia_cxl = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) + ') and' +
      ' (cr.status_c is null or cr.status_c = '''') and' +
      ' (cr.op_cxl = ' + inttostr(vDadosIni.vcodopcxl) + ' or cr.op_cxl is null or cr.op_cxl = 0) and ctrl.entra_prest_cxl = ''S'' ' +
      ' and cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa +
      ' order by cr.nome_c,cr.n_doc_c ');
  end
  else
  begin
    Result := montaSelect('select cr.selec,cr.cod_cred,cr.n_doc_c,cr.cod_cliente,cr.Nome_c,cr.Valor_c,cr.data_venc_c,' +
      ' cr.vl_rq_pg_cxl,cr.status_cxl_rq,cr.dia_cxl,cr.op_cxl,cr.valor_corr,cr.valor_desc,cr.valor_acresc,cr.LOTE_CXL,' +
      ' cr.tp_rec_cxl,cr.cpfcgc,cr.juros_cob,cr.tp_doc_v,cr.N_doc_v,cr.CODIGO_EMP,cr.COD_EMP_MULT,cr.CODIGO_CTRL,' +
      ' cr.COONAOFISCAL,cr.US_CANCELOU,cr.DT_US_CANCELOU,cr.OBS_PARACREDITO,cr.CODIGO_VEND,cr.TIP_CNT,cr.NSERIEECF,cr.COD_TERMINAL' +
      ' from CONTROLE_CREDITOS cr inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp ' +
      ' Where (cr.dia_cxl is null or cr.dia_cxl = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) + ') and' +
      ' (cr.status_c is null or cr.status_c = '''') and' +
      ' (cr.op_cxl = ' + inttostr(vDadosIni.vcodopcxl) + ' or cr.op_cxl is null or cr.op_cxl = 0) and ctrl.entra_prest_cxl = ''S'' ' +
      ' and cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa +
      ' order by cr.nome_c,cr.n_doc_c ');
  end;
  }
  Result := montaSelect('select cr.selec,cr.cod_cred,cr.n_doc_c,cr.cod_cliente,cr.Nome_c,cr.Valor_c,cr.data_venc_c,' +
    ' cr.vl_rq_pg_cxl,cr.status_cxl_rq,cr.dia_cxl,cr.op_cxl,cr.valor_corr,cr.valor_desc,cr.valor_acresc,cr.LOTE_CXL,' +
    ' cr.tp_rec_cxl,cr.cpfcgc,cr.juros_cob,cr.tp_doc_v,cr.N_doc_v,cr.CODIGO_EMP,cr.COD_EMP_MULT,cr.CODIGO_CTRL,' +
    ' cr.COONAOFISCAL,cr.US_CANCELOU,cr.DT_US_CANCELOU,cr.OBS_PARACREDITO,cr.CODIGO_VEND,cr.TIP_CNT,cr.NSERIEECF,' +
    ' cr.COD_TERMINAL,cr.TIPO_DOC_C,cr.DATA_VENDA,cr.OP_CX,ctrl.NOME_CTRL ' +
    ' from CONTROLE_CREDITOS cr ' +
    ' inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp ' +
    ' Where ' +
      IfThen( vFlagAtualiza = 1,
        ' (cr.dia_cxl = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) + ') and' +
        ' (cr.status_c is null or cr.status_c = '''') and' +
        ' (cr.op_cxl = ' + inttostr(vDadosIni.vcodopcxl) + ' or cr.op_cxl is null or cr.op_cxl = 0)',

        ' (cr.dia_cxl is null or cr.dia_cxl = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) + ') and' +
        ' (cr.status_c is null or cr.status_c = '''') and' +
        ' (cr.op_cxl = ' + inttostr(vDadosIni.vcodopcxl) + ' or cr.op_cxl is null or cr.op_cxl = 0)'
      ) +
    ' and ctrl.entra_prest_cxl = ''S'' ' +
    ' and cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa +
    ' order by cr.nome_c,cr.n_doc_c ');

  try
    dataset.Filter:=' STATUS_CXL_RQ = ''R'' ';
    dataset.Filtered:=true;
    while not Eof do
    begin
      dataset.Edit;
      if ChecaDiferencaPendPrestacao then
        dataset.FieldByName('DIF').AsString:='S'
      else dataset.FieldByName('DIF').AsString:='';
      dataset.Post;
      next;
    end;
  finally
    dataset.Filtered:=false;
  end;
end;

function TpendPrest.atualizarValorCorr: boolean;
begin
	try
    Result := false;

    if edit then
    begin
	    dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;
      Post;

      if Apply then
        result := true
      else
        Result := false;

      transacao.Commit;
    end;
  except
    if transacao.InTransaction then
      transacao.Rollback;
    Result := false;
    //        MessageDlg('Erro ao corrigirmarcar o documento para recebimento', mterror, [mbOK], 0);
  end;
end;

function TpendPrest.ChecaDiferencaPendPrestacao: boolean;
var
  valorPago: currency;
begin
  //  dataSet.first;
  //  while not dataSet.eof do
  //  begin
  result := false;
  if dataSet.FieldByName('STATUS_CXL_RQ').value = 'R' then
  begin
    try
      if dataSet.FieldByName('LOTE_CXL').asinteger=0 then
      begin
        result:=true;
        exit;
      end;
      
      buscas.close;
      buscas.SQL.Text := 'select sum(valor_corr) as valorPago from controle_creditos where lote_cxl = ' + dataSet.FieldByName('LOTE_CXL').asstring +
        ' and op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
        ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa;
      buscas.Open;
      valorPago := Buscas.FieldByName('valorPago').AsCurrency;

      Buscas.Close;
      Buscas.SQL.Text := 'SELECT sum(valordoc) as valordoc FROM FORMPAGAMENTO WHERE NREQUISICAO = ' + dataSet.FieldByName('LOTE_CXL').asstring +
        ' and TPDOCS = ''PRE'' and OP_CXL = ' + inttostr(vDadosIni.vcodopcxl) +
        ' and COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and ATIVO = 1';
      Buscas.Open;
      if dataSet.FieldByName('tp_rec_cxl').AsString = 'P' then
        result := (dataSet.FieldByName('VL_RQ_PG_CXL').AsFloat = 0)
      else if (format('%n', [valorPago]) <> format('%n', [Buscas.FieldByName('valordoc').AsCurrency])) or (dataSet.FieldByName('VL_RQ_PG_CXL').asfloat=0) then
          result := true
        else
          result := false;
    except
      result := true;
    end;
    //    dataSet.next;
  end;
end;

function TpendPrest.CorrigeSaldoECxl(vsaldo_cxl: currency; vtotalEntradacxl: currency): boolean;
begin
  try
    if not transacao.InTransaction then
      transacao.StartTransaction;
    buscas.Close;
    Buscas.SQL.Text := 'UPDATE FECD_CXL SET TOT_E_CXL = :totalEntradacxl,SALDO_CXL= :saldo_cxl' +
      ' where DIA_F_CXL = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) +
      ' and op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
      ' and CODIGO_EMP =' + vDadosIni.codEmpresa;
    Buscas.ParamByName('totalEntradacxl').Value := vtotalEntradacxl - dataSet.FieldByName('VL_RQ_PG_CXL').value;
    Buscas.ParamByName('saldo_cxl').Value := vsaldo_cxl - dataSet.FieldByName('VL_RQ_PG_CXL').value;
    Buscas.Prepare;
    Buscas.ExecSQL;
    transacao.Commit;
    result := true;
  except
    transacao.Rollback;
    result := false;
  end;
end;

function TpendPrest.CorrigeSaldoSCxl(vsaldo_cxl: currency; vtotalSaidacxl: currency; vtroco: currency): boolean;
begin
  try
    if not transacao.InTransaction then
      transacao.StartTransaction;
    buscas.Close;
    Buscas.SQL.Text := 'UPDATE FECD_CXL SET TOT_S_CXL = :totalSaidacxl,SALDO_CXL= :saldo_cxl' +
      ' where DIA_F_CXL = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) +
      ' and op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
      ' and CODIGO_EMP =' + vDadosIni.codEmpresa;
    Buscas.ParamByName('totalSaidacxl').Value := vtotalSaidacxl - vtroco;
    Buscas.ParamByName('saldo_cxl').Value := vsaldo_cxl + vtroco;
    Buscas.Prepare;
    Buscas.ExecSQL;
    transacao.Commit;
    result := true;
  except
    transacao.Rollback;
    result := false;
  end;
end;

function TpendPrest.LacamentoDeTroco: boolean;
begin
  vCodLancCxl := 0;
  vValorLanc := 0;
  try
//    if not transacao.InTransaction then
//      transacao.StartTransaction;
    Buscas.Close;
    Buscas.SQL.Text := 'select * from lanccxl where tipo_doc_cxl = ''PRE'' and n_doc_cxl = ' + dataSet.FieldByName('LOTE_CXL').aSstring +
      ' and tr = ''S'' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if not buscas.IsEmpty then
    begin
      if not buscas.FieldByName('COD_LANCXL').IsNull then
        vCodLancCxl := buscas.FieldByName('COD_LANCXL').Value;
      if not buscas.FieldByName('VALOR_CXL').IsNull then
        vValorLanc := buscas.FieldByName('VALOR_CXL').Value;
      result := true;
    end
    else
      result := false;
    buscas.Close;
//    transacao.Commit;
  except
    result := false;
//    transacao.Rollback;
  end;
end;

function TpendPrest.DelLacamentoDeTroco(codLancamento: integer): boolean;
begin
  try
    result := true;
    if not transacao.InTransaction then
      transacao.StartTransaction;
    Buscas.Close;
    Buscas.SQL.Text := 'DELETE FROM lanccxl where COD_LANCXL=' + intToStr(codLancamento) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;
    transacao.Commit;
  except
    result := false;
    transacao.Rollback;
  end;
end;

function TpendPrest.DescontoPermitido: boolean;
begin
  result := true;
  if vPercDescEmp <> 0 then
  begin
    vPercDescontoCalc := (((vValorCorrSemDesc - vValorCorrComDesc) * 100) / vValorCorrSemDesc);
    if (vPercDescontoCalc > vPercDescEmp) then
    begin
      if Application.MessageBox(Pchar('Percentual apurado de desconto maior que o permitido de: ' + floattostr(vPercDescEmp) + '%'+chr(13)+ 'Permitir o desconto assim mesmo?'), 'Confirmação', MB_YESNO + MB_DEFBUTTON1) = mrYES then
      begin
        if not vDadosIni.PesqPros('CXL013','PERMITIR','N.DOC: '+
            dataSet.fieldbyname('N_DOC_C').AsString,'CONTROLE_CREDITOS',dataSet.fieldbyname('N_DOC_C').AsString,Buscas,True) then
          result:=false;
      end
      else
      	result := false;
    end;
  end
  else
  begin
    if Application.MessageBox(Pchar('Nenhum desconto é permitido pela empresa.'+chr(13)+ 'Permitir o desconto assim mesmo?'), 'Confirmação', MB_YESNO + MB_DEFBUTTON1) = mrYES then
    begin
      if not vDadosIni.PesqPros('CXL013','PERMITIR','N.DOC: '+
        dataSet.fieldbyname('N_DOC_C').AsString,'CONTROLE_CREDITOS',dataSet.fieldbyname('N_DOC_C').AsString,Buscas,True) then
          result:=false;
    end
    else
    	result := false;
  end;
end;

function TpendPrest.CancelaProcesso: boolean;
begin
  result := false;
  if vCancela then
    if Application.MessageBox('Quer realmente cancelar esta operação?', 'Confirmação', MB_YESNO + MB_DEFBUTTON1) = mrYES then
    begin
      First;
      while not dataSet.Eof do
      begin
        if not jarecebida then
          marcaRec(0);
        dataSet.Next;
      end;
      Apply;
      Refresh;
      First;
      vCancela := false;
      result := true;
    end
    else
    begin
      vCancela := false;
      result := false;
    end;
end;

function TpendPrest.CancelaProcessoImediato: boolean;
begin
  result := false;
  if vCancela then
    if Application.MessageBox('Quer realmente cancelar esta operação?', 'Confirmação', MB_YESNO + MB_DEFBUTTON1) = mrYES then
    begin
      Apply;
      Refresh;
      First;
      vCancela := false;
      result := true;
    end
    else
    begin
      vCancela := false;
      result := false;
    end;
end;

function TpendPrest.CancelaRecPrestacao: boolean;
var
  vPrest : TStringList;
  i:integer;
begin
  try
    try
      Result := false;
      vLoteCxlAtual := dataSet.FieldByName('LOTE_CXL').AsInteger;
      if not transacao.InTransaction then
        transacao.StartTransaction;
      vPrest := TStringList.create;
      if dataSet.FieldByName('LOTE_CXL').AsInteger = 0 then
      begin
        vPrest.Add('Lote : Sem Lote, Cred. :'+dataSet.fieldbyname('COD_CRED').AsString+
          ' N.Doc: '+ dataSet.fieldbyname('N_DOC_C').AsString+
          '|'+ dataSet.fieldbyname('COD_CRED').AsString+'|');
        if edit then
        begin
          dataSet.FieldByName('VL_RQ_PG_CXL').Value := null;
          dataSet.FieldByName('DIA_CXL').Value := null;
          dataSet.FieldByName('JUROS_COB').Value := null;
          dataSet.FieldByName('STATUS_CXL_RQ').value := null;
          dataset.FieldByName('LOTE_CXL').value := null;
          dataset.FieldByName('OP_CXL').value := 0;
          dataset.FieldByName('US_CANCELOU').value := Trim(vDadosIni.vUsuarioAutorizou);
          dataset.FieldByName('DT_US_CANCELOU').value := vDadosIni.diaFCxl;
          dataset.FieldByName('TP_REC_CXL').value :=NULL;
          Post;
          if Apply then
            result := true
          else
            Result := false;
          transacao.Commit;
          vDadosIni.GravaAuditoria('CXL010', '', '- SUCESSO '+vDadosIni.getCampoPipe(vPrest[0],1),
          'CONTROLE_CREDITOS',vDadosIni.getCampoPipe(vPrest[0],2), buscas);
        end;
      end
      else
      begin
        buscas.Close;
        buscas.SQL.Text := 'select LOTE_CXL,N_DOC_C,COD_CRED FROM CONTROLE_CREDITOS '+
            ' WHERE LOTE_CXL = ' + inttostr(dataSet.FieldByName('LOTE_CXL').AsInteger) +
            ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa;
        buscas.open;
        while not buscas.Eof do
        begin
          vPrest.Add('Lote :'+ buscas.FieldByName('LOTE_CXL').asstring+
          ' Cred. :'+buscas.fieldbyname('COD_CRED').AsString+
          ' N.Doc: '+ buscas.fieldbyname('N_DOC_C').AsString+
          '|'+ buscas.fieldbyname('COD_CRED').AsString+'|');
          buscas.Next;
        end;

        buscas.Close;
        buscas.SQL.Text := 'UPDATE CONTROLE_CREDITOS SET VL_RQ_PG_CXL = NULL,DIA_CXL = NULL,JUROS_COB = 0,' +
            'STATUS_CXL_RQ = NULL, LOTE_CXL = NULL,OP_CXL = 0, TP_REC_CXL=NULL,US_CANCELOU=' +
            quotedstr(vdadosini.vUsuarioAutorizou) + ', DT_US_CANCELOU= :pDT_US_CANCELOU ' +
            ' WHERE LOTE_CXL = ' + inttostr(dataSet.FieldByName('LOTE_CXL').AsInteger) +
            ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa;
        buscas.ParamByName('pDT_US_CANCELOU').AsDate := vDadosIni.diaFCxl;
        buscas.Prepare;
        buscas.ExecSQL;
        transacao.Commit;
        for I := 0 to vPrest.Count - 1 do
          vDadosIni.GravaAuditoria('CXL010', '', '- SUCESSO '+vDadosIni.getCampoPipe(vPrest[i],1),
          'CONTROLE_CREDITOS', vDadosIni.getCampoPipe(vPrest[i],2) , buscas);
      end;
    except
      vDadosIni.GravaAuditoria('CXL010', '', '- FALHA '+vDadosIni.getCampoPipe(vPrest[0],2),
      'CONTROLE_CREDITOS',vDadosIni.getCampoPipe(vPrest[0],2) , buscas);
      if transacao.InTransaction then
        transacao.Rollback;
      Result := false;
    end;
  finally
    FreeAndNil(vPrest);
  end;
end;

procedure TpendPrest.PegaInfDiaFec;
begin
  vTotalECxl := 0;
  vTotalSCxl := 0;
  vSaldoCxl := 0;
  try
    //    result := true;
    buscas.Close;
    buscas.SQL.Text := 'select * from fecd_cxl where op_cxl = ' + inttostr(vDadosIni.vcodopcxl) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa +
      ' and DIA_F_CXL = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)); //order by dia_f_cxl desc';
    buscas.Open;
    if not buscas.FieldByName('SALDO_CXL').IsNull then
      vSaldoCxl := buscas.FieldByName('SALDO_CXL').Value;
    if not buscas.FieldByName('TOT_E_CXL').IsNull then
      vTotalECxl := buscas.FieldByName('TOT_E_CXL').Value;
    if not buscas.FieldByName('TOT_S_CXL').IsNull then
      vTotalSCxl := buscas.FieldByName('TOT_S_CXL').Value;
    buscas.Close;
  except
    //    result := false;
  end;
end;

procedure TpendPrest.PegaInfEmpresa;
begin
  vTxJuros := 0;
  vMultas := 0;
  vDiasCareciaJuros := 0;
  try
    Buscas.Close;
    Buscas.SQL.Text := 'SELECT * FROM EMPRESA WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1';
    Buscas.Open;
    if not buscas.FieldByName('TX_JUROS').IsNull then
      vTxJuros := buscas.FieldByName('TX_JUROS').Value;
    if not buscas.FieldByName('MULTAS').IsNull then
      vMultas := buscas.FieldByName('MULTAS').Value;
    if not buscas.FieldByName('DIAS_CAR_JUROS').IsNull then
      vDiasCareciaJuros := buscas.FieldByName('DIAS_CAR_JUROS').Value;
    if not buscas.FieldByName('MAXDESCPARC').IsNull then
      vPercDescEmp := buscas.FieldByName('MAXDESCPARC').Value;
    if not buscas.FieldByName('OBS_DECL_OS').IsNull then
      vMensagemEmp := buscas.FieldByName('OBS_DECL_OS').Value;
    if not buscas.FieldByName('UTIL_AUD').IsNull then
      vDadosIni.vEmp.vUsarAuditoria := buscas.FieldByName('UTIL_AUD').Value;
    buscas.Close;
  except
  end;

end;

function TpendPrest.PesquisaPendPrestacao(fimSql: string): boolean;
begin
  result := montaSelect('select cr.selec,cr.cod_cred,cr.n_doc_c,cr.cod_cliente,cr.Nome_c,cr.Valor_c,cr.data_venc_c,' +
    ' cr.vl_rq_pg_cxl,cr.status_cxl_rq,cr.dia_cxl,cr.op_cxl,cr.valor_corr,cr.valor_desc,cr.valor_acresc,cr.LOTE_CXL,' +
    ' cr.tp_rec_cxl,cr.cpfcgc,cr.juros_cob,cr.tp_doc_v,cr.N_doc_v,cr.CODIGO_EMP,cr.COD_EMP_MULT,cr.CODIGO_CTRL,' +
    ' cr.COONAOFISCAL,cr.US_CANCELOU,cr.DT_US_CANCELOU,cr.OBS_PARACREDITO,cr.CODIGO_VEND,cr.TIP_CNT,cr.NSERIEECF,' +
    ' cr.COD_TERMINAL,cr.TIPO_DOC_C,cr.DATA_VENDA,cr.OP_CX,ctrl.NOME_CTRL ' +
    ' from CONTROLE_CREDITOS cr ' +
    ' inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp' +
    ' Where (cr.dia_cxl is null or cr.dia_cxl = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) + ') and' +
    ' (cr.status_c is null or cr.status_c = '''') and' +
    ' (cr.op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) + ' or cr.op_cxl is null or cr.op_cxl = 0) and ctrl.entra_prest_cxl = ''S'' ' +
    ' and cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa + fimSql);
end;

function TpendPrest.ChecaUsuarioSenha(usuario: string; senha: string; CodProcesso: string): boolean;
begin
  try
    if not transacao.InTransaction then
      transacao.StartTransaction;
    Buscas.Close;
    Buscas.SQL.Text := 'select NIVEL_US, USUARIO from SENHAS where USUARIO = ' + quotedstr(usuario) +
      ' and SENHA = ' + quotedstr(senha) + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1';
    buscas.open;
    if buscas.IsEmpty then
    begin
      MessageDlg('Usuário ou Senha inválida!', mtError, [mbOk], 0);
      result := false;
    end
    else
    begin
      vNivelGerente := buscas.FieldByName('NIVEL_US').value;
      vUsuarioGerente := Trim(buscas.FieldByName('USUARIO').value);
      Buscas.Close;
      Buscas.SQL.Text := 'select NIVEL_PROCESSO,NOME_PROCESSO from TABELA_PROCESSOS where COD_PROCESSO = ' + quotedstr(CodProcesso) +
        ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1';
      buscas.open;
      if buscas.IsEmpty then
      begin
        MessageDlg('Você não tem permissão para acessar este processo!', mtError, [mbOk], 0);
        result := false;
      end
      else
      begin
        if buscas.FieldByName('NIVEL_PROCESSO').value > vNivelGerente then
        begin
          MessageDlg('Você não tem permissão para acessar este processo!', mtError, [mbOk], 0);
          result := false;
        end
        else
        begin
          result := true;
        end;
      end;
    end;
    buscas.Close;
    transacao.Commit;
  except
    result := false;
    if transacao.InTransaction then
      transacao.Rollback;
  end;
end;

function TpendPrest.post: boolean;
begin
  dataSet.Post;
end;

function TpendPrest.recebendo: boolean;
begin
//  result :=
  buscas.Close;
  buscas.SQL.Text := 'select op_cxl from controle_creditos where cod_cred = ' + dataset.FieldByName('COD_CRED').AsString +
//    ' and (op_cxl is null or op_cxl = 0) '+// or op_cxl = ' + inttostr(vDadosIni.vcodopcxl) + ')' +
    ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa;
  buscas.Open;
  Result := buscas.FieldByName('op_cxl').AsInteger > 0;
  if result then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select op_cx from controle_creditos where cod_cred = ' + dataset.FieldByName('COD_CRED').AsString +
//    ' and (op_cx is null or op_cx = 0 )' +
    ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIni.codEmpresa;
  buscas.Open;
  Result := buscas.FieldByName('op_cx').AsInteger > 0;
//  result := not result;
end;

function TpendPrest.Recibo_PrintNaoFiscal(loteid: Integer): Boolean;
const
  TitlePrest      = 'PRESTACOES';
var
  Conf: TConfig_sistema_class;
  Colunas, ColunasCondensado: Integer;
  report, reportPrest, modelPrest: TStrings;
  I, Resposta: Integer;
  Linha, StrRel, ConfName: string;
  AgenteId: string;
  ArquivoIniPosPrinterNaoFiscal: string;
  Condensado: Boolean;

  modelSelected, strFields, tag, fieldname: string;
  entities: TStrings;
  fields: TStrings;
  sourceData, client: TDataSet_OOP;
  J, K, fieldsize: Integer;
  ValorPago: Double;
begin
  Result        := False;
  Conf          := TConfig_sistema_class.getConf('prest_recibo_nao_fiscal', buscas, vDadosIni.cod_empresa);

  if not Conf.AsBoolean then
  begin
    ShowAtencao('Configuração para impressão não fiscal está desativada' + sLineBreak +
                'Por favor ative nas configurações globais ou utilize outra forma de impressão');
    Exit;
  end;
  Conf.AtivarMapeamentoKeys;

  modelPrest  := TStringList.Create;
  reportPrest := TStringList.Create;
  report      := TStringList.Create;
  try

    Colunas           := StrToIntDef(Conf.ReadString('Conf', 'Colunas'          , '48'), 48);
    ColunasCondensado := StrToIntDef(Conf.ReadString('Conf', 'ColunasCondensado', '56'), 56);
    ConfName          := Conf.ReadString('Conf', 'FileNameCofigPosPrinter', 'PosPrinter');

    modelPrest.Text := Copy(Conf.value1_b.Text,
                               Pos('[*'  + TitlePrest + '*]', Conf.value1_b.Text),
                               Pos('[*/' + TitlePrest + '*]', Conf.value1_b.Text) -
                               Pos('[*'  + TitlePrest + '*]', Conf.value1_b.Text) + Length(TitlePrest) + 5);

    if modelPrest.Text <> '' then
    begin
      if modelPrest.Count > 0 then
        modelPrest.Delete(modelPrest.Count - 1); //linha final
      if modelPrest.Count > 0 then
        modelPrest.Delete(0); //linha inicial
    end;

    ValorPago := 0;
    client := TDataSet_OOP.Create(buscas.Database, transacao);
    if loteid > 0 then
    begin
      client.ClientOpen('select %s, VL_RQ_PG_CXL from controle_creditos' +
                        ' where lote_cxl = %d and %s = %d order by n_doc_c',
                        [GetEntitiesFieldsSql(modelPrest, 'PRESTACAO'),loteid,
                         IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP'), vDadosIni.cod_empresa]);
      if client.dataSet.RecordCount > 1 then
      begin

        client.First;
        while not Client.Eof do
        begin
          Linha := StringReplace(modelPrest.Text, sLineBreak, '', [rfReplaceAll]);

          for K := 0 to client.dataSet.FieldCount - 1 do
          begin
            tag := Format('[/PRESTACAO.%s]', [client.dataSet.Fields[K].FieldName]);
            if client.dataSet.Fields[K] is TFloatField then
              Replace(Linha, tag, StrNumber(Client.ffloat(client.dataSet.Fields[K].FieldName)))
            else if client.dataSet.Fields[K] is TIntegerField then
              Replace(Linha, tag, PadL(Client.fint(client.dataSet.Fields[K].FieldName), 6))
            else
              Replace(Linha, tag, Client.fstr(client.dataSet.Fields[K].FieldName));
          end;

          ValorPago := ValorPago + client.ffloat('VL_RQ_PG_CXL');

          reportPrest.Add(Linha);
          Client.Next;
        end
      end
      else
        loteid := 0;
    end;

    modelSelected := IfThen(loteid > 0, 'ReciboLote', 'ReciboIndividual');

    report.Text := Copy(Conf.value1_b.Text,
                           Pos('[*'  + modelSelected + '*]', Conf.value1_b.Text),
                           Pos('[*/' + modelSelected + '*]', Conf.value1_b.Text) -
                           Pos('[*'  + modelSelected + '*]', Conf.value1_b.Text) + Length(modelSelected) + 5);

    if report.Text <> '' then
    begin
      if report.Count > 0 then
        report.Delete(report.Count - 1); //linha final
      if report.Count > 0 then
        report.Delete(0); //linha inicial
    end;


    entities := GetEntities(report);
    StrRel := report.Text;

    if loteid = 0 then
      if fequals('TP_REC_CXL', 'T') then
        ValorPago := ffloat('VL_RQ_PG_CXL')
      else
        ValorPago := ValorRecParcial(loteid);

    Replace(StrRel, '{EXTENSO[/VALORPAGO]}', vDadosIni.Extenso(ValorPago));
    Replace(StrRel, '[/VALORPAGO]', StrNumber(ValorPago));
                                    
    for I := 0 to entities.Count - 1 do
    begin

      if Assigned(client) then
         FreeAndNil(client);

      client := TDataSet_OOP.Create(buscas.Database, transacao);

      if entities[I] = 'PRESTACOES' then
        Replace(StrRel, '[/PRESTACOES]', reportPrest.Text)
      else if entities[I] = 'PRESTACAO' then
        client.ClientOpen('select first 1 %s from controle_creditos cc' +
                          ' where %s = %d and %s = %d order by 1',
                          [GetEntitiesFieldsSql(report, entities[I]),
                           IfThen(loteid > 0, 'lote_cxl', 'cod_cred'),
                           IfThen(loteid > 0, loteid, fint('cod_cred')),
                           IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP'), vDadosIni.cod_empresa])
      else if entities[I] = 'EMPRESA' then
        client.ClientOpen('select %s from empresa where cod_empresa = %d',
                          [StrDefault(GetEntitiesFieldsSql(report, entities[I]), '*'), vDadosIni.cod_empresa])
      else if entities[I] = 'CLIENTE' then
        client.ClientOpen('select %s from clientes where cod_clente = %d and cod_empresa = %d',
                          [StrDefault(GetEntitiesFieldsSql(report, entities[I]), '*'), fint('cod_cliente'), vDadosIni.cod_empresa]);

      if client.dataSet.Active then
        for K := 0 to client.dataSet.FieldCount - 1 do
        begin
          fieldname := client.dataSet.Fields[K].FieldName;
          tag := Format('[/%s.%s]', [entities[I], fieldname]);
          if client.dataSet.Fields[K] is TFloatField then
          begin
            Replace(StrRel, '{EXTENSO' + tag + '}', vDadosIni.Extenso(Client.ffloat(fieldname)));
            Replace(StrRel, tag, StrNumber(Client.ffloat(fieldname)));
          end
          else if client.dataSet.Fields[K] is TIntegerField then
          begin
            Replace(StrRel, '{PADL3' + tag + '}', PadL(Client.fint(fieldname), 3));
            Replace(StrRel, '{PADL6' + tag + '}', PadL(Client.fint(fieldname), 6));
            Replace(StrRel, tag, Client.fstr(fieldname));
          end
          else
          begin
            fieldsize := StrLength(client.fstr(fieldname));
            if fieldsize = 8 then
              Replace(StrRel, '{CEP' + tag + '}', FormatMaskText('00.000-000;0;_', Client.fstr(fieldname)));
            if fieldsize = 10 then
              Replace(StrRel, '{FONE' + tag + '}', FormatMaskText('(00)0000-0000;0;_', Client.fstr(fieldname)));
            if fieldsize = 11 then
            begin
              Replace(StrRel, '{FONE'    + tag + '}', FormatMaskText('(00)00000-0000;0;_', Client.fstr(fieldname)));
              Replace(StrRel, '{CPFCNPJ' + tag + '}', FormatMaskText('000.000.000-00;0;_', Client.fstr(fieldname)));
            end;
            if fieldsize = 14 then
              Replace(StrRel, '{CPFCNPJ' + tag + '}', FormatMaskText('00.000.000/0000-00;0;_', Client.fstr(fieldname)));

            Replace(StrRel, tag, Client.fstr(client.dataSet.Fields[K].FieldName));
          end;
        end;
    end;

    Replace(StrRel, '[/DATE]', FormatDateTime('DD/MM/YYYY', Date));
    Replace(StrRel, '[/TIME]', FormatDateTime('DD/MM/YYYY', Time));
    Replace(StrRel, '[/NOW]', FormatDateTime('DD/MM/YYYY hh:mm', Now));
    Replace(StrRel, '[/ASTERISCOS]', '¢');

    report.Text := StrRel;
    report.Text := ReplaceFor(report, ColunasCondensado, Colunas);
    report.Text := ReplaceFor(report, ColunasCondensado, Colunas, '¢', '*');

    //report.SaveToFile('C:\Projeto_Fiscal40\bpl\recibo.txt');

    AgenteId                      := Trim(Conf.ReadString('AgenteNaoFiscal_Operador_' + PadL(vDadosIni.vCodUsuario, 3), 'AgenteId'));
    ArquivoIniPosPrinterNaoFiscal := Trim(Conf.ReadString('AgenteNaoFiscal_Operador_' + PadL(vDadosIni.vCodUsuario, 3), 'ArquivoIniPosPrinterNaoFiscal'));
    try
      if Conf.KesyChanges then
        Conf.SaveConfDB(buscas).Transaction.Commit;
    except
    end;

    if MatchText(AgenteId, ['Local']) and (ArquivoIniPosPrinterNaoFiscal <> '') then
    begin
      Resposta := HwPosPrintFromText(WideString(report.Text), WideString(ArquivoIniPosPrinterNaoFiscal), 1);
      if Resposta = 0 then
        ShowErro('Não foi possivel concluir a impressão' + sLineBreak + string(HwPosUltimoErro))
      else
        Result := True;
    end
    else
    if (AgenteId <> '') and (AgenteId <> 'Padrao') and (ArquivoIniPosPrinterNaoFiscal <> '') then
    begin
      if not cloud_agente_print_text(WideString(report.Text), WideString(Format('confName=%s;agentId=%s;copies=1;cnpj=%s', [ArquivoIniPosPrinterNaoFiscal, AgenteId, vDadosIni.vEmp.vCNPJ]))) then
        ShowAtencao(string(cloud_agente_last_error));
    end
    else
    begin
      Resposta := HwPosPrintFromText(WideString(report.Text), WideString(ConfName), 1);
      if Resposta = 0 then
        ShowErro('Não foi possivel concluir a impressão' + sLineBreak + string(HwPosUltimoErro))
      else
        Result := True;
    end;

  finally
    FreeAndNil(Conf);
    FreeAndNil(report);
    FreeAndNil(reportPrest);
    FreeAndNil(modelPrest);
    
    if Assigned(Client) then FreeAndNil(Client);
  end;       
end;

function TpendPrest.jarecebida: boolean;
begin
  result := false;
  if dataSet.FieldByName('LOTE_CXL').asinteger <> 0 then
  begin
    result := ExecutaComandosSql('SELECT * FROM FORMPAGAMENTO WHERE NREQUISICAO = ' + dataSet.FieldByName('LOTE_CXL').asstring +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND TPDOCS = ''PRE'' AND ATIVO = 1');
  end;
end;

{ TGenerico }

procedure TGenerico.enviarPrestacaoParaCupom;
begin
  try
    comucFiscal.receberPrestacaoDoRetaguarda(dataSet.FieldByName('cod_cred').AsInteger);
  finally
//    Refresh;
  end;
end;

procedure TGenerico.showFiscal;
begin
  vDadosIni.vFiscalAtivo := '';
  if vDadosIni.vTerminalFiscal <> 'S' then
    vDadosIni.vFiscalAtivo := 'N';
  if vDadosIni.vFiscalAtivo = 'N' then
    exit;
  if comucFiscal = nil then
    comucFiscal := TComunic.Create;
  comucFiscal.showFiscal;
end;

procedure TGenerico.verificaFiscalAtivo;
begin
  if vDadosIni.vTerminalFiscal <> 'S' then
    vDadosIni.vFiscalAtivo := 'N';
  if vDadosIni.vFiscalAtivo = 'N' then
    exit;
  if vDadosIni.vFiscalAtivo = 'S' then
    exit;
  vDadosIni.vFiscalAtivo := 'N';
  if comucFiscal = nil then
    comucFiscal := TComunic.Create;
  comucFiscal.iniciaFiscalSegundoPlano;
end;

end.

