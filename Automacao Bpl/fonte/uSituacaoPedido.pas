unit uSituacaoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls, Mask, DBCtrls, Menus;

type
  TfrmSituacaoPedido = class(TfrmPadrao)
    Panel1: TPanel;
    pnTitulo: TPanel;
    Panel4: TPanel;
    gridSituacao: TDBGrid;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edDataIni: TMaskEdit;
    edDataFim: TMaskEdit;
    btPesquisar: TBitBtn;
    rbNomeFantasia: TRadioButton;
    rbRazaoSocial: TRadioButton;
    ckAbertos: TCheckBox;
    pnDetalhes: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pnPedido: TPanel;
    PopupMenu1: TPopupMenu;
    Panel7: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    Label5: TLabel;
    DBText3: TDBText;
    pnFinanceiro: TPanel;
    Label10: TLabel;
    DBText8: TDBText;
    Label11: TLabel;
    DBText9: TDBText;
    Panel11: TPanel;
    pnSeparacao: TPanel;
    Label12: TLabel;
    DBText10: TDBText;
    Label13: TLabel;
    DBText11: TDBText;
    Panel13: TPanel;
    pnFaturamento: TPanel;
    Label15: TLabel;
    DBText13: TDBText;
    Label16: TLabel;
    DBText14: TDBText;
    Panel15: TPanel;
    pnExpedicao: TPanel;
    Label18: TLabel;
    DBText16: TDBText;
    Label19: TLabel;
    DBText17: TDBText;
    Panel17: TPanel;
    pnSaida: TPanel;
    Label22: TLabel;
    DBText20: TDBText;
    Panel19: TPanel;
    pnAcerto: TPanel;
    Label24: TLabel;
    DBText22: TDBText;
    Panel21: TPanel;
    PopupMenu2: TPopupMenu;
    Filtrar1: TMenuItem;
    Removerfiltro1: TMenuItem;
    N1: TMenuItem;
    ExportarparaExcel1: TMenuItem;
    procedure Filtrar1Click(Sender: TObject);
    procedure gridSituacaoTitleClick(Column: TColumn);
    procedure gridSituacaoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure rbNomeFantasiaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSituacaoPedido: TfrmSituacaoPedido;

implementation

uses uDtmPedVenda, UClassesPedVenda, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmSituacaoPedido.BitBtn1Click(Sender: TObject);
begin
  inherited;
  sitPedido.Close;
  sitPedido.Open;
end;

procedure TfrmSituacaoPedido.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSituacaoPedido.btPesquisarClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    sitPedido.pesquisa(edDataIni.Text, edDataFim.Text, ckAbertos.Checked, rbRazaoSocial.Checked);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSituacaoPedido.Filtrar1Click(Sender: TObject);
begin
  inherited;
//  if ActiveControl = gridSituacao then
//  begin
//    if sitPedido.dataSet.FieldByName(gridSituacao.SelectedField.FieldName).fias then
//
//    sitPedido.dataSet.Filter := gridSituacao.SelectedField.FieldName + ' = ' +
//  end;
//    criaComponente(DBGrid1.SelectedField.DisplayName, DBGrid1.SelectedField.Value)
end;

procedure TfrmSituacaoPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  _GravaConfiguracoesBoolean(rbRazaoSocial.Name, rbRazaoSocial.Checked);
  _GravaConfiguracoesBoolean(ckAbertos.Name, ckAbertos.Checked);

  FreeAndNil(sitPedido);

  Action := caFree;
  frmSituacaoPedido := nil;
end;

procedure TfrmSituacaoPedido.FormCreate(Sender: TObject);
begin
  if DtmPedVenda = nil then
    DtmPedVenda := TDtmPedVenda.create(DtmPedVenda);
  
  sitPedido := TSituacaoDosPedidos.create(DtmPedVenda);

  inherited;

end;

procedure TfrmSituacaoPedido.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  gridSituacao.DataSource := DtmPedVenda.dsSitPed;
  DBText1.DataSource  := DtmPedVenda.dsSitPed;
  DBText2.DataSource  := DtmPedVenda.dsSitPed;
  DBText3.DataSource  := DtmPedVenda.dsSitPed;
  DBText8.DataSource  := DtmPedVenda.dsSitPed;
  DBText9.DataSource  := DtmPedVenda.dsSitPed;
  DBText10.DataSource := DtmPedVenda.dsSitPed;
  DBText11.DataSource := DtmPedVenda.dsSitPed;
  DBText13.DataSource := DtmPedVenda.dsSitPed;
  DBText14.DataSource := DtmPedVenda.dsSitPed;
  DBText16.DataSource := DtmPedVenda.dsSitPed;
  DBText17.DataSource := DtmPedVenda.dsSitPed;
  DBText20.DataSource := DtmPedVenda.dsSitPed;
  DBText22.DataSource := DtmPedVenda.dsSitPed;

  rbNomeFantasia.Checked := True;
  rbRazaoSocial.Checked := _LerConfiguracoesRegistroBoolean(rbRazaoSocial.Name);
  ckAbertos.Checked := _LerConfiguracoesRegistroBoolean(ckAbertos.Name);
  edDataIni.Text :=  DateToStr(date);
  edDataFim.Text := DateToStr(date);

  rbNomeFantasiaClick(rbNomeFantasia);

  sitPedido.dataSet.FieldByName('Financeiro').Visible := True;
  sitPedido.dataSet.FieldByName('Separacao').Visible := True;
  sitPedido.dataSet.FieldByName('Expedicao').Visible := True;
  sitPedido.dataSet.FieldByName('Saida').Visible := True;
  sitPedido.dataSet.FieldByName('Acerto').Visible := True;
  if vDadosIni.vEmp.vCaixaIntegrado <> 'S' then
  begin
    sitPedido.dataSet.FieldByName('Financeiro').Visible := False;
    pnFinanceiro.Visible := False;
  end;
  if (vDadosIni.vEmp.vOC_UsarOrdemCarregamento <> 'D') and (vDadosIni.vEmp.vUSAR_SEPARACAO_PED <> 'S') then
  begin
    sitPedido.dataSet.FieldByName('Separacao').Visible := False;
    pnSeparacao.Visible := False;
  end;
  if Pos('S', vDadosIni.vEmp.vUsarConferenciaCegaSaida) = 0 then
  begin
    sitPedido.dataSet.FieldByName('Expedicao').Visible := False;
    pnExpedicao.Visible := False;
  end;
  if vDadosIni.vEmp.vOC_UsarOrdemCarregamento <> 'D' then
  begin
    sitPedido.dataSet.FieldByName('Saida').Visible := False;
    pnSaida.Visible := False;
  end;
  if vDadosIni.vEmp.vModoFaturamento <> 'S' then
  begin
    sitPedido.dataSet.FieldByName('Acerto').Visible := False;
    pnAcerto.Visible := False;
  end;

  for I := (gridSituacao.Columns.Count - 1) downto 0 do
    if not sitPedido.dataSet.FieldByName(gridSituacao.Columns[i].FieldName).Visible then
      gridSituacao.Columns[i].Visible := False;

  sitPedido.pesquisa(edDataIni.Text, edDataFim.Text, ckAbertos.Checked, rbRazaoSocial.Checked);

end;

procedure TfrmSituacaoPedido.gridSituacaoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  vField: string;
begin
  inherited;
  vField := '';
  if (Column.FieldName <> 'Pedido') and
    (Column.FieldName <> 'Financeiro') and
    (Column.FieldName <> 'Separacao') and
    (Column.FieldName <> 'Faturamento') and
    (Column.FieldName <> 'Expedicao') and
    (Column.FieldName <> 'Saida') and
    (Column.FieldName <> 'Acerto') then
    if (Trim(sitPedido.dataSet.FieldByName(Column.FieldName).AsString) = '') then
      Exit;

  if sitPedido.dataSet.FieldByName(Column.FieldName).AsString = 'Iniciado' then
  begin
    TDBGrid(sender).Canvas.Brush.Color := $00C1FFFF;
    TDBGrid(sender).canvas.Font.color := clWindowText;
  end
  else if sitPedido.dataSet.FieldByName(Column.FieldName).AsString = 'Nao Autorizado' then
    TDBGrid(sender).Canvas.Brush.Color := $009D93FF
  else if sitPedido.dataSet.FieldByName(Column.FieldName).AsString = 'Finalizado' then
    TDBGrid(sender).Canvas.Brush.Color := $0080FF00;
  TDBGrid(sender).Canvas.FillRect(Rect);
  TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);

end;

procedure TfrmSituacaoPedido.gridSituacaoTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(gridSituacao, Column);
end;

procedure TfrmSituacaoPedido.rbNomeFantasiaClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if rbNomeFantasia.Checked then
    for I := 0 to gridSituacao.Columns.Count - 1 do
      if gridSituacao.Columns[i].FieldName = 'RAZAO' then
        gridSituacao.Columns[i].FieldName := 'NOME_CLIENTE';

  if rbRazaoSocial.Checked then
    for I := 0 to gridSituacao.Columns.Count - 1 do
      if gridSituacao.Columns[i].FieldName = 'NOME_CLIENTE' then
        gridSituacao.Columns[i].FieldName := 'RAZAO';
end;

end.
