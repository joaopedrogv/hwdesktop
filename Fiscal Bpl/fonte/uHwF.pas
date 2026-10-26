unit uHwF;

interface

uses
  uDataSet_OOP, IBDatabase, uCadastrosF;

type
  TEmpresaF = class;
  TEstado = class;
  TTipo_Cliente = class;
  TClienteF = class;
  TProdutoF = class;
  TCod_BarraF = class;
  TColaboradorF = class;
  TSenhaF = class;
  TServicoF = class;
  TFuncao = class;
  TControleF = class;

  TEmpresaF = class(TDataSet_OOP)
  private
  public
    constructor create;
    function post: boolean; override;
    function selecionaEmpresa(codigo: string): boolean;
  end;

  TClienteF = class(TDataSet_OOP)
  public
    constructor create;
    function getTodos: boolean;
    function getCodigoCliente: string;
    function selecionaCliente(nome: string): boolean; overload;
    function selecionaCliente(codigo: integer): boolean; overload;
    function faturamentoBarrado: boolean;

    function getValorDebitoCredito: Currency;
    function getValorDebitoCheque: Currency;
    function limiteDeCreditoEstouradoFechamento(Valor: currency): boolean;
  end;

  TProdutoF = class(TDataSet_OOP)
    // Ver os campos TOT_ALIQ no fiscal antigo. Corresponde a reducao na aliquota para produtos com reducao de base
  private
    nQuant, {descontoV, descontoP,} valorVendaItem, valorPromocional {, valorDesconto}: Currency;
    nBarra, vSitTributaria, vDescAliq, cQuant, DescricaoProduto, nGTIN, nNumFab, nGrupoCod : string;
    reabrirPesquisaRapida:string;
    vendaDoRet, vImpostoMenorQue1Centavo:boolean;
    fCustoMedio: Extended;
    fSqlCamposProdutos: string;
    ftabelaPrecoCaption: string;
    //    cQuant,cBarra:String;
    function getEstoqueReal: Double;
    function getEstoqueProd: Double;
    function verificaSituacaoTributaria: boolean;
    function getValor(pAvista: Boolean): Currency;
    procedure setValorVenda(valor: Currency);
    function produtoEmPromocao: boolean;
  public
    vCSTPIS: String;
    vAliqPIS, vAliqCOFINS: Extended;
    constructor create;
    destructor destroy; override;
    procedure setVendaDoRet(Sim:boolean);
    function selecionaProduto(grupo: integer; codprod: string): boolean; overload;
    function selecionaProdutoGrupoCodigo(grupo:integer; codprod:string):boolean;
    function selecionaProduto(valor: string; codBarra: boolean): boolean; overload;
    function abreUltimaConsulta:boolean;
    function existeProduto(codbarra:String):boolean; overload;
    function existeProduto(pGrupo: Integer; pCodigo:String):boolean; overload;
    function existeProdutoGrupoCodigo(grupoCodigo:String):boolean;
    function selecionaProdutoParaResumoVenda(grupo: integer; codprod: string): boolean;
    function getTodos: boolean;
    function buscarProduto(codigo: string; pAVista, vConsulta, leitura_Sup, usarBalanca, vendaDav: Boolean):
      Boolean;
    function getDescricao: string;
    function getUnidade: string;
    function getNBarra: string;
    function getValorVendaItem: Currency;
    function getValorPromocional: Currency;
    function getValorCustoProd: Currency;
    function getMargemMinimaProduto: Real;
    function getQuantidade: Currency;
    procedure setQuantidade(AValue: Currency);
    function getCasasDecimaisQtde: string;
    function getCasasDecimaisVlUnit: string;
    function validaQuantidadeEmEstoque(qtdeVenda: Double; estoqueReal: Boolean): boolean;
    {function validaDesconto(maximoPermitido, valor: Currency): boolean;
    procedure setDescontoPercenentual(valor: Currency);
    procedure setDescontoValor(valor: Currency);
    function getDescontoPercenentual: Currency;
    function getDescontoValor: Currency;
    function getValorDesconto:Currency; }
    function getSitTributaria: string;
    function getDescAliq: string;
    procedure setCQuant(valor: string);
    function getCQuant: string;
    function getCodigoConsulta: string;
    function setValorItemAlterado(valor: Currency): boolean;
    function setValorDescricaoAlterado(descricao: string): boolean;
    function alteraValorDescricaoProduto: boolean;
    function alteraDescricaoProduto: boolean;
    function alteraValorProduto: boolean;
    function getAliquotaTributos(pNCM, pCST: string): Extended;
    procedure setSqlProdutos(pTipoPreco: string);

    property emPromocao: boolean read produtoEmPromocao;
    property CustoMedio: Extended read fCustoMedio write fCustoMedio;
    property tabelaPrecoCaption: string read ftabelaPrecoCaption;

  var
    vCodBarra: TCod_BarraF;
    vAliq: TAliquota;
  end;

  TCod_BarraF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaCodBarra(codbarra: string): boolean; overload;
    function selecionaCodBarra(grupo: integer; codprod: string): boolean; overload;
    procedure lerGTIN(var cGTIN: string; grupo: integer; codprod: string);
  end;

  TColaboradorF = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TSenhaF = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TServicoF = class(TDataSet_OOP)
  private
    nQuant, valorVendaItem: Currency;
    nBarra, vSitTributaria, vDescAliq, cQuant, DescricaoServico: string;
    vImpostoMenorQue1Centavo:boolean;
    function verificaSituacaoTributaria: boolean;
  public   
    vCSTPIS: String;
    vAliqPIS, vAliqCOFINS: Extended;
    destructor Destroy; override;
    constructor create;
    function getTodos: boolean;
    function buscarServico(codigo: string): boolean;
    function getDescricao: string;
    //    function getValor: Currency;
    function getCodigo: string;
    function getSitTributaria: string;
    function getCQuant: string;
    procedure setCQuant(valor: string);
    function getCasasDecimaisVlUnit: string;
    function getValorVendaItem: Currency;
    function getQuantidade: Currency;
    function getDescAliq: string;
    function getCasasDecimaisQtde: string;
    function selecionaServico(descricao: string): boolean;overload;
    function selecionaServico(codigo: integer): boolean;overload;
    function setValorItemAlterado(valor: Currency): boolean;
    function setValorDescricaoAlterado(descricao: string): boolean;
    function alteraValorDescricaoServico: boolean;
    function getAliquotaTributos(pCodServico: Integer): Extended;
  var
    vAliq: TAliquota;
  end;

  TFuncao = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TEstado = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TTipo_Cliente = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TControleF = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaControle(codigo: integer): boolean;
    function selecionaControleFinalizador(pCodigoFinalizador: Integer): boolean;
    function selecionaControleS2: boolean;
  end;

implementation

uses uDtmFiscalHwF, DBClient, IBQuery, SysUtils, Dialogs, Forms, uDadosIniFiscal,
  Windows, uPrincipalF, DB, uDadosIni, uDtmConfigF, uImpressoraF, Classes, StrUtils, Math;

{ TCod_Barra }

constructor TCod_BarraF.create;
begin
  DataSet := TClientDataSet(DtmFiscalHwF.cdsCodBarra);
  transacao := TIBTransaction(dtmFiscalHwF.transacaoHwF);
  buscas := TIBQuery(dtmFiscalHwF.qrBuscas);
end;

function TCod_BarraF.selecionaCodBarra(codbarra: string): boolean;
begin
  Result := montaSelect('select * from cod_barra where cod_barra = ' + QuotedStr(codbarra)+
  ' and cod_empresa = '+vDadosIniF.codEmpresa);
end;

procedure TCod_BarraF.lerGTIN(var cGTIN: string; grupo: integer; codprod: string);
begin
  cGTIN := '';
  dataSet.First;
  buscas.Close;
  buscas.SQL.Text := 'select cod_barra from cod_barra where grupo_prod = ' + IntToStr(grupo) +
    ' and cod_prod = ' + QuotedStr(codprod)+ ' and '+
    ' padrao_gtin <> '''' and (not padrao_gtin is null)'+
    ' and cod_empresa = '+vDadosIniF.codEmpresa;
  try
    buscas.Open;
    cGTIN := Trim(buscas.FieldByName('cod_barra').AsString);
  except
  end;
end;

function TCod_BarraF.selecionaCodBarra(grupo: integer; codprod: string): boolean;
begin
  Result := montaSelect('select * from cod_barra where grupo_prod = ' + IntToStr(grupo) +
    ' and cod_prod = ' + QuotedStr(codprod)+
    ' and cod_empresa = '+vDadosIniF.codEmpresa);
end;

{ TColaborador }

constructor TColaboradorF.create;
begin

end;

{ TSenha }

constructor TSenhaF.create;
begin

end;

{ TServico }

function TServicoF.alteraValorDescricaoServico: boolean;
begin
  Result := obServ.dataSet.FieldByName('altcod').AsString = 'S';
end;

function TServicoF.buscarServico(codigo: string): boolean;
var
  j: Integer;
  i: Integer;
begin
  try
    if (dataSet.IsEmpty)and (vDadosIniF.vModoConsulta = 'A')  then
    begin
      try
        vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Itens..');
        getTodos;
      finally
        vDadosIniF.limpaMensagem;
      end;
    if dataSet.IsEmpty then
      raise exception.create('Nenhum serviço no cadastro');
    end;
    if trim(codigo) = '' then
      raise exception.create('Código do serviço vazio');

    nQuant := 0;
    j := 0;
    for i := 1 to length(codigo) do
      if (Copy(codigo, I, 1) = '*') {or (Copy(UpperCase(codigo), I, 1) = 'X')} then
      begin
        inc(j);
        if j >= 2 then
          raise exception.create('Quantidade Invalida. Dois ou mais sinais de multiplicação');
      end;
    for i := 1 to length(codigo) do
      if (Copy(codigo, I, 1) = '*') {or (Copy(UpperCase(codigo), I, 1) = 'X')} then
      begin
        try
          nQuant := strtofloat(copy(codigo, 1, I - 1));
        except
          Application.MessageBox(pchar('Quantidade Invalida'), 'Informação', MB_ICONINFORMATION +
            mb_OK);
          exit;
        end;
        nBarra := COPY(codigo, I + 1, 20);
      end;
    if trim(nBarra) = '0' then
      nBarra := trim(vDadosIniF.vEmp.vCodServPadrao);
    
    if nQuant = 0 then
    begin
      nQuant := 1;
      try
        nBarra := inttostr(StrToInt64(codigo));
      except
        raise exception.create('Código do serviço inválido');
      end;
    end;
    selecionaServico(StrToInt(nBarra));
    if dataSet.IsEmpty then
      raise exception.create('Serviço não encontrado');

//    IndexFieldNames := 'COD_SERVICO';
//    FindNearest([nBarra]);
    if dataSet.FieldByName('cod_servico').AsString <> nBarra then
      raise exception.create('Serviço não encontrado');
    if dataSet.FieldByName('valor_servico').AsFloat <= 0 then
      raise exception.create('Valor do serviço igual a zero');
    valorVendaItem := dataSet.FieldByName('valor_servico').AsCurrency;
    DescricaoServico := '';
    if trim(dataSet.FieldByName('desc_servico').AsString) <> '' then
      DescricaoServico := trim(dataset.fieldbyname('desc_servico').asstring);

    if DescricaoServico = '' then
      raise exception.create('Descrição do serviço inválida');

    if not verificaSituacaoTributaria then
      exit;
    Result := true;
  except on e: exception do
    begin
      Result := false;
      application.messageBox(pchar(e.message), 'Erro', MB_ICONERROR + mb_OK);
    end;
  end;
end;

constructor TServicoF.create;
begin
  dataSet := TClientDataSet(DtmFiscalHwF.cdsServ);
  transacao := TIBTransaction(dtmFiscalHwF.transacaoHwF);
  buscas := TIBQuery(dtmFiscalHwF.qrBuscas);
  vAliq := TAliquota.create;

  vCSTPIS := '';
  vAliqPIS := 0;
  vAliqCOFINS := 0;
end;

destructor TServicoF.Destroy;
begin
  vAliq.Free;
  vAliq := nil;
  inherited;
end;

function TServicoF.getAliquotaTributos(pCodServico: Integer): Extended;
begin

  buscas.close;
  buscas.SQL.Text := 'select se.aliqnac aliqnac_116, n.aliqnac aliqnac_nbs from tipo_servico s' +
                     ' left join tiposerviconfse se on se.cod_tpservico = s.nfs_servico' +
                     ' left join nbs n on n.cod_nbs = se.cod_nbs' +
                     ' where s.cod_servico = '+ IntToStr(pCodServico);
  buscas.Open;

  Result := 0;
  if (buscas.FieldByName('aliqnac_116').AsFloat > 0) then
    Result := buscas.FieldByName('aliqnac_116').AsFloat
  else if (buscas.FieldByName('aliqnac_nbs').AsFloat > 0) then
    Result := buscas.FieldByName('aliqnac_nbs').AsFloat;
  if Result <= 0 then
    Result := vDadosIniF.vEmp.vAliqPadraoDeOlhoImpostoServico;
end;

function TServicoF.getCasasDecimaisQtde: string;
begin
  Result := '3';
end;

function TServicoF.getCasasDecimaisVlUnit: string;
begin
  Result := '2';
end;

function TServicoF.getCodigo: string;
begin
  Result := nBarra;
end;

function TServicoF.getCQuant: string;
begin
  Result := cQuant;
end;

function TServicoF.getDescAliq: string;
begin
  Result := vDescAliq;
end;

function TServicoF.getDescricao: string;
begin
  Result := DescricaoServico;
end;

function TServicoF.getQuantidade: Currency;
begin
  Result := nQuant;
end;

function TServicoF.getSitTributaria: string;
begin
  Result := vSitTributaria;
end;

function TServicoF.getTodos: boolean;
begin
  Result := montaSelect('select * from tipo_servico where COALESCE(COD_EMPRESA, ' + vDadosIniF.codEmpresa + ') = ' + vDadosIniF.codEmpresa);
end;

//function TServicoF.getValor: Currency;
//begin
//  Result := StrToCurr(format('%15.2f', [dataSet.FieldByName('valor_servico').AsCurrency]));
//end;

function TServicoF.getValorVendaItem: Currency;
begin
  Result := valorVendaItem;
    //StrToCurr(format('%15.2f', [dataSet.FieldByName('valor_servico').AsCurrency]));
end;

function TServicoF.selecionaServico(descricao: string): boolean;
begin
  Result := montaSelect('select * from tipo_servico where ' +
    ' desc_servico like ' + QuotedStr(descricao + '%') +
    ' AND COALESCE(COD_EMPRESA, ' + vDadosIniF.codEmpresa + ') = ' + vDadosIniF.codEmpresa);
end;

function TServicoF.selecionaServico(codigo: integer): boolean;
begin
  Result := montaSelect('select * from tipo_servico where ' +
    ' cod_servico  = ' + inttostr(codigo) +
    ' AND COALESCE(COD_EMPRESA, ' + vDadosIniF.codEmpresa + ') = ' + vDadosIniF.codEmpresa);
end;

procedure TServicoF.setCQuant(valor: string);
begin
  cQuant := valor;
end;

function TServicoF.setValorDescricaoAlterado(descricao: string): boolean;
begin
  try
    Result := TRUE;
    if descricao = '' then
      raise exception.create('Descrição inválida');
    DescricaoServico := descricao;
  except on e: exception do
    begin
      Result := false;
      application.messageBox(pchar(e.message), 'Erro', MB_ICONERROR + mb_OK);
    end;
  end;
end;

function TServicoF.setValorItemAlterado(valor: Currency): boolean;
begin
  try
    Result := TRUE;
    if valor = 0 then
      raise exception.create('Valor inválida');
    valorVendaItem := valor;
    verificaSituacaoTributaria;
  except on e: exception do
    begin
      Result := false;
      application.messageBox(pchar(e.message), 'Erro', MB_ICONERROR + mb_OK);
    end;
  end;
end;

function TServicoF.verificaSituacaoTributaria: boolean;
var
  temp: string;
begin
  Result := true;

  //PISCOFINS
  if (Trim(dataSet.FieldByName('cst_pis').AsString) <> '') then
    vCSTPIS := Trim(dataSet.FieldByName('cst_pis').AsString)
  else if vDadosIniF.vEmp.vAliqPIS > 0 then
    vCSTPIS := '01'
  else
    vCSTPIS := '49';

  if (vCSTPIS = '01') then
  begin
    vAliqPIS := vDadosIniF.vEmp.vAliqPIS;
    vAliqCOFINS := vDadosIniF.vEmp.vAliqCOFINS;
  end
  else
  begin
    vAliqPIS := 0;
    vAliqCOFINS := 0;
  end;

  vImpostoMenorQue1Centavo := False;
  if dataSet.FieldByName('aliq_iss').AsFloat > 0 then
  begin
    vAliq.selecionaSequencia(dataSet.FieldByName('aliq_iss').AsFloat);
    if not vAliq.dataSet.IsEmpty then
      vSitTributaria :=
        vDadosIniF.StrZero(trim(vAliq.dataSet.FieldByName('sequencia').AsString), 2)
    else
    begin
      Application.MessageBox('Aliquota Nao programada', 'Informação', MB_ICONEXCLAMATION + mb_OK);
      Result := false;
      exit;
    end;

    if (dataSet.FieldByName('aliq_iss').AsFloat > 0) then
    begin
      if vDadosIniF.StrToFloatFormat((valorVendaItem * nQuant) *
        dataSet.FieldByName('aliq_iss').AsFloat / 100 , 2) = 0 then
        vImpostoMenorQue1Centavo := True;
    end;

  end
  else if dataSet.FieldByName('ISENTO_SERV').AsString = 'S'  then
    vSitTributaria := 'II'
  ELSE if dataSet.FieldByName('N_INCIDENCIA_SERV').AsString = 'S' then
    vSitTributaria := 'NN'
  ELSE if dataSet.FieldByName('aliq_iss').AsFloat = 0 then
    vSitTributaria := 'FF';
  if dataSet.FieldByName('aliq_iss').AsFloat > 0 then
  begin
    vDescAliq := vDadosIniF.StrZero(StrToInt(trim(vAliq.dataSet.FieldByName('indice').AsString)),
      2);
    temp := vDadosIniF.StrZeroDec(valiq.dataSet.FieldByName('aliq').AsFloat, 5, 2);
    System.Delete(temp, 3, 1);
    vDescAliq := vDescAliq + 'S' + temp;
  end
  else if vSitTributaria = 'FF' then //'ISENTO' then
    vDescAliq := 'FS' //+
    //vDadosIniF.StrZero(StrToInt(trim(vAliq.dataSet.FieldByName('sequencia').AsString)), 2)
  else if vSitTributaria = 'II' then
    vDescAliq := 'IS' // +
    //vDadosIniF.StrZero(StrToInt(trim(vAliq.dataSet.FieldByName('sequencia').AsString)), 2)
  else if vSitTributaria = 'NN' then
    vDescAliq := 'NS';

  if vImpostoMenorQue1Centavo then
  begin
    vSitTributaria := 'NN';
    vDescAliq := 'N';
  end;
end;

{ TFuncao }

constructor TFuncao.create;
begin

end;

{ TEstado }

constructor TEstado.create;
begin

end;

{ TTipo_Cliente }

constructor TTipo_Cliente.create;
begin

end;

{ TProduto }

function TProdutoF.abreUltimaConsulta: boolean;
begin
  if reabrirPesquisaRapida <> '' then  
    Result := montaSelect(reabrirPesquisaRapida);
  reabrirPesquisaRapida := '';
end;

function TProdutoF.alteraDescricaoProduto: boolean;
begin
  Result := (dataSet.FieldByName('alt_desc_cupom').AsString = 'S');
end;

function TProdutoF.alteraValorDescricaoProduto: boolean;
begin
  Result := (dataSet.FieldByName('alt_cod_cupom').AsString = 'S') or
    (dataSet.FieldByName('alt_desc_cupom').AsString = 'S');
end;

function TProdutoF.alteraValorProduto: boolean;
begin
  Result := (dataSet.FieldByName('alt_cod_cupom').AsString = 'S');
end;

function TProdutoF.buscarProduto(codigo: string; pAVista, vConsulta,
  Leitura_Sup, usarBalanca, vendaDav: Boolean): Boolean;
var
  vnb: string;
  estoque: Currency;
  j: Integer;
  i: Integer;
  vGr: Integer;
  vCdp: string;
begin
try
  Result := false;
  vImpostoMenorQue1Centavo := False;
  nbarra := codigo;
  try
//    if dataSet.IsEmpty then
//    begin
//      try
//        vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Itens..');
//        getTodos;
//      finally
//        vDadosIniF.limpaMensagem;
//      end;
//    end;
//    if dataSet.IsEmpty then
//      raise exception.create('Nenhum produto no cadastro');
    if trim(codigo) = '' then
      raise exception.create('Código do produto vazio');

    vDadosIniF.vProduto.LeituraPesoBalanca.resetVals;

    //Validando codigo de barras
    nQuant := 0;
    j := 0;
    for i := 1 to length(codigo) do
      if (Copy(codigo, I, 1) = '*') {or (Copy(UpperCase(codigo), I, 1) = 'X')} then
      begin
        inc(j);
        if j >= 2 then
          raise exception.create('Quantidade Invalida. Dois ou mais sinais de multiplicação');
      end;
    for i := 1 to length(codigo) do
      if (Copy(codigo, I, 1) = '*') {or (Copy(UpperCase(codigo), I, 1) = 'X')} then
      begin
        try
          nQuant := strtofloat(copy(codigo, 1, I - 1));
        except
          Application.MessageBox(pchar('Quantidade Invalida'), 'Informação', MB_ICONINFORMATION +
            mb_OK);
          exit;
        end;
        nBarra := COPY(codigo, I + 1, 20);
      end;
    if nQuant = 0 then
    begin
      nQuant := 1;
      nBarra := codigo;
    end;
    if nQuant > 9999 then
      raise exception.create('Quantidade acima do suportado pela Impressora');
    if nQuant <= 0 then
      raise exception.create('Quantidade menor ou igual a zero');

    // Fim validando codigo de barras
//       vdadosInif.decodifica(obConfImp.dataSet.FieldByName('leitura_sup').AsString) = 'S'
    // Verificando leitura de supermercados
    vCodBarra.Close;
    if (leitura_Sup) and (Pos('GRUPO|CODIGO|', codigo) = 0) then
    begin
      if vDadosIniF.vProduto.LeituraPesoBalanca.conf.ativoNoPAF then
      begin
        if (vDadosIniF.apenasNumeros(nbarra) = nbarra) 	and
           (IndexText(vDadosIniF.vProduto.LeituraPesoBalanca.leitura_executar(nbarra).vals.msg, ['VALIDO', 'INVALIDO']) >= 0) then
        begin
          with vDadosIniF.vProduto.LeituraPesoBalanca do
          begin
            if Copy(UpperCase(vals.msg), 1, 4) = 'ERRO' then
              raise exception.create(vals.msg);

            if vals.msg = 'VALIDO' then
              nbarra := vDadosIniF.StrZero(vals.codigo,  IfThen(vDadosIniF.vSupermercado = 'S', 13, 0));
            vCodBarra.selecionaCodBarra(nbarra);
          end;
        end;
      end
      else
      begin
        nbarra := vDadosIniF.StrZero(Trim(nbarra), 13);
        vnb := nbarra;
        if copy(vnb, 1, 1) = '2' then
        begin
          if length(vnb) < 13 then
            nbarra := vDadosIniF.StrZeroDec(strtoint(Trim(nbarra)), 13, 0)
          else
            nbarra := vDadosIniF.StrZeroDec(strtoint(copy(Trim(nbarra), 2, 4)), 13, 0);
          vCodBarra.selecionaCodBarra(nbarra);
          if vCodBarra.dataSet.IsEmpty then
            nbarra := vnb;
        end;
        if length(nbarra) < 13 then
          nbarra := vDadosIniF.StrZero(Trim(nbarra), 13);
      end;
    end;
    //Fim leitura de supermercados

    // Verificando existencia do produto no cadastro e seus dados
    if Pos('GRUPO|CODIGO|', codigo) > 0 then
    begin
      try
        vGr := StrToInt(vDadosIniF.getCampoPipe(codigo, 3));
      except
        vGr := 0;
      end;
      try
        vCdp := vDadosIniF.getCampoPipe(codigo, 4);
      except
        vCdp := '0000';
      end;
      if not existeProduto(vGr, vCdp) then
        raise exception.create('Produto não encontrado');
      nBarra := Trim(dataSet.FieldByName('num_fab_prod').AsString);
    end
    else if vDadosIniF.vUsaCodigoBarras = 'S' then
    begin
      if not existeProduto(nBarra) then
        raise exception.create('Produto não encontrado');
    end
    else
    begin
      if not existeProdutoGrupoCodigo(nBarra) then
        raise exception.create('Produto não encontrado');
    end;
//    if not leitura_Sup then
//      nBarra := dataSet.FieldByName('grupo_prod').AsString +
//        trim(dataSet.FieldByName('cod_prod').AsString);
    DescricaoProduto := '';
    if (dataset.fieldbyname('descr_prod_red').asstring <> '') and (vDadosIniF.vItRed = 'S') then
      DescricaoProduto := trim(dataset.fieldbyname('descr_prod_red').asstring)
    else if dataset.fieldbyname('descr_prod').asstring <> '' then
      DescricaoProduto := trim(dataset.fieldbyname('descr_prod').asstring);

    if DescricaoProduto = '' then
      raise exception.create('Descrição do produto inválida');
    if (pAVista) and (dataSet.FieldByName('prec_tab_prod').AsFloat <= 0) and (not vendaDav) then
      raise exception.create('Preço de venda não pode ser menor ou igual a zero');
    if (not pAVista) and (dataSet.FieldByName('prec_30_prod').AsFloat <= 0) and (not vendaDav) then
      raise exception.create('Preço a prazo não pode ser zero');
    if trim(dataSet.FieldByName('unidade').AsString) = '' then
      raise exception.create('Unidade do produto não informada');
    if copy(trim(dataSet.FieldByName('codigo_nop').AsString),1,1) <> '5' then
      raise exception.create('Produto cadastrado com CFOP inválido. Deve iniciar em 5');

    valorPromocional := 0;
    if trim(dataSet.FieldByName('em_promocao').AsString) = 'S' then
      valorPromocional := vDadosIniF.StrToFloatFormat(
        dataSet.FieldByName('preco_promocao').AsFloat, 2);
    if valorPromocional < 0 then
      valorPromocional := 0;

    if not vendaDoRet then
      setValorVenda(getValor(pAVista));

    if (dataSet.FieldByName('icm_prod').AsFloat > 0) then
    begin
      if vDadosIniF.StrToFloatFormat((valorVendaItem * nQuant) *
        dataSet.FieldByName('icm_prod').AsFloat / 100 , 2) = 0 then
        vImpostoMenorQue1Centavo := True;
    end;
    if vDadosIniF.vUsaCodigoBarras = 'S' then
      nBarra := vDadosIniF.StrZero(nBarra,13)
    else
      nBarra := vDadosIniF.StrZero(dataSet.FieldByName('grupo_prod').AsString+trim(dataSet.FieldByName('cod_prod').AsString),13);

    if vDadosIniF.vImpressaoCodigoCupom = 'GTIN' then
      vCodBarra.lerGTIN(nGTIN, dataSet.FieldByName('grupo_prod').AsInteger,
        dataSet.FieldByName('cod_prod').AsString);
    nNumFab := Trim(dataSet.FieldByName('num_fab_prod').AsString);
    nGrupoCod := dataSet.FieldByName('grupo_prod').AsString +
        Trim(dataSet.FieldByName('cod_prod').AsString);

    //Fim verificação do produto

    if (vDadosIniF.vProduto.LeituraPesoBalanca.conf.ativoNoPAF) and
       (vDadosIniF.vProduto.LeituraPesoBalanca.vals.msg = 'VALIDO') then 
    begin
      if (vDadosIniF.apenasNumeros(nbarra) = nbarra) 	and
           (IndexText(vDadosIniF.vProduto.LeituraPesoBalanca.leitura_executar(nbarra).vals.msg, ['VALIDO', 'INVALIDO']) >= 0) then
    end
    else
    if (copy(vnb, 1, 1) = '2') and (leitura_Sup) then
    begin
      if (length(vnb) >= 13) and (UpperCase(trim(dataSet.FieldByName('unidade').AsString)) = 'KG') then
      begin
        if pAVista then
          nQuant := (strtofloat(copy(Trim(vnb), 8, 3) + ',' + copy(Trim(vnb), 11, 2)) /
            getValorVendaItem)
        else
          nQuant := (strtofloat(copy(Trim(vnb), 8, 3) + ',' + copy(Trim(vnb), 11, 2)) /
            getValorVendaItem);
        try
          nquant := strtofloat(FloatToStrF(nquant, ffnumber, 12, 3));
        except
          Result := false;
          Application.MessageBox(pchar('Quantidade inválida'), 'Erro', MB_ICONERROR + mb_OK);
          exit;
        end;
      end;
    end;

    if nQuant > 9999 then
      raise exception.create('Quantidade acima do suportado pela Impressora');
    if nQuant <= 0 then
      raise exception.create('Quantidade menor ou igual a zero');

    if (emPromocao) and (obCupom.vNumDAV = 0) and (obCupom.vNumPVenda = 0) then
    begin
      if (valorPromocional >= getValorVendaItem) then
        valorPromocional := 0
      else if (valorPromocional < getValorVendaItem) then
        obCupom.setDescontoValor((getValorVendaItem - valorPromocional) * nQuant);
    end
    else
      valorPromocional := 0;
    if (dataSet.FieldByName('icm_prod').AsFloat > 0 ) and (valorPromocional > 0) then
    begin
      if vDadosIniF.StrToFloatFormat((valorPromocional * nQuant) *
        dataSet.FieldByName('icm_prod').AsFloat / 100 , 2) = 0 then
        vImpostoMenorQue1Centavo := True;
    end;

    if not verificaSituacaoTributaria then
      exit;

    Result := true;
  except on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + mb_OK);
    end;
  end;
finally
  vendaDoRet := false;
end;
end;

constructor TProdutoF.create;
var
  vListaTabPreco: TStringList;
begin
  DataSet := TClientDataSet(DtmFiscalHwF.cdsProd);
  transacao := TIBTransaction(dtmFiscalHwF.transacaoHwF);
  buscas := TIBQuery(dtmFiscalHwF.qrBuscas);
  vCodBarra := TCod_BarraF.create;
  vAliq := TAliquota.create;
  reabrirPesquisaRapida:='';
  vendaDoRet :=false;
  vCSTPIS := '';
  vAliqPIS := 0;
  vAliqCOFINS := 0;
  fCustoMedio := 0;
  TFloatField(dataSet.FieldByName('EST_F')).DisplayFormat := '#0.000';
  setSqlProdutos('');
end;

destructor TProdutoF.destroy;
begin
  vCodBarra.Free;
  vCodBarra := nil;
  vAliq.Free;
  vAliq := nil;
  inherited;
end;

function TProdutoF.getAliquotaTributos(pNCM, pCST: string): Extended;
begin
  buscas.Close;
  buscas.SQL.Text := 'select ALIQNAC, ALIQIMP from nbm' +
    ' where cod_ncm = ' + QuotedStr(Trim(pNCM));
  buscas.Open;

  if Pos(Copy(Trim(pCST), 1, 1), '03450') > 0 then
    Result := buscas.FieldByName('ALIQNAC').AsFloat
  else
    Result := buscas.FieldByName('ALIQIMP').AsFloat;
  if Result <= 0 then
    Result := vDadosIniF.vEmp.vAliqPadraoDeOlhoImpostoProduto;
end;

function TProdutoF.getCasasDecimaisQtde: string;
begin
  Result := IntToStr(CImpressoraF.vFqtdDigQtde);
  //Result := '3';
end;

function TProdutoF.getCasasDecimaisVlUnit: string;
begin
  Result := IntToStr(CImpressoraF.vFqtdDig);
//  if dataSet.FieldByName('CSDECVLUNT').AsString = '3' then
//    Result := '3'
//  else
//    Result := '2';
end;

function TProdutoF.getCodigoConsulta: string;
begin
  if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('usar_codbarra').AsString) = 'S' then
  begin
    vCodBarra.selecionaCodBarra(dataSet.FieldByName('grupo_prod').AsInteger,
      dataSet.FieldByName('cod_prod').AsString);
  end
  else
  begin

  end;
end;

function TProdutoF.getCQuant: string;
begin
  Result := cQuant;
end;

function TProdutoF.getDescAliq: string;
begin
  Result := vDescAliq;
end;

function TProdutoF.getDescricao: string;
begin
  result := DescricaoProduto ;
  if Trim(DescricaoProduto) = '' then
  begin
    if Trim(dataSet.FieldByName('descr_prod_red').AsString) <> '' then
      Result := Trim(dataSet.FieldByName('descr_prod_red').AsString)
    else
      Result := Trim(dataSet.FieldByName('descr_prod').AsString);
  end;
end;

function TProdutoF.getEstoqueProd: Double;
begin
  Result := dataSet.FieldByName('est_f').AsFloat;
end;

function TProdutoF.getEstoqueReal: Double;
begin
  try
    DtmFiscalHwF.spEstoqueReal.Close;
    DtmFiscalHwF.spEstoqueReal.ParamByName('vempresa').Text := vDadosIniF.codEmpresa;
    DtmFiscalHwF.spEstoqueReal.ParamByName('vcodigo').AsString :=
      dataSet.FieldByName('COD_PROD').AsString;
    DtmFiscalHwF.spEstoqueReal.ParamByName('vgrupo').AsInteger :=
      dataSet.FieldByName('grupo_prod').AsInteger;
    DtmFiscalHwF.spEstoqueReal.ExecProc;
    Result := DtmFiscalHwF.spEstoqueReal.ParamByName('estoque').Value;
    DtmFiscalHwF.spEstoqueReal.Close;
  except
    on E: Exception do
    begin
      Result := 0;
      Application.MessageBox(pchar('Erro ao consultar estoque do produto'), 'Informação',
        MB_ICONINFORMATION + mb_OK);
    end;
  end;
end;

function TProdutoF.getMargemMinimaProduto: Real;
begin
Result := dataSet.FieldByName('PERC_TB_VARE').AsFloat;
end;

function TProdutoF.getNBarra: string;
var
  i:integer;
  tempCaracter:boolean;
begin
  tempCaracter := False;
  for i := 1 to length(nBarra) do
  begin
    Case nBarra[i] of
      'A'..'Z', 'a'..'z', '0'..'9' : begin    end
      else
      begin
        tempCaracter := True;
        Break
      end;
    end;
  end;
  if tempCaracter and (UpperCase(Trim(CImpressoraF.vTipoImpressora)) = 'EPSON') then
    Result := vDadosIniF.StrZero(
    Trim(dataSet.FieldByName('grupo_prod').AsString)+
    Trim(dataSet.FieldByName('cod_prod').AsString),14)
  else if (vDadosIniF.vImpressaoCodigoCupom = 'GTIN') and (Trim(nGTIN) <> '') then
    Result := vDadosIniF.StrZero(nGTIN,14)
  else if (vDadosIniF.vImpressaoCodigoCupom = 'N') and (Trim(nNumFab) <> '') then
    Result := vDadosIniF.StrZero(nNumFab,14)
  else if (vDadosIniF.vImpressaoCodigoCupom = 'GC') and (Trim(nGrupoCod) <> '') then
    Result := vDadosIniF.StrZero(nGrupoCod,14)
  else
    Result := vDadosIniF.StrZero(nBarra,14);
end;

function TProdutoF.getQuantidade: Currency;
var
  vTemp:string;
begin
  //Result := nQuant;
  Result := CImpressoraF.getQuantidadeComCasasDecimais(nQuant);
//  vTemp := Format('%15.4f',[nQuant]);
//  if CImpressoraF.vFqtdDigQtde = 2 then
//    vTemp := copy(vTemp,1,13)
//  else
//    vTemp := copy(vTemp,1,14);
//  Result := StrToFloat(Trim(vTemp));
end;

function TProdutoF.getSitTributaria: string;
begin
  Result := vSitTributaria;
end;

function TProdutoF.getTodos: boolean;
begin
  setSqlProdutos(ftabelaPrecoCaption);
  Result :=
    montaSelect('select' +
      fSqlCamposProdutos +
      ' from produtos p where p.cod_empresa = ' + vDadosIniF.codEmpresa);
end;

function TProdutoF.getUnidade: string;
begin
  result := dataset.fieldbyname('unidade').asstring;
end;

function TProdutoF.getValor(pAvista: Boolean): Currency;
begin
  if pAvista then
    result := StrToCurr(format('%15.' + getCasasDecimaisVlUnit + 'f',
      [dataset.fieldbyname('prec_tab_prod').AsCurrency]))
  else
    result := StrToCurr(format('%15.' + getCasasDecimaisVlUnit + 'f',
      [dataset.fieldbyname('prec_30_prod').AsCurrency]));
end;

function TProdutoF.getValorCustoProd: Currency;
begin
  Result := dataSet.FieldByName('PREC_CUS_PROD').AsCurrency;
end;

function TProdutoF.getValorPromocional: Currency;
begin
  Result := valorPromocional;
end;

function TProdutoF.getValorVendaItem: Currency;
var
  vTemp:String;
begin
  Result := CImpressoraF.getValorUnitarioComCasasDecimais(valorVendaItem);
//  if CImpressoraF.vtipoArredond = 'T' then
//  begin
//    vTemp := Format('%15.4f',[valorVendaItem]);
//    if CImpressoraF.vFqtdDig = 2 then
//      vTemp := copy(vTemp,1,13)
//    else
//      vTemp := copy(vTemp,1,14);
//    Result := StrToFloat(Trim(vTemp));
//    //Result:= StrToFloat(trim(Format('%0.'+IntToStr(CImpressoraF.vFqtdDig)+'f',[valorVendaItem])))
//  end
//  else
//  begin
//    Result := vDadosIniF.StrToFloatFormat(valorVendaItem,CImpressoraF.vFqtdDig);
//  end;
end;

function TProdutoF.produtoEmPromocao: boolean;
begin
  Result := (dataSet.FieldByName('em_promocao').AsString = 'S') and
    (valorPromocional > 0);
end;

function TProdutoF.selecionaProduto(grupo: integer; codprod: string): boolean;
begin
  IndexFieldNames := 'CODIGO';
  FindNearest([IntToStr(grupo) + codprod]);
end;

function TProdutoF.selecionaProduto(valor: string; codBarra: boolean): boolean;
var
  vSqlTemp, vcbarra, vnb: string;
begin
  if trim(valor) = '' then
  begin
    Application.MessageBox(pchar('Digite dados para consultar'), 'Atenção', MB_ICONEXCLAMATION +
        MB_OK);
    reabrirPesquisaRapida:=dataSet.CommandText;
  end
  else if not codBarra then
  begin
    setSqlProdutos(ftabelaPrecoCaption);
    Result :=
      montaSelect('select ' +
      fSqlCamposProdutos +
      ' from produtos p where p.cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and ((p.descr_prod like ' + QuotedStr(valor + '%') + ') or (p.descr_prod_red like ' +
      QuotedStr(valor + '%') + ')) and p.ativo = 1');
    Result := not dataset.IsEmpty ;
    if dataset.IsEmpty then
      Application.MessageBox(pchar('Produto não encontrado'), 'Atenção', MB_ICONEXCLAMATION +
        MB_OK);
    reabrirPesquisaRapida:=dataSet.CommandText;
  end
  else
  begin
    if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('leitura_sup').AsString) = 'S') and
      (Pos('GRUPO|CODIGO|', valor) = 0) then
    begin
      valor := vDadosIniF.StrZero(Trim(valor), 13);
      vnb := valor;
      if copy(vnb, 1, 1) = '2' then
      begin
        if length(vnb) < 13 then
          valor := vDadosIniF.StrZero(Trim(valor), 13)
        else
          valor := vDadosIniF.StrZero(copy(Trim(valor), 2, 4), 13);
        vCodBarra.selecionaCodBarra(valor);
        if vCodBarra.dataSet.IsEmpty then
          valor := vnb;
      end;
      if length(valor) < 13 then
        valor := vDadosIniF.StrZeroDec(strtoint64(valor), 13, 0);
    end;
    vCodBarra.selecionaCodBarra(valor);
    if vCodBarra.dataSet.IsEmpty then
    begin
      Result := false;
      Application.MessageBox(pchar('Produto não encontrado'), 'Atenção', MB_ICONEXCLAMATION +
        MB_OK);
      exit;
    end;
    setSqlProdutos(ftabelaPrecoCaption);
    Result :=
      montaSelect('select ' +
      fSqlCamposProdutos +
      ' from produtos p where p.cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and p.cod_prod = ' + QuotedStr(vCodBarra.dataSet.FieldByName('cod_prod').AsString) +
      ' and grupo_prod = ' + vCodBarra.dataSet.FieldByName('grupo_prod').AsString + ' and ativo = 1');
    Result := not dataset.IsEmpty ;
    if dataSet.IsEmpty then
      Application.MessageBox(pchar('Produto não encontrado'), 'Atenção', MB_ICONEXCLAMATION +
        MB_OK);
      reabrirPesquisaRapida:=dataSet.CommandText;
  end;
end;

function TProdutoF.selecionaProdutoGrupoCodigo(grupo: integer;
  codprod: string): boolean;
begin
  setSqlProdutos(ftabelaPrecoCaption);
  Result :=
      montaSelect('select ' +
        fSqlCamposProdutos +
      ' from produtos p where p.cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and p.cod_prod = ' + QuotedStr(codprod) +
      ' and grupo_prod = ' + IntToStr(grupo));
end;

function TProdutoF.selecionaProdutoParaResumoVenda(grupo: integer;
  codprod: string): boolean;
begin
  IndexFieldNames := 'CODIGO';
  FindNearest([IntToStr(grupo) + codprod]);
  if (grupo = dataSet.FieldByName('grupo_prod').AsInteger) and
    (codprod = dataSet.FieldByName('cod_prod').AsString) then
    result := true
  else
    result := true;
end;

procedure TProdutoF.setCQuant(valor: string);
begin
  cQuant := valor;
end;

procedure TProdutoF.setQuantidade(AValue: Currency);
begin
  nQuant := AValue;
end;

procedure TProdutoF.setSqlProdutos(pTipoPreco: string);
var
  vTmpCampo: string;
begin
  if Pos('30', pTipoPreco) > 0 then
  begin
    vTmpCampo := 'PREC_30_PROD';
    ftabelaPrecoCaption := 'Prazo 30';
  end
  else if Pos('60', pTipoPreco) > 0 then
  begin
    vTmpCampo := 'PREC_60_PROD';
    ftabelaPrecoCaption := 'Prazo 60';
  end
  else if Pos('90', pTipoPreco) > 0 then
  begin
    vTmpCampo := 'PREC_90_PROD';
    ftabelaPrecoCaption := 'Prazo 90';
  end
  else
  begin
    vTmpCampo := 'prec_tab_prod';
    ftabelaPrecoCaption := '';
  end;
  fSqlCamposProdutos := 'grupo_prod||cod_prod codigo, p.cod_prod,p.grupo_prod,p.icm_prod,' +
    ' (p.est_f + p.est_r) est_f,p.isento_prod,p.n_incidencia_prod , p.' +vTmpCampo + ' as prec_tab_prod,' +
    ' p.prec_30_prod,p.num_fab_prod,p.descr_prod,p.descr_prod_red,p.unidade,' +
    ' p.alt_cod_cupom,p.alt_desc_cupom,p.em_promocao, p.preco_promocao, p.codigo_nop, p.cst_prod, p.MAX_DESC_ITEM, ' +
    QuotedStr(vDadosIniF.vIndicadorArredondamentoOuTruncamento) +
    ' ARREDONDAR_TRUNCAR, p.TIPO_FAB,p.PREC_CUSM_PROD PREC_CUS_PROD,p.PERC_TB_VARE, '+
    ' p.csdecvlunt,p.tot_aliq, p.tipo_item, p.nbm, p.cst_pis, p.aliq_pis_diferenciada, p.aliq_cofins_diferenciada, p.lista_imagens';
  dataSet.Close;
end;

function TProdutoF.setValorDescricaoAlterado(descricao: string): boolean;
begin
  try
    Result := TRUE;
    if descricao = '' then
      raise exception.create('Descrição inválida');
    DescricaoProduto := descricao;
  except on e: exception do
    begin
      Result := false;
      application.messageBox(pchar(e.message), 'Erro', MB_ICONERROR + mb_OK);
    end;
  end;
end;

function TProdutoF.setValorItemAlterado(valor: Currency): boolean;
begin
  try
    Result := TRUE;
    if valor <= 0 then
      raise exception.create('Valor de venda menor ou igual a zero');
    valorVendaItem := valor;
    verificaSituacaoTributaria;
  except on e: exception do
    begin
      Result := false;
      application.messageBox(pchar(e.message), 'Erro', MB_ICONERROR + mb_OK);
    end;
  end;
end;

procedure TProdutoF.setValorVenda(valor: Currency);
begin
  valorVendaItem := valor;
end;

procedure TProdutoF.setVendaDoRet(Sim:boolean);
begin
  vendaDoRet := Sim;
end;

function TProdutoF.validaQuantidadeEmEstoque(qtdeVenda: Double;
  estoqueReal: Boolean): boolean;
begin
  Result := true;
  if (vDadosIniF.bancoConectado = 'senvidor') and (estoqueReal) then
  begin
    if qtdeVenda > getEstoqueReal then
    begin
      Result := false;
      Application.MessageBox(pchar('Estoque insuficiente'), 'Informação', MB_ICONINFORMATION +
        mb_OK);
    end;
  end
  else if (qtdeVenda > getEstoqueProd) then
  begin
    Result := false;
    Application.MessageBox(pchar('Estoque insuficiente'), 'Informação', MB_ICONINFORMATION +
      mb_OK);
  end;
end;

function TProdutoF.verificaSituacaoTributaria: boolean;
var
  temp: string;
begin
  Result := true;

  //PISCOFINS
  if (Trim(dataSet.FieldByName('cst_pis').AsString) = '01') or
    (Trim(dataSet.FieldByName('cst_pis').AsString) = '') then
  begin
    vCSTPIS := '01';
    vAliqPIS := vDadosIniF.vEmp.vAliqPIS;
    vAliqCOFINS := vDadosIniF.vEmp.vAliqCOFINS;
  end
  else
  begin
    vCSTPIS := Trim(dataSet.FieldByName('cst_pis').AsString);
    vAliqPIS := dataSet.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat;
    vAliqCOFINS := dataSet.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat;
  end;

  vImpostoMenorQue1Centavo := False;
  if (Trim(dataSet.FieldByName('TOT_ALIQ').AsString) <> '') and (dataSet.FieldByName('icm_prod').AsFloat > 0) then
  begin
    vAliq.selecionaSequencia(dataSet.FieldByName('TOT_ALIQ').asstring);
    if not vAliq.dataSet.IsEmpty then
      vSitTributaria :=
//        vDadosIniF.StrZero(vAliq.dataSet.FieldByName('indice').asinteger, 2)
        vDadosIniF.StrZero(Trim(vAliq.dataSet.FieldByName('sequencia').AsString), 2)
    else
    begin
      Application.MessageBox('Aliquota Nao programada', 'Informação', MB_ICONINFORMATION + mb_OK);
      Result := false;
      exit;
    end;
  end
  else if dataSet.FieldByName('icm_prod').AsFloat > 0 then
  begin
    vAliq.selecionaSequencia(dataSet.FieldByName('icm_prod').AsFloat);
    if not vAliq.dataSet.IsEmpty then
      vSitTributaria :=
//        vDadosIniF.StrZero(vAliq.dataSet.FieldByName('indice').asinteger, 2)
        vDadosIniF.StrZero(Trim(vAliq.dataSet.FieldByName('sequencia').AsString), 2)
    else
    begin
      Application.MessageBox('Aliquota Nao programada', 'Informação', MB_ICONINFORMATION + mb_OK);
      Result := false;
      exit;
    end;
    if (dataSet.FieldByName('icm_prod').AsFloat > 0) then
    begin
      if vDadosIniF.StrToFloatFormat((valorVendaItem * nQuant) *
        dataSet.FieldByName('icm_prod').AsFloat / 100 , 2) = 0 then
        vImpostoMenorQue1Centavo := True;
    end;
  end
  else if dataSet.FieldByName('ISENTO_PROD').AsString = 'S' then //'ISENTO' then
    vSitTributaria := 'II'
  else if (dataSet.FieldByName('N_INCIDENCIA_PROD').AsString = 'S') then //'NAOINCIDENCIA' then
    vSitTributaria := 'NN'
  else if (dataSet.FieldByName('icm_prod').AsFloat = 0) then //'SUBTRIBUTARIA' then
    vSitTributaria := 'FF';

  if dataSet.FieldByName('icm_prod').AsFloat > 0 then
  begin
    vDescAliq := vDadosIniF.StrZero(vAliq.dataSet.FieldByName('indice').AsInteger, 2);
    temp := vDadosIniF.StrZeroDec(valiq.dataSet.FieldByName('aliq').AsFloat, 5, 2);
    System.Delete(temp, 3, 1);
    vDescAliq := vDescAliq + 'T' + temp;
  end
  else if vSitTributaria = 'FF' then //'ISENTO' then
    vDescAliq := 'F' //+
    //vDadosIniF.StrZero(StrToInt(trim(vAliq.dataSet.FieldByName('sequencia').AsString)), 2)
  else if vSitTributaria = 'II' then
    vDescAliq := 'I' // +
    //vDadosIniF.StrZero(StrToInt(trim(vAliq.dataSet.FieldByName('sequencia').AsString)), 2)
  else if vSitTributaria = 'NN' then
    vDescAliq := 'N'; //+
  //vDadosIniF.StrZero(StrToInt(trim(vAliq.dataSet.FieldByName('sequencia').AsString)), 2);

  if vImpostoMenorQue1Centavo then
  begin
    vSitTributaria := 'NN';
    vDescAliq := 'N';
  end;
end;

{ TEmpresa }

constructor TEmpresaF.create;
begin
  DataSet := TClientDataSet(DtmFiscalHwF.cdsEmp);
  transacao := TIBTransaction(DtmFiscalHwF.transacaoHwF);
  buscas := TIBQuery(DtmFiscalHwF.qrBuscas);
end;

function TEmpresaF.post: boolean;
begin
  try
    if trim(DataSet.FieldByName('cnpj_emp').AsString) = '' then
      raise exception.create('O CNPJ não pode ficar vazio');

    if inherited post then
      result := true
    else
      result := false;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('EF0017 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0017 ' + e.Message);
    end;
  end;
end;

function TEmpresaF.selecionaEmpresa(codigo: string): boolean;
begin
  result :=
    montaSelect('select e.COD_EMPRESA,e.NOME_EMP,e.ENDERECO_EMP,e.BAIRRO_EMP,'+
    ' e.CIDADE_EMP,e.CEP_EMP,e.CNPJ_EMP,e.IE_EMP,e.IM_EMP,e.TELEFONE_EMP,e.NUMERO_END,'+
    ' e.PROP_EMP ,es.sigla_uf,E.AUT_SERV_CUPOM, e.endreco_emp,e.COPIAR_HWF_TERM_RET, e.VERSAO' +
    ' from empresa e inner join estados es on e.uf_emp = es.codigo_uf where e.cod_empresa = ' +
    codigo);
end;

{ TCliente }

constructor TClienteF.create;
begin
  dataSet := TClientDataSet(DtmFiscalHwF.cdsCliente);
  transacao := TIBTransaction(dtmFiscalHwF.transacaoHwF);
  buscas := TIBQuery(dtmFiscalHwF.qrBuscas);
end;

function TClienteF.faturamentoBarrado: boolean;
begin
  Result := False;

  try
    if vDadosIniF.bancoConectado = 'servidor' then
    begin

      try
        buscas := TIBQuery(dtmFiscalHwF.qrBuscasHw);

        buscas.Close;
        buscas.SQL.Text := 'SELECT * FROM Tipo_Faturamento ' +
          'where CODIGO_FATURAMENTO = ' + inttostr(dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger) + ' and ativo=1';
        buscas.Open;
        if not buscas.IsEmpty then
        begin
          if Trim(buscas.FieldByName('STATUS_F').AsString) = 'BARRADO' then
          begin
            Application.MessageBox('Cliente - CB', 'Informação', MB_OK +
              MB_ICONINFORMATION + MB_DEFBUTTON1);
            Result := true;

            if vDadosIniF.PesqPros('FIS046', 'ABRIR','','','', buscas, True) then
            begin
              Result := Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION +
                MB_YESNO) = IDNO;
            end;
          end;
        end;
      finally
        buscas := TIBQuery(dtmFiscalHwF.qrBuscas);
      end;
    end;

  except
    Result := False;
  end;
end;

function TClienteF.getCodigoCliente: string;
begin
  Result := dataSet.FieldByName('cod_cliente').AsString;
end;

function TClienteF.getTodos: boolean;
begin
  Result := montaSelect('select c.*,e.sigla_uf from clientes c' +
    ' inner join estados e on e.codigo_uf = c.codigo_uf' +
    ' where c.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and c.ativo = 1');
end;

function TClienteF.getValorDebitoCheque: Currency;
begin
  try
    buscas := TIBQuery(dtmFiscalHwF.qrBuscasHw);
    buscas.Close;
    buscas.SQL.Text := 'Select sum(VALOR_CH) soma from' +
      ' controle_cheque where cod_cliente = :vcod' +
      ' and (status_ch is null or status_ch = '''')' +
      ' and codigo_emp = :cod_empresa';
    buscas.Params[0].AsInteger := dataSet.FieldByName('cod_cliente').AsInteger;
    buscas.Params[1].AsString := vDadosIniF.codEmpresa;
    buscas.Open;
    Result := buscas.FieldByName('soma').AsCurrency;
    buscas.Close;
  finally
    buscas := TIBQuery(dtmFiscalHwF.qrBuscas);
  end;
end;

function TClienteF.getValorDebitoCredito: Currency;
begin
  try
    buscas := TIBQuery(dtmFiscalHwF.qrBuscasHw);

    buscas.Close;
    buscas.SQL.Text := 'select sum(VALOR_C) soma from controle_creditos' +
      ' where cod_cliente = :vcod' +
      ' and (status_c is null or status_c = '''')' +
      ' and codigo_emp = :cod_empresa';
    buscas.Params[0].AsInteger := dataSet.FieldByName('cod_cliente').AsInteger;
    buscas.Params[1].AsString := vDadosIniF.codEmpresa;
    buscas.Open;
    Result := buscas.FieldByName('soma').AsCurrency;
    buscas.Close;
  finally
    buscas := TIBQuery(dtmFiscalHwF.qrBuscas);
  end;
end;

function TClienteF.limiteDeCreditoEstouradoFechamento(Valor: currency): boolean;
var
  valorCredito: Currency;
  valorCheque: Currency;
begin
  try
    if vDadosIniF.bancoConectado = 'servidor' then
    begin
      result := false;
      if (dataset.FieldByName('LIMITE_CREDITO').AsFloat > 0) then
      begin
        if dataset.FieldByName('LIMITE_CREDITO').AsFloat < Valor then
        begin
          Application.MessageBox(PChar('Cliente - CE. Valor: ' + format('%m',
            [dataset.FieldByName('LIMITE_CREDITO').AsFloat]))
            , 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          result := true;
          exit;
        end;
        try
          vDadosIniF.abreStatusProcessamento('', 'Verificando limite de Credito');
          valorCredito := getValorDebitoCredito;
          valorCheque := getValorDebitoCheque;
        finally
          vDadosIniF.fechaStatusProcessamento;
        end;
        if ((Valor + valorCredito + valorCheque) > dataset.FieldByName('LIMITE_CREDITO').AsFloat) then
        begin
          Application.MessageBox(pchar('Cliente - CE' + chr(13) +
            'Valor do Limite: ' + format('%n', [dataset.FieldByName('LIMITE_CREDITO').AsCurrency]) +
            chr(13) +
            'Valor do debito: ' + format('%n', [valorCredito + valorCheque]) + chr(13)
            +
            'Valor da Compra: ' + format('%n', [Valor])), 'Erro', MB_ICONWARNING + MB_OK);
          Result := true;
          if vDadosIniF.PesqPros('FIS047', 'ABRIR','','','', buscas, True) then
          begin
            Result := Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION +
              MB_YESNO) = IDNO;
          end;
        end;
      end;
    end;
    
  except
    Result := False;
  end;
end;

function TClienteF.selecionaCliente(codigo: integer): boolean;
begin
  Result := montaSelect('select c.*,e.sigla_uf from clientes c' +
    ' inner join estados e on e.codigo_uf = c.codigo_uf' +
    ' where c.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and c.cod_cliente = ' + IntToStr(codigo) +
    ' and c.ativo = 1');
end;

function TClienteF.selecionaCliente(nome: string): boolean;
begin
  Result := montaSelect('select c.*,e.sigla_uf from clientes c' +
    ' inner join estados e on e.codigo_uf = c.codigo_uf' +
    ' where c.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and c.nome_cliente like ' + QuotedStr(nome + '%') +
    ' and c.ativo = 1');
end;

{ TControleF }

constructor TControleF.create;
begin
  if DtmFiscalHwF = nil then
    DtmFiscalHwF := TDtmFiscalHwF.Create(DtmFiscalHwF);
  DataSet := TClientDataSet(DtmFiscalHwF.cdsCtrl);
  transacao := TIBTransaction(dtmFiscalHwF.transacaoHwF);
  buscas := TIBQuery(dtmFiscalHwF.qrBuscas);
end;

function TControleF.selecionaControle(codigo: integer): boolean;
begin
  Result := montaSelect('select * from controles where codigo_ctrl = ' +
    IntToStr(codigo) + ' and codigo_emp = '+vDadosIniF.codEmpresa);
end;

function TControleF.selecionaControleFinalizador(
  pCodigoFinalizador: Integer): boolean;
begin
  Result := montaSelect('select * from controles where cod_finalizador = ' +
    IntToStr(pCodigoFinalizador) + ' and codigo_emp = '+vDadosIniF.codEmpresa);
end;

function TControleF.selecionaControleS2: boolean;
begin
  Result := montaSelect('select * from controles where docs = ''S2''' +
    ' and codigo_emp = '+vDadosIniF.codEmpresa +
    ' and ativo = 1');
end;

function TProdutoF.existeProduto(codbarra: String): boolean;
begin
  Result := false;

  setSqlProdutos(ftabelaPrecoCaption);
  montaSelect('select '+
    fSqlCamposProdutos +
    ' from produtos p where p.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and p.num_fab_prod = ' + QuotedStr(codbarra)+
    ' and (p.consumo <> ''S'' or p.consumo is null ) and p.ativo = 1');
  if not dataSet.IsEmpty then
  begin
    Result := true;
    exit;
  end;
  vCodBarra.selecionaCodBarra(codbarra);
  if not vCodBarra.dataSet.IsEmpty then
  begin
    montaSelect('select ' +
      fSqlCamposProdutos +
      ' from produtos p where p.cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and p.cod_prod = ' + QuotedStr(vCodBarra.dataSet.FieldByName('cod_prod').AsString) +
      ' and p.grupo_prod = ' + vCodBarra.dataSet.FieldByName('grupo_prod').AsString+
      ' and (p.consumo <> ''S'' or p.consumo is null ) and p.ativo = 1');
    if not dataSet.IsEmpty then
      Result := true;
    vCodBarra.Close;
  end;
end;

function TProdutoF.existeProduto(pGrupo: Integer; pCodigo: String): boolean;
begin
  Result := false;
  setSqlProdutos(ftabelaPrecoCaption);
  montaSelect('select ' +
    fSqlCamposProdutos +
    ' from produtos p where p.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and p.cod_prod = ' + QuotedStr(pCodigo) +
    ' and p.grupo_prod = ' + IntToStr(pGrupo) +
    ' and (p.consumo <> ''S'' or p.consumo is null ) and p.ativo = 1');
  if not dataSet.IsEmpty then
    Result := true;
end;

function TProdutoF.existeProdutoGrupoCodigo(grupoCodigo: String): boolean;
begin
  Result := false;
  setSqlProdutos(ftabelaPrecoCaption);
  montaSelect('select ' +
    fSqlCamposProdutos +
    ' from produtos p where p.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and p.grupo_prod||p.cod_prod = ' + QuotedStr(grupoCodigo)+
    ' and (p.consumo <> ''S'' or p.consumo is null ) and p.ativo = 1');
  if not dataSet.IsEmpty then
  begin
    Result := true;
    exit;
  end;
end;

end.

