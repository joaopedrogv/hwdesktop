unit uCadNF_Copiador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, uClassesNotasFiscais, StdCtrls, Buttons, Grids, DBGrids,
  ExtCtrls, uDataSet_OOP, DB, hw_icopia_nf, ComCtrls, DBClient, Mask, DBCtrls,
  hw_copia_nf_models, FilterFR, CheckUncheckFR, Menus;

type

  TipoNfContinue = (tnfNova, tnfColarOutra, tnfColarNaAtual);
  CopiadorOperacao = (coNaoDefinida, coNormal, coDevolucao, coMultEmpresa);

  TNewCopyPropsCustom = class(TNewCopyProps)
  private
    FContinueAs: TipoNfContinue;
    FnotaFiscalId: Integer;
  public
    property ContinueAs: TipoNfContinue read FContinueAs write FContinueAs;
    property notaFiscalId: Integer read FnotaFiscalId write FnotaFiscalId; 
  end;

  TItensNotaClipBoard = class(TNFItemBase)
  public
    constructor Create(dtsOOP: TDataSet_OOP; componentName: string);
  end;

  TNFSDts = class(TDataSet_OOP)
    constructor Create(ANota: TNFCab);
  end;

  TClipboardDts = class(TItensNotaClipBoard)
  strict private
    FOperacao: CopiadorOperacao;
    Nota: TNFCab;
    FNfs: TDataSet_OOP;
    FItensNF: TItensNotaClipBoard;
    TimerAfterScrool: TTimer;
    procedure TimerAfterScroolTimer(Sender: TObject);    
    procedure AfterScrollNfs(DataSet: TDataSet);
  private
    //FTransfs: TDataSet_OOP;
    procedure SetOperacao(const Value: CopiadorOperacao);
  public
    constructor Create(ANota: TNFCab);
    destructor Destroy; override;

    procedure AddSelecaoNF(values: ArrayInts);
    procedure UpdateDataSet;
    procedure AbrirItensNf;
    procedure SetEnabledAfterScroll(const setEnable: Boolean);

    property Nfs: TDataSet_OOP read FNfs write FNfs;
    property ItensNF: TItensNotaClipBoard read FItensNF write FItensNF;
    //property Transfs: TDataSet_OOP read FTransfs write fTransfs;
    property Operacao: CopiadorOperacao read FOperacao write SetOperacao; 
  end;

  TGridHack = class(TCustomDBGrid);

  TfrmCadNFCopiador = class(TfrmPadrao)
    page: TPageControl;
    tsNotas: TTabSheet;
    tsColar: TTabSheet;
    pnContainerNotas: TPanel;
    SplitteItensNfAndClipboard: TSplitter;
    SplitterNotaAndItensNF: TSplitter;
    Label2: TLabel;
    pnNotasSel: TPanel;
    Label1: TLabel;
    gridNfs: TDBGrid;
    gridItensNF: TDBGrid;
    pnClipBoardNotasSel: TPanel;
    lbAreaTransf: TLabel;
    gridClipBoard: TDBGrid;
    pnClipBoardNotasSelBtns: TPanel;
    SpeedButton8: TSpeedButton;
    btnContinuarParaColar: TSpeedButton;
    Panel9: TPanel;
    pnClipBoardFinal: TPanel;
    lbAreaTransf2: TLabel;
    pnClipBoardColarBtns: TPanel;
    SpeedButton6: TSpeedButton;
    tabNota: TTabControl;
    Panel3: TPanel;
    lbMessage: TLabel;
    btnVoltar: TBitBtn;
    Data: TLabel;
    edData: TMaskEdit;
    edNumero: TMaskEdit;
    Label5: TLabel;
    edDest: TMaskEdit;
    Label6: TLabel;
    btnProcuraNF: TSpeedButton;
    btnProcuraCliente: TSpeedButton;
    btnColarNaNF: TBitBtn;
    btnCriarNF: TBitBtn;
    SpeedButton5: TSpeedButton;
    SpeedButton7: TSpeedButton;
    btnDevolucao: TSpeedButton;
    cbTipoOp: TComboBox;
    Label3: TLabel;
    btHandleTipoOperacao: TSpeedButton;
    Splitter4: TSplitter;
    tsConsulta: TTabSheet;
    pnFiltros: TPanel;
    Label7: TLabel;
    edEmpresa: TComboBox;
    Panel10: TPanel;
    FilterFrame1: TFilterFrame;
    Splitter3: TSplitter;
    Splitter5: TSplitter;
    Panel12: TPanel;
    btProcurarNotas: TBitBtn;
    pnItensNFTop: TPanel;
    btItNfCollapse: TSpeedButton;
    Panel4: TPanel;
    btItNfExpand: TSpeedButton;
    pnNotasSelTop: TPanel;
    Panel1: TPanel;
    btNotasSelExpand: TSpeedButton;
    btNotasSelColapse: TSpeedButton;
    pnClipBoardNotasSelTop: TPanel;
    Panel5: TPanel;
    btClipboardExpand: TSpeedButton;
    btClipboardCollapse: TSpeedButton;
    pnItensNota: TPanel;
    CheckUncheckHrFrameNota: TCheckUncheckFrame;
    btnSelecionarCabecalhoNF: TSpeedButton;
    CheckUncheckHrFramItensNota: TCheckUncheckFrame;
    btnColarItensToClipboard: TSpeedButton;
    btnColarNotasSel: TSpeedButton;
    Panel2: TPanel;
    Panel6: TPanel;
    btMoreEmp: TSpeedButton;
    SpeedButton3: TSpeedButton;
    popMenuEmpresa: TPopupMenu;
    btnCancelCopyNFs: TSpeedButton;
    Criarnotadetransfernciacomaseleoabaixo1: TMenuItem;
    ckAgruparProdutos: TCheckBox;
    ckManterTributos: TCheckBox;
    ckReferenciarItens: TCheckBox;
    procedure ckManterTributosClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure cbTipoOpChange(Sender: TObject);
    procedure btnCancelCopyNFsClick(Sender: TObject);
    procedure Criarnotadetransfernciacomaseleoabaixo1Click(Sender: TObject);
    procedure btMoreEmpClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnColarNotasSelClick(Sender: TObject);
    procedure btClipboardExpandClick(Sender: TObject);
    procedure btClipboardCollapseClick(Sender: TObject);
    procedure btNotasSelExpandClick(Sender: TObject);
    procedure btNotasSelColapseClick(Sender: TObject);
    procedure btItNfExpandClick(Sender: TObject);
    procedure btItNfCollapseClick(Sender: TObject);
    procedure edEmpresaChange(Sender: TObject);
    procedure btProcurarNotasClick(Sender: TObject);
    procedure btHandleTipoOperacaoClick(Sender: TObject);
    procedure btnDevolucaoClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btnProcuraClienteClick(Sender: TObject);
    procedure btnProcuraNFClick(Sender: TObject);
    procedure btnColarNaNFClick(Sender: TObject);
    procedure tabNotaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnContinuarParaColarClick(Sender: TObject);
    procedure btnSelecionarCabecalhoNFClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure btnColarItensToClipboardClick(Sender: TObject);
    procedure gridItensNFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridItensNFColExit(Sender: TObject);
    procedure gridItensNFColEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  strict private
    currentNaturazaNF: string;
    procedure Log(const value: string);
    function ContinuarComNotaFiscal(props: TNewCopyPropsCustom): Boolean;
    procedure HandleOrderPanels;
    procedure ToggleControls(const setEnabled: Boolean);
    procedure StoreClipBoardAndClear;
    procedure RestoreClipBoard;
    procedure UpdateCountLabelsAreaTransf;
  private
    FNota: TNFCab;
    rescueClipBoard: IClipBoardCopiador;
    finalidadeDadosLK: TDadosLookUp_OOP;
    clipboardNf:  IClipBoardCopiador;
    clipboardDts: TClipboardDts;
    timerCaption: TTimer;
    procedure SetNota(const Value: TNFCab);
    procedure ShowMsgCaption(const value: string);
    procedure TimerCaptionEvent(Sender: TObject);
  public
    procedure HandleSelecaoNotas;
    procedure HandleDevolucao;
    procedure OnlyShowClipBoard;
    procedure HandleConsultaMultiEmpresa;
    property Nota: TNFCab read FNota write SetNota;
  end;

var
  frmCadNFCopiador: TfrmCadNFCopiador;

implementation

uses
  StrUtils, Math, uDtmAtivo, hw_confirmacao, hw_utils, hw_copia_nf, hw_grid_utils,
  hw_win_utils, hw_const_types, nf_item_class, uClassesNotasFiscais_consts,
  uDadosIni, Query_OOP, nf_class, empresa_model, Contnrs, hw_filters, Types_OOP,
  DateUtils, TipoComunsUnit, SituacaoNFeEnumUnit;
//  DBClient;

{$R *.dfm}

{ TClipboardDts }

procedure TClipboardDts.AbrirItensNf;
begin
  FItensNF
    .ClientOpen('select * from notafiscal_item where cod_nf = %d and cod_empresa = %d order by nitem',
      [Nfs.fint('cod_nf'), Nfs.fint('cod_empresa')]);
end;

procedure TClipboardDts.AddSelecaoNF(values: ArrayInts);
var
  I: Integer;
begin
  SetEnabledAfterScroll(False);
  try
    Nfs.dataSet.EmptyDataSet;

    for I := Low(values) to High(values) do
    begin
      queryCons.Table('notafiscal', '*')
        .Equals('cod_nf', values[I])
        .Equals('cod_empresa', vDadosIni.cod_empresa)
        .OrderBy('num_nf')
        .Open;

      if not queryCons.IsEmpty then
      begin
        Nfs.dataSet.Insert;
        Nfs.dataSet.CopyFields(queryCons.query);
        Nfs.dataSet.Post;
      end;
    end;

    Nfs.First;
    AbrirItensNf();

  finally
    Self.RollBackTransacao;
    SetEnabledAfterScroll(True);
  end;
end;

procedure TClipboardDts.AfterScrollNfs(DataSet: TDataSet);
begin
  TimerAfterScrool.Enabled := False;
  TimerAfterScrool.Enabled := True;
//  FItensNF
//    .ClientOpen('select * from notafiscal_item where cod_nf = %d and cod_empresa = %d order by nitem',
//      [Nfs.fint('cod_nf'), Nfs.fint('cod_empresa')]);
end;

constructor TClipboardDts.Create(ANota: TNFCab);
var
  I: Integer;
  Field: TField;
  isNewCdsSelf, isNewCdsItens, isNewCdsNF: Boolean;
begin
  Nota := ANota;
  FOperacao := coNaoDefinida;

  I := vDadosIni.dbComponents.dbClients.Count;

  inherited Create(Nota, 'cds_clipboard');

  isNewCdsSelf := vDadosIni.dbComponents.dbClients.Count > I;

  TimerAfterScrool := TTimer.Create(nil);
  TimerAfterScrool.Enabled := False;
  TimerAfterScrool.Interval := 50;
  TimerAfterScrool.OnTimer := TimerAfterScroolTimer;

  I := vDadosIni.dbComponents.dbClients.Count;
  FNfs := TDataSet_OOP.Create(Nota.buscas.Database, nil, True, 'cds_nfcopy');
  isNewCdsNF := vDadosIni.dbComponents.dbClients.Count > I;

//  FNfs := TNFSDts.Create(Nota);
  I := vDadosIni.dbComponents.dbClients.Count;
  FItensNF := TItensNotaClipBoard.Create(Nota, 'cds_itensnfcopy');
  isNewCdsItens := vDadosIni.dbComponents.dbClients.Count > I;
//  FTransfs := TDataSet_OOP.Create(Nota.buscas.Database, nil, True, 'cds_nftransfs');

  SetEnabledAfterScroll(True);// FNfs.dataSet.AfterScroll := AfterScrollNfs;

  if isNewCdsSelf then
    CloneDataSetProps(Nota.vItem);//, [fkInternalCalc]);

  if isNewCdsItens then
    FItensNF.CloneDataSetProps(Nota.vItem);//, [fkInternalCalc]);

  if isNewCdsNF then
    FNfs.CloneDataSetProps(Nota);//, [fkInternalCalc]);
  //FTransfs.CloneDataSetProps(Nota);

  if isNewCdsItens then
    FItensNF.AddFieldInternalCalc('QTDE_SEL', ftFloat)
      .ffDisplayLabel('QTDE_SEL', 'Qtde Sel')
      .ffDisplayFormat('QTDE_SEL', TFloatField(FItensNF.dataSet.FieldByName('QVND')).DisplayFormat);
  {
  FNfs.dataSet.ProviderName := '';
  FNfs.dataSet.CreateDataSet;
  }

  if isNewCdsSelf then
  begin
    Self.dataSet.ProviderName := '';
    Self.AddFieldInternalCalc('NF_STR', ftString, 48).ffDisplayLabel('NF_STR', 'Nota [Data - Nº - E/S - Emp]');
    Self.dataSet.CreateDataSet;
  end;

  FNfs._dataSourceOOP.AutoEdit := False; // ?
//  FTransfs._dataSourceOOP.AutoEdit := False;

  Self.IndexFieldNames := 'NF_STR;NITEM';
  FItensNF.IndexFieldNames := 'NITEM';

//  FTransfs.SQLMaker.Build(
//    Nota.SQLMaker.TableName,
//    Nota.SQLMaker.AliasTbSql,
//    Nota.SQLMaker.FieldsSql,
//    Nota.SQLMaker.JoinSql,
//    Nota.SQLMaker.WhereSql,
//    Nota.SQLMaker.OrderSql);
end;

procedure TfrmCadNFCopiador.HandleConsultaMultiEmpresa;
var
  empresas: TEmpresaList;
  emp: TEmpresaModel;
  I, idxEmpLogada, idEmpLast: Integer;
begin
  clipboardDts.Operacao := coMultEmpresa;

  pnFiltros.Parent := pnContainerNotas;
  pnFiltros.Top := -999;

  page.ActivePage := tsNotas;
  gridNfs.Parent := pnNotasSel;
  gridClipBoard.Parent := pnClipBoardNotasSel;

  Nota.queryCons.Table('empresa', 'cod_empresa, cgc_emp, identificacao_emp')
    .OrderBy('cod_empresa')
    .Open;

  idEmpLast := RegistroWin.Read(Self.Name, TEmpresaList.ClassName, vDadosIni.cod_empresa);
//  idxEmpLogada := -1;
  edEmpresa.ItemIndex := -1;
  empresas := TEmpresaList.Create(False);
  try
    empresas.CopyFrom(TEmpresaModel, Nota.queryCons.query, False);
    edEmpresa.Clear;
    for I := 0 to empresas.Count - 1 do
    begin
      edEmpresa.AddItem(Format('%d - %s - %s', [empresas.Items[I].cod_empresa, empresas.Items[I].cgc_emp, empresas.Items[I].identificacao_emp]),
        empresas.Items[I]);

      if (edEmpresa.ItemIndex = -1) and  (empresas.Items[I].cod_empresa = vDadosIni.cod_empresa) then // Assume a empresa atual caso não tenha selecionado nenhuma ainda
        edEmpresa.ItemIndex := I;

      // Caso queira ficar a ultima seleção descomentar abaixo
      //if empresas.Items[I].cod_empresa = idEmpLast then // Sempre assume a ultima empresa selecionada
      //  edEmpresa.ItemIndex := I;

    end;
  finally
    FreeAndNil(empresas);
  end;

  THwHack_DbGrid.Create(gridNfs);

  edEmpresa.ItemIndex := IfThen(edEmpresa.ItemIndex >= 0, edEmpresa.ItemIndex);

  if edEmpresa.ItemIndex >= 0 then
  begin
    emp := (edEmpresa.Items.Objects[edEmpresa.ItemIndex] as TEmpresaModel);
    btMoreEmp.Enabled := emp.cod_empresa <> vDadosIni.cod_empresa;
  end;

  btnContinuarParaColar.Visible := (clipboardNf.Prods.Count > 0) and (Self.Caption <> 'Devolução de mercadorias');
  btnDevolucao.Visible          := (clipboardNf.Prods.Count > 0) and (Self.Caption = 'Devolução de mercadorias');
  pnNotasSel.Height := Trunc((pnContainerNotas.Height + IfThen(pnFiltros.Parent = pnContainerNotas, 0 - pnFiltros.Height) -
                              SplitterNotaAndItensNF.Height - SplitteItensNfAndClipboard.Height) / 3);
  pnItensNota.Height := pnNotasSel.Height;

  clipboardDts.UpdateDataSet;

  tabNotaChange(tabNota);

  Self.Caption := 'Área de transferência - Cópias de Notas Fiscais consulta por empresa';
  Label1.Caption := 'Notas fiscais da consulta';
  UpdateCountLabelsAreaTransf();
end;

procedure TfrmCadNFCopiador.HandleDevolucao;
var
  I: Integer;
  prod: TNFProd;
begin
  clipboardDts.Operacao := coDevolucao;
  {
  rescueClipBoard := TClipBoardCopiador.New();
  rescueClipBoard.Nota.CopyFrom(clipboardNf.Nota);
  for I := 0 to clipboardNf.Prods.Count - 1 do
  begin
    prod := rescueClipBoard.Prods.New;
    prod.CopyFrom(clipboardNf.Prods.Items[I]);
  end;

  clipboardNf.Prods.Clear;
  }

  StoreClipBoardAndClear;

  HandleSelecaoNotas;

  Self.Caption := 'Devolução de mercadorias';
  UpdateCountLabelsAreaTransf();
end;

procedure TfrmCadNFCopiador.HandleOrderPanels;
var
  frsPn: TPanel;
begin
  pnNotasSel.Top := IfThen(pnFiltros.Parent = pnContainerNotas, pnFiltros.Top + pnFiltros.Height);
  SplitterNotaAndItensNF.Top := pnNotasSel.Top + pnNotasSel.Height;
  pnItensNota.Top := SplitterNotaAndItensNF.Top + SplitterNotaAndItensNF.Height;
  SplitteItensNfAndClipboard.Top := pnItensNota.Top + pnItensNota.Height;
  pnClipBoardNotasSel.Top := SplitteItensNfAndClipboard.Top + SplitteItensNfAndClipboard.Height;

  if ((pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height) > pnContainerNotas.Height) or
    ((pnClipBoardNotasSel.Align = alClient) and (pnClipBoardNotasSel.Height < 70)) then
  begin
    if pnNotasSel.Height > Trunc(pnContainerNotas.Height / 3) then
      pnNotasSel.Height := Trunc(pnContainerNotas.Height / 3);

    if pnItensNota.Height > Trunc(pnContainerNotas.Height / 3) then
      pnItensNota.Height := Trunc(pnContainerNotas.Height / 3);
  end;
  
end;

procedure TfrmCadNFCopiador.HandleSelecaoNotas;
begin
  clipboardDts.Operacao := coNormal;
//  tsNotas.TabVisible := False;
//  tsColar.TabVisible := False;
  page.ActivePage := tsNotas;

  gridNfs.Parent := pnNotasSel;
  gridClipBoard.Parent := pnClipBoardNotasSel;
  clipboardDts.AddSelecaoNF(Nota.GetArrayInts('cod_nf', True, True));
  clipboardDts.UpdateDataSet;

  btnContinuarParaColar.Visible := (clipboardNf.Prods.Count > 0) and (Self.Caption <> 'Devolução de mercadorias');
  btnDevolucao.Visible          := (clipboardNf.Prods.Count > 0) and (Self.Caption = 'Devolução de mercadorias');

  Self.Caption := 'Área de transferência - Cópias de Notas Fiscais';
  UpdateCountLabelsAreaTransf();

//  clipboardDts.Nfs.dataSet.CreateDataSet;
//  clipboardDts.Nfs.dataSet.Insert;
//  clipboardDts.Nfs.dataSet.CopyFields(FNota.dataSet);
//  clipboardDts.Nfs.dataSet.Post;
end;

procedure TfrmCadNFCopiador.Log(const value: string);
begin
//  LogApp.Log('teste', value);
end;

procedure TfrmCadNFCopiador.OnlyShowClipBoard;
begin
  clipboardDts.Operacao := coNormal;

  if Nota.CopiadorNF.ClipBoardNF.Nota.cod_empresa = vDadosIni.cod_empresa then
    btnProcuraCliente.Tag := Nota.CopiadorNF.ClipBoardNF.Nota.cod_cliente
  else
    btnProcuraCliente.Tag := Nota.queryCons.Table('clientes', 'cod_cliente')
      .Equals('cpfcgc', Nota.CopiadorNF.ClipBoardNF.Nota.cpfcgc)
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .Scalar.AsInteger;

  page.ActivePage := tsColar;
  gridClipBoard.Parent := pnClipBoardFinal;
  clipboardDts.UpdateDataSet;
  tabNotaChange(tabNota);

  Self.Caption := 'Área de transferência - Cópias de Notas Fiscais';
  UpdateCountLabelsAreaTransf();
end;

procedure TfrmCadNFCopiador.RestoreClipBoard;
var
  I: Integer;
  prod: TNFProd;
begin
  if Assigned(rescueClipBoard) and (rescueClipBoard.Prods.Count > 0) then
  begin
    clipboardNf.Nota.CopyFrom(rescueClipBoard.Nota);
    clipboardNf.Prods.Clear;
    for I := 0 to rescueClipBoard.Prods.Count - 1 do
    begin
      prod := clipboardNf.Prods.New;
      prod.CopyFrom(rescueClipBoard.Prods.Items[I]);
    end;
  end;
end;

procedure TfrmCadNFCopiador.FormClose(Sender: TObject;
  var Action: TCloseAction);
//var
//  I: Integer;
//  prod: TNFProd;
begin
  inherited;
  {
  if Assigned(rescueClipBoard) then
  begin
    clipboardNf.Nota.CopyFrom(rescueClipBoard.Nota);
    clipboardNf.Prods.Clear;
    for I := 0 to rescueClipBoard.Prods.Count - 1 do
    begin
      prod := clipboardNf.Prods.New;
      prod.CopyFrom(rescueClipBoard.Prods.Items[I]);
    end;
  end;
  }

  RestoreClipBoard;

  clipboardDts.Free;
  finalidadeDadosLK.Free;
  Action := caFree;
  frmCadNFCopiador := nil;
end;

procedure TfrmCadNFCopiador.FormCreate(Sender: TObject);
begin
  inherited;
  Log('criou');
  timerCaption := TTimer.Create(Self);
  timerCaption.OnTimer := TimerCaptionEvent;
  timerCaption.Interval := 2000;
  Log('criou fim');
end;

procedure TfrmCadNFCopiador.gridItensNFColEnter(Sender: TObject);
begin
  inherited;
  if MatchText(gridItensNF.SelectedField.FieldName, ['QTDE_SEL']) then
  begin
    gridItensNF.Options := gridItensNF.Options + [dgEditing];
    gridItensNF.DataSource.AutoEdit := True;
  end;
end;

procedure TfrmCadNFCopiador.gridItensNFColExit(Sender: TObject);
begin
  inherited;
  if MatchText(gridItensNF.SelectedField.FieldName, ['QTDE_SEL']) then
  begin
    gridItensNF.Options := gridItensNF.Options - [dgEditing];
    gridItensNF.DataSource.AutoEdit := False;
  end;
end; 
 
function RetIdxUltimaColVisivel(DBGrid: TDBGrid): integer;
var
  x: integer;
begin
  Result := -1;
 
  for x := DBGrid.Columns.Count-1 downto 0 do
    if  DBGrid.Columns.Items[x].Visible then
    begin
      Result := x;
      Break;
    end;
end;

function NaoInsereDBGrid(DBGrid: TDBGrid; DataSet: TDataSet; Key: Word): Word;
begin
  { Não deixa inserir registros no DBGrid caso:
    1- estiver em modo de edição: E
    1.1- se clicar na tecla "Insert"; OU
    1.2- se clicar na tecla "Seta para baixo" E estiver no último registro; OU
    1.2- se clicar na tecla "Tab" E estiver no último registro E estiver na
         última coluna visível. }
  Result := Key;
  if dgEditing in DBGrid.Options then
    if ( Key = VK_INSERT ) or
       ((Key = VK_DOWN) and (DataSet.RecNo = DataSet.RecordCount) ) then
      Result := 0
    else if ( Key = VK_TAB ) and ( DataSet.RecNo = DataSet.RecordCount ) then
    begin
      if ( DBGrid.SelectedIndex = RetIdxUltimaColVisivel(DBGrid) ) then
        Result := 0;
    end;
end;

procedure TfrmCadNFCopiador.gridItensNFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if Key = VK_DOWN then
//  begin
//    if gridItensNF.DataSource.DataSet.RecNo = gridItensNF.DataSource.DataSet.re then
//
//  end;
  if Key = VK_DELETE then
    Key := VK_NONAME;

  Key := NaoInsereDBGrid( TDBGrid(Sender), TDBGrid(Sender).DataSource.DataSet, Key );
end;

procedure TfrmCadNFCopiador.SetNota(const Value: TNFCab);
var
  I:  Integer;
begin
  Log('show 1');
  tsNotas.TabVisible := False;
  tsColar.TabVisible := False;
  tsConsulta.TabVisible := False;
  tabNota.Height := 78;

  Log('show 2');
  FNota := Value;

  Log('show 3');
  clipboardNf := FNota.CopiadorNF.ClipBoardNF;
  clipboardDts := TClipboardDts.Create(FNota);
  finalidadeDadosLK := TDadosLookUp_OOP.create;

  Log('show 4');
  gridNfs.DataSource       := clipboardDts.Nfs._dataSourceOOP;
  gridItensNF.DataSource   := clipboardDts.ItensNF._dataSourceOOP;
  gridClipBoard.DataSource := clipboardDts._dataSourceOOP;
  //gridNotasEmp.DataSource  := clipboardDts.Transfs._dataSourceOOP;

  Log('show 5');

  GridHandlerSingleton.GetInstance().Configure(gridNfs, FNota.dataSet.Name);
  //GridHandlerSingleton.GetInstance().Configure(gridNotasEmp, FNota.dataSet.Name);

  Log('show 6');

  GridHandlerSingleton.GetInstance()
    .Visibility('SEL;QTDE_SEL;NITEM')
    .Position('SEL;NITEM;QTDE_SEL;QUANTIDADE', 0)
    .SchemaBase(FNota.vItem.dataSet.Name)
    .Configure(gridItensNF, '@clpbrdnfitemsel', False);

  Log('show 7');
  GridHandlerSingleton.GetInstance()
    .Visibility('NF_STR')
    .Position('NF_STR', 0)
    .SchemaBase(FNota.vItem.dataSet.Name)
    .Configure(gridClipBoard, '@clpbrdnfitem', False);

  Log('show 8');
  THwHack_DbGrid.Create(gridItensNF);

  CheckUncheckHrFrameNota.FillForm(clipboardDts.Nfs);
  CheckUncheckHrFramItensNota.FillForm(clipboardDts.ItensNF);
end;

procedure TfrmCadNFCopiador.ShowMsgCaption(const value: string);
begin
  if not Assigned(timerCaption) then
  begin
    timerCaption := TTimer.Create(Self);
    timerCaption.Interval := 2000;
    timerCaption.OnTimer := TimerCaptionEvent;
  end;
  lbMessage.Caption := value;
  lbMessage.Visible := True;
  if lbMessage.Visible then
    lbMessage.Repaint;
  timerCaption.Enabled := True;
end;

procedure TfrmCadNFCopiador.btnSelecionarCabecalhoNFClick(Sender: TObject);
begin
  inherited;

  if clipboardNf.Prods.Count = 0 then
  begin
    ShowMsgCaption('Copie os itens para área de transferência primeiro');
    Exit;  
  end;  
    
  clipboardNf.Nota.CopyFrom(clipboardDts.Nfs.DataSet, False);
  ShowMsgCaption('Cabeçalho/destinatário foi selecionado');
end;

procedure TfrmCadNFCopiador.btnCancelCopyNFsClick(Sender: TObject);
begin
  inherited;
  if ShowConfirmacao('Deseja mesmo interromper a cópia das notas fiscais?') <> IDYES then
    Exit;

  btnCancelCopyNFs.Visible := False;
end;

procedure TfrmCadNFCopiador.btnColarItensToClipboardClick(Sender: TObject);
var
  item: IClipBoardItem;
  alreadyAsked, copyAnyWay, addItem: Boolean;
  ocurrences, iIt: Integer;
  temporary: IClipBoardItem;
  customMsg: ICustomizedDialog;
  prod: TNFProd;
begin
  inherited;

  if not clipboardDts.Nfs.dataSet.Active then
  begin
    ShowMsgCaption('Nenhum item selecionado');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  clipboardDts.ItensNF.prepare_loop('sel = ''S''');
  try
    Nota.CopiadorNF.CopyFrom(clipboardDts.Nfs.dataSet, clipboardDts.ItensNF.dataSet, ShowMsgCaption);
    clipboardDts.UpdateDataSet;
    UpdateCountLabelsAreaTransf();

    btnContinuarParaColar.Visible := (clipboardNf.Prods.Count > 0) and (Self.Caption <> 'Devolução de mercadorias');
    btnDevolucao.Visible          := (clipboardNf.Prods.Count > 0) and (Self.Caption = 'Devolução de mercadorias');

  finally
    clipboardDts.ItensNF.prepare_loop_done;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCopiador.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not Nota.Auditor.Habilitar()
    .Processo('NF0248')
    .Permitido then
    Exit;

  edEmpresa.Enabled := True;
end;

procedure TfrmCadNFCopiador.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if ShowCustomDlg.Msg('Deseja mesmo limpar todos os registros da área de transferência?', mdtQuestion, [brYes, brNo])
    .SetDefaultBtn(brNo)
    .Show().ResultDlg <> IDYES then
    Exit;

  clipboardNf.Prods.Clear;
  clipboardNf.Nota.cod_cliente := 0;
  clipboardDts.UpdateDataSet;

  UpdateCountLabelsAreaTransf();

  tabNotaChange(tabNota);

//  btnContinuarParaColar.Visible := False;
end;

procedure TfrmCadNFCopiador.btnColarNaNFClick(Sender: TObject);
var
  I: Integer;
  prod: TNFProd;
  rescueCons, cons: RConsulta;
  //
  props: TNewCopyPropsCustom;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  ToggleControls(False);
  props := TNewCopyPropsCustom.Create;
  try
    if tabNota.TabIndex < 2 then
    begin
      props.ContinueAs := tnfNova;
      props.ClienteId := btnProcuraCliente.Tag;
      props.EouS := IfThen(tabNota.TabIndex = 0, 'S', 'E');
    end
    else if tabNota.TabIndex = 2 then
    begin
      props.ContinueAs := tnfColarOutra;
      props.notaFiscalId := btnProcuraNF.Tag;
    end
    else
      props.ContinueAs := tnfColarNaAtual;

    props.IsSN := vDadosIni.vEmp.vRegime = 'SIMPLES';
    props.OnLog := ShowMsgCaption;

    if cbTipoOp.Enabled and (cbTipoOp.ItemIndex > -1)then
    begin
      props.NatOp := TNaturezaOperacao(cbTipoOp.ItemIndex);
      props.ManterCalcTrib := ckManterTributos.Checked;
      props.AgruparProdutos := ckAgruparProdutos.Checked;
      props.ReferenciarPorItem := ckReferenciarItens.Checked;
    end
    else
    begin
      props.ManterCalcTrib := True;
      props.AgruparProdutos := False;
      props.ReferenciarPorItem := False;
    end;

    props.IsDev := props.NatOp = nopDevolucao;

    if ContinuarComNotaFiscal(props) then
      ModalResult := mrOk;
  finally
    props.Free;
    Screen.Cursor := crDefault;
    ToggleControls(True);
  end;
end;

procedure TfrmCadNFCopiador.btnColarNotasSelClick(Sender: TObject);
begin
  inherited;

  Screen.Cursor := crHourGlass;
  btnCancelCopyNFs.Visible := True;
  ToggleControls(False);
  clipboardDts.SetEnabledAfterScroll(False);
  clipboardDts.Nfs.dataSet.AfterScroll := nil;
  clipboardDts.Nfs.prepare_loop('sel = ''S''');
  try

    if clipboardDts.Nfs.dataSet.RecordCount = 0 then
    begin
      ShowMsgCaption('Nenhuma nota selecionada');
      Exit;
    end;

    clipboardDts.ItensNF.prepare_loop();

    while not clipboardDts.Nfs.Eof do
    begin
      clipboardDts.AbrirItensNf;

      Nota.CopiadorNF.CopyFrom(clipboardDts.Nfs.dataSet, clipboardDts.ItensNF.dataSet, ShowMsgCaption, clipboardDts.Nfs.DataSet.RecNo - 1);

      ShowMsgCaption(Format('Copiando dados %d de %d', [clipboardDts.Nfs.dataSet.RecNo, clipboardDts.Nfs.dataSet.RecordCount]));

      if not btnCancelCopyNFs.Visible then
      begin
        ShowMsgCaption('Cópia interrompida');
        Exit;
      end;
      Application.ProcessMessages;

      clipboardDts.Nfs.Next;
    end;
    clipboardDts.Nfs.Refresh;

    btnContinuarParaColar.Visible := (clipboardNf.Prods.Count > 0) and (Self.Caption <> 'Devolução de mercadorias');
    btnDevolucao.Visible          := (clipboardNf.Prods.Count > 0) and (Self.Caption = 'Devolução de mercadorias');

  finally
    clipboardDts.UpdateDataSet;
    clipboardDts.ItensNF.prepare_loop_done;
    clipboardDts.Nfs.prepare_loop_done;
    clipboardDts.SetEnabledAfterScroll(True);
    clipboardDts.AbrirItensNf;
    UpdateCountLabelsAreaTransf();
    btnCancelCopyNFs.Visible := False;
    ToggleControls(True);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCopiador.btnContinuarParaColarClick(Sender: TObject);
begin
  inherited;
  tabNota.Tabs.Clear;
  tabNota.Tabs.Add('Nova NF Saída');
  tabNota.Tabs.Add('Nova NF Entrada');
  tabNota.Tabs.Add('Colar em outra NF');

//  gridClipBoard.Parent := pnClipBoardFinal;

  if (Nota.dataSet.State in [dsInsert, dsEdit]) or (Nota.emEdicao) then
  begin
    tabNota.Tabs.Add('Colar na NF atual');
    tabNota.TabIndex := 3;//IfThen(Nota.fequals('natureza_nf', 'S'), 0, 1);
  end

  else
    tabNota.TabIndex := IfThen(Nota.CopiadorNF.ClipBoardNF.Nota.natureza_nf = 'S', 1);//RegistroWin.Read(Self.ClassName, tabNota.Name, 2);

  if Nota.CopiadorNF.ClipBoardNF.Nota.cod_empresa = vDadosIni.cod_empresa then
    btnProcuraCliente.Tag := Nota.CopiadorNF.ClipBoardNF.Nota.cod_cliente
  else
    btnProcuraCliente.Tag := Nota.queryCons.Table('clientes', 'cod_cliente')
      .Equals('cpfcgc', Nota.CopiadorNF.ClipBoardNF.Nota.cpfcgc)
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .Scalar.AsInteger;

//  OnlyShowClipBoard;
  page.ActivePage := tsColar;
  gridClipBoard.Parent := pnClipBoardFinal;
  clipboardDts.UpdateDataSet;
  UpdateCountLabelsAreaTransf();
  tabNotaChange(tabNota);
  btnVoltar.Tag := 1;
//  tabNotaChange(tabNota);
//
//  page.ActivePage := tsColar;
end;

procedure TfrmCadNFCopiador.btnDevolucaoClick(Sender: TObject);
var
  I: Integer;
  prod: TNFProd;
  rescueCons, cons: RConsulta;
  //
  props: TNewCopyPropsCustom;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  ToggleControls(False);
  props := TNewCopyPropsCustom.Create;
  try
    props.ContinueAs := tnfNova;
    props.ClienteId  := clipboardDts.Nfs.fint('cod_cliente');
    props.EouS       := IfThen(clipboardDts.Nfs.fequals('natureza_nf', 'E'), 'S', 'E');
    props.IsDev      := True;
    props.IsSN       := vDadosIni.vEmp.vRegime = 'SIMPLES';
    props.OnLog      := ShowMsgCaption;
    props.NatOp      := nopDevolucao;
    props.ManterCalcTrib := True;
    props.AgruparProdutos := False;

    if ContinuarComNotaFiscal(props) then
      ModalResult := mrOk;
  finally
    props.Free;
    Screen.Cursor := crDefault;
    ToggleControls(True);
  end;
end;

procedure TfrmCadNFCopiador.btNotasSelColapseClick(Sender: TObject);
begin
  inherited;
  pnNotasSel.Tag := pnNotasSel.Height;
  btNotasSelColapse.Visible := False;
  btNotasSelExpand.Visible := True;

  pnNotasSel.Height := pnNotasSel.Height - gridNfs.Height;

  gridNfs.Visible := False;

  HandleOrderPanels;      

  if ((pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height) < pnContainerNotas.Height) then
    if btItNfCollapse.Visible then
      pnItensNota.Height := pnItensNota.Height + pnContainerNotas.Height - (pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height)
    else if btNotasSelColapse.Visible then
      pnNotasSel.Height := pnNotasSel.Height + pnContainerNotas.Height - (pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height);
end;

procedure TfrmCadNFCopiador.btNotasSelExpandClick(Sender: TObject);
begin
  inherited;
  pnNotasSel.Height := pnNotasSel.Tag;
  btNotasSelColapse.Visible := True;
  btNotasSelExpand.Visible := False;

  gridNfs.Visible := True;

  HandleOrderPanels;

  if (pnClipBoardNotasSel.Align = alTop) and ((pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height) < pnContainerNotas.Height) then
    pnNotasSel.Height := pnNotasSel.Height + pnContainerNotas.Height - (pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height);
end;

procedure TfrmCadNFCopiador.btnProcuraClienteClick(Sender: TObject);
var
  codCli: Integer;
begin
  inherited;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');

  if (vDadosIni.vPesquisa = '') or (not TryStrToInt(vDadosIni.vPesquisa, codCli)) then
    Exit;

  btnProcuraCliente.Tag := codCli;
  tabNotaChange(tabNota);
end;

procedure TfrmCadNFCopiador.btnProcuraNFClick(Sender: TObject);
var
  codNf: Integer;
begin
  inherited;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NOTAFISCAL',
      ' and (' +
      Format(' (NOTAFISCAL.EMISSAO_PROPRIA = ''S'' and NOTAFISCAL.MODELO_NF = ''55'' and NOTAFISCAL.SITUACAO_NFE in (''%s'', ''%s''))', [sitVazio, sitRejeitada]) +
      ' or (NOTAFISCAL.EMISSAO_PROPRIA = ''S'' and NOTAFISCAL.MODELO_NF <> ''55'')' +
      Format(' or (NOTAFISCAL.EMISSAO_PROPRIA = ''N'' and NOTAFISCAL.STATUS = ''%s'')', [stsAberta]) +
      ')',
      'Consulta de Notas Fiscais');

  if (vDadosIni.vPesquisa = '') or (not TryStrToInt(vDadosIni.vPesquisa, codNf)) then
    Exit;

  btnProcuraNF.Tag := codNf;
  tabNotaChange(tabNota);
end;

function TfrmCadNFCopiador.ContinuarComNotaFiscal(
  props: TNewCopyPropsCustom): Boolean;
var
  I: Integer;
  prod: TNFProd;
  rescueCons, cons: RConsulta;
  newCopy: IClipBoardItem;
  ignorarOriginal: YesNoEnum;  
begin
  inherited;

  Result := False;

  if props.ContinueAs = tnfNova then
  begin
    if not Nota.Auditor.Visualizar
      .Processo('NF0247')
      .SetMensagem('NUM NF %d', [Nota.fint('num_nf')])
      .SetChave(Nota.fstr('cod_nf'))
      .Permitido then
      Exit;

    ShowMsgCaption('Criando nota fiscal');

    newCopy := Nota.CopiadorNF.NewCopy(props);
    try
      if Nota.incluirNf(tnfProdutos, 'P', props.EouS[1]) then
      begin
        Nota.dataSet.FieldByName('codigo_nop').AsFloat          := VarToFloat(newCopy.Nota.codigo_nop);
        Nota.dataSet.FieldByName('cod_cliente').AsInteger       := newCopy.Nota.cod_cliente;
        Nota.dataSet.FieldByName('devolucao').AsString          := newCopy.Nota.devolucao;
        Nota.dataSet.FieldByName('tipo_emissao').AsString       := newCopy.Nota.tipo_emissao;
        Nota.dataSet.FieldByName('verificar_mud_cfop').AsString := newCopy.Nota.verificar_mud_cfop;

        if (Nota.CopiadorNF.ClipBoardNF.Nota.cod_cliente = newCopy.Nota.cod_cliente) and
          (Nota.fequals('natureza_nf', 'E')) then
        begin
          Nota.dataSet.FieldByName('num_nf').AsInteger := Nota.CopiadorNF.ClipBoardNF.Nota.num_nf;
          Nota.dataSet.FieldByName('serie').AsString := Nota.CopiadorNF.ClipBoardNF.Nota.serie;
          Nota.dataSet.FieldByName('modelo_nf').AsString := Nota.CopiadorNF.ClipBoardNF.Nota.modelo_nf;
          Nota.dataSet.FieldByName('data_contabil').AsDateTime := DateOf(VarToDateTime(Nota.CopiadorNF.ClipBoardNF.Nota.data_contabil));
        end;

        if not Nota.exitCodigoTabela('CLIENTES') then
        begin
          Nota.CancelUpdates;
          Exit;
        end;

        if not Nota.exitCodigoTabela('NAT_OP') then
        begin
          Nota.CancelUpdates;
          Exit;
        end;
      end;

    except on E: Exception do
      begin
        ShowMsgCaption('Erro no processo. ' + e.Message);
        Nota.CancelUpdates;
        raise;
      end;
    end;
  end

  else if props.ContinueAs = tnfColarOutra then
  begin

    if not Nota.Auditor.Visualizar
      .Processo('NF0246')
      .SetMensagem('NUM NF %d', [Nota.fint('num_nf')])
      .SetChave(Nota.fstr('cod_nf'))
      .Permitido then
      Exit;

    ShowMsgCaption('Selecionado nota fiscal');

    rescueCons := Nota.vCons;

    try
      cons.Reset;
      Nota.vCons := cons;
      Nota.vCons.porData := False;
      Nota.vCons.personalisada := False;
      Nota.vCons.adicional := False;
//      Nota.vCons.prodServAv := True;
      Nota.vCons.campo := Nota.dataSet.FieldByName('cod_nf').DisplayLabel;
      Nota.vCons.condicao := 'Igual';
      Nota.vCons.valor := IntToStr(props.notaFiscalId);
      Nota.vCons.ordem := Nota.vCons.campo;

      Nota.consulta;
    finally
      Nota.vCons := rescueCons;
    end;

    if Nota.fdif('cod_nf', IntToStr(props.notaFiscalId)) or (not Nota.emEdicao) then
      raise Exception.Create('Nota não pode ser selecionada para edição');

    clipboardNf.Nota.CopyFrom(Nota.dataSet);
    props.BuildFrom(clipboardNf.Nota);

    newCopy := Nota.CopiadorNF.NewCopy(props);
    try
      Nota.Edit;
    except
      begin
        newCopy.Prods.Clear;
        raise;
      end;
    end;
  end

  else if props.ContinueAs = tnfColarNaAtual then
  begin
  
    if not Nota.Auditor.Visualizar
      .Processo('NF0246')
      .SetMensagem('NUM NF %d', [Nota.fint('num_nf')])
      .SetChave(Nota.fstr('cod_nf'))
      .Permitido then
      Exit;

    clipboardNf.Nota.CopyFrom(Nota.dataSet);
    props.BuildFrom(clipboardNf.Nota);

    newCopy := Nota.CopiadorNF.NewCopy(props);
    try
      Nota.Edit;
    except
      begin
        newCopy.Prods.Clear;
        raise;
      end;
    end;
  end

  else
    raise Exception.Create('Opção para continuar inválida');

  try
    ignorarOriginal := YesNoEnum(Nota.fint('dfe_trib_ignorar'));

    Result := Nota.ColarItensNaNF(newCopy, ShowMsgCaption);

    if Result and Nota.fequals('tipo_emissao', '4')
      and (YesNoEnum(Nota.fint('dfe_trib_ignorar')) = ynNo) and (ignorarOriginal = ynYes) then
      ShowAtencao(
        'Os dados dos tributos da RTC foram encontrados e copiados para devolução' + sLineBreak +
        'Caso não seja o caso de devolver esses tributos, marque a opção para Ignorar os tributos da RTC'
      );
    
  finally
    newCopy.Prods.Clear;
  end;

  Exit;

  ShowMsgCaption('Colando itens');
  for I := 0 to newCopy.Prods.Count - 1 do
  begin
    prod := TNFProd.Create;
    try
      prod.CopyFrom(clipboardNf.Prods.Items[I]);
      prod.nitem  := Nota.vItem.dataSet.RecordCount + 1;
      prod.cod_nf := Nota.fint('cod_nf');

      prod.LimparDadosDeVinculos;
      prod.CopyTo(Nota.vItem.dataSet, False, True, False, False);

      //testar o csosn quando devolucao, uClassesNotasFiscais 19309
      // Na verdade parece ser todos os itens
      // vItem.dataSet.FieldByName('csosn').AsString := getCSOSNPorCST(vItem.fstr('cst'), vItem.fstr('csosn'), False);

      Nota.vItem.Post;

    finally
      prod.Free;
    end;
  end;
  ShowMsgCaption('Processo concluído');
  Nota.somaTotaisNF();

  ModalResult := IDOK;
end;

procedure TfrmCadNFCopiador.Criarnotadetransfernciacomaseleoabaixo1Click(
  Sender: TObject);
var
  props: TNewCopyPropsCustom;
  emp: TEmpresaModel;
begin
  inherited;

  if (not clipboardDts.Nfs.dataSet.Active) or (clipboardDts.Nfs.dataSet.RecordCount = 0) then
  begin
    ShowMsgCaption('Nenhuma nota selecionada');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  ToggleControls(False);
  StoreClipBoardAndClear;
  clipboardDts.SetEnabledAfterScroll(False);
  clipboardDts.Nfs.prepare_loop('sel = ''S''');
  props := TNewCopyPropsCustom.Create;
  try

    {$REGION 'Validações'}

    if clipboardDts.Nfs.dataSet.RecordCount = 0 then
    begin
      ShowMsgCaption('Nenhuma nota selecionada');
      Exit;
    end;

    if edEmpresa.ItemIndex = -1 then
    begin
      ShowMsgCaption('Nenhuma empresa selecionada');
      Exit;
    end;

    emp := (edEmpresa.Items.Objects[edEmpresa.ItemIndex] as TEmpresaModel);
    if emp.cgc_emp = vDadosIni.vEmp.vCNPJ then
    begin
      ShowMsgCaption('A transferência deve ser feita para uma empresa diferente');
      Exit;
    end;

    props.ClienteId := Nota.queryCons
      .Table('clientes', 'cod_cliente, cpfcgc')
      .Equals('cpfcgc', emp.cgc_emp)
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .Scalar.AsInteger;

    if props.ClienteId = 0 then               
    begin
      ShowMsgCaption('Empresa não encontrada no cadastro de clientes. Por favor cadastre o cnpj "' + emp.cgc_emp + '" antes de continuar');
      Exit;
    end;

    {$ENDREGION}

    if not Nota.Auditor.Inserir
      .Processo('NF0249')
      .Permitido then
      Exit;

    {$REGION 'Copiando notas e itens'}

    props.ManterCalcTrib := False;
    props.AgruparProdutos := True;

    clipboardDts.ItensNF.prepare_loop();
    while not clipboardDts.Nfs.Eof do
    begin
      if clipboardDts.Nfs.fdif('tipo_nf', 'P') then
      begin
        ShowMsgCaption('Tipo de nota fiscal difere de Produtos');
        Exit;
      end;

      clipboardDts.AbrirItensNf;
      Nota.CopiadorNF.CopyFrom(clipboardDts.Nfs.dataSet, clipboardDts.ItensNF.dataSet, ShowMsgCaption);
      ShowMsgCaption(Format('Copiando dados %d de %d', [clipboardDts.Nfs.dataSet.RecNo, clipboardDts.Nfs.dataSet.RecordCount]));

      Nota.Auditor.GravarMensagem('COPIA NUM NF %d EMPRESA %d', [clipboardDts.Nfs.fint('cod_nf'), clipboardDts.Nfs.fint('cod_empresa')]);

      clipboardDts.Nfs.Next;
    end;
    {$ENDREGION}

    {$REGION 'Criando NF'}
    props.ContinueAs := tnfNova;
    props.EouS := 'S';
    props.IsSN := vDadosIni.vEmp.vRegime = 'SIMPLES';
    props.OnLog := ShowMsgCaption;
    props.NatOp := nopTransferencias;
    props.IsDev := False;
    props.ManterCalcTrib := False;
    props.AgruparProdutos := True;

    if ContinuarComNotaFiscal(props) then
      ModalResult := mrOk;
    
    {$ENDREGION}

  finally
    props.Free;
    clipboardDts.UpdateDataSet;
    clipboardDts.ItensNF.prepare_loop_done;
    clipboardDts.Nfs.prepare_loop_done;
    clipboardDts.SetEnabledAfterScroll(True);
    clipboardDts.AbrirItensNf;
    UpdateCountLabelsAreaTransf();
    RestoreClipBoard;
    ToggleControls(True);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCopiador.edEmpresaChange(Sender: TObject);
var
  emp: TEmpresaModel;
begin
  inherited;

  if edEmpresa.ItemIndex = -1 then
    Exit;

  emp := (edEmpresa.Items.Objects[edEmpresa.ItemIndex] as TEmpresaModel);

  btMoreEmp.Enabled := emp.cod_empresa <> vDadosIni.cod_empresa;

  RegistroWin.Write(Self.Name, TEmpresaList.ClassName, emp.cod_empresa);
  
  btProcurarNotas.Click;
end;

procedure TfrmCadNFCopiador.SpeedButton8Click(Sender: TObject);
var
  prod: TNFProd;
begin
  inherited;
  if (clipboardNf.Prods.Count > 0)
    and (clipboardDts.dataSet.RecNo <= clipboardNf.Prods.Count) then
  begin
    prod := clipboardNf.Prods.FindProd(clipboardDts.fint('cod_nf'), clipboardDts.fint('nitem'));
    if prod <> nil then
    begin
      clipboardDts.storeRecNo;
      clipboardNf.Prods.Remove(prod);
      clipboardDts.UpdateDataSet;
      btnContinuarParaColar.Visible := (clipboardNf.Prods.Count > 0) and (Self.Caption <> 'Devolução de mercadorias');
      btnDevolucao.Visible          := (clipboardNf.Prods.Count > 0) and (Self.Caption = 'Devolução de mercadorias');
      clipboardDts.restoreRecNo;
    end;
  end;

  UpdateCountLabelsAreaTransf();

  if clipboardNf.Prods.Count = 0 then
    clipboardNf.Nota.cod_cliente := 0;
end;

procedure TfrmCadNFCopiador.StoreClipBoardAndClear;
var
  I: Integer;
  prod: TNFProd;
begin
  rescueClipBoard := TClipBoardCopiador.New();
  rescueClipBoard.Nota.CopyFrom(clipboardNf.Nota);
  for I := 0 to clipboardNf.Prods.Count - 1 do
  begin
    prod := rescueClipBoard.Prods.New;
    prod.CopyFrom(clipboardNf.Prods.Items[I]);
  end;

  clipboardNf.Prods.Clear;
end;

procedure TfrmCadNFCopiador.btProcurarNotasClick(Sender: TObject);
var
 emp: TEmpresaModel;
begin
  inherited;

  if edEmpresa.ItemIndex = -1 then
    Exit;

  Screen.Cursor := crHourGlass;
  try

    emp := (edEmpresa.Items.Objects[edEmpresa.ItemIndex] as TEmpresaModel);

    clipboardDts.Nfs.SQLMaker.FilterMk.FreeFilters()
      .IsActive()
      .Add('cod_empresa', emp.cod_empresa)
      .Add(FilterFrame1.GetFiltros());

    clipboardDts.ItensNF.Close;
    clipboardDts.Nfs.RunSQLMaker();

    CheckUncheckHrFrameNota.Visible := True;
    btnColarNotasSel.Visible := True;
    btnSelecionarCabecalhoNF.Left := 0;
    Criarnotadetransfernciacomaseleoabaixo1.Enabled := True;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFCopiador.cbTipoOpChange(Sender: TObject);
begin
  inherited;
  if cbTipoOp.ItemIndex = -1 then
    Exit;

  ckManterTributos.Checked := (not (TNaturezaOperacao(cbTipoOp.ItemIndex) in [nopTransferencias, nopCompraVenda])) or (currentNaturazaNF = 'E');//entrada;
  ckAgruparProdutos.Enabled := (not ckManterTributos.Checked) or (currentNaturazaNF = 'E');
  if (ckManterTributos.Checked or ckReferenciarItens.Checked) and (not ckAgruparProdutos.Enabled) then
    ckAgruparProdutos.Checked := False;

end;

procedure TfrmCadNFCopiador.ckManterTributosClick(Sender: TObject);
begin
  inherited;
  ckAgruparProdutos.Enabled := (not ckManterTributos.Checked) or (currentNaturazaNF = 'E');
  if ckManterTributos.Checked and (not ckAgruparProdutos.Enabled) then
    ckAgruparProdutos.Checked := False;
end;

procedure TfrmCadNFCopiador.btnVoltarClick(Sender: TObject);
begin
  inherited;

  if btnVoltar.Tag = 0 then
    ModalResult := mrCancel

  else if btnVoltar.Tag = 1 then
  begin
    gridClipBoard.Parent := pnClipBoardNotasSel;
    page.ActivePage := tsNotas;
    btnVoltar.Tag := 0;
  end;
end;

procedure TfrmCadNFCopiador.btClipboardCollapseClick(Sender: TObject);
begin
  inherited;
  gridClipBoard.Visible := False;
  SplitteItensNfAndClipboard.Visible := False;

  pnClipBoardNotasSel.Align := alTop;
  pnClipBoardNotasSel.Height := pnClipBoardNotasSelTop.Height;
  btClipboardCollapse.Visible := False;
  btClipboardExpand.Visible := True;  

  HandleOrderPanels;

  if ((pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height) < pnContainerNotas.Height) then
    if btItNfCollapse.Visible then
      pnItensNota.Height := pnItensNota.Height + pnContainerNotas.Height - (pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height)
    else if btNotasSelColapse.Visible then
      pnNotasSel.Height := pnNotasSel.Height + pnContainerNotas.Height - (pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height);
end;

procedure TfrmCadNFCopiador.btClipboardExpandClick(Sender: TObject);
begin
  inherited;
  pnClipBoardNotasSel.Align := alClient;

  SplitteItensNfAndClipboard.Visible := True;
  gridClipBoard.Visible := True;
  btClipboardCollapse.Visible := True;
  btClipboardExpand.Visible := False;    

  HandleOrderPanels;
end;

procedure TfrmCadNFCopiador.btHandleTipoOperacaoClick(Sender: TObject);
begin
  inherited;
  cbTipoOp.Enabled   := not cbTipoOp.Enabled;
  tabNota.Height     := IfThen(cbTipoOp.Enabled, 109, 78);
  cbTipoOp.ItemIndex := IfThen(cbTipoOp.ItemIndex > -1, cbTipoOp.ItemIndex);
  cbTipoOpChange(cbTipoOp);
end;

procedure TfrmCadNFCopiador.btItNfCollapseClick(Sender: TObject);
begin
  inherited;
  pnItensNota.Tag := pnItensNota.Height;
  btItNfCollapse.Visible := False;
  btItNfExpand.Visible := True;

  pnItensNota.Height := pnItensNota.Height - gridItensNF.Height;

  gridItensNF.Visible := False;    

  HandleOrderPanels;

  if ((pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height) < pnContainerNotas.Height) then
    if btItNfCollapse.Visible then
      pnItensNota.Height := pnItensNota.Height + pnContainerNotas.Height - (pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height)
    else if btNotasSelColapse.Visible then
      pnNotasSel.Height := pnNotasSel.Height + pnContainerNotas.Height - (pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height);
end;

procedure TfrmCadNFCopiador.btItNfExpandClick(Sender: TObject);
begin
  inherited;
  pnItensNota.Height := pnItensNota.Tag;
  btItNfCollapse.Visible := True;
  btItNfExpand.Visible := False;

  gridItensNF.Visible := True;

  HandleOrderPanels;

  if (pnClipBoardNotasSel.Align = alTop) and ((pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height) < pnContainerNotas.Height) then
    pnItensNota.Height := pnItensNota.Height + pnContainerNotas.Height - (pnClipBoardNotasSel.Top + pnClipBoardNotasSel.Height);
end;

procedure TfrmCadNFCopiador.tabNotaChange(Sender: TObject);
begin
  inherited;
  btnProcuraNF.Enabled := tabNota.TabIndex = 2;
  btnCriarNF.Visible := tabNota.TabIndex < 2;
  btnColarNaNF.Visible := tabNota.TabIndex >= 2;
  btnColarNaNF.Enabled := False;
  btnCriarNF.Enabled := False;
  btnProcuraCliente.Visible := tabNota.TabIndex < 2;
  btHandleTipoOperacao.Enabled := True;//tabNota.TabIndex < 2;
  ckManterTributos.Enabled := tabNota.TabIndex = 0;  

  if tabNota.TabIndex > 1 then
    RegistroWin.Write(Self.ClassName, tabNota.Name, tabNota.TabIndex);

  edData.Text   := '';
  edNumero.Text := '';
  edDest.Text   := '';
  if tabNota.TabIndex < 2 then
  begin
    currentNaturazaNF := IfThen(tabNota.TabIndex = 0, 'S', 'E');
    if btnProcuraCliente.Tag > 0 then
    begin
      Nota.queryCons.Table('clientes', 'razao')
        .Equals('cod_empresa', vDadosIni.cod_empresa)
        .Equals('cod_cliente', btnProcuraCliente.Tag)
        .Open;
      edDest.Text := Nota.queryCons.fstr('razao');
      btnCriarNF.Enabled := (clipboardNf.Prods.Count > 0) and (not Nota.queryCons.IsEmpty);
      Nota.queryCons.Close;
    end;
  end
  else if tabNota.TabIndex = 2 then
  begin
    if btnProcuraNF.Tag > 0 then
    begin
      Nota.queryCons.Table('notafiscal', 'num_nf, serie, data_lanc, razao, natureza_nf')
        .Equals('cod_empresa', vDadosIni.cod_empresa)
        .Equals('cod_nf', btnProcuraNF.Tag)
        .Open;

      edData.Text               := Nota.queryCons.fstr('data_lanc');
      edNumero.Text             := Nota.queryCons.fstr('num_nf') + '/' + Nota.queryCons.fstr('serie');
      edDest.Text               := Nota.queryCons.fstr('razao');
      ckManterTributos.Enabled  := Nota.queryCons.fequals('natureza_nf', 'S');
      btnColarNaNF.Enabled      := (clipboardNf.Prods.Count > 0) and (not Nota.queryCons.IsEmpty);
      currentNaturazaNF := Nota.queryCons.fstr('natureza_nf');
      Nota.queryCons.Close;
    end;
  end
  else if tabNota.TabIndex = 3 then
  begin
    edData.Text              := Nota.fstr('data_lanc');
    edNumero.Text            := Nota.fstr('num_nf') + '/' + Nota.fstr('serie');
    edDest.Text              := Nota.fstr('razao');
    ckManterTributos.Enabled := Nota.fequals('natureza_nf', 'S');
    btnColarNaNF.Enabled     := (clipboardNf.Prods.Count > 0) and (not Nota.IsEmpty);
    currentNaturazaNF := Nota.fstr('natureza_nf');
  end;

  //ckAgruparProdutos.Enabled := not ckManterTributos.Enabled;
  cbTipoOpChange(cbTipoOp);

//  if not ckManterTributos.Enabled then
//    ckManterTributos.Checked := True;
  
end;

procedure TfrmCadNFCopiador.btMoreEmpClick(Sender: TObject);
begin
  inherited;
  popMenuEmpresa.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadNFCopiador.TimerCaptionEvent(Sender: TObject);
begin
  timerCaption.Enabled := False;
  lbMessage.Visible := False;

  //INSERT INTO TABELA_PROCESSOS (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA) VALUES ('NF0247', :COD_EMPRESA, 'NOVA NF A PARTIR DA AREA DE TRANSFERENCIA', 1, 'N', 'S');
end;

procedure TfrmCadNFCopiador.ToggleControls(const setEnabled: Boolean);
begin
  btnColarNotasSel.Enabled := setEnabled;
  CheckUncheckHrFrameNota.Enabled := setEnabled;
  btnColarItensToClipboard.Enabled := setEnabled;
  CheckUncheckHrFramItensNota.Enabled := setEnabled;
  pnFiltros.Enabled := setEnabled;
  tabNota.Enabled := setEnabled;
  pnClipBoardNotasSelBtns.Enabled := setEnabled;
  pnClipBoardColarBtns.Enabled := setEnabled;
end;

procedure TfrmCadNFCopiador.UpdateCountLabelsAreaTransf;
begin
  if Self.Caption = 'Devolução de mercadorias' then
    lbAreaTransf.Caption := Format('Área de transferência (Itens atuais prontos para criar a Devolução) - Qtde %d', [Nota.CopiadorNF.ClipBoardNF.Prods.Count])
  else
    lbAreaTransf.Caption := Format('Área de transferência (Itens atuais prontos para colar em outra nota fiscal) - Qtde %d', [Nota.CopiadorNF.ClipBoardNF.Prods.Count]);

  lbAreaTransf2.Caption := Format('Área de transferência - Qtde %d', [Nota.CopiadorNF.ClipBoardNF.Prods.Count]);
end;

destructor TClipboardDts.Destroy;
begin

  if Assigned(FItensNF) then
    FreeAndNil(FItensNF);

  if Assigned(FNfs) then
    FreeAndNil(FNfs);

  TimerAfterScrool.Enabled := False;
  FreeAndNil(TimerAfterScrool);

//  if Assigned(FTransfs) then
//    FreeAndNil(FTransfs);

  inherited;
end;

procedure TClipboardDts.SetEnabledAfterScroll(const setEnable: Boolean);
begin
  TimerAfterScrool.Enabled := setEnable;
  if setEnable then
    FNfs.dataSet.AfterScroll := AfterScrollNfs
  else
    FNfs.dataSet.AfterScroll := nil;
end;

procedure TClipboardDts.SetOperacao(const Value: CopiadorOperacao);
begin
  if FOperacao = coNaoDefinida  then
    if Value = coMultEmpresa then
    begin
      FNfs.SQLMaker.Build(
        Nota.SQLMaker.TableName,
        Nota.SQLMaker.AliasTbSql,
        Nota.SQLMaker.FieldsSql,
        Nota.SQLMaker.JoinSql,
        Nota.SQLMaker.WhereSql,
        Nota.SQLMaker.OrderSql)
       .ChangeCaseSentitive('status,Situacao_nfe,dest_email,obs,descricaoerro,resultadoEnvio', True);
    end
    else
    begin
      FNfs.dataSet.ProviderName := '';
      if not FNfs.dataSet.Active then
        FNfs.dataSet.CreateDataSet;
    end;

  FOperacao := Value;
end;

procedure TClipboardDts.TimerAfterScroolTimer(Sender: TObject);
begin
  TimerAfterScrool.Enabled := False;
  AbrirItensNf;
end;

procedure TClipboardDts.UpdateDataSet;
var
  iCp, iProd: Integer;
begin
  Self.dataSet.EmptyDataSet;
  try
    Self.dataSet.DisableControls;
    for iProd := 0 to Nota.CopiadorNF.ClipBoardNF.Prods.Count - 1 do
      Nota.CopiadorNF.ClipBoardNF.Prods.Items[iProd].CopyTo(Self.dataSet, True, True, False, False);
  finally                        
    Self.dataSet.EnableControls;
  end;
end;

{ TItensNotaClipBoard }

constructor TItensNotaClipBoard.Create(dtsOOP: TDataSet_OOP;
  componentName: string);
begin
  inherited Create(dtsOOP.buscas.Database, nil, True, componentName);
  if dataSet <> nil then
    dataSet.OnCalcFields := DataSetCalcFields;
end;

{ TNFSDts }

constructor TNFSDts.Create(ANota: TNFCab);
begin
  inherited Create(ANota.buscas.Database, nil, True, 'cds_nfcopy1');
end;

end.
