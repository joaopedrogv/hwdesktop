unit DataGridFrame;

interface

uses
  Vcl.Forms, Vcl.Graphics, Vcl.Controls, Vcl.Buttons, Vcl.Clipbrd, Vcl.Grids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBGrids, Vcl.Menus, System.Classes, System.SysUtils, System.Types,
  System.UITypes, System.Generics.Collections, Data.DB, FilterDefinition,
  FilterCriterion, FilterFrame, QueryResultOperations, GridColumnDefinition,
  ColumnSelectionFrame, ColumnLayoutPreferences;

type
  // Controles de um criterio na faixa. Os slots sao reaproveitados na ordem
  // dos criterios, evitando recriar a faixa inteira a cada remocao. O painel
  // agrupa botao e rotulo para que o splitter nao dispute o alinhamento a
  // esquerda com controles irmaos.
  TCriterionBandSlot = record
    Panel: TPanel;
    FilterPanel: TPanel;
    Button: TSpeedButton;
    CaptionLabel: TLabel;
    Splitter: TSplitter;
    Menu: TPopupMenu;
    AlterarItem: TMenuItem;
    MenuItem: TMenuItem;
  end;

  // Estado original do titulo de uma coluna ordenada. A legenda e o estilo sao
  // restaurados quando a coluna deixa de participar da ordem.
  TSortedColumnState = record
    FieldName: string;
    Caption: string;
    FontStyle: TFontStyles;
  end;

  // Ctrl+clique no titulo encaminha o campo da coluna para a tela, que decide
  // se o gesto prepara o filtro em vez de ordenar.
  TColumnTitleCtrlClickEvent = procedure(Sender: TObject;
    const AFieldName: string) of object;

  TfrmDataGridFrame = class(TFrame)
    pnComandos: TPanel;
    pnMarcacao: TPanel;
    pnCriterios: TPanel;
    btnSelecionarTodos: TSpeedButton;
    btnDesmarcarTodos: TSpeedButton;
    btnInverterSelecao: TSpeedButton;
    btnMaisFiltro: TSpeedButton;
    dbgDados: TDBGrid;
    pmCelula: TPopupMenu;
    miCopiar: TMenuItem;
    miFiltrarQuando: TMenuItem;
    miFiltrarValor: TMenuItem;
    miLimparFiltros1: TMenuItem;
    miReajustarColunas: TMenuItem;
    miConfigurarColunas: TMenuItem;
    miSalvarConfigColunas: TMenuItem;
    miRestaurarColunasPadrao: TMenuItem;
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
    procedure miCopiarClick(Sender: TObject);
    procedure miFiltrarQuandoClick(Sender: TObject);
    procedure miFiltrarValorClick(Sender: TObject);
    procedure miLimparFiltros1Click(Sender: TObject);
    procedure miReajustarColunasClick(Sender: TObject);
    procedure miConfigurarColunasClick(Sender: TObject);
    procedure miSalvarConfigColunasClick(Sender: TObject);
    procedure miRestaurarColunasPadraoClick(Sender: TObject);
    procedure dbgDadosExit(Sender: TObject);
    procedure dbgDadosTitleClick(Column: TColumn);
  private
    FMarkingColumn: string;
    FOperations: IQueryResultOperations;
    FQuickFilterEnabled: Boolean;
    FQuickFilterColumnName: string;
    FCriterionSlots: TList<TCriterionBandSlot>;
    FSortFields: TQuerySortFields;
    FSortedColumns: TArray<TSortedColumnState>;
    FObservedDataSet: TDataSet;
    FDataLink: TDataLink;
    FSuppressDataSetChange: Boolean;
    FOnTitleCtrlClick: TColumnTitleCtrlClickEvent;
    FOnFeedback: TFrameFeedbackEvent;
    // Definicoes recebidas da tela. Sao a fonte da lista de configuracao de
    // colunas, inclusive quando o conjunto esta vazio ou desvinculado.
    FColumnDefinitions: TGridColumnDefinitions;
    // Preferencias de layout fornecidas pela composicao. O frame nao conhece
    // banco, sessao nem SQL; apenas le e aplica o layout visual.
    FColumnLayoutPreferences: IColumnLayoutPreferences;
    // Largura original de cada coluna, alinhada a FColumnDefinitions, capturada
    // em ConfigureColumns e usada ao restaurar o padrao.
    FInitialColumnWidths: TArray<Integer>;

    function GetDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    function MarkingActive(): Boolean;
    function MarkingEnabled(): Boolean;
    function QuickFilterAvailable(): Boolean;
    function QuickFilterField(): TField;
    function CriteriaCount(): Integer;
    procedure EnsureCriterionSlot(AIndex: Integer);
    procedure UpdateCriterionControls();
    procedure UpdateCommandBandLayout();
    procedure DoMarkOperation(AOperation: TMarkOperation);
    procedure btnCriterioClick(Sender: TObject);
    procedure miAlterarCriterioClick(Sender: TObject);
    procedure miRemoverCriterioClick(Sender: TObject);
    function BuildQuickFilterDefinition: TFilterDefinition;
    function ShowQuickFilterModal(const ACaption: string;
      const ADefinition: TFilterDefinition;
      const ACriterion: TFilterCriterion;
      out AResult: TFilterCriterion): Boolean;
    procedure ShowQuickFilterMessage(const AMessage: string);
    function SortingAvailable(): Boolean;
    function IsSortableColumn(Column: TColumn): Boolean;
    function FindColumnByFieldName(const AFieldName: string): TColumn;
    function FindSortFieldIndex(const AFieldName: string): Integer;
    procedure ResetSortState();
    procedure RestoreSortedTitles();
    procedure ApplySortedTitles();
    function TryApplySort(const ASorts: TQuerySortFields): Boolean;
    procedure ObserveDataSetChange();
    function CopiaDisponivel: Boolean;
    procedure CopiarCelulaAtual;
    procedure ReajustarLarguraColunas;
    function IsMarkingColumn(const AFieldName: string): Boolean;
    function ColumnSelectionAvailable: Boolean;
    function BuildColumnSelectionEntries: TColumnSelectionEntries;
    procedure ApplyColumnSelection(const ASelection: TColumnSelectionResults);
    function PersistableColumn(const ADefinition: TGridColumnDefinition): Boolean;
    function ColumnLayoutAvailable: Boolean;
    function FindColumnDefinitionIndex(const AFieldName: string): Integer;
    function FindColumnLayoutEntryIndex(const AEntries: TColumnLayoutEntries;
      const AFieldName: string): Integer;
    function SortColumnLayoutEntries(
      const AEntries: TColumnLayoutEntries): TColumnLayoutEntries;
    function BuildColumnLayoutEntries: TColumnLayoutEntries;
    procedure ApplyColumnLayoutEntries(const AEntries: TColumnLayoutEntries);
    procedure ApplyColumnLayoutDefaults;
    procedure RestoreInitialColumnWidth(Column: TColumn;
      const ADefinitionIndex: Integer);
    procedure ReportarFeedback(const ATitulo, AMensagem: string);
    procedure ModalFeedback(Sender: TObject;
      const ATitulo, AMensagem: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // Marcacao, filtro rapido e ordenacao sao configuracoes independentes. A
    // ordenacao e automatica para toda coluna visivel cujo campo o conjunto
    // aceita ordenar; a coluna SEL nunca participa.
    procedure Configure(AOperations: IQueryResultOperations = nil;
      AQuickFilterEnabled: Boolean = False);
    // Cria as colunas a partir das definicoes e guarda os metadados que a
    // configuracao de colunas usa. A visibilidade inicial vem do comportamento;
    // a coluna de marcacao permanece sempre visivel.
    procedure ConfigureColumns(const AColumns: TGridColumnDefinitions);
    procedure AttachColumnLayout(const APreferences: IColumnLayoutPreferences);
    procedure ReloadColumnLayout;
    procedure SaveColumnLayout;
    procedure RestoreColumnLayoutDefaults;
    // Remove todos os criterios rapidos sem alterar as marcacoes. Usado pela
    // tela antes de cada pesquisa, para o novo resultado comecar completo.
    procedure ClearQuickFilters();
    // Retira a ordenacao exibida e devolve o conjunto corrente a ordem padrao da
    // consulta, preservando filtro, marcacoes e linha corrente.
    procedure ClearSorting();
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    // Campo da coluna clicada com Ctrl; a tela decide se prepara o filtro.
    property OnTitleCtrlClick: TColumnTitleCtrlClickEvent
      read FOnTitleCtrlClick write FOnTitleCtrlClick;
    property OnFeedback: TFrameFeedbackEvent
      read FOnFeedback write FOnFeedback;
  end;

implementation

uses
  Winapi.Windows, ColumnSelectionForm;

{$R *.dfm}

const
  QuickFilterTitle = 'Filtro r'#225'pido';
  QuickFilterFailureMessage =
    'N'#227'o foi poss'#237'vel filtrar pelo valor selecionado.';
  QuickFilterAddFailureMessage =
    'N'#227'o foi poss'#237'vel adicionar o filtro. Verifique se ele j'#225' est'#225' aplicado.';
  QuickFilterUpdateFailureMessage =
    'N'#227'o foi poss'#237'vel alterar o filtro. Verifique se ele j'#225' est'#225' aplicado.';
  QuickFilterMissingMessage =
    'O filtro selecionado n'#227'o est'#225' mais ativo.';
  QuickFilterInvalidMessage =
    'O filtro informado n'#227'o '#233' v'#225'lido.';
  CopyTitle = 'Copiar';
  CopyFailureMessage =
    'N'#227'o foi poss'#237'vel copiar o valor da c'#233'lula.';
  ColumnsTitle = 'Configurar colunas';
  ColumnsFailureMessage =
    'N'#227'o foi poss'#237'vel configurar as colunas.';
  ColumnsSaveTitle = 'Salvar configura'#231#227'o das colunas';
  ColumnsSaveFailureMessage =
    'N'#227'o foi poss'#237'vel salvar a configura'#231#227'o das colunas.';
  ColumnsRestoreTitle = 'Restaurar padr'#227'o das colunas';
  ColumnsRestoreFailureMessage =
    'N'#227'o foi poss'#237'vel restaurar a configura'#231#227'o padr'#227'o das colunas.';
  MissingColumnLayoutPreferencesMessage =
    'As prefer'#234'ncias de colunas n'#227'o foram informadas.';
  ColumnLayoutAlreadyAttachedMessage =
    'As prefer'#234'ncias de colunas j'#225' foram associadas a esta grade.';
  // Respiro horizontal somado a largura calculada, como no reajuste de colunas
  // do cadastro padrao legado.
  ColumnWidthPadding = 10;
  // Codigo da tecla C no atalho Ctrl+C da grade. A constante VK_C nao existe
  // na unit Winapi.Windows desta versao do compilador.
  KeyC = Ord('C');

type
  // Acesso as coordenadas de celula da grade. MouseCoord e protegido; o
  // descendente local identifica a coluna sob o mouse sem forcar a coluna 0
  // nem alterar a linha atual.
  TDBGridCellAccess = class(TDBGrid)
  public
    function ColumnAt(const X, Y: Integer): TColumn;
  end;

  // Observa a troca do conjunto para limpar a ordenacao exibida quando a tela
  // apresenta um novo resultado. O frame nao instala eventos na origem.
  TGridDataLink = class(TDataLink)
  private
    FFrame: TfrmDataGridFrame;
  protected
    procedure ActiveChanged; override;
  public
    constructor Create(AFrame: TfrmDataGridFrame);
  end;

constructor TGridDataLink.Create(AFrame: TfrmDataGridFrame);
begin
  inherited Create;
  FFrame := AFrame;
end;

procedure TGridDataLink.ActiveChanged;
begin
  inherited;
  if FFrame <> nil then
    FFrame.ObserveDataSetChange();
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

function QuickFilterMaskPolicy(
  const AValueType: TFilterFieldType): TFilterMaskPolicy;
begin
  // O modal usa a mesma mascara do frame de filtros: data completa para o
  // limite unico e data/hora completa para o intervalo.
  if AValueType = fftDateTime then
    Result := TFilterMaskPolicy.FromMasks(
      '!99/99/0000 99:99:99;1;_', '!99/99/0000 99:99:99;1;_', '')
  else if AValueType = fftDate then
    Result := TFilterMaskPolicy.DateMask
  else
    Result := TFilterMaskPolicy.None;
end;

constructor TfrmDataGridFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCriterionSlots := TList<TCriterionBandSlot>.Create;
  FDataLink := TGridDataLink.Create(Self);
end;

destructor TfrmDataGridFrame.Destroy;
var
  I: Integer;
begin
  if FDataLink <> nil then
  begin
    FDataLink.DataSource := nil;
    FDataLink.Free;
    FDataLink := nil;
  end;

  // Os menus pertencem ao frame; liberar antes dos controles evita referencias
  // pendentes. Painel, botao e rotulo pertencem a cadeia de pais do VCL e sao
  // destruidos por ela, sem liberacao duplicada aqui.
  if FCriterionSlots <> nil then
  begin
    for I := 0 to FCriterionSlots.Count - 1 do
    begin
      if FCriterionSlots[I].Button <> nil then
        FCriterionSlots[I].Button.PopupMenu := nil;
      if FCriterionSlots[I].Menu <> nil then
        FCriterionSlots[I].Menu.Free;
    end;
    FCriterionSlots.Free;
  end;
  inherited;
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

function TfrmDataGridFrame.CriteriaCount: Integer;
begin
  if FOperations <> nil then
    Result := FOperations.QuickFilterCount()
  else
    Result := 0;
end;

procedure TfrmDataGridFrame.EnsureCriterionSlot(AIndex: Integer);
var
  Slot: TCriterionBandSlot;
begin
  while FCriterionSlots.Count <= AIndex do
  begin
    Slot.Panel := TPanel.Create(pnCriterios);
    Slot.Panel.Parent := pnCriterios;
    Slot.Panel.Visible := False;
    Slot.Panel.Width := 150;
    Slot.Panel.Height := 30;
    Slot.Panel.BevelOuter := bvNone;
    Slot.Panel.AlignWithMargins := True;
    Slot.Panel.Margins.Top := 3;
    Slot.Panel.Margins.Bottom := 3;
    Slot.Panel.Align := alLeft;

    Slot.FilterPanel := TPanel.Create(Slot.Panel);
    Slot.FilterPanel.Parent := Slot.Panel;
    Slot.FilterPanel.Align := alClient;
    Slot.FilterPanel.AlignWithMargins := True;
    Slot.FilterPanel.Margins.Left := 3;
    Slot.FilterPanel.Margins.Top := 3;
    Slot.FilterPanel.Margins.Right := 3;
    Slot.FilterPanel.Margins.Bottom := 3;
    Slot.FilterPanel.BevelOuter := bvNone;

    Slot.Button := TSpeedButton.Create(Slot.FilterPanel);
    Slot.Button.Parent := Slot.FilterPanel;
    Slot.Button.Visible := False;
    Slot.Button.Width := 23;
    Slot.Button.Height := 18;
    Slot.Button.Align := alLeft;
    Slot.Button.AlignWithMargins := True;
    Slot.Button.Margins.Left := 3;
    Slot.Button.Margins.Top := 3;
    Slot.Button.Margins.Right := 3;
    Slot.Button.Margins.Bottom := 3;
    Slot.Button.Cursor := crHandPoint;
    Slot.Button.Flat := True;
    Slot.Button.ShowHint := True;
    Slot.Button.OnClick := btnCriterioClick;
    if btnMaisFiltro <> nil then
    begin
      Slot.Button.Glyph.Assign(btnMaisFiltro.Glyph);
      Slot.Button.NumGlyphs := btnMaisFiltro.NumGlyphs;
    end;

    Slot.CaptionLabel := TLabel.Create(Slot.FilterPanel);
    Slot.CaptionLabel.Parent := Slot.FilterPanel;
    Slot.CaptionLabel.Visible := False;
    Slot.CaptionLabel.Align := alClient;
    Slot.CaptionLabel.AlignWithMargins := True;
    Slot.CaptionLabel.Margins.Left := 3;
    Slot.CaptionLabel.Margins.Top := 3;
    Slot.CaptionLabel.Margins.Right := 3;
    Slot.CaptionLabel.Margins.Bottom := 3;
    Slot.CaptionLabel.AutoSize := False;
    Slot.CaptionLabel.EllipsisPosition := epEndEllipsis;
    Slot.CaptionLabel.Layout := tlCenter;
    Slot.CaptionLabel.ShowHint := True;

    Slot.Splitter := TSplitter.Create(pnCriterios);
    Slot.Splitter.Parent := pnCriterios;
    Slot.Splitter.Visible := False;
    // Slot.Splitter.Width := 5;
    // Slot.Splitter.Height := 36;
    // Slot.Splitter.MinSize := 60;
    // Slot.Splitter.ResizeStyle := rsUpdate;
    Slot.Splitter.Align := alLeft;
    Slot.Splitter.Left := Slot.Panel.Left + Slot.Panel.Width + 5;
    Slot.Splitter.Beveled := True;
    Slot.Splitter.AlignWithMargins := True;
    Slot.Splitter.Margins.Left := 0;
    Slot.Splitter.Margins.Right := 0;
    Slot.Splitter.Margins.Top := 6;
    Slot.Splitter.Margins.Bottom := 6;

    // O menu pertence ao slot e recebe o criterio corrente pelo Tag, sem
    // OnPopup para preservar a ligacao RLINK32.
    Slot.Menu := TPopupMenu.Create(Self);
    Slot.AlterarItem := TMenuItem.Create(Slot.Menu);
    Slot.AlterarItem.Caption := 'Alterar filtro';
    Slot.AlterarItem.OnClick := miAlterarCriterioClick;
    Slot.Menu.Items.Add(Slot.AlterarItem);
    Slot.MenuItem := TMenuItem.Create(Slot.Menu);
    Slot.MenuItem.Caption := 'Remover';
    Slot.MenuItem.OnClick := miRemoverCriterioClick;
    Slot.Menu.Items.Add(Slot.MenuItem);
    Slot.Button.PopupMenu := Slot.Menu;
    Slot.AlterarItem.Tag := 0;
    Slot.MenuItem.Tag := 0;

    FCriterionSlots.Add(Slot);
  end;
end;

procedure TfrmDataGridFrame.UpdateCriterionControls;
var
  I: Integer;
  Count: Integer;
  AId: Integer;
  Description: string;
  Slot: TCriterionBandSlot;
begin
  Count := CriteriaCount();

  // Cada linha da lista ocupa um slot proprio e mantem a ordem de insercao.
  for I := 0 to Count - 1 do
  begin
    EnsureCriterionSlot(I);
    AId := FOperations.QuickFilterId(I);
    Description := FOperations.QuickFilterDescription(AId);

    Slot := FCriterionSlots[I];
    Slot.Button.Tag := AId;
    if Description <> '' then
      Slot.Button.Hint := 'Remover filtro: ' + Description
    else
      Slot.Button.Hint := 'Remover filtro';
    Slot.Button.Visible := True;

    Slot.CaptionLabel.Caption := Description;
    Slot.CaptionLabel.Hint := Description;
    Slot.CaptionLabel.Visible := True;

    Slot.Panel.Visible := True;
    Slot.Splitter.Visible := True;
    Slot.AlterarItem.Tag := AId;
    Slot.MenuItem.Tag := AId;
  end;

  // Slots que excedem a quantidade atual ficam ocultos, mas preservados para
  // reutilizacao quando um novo criterio for inserido.
  for I := Count to FCriterionSlots.Count - 1 do
  begin
    Slot := FCriterionSlots[I];
    Slot.Button.Tag := 0;
    Slot.Button.Hint := '';
    Slot.Button.Visible := False;
    Slot.CaptionLabel.Caption := '';
    Slot.CaptionLabel.Hint := '';
    Slot.CaptionLabel.Visible := False;
    Slot.Panel.Visible := False;
    Slot.Splitter.Visible := False;
    Slot.AlterarItem.Tag := 0;
    Slot.MenuItem.Tag := 0;
  end;
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
  pnCriterios.Visible := FilterOn;

  UpdateCriterionControls();
  miLimparFiltros1.Enabled := FilterOn;

  pnComandos.Visible := MarkingOn or FilterOn;
  Realign;
end;

procedure TfrmDataGridFrame.SetDataSource(const Value: TDataSource);
begin
  // Uma nova origem de dados comeca sem criterios e sem ordenacao exibida; a
  // faixa e o titulo do resultado anterior nao sobrevivem a troca do conjunto.
  if FOperations <> nil then
    FOperations.ClearQuickFilters();
  FQuickFilterColumnName := '';
  ResetSortState();
  FObservedDataSet := nil;
  dbgDados.DataSource := Value;
  if FDataLink <> nil then
    FDataLink.DataSource := Value;
  UpdateCommandBandLayout();
end;

procedure TfrmDataGridFrame.btnCriterioClick(Sender: TObject);
var
  Button: TSpeedButton;
  PopupPoint: TPoint;
begin
  if not (Sender is TSpeedButton) then
    Exit;

  Button := TSpeedButton(Sender);
  if (Button.Tag = 0) or (Button.PopupMenu = nil) then
    Exit;

  // O menu e aberto pelo clique; o Tag do item identifica somente este
  // criterio e nao ha OnPopup para preservar a ligacao RLINK32.
  PopupPoint := Button.ClientToScreen(Point(0, Button.Height));
  Button.PopupMenu.Popup(PopupPoint.X, PopupPoint.Y);
end;

procedure TfrmDataGridFrame.miRemoverCriterioClick(Sender: TObject);
var
  AId: Integer;
begin
  if not (Sender is TMenuItem) then
    Exit;

  AId := Integer(TMenuItem(Sender).Tag);
  if (FOperations = nil) or (AId = 0) then
    Exit;

  // Remove apenas o criterio escolhido; a faixa e recalculada na ordem restante.
  FOperations.RemoveQuickFilter(AId);
  UpdateCommandBandLayout();
  dbgDados.Invalidate();
end;

procedure TfrmDataGridFrame.miLimparFiltros1Click(Sender: TObject);
begin
  ClearQuickFilters();
end;

function TfrmDataGridFrame.CopiaDisponivel: Boolean;
begin
  // Condicao unica do menu e do atalho. A copia nao exige marcacao configurada;
  // apenas exclui a coluna SEL, que nao tem texto de celula.
  Result := False;
  if (dbgDados.DataSource = nil) or (dbgDados.DataSource.DataSet = nil) then
    Exit;
  if not dbgDados.DataSource.DataSet.Active then
    Exit;
  if dbgDados.DataSource.DataSet.IsEmpty then
    Exit;
  if dbgDados.SelectedField = nil then
    Exit;
  if (FMarkingColumn <> '') and
    SameText(dbgDados.SelectedField.FieldName, FMarkingColumn) then
    Exit;
  Result := True;
end;

procedure TfrmDataGridFrame.CopiarCelulaAtual;
var
  Campo: TField;
  Texto: string;
begin
  if not CopiaDisponivel then
    Exit;

  Campo := dbgDados.SelectedField;
  if Campo = nil then
    Exit;

  try
    // Convencao legada aprovada; nao e DisplayText.
    Texto := Campo.AsString;
    Clipboard.AsText := Texto;
  except
    // Cobre falha de conversao e de abertura/escrita do clipboard.
    ReportarFeedback(CopyTitle, CopyFailureMessage);
  end;
end;

procedure TfrmDataGridFrame.ReajustarLarguraColunas;
var
  dts: TDataSet;
  // Winapi.Windows declara TBitmap como tagBITMAP no escopo da implementacao;
  // o tipo qualificado garante o bitmap do VCL usado na medicao.
  Bitmap: Vcl.Graphics.TBitmap;
  Bookmark: TBookmark;
  I: Integer;
  Column: TColumn;
  Largura: Integer;
  LarguraTexto: Integer;
  Texto: string;
begin
  if dbgDados.DataSource = nil then
    Exit;

  dts := dbgDados.DataSource.DataSet;
  if (dts = nil) or (not dts.Active) or (dts.State <> dsBrowse) then
    Exit;

  // A medicao usa um canvas proprio para nao alterar a fonte da grade. Cada
  // largura parte do titulo; o conteudo formatado das linhas visiveis prevalece
  // quando for maior. O filtro rapido restringe o proprio conjunto, entao a
  // navegacao considera apenas as linhas que a grade apresenta.
  Bitmap := Vcl.Graphics.TBitmap.Create;
  try
    // O canvas do bitmap precisa de um contexto valido para medir o texto.
    Bitmap.SetSize(1, 1);
    Bookmark := dts.Bookmark;
    dts.DisableControls;
    try
      try
        for I := 0 to dbgDados.Columns.Count - 1 do
        begin
          Column := dbgDados.Columns[I];
          if (not Column.Visible) or (Column.Field = nil) then
            Continue;

          // A coluna de marcacao desenha o checkbox e mantem a largura atual.
          if (FMarkingColumn <> '') and
            SameText(Column.FieldName, FMarkingColumn) then
            Continue;

          Bitmap.Canvas.Font.Assign(Column.Title.Font);
          Largura := Bitmap.Canvas.TextWidth(Column.Title.Caption);

          Bitmap.Canvas.Font.Assign(Column.Font);
          dts.First;
          while not dts.Eof do
          begin
            Texto := Column.Field.DisplayText;
            LarguraTexto := Bitmap.Canvas.TextWidth(Texto);
            if LarguraTexto > Largura then
              Largura := LarguraTexto;
            dts.Next;
          end;

          // Sem linhas, a largura fica restrita ao titulo. O respiro garante uma
          // coluna utilizavel mesmo para um titulo vazio.
          Column.Width := Largura + ColumnWidthPadding;
        end;
      finally
        // A posicao original e restaurada sem editar, filtrar ou ordenar. Um
        // bookmark invalido apenas deixa o conjunto na posicao em que terminou.
        // A memoria do bookmark e liberada mesmo se a restauracao falhar.
        if Bookmark <> nil then
        begin
          try
            if dts.BookmarkValid(Bookmark) then
              dts.GotoBookmark(Bookmark);
          finally
            dts.FreeBookmark(Bookmark);
          end;
        end;
      end;
    finally
      // Os controles voltam a acompanhar o conjunto mesmo se a medicao ou a
      // restauracao da posicao falhar.
      dts.EnableControls;
    end;
  finally
    Bitmap.Free;
  end;
end;

procedure TfrmDataGridFrame.ReportarFeedback(const ATitulo, AMensagem: string);
begin
  // O frame nao abre dialogo proprio; o host apresenta a mensagem.
  if Assigned(FOnFeedback) then
    FOnFeedback(Self, ATitulo, AMensagem);
end;

procedure TfrmDataGridFrame.ModalFeedback(Sender: TObject;
  const ATitulo, AMensagem: string);
begin
  // O modal de filtro usa o mesmo destino de feedback da grade.
  ReportarFeedback(ATitulo, AMensagem);
end;

procedure TfrmDataGridFrame.miCopiarClick(Sender: TObject);
begin
  CopiarCelulaAtual;
end;

procedure TfrmDataGridFrame.miReajustarColunasClick(Sender: TObject);
begin
  ReajustarLarguraColunas;
end;

function TfrmDataGridFrame.IsMarkingColumn(
  const AFieldName: string): Boolean;
begin
  Result := (FMarkingColumn <> '') and SameText(AFieldName, FMarkingColumn);
end;

function TfrmDataGridFrame.ColumnSelectionAvailable: Boolean;
var
  I: Integer;
begin
  // A disponibilidade vem da definicao, sem exigir conjunto ativo ou linhas.
  for I := 0 to High(FColumnDefinitions) do
    if (not IsMarkingColumn(FColumnDefinitions[I].FieldName)) and
      (FColumnDefinitions[I].Behavior <> gcbAlwaysHidden) then
      Exit(True);

  Result := False;
end;

function TfrmDataGridFrame.BuildColumnSelectionEntries: TColumnSelectionEntries;
var
  I: Integer;
  Count: Integer;
  Definition: TGridColumnDefinition;
  Column: TColumn;
begin
  SetLength(Result, 0);
  Count := 0;

  for I := 0 to High(FColumnDefinitions) do
  begin
    Definition := FColumnDefinitions[I];
    if IsMarkingColumn(Definition.FieldName) then
      Continue;
    if Definition.Behavior = gcbAlwaysHidden then
      Continue;

    SetLength(Result, Count + 1);
    Result[Count].Key := Definition.FieldName;

    // O titulo vem da definicao; o titulo da coluna pode conter a seta de
    // ordenacao acrescentada na grade.
    if Trim(Definition.Title) <> '' then
      Result[Count].Title := Definition.Title
    else
      Result[Count].Title := Definition.FieldName;

    Result[Count].Enabled := GridColumnConfigurable(Definition.Behavior);

    // A marcacao reflete a visibilidade corrente da grade; sem coluna criada,
    // vale a visibilidade inicial do comportamento.
    Column := FindColumnByFieldName(Definition.FieldName);
    if Column <> nil then
      Result[Count].Checked := Column.Visible
    else
      Result[Count].Checked := GridColumnVisibleByDefault(Definition.Behavior);

    Inc(Count);
  end;
end;

procedure TfrmDataGridFrame.ApplyColumnSelection(
  const ASelection: TColumnSelectionResults);
var
  I: Integer;
  J: Integer;
  Definition: TGridColumnDefinition;
  Column: TColumn;
begin
  // Somente a visibilidade das colunas configuraveis muda. Ordem, largura,
  // conjunto, filtros, ordenacao e marcacoes permanecem intactos.
  for I := 0 to High(FColumnDefinitions) do
  begin
    Definition := FColumnDefinitions[I];
    if IsMarkingColumn(Definition.FieldName) then
      Continue;
    if not GridColumnConfigurable(Definition.Behavior) then
      Continue;

    Column := FindColumnByFieldName(Definition.FieldName);
    if Column = nil then
      Continue;

    for J := 0 to High(ASelection) do
      if SameText(ASelection[J].Key, Definition.FieldName) then
      begin
        Column.Visible := ASelection[J].Checked;
        Break;
      end;
  end;

  dbgDados.Invalidate;
end;

procedure TfrmDataGridFrame.miConfigurarColunasClick(Sender: TObject);
var
  Dialog: TfrmColumnSelection;
begin
  if not ColumnSelectionAvailable then
    Exit;

  Dialog := TfrmColumnSelection.Create(nil);
  try
    try
      Dialog.Configure(BuildColumnSelectionEntries);
      if Dialog.ShowModal = mrOk then
        ApplyColumnSelection(Dialog.CollectSelection);
    except
      ReportarFeedback(ColumnsTitle, ColumnsFailureMessage);
    end;
  finally
    Dialog.Free;
  end;
end;

procedure TfrmDataGridFrame.miSalvarConfigColunasClick(Sender: TObject);
begin
  SaveColumnLayout;
end;

procedure TfrmDataGridFrame.miRestaurarColunasPadraoClick(Sender: TObject);
begin
  RestoreColumnLayoutDefaults;
end;

function TfrmDataGridFrame.FindColumnDefinitionIndex(
  const AFieldName: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  if AFieldName = '' then
    Exit;

  // A definicao da consulta e a autoridade sobre os campos oferecidos.
  for I := 0 to High(FColumnDefinitions) do
    if SameText(FColumnDefinitions[I].FieldName, AFieldName) then
      Exit(I);
end;

function TfrmDataGridFrame.PersistableColumn(
  const ADefinition: TGridColumnDefinition): Boolean;
begin
  // Marcacao e colunas com visibilidade fixa nao participam da preferencia:
  // a visibilidade delas continua derivada da definicao.
  Result := (not IsMarkingColumn(ADefinition.FieldName))
    and GridColumnConfigurable(ADefinition.Behavior);
end;

function TfrmDataGridFrame.ColumnLayoutAvailable: Boolean;
var
  I: Integer;
begin
  if FColumnLayoutPreferences = nil then
    Exit(False);

  for I := 0 to High(FColumnDefinitions) do
    if PersistableColumn(FColumnDefinitions[I]) then
      Exit(True);

  Result := False;
end;

function TfrmDataGridFrame.FindColumnLayoutEntryIndex(
  const AEntries: TColumnLayoutEntries; const AFieldName: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to High(AEntries) do
    if SameText(AEntries[I].FieldName, AFieldName) then
      Exit(I);
end;

function TfrmDataGridFrame.SortColumnLayoutEntries(
  const AEntries: TColumnLayoutEntries): TColumnLayoutEntries;
var
  I: Integer;
  J: Integer;
  Current: TColumnLayoutEntry;
begin
  Result := Copy(AEntries);

  // O nome do campo desempata para o resultado nao depender da ordem devolvida
  // pelo repositorio.
  for I := 1 to High(Result) do
  begin
    Current := Result[I];
    J := I - 1;
    while (J >= 0) and
      ((Result[J].Order > Current.Order) or
       ((Result[J].Order = Current.Order) and
        (CompareStr(Result[J].FieldName, Current.FieldName) > 0))) do
    begin
      Result[J + 1] := Result[J];
      Dec(J);
    end;
    Result[J + 1] := Current;
  end;
end;

function TfrmDataGridFrame.BuildColumnLayoutEntries: TColumnLayoutEntries;
var
  I: Integer;
  Count: Integer;
  Column: TColumn;
  DefinitionIndex: Integer;
begin
  SetLength(Result, 0);
  Count := 0;

  // A ordem visual corrente da grade e a fonte, inclusive apos reordenacao pelo
  // cabecalho.
  for I := 0 to dbgDados.Columns.Count - 1 do
  begin
    Column := dbgDados.Columns[I];
    DefinitionIndex := FindColumnDefinitionIndex(Column.FieldName);
    if DefinitionIndex < 0 then
      Continue;
    if not PersistableColumn(FColumnDefinitions[DefinitionIndex]) then
      Continue;

    SetLength(Result, Count + 1);
    Result[Count].FieldName := Column.FieldName;
    Result[Count].Visible := Column.Visible;
    // A ordem e a posicao entre as colunas persistidas: colunas fixas e a
    // marcacao intercaladas nao deslocam o valor gravado.
    Result[Count].Order := Count;
    Result[Count].Width := Column.Width;
    Inc(Count);
  end;
end;

procedure TfrmDataGridFrame.RestoreInitialColumnWidth(Column: TColumn;
  const ADefinitionIndex: Integer);
begin
  if (Column = nil) or (ADefinitionIndex < 0) or
    (ADefinitionIndex > High(FInitialColumnWidths)) then
    Exit;

  if FInitialColumnWidths[ADefinitionIndex] > 0 then
    Column.Width := FInitialColumnWidths[ADefinitionIndex];
end;

procedure TfrmDataGridFrame.ApplyColumnLayoutEntries(
  const AEntries: TColumnLayoutEntries);
var
  Sorted: TColumnLayoutEntries;
  Used: TArray<Boolean>;
  ConfigurableOrder: TArray<string>;
  Final: TArray<string>;
  Definition: TGridColumnDefinition;
  Column: TColumn;
  EntryIndex: Integer;
  DefinitionIndex: Integer;
  Count: Integer;
  I: Integer;
begin
  Sorted := SortColumnLayoutEntries(AEntries);
  SetLength(Used, Length(FColumnDefinitions));
  SetLength(ConfigurableOrder, 0);
  Count := 0;

  // Entradas de campos que a consulta deixou de oferecer sao ignoradas, sem
  // apagar a preferencia gravada.
  for I := 0 to High(Sorted) do
  begin
    DefinitionIndex := FindColumnDefinitionIndex(Sorted[I].FieldName);
    if DefinitionIndex < 0 then
      Continue;
    if not PersistableColumn(FColumnDefinitions[DefinitionIndex]) then
      Continue;
    if Used[DefinitionIndex] then
      Continue;

    Used[DefinitionIndex] := True;
    SetLength(ConfigurableOrder, Count + 1);
    ConfigurableOrder[Count] := FColumnDefinitions[DefinitionIndex].FieldName;
    Inc(Count);
  end;

  // As colunas sem preferencia completam a sequencia na ordem da definicao.
  for I := 0 to High(FColumnDefinitions) do
  begin
    if Used[I] then
      Continue;
    if not PersistableColumn(FColumnDefinitions[I]) then
      Continue;

    SetLength(ConfigurableOrder, Count + 1);
    ConfigurableOrder[Count] := FColumnDefinitions[I].FieldName;
    Inc(Count);
  end;

  // Somente as posicoes configuraveis recebem a sequencia; fixas e marcacao
  // mantem a posicao da definicao.
  SetLength(Final, Length(FColumnDefinitions));
  Count := 0;
  for I := 0 to High(FColumnDefinitions) do
    if PersistableColumn(FColumnDefinitions[I]) then
    begin
      Final[I] := ConfigurableOrder[Count];
      Inc(Count);
    end
    else
      Final[I] := FColumnDefinitions[I].FieldName;

  dbgDados.Columns.BeginUpdate;
  try
    // Atribuicao em ordem crescente de indice: a posicao ja definida nao e
    // deslocada.
    for I := 0 to High(Final) do
    begin
      Column := FindColumnByFieldName(Final[I]);
      if (Column = nil) or (I > dbgDados.Columns.Count - 1) then
        Continue;
      Column.Index := I;
    end;

    // Marcacao e colunas fixas seguem a definicao; a preferencia vale apenas
    // para as colunas configuraveis.
    for I := 0 to High(FColumnDefinitions) do
    begin
      Definition := FColumnDefinitions[I];
      Column := FindColumnByFieldName(Definition.FieldName);
      if Column = nil then
        Continue;

      if IsMarkingColumn(Definition.FieldName) then
      begin
        Column.Visible := True;
        RestoreInitialColumnWidth(Column, I);
        Continue;
      end;

      if not GridColumnConfigurable(Definition.Behavior) then
      begin
        Column.Visible := GridColumnVisibleByDefault(Definition.Behavior);
        RestoreInitialColumnWidth(Column, I);
        Continue;
      end;

      EntryIndex := FindColumnLayoutEntryIndex(Sorted, Definition.FieldName);
      if EntryIndex < 0 then
      begin
        Column.Visible := GridColumnVisibleByDefault(Definition.Behavior);
        RestoreInitialColumnWidth(Column, I);
      end
      else
      begin
        Column.Visible := Sorted[EntryIndex].Visible;
        // Largura nao positiva significa "sem largura gravada".
        if Sorted[EntryIndex].Width > 0 then
          Column.Width := Sorted[EntryIndex].Width
        else
          RestoreInitialColumnWidth(Column, I);
      end;
    end;
  finally
    dbgDados.Columns.EndUpdate;
  end;

  dbgDados.Invalidate;
end;

procedure TfrmDataGridFrame.ApplyColumnLayoutDefaults;
begin
  // Sem entradas, a definicao e aplicada integralmente.
  ApplyColumnLayoutEntries(nil);
end;

procedure TfrmDataGridFrame.AttachColumnLayout(
  const APreferences: IColumnLayoutPreferences);
begin
  if APreferences = nil then
    raise Exception.Create(MissingColumnLayoutPreferencesMessage);
  if FColumnLayoutPreferences <> nil then
    raise Exception.Create(ColumnLayoutAlreadyAttachedMessage);

  FColumnLayoutPreferences := APreferences;

  // A composicao associa antes da criacao das colunas; se associar depois, o
  // layout do login corrente e aplicado na hora.
  if Length(FColumnDefinitions) > 0 then
    ReloadColumnLayout;
end;

procedure TfrmDataGridFrame.ReloadColumnLayout;
var
  Entries: TColumnLayoutEntries;
begin
  // A definicao e aplicada antes das preferencias: a troca de usuario nunca
  // herda o layout anterior e uma falha de leitura mantem a definicao.
  ApplyColumnLayoutDefaults;

  if FColumnLayoutPreferences = nil then
    Exit;

  try
    Entries := FColumnLayoutPreferences.Load;
    ApplyColumnLayoutEntries(Entries);
  except
    // A falha real aparece na pesquisa e no salvamento, que reportam ao host.
  end;
end;

procedure TfrmDataGridFrame.SaveColumnLayout;
var
  Entries: TColumnLayoutEntries;
begin
  if FColumnLayoutPreferences = nil then
    Exit;

  try
    Entries := BuildColumnLayoutEntries;
    FColumnLayoutPreferences.Save(Entries);
  except
    // A grade permanece como esta; o host apresenta a falha.
    ReportarFeedback(ColumnsSaveTitle, ColumnsSaveFailureMessage);
  end;
end;

procedure TfrmDataGridFrame.RestoreColumnLayoutDefaults;
begin
  if FColumnLayoutPreferences = nil then
    Exit;

  try
    FColumnLayoutPreferences.Reset;
  except
    // Sem a restauracao no banco a grade nao pode divergir do que esta gravado.
    ReportarFeedback(ColumnsRestoreTitle, ColumnsRestoreFailureMessage);
    Exit;
  end;

  ApplyColumnLayoutDefaults;
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
  ResetSortState();
  FOperations := AOperations;
  FQuickFilterEnabled := AQuickFilterEnabled;
  FQuickFilterColumnName := '';

  if FOperations <> nil then
    FMarkingColumn := FOperations.MarkingColumnName()
  else
    FMarkingColumn := '';

  // Marcacao, filtros rapidos e ordenacao sao independentes. A coluna SEL
  // controla apenas os comandos de marcacao e nao e elegivel para filtro nem
  // para ordenacao.
  // Uma nova configuracao comeca sem criterios e recalcula a faixa.
  if FOperations <> nil then
    FOperations.ClearQuickFilters();
  UpdateCommandBandLayout();
end;

procedure TfrmDataGridFrame.ConfigureColumns(
  const AColumns: TGridColumnDefinitions);
var
  I: Integer;
  Definition: TGridColumnDefinition;
  NewColumn: TColumn;
begin
  // As definicoes passam a ser a fonte da configuracao de colunas; a tela nao
  // mantem uma copia propria para a grade.
  FColumnDefinitions := Copy(AColumns);
  SetLength(FInitialColumnWidths, Length(FColumnDefinitions));

  dbgDados.Columns.BeginUpdate;
  try
    dbgDados.Columns.Clear;
    for I := 0 to High(FColumnDefinitions) do
    begin
      Definition := FColumnDefinitions[I];
      NewColumn := dbgDados.Columns.Add;
      NewColumn.FieldName := Definition.FieldName;
      NewColumn.Title.Caption := Definition.Title;
      if Definition.Width > 0 then
        NewColumn.Width := Definition.Width;

      // Captura a largura efetiva, inclusive o padrao da grade.
      FInitialColumnWidths[I] := NewColumn.Width;

      case Definition.Alignment of
        qcaDefault: ;
        qcaLeft: NewColumn.Alignment := taLeftJustify;
        qcaCenter: NewColumn.Alignment := taCenter;
        qcaRight: NewColumn.Alignment := taRightJustify;
      end;

      // A coluna de marcacao permanece visivel mesmo que a definicao declare
      // outro comportamento; ela tambem fica fora da lista de configuracao.
      NewColumn.Visible := GridColumnVisibleByDefault(Definition.Behavior)
        or IsMarkingColumn(Definition.FieldName);
    end;
  finally
    dbgDados.Columns.EndUpdate;
  end;

  ReloadColumnLayout;
end;

procedure TfrmDataGridFrame.ClearQuickFilters;
begin
  // Retira somente os criterios rapidos; as marcacoes existentes sao
  // preservadas.
  if FOperations <> nil then
    FOperations.ClearQuickFilters();
  UpdateCommandBandLayout();
  dbgDados.Invalidate();
end;

function TfrmDataGridFrame.SortingAvailable: Boolean;
begin
  Result := (FOperations <> nil)
    and (dbgDados.DataSource <> nil)
    and (dbgDados.DataSource.DataSet <> nil)
    and dbgDados.DataSource.DataSet.Active;
end;

function TfrmDataGridFrame.IsSortableColumn(Column: TColumn): Boolean;
var
  dts: TDataSet;
begin
  Result := False;
  if (Column = nil) or (Column.Field = nil) or (not Column.Visible) then
    Exit;

  // A coluna de marcacao nunca ordena, ainda que seja informada por engano.
  if (FMarkingColumn <> '') and SameText(Column.FieldName, FMarkingColumn) then
    Exit;

  if not SortingAvailable() then
    Exit;

  dts := dbgDados.DataSource.DataSet;
  Result := FOperations.CanSortField(dts, Column.FieldName);
end;

function TfrmDataGridFrame.FindColumnByFieldName(
  const AFieldName: string): TColumn;
var
  I: Integer;
begin
  Result := nil;
  if AFieldName = '' then
    Exit;

  // A busca pelo nome do campo evita manter uma referencia a TColumn, que pode
  // ser recriada quando as colunas sao reconstruidas.
  for I := 0 to dbgDados.Columns.Count - 1 do
    if SameText(dbgDados.Columns[I].FieldName, AFieldName) then
      Exit(dbgDados.Columns[I]);
end;

function TfrmDataGridFrame.FindSortFieldIndex(
  const AFieldName: string): Integer;
var
  I: Integer;
begin
  for I := 0 to High(FSortFields) do
    if SameText(FSortFields[I].FieldName, AFieldName) then
      Exit(I);
  Result := -1;
end;

procedure TfrmDataGridFrame.ResetSortState;
begin
  RestoreSortedTitles();
  FSortFields := nil;
end;

procedure TfrmDataGridFrame.RestoreSortedTitles;
var
  I: Integer;
  Column: TColumn;
begin
  for I := 0 to High(FSortedColumns) do
  begin
    Column := FindColumnByFieldName(FSortedColumns[I].FieldName);
    if Column <> nil then
    begin
      Column.Title.Caption := FSortedColumns[I].Caption;
      Column.Title.Font.Style := FSortedColumns[I].FontStyle;
    end;
  end;

  SetLength(FSortedColumns, 0);
end;

procedure TfrmDataGridFrame.ApplySortedTitles;
var
  I: Integer;
  Column: TColumn;
  State: TSortedColumnState;
  DirectionMark: string;
begin
  // As legendas e os estilos originais sao recuperados antes de marcar o novo
  // conjunto; assim somente as colunas da ordem atual ficam destacadas.
  RestoreSortedTitles();

  for I := 0 to High(FSortFields) do
  begin
    Column := FindColumnByFieldName(FSortFields[I].FieldName);
    if Column = nil then
      Continue;

    State.FieldName := Column.FieldName;
    State.Caption := Column.Title.Caption;
    State.FontStyle := Column.Title.Font.Style;

    SetLength(FSortedColumns, Length(FSortedColumns) + 1);
    FSortedColumns[High(FSortedColumns)] := State;

    if FSortFields[I].Ascending then
      DirectionMark := #9650
    else
      DirectionMark := #9660;

    Column.Title.Caption := Format('%s %s', [State.Caption, DirectionMark]);
    Column.Title.Font.Style := State.FontStyle + [fsBold];
  end;
end;

function TfrmDataGridFrame.TryApplySort(
  const ASorts: TQuerySortFields): Boolean;
var
  dts: TDataSet;
begin
  // Caminho unico: o frame apenas encaminha a especificacao; o contrato de
  // operacoes aplica a ordenacao ao conjunto carregado.
  if FOperations = nil then
    Exit(False);
  if not SortingAvailable() then
    Exit(False);

  dts := dbgDados.DataSource.DataSet;
  Result := FOperations.ApplySort(dts, ASorts);
end;

procedure TfrmDataGridFrame.ObserveDataSetChange;
var
  Current: TDataSet;
begin
  if FSuppressDataSetChange then
    Exit;

  if dbgDados.DataSource = nil then
    Current := nil
  else
    Current := dbgDados.DataSource.DataSet;

  if Current = FObservedDataSet then
    Exit;

  // Um conjunto novo comeca na ordem padrao da consulta, sem seta, prioridade
  // ou negrito do resultado anterior.
  FObservedDataSet := Current;
  ResetSortState();
end;

procedure TfrmDataGridFrame.ClearSorting;
var
  dts: TDataSet;
  SortApplied: Boolean;
begin
  SortApplied := Length(FSortFields) > 0;
  ResetSortState();

  if not SortApplied then
    Exit;
  if (FOperations = nil) or (dbgDados.DataSource = nil) then
    Exit;

  dts := dbgDados.DataSource.DataSet;
  if (dts <> nil) and dts.Active then
    FOperations.ApplySort(dts, nil);
end;

procedure TfrmDataGridFrame.dbgDadosTitleClick(Column: TColumn);
var
  NewSorts: TQuerySortFields;
  Index: Integer;
begin
  // Ctrl+clique prepara o filtro da coluna antes de qualquer ordenacao. O
  // gesto nunca altera a ordem, mesmo quando a tela nao trata o campo.
  if GetKeyState(VK_CONTROL) < 0 then
  begin
    if Assigned(FOnTitleCtrlClick) and (Column <> nil) then
      FOnTitleCtrlClick(Self, Column.FieldName);
    Exit;
  end;

  if not IsSortableColumn(Column) then
    Exit;

  // O clique simples alterna a direcao somente quando a coluna e a unica da
  // ordem; qualquer outra combinacao recomeca com essa coluna ascendente.
  // Shift+clique acrescenta a coluna ao fim ou alterna sua direcao sem mudar
  // sua prioridade.
  if GetKeyState(VK_SHIFT) < 0 then
  begin
    NewSorts := Copy(FSortFields);
    Index := FindSortFieldIndex(Column.FieldName);
    if Index < 0 then
    begin
      SetLength(NewSorts, Length(NewSorts) + 1);
      NewSorts[High(NewSorts)].FieldName := Column.FieldName;
      NewSorts[High(NewSorts)].Ascending := True;
    end
    else
      NewSorts[Index].Ascending := not NewSorts[Index].Ascending;
  end
  else
  begin
    SetLength(NewSorts, 1);
    NewSorts[0].FieldName := Column.FieldName;
    if (Length(FSortFields) = 1) and
      SameText(FSortFields[0].FieldName, Column.FieldName) then
      NewSorts[0].Ascending := not FSortFields[0].Ascending
    else
      NewSorts[0].Ascending := True;
  end;

  // A ordenacao e efetivada antes do titulo. Uma recusa mantem a ordem, as
  // setas, as prioridades e o negrito anteriores.
  if not TryApplySort(NewSorts) then
    Exit;

  FSortFields := Copy(NewSorts);
  ApplySortedTitles();
end;

procedure TfrmDataGridFrame.dbgDadosMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y,
  HitTest: Integer; var MouseActivate: TMouseActivate);
var
  Column: TColumn;
  DataField: TField;
  TempCriterion: TFilterCriterion;
begin
  // O menu de filtro usa a coluna sob o mouse sem alterar a linha corrente.
  if Button <> mbRight then
    Exit;

  miCopiar.Enabled := CopiaDisponivel;
  miReajustarColunas.Enabled := (dbgDados.DataSource <> nil) and
    (dbgDados.DataSource.DataSet <> nil) and
    dbgDados.DataSource.DataSet.Active;
  miConfigurarColunas.Enabled := ColumnSelectionAvailable;
  miSalvarConfigColunas.Enabled := ColumnLayoutAvailable;
  miRestaurarColunasPadrao.Enabled := ColumnLayoutAvailable;
  miFiltrarValor.Enabled := False;
  miFiltrarQuando.Enabled := False;
  FQuickFilterColumnName := '';
  Column := TDBGridCellAccess(dbgDados).ColumnAt(X, Y);
  if (Column = nil) or (Column.Field = nil) then
    Exit;

  FQuickFilterColumnName := Column.FieldName;
  DataField := QuickFilterField();
  // Filtrar por este valor exige um valor de celula; Filtrar quando abre o
  // modal tambem sobre celula nula para escolher Vazio/Nulo.
  miFiltrarValor.Enabled := (DataField <> nil) and
    TryBuildEqualityCriterion(DataField, TempCriterion);
  miFiltrarQuando.Enabled := DataField <> nil;
end;

procedure TfrmDataGridFrame.miFiltrarValorClick(Sender: TObject);
var
  DataField: TField;
  AId: Integer;
  Msg: string;
begin
  DataField := QuickFilterField();
  if DataField = nil then
    Exit;

  // Cada aceite acrescenta um criterio; os anteriores continuam ativos. A
  // mensagem especifica do filtro substitui a generica quando disponivel.
  if FOperations.AddQuickFilter(DataField, AId, Msg) then
  begin
    UpdateCommandBandLayout();
    dbgDados.Invalidate();
  end
  else
  begin
    if Trim(Msg) = '' then
      Msg := QuickFilterFailureMessage;
    ReportarFeedback(QuickFilterTitle, Msg);
  end;
end;

function TfrmDataGridFrame.BuildQuickFilterDefinition: TFilterDefinition;
var
  Fields: TFilterFieldDefinitions;
  I: Integer;
  Column: TColumn;
  ValueType: TFilterFieldType;
  Operators: TFilterOperatorSet;
  FieldDefinition: TFilterFieldDefinition;
  CaptionText: string;
begin
  SetLength(Fields, 0);
  if (dbgDados.DataSource = nil) or (dbgDados.DataSource.DataSet = nil) then
  begin
    Result := FilterDefinitionOf(Fields, False);
    Exit;
  end;

  // A definicao do modal usa as colunas de dados da grade, sem a coluna de
  // marcacao, com os operadores que o filtro local executa para o tipo fisico.
  // A visibilidade atual nao e considerada: colunas ocultas na grade tambem
  // entram na definicao.
  for I := 0 to dbgDados.Columns.Count - 1 do
  begin
    Column := dbgDados.Columns[I];
    if (Column.Field = nil) or
      ((FMarkingColumn <> '') and
       SameText(Column.FieldName, FMarkingColumn)) then
      Continue;

    ValueType := QuickFilterFieldTypeFor(Column.Field);
    Operators := QuickFilterOperators(Column.Field);
    if Operators = [] then
      Continue;

    CaptionText := Trim(Column.Title.Caption);
    if CaptionText = '' then
      CaptionText := Column.Field.DisplayLabel;

    FieldDefinition := FilterField(Column.FieldName, CaptionText, ValueType,
      Operators, QuickFilterMaskPolicy(ValueType));

    SetLength(Fields, Length(Fields) + 1);
    Fields[High(Fields)] := FieldDefinition;
  end;

  Result := FilterDefinitionOf(Fields, False);
end;

procedure TfrmDataGridFrame.ShowQuickFilterMessage(const AMessage: string);
begin
  // O frame nao abre dialogo proprio; a mensagem segue para o host.
  ReportarFeedback(QuickFilterTitle, AMessage);
end;

function TfrmDataGridFrame.ShowQuickFilterModal(const ACaption: string;
  const ADefinition: TFilterDefinition; const ACriterion: TFilterCriterion;
  out AResult: TFilterCriterion): Boolean;
var
  ModalForm: TForm;
  FilterView: TfrmFilterFrame;
  ButtonsPanel: TPanel;
  OkButton: TButton;
  CancelButton: TButton;
  MessageText: string;
  CollectedCriterion: TFilterCriterion;
begin
  Result := False;
  AResult := Default(TFilterCriterion);

  ModalForm := TForm.CreateNew(nil);
  try
    ModalForm.Caption := ACaption;
    ModalForm.BorderStyle := bsDialog;
    ModalForm.Position := poMainFormCenter;
    ModalForm.ClientWidth := 560;
    ModalForm.ClientHeight := 112;

    FilterView := TfrmFilterFrame.Create(ModalForm);
    FilterView.Parent := ModalForm;
    FilterView.Align := alTop;
    FilterView.Height := 70;
    FilterView.OnFeedback := ModalFeedback;

    try
      FilterView.ConfigureSingle(ADefinition, ACriterion, fpLoadedDataSet);
    except
      on E: Exception do
      begin
        ShowQuickFilterMessage(E.Message);
        Exit;
      end;
    end;

    ButtonsPanel := TPanel.Create(ModalForm);
    ButtonsPanel.Parent := ModalForm;
    ButtonsPanel.Align := alBottom;
    ButtonsPanel.Height := 42;
    ButtonsPanel.BevelOuter := bvNone;

    CancelButton := TButton.Create(ButtonsPanel);
    CancelButton.Parent := ButtonsPanel;
    CancelButton.Caption := 'Cancelar';
    CancelButton.ModalResult := mrCancel;
    CancelButton.Cancel := True;
    CancelButton.AlignWithMargins := True;
    CancelButton.Margins.Top := 6;
    CancelButton.Margins.Bottom := 6;
    CancelButton.Margins.Right := 12;
    CancelButton.Align := alRight;
    CancelButton.Width := 84;

    OkButton := TButton.Create(ButtonsPanel);
    OkButton.Parent := ButtonsPanel;
    OkButton.Caption := 'OK';
    OkButton.Default := True;
    OkButton.ModalResult := mrOk;
    OkButton.AlignWithMargins := True;
    OkButton.Margins.Top := 6;
    OkButton.Margins.Bottom := 6;
    OkButton.Align := alRight;
    OkButton.Width := 84;
    if ModalForm.ShowModal = mrOk then
    begin
      if FilterView.CollectSingleCriterion(CollectedCriterion, MessageText) then
      begin
        AResult := CollectedCriterion;
        Result := True;
      end
      else
      begin
        if Trim(MessageText) = '' then
          MessageText := QuickFilterInvalidMessage;
        ShowQuickFilterMessage(MessageText);
      end;
    end;
  finally
    ModalForm.Free;
  end;
end;

procedure TfrmDataGridFrame.miFiltrarQuandoClick(Sender: TObject);
var
  DataField: TField;
  InitialCriterion: TFilterCriterion;
  NewCriterion: TFilterCriterion;
  Definition: TFilterDefinition;
  Msg: string;
begin
  DataField := QuickFilterField();
  if DataField = nil then
    Exit;

  // Celula sem valor abre o modal com o campo e o operador padrao/primeiro
  // disponivel, para o usuario escolher Vazio, Nulo ou informar o valor.
  if not TryBuildEqualityCriterion(DataField, InitialCriterion) then
    if not TryBuildDefaultQuickFilterCriterion(DataField, InitialCriterion) then
      Exit;

  Definition := BuildQuickFilterDefinition();
  if not ShowQuickFilterModal('Filtrar quando', Definition, InitialCriterion,
    NewCriterion) then
    Exit;

  if not FOperations.AddQuickFilterCriterion(NewCriterion, Msg) then
  begin
    if Trim(Msg) = '' then
      Msg := QuickFilterAddFailureMessage;
    ReportarFeedback(QuickFilterTitle, Msg);
    Exit;
  end;

  UpdateCommandBandLayout();
  dbgDados.Invalidate();
end;

procedure TfrmDataGridFrame.miAlterarCriterioClick(Sender: TObject);
var
  AId: Integer;
  CurrentCriterion: TFilterCriterion;
  NewCriterion: TFilterCriterion;
  Definition: TFilterDefinition;
  Msg: string;
begin
  if not (Sender is TMenuItem) then
    Exit;

  AId := Integer(TMenuItem(Sender).Tag);
  if (FOperations = nil) or (AId = 0) then
    Exit;

  if not FOperations.GetQuickFilterCriterion(AId, CurrentCriterion) then
  begin
    ReportarFeedback(QuickFilterTitle, QuickFilterMissingMessage);
    UpdateCommandBandLayout();
    Exit;
  end;

  Definition := BuildQuickFilterDefinition();
  if not ShowQuickFilterModal('Alterar filtro', Definition, CurrentCriterion,
    NewCriterion) then
    Exit;

  if not FOperations.UpdateQuickFilter(AId, NewCriterion, Msg) then
  begin
    if Trim(Msg) = '' then
      Msg := QuickFilterUpdateFailureMessage;
    ReportarFeedback(QuickFilterTitle, Msg);
    Exit;
  end;

  UpdateCommandBandLayout();
  dbgDados.Invalidate();
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

procedure TfrmDataGridFrame.dbgDadosExit(Sender: TObject);
begin
//
end;

procedure TfrmDataGridFrame.dbgDadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  // Ctrl+C so existe na grade; editores de digitacao mantem o atalho nativo do
  // VCL porque nao passam por este manipulador.
  if (Key = KeyC) and (Shift = [ssCtrl]) then
  begin
    CopiarCelulaAtual;
    Key := 0;
  end
  else if (Key = VK_SPACE) and (Shift = []) and MarkingActive then
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

  // O desvinculo transitorio nao e uma nova pesquisa: a ordenacao exibida e as
  // marcacoes continuam valendo apos os comandos.
  FSuppressDataSetChange := True;
  try
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
  finally
    FSuppressDataSetChange := False;
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
