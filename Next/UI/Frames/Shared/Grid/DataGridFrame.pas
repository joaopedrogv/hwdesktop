unit DataGridFrame;

interface

uses
  Vcl.Forms, Vcl.Graphics, Vcl.Controls, Vcl.Buttons, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBGrids, Vcl.Menus, System.Classes, System.SysUtils, System.Types,
  System.UITypes, Data.DB, QueryResultOperations;

type
  TfrmDataGridFrame = class(TFrame)
    pnComandos: TPanel;
    pnMarcacao: TPanel;
    btnSelecionarTodos: TSpeedButton;
    btnDesmarcarTodos: TSpeedButton;
    btnInverterSelecao: TSpeedButton;
    btnMaisFiltro: TSpeedButton;
    lblFiltroRapido: TLabel;
    spFiltro: TSplitter;
    dbgDados: TDBGrid;
    pmCelula: TPopupMenu;
    miFiltrarValor: TMenuItem;
    pmFiltro: TPopupMenu;
    miRemoverFiltro: TMenuItem;
    procedure DrawCheckboxCell(const Rect: TRect;
      const State: TGridDrawState; AState: Boolean);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgDadosCellClick(Column: TColumn);
    procedure btnSelecionarTodosClick(Sender: TObject);
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure btnInverterSelecaoClick(Sender: TObject);
    procedure dbgDadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgDadosMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure miFiltrarValorClick(Sender: TObject);
    procedure btnMaisFiltroClick(Sender: TObject);
    procedure miRemoverFiltroClick(Sender: TObject);
  private
    FMarkingColumn: string;
    FOperations: IQueryResultOperations;
    FQuickFilterEnabled: Boolean;
    FQuickFilterColumnName: string;

    function GetDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    function MarkingActive(): Boolean;
    function MarkingEnabled(): Boolean;
    function QuickFilterAvailable(): Boolean;
    function QuickFilterField(): TField;
    procedure UpdateCommandBandLayout();
    procedure DoMarkOperation(AOperation: TMarkOperation);
  public
    procedure Configure(AOperations: IQueryResultOperations = nil;
      AQuickFilterEnabled: Boolean = False);
    // Remove o criterio rapido sem alterar as marcacoes. Usado pela tela antes
    // de cada pesquisa, para o novo resultado comecar completo.
    procedure ClearQuickFilter();
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

implementation

uses
  Winapi.Windows;

{$R *.dfm}

const
  QuickFilterTitle = 'Filtro r'#225'pido';
  QuickFilterFailureMessage =
    'N'#227'o foi poss'#237'vel filtrar pelo valor selecionado.';

type
  // Acesso as coordenadas de celula da grade. MouseCoord e protegido; o
  // descendente local identifica a coluna sob o mouse sem forcar a coluna 0
  // nem alterar a linha atual.
  TDBGridCellAccess = class(TDBGrid)
  public
    function ColumnAt(const X, Y: Integer): TColumn;
  end;

function TDBGridCellAccess.ColumnAt(const X, Y: Integer): TColumn;
var
  Cell: TGridCoord;
  DataCol: Integer;
begin
  Result := nil;
  Cell := MouseCoord(X, Y);
  if (Cell.Y < 0) or (Cell.X < IndicatorOffset) then
    Exit;

  // A linha de titulos nao representa um valor de dados.
  if (dgTitles in Options) and (Cell.Y = 0) then
    Exit;

  DataCol := Cell.X - IndicatorOffset;
  if (DataCol < 0) or (DataCol >= Columns.Count) then
    Exit;

  Result := Columns[DataCol];
end;

function TfrmDataGridFrame.GetDataSource: TDataSource;
begin
  Result := dbgDados.DataSource;
end;

function TfrmDataGridFrame.MarkingActive: Boolean;
begin
  Result := (FMarkingColumn <> '')
    and (FOperations <> nil)
    and (dbgDados.DataSource <> nil)
    and (dbgDados.DataSource.DataSet <> nil)
    and dbgDados.DataSource.DataSet.Active;
end;

function TfrmDataGridFrame.MarkingEnabled: Boolean;
begin
  // Configuracao de marcacao independente de o conjunto estar carregado.
  Result := (FMarkingColumn <> '') and (FOperations <> nil);
end;

function TfrmDataGridFrame.QuickFilterAvailable: Boolean;
begin
  Result := FQuickFilterEnabled
    and (FOperations <> nil)
    and (dbgDados.DataSource <> nil)
    and (dbgDados.DataSource.DataSet <> nil)
    and dbgDados.DataSource.DataSet.Active;
end;

function TfrmDataGridFrame.QuickFilterField: TField;
begin
  Result := nil;
  if not QuickFilterAvailable() then
    Exit;
  if (FQuickFilterColumnName = '')
    or SameText(FQuickFilterColumnName, FMarkingColumn) then
    Exit;

  Result := dbgDados.DataSource.DataSet.FindField(FQuickFilterColumnName);
end;

procedure TfrmDataGridFrame.UpdateCommandBandLayout;
var
  MarkingOn: Boolean;
  FilterOn: Boolean;
begin
  MarkingOn := MarkingEnabled();
  FilterOn := (FOperations <> nil) and FOperations.QuickFilterActive();

  // Os botoes de marcacao formam um bloco unico para que o alinhamento a
  // esquerda nao os reordene ao alternar entre os estados da faixa.
  pnMarcacao.Visible := MarkingOn;

  btnMaisFiltro.Visible := FilterOn;
  lblFiltroRapido.Visible := FilterOn;
  spFiltro.Visible := FilterOn;

  if FilterOn then
    lblFiltroRapido.Caption := 'Filtro: ' + FOperations.QuickFilterDescription()
  else
    lblFiltroRapido.Caption := '';

  pnComandos.Visible := MarkingOn or FilterOn;
  Realign;
end;

procedure TfrmDataGridFrame.SetDataSource(const Value: TDataSource);
begin
  // Uma nova origem de dados comeca sem criterio rapido; a faixa do resultado
  // anterior nao sobrevive a troca do conjunto.
  ClearQuickFilter();
  FQuickFilterColumnName := '';
  dbgDados.DataSource := Value;
end;

procedure TfrmDataGridFrame.btnDesmarcarTodosClick(Sender: TObject);
begin
  DoMarkOperation(moUnmarkAll);
end;

procedure TfrmDataGridFrame.btnInverterSelecaoClick(Sender: TObject);
begin
  DoMarkOperation(moInvertAll);
end;

procedure TfrmDataGridFrame.btnSelecionarTodosClick(Sender: TObject);
begin
  DoMarkOperation(moMarkAll);
end;

procedure TfrmDataGridFrame.Configure(AOperations: IQueryResultOperations = nil;
  AQuickFilterEnabled: Boolean = False);
begin
  FOperations := AOperations;
  FQuickFilterEnabled := AQuickFilterEnabled;
  FQuickFilterColumnName := '';

  if FOperations <> nil then
    FMarkingColumn := FOperations.MarkingColumnName()
  else
    FMarkingColumn := '';

  // Marcacao e filtro rapido sao independentes. A coluna SEL controla apenas os
  // comandos de marcacao e nao e elegivel para o filtro.
  // Uma nova configuracao comeca sem criterio rapido e recalcula a faixa.
  ClearQuickFilter();
  UpdateCommandBandLayout();
end;

procedure TfrmDataGridFrame.ClearQuickFilter;
begin
  // Retira somente o criterio rapido; as marcacoes existentes sao preservadas.
  if FOperations <> nil then
    FOperations.ClearQuickFilter();
  UpdateCommandBandLayout();
  dbgDados.Invalidate();
end;

procedure TfrmDataGridFrame.dbgDadosMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y,
  HitTest: Integer; var MouseActivate: TMouseActivate);
var
  Column: TColumn;
begin
  // O evento dbgDadosMouseDown não responde no formulario, por isso o uso desse evento substituto
  if Button <> mbRight then
    Exit;

  miFiltrarValor.Enabled := False;
  FQuickFilterColumnName := '';
  Column := TDBGridCellAccess(dbgDados).ColumnAt(X, Y);
  if (Column = nil) or (Column.Field = nil) then
    Exit;

  FQuickFilterColumnName := Column.FieldName;
  miFiltrarValor.Enabled := QuickFilterField() <> nil;
end;

procedure TfrmDataGridFrame.miFiltrarValorClick(Sender: TObject);
var
  DataField: TField;
begin
  DataField := QuickFilterField();
  if DataField = nil then
    Exit;

  if FOperations.ApplyQuickFilter(DataField) then
  begin
    UpdateCommandBandLayout();
    dbgDados.Invalidate();
  end
  else
    Application.MessageBox(PChar(QuickFilterFailureMessage),
      PChar(QuickFilterTitle), MB_OK or MB_ICONWARNING);
end;

procedure TfrmDataGridFrame.btnMaisFiltroClick(Sender: TObject);
var
  PopupPoint: TPoint;
begin
  // O menu e aberto pelo clique; nao ha OnPopup para preservar a ligacao RLINK32.
  PopupPoint := btnMaisFiltro.ClientToScreen(Point(0, btnMaisFiltro.Height));
  pmFiltro.Popup(PopupPoint.X, PopupPoint.Y);
end;

procedure TfrmDataGridFrame.miRemoverFiltroClick(Sender: TObject);
begin
  ClearQuickFilter();
end;

procedure TfrmDataGridFrame.dbgDadosCellClick(Column: TColumn);
begin
  if Column.FieldName = FMarkingColumn then
    DoMarkOperation(moToggle);
end;

procedure TfrmDataGridFrame.dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  MarkField: TField;
begin
  if (FMarkingColumn = '') or (Column = nil) then
    Exit;
  if not SameText(Column.FieldName, FMarkingColumn) then
    Exit;

  MarkField := Column.Field;
  if MarkField = nil then
    Exit;

  DrawCheckboxCell(Rect, State, not MarkField.IsNull and MarkField.AsBoolean);
end;

procedure TfrmDataGridFrame.dbgDadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_SPACE) and (Shift = []) and MarkingActive then
  begin
    DoMarkOperation(moToggle);
    Key := 0;
  end;
end;

procedure TfrmDataGridFrame.DoMarkOperation(AOperation: TMarkOperation);
var
  dset: TDataSet;
begin
  if not MarkingActive then
    Exit;

  dset := dbgDados.DataSource.DataSet;
  dbgDados.DataSource.DataSet := nil;
  try
    case AOperation of
      moMarkAll  : FOperations.MarkAll();
      moUnmarkAll: FOperations.UnmarkAll();
      moInvertAll: FOperations.InverterAllMarks();
      moToggle   : FOperations.ToggleCurrentMark();
    end;
  finally
    dbgDados.DataSource.DataSet := dset;
  end;
end;

procedure TfrmDataGridFrame.DrawCheckboxCell(const Rect: TRect;
  const State: TGridDrawState; AState: Boolean);
var
  Marked: Boolean;
  R: TRect;
  Flags: Cardinal;
begin
  if gdSelected in State then
    dbgDados.Canvas.Brush.Color := clHighlight
  else
    dbgDados.Canvas.Brush.Color := dbgDados.Color;
  dbgDados.Canvas.Brush.Style := bsSolid;
  dbgDados.Canvas.FillRect(Rect);

  Marked := AState;
  R := Rect;
  InflateRect(R, -2, -2);
  Flags := DFCS_BUTTONCHECK;
  if Marked then
    Flags := Flags or DFCS_CHECKED;
  DrawFrameControl(dbgDados.Canvas.Handle, R, DFC_BUTTON, Flags);

  if gdFocused in State then
    dbgDados.Canvas.DrawFocusRect(Rect);
end;

end.
