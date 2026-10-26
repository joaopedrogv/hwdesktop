unit uClassesNotasFiscais_itens_detalhes;

interface

uses
  uDataSet_OOP,
  DB,
  DBClient,
  uClassesNotasFiscais_consts,
  uClassesNotasFiscais_itens_cadastros,
  Classes,
  IBQuery,
  vw_clientes_dest_class,
  pedvenda_ref_nf_class,
  uDadosIni, Contnrs;

type

  TNFItemVFE = class(TDataSet_OOP)
  private
    fAlteracao: Boolean;
    fRetorno: Boolean;
  public
    constructor create;
    function selecionaItens(pCOD_NF: integer): boolean;
    procedure delete;
    function alterar: Boolean;
    function incluir: Boolean;
    function salvar(pQUANTIDADE, pVALOR_TOTAL: Extended): Boolean;
    function qtdeValida(pQtde: Extended; pShowErro: Boolean = True): Boolean;
    function montarRetornoRemessa: Boolean;

    property alteracao: Boolean read fAlteracao;
    property retorno: Boolean read fRetorno;
  var
    _dataTemp: TClientDataSet;
    vNumNF: Integer;
  end;

  TNF_ExportacaoIndireta = class(TDataSet_OOP)
  private
    fNITEM: Integer;
    fNITEM_DET: Integer;
    fCOD_NF: Integer;
  public
    constructor create;
    function _selecionaExportInd: Boolean;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    property vCOD_NF: Integer read fCOD_NF write fCOD_NF;
    property vNITEM: Integer read fNITEM write fNITEM;
    property vNITEM_DET: Integer read fNITEM_DET write fNITEM_DET;

  end;

  TNF_ExportacaoDetalhe = class(TDataSet_OOP)
  private
    fNITEM: Integer;
    fCOD_NF: Integer;
    procedure ExportacaoDetalheAfterScroll(DataSet: TDataSet);
  public
    constructor create;
    destructor Destroy; override;
    function _selecionaExportacaoDetalhe: Boolean;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    property vCOD_NF: Integer read fCOD_NF write fCOD_NF;
    property vNITEM: Integer read fNITEM write fNITEM;
  var
    vExpIndireta: TNF_ExportacaoIndireta;
  end;

  TNFADI = class(TDataSet_OOP)
  private
    fNITEM: Integer;
    fNITEM_DI: Integer;
    fCOD_NF: Integer;
  public
    constructor create;
    function _selecionaADI: Boolean;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    property vCOD_NF: Integer read fCOD_NF write fCOD_NF;
    property vNITEM: Integer read fNITEM write fNITEM;
    property vNITEM_DI: Integer read fNITEM_DI write fNITEM_DI;

  end;

  TNFDI = class(TDataSet_OOP)
  private
    fNITEM: Integer;
    fCOD_NF: Integer;
    procedure DIAfterScroll(DataSet: TDataSet);
  public
    constructor create;
    destructor Destroy; override;
    function _selecionaDI: Boolean;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    property vCOD_NF: Integer read fCOD_NF write fCOD_NF;
    property vNITEM: Integer read fNITEM write fNITEM;
  var
    vADI: TNFADI;
  end;

  TNFDetECF = class(TDataSet_OOP)
  private
    FQtdePendente, FQtdeTotal, FQtdeInformada: Integer;
  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; override;
    function selecionaDetalhesECF(codNF: Integer): boolean; overload;
    function selecionaDetalhesECF(codNF, pNItem: Integer): boolean; overload;
    function verificaImpressoraCNIEE: boolean;
    function removerItensNotaNaoConfirmada: boolean;
    property QtdePendente: Integer read FQtdePendente;
    property QtdeInformada: Integer read FQtdeInformada;
  var
    vCniee: TCnieeNF;
    vEstoqueECF: TEstoqueECFNF;
    vECF: Boolean;
    vMarca, vModelo, vTipo: string;
  end;

  TNFDetVeic = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function selecionaDetalheVeiculo(codNF: integer): boolean; overload;
    function selecionaDetalheVeiculo(codNF, pNItem: integer): boolean; overload;
  var
    vModV: TModVeicNF;
    vCorFab: TCorFabricanteNF;
    vCombutivelV: TCombustivelNF;
    vMarcasV: TMarcasNF;
  end;

  TNFItem_Divergencias_NCM_CEST = class(TObject)
  private
    fDivergencias: TClientDataSet;
    fDataSource: TDataSource;
    fBuscas: TIBQuery;
    fTestarNCM: Boolean;
    fTestarCEST: Boolean;
    fEventAfterScroll: TEvent;
    procedure iniciarDados(Query: TIBQuery);
    procedure divergenciasAfterScroll(DataSet: TDataSet);
    function getDescricaoNCM(NCM: string):   string;
    function getDescricaoCEST(CEST: string): string;
  public
    destructor Destroy; override;
    constructor create;
    procedure clearEventos;
    function verificaDivergencias(vItem: TDataSet_OOP): Boolean;
    function selecionarAcaoNCM(destino: string): Boolean;
    function selecionarAcaoCEST(destino: string): Boolean;
    function divergenciasMarcadas: Boolean;

    property TestarNCM       : Boolean        read fTestarNCM;
    property TestarCEST      : Boolean        read fTestarCEST;
    property divergencias    : TClientDataSet read fDivergencias     write fDivergencias;
    property dataSource      : TDataSource    read fDataSource       write fDataSource;
    property eventAfterScroll: TEvent         read fEventAfterScroll write fEventAfterScroll;
  end;

  TNFTributacaoSefazTmp = class
  private
    Ftitulo: string;
    FcodigoAjuste: string;
    FcompoeCusto: Boolean;
  public
    property titulo: string read Ftitulo write Ftitulo;
    property compoeCusto: Boolean read FcompoeCusto write FcompoeCusto;
    property codigoAjuste: string read FcodigoAjuste write FcodigoAjuste;
  end;

  RItemSefazTributo = record
    mva, baseST, valorSt: Double;
    espelho, compoeCusto, tribSefazId: string;
  end;

  TTributacaoSefazModel = class
  private
    Fid: string;
    Ftitulo: string;
    FcompoeCusto: string;
  public
    property id: string read Fid write Fid;
    property titulo: string read Ftitulo write Ftitulo;
    property compoeCusto: string read FcompoeCusto write FcompoeCusto;
  end;

  TNFTributacaoSefaz = class(TDataSet_OOP)
  public
    constructor create(Owner: TDataSet_OOP);

    function Open: Boolean; override;
    function Post: Boolean; override;
    function Delete: Boolean; override;
  end;

  TNFItem_AntecipacaoST = class(TDataSet_OOP)
  private
    FOwner: TDataSet_OOP;
    FSelectItem: TNotifyEvent;
    FtribSefaz: TNFTributacaoSefaz;
//    tribSefaz: array of TNFTributacaoSefaz;
    procedure dataSetAfterScroll(DataSet: TDataSet);
  public
    constructor create(Owner: TDataSet_OOP);
    destructor Destroy; override;

    function AnalisarItens(usarAliq: Boolean = False; aplicarAnalise: Boolean = False): Integer;
    function AnalisarItem(force: Boolean; usarAliq: Boolean = False): Boolean;
    function SalvarAntecipacao(payload: RItemSefazTributo): Boolean;
//  RItemSefazTributo
    function NaoAceitarAntecipacao: Boolean;
    function SalvarMva(mva: Double): Boolean;
    function SalvarAliq(aliq: Double; tribSefId: string): Boolean;
    function RemoverAtencipacaoTodos(): Boolean;

    property OnSelectItem: TNotifyEvent read FSelectItem write FSelectItem;
    property tribSefaz: TNFTributacaoSefaz read FtribSefaz write FtribSefaz;
//    property SilentMode: Boolean read FSilentMode write FSilentMode;
  end;

  

implementation

uses
  SysUtils, IBDatabase, uDtmAtivo, uDtmNF,
  Forms, Windows, StrUtils, uClassesNotasFiscais, Variants,
//  Variants,
//  config_sistema_class,
//  UClassesClientes,
//  uClassesCadastrosBasicos,
//  uClassesProdutos,
//  notafiscal_class,
//  DateUtils,
//  uClassesNotasFiscais_consts,
//  Dialogs,
//  uClasseConexao,
//gs1prefix,
  uPadrao,
  opfiscal_model,
  cest_mva_class,
  cest_ncm_class,
  cest__class,
  CestVarianteMvaNcmUf_Model,
  hw_utils,
  hw_strings,
  Math, uClassesNotasFiscais_Cobranca, notafiscal_item_class;
//  uEscollhaProdutoNF,
//  Controls;
//  sped_informacao_complementar_class,
//  base_class;

{ TNFItemVFE }

function TNFItemVFE.alterar: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  fAlteracao := True;
  Result := fAlteracao;
end;

constructor TNFItemVFE.create;
begin
  fAlteracao := False;
  dataSet := TClientDataSet(DtmNF.cdsItVFE);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);

  _dataTemp := TClientDataSet(dtmNF.cdsTempITVFE);
  if _dataTemp.Tag <> 22 then
    _dataTemp.CreateDataSet;
  _dataTemp.Tag := 22;
  _dataTemp.IndexFieldNames := 'NITEM';
end;

procedure TNFItemVFE.delete;
begin
  if _dataTemp.IsEmpty then
    Exit;
  IndexFieldNames := 'NITEM';
  FindNearest([_dataTemp.FieldByName('nitem').AsInteger]);
  dataSet.Edit;
  dataSet.FieldByName('qtde_nf').AsFloat :=
    dataSet.FieldByName('qtde_nf').AsFloat - _dataTemp.FieldByName('quantidade').AsFloat;
  dataSet.Post;

  _dataTemp.Delete;
end;

function TNFItemVFE.incluir: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  fAlteracao := False;
  Result := not fAlteracao;
end;

function TNFItemVFE.montarRetornoRemessa: Boolean;
begin
  Result := False;
  if Application.MessageBox(pchar('Deseja realmente fazer a nota fiscal de Retorno de Remessa?'),
    'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  try

    _dataTemp.EmptyDataSet;

    dataSet.First;
    while not dataSet.Eof do
    begin

      if (dataSet.FieldByName('QUANTIDADE').AsFloat -  dataSet.FieldByName('qtde_util').AsFloat) > 0 then
      begin

        _dataTemp.Insert;
        _dataTemp.FieldByName('NITEM').AsInteger := dataSet.FieldByName('NITEM').AsInteger;
        _dataTemp.FieldByName('NUM_FAB_PROD').AsString := dataSet.FieldByName('NUM_FAB_PROD').AsString;
        _dataTemp.FieldByName('DESCRICAO_ITEM').AsString := dataSet.FieldByName('DESCRICAO_ITEM').AsString;
        _dataTemp.FieldByName('QUANTIDADE').AsFloat := (dataSet.FieldByName('QUANTIDADE').AsFloat - dataSet.FieldByName('qtde_util').AsFloat);
        _dataTemp.FieldByName('VALOR_UNITARIO').AsFloat := dataSet.FieldByName('VALOR_UNITARIO').AsFloat;
        _dataTemp.FieldByName('VALOR_TOTAL').AsFloat := RoundTo(_dataTemp.FieldByName('QUANTIDADE').AsFloat * _dataTemp.FieldByName('VALOR_UNITARIO').AsFloat, -2);
        _dataTemp.Post;

      end;

      dataSet.Next;
    end;

    fRetorno := True;
    Result := True;
  except on E: Exception do
    begin
      dataSet.Cancel;
      _dataTemp.Cancel;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;

end;

function TNFItemVFE.qtdeValida(pQtde: Extended; pShowErro: Boolean): Boolean;
var
  pQtdeDisponivel: Extended;
begin
  Result := True;
  if dataSet.IsEmpty then
    if pShowErro then
    begin
      Application.MessageBox('Sem itens para a nota fiscal selecionada', 'Atenção', 0 + 64);
      Exit;
    end;

  pQtdeDisponivel := dataSet.FieldByName('quantidade').AsFloat - dataSet.FieldByName('qtde_util').AsFloat -
    dataSet.FieldByName('qtde_nf').AsFloat;

  if fAlteracao then
    pQtdeDisponivel := pQtdeDisponivel + _dataTemp.FieldByName('quantidade').AsFloat;

  Result := pQtdeDisponivel >= pQtde;

  if not Result then
    if pShowErro then
    begin
      Application.MessageBox('Quantidade informada menor que a disponível', 'Atenção', 0 + 64);
      Exit;
    end;

end;

function TNFItemVFE.salvar(pQUANTIDADE, pVALOR_TOTAL: Extended): Boolean;
var
  vVALOR_UNITARIO: Extended;
  vCasasDec: Integer;
begin
  Result := False;
  try

    if not qtdeValida(pQUANTIDADE) then
      Exit;

    if pQUANTIDADE <= 0 then
      raiseExceptionCreate('Quantidade deve ser informada', '');

    if pVALOR_TOTAL <= 0 then
      raiseExceptionCreate('Valor total deve ser informada', '');

    vCasasDec:= 1;
    while (vDadosIni.StrToFloatFormat(pVALOR_TOTAL, 2) <>
      vDadosIni.StrToFloatFormat(vVALOR_UNITARIO * pQUANTIDADE, 2)) do
    begin
      vVALOR_UNITARIO := vDadosIni.StrToFloatFormat(pVALOR_TOTAL / pQUANTIDADE, vCasasDec);
      Inc(vCasasDec);
    end;

    dataSet.Edit;
    if fAlteracao then
    begin
      _dataTemp.Edit;
      dataSet.FieldByName('QTDE_NF').AsFloat := dataSet.FieldByName('QTDE_NF').AsFloat -
        _dataTemp.FieldByName('QUANTIDADE').AsFloat;
    end
    else
    begin

      _dataTemp.Insert;
      _dataTemp.FieldByName('NITEM').AsInteger := dataSet.FieldByName('NITEM').AsInteger;
      _dataTemp.FieldByName('NUM_FAB_PROD').AsString := dataSet.FieldByName('NUM_FAB_PROD').AsString;
      _dataTemp.FieldByName('DESCRICAO_ITEM').AsString := dataSet.FieldByName('DESCRICAO_ITEM').AsString;

    end;

    _dataTemp.FieldByName('QUANTIDADE').AsFloat := pQUANTIDADE;
    _dataTemp.FieldByName('VALOR_UNITARIO').AsFloat := vVALOR_UNITARIO;
    _dataTemp.FieldByName('VALOR_TOTAL').AsFloat := pVALOR_TOTAL;
    _dataTemp.Post;

    dataSet.FieldByName('QTDE_NF').AsFloat := dataSet.FieldByName('QTDE_NF').AsFloat +
        _dataTemp.FieldByName('QUANTIDADE').AsFloat;
    dataSet.Post;

    Result := True;

  except on E: Exception do
    begin
      dataSet.Cancel;
      _dataTemp.Cancel;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;

end;

function TNFItemVFE.selecionaItens(pCOD_NF: integer): boolean;
begin
  Result := montaSelect('select nitem, num_fab_prod, descricao_item, valor_unitario, valor_total, quantidade,' +
    ' coalesce((select sum(ne.quantidade_nf_vfe) from notafiscal_item_vfe ne where ne.cod_nf = ni.cod_nf and' +
    ' ne.cod_empresa = ni.cod_empresa and ne.nitem = ni.nitem),0)' +
    ' qtde_util' +
    ' from notafiscal_item ni' +
    ' where ni.cod_nf = ' + IntToStr(pCOD_NF) +
    ' and ni.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by ni.nitem');
  _dataTemp.EmptyDataSet;
  fRetorno := False;
end;

{ TNF_ExportacaoIndireta }

constructor TNF_ExportacaoIndireta.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsDetExpInd);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TNF_ExportacaoIndireta.delete: Boolean;
var
  vTmp: string;
begin
  Result := False;
  if (dataSet.IsEmpty) or (not dataSet.Active) then
    Exit;

  if not vDadosIni.PesqPros('NF0189', 'EXCLUIR', 'NUM RE ' + Trim(dataSet.FieldByName('NRE').asString),
    'NOTAFISCAL_ITEM_EXPORTIND', dataSet.FieldByName('COD_NF').AsString, buscas, True) then
    Exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
     Exit;

  vTmp := dataSet.FieldByName('COD_NF').AsString + '-' +
     dataSet.FieldByName('NITEM').AsString + '-' +
     dataSet.FieldByName('NITEM_DET').AsString + '-' +
     dataSet.FieldByName('NITEM_EXIND').AsString;

  try
    Result := inherited Delete;

    if Apply then
    begin
      CommitaTransacao;
      Result := True;
      vDadosIni.GravaAuditoria('NF0189', 'EXCLUIR', 'SUCESSO',
        'NOTAFISCAL_ITEM_EXPORTIND', vTmp, buscas);
    end
    else
    begin
      RollBackTransacao;
      result := False;
      vDadosIni.GravaAuditoria('NF0189', 'EXCLUIR', 'FALHA',
        'NOTAFISCAL_ITEM_EXPORTIND', vTmp, buscas);
    end;

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao excluir dados sobre exportação indireta. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TNF_ExportacaoIndireta.delete. ' + e.Message);
    end;
  end;
end;

function TNF_ExportacaoIndireta.edit: Boolean;
begin
  Result := False;
  if (dataSet.IsEmpty) or (not dataSet.Active) then
    Exit;

  Result := inherited Edit;
end;

function TNF_ExportacaoIndireta.insert: Boolean;
begin
  Result := False;

  if fNITEM_DET = 0 then
  begin
    Application.MessageBox('Antes de incluir dados sobre a Exportação Indireta deve ser feito o cadastro do Drawback', 'Atenção', 0 + 64);
    Exit;
  end;

  if dataSet.RecordCount >= 1 then
  begin
    Application.MessageBox('Apenas 1 registro deve ser informado para cada cadastro de Drawback', 'Atenção', 0 + 64);
    Exit;
  end;

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_NF').AsInteger := fCOD_NF;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('NITEM').AsInteger := fNITEM;
    dataSet.FieldByName('NITEM_DET').AsInteger := fNITEM_DET;
    dataSet.FieldByName('NITEM_EXIND').AsInteger := dataSet.RecordCount + 1;
  end;
end;

function TNF_ExportacaoIndireta.post: Boolean;
var
  vTmp: string;
begin

  Result := False;
  try

    vTmp := dataSet.FieldByName('COD_NF').AsString + '-' +
      dataSet.FieldByName('NITEM').AsString + '-' +
      dataSet.FieldByName('NITEM_DET').AsString + '-' +
      dataSet.FieldByName('NITEM_EXIND').AsString;

    if not vDadosIni.PesqPros('NF0190', 'SALVAR', 'NUM ' + Trim(dataSet.FieldByName('NRE').asString),
      'NOTAFISCAL_ITEM_EXPORTIND', vTmp, buscas, True) then
      exit;

    if not (dataSet.state in [dsedit, dsinsert]) then
      exit;

    if Trim(dataSet.FieldByName('NRE').asString) = '' then
      raiseExceptionCreate('Número do Registro de Exportação deve ser preenchido', 'dbeDetExportIndNRE');

    if Trim(dataSet.FieldByName('CHNFE').asString) = '' then
      raiseExceptionCreate('Chave de Acesso da NFe recebida para exportação deve ser preenchida', 'dbeDetExportIndCHNFE')
    else if (Length(Trim(dataSet.FieldByName('CHNFE').asString)) <> 44) or
      (vDadosIni.apenasNumeros(Trim(dataSet.FieldByName('CHNFE').asString)) <> Trim(dataSet.FieldByName('CHNFE').asString)) then
      raiseExceptionCreate('Chave de Acesso da NFe recebida para exportação inválida, deve conter 44 números', 'dbeDetExportIndCHNFE');

    if dataSet.FieldByName('QEXPORT').AsFloat < 0 then
      raiseExceptionCreate('Quantidade do item realmente exportado deve ser maior que zero', 'dbeDetExportIndQEXPORT');

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      CommitaTransacao;
      exit;
    end;
    if Apply then
    begin
      CommitaTransacao;
      result := true;
      vDadosIni.GravaAuditoria('NF0190', 'SALVAR', 'SUCESSO NUM RE ' + Trim(dataSet.FieldByName('NRE').asString),
        'NOTAFISCAL_ITEM_EXPORTIND', vTmp, buscas);
    end
    else
    begin
      RollBackTransacao;
      result := True;
      vDadosIni.GravaAuditoria('NF0190', 'SALVAR', 'FALHA NUM RE ' + Trim(dataSet.FieldByName('NRE').asString),
        'NOTAFISCAL_ITEM_EXPORTIND', vTmp, buscas);
    end;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao salvar dados sobre exportação indireta. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TNF_ExportacaoIndireta.post. ' + e.Message);
    end;
  end;
end;

function TNF_ExportacaoIndireta._selecionaExportInd: Boolean;
begin
  Result := montaSelect('select * from NOTAFISCAL_ITEM_EXPORTIND' +
    ' where cod_nf = ' + IntToStr(vCOD_NF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and nitem = ' + IntToStr(vNITEM) +
    ' and nitem_det = ' + IntToStr(vNITEM_DET));

  IndexFieldNames := 'NITEM_EXIND';
end;

{ TNF_ExportacaoDetalhe }

constructor TNF_ExportacaoDetalhe.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsDetExp);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);

  vExpIndireta := TNF_ExportacaoIndireta.create;
  dataSet.AfterScroll := ExportacaoDetalheAfterScroll;
end;

function TNF_ExportacaoDetalhe.delete: Boolean;
var
  vTmp: string;
begin
  Result := False;
  if (dataSet.IsEmpty) or (not dataSet.Active) then
    Exit;

   vTmp := dataSet.FieldByName('COD_NF').AsString + '-' +
     dataSet.FieldByName('NITEM').AsString + '-' +
     dataSet.FieldByName('NITEM_DET').AsString;

  if not vDadosIni.PesqPros('NF0185', 'EXCLUIR', 'Drawback ' + Trim(dataSet.FieldByName('NDRAW').asString),
    'NOTAFISCAL_ITEM_DETEXPORT', vTmp, buscas, True) then
    Exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
     Exit;

  try
    Result := inherited Delete;

    if Apply then
    begin
      CommitaTransacao;
      result := True;
      vDadosIni.GravaAuditoria('NF0185', 'EXCLUIR', 'SUCESSO',
        'NOTAFISCAL_ITEM_DETEXPORT', vTmp, buscas);
    end
    else
    begin
      RollBackTransacao;
      result := False;
      vDadosIni.GravaAuditoria('NF0185', 'EXCLUIR', 'FALHA',
        'NOTAFISCAL_ITEM_DETEXPORT', vTmp, buscas);
    end;

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao excluir Detalhe de Exportação. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TNF_ExportacaoDetalhe.delete. ' + e.Message);
    end;
  end;
end;

destructor TNF_ExportacaoDetalhe.Destroy;
begin
  vExpIndireta.Free;
  vExpIndireta := nil;
  inherited;
end;

function TNF_ExportacaoDetalhe.edit: Boolean;
begin
  Result := False;
  if (dataSet.IsEmpty) or (not dataSet.Active) then
    Exit;

  Result := inherited Edit;
end;

procedure TNF_ExportacaoDetalhe.ExportacaoDetalheAfterScroll(DataSet: TDataSet);
begin
  vExpIndireta.vCOD_NF := fCOD_NF;
  vExpIndireta.vNITEM := fNITEM;
  vExpIndireta.vNITEM_DET := DataSet.FieldByName('NITEM_DET').AsInteger;
  vExpIndireta._selecionaExportInd;
end;

function TNF_ExportacaoDetalhe.insert: Boolean;
begin
  Result := False;
  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_NF').AsInteger := fCOD_NF;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('NITEM').AsInteger := fNITEM;
    dataSet.FieldByName('NITEM_DET').AsInteger := dataSet.RecordCount + 1;
  end;
end;

function TNF_ExportacaoDetalhe.post: Boolean;
var
  vTmp: string;
begin

  Result := False;
  try

     vTmp := dataSet.FieldByName('COD_NF').AsString + '-' +
       dataSet.FieldByName('NITEM').AsString + '-' +
       dataSet.FieldByName('NITEM_DET').AsString;

    if not vDadosIni.PesqPros('NF0186', 'SALVAR', 'Drawback ' + Trim(dataSet.FieldByName('NDRAW').asString),
      'NOTAFISCAL_ITEM_DETEXPORT', vTmp, buscas, True) then
      exit;

    if not (dataSet.state in [dsedit, dsinsert]) then
      exit;

    if Trim(dataSet.FieldByName('NDRAW').asString) = '' then
      raiseExceptionCreate('Número do ato concessório de Drawback deve ser preenchido', 'dbeDetExportCadNDRAW');

    Result := inherited post;

    if Apply then
    begin
      CommitaTransacao;
      result := true;
      vDadosIni.GravaAuditoria('NF0186', 'SALVAR', 'SUCESSO Drawback ' + Trim(dataSet.FieldByName('NDRAW').asString),
        'NOTAFISCAL_ITEM_DETEXPORT', Trim(dataSet.FieldByName('NITEM_DET').AsString), buscas);

      vExpIndireta.vCOD_NF := fCOD_NF;
      vExpIndireta.vNITEM := fNITEM;
      vExpIndireta.vNITEM_DET := DataSet.FieldByName('NITEM_DET').AsInteger;
      vExpIndireta._selecionaExportInd;

    end
    else
    begin
      RollBackTransacao;
      result := True;
      vDadosIni.GravaAuditoria('NF0186', 'SALVAR', 'FALHA Drawback ' + Trim(dataSet.FieldByName('NDRAW').asString),
        'NOTAFISCAL_ITEM_DETEXPORT', Trim(dataSet.FieldByName('NITEM_DET').AsString), buscas);
    end;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao salvar Detalhes da Exportação. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TNF_ExportacaoDetalhe.post. ' + e.Message);
    end;
  end;
end;

function TNF_ExportacaoDetalhe._selecionaExportacaoDetalhe: Boolean;
begin
  Result := montaSelect('select * from NOTAFISCAL_ITEM_DETEXPORT' +
    ' where cod_nf = ' + IntToStr(vCOD_NF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and nitem = ' + IntToStr(vNITEM));
  IndexFieldNames := 'NITEM_DET';
end;

{ TNFADI }

constructor TNFADI.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsADI);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TNFADI.delete: Boolean;
begin
  Result := False;
  if (dataSet.IsEmpty) or (not dataSet.Active) then
    Exit;

  if not vDadosIni.PesqPros('NF0139', 'EXCLUIR', 'NUM ' + Trim(dataSet.FieldByName('NADICAO').asString),
    'NOTAFISCAL_ITEM_ADI', dataSet.FieldByName('COD_NF').AsString, buscas, True) then
    Exit;
            
   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
     Exit;

  try
    Result := inherited Delete;

    if Apply then
    begin
      CommitaTransacao;
      Result := True;
      vDadosIni.GravaAuditoria('NF0139', 'EXCLUIR', 'SUCESSO',
        'NOTAFISCAL_ITEM_ADI', Trim(dataSet.FieldByName('NITEM_ADI').AsString), buscas);
    end
    else
    begin
      RollBackTransacao;
      result := False;
      vDadosIni.GravaAuditoria('NF0139', 'EXCLUIR', 'FALHA',
        'NOTAFISCAL_ITEM_ADI', Trim(dataSet.FieldByName('NITEM_ADI').AsString), buscas);
    end;

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao excluir ADI. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TNFADI.delete. ' + e.Message);
    end;
  end;
end;

function TNFADI.edit: Boolean;
begin
  Result := False;
  if (dataSet.IsEmpty) or (not dataSet.Active) then
    Exit;

  Result := inherited Edit;
end;

function TNFADI.insert: Boolean;
begin
  Result := False;

  if fNITEM_DI = 0 then
  begin
    Application.MessageBox('Antes de incluir ADI deve ser feito o cadastro da DI', 'Atenção', 0 + 64);

    Exit;
  end;

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_NF').AsInteger := fCOD_NF;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('NITEM').AsInteger := fNITEM;
    dataSet.FieldByName('NITEM_DI').AsInteger := fNITEM_DI;
    dataSet.FieldByName('NITEM_ADI').AsInteger := dataSet.RecordCount + 1;
  end;
end;

function TNFADI.post: Boolean;
begin

  Result := False;
  try

    if not vDadosIni.PesqPros('NF0140', 'SALVAR', 'NUM ' + Trim(dataSet.FieldByName('NADICAO').asString),
      'NOTAFISCAL_ITEM_ADI', Trim(dataSet.FieldByName('NITEM_ADI').asString), buscas, True) then
      exit;

    if not (dataSet.state in [dsedit, dsinsert]) then
      exit;

    if Trim(dataSet.FieldByName('NADICAO').asString) = '' then
      raiseExceptionCreate('Numero da adição deve ser preenchida', 'DBEdit268');

    if Trim(dataSet.FieldByName('NSEQADIC').asString) = '' then
      raiseExceptionCreate('Numero sequencial do item dentro da adição deve ser preenchida', 'DBEdit269');

    if Trim(dataSet.FieldByName('CFABRICANTE').asString) = '' then
      raiseExceptionCreate('Código do fabricante estrangeiro deve ser preenchido', 'DBEdit270');

    if dataSet.FieldByName('VDESCDI').AsFloat < 0 then
      raiseExceptionCreate('Valor do desconto do item da DI – adição se preenchido deve ser maior que zero', 'DBEdit271');

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      CommitaTransacao;
      exit;
    end;
    if Apply then
    begin
      CommitaTransacao;
      result := true;
      vDadosIni.GravaAuditoria('NF0140', 'SALVAR', 'SUCESSO NUM ' + Trim(dataSet.FieldByName('NADICAO').asString),
        'NOTAFISCAL_ITEM_ADI', Trim(dataSet.FieldByName('NITEM_ADI').AsString), buscas);
    end
    else
    begin
      RollBackTransacao;
      result := True;
      vDadosIni.GravaAuditoria('NF0140', 'SALVAR', 'FALHA NUM ' + Trim(dataSet.FieldByName('NADICAO').asString),
        'NOTAFISCAL_ITEM_ADI', Trim(dataSet.FieldByName('NITEM_ADI').AsString), buscas);
    end;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao salvar ADI. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TNFADI.post. ' + e.Message);
    end;
  end;
end;

function TNFADI._selecionaADI: Boolean;
begin
  Result := montaSelect('select * from notafiscal_item_adi' +
    ' where cod_nf = ' + IntToStr(vCOD_NF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and nitem = ' + IntToStr(vNITEM) +
    ' and nitem_di = ' + IntToStr(vNITEM_DI));

  IndexFieldNames := 'NITEM_ADI';
end;

{ TNFDI }

constructor TNFDI.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsDI);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);

  vADI := TNFADI.create;
  dataSet.AfterScroll := DIAfterScroll;
end;

function TNFDI.delete: Boolean;
begin
  Result := False;
  if (dataSet.IsEmpty) or (not dataSet.Active) then
    Exit;

  if not vDadosIni.PesqPros('NF0135', 'EXCLUIR', 'NUM ' + Trim(dataSet.FieldByName('NDI').asString),
    'NOTAFISCAL_ITEM_DI', dataSet.FieldByName('COD_NF').AsString, buscas, True) then
    Exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
     Exit;

  try
    Result := inherited Delete;

    if Apply then
    begin
      CommitaTransacao;
      result := True;
      vDadosIni.GravaAuditoria('NF0135', 'EXCLUIR', 'SUCESSO',
        'NOTAFISCAL_ITEM_DI', Trim(dataSet.FieldByName('NITEM_DI').AsString), buscas);
    end
    else
    begin
      RollBackTransacao;
      result := False;
      vDadosIni.GravaAuditoria('NF0135', 'EXCLUIR', 'FALHA',
        'NOTAFISCAL_ITEM_DI', Trim(dataSet.FieldByName('NITEM_DI').AsString), buscas);
    end;

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao excluir DI. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TNFDI.delete. ' + e.Message);
    end;
  end;
end;

destructor TNFDI.Destroy;
begin
  vADI.Free;
  vADI := nil;
  inherited;
end;

procedure TNFDI.DIAfterScroll(DataSet: TDataSet);
begin
  vADI.vCOD_NF := fCOD_NF;
  vADI.vNITEM := fNITEM;
  vADI.vNITEM_DI := DataSet.FieldByName('NITEM_DI').AsInteger;
  vADI._selecionaADI;
end;

function TNFDI.edit: Boolean;
begin
  Result := False;
  if (dataSet.IsEmpty) or (not dataSet.Active) then
    Exit;

  Result := inherited Edit;
end;

function TNFDI.insert: Boolean;
begin
  Result := False;
  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_NF').AsInteger := fCOD_NF;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('NITEM').AsInteger := fNITEM;
    dataSet.FieldByName('NITEM_DI').AsInteger := dataSet.RecordCount + 1;
  end;
end;

function TNFDI.post: Boolean;
begin

  Result := False;
  try

    if not vDadosIni.PesqPros('NF0136', 'SALVAR', 'NUM ' + Trim(dataSet.FieldByName('NDI').asString),
      'NOTAFISCAL_ITEM_DI', Trim(dataSet.FieldByName('NITEM_DI').asString), buscas, True) then
      exit;

    if not (dataSet.state in [dsedit, dsinsert]) then
      exit;

    if Trim(dataSet.FieldByName('NDI').asString) = '' then
      raiseExceptionCreate('Número do Documento de Importação DI/DSI/DA deve ser preenchido', 'DBEdit262');

    if Trim(dataSet.FieldByName('DDI').asString) = '' then
      raiseExceptionCreate('Data de Registro da DI/DSI/DA deve ser preenchida', 'DBEdit263');

    if Trim(dataSet.FieldByName('XLOCDESEMB').asString) = '' then
      raiseExceptionCreate('Local de desembaraço deve ser preenchido', 'DBEdit264');

    if Trim(dataSet.FieldByName('UFDESEMB').asString) = '' then
      raiseExceptionCreate('Sigla da UF onde ocorreu o Desembaraço Aduaneiro deve ser preenchida', 'DBComboBox18');

    if Trim(dataSet.FieldByName('DDESEMB').asString) = '' then
      raiseExceptionCreate('Data do Desembaraço Aduaneiro deve ser preenchida', 'DBEdit265');

    if dataSet.FieldByName('TPVIATRANSP').AsInteger = 0 then
      raiseExceptionCreate('Via de transporte internacional informada na Declaração de Importação (DI) deve ser informada', 'dbrgTPVIATRANSP');

    if dataSet.FieldByName('TPINTERMEDIO').AsInteger = 0 then
      raiseExceptionCreate('Forma de importação quanto a intermediação deve ser informada', 'dbrgTPVIATRANSP');

    if vDadosIni.strEstaContidoEm(dataSet.FieldByName('TPINTERMEDIO').AsString, ['2', '3']) then
      if Trim(dataSet.FieldByName('CNPJ').asString) = '' then
        raiseExceptionCreate('CNPJ do adquirente ou do encomendante obrigatório quando importação por conta e ordem ou por encomenda', 'dbeDICNPJ');

    if Trim(dataSet.FieldByName('CNPJ').asString) <> '' then
      if not cgc(Trim(dataSet.FieldByName('CNPJ').asString)) then
        raiseExceptionCreate('CNPJ do adquirente ou do encomendante inválido', 'dbeDICNPJ');

    if Trim(dataSet.FieldByName('CEXPORTADOR').asString) = '' then
      raiseExceptionCreate('Código do exportador deve ser preenchido', 'DBEdit267');

    Result := inherited post;

    if Apply then
    begin
      CommitaTransacao;
      result := true;
      vDadosIni.GravaAuditoria('NF0136', 'SALVAR', 'SUCESSO NUM ' + Trim(dataSet.FieldByName('NDI').asString),
        'NOTAFISCAL_ITEM_DI', Trim(dataSet.FieldByName('NITEM_DI').AsString), buscas);

      vADI.vCOD_NF := fCOD_NF;
      vADI.vNITEM := fNITEM;
      vADI.vNITEM_DI := DataSet.FieldByName('NITEM_DI').AsInteger;
      vADI._selecionaADI;
      
    end
    else
    begin
      RollBackTransacao;                                                              
      result := True;
      vDadosIni.GravaAuditoria('NF0136', 'SALVAR', 'FALHA NUM ' + Trim(dataSet.FieldByName('NDI').asString),
        'NOTAFISCAL_ITEM_DI', Trim(dataSet.FieldByName('NITEM_DI').AsString), buscas);
    end;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao salvar DI. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TNFDI.post. ' + e.Message);
    end;
  end;
end;

function TNFDI._selecionaDI: Boolean;
begin
  Result := montaSelect('select * from notafiscal_item_di' +
    ' where cod_nf = ' + IntToStr(vCOD_NF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and nitem = ' + IntToStr(vNITEM));
  IndexFieldNames := 'NITEM_DI';
end;

{ TNFDetECF }

constructor TNFDetECF.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsDENf);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
  vCniee := TCnieeNF.create;
  vEstoqueECF := TEstoqueECFNF.create;
end;

destructor TNFDetECF.Destroy;
begin
  vCniee.Free;
  vCniee := nil;
  vEstoqueECF.Free;
  vEstoqueECF := nil;
  inherited;
end;

function TNFDetECF.post: boolean;
begin
  try
    Result := false;
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if Trim(dataSet.FieldByName('N_SERIE_FAB').AsString) = '' then
      raiseExceptionCreate('Número de Série do Equipamento não informado', 'edNumSerieEcfExit');
    if (Trim(dataSet.FieldByName('CNIEE').AsString) = '') and (vECF) then
      raiseExceptionCreate('Código Nacional de Identificação de Equipamento ECF não informado',
        'DBLookupComboBox6');
    if (Trim(dataSet.FieldByName('TIPO_ECF').AsString) = '') then
      raiseexceptioncreate('Tipo não informado', 'DBEdit153');
    if Trim(dataSet.FieldByName('MARCA_ECF').AsString) = '' then
      raiseexceptioncreate('Marca não informada', 'DBEdit154');
    if Trim(dataSet.FieldByName('MODELO_ECF').AsString) = '' then
      raiseexceptioncreate('Modelo não informado', 'DBEdit155');
    if (Trim(dataSet.FieldByName('VERSAOSB').AsString) = '') and (vECF)  then
      raiseexceptioncreate('Versão do Softer Básico do ECF não informado', 'DBEdit156');

    if not vECF then
    begin
      vMarca := Trim(dataSet.FieldByName('MARCA_ECF').AsString);
      vModelo := Trim(dataSet.FieldByName('MODELO_ECF').AsString);
      vTipo := Trim(dataSet.FieldByName('TIPO_ECF').AsString);
    end;

    //if Trim(dataSet.FieldByName('N_MEMORIA_FISCAL').AsString) = '' then
    //  raiseexceptioncreate('Número da Memória Fiscal não informado', 'DBEdit157');
    //    COD_NF, COD_EMPRESA, NITEM, , , , , , , , LACRE_EXTERNO1, LACRE_EXTERNO2, LACRE_EXTERNO3, LACRE_EXTERNO4, NNF_ENTRADA, SERIE_ENTRADA, GRUPO_PROD, COD_PROD

    buscas.CLose;
    buscas.sql.text :=
      ' select * from ecf where n_serie_fab = :nserie and cod_empresa = :cod_empresa and status = ''Estoque''';
    buscas.ParamByName('nserie').AsString :=
      dataSet.FieldByName('N_SERIE_FAB').AsString;
    buscas.ParamByName('cod_empresa').asstring := vDadosIni.codEmpresa;
    buscas.Open;
    if not buscas.IsEmpty then
    begin
      Application.MessageBox('Número de Série do Equipamento já se encontra em estoque', 'Atenção', 0 + 64);
      vDadosIni.vInibeMensPesqPros := 'S';
      if vDadosIni.PesqPros('NF0130','VALIDAR', 'NUM SERIE ' + Trim(dataSet.FieldByName('N_SERIE_FAB').AsString),
        'ECF', '', buscas, True) then
      begin
        if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação',
          MB_ICONQUESTION + MB_YESNO) <> IDYES then
        begin
          Result := False;
          Exit;
        end;
      end
      else
        Exit;
      //raiseExceptionCreate('Número de Série do Equipamento já se encontra em estoque', 'edNumSerieEcfExit');
    end;

    if dataSet.State = dsInsert then
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;

    if vECF then
      dataSet.FieldByName('tipo').AsString := 'E'
    else
      dataSet.FieldByName('tipo').AsString := 'O';

    Result := inherited post;
  except on e: exception do
    begin
      Result := false;
      if pos('PRIMARY OR UNIQUE KEY', UpperCase(E.Message)) > 0 then
        Application.MessageBox(pchar('Número de Série do Equipamento já foi informado'), 'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TNFDetECF.removerItensNotaNaoConfirmada: boolean;
begin
  Result := True;
  dataSet.First;
  while not dataSet.Eof do
  begin
    try
      buscas.CLose;
      buscas.sql.text :=
        //'update ecf set status = :status, nnf = 0, serie = 0 where n_serie_fab = :nserie and cod_empresa = :cod_empresa';
        'update ecf set status = :status, nnf = 0, serie = 0 where cod_nserie = :cod_nserie and cod_empresa = :cod_empresa';
      buscas.ParamByName('status').asstring := 'Estoque';
      //buscas.ParamByName('nserie').AsString :=
        //dataSet.FieldByName('N_SERIE_FAB').AsString;
      buscas.ParamByName('cod_nserie').AsInteger :=
        dataSet.FieldByName('cod_nserie').AsInteger;
      buscas.ParamByName('cod_empresa').asstring := vDadosIni.codEmpresa;
      buscas.prepare;
      buscas.ExecSql;
    except on e: Exception do begin
        Result := False;
        Application.MessageBox(pchar('Erro ao acertar dados no Estoque ECF. Erro: '+e.Message),'Atenção',0+64);
        registraErro('procedure removerItensNotaNaoConfirmada '+e.Message);
      end;
    end;
    dataSet.Next;
  end;
  while not dataSet.IsEmpty do
  begin
    try
      dataSet.Delete;
    except on e: Exception do begin
        Result := False;
        Application.MessageBox(pchar('Erro ao acertar dados no Estoque ECF, delete. Erro: '+e.Message),'Atenção',0+64);
        registraErro('procedure removerItensNotaNaoConfirmada, delete '+e.Message);
        Break;
      end;
    end;
  end;
  try
    if dataSet.ChangeCount > 0 then
      dataSet.ApplyUpdates(-1);
  except on e: Exception do begin
      Result := False;
      Application.MessageBox(pchar('Erro ao acertar dados no Estoque ECF, Apply. Erro: '+e.Message),'Atenção',0+64);
      registraErro('procedure removerItensNotaNaoConfirmada, Apply '+e.Message);
    end;
  end;
end;

function TNFDetECF.selecionaDetalhesECF(codNF, pNItem: Integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_item_ecf where cod_nf = ' + IntToStr(codNF) +
    ' and nitem = ' + IntToStr(pNItem) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TNFDetECF.selecionaDetalhesECF(codNF: Integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_item_ecf where cod_nf = ' + IntToStr(codNF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
  IndexFieldNames := 'NITEM';
  vCniee.abreImpressorasCniee;
end;

function TNFDetECF.verificaImpressoraCNIEE: boolean;
begin
  if (dataSet.State in [dsEdit, dsInsert]) and (not vCniee.dataSet.IsEmpty) then
  begin
    dataSet.FieldByName('TIPO_ECF').AsString := vCniee.dataSet.FieldByName('TIPO_ECF').AsString;
    dataSet.FieldByName('MARCA_ECF').AsString := vCniee.dataSet.FieldByName('MARCA_ECF').AsString;
    dataSet.FieldByName('MODELO_ECF').AsString := vCniee.dataSet.FieldByName('MODELO_ECF').AsString;
    dataSet.FieldByName('VERSAOSB').AsString := vCniee.dataSet.FieldByName('VERSAOSB').AsString;
  end;
end;

{ TNFDetVeic }

constructor TNFDetVeic.create;
begin
  dataSet := TClientDataSet(DtmNF.cdsDVNf);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
  vModV := TModVeicNF.create;
  vCorFab := TCorFabricanteNF.create;
  vCombutivelV := TCombustivelNF.create;
  vMarcasV := TMarcasNF.create;
end;

destructor TNFDetVeic.Destroy;
begin
  vModV.Free;
  vModV := nil;
  vCorFab.free;
  vCorFab := nil;
  vCombutivelV.Free;
  vCombutivelV := nil;
  vMarcasV.Free;
  vMarcasV := nil;
  inherited;
end;

function TNFDetVeic.selecionaDetalheVeiculo(codNF, pNItem: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_item_veiculo where cod_nf = ' + IntToStr(codNF) +
    ' and nitem = ' + IntToStr(pNItem) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TNFDetVeic.selecionaDetalheVeiculo(codNF: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_item_veiculo where cod_nf = ' + IntToStr(codNF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
  IndexFieldNames := 'NITEM';
  vModV.abreModelos;
  vCorFab.abreCores;
  vCombutivelV.abreCombustivel;
  vMarcasV.abreMarcas;
end;

{ TNFItem_Divergencias_NCM_CEST }

procedure TNFItem_Divergencias_NCM_CEST.clearEventos;
begin
  fEventAfterScroll := nil;
end;

constructor TNFItem_Divergencias_NCM_CEST.create;
begin

end;

destructor TNFItem_Divergencias_NCM_CEST.Destroy;
begin
  if fDivergencias <> nil then
    FreeAndNil(fDivergencias);

  if fDataSource <> nil then
    FreeAndNil(fDataSource);

  if fBuscas <> nil then
    FreeAndNil(fBuscas);
    
  inherited;
end;

procedure TNFItem_Divergencias_NCM_CEST.divergenciasAfterScroll(
  DataSet: TDataSet);
begin
  if Assigned(fEventAfterScroll) then
    fEventAfterScroll;
end;

function TNFItem_Divergencias_NCM_CEST.divergenciasMarcadas: Boolean;
begin
  Result := True;
  fDivergencias.First;
  while not fDivergencias.Eof do
  begin
    if (fDivergencias.FieldByName('usncm').AsString = 'pen') or
      (fDivergencias.FieldByName('uscest').AsString = 'pen') then
    begin
      Result := False;
      Break;
    end;
    fDivergencias.Next;
  end;
end;

function TNFItem_Divergencias_NCM_CEST.getDescricaoCEST(CEST: string): string;
begin
  fBuscas.Close;
  fBuscas.SQL.Text := 'select first 1 descricao from cest' +
    ' where cest = ' + QuotedStr(CEST);
  fBuscas.Open;
  Result := Trim(Copy(fBuscas.FieldByName('descricao').AsString, 1, 200));
  fBuscas.Close;
end;

function TNFItem_Divergencias_NCM_CEST.getDescricaoNCM(NCM: string): string;
begin
  fBuscas.Close;
  fBuscas.SQL.Text := 'select nome_ncm from nbm' +
    ' where cod_ncm = ' + QuotedStr(NCM);
  fBuscas.Open;
  Result := Trim(Copy(fBuscas.FieldByName('nome_ncm').AsString, 1, 60));
  fBuscas.Close;
end;

procedure TNFItem_Divergencias_NCM_CEST.iniciarDados(Query: TIBQuery);
begin
  if fDivergencias = nil then
    fDivergencias := TClientDataSet.Create(Application);

  if fDataSource = nil then
  begin
    fDataSource := TDataSource.Create(Application);
    fDataSource.AutoEdit := False;
    fDataSource.DataSet := fDivergencias;
  end;

  if fBuscas = nil then
  begin
    fBuscas := TIBQuery.Create(Application);
    fBuscas.Database := Query.Database;
    fBuscas.Transaction := Query.Transaction;
  end;

  if not fDivergencias.Active then
  begin
    fDivergencias.FieldDefs.Add( 'nitem'          , ftInteger, 0);
    fDivergencias.FieldDefs.Add( 'descricao_item' , ftString , 75);
    fDivergencias.FieldDefs.Add( 'grupo_prod'     , ftInteger, 0);
    fDivergencias.FieldDefs.Add( 'cod_prod'       , ftString , 6);
    fDivergencias.FieldDefs.Add( 'ncm'            , ftString , 8);
    fDivergencias.FieldDefs.Add( 'ncm_cad'        , ftString , 8);
    fDivergencias.FieldDefs.Add( 'cest'           , ftString , 7);
    fDivergencias.FieldDefs.Add( 'cest_cad'       , ftString , 7);
    fDivergencias.FieldDefs.Add( 'usncm'          , ftString , 3);
    fDivergencias.FieldDefs.Add( 'uscest'         , ftString , 3);
    fDivergencias.FieldDefs.Add( 'nome_ncm'       , ftString , 60);
    fDivergencias.FieldDefs.Add( 'nome_ncm_cad'   , ftString , 60);
    fDivergencias.FieldDefs.Add( 'nome_cest'      , ftString , 200);
    fDivergencias.FieldDefs.Add( 'nome_cest_cad'  , ftString , 200);
    fDivergencias.CreateDataSet;

    fDivergencias.FieldByName('nitem').DisplayLabel := 'N Item';
    fDivergencias.FieldByName('descricao_item').DisplayLabel := 'Descrição Item';
    fDivergencias.FieldByName('grupo_prod').DisplayLabel := 'Grupo';
    fDivergencias.FieldByName('cod_prod').DisplayLabel := 'Cod Prod';
    fDivergencias.FieldByName('ncm').DisplayLabel := 'NCM NF';
    fDivergencias.FieldByName('ncm_cad').DisplayLabel := 'NCM Cadastro';
    fDivergencias.FieldByName('cest').DisplayLabel := 'CEST NF';
    fDivergencias.FieldByName('cest_cad').DisplayLabel := 'CEST Cadastro';
    fDivergencias.FieldByName('usncm').Visible := False;
    fDivergencias.FieldByName('uscest').Visible := False;
    fDivergencias.FieldByName('nome_ncm').Visible := False;
    fDivergencias.FieldByName('nome_ncm_cad').Visible := False;
    fDivergencias.FieldByName('nome_cest').Visible := False;
    fDivergencias.FieldByName('nome_cest_cad').Visible := False;

    fDivergencias.IndexFieldNames := 'nitem';
    fDivergencias.AfterScroll := divergenciasAfterScroll;
  end;
  fDivergencias.EmptyDataSet;  
end;

function TNFItem_Divergencias_NCM_CEST.selecionarAcaoCEST(
  destino: string): Boolean;
begin
  Result := True;
  if fDivergencias.IsEmpty then
    Exit;

  try
    fDivergencias.Edit;
    fDivergencias.FieldByName('uscest').AsString := destino;
    fDivergencias.Post;

    if fDivergencias.FieldByName('usncm').AsString <> 'pen' then
      fDivergencias.Next;
  except
    on E: Exception do
    begin
      Result := False;
      vDadosIni.registraErro('function TNFItem_Divergencias_NCM_CEST.selecionarAcaoCEST. Erro: ' + e.Message);
      Application.MessageBox(PChar('Erro ao tentar marcar item. Erro: ' + E.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TNFItem_Divergencias_NCM_CEST.selecionarAcaoNCM(destino: string): Boolean;
begin
  Result := True;
  if fDivergencias.IsEmpty then
    Exit;

  try
    fDivergencias.Edit;
    fDivergencias.FieldByName('usncm').AsString := destino;
    fDivergencias.Post;

    if fDivergencias.FieldByName('uscest').AsString <> 'pen' then
      fDivergencias.Next;
  except
    on E: Exception do
    begin
      Result := False;
      vDadosIni.registraErro('function TNFItem_Divergencias_NCM_CEST.selecionarAcaoNCM. Erro: ' + e.Message);
      Application.MessageBox(PChar('Erro ao tentar marcar item. Erro: ' + E.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TNFItem_Divergencias_NCM_CEST.verificaDivergencias(vItem: TDataSet_OOP): Boolean;
var
  vAdd: Boolean;
  vNCM_XML, vNCM_Cad: string;
  vCEST_XML, vCEST_Cad: string;
begin
  Result := True;

  fTestarNCM := vDadosIni.getConfSisBool('nf_validar_ncm_xml_com_produto', vItem.buscas );
  fTestarCEST := vDadosIni.getConfSisBool('nf_validar_cest_xml_com_produto', vItem.buscas );

  if not fTestarNCM then
    if not fTestarCEST then
        Exit;

  iniciarDados(vItem.buscas);

  vItem.dataSet.First;
  while not vItem.dataSet.Eof do
  begin
    vNCM_XML := Trim(vItem.dataSet.FieldByName('ncm').AsString);
    vCEST_XML := Trim(vItem.dataSet.FieldByName('cest').AsString);
    if vItem.dataSet.FieldByName('tipo_item').AsString = 'P' then
    begin
      (vItem as TNFItem).vProd.buscaProduto(
        vItem.dataSet.FieldByName('grupo_prod').AsInteger,
        vItem.dataSet.FieldByName('cod_prod').AsString);
      vNCM_Cad := Trim((vItem as TNFItem).vProd.dataSet.FieldByName('nbm').AsString);
      vCEST_Cad := Trim((vItem as TNFItem).vProd.dataSet.FieldByName('cest').AsString);
    end
    else if vItem.dataSet.FieldByName('tipo_item').AsString = 'P' then
    begin
      if (vItem as TNFItem).vDetVeic.dataSet.Locate('NITEM', vItem.dataSet.FieldByName('nitem').AsInteger, []) then
      begin
        (vItem as TNFItem).vDetVeic.vModV.abreModelos((vItem as TNFItem).vDetVeic.dataSet.FieldByName('versao').AsInteger);
        vNCM_XML := Trim((vItem as TNFItem).vProd.dataSet.FieldByName('ncmsh').AsString);
        vCEST_Cad := Trim((vItem as TNFItem).vProd.dataSet.FieldByName('cest').AsString);
      end;
    end
    else
    begin
      vNCM_Cad := '';
      vCEST_Cad := '';
    end;
    vAdd := False;
    if (fTestarNCM) and (vNCM_XML <> vNCM_Cad) and (vNCM_XML <> '') and (vNCM_Cad <> '') then
      vAdd := True;
    if not vAdd then
      if (fTestarCEST) and (vCEST_XML <> vCEST_Cad) and (vCEST_XML <> '') and (vCEST_Cad <> '') then
        vAdd := True;

    if vAdd then
    begin
      fDivergencias.Insert;
      fDivergencias.FieldByName('nitem').AsInteger := vItem.dataSet.FieldByName('nitem').AsInteger;
      fDivergencias.FieldByName('descricao_item').AsString := vItem.dataSet.FieldByName('descricao_item').AsString;
      fDivergencias.FieldByName('grupo_prod').AsInteger := vItem.dataSet.FieldByName('grupo_prod').AsInteger;
      fDivergencias.FieldByName('cod_prod').AsString := vItem.dataSet.FieldByName('cod_prod').AsString;
      fDivergencias.FieldByName('ncm').AsString := vNCM_XML;
      fDivergencias.FieldByName('ncm_cad').AsString := vNCM_Cad;
      fDivergencias.FieldByName('cest').AsString := vCEST_XML;
      fDivergencias.FieldByName('cest_cad').AsString := vCEST_Cad;
      if (fTestarNCM) and (vNCM_XML <> vNCM_Cad) and (vNCM_XML <> '') and (vNCM_Cad <> '') then
      begin
        fDivergencias.FieldByName('usncm').AsString := 'pen';
        fDivergencias.FieldByName('nome_ncm').AsString := getDescricaoNCM(vNCM_XML);
        fDivergencias.FieldByName('nome_ncm_cad').AsString := getDescricaoNCM(vNCM_Cad);
      end;
      if (fTestarCEST) and (vCEST_XML <> vCEST_Cad) and (vCEST_XML <> '') and (vCEST_Cad <> '') then
      begin
        fDivergencias.FieldByName('uscest').AsString := 'pen';
        fDivergencias.FieldByName('nome_cest').AsString := getDescricaoCEST(vCEST_XML);
        fDivergencias.FieldByName('nome_cest_cad').AsString := getDescricaoCEST(vCEST_Cad);
      end;
      fDivergencias.Post;
    end;
    vItem.dataSet.Next;
  end;
  fDivergencias.First;

  Result := not(fDivergencias.RecordCount > 0);
end;

{ TNFItem_AntecipacaoST }

constructor TNFItem_AntecipacaoST.create(Owner: TDataSet_OOP);
var
  I: Integer;
begin
  inherited Create(Owner.buscas.Database);
  FOwner := Owner;
  FtribSefaz := TNFTributacaoSefaz.create(Self);

  ClientOpen('select ni.nitem, ni.descricao_item, ni.ncm, ni.cest,' +
             ' cast(0 as t_vl_todos) aliquota,' +
             ' cast(0 as t_vl_todos) aliq_inter,' +
             ' cast(0 as t_vl_todos) aliq_intra,' +
             ' cast(0 as t_vl_todos) base_st,' +
             ' cast(0 as t_vl_todos) valor_st,' +
             ' cast(0 as t_vl_todos) valor_liq,' +
             ' 0 mva_id, 0 aliq_id, 0 cest_variante_id,' +
             ' ni.mva, ni.base_icm, ni.valor_icm,' +
             ' ni.quantidade, ni.valor_total, ni.valor_unitario, ni.rateio_desconto,' +
             ' ni.rateio_frete, ni.rateio_seguro, ni.rateio_outdesp, ni.vicmdeson,' +
             ' ni.vpisdeson,ni.vcofinsdeson,ni.espelho_calc,' +
             ' ni.cst, ni.tipo_item, ni.grupo_prod, ni.cod_prod,' +
             ' ni.trib_sefaz_id, ts.compoecusto, ts.titulo ' +
             ' from notafiscal_item ni' +
             ' left join trib_sefaz ts on ts.id = ni.trib_sefaz_id and ts.cod_empresa = ni.cod_empresa' +
             ' where ni.cod_nf = 0 and ni.cod_empresa = 0');
  dataSet.AfterScroll := dataSetAfterScroll;

  for I := 0 to dataSet.FieldCount - 1 do
    if dataSet.Fields[I] is TFloatField then
      (dataSet.Fields[I] as TFloatField).DisplayFormat := '#0.00';
end;

procedure TNFItem_AntecipacaoST.dataSetAfterScroll(DataSet: TDataSet);
begin
  if Assigned(FSelectItem) then
    FSelectItem(Self);   
end;

destructor TNFItem_AntecipacaoST.Destroy;
begin
  
  inherited;
end;



function TNFItem_AntecipacaoST.NaoAceitarAntecipacao: Boolean;

var
  itensDB: TNFItem;
  cst: string;
begin
  Result := True;

  itensDB := (FOwner as TNFCab).vItem;
  if fint('nitem') <> itensDB.fint('nitem') then
    if not itensDB.dataSet.Locate('NITEM', fint('nitem'), []) then
    begin
      ShowAtencao('Não foi possivel selecionar o item da nota para continuar');
      Exit;
    end;

  cst := itensDB.fstr('cst', 2, 2);

  itensDB.dataSet.Edit;
  itensDB.dataSet.FieldByName('antec_trib').AsString := 'N';
  itensDB.dataSet.FieldByName('trib_sefaz_id').Value := Null;
  itensDB.dataSet.FieldByName('bcajuste').AsFloat := 0;
  itensDB.dataSet.FieldByName('vajuste').AsFloat := 0;
  itensDB.dataSet.FieldByName('pajuste').AsFloat := 0;
  itensDB.dataSet.Post;

  dataSet.Delete;
  if Assigned(FSelectItem) then
    FSelectItem(Self);
end;

function TNFItem_AntecipacaoST.RemoverAtencipacaoTodos: Boolean;
var
  itensDB: TNFItem;
  cst: string;
  ask, remover: Boolean;
begin
  Result := True;
         
  if (FOwner as TNFCab).notaFechada then
    Exit;

  if (FOwner as TNFCab).vItem.dataSet.IsEmpty then
    Exit;

  itensDB := (FOwner as TNFCab).vItem;

  cst := itensDB.fstr('cst', 2, 2);
  ask := False;
  remover := False;

  itensDB.dataSet.First;
  while not itensDB.dataSet.Eof do
  begin

    if not itensDB.fempty('antec_trib') then
    begin
      itensDB.dataSet.Edit;
      itensDB.dataSet.FieldByName('antec_trib').AsString      := '';
      itensDB.dataSet.FieldByName('ant_calc').AsString        := '';
      itensDB.dataSet.FieldByName('base_icmsub_ant').AsFloat  := 0;
      itensDB.dataSet.FieldByName('valor_icmsub_ant').AsFloat := 0;
      itensDB.dataSet.FieldByName('trib_sefaz_id').Value := Null;
      itensDB.dataSet.FieldByName('bcajuste').AsFloat := 0;
      itensDB.dataSet.FieldByName('vajuste').AsFloat := 0;
      itensDB.dataSet.FieldByName('pajuste').AsFloat := 0;   
      itensDB.dataSet.FieldByName('trib_sefaz_id').Value := Null;
      itensDB.dataSet.FieldByName('bcajuste').AsFloat := 0;
      itensDB.dataSet.FieldByName('vajuste').AsFloat := 0;
      itensDB.dataSet.FieldByName('pajuste').AsFloat := 0;

      if (not itensDB.fempty('icm_cst')) or (not itensDB.fempty('icm_csosn')) then
      begin
        if itensDB.fempty('icm_csosn') then
          itensDB.dataSet.FieldByName('cst').AsString   := itensDB.fstr('cst', 1, 1) + itensDB.fstr('icm_cst')
        else
        begin
          itensDB.dataSet.FieldByName('cst').AsString   := (FOwner as TNFCab).getCSTPorCSOSN(itensDB.fstr('cst'), itensDB.fstr('icm_csosn'));
          itensDB.dataSet.FieldByName('csosn').AsString := (FOwner as TNFCab).getCSOSNPorCST(itensDB.fstr('cst'), itensDB.fstr('icm_csosn'), False);
        end;

        itensDB.dataSet.FieldByName('base_icm').AsFloat := itensDB.ffloat('icm_vbc');
        itensDB.dataSet.FieldByName('aliq_icm').AsFloat := itensDB.ffloat('icm_picm');
        itensDB.dataSet.FieldByName('valor_icm').AsFloat := itensDB.ffloat('icm_vicm');
        itensDB.dataSet.FieldByName('perc_red_prod').AsFloat := itensDB.ffloat('icm_pred');
        itensDB.dataSet.FieldByName('fcp_pfcp').AsFloat := itensDB.ffloat('icm_pfcp');
        itensDB.dataSet.FieldByName('fcp_vfcp').AsFloat := itensDB.ffloat('icm_vfcp');
        itensDB.dataSet.FieldByName('fcp_vbcfcp').AsFloat := itensDB.ffloat('icm_vbcfcp');
      end;

      if (not ask) and (itensDB.ffloat('valor_icmsub') > 0) then
      begin
        ask := True;
        remover := ShowConfirmacao('Remover também os valores de ICMS ST') = IDYES;
      end;

      if remover then
      begin
        itensDB.dataSet.FieldByName('base_icmsub').AsFloat  := 0;
        itensDB.dataSet.FieldByName('valor_icmsub').AsFloat := 0;
        itensDB.dataSet.FieldByName('aliq_icmsub').AsFloat := 0;
        itensDB.dataSet.FieldByName('perc_red_prod_sub').AsFloat := 0;
        itensDB.dataSet.FieldByName('mva').AsFloat := 0;
      end;

      itensDB.dataSet.Post;
    end
    else
    begin                    
      itensDB.dataSet.Edit;
      itensDB.dataSet.FieldByName('trib_sefaz_id').Value := Null;
      itensDB.dataSet.FieldByName('bcajuste').AsFloat := 0;
      itensDB.dataSet.FieldByName('vajuste').AsFloat := 0;
      itensDB.dataSet.FieldByName('pajuste').AsFloat := 0;
      itensDB.dataSet.Post;
    end;
    itensDB.dataSet.Next;
  end;

  if FOwner.dataSet.State in [dsEdit, dsInsert] then
    FOwner.dataSet.FieldByName('antec_trib').AsString := '';

  if Assigned(FSelectItem) then
    FSelectItem(Self);
end;

function TNFItem_AntecipacaoST.SalvarAliq(aliq: Double;
  tribSefId: string): Boolean;
var
  id: Integer;
  sCest, sNcm: string;
begin
  Result := False;
  sCest := fstr('cest');
  sNcm := fstr('ncm');

  sCEST := ' and coalesce(CEST, '''') = ' + QuotedStr(sCest);
  sNcm := ' and coalesce(NCM, '''') = ' + QuotedStr(sNcm);

  if (sNcm = '') and (sCEST = '') then
    Exit;

  if fint('aliq_id') > 0 then
    id := fint('aliq_id')
  else
    id := SqlScalar('select id from ALIQ_ANT_ST' +
                    ' where UF_ORIGEM = ''%s'' and UF_DESTINO = %s and COD_EMPRESA = %d %s %s',
                    [vDadosIni.vEmp.vSiglaUF, (FOwner as TNFCab).fstrq('dest_uf'),
                     vDadosIni.cod_empresa, sCEST, sNcm]).AsInteger;
  try

    tribSefId := IfThen(Trim(tribSefId) = '', 'null', QuotedStr(tribSefId));

    if id = 0 then
      id := Gencodigo('ALIQ_ANT_ST', buscas, vDadosIni.codEmpresa);

    SqlExec('update or insert into ALIQ_ANT_ST (id, cod_empresa, uf_origem, uf_destino, cest, ncm, aliquota, trib_sefaz_id)' +
            ' values (%d, %d, ''%s'', %s, %s, %s, %s, %s)' +
            ' matching (id, cod_empresa)',
            [id, vDadosIni.cod_empresa, vDadosIni.vEmp.vSiglaUF, (FOwner as TNFCab).fstrq('dest_uf'),
             fstrq('cest'), fstrq('ncm'), ffloat_fb(aliq), tribSefId ]);

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
    end;
  end;
end;

function TNFItem_AntecipacaoST.SalvarAntecipacao(
  payload: RItemSefazTributo): Boolean;
var
  itensDB: TNFItem;
  cst: string;
  esp: TStringFmt;
  mva, baseST, valorSt: Double; espelho: string;
begin
  Result := True;

  itensDB := (FOwner as TNFCab).vItem;
  if fint('nitem') <> itensDB.fint('nitem') then
    if not itensDB.dataSet.Locate('NITEM', fint('nitem'), []) then
    begin
      ShowAtencao('Não foi possivel selecionar o item da nota para continuar');
      Exit;
    end;

  mva := payload.mva;
  baseST := payload.baseST;
  valorSt := payload.valorSt;
  espelho := payload.espelho;

  cst := itensDB.fstr('cst', 2, 2);

  itensDB.dataSet.Edit;
  itensDB.dataSet.FieldByName('antec_trib').AsString := 'N';
  itensDB.dataSet.FieldByName('bcajuste').AsFloat := payload.baseST;
  itensDB.dataSet.FieldByName('vajuste').AsFloat := payload.valorSt;
  itensDB.dataSet.FieldByName('pajuste').AsFloat := RoundTo(valorSt / baseST * 100, -6);

  if (payload.tribSefazId <> '') then
    itensDB.dataSet.FieldByName('trib_sefaz_id').AsString := payload.tribSefazId
  else
    itensDB.dataSet.FieldByName('trib_sefaz_id').Value := Null;

  if (payload.compoeCusto = 'N') and (payload.tribSefazId <> '') then
  begin

    itensDB.dataSet.FieldByName('aliq_ant_st').AsFloat      := 0;
    //itensDB.dataSet.FieldByName('base_icmsub').AsFloat      := 0;
    //itensDB.dataSet.FieldByName('valor_icmsub').AsFloat     := 0;
    //itensDB.dataSet.FieldByName('mva').AsFloat              := 0;
    itensDB.dataSet.FieldByName('base_icmsub_ant').AsFloat  := 0;
    itensDB.dataSet.FieldByName('valor_icmsub_ant').AsFloat := 0;
    //itensDB.dataSet.FieldByName('cst').AsString             := '';
    //itensDB.dataSet.FieldByName('espelho_calc').AsString    := '';
    itensDB.dataSet.FieldByName('ant_calc').AsString        := '';
    itensDB.dataSet.FieldByName('antec_trib').AsString      := 'N';

  end
  else
  begin

    itensDB.dataSet.FieldByName('aliq_ant_st').AsFloat      := 0;
    itensDB.dataSet.FieldByName('antec_trib').AsString      := IfThen(valorSt > 0, 'S'    , '');
    itensDB.dataSet.FieldByName('base_icmsub').AsFloat      := IfThen(baseSt  > 0, baseSt , 0);
    itensDB.dataSet.FieldByName('valor_icmsub').AsFloat     := IfThen(valorSt > 0, valorSt, 0);
    itensDB.dataSet.FieldByName('mva').AsFloat              := IfThen(mva     > 0, mva    , 0);
    itensDB.dataSet.FieldByName('base_icmsub_ant').AsFloat  := IfThen(baseSt  > 0, baseSt / itensDB.ffloat('quantidade'), 0);
    itensDB.dataSet.FieldByName('valor_icmsub_ant').AsFloat := IfThen(valorSt > 0, valorSt / itensDB.ffloat('quantidade'), 0);
    itensDB.dataSet.FieldByName('cst').AsString             := itensDB.fstr('cst', 1, 1) +  IfThen(valorSt > 0, IfThen(MatchStr(cst, ['10','30','70']), cst, '60'), cst);
    itensDB.dataSet.FieldByName('espelho_calc').AsString    := espelho;
    itensDB.dataSet.FieldByName('ant_calc').AsString        := '';

    if itensDB.fequals('antec_trib', 'S') then
    begin
      itensDB.dataSet.FieldByName('base_icm').AsFloat := 0;
      itensDB.dataSet.FieldByName('aliq_icm').AsFloat := 0;
      itensDB.dataSet.FieldByName('valor_icm').AsFloat := 0;
      itensDB.dataSet.FieldByName('perc_red_prod').AsFloat := 0;
      itensDB.dataSet.FieldByName('base_icm_simples').AsFloat := 0;
      itensDB.dataSet.FieldByName('aliq_icm_simples').AsFloat := 0;
      itensDB.dataSet.FieldByName('valor_icm_simples').AsFloat := 0;
      itensDB.dataSet.FieldByName('fcp_pfcp').AsFloat := 0;
      itensDB.dataSet.FieldByName('fcp_vfcp').AsFloat := 0;
      itensDB.dataSet.FieldByName('fcp_vbcfcp').AsFloat := 0;

      if espelho <> '' then
        itensDB.dataSet.FieldByName('espelho_calc').AsString := espelho
      else if mva = 0 then
      begin
        itensDB.dataSet.FieldByName('aliq_ant_st').AsFloat := RoundTo(valorSt / baseST * 100, -6);
        itensDB.dataSet.FieldByName('espelho_calc').AsString :=
          TStringFmt.New('|ICMS ST ANTECIPAÇÃO')
            .AddF('VALOR LIQ -> %n', [baseST])
            .AddF('ALIQUOTA  -> %0.6n', [itensDB.ffloat('aliq_ant_st')])
            .AddF('VALOR ST   = %n', [valorSt]).Text;
      end;
    end;
  end;

  itensDB.dataSet.Post;

  if itensDB.fequals('antec_trib', 'S') and ((FOwner as TNFCab).dataSet.State in [dsEdit, dsInsert]) then
    (FOwner as TNFCab).dataSet.FieldByName('antec_trib').AsString := 'S';

  dataSet.Delete;
  if Assigned(FSelectItem) then
    FSelectItem(Self);
end;

function TNFItem_AntecipacaoST.SalvarMva(mva: Double): Boolean;
var
  id, cestId, varId: Integer;
  sCest, sNcm: string;
  mvaOb: TCest_mva_class;
  cestOb: TCest__class;
  ncmList: TCest_ncms_class;
  ncmOb: TCest_ncm_class;
  I: Integer;
begin
  Result := False;

  if fempty('cest') or fempty('ncm') then
    Exit;
  try

    sCest := fstr('cest');
    sNcm := fstr('ncm');
    varId := fint('cest_variante_id');
    if varId = 0 then
      varId := SqlScalar('select id from cest_variante where descricao = ''Regra Geral'' and cod_empresa = %d and coalesce(tipo, 0) = 0', [vDadosIni.cod_empresa]).AsInteger;

    mvaOb := TCest_mva_class.Create;

    if fint('mva_id') > 0 then
      mvaOb.CopyFrom(SqlOpen('select * from cest_mva where id = %d and cod_empresa = %d and ativo = 1', [id, vDadosIni.cod_empresa]));

    if mvaOb.id > 0 then
    begin
      cestId := mvaOb.cest_id;

      if VarToFloat(mvaOb.mva) = mva then
      begin
        Result :=  True;
        Exit;
      end;

      //apenas vai alterar caso tenha um especifico para o estado
      if not ContainsStr(mvaOb.ufs_aliq, vDadosIni.vEmp.vSiglaUF) then
        mvaOb.CopyFrom(SqlOpen('select * from cest_mva where cest_id = %d and cod_empresa = %d and origem = %d and ufs_aliq like %s and ativo = 1',
                       [cestId, vDadosIni.cod_empresa, Ord(tcUsuario), QuotedStr('%' + vDadosIni.vEmp.vSiglaUF + '%')]));
      if mvaOb.id = 0 then
      begin
        mvaOb.CopyFrom(SqlOpen('select * from cest_mva where cest_id = %d and cod_empresa = %d and origem = %d and mva = %s and ufs_aliq <> ''Padrao'' and ativo = 1',
                       [cestId, vDadosIni.cod_empresa, Ord(tcUsuario), QuotedStr('%' + vDadosIni.vEmp.vSiglaUF + '%')]));

        if mvaOb.id > 0 then
          mvaOb.ufs_aliq := mvaOb.ufs_aliq + ',' + vDadosIni.vEmp.vSiglaUF;
      end;

      if mvaOb.id = 0 then
      begin
        mvaOb.cod_empresa := vDadosIni.cod_empresa;
        mvaOb.cest_id := cestId;
        mvaOb.cod_empresa := vDadosIni.cod_empresa;      
        mvaOb.cest_variante_id := varId;
        mvaOb.tipo_cadastro := Ord(tcUsuario);
        mvaOb.ufs_aliq := vDadosIni.vEmp.vSiglaUF;
      end;
      mvaOb.mva := mva;
      if mvaOb.FoundChanges then
        if mvaOb.id = 0 then
          SqlExec(mvaOb.SQLMotor('id').SQLInsertAutoInc)
        else
          SqlExec(mvaOb.SQLMotor().SQLUpdate);
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

      Result := True;
      Exit;
    end;

    cestOb := TCest__class.Create;
    cestOb.CopyFrom(SqlOpen('select * from cest_' +
                            ' where cest = %s and cod_empresa = %d' +
                            ' and ufs_convenio like ''%s''' +
                            ' and ufs_convenio like %s' +
                            ' and origem = %d' +
                            ' and ativo = 1',
                            [fstrq('cest'), vDadosIni.cod_empresa,
                             vDadosIni.vEmp.vSiglaUF, FOwner.fstrq('dest_uf'), Ord(tcUsuario)]));

    if cestOb.id = 0 then
      cestOb.CopyFrom(SqlOpen('select * from cest_' +
                            ' where cest = %s and cod_empresa = %d' +
                            ' and ufs_convenio like ''%s''' +
                            ' and origem = %d' + 
                            ' and ativo = 1',
                            [fstrq('cest'), vDadosIni.cod_empresa,
                             vDadosIni.vEmp.vSiglaUF, Ord(tcUsuario)]));

    if cestOb.id = 0 then
    begin
      cestOb.cod_empresa := vDadosIni.cod_empresa;
      cestOb.cest := fstr('cest');
      cestOb.ambito := 99;
      cestOb.descricao.Text := 'Cest cadastrado pela antecipação do ICMS';
      cestOb.ufs_convenio := vDadosIni.vEmp.vSiglaUF;
      cestOb.origem := 3;
    end;
    if not ContainsStr(cestOb.ufs_convenio, FOwner.fstr('dest_uf')) then
      cestOb.ufs_convenio := cestOb.ufs_convenio + ',' + FOwner.fstr('dest_uf');

    if cestOb.FoundChanges then
      if cestOb.id = 0 then
        cestOb.id := SqlInsertID(cestOb.SQLMotor('id').SQLInsertAutoInc, 'id')
      else
        SqlExec(cestOb.SQLMotor().SQLUpdate);

    if cestOb.id > 0 then
    begin
      mvaOb.cod_empresa := vDadosIni.cod_empresa;
      mvaOb.cest_id := cestOb.id;
      mvaOb.cod_empresa := vDadosIni.cod_empresa;
      mvaOb.cest_variante_id := varId;
      mvaOb.tipo_cadastro := Ord(tcUsuario);
      mvaOb.mva := mva;
      mvaOb.ufs_aliq := vDadosIni.vEmp.vSiglaUF;
      mvaOb.tipo_cadastro := Ord(tcUsuario);
      mvaOb.origem := 3;
      SqlExec(mvaOb.SQLMotor('id').SQLInsertAutoInc);

      ncmList := TCest_ncms_class.Create;
      ncmList.CopyFrom(TCest_ncm_class, SqlOpen('select * from cest_ncm where cest_id = %d and cod_empresa = %d', [cestOb.id, vDadosIni.cod_empresa]));
    
      ncmOb := nil;
      for I := 0 to ncmList.Count - 1 do
        if StartsStr(ncmList.Items[I].ncm, fstr('ncm')) then
        begin
          ncmOb := ncmList.Items[I];
          Break;
        end;
      if not Assigned(ncmOb) then
      begin
        ncmOb := TCest_ncm_class.Create;
        ncmOb.cest_id := cestOb.id;
        ncmOb.cod_empresa := vDadosIni.cod_empresa;
        ncmOb.ncm := fstr('ncm');
        SqlExec(ncmOb.SQLMotor().SQLInsert);
      end;
    end;
    
    if buscas.Transaction.InTransaction then
      buscas.Transaction.commit;

    Result := True;
  except on E: Exception do
    begin
      registraErro('TNFItem_AntecipacaoST.SalvarMva ' + e.Message);
      ShowErro('Erro ao salvar MVA: ' + e.Message);      
    end;
  end;
end;

function TNFItem_AntecipacaoST.AnalisarItem(force: Boolean;
  usarAliq: Boolean): Boolean;
var
  itensDB: TNFItem;
  nota: TNFCab;
  ncm, cest, sCestNcm, sNcm, sCEST, compoeCusto, tribSefazId: string;
  aliquota, mva, aliqIntra, aliqInter, valorLiq: Double;
  itemOb: TNotafiscal_item_dados;
  varId, mvaId, aliqId: Integer;
  itemFiscal: TItemFiscal;
  trib      : TItemTributo_ICMS;
begin
  Result := False;

  nota := (FOwner as TNFCab);
  itensDB := (FOwner as TNFCab).vItem;

  if not force then
  begin
    if itensDB.fdif('antec_trib', 'S') and (MatchStr(itensDB.fstr('cst', 2, 2), ['10', '30', '70'])) then
      Exit;

    if itensDB.fdif('antec_trib', 'S') and (itensDB.fstr('cst', 2, 2) = '60') and (vDadosIni.vEmp.vSiglaUF = nota.getUFdaOperacao) then
      Exit;

    if (itensDB.fstr('cst', 2, 2) = '60') // cst 60
      and (itensDB.CalcIcmsSTEntNF_Cst60) // habilitado o calculo de ST para cst 60
      and (itensDB.fdif('antec_trib', 'S')) // sem antecipacao tributaria
      and (itensDB.ffloat('valor_icmsub') > 0) then // e com valor de icms st destacado
      Exit;

    if itensDB.fequals('ant_calc', 'D') then
      Exit;

    if (vDadosIni.vEmp.vSiglaUF = nota.getUFdaOperacao) and
       (nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('Conf', 'DesativarEmOperacaoInterna') = 'S')
    then
      Exit;
  end;

  mva := 0;
  if itensDB.fequals('tipo_item', 'P') then
  begin
    SqlOpen('select first 1 nbm.mva, pr.nbm, pr.cest, pr.cst_prod, pr.cest_variante_id,' +
            ' iif(pr.icm_prod > 0, pr.icm_prod, iif(nbm.aliq_intra > 0, nbm.aliq_intra, iif(e.aliq_intra > 0, e.aliq_intra, iif(emp.aliqpadrao > 0, emp.aliqpadrao, 18)))) aliq_intra' +
            ' from produtos pr' +
            ' left join nbm on nbm.cod_ncm = pr.nbm' +
            ' inner join empresa emp on emp.cod_empresa = pr.cod_empresa' +
            ' inner join estados e on e.codigo_uf = emp.uf_emp' +
            ' where pr.grupo_prod = %d and pr.cod_prod = %s and pr.cod_empresa = %d',
            [itensDB.fint('grupo_prod'), itensDB.fstrq('cod_prod'), vDadosIni.cod_empresa]);

    varId := buscas.FieldByName('cest_variante_id').AsInteger;
    cest := Trim(buscas.FieldByName('cest').AsString);
    ncm := Trim(buscas.FieldByName('nbm').AsString);
    aliqIntra := buscas.FieldByName('aliq_intra').AsFloat;

    if not nota.Config.Conf_ICMS.nf_icmsst_cest_v2.Ativa then
      mva := buscas.FieldByName('mva').AsFloat;
  end;

  if cest = '' then
    cest := itensDB.fstr('cest');
  if ncm = '' then
    ncm := itensDB.fstr('ncm');

  sCEST := IfThen(cest <> '', ' and aa.CEST = ' + QuotedStr(cest));
  sNcm := IfThen(ncm <> '', ' and aa.NCM = ' + QuotedStr(ncm));

  if (sNcm = '') and (sCEST = '') then
    Exit;

  SqlOpen('select iif((coalesce(aa.cest,  '''') <> '''') and (coalesce(aa.ncm,  '''') <> ''''), 0,' +
          '           iif((coalesce(aa.cest,  '''') <> ''''), 2, 1)),' +
          ' aa.ID, aa.ALIQUOTA, aa.TRIB_SEFAZ_ID, ts.COMPOECUSTO, ts.TITULO' +
          ' from ALIQ_ANT_ST aa' +
          ' left join TRIB_SEFAZ ts on ts.ID = aa.TRIB_SEFAZ_ID and ts.COD_EMPRESA = aa.COD_EMPRESA' +
          ' where aa.UF_ORIGEM = ''%s'' and aa.UF_DESTINO = %s and aa.COD_EMPRESA = %d %s %s' +
          ' order by 1',
          [vDadosIni.vEmp.vSiglaUF, (FOwner as TNFCab).fstrq('dest_uf'),
           vDadosIni.cod_empresa, sCEST, sNcm]);
  aliqId := buscas.FieldByName('id').AsInteger;
  aliquota := buscas.FieldByName('aliquota').AsFloat;
  compoeCusto := buscas.FieldByName('compoecusto').AsString;
  tribSefazId := buscas.FieldByName('trib_sefaz_id').AsString;

  if nota.fint('cod_cliente') <> nota.vClFor.fint('cod_cliente') then
    nota.vClFor.selecionaClFor;
  if (vDadosIni.vEmp.vSiglaUF <> nota.getUFdaOperacao) and (vDadosIni.vEmp.vRegime <> 'SIMPLES') and
    (vDadosIni.strIn(Copy(itensDB.fstr('cst'), 1, 1), ['1', '2', '3'])) then
    aliqInter := 4
  else
    aliqInter := IfThen(vDadosIni.vEmp.vSiglaUF = nota.getUFdaOperacao, aliqIntra, nota.vClFor.icm_ext_c);

  // tem de colocar o ou acima
  itensDB.cancelar;
  itensDB.alterar;
  itemOb := itensDB.vrDadosItem;

  if (cest <> '') then
  begin
    if nota.Config.Conf_ICMS.nf_icmsst_cest_v2.Ativa then
    begin
      mva := 0;
      itemOb.cest             := cest;
      itemOb.ncm              := ncm;
      itemOb.tipo_item        := itensDB.fstr('tipo_item');
      itemOb.cst              := itensDB.fstr('cst');
      itemOb.aliq_icm         := aliqInter;
      itemOb.Cest_Variante_Id := varId;

      if itemOb.getDadosSubstituicaoTributaria(vDadosIni.vEmp.vSiglaUF,
                                               nota.Config.Conf_ICMS.nf_icmsst_cest_v2.GetRamoAtividade(nota.fstr('natureza_nf'), nota.fstr('cpfcgc'))) then
      begin
        mva := itemOb.FMVA;
        mvaId := itemOb.mvaId;
      end;
    end;
  end;

  if (aliquota > 0) or (mva > 0) or force then
  begin
    dataSet.Insert;
    fdata('nitem').Put(itensDB.fint('nitem'));
    fdata('descricao_item').Put(itensDB.fstr('descricao_item'));
    fdata('ncm').Put(itensDB.fstr('ncm'));
    fdata('cest').Put(itensDB.fstr('cest'));
    fdata('cest_variante_id').Put(varId);     
    fdata('vicmdeson').AsFloat := itensDB.ffloat('vicmdeson');
    fdata('vpisdeson').AsFloat := itensDB.ffloat('vpisdeson');
    fdata('vcofinsdeson').AsFloat := itensDB.ffloat('vcofinsdeson');
    fdata('compoecusto').AsString := 'S';

    trib := TItemTributo_ICMS.Create;

    itemFiscal              := itemOb.get_itemFiscal;
    itemFiscal.vicmsdeson   := itemOb.vicmdeson;
    itemFiscal.vpisdeson    := itemOb.vpisdeson;
    itemFiscal.vcofinsdeson := itemOb.vcofinsdeson;
    valorLiq                := trib.conf_icm.getBC(ttICMSST, itemFiscal, 0);

    fdata('valor_liq').Put(valorLiq);

    if aliquota > 0 then
    begin
      fdata('aliquota').AsFloat := aliquota;
      fdata('trib_sefaz_id').AsString := tribSefazId;
      fdata('compoecusto').AsString := compoeCusto;

      if usarAliq or (mva = 0) then
      begin
        fdata('valor_st').AsFloat := RoundTo(ffloat('valor_liq') *  ffloat('aliquota') / 100, -2);
        fdata('espelho_calc').AsString :=
          TStringFmt.New('|ICMS ST ANTECIPAÇÃO')
            .AddF('|VALOR LIQ -> %n', [ffloat('valor_liq')])
            .AddF('|ALIQUOTA  -> %0.6n', [ffloat('aliquota', -6)])
            .AddF('|VALOR ST   = %n', [ffloat('valor_st')]).Text;
      end;
    end;
    if mva > 0 then
    begin
    {
      if (itensDB.ffloat('valor_icm') > 0) and nota.fdif('devolucao', 'SIM') and nota.fdif('tipo_emissao', '4') then
        if nota.Auditor.Processo('NF0113', 'NUM NF ' + nota.fstr('NUM_NF'), nota.fstr('cod_nf'))
          .Validar
          .Permitido then
        begin
          itensDB.dataSet.FieldByName('aliq_icm').AsFloat := 0;
          itensDB.dataSet.FieldByName('base_icm').AsFloat := 0;
          itensDB.dataSet.FieldByName('valor_icm').AsFloat := 0;
          itensDB.dataSet.FieldByName('fcp_pfcp').AsFloat := 0;
          itensDB.dataSet.FieldByName('fcp_vfcp').AsFloat := 0;
          itensDB.dataSet.FieldByName('fcp_vbcfcp').AsFloat := 0;
          if (itensDB.ffloat('valor_icmsub') = 0) then
          begin
            itensDB.dataSet.FieldByName('cst').AsString := itensDB.fstr('cst', 1, 1) + '60';
            itensDB.dataSet.FieldByName('ANTEC_TRIB').AsString := 'S';
            Application.MessageBox(pchar('Item nº ' + itensDB.dataSet.FieldByName('nitem').AsString +
              ' é substituição tributária e o sistema removeu a tributação normal de ICMS.'+sLineBreak+
              'Verifique se o CFOP do item é de Substituição Tributária' ), 'Atenção', 0 + 64);

            // Removi o teste e processo, pois o campo foi removido
          end;

        end;
        }

      itemOb.aliq_icm          := aliqInter;
      itemOb.aliq_icmsub       := aliqIntra;
      itemOb.mva               := mva;
      itemOb.base_icm          := 0;
      itemOb.base_icmsub       := 0;
      itemOb.perc_red_prod     := 0;
      itemOb.perc_red_prod_sub := 0;
      itemOb.calcIcmsActive    := True;
      itemOb.cst               := Copy(itemOb.cst, 1, 1) + '90';
      itemOb.tipo_calc         := Ord(tcParcial);
      itemOb.modbcst           := 4;

      nota.calc_fat.calculo_faturamento_individual_executar(True, False);

      fdata('mva').AsFloat := mva;
      fdata('aliq_inter').AsFloat := itemOb.aliq_icm;
      fdata('aliq_intra').AsFloat := itemOb.aliq_icmsub;
      fdata('base_icm').AsFloat := itemOb.base_icm;
      fdata('valor_icm').AsFloat := itemOb.valor_icm;
      fdata('base_st').AsFloat := itemOb.base_icmsub;

      if (not usarAliq) or (aliquota = 0) then
      begin
        itemFiscal              := itemOb.get_itemFiscal;
        itemFiscal.vicmsdeson   := itemOb.vicmdeson;
        itemFiscal.vpisdeson    := itemOb.vpisdeson;
        itemFiscal.vcofinsdeson := itemOb.vcofinsdeson;

        valorLiq := trib.conf_icm.getBC(ttICMSST, itemFiscal, 0);
        aliquota := itemOb.valor_icmsub / valorLiq * 100;

        fdata('valor_liq').AsFloat := valorLiq;
        fdata('valor_st').AsFloat := itemOb.valor_icmsub;
        fdata('aliquota').AsFloat := aliquota;
        fdata('espelho_calc').AsString := itemOb.espelho_calc.Text;
      end;

    end;
    fdata('mva_id').Put(mvaId);
    fdata('aliq_id').AutoPut(aliqId);
  end;

  Result := dataSet.RecordCount = 1;
end;

function TNFItem_AntecipacaoST.AnalisarItens(usarAliq, aplicarAnalise: Boolean): Integer;
var
  itensDB: TNFItem;
  nota: TNFCab;
  list: TStrings;
  I: Integer;   
  dados: RItemSefazTributo;
begin
  Result := 0;
  dataset.EmptyDataSet;
  nota := (FOwner as TNFCab);

  if (nota.notaFechada) or (nota.vItem.dataSet.IsEmpty) then
    Exit;

  if (nota.fequals('modelo_nf', '55') and nota.fequals('tipo_emissao', '4')) or
     (nota.fdif('modelo_nf', '55') and nota.fequals('devolucao', 'SIM')) then
    if nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('Conf', 'AtivarEmDevolucao') = 'S' then
      Exit;

  if (vDadosIni.vEmp.vSiglaUF = nota.getUFdaOperacao) and
    (nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('Conf', 'DesativarEmOperacaoInterna') = 'S')
  then
    Exit;  

  {$REGION 'montando tribSefaz'}
//  list := NewStringList(True, nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('Conf', 'ListaIds'), ',');
//
//  for I := 0 to list.Count - 1 do
//  begin
//    SetLength(tribSefaz, I + 1);
//    tribSefaz[High(tribSefaz)] := TNFTributacaoSefaz.Create;
//    tribSefaz[High(tribSefaz)].titulo := nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('ID_' + list[I] , 'Titulo');
//    tribSefaz[High(tribSefaz)].compoeCusto := nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('ID_' + list[I] , 'CompoeCusto') = 'S';
//    tribSefaz[High(tribSefaz)].titulo := nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('ID_' + list[I] , 'CodigoAjusteEFD');
//  end;
  
  {$ENDREGION}

  itensDB := (FOwner as TNFCab).vItem;
  try

    itensDB.dataSet.First;
    while not itensDB.dataSet.Eof do
    begin
      if itensDB.fempty('antec_trib') and (itensDB.ffloat('valor_icmsub') = 0) then
        AnalisarItem(False, usarAliq);

      itensDB.dataSet.Next;
    end;
    dataSet.IndexFieldNames := 'NITEM';
    itensDB.dataSet.First;
    dataSet.First;

  finally
    itensDB.cancelar;
  end;

  Result := dataSet.RecordCount;

  if aplicarAnalise then
    while dataSet.RecordCount > 0  do
    begin
      dados.mva := ffloat('mva');
      dados.baseST := ffloat('base_st');
      dados.valorSt := ffloat('valor_st');
      dados.espelho := fstr('espelho_calc');

      //SalvarAntecipacao(ffloat('mva') , ffloat('base_st'), ffloat('valor_st'), fstr('espelho_calc'));
      SalvarAntecipacao(dados);
    end;
end;

{ TNFTributacaoSefaz }

constructor TNFTributacaoSefaz.create(Owner: TDataSet_OOP);
begin
  inherited Create(Owner.buscas.Database);
end;

function TNFTributacaoSefaz.Delete: Boolean;
begin
  try
    SqlExec('delete from trib_sefaz where id = %s and cod_empresa = %d',
            [fstrq('id'), vDadosIni.cod_empresa]);

    CommitaTransacao;

    Result := True;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      registraErro('TNFTributacaoSefaz.Delete %s', [e.Message]);
      ShowAtencao('Erro ao salvar' + sLineBreak + e.Message);
    end;
  end;
end;

function TNFTributacaoSefaz.Open: Boolean;
begin
//  ClientOpen('select * from trib_sefaz where cod_empresa = %d order by id', [vDadosIni.cod_empresa]);
  ClientOpen('select trib_sefaz.*, sped_lancamento_fiscal.txt, sped_lancamento_fiscal.cod_padrao_ajuste' +
             ' from trib_sefaz' +
             ' left join sped_lancamento_fiscal on sped_lancamento_fiscal.cod_obs = trib_sefaz.cod_obs' +
             '   and sped_lancamento_fiscal.cod_empresa = trib_sefaz.cod_empresa' +
             ' where trib_sefaz.cod_empresa = %d order by trib_sefaz.id', [vDadosIni.cod_empresa]);
  Result := True;
end;

function TNFTributacaoSefaz.Post: Boolean;
begin

  try
    if not (dataSet.State in [dsEdit, dsInsert]) then
      Exit;

    checkFieldEmpty('id', 'Campo Id precisa ser preenchido');
    checkFieldEmpty('titulo', 'Campo Titulo precisa ser preenchido');
    checkFieldEmpty('compoecusto', 'Campo "É antecipação?" precisa ser preenchido');
//    if fstr('cod_aj') <> '' then
//      if   (Length(OnlyNumber(fstr('cod_aj', 3, 8))) <> 8)      // 8 digitos finais tem de ser numero
//        or (Length(OnlyNumber(fstr('cod_aj'))) <> 8)            // se der mais de 8 quer dizer que 1 ou 2 digitos iniciais é numero, não pode
//        or (Length(OnlyNumberAndLetters(fstr('cod_aj'), '')) <> 10) // teste final, se não for letra ta errado
//      then
//        raiseExceptionCreate('Codigo de Ajuste inválido, 2 primeiros dígitos deve ser a UF do estado, seguindo 8 números');

    dataSet.FieldByName('cod_empresa').AsInteger := vDadosIni.cod_empresa;

    inherited Post;

    if dataSet.ChangeCount > 0 then    
      if not Apply then
        raiseExceptionCreate('Erro ao salvar dados. por favor contacte o suporte técnico');

    CommitaTransacao;

    Result := True;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      registraErro('TNFTributacaoSefaz.Post %s', [e.Message]);
      ShowAtencao('Erro ao salvar' + sLineBreak + e.Message);
    end;
  end;
end;

end.
