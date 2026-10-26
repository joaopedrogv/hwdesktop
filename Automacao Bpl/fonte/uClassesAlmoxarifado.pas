unit uClassesAlmoxarifado;

interface

uses
  uDataSet_OOP, uDtmAtivo, Db, Windows, Forms, Controls, RDPrint,
  UClassesPedVenda, IBQuery, QuickRpt;

type
  TAlmoxarifado = class(TDataSet_OOP)
  private
    vTipo: string;
    vRel: TQuickRep;
    relMovProd, relRelacAtend: TIBQuery;
    procedure bandaMovDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure PreviewRelatorio(Sender: TObject);
    function rdprint_relatorioMovimendoDeProdutos: boolean;
    function relatorioRelacaoAtendimentos: boolean;
    function relatorioMovimendoDeProdutos: boolean;
  public
    vVenda: TPedVenda;
    constructor create;
    destructor Destroy; override;

    function cadControleAlmoxarifado: boolean;
    function confirmarVenda: boolean;
    function selecionaAlmoxarifado(nped, vendedor: integer; situacao: string; vReq: boolean):
      boolean;
    function incluirAtendimento: boolean;
    function removerAtendimento: boolean;
    function removerItemDaVenda: boolean;
    function relatorio: boolean;

  end;

implementation

uses
  uDtmAlmoxarifado, IBDatabase, IBStoredProc, DBClient, SysUtils, uAlmoxarifado,
  Classes, DateUtils, StdCtrls, UClassesClientes, uDtmPedVenda, CallerNFSeFeaturesUnit;

{ TAlmoxarifado }

procedure TAlmoxarifado.bandaMovDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if frmAlmoxarifado = nil then
    Exit;
  frmAlmoxarifado.qrlEstAt.caption := Format('%8.2f', [relMovProd.FieldByName('est_f').AsFloat +
    relMovProd.FieldByName('est_r').AsFloat - relMovProd.FieldByName('pend').AsFloat]);
end;

function TAlmoxarifado.cadControleAlmoxarifado: boolean;
begin
  if dtmAlmoxarifado = nil then
    dtmAlmoxarifado := TdtmAlmoxarifado.Create(dtmAlmoxarifado);
  if frmAlmoxarifado = nil then
    Application.CreateForm(TfrmAlmoxarifado, frmAlmoxarifado);
  frmAlmoxarifado.cbSituacao.ItemIndex := 1;
  frmAlmoxarifado.Show; //Modal;
end;

function TAlmoxarifado.confirmarVenda: boolean;
var
  vCliente: TCadClientes;
begin
  if dataSet.IsEmpty then
    raise exception.create('Venda não encontrada');
  if (not (vVenda.dataSet.State in [dsBrowse, dsEdit, dsInsert])) or (vVenda.dataSet.IsEmpty) or
    (vVenda.dataSet.FieldByName('nped').AsInteger <> dataSet.FieldByName('nped').AsInteger) then
    vVenda.abrePedVenda(dataSet.FieldByName('nped').AsInteger);
  if (not (vVenda.vItProd.dataSet.State in [dsBrowse, dsEdit, dsInsert])) or
    (vVenda.vItProd.dataSet.IsEmpty) or (vVenda.vItProd.dataSet.FieldByName('nped').AsInteger <>
    dataSet.FieldByName('nped').AsInteger) then
    vVenda.vItProd.abrePedVendaProd(dataSet.FieldByName('nped').AsInteger);

//  vVenda.calculaTotais;
//  Result := vVenda.confirmarVenda;


  if vVenda.vendaFechada then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', vVenda.buscas) then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    if not vVenda._permitirAlteracoesComEnvioMobilePendente then
      Exit;
    vVenda.abrePedVenda(vVenda.dataSet.FieldByName('NPED').AsInteger);

    if not vVenda.verificaCalculoPendente then
      Exit;

    if not vVenda.Edit then
      exit;

    if vVenda.getTipoVenda <> 'ORC' then
    begin
      if not vVenda.validaCheckCheck then
      	Exit;
        
    	if not vVenda.validaFaturamento then
      	Exit;
    end;

    if vVenda.getTipoVenda = 'OS' then
    begin
      if not vVenda.vItProd.vProduto.validaEstoqueFechamento then
      begin
        Application.MessageBox('O documento não foi confirmado.', 'Informação', MB_ICONEXCLAMATION + MB_OK);
        exit;
      end;
    end;
    if vVenda.getTipoVenda = 'REQ' then
    begin
      if not vVenda.vItProd.vProduto.validaEstoqueFechamento then
      begin
        Application.MessageBox('O documento não foi confirmado.', 'Informação', MB_ICONEXCLAMATION + MB_OK);
        exit;
      end;
    end;

    if vVenda.dataSet.FieldByName('idmobile').AsInteger > 0 then
    begin
      if vVenda.dataSet.FieldByName('cod_cliente').AsInteger <> strtoint(vDadosIni.vCliente.vCodClientePadrao) then
      begin
        vCliente := TCadClientes.create;
        vCliente.abreClientes(vVenda.dataSet.FieldByName('cod_cliente').AsInteger);

        if vCliente.SituacaoDeCaixa(false, (vVenda.getTipoVenda <> 'ORC')) = false then
             exit;

        if not vCliente.formClienteAberto then
        begin
          vCliente.Free;
          vCliente := nil;
        end;
      end;

      //Checar limite de credito do cliente
      if vVenda.getTipoVenda <> 'ORC' then
      begin
      	if not vVenda.validaLimiteCredito then
        	Exit;
      end;
    end;
    if vVenda._checarRegrasDescontoAoConfirmarVND then
    if vVenda.confirmarVenda then
    begin
      if (vDadosIni.vEmp.vModoFaturamento <> 'S') then
      begin
        if trim(vVenda.dataset.FieldByName('TIPO').AsString) = 'OS' then
        begin
          if vDadosIni.vEmp.vNfe.modeloNFServico = '55' then
          begin
           vVenda.buscas.close;
           vVenda.buscas.sql.text := ' select count(*) as qtde, ' +
           	' sum(valor_tot_serv-rateio_desc) as valor from pedvenda_serv ' +
           	' where nped = ' + IntToStr(vVenda.dataSet.FieldByName('NPED').AsInteger) +
            ' and tipo = ' + QuotedStr(vVenda.dataSet.FieldByName('TIPO').AsString) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
           	' and valor_tot_serv <> 0 ' +
            ' and (n_nf is null or n_nf = 0) ' +
            ' and (status is null or status = '''') ';
           vVenda.buscas.open;
           if vVenda.buscas.FieldByName('qtde').AsInteger > 0 then
           begin
            if Application.MessageBox(Pchar('Deseja Emitir NFSe dos serviços desta Venda no valor de:'+format('%n', [vVenda.buscas.fieldbyname('valor').ascurrency])+'?'), 'Confirmação',
              MB_YESNO + MB_DEFBUTTON2) = mrYES then
              CallerNFSeFeatures.Emitir( vVenda.fint('nped'), False );
           end;
          end;
        end;
      end;
    end;
  finally
    vVenda.pedidoEmEdicao(caRemoverEdicao, False);
    Screen.Cursor := crDefault;
  end;
end;

constructor TAlmoxarifado.create;
begin
  if dtmAlmoxarifado = nil then
    dtmAlmoxarifado := TdtmAlmoxarifado.Create(dtmAlmoxarifado);
  if dtmPedVenda = nil then
    dtmPedVenda := TdtmPedVenda.Create(dtmPedVenda);

  dataSet := TClientDataSet(dtmAlmoxarifado.cdsAlmox);
  buscas := TIBQuery(dtmAlmoxarifado.qrBuscas);
  transacao := TIBTransaction(dtmAlmoxarifado.transacao);
  vVenda := TPedVenda.Create(dtmPedVenda);
  vVenda.vColab.abreColaboradorVendedor;
  vVenda.vColab.IndexFieldNames := 'nome_vendedor';
  vVenda.vEmp.abreEmpresa;
  dataSet.Close;
end;

destructor TAlmoxarifado.Destroy;
begin
  FreeAndNil(vVenda);
  inherited;
end;

function TAlmoxarifado.incluirAtendimento: boolean;
var
  vDataHora: TDateTime;
begin
  try
    if not vDadosIni.PesqPros('VND106', 'CONFIRMAR', vDadosIni.vtpVenda+' '+dataset.fieldbyname('NUM_FAB_PROD').AsString+' ITEM '+
    dataset.fieldbyname('NITEM').AsString, 'PEDVENDA', dataSet.FieldByName('NPED').AsString, buscas, true) then
    begin
     Result:=false;
     exit;
    end;
    if dataSet.IsEmpty then
      raise exception.create('Produtos não econtrados');
    //    if (not (vVenda.dataSet.State in [dsBrowse, dsEdit, dsInsert])) or (vVenda.dataSet.IsEmpty) or
    //      (vVenda.dataSet.FieldByName('nped').AsInteger <> dataSet.FieldByName('nped').AsInteger) then
    vVenda.abrePedVenda(dataSet.FieldByName('nped').AsInteger);
    //    if (not (vVenda.vItProd.dataSet.State in [dsBrowse, dsEdit, dsInsert])) or
    //      (vVenda.vItProd.dataSet.IsEmpty) or (vVenda.vItProd.dataSet.FieldByName('nped').AsInteger <>
    //      dataSet.FieldByName('nped').AsInteger) then
    vVenda.vItProd.abrePedVendaProd(dataSet.FieldByName('nped').AsInteger);
    vVenda.vItProd.First;
    while not vVenda.vItProd.dataSet.Eof do
    begin
      if (vVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger =
        dataSet.FieldByName('grupo_prod').AsInteger) and
        (vVenda.vItProd.dataSet.FieldByName('cod_prod').AsString =
        dataSet.FieldByName('cod_prod').AsString) and
        (vVenda.vItProd.dataSet.FieldByName('nitem').AsInteger = dataSet.FieldByName('nitem').AsInteger) then
      begin
        vDataHora := vDadosIni.getDataHoraBanco(buscas);
        vVenda.vItProd.dataSet.Edit;
        vVenda.vItProd.dataSet.FieldByName('SIT_ATD').AsString := 'AT';
        vVenda.vItProd.dataSet.FieldByName('DATA_ATD').AsString := FormatDateTime(ShortDateFormat,
          vDataHora);
        vVenda.vItProd.dataSet.FieldByName('HORA_ATD').AsString := FormatDateTime(ShortTimeFormat,
          vDataHora);
        vVenda.vItProd.dataSet.Post;
        vVenda.vItProd.Apply;
        vVenda.vItProd.CommitaTransacao;
        Result := true;
        dataSet.Edit;
        dataSet.FieldByName('SIT_ATD').AsString := 'AT';
        dataSet.Post;
        dataset.close;
        dataset.open;
        exit;
      end;
      vVenda.vItProd.Next;
    end;
    raise exception.create('Produto não econtrado');
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;
end;

procedure TAlmoxarifado.PreviewRelatorio(Sender: TObject);
begin
  vDadosIni.VisualizaRelQrp(Sender, TQuickRep(vRel).ReportTitle);
end;

function TAlmoxarifado.rdprint_relatorioMovimendoDeProdutos: boolean;
var
  vRel: TRDprint;
  buscas2: TIBQuery;
  vLinha, vpag: Integer;
  vQtdebusca: Extended;
  vSqlAd: string;
  vCount: Integer;
  vSqlVendedor: string;

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
    if not frmAlmoxarifado.CheckBox1.Checked then
      vNomeColab := ' - ' + vVenda.vColab.dataSet.FieldByName('nome_vendedor').AsString;
    vLinha := vLinha + 1;
    vRel.ImpF(vLinha, 1, 'DE: ' + frmAlmoxarifado.MaskEdit1.text + ' A ' + frmAlmoxarifado.MaskEdit2.text + vNomeColab, [normal, negrito]);
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
  buscas2 := TIBQuery(dtmAlmoxarifado.qrBuscas2);
  vSqlVendedor := '';
  if not frmAlmoxarifado.CheckBox1.Checked then
    vSqlVendedor := ' and pp.cod_vendedor = ' + IntToStr(vVenda.vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

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
    ' order by 1';
  buscas.ParamByName('vdat1').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
  buscas.ParamByName('vdat2').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
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
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
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
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
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
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
      buscas2.ParamByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
      buscas2.ParamByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
      buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas2.Open;

      vQtdebusca := vQtdebusca + buscas2.FieldByName('qtde').AsFloat;

      vRel.ImpF(vLinha, 1, buscas.FieldByName('NUM_FAB_PROD').AsString, [Comp17]);
      vRel.ImpF(vLinha, 15, Copy(buscas.FieldByName('descr_prod_ped').AsString,1 , 41 - (Length(Trim(format('%n', [vQtdebusca])))) ), [Comp17]);
      vRel.ImpF(vLinha, 49, vDadosIni.AlnDir(format('%n', [vQtdebusca]), 8), [Comp17]);

      buscas2.Close;
      buscas2.SQL.Text := 'select sum(pp.quant_ped_item) qtde  from pedvenda_prod pp' +
        ' inner join pedvenda pv on pv.nped = pp.nped and pv.tipo = pp.tipo and pv.cod_empresa = pp.cod_empresa' +
        ' where pv.data_ped >= :vdat1 and pv.data_ped <= :vdat2 and pp.cod_empresa = :cod_empresa' +
        ' and pp.grupo_prod = :grupo_prod and pp.cod_prod = :cod_prod' +
        ' and pp.tipo = ''REQ'' and coalesce(pp.status, '''') <> ''CANCELADO'' and pp.sit_atd = ''NT''';
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
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
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
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
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
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
      buscas2.ParamByName('vdat1').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
      buscas2.ParamByName('vdat2').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
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
    vDadosIni.abreStatusProcessamento('Relatório', 'Obtendo dados. 100%');
    vRel.fechar;

  finally
    vDadosIni.fechaStatusProcessamento;
    FreeAndNil(vRel);
  end;
end;

function TAlmoxarifado.relatorio: boolean;
var
  vData: string;
begin
  if not vDadosIni.PesqPros('VND108', 'EMITIR', '', 'PEDVENDA_PROD', '', buscas, true) then
   Exit;

  if frmAlmoxarifado = nil then
    Application.CreateForm(TfrmAlmoxarifado, frmAlmoxarifado);
  frmAlmoxarifado.PageControl1.ActivePage := frmAlmoxarifado.tsOpcoesRel;

  if not vVenda.vColab.Active then
    vVenda.vColab.abreColaboradorVendedor;
  if not vVenda.vEmp.Active then
    vVenda.vEmp.abreEmpresa;
  if (frmAlmoxarifado.MaskEdit1.Text = '  /  /    ') or
    (frmAlmoxarifado.MaskEdit2.Text = '  /  /    ') then
    vData := DateToStr(vDadosIni.getDataBanco(buscas));
  if (frmAlmoxarifado.MaskEdit1.Text = '  /  /    ') then
    frmAlmoxarifado.MaskEdit1.Text := DateToStr(StartOfTheMonth(StrToDate(vData)));
  if (frmAlmoxarifado.MaskEdit2.Text = '  /  /    ') then
    frmAlmoxarifado.MaskEdit2.Text := vData;
  frmAlmoxarifado.ComboBox1.ItemIndex := 0;
  frmAlmoxarifado.BitBtn57.Tag := 0;
  while true do
  begin
    if frmAlmoxarifado = nil then
      Exit
    else if frmAlmoxarifado.BitBtn57.Tag <> 0 then
      Break
    else
      Application.ProcessMessages;
  end;

  if frmAlmoxarifado.BitBtn57.Tag = 1 then
  begin
    if frmAlmoxarifado.RadioButton1.Checked then
      relatorioMovimendoDeProdutos
    else
      relatorioRelacaoAtendimentos;
  end;
  frmAlmoxarifado.PageControl1.ActivePage := frmAlmoxarifado.tsControleAlmoxarifado;
end;

function TAlmoxarifado.relatorioMovimendoDeProdutos: boolean;
var
  vData: string;
begin
  //  if frmAlmoxarifado = nil then
  //    Application.CreateForm(TfrmAlmoxarifado, frmAlmoxarifado);
  //  frmAlmoxarifado.PageControl1.ActivePage := frmAlmoxarifado.tsOpcoesRel;
  //
  //  if not vVenda.vColab.Active then
  //    vVenda.vColab.abreColaboradorVendedor;
  //  if not vVenda.vEmp.Active then
  //    vVenda.vEmp.abreEmpresa;
  //  vData := DateToStr(vDadosIni.getDataBanco(buscas));
  //  frmAlmoxarifado.MaskEdit1.Text := vData;
  //  frmAlmoxarifado.MaskEdit2.Text := vData;
  //  frmAlmoxarifado.ComboBox1.ItemIndex := 0;
  //  if frmAlmoxarifado.ShowModal = mrOk then
  //  begin
  rdprint_relatorioMovimendoDeProdutos;
  Exit;

  frmAlmoxarifado.DetailBand1.BeforePrint := bandaMovDetalheBeforePrint;
  vRel := TQuickRep(frmAlmoxarifado.qkRMovProd);
  frmAlmoxarifado.qkRMovProd.OnPreview := PreviewRelatorio;
  frmAlmoxarifado.qrLperiodoMov.Caption := 'Período de ' + frmAlmoxarifado.MaskEdit1.Text + ' até '
    + frmAlmoxarifado.MaskEdit2.Text;
  relMovProd := TIBQuery(dtmAlmoxarifado.qrRelMovProd);
  relMovProd.Close;
  if not frmAlmoxarifado.CheckBox1.Checked then
  begin
    relMovProd.SQL.Add(' and pedprod.cod_vendedor = :cod_vendedor');
    relMovProd.ParamByName('cod_vendedor').AsInteger :=
      vVenda.vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
  end;
  relMovProd.ParamByName('dataini').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
  relMovProd.ParamByName('datafim').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
  relMovProd.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  relMovProd.Open;
  frmAlmoxarifado.qkRMovProd.Preview;
  //  end;
  //  frmAlmoxarifado.PageControl1.ActivePage := frmAlmoxarifado.tsControleAlmoxarifado;
  //  frmAlmoxarifado.ShowModal;
end;

function TAlmoxarifado.relatorioRelacaoAtendimentos: boolean;
var
  vData: string;
begin
  //  if frmAlmoxarifado = nil then
  //    Application.CreateForm(TfrmAlmoxarifado, frmAlmoxarifado);
  //  frmAlmoxarifado.PageControl1.ActivePage := frmAlmoxarifado.tsOpcoesRel;
  //
  //  if not vVenda.vColab.Active then
  //    vVenda.vColab.abreColaboradorVendedor;
  //  if not vVenda.vEmp.Active then
  //    vVenda.vEmp.abreEmpresa;
  //  vData := DateToStr(vDadosIni.getDataBanco(buscas));
  //  frmAlmoxarifado.MaskEdit1.Text := vData;
  //  frmAlmoxarifado.MaskEdit2.Text := vData;
  //  frmAlmoxarifado.ComboBox1.ItemIndex := 0;
  //  if frmAlmoxarifado.ShowModal = mrOk then
  //  begin

  frmAlmoxarifado.DetailBand1.BeforePrint := bandaMovDetalheBeforePrint;
  vRel := TQuickRep(frmAlmoxarifado.qkRRelacAtend);
  frmAlmoxarifado.qkRRelacAtend.OnPreview := PreviewRelatorio;
  frmAlmoxarifado.qrLPeriodoAtend.Caption := 'Período de ' + frmAlmoxarifado.MaskEdit1.Text +
    ' até ' + frmAlmoxarifado.MaskEdit2.Text;
  relRelacAtend := TIBQuery(dtmAlmoxarifado.qrRelRelaAten);
  relRelacAtend.Close;
  if not frmAlmoxarifado.CheckBox1.Checked then
  begin
    relRelacAtend.SQL.Add(' and p2.cod_vendedor = :cod_vendedor');
    relRelacAtend.ParamByName('cod_vendedor').AsInteger :=
      vVenda.vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
  end;
  relRelacAtend.ParamByName('dataini').AsDate := StrToDate(frmAlmoxarifado.MaskEdit1.Text);
  relRelacAtend.ParamByName('datafim').AsDate := StrToDate(frmAlmoxarifado.MaskEdit2.Text);
  relRelacAtend.ParamByName('sit_atd').AsString := frmAlmoxarifado.ComboBox1.Text;
  relRelacAtend.ParamByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  relRelacAtend.Open;
  relRelacAtend.FetchAll;
  frmAlmoxarifado.qkRRelacAtend.Preview;
  //  end;
  //  frmAlmoxarifado.PageControl1.ActivePage := frmAlmoxarifado.tsControleAlmoxarifado;
  //  frmAlmoxarifado.ShowModal;
end;

function TAlmoxarifado.removerAtendimento: boolean;
var
  vDataHora: TDateTime;
begin
  try
    if not vDadosIni.PesqPros('VND107', 'REMOVER', vDadosIni.vtpVenda+' '+dataset.fieldbyname('NUM_FAB_PROD').AsString+' ITEM '+
    dataset.fieldbyname('NITEM').AsString, 'PEDVENDA', dataSet.FieldByName('NPED').AsString, buscas, true) then
    begin
      result:=false;
      exit;
    end;
    if dataSet.IsEmpty then
      raise exception.create('Produtos não econtrados');
    vVenda.abrePedVenda(dataSet.FieldByName('nped').AsInteger);
    if vVenda.dataSet.fieldbyname('STATUS_PED').AsString = 'FECHADA' then
     raise exception.create('Venda já Fechada');
    vVenda.vItProd.abrePedVendaProd(dataSet.FieldByName('nped').AsInteger);
    vVenda.vItProd.First;
    while not vVenda.vItProd.dataSet.Eof do
    begin
      if (vVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger =
        dataSet.FieldByName('grupo_prod').AsInteger) and
        (vVenda.vItProd.dataSet.FieldByName('cod_prod').AsString =
        dataSet.FieldByName('cod_prod').AsString) then
      begin
        vDataHora := vDadosIni.getDataHoraBanco(buscas);
        vVenda.vItProd.dataSet.Edit;
        vVenda.vItProd.dataSet.FieldByName('SIT_ATD').AsString := 'NT';
        vVenda.vItProd.dataSet.FieldByName('DATA_ATD').AsString := FormatDateTime(ShortDateFormat,
          vDataHora);
        vVenda.vItProd.dataSet.FieldByName('HORA_ATD').AsString := FormatDateTime(ShortTimeFormat,
          vDataHora);
        vVenda.vItProd.dataSet.Post;
        vVenda.vItProd.Apply;
        vVenda.vItProd.CommitaTransacao;
        Result := true;
        dataSet.Edit;
        dataSet.FieldByName('SIT_ATD').AsString := 'NT';
        dataSet.Post;
        dataSet.close;
        dataset.Open;
        exit;
      end;
      vVenda.vItProd.Next;
    end;
    raise exception.create('Produto não econtrado');
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;
end;

function TAlmoxarifado.removerItemDaVenda: boolean;
begin
  try
    if not vDadosIni.PesqPros('VND052', 'REMOVER', vDadosIni.vtpVenda+' '+dataset.fieldbyname('NUM_FAB_PROD').AsString+' ITEM '+
    dataset.fieldbyname('NITEM').AsString, 'PEDVENDA', dataSet.FieldByName('NPED').AsString, buscas, true) then
    begin
      result:=false;
      exit;
    end;

    if dataSet.IsEmpty then
      raise exception.create('Produtos não econtrados');
    vVenda.abrePedVenda(dataSet.FieldByName('nped').AsInteger);
    if vVenda.dataSet.fieldbyname('STATUS_PED').AsString = 'FECHADA' then
     raise exception.create('Venda já Fechada');
    vVenda.vItProd.abrePedVendaProd(dataSet.FieldByName('nped').AsInteger);
    vVenda.vItProd.First;
    while not vVenda.vItProd.dataSet.Eof do
    begin
      if (vVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger =
        dataSet.FieldByName('grupo_prod').AsInteger) and
        (vVenda.vItProd.dataSet.FieldByName('cod_prod').AsString =
        dataSet.FieldByName('cod_prod').AsString) then
      begin
        result := vVenda.removeItemParaAlmoxarifado;
        dataSet.Refresh;
        Exit;
      end;
      vVenda.vItProd.Next;
    end;
    raise exception.create('Produto não econtrado');
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;
end;

function TAlmoxarifado.selecionaAlmoxarifado(nped, vendedor: integer;
  situacao: string; vReq: boolean): boolean;
begin
  try
    vTipo := 'OS';
    if vReq then
      vTipo := 'REQ';
    vDadosIni.vtpVenda := vTipo;
    vVenda.create(DtmPedVenda);
    if nped <= 0 then
      raise exception.create('Numero da ' + vTipo + ' não informado');
    if vVenda.vColab.dataSet.IsEmpty then
      raise exception.create('Nenhum vendedor encontrado');
    if trim(situacao) = '' then
      raise exception.create('Situação deve ser preenchida');
    if (trim(situacao) <> 'AT') and (trim(situacao) <> 'NT') then
      raise exception.create('Situação deve ser AT=Atendida ou NT=Não Atendida');

    Result := montaSelect('select ped.nped, ped.tipo, pedprod.num_fab_prod, pedprod.descr_prod_ped,'
      +
      ' prod.locacao_prod, prod.locacao_prod_1, pedprod.sit_atd, pedprod.data_atd, pedprod.hora_atd,' +
      ' pedprod.quant_ped_item, prod.grupo_prod, prod.cod_prod, ped.status_ped, prod.est_f, ' +
      ' ped.stat_req,pedprod.nitem ' +
      ' from pedvenda ped' +
      ' inner join pedvenda_prod pedprod on pedprod.nped = ped.nped and pedprod.tipo = ped.tipo' +
      ' and pedprod.cod_empresa = ped.cod_empresa and (pedprod.status is null or pedprod.status = '''') ' +
      ' inner join produtos prod on prod.grupo_prod = pedprod.grupo_prod' +
      ' and prod.cod_prod = pedprod.cod_prod and prod.cod_empresa = pedprod.cod_empresa' +
      ' where ped.tipv <> ''C'' and ped.tipv <> ''E'' and ped.tipv <> ''O''' +
      ' and ped.nped = ' + IntToStr(nped) + ' and pedprod.cod_vendedor = ' + IntToStr(vendedor) +
      ' and pedprod.sit_atd = ' + QuotedStr(situacao) + ' and pedprod.tipo = ' + QuotedStr(vTipo) +
      ' and ped.ativo = 1 and ped.cod_empresa = ' + vdadosIni.codempresa);
    IndexFieldNames := 'NUM_FAB_PROD';
    if dataSet.IsEmpty then
    begin
      Application.MessageBox(pchar('Nenhum item encontrado nesta ' + vTipo + ' ou nenhuma ' + vTipo
        +
        ' encontrada'), 'Atenção', MB_OK +
        MB_ICONEXCLAMATION);
      Result := false;
    end;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;
end;

end.

