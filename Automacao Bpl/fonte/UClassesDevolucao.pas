unit UClassesDevolucao;

interface

uses
  uDataSet_OOP, DBClient, DB, IBQuery, Provider, StdCtrls, IBDatabase, RDprint, funcoes,
  IBStoredProc;

type
  TDevolucao = class;
  TEmpresa_Dev = class;
  TCliente_Dev = class;
  TProduto_Dev = class;
  TGrade_Dev = class;
  TDevolucaoGrade_Dev = class;
  TRecibo_Dev = class;
  TVendedor_Dev = class;
  TPedvenda_Dev = class;
  TPedVendaProd_Dev = class;
  TNf_Dev = class;

  TDevolucao = class(TDataSet_OOP)
  private
    vMovimentaEstoque: TIBStoredProc;
    procedure VendasAfterScroll(DataSet: TDataSet);
  protected
    FQuantidadeJaDev: double;
    FQuantidadeJaDevConv: double;
    FDevRapida: boolean;
  public
    constructor create;
    function insert: Boolean; override;
    function Post: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function cancel: Boolean; override;

    procedure dataSetCalcFields(DataSet: TDataSet);
    function abredevolucao: Boolean;
    function somentePost: Boolean;
    function pesquisaProduto: Boolean;
    function pesquisaGrade(Codprod: string; grupoprod: Integer; vcgrade: Integer): Boolean;
    function selecionaVenda(vtip: integer; vtipovenda: string): Boolean;
    function pesquisaVendedor(codVendedor: integer): Boolean;
    function pesquisaCLiente(codCliente: string): Boolean;
    function PesquisaItemDevolvido(pQtdedev, pQtdedevConv: real; pUnidade: string): Boolean;
    //     function PesquisaItemDevolvido(pCodProd:integer;pGrupoProd:string) : Boolean; overload;
    function InserirDevolucaoGrade: Boolean;
    function InserirDevolucao: Boolean;
    function ConcluindoDevolucao(pCodVenda:string): Boolean;
    function VerificaEstoqueGradeProduto: Boolean;
    function EditarEstoqueGradeProduto: Boolean;
    function desfazerEdicaoEstoqueGradeProduto: Boolean;
    function CancelarEdicaoEstoqueGradeProduto: Boolean;
    function VerificaGradeProdutoDevolvido: Boolean;
    function VoltaEstoqueGradeeProduto: Boolean;
    function InserirClientenaDevolucao: Boolean;
    function GerarRecibo: Boolean;
    function retornaNumRec: string;
    function retornaCodDepto: Integer;
    function GerarSequencia: Boolean;
    function ImprimirDevolucao: Boolean;
    function ImpressaoMatricialDevolucao(rdImp: TRdPrint): Boolean;
    procedure CabecalhoImpressaoMatricial(rdimp: TRDprint);
    function ConfirmaOperacoes: Boolean;
    function CancelaOperacoes: Boolean;
    function VerificaseExisteDevolucao: Boolean;
    procedure GetTextItemDevStringFormatUnConv(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure GetTextItemFloatFormat(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure GetTextItemStringFormatUnConv(Sender: TField; var Text: string; DisplayText: Boolean);

    procedure SetTextItemDevStringFormatUnConv(Sender: TField; const Text: string);
    procedure SetTextItemFloatFormat(Sender: TField; const Text: string);
    procedure SetTextItemStringFormatUnConv(Sender: TField; const Text: string);

    // funções utilzadas na tela de cancelamento de devolução
    function pesquisadevolucao(pRefresh:boolean = false): Boolean;
    function ImprimirPesquisaDevolucaoGrafico: Boolean;
    function ImprimirPesquisaDevolucaoMatricial(rdImp: TRdPrint): Boolean;
    function ApagarDevolucao: Boolean;
    function TiraEstoqueGradeeProduto: Boolean;
    function PossuiFormPagemento(numeroVenda: integer): Boolean;

    // função utilizada na pesquisa de vendas
    function PesquisaItensVenda(Nped: string): Boolean; overload;
    function PesquisaItensVenda(Nped, Tipo: string): Boolean; overload;
    function PesquisadeVendas: Boolean;
    function InserirDevolucaopelaVenda(vqtdedev, vqtdedevConv: real): Boolean;
    function InserirDevolucaoGradepelaVenda: Boolean;
    function abreFormVisualizarDev(pCodSequencia: Integer; pValorDev: Double): Boolean;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function abreFormRecibo: boolean;

    // função para João utilizar na Nota fiscal;
//     function LancarDevolucaodeNotaFiscal (vCodnf : string) : Boolean;

    // função na tela de adionar estoque a grade.
    function ValorAcrescimo(Query: TClientDataSet; Campo: string; GrupoProd: Integer; CodProd: string): Real;
    function SomaQtde(Query: TClientDataSet; Campo: string): Real;
    procedure CadDevolucao(TipoForm: Integer);
    function _abreFormAlterarValorDev: Boolean;
    function _abreFormSelecionaGrade(pGrupo: integer; pCodProd: string): Boolean;
    property vQuantidadeJaDev: double read FQuantidadeJaDev write FQuantidadeJaDev;
    property vQuantidadeJaDevConv: double read FQuantidadeJaDevConv write FQuantidadeJaDevConv;
    property vDevRapida: boolean read FDevRapida write FDevRapida default false;

  var
    vPedVendaProd: TPedVendaProd_Dev;
    vPedvenda: TPedvenda_Dev;
    vEmpresa: TEmpresa_Dev;
    vProduto: TProduto_Dev;
    vGrade: TGrade_Dev;
    vDevolucaoGrade: TDevolucaoGrade_Dev;
    vRecibo: TRecibo_Dev;
    vCliente: TCliente_Dev;
    vVendedor: TVendedor_Dev;
    vNF: TNf_Dev;

    vPossuiGrade: Boolean;
    vExisteVenda: Boolean;

    //   variaveis para o lançamento da devolução e Devolução Grade.
    //   que pegam os valores dos edits (tela de lançamento da devolução).
    vseqid, vSequencia: Integer;
    vGrupoProdPesq, vCodProdPesq, vUnidadePesq: string;
    vCodProd, vCodBarra: string;
    vPercDesconto: string;
    vUnidade: string; 
    vQuant: Currency;
    vCodCliente: string;
    vcodVendedor: integer;
    vtipo, vTipv: string;
    vCodVenda: string;
    vtipoVenda: string;
    vcodgrade: integer;

    //   Variavel da tela de VerificaEstoqueGradeProduto;
    vQuantInc: Currency;

    //   variaveis da Inserção de estoque na grade do produto devolvido.
    vquantreq: Currency;
    vsoma: Currency;
    vAcrescimo: Currency;
    vGrupoProd: string;
    vregracons: string;

    //   variavel utilizada na impressão matricial
    linha: Integer;

    //   variavel utilizada na tela de pesquisa de devoluções.
    //   e pesquisa de vendas
    vdataini, vdatafin: string;
    vcodcli: string;
    vImpPesquisa: Integer;

    //   variavel utilizada na pesquisa de vendas.
    vNped: string;
    vDAV: string;

    // variavel utilizada na para abrir tela para inserir estoque a grade do produto.
    vInserirEstoqueGrade: Boolean;
    vAcrescimoGrade: Currency;

  end;

  TPedVendaProd_Dev = class(TDataSet_OOP)
  public
    constructor create;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure dataSetCalcFields(DataSet: TDataSet);
  end;

  TEmpresa_Dev = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TProduto_Dev = class(TDataSet_OOP)
  public
    constructor create;
    function cancel: Boolean; override;
    function post: Boolean; override;
  var
    vCodBarra: string;
    vPesqDescrProd: boolean;
  end;

  TGrade_Dev = class(TDataSet_OOP)
  public
    constructor create;
    function post: Boolean; override;
    function cancel: Boolean; override;
    function somentePost: Boolean;
  end;

  TDevolucaoGrade_Dev = class(TDataSet_OOP)
  public
    constructor create;
    function insert: Boolean; override;
    function post: Boolean; override;
    function delete: Boolean; override;
    function cancel: Boolean; override;
    function abreDevolucaoGrade: Boolean;
    function somentePost: Boolean;
  end;

  TRecibo_Dev = class(TDataSet_OOP)
  public
    constructor create;
    function insert: Boolean; override;
    function post: Boolean; override;
    function cancel: Boolean; override;
    function abreRecibo: Boolean;
    function somentePost: Boolean;
  end;

  TCliente_Dev = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TVendedor_Dev = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TPedvenda_Dev = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TNf_Dev = class(TDataSet_OOP)
  public
    constructor create;
  end;

implementation

uses
  uDadosIni, SysUtils, Forms, Windows, uDtmAtivo, udtmDevolucao,
  Controls, uPadrao, ExtCtrls, Variants, UDevolucao, Classes, IBScript, Math, StrUtils, 
  config_sistema_class;

procedure dev_gerardevolucao(ANped: Integer; ATipo: string; ADataFech: TDateTime);
var
  vDevTotal: boolean;
begin
	try
  	vDevTotal := False;
//    vDevTotal := Application.MessageBox('Devolução total de mercadoria?', 'Atenção', MB_ICONINFORMATION + MB_YESNO) = mrYes;

    if dtmDevolucao = nil then
      dtmDevolucao := TdtmDevolucao.Create(dtmDevolucao);
    if not vDadosIni.PesqPros('DEV016', 'ABRIR', '', 'DEVOLUCAO','',dtmDevolucao.qrBuscas, true) then
    begin
      dtmDevolucao.Free;
      dtmDevolucao := nil;
      exit;
    end;
    vDadosIni.vTipoForm := 999;
    vDadosIni.vPesquisa := 'DEVOLUCAO_VENDA|' + IntToStr(ANped) + '|' + Trim(ATipo) + '|';
    vDadosIni.vPesquisaNPed       := IntToStr(ANped);
    vDadosIni.vPesquisaTipo       := ATipo;
    vDadosIni.vPesquisaData       := FormatDateTime('dd/mm/yyyy', ADataFech);

    if vDevTotal then
      vDadosIni.vPesquisaDevTotal := 'S'
    else
    	vDadosIni.vPesquisaDevTotal := 'N';

    vDadosIni.vModalOuChild := 'M';
    if frmDevolucao = nil then
      Application.CreateForm(TfrmDevolucao, frmDevolucao);
    frmDevolucao.Tag := vDadosIni.vTipoForm;
      
    frmDevolucao.ShowModal;
  finally
  	vDadosIni.vTipoForm         := 0;
    vDadosIni.vPesquisaNPed     := '';
    vDadosIni.vPesquisaTipo     := '';
    vDadosIni.vPesquisaData     := '';
    vDadosIni.vPesquisaDevTotal := '';
  end;
end;

exports
  dev_gerardevolucao;
  
{ TDevolucao }

procedure TDevolucao.CadDevolucao(TipoForm: Integer);
begin
  if vDadosIni.vEmp.vDev_UsarControleInternoDevolucao = 'N' then
  begin
    Application.MessageBox('Controle Interno de Devolução desativado no cadastro da empresa', 'Atenção', 0 + 64);
    Exit;
  end;
  vDadosIni.vTipoForm := TipoForm;
  if dtmDevolucao = nil then
    dtmDevolucao := TdtmDevolucao.Create(dtmDevolucao);
  if not vDadosIni.PesqPros('DEV016', 'ABRIR', '', 'DEVOLUCAO','',dtmDevolucao.qrBuscas, true) then
  begin
    dtmDevolucao.Free;
    dtmDevolucao := nil;
    exit;
  end;
  if frmDevolucao = nil then
    Application.CreateForm(TfrmDevolucao, frmDevolucao);
  frmDevolucao.Show;
end;

function TDevolucao.cancel: Boolean;
begin
  inherited Cancel;
  RollBackTransacao;
end;

function TDevolucao.abredevolucao: Boolean;
begin

  // abre selecionando todos onde sequencia = 0;
  result := montaSelect('select * from DEVOLUCAO where SEQUENCIA = 0');
  vDevolucaoGrade.abreDevolucaoGrade;
  vRecibo.abreRecibo;

  vPedvenda.dataSet.AfterScroll := VendasAfterScroll;

end;

function TDevolucao.abreFormRecibo: boolean;
var
  hdTemp: THandle;
  formulario: TForm;
begin
   formulario := Funcoes.AbreForm('pkRecibo','TFrmCadRecibo', hdTemp);
  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TDevolucao.abreFormVisualizarDev(pCodSequencia: Integer; pValorDev: Double): Boolean;
var
  formulario: TfrmPadrao;
  buscas2, buscas3: TIBQuery;
  dtSource2: TDataSource;
  vCodCliente: Integer;
  vNomeCliente: string;
  vDataAtual: TDateTime;
  I: Integer;
begin
  try
    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas3 := TIBQuery.Create(Application);
    buscas3.Database := buscas.Database;
    buscas3.Transaction := buscas.Transaction;

    buscas2.Close;
    buscas2.SQL.Text := ' select cod_cliente, nome_cliente from devolucao dev ' +
    	' where sequencia = :sequencia and cod_empresa = :cod_empresa ';
    buscas2.ParamByName('sequencia').AsInteger := pCodSequencia;
    buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.Open;  

    vCodCliente := buscas2.FieldByName('cod_cliente').AsInteger;
    vNomeCliente := (buscas2.FieldByName('nome_cliente').AsString);

    buscas2.Close;
    buscas2.SQL.Text := ' select rec.nrecibo, rec.num_rec_dep "Num vale", rec.data_rec "Data vale", rec.valor "Importância", ' +
    	' rec.benef_client "Beneficiário", rec.nome_dev "Nome credor", rec.historico_rec "Historico", ' +
      ' rec.status_rec "Status do vale", rec.cod_devedor "Código devedor", col.nome_vendedor "Usuario" ' +
      ' from recibos rec ' +
      ' left join colaborador col on col.cod_vendedor = rec.cod_us and col.cod_empresa = rec.cod_empresa ' +
      ' where rec.nrecibo = :nrecibo and rec.cod_empresa = :cod_empresa ';
    buscas2.ParamByName('nrecibo').AsInteger := pCodSequencia;
    buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.Open;

    buscas2.FieldByName('nrecibo').Visible := False;

    for i := 0 to buscas2.Fields.Count - 1 do
      if buscas2.Fields[i].DataType = ftFloat then
        TFloatField(buscas2.Fields[i]).DisplayFormat := '##0.00';
         
    frmDevolucao.BitBtn112.Visible := buscas2.IsEmpty;

    dtSource2:= TDataSource.Create(Application);
    dtSource2.DataSet := buscas2;

    frmDevolucao.pnRecibosDev.Visible := true;
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Vale Compra (Devolução: ' + IntToStr(pCodSequencia) + ')';
    frmDevolucao.pnRecibosDev.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];
    frmDevolucao.DBGrid28.DataSource := dtSource2;

    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
       try
         buscas.Close;
         buscas.SQL.Text := ' select * from recibos ' +
           ' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
         buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
         buscas.ParamByName('NRECIBO').AsInteger := pCodSequencia;
         buscas.Open;
         if buscas.IsEmpty then
         begin
					 vDataAtual := vDadosIni.getDataBanco(buscas);

           buscas.Close;
           buscas.SQL.Text := ' INSERT INTO RECIBOS ' +
             ' (NRECIBO, COD_EMPRESA, VALOR, REFERENCIA1, BENEF_CLIENT, NOME_DEV, ' +
             ' DATA_REC, DATA_BAIXA, RECANT, COD_BENEF, DEPREC, NDOCANT, COD_US, ATIVO, VALOR_ORIG, DEVOLUCAO, ' +
             ' NUM_REC_DEP, ATRAVES1, COD_DEPTO, DATA_VENC) ' +
             ' VALUES (:NRECIBO, :COD_EMPRESA, :VALOR, :REFERENCIA1, :BENEF_CLIENT, :NOME_DEV, ' +
             ' :DATA_REC, :DATA_BAIXA, :RECANT, :COD_BENEF, :DEPREC, :NDOCANT, :COD_US, :ATIVO, :VALOR_ORIG, :DEVOLUCAO, ' +
             ' :NUM_REC_DEP, :ATRAVES1, :COD_DEPTO, :DATA_VENC); ';
           buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
           buscas.ParamByName('NRECIBO').AsInteger := pCodSequencia;
           if vDadosIni.vRecibo.HabRecPorDepart then
             buscas.ParamByName('NUM_REC_DEP').AsString := trim(retornaNumRec)
           else
             buscas.ParamByName('NUM_REC_DEP').AsInteger := buscas.ParamByName('NRECIBO').AsInteger;
           if vDadosIni.vRecibo.HabRecPorDepart then
             buscas.ParamByName('COD_DEPTO').AsInteger := retornaCodDepto;
           buscas.ParamByName('REFERENCIA1').AsString := copy('VALE COMPRA CONF. DEVOLUÇÃO: ' +
            vDadosIni.IfThen(vDadosIni.vRecibo.HabRecPorDepart, buscas.ParamByName('NUM_REC_DEP').AsString, vDadosIni.StrZero(pCodSequencia, 6)), 1, 66);
           buscas.ParamByName('ATRAVES1').AsString := '...';
           buscas.ParamByName('BENEF_CLIENT').AsString := copy(Trim(vNomeCliente), 1, 40);
           buscas.ParamByName('NOME_DEV').AsString := copy(vDadosIni.vEmp.vnomeEmpresa,1, 50);
           buscas.ParamByName('DATA_REC').AsDateTime := vDataAtual;
           buscas.ParamByName('DATA_BAIXA').AsDateTime := vDataAtual;
           buscas.ParamByName('RECANT').AsString := 'S';
           buscas.ParamByName('COD_BENEF').AsInteger := vCodCliente;
           buscas.ParamByName('DEPREC').AsString := 'E';
           buscas.ParamByName('NDOCANT').AsInteger := pCodSequencia;
           buscas.ParamByName('COD_US').AsInteger := vDadosIni.vCodUsuario;
           buscas.ParamByName('ATIVO').AsInteger := 1;
           buscas.ParamByName('DEVOLUCAO').AsString := 'S';
           buscas.ParamByName('VALOR').AsFloat := RoundTo(pValorDev, -2);
           buscas.ParamByName('VALOR_ORIG').AsFloat := RoundTo(pValorDev, -2);

           if (vDadosIni.vRecibo.Baixar.vUtilizarDataVencimentoRecAntValeCompra = 'S') and (trim(vDadosIni.vRecibo.Baixar.vDiasVencimentoRecAntValeCompra) <> '') then
           	 buscas.ParamByName('DATA_VENC').AsDateTime := vDataAtual + StrToInt(trim(vDadosIni.vRecibo.Baixar.vDiasVencimentoRecAntValeCompra));

           buscas.ExecSQL;

           CommitaTransacao;
           vDadosIni.GravaAuditoria('DEV021', 'GERAR', 'SUCESSO', 'DEVOLUCAO', IntToStr(pCodSequencia), buscas);
         end;
       except
         on e: exception do
    		begin
         	vDadosIni.GravaAuditoria('DEV021', 'GERAR', 'FALHA', 'DEVOLUCAO', IntToStr(pCodSequencia), buscas);
         	RollBackTransacao;
            Application.MessageBox(pchar('Erro ao gerar vale compra. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
            registraErro('DEV ' + e.Message);
         end;
       end;
    end;
    frmDevolucao.pnRecibosDev.Parent := frmDevolucao.TabSheet5;
    frmDevolucao.pnRecibosDev.Visible := false;
    formulario.Free;
    formulario := nil;
  end;
end;

function TDevolucao.ApagarDevolucao: Boolean;
var
  variavel: string;
  vCodDev: Integer;
  vCodVnd: Integer;
  vTipoVnd: string;
begin
  Result := False;
  if not dtmDevolucao.qrBuscas02.IsEmpty then
  begin
    vCodDev := dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsInteger;
    vCodVnd := dtmDevolucao.qrBuscas02.FieldByName('cod_venda').AsInteger;
    vTipoVnd := trim(dtmDevolucao.qrBuscas02.FieldByName('tipo_venda').AsString);

    if Application.MessageBox('Deseja continuar o Cancelamento da Devolução?', 'Atenção', MB_ICONINFORMATION + MB_YESNO) = mrYes then
    begin
      if not PossuiFormPagemento (StrToInt(dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsString)) then
      begin
       Application.MessageBox('Devolução possui vale compra aproveitado em uma nova venda. Não é possível apagar!', 'Atenção', MB_ICONERROR + MB_OK);
       exit;
      end;

      buscas.Close;
      buscas.SQL.Clear;
      buscas.SQL.Add('select * from DEVOLUCAO ' +
        'where cod_empresa = ' + vDadosIni.codEmpresa + ' ' +
        'and SEQUENCIA = ' + dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsString + ' ' +
        'and ativo = 1 ');
      buscas.Open;
      buscas.First;

      // Tira o estoque dos produtos.
      if not TiraEstoqueGradeeProduto then
      begin
        CancelaOperacoes;
        exit;
      end;

      try

        // Deleta devolução da grade.
        ExecutaComandosSqlExec('delete from devolucao_grade ' +
          'where COD_DEVOLUCAO = ' + dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsString + ' ' +
          'and cod_empresa = ' + vDadosIni.codEmpresa + ' ' +
          'and ativo = 1');

        // Deleta devolução.
        ExecutaComandosSqlExec('delete from devolucao ' +
          'where sequencia = ' + dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsString + ' ' +
          'and cod_empresa = ' + vDadosIni.codEmpresa + ' ' +
          'and ativo = 1 ');

        // Deleta o recibo.
        ExecutaComandosSqlExec('delete from recibos ' +
          'where nrecibo = ' + dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsString + ' ' +
          'and cod_empresa = ' + vDadosIni.codEmpresa + ' ' +
          'and ativo = 1');

        // Atualizar pontos programa de fidelidade
        if not vDadosIni.setarPontosProgFidelidade(vCodDev, 'DEV', buscas, false, vCodVnd, vTipoVnd) then
        begin
          CancelaOperacoes;
          Exit;
        end;

        if not CommitaTransacao then
        begin
          Application.MessageBox('Ocorreu um erro ao apagar a devolução. A devolução não foi apagada.', 'Atenção', MB_ICONERROR + MB_OK);
          CancelaOperacoes;
          Result := False;
          Exit;
        end
        else
          Result := True;
      except on E: Exception do
        begin
          RollBackTransacao;
          Result := False;
          vDadosIni.registraErro('TDevolucao.ApagarDevolucao ' + E.Message);
          vDadosIni.ShowErro('Erro ao excluir devolução. Erro: ' + e.Message);
        end;
      end;

    end;
  end
  else
  begin
    Application.MessageBox('Favor selecionar uma devolução!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    Result := False;
  end;

end;

procedure TDevolucao.CabecalhoImpressaoMatricial(rdimp: TRDprint);
var
 vTemp: string;
 buscas2: TIBQuery;
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  linha := 1;
  //  if not vEmpresa.dataSet.Active then
  //    vEmpresa.montaSelect('select * from empresa where cod_empresa='+vDadosIni.codEmpresa +' and ativo=1');

  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    buscas2.Close;
    buscas2.SQL.Text := ' select d.sequencia, rec.num_rec_dep from devolucao d ' +
    	' inner join recibos rec on rec.nrecibo = d.sequencia and rec.cod_empresa = d.cod_empresa ' +
      ' where d.sequencia = ';
    if vImpPesquisa = 0 then
	    buscas2.SQL.Text := buscas2.SQL.Text + IntToStr(dataSet.FieldByName('sequencia').AsInteger);
    if vImpPesquisa = 1 then
	    buscas2.SQL.Text := buscas2.SQL.Text + IntToStr(buscas.FieldByName('sequencia').AsInteger);
    buscas2.SQL.Text := buscas2.SQL.Text + ' and d.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas2.Open;

    vTemp := vDadosIni.IfThen(buscas2.FieldByName('num_rec_dep').AsString <> '',
      buscas2.FieldByName('num_rec_dep').AsString, dataSet.FieldByName('sequencia').AsString);
  end
  else
  begin
    if vImpPesquisa = 0 then
		  vTemp := dataSet.FieldByName('sequencia').AsString;
    if vImpPesquisa = 1 then
      vTemp := buscas.FieldByName('sequencia').AsString;
  end;

  if (vImpPesquisa = 0) or (vImpPesquisa = 1) then
	  rdImp.ImpC(linha, 65, 'Relação de Itens Devolvidos - Devolução: ' + vTemp, [Normal, negrito]);

  Inc(linha, 2);
  //  rdImp.impf(linha, 2, vEmpresa.dataSet.FieldByName('nome_emp').AsString , [negrito]);
  rdImp.impf(linha, 2, trim(vDadosIni.vEmp.vnomeEmpresa), [negrito]);
  Inc(linha);

  if vImpPesquisa = 0 then
  begin
    rdImp.impf(linha, 2, dataSet.FieldByName('nome_cliente').AsString, [comp17, negrito]);
    rdImp.impf(linha, 50, dataSet.FieldByName('telefone').AsString, [comp17, negrito]);
    Inc(linha);
    rdImp.impf(linha, 2, dataSet.FieldByName('endereco').AsString, [comp17, negrito]);
  end;
  if vImpPesquisa = 1 then
  begin
    rdImp.impf(linha, 2, buscas.FieldByName('nome_cliente').AsString, [comp17, negrito]);
    rdImp.impf(linha, 50, buscas.FieldByName('telefone').AsString, [comp17, negrito]);
    Inc(linha);
    rdImp.impf(linha, 2, buscas.FieldByName('endereco').AsString, [comp17, negrito]);
  end;

  inc(linha);
  rdImp.Impf(linha, 1, vDadosIni.Replicate('=', 132), [comp17]);
  inc(linha);
  rdImp.Imp(linha, 002, 'Num Fab');
  rdImp.Imp(linha, 021, 'Descrição');
  rdImp.ImpD(linha, 052, 'Vendedor', []);
  rdImp.ImpD(linha, 060, 'Unidade', []);
  rdImp.ImpD(linha, 068, 'Qtde', []);
  rdImp.Imp(linha, 072, 'Valor Unit');
  rdImp.Imp(linha, 086, 'Valor Total');
  rdImp.Imp(linha, 098, 'Data');
  rdImp.Imp(linha, 111, 'Cod Venda');
  rdImp.Imp(linha, 122, 'Tipo');
  rdImp.ImpD(linha, 132, 'Grade', []);
  inc(linha);

  rdImp.Impf(linha, 1, vDadosIni.Replicate('=', 132), [comp17]);
  inc(linha);
end;

function TDevolucao.CancelaOperacoes: Boolean;
begin
  RollBackTransacao;
  Cancel;
  vGrade.Cancel;
  vRecibo.Cancel;
  vDevolucaoGrade.Cancel;
  vProduto.Cancel;
end;

function TDevolucao.CancelarEdicaoEstoqueGradeProduto: Boolean;
begin
  if vGrade.Cancel then
    Result := True
  else
    Result := False;
end;

function TDevolucao.ConcluindoDevolucao(pCodVenda:string): Boolean;
begin
  try
    result:=false;
    if trim(pCodVenda) <> '' then
      if vDadosIni.isnumeroint(trim(pCodVenda)) then
      begin
        if not ExecutaComandosSql(' select v.nped, v.tipo, v.cod_empresa from pedvenda v ' +
        	' where v.nped = ' + pCodVenda +
          ' and v.tipo = ' + QuotedStr(vtipoVenda) +
          ' and v.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and coalesce(v.status_ped, '''') = ''FECHADA'' ') then
        begin
          Application.MessageBox('Pedido de venda ( OS/REQ ) informado não se encontra "CONFIRMADO".'+chr(13)+'A devolução não poderá ser concluída.', 'Atenção', MB_ICONINFORMATION + MB_OK);
          exit;
        end;
      end
      else
      	exit;

    vDadosIni.abreStatusProcessamento('', 'Concluindo o processo de devolução. Aguarde...');
    if not VerificaseExisteDevolucao then
    begin
      Application.MessageBox('Não existem itens lançados na devolução, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);
      CancelaOperacoes;
      Exit;
    end;
   // Insere um DevoluçãoGrade , se existir grade do produto e não tiver sido informado a grade na Devolução.
    if not VerificaGradeProdutoDevolvido then
    begin
      CancelaOperacoes;
      Exit;
    end;     
    {
    if not VoltaEstoqueGradeeProduto then // Volta o estoque da grade e do Produto;
    begin
      CancelaOperacoes;
      Exit;
    end;
    }
    if not InserirClientenaDevolucao then // Insere o codigo do cliente e todas as devoluções Lançadas. ( o cliente agora só pode ser um para todas as devoluçõea da mesma sequencia).
    begin
      CancelaOperacoes;
      Result := False;
      Exit;
    end;

    if not GerarSequencia then // Gera o número de sequencia e altera na tabelas necessárias.
    begin
      CancelaOperacoes;
      Exit;
    end;

    if not GerarRecibo then // Gera o recibo para o cliente.
    begin
      CancelaOperacoes;
      Exit;
    end;

    if not VoltaEstoqueGradeeProduto then // Volta o estoque da grade e do Produto;
    begin
      CancelaOperacoes;
      Exit;
    end;

    if not ConfirmaOperacoes then // da o apply em todas as tabelas Pendentes.
    begin
      Application.MessageBox('Ocorreu um erro ao salvar a devolução. A devolução será cancelada.', 'Atenção', MB_ICONERROR + MB_OK);
      CancelaOperacoes;
      Exit;
    end
    else vDadosIni.GravaAuditoria('DEV003', 'CONFIRMAR - SUCESSO','BT CONCLUIR DEVOLUCAO.', 'DEVOLUCAO',
      obDevolucao.dataSet.FieldByName('sequencia').AsString, obDevolucao.buscas);
    Result := true;
    ImprimirDevolucao; // Permite imprimir a devolução no modo gráfico e matricial.
  finally
    CancelaOperacoes;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TDevolucao.ConfirmaOperacoes: Boolean;
var
 vCodDev: Integer;
 vCodVnd: Integer;
 vTipoVnd: string;
begin
  Result := True;
  vCodDev := dataSet.FieldByName('sequencia').AsInteger;
  vCodVnd := dataSet.FieldByName('cod_venda').AsInteger;
  vTipoVnd := trim(dataSet.FieldByName('tipo_venda').AsString);
  IniciaTransacao;
  try
    if not Post then
      result := false;

    if result <> false then
      if not vGrade.Post then
        result := false;

    if result <> false then
      if not vRecibo.Post then
        result := false;

    if result <> false then
      if not vDevolucaoGrade.Post then
        result := false;

    if result <> false then
      if not vProduto.Post then
        result := false;

    // Atualizar pontos programa de fidelidade
    if Result then
      if not vDadosIni.setarPontosProgFidelidade(vCodDev, 'DEV', buscas, true, vCodVnd, vTipoVnd) then
        Result := false;

    if Result then
      CommitaTransacao
    else
      RollBackTransacao;
  except
    on e: exception do
    begin
      RollBackTransacao;
      result := false;
      Application.MessageBox(pchar('Erro ao Gravar devoluções. Erro: ' + e.Message),
        'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('DEV ' + e.Message);
    end;
  end;
end;

constructor TDevolucao.create;
begin
	if (vDadosIni.vEmp.vCasasDecimais <= 0) then
    vDadosIni.vEmp.vCasasDecimais := 2;
  
  if dtmdevolucao = nil then
    dtmdevolucao := Tdtmdevolucao.Create(Application);
  dataSet := TClientDataSet(dtmdevolucao.cdsDevolucao);
  buscas := TIBQuery(dtmdevolucao.qrBuscas);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
  vMovimentaEstoque := TIBStoredProc(dtmDevolucao.SpMovEst);

  dataSet.OnCalcFields := dataSetCalcFields;

  vPedVendaProd := TPedVendaProd_Dev.Create;
  vEmpresa := TEmpresa_Dev.create;
  vProduto := TProduto_Dev.create;
  vGrade := TGrade_Dev.create;
  vDevolucaoGrade := TDevolucaoGrade_Dev.create;
  vRecibo := TRecibo_Dev.create;
  vCliente := TCliente_Dev.create;
  vVendedor := TVendedor_Dev.create;
  vPedvenda := TPedvenda_Dev.create;
  vNF := TNf_Dev.create;
  vseqid := 0;

  {$REGION 'gettex'}
  dataSet.FieldByName('UNIDADE_CONV').OnGetText                      := GetTextItemDevStringFormatUnConv;

  vPedVendaProd.dataSet.FieldByName('UNIDADE_CONV').OnGetText        := GetTextItemStringFormatUnConv;
  vPedVendaProd.dataSet.FieldByName('VLUN_PED_ITEM').OnGetText       := GetTextItemFloatFormat;
  vPedVendaProd.dataSet.FieldByName('VLTOT_PED_ITEM').OnGetText      := GetTextItemFloatFormat;
  vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM').OnGetText      := GetTextItemFloatFormat;

  {$ENDREGION}

  {$REGION 'settext'}
  dataSet.FieldByName('UNIDADE_CONV').OnSetText                      := SetTextItemDevStringFormatUnConv;

  vPedVendaProd.dataSet.FieldByName('UNIDADE_CONV').OnSetText        := SetTextItemStringFormatUnConv;
  vPedVendaProd.dataSet.FieldByName('VLUN_PED_ITEM').OnSetText       := SetTextItemFloatFormat;
  vPedVendaProd.dataSet.FieldByName('VLTOT_PED_ITEM').OnSetText      := SetTextItemFloatFormat;
  vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM').OnSetText      := SetTextItemFloatFormat;
  {$ENDREGION}

  {$REGION 'display'}
  TFloatField(dataSet.FieldByName('VALOR')).DisplayFormat := '##0.' +
    vDadosIni.StrZero(0, vDadosIni.vEmp.vCasasDecimais);
  TFloatField(dataSet.FieldByName('VALOR_CONV')).DisplayFormat := '##0.' +
    vDadosIni.StrZero(0, vDadosIni.vEmp.vCasasDecimais);
  TFloatField(dataSet.FieldByName('VALOR_TOT')).DisplayFormat := '##0.00';
  TFloatField(dataSet.FieldByName('QUANT')).DisplayFormat := '##0.0000';
  TFloatField(dataSet.FieldByName('QUANT_CONV')).DisplayFormat := '##0.0000';

  TFloatField(vPedVendaProd.dataSet.FieldByName('VLUN_PED_ITEM')).DisplayFormat := '##0.' +
    vDadosIni.StrZero(0, vDadosIni.vEmp.vCasasDecimais);
  TFloatField(vPedVendaProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV')).DisplayFormat := '##0.' +
    vDadosIni.StrZero(0, vDadosIni.vEmp.vCasasDecimais);
  TFloatField(vPedVendaProd.dataSet.FieldByName('VLTOT_PED_ITEM')).DisplayFormat := '##0.00';
  TFloatField(vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM')).DisplayFormat := '##0.0000';
  TFloatField(vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV')).DisplayFormat := '##0.0000';
  TFloatField(vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP')).DisplayFormat := '##0.0000';
  TFloatField(vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP_CONV')).DisplayFormat := '##0.0000';
  {$ENDREGION}
end;

procedure TDevolucao.dataSetCalcFields(DataSet: TDataSet);
begin
	if vDadosIni.vEmp.vCasasDecimais <= 0 then
    vDadosIni.vEmp.vCasasDecimais := 2;

	if (trim(DataSet.FieldByName('UNIDADE_CONV').AsString) = '')
    or (trim(DataSet.FieldByName('UNIDADE').AsString) = trim(DataSet.FieldByName('UNIDADE_CONV').AsString)) then
  begin
  	if DataSet.FieldByName('QUANT_CONV').AsFloat <= 0 then
  		DataSet.FieldByName('QUANT_CONV').AsFloat := RoundTo(
      	DataSet.FieldByName('QUANT').AsFloat, - 4);

    if DataSet.FieldByName('VALOR_CONV').AsFloat <= 0 then
    	DataSet.FieldByName('VALOR_CONV').AsFloat := RoundTo(
      	DataSet.FieldByName('VALOR').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

    DataSet.FieldByName('FATOR_CONV_TEMP').AsString := '';
  end
  else
  begin
    if (DataSet.FieldByName('OPERACAO_CONV').AsString = 'M') and (DataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
    begin
    	if DataSet.FieldByName('QUANT_CONV').AsFloat <= 0 then
        DataSet.FieldByName('QUANT_CONV').AsFloat := RoundTo(
          DataSet.FieldByName('QUANT').AsFloat *
            DataSet.FieldByName('FATOR_CONV').AsFloat, - 4);

      if DataSet.FieldByName('VALOR_CONV').AsFloat <= 0 then
        DataSet.FieldByName('VALOR_CONV').AsFloat := RoundTo(
          DataSet.FieldByName('VALOR').AsFloat /
            DataSet.FieldByName('FATOR_CONV').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

      DataSet.FieldByName('FATOR_CONV_TEMP').AsString :=
        FloatToStr(RoundTo(1, -4)) + ' ' +
        trim(DataSet.FieldByName('UNIDADE').AsString) + ' = ' +
        FloatToStr(RoundTo(DataSet.FieldByName('FATOR_CONV').AsFloat, -4)) + ' ' +
        trim(DataSet.FieldByName('UNIDADE_CONV').AsString);
    end
    else if (DataSet.FieldByName('OPERACAO_CONV').AsString = 'D') and (DataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
    begin
    	if DataSet.FieldByName('QUANT_CONV').AsFloat <= 0 then
        DataSet.FieldByName('QUANT_CONV').AsFloat := RoundTo(
          DataSet.FieldByName('QUANT').AsFloat /
            DataSet.FieldByName('FATOR_CONV').AsFloat, - 4);

    	if DataSet.FieldByName('VALOR_CONV').AsFloat <= 0 then
        DataSet.FieldByName('VALOR_CONV').AsFloat := RoundTo(
          DataSet.FieldByName('VALOR').AsFloat *
            DataSet.FieldByName('FATOR_CONV').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

      DataSet.FieldByName('FATOR_CONV_TEMP').AsString :=
        FloatToStr(RoundTo(1, -4)) + ' ' +
        trim(DataSet.FieldByName('UNIDADE_CONV').AsString) + ' = ' +
        FloatToStr(RoundTo(DataSet.FieldByName('FATOR_CONV').AsFloat, -4)) + ' ' +
        trim(DataSet.FieldByName('UNIDADE').AsString);
    end
    else
    begin
      if DataSet.FieldByName('QUANT_CONV').AsFloat <= 0 then
    		DataSet.FieldByName('QUANT_CONV').AsFloat := RoundTo(
        	DataSet.FieldByName('QUANT').AsFloat, - 4);

      if DataSet.FieldByName('VALOR_CONV').AsFloat <= 0 then
    		DataSet.FieldByName('VALOR_CONV').AsFloat := RoundTo(
        	DataSet.FieldByName('VALOR').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

      DataSet.FieldByName('FATOR_CONV_TEMP').AsString := '';  
    end;
  end;
end;

function TDevolucao.delete: Boolean;
begin
  Result := False;
  if not dataSet.IsEmpty then
  begin

    if vDevolucaoGrade.dataSet.Locate('COD_DEVOLUCAO;GRUPO_PROD;COD_PROD;COD_EMPRESA;SEQID', VarArrayOf([dataSet.FieldByName('sequencia').AsString, dataSet.FieldByName('grupo_prod').Asinteger, dataSet.FieldByName('cod_prod').AsString, strtoint(vDadosIni.codEmpresa), dataSet.FieldByName('SEQID').AsInteger]), []) then
    begin
      if not vDevolucaoGrade.dataSet.IsEmpty then
        vDevolucaoGrade.dataSet.Delete;
    end;

    inherited Delete;
  end;
  if dataSet.IsEmpty then
    Result := True;
end;

function TDevolucao.desfazerEdicaoEstoqueGradeProduto: Boolean;
begin
  if vGrade.dataSet.ChangeCount = 0 then
  begin
    exit;
    Result := False;
  end;

  vGrade.dataSet.RevertRecord;
  Result := True;
end;

function TDevolucao.edit: Boolean;
begin
  if dataset.IsEmpty then
    Exit;
  result := inherited Edit;
end;

function TDevolucao.EditarEstoqueGradeProduto: Boolean;
begin

  vAcrescimo := 0;

  if Trim(CurrToStr(vQuant)) <> '' then
  begin
    if vQuant < 0 then
      vQuant := vQuant * (-1);

    if (vAcrescimoGrade + vQuant) > vQuantReq then
      raise Exception.Create('A quantidade informada ultapassa a quantidade da nota.');

    if vGrade.Edit then
    begin
      vGrade.dataSet.FieldByName('qtde').AsFloat := RoundTo(vGrade.dataSet.FieldByName('qtde').AsFloat + vQuant, - 4);
      vGrade.somentePost;

      vAcrescimoGrade := vAcrescimoGrade + vQuant;

      frmDevolucao.Label14.Caption := CurrToStr(vAcrescimoGrade);
      frmDevolucao.Edit2.Clear;
    end;
  end;
end;

function TDevolucao.GerarRecibo: Boolean;
var
  vflag: integer;
  StrValor: string;
  vvalorDevolucao: Double;
  Config: TConfig_sistema_class;
  vUtilizarDataVencimento: string;
  vDiasVencimento: string;
  vDataAtual: TDateTime;
begin
  try
    if (vDadosIni.vusRecDev = 'S') or (vDadosIni.vEmp.vUsarValorDEVFormPag = 'S') then
    begin
      vflag := 0;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if uppercase(dataSet.FieldByName('TIPO').AsString) = 'D' then
        begin
          vflag := 1;
          break;
        end;
        dataSet.next;
      end;
      if vflag = 1 then
      begin
        if vDadosIni.vEmp.vUsarValorDEVFormPag = 'S' then
        else
        begin
          while True do
          begin
             if Application.MessageBox('Deseja fazer recibo antecipado(VALECOMPRA) desta devolução?', 'Atenção', MB_ICONINFORMATION + MB_YESNO) = mrNO then
             begin
               if vDadosIni.PesqPros('DEV019', 'NAO GERAR', '', 'DEVOLUCAO',
                dataSet.FieldByName('SEQUENCIA').AsString, buscas, False) then
               begin
                 Result := true;
                 exit;
               end;
             end
             else
               break;
          end;
        end;
      end;
      dataSet.First;
      vvalorDevolucao := 0;
      while not dataSet.Eof do
      begin
        //vvalorDevolucao := vvalorDevolucao + vDadosIni.StrToFloatFormat((dataSet.FieldByName('quant').AsCurrency * dataSet.FieldByName('valor').AsCurrency), 2);
        vvalorDevolucao := vvalorDevolucao + (ffloat('quant') * ffloat('valor'));
        dataSet.Next;
      end;

      StrValor := ffloat_fb(vvalorDevolucao);
      vvalorDevolucao := RoundTo(SqlOpen('select round(' + StrValor +  ', 2) valor from rdb$database').FieldByName('valor').AsFloat, -2);

      vDataAtual := vDadosIni.getDataBanco(buscas);

      if vRecibo.Insert then
      begin
        vRecibo.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        vRecibo.dataSet.FieldByName('nrecibo').AsInteger := vSequencia;
        if vDadosIni.vRecibo.HabRecPorDepart then
        	vRecibo.dataSet.FieldByName('num_rec_dep').AsString := trim(retornaNumRec)
      	else
        	vRecibo.dataSet.FieldByName('num_rec_dep').AsInteger := vRecibo.dataSet.FieldByName('nrecibo').AsInteger;
        if vDadosIni.vRecibo.HabRecPorDepart then
			    vRecibo.dataSet.FieldByName('COD_DEPTO').AsInteger := retornaCodDepto;
        vRecibo.dataSet.FieldByName('referencia1').AsString := 'VALE COMPRA CONF. DEVOLUÇÃO: ' +
        vDadosIni.IfThen(vDadosIni.vRecibo.HabRecPorDepart,
        	vRecibo.dataSet.FieldByName('NUM_REC_DEP').AsString,
          vDadosIni.StrZero(vSequencia, 6));
        vRecibo.dataSet.FieldByName('ATRAVES1').AsString := '...';
        vRecibo.dataSet.FieldByName('benef_client').AsString := vCliente.dataSet.FieldByName('nome_cliente').AsString;
        vRecibo.dataSet.FieldByName('nome_dev').AsString := vDadosIni.vEmp.vnomeEmpresa;
        vRecibo.dataSet.FieldByName('data_rec').AsDateTime := vDataAtual;
        vRecibo.dataSet.FieldByName('data_baixa').AsDateTime := vDataAtual;
        vRecibo.dataSet.FieldByName('recant').AsString := 'S';
        vRecibo.dataSet.FieldByName('cod_benef').AsString := vCliente.dataSet.FieldByName('cod_cliente').AsString;
        vRecibo.dataSet.FieldByName('deprec').AsString := 'E';
        vRecibo.dataSet.FieldByName('ndocant').AsInteger := vSequencia;
        vRecibo.dataSet.FieldByName('cod_us').AsInteger := vDadosIni.vCodUsuario;
        vRecibo.dataSet.FieldByName('valor').AsCurrency := RoundTo(vvalorDevolucao, -2);
        vRecibo.dataSet.FieldByName('valor_orig').AsCurrency := RoundTo(vvalorDevolucao, -2);

        if (vDadosIni.vRecibo.Baixar.vUtilizarDataVencimentoRecAntValeCompra = 'S') and (trim(vDadosIni.vRecibo.Baixar.vDiasVencimentoRecAntValeCompra) <> '') then
        	vRecibo.dataSet.FieldByName('data_venc').AsDateTime := vDataAtual + StrToInt(trim(vDadosIni.vRecibo.Baixar.vDiasVencimentoRecAntValeCompra));

        vRecibo.somentePost;
      end;
    end;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      if Application.MessageBox(pchar('Ocorreu um erro ao gerar o recibo do cliente, a devolução será cancelada!' + #10#13 + 'Mostrar Erro?'), 'Atenção', MB_YESNO) = mrYes then
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

function TDevolucao.GerarSequencia: Boolean;
var
  vSequenciaAnt: Integer;
  //   vseqid: integer;
  vcom, vcomg: double;
begin
  result := false;
  try
    vSequenciaAnt := 0;
    vSequenciaAnt := vSequencia;
    vSequencia := GenCodigo('DEVOLUCAO', dtmDevolucao.strIncCodigo, vDadosIni.codEmpresa);
    vDevolucaoGrade.dataSet.First;
    while not vDevolucaoGrade.dataSet.Eof do
    begin
      vDevolucaoGrade.Edit;
      vDevolucaoGrade.dataSet.FieldByName('cod_devolucao').AsInteger := vSequencia;
      vDevolucaoGrade.somentePost;
      vDevolucaoGrade.dataSet.Next;
    end;
    // Devolução.
    dataSet.First;
    while not dataSet.Eof do
    begin
      buscas.close;
      buscas.sql.text := 'select COMISSAO_PROD, COMISSAO_PROD_GER from produtos ' +
      	' where grupo_prod = ' + IntToStr(dataset.FieldByName('GRUPO_PROD').AsInteger) +
        ' and cod_prod = ' + QuotedStr(dataset.FieldByName('COD_PROD').AsString) +
        ' and cod_empresa = ' + IntToStr(dataset.FieldByName('COD_EMPRESA').AsInteger);
      buscas.open;
      vcom := 0;
      vcomg := 0;
      if buscas.FieldByName('COMISSAO_PROD').AsCurrency > 0 then
      begin
        vcom := ((dataSet.FieldByName('VALOR').AsCurrency *
        	dataset.fieldbyname('QUANT').ascurrency) *
          	buscas.FieldByName('COMISSAO_PROD').AsCurrency) / 100;
      end;
      if buscas.FieldByName('COMISSAO_PROD_GER').AsCurrency > 0 then
      begin
        vcomg := ((dataSet.FieldByName('VALOR').AsCurrency *
        	dataset.fieldbyname('QUANT').ascurrency) *
          	buscas.FieldByName('COMISSAO_PROD_GER').AsCurrency) / 100
      end;
      buscas.close;
      Edit;
      dataSet.FieldByName('SEQUENCIA').AsInteger := vSequencia;
      dataSet.FieldByName('COMISS_PROD').AsCurrency := vcom;
      dataSet.FieldByName('COMISS_PROD_GER').AsCurrency := vcomg;
      inherited Post;
      dataSet.Next;
    end;
    buscas.close;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      if Application.MessageBox(pchar('Ocorreu um erro ao Gerar o número de sequência, a devolução será cancelada!' + #10#13 + 'Mostrar Erro?'), 'Atenção', MB_YESNO) = mrYes then
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

procedure TDevolucao.GetTextItemDevStringFormatUnConv(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := vDadosIni.IfThen(trim(Sender.AsString) <> '', trim(Sender.AsString), trim(dataSet.FieldByName('UNIDADE').AsString));
end;

procedure TDevolucao.GetTextItemFloatFormat(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
	if (Sender is TFloatField) and (StartsText('##0.', TFloatField(Sender).DisplayFormat)) then
    Text := FormatFloat(ReplaceText(TFloatField(Sender).DisplayFormat, '##0.', '#,##0.'), Sender.AsFloat)
  else if Trim(TFloatField(Sender).DisplayFormat) <> '' then
    Text := FormatFloat(TFloatField(Sender).DisplayFormat, Sender.AsFloat)
  else
    Text := FloatToStr(Sender.AsFloat);
end;

procedure TDevolucao.GetTextItemStringFormatUnConv(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := vDadosIni.IfThen(trim(Sender.AsString) <> '', trim(Sender.AsString), trim(vPedVendaProd.dataSet.FieldByName('UNIDADE').AsString));
end;

function TDevolucao.ValorAcrescimo(Query: TClientDataSet; Campo: string; GrupoProd: Integer; CodProd: string): Real;
var
  Soma: Real;
begin

  Soma := 0;

  buscas.Close;
  buscas.SQL.Clear;
  buscas.SQL.Add(' select sum(coalesce(' + Campo + ', 0)) as soma from cod_grade_prod c ' +
    ' where c.grupo_prod = ' + IntToStr(GrupoProd) +
    ' and c.cod_prod = ' + QuotedStr(CodProd) +
    ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and c.ativo = 1 ');
  buscas.Open;

  if not Buscas.FieldByName('SOMA').IsNull then
    Soma := Buscas.FieldByName('SOMA').Value;
  Result := SomaQtde(Query, Campo) - Soma;

end;

procedure TDevolucao.VendasAfterScroll(DataSet: TDataSet);
begin
  PesquisaItensVenda(vPedvenda.dataSet.FieldByName('Nped').AsString, vPedvenda.dataSet.FieldByName('tipo').AsString);
end;

function TDevolucao.VerificaEstoqueGradeProduto: Boolean;
begin

  vInserirEstoqueGrade := False;
  Result := False;

  dataSet.First;
  while not dataSet.eof do
  begin
    if dataSet.FieldByName('cod_grade').AsInteger = 0 then
    begin

      vGrade.montaSelect(' select * from cod_grade_prod c ' +
      	' inner join grade g on c.cod_grade = g.cod_grade and c.cod_empresa = g.cod_empresa ' +
        ' where c.grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
        ' and c.cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString) +
        ' and c.cod_empresa = ' + vDadosIni.codEmpresa + 
        ' and c.ativo = 1 ');

      vGrade.dataSet.First;
      if not vGrade.dataSet.IsEmpty then
      begin

        vGrupoProd := '';
        vCodProd := '';
        vquantreq := 0;
        vAcrescimoGrade := 0;

        // essa verificação aqui sempre vai dar o mesmo resultado e nunca vai sair daqui.
        if ValorAcrescimo(
        	vGrade.dataSet,
          'QTDE',
          dataSet.FieldByName('grupo_prod').AsInteger,
          dataSet.FieldByName('cod_prod').AsString) <> dataSet.FieldByName('quant').AsCurrency then
        begin
          Application.MessageBox('É preciso acrescentar a grade deste produto', 'Atenção', MB_OK);

          frmDevolucao.TabSheet1.TabVisible := False;
          frmDevolucao.TabSheet3.TabVisible := True;
          frmDevolucao.PageControl1.ActivePage := frmDevolucao.TabSheet3;

          vquantreq := dataSet.FieldByName('quant').AsCurrency;
          vGrupoProd := dataSet.FieldByName('grupo_prod').AsString;
          vCodProd := dataSet.FieldByName('cod_prod').AsString;

          frmDevolucao.Label12.Caption := dataSet.FieldByName('descricao').AsString;
          frmDevolucao.Label13.Caption := dataSet.FieldByName('quant').AsString;
          vAcrescimoGrade := ValorAcrescimo(
          	vGrade.dataSet,
            'QTDE',
            dataSet.FieldByName('grupo_prod').AsInteger,
            dataSet.FieldByName('cod_prod').AsString);

          vInserirEstoqueGrade := True;
          Result := True;
          exit;
        end;
      end;
    end;
    dataSet.Next;
  end;
end;

function TDevolucao.VerificaGradeProdutoDevolvido: Boolean;
begin
  result := false;
  vsoma := 0;

  dataSet.First;
  while not dataSet.EOF do
  begin
    if (dataSet.FieldByName('cod_grade').Asinteger = 0) then
    begin

      vGrade.montaSelect(' select * from cod_grade_prod c ' +
      	' inner join grade g on c.cod_grade = g.cod_grade and c.cod_empresa = g.cod_empresa ' +
        ' where c.grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
        ' and c.cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString) +
        ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and c.ativo = 1 ');

      if not vGrade.dataSet.IsEmpty then
      begin
        vGrade.dataSet.First;
        while not vGrade.dataSet.Eof do
        begin
          buscas.Close;
          buscas.sql.Clear;
          buscas.SQL.Add(' select qtde from cod_grade_prod c ' +
            ' where c.grupo_prod = ' + IntToStr(vGrade.dataSet.FieldByName('grupo_prod').AsInteger) +
            ' and c.cod_prod = ' + QuotedStr(vGrade.dataSet.FieldByName('cod_prod').AsString) +
            ' and c.cod_grade = ' + IntToStr(vGrade.dataSet.FieldByName('cod_grade').AsInteger) +
            ' and c.cod_empresa = ' + vDadosIni.codEmpresa + 
            ' and c.ativo = 1 ');
          buscas.Open;

          if not buscas.IsEmpty then
            vsoma := RoundTo(vGrade.dataSet.FieldByName('qtde').AsFloat - buscas.FieldByName('qtde').AsFloat, - 4)
          else
            vsoma := 0;

          if vsoma <> 0 then
          begin
            try
              if vDevolucaoGrade.insert then
              begin

                vDevolucaoGrade.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
                vDevolucaoGrade.dataSet.FieldByName('cod_devolucao').AsInteger := vSequencia;
                vDevolucaoGrade.dataSet.FieldByName('grupo_prod').AsString := vGrade.dataSet.FieldByName('grupo_prod').AsString;
                vDevolucaoGrade.dataSet.FieldByName('cod_prod').AsString := vGrade.dataSet.FieldByName('cod_prod').AsString;
                vDevolucaoGrade.dataSet.FieldByName('cod_grade').AsInteger := vGrade.dataSet.FieldByName('cod_grade').AsInteger;
                vDevolucaoGrade.dataSet.FieldByName('qtde').AsCurrency := RoundTo(vsoma, - 4);
                vDevolucaoGrade.dataSet.FieldByName('ativo').AsInteger := 1;

                vDevolucaoGrade.somentePost;

                dataSet.Edit;
                dataSet.FieldByName('cod_grade').AsInteger := vGrade.dataSet.FieldByName('cod_grade').AsInteger;
                dataSet.Post;

                {with dtmDevolucao do
                begin
                  StrVoltaGrade.Close;
                  StrVoltaGrade.ParamByName('vgrupo').Text := vGrade.dataSet.FieldByName('cod_grupo').AsString;
                  StrVoltaGrade.ParamByName('vcod_prod').Text := vGrade.dataSet.FieldByName('cod_prod').AsString;
                  StrVoltaGrade.ParamByName('quant').Value := vSoma;
                  StrVoltaGrade.ParamByName('cod_empresa').Text := vDadosIni.codEmpresa;
                  StrVoltaGrade.ParamByName('vcod_grade').Text := vGrade.dataSet.FieldByName('cod_grade').AsString;
                  StrVoltaGrade.Prepare;
                  StrVoltaGrade.ExecProc;
                  StrVoltaGrade.Close;
                end;}
              end;
            except
              on E: Exception do
              begin
                if Application.MessageBox(pchar('Erro na gravação na grade ' + vGrade.dataSet.FieldByName('cod_grade').AsString + ' do Produto ' + vGrade.dataSet.FieldByName('grupo_prod').Text + vGrade.dataSet.FieldByName('cod_prod').Text
                  + '.' + #10#13 + 'Mostrar Erro?'), 'Atenção', MB_YESNO) = mrYes then
                  Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
              end;
            end;
          end;
          vGrade.dataSet.Next;
        end;
      end;
    end;
    dataSet.Next;
  end;
  result := true;
end;

function TDevolucao.VerificaseExisteDevolucao: Boolean;
begin

  if dataSet.IsEmpty then
    Result := False
  else
    Result := True;

end;

function TDevolucao.VoltaEstoqueGradeeProduto: Boolean;
begin
  result := true;
  dataSet.First;
  while not dataSet.EOF do
  begin
    {while True do
    begin
      if (dataSet.FieldByName('cod_grade').asinteger <> 0) then
      begin
        try
          dtmDevolucao.strVoltaGrade.Close;
          dtmDevolucao.StrVoltaGrade.ParamByName('VGRUPO').asinteger := dataSet.FieldByName('grupo_prod').asinteger;
          dtmDevolucao.StrVoltaGrade.ParamByName('VCOD_PROD').Text := dataSet.FieldByName('cod_prod').Text;
          dtmDevolucao.StrVoltaGrade.ParamByName('QUANT').Text := dataSet.FieldByName('quant').Text;
          dtmDevolucao.StrVoltaGrade.ParamByName('COD_EMPRESA').asinteger := strtoint(vDadosIni.codEmpresa);
          dtmDevolucao.StrVoltaGrade.ParamByName('VCOD_GRADE').asinteger := dataSet.FieldByName('cod_grade').asinteger;
          dtmDevolucao.StrVoltaGrade.Prepare;
          dtmDevolucao.StrVoltaGrade.ExecProc;
          dtmDevolucao.StrVoltaGrade.CLOSE;
          break;
        except
          on E: Exception do
          begin
            Result := False;
            if Application.MessageBox(pchar('Erro na gravação na grade ' + vDevolucaoGrade.dataSet.FieldByName('cod_grade').AsString + ' do Produto ' + vDevolucaoGrade.dataSet.FieldByName('grupo_prod').Text + vDevolucaoGrade.dataSet.FieldByName('cod_prod').Text
              + '.' + #10#13 + 'Mostrar Erro?'), 'Atenção', MB_YESNO) = mrYes then
              Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
          end;
        end;
      end
      else
        break;
    end;}

    while true do
    begin
      try
        vMovimentaEstoque.Close;
        vMovimentaEstoque.ParamByName('PGRUPO_PROD').AsInteger := dataset.Fieldbyname('GRUPO_PROD').AsInteger;
        vMovimentaEstoque.ParamByName('PCOD_PROD').AsString := dataset.Fieldbyname('COD_PROD').AsString;
        vMovimentaEstoque.ParamByName('PCOD_EMPRESA').AsInteger := dataset.Fieldbyname('COD_EMPRESA').AsInteger;
        vMovimentaEstoque.ParamByName('PCOD_GRADE').AsInteger := dataset.Fieldbyname('COD_GRADE').AsInteger;
        vMovimentaEstoque.ParamByName('PQTDE_ENTRADA').AsFloat := dataset.Fieldbyname('QUANT').AsFloat;
        vMovimentaEstoque.ParamByName('PQTDE_SAIDA').AsFloat := 0;
        vMovimentaEstoque.ParamByName('PALTDTULTVND').AsInteger := 0;
        vMovimentaEstoque.Prepare;
        vMovimentaEstoque.ExecProc;
//        dtmDevolucao.strVoltaEstoque.Close;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VGRUPO').asinteger := dataSet.FieldByName('grupo_prod').asinteger;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VCOD_PROD').Text := dataSet.FieldByName('cod_prod').Text;
//        dtmDevolucao.strVoltaEstoque.ParamByName('QUANT').Text := dataSet.FieldByName('quant').Text;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VESTM').Value := 0;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VESTS').Value := 0;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VESTC').Value := 0;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VDATA').Value := Now;
//        dtmDevolucao.strVoltaEstoque.ParamByName('COD_EMPRESA').asinteger := strtoint(vDadosIni.codEmpresa);
//        dtmDevolucao.strVoltaEstoque.Prepare;
//        dtmDevolucao.strVoltaEstoque.ExecProc;
//        dtmDevolucao.strVoltaEstoque.Close;
        break; //codigo suspeito de eroro . olhar depois. jp.
      except
        on E: Exception do
        begin
          Result := False;
          if Application.MessageBox(pchar('Erro na Gravação ' + dataSet.FieldByName('num_fab_prod').AsString + ', Mostrar Erro?'), 'Atenção', MB_YESNO) = mrYes then
            Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        end;
      end;
    end;
    dataSet.Next;
  end;
end;

function TDevolucao._abreFormAlterarValorDev: Boolean;
var
  formulario: TfrmPadrao;
  vCOMISSAO_PROD, vCOMISSAO_PROD_GER: Double;
begin
  result := false;
  if isempty then
    exit;
  if not vDadosIni.PesqPros('DEV015', 'ABRIR TELA PARA ALTERAR', dataSet.FieldByName('NUM_FAB_PROD').AsString, 'DEVOLUCAO',
    dataSet.FieldByName('seqid').AsString, buscas, False) then
    exit;
  if vExisteVenda then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('DEV017', 'HABILITAR',
    	dataSet.FieldByName('NUM_FAB_PROD').AsString, 'DEVOLUCAO',
      dataSet.FieldByName('SEQID').AsString, buscas, False) then
    begin
      Application.MessageBox('Com a informação do número da venda sempre será devolvido o mesmo valor que está na venda.', 'Informação', MB_OK + MB_ICONINFORMATION);
      exit;
    end
    else
    begin
      if Application.MessageBox('Deseja alterar o valor devolvido do item vinculado a venda?',
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> mrYES then
         exit;

      if not vDadosIni.PesqPros('DEV018', 'ALTERAR VALOR', dataSet.FieldByName('NUM_FAB_PROD').AsString, 'DEVOLUCAO',
        dataSet.FieldByName('seqid').AsString, buscas, False) then
        exit;
    end;
  end;

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Alterar valor da devolução: Nº ' + dataSet.FieldByName('SEQUENCIA').AsString;
    frmDevolucao.pnAlterarValor.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;

    if not (dataSet.State in [dsInsert, dsEdit]) then
	  	dataSet.Edit;

    result := (formulario.ShowModal = mrOk);

  finally
    if result then
    begin
      if (dataSet.FieldByName('VALOR_CONV').AsCurrency <= 0) then
      begin
        Application.MessageBox('Novo valor deve ser maior que zero.', 'Informação', MB_OK + MB_ICONINFORMATION);
        Cancel;
        result := false;
      end
      else
      begin
      	if (trim(dataSet.FieldByName('UNIDADE').AsString) = '')
        	or (trim(dataSet.FieldByName('UNIDADE_CONV').AsString) = '')
  			  or (trim(dataSet.FieldByName('UNIDADE').AsString) = trim(dataSet.FieldByName('UNIDADE_CONV').AsString)) then
        begin
        	dataSet.FieldByName('VALOR').AsFloat := RoundTo(
          	dataSet.FieldByName('VALOR_CONV').AsFloat, - vDadosIni.vEmp.vCasasDecimais);
        end
        else
        begin
          if (dataSet.FieldByName('OPERACAO_CONV').AsString = 'M') and (dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
          begin
          	dataSet.FieldByName('VALOR').AsFloat := RoundTo(
		          dataSet.FieldByName('VALOR_CONV').AsFloat *
    	        	dataSet.FieldByName('FATOR_CONV').AsFloat, - vDadosIni.vEmp.vCasasDecimais);
          end
          else if (dataSet.FieldByName('OPERACAO_CONV').AsString = 'D') and (dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
          begin
          	dataSet.FieldByName('VALOR').AsFloat := RoundTo(
		          dataSet.FieldByName('VALOR_CONV').AsFloat /
    	        	dataSet.FieldByName('FATOR_CONV').AsFloat, - vDadosIni.vEmp.vCasasDecimais);
          end
          else
          begin
          	dataSet.FieldByName('VALOR').AsFloat := RoundTo(
            	dataSet.FieldByName('VALOR_CONV').AsFloat, - vDadosIni.vEmp.vCasasDecimais);
          end;
        end;

        dataSet.FieldByName('VALOR_TOT').AsCurrency := RoundTo(
          dataSet.FieldByName('VALOR').AsFloat * dataSet.FieldByName('QUANT').AsCurrency, -2);


        buscas.close;
        buscas.sql.text := ' select COMISSAO_PROD, COMISSAO_PROD_GER, PREC_TAB_PROD from PRODUTOS ' +
        	' where grupo_prod = ' + IntToStr(dataset.FieldByName('GRUPO_PROD').AsInteger) +
          ' and cod_prod = ' + QuotedStr(trim(dataset.FieldByName('COD_PROD').AsString)) +
          ' and cod_empresa = ' + dataset.FieldByName('COD_EMPRESA').AsString;
        buscas.open;

        vCOMISSAO_PROD     := buscas.FieldByName('COMISSAO_PROD').AsCurrency;
        vCOMISSAO_PROD_GER := buscas.FieldByName('COMISSAO_PROD_GER').AsCurrency;

        if buscas.FieldByName('COMISSAO_PROD').AsCurrency > 0 then
          dataSet.FieldByName('COMISS_PROD').AsCurrency :=
          	((dataSet.FieldByName('VALOR').AsCurrency *
            	dataset.fieldbyname('QUANT').ascurrency) *
              	vCOMISSAO_PROD) / 100;

        if buscas.FieldByName('COMISSAO_PROD_GER').AsCurrency > 0 then
          dataSet.FieldByName('COMISS_PROD_GER').AsCurrency :=
          	((dataSet.FieldByName('VALOR').AsCurrency *
            	dataset.fieldbyname('QUANT').ascurrency) *
              	vCOMISSAO_PROD_GER) / 100;

        buscas.close;

        result := inherited post;
        if not Result then
          CancelUpdates;
        if Result then
          vDadosIni.GravaAuditoria('DEV015', 'ALTERAR', 'SUCESSO', 'DEVOLUCAO', dataSet.FieldByName('SEQUENCIA').AsString, buscas)
        else
          vDadosIni.GravaAuditoria('DEV015', 'ALTERAR', 'FALHA', 'DEVOLUCAO', dataSet.FieldByName('SEQUENCIA').AsString, buscas);
      end;
    end
    else
    	dataSet.Cancel;
//    else if dataSet.State = dsEdit then
//      CancelUpdates;
    frmDevolucao.pnAlterarValor.Parent := frmDevolucao.tsAlterarValor;
    formulario.Free;
    formulario := nil;
  end;
end;

function TDevolucao._abreFormSelecionaGrade(pGrupo: integer; pCodProd: string): Boolean;
var
  formulario: TfrmPadrao;
  dsGrade: TDataSource;
begin
  result := false;
  //  if isempty then
  //    exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Selecionar grade do produto';
    frmDevolucao.pnSelecionaGrade.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    if vCodVenda = '' then
      vCodVenda := '0';

    buscas.Close;
    buscas.SQL.Text := 'select g.cod_grade,g.descricao,g.descricao1,' +
      ' (cgp.qtde - coalesce((select sum(pp.quant_ped_item) from pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped = pp.nped and v.cod_empresa = pp.cod_empresa and pp.tipo = v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and ((v.status_ped <>''FECHADA'') or (v.status_ped is null))' +
      ' and (pp.status<>''CANCELADO'' or pp.status is null)' +
      ' and v.NPED<>' + vCodVenda + ' and v.tipo<>''ORC''),0)) as qtd_item_disponivel, ' +
      ' cgp.qtde, ' +
      '(coalesce((select sum(pp.quant_ped_item) from  pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped = pp.nped and v.cod_empresa = pp.cod_empresa and pp.tipo = v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and ((v.status_ped <>''FECHADA'') or (v.status_ped is null)) ' +
      ' and (pp.status<>''CANCELADO'' or pp.status is null) ' +
      ' and v.NPED<>' + vCodVenda + ' and v.tipo<>''ORC''),0)) as qtd_item_pedAberto ' +
      ' from grade g inner join cod_grade_prod cgp ' +
      ' on g.cod_grade=cgp.cod_grade and g.cod_empresa =cgp.cod_empresa ' +
      ' where cgp.grupo_prod = ' + inttostr(pGrupo) +
      ' and cgp.cod_prod = ' + QuotedStr(pCodProd) +
      ' and cgp.cod_empresa =' + vDadosIni.codEmpresa +
      ' order by g.cod_grade';
    buscas.open;
    buscas.FieldByName('cod_grade').DisplayLabel := 'Grade';
    buscas.FieldByName('descricao').DisplayLabel := 'Descrição 1';
    buscas.FieldByName('descricao1').DisplayLabel := 'Descrição 2';
    buscas.FieldByName('qtde').DisplayLabel := 'Qtd. total da grade';
    buscas.FieldByName('qtd_item_pedAberto').DisplayLabel := 'Qtd. em Vendas em Aberto';
    buscas.FieldByName('qtd_item_disponivel').DisplayLabel := 'Qtd. Disponível';

    dsGrade := TDataSource.Create(nil);
    dsGrade.dataSet := buscas;
    frmDevolucao.DBGrid8.DataSource := dsGrade;

    result := (formulario.ShowModal = mrOk);

  finally
    if result then
      vcodgrade := buscas.FieldByName('cod_grade').AsInteger
    else
      vcodgrade := 0;
    buscas.close;
    frmDevolucao.pnSelecionaGrade.Parent := frmDevolucao.tsAlterarValor;
    formulario.Free;
    formulario := nil;
  end;
end;

function TDevolucao._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

function TDevolucao.ImpressaoMatricialDevolucao(rdImp: TRdPrint): Boolean;
var
  valortotal, qtde: Real;
begin

  valortotal := 0;
  qtde := 0;

  if not vDadosIni.ModImp(rdImp) then
    exit;
  rdImp.Abrir;

  CabecalhoImpressaoMatricial(rdImp);

  dataSet.First;
  while not dataSet.Eof do
  begin
    rdImp.Imp(linha, 002, dataSet.FieldByName('num_fab_prod').AsString);
    rdImp.Imp(linha, 021, dataSet.FieldByName('descricao').AsString);
    rdImp.ImpD(linha, 062, dataSet.FieldByName('cod_vendedor').AsString, []);
    rdImp.ImpD(linha, 068, dataSet.FieldByName('quant').AsString, []);
    rdImp.ImpVal(linha, 072, '###,##0.00', dataSet.FieldByName('valor').AsCurrency, []);
    rdImp.ImpVal(linha, 087, '###,##0.00', dataSet.FieldByName('valor').AsCurrency * dataSet.FieldByName('quant').AsCurrency, []);
    rdImp.Imp(linha, 098, dataSet.FieldByName('data').AsString);
    rdImp.Imp(linha, 111, dataSet.FieldByName('cod_venda').AsString);
    rdImp.Imp(linha, 122, dataSet.FieldByName('tipo').AsString);
    rdImp.ImpD(linha, 132, dataSet.FieldByName('cod_grade').AsString, []);

    inc(linha);
    if linha >= 65 then
    begin

      rdImp.Impf(linha, 1, vDadosIni.Replicate('=', 132), [comp17]);
      CabecalhoImpressaoMatricial(rdImp);
    end;

    valortotal := valortotal + dataSet.FieldByName('valor').AsCurrency * dataSet.FieldByName('quant').AsCurrency;
    qtde := qtde + dataSet.FieldByName('quant').AsCurrency;
    dataSet.Next;

  end;
  inc(linha);
  rdImp.Impf(linha, 1, vDadosIni.Replicate('=', 132), [comp17]);
  inc(linha);

  if linha >= 65 then
    CabecalhoImpressaoMatricial(rdImp);

  rdImp.Impd(linha, 068, floattostr(qtde), []);
  rdImp.ImpVal(linha, 084, 'R$ ###,##0.00', valortotal, []);
  rdImp.impf(linha, 2, 'Total:', [comp17, negrito]);
  rdImp.Fechar;
end;

function TDevolucao.ImprimirDevolucao: Boolean;
var
 buscas2: TIBQuery;
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  result:=true;
  vImpPesquisa := 0;
  montaSelect('select * from DEVOLUCAO ' +
   ' where SEQUENCIA = ' + IntToStr(vSequencia) + ' and cod_empresa = ' + vDadosIni.codEmpresa);

  dataSet.first;
  if not dataSet.IsEmpty then
  begin
    if Application.MessageBox('Deseja imprimir a relação de itens devolvidos em modo Grafico?', 'Atenção', MB_ICONINFORMATION + MB_YESNO) = mrYes then
    begin
      if vDadosIni.vRecibo.HabRecPorDepart then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select d.sequencia, rec.num_rec_dep from devolucao d ' +
        	' inner join recibos rec on rec.nrecibo = d.sequencia and rec.cod_empresa = d.cod_empresa ' +
          ' where d.sequencia = ' + IntToStr(vSequencia) + ' and d.cod_empresa = ' + vDadosIni.codEmpresa;
        buscas2.Open;

        frmDevolucao.QRSeq.Caption := vDadosIni.IfThen(buscas2.FieldByName('num_rec_dep').AsString <> '',
        	buscas2.FieldByName('num_rec_dep').AsString, IntToStr(vSequencia));
      end
      else
	      frmDevolucao.QRSeq.Caption := IntToStr(vSequencia);
      frmDevolucao.qrlCliente.Caption := dataSet.FieldByName('nome_cliente').AsString;
      frmDevolucao.QuickRep1.Preview;
    end
    else if Application.MessageBox('Deseja imprimir a relação de itens devolvidos?', 'Atenção', MB_ICONINFORMATION + MB_YESNO) = mrYes then
      ImpressaoMatricialDevolucao(dtmDevolucao.Rdp1);

  end;
end;

function TDevolucao.ImprimirPesquisaDevolucaoMatricial(rdImp: TRdPrint): Boolean;
var
  valortotal, qtde: Real;
begin

  vImpPesquisa := 1;
  if not dtmDevolucao.qrBuscas02.IsEmpty then
  begin

    buscas.Close;
    buscas.SQL.Clear;
    buscas.SQL.Text := ' select dev.*, ' +
    	' case ' +
      '		when (trim(coalesce(dev.unidade, '''')) = '''') then ' +
      '			coalesce(quant, 0) ' +
      '   when (trim(coalesce(dev.unidade_conv, '''')) = '''') then ' +
      '     coalesce(quant, 0) ' +
      '		when (trim(coalesce(dev.unidade, '''')) = trim(coalesce(dev.unidade_conv, ''''))) then ' +
      '     coalesce(quant, 0) ' +
      '   when ((coalesce(dev.operacao_conv, '''') = ''M'') and (coalesce(dev.fator_conv, 0) > 0)) then ' +
      '			(coalesce(quant, 0) * coalesce(dev.fator_conv, 0)) ' +
      '   when ((coalesce(dev.operacao_conv, '''') = ''D'') and (coalesce(dev.fator_conv, 0) > 0)) then ' +
      '			(coalesce(quant, 0) / coalesce(dev.fator_conv, 0)) ' +
      '   else ' +
			'			coalesce(quant, 0) ' +
      ' end quant_conv, ' +
      ' case ' +
      '		when (trim(coalesce(dev.unidade, '''')) = '''') then ' +
      '			coalesce(valor, 0) ' +
      '   when (trim(coalesce(dev.unidade_conv, '''')) = '''') then ' +
      '     coalesce(valor, 0) ' +
      '		when (trim(coalesce(dev.unidade, '''')) = trim(coalesce(dev.unidade_conv, ''''))) then ' +
      '     coalesce(valor, 0) ' +
      '   when ((coalesce(dev.operacao_conv, '''') = ''M'') and (coalesce(dev.fator_conv, 0) > 0)) then ' +
      '			(coalesce(valor, 0) / coalesce(dev.fator_conv, 0)) ' +
      '   when ((coalesce(dev.operacao_conv, '''') = ''D'') and (coalesce(dev.fator_conv, 0) > 0)) then ' +
      '			(coalesce(valor, 0) * coalesce(dev.fator_conv, 0)) ' +
      '   else ' +
			'			coalesce(valor, 0) ' +
      ' end valor_conv ' +
      ' from DEVOLUCAO dev ' +
      ' where dev.SEQUENCIA = ' + IntToStr(dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsInteger) +
      ' and dev.COD_EMPRESA = ' + vDadosIni.codEmpresa + 
      ' and dev.ATIVO = 1 ';
    buscas.Open;

    if not buscas.IsEmpty then
    begin
      valortotal := 0;
      qtde := 0;
      if not vDadosIni.ModImp(dtmDevolucao.Rdp1) then
        exit;
      dtmDevolucao.Rdp1.Abrir;
      CabecalhoImpressaoMatricial(dtmDevolucao.Rdp1);

      buscas.first;
      while not buscas.Eof do
      begin
        dtmDevolucao.Rdp1.Imp(linha, 002, buscas.FieldByName('num_fab_prod').AsString);
        dtmDevolucao.Rdp1.Imp(linha, 021, Copy(trim(buscas.FieldByName('descricao').AsString), 1, 22));
        dtmDevolucao.Rdp1.Imp(linha, 044, IntToStr(buscas.FieldByName('cod_vendedor').AsInteger));

        dtmDevolucao.Rdp1.Imp(linha, 053, vDadosIni.IfThen(trim(buscas.FieldByName('unidade_conv').AsString) <> '',
        	trim(buscas.FieldByName('unidade_conv').AsString),
        	trim(buscas.FieldByName('unidade').AsString)));

        dtmDevolucao.Rdp1.ImpVal(linha, 062, '##0.' + vDadosIni.StrZero(0, vDadosIni.vEmp.vCasasDecimais),
        	vDadosIni.IfThen(buscas.FieldByName('quant_conv').AsFloat > 0,
          	FloatToStr(buscas.FieldByName('quant_conv').AsFloat),
        		FloatToStr(buscas.FieldByName('quant').AsFloat)), []);

        dtmDevolucao.Rdp1.ImpVal(linha, 072, '###,##0.00', vDadosIni.IfThen(buscas.FieldByName('valor_conv').AsCurrency > 0,
        	buscas.FieldByName('valor_conv').AsCurrency,
        	buscas.FieldByName('valor').AsCurrency), []);

        if buscas.FieldByName('valor_tot').AsCurrency > 0 then
        	dtmDevolucao.Rdp1.ImpVal(linha, 087, '###,##0.00', RoundTo(
          	buscas.FieldByName('valor_tot').AsFloat, - 2), [])
        else
	        dtmDevolucao.Rdp1.ImpVal(linha, 087, '###,##0.00', RoundTo(
          	buscas.FieldByName('valor').AsFloat * buscas.FieldByName('quant').AsFloat, - 2), []);

        dtmDevolucao.Rdp1.Imp(linha, 098, buscas.FieldByName('data').AsString);
        dtmDevolucao.Rdp1.Imp(linha, 111, buscas.FieldByName('tipo_venda').AsString + '/' + vDadosIni.StrZero(buscas.FieldByName('cod_venda').asinteger, 6));
        dtmDevolucao.Rdp1.Imp(linha, 122, buscas.FieldByName('tipo').AsString);
        dtmDevolucao.Rdp1.ImpD(linha, 132, buscas.FieldByName('cod_grade').AsString, []);

        inc(linha);
        if linha >= 65 then
        begin
          dtmDevolucao.Rdp1.Impf(linha, 1, vDadosIni.Replicate('=', 132), [comp17]);
          CabecalhoImpressaoMatricial(dtmDevolucao.Rdp1);
        end;

        if buscas.FieldByName('valor_tot').AsCurrency > 0 then
        	valortotal := valortotal + RoundTo(buscas.FieldByName('valor_tot').AsCurrency, - 2)
        else
	        valortotal := valortotal + RoundTo(buscas.FieldByName('valor').AsFloat * buscas.FieldByName('quant').AsFloat, - 2);

        qtde := qtde + RoundTo(buscas.FieldByName('quant_conv').AsFloat, - 4);

        buscas.Next;
      end;
      inc(linha);
      dtmDevolucao.Rdp1.Impf(linha, 1, vDadosIni.Replicate('=', 132), [comp17]);
      inc(linha);

      if linha >= 65 then
        CabecalhoImpressaoMatricial(dtmDevolucao.Rdp1);

      dtmDevolucao.Rdp1.ImpVal(linha, 062, '##0.' + vDadosIni.StrZero(0, vDadosIni.vEmp.vCasasDecimais), qtde, []);
      dtmDevolucao.Rdp1.ImpVal(linha, 084, 'R$ ###,##0.00', valortotal, []);
      dtmDevolucao.Rdp1.impf(linha, 2, 'Total:', [comp17, negrito]);
      dtmDevolucao.Rdp1.Fechar;
    end;
    //      end;
  end
  else
  begin
    Application.MessageBox('Favor selecionar uma devolução!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    Result := False;
  end;

end;

function TDevolucao.ImprimirPesquisaDevolucaoGrafico: Boolean;
var
  vtp: integer;
  buscas2: TIBQuery;
begin
  vImpPesquisa := 1;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  if not dtmDevolucao.qrBuscas02.IsEmpty then
  begin
    buscas.Close;
    buscas.SQL.Clear;
    if vcodcli <> '' then
    begin
      if Application.MessageBox('Deseja imprimir a Devolução selecionada ou todas as devoluções consultadas?', 'Atenção', MB_ICONINFORMATION + MB_YESNO) = mrYes then
      begin
        buscas.SQL.Add(' select ' +
        	' case ' +
          '	  when (coalesce(dev.unidade, '''') = '''') then ' +
          '			coalesce(dev.quant, 0) ' +
          '   when (coalesce(dev.unidade_conv, '''') = '''') then ' +
          '			coalesce(dev.quant, 0) ' +
          '		when (coalesce(dev.unidade, '''') = coalesce(dev.unidade_conv, '''')) then ' +
          '			coalesce(dev.quant, 0) ' +
          '		when ((dev.operacao_conv = ''M'') and (dev.fator_conv > 0)) then ' +
          '     (coalesce(dev.quant, 0) * coalesce(dev.fator_conv, 0)) ' +
          '		when ((dev.operacao_conv = ''D'') and (dev.fator_conv > 0)) then ' +
          '     (coalesce(dev.quant, 0) / coalesce(dev.fator_conv, 0)) ' +
          '	 	else ' +
          '			coalesce(dev.quant, 0) ' +
          '	end quant_conv, ' +
          ' case ' +
          '	  when (coalesce(dev.unidade, '''') = '''') then ' +
          '			coalesce(dev.valor, 0) ' +
          '   when (coalesce(dev.unidade_conv, '''') = '''') then ' +
          '			coalesce(dev.valor, 0) ' +
          '		when (coalesce(dev.unidade, '''') = coalesce(dev.unidade_conv, '''')) then ' +
          '			coalesce(dev.valor, 0) ' +
          '		when ((dev.operacao_conv = ''M'') and (dev.fator_conv > 0)) then ' +
          '     (coalesce(dev.valor, 0) / coalesce(dev.fator_conv, 0)) ' +
          '		when ((dev.operacao_conv = ''D'') and (dev.fator_conv > 0)) then ' +
          '     (coalesce(dev.valor, 0) * coalesce(dev.fator_conv, 0)) ' +
          '	 	else ' +
          '			coalesce(dev.valor, 0) ' +
          '	end valor_conv, ' +
        	' dev.* from devolucao dev ' + vregracons);
        if ((vdataini <> '  /  /    ') and (vdatafin <> '  /  /    ')) then
        begin
          buscas.ParamByName('dataini').AsDate := StrToDate(vdataini);
          buscas.ParamByName('datafin').AsDate := StrToDate(vdatafin);
        end;
//        if vcodcli <> '' then
//          buscas.ParamByName('cod_cliente').AsString := vcodcli;
//        buscas.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        vtp := 1;
      end
      else
      begin
        buscas.SQL.Add(' select ' +
        	' case ' +
          '	  when (coalesce(dev.unidade, '''') = '''') then ' +
          '			coalesce(dev.quant, 0) ' +
          '   when (coalesce(dev.unidade_conv, '''') = '''') then ' +
          '			coalesce(dev.quant, 0) ' +
          '		when (coalesce(dev.unidade, '''') = coalesce(dev.unidade_conv, '''')) then ' +
          '			coalesce(dev.quant, 0) ' +
          '		when ((dev.operacao_conv = ''M'') and (dev.fator_conv > 0)) then ' +
          '     (coalesce(dev.quant, 0) * coalesce(dev.fator_conv, 0)) ' +
          '		when ((dev.operacao_conv = ''D'') and (dev.fator_conv > 0)) then ' +
          '     (coalesce(dev.quant, 0) / coalesce(dev.fator_conv, 0)) ' +
          '	 	else ' +
          '			coalesce(dev.quant, 0) ' +
          '	end quant_conv, ' +
          ' case ' +
          '	  when (coalesce(dev.unidade, '''') = '''') then ' +
          '			coalesce(dev.valor, 0) ' +
          '   when (coalesce(dev.unidade_conv, '''') = '''') then ' +
          '			coalesce(dev.valor, 0) ' +
          '		when (coalesce(dev.unidade, '''') = coalesce(dev.unidade_conv, '''')) then ' +
          '			coalesce(dev.valor, 0) ' +
          '		when ((dev.operacao_conv = ''M'') and (dev.fator_conv > 0)) then ' +
          '     (coalesce(dev.valor, 0) / coalesce(dev.fator_conv, 0)) ' +
          '		when ((dev.operacao_conv = ''D'') and (dev.fator_conv > 0)) then ' +
          '     (coalesce(dev.valor, 0) * coalesce(dev.fator_conv, 0)) ' +
          '	 	else ' +
          '			coalesce(dev.valor, 0) ' +
          '	end valor_conv, ' +
        	' dev.* from DEVOLUCAO dev ' +
          ' where dev.sequencia = ' + IntToStr(dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsInteger) +
          ' and dev.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and dev.ativo = 1 ');
        vtp := 0;
      end;
    end
    else
    begin
      buscas.SQL.Add('select ' +
      	' case ' +
        '	  when (coalesce(dev.unidade, '''') = '''') then ' +
        '			coalesce(dev.quant, 0) ' +
        '   when (coalesce(dev.unidade_conv, '''') = '''') then ' +
        '			coalesce(dev.quant, 0) ' +
        '		when (coalesce(dev.unidade, '''') = coalesce(dev.unidade_conv, '''')) then ' +
        '			coalesce(dev.quant, 0) ' +
        '		when ((dev.operacao_conv = ''M'') and (dev.fator_conv > 0)) then ' +
        '     (coalesce(dev.quant, 0) * coalesce(dev.fator_conv, 0)) ' +
        '		when ((dev.operacao_conv = ''D'') and (dev.fator_conv > 0)) then ' +
        '     (coalesce(dev.quant, 0) / coalesce(dev.fator_conv, 0)) ' +
        '	 	else ' +
        '			coalesce(dev.quant, 0) ' +
        '	end quant_conv, ' +
        ' case ' +
        '	  when (coalesce(dev.unidade, '''') = '''') then ' +
        '			coalesce(dev.valor, 0) ' +
        '   when (coalesce(dev.unidade_conv, '''') = '''') then ' +
        '			coalesce(dev.valor, 0) ' +
        '		when (coalesce(dev.unidade, '''') = coalesce(dev.unidade_conv, '''')) then ' +
        '			coalesce(dev.valor, 0) ' +
        '		when ((dev.operacao_conv = ''M'') and (dev.fator_conv > 0)) then ' +
        '     (coalesce(dev.valor, 0) / coalesce(dev.fator_conv, 0)) ' +
        '		when ((dev.operacao_conv = ''D'') and (dev.fator_conv > 0)) then ' +
        '     (coalesce(dev.valor, 0) * coalesce(dev.fator_conv, 0)) ' +
        '	 	else ' +
        '			coalesce(dev.valor, 0) ' +
        '	end valor_conv, ' +
      	' dev.* from devolucao dev ' +
        ' where dev.sequencia = ' + IntToStr(dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsInteger) +
        ' and dev.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and dev.ativo = 1 ');
      vtp := 0;
    end;
    buscas.Open;
    if not buscas.IsEmpty then
    begin
      buscas.first;
      if Application.MessageBox('Deseja imprimir a relação de itens devolvidos em modo Grafico?', 'Atenção', MB_ICONINFORMATION + MB_YESNO) = mrYes then
      begin

        try
          if vtp = 0 then
          begin
            if vDadosIni.vRecibo.HabRecPorDepart then
            begin
              buscas2.Close;
              buscas2.SQL.Text := ' select d.sequencia, rec.num_rec_dep from devolucao d ' +
                ' inner join recibos rec on rec.nrecibo = d.sequencia and rec.cod_empresa = d.cod_empresa ' +
                ' where d.sequencia = ' + IntToStr(dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsInteger) +
                ' and d.cod_empresa = ' + vDadosIni.codEmpresa;
              buscas2.Open;

              frmDevolucao.QRSeq.Caption := vDadosIni.IfThen(buscas2.FieldByName('num_rec_dep').AsString <> '',
                buscas2.FieldByName('num_rec_dep').AsString, dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsString);
            end
            else
	            frmDevolucao.QRSeq.Caption := dtmDevolucao.qrBuscas02.FieldByName('sequencia').AsString;
          end
          else
            frmDevolucao.QRSeq.Caption := 'TODAS';

          frmDevolucao.qrlCliente.Caption := buscas.FieldByName('nome_cliente').AsString;

          frmDevolucao.QRDBText1.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QRDBText2.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QRDBText3.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QRDBText4.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QRDBText5.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QRDBText6.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QRDBText7.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QRDBText8.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QRDBText9.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QRDBText10.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QuickRep1.DataSet := dtmDevolucao.qrBuscas;
          frmDevolucao.QuickRep1.Preview;
        finally
          frmDevolucao.QRDBText1.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QRDBText2.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QRDBText3.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QRDBText4.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QRDBText5.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QRDBText6.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QRDBText7.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QRDBText8.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QRDBText9.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QRDBText10.DataSet := dtmDevolucao.cdsDevolucao;
          frmDevolucao.QuickRep1.DataSet := dtmDevolucao.cdsDevolucao;
        end;
      end
    end
    else
      Application.MessageBox('Não foram encontrados items para esta devolução.', 'Atenção', MB_ICONINFORMATION + MB_OK);
  end
  else
  begin
    Application.MessageBox('Favor selecionar uma devolução!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    Result := False;
  end;

end;

function TDevolucao.InserirClientenaDevolucao: Boolean;
begin

  // Até concluir todos os passos da devolução, a devolução vai ficar sem cliente.
  // quando terminar tudo , vai ser feito um edit na tabela de devolução e inserir o cliente
  // que está selecionado.
  result := false;
  if not vCliente.dataSet.IsEmpty then
  begin
    dataSet.First;
    while not dataSet.Eof do
    begin
      try
        Edit;
        dataSet.FieldByName('cod_cliente').AsString := vCliente.dataSet.FieldByName('cod_cliente').AsString;
        inherited Post;
        Result := True;
        dataSet.Next;
      except
        on e: exception do
        begin
          result := false;
          Application.MessageBox(pchar('Erro ao Gravar código do cliente na devolução. Erro: ' + e.Message),
            'Informação', MB_OK + MB_ICONINFORMATION);
          break;
        end;
      end;
    end;
  end
  else
  begin
    Result := False;
    raise Exception.Create('Cliente inexiste, verifique!');
  end;

end;

function TDevolucao.InserirDevolucao: Boolean;
var
  vDescontoProduto: Currency;
  vvalorProduto, vvalorProdutoConv: Currency;
  buscas2: TIBQuery;
begin
  try
    Result := True;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    vvalorProduto     := 0;
    vvalorProdutoConv := 0;
    vDescontoProduto  := 0;

    if vExisteVenda then
    begin
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('sequencia').AsInteger := vSequencia;
      dataSet.FieldByName('grupo_prod').AsString := vPedVendaProd.dataSet.FieldByName('grupo_prod').AsString;
      dataSet.FieldByName('cod_prod').AsString := vPedVendaProd.dataSet.FieldByName('cod_prod').AsString;
      dataSet.FieldByName('num_fab_prod').AsString := vPedVendaProd.dataSet.FieldByName('num_fab_prod').AsString;
      dataSet.FieldByName('descricao').AsString := vPedVendaProd.dataSet.FieldByName('descr_prod_ped').AsString;
      dataSet.FieldByName('nome_cliente').AsString := vCliente.dataSet.FieldByName('nome_cliente').AsString;
      dataSet.FieldByName('endereco').AsString := vCliente.dataSet.FieldByName('endereco').AsString;
      dataSet.FieldByName('telefone').AsString := vCliente.dataSet.FieldByName('fone_cliente').AsString;
      dataSet.FieldByName('cod_cliente').AsString := vCliente.dataSet.FieldByName('cod_cliente').AsString;
      {
      if vPedVendaProd.dataSet.FieldByName('rateio_desc').AsCurrency <> 0 then
        dataSet.FieldByName('valor').AsCurrency := (vPedVendaProd.dataSet.FieldByName('vlun_ped_item').AsCurrency -
          (vPedVendaProd.dataSet.FieldByName('rateio_desc').AsCurrency / vPedVendaProd.dataSet.FieldByName('quant_ped_item').asCurrency))
      else
        dataSet.FieldByName('valor').AsCurrency := vPedVendaProd.dataSet.FieldByName('vlun_ped_item').AsCurrency;
      }
//      dataSet.FieldByName('unidade').AsString := vPedVendaProd.dataSet.FieldByName('unidade').AsString;
//      dataSet.FieldByName('unidade_conv').AsString := vPedVendaProd.dataSet.FieldByName('unidade_conv').AsString;

			dataSet.FieldByName('unidade').AsString := trim(vProduto.dataSet.FieldByName('unidade').AsString);
      dataSet.FieldByName('unidade_conv').AsString := trim(vUnidade);

      dataSet.FieldByName('operacao_conv').AsString := vPedVendaProd.dataSet.FieldByName('operacao_conv').AsString;
      dataSet.FieldByName('fator_conv').AsFloat := vPedVendaProd.dataSet.FieldByName('fator_conv').AsFloat;

      dataSet.FieldByName('quant').AsCurrency := vQuant;

      dataSet.FieldByName('valor').AsCurrency := (vPedVendaProd.dataSet.FieldByName('vltot_ped_item').AsFloat +
                                                  vPedVendaProd.dataSet.FieldByName('rateio_acresc').AsFloat  -
                                                  vPedVendaProd.dataSet.FieldByName('rateio_desc').AsFloat  ) /
                                                  vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsFloat;

    	dataSet.FieldByName('valor_tot').AsCurrency :=
      	RoundTo(dataSet.FieldByName('valor').AsCurrency * dataSet.FieldByName('quant').AsCurrency, -2);

      dataSet.FieldByName('valor_orig').AsCurrency := vPedVendaProd.dataSet.FieldByName('vlun_orig').AsFloat;

      dataSet.FieldByName('data').AsString := DateToStr(date);
      dataSet.FieldByName('cod_venda').AsString := vPedVendaProd.dataSet.FieldByName('nped').AsString;
      dataSet.FieldByName('cod_vendedor').AsInteger := vcodVendedor;
      dataSet.FieldByName('tipo').AsString := vtipo;
      dataSet.FieldByName('sequencia').AsInteger := vSequencia;
      dataSet.FieldByName('pcust_mc').AsCurrency := vPedVendaProd.dataSet.FieldByName('pcust_mc').AsCurrency;
      dataset.FieldByName('tipo_venda').AsString := vtipoVenda;
      dataSet.FieldByName('ativo').AsInteger := 1;
      dataSet.FieldByName('tipv').AsString := vTipv;

      dataSet.FieldByName('perc_comissao_condpag').AsCurrency := vPedVendaProd.dataSet.FieldByName('perc_comissao_condpag').AsCurrency;
      dataSet.FieldByName('perc_comissao_vend3').AsCurrency := vPedVendaProd.dataSet.FieldByName('perc_comissao_vend3').AsCurrency;
      dataSet.FieldByName('usar_debcred').AsString :=
      	IfThen(vPedVendaProd.dataSet.FieldByName('usar_debcred').AsString = 'N',
        	'N', 'S');
    end
    else
    begin
    	vvalorProduto := vProduto.dataSet.FieldByName('prec_tab_prod').AsCurrency;
      
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('sequencia').AsInteger := vSequencia;
      dataSet.FieldByName('grupo_prod').AsString := vProduto.dataSet.FieldByName('grupo_prod').AsString;
      dataSet.FieldByName('cod_prod').AsString := vProduto.dataSet.FieldByName('cod_prod').AsString;
      dataSet.FieldByName('num_fab_prod').AsString := vProduto.dataSet.FieldByName('num_fab_prod').AsString;
      dataSet.FieldByName('descricao').AsString := vProduto.dataSet.FieldByName('descr_prod').AsString;
      dataSet.FieldByName('nome_cliente').AsString := vCliente.dataSet.FieldByName('nome_cliente').AsString;
      dataSet.FieldByName('endereco').AsString := vCliente.dataSet.FieldByName('endereco').AsString;
      dataSet.FieldByName('telefone').AsString := vCliente.dataSet.FieldByName('fone_cliente').AsString;
      dataSet.FieldByName('cod_cliente').AsString := vCliente.dataSet.FieldByName('cod_cliente').AsString;

      dataSet.FieldByName('unidade').AsString := trim(vProduto.dataSet.FieldByName('unidade').AsString);
      dataSet.FieldByName('unidade_conv').AsString := trim(vUnidade);

      if not SqlOpen(' select ps.grupo_prod, ps.cod_prod, ps.cod_empresa, ps.unidade, ' +
        ' ps.quantidade, ps.operacao, ps.disponivel_venda, ps.padrao_venda, ' +
        ' pr.unidade as unidade_prod from produtos pr ' +
        ' inner join produtos_conversao_saida ps on ' +
        '   ps.grupo_prod = pr.grupo_prod ' +
        '		and ps.cod_prod = pr.cod_prod ' +
        '   and ps.cod_empresa = pr.cod_empresa ' +
        ' where ps.grupo_prod = ' + IntToStr(vProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
        ' and ps.cod_prod = ' + QuotedStr(vProduto.dataSet.FieldByName('COD_PROD').AsString) +
        ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ps.unidade = ' + QuotedStr(trim(vUnidade)) +
        ' and ps.quantidade > 0 ' +
        ' and ((ps.operacao = ''M'') or (ps.operacao = ''D'')) ', buscas2).IsEmpty then
      begin
      	dataSet.FieldByName('operacao_conv').AsString := buscas2.FieldByName('operacao').AsString;
      	dataSet.FieldByName('fator_conv').AsFloat := buscas2.FieldByName('quantidade').AsFloat;
      end;

      dataSet.FieldByName('quant').AsFloat := RoundTo(vQuant, - 4);

      if StrToCurr(vPercDesconto) <> 0 then
      begin
        try
        	if (trim(vUnidade) = '')
            or (trim(vProduto.dataSet.FieldByName('unidade').AsString) = trim(vUnidade)) then
          begin
            dataSet.FieldByName('valor').AsCurrency := RoundTo(
            	vvalorProduto - (vvalorProduto * (StrToCurr(vPercDesconto) / 100)), -2);
          end
          else
          begin
            if (buscas2.FieldByName('operacao').AsString = 'M') and (buscas2.FieldByName('quantidade').AsFloat > 0) then
            begin
            	vvalorProdutoConv := RoundTo(
                vvalorProduto /
                  buscas2.FieldByName('quantidade').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

              vvalorProduto := RoundTo(
                vvalorProdutoConv *
                  buscas2.FieldByName('quantidade').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

              dataSet.FieldByName('valor').AsCurrency := RoundTo(
            		vvalorProduto - (vvalorProduto * (StrToCurr(vPercDesconto) / 100)), -2);
            end
            else if (buscas2.FieldByName('operacao').AsString = 'D') and (buscas2.FieldByName('quantidade').AsFloat > 0) then
            begin
            	vvalorProdutoConv := RoundTo(
                vvalorProduto *
                  buscas2.FieldByName('quantidade').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

              vvalorProduto := RoundTo(
                vvalorProdutoConv /
                  buscas2.FieldByName('quantidade').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

              dataSet.FieldByName('valor').AsCurrency := RoundTo(
            		vvalorProduto - (vvalorProduto * (StrToCurr(vPercDesconto) / 100)), -2);
            end
            else
            begin
            	dataSet.FieldByName('valor').AsCurrency := RoundTo(
            		vvalorProduto - (vvalorProduto * (StrToCurr(vPercDesconto) / 100)), -2);
            end;
          end;
        except
          dataSet.FieldByName('valor').AsCurrency := RoundTo(vvalorProduto, -2);
        end;
      end
      else
      begin
      	if (trim(vUnidade) = '')
        	or (trim(vProduto.dataSet.FieldByName('unidade').AsString) = trim(vUnidade)) then
        begin
          dataSet.FieldByName('valor').AsCurrency := RoundTo(vvalorProduto, -2);
        end
        else
        begin
      		if (buscas2.FieldByName('operacao').AsString = 'M') and (buscas2.FieldByName('quantidade').AsFloat > 0) then
          begin
          	vvalorProdutoConv := RoundTo(
          		vvalorProduto /
            		buscas2.FieldByName('quantidade').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

            vvalorProduto := RoundTo(
              vvalorProdutoConv *
              	buscas2.FieldByName('quantidade').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

        		dataSet.FieldByName('valor').AsCurrency := RoundTo(vvalorProduto, -2);
          end
          else if (buscas2.FieldByName('operacao').AsString = 'D') and (buscas2.FieldByName('quantidade').AsFloat > 0) then
          begin
          	vvalorProdutoConv := RoundTo(
          		vvalorProduto *
            		buscas2.FieldByName('quantidade').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

            vvalorProduto := RoundTo(
              vvalorProdutoConv /
              	buscas2.FieldByName('quantidade').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

        		dataSet.FieldByName('valor').AsCurrency := RoundTo(vvalorProduto, -2);
          end
          else
          begin
          	dataSet.FieldByName('valor').AsCurrency := RoundTo(vvalorProduto, -2);
          end;
        end
      end;

      dataSet.FieldByName('valor_tot').AsCurrency :=
      	RoundTo(dataSet.FieldByName('valor').AsCurrency * dataSet.FieldByName('quant').AsCurrency, -2);

      dataSet.FieldByName('data').AsString := DateToStr(date);
      dataSet.FieldByName('cod_vendedor').AsInteger := vcodVendedor;
      dataSet.FieldByName('tipo').AsString := vtipo;
      dataSet.FieldByName('sequencia').AsInteger := vSequencia;
      dataSet.FieldByName('pcust_mc').AsCurrency := vProduto.dataSet.FieldByName('prec_cusm_prod').AsCurrency;
      dataSet.FieldByName('cod_venda').AsString := '0';
      dataSet.FieldByName('tipo_venda').AsString := 'DES';
      dataSet.FieldByName('ativo').AsInteger := 1;
      dataSet.FieldByName('tipv').AsString := '';

      dataSet.FieldByName('usar_debcred').AsString :=
      	IfThen(vProduto.dataSet.FieldByName('usar_debcred').AsString = 'N',
        	'N', 'S');
    end;
    vseqid := vseqid + 1;
    dataSet.FieldByName('SEQID').AsInteger := vseqid;

    if vPossuiGrade then
    begin
      if vcodgrade = 0 then
        dataSet.FieldByName('cod_grade').AsInteger := vGrade.dataSet.FieldByName('cod_grade').AsInteger
      else
      begin
        dataSet.FieldByName('cod_grade').AsInteger := vcodgrade;
        dataSet.FieldByName('descricao').AsString := trim(dataSet.FieldByName('descricao').AsString) + ' - ' + trim(vGrade.dataSet.FieldByName('descricao').AsString);
      end;
    end
    else
      dataSet.FieldByName('cod_grade').AsInteger := 0;

    if vExisteVenda then
    begin
      if ((vPedVendaProd.dataSet.FieldByName('cod_grade').AsString <> '0') and (vPedVendaProd.dataSet.FieldByName('cod_grade').AsString <> '')) then
      begin
        if vcodgrade <> 0 then
        begin
          dataSet.FieldByName('cod_grade').AsInteger := vPedVendaProd.dataSet.FieldByName('cod_grade').AsInteger;
          vcodgrade := 0;
        end
        else
          dataSet.FieldByName('cod_grade').AsInteger := vPedVendaProd.dataSet.FieldByName('cod_grade').AsInteger;
      end;
    end;
  except
    Result := False;
  end;
end;

function TDevolucao.InserirDevolucaoGrade: Boolean;
begin
  try
    if vExisteVenda then
    begin
      vDevolucaoGrade.dataSet.FieldByName('cod_devolucao').AsInteger := vSequencia;
      vDevolucaoGrade.dataSet.FieldByName('grupo_prod').AsString := vPedVendaProd.dataSet.FieldByName('grupo_prod').AsString;
      vDevolucaoGrade.dataSet.FieldByName('cod_prod').AsString := vPedVendaProd.dataSet.FieldByName('cod_prod').AsString;
      vDevolucaoGrade.dataSet.FieldByName('cod_grade').AsInteger := vPedVendaProd.dataSet.FieldByName('cod_grade').AsInteger;
      vDevolucaoGrade.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      vDevolucaoGrade.dataSet.FieldByName('qtde').AsCurrency := RoundTo(vQuant, - 4);
      vDevolucaoGrade.dataSet.FieldByName('ativo').AsInteger := 1;
      vDevolucaoGrade.dataSet.FieldByName('seqid').AsInteger := dataSet.FieldByName('seqid').AsInteger;
    end
    else
    begin
      vDevolucaoGrade.dataSet.FieldByName('cod_devolucao').AsInteger := vSequencia;
      vDevolucaoGrade.dataSet.FieldByName('grupo_prod').AsString := vProduto.dataSet.FieldByName('grupo_prod').AsString;
      vDevolucaoGrade.dataSet.FieldByName('cod_prod').AsString := vProduto.dataSet.FieldByName('cod_prod').AsString;
      vDevolucaoGrade.dataSet.FieldByName('cod_grade').AsInteger := dataSet.FieldByName('cod_grade').AsInteger;
      vDevolucaoGrade.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      vDevolucaoGrade.dataSet.FieldByName('qtde').AsCurrency := RoundTo(vQuant, - 4);
      vDevolucaoGrade.dataSet.FieldByName('ativo').AsInteger := 1;
      vDevolucaoGrade.dataSet.FieldByName('seqid').AsInteger := dataSet.FieldByName('seqid').AsInteger;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TDevolucao.InserirDevolucaoGradepelaVenda: Boolean;
begin
  if pesquisaGrade(vPedVendaProd.dataSet.FieldByName('COD_PROD').AsString, vPedVendaProd.dataSet.FieldByName('grupo_prod').AsInteger, 0) then
  begin
    if vDevolucaoGrade.Insert then
    begin
      try
        vDevolucaoGrade.dataSet.FieldByName('cod_devolucao').AsInteger := vSequencia;
        vDevolucaoGrade.dataSet.FieldByName('grupo_prod').AsString := vPedVendaProd.dataSet.FieldByName('grupo_prod').AsString;
        vDevolucaoGrade.dataSet.FieldByName('cod_prod').AsString := vPedVendaProd.dataSet.FieldByName('cod_prod').AsString;
        vDevolucaoGrade.dataSet.FieldByName('cod_grade').AsInteger := dataSet.FieldByName('cod_grade').AsInteger; //ja atribui a grade que esta na tabela devolucao
        vDevolucaoGrade.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        vDevolucaoGrade.dataSet.FieldByName('qtde').AsFloat := RoundTo(dataSet.FieldByName('quant').AsFloat, - 4); //vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsCurrency;
        vDevolucaoGrade.dataSet.FieldByName('ativo').AsInteger := 1;
        vDevolucaoGrade.dataSet.FieldByName('seqid').AsInteger := dataSet.FieldByName('seqid').AsInteger;
        Result := True;
      except
        Result := False;
        raise Exception.Create('Erro na tentativa de gravar a devolução da grade!')
      end;
      if not vDevolucaoGrade.somentePost then
      begin
        Result := False;
        raise Exception.Create('Erro na tentativa de gravar a devolução da grade!');
      end;
    end
    else
    begin
      Result := False;
      raise Exception.Create('Erro na tentativa de gravar a devolução da grade!')
    end;
  end;
end;

function TDevolucao.InserirDevolucaopelaVenda(vqtdedev, vqtdedevConv: real): Boolean;
var
	vunidade, vunidadeConv: string;
begin
  Result := True;
  vunidadeConv := trim(vPedVendaProd.dataSet.FieldByName('unidade_conv').AsString);
  vunidade     := trim(vPedVendaProd.dataSet.FieldByName('unidade').AsString);

  if not PesquisaItemDevolvido(
  	vqtdedev,
    vqtdedevConv,
    vDadosIni.IfThen(trim(vunidadeConv) <> '', trim(vunidadeConv), trim(vunidade))) then
  begin
    Result := False;
    if fQuantidadeJaDevConv > 0 then
      raise Exception.Create(Pchar('A quantidade devolvida do item, não pode ultrapassar a quantidade existente deste item na venda informada!' + chr(13) +
        'Obs.: Já foi feita a devolução de ' + FloatToStr(obDevolucao.vQuantidadeJaDevConv) + ' item(ns) da venda ' + obDevolucao.vCodVenda + ' anteriormente.'))
    else if fQuantidadeJaDev > 0 then
      raise Exception.Create(Pchar('A quantidade devolvida do item, não pode ultrapassar a quantidade existente deste item na venda informada!' + chr(13) +
        'Obs.: Já foi feita a devolução de ' + FloatToStr(obDevolucao.vQuantidadeJaDev) + ' item(ns) da venda ' + obDevolucao.vCodVenda + ' anteriormente.'))
    else
      raise Exception.Create(Pchar('A quantidade devolvida do item, não pode ultrapassar a quantidade existente deste item na venda informada!'));

    //       raise Exception.Create('Já houve devolução deste produto referente a venda informada!');
  end
  else
  begin
    if inherited Insert then
    begin
      try
        dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        dataSet.FieldByName('sequencia').AsInteger := vSequencia;
        dataSet.FieldByName('grupo_prod').AsString := vPedVendaProd.dataSet.FieldByName('grupo_prod').AsString;
        dataSet.FieldByName('cod_prod').AsString := vPedVendaProd.dataSet.FieldByName('cod_prod').AsString;
        dataSet.FieldByName('num_fab_prod').AsString := vPedVendaProd.dataSet.FieldByName('num_fab_prod').AsString;
        dataSet.FieldByName('descricao').AsString := vPedVendaProd.dataSet.FieldByName('descr_prod_ped').AsString;
        dataSet.FieldByName('nome_cliente').AsString := vCliente.dataSet.FieldByName('nome_cliente').AsString;
        dataSet.FieldByName('endereco').AsString := vCliente.dataSet.FieldByName('endereco').AsString;
        dataSet.FieldByName('telefone').AsString := vCliente.dataSet.FieldByName('fone_cliente').AsString;
        dataSet.FieldByName('cod_cliente').AsString := vCliente.dataSet.FieldByName('cod_cliente').AsString;
        {
        if vPedVendaProd.dataSet.FieldByName('rateio_desc').AsCurrency <> 0 then
          dataSet.FieldByName('valor').AsCurrency := (vPedVendaProd.dataSet.FieldByName('vlun_ped_item').AsCurrency -
            (vPedVendaProd.dataSet.FieldByName('rateio_desc').AsCurrency / vPedVendaProd.dataSet.FieldByName('quant_ped_item').asCurrency))
        else
          dataSet.FieldByName('valor').AsCurrency := vPedVendaProd.dataSet.FieldByName('vlun_ped_item').AsCurrency;
        }
        dataSet.FieldByName('unidade').AsString := vPedVendaProd.dataSet.FieldByName('unidade').AsString;
        dataSet.FieldByName('unidade_conv').AsString := vPedVendaProd.dataSet.FieldByName('unidade_conv').AsString;
      	dataSet.FieldByName('operacao_conv').AsString := vPedVendaProd.dataSet.FieldByName('operacao_conv').AsString;
        dataSet.FieldByName('fator_conv').AsFloat := vPedVendaProd.dataSet.FieldByName('fator_conv').AsFloat;

        dataSet.FieldByName('quant').AsCurrency := RoundTo(vqtdedev, - 4);
        dataSet.FieldByName('valor').AsCurrency := (vPedVendaProd.dataSet.FieldByName('vltot_ped_item').AsFloat +
                                                    vPedVendaProd.dataSet.FieldByName('rateio_acresc').AsFloat  -
                                                    vPedVendaProd.dataSet.FieldByName('rateio_desc').AsFloat  ) /
                                                    vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsFloat;

      	dataSet.FieldByName('valor_tot').AsCurrency :=
	      	RoundTo(dataSet.FieldByName('valor').AsCurrency * dataSet.FieldByName('quant').AsCurrency, -2);

        dataSet.FieldByName('valor_orig').AsCurrency := vPedVendaProd.dataSet.FieldByName('vlun_orig').AsFloat;

        //vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsCurrency;
        dataSet.FieldByName('data').AsString := DateToStr(date);
        dataSet.FieldByName('cod_venda').AsString := vPedVendaProd.dataSet.FieldByName('nped').AsString;
        dataSet.FieldByName('cod_vendedor').AsString := vPedVendaProd.dataSet.FieldByName('cod_vendedor').AsString;
        dataSet.FieldByName('tipo').AsString := vtipo;
        dataSet.FieldByName('sequencia').AsInteger := vSequencia;
        dataSet.FieldByName('pcust_mc').AsCurrency := vPedVendaProd.dataSet.FieldByName('pcust_mc').AsCurrency;

        dataSet.FieldByName('perc_comissao_condpag').AsCurrency := vPedVendaProd.dataSet.FieldByName('perc_comissao_condpag').AsCurrency;
      	dataSet.FieldByName('perc_comissao_vend3').AsCurrency := vPedVendaProd.dataSet.FieldByName('perc_comissao_vend3').AsCurrency;
        dataSet.FieldByName('usar_debcred').AsString :=
        	IfThen(vPedVendaProd.dataSet.FieldByName('usar_debcred').AsString = 'N',
          	'N', 'S');

        if vPedVendaProd.dataSet.FieldByName('cod_grade').AsInteger = 0 then
        begin
        	buscas.Close;
          buscas.SQL.Text := ' select * from cod_grade_prod c ' +
          	' inner join grade g on c.cod_grade = g.cod_grade and c.cod_empresa = g.cod_empresa ' +
            ' where c.grupo_prod = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('grupo_prod').AsInteger) +
            ' and c.cod_prod = ' + QuotedStr(vPedVendaProd.dataSet.FieldByName('cod_prod').AsString) +
            ' and c.cod_grade = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('cod_grade').AsInteger) +
            ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
            ' and c.ativo = 1 ';
          buscas.Open;

          if not buscas.IsEmpty then
            dataSet.FieldByName('cod_grade').AsInteger := buscas.FieldByName('cod_grade').AsInteger
          else
          begin
            buscas.Close;
            buscas.SQL.Text := ' select * from cod_grade_prod c ' +
            	' inner join grade g on c.cod_grade = g.cod_grade and c.cod_empresa = g.cod_empresa ' +
              ' where c.grupo_prod = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('grupo_prod').AsInteger) +
              ' and c.cod_prod = ' + QuotedStr(vPedVendaProd.dataSet.FieldByName('cod_prod').AsString) +
              ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
              ' and c.ativo = 1 ';
            buscas.Open;

            if not buscas.IsEmpty then
            begin
              if not _abreFormSelecionaGrade(
                vPedVendaProd.dataSet.FieldByName('grupo_prod').AsInteger,
                vPedVendaProd.dataSet.FieldByName('cod_prod').AsString) then //            if vcodgrade = 0 then
              begin
                Result := False;
                dataSet.Cancel;
                dataSet.CancelUpdates;
                RollBackTransacao;
                Application.MessageBox('A grade deve ser informada', 'Atenção', 0 + 64);
                Exit;
              end
              else
                dataSet.FieldByName('cod_grade').AsInteger := vcodgrade;
            end
            else
              dataSet.FieldByName('cod_grade').AsInteger := vPedVendaProd.dataSet.FieldByName('cod_grade').AsInteger;
          end;
        end
        else
          dataSet.FieldByName('cod_grade').AsInteger := vPedVendaProd.dataSet.FieldByName('cod_grade').AsInteger;
        dataset.FieldByName('tipo_venda').AsString := vPedVendaProd.dataSet.FieldByName('tipo').AsString;
        dataSet.FieldByName('ativo').AsInteger := 1;
        vseqid := vseqid + 1;
        dataSet.FieldByName('SEQID').AsInteger := vseqid;
        dataSet.FieldByName('TIPV').AsString := vTipv;
      except
        Result := False;
        raise Exception.Create('Erro na tentativa de gravar a devolução!')
      end;
      if not inherited Post then
      begin
        Result := False;
        raise Exception.Create('Erro na tentativa de gravar a devolução!');
      end;
    end
    else
    begin
      Result := False;
      raise Exception.Create('Erro na tentativa de gravar a devolução!')
    end;
  end;
end;

function TDevolucao.insert: Boolean;
begin
  Result := False;

  if not dataSet.Active then
    montaSelect('select * from DEVOLUCAO where SEQUENCIA = 0');

  if inherited Insert then
    result := True;
end;

(*function TDevolucao.LancarDevolucaodeNotaFiscal(vCodnf: string): Boolean;
begin
   // variaveis
   vSequencia := 0;

   montaSelect('select * from DEVOLUCAO where SEQUENCIA = 0');
   vDevolucaoGrade.abreDevolucaoGrade;
   vRecibo.abreRecibo;

   if vCodnf <> '' then
   begin
      vNF.montaSelect('select nf.*, nfi.* '+
                      'from notafiscal nf, notafiscal_item nfi '+
                      'where nf.cod_nf = nfi.cod_nf '+
                      'and nf.cod_empresa = nfi.cod_empresa '+
                      'and nfi.tipo_item = ''P'' '+
                      'and nf.cod_nf = '+ vCodnf +' '+
                      'and nf.cod_empresa = '+ vDadosIni.codEmpresa +' ');

      while not vNF.dataSet.Eof do
      begin
          if not pesquisaCLiente(vnf.dataSet.FieldByName('cod_cliente').AsString) then
          begin
             Result := False;
             raise Exception.Create('Cliente inexistente para lançamento de devolução, favor verifique!');
          end;

          if pesquisaGrade( vnf.dataSet.FieldByName('COD_PROD').AsString, vNF.dataSet.FieldByName('grupo_prod').AsString ) then
             vPossuiGrade := True;

          if Insert then
          begin
              Try

                // Inserir Devolução
                dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
                dataSet.FieldByName('sequencia').AsInteger := vSequencia;
                dataSet.FieldByName('grupo_prod').AsString := vnf.dataSet.FieldByName('grupo_prod').AsString;
                dataSet.FieldByName('cod_prod').AsString := vNF.dataSet.FieldByName('cod_prod').AsString;
                dataSet.FieldByName('num_fab_prod').AsString := vNF.dataSet.FieldByName('num_fab_prod').AsString;
                dataSet.FieldByName('descricao').AsString := vNF.dataSet.FieldByName('descricao_item').AsString;

                dataSet.FieldByName('nome_cliente').AsString := vCliente.dataSet.FieldByName('nome_cliente').AsString;
                dataSet.FieldByName('cod_cliente').AsString := vCliente.dataSet.FieldByName('cod_cliente').AsString;
                dataSet.FieldByName('endereco').AsString := vCliente.dataSet.FieldByName('endereco').AsString;
                dataSet.FieldByName('telefone').AsString := vCliente.dataSet.FieldByName('fone_cliente').AsString;

                dataSet.FieldByName('quant').AsCurrency := vNF.dataSet.FieldByName('quantidade').AsCurrency;
                dataSet.FieldByName('data').AsString := DateToStr(date);
                dataSet.FieldByName('cod_venda').AsString := vNF.dataSet.FieldByName('cod_nf').AsString;
                dataSet.FieldByName('cod_vendedor').AsString := vNF.dataSet.FieldByName('cod_vendedor').AsString;
                dataSet.FieldByName('tipo').AsString := 'D';
                dataSet.FieldByName('sequencia').AsInteger := vSequencia;

                if not vPossuiGrade then
                   dataSet.FieldByName('cod_grade').AsString := '0'
                else
                   dataSet.FieldByName('cod_grade').AsString := vGrade.dataSet.FieldByName('cod_grade').AsString ;

                dataSet.FieldByName('ativo').AsInteger := 1 ;

                //olhar isso aqui ainda
                dataSet.FieldByName('valor').AsCurrency := vNF.dataSet.FieldByName('valor_unitario').AsCurrency;
                dataSet.FieldByName('pcust_mc').AsCurrency := vNF.dataSet.FieldByName('prec_cusm_prod').AsCurrency;

              Except
                 Result := False;
                 raise Exception.Create('Erro ao tentar lançar devolução!');
              end;

              if not inherited Post then
              begin
                 Result := False;
                 raise Exception.Create('Erro ao tentar gravar devolução!');
              end;

              // Inserir Devolução Grade
              if vPossuiGrade then
              begin
                  if vDevolucaoGrade.Insert then
                  begin
                     Try
                        vDevolucaoGrade.dataSet.FieldByName('cod_devolucao').AsInteger := vSequencia;
                        vDevolucaoGrade.dataSet.FieldByName('grupo_prod').AsString := vPedVendaProd.dataSet.FieldByName('grupo_prod').AsString;
                        vDevolucaoGrade.dataSet.FieldByName('cod_prod').AsString := vPedVendaProd.dataSet.FieldByName('cod_prod').AsString;
                        vDevolucaoGrade.dataSet.FieldByName('cod_grade').AsString := vPedVendaProd.dataSet.FieldByName('cod_grade').AsString;
                        vDevolucaoGrade.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
                        vDevolucaoGrade.dataSet.FieldByName('qtde').AsFloat := RoundTo(vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsFloat, - 4);
                        vDevolucaoGrade.dataSet.FieldByName('ativo').AsInteger := 1;
                     Except
                        Result := False;
                        raise Exception.Create('Erro na tentativa de gravar a devolução da grade!')
                     end;

                     if not vDevolucaoGrade.somentePost then
                     begin
                        Result := False;
                        raise Exception.Create('Erro na tentativa de gravar a devolução da grade!');
                     end;

                  end
                  else
                  begin
                     Result := False;
                     raise Exception.Create('Erro na tentativa de gravar a devolução da grade!')
                  end;
              end;  // Fim Inseri Devolução Grade.

          end
          else
          begin
            Result := False;
            raise Exception.Create('Erro ao tentar lançar devolução!');
          end;

          vNF.dataSet.Next;
      end; // fim do while dos itens da nota fiscal.

      if not VoltaEstoqueGradeeProduto then // Volta o estoque da grade e do Produto;
      begin
         CancelaOperacoes;
         Result := False;
         Exit;
      end;

      if not GerarRecibo then // Gera o recibo para o cliente.
      begin
         CancelaOperacoes;
         Result := False;
         Exit;
      end;

      if not GerarSequencia then // Gera o número de sequencia e altera na tabelas necessárias.
      begin
         CancelaOperacoes;
         Result := False;
         Exit;
      end;

      if not ConfirmaOperacoes then  // da o apply em todas as tabelas Pendentes.
      begin
         Application.MessageBox('Ocorreu um erro ao salvar a devolução. A devolução será cancelada.','Atenção', MB_ICONERROR + MB_OK);
         CancelaOperacoes;
         Result := False;
         Exit;
      end;
      Result := True;

   end
   else
      Application.MessageBox('Informe uma Nota Fiscal','Atenção', MB_ICONINFORMATION + MB_OK);

end;*)

function TDevolucao.pesquisaCLiente(codCliente: string): Boolean;
begin
  vCliente.montaSelect('select * from clientes ' +
    'where cod_cliente = ' + codCliente + ' ' +
    'and cod_empresa = ' + vDadosIni.codEmpresa + ' ' +
    'and ativo = 1 ');

  if vCliente.dataSet.IsEmpty then
    Result := false
  else
    Result := True;
end;

function TDevolucao.PesquisadeVendas: Boolean;
var
  Aint: Integer;
begin

  if ((vdataini = '  /  /    ') and (vdatafin = '  /  /    ')) then
    if vNped = '' then
      if vcodcli = '' then
      begin
        Result := False;
        Application.MessageBox('Venda inexistente para esta pesquisa!', 'Atenção', MB_ICONINFORMATION + MB_OK);
        Exit;
      end;

  if ((vdataini <> '  /  /    ') and (vdatafin <> '  /  /    ')) then
  begin
    try
      StrToDate(vdataini);
      StrToDate(vdatafin);
    except
      Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
  end;

  if vNped <> '' then
  begin
    try
      StrToInt(vNped);
    except
      Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique o campo Número da venda.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
  end;

  if Trim(vDAV) <> '' then
    if not TryStrToInt(Trim(vDAV), Aint) then
    begin
      vDadosIni.ShowErro('Número do DAV informado inválido');
      Exit;
    end;

  if vcodcli <> '' then
  begin
    try
      StrToInt(vcodcli);
    except
      Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique o campo código do cliente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
  end;

  vPedvenda.dataSet.Close;
  vPedvenda.dataSet.CommandText := '';
  vPedvenda.dataSet.CommandText := 'select v.*, dev_vnd.valor_total_dev, dev_vnd.valor_total_apos_dev from pedvenda v ' +
    ' left join retorna_qtde_dev_vnd (v.nped, v.tipo, v.cod_empresa, v.valor_total) dev_vnd on 1 = 1 ' +
  	' where ';
//  if vtipoVenda = 'REQ' then
//   vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText + ' v.tipo = ''REQ'' and v.tipv in ' + vDadosIni.vTipoVendaREQ
//  else if vtipoVenda = 'OS' then
//    vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +' v.tipo = ''OS'' and v.tipo_os in ' + vDadosIni.vTipoVendaOS
//  else vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +
//    ' ((v.tipo = ''OS'' and v.tipo_os in ' + vDadosIni.vTipoVendaOS + ') or '+
//    ' ((v.tipo = ''REQ'' and v.tipv in ' + vDadosIni.vTipoVendaREQ + ')))';
  if vtipoVenda = 'REQ' then
    vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +
    	' v.tipo = ''REQ'' '
  else if vtipoVenda = 'OS' then
    vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +
    	' v.tipo = ''OS'' '
  else
  	vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +
    	' ((v.tipo = ''OS'') or (v.tipo = ''REQ'' ))';

  vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +
  	' and v.status_ped = ''FECHADA'' '+
    ' and v.cod_empresa = ' + vDadosIni.codEmpresa;

  if ((vdataini <> '  /  /    ') and (vdatafin <> '  /  /    ')) then
  begin
    vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +
      ' and v.data_fech >= :dataini ' +
      ' and v.data_fech <= :datafin ';
    vPedvenda.dataSet.Params.ParamByName('dataini').AsDate := StrToDate(vdataini);
    vPedvenda.dataSet.Params.ParamByName('datafin').AsDate := StrToDate(vdatafin);
  end;

  if vNped <> '' then
  begin
    vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +
    	' and v.nped = :nped ';
    vPedvenda.dataSet.Params.ParamByName('nped').AsInteger := strtoint(vNped);
  end;

  if Trim(vDAV) <> '' then
    vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +
    	' and v.nprevenda = ' + vDAV;

  if vcodcli <> '' then
  begin
    vPedvenda.dataSet.CommandText := vPedvenda.dataSet.CommandText +
    	' and v.cod_cliente = :cod_cliente ';
    vPedvenda.dataSet.Params.ParamByName('cod_cliente').AsInteger := strtoint(vcodcli);
  end;

  vPedvenda.dataSet.Open;

  if vPedvenda.dataSet.IsEmpty then
  begin
    Result := False;
    vPedVendaProd.Close;
    Application.MessageBox('Venda inexistente para esta pesquisa!', 'Atenção', MB_ICONINFORMATION + MB_OK);
  end
  else
    Result := True;

end;

function TDevolucao.pesquisadevolucao(pRefresh:boolean = false): Boolean;
var
  variavel: string;
begin
  Result := False;

  with dtmDevolucao do
  begin
    if pRefresh then
    begin
      qrBuscas02.open;
      (qrBuscas02.FieldByName('valordev') as tfloatfield).currency := true;
      result:=true;
      exit;
    end;
    if ((vdataini = '  /  /    ') and (vdatafin = '  /  /    ')) then
      if vcodcli = '' then
      begin
        Application.MessageBox('Nenhuma devolução encontrada.', 'Atenção', MB_ICONINFORMATION + MB_OK);
        Exit;
      end;

    if ((vdataini <> '  /  /    ') and (vdatafin <> '  /  /    ')) then
    begin
      try
        StrToDate(vdataini);
        StrToDate(vdatafin);
      except
        Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique os campos de data.' + chr(13) + 'Informe uma data válida.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        exit;
      end;
    end;

    if vcodcli <> '' then
    begin
      try
        StrToInt(vcodcli);
      except
        Application.MessageBox(PChar('Valor para consulta inválido.' + chr(13) + 'Verifique o campo código do cliente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        exit;
      end;
    end;

    qrBuscas02.Close;
    qrBuscas02.SQL.Clear;

//    qrBuscas02.Params.CreateParam(ftDate, 'dataini', ptUnknown);
//    qrBuscas02.Params.CreateParam(ftDate, 'datafin', ptUnknown);
//    qrBuscas02.Params.CreateParam(ftUnknown, 'cod_empresa', ptUnknown);
//    qrBuscas02.Params.CreateParam(ftUnknown, 'cod_cliente', ptUnknown);
//    qrBuscas02.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
//    qrBuscas02.ParamByName('cod_cliente').AsString := vcodcli;

    qrBuscas02.SQL.text := ' select dev.sequencia, dev.data, dev.cod_venda, dev.tipo_venda, ' +
      ' sum(case when (coalesce(dev.valor_tot, 0) > 0) then ' +
      '       round(coalesce(dev.valor_tot, 0), 2) ' +
      '     else ' +
      '       round(coalesce(dev.valor, 0) * coalesce(dev.quant, 0), 2) ' +
      ' end) valordev, ' +
      ' case when (rec.nrecibo > 0) then ''S'' else ''N'' end vale_compra ' +
      ' from devolucao dev ' +
      ' left join recibos rec on rec.nrecibo = dev.sequencia and rec.cod_empresa = dev.cod_empresa ' +
      ' where dev.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and dev.ativo = 1 ';

    if ((vdataini <> '  /  /    ') and (vdatafin <> '  /  /    ')) then
    begin
      qrBuscas02.SQL.text := qrBuscas02.SQL.text + ' and dev.data >= :dataini ' +
        ' and dev.data <= :datafin ';
      qrBuscas02.ParamByName('dataini').AsDate := StrToDate(vdataini);
      qrBuscas02.ParamByName('datafin').AsDate := StrToDate(vdatafin);
    end;

    if vcodcli <> '' then
      qrBuscas02.SQL.text := qrBuscas02.SQL.text + ' and dev.cod_cliente = '+vcodcli;
    vregracons := copy(qrBuscas02.SQL.text, pos('where', qrBuscas02.SQL.text), (Length(qrBuscas02.SQL.text) - pos('where', qrBuscas02.SQL.text)));
    qrBuscas02.SQL.text := qrBuscas02.SQL.text + ' group by dev.sequencia, dev.data, dev.cod_venda, dev.tipo_venda, 6 ';

//    qrBuscas02.SQL.Text := variavel;
    qrBuscas02.Open;
//    (qrBuscas02.FieldByName('valordev') as tfloatfield).currency := true;
//    TFloatField(qrBuscas02.FieldByName('valordev')).DisplayFormat := '#,##0.00';

    if qrBuscas02.IsEmpty then
      Application.MessageBox('Nenhuma devolução encontrada.', 'Atenção', MB_ICONINFORMATION + MB_OK)
    else
      Result := True;

    TFloatField(qrBuscas02.FieldByName('VALORDEV')).DisplayFormat := '#0.00';
  end;
end;

function TDevolucao.pesquisaGrade(Codprod: string; grupoprod: Integer; vcgrade: Integer): Boolean;
begin
  vPossuiGrade := false;
  if vcgrade <> 0 then
    vGrade.montaSelect(' select * from cod_grade_prod c ' +
    	' inner join grade g on c.cod_grade = g.cod_grade and c.cod_empresa = g.cod_empresa ' +
      ' where c.grupo_prod = ' + IntToStr(grupoprod) +
      ' and c.cod_prod = ' + QuotedStr(Codprod) +
      ' and c.cod_grade =  ' + IntToStr(vcgrade) +
      ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and c.ativo = 1 ')

  else
    vGrade.montaSelect(' select * from cod_grade_prod c ' +
    	' inner join grade g on c.cod_grade = g.cod_grade and c.cod_empresa = g.cod_empresa ' +
      ' where c.grupo_prod = ' + IntToStr(grupoprod) +
      ' and c.cod_prod = ' + QuotedStr(Codprod) +
      ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and c.ativo = 1 ');

  if vGrade.dataSet.IsEmpty then
    Result := false
  else
  begin
    dataSet.First;
    vPossuiGrade := true;
    Result := True;
  end;
end;

function TDevolucao.PesquisaItemDevolvido(pQtdedev, pQtdedevConv: real; pUnidade: string): Boolean;
//var
//  vQuantidadeDev:double;
begin
  Result := True;
  FQuantidadeJaDev := 0;
  FQuantidadeJaDevConv := 0;
  {buscas.Close;
  buscas.SQL.text:= 'select sum(DEVOLUCAO.quant) as quant from DEVOLUCAO where COD_VENDA = '+ vPedVendaProd.dataSet.FieldByName('nped').AsString +' and TIPO_VENDA = '''+vtipoVenda+''' '+
    ' and NUM_FAB_PROD = '+ quotedstr(trim(vPedVendaProd.dataSet.FieldByName('num_fab_prod').AsString)) +
    ' and cod_empresa = '+ vDadosIni.codEmpresa +' and ativo = 1 ';
  if vPossuiGrade then
    buscas.SQL.text:=buscas.SQL.text + ' and cod_grade = '+ inttostr(vPedVendaProd.dataSet.FieldByName('cod_grade').Asinteger);
  buscas.Open;}
  buscas.Close;
  buscas.SQL.text := ' select ' +
  	' sum(case ' +
    '			 when (trim(coalesce(dev.UNIDADE_CONV, '''')) = '''') then ' +
    '        coalesce(dev.QUANT, 0) ' +
    '			 when (trim(coalesce(dev.UNIDADE, '''')) = '''') then ' +
    '        coalesce(dev.QUANT, 0) ' +
    '			 when (trim(coalesce(dev.UNIDADE, '''')) = trim(coalesce(dev.UNIDADE_CONV, ''''))) then ' +
    '        coalesce(dev.QUANT, 0) ' +
    '			 when ((dev.OPERACAO_CONV = ''M'') and (dev.FATOR_CONV > 0)) then ' +
  	'        (coalesce(dev.QUANT, 0) * dev.FATOR_CONV) ' +
    '			 when ((dev.OPERACAO_CONV = ''D'') and (dev.FATOR_CONV > 0)) then ' +
    '        (coalesce(dev.QUANT, 0) / dev.FATOR_CONV) ' +
    '      else ' +
    '         coalesce(dev.QUANT, 0) ' +
    ' end) QUANT_CONV, ' +
  	' sum(coalesce(dev.QUANT, 0)) as quant from devolucao dev ' +
    ' inner join produtos pr on ' +
    '		pr.GRUPO_PROD = dev.GRUPO_PROD ' +
    '		and pr.COD_PROD = dev.COD_PROD ' +
    '		and pr.COD_EMPRESA = dev.COD_EMPRESA ' +
  	' where dev.COD_VENDA = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('nped').AsInteger) +
    ' and dev.TIPO_VENDA = ' + QuotedStr(vtipoVenda) +
    ' and dev.GRUPO_PROD = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
    ' and dev.COD_PROD = ' + QuotedStr(trim(vPedVendaProd.dataSet.FieldByName('COD_PROD').AsString)) +
    ' and dev.COD_GRADE = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('cod_grade').Asinteger) +
    ' and dev.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' and iif(trim(coalesce(dev.unidade_conv, '''')) <> '''', ' +
    '					trim(coalesce(dev.unidade_conv, '''')), ' +
    '					trim(coalesce(dev.unidade, pr.unidade))) = ' + QuotedStr(pUnidade) +
    ' and dev.ATIVO = 1 ';
  buscas.Open;

  FQuantidadeJaDev     := RoundTo(buscas.FieldByName('quant').AsFloat, - 4);
  FQuantidadeJaDevConv := RoundTo(buscas.FieldByName('quant_conv').AsFloat, - 4);
  {buscas.Close;
  buscas.SQL.text:= 'select sum(pp.quant_ped_item) as quant from pedvenda_prod pp '+
    ' where pp.nped = '+vPedVendaProd.dataSet.FieldByName('nped').AsString+
    ' and pp.tipo = '+quotedstr(vtipoVenda)+
    ' and pp.NUM_FAB_PROD = '+ quotedstr(trim(vPedVendaProd.dataSet.FieldByName('num_fab_prod').AsString)) +
    ' and pp.cod_empresa = '+ vDadosIni.codEmpresa +' and pp.ativo = 1 '+
    ' and coalesce(pp.status,'''')<>''CANCELADO'' ';
  if vPossuiGrade then
    buscas.SQL.text:=buscas.SQL.text + ' and pp.cod_grade = '+ inttostr(vPedVendaProd.dataSet.FieldByName('cod_grade').Asinteger);
  buscas.Open;}
  buscas.Close;
  buscas.SQL.text := ' select ' +
  	' sum(case ' +
    '			 when (trim(coalesce(pp.UNIDADE_CONV, '''')) = '''') then ' +
    '        coalesce(pp.QUANT_PED_ITEM, 0) ' +
    '			 when (trim(coalesce(pp.UNIDADE, '''')) = '''') then ' +
    '        coalesce(pp.QUANT_PED_ITEM, 0) ' +
    '			 when (trim(coalesce(pp.UNIDADE, '''')) = trim(coalesce(pp.UNIDADE_CONV, ''''))) then ' +
    '        coalesce(pp.QUANT_PED_ITEM, 0) ' +
    '			 when ((pp.OPERACAO_CONV = ''M'') and (pp.FATOR_CONV > 0)) then ' +
  	'        (coalesce(pp.QUANT_PED_ITEM, 0) * pp.FATOR_CONV) ' +
    '			 when ((pp.OPERACAO_CONV = ''D'') and (pp.FATOR_CONV > 0)) then ' +
    '        (coalesce(pp.QUANT_PED_ITEM, 0) / pp.FATOR_CONV) ' +
    '      else ' +
    '         coalesce(pp.QUANT_PED_ITEM, 0) ' +
    ' end) QUANT_CONV, ' +
  	' sum(coalesce(pp.QUANT_PED_ITEM, 0)) as quant from pedvenda_prod pp ' +
    ' where pp.NPED = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('nped').AsInteger) +
    ' and pp.TIPO = ' + QuotedStr(vtipoVenda) +
    ' and pp.GRUPO_PROD = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
    ' and pp.COD_PROD = ' + QuotedStr(trim(vPedVendaProd.dataSet.FieldByName('COD_PROD').AsString)) +
    ' and pp.COD_GRADE = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('COD_GRADE').Asinteger) +
    ' and pp.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' and pp.ATIVO = 1 ' +
    ' and iif(trim(coalesce(pp.unidade_conv, '''')) <> '''', ' +
    '				  trim(coalesce(pp.unidade_conv, '''')), ' +
    '					trim(coalesce(pp.unidade, ''''))) = ' + QuotedStr(pUnidade) +
    ' and coalesce(pp.STATUS, '''') <> ''CANCELADO'' ';
  buscas.Open;

  if vDadosIni.StrToFloatFormat(FQuantidadeJaDevConv + pQtdedevConv, 4) > vDadosIni.StrToFloatFormat(buscas.FieldByName('quant_conv').AsFloat, 4) then
  	Result := False
  else if vDadosIni.StrToFloatFormat(FQuantidadeJaDev + pQtdedev, 4) > vDadosIni.StrToFloatFormat(buscas.FieldByName('quant').AsFloat, 4) then
    Result := False;
  buscas.Close;
end;

function TDevolucao.PesquisaItensVenda(Nped, Tipo: string): Boolean;
var
	I: Integer;
  vdtSetDevTemp, vdtSetItensTemp: TClientDataSet;
  vValorDevRest: Double;
begin
  if Nped = '' then
    Exit
  else
  begin
  	try
      vdtSetDevTemp := TClientDataSet.Create(nil);
      vdtSetDevTemp.Close;
      vdtSetDevTemp.FieldDefs.Clear;
      vdtSetDevTemp.FieldDefs.Add('NPED', ftInteger, 0, false);
      vdtSetDevTemp.FieldDefs.Add('TIPO', ftString, 3, false);
      vdtSetDevTemp.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
      vdtSetDevTemp.FieldDefs.Add('COD_PROD', ftString, 6, false);
      vdtSetDevTemp.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
      vdtSetDevTemp.FieldDefs.Add('QUANT_DEV_REST', ftFloat, 0, false);

      if vdtSetDevTemp.Tag = 0 then
      try
        vdtSetDevTemp.CreateDataSet;
        vdtSetDevTemp.Tag := 1;
      except
      end;

      vdtSetItensTemp := TClientDataSet.Create(nil);
      vdtSetItensTemp.Close;
      vdtSetItensTemp.FieldDefs.Clear;
      vdtSetItensTemp.FieldDefs.Add('NPED', ftInteger, 0, false);
      vdtSetItensTemp.FieldDefs.Add('TIPO', ftString, 3, false);
      vdtSetItensTemp.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
      vdtSetItensTemp.FieldDefs.Add('COD_PROD', ftString, 6, false);
      vdtSetItensTemp.FieldDefs.Add('NITEM', ftInteger, 0, false);
      vdtSetItensTemp.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
      vdtSetItensTemp.FieldDefs.Add('CODIGO_NOP', ftFloat, 0, false);
      vdtSetItensTemp.FieldDefs.Add('QUANT_PED_ITEM', ftFloat, 0, false);
      vdtSetItensTemp.FieldDefs.Add('QUANT_DEV_ITEM', ftFloat, 0, false);

      if vdtSetItensTemp.Tag = 0 then
      try
        vdtSetItensTemp.CreateDataSet;
        vdtSetItensTemp.Tag := 1;
      except
      end;

      vPedVendaProd.montaSelect(' select * from pedvenda_prod ' +
        ' where nped = ' + Nped +
        ' and tipo = ' + QuotedStr(Trim(Tipo)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and (status is null or status = '''') ' +
        ' and ativo = 1 ' +
        ' order by nitem ');

      vPedVendaProd.dataSet.First;
      while not vPedVendaProd.dataSet.Eof do
    	begin
      	buscas.Close;
        buscas.SQL.Text := ' select ' + QuotedStr(vPedVendaProd.dataSet.FieldByName('TIPO').AsString) + ' tipo, ' +
          ' d.grupo_prod, d.cod_prod, d.cod_grade, sum(coalesce(d.quant, 0)) quant_dev_item from devolucao d ' +
          ' where d.cod_venda = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('NPED').AsInteger) +
          ' and d.tipo_venda = ' + QuotedStr(vPedVendaProd.dataSet.FieldByName('TIPO').AsString) +
          ' and d.grupo_prod = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
          ' and d.cod_prod = ' + QuotedStr(vPedVendaProd.dataSet.FieldByName('COD_PROD').AsString) +
          ' and d.cod_grade = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('COD_GRADE').AsInteger) +
          ' and d.cod_empresa = ' + vDadosIni.codEmpresa +
          ' group by 1,2,3,4 ';
        buscas.Open;

        if not buscas.IsEmpty then
        begin
          try
            vdtSetDevTemp.Filtered := false;
            vdtSetDevTemp.Filter :=
              ' grupo_prod = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
              ' and cod_prod = ' + QuotedStr(trim(vPedVendaProd.dataSet.FieldByName('COD_PROD').AsString)) +
              ' and cod_grade = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('COD_GRADE').AsInteger);
            vdtSetDevTemp.Filtered := true;

            vdtSetItensTemp.Insert;
            vdtSetItensTemp.FieldByName('GRUPO_PROD').AsInteger := vPedVendaProd.dataSet.FieldByName('GRUPO_PROD').AsInteger;
            vdtSetItensTemp.FieldByName('COD_PROD').AsString := trim(vPedVendaProd.dataSet.FieldByName('COD_PROD').AsString);
            vdtSetItensTemp.FieldByName('NITEM').AsInteger := vPedVendaProd.dataSet.FieldByName('NITEM').AsInteger;
            vdtSetItensTemp.FieldByName('COD_GRADE').AsInteger := vPedVendaProd.dataSet.FieldByName('COD_GRADE').AsInteger;
            vdtSetItensTemp.FieldByName('CODIGO_NOP').AsFloat := vPedVendaProd.dataSet.FieldByName('CODIGO_NOP').AsFloat;
            vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat := vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;

            if vdtSetDevTemp.IsEmpty then
            begin
              if (buscas.FieldByName('QUANT_DEV_ITEM').AsFloat > 0)
                and (buscas.FieldByName('QUANT_DEV_ITEM').AsFloat > vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat) then
              begin
                vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat;
              end
              else if (buscas.FieldByName('QUANT_DEV_ITEM').AsFloat > 0)
                and (buscas.FieldByName('QUANT_DEV_ITEM').AsFloat <= vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat) then
              begin
                vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := buscas.FieldByName('QUANT_DEV_ITEM').AsFloat;
              end
              else
              begin
                vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := 0;
              end;             

              vdtSetDevTemp.Insert;
              vdtSetDevTemp.FieldByName('GRUPO_PROD').AsInteger := vPedVendaProd.dataSet.FieldByName('GRUPO_PROD').AsInteger;
              vdtSetDevTemp.FieldByName('COD_PROD').AsString := vPedVendaProd.dataSet.FieldByName('COD_PROD').AsString;
              vdtSetDevTemp.FieldByName('COD_GRADE').AsInteger := vPedVendaProd.dataSet.FieldByName('COD_GRADE').AsInteger;
              vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat := buscas.FieldByName('QUANT_DEV_ITEM').AsFloat;

              if (vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat >= buscas.FieldByName('QUANT_DEV_ITEM').AsFloat) then
                  vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat := 0
              else if (buscas.FieldByName('QUANT_DEV_ITEM').AsFloat > vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat) then
                  vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat :=
                    vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat - vPedVendaProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
              vdtSetDevTemp.Post;
            end
            else if (vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat > 0)
              and (vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat >= vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat) then
            begin
              vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat;

              vdtSetDevTemp.Edit;
              vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat :=
                vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat - vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat;
              vdtSetDevTemp.Post;
            end
            else
            begin
              vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat;

              vdtSetDevTemp.Edit;
              vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat := 0;
              vdtSetDevTemp.Post;
            end;

            vdtSetItensTemp.Post;
          finally
            vdtSetDevTemp.Filtered := false;
          end;
        end;

      	vPedVendaProd.dataSet.Next;
      end;

      vPedVendaProd.DataSet.First;
      while not vPedVendaProd.DataSet.Eof do
      begin
        vPedVendaProd.dataSet.Edit;

        try
          vdtSetItensTemp.Filtered := false;
          vdtSetItensTemp.Filter :=
            ' grupo_prod = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
            ' and cod_prod = ' + QuotedStr(trim(vPedVendaProd.dataSet.FieldByName('COD_PROD').AsString)) +
            ' and nitem = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('NITEM').AsInteger) +
            ' and cod_grade = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('COD_GRADE').AsInteger);
          vdtSetItensTemp.Filtered := true;

          if not vdtSetItensTemp.IsEmpty then
            vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat := vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat
          else
            vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat := 0;

          if (trim(vPedVendaProd.dataSet.FieldByName('UNIDADE_CONV').AsString) = '')
            or (UpperCase(trim(vPedVendaProd.dataSet.FieldByName('UNIDADE').AsString)) = UpperCase(trim(vPedVendaProd.dataSet.FieldByName('UNIDADE_CONV').AsString))) then
          begin
            vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP_CONV').AsFloat := RoundTo(
              vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat, - 4);
          end
          else
          begin
            if (vPedVendaProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'M') and (vPedVendaProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
            begin
              vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP_CONV').AsFloat := RoundTo(
                vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat *
                  vPedVendaProd.dataSet.FieldByName('FATOR_CONV').AsFloat, - 4);
            end
            else if (vPedVendaProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'D') and (vPedVendaProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
            begin
              vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP_CONV').AsFloat := RoundTo(
                vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat /
                  vPedVendaProd.dataSet.FieldByName('FATOR_CONV').AsFloat, - 4);
            end
            else
            begin
              vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP_CONV').AsFloat := RoundTo(
                vPedVendaProd.dataSet.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat, - 4);
            end;
          end;
        finally
          vdtSetItensTemp.Filtered := false;
        end;

        vPedVendaProd.dataSet.Post;

        vPedVendaProd.dataSet.Next;
      end;

      if vPedVendaProd.dataSet.IsEmpty then
        Result := false
      else
        Result := True;
    finally
      if Assigned(vdtSetDevTemp) then
     	  FreeAndNil(vdtSetDevTemp);
      if Assigned(vdtSetItensTemp) then
        FreeAndNil(vdtSetItensTemp);
    end;
  end;
end;

function TDevolucao.PesquisaItensVenda(Nped: string): Boolean;
begin
  if Nped = '' then
    Exit
  else
  begin
    vPedVendaProd.montaSelect(' select * from pedvenda_prod ' +
      ' where nped = ' + Nped +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and (status is null or status = '''') ' +
      ' and ativo = 1 ' +
      ' order by nitem ');
    if vPedVendaProd.dataSet.IsEmpty then
      Result := false
    else
      Result := True;
  end;

end;

function TDevolucao.pesquisaProduto: Boolean;
var
  GradeNoCodigo: boolean;
  vGrupoTemp {,vCodProdTemp}: string;
  i, j: Integer;
begin
	vProduto.vPesqDescrProd := false;
  result := false;
  GradeNoCodigo := false;
  vPossuiGrade := false;
//  vQuant := 0;
//  j := 0;
//  for i := 1 to length(vCodBarra) do
//    if (Copy(vCodBarra, I, 1) = '*') {or (Copy(UpperCase(codBarra), I, 1) = 'X')} then
//    begin
//      inc(j);
//      if j >= 2 then
//      begin
//        Application.MessageBox('Quantidade Invalida. Dois ou mais sinais de multiplicação',
//          'Atenção', MB_ICONWARNING + MB_OK);
//        exit;
//      end;
//    end;
//  for i := 1 to length(vCodBarra) do
//    if (Copy(vCodBarra, I, 1) = '*') {or (Copy(UpperCase(codBarra), I, 1) = 'X')} then
//    begin
//      try
//        vQuant := strtofloat(copy(vCodBarra, 1, I - 1));
//      except
//        Application.MessageBox(pchar('Quantidade Invalida'), 'Informação', MB_ICONINFORMATION
//          +
//          mb_OK);
//        exit;
//      end;
//      vCodBarra := trim(COPY(vCodBarra, I + 1, 20));
//    end;
//  if vQuant = 0 then
//    vQuant := 1;
//
//
//  if (Copy(vCodBarra, 1, 2) = 'A-') or ( Copy(vCodBarra, 1, 2) = 'G-') then
//  begin
//    try
//      if (pos(';', vCodBarra) > 0) then //compatibilidade com etiquetas antigas
//      begin
//        vCodGrade := strtoint(Copy(vCodBarra, Pos(';', vCodBarra) + 1, Length(vCodBarra) - Pos(';', vCodBarra)));
//        vGrupoTemp := Copy(vCodBarra, 5, (pos(';', vCodBarra) - 5 - strtoint(vDadosIni.vProduto.vDigitosProd)));
//        vCodProd := Copy(vCodBarra, (pos(';', vCodBarra) - strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd));
//        vCodBarra := trim(retornaValor('select num_fab_prod as valor from produtos where cod_empresa=' + vDadosIni.codEmpresa +
//          ' and grupo_prod=' + Copy(vCodBarra, 5, (pos(';', vCodBarra) - 5 - strtoint(vDadosIni.vProduto.vDigitosProd))) +
//          ' and cod_prod=' + quotedstr(Copy(vCodBarra, (pos(';', vCodBarra) - strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd))) +
//          ' and ativo=1'));
//      end
//      else if (pos('/', vCodBarra) > 0) then //compatibilidade com etiquetas antigas
//      begin
//        vCodGrade := strtoint(Copy(vCodBarra, Pos('/', vCodBarra) + 1, Length(vCodBarra) - Pos('/', vCodBarra)));
//        vGrupoTemp := Copy(vCodBarra, 5, (pos('/', vCodBarra) - 5 - strtoint(vDadosIni.vProduto.vDigitosProd)));
//        vCodProd := Copy(vCodBarra, (pos('/', vCodBarra) - strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd));
//        vCodBarra := trim(retornaValor('select num_fab_prod as valor from produtos where cod_empresa=' + vDadosIni.codEmpresa +
//          ' and grupo_prod=' + Copy(vCodBarra, 5, (pos('/', vCodBarra) - 5 - strtoint(vDadosIni.vProduto.vDigitosProd))) +
//          ' and cod_prod=' + quotedstr(Copy(vCodBarra, (pos('/', vCodBarra) - strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd))) +
//          ' and ativo=1'));
//      end
//      else
//      begin //Novo modelo de etiqueta
//        vCodGrade := StrToInt(copy(vCodBarra, (3 + vDadosIni.vEmp.vDigitosEmp + vDadosIni.vEmp.vDidgitosGrup + strtoint(vDadosIni.vProduto.vDigitosProd)), 10));
//        vGrupoTemp := Copy(vCodBarra, 3 + vDadosIni.vEmp.vDigitosEmp, vDadosIni.vEmp.vDidgitosGrup);
//        vCodProd := Copy(vCodBarra, 3 + vDadosIni.vEmp.vDigitosEmp + vDadosIni.vEmp.vDidgitosGrup, strtoint(vDadosIni.vProduto.vDigitosProd));
//        vCodBarra := trim(retornaValor('select num_fab_prod as valor from produtos where cod_empresa=' + vDadosIni.codEmpresa +
//          ' and grupo_prod=' + Copy(vCodBarra, 3 + vDadosIni.vEmp.vDigitosEmp, vDadosIni.vEmp.vDidgitosGrup) +
//          ' and cod_prod=' + quotedstr(Copy(vCodBarra, 3 + vDadosIni.vEmp.vDigitosEmp + vDadosIni.vEmp.vDidgitosGrup, strtoint(vDadosIni.vProduto.vDigitosProd))) +
//          ' and ativo=1'));
//      end;
//      vPossuiGrade := true;
//      GradeNoCodigo := true;
//    except
//      Application.MessageBox('Produto não encontrado', 'Atenção', MB_ICONINFORMATION + MB_OK);
//      exit;
//    end;
//  end
//  else
//    vPossuiGrade := False;

	vGrupoTemp := '0';
  vCodProd := '';
  if trim(vGrupoProdPesq) <> '' then
  	vGrupoTemp := trim(vGrupoProdPesq);
  if trim(vCodProdPesq) <> '' then
  	vCodProd := trim(vCodProdPesq);

  vDadosIni.vEtiqProd := vDadosIni.retornaDadosEtiqueta(
    buscas,
    vCodBarra,
    StrToInt(vGrupoTemp),
    trim(vCodProd));

  vGrupoTemp := IntToStr(vDadosIni.vEtiqProd.GrupoProd);
  vCodProd   := vDadosIni.vEtiqProd.CodProd;
  vCodBarra   := vDadosIni.vEtiqProd.CodBarra;
  vcodgrade  := vDadosIni.vEtiqProd.CodGrade;
	vQuant := vDadosIni.vEtiqProd.Quant;
  
  vPossuiGrade := vcodgrade > 0;
  GradeNoCodigo := vcodgrade > 0;

  if vCodBarra = '' then
  begin
    Application.MessageBox('Produto não encontrado', 'Atenção', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  if GradeNoCodigo then
  begin
    buscas.Close;
    buscas.SQL.Text := ' select cod_grade from cod_grade_prod' +
      ' where grupo_prod = ' + vGrupoTemp +
      ' and cod_prod = ' + QuotedStr(vCodProd) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_grade = ' + IntToStr(vCodGrade);
    buscas.Open;

    if buscas.IsEmpty then
    begin
      Application.MessageBox(pchar('Grade de código ' + IntToStr(vcodgrade) + ' não encontrada para o produto'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      result := false;
      exit;
    end;
  end;

  vExisteVenda := False;

  if (trim(vGrupoProdPesq) <> '') or (trim(vCodProdPesq) <> '') then
  	vProduto.montaSelect(' select distinct p.*, ' +
    	' coalesce(est.estoque, 0) estoque_disponivel, ' +
	 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
      ' inner join cod_barra cb on cb.cod_prod = p.cod_prod and cb.grupo_prod = p.grupo_prod and cb.cod_empresa = p.cod_empresa ' +
      ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
      ' where p.grupo_prod = ' + vGrupoProdPesq +
      ' and p.cod_prod = ' + QuotedStr(vCodProdPesq) +
      ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo = 1 ')
	else if (trim(vCodProd) <> '') then
    vProduto.montaSelect(' select distinct p.*, ' +
    	' coalesce(est.estoque, 0) estoque_disponivel, ' +
	 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
      ' inner join cod_barra cb on cb.cod_prod = p.cod_prod and cb.grupo_prod = p.grupo_prod and cb.cod_empresa = p.cod_empresa ' +
      ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
      ' where p.grupo_prod = ' +  vGrupoTemp +
      ' and p.cod_prod = ' + QuotedStr(vCodProd) +
      ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo = 1 ')
	else
    vProduto.montaSelect(' select distinct p.*, ' +
    	' coalesce(est.estoque, 0) estoque_disponivel, ' +
	 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
      ' inner join cod_barra cb on cb.cod_prod = p.cod_prod and cb.grupo_prod = p.grupo_prod and cb.cod_empresa = p.cod_empresa ' +
      ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
      ' where cb.cod_barra = ' + QuotedStr(vCodBarra) +
      ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo = 1 ');

  if vProduto.dataSet.IsEmpty then
  begin
    vProduto.montaSelect(' select distinct p.*, ' +
    	' coalesce(est.estoque, 0) estoque_disponivel, ' +
	 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
      ' inner join cod_barra cb on cb.cod_prod = p.cod_prod and cb.grupo_prod = p.grupo_prod and cb.cod_empresa = p.cod_empresa ' +
      ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
      ' where p.descr_prod like ' + QuotedStr(vCodBarra + '%') +
      ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo = 1 ' +
      ' order by p.descr_prod ');

    if not buscas.IsEmpty then
     	vProduto.vPesqDescrProd := true;
  end;

  if not vProduto.dataSet.IsEmpty then
  	vProduto.vCodBarra := vDadosIni.IfThen(vProduto.vPesqDescrProd,
    	vProduto.dataSet.FieldByName('NUM_FAB_PROD').AsString, vCodBarra);

  if not vProduto.dataSet.IsEmpty then
    if vProduto.dataSet.RecordCount > 1 then
      if not vDadosIni._abreFormEscolhaProdutosIni(vProduto.dataSet) then
      begin
        Result := false;
        exit;
      end;

  if vProduto.dataSet.IsEmpty then
    Result := false
  else
  begin
    result := true;
    if not GradeNoCodigo then
      vPossuiGrade := ExecutaComandosSql(' select first 1 cgp.cod_grade from cod_grade_prod cgp' +
        ' inner join grade g on g.cod_grade = cgp.cod_grade and g.cod_empresa = cgp.cod_empresa' +
        ' where cgp.grupo_prod = ' + IntToStr(vProduto.dataSet.FieldByName('grupo_prod').AsInteger) +
        ' and cgp.cod_prod = ' + QuotedStr(trim(vProduto.dataSet.FieldByName('cod_prod').AsString)) +
        ' and cgp.cod_empresa = ' + vDadosIni.codEmpresa);

    if (not GradeNoCodigo) and (vPossuiGrade) then
      _abreFormSelecionaGrade(vProduto.dataSet.FieldByName('grupo_prod').AsInteger, trim(vProduto.dataSet.FieldByName('COD_PROD').AsString));

    if vcodgrade <> 0 then
    begin
      if not pesquisaGrade(vProduto.dataSet.FieldByName('COD_PROD').AsString, vProduto.dataSet.FieldByName('grupo_prod').AsInteger, vcodgrade) then
      begin
        result := false;
      end;
    end;
  end;
end;

function TDevolucao.pesquisaVendedor(codVendedor: integer): Boolean;
begin
  try
    vVendedor.montaSelect('select nome_vendedor, cod_vendedor ' +
      'from colaborador ' +
      'where cod_vendedor = ' + inttostr(codVendedor) +
      'and cod_empresa = ' + vDadosIni.codEmpresa +
      'and ativo = 1 ');

    if vVendedor.dataSet.IsEmpty then
      Result := False
    else
      Result := True;
  except
    Result := False;
  end;

end;

function TDevolucao.PossuiFormPagemento(numeroVenda: integer): Boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select * from formpagamento where rec_tipvend =''REC''' +
   ' and rec_numvend = ' + IntToStr(numeroVenda) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  Result := buscas.IsEmpty;
end;

function TDevolucao.Post: Boolean;
begin
  try
    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    if Apply then
    begin
      //      CommitaTransacao;
    end
    else
    begin
      //      Cancel;
      //      RollBackTransacao;
      Result := False;
    end;
    Refresh;
  except
    on e: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TDevolucao.retornaCodDepto: Integer;
var
 vTemp: Integer;
 buscas2: TIBQuery;
begin
  vTemp := 0;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas2.Close;
  buscas2.SQL.Text := ' SELECT COALESCE(COD_DEPTO, 0) COD_DEPTO FROM DEPTO ' +
  	' WHERE ATIVO = 1 AND TRIM(COALESCE(INICIAIS_DEPTO, '''')) <> '''' ' ;
  buscas2.SQL.Text := buscas2.SQL.Text + ' AND NOME_DEPTO IN (''VENDA DE PEÇAS'', ''ESTOQUE'') ';
  buscas2.Open;

  if buscas2.IsEmpty then
  begin
    buscas2.Close;
    buscas2.SQL.Text := ' SELECT COALESCE(COD_DEPTO, 0) COD_DEPTO FROM DEPTO ' +
      ' WHERE ATIVO = 1 AND TRIM(COALESCE(INICIAIS_DEPTO, '''')) <> '''' ' ;
    buscas2.SQL.Text := buscas2.SQL.Text + ' AND NOME_DEPTO = ' + QuotedStr(vDadosIni.vDpto);
    buscas2.Open;
  end;

  buscas2.Open;

  if buscas2.FieldByName('COD_DEPTO').AsInteger > 0 then
    vTemp := buscas2.FieldByName('COD_DEPTO').AsInteger;
  Result := vTemp;
end;

function TDevolucao.retornaNumRec: string;
var
 vTemp: string;
 buscas2: TIBQuery;
begin
  vTemp := '';

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas2.Close;
  buscas2.SQL.Text := ' SELECT COALESCE(INICIAIS_DEPTO, '''') INICIAIS_DEPTO FROM DEPTO ' +
  	' WHERE ATIVO = 1 AND TRIM(COALESCE(INICIAIS_DEPTO, '''')) <> '''' ' ;
  buscas2.SQL.Text := buscas2.SQL.Text + ' AND NOME_DEPTO IN (''VENDA DE PEÇAS'', ''ESTOQUE'') ';
  buscas2.Open;

  if buscas2.IsEmpty then
  begin
    buscas2.Close;
    buscas2.SQL.Text := ' SELECT COALESCE(INICIAIS_DEPTO, '''') INICIAIS_DEPTO FROM DEPTO ' +
      ' WHERE ATIVO = 1 AND TRIM(COALESCE(INICIAIS_DEPTO, '''')) <> '''' ' ;
    buscas2.SQL.Text := buscas2.SQL.Text + ' AND NOME_DEPTO = ' + QuotedStr(vDadosIni.vDpto);
    buscas2.Open;
  end;

  if trim(buscas2.FieldByName('INICIAIS_DEPTO').AsString) <> '' then
  begin
    vTemp := trim(buscas2.FieldByName('INICIAIS_DEPTO').AsString);
    vTemp := vTemp + vDadosIni.StrZero(Gencodigo('RECIBOS_' + trim(buscas2.FieldByName('INICIAIS_DEPTO').AsString),
    	dtmDevolucao.strIncCodigo, vDadosIni.codEmpresa), 4) + '/';
    vTemp := vTemp + FormatDateTime('yy', vDadosIni.getDataBanco(buscas2))
  end;
  Result := vTemp;
end;

function TDevolucao.somentePost: Boolean;
var
  vExistePrimeiroItem: Boolean;
  vQtdJaDevEmMemoria, vQtdJaDevEmMemoriaConv: real;
  vQuantConv: Currency;
  buscas2: TIBQuery;
begin
  try
    Result := True;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;
    // verifica o Percentual de desconto.

    if vPercDesconto = '' then
      vPercDesconto := '0';

    try
      StrToCurr(vPercDesconto);
    except
      Application.MessageBox('Erro de Conversao, Número digitado não é um número válido, tente novamente', 'Atenção', MB_ICONINFORMATION + MB_OK);
    end;

    if StrToFloat(vPercDesconto) > vDadosIni.vEmp.vTotDescProdVarejo then
    begin
      Application.MessageBox('Percentual do desconto maior que o permitido pela empresa, ' + #13 +
        'será assumido o Percentual da empresa', 'Atenção', MB_ICONINFORMATION + MB_OK);
      vPercDesconto := FloatToStr(vDadosIni.vEmp.vTotDescProdVarejo);
    end;

    if StrToFloat(vPercDesconto) < 0 then
      vPercDesconto := FloatToStr(StrToFloat(vPercDesconto) * (-1));

    vSequencia := 0;
    vQtdJaDevEmMemoria := 0;
    vQtdJaDevEmMemoriaConv := 0;
    //valida os campos
    if vCodBarra = '' then
      raiseExceptionCreate('Campo Código do Produto não informado!', 'Edit1');

    if vQuant = 0 then
      raiseExceptionCreate('Quantidade a devolver deve ser maior que zero!', 'Edit5');
    if vQuant < 0.001 then
      raiseExceptionCreate('A quantidade a devolver deve ser maior ou igual a 0,001.', 'Edit5');

    if not SqlOpen(' select sigla, descricao, fracionado from unidades ' +
      ' where sigla = ' + QuotedStr(trim(vUnidade)) +
      ' and coalesce(fracionado, 0) = 0 ', buscas).IsEmpty then
    		vQuantConv := RoundTo(vQuant, 0)
    else
    		vQuantConv := RoundTo(vQuant, - 4);
    vQuant := vQuantConv;

    if vExisteVenda then
    begin
    	if not SqlOpen(' select pp.grupo_prod, pp.cod_prod, pp.cod_empresa, ' +
        ' un.fracionado, ' +
      	' pp.unidade_conv as unidade, ' +
      	' pp.fator_conv as quantidade, pp.operacao_conv as operacao, ' +
        ' pp.unidade as unidade_prod from pedvenda_prod pp ' +
        ' left join unidades un on ' +
        '		un.sigla = iif(trim(coalesce(pp.unidade_conv, '''')) <> '''', ' +
        '									 trim(coalesce(pp.unidade_conv, '''')), ' +
        ' 								 trim(coalesce(pp.unidade, ''''))) ' +
        ' where pp.nped = ' + IntToStr(vPedVendaProd.dataSet.FieldByName('NPED').AsInteger) +
        ' and pp.tipo = ' + QuotedStr(vPedVendaProd.dataSet.FieldByName('TIPO').AsString) +
        ' and pp.grupo_prod = ' + IntToStr(vProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
        ' and pp.cod_prod = ' + QuotedStr(vProduto.dataSet.FieldByName('COD_PROD').AsString) +
        ' and pp.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and iif(trim(coalesce(pp.unidade_conv, '''')) <> '''', ' +
        '					trim(coalesce(pp.unidade_conv, '''')), ' +
        '					trim(coalesce(pp.unidade, ''''))) = ' + QuotedStr(trim(vUnidade)) +
        ' and pp.fator_conv > 0 ' +
        ' and ((pp.operacao_conv = ''M'') or (pp.operacao_conv = ''D'')) ', buscas2).IsEmpty then
      begin
      	if (buscas2.FieldByName('operacao').AsString = 'M') and (buscas2.FieldByName('quantidade').AsFloat > 0) then
        	vQuant := RoundTo(vQuant / buscas2.FieldByName('quantidade').AsFloat, - 4)
        else if (buscas2.FieldByName('operacao').AsString = 'D') and (buscas2.FieldByName('quantidade').AsFloat > 0) then
        	vQuant := RoundTo(vQuant * buscas2.FieldByName('quantidade').AsFloat, - 4);
      end;
    end
    else
    begin
    	if not SqlOpen(' select ps.grupo_prod, ps.cod_prod, ps.cod_empresa, ' +
      	' un.fracionado, ' +
      	' ps.unidade, ' +
        ' ps.quantidade, ps.operacao, ps.disponivel_venda, ps.padrao_venda, ' +
        ' pr.unidade as unidade_prod from produtos pr ' +
        ' inner join produtos_conversao_saida ps on ' +
        '   ps.grupo_prod = pr.grupo_prod ' +
        '		and ps.cod_prod = pr.cod_prod ' +
        '   and ps.cod_empresa = pr.cod_empresa ' +
        ' left join unidades un on un.sigla = ps.unidade ' +
        ' where ps.grupo_prod = ' + IntToStr(vProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
        ' and ps.cod_prod = ' + QuotedStr(vProduto.dataSet.FieldByName('COD_PROD').AsString) +
        ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ps.unidade = ' + QuotedStr(trim(vUnidade)) +
        ' and ps.quantidade > 0 ' +
        ' and ((ps.operacao = ''M'') or (ps.operacao = ''D'')) ', buscas2).IsEmpty then
      begin
      	if (buscas2.FieldByName('operacao').AsString = 'M') and (buscas2.FieldByName('quantidade').AsFloat > 0) then
        	vQuant := RoundTo(vQuant / buscas2.FieldByName('quantidade').AsFloat, - 4)
        else if (buscas2.FieldByName('operacao').AsString = 'D') and (buscas2.FieldByName('quantidade').AsFloat > 0) then
        	vQuant := RoundTo(vQuant * buscas2.FieldByName('quantidade').AsFloat, - 4);
      end;
    end;

    //    if vExisteVenda then
    //    begin
    //       if (Trim( vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsString ) <> '') and ( vQuant >  vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsCurrency ) then
    //          raise Exception.Create('A quantidade devolvida não pode ultrapassar a quantidade vendida!');
    //    end;

    if vtipo = '' then
      raiseExceptionCreate('Campo Tipo não informado!', 'Combobox1');

    //    if vCliente.dataSet.FieldByName('cod_cliente').AsString = '' then
    if vCodCliente = '' then
      raiseExceptionCreate('Campo Cliente não informado!', 'Edit3');

    if vcodVendedor < 0 then
      raiseExceptionCreate('Campo Código do Vendedor não informado!', 'Edithw1')
    else if not pesquisaVendedor(vcodVendedor) then
      raiseExceptionCreate('Vendedor não encontrado!', 'Edithw1');

    // verifica se Produto já foi devolvido.
    if vExisteVenda then
    begin
      obDevolucao.First;
      while not obDevolucao.Eof do
      begin
        if (obDevolucao.dataSet.FieldByName('grupo_prod').AsInteger = vPedVendaProd.dataSet.FieldByName('grupo_prod').Asinteger)
          and (trim(obDevolucao.dataSet.FieldByName('cod_prod').asstring) = trim(vPedVendaProd.dataSet.FieldByName('cod_prod').Asstring))
          and (obDevolucao.dataSet.FieldByName('cod_empresa').asinteger = vPedVendaProd.dataSet.FieldByName('cod_empresa').Asinteger)
          and (obDevolucao.dataSet.FieldByName('cod_grade').AsInteger = vPedVendaProd.dataSet.FieldByName('cod_grade').Asinteger)
          and (trim(vUnidade) = trim(vPedVendaProd.dataSet.FieldByName('unidade_conv').AsString)) then
        begin
        	vQtdJaDevEmMemoria := vQtdJaDevEmMemoria + RoundTo(obDevolucao.dataSet.FieldByName('quant').Asfloat, - 4);

          vQtdJaDevEmMemoriaConv := vQtdJaDevEmMemoriaConv + RoundTo(obDevolucao.dataSet.FieldByName('quant_conv').Asfloat, - 4)
        end;
        obDevolucao.Next;
      end;

      if not PesquisaItemDevolvido(vQuant + vQtdJaDevEmMemoria, vQuantConv + vQtdJaDevEmMemoriaConv, vUnidade) then
        if obDevolucao.vQuantidadeJaDevConv > 0 then
          raise Exception.Create(Pchar('A quantidade devolvida do item, ' +
          	'não pode ultrapassar a quantidade existente deste item na venda informada.' + #13 + #13 +
            'PRODUTO' + #13 +
            'Grupo Prod: ' + IntToStr(vProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger) + #13 +
            'Cod Prod: ' + trim(vProduto.dataSet.FieldByName('COD_PROD').AsString) + #13 +
            'Descrição: ' + trim(vProduto.dataSet.FieldByName('DESCR_PROD').AsString) + #13 +
            'Unidade: ' + trim(vUnidade) + #13 + #13 +
            'Obs.: Já foi feita a devolução de ' + FloatToStr(obDevolucao.vQuantidadeJaDevConv) +
            ' item(ns) da venda ' + obDevolucao.vCodVenda + ' anteriormente.'))
        else if obDevolucao.vQuantidadeJaDev > 0 then
          raise Exception.Create(Pchar('A quantidade devolvida do item, ' +
          	'não pode ultrapassar a quantidade existente deste item na venda informada.' + #13 + #13 +
            'PRODUTO' + #13 +
            'Grupo Prod: ' + IntToStr(vProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger) + #13 +
            'Cod Prod: ' + trim(vProduto.dataSet.FieldByName('COD_PROD').AsString) + #13 +
            'Descrição: ' + trim(vProduto.dataSet.FieldByName('DESCR_PROD').AsString) + #13 +
            'Unidade: ' + trim(vUnidade) + #13 + #13 +
            'Obs.: Já foi feita a devolução de ' + FloatToStr(obDevolucao.vQuantidadeJaDev) + ' item(ns) da venda ' + obDevolucao.vCodVenda + ' anteriormente.'))
        else
          raise Exception.Create(Pchar('A quantidade devolvida do item, ' +
          	'não pode ultrapassar a quantidade existente deste item na venda informada.' + #13 + #13 +
            'PRODUTO' + #13 +
            'Grupo Prod: ' + IntToStr(vProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger) + #13 +
            'Cod Prod: ' + trim(vProduto.dataSet.FieldByName('COD_PROD').AsString) + #13 +
            'Descrição: ' + trim(vProduto.dataSet.FieldByName('DESCR_PROD').AsString) + #13 +
            'Unidade: ' + trim(vUnidade)));
    end;

    if vDadosIni.vProgFid.vHabilitarProgFid then
    begin
      if (obDevolucao.dataSet.IsEmpty) and (StrToIntDef(obDevolucao.vCodVenda, 0) <= 0) then
      begin
        if Application.MessageBox('Deseja realizar uma devolução avulsa?',
          'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
          Exit;

        if not vDadosIni.PesqPros('DEV022', 'AVULSA', '', 'DEVOLUCAO',
         obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
        begin
          raiseExceptionCreate('Não é possível realizar devolução avulsa', 'Edit8');
        end;
      end;
    end;

    // Após validar todos os campos vai inserir a devolução e GradeDevolução.
    // Insere a devolução.
    if inherited Insert then
    begin
      if not InserirDevolucao then
        raise Exception.Create('Erro na tentativa de gravar a devolução!')
      else if not inherited Post then
        raise Exception.Create('Erro na tentativa de gravar a devolução!');
    end;

    if vExisteVenda then
      frmDevolucao.Edit8.Enabled := False;

    // Insere a devolução da grade
    if vPossuiGrade then
    begin
      if vDevolucaoGrade.Insert then
      begin
        if not InserirDevolucaoGrade then
          raise Exception.Create('Erro na tentativa de gravar a devolução da grade!')
        else if not vDevolucaoGrade.somentePost then
          raise Exception.Create('Erro na tentativa de gravar a devolução da grade!');
      end;
    end;

  except
    on e: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;

end;

function TDevolucao.TiraEstoqueGradeeProduto: Boolean;
begin
  Result := True;
  buscas.First;
  while not buscas.EOF do
  begin
    {while True do
      //not vDevolucaoGrade.dataSet.EOF do
    begin
      if buscas.FieldByName('cod_grade').Text <> '' then
      begin
        try
          dtmDevolucao.strVoltaGrade.Close;
          dtmDevolucao.StrVoltaGrade.ParamByName('VGRUPO').asinteger := buscas.FieldByName('grupo_prod').asinteger;
          dtmDevolucao.StrVoltaGrade.ParamByName('VCOD_PROD').Text := buscas.FieldByName('cod_prod').Text;
          dtmDevolucao.StrVoltaGrade.ParamByName('QUANT').AsCurrency := buscas.FieldByName('quant').AsCurrency * (-1);
          dtmDevolucao.StrVoltaGrade.ParamByName('COD_EMPRESA').asinteger := strtoint(vDadosIni.codEmpresa);
          dtmDevolucao.StrVoltaGrade.ParamByName('VCOD_GRADE').asinteger := buscas.FieldByName('cod_grade').asinteger;
          dtmDevolucao.StrVoltaGrade.Prepare;
          dtmDevolucao.StrVoltaGrade.ExecProc;
          dtmDevolucao.StrVoltaGrade.CLOSE;
          break;
          //  vDevolucaoGrade.dataSet.Next;
        except
          on E: Exception do
          begin
            Result := False;
            if Application.MessageBox(pchar('Erro na gravação na grade ' + vDevolucaoGrade.dataSet.FieldByName('cod_grade').AsString + ' do Produto ' + vDevolucaoGrade.dataSet.FieldByName('grupo_prod').Text + vDevolucaoGrade.dataSet.FieldByName('cod_prod').Text
              + '.' + #10#13 + 'Mostrar Erro?'), 'Atenção', MB_YESNO) = mrYes then
              Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
            //         Exit;
          end;
        end;
      end
      else
        break;
    end; }

    while true do
    begin
      try
        vMovimentaEstoque.Close;
        vMovimentaEstoque.ParamByName('PGRUPO_PROD').AsInteger := buscas.Fieldbyname('GRUPO_PROD').AsInteger;
        vMovimentaEstoque.ParamByName('PCOD_PROD').AsString := buscas.Fieldbyname('COD_PROD').AsString;
        vMovimentaEstoque.ParamByName('PCOD_EMPRESA').AsInteger := buscas.Fieldbyname('COD_EMPRESA').AsInteger;
        vMovimentaEstoque.ParamByName('PCOD_GRADE').AsInteger := buscas.Fieldbyname('COD_GRADE').AsInteger;
        vMovimentaEstoque.ParamByName('PQTDE_ENTRADA').AsFloat := 0;
        vMovimentaEstoque.ParamByName('PQTDE_SAIDA').AsFloat := buscas.Fieldbyname('QUANT').AsFloat;
        vMovimentaEstoque.ParamByName('PALTDTULTVND').AsInteger := 0;
        vMovimentaEstoque.Prepare;
        vMovimentaEstoque.ExecProc;
//        dtmDevolucao.strVoltaEstoque.Close;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VGRUPO').asinteger := buscas.FieldByName('grupo_prod').asinteger;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VCOD_PROD').Text := buscas.FieldByName('cod_prod').Text;
//        dtmDevolucao.strVoltaEstoque.ParamByName('QUANT').AsCurrency := buscas.FieldByName('quant').AsCurrency * (-1);
//        dtmDevolucao.strVoltaEstoque.ParamByName('VESTM').Value := 0;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VESTS').Value := 0;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VESTC').Value := 0;
//        dtmDevolucao.strVoltaEstoque.ParamByName('VDATA').Value := Now;
//        dtmDevolucao.strVoltaEstoque.ParamByName('COD_EMPRESA').asinteger := strtoint(vDadosIni.codEmpresa);
//        dtmDevolucao.strVoltaEstoque.Prepare;
//        dtmDevolucao.strVoltaEstoque.ExecProc;
//        dtmDevolucao.strVoltaEstoque.Close;

        buscas.Next;
        break; //codigo suspeito de eroro . olhar depois. jp.

      except
        on E: Exception do
        begin
          Result := False;
          if Application.MessageBox(pchar('Erro na Gravação ' + dataSet.FieldByName('num_fab_prod').AsString + ', Mostrar Erro?'), 'Atenção', MB_YESNO) = mrYes then
            Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
          Exit;
        end;
      end;
    end;
  end;

end;

function TDevolucao.selecionaVenda(vtip: integer; vtipovenda: string): Boolean;
var
  variavel: string;
  vflag: integer;
begin
  if vtip = 1 then
  begin
    variavel := '';
    variavel := 'select * from pedvenda ' +
      ' where nped = ' + vCodVenda + ' ' +
      ' and tipo = ' + QuotedStr(vtipovenda) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and (not data_fech is null) ' +
      ' and status_ped = ''FECHADA'' ' +
      ' and ativo = 1 ';
    buscas.Close;
    buscas.sql.text := variavel;
    buscas.open;
    if buscas.IsEmpty then
    begin
      vExisteVenda := false;
      Result := False;
      Application.MessageBox('Venda Não encontrada para este tipo. Verifique o tipo e também se a venda está fechada!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    end
    else
    begin
      vCodCliente := buscas.FieldByName('cod_cliente').AsString;
      vcodVendedor := buscas.FieldByName('cod_vendedor').AsInteger;
      vTipv := buscas.FieldByName('TIPV').AsString;
      if ExecutaComandosSql('select * from tipo_vendas where tipo = ''' + vtipovenda + ''' ' +
        ' and coalesce(sigla,'''') = ' + QuotedStr(trim(vTipv)) + ' and coalesce(venda,'''') <> ''S'' ') then
      begin
        Result := False;
        Application.MessageBox('Pedido de venda informado/selecionado possui tipo de venda que não permite esta forma de devolução.', 'Atenção', MB_ICONINFORMATION + MB_OK);
      end;
    end;
  end
  else
  begin
    variavel := '';
    variavel := 'select * from pedvenda_prod ' +
      ' where nped = ' + vCodVenda +
      ' and tipo = ' + QuotedStr(vtipovenda) +
      ' and grupo_prod = ' + IntToStr(vProduto.dataSet.FieldByName('grupo_prod').AsInteger) +
      ' and cod_prod = ' + QuotedStr(vProduto.dataSet.FieldByName('cod_Prod').AsString) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and (status is null or status = '''') ' +
      ' and ativo = 1 ';

    if vPossuiGrade then
      variavel := variavel + 'and cod_grade = ' + IntToStr(vGrade.dataSet.FieldByName('cod_grade').AsInteger) + ' ';
    vPedVendaProd.montaSelect(variavel);
    if vPedVendaProd.dataSet.IsEmpty then
    begin
      vExisteVenda := false;
      Result := False;
      Application.MessageBox('Item não encontrado para a venda informada ou esta venda não está fechada!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    end
    else if ExecutaComandosSql('select * from tipo_vendas where tipo = ''' + vtipovenda + ''' ' +
      ' and coalesce(sigla,'''') = ' + QuotedStr(trim(vTipv)) + ' and coalesce(venda,'''') <> ''S'' ') then
    begin
      Result := False;
      Application.MessageBox('Pedido de venda informado/selecionado possui tipo de venda que não permite esta forma de devolução.', 'Atenção', MB_ICONINFORMATION + MB_OK);
//      Application.MessageBox('Pedido de venda informado/selecionado possui tipo de venda que não compõe de fato uma venda.', 'Atenção', MB_ICONINFORMATION + MB_OK);
    end
    else
    begin
      if vcodgrade <> 0 then
      begin
        vflag := 0;
        while not vPedVendaProd.eof do
        begin
          if vcodgrade = vPedVendaProd.dataSet.FieldByName('cod_grade').AsInteger then
          begin
            vflag := 1;
            break;
          end;
          vPedVendaProd.next;
        end;
        if vflag = 0 then
          raise Exception.Create('Grade do produto fornecido não é igual ao produto fornecido!')
        else
        begin
          vcodVendedor := vPedVendaProd.dataSet.FieldByName('cod_vendedor').AsInteger;
          vExisteVenda := True;
          Result := True;
        end;
      end
      else
      begin
        vcodVendedor := vPedVendaProd.dataSet.FieldByName('cod_vendedor').AsInteger;
        vExisteVenda := True;
        Result := True;
      end;
    end;
  end;

end;

procedure TDevolucao.SetTextItemDevStringFormatUnConv(Sender: TField;
  const Text: string);
var
  Str: string;
begin
  Sender.AsString := Text;
  if trim(Sender.AsString) = '' then
  	if trim(dataSet.FieldByName('UNIDADE').AsString) <> '' then
  		Sender.AsString := trim(dataSet.FieldByName('UNIDADE').AsString);
end;

procedure TDevolucao.SetTextItemFloatFormat(Sender: TField; const Text: string);
var
  Str: string;
begin
  Str := ReplaceText(Text, ThousandSeparator, '');
  Sender.AsFloat := StrToFloat(Str);
end;

procedure TDevolucao.SetTextItemStringFormatUnConv(Sender: TField;
  const Text: string);
var
  Str: string;
begin
  Sender.AsString := Text;
  if trim(Sender.AsString) = '' then
  	if trim(vPedVendaProd.dataSet.FieldByName('UNIDADE').AsString) <> '' then
  		Sender.AsString := trim(vPedVendaProd.dataSet.FieldByName('UNIDADE').AsString);
end;

function TDevolucao.SomaQtde(Query: TClientDataSet; Campo: string): Real;
var
  Soma: Real;
  Posicao: TBookMark;
begin

  Posicao := Query.GetBookMark;
  Soma := 0;
  Query.First;
  while not Query.EOF do
  begin
    Soma := Soma + Query.FieldByName(Campo).Value;
    Query.Next;
  end;
  Query.GotoBookmark(Posicao);
  Query.FreeBookmark(Posicao);
  Result := Soma;

end;

{ TPedVendaProd_Dev }

constructor TPedVendaProd_Dev.Create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsPedVendaProd);
  buscas := TIBQuery(dtmdevolucao.qrPedVendaProd);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);

  dataSet.OnCalcFields := dataSetCalcFields;
end;

procedure TPedVendaProd_Dev.dataSetCalcFields(DataSet: TDataSet);
begin
	if vDadosIni.vEmp.vCasasDecimais <= 0 then
  	vDadosIni.vEmp.vCasasDecimais := 2;

  if DataSet.FieldByName('QUANT_DEV_ITEM_TEMP').IsNull then
  	DataSet.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat := 0;

	if (trim(DataSet.FieldByName('UNIDADE_CONV').AsString) = '')
    or (trim(DataSet.FieldByName('UNIDADE').AsString) = trim(DataSet.FieldByName('UNIDADE_CONV').AsString)) then
  begin
  	if DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat <= 0 then
  		DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat := RoundTo(
      	DataSet.FieldByName('QUANT_PED_ITEM').AsFloat, - 4);

    if DataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat <= 0 then
    	DataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat := RoundTo(
      	DataSet.FieldByName('VLUN_PED_ITEM').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

  	DataSet.FieldByName('FATOR_CONV_TEMP').AsString := '';
  end
  else
  begin
    if (DataSet.FieldByName('OPERACAO_CONV').AsString = 'M') and (DataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
    begin
    	if DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat <= 0 then
        DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat := RoundTo(
          DataSet.FieldByName('QUANT_PED_ITEM').AsFloat *
            DataSet.FieldByName('FATOR_CONV').AsFloat, - 4);

      if DataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat <= 0 then
        DataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat := RoundTo(
          DataSet.FieldByName('VLUN_PED_ITEM').AsFloat /
            DataSet.FieldByName('FATOR_CONV').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

      DataSet.FieldByName('FATOR_CONV_TEMP').AsString :=
        FloatToStr(RoundTo(1, -4)) + ' ' +
        trim(DataSet.FieldByName('UNIDADE').AsString) + ' = ' +
        FloatToStr(RoundTo(DataSet.FieldByName('FATOR_CONV').AsFloat, -4)) + ' ' +
        trim(DataSet.FieldByName('UNIDADE_CONV').AsString);
    end
    else if (DataSet.FieldByName('OPERACAO_CONV').AsString = 'D') and (DataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
    begin
    	if DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat <= 0 then
        DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat := RoundTo(
          DataSet.FieldByName('QUANT_PED_ITEM').AsFloat /
            DataSet.FieldByName('FATOR_CONV').AsFloat, - 4);

    	if DataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat <= 0 then
        DataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat := RoundTo(
          DataSet.FieldByName('VLUN_PED_ITEM').AsFloat *
            DataSet.FieldByName('FATOR_CONV').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

    	DataSet.FieldByName('FATOR_CONV_TEMP').AsString :=
        FloatToStr(RoundTo(1, -4)) + ' ' +
        trim(DataSet.FieldByName('UNIDADE_CONV').AsString) + ' = ' +
        FloatToStr(RoundTo(DataSet.FieldByName('FATOR_CONV').AsFloat, -4)) + ' ' +
        trim(DataSet.FieldByName('UNIDADE').AsString);
    end
    else
    begin
      if DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat <= 0 then
    		DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat := RoundTo(
        	DataSet.FieldByName('QUANT_PED_ITEM').AsFloat, - 4);

      if DataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat <= 0 then
    		DataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat := RoundTo(
        	DataSet.FieldByName('VLUN_PED_ITEM').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

    	DataSet.FieldByName('FATOR_CONV_TEMP').AsString := '';
    end;
  end;

  DataSet.FieldByName('VLTOT_PED_ITEM_LIQ').AsFloat := RoundTo(
  	DataSet.FieldByName('VLTOT_PED_ITEM').AsFloat
    	+ IfThen(DataSet.FieldByName('RATEIO_ACRESC').AsFloat > 0, DataSet.FieldByName('RATEIO_ACRESC').AsFloat, 0) +
      - IfThen(DataSet.FieldByName('RATEIO_DESC').AsFloat > 0, DataSet.FieldByName('RATEIO_DESC').AsFloat, 0), - 2);

  if DataSet.FieldByName('QUANT_PED_ITEM').AsFloat > 0 then
    DataSet.FieldByName('VLUN_PED_ITEM_LIQ').AsFloat := RoundTo(
      DataSet.FieldByName('VLTOT_PED_ITEM_LIQ').AsFloat / DataSet.FieldByName('QUANT_PED_ITEM').AsFloat, - vDadosIni.vEmp.vCasasDecimais);

  if DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat > 0 then
    DataSet.FieldByName('VLUN_PED_ITEM_CONV_LIQ').AsFloat := RoundTo(
      DataSet.FieldByName('VLTOT_PED_ITEM_LIQ').AsFloat / DataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat, - vDadosIni.vEmp.vCasasDecimais);
end;

procedure TPedVendaProd_Dev._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TPedVendaProd_Dev._marcaDesmarcaLinha;
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

procedure TPedVendaProd_Dev._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TEmpresa_Dev }

constructor TEmpresa_Dev.create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsEmpresa);
  buscas := TIBQuery(dtmdevolucao.qrEmpresa);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
end;

{ TProduto_Dev }

function TProduto_Dev.cancel: Boolean;
begin
  inherited Cancel;
  RollBackTransacao;
end;

constructor TProduto_Dev.create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsProduto);
  buscas := TIBQuery(dtmdevolucao.qrProduto);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
end;

function TProduto_Dev.post: Boolean;
begin
  try
    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    if Apply then
    begin
      //      CommitaTransacao;
    end
    else
    begin
      //      Cancel;
      //      RollBackTransacao;
      Result := False;
    end;
    Refresh;
  except
    on e: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TGrade_Dev }

function TGrade_Dev.cancel: Boolean;
begin
  try
    inherited Cancel;
    RollBackTransacao;
    Result := True;
  except
    Result := False;
  end;
end;

constructor TGrade_Dev.create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsGrade);
  buscas := TIBQuery(dtmdevolucao.qrGrade);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
end;

function TGrade_Dev.post: Boolean;
begin
  try
    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    if Apply then
    begin
      //      CommitaTransacao;
    end
    else
    begin
      //      Cancel;
      //      RollBackTransacao;
      Result := False;
    end;
    Refresh;
  except
    on e: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;

end;

function TGrade_Dev.somentePost: Boolean;
begin
  Result := False;
  if inherited Post then
    Result := True;
end;

{ TDevolucaoGrade_Dev }

function TDevolucaoGrade_Dev.abreDevolucaoGrade: Boolean;
begin
  Result := montaSelect('select * from DEVOLUCAO_GRADE ' +
    'where cod_empresa = ' + vDadosIni.codEmpresa + ' ' +
    'and COD_DEVOLUCAO = 0 ' +
    'and ativo = 1 ');
end;

function TDevolucaoGrade_Dev.cancel: Boolean;
begin
  inherited Cancel;
  RollBackTransacao;
end;

constructor TDevolucaoGrade_Dev.create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsDevolGrade);
  buscas := TIBQuery(dtmdevolucao.qrDevolGrade);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
end;

function TDevolucaoGrade_Dev.delete: Boolean;
begin
  if inherited Delete then
    Result := True
  else
    Result := False;

end;

function TDevolucaoGrade_Dev.insert: Boolean;
begin
  Result := False;
  if not dataSet.Active then
    montaSelect('select * from DEVOLUCAO_GRADE ' +
      'where cod_empresa = ' + vDadosIni.codEmpresa + ' ' +
      'and COD_DEVOLUCAO = 0 ' +
      'and ativo = 1 ');

  if inherited Insert then
    result := True;
end;

function TDevolucaoGrade_Dev.post: Boolean;
begin
  try
    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    if Apply then
    begin
      //      CommitaTransacao;
    end
    else
    begin
      //      Cancel;
      //      RollBackTransacao;
      Result := False;
    end;
    Refresh;
  except
    on e: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TDevolucaoGrade_Dev.somentePost: Boolean;
begin
  Result := False;
  if inherited Post then
    Result := True;
end;

{ TRecibo_Dev }

function TRecibo_Dev.abreRecibo: Boolean;
begin
  result := montaSelect('select * from recibos where STATUS_REC IS NULL ' +
    'and cod_empresa = ' + vDadosIni.codEmpresa + ' ' +
    'and ativo = 1 ' +
    'and nrecibo = 0 ');
end;

function TRecibo_Dev.cancel: Boolean;
begin
  inherited Cancel;
  RollBackTransacao;
end;

constructor TRecibo_Dev.create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsRecibo);
  buscas := TIBQuery(dtmdevolucao.qrRecibo);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
end;

function TRecibo_Dev.insert: Boolean;
begin
  Result := False;
  montaSelect('select * from RECIBOS where nrecibo = 0 and cod_empresa = %s', [vDadosIni.codEmpresa]);

  if inherited Insert then
    result := True;

end;

function TRecibo_Dev.post: Boolean;
begin

  try
    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    if Apply then
    begin
      //      CommitaTransacao;
    end
    else
    begin
      //      Cancel;
      //      RollBackTransacao;
      Result := False;
    end;
    Refresh;
  except
    on e: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TRecibo_Dev.somentePost: Boolean;
begin
  Result := False;
  if inherited Post then
    Result := True;
end;

{ TCliente_Dev }

constructor TCliente_Dev.create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsClientes);
  buscas := TIBQuery(dtmdevolucao.qrClientes);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
end;

{ TVendedor_Dev }

constructor TVendedor_Dev.create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsVendedor);
  buscas := TIBQuery(dtmdevolucao.qrVendedor);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
end;

{ TPedvenda_Dev }

constructor TPedvenda_Dev.create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsPedvenda);
  buscas := TIBQuery(dtmdevolucao.qrPedvenda);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
end;

{ TNf_Dev }

constructor TNf_Dev.create;
begin
  dataSet := TClientDataSet(dtmdevolucao.cdsNF);
  buscas := TIBQuery(dtmdevolucao.qrNF);
  transacao := TIBTransaction(dtmdevolucao.IbTransDevolucao);
end;

end.

