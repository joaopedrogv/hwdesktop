unit DataGridFrame;

interface

uses
  Vcl.Forms, Vcl.Graphics, Vcl.Controls, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBGrids,
  System.Classes, System.Types, Data.DB, QueryResultOperations;

type
  TfrmDataGridFrame = class(TFrame)
    pnComandos: TPanel;
    btnSelecionarTodos: TButton;
    btnDesmarcarTodos: TButton;
    btnInverterSelecao: TButton;
    dbgDados: TDBGrid;
    procedure DrawCheckboxCell(const Rect: TRect;
      const State: TGridDrawState; AState: Boolean);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgDadosCellClick(Column: TColumn);
    procedure btnSelecionarTodosClick(Sender: TObject);
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure btnInverterSelecaoClick(Sender: TObject);
    procedure dbgDadosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FMarkingColumn: string;
    FOperations: IQueryResultOperations;

    function GetDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
    function MarkingActive(): Boolean;
    procedure DoMarkOperation(AOperation: TMarkOperation);
  public
    procedure Configure(AOperations: IQueryResultOperations = nil);
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

implementation

uses
  SysUtils, Winapi.Windows;

{$R *.dfm}

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

procedure TfrmDataGridFrame.SetDataSource(const Value: TDataSource);
begin
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

procedure TfrmDataGridFrame.Configure(AOperations: IQueryResultOperations = nil);
begin
  FOperations := AOperations;

  if FOperations <> nil then
    FMarkingColumn := FOperations.MarkingColumnName()
  else
    FMarkingColumn := '';

  pnComandos.Visible := (FMarkingColumn <> '') and (FOperations <> nil);
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
