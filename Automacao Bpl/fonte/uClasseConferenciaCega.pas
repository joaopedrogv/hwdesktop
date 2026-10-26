unit uClasseConferenciaCega;

interface

uses
	uDataSet_OOP, uCadConferenciaCega, uDtmConferenciaCega, Forms, Controls, DBClient,
  uDtmAtivo, IBDatabase, IBQuery, ComCtrls, DB, ExtCtrls, DBGrids, uPadrao, Dialogs, uImportXmlNf, Classes;

type
  TOrdenacao = (cNitem, cGrupo, cDescricao);
  TTipoConferencia = (cNFENT, cPEDC, cCARGA, cPEDV);
  TTipoRelatorio = (cDivergencias, cGuiaCega);
  TStatus = (cIniciado, cFinalizado);
  TFuncao = (cGerente, cConferente);  
	TConferenciaCega = class;
  TConferenciaCegaItens = class;
  TConferenciaCegaItensNF = class;
  TProdutoConsulta = class;
  TCodBarraConsulta = class;
  TCodigoFornecedor = class;

  TConferenciaCega = class(TDataSet_OOP)
  private
  	FCodCarga: integer;
    FTipo: string;
    FCodEmpresa: string;
    FQuantInserido: integer;
    FQuantNaoInserido: integer;

    destructor destroy; override;
  public
    function edit(pProcesso: string; pCodConferencia: integer = 0): Boolean;
    function post: Boolean; override;
		function delete: Boolean;

  	constructor create;

    function abreForm(pCaption: string; pPanelConteudo: TPanel; pTabSheetParent: TTabSheet; pOnCloseQuery: boolean = False): boolean;
		procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cadConferenciaCega(pTipoForm: integer);
    function abreCargaVenda(pCodCarga: integer): boolean;
    function abreVendasSeparacao(pTipo: string): Boolean;
    function selTodasCargaVenda: boolean;
    function desSelTodasCargaVenda: boolean;
    function selMarcadoCargaVenda(pRecNo: integer): boolean;
    function abreConfCega(pCodConferencia: integer = 0; pProcesso: string = ''): boolean;
    function pesquisa(pCampo, pCondicao, pValor, pData1, pData2: string): Boolean;
    function inserirCabecalho(pCodEmpresa, pTipoConferencia, pNumDoc: string): boolean;
    function inserirEmLote: boolean;
    function existeConferencia(pNumDoc, pTipoConferencia, pCodEmpresa: string; var pCodConferencia: integer): boolean;
    function existeVenda(pNumDoc: string): boolean;
    function exiteCarga(pCodCarga, pCodEmpresa: string): boolean;
    function existeNF(pCodNF: string): boolean;
    function existePedidoDeCompra(pCodPedido: string): boolean;
    function alteraStatusContagemAtual(pCodConferencia: integer): boolean;
    function contagemAtualFechada(pCodConferencia: integer): boolean;
    function fecharConferenciaCega(pCodConferencia: integer): boolean;
    function conferenciaFechada(pCodConferencia: integer): boolean;
    function reabrirConferenciaCega(pCodConferencia: integer): boolean;
    function imprimirRelatorio(pTipoRelatorio: TTipoRelatorio): boolean;
    procedure situacaoPedido(pNumDoc: integer; pTipoConferencia: TTipoConferencia; pStatus: TStatus; pExcluir: Boolean = False);
    function retornaTipoConferencia: TTipoConferencia;
    function confirmaVenda: Boolean;
    function utilizaMobile: Boolean;
    function gerenteAutorizou(pNPED: integer): Boolean;
    function financeiroAutorizou(pNPED: Integer): Boolean;
    function pedidoFechado(pNPED: integer): Boolean;
    function removerStatusConferindo: Boolean;
    procedure executaMetodo(pPacote, pClasse, pMetodo: string);
    //Obs sobre o executaMetodo: A Classe a ser passada por parametro precisa herdar de TPersistent
    //ao fim da unit onde a classe se encontra colocar:
    //initialization
    //  RegisterClass(TNomeDaClasse);
    //finalization
    //  UnRegisterClass(TNomeDaClasse);
    //colocar no uses a seguinte unit: ShareMem;
    function inserirCabecalhoNFENT: Boolean;
    function retornaLoteNFENT: Integer;
    function inserirPreNota(pLote: integer): Boolean;
    function updatePreNota(pListaCodNF: TStringList; pLote: integer): Boolean;
    function updateNotaFiscalExistente(pCodNF: Integer): Boolean;
    function adicionarNotaFiscalExistente: Boolean;
    function abreLoteNF(pLote: Integer): Boolean;
    procedure abreFormLoteNF(pLote: integer);
    function montarConferenciaCega(pLote: Integer): Boolean;
    function jaPossuiItens: Boolean;
    function removerNotaFiscal: Boolean;
    function apagarLote: Boolean;

    property CodCarga: integer read FCodCarga write FCodCarga;
    property Tipo: string read FTipo write FTipo;
    property CodEmpresa: string read FCodEmpresa write FCodEmpresa;
    property QuantInserido: integer read FQuantInserido write FQuantInserido;
    property QuantNaoInserido: integer read FQuantNaoInserido write FQuantNaoInserido;
  var
  	vCargaVenda: TClientDataSet;
    vItensConfCega: TConferenciaCegaItens;
    vItensNF: TConferenciaCegaItensNF;
    vConsultaProdutos: TProdutoConsulta;
    vCaption: string;
    pOrdenacao: TOrdenacao;
    vTipo: array of TTipoConferencia;
  end;

  TConferenciaCegaItens = class(TDataSet_OOP)
  private
    function edit: Boolean; override;
  public
  	constructor create;

    function post(pApply: boolean = True): boolean;

    function abreItensConferenciaCega(pCodConferencia: integer;
  pCodEmpresa: string; pDataset: TClientDataSet; pProcesso: string = ''): boolean;
    function verificaContagem(pCodConferencia, pNitem: integer; pFlag: string): boolean;
    function verificaContagemCabecalho(pCodConferencia: integer): string;
    function inserirItens(pTipoConferencia, pCodEmpresa, pNumDoc, pCodConferencia: string): boolean;
    function configuraTags(pFlag: string): boolean;
    function contarItem(pValor: real; pComita: boolean = False; pRollBack: boolean = False; pAutoIncremento: boolean = False): boolean;
    function contarItemCodBarra(pCodBarra: string): boolean;
    function existeDivergencia(pCodConferencia: integer): boolean;
    function recontar(pCodConferencia: integer; pCabecalho: TConferenciaCega; pFiltro, pTerceira: string): boolean;
    function emConferencia(var pNomeUsuario: string): Boolean;
    function nomeUsuario(pCodUsuario: Integer): string;
    function setUsuarioContagem: Boolean;

    function inserirItensNFENT(pLote, pCodConferencia: Integer): Boolean;
  end;

  TConferenciaCegaItensNF = class(TDataSet_OOP)
  private
  	FLoteConferencia: integer;
  public
  	constructor create;

    function post: boolean;
    function edit: boolean;
    function cancel: boolean;

    function abreItensNF(pCodNF: integer): boolean;
    function abreItensLoteNF(pLote: integer): Boolean;
    function todosItensVinculados(pLote: Integer): Boolean;
    function excluirNF(pLote: integer): boolean;
    function AtualizaDadosItem(pGrupoProd: integer; pCodProd: string): boolean;

    property LoteConferencia: integer read FLoteConferencia write FLoteConferencia;
  end;

  TProdutoConsulta = class(TDataSet_OOP)
  private
  	FAbrirTelaEscolha: Boolean;
    FCamposProduto: string;
    FConsultaAdicional: string;

    procedure SetAbrirTelaEscolha(const Value: boolean);
  public
    constructor create;
    destructor destroy; override;

    function buscaProduto(pValorConsulta: string; pShowErro: Boolean = False): Boolean;
    function selecionaProdutosInnerCodBarra(pValorConsulta: string): Boolean;
    function selecionaProdutos(pGrupoProd: Integer; pCodProd: string): Boolean;

    property AbrirTelaEscolha: boolean read FAbrirTelaEscolha write SetAbrirTelaEscolha;
  var
  	vCodBarra: TCodBarraConsulta;
    vCodigoFornecedor: TCodigoFornecedor;
  end;

  TCodBarraConsulta = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaProduto(pCodBarra: string): boolean;
  end;

  TCodigoFornecedor = class(TDataSet_OOP)
  private
  	FCodCliente: integer;
    procedure SetCodCliente(const Value: integer);
  public
  	constructor create;
    destructor destroy; override;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function post: Boolean; override;

    function existeCodigoFornecedor(pNumFabFornecedor: string; pCodFornecedor: integer): boolean;
    function cadastrarCodigoFornecedor(pCodFornecedor, pGrupoProd: integer; pCodProd, pNumFabFornecedor: string): boolean;
    function selecionaCodigoFornecedor(pCodFornecedor, pGrupoProd: integer; pCodProd, pNumFabFornecedor: string): boolean;
    function buscaCodCliente(pCodNF: integer): boolean;

    property CodCliente: integer read FCodCliente write SetCodCliente;
  var
  	vItensNF: TConferenciaCegaItensNF;
  end;

  var
  	vCadConferenciaCega: TConferenciaCega;

implementation

uses
	SysUtils, uDadosIni, Windows, Variants, RDPrint;

{ TConferenciaCega }

function TConferenciaCega.abreCargaVenda(pCodCarga: integer): boolean;
begin
  try
  	vCargaVenda.Close;
    vCargaVenda.CommandText := 'SELECT P.NPED, P.TIPO, P.COD_EMPRESA, P.COD_CLIENTE, C.NOME_CLIENTE, P.COD_VENDEDOR, '+
		'P.COD_COND_PAG, P.DATA_FECH, P.VALOR_TOTAL, P.OBS_PED, P.STATUS_PED, P.TIPV, P.NCUPOM, '+
		'P.NUM_NF, P.SERIE_NF, P.ATIVO, P.COD_CARGA, P.IDMOBILE, P.COD_CONTROLE FROM PEDVENDA P '+
		'INNER JOIN CLIENTES C ON C.COD_CLIENTE = P.COD_CLIENTE AND C.COD_EMPRESA = P.COD_EMPRESA '+
		'WHERE P.COD_CARGA = :COD_CARGA AND P.TIPO = ''REQ'''+
		'AND P.COD_EMPRESA = :COD_EMPRESA AND P.ATIVO = 1 AND COALESCE(P.STATUS_PED, '''') = ''FECHADA''';
    vCargaVenda.Params.ParamByName('COD_CARGA').AsInteger := pCodCarga;
    vCargaVenda.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    vCargaVenda.Open;

    Result := not(vCargaVenda.IsEmpty);
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.abreConfCega(pCodConferencia: integer = 0; pProcesso: string = ''): boolean;
begin
	try
  	Result := True;

  	if pProcesso <> '' then
  	begin
			if not vDadosIni.PesqPros(pProcesso, 'ALTERAR', 'COD_CONFERENCIA ' + dataSet.FieldByName('COD_CONFERENCIA').AsString, 'CONFERENCIA_CEGA', dataSet.FieldByName('COD_CONFERENCIA').AsString, buscas, True) then
      begin
      	Result := False;
      	Exit;
    	end;
  	end;
    
  	if pCodConferencia <> 0 then
    begin
    	montaSelect('select c.*, cl.nome_cliente from conferencia_cega c '+
    	'left join clientes cl on cl.cod_cliente = c.cod_cliente and cl.cod_empresa = c.cod_empresa '+
    	'where c.cod_conferencia = ' + IntToStr(pCodConferencia) + ' and c.cod_empresa = ' + vDadosIni.codEmpresa);
    	vItensConfCega.abreItensConferenciaCega(pCodConferencia, vDadosIni.codEmpresa, dataset, pProcesso)
    end;

    if not Edit(pProcesso) then
    begin
      Result := False;
      Exit;
    end;

    Cancel;

  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.abreForm(pCaption: string; pPanelConteudo: TPanel; pTabSheetParent: TTabSheet; pOnCloseQuery: boolean = False): boolean;
var
	vFormulario: TFrmPadrao;
begin
  try
  	vFormulario := TFrmPadrao.Create(Application);  
    vFormulario.Width := 620;
    vFormulario.Height := 500;
    vFormulario.Position := poScreenCenter;
    vFormulario.Caption := pCaption;
    vCaption := pCaption;
    pPanelConteudo.Parent := vFormulario;
    vFormulario.AutoSize := True;
    vFormulario.AutoScroll := False;
    vFormulario.ShowHint := True;
    vFormulario.BorderStyle := bsSingle;
    vFormulario.KeyPreview := True;
    if pOnCloseQuery then
    	vFormulario.OnCloseQuery := FormCloseQuery;
    Result := (vFormulario.ShowModal = mrOk);
  finally
    pPanelConteudo.Parent := pTabSheetParent;
    FreeAndNil(vFormulario);
  end;
end;

procedure TConferenciaCega.abreFormLoteNF(pLote: integer);
begin
	try
  	if Trim(dataSet.FieldByName('TIPO_CONFERENCIA').AsString) <> 'NFENT' then
			Exit;
          
  	if jaPossuiItens then
    	raise Exception.Create('Conferência cega já possui itens!'); 
      
  	if not vDadosIni.PesqPros('RM019', 'ABRE FORM', '', 'CONFERENCIA_CEGA', '', buscas, True) then
    	Exit;    

    abreLoteNF(pLote);

    vDadosIni.abreForm(Format('Notas Fiscais Selecionadas - Lote %d', [pLote]), frmCadConferenciaCega.pnNotasFiscais, frmCadConferenciaCega.tsNotasFiscais);
  except on E: Exception do
  begin
    registraErro(e.Message);
    Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
  end;
  end;
end;

function TConferenciaCega.abreLoteNF(pLote: Integer): Boolean;
begin
	try
		buscas.Close;
    buscas.SQL.Text := 'SELECT N.COD_NF "Cod. NF", N.NUM_NF "Num NF", N.MODELO_NF "Modelo", N.SERIE "Série", C.RAZAO "Fornecedor", '+
		'N.DATA_LANC "Data Lançamento", N.VALOR_TOTAL "Valor Total", N.STATUS "Status", N.LOTE_CONFERENCIA "Lote Conferência" '+
		'FROM NOTAFISCAL N '+
		'LEFT JOIN CLIENTES C ON C.COD_CLIENTE = N.COD_CLIENTE AND C.COD_EMPRESA = N.COD_EMPRESA '+
		'WHERE N.COD_EMPRESA = :COD_EMPRESA AND N.LOTE_CONFERENCIA = :LOTE_CONFERENCIA '+
    'ORDER BY N.COD_NF';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('LOTE_CONFERENCIA').AsInteger := pLote;
    buscas.Open;

    Result := not(buscas.IsEmpty);
  except on E: Exception do
  begin
    Result := False;
    registraErro(e.Message);
    Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
  end;
  end;
end;

function TConferenciaCega.abreVendasSeparacao(pTipo: string): Boolean;
begin
  try
    vCargaVenda.Close;
    vCargaVenda.CommandText := 'SELECT P.NPED, P.TIPO, P.COD_EMPRESA, P.COD_CLIENTE, C.NOME_CLIENTE, P.COD_VENDEDOR, '+
		'P.COD_COND_PAG, P.DATA_FECH, P.VALOR_TOTAL, P.OBS_PED, P.STATUS_PED, P.TIPV, P.NCUPOM, '+
		'P.NUM_NF, P.SERIE_NF, P.ATIVO, P.COD_CARGA, P.IDMOBILE, P.COD_CONTROLE FROM PEDVENDA P '+
		'INNER JOIN CLIENTES C ON C.COD_CLIENTE = P.COD_CLIENTE AND C.COD_EMPRESA = P.COD_EMPRESA '+
		'WHERE P.STATUS_SEP_CONF = :STATUS_SEP_CONF AND P.TIPO = :TIPO '+
		'AND P.COD_EMPRESA = :COD_EMPRESA AND P.ATIVO = 1 AND COALESCE(P.STATUS_PED, '''') = ''''';
    vCargaVenda.Params.ParamByName('STATUS_SEP_CONF').AsString := 'SEPARADO';
    vCargaVenda.Params.ParamByName('TIPO').AsString := pTipo;
    vCargaVenda.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    vCargaVenda.Open;

    Result := not vCargaVenda.IsEmpty;
  except on E: Exception do
  begin
    Result := False;
    Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
    registraErro(e.Message);
  end;
  end;
end;

function TConferenciaCega.adicionarNotaFiscalExistente: Boolean;
var
	vCodNF: integer;
begin
	try
    Result := False;

  	if not vDadosIni.PesqPros('RM012', 'CONSULTA', '', 'CONFERENCIA_CEGA', '', buscas, False) then
    begin
	    abreLoteNF(dataSet.FieldByName('NUM_DOC').AsInteger);    
      Exit;
    end;

    abreLoteNF(dataSet.FieldByName('NUM_DOC').AsInteger);      

  	vDadosIni.vPesquisa	:= vDadosIni.pesquisaRapida('NOTAFISCAL', ' and natureza_nf = ''E'' and lote_conferencia is null and ((trim(status) = ''Fechada'') or (trim(status) = ''Pre Nota'')) and (emissao_propria = ''N'' or (situacao_nfe = ''Autorizada'' and modelo_nf = ''55'') or modelo_nf <> ''55'') and tipo_nf = ''P''', 'Consulta NF Entrada');

    vCodNF := StrToIntDef(vDadosIni.vPesquisa, 0);

		if vCodNF = 0 then
    	Exit;

    Result := updateNotaFiscalExistente(vCodNF);

    abreLoteNF(dataSet.FieldByName('NUM_DOC').AsInteger);
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.alteraStatusContagemAtual(pCodConferencia: integer): boolean;
begin
	try
  	Result := True;

  	if not vDadosIni.PesqPros('RM011', 'ALTERAR', 'COD_CONFERENCIA ' + IntToStr(pCodConferencia), 'CONFERENCIA_CEGA', IntToStr(pCodConferencia), buscas, True) then
  	begin
      Result := False;
      Exit;
    end;

    if not inherited Edit then
    begin
      Result := False;
      Exit;
    end;

    if vItensConfCega.verificaContagemCabecalho(pCodConferencia) = 'PRIMEIRA' then
    begin
  		dataSet.FieldByName('DATA_FECHAMENTO_PRIMEIRA').AsDateTime := vDadosIni.getDataBanco(buscas);
  		dataSet.FieldByName('DATA_HORA_FECHAMENTO_PRIMEIRA').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
			dataSet.FieldByName('COD_USUARIO_PRIMEIRA').AsInteger := vDadosIni.vCodUsuario;
    end
    else if vItensConfCega.verificaContagemCabecalho(pCodConferencia) = 'SEGUNDA' then
    begin
  		dataSet.FieldByName('DATA_FECHAMENTO_SEGUNDA').AsDateTime := vDadosIni.getDataBanco(buscas);
  		dataSet.FieldByName('DATA_HORA_FECHAMENTO_SEGUNDA').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
			dataSet.FieldByName('COD_USUARIO_SEGUNDA').AsInteger := vDadosIni.vCodUsuario;
    end
    else if vItensConfCega.verificaContagemCabecalho(pCodConferencia) = 'TERCEIRA' then
    begin
  		dataSet.FieldByName('DATA_FECHAMENTO_TERCEIRA').AsDateTime := vDadosIni.getDataBanco(buscas);
  		dataSet.FieldByName('DATA_HORA_FECHAMENTO_TERCEIRA').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
			dataSet.FieldByName('COD_USUARIO_TERCEIRA').AsInteger := vDadosIni.vCodUsuario;      
    end;

  	abreForm('Observação', frmCadConferenciaCega.pnObservacao, frmCadConferenciaCega.tsObservacao);      
  	dataSet.FieldByName('STATUS_CONTAGEM_ATUAL').AsString := 'FECHADA';
    Result := inherited Post;
    Result := Apply;

    if Result then
      CommitaTransacao
    else
      RollBackTransacao;
    Refresh;

  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.apagarLote: Boolean;
begin
	try
    Result := True;

    if Trim(dataSet.FieldByName('TIPO_CONFERENCIA').AsString) <> 'NFENT' then
    	Exit;

    buscas.Close;
    buscas.SQL.Text := 'UPDATE NOTAFISCAL N SET N.LOTE_CONFERENCIA = NULL '+
		'WHERE N.LOTE_CONFERENCIA = :LOTE_CONFERENCIA AND N.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('LOTE_CONFERENCIA').AsInteger := dataSet.FieldByName('NUM_DOC').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ExecSQL;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.removerNotaFiscal: Boolean;
var
  vCodNF, vLote: Integer;
begin
	try
  	Result := False;

    if buscas.IsEmpty then
    	Exit;
      
    vCodNF := buscas.FieldByName('Cod. NF').AsInteger;
    vLote := buscas.FieldByName('Lote Conferência').AsInteger;    

    buscas.Close;
    buscas.SQL.Text := 'UPDATE NOTAFISCAL N SET N.LOTE_CONFERENCIA = NULL '+
		'WHERE N.COD_NF = :COD_NF AND N.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('COD_NF').AsInteger := vCodNF;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ExecSQL;

  	if not CommitaTransacao then
    	RollBackTransacao
    else
    	Result := True;

    abreLoteNF(vLote)
  except on E: Exception do
  	begin
    	Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

procedure TConferenciaCega.cadConferenciaCega(pTipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Conferência Cega');

    if ((vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'N') or (vDadosIni.vEmp.vUsarConferenciaCegaSaida = '')) and
    ((vDadosIni.vEmp.vUsarConferenciaCegaEntrada = 'N') or (vDadosIni.vEmp.vUsarConferenciaCegaEntrada = '')) then
    begin
  		Application.MessageBox(pchar('Empresa não configurada para usar Conferência Cega!'), 'Informação', MB_ICONINFORMATION + MB_OK);
      Exit;
    end;

    if dtmConferenciaCega = nil then
      dtmConferenciaCega := TdtmConferenciaCega.Create(dtmConferenciaCega);
      
    if not vDadosIni.PesqPros('RM001', 'CONSULTA', '', 'CONFERENCIA_CEGA', '', dtmConferenciaCega.qrBuscas, False) then
      Exit;

    vDadosIni.vTipoForm := pTipoForm;

    if frmCadConferenciaCega = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadConferenciaCega, frmCadConferenciaCega);
    end;

    if (pTipoForm > 0) and (not frmCadConferenciaCega.Visible) then
      frmCadConferenciaCega.ShowModal
    else if (not frmCadConferenciaCega.Visible) then
      frmCadConferenciaCega.Show
    else if frmCadConferenciaCega.FormStyle = fsMDIChild then
      frmCadConferenciaCega.Show
    else
      frmCadConferenciaCega.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

function TConferenciaCega.conferenciaFechada(pCodConferencia: integer): boolean;
begin
	try
    Result := True;
    
    buscas.Close;
    buscas.SQL.Text := 'select cod_conferencia from conferencia_cega where status = ''FECHADA'' and cod_conferencia = ' + IntToStr(pCodConferencia) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
    	Result := False;
      
  except on E: Exception do
  	Result := False;
  end;
end;

function TConferenciaCega.confirmaVenda: Boolean;
begin
  try
    try
      Result := False;

      if UpperCase(vDadosIni.vEmp.vConf_Cega_Fechar_venda) <> 'S' then
        Exit;

      if Trim(dataSet.FieldByName('TIPO_CONFERENCIA').AsString) <> 'PEDV' then
      	Exit;

			if not existeVenda(dataSet.FieldByName('NUM_DOC').AsString) then
      	Exit;             

      vDadosIni.vPesquisa := 'REQ|' + dataSet.FieldByName('NUM_DOC').AsString + '|' + dataSet.FieldByName('COD_CONFERENCIA').AsString + '|';
      executaMetodo('pkPedidoVenda.bpl', 'TConfirmaVenda', 'confirmaVenda');

      if not pedidoFechado(dataSet.FieldByName('NUM_DOC').AsInteger) then
      	Application.MessageBox(pchar('A Conferência cega não foi fechada' + #13 + 'problemas no fechamento do pedido!'), 'Atenção', 0 + 64 );

    	Result := True;
    except on E: Exception do
      begin
        Result := False;
        Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
        registraErro(e.Message);
      end;
    end;
  finally
    vDadosIni.vPesquisa := '';
  end;
end;

function TConferenciaCega.contagemAtualFechada(
  pCodConferencia: integer): boolean;
begin
	try
    Result := True;
    
    buscas.Close;
    buscas.SQL.Text := 'select cod_conferencia from conferencia_cega where status_contagem_atual = ''FECHADA'' and cod_conferencia = ' + IntToStr(pCodConferencia) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
    	Result := False;
      
  except on E: Exception do
  	Result := False;
  end;
end;

function TConferenciaCegaItensNF.abreItensLoteNF(pLote: integer): Boolean;
begin
		montaSelect('SELECT NI.* FROM NOTAFISCAL_ITEM NI '+
		'INNER JOIN NOTAFISCAL N ON N.COD_NF = NI.COD_NF AND N.COD_EMPRESA = NI.COD_EMPRESA '+
		'WHERE COALESCE(NI.COD_PROD, '''') = '''''+
		'AND N.LOTE_CONFERENCIA = ' + IntToStr(pLote) +
		'AND NI.COD_EMPRESA = ' + vDadosIni.codEmpresa);
    Result := not(dataSet.IsEmpty);
end;

function TConferenciaCegaItensNF.abreItensNF(pCodNF: integer): boolean;
begin
	Result := montaSelect('select * from notafiscal_item where coalesce(cod_prod, '''') = '''' and cod_nf = ' + IntToStr(pCodNF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

function TConferenciaCegaItens.configuraTags(pFlag: string): boolean;
begin
  try
  	Result := True;
    if pFlag = 'Conferente' then
    begin
    	dataSet.FieldByName('PRIMEIRA_CONTAGEM_DIF').Tag := 1;
    	dataSet.FieldByName('SEGUNDA_CONTAGEM_DIF').Tag := 1;
    	dataSet.FieldByName('TERCEIRA_CONTAGEM_DIF').Tag := 1;
      dataSet.FieldByName('QUANT').Tag := 1;
    end
    else
    begin
    	dataSet.FieldByName('PRIMEIRA_CONTAGEM_DIF').Tag := 0;
    	dataSet.FieldByName('SEGUNDA_CONTAGEM_DIF').Tag := 0;
    	dataSet.FieldByName('TERCEIRA_CONTAGEM_DIF').Tag := 0;       
      dataSet.FieldByName('QUANT').Tag := 0;      
    end;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCegaItens.contarItem(pValor: real; pComita: boolean = False; pRollBack: boolean = False; pAutoIncremento: boolean = False): boolean;
var
	vNomeUsuario: string;
begin
	try
  	Result := True;

		if pComita then
    begin
    	CommitaTransacao;
    	Refresh;
      Exit;
    end;

		if pRollBack then
    begin
    	RollBackTransacao;
      Refresh;
      Exit;
    end;

    if emConferencia(vNomeUsuario) then
			raise Exception.Create('Conferência já está sendo contada pelo usuário: ' + vNomeUsuario)
    else
    	setUsuarioContagem;
      
    if not inherited Edit then
    begin
      Result := False;
      Exit;
    end;

    if verificaContagemCabecalho(dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'PRIMEIRA' then
    begin
    	if pAutoIncremento then
    		dataSet.FieldByName('PRIMEIRA_CONTAGEM').AsFloat := dataSet.FieldByName('PRIMEIRA_CONTAGEM').AsFloat + pValor
      else
      	dataSet.FieldByName('PRIMEIRA_CONTAGEM').AsFloat := pValor;
    end
    else if verificaContagemCabecalho(dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'SEGUNDA' then
    begin
    	if pAutoIncremento then    
    		dataSet.FieldByName('SEGUNDA_CONTAGEM').AsFloat := dataSet.FieldByName('SEGUNDA_CONTAGEM').AsFloat+ pValor
      else
      	dataSet.FieldByName('SEGUNDA_CONTAGEM').AsFloat := pValor;	
    end
    else if verificaContagemCabecalho(dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'TERCEIRA' then
    begin
    	if pAutoIncremento then     
    		dataSet.FieldByName('TERCEIRA_CONTAGEM').AsFloat := dataSet.FieldByName('TERCEIRA_CONTAGEM').AsFloat + pValor
      else
				dataSet.FieldByName('TERCEIRA_CONTAGEM').AsFloat := pValor;
    end;

    Result := Post(False);
    Result := Apply;

  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCegaItens.contarItemCodBarra(pCodBarra: string): boolean;
var
  vNumFab, vQuant, vGrupoProd, vCodProd, vNitem: string;
  vRecNo: integer;
  function buscaNumeroFabricacaoEAN13(pCodBarra: string): boolean;
  begin
    try
      Result := True;
      
      buscas.Close;
      buscas.SQL.Text := 'select nitem, grupo_prod, cod_prod from conferencia_cega_itens where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo = 1 and ((num_fab_fornecedor = ' + QuotedStr(vNumFab) + ') or (ean13 = ' + QuotedStr(vNumFab) + '))';
      buscas.Open;

      if buscas.IsEmpty then
    		raise Exception.Create('Produto não encontrado!');

      vNitem := buscas.FieldByName('NITEM').AsString;

    except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
    end;
  end;
begin
  try
    if not vDadosIni._verificarSinal(pCodBarra, True) then
    begin
      Result := False;
      Exit;
    end;

    vQuant := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1);
    vNumFab := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
    vDadosIni.vPesquisa := '';
    vNitem := '';

    buscas.Close;
    buscas.SQL.Text := 'select grupo_prod, cod_prod from cod_barra where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cod_barra = ' + QuotedStr(vNumFab) + ' and ativo = 1';
    buscas.Open;

    if buscas.IsEmpty then
    	if not buscaNumeroFabricacaoEAN13(pCodBarra) then
      	Exit;

    vGrupoProd := buscas.FieldByName('GRUPO_PROD').AsString;
    vCodProd := buscas.FieldByName('COD_PROD').AsString;

    if vNitem <> '' then
    	dataSet.Filter := 'nitem = ' + vNitem +' and grupo_prod = ' + vGrupoProd + ' and cod_prod = ' + vCodProd
    else
    	dataSet.Filter := 'grupo_prod = ' + vGrupoProd + ' and cod_prod = ' + vCodProd;
    dataSet.Filtered := True;

    if dataSet.IsEmpty then
    begin
    	dataSet.Filtered := False;
    	IndexFieldNames := 'NITEM';
    	raise Exception.Create('Produto não existe na conferência!');
    end;

    vRecNo := dataSet.FieldByName('NITEM').AsInteger;

    Result := contarItem(StrToFloat(vQuant), False, False, True);

    dataSet.Filtered := False;
    IndexFieldNames := 'NITEM';
    FindNearest([vRecNo]);

  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

constructor TConferenciaCega.create;
begin
	dataSet := TClientDataSet(dtmConferenciaCega.cdsConfCegaCabecalho);
  transacao := TIBTransaction(dtmConferenciaCega.transacao);
  buscas := TIBQuery(dtmConferenciaCega.qrBuscas);

  vDadosIni.vInibeMensPesqPros := 'S';
  if vDadosIni.PesqPros('RM016', 'BUSCA', '', 'CONFERENCIA_CEGA', '', buscas, True) then
  	dataSet.FieldByName('NUM_DOC').Tag := 0
  else
  	dataSet.FieldByName('NUM_DOC').Tag := 1;  

  vItensConfCega := TConferenciaCegaItens.create;
  vItensNF := TConferenciaCegaItensNF.create;
	vConsultaProdutos := TProdutoConsulta.create;

  vCargaVenda := TClientDataSet(dtmConferenciaCega.cdsCargaVenda);
  FCodCarga := 0;
  FTipo := 'REQ';
  FCodEmpresa := vDadosIni.codEmpresa;
end;

function TConferenciaCega.delete: Boolean;
var
  Codigo: string;
begin
 try
    Result := False;

    if dataSet.IsEmpty then
      Exit;

    Codigo := dataSet.FieldByName('COD_CONFERENCIA').AsString;

    if not vDadosIni.PesqPros('RM004', 'EXCLUIR', 'COD_CONFERENCIA ' + Codigo, 'CONFERENCIA_CEGA', Codigo, buscas, True) then
      Exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;
    
    situacaoPedido(dataSet.FieldByName('NUM_DOC').AsInteger, retornaTipoConferencia, cIniciado, True);
    situacaoPedido(dataSet.FieldByName('NUM_DOC').AsInteger, retornaTipoConferencia, cFinalizado, True);

    vDadosIni.mudarStatusSeparacao(dataSet.FieldByName('NUM_DOC').AsInteger, 'REQ', cDevolucaoConferencia, buscas);
    
  	apagarLote;
    
    buscas.Close;
    buscas.SQL.Text := 'DELETE FROM CONFERENCIA_CEGA WHERE COD_CONFERENCIA = :COD_CONFERENCIA AND COD_EMPRESA = :COD_EMPRESA';
		buscas.ParamByName('COD_CONFERENCIA').AsInteger := StrToInt(Codigo);
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ExecSQL;

    if CommitaTransacao then
    	vDadosIni.GravaAuditoria('RM004', 'EXCLUIR', 'SUCESSO', 'CONFERENCIA_CEGA', Codigo, buscas)
    else
			vDadosIni.GravaAuditoria('RM004', 'EXCLUIR', 'FALHA', 'CONFERENCIA_CEGA', Codigo, buscas);

    Result := Refresh;
  except on E: Exception do
    begin
    	Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);      
    end;
  end;
end;

function TConferenciaCega.desSelTodasCargaVenda: boolean;
begin
	try
  	Result := True;
  	if vCargaVenda = Nil then
    begin
    	Result := False;
    	Exit;
    end;
    vCargaVenda.First;
    while not vCargaVenda.Eof do
    begin
    	vCargaVenda.Edit;
      vCargaVenda.FieldByName('SEL').AsString := '';
      vCargaVenda.Post;
      vCargaVenda.Next;
    end;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

destructor TConferenciaCega.destroy;
begin
	FreeAndNil(vCargaVenda);
	FreeAndNil(dtmConferenciaCega);
  FreeAndNil(vItensConfCega);
  FreeAndNil(vItensNF);
  FreeAndNil(vConsultaProdutos);
  inherited;
end;

function TConferenciaCega.edit(pProcesso: string; pCodConferencia: integer = 0): Boolean;
begin
	Result := False;

  if dataSet.IsEmpty then
    Exit;

  if inherited edit then
  begin
  	if pCodConferencia = 0 then
  		vItensConfCega.abreItensConferenciaCega(dataSet.FieldByName('COD_CONFERENCIA').AsInteger, vDadosIni.codEmpresa, dataSet, pProcesso)
    else
      vItensConfCega.abreItensConferenciaCega(pCodConferencia, vDadosIni.codEmpresa, dataSet, pProcesso);
    Result := True;
  end;
end;

procedure TConferenciaCega.executaMetodo(pPacote, pClasse, pMetodo: string);
var
  PackageModule: HModule;
  AClass: TPersistentClass;
  Routine: TMethod;
  Exec: TExec;
begin
  try
    PackageModule := LoadPackage(pPacote);
    if PackageModule <> 0 then
    begin
      AClass := GetClass(pClasse);
      if AClass <> nil then
      begin
        Routine.Data := Pointer(AClass);
        Routine.Code := AClass.MethodAddress(pMetodo);
        if not Assigned(Routine.Code) then
          Exit;
        Exec := TExec(Routine);
        Exec;
      end;
      UnloadPackage(PackageModule);
    end;
  except on E: Exception do
  	begin
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.existeConferencia(pNumDoc, pTipoConferencia, pCodEmpresa: string; var pCodConferencia: integer): boolean;
var
	buscas2: TIBQuery;
begin
	try
  	Result := False;

		buscas2 := TIBQuery.Create(Application);
  	buscas2.Database := buscas.Database;
  	buscas2.Transaction := buscas.Transaction;

		buscas2.Close;
  	buscas2.SQL.Text := 'SELECT C.COD_CONFERENCIA FROM CONFERENCIA_CEGA C WHERE '+
		'C.TIPO_CONFERENCIA = :TIPO_CONFERENCIA AND '+
		'C.COD_EMPRESA = :COD_EMPRESA AND NUM_DOC = :NUM_DOC '+
		'AND C.ATIVO = 1';
    buscas2.ParamByName('TIPO_CONFERENCIA').AsString := pTipoConferencia;
    buscas2.ParamByName('COD_EMPRESA').AsString := pCodEmpresa;
    buscas2.ParamByName('NUM_DOC').AsString := pNumDoc;
  	buscas2.Open;

    if buscas2.IsEmpty then
    	Exit;

    pCodConferencia := buscas2.FieldByName('COD_CONFERENCIA').AsInteger;

    Result := True;
  except on E: Exception do
  	Result := False;
  end;
end;

function TConferenciaCega.existeNF(pCodNF: string): boolean;
begin
	try
    Result := True;

    buscas.Close;
    buscas.SQL.Text := 'select cod_nf from notafiscal where cod_nf = ' + pCodNF +
    ' and (upper(trim(status))= ''FECHADA'') and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
    begin
      Result := False;
      Exit;
    end;
  except on E: Exception do
  	Result := False;
  end;
end;

function TConferenciaCega.existePedidoDeCompra(pCodPedido: string): boolean;
begin
	try
    Result := True;

    buscas.Close;
    buscas.SQL.Text := 'select num_ped from pedido where num_ped = ' + pCodPedido +
    ' and (upper(trim(status_ped))= ''EFETIVADO'') and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
    begin
      Result := False;
      Exit;
    end;
  except on E: Exception do
  	Result := False;
  end;
end;

function TConferenciaCega.existeVenda(pNumDoc: string): boolean;
begin
	try
		buscas.Close;
  	buscas.SQL.Text := 'SELECT NPED FROM PEDVENDA WHERE ' +
		'NPED = :NPED AND COD_EMPRESA = :COD_EMPRESA ' +
		'AND TIPO = :TIPO  AND COALESCE(STATUS_PED, '''') = ''''';
    buscas.ParamByName('NPED').AsInteger := StrToIntDef(pNumDoc, 0);
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('TIPO').AsString := 'REQ';
  	buscas.Open;

  	Result := not(buscas.IsEmpty);      
  except on E: Exception do
  	Result := False;
  end;
end;

function TConferenciaCega.exiteCarga(pCodCarga, pCodEmpresa: string): boolean;
var
	buscas2: TIBQuery;
begin
	try
  	Result := True;
    
		buscas2 := TIBQuery.Create(Application);
  	buscas2.Database := buscas.Database;
  	buscas2.Transaction := buscas.Transaction;

		buscas2.Close;
  	buscas2.SQL.Text := 'select cod_carga from carga where '+
  	'cod_empresa = ' + pCodEmpresa + ' and status = ''FECHADA'' and cod_carga = '+
  	pCodCarga;
  	buscas2.Open;

    if buscas2.IsEmpty then
    	Result := False;
      
  except on E: Exception do
  	Result := False;
  end;

end;

function TConferenciaCega.fecharConferenciaCega(pCodConferencia: integer): boolean;
begin
  try
    Result := True;

    if dataSet.IsEmpty then
    begin
      Result := False;
      Exit;
    end;

    if not jaPossuiItens then
    	raise Exception.Create('Conferência cega não possui itens!');                

    if conferenciaFechada(pCodConferencia) then
    begin
    	Application.MessageBox(pchar('Conferência cega já está fechada!'), 'Informação', MB_ICONINFORMATION + MB_OK);
      Result := False;
      Exit;
    end;    

  	if not vDadosIni.PesqPros('RM008', 'ALTERAR', 'COD_CONFERENCIA ' + IntToStr(pCodConferencia), 'CONFERENCIA_CEGA', IntToStr(pCodConferencia), buscas, True) then
  	begin
      Result := False;
      Exit;
    end;

    if not contagemAtualFechada(pCodConferencia) then
    begin
    	Application.MessageBox(pchar('Contagem atual não está Fechada! '+#13+'Não Foi possível Fechar Conferência Cega!'), 'Informação', MB_ICONINFORMATION + MB_OK);
      Result := False;
      Exit;
    end;

    if not vItensConfCega.existeDivergencia(pCodConferencia) then
    begin
      if Application.MessageBox(pchar('Conferência cega com divergência, deseja realmente fecha-la?'), 'Informação', MB_ICONINFORMATION + MB_YESNO + MB_DEFBUTTON2) = mrNO then
      begin
      	Result := False;
      	Exit;
      end;
    end;

    if confirmaVenda then
    begin
    	Refresh;
    	Exit;
    end;    

    if not inherited Edit then
    begin
      Result := False;
      Exit;
    end;

  	abreForm('Observação', frmCadConferenciaCega.pnObservacao, frmCadConferenciaCega.tsObservacao);

  	situacaoPedido(dataSet.FieldByName('NUM_DOC').AsInteger, retornaTipoConferencia, cFinalizado);
    vDadosIni.mudarStatusSeparacao(dataSet.FieldByName('NUM_DOC').AsInteger, 'REQ', cConferido, buscas);

  	dataSet.FieldByName('STATUS').AsString := 'FECHADA';
  	dataSet.FieldByName('DATA_FECHAMENTO').AsDateTime := vDadosIni.getDataBanco(buscas);
  	dataSet.FieldByName('DATA_HORA_FECHAMENTO').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
		dataSet.Post;

  	Result := Apply;

 		if Result then
    begin
  		CommitaTransacao;
      Refresh;
    end
  	else
  		RollBackTransacao;

  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.financeiroAutorizou(pNPED: Integer): Boolean;
begin
	try
    Result := True;

    buscas.Close;
    buscas.SQL.Text := 'SELECT COALESCE(C.USAR_LIBERACAO_FINANCEIRO, ''N'') USAR_LIBERACAO_FINANCEIRO_CL, '+
		'COALESCE(T.USAR_LIBERACAO_FINANCEIRO, ''N'') USAR_LIBERACAO_FINANCEIRO_TV, '+
		'COALESCE(P.AUTORIZADO_FINANCEIRO, ''N'') AUTORIZADO_FINANCEIRO FROM PEDVENDA P '+
		'LEFT JOIN CLIENTES C ON C.COD_CLIENTE = P.COD_CLIENTE AND C.COD_EMPRESA = P.COD_EMPRESA '+
		'LEFT JOIN TIPO_VENDAS T ON T.TIPO = P.TIPO AND T.SIGLA = P.TIPV '+
		'WHERE P.NPED = :NPED '+
		'AND P.TIPO = ''REQ'' AND P.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('NPED').AsInteger := pNPED;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.IsEmpty then
    begin
    	Result := False;
    	Exit;
    end;

    if (UpperCase(buscas.FieldByName('USAR_LIBERACAO_FINANCEIRO_CL').AsString) = 'S') or
    	(UpperCase(buscas.FieldByName('USAR_LIBERACAO_FINANCEIRO_TV').AsString) = 'S') then
      	Result := not(UpperCase(buscas.FieldByName('AUTORIZADO_FINANCEIRO').AsString) <> 'S');
    
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

procedure TConferenciaCega.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if vCaption = 'Vincule os itens para a criação da Conferência Cega!' then
  	if not (vCadConferenciaCega.vItensNF.todosItensVinculados(vItensNF.LoteConferencia)) then
    	CanClose := Application.MessageBox('Você não vinculou todos os itens, se fechar esta tela a conferência cega não será criada, deseja continuar?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes;
end;

function TConferenciaCega.gerenteAutorizou(pNPED: integer): Boolean;
begin
	try
    Result := True;

    if UpperCase(vDadosIni.vEmp.vVnd_AprovacaoGerente) <> 'S' then
    	Exit;
    
    buscas.Close;
    buscas.SQL.Text := 'SELECT COALESCE(T.USAR_LIBERACAO_GERENTE, ''N'') USAR_LIBERACAO_GERENTE, '+
		'COALESCE(P.APROVADA_GERENTE, ''N'') APROVADA_GERENTE FROM PEDVENDA P '+
		'LEFT JOIN TIPO_VENDAS T ON T.TIPO = P.TIPO AND T.SIGLA = P.TIPV '+
		'WHERE P.NPED = :NPED '+
		'AND P.TIPO = ''REQ'''+
		'AND P.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('NPED').AsInteger := pNPED;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.IsEmpty then
    begin
    	Result := False;
    	Exit;
    end;

    if UpperCase(buscas.FieldByName('USAR_LIBERACAO_GERENTE').AsString) = 'S' then
				Result := not(UpperCase(buscas.FieldByName('APROVADA_GERENTE').AsString) <> 'S');
      
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.imprimirRelatorio(pTipoRelatorio: TTipoRelatorio): boolean;
var
  vRel: TRDprint;
  vLinha, vPagina, vColunas, vLinhasRel: Smallint;
  vDataHora: TDateTime;
  vQuantidadeAcumulada: Extended;
  I: Integer;
  vConferente, vTituloRelatorio, vNomeCliente: string;
  buscas2: TIBQuery;

  procedure montarCabecalho;
  begin
  	buscas2 := TIBQuery.Create(Application);
  	buscas2.Database := buscas.Database;
  	buscas2.Transaction := buscas.Transaction;
    
    vLinha := 1;
    vDataHora := vDadosIni.getDataHoraBanco(buscas2);
    Inc(vPagina);
    vRel.Imp(vLinha, 1, vDadosIni.Replicate('-', vColunas));
    Inc(vLinha);

    vRel.Impf(vLinha, 001, vDadosIni.vEmp.vnomeEmpresa, [negrito]);
    vRel.Impf(vLinha, 056, 'CNPJ: ' + vDadosIni.vEmp.vCNPJ, []);
    vRel.Impf(vLinha, 086, 'Insc. Est.: ' + vDadosIni.vEmp.vIE, []);
    vRel.Impf(vLinha, 117, 'Pag: ' + vDadosIni.StrZero(vPagina,4), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, vTituloRelatorio, [negrito]);
    vRel.Impf(vLinha, 054, 'Código: ' + vDadosIni.StrZero(dataSet.FieldByName('COD_CONFERENCIA').AsInteger, 7), []);
    vRel.Impf(vLinha, 078, 'Tipo Conferência..: ' + dataSet.FieldByName('TIPO_CONFERENCIA').AsString, []);
    vRel.Impf(vLinha, 116, FormatDateTime('dd/mm/yyyy', vDataHora), []);
    Inc(vLinha);

		vRel.Impf(vLinha, 001, 'Data Inclusão: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_INCLUSAO').AsDateTime), []);
  	if pTipoRelatorio = cDivergencias then
    begin
    	vRel.Impf(vLinha, 042, 'Status Conferência: ' + dataSet.FieldByName('STATUS').AsString, []);
      if dataSet.FieldByName('DATA_FECHAMENTO').Value <> Null then
    		vRel.Impf(vLinha, 081, 'Data Fechamento: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_FECHAMENTO').AsDateTime), []);
  	end;
    vRel.Impf(vLinha, 118,  FormatDateTime('hh:mm:ss', vDataHora), []);
    Inc(vLinha);

    if pTipoRelatorio = cDivergencias then
    begin
    	vRel.Impf(vLinha, 001, 'Contagem: ' + dataSet.FieldByName('CONTAGEM').AsString, []);
    	vRel.Impf(vLinha, 049, 'Conferente.: ' + vConferente, []);
    	Inc(vLinha);
    end
    else if Trim(dataSet.FieldByName('TIPO_CONFERENCIA').AsString) = 'NFENT' then
    begin
    	vRel.Impf(vLinha, 001, 'Fornecedor: ' + dataSet.FieldByName('COD_CLIENTE').AsString + ' - ' + vNomeCliente, []);
    	Inc(vLinha);
    end;

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    if pTipoRelatorio = cDivergencias then
    	vRel.Imp(vLinha, 1, 'Grupo Codigo         Descricao                                                                  UN     Qt. Contada     Status')
  	else
			vRel.Imp(vLinha, 1, 'Grupo Codigo         Descricao                                                                  UN                Qt. Contada');    	

    Inc(vLinha);
    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

  end;

begin
	Result := True;

  if dataSet.IsEmpty then
  begin
  	Result := False;
    Exit;
  end;
	if pTipoRelatorio = cDivergencias then
  	vTituloRelatorio := 'CONFÊRENCIA CEGA DIVERGENCIAS DE CONTAGEM'
  else
  	vTituloRelatorio := 'GUIA DE CONFERÊNCIA';
  vColunas := 125;
  vLinhasRel := 66;
  vPagina := 0;
  vRel:=TRDprint.Create(Application);
  if not vDadosIni.ModImp(vRel) then
    exit;
  vRel.FonteTamanhoPadrao := S17cpp;
  vRel.TamanhoQteColunas := vColunas;
  vRel.TamanhoQteLinhas := vLinhasRel;
  vRel.CaptionSetup := 'Configurações de Impressão';
  vRel.OpcoesPreview.CaptionPreview := vTituloRelatorio;
  vRel.TitulodoRelatorio := vTituloRelatorio;
  vDadosIni._LimparVarSendEmail;
  vRel.OnSendMail := vDadosini._SendMailRdPrint;
  vRel.OpcoesPreview.Preview := True;
  if not vRel.EstaAberto then
    vRel.Abrir;

  // Definindo valores das variaveis de impressao
  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(dataSet.FieldByName('COD_USUARIO_'+ Trim(dataSet.FieldByName('CONTAGEM').AsString)).AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  vConferente := Trim(buscas.FieldByName('nome_vendedor').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select razao from clientes' +
    ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  vNomeCliente := Trim(buscas.FieldByName('RAZAO').AsString);

  montarCabecalho;

  buscas.close;
  if pTipoRelatorio = cDivergencias then
  begin
  	buscas.SQL.Text := 'select p.grupo_prod, p.cod_prod, c.descr_prod, c.un_produto, '+
		'(CASE trim(cc.contagem) '+
		'when ''PRIMEIRA'' then '+
    '(c.primeira_contagem) '+
		'when ''SEGUNDA'' then '+
    '(c.segunda_contagem) '+
		'when ''TERCEIRA'' then '+
    '(c.terceira_contagem) '+
		'END) as quantidade, '+
		'''DIFERE'' as status '+
		'from produtos p '+
		'inner join conferencia_cega_itens c on c.cod_empresa = p.cod_empresa and '+
    'c.grupo_prod = p.grupo_prod and c.cod_prod = p.cod_prod '+
		'inner join conferencia_cega cc on cc.cod_conferencia = c.cod_conferencia and cc.cod_empresa = c.cod_empresa '+
		'where cc.cod_conferencia = ' + IntToStr(dataSet.FieldByName('COD_CONFERENCIA').AsInteger) + ' and cc.cod_empresa = ' + vDadosIni.codEmpresa +' and '+
		'(CASE trim(cc.contagem) '+
		'when ''PRIMEIRA'' then '+
    '(case coalesce(cc.contar_divergentes, ''N'') '+
    'when ''S'' then '+
        '(c.primeira_contagem_dif) '+
    'when ''N'' then '+
        '(c.primeira_contagem_dif) '+
    'end) '+
		'when ''SEGUNDA'' then '+
    '(case coalesce(cc.contar_divergentes, ''N'') '+
    'when ''S'' then '+
        '(c.primeira_contagem_dif) '+
    'when ''N'' then '+
        '(c.segunda_contagem_dif) '+
    'end) '+
		'when ''TERCEIRA'' then '+
    '(case coalesce(cc.contar_divergentes, ''N'') '+
    'when ''S'' then '+
        '(c.segunda_contagem_dif) '+
    'when ''N'' then '+
        '(c.terceira_contagem_dif) '+
    'end) '+
		'END) <> 0 ';

    if pOrdenacao = cGrupo then
    	buscas.SQL.Text := buscas.SQL.Text + ' order by 1, 3'
    else if pOrdenacao = cDescricao then
    	buscas.SQL.Text := buscas.SQL.Text + ' order by 3'
    else if pOrdenacao = cNitem then
    	buscas.SQL.Text := buscas.SQL.Text + ' order by c.nitem';
  end
  else
  begin
    buscas.SQL.Text := 'select p.grupo_prod, p.cod_prod, c.descr_prod, c.un_produto '+
		'from produtos p '+
		'inner join conferencia_cega_itens c on c.cod_empresa = p.cod_empresa '+
		'and c.grupo_prod = p.grupo_prod and c.cod_prod = p.cod_prod '+
		'where c.cod_conferencia = '+ dataSet.FieldByName('COD_CONFERENCIA').AsString +
    ' and c.cod_empresa = ' + vDadosIni.codEmpresa;

    if pOrdenacao = cGrupo then
    	buscas.SQL.Text := buscas.SQL.Text + ' order by 1, 3'
    else if pOrdenacao = cDescricao then
    	buscas.SQL.Text := buscas.SQL.Text + ' order by 3'
    else if pOrdenacao = cNitem then
    	buscas.SQL.Text := buscas.SQL.Text + ' order by c.nitem';
  end;
  buscas.Open;

  vQuantidadeAcumulada := 0;
  I := 0;

  buscas.First;
  while not buscas.Eof do
  begin
    if (vLinha + 2) >= vLinhasRel then
    begin
    	if pTipoRelatorio = cDivergencias then
      begin
      	Inc(vLinha);
      	vRel.Impf(vLinha, 001, 'Acumulado', []);
      	vRel.Impf(vLinha, 108, vDadosIni.AlnDir(Format('%0.4f', [vQuantidadeAcumulada]), 12), []);
      end;

      vRel.Novapagina;
      montarCabecalho;
    end;

    vRel.Impf(vLinha, 001, buscas.FieldByName('GRUPO_PROD').AsString, []);
    vRel.Impf(vLinha, 007, buscas.FieldByName('COD_PROD').AsString, []);
    vRel.Impf(vLinha, 022, Copy(Trim(buscas.FieldByName('DESCR_PROD').AsString), 1, 75), []);
    vRel.Impf(vLinha, 097, Copy(Trim(buscas.FieldByName('UN_PRODUTO').AsString), 1, 3), []);
    if pTipoRelatorio = cDivergencias then
    begin
    	vRel.Impf(vLinha, 104, vDadosIni.AlnDir(Format('%0.4f', [buscas.FieldByName('QUANTIDADE').AsFloat]), 12), []);
    	vRel.Impf(vLinha, 120, 'DIFERE', []);
    end
    else
			vRel.Impf(vLinha, 115, '___________', []);
    Inc(vLinha);
    Inc(I);

    if pTipoRelatorio = cDivergencias then
    	vQuantidadeAcumulada := vQuantidadeAcumulada + buscas.FieldByName('QUANTIDADE').AsFloat;

    buscas.Next;
  end;

  if pTipoRelatorio = cDivergencias then
  begin
  	Inc(vLinha);
  	vRel.Impf(vLinha, 001, 'Total Quant. Contada: ' + Format('%0.4f', [vQuantidadeAcumulada]), []);
  end;

  Inc(vLinha);
  vRel.Impf(vLinha, 001,   'Total de Itens......: ' + IntToStr(I), []);
  Inc(vLinha);

  vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
  Inc(vLinha);

  vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
  vLinha := vLinha + 2;

  vRel.Impf(vLinha, 097, vdadosini.replicate('-', 26), []);
  Inc(vLinha);
  vRel.Impf(vLinha, 100, 'Assinatura Conferente', [negrito]);
  
  vRel.Fechar;
end;

function TConferenciaCega.inserirCabecalho(pCodEmpresa, pTipoConferencia,
  pNumDoc: string): boolean;
var
  vDataDoc: TDateTime;
  vCodCliente: integer;
  vNumDoc: integer;
begin
	try
  	Result := True;

		if not vDadosIni.PesqPros('RM002', 'INCLUIR', '', 'CONFERENCIA_CEGA', '', buscas, True) then
    	Exit;    

    if not dataSet.Active then
    montaSelect('select c.*, cl.nome_cliente '+
		'from conferencia_cega c '+
		'left join clientes cl on cl.cod_cliente = c.cod_cliente and cl.cod_empresa = c.cod_empresa '+
		'where c.cod_conferencia = 0 and c.cod_empresa = 0');
      
    if pTipoConferencia = 'PEDV' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select cod_cliente, nped, data_ped from pedvenda where cod_empresa = ' + pCodEmpresa +
      	' and tipo = ''REQ'' and nped = ' + pNumDoc;
      buscas.Open;

      if buscas.IsEmpty then
      begin
        Result := False;
        Exit;
      end;

      vDataDoc := buscas.FieldByName('DATA_PED').AsDateTime;
      vCodCliente := buscas.FieldByName('COD_CLIENTE').AsInteger;
    	situacaoPedido(StrToInt(pNumDoc), cPEDV, cIniciado);
      vDadosIni.mudarStatusSeparacao(StrToInt(pNumDoc), 'REQ', cConferencia, buscas);
    end;

    if pTipoConferencia = 'CARGA' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select descricao, cod_carga, data_fechamento from carga where cod_empresa = ' + pCodEmpresa +
      	' and cod_carga = ' + pNumDoc;
      buscas.Open;

      if buscas.IsEmpty then
      begin
        Result := False;
        Exit;
      end;

      vDataDoc := buscas.FieldByName('DATA_FECHAMENTO').AsDateTime;
      vCodCliente := 0;

    	situacaoPedido(StrToInt(pNumDoc), cCARGA, cIniciado);          
    end;

		if pTipoConferencia = 'NFENT' then
    begin
//      buscas.Close;
//      buscas.SQL.Text := 'select cod_cliente, num_nf, data_lanc from notafiscal where cod_empresa = ' + pCodEmpresa +
//      	' and cod_nf = ' + pNumDoc;
//      buscas.Open;

//      if buscas.IsEmpty then
//      begin
//        Result := False;
//        Exit;
//      end;
//
      vDataDoc := Now;
      vCodCliente := 0;
    end;

		if pTipoConferencia = 'PEDC' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select num_ped ,codigo_f, data_env_ped from pedido where cod_empresa = ' + pCodEmpresa +
      	' and num_ped = ' + pNumDoc;
      buscas.Open;

      if buscas.IsEmpty then
      begin
        Result := False;
        Exit;
      end;

      vDataDoc := buscas.FieldByName('DATA_ENV_PED').AsDateTime;
      vCodCliente := buscas.FieldByName('CODIGO_F').AsInteger;
    end;
    
		if inherited insert then
    begin
    	dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    	dataSet.FieldByName('DATA_INCLUSAO').AsDateTime := vDadosIni.getDataBanco(buscas);
    	dataSet.FieldByName('DATA_HORA_INCLUSAO').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
    	dataSet.FieldByName('STATUS').AsString := 'ABERTA';
    	dataSet.FieldByName('COD_USUARIO').AsInteger := vDadosIni.vCodUsuario;
    	dataSet.FieldByName('ATIVO').AsInteger := 1;
    	dataSet.FieldByName('CONTAGEM').AsString := 'PRIMEIRA';
    	dataSet.FieldByName('TIPO_CONFERENCIA').AsString := pTipoConferencia;
      dataSet.FieldByName('NUM_DOC').AsString := pNumDoc;
    	dataSet.FieldByName('DATA_DOC').AsDateTime := Trunc(vDataDoc);
      if vCodCliente <> 0 then
    		dataSet.FieldByName('COD_CLIENTE').AsInteger := vCodCliente;
      dataSet.FieldByName('COD_CONFERENCIA').AsInteger := Gencodigo('CONFERENCIA_CEGA', dtmConferenciaCega.SpIncCodigo,vDadosIni.codEmpresa);
      vNumDoc := dataSet.FieldByName('COD_CONFERENCIA').AsInteger;

      if utilizaMobile then
      	abreForm('Identificação para ' + pTipoConferencia + ': ' + pNumDoc, frmCadConferenciaCega.pnIdentificacao, frmCadConferenciaCega.tsObservacao);

      Result := inherited Post;
      Result := Apply;

      if Result then
      begin
      	if vItensConfCega.inserirItens(pTipoConferencia, pCodEmpresa, pNumDoc, dataSet.FieldByName('COD_CONFERENCIA').AsString) then
    		begin
      		CommitaTransacao;
      		vDadosIni.GravaAuditoria('RM005', 'INSERIR', 'SUCESSO', 'CONFERENCIA_CEGA', dataSet.FieldByName('COD_CONFERENCIA').AsString, buscas);
    		end
    		else
    		begin
      		RollBackTransacao;
      		vDadosIni.GravaAuditoria('RM005', 'INSERIR', 'FALHA', 'CONFERENCIA_CEGA', dataSet.FieldByName('COD_CONFERENCIA').AsString, buscas);
    		end;
        Refresh;
        abreConfCega(vNumDoc);
      end;
    end
    else
    	Result := False;
  except on E: Exception do
  	begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TConferenciaCega.inserirCabecalhoNFENT: Boolean;
var
	vCodConferencia: Integer;
begin
	try
  	Result := False;

  	if not vDadosIni.PesqPros('RM020', 'INSERIR', '', 'CONFERENCIA_CEGA', '', buscas, True) then
    	Exit;    

    if not(dataSet.Active) then
      montaSelect('SELECT C.*, CL.NOME_CLIENTE FROM CONFERENCIA_CEGA C '+
      'LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = C.COD_CLIENTE AND CL.COD_EMPRESA = C.COD_EMPRESA '+
      'WHERE C.COD_CONFERENCIA = 0 AND C.COD_EMPRESA = 0');

    if not inherited insert then
      Exit;

    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('DATA_INCLUSAO').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('DATA_HORA_INCLUSAO').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
    dataSet.FieldByName('STATUS').AsString := 'ABERTA';
    dataSet.FieldByName('COD_USUARIO').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('ATIVO').AsInteger := 1;
    dataSet.FieldByName('CONTAGEM').AsString := 'PRIMEIRA';
    dataSet.FieldByName('TIPO_CONFERENCIA').AsString := 'NFENT';
    dataSet.FieldByName('NUM_DOC').AsInteger := retornaLoteNFENT;
    dataSet.FieldByName('DATA_DOC').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('COD_CONFERENCIA').AsInteger := Gencodigo('CONFERENCIA_CEGA', dtmConferenciaCega.SpIncCodigo,vDadosIni.codEmpresa);
    vCodConferencia := dataSet.FieldByName('COD_CONFERENCIA').AsInteger;
    
    if utilizaMobile then
      abreForm('Identificação para NFENT: ' + dataSet.FieldByName('COD_CONFERENCIA').AsString, frmCadConferenciaCega.pnIdentificacao, frmCadConferenciaCega.tsObservacao);

    inherited Post;

    Result := Apply;

    if Result then
    begin
    	CommitaTransacao;
      vDadosIni.GravaAuditoria('RM005', 'INSERIR', 'SUCESSO', 'CONFERENCIA_CEGA', dataSet.FieldByName('COD_CONFERENCIA').AsString, buscas);
      Refresh;
      abreConfCega(vCodConferencia);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('RM005', 'INSERIR', 'FALHA', 'CONFERENCIA_CEGA', dataSet.FieldByName('COD_CONFERENCIA').AsString, buscas);
    end;
  except on E: Exception do
  	begin
    	Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;  
  end;
end;

function TConferenciaCega.inserirEmLote: boolean;
var
	vCodigo: integer;
begin
	try
  	Result := True;
    
  	FQuantInserido := 0;
    FQuantNaoInserido := 0;
    if vCargaVenda.IsEmpty then
    begin
      Result := False;
      Exit;
    end;
    vCargaVenda.First;
    while not vCargaVenda.Eof do
    begin
      if vCargaVenda.FieldByName('SEL').AsString = 'S' then
      begin
        if not existeConferencia(vCargaVenda.FieldByName('NPED').AsString, 'PEDV', vDadosIni.codEmpresa, vCodigo) then
        begin
      		inserirCabecalho(vDadosIni.codEmpresa, 'PEDV', vCargaVenda.FieldByName('NPED').AsString);
      		FQuantInserido := FQuantInserido + 1;
        end
        else
        	FQuantNaoInserido := FQuantNaoInserido + 1;
      end;
      vCargaVenda.Next;
    end;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.inserirPreNota(pLote: integer): Boolean;
var
	vOpenDialog: TOpenDialog;
	vImportXML: TXmlImport;
  i: integer;
  vListaCodNF: TStringList;
begin
  try
    try
      Result := False;

      vOpenDialog := TOpenDialog.Create(Application);
      vOpenDialog.Options := [ofHideReadOnly,ofAllowMultiSelect,ofEnableSizing];
      vOpenDialog.Filter := 'XML|*.xml';
      
      vImportXML := TXmlImport.create;
      vListaCodNF := TStringList.Create;      

      if not vDadosIni.PesqPros('RM013', 'CONSULTA', '', 'CONFERENCIA_CEGA', '', buscas, False) then
        Exit;

      abreLoteNF(pLote);

      if not vOpenDialog.Execute then
      	Exit;

      for I := 0 to vOpenDialog.Files.Count - 1 do
      begin
      	vImportXML.montarPreNota(vOpenDialog.Files[i], 0, 0);
        vListaCodNF.Add(IntToStr(vImportXML.CodNF));
      end;

      updatePreNota(vListaCodNF, pLote);

      abreLoteNF(pLote);
    except on E: Exception do
      begin
        Result := False;
        Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
        registraErro(e.Message);
      end;
    end;
  finally
    FreeAndNil(vImportXML);
    FreeAndNil(vOpenDialog);
    FreeAndNil(vListaCodNF);
  end;
end;

function TConferenciaCega.jaPossuiItens: Boolean;
begin
	try
    buscas.Close;
    buscas.SQL.Text := 'SELECT C.COD_CONFERENCIA FROM CONFERENCIA_CEGA_ITENS C '+
		'WHERE C.COD_CONFERENCIA = :COD_CONFERENCIA AND C.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('COD_CONFERENCIA').AsInteger := dataSet.FieldByName('COD_CONFERENCIA').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    Result := not(buscas.IsEmpty);
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.montarConferenciaCega(pLote: Integer): Boolean;
begin
	try
  	Result := False;

    vItensNF.LoteConferencia := pLote;

    if vItensNF.abreItensLoteNF(pLote) then
      abreForm('Vincule os itens para a criação da Conferência Cega!', frmCadConferenciaCega.pnItensNF, frmCadConferenciaCega.tsItensNF, True);

		if not(vItensNF.todosItensVinculados(pLote)) then
    begin
			abreLoteNF(pLote);    
    	Exit;
    end;

    Result := vItensConfCega.inserirItensNFENT(pLote, dataSet.FieldByName('COD_CONFERENCIA').AsInteger);

    if Result then
    	TForm(frmCadConferenciaCega.pnNotasFiscais.Parent).ModalResult := mrOk
    else
    	abreLoteNF(pLote);
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.pedidoFechado(pNPED: integer): Boolean;
begin
	try
  	Result := False;

    buscas.Close;
    buscas.SQL.Text := 'SELECT COALESCE(P.STATUS_PED, '''') STATUS_PED FROM PEDVENDA P WHERE P.NPED = :NPED '+
		'AND P.TIPO = ''REQ'' AND P.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('NPED').AsInteger := pNPED;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.IsEmpty then
    	Exit;

    Result := UpperCase(buscas.FieldByName('STATUS_PED').AsString) = 'FECHADA';

  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.pesquisa(pCampo, pCondicao, pValor, pData1,
  pData2: string): Boolean;
var
  vSqlTemp, vTempSql, vTempSqlTipo, vOrdem: string;
  i: integer;
begin
  vSqlTemp := '';

  if pCampo = 'Nome Cliente' then
    vSqlTemp := 'cl.nome_cliente ';
  if vSqlTemp <> '' then
  begin
    if pCondicao = 'Igual' then
      pCondicao := '= '
    else if pCondicao = 'Maior' then
      pCondicao := '> '
    else if pCondicao = 'Maior ou Igual' then
      pCondicao := '>= '
    else if pCondicao = 'Menor' then
      pCondicao := '< '
    else if pCondicao = 'Menor ou Igual' then
      pCondicao := '<= '
    else if pCondicao = 'Diferente' then
      pCondicao := '<> '
    else if (pCondicao = 'Esta contido') then
      pCondicao := 'like'
    else if (pCondicao = 'Começa') then
      pCondicao := 'Começa'
    else
      pCondicao := '= ';

    if pCondicao = 'like' then
      vSqlTemp := vSqlTemp + pCondicao + QuotedStr('%' + pValor + '%')
    else if pCondicao = 'Começa' then
      vSqlTemp := vSqlTemp + 'like' + QuotedStr(pValor + '%')
    else
      vSqlTemp := vSqlTemp + pCondicao + QuotedStr(pValor);
    pValor := '';
  end;

//  vOrdem := copy(dataSet.IndexName, 5, length(dataSet.IndexName));
//  if Trim(vOrdem) = '' then
    vOrdem := dataSet.FieldByName('COD_CONFERENCIA').DisplayName;

		if Length(vTipo) > 0 then
    begin
      vSqlTemp := '';
      for I := 0 to Length(vTipo) - 1 do
      begin
        vTempSql := '';
        case vTipo[i] of
          cNFENT: vTempSql := vTempSql + 'conferencia_cega.tipo_conferencia = ''NFENT''';
          cPEDC: vTempSql := vTempSql + 'conferencia_cega.tipo_conferencia = ''PEDC''';
          cCARGA: vTempSql := vTempSql + 'conferencia_cega.tipo_conferencia = ''CARGA''';
          cPEDV: vTempSql := vTempSql + 'conferencia_cega.tipo_conferencia = ''PEDV''';
        end;
        if Length(vTipo) > 1 then
          vTempSqlTipo := vTempSqlTipo + ' (' + vTempSql + ') or'
        else
          vTempSqlTipo := vTempSqlTipo + ' and ' + vTempSql;
      end;
			if Length(vTipo) > 1 then
        vSqlTemp := vSqlTemp + ' and (' + Copy(vTempSqlTipo, 1, length(vTempSqlTipo) - 2) + ')'
      else
        vSqlTemp := vSqlTemp + vTempSqlTipo;
    end;

    if Copy(vSqlTemp, 1, 4) = ' and' then
      vSqlTemp := Copy(vSqlTemp, 5, length(vSqlTemp));
      
  if pValor <> '*D*A*T*A*' then
  begin
    Result := ConsultaCampos('CONFERENCIA_CEGA', pValor, pCampo, pCondicao, vOrdem, True, vDadosIni.codEmpresa,
			'CONFERENCIA_CEGA.*, CL.NOME_CLIENTE ',
      ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = CONFERENCIA_CEGA.COD_CLIENTE AND '+
      ' CL.COD_EMPRESA = CONFERENCIA_CEGA.COD_EMPRESA ' , vSqlTemp);
  end
  else
    Result := ConsultaCampos('CONFERENCIA_CEGA', pCampo, vOrdem, pData1, pData2, vDadosIni.codEmpresa, 1,
     'CONFERENCIA_CEGA.*, CL.NOME_CLIENTE ',
      ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = CONFERENCIA_CEGA.COD_CLIENTE AND '+
      ' CL.COD_EMPRESA = CONFERENCIA_CEGA.COD_EMPRESA ' , vSqlTemp);
end;

function TConferenciaCega.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('RM005', 'SALVAR', '', 'CONFERENCIA_CEGA', dataSet.FieldByName('COD_CONFERENCIA').AsString, buscas, True) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataSet.State = dsInsert then
      dataSet.FieldByName('COD_CONFERENCIA').AsInteger := Gencodigo('CONFERENCIA_CEGA', dtmConferenciaCega.SpIncCodigo,vDadosIni.codEmpresa);

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('RM005', acao, 'SUCESSO', 'CONFERENCIA_CEGA', dataSet.FieldByName('COD_CONFERENCIA').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('RM005', acao, 'FALHA', 'CONFERENCIA_CEGA', dataSet.FieldByName('COD_CONFERENCIA').AsString, buscas);
    end;

    Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TConferenciaCega.reabrirConferenciaCega(
  pCodConferencia: integer): boolean;
begin
 try
    Result := True;

    if dataSet.IsEmpty then
    begin
      Result := False;
      Exit;
    end;

    if not jaPossuiItens then
    	raise Exception.Create('Conferência cega não possui itens!');        

  	if not vDadosIni.PesqPros('RM010', 'ALTERAR', 'COD_CONFERENCIA ' + IntToStr(pCodConferencia), 'CONFERENCIA_CEGA', IntToStr(pCodConferencia), buscas, True) then
  	begin
      Result := False;
      Exit;
    end;

    if not inherited Edit then
    begin
      Result := False;
      Exit;
    end;

    situacaoPedido(dataSet.FieldByName('NUM_DOC').AsInteger, retornaTipoConferencia, cFinalizado, True);
    vDadosIni.mudarStatusSeparacao(dataSet.FieldByName('NUM_DOC').AsInteger, 'REQ', cConferencia, buscas);
  	dataSet.FieldByName('STATUS').AsString := 'ABERTA';
  	dataSet.FieldByName('DATA_FECHAMENTO').Value := Null;
  	dataSet.FieldByName('DATA_HORA_FECHAMENTO').Value := Null;
		
    Result := inherited Post;
  	Result := Apply;

 		if Result then
    begin
  		CommitaTransacao;
			Refresh;
    end
  	else
  		RollBackTransacao;

  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCega.removerStatusConferindo: Boolean;
begin
	try
		Result := False;

    if UpperCase(dataSet.FieldByName('CONFERINDO').AsString) <> 'S' then
    	Exit;

  	if not vDadosIni.PesqPros('RM017', 'REMOVER', '', 'CONFERENCIA_CEGA', dataSet.FieldByName('COD_CONFERENCIA').AsString, buscas, True) then
    	Exit;

    buscas.Close;
    buscas.SQL.Text := 'UPDATE CONFERENCIA_CEGA C SET C.CONFERINDO = NULL WHERE '+
		'C.COD_CONFERENCIA = :COD_CONFERENCIA '+
		'AND C.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('COD_CONFERENCIA').AsInteger := dataSet.FieldByName('COD_CONFERENCIA').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ExecSQL;

    Result := CommitaTransacao;

    if Result then
    	Refresh
    else
    	RollBackTransacao;
      
  except on E: Exception do
  	begin
    	RollBackTransacao;
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;  
  end;
end;

function TConferenciaCega.retornaLoteNFENT: Integer;
begin
	try
  	Result := 0;
    
		buscas.Close;
    buscas.SQL.Text := 'SELECT I.COD FROM INCREMENTA_CODIGO(:COD_EMPRESA, :TABELA) I';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('TABELA').AsString := 'LOTE_CONFERENCIA';
    buscas.Open;

    if buscas.IsEmpty then
    	Exit;

    Result := buscas.FieldByName('COD').AsInteger;
  except on E: Exception do
  	begin
    	Result := 0;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;  
  end;
end;

function TConferenciaCega.retornaTipoConferencia: TTipoConferencia;
begin
	try
    Result := cNFENT;

    if dataSet.IsEmpty then
    	Exit;

    if Trim(dataSet.FieldByName('TIPO_CONFERENCIA').AsString) = 'NFENT' then
      Result := cNFENT
    else if Trim(dataSet.FieldByName('TIPO_CONFERENCIA').AsString) = 'CARGA' then
      Result := cCARGA
    else if Trim(dataSet.FieldByName('TIPO_CONFERENCIA').AsString) = 'PEDV' then
      Result := cPEDV
    else if Trim(dataSet.FieldByName('TIPO_CONFERENCIA').AsString) = 'PEDC' then
      Result := cPEDC;
      
  except on E: Exception do
  	Result := cNFENT;
  end;
end;

function TConferenciaCega.selMarcadoCargaVenda(pRecNo: integer): boolean;
begin
	try
  	Result := True;
  	if vCargaVenda = Nil then
    begin
    	Result := False;
    	Exit;
    end;
    if vCargaVenda.RecNo = pRecNo then
    begin
    	vCargaVenda.Edit;
      if Trim(vCargaVenda.FieldByName('SEL').AsString) = '' then
      	vCargaVenda.FieldByName('SEL').AsString := 'S'
      else
      	vCargaVenda.FieldByName('SEL').AsString := '';
      vCargaVenda.Post;
    end;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;	
end;

function TConferenciaCega.selTodasCargaVenda: boolean;
begin
	try
  	Result := True;
  	if vCargaVenda = Nil then
    begin
    	Result := False;
    	Exit;
    end;
    vCargaVenda.First;
    while not vCargaVenda.Eof do
    begin
    	vCargaVenda.Edit;
      vCargaVenda.FieldByName('SEL').AsString := 'S';
      vCargaVenda.Post;
      vCargaVenda.Next;
    end;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

procedure TConferenciaCega.situacaoPedido(pNumDoc: integer; pTipoConferencia: TTipoConferencia; pStatus: TStatus; pExcluir: Boolean = False);
var
	vStatus: string;
begin
	try
    case pStatus of
      cIniciado: vStatus := 'Iniciado';
      cFinalizado: vStatus := 'Finalizado';
    end;

  	if pTipoConferencia = cPEDV then
    begin
			vDadosIni.informarSituacaoPedido(pNumDoc, 'REQ', 'EXPEDICAO', vStatus, '', dtmConferenciaCega.qrBuscas2, False, False, pExcluir);
    end
    else if pTipoConferencia = cCarga then
    begin
      buscas.Close;
      buscas.SQL.Text := 'SELECT P.NPED, P.TIPO FROM PEDVENDA P '+
			'WHERE P.COD_CARGA = :COD_CARGA '+
			'AND P.COD_EMPRESA = :COD_EMPRESA '+
			'AND COALESCE(P.STATUS_PED, '''') = ''FECHADA''';
      buscas.ParamByName('COD_CARGA').AsInteger := pNumDoc;
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;

      if buscas.IsEmpty then
      	Exit;

      buscas.First;
      while not buscas.Eof do
      begin
      	vDadosIni.informarSituacaoPedido(buscas.FieldByName('NPED').AsInteger, buscas.FieldByName('TIPO').AsString, 'EXPEDICAO', vStatus, '', dtmConferenciaCega.qrBuscas2, False, False, pExcluir);
        buscas.Next;
      end;
    end;
  except on E: Exception do
  	begin
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;  
  end;
end;

function TConferenciaCega.updateNotaFiscalExistente(pCodNF: Integer): Boolean;
begin
	try
    Result := False;

    buscas.Close;
    buscas.SQL.Text := 'UPDATE NOTAFISCAL N SET N.LOTE_CONFERENCIA = :LOTE_CONFERENCIA '+
		'WHERE N.COD_NF = :COD_NF AND N.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('LOTE_CONFERENCIA').AsInteger := dataSet.FieldByName('NUM_DOC').AsInteger;
    buscas.ParamByName('COD_NF').AsInteger := pCodNF;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ExecSQL;

    if CommitaTransacao then
      Result := True
    else
    	RollBackTransacao;
  except on E: Exception do
    begin
    	Result := False;
    	RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
    end;  
  end;
end;

function TConferenciaCega.updatePreNota(pListaCodNF: TStringList; pLote: integer): Boolean;
var
  i: integer;
  vLote: Integer;
begin
	try
    Result := False;

    for I := 0 to pListaCodNF.Count - 1 do
    begin
      buscas.Close;
      buscas.SQL.Text := 'UPDATE NOTAFISCAL N SET N.LOTE_CONFERENCIA = :LOTE_CONFERENCIA WHERE N.COD_NF = :COD_NF AND N.COD_EMPRESA = :COD_EMPRESA';
      buscas.ParamByName('LOTE_CONFERENCIA').AsInteger := pLote;
      buscas.ParamByName('COD_NF').AsInteger := StrToInt(pListaCodNF[i]);
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ExecSQL;
    end;

    if buscas.RowsAffected < 1 then
    	Exit;

  	if CommitaTransacao then
    	Result := True
    else
    	RollBackTransacao;
  except on E: Exception do
    begin
    	Result := False;
    	RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
    end;
  end;
end;

function TConferenciaCega.utilizaMobile: Boolean;
begin
	try
    buscas.Close;

    buscas.SQL.Text := 'SELECT FIRST 1 M.IDMOBILE FROM MOBILE M WHERE M.COD_EMPRESA = :COD_EMPRESA AND M.ATIVO = 1';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    Result := (not buscas.IsEmpty);
  except on E: Exception do
  	Result := False;
  end;
end;

{ TConferenciaCegaItens }

function TConferenciaCegaItens.abreItensConferenciaCega(pCodConferencia: integer;
  pCodEmpresa: string; pDataset: TClientDataSet; pProcesso: string = ''): boolean;
begin
	try
  	Result := True;
    if ((pDataset.FieldByName('CONTAR_DIVERGENTES').AsString = 'N') or (pDataset.FieldByName('CONTAR_DIVERGENTES').IsNull)) or (pProcesso = 'RM003') then
    begin
  		montaSelect('select co.* from conferencia_cega_itens co '+
			'where co.cod_conferencia = ' + IntToStr(pCodConferencia) + ' and co.cod_empresa = ' + pCodEmpresa + ' and co.ativo = 1');
    end
    else if pDataset.FieldByName('CONTAR_DIVERGENTES').AsString = 'S' then
    begin
        montaSelect('select i.* from conferencia_cega_itens i '+
				'left join conferencia_cega c on c.cod_conferencia = i.cod_conferencia and c.cod_empresa = i.cod_empresa '+
				'where i.cod_conferencia = ' + IntToStr(pCodConferencia) +' and i.cod_empresa = ' + vDadosIni.codEmpresa +' and i.ativo = 1 and '+
				'(case trim(c.contagem) '+
				'when ''PRIMEIRA'' then '+
    		'(i.primeira_contagem_dif) '+
				'when ''SEGUNDA'' then '+
    		'(i.primeira_contagem_dif) '+
				'when ''TERCEIRA'' then '+
        '(i.segunda_contagem_dif) '+
				'end) <> 0');
		end;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

constructor TConferenciaCegaItens.create;
begin
	dataSet := TClientDataSet(dtmConferenciaCega.cdsConfCegaItens);
  transacao := TIBTransaction(dtmConferenciaCega.transacao);
  buscas := TIBQuery(dtmConferenciaCega.qrBuscas);
end;

function TConferenciaCegaItens.edit: Boolean;
begin
	Result := False;

  if dataSet.IsEmpty then
    Exit;

  if inherited edit then
    Result := True;
end;

function TConferenciaCegaItens.emConferencia(var pNomeUsuario: string): Boolean;
begin
	try
    Result := False;

    buscas.Close;
    buscas.SQL.Text := 'SELECT COALESCE((CASE (C.CONTAGEM) WHEN ''PRIMEIRA'' THEN C.COD_USUARIO_PRIMEIRA WHEN ''SEGUNDA'' '+
		'THEN C.COD_USUARIO_SEGUNDA WHEN ''TERCEIRA'' THEN C.COD_USUARIO_TERCEIRA END), 0) COD_USUARIO, '+
		'COALESCE(C.CONFERINDO, ''N'') CONFERINDO '+
		'FROM CONFERENCIA_CEGA C WHERE C.COD_CONFERENCIA = :COD_CONFERENCIA '+
		'AND C.COD_EMPRESA = :COD_EMPRESA '+
		'AND COALESCE(C.STATUS_CONTAGEM_ATUAL, '''') <> ''FECHADA''';
    buscas.ParamByName('COD_CONFERENCIA').AsInteger := dataSet.FieldByName('COD_CONFERENCIA').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
    buscas.Open;

    if buscas.IsEmpty then
    	Exit;

    if (UpperCase(buscas.FieldByName('CONFERINDO').AsString) = 'S') and (buscas.FieldByName('COD_USUARIO').AsInteger > 0) then
      Result := not(buscas.FieldByName('COD_USUARIO').AsInteger = vDadosIni.vCodUsuario);

    pNomeUsuario := nomeUsuario(buscas.FieldByName('COD_USUARIO').AsInteger)

  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end; 
  end;	
end;

function TConferenciaCegaItens.inserirItens(pTipoConferencia,
  pCodEmpresa, pNumDoc, pCodConferencia: string): boolean;
var
	buscas2: TIBQuery;
  count: integer;
begin
	try
  	Result := True;
    count := 1;

  	buscas2 := TIBQuery.Create(Application);
  	buscas2.Database := buscas.Database;
  	buscas2.Transaction := buscas.Transaction;

    if not dataSet.Active then
    montaSelect('select co.* from conferencia_cega_itens co '+
		'where co.cod_conferencia = 0 and co.cod_empresa = 0');

		if Trim(pTipoConferencia) = 'PEDV' then
    begin
      buscas2.Close;
      buscas2.SQL.Text := 'select pp.grupo_prod, pp.cod_prod, pp.descr_prod_ped descr_prod, '+
      'sum(pp.quant_ped_item) quant_ped_item, p.unidade from pedvenda_prod pp '+
			'inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa '+
			'where pp.nped = ' + pNumDoc +' and pp.tipo = ''REQ'' and coalesce(pp.status, '''') <> ''CANCELADO'' and pp.cod_empresa = ' + pCodEmpresa +
      ' group by pp.grupo_prod, pp.cod_prod, pp.descr_prod_ped, p.unidade';
      buscas2.Open;

      if buscas2.IsEmpty then
      begin
        Result := False;
        Exit;
      end;
    end;

		if Trim(pTipoConferencia) = 'CARGA' then
    begin
      buscas2.Close;
      buscas2.SQL.Text := 'select pp.grupo_prod, pp.cod_prod, pp.descr_prod_ped descr_prod, '+
			'sum(pp.quant_ped_item) quant_ped_item, p.unidade from pedvenda_prod pp '+
			'inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa '+
			'inner join pedvenda ped on ped.nped = pp.nped and ped.tipo = pp.tipo and ped.cod_empresa = pp.cod_empresa '+
			'where ped.cod_carga = ' + pNumDoc + ' and coalesce(pp.status, '''') <> ''CANCELADO'' and pp.tipo = ''REQ'' and ped.cod_empresa = ' + pCodEmpresa +
			' group by pp.grupo_prod, pp.cod_prod, pp.descr_prod_ped, p.unidade';
      buscas2.Open;

      if buscas2.IsEmpty then
      begin
        Result := False;
        Exit;
      end;
    end;

		if Trim(pTipoConferencia) = 'NFENT' then
    begin
      buscas2.Close;
      buscas2.SQL.Text := 'SELECT PP.GRUPO_PROD, PP.COD_PROD, PP.DESCRICAO_ITEM DESCR_PROD, '+
			'SUM(PP.QTDEMBREC) QUANT_PED_ITEM, P.UNIDADE, PP.UNIDADE_NF, PP.EAN13, PP.NUM_FAB_FORNECEDOR FROM NOTAFISCAL_ITEM PP '+
			'INNER JOIN NOTAFISCAL N ON N.COD_NF = PP.COD_NF AND N.COD_EMPRESA = PP.COD_EMPRESA '+
			'INNER JOIN PRODUTOS P ON P.GRUPO_PROD = PP.GRUPO_PROD AND P.COD_PROD = PP.COD_PROD AND P.COD_EMPRESA = PP.COD_EMPRESA '+
			'WHERE N.LOTE_CONFERENCIA = :LOTE_CONFERENCIA AND PP.COD_EMPRESA = :COD_EMPRESA '+
			'GROUP BY PP.GRUPO_PROD, PP.COD_PROD, PP.DESCRICAO_ITEM, P.UNIDADE, PP.UNIDADE_NF, PP.EAN13, PP.NUM_FAB_FORNECEDOR';
      buscas2.ParamByName('LOTE_CONFERENCIA').AsInteger := StrToInt(pNumDoc);
      buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      if buscas2.IsEmpty then
      begin
        Result := False;
        Exit;
      end;
    end;

		if Trim(pTipoConferencia) = 'PEDC' then
    begin
      buscas2.Close;
      buscas2.SQL.Text := 'select pp.grupo_prod, pp.cod_prod, p.descr_prod, ' +
			'sum(pp.quant_it_prod) quant_ped_item, p.unidade from item_pedido pp ' +
			'inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa '+
			'where pp.num_ped = ' + pNumDoc + ' and pp.cod_empresa = '+ vDadosIni.codEmpresa +
			' group by pp.grupo_prod, pp.cod_prod, p.descr_prod, p.unidade';
      buscas2.Open;

      if buscas2.IsEmpty then
      begin
        Result := False;
        Exit;
      end;
    end;        

  	buscas2.First;

    while not buscas2.Eof do
    begin
			if inherited insert then
  		begin
    		dataSet.FieldByName('COD_EMPRESA').AsString := pCodEmpresa;
    		dataSet.FieldByName('COD_CONFERENCIA').AsString := pCodConferencia;
      	dataSet.FieldByName('NITEM').AsInteger := count;
      	dataSet.FieldByName('DESCR_PROD').AsString := buscas2.FieldByName('DESCR_PROD').AsString;        
        dataSet.FieldByName('GRUPO_PROD').AsInteger := buscas2.FieldByName('GRUPO_PROD').AsInteger;
        dataSet.FieldByName('COD_PROD').AsString := buscas2.FieldByName('COD_PROD').AsString;
        dataSet.FieldByName('UN_PRODUTO').AsString := buscas2.FieldByName('UNIDADE').AsString;
        if Trim(pTipoConferencia) = 'NFENT' then
        begin
        	dataSet.FieldByName('UN_NF').AsString := buscas2.FieldByName('UNIDADE_NF').AsString;
					dataSet.FieldByName('EAN13').AsString := buscas2.FieldByName('EAN13').AsString;
					dataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString := buscas2.FieldByName('NUM_FAB_FORNECEDOR').AsString;          
        end;
        dataSet.FieldByName('QUANT').AsFloat := buscas2.FieldByName('QUANT_PED_ITEM').AsFloat;
        dataSet.FieldByName('COD_PROD').AsString := buscas2.FieldByName('COD_PROD').AsString;
        dataSet.FieldByName('ATIVO').AsInteger := 1;

				Result := inherited Post;
    		Result := Apply;
        count := count + 1;
        buscas2.Next;
  		end;
    end;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCegaItens.inserirItensNFENT(pLote, pCodConferencia: Integer): Boolean;
begin
	try
    Result := False;

    buscas.Close;
    buscas.SQL.Text := 'SELECT PP.GRUPO_PROD, PP.COD_PROD, PP.DESCRICAO_ITEM DESCR_PROD, '+
    '(CASE WHEN SUM(PP.QTDEMBREC) > 0 THEN SUM(PP.QTDEMBREC) ELSE SUM(PP.QUANTIDADE) END) QUANT_PED_ITEM, P.UNIDADE, PP.UNIDADE_NF, PP.EAN13, PP.NUM_FAB_FORNECEDOR FROM NOTAFISCAL_ITEM PP '+
    'INNER JOIN NOTAFISCAL N ON N.COD_NF = PP.COD_NF AND N.COD_EMPRESA = PP.COD_EMPRESA '+
    'INNER JOIN PRODUTOS P ON P.GRUPO_PROD = PP.GRUPO_PROD AND P.COD_PROD = PP.COD_PROD AND P.COD_EMPRESA = PP.COD_EMPRESA '+
    'WHERE N.LOTE_CONFERENCIA = :LOTE_CONFERENCIA AND PP.COD_EMPRESA = :COD_EMPRESA '+
    'GROUP BY PP.GRUPO_PROD, PP.COD_PROD, PP.DESCRICAO_ITEM, P.UNIDADE, PP.UNIDADE_NF, PP.EAN13, PP.NUM_FAB_FORNECEDOR';
    buscas.ParamByName('LOTE_CONFERENCIA').AsInteger := pLote;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.IsEmpty then
    	Exit;

    if not dataSet.Active then
    	montaSelect('SELECT CO.* FROM CONFERENCIA_CEGA_ITENS CO WHERE CO.COD_CONFERENCIA = 0 AND CO.COD_EMPRESA = 0');

    buscas.First;
    
    while not buscas.Eof do
    begin
      if not inherited Insert then
      	Exit;
        
      dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      dataSet.FieldByName('COD_CONFERENCIA').AsInteger := pCodConferencia;
      dataSet.FieldByName('NITEM').AsInteger := buscas.RecNo;
      dataSet.FieldByName('DESCR_PROD').AsString := buscas.FieldByName('DESCR_PROD').AsString;
      dataSet.FieldByName('GRUPO_PROD').AsInteger := buscas.FieldByName('GRUPO_PROD').AsInteger;
      dataSet.FieldByName('COD_PROD').AsString := buscas.FieldByName('COD_PROD').AsString;
      dataSet.FieldByName('UN_PRODUTO').AsString := buscas.FieldByName('UNIDADE').AsString;
      dataSet.FieldByName('UN_NF').AsString := buscas.FieldByName('UNIDADE_NF').AsString;
      dataSet.FieldByName('EAN13').AsString := buscas.FieldByName('EAN13').AsString;
      dataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString := buscas.FieldByName('NUM_FAB_FORNECEDOR').AsString;
      dataSet.FieldByName('QUANT').AsFloat := buscas.FieldByName('QUANT_PED_ITEM').AsFloat;
      dataSet.FieldByName('COD_PROD').AsString := buscas.FieldByName('COD_PROD').AsString;
      dataSet.FieldByName('ATIVO').AsInteger := 1;

      inherited Post;

      buscas.Next;
    end;

    Result := Apply;

    if Result then
    	CommitaTransacao
    else
    	RollBackTransacao;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
    end;
  end;
end;

function TConferenciaCegaItens.nomeUsuario(pCodUsuario: Integer): string;
begin
	try
    Result := '';

    buscas.Close;
    buscas.SQL.Text := 'SELECT COALESCE(CO.NOME_VENDEDOR, '''') NOME_VENDEDOR '+
		'FROM COLABORADOR CO WHERE CO.COD_VENDEDOR = :COD_VENDEDOR '+
		'AND CO.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('COD_VENDEDOR').AsInteger := pCodUsuario;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);    
    buscas.Open;

    if buscas.IsEmpty then
			Exit;

    Result := buscas.FieldByName('NOME_VENDEDOR').AsString;    
  except on E: Exception do
  	begin
    	Result := '';
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCegaItens.post(pApply: boolean = True): boolean;
var
  acao: string;
begin
  Result := False;

  Try
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    Result := inherited Post;

    if pApply then
    begin
    	Result := Apply;

    	if Result then
      	CommitaTransacao
    	else
      	RollBackTransacao;
    	Refresh;
    end;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TConferenciaCegaItens.recontar(
  pCodConferencia: integer; pCabecalho: TConferenciaCega; pFiltro, pTerceira: string): boolean;
begin
  try
    Result := True;

    if not (pCabecalho.dataSet.State in [dsInsert, dsEdit]) then
      pCabecalho.dataSet.Edit;

    if pTerceira = 'S' then
    begin
    	if verificaContagemCabecalho(dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'SEGUNDA' then
      begin
				if not vDadosIni.PesqPros('RM007', 'ALTERAR', 'COD_CONFERENCIA ' + IntToStr(pCodConferencia), 'CONFERENCIA_CEGA', IntToStr(pCodConferencia), buscas, True) then
      		exit;
    		pCabecalho.dataSet.FieldByName('CONTAGEM').AsString := 'TERCEIRA';
        pCabecalho.dataSet.FieldByName('STATUS_CONTAGEM_ATUAL').AsString := 'ABERTA';
      end
      else
        raise Exception.Create('Não é possivel realizar terceira contagem antes de realizar a segunda!');
    end;

    if verificaContagemCabecalho(dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'PRIMEIRA' then
    begin
    	pCabecalho.dataSet.FieldByName('CONTAGEM').AsString := 'SEGUNDA';
      pCabecalho.dataSet.FieldByName('STATUS_CONTAGEM_ATUAL').AsString := 'ABERTA';
    end;

    pCabecalho.dataSet.Post;
    Result := pCabecalho.Apply;

    if Result then
      CommitaTransacao
    else
      RollBackTransacao;
    pCabecalho.dataSet.Refresh;

    if not (pCabecalho.dataSet.State in [dsInsert, dsEdit]) then
      pCabecalho.dataSet.Edit;    

    if pFiltro = 'Divergentes' then
    begin
//    	montaSelect('select i.*, p.descr_prod from conferencia_cega_itens i '+
//      'left join produtos p on p.grupo_prod = i.grupo_prod and p.cod_prod = i.cod_prod and p.cod_empresa = i.cod_empresa '+
//      'where i.cod_conferencia = ' + IntToStr(pCodConferencia) + ' and i.cod_empresa = ' + vDadosIni.codEmpresa + ' and i.ativo = 1 and (i.primeira_contagem_dif <> 0 and i.segunda_contagem_dif <> 0)');
        montaSelect('select i.* from conferencia_cega_itens i '+
				'left join conferencia_cega c on c.cod_conferencia = i.cod_conferencia and c.cod_empresa = i.cod_empresa '+
				'where i.cod_conferencia = ' + IntToStr(pCodConferencia) +' and i.cod_empresa = ' + vDadosIni.codEmpresa +' and i.ativo = 1 and '+
				'(case trim(c.contagem) '+
				'when ''PRIMEIRA'' then '+
    		'(i.primeira_contagem_dif) '+
				'when ''SEGUNDA'' then '+
    		'(i.primeira_contagem_dif) '+
				'when ''TERCEIRA'' then '+
        '(i.segunda_contagem_dif) '+
				'end) <> 0');

 			pCabecalho.dataSet.FieldByName('CONTAR_DIVERGENTES').AsString := 'S';
    end
    else
    begin
			montaSelect('select co.* from conferencia_cega_itens co '+
			'where co.cod_conferencia = ' + IntToStr(pCodConferencia) + ' and co.cod_empresa = ' + vDadosIni.codEmpresa + ' and co.ativo = 1');

 			pCabecalho.dataSet.FieldByName('CONTAR_DIVERGENTES').AsString := 'N';
    end;

    pCabecalho.dataSet.Post;
    Result := pCabecalho.Apply;

    if Result then
      CommitaTransacao
    else
      RollBackTransacao;
    pCabecalho.dataSet.Refresh;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TConferenciaCegaItens.setUsuarioContagem: Boolean;
var
	vCampo: string;
begin
	try
    if verificaContagemCabecalho(dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'PRIMEIRA' then
    	vCampo := 'COD_USUARIO_PRIMEIRA'
    else if verificaContagemCabecalho(dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'SEGUNDA' then
    	vCampo := 'COD_USUARIO_SEGUNDA'
    else if verificaContagemCabecalho(dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'TERCEIRA' then
    	vCampo := 'COD_USUARIO_TERCEIRA';
        
    buscas.Close;
    buscas.SQL.Text := 'UPDATE CONFERENCIA_CEGA C SET ' + vCampo + ' = :COD_USUARIO '+
		'WHERE C.COD_CONFERENCIA = :COD_CONFERENCIA AND C.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('COD_CONFERENCIA').AsInteger := dataSet.FieldByName('COD_CONFERENCIA').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('COD_USUARIO').AsInteger := vDadosIni.vCodUsuario;
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := 'UPDATE CONFERENCIA_CEGA C SET C.CONFERINDO = ''S'' WHERE C.COD_CONFERENCIA = :COD_CONFERENCIA '+
		'AND C.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('COD_CONFERENCIA').AsInteger := dataSet.FieldByName('COD_CONFERENCIA').AsInteger;
    buscas.ExecSQL;

    Result := CommitaTransacao;

		if not Result then
			RollBackTransacao;
    
  except on E: Exception do
  	begin
    	Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCegaItens.verificaContagem(pCodConferencia, pNitem: integer;
  pFlag: string): boolean;
begin
	try
  	if pFlag = 'PrimeiraContagem' then
    	Result := ExecutaComandosSql('select * from conferencia_cega_itens where cod_conferencia = ' +
      	IntToStr(pCodConferencia) + ' and nitem = ' + IntToStr(pNitem) + 'and cod_empresa = ' + vDadosIni.codEmpresa + ' and primeira_contagem = 0')
    else
    	Result := ExecutaComandosSql('select * from conferencia_cega_itens where cod_conferencia = ' +
      	IntToStr(pCodConferencia) + ' and nitem = ' + IntToStr(pNitem) + 'and cod_empresa = ' + vDadosIni.codEmpresa + ' and segunda_contagem = 0');
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

function TConferenciaCegaItens.verificaContagemCabecalho(
  pCodConferencia: integer): string;
begin
	try
  	Result := retornaValor('select coalesce(contagem, ''PRIMEIRA'') valor from conferencia_cega where cod_conferencia = ' +
    	IntToStr(pCodConferencia) + 'and cod_empresa = ' + vDadosIni.codEmpresa);
  except on E: Exception do
  	Result := '';
  end;
end;

function TConferenciaCegaItens.existeDivergencia(
  pCodConferencia: integer): boolean;
begin
  try
  	Result := True;
    
    buscas.Close;
    buscas.SQL.Text := 'select i.cod_conferencia from conferencia_cega_itens i '+
				'left join conferencia_cega c on c.cod_conferencia = i.cod_conferencia and c.cod_empresa = i.cod_empresa '+
				'where i.cod_conferencia = ' + IntToStr(pCodConferencia) +' and i.cod_empresa = ' + vDadosIni.codEmpresa +' and i.ativo = 1 and '+
				'(case trim(c.contagem) '+
				'when ''PRIMEIRA'' then '+
    		'(i.primeira_contagem_dif) '+
				'when ''SEGUNDA'' then '+
    		'(i.segunda_contagem_dif) '+
				'when ''TERCEIRA'' then '+
        '(i.terceira_contagem_dif) '+
				'end) <> 0';
    buscas.Open;

    if not buscas.IsEmpty then
    begin
      Result := False;
      Exit;
    end;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

{ TConferenciaCegaItensNF }

function TConferenciaCegaItensNF.cancel: boolean;
begin
	try
    Result := True;

    if not(dataSet.State in [dsEdit, dsInsert]) then
    begin
    	Result := False;
      Exit;
    end;

    inherited Cancel;
    
  except on E: Exception do
  	Result := False;
  end;
end;

constructor TConferenciaCegaItensNF.create;
begin
	dataSet := TClientDataSet(dtmConferenciaCega.cdsINf);
  transacao := TIBTransaction(dtmConferenciaCega.transacao);
  buscas := TIBQuery(dtmConferenciaCega.qrBuscas);

  FLoteConferencia := 0;
end;

function TConferenciaCegaItensNF.edit: boolean;
begin
	try
    Result := True;
    
    if dataSet.IsEmpty then
    begin
      Result := False;
      Exit;
    end;
    
    if not inherited edit then
    begin
      Result := False;
      Exit;
    end;

  except on E: Exception do
  	Result := False;
  end;
end;

function TConferenciaCegaItensNF.excluirNF(pLote: integer): boolean;
begin
	try
    buscas.Close;
    buscas.SQL.Text := 'DELETE FROM NOTAFISCAL N WHERE N.LOTE_CONFERENCIA = :LOTE_CONFERENCIA AND N.COD_EMPRESA = :COD_EMPRESA';
  	buscas.ParamByName('LOTE_CONFERENCIA').AsInteger := pLote;
  	buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ExecSQL;

  	Result := CommitaTransacao;

    if not Result then
    	RollBackTransacao;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TConferenciaCegaItensNF.post: boolean;
var
  acao: string;
begin
  try
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := False;;
      Exit;
    end;

    Result := inherited Post;
    Result := Apply;

    if Result then
    	CommitaTransacao
    else
    	RollBackTransacao;
   // dataSet.Refresh;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TConferenciaCegaItensNF.AtualizaDadosItem(pGrupoProd: integer; pCodProd: string): boolean;
begin
	try
    buscas.Close;
    buscas.SQL.Text := 'select p.grupo_prod, p.cod_prod, p.consumo, p.ecf, c.cod_grade from produtos p '+
    'left join cod_barra c on c.grupo_prod = p.grupo_prod and c.cod_prod = p.cod_prod and c.cod_empresa = p.cod_empresa '+
    'where p.grupo_prod = ' + IntToStr(pGrupoProd) + ' and p.cod_prod = ' + QuotedStr(pCodProd) + ' and p.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
    	Exit;

    if not edit then
    	Exit;

    dataSet.FieldByName('CONSUMO').AsString := buscas.FieldByName('CONSUMO').AsString;
    dataSet.FieldByName('ECF').AsString := buscas.FieldByName('ECF').AsString;
    dataSet.FieldByName('COD_GRADE').AsInteger := buscas.FieldByName('COD_GRADE').AsInteger;

    Result := Post;
  except
    Result := False;
  end;
end;

function TConferenciaCegaItensNF.todosItensVinculados(pLote: Integer): Boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'SELECT NI.COD_NF FROM NOTAFISCAL_ITEM NI '+
		'INNER JOIN NOTAFISCAL N ON N.COD_NF = NI.COD_NF AND N.COD_EMPRESA = NI.COD_EMPRESA '+
		'WHERE COALESCE(NI.COD_PROD, '''') = '''' '+
		'AND N.LOTE_CONFERENCIA = :LOTE_CONFERENCIA '+
		'AND NI.COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('LOTE_CONFERENCIA').AsInteger := pLote;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

  	Result := buscas.IsEmpty;
  except on E: Exception do
  	Result := False;
  end;
end;

{ TProdutoConsulta }

function TProdutoConsulta.buscaProduto(pValorConsulta: string;
  pShowErro: Boolean): Boolean;
var
  vNumFab: string;
  vQuant: string;
begin
  pValorConsulta := Trim(pValorConsulta);
  FAbrirTelaEscolha := False;

  try
    if not vDadosIni._verificarSinal(pValorConsulta) then
    begin
      Result := false;
      exit;
    end;

    vQuant := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1);
    vNumFab := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
    vDadosIni.vPesquisa := '';


    if Trim(pValorConsulta) = '' then
      raiseExceptionCreate('Informe o Código do Produto ou aperte F3 para utilizar a pesquisa', '');

    pValorConsulta := vNumFab;

    if vCodBarra.selecionaProduto(pValorConsulta) then
    begin
      if vCodBarra.dataSet.RecordCount > 1 then
      begin
        if not selecionaProdutosInnerCodBarra(pValorConsulta) then
          raiseExceptionCreate('Erro ao efetuar pesquisa de produtos', '');
        FAbrirTelaEscolha := True;
      end
      else
        if not selecionaProdutos(vCodBarra.dataSet.FieldByName('grupo_prod').AsInteger,
          vCodBarra.dataSet.FieldByName('cod_prod').AsString) then
          raiseExceptionCreate('Produto não encontrado com o código informado', '');
    end;
    if vCodBarra.dataSet.IsEmpty then
    begin
      montaSelect('select ' + FCamposProduto + ' from produtos p ' +
      	' where p.descr_prod like ' +  QuotedStr(pValorConsulta + '%') +
        ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa +
        fConsultaAdicional);

      if dataSet.IsEmpty then
        raiseExceptionCreate('Produto não encontrado com o código informado', '');

      if dataSet.RecordCount > 1 then
        FAbrirTelaEscolha := True;
    end;
    IndexFieldNames := 'DESCR_PROD';
    dataSet.First;
    if FAbrirTelaEscolha then
      if vCadConferenciaCega.abreForm('Escolha o produto para vincular', frmCadConferenciaCega.pnEscolhaProdutos, frmCadConferenciaCega.tsEscolhaProduto) then
      begin
        selecionaProdutos(dataSet.FieldByName('grupo_prod').AsInteger,
          dataSet.FieldByName('cod_prod').AsString);
      end
      else
      begin
        Result := False;
        Exit;
      end;

    Result := not dataSet.IsEmpty;

  except
    on e: exception do
    begin
      Result := False;
      if pShowErro then
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

constructor TProdutoConsulta.create;
begin
	dataset := TClientDataSet(dtmConferenciaCega.cdsProd);
  transacao := TIBTransaction(dtmConferenciaCega.transacao);
  Buscas := TIBQuery(dtmConferenciaCega.qrBuscas);

  vCodBarra := TCodBarraConsulta.create;
  vCodigoFornecedor := TCodigoFornecedor.create;

  FCamposProduto := 'p.num_fab_prod, p.descr_prod, p.unidade, p.marca_p, p.nbm, p.cod_prod, p.grupo_prod, p.descr_prod_red, p.est_f';
  FAbrirTelaEscolha := False;
end;

destructor TProdutoConsulta.destroy;
begin
	FreeAndNil(vCodBarra);
  FreeAndNil(vCodigoFornecedor);
  inherited;
end;

function TProdutoConsulta.selecionaProdutos(pGrupoProd: Integer;
  pCodProd: string): Boolean;
begin
	dataSet.Filtered := False;
  montaSelect('select ' + fCamposProduto + ' from produtos p' +
    ' where p.grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and p.cod_prod = ' + QuotedStr(pCodProd) +
    ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa + fConsultaAdicional);
  Result := not dataSet.IsEmpty;
end;

function TProdutoConsulta.selecionaProdutosInnerCodBarra(
  pValorConsulta: string): Boolean;
begin
	dataSet.Filtered := False;
  Result := montaSelect('select ' + fCamposProduto + ' from produtos p' +
    ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
    ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
    ' where cod_barra = ' + QuotedStr(pValorConsulta) +
    ' and cb.ativo = 1 and cb.cod_empresa = ' + vDadosIni.codEmpresa + fConsultaAdicional);
  Result := not dataSet.IsEmpty;
end;

procedure TProdutoConsulta.SetAbrirTelaEscolha(const Value: boolean);
begin
  FAbrirTelaEscolha := Value;
end;

{ TCodBarraConsulta }

constructor TCodBarraConsulta.create;
begin
  dataSet := TClientDataSet(dtmConferenciaCega.cdsCodBarra);
  transacao := TIBTransaction(dtmConferenciaCega.transacao);
  Buscas := TIBQuery(dtmConferenciaCega.qrBuscas);
end;

function TCodBarraConsulta.selecionaProduto(pCodBarra: string): boolean;
begin
  Result := montaSelect('select cb.* from cod_barra cb' +
    ' inner join produtos p on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
    ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
    ' where cod_barra = ' + QuotedStr(pCodBarra) +
    ' and cb.ativo = 1 and cb.cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

{ TCodigoFornecedor }

function TCodigoFornecedor.buscaCodCliente(pCodNF: integer): boolean;
begin
	try
    Result := True;
    buscas.Close;
    buscas.SQL.Text := 'select nf.cod_cliente from notafiscal nf where '+
    'nf.cod_nf = ' + IntToStr(pCodNF) + ' and nf.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
    begin
      Result := False;
      Exit;
    end;

  	FCodCliente := buscas.FieldByName('COD_CLIENTE').AsInteger;

  except on E: Exception do
  	Result := False;
  end;
end;

function TCodigoFornecedor.cadastrarCodigoFornecedor(pCodFornecedor,
  pGrupoProd: integer; pCodProd, pNumFabFornecedor: string): boolean;
begin
	try
    Result := True;
    if existeCodigoFornecedor(pNumFabFornecedor, pCodFornecedor) then
    begin
    	if selecionaCodigoFornecedor(pCodFornecedor, pGrupoProd, pCodProd, pNumFabFornecedor) then
      begin
        if not Edit then
        begin
          Result := False;
          Exit;
        end;
      end;
    end
    else
    begin
    	if not Insert then
    	begin
      	Result := False;
      	Exit;
    	end;
    end;


    dataSet.FieldByName('COD_FORNECEDOR').AsInteger := pCodFornecedor;
    dataSet.FieldByName('GRUPO_PROD').AsInteger := pGrupoProd;
    dataSet.FieldByName('COD_PROD').AsString := pCodProd;
    dataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString := pNumFabFornecedor;

    Result := Post;

    if not Result then
      Exit;

    vItensNF.AtualizaDadosItem(pGrupoProd, pCodProd);

  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
  	end;
  end;
end;

constructor TCodigoFornecedor.create;
begin
  dataSet := TClientDataSet(dtmConferenciaCega.cdsCodigoFornecedor);
  transacao := TIBTransaction(dtmConferenciaCega.transacao);
  Buscas := TIBQuery(dtmConferenciaCega.qrBuscas);

  vItensNF := TConferenciaCegaItensNF.create;
end;

destructor TCodigoFornecedor.destroy;
begin
  FreeAndNil(vItensNF);
  inherited;
end;

function TCodigoFornecedor.edit: Boolean;
begin
	try
		Result := False;

  	if dataSet.IsEmpty then
    	Exit;

  	if inherited edit then
    	Result := True;
  except on E: Exception do
  	Result := False;
  end;
end;

function TCodigoFornecedor.existeCodigoFornecedor(pNumFabFornecedor: string;
  pCodFornecedor: integer): boolean;
begin
	try
    buscas.Close;
    buscas.SQL.Text := 'SELECT CF.NUM_FAB_FORNECEDOR FROM CODIGO_FORNECEDOR_VW CF '+
		'WHERE CF.COD_FORNECEDOR = :COD_FORNECEDOR '+
		'AND CF.COD_EMPRESA = :COD_EMPRESA '+
		'AND CF.NUM_FAB_FORNECEDOR = :NUM_FAB_FORNECEDOR';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('COD_FORNECEDOR').AsInteger := pCodFornecedor;
    buscas.ParamByName('NUM_FAB_FORNECEDOR').AsString := pNumFabFornecedor;
    buscas.Open;

  	Result := not(buscas.IsEmpty);
  except on E: Exception do
    begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
    end;  
  end;
end;

function TCodigoFornecedor.insert: Boolean;
begin
	try
    Result := False;

    if not dataSet.Active then
      montaSelect('select * from codigo_fornecedor_vw cf where cf.cod_fornecedor = 0 '+
      'and cf.grupo_prod = 0 and cf.cod_prod = 0 and cf.cod_empresa = 0');

    if inherited insert then
    begin
      Result := True;
      dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('ATIVO').AsInteger := 1;
      dataSet.FieldByName('DATA_CADASTRO').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('DATA_MODIFICACAO').AsDateTime := vDadosIni.getDataBanco(buscas);
    end;
  except on E: Exception do
  	Result := False;
  end;
end;

function TCodigoFornecedor.post: Boolean;
begin
	try
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := False;
      Exit;
    end;

    //Result := inherited Post;
    //Result := Apply;
    SqlExec(Format('INSERT INTO PRODUTOS_FORN_NFE (cod_fornecedor, grupo_prod, cod_prod, cod_empresa, num_fab_fornecedor, cod_grade)' +
                   ' VALUES (%d, %d, %s, %d, %s, %d)',
                   [dataSet.FieldByName('cod_fornecedor').AsInteger,
                    dataSet.FieldByName('grupo_prod').AsInteger,
                    QuotedStr(dataSet.FieldByName('cod_prod').AsString),
                    dataSet.FieldByName('cod_empresa').AsInteger,
                    QuotedStr(dataSet.FieldByName('num_fab_fornecedor').AsString),
                    dataSet.FieldByName('cod_grade').AsInteger]));
    Result := True;

    if Result then
      CommitaTransacao
    else
      RollBackTransacao;
    Refresh;

  except on E: Exception do
  	Result := False;
  end;
end;

function TCodigoFornecedor.selecionaCodigoFornecedor(pCodFornecedor,
  pGrupoProd: integer; pCodProd, pNumFabFornecedor: string): boolean;
begin
  Result := montaSelect('select cf.* from codigo_fornecedor_vw cf '+
    'where cf.cod_fornecedor = ' + IntToStr(pCodFornecedor) +' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cf.num_fab_fornecedor = ' + pNumFabFornecedor);
  Result := not dataSet.IsEmpty;
end;

procedure TCodigoFornecedor.SetCodCliente(const Value: integer);
begin
  FCodCliente := Value;
end;

end.
