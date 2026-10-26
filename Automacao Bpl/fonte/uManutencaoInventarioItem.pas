unit uManutencaoInventarioItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, uEditHw, Buttons, Grids, DBGrids, Mask, ExtCtrls,
  ComCtrls, DBCtrls, inv_tipo74_class, inv_tipo74_posse_class, uClassesManutencaoInventario,
  DB, QuickRpt, QRCtrls, qrpctrls, hw_win_utils;

type
  TfrmManutencaoInventarioItem = class(TfrmPadrao)
    page_princ: TPageControl;
    ts_consulta: TTabSheet;
    ts_inventario: TTabSheet;
    ts_posse: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    ed_cons_dataIni: TMaskEdit;
    Label2: TLabel;
    ed_cons_dataFim: TMaskEdit;
    bt_consulta: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    grid_consulta: TDBGrid;
    BitBtn2: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel9: TPanel;
    SpeedButton1: TSpeedButton;
    bt_consulta_alterar: TSpeedButton;
    Panel8: TPanel;
    grid_inventario: TDBGrid;
    Panel10: TPanel;
    bt_prod_add: TSpeedButton;
    bt_prod_edit: TSpeedButton;
    bt_prod_del: TSpeedButton;
    pn_posse: TPanel;
    Label10: TLabel;
    Panel19: TPanel;
    bt_posse_save: TBitBtn;
    bt_posse_cancel: TBitBtn;
    Label11: TLabel;
    ed_posse_cod_cliente: TMaskEdit;
    Label12: TLabel;
    ed_posse_qtde: TEditHw;
    Label13: TLabel;
    ed_posse_vl_un: TEditHw;
    Label14: TLabel;
    ed_posse_vl_tot: TEditHw;
    rd_posse_0: TRadioButton;
    rd_posse_1: TRadioButton;
    rd_posse_2: TRadioButton;
    Label15: TLabel;
    ed_posse_prod: TMaskEdit;
    Label16: TLabel;
    ed_posse_data: TMaskEdit;
    Panel12: TPanel;
    ed_posse_nome: TMaskEdit;
    lb_mesmo_prod: TLabel;
    bt_prod_voltar: TSpeedButton;
    dbt_data: TDBText;
    dbt_valor: TDBText;
    ts_terceiros: TTabSheet;
    pn_terceiros: TPanel;
    Panel7: TPanel;
    Panel11: TPanel;
    ed_terceiro_nome: TMaskEdit;
    ed_terceiro_cod: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ed_vendas_ini: TMaskEdit;
    ed_vendas_fim: TMaskEdit;
    bt_vendas_consulta: TBitBtn;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel13: TPanel;
    grid_vendas: TDBGrid;
    ck_usar_valor_uni: TCheckBox;
    BitBtn3: TBitBtn;
    bt_prod_add_vendas: TSpeedButton;
    Panel16: TPanel;
    Label8: TLabel;
    DBText1: TDBText;
    Label9: TLabel;
    DBText2: TDBText;
    Label17: TLabel;
    DBText3: TDBText;
    Label18: TLabel;
    DBText4: TDBText;
    Label19: TLabel;
    DBText5: TDBText;
    pn_posse_vendas: TPanel;
    grid_posse_vendas: TDBGrid;
    Splitter1: TSplitter;
    Panel17: TPanel;
    bt_vendas_vinc_del: TSpeedButton;
    Panel18: TPanel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    BitBtn4: TBitBtn;
    ed_loc_prod: TMaskEdit;
    Label20: TLabel;
    ts_rel_credito: TTabSheet;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    lbCodMerc: TQRLabel;
    lbCodNcm: TQRLabel;
    lbCest: TQRLabel;
    lbQtdeEstoque: TQRLabel;
    lbUnidade: TQRLabel;
    lbAliqInterna: TQRLabel;
    QRPShape1: TQRPShape;
    QRLabel7: TQRLabel;
    lbChaveNfe: TQRLabel;
    QRLabel9: TQRLabel;
    lbQtdeItemNf: TQRLabel;
    QRLabel11: TQRLabel;
    lbUnidadeNf: TQRLabel;
    QRLabel13: TQRLabel;
    lbFatorNf: TQRLabel;
    QRLabel15: TQRLabel;
    lbQtdeUtil: TQRLabel;
    QRLabel17: TQRLabel;
    lbValorNf: TQRLabel;
    QRLabel19: TQRLabel;
    lbBaseSt: TQRLabel;
    QRLabel21: TQRLabel;
    lbRedBase: TQRLabel;
    QRLabel23: TQRLabel;
    lbCredito: TQRLabel;
    QRLabel25: TQRLabel;
    lbICMS: TQRLabel;
    bt_relatorio_credito: TSpeedButton;
    QRSubDetail2: TQRSubDetail;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    lbTotValor: TQRLabel;
    lbTotBaseSt: TQRLabel;
    lbTotCreditoST: TQRLabel;
    lbTotCredioICMS: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    lbUnitValor: TQRLabel;
    lbUnitBaseSt: TQRLabel;
    lbUnitCreditoST: TQRLabel;
    lbUnitCredioICMS: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel20: TQRLabel;
    QRSysData1: TQRSysData;
    qrlbEmpresa: TQRLabel;
    qrlbEndereco: TQRLabel;
    qrlbParametros: TQRLabel;
    lbDescrMerc: TQRLabel;
    SummaryBand1: TQRBand;
    lbSumValorRotulo: TQRLabel;
    lbSumValor: TQRLabel;
    lbSumBaseStRotulo: TQRLabel;
    lbSumBaseSt: TQRLabel;
    QRLabel30: TQRLabel;
    lbSumCreditoST: TQRLabel;
    QRLabel32: TQRLabel;
    lbSumCredioICMS: TQRLabel;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    procedure grid_consultaTitleClick(Column: TColumn);
    procedure grid_vendasTitleClick(Column: TColumn);
    procedure grid_inventarioTitleClick(Column: TColumn);
    procedure grid_inventarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure bt_relatorio_creditoClick(Sender: TObject);
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure grid_vendasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ed_loc_prodChange(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure bt_vendas_vinc_delClick(Sender: TObject);
    procedure grid_consultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure bt_vendas_consultaClick(Sender: TObject);
    procedure ed_terceiro_codExit(Sender: TObject);
    procedure bt_prod_add_vendasClick(Sender: TObject);
    procedure grid_vendasColExit(Sender: TObject);
    procedure grid_vendasColEnter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure rd_posse_0Click(Sender: TObject);
    procedure ed_posse_vl_totExit(Sender: TObject);
    procedure ed_posse_vl_unExit(Sender: TObject);
    procedure ed_posse_qtdeExit(Sender: TObject);
    procedure ed_posse_prodExit(Sender: TObject);
    procedure bt_prod_voltarClick(Sender: TObject);
    procedure ed_posse_prodEnter(Sender: TObject);
    procedure lb_mesmo_prodClick(Sender: TObject);
    procedure ed_posse_dataExit(Sender: TObject);
    procedure ed_posse_cod_clienteExit(Sender: TObject);
    procedure ed_posse_cod_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_posse_prodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_posse_cod_clienteKeyPress(Sender: TObject; var Key: Char);
    procedure bt_prod_editClick(Sender: TObject);
    procedure bt_prod_delClick(Sender: TObject);
    procedure bt_prod_addClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure bt_consulta_alterarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bt_consultaClick(Sender: TObject);
  private
    rel: TRelatorioCreditoStRet;
    csvFile: TCSVWriter;

    procedure posse_venda_scroll(Sender: TObject);

    procedure bt_posse_save_insert_Click(Sender: TObject);
    procedure bt_posse_save_update_Click(Sender: TObject);
    procedure SalvarItem(Update: Boolean);
  public
    Posse: TInv_tipo74_posse_class;
    Produto: TInv_tipo74_class;
    Item: TItemInventario;
    { Public declarations }
  end;

var
  frmManutencaoInventarioItem: TfrmManutencaoInventarioItem;

implementation

uses
  uDtmAtivo,
  uDadosIni,
  hw_utils,
  uDataSet_OOP,
  Math,
  StrUtils,
  hw_grid_utils,
  DateUtils,
  MaskUtils,
  hw_progress_utils,
  hw_audit_utils;

procedure ShowManutencaoInventario(Amodal: Boolean);
begin
  if not Assigned(frmManutencaoInventarioItem) then
    Application.CreateForm(TfrmManutencaoInventarioItem, frmManutencaoInventarioItem);

  frmManutencaoInventarioItem.Show;
end;

exports
  ShowManutencaoInventario;

{$R *.dfm}

procedure TfrmManutencaoInventarioItem.btSelectAllClick(Sender: TObject);
begin
  inherited;
  Inventario.Vendas.checkUnCheckAllRows(True);
end;

procedure TfrmManutencaoInventarioItem.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  Inventario.Vendas.checkUnCheckAllRows(False);
end;

procedure TfrmManutencaoInventarioItem.bt_consultaClick(Sender: TObject);
begin
  inherited;

  if not Inventario.Auditor.Processo('PRO363', ed_cons_dataIni.Text +  ' A ' + ed_cons_dataFim.Text, '').
    Visualizar.Permitido then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    try
      grid_consulta.DataSource := Inventario.GetPeriodo(StrToDate(ed_cons_dataIni.Text), StrToDate(ed_cons_dataFim.Text))._dataSourceOOP;
      dbt_data.DataSource      := grid_consulta.DataSource;
      dbt_valor.DataSource     := grid_consulta.DataSource;

      if not Inventario.IsEmpty then
        if (Self.Enabled) and (Self.Visible) and (grid_consulta.CanFocus) then
          grid_consulta.SetFocus;

    except
      on E: exception do
        begin
          ShowErro('Período informado inválido');
        end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventarioItem.bt_vendas_consultaClick(Sender: TObject);
begin
  inherited;

  Screen.Cursor := crHourGlass;
  try

    grid_vendas.DataSource := Inventario.GetVendas(StrToIntDef(ed_terceiro_cod.Text, -1),
                                                   StrToDateDef(ed_vendas_ini.Text, 0),
                                                   StrToDateDef(ed_vendas_fim.Text, 0))._dataSourceOOP;
    DBText1.DataSource := grid_vendas.DataSource;
    DBText2.DataSource := grid_vendas.DataSource;
    DBText3.DataSource := grid_vendas.DataSource;
    DBText4.DataSource := grid_vendas.DataSource;
    DBText5.DataSource := grid_vendas.DataSource;

    if not Inventario.Vendas.IsEmpty then
      if (Self.Enabled) and (Self.Visible) and (grid_vendas.CanFocus) then
        grid_vendas.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventarioItem.bt_vendas_vinc_delClick(Sender: TObject);
begin
  inherited;
  if ShowConfirmacao('Deseja mesmo excluir o item?') <> IDYES then
    Exit;

  if not Inventario.Auditor.Processo('PRO371', Inventario.InvProd_DataAudit, Inventario.InvProd_KeyAudit).
    Excluir.Permitido then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    Inventario.ExcluirItemPelaVenda;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventarioItem.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmManutencaoInventarioItem.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    if Inventario.IncluirItensDaVenda(ck_usar_valor_uni.Checked) then
      page_princ.ActivePage := ts_inventario;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventarioItem.BitBtn4Click(Sender: TObject);
begin
  inherited;
  page_princ.ActivePage := ts_inventario;
end;

procedure TfrmManutencaoInventarioItem.BitBtn5Click(Sender: TObject);
begin
  inherited;
  Inventario.Produtos.Cancel;
end;

procedure TfrmManutencaoInventarioItem.bt_posse_save_insert_Click(
  Sender: TObject);
begin
  SalvarItem(False);
end;

procedure TfrmManutencaoInventarioItem.bt_posse_save_update_Click(
  Sender: TObject);
begin
  SalvarItem(True);
end;

procedure TfrmManutencaoInventarioItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;  
  _GravaConfiguracoesString(ed_cons_dataIni.Name, ed_cons_dataIni.Text);
  _GravaConfiguracoesString(ed_cons_dataFim.Name, ed_cons_dataFim.Text);
  _GravaConfiguracoesString(ed_vendas_ini.Name, ed_vendas_ini.Text);
  _GravaConfiguracoesString(ed_vendas_fim.Name, ed_vendas_fim.Text);
  _GravaConfiguracoesString(ed_terceiro_cod.Name, ed_terceiro_cod.Text);

  if Assigned(csvFile) then
    FreeAndNil(csvFile);  

  FreeAndNil(Inventario);
  Action := caFree;
  frmManutencaoInventarioItem:= nil;
end;

procedure TfrmManutencaoInventarioItem.FormCreate(Sender: TObject);
begin
  inherited;
  Inventario := TManutencaoInventario.Create;
  Inventario.VndPosseScroll := posse_venda_scroll;
end;

procedure TfrmManutencaoInventarioItem.FormShow(Sender: TObject);
begin
  inherited;
  ed_cons_dataIni.Text := _LerConfiguracoesRegistroString(ed_cons_dataIni.Name, ed_cons_dataIni.Text);
  ed_cons_dataFim.Text := _LerConfiguracoesRegistroString(ed_cons_dataFim.Name, ed_cons_dataFim.Text);

  ed_terceiro_nome.Clear;
  ed_terceiro_cod.Clear;
  ed_vendas_ini.Text := _LerConfiguracoesRegistroString(ed_vendas_ini.Name, ed_vendas_ini.Text);
  ed_vendas_fim.Text := _LerConfiguracoesRegistroString(ed_vendas_fim.Name, ed_vendas_fim.Text);
  ed_terceiro_cod.Text := _LerConfiguracoesRegistroString(ed_terceiro_cod.Name, ed_terceiro_cod.Text);
  ed_loc_prod.Clear;

  page_princ.ActivePage    := ts_consulta;
  ts_consulta.TabVisible   := False;
  ts_inventario.TabVisible := False;
  ts_posse.TabVisible      := False;
  ts_terceiros.TabVisible  := False;
  ts_rel_credito.TabVisible:= False;
  page_princ.ActivePage    := ts_consulta;
  pn_posse_vendas.Visible  := False;
  THwHack_DbGrid.Create(grid_vendas);
  if (Self.Enabled) and (Self.Visible) and (ed_cons_dataIni.CanFocus) then
    ed_cons_dataIni.SetFocus;
end;

procedure TfrmManutencaoInventarioItem.lb_mesmo_prodClick(Sender: TObject);
begin
  inherited;
  if Inventario.Produtos.dataSet.Active then
  begin
    Item.grupo_prod    := Inventario.Produtos.fint('grupo_prod');
    Item.cod_prod      := Inventario.Produtos.fstr('cod_prod');
    ed_posse_prod.Text := Inventario.Produtos.fstr('descr_prod');
    lb_mesmo_prod.Visible := False;
  end;
end;

procedure TfrmManutencaoInventarioItem.posse_venda_scroll(Sender: TObject);
begin
  pn_posse_vendas.Visible := Inventario.VndPosse.dataSet.RecordCount > 0;
  if pn_posse_vendas.Visible then
    Splitter1.Top := 0;
end;

procedure TfrmManutencaoInventarioItem.QRSubDetail1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  nota: TNotaRelIcms;
begin
  inherited;

  nota := rel.Notas.Current;

    lbChaveNfe.Caption   := '';
    lbQtdeItemNf.Caption := '';
    lbUnidadeNf.Caption  := '';
    lbFatorNf.Caption    := '';
    lbQtdeUtil.Caption   := '';
    lbValorNf.Caption    := '';
    lbBaseSt.Caption     := '';
    lbRedBase.Caption    := '';
    lbCredito.Caption    := '';
    lbICMS.Caption       := '';

  if Assigned(nota) then
  begin
    lbChaveNfe.Caption   := nota.ChaveNfe;
    lbQtdeItemNf.Caption := StrNumber(nota.QtdeItem, 3);
    lbUnidadeNf.Caption  := nota.UnidadeNf;
    lbFatorNf.Caption    := StrNumber(nota.Fator, 3);
    lbQtdeUtil.Caption   := StrNumber(nota.QtdeUtil, 3);
    lbValorNf.Caption    := StrNumber(nota.Valor);
    lbBaseSt.Caption     := StrNumber(nota.BaseST);
    lbRedBase.Caption    := StrNumber(nota.RedBas);
    lbCredito.Caption    := StrNumber(nota.Credito);
    lbICMS.Caption       := StrNumber(nota.Vicms);

//    'codigo;ncm;cest;undestoque;chavenfe;qtdeitem;unidade;fator;qtdeutil;valor;basest;redbase;credito;vicms',
//    '%s;%s;%s;%s;%s;%f;%s;%f;%f;%f;%f;%f;%f;%f');
    
    csvFile.Add([rel.fstr('grupo_prod') + '-' + rel.fstr('cod_prod'), rel.fstr('ncm'), rel.fstr('cest'), rel.fstr('unidade'),
      nota.ChaveNfe, nota.QtdeItem, nota.UnidadeNf, nota.Fator, nota.QtdeUtil, nota.Valor, nota.BaseST, nota.RedBas, nota.Credito, nota.Vicms ]);
    MoreData := True;
  end;  
    
  rel.Notas.Next();  
end;

procedure TfrmManutencaoInventarioItem.QRSubDetail2NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  inherited;
  if Assigned(rel.Notas) then
  begin
    lbTotValor.Caption      := StrNumber(rel.Notas.TotalMercadorias);
    lbTotBaseSt.Caption     := StrNumber(rel.Notas.TotalBaseST);
    lbTotCreditoST.Caption  := StrNumber(rel.Notas.TotalCreditoCalcST);
    lbTotCredioICMS.Caption := StrNumber(rel.Notas.TotalCreditoCalcICMS);

    lbUnitValor.Caption      := StrNumber(rel.Notas.ValorMercadoriaUnitario);
    lbUnitBaseSt.Caption     := StrNumber(rel.Notas.BaseSTUnitario);
    lbUnitCreditoST.Caption  := StrNumber(rel.Notas.CreditoUnitario);
    lbUnitCredioICMS.Caption := StrNumber(rel.Notas.CreditoICMSUnitario);
  end;
  MoreData := rel.Notas.PrintTotais = 0;
end;

procedure TfrmManutencaoInventarioItem.QuickRep1AfterPreview(Sender: TObject);
begin
  inherited;
  ProgressUtil.Terminate;
  if Assigned(csvFile) then
    FreeAndNil(csvFile);
end;

procedure TfrmManutencaoInventarioItem.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  iCount: Integer;
  filename: string;
begin
  inherited;
  if not Assigned(rel) then
    rel := TRelatorioCreditoStRet.Create;

  iCount := rel.Start(Inventario.fdate('data_inv'));
  
  ProgressUtil.ObjInitProgress(nil)
    .MaxProgress( iCount, 0 )
    .TerminateOnComplete();
//  .MaxSteps( iCount )
//    .ter;  
//  ProgressUtil.TimeOut( 5 );
                                                                            //03.530.75/00001-09
  qrlbEmpresa.Caption := vDadosIni.vEmp.vRazaoSocial + ' - CNPJ: ' + FormatMaskText('00\.000\.00\/000\-00;0;', vDadosIni.vEmp.vCNPJ);
  qrlbEndereco.Caption := vDadosIni.vEmp.vEndereco 
    + IfThen(vDadosIni.vEmp.vNumeroEnd <> '', ', ' + vDadosIni.vEmp.vNumeroEnd)
    + IfThen(vDadosIni.vEmp.vBairro <> '', ', ' + vDadosIni.vEmp.vBairro)
    + IfThen(vDadosIni.vEmp.vCidade <> '', ' - ' + vDadosIni.vEmp.vCidade)
    + IfThen(vDadosIni.vEmp.vCEP <> '', ' CEP: ' + vDadosIni.vEmp.vCEP);
  qrlbParametros.Caption := 'Data inventário: ' + FormatDateTime('dd/MM/yyyy', Inventario.fdate('data_inv'));

  if Assigned(csvFile) then
    FreeAndNil(csvFile);

  filename := ExtractFilePath(Application.ExeName)
    + 'relatorio_credito_inventario_' 
    + FormatDateTime('yyyy_MM_dd', Inventario.fdate('data_inv'))
    + '.csv' ;
    
  csvFile := TCSVWriter.Create(filename,
    'codigo;ncm;cest;undestoque;chavenfe;qtdeitem;unidade;fator;qtdeutil;valor;basest;redbase;credito;vicms',
    '"%s";"%s";"%s";"%s";"%s";%f;"%s";%f;%f;%f;%f;%f;%f;%f');
end;

procedure TfrmManutencaoInventarioItem.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  inherited;

  if not rel.IsEmpty then
  begin
    lbCodMerc.Caption := rel.fstr('grupo_prod') + '-' + rel.fstr('cod_prod');
    lbDescrMerc.Caption := rel.fstr('descr_prod');
    lbCodNcm.Caption := rel.fstr('ncm');
    lbCest.Caption := rel.fstr('cest');
    lbQtdeEstoque.Caption := Format('%0.3n', [rel.ffloat('quantidade')]);
    lbUnidade.Caption := rel.fstr('unidade');
    lbAliqInterna.Caption := Format('%0.2n', [rel.ffloat('aliquota')]);
    rel.StartNotas();
  end;

  rel.Next;

  if rel.Eof then
  begin
    rel.GetMore();
    MoreData := not rel.IsEmpty();
  end
  else
    MoreData := True;

  ProgressUtil.IncProgress;
end;

procedure TfrmManutencaoInventarioItem.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(QuickRep1);  
end;

procedure TfrmManutencaoInventarioItem.rd_posse_0Click(Sender: TObject);
begin
  inherited;
  ed_posse_cod_cliente.Enabled := rd_posse_1.Checked or rd_posse_2.Checked;
  if not ed_posse_cod_cliente.Enabled then
  begin
    ed_posse_cod_cliente.Clear;
    ed_posse_nome.Clear; 
  end;
end;

procedure TfrmManutencaoInventarioItem.ed_loc_prodChange(Sender: TObject);
begin
  inherited;
  if Trim(ed_loc_prod.Text) <> '' then
    Inventario.Produtos.dataSet.Locate('DESCR_PROD', Trim(ed_loc_prod.Text), [loPartialKey]);
end;

procedure TfrmManutencaoInventarioItem.ed_posse_cod_clienteExit(
  Sender: TObject);
begin
  inherited;
  ed_posse_nome.Text := Inventario.NomeCliente(StrToIntDef(TMaskEdit(Sender).Text, 0));
end;

procedure TfrmManutencaoInventarioItem.ed_posse_cod_clienteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and char_length(trim(cpfcgc)) in (11,14)', 'Consulta de Clientes');
    if vDadosIni.vPesquisa <> '' then
      TMaskEdit(Sender).Text := vDadosIni.vPesquisa
  end;
end;

procedure TfrmManutencaoInventarioItem.ed_posse_cod_clienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not ContainsText('0123456789', Key)) and (Key <> #8) then
    Key := #0;
end;

procedure TfrmManutencaoInventarioItem.ed_posse_dataExit(Sender: TObject);
begin
  inherited;
  Item.data_inv := StrToDateDef(ed_posse_data. Text, 0);	
end;

procedure TfrmManutencaoInventarioItem.ed_posse_prodEnter(Sender: TObject);
begin
  inherited;
  if (ed_posse_data.Enabled) then
    ed_posse_prodExit(ed_posse_prod);
end;

procedure TfrmManutencaoInventarioItem.ed_posse_prodExit(Sender: TObject);
begin
  inherited;
  if (ed_posse_prod.Text = '') and (ActiveControl <>  bt_posse_cancel) then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if Trim(vDadosIni.vPesquisa) <> '' then
    begin
      Item.grupo_prod    := StrToInt(vDadosIni.vPesquisaGrupo_prod);
      Item.cod_prod      := vDadosIni.vPesquisaCod_prod;

      ed_posse_prod.Text := Inventario.DescricaoProduto(Item.grupo_prod, Item.cod_prod);
      lb_mesmo_prod.Visible := False;
    end;
  end;
end;

procedure TfrmManutencaoInventarioItem.ed_posse_prodKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if Trim(vDadosIni.vPesquisa) <> '' then
    begin
      Item.grupo_prod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
      Item.cod_prod   := vDadosIni.vPesquisaCod_prod;

      ed_posse_prod.Text := Inventario.DescricaoProduto(Item.grupo_prod, Item.cod_prod);
    end;
  end;
end;
procedure TfrmManutencaoInventarioItem.ed_posse_qtdeExit(Sender: TObject);
begin
  inherited;
  ed_posse_qtde.AsValue := ed_posse_qtde.AsValue;
  if ed_posse_qtde.AsValue > 0 then
    if ed_posse_vl_un.AsValue > 0 then
      ed_posse_vl_tot.AsValue := ed_posse_qtde.AsValue * ed_posse_vl_un.AsValue
    else if ed_posse_vl_tot.AsValue > 0 then
      ed_posse_vl_un.AsValue := ed_posse_vl_tot.AsValue / ed_posse_qtde.AsValue;
end;

procedure TfrmManutencaoInventarioItem.ed_posse_vl_totExit(Sender: TObject);
begin
  inherited;
  ed_posse_vl_tot.AsValue := ed_posse_vl_tot.AsValue;
  if (ed_posse_vl_tot.AsValue > 0) and (ed_posse_qtde.AsValue > 0) then
      ed_posse_vl_un.AsValue := ed_posse_vl_tot.AsValue / ed_posse_qtde.AsValue ;
end;

procedure TfrmManutencaoInventarioItem.ed_posse_vl_unExit(Sender: TObject);
begin
  inherited;
  ed_posse_vl_un.AsValue := ed_posse_vl_un.AsValue;
  if (ed_posse_vl_un.AsValue > 0) and (ed_posse_qtde.AsValue > 0) then
      ed_posse_vl_tot.AsValue := ed_posse_qtde.AsValue * ed_posse_vl_un.AsValue;
end;

procedure TfrmManutencaoInventarioItem.ed_terceiro_codExit(Sender: TObject);
begin
  inherited;
  ed_terceiro_nome.Text := Inventario.NomeCliente(StrToIntDef(TMaskEdit(Sender).Text, 0));
  if (Trim(ed_terceiro_cod.Text) <> '') and (Trim(ed_terceiro_nome.Text) = '') then
    ShowErro('Cliente não encontrado. O cliente deve possuir CNPJ ou CPF');
end;

procedure TfrmManutencaoInventarioItem.SalvarItem(Update: Boolean);
var
  retorno: Boolean;
begin
  if ed_posse_nome.Text = '' then
    if rd_posse_1.Checked or rd_posse_2.Checked then
    begin
      ShowErro('Cliente deve ser informado quando há terceiros envolvidos');
      Exit;
    end;

  if ed_posse_prod.Text = '' then
  begin
    ShowErro('Produto não selecionado');
    Exit;
  end;

  if ed_posse_qtde.AsValue <= 0 then
  begin
    ShowErro('Produto deve ter uma quantidade maior que zero');
    Exit;
  end;

  if ed_posse_vl_un.AsValue <= 0 then
  begin
    ShowErro('Produto deve ter um valor unitário maior que zero');
    Exit;
  end;

  Item.data_inv          := StrToDate(ed_posse_data.Text);
  Item.Posse.ind_prop    := IfThen(rd_posse_1.Checked, 1) + IfThen(rd_posse_2.Checked, 2);
  Item.Posse.cod_cliente := StrToIntDef(ed_posse_cod_cliente.Text, 0);
  Item.Posse.qtde        := ed_posse_qtde.AsValue;
  Item.Posse.valor       := ed_posse_vl_un.AsValue;
  Item.Posse.ativo       := 1;

  Screen.Cursor := crHourGlass;
  try

    if Update then
      retorno := Inventario.UpdateItem(Item)
    else
      retorno := Inventario.InsertItem(Item);

    if retorno then
      TForm(pn_posse.Parent).ModalResult := ID_OK;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventarioItem.SpeedButton1Click(Sender: TObject);
var
  Data, Ini, Fim: TDateTime;
begin
  inherited;
  if not Inventario.Auditor.Processo('PRO364', 'SEM DATA', '').Inserir.Permitido then
    Exit;

  Item := TItemInventario.Create;
  try

    ed_posse_cod_cliente.Clear;
    ed_posse_nome.Clear;
    ed_posse_prod.Clear;
    rd_posse_0.Checked      := True;
    ed_posse_qtde.AsValue   := 0;
    ed_posse_vl_un.AsValue  := 0;
    ed_posse_vl_tot.AsValue := 0;
    ed_posse_data.Clear;
    ed_posse_data.Enabled   := True;
    lb_mesmo_prod.Visible   := False;
    ed_posse_prod.Enabled   := True;
    bt_posse_save.OnClick   := bt_posse_save_insert_Click;

    if vDadosIni.abreForm('Posse do item', pn_posse, opFormsDefCad) then
    begin
      Data := StrToDateDef(ed_posse_data.Text, 0);
      Ini  := StrToDateDef(ed_cons_dataIni.Text, 0);
      Fim  := StrToDateDef(ed_cons_dataFim.Text, 0);
      if (data >=  Ini) and (data <=  Fim) and (Inventario.dataSet.Active) then
        Inventario.dataSet.Refresh
      else
      begin
        ed_cons_dataIni.Text := ed_posse_data.Text;
        ed_cons_dataFim.Text := ed_posse_data.Text;
        bt_consulta.Click;
      end;
    end;
  finally
    FreeAndNil(Item);
  end;
end;

procedure TfrmManutencaoInventarioItem.bt_relatorio_creditoClick(Sender: TObject);
var
  rel: TRelatorioCreditoStRet;
  inicio: TDateTime;
begin
  inherited;
  rel := TRelatorioCreditoStRet.Create();
  try
    QuickRep1.Preview;

  finally
    rel.Free();
  end;
end;

procedure TfrmManutencaoInventarioItem.SummaryBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  lbSumValorRotulo.Caption := '';
  lbSumBaseStRotulo.Caption := '';
  lbSumValor.Caption := '';//StrNumber(rel.SumMercadorias);
  lbSumBaseSt.Caption := '';//StrNumber(rel.SumBaseST);
  lbSumCreditoST.Caption := StrNumber(rel.SumCreditoST);
  lbSumCredioICMS.Caption := StrNumber(rel.SumCreditoICMS);
end;

procedure TfrmManutencaoInventarioItem.bt_consulta_alterarClick(Sender: TObject);
begin
  inherited;
  if Inventario.dataSet.IsEmpty then
    Exit;

  if not Inventario.Auditor.Processo('PRO365', Inventario.Inv_DataAudit, Inventario.Inv_KeyAudit).
    Visualizar.Permitido then
    Exit;

  Screen.Cursor := crHourGlass;
  try

    grid_inventario.DataSource := Inventario.GetProdutos()._dataSourceOOP;
    grid_posse_vendas.DataSource := Inventario.VndPosse._dataSourceOOP;
    page_princ.ActivePage := ts_inventario;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventarioItem.bt_prod_add_vendasClick(Sender: TObject);
begin
  inherited;

  if not Inventario.Auditor.Processo('PRO369', Inventario.Inv_DataAudit, Inventario.InvProd_KeyAudit).
    Visualizar.Permitido then
    Exit;

  Inventario.Vendas.Close;
  
  page_princ.ActivePage := ts_terceiros;
end;

procedure TfrmManutencaoInventarioItem.bt_prod_voltarClick(Sender: TObject);
begin
  inherited;
  page_princ.ActivePage := ts_consulta;
  Inventario.Produtos.Close;
end;

procedure TfrmManutencaoInventarioItem.grid_consultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    bt_consulta_alterarClick(Sender)
  else if Key = VK_INSERT then
  	SpeedButton1Click(Sender);
end;

procedure TfrmManutencaoInventarioItem.grid_consultaTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(grid_consulta, Column);
end;

procedure TfrmManutencaoInventarioItem.grid_inventarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    bt_prod_editClick(Sender)
  else if Key = VK_DELETE then
  	bt_prod_delClick(Sender)
  else if Key = VK_INSERT then
  	bt_prod_addClick(Sender);
end;

procedure TfrmManutencaoInventarioItem.grid_inventarioTitleClick(
  Column: TColumn);
begin
  inherited;
	vDadosIni.DBGridOnTitleClick(grid_inventario, Column);
end;

procedure TfrmManutencaoInventarioItem.grid_vendasColEnter(Sender: TObject);
begin
  inherited;
  if grid_vendas.SelectedField.FieldName = 'QTDE_USAR' then
  begin
    grid_vendas.Options := grid_vendas.Options + [dgEditing];
    grid_vendas.DataSource.AutoEdit := True;
  end;
end;

procedure TfrmManutencaoInventarioItem.grid_vendasColExit(Sender: TObject);
begin
  inherited;
  if grid_vendas.SelectedField.FieldName = 'QTDE_USAR' then
  begin
    grid_vendas.Options := grid_vendas.Options - [dgEditing];
    grid_vendas.DataSource.AutoEdit := False;
  end;
end;

procedure TfrmManutencaoInventarioItem.grid_vendasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Agrid: TDBGrid;  
begin
  inherited;

  Agrid := TDBGrid(Sender);

  if (Column.FieldName = 'QTDE_USAR') then
  begin
      Agrid.Canvas.Brush.Color := clInfoBk;
      Agrid.Canvas.Font.Color  := clWindowText;
  end;
  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmManutencaoInventarioItem.grid_vendasTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(grid_vendas, Column);
end;

procedure TfrmManutencaoInventarioItem.bt_prod_addClick(Sender: TObject);
var
  ShowProduto: Boolean;
  Id: Integer;
begin
  inherited;
  if not Inventario.Auditor.Processo('PRO364', Inventario.Inv_DataAudit, Inventario.Inv_KeyAudit).
    Inserir.Permitido then
    Exit;

  Item := TItemInventario.Create;
  try
    Item.data_inv           := Inventario.fdatet('data_inv');

    ed_posse_cod_cliente.Clear;
    ed_posse_nome.Clear;
    ed_posse_prod.Clear;
    rd_posse_0.Checked      := True;
    ed_posse_qtde.AsValue   := 0;
    ed_posse_vl_un.AsValue  := 0;
    ed_posse_vl_tot.AsValue := 0;
    ed_posse_data.Text      := Inventario.fstr('data_inv');
    ed_posse_data.Enabled   := False;
    lb_mesmo_prod.Visible   := not Inventario.Produtos.dataSet.IsEmpty;
    lb_mesmo_prod.Caption   := 'Selecionar o produto ' + Inventario.Produtos.fstr('descr_prod') + '?';
    ed_posse_prod.Enabled   := True;
    bt_posse_save.OnClick   := bt_posse_save_insert_Click;

    if vDadosIni.abreForm('Posse do item', pn_posse, opFormsDefCad) then
      Inventario.Produtos.dataSet.Refresh;
  finally
    FreeAndNil(Item);
  end;
end;

procedure TfrmManutencaoInventarioItem.bt_prod_editClick(Sender: TObject);
begin
  inherited;
  if not Inventario.Auditor.Processo('PRO366', Inventario.InvProd_DataAudit, Inventario.InvProd_KeyAudit).
    Alterar.Permitido then
    Exit;

  Item := TItemInventario.Create;
  try

    Item.CopyFrom(Inventario.Produtos.dataSet);
    Item.Posse.CopyFrom(Inventario.Produtos.dataSet);
    Item.id       := Inventario.Produtos.fint('inv_id');
    Item.Posse.id := Inventario.Produtos.fint('posse_id');

    ed_posse_cod_cliente.Text := Inventario.Produtos.fstr('cod_cliente');
    ed_posse_nome.Text        := Inventario.NomeCliente(Inventario.Produtos.fint('cod_cliente'));
    ed_posse_prod.Text        := Inventario.Produtos.fstr('descr_prod');
    rd_posse_0.Checked        := Inventario.Produtos.fequals('ind_prop', '0');
    rd_posse_1.Checked        := Inventario.Produtos.fequals('ind_prop', '1');
    rd_posse_2.Checked        := Inventario.Produtos.fequals('ind_prop', '2');
    ed_posse_qtde.AsValue     := Inventario.Produtos.ffloat('quantidade');
    ed_posse_vl_un.AsValue    := Inventario.Produtos.ffloat('valor_prod');
    ed_posse_vl_tot.AsValue   := Inventario.Produtos.ffloat('valor');
    ed_posse_data.Text        := Inventario.fstr('data_inv');
    ed_posse_data.Enabled     := False;
    lb_mesmo_prod.Visible     := False;
    ed_posse_prod.Enabled     := False;
    bt_posse_save.OnClick     := bt_posse_save_update_Click;

    if vDadosIni.abreForm('Posse do item', pn_posse, opFormsDefCad) then
      Inventario.Produtos.dataSet.Refresh;
  finally
    FreeAndNil(Item);
  end;
end;

procedure TfrmManutencaoInventarioItem.bt_prod_delClick(Sender: TObject);
begin
  inherited;
  if ShowConfirmacao('Deseja mesmo excluir o item?') <> IDYES then
    Exit;

  if not Inventario.Auditor.Processo('PRO367', Inventario.InvProd_DataAudit, Inventario.InvProd_KeyAudit).
    Excluir.Permitido then
    Exit;

  Screen.Cursor := crHourGlass;
  Item := TItemInventario.Create;
  try
    Item.CopyFrom(Inventario.Produtos.dataSet);
    Item.Posse.CopyFrom(Inventario.Produtos.dataSet);
    Item.id       := Inventario.Produtos.fint('inv_id');
    Item.Posse.id := Inventario.Produtos.fint('posse_id');

    if Inventario.ExcluirItem(Item) then
      if Inventario.Produtos.dataSet.IsEmpty then
      begin
        bt_prod_voltar.Click;
        Inventario.dataSet.Refresh;;
      end;
  finally
    FreeAndNil(Item);
    Screen.Cursor := crDefault;
  end;
end;

end.
