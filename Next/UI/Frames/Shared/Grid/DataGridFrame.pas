unit DataGridFrame;

interface

uses
  Vcl.Forms, Vcl.Graphics, Vcl.Controls, Vcl.Buttons, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBGrids, Vcl.Menus, System.Classes, System.SysUtils, System.Types,
  System.UITypes, System.Generics.Collections, Data.DB, FilterDefinition,
  FilterCriterion, FilterFrame, QueryResultOperations;

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
    miFiltrarQuando: TMenuItem;
    miFiltrarValor: TMenuItem;
    miLimparFiltros1: TMenuItem;
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
    procedure miFiltrarQuandoClick(Sender: TObject);
    procedure miFiltrarValorClick(Sender: TObject);
    procedure miLimparFiltros1Click(Sender: TObject);
  private
    FMarkingColumn: string;
    FOperations: IQueryResultOperations;
    FQuickFilterEnabled: Boolean;
    FQuickFilterColumnName: string;
    FCriterionSlots: TList<TCriterionBandSlot>;

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
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Configure(AOperations: IQueryResultOperations = nil;
      AQuickFilterEnabled: Boolean = False);
    // Remove todos os criterios rapidos sem alterar as marcacoes. Usado pela
    // tela antes de cada pesquisa, para o novo resultado comecar completo.
    procedure ClearQuickFilters();
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
  QuickFilterValueMessage =
    'O valor da c'#233'lula est'#225' vazio e n'#227'o pode ser filtrado.';
  QuickFilterAddFailureMessage =
    'N'#227'o foi poss'#237'vel adicionar o filtro. Verifique se ele j'#225' est'#225' aplicado.';
  QuickFilterUpdateFailureMessage =
    'N'#227'o foi poss'#237'vel alterar o filtro. Verifique se ele j'#225' est'#225' aplicado.';
  QuickFilterMissingMessage =
    'O filtro selecionado n'#227'o est'#225' mais ativo.';
  QuickFilterInvalidMessage =
    'O filtro informado n'#227'o '#233' v'#225'lido.';

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
end;

destructor TfrmDataGridFrame.Destroy;
var
  I: Integer;
begin
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
  // Uma nova origem de dados comeca sem criterios; a faixa do resultado
  // anterior nao sobrevive a troca do conjunto.
  if FOperations <> nil then
    FOperations.ClearQuickFilters();
  FQuickFilterColumnName := '';
  dbgDados.DataSource := Value;
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

  // Marcacao e filtros rapidos sao independentes. A coluna SEL controla apenas
  // os comandos de marcacao e nao e elegivel para o filtro.
  // Uma nova configuracao comeca sem criterios e recalcula a faixa.
  if FOperations <> nil then
    FOperations.ClearQuickFilters();
  UpdateCommandBandLayout();
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

procedure TfrmDataGridFrame.dbgDadosMouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y,
  HitTest: Integer; var MouseActivate: TMouseActivate);
var
  Column: TColumn;
begin
  // O evento dbgDadosMouseDown não responde no formulario, por isso o uso desse evento substituto
  if Button <> mbRight then
    Exit;

  miFiltrarValor.Enabled := False;
  miFiltrarQuando.Enabled := False;
  FQuickFilterColumnName := '';
  Column := TDBGridCellAccess(dbgDados).ColumnAt(X, Y);
  if (Column = nil) or (Column.Field = nil) then
    Exit;

  FQuickFilterColumnName := Column.FieldName;
  miFiltrarValor.Enabled := QuickFilterField() <> nil;
  miFiltrarQuando.Enabled := miFiltrarValor.Enabled;
end;

procedure TfrmDataGridFrame.miFiltrarValorClick(Sender: TObject);
var
  DataField: TField;
  AId: Integer;
begin
  DataField := QuickFilterField();
  if DataField = nil then
    Exit;

  // Cada aceite acrescenta um criterio; os anteriores continuam ativos.
  if FOperations.AddQuickFilter(DataField, AId) then
  begin
    UpdateCommandBandLayout();
    dbgDados.Invalidate();
  end
  else
    Application.MessageBox(PChar(QuickFilterFailureMessage),
      PChar(QuickFilterTitle), MB_OK or MB_ICONWARNING);
end;

function TfrmDataGridFrame.BuildQuickFilterDefinition: TFilterDefinition;
var
  Fields: TFilterFieldDefinitions;
  I: Integer;
  Column: TColumn;
  ValueType: TFilterFieldType;
  FieldDefinition: TFilterFieldDefinition;
  CaptionText: string;
begin
  SetLength(Fields, 0);
  if (dbgDados.DataSource = nil) or (dbgDados.DataSource.DataSet = nil) then
  begin
    Result := FilterDefinitionOf(Fields, False);
    Exit;
  end;

  // A definicao do modal usa as colunas de dados visiveis, sem a coluna de
  // marcacao. Igualdade atende todos os campos; data e data/hora tambem
  // aceitam intervalo, sempre sem negacao.
  for I := 0 to dbgDados.Columns.Count - 1 do
  begin
    Column := dbgDados.Columns[I];
    if (Column.Field = nil) or
      ((FMarkingColumn <> '') and
       SameText(Column.FieldName, FMarkingColumn)) then
      Continue;

    ValueType := QuickFilterFieldTypeFor(Column.Field);
    CaptionText := Trim(Column.Title.Caption);
    if CaptionText = '' then
      CaptionText := Column.Field.DisplayLabel;

    if ValueType in [fftDate, fftDateTime] then
      FieldDefinition := FilterField(Column.FieldName, CaptionText, ValueType,
        [foEquals, foRange], QuickFilterMaskPolicy(ValueType))
    else
      FieldDefinition := FilterField(Column.FieldName, CaptionText, ValueType,
        [foEquals]);

    SetLength(Fields, Length(Fields) + 1);
    Fields[High(Fields)] := FieldDefinition;
  end;

  Result := FilterDefinitionOf(Fields, False);
end;

procedure TfrmDataGridFrame.ShowQuickFilterMessage(const AMessage: string);
begin
  Application.MessageBox(PChar(AMessage), PChar(QuickFilterTitle),
    MB_OK or MB_ICONWARNING);
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

    try
      FilterView.ConfigureSingle(ADefinition, ACriterion);
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
begin
  DataField := QuickFilterField();
  if DataField = nil then
    Exit;

  if not TryBuildEqualityCriterion(DataField, InitialCriterion) then
  begin
    ShowQuickFilterMessage(QuickFilterValueMessage);
    Exit;
  end;

  Definition := BuildQuickFilterDefinition();
  if not ShowQuickFilterModal('Filtrar quando', Definition, InitialCriterion,
    NewCriterion) then
    Exit;

  if not FOperations.AddQuickFilterCriterion(NewCriterion) then
  begin
    ShowQuickFilterMessage(QuickFilterAddFailureMessage);
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
begin
  if not (Sender is TMenuItem) then
    Exit;

  AId := Integer(TMenuItem(Sender).Tag);
  if (FOperations = nil) or (AId = 0) then
    Exit;

  if not FOperations.GetQuickFilterCriterion(AId, CurrentCriterion) then
  begin
    ShowQuickFilterMessage(QuickFilterMissingMessage);
    UpdateCommandBandLayout();
    Exit;
  end;

  Definition := BuildQuickFilterDefinition();
  if not ShowQuickFilterModal('Alterar filtro', Definition, CurrentCriterion,
    NewCriterion) then
    Exit;

  if not FOperations.UpdateQuickFilter(AId, NewCriterion) then
  begin
    ShowQuickFilterMessage(QuickFilterUpdateFailureMessage);
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
