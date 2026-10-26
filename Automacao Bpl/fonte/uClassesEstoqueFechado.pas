unit uClassesEstoqueFechado;

interface

uses
  uDataSet_OOP, uDtmAtivo, Db, Windows, Forms, Controls, RDPrint,
  UClassesPedVenda, IBQuery, QuickRpt, DBClient;

type
  TEstoqueFechado = class;
  TVendedorControlePecas = class;
  TClienteControlePecas = class;
  TProdutoConsulta = class;
  TMecanicoControlePecas = class;
  TCondPagamentoPecas = class;
  TTipoVendaControlePecas = class;
  TCodBarraConsulta = class;
  TReserva = class;
  TReservaItens = class;

  TGenerico = class(TDataSet_OOP)
  protected
    vSing: TSing;
  end;

  TReserva = class(TDataset_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function _abreFormReserva(pCodVendedor: Integer; datasetAlmox: TClientDataSet): boolean;
    function _abreFormEscolhaReserva(pCodVendedor: Integer; datasetAlmox: TClientDataSet): boolean;
    function _abreFormReservaExistentes: boolean;
    function _abreReservas(pCodVendedor: Integer): Boolean;
    procedure datasetReservaItensAfterScroll(DataSet: TDataSet);
  var
    ReservaItens: TReservaItens;
  end;

  TReservaItens = class(TDataset_OOP)
  private
  public
    dtSet: TClientDataSet;
    dtSource: TDataSource;
    dtSetAlmox: TClientDataSet;
    dtAlmoxSource: TDataSource;
    fTempProdutos: TClientDataSet;
    fTempVendedor: TClientDataSet;
    constructor create;
    destructor destroy; override;
    function _abreReservasItens(pCodigo: Integer): Boolean;
    function post: boolean; override;
    function Insert(reserva: TReserva): boolean;
    function edit: boolean;// override;
    function Delete: boolean; override;
    function AddItemReserva(reserva: TReserva): boolean;
    function RemoverItemReserva(reserva: TReserva): boolean;
    function LocalizarProduto(pQuantTotal, pQuantAlmox: Double): boolean;
    procedure _marcaDesmarcaLinha(dtTemp: TClientDataSet);
    procedure _marcarTodos(dtTemp: TClientDataSet);
    procedure _desmarcarTodos(dtTemp: TClientDataSet);
    function verificarRegistrodtSetAlmox: boolean;
    function verificarRegistrodtSet: boolean;
    function _alterarItemReserva: boolean;
    function LiberarTravaVenda: boolean;
    function _getDisponibilidadeReserva(pCodVendedor, pGrupoProd: Integer; pCodProd: string; pCodGrade: Integer; pEstDisp, pQuant: Double; pOrdem: Integer = 0): Double;
    procedure _verificarPendencias(pGrupoProd: Integer = 0; pCodProd: String = '');
  end;

  TEstoqueFechado = class(TDataSet_OOP)
  private
    vRel: TQuickRep;
    relMovProd, relRelacAtend: TIBQuery;
    procedure PreviewRelatorio(Sender: TObject);
    function relatorioRelacaoAtendimentos: boolean;
    function relatorioMovimendoDeProdutos: boolean;
    function rdprint_relatorioMovimendoDeProdutos: boolean;
    procedure bandaMovDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  public
    vSing: TSing;
    constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function InserirPeca: boolean;
    function DevolverItem: boolean;
    function Delete: boolean;
    function ConfAtendimento: boolean;
    function ConfDevolucao: Boolean;
    function RemoverItem: boolean; // override;
    procedure _ControleVendedor(pTipoForm: Integer);
    procedure _ControleAlmoxarifado(pTipoForm: Integer);
    function _mdiAberto(pNomeFormMDI: string): Boolean;
    function _abreEstF(pCodigo, pNitem: Integer): Boolean;
    function _abrecontroleVendedor(pcod_vendedor: Integer): Boolean;
    function _abrecontroleAlmoxarifado(pcod_vendedor: Integer; psit_atd: string; tipo: string = ''): Boolean;
    procedure _marcaDesmarcaLinha;
    function _abrirVenda: boolean;
    function _selecionarItensControledePecas: boolean;
    function relatorio: boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaLinha;
    procedure _desmarcaLinha;
    procedure _efetuarSoma;
    procedure _obterCasasDecimais;
    function _verificaSelecao: boolean;
    function imprimirSolOS(rdSol: TRdPrint): boolean;
    function NItem(vCodpedido: Integer): boolean;
    function _existeProduto(vValorConsulta: string): Boolean;
    function _existeDAV: boolean;
    function _abreFormAlmoxarifadoOrdenarRel: boolean;
    function AbrirCliente(codcli: string): boolean;
    function verificarPendencia: boolean;
    function verPendenciaEstFech(pCodvend: integer; pTipvAtacVarejo: string): boolean;
    function LiberarTravaVenda: boolean;
  var
    vPedvenda: TPedVenda;
    vCasasDecimais: string;
    vNitem: Integer;
    Produto: TProdutoConsulta;
    CodBarra: TCodBarraConsulta;
    Reserva: TReserva;
    vCodClientePedidos: string;
    vQuantClientePedidos: Integer;
  end;

  TVendedorControlePecas = class(TDataset_OOP)
  private

  public
    constructor create;
    function _abreTodosVendedor: Boolean;
  end;

  TClienteControlePecas = class(TDataset_OOP)
  private

  public
    constructor create;
    function _abreCliente(cod: integer): Boolean;
  end;

  TMecanicoControlePecas = class(TDataset_OOP)
  private

  public
    constructor create;
    function _abreMecanico(pCodMecanico: Integer): Boolean;
  end;

  TCondPagamentoPecas = class(TDataset_OOP)
  private

  public
    constructor create;
    function _abreTodosCondPagamento: Boolean;
  end;

  TTipoVendaControlePecas = class(TDataset_OOP)
  private

  public
    constructor create;
    function _abreTodosTipoVenda: Boolean;
  end;

  TProdutoConsulta = class(TDataSet_OOP)
  private
    fCamposProduto: string;
    fConsultaAdicional: string;
  public
    pNumFab: string;
    pQuant: Double;
    constructor create;
    function _buscaProduto(pValorConsulta: string; pShowErro: Boolean = False): Boolean;
    function _selecionaProdutosInnerCodBarra(pValorConsulta: string): Boolean;
    function _selecionaProdutos(pGrupoProd: Integer; pCodProd: string): Boolean;
    function _verificarSinal(codBarra: string): Boolean;
  end;

  TCodBarraConsulta = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaProduto(pCodBarra: string): boolean;
  end;

var
  EstoqueFechado: TEstoqueFechado;
  Usuario: TVendedorControlePecas;
  Mecanico: TMecanicoControlePecas;
  Cliente: TClienteControlePecas;
  CondPagamento: TCondPagamentoPecas;
  TipoVenda: TTipoVendaControlePecas;

implementation

uses
  IBDatabase, IBStoredProc, SysUtils, Classes, DateUtils, StdCtrls, uDtmEstoqueFechado,
  uCadPedVenda, uPadrao, UControleAlmoxarifado, uDtmPedVenda, uDadosIni,
  funcoes, Dialogs, Variants;

{ TEstoqueFechado }

function TEstoqueFechado._abrirVenda: boolean;
//var
//  formulario: TForm;
//  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'CONTROLE_ALMOXARIFADO| ' + dataSet.FieldByName('COD_PEDIDO').AsString + '|' + dataSet.FieldByName('COD_VENDEDOR').AsString;

  TPedVenda.cadTransfEstF;
//  formulario := Funcoes.AbreForm('pkPedidoVenda', 'TFrmCadPedVendaEST', hdTemp);
//
//  try
//    formulario.ShowModal;
//  finally
//    vDadosIni.vPesquisa := '';
//    formulario.Free;
//    unLoadPackage(hdTemp);
//  end;
end;

function TEstoqueFechado.AbrirCliente(codcli: string): boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'CLIENTE| ' + codcli;

  formulario := Funcoes.AbreForm('pkClientes', 'TfrmCadClientes', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TEstoqueFechado.bandaMovDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if frmControleAlmoxarifado = nil then
    Exit;
  frmControleAlmoxarifado.qrlEstAt.caption := Format('%8.2f', [relMovProd.FieldByName('est_f').AsFloat +
    relMovProd.FieldByName('est_r').AsFloat - relMovProd.FieldByName('pend').AsFloat]);
end;

function TEstoqueFechado.ConfAtendimento: boolean;
var
  vOutros, vTemp: string;
  vQuantRest, vQuantConf: Double;
begin
  Result := False;

  if dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('VND150', 'CONF ATENDIMENTO',
    'GRUPO_PROD ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
    ' - COD_PROD ' + trim(dataSet.FieldByName('COD_PROD').AsString),
    'CONTROLE_ALMOXARIFADO', '', buscas, true) then
    Exit;

  if dataSet.FieldByName('SIT_ATD').AsString <> 'NT' then
  begin
    Application.MessageBox('Este Item não pode ser atendido!', 'Atenção', MB_OK);
    exit;
  end;

  buscas.Close;
  buscas.SQL.Text := ' SELECT SIT_ATD FROM CONTROLE_ALMOXARIFADO ' +
   ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA';
  buscas.ParamByName('COD_PEDIDO').AsInteger := dataSet.FieldByName('COD_PEDIDO').AsInteger;
  buscas.ParamByName('NITEM').AsInteger := dataSet.FieldByName('NITEM').AsInteger;
  buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
  buscas.Open;

  if buscas.FieldByName('SIT_ATD').AsString <> 'NT' then
  begin
    Application.MessageBox('Este Item não pode ser atendido!' + #13+'Aperte F5 para atualizar!', 'Atenção', MB_OK);
    exit;
  end;

  try
    vTemp := dataSet.FieldByName('QUANT').AsString;
    if not InputQuery('Informe um Valor', 'Informe a quantidade que deseja confirmar:', vTemp) then
      exit;

    vQuantConf := StrToFloat(vTemp);

    vOutros := ' - COD. VEND:' + dataSet.FieldByName('COD_VENDEDOR').AsString
      + ' - GRUPO_PROD ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger)
      + ' - COD_PROD ' + Trim(dataSet.FieldByName('COD_PROD').AsString)
      + ' - QTD SOLIC: ' + dataSet.FieldByName('QUANT').AsString
      + ' - COD. ALMOX:' + IntToStr(vDadosIni.vCodUsuario)
      + ' - QTD CONF:' + vTemp;
    vQuantRest := dataSet.FieldByName('QUANT').AsFloat - vQuantConf;
  except
    Application.MessageBox('Quantidade incorreta!', 'Atenção', 0 + 64);
    Exit;
  end;

  if (vQuantConf > 0) and (vQuantConf > dataSet.FieldByName('QUANT').AsFloat) then
  begin
    Application.MessageBox('Quantidade Confirmada não pode ser maior que quantidade requisitada pelo Vendedor!', 'Atenção', MB_OK);
    exit;
  end
  else if (vQuantConf <= 0) then
  begin
    Application.MessageBox('Quantidade informada deve ser maior do que 0!', 'Atenção', MB_OK);
    exit;
  end;
  IniciaTransacao;
  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('COD_VENDEDOR1').AsInteger :=
      vDadosIni.vCodUsuario;
    dataSet.FieldByName('DATA_ATD').AsString :=
      FormatDateTime(ShortDateFormat, vDadosIni.getDataHoraBanco(dtmEstoqueFechado.qrBuscas));
    dataSet.FieldByName('HORA_ATD').AsString :=
      FormatDateTime(ShortTimeFormat, vDadosIni.getDataHoraBanco(dtmEstoqueFechado.qrBuscas));
    dataSet.FieldByName('SIT_ATD').AsString := 'AT';
    dataSet.FieldByName('QUANT').AsFloat := vQuantConf;
    dataSet.FieldByName('VLTOT').AsFloat := vQuantConf * dataSet.FieldByName('VLUN').AsFloat;


    if vQuantRest > 0 then
    begin
      NItem(dataSet.FieldByName('COD_PEDIDO').AsInteger);
      buscas.Close;
      buscas.SQL.Text := 'insert into controle_almoxarifado (controle_almoxarifado.cod_pedido, controle_almoxarifado.nitem,'
        + ' controle_almoxarifado.cod_empresa,  controle_almoxarifado.tipv, controle_almoxarifado.cod_cond_pag, '
        + ' controle_almoxarifado.cod_vendedor, controle_almoxarifado.grupo_prod, controle_almoxarifado.cod_prod, '
        + ' controle_almoxarifado.num_fab_prod, controle_almoxarifado.quant, controle_almoxarifado.vlun, '
        + ' controle_almoxarifado.vltot, controle_almoxarifado.cod_grade, '
        + ' controle_almoxarifado.codigo_nop, controle_almoxarifado.sit_atd, controle_almoxarifado.descr_prod, '
        + ' controle_almoxarifado.data_pedido, controle_almoxarifado.hora_pedido)'
        + ' values (:cod_pedido, :nitem, :cod_empresa, :tipv, :cod_cond_pag, :cod_vendedor, :grupo_prod, :cod_prod, '
        + ' :num_fab_prod, :quant, :vlun, :vltot, :cod_grade, :codigo_nop, :sit_atd, :descr_prod, :data_pedido, :hora_pedido)';
      buscas.ParamByName('COD_PEDIDO').AsInteger := dataSet.FieldByName('COD_PEDIDO').AsInteger;
      buscas.ParamByName('NITEM').AsInteger := vNitem + 1;
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ParamByName('TIPV').AsString := dataSet.FieldByName('TIPV').AsString;
      buscas.ParamByName('COD_COND_PAG').AsInteger := dataSet.FieldByName('COD_COND_PAG').AsInteger;
      buscas.ParamByName('COD_VENDEDOR').AsInteger := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
      buscas.ParamByName('GRUPO_PROD').AsInteger := dataSet.FieldByName('GRUPO_PROD').AsInteger;
      buscas.ParamByName('COD_PROD').AsString := dataSet.FieldByName('COD_PROD').AsString;
      buscas.ParamByName('NUM_FAB_PROD').AsString := dataSet.FieldByName('NUM_FAB_PROD').AsString;
      buscas.ParamByName('QUANT').AsFloat := vQuantRest;
      buscas.ParamByName('VLUN').AsFloat := dataSet.FieldByName('VLUN').AsFloat;
      buscas.ParamByName('VLTOT').AsFloat := vQuantRest * dataSet.FieldByName('VLUN').AsFloat;
      buscas.ParamByName('COD_GRADE').AsInteger := dataSet.FieldByName('COD_GRADE').AsInteger;
      buscas.ParamByName('CODIGO_NOP').AsFloat := dataSet.FieldByName('CODIGO_NOP').AsFloat;
      buscas.ParamByName('SIT_ATD').AsString := 'NT';
      buscas.ParamByName('DESCR_PROD').AsString := dataSet.FieldByName('DESCR_PROD').AsString;
      buscas.ParamByName('DATA_PEDIDO').AsString := dataSet.FieldByName('DATA_PEDIDO').AsString;
      buscas.ParamByName('HORA_PEDIDO').AsString := dataSet.FieldByName('HORA_PEDIDO').AsString;
      buscas.ExecSQL;
    end;
    Result := inherited post;
    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VND150', 'EDITAR', 'SUCESSO' + vOutros, 'CONTROLE_ALMOXARIFADO',
        dataSet.FieldByName('COD_PEDIDO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VND150', 'EDITAR', 'FALHA' + vOutros, 'CONTROLE_ALMOXARIFADO',
        dataSet.FieldByName('COD_PEDIDO').AsString, buscas);
    if Result then
      Refresh;
  end;
end;

function TEstoqueFechado.ConfDevolucao: Boolean;
var
  vCodFormula, vTemp, vOutros, vquantRest, vquantDEV: string;
  vTempDev: Double;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('VND151', 'CONF. DEVOLUCAO',
   'GRUPO_PROD ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
   ' - COD_PROD ' + trim(dataSet.FieldByName('COD_PROD').AsString), 'CONTROLE_ALMOXARIFADO',
   dataSet.FieldByName('COD_PEDIDO').AsString, buscas, true) then
   Exit;

  vCodFormula := dataSet.FieldByName('COD_PEDIDO').AsString;

  if dataSet.FieldByName('SIT_ATD').AsString <> 'DV' then
  begin
    Application.MessageBox('Não pode ser confirmado a devolução, pois ainda não foi devolvido!', 'Atenção', MB_OK);
    exit;
  end;

  buscas.Close;
  buscas.SQL.Text := ' SELECT SIT_ATD FROM CONTROLE_ALMOXARIFADO ' +
   ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA';
  buscas.ParamByName('COD_PEDIDO').AsInteger := dataSet.FieldByName('COD_PEDIDO').AsInteger;
  buscas.ParamByName('NITEM').AsInteger := dataSet.FieldByName('NITEM').AsInteger;
  buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
  buscas.Open;

  if buscas.FieldByName('SIT_ATD').AsString <> 'DV' then
  begin
    Application.MessageBox('Não pode ser confirmado a devolução, pois ainda não foi devolvido!' + #13+'Aperte F5 para atualizar!', 'Atenção', MB_OK);
    exit;
  end;

  try
    vTemp := dataSet.FieldByName('QUANT').AsString;
    if not InputQuery('Informe um Valor', 'Informe a quantidade que deseja devolver:', vTemp) then
      exit;

    vTempDev := StrToFloat(vTemp);
    vquantRest := FloatToStr(dataSet.FieldByName('QUANT').AsFloat - vTempDev);
    vquantRest := StringReplace(vquantRest, ',', '.', [rfReplaceAll]);
    vquantDEV := vTemp;
    vquantDEV := StringReplace(vquantDEV, ',', '.', [rfReplaceAll]);
    vOutros := ' - COD. VEND:' + dataSet.FieldByName('COD_VENDEDOR').AsString
      + ' - GRUPO_PROD ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger)
      + ' - COD_PROD ' + Trim(dataSet.FieldByName('COD_PROD').AsString)
      + ' - COD. ALMOX:' + dataSet.FieldByName('COD_VENDEDOR1').AsString
      + ' - QTD DEV: ' + vquantDEV + ', Qtd Rest:' + vquantRest;
  except
    Application.MessageBox('Quantidade incorreta!', 'Atenção', 0 + 64);
    Exit;
  end;

  if (vTempDev > 0) and (vTempDev = dataSet.FieldByName('QUANT').AsFloat) then
  begin
    buscas.Close;
    buscas.SQL.Text := ' delete from controle_almoxarifado where '
      + ' cod_pedido = ' + IntToStr(dataSet.FieldByName('COD_PEDIDO').AsInteger)
      + ' and nitem = ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger)
      + ' and sit_atd = ''DV''  and cod_empresa = ' + vDadosIni.codEmpresa;
  end
  else if (vTempDev > 0) and (vTempDev < dataSet.FieldByName('QUANT').AsFloat) then
  begin
    buscas.Close;
    buscas.SQL.Text := ' update controle_almoxarifado set quant =' + vquantRest + ', sit_atd = ''AT'''
      + ' where cod_pedido = ' + IntToStr(dataSet.FieldByName('COD_PEDIDO').AsInteger)
      + ' and nitem = ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger)
      + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  end
  else if (vTempDev > 0) and (vTempDev > dataSet.FieldByName('QUANT').AsFloat) then
  begin
    Application.MessageBox('Quantidade requisitada não pode ser maior que quantidade devolvida!', 'Atenção', MB_OK);
    exit;
  end
  else
  begin
    Application.MessageBox('Quantidade informada deve ser maior do que 0!', 'Atenção', MB_OK);
    exit;
  end;

  try
    buscas.ExecSQL;

    CommitaTransacao;
    vDadosIni.GravaAuditoria('VND151', 'CONF. DEVOLUCAO', 'SUCESSO ' + vOutros, 'CONTROLE_ALMOXARIFADO', vCodFormula, buscas);
  except
    RollBackTransacao;
    vDadosIni.GravaAuditoria('VND151', 'CONF. DEVOLUCAO', 'FALHA ' + vOutros, 'CONTROLE_ALMOXARIFADO', vCodFormula, buscas);
  end;

  Result := true;
  Refresh;

end;

constructor TEstoqueFechado.create;
begin
  if dtmEstoqueFechado = nil then
    dtmEstoqueFechado := TdtmEstoqueFechado.Create(dtmEstoqueFechado);
  if dtmPedVenda = nil then
  	dtmPedVenda := TdtmPedVenda.Create(dtmPedVenda);

  dataSet := TClientDataSet(dtmEstoqueFechado.cdsEstoqueFechado);
  buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);

  vPedvenda := TPedVenda.create(dtmPedVenda);
  vPedvenda.dataSet := TClientDataSet(DtmPedVenda.cdsPedVenda);
  vPedvenda.transacao := TIBTransaction(DtmPedVenda.IBTransPedVenda);
  vPedvenda.vItProd.dataSet := TClientDataSet(DtmPedVenda.cdsItemProd);
  vPedvenda.vItProd.transacao := TIBTransaction(DtmPedVenda.IBTransPedVenda);
  vPedvenda.vColab.dataSet := TClientDataSet(DtmPedVenda.cdsColaborador);
  vPedvenda.vItProd.vProduto.dataSet := TClientDataSet(DtmPedVenda.cdsprod);

  vSing := TSing.Create;
  Produto := TProdutoConsulta.create;
  CodBarra := TCodBarraConsulta.create;
  Usuario := TVendedorControlePecas.create;
  Mecanico := TMecanicoControlePecas.create;
  Cliente := TClienteControlePecas.create;
  CondPagamento := TCondPagamentoPecas.create;
  TipoVenda := TTipoVendaControlePecas.create;
  Reserva := TReserva.create;
end;

function TEstoqueFechado.RemoverItem: boolean;
var
  vCodFormula, vOutros, vQuant: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('VND144', 'REMOVER ITEM',
    'GRUPO_PROD ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
    ' - COD_PROD ' + trim(dataSet.FieldByName('COD_PROD').AsString),
    'CONTROLE_ALMOXARIFADO', dataSet.FieldByName('COD_PEDIDO').AsString, buscas, true) then
      Exit;

  vCodFormula := dataSet.FieldByName('COD_PEDIDO').AsString;
  vQuant := StringReplace(dataSet.FieldByName('QUANT').AsString, ',', '.', [rfReplaceAll]);

  vOutros := ' - COD. VEND:' + dataSet.FieldByName('COD_VENDEDOR').AsString
    + ' - GRUPO_PROD ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger)
    + ' - COD_PROD ' + Trim(dataSet.FieldByName('COD_PROD').AsString)
    + ' - QTD REMOV: ' + vQuant;

  if dataSet.FieldByName('SIT_ATD').AsString = 'AT' then
  begin
    Application.MessageBox('Produto atendido, ao invés de remover, o devolva!', 'Atenção', MB_OK);
    exit;
  end;

  if dataSet.FieldByName('SIT_ATD').AsString = 'DV' then
  begin
    Application.MessageBox('Produto já devolvido não é possível remover!', 'Atenção', MB_OK);
    exit;
  end;

  buscas.Close;
  buscas.SQL.Text := ' SELECT SIT_ATD FROM CONTROLE_ALMOXARIFADO ' +
   ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA';
  buscas.ParamByName('COD_PEDIDO').AsInteger := dataSet.FieldByName('COD_PEDIDO').AsInteger;
  buscas.ParamByName('NITEM').AsInteger := dataSet.FieldByName('NITEM').AsInteger;
  buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
  buscas.Open;

  if (buscas.FieldByName('SIT_ATD').AsString = 'AT') or (buscas.FieldByName('SIT_ATD').AsString = 'DV') then
  begin
   if (buscas.FieldByName('SIT_ATD').AsString = 'AT') then
     Application.MessageBox('Produto atendido, ao invés de remover, o devolva!' + #13+'Aperte F5 para atualizar!', 'Atenção', MB_OK)
   else
     Application.MessageBox('Produto já devolvido não é possível remover!' + #13+'Aperte F5 para atualizar!', 'Atenção', MB_OK);
   exit;
  end;

  if Application.MessageBox('Tem certeza que deseja remover este item?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'delete from controle_almoxarifado where '
    + ' cod_pedido = ' + IntToStr(dataSet.FieldByName('COD_PEDIDO').AsInteger)
    + ' and nitem = ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger)
    + ' and cod_empresa = ' + vDadosIni.codEmpresa;

  try
    buscas.ExecSQL;

    CommitaTransacao;
    vDadosIni.GravaAuditoria('VND144', 'REMOVER ITEM', 'SUCESSO' + vOutros, 'CONTROLE_ALMOXARIFADO', vCodFormula, buscas);
  except
    RollBackTransacao;
    vDadosIni.GravaAuditoria('VND144', 'REMOVER ITEM', 'FALHA' + vOutros, 'CONTROLE_ALMOXARIFADO', vCodFormula, buscas);
  end;

  Result := true;
  Refresh;

end;

function TEstoqueFechado.verificarPendencia: boolean;
var
 vdias: Integer;
begin
  result := true;

  if trim(vDadosIni.vusardtvervnd) = '' then
   exit;

  buscas.Close;
  buscas.SQL.Text := 'select * from REGRAS_TRAVOSREQ ' +
   ' where tipo = ''ESF''  and tipv = :tipv ' +
   ' and cod_empresa = :cod_empresa and ativo = 1';
  buscas.ParamByName('TIPV').AsString := dataSet.FieldByName('TIPV').AsString;
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa); 
  buscas.Open;
  if not buscas.IsEmpty then
    vdias := buscas.fieldbyname('QTDE_DIAS').AsInteger
  else
    vdias := 0;

  if ((dataSet.FieldByName('DATA_LIBTRAVA').AsDateTime >= StrToDateTime(vDadosIni.vusardtvervnd))
   and (dataSet.FieldByName('DATA_LIBTRAVA').AsDateTime <= (vDadosIni.getDataBanco(buscas) - vdias - 1))) then
  begin
     Result := False;

     if Application.MessageBox(Pchar('Mercadoria pendente no estoque fechado entre os dias ' +
      vDadosIni.vusardtvervnd + ' e ' + FormatDateTime('dd/mm/yyyy', vDadosIni.getDataBanco(buscas) - vdias - 1) + ' ' + #13 +
      'Grupo ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
      ' Código ' + trim(dataSet.FieldByName('COD_PROD').AsString) +
      ' Num Fab ' + trim(dataSet.FieldByName('NUM_FAB_PROD').AsString) +
      ' Quant ' + FloatToStr(dataSet.FieldByName('QUANT').AsFloat) + #13 + #13 +
      'Deseja continuar assim mesmo? '),
      'Liberar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
      	Exit;

     if not vDadosIni.PesqPros('VND219', 'LIBERAR',
      'Grupo ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
      ' Código ' + trim(dataSet.FieldByName('COD_PROD').AsString) +
      ' Num Fab ' + trim(dataSet.FieldByName('NUM_FAB_PROD').AsString) +
      ' Quant ' + FloatToStr(dataSet.FieldByName('QUANT').AsFloat), 
      'CONTROLE_ALMOXARIFADO', dataSet.FieldByName('COD_PEDIDO').AsString, buscas, true) then
      	Exit;

      Result := True;
  end;
end;

function TEstoqueFechado.verPendenciaEstFech(pCodvend: integer;
  pTipvAtacVarejo: string): boolean;
var
  vnivelus, vdias, vdiasR: integer;
  vossprob: AnsiString;
  vEstF, vReserva, vPend: boolean;
  buscas2: TIBQuery;
begin
  result := true;

  if trim(vDadosIni.vusardtvervnd) = '' then
   exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas.Close;
  buscas.SQL.Text := 'select * from REGRAS_TRAVOSREQ ' +
   ' where tipo = ''ESF''  and tipv = ' +  QuotedStr(pTipvAtacVarejo) +
   ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    vdias := buscas.fieldbyname('QTDE_DIAS').AsInteger;
    vdiasR := buscas.fieldbyname('QTDE_DIAS_RES').AsInteger;
    vnivelus := buscas.fieldbyname('NIVEL_US').AsInteger;
  end
  else
  begin
    vdias := 0;
    vdiasR := 0;
    vnivelus := 0;
  end;

  buscas.Close;
  buscas.sql.text := ' SELECT ''ESTF'' TIPO, COD_PEDIDO, NITEM, GRUPO_PROD, COD_PROD, NUM_FAB_PROD, COD_RESERVA FROM CONTROLE_ALMOXARIFADO ' +
    ' WHERE COD_VENDEDOR = ' + inttostr(pCodvend) + ' AND TIPV = ' + QuotedStr(pTipvAtacVarejo) +
    ' AND (DATA_LIBTRAVA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(vDadosIni.vusardtvervnd))) +
    ' AND DATA_LIBTRAVA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.getDataBanco(buscas2) - vdias - 1)) + ' ) ' +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND (COALESCE(COD_RESERVA, 0) <= 0) ';
  buscas.sql.text := buscas.sql.text + ' UNION  ' +
    ' SELECT ''ESTP'' TIPO, COD_PEDIDO, NITEM, GRUPO_PROD, COD_PROD, NUM_FAB_PROD, COD_RESERVA FROM CONTROLE_ALMOXARIFADO ' +
    ' WHERE COD_VENDEDOR = ' + inttostr(pCodvend) + ' AND TIPV = ' + QuotedStr(pTipvAtacVarejo) +
    ' AND (DATA_LIBTRAVA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(vDadosIni.vusardtvervnd))) +
    ' AND DATA_LIBTRAVA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.getDataBanco(buscas2) - vdiasR - 1)) + ' ) ' +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND (COALESCE(COD_RESERVA, 0) > 0) ' +
    ' UNION ' +
    ' SELECT ''PEND'' TIPO, 0 COD_PEDIDO, NITEM, GRUPO_PROD, COD_PROD, NUM_FAB_PROD, CODIGO FROM RESERVA_ALMOXARIFADO_ITENS ' +
    ' WHERE COD_VENDEDOR = ' + inttostr(pCodvend) + ' AND TIPV = ' + QuotedStr(pTipvAtacVarejo) +
    ' AND (DATA_VER >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(vDadosIni.vusardtvervnd))) +
    ' AND DATA_VER <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.getDataBanco(buscas2) - vdiasR - 1)) + ' ) ' +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' ORDER BY 1 ';
  buscas.open;
  buscas.FetchAll;
  
  vossprob := '';
  vEstF := false;
  vReserva := false;
  vPend := false;
  buscas.First;
  while not buscas.Eof do
  begin
    if not vEstF then
    begin
      vEstF := trim(buscas.FieldByName('TIPO').AsString) = 'ESTF';
      if vEstF then
      begin
        if trim(vossprob) <> '' then
          vossprob := vossprob + #13;
        vossprob := vossprob + 'Esse Vendedor tem mercadorias pendentes no estoque fechado entre os dias '
          + vDadosIni.vusardtvervnd + ' e ' + FormatDateTime('dd/mm/yyyy', vDadosIni.getDataBanco(buscas2) - vdias - 1) + ' ' + #13 + #13;
      end;
    end;
    if not vReserva then
    begin
      vReserva := trim(buscas.FieldByName('TIPO').AsString) = 'ESTP';
      if vReserva then
      begin
        if trim(vossprob) <> '' then
          vossprob := vossprob + #13;
        vossprob := vossprob + 'Esse Vendedor tem mercadorias reservadas no estoque fechado entre os dias '
          + vDadosIni.vusardtvervnd + ' e ' + FormatDateTime('dd/mm/yyyy', vDadosIni.getDataBanco(buscas2) - vdiasR - 1) + ' ' + #13 + #13;
      end;
    end;
    if not vPend then
    begin
      vPend := trim(buscas.FieldByName('TIPO').AsString) = 'PEND';
      if vPend then
      begin
        if trim(vossprob) <> '' then
          vossprob := vossprob + #13;
        vossprob := vossprob + 'Esse Vendedor tem mercadorias reservadas pendentes no estoque fechado entre os dias '
          + vDadosIni.vusardtvervnd + ' e ' + FormatDateTime('dd/mm/yyyy', vDadosIni.getDataBanco(buscas2) - vdiasR - 1) + ' ' + #13 + #13;
      end;
    end;
    if (vEstF) and (not vReserva) and (not vPend) then
     vossprob := vossprob + 'Nº Doc ' + vDadosIni.StrZero(buscas.FieldByName('COD_PEDIDO').AsInteger, 6) +
      ' NItem ' + IntToStr(buscas.FieldByName('NITEM').AsInteger) +
      ' Grupo ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) +
      ' Código ' + trim(buscas.FieldByName('COD_PROD').AsString) +
      ' Num Fab ' + trim(buscas.FieldByName('NUM_FAB_PROD').AsString) + #13
    else
     vossprob := vossprob + 'Nº Res ' + IntToStr(buscas.FieldByName('COD_RESERVA').AsInteger) +
      ' Nº Doc ' + vDadosIni.StrZero(buscas.FieldByName('COD_PEDIDO').AsInteger, 6) +
      ' NItem ' + IntToStr(buscas.FieldByName('NITEM').AsInteger) +
      ' Grupo ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) +
      ' Código ' + trim(buscas.FieldByName('COD_PROD').AsString) +
      ' Num Fab ' + trim(buscas.FieldByName('NUM_FAB_PROD').AsString) + #13;
    buscas.next;
  end;
  buscas.Close;
  buscas.sql.text := ' SELECT COUNT(*) AS TOTAL FROM CONTROLE_ALMOXARIFADO ' +
    ' WHERE COD_VENDEDOR = ' + inttostr(pCodvend) + ' AND TIPV = ' + QuotedStr(pTipvAtacVarejo) +
    ' AND (DATA_LIBTRAVA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(vDadosIni.vusardtvervnd))) +
    ' AND DATA_LIBTRAVA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.getDataBanco(buscas2) - vdias - 1)) + ' ) ' +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND (COALESCE(COD_RESERVA, 0) <= 0) ' +
    ' HAVING COUNT(*) > 0 ';
  buscas.sql.text :=  buscas.sql.text +
    ' UNION' +
    ' SELECT COUNT(*) AS TOTAL FROM CONTROLE_ALMOXARIFADO ' +
    ' WHERE COD_VENDEDOR = ' + inttostr(pCodvend) + ' AND TIPV = ' + QuotedStr(pTipvAtacVarejo) +
    ' AND (DATA_LIBTRAVA >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(vDadosIni.vusardtvervnd))) +
    ' AND DATA_LIBTRAVA <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.getDataBanco(buscas2) - vdiasR - 1))+ ' ) ' +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND (COALESCE(COD_RESERVA, 0) > 0) ' +
    ' HAVING COUNT(*) > 0 ' +
    ' UNION ' +
    ' SELECT COUNT(*) AS TOTAL FROM RESERVA_ALMOXARIFADO_ITENS ' +
    ' WHERE COD_VENDEDOR = ' + inttostr(pCodvend) + ' AND TIPV = ' + QuotedStr(pTipvAtacVarejo) +
    ' AND (DATA_VER >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', strtodate(vDadosIni.vusardtvervnd))) +
    ' AND DATA_VER <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.getDataBanco(buscas2) - vdiasR - 1)) + ' ) ' +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' HAVING COUNT(*) > 0 ';
  buscas.open;
  vDadosIni.abreStatusProcessamento('', 'Verificando Pendências de Venda');
  vDadosIni.fechaStatusProcessamento;
  if buscas.FieldByName('total').asinteger > 0 then
  begin
//    if vReserva then
        Application.MessageBox(Pchar(vossprob), 'Informação', MB_OK);
//    else
//      Application.MessageBox(Pchar('Esse Vendedor tem mercadorias pendentes no estoque fechado entre os dias '
//      + vDadosIni.vusardtvervnd + ' e ' + FormatDateTime('dd/mm/yyyy', vDadosIni.getDataBanco(buscas) - vdias - 1) + ' ' + #13 + #13 + vossprob), 'Informação', MB_OK);
    if not vDadosIni.PesqPros('VND216', 'VENDEDOR: ' + vDadosIni.StrZero(pCodvend, 5), '', 'CONTROLE_ALMOXARIFADO', '', buscas, true) then
      Result := false
    else
      Result := true;
  end
  else
  begin
    if vDadosIni.vNivel < vnivelus then
    begin
      Application.MessageBox('Esse Vendedor não tem permissão para abrir incluir peças/abrir venda/transferir peças', 'Informação', MB_OK);
      if not vDadosIni.PesqPros('VND216', 'VENDEDOR: ' + vDadosIni.StrZero(pCodvend, 5), '', 'CONTROLE_ALMOXARIFADO', '', buscas, true) then
        Result := false
      else
        Result := true;
    end;
  end
end;

function TEstoqueFechado.Delete: boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  try
    buscas.Close;
    buscas.SQL.Text := 'delete from controle_almoxarifado where cod_pedido = ' +
      IntToStr(dataSet.FieldByName('COD_PEDIDO').AsInteger) +
      ' and sit_atd =''AT''  and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;
  except

  end;

//  try
//    buscas.ExecSQL;
//
//    CommitaTransacao;
//  except
//    RollBackTransacao;
//  end;

//  Result := true;
//  Refresh;
end;

destructor TEstoqueFechado.destroy;
begin
  vPedvenda.Free;
  vPedvenda := nil;
  Produto.Free;
  Produto := nil;
  CodBarra.Free;
  CodBarra := nil;
  Usuario.Free;
  Usuario := nil;
  Mecanico.Free;
  Mecanico := nil;
  Cliente.Free;
  Cliente := nil;
  CondPagamento.Free;
  CondPagamento := nil;
  TipoVenda.Free;
  TipoVenda := nil;
  Reserva.Free;
  Reserva := nil;
  inherited;
end;

function TEstoqueFechado.DevolverItem: boolean;
var
  acao, vQuant, vOutros: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('VND145', 'DEVOLVER ITEM',
    'GRUPO_PROD ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
    ' - COD_PROD ' + trim(dataSet.FieldByName('COD_PROD').AsString),
    'CONTROLE_ALMOXARIFADO', dataSet.FieldByName('COD_PEDIDO').AsString, buscas, true) then
    Exit;

  acao := dataSet.FieldByName('COD_PEDIDO').AsString;
  vQuant := StringReplace(dataSet.FieldByName('QUANT').AsString, ',', '.', [rfReplaceAll]);

  vOutros := ' - COD. VEND:' + dataSet.FieldByName('COD_VENDEDOR').AsString
    + ' - GRUPO_PROD ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger)
    + ' - COD_PROD ' + Trim(dataSet.FieldByName('COD_PROD').AsString)
    + ' - QTD DEV: ' + vQuant
    + ' - COD. ALMOX:' + dataSet.FieldByName('COD_VENDEDOR1').AsString;

  if dataSet.FieldByName('SIT_ATD').AsString <> 'AT' then
  begin
    Application.MessageBox('Este Item não pode ser devolvido poís não foi atendido!', 'Atenção',
      MB_OK);
    exit;
  end;

  buscas.Close;
  buscas.SQL.Text := ' SELECT SIT_ATD FROM CONTROLE_ALMOXARIFADO ' +
   ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA';
  buscas.ParamByName('COD_PEDIDO').AsInteger := dataSet.FieldByName('COD_PEDIDO').AsInteger;
  buscas.ParamByName('NITEM').AsInteger := dataSet.FieldByName('NITEM').AsInteger;
  buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
  buscas.Open;

  if (buscas.FieldByName('SIT_ATD').AsString <> 'AT') then
  begin
    Application.MessageBox('Este Item não pode ser devolvido poís não foi atendido!' + #13+'Aperte F5 para atualizar!', 'Atenção', MB_OK);
    exit;
  end;

  if Application.MessageBox('Tem certeza que deseja devolver este item?',
    'Devolver Peça', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  if not verificarPendencia then
    exit;
      
  IniciaTransacao;
  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('SIT_ATD').AsString := 'DV';
    Result := inherited post;
    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VND145', acao, 'SUCESSO' + vOutros, 'CONTROLE_ALMOXARIFADO',
        dataSet.FieldByName('COD_PEDIDO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VND145', acao, 'FALHA' + vOutros, 'CONTROLE_ALMOXARIFADO',
        dataSet.FieldByName('COD_PEDIDO').AsString, buscas);
    if Result then
      Refresh;
  end;
end;

function TEstoqueFechado.imprimirSolOS(rdSol: TRdPrint): boolean;
var
  vlinha: integer;
  vpag: Integer;
  vselecionado: integer;
  vSelTemp, vClienteTemp: Boolean;
  vClientes: string;
  vQuantClientes, I: Integer;
  buscas2: TIBQuery;

  procedure novaPag;
  begin
    if vpag > 0 then
     rdSol.Novapagina;

    buscas.Close;
    buscas.SQL.Text := 'select NOME_VENDEDOR from COLABORADOR'
      + ' where COD_VENDEDOR = ' + dataSet.FieldByName('COD_VENDEDOR').asstring
      + ' and cod_empresa = ' + vDadosIni.CodEmpresa + ' and ativo=1 ';
    buscas.Open;
    rdSol.imp(vlinha, 1, vDadosIni.vEmp.vnomeEmpresa); //vEmp.dataSet.FieldByName('NOME_EMP').AsString);
    vlinha := vlinha + 1;
    rdSol.imp(vlinha, 25, 'VENDEDOR: ' +  trim(buscas.FieldByName('NOME_VENDEDOR').AsString));
    if vClienteTemp then
    begin
      if (trim(vDadosIni.getCampoPipe(vClientes,I)) = '') or (trim(vDadosIni.getCampoPipe(vClientes,I)) = '0') then
      begin
         rdSol.imp(vlinha, 70, 'CLIENTE : CLIENTE NÃO INFORMADO');
      end
      else
      begin
       buscas2.Close;
       buscas2.SQL.Text := 'select NOME_CLIENTE from CLIENTES'
         + ' where COD_CLIENTE = ' + trim(vDadosIni.getCampoPipe(vClientes,I))
         + ' and cod_empresa = ' + vDadosIni.CodEmpresa + ' and ativo=1';
       buscas2.Open;

       rdSol.imp(vlinha, 70, 'CLIENTE : ' +  trim(buscas2.FieldByName('NOME_CLIENTE').AsString));
      end;
    end;
    vlinha := vlinha + 2;
    if (vClienteTemp) or (vDadosIni.vEmp.vClienteAlmox <> 'S') then
    begin
      rdSol.imp(vlinha, 1, 'CODIGO');
      rdSol.imp(vlinha, 15, 'DESCRICAO');
      rdSol.imp(vlinha, 88, 'NUMDOC');
      rdSol.imp(vlinha, 95, 'TIPO');
      rdSol.imp(vlinha, 102, 'QTDE');
      rdSol.imp(vlinha, 110, 'LOCACAO');
      rdSol.imp(vlinha, 119, 'LOCACAO2');
      rdSol.imp(vlinha, 128, 'SIT');
    end
    else
    begin
      rdSol.imp(vlinha, 1, 'CLIENTE');
      rdSol.imp(vlinha, 24, 'CODIGO');
      rdSol.imp(vlinha, 38, 'DESCRICAO');
      rdSol.imp(vlinha, 89, 'NUMDOC');
      rdSol.imp(vlinha, 96, 'TIPO');
      rdSol.imp(vlinha, 103, 'QTDE');
      rdSol.imp(vlinha, 111, 'LOCACAO');
      rdSol.imp(vlinha, 120, 'LOCACAO2');
      rdSol.imp(vlinha, 129, 'SIT');
    end;
    vlinha := vlinha + 1;
    rdSol.imp(vlinha, 1, vDadosIni.Replicate('-', 132));
    vlinha := vlinha + 1;
  end;

  procedure Imprimir;
  begin
     dataSet.First;
     while not dataSet.Eof do
     begin
       dataSet.RefreshRecord;
       if (dataSet.FieldByName('SIT_ATD').AsString = 'NT')
        or (dataSet.FieldByName('SIT_ATD').AsString = 'DV') then
       begin
         vselecionado := 1;
         if (vClienteTemp) or (vDadosIni.vEmp.vClienteAlmox <> 'S') then
         begin
           rdSol.imp(vlinha, 1, Copy(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString), 1, 13));
           rdSol.imp(vlinha, 15, copy(Trim(dataSet.FieldByName('descr_prod').asstring), 1, 72));
           rdSol.imp(vlinha, 88, Trim(dataSet.FieldByName('NDOC').asstring));
           rdSol.imp(vlinha, 95, Trim(dataSet.FieldByName('TPDOC').asstring));
           rdSol.imp(vlinha, 99, vDadosIni.AlnDir(Trim(format('%12.2f', [dataSet.FieldByName('quant').AsFloat])), 8));
           rdSol.imp(vlinha, 110, Trim(dataSet.fieldbyname('LOCACAO_PROD').asstring));
           rdSol.imp(vlinha, 119, Trim(dataSet.fieldbyname('LOCACAO_PROD_1').asstring));
           rdSol.imp(vlinha, 128, Trim(dataSet.FieldByName('SIT_ATD').AsString));
         end
         else
         begin
           rdSol.imp(vlinha, 1, Trim(dataSet.FieldByName('NOME_CLIENTE').AsString));
           rdSol.imp(vlinha, 24, Copy(Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString), 1, 13));
           rdSol.imp(vlinha, 38, copy(Trim(dataSet.FieldByName('descr_prod').asstring),1, 50)) ;
           rdSol.imp(vlinha, 89, Trim(dataSet.FieldByName('NDOC').asstring));
           rdSol.imp(vlinha, 96, Trim(dataSet.FieldByName('TPDOC').asstring));
           rdSol.imp(vlinha, 100, vDadosIni.AlnDir(Trim(format('%12.2f', [dataSet.FieldByName('quant').AsFloat])), 8));
           rdSol.imp(vlinha, 111, Trim(dataSet.fieldbyname('LOCACAO_PROD').asstring));
           rdSol.imp(vlinha, 120, Trim(dataSet.fieldbyname('LOCACAO_PROD_1').asstring));
           rdSol.imp(vlinha, 129, Trim(dataSet.FieldByName('SIT_ATD').AsString));
         end;
         inc(vlinha);
       end;
       dataSet.next;
       if vlinha >= 33 then
       begin
         vlinha := 1;
         vpag := vpag + 1;
         novaPag;
       end;
     end;
  end;
begin
  try
    if dataSet.IsEmpty then
      exit;
    buscas2 := TIBQuery(dtmEstoqueFechado.qrBuscas);
    if not vDadosIni.ModImp(rdSol) then
      exit;
    vlinha := 1;
    vQuantClientes := 0;
    vpag := 0;
    vselecionado := 0;
    vSelTemp := Application.MessageBox('Imprime somente selecionados?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
    if vDadosIni.vEmp.vClienteAlmox = 'S' then
      vClienteTemp := Application.MessageBox('Imprime uma folha para cada cliente?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
    rdSol.TamanhoQteColunas := 132;
    rdSol.abrir;
    if not vClienteTemp then
     novaPag;

    if vClienteTemp then
    begin
      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('SIT_ATD').AsString = 'NT') or (dataSet.FieldByName('SIT_ATD').AsString = 'DV') then
        begin
          if not vSelTemp then
          begin
            if (pos(dataSet.FieldByName('COD_CLIENTE').AsString + '|', vClientes) = 0) then
            begin
               if trim(vClientes) = '' then
                 vClientes := dataSet.FieldByName('COD_CLIENTE').AsString + '|'
               else
                 vClientes := vClientes + dataSet.FieldByName('COD_CLIENTE').AsString + '|';
               vQuantClientes := vQuantClientes + 1;
            end;
          end
          else
          begin
            if (dataSet.FieldByName('SEL').AsString = 'S') and (pos(dataSet.FieldByName('COD_CLIENTE').AsString + '|', vClientes) = 0) then
            begin
               if trim(vClientes) = '' then
                 vClientes := dataSet.FieldByName('COD_CLIENTE').AsString + '|'
               else
                 vClientes := vClientes + dataSet.FieldByName('COD_CLIENTE').AsString + '|';
               vQuantClientes := vQuantClientes + 1;
            end;
          end;
        end;
        dataSet.Next;
      end;
    end;

    if  (not vClienteTemp) and (vSelTemp) then
    begin
      EstoqueFechado.dataSet.Filter := 'Sel = ''S''';
      EstoqueFechado.dataSet.Filtered := True;
    end;

    if vClienteTemp then
    begin
      for I := 1 to vQuantClientes do
      begin
        vlinha := 1;
        if I > 1 then
         vpag := vpag + 1;
        novaPag;
        if ((vDadosIni.getCampoPipe(vClientes,I) = '')
        or (vDadosIni.getCampoPipe(vClientes,I) = '0')) then
          EstoqueFechado.dataSet.Filter := '((COD_CLIENTE = ''0'') or (COD_CLIENTE IS NULL))'
        else
          EstoqueFechado.dataSet.Filter := 'COD_CLIENTE = '+vDadosIni.getCampoPipe(vClientes,I)+'';
        EstoqueFechado.dataSet.Filtered := True;
        Imprimir;
        rdSol.imp(vlinha, 1, vDadosIni.replicate('-', 132));
      end
    end
    else
      Imprimir;

    if vselecionado = 0 then
    begin
      Application.MessageBox('Nenhum produto encontrado sem atendimento ou devolvido!', 'Atenção', MB_OK);
      rdSol.Abortar;
      EstoqueFechado.dataSet.Filter := '';
      EstoqueFechado.dataSet.Filtered := False;
      EstoqueFechado.Refresh;
      exit;
    end;
    rdSol.imp(vlinha, 1, vDadosIni.replicate('-', 132));
    rdSol.fechar;
    Result := true;
    EstoqueFechado.dataSet.Filter := '';
    EstoqueFechado.dataSet.Filtered := False;
    EstoqueFechado.Close;
    EstoqueFechado.Open;
  except
    rdSol.Abortar;
  end;
end;

function TEstoqueFechado.InserirPeca: boolean;
begin
  if not dataSet.Active then
    montaSelect('select c.* from controle_almoxarifado c ' +
      ' where c.cod_pedido=0 and c.cod_empresa =0 ');

  Result := False;
  IniciaTransacao;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_CLIENTE').AsInteger := 0;
    dataSet.FieldByName('COD_PEDIDO').AsInteger := 0;
    dataSet.FieldByName('NITEM').AsInteger := 1;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('SIT_ATD').AsString := 'NT';
    dataSet.FieldByName('TIPV').AsString :=
      TipoVenda.dataSet.FieldByName('DESCRICAO').AsString;
    dataSet.FieldByName('COD_COND_PAG').AsInteger :=
      CondPagamento.dataSet.FieldByName('COD_COND_PAG').AsInteger;
    dataSet.FieldByName('COD_VENDEDOR').AsInteger :=
      Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
    dataSet.FieldByName('DATA_PEDIDO').AsString :=
      FormatDateTime(ShortDateFormat, vDadosIni.getDataHoraBanco(dtmEstoqueFechado.qrBuscas));
    dataSet.FieldByName('HORA_PEDIDO').AsString :=
      FormatDateTime(ShortTimeFormat, vDadosIni.getDataHoraBanco(dtmEstoqueFechado.qrBuscas));
  end;
end;


function TEstoqueFechado.LiberarTravaVenda: boolean;
var
   msg, processo: string;
begin
  msg := 'Deseja realmente retirar trava para inclusão de novas mercadorias ?';
  if Application.MessageBox(Pchar(msg), 'Retirar trava', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
    processo := 'VND218';
    if dataset.FieldByName('QTDE_LIBTRAVA').AsInteger > 0 then
      processo := 'VND198';
    if vDadosIni.PesqPros(processo, 'RETIRAR TRAVA', 'FALHA', 'CONTROLE_ALMOXARIFADO', dataSet.FieldByName('COD_PEDIDO').AsString, buscas, false) then
      if inherited Edit then
      begin
        dataSet.FieldByName('LIBTRAVA').AsString := 'S';
        dataset.FieldByName('DATA_LIBTRAVA').AsDateTime := vDadosIni.getDataBanco(buscas);
        dataset.FieldByName('QTDE_LIBTRAVA').AsInteger := dataset.FieldByName('QTDE_LIBTRAVA').AsInteger + 1;
        result := inherited Post;
        if Result then
          result := Apply;
        if Result then
          result := CommitaTransacao;
        if Result then
          vDadosIni.GravaAuditoria(processo, 'RETIRAR TRAVA', 'SUCESSO', 'CONTROLE_ALMOXARIFADO', dataSet.FieldByName('COD_PEDIDO').AsString, buscas)
        else
          vDadosIni.GravaAuditoria(processo, 'RETIRAR TRAVA', 'FALHA', 'CONTROLE_ALMOXARIFADO', dataSet.FieldByName('COD_PEDIDO').AsString, buscas);
      end;
  end;
  Refresh;
end;

function TEstoqueFechado.NItem(vCodpedido: Integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select max(nitem) as nitem from controle_almoxarifado'
    + ' where cod_pedido =' + IntToStr(vCodpedido) + ' and cod_empresa=' + vDadosIni.codEmpresa;
  buscas.Open;

  vNitem := buscas.FieldByName('NITEM').AsInteger;
end;

function TEstoqueFechado.post: boolean;
var
  acao, vOutros: string;
  codigo: integer;
begin
  try
    Result := false;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if ((dataSet.FieldByName('GRUPO_PROD').AsInteger <= 0) or (trim(dataSet.FieldByName('COD_PROD').AsString) = '')) then
      raiseExceptionCreate('Produto deve ser informado', 'Edit1');

    if (dataSet.FieldByName('VLUN').AsFloat <= 0) then
      raiseExceptionCreate('Valor Unitário deve ser maior do que 0!', 'EditHw1');

    if dataSet.FieldByName('COD_CLIENTE').IsNull then
      dataSet.FieldByName('COD_CLIENTE').AsInteger := 0;

    if acao = 'INSERIR' then
    begin
      vOutros := ' - COD. VEND:' + dataSet.FieldByName('COD_VENDEDOR').AsString
        + ' - GRUPO_PROD: ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger)
        + ' - COD_PROD: ' + Trim(dataSet.FieldByName('COD_PROD').AsString)
        + ' - QTD: ' + dataSet.FieldByName('QUANT').AsString;

      dataSet.FieldByName('COD_PEDIDO').AsInteger :=
        Gencodigo('CONTROLE_ALMOXARIFADO', dtmEstoqueFechado.SpIncCodigo, vDadosIni.codEmpresa);
      vDadosIni.hw_registra_estatistica('CONTROLE_ALMOXARIFADO');
    end;

    Result := inherited post;

    if acao = 'INSERIR' then
    begin
      if Result then
        vDadosIni.GravaAuditoria('VND143', acao, 'SUCESSO' + vOutros, 'CONTROLE_ALMOXARIFADO',
          dataSet.FieldByName('COD_PEDIDO').AsString, buscas)
      else
        vDadosIni.GravaAuditoria('VND143', acao, 'FALHA' + vOutros, 'CONTROLE_ALMOXARIFADO',
          dataSet.FieldByName('COD_PEDIDO').AsString, buscas);
    end;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      Refresh;

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

procedure TEstoqueFechado.PreviewRelatorio(Sender: TObject);
begin
  vDadosIni.VisualizaRelQrp(Sender, TQuickRep(vRel).ReportTitle);
end;

function TEstoqueFechado.rdprint_relatorioMovimendoDeProdutos: boolean;
var
  vRel: TRDprint;
  buscas2: TIBQuery;
  vLinha, vpag: Integer;
  vQtdebusca: Extended;
  vSqlAd: string;
  vCount: Integer;
  vSqlVendedor: string;
  vOrdem: string;

  procedure novapagina;
  var
    vNomeColab: string;
  begin
    vRel.ImpF(vlinha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
    vLinha := vLinha + 1;
    vRel.ImpF(vLinha, 1, vDadosIni.vEmp.vEndereco + ' - ' + vDadosIni.vEmp.vBairro + ', ' +
      vDadosIni.vEmp.vCidade + ' CEP: ' + vDadosIni.vEmp.vCEP + ' FONE: ' +
      vDadosIni.vEmp.vTelefone + ' CNPJ: ' + vDadosIni.vEmp.vCNPJ , [Comp17]);
    vLinha := vLinha + 1;
//    if checkbox1.checked then
      vRel.ImpF(vLinha, 1, 'RELACAO DE MOVIMENTACAO POR PRODUTO', [normal, negrito]);
//    else
//      vRel.ImpF(vLinha, 1, 'RELACAO PRODUTOS ATENDIDOS', [normal, negrito]);
    vNomeColab := '';
    if not frmControleAlmoxarifado.CheckBox1.Checked then
      vNomeColab := ' - ' +  Usuario.dataSet.FieldByName('nome_vendedor').AsString;//vVenda.vColab.dataSet.FieldByName('nome_vendedor').AsString;
    vLinha := vLinha + 1;
    vRel.ImpF(vLinha, 1, 'DE: ' + frmControleAlmoxarifado.MaskEdit1.text + ' A ' + frmControleAlmoxarifado.MaskEdit2.text + vNomeColab, [normal, negrito]);
    vLinha := vLinha + 2;
    vpag := vpag + 1;
    vRel.ImpF(vLinha, 1, datetostr(date), [normal]);
    vRel.ImpF(vLinha, 80, 'PAG: ' + vDadosIni.strzero(vpag, 3), [normal]);
    vLinha := vLinha + 1;
    vRel.ImpF(vLinha, 1, vDadosIni.replicate('=', 132), [Comp17]);
    vLinha := vLinha + 1;
//    if checkbox1.checked then
    begin
      vRel.ImpF(vLinha, 1, 'CODIGO', [Comp17]);
      vRel.ImpF(vLinha, 15, 'DESCRICAO DO ITEM', [Comp17]);
      vRel.ImpF(vLinha, 49, 'QTDE ATD', [Comp17]);
      vRel.ImpF(vLinha, 59, 'QTDE NATD', [Comp17]);
      vRel.ImpF(vLinha, 70, 'QTDE ENTR', [Comp17]);
      vRel.ImpF(vLinha, 80, 'ESTOQUE AT', [Comp17]);
      vRel.ImpF(vLinha, 92, 'CONTADO', [Comp17]);
      vRel.ImpF(vLinha, 104, 'LOCACAO', [Comp17]);
      vRel.ImpF(vLinha, 114, 'LOCACAO 1', [Comp17]);
    end;
//    else
//    begin
//      vRel.ImpF(vLinha, 1, 'CODIGO', [Comp17]);
//      vRel.ImpF(vLinha, 15, 'DESCRICAO DO ITEM', [Comp17]);
//      vRel.ImpF(vLinha, 49, 'QTDE', [Comp17]);
//      vRel.ImpF(vLinha, 55, 'REQ/OS', [Comp17]);
//      vRel.ImpF(vLinha, 65, 'DATA ATEND', [Comp17]);
//      vRel.ImpF(vLinha, 78, 'HORA ATEND', [Comp17]);
//      vRel.ImpF(vLinha, 92, 'VENDEDOR', [Comp17]);
//      vRel.ImpF(vLinha, 115, 'LOCACOES', [Comp17]);
//    end;
    vLinha := vLinha + 1;
    vRel.ImpF(vLinha, 1, vDadosIni.replicate('=', 132), [Comp17]);
    vLinha := vLinha + 1;

  end;
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vSqlVendedor := '';
  if not frmControleAlmoxarifado.CheckBox1.Checked then
    vSqlVendedor := ' and pp.cod_vendedor = ' + IntToStr(Usuario.dataSet.FieldByName('cod_vendedor').AsInteger);
  vOrdem:= '';
  if Trim(frmControleAlmoxarifado.ComboBox4.Text) = 'CODIGO' then
    vOrdem := ' order by 1'
  else if Trim(frmControleAlmoxarifado.ComboBox4.Text) = 'DESCRICAO' then
    vOrdem := ' order by 2'
  else if Trim(frmControleAlmoxarifado.ComboBox4.Text) = 'LOCACAO1' then
    vOrdem := ' order by 6'
  else if Trim(frmControleAlmoxarifado.ComboBox4.Text) = 'LOCACAO2' then
    vOrdem := ' order by 7';

  buscas.Close;
  buscas.SQL.Text :=
    'select distinct pp.num_fab_prod, pp.descr_prod_ped, pp.cod_prod, pp.grupo_prod, p.est_f, p.locacao_prod, p.locacao_prod_1 from pedvenda_prod pp' +
    ' inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa' +
    ' where pp.data_transf >= :vdat1 and pp.data_transf <= :vdat2 and pp.cod_empresa = :cod_empresa and pp.tipo <> ''ORC'' and coalesce(pp.status, '''') <> ''CANCELADO''' + vSqlVendedor +
    ' union' +
    ' select distinct pp.num_fab_prod, pp.descr_prod_ped, pp.cod_prod, pp.grupo_prod, p.est_f, p.locacao_prod, p.locacao_prod_1 from pedvenda_prod pp' +
    ' inner join pedvenda pv on pv.nped = pp.nped and pv.tipo = pp.tipo and pv.cod_empresa = pp.cod_empresa' +
    ' inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa' +
    ' where pv.data_ped >= :vdat1 and pv.data_ped <= :vdat2 and pp.cod_empresa = :cod_empresa and pp.tipo = ''REQ'' and coalesce(pp.status, '''') <> ''CANCELADO''' + vSqlVendedor +
    vOrdem; // ' order by 1';
  buscas.ParamByName('vdat1').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
  buscas.ParamByName('vdat2').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;


  try
    vRel := TRDprint.Create(Application);
    if not vDadosIni.ModImp(vRel) then
       exit;
    vRel.FonteTamanhoPadrao := S17cpp;
    vRel.TamanhoQteColunas := 132;
    vRel.TamanhoQteLinhas := 66;
    vRel.CaptionSetup := 'Configurações de Impressão';
    vRel.OpcoesPreview.CaptionPreview := 'RELACAO DE MOVIMENTACAO POR PRODUTO';
    vRel.TitulodoRelatorio := 'RELACAO DE MOVIMENTACAO POR PRODUTO';
    vDadosIni._LimparVarSendEmail;
    vRel.OnSendMail := vDadosini._SendMailRdPrint;
    vRel.OpcoesPreview.Preview := True;
    if not vRel.EstaAberto then
      vRel.Abrir;

    vpag := 0;
    vLinha := 1;
    novapagina;
    vCount := 0;
    vDadosIni.abreStatusProcessamento('Relatório', 'Obtendo dados.');
    buscas.FetchAll;

    buscas.First;
    while not buscas.eof do
    begin
      buscas2.Close;
      buscas2.SQL.Text := 'select sum(pp.quant_ped_item) qtde  from pedvenda_prod pp' +
        ' inner join pedvenda pv on pv.nped = pp.nped and pv.tipo = pp.tipo and pv.cod_empresa = pp.cod_empresa' +
        ' where pv.data_ped >= :vdat1 and pv.data_ped <= :vdat2 and pp.cod_empresa = :cod_empresa' +
        ' and pp.grupo_prod = :grupo_prod and pp.cod_prod = :cod_prod' +
        ' and pp.tipo = ''REQ'' and coalesce(pp.status, '''') <> ''CANCELADO'' and pp.sit_atd = ''AT''';
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := buscas2.FieldByName('qtde').AsFloat;

      buscas2.Close;
      buscas2.SQL.Text := 'select sum(pp.quant_ped_item) qtde  from pedvenda_prod pp' +
        ' inner join pedvenda pv on pv.nped = pp.nped and pv.tipo = pp.tipo and pv.cod_empresa = pp.cod_empresa' +
        ' where pp.data_transf >= :vdat1 and pp.data_transf <= :vdat2 and pp.cod_empresa = :cod_empresa' +
        ' and pp.grupo_prod = :grupo_prod and pp.cod_prod = :cod_prod' +
        ' and pp.tipo = ''OS'' and coalesce(pp.status, '''') <> ''CANCELADO'' and pp.sit_atd = ''AT''';
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := vQtdebusca + buscas2.FieldByName('qtde').AsFloat;

      buscas2.Close;
      buscas2.SQL.Text := 'select sum(c.quant) qtde from controle_almoxarifado c' +
        ' left join grade grd on c.cod_grade = grd.cod_grade and c.cod_empresa = grd.cod_empresa' +
        ' where c.grupo_prod = :grupo_prod and c.cod_prod = :cod_prod and c.cod_empresa = :cod_empresa' +
        ' and c.sit_atd <> ''NT'' and c.data_pedido >= :vdat1 and c.data_pedido <= :vdat2';
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := vQtdebusca + buscas2.FieldByName('qtde').AsFloat;

      vRel.ImpF(vLinha, 1, Copy(buscas.FieldByName('NUM_FAB_PROD').AsString, 1, 13), [Comp17]);
      vRel.ImpF(vLinha, 15, Copy(buscas.FieldByName('descr_prod_ped').AsString,1 , 41 - (Length(Trim(format('%n', [vQtdebusca])))) ), [Comp17]);
      vRel.ImpF(vLinha, 49, vDadosIni.AlnDir(format('%n', [vQtdebusca]), 8), [Comp17]);

      buscas2.Close;
      buscas2.SQL.Text := 'select sum(pp.quant_ped_item) qtde  from pedvenda_prod pp' +
        ' inner join pedvenda pv on pv.nped = pp.nped and pv.tipo = pp.tipo and pv.cod_empresa = pp.cod_empresa' +
        ' where pv.data_ped >= :vdat1 and pv.data_ped <= :vdat2 and pp.cod_empresa = :cod_empresa' +
        ' and pp.grupo_prod = :grupo_prod and pp.cod_prod = :cod_prod' +
        ' and pp.tipo = ''REQ'' and coalesce(pp.status, '''') <> ''CANCELADO'' and pp.sit_atd = ''NT''';
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := buscas2.FieldByName('qtde').AsFloat;

      buscas2.Close;
      buscas2.SQL.Text := 'select sum(pp.quant_ped_item) qtde  from pedvenda_prod pp' +
        ' inner join pedvenda pv on pv.nped = pp.nped and pv.tipo = pp.tipo and pv.cod_empresa = pp.cod_empresa' +
        ' where pp.data_transf >= :vdat1 and pp.data_transf <= :vdat2 and pp.cod_empresa = :cod_empresa' +
        ' and pp.grupo_prod = :grupo_prod and pp.cod_prod = :cod_prod' +
        ' and pp.tipo = ''OS'' and coalesce(pp.status, '''') <> ''CANCELADO'' and pp.sit_atd = ''NT''';
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := vQtdebusca + buscas2.FieldByName('qtde').AsFloat;

      buscas2.Close;
      buscas2.SQL.Text := 'select sum(c.quant) qtde from controle_almoxarifado c' +
        ' left join grade grd on c.cod_grade = grd.cod_grade and c.cod_empresa = grd.cod_empresa' +
        ' where c.grupo_prod = :grupo_prod and c.cod_prod = :cod_prod and c.cod_empresa = :cod_empresa' +
        ' and c.sit_atd = ''NT'' and c.data_pedido >= :vdat1 and c.data_pedido <= :vdat2';
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := vQtdebusca + buscas2.FieldByName('qtde').AsFloat;

      vRel.ImpF(vLinha, 60, vDadosIni.alndir(format('%n', [vQtdebusca]), 8), [Comp17]);

      buscas2.Close;
      buscas2.SQL.Text := 'select sum(vqt) qtde from comprasmeses where' +
        ' grupo_prod = :grupo_prod and cod_prod = :cod_prod and' +
        ' data_compra >= :vdat1 and data_compra <= :vdat2' +
        ' and cod_empresa = :cod_empresa';
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := buscas2.FieldByName('qtde').AsFloat;

      vRel.ImpF(vLinha, 71, vDadosIni.alndir(format('%n', [vQtdebusca]), 8), [Comp17]);

      buscas2.Close;
      buscas2.SQL.Text := 'SELECT sum(pp.quant_ped_item) qtde from pedvenda p INNER JOIN pedvenda_prod pp ' +
        ' on p.nped = pp.nped and p.cod_empresa = pp.cod_empresa and p.tipo = pp.tipo ' +
        ' INNER JOIN clientes c on p.cod_empresa=c.cod_empresa and p.cod_cliente=c.cod_cliente ' +
        ' where p.data_fech is null and p.ativo = 1 and ((p.tipo = ''OS'') or (p.tipo=''REQ'')) ' +
        ' and p.cod_empresa= :cod_empresa ' +
        ' and pp.grupo_prod = :grupo_prod ' +
        ' and pp.cod_prod = :cod_prod ' +
        ' and ((pp.status is null) or (pp.status <> ''CANCELADO'')) ';
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := buscas2.FieldByName('qtde').AsFloat;

      buscas2.Close;
      buscas2.SQL.Text := 'select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) qtde from producao pd' +
        ' inner join producao_item_indice pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa' +
        ' left join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +
        ' where pd.data_fechamento is null and pd.cod_empresa = :cod_empresa ' +
        ' and pi.grupo_prod = :grupo_prod ' +
        ' and pi.cod_prod = :cod_prod';
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := vQtdebusca + buscas2.FieldByName('qtde').AsFloat;

      buscas2.Close;
      buscas2.SQL.Text := 'select sum(c.quant) qtde from controle_almoxarifado c ' +
        ' left join grade grd on c.cod_grade = grd.cod_grade and c.cod_empresa = grd.cod_empresa' +
        ' where c.grupo_prod = :grupo_prod' +
        ' and c.cod_prod = :cod_prod' +
        ' and c.cod_empresa = :cod_empresa';
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := vQtdebusca + buscas2.FieldByName('qtde').AsFloat;

      vRel.ImpF(vLinha, 82, vDadosIni.alndir(format('%n', [ buscas.FieldByName('est_f').AsFloat - vQtdebusca]), 8), [Comp17]);
      vRel.ImpF(vLinha, 92, '____________', [Comp17]);
      vRel.ImpF(vLinha, 104, buscas.FieldByName('LOCACAO_PROD').AsString, [Comp17]);
      vRel.ImpF(vLinha, 114, buscas.FieldByName('LOCACAO_PROD_1').AsString, [Comp17]);
      vLinha := vLinha + 1;
      if vLinha >= 60 then
      begin
        vRel.ImpF(vLinha, 1, vDadosIni.replicate('=', 132), [comp17]);
        vLinha := 1;
        vRel.Novapagina;
        novapagina;
      end;
      buscas.next;
      vCount := vCount + 1;
      vDadosIni.abreStatusProcessamento('Relatório', 'Obtendo dados. ' + IntToStr( Trunc( vCount * 100 / buscas.RecordCount ) )  + '%');

    end;
    vDadosIni.fechaStatusProcessamento;
    vRel.fechar;

  finally
    vDadosIni.fechaStatusProcessamento;
    FreeAndNil(vRel);
  end;
end;

function TEstoqueFechado.relatorio: boolean;
var
  vData: string;
begin
  if not vDadosIni.PesqPros('VND152', 'EMITIR', '', 'PEDVENDA_PROD', '', buscas, true) then
    Exit;

  if frmControleAlmoxarifado = nil then
    Application.CreateForm(TfrmControleAlmoxarifado, frmControleAlmoxarifado);
  frmControleAlmoxarifado.PageControl1.ActivePage := frmControleAlmoxarifado.tsOpcoesRel;

  if not vPedvenda.vColab.Active then
    vPedvenda.vColab.abreColaboradorVendedor;
  if not vPedvenda.vEmp.Active then
    vPedvenda.vEmp.abreEmpresa;
  if (frmControleAlmoxarifado.MaskEdit1.Text = '  /  /    ') or
    (frmControleAlmoxarifado.MaskEdit2.Text = '  /  /    ') then
    vData := DateToStr(vDadosIni.getDataBanco(buscas));
  if (frmControleAlmoxarifado.MaskEdit1.Text = '  /  /    ') then
    frmControleAlmoxarifado.MaskEdit1.Text := DateToStr(StartOfTheMonth(StrToDate(vData)));
  if (frmControleAlmoxarifado.MaskEdit2.Text = '  /  /    ') then
    frmControleAlmoxarifado.MaskEdit2.Text := vData;
  frmControleAlmoxarifado.ComboBox2.ItemIndex := 0;
  frmControleAlmoxarifado.BitBtn57.Tag := 0;

  while true do
  begin
    if frmControleAlmoxarifado = nil then
      Exit
    else if frmControleAlmoxarifado.BitBtn57.Tag <> 0 then
      Break
    else
      Application.ProcessMessages;
  end;

  if frmControleAlmoxarifado.BitBtn57.Tag = 1 then
  begin
    if frmControleAlmoxarifado.RadioButton1.Checked then
      rdprint_relatorioMovimendoDeProdutos //relatorioMovimendoDeProdutos
    else
      relatorioRelacaoAtendimentos;
  end;
  frmControleAlmoxarifado.PageControl1.ActivePage := frmControleAlmoxarifado.tsControleAlmoxarifado;

end;

function TEstoqueFechado.relatorioMovimendoDeProdutos: boolean;
var
  vData: string;
begin
  frmControleAlmoxarifado.DetailBand1.BeforePrint := bandaMovDetalheBeforePrint;
  vRel := TQuickRep(frmControleAlmoxarifado.qkRMovProd);
  frmControleAlmoxarifado.qkRMovProd.OnPreview := PreviewRelatorio;
  frmControleAlmoxarifado.qrLperiodoMov.Caption := 'Período de ' + frmControleAlmoxarifado.MaskEdit1.Text + ' até '
    + frmControleAlmoxarifado.MaskEdit2.Text;

  relMovProd := TIBQuery(dtmEstoqueFechado.qrRelMovProd);
  relMovProd.Close;
  if not frmControleAlmoxarifado.CheckBox1.Checked then
  begin
    relMovProd.SQL.Add(' and pedprod.cod_vendedor = :cod_vendedor');
    relMovProd.ParamByName('cod_vendedor').AsInteger :=
      Usuario.dataSet.FieldByName('cod_vendedor').AsInteger;
  end;
  relMovProd.ParamByName('dataini').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
  relMovProd.ParamByName('datafim').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
  relMovProd.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  relMovProd.Open;
  frmControleAlmoxarifado.qkRMovProd.Preview;
end;

function TEstoqueFechado.relatorioRelacaoAtendimentos: boolean;
var
  vData: string;
  vOrdem: string;
begin

  frmControleAlmoxarifado.DetailBand1.BeforePrint := bandaMovDetalheBeforePrint;
  vRel := TQuickRep(frmControleAlmoxarifado.qkRRelacAtend);
  frmControleAlmoxarifado.qkRRelacAtend.OnPreview := PreviewRelatorio;
  frmControleAlmoxarifado.qrLPeriodoAtend.Caption := 'Período de ' + frmControleAlmoxarifado.MaskEdit1.Text +
    ' até ' + frmControleAlmoxarifado.MaskEdit2.Text;

  relRelacAtend := TIBQuery(dtmEstoqueFechado.qrRelRelaAten);
  relRelacAtend.Close;
  if frmControleAlmoxarifado.ComboBox2.Text = 'AT' then
  begin
    relRelacAtend.SQL.Text := 'select p1.tipo, p2.num_fab_prod,p2.descr_prod_ped,p2.grupo_prod, p2.cod_prod,'
      + ' p2.quant_ped_item, p2.sit_atd, p2.data_atd, p2.hora_atd, p2.nped,'
      + ' c1.nome_vendedor, p3.locacao_prod, p3.locacao_prod_1 '
      + ' from pedvenda_prod p2 '
      + ' inner join pedvenda p1 on p1.nped = p2.nped and '
      + ' p1.tipo = p2.tipo and p1.cod_empresa = p2.cod_empresa '
      + ' inner join produtos p3 on p3.grupo_prod = p2.grupo_prod and '
      + ' p3.cod_prod = p2.cod_prod and p3.cod_empresa = p2.cod_empresa '
      + ' left join colaborador c1 on c1.cod_vendedor = p2.cod_vendedor and '
      + ' c1.cod_empresa = p1.cod_empresa '
      + ' where p1.ativo = 1 and p1.data_ped >= :dataini and p1.data_ped <= :datafim and p2.sit_atd = :sit_atd '
      + ' and p1.cod_empresa = :cod_empresa';
    if not frmControleAlmoxarifado.CheckBox1.Checked then
    begin
      relRelacAtend.SQL.Add(' and p2.cod_vendedor = :cod_vendedor');

      relRelacAtend.ParamByName('cod_vendedor').AsInteger :=
        Usuario.dataSet.FieldByName('cod_vendedor').AsInteger;
    end;
    relRelacAtend.SQL.Add(' union select '''' tipo, c2.num_fab_prod,c2.descr_prod as descr_prod_ped,c2.grupo_prod, c2.cod_prod,'
      + ' c2.quant as quant_ped_item, c2.sit_atd, c2.data_atd, cast(substring(c2.hora_atd from 1 for 8) as char(8)) as hora_atd,0 nped,'
      + ' c1.nome_vendedor, p3.locacao_prod, p3.locacao_prod_1 '
      + ' from controle_almoxarifado c2 '
      + ' inner join produtos p3 on p3.grupo_prod = c2.grupo_prod and '
      + ' p3.cod_prod = c2.cod_prod and p3.cod_empresa = c2.cod_empresa '
      + ' left join colaborador c1 on c1.cod_vendedor = c2.cod_vendedor and '
      + ' c1.cod_empresa = c2.cod_empresa '
      + ' where p3.ativo = 1 and c2.data_pedido >= :dataini and c2.data_pedido <= :datafim and ((c2.sit_atd =''AT'') or (c2.sit_atd =''DV'')) '
      + ' and c2.cod_empresa = :cod_empresa ');
    if not frmControleAlmoxarifado.CheckBox1.Checked then
    begin
      relRelacAtend.SQL.Add(' and c2.cod_vendedor = :cod_vendedor');

      relRelacAtend.ParamByName('cod_vendedor').AsInteger :=
        Usuario.dataSet.FieldByName('cod_vendedor').AsInteger;
    end;
  end
  else
  begin
    relRelacAtend.SQL.Text := 'select p1.tipo, p2.num_fab_prod,p2.descr_prod_ped,p2.grupo_prod, p2.cod_prod,'
      + ' p2.quant_ped_item, p2.sit_atd, p2.data_atd, p2.hora_atd, p2.nped,'
      + ' c1.nome_vendedor, p3.locacao_prod, p3.locacao_prod_1 '
      + ' from pedvenda_prod p2 '
      + ' inner join pedvenda p1 on p1.nped = p2.nped and '
      + ' p1.tipo = p2.tipo and p1.cod_empresa = p2.cod_empresa '
      + ' inner join produtos p3 on p3.grupo_prod = p2.grupo_prod and '
      + ' p3.cod_prod = p2.cod_prod and p3.cod_empresa = p2.cod_empresa '
      + ' left join colaborador c1 on c1.cod_vendedor = p2.cod_vendedor and '
      + ' c1.cod_empresa = p1.cod_empresa '
      + ' where p1.ativo = 1 and p1.data_ped >= :dataini and p1.data_ped <= :datafim and p2.sit_atd = :sit_atd '
      + ' and p1.cod_empresa = :cod_empresa';
    if not frmControleAlmoxarifado.CheckBox1.Checked then
    begin
      relRelacAtend.SQL.Add(' and p2.cod_vendedor = :cod_vendedor');

      relRelacAtend.ParamByName('cod_vendedor').AsInteger :=
        Usuario.dataSet.FieldByName('cod_vendedor').AsInteger;
    end;
    relRelacAtend.SQL.Add(' union select '''' tipo, c2.num_fab_prod,c2.descr_prod as descr_prod_ped,c2.grupo_prod, c2.cod_prod,'
      + ' c2.quant as quant_ped_item, c2.sit_atd, c2.data_atd, cast(substring(c2.hora_atd from 1 for 8) as char(8)) as hora_atd,0 nped,'
      + ' c1.nome_vendedor, p3.locacao_prod, p3.locacao_prod_1 '
      + ' from controle_almoxarifado c2 '
      + ' inner join produtos p3 on p3.grupo_prod = c2.grupo_prod and '
      + ' p3.cod_prod = c2.cod_prod and p3.cod_empresa = c2.cod_empresa '
      + ' left join colaborador c1 on c1.cod_vendedor = c2.cod_vendedor and '
      + ' c1.cod_empresa = c2.cod_empresa '
      + ' where p3.ativo = 1 and c2.data_pedido >= :dataini and c2.data_pedido <= :datafim and c2.sit_atd =''NT'' '
      + ' and c2.cod_empresa = :cod_empresa ');
    if not frmControleAlmoxarifado.CheckBox1.Checked then
    begin
      relRelacAtend.SQL.Add(' and c2.cod_vendedor = :cod_vendedor');

      relRelacAtend.ParamByName('cod_vendedor').AsInteger :=
        Usuario.dataSet.FieldByName('cod_vendedor').AsInteger;
    end;
  end; 
  vOrdem := '';
  if Trim(frmControleAlmoxarifado.ComboBox4.Text) = 'CODIGO' then
    vOrdem := ' order by 2'
  else if Trim(frmControleAlmoxarifado.ComboBox4.Text) = 'DESCRICAO' then
    vOrdem := ' order by 3'
  else if Trim(frmControleAlmoxarifado.ComboBox4.Text) = 'LOCACAO1' then
    vOrdem := ' order by 12'
  else if Trim(frmControleAlmoxarifado.ComboBox4.Text) = 'LOCACAO2' then
    vOrdem := ' order by 13';
  relRelacAtend.SQL.Text := relRelacAtend.SQL.Text + vOrdem;

  relRelacAtend.ParamByName('dataini').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit1.Text);
  relRelacAtend.ParamByName('datafim').AsDate := StrToDate(frmControleAlmoxarifado.MaskEdit2.Text);
  relRelacAtend.ParamByName('sit_atd').AsString := frmControleAlmoxarifado.ComboBox2.Text;
  relRelacAtend.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  relRelacAtend.Open;
  relRelacAtend.FetchAll;
  frmControleAlmoxarifado.qkRRelacAtend.Preview;

end;

function TEstoqueFechado._abrecontroleAlmoxarifado(pcod_vendedor: Integer;
  psit_atd: string; tipo: string = ''): Boolean;
var
 vSql: string;
  begin
  if UpperCase(Trim(tipo)) = 'CODPEDIDO' then
   vSql := ' order by c.cod_pedido '
  else if UpperCase(Trim(tipo)) = 'DESCRPROD' then
   vSql := ' order by c.descr_prod '
  else if UpperCase(Trim(tipo)) = 'LOCACAO1' then
   vSql := ' order by pr.locacao_prod '
  else if UpperCase(Trim(tipo)) = 'LOCACAO2' then
   vSql := ' order by pr.locacao_prod_1 '
  else
   vSql := ' order by c.sit_atd ';


  if UpperCase(trim(psit_atd)) = 'NT' then
  begin
    Result := montaSelect(' select c.*, cl.nome_cliente, pr.locacao_prod, pr.locacao_prod_1, cp.desc_cond_pag  from controle_almoxarifado c '
      + ' left join cond_pag cp on cp.cod_cond_pag = c.cod_cond_pag '
      + ' left join clientes cl on cl.cod_cliente = c.cod_cliente and cl.cod_empresa = c.cod_empresa '
      + ' left join produtos pr on pr.grupo_prod = c.grupo_prod and pr.cod_prod = c.cod_prod and pr.cod_empresa = c.cod_empresa '
      + ' where c.cod_vendedor = ' + IntToStr(pcod_vendedor) + ' and c.sit_atd =''NT'' '
      + ' and c.cod_empresa = ' + vDadosIni.codEmpresa + ' and cod_reserva is null ' + vSql);
  end
  else 
  begin
    Result := montaSelect(' select c.*, cl.nome_cliente, pr.locacao_prod, pr.locacao_prod_1, cp.desc_cond_pag  from controle_almoxarifado c '
      + ' inner join cond_pag cp on cp.cod_cond_pag = c.cod_cond_pag '
      + ' left join clientes cl on cl.cod_cliente = c.cod_cliente and cl.cod_empresa = c.cod_empresa '
      + ' left join produtos pr on pr.grupo_prod = c.grupo_prod and pr.cod_prod = c.cod_prod and pr.cod_empresa = c.cod_empresa '
      + ' where c.cod_vendedor = ' + IntToStr(pcod_vendedor) + ' and ((c.sit_atd =''AT'') or (c.sit_atd =''DV'')) '
      + ' and c.cod_empresa = ' + vDadosIni.codEmpresa + ' and cod_reserva is null ' + vSql);
  end;
end;

function TEstoqueFechado._abrecontroleVendedor(pcod_vendedor: Integer): Boolean;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Result := montaSelect(' select c.*, cl.nome_cliente, pr.locacao_prod, pr.locacao_prod_1, cp.desc_cond_pag  from controle_almoxarifado c '
      + ' inner join cond_pag cp on cp.cod_cond_pag = c.cod_cond_pag'
      + ' left join clientes cl on cl.cod_cliente = c.cod_cliente and cl.cod_empresa = c.cod_empresa '
      + ' left join produtos pr on pr.grupo_prod = c.grupo_prod and pr.cod_prod = c.cod_prod and pr.cod_empresa = c.cod_empresa '
      + ' where c.cod_vendedor = ' + IntToStr(pcod_vendedor) + ' and c.cod_empresa = ' + vDadosIni.codEmpresa
      + ' and cod_reserva is null '
      + ' order by c.cod_pedido');
end;

function TEstoqueFechado._abreEstF(pCodigo, pNitem: Integer): Boolean;
begin
   Result := montaSelect(' select c.*, cl.nome_cliente, pr.locacao_prod, pr.locacao_prod_1, cp.desc_cond_pag  from controle_almoxarifado c '
      + ' inner join cond_pag cp on cp.cod_cond_pag = c.cod_cond_pag'
      + ' left join clientes cl on cl.cod_cliente = c.cod_cliente and cl.cod_empresa = c.cod_empresa '
      + ' left join produtos pr on pr.grupo_prod = c.grupo_prod and pr.cod_prod = c.cod_prod and pr.cod_empresa = c.cod_empresa '
      + ' where c.cod_pedido = ' + IntToStr(pCodigo) + ' and c.nitem = ' + IntToStr(pNitem)
      + ' and c.cod_empresa = ' + vDadosIni.codEmpresa
      + ' and coalesce(c.cod_reserva, 0) > 0');
   Result := not dataSet.IsEmpty;
end;

function TEstoqueFechado._abreFormAlmoxarifadoOrdenarRel: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 321;
    formulario.Height := 252;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Ordenar por:';
    frmControleAlmoxarifado.pnAlmoxarifadoOrdenarRel.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    frmControleAlmoxarifado.BitBtn20.Visible := vDadosIni.vEmp.vClienteAlmox = 'S';
    formulario.OnKeyDown := frmControleAlmoxarifado.FormKeyDownRelatorio;
    result := (formulario.ShowModal = mrOk);
  finally
    frmControleAlmoxarifado.pnAlmoxarifadoOrdenarRel.Parent := frmControleAlmoxarifado.tsOrdenarRel;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TEstoqueFechado._ControleAlmoxarifado(pTipoForm: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Controle de Peças Almoxarifado');
    if dtmEstoqueFechado = nil then
      dtmEstoqueFechado := TdtmEstoqueFechado.Create(dtmEstoqueFechado);

    vDadosIni.vTipoForm := pTipoForm;

    if vDadosIni.vEmp.vAlmox <> 'S2' then
    begin
      Application.MessageBox('Empresa não configurada para Usar Controle de Estoque Fechado S2!',
        'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

//    if _mdiAberto('TFrmCadPedVenda') then
    if not vDadosIni._mdiAberto('pkPedidoVenda', 'TFrmCadPedVendaEST', 'NAME') then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('VND149', 'ABRIR', '', 'CONTROLE_ALMOXARIFADO', '',
      dtmEstoqueFechado.qrBuscas, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    vDadosIni.vPesquisa := 'ALMOXARIFADO';

    if frmControleAlmoxarifado = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmControleAlmoxarifado, frmControleAlmoxarifado);
    end;

    if (pTipoForm > 0) and (not frmControleAlmoxarifado.Visible) then
      frmControleAlmoxarifado.ShowModal
    else if (not frmControleAlmoxarifado.Visible) then
      frmControleAlmoxarifado.Show
    else if frmControleAlmoxarifado.FormStyle = fsMDIChild then
      frmControleAlmoxarifado.Show
    else
      frmControleAlmoxarifado.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TEstoqueFechado._ControleVendedor(pTipoForm: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Controle de Peças por Vendedor');
    if dtmEstoqueFechado = nil then
      dtmEstoqueFechado := TdtmEstoqueFechado.Create(dtmEstoqueFechado);

    vDadosIni.vTipoForm := pTipoForm;

    if vDadosIni.vEmp.vAlmox <> 'S2' then
    begin
      Application.MessageBox('Empresa não configurada para Usar Controle de Estoque Fechado S2!',
        'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

//    if _mdiAberto('TFrmCadPedVenda') then
    if not vDadosIni._mdiAberto('pkPedidoVenda', 'TFrmCadPedVendaEST', 'NAME') then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('VND141', 'ABRIR', '', 'CONTROLE_ALMOXARIFADO', '',
      dtmEstoqueFechado.qrBuscas, true) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    vDadosIni.vPesquisa := 'VENDEDOR';

    if frmControleAlmoxarifado = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmControleAlmoxarifado, frmControleAlmoxarifado);
    end;

    if (pTipoForm > 0) and (not frmControleAlmoxarifado.Visible) then
      frmControleAlmoxarifado.ShowModal
    else if (not frmControleAlmoxarifado.Visible) then
      frmControleAlmoxarifado.Show
    else if frmControleAlmoxarifado.FormStyle = fsMDIChild then
      frmControleAlmoxarifado.Show
    else
      frmControleAlmoxarifado.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TEstoqueFechado._desmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  dataSet.FieldByName('SEL').AsString := '';
  dataSet.Post;
end;

procedure TEstoqueFechado._desmarcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('SEL').AsString := '';
      dataSet.Post;
      
      dataSet.Next;
    end;
    dataSet.First;

  finally
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TEstoqueFechado._efetuarSoma;
var
  vSomaNAtent, vSomaAtent, vSomaNSelec, vSomaDev: Extended;
  vPointer: Pointer;
begin
  vSomaNAtent := 0;
  vSomaAtent := 0;
  vSomaNSelec := 0;
  vSomaDev := 0;

  vPointer := dataSet.GetBookmark;

  dataSet.first;
  while not dataSet.Eof do
  begin
    if ((dataSet.FieldByName('SEL').AsString = 'S') and (Trim(dataSet.FieldByName('sit_atd').AsString) = 'NT')) then
      vSomaNAtent := vSomaNAtent + dataSet.FieldByName('VLTOT').AsFloat
    else if ((dataSet.FieldByName('SEL').AsString = 'S') and (Trim(dataSet.FieldByName('sit_atd').AsString) = 'AT')) then
      vSomaAtent := vSomaAtent + dataSet.FieldByName('VLTOT').AsFloat
    else if ((dataSet.FieldByName('SEL').AsString = 'S') and (Trim(dataSet.FieldByName('sit_atd').AsString) = 'DV')) then
      vSomaDev := vSomaDev + dataSet.FieldByName('VLTOT').AsFloat
    else if dataSet.FieldByName('SEL').AsString = '' then
      vSomaNSelec := vSomaNSelec + dataSet.FieldByName('VLTOT').AsFloat;
    dataSet.next;
  end;
  dataSet.first;

  Application.MessageBox(pchar(
    'Valor Total dos Pedidos Não atendidos.......: ' + format('%m', [vSomaNAtent])
    + #13 + 'Valor Total dos Pedidos atendidos................: ' + format('%m', [vSomaAtent])
    + #13 + 'Valor Total dos Pedidos Não selecionados..: ' + format('%m', [vSomaNSelec])
    + #13 + 'Valor Total dos Pedidos Devolvidos........: ' + format('%m', [vSomaDev])), 'Anteção', 0 + 64);

  dataSet.GotoBookmark(vPointer);

end;

function TEstoqueFechado._existeDAV: boolean;
var
  aux: string;
begin
  Result := true;

  dataSet.First;
  while not dataSet.Eof do
  begin
    if ((dataSet.FieldByName('SEL').AsString = 'S') and (not dataSet.FieldByName('NDOC').IsNull)) then
    begin
      if Trim(dataSet.FieldByName('TPDOC').AsString) = 'OS' then
        aux := 'Ordem de serviço'
      else if Trim(dataSet.FieldByName('TPDOC').AsString) = 'REQ' then
        aux := 'Requisição de Venda';

      if Application.MessageBox(pchar('Um ou Mais pedidos selecionados foram mesclados ou destinados para ' + aux + ' número ' +
        dataSet.FieldByName('NDOC').AsString + ', Deseja continuar assim mesmo!'), 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
      begin
        Result := true;
        Break
      end
      else
      begin
        Result := false;
        exit;
      end;
    end;
    Next;
  end;
end;

function TEstoqueFechado._existeProduto(vValorConsulta: string): Boolean;
var
  vAcao: string;
  vQtde: Double;
begin
  Result := False;

  if dataSet.State = dsEdit then
    vAcao := 'ALTERAR'
  else if dataSet.State = dsInsert then
    vAcao := 'INCLUIR'
  else
    Exit;

  if not Produto._buscaProduto(vValorConsulta, True) then
  begin
    exit;
  end;
end;

procedure TEstoqueFechado._marcaDesmarcaLinha;
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

procedure TEstoqueFechado._marcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TEstoqueFechado._marcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('SEL').AsString := 'S';
      dataSet.Post;

      dataSet.Next;
    end;
    dataSet.First;

  finally
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TEstoqueFechado._mdiAberto(pNomeFormMDI: string): Boolean;
var
  x: Byte;
begin
  Result := False;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := True;
        Application.MessageBox('Venda ja esta aberta, feche a janela da venda para utilizar esta funcionalidade', 'Atenção', 64);
        Exit;
      end;
end;

procedure TEstoqueFechado._obterCasasDecimais;
begin
  buscas.Close;
  buscas.SQL.Text := ' select casas_decimais from empresa  where cod_empresa =' + vDadosIni.codEmpresa;
  buscas.Open;

  vCasasDecimais := buscas.FieldByName('casas_decimais').AsString;
end;

function TEstoqueFechado._selecionarItensControledePecas: boolean;
var
  NItem: Integer;
begin
  try
    vDadosIni.vDtSetTmp := TClientDataSet(dtmEstoqueFechado.cdsEstoqueFechado);

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;

end;

function TEstoqueFechado._verificaSelecao: Boolean;
var
  vListaTemp, vListaTemp2: TStringList;
  vTemp: string;
  i: Integer;
  vboolCliente: Boolean;
  vboolDocumento: Boolean;
begin
  try
    vListaTemp := TStringList.Create;
    vListaTemp2 := TStringList.Create;
    vListaTemp.Sorted := true;
    vListaTemp2.Sorted := true;
    vboolCliente := true;
    vboolDocumento := true;

    dataSet.first;
    while not dataSet.Eof do
    begin
       if ((dataSet.FieldByName('SEL').AsString = 'S') and (dataSet.FieldByName('SIT_ATD').AsString = 'AT')) then
       begin
           if dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
             if (vListaTemp.IndexOf(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger)) <= 0) then
               vListaTemp.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
           if dataSet.FieldByName('NDOC').AsInteger > 0 then
             if (vListaTemp2.IndexOf(IntToStr(dataSet.FieldByName('NDOC').AsInteger) + '|' + trim(dataSet.FieldByName('TPDOC').AsString)) <= 0) then
               vListaTemp2.Add(IntToStr(dataSet.FieldByName('NDOC').AsInteger) + '|' + trim(dataSet.FieldByName('TPDOC').AsString) + '|');
       end;
       dataSet.next;
    end;
    dataSet.first;                

    if vListaTemp.Count >= 2 then
    begin
      vboolCliente := false;
      vTemp := 'Clientes: ';
      for i := 0 to vListaTemp.Count - 1 do
         vTemp := vTemp + vListaTemp[i] + ', ';
      vTemp := Copy(vTemp, 0, Length(vTemp) - 2);

      if Application.MessageBox(PChar('Existem produtos selecionados para clientes diferentes, Deseja assim continuar mesmo?' + #13 + #13 + vTemp),
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
        Exit;

      if not vDadosIni.PesqPros('VND165', 'PERMITIR', UpperCase(vTemp), 'CONTROLE_ALMOXARIFADO',
      '', buscas, true) then
         Exit;

      vboolCliente := true;
    end;
    if vListaTemp2.Count >= 2 then
    begin
      vboolDocumento := false;
      vTemp := 'Documentos: ';
      for i := 0 to vListaTemp2.Count - 1 do
         vTemp := vTemp + vDadosIni.getCampoPipe(vListaTemp2[i], 2) + ' ' + vDadosIni.getCampoPipe(vListaTemp2[i], 1) + ', ';
      vTemp := Copy(vTemp, 0, Length(vTemp) - 2);

      if Application.MessageBox(PChar('Existem produtos selecionados para documentos diferentes, Deseja assim continuar mesmo?' + #13 + #13 + vTemp),
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
        Exit;

      if not vDadosIni.PesqPros('VND165', 'PERMITIR', UpperCase(vTemp), 'CONTROLE_ALMOXARIFADO',
      '', buscas, true) then
         Exit;
      vboolDocumento := true;
    end;

    Result := vboolCliente and vboolDocumento;
  finally

  end;
end;

{ TUsuario }

constructor TVendedorControlePecas.create;
begin
  dataSet := TClientDataSet(dtmEstoqueFechado.cdsUsuario);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);
  buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);
end;

function TVendedorControlePecas._abreTodosVendedor: Boolean;
begin
  Result := montaSelect('select c.cod_vendedor, c.nome_vendedor, f.desc_funcao from colaborador c'
    + ' inner join funcoes f on f.cod_funcao = c.cod_funcao'
    + ' where c.cod_empresa = ' + vDadosIni.codEmpresa + ' and c.ativo = 1 and f.desc_funcao like ''%VENDEDOR%''');
end;

{ TCondPagamento }

constructor TCondPagamentoPecas.create;
begin
  dataSet := TClientDataSet(dtmEstoqueFechado.cdsCondPagamento);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);
  buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);
end;

function TCondPagamentoPecas._abreTodosCondPagamento: Boolean;
begin
  Result := montaSelect(' select cond_pag.cod_cond_pag, cond_pag.desc_cond_pag, cond_pag.seqpreco from cond_pag ' +
  	' inner join cond_pag_empresa on ' +
    '   cond_pag_empresa.cod_cond_pag = cond_pag.cod_cond_pag ' +
    '   and cond_pag_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
    ' where cond_pag.ativo = 1 ' +
    ' order by cond_pag.cod_cond_pag ');
end;

{ TTipoVenda }

constructor TTipoVendaControlePecas.create;
begin
  dataSet := TClientDataSet(dtmEstoqueFechado.cdsTipoVenda);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);
  buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);
end;

function TTipoVendaControlePecas._abreTodosTipoVenda: Boolean;
begin
  Result := montaSelect('select v.cod_tipo, v.sigla, v.descricao from tipo_vendas v where v.tipo =''REQ''  and v.venda =''S''');
end;

{ TMecanicoControlePecas }

constructor TMecanicoControlePecas.create;
begin
  dataSet := TClientDataSet(dtmEstoqueFechado.cdsMecanico);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);
  buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);
end;

function TMecanicoControlePecas._abreMecanico(pCodMecanico: Integer): Boolean;
begin
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
    result := montaSelect('SELECT C.*,F.desc_funcao, F.tpdocs_vnd FROM COLABORADOR C' +
      ' INNER JOIN funcoes F ON F.cod_funcao  = C.cod_funcao' +
      ' WHERE C.cod_empresa = ' + vDadosIni.codEmpresa + ' AND C.ativo = 1 ' +
      ' and ((f.desc_funcao like ''%TECNICO%'') or (f.desc_funcao like ''%TÉCNICO%''))' +
      ' and c.cod_vendedor =' + IntToStr(pCodMecanico))
  else
    result := montaSelect('SELECT C.*,F.desc_funcao, F.tpdocs_vnd FROM COLABORADOR C' +
      ' INNER JOIN funcoes F ON F.cod_funcao  = C.cod_funcao' +
      ' WHERE C.cod_empresa = ' + vDadosIni.codEmpresa + ' AND C.ativo = 1 ' +
      ' and ((f.desc_funcao like ''%MECANICO%'') or (f.desc_funcao like ''%MECÂNICO%''))' +
      ' and c.cod_vendedor =' + IntToStr(pCodMecanico));

  if dataSet.IsEmpty then
    result := false;
end;

{ TProdutoConsulta }

constructor TProdutoConsulta.create;
begin
  DataSet := TClientDataSet(dtmEstoqueFechado.cdsProd);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);
  Buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);

  fCamposProduto := 'p.grupo_prod, p.cod_prod, p.num_fab_prod, p.descr_prod, p.prec_cus_prod, p.prec_cusm_prod, p.tipo_item, p.unidade, p.peso_brut_prod, ' +
  	' coalesce(est.estoque, 0) estoque_disponivel, coalesce(est.est_prima, 0) estoque_produzir ';
end;

function TProdutoConsulta._buscaProduto(pValorConsulta: string;
  pShowErro: Boolean): Boolean;
var
  vAbrirTelaEscolha: Boolean;
begin
  pValorConsulta := Trim(pValorConsulta);
  vAbrirTelaEscolha := False;

  try
    if not _verificarSinal(pValorConsulta) then
    begin
      Result := false;
      exit;
    end;

    if Trim(pValorConsulta) = '' then
      raiseExceptionCreate('Informe o Código do Produto ou aperte F3 para utilizar a pesquisa', '');

    pValorConsulta := pNumFab;

    if EstoqueFechado.CodBarra._selecionaProduto(pValorConsulta) then
    begin
//      if EstoqueFechado.CodBarra.dataSet.RecordCount > 1 then
//      begin
//        if not _selecionaProdutosInnerCodBarra(pValorConsulta) then
//          raiseExceptionCreate('Erro ao efetuar pesquisa de produtos', '');
//        vAbrirTelaEscolha := True;
//      end
//      else
        if not _selecionaProdutos(EstoqueFechado.CodBarra.dataSet.FieldByName('grupo_prod').AsInteger,
          EstoqueFechado.CodBarra.dataSet.FieldByName('cod_prod').AsString) then
          raiseExceptionCreate('Produto não encontrado com o código informado', '');
    end;
    if EstoqueFechado.CodBarra.dataSet.IsEmpty then
    begin
      dataSet.Filtered := False;
      montaSelect('select ' + fCamposProduto + ' from produtos p ' +
      	' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
      	' where p.descr_prod like ' + QuotedStr(pValorConsulta + '%') +
        ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa +
        fConsultaAdicional);

      if dataSet.IsEmpty then
        raiseExceptionCreate('Produto não encontrado com o código informado', '');

//      if dataSet.RecordCount > 1 then
//        vAbrirTelaEscolha := True;
    end;

    if vAbrirTelaEscolha then
      if vDadosIni._abreFormEscolhaProdutosIni(dataSet) then
      begin
        _selecionaProdutos(dataSet.FieldByName('grupo_prod').AsInteger,
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

function TProdutoConsulta._selecionaProdutos(pGrupoProd: Integer;
  pCodProd: string): Boolean;
var
 SqlAdicional: string;
begin
  dataSet.Filtered := False;
  SqlAdicional := '';
  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO283', 'CONSULTAR', '', 'PRODUTOS', '', buscas) then
    SqlAdicional := SqlAdicional + ' AND COALESCE(PRODUTOS.CONSUMO, ''N'') <> ''S'' ';
  montaSelect('select ' + fCamposProduto + ' from produtos p' +
  	' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
    ' where p.grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and p.cod_prod = ' + QuotedStr(pCodProd) +
    ' and p.ativo = 1 and p.cod_empresa = ' + vDadosIni.codEmpresa + fConsultaAdicional);
  Result := not dataSet.IsEmpty;
end;

function TProdutoConsulta._selecionaProdutosInnerCodBarra(
  pValorConsulta: string): Boolean;
begin
  dataSet.Filtered := False;
  Result := montaSelect('select ' + fCamposProduto + ' from produtos p' +
    ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
    ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
    ' where cod_barra = ' + QuotedStr(pValorConsulta) +
    ' and cb.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cb.ativo = 1 ' + fConsultaAdicional);
  Result := not dataSet.IsEmpty;
end;

function TProdutoConsulta._verificarSinal(codBarra: string): Boolean;
var
  temp, nBarra: string;
  nQuant: Double;
  j: Integer;
  i: Integer;
begin
      //Validando codigo de barras
  Result := false;

  nQuant := 0;
  j := 0;
  for i := 1 to length(codBarra) do
    if (Copy(codBarra, I, 1) = '*') {or (Copy(UpperCase(codBarra), I, 1) = 'X')} then
    begin
      inc(j);
      if j >= 2 then
      begin
        Application.MessageBox('Quantidade Invalida. Dois ou mais sinais de multiplicação',
          'Atenção', MB_ICONWARNING + MB_OK);
        exit;
      end;
    end;
  for i := 1 to length(codBarra) do
    if (Copy(codBarra, I, 1) = '*') then // or (Copy(UpperCase(codBarra), I, 1) = 'X') then
    begin
      try
        nQuant := strtofloat(copy(codBarra, 1, I - 1));
      except
        Application.MessageBox(pchar('Quantidade Invalida'), 'Informação', MB_ICONINFORMATION
          + mb_OK);
        exit;
      end;
      nBarra := COPY(codBarra, I + 1, 20);
      if nQuant <= 0 then
        raiseExceptionCreate('Quantidade deve ser maior que zero', '');
    end;
  if nQuant = 0 then
  begin
    nQuant := 1;
    nBarra := codBarra;
  end;
  codBarra := nBarra;

  pNumFab := codBarra;
  pQuant := nQuant;

  Result := true;
end;

{ TCodBarraConsulta }

constructor TCodBarraConsulta.create;
begin
  DataSet := TClientDataSet(dtmEstoqueFechado.cdsCodBarra);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);
  Buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);
end;

function TCodBarraConsulta._selecionaProduto(pCodBarra: string): boolean;
begin
  Result := montaSelect('select cb.* from cod_barra cb' +
    ' inner join produtos p on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod' +
    ' and p.cod_empresa = cb.cod_empresa and p.ativo = 1' +
    ' where cod_barra = ' + QuotedStr(pCodBarra) +
    ' and cb.ativo = 1 and cb.cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

{ TClienteControlePecas }

constructor TClienteControlePecas.create;
begin
  dataSet := TClientDataSet(dtmEstoqueFechado.cdsCliente);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);
  buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);
end;

function TClienteControlePecas._abreCliente(cod: integer): Boolean;
begin
  Result := montaSelect('SELECT COD_CLIENTE, NOME_CLIENTE, TIPVCLIENTE, COD_LOCALIDADE, COD_CIDADE, CAMP_PR_VENDA, COD_TAB_PRECO FROM CLIENTES ' +
    ' WHERE COD_CLIENTE = ' + IntToStr(cod) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
end;

{ TReserva }

constructor TReserva.create;
begin
  if dtmEstoqueFechado = nil then
    dtmEstoqueFechado := TdtmEstoqueFechado.Create(dtmEstoqueFechado);
  dataSet := TClientDataSet(dtmEstoqueFechado.cdsReserva);
  buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);

  ReservaItens := TReservaItens.create;
end;

procedure TReserva.datasetReservaItensAfterScroll(DataSet: TDataSet);
begin
  ReservaItens._abreReservasItens(DataSet.FieldByName('CODIGO').AsInteger);
end;

function TReserva.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('VND207', 'EXCLUIR', '', 'RESERVA_ALMOXARIFADO',
    dataSet.FieldByName('CODIGO').AsString, buscas, false) then
     Exit;

  vCodFormula := dataSet.FieldByName('CODIGO').AsString;

  if Application.MessageBox(PChar('Deseja excluir reserva: '
   + IntToStr(dataSet.FieldByName('CODIGO').AsInteger)
   + ' - ' + trim(dataSet.FieldByName('DESCRICAO').AsString) +'?'),
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  if ExecutaComandosSql('select first 1 codigo from reserva_almoxarifado_itens ' +
    ' where codigo = ' + IntToStr(dataSet.FieldByName('CODIGO').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa) then
  begin
    if Application.MessageBox('Produto(s) encontrado(s) com pendência(s) vinculado a essa reserva, ' +
     ' o sistema vai excluir esse(s) produto(s). Deseja continuar mesmo assim?',
      'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
    Exit;
  end;

  if ExecutaComandosSql('select first 1 cod_pedido from controle_almoxarifado ' +
    ' where cod_reserva = ' + IntToStr(dataSet.FieldByName('CODIGO').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa) then
  begin
    if Application.MessageBox('Produto(s) sem atendimento vinculado a essa reserva, ' +
     ' o sistema vai retirar o vínculo com esse(s) produto(s). Deseja continuar mesmo assim?',
      'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
    Exit;
  end;

  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('VND207', 'EXCLUIR', 'SUCESSO', 'RESERVA_ALMOXARIFADO', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('VND207', 'EXCLUIR', 'FALHA', 'RESERVA_ALMOXARIFADO', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

destructor TReserva.destroy;
begin
  ReservaItens.Free;
  ReservaItens := nil;
  inherited;
end;

function TReserva.edit: boolean;
var
 vObsReserva: string;
begin
  Result := False;
  if not vDadosIni.PesqPros('VND206', 'ALTERAR', '', 'RESERVA_ALMOXARIFADO',
    '', buscas, false) then
    Exit;

  vObsReserva := UpperCase(dataSet.FieldByName('DESCRICAO').AsString);
  if not InputQuery('Atenção', 'Obs.: Informe a descrição da lista de reserva:', vObsReserva) then
    exit;

  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('DESCRICAO').AsString := UpperCase(vObsReserva);
  end;
end;

function TReserva.Insert: boolean;
var
 vObsReserva: string;
begin
  if not vDadosIni.PesqPros('VND205', 'INCLUIR', '', 'RESERVA_ALMOXARIFADO',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect('select * from reserva_almoxarifado ' +
      ' where codigo = 0 and cod_empresa = 0');
  vObsReserva := UpperCase('RESERVA ' + FormatDateTime('dd/mm/yyyy', vDadosIni.getDataBanco(buscas)));
  if not InputQuery('Atenção', 'Obs.: Informe a descrição da lista de reserva:', vObsReserva) then
    exit;
  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('CODIGO').AsInteger := Gencodigo('RESERVA_ALMOXARIFADO', dtmEstoqueFechado.SpIncCodigo, vDadosIni.codEmpresa);
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('DATA').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('HORA').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas));
    dataSet.FieldByName('DESCRICAO').AsString := UpperCase(vObsReserva);
    dataSet.FieldByName('ATIVO').AsFloat := 1;
  end;
end;

function TReserva.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('VND214', 'SALVAR', '', 'RESERVA_ALMOXARIFADO',
      dataSet.FieldByName('CODIGO').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('DESCRICAO').AsString) = '' then
      raiseExceptionCreate('Descrição deve ser informado', 'DBEdit2');

    if acao = 'INSERIR' then
    begin
//      dataSet.FieldByName('CODIGO').AsInteger :=
//        Gencodigo('RESERVA_ALMOXARIFADO', dtmEstoqueFechado.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if (ReservaItens.DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := ReservaItens.Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VND214', acao, 'SUCESSO', 'RESERVA_ALMOXARIFADO',
        dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VND214', acao, 'FALHA', 'RESERVA_ALMOXARIFADO',
        dataSet.FieldByName('CODIGO').AsString, buscas);

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

function TReserva._abreFormEscolhaReserva(pCodVendedor: Integer;
  datasetAlmox: TClientDataSet): boolean;
var
  formulario: TfrmPadrao;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 529;
    formulario.Height := 120;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Reservar Produto';
    frmControleAlmoxarifado.pnEscolha.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    frmControleAlmoxarifado.Panel18.Caption := 'Deseja adicionar '
     + FloatToStr(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat) + ' produto(s):';
    formulario.OnKeyDown := frmControleAlmoxarifado.FormKeyDownEscolha;
    ReservaItens.dtSetAlmox := datasetAlmox;
    _abreReservas(pCodVendedor);
    result := (formulario.ShowModal = mrOk);
  finally
    if not Result then
      RollBackTransacao;
    frmControleAlmoxarifado.pnEscolha.Parent := frmControleAlmoxarifado.tsEscolha;
    formulario.Free;
    formulario := nil;
  end;
end;

function TReserva._abreFormReserva(pCodVendedor: Integer; datasetAlmox: TClientDataSet): boolean;
var
  formulario: TfrmPadrao;
  vnomevendedor: string;  
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    vnomevendedor := Trim(retornaValor(' select coalesce(nome_vendedor, '''') valor from colaborador ' +
      ' where cod_vendedor = ' + IntToStr(pCodVendedor) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 783;
    formulario.Height := 239;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Reservas: ' + UpperCase(trim(vnomevendedor));
    frmControleAlmoxarifado.pnReserva.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    formulario.OnKeyDown := frmControleAlmoxarifado.FormKeyDownReserva;
    ReservaItens.dtSetAlmox := datasetAlmox;
    _abreReservas(pCodVendedor);
    frmControleAlmoxarifado.DBGrid6.DataSource := ReservaItens.dtSource;
    if ReservaItens.dtAlmoxSource = nil then
      ReservaItens.dtAlmoxSource := TDataSource.Create(nil);
    ReservaItens.dtAlmoxSource.DataSet := datasetAlmox;
    frmControleAlmoxarifado.DBGrid7.DataSource := ReservaItens.dtAlmoxSource;
    dataSet.AfterScroll := datasetReservaItensAfterScroll;
    result := (formulario.ShowModal = mrOk);
  finally
//    ReservaItens.dtSetAlmox.Filtered := false;
    dataSet.AfterScroll := nil;
    frmControleAlmoxarifado.BitBtn7.Click;
    frmControleAlmoxarifado.pnReserva.Parent := frmControleAlmoxarifado.tsReserva;
    formulario.Free;
    formulario := nil;
  end;
end;

function TReserva._abreFormReservaExistentes: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 783;
    formulario.Height := 239;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Reservas';
    frmControleAlmoxarifado.pnReservasExistentes.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    formulario.OnKeyDown := frmControleAlmoxarifado.FormKeyDownReservasExistentes;
    dataSet.AfterScroll := datasetReservaItensAfterScroll;
    result := (formulario.ShowModal = mrOk);
  finally
//    ReservaItens.dtSetAlmox.Filtered := false;
    dataSet.AfterScroll := nil;
    frmControleAlmoxarifado.BitBtn7.Click;
    frmControleAlmoxarifado.pnReservasExistentes.Parent := frmControleAlmoxarifado.tsEscolha;
    formulario.Free;
    formulario := nil;
  end;
end;

function TReserva._abreReservas(pCodVendedor: Integer): Boolean;
begin
 Result := montaSelect(' select * from reserva_almoxarifado ' +
  ' where cod_vendedor = ' + IntToStr(pCodVendedor) +
  ' and cod_empresa = ' + vDadosIni.codEmpresa +
  ' order by codigo');

 if not dataSet.IsEmpty then
   ReservaItens._abreReservasItens(dataSet.FieldByName('CODIGO').AsInteger)
 else
   ReservaItens._abreReservasItens(0);
end;

{ TReservaItens }

function TReservaItens.AddItemReserva(reserva: TReserva): boolean;
var
 acao: string;
begin
  try
    Result := false;
    acao := 'ADICIONAR';
    if reserva.IsEmpty then
    begin
      Application.MessageBox('Nenhum reserva selecionada!', 'Atenção', MB_OK);
      exit;
    end;

    if not vDadosIni.PesqPros('VND208', acao, '', 'RESERVA_ALMOXARIFADO',
      reserva.dataSet.FieldByName('CODIGO').AsString, buscas, true) then
     Exit;

    dtSetAlmox.Filter := ' SEL = ''S'' AND SIT_ATD = ''NT'' AND COD_RESERVA IS NULL ';
    dtSetAlmox.Filtered := true;

    if dtSetAlmox.IsEmpty then
    begin
      Application.MessageBox('Nenhum item selecionado!', 'Atenção', MB_OK);
      exit;
    end;

    Result := true;

    dtSetAlmox.First;
    while not dtSetAlmox.Eof do
    begin
      if dtSetAlmox.FieldByName('SEL').AsString = 'S' then
      begin
        if verificarRegistrodtSetAlmox then
        begin
          buscas.Close;
          buscas.SQL.Text := ' UPDATE CONTROLE_ALMOXARIFADO SET COD_RESERVA = :COD_RESERVA ' +
           ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA ';
          buscas.ParamByName('COD_RESERVA').AsInteger := reserva.dataSet.FieldByName('CODIGO').AsInteger;
          buscas.ParamByName('COD_PEDIDO').AsInteger := dtSetAlmox.FieldByName('COD_PEDIDO').AsInteger;
          buscas.ParamByName('NITEM').AsInteger := dtSetAlmox.FieldByName('NITEM').AsInteger;
          buscas.ParamByName('COD_EMPRESA').AsInteger := dtSetAlmox.FieldByName('COD_EMPRESA').AsInteger;
          try
            buscas.ExecSQL;
            vDadosIni.GravaAuditoria('VND208', acao, 'Grupo Prod ' + IntToStr(dtSetAlmox.FieldByName('GRUPO_PROD').AsInteger) +
              ' Cod Prod ' + trim(dtSetAlmox.FieldByName('COD_PROD').AsString) +
              ' Cod Grade ' + IntToStr(dtSetAlmox.FieldByName('COD_GRADE').AsInteger) +
              ' Quant ' + FloatToStr(dtSetAlmox.FieldByName('QUANT').AsFloat), 'RESERVA_ALMOXARIFADO',
            reserva.dataSet.FieldByName('CODIGO').AsString, buscas)
          except on E: Exception do
           begin
            Result := False;
            Application.MessageBox(pchar('Erro ao adicionar item a reserva - TReservaItens.AddItemReserva: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
            registraErro('TReservaItens.AddItemReserva: ' + e.Message);
            exit;
           end;
          end;
        end;
      end;
      dtSetAlmox.Next;
    end;

    if Result then
      CommitaTransacao
    else
      RollBackTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VND208', acao, 'SUCESSO', 'RESERVA_ALMOXARIFADO', reserva.dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VND208', acao, 'FALHA', 'RESERVA_ALMOXARIFADO', reserva.dataSet.FieldByName('CODIGO').AsString, buscas);
  finally
    dtSetAlmox.Filter := ' SIT_ATD = ''NT'' AND COD_RESERVA IS NULL ';
    dtSetAlmox.Filtered := true;
  end;
end;

constructor TReservaItens.create;
begin
   if dtmEstoqueFechado = nil then
    dtmEstoqueFechado := TdtmEstoqueFechado.Create(dtmEstoqueFechado);
  dataSet := TClientDataSet(dtmEstoqueFechado.cdsReservaItens);
  buscas := TIBQuery(dtmEstoqueFechado.qrBuscas);
  transacao := TIBTransaction(dtmEstoqueFechado.transacao);

  dtSet := TClientDataSet.Create(nil);
  dtSet.Close;
  dtSet.FieldDefs.Clear;
  dtSet.FieldDefs.Add('SEL', ftString, 1, false);
  dtSet.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  dtSet.FieldDefs.Add('COD_VENDEDOR', ftInteger, 0, false);
  dtSet.FieldDefs.Add('NUM_FAB_PROD', ftString, 20, false);
  dtSet.FieldDefs.Add('DESCR_PROD', ftString, 20, false);
  dtSet.FieldDefs.Add('QUANT', ftFloat, 0, false);
  dtSet.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
  dtSet.FieldDefs.Add('COD_PROD', ftString, 6, false);
  dtSet.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
  dtSet.FieldDefs.Add('DATA', ftTimeStamp, 0, false);
  dtSet.FieldDefs.Add('HORA', ftString, 8, false);
  dtSet.FieldDefs.Add('TIPV', ftString, 1, false);
  dtSet.FieldDefs.Add('CODIGO', ftInteger, 0, false);
  dtSet.FieldDefs.Add('NITEM', ftInteger, 0, false);
  dtSet.FieldDefs.Add('COD_PEDIDO', ftInteger, 0, false);
  dtSet.FieldDefs.Add('ORDEM', ftInteger, 0, false);
  dtSet.FieldDefs.Add('DATA_VER', ftTimeStamp, 0, false);
  dtSet.FieldDefs.Add('LIBTRAVA', ftString, 1, false);
  dtSet.FieldDefs.Add('DATA_LIBTRAVA', ftTimeStamp, 0, false);
  dtSet.FieldDefs.Add('QTDE_LIBTRAVA', ftInteger, 0, false);

  if dtSet.Tag = 0 then
  try
    dtSet.CreateDataSet;
    dtSet.Tag := 1;
    dtSet.FieldByName('SEL').DisplayLabel := 'Sel';
    dtSet.FieldByName('CODIGO').DisplayLabel := 'Codigo';
    dtSet.FieldByName('NITEM').DisplayLabel := 'Nº Item';
    dtSet.FieldByName('COD_EMPRESA').DisplayLabel := 'Cod Empresa';
    dtSet.FieldByName('COD_VENDEDOR').DisplayLabel := 'Cod Vendedor';
    dtSet.FieldByName('GRUPO_PROD').DisplayLabel := 'Grupo Prod';
    dtSet.FieldByName('COD_PROD').DisplayLabel := 'Cod Prod';
    dtSet.FieldByName('NUM_FAB_PROD').DisplayLabel := 'Num Fab Prod';
    dtSet.FieldByName('DESCR_PROD').DisplayLabel := 'Descrição';
    dtSet.FieldByName('COD_GRADE').DisplayLabel := 'Cod Grade';
    dtSet.FieldByName('QUANT').DisplayLabel := 'Quant';
    dtSet.FieldByName('TIPV').DisplayLabel := 'Tipo Venda';
    dtSet.FieldByName('DATA').DisplayLabel := 'Data';
    dtSet.FieldByName('HORA').DisplayLabel := 'Hora';
    dtSet.FieldByName('COD_PEDIDO').DisplayLabel := 'Cod Pedido';
    dtSet.FieldByName('LIBTRAVA').DisplayLabel := 'Liberar Trava Venda';
    dtSet.FieldByName('DATA_LIBTRAVA').DisplayLabel := 'Data Liberação Trava';
    dtSet.FieldByName('QTDE_LIBTRAVA').DisplayLabel := 'Qtde Liberação Trava';
//    dtSet.FieldByName('CODIGO').Visible := false;
//    dtSet.FieldByName('NITEM').Visible := false;
    dtSet.FieldByName('COD_EMPRESA').Visible := false;
    dtSet.FieldByName('COD_VENDEDOR').Visible := false;
    dtSet.FieldByName('ORDEM').Visible := false;
    dtSet.FieldByName('DATA_VER').Visible := false;
//    dtSet.FieldByName('COD_PEDIDO').Visible := false;
    dtSource := TDataSource.Create(nil);
    dtSource.DataSet := dtSet;
  except
  end;

    fTempProdutos := TClientDataSet.Create(nil);
  fTempProdutos.Close;
  fTempProdutos.FieldDefs.Clear;
  fTempProdutos.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
  fTempProdutos.FieldDefs.Add('COD_PROD', ftString, 6, false);
  fTempProdutos.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
  fTempProdutos.FieldDefs.Add('EST_F', ftFloat, 0, false);
  fTempProdutos.FieldDefs.Add('DISPONIVEL', ftFloat, 0, false);
  fTempProdutos.FieldDefs.Add('ORDEM', ftInteger, 0, false);
  fTempProdutos.FieldDefs.Add('DATA_VER', ftTimeStamp, 0, false);

  if fTempProdutos.Tag = 0 then
  try
    fTempProdutos.CreateDataSet;
    fTempProdutos.Tag := 1;
  except
  end;

  fTempVendedor := TClientDataSet.Create(nil);
  fTempVendedor.Close;
  fTempVendedor.FieldDefs.Clear;
  fTempVendedor.FieldDefs.Add('COD_VENDEDOR', ftInteger, 0, false);
  fTempVendedor.FieldDefs.Add('MENSAGEM', ftString, 800, false);

  if fTempVendedor.Tag = 0 then
  try
    fTempVendedor.CreateDataSet;
    fTempVendedor.Tag := 1;
  except
  end;
end;

function TReservaItens.Delete: boolean;
var
  vCodFormula, vMens: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('CODIGO').AsString + ' - ' + dataSet.FieldByName('NITEM').AsString;
  vMens := 'Grupo Prod:' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
   ' Cod Prod: ' + trim(dataSet.FieldByName('GRUPO_PROD').AsString) +
   ' Cod Grade: ' + IntToStr(dataSet.FieldByName('COD_GRADE').AsInteger) +
   ' Quant: ' + FloatToStr(dataSet.FieldByName('QUANT').AsFloat);  

  if not vDadosIni.PesqPros('MOB004', 'EXCLUIR', vMens, 'RESERVA_ALMOXARIFADO',
    vCodFormula, buscas, false) then
     Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('MOB006', 'EXCLUIR', 'SUCESSO - ' + vMens, 'RESERVA_ALMOXARIFADO', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('MOB006', 'EXCLUIR', 'FALHA - ' + vMens, 'RESERVA_ALMOXARIFADO', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

destructor TReservaItens.destroy;
begin
  dtSet.Free;
  dtSet := nil;
  inherited;
end;

function TReservaItens.edit: boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('MOB004', 'ALTERAR', '', 'RESERVA_ALMOXARIFADO',
    '', buscas, false) then
    Exit;

  if inherited Edit then
  begin
    Result := True;
  end;
end;

function TReservaItens.Insert(reserva: TReserva): boolean;
var
 vMaxItem: Integer;
 vTemp: string;
begin
   if not vDadosIni.PesqPros('VND212', 'INCLUIR', '', 'RESERVA_ALMOXARIFADO',
    '', buscas, True) then
    Exit;

  Result := False;
  dataSet.Last;
  vMaxItem := 0;
  vTemp:= retornaValor('select coalesce(nitem,0) valor from reserva_almoxarifado_itens ' +
   ' where codigo = ' + IntToStr(reserva.dataSet.FieldByName('CODIGO').AsInteger) +
   ' and cod_empresa = ' + vDadosIni.codEmpresa +
   ' order by nitem desc');

  if trim(vTemp) <> '' then
    vMaxItem := StrToInt(vTemp);

  dataSet.FieldByName('nitem').AsInteger;
  if inherited Insert then
  begin
    Result := True;
    vMaxItem := vMaxItem + 1;
    dataSet.FieldByName('CODIGO').AsInteger := reserva.dataSet.FieldByName('CODIGO').AsInteger;
    dataSet.FieldByName('COD_EMPRESA').AsInteger := reserva.dataSet.FieldByName('COD_EMPRESA').AsInteger;
    dataSet.FieldByName('COD_VENDEDOR').AsInteger := reserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
    dataSet.FieldByName('NITEM').AsInteger := vMaxItem;
    dataSet.FieldByName('DATA').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('HORA').AsString := FormatDateTime('HH:MM', vDadosIni.getDataHoraBanco(buscas));
  end;
end;

function TReservaItens.LiberarTravaVenda: boolean;
var
 msg, processo: string;
 buscas2: TIBQuery;
begin
  try
    Result := false;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    if not Application.MessageBox(Pchar('Deseja realmente retirar trava para inclusão de novas mercadorias ?'), 'Retirar trava', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
      exit;

    dtSet.Filter := ' SEL = ''S''';
    dtSet.Filtered := true;
    if dtSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum item selecionado!', 'Atenção', MB_OK);
      exit;
    end;
    dtSet.First;
    while not dtSet.Eof do
    begin
       if dtSet.FieldByName('SEL').AsString = 'S' then
       begin
         if verificarRegistrodtSet then
         begin
           if dtSet.FieldByName('COD_PEDIDO').AsInteger <= 0 then
           begin
             Result := false;
             Application.MessageBox(PChar('Não é possível liberar trava de produto pendente: ' + #13 +
              'Grupo Prod: ' + IntToStr(dtSet.FieldByName('GRUPO_PROD').AsInteger)+
              ' Cod Prod: ' + trim(dtSet.FieldByName('COD_PROD').AsString) +
              ' Cod Grade: ' + IntToStr(dtSet.FieldByName('COD_GRADE').AsInteger)+
              ' Quant: ' + FloatToStr(dtSet.FieldByName('QUANT').AsFloat)),  'Atenção', MB_OK);
           end
           else
           begin
             try
               processo := 'VND218';
               if dtSet.FieldByName('QTDE_LIBTRAVA').AsInteger > 0 then
				      processo := 'VND198';
               if vDadosIni.PesqPros(processo, 'RETIRAR TRAVA', '', 'CONTROLE_ALMOXARIFADO', '', buscas, false) then
               begin
                 buscas.Close;
                 buscas.SQL.Text := ' UPDATE CONTROLE_ALMOXARIFADO SET LIBTRAVA = :LIBTRAVA, DATA_LIBTRAVA = :DATA_LIBTRAVA, ' +
                  ' QTDE_LIBTRAVA = :QTDE_LIBTRAVA ' +
                  ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMRESA ';
                 buscas.ParamByName('LIBTRAVA').AsString := 'S';
                 buscas.ParamByName('DATA_LIBTRAVA').AsDateTime := vDadosIni.getDataBanco(buscas2);
                 buscas.ParamByName('QTDE_LIBTRAVA').AsInteger := dtSet.FieldByName('QTDE_LIBTRAVA').AsInteger + 1;
                 buscas.ParamByName('COD_PEDIDO').AsInteger := dtSet.FieldByName('COD_PEDIDO').AsInteger;
                 buscas.ParamByName('NITEM').AsInteger := dtSet.FieldByName('NITEM').AsInteger;
                 buscas.ParamByName('COD_EMRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                 buscas.ExecSQL;

                 vDadosIni.GravaAuditoria(processo, 'RETIRAR TRAVA',
                  'Cod Res ' + IntToStr(dtSet.FieldByName('CODIGO').AsInteger) +
                  ' Nº Item ' + IntToStr(dtSet.FieldByName('NITEM').AsInteger) +
                  ' Grupo Prod: ' + IntToStr(dtSet.FieldByName('GRUPO_PROD').AsInteger) +
                  ' Cod Prod: ' + dtSet.FieldByName('COD_PROD').AsString, 'CONTROLE_ALMOXARIFADO',
                  dtSet.FieldByName('COD_PEDIDO').AsString, buscas);
                 result := True;
               end;
             except
               on e: exception do
               begin
                 result := false;
                 vDadosIni.GravaAuditoria(processo, 'RETIRAR TRAVA',
                  'Cod Res ' + IntToStr(dtSet.FieldByName('CODIGO').AsInteger) +
                  ' Nº Item ' + IntToStr(dtSet.FieldByName('NITEM').AsInteger) +
                  ' Grupo Prod: ' + IntToStr(dtSet.FieldByName('GRUPO_PROD').AsInteger) +
                  ' Cod Prod: ' + dtSet.FieldByName('COD_PROD').AsString, 'CONTROLE_ALMOXARIFADO',
                  dtSet.FieldByName('COD_PEDIDO').AsString, buscas);
                 Application.MessageBox(pchar('Erro ao liberar trava - TReservaItens.LiberarTravaVenda: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
                 registraErro('TReservaItens.LiberarTravaVenda: ' + e.Message);
                 exit;
               end;
             end;
           end;
         end;
       end;
       dtSet.Next;
    end;
    if Result then
      result := CommitaTransacao
    else
      RollBackTransacao;
    if Result then
      vDadosIni.GravaAuditoria(processo, 'RETIRAR TRAVA', 'SUCESSO', 'CONTROLE_ALMOXARIFADO', '', buscas)
    else
      vDadosIni.GravaAuditoria(processo, 'RETIRAR TRAVA', 'FALHA', 'CONTROLE_ALMOXARIFADO', '', buscas);
  finally
    dtSet.Filtered := false;
  end;
end;

function TReservaItens.LocalizarProduto(pQuantTotal, pQuantAlmox: Double): boolean;
begin
  try
  Result := true;

  if pQuantTotal = pQuantAlmox then
  begin
    buscas.Close;
    buscas.SQL.Text := ' DELETE FROM RESERVA_ALMOXARIFADO_ITENS' +
       ' WHERE CODIGO = :CODIGO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA ';
    buscas.ParamByName('CODIGO').AsInteger := dtSet.FieldByName('CODIGO').AsInteger;
    buscas.ParamByName('NITEM').AsInteger := dtSet.FieldByName('NITEM').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := dtSet.FieldByName('COD_EMPRESA').AsInteger;
    buscas.ExecSQL;
  end
  else
  begin
    buscas.Close;
    buscas.SQL.Text := ' UPDATE RESERVA_ALMOXARIFADO_ITENS SET QUANT = :QUANT ' +
       ' WHERE CODIGO = :CODIGO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA ';
    buscas.ParamByName('QUANT').AsFloat := pQuantTotal - pQuantAlmox;   
    buscas.ParamByName('CODIGO').AsInteger := dtSet.FieldByName('CODIGO').AsInteger;
    buscas.ParamByName('NITEM').AsInteger := dtSet.FieldByName('NITEM').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := dtSet.FieldByName('COD_EMPRESA').AsInteger;
    buscas.ExecSQL;
  end;
  CommitaTransacao;
  except on E: Exception do
   begin
    Result := False;
    Application.MessageBox(pchar('Erro ao localizar produto - TReservaItens.LocalizarProduto: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    registraErro('TReservaItens.LocalizarProduto: ' + e.Message);
   end;
  end;
end;

function TReservaItens.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('VND215', 'SALVAR', '', 'RESERVA_ALMOXARIFADO',
      dataSet.FieldByName('CODIGO').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

//    if trim(dataSet.FieldByName('DESCRICAO').AsString) = '' then
//      raiseExceptionCreate('Descrição deve ser informado', 'DBEdit2');
//
    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('ORDEM').AsInteger :=
        Gencodigo('ORDEM_RESERVA_ALMOX', dtmEstoqueFechado.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    Result := inherited post;

//    if (DataSet.ChangeCount = 0) then
//      Result := True
//    else
//      Result := Apply;
//
//    if result then
//      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VND215', acao, 'SUCESSO', 'RESERVA_ALMOXARIFADO',
        dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VND215', acao, 'FALHA', 'RESERVA_ALMOXARIFADO',
        dataSet.FieldByName('CODIGO').AsString, buscas);

//    if Result then
//      Refresh;

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

function TReservaItens.RemoverItemReserva(reserva: TReserva): boolean;
var
 acao: string;
begin
  try
    Result := false;
    acao := 'REMOVER';
    if reserva.IsEmpty then
    begin
      Application.MessageBox('Nenhum reserva selecionada!', 'Atenção', MB_OK);
      exit;
    end;

    if not vDadosIni.PesqPros('VND209', acao, '', 'RESERVA_ALMOXARIFADO',
      reserva.dataSet.FieldByName('CODIGO').AsString, buscas, true) then
     Exit;

    dtSet.Filter := ' SEL = ''S''';
    dtSet.Filtered := true;
    if dtSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum item selecionado!', 'Atenção', MB_OK);
      exit;
    end;

    Result := true;

    dtSet.First;
    while not dtSet.Eof do
    begin
     if dtSet.FieldByName('SEL').AsString = 'S' then
     begin
       if verificarRegistrodtSet then
       begin
         if dtSet.FieldByName('COD_PEDIDO').AsInteger <= 0 then
         begin
           if Application.MessageBox(PChar('Produto selecionado está pendente: ' + #13 +
            'Grupo Prod: ' + IntToStr(dtSet.FieldByName('GRUPO_PROD').AsInteger)+
            ' Cod Prod: ' + trim(dtSet.FieldByName('COD_PROD').AsString) +
            ' Cod Grade: ' + IntToStr(dtSet.FieldByName('COD_GRADE').AsInteger)+
            ' Quant: ' + FloatToStr(dtSet.FieldByName('QUANT').AsFloat) + #13 +
            'Deseja remover produto pendente?'),  'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
            begin
              try
                Delete;
                vDadosIni.GravaAuditoria('VND209', acao, 'Grupo Prod ' + IntToStr(dtSet.FieldByName('GRUPO_PROD').AsInteger) +
                  ' Cod Prod ' + trim(dtSet.FieldByName('COD_PROD').AsString) +
                  ' Cod Grade ' + IntToStr(dtSet.FieldByName('COD_GRADE').AsInteger) +
                  ' Quant ' + FloatToStr(dtSet.FieldByName('QUANT').AsFloat), 'RESERVA_ALMOXARIFADO',
                reserva.dataSet.FieldByName('CODIGO').AsString, buscas)
              except on E: Exception do
               begin
                Result := False;
                Application.MessageBox(pchar('Erro ao remover item a reserva - TReservaItens.RemoverItemReserva: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
                registraErro('TReservaItens.RemoverItemReserva: ' + e.Message);
                exit;
               end;
              end;
            end;
         end
         else
         begin
           buscas.Close;
           buscas.SQL.Text := ' UPDATE CONTROLE_ALMOXARIFADO SET COD_RESERVA = :COD_RESERVA ' +
            ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA ';
           buscas.ParamByName('COD_RESERVA').Value := Null;
           buscas.ParamByName('COD_PEDIDO').AsInteger := dtSet.FieldByName('COD_PEDIDO').AsInteger;
           buscas.ParamByName('NITEM').AsInteger := dtSet.FieldByName('NITEM').AsInteger;
           buscas.ParamByName('COD_EMPRESA').AsInteger := dtSet.FieldByName('COD_EMPRESA').AsInteger;
           try
             buscas.ExecSQL;
             vDadosIni.GravaAuditoria('VND209', acao, 'Grupo Prod ' + IntToStr(dtSet.FieldByName('GRUPO_PROD').AsInteger) +
               ' Cod Prod ' + trim(dtSet.FieldByName('COD_PROD').AsString) +
               ' Cod Grade ' + IntToStr(dtSet.FieldByName('COD_GRADE').AsInteger) +
               ' Quant ' + FloatToStr(dtSet.FieldByName('QUANT').AsFloat), 'RESERVA_ALMOXARIFADO',
             reserva.dataSet.FieldByName('CODIGO').AsString, buscas)
           except on E: Exception do
            begin
             Result := False;
             Application.MessageBox(pchar('Erro ao remover item a reserva - TReservaItens.RemoverItemReserva: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
             registraErro('TReservaItens.RemoverItemReserva: ' + e.Message);
            end;
           end;
         end;
       end;
     end;
     dtSet.Next;
    end;

    if Result then
      CommitaTransacao
    else
      RollBackTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VND209', acao, 'SUCESSO', 'RESERVA_ALMOXARIFADO', reserva.dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VND209', acao, 'FALHA', 'RESERVA_ALMOXARIFADO', reserva.dataSet.FieldByName('CODIGO').AsString, buscas);
  finally
    dtSet.Filtered := false;
  end;
end;

function TReservaItens.verificarRegistrodtSet: boolean;
var
 vCodigo: Integer;
begin
  Result := True;

  vCodigo := dtSet.FieldByName('CODIGO').AsInteger;

  buscas.Close;
  buscas.SQL.Text := ' SELECT RES.CODIGO, RES.NITEM, RES.COD_EMPRESA, RES.COD_VENDEDOR, RES.GRUPO_PROD, RES.COD_PROD, RES.NUM_FAB_PROD, ' +
   ' RES.DESCR_PROD, RES.COD_GRADE, RES.QUANT, RES.DATA, RES.HORA, 0 COD_PEDIDO ' +
   ' FROM RESERVA_ALMOXARIFADO_ITENS RES ' +
   ' WHERE RES.CODIGO = ' + IntToStr(vCodigo) + ' AND RES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' UNION ' +
   ' SELECT CON.COD_RESERVA, CON.NITEM, CON.COD_EMPRESA, CON.COD_VENDEDOR, CON.GRUPO_PROD, CON.COD_PROD, CON.NUM_FAB_PROD, ' +
   ' CON.DESCR_PROD, CON.COD_GRADE, CON.QUANT, CON.DATA_PEDIDO, CON.HORA_PEDIDO, CON.COD_PEDIDO ' +
   ' FROM CONTROLE_ALMOXARIFADO CON ' +
   ' WHERE CON.COD_RESERVA = ' + IntToStr(vCodigo) + ' AND CON.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' AND CON.SIT_ATD = ''NT'' ' +
   ' ORDER BY 13, 2 ' ;
  buscas.Open;

//  try
//    dtSet.RefreshRecord;
//    if vCodigo <> dtSet.FieldByName('CODIGO').AsInteger then
     if buscas.IsEmpty then
     begin
       Result := False;
       Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte o botão Procurar e verifique',
         'Atenção', 0 + 64);
       Exit;
     end;
//
//  except on E: Exception do
//    begin
//      if Pos('changed by another user', e.Message) > 0 then
//      begin
//        Result := False;
////        if pExibirMens then
//          Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
//           'Atenção', 0 + 64);
//        Exit;
//      end;
//    end;
//  end;
end;

function TReservaItens.verificarRegistrodtSetAlmox: boolean;
var
 vCodigo: Integer;
begin
  Result := True;

  vCodigo := dtSetAlmox.FieldByName('COD_PEDIDO').AsInteger;

  buscas.Close;
  buscas.SQL.Text := ' SELECT COD_PEDIDO FROM CONTROLE_ALMOXARIFADO ' +
   ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA ' +
   ' AND SIT_ATD =''NT'' AND COD_RESERVA IS NULL';
  buscas.ParamByName('COD_PEDIDO').AsInteger := dtSetAlmox.FieldByName('COD_PEDIDO').AsInteger;
  buscas.ParamByName('NITEM').AsInteger := dtSetAlmox.FieldByName('NITEM').AsInteger;
  buscas.ParamByName('COD_EMPRESA').AsInteger := dtSetAlmox.FieldByName('COD_EMPRESA').AsInteger;
  buscas.Open;

//  try
//    dtSetAlmox.RefreshRecord;
//    if vCodigo <> dtSetAlmox.FieldByName('COD_PEDIDO').AsInteger then
    if buscas.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte o botão F5 e verifique',
        'Atenção', 0 + 64);
      Exit;
    end;
//
//  except on E: Exception do
//    begin
//      if Pos('changed by another user', e.Message) > 0 then
//      begin
//        Result := False;
////        if pExibirMens then
//          Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte F5 e verifique',
//           'Atenção', 0 + 64);
//        Exit;
//      end;
//    end;
//  end;
end;

function TReservaItens._abreReservasItens(pCodigo: Integer): Boolean;
begin
 Result := montaSelect(' select * from reserva_almoxarifado_itens ' +
  ' where codigo = ' + IntToStr(pCodigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa +
  ' order by codigo, nitem');

 dtSetAlmox.Cancel;  
 dtSetAlmox.Filtered := false;
 dtSetAlmox.Filter := ' SIT_ATD = ''NT'' AND COD_RESERVA IS NULL ';
 dtSetAlmox.Filtered := true;
 dtSetAlmox.Close;
 dtSetAlmox.Open;

 buscas.Close;
 buscas.SQL.Text := ' select res.ordem, res.codigo, res.nitem, res.cod_empresa, res.cod_vendedor, res.grupo_prod, res.cod_prod, res.num_fab_prod, ' +
  ' res.descr_prod, res.cod_grade, res.quant, res.data, res.hora, 0 cod_pedido, res.data_ver, null libtrava, null data_libtrava, null qtde_libtrava,  res.tipv ' +
  ' from reserva_almoxarifado_itens res ' +
  ' where res.codigo = ' + IntToStr(pCodigo) + ' and res.cod_empresa = ' + vDadosIni.codEmpresa +
  ' union ' +
  ' select 0 ordem, con.cod_reserva, con.nitem, con.cod_empresa, con.cod_vendedor, con.grupo_prod, con.cod_prod, con.num_fab_prod, ' +
  ' con.descr_prod, con.cod_grade, con.quant, con.data_pedido, con.hora_pedido, con.cod_pedido, null data_ver, con.libtrava, con.data_libtrava, con.qtde_libtrava, con.tipv ' +
  ' from controle_almoxarifado con ' +
  ' where con.cod_reserva = ' + IntToStr(pCodigo) + ' and con.cod_empresa = ' + vDadosIni.codEmpresa +
  ' and con.sit_atd = ''NT'' ' +
  ' order by 1 ' ;
 buscas.Open;
 buscas.FetchAll;
 dtSet.EmptyDataSet;
 buscas.First;
 while not buscas.Eof do
 begin
   dtSet.Insert;
   dtSet.FieldByName('CODIGO').AsInteger := buscas.FieldByName('CODIGO').AsInteger;
   dtSet.FieldByName('NITEM').AsInteger := buscas.FieldByName('NITEM').AsInteger;
   dtSet.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').AsInteger;
   dtSet.FieldByName('COD_VENDEDOR').AsInteger := buscas.FieldByName('COD_VENDEDOR').AsInteger;
   dtSet.FieldByName('GRUPO_PROD').AsInteger := buscas.FieldByName('GRUPO_PROD').AsInteger;
   dtSet.FieldByName('COD_PROD').AsString := buscas.FieldByName('COD_PROD').AsString;
   dtSet.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
   dtSet.FieldByName('DESCR_PROD').AsString := buscas.FieldByName('DESCR_PROD').AsString;
   dtSet.FieldByName('COD_GRADE').AsInteger := buscas.FieldByName('COD_GRADE').AsInteger;
   dtSet.FieldByName('QUANT').AsFloat := buscas.FieldByName('QUANT').AsFloat;
   dtSet.FieldByName('TIPV').AsString := buscas.FieldByName('TIPV').AsString;
   dtSet.FieldByName('DATA').AsDateTime := buscas.FieldByName('DATA').AsDateTime;
   dtSet.FieldByName('HORA').AsString := buscas.FieldByName('HORA').AsString;
   dtSet.FieldByName('COD_PEDIDO').AsInteger := buscas.FieldByName('COD_PEDIDO').AsInteger;
   dtSet.FieldByName('ORDEM').AsInteger := buscas.FieldByName('ORDEM').AsInteger;
   dtSet.FieldByName('DATA_VER').AsDateTime := buscas.FieldByName('DATA_VER').AsDateTime;
   dtSet.FieldByName('LIBTRAVA').AsString := buscas.FieldByName('LIBTRAVA').AsString;
   dtSet.FieldByName('DATA_LIBTRAVA').AsDateTime := buscas.FieldByName('DATA_LIBTRAVA').AsDateTime;
   dtSet.FieldByName('QTDE_LIBTRAVA').AsInteger := buscas.FieldByName('QTDE_LIBTRAVA').AsInteger;
   dtSet.Post;
   buscas.Next;
 end;
 dtSetAlmox.First; 
 dtSet.First;
 dtSet.IndexFieldNames := 'CODIGO;NITEM';
 dtSetAlmox.IndexFieldNames := 'COD_PEDIDO;NITEM';
end;

function TReservaItens._alterarItemReserva: boolean;
var
 vCodReservaOld, vCodReserva, acao: string;
 vMaxNitem: Integer;
begin
  inherited;
  try
    Result := false;

    acao := 'ALTERAR';

    if not vDadosIni.PesqPros('VND211', acao, '', 'RESERVA_ALMOXARIFADO', '', buscas, true) then
      Exit;

    dtSet.Filter := ' SEL = ''S''';
    dtSet.Filtered := true;
    if dtSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum item selecionado!', 'Atenção', MB_OK);
      exit;
    end;

    vCodReservaOld := dtSet.FieldByName('CODIGO').AsString;
    vCodReserva := dtSet.FieldByName('CODIGO').AsString;
    if not InputQuery('Atenção', 'Informe o código da nova reserva:', vCodReserva) then
      exit;

    try
      StrToInt(vCodReserva)
    except
      Application.MessageBox('Código da reserva incorreto!', 'Atenção', MB_OK);
      exit;
    end;

    if StrToInt(vCodReserva) <= 0 then
    begin
      Application.MessageBox('Código da reserva não informado!', 'Atenção', MB_OK);
      exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'SELECT CODIGO FROM RESERVA_ALMOXARIFADO ' +
     ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ';
    buscas.ParamByName('CODIGO').AsInteger := StrToInt(vCodReserva);
    buscas.ParamByName('COD_EMPRESA').AsInteger := dtSet.FieldByName('COD_EMPRESA').AsInteger;
    buscas.Open;

    if buscas.IsEmpty then
    begin
      Application.MessageBox('Código da reserva não encontado!', 'Atenção', MB_OK);
      exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'SELECT FIRST 1 NITEM FROM RESERVA_ALMOXARIFADO_ITENS ' +
     ' WHERE CODIGO = :CODIGO AND COD_EMPRESA = :COD_EMPRESA ' +
     ' ORDER BY NITEM DESC';
    buscas.ParamByName('CODIGO').AsInteger := StrToInt(vCodReserva);
    buscas.ParamByName('COD_EMPRESA').AsInteger := dtSet.FieldByName('COD_EMPRESA').AsInteger;
    buscas.Open;

    vMaxNitem := 0;
    if not buscas.IsEmpty then
      vMaxNitem := buscas.FieldByName('NITEM').AsInteger;

    dtSet.First;
    while not dtSet.Eof do
    begin
       if dtSet.FieldByName('SEL').AsString = 'S' then
       begin
         if verificarRegistrodtSet then
         begin
           vDadosIni.GravaAuditoria('VND211', acao, 'Cod Res ' + IntToStr(dtSet.FieldByName('CODIGO').AsInteger) +
            ' Nº Item ' + IntToStr(dtSet.FieldByName('NITEM').AsInteger) +
            ' Grupo Prod: ' + IntToStr(dtSet.FieldByName('GRUPO_PROD').AsInteger) +
            ' Cod Prod: ' + dtSet.FieldByName('COD_PROD').AsString,
            'RESERVA_ALMOXARIFADO', dtSet.FieldByName('CODIGO').AsString, buscas);
           try
             buscas.Close;
             if dtSet.FieldByName('COD_PEDIDO').AsInteger <= 0 then
             begin
               vMaxNitem := vMaxNitem + 1;
               buscas.SQL.Text := 'UPDATE RESERVA_ALMOXARIFADO_ITENS SET CODIGO = :CODIGO_NEW, NITEM = :NITEM_NEW ' +
                 ' WHERE CODIGO = :CODIGO_OLD AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA ';
               buscas.ParamByName('NITEM_NEW').AsInteger := vMaxNitem;
               buscas.ParamByName('CODIGO_OLD').AsInteger := dtSet.FieldByName('CODIGO').AsInteger;
             end
             else
             begin
               buscas.SQL.Text := 'UPDATE CONTROLE_ALMOXARIFADO SET COD_RESERVA = :CODIGO_NEW ' +
                 ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA ';
               buscas.ParamByName('COD_PEDIDO').AsInteger := dtSet.FieldByName('COD_PEDIDO').AsInteger;
             end;
             buscas.ParamByName('CODIGO_NEW').AsInteger := StrToInt(vCodReserva);
             buscas.ParamByName('NITEM').AsInteger := dtSet.FieldByName('NITEM').AsInteger;
             buscas.ParamByName('COD_EMPRESA').AsInteger := dtSet.FieldByName('COD_EMPRESA').AsInteger;
             buscas.ExecSQL;
             Result := true;
           except on E: Exception do
           begin
            Result := False;
            Application.MessageBox(pchar('Erro ao alterar item da reserva - TReservaItens._alterarItemReserva: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
            registraErro('TReservaItens._alterarItemReserva: ' + e.Message);
           end;
          end;

         end;
       end;
       dtSet.Next;
    end;
    if Result then
      CommitaTransacao
    else
      RollBackTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VND211', acao, 'SUCESSO - ANT: ' + vCodReservaOld + ' NOVA: ' + vCodReserva,
       'RESERVA_ALMOXARIFADO', dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('VND211', acao, 'FALHA -  ANT: ' + vCodReservaOld + 'NOVA:' + vCodReserva,
       'RESERVA_ALMOXARIFADO', dataSet.FieldByName('CODIGO').AsString, buscas);
  finally
    dtSet.Filtered := false;
  end;
end;

procedure TReservaItens._desmarcarTodos(dtTemp: TClientDataSet);
begin
  try
    dtTemp.First;
    while not dtTemp.Eof do
    begin
      dtTemp.Edit;
      dtTemp.FieldByName('sel').AsString := '';
      dtTemp.Post;
      dtTemp.Next;
    end;
    dtTemp.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TReservaItens._getDisponibilidadeReserva(
  pCodVendedor, pGrupoProd: Integer; pCodProd: string; pCodGrade: Integer; pEstDisp, pQuant: Double; pOrdem: Integer = 0): Double;
var
  I: Integer;
  vQuantTot, vQuantDisp, vQuantV: Double;
  vExibirMens: boolean;
  vEstReal: double;
begin
  try
    vQuantTot := 0;
    vQuantV := 0;
    vQuantDisp := pEstDisp;
    vExibirMens := true;

    if (vDadosIni.vEstoqueNegativo = 'S') then
    begin
      Result := pQuant;
      exit;
    end;

    vEstReal := pEstDisp;

    buscas.Close;
    buscas.SQL.Text := ' SELECT COL.NOME_VENDEDOR, R.DESCRICAO, IT.CODIGO, IT.NITEM, IT.GRUPO_PROD, IT.COD_PROD, IT.NUM_FAB_PROD, COALESCE(IT.QUANT, 0) QUANT, IT.COD_VENDEDOR, IT.ORDEM FROM RESERVA_ALMOXARIFADO_ITENS IT ' +
     ' INNER JOIN RESERVA_ALMOXARIFADO R ON R.CODIGO = IT.CODIGO AND R.COD_EMPRESA = IT.COD_EMPRESA ' +
     ' LEFT JOIN COLABORADOR COL ON COL.COD_VENDEDOR = IT.COD_VENDEDOR AND COL.COD_EMPRESA = IT.COD_EMPRESA ' +
     ' WHERE IT.GRUPO_PROD = :GRUPO_PROD AND IT.COD_PROD = :COD_PROD AND IT.COD_GRADE = :COD_GRADE ' +
     ' AND IT.COD_EMPRESA = :COD_EMPRESA ';
    if pOrdem > 0 then
      buscas.SQL.Text := buscas.SQL.Text + ' AND ORDEM <= :ORDEM ';
    buscas.SQL.Text := buscas.SQL.Text + ' ORDER BY ORDEM ';
    buscas.ParamByName('GRUPO_PROD').AsInteger := pGrupoProd;
    buscas.ParamByName('COD_PROD').AsString := pCodProd;
    buscas.ParamByName('COD_GRADE').AsInteger := pCodGrade;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    if pOrdem > 0 then
      buscas.ParamByName('ORDEM').AsInteger := pOrdem;
    buscas.Open;
    buscas.FetchAll;

    vDadosIni.abreStatusProcessamento('', 'Verificando disponibilidade');
    if not buscas.IsEmpty then
    begin
      buscas.First;
      while not buscas.Eof do
      begin
//        if (pEstDisp >= (vQuantTot + buscas.FieldByName('QUANT').AsFloat)) then
//        begin
          vQuantTot := vQuantTot + buscas.FieldByName('QUANT').AsFloat;
//          if pCodVendedor <> buscas.FieldByName('COD_VENDEDOR').AsInteger then
            if pOrdem <= 0 then
              vQuantDisp := vQuantDisp - buscas.FieldByName('QUANT').AsFloat
            else if (pOrdem <> buscas.FieldByName('ORDEM').AsInteger) then
              vQuantDisp := vQuantDisp - buscas.FieldByName('QUANT').AsFloat;
//        end
//        else
//        begin
//          vQuantTot :=  vQuantTot + (pEstDisp - vQuantTot);
//          if pCodVendedor <> buscas.FieldByName('COD_VENDEDOR').AsInteger then
//            vQuantDisp := vQuantDisp - (pEstDisp - vQuantTot);
//        end;
//        if pCodVendedor = buscas.FieldByName('COD_VENDEDOR').AsInteger then
//        begin
//          if pOrdem <= 0 then
//            vQuantV := vQuantV + buscas.FieldByName('QUANT').AsFloat
//          else
//          if (pOrdem > 0) and (pOrdem <> buscas.FieldByName('ORDEM').AsInteger) then
//          begin
//            Application.MessageBox(PChar('Produto pendente para reserva: ' +
//              IntToStr(buscas.FieldByName('CODIGO').AsInteger) + '-' + IntToStr(buscas.FieldByName('NITEM').AsInteger) + ' ' +
//            trim(buscas.FieldByName('DESCRICAO').AsString) + #13 +
//            'Vendedor: ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString)), 'Atenção', MB_OK);
//            Result := 0;
//            exit;
//          end;
//        end;

        if vQuantTot = pEstDisp then
          break
        else if vQuantV >= pQuant then
          break;
        buscas.Next;
      end;
    end
    else
    begin
      if pEstDisp >= pQuant then
        result := pQuant
      else
        result := pEstDisp;
      exit;
    end;

    if pQuant > vEstReal then
      vExibirMens := false;

    vdadosini.fechaStatusProcessamento;
    if vQuantDisp < 0 then
      vQuantDisp := 0;
    if vQuantDisp > pQuant then
      vQuantDisp := pQuant;
    Result := vQuantDisp;

//   if (Result <= 0) and (vExibirMens) then
   if (vQuantDisp < pQuant) and (vExibirMens) then
     Application.MessageBox(PChar('Produto ' + QuotedStr(trim(buscas.FieldByName('NUM_FAB_PROD').AsString))
        + ' reservado está com quantidade requisitada maior do que disponível'), 'Atenção', MB_OK + MB_ICONINFORMATION);
   if (pOrdem > 0) and (Result <= 0) then
   begin
      if vDadosIni.PesqPros('VND213', 'ALTERAR', '', 'RESERVA_ALMOXARIFADO_ITENS',
      dtSet.FieldByName('CODIGO').AsString, buscas, False) then
         Result := pQuant;
    end;
  finally
     vdadosini.fechaStatusProcessamento;
  end;
end;

procedure TReservaItens._marcaDesmarcaLinha(dtTemp: TClientDataSet);
begin
  if dtTemp.IsEmpty then
    exit;

  dtTemp.Edit;
  if dtTemp.FieldByName('SEL').AsString = 'S' then
    dtTemp.FieldByName('SEL').AsString := ''
  else
    dtTemp.FieldByName('SEL').AsString := 'S';
  dtTemp.Post;
end;

procedure TReservaItens._marcarTodos(dtTemp: TClientDataSet);
begin
  try
    dtTemp.First;
    while not dtTemp.Eof do
    begin
      dtTemp.Edit;
      dtTemp.FieldByName('sel').AsString := 'S';
      dtTemp.Post;
      dtTemp.Next;
    end;
    dtTemp.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TReservaItens._verificarPendencias(pGrupoProd: Integer = 0; pCodProd: String = '');
var
  buscas2: TIBQuery;
  vDataBanco: TDateTime;
  vOK: boolean;
  vAssunto, vMensagem: string;
  vCodVendedor: Integer;
  vlista: TStringList;
begin
  try
    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;
    vlista := TStringList.Create;
    vlista.Clear;

    vDataBanco := vDadosIni.getDataBanco(buscas2);

    buscas.Close;
    buscas.SQL.Text := ' SELECT GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA, ' +
     ' SUM(COALESCE(QUANT, 0)) QUANT FROM RESERVA_ALMOXARIFADO_ITENS ' +
     ' WHERE COD_EMPRESA = :COD_EMPRESA ';
    if (pGrupoProd > 0) and (trim(pCodProd) <> '')  then
      buscas.SQL.Text := buscas.SQL.Text + ' AND GRUPO_PROD = :GRUPO_PROD AND COD_PROD = :COD_PROD ';
    buscas.SQL.Text := buscas.SQL.Text +
     ' GROUP BY 1, 2, 3, 4 ';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    if (pGrupoProd > 0) and (trim(pCodProd) <> '')  then
    begin
      buscas.ParamByName('GRUPO_PROD').AsInteger := pGrupoProd;
      buscas.ParamByName('COD_PROD').AsString := pCodProd;
    end;
    buscas.Open;
    buscas.FetchAll;

    vDadosIni.abreStatusProcessamento('', 'Verificando disponibilidade');
    fTempProdutos.EmptyDataSet;
    fTempVendedor.EmptyDataSet;
    buscas.First;
    while not buscas.Eof do
    begin
      if buscas.FieldByName('COD_GRADE').AsInteger <= 0 then
        fTempProdutos.Filter := ' GRUPO_PROD = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) +
          ' AND COD_PROD = ' + QuotedStr(buscas.FieldByName('COD_PROD').AsString)
      else
        fTempProdutos.Filter := ' GRUPO_PROD = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) +
          ' AND COD_PROD = ' + QuotedStr(buscas.FieldByName('COD_PROD').AsString) +
          ' AND COD_GRADE = ' + IntToStr(buscas.FieldByName('COD_GRADE').AsInteger);

      fTempProdutos.Filtered := true;
      if fTempProdutos.IsEmpty then
      begin
        fTempProdutos.Insert;
        fTempProdutos.FieldByName('GRUPO_PROD').AsInteger := buscas.FieldByName('GRUPO_PROD').AsInteger;
        fTempProdutos.FieldByName('COD_PROD').AsString := buscas.FieldByName('COD_PROD').AsString;
        fTempProdutos.FieldByName('COD_GRADE').AsInteger := buscas.FieldByName('COD_GRADE').AsInteger;
        if buscas.FieldByName('COD_GRADE').AsInteger > 0 then
          fTempProdutos.FieldByName('EST_F').AsFloat := vDadosIni.getEstoqueDisponivel(buscas2,
           buscas.FieldByName('GRUPO_PROD').AsInteger, buscas.FieldByName('COD_PROD').AsString,
           buscas.FieldByName('COD_GRADE').AsInteger)
        else
          fTempProdutos.FieldByName('EST_F').AsFloat := vDadosIni.getEstoqueDisponivel(buscas2,
           buscas.FieldByName('GRUPO_PROD').AsInteger, buscas.FieldByName('COD_PROD').AsString);
        fTempProdutos.FieldByName('DISPONIVEL').AsFloat := fTempProdutos.FieldByName('EST_F').AsFloat;
        fTempProdutos.Post;
      end;
      buscas.Next;
    end;

    fTempProdutos.Filtered := false;
    fTempProdutos.First;
    while not fTempProdutos.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := ' SELECT CODIGO, NITEM, COD_EMPRESA, COD_VENDEDOR, ' +
       ' GRUPO_PROD, COD_PROD, COD_GRADE, NUM_FAB_PROD, QUANT, DATA_VER, ORDEM FROM RESERVA_ALMOXARIFADO_ITENS ' +
       ' WHERE GRUPO_PROD = :GRUPO_PROD AND COD_PROD = :COD_PROD AND COD_GRADE = :COD_GRADE AND COD_EMPRESA = :COD_EMPRESA ' +
       ' ORDER BY ORDEM ';
      buscas.ParamByName('GRUPO_PROD').AsInteger := fTempProdutos.FieldByName('GRUPO_PROD').AsInteger;
      buscas.ParamByName('COD_PROD').AsString := fTempProdutos.FieldByName('COD_PROD').AsString;
      buscas.ParamByName('COD_GRADE').AsInteger := fTempProdutos.FieldByName('COD_GRADE').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;
      buscas.FetchAll;
      vOK := false;

      buscas.First;
      while not buscas.Eof do
      begin
        if (fTempProdutos.FieldByName('DISPONIVEL').AsFloat >= buscas.FieldByName('QUANT').AsFloat) and (not vOK) then
        begin
          fTempProdutos.Edit;
          fTempProdutos.FieldByName('DISPONIVEL').AsFloat :=
            fTempProdutos.FieldByName('DISPONIVEL').AsFloat - buscas.FieldByName('QUANT').AsFloat;
          fTempProdutos.FieldByName('ORDEM').AsInteger := buscas.FieldByName('ORDEM').AsInteger;

          if buscas.FieldByName('DATA_VER').IsNull then
          begin
            fTempProdutos.FieldByName('DATA_VER').AsDateTime := vDataBanco;

            buscas2.Close;
            buscas2.SQL.Text := ' UPDATE RESERVA_ALMOXARIFADO_ITENS SET DATA_VER = :DATA_VER  ' +
             ' WHERE CODIGO = :CODIGO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA ';
            buscas2.ParamByName('DATA_VER').AsDateTime := vDataBanco;
            buscas2.ParamByName('CODIGO').AsInteger := buscas.FieldByName('CODIGO').AsInteger;
            buscas2.ParamByName('NITEM').AsString := buscas.FieldByName('NITEM').AsString;
            buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas2.ExecSQL;

            vAssunto := 'Reserva de produtos:';//'Produto ' + QuotedStr(trim(buscas.FieldByName('NUM_FAB_PROD').AsString)) + ' disponível';
            vMensagem := 'Produto ' + QuotedStr(trim(buscas.FieldByName('NUM_FAB_PROD').AsString)) +
              ' reservado disponível para reserva: ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger);

            fTempVendedor.Filter := ' COD_VENDEDOR = ' + IntToStr(buscas.FieldByName('COD_VENDEDOR').AsInteger);
            fTempVendedor.Filtered := true;
            if fTempVendedor.IsEmpty then
            begin
              fTempVendedor.Insert;
              fTempVendedor.FieldByName('COD_VENDEDOR').AsInteger := buscas.FieldByName('COD_VENDEDOR').AsInteger;
              fTempVendedor.FieldByName('MENSAGEM').AsString := vMensagem;
              fTempVendedor.Post;
            end
            else
            begin
              vlista.Text := fTempVendedor.FieldByName('MENSAGEM').AsString;
              fTempVendedor.Edit;
              vlista.Add(vMensagem);
              fTempVendedor.FieldByName('MENSAGEM').AsString := vlista.Text;
              fTempVendedor.Post;
            end;
          end;
          fTempProdutos.Post;
        end
        else
        begin
          vOK := true;
          buscas2.Close;
          buscas2.SQL.Text := ' UPDATE RESERVA_ALMOXARIFADO_ITENS SET DATA_VER = NULL ' +
           ' WHERE CODIGO = :CODIGO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA ';
          buscas2.ParamByName('CODIGO').AsInteger := buscas.FieldByName('CODIGO').AsInteger;
          buscas2.ParamByName('NITEM').AsString := buscas.FieldByName('NITEM').AsString;
          buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas2.ExecSQL;

          if not buscas.FieldByName('DATA_VER').IsNull then
          begin
            vAssunto := 'Reserva de produtos:';//'Produto ' + QuotedStr(trim(buscas.FieldByName('NUM_FAB_PROD').AsString)) + ' indisponível';
            vMensagem := 'Produto ' + QuotedStr(trim(buscas.FieldByName('NUM_FAB_PROD').AsString)) +
              ' reservado indisponível para reserva: ' + IntToStr(buscas.FieldByName('CODIGO').AsInteger);

            fTempVendedor.Filter := ' COD_VENDEDOR = ' + IntToStr(buscas.FieldByName('COD_VENDEDOR').AsInteger);
            fTempVendedor.Filtered := true;
            if fTempVendedor.IsEmpty then
            begin
              fTempVendedor.Insert;
              fTempVendedor.FieldByName('COD_VENDEDOR').AsInteger := buscas.FieldByName('COD_VENDEDOR').AsInteger;
              fTempVendedor.FieldByName('MENSAGEM').AsString := vMensagem;
              fTempVendedor.Post;
            end
            else
            begin
              vlista.Text := fTempVendedor.FieldByName('MENSAGEM').AsString;
              fTempVendedor.Edit;
              vlista.Add(vMensagem);
              fTempVendedor.FieldByName('MENSAGEM').AsString := vlista.Text;
              fTempVendedor.Post;
            end;
          end;
        end;
//            vDadosIni.vEmailVend := 'S';
//            vDadosIni.EnvEmail(buscas2, vAssunto, vMensagem, buscas.FieldByName('COD_VENDEDOR').AsInteger, '');
//            vDadosIni.EnvMensMobile(buscas2, dtmEstoqueFechado.SpIncCodigo, vAssunto, vMensagem, vCodVendedor);
        buscas.Next;
      end;
      fTempProdutos.Next;
    end;
    CommitaTransacao;
    fTempVendedor.Filtered := false;

    fTempVendedor.First;
    while not fTempVendedor.Eof do
    begin
      vDadosIni.EnvMensMobile(buscas2, dtmEstoqueFechado.SpIncCodigo, vAssunto,
        fTempVendedor.FieldByName('MENSAGEM').AsString,
        fTempVendedor.FieldByName('COD_VENDEDOR').AsInteger, false);
      fTempVendedor.Next;
    end;
    CommitaTransacao;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

end.

