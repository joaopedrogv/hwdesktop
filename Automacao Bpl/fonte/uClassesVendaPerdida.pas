unit uClassesVendaPerdida;

interface

uses
  uDataSet_OOP, Controls, IBQuery, DBClient, QuickRpt, QRCtrls;
type
  RConsultaVP = record
    vDescServico, vNumFabProd, vDescProd: string;
  end;
  TVendaPerdida = class;
  TTipoVendaPerdida = class;
  TClienteVP = class;

  TCodBarraVP = class(TDataSet_OOP)
  public
    constructor create;
    function abreCodBarra(codBarra: string): boolean;
  end;

  TProdutoVP = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function buscaProduto(codBarra: string; grupoProd: Integer; codProd: string): boolean; overload;
  var
  	vPesqDescrProd: boolean;
    vBarra: TCodBarraVP;
  end;

  TTipoVendaPerdida = class(TDataSet_OOP)
  public
    constructor create;
    destructor Destroy; override;
    function abreTipoVendaPerdida: boolean;
    function insert: boolean; override;
    function post: boolean; override;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    procedure CadTipoVendaPerdida(TipoForm: integer);
    function _lixeiraCheia: boolean;
  end;

  TVendaPerdida = class(TDataSet_OOP)
  private
    data: TDate;
    FqrColab: TClientDataSet;
    lbNumFab, lbDescricao, lbMedia, lbTipoVP: TQRLabel;
    qrPVP: TQuickRep;
    function existeVendaPerdida: boolean;
    procedure DetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  public
    destructor Destroy; override;
    constructor create;
    function abreVendaPerdida: boolean;
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    procedure CadVendaPerdida(TipoForm: integer);
    function existeProduto(num_fab_prod: string; grupo_prod: Integer; cod_prod: string): boolean;
    function _existeServico(pCodServ:integer): boolean;
    function _buscasDescProdServ: boolean;
    function relatorioVendasPerdidas: boolean;
    function _excluirVP: boolean;
    function _restaurarRegistro: boolean;
    function _abrirFormCliente : boolean;
    function _abrirFormColaborador : boolean;
    property qrColab: TClientDataSet read FqrColab write FqrColab;
  var
    vTipoVP: TTipoVendaPerdida;
    vProd: TProdutoVP;
    vCliVP : TClienteVP;
    ultimasql: string;
    vRVP : RConsultaVP;
    vNumFabProd: string;
    vDescrProd: string;
    vCodBarra: string;
  	vGrupoProd: Integer;
    vCodProd: string;
  end;

  TClienteVP = class(TDataSet_OOP)
  public
    constructor create;
    function ListaClienteVP(pCodCli : integer = 0): boolean;
  end;


implementation

uses uDtmVendaPerdida, IBDatabase, Classes, uDtmAtivo,
  SysUtils, uDadosIni, Windows, Forms, DB, uCadVendaPerdida,
  uCadTipoVendaPerdida, Variants, funcoes, uPadrao;

{ TTipoVendaPerdida }

function TTipoVendaPerdida.abreTipoVendaPerdida: boolean;
begin
  Result := montaSelect('select * from tipovp ' +
  	' where cod_empresa = ' + vdadosIni.codempresa +
    ' and ativo = 1');
end;

function TTipoVendaPerdida.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect('SELECT * FROM tipovp ' +
    	' WHERE ativo=1 and cod_empresa = ' + vDadosIni.codEmpresa);
    result := false;
  end
  else
    result := montaSelect('SELECT * FROM tipovp ' +
    	' WHERE ativo=0 and cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TTipoVendaPerdida.CadTipoVendaPerdida(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmVendaPerdida = nil then
    dtmVendaPerdida := TdtmVendaPerdida.Create(dtmVendaPerdida);
  if FrmCadTipoVendaPerdida = nil then
    Application.CreateForm(TfrmCadTipoVendaPerdida, FrmCadTipoVendaPerdida);
  FrmCadTipoVendaPerdida.Show;
end;

constructor TTipoVendaPerdida.create;
begin
  if dtmVendaPerdida = nil then
    dtmVendaPerdida := TdtmVendaPerdida.Create(dtmVendaPerdida);
  DataSet := TClientDataSet(dtmVendaPerdida.cdsTipVP);
  transacao := TIBTransaction(dtmVendaPerdida.transacao);
  Buscas := TIBQuery(dtmVendaPerdida.qrBuscas);
end;

destructor TTipoVendaPerdida.Destroy;
begin
  //Esta linha serve para nao fechar o dataset quando a vendaperdida estiver aberta
  dataSet := TClientDataSet(dtmVendaPerdida.cdsTipVP);
  inherited;
end;

function TTipoVendaPerdida.insert: boolean;
begin
  if dataSet.State = dsInactive then
    montaSelect('select * from TIPOVP ' +
    	' where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo = 1 and 1 = 0');
  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('ent_sug_vp').AsString := 'N';
    dataSet.FieldByName('BX_ENTR_NFE').AsString := 'N';
    Result := true;
  end;
end;

function TTipoVendaPerdida.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if trim(dataSet.FieldByName('DESCRICAO_VP').AsString) = '' then
    	raiseExceptionCreate('Descrição não informada', 'DBEdit2');

    if dataSet.State in [dsInsert] then
      dataSet.FieldByName('codigo_vp').AsInteger := Gencodigo('TIPOVP', dtmVendaPerdida.SpIncCodigo,
        vDadosIni.codEmpresa);

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('VND111', 'INCLUIR', 'SUCESSO', 'TIPOVP', dataset.FieldByName('CODIGO_VP').AsString, buscas);
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VND111', 'INCLUIR', 'FALHA', 'TIPOVP', '', buscas);
      Result := FALSE;
    end;
    Refresh;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TTipoVendaPerdida.StatusLixeira: boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  result := ExecutaComandosSql('SELECT * FROM tipovp ' +
  	' WHERE ativo=0 and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TTipoVendaPerdida._lixeiraCheia: boolean;
begin
	Result := ExecutaComandosSql('Select first 1 codigo_vp from tipovp ' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
end;

{ TVendaPerdida }

function TVendaPerdida.abreVendaPerdida: boolean;
begin
  Result := montaSelect('select venda_perdida.*, clientes.nome_cliente from venda_perdida ' +
  	' left join clientes on venda_perdida.cod_cliente = clientes.cod_cliente and venda_perdida.cod_empresa = clientes.cod_empresa '+
    ' where venda_perdida.cod_empresa = ' + vDadosIni.codEmpresa + ' AND venda_perdida.ativo = 1');
end;

function TVendaPerdida.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect(ultimasql);
    result := false;
  end
  else
    result := montaSelect('select VENDA_PERDIDA.*,clientes.nome_cliente '+
      ' from VENDA_PERDIDA '+
      ' left join clientes '+
      ' on VENDA_PERDIDA.cod_empresa=clientes.cod_empresa '+
      ' and VENDA_PERDIDA.cod_cliente=clientes.cod_cliente '+
      ' where VENDA_PERDIDA.cod_empresa='+vDadosIni.codEmpresa+
      ' and VENDA_PERDIDA.ativo=0');
end;

procedure TVendaPerdida.CadVendaPerdida(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmVendaPerdida = nil then
    dtmVendaPerdida := TdtmVendaPerdida.Create(dtmVendaPerdida);
  if FrmCadVendaPerdida = nil then
    Application.CreateForm(TfrmCadVendaPerdida, FrmCadVendaPerdida);
  FrmCadVendaPerdida.Show;
end;

constructor TVendaPerdida.create;
begin
  if dtmVendaPerdida = nil then
    dtmVendaPerdida := TdtmVendaPerdida.Create(dtmVendaPerdida);
  DataSet := TClientDataSet(dtmVendaPerdida.cdsVendaP);
  transacao := TIBTransaction(dtmVendaPerdida.transacao);
  Buscas := TIBQuery(dtmVendaPerdida.qrBuscas);
  vTipoVP := TTipoVendaPerdida.create;
  vTipoVP.dataSet := TClientDataSet(dtmVendaPerdida.cdsLocTpVp);
  vProd := TProdutoVP.create;
  FqrColab := TClientDataSet(dtmVendaPerdida.cdsColaborador);
  vCliVP := TClienteVP.create;
  montaSelect('select VENDA_PERDIDA.*,clientes.nome_cliente from VENDA_PERDIDA ' +
    ' left join clientes '+
    ' on VENDA_PERDIDA.cod_cliente=clientes.cod_cliente and VENDA_PERDIDA.cod_empresa=clientes.cod_empresa '+
    ' where VENDA_PERDIDA.cod_empresa = -1 and VENDA_PERDIDA.ativo = 1');
 vTipoVP.abreTipoVendaPerdida;
end;

destructor TVendaPerdida.Destroy;
begin
  vTipoVP.Close;
  FqrColab.Close;
  vCliVP.Close;
  vCliVP.Free;
  FreeAndNil(vTipoVP);
  FreeAndNil(vProd);
  inherited;
end;

procedure TVendaPerdida.DetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  try
    if dataSet.FieldByName('TIPOVP').AsString='P' then
    begin
    vProd.buscaProduto('', dataSet.FieldByName('grupo_prod').AsInteger,
      dataSet.FieldByName('cod_prod').AsString);
      lbNumFab.Caption := vProd.dataSet.FieldByName('num_fab_prod').AsString;
      lbDescricao.Caption := trim(copy(vProd.dataSet.FieldByName('descr_prod').AsString,1,40));
    end
    else
    begin
      lbDescricao.Caption := copy(retornaValor('select ts.desc_servico as valor from tipo_servico ts where ts.cod_servico='+
      inttostr(dataSet.FieldByName('cod_servico').AsInteger)),1,40);
      lbNumFab.Caption := '';
    end;
    vTipoVP.FindNearest([dataSet.FieldByName('codigo_vp').AsInteger]);
    lbTipoVP.Caption := vTipoVP.dataSet.FieldByName('descricao_vp').AsString;
    //  lbMedia.Caption := '';
  except
    on e: exception do Application.MessageBox(pchar(e.Message), '', MB_OK);

  end;
end;

function TVendaPerdida.edit: boolean;
begin
  result:=false;
  if not vDadosIni.PesqPros('VND078', 'EDITAR', '', 'VENDA_PERDIDA', dataSet.FieldByName('SEQVP').AsString, buscas, true) then
    Exit;
  if (not dataSet.FieldByName('ATIVO').AsInteger = 1) or IsEmpty then
    Exit;
  if not FqrColab.Active then
  begin
    FqrColab.CommandText :=
      'select nome_vendedor,cod_vendedor from colaborador where ativo = 1 and cod_empresa = ' +
      vDadosIni.codEmpresa;
    FqrColab.Open;
  end;
  vCliVP.ListaClienteVP(dataSet.FieldByName('COD_CLIENTE').AsInteger);
  if not vTipoVP.dataSet.Active then
    vTipoVP.abreTipoVendaPerdida;
  Result := inherited edit;
  _buscasDescProdServ;
end;

function TVendaPerdida.existeProduto(num_fab_prod: string; grupo_prod: Integer; cod_prod: string): boolean;
begin
  Result := vProd.buscaProduto(num_fab_prod, grupo_prod, cod_prod);
  if (Result) and (dataSet.State in [dsInsert, dsEdit]) then
  begin
    dataSet.FieldByName('grupo_prod').AsInteger := vProd.dataSet.FieldByName('grupo_prod').AsInteger;
    dataSet.FieldByName('cod_prod').AsString := vProd.dataSet.FieldByName('cod_prod').AsString;
    vRVP.vDescProd := vProd.dataSet.FieldByName('descr_prod').AsString;
    vRVP.vNumFabProd := vDadosIni.IfThen(vProd.vPesqDescrProd,
    	vProd.dataSet.FieldByName('num_fab_prod').AsString, num_fab_prod);
  end;
end;

function TVendaPerdida.existeVendaPerdida: boolean;
begin
  data := vDadosIni.getDataBanco(buscas);
  buscas.close;
  buscas.SQL.Text := 'select data_vnp from venda_perdida where ';

  if dataSet.FieldByName('TIPOVP').AsString='P' then
    buscas.SQL.Text := buscas.SQL.Text + ' grupo_prod = ' + inttostr(dataSet.FieldByName('grupo_prod').AsInteger) + ' and' +
    ' cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString)
  else buscas.SQL.Text := buscas.SQL.Text + ' cod_servico = ' + inttostr(dataSet.FieldByName('cod_servico').AsInteger);

  buscas.SQL.Text := buscas.SQL.Text + ' and codigo_vp = ' + dataSet.FieldByName('codigo_vp').AsString +
    ' and cod_cliente = ' + inttostr(dataSet.FieldByName('cod_cliente').AsInteger) +
    ' and data_vnp = :vdat' + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
  buscas.Params[0].AsDate := data;
  buscas.Open;
  Result := not buscas.IsEmpty;
  buscas.Close;
end;

function TVendaPerdida.insert: boolean;
begin
  Result := false;
  if not vTipoVP.dataSet.Active then
    vTipoVP.abreTipoVendaPerdida;
  if not FqrColab.Active then
  begin
    FqrColab.CommandText :=
      'select nome_vendedor,cod_vendedor from colaborador where ativo = 1 and cod_empresa = ' +
      vDadosIni.codEmpresa;
    FqrColab.Open;
  end;
  vCliVP.ListaClienteVP;
  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('data_vnp').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('quant_prod_vp').AsFloat := 0;
    dataSet.FieldByName('TIPOVP').AsString := 'P';
    _buscasDescProdServ;
    Result := true;
  end;
end;

function TVendaPerdida.post: boolean;
var
  grupo: string;
  codprod: string;
  codigovp,vTipoVP: string;
  vCodCli,vCodServ : integer;
  sqlTemp:AnsiString;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if trim(dataSet.FieldByName('codigo_vp').AsString) = '' then
      raiseExceptionCreate('Tipo de Venda perdida não informado','DBLookupComboBox2');

    if not ((copy(dataSet.FieldByName('TIPOVP').AsString,1,1) = 'S') or (copy(dataSet.FieldByName('TIPOVP').AsString,1,1) = 'P')) then
      raiseExceptionCreate('Informe se é venda perdida de produto ou serviço.','DBCOMBOBOX1');

    if not ExecutaComandosSql('SELECT COD_CLIENTE FROM CLIENTES '+
      ' WHERE cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_cliente = '+ inttostr(dataSet.FieldByName('COD_CLIENTE').AsInteger)+
      ' and ativo = 1') then
        raiseExceptionCreate('Cliente não encontrado','DBEdit1');

    if not ExecutaComandosSql('select cod_vendedor from colaborador '+
      ' where cod_empresa = ' + vDadosIni.codEmpresa+
      ' and cod_vendedor ='+ inttostr(dataSet.FieldByName('cod_vendedor').AsInteger)+
      ' and ativo = 1') then
        raiseExceptionCreate('Vendedor não encontrado','DBLookupComboBox1');

    if trim(dataSet.FieldByName('TIPOVP').AsString) = 'P' then
    begin
      if trim(dataSet.FieldByName('grupo_prod').AsString) = '' then
        raiseExceptionCreate('Grupo não informado','dbedit3');
      if not vProd.buscaProduto('', dataSet.FieldByName('grupo_prod').AsInteger,
        dataSet.FieldByName('cod_prod').AsString) then
        raiseExceptionCreate('Produto não encontrado','dbedit4')
      else
      begin
        dataSet.FieldByName('grupo_prod').AsInteger :=
          vProd.dataSet.FieldByName('grupo_prod').AsInteger;
        dataSet.FieldByName('cod_prod').AsString := vProd.dataSet.FieldByName('cod_prod').AsString;
      end;
      if trim(dataSet.FieldByName('cod_prod').AsString) = '' then
        raiseExceptionCreate('Código do produto não informado','dbedit4');
      dataSet.FieldByName('COD_SERVICO').AsVariant := null;
    end
    else
    begin
      if not ExecutaComandosSql('select tp.desc_servico from tipo_servico tp ' +
        ' inner join tipo_servico_empresa te on te.cod_servico = tp.cod_servico and te.cod_empresa = ' + vDadosIni.codEmpresa +
        ' where tp.cod_servico = '+ inttostr(dataSet.FieldByName('COD_SERVICO').AsInteger)+
        ' and tp.ativo = 1') then
          raiseExceptionCreate('Código do serviço não informado ou não encontrado no banco de dados.','dbedit8');
      dataSet.FieldByName('COD_PROD').AsVariant := null;
      dataSet.FieldByName('GRUPO_PROD').AsVariant := null;
    end;

    if dataSet.FieldByName('quant_prod_vp').AsFloat <= 0 then
      raiseExceptionCreate('Quantidade não informada','dbedit6');

    if dataSet.State in [dsInsert] then
    begin
      if existeVendaPerdida then
      begin
        if trim(dataSet.FieldByName('TIPOVP').AsString) = 'P' then vTipoVP := 'produto' else vTipoVP := 'serviço';

        if Application.MessageBox(Pchar('Venda Perdida deste '+vTipoVP+' para este dia '+
          ' e para este cliente já existe. Deseja alterar o registro existente?'+chr(13)+
          'Obs.: Clicando em "Não" será feita uma nova inclusão.'),
          'Atenção', MB_ICONINFORMATION + MB_YESNO) = IDYES then
        begin
          grupo := dataSet.FieldByName('grupo_prod').AsString;
          codprod := dataSet.FieldByName('cod_prod').AsString;
          codigovp := dataSet.FieldByName('codigo_vp').AsString;
          vCodCli := dataSet.FieldByName('cod_cliente').AsInteger;
          vCodServ := dataSet.FieldByName('cod_servico').AsInteger;
//          Cancel;
          if trim(dataSet.FieldByName('TIPOVP').AsString) = 'P' then
            montaSelect('select VENDA_PERDIDA.*,clientes.nome_cliente from VENDA_PERDIDA ' +
            	' left join clientes on VENDA_PERDIDA.cod_cliente=clientes.cod_cliente and VENDA_PERDIDA.cod_empresa=clientes.cod_empresa ' +
              ' where VENDA_PERDIDA.grupo_prod = ' + grupo + ' and' +
              ' VENDA_PERDIDA.cod_prod = ' + QuotedStr(codprod) +
              ' and VENDA_PERDIDA.codigo_vp = ' + codigovp +
              ' and VENDA_PERDIDA.cod_cliente = '+inttostr(vCodCli)+
              ' and VENDA_PERDIDA.data_vnp = :vdat and VENDA_PERDIDA.data_vnp = :vdat2' +
              ' and VENDA_PERDIDA.cod_empresa = ' + vDadosIni.codEmpresa + ' and VENDA_PERDIDA.ativo = 1', data, data)
          else
          	montaSelect('select VENDA_PERDIDA.*,clientes.nome_cliente from VENDA_PERDIDA ' +
              ' left join clientes on VENDA_PERDIDA.cod_cliente=clientes.cod_cliente and VENDA_PERDIDA.cod_empresa=clientes.cod_empresa ' +
              ' where VENDA_PERDIDA.cod_servico = ' + inttostr(vCodServ) +
              ' and VENDA_PERDIDA.codigo_vp = ' + codigovp +
              ' and VENDA_PERDIDA.cod_cliente = '+inttostr(vCodCli)+
              ' and VENDA_PERDIDA.data_vnp = :vdat and VENDA_PERDIDA.data_vnp = :vdat2' +
              ' and VENDA_PERDIDA.cod_empresa = ' + vDadosIni.codEmpresa + ' and VENDA_PERDIDA.ativo = 1', data, data);
          Edit;
          Result := false;
          Exit;
        end
        else
        	dataSet.FieldByName('SEQVP').AsInteger := Gencodigo('VENDA_PERDIDA', dtmVendaPerdida.SpIncCodigo, vDadosIni.codEmpresa);
      end
      else
      	dataSet.FieldByName('SEQVP').AsInteger := Gencodigo('VENDA_PERDIDA', dtmVendaPerdida.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    Result := inherited post;
    if dataSet.ChangeCount=0 then
      result:=true
    else Result := Apply;

    Result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('VND084', 'GRAVAR NO BANCO','SUCESSO','VENDA_PERDIDA',
        dataSet.FieldByName('SEQVP').AsString, buscas)
    else
    begin
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('VND084', 'GRAVAR NO BANCO','FALHA', 'VENDA_PERDIDA',
        dataSet.FieldByName('SEQVP').AsString,buscas);
    end;
    Refresh;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TVendaPerdida.relatorioVendasPerdidas: boolean;
begin
  if not vTipoVP.dataSet.Active then
    vTipoVP.abreTipoVendaPerdida;
  vTipoVP.IndexFieldNames := 'CODIGO_VP';
//  qrPVP := TQuickRep(frmCadVendaPerdida.qrpVP);
  frmCadVendaPerdida.detalhes.BeforePrint := DetalheBeforePrint;
  lbNumFab := TQRLabel(frmCadVendaPerdida.lbNumFab);
  lbDescricao := TQRLabel(frmCadVendaPerdida.lbDescricao);
  //  lbMedia := TQRLabel(frmCadVendaPerdida.lbMedia);
  lbTipoVP := TQRLabel(frmCadVendaPerdida.lbTipoVP);
//  qrpVP.Preview;
  frmCadVendaPerdida.qrpVP.Preview;
end;

function TVendaPerdida.StatusLixeira: boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  result := ExecutaComandosSql('select VENDA_PERDIDA.*,clientes.nome_cliente '+
    ' from VENDA_PERDIDA '+
    ' left join clientes '+
    ' on VENDA_PERDIDA.cod_empresa=clientes.cod_empresa '+
    ' and VENDA_PERDIDA.cod_cliente=clientes.cod_cliente '+
    ' where VENDA_PERDIDA.cod_empresa='+vDadosIni.codEmpresa+
    ' and VENDA_PERDIDA.ativo=0');
end;

function TVendaPerdida._abrirFormCliente: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'CLIENTE| ' + dataSet.FieldByName('COD_CLIENTE').AsString;

  formulario := Funcoes.AbreForm('pkClientes', 'TfrmCadClientes', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TVendaPerdida._abrirFormColaborador: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  vDadosIni.vPesquisa := 'CLIENTE| ' + dataSet.FieldByName('COD_VENDEDOR').AsString;

  formulario := Funcoes.AbreForm('pkColaborador', 'TfrmCadcolaborador', hdTemp);

  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TVendaPerdida._buscasDescProdServ: boolean;
var
	buscas2: TIBQuery;
begin
  result:=false;
  vRVP.vDescServico :='';
  vRVP.vDescProd :='';
  vRVP.vNumFabProd :='';

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  if dataSet.State = dsInsert then
  begin
    result:=true;
    exit;
  end
  else
  begin
    if dataSet.FieldByName('TIPOVP').AsString = 'S' then
    begin
    	buscas2.Close;
      buscas2.SQL.Text := ' select desc_servico from tipo_servico '+
        ' where cod_servico = '+ inttostr(dataSet.FieldByName('COD_SERVICO').AsInteger)+
        ' and ativo = 1 ';
      buscas2.Open;
      if not buscas2.IsEmpty then
	      vRVP.vDescServico := buscas2.FieldByName('DESC_SERVICO').AsString;
//      dataSet.FieldByName('COD_PROD').AsVariant := null;
//      dataSet.FieldByName('GRUPO_PROD').AsVariant := null;
    end
    else
    begin
    	buscas2.Close;
      buscas2.SQL.Text := 'select num_fab_prod, descr_prod from produtos '+
        ' where cod_prod = '+ QuotedStr(trim(dataSet.FieldByName('cod_prod').AsString))+
        ' and grupo_prod = '+ inttostr(dataSet.FieldByName('grupo_prod').AsInteger)+
        ' and ativo = 1 ';
      buscas2.Open;
      if not buscas2.IsEmpty then
      begin
      	vRVP.vNumFabProd := buscas2.FieldByName('NUM_FAB_PROD').AsString;
	      vRVP.vDescProd := buscas2.FieldByName('DESCR_PROD').AsString;
      end;
//      dataSet.FieldByName('COD_SERVICO').AsVariant := null;
    end;
    result:=true;
  end;
end;

function TVendaPerdida._excluirVP: boolean;
var
  codVP: integer;
  msg:string;
begin
  result := false;
  if dataSet.IsEmpty then
    exit;
  codVP := dataSet.FieldByName('CODIGO_VP').AsInteger;
  msg := 'COD:'+dataSet.FieldByName('CODIGO_VP').AsString+
      ' PROD:'+dataSet.FieldByName('GRUPO_PROD').AsString+
      '-'+dataSet.FieldByName('COD_PROD').AsString+
      ' DT:'+dataSet.FieldByName('DATA_VNP').AsString;
  if dataSet.FieldByName('ATIVO').AsInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      if not vDadosIni.PesqPros('VND079', 'EXCLUIR', msg, 'VENDA_PERDIDA',
      inttostr(codVP), buscas, true) then
        exit;

    try
      buscas.close;
      buscas.SQL.Text := 'delete from VENDA_PERDIDA '+
        ' where CODIGO_VP = '+ obVP.dataSet.FieldByName('CODIGO_VP').AsString+
        ' and GRUPO_PROD = '+dataSet.FieldByName('GRUPO_PROD').AsString +
        ' and COD_PROD = '+QuotedStr(trim(dataSet.FieldByName('COD_PROD').AsString)) +
        ' and DATA_VNP = :pDATA_VNP  and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ParamByName('pDATA_VNP').AsDateTime := dataSet.FieldByName('DATA_VNP').AsDateTime;
      buscas.Prepare;
      buscas.ExecSQL;
      Result := true;
      buscas.close;
    except
      on E: Exception do
      begin
        result := false;
        Application.MessageBox(PChar('E0006 ' + 'Erro ao ler executar comandos sql: ' + buscas.SQL.Text),'Aviso', MB_OK+MB_ICONERROR);
        registraErro('E0006 ' + e.Message + ' ' + buscas.SQL.Text);
      end;
    end;
    if result then
      result := CommitaTransacao
    else
      RollBackTransacao;
    if result then
      vDadosIni.GravaAuditoria('VND079', 'EXCLUIR', msg+' SUCESSO', 'VENDA_PERDIDA', inttostr(codVP), buscas)
    else vDadosIni.GravaAuditoria('VND079', 'EXCLUIR', msg+' FALHA', 'VENDA_PERDIDA', inttostr(codVP), buscas);
  end
  else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
  begin
    if not vDadosIni.PesqPros('VND080', 'DESATIVAR', msg, 'VENDA_PERDIDA', inttostr(codVP), buscas, true) then
      exit;
    result:= inherited edit;
    if result then
    begin
      dataSet.FieldByName('ATIVO').asinteger := 0;
      result:=inherited post;
    end;
    if result then
      result := Apply;
    if result then
      result := CommitaTransacao;
    if result then
      vDadosIni.GravaAuditoria('VND080', 'DESATIVAR', msg+' SUCESSO', 'VENDA_PERDIDA', inttostr(codVP), buscas)
    else vDadosIni.GravaAuditoria('VND080', 'DESATIVAR', msg+' FALHA', 'VENDA_PERDIDA', inttostr(codVP), buscas);
  end;
end;

function TVendaPerdida._existeServico(pCodServ:integer): boolean;
begin
  result:=false;
  buscas.Close;
  buscas.SQL.Text := ' select tp.desc_servico from tipo_servico tp '+
  	' inner join tipo_servico_empresa te on te.cod_servico = tp.cod_servico and te.cod_empresa = ' + vDadosIni.codEmpresa +
    ' where tp.cod_servico = '+ inttostr(pCodServ) +
    ' and ativo = 1';
  buscas.open;
  if not buscas.IsEmpty then
  begin
    result := true;
    dataSet.FieldByName('COD_SERVICO').AsInteger := pCodServ;
    vRVP.vDescServico:= buscas.FieldByName('desc_servico').AsString;
  end
  else
  begin
    dataSet.FieldByName('COD_SERVICO').AsVariant := null;
    vRVP.vDescServico:= '';
  end;
  buscas.Close;
end;

function TVendaPerdida._restaurarRegistro: boolean;
begin
  result:=false;
  if dataSet.IsEmpty then
    exit;
  if dataSet.FieldByName('ATIVO').asinteger = 0 then
  begin
    if not vDadosIni.PesqPros('VND083', 'EXCLUIR', 'COD:'+dataSet.FieldByName('CODIGO_VP').AsString+
    ' PROD:'+dataSet.FieldByName('GRUPO_PROD').AsString+
    '-'+dataSet.FieldByName('COD_PROD').AsString+
    ' DT:'+dataSet.FieldByName('DATA_VNP').AsString, 'VENDA_PERDIDA', dataSet.FieldByName('DATA_VNP').AsString, buscas, true) then
      exit;

    if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
      'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      result:= inherited edit;
      if result then
      begin
        dataSet.FieldByName('ATIVO').asinteger := 1;
        result:=inherited post;
      end;
      if result then
        result := Apply;
      if result then
        result := CommitaTransacao;
    end;
  end
  else
    Application.MessageBox('Registro já está ativo' + chr(13) +
      'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
  Refresh;
end;

{ TProdutoVP }

function TProdutoVP.buscaProduto(codBarra: string; grupoProd: Integer; codProd: string): boolean;
begin
  try
  	vPesqDescrProd := false;
  	if (grupoProd > 0) or (trim(codProd) <> '') then
    	montaSelect('select distinct pr.*, ' +
      	' coalesce(est.estoque, 0) estoque_disponivel, ' +
 	 	    ' coalesce(est.est_prima, 0) estoque_produzir  from produtos pr ' +
      	' inner join cod_barra cb on pr.grupo_prod = cb.grupo_prod and pr.cod_prod = cb.cod_prod and pr.cod_empresa = cb.cod_empresa ' +
        ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
        ' where pr.grupo_prod = ' + IntToStr(grupoProd) +
        ' and pr.cod_prod = ' + QuotedStr(codProd) +
        ' and pr.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and pr.ativo = 1 ')
    else
      montaSelect(' select distinct pr.*, ' +
      	' coalesce(est.estoque, 0) estoque_disponivel, ' +
 	 	    ' coalesce(est.est_prima, 0) estoque_produzir  from produtos pr ' +
      	' inner join cod_barra cb on pr.grupo_prod = cb.grupo_prod and pr.cod_prod = cb.cod_prod and pr.cod_empresa = cb.cod_empresa ' +
        ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
        ' where cb.cod_barra = ' + QuotedStr(codBarra) +
        ' and pr.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and pr.ativo = 1 ');
  	if dataSet.IsEmpty then
    begin
    	montaSelect('select distinct pr.*, ' +
      	' coalesce(est.estoque, 0) estoque_disponivel, ' +
		 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos pr ' +
      	' inner join cod_barra cb on pr.grupo_prod = cb.grupo_prod and pr.cod_prod = cb.cod_prod and pr.cod_empresa = cb.cod_empresa ' +
        ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
        ' where pr.descr_prod like ' + QuotedStr(codBarra + '%') +
        ' and pr.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and pr.ativo = 1 ' +
        ' order by pr.descr_prod ');

      if not dataset.IsEmpty then
	    	vPesqDescrProd := true;
    end;

    if not dataSet.IsEmpty then
      if dataSet.RecordCount > 1 then
        if not vDadosIni._abreFormEscolhaProdutosIni(dataSet) then
        begin
          Result := false;
          exit;
        end;

	  if dataSet.IsEmpty then
	    raise exception.create('Produto não encontrado');

//    if dataSet.IsEmpty then
//    begin
//      if not vBarra.abreCodBarra(codBarra) then
//        raise exception.create('Produto não encontrado');
//      if not buscaProduto('', vBarra.dataSet.FieldByName('grupo_prod').AsInteger,
//        vBarra.dataSet.FieldByName('cod_prod').AsString) then
//        raise exception.create('Produto não encontrado');
//    end;
    if dataSet.FieldByName('CONSUMO').AsString = 'S' then
    begin
     raise exception.create('Produto para consumo, ' + chr(13) +
        'Favor Verificar no cadastro');
    end;
    Result := true;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

constructor TProdutoVP.create;
begin
  DataSet := TClientDataSet(dtmVendaPerdida.cdsprod);
  transacao := TIBTransaction(dtmVendaPerdida.transacao);
  Buscas := TIBQuery(dtmVendaPerdida.qrBuscas);
  vBarra := TCodBarraVP.create;
end;

destructor TProdutoVP.Destroy;
begin
  vBarra.Free;
  vBarra := nil;
  inherited;
end;

{ TCodBarraVP }

function TCodBarraVP.abreCodBarra(codBarra: string): boolean;
begin
  Result := montaSelect('select grupo_prod,cod_prod from cod_barra ' +
  	' where cod_barra = ' + QuotedStr(codBarra) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 ');
  Result := not dataSet.IsEmpty;
end;

constructor TCodBarraVP.create;
begin
  DataSet := TClientDataSet(dtmVendaPerdida.cdsBarra);
  transacao := TIBTransaction(dtmVendaPerdida.transacao);
  Buscas := TIBQuery(dtmVendaPerdida.qrBuscas);
end;

{ TClienteVP }

constructor TClienteVP.create;
begin
  DataSet := TClientDataSet(dtmVendaPerdida.cdsCliVP);
  transacao := TIBTransaction(dtmVendaPerdida.transacao);
end;



function TClienteVP.ListaClienteVP(pCodCli: integer): boolean;
begin
  result := montaSelect('SELECT COD_CLIENTE,NOME_CLIENTE FROM CLIENTES '+
    ' WHERE cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cod_cliente = ' +inttostr(pCodCli)+
    ' and ativo=1 ');
  dataSet.IndexFieldNames := 'NOME_CLIENTE';
end;

end.

