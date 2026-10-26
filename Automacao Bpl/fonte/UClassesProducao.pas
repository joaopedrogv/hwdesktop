unit UClassesProducao;

interface

uses
  uDataSet_OOP, DB, IBQuery, Classes, DBClient, cod_grade_prod_class,
  Contnrs, produtos_pdc_var_class, produtos_pdc_var_it_class;

type
  TProducao = class;
  TProducaoItemAcabado = class;
  TProducaoItemIndice = class;
  TProdutoConsulta = class;
  TCodBarraConsulta  = class;
  TGradesProducao = class;
  TClientesProducao = class;
  TFormulaConsulta = class;
  TPedidoDeCompraConsulta = class;
  TProdVariacao = class;
  TProdVariacaoItens = class;

  TFormulaProducao = class;
  TFormulaProducaoProdutos = class;
  TReceitaFormula = class;

  TProducao = class(TDataset_OOP)
  private
    vTipoItemTemp, vTempString: string;
    fDataSetT: TClientDataSet;
    fListaPedidoCompra: TStringList;
    Fgrades: TGradesProducao;
    FvalidateGradesIndices: TNotifyEvent;
    FTipoFormulaChange: TNotifyEvent;

    procedure Field_TIPO_CONVERSAO_Change(Sender: TField);

    procedure _ajustaNItem;
    procedure _inserirCodProducao(pDtset: TDataSet);
    function _apurarCustoProducao: Boolean;
    function _existeEstoque(pGrupoProd: Integer; pCodProd:string; pQtde: Extended): boolean;
    function _atualizaInformacoesPedidoCompra: Boolean;
    procedure _corrigirMD5Produtos;
    procedure ajustar_seq;
    procedure salvarvariacoes;

  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function _producaoFechada: boolean;
    function _producaoIniciada: boolean;
    function _producaoAberta: boolean;
    function _producaoCancelada: boolean;
    function _salvarItemAcabado: Boolean;
    function _salvarQtdeFinalItemAcabado: Boolean;
    function _salvarItemIndice(pProducao: Boolean = False): Boolean;
    function _apagaItem: Boolean;
    function _existeFormula: Boolean;
    procedure _somarPesoTotalIndice;
    procedure _somarPesoTotalProdutoAcabado;
    function _iniciarProcessoDeProducao: Boolean;
    function _efetuarFechamentoDeProducao: Boolean;
    function _efetuarReaberturaDeProducao: Boolean;
    function _validarPendenciasEmEstoque: Boolean;

    function _abreFormMostrarMateriasPrimasOuInsumos: Boolean;
    function _abreFormEstoque(pHabilitarBotaoContinuar: Boolean): Boolean;
    function _abreFormImportacaoPedidoCompra: Boolean;
    function _abreFormImportacaoPedidoCompraConclusao: Boolean;
    procedure _cadProducao(pTipoForm: Integer);

    procedure _imprimirFichaProducao;
    procedure _imprimirCustoProducao;

    function _efetuarLeituraDeArquivo(pArquivo: TStringList): Boolean;
    function _alterarItemPedidoCompra(pPesquisarPeloCodigoPedido: Boolean = False): Boolean;
    function _montarProducaoAPartirPedidoCompra: Boolean;

    property grades: TGradesProducao read Fgrades write Fgrades;
    property onValidateGradesIndices: TNotifyEvent read FvalidateGradesIndices write FvalidateGradesIndices;
    property onTipoFormulaChange: TNotifyEvent read FTipoFormulaChange write FTipoFormulaChange;
  var
    vItemAcabado: TProducaoItemAcabado;
    vItemIndice: TProducaoItemIndice;
    vClientes: TClientesProducao;
    vFormula: TFormulaConsulta;
    vPedCompra: TPedidoDeCompraConsulta;
  end;

  {Item - Produto acabado do pedido de produção}
  TProducaoItemAcabado = class(TDataSet_OOP)
  private
    Fmax: Integer;
    FOwner: TProducao;
    Fgrade_start: Integer;
  public
    destructor Destroy; override;
    constructor create(Aowner: TProducao);
    function insert(Anitem: Integer = 0): Boolean;
    function edit: Boolean; override;
    function post: Boolean; override;
    function _abreItemAcabado(pCodProducao: Integer): Boolean;
    function _existeProduto(vValorConsulta: string): Boolean;
    function _jaExisteItemNaProducao(pGrupoProd: integer; pCodProd: string; Acod_grade: Integer): Boolean;
    procedure ajustar_seq;
    function validar_grades(AgoFirst: Boolean = True): Boolean;

    property grade_start: Integer read Fgrade_start;
  var

    vProdCons: TProdutoConsulta;

  end;

  {Indice - Itens que compõe o produto acabado}
  TProducaoItemIndice = class(TDataSet_OOP)
  private
    Fmax: Integer;
    FOwner: TProducao;
    Fgrade_start: Integer;
    procedure _dataSetCalcFields(DataSet: TDataSet);
    procedure _ajustaNItem;
  public
    destructor Destroy; override;
    constructor create(Aowner: TProducao);
    function insert: Boolean; override;
    function edit: Boolean; override;
    function Delete: boolean; override;
    function post: Boolean; override;
    function _abreItemIndice(pCodProducao: Integer): Boolean;
    function _filtrarItemIndice(pNItem: Integer; pAplicarFiltro: Boolean = True): Boolean; overload;
    function _filtrarItemIndice(pNItem: Integer; pGrupoProd: integer; pCodProd: string; pAplicarFiltro: Boolean = True): Boolean; overload;
    function _filtrarItemIndice(pGrupoProd: integer; pCodProd: string; pAplicarFiltro: Boolean = True): Boolean; overload;
    function _existeProduto(vValorConsulta: string): Boolean;
    procedure ajustar_seq(Anitem, Aseq: Integer);
    function validar_grades(AgoFirst: Boolean = True): Boolean;
    procedure setGrade(Acod_grade: Integer);


    function max_next: Integer;

  var

    vProdCons: TProdutoConsulta;
    vUltimoProcesso: string;

  end;

  TProdutoConsulta = class(TDataSet_OOP)
  private
    fCamposProduto: string;
    fConsultaAdicional: string;
    function _abreFormEscolhaProdutos: Boolean;
  public
    destructor Destroy; override;
    constructor create;
    function _getTipoItem(pTipoItem: string): string;
    function _buscaProduto(pValorConsulta: string; pShowErro: Boolean = False): Boolean;
    function _selecionaProdutosInnerCodBarra(pValorConsulta: string): Boolean;
    function _selecionaProdutosIndiceTecnico(pGrupoProd : Integer; pCodProd: string; cod_grade: Integer): Boolean;
    function _selecionaProdutos(pGrupoProd : Integer; pCodProd: string; cod_grade: Integer): Boolean;
    function _filtrarProdutosIndiceTecnico(pGrupoProd : Integer; pCodProd: string; cod_grade: Integer): Boolean;
    function getCamposConsultaComGrade: string;

  var
    vCB: TCodBarraConsulta;
  end;

  TCodBarraConsulta = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaProduto(pCodBarra: string): boolean;
  end;

  TGradesProducao = class(TDataSet_OOP)
  private
    FOwner: TProducao;
  public
    constructor create(Aowner: TProducao);
    function getGradesDisponiveis(Agrupo_prod: Integer; Acod_prod: string; Aunion_grade: Integer = -1): TGradesProducao;
  end;

  TClientesProducao = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaCliente(pCodCliente: Integer): Boolean;
    function _existeCliente(pCodCliente: Integer): Boolean;
  end;


  TFormulaConsulta = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaFormula(pCodFormula: Integer): boolean;
    function _selecionaTodasFormulas: boolean;
  end;

  TFormulaProducao = class(TDataset_OOP)
  private
    procedure _inserirCodFormula(pDtset: TDataSet);
    function _verificarQtdes: Boolean;
    function _abreFormTextoAdicional: Boolean;
  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _lixeiraCheia: boolean;
    function _apagarDadosSolvente: boolean;
    function _salvarItemFormula: Boolean;
    function _alterarTextoAdicional: Boolean;

    function _existeSolvente(vValorConsulta: string; Qtde: Double = 100): Boolean;

    procedure _cadFormula(pTipoForm: Integer);

  var
    vItemFormula: TFormulaProducaoProdutos;
    vReceita: TReceitaFormula;
  end;

  TFormulaProducaoProdutos = class(TDataSet_OOP)
  private
    function _filtrarItemFormula(pGrupoProd: integer; pCodProd: string; pAplicarFiltro: Boolean = True): Boolean;
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function post: Boolean; override;
    function delete: Boolean; override;

    function _abreItemFormula(pCodFormula: Integer): Boolean;
    function _existeProduto(vValorConsulta: string): Boolean;
  var
    vProdCons: TProdutoConsulta;
  end;

  TReceitaFormula= class(TDataSet_OOP)
  public
    constructor create;
    function _pesquisaReceita(pValorReceita: string): Boolean;
  end;


  TPedidoDeCompraConsulta = class(TDataSet_OOP)
  private
    fLista:TStringList;
  public
    constructor create;
    procedure _marcaDesmarcaLinha;
    function _pesquisaPedCompra(pNped: Integer; pDataIni, pDataFim: string; pTodasEmpresas: Boolean = False): boolean;
    function _montaPedidoCompra: Boolean;
    function _getLista:TStringList;

  end;

  TEstoqueProds = class(TCod_grade_prod_classList)
  public
    function getEstoque(Agrupo_prod: Integer; Acod_prod: string; Acod_grade: Integer): TCod_grade_prod_class;
  end;

  TProdVariacaoItens = class(TProdutos_pdc_var_it_classList)
  public
    function getVariacaoItem(grupo_prod: Integer; cod_prod: string): TProdutos_pdc_var_it_class;  overload;
    function getVariacaoItem(grupo_prod: Integer; cod_prod: string; cod_grade: Integer): TProdutos_pdc_var_it_class;  overload;
  end;

  TProdutos_pdc_var = class(TProdutos_pdc_var_class)
  private
    Fitens: TProdVariacaoItens;
  public
    constructor Create;
    destructor Destroy; override;

    property itens: TProdVariacaoItens read Fitens write Fitens;
  end;

  TProdutos_pdc_var_List = class(TObjectList)
  private
    function GetItem(Index: Integer): TProdutos_pdc_var;
    procedure SetItem(Index: Integer; const Value: TProdutos_pdc_var);
  public
    function New: TProdutos_pdc_var;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;
    function getVariacao(grupo_prod: Integer; cod_prod: string; cod_grade: Integer): TProdutos_pdc_var;

    property Items[Index: Integer]: TProdutos_pdc_var read GetItem write SetItem;
  end;

  TProdVariacao = class(TProdutos_pdc_var_List)
  private
    Fdatas:TDataSet_OOP;
    FVariacoesMake: TNotifyEvent;
    Fcurrent: TProdutos_pdc_var;
  public
    constructor Create;
    destructor Destroy; override;

    function makeVariacoes(grupo_prod: Integer; cod_prod: string; cod_grade: Integer): TProdVariacao;
    function getVariacaoDB(grupo_prod: Integer; cod_prod: string; cod_grade: Integer): TProdutos_pdc_var;
    function SaveCurrent: Boolean;

    property onVariacoesMake: TNotifyEvent read FVariacoesMake write FVariacoesMake;
    property current: TProdutos_pdc_var read Fcurrent write Fcurrent;
  end;

var
  cadProducao: TProducao;
  cadFormulaProducao: TFormulaProducao;

implementation

uses uDadosIni, uPadrao, UDtmProducao, IBDatabase, Forms, Windows, uDtmAtivo,
  SysUtils, uCadFormulaProd, RDprint, Controls, Variants, Math, StrUtils, UCadProducao,
  hw_progress_utils;

{ TProducao }

procedure TProducao.ajustar_seq;
begin
  vItemAcabado.ajustar_seq;
end;

constructor TProducao.create;
begin
  if dtmProducao = nil then
    dtmProducao := TdtmProducao.Create(dtmProducao);
  DataSet := TClientDataSet(dtmProducao.cdsProducao);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);

  vItemAcabado := TProducaoItemAcabado.create(Self);
  vItemIndice := TProducaoItemIndice.create(Self);
  vClientes := TClientesProducao.create;
  vFormula := TFormulaConsulta.create;
  vPedCompra := TPedidoDeCompraConsulta.create;
  Fgrades := TGradesProducao.create(Self);


  fListaPedidoCompra:= TStringList.Create;

  if vDadosIni.vEmp.vUsarProducao = 'S' then
  begin
    dataSet.FieldByName('descricao').DisplayLabel := 'Produção';
  end
  else
  begin
    dataSet.FieldByName('descricao').DisplayLabel := 'Observação';
  end;
  dataSet.FieldByName('TIPO_CONVERSAO').OnChange := Field_TIPO_CONVERSAO_Change; 

  if vDadosIni.vEmp.vUsarClienteNaProducao = 'S' then
  begin
    dataSet.FieldByName('cod_cliente').Tag := 1;
    dataSet.FieldByName('nome_cliente').Tag := 1;
    dataSet.FieldByName('razao').Tag := 1;
  end;
//a  montaSelect('SELECT PRODUCAO.*,CLIENTES.NOME_CLIENTE,CLIENTES.RAZAO'
//a    + ' FROM PRODUCAO LEFT JOIN CLIENTES ON PRODUCAO.COD_CLIENTE = CLIENTES.COD_CLIENTE '
//a    + ' WHERE COD_PRODUCAO=-30');

  dataSet.Tag := 0;

end;

function TProducao.Delete: boolean;
var
  codProducao: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  if _producaoFechada then
  begin
    Application.MessageBox('Pedido de Produção fechado! Não permitido excluir!', 'Atenção', 0 + 64);
    Exit;
  end;

  codProducao := IntToStr(dataSet.FieldByName('COD_PRODUCAO').AsInteger);

  try

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
//      result := inherited Delete;

      buscas.Close;
      buscas.SQL.Text := ' delete from producao where cod_producao = ' + codProducao +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

//      Result :=

//      if Result then
//        result := Apply;
//      if result then
        result := CommitaTransacao;
      if Result then
      begin
        vDadosIni.GravaAuditoria('PPR004', 'EXCLUIR', 'SUCESSO', 'PRODUCAO', codProducao, buscas);
        dataSet.Refresh;

        buscas.Close;
        buscas.SQL.Text := 'update pedido set num_producao = null' +
          ', cod_empresa_producao = null' +
          ', status_producao = null'+
          ' where num_producao = '+ codProducao+
          ' and cod_empresa_producao = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;
        CommitaTransacao;
      end
      else
      begin
        RollBackTransacao;
        vDadosIni.GravaAuditoria('PPR004', 'EXCLUIR', 'FALHA', 'PRODUCAO', codProducao, buscas);
      end;
    end;

  except on E: Exception do
  begin
    Result := False;
    RollBackTransacao;
    Application.MessageBox(pchar('Erro: '+ E.Message), 'Atenção', 0 + 64);
    registraErro(e.Message);
  end;
  end;

end;

destructor TProducao.Destroy;
begin
  vItemAcabado.Free;
  vItemAcabado := nil;

  vItemIndice.Free;
  vItemIndice := nil;

  vClientes.Free;
  vClientes := nil;

  vFormula.free;
  vFormula := nil;

  vPedCompra.Free;
  vPedCompra := nil;


  fListaPedidoCompra.Free;
  fListaPedidoCompra := nil;

  if Assigned(Fgrades) then
    FreeAndNil(Fgrades);

  inherited;
end;

function TProducao.edit: boolean;
begin
  fListaPedidoCompra.Clear;
  if inherited Edit then
  begin
    Result := True;
    if dataSet.FieldByName('geracao_aut').IsNull then
	    dataSet.FieldByName('geracao_aut').AsString := 'N';
    vItemAcabado._abreItemAcabado(dataSet.FieldByName('cod_producao').AsInteger);
    vItemIndice._abreItemIndice(dataSet.FieldByName('cod_producao').AsInteger);
    vClientes._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger);
    vFormula._selecionaFormula(dataSet.FieldByName('cod_formula').AsInteger);
    if _producaoFechada then
      dataSet.Cancel;
  end;
end;

procedure TProducao.Field_TIPO_CONVERSAO_Change(Sender: TField);
begin
  if Assigned(FTipoFormulaChange) then
    FTipoFormulaChange(Self);
end;

function TProducao.Insert: boolean;
begin
  fListaPedidoCompra.Clear;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_producao').AsInteger := 0;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('DATA').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('STATUS').AsString := 'ABERTO';
    dataSet.FieldByName('UNIDADE').AsString := 'KG';
    dataSet.FieldByName('DESCRICAO').AsString := 'PRODUCAO ' +
      FormatDateTime('DD/MM/AAAA',dataSet.FieldByName('DATA').AsDateTime);
    dataSet.FieldByName('cod_empresa').AsString :=  vDadosIni.codEmpresa;
    dataSet.FieldByName('geracao_aut').AsString := 'N';
    vItemAcabado._abreItemAcabado(dataSet.FieldByName('cod_producao').AsInteger);
    vItemIndice._abreItemIndice(dataSet.FieldByName('cod_producao').AsInteger);
    vClientes._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger);
    vFormula._selecionaTodasFormulas;
  end;
end;

function TProducao.post: boolean;
var
  acao: string;
  codigo: integer;
  vAno: string;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('PPR005', 'SALVAR', '', 'PRODUCAO',
      dataSet.FieldByName('COD_PRODUCAO').AsString, buscas, true) then
      Exit;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    try

      if vDadosIni.vEmp.vUsarProducao = 'D' then
      begin
        if dataSet.FieldByName('cod_formula').AsInteger <= 0 then
          raiseExceptionCreate('O objeto principal da Produção não foi informado', 'DBEdit18');

        buscas.Close;
        buscas.SQL.Text := 'select cod_formula from formula_producao' +
          ' where cod_formula = ' + IntToStr(dataSet.FieldByName('cod_formula').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if buscas.IsEmpty then
          raiseExceptionCreate('O objeto principal da Produção informado não foi encontrado no cadastro de Fórmulas', 'DBEdit18');

      end;

      if not vItemAcabado.validar_grades then
        raiseExceptionCreate('Item acabando %d - %s - %s sem grade informada ou inválida. Informe a grade para continuar',
                             [vItemAcabado.fint('seq'), vItemAcabado.fstr('num_fab_prod'), vItemAcabado.fstr('descr_prod')]);

      if not vItemIndice.validar_grades then
        raiseExceptionCreate('Matéria Prima / Insumo %d - %s - %s sem grade informada ou inválida. Informe a grade para continuar',
                             [vItemIndice.fint('seq'), vItemIndice.fstr('num_fab_prod'), vItemIndice.fstr('descr_prod')]);

      if not _validarPendenciasEmEstoque then
        if not _abreFormEstoque(vDadosIni.vEstoqueNegativo = 'S') then
          raiseExceptionCreate('Itens sem Estoque', '');

      if acao = 'INSERIR' then
      begin
        dataSet.FieldByName('COD_PRODUCAO').AsInteger :=
            Gencodigo('PRODUCAO', dtmProducao.SpIncCodigo, vDadosIni.codEmpresa);
        _inserirCodProducao(vItemAcabado.dataSet);
        _inserirCodProducao(vItemIndice.dataSet);
      end;

      vAno := copy(FormatDateTime( 'dd/mm/yyyy',  vDadosIni.getDataBanco(buscas)),7,4);
      if Trim(dataSet.FieldByName('nlote').AsString) = '' then
        dataSet.FieldByName('nlote').AsString := vDadosIni.StrZero(Gencodigo('PRODUCAO'+vAno, dtmProducao.SpIncCodigo, vDadosIni.codEmpresa),4) +
          '/' + copy(vAno, 3, 2);
    
      Result := inherited post;

      if (DataSet.ChangeCount = 0) then
        Result := True
      else
        Result := Apply;

      if result then
        if (vItemAcabado.DataSet.ChangeCount > 0) then
          result := vItemAcabado.Apply;

      if result then
        if (vItemIndice.DataSet.ChangeCount > 0) then
          result := vItemIndice.Apply;

      if result then
        result := CommitaTransacao;

      if Result then
      begin
        vDadosIni.GravaAuditoria('PPR005', acao, 'STATUS ' + Trim(dataSet.FieldByName('STATUS').AsString) + ' SUCESSO', 'PRODUCAO',
          dataSet.FieldByName('COD_PRODUCAO').AsString, buscas);
        _atualizaInformacoesPedidoCompra;
      end
      else
        vDadosIni.GravaAuditoria('PPR005', acao, 'STATUS ' + Trim(dataSet.FieldByName('STATUS').AsString) + ' FALHA', 'PRODUCAO',
          dataSet.FieldByName('COD_PRODUCAO').AsString, buscas);

      if Result then
        Refresh;

    finally
      ProgressUtil.Terminate;
    end;
  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TProducao.salvarvariacoes;
var
  Avariacao: TProdVariacao;
  Avar_item: TProdutos_pdc_var_it_class;
  Avar_itens: TProdVariacaoItens;
  Achange: Boolean;
  I: Integer;
begin
  Avariacao := TProdVariacao.Create;
  Avar_itens := TProdVariacaoItens.Create;
  vItemAcabado.prepare_loop();
  try
    while not vItemAcabado.dataSet.Eof do
    begin

      with vItemAcabado do
        Avariacao.current := Avariacao.getVariacaoDB(fint('grupo_prod'), fstr('cod_prod'), fint('cod_grade'));

      Achange := (Avariacao.current.cod_prod = '') or
                 (Avariacao.current.descricao <> vItemAcabado.fstr('descr_prod'));
      with Avariacao.current do
      begin
        grupo_prod  := vItemAcabado.fint('grupo_prod');
        cod_prod    := vItemAcabado.fstr('cod_prod');
        cod_grade   := vItemAcabado.fint('cod_grade');
        descricao   := vItemAcabado.fstr('descr_prod');
      end;

      vItemIndice.prepare_loop(Format('nitem = %d and cod_grade <> 0', [vItemAcabado.fint('nitem')]));
      try
        while not vItemIndice.dataSet.Eof do
        begin
          Avar_item := Avariacao.current.itens.getVariacaoItem(vItemIndice.fint('grupo_prod'), vItemIndice.fstr('cod_prod'));
          if (not Assigned(Avar_item)) then
            Avar_item := TProdutos_pdc_var_it_class.Create;

          if (Avar_item.cod_prod = '') or
             (Avar_item.descricao <> vItemIndice.fstr('descr_prod')) or
             (Avar_item.cod_grade <> vItemIndice.fint('cod_grade')) then
          begin
            Achange := True;
            with Avar_item do
            begin
              grupo_prod := cadProducao.vItemIndice.fint('grupo_prod');
              cod_prod   := cadProducao.vItemIndice.fstr('cod_prod');
              cod_grade  := cadProducao.vItemIndice.fint('cod_grade');
              descricao  := cadProducao.vItemIndice.fstr('descr_prod');
            end;
            Avar_itens.Add(Avar_item.Clone);
          end;
          vItemIndice.dataSet.Next;
        end;

      finally
        vItemIndice.prepare_loop_done;
      end;
      Avariacao.current.itens.Clear;
      for I := 0 to Pred(Avar_itens.Count) do
        Avariacao.current.itens.Add(Avar_itens.Items[I].Clone);
      Avar_itens.Clear;

      if Achange then
        Avariacao.SaveCurrent;
      
      vItemAcabado.dataSet.Next;
    end;

  finally
    vItemAcabado.prepare_loop_done;
    FreeAndNil(Avariacao);
    FreeAndNil(Avar_itens);
  end;
end;

function TProducao._abreFormEstoque(pHabilitarBotaoContinuar: Boolean): Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Relação de Itens da Produção - Itens em vermelho sem Estoque';
    frmCadProducao.pnEstoque.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmCadProducao.BitBtn22.Enabled := pHabilitarBotaoContinuar;
    result := (formulario.ShowModal = IDOK);
  finally
    frmCadProducao.pnEstoque.Parent := frmCadProducao.tsEstoque;
    formulario.Free;
    formulario := nil;
  end;
end;

function TProducao._abreFormImportacaoPedidoCompra: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Importação de Pedidos de Compra';
    frmCadProducao.pnImportarPedido.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmCadProducao.pnImportarPedido2.Visible := False;
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadProducao.pnImportarPedido.Parent := frmCadProducao.tsImportarPedido;
    formulario.Free;
    formulario := nil;
  end;
end;

function TProducao._abreFormImportacaoPedidoCompraConclusao: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Conferência de Itens do Pedido de Compra';
    frmCadProducao.pnImportarPedido2.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmCadProducao.pnImportarPedido2.Visible := True;
    result := (formulario.ShowModal = IDOK);
    frmCadProducao.pnImportarPedido2.Visible := False;

  finally
    frmCadProducao.pnImportarPedido2.Parent := frmCadProducao.tsImportarPedido;
    formulario.Free;
    formulario := nil;
  end;
end;

function TProducao._abreFormMostrarMateriasPrimasOuInsumos: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Consulta de Matérias Primas / Insumos utilizadas na Produção';
    frmCadProducao.pnConsultaMateriasPrimasInsumos.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmCadProducao.DBGrid2.DataSource := dtmProducao.dsProd;
    result := (formulario.ShowModal = IDOK);
    frmCadProducao.DBGrid2.DataSource := nil;
  finally
    frmCadProducao.pnConsultaMateriasPrimasInsumos.Parent := frmCadProducao.tsCadastroMateriasPrimasInsumos;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TProducao._ajustaNItem;
var
  I: Integer;
begin
  ajustar_seq;
  {
  vItemAcabado.IndexFieldNames := 'NITEM';
  vItemAcabado.dataSet.Last;
  I := vItemAcabado.dataSet.FieldByName('NITEM').AsInteger + 100;

  vItemAcabado.dataSet.First;
  while not vItemAcabado.dataSet.Eof do
  begin
    I := I + 1;

    vItemIndice._filtrarItemIndice(vItemAcabado.dataSet.FieldByName('nitem').AsInteger);
    vItemIndice.dataSet.Next;
    while not vItemIndice.dataSet.IsEmpty do
    begin
      vItemIndice.dataSet.Edit;
      vItemIndice.dataSet.FieldByName('NITEM').AsInteger := I + vItemAcabado.dataSet.RecordCount;
      vItemIndice.dataSet.Post;

      vItemIndice.dataSet.Next;
    end;

    vItemAcabado.dataSet.Edit;
    vItemAcabado.dataSet.FieldByName('NITEM').AsInteger := I + vItemAcabado.dataSet.RecordCount;
    vItemAcabado.dataSet.Post;

    vItemAcabado.dataSet.Next;
  end;

  I := 0;
  vItemAcabado.dataSet.First;
  while not vItemAcabado.dataSet.Eof do
  begin
    I := I + 1;


    vItemIndice._filtrarItemIndice(vItemAcabado.dataSet.FieldByName('nitem').AsInteger);
    vItemIndice.dataSet.Next;
    while not vItemIndice.dataSet.IsEmpty do
    begin
      vItemIndice.dataSet.Edit;
      vItemIndice.dataSet.FieldByName('NITEM').AsInteger := I;
      vItemIndice.dataSet.Post;

      vItemIndice.dataSet.Next;
    end;

    vItemAcabado.dataSet.Edit;
    vItemAcabado.dataSet.FieldByName('NITEM').AsInteger := I;
    vItemAcabado.dataSet.Post;
    vItemAcabado.dataSet.Next;
  end;
  }
end;

function TProducao._alterarItemPedidoCompra(
  pPesquisarPeloCodigoPedido: Boolean): Boolean;
begin
  Result := False;
  fDataSetT := TClientDataSet(dtmProducao.cdsTemp);

  if pPesquisarPeloCodigoPedido then
  begin
    if vItemAcabado.vProdCons._buscaProduto(Trim(fDataSetT.FieldByName('NUM_FAB_FORNECEDOR').AsString), True) then
    begin
      fDataSetT.Edit;
      fDataSetT.FieldByName('grupo_prod').AsInteger := vItemAcabado.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger;
      fDataSetT.FieldByName('cod_prod').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('cod_prod').AsString;
      fDataSetT.FieldByName('num_fab_prod').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('num_fab_prod').AsString;
      fDataSetT.FieldByName('descr_prod').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('descr_prod').AsString;
      fDataSetT.FieldByName('cod_grade').AsInteger := vItemAcabado.vProdCons.dataSet.FieldByName('cod_grade').AsInteger;
      fDataSetT.Post;
    end;
  end
  else
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if Trim(vDadosIni.vPesquisa) <> '' then
    begin
      if vItemAcabado.vProdCons._buscaProduto(Trim(vDadosIni.vPesquisa), True) then
      begin
        fDataSetT.Edit;
        fDataSetT.FieldByName('grupo_prod').AsInteger := vItemAcabado.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger;
        fDataSetT.FieldByName('cod_prod').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('cod_prod').AsString;
        fDataSetT.FieldByName('num_fab_prod').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('num_fab_prod').AsString;
        fDataSetT.FieldByName('descr_prod').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('descr_prod').AsString;
        fDataSetT.FieldByName('cod_grade').AsInteger := vItemAcabado.vProdCons.dataSet.FieldByName('cod_grade').AsInteger;
        fDataSetT.Post;
      end;
    end;
  end;

end;

function TProducao._apagaItem: Boolean;
begin

  Result := False;
  if vItemAcabado.dataSet.IsEmpty then
    exit;

  if Application.MessageBox('Excluir item do Pedido de Produção?', 'Atenção',
      MB_ICONINFORMATION + MB_YESNO) <> IDYES then
    Exit;

  vItemIndice._filtrarItemIndice(vItemAcabado.dataSet.FieldByName('nitem').AsInteger);
  while not vItemIndice.dataSet.IsEmpty do
    vItemIndice.dataSet.Delete;

  if vItemAcabado.Delete then
  begin
    _ajustaNItem;
    _somarPesoTotalProdutoAcabado;
    Result := True;
  end;
end;

function TProducao._apurarCustoProducao: Boolean;
var
  vValorParaRateio, vPesoParaRateio, vValorCusto: Extended;
begin
  ProgressUtil.Msg('Calculando custo');

  Result := False;
  vValorParaRateio := 0;
  vPesoParaRateio := 0;
  vItemAcabado._abreItemAcabado(dataSet.FieldByName('cod_producao').AsInteger);
  vItemIndice._abreItemIndice(dataSet.FieldByName('cod_producao').AsInteger);

  // Efetuando a soma das materias primas de indice 0 da producao detalhada para rateio
  vItemIndice._filtrarItemIndice(0);
  vItemIndice.dataSet.First;
  while not vItemIndice.dataSet.Eof do
  begin
    if vItemIndice.dataSet.FieldByName('solvente').AsString <> 'S' then
    begin
      vValorParaRateio := vValorParaRateio + (vItemIndice.dataSet.FieldByName('prec_cusm_prod').AsFloat * vItemIndice.dataSet.FieldByName('QUANTIDADE_UTILIZADA').AsFloat);
      vValorParaRateio := vValorParaRateio + (vItemIndice.dataSet.FieldByName('prec_cusm_prod').AsFloat * vItemIndice.dataSet.FieldByName('QUANTIDADE_PERDA').AsFloat);
      vPesoParaRateio := vPesoParaRateio + vItemIndice.dataSet.FieldByName('PESO_UTIL').AsFloat;
      vPesoParaRateio := vPesoParaRateio + (vItemIndice.dataSet.FieldByName('PESO_UN').AsFloat * vItemIndice.dataSet.FieldByName('QUANTIDADE_PERDA').AsFloat);
    end;
    vItemIndice.dataSet.Next;
  end;

  ProgressUtil.MaxProgress(vItemAcabado.dataSet.RecordCount);
  // Efetuando o calculo do custo para o produto acabado
  vItemAcabado.dataSet.First;
  while not vItemAcabado.dataSet.Eof do
  begin
    ProgressUtil.IncProgress;
    vItemIndice._filtrarItemIndice(vItemAcabado.dataSet.FieldByName('nitem').AsInteger);
    vValorCusto := 0;
    vItemIndice.dataSet.First;
    while not vItemIndice.dataSet.Eof do
    begin
      vValorCusto := vValorCusto + (vItemIndice.dataSet.FieldByName('prec_cusm_prod').AsFloat * vItemIndice.dataSet.FieldByName('QUANTIDADE_UTILIZADA').AsFloat);
      vValorCusto := vValorCusto + (vItemIndice.dataSet.FieldByName('prec_cusm_prod').AsFloat * vItemIndice.dataSet.FieldByName('QUANTIDADE_PERDA').AsFloat);

      vItemIndice.dataSet.Next;
    end;

    vItemAcabado.dataSet.Edit;
    vItemAcabado.dataSet.FieldByName('custo_indice').AsFloat := vValorCusto;
    vValorCusto := 0;

    if (vValorParaRateio > 0) and (dataSet.FieldByName('quantidadeproduzida').AsFloat > 0) then
      vValorCusto := (vItemAcabado.dataSet.FieldByName('peso_util').AsFloat / dataSet.FieldByName('quantidadeproduzida').AsFloat) *
        vValorParaRateio;
    vItemAcabado.dataSet.FieldByName('custo_rateio').AsFloat := vValorCusto;
    vItemAcabado.dataSet.FieldByName('prec_cus_prod').AsFloat :=
      (vItemAcabado.dataSet.FieldByName('custo_indice').AsFloat + vItemAcabado.dataSet.FieldByName('custo_rateio').AsFloat) /
      vItemAcabado.dataSet.FieldByName('quantidade').AsFloat;
    vItemAcabado.dataSet.Post;

    vItemAcabado.dataSet.Next;
  end;

  Result := True;

end;

function TProducao._atualizaInformacoesPedidoCompra: Boolean;
var
  I: Integer;
begin
  if fListaPedidoCompra.Count > 0 then
  begin
    for I := 0 to fListaPedidoCompra.Count - 1 do
    begin
      buscas.Close;
      buscas.SQL.Text := 'update pedido set num_producao = ' + IntToStr(dataSet.FieldByName('cod_producao').AsInteger)+
        ', cod_empresa_producao = ' + vDadosIni.codEmpresa+
        ', status_producao = '+QuotedStr(dataSet.FieldByName('status').AsString)+
        ' where num_ped = '+ vDadosIni.getCampoPipe(fListaPedidoCompra[I],2) +
        ' and cod_empresa = ' + vDadosIni.getCampoPipe(fListaPedidoCompra[I],1);
      buscas.ExecSQL;
    end;
  end
  else
  begin
    buscas.Close;
    buscas.SQL.Text := 'update pedido set status_producao = '+QuotedStr(dataSet.FieldByName('status').AsString)+
      ' where num_producao = '+ IntToStr(dataSet.FieldByName('cod_producao').AsInteger)+
      ' and cod_empresa_producao = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;
  end;
  CommitaTransacao;
  fListaPedidoCompra.Clear;
end;

procedure TProducao._cadProducao(pTipoForm: Integer);
begin
  
  vDadosIni.abreStatusProcessamento('','Abrindo Produção de Produtos');
  if dtmProducao = nil then
    dtmProducao := TdtmProducao.Create(dtmProducao);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('PPR029', 'CONSULTA', '', 'PRODUCAO', '',
    dtmProducao.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadProducao = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadProducao, frmCadProducao);
  end;
  
  if (pTipoForm > 0) and (not frmCadProducao.Visible) then
    frmCadProducao.ShowModal
  else if (not frmCadProducao.Visible) then
    frmCadProducao.Show
  else if frmCadProducao.FormStyle = fsMDIChild then
    frmCadProducao.Show
  else
    frmCadProducao.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TProducao._corrigirMD5Produtos;
var
  item: TDataSet_OOP;
begin
  item := TDataSet_OOP.Create(buscas.Database, transacao);
  try
    item.ClientOpen('select distinct grupo_prod, cod_prod from producao_item' +
                    ' where cod_producao = %d and cod_empresa = %d' +
                    ' union' +
                    ' select distinct grupo_prod, cod_prod from producao_item_indice' +
                    ' where cod_producao = %d and cod_empresa = %d',
                    [fint('cod_producao'), vDadosIni.cod_empresa, fint('cod_producao'), vDadosIni.cod_empresa]).Last;
    item.prepare_loop();
    ProgressUtil.MaxProgress(item.dataSet.RecordCount);
    while not item.dataSet.Eof do
    begin
      ProgressUtil.IncProgress;
      vMD5Func._gravaMD5_Produtos(buscas, item.fint('grupo_prod'), item.fstr('cod_prod'));
      item.dataSet.Next
    end;
  finally
    item.Free;
  end;
  {
  vItemAcabado.dataSet.First;
  while not vItemAcabado.dataSet.Eof do
  begin
    vMD5Func._gravaMD5_Produtos(buscas, vItemAcabado.dataSet.FieldByName('grupo_prod').AsInteger,
      vItemAcabado.dataSet.FieldByName('cod_prod').AsString);
    vItemAcabado.dataSet.Next;
  end;

  vItemIndice.dataSet.First;
  while not vItemIndice.dataSet.Eof do
  begin
    vMD5Func._gravaMD5_Produtos(buscas, vItemIndice.dataSet.FieldByName('grupo_prod').AsInteger,
      vItemIndice.dataSet.FieldByName('cod_prod').AsString);
    vItemIndice.dataSet.Next;
  end;
  }
end;

function TProducao._efetuarFechamentoDeProducao: Boolean;
var
  vCustoMedio: Extended;
  item: TDataSet_OOP;
begin

  Result := False;

  if not vDadosIni.PesqPros('PPR034', 'ALTERAR', '', 'PRODUCAO',
    dataSet.FieldByName('COD_PRODUCAO').AsString, buscas, true) then
    exit;

  try

    ProgressUtil.InitProgress(ProgressOpt.Create('Fechando produção', '').WithSteps(5));
    try

      if _producaoFechada then
        raiseExceptionCreate('Pedido de Produção já foi FECHADO', '');

      if not _producaoIniciada then
        raiseExceptionCreate('Pedido de Produção ainda não foi INICIADO', '');

      vItemAcabado._abreItemAcabado(dataSet.FieldByName('cod_producao').AsInteger);
      vItemIndice._abreItemIndice(dataSet.FieldByName('cod_producao').AsInteger);

      ProgressUtil.IncStep();

      if not _validarPendenciasEmEstoque then
        if not _abreFormEstoque(vDadosIni.vEstoqueNegativo = 'S') then
          raiseExceptionCreate('Itens sem Estoque', '');

      ProgressUtil.Msg('Calculando custo das mercadorias');
      ProgressUtil.IncStep();

      if not _apurarCustoProducao then
        raiseExceptionCreate('Erro ao efetuar apuração de custo do Pedido de Produção', '');

      vClientes._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger);
      vFormula._selecionaFormula(dataSet.FieldByName('cod_formula').AsInteger);

      ProgressUtil.Msg('Baixando estoque Matéria-prima/Insumo/etc');
      ProgressUtil.IncStep();

      // Baixa de estoque das matérias primas utilizadas na produção
      {
      vItemIndice.dataSet.Filtered := False;
      vItemIndice.dataSet.First;
      while not vItemIndice.dataSet.Eof do
      begin
        //movimenta_estoque(pgrupo_prod, pcod_prod, pcod_empresa, pcod_grade, pqtde_entrada, pqtde_saida, paltdtultvnd integer)

        SqlExec('execute procedure movimenta_estoque(%d, %s, %s, %d, %s, %s, 0)',
                [vItemIndice.fint('grupo_prod'), vItemIndice.fstrq('cod_prod'), vDadosIni.codEmpresa, vItemIndice.fint('cod_grade'),
                 '0', ffloat_fb(vItemIndice.ffloat('quantidade_utilizada') + vItemIndice.ffloat('quantidade_perda'))]);

        SqlExec('update produtos set dt_ult_s_producao = %s' +
                ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %s',
                [fdate_fb('data'), vItemIndice.fint('grupo_prod'), vItemIndice.fstrq('cod_prod'), vDadosIni.codEmpresa]);

        vItemIndice.dataSet.Next;
      end;
      }
      item := TDataSet_OOP.Create(buscas.Database, transacao);
      try
        item.ClientOpen('select grupo_prod, cod_prod, cod_grade,' +
                        ' sum(coalesce(quantidade_utilizada, 0) + coalesce(quantidade_perda, 0)) quantidade' +
                        ' from producao_item_indice ' +
                        ' where cod_producao = %d and cod_empresa = %d' +
                        ' group by grupo_prod, cod_prod, cod_grade',
                        [fint('cod_producao'), vDadosIni.cod_empresa]).Last;
        ProgressUtil.MaxProgress(item.dataSet.RecordCount);
        item.prepare_loop();
        try
          while not item.dataSet.Eof do
          begin
            ProgressUtil.IncProgress();

            SqlExec('execute procedure movimenta_estoque(%d, %s, %s, %d, %s, %s, 0)',
                    [item.fint('grupo_prod'), item.fstrq('cod_prod'), vDadosIni.codEmpresa, item.fint('cod_grade'),
                     '0', item.ffloat_fb(item.ffloat('quantidade'))]);

            SqlExec('update produtos set dt_ult_s_producao = %s' +
                    ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %s',
                    [fdate_fb('data'), item.fint('grupo_prod'), item.fstrq('cod_prod'), vDadosIni.codEmpresa]);

            item.dataSet.Next;
          end;
        finally
          item.prepare_loop_done();
        end;
      finally
        item.Free;
      end;

      ProgressUtil.Msg('Baixando estoque Produto Acabado');
      ProgressUtil.IncStep();
      ProgressUtil.MaxProgress(vItemAcabado.dataSet.RecordCount);

      // Entrada de estoque dos produtos acabados da produção
      vItemAcabado.dataSet.First;
      while not vItemAcabado.dataSet.Eof do
      begin
        ProgressUtil.IncProgress();

        vItemAcabado.vProdCons._selecionaProdutos(
          vItemAcabado.dataSet.FieldByName('grupo_prod').AsInteger,
          vItemAcabado.dataSet.FieldByName('cod_prod').AsString, -1);

        if (vItemAcabado.vProdCons.dataSet.FieldByName('prec_cusm_prod').AsFloat > 0) and
           (vItemAcabado.vProdCons.dataSet.FieldByName('est_f').AsFloat > 0) then
        begin
          vCustoMedio := (vItemAcabado.vProdCons.dataSet.FieldByName('prec_cusm_prod').AsFloat * vItemAcabado.vProdCons.dataSet.FieldByName('est_f').AsFloat);
          vCustoMedio := vCustoMedio + (vItemAcabado.dataSet.FieldByName('prec_cus_prod').AsFloat * vItemAcabado.dataSet.FieldByName('quantidade').AsFloat);
          if (vItemAcabado.dataSet.FieldByName('quantidade').AsFloat + vItemAcabado.vProdCons.dataSet.FieldByName('est_f').AsFloat) > 0 then
            vCustoMedio := vCustoMedio /
              (vItemAcabado.dataSet.FieldByName('quantidade').AsFloat + vItemAcabado.vProdCons.dataSet.FieldByName('est_f').AsFloat)
          else
            vCustoMedio := vItemAcabado.dataSet.FieldByName('prec_cus_prod').AsFloat;
        end
        else
          vCustoMedio := vItemAcabado.dataSet.FieldByName('prec_cus_prod').AsFloat;

        SqlExec('execute procedure movimenta_estoque(%d, %s, %s, %d, %s, %s, 0)',
                [vItemAcabado.fint('grupo_prod'), vItemAcabado.fstrq('cod_prod'), vDadosIni.codEmpresa, vItemAcabado.fint('cod_grade'),
                 vItemAcabado.ffloat_fb('quantidade'), '0']);

        SqlExec('update produtos set prec_cus_prod = %s, prec_cusm_prod = %s, cod_producao = %d, dt_ult_e_producao = %s' +
                ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %s',
                [vItemAcabado.ffloat_fb('prec_cus_prod'), ffloat_fb(vCustoMedio),
                 fint('cod_producao'), fdate_fb('data'),
                 vItemAcabado.fint('grupo_prod'), vItemAcabado.fstrq('cod_prod'), vDadosIni.codEmpresa]);
        {
        buscas.Close;
        buscas.SQL.Text := 'execute procedure movimenta_estoque(:GRUPO_PROD, :COD_PROD, ' + vDadosIni.codEmpresa + ', 0,  :QUANTIDADE, 0, 0)';
        buscas.ParamByName('GRUPO_PROD').AsInteger := vItemAcabado.dataSet.FieldByName('GRUPO_PROD').AsInteger;
        buscas.ParamByName('COD_PROD').AsString := vItemAcabado.dataSet.FieldByName('COD_PROD').AsString;
        buscas.ParamByName('QUANTIDADE').AsFloat := vItemAcabado.dataSet.FieldByName('quantidade').AsFloat;
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.Text := 'update produtos set prec_cus_prod = :prec_cus_prod,' +
          ' prec_cusm_prod = :prec_cusm_prod, cod_producao = :cod_producao, dt_ult_e_producao = :dt_ult_e_producao' +
          ' where grupo_prod = :grupo_prod and cod_prod = :cod_prod and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.ParamByName('grupo_prod').AsInteger := vItemAcabado.dataSet.FieldByName('grupo_prod').AsInteger;
        buscas.ParamByName('cod_prod').AsString := vItemAcabado.dataSet.FieldByName('cod_prod').AsString;
  //      buscas.ParamByName('est_f').AsFloat := vItemAcabado.dataSet.FieldByName('quantidade').AsFloat;
        buscas.ParamByName('prec_cus_prod').AsFloat := vItemAcabado.dataSet.FieldByName('prec_cus_prod').AsFloat;
        buscas.ParamByName('prec_cusm_prod').AsFloat := vCustoMedio;
        buscas.ParamByName('cod_producao').AsInteger := dataSet.FieldByName('cod_producao').AsInteger;
        buscas.ParamByName('dt_ult_e_producao').AsDate := dataSet.FieldByName('data').AsDateTime;
        buscas.ExecSQL;
        }
        // Inserindo registro na tabela de custos
        buscas.Close;
        buscas.Sql.Text := 'INSERT INTO CUSTOS (CODIGO, COD_EMPRESA, VALOR,' +
          ' GRUPO_PROD, COD_PROD, DATA, PREC_CUS_MED, PR_CUSC_PROD, COD_PRODUCAO)' +
          ' VALUES (:CODIGO, :COD_EMPRESA, :VALOR,' +
          ' :GRUPO_PROD, :COD_PROD, :DATA, :PREC_CUS_MED, :PR_CUSC_PROD, :COD_PRODUCAO)';
        buscas.ParamByName('CODIGO').AsInteger := Gencodigo('CUSTOS', dtmProducao.SpIncCodigo, vDadosIni.codEmpresa);
        buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
        buscas.ParamByName('GRUPO_PROD').AsInteger := vItemAcabado.dataSet.FieldByName('GRUPO_PROD').AsInteger;
        buscas.ParamByName('COD_PROD').AsString := vItemAcabado.dataSet.FieldByName('COD_PROD').AsString;
        buscas.ParamByName('DATA').AsDate := dataSet.FieldByName('data').AsDateTime;
        buscas.ParamByName('COD_PRODUCAO').AsInteger := dataSet.FieldByName('COD_PRODUCAO').AsInteger;
        buscas.ParamByName('VALOR').AsFloat := vItemAcabado.dataSet.FieldByName('prec_cus_prod').AsFloat;
        buscas.ParamByName('PREC_CUS_MED').AsFloat := vCustoMedio;
        buscas.ParamByName('PR_CUSC_PROD').AsFloat := vItemAcabado.dataSet.FieldByName('prec_cus_prod').AsFloat;
        buscas.Prepare;
        buscas.ExecSql;

        vItemAcabado.dataSet.Edit;
        vItemAcabado.dataSet.FieldByName('PREC_CUSM_PROD').AsFloat := vCustoMedio;
        vItemAcabado.dataSet.Post;                                                     
        vItemAcabado.dataSet.Next;
      end;

      
      ProgressUtil.Msg('Finalizando... Aguarde');
      ProgressUtil.IncStep();

      dataSet.Edit;
      dataSet.FieldByName('data_fechamento').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('STATUS').AsString := 'FECHADO';
      if Trim(dataSet.FieldByName('HORA_FECHAMENTO').AsString) = '' then
        dataSet.FieldByName('HORA_FECHAMENTO').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
      dataSet.Post;

      Apply;
      vItemAcabado.Apply;

      salvarvariacoes;

      if CommitaTransacao then
      begin
        Result := True;
        vDadosIni.GravaAuditoria('PPR034', 'FECHAR', 'SUCESSO', 'PRODUCAO', dataSet.FieldByName('COD_PRODUCAO').AsString, buscas);
        _atualizaInformacoesPedidoCompra;

        _corrigirMD5Produtos;

        Application.MessageBox('Pedido de Produção Fechado!', 'Atenção', 0 + 64);
        _imprimirFichaProducao;
      end
      else
      begin
        RollBackTransacao;
        vDadosIni.GravaAuditoria('PPR034', 'FECHAR', 'FALHA', 'PRODUCAO', dataSet.FieldByName('COD_PRODUCAO').AsString, buscas);
      end;
    finally
      ProgressUtil.Terminate();
    end;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      registraErro('function TProducao._efetuarFechamentoDeProducao. Erro: '+ e.Message);
      Application.MessageBox(pchar('Erro no fechamento do Pedido de Produção. Erro: ' + E.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TProducao._efetuarLeituraDeArquivo(pArquivo: TStringList): Boolean;
var
  I: Integer;
  vLinha: string;
  vMesmoGrupoCodigo, vMesmaEmpresa: Boolean;
  vFile: Boolean;
begin
  Result := False;
  fDataSetT := TClientDataSet(dtmProducao.cdsTemp);

  try
    if fDataSetT.Tag <> 22 then
    begin
      fDataSetT.CreateDataSet;
      fDataSetT.Tag := 22;
    end;
  except
  end;

  fDataSetT.EmptyDataSet;

  vMesmoGrupoCodigo := False;
  vMesmaEmpresa := False;
  for I := 0 to pArquivo.Count - 1 do
  begin
    vLinha := copy(pArquivo[I],2, length(pArquivo[I]));

    if vDadosIni.getCampoPipe(vLinha,1) = 'HW' then
    begin
      vMesmaEmpresa := vDadosIni.getCampoPipe(vLinha,2) = vDadosIni.codEmpresa;
      vFile := vDadosIni.getCampoPipe(vLinha,2) = '0';
    end;

    if vDadosIni.getCampoPipe(vLinha,1) = 'ITEM_PEDIDO' then
    begin

      vMesmoGrupoCodigo := False;
      if vMesmaEmpresa then
        vMesmoGrupoCodigo := vDadosIni.getCampoPipe(vLinha,11) = vDadosIni.codEmpresa;

      if vMesmoGrupoCodigo then
      begin
        fDataSetT.Filtered := False;
        fDataSetT.Filter := 'grupo_prod = ' + vDadosIni.getCampoPipe(vLinha,4) +
          ' and cod_prod = '+ QuotedStr(vDadosIni.getCampoPipe(vLinha,5));
        fDataSetT.Filtered := True;
        if fDataSetT.IsEmpty then
        begin
          fDataSetT.Append;
          fDataSetT.FieldByName('QUANTIDADE').AsFloat := StrToFloat(vDadosIni.getCampoPipe(vLinha, 8));
        end
        else
        begin
          fDataSetT.Edit;
          fDataSetT.FieldByName('QUANTIDADE').AsFloat :=
            fDataSetT.FieldByName('QUANTIDADE').AsFloat + StrToFloat(vDadosIni.getCampoPipe(vLinha, 8));
        end;
      end
      else
      begin
        fDataSetT.Append;
        fDataSetT.FieldByName('QUANTIDADE').AsFloat := StrToFloat(vDadosIni.getCampoPipe(vLinha, 8));
      end;

      if (vMesmoGrupoCodigo) and (vDadosIni.getCampoPipe(vLinha,11) = vDadosIni.codEmpresa) then
      begin
        fDataSetT.FieldByName('grupo_prod').AsString := vDadosIni.getCampoPipe(vLinha,4);
        fDataSetT.FieldByName('cod_prod').AsString := vDadosIni.getCampoPipe(vLinha,5);
        fDataSetT.FieldByName('NUM_FAB_PROD').AsString := vDadosIni.getCampoPipe(vLinha,6);
        fDataSetT.FieldByName('cod_grade').AsInteger := StrToIntDef(vDadosIni.getCampoPipe(vLinha,14), 0);
      end
      else
      begin
        fDataSetT.FieldByName('grupo_prod').Value := Null;
        fDataSetT.FieldByName('cod_prod').Value := Null;
        fDataSetT.FieldByName('NUM_FAB_PROD').Value := Null;
        fDataSetT.FieldByName('cod_grade').Value := Null;
      end;

      fDataSetT.FieldByName('NUM_FAB_FORNECEDOR').AsString := vDadosIni.getCampoPipe(vLinha, 6);
      fDataSetT.FieldByName('DESCR_PROD').AsString := vDadosIni.getCampoPipe(vLinha, 7);
      fDataSetT.FieldByName('NUM_PED').AsString := vDadosIni.getCampoPipe(vLinha, 2);
      if vFile then
        fDataSetT.FieldByName('COD_EMPRESA').AsString := '0'
      else
        fDataSetT.FieldByName('COD_EMPRESA').AsString := vDadosIni.getCampoPipe(vLinha,11);
      fDataSetT.FieldByName('CGC_EMP').AsString := vDadosIni.getCampoPipe(vLinha,12);
      fDataSetT.FieldByName('NOME_EMP').AsString := vDadosIni.getCampoPipe(vLinha,13);
      fDataSetT.Post;

    end;

  end;
  fDataSetT.Filtered := False;
  Result := not fDataSetT.IsEmpty;

end;

function TProducao._efetuarReaberturaDeProducao: Boolean;
var
  vPrecCusProd, vPrecCusMProd, vPrecCusMNF : Extended;
  vDataUltCompra :  TDate;
  vNumNfRec, vCodproduc : Integer;
  item: TDataSet_OOP;
begin

  Result := False;

  if not vDadosIni.PesqPros('PPR035', 'ALTERAR', '', 'PRODUCAO',
    dataSet.FieldByName('COD_PRODUCAO').AsString, buscas, true) then
    exit;

  try

    if not _producaoFechada then
      raiseExceptionCreate('Pedido de Produção não está FECHADO para ser reaberto', '');

    if dataSet.FieldByName('GERACAO_AUT').AsString = 'S' then
    begin
    	raiseExceptionCreate('Pedido de Produção gerado automaticamente não é possível reabrir', '');
      exit;
    end;

    ProgressUtil.InitProgress(ProgressOpt.Create('Reabrindo produção', '').WithSteps(4));
    try
      ProgressUtil.IncStep();
      ProgressUtil.Msg('Removendo historico de custo');

      buscas.Close;
      buscas.SQL.Text := 'DELETE FROM CUSTOS WHERE COD_EMPRESA = ' +
        vDadosIni.CodEmpresa + ' and ativo = 1 AND COD_PRODUCAO = ' + dataSet.FieldByName('COD_PRODUCAO').AsString;
      buscas.Prepare;
      buscas.ExecSQL;

      vItemAcabado._abreItemAcabado(dataSet.FieldByName('cod_producao').AsInteger);
      vItemIndice._abreItemIndice(dataSet.FieldByName('cod_producao').AsInteger);

      ProgressUtil.IncStep();
      ProgressUtil.Msg('Voltando estoque Produto Acabado');

      vItemAcabado.dataSet.Filtered := False;
      ProgressUtil.MaxProgress(vItemAcabado.dataSet.RecordCount);
      vItemAcabado.dataSet.First;
      while not vItemAcabado.dataSet.Eof do
      begin
        ProgressUtil.IncProgress;
        {
        buscas.Close;
        buscas.SQL.Text := 'execute procedure movimenta_estoque(:GRUPO_PROD, :COD_PROD, ' + vDadosIni.codEmpresa + ', 0, 0, :QUANTIDADE, 0)';
        buscas.ParamByName('GRUPO_PROD').AsInteger := vItemAcabado.dataSet.FieldByName('GRUPO_PROD').AsInteger;
        buscas.ParamByName('COD_PROD').AsString := vItemAcabado.dataSet.FieldByName('COD_PROD').AsString;
        buscas.ParamByName('QUANTIDADE').AsFloat := vItemAcabado.dataSet.FieldByName('quantidade').AsFloat;
        buscas.ExecSQL;
        }
        SqlExec('execute procedure movimenta_estoque(%d, %s, %s, %d, %s, %s, 0)',
                [vItemAcabado.fint('grupo_prod'), vItemAcabado.fstrq('cod_prod'), vDadosIni.codEmpresa, vItemAcabado.fint('cod_grade'),
                 '0', vItemAcabado.ffloat_fb('quantidade')]);

        buscas.Close;
        buscas.sql.text := 'select first 1 * from custos' +
          ' where grupo_prod = :grupo_prod and cod_prod = :cod_prod and' +
          ' cod_empresa = ' + vDadosIni.codEmpresa +
          ' order by data desc';
        buscas.ParamByName('grupo_prod').AsInteger := vItemAcabado.dataSet.FieldByName('grupo_prod').AsInteger;
        buscas.ParamByName('cod_prod').AsString := vItemAcabado.dataSet.FieldByName('cod_prod').AsString;
        buscas.Open;

        if not buscas.IsEmpty then
        begin
          vPrecCusProd := buscas.FieldByName('valor').AsFloat;
          vPrecCusMProd := buscas.FieldByName('prec_cus_med').AsFloat;
          vPrecCusMNF := buscas.FieldByName('pr_cusc_prod').AsFloat;
          vDataUltCompra := buscas.FieldByName('data').AsDateTime;
          vNumNfRec := buscas.FieldByName('num_nota_nfe').AsInteger;
          vCodproduc := buscas.FieldByName('cod_producao').AsInteger;
          buscas.close;

          if vCodproduc > 0 then
            buscas.SQL.Text := 'update produtos set prec_cus_prod = :prec_cus_prod,' +
              ' prec_cusm_prod = :prec_cusm_prod,' +
              ' dt_ult_e_producao = :dt_ult_e_producao,' +
              ' cod_producao = :cod_producao' +
              ' where grupo_prod = :grupo_prod' +
              ' and cod_prod = :cod_prod' +
              ' and cod_empresa = ' + vDadosIni.codEmpresa
          else
            buscas.SQL.Text := 'update produtos set prec_cus_prod = :prec_cus_prod,' +
              ' prec_cusm_prod = :prec_cusm_prod,' +
              ' prec_cus_mnf = :prec_cus_mnf,' +
              ' data_ult_compra = :data_ult_compra,' +
              ' num_nf_rec = :num_nf_rec' +
              ' where grupo_prod = :grupo_prod' +
              ' and cod_prod = :cod_prod' +
              ' and cod_empresa = ' + vDadosIni.codEmpresa;

          buscas.ParamByName('prec_cus_prod').AsFloat := vPrecCusProd;
          buscas.ParamByName('prec_cusm_prod').AsFloat := vPrecCusMProd;
          if vCodproduc > 0 then
          begin
            buscas.ParamByName('dt_ult_e_producao').AsDate := vDataUltCompra;
            buscas.ParamByName('cod_producao').AsInteger := vCodproduc;
          end
          else
          begin
            buscas.ParamByName('prec_cus_mnf').AsFloat := vPrecCusMNF;
            buscas.ParamByName('data_ult_compra').AsDate := vDataUltCompra;
            buscas.ParamByName('num_nf_rec').AsInteger := vNumNfRec;
          end;
          buscas.ParamByName('grupo_prod').AsInteger :=
            vItemAcabado.dataSet.FieldByName('grupo_prod').AsInteger;
          buscas.ParamByName('cod_prod').AsString := vItemAcabado.dataSet.FieldByName('cod_prod').AsString;
          buscas.Prepare;
          buscas.ExecSQL;
        end;

        vItemAcabado.dataSet.Next;
      end;

      ProgressUtil.IncStep();
      ProgressUtil.Msg('Voltando estoque Matéria-prima/Insumo/etc');

      item := TDataSet_OOP.Create(buscas.Database, transacao);
      try
        item.ClientOpen('select grupo_prod, cod_prod, cod_grade,' +
                        ' sum(coalesce(quantidade_utilizada, 0) + coalesce(quantidade_perda, 0)) quantidade' +
                        ' from producao_item_indice ' +
                        ' where cod_producao = %d and cod_empresa = %d' +
                        ' group by grupo_prod, cod_prod, cod_grade',
                        [fint('cod_producao'), vDadosIni.cod_empresa]).Last;
        ProgressUtil.MaxProgress(item.dataSet.RecordCount);
        item.prepare_loop();
        try
          while not item.dataSet.Eof do
          begin
            ProgressUtil.IncProgress();

            SqlExec('execute procedure movimenta_estoque(%d, %s, %s, %d, %s, %s, 0)',
                    [item.fint('grupo_prod'), item.fstrq('cod_prod'), vDadosIni.codEmpresa, item.fint('cod_grade'),
                     item.ffloat_fb(item.ffloat('quantidade')), '0']);

            item.dataSet.Next;
          end;
        finally
          item.prepare_loop_done();
        end;
      finally
        item.Free;
      end;
      //Abaixo eu comentei para melhorar o desempenho e removi o teste de solvente, ja que a baixa do estoque não testa
      // Somente o custo do solvente(AGUA) n não ta calculando, caso necessario outro tipo de solvente fazer de forma q faça
      (*
      vItemIndice.dataSet.Filtered := False;
      vItemIndice.dataSet.First;
      while not vItemIndice.dataSet.Eof do
      begin
      
        if vItemIndice.dataSet.FieldByName('solvente').AsString <> 'S' then
        begin
          {
          buscas.Close;
          buscas.SQL.Text := 'execute procedure movimenta_estoque(:GRUPO_PROD, :COD_PROD, ' + vDadosIni.codEmpresa + ', 0, :QUANTIDADE, 0, 0)';
          buscas.ParamByName('GRUPO_PROD').AsInteger := vItemIndice.dataSet.FieldByName('GRUPO_PROD').AsInteger;
          buscas.ParamByName('COD_PROD').AsString := vItemIndice.dataSet.FieldByName('COD_PROD').AsString;
          buscas.ParamByName('QUANTIDADE').AsFloat := vItemIndice.dataSet.FieldByName('QUANTIDADE_UTILIZADA').AsFloat +
            vItemIndice.dataSet.FieldByName('QUANTIDADE_PERDA').AsFloat;
          buscas.ExecSQL;
          }
          SqlExec('execute procedure movimenta_estoque(%d, %s, %s, %d, %s, %s, 0)',
                [vItemIndice.fint('grupo_prod'), vItemIndice.fstrq('cod_prod'), vDadosIni.codEmpresa, vItemIndice.fint('cod_grade'),
                 ffloat_fb(vItemIndice.ffloat('quantidade_utilizada') + vItemIndice.ffloat('quantidade_perda')), '0']);
        end;

        vItemIndice.dataSet.Next;
      end;
      *)
      ProgressUtil.IncStep();
      ProgressUtil.Msg('Finalizando... Aguarde');

      dataSet.Edit;
      dataSet.FieldByName('data_fechamento').Value := Null;
      dataSet.FieldByName('STATUS').AsString := 'INICIADO';
      dataSet.Post;

      Apply;

      if CommitaTransacao then
      begin
        Result := True;
        vDadosIni.GravaAuditoria('PPR035', 'REABRIR', 'SUCESSO', 'PRODUCAO', dataSet.FieldByName('COD_PRODUCAO').AsString, buscas);
        _atualizaInformacoesPedidoCompra;

        _corrigirMD5Produtos;
      
        Application.MessageBox('Pedido de Produção Reaberto!', 'Atenção', 0 + 64);
      end
      else
      begin
        RollBackTransacao;
        vDadosIni.GravaAuditoria('PPR035', 'REABRIR', 'FALHA', 'PRODUCAO', dataSet.FieldByName('COD_PRODUCAO').AsString, buscas);
      end;

    finally
      ProgressUtil.Terminate;
    end;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      registraErro('function TProducao._efetuarReaberturaDeProducao. Erro: '+ e.Message);
      Application.MessageBox(pchar('Erro na reabertura do Pedido de Produção. Erro: ' + E.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TProducao._existeEstoque(pGrupoProd: Integer; pCodProd:string;
  pQtde: Extended): boolean;
var
  vQtdeIndice, vQtdePendente, vQtdeProduto: Extended;
  vFilter: string;
  vFiltered: Boolean;
begin

  Result := True;
  vQtdeIndice := 0;
  vQtdePendente := 0;
  vQtdeProduto := 0;
  if vTipoItemTemp = '' then
    vTipoItemTemp := 'Matéria Prima/Embalagem/Insumo';

  buscas.Close;
  buscas.SQL.Text := 'select p.est_f from produtos p' +
    ' where p.grupo_prod = ' + IntToStr(pGrupoProd) + ' and p.cod_prod = ' + QuotedStr(pCodProd) +
    ' and  p.cod_empresa = ' + vDadosIni.codEmpresa ;
  buscas.Open;

  vQtdeProduto := buscas.FieldByName('est_f').AsFloat;

  vFilter := vItemIndice.dataSet.Filter;
  vFiltered := vItemIndice.dataSet.Filtered;

  vItemIndice.dataSet.Filtered := False;
  vItemIndice._filtrarItemIndice(pGrupoProd, pCodProd);
  vItemIndice.dataSet.First;
  while not vItemIndice.dataSet.Eof do
  begin
    vQtdeIndice := vQtdeIndice + (vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat + vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat);
    vItemIndice.dataSet.Next;
  end;
  vItemIndice.dataSet.Filter := vFilter;
  vItemIndice.dataSet.Filtered := vFiltered;

  buscas.Close;
  vQtdePendente := 0;
  if (vDadosIni.vEmp.vApresentarEstR = 'S') then
  begin
    buscas.SQL.Text := 'select sum(coalesce(pp.quant_ped_item,0)) as somaEstoque from pedvenda_prod pp, pedvenda p' +
      ' where pp.cod_prod= ' + QuotedStr(pCodProd) + ' and pp.grupo_prod = ' + IntToStr(pGrupoProd) +
      ' and pp.nped = p.nped and pp.tipo = p.tipo and p.tipo <> ''ORC'' ' +
      ' and (p.data_fech is null) and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo = 1';
    buscas.Open;

    vQtdePendente := buscas.FieldByName('somaEstoque').AsFloat;

    buscas.Close;
    buscas.SQL.Text := 'select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as somaEstoque from producao pd, producao_item_indice pi' +
      ' where pi.grupo_prod = ' + IntToStr(pGrupoProd) + ' and pi.cod_prod = ' + QuotedStr(pCodProd) +
      ' and pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa' +
      ' and pd.cod_producao <> ' + IntToStr(dataset.FieldByName('cod_producao').AsInteger) +
      ' and (pd.data_fechamento is null) and pd.cod_empresa = ' + vDadosIni.codEmpresa ;
    buscas.Open;

    vQtdePendente := vQtdePendente + buscas.FieldByName('somaEstoque').AsFloat;

  end
  else if (vDadosIni.vEmp.vApresentarEstR = 'O') then
  begin
    buscas.SQL.Text := 'select sum(coalesce(pp.quant_ped_item,0)) as somaEstoque from pedvenda_prod pp, pedvenda p' +
      ' where pp.cod_prod= ' + QuotedStr(pCodProd) + ' and pp.grupo_prod = ' + IntToStr(pGrupoProd) +
      ' and pp.nped = p.nped and pp.tipo = p.tipo and p.tipo = ''OS'' ' +
      ' and (p.data_fech is null) and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo = 1';
    buscas.Open;

    vQtdePendente := buscas.FieldByName('somaEstoque').AsFloat;
  end
  else if (vDadosIni.vEmp.vApresentarEstR = 'R') then
  begin
    buscas.SQL.Text := 'select sum(coalesce(pp.quant_ped_item,0)) as somaEstoque from pedvenda_prod pp, pedvenda p' +
      ' where pp.cod_prod= ' + QuotedStr(pCodProd) + ' and pp.grupo_prod = ' + IntToStr(pGrupoProd) +
      ' and pp.nped = p.nped and pp.tipo = p.tipo and p.tipo <> ''REQ'' ' +
      ' and (p.data_fech is null) and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo = 1';
    buscas.Open;

    vQtdePendente := buscas.FieldByName('somaEstoque').AsFloat;
  end
  else if (vDadosIni.vEmp.vApresentarEstR = 'P') then
  begin
    buscas.SQL.Text := 'select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as somaEstoque from producao pd, producao_item_indice pi' +
      ' where pi.grupo_prod = ' + IntToStr(pGrupoProd) + ' and pi.cod_prod = ' + QuotedStr(pCodProd) +
      ' and pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa' +
      ' and pd.cod_producao <> ' + IntToStr(dataset.FieldByName('cod_producao').AsInteger) +
      ' and (pd.data_fechamento is null) and pd.cod_empresa = ' + vDadosIni.codEmpresa ;
    buscas.Open;

    vQtdePendente := buscas.FieldByName('somaEstoque').AsFloat;
  end;

  vQtdeIndice := vQtdeIndice + pQtde;
  vQtdeProduto := vQtdeProduto - vQtdePendente;
  
  if (vQtdeProduto < vQtdeIndice)  then
  begin
    Result := False;
    Exit;
    Application.MessageBox(Pchar( vTipoItemTemp + ' "' + Trim(vTempString) + '" está com quantidade requisitada maior que a do estoque'+ chr(13) +
      'Quantidade deste item no pedido de produção = ' + floattostr(vQtdeIndice) + chr(13) +
      'Quantidade disponível = ' + floattostr(vQtdeProduto)), 'Atenção', MB_OK + MB_ICONINFORMATION);
    Result := vDadosIni.vEstoqueNegativo = 'S';
    exit;
  end;
  
end;

function TProducao._existeFormula: Boolean;
var
  I: Integer;
  vPesoTotal: Extended;
  vtrue: Boolean;
  vQtdeTemp: Extended;
begin

  Result := False;
  try

    if dataSet.FieldByName('cod_formula').AsInteger <= 0 then
      raiseExceptionCreate('O objeto principal da Produção não foi informado', 'DBEdit18');

    if dataSet.FieldByName('QUANTIDADEPREVISTA').AsFloat <= 0 then
      dataSet.FieldByName('QUANTIDADEPREVISTA').AsFloat := 1;

    vFormula._selecionaFormula(dataSet.FieldByName('cod_formula').AsInteger);

    if vFormula.IsEmpty then
      raiseExceptionCreate('O objeto principal da Produção informado não foi encontrado no cadastro de Fórmulas', 'DBEdit18');

    dataSet.FieldByName('TIPO_CONVERSAO').AsString := IfThen(vFormula.fequals('tipo_conversao', 'U'), 'U', 'P');
    dataSet.FieldByName('UNIDADE').AsString        := IfThen(not vFormula.str_empty('unidade'), vFormula.fstr('unidade'), fstr('unidade'));

    vItemIndice._filtrarItemIndice(0);
//    vItemIndice.dataSet.First;
//    while not vItemIndice.dataSet.Eof do
//    begin
//      if vItemIndice.dataSet.FieldByName('cod_formula').AsInteger <> vFormula.dataSet.FieldByName('cod_formula').AsInteger then
//      begin
        while not vItemIndice.dataSet.IsEmpty do
          vItemIndice.dataSet.Delete;
//        Break;
//      end;
//      vItemIndice.dataSet.Next;
//    end;

         
    vPesoTotal := 0;
    if vFormula.dataSet.FieldByName('usar_solvente').AsString <> 'S' then
    begin
      vFormula.dataSet.First;
      while not vFormula.dataSet.Eof do
      begin
        vPesoTotal := vPesoTotal + (vFormula.dataSet.FieldByName('peso_brut_prod').AsFloat *
          vFormula.dataSet.FieldByName('quantidade').AsFloat);
        vFormula.dataSet.Next;
      end;
    end;

    I:= 0;
    vItemIndice._filtrarItemIndice(0);     
    vFormula.dataSet.First;
    while not vFormula.dataSet.Eof do
    begin
      Inc(I);
      vItemIndice.vProdCons._selecionaProdutos(
        vFormula.dataSet.FieldByName('grupo_prod').AsInteger,
        vFormula.dataSet.FieldByName('cod_prod').AsString, -1);

      if fdif('tipo_conversao', 'U') then
      if vDadosIni.StrToFloatFormat( vFormula.dataSet.FieldByName('peso_brut_prod').AsFloat, vDadosIni.vEmp.vPrecisaoProducao) <= 0 then
          raiseExceptionCreate('Peso do item da Fórmula abaixo da precisão configurada no sistema'+#13+
          'Item: ' + Trim(vFormula.dataSet.FieldByName('num_fab_prod').AsString) + ' ' +
          Trim(vFormula.dataSet.FieldByName('descr_prod').AsString) +#13 +
          'Peso do Item: ' + FloatToStr(vFormula.dataSet.FieldByName('peso_brut_prod').AsFloat) +#13 +
          'Casas decimais da produção: ' + IntToStr(vDadosIni.vEmp.vPrecisaoProducao)+#13 +
          'Resultado: ' + Format('%0.'+IntToStr(vDadosIni.vEmp.vPrecisaoProducao)+'f',
          [vFormula.dataSet.FieldByName('peso_brut_prod').AsFloat]) + #13 +
          'Modifique o peso do item ou corrija a configuração'  ,'');
      {
      if vFormula.dataSet.FieldByName('usar_solvente').AsString = 'S' then
        vQtdeTemp := vDadosIni.StrToFloatFormat(dataSet.FieldByName('QUANTIDADEPREVISTA').AsFloat *
          vDadosIni.StrToFloatFormat(vFormula.dataSet.FieldByName('quantidade').AsFloat,6) / 100, 6)
      else
      begin
        vQtdeTemp := vDadosIni.StrToFloatFormat(
          ((vDadosIni.StrToFloatFormat(vFormula.dataSet.FieldByName('quantidade').AsFloat,6) *
          vDadosIni.StrToFloatFormat( vFormula.dataSet.FieldByName('peso_brut_prod').AsFloat,
          vDadosIni.vEmp.vPrecisaoProducao)) / vPesoTotal) *
          dataSet.FieldByName('QUANTIDADEPREVISTA').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);
        vQtdeTemp := vQtdeTemp / (vDadosIni.StrToFloatFormat( vFormula.dataSet.FieldByName('peso_brut_prod').AsFloat,
          vDadosIni.vEmp.vPrecisaoProducao));
      end;
      }
      vTipoItemTemp := vItemIndice.vProdCons._getTipoItem('');
      vTempString := Trim(vItemIndice.vProdCons.dataSet.FieldByName('num_fab_prod').AsString) + ' ' +
        Trim(vItemIndice.vProdCons.dataSet.FieldByName('descr_prod').AsString);

//      if (_existeEstoque(vItemIndice.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger,
//        vItemIndice.vProdCons.dataSet.FieldByName('cod_prod').AsString, vQtdeTemp)) and
        if (not vItemIndice.vProdCons.dataSet.IsEmpty) and (vItemIndice.Insert) then
      begin

        vItemIndice.dataSet.FieldByName('cod_producao').AsInteger :=
          dataSet.FieldByName('cod_producao').AsInteger;
        vItemIndice.dataSet.FieldByName('nitem').AsInteger := 0;
        vItemIndice.dataSet.FieldByName('nitem_ind').AsInteger := vItemIndice.max_next;
        vItemIndice.dataSet.FieldByName('grupo_prod').AsInteger :=
          vItemIndice.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger;
        vItemIndice.dataSet.FieldByName('cod_prod').AsString :=
          vItemIndice.vProdCons.dataSet.FieldByName('cod_prod').AsString;
        vItemIndice.dataSet.FieldByName('num_fab_prod').AsString :=
          vItemIndice.vProdCons.dataSet.FieldByName('num_fab_prod').AsString;
        vItemIndice.dataSet.FieldByName('descr_prod').AsString :=
          vItemIndice.vProdCons.dataSet.FieldByName('descr_prod').AsString;
        vItemIndice.dataSet.FieldByName('unidade').AsString :=
          vItemIndice.vProdCons.dataSet.FieldByName('unidade').AsString;
        vItemIndice.dataSet.FieldByName('tipo_item').AsString :=
          vItemIndice.vProdCons.dataSet.FieldByName('tipo_item').AsString;
        vItemIndice.dataSet.FieldByName('prec_cusm_prod').AsString :=
          vItemIndice.vProdCons.dataSet.FieldByName('prec_cusm_prod').AsString;
        vItemIndice.dataSet.FieldByName('peso_un').AsFloat := vDadosIni.StrToFloatFormat(
          vFormula.dataSet.FieldByName('peso_brut_prod').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);

        if fequals('tipo_conversao', 'U') then
        begin
          vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat   := vFormula.ffloat('quantidade', -6);
          vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat := RoundTo(ffloat('quantidadeprevista') * vItemIndice.ffloat('quantidade_receita'), -6);
          vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat     := 0;
          vItemIndice.dataSet.FieldByName('peso_util').AsFloat            := RoundTo(vItemIndice.ffloat('quantidade_utilizada') *
                                                                                     vItemIndice.ffloat('peso_un'), 0 - vDadosIni.vEmp.vPrecisaoProducao);

        end
        else
        if vFormula.dataSet.FieldByName('usar_solvente').AsString = 'S' then
        begin
          vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat :=
            vDadosIni.StrToFloatFormat(vFormula.dataSet.FieldByName('quantidade').AsFloat,6);
          vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat :=
            vDadosIni.StrToFloatFormat(dataSet.FieldByName('QUANTIDADEPREVISTA').AsFloat *
            vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat / 100, 6);
          vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat := 0;
          vItemIndice.dataSet.FieldByName('peso_util').AsFloat := vDadosIni.StrToFloatFormat(
            vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);          
        end
        else
        begin
          vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat :=
            vDadosIni.StrToFloatFormat(vFormula.dataSet.FieldByName('quantidade').AsFloat,6);
          vItemIndice.dataSet.FieldByName('peso_util').AsFloat := vDadosIni.StrToFloatFormat(
            ((vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat * vItemIndice.dataSet.FieldByName('peso_un').AsFloat) /
            vPesoTotal) * dataSet.FieldByName('QUANTIDADEPREVISTA').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);
          vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat :=
            vItemIndice.dataSet.FieldByName('peso_util').AsFloat / vItemIndice.dataSet.FieldByName('peso_un').AsFloat;
        end;
        vItemIndice.dataSet.FieldByName('quantidade_teorica').AsFloat :=
          vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat;
        vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat := 0;
        vItemIndice.dataSet.FieldByName('cod_formula').AsFloat := vFormula.dataSet.FieldByName('cod_formula').AsFloat;
        vItemIndice.dataSet.FieldByName('solvente').AsString := vFormula.dataSet.FieldByName('solvente').AsString        ;
        vItemIndice.dataSet.Post;
      end;

      vFormula.dataSet.Next;
    end;

    _somarPesoTotalIndice;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64 );
    end;
  end;

  // testar o campo cod_formula no item para ver se é o mesmo do cabeçalho


end;

procedure TProducao._imprimirCustoProducao;
var
  vRel: TRDprint;
  vLinha, vPagina, vColunas: Smallint;
  vLinhasRel: Integer;
  vListaTemp: TStringList;
  I: Integer;
  vCustoProducao: Extended;
  vSomaQtde: Extended;
  vCustoMedioProducao: Extended;

  procedure _montarCabecalho;
  begin
    vLinha := 1;
    Inc(vPagina);
    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    vRel.Impf(vLinha, 001, vDadosIni.vEmp.vnomeEmpresa, [negrito]);
    vRel.Impf(vLinha, 044, '   CNPJ: ' + vDadosIni.vEmp.vCNPJ, []);
    vRel.Impf(vLinha, 077, '     Insc. Est.: ' + vDadosIni.vEmp.vIE, []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'CUSTO DA PRODUCAO', []);
    vRel.Impf(vLinha, 041, '  Producao: ' + vDadosIni.StrZero(dataSet.FieldByName('cod_producao').AsInteger, 6), []);
    vRel.Impf(vLinha, 082, '  Num Lote: ' + dataSet.FieldByName('nlote').AsString, []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'Data: ' + FormatDateTime( 'dd/mm/yyyy', vDadosIni.getDataBanco(buscas) ) , []);
    vRel.Impf(vLinha, 084, '  Pagina: ' + vDadosIni.StrZero(vPagina, 3), []);
    Inc(vLinha);

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    if vPagina = 1 then
    begin

      vRel.Impf(vLinha, 001, dataSet.FieldByName('descricao').AsString, []);
      vRel.Impf(vLinha, 043, '  Status: ' + dataSet.FieldByName('status').AsString , []);
      vRel.Impf(vLinha, 077, ' Custo Produção: ' + Format('%0.3n', [vCustoProducao]), []);
      Inc(vLinha);

      vRel.Impf(vLinha, 001, 'Data Producao: ' + dataSet.FieldByName('data').AsString, []);
      vRel.Impf(vLinha, 040, 'Data Inicio: ' + dataSet.FieldByName('data_inicio').AsString, []);
      vRel.Impf(vLinha, 077, 'Data Fechamento: ' + dataSet.FieldByName('data_fechamento').AsString, []);
      Inc(vLinha);

      vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
      Inc(vLinha);
    end;

    vRel.Impf(vLinha, 001, 'Codigo         Produto                                           Qtde     Custo UN  Cust UN Med     Custo Tot  Custo Tot Med', [negrito]);
    Inc(vLinha);

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);


  end;

begin
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
  vRel.OpcoesPreview.CaptionPreview := 'Custo da Produção';
  vRel.TitulodoRelatorio := 'Custo da Produção';
  vDadosIni._LimparVarSendEmail;
  vRel.OnSendMail := vDadosini._SendMailRdPrint;
  vRel.OpcoesPreview.Preview := True;
  if not vRel.EstaAberto then
    vRel.Abrir;

  vItemAcabado._abreItemAcabado(dataSet.FieldByName('cod_producao').AsInteger);
  vItemIndice._abreItemIndice(dataSet.FieldByName('cod_producao').AsInteger);

  vCustoProducao := 0;
  vSomaQtde:= 0;
  vCustoMedioProducao:=0;
  vItemAcabado.dataSet.First;
  while not vItemAcabado.dataSet.Eof do
  begin
    vCustoProducao := vCustoProducao + vItemAcabado.dataSet.FieldByName('CUSTO_INDICE').AsFloat +
      vItemAcabado.dataSet.FieldByName('CUSTO_RATEIO').AsFloat;
    vSomaQtde := vSomaQtde + vItemAcabado.dataSet.FieldByName('quantidade').AsFloat;
    vCustoMedioProducao := vCustoMedioProducao +  vItemAcabado.dataSet.FieldByName('PREC_CUSM_PROD').AsFloat *
      vItemAcabado.dataSet.FieldByName('quantidade').AsFloat;
    vItemAcabado.dataSet.Next;
  end;

  _montarCabecalho;

  vItemAcabado.dataSet.First;
  while not vItemAcabado.dataSet.Eof do
  begin
    if (vLinha + 2) >= vLinhasRel then
    begin
      vRel.Impf(vLinha, 001, 'continua..', [negrito]);
      vRel.Impf(vLinha, 016, 'Acumulado', [negrito]);
      vRel.Impf(vLinha, 058, vDadosIni.AlnDir(Format( '%0.4f', [vSomaQtde]), 12), []);
      vRel.Impf(vLinha, 097, vDadosIni.AlnDir(Format( '%0.3f', [vCustoProducao]), 13), []);
      vRel.Impf(vLinha, 112, vDadosIni.AlnDir(Format( '%0.3f', [vCustoMedioProducao]), 13), []);

      vRel.Novapagina;
      _montarCabecalho;
    end;

    vRel.Impf(vLinha, 001, Copy(Trim(vItemAcabado.dataSet.FieldByName('num_fab_prod').AsString), 1, 14), []);
    vRel.Impf(vLinha, 016, Copy(Trim(vItemAcabado.dataSet.FieldByName('descr_prod').AsString), 1, 40), []);
    vRel.Impf(vLinha, 058, vDadosIni.AlnDir(Format( '%0.4f', [vItemAcabado.dataSet.FieldByName('quantidade').AsFloat]), 12), []);
    vRel.Impf(vLinha, 071, vDadosIni.AlnDir(Format( '%0.6f', [vItemAcabado.dataSet.FieldByName('PREC_CUS_PROD').AsFloat]), 12), []);
    vRel.Impf(vLinha, 084, vDadosIni.AlnDir(Format( '%0.6f', [vItemAcabado.dataSet.FieldByName('PREC_CUSM_PROD').AsFloat]), 12), []);
    vRel.Impf(vLinha, 097, vDadosIni.AlnDir(Format( '%0.3f', [vItemAcabado.dataSet.FieldByName('PREC_CUS_PROD').AsFloat * vItemAcabado.dataSet.FieldByName('quantidade').AsFloat]), 13), []);
    vRel.Impf(vLinha, 112, vDadosIni.AlnDir(Format( '%0.3f', [vItemAcabado.dataSet.FieldByName('PREC_CUSM_PROD').AsFloat * vItemAcabado.dataSet.FieldByName('quantidade').AsFloat]), 13), []);
    Inc(vLinha);

    vItemAcabado.dataSet.Next;
  end;

  vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
  Inc(vLinha);
  vRel.Impf(vLinha, 016, 'Totais', [negrito]);
  vRel.Impf(vLinha, 058, vDadosIni.AlnDir(Format( '%0.4f', [vSomaQtde]), 12), [negrito]);
  vRel.Impf(vLinha, 097, vDadosIni.AlnDir(Format( '%0.3f', [vCustoProducao]), 13), [negrito]);
  vRel.Impf(vLinha, 112, vDadosIni.AlnDir(Format( '%0.3f', [vCustoMedioProducao]), 13), [negrito]);
  Inc(vLinha);
  vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));

  vRel.Fechar;
end;

procedure TProducao._imprimirFichaProducao;
var
  vRel: TRDprint;
  vLinha, vPagina, vColunas: Smallint;
  vLinhasRel: Integer;
  vListaTemp: TStringList;
  I: Integer;

  procedure _montarCabecalho;
  begin
    vLinha := 1;
    Inc(vPagina);
    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    vRel.Impf(vLinha, 001, vDadosIni.vEmp.vnomeEmpresa, [negrito]);
    vRel.Impf(vLinha, 044, '   CNPJ: ' + vDadosIni.vEmp.vCNPJ, []);
    vRel.Impf(vLinha, 077, '     Insc. Est.: ' + vDadosIni.vEmp.vIE, []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'FICHA DE PEDIDO DE PRODUCAO', []);
    vRel.Impf(vLinha, 041, '  Producao: ' + vDadosIni.StrZero(dataSet.FieldByName('cod_producao').AsInteger, 6), []);
    vRel.Impf(vLinha, 082, '  Num Lote: ' + dataSet.FieldByName('nlote').AsString, []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'Data: ' + FormatDateTime( 'dd/mm/yyyy', vDadosIni.getDataBanco(buscas) ) , []);
    vRel.Impf(vLinha, 084, '  Pagina: ' + vDadosIni.StrZero(vPagina, 3), []);
    Inc(vLinha);

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    if vPagina = 1 then
    begin

      vRel.Impf(vLinha, 001, dataSet.FieldByName('descricao').AsString, []);
      vRel.Impf(vLinha, 043, '  Status: ' + dataSet.FieldByName('status').AsString , []);
      Inc(vLinha);

      vRel.Impf(vLinha, 001, 'Data Producao: ' + dataSet.FieldByName('data').AsString, []);
      vRel.Impf(vLinha, 040, 'Data Inicio: ' + dataSet.FieldByName('data_inicio').AsString, []);
      vRel.Impf(vLinha, 077, 'Data Fechamento: ' + dataSet.FieldByName('data_fechamento').AsString, []);
      Inc(vLinha);

      begin
        vRel.Impf(vLinha, 001, 'Qtde Prevista: ' + Format( '%0.3f', [dataSet.FieldByName('QUANTIDADEPREVISTA').AsFloat]) + ' ' + dataSet.FieldByName('unidade').AsString, []);
        vRel.Impf(vLinha, 038, 'Qtde Producão: ' + Format( '%0.3f', [dataSet.FieldByName('QUANTIDADEPRODUCAO').AsFloat]) + ' ' + dataSet.FieldByName('unidade').AsString, []);
        vRel.Impf(vLinha, 079, 'Qtde Embalada: ' + Format( '%0.3f', [dataSet.FieldByName('QUANTIDADEPRODUZIDA').AsFloat]) + ' ' + dataSet.FieldByName('unidade').AsString, []);
        Inc(vLinha);
      end;

      vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
      Inc(vLinha);

      if vDadosIni.vEmp.vUsarProducao = 'D' then
      begin
        vRel.Impf(vLinha, 001, 'Formula: ' + vFormula.dataSet.FieldByName('PRODUTO').AsString, [negrito]);
        Inc(vLinha);

        vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
        Inc(vLinha);
      end;

    end;

  end;

  procedure _montarSubcabecalho(pIndice: Smallint);
  begin
    if pIndice = 1 then
    begin
      vRel.Impf(vLinha, 001, '  MATERIAS PRIMAS', [negrito]);
      Inc(vLinha);

      vRel.Impf(vLinha, 003, 'Codigo', []);
      vRel.Impf(vLinha, 018, 'Produto', []);
      if vFormula.dataSet.FieldByName('usar_solvente').AsString = 'S' then
        vRel.Impf(vLinha, 071, 'Qtde (%)', [])
      else
        vRel.Impf(vLinha, 075, 'Qtde', []);

      if vDadosIni.vEmp.vUsarProducao = 'D' then
        vRel.Impf(vLinha, 084, 'Qtde Teorica (' + Trim(dataSet.FieldByName('unidade').AsString)  + ')', [])
      else
        vRel.Impf(vLinha, 089, 'Qtde Teorica', []);

      if vDadosIni.vEmp.vUsarProducao = 'D' then
        vRel.Impf(vLinha, 106, 'Qtde Pratica (' + Trim(dataSet.FieldByName('unidade').AsString)  + ')', [])
      else
        vRel.Impf(vLinha, 111, 'Qtde Pratica', []);
      Inc(vLinha);

      vRel.Imp(vLinha, 003, vdadosini.replicate('-', vColunas - 2));
      Inc(vLinha);

    end
    else if pIndice = 2 then
    begin
      vRel.Impf(vLinha, 001, '    PRODUTO ACABADO', [negrito]);
      Inc(vLinha);

      vRel.Impf(vLinha, 005, 'Codigo', []);
      vRel.Impf(vLinha, 020, 'Produto', []);
      vRel.Impf(vLinha, 085, 'Qtde Teorica', []);
      vRel.Impf(vLinha, 111, 'Qtde Pratica', []);
      Inc(vLinha);
      vRel.Imp(vLinha, 005, vdadosini.replicate('-', vColunas - 4));
      Inc(vLinha);

    end;

  end;

begin
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
  vRel.OpcoesPreview.CaptionPreview := 'Ficha de Pedido de Produção';
  vRel.TitulodoRelatorio := 'Ficha de Pedido de Produção';
  vDadosIni._LimparVarSendEmail;
  vRel.OnSendMail := vDadosini._SendMailRdPrint;
  vRel.OpcoesPreview.Preview := True;
  if not vRel.EstaAberto then
    vRel.Abrir;

  vItemAcabado._abreItemAcabado(dataSet.FieldByName('cod_producao').AsInteger);
  vItemIndice._abreItemIndice(dataSet.FieldByName('cod_producao').AsInteger);
  vClientes._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger);
  vFormula._selecionaFormula(dataSet.FieldByName('cod_formula').AsInteger);

  _montarCabecalho;
  Inc(vLinha);

  // Matérias primas da produção detalhada
  vItemIndice._filtrarItemIndice(0);
  if (vDadosIni.vEmp.vUsarProducao = 'D') and (not vItemIndice.dataSet.IsEmpty) then
  begin

    _montarSubcabecalho(1);

    vItemIndice._filtrarItemIndice(0);
    vItemIndice.dataSet.First;
    while not vItemIndice.dataSet.Eof do
    begin
      if (vLinha + 0) >= vLinhasRel then
      begin
        vRel.Novapagina;
        _montarCabecalho;
        Inc(vLinha);

        _montarSubcabecalho(1);
      end;      

      vRel.Impf(vLinha, 003, Copy(Trim(vItemIndice.dataSet.FieldByName('num_fab_prod').AsString), 1, 14), []);
      vRel.Impf(vLinha, 018, Copy(Trim(vItemIndice.dataSet.FieldByName('descr_prod').AsString), 1, 40), []);
      vRel.Impf(vLinha, 060, vDadosIni.AlnDir(Format( '%0.6f', [vItemIndice.dataSet.FieldByName('QUANTIDADE_RECEITA').AsFloat]),19), []);
      vRel.Impf(vLinha, 082, vDadosIni.AlnDir(Format( '%0.6f', [vItemIndice.dataSet.FieldByName('QUANTIDADE_TEORICA').AsFloat]),19), []);
      if dataSet.FieldByName('status').AsString = 'FECHADO' then
        vRel.Impf(vLinha, 104, vDadosIni.AlnDir(Format( '%0.6f', [vItemIndice.dataSet.FieldByName('QUANTIDADE_UTILIZADA').AsFloat]),19), [])
      else
        vRel.Impf(vLinha, 104, '___________________', []);

      Inc(vLinha);
      vItemIndice.dataSet.Next;
    end;
    Inc(vLinha);

  end;

  // Produtos acabados e insumos da produção
  if not vItemAcabado.dataSet.IsEmpty then
  begin

    _montarSubcabecalho(2);

    vItemAcabado.dataSet.First;
    while not vItemAcabado.dataSet.Eof do
    begin
      if (vLinha + 0) >= vLinhasRel then
      begin
        vRel.Novapagina;
        _montarCabecalho;
        Inc(vLinha);

        _montarSubcabecalho(2);
      end;

      vRel.Impf(vLinha, 005, Copy(Trim(vItemAcabado.dataSet.FieldByName('num_fab_prod').AsString), 1, 14), [negrito]);
      vRel.Impf(vLinha, 020, Copy(Trim(vItemAcabado.dataSet.FieldByName('descr_prod').AsString), 1, 40), [negrito]);
      vRel.Impf(vLinha, 078, vDadosIni.AlnDir(Format( '%0.6f', [vItemAcabado.dataSet.FieldByName('quantidade').AsFloat]), 19), []);
      vRel.Impf(vLinha, 099, vItemAcabado.dataSet.FieldByName('unidade').AsString, []);
      Inc(vLinha);

      if vDadosIni.vEmp.vUsarProducao = 'D' then
        vRel.Impf(vLinha, 001, '    EMBALAGENS/OUTROS INSUMOS', [])
      else
        vRel.Impf(vLinha, 001, '    MATÉRIA PRIMA EMBALAGENS/OUTROS INSUMOS', []);
      Inc(vLinha);

      vItemIndice._filtrarItemIndice(vItemAcabado.dataSet.FieldByName('nitem').AsInteger);
      vItemIndice.dataSet.First;
      while not vItemIndice.dataSet.Eof do
      begin
        if (vLinha + 0) >= vLinhasRel then
        begin
          vRel.Novapagina;
          _montarCabecalho;
          Inc(vLinha);

          _montarSubcabecalho(2);
        end;
        vRel.Impf(vLinha, 005, Copy(Trim(vItemIndice.dataSet.FieldByName('num_fab_prod').AsString), 1, 14), []);
        vRel.Impf(vLinha, 020, Copy(Trim(vItemIndice.dataSet.FieldByName('descr_prod').AsString), 1, 40), []);
        vRel.Impf(vLinha, 078, vDadosIni.AlnDir(Format( '%0.6f', [vItemIndice.dataSet.FieldByName('QUANTIDADE_TEORICA').AsFloat]), 19), []);
        vRel.Impf(vLinha, 099, vItemIndice.dataSet.FieldByName('unidade').AsString, []);
        if dataSet.FieldByName('status').AsString = 'FECHADO' then
          vRel.Impf(vLinha, 104, vDadosIni.AlnDir(Format( '%0.6f', [vItemIndice.dataSet.FieldByName('QUANTIDADE_UTILIZADA').AsFloat]),19), [])
        else
          vRel.Impf(vLinha, 104, '___________________', []);
        Inc(vLinha);

        vItemIndice.dataSet.Next;
      end;
      Inc(vLinha);

      vItemAcabado.dataSet.Next;
    end;

  end;

  if (vLinha + 0) >= vLinhasRel then
  begin
    vRel.Novapagina;
    _montarCabecalho;
  end
  else
    vRel.Imp(vLinha, 001, vdadosini.replicate('-', vColunas));
  Inc(vLinha);

  if vDadosIni.vEmp.vUsarProducao = 'D' then
  begin
    // Impressao do texto adicional 1 da formula
    vListaTemp:= TStringList.Create;
    vListaTemp.Text := vFormula.dataSet.FieldByName('TEXTO_IMPRESSAO1').AsString;
    if Trim(vListaTemp.Text) <> ''  then
    begin
      for I := 0 to vListaTemp.Count - 1 do
      begin
        if (vLinha + 0) >= vLinhasRel then
        begin
          vRel.Novapagina;
          _montarCabecalho;
          Inc(vLinha);
        end;

        vRel.Impf(vLinha, 001, copy(vListaTemp[I],1, vColunas - 1), []);
        Inc(vLinha);
      end;
      if (vLinha + 0) >= vLinhasRel then
      begin
        vRel.Novapagina;
        _montarCabecalho;
      end
      else
        vRel.Imp(vLinha, 001, vdadosini.replicate('-', vColunas));
      Inc(vLinha);
    end;

    // Impressao do processo de produção da formula
    vRel.Impf(vLinha, 001, 'Descricao do Processo',[negrito]);
    Inc(vLinha);
    vListaTemp.Text := vFormula.dataSet.FieldByName('processo').AsString;
    if Trim(vListaTemp.Text) <> ''  then
    begin
      for I := 0 to vListaTemp.Count - 1 do
      begin
        if (vLinha + 0) >= vLinhasRel then
        begin
          vRel.Novapagina;
          _montarCabecalho;
          Inc(vLinha);
        end;

        vRel.Impf(vLinha, 001, copy(vListaTemp[I],1, vColunas - 1), []);
        Inc(vLinha);
      end;
      if (vLinha + 0) >= vLinhasRel then
      begin
        vRel.Novapagina;
        _montarCabecalho;
      end
      else
        vRel.Imp(vLinha, 001, vdadosini.replicate('-', vColunas));
      Inc(vLinha);
    end;


    // Impressao do texto adicional 2 da formula
    vListaTemp.Text := vFormula.dataSet.FieldByName('TEXTO_IMPRESSAO2').AsString;
    if Trim(vListaTemp.Text) <> ''  then
    begin
      for I := 0 to vListaTemp.Count - 1 do
      begin
        if (vLinha + 0) >= vLinhasRel then
        begin
          vRel.Novapagina;
          _montarCabecalho;
          Inc(vLinha);
        end;

        vRel.Impf(vLinha, 001, copy(vListaTemp[I],1, vColunas - 1), []);
        Inc(vLinha);
      end;
      if (vLinha + 0) >= vLinhasRel then
      begin
        vRel.Novapagina;
        _montarCabecalho;
      end
      else
        vRel.Imp(vLinha, 001, vdadosini.replicate('-', vColunas));
      Inc(vLinha);
    end;

  end;

  vRel.Fechar;

end;

function TProducao._iniciarProcessoDeProducao: Boolean;
begin
  try

    if not _producaoAberta then
      raiseExceptionCreate('Pedido de Produção não esta "ABERTO" para ser iniciado','');

    vItemAcabado._abreItemAcabado(dataSet.FieldByName('cod_producao').AsInteger);
    vItemIndice._abreItemIndice(dataSet.FieldByName('cod_producao').AsInteger);

    if vDadosIni.vEmp.vUsarProducao = 'S' then    
      if vItemAcabado.dataSet.IsEmpty then
        raiseExceptionCreate('Pedido de Produção sem Produtos Acabados para produzir','');

    if vItemIndice.dataSet.IsEmpty then
      raiseExceptionCreate('Pedido de Produção sem Matérias Primas ou Insumos para produzir','');

    dataSet.Edit;
    dataSet.FieldByName('STATUS').AsString := 'INICIADO';
    dataSet.FieldByName('DATA_INICIO').AsDateTime :=  vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('HORA_INICIO').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
    dataSet.Post;

    if Apply then
      CommitaTransacao;

    _atualizaInformacoesPedidoCompra;

    Application.MessageBox('Pedido de Produção Iniciado!', 'Atenção', 0 + 64);

    _imprimirFichaProducao;

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('Erro: ' + e.Message);
    end;
  end;
end;

procedure TProducao._inserirCodProducao(pDtset: TDataSet);
begin
  if (not (pDtset.IsEmpty)) then
  begin
    pDtset.First;
    while (not (pDtset.Eof)) do
    begin
      pDtset.Edit;
      pDtset.FieldByName('cod_producao').AsInteger :=
        dataSet.FieldByName('cod_producao').AsInteger;
      pDtset.Post;
      pDtset.Next;
    end;
  end;
end;

function TProducao._montarProducaoAPartirPedidoCompra: Boolean;
var
  vOK: Boolean;
  I: Integer;
begin
  Result := False;
  fDataSetT := TClientDataSet(dtmProducao.cdsTemp);

  fDataSetT.First;
  while not fDataSetT.Eof do
  begin
    if Trim(fDataSetT.FieldByName('cod_prod').AsString) = '' then
    begin
      Application.MessageBox('Existe algum item marcado em vermelho! Informe a mercadoria deste item para prosseguir',
        'Atenção', 0 + 64);
      Exit;
    end;
    fDataSetT.Next;
  end;
  
  if not Insert then
    Exit;                

  fDataSetT.First;
  while not fDataSetT.Eof do
  begin
    if vItemAcabado._jaExisteItemNaProducao(fDataSetT.FieldByName('grupo_prod').AsInteger,
                                            fDataSetT.FieldByName('grupo_prod').AsString,
                                            fDataSetT.FieldByName('cod_grade').AsInteger) then
    begin
      vItemAcabado.Edit;
      vItemAcabado.dataSet.FieldByName('quantidade').AsFloat :=
        vItemAcabado.dataSet.FieldByName('quantidade').AsFloat +
        fDataSetT.FieldByName('quantidade').AsFloat;
    end
    else
    begin
      vItemAcabado.vProdCons._selecionaProdutos(
        fDataSetT.FieldByName('grupo_prod').AsInteger,
        fDataSetT.FieldByName('cod_prod').AsString,
        fDataSetT.FieldByName('cod_grade').AsInteger);
      vItemAcabado.Insert;
      vItemAcabado.dataSet.FieldByName('grupo_prod').AsInteger := vItemAcabado.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger;
      vItemAcabado.dataSet.FieldByName('cod_prod').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('cod_prod').AsString;
      vItemAcabado.dataSet.FieldByName('num_fab_prod').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('num_fab_prod').AsString;
      vItemAcabado.dataSet.FieldByName('descr_prod').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('descr_prod').AsString;
      vItemAcabado.dataSet.FieldByName('unidade').AsString := vItemAcabado.vProdCons.dataSet.FieldByName('unidade').AsString;        
      vItemAcabado.dataSet.FieldByName('cod_grade').AsInteger := vItemAcabado.vProdCons.dataSet.FieldByName('cod_grade').AsInteger;
      if vItemAcabado.vProdCons.dataSet.FieldByName('peso_brut_prod').AsFloat > 0 then
        vItemAcabado.dataSet.FieldByName('peso_un').AsFloat := vDadosIni.StrToFloatFormat(vItemAcabado.vProdCons.dataSet.FieldByName('peso_brut_prod').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);
      vItemAcabado.dataSet.FieldByName('quantidade').AsFloat :=
        fDataSetT.FieldByName('quantidade').AsFloat;
      if vItemAcabado.dataSet.FieldByName('quantidade').AsFloat <= 0 then
        vItemAcabado.dataSet.FieldByName('quantidade').AsFloat := 1;
    end;
    vItemAcabado.dataSet.FieldByName('peso_util').AsFloat :=
      vItemAcabado.dataSet.FieldByName('peso_un').AsFloat *
      vItemAcabado.dataSet.FieldByName('quantidade').AsFloat;
    _salvarItemAcabado;

    vOK := True;
    for I := 0 to fListaPedidoCompra.Count - 1 do
      if (vDadosIni.getCampoPipe(fListaPedidoCompra[I],1) = fDataSetT.FieldByName('cod_empresa').AsString) and
        (vDadosIni.getCampoPipe(fListaPedidoCompra[I],2) = fDataSetT.FieldByName('num_ped').AsString) then
      begin
        vOK := False;
        Break;
      end;

    if vOK then
      fListaPedidoCompra.Add(
        fDataSetT.FieldByName('cod_empresa').AsString+'|'+
        fDataSetT.FieldByName('num_ped').AsString + '|');

    fDataSetT.Next;
  end;
  Result := True;
end;

function TProducao._producaoAberta: boolean;
begin
  Result := Trim(dataSet.FieldByName('status').AsString) = 'ABERTO';
end;

function TProducao._producaoCancelada: boolean;
begin
  Result := Trim(dataSet.FieldByName('status').AsString) = 'CANCELADO';
end;

function TProducao._producaoFechada: boolean;
begin
  Result := Trim(dataSet.FieldByName('status').AsString) = 'FECHADO';
end;

function TProducao._producaoIniciada: boolean;
begin
  Result := Trim(dataSet.FieldByName('status').AsString) = 'INICIADO';
end;

function TProducao._salvarItemAcabado: Boolean;
var
  vAcao, vFilter: string;
  I: Integer;
  vFiltered: Boolean;
  vBookmark: Pointer;
  Avariacao: TProdVariacao;
  Avar_item: TProdutos_pdc_var_it_class;
  Agrade_old: Integer;
  // usar esse objeto para localizar a variacao e atribuir o codigo da grade automaticamente se existir
begin
  // DUVIDA
  // Remover itens matyeria prima ou insumo
  // Quando alterar a qtde item acabado
  // Adicionar itens que foram removidos. sim ou nao
  //
  if vItemAcabado.dataSet.State = dsEdit then
    vAcao := 'ALTERAR'
  else if vItemAcabado.dataSet.State = dsInsert then
    vAcao := 'INCLUIR'
  else
    Exit;

  vItemAcabado.dataSet.FieldByName('cod_producao').AsInteger := fint('cod_producao');
  vItemAcabado.dataSet.FieldByName('quantidade').AsFloat := vItemAcabado.ffloat('quantidade', -6);

  vItemIndice.filterClear();
  vItemIndice.dataSet.First;
  if not vItemAcabado.Post then
  begin
    Result := False;
    Exit;
  end;

  if (vDadosIni.vEmp.vUsarProducao = 'S') then
  begin
    if vDadosIni.produtoAcabadoPrimaTemGrade(
      vItemAcabado.buscas,
      vItemAcabado.dataSet.FieldByName('grupo_prod').AsInteger,
      vItemAcabado.dataSet.FieldByName('cod_prod').AsString,
      0,
      '') then
    begin
      if vDadosIni.existeGradeProducao(
        vItemAcabado.buscas,
        vItemAcabado.dataSet.FieldByName('grupo_prod').AsInteger,
        vItemAcabado.dataSet.FieldByName('cod_prod').AsString,
        0,
        '') then
      begin
      	if not vDadosIni.vincularProdutoAcabadoMateriaPrima(
        	vItemAcabado.buscas,
          vItemAcabado.dataSet.FieldByName('grupo_prod').AsInteger,
          vItemAcabado.dataSet.FieldByName('cod_prod').AsString,
          0,
          0,
          '',
          0,
          true) then
            exit;
      end;
    end;
  end;

  //chamar aqui a criacao dos vinculos se não exisitr
  // metodo(vItemAcabado.fint('grupo_prod'), vItemAcabado.fstr('cod_prod'), vItemAcabado.fint('cod_grade'));

  Agrade_old := vItemAcabado.fint('cod_grade');
  if vItemAcabado.fint('cod_grade') <> vItemAcabado.grade_start then
    Agrade_old := vItemAcabado.grade_start;

  Avariacao := TProdVariacao.Create;
  try
    vItemIndice.vProdCons.fConsultaAdicional := '';
    vItemIndice.vProdCons._selecionaProdutosIndiceTecnico( vItemAcabado.fint('grupo_prod'), vItemAcabado.fstr('cod_prod'), vItemAcabado.fint('cod_grade'));
    if vAcao = 'INCLUIR' then
    begin

      I:= 0;
      vItemIndice.vProdCons.dataSet.First;
      while not vItemIndice.vProdCons.dataSet.Eof do
      begin
        Inc(I);

        vTipoItemTemp := vItemIndice.vProdCons._getTipoItem('');
        vTempString := vItemIndice.vProdCons.fstr('num_fab_prod') + ' ' + vItemIndice.vProdCons.fstr('descr_prod');

//        if (_existeEstoque(vItemIndice.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger,
//          vItemIndice.vProdCons.dataSet.FieldByName('cod_prod').AsString,
//          (vItemAcabado.dataSet.FieldByName('quantidade').AsFloat * vItemIndice.vProdCons.dataSet.FieldByName('quant').AsFloat) )) and
        if (vItemIndice.Insert) then
        begin
          vItemIndice.dataSet.FieldByName('cod_producao').AsInteger       := fint('cod_producao');
          vItemIndice.dataSet.FieldByName('nitem').AsInteger              := vItemAcabado.fint('nitem');
          vItemIndice.dataSet.FieldByName('nitem_ind').AsInteger          := vItemIndice.max_next;
          vItemIndice.dataSet.FieldByName('grupo_prod').AsInteger         := vItemIndice.vProdCons.fint('grupo_prod');
          vItemIndice.dataSet.FieldByName('cod_prod').AsString            := vItemIndice.vProdCons.fstr('cod_prod');
          vItemIndice.dataSet.FieldByName('cod_grade').AsInteger          := vItemIndice.vProdCons.fint('cod_grade');
          vItemIndice.dataSet.FieldByName('num_fab_prod').AsString        := vItemIndice.vProdCons.fstr('num_fab_prod');
          vItemIndice.dataSet.FieldByName('descr_prod').AsString          := vItemIndice.vProdCons.fstr('descr_prod');
          vItemIndice.dataSet.FieldByName('unidade').AsString             := vItemIndice.vProdCons.fstr('unidade');
          vItemIndice.dataSet.FieldByName('tipo_item').AsString           := vItemIndice.vProdCons.fstr('tipo_item');
          vItemIndice.dataSet.FieldByName('prec_cusm_prod').AsFloat       := vItemIndice.vProdCons.ffloat('prec_cusm_prod');
          vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat   := vItemIndice.vProdCons.ffloat('quant', -6);
          vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat := RoundTo(vItemAcabado.ffloat('quantidade') * vItemIndice.ffloat('quantidade_receita'), -6);
          vItemIndice.dataSet.FieldByName('quantidade_teorica').AsFloat   := vItemIndice.ffloat('quantidade_utilizada');
          vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat     := 0;
          vItemIndice.dataSet.FieldByName('peso_un').AsFloat              := RoundTo(vItemIndice.vProdCons.ffloat('peso_brut_prod'), 0 -vDadosIni.vEmp.vPrecisaoProducao);
          vItemIndice.dataSet.FieldByName('peso_util').AsFloat            := RoundTo(vItemIndice.ffloat('peso_un')* vItemIndice.ffloat('quantidade_utilizada'), 0 -vDadosIni.vEmp.vPrecisaoProducao);
          vItemIndice.dataSet.FieldByName('seq').AsInteger                := vItemAcabado.fint('seq');
          vItemIndice.dataSet.FieldByName('seqn').AsInteger               := I;

          {
          Avariacao.Clear;
          Avariacao.current := Avariacao.getVariacaoDB(vItemAcabado.fint('grupo_prod'), vItemAcabado.fstr('cod_prod'), vItemAcabado.fint('cod_grade'));
          if Assigned(Avariacao.current) then
          begin
            Avar_item := Avariacao.current.itens.getVariacaoItem(vItemIndice.fint('grupo_prod'), vItemIndice.fstr('cod_prod'));
            if Assigned(Avar_item) then
              vItemIndice.setGrade(Avar_item.cod_grade)
          end;
          }

          vItemIndice.dataSet.Post;

        end;

        vItemIndice.vProdCons.dataSet.Next;
      end;

    end
    else if vAcao = 'ALTERAR' then
    begin
      vItemIndice._filtrarItemIndice(vItemAcabado.dataSet.FieldByName('nitem').AsInteger);

      // Atualizando os valores dos indices
      vItemIndice.dataSet.First;
      while not vItemIndice.dataSet.Eof do
      begin
        vItemIndice.vProdCons._filtrarProdutosIndiceTecnico(vItemIndice.fint('grupo_prod'), vItemIndice.fstr('cod_prod'), vItemIndice.fint('cod_grade'));
        if not vItemIndice.vProdCons.str_empty('cod_prod') then
        begin
          vBookmark := vItemIndice.dataSet.GetBookmark;
          vTipoItemTemp := vItemIndice.vProdCons._getTipoItem(vItemIndice.dataSet.FieldByName('tipo_item').AsString);
          vTempString := Trim(vItemIndice.dataSet.FieldByName('num_fab_prod').AsString) + ' ' +
            Trim(vItemIndice.dataSet.FieldByName('descr_prod').AsString);
//          if (_existeEstoque(vItemIndice.dataSet.FieldByName('grupo_prod').AsInteger,
//            vItemIndice.dataSet.FieldByName('cod_prod').AsString,
//            ( (vDadosIni.StrToFloatFormat(vItemAcabado.dataSet.FieldByName('quantidade').AsFloat *
//              vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat, 6) -
//              vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat)
//            ))) then
          begin
            vItemIndice.dataSet.GotoBookmark(vBookmark);
            vItemIndice.dataSet.Edit;
            vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat   := vItemIndice.vProdCons.ffloat('quant', -6);
            vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat := RoundTo(vItemAcabado.ffloat('quantidade') * vItemIndice.ffloat('quantidade_receita'), -6);
            vItemIndice.dataSet.FieldByName('quantidade_teorica').AsFloat   := vItemIndice.ffloat('quantidade_utilizada');
            vItemIndice.dataSet.FieldByName('peso_util').AsFloat            := RoundTo(vItemIndice.ffloat('peso_un') * vItemIndice.ffloat('quantidade_utilizada'), 0 - vDadosIni.vEmp.vPrecisaoProducao);

            {
            if vItemAcabado.fint('cod_grade') <> Agrade_old then
            begin
              vItemIndice.dataSet.FieldByName('cod_grade').AsInteger       := 0;
              Avariacao.Clear;
              Avariacao.current := Avariacao.getVariacaoDB(vItemAcabado.fint('grupo_prod'), vItemAcabado.fstr('cod_prod'), vItemAcabado.fint('cod_grade'));
              if Assigned(Avariacao.current) then
              begin
                Avar_item := Avariacao.current.itens.getVariacaoItem(vItemIndice.fint('grupo_prod'), vItemIndice.fstr('cod_prod'));
                if Assigned(Avar_item) then
                  vItemIndice.setGrade(Avar_item.cod_grade)
              end;
            end;
            }

            vItemIndice.dataSet.Post;
          end;
          vItemIndice.dataSet.GotoBookmark(vBookmark);
        end;

        vItemIndice.dataSet.Next;
      end;

      // Adicionando os indices que foram removidos
      // O que fazer? Quando remover um indice (materia prima ou insumo) adicionalo novamente nao alteracao
      // ou não fazer nada e deixar o item sem inclui-lo
      I := vItemIndice.dataSet.RecordCount;
      vItemIndice.vProdCons.dataSet.Filtered := False;
      vItemIndice.vProdCons.dataSet.First;
      while not vItemIndice.vProdCons.dataSet.Eof do
      begin
        vFilter := vItemIndice.dataSet.Filter;
        vFiltered := vItemIndice.dataSet.Filtered;

        vItemIndice._filtrarItemIndice(vItemIndice.dataSet.FieldByName('nitem').AsInteger,
          vItemIndice.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger,
          vItemIndice.vProdCons.dataSet.FieldByName('cod_prod').AsString);
        if Trim(vItemIndice.dataSet.FieldByName('cod_prod').AsString) = '' then
        begin

          vTipoItemTemp := vItemIndice.vProdCons._getTipoItem('');
          vTempString := Trim(vItemIndice.vProdCons.dataSet.FieldByName('num_fab_prod').AsString) + ' ' +
            Trim(vItemIndice.vProdCons.dataSet.FieldByName('descr_prod').AsString);

//          if (_existeEstoque(vItemIndice.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger,
//            vItemIndice.vProdCons.dataSet.FieldByName('cod_prod').AsString,
//            (vItemAcabado.dataSet.FieldByName('quantidade').AsFloat * vItemIndice.vProdCons.dataSet.FieldByName('quant').AsFloat) )) and
            if (vItemIndice.Insert) then
          begin
            Inc(I);
            vItemIndice.dataSet.FieldByName('cod_producao').AsInteger       := fint('cod_producao');
            vItemIndice.dataSet.FieldByName('nitem').AsInteger              := vItemAcabado.fint('nitem');
            vItemIndice.dataSet.FieldByName('nitem_ind').AsInteger          := vItemIndice.max_next;
            vItemIndice.dataSet.FieldByName('grupo_prod').AsInteger         := vItemIndice.vProdCons.fint('grupo_prod');
            vItemIndice.dataSet.FieldByName('cod_prod').AsString            := vItemIndice.vProdCons.fstr('cod_prod');  
            vItemIndice.dataSet.FieldByName('cod_grade').AsInteger          := vItemIndice.vProdCons.fint('cod_grade');
            vItemIndice.dataSet.FieldByName('num_fab_prod').AsString        := vItemIndice.vProdCons.fstr('num_fab_prod');
            vItemIndice.dataSet.FieldByName('descr_prod').AsString          := vItemIndice.vProdCons.fstr('descr_prod');
            vItemIndice.dataSet.FieldByName('unidade').AsString             := vItemIndice.vProdCons.fstr('unidade');
            vItemIndice.dataSet.FieldByName('tipo_item').AsString           := vItemIndice.vProdCons.fstr('tipo_item');
            vItemIndice.dataSet.FieldByName('prec_cusm_prod').AsFloat       := vItemIndice.vProdCons.ffloat('prec_cusm_prod');
            vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat   := vItemIndice.vProdCons.ffloat('quant', -6);
            vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat := RoundTo(vItemAcabado.ffloat('quantidade') * vItemIndice.ffloat('quantidade_receita'), -6);
            vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat     := 0;
            vItemIndice.dataSet.FieldByName('peso_un').AsFloat              := vItemIndice.vProdCons.ffloat('peso_brut_prod', 0 - vDadosIni.vEmp.vPrecisaoProducao);
            vItemIndice.dataSet.FieldByName('peso_util').AsFloat            := RoundTo(vItemIndice.ffloat('peso_un') * vItemIndice.ffloat('quantidade_utilizada'), 0 - vDadosIni.vEmp.vPrecisaoProducao);
            vItemIndice.dataSet.FieldByName('seq').AsInteger                := vItemAcabado.fint('seq');
            vItemIndice.dataSet.FieldByName('seqn').AsInteger               := I;

            {
            Avariacao.Clear;
            Avariacao.current := Avariacao.getVariacaoDB(vItemAcabado.fint('grupo_prod'), vItemAcabado.fstr('cod_prod'), vItemAcabado.fint('cod_grade'));
            if Assigned(Avariacao.current) then
            begin
              Avar_item := Avariacao.current.itens.getVariacaoItem(vItemIndice.fint('grupo_prod'), vItemIndice.fstr('cod_prod'));
              if Assigned(Avar_item) then
                vItemIndice.setGrade(Avar_item.cod_grade)
            end;
            }

            vItemIndice.dataSet.Post;
          end;

        end;

        vItemIndice.dataSet.Filter := vFilter;
        vItemIndice.dataSet.Filtered := vFiltered;

        vItemIndice.vProdCons.dataSet.Next;
      end;

    end;

    if Assigned(FvalidateGradesIndices) then
      FvalidateGradesIndices(Self);

    _somarPesoTotalProdutoAcabado;

    Result := True;

  finally
    FreeAndNil(Avariacao);    
  end;
end;

function TProducao._salvarItemIndice(pProducao: Boolean = False): Boolean;
var
  vAcao: string;
  I: Integer;
  vQtdeUt: Extended;
  vQtdePerda: Extended;
begin
  if vItemIndice.dataSet.State = dsEdit then
    vAcao := 'ALTERAR'
  else if vItemIndice.dataSet.State = dsInsert then
    vAcao := 'INCLUIR'
  else
    Exit;

  vQtdeUt := vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat;
  vQtdePerda := vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat;

  vItemIndice.dataSet.FieldByName('cod_producao').AsInteger :=
    dataSet.FieldByName('cod_producao').AsInteger;
  if pProducao then
    vItemIndice.dataSet.FieldByName('nitem').AsInteger := 0
  else
    vItemIndice.dataSet.FieldByName('nitem').AsInteger :=
      vItemAcabado.dataSet.FieldByName('nitem').AsInteger;
  vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat :=
    vDadosIni.StrToFloatFormat(vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat,6);
  vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat :=
    vDadosIni.StrToFloatFormat(vItemIndice.dataSet.FieldByName('quantidade_perda').AsFloat,6);
  vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat :=
    vDadosIni.StrToFloatFormat(vItemIndice.dataSet.FieldByName('quantidade_receita').AsFloat,6);

  vItemIndice.dataSet.FieldByName('peso_util').AsFloat := vDadosIni.StrToFloatFormat(
    vItemIndice.dataSet.FieldByName('peso_un').AsFloat *
    vItemIndice.dataSet.FieldByName('quantidade_utilizada').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);

  if vItemIndice.Post then
  begin
    Result := True;
    if vAcao = 'INCLUIR' then
      vItemIndice.ajustar_seq(vItemAcabado.fint('nitem'), vItemAcabado.fint('seq'));

    _somarPesoTotalIndice;
  end
  else
    Result := False;
end;

function TProducao._salvarQtdeFinalItemAcabado: Boolean;
begin
  if not vItemAcabado.Post then
  begin
    Result := False;
    Exit;
  end;

  Result := True;

  _somarPesoTotalProdutoAcabado;
end;

procedure TProducao._somarPesoTotalIndice;
var
  vQuantidadeproducao: Extended;
begin
  if not (dataSet.State in [dsinsert, dsEdit]) then
    Exit;

  vQuantidadeproducao := 0;
  vItemIndice.dataSet.First;
  while not vItemIndice.dataSet.Eof do
  begin
    if vItemIndice.dataSet.FieldByName('nitem').AsInteger = 0 then
      vQuantidadeproducao := vQuantidadeproducao +
        vItemIndice.dataSet.FieldByName('peso_util').AsFloat;
    vItemIndice.dataSet.Next;
  end;
  if vQuantidadeproducao > 0 then
    dataSet.FieldByName('quantidadeproducao').AsFloat := vDadosIni.StrToFloatFormat(vQuantidadeproducao, 3);
end;

procedure TProducao._somarPesoTotalProdutoAcabado;
var
  vQuantidadeproducao: Extended;
begin
  if not (dataSet.State in [dsinsert, dsEdit]) then
    Exit;

  vQuantidadeproducao := 0;
  vItemAcabado.prepare_loop();
  try
    while not vItemAcabado.dataSet.Eof do
    begin
      vQuantidadeproducao := vQuantidadeproducao +
        vItemAcabado.dataSet.FieldByName('peso_util').AsFloat;
      vItemAcabado.dataSet.Next;
    end;
    if vQuantidadeproducao > 0 then
      dataSet.FieldByName('quantidadeproduzida').AsFloat := vDadosIni.StrToFloatFormat(vQuantidadeproducao, 3);
  finally
    vItemAcabado.prepare_loop_done;
  end;
end;

function TProducao._validarPendenciasEmEstoque: Boolean;
var
  vBookmark: Pointer;
  vDtSet: TClientDataSet;
  vLista: TStringList;
  I: Integer;
  vOK: Boolean;
  Aestoque: TEstoqueProds;
  Aest: TCod_grade_prod_class;
  Adisp: Double;
begin
  Result := True;
  Aestoque := TEstoqueProds.Create;
  vItemIndice.prepare_loop();
  try
    ProgressUtil.Msg('Validando estoque');

    while not vItemIndice.dataSet.Eof do
    begin
      Aest := Aestoque.getEstoque(vItemIndice.fint('grupo_prod'), vItemIndice.fstr('cod_prod'), vItemIndice.fint('cod_grade'));
      if Assigned(Aest) then
        Aest.qtde := Aest.qtde + vItemIndice.ffloat('quantidade_utilizada') + vItemIndice.ffloat('quantidade_perda')
      else
        with Aestoque.New do
        begin
          grupo_prod := vItemIndice.fint('grupo_prod');
          cod_prod   := vItemIndice.fstr('cod_prod');
          cod_grade  := vItemIndice.fint('cod_grade');
          qtde       := vItemIndice.ffloat('quantidade_utilizada') + vItemIndice.ffloat('quantidade_perda');
        end;
      vItemIndice.dataSet.Next;
    end;

    ProgressUtil.MaxProgress(vItemIndice.dataSet.RecordCount + Aestoque.Count);

    for I := 0 to Pred(Aestoque.Count) do with Aestoque.Items[I] do
    begin
      ProgressUtil.IncProgress;
      Adisp := vDadosIni.getEstoqueDisponivel(buscas, grupo_prod, cod_prod, cod_grade, fint('cod_producao'), 'PRODUCAO');
      if RoundTo(Adisp, -6) < RoundTo(qtde, -6) then
      begin
        Aestoque.Items[I].ativo := -1;
        Result := False;
      end;
    end;

    vItemIndice.dataSet.First;
    while not vItemIndice.dataSet.Eof do
    begin
      ProgressUtil.IncProgress;
      vItemIndice.dataSet.Edit;
      vItemIndice.dataSet.FieldByName('SEM_ESTOQUE').AsString := 'N';
      Aest := Aestoque.getEstoque(vItemIndice.fint('grupo_prod'), vItemIndice.fstr('cod_prod'), vItemIndice.fint('cod_grade'));
      if Assigned(Aest) then
        if Aest.ativo = -1 then
          vItemIndice.dataSet.FieldByName('SEM_ESTOQUE').AsString := 'S';
      vItemIndice.dataSet.Post;
      vItemIndice.dataSet.Next;
    end;
  finally
    vItemIndice.prepare_loop_done;
    FreeAndNil(Aestoque);
  end;


  Exit;
  Result := True;

//  vDtSet := TClientDataSet.Create(Application);
//  vDtSet.field

  vLista := TStringList.Create;
  vLista.Text := '';
  vItemIndice.dataSet.Filtered := False;
  vItemIndice.dataSet.First;
  while not vItemIndice.dataSet.Eof do
  begin
    vOK := True;
    for I := 0 to vLista.Count - 1 do
      if (vDadosIni.getCampoPipe(vLista[I],1) = vItemIndice.dataSet.FieldByName('grupo_prod').AsString) and
        (Trim(vDadosIni.getCampoPipe(vLista[I],2)) = Trim(vItemIndice.dataSet.FieldByName('cod_prod').AsString)) then
      begin
        vOK := False;
        Break;
      end;             

    if vOK then
      vLista.Add(
        vItemIndice.dataSet.FieldByName('grupo_prod').AsString+'|'+
        Trim(vItemIndice.dataSet.FieldByName('cod_prod').AsString)+'|N|');

    vItemIndice.dataSet.Next;
  end;

  for I := 0 to vLista.Count - 1 do
  begin
    if not _existeEstoque(
      StrToInt(Trim(vDadosIni.getCampoPipe(vLista[I],1))),
      vDadosIni.getCampoPipe(vLista[I],2),0) then
    begin
      vLista[I] := vDadosIni.getCampoPipe(vLista[I],1) + '|'+ vDadosIni.getCampoPipe(vLista[I],2) +'|S|';
      Result := False;
    end;
  end;

  for I := 0 to vLista.Count - 1 do
  begin
    vItemIndice._filtrarItemIndice(StrToInt(Trim(vDadosIni.getCampoPipe(vLista[I],1))),
      vDadosIni.getCampoPipe(vLista[I],2));
    vItemIndice.dataSet.First;
    while not vItemIndice.dataSet.Eof do
    begin
      vItemIndice.dataSet.Edit;
      vItemIndice.dataSet.FieldByName('SEM_ESTOQUE').AsString := vDadosIni.getCampoPipe(vLista[I],3);
      vItemIndice.dataSet.Post;
      vItemIndice.dataSet.Next;
    end;
  end;

  vItemIndice.dataSet.Filtered := False;
  vItemIndice.dataSet.First;
  Exit;

  while not vItemIndice.dataSet.Eof do
  begin
    vBookmark := vItemIndice.dataSet.GetBookmark;
    if _existeEstoque(vItemIndice.dataSet.FieldByName('grupo_prod').AsInteger,
      vItemIndice.dataSet.FieldByName('cod_prod').AsString, 0) then
    begin
      vItemIndice.dataSet.Edit;
      vItemIndice.dataSet.FieldByName('SEM_ESTOQUE').AsString := 'N';
      vItemIndice.dataSet.Post;
    end
    else
    begin
      vItemIndice.dataSet.Edit;
      vItemIndice.dataSet.FieldByName('SEM_ESTOQUE').AsString := 'S';
      vItemIndice.dataSet.Post;
      Result := False;
    end;
    vItemIndice.dataSet.Filtered := False;
    vItemIndice.dataSet.GotoBookmark(vBookmark);
    vItemIndice.dataSet.Next;
  end;

end;

{ TProducaoItemAcabado }

destructor TProducaoItemAcabado.Destroy;
begin
  vProdCons.Free;
  vProdCons := nil;
  inherited;
end;

function TProducaoItemAcabado.edit: Boolean;
begin
  Result := false;
  Fgrade_start := 0;

  if dataSet.IsEmpty then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    Fgrade_start := fint('cod_grade');
  end;
end;

function TProducaoItemAcabado.insert(Anitem: Integer): Boolean;
begin                     
  Result := False;
  Fgrade_start := 0;
  if inherited Insert then
  begin
    Result := True;
    //dataSet.FieldByName('NITEM').AsInteger := dataSet.RecordCount + 1;
    if Anitem = 0 then
      Fmax := Fmax + 1;

    dataSet.FieldByName('nitem').AsInteger      := IfThen(Anitem = 0, Fmax, Anitem);
    dataSet.FieldByName('seq').AsInteger        := dataSet.RecordCount + 1;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('peso_un').AsFloat      := 1;
    dataSet.FieldByName('cod_grade').AsInteger  := 0;
  end;
end;

function TProducaoItemAcabado.post: Boolean;
begin
  Result := False;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.FieldByName('quantidade').AsFloat <= 0 then
      raiseExceptionCreate('Quantidade não informada ou inválida', 'DBEdit9');

    if Trim(dataSet.FieldByName('cod_prod').AsString) = '' then
      raiseExceptionCreate('Produto não informado', 'DBEdit7');

    vProdCons.fConsultaAdicional := '';
    if not vProdCons._selecionaProdutosIndiceTecnico(
      dataSet.FieldByName('grupo_prod').AsInteger,
      dataSet.FieldByName('cod_prod').AsString,
      dataSet.FieldByName('cod_grade').AsInteger) then
      Application.MessageBox(pchar('Produto selecionado sem matéria prima/insumo na tabela de Receitas/Índice Técnico' + #13+
        'As matérias primas/Isumos deverão ser inseridas manualmente'), 'Atenção', 0 + 64);

    if Fgrade_start <> fint('cod_grade') then
    begin
      vProdCons._selecionaProdutos(fint('grupo_prod'), fstr('cod_prod'), fint('cod_grade'));
      if (fint('cod_grade') > 0) and (Length(vProdCons.fstr('descr_prod')) > 75) then
        dataSet.FieldByName('descr_prod').AsString := Format('%s - %s',
                                                             [Copy(vProdCons.fstr('dprod'), 1, 72 - Length(vProdCons.fstr('dgrade'))),
                                                              vProdCons.fstr('dgrade')])
      else
        dataSet.FieldByName('descr_prod').AsString := vProdCons.fstr('descr_prod');
    end;
        
    Result := inherited Post;    

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TProducaoItemAcabado.validar_grades(AgoFirst: Boolean): Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
  begin
    Result := True;
    Exit;
  end;
  if AgoFirst  then
    dataSet.First;
  while dataSet.Eof do
  begin
    vProdCons._selecionaProdutos(fint('grupo_prod'), fstr('cod_prod'), fint('cod_grade'));

    if vProdCons.dataSet.RecordCount > 1 then
      Exit;

    dataSet.Next;
  end;
  Result := True;
end;

function TProducaoItemAcabado._abreItemAcabado(pCodProducao: Integer): Boolean;
begin
  Result := montaSelect('select it.* from producao_item it ' +
    ' where it.cod_producao = ' + IntToStr(pCodProducao) +
    ' and it.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by it.nitem');

  Fmax := 0;
  prepare_loop();
  try
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('seq').IsNull then
      begin
        dataSet.Edit;
        dataSet.FieldByName('seq').AsInteger := dataSet.RecNo;
        dataSet.Post;
      end;

      Fmax := IfThen(Fmax < fint('nitem'), fint('nitem'), Fmax);
      dataSet.Next;
    end;
  finally
    prepare_loop_done;
  end;

end;

function TProducaoItemAcabado._existeProduto(vValorConsulta: string): Boolean;
var
  vAcao: string;
  vQtde: Double;
  Anitem: Integer;
begin

  Result := False;

  if dataSet.State = dsEdit then
    vAcao := 'ALTERAR'
  else if dataSet.State = dsInsert then
    vAcao := 'INCLUIR'
  else
    Exit;

  vProdCons.fConsultaAdicional := ' and p.tipo_item = ''04''';
  if vProdCons._buscaProduto(vValorConsulta, True) then
  begin
    if vAcao = 'INCLUIR' then
    begin
      vQtde := dataSet.FieldByName('quantidade').AsFloat;
      Anitem := fint('nitem');
      dataSet.Cancel;
      if _jaExisteItemNaProducao(vProdCons.fint('grupo_prod'), vProdCons.fstr('cod_prod'), vProdCons.fint('cod_grade')) then
      begin
        Result := False;
        Application.MessageBox(pchar('Produto informado já existe nesta Produção' + #13 +
          'Por favor use o produto existente'), 'Atenção', 0 + 64);

        if not Insert(Anitem) then
          Exit;
        dataSet.FieldByName('quantidade').AsFloat := vQtde;
        Exit;
      end
      else
      begin
        if not Insert(Anitem) then
          Exit;
        dataSet.FieldByName('quantidade').AsFloat := vQtde;
      end;
    end;

    dataSet.FieldByName('grupo_prod').AsInteger := vProdCons.dataSet.FieldByName('grupo_prod').AsInteger;
    dataSet.FieldByName('cod_prod').AsString := vProdCons.dataSet.FieldByName('cod_prod').AsString;
    dataSet.FieldByName('num_fab_prod').AsString := vProdCons.dataSet.FieldByName('num_fab_prod').AsString;
    dataSet.FieldByName('descr_prod').AsString := vProdCons.dataSet.FieldByName('descr_prod').AsString;
    dataSet.FieldByName('unidade').AsString := vProdCons.dataSet.FieldByName('unidade').AsString;
    if vProdCons.dataSet.FieldByName('peso_brut_prod').AsFloat > 0 then
      dataSet.FieldByName('peso_un').AsFloat := vDadosIni.StrToFloatFormat(vProdCons.dataSet.FieldByName('peso_brut_prod').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);
    if dataSet.FieldByName('quantidade').AsFloat <= 0 then
      dataSet.FieldByName('quantidade').AsFloat := 1;
    dataSet.FieldByName('cod_grade').AsInteger := vProdCons.dataSet.FieldByName('cod_grade').AsInteger;
    Result := True;
  end
  else
  begin
    dataSet.FieldByName('grupo_prod').Value := Null;
    dataSet.FieldByName('cod_prod').Value := Null;
    dataSet.FieldByName('num_fab_prod').Value := Null;
    dataSet.FieldByName('descr_prod').Value := Null;
    dataSet.FieldByName('cod_grade').Value := Null;
  end;

end;

function TProducaoItemAcabado._jaExisteItemNaProducao(pGrupoProd: integer;
  pCodProd: string; Acod_grade: Integer): Boolean;
begin
  Result := False;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if (pGrupoProd = fint('grupo_prod')) and (Trim(pCodProd) = Trim(fstr('cod_prod'))) and (Acod_grade = fint('cod_grade')) then
    begin
      Result := True;
      Break;
    end;    
    dataSet.Next;
  end;
end;

constructor TProducaoItemAcabado.create(Aowner: TProducao);
begin
  if dtmProducao = nil then
    dtmProducao := TdtmProducao.Create(dtmProducao);
  DataSet := TClientDataSet(dtmProducao.cdsItemAcab);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);
  FOwner := Aowner;

  vProdCons := TProdutoConsulta.create;
  IndexFieldNames := 'NITEM';

  if vDadosIni.vEmp.vPrecisaoProducao > 0 then
  begin
    TFloatField(dataSet.FieldByName('peso_un')).DisplayFormat := '#0.' + vDadosIni.StrZero('0', vDadosIni.vEmp.vPrecisaoProducao);
    TFloatField(dataSet.FieldByName('peso_util')).DisplayFormat := TFloatField(dataSet.FieldByName('peso_un')).DisplayFormat;
  end;
end;

procedure TProducaoItemAcabado.ajustar_seq;
begin
  prepare_loop();
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('seq').AsInteger := dataSet.RecNo;
      dataSet.Post;

      FOwner.vItemIndice.ajustar_seq(fint('nitem'), dataSet.RecNo);

      dataSet.Next;
    end;

  finally
    prepare_loop_done;
  end;
end;

{ TProducaoItemIndice }

constructor TProducaoItemIndice.create(Aowner: TProducao);
begin
  if dtmProducao = nil then
    dtmProducao := TdtmProducao.Create(dtmProducao);
  DataSet := TClientDataSet(dtmProducao.cdsitemInd);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);
  FOwner := Aowner;

  vProdCons := TProdutoConsulta.create;
  IndexFieldNames := 'NITEM;NITEM_IND';
  dataSet.OnCalcFields := _dataSetCalcFields;

  if vDadosIni.vEmp.vPrecisaoProducao > 0 then
  begin
    TFloatField(dataSet.FieldByName('peso_un')).DisplayFormat := '#0.' + vDadosIni.StrZero('0', vDadosIni.vEmp.vPrecisaoProducao);
    TFloatField(dataSet.FieldByName('peso_util')).DisplayFormat := TFloatField(dataSet.FieldByName('peso_un')).DisplayFormat;
    TFloatField(dataSet.FieldByName('peso_formula')).DisplayFormat := TFloatField(dataSet.FieldByName('peso_un')).DisplayFormat;
    TFloatField(dataSet.FieldByName('peso_perda')).DisplayFormat := TFloatField(dataSet.FieldByName('peso_un')).DisplayFormat;
    TFloatField(dataSet.FieldByName('peso_teorico')).DisplayFormat := TFloatField(dataSet.FieldByName('peso_un')).DisplayFormat;
  end;

end;

function TProducaoItemIndice.delete: Boolean;
var
  Aseq, Anitem: Integer;
begin


  Result := False;
  if dataSet.IsEmpty then
    exit;

  if Application.MessageBox('Deseja realmente excluir o registro ?', 'Atenção',
      MB_ICONINFORMATION + MB_YESNO) <> IDYES then
    Exit;

  Anitem := fint('nitem');
  Aseq   := fint('seq');
  if inherited Delete then
  begin
    //_ajustaNItem;
    ajustar_seq(Anitem, Aseq);
    Result := True;
  end;

end;

destructor TProducaoItemIndice.Destroy;
begin
  vProdCons.Free;
  vProdCons := nil;
  inherited;
end;

function TProducaoItemIndice.edit: Boolean;
begin
  Result := false;
  Fgrade_start := 0;

  if dataSet.IsEmpty then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    Fgrade_start := fint('cod_grade');
  end;
end;

function TProducaoItemIndice.insert: Boolean;
begin
  Result := False;
  Fgrade_start := 0;
  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('peso_un').AsFloat      := 1;
    dataSet.FieldByName('cod_grade').AsInteger  := 0;
    Result := True;
  end;
end;

function TProducaoItemIndice.max_next: Integer;
begin
  Fmax := Fmax + 1;
  Result := Fmax;
end;

function TProducaoItemIndice.post: Boolean;
var
  vMensagem: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if Fgrade_start <> fint('cod_grade') then
    begin
      vProdCons._selecionaProdutos(fint('grupo_prod'), fstr('cod_prod'), fint('cod_grade'));
      if (fint('cod_grade') > 0) and (Length(vProdCons.fstr('descr_prod')) > 75) then
        dataSet.FieldByName('descr_prod').AsString := Format('%s - %s',
                                                             [Copy(vProdCons.fstr('dprod'), 1, 72 - Length(vProdCons.fstr('dgrade'))),
                                                              vProdCons.fstr('dgrade')])
      else
        dataSet.FieldByName('descr_prod').AsString := vProdCons.fstr('descr_prod');
    end;

    Result := inherited post;

    if Result then
    begin
      if vUltimoProcesso = 'PPR011' then
        vMensagem := ' GRUPO: ' + dataSet.FieldByName('grupo_prod').AsString +
          ' CODIGO: ' + trim(dataSet.FieldByName('cod_prod').AsString) +
          ' NUM FAB: ' + trim(dataSet.FieldByName('num_fab_prod').AsString) +
          ' NOVA QTDE: ' + Format('%0.6f',[dataSet.FieldByName('quantidade_utilizada').AsFloat])
      else
        vMensagem := ' GRUPO: ' + dataSet.FieldByName('grupo_prod').AsString +
          ' CODIGO: ' + trim(dataSet.FieldByName('cod_prod').AsString) +
          ' NUM FAB: ' + trim(dataSet.FieldByName('num_fab_prod').AsString) +
          ' NOVA PERDA: ' + Format('%0.6f',[dataSet.FieldByName('quantidade_perda').AsFloat]);

      if vUltimoProcesso = '' then
        vUltimoProcesso := 'PPR015';
                                                          
      vDadosIni.GravaAuditoria(vUltimoProcesso, 'ALTERAR', vMensagem, 'PRODUCAO_ITEM_INDICE',
        dataSet.FieldByName('COD_PRODUCAO').AsString, buscas);
      vUltimoProcesso := '';
    end;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

procedure TProducaoItemIndice.setGrade(Acod_grade: Integer);
begin
  if dataSet.State in [dsEdit, dsInsert] then
    if not SqlOpen('select cgp.cod_grade, rtrim(p.descr_prod) || case when g.descricao is null then '''' else '' - '' || g.descricao end descr_prod from produtos p' +
                   ' left join cod_grade_prod cgp on (p.grupo_prod = cgp.grupo_prod) and (p.cod_prod = cgp.cod_prod) and (p.cod_empresa = cgp.cod_empresa)' +
                   '   and (cgp.cod_grade = %d)' +
                   ' left join grade g on (cgp.cod_grade = g.cod_grade) and (cgp.cod_empresa = g.cod_empresa)' +
                   ' where p.grupo_prod = %d and p.cod_prod = %s and p.cod_empresa = %s',
                   [Acod_grade, fint('grupo_prod'), QuotedStr(fstr('cod_prod')), vDadosIni.codEmpresa]).IsEmpty then
    begin
      dataSet.FieldByName('cod_grade').AsInteger := buscas.FieldByName('cod_grade').AsInteger;
      dataSet.FieldByName('descr_prod').AsString := buscas.FieldByName('descr_prod').AsString;
    end;
end;

function TProducaoItemIndice.validar_grades(AgoFirst: Boolean): Boolean;
begin
  Result := False;
  if AgoFirst  then
    dataSet.First;
  while not dataSet.Eof do
  begin
    if fint('cod_grade') = 0 then // item sem grade e grades definidas no cadastro
    begin
      if not FOwner.SqlOpen('select cod_grade from cod_grade_prod' +
                            ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %s and cod_grade > 0',
                            [fint('grupo_prod'), fstr('cod_prod'), vDadosIni.codEmpresa]).IsEmpty then
        Exit
    end // abaixo item com grade, porém sem grades no cadastro
    else if FOwner.SqlOpen('select cod_grade from cod_grade_prod' +
                           ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %s and cod_grade = %d',
                           [fint('grupo_prod'), fstr('cod_prod'), vDadosIni.codEmpresa, fint('cod_grade')]).IsEmpty then
      Exit;

    dataSet.Next;
  end;
  Result := True;
end;

function TProducaoItemIndice._abreItemIndice(pCodProducao: Integer): Boolean;
begin
  Result := montaSelect('select * from producao_item_indice ' +
    ' where cod_producao = ' + IntToStr(pCodProducao) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by nitem, nitem_ind');

  Fmax := 0;
  prepare_loop();
  try
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('seq').IsNull then
      begin
        dataSet.Edit;
        dataSet.FieldByName('seq').AsInteger := dataSet.FieldByName('nitem').AsInteger;
        dataSet.FieldByName('seqn').AsInteger := dataSet.FieldByName('nitem_ind').AsInteger;
        dataSet.Post;
      end;
      Fmax := IfThen(fint('nitem_ind') > Fmax, fint('nitem_ind'), Fmax);

      dataSet.Next;
    end;
  finally
    prepare_loop_done;
  end;
end;

procedure TProducaoItemIndice._ajustaNItem;
var
  I: Integer;
  vFiltered : Boolean;
  vFilter : string;

begin
  IndexFieldNames := 'NITEM;NITEM_IND';
  dataSet.Last;
  vFiltered := dataSet.Filtered;
  vFilter := dataSet.Filter;
  I := dataSet.FieldByName('NITEM_IND').AsInteger + 100;

  _filtrarItemIndice(dataSet.FieldByName('NITEM').AsInteger);

  dataSet.First;
  while not dataSet.Eof do
  begin
    I := I + 1;

    dataSet.Edit;
    dataSet.FieldByName('NITEM_IND').AsInteger := I + dataSet.RecordCount;
    dataSet.Post;

    dataSet.Next;
  end;

  I := 0;
  dataSet.First;
  while not dataSet.Eof do
  begin
    I := I + 1;

    dataSet.Edit;
    dataSet.FieldByName('NITEM_IND').AsInteger := I;
    dataSet.Post;
    dataSet.Next;
  end;
  dataSet.Filtered := False ;
  dataSet.Filter := vFilter;
  dataSet.Filtered := vFiltered;

end;

procedure TProducaoItemIndice._dataSetCalcFields(DataSet: TDataSet);
begin
  if dataSet.FieldByName('tipo_item').AsString = '00' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Mercadoria para Revenda'
  else if dataSet.FieldByName('tipo_item').AsString = '01' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Matéria-Prima'
  else if dataSet.FieldByName('tipo_item').AsString = '02' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Embalagem'
  else if dataSet.FieldByName('tipo_item').AsString = '03' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Produto em Processo'
  else if dataSet.FieldByName('tipo_item').AsString = '04' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Produto Acabado'
  else if dataSet.FieldByName('tipo_item').AsString = '05' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Subproduto'
  else if dataSet.FieldByName('tipo_item').AsString = '06' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Produto Intermediário'
  else if dataSet.FieldByName('tipo_item').AsString = '07' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Material de Uso e Consumo'
//  else if dataSet.FieldByName('tipo_item').AsString = '08' then
//    dataSet.FieldByName('tipo_item_desc').AsString := 'Ativo Imobilizado'
//  else if dataSet.FieldByName('tipo_item').AsString = '09' then
//    dataSet.FieldByName('tipo_item_desc').AsString := 'Serviços'
  else if dataSet.FieldByName('tipo_item').AsString = '10' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Outros insumos'
  else if dataSet.FieldByName('tipo_item').AsString = '99' then
    dataSet.FieldByName('tipo_item_desc').AsString := 'Outras';

  dataSet.FieldByName('peso_perda').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('peso_un').AsFloat *
    dataSet.FieldByName('quantidade_perda').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);
  dataSet.FieldByName('peso_formula').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('peso_un').AsFloat *
    dataSet.FieldByName('quantidade_receita').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);
  dataSet.FieldByName('peso_teorico').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('peso_un').AsFloat *
    dataSet.FieldByName('quantidade_teorica').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);
end;

function TProducaoItemIndice._existeProduto(vValorConsulta: string): Boolean;
var
  vAcao: string;
  vQtde: Double;
  vNItem: Integer;
  vFiltered: Boolean;
  vRecordCount: Integer;
begin
  Result := False;

  if dataSet.State = dsEdit then
    vAcao := 'ALTERAR'
  else if dataSet.State = dsInsert then
    vAcao := 'INCLUIR'
  else
    Exit;

  vProdCons.fConsultaAdicional := '';
  if vProdCons._buscaProduto(vValorConsulta, True) then
  begin
    if vAcao = 'INCLUIR' then
    begin
      vQtde := dataSet.FieldByName('quantidade_utilizada').AsFloat;
      vNItem := dataSet.FieldByName('nitem').AsInteger;
      vFiltered := dataSet.Filtered;
      vRecordCount := dataSet.RecordCount;
      dataSet.Cancel;
      _filtrarItemIndice(vNItem,
        vProdCons.dataSet.FieldByName('grupo_prod').AsInteger,
          vProdCons.dataSet.FieldByName('cod_prod').AsString);

      if (dataSet.FieldByName('grupo_prod').AsInteger =
        vProdCons.dataSet.FieldByName('grupo_prod').AsInteger) and
        (Trim(dataSet.FieldByName('cod_prod').AsString) =
          Trim(vProdCons.dataSet.FieldByName('cod_prod').AsString)) then
      begin
        Result := False;
        Application.MessageBox(pchar('Produto informado já existe nesta Produção para este produto acabado' + #13 +
          'Por favor use o registro existente'), 'Atenção', 0 + 64);

        _filtrarItemIndice(vNItem, vFiltered);
        if not Insert then
          Exit;
        dataSet.FieldByName('quantidade_utilizada').AsFloat := vQtde;
        dataSet.FieldByName('nitem').AsInteger := vNItem;
        dataSet.FieldByName('nitem_ind').AsInteger := max_next;
        Exit;
      end
      else
      begin
        _filtrarItemIndice(vNItem, vFiltered);
        if not Insert then
          Exit;
        dataSet.FieldByName('quantidade_utilizada').AsFloat := vQtde;
        dataSet.FieldByName('nitem').AsInteger := vNItem;
        dataSet.FieldByName('nitem_ind').AsInteger := max_next;
      end;
    end;

    dataSet.FieldByName('grupo_prod').AsInteger := vProdCons.dataSet.FieldByName('grupo_prod').AsInteger;
    dataSet.FieldByName('cod_prod').AsString := vProdCons.dataSet.FieldByName('cod_prod').AsString;
    dataSet.FieldByName('num_fab_prod').AsString := vProdCons.dataSet.FieldByName('num_fab_prod').AsString;
    dataSet.FieldByName('descr_prod').AsString := vProdCons.dataSet.FieldByName('descr_prod').AsString;
    dataSet.FieldByName('unidade').AsString := vProdCons.dataSet.FieldByName('unidade').AsString;
    dataSet.FieldByName('tipo_item').AsString := vProdCons.dataSet.FieldByName('tipo_item').AsString;
    dataSet.FieldByName('prec_cusm_prod').AsFloat := vProdCons.dataSet.FieldByName('prec_cusm_prod').AsFloat;
    if vProdCons.dataSet.FieldByName('peso_brut_prod').AsFloat > 0 then
      dataSet.FieldByName('peso_un').AsFloat := vDadosIni.StrToFloatFormat(vProdCons.dataSet.FieldByName('peso_brut_prod').AsFloat, vDadosIni.vEmp.vPrecisaoProducao);
    if dataSet.FieldByName('quantidade_utilizada').AsFloat <= 0 then
      dataSet.FieldByName('quantidade_utilizada').AsFloat := 1;
    dataSet.FieldByName('cod_grade').AsInteger := vProdCons.dataSet.FieldByName('cod_grade').AsInteger;
    Result := True;
  end
  else
  begin
    dataSet.FieldByName('grupo_prod').Value := Null;
    dataSet.FieldByName('cod_prod').Value := Null;
    dataSet.FieldByName('num_fab_prod').Value := Null;
    dataSet.FieldByName('descr_prod').Value := Null;
  end;
end;

function TProducaoItemIndice._filtrarItemIndice(pGrupoProd: integer;
  pCodProd: string; pAplicarFiltro: Boolean): Boolean;
begin
  dataSet.Filtered := False;
  dataSet.Filter := 'grupo_prod = ' + IntToStr(pGrupoProd) + ' and cod_prod = ' + QuotedStr(pCodProd);
  dataSet.Filtered := pAplicarFiltro;
end;

function TProducaoItemIndice._filtrarItemIndice(pNItem, pGrupoProd: integer;
  pCodProd: string; pAplicarFiltro: Boolean): Boolean;
begin
  dataSet.Filtered := False;
  dataSet.Filter := 'nitem = ' + IntToStr(pNItem) + ' and grupo_prod = ' + IntToStr(pGrupoProd) + ' and cod_prod = ' + QuotedStr(pCodProd);
  dataSet.Filtered := pAplicarFiltro;
end;

function TProducaoItemIndice._filtrarItemIndice(pNItem: Integer;
  pAplicarFiltro: Boolean = True): Boolean;
begin
  dataSet.Filtered := False;
  dataSet.Filter := 'nitem = ' + IntToStr(pNItem);
  dataSet.Filtered := pAplicarFiltro;
end;

procedure TProducaoItemIndice.ajustar_seq(Anitem, Aseq: Integer);
begin
  prepare_loop('nitem = ' + IntToStr(Anitem), loop_options_with_filter);
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('seq').AsInteger  := Aseq;
      dataSet.FieldByName('seqn').AsInteger := dataSet.RecNo;
      dataSet.Post;

      dataSet.Next;
    end;

  finally
    prepare_loop_done;
  end;
end;

{ TClientesProducao }

constructor TClientesProducao.create;
begin
  DataSet := TClientDataSet(dtmProducao.cdsClientes);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);
end;

function TClientesProducao._existeCliente(pCodCliente: Integer): Boolean;
begin
  Result := ExecutaComandosSql('select COD_CLIENTE, NOME_CLIENTE, RAZAO from clientes' +
    ' where cod_cliente  = '+IntToStr(pCodCliente) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TClientesProducao._selecionaCliente(pCodCliente: Integer): Boolean;
begin
  result := montaSelect('select COD_CLIENTE, NOME_CLIENTE, RAZAO from clientes' +
    ' where cod_cliente  = '+IntToStr(pCodCliente) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

{ TProdutoConsulta }

constructor TProdutoConsulta.create;
begin
  DataSet := TClientDataSet(dtmProducao.cdsProd);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);

  vCB := TCodBarraConsulta.create;

//  fCamposProduto := 'p.*';
  fCamposProduto := 'p.grupo_prod, p.cod_prod, p.num_fab_prod, p.descr_prod, p.prec_cus_prod, p.prec_cusm_prod, p.tipo_item,' +
                    ' p.unidade, p.peso_brut_prod, 0 cod_grade, p.est_f, p.descr_prod dprod';
end;

destructor TProdutoConsulta.Destroy;
begin
  vCB.Free;
  vCB := nil;

  inherited;
end;

function TProdutoConsulta.getCamposConsultaComGrade: string;
begin
  Result := StringReplace(fCamposProduto, 'p.descr_prod,',
                                          'rtrim(p.descr_prod) || case when g.descricao is null then '''' else '' - '' || g.descricao end descr_prod,', [rfIgnoreCase]);
  Result := StringReplace(Result, '0 cod_grade,', ' g.cod_grade, g.descricao dgrade,', [rfIgnoreCase]);
end;

function TProdutoConsulta._abreFormEscolhaProdutos: Boolean;
var
  formulario: TfrmPadrao;
begin
  Result := False;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Escolha o Produto para compor a Produção';

    if frmCadProducao <> nil then
    begin
      frmCadProducao.pnEscolhaProdutos.Parent := formulario;
      formulario.AutoSize := True;
      formulario.AutoScroll := False;
      frmCadProducao.DBGrid2.DataSource := dtmProducao.dsProd;
      result := (formulario.ShowModal = IDOK);
      frmCadProducao.DBGrid2.DataSource := nil;
    end
    else if frmCadFormulaProd <> nil then
    begin
      frmCadFormulaProd.pnEscolhaProdutos.Parent := formulario;
      formulario.AutoSize := True;
      formulario.AutoScroll := False;
      frmCadFormulaProd.DBGrid2.DataSource := dtmProducao.dsProd;
      result := (formulario.ShowModal = IDOK);
      frmCadFormulaProd.DBGrid2.DataSource := nil;
    end;

  finally
    if frmCadProducao <> nil then
      frmCadProducao.pnEscolhaProdutos.Parent := frmCadProducao.tsEscolhaProdutos
    else if frmCadFormulaProd <> nil then
      frmCadFormulaProd.pnEscolhaProdutos.Parent := frmCadFormulaProd.tsEscolhaProdutos;
    formulario.Free;
    formulario := nil;
  end;
end;

function TProdutoConsulta._buscaProduto(pValorConsulta: string;
  pShowErro: Boolean = False): Boolean;
var
  vAbrirTelaEscolha: Boolean;
begin
  pValorConsulta := Trim(pValorConsulta);
  vAbrirTelaEscolha:= False;

  try
    if Trim(pValorConsulta) = '' then
      raiseExceptionCreate('Informe o Código do Produto ou aperte F3 para utilizar a pesquisa', '');

    if vCB._selecionaProduto(pValorConsulta) then
    begin
      if vCB.dataSet.RecordCount > 1 then
      begin
        if not _selecionaProdutosInnerCodBarra(pValorConsulta) then
          raiseExceptionCreate('Erro ao efetuar pesquisa de produtos', '');
        vAbrirTelaEscolha:= True;
      end
      else
        if not _selecionaProdutos(vCB.fint('grupo_prod'), vCB.fstr('cod_prod'), vCB.fint('cod_grade')) then
          raiseExceptionCreate('Produto não encontrado com o código informado', '');
    end;
    if vCB.dataSet.IsEmpty then
    begin
      dataSet.Filtered := False;
      montaSelect('select ' + getCamposConsultaComGrade() + ' from produtos p' +
                  ' left join cod_grade_prod cgp on (p.grupo_prod = cgp.grupo_prod) and (p.cod_prod = cgp.cod_prod) and (p.cod_empresa = cgp.cod_empresa)' +
                  ' left join grade g on (cgp.cod_grade = g.cod_grade) and (cgp.cod_empresa = g.cod_empresa)' +
                  ' where p.descr_prod like ' +
                  QuotedStr(pValorConsulta + '%') + ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa +
                  fConsultaAdicional);

      if dataSet.IsEmpty then
        raiseExceptionCreate('Produto Acabado não encontrado com o código informado', '');

      if dataSet.RecordCount > 1  then
        vAbrirTelaEscolha:= True;
    end;

    if vAbrirTelaEscolha then
      if _abreFormEscolhaProdutos then
      begin
        _selecionaProdutos(fint('grupo_prod'), fstr('cod_prod'), fint('cod_grade'));
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

function TProdutoConsulta._filtrarProdutosIndiceTecnico(pGrupoProd: Integer;
  pCodProd: string; cod_grade: Integer): Boolean;
begin
  dataSet.Filtered := False;
  dataSet.Filter := 'grupo_prod = ' + IntToStr(pGrupoProd) + ' and cod_prod = ' + QuotedStr(pCodProd) + ' and cod_grade = ' + IntToStr(cod_grade);
  dataSet.Filtered := True;
end;

function TProdutoConsulta._getTipoItem(pTipoItem: string): string;
begin
  Result := '';
  if Trim(pTipoItem) = '' then
    pTipoItem := dataSet.FieldByName('tipo_item').AsString;
  if Trim(pTipoItem) = '00' then
    Result := 'Mercadoria para Revenda'
  else if Trim(pTipoItem) = '01' then
    Result := 'Matéria-Prima'
  else if Trim(pTipoItem) = '02' then
    Result := 'Embalagem'
  else if Trim(pTipoItem) = '03' then
    Result := 'Produto em Processo'
  else if Trim(pTipoItem) = '04' then
    Result := 'Produto Acabado'
  else if Trim(pTipoItem) = '05' then
    Result := 'Subproduto'
  else if Trim(pTipoItem) = '06' then
    Result := 'Produto Intermediário'
  else if Trim(pTipoItem) = '07' then
    Result := 'Material de Uso e Consumo'
end;

function TProdutoConsulta._selecionaProdutos(pGrupoProd: Integer;
  pCodProd: string; cod_grade: Integer): Boolean;
begin
  dataSet.Filtered := False;
  if cod_grade >= 0 then
  begin
    montaSelect('select ' + getCamposConsultaComGrade() + ' from produtos p' +
      ' left join cod_grade_prod cgp on (p.grupo_prod = cgp.grupo_prod) and (p.cod_prod = cgp.cod_prod) and (p.cod_empresa = cgp.cod_empresa)' +
      '   and (cgp.cod_grade = %d)' +
      ' left join grade g on (cgp.cod_grade = g.cod_grade) and (cgp.cod_empresa = g.cod_empresa)' +
      ' where p.grupo_prod = %d and p.cod_prod = %s and p.ativo = 1 and p.cod_empresa = %s %s',
      [cod_grade, pGrupoProd, QuotedStr(pCodProd), vDadosIni.codEmpresa, fConsultaAdicional]);
  end
  else
  begin
    montaSelect('select ' + fCamposProduto + ' from produtos p' +
      ' where p.grupo_prod = ' + IntToStr(pGrupoProd) +
      ' and p.cod_prod = ' + QuotedStr(pCodProd) +
      ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa + fConsultaAdicional);
  end;
  Result := not dataSet.IsEmpty;
end;

function TProdutoConsulta._selecionaProdutosIndiceTecnico(pGrupoProd: Integer;
  pCodProd: string; cod_grade: Integer): Boolean;
begin
  dataSet.Filtered := False;
  Result := montaSelect('select ' + getCamposConsultaComGrade() + ', coalesce(pvi.quant, it.quant) quant from produtos p' +
    ' inner join indice_tecnico it on p.grupo_prod = it.grupo_prod_mprima' +
    ' and p.cod_prod = it.cod_prod_mprima and p.cod_empresa = it.cod_empresa' +
    ' left join produtos_pdc_var pv on pv.grupo_prod = it.grupo_prod_acabado' +
    ' and pv.cod_prod = it.cod_prod_acabado and pv.cod_empresa = it.cod_empresa' +
    ' and pv.cod_grade = ' + IntToStr(cod_grade) +
    ' left join produtos_pdc_var_it pvi on pvi.id_ind = pv.id_ind and pvi.cod_empresa = pv.cod_empresa' +
    ' and pvi.grupo_prod = it.grupo_prod_mprima and pvi.cod_prod = it.cod_prod_mprima' +
    ' left join grade g on (g.cod_grade = pvi.cod_grade) and (g.cod_empresa = pvi.cod_empresa)' +
    ' where it.grupo_prod_acabado = ' + IntToStr(pGrupoProd) +
    ' and it.cod_prod_acabado = ' + QuotedStr(pCodProd) +
    ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

function TProdutoConsulta._selecionaProdutosInnerCodBarra(
  pValorConsulta: string): Boolean;
begin
  dataSet.Filtered := False;
  Result := montaSelect('select ' + getCamposConsultaComGrade() + ' from produtos p' +
    ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
    ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
    ' left join cod_grade_prod cgp on (p.grupo_prod = cgp.grupo_prod) and (p.cod_prod = cgp.cod_prod) and (p.cod_empresa = cgp.cod_empresa)' +
    ' left join grade g on (cgp.cod_grade = g.cod_grade) and (cgp.cod_empresa = g.cod_empresa)' +
    ' where cod_barra = '+ QuotedStr(pValorConsulta) +  
    ' and cb.ativo = 1 and cb.cod_empresa = '+ vDadosIni.codEmpresa + fConsultaAdicional);
  Result := not dataSet.IsEmpty;
end;

{ TCodBarraConsulta }

constructor TCodBarraConsulta.create;
begin
  DataSet := TClientDataSet(dtmProducao.cdsCodBarra);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);
end;

function TCodBarraConsulta._selecionaProduto(pCodBarra: string): boolean;
begin
  Result := montaSelect('select cb.*, cgp.cod_grade from cod_barra cb' +
    ' inner join produtos p on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
    ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
    ' left join cod_grade_prod cgp on (p.grupo_prod = cgp.grupo_prod) and (p.cod_prod = cgp.cod_prod) and (p.cod_empresa = cgp.cod_empresa)' +
    ' where cod_barra = '+ QuotedStr(pCodBarra) +
    ' and cb.ativo = 1 and cb.cod_empresa = '+ vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

{ TFormulaProducao }

constructor TFormulaProducao.create;
begin
  DataSet := TClientDataSet(dtmProducao.cdsFormula);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);

  vItemFormula:= TFormulaProducaoProdutos.create;
  vReceita := TReceitaFormula.create;
end;

function TFormulaProducao.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('COD_FORMULA').AsString;
  
  if dataSet.FieldByName('ativo').AsInteger = 1 then
  begin

    if not vDadosIni.PesqPros('PPR020', 'EXCLUIR', '', 'FORMULA_PRODUCAO',
      dataSet.FieldByName('COD_FORMULA').AsString, buscas, false) then
      Exit;

    if Application.MessageBox('Tem certeza que deseja enviar este registro para Lixeira?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      Exit;

    dataSet.Edit;
    dataSet.FieldByName('ATIVO').AsInteger := 0;
    dataSet.Post;

    result := Apply;
    if result then
      result := CommitaTransacao;
    if Result then
      vDadosIni.GravaAuditoria('PPR020', 'EXCLUIR', 'SUCESSO', 'FORMULA_PRODUCAO', vCodFormula, buscas)
    else
      vDadosIni.GravaAuditoria('PPR020', 'EXCLUIR', 'FALHA', 'FORMULA_PRODUCAO', vCodFormula, buscas);

    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'delete from FORMULA_PRODUCAO' +
    ' where cod_formula = ' + vCodFormula +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.ExecSQL;

//  result := inherited Delete;
//  if Result then
//    result := Apply;
//  if result then
    result := CommitaTransacao;
    _abrelixeira;
  if Result then
    vDadosIni.GravaAuditoria('PPR021', 'EXCLUIR', 'SUCESSO', 'FORMULA_PRODUCAO', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('PPR021', 'EXCLUIR', 'FALHA', 'FORMULA_PRODUCAO', vCodFormula, buscas);

end;

destructor TFormulaProducao.Destroy;
begin
  vItemFormula.Free;
  vItemFormula := nil;

  vReceita.Free;
  vReceita := nil;
 
  inherited;
end;

function TFormulaProducao.edit: boolean;
begin
  Result := False;
  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('PROD_SOLVENTE_C').AsString := fstr('PROD_SOLVENTE');
    dataSet.FieldByName('NUM_FAB_PROD_S').AsString  := fstr('NUM_FAB_PROD');
    dataSet.FieldByName('TIPO_CONVERSAO').AsString  := IfThen(str_empty('TIPO_CONVERSAO'), 'P', fstr('TIPO_CONVERSAO'));
    vItemFormula._abreItemFormula(dataSet.FieldByName('cod_formula').AsInteger);
  end;
end;

function TFormulaProducao.Insert: boolean;
begin
  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_formula').AsInteger   := 0;
    dataSet.FieldByName('cod_empresa').AsString    := vDadosIni.codEmpresa;
    dataSet.FieldByName('usar_solvente').AsString  := 'N';
    dataSet.FieldByName('tipo_conversao').AsString := 'U';
    vItemFormula._abreItemFormula(dataSet.FieldByName('cod_formula').AsInteger);
  end;
end;

function TFormulaProducao.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('PPR028', 'SALVAR', '', 'FORMULA_PRODUCAO',
      dataSet.FieldByName('COD_FORMULA').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('produto').AsString) = '' then
      raiseExceptionCreate('Produto a produzir deve ser informado','DBEdit4');

    if dataSet.FieldByName('usar_solvente').AsString <> 'S' then
      _apagarDadosSolvente();
//    if dataSet.FieldByName('usar_solvente').AsString <> 'S' then
//    begin
//      dataSet.FieldByName('GRUPO_PROD_SOLV').Value := Null;
//      dataSet.FieldByName('COD_PROD_SOLV').Value := Null;
//      dataSet.FieldByName('COD_EMP_SOLV').Value := Null;
//      dataSet.FieldByName('PROD_SOLVENTE_C').Value := Null;
//      dataSet.FieldByName('NUM_FAB_PROD_S').Value := Null;
//    end
//    else if dataSet.FieldByName('GRUPO_PROD_SOLV').AsInteger = 0 then
//      dataSet.FieldByName('usar_solvente').AsString := 'N';

    if dataSet.FieldByName('usar_solvente').AsString = 'S' then
    begin
      if not _verificarQtdes then
        raiseExceptionCreate('Total das quantidades não correspondem aos 100%','DBEdit4');
    end
    else
      _apagarDadosSolvente;
//    dataSet.FieldByName('processo').AsString := Trim(dataSet.FieldByName('processo').AsString);

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('COD_FORMULA').AsInteger :=
          Gencodigo('FORMULA_PRODUCAO', dtmProducao.SpIncCodigo, vDadosIni.codEmpresa);
      _inserirCodFormula(vItemFormula.dataSet);
    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      if (vItemFormula.DataSet.ChangeCount > 0) then
        result := vItemFormula.Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('PPR028', acao, 'SUCESSO', 'FORMULA_PRODUCAO',
        dataSet.FieldByName('COD_FORMULA').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('PPR028', acao, 'FALHA', 'FORMULA_PRODUCAO',
        dataSet.FieldByName('COD_FORMULA').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TFormulaProducao._abreFormTextoAdicional: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Texto Adicional para impressão da Ficha e Pedido de Produção';
    frmCadFormulaProd.pnTextAdicional.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadFormulaProd.pnTextAdicional.Parent := frmCadFormulaProd.tsTextAdicional;
    formulario.Free;
    formulario := nil;
  end;
end;

function TFormulaProducao._abrelixeira: boolean;
begin
  if not _lixeiraCheia then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select formula_producao.*, pl.descr_prod prod_solvente, ps.descr_prod prod_formula, pl.num_fab_prod from formula_producao' +
      ' left join produtos pl on pl.grupo_prod = formula_producao.grupo_prod_solv and pl.cod_prod = formula_producao.cod_prod_solv' +
      ' and pl.cod_empresa = formula_producao.cod_emp_solv' +
      ' left join produtos ps on ps.grupo_prod = formula_producao.grupo_prod_solv and ps.cod_prod = formula_producao.cod_prod_solv' +
      ' and ps.cod_empresa = formula_producao.cod_emp_solv' +
      ' where formula_producao.cod_empresa = ' + vDadosIni.codEmpresa + ' and formula_producao.ativo = 0');
end;

function TFormulaProducao._alterarTextoAdicional: Boolean;
begin

  if not Edit then
    Exit;

  if not _abreFormTextoAdicional then
  begin
    Result := False;
    dataSet.Cancel;
    Exit;
  end;

  Result := Post;

end;

function TFormulaProducao._apagarDadosSolvente: boolean;
begin
  if dataSet.State in [dsInsert, dsEdit] then
  begin
    dataSet.FieldByName('NUM_FAB_PROD_S').Value   := Null;
    dataSet.FieldByName('GRUPO_PROD_SOLV').Value  := Null;
    dataSet.FieldByName('COD_PROD_SOLV').Value    := Null;
    dataSet.FieldByName('COD_EMP_SOLV').Value     := Null;
    dataSet.FieldByName('PROD_SOLVENTE_C').Value  := Null;
    dataSet.FieldByName('usar_solvente').AsString := 'N';

    vItemFormula.dataSet.First;
    while not vItemFormula.dataSet.Eof do
    begin
      if vItemFormula.dataSet.FieldByName('solvente').AsString = 'S' then
      begin
        vItemFormula.dataSet.Delete;
        Break;
      end;
      vItemFormula.dataSet.Next;
    end;
  end;
end;

procedure TFormulaProducao._cadFormula(pTipoForm: Integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Fórmulas de Produção');
  if dtmProducao = nil then
    dtmProducao := TdtmProducao.Create(dtmProducao);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('PPR030', 'CONSULTA', '', 'FORMULA_PRODUCAO', '',
    dtmProducao.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadFormulaProd = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadFormulaProd, frmCadFormulaProd);
  end;
  
  if (pTipoForm > 0) and (not frmCadFormulaProd.Visible) then
    frmCadFormulaProd.ShowModal
  else if (not frmCadFormulaProd.Visible) then
    frmCadFormulaProd.Show
  else if frmCadFormulaProd.FormStyle = fsMDIChild then
    frmCadFormulaProd.Show
  else
    frmCadFormulaProd.ShowModal;
end;

function TFormulaProducao._existeSolvente(vValorConsulta: string; Qtde: Double): Boolean;
var
  vAcao, vSolvente: string;
  vQtde: Double;
begin
  Result := False;

  if dataSet.State = dsEdit then
    vAcao := 'ALTERAR'
  else if dataSet.State = dsInsert then
    vAcao := 'INCLUIR'
  else
    Exit;

  if Trim(vValorConsulta) = '' then
  begin
    _apagarDadosSolvente;
    Exit;
  end;

  vItemFormula.vProdCons.fConsultaAdicional := '';
  //if (dataSet.FieldByName('usar_solvente').AsString = 'S') and (vItemFormula.vProdCons._buscaProduto(vValorConsulta, True)) then
  if (vItemFormula.vProdCons._buscaProduto(vValorConsulta, True)) then
  begin
    dataSet.FieldByName('GRUPO_PROD_SOLV').AsInteger := vItemFormula.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger;
    dataSet.FieldByName('COD_PROD_SOLV').AsString := vItemFormula.vProdCons.dataSet.FieldByName('cod_prod').AsString;
    dataSet.FieldByName('COD_EMP_SOLV').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('PROD_SOLVENTE_C').AsString := vItemFormula.vProdCons.dataSet.FieldByName('DESCR_PROD').AsString;
    dataSet.FieldByName('NUM_FAB_PROD_S').AsString := vItemFormula.vProdCons.dataSet.FieldByName('NUM_FAB_PROD').AsString;

    vItemFormula.filterStr('solvente = ''S''');
    try
      while not vItemFormula.dataSet.IsEmpty do
        vItemFormula.dataSet.Delete;
    finally
      vItemFormula.filterClear;
    end;

    vItemFormula.dataSet.First;
    while not vItemFormula.dataSet.Eof do
    begin
      if (vItemFormula.fequals('grupo_prod', fstr('grupo_prod_solv')) and
          vItemFormula.fequals('cod_prod'  , fstr('cod_prod_solv'))) then
      begin
        vItemFormula.dataSet.Edit;
        vItemFormula.dataSet.FieldByName('solvente').AsString := 'S';
        vItemFormula.dataSet.Post;
        dataSet.FieldByName('usar_solvente').AsString := 'S';
        Result := True;
        Exit;
      end;

      vItemFormula.dataSet.Next;
    end;

    if vItemFormula.Insert then
    begin
      vItemFormula.dataSet.FieldByName('cod_formula').AsInteger :=
        dataSet.FieldByName('cod_formula').AsInteger;
      vItemFormula.dataSet.FieldByName('grupo_prod').AsInteger :=
        vItemFormula.vProdCons.dataSet.FieldByName('grupo_prod').AsInteger;
      vItemFormula.dataSet.FieldByName('cod_prod').AsString :=
        vItemFormula.vProdCons.dataSet.FieldByName('cod_prod').AsString;
      vItemFormula.dataSet.FieldByName('num_fab_prod').AsString :=
        vItemFormula.vProdCons.dataSet.FieldByName('num_fab_prod').AsString;
      vItemFormula.dataSet.FieldByName('descr_prod').AsString :=
        vItemFormula.vProdCons.dataSet.FieldByName('descr_prod').AsString;
      vItemFormula.dataSet.FieldByName('unidade').AsString :=
        vItemFormula.vProdCons.dataSet.FieldByName('unidade').AsString;
      vItemFormula.dataSet.FieldByName('quantidade').AsFloat := Qtde;
      vItemFormula.dataSet.FieldByName('solvente').AsString := 'S';
      vItemFormula.dataSet.Post;
      Result := True;
      dataSet.FieldByName('usar_solvente').AsString := 'S';
    end;
    
  end
  else
  begin
    dataSet.FieldByName('usar_solvente').AsString := 'N';
    dataSet.FieldByName('GRUPO_PROD_SOLV').Value := Null;
    dataSet.FieldByName('COD_PROD_SOLV').Value := Null;
    dataSet.FieldByName('COD_EMP_SOLV').Value := Null;
    dataSet.FieldByName('PROD_SOLVENTE_C').Value := Null;
    dataSet.FieldByName('NUM_FAB_PROD_S').Value := Null;
    
    vItemFormula.dataSet.First;
    while not vItemFormula.dataSet.Eof do
    begin
      if vItemFormula.dataSet.FieldByName('solvente').AsString = 'S' then
        vItemFormula.dataSet.Delete
      else
        vItemFormula.dataSet.Next;
    end;
  end;
  _verificarQtdes;
end;

procedure TFormulaProducao._inserirCodFormula(pDtset: TDataSet);
begin
  if (not (pDtset.IsEmpty)) then
  begin
    pDtset.First;
    while (not (pDtset.Eof)) do
    begin
      pDtset.Edit;
      pDtset.FieldByName('cod_formula').AsInteger :=
        dataSet.FieldByName('cod_formula').AsInteger;
      pDtset.Post;
      pDtset.Next;
    end;
  end;
end;

function TFormulaProducao._lixeiraCheia: boolean;
begin
  Result := ExecutaComandosSql('Select first 1 cod_formula from FORMULA_PRODUCAO' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TFormulaProducao._restauralixeira: boolean;
begin
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        if (Edit) or (dataSet.State = dsEdit) then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          Result := Post;
          if Result then
            Result := CommitaTransacao;

          if Result then
            vDadosIni.GravaAuditoria('PPR022', 'RESTAURAR REGISTRO', 'SUCESSO',
              'FORMULA_PRODUCAO', dataSet.FieldByName('COD_FORMULA').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('PPR022', 'RESTAURAR REGISTRO', 'FALHA',
              'FORMULA_PRODUCAO', dataSet.FieldByName('COD_FORMULA').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação',  0 + 64);
  Refresh;
end;

function TFormulaProducao._salvarItemFormula: Boolean;
var
  vAcao, vFilter: string;
  I: Integer;
  vFiltered: Boolean;
begin
  // DUVIDA
  // Remover itens matyeria prima ou insumo
  // Quando alterar a qtde item acabado
  // Adicionar itens que foram removidos. sim ou nao
  //
  if vItemFormula.dataSet.State = dsEdit then
    vAcao := 'ALTERAR'
  else if vItemFormula.dataSet.State = dsInsert then
    vAcao := 'INCLUIR'
  else
    Exit;

  vItemFormula.dataSet.FieldByName('cod_formula').AsInteger :=
    dataSet.FieldByName('cod_formula').AsInteger;
  vItemFormula.dataSet.FieldByName('quantidade').AsFloat :=
    vDadosIni.StrToFloatFormat(vItemFormula.dataSet.FieldByName('quantidade').AsFloat,6);

  Result := vItemFormula.Post;
  _verificarQtdes;
end;

function TFormulaProducao._verificarQtdes: Boolean;
var
  vTotal: Double;
begin
  if fequals('tipo_conversao', 'U') then
  begin
    Result := True;
    Exit;
  end;

  Result := False;
  vTotal := 0;
  vItemFormula.dataSet.First;
  while not vItemFormula.dataSet.Eof do
  begin
    if vItemFormula.dataSet.FieldByName('solvente').AsString = 'S' then
    else
      vTotal := vTotal + vItemFormula.dataSet.FieldByName('quantidade').AsFloat;
    vItemFormula.dataSet.Next;
  end;

  if vDadosIni.StrToFloatFormat(vTotal,6) > 100 then
  begin
    Result := False;
    Exit;
  end;

  vItemFormula.dataSet.First;
  while not vItemFormula.dataSet.Eof do
  begin
    if vItemFormula.dataSet.FieldByName('solvente').AsString = 'S' then
    begin
      vItemFormula.dataSet.Edit;
      vItemFormula.dataSet.FieldByName('quantidade').AsFloat := 100 - vTotal;
      vItemFormula.dataSet.Post;
    end;
    vItemFormula.dataSet.Next;
  end;

  Result := True;

end;

{ TFormulaProducaoProdutos }

constructor TFormulaProducaoProdutos.create;
begin
  DataSet := TClientDataSet(dtmProducao.cdsFrmlProd);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);

  vProdCons:= TProdutoConsulta.create;
end;

function TFormulaProducaoProdutos.delete: Boolean;
var
  codFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  codFormula := dataSet.FieldByName('COD_FORMULA').AsString;

  if Application.MessageBox('Tem certeza que deseja excluir este Item?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    result := inherited Delete;
//    if Result then
//      result := Apply;
//    if result then
//      result := CommitaTransacao;
//    if Result then
//      vDadosIni.GravaAuditoria('PPR026', 'EXCLUIR', 'SUCESSO', 'FORMULA_PRODUCAO_PRODUTOS', codFormula, buscas)
//    else
//      vDadosIni.GravaAuditoria('PPR026', 'EXCLUIR', 'FALHA', 'FORMULA_PRODUCAO_PRODUTOS', codFormula, buscas);
  end;
end;

destructor TFormulaProducaoProdutos.Destroy;
begin
  vProdCons.Free;
  vProdCons := nil;

  inherited;
end;

function TFormulaProducaoProdutos.edit: Boolean;
begin
  if inherited Edit then
    Result := True;
end;

function TFormulaProducaoProdutos.insert: Boolean;
begin
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('solvente').AsString := 'N';
  end;
end;

function TFormulaProducaoProdutos.post: Boolean;
begin
  Result := False;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.FieldByName('quantidade').AsFloat <= 0 then
      raiseExceptionCreate('Quantidade não informada ou inválida', 'DBEdit9');

    if Trim(dataSet.FieldByName('cod_prod').AsString) = '' then
      raiseExceptionCreate('Produto não informado', 'DBEdit7');

    Result := inherited Post;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFormulaProducaoProdutos._abreItemFormula(
  pCodFormula: Integer): Boolean;
begin
  Result :=  montaSelect('select fpp.* from FORMULA_PRODUCAO_PRODUTOS fpp' +
//    ' inner join produtos p on p.grupo_prod = fpp.grupo_prod and p.cod_prod = fpp.cod_prod' +
//    ' and p.cod_empresa = fpp.cod_empresa' +
    ' where fpp.cod_formula = ' + IntToStr(pCodFormula) + ' and fpp.cod_empresa = ' + vDadosIni.codEmpresa+
    ' order by fpp.solvente desc, fpp.descr_prod');

  Result := not dataSet.IsEmpty;
end;

function TFormulaProducaoProdutos._existeProduto(
  vValorConsulta: string): Boolean;
var
  vAcao, vSolvente: string;
  vQtde: Double;
begin
  Result := False;

  if dataSet.State = dsEdit then
    vAcao := 'ALTERAR'
  else if dataSet.State = dsInsert then
    vAcao := 'INCLUIR'
  else
    Exit;

  vProdCons.fConsultaAdicional := '';
  if vProdCons._buscaProduto(vValorConsulta, True) then
  begin
    if vAcao = 'INCLUIR' then
    begin
      vQtde := dataSet.FieldByName('quantidade').AsFloat;
      vSolvente := dataSet.FieldByName('solvente').AsString;

      dataSet.Cancel;
      _filtrarItemFormula(
        vProdCons.dataSet.FieldByName('grupo_prod').AsInteger,
          vProdCons.dataSet.FieldByName('cod_prod').AsString);

      if (dataSet.FieldByName('grupo_prod').AsInteger =
        vProdCons.dataSet.FieldByName('grupo_prod').AsInteger) and
        (Trim(dataSet.FieldByName('cod_prod').AsString) =
          Trim(vProdCons.dataSet.FieldByName('cod_prod').AsString)) then
      begin
        Result := False;
        Application.MessageBox(pchar('Produto informado já existe nesta Produção para este produto acabado' + #13 +
          'Por favor use o registro existente'), 'Atenção', 0 + 64);

        dataSet.Filtered := False;
        if not Insert then
          Exit;
        dataSet.FieldByName('quantidade').AsFloat := vQtde;
        dataSet.FieldByName('solvente').AsString := vSolvente;
        Exit;
      end
      else
      begin
        dataSet.Filtered := False;
        if not Insert then
          Exit;
        dataSet.FieldByName('quantidade').AsFloat := vQtde;
        dataSet.FieldByName('solvente').AsString := vSolvente;
      end;
    end;

    dataSet.FieldByName('grupo_prod').AsInteger := vProdCons.dataSet.FieldByName('grupo_prod').AsInteger;
    dataSet.FieldByName('cod_prod').AsString := vProdCons.dataSet.FieldByName('cod_prod').AsString;
    dataSet.FieldByName('num_fab_prod').AsString := vProdCons.dataSet.FieldByName('num_fab_prod').AsString;
    dataSet.FieldByName('descr_prod').AsString := vProdCons.dataSet.FieldByName('descr_prod').AsString;
    dataSet.FieldByName('unidade').AsString := vProdCons.dataSet.FieldByName('unidade').AsString;
    if dataSet.FieldByName('quantidade').AsFloat <= 0 then
      dataSet.FieldByName('quantidade').AsFloat := 1;
  end
  else
  begin
    dataSet.FieldByName('grupo_prod').Value := Null;
    dataSet.FieldByName('cod_prod').Value := Null;
    dataSet.FieldByName('num_fab_prod').Value := Null;
    dataSet.FieldByName('descr_prod').Value := Null;
    dataSet.FieldByName('unidade').Value := Null;
  end;
end;

function TFormulaProducaoProdutos._filtrarItemFormula(pGrupoProd: integer;
  pCodProd: string; pAplicarFiltro: Boolean): Boolean;
begin
  dataSet.Filtered := False;
  dataSet.Filter := 'grupo_prod = ' + IntToStr(pGrupoProd) + ' and cod_prod = ' + QuotedStr(pCodProd);
  dataSet.Filtered := pAplicarFiltro;
end;

{ TReceitaFormula }

constructor TReceitaFormula.create;
begin
  DataSet := TClientDataSet(dtmProducao.cdsRec);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);
end;

function TReceitaFormula._pesquisaReceita(pValorReceita: string): Boolean;
begin
  if Trim(pValorReceita) = '' then
    Result := montaSelect('select * from rec_ass where cod_empresa = %s', [vDadosIni.codEmpresa])
  else
  Result := montaSelect('select * from rec_ass' +
    ' where ((titulo like ' + QuotedStr('%' + pValorReceita+'%') +
    ') or (processo_producao like' + QuotedStr('%' + pValorReceita+'%') + '))' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);

  Result := not dataSet.IsEmpty;

end;

{ TFormulaConsulta }

constructor TFormulaConsulta.create;
begin
  DataSet := TClientDataSet(dtmProducao.cdsFormCons);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);
end;

function TFormulaConsulta._selecionaFormula(pCodFormula: Integer): boolean;
begin
  Result := montaSelect('select fp.cod_formula, fp.produto, fp.processo, fp.usar_solvente, fpp.grupo_prod, fpp.cod_prod,' +
    ' fpp.quantidade, fpp.solvente, p.num_fab_prod, p.unidade, p.peso_brut_prod, p.descr_prod,' +
    ' fp.texto_impressao1, fp.texto_impressao2, fp.tipo_conversao ' +
    ' from formula_producao fp' +
    ' inner join formula_producao_produtos fpp on fpp.cod_formula = fp.cod_formula and fpp.cod_empresa = fp.cod_empresa' +
    ' inner join produtos p on p.grupo_prod = fpp.grupo_prod and p.cod_prod = fpp.cod_prod' +
    ' and p.cod_empresa = fpp.cod_empresa' +
    ' where fp.cod_formula = ' + IntToStr(pCodFormula) +
    ' and fp.cod_empresa = ' + vDadosIni.codEmpresa);

  Result := not dataSet.IsEmpty;
end;

function TFormulaConsulta._selecionaTodasFormulas: boolean;
begin
  Result := montaSelect('select fp.cod_formula, fp.produto, fp.processo, fp.usar_solvente, 0 grupo_prod, 0 cod_prod,' +
    ' 0 quantidade, 0 solvente, 0 num_fab_prod, 0 unidade, 0 peso_brut_prod, 0 descr_prod,' +
    ' 0 texto_impressao1, 0 texto_impressao2' +
    ' from formula_producao fp' +
    ' where fp.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and fp.ativo = 1');

  Result := not dataSet.IsEmpty;
end;

{ TPedidoDeCompraConsulta }

constructor TPedidoDeCompraConsulta.create;
begin
  DataSet := TClientDataSet(dtmProducao.cdsPC);
  transacao := TIBTransaction(dtmProducao.transacao);
  Buscas := TIBQuery(dtmProducao.qrBuscas);
  fLista:= TStringList.Create;
end;

function TPedidoDeCompraConsulta._getLista: TStringList;
begin
  Result := fLista;
end;

procedure TPedidoDeCompraConsulta._marcaDesmarcaLinha;
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

function TPedidoDeCompraConsulta._montaPedidoCompra: Boolean;
var
  vNumPed, vCodEmp: Integer;
  vLinha: string;
begin
  Result := False;
  fLista.Clear;

  vNumPed := 0;
  vCodEmp := 0;

  dataSet.First;
  while not dataSet.Eof do
  begin

    if dataSet.FieldByName('sel').AsString = 'S' then
    begin

      if (vNumPed <> dataSet.FieldByName('num_ped').AsInteger) and
        (vCodEmp <> dataSet.FieldByName('cod_empresa').AsInteger) then
      begin
        vNumPed := dataSet.FieldByName('num_ped').AsInteger;
        vCodEmp := dataSet.FieldByName('cod_empresa').AsInteger;
        vLinha := '|HW|' + IntToStr(vCodEmp)+'|';
        fLista.Add(vLinha);
      end;

      vLinha := '|ITEM_PEDIDO|';//1
      vLinha := vLinha + dataSet.FieldByName('NUM_PED').AsString+'|';//2
      vLinha := vLinha + dataSet.FieldByName('NITEM').AsString+'|';//3
      vLinha := vLinha + dataSet.FieldByName('GRUPO_PROD').AsString+'|';//4
      vLinha := vLinha + Trim(dataSet.FieldByName('COD_PROD').AsString)+'|';//5
      vLinha := vLinha + Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString)+'|';//6
      vLinha := vLinha + Trim(dataSet.FieldByName('DESCR_PROD').AsString)+'|';//7
      vLinha := vLinha + Format('%0.6f',[dataSet.FieldByName('QUANT_IT_PROD').AsFloat])+'|';//8
      vLinha := vLinha + Format('%0.4f',[dataSet.FieldByName('VAL_UNT_IT').AsFloat])+'|';//9
      vLinha := vLinha + StringReplace(
        FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_ENV_PED').AsDateTime),'/','',[rfReplaceAll])+'|';//10
      vLinha := vLinha + Trim(dataSet.FieldByName('COD_EMPRESA').AsString)+'|';//11
      vLinha := vLinha + Trim(dataSet.FieldByName('CGC_EMP').AsString)+'|';//12
      vLinha := vLinha + Trim(dataSet.FieldByName('NOME_EMP').AsString)+'|';//13
      vLinha := vLinha + Trim(dataSet.FieldByName('COD_GRADE').AsString)+'|';//14
      fLista.Add(vLinha);
    end;

    dataSet.Next;
  end;
  Result := fLista.Count > 0;

end;

function TPedidoDeCompraConsulta._pesquisaPedCompra(pNped: Integer; pDataIni,
  pDataFim: string; pTodasEmpresas: Boolean = False): boolean;
var
  pWhere: WideString;
begin
  if (pNped = 0) and (pDataIni = '  /  /    ') and (pDataFim = '  /  /    ') then
  begin
    Application.MessageBox('Nenhum tipo de filtro informado. Informe algum valor para a pesquisa das Vendas', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  if (pDataIni <> '  /  /    ') and (pDataFim = '  /  /    ') or
    (pDataIni = '  /  /    ') and (pDataFim <> '  /  /    ') then
  begin
    Application.MessageBox('Informe as datas de inicio e fim', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    exit;
  end;
  pWhere := ' where pe.add_producao = ''S'' and pe.data_chg_ped is null and pe.status_ped = ''EFETIVADO''' +
    ' and pe.num_producao is null and pe.ativo = 1';

  if pNped > 0 then
    pWhere := pWhere + ' and pe.num_ped = ' + IntToStr(pNped);
  if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
    pWhere := pWhere + ' and pe.DATA_ENV_PED >= :dataIni and pe.DATA_ENV_PED <= :dataFim';
  if pTodasEmpresas then
    pWhere := pWhere + ' and pe.cod_empresa = ' + vDadosIni.codEmpresa;
  pWhere := pWhere + ' order by pe.num_ped, ip.nitem';

  dataSet.CommandText := 'select pe.num_ped, ip.nitem, ip.grupo_prod, ip.cod_prod, p.num_fab_prod, ip.descr_prod, ip.quant_it_prod, ip.val_unt_it,' +
    ' ip.val_tot_it, pe.cod_empresa, pe.codigo_f, c.cpfcgc, c.razao, pe.data_env_ped, pe.val_tot_ped, e.nome_emp, e.cgc_emp, ip.cod_grade' +
    ' from pedido pe' +
    ' inner join item_pedido ip on ip.num_ped = pe.num_ped and ip.cod_empresa = pe.cod_empresa' +
    ' inner join produtos p on p.grupo_prod = ip.grupo_prod and p.cod_prod = ip.cod_prod and p.cod_empresa = ip.cod_empresa' +
    ' inner join empresa e on e.cod_empresa = pe.cod_empresa' +
    ' left join clientes c on c.cod_cliente = pe.codigo_f and c.cod_empresa = pe.cod_empresa';
  if Pos(':dataIni', pWhere) > 0 then
    montaSelect(dataSet.CommandText + pWhere, StrToDate(pDataIni), StrToDate(pDataFim))
  else
    montaSelect(dataSet.CommandText + pWhere);
end;

{ TGradesProducao }

constructor TGradesProducao.create;
begin
  FOwner := Aowner;
  inherited Create(dtmAtivo.bancoHw);
end;

function TGradesProducao.getGradesDisponiveis(Agrupo_prod: Integer;
  Acod_prod: string; Aunion_grade: Integer): TGradesProducao;
var
  Asql: string;
begin
  Asql := Format('select g.cod_grade, g.descricao || case when coalesce(g.descricao1, '''') <> '''' then '' - '' || g.descricao1 else '''' end ||' +
                 ' '' - [COD: '' || g.cod_grade || '']'' descricao' +
                 ' from cod_grade_prod cgp' +
                 ' inner join grade g on (cgp.cod_grade = g.cod_grade) and (cgp.cod_empresa = g.cod_empresa)' +
                 ' where cgp.grupo_prod = %d and cgp.cod_prod = %s and cgp.cod_empresa = %s',
                 [Agrupo_prod, QuotedStr(Acod_prod), vDadosIni.codEmpresa]);
  if Aunion_grade > 0 then
    Asql := Format(' %s union' +
                   ' select g.cod_grade, g.descricao || case when coalesce(g.descricao1, '''') <> '''' then '' - '' || g.descricao1 else '''' end ||' +
                   ' '' - [COD: '' || g.cod_grade || '']'' descricao' +
                   ' from grade g where g.cod_grade = %d and g.cod_empresa = %s',
                   [Asql, Aunion_grade, vDadosIni.codEmpresa]);

  montaSelect(Asql);

  Result := Self;
end;

{ TEstoqueProds }

function TEstoqueProds.getEstoque(Agrupo_prod: Integer; Acod_prod: string;
  Acod_grade: Integer): TCod_grade_prod_class;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Pred(Self.Count) do with Self.Items[I] do
    if (Agrupo_prod = grupo_prod) and (Acod_prod = cod_prod) and (Acod_grade =  cod_grade) then
    begin
      Result := Self.Items[I];
      Exit;
    end;
end;     

{ TProdVariacaoItens }

function TProdVariacaoItens.getVariacaoItem(grupo_prod: Integer;
  cod_prod: string; cod_grade: Integer): TProdutos_pdc_var_it_class;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to Pred(Self.Count) do
    if (Self.Items[I].grupo_prod = grupo_prod) and
       (Self.Items[I].cod_prod = cod_prod) and
       (Self.Items[I].cod_grade = cod_grade) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

function TProdVariacaoItens.getVariacaoItem(grupo_prod: Integer;
  cod_prod: string): TProdutos_pdc_var_it_class;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to Pred(Self.Count) do
    if (Self.Items[I].grupo_prod = grupo_prod) and
       (Self.Items[I].cod_prod = cod_prod) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

{ TProdutos_pdc_var }

constructor TProdutos_pdc_var.Create;
begin
  Fitens := TProdVariacaoItens.Create;
end;

destructor TProdutos_pdc_var.Destroy;
begin
  if Assigned(Fitens) then FreeAndNil(Fitens);
  inherited;
end;

{ TProdutos_pdc_var_List }

function TProdutos_pdc_var_List.GetItem(Index: Integer): TProdutos_pdc_var;
begin
  Result := TProdutos_pdc_var(inherited Items[Index]);
end;

function TProdutos_pdc_var_List.getVariacao(grupo_prod: Integer;
  cod_prod: string; cod_grade: Integer): TProdutos_pdc_var;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to Pred(Self.Count) do
    if (Self.Items[I].grupo_prod = grupo_prod) and
       (Self.Items[I].cod_prod = cod_prod) and
       (Self.Items[I].cod_grade = cod_grade) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

function TProdutos_pdc_var_List.New: TProdutos_pdc_var;
begin
  Result := TProdutos_pdc_var.Create;
  Add(Result);
end;

procedure TProdutos_pdc_var_List.SetItem(Index: Integer;
  const Value: TProdutos_pdc_var);
begin
  Put(Index, Value);
end;

procedure TProdutos_pdc_var_List.SetValuesFrom(ADataSet: TDataSet;
  AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

{ TProdVariacao }

constructor TProdVariacao.Create;
begin
  Fdatas := TDataSet_OOP.Create(dtmAtivo.bancoHw);
end;

destructor TProdVariacao.Destroy;
begin
  Fdatas.FreeDbComponents(True);
  inherited;
end;

function TProdVariacao.getVariacaoDB(grupo_prod: Integer; cod_prod: string;
  cod_grade: Integer): TProdutos_pdc_var;
var
  I: Integer;
begin
  Result := TProdutos_pdc_var.Create;
  Result.SetValuesFrom(Fdatas.SqlOpen('select %s from produtos_pdc_var where grupo_prod = %d and cod_prod = %s and cod_grade = %d and cod_empresa = %s',
                                      [TProdutos_pdc_var.GetFieldsSql(), grupo_prod, QuotedStr(cod_prod), cod_grade, vDadosIni.codEmpresa]));
  Result.itens.SetValuesFrom(Fdatas.SqlOpen('select %s from produtos_pdc_var_it where id_ind = %d and cod_empresa = %d order by id_ind_it',
                                            [TProdutos_pdc_var_it_class.GetFieldsSql(), Result.id_ind, Result.cod_empresa]));
end;

function TProdVariacao.makeVariacoes(grupo_prod: Integer; cod_prod: string;
  cod_grade: Integer): TProdVariacao;
var
  I: Integer;
begin
  Result := Self;
//  Self.SetValuesFrom(Fdatas.SqlOpen('select %s from produtos_pdc_var where grupo_prod = %d and cod_prod = %s and cod_grade = %d and cod_empresa = %s',
//                                    [grupo_prod, QuotedStr(cod_prod), cod_grade, vDadosIni.codEmpresa]));
  Self.SetValuesFrom(Fdatas.SqlOpen('select %s from produtos_pdc_var where grupo_prod = %d and cod_prod = %s and cod_empresa = %s',
                                    [TProdutos_pdc_var.GetFieldsSql(), grupo_prod, QuotedStr(cod_prod), vDadosIni.codEmpresa]));
  for I := 0 to Pred(Self.Count) do with Self.Items[I] do
    Self.Items[I].itens.SetValuesFrom(Fdatas.SqlOpen('select %s from produtos_pdc_var_it where id_ind = %d and cod_empresa = %d order by id_ind_it',
                                                     [TProdutos_pdc_var_it_class.GetFieldsSql(), id_ind, cod_empresa]));
end;

function TProdVariacao.SaveCurrent: Boolean;
var
  I: Integer;
  Astr: string;
begin
  Result := True;
  Exit;// Já que vai usar os vinculos do pacote de produtos esse salvamento foi desabitado

  try
    if Fcurrent.id_ind = 0 then
    begin
      Fcurrent.id_ind      := Fdatas.SqlOpen('select cod from incrementa_codigo(%s, %s)', [vDadosIni.codEmpresa, QuotedStr('PRODUTOS_PDC_VAR')]).
                                FieldByName('cod').AsInteger;
      Fcurrent.cod_empresa := StrToInt(vDadosIni.codEmpresa);
    end;
    Fdatas.buscas.Close;
    Fdatas.buscas.SQL.Text := 'update or insert into produtos_pdc_var (id_ind, cod_empresa, grupo_prod, cod_prod, cod_grade, descricao)' +
                              ' values (:id_ind, :cod_empresa, :grupo_prod, :cod_prod, :cod_grade, :descricao) matching (id_ind, cod_empresa)';
    Fcurrent.SetValuesInParams(Fdatas.buscas, True).ExecSQL;

    Fdatas.buscas.Close;

    for I := 0 to Pred(Fcurrent.itens.Count) do with Fcurrent.itens.Items[I] do
      //if id_ind_it = 0 then
      begin
        id_ind := Fcurrent.id_ind;
        cod_empresa := StrToInt(vDadosIni.codEmpresa);

        Astr := IfThen(id_ind_it = 0,
                       Format('(select cod from incrementa_codigo(%s, %s))', [vDadosIni.codEmpresa, QuotedStr('PRODUTOS_PDC_VAR_IT')]),
                       ':id_ind_it');

        with Fdatas.buscas do
          SQL.Text := Format('update or insert into produtos_pdc_var_it (id_ind, cod_empresa, grupo_prod, cod_prod, cod_grade, descricao, id_ind_it)' +
                             ' values (:id_ind, :cod_empresa, :grupo_prod, :cod_prod, :cod_grade, :descricao, %s)' +
                             ' matching (id_ind, cod_empresa, id_ind_it)', [Astr]);

        SetValuesInParams(Fdatas.buscas, True).ExecSQL;
      end;

    if Fdatas.transacao.InTransaction then
      Fdatas.transacao.Commit;

  except on E: Exception do
    begin
      Result := False;
      if Fdatas.transacao.InTransaction then
        Fdatas.transacao.Rollback;
      Fcurrent.id_ind := 0;
      for I := 0 to Pred(Fcurrent.itens.Count) do with Fcurrent.itens.Items[I] do
        if id_ind_it = 0 then
          id_ind := 0;
      vDadosIni.registraErro('TProdVariacao.SaveCurrent Erro: ' + e.Message);
    end;
  end;
end;

end.

