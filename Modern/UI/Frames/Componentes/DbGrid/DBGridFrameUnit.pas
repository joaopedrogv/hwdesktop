unit DBGridFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, DB, Buttons, ExtCtrls, FilterContainerFrameUnit, FilterConditionFrameUnit, Menus, ImgList;

type
  TDBGridFrameLayout = ( glaTop, glaRigth, glaBottom, glaLeft );

  TDBGridFrameBtns = ( gbtSelection, gbtSelectAll, gbtUnselectAll, gbtInvertSelection{,gbtExport} );
  TDBGridFrameBtnsSet = set of TDBGridFrameBtns;

  TDBGridFrameSetup = record
  private
    FSelectionField: string;
    FBtnsLayout: TDBGridFrameLayout;
    FButtons: TDBGridFrameBtnsSet;
  public
    class function CreateSelection(
      BtnsLayout: TDBGridFrameLayout = glaTop;
      Buttons: TDBGridFrameBtnsSet = [ gbtSelection ];
      const SelectionField: string = 'SEL'
    ): TDBGridFrameSetup; static;
    class function CreateClean(): TDBGridFrameSetup; static;

    property SelectionField: string read FSelectionField;
    property BtnsLayout: TDBGridFrameLayout read FBtnsLayout;
    property Buttons: TDBGridFrameBtnsSet read FButtons;
  end;

  TDBGridFrame = class(TFrame)
    DBGrid: TDBGrid;
    pnBtns: TPanel;
    btnInvertSelection: TSpeedButton;
    btnUnselectAll: TSpeedButton;
    btnSelectAll: TSpeedButton;
    popMenuGrid: TPopupMenu;
    Filtrar1: TMenuItem;
    Filtrarquando1: TMenuItem;
    Filtrarquandono1: TMenuItem;
    Limparfiltros1: TMenuItem;
    N1: TMenuItem;
    Copiar1: TMenuItem;
    FilterContainerFrame1: TFilterContainerFrame;
    pnTop: TPanel;
    pnTopLeft: TPanel;
    imgListGrid: TImageList;
    ActionsGridMenu999: TMenuItem;
    ActionsGridMenu999N: TMenuItem;
    procedure popMenuGridPopup(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure Limparfiltros1Click(Sender: TObject);
    procedure Filtrar1Click(Sender: TObject);
    procedure DBGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnInvertSelectionClick(Sender: TObject);
    procedure btnUnselectAllClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
  private
    FOriginalDataSet: TDataSet;
    //FSelectedIDs: TStringList;
    //FSelectionFieldName: string;
    FOriginalDataSource: TDataSource;
    FOriginalOnColEnter: TNotifyEvent;
    FParams: TDBGridFrameSetup;
    FFieldSelection: TField;
    //FOriginalOnDrawCell: TDBGridDrawColumnCellEvent;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetupMenus();
    function GetIsRowSelected(): Boolean;
    procedure SetIsRowSelected(AValue: Boolean);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridColEnter(Sender: TObject);

    procedure WhenFilterChange(var value: string);
    procedure popMenuFiltrarQuandoClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    //destructor Destroy; override;

    procedure Setup(const Input: TDBGridFrameSetup);

    property DataSource: TDataSource read FOriginalDataSource write SetDataSource;
  end;

implementation

uses
  StrUtils, Math, Clipbrd, DBClient;

{$R *.dfm}

{ TDBGridFrame }

procedure TDBGridFrame.btnInvertSelectionClick(Sender: TObject);
var
  rNo: Integer;
begin
  if not Assigned(FOriginalDataSet) then
    Exit;

  rNo := FOriginalDataSet.RecNo;

  FOriginalDataSet.DisableControls;
  try
    FOriginalDataSet.First;
    while not FOriginalDataSet.Eof do
    begin
      SetIsRowSelected(not GetIsRowSelected);
      FOriginalDataSet.Next;
    end;
  finally
    FOriginalDataSet.RecNo := rNo;
    FOriginalDataSet.EnableControls;
  end;
  DBGrid.Invalidate;
end;

procedure TDBGridFrame.btnSelectAllClick(Sender: TObject);
var
  rNo: Integer;
begin
  if not Assigned(FOriginalDataSet) then
    Exit;

  rNo := FOriginalDataSet.RecNo;

  FOriginalDataSet.DisableControls;
  try
    FOriginalDataSet.First;
    while not FOriginalDataSet.Eof do
    begin
      SetIsRowSelected(True);
      FOriginalDataSet.Next;
    end;
  finally
    FOriginalDataSet.RecNo := rNo;
    FOriginalDataSet.EnableControls;
  end;
  DBGrid.Invalidate; // força redesenho
end;

procedure TDBGridFrame.btnUnselectAllClick(Sender: TObject);
var
  rNo: Integer;
begin
  if not Assigned(FOriginalDataSet) then
    Exit;

  rNo := FOriginalDataSet.RecNo;

  FOriginalDataSet.DisableControls;
  try
    FOriginalDataSet.First;
    while not FOriginalDataSet.Eof do
    begin
      SetIsRowSelected(False);
      FOriginalDataSet.Next;
    end;
  finally
    FOriginalDataSet.RecNo := rNo;
    FOriginalDataSet.EnableControls;
  end;
  DBGrid.Invalidate;
end;

procedure TDBGridFrame.Copiar1Click(Sender: TObject);
begin
  Clipboard.AsText := FOriginalDataSet.FieldByName(DBGrid.Columns[DBGrid.SelectedIndex].FieldName).AsString;
end;

constructor TDBGridFrame.Create(AOwner: TComponent);
begin
  inherited;

  FFieldSelection := nil;

//  FSelectedIDs := TStringList.Create;
//  FSelectedIDs.Sorted := True;
//  FSelectedIDs.Duplicates := dupIgnore;

  // Guarda handlers originais (caso o usuário queira personalizar depois)
  //FOriginalOnDrawCell := DBGrid.OnDrawColumnCell;
  FOriginalOnColEnter := DBGrid.OnColEnter;

  // Atribui os handlers internos
  //DBGrid.OnDrawColumnCell := DBGridDrawColumnCell;
  DBGrid.OnColEnter := DBGridColEnter;
end;

//destructor TDBGridFrame.Destroy;
//begin
//  //FSelectedIDs.Free;
//  inherited;
//end;

function TDBGridFrame.GetIsRowSelected: Boolean;
var
  Field: TField;
begin
  Result := False;
  if Assigned(FFieldSelection) then
    case FFieldSelection.DataType of
      ftBoolean:
        Result := FFieldSelection.AsBoolean;

      ftSmallint, ftInteger:
        Result := FFieldSelection.AsInteger = 1;

      ftString, ftWideString:
        Result := FFieldSelection.AsString <> '';
    end;
end;

procedure TDBGridFrame.Limparfiltros1Click(Sender: TObject);
begin
  FilterContainerFrame1.ClearAll;
end;

procedure TDBGridFrame.popMenuFiltrarQuandoClick(Sender: TObject);
var
  mnItem: TMenuItem;
  fc: FilterCondition; 
begin
  if not (Sender is TMenuItem)  then
    Exit;

  mnItem := (Sender as TMenuItem);

  for fc := Low(FilterCondition) to High(FilterCondition) do
    if ReplaceText(mnItem.Caption, '&', '') = FilterConditionStr[fc] then
    begin
      FilterContainerFrame1.CriarFiltro( DBGrid.Columns[DBGrid.SelectedIndex].FieldName, fc, mnItem.Tag = -1 );
      Break;
    end;
end;

procedure TDBGridFrame.popMenuGridPopup(Sender: TObject);
begin
  if (FOriginalDataSet = nil) or not (FOriginalDataSet is TClientDataSet) then
  begin
    Filtrarquando1.Enabled := False;
    Filtrarquandono1.Enabled := False;
  end;
end;

procedure TDBGridFrame.DBGridCellClick(Column: TColumn);
begin
  if Assigned(FFieldSelection) and ( FFieldSelection.FieldName = Column.FieldName) then
    SetIsRowSelected( not GetIsRowSelected() );
end;

procedure TDBGridFrame.DBGridDblClick(Sender: TObject);
begin
  SetIsRowSelected( not GetIsRowSelected() );
end;

procedure TDBGridFrame.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    SetIsRowSelected( not GetIsRowSelected() );
end;

procedure TDBGridFrame.DBGridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Classes.ssCtrl in Shift then
    SetIsRowSelected( not GetIsRowSelected() );
end;

procedure TDBGridFrame.Filtrar1Click(Sender: TObject);
begin
  FilterContainerFrame1.CriarFiltro( DBGrid.Columns[DBGrid.SelectedIndex].FieldName, fcEquals, False);
end;

procedure TDBGridFrame.SetIsRowSelected(AValue: Boolean);
var
  Field: TField;
  Key: string;
begin
  if not Assigned(FFieldSelection)
    or not Assigned(FFieldSelection) then
    Exit;

  FOriginalDataSet.Edit;
  try
    case FFieldSelection.DataType of
      ftBoolean:
        FFieldSelection.AsBoolean := AValue;

      ftSmallint, ftInteger:
        FFieldSelection.AsInteger := IfThen(AValue, 1);

      ftString, ftWideString:
        FFieldSelection.AsString := IfThen(AValue, 'S');
    end;

  finally
    FOriginalDataSet.Post;
  end;

  // Usa a chave primária ou BookMark como identificador (aqui usamos RecNo como fallback simples)
  // Melhor prática: usar uma chave única (ex: ID). Passar uma função de chave se quiser.
//  Key := IntToStr(FOriginalDataSet.RecNo);

//  if AValue then
//    FSelectedIDs.Add(Key)
//  else
//    FSelectedIDs.Delete(FSelectedIDs.IndexOf(Key));

  //UpdateButtonStates;
end;

procedure TDBGridFrame.Setup(const Input: TDBGridFrameSetup);
var
  btn : TDBGridFrameBtns;
  I: Integer;
begin
  FParams := Input;

  case FParams.BtnsLayout of
    glaBottom:
      pnBtns.Align := alBottom;

    glaRigth, glaLeft:
      begin
        if Input.BtnsLayout = glaRigth then
          pnBtns.Align := alRight
        else
          pnBtns.Align := alLeft;
        pnBtns.Width := 29;
        btnSelectAll.Align := alTop;
        btnUnselectAll.Align := alTop;
        btnInvertSelection.Align := alTop;
        btnSelectAll.Height := 22;
        btnUnselectAll.Height := 22;
        btnInvertSelection.Height := 22;

        btnSelectAll.Top := -1;
        btnInvertSelection.Top := 999;
      end;
  end;

  btnSelectAll.Visible := (gbtSelection in FParams.Buttons) or (gbtSelectAll in FParams.Buttons);
  btnUnselectAll.Visible := (gbtSelection in FParams.Buttons) or (gbtUnselectAll in FParams.Buttons);
  btnInvertSelection.Visible := (gbtSelection in FParams.Buttons) or (gbtInvertSelection in FParams.Buttons);

  pnBtns.Visible    := FParams.Buttons <> []; // Controle do botoes visiveis ou nao
  pnTopLeft.Visible := pnBtns.Visible;        // pnTopLeft so server para conter os botoes
  pnBtns.Parent     := pnTopLeft;
  pnBtns.AutoSize   := True;                  // Ajusta o tamanho para a quantidaed de botoes na tela
  pnTopLeft.Width   := pnBtns.Width;          // Ajusta a largura do panel para a mesma dos botoes
  pnTop.Height      := pnBtns.Height;         // Ajusta a altura do panel para a mesma dos botoes
  pnBtns.Align      := alTop;

  FilterContainerFrame1.Visible := False;

  pnTop.Visible := pnBtns.Visible or FilterContainerFrame1.Visible;
end;

procedure TDBGridFrame.SetupMenus;
var
  Filtro: string;
  fc: FilterCondition;
  mnSubMn: TMenuItem;
begin
  if (FOriginalDataSet = nil) or not (FOriginalDataSet is TClientDataSet) then
  begin
    WhenFilterChange(Filtro);
    Exit;
  end;

  FilterContainerFrame1.OnFilterChange := WhenFilterChange;
  FilterContainerFrame1.Setup((FOriginalDataSet as TClientDataSet));

  for fc := Low(FilterCondition) to High(FilterCondition) do
  begin
    mnSubMn     := TMenuItem.Create(Filtrarquando1);
    mnSubMn.Caption := FilterConditionStr[fc];
    mnSubMn.OnClick := popMenuFiltrarQuandoClick;
    Filtrarquando1.Add(mnSubMn);

    mnSubMn         := TMenuItem.Create(Filtrarquandono1);
    mnSubMn.Caption := FilterConditionStr[fc];
    mnSubMn.OnClick := popMenuFiltrarQuandoClick;
    mnSubMn.Tag     := -1;
    Filtrarquandono1.Add(mnSubMn);
  end;
end;

procedure TDBGridFrame.WhenFilterChange(var value: string);
begin
  FilterContainerFrame1.Visible := Trim(value) <> '';

  pnTop.Visible := pnBtns.Visible or FilterContainerFrame1.Visible;

  if FilterContainerFrame1.Visible then
    pnTop.Height := 36
  else if pnBtns.Visible then
    pnTop.Height := pnBtns.Height;
end;

procedure TDBGridFrame.DBGridColEnter(Sender: TObject);
begin
  if Assigned(FOriginalOnColEnter) then
    FOriginalOnColEnter(Sender);
end;

procedure TDBGridFrame.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

var
  IsSelected: Boolean;
  DrawRect: TRect;
  Check: Cardinal;
begin
  if not Assigned(FFieldSelection) then
    Exit;
  
  // Chama handler original, se existir
  //if Assigned(FOriginalOnDrawCell) then
    //FOriginalOnDrawCell(Sender, Rect, DataCol, Column, State);

  // Renderiza checkbox apenas na primeira coluna (índice 0)
  if Column.FieldName = FFieldSelection.FieldName then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 2 then
      Column.Field.DisplayWidth := 2;

    IsSelected := GetIsRowSelected;

    // Limpa fundo
    if gdSelected in State then
      DBGrid.Canvas.Brush.Color := clHighlight
    else
      DBGrid.Canvas.Brush.Color := DBGrid.Color;
    DBGrid.Canvas.FillRect(Rect);

    // Desenha checkbox
    DrawRect := Rect;
    InflateRect(DrawRect, 2, 0);
    //DrawFrameControl(DBGrid.Canvas.Handle, DrawRect, DFC_BUTTON, DFCS_BUTTONCHECK or (Ord(IsSelected) * DFCS_CHECKED));

    Check := 0;
    if IsSelected then
      Check := DFCS_CHECKED
    else
      Check := 0;

    DrawFrameControl(DBGrid.Canvas.Handle, DrawRect, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    //DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TDBGridFrame.SetDataSource(const Value: TDataSource);
begin
  if Value <> FOriginalDataSource then
  begin
    FOriginalDataSource := Value;
    //ResetSelection;
    if Assigned(Value) then
      FOriginalDataSet := Value.DataSet
    else
      FOriginalDataSet := nil;

    DBGrid.DataSource := FOriginalDataSource;
    //UpdateButtonStates;
  end;

  FFieldSelection := nil;
  if (FParams.SelectionField <> '') and Assigned(FOriginalDataSet) then
    FFieldSelection := FOriginalDataSet.FindField(FParams.SelectionField);

  if Assigned(FFieldSelection) then
    DBGrid.OnDrawColumnCell := DBGridDrawColumnCell
  else
    DBGrid.OnDrawColumnCell := nil;

  SetupMenus();

//  o campo criado aqui nao deu certo, tem de vir direto do select

//  ou

//  fazer o close antes de chamar aqui????? seraaaaaaa?????

end;

{ TDBGridFrameSetup }

class function TDBGridFrameSetup.CreateClean: TDBGridFrameSetup;
begin
  Result := TDBGridFrameSetup.CreateSelection(glaTop, [], '');
end;

class function TDBGridFrameSetup.CreateSelection(BtnsLayout: TDBGridFrameLayout;
  Buttons: TDBGridFrameBtnsSet;
  const SelectionField: string): TDBGridFrameSetup;
begin                        
  Result.FSelectionField := SelectionField;
  Result.FBtnsLayout := BtnsLayout;
  Result.FButtons := Buttons;
end;

end.
