unit uCadProdutos_HistoricoPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, uDataSet_OOP, Grids, DBGrids, StdCtrls, ExtCtrls, Mask,
  uEditHw, Buttons, DBCtrls, DB;

type

  THistoricoPrecos = class(TDataSet_OOP)
  private
    grupoprod: Integer;
    codProd: string;
    FdataIni: TDateTime;
    FdataFim: TDateTime;
    FtodasEmpresas: Boolean;
    Ftabela: string;
    Fquantidade: Double;
    procedure SetQuantidade(const Value: Double);
    procedure SetTabela(const Value: string);
    procedure SetDataFim(const Value: TDateTime);
    procedure SetDataIni(const Value: TDateTime);
    procedure SetTodasEmpresas(const Value: Boolean);

    procedure Show;
    procedure Filtrar;
    procedure DataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create(grupo: Integer; codigo: string);
    procedure SetGrupoCodigo(grupo: Integer; codigo: string);

    property dataIni: TDateTime read FdataIni write SetDataIni;
    property dataFim: TDateTime read FdataFim write SetDataFim;
    property todasEmpresas: Boolean read FtodasEmpresas write SetTodasEmpresas;
    property quantidade: Double read Fquantidade write SetQuantidade;
    property tabela: string read Ftabela write SetTabela;
  end;

  TfrmCadProdutosHistPreco = class(TfrmPadrao)
    Panel1: TPanel;
    produtoPanel: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    Panel4: TPanel;
    gridHistorico: TDBGrid;
    Panel5: TPanel;
    Label1: TLabel;
    edTabela: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    edQtde: TEditHw;
    Label4: TLabel;
    Label7: TLabel;
    eddataIni: TMaskEdit;
    edDataFim: TMaskEdit;
    ckTodasEmpresas: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    btShow: TSpeedButton;
    btPrevius: TSpeedButton;
    btNext: TSpeedButton;
    btHide: TSpeedButton;
    gridProdutoPanel: TPanel;
    gridProduto: TDBGrid;
    DBText1: TDBText;
    Label5: TLabel;
    DBText2: TDBText;
    Label6: TLabel;
    Label8: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    Splitter1: TSplitter;
    GridPanel2: TGridPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBText36: TDBText;
    DBText37: TDBText;
    DBText38: TDBText;
    DBText39: TDBText;
    DBText40: TDBText;
    Label35: TLabel;
    Label36: TLabel;
    DBText41: TDBText;
    DBText42: TDBText;
    DBText43: TDBText;
    DBText44: TDBText;
    DBText45: TDBText;
    Label37: TLabel;
    Label38: TLabel;
    DBText46: TDBText;
    DBText47: TDBText;
    DBText48: TDBText;
    DBText49: TDBText;
    DBText50: TDBText;
    DBText51: TDBText;
    Label39: TLabel;
    DBText52: TDBText;
    DBText53: TDBText;
    DBText54: TDBText;
    DBText55: TDBText;
    DBText56: TDBText;
    DBText57: TDBText;
    Label40: TLabel;
    DBText58: TDBText;
    DBText59: TDBText;
    DBText60: TDBText;
    DBText61: TDBText;
    DBText62: TDBText;
    DBText63: TDBText;
    Label41: TLabel;
    DBText64: TDBText;
    Label42: TLabel;
    DBText65: TDBText;
    Label43: TLabel;
    DBText66: TDBText;
    Label44: TLabel;
    procedure gridProdutoTitleClick(Column: TColumn);
    procedure gridHistoricoTitleClick(Column: TColumn);
    procedure btPreviusClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure btShowClick(Sender: TObject);
    procedure btHideClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edQtdeChange(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure eddataIniExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckTodasEmpresasClick(Sender: TObject);
    procedure edTabelaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
//    Fcodigo: string;
//    Fgrupo: Integer;
//    Fcodprod: string;
//    Fdescricao: string;

    historico: THistoricoPrecos;
    Fproduto: TDataSet_OOP;
    FmarkMargVisiveis: Boolean;
    FcustoVisivel: Boolean;


    procedure ProdutoDataSetAfterScroll(DataSet: TDataSet);
  public
//    property grupo: Integer read Fgrupo write Fgrupo;
//    property codprod: string read Fcodprod write Fcodprod;
//    property codigo: string read Fcodigo write Fcodigo;

    property produto: TDataSet_OOP read Fproduto write Fproduto;
    property markMargVisiveis: Boolean read FmarkMargVisiveis write FmarkMargVisiveis;
    property custoVisivel: Boolean read FcustoVisivel write FcustoVisivel;
//    property descricao: string read Fdescricao write Fdescricao;
  end;

var
  frmCadProdutosHistPreco: TfrmCadProdutosHistPreco;

implementation

uses
  uDtmAtivo,
  StrUtils,
  hw_utils,
  hw_win_utils,
  DateUtils,
  uDadosIni;

{$R *.dfm}

{ THistoricoPrecos }

constructor THistoricoPrecos.Create(grupo: Integer; codigo: string);
begin
  inherited Create(dtmAtivo.bancoHw);

  grupoprod := grupo;
  codProd := codigo;
end;

procedure THistoricoPrecos.DataSetGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'TABELA' then
    Text := ReplaceStr(Sender.AsString, '_', ' ');
end;

procedure THistoricoPrecos.Filtrar;
var
  str: string;
begin
  if (Fquantidade = 0) and (Trim(tabela) = '') then
    filterClear
  else if dataSet.Filtered and ((Fquantidade = 0) and (Trim(tabela) = '')) then
    filterClear
  else if (Fquantidade > 0) or (Trim(tabela) <> '') then
  begin
    str := IfThen(Fquantidade > 0, 'quantidade > 0');
    str := str + IfThen(Trim(tabela) <> '', IfThen(str <> '', ' and ') + 'tabela like ''%' + tabela + '%''');
    filterStr(str);
  end;
end;

procedure THistoricoPrecos.SetDataFim(const Value: TDateTime);
begin
  if EndOfTheDay(Value) <> FdataFim then
  begin
    FdataFim := EndOfTheDay(Value);
    Self.Show;
  end;
end;

procedure THistoricoPrecos.SetDataIni(const Value: TDateTime);
begin
  if Value <> FdataIni then
  begin
    FdataIni := Value;
    Self.Show;
  end;
end;

procedure THistoricoPrecos.SetGrupoCodigo(grupo: Integer; codigo: string);
begin
  if (grupo <> grupoprod) or (codigo <> codProd) then
  begin
    grupoprod := grupo;
    codProd := codigo;

    Self.Show;
  end;
end;

procedure THistoricoPrecos.SetQuantidade(const Value: Double);
begin
  if Fquantidade <> Value then
  begin
    Fquantidade := Value;
    Filtrar;
  end;
end;

procedure THistoricoPrecos.SetTabela(const Value: string);
begin
  if Ftabela <> Value then
  begin
    Ftabela := Value;
    Filtrar;
  end;
end;

procedure THistoricoPrecos.SetTodasEmpresas(const Value: Boolean);
begin
  if Value <> FtodasEmpresas then
  begin
    FtodasEmpresas := Value;
    Self.Show;
  end;
end;

procedure THistoricoPrecos.Show;
var
  strEmpresa: string;
begin
  if (grupoprod > 0) and
     (Trim(codProd) <> '') and
    (FdataIni <= FdataFim) and
    (FdataIni > 0)and
    (FdataFim > 0)
  then
  begin
    strEmpresa := IfThen(not FtodasEmpresas, ' and pe.cod_empresa = ' + vDadosIni.codEmpresa);
    {
    ClientOpen('select pe.cod_empresa, iif(pe.tabela_id in (''VAREJO'', ''ATACADO'', ''30_DIAS'', ''60_DIAS'', ''90_DIAS'', ''PROMOCAO''), pe.tabela_id,' +
               ' iif(not pq.cod_prod is null, ''QUANTIDADE'', coalesce(pm.descr_promocao, ''**NAO LOCALIZADA**'')))' +
               ' tabela, pe.quantidade, pe.data,  pe.preco, pe.markup, iif(pe.markup > 0, (pe.markup / ( 1 + (pe.markup/ 100))), 0) margem,' +
               ' pe.usuario' +
               ' from produtos_historico_preco pe' +
               ' inner join produtos pr on pr.grupo_prod = pe.grupo_prod and pr.cod_prod = pe.cod_prod and pr.cod_empresa = pe.cod_empresa' +
               ' left join promocao_produto pp on pp.guidt = pe.tabela_id' +
               ' left join promocao pm on pm.cod_promocao = pp.cod_promocao and pm.cod_empresa = pp.cod_empresa and pm.cod_tppreco = pp.cod_tppreco' +
               ' left join preco_produtos_qtde pq on pq.guidt = pe.tabela_id' +
               ' where pe.grupo_prod = %d and pe.cod_prod = ''%s'' %s' +
               ' and pe.data >= %s and pe.data <= %s' +
               ' order by pe.cod_empresa, pe.data desc',
               [grupoprod, codProd, strEmpresa, date_fb(FdataIni), datet_fb(FdataFim)]);
               }
    ClientOpen('select pe.cod_empresa,' +
               ' case when l.cod_localidade is not null then l.localidade || '' - '' || ''LOCALIDADE''' +
               '      when s.cod_setor is not null then s.setor || '' - '' || ''SETOR''' +
               '      when c.cod_cidade is not null then c.nome_cidade || '' - '' || ''CIDADE''' +
               '      when pe.descricao is not null then ''*'' || pe.descricao' +
               '      when (pe.quantidade > 0) and (pq.cod_prod is null) then ''*QUANTIDADE''' +
               '      when pe.quantidade > 0 then ''QUANTIDADE''' +
               '      else' +
               '        iif(pe.tabela_id in (''VAREJO'', ''ATACADO'', ''30_DIAS'', ''60_DIAS'', ''90_DIAS'', ''PROMOCAO''), pe.tabela_id,' +
               '        iif(not pq.cod_prod is null, ''QUANTIDADE'', coalesce(pm.descr_promocao, ''**NAO LOCALIZADA**'') || '' - '' || iif(PP.COD_TPPRECO = 1, ''PROMO'', ''AVULSA'') ))' +
               ' end tabela, pe.quantidade, pe.data,  pe.preco, pe.markup, pe.margem, pe.usuario, pe.custo' +
               ' from produtos_historico_preco pe' +
               ' inner join produtos pr on pr.grupo_prod = pe.grupo_prod and pr.cod_prod = pe.cod_prod and pr.cod_empresa = pe.cod_empresa' +
               ' left join promocao_produto pp on pp.guidt = pe.tabela_id' +
               ' left join promocao pm on pm.cod_promocao = pp.cod_promocao and pm.cod_empresa = pp.cod_empresa and pm.cod_tppreco = pp.cod_tppreco' +
               ' left join preco_produtos_qtde pq on pq.guidt = pe.tabela_id' +
               ' left join localidade l on l.cod_localidade = pp.cod_localidade and l.cod_empresa = pp.cod_empresa' +
               ' left join setor s on s.cod_setor = pp.cod_setor and s.cod_empresa = pp.cod_empresa' +
               ' left join cidades c on c.cod_cidade = pp.cod_cidade and c.cod_cidade > 0' +
               ' where pe.grupo_prod = %d and pe.cod_prod = ''%s'' %s' +
               ' and pe.data >= %s and pe.data <= %s' +
               ' order by pe.cod_empresa, pe.data desc',
               [grupoprod, codProd, strEmpresa, date_fb(FdataIni), datet_fb(FdataFim)]);
    ffDisplayFormat('preco', DisplayNumber(vDadosIni.vEmp.vCasasDecimais)).
    ffDisplayFormat('custo', DisplayNumber(4)).
    ffDisplayFormat('markup', DisplayNumber(vDadosIni.vProduto.Precos.DigMrkMrg)).
    ffDisplayFormat('margem', DisplayNumber(vDadosIni.vProduto.Precos.DigMrkMrg))
    .dataSet.FieldByName('tabela').OnGetText := DataSetGetText;
    Filtrar;
  end;

end;

procedure TfrmCadProdutosHistPreco.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

procedure TfrmCadProdutosHistPreco.btHideClick(Sender: TObject);
begin
  inherited;
  produtoPanel.Height := produtoPanel.Tag;
  Splitter1.Visible := False;
  gridProdutoPanel.Visible := False;

  btShow.Visible := True;
  btHide.Visible := False;
end;

procedure TfrmCadProdutosHistPreco.btNextClick(Sender: TObject);
begin
  inherited;
  produto.Next;
  btNext.Visible := not produto.dataSet.Eof;
end;

procedure TfrmCadProdutosHistPreco.btPreviusClick(Sender: TObject);
begin
  inherited;
  produto.Prior;
  btPrevius.Visible := not produto.dataSet.Bof;
end;

procedure TfrmCadProdutosHistPreco.btShowClick(Sender: TObject);
begin
  inherited;
  produtoPanel.Height := produtoPanel.Tag + 100;
  Splitter1.Visible := True;
  gridProdutoPanel.Visible := True;

  btHide.Left := btShow.Left;
  btHide.Visible := True;
  btShow.Visible := False;
end;

procedure TfrmCadProdutosHistPreco.ckTodasEmpresasClick(Sender: TObject);
begin
  inherited;
  historico.todasEmpresas := ckTodasEmpresas.Checked;
  RegistroWin.Write(Self.Name, ckTodasEmpresas.Name, historico.todasEmpresas);
end;

procedure TfrmCadProdutosHistPreco.edDataFimExit(Sender: TObject);
begin
  inherited;
  historico.dataFim := StrToDate(edDataFim.Text);
  RegistroWin.Write(Self.Name, edDataFim.Name, historico.dataFim);
end;

procedure TfrmCadProdutosHistPreco.eddataIniExit(Sender: TObject);
begin
  inherited;
  historico.dataIni := StrToDate(eddataIni.Text);
  RegistroWin.Write(Self.Name, eddataIni.Name, historico.dataIni);
end;

procedure TfrmCadProdutosHistPreco.edQtdeChange(Sender: TObject);
begin
  if not Assigned(historico) then
    Exit;

  historico.quantidade := edQtde.AsValue;
  RegistroWin.Write(Self.Name, edQtde.Name, edQtde.AsValue);
end;

procedure TfrmCadProdutosHistPreco.edTabelaChange(Sender: TObject);
begin
  if not Assigned(historico) then
    Exit;

  historico.tabela := edTabela.Text;
  RegistroWin.Write(Self.Name, edTabela.Name, edTabela.Text);
end;

procedure TfrmCadProdutosHistPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  historico.Free;

  frmCadProdutosHistPreco := nil;
  Action := caFree;
end;

procedure TfrmCadProdutosHistPreco.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadProdutosHistPreco.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;

//  lbCodigo.Caption := Self.codigo;
//  lbDescricao.Caption := Self.descricao;
  produtoPanel.Height := produtoPanel.Tag;
//  lbCodigo.Caption := Format('Grupo %d  Código: %s  - Num fab: %s', [produto.fint('grupo_prod'), produto.fstr('cod_prod'), produto.fstr('num_fab_prod')]);
//  lbDescricao.Caption := produto.fstr('descr_prod');
  gridProduto.DataSource := produto._dataSourceOOP;
  for I := 0 to Self.ComponentCount - 1 do
    if Self.Components[I] is TDBText then
      (Self.Components[I] as TDBText).DataSource := produto._dataSourceOOP;

  DBText37.Visible := Self.markMargVisiveis;
  DBText38.Visible := Self.markMargVisiveis;
  DBText39.Visible := Self.markMargVisiveis;
  DBText40.Visible := Self.markMargVisiveis;

  DBText42.Visible := Self.markMargVisiveis;
  DBText43.Visible := Self.markMargVisiveis;
  DBText44.Visible := Self.markMargVisiveis;
  DBText45.Visible := Self.markMargVisiveis;

  DBText47.Visible := Self.markMargVisiveis;
  DBText48.Visible := Self.markMargVisiveis;
  DBText49.Visible := Self.markMargVisiveis;
  DBText50.Visible := Self.markMargVisiveis;
  DBText51.Visible := Self.markMargVisiveis;

  DBText53.Visible := Self.markMargVisiveis;
  DBText54.Visible := Self.markMargVisiveis;
  DBText55.Visible := Self.markMargVisiveis;
  DBText56.Visible := Self.markMargVisiveis;
  DBText57.Visible := Self.markMargVisiveis;

  DBText59.Visible := Self.markMargVisiveis;
  DBText60.Visible := Self.markMargVisiveis;
  DBText61.Visible := Self.markMargVisiveis;
  DBText62.Visible := Self.markMargVisiveis;
  DBText63.Visible := Self.markMargVisiveis;

  DBText65.Visible := Self.markMargVisiveis;
  DBText66.Visible := Self.markMargVisiveis;

  btShow.Visible := produto.dataSet.State = dsBrowse;
  btPrevius.Visible := btShow.Visible and (not produto.dataSet.Bof);
  btNext.Visible := btShow.Visible and (not produto.dataSet.Eof);

  historico := THistoricoPrecos.Create(produto.fint('grupo_prod'), produto.fstr('cod_prod'));//Self.grupo, Self.codprod);
  gridHistorico.DataSource := historico._dataSourceOOP;

  ckTodasEmpresas.Checked := RegistroWin.Read(Self.Name, ckTodasEmpresas.Name, False);
  eddataIni.Text := DateToStr(Date - 30);//DateToStr(RegistroWin.Read(Self.Name, eddataIni.Name, Date - 30));
  edDataFim.Text := DateToStr(Date);
  edQtde.AsValue := RegistroWin.Read(Self.Name, edQtde.Name, 0.0);
  edTabela.Text := RegistroWin.Read(Self.Name, edTabela.Name, '');

  if produto.dataSet.State = dsBrowse then
    produto.dataSet.AfterScroll := ProdutoDataSetAfterScroll;

  historico.quantidade := edQtde.AsValue;
  historico.tabela := edTabela.Text;
  historico.todasEmpresas := ckTodasEmpresas.Checked;
  historico.dataIni := StrToDateDef(eddataIni.Text, Date - 30);
  historico.dataFim := StrToDateDef(edDataFim.Text, Date);

  for I := 0 to gridHistorico.Columns.Count - 1 do
    if MatchText(gridHistorico.Columns[I].FieldName, ['custo'])  then           
      gridHistorico.Columns[I].Visible := Self.custoVisivel
    else if MatchText(gridHistorico.Columns[I].FieldName, ['markup', 'margem'])  then
      gridHistorico.Columns[I].Visible := Self.markMargVisiveis;
end;

procedure TfrmCadProdutosHistPreco.gridHistoricoTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(gridHistorico, Column);
end;

procedure TfrmCadProdutosHistPreco.gridProdutoTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(gridProduto, Column);
end;

procedure TfrmCadProdutosHistPreco.ProdutoDataSetAfterScroll(DataSet: TDataSet);
begin
  historico.SetGrupoCodigo(produto.fint('grupo_prod'), produto.fstr('cod_prod'));
  
  btPrevius.Visible := not produto.dataSet.Bof;
  btNext.Visible := not produto.dataSet.Eof;
end;

end.
