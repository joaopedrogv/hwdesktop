unit uAutorizacaoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, 
  DBClient, IBDatabase, Menus;

type
  TfrmAutorizacaoFinanceiro = class(TfrmPadrao)
    Panel1: TPanel;
    pnTitulo: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edDataIni: TMaskEdit;
    edDataFim: TMaskEdit;
    btPesquisar: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    gridVendas: TDBGrid;
    btAutorizarSelecionadas: TBitBtn;
    btAutorizarTodas: TBitBtn;
    btVoltar: TBitBtn;
    rbNomeFantasia: TRadioButton;
    rbRazaoSocial: TRadioButton;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    btNaoAutorizarSelecionados: TBitBtn;
    ckAutorizados: TCheckBox;
    btNaoAutorizarTodos: TBitBtn;
    btSituacaoDeCaixa: TSpeedButton;
    pnFinancAut: TPanel;
    pnLimiteEstou: TPanel;
    pnFinancNaoAut: TPanel;
    pnDebitoAtraso: TPanel;
    GroupBoxVendas: TGroupBox;
    ScrollBoxVendas: TScrollBox;
    PopupMenuVendas: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    SpeedButton55: TSpeedButton;
    procedure SpeedButton55Click(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure gridVendasColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure btSituacaoDeCaixaClick(Sender: TObject);
    procedure gridVendasTitleClick(Column: TColumn);
    procedure gridVendasDblClick(Sender: TObject);
    procedure rbNomeFantasiaClick(Sender: TObject);
    procedure btNaoAutorizarSelecionadosClick(Sender: TObject);
    procedure btNaoAutorizarTodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btVoltarClick(Sender: TObject);
    procedure btAutorizarTodasClick(Sender: TObject);
    procedure btAutorizarSelecionadasClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure gridVendasMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridVendasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridVendasCellClick(Column: TColumn);
    procedure gridVendasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutorizacaoFinanceiro: TfrmAutorizacaoFinanceiro;

  PrimeiraPesquisa: Boolean;
  TemColunasComPosicaoAlteradas: Boolean;
  vConfigColuna : boolean;
  campoPesquisa: string;
  cdsColunas: TClientDataSet;

  cdsGrid: TClientDataSet;
  GridCfg: TDBGrid;
  ListGridsAndDataSets: TStrings;
  ListPositions: TStrings;

  trans: TIBTransaction;
  vTabela, vCampoPadrao: string;
  fReset, vCtrlClick, vShiftClick: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt,vAlterarNomeDtSet, usuario: string;
  vCamposPadraoRegistro: Boolean;

implementation

uses uDtmPedVenda, uDtmAtivo, UClassesPedVenda, DBTables, Clipbrd;

{$R *.dfm}

procedure TfrmAutorizacaoFinanceiro.btNaoAutorizarTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    autorizacaoFinanceiro.autorizarOuNaoAutorizarPedidos(False, False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAutorizacaoFinanceiro.btAutorizarSelecionadasClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    autorizacaoFinanceiro.autorizarOuNaoAutorizarPedidos(True, True);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAutorizacaoFinanceiro.btAutorizarTodasClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    autorizacaoFinanceiro.autorizarOuNaoAutorizarPedidos(True, False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAutorizacaoFinanceiro.btNaoAutorizarSelecionadosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    autorizacaoFinanceiro.autorizarOuNaoAutorizarPedidos(False, True);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAutorizacaoFinanceiro.btPesquisarClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    autorizacaoFinanceiro.pesquisa(edDataIni.Text, edDataFim.Text, ckAutorizados.Checked, rbRazaoSocial.Checked);

    if ckAutorizados.Checked then
    begin
//      btNaoAutorizarSelecionados.Enabled := True;
//      btNaoAutorizarTodos.Enabled := True;
//      btAutorizarSelecionadas.Enabled := False;
//      btAutorizarTodas.Enabled := False;
      pnTitulo.Caption := 'Pedidos autorizados pelo financeiro';
    end
    else
    begin
//      btNaoAutorizarSelecionados.Enabled := False;
//      btNaoAutorizarTodos.Enabled := False;
//      btAutorizarSelecionadas.Enabled := True;
//      btAutorizarTodas.Enabled := True;
      pnTitulo.Caption := 'Pedidos aguardando autorização ou não autorizados';
    end;

    if (Self.Enabled) and (Self.Visible) and (gridVendas.CanFocus) then
      gridVendas.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAutorizacaoFinanceiro.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    autorizacaoFinanceiro.marcaDesmarcaLinha(True);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAutorizacaoFinanceiro.btSituacaoDeCaixaClick(Sender: TObject);
begin
  inherited;
  autorizacaoFinanceiro.situacaoFinanceiraCliente;
end;

procedure TfrmAutorizacaoFinanceiro.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    autorizacaoFinanceiro.marcaDesmarcaLinha(True, False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmAutorizacaoFinanceiro.btVoltarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmAutorizacaoFinanceiro.Configurarcolunas1Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas, gridVendas, GridCfg, cdsGrid, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
end;

procedure TfrmAutorizacaoFinanceiro.Copiarparareadetransferncia1Click(
  Sender: TObject);
begin
  inherited;
	Clipboard.AsText := gridVendas.DataSource.DataSet.FieldByName(gridVendas.Columns[gridVendas.SelectedIndex].FieldName).AsString;
end;

procedure TfrmAutorizacaoFinanceiro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if not Assigned(gridVendas.DataSource) then
    Exit;
  if not Assigned(gridVendas.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(gridVendas, GridCfg, cdsGrid,
      cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);

  if TemColunasComPosicaoAlteradas then
  	vDadosIni.restoreDataSetDefaultCadPadrao(gridVendas, GridCfg, true, ListPositions, cdsGrid);

  _GravaConfiguracoesBoolean(rbRazaoSocial.Name, rbRazaoSocial.Checked);
  _GravaConfiguracoesBoolean(ckAutorizados.Name, ckAutorizados.Checked);

  FreeAndNil(autorizacaoFinanceiro);

  Action := caFree;
  frmAutorizacaoFinanceiro := nil;
end;

procedure TfrmAutorizacaoFinanceiro.FormCreate(Sender: TObject);
begin

  autorizacaoFinanceiro := TPedidosAutorizacaoFinanceiro.create;

  inherited;

end;

procedure TfrmAutorizacaoFinanceiro.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F2) then
    btSelectAll.Click
  else if (Key = VK_F4) then
    btUnSelectAll.Click
  else if (Key = VK_F6) then
    btSituacaoDeCaixa.Click;
end;

procedure TfrmAutorizacaoFinanceiro.FormShow(Sender: TObject);
begin
  inherited;

  if not Self.Enabled then
    Exit;

  vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet, GridCfg, gridVendas, cdsGrid, cdsColunas, trans, ListGridsAndDataSets,
      ListPositions, nomeDTSEt, PrimeiraPesquisa, vCamposPadraoRegistro, usuario);

  gridVendas.DataSource := DtmPedVenda.dsAprovaFin;
  rbNomeFantasia.Checked := True;
  rbRazaoSocial.Checked := _LerConfiguracoesRegistroBoolean(rbRazaoSocial.Name);
  ckAutorizados.Checked := _LerConfiguracoesRegistroBoolean(ckAutorizados.Name);
  edDataIni.Text :=  DateToStr(date);
  edDataFim.Text := DateToStr(date);

  rbNomeFantasiaClick(rbNomeFantasia);

  autorizacaoFinanceiro.pesquisa(edDataIni.Text, edDataFim.Text, ckAutorizados.Checked, rbRazaoSocial.Checked);
  
  if ckAutorizados.Checked then
  begin
//    btNaoAutorizarSelecionados.Enabled := True;
//    btNaoAutorizarTodos.Enabled := True;
//    btAutorizarSelecionadas.Enabled := False;
//    btAutorizarTodas.Enabled := False;
    pnTitulo.Caption := 'Pedidos autorizados pelo financeiro';
  end
  else
  begin
//    btNaoAutorizarSelecionados.Enabled := False;
//    btNaoAutorizarTodos.Enabled := False;
//    btAutorizarSelecionadas.Enabled := True;
//    btAutorizarTodas.Enabled := True;
    pnTitulo.Caption := 'Pedidos aguardando autorização ou não autorizados';
  end;

  if PrimeiraPesquisa then
  begin
    PrimeiraPesquisa := False;
    vDadosIni.configurarGridPeloConfigColunas(gridVendas, GridCfg, cdsGrid, cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  end;
end;

procedure TfrmAutorizacaoFinanceiro.gridVendasCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    autorizacaoFinanceiro.marcaDesmarcaLinha;
end;

procedure TfrmAutorizacaoFinanceiro.gridVendasColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  inherited;
	vDadosIni.salvarGridNoConfigColunasCadPadrao(GridVendas, GridCfg, cdsGrid,
    cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  TemColunasComPosicaoAlteradas := True;
end;

procedure TfrmAutorizacaoFinanceiro.gridVendasDblClick(Sender: TObject);
begin
  inherited;
  autorizacaoFinanceiro.marcaDesmarcaLinha;
end;

procedure TfrmAutorizacaoFinanceiro.gridVendasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if autorizacaoFinanceiro.dataSet.FieldByName('AUTORIZADO_FINANCEIRO').AsString = 'S' then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := $00B7B700;
      TDBGrid(sender).canvas.Font.color := $004080FF;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := $00B7B700;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if autorizacaoFinanceiro.dataSet.FieldByName('AUTORIZADO_FINANCEIRO').AsString = 'N' then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := $004080FF;
      TDBGrid(sender).canvas.Font.color := clYellow;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := $004080FF;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if autorizacaoFinanceiro.dataSet.FieldByName('sel').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;

  if ((Column.FieldName = 'LIMITE_CREDITO')
    	or (Column.FieldName = 'VALOR_DEBITO')
      or (Column.FieldName = 'VALOR_TOTAL')) then
  begin
  	if autorizacaoFinanceiro.dataSet.FieldByName('LIMITE_ESTOURADO').AsString = 'S' then
    begin
      if (gdFocused in State) then
        TDBGrid(sender).Canvas.brush.Color := $0097FFFF
      else
	    	TDBGrid(sender).Canvas.brush.Color := $0097FFFF;
      TDBGrid(sender).canvas.Font.color := clWindowText;

      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
	end;

  if (Column.FieldName = 'VALOR_DEBITO_ATRASO_CAR') then
  begin
  	if autorizacaoFinanceiro.dataSet.FieldByName('VALOR_DEBITO_ATRASO_CAR').AsFloat > 0 then
    begin
       if (gdFocused in State) then
        TDBGrid(sender).Canvas.brush.Color := $008080FF
      else
	    	TDBGrid(sender).Canvas.brush.Color := $008080FF;
      TDBGrid(sender).canvas.Font.color := clWindowText;

      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;

  if (Column.FieldName = 'VALOR_DEBITO_ATRASO') then
  begin
  	if autorizacaoFinanceiro.dataSet.FieldByName('VALOR_DEBITO_ATRASO').AsFloat > 0 then
    begin
       if (gdFocused in State) then
        TDBGrid(sender).Canvas.brush.Color := $008080FF
      else
	    	TDBGrid(sender).Canvas.brush.Color := $008080FF;
      TDBGrid(sender).canvas.Font.color := clWindowText;

      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if (Column.FieldName = 'BARRADO') and (autorizacaoFinanceiro.dataSet.FieldByName('BARRADO').AsString = 'Sim') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmAutorizacaoFinanceiro.gridVendasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if not autorizacaoFinanceiro.dataSet.IsEmpty then
      autorizacaoFinanceiro.marcaDesmarcaLinha;
end;

procedure TfrmAutorizacaoFinanceiro.gridVendasMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    autorizacaoFinanceiro.marcaDesmarcaLinha;
end;

procedure TfrmAutorizacaoFinanceiro.gridVendasTitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(gridVendas, Column);
end;

procedure TfrmAutorizacaoFinanceiro.rbNomeFantasiaClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if rbNomeFantasia.Checked then
    for I := 0 to gridVendas.Columns.Count - 1 do
      if gridVendas.Columns[i].FieldName = 'RAZAO' then
        gridVendas.Columns[i].FieldName := 'NOME_CLIENTE';

  if rbRazaoSocial.Checked then
    for I := 0 to gridVendas.Columns.Count - 1 do
      if gridVendas.Columns[i].FieldName = 'NOME_CLIENTE' then
        gridVendas.Columns[i].FieldName := 'RAZAO';
end;

procedure TfrmAutorizacaoFinanceiro.ReajustarLarguradascolunas1Click(
  Sender: TObject);
begin
  inherited;
	vDadosIni.AjustaLaguraColunasCadPadrao(gridVendas);
end;

procedure TfrmAutorizacaoFinanceiro.ResetarConfiguraesdecolunas1Click(
  Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(gridVendas, GridCfg, cdsColunas, cdsGrid, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets, false, ListPositions);
end;

procedure TfrmAutorizacaoFinanceiro.SalvardadosnoExcel1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, gridVendas, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TfrmAutorizacaoFinanceiro.Somarvaloresdacoluna1Click(Sender: TObject);
begin
  inherited;
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(gridVendas, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TfrmAutorizacaoFinanceiro.SpeedButton55Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('aut_fin_%', autorizacaoFinanceiro.buscas);
end;

initialization
  RegisterClass(TfrmAutorizacaoFinanceiro);
finalization
  UnRegisterClass(TfrmAutorizacaoFinanceiro);

end.
