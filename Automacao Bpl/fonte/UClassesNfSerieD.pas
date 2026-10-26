unit UClassesNfSerieD;

interface

uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls,
  IBStoredProc, StdCtrls, IBQuery;

type
  TNfSerieD = class;

  TEmpresaNFSD = class(TDataSet_OOP)
  public
    constructor create;
    function abreEmpresa: boolean;
    function segmentaProdVenda: boolean;
  end;

  TClientesNFSD = class(TDataSet_OOP)
  public
    constructor create;
    function abreClientes: Boolean; overload;
    function abreClientes(codigo: integer): boolean; overload;
    function LocCliente(Cod_Cliente: integer): boolean;
    function faturamentoBarrado(CodFaturamento: integer): boolean;
    function limiteDeCreditoEstourado(Valor: currency): boolean;
    function getValorDebitoCredito: Currency;
    function getValorDebitoCheque: Currency;
    procedure gravaTipoCliente(tipo: string);
    function clienteContribuinte: boolean;
  end;

  TColaboradorNFSD = class(TDataSet_OOP)
  public
    constructor create;
    function abreColaborador: boolean;
  end;

  TCodBarraNFSD = class(TDataSet_OOP)
  public
    constructor create;
    function abreCodBarra(codBarra: string): boolean;
  end;

  TProdutoNFSD = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function buscaProduto(codBarra: string; grupoProd: Integer = 0; codProd: string = ''): boolean; overload;
    function buscaProduto(grupo: integer; codigo: string): boolean; overload;
    function validaEstoque(venda: TNfSerieD): boolean;
    function getCasasDecimaisQtde: string;
    function getCasasDecimaisVlUnit: string;
  var
  	vPesqDescrProd: boolean;
    vBarra: TCodBarraNFSD;
  end;

  TSing = class(TObject)
  var
    vTipoVenda, vSegServ, vEmitNf, vUsarPreVenda, vObs_Ped, vObs_OS, vConcession,
      vCasasDecimais, nomeVenda: string;
    vValorTotalLiq, vValorTotalBruto, vValorDesconto, vValorAcrescimo: Currency;
    pesobr: Real; //Peso bruto dos produtos
  end;

  TGenerico = class(TDataSet_OOP)
  protected
    vSing: TSing;
  end;

  TItensNfSerieD = class(TGenerico)
  private
    vpermgvnd:Real;
    nItem:integer;
    vTotalItensBruto, vTotalItensLiq : Currency;
  public
    constructor create;
    destructor Destroy; override;
    function checaValoresItens: boolean;
    function abreItensNfSd(nOrdem: integer): boolean;
    function buscaProduto(codBarra: string; grupo: integer; codProd: string; venda: TNfSerieD):
      boolean;
    function post(venda: TNFSerieD): boolean;
    function insert(venda: TNfSerieD): boolean;
    function getValorItensBruto: Currency;
    function getValorItensLiquido: Currency;
    procedure CalculaValorTotalItens;
    function cancel(venda: TNFSerieD): boolean;
  var
    vProduto: TProdutoNFSD;
  end;

  TNfSerieD = class(TGenerico)
  private
    fBuscasPAF: TIBQuery;
    comandoTexto:String;
    vValorTotal:Currency;
    function existeItensDuplicados: boolean;
    procedure alterarNOrdemItens;
    procedure voltarEstoquePedVenda;
  public
    constructor create;
    function CadNfSerieD:boolean;
    function reabrirVenda: boolean;
    destructor Destroy; override;
    function vendaFechada: boolean;
    function abreNfSerieD(nOrdem: integer): boolean; overload;
    function edit: boolean; override;
    function insert: boolean; override;
    function delete: boolean; override;
    function inserirVenda:boolean;
    function ChecaCamposObrigatorios: boolean;
    procedure calculaTotais;
    function getValorVendaBruta: Currency;
    function post: boolean; override;
    function confirmarVenda: boolean;
    function abrirLixeira: boolean;
    function sairdaLixeira: boolean;
    function moverParaLixeira: boolean;
    function excluirPermanentemente: boolean;
    procedure lixeira;
    procedure restaurar;
    function lixeiraCheia:boolean;
  var
    vItem: TItensNfSerieD;
    vEmp:TEmpresaNFSD;
    vCliente: TClientesNFSD;
    vColab:TColaboradorNFSD;
  end;

implementation

uses
  UDtmNfSerieD, IBDatabase, SysUtils, uCadNfSerieD, uDadosIni, Variants, 
  uPadrao;

{ TEmpresaNFSD }

function TEmpresaNFSD.abreEmpresa: boolean;
begin
  result := montaSelect('SELECT * FROM EMPRESA ' +
    'where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
end;

constructor TEmpresaNFSD.create;
begin
  DataSet := TClientDataSet(dtmNfSerieD.CdsEmpresa);
  transacao := TIBTransaction(dtmNfSerieD.IBTransNfSerieD);
  Buscas := TIBQuery(dtmNfSerieD.qrBuscas);
end;

function TEmpresaNFSD.segmentaProdVenda: boolean;
begin
  result := true;
  if dataSet.FieldByName('SEG_PROD_SERV').AsString <> 'S' then
    result := false;
end;

{ TClientesNFSD }

function TClientesNFSD.LocCliente(Cod_Cliente: integer): boolean;
begin
  result := true;
  montaSelect('SELECT * FROM CLIENTES ' +
    'WHERE COD_CLIENTE = ' + inttostr(Cod_Cliente) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
  if dataSet.IsEmpty then
  begin
    result := false;
    Application.MessageBox('Cliente não Encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
  end;
end;

function TClientesNFSD.abreClientes: Boolean;
begin
  result := montaSelect('SELECT * FROM CLIENTES ' + 'WHERE ' +
    ' cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
end;

function TClientesNFSD.abreClientes(codigo: integer): boolean;
begin
  result := montaSelect('SELECT * FROM CLIENTES WHERE ' +
    ' cod_empresa = ' + vDadosIni.codEmpresa + ' and cod_cliente = ' + IntToStr(codigo) +
    ' and ativo=1');
end;

function TClientesNFSD.faturamentoBarrado(CodFaturamento: integer): boolean;
begin
  result := false;
  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM Tipo_Faturamento ' +
    'where CODIGO_FATURAMENTO = ' + inttostr(CodFaturamento) + ' and ativo=1';
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    if trim(buscas.FieldByName('STATUS_F').AsString) = 'BARRADO' then
    begin
      Application.MessageBox('Cliente Com Faturamento Barrado', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      Result := true;
    end;
  end;
end;

function TClientesNFSD.limiteDeCreditoEstourado(Valor: currency): boolean;
begin
  result := false;
  if (not dataset.FieldByName('LIMITE_CREDITO').isnull) and
    (dataset.FieldByName('LIMITE_CREDITO').AsFloat <> 0) then
  begin
    if dataset.FieldByName('LIMITE_CREDITO').AsFloat < Valor then
    begin
      Application.MessageBox(PChar('Limite de Crédito Estourado para o cliente ' + format('%n',
        [dataset.FieldByName('LIMITE_CREDITO').AsFloat]))
        , 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      result := true;
      exit;
    end;
    Application.MessageBox(pchar('Cliente com Limite Estourado' + chr(13) +
      'Valor do Limite: ' + format('%n', [dataset.FieldByName('LIMITE_CREDITO').AsCurrency]) +
      chr(13) +
      'Valor do debito: ' + format('%n', [getValorDebitoCredito + getValorDebitoCheque]) + chr(13) +
      'Valor da Compra: ' + format('%n', [Valor])), 'Erro', MB_ICONWARNING + MB_OK);
    Result := true;
  end;
end;

function TClientesNFSD.clienteContribuinte: boolean;
begin
  Result := false;
  if (Length(dataSet.fieldbyname('CPFCGC').AsString) > 11) and
    (dataSet.FieldByName('INSC_EST').asstring <> 'ISENTO') then
    if
      Application.MessageBox('Este cliente é contribuinte, você pode emitir NF, tem certeza que deseja enviar este DAV para cupom?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
      result := True;
end;

constructor TClientesNFSD.create;
begin
  DataSet := TClientDataSet(DtmNfSerieD.cdsClientes);
  transacao := TIBTransaction(DtmNfSerieD.IBTransNfSerieD);
  Buscas := TIBQuery(DtmNfSerieD.qrBuscas);
end;

function TClientesNFSD.getValorDebitoCheque: Currency;
begin
  buscas.Close;
  buscas.SQL.Text := 'Select sum(VALOR_CH) soma from' +
    ' controle_cheque where cod_cliente = :vcod' +
    ' and (status_ch is null or status_ch = '')' +
    ' and codigo_emp = :cod_empresa';
  buscas.Params[0].AsInteger := dataSet.FieldByName('cod_cliente').AsInteger;
  buscas.Params[1].AsString := vDadosIni.codEmpresa;
  buscas.Open;
  Result := buscas.FieldByName('soma').AsCurrency;
end;

function TClientesNFSD.getValorDebitoCredito: Currency;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(VALOR_C) soma from controle_creditos' +
    ' where cod_cliente = :vcod' +
    ' and (status_c is null or status_c = '')' +
    ' and codigo_emp = :cod_empresa';
  buscas.Params[0].AsInteger := dataSet.FieldByName('cod_cliente').AsInteger;
  buscas.Params[1].AsString := vDadosIni.codEmpresa;
  buscas.Open;
  Result := buscas.FieldByName('soma').AsCurrency;
end;

procedure TClientesNFSD.gravaTipoCliente(tipo: string);
begin
  try
    if not Edit then
      exit;
    dataSet.FieldByName('data_ult_compra').AsDateTime := vDadosIni.getDataBanco(buscas);
    if dataSet.FieldByName('TIPOCLIENTE').AsString = '' then
    begin
      dataSet.FieldByName('TIPOCLIENTE').AsString := 'P';
      DataSet.Post;
      Apply;
    end
    else
    begin
      if pos('P', dataSet.FieldByName('TIPOCLIENTE').AsString) > 0 then
      begin
        DataSet.Post;
        Apply;
      end
      else
      begin
        if ((not (pos('S', dataSet.FieldByName('TIPOCLIENTE').AsString) > 0)) or (not (pos('V',
          dataSet.FieldByName('TIPOCLIENTE').AsString) > 0))) then
        begin
          dataSet.FieldByName('TIPOCLIENTE').AsString := 'P|' +
            dataSet.FieldByName('TIPOCLIENTE').AsString;
          DataSet.Post;
          Apply;
        end;
      end;
    end;
    dataSet.Refresh;
  except
    on e: exception do begin
      Application.MessageBox(pchar('Erro ao gravar dados da venda no cliente: ' + #13 + 'Erro: ' +
        e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TColaboradorNFSD }

function TColaboradorNFSD.abreColaborador: boolean;
begin
  result := montaSelect('SELECT C.*,F.desc_funcao, F.tpdocs_vnd FROM COLABORADOR C' +
    ' INNER JOIN funcoes F ON F.cod_funcao  = C.cod_funcao' +
    ' WHERE C.cod_empresa = ' + vDadosIni.codEmpresa + ' AND C.ativo = 1');
end;

constructor TColaboradorNFSD.create;
begin
  DataSet := TClientDataSet(DtmNfSerieD.cdsColaborador);
  transacao := TIBTransaction(DtmNfSerieD.IBTransNfSerieD);
  Buscas := TIBQuery(DtmNfSerieD.qrBuscas);
end;

{ TProdutoNFSD }

function TProdutoNFSD.buscaProduto(codBarra: string; grupoProd: Integer; codProd: string): boolean;
begin
  try
  	vPesqDescrProd := false;
  	if (grupoProd > 0) or (trim(codProd) <> '') then
    begin
      montaSelect('select distinct p.*, ' +
      	' coalesce(est.estoque, 0) estoque_disponivel, ' +
		 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
        ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa ' +
        ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
        ' where cb.cod_barra = ' + QuotedStr(codBarra) +
        ' and cb.grupo_prod = ' + IntToStr(grupoProd) +
        ' and cb.cod_prod = ' + QuotedStr(codProd) +
        ' and cb.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cb.ativo = 1 ' +
        ' and p.ativo = 1 ' +
        ' and (coalesce(p.consumo, ''N'') <> ''S'')');
    end
    else
    begin
      montaSelect('select distinct p.*, ' +
      	' coalesce(est.estoque, 0) estoque_disponivel, ' +
		 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
        ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa ' +
        ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
        ' where cb.cod_barra = ' + QuotedStr(codBarra) +
        ' and cb.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cb.ativo = 1 ' +
        ' and p.ativo = 1 ' +
        ' and (coalesce(p.consumo, ''N'') <> ''S'')');

      if dataSet.IsEmpty then
      begin
      	montaSelect('select distinct p.*, ' +
        	' coalesce(est.estoque, 0) estoque_disponivel, ' +
			 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
          ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa ' +
          ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
          ' where p.cod_empresa=' + vDadosIni.codEmpresa +
          ' and p.descr_prod like ' + QuotedStr(codBarra + '%') +
          ' and p.ativo = 1 ' +
          ' and (coalesce(p.consumo, ''N'') <> ''S'')' +
          ' order by p.descr_prod ');

        if not dataSet.IsEmpty then
        	vPesqDescrProd := true;
      end;
    end;

    if not dataSet.IsEmpty then
      if dataSet.RecordCount > 1 then
        if not vDadosIni._abreFormEscolhaProdutosIni(dataSet) then
          raise exception.create('Produto não encontrado');

    if dataSet.IsEmpty then
    begin
      if not vBarra.abreCodBarra(codBarra) then
        raise exception.create('Produto não encontrado');
      if not buscaProduto(vBarra.dataSet.FieldByName('grupo_prod').AsInteger,
        vBarra.dataSet.FieldByName('cod_prod').AsString) then
        raise exception.create('Produto não encontrado');
    end;
    Result := true;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

function TProdutoNFSD.buscaProduto(grupo: integer; codigo: string): boolean;
begin
  montaSelect('select p.*, ' +
  	' coalesce(est.estoque, 0) estoque_disponivel, ' +
 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
    ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
  	' where p.grupo_prod = ' + IntToStr(grupo) +
    ' and p.cod_prod = ' + QuotedStr(codigo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and p.ativo = 1 ' +
    ' and (coalesce(consumo, ''N'') <> ''S'')');
  Result := not dataSet.IsEmpty
end;

constructor TProdutoNFSD.create;
begin
  DataSet := TClientDataSet(DtmNfSerieD.cdsprod);
  transacao := TIBTransaction(DtmNfSerieD.IBTransNfSerieD);
  Buscas := TIBQuery(DtmNfSerieD.qrBuscas);
  vBarra := TCodBarraNFSD.create;
end;

destructor TProdutoNFSD.Destroy;
begin
  vBarra.Free;
  vBarra := nil;
  inherited;
end;

function TProdutoNFSD.getCasasDecimaisQtde: string;
begin
  Result := '3';
end;

function TProdutoNFSD.getCasasDecimaisVlUnit: string;
begin
  if dataSet.FieldByName('CSDECVLUNT').AsString = '3' then
    Result := '3'
  else
    Result := '2';
end;

function TProdutoNFSD.validaEstoque(venda: TNfSerieD): boolean;
var
  sql: string;
  vest, vTemp: Real;
begin
  try
    Result := True;
    if venda.vItem.dataSet.FieldByName('quantid_item').AsFloat <= 0 then
      raise exception.create('Quantidade inválida');
    if vDadosIni.bancoConectado = 'local' then
    begin
      Result := True;
      exit;
    end;

    exit;

    // a quantidade em estoque nao é necessária na nf serie d.

    sql := 'select sum(itpd.quant_ped_item) as soma1 from pedvenda pd' +
      ' inner join pedvenda_prod itpd on pd.nped = itpd.nped and' +
      ' pd.cod_empresa = itpd.cod_empresa and pd.tipo = itpd.tipo' +
      ' where pd.ativo = 1 and itpd.grupo_prod = :grupo and itpd.cod_prod = :codigo and' +
      ' (pd.data_fech is null or pd.data_fech < :data)';
    buscas.Close;
    if venda.vEmp.dataSet.FieldByName('apres_estr').AsString = 'R' then
      sql := sql + ' and pd.tipo = ''REQ'''
    else if venda.vEmp.dataSet.FieldByName('apres_estr').AsString = 'O' then
      sql := sql + ' and pd.tipo = ''OS''';
    if (venda.vEmp.dataSet.FieldByName('apres_estr').AsString = 'R') or
      (venda.vEmp.dataSet.FieldByName('apres_estr').AsString = 'O') or
      (venda.vEmp.dataSet.FieldByName('apres_estr').AsString = 'S') then
    begin
      buscas.SQL.Text := sql;
      buscas.Params[0].AsInteger := dataSet.FieldByName('grupo_prod').AsInteger;
      buscas.Params[1].AsString := dataSet.FieldByName('cod_prod').AsString;
      buscas.Params[2].AsDate := StrToDate('30/12/1899');
      buscas.Open;
      vTemp := buscas.FieldByName('soma1').AsFloat;
    end;
    buscaProduto(venda.vItem.dataSet.FieldByName('grupo_prod').AsInteger,
      venda.vItem.dataSet.FieldByName('cod_prod').AsString);
    vest := dataSet.FieldByName('est_f').AsFloat - vTemp;
    Result := (vest > 0) or (vDadosIni.vEstoqueNegativo = 'S');
    if not Result then
      raise exception.create('Quantidade requisitada maior que o estoque');
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

{ TCodBarraNFSD }

function TCodBarraNFSD.abreCodBarra(codBarra: string): boolean;
begin
  Result := montaSelect('select * from cod_barra where cod_barra = ' + QuotedStr(codBarra) +
    ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

constructor TCodBarraNFSD.create;
begin
  DataSet := TClientDataSet(DtmNfSerieD.cdsBarra);
  transacao := TIBTransaction(DtmNfSerieD.IBTransNfSerieD);
  Buscas := TIBQuery(DtmNfSerieD.qrBuscas);
end;

{ TItensNfSerieD }

function TItensNfSerieD.abreItensNfSd(nOrdem: integer): boolean;
begin
  result := montaSelect('SELECT * FROM nf_serie_d_itens ' +
    ' WHERE  numeronota = ' + inttostr(nOrdem) + ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo=1');
end;

function TItensNfSerieD.buscaProduto(codBarra: string; grupo: integer;
  codProd: string; venda: TNfSerieD): boolean;
var
  temp: string;
begin
  try
    Result := true;
    if codBarra <> '' then
    begin
      if not vProduto.buscaProduto(codBarra, grupo, codProd) then
      begin
        Result := false;
        exit
      end;
    end
    else
    begin
      if (trim(codProd) = '') or (grupo = 0) then
        raise exception.create('Dados para consulta não informados completamente');
      Result := vProduto.buscaProduto(grupo, codProd);
    end;
    if not Result then
      exit;

      dataSet.FieldByName('VL_UN_ITEM').AsCurrency :=
        vProduto.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency;

    if (not venda.vCliente.dataSet.FieldByName('CAMP_PR_VENDA').isnull) and
      (venda.vCliente.dataSet.FieldByName('CAMP_PR_VENDA').AsString <> '') then
    begin
      try
        dataSet.FieldByName('VL_UN_ITEM').AsCurrency :=
          vProduto.dataSet.FieldByName(venda.vCliente.dataSet.FieldByName('CAMP_PR_VENDA').AsString).AsCurrency;
      except
        raise exception.Create('Campo de Preco de produto no cliente incorreto');
      end;
    end;

    dataSet.FieldByName('GRUPO_PROD').AsInteger :=
      vProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger;
    dataSet.FieldByName('COD_PROD').AsString := vProduto.dataSet.FieldByName('COD_PROD').AsString;
    dataSet.FieldByName('NUM_FAB_PROD').AsString := vDadosIni.IfThen(vProduto.vPesqDescrProd,
      vProduto.dataSet.FieldByName('NUM_FAB_PROD').AsString, codBarra);
    dataSet.FieldByName('DESC_PROD').asstring :=
      vProduto.dataSet.FieldByName('DESCR_PROD').AsString;
    dataSet.FieldByName('aliquota').AsFloat :=
      vProduto.dataSet.FieldByName('icm_prod').AsFloat;
    dataSet.FieldByName('ISENTO').AsString := vProduto.dataSet.FieldByName('ISENTO_PROD').AsString;

    if (vProduto.dataSet.FieldByName('EM_PROMOCAO').AsString = 'S') and
      (vProduto.dataSet.FieldByName('PRECO_PROMOCAO').AsCurrency > 0) then
      dataSet.FieldByName('VL_UN_ITEM').AsCurrency :=
        vProduto.dataSet.FieldByName('PRECO_PROMOCAO').AsCurrency;

    dataSet.FieldByName('VL_UN_ITEM').AsCurrency :=
      vDadosIni.StrToFloatFormat(dataSet.FieldByName('VL_UN_ITEM').AsCurrency,vDadosIni.vEmp.vCasasDecimais);
    dataSet.FieldByName('PREC_CUSM_PROD').AsCurrency := vProduto.dataSet.FieldByName('PREC_CUSM_PROD').AsCurrency;
//    temp := StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]);
//    temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
//    StrToCurr(temp);
    Result := true;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

procedure TItensNfSerieD.CalculaValorTotalItens;
begin
  vTotalItensBruto := 0;
  vTotalItensLiq := 0;
  nItem := 0;
  dataSet.First;
  while not dataSet.Eof do
  begin
    vTotalItensBruto := vTotalItensBruto + (dataSet.FieldByName('quantid_item').AsCurrency *
      dataSet.FieldByName('VL_UN_item').AsCurrency);
    vTotalItensLiq :=  vTotalItensBruto;
//    vTotalItensLiq := vTotalItensLiq + dataSet.FieldByName('VLTOT_PED_ITEM').AsCurrency +
//      dataSet.FieldByName('RATEIO_ACRESC').AsCurrency +
//      dataSet.FieldByName('ACRESC_ITEM').AsCurrency -
//      dataSet.FieldByName('RATEIO_DESC').AsCurrency -
//      dataSet.FieldByName('DESC_ITEM').AsCurrency;
    inc(nItem);
    dataSet.Next;
  end;
end;

function TItensNfSerieD.cancel(venda: TNFSerieD): boolean;
var
  item: integer;
begin
  Result := false;
  if dataSet.State in [dsInsert, dsedit] then
  begin
    dataSet.Cancel;
    Result := true;
  end
  else if dataSet.State = dsBrowse then
  begin
    if dataSet.IsEmpty then
    begin
      Result := false;
      exit;
    end;
    if Application.MessageBox(pchar('Deseja apagar o item?'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      dataSet.Delete;
      item :=1;
      dataSet.First;
      while not dataSet.Eof do
      begin
        dataSet.Edit;
        dataSet.FieldByName('nitem').AsInteger := item;
        dataSet.Post;
        inc(item);
        dataSet.Next;
      end;
      Result := true;
    end;
  end;
end;

function TItensNfSerieD.checaValoresItens: boolean;
begin
  result := false;
  try
    if dataSet.FieldByName('QUANTID_ITEM').AsFloat <= 0 then
      raise Exception.create('Campo Quantidade deve ser preenchido.' + chr(13) + 'Favor Verificar');
    if dataSet.FieldByName('VL_UN_ITEM').AsFloat <= 0 then
      raise Exception.create('Campo Valor Unitário deve ser preenchido.' + chr(13) +
        'Favor Verificar');

    dataSet.FieldByName('VL_UN_ITEM').AsCurrency := vDadosIni.StrToFloatFormat(
      dataSet.FieldByName('VL_UN_ITEM').AsCurrency,vDadosIni.vEmp.vCasasDecimais);

    dataSet.FieldByName('VL_TOT_ITEM').AsCurrency := vDadosIni.StrToFloatFormat(
      dataSet.FieldByName('QUANTID_ITEM').AsFloat
      * dataSet.FieldByName('VL_UN_ITEM').AsFloat,2);
    if dataSet.FieldByName('aliquota').AsFloat > 0 then
    begin
      if vProduto.dataSet.FieldByName('perc_red_prod').AsFloat > 0 then
        dataSet.FieldByName('base_icm').AsFloat := vDadosIni.StrToFloatFormat(
        (dataSet.FieldByName('VL_TOT_ITEM').AsCurrency *
        vProduto.dataSet.FieldByName('perc_red_prod').AsFloat) /100,2)
      else
        dataSet.FieldByName('base_icm').AsFloat := dataSet.FieldByName('VL_TOT_ITEM').AsCurrency ;
      dataSet.FieldByName('valor_icm').AsFloat := vDadosIni.StrToFloatFormat(dataSet.FieldByName('aliquota').AsFloat * dataSet.FieldByName('base_icm').AsFloat / 100,2);
    end
    else
    begin
      dataSet.FieldByName('aliquota').AsFloat := 0;
      dataSet.FieldByName('base_icm').AsFloat := 0;
      dataSet.FieldByName('valor_icm').AsFloat := 0;
    end;

    Result := true;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

constructor TItensNfSerieD.create;
begin
  DataSet := TClientDataSet(DtmNfSerieD.cdsItNFSD);
  transacao := TIBTransaction(DtmNfSerieD.IBTransNfSerieD);
  Buscas := TIBQuery(DtmNfSerieD.qrBuscas);
  vProduto := TProdutoNFSD.create;
end;

destructor TItensNfSerieD.Destroy;
begin
  vProduto.Free;
  vProduto :=NIL;
  inherited;
end;

function TItensNfSerieD.getValorItensBruto: Currency;
begin
  CalculaValorTotalItens;
  Result := vTotalItensBruto;
end;

function TItensNfSerieD.getValorItensLiquido: Currency;
begin
  CalculaValorTotalItens;
  Result := vTotalItensLiq;
end;

function TItensNfSerieD.insert(venda: TNfSerieD): boolean;
begin
  Result := false;
  if dataSet.State in [dsInsert, dsedit] then
  begin
    if not post(venda) then
      exit;
  end;
  if inherited insert then
  begin
    Result := true;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('numeronota').AsInteger := venda.dataSet.FieldByName('numeronota').AsInteger;
    dataSet.FieldByName('nitem').AsInteger := nItem + 1;
  end;
end;

function TItensNfSerieD.post(venda: TNFSerieD): boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
      if not vDadosIni.PesqPros('NSD008', 'SALVAR', 'GRUPO: ' + dataSet.FieldByName('GRUPO_PROD').AsString +
        ' COD PROD: ' +
        dataSet.FieldByName('COD_PROD').AsString, 'NF_SERIE_D_ITENS', dataSet.FieldByName('GRUPO_PROD').AsString +
        '-' + dataSet.FieldByName('COD_PROD').AsString, buscas, true) then
        Exit;

    if venda.vendaFechada then
      Exit;

    if trim(dataSet.FieldByName('cod_prod').AsString) = '' then
      raiseExceptionCreate('Produto não encontrado', 'DBEdit13');
    if trim(dataSet.FieldByName('grupo_prod').AsString) = '' then
      raiseExceptionCreate('Produto não encontrado', 'DBEdit13');
    if trim(dataSet.FieldByName('num_fab_prod').AsString) = '' then
      raiseExceptionCreate('Produto não encontrado', 'DBEdit13');
    if dataSet.FieldByName('QUANTID_ITEM').AsFloat <= 0 then
    	raiseExceptionCreate('Campo Quantidade deve ser preenchido.' + chr(13) + 'Favor Verificar', 'DBEdit14');
    if dataSet.FieldByName('VL_UN_ITEM').AsFloat <= 0 then
    	raiseExceptionCreate('Campo Valor Unitário deve ser preenchido.' + chr(13) + 'Favor Verificar', 'DBEdit15');

    {if trim(dataSet.FieldByName('marca').AsString) = '' then
      raise Exception.create('Marca de preechimento obrigatório.' + chr(13) + 'Favor Verificar');
    if trim(dataSet.FieldByName('Modelo').AsString) = '' then
      raise Exception.create('Modelo de preechimento obrigatório.' + chr(13) + 'Favor Verificar');
    if trim(dataSet.FieldByName('tipo').AsString) = '' then
      raise Exception.create('Tipo de preechimento obrigatório.' + chr(13) + 'Favor Verificar');
    if trim(dataSet.FieldByName('especie').AsString) = '' then
      raise Exception.create('Espécie de preechimento obrigatório.' + chr(13) + 'Favor Verificar');
    if trim(dataSet.FieldByName('qualidade').AsString) = '' then
      raise Exception.create('Qualidade de preechimento obrigatório.' + chr(13) + 'Favor Verificar');}

    if not checaValoresItens then
      exit;
    if not vProduto.validaEstoque(venda) then
      Exit;

    Result := inherited post;
    Inc(nItem);
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TNfSerieD }

function TNfSerieD.abreNfSerieD(nOrdem: integer): boolean;
begin
  result := montaSelect('select * from nf_serie_d where COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' and numeronota = ' + IntToStr(nOrdem) + ' and ativo=1');
end;

function TNfSerieD.abrirLixeira: boolean;
begin
  comandoTexto := dataSet.CommandText;
  result := montaSelect('SELECT * FROM nf_serie_d' +
    ' WHERE cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo <> 1');
end;

procedure TNfSerieD.alterarNOrdemItens;
begin
  vItem.First;
  while not vItem.dataSet.Eof do
  begin
    vItem.dataSet.Edit;
    vItem.dataSet.FieldByName('numeronota').AsInteger := dataSet.FieldByName('numeronota').AsInteger;
//    if vDadosIni.vSistema <> 'Fiscal' then
//      vItem.dataSet.FieldByName('cod_nf').AsInteger :=
//        dataSet.FieldByName('cod_nf').AsInteger;
    vItem.dataSet.Post;
    vItem.Next;
  end;
end;

function TNfSerieD.CadNfSerieD: boolean;
begin
  vDadosIni.vTipoForm := 0;
  if dtmNfSerieD = nil then
    dtmNfSerieD := TdtmNfSerieD.Create(dtmNfSerieD);
  if frmCadNfSerieD = nil then
    Application.CreateForm(TFrmCadNfSerieD, frmCadNfSerieD);

  if vDadosIni.vSistema = 'Fiscal' then
  begin
    vDadosIni.vTipoForm := 1;
    frmCadNfSerieD.Showmodal;
  end
  else
  begin
    vDadosIni.vTipoForm := 0;
    frmCadNfSerieD.Show;
  end;
end;

procedure TNfSerieD.calculaTotais;
var
  vtotnf: Currency;
  vtotisento: Currency;
  vtotoutros: Currency;
  vtotbasecalc: Currency;
  vtoticms: Currency;
begin
  if not vItem.dataSet.Active then
    vItem.abreItensNfSd(dataSet.FieldByName('numeronota').AsInteger);
  vValorTotal := vItem.getValorItensBruto;
  vtotnf:=0;
  vtotisento:=0;
  vtotoutros:=0;
  vtotbasecalc:=0;
  vtoticms:=0;
  vItem.First;
  while not vItem.dataSet.Eof do
  begin
    vtotnf := vtotnf + vItem.dataSet.FieldByName('vl_tot_item').AsCurrency;
    if vItem.dataSet.FieldByName('isento').AsString = 'S' then
      vtotisento := vtotisento + vItem.dataSet.FieldByName('vl_tot_item').AsCurrency
    else if vItem.dataSet.FieldByName('aliquota').AsFloat > 0 then
    begin
      vtotbasecalc := vtotbasecalc + vItem.dataSet.FieldByName('BASE_ICM').AsCurrency;
      vtotisento := vtotisento + (vItem.dataSet.FieldByName('vl_tot_item').AsCurrency -
        vItem.dataSet.FieldByName('BASE_ICM').AsCurrency);
      vtoticms := vtoticms + vItem.dataSet.FieldByName('VALOR_ICM').AsCurrency
    end
    else
      vtotoutros := vtotoutros + vItem.dataSet.FieldByName('vl_tot_item').AsCurrency;
    vItem.Next;
  end;

  if dataSet.State in [dsinsert, dsEdit] then
  begin
    dataSet.FieldByName('valor_geral').AsCurrency := vValorTotal;
    dataSet.FieldByName('B_CALC_ICMS').AsCurrency := vtotbasecalc;
    dataSet.FieldByName('VALOR_ICMS').AsCurrency := vtoticms;
    dataSet.FieldByName('OUTRAS').AsCurrency := vtotoutros;
    dataSet.FieldByName('ISENTA_N_TRIB').AsCurrency := vtotisento;
  end;
end;

function TNfSerieD.ChecaCamposObrigatorios: boolean;
begin
	try
    Result := false;

    if not (dataSet.State in [dsinsert, dsedit]) then
      Exit;
    if dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
      raiseExceptionCreate('Campo Cliente não pode ser vazio', 'DBEdit4');

    if dataSet.FieldByName('COD_VENDEDOR').AsInteger = 0 then
      raiseExceptionCreate('Campo Vendedor não pode ser vazio', 'DBLookupComboBox16');

    if trim(dataSet.FieldByName('serie').AsString) = '' then
      raiseExceptionCreate('Série não pode estar em branco', 'DBComboBox2');

    if trim(dataSet.FieldByName('subserie').AsString) = '' then
      raiseExceptionCreate('Sub Série não pode estar em branco', 'DBEdit6');

    if trim(dataSet.FieldByName('modelo').AsString) = '' then
      raiseExceptionCreate('Modelo não pode estar em branco', 'DBComboBox1');

    Result := true;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TNfSerieD.confirmarVenda: boolean;
var
  dataNow: TDateTime;
  vTemDescCondPag: string;
  vNPED: Integer;
  buscas4, buscas2: TIBQuery;
  vUnidade: string;
  vValorDesconto, vValorTotalItem, vTotProd, vValorItem, vValorDespNF, vValorUnitario: Double;
  vDescontoItem, vPlanoDesc, vPlanoAcresc, vMaxDesconto, vComiss, vComissGer, vPesoLiq, vPesoBruto: Double;
  vCodCongPag, vCodigoNop: Integer;
  vDescrCondPag, vCpfCgc: string;
  vDataHoraAtual, vDataAtual: TDateTime;
  vNomeVendedor, vTipV: string;
  I: Integer;
begin
  try
    Result := false;

    buscas4 := TIBQuery.Create(Application);
    buscas4.Database := fBuscasPAF.Database;
    buscas4.Transaction := fBuscasPAF.Transaction;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := fBuscasPAF.Database;
    buscas2.Transaction := fBuscasPAF.Transaction;

    if not vDadosIni.PesqPros('NSD011', 'CONFIRMAR',  'CONFIRMAR NFSD Nº ' +
      dataSet.FieldByName('numeronota').AsString, 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas, true) then
      Exit;
    if vendaFechada then
      Exit;
    if Application.MessageBox(pchar('Deseja Confirmar o Registro?'), 'Confirmação', MB_ICONQUESTION +
      MB_YESNO)      = IDNO then
    begin
      Result := false;
      Exit;
    end;
    vItem.First;
    while not vItem.dataSet.Eof do
    begin
      vItem.vProduto.validaEstoque(Self);
      vItem.Next;
    end;
    if vDadosIni.bancoConectado <> 'local' then
    if retornaValor('select status as valor from nf_serie_d' +
      ' where numeronota = ' + dataSet.FieldByName('numeronota').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1')
      <> '' then
    begin
      Result := false;
      Application.MessageBox(pchar('Atenção venda já esta fechada'),
        'Atenção',
        MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;

    try
      IniciaTransacao;
      if not (dataSet.State in [dsInsert, dsedit]) then
        dataSet.Edit;
      dataNow := vDadosIni.getDataHoraBanco(buscas);
      dataSet.FieldByName('status').AsString := 'FECHADA';
      dataSet.Post;
      if not Apply then
        raiseExceptionCreate('Não foi possivel confirmar o documento. Erro ao alterar status. A operação não será feita', '');
//      dataSet.Refresh;
      if (vDadosIni.vSistema = 'Fiscal') and (vDadosIni.bancoConectado = 'local') then
      begin
        try
          fBuscasPAF.Close;
          fBuscasPAF.SQL.Text := 'update nf_serie_d set enviado_ret = ''A'' ' +
            ' where numeronota = ' + dataSet.FieldByName('numeronota').AsString +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          fBuscasPAF.ExecSQL;
          fBuscasPAF.Close;
          fBuscasPAF.SQL.Text := 'update nf_serie_d_itens set enviado_ret = ''A'' ' +
            ' where numeronota = ' + dataSet.FieldByName('numeronota').AsString +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          fBuscasPAF.ExecSQL;
        except    
        end;
      end;

      if vDadosIni.vNFserieD.vGerarRequisicao then
      begin
        vNPED := GenCodigo('REQVENDA', dtmNfSerieD.SpIncCodigo2, vDadosIni.codEmpresa);

        buscas4.Close;
        buscas4.SQL.Text := 'INSERT INTO PEDVENDA (NPED, TIPO, COD_EMPRESA, COD_CLIENTE, COD_VENDEDOR, ATIVO, VALOR_TOTAL, N_NFD, SERIE_NFD, NFD_GEROU)' +
          ' VALUES (:NPED, :TIPO, :COD_EMPRESA, :COD_CLIENTE, :COD_VENDEDOR, 1, :VALOR_TOTAL, :N_NFD, :SERIE_NFD, ''S'')';
        buscas4.ParamByName('NPED').AsInteger := vNPED;
        buscas4.ParamByName('TIPO').AsString := 'REQ';
        buscas4.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
        buscas4.ParamByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('COD_CLIENTE').AsInteger;
        buscas4.ParamByName('COD_VENDEDOR').AsInteger := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
        buscas4.ParamByName('VALOR_TOTAL').AsFloat := dataSet.FieldByName('VALOR_GERAL').AsFloat;
        buscas4.ParamByName('N_NFD').AsInteger := dataSet.FieldByName('NUMERONOTA').AsInteger;
        buscas4.ParamByName('SERIE_NFD').AsString := dataSet.FieldByName('serie').AsString;
        buscas4.ExecSQL;

        buscas2.Close;
        buscas2.SQL.Text := 'select cod_cond_pag, desc_cond_pag, max_desc from cond_pag' +
          ' where desc_cond_pag = ''A VISTA'' order by cod_cond_pag ';
        buscas2.Open;

        if not buscas2.IsEmpty then
        begin
          vMaxDesconto := buscas2.FieldByName('max_desc').AsFloat;
          vDescrCondPag := Trim(buscas2.FieldByName('desc_cond_pag').AsString);
          vCodCongPag := buscas2.FieldByName('COD_COND_PAG').AsInteger;
        end
        else
        begin
          buscas2.Close;
          buscas2.SQL.Text := 'select cod_cond_pag, desc_cond_pag, max_desc from cond_pag' +
            ' where cod_cond_pag = 1 order by cod_cond_pag ';
          buscas2.Open;

          vMaxDesconto := buscas2.FieldByName('max_desc').AsFloat;
          vDescrCondPag := Trim(buscas2.FieldByName('desc_cond_pag').AsString);
          vCodCongPag := buscas2.FieldByName('COD_COND_PAG').AsInteger;
        end;

        buscas2.Close;
        buscas2.SQL.Text := 'select cpfcgc, camp_pr_venda, perc_desc from clientes' +
          ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas2.Open;
        vCpfCgc := Trim(buscas2.FieldByName('cpfcgc').AsString);
        if (buscas2.FieldByName('camp_pr_venda').AsString <> '') and
          (buscas2.FieldByName('perc_desc').AsFloat > 0) then
          vMaxDesconto := buscas2.FieldByName('perc_desc').AsFloat;

        vDataHoraAtual := vDadosIni.getDataHoraBanco(buscas2);
        vDataAtual := vDadosIni.getDataBanco(buscas2);
        vNomeVendedor := retornaValor('select nome_vendedor as valor from colaborador' +
          ' where cod_vendedor = ' + IntToStr(dataSet.FieldByName('cod_vendedor').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa);
        vTipV := 'V';

        I:= 0;
        vValorDesconto := 0;
        vValorTotalItem := 0;
        vTotProd := 0;
        vItem.dataSet.First;
        while not vItem.dataSet.Eof do
        begin
          Inc(I);
          vValorItem := vItem.dataSet.FieldByName('VL_UN_ITEM').AsFloat;
          vValorDespNF := 0;
          vValorDespNF := vDadosIni.StrToFloatFormat(vValorDespNF, 2);

          vValorUnitario := vDadosIni.StrToFloatFormat(vValorItem , vDadosIni.vEmp.vCasasDecimais);

          vValorItem := vDadosIni.StrToFloatFormat(vItem.dataSet.FieldByName('VL_TOT_ITEM').AsFloat, 2);
          vDescontoItem := 0;

          vValorTotalItem := vValorTotalItem + vValorItem + vValorDespNF;
          vValorDesconto := vValorDesconto + vDescontoItem;
          vTotProd := vTotProd + vValorItem;

          buscas2.Close;
          buscas2.SQL.Text := ' select comissao_prod, comissao_prod_ger, prec_cus_prod, prec_cusm_prod, codigo_nop, ' +
          	' unidade, peso_liq_prod, peso_brut_prod from produtos ' +
            ' where grupo_prod = ' + IntToStr(vItem.dataSet.FieldByName('grupo_prod').AsInteger) +
            ' and cod_prod = ' + QuotedStr(vItem.dataSet.FieldByName('cod_prod').AsString) +
            ' and cod_empresa = ' + IntToStr(vItem.dataSet.FieldByName('cod_empresa').AsInteger);
          buscas2.Open;

          vComiss := buscas2.FieldByName('comissao_prod').AsFloat;
          vComissGer := buscas2.FieldByName('comissao_prod_ger').AsFloat;
          vCodigoNop := buscas2.FieldByName('codigo_nop').AsInteger;
          vUnidade := buscas2.FieldByName('unidade').AsString;
          vPesoLiq := buscas2.FieldByName('peso_liq_prod').AsFloat;
          vPesoBruto := buscas2.FieldByName('peso_brut_prod').AsFloat;

          buscas4.Close;
          buscas4.SQL.Text := 'INSERT INTO PEDVENDA_PROD (NPED, TIPO, GRUPO_PROD, COD_PROD, NITEM, COD_EMPRESA, COD_GRADE, CODIGO_NOP, NUM_FAB_PROD,' +
            ' DESCR_PROD_PED, QUANT_PED_ITEM, VLUN_PED_ITEM, VLTOT_PED_ITEM, VLUN_ORIG, VLUN_PED_NF,' +
            ' RATEIO_DESC, RATEIO_ACRESC, N_NFD, SERIED, RATDSAS, COMISS_PROD, COMISS_PROD_GER, PCUST_C,' +
            ' PCUST_MC, TP_NF_PED, SIT_ATD, DESC_ITEM, ACRESC_ITEM, COD_VENDEDOR, DATA_TRANSF, NOME_VEND,' +
            ' VLO_UNITARIO, DATA_INCLUSAO, TP_DESCACRES, NAT_DESCACRES, VALOR_DESCACRES, ' +
            ' NITEM_NF, XPED_COMPRA, NITEMPED_COMPRA, VL_DESP_NF, UNIDADE, PESO_LIQ_PROD, PESO_BRUT_PROD)' +
            ' VALUES (:NPED, :TIPO, :GRUPO_PROD, :COD_PROD, :NITEM, :COD_EMPRESA, :COD_GRADE, :CODIGO_NOP, :NUM_FAB_PROD,' +
            ' :DESCR_PROD_PED, :QUANT_PED_ITEM, :VLUN_PED_ITEM, :VLTOT_PED_ITEM, :VLUN_ORIG, :VLUN_PED_NF,' +
            ' :RATEIO_DESC, :RATEIO_ACRESC, :N_NFD, :SERIED, 0, :COMISS_PROD, :COMISS_PROD_GER, :PCUST_C,' +
            ' :PCUST_MC, ''2'', ''N'', 0, 0, :COD_VENDEDOR, :DATA_TRANSF, :NOME_VEND,' +
            ' :VLO_UNITARIO, :DATA_INCLUSAO, ''DESCONTO'', ''PERCENTUAL'', 0, ' +
            ' :NITEM_NF, :XPED_COMPRA, :NITEMPED_COMPRA, :VL_DESP_NF, :UNIDADE, :PESO_LIQ_PROD, :PESO_BRUT_PROD)';
          buscas4.ParamByName('NPED').AsInteger := vNPED;
          buscas4.ParamByName('TIPO').AsString := 'REQ';
          buscas4.ParamByName('GRUPO_PROD').AsInteger := vItem.dataSet.FieldByName('GRUPO_PROD').AsInteger;
          buscas4.ParamByName('COD_PROD').AsString := vItem.dataSet.FieldByName('COD_PROD').AsString;
          buscas4.ParamByName('NITEM').AsInteger := vItem.dataSet.FieldByName('NITEM').AsInteger;
          buscas4.ParamByName('COD_EMPRESA').AsInteger := vItem.dataSet.FieldByName('COD_EMPRESA').AsInteger;
          buscas4.ParamByName('COD_GRADE').AsInteger := 0;
          buscas4.ParamByName('CODIGO_NOP').AsInteger := vCodigoNop;
          buscas4.ParamByName('NUM_FAB_PROD').AsString := vItem.dataSet.FieldByName('NUM_FAB_PROD').AsString;
          buscas4.ParamByName('DESCR_PROD_PED').AsString := copy(Trim(vItem.dataSet.FieldByName('DESC_PROD').AsString),1,60);
          buscas4.ParamByName('QUANT_PED_ITEM').AsFloat := vItem.dataSet.FieldByName('QUANTID_ITEM').AsFloat;
          buscas4.ParamByName('VLUN_PED_ITEM').AsFloat := vValorUnitario;
          buscas4.ParamByName('VLTOT_PED_ITEM').AsFloat := vValorItem;
          buscas4.ParamByName('VLUN_ORIG').AsFloat := vValorUnitario;
          buscas4.ParamByName('VLUN_PED_NF').AsFloat := vValorUnitario;
          buscas4.ParamByName('RATEIO_DESC').AsFloat := vDadosIni.StrToFloatFormat(vDescontoItem, 2);
          buscas4.ParamByName('RATEIO_ACRESC').AsFloat := vValorDespNF;
          buscas4.ParamByName('N_NFD').AsInteger := dataSet.FieldByName('NUMERONOTA').AsInteger;
          buscas4.ParamByName('SERIED').AsString := dataSet.FieldByName('SERIE').AsString;
          buscas4.ParamByName('COMISS_PROD').AsFloat := (vValorItem * vComiss) / 100;
          buscas4.ParamByName('COMISS_PROD_GER').AsFloat := (vValorItem * vComissGer) / 100;
          buscas4.ParamByName('PCUST_C').AsFloat := buscas2.FieldByName('PREC_CUS_PROD').AsFloat;
          buscas4.ParamByName('PCUST_MC').AsFloat := buscas2.FieldByName('PREC_CUSM_PROD').AsFloat;
          buscas4.ParamByName('COD_VENDEDOR').AsFloat := dataSet.FieldByName('COD_VENDEDOR').AsFloat;
          buscas4.ParamByName('DATA_TRANSF').AsDate := vDataAtual;
          buscas4.ParamByName('NOME_VEND').AsString := Trim(vNomeVendedor);
          buscas4.ParamByName('VLO_UNITARIO').AsFloat := vValorUnitario;
          buscas4.ParamByName('DATA_INCLUSAO').AsDate := vDataAtual;
          buscas4.ParamByName('NITEM_NF').AsInteger := vItem.dataSet.FieldByName('NITEM').AsInteger;
          buscas4.ParamByName('VL_DESP_NF').AsFloat := vValorDespNF;

          buscas.ParamByName('PESO_LIQ_PROD').AsFloat := vPesoLiq;
          buscas.ParamByName('PESO_BRUT_PROD').AsFloat := vPesoBruto;
          buscas.ParamByName('UNIDADE').AsString := vUnidade;

          buscas4.ExecSQL;

          vItem.dataSet.Next;
        end;

        buscas4.Close;
        buscas4.SQL.Text := 'UPDATE PEDVENDA SET' +
          ' COD_COND_PAG = :COD_COND_PAG, DATA_PED = :DATA_PED, DATA_FECH = :DATA_FECH, HORA_FECH = :HORA_FECH, VALOR_TOTAL = :VALOR_TOTAL,' +
          ' DESC_P_PROD = 0, DESC_P_SERV = 0, DESCONTO = :DESCONTO, OBS_PED = :OBS_PED,' +
          ' STATUS_PED = :STATUS_PED, TIPV = :TIPV, OBS_CXL_RQ = :OBS_CXL_RQ, VL_PAGO_CXL = 0,' +
          ' TIPOR = ''V'', HORAABERTURA = :HORAABERTURA, MINABERTURA = :MINABERTURA, HORAFECHAMENTO = :HORAFECHAMENTO,' +
          ' MINFECHAMENTO = :MINFECHAMENTO, DATA_CUPOM = :DATA_CUPOM, VL_ENTRADA = 0, NPREVENDA = NULL,' +
          ' ACRESC_P_PROD = 0, ACRESC_P_SERV = 0, ACRESCIMO = 0, TOT_PROD = :TOT_PROD,' +
          ' TOT_SERV = 0, DATA_NFD = :DATA_NFD, N_NFD = :N_NFD, VALOR_NFD = :VALOR_NFD, CPFCGC = :CPFCGC,' +
          ' SERIE_NFD = :SERIE_NFD, LIBTRAVA = ''N'', SUBTIPO_OS = ''NORMAL'',' +
          ' APROVADA_GERENTE = ''N'', DATA_LIBTRAVA = :DATA_LIBTRAVA,' +
          ' COD_CLIENTE = :COD_CLIENTE, COD_VENDEDOR = :COD_VENDEDOR' +
          ' WHERE NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA';
        buscas4.ParamByName('NPED').AsInteger := vNPED;
        buscas4.ParamByName('TIPO').AsString := 'REQ';
        buscas4.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
        buscas4.ParamByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('COD_CLIENTE').AsInteger;
        buscas4.ParamByName('COD_VENDEDOR').AsInteger := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
        buscas4.ParamByName('COD_COND_PAG').AsInteger := vCodCongPag;
        buscas4.ParamByName('DATA_PED').AsDate := vDataAtual;
        buscas4.ParamByName('DATA_FECH').AsDateTime := vDataAtual;
        buscas4.ParamByName('HORA_FECH').AsString := TimeToStr(vDataHoraAtual);
        buscas4.ParamByName('VALOR_TOTAL').AsFloat := vDadosIni.StrToFloatFormat(vValorTotalItem - vValorDesconto, 2);
        buscas4.ParamByName('DESCONTO').AsFloat := vDadosIni.StrToFloatFormat(vValorDesconto, 2);
        buscas4.ParamByName('OBS_PED').AsString := copy(vDadosIni.vEmp.vMensagem, 1, 50);
        buscas4.ParamByName('STATUS_PED').AsString := 'FECHADA';
        buscas4.ParamByName('TIPV').AsString := vTipV;
        buscas4.ParamByName('OBS_CXL_RQ').AsString := Copy(vDescrCondPag, 1, 50);
        buscas4.ParamByName('HORAABERTURA').AsString := Copy(FormatDateTime('HH:MM:SS', vDataHoraAtual), 1, 2);
        buscas4.ParamByName('MINABERTURA').AsString := Copy(FormatDateTime('HH:MM:SS', vDataHoraAtual), 4, 2);
        buscas4.ParamByName('HORAFECHAMENTO').AsString := Copy(FormatDateTime('HH:MM:SS', vDataHoraAtual), 1, 2);
        buscas4.ParamByName('MINFECHAMENTO').AsString := Copy(FormatDateTime('HH:MM:SS', vDataHoraAtual), 4, 2);
        buscas4.ParamByName('DATA_CUPOM').AsDate := vDataAtual;
        buscas4.ParamByName('TOT_PROD').AsFloat := vDadosIni.StrToFloatFormat(vTotProd, 2);
        buscas4.ParamByName('DATA_NFD').AsDate := vDataAtual;
        buscas4.ParamByName('VALOR_NFD').AsFloat := vValorTotalItem;
        buscas4.ParamByName('CPFCGC').AsString := vCpfCgc;
        buscas4.ParamByName('N_NFD').AsInteger := dataSet.FieldByName('NUMERONOTA').AsInteger;
        buscas4.ParamByName('SERIE_NFD').AsString := dataSet.FieldByName('serie').AsString;
        buscas4.ParamByName('DATA_LIBTRAVA').AsDate := vDataAtual;
        buscas4.ExecSQL;

        if not (dataSet.State in [dsInsert, dsedit]) then
          dataSet.Edit;
        dataSet.FieldByName('NPED').AsInteger := vNPED;
        dataSet.FieldByName('TIPO_PED').AsString := 'REQ';
        dataSet.Post;
        if not Apply then
          raiseExceptionCreate('Não foi possivel confirmar o documento. Erro ao alterar num pedido. A operação não será feita', '');

        vItem.dataSet.First;
        while not vItem.dataSet.Eof do
        begin
          if not (vItem.dataSet.State in [dsInsert, dsedit]) then
            vItem.dataSet.Edit;
          vItem.dataSet.FieldByName('NPED').AsInteger := vNPED;
          vItem.dataSet.FieldByName('TIPO_PED').AsString := 'REQ';
          vItem.dataSet.FieldByName('NITEM_PED').AsInteger := vItem.dataSet.FieldByName('NITEM').AsInteger;
          vItem.dataSet.Post;

          buscas4.Close;
          buscas4.SQL.Text := ' execute procedure movimenta_estoque(:GRUPO_PROD, :COD_PROD, ' + vDadosIni.codEmpresa + ', 0, 0, :QUANTIDADE, 0)';
          buscas4.ParamByName('GRUPO_PROD').AsInteger := vItem.dataSet.FieldByName('GRUPO_PROD').AsInteger;
          buscas4.ParamByName('COD_PROD').AsString := vItem.dataSet.FieldByName('COD_PROD').AsString;
          buscas4.ParamByName('QUANTIDADE').AsFloat := vItem.dataSet.FieldByName('QUANTID_ITEM').AsFloat;
          buscas4.ExecSQL;

          vItem.dataSet.Next;
        end;
        if not vItem.Apply then
          raiseExceptionCreate('Não foi possivel confirmar o documento. Erro ao alterar num pedido nos itens. A operação não será feita', '');

      end;

      if not CommitaTransacao then
        raise exception.create('Erro no fechamento venda: ' +
          dataSet.FieldByName('numerovenda').AsString
          + '  O procedimento será revertido');

      if vDadosIni.vNFserieD.vGerarRequisicao then
        Application.MessageBox(pchar('Nota Fiscal confirmada.' +#13 +
         'Requisição número ' + IntToStr(vNPED) + ' gerada.'), 'Atenção', MB_ICONINFORMATION + MB_OK)
      else
        Application.MessageBox(pchar('Nota Fiscal confirmada'), 'Atenção', MB_ICONINFORMATION + MB_OK);
         
      vDadosIni.GravaAuditoria('NSD011', 'CONFIRMAR', 'CONFIRMADA VENDA Nº ' +
        dataSet.FieldByName('numeronota').AsString, 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas);
    except
      on e: exception do begin
        dataSet.Cancel;
        vItem.dataSet.Cancel;
        dataSet.CancelUpdates;
        vItem.dataSet.CancelUpdates;
        RollBackTransacao;
        Result := false;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  finally
    dataSet.Refresh;
  end;
end;

constructor TNfSerieD.create;
begin
  if DtmNfSerieD = nil then
    DtmNfSerieD := TdtmNfSerieD.Create(DtmNfSerieD);
  DataSet := TClientDataSet(DtmNfSerieD.cdsNFSD);
  transacao := TIBTransaction(DtmNfSerieD.IBTransNfSerieD);
  Buscas := TIBQuery(DtmNfSerieD.qrBuscas);
  fBuscasPAF:= TIBQuery(DtmNfSerieD.qrBuscasPAF);
  vItem := TItensNfSerieD.create;
    vEmp:= TEmpresaNFSD.create;
    vCliente:= TClientesNFSD.create;
    vColab:=TColaboradorNFSD.create;
  vSing := TSing.Create;
  vEmp.abreEmpresa;
  vSing.vCasasDecimais := vEmp.dataSet.FieldByName('CASAS_DECIMAIS').AsString;
  if (vSing.vCasasDecimais = '') or (vSing.vCasasDecimais = '0') then
    vSing.vCasasDecimais := '2';
  vItem.vSing := TSing(vSing);
end;

function TNfSerieD.delete: boolean;
var
 	buscas4: TIBQuery;
  vNPED: Integer;
  vTipo: string;
begin
  if not vDadosIni.PesqPros('NSD012', 'EXCLUIR', 'EXCLUIR NFSD Nº ' +
    dataSet.FieldByName('numeronota').AsString, 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas, true) then
    Exit;
  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
    Exit;

  vNPED := dataSet.FieldByName('NPED').AsInteger;
  vTipo := dataSet.FieldByName('TIPO_PED').AsString;
  vItem.abreItensNfSd(dataSet.FieldByName('numeronota').AsInteger);

  try
    if dataSet.FieldByName('NPED').AsInteger > 0 then
      voltarEstoquePedVenda;

    if inherited Delete then
    begin
      if Apply then
      begin
        if vNPED > 0 then
        begin
//          buscas4 := TIBQuery.Create(Application);
//          buscas4.Database := fBuscasPAF.Database;
//          buscas4.Transaction := fBuscasPAF.Transaction;

          buscas.Close;
          buscas.SQL.Text := ' DELETE FROM PEDVENDA ' +
            ' WHERE NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA ';
          buscas.ParamByName('NPED').AsInteger := vNPED;
          buscas.ParamByName('TIPO').AsString := vTipo;
          buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ExecSQL;
        end;

        if emTransacao then
          if CommitaTransacao then
            vDadosIni.GravaAuditoria('NSD012', 'EXCLUIR', 'EXCLUIDA NFSD REGISTRO ACIMA', 'NF_SERIE_D', '', buscas);

        Result := True;
      end
      else
        RollBackTransacao;
    end
    else
      RollBackTransacao;


  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      vDadosIni.registraErro('TNfSerieD.delete ' + e.Message);
      vDadosIni.ShowErro('Erro ao excluir registro. Erro ' + e.Message);
    end;
  end;
end;

destructor TNfSerieD.Destroy;
begin
  vItem.Free;
  vItem := nil;
    vEmp.Free;
    vEmp :=nil;
    vCliente.Free;
    vCliente := nil;
    vColab.Free;
    vColab :=nil;
    vSing.Free;
    vSing :=nil;
  inherited;
end;

function TNfSerieD.edit: boolean;
var
  nOrdem: integer;
begin
  Result := false;
  try
    if dataSet.IsEmpty then
      Exit;
    if vendaFechada then
    BEGIN
      nOrdem :=dataSet.FieldByName('numeronota').AsInteger;
      vItem.abreItensNfSd(nOrdem);
      vCliente.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
      vColab.abreColaborador;
      Result := True;
      EXIT;
    end;

    if inherited edit then
    begin
      comandoTexto := dataSet.CommandText;
      nOrdem := dataSet.FieldByName('numeronota').AsInteger;

      vItem.abreItensNfSd(nOrdem);
      vCliente.abreClientes(dataSet.FieldByName('COD_CLIENTE').AsInteger);
      vColab.abreColaborador;
      Result := true;
    end;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TNfSerieD.excluirPermanentemente: boolean;
begin
end;

function TNfSerieD.existeItensDuplicados: boolean;
var
  item: array of array[1..4] of string;
  i, qtde: integer;
begin
  try
    SetLength(item, vItem.dataSet.RecordCount);
    i := -1;
    vItem.dataSet.First;
    while not vItem.dataSet.Eof do
    begin
      inc(i);
      item[i, 1] := vItem.dataSet.FieldByName('grupo_prod').AsString;
      item[i, 2] := vItem.dataSet.FieldByName('cod_prod').AsString;
      item[i, 4] := '0';
      vItem.Next;
    end;
    i := -1;
    qtde := 0;
    vItem.dataSet.First;
    while not vItem.dataSet.Eof do
    begin
      inc(i);
      if (item[i, 1] = vItem.dataSet.FieldByName('grupo_prod').AsString) and
        (item[i, 2] = vItem.dataSet.FieldByName('cod_prod').AsString) then
      begin
        if item[i, 4] = '1' then
          raise exception.create('Produto Duplicado: Gr:' + item[i, 1] + ' Cod:' + item[i, 2] +
             #13 + 'Corrija para prosseguir');
        item[i, 4] := '1';
      end;
      vItem.Next;
    end;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('NFSD ' + dataSet.FieldByName('numeronota').AsString + ' ' + e.Message);
    end;
  end;
end;

function TNfSerieD.getValorVendaBruta: Currency;
begin
  Result :=vValorTotal;
end;

function TNfSerieD.inserirVenda: boolean;
begin
  try
    if CommitaTransacao then
      IniciaTransacao;
      result := true;
      Insert;

      fBuscasPAF.Close;
      fBuscasPAF.SQL.Text :=
        'select max(nd.numeronota) numeronota, max(nd.subserie) subserie from nf_serie_d nd' +
        ' where cod_empresa = ' + vDadosIni.codEmpresa;
      fBuscasPAF.Open;

      dataSet.FieldByName('numeronota').AsInteger := 0;
      dataSet.FieldByName('COD_EMPRESA').AsInteger := strToint(vDadosIni.codEmpresa);
      dataSet.FieldByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
      dataSet.FieldByName('serie').AsString := 'D';
      dataSet.FieldByName('subserie').AsString := '1';
      if Trim(fBuscasPAF.FieldByName('subserie').AsString) <> '' then
        dataSet.FieldByName('subserie').AsString := Trim(fBuscasPAF.FieldByName('subserie').AsString);   
      dataSet.FieldByName('numeronota').AsInteger := fBuscasPAF.FieldByName('numeronota').AsInteger + 1;
      dataSet.FieldByName('modelo').AsString := '02';
      dataSet.FieldByName('dataemissao').AsDateTime := vDadosIni.getDataBanco(fBuscasPAF);
      dataSet.FieldByName('dataentrada').AsDateTime := dataSet.FieldByName('dataemissao').AsDateTime;

  except
    on e: exception do begin
      Result := true;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TNfSerieD.insert: boolean;
begin
  Result := false;
  try
    comandoTexto := dataSet.CommandText;
    abreNfSerieD(0);
    Cancel;
    if inherited insert then
    begin
      vItem.abreItensNfSd(0);
      vColab.abreColaborador;
      Result := true;
    end;
  except
    on e: exception do begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TNfSerieD.lixeira;
begin
{
  if not vDadosIni.PesqPros('NSD002', 'EXCLUIR', 'EXCLUIR NFSD Nº ' +
    dataSet.FieldByName('numeronota').AsString, 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas, false) then
    Exit;
  if dataSet.IsEmpty then
    exit;

  if dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    excluirPermanentemente
  else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
    moverParaLixeira;
    }
end;

function TNfSerieD.lixeiraCheia: boolean;
begin
  Result := ExecutaComandosSql('select * from nf_serie_d where cod_empresa = '+vDadosIni.codEmpresa+
  ' and ativo = 0');
end;

function TNfSerieD.moverParaLixeira: boolean;
begin
{
  if not dataSet.Active then
    Exit;
  if dataSet.IsEmpty then
    Exit;
  if vendaFechada then
  begin
    Application.MessageBox('Não é possível mover para lixeira notafiscal "FECHADA", favor reabrir!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    exit;
  end;
  dataSet.Edit;
  dataSet.FieldByName('ATIVO').asinteger := 0;
  dataSet.Post;
  if Apply then
    if emTransacao then
      if CommitaTransacao then
        vDadosIni.GravaAuditoria('NSD004', 'EXCLUIR', 'ENVIADO PARA LIXEIRA NFSD Nº ' +
          dataSet.FieldByName('numeronota').AsString, 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas);
        }
end;

function TNfSerieD.post: boolean;
var
  grupo, codigo, cfop: string;
  nOrdem: integer;
begin
  try
    try
      Result := false;
      //Baixar Grade

      if vItem.dataSet.State in [dsInsert, dsEdit] then
        if not vItem.post(Self) then
        begin
          Result := false;
          exit;
        end;
      calculaTotais;

      if (dataSet.FieldByName('valor_geral').AsCurrency = 0) then
        raiseExceptionCreate('Valor da venda não deve ser igual a 0', 'DBEdit7');

      if Trim(dataSet.FieldByName('serie').AsString) = '' then
        raiseExceptionCreate('Série deve ser informada', 'DBComboBox2');

      if Trim(dataSet.FieldByName('subserie').AsString) = '' then
        raiseExceptionCreate('Sub série deve ser informada', 'DBEdit6');
        
      if (Trim(dataSet.FieldByName('modelo').AsString) <> '02') and (Trim(dataSet.FieldByName('modelo').AsString) <> '04') then
        raiseExceptionCreate('Modelo inválido. Selecione o modelo correto', 'DBComboBox1');

      //Verificando itens duplicados;
      if existeItensDuplicados then
        Exit;

      calculaTotais;

      //Gravando a venda no banco de dados
      if dataSet.State = dsInsert then
      begin
//        dataSet.FieldByName('numerovenda').AsInteger := Gencodigo('NF_SERIE_D',
//          dtmNfSerieD.SpIncCodigo,
//          vDadosIni.codEmpresa);
//        if vDadosIni.vSistema <> 'Fiscal' then
//          dataSet.FieldByName('cod_nf').AsInteger := Gencodigo('NF_SERIE_D',
//          dtmNfSerieD.SpIncCodigo,
//          vDadosIni.codEmpresa);
        
        alterarNOrdemItens;
      end;
      nOrdem := dataSet.FieldByName('numeronota').AsInteger;
      dataSet.Post;
      if Apply then
      begin
        dataSet.Refresh;
        vItem.Apply;
        vItem.dataSet.Refresh;

        if Trim(vDadosIni.vNumSerieEcf) <> '' then
        begin
          fBuscasPAF.Close;
          fBuscasPAF.SQL.Text := 'update NF_SERIE_D set ENVIADO_RET = ''A''' +
            ' where ENVIADO_RET is null ' + //= ' + IntToStr(nOrdem) +
            ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
          try fBuscasPAF.ExecSQL; except end;
          fBuscasPAF.Close;
          fBuscasPAF.SQL.Text := 'update NF_SERIE_D_ITENS set ENVIADO_RET = ''A''' +
            ' where ENVIADO_RET is null' + //NUMERONOTA = ' + IntToStr(nOrdem) +
            ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
          try fBuscasPAF.ExecSQL; except end;
        end;        

        if not CommitaTransacao then
        begin
          raise exception.create('Erro na gravação da venda numero ' +
            dataSet.FieldByName('numerovenda').AsString);
        end;

        abreNfSerieD(nOrdem);
        vItem.abreItensNfSd(nOrdem);
      end;

      //Confirmando a venda;
      confirmarVenda;

      Result := true;
    except
      on e: exception do begin
        Result := false;
        vDadosIni.GravaAuditoria('NSD006', 'CONFIRMAR', e.Message, 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas);
        registraErro('NSD006' + e.Message);
      end;
    end;
  finally
    if Result then
    begin
      montaSelect(comandoTexto);
    end;
  end;
end;

function TNfSerieD.reabrirVenda: boolean;
var
 	buscas4: TIBQuery;
  vNPED: Integer;
  vTipo: string;
begin
  try
    try
      Result := false;

      buscas4 := TIBQuery.Create(Application);
      buscas4.Database := fBuscasPAF.Database;
      buscas4.Transaction := fBuscasPAF.Transaction;

      if not vDadosIni.PesqPros('NSD013', 'REABRIR', 'REABRIR NFSD Nº ' +
        dataSet.FieldByName('NUMERONOTA').AsString, 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas, true) then
        Exit;
      if dataSet.IsEmpty then
        Exit;
      if Application.MessageBox('Deseja reabrir o Registro?', 'Confirmação', MB_ICONQUESTION +
        MB_YESNO)
        = IDNO then
      begin
        Result := false;
        Exit;
      end;
      if retornaValor('select status as valor from nf_serie_d ' + ' where numeronota = ' +
        dataSet.FieldByName('numeronota').AsString + ' and cod_empresa = ' + vDadosIni.codEmpresa) = '' then
        raise exception.create('Atenção ' + vSing.nomeVenda + ' já esta aberta');

      comandoTexto := dataSet.CommandText;
      abreNfSerieD(dataSet.FieldByName('NUMERONOTA').AsInteger);
      if dataSet.IsEmpty then
        raise exception.create('Registro não encontrada');

      CommitaTransacao;
      IniciaTransacao;
      vItem.abreItensNfSd(dataSet.FieldByName('numeronota').AsInteger);

      vNPED := dataSet.FieldByName('NPED').AsInteger;
      vTipo := dataSet.FieldByName('TIPO_PED').AsString;

      dataSet.Edit;
      dataSet.FieldByName('status').AsString := '';
      dataSet.FieldByName('NPED').Value := Null;
      dataSet.FieldByName('TIPO_PED').Value := Null;
      dataSet.Post;

      vItem.dataSet.First;
      while not vItem.dataSet.Eof do
      begin
         vItem.dataSet.Edit;
         vItem.dataSet.FieldByName('NPED').Value := Null;
         vItem.dataSet.FieldByName('TIPO_PED').Value := Null;
         vItem.dataSet.FieldByName('NITEM_PED').Value := Null;
         vItem.dataSet.Post;

         if vNPED > 0 then
         begin
           buscas4.Close;
           buscas4.SQL.Text := ' execute procedure movimenta_estoque(:GRUPO_PROD, :COD_PROD, ' + vDadosIni.codEmpresa + ', 0, :QUANTIDADE, 0, 0)';
           buscas4.ParamByName('GRUPO_PROD').AsInteger := vItem.dataSet.FieldByName('GRUPO_PROD').AsInteger;
           buscas4.ParamByName('COD_PROD').AsString := vItem.dataSet.FieldByName('COD_PROD').AsString;
           buscas4.ParamByName('QUANTIDADE').AsFloat := vItem.dataSet.FieldByName('QUANTID_ITEM').AsFloat;
           buscas4.ExecSQL;
         end;

         vItem.dataSet.Next;
      end;
      vItem.Apply;      
      vItem.dataSet.First;

      if Apply then
      begin
        if vNPED > 0 then
        begin
          buscas4.Close;
          buscas4.SQL.Text := ' DELETE FROM PEDVENDA ' +
            ' WHERE NPED = :NPED AND TIPO = :TIPO AND COD_EMPRESA = :COD_EMPRESA ';
          buscas4.ParamByName('NPED').AsInteger := vNPED;
          buscas4.ParamByName('TIPO').AsString := vTipo;
          buscas4.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas4.ExecSQL;
        end;

        if CommitaTransacao then
          vDadosIni.GravaAuditoria('NSD013', 'REABRIR', 'REABERTO NFSD Nº ' +
            dataSet.FieldByName('NUMERONOTA').AsString, 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas);
      end
      else
        RollBackTransacao;
    except
      on e: exception do begin
        Result := false;
        RollBackTransacao;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  finally
    if comandoTexto <> '' then
      montaSelect(comandoTexto);
  end;
end;

procedure TNfSerieD.restaurar;
begin
  if not vDadosIni.PesqPros('NSD004', 'RESTAURAR', 'RESTAURAR NFSD Nº ' +
    dataSet.FieldByName('numeronota').AsString + ' DA LIXEIRA', 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas, true) then
    Exit;

  if dataSet.IsEmpty then
    exit;
  if dataSet.FieldByName('ATIVO').asinteger = 1 then
    exit;
  if dataSet.FieldByName('ATIVO').asinteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
      'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      dataSet.Edit;
      dataSet.FieldByName('ATIVO').asinteger := 1;
      dataSet.Post;
      if Apply then
        if emTransacao then
          if CommitaTransacao then
            vDadosIni.GravaAuditoria('NSD004' , 'RESTAURAR', 'RESTAURADO NFSD Nº ' +
              dataSet.FieldByName('numeronota').AsString + ' DA LIXEIRA', 'NF_SERIE_D', dataSet.FieldByName('numeronota').AsString, buscas);
    end;
  end;
end;

function TNfSerieD.sairdaLixeira: boolean;
begin
  result := montaSelect(comandoTexto);
end;

function TNfSerieD.vendaFechada: boolean;
begin
  Result := dataSet.FieldByName('status').AsString = 'FECHADA';
  //teste
end;

procedure TNfSerieD.voltarEstoquePedVenda;
var
  AQuery: TIBQuery;
begin
  AQuery := TIBQuery.Create(Application);
  try
    AQuery.Database := buscas.Database;
    AQuery.Transaction := buscas.Transaction;

    vItem.dataSet.First;
    while not vItem.dataSet.Eof do
    begin
       if vItem.dataSet.FieldByName('NPED').AsInteger > 0 then
       begin
         AQuery.Close;
         AQuery.SQL.Text := ' execute procedure movimenta_estoque(:GRUPO_PROD, :COD_PROD, ' + vDadosIni.codEmpresa + ', 0, :QUANTIDADE, 0, 0)';
         AQuery.ParamByName('GRUPO_PROD').AsInteger := vItem.dataSet.FieldByName('GRUPO_PROD').AsInteger;
         AQuery.ParamByName('COD_PROD').AsString := vItem.dataSet.FieldByName('COD_PROD').AsString;
         AQuery.ParamByName('QUANTIDADE').AsFloat := vItem.dataSet.FieldByName('QUANTID_ITEM').AsFloat;
         AQuery.ExecSQL;
       end;
       vItem.dataSet.Next;
    end;
  finally
    FreeAndNil(AQuery);
  end;
end;

end.
