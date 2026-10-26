unit hw_grid_utils;

interface

uses
  Windows, Classes, Controls,  Grids, DBGrids, config_colunas_class, Query_OOP;

type
  THwHack_DbGrid = class(TComponent)
  private
    FDBGrid              : TDBGrid;
    FieldSel             : string;
    FHighLightRow        : Boolean;
    RescueDblClick       : TNotifyEvent;
    RescueKeyDown        : TKeyEvent;
    RescueMouseUp        : TMouseEvent;
    RescueCellClick      : TDBGridClickEvent;
    RescueDrawColumnCell : TDrawColumnCellEvent;
  public
    procedure DBGridOnDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridOnDblClick(Sender: TObject);
    procedure DBGridOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBGridOnCellClick(Column: TColumn);
    procedure DBGridOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure CheckUnCheckRow;
  public
    constructor Create(Sender: TDBGrid;
                       KeyDown: Boolean = True;
                       DblClick: Boolean = True;
                       CellClick: Boolean = True;
                       DrawColumnCell: Boolean = True;
                       MouseUp: Boolean = True
                      );

    procedure ChangeStateKeyDown(Enabled: Boolean; KeepRescueEvent: Boolean = True);
    procedure ChangeStateDblClick(Enabled: Boolean; KeepRescueEvent: Boolean = True);
    procedure ChangeStateCellClick(Enabled: Boolean; KeepRescueEvent: Boolean = True);
    procedure ChangeStateDrawColumnCell(Enabled: Boolean; KeepRescueEvent: Boolean = True);
    procedure ChangeStateMouseUp(Enabled: Boolean; KeepRescueEvent: Boolean = True);

    property HighLightRow: Boolean read FHighLightRow write FHighLightRow;
  end;

  TGridHandlerNeedData = function(componentName: string): TConfig_colunass_class of object;
  TGridHandlerPostData = procedure (componentName: string; payload: TConfig_colunass_class) of object;
  TGridHandlerNeedQueryOOP = function(var usuario: string): TQuery_OOP of object;

  TGridHack = class(TCustomDBGrid);
  TCustomGridHack = class(TCustomGrid);
  ArrayS = array of string;

  TGridHandler = class
  strict private
    baseSchema: string; // Caso o schema original não tenha dados salvos vai usar esse como base
    schemas: TStrings;
    lastVisibles: TStrings;
    lastInVisibles: TStrings;
    lastPositions: TStrings;
  private
    FOnNeedQueryOOP: TGridHandlerNeedQueryOOP;

    function GetCollumns(componentName: string): TConfig_colunass_class;
    procedure PostCollumns(componentName: string; payload: TConfig_colunass_class);

    procedure gridValidate(grid: TDBGrid);
    procedure gridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure gridInit(grid: TDBGrid; schemaName: string; clearCollumns: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    // Auxiliares de configuração antes de chamar o Configure
    function Visibility(fields: string; isVisible: Boolean = True): TGridHandler;
    function Position(fields: string; idx: Integer): TGridHandler;
    function SchemaBase(schemaName: string): TGridHandler;
    // Configurar o grid inteiro
    function Configure(grid: TDBGrid; schemaName: string; clearCollumns: Boolean = True): TGridHandler; overload;
    function Configure(grid: TDBGrid; clearCollumns: Boolean = True): TGridHandler; overload;
    // Salvar grid no configcolunas
    function PersistGrid(grid: TDBGrid; componentName: string; onlyIfEmpty: Boolean = False): TGridHandler; overload;
    function PersistGrid(grid: TDBGrid; onlyIfEmpty: Boolean = False): TGridHandler; overload;

    // Funções auxiliares não relacionadas a aos metodos acima
    function ChangeVisibility(grid: TDBGrid; const fields: array of string; isVisible: Boolean): TGridHandler;

//    function AsSchemaName(schemaName: string): TGridHandler;

    // Criar um metodo para chamar em um exit de formulario para sair caso tenha algum modificação, por exemplo se modificar a largura

    property OnNeedQueryOOP: TGridHandlerNeedQueryOOP write FOnNeedQueryOOP;
  end;

  GridHandlerSingleton = class(TGridHandler)
  strict private
    class var FInstance : TGridHandler;
  public
    class function GetInstance(): TGridHandler;
    class procedure ReleaseInstance();
  end;

implementation

uses
  Graphics, DB, StrUtils, SysUtils, Math, hw_utils, hw_win_utils, Contnrs, Forms;

{ THwHack_DbGrid }

procedure THwHack_DbGrid.ChangeStateCellClick(Enabled,
  KeepRescueEvent: Boolean);
begin
  if Enabled then
    FDBGrid.OnCellClick := DBGridOnCellClick
  else if KeepRescueEvent then
    FDBGrid.OnCellClick := RescueCellClick
  else
    FDBGrid.OnCellClick := nil;
end;

procedure THwHack_DbGrid.ChangeStateDblClick(Enabled, KeepRescueEvent: Boolean);
begin
  if Enabled then
    FDBGrid.OnDblClick := DBGridOnDblClick
  else if KeepRescueEvent then
    FDBGrid.OnDblClick := RescueDblClick
  else
    FDBGrid.OnDblClick := nil;
end;

procedure THwHack_DbGrid.ChangeStateDrawColumnCell(Enabled,
  KeepRescueEvent: Boolean);
begin
  if Enabled then
    FDBGrid.OnDrawColumnCell := DBGridOnDrawColumnCell
  else if KeepRescueEvent then
    FDBGrid.OnDrawColumnCell := RescueDrawColumnCell
  else
    FDBGrid.OnDrawColumnCell := nil;
end;

procedure THwHack_DbGrid.ChangeStateKeyDown(Enabled, KeepRescueEvent: Boolean);
begin
  if Enabled then
    FDBGrid.OnKeyDown := DBGridOnKeyDown
  else if KeepRescueEvent then
    FDBGrid.OnKeyDown := RescueKeyDown
  else
    FDBGrid.OnKeyDown := nil;    
end;

procedure THwHack_DbGrid.ChangeStateMouseUp(Enabled, KeepRescueEvent: Boolean);
begin
  if Enabled then
    FDBGrid.OnMouseUp := DBGridOnMouseUp
  else if KeepRescueEvent then
    FDBGrid.OnMouseUp := RescueMouseUp
  else
    FDBGrid.OnMouseUp := nil;
end;

procedure THwHack_DbGrid.CheckUnCheckRow;
var
  DataSet: TDataSet;
begin
  if not Assigned(FDBGrid.DataSource) then
    Exit;
    
  if not Assigned(FDBGrid.DataSource.DataSet) then
    Exit;

  DataSet := FDBGrid.DataSource.DataSet;
  
  if DataSet.IsEmpty then
    Exit;

  DataSet.Edit;
  DataSet.FieldByName(FieldSel).AsString := IfThen(DataSet.FieldByName(FieldSel).AsString = 'S', '', 'S');
  DataSet.Post;
end;

constructor THwHack_DbGrid.Create(Sender: TDBGrid; KeyDown,
  DblClick, CellClick, DrawColumnCell, MouseUp: Boolean);
begin
  inherited Create(Sender.Owner);

  FDBGrid      := Sender;
  FieldSel     := 'SEL';
  HighLightRow := True;
         
  RescueDblClick       := Sender.OnDblClick;
  RescueKeyDown        := Sender.OnKeyDown;
  RescueMouseUp        := Sender.OnMouseUp;
  RescueCellClick      := Sender.OnCellClick;
  RescueDrawColumnCell := Sender.OnDrawColumnCell;

  ChangeStateKeyDown(KeyDown);
  ChangeStateDblClick(DblClick);
  ChangeStateCellClick(CellClick);
  ChangeStateDrawColumnCell(DrawColumnCell);
  ChangeStateMouseUp(MouseUp);
end;

procedure THwHack_DbGrid.DBGridOnCellClick(Column: TColumn);
begin
  if Assigned(RescueCellClick) then
    RescueCellClick(Column);  
    
  if UpperCase(Column.FieldName) = FieldSel then
    CheckUnCheckRow;
end;

procedure THwHack_DbGrid.DBGridOnDblClick(Sender: TObject);
begin
  if Assigned(RescueDblClick) then
    RescueDblClick(Sender);  
    
  CheckUnCheckRow;  
end;

procedure THwHack_DbGrid.DBGridOnDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;

  if Assigned(RescueDrawColumnCell) then
    RescueDrawColumnCell(Sender, Rect, DataCol, Column, State);
  
  if not Assigned(Sender) then
    Exit;

  Agrid := TDBGrid(Sender);

  if Agrid.DataSource.DataSet.IsEmpty then
    Exit;

  if (UpperCase(Column.FieldName) <> FieldSel) and (not HighLightRow) then
    Exit;  
  
  if Agrid.DataSource.DataSet.FieldByName(FieldSel).AsString = 'S' then
    if (gdFocused in State) then
    begin
      Agrid.Canvas.Brush.Color := clWindow;
      Agrid.Canvas.Font.Color  := clWindowText;
    end
    else
    begin
      Agrid.Canvas.Brush.Color := clHighlight;
      Agrid.Canvas.Font.Color  := clWhite;
    end;
  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if UpperCase(Column.FieldName) = FieldSel then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0);
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure THwHack_DbGrid.DBGridOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Assigned(RescueKeyDown) then
    RescueKeyDown(Sender, Key, Shift);  
    
  if Key = VK_SPACE then
    CheckUnCheckRow;
end;

procedure THwHack_DbGrid.DBGridOnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(RescueMouseUp) then
    RescueMouseUp(Sender, Button, Shift, X, Y);  
    
  if Classes.ssCtrl in Shift then
    CheckUnCheckRow;
end;

{ GridHandlerSingleton }

class function GridHandlerSingleton.GetInstance: TGridHandler;
begin
  if not Assigned(Self.FInstance) then
    Self.FInstance := TGridHandler.Create();
  Result := Self.FInstance;
end;

class procedure GridHandlerSingleton.ReleaseInstance;
begin
  if Assigned(Self.FInstance) then
    FreeAndNil(Self.FInstance);
end;

{ TGridHandler }

function TGridHandler.Configure(grid: TDBGrid; schemaName: string;
  clearCollumns: Boolean): TGridHandler;
var
  completeName: string;
  winCtrl: TWinControl;
begin
  Result := Self;

  gridValidate(grid);

  completeName := '';
  winCtrl := grid.Parent;
  while (Trim(completeName) = '' ) and (winCtrl <> nil) do
  begin
    if (winCtrl is TForm)  then
      completeName := winCtrl.Name + '.'
    else
      winCtrl := winCtrl.Parent;
  end;

  completeName := completeName + grid.Name;

  schemas.Values[completeName] := schemaName;
                                        
  gridInit(grid, schemaName, clearCollumns);
  grid.OnColumnMoved := gridColumnMoved;
end;

function TGridHandler.ChangeVisibility(grid: TDBGrid;
  const fields: array of string;
  isVisible: Boolean): TGridHandler;
var
  fieldName: string;
  I: Integer;
begin
  TGridHack(grid).BeginUpdate;
  try
    for fieldName in fields do
      for I := 0 to grid.Columns.Count - 1 do
        if UpperCase(grid.Columns[I].FieldName) = UpperCase(fieldName) then
        begin
          grid.Columns[I].Visible := isVisible;
          Break;
        end;
  finally
    TGridHack(grid).EndUpdate;
  end;

end;

function TGridHandler.Configure(grid: TDBGrid; clearCollumns: Boolean): TGridHandler;
begin
  gridValidate(grid);

  Result := Configure(grid, grid.DataSource.DataSet.Name, clearCollumns);
end;

constructor TGridHandler.Create;
begin
  schemas := NewStringList();
  lastVisibles := NewStringList(True);
  lastInVisibles := NewStringList(True);
  lastPositions := NewStringList();
end;

destructor TGridHandler.Destroy;
begin
  schemas.Free;
  lastVisibles.Free;
  lastInVisibles.Free;
  lastPositions.Free;

  inherited;
end;

function TGridHandler.GetCollumns(
  componentName: string): TConfig_colunass_class;
var
  userName: string;
  queryCons: TQuery_OOP;
begin
  queryCons := FOnNeedQueryOOP(userName);
  try
    queryCons.Table('config_colunas', '*')
      .Equals('usuario', userName)
      .Equals('componente', componentName)
      .OrderBy('ordem')
      .Open;

    Result := TConfig_colunass_class.Create;
    Result.CopyFrom(TConfig_colunas_class, queryCons.query, False);
    queryCons.Close;

  finally
    queryCons.Free();
  end;
end;

procedure TGridHandler.gridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  columnsVis: TConfig_colunass_class;
  column: TConfig_colunas_class;
  grid: TDBGrid;
  completeName, componentName: string;
  winCtrl: TWinControl;
  C: Integer;
begin
  completeName := '';

  grid := (Sender as TDBGrid);

  winCtrl := grid.Parent;
  while (Trim(completeName) = '' ) and (winCtrl <> nil) do
  begin
    if (winCtrl is TForm)  then
      completeName := winCtrl.Name + '.'
    else
      winCtrl := winCtrl.Parent;
  end;

  completeName := completeName + grid.Name;

  PersistGrid(grid, schemas.Values[completeName]);
  Exit;

  columnsVis := TConfig_colunass_class.Create;
  try
    grid := (Sender as TDBGrid);
    componentName := schemas.Values[completeName];

    for C := 0 to grid.Columns.Count - 1 do
      if grid.Columns[C].Visible then
      begin

        column                  := columnsVis.New;
        column.componente       := componentName;
        column.campos           := componentName + Trim(grid.Columns[C].FieldName);
        column.ordem            := grid.Columns[C].Index;
        column.visivel          := IfThen(grid.Columns[C].Visible, 1, 0);
        column.largura_exibicao := grid.Columns[C].Width;

        //columnsVis := columnsVis + [column];
      end;

    // Se quiser salvar os invisiveis só descomentar
    for C := 0 to grid.DataSource.DataSet.Fields.Count - 1 do
      if columnsVis.IndexOfByFieldName(grid.DataSource.DataSet.Fields[C].FieldName) = -1 then
      begin
        column                  := columnsVis.New;
        column.componente       := componentName;
        column.campos           := componentName + grid.DataSource.DataSet.Fields[C].FieldName;
        column.ordem            := columnsVis.Count - 1;
        column.visivel          := 0;
      end;


      PostCollumns( componentName, columnsVis );

  finally
    columnsVis.Create;
  end;
end;

procedure TGridHandler.gridInit(grid: TDBGrid; schemaName: string;
  clearCollumns: Boolean);
var
  columnsDb: TConfig_colunass_class;
  columnDb : TConfig_colunas_class;
  colGrid: TColumn;
  sendToEnd: array of Integer;
  I, C, idx, idxCol: Integer;
  isPresent, isAdd: Boolean;
  dtSet: TDataSet;
  rescDataSource: TDataSource;
begin
  if clearCollumns then
    grid.Columns.Clear;

  columnsDb := GetCollumns(schemaName);

  if ((not Assigned(columnsDb)) or (columnsDb.Count = 0)) and
    (Trim(baseSchema) <> '') then
    columnsDb := GetCollumns(Trim(baseSchema));

  rescDataSource := grid.DataSource;
  TGridHack(grid).BeginUpdate;
  try
    if Assigned(columnsDb) and (columnsDb.Count > 0) then
    begin

//      for I := 0 to lastPositions.Count - 1 do
//        if TryStrToInt(lastPositions.ValueFromIndex[I], idx) then
//          columnsDb.MoveTo(AnsiUpperCase(lastPositions.Names[I]), idx);

      dtSet := grid.DataSource.DataSet;
      for I := 0 to dtSet.Fields.Count - 1 do
      begin
        idx := columnsDb.IndexOfByFieldName(dtSet.Fields[I].FieldName);
        if idx = -1 then
        begin
          columnDb := columnsDb.New;
          columnDb.componente := schemaName;
          columnDb.campos := schemaName + dtSet.Fields[I].FieldName;
          columnDb.visivel := IfThen((dtSet.Fields[I].Tag = 2) or (dtSet.Fields[I].Tag = 0), 1, 0);
        end
        else
          columnDb := columnsDb[idx];

        if (dtSet.Fields[I].Tag = 1) then // invisivel
          columnDb.visivel := 0;
        columnDb.InDataSet := True;

        if Assigned(lastVisibles) then
          if lastVisibles.IndexOf(trim(AnsiUpperCase(dtSet.Fields[I].FieldName))) >= 0 then
            columnDb.visivel := 1;

        if Assigned(lastInVisibles) then
          if lastInVisibles.IndexOf(trim(AnsiUpperCase(dtSet.Fields[I].FieldName))) >= 0 then
            columnDb.visivel := 0;

//        if Assigned(lastPositions) then
//          if lastPositions.IndexOf(Trim(AnsiUpperCase(dtSet.Fields[I].FieldName))) >= 0 then
//            if TryStrToInt(lastPositions.ValueFromIndex[I], idx) then
//              columnsDb.MoveTo(AnsiUpperCase(lastPositions.Names[I]), idx);
      end; 

      for I := 0 to lastPositions.Count - 1 do
        if TryStrToInt(lastPositions.ValueFromIndex[I], idx) then
          columnsDb.MoveTo(AnsiUpperCase(lastPositions.Names[I]), idx);

      for C := 0 to grid.Columns.Count - 1 do
        if Trim(grid.Columns[C].FieldName) <> '' then
        begin
          isPresent := False;
          for columnDb in columnsDb do
            if isPresent then
              Break
            else
              isPresent := AnsiLowerCase(Trim(grid.Columns[C].FieldName)) = AnsiLowerCase(columnDb.FieldName);

          if not isPresent then
          begin
            SetLength(sendToEnd, Length(sendToEnd) + 1);
            sendToEnd[High(sendToEnd)] := C;
          end;
        end; 

      for C := Low(sendToEnd) to High(sendToEnd) do
      begin
        grid.Columns[C].Index := grid.Columns.Count - 1;
      end;

      grid.DataSource := nil;
      grid.Columns.Clear;

      idx := 0;
      //for I := 0 to columnsDb.Count - 1 do
      for columnDb in columnsDb do
        if columnDb.InDataSet then
        begin
          colGrid := nil;

          for C := 0 to grid.Columns.Count - 1 do
            if colGrid <> nil then
              Break
            else
            if AnsiLowerCase(Trim(grid.Columns[C].FieldName)) = AnsiLowerCase(columnDb.FieldName) then
              colGrid := grid.Columns[C];

          if colGrid = nil then
          begin
            colGrid           := grid.Columns.Add;
            colGrid.FieldName := columnDb.FieldName;
          end;

          colGrid.Visible := columnDb.IsVisible;

          if columnDb.largura_exibicao > 0 then
            colGrid.Width := columnDb.largura_exibicao;

          colGrid.Index := idx;

          idx := idx + 1;
        end;

//      for I := 0 to lastPositions.Count - 1 do
//        for C := 0 to grid.Columns.Count - 1 do
//          if AnsiLowerCase(Trim(grid.Columns[C].FieldName)) = AnsiLowerCase(lastPositions.Names[I]) then
//            if TryStrToInt(lastPositions.ValueFromIndex[I], idx) then
//            begin
//              grid.Columns.Delete(C);
//              colGrid           := grid.Columns.Add;
//              colGrid.FieldName := lastPositions.Names[I];
//              colGrid.Visible   := True;
//              colGrid.Index     := idx;
////              grid.Columns[C].Index := idx;
//              Break;
//            end;
    end
    else if grid.Columns.Count = 0 then // caso o grid já possua uma definicao
    begin

      dtSet := grid.DataSource.DataSet;

      for C := 0 to grid.Columns.Count - 1 do
      begin
        isPresent := False;
        for I := 0 to dtSet.Fields.Count - 1 do
          if isPresent then
            Break
          else
            isPresent := AnsiLowerCase(Trim(grid.Columns[C].FieldName)) = AnsiLowerCase(Trim(dtSet.Fields[I].FieldName));

        if not isPresent then
        begin
          SetLength(sendToEnd, Length(sendToEnd) + 1);
          sendToEnd[High(sendToEnd)] := C;
        end;
      end;

      for C := Low(sendToEnd) to High(sendToEnd) do
        grid.Columns[sendToEnd[C]].Index := grid.Columns.Count - 1;

      idx := 0;
      for I := 0 to dtSet.Fields.Count - 1 do
        for C := 0 to grid.Columns.Count - 1 do
          if AnsiLowerCase(Trim(grid.Columns[C].FieldName)) = AnsiLowerCase(Trim(dtSet.Fields[I].FieldName)) then
          begin
            grid.Columns[C].Visible := (dtSet.Fields[I].Tag = 2) or (dtSet.Fields[I].Tag = 0);
            if grid.Columns[C].Visible then
            begin
              grid.Columns[C].Index := idx;
              idx := idx + 1;
            end;
            Break;
          end;
    end
    else // Aqui apenas ajusta a visibilidade
    begin    
      dtSet := grid.DataSource.DataSet;
      for I := 0 to dtSet.Fields.Count - 1 do
        for C := 0 to grid.Columns.Count - 1 do
          if AnsiLowerCase(Trim(grid.Columns[C].FieldName)) = AnsiLowerCase(Trim(dtSet.Fields[I].FieldName)) then
          begin
            grid.Columns[C].Visible := (dtSet.Fields[I].Tag = 2) or (dtSet.Fields[I].Tag = 0);
            Break;
          end;
    end;

  finally
    lastVisibles.Clear;
    lastInVisibles.Clear;
    lastPositions.Clear;
    baseSchema := '';

    TGridHack(grid).ColWidthsChanged;
    TGridHack(grid).EndUpdate;
//    TGridHack(grid).ColWidthsChanged;

    grid.DataSource := rescDataSource;
    if Assigned(columnsDb) then
      FreeAndNil(columnsDb);
  end;
end;

procedure TGridHandler.gridValidate(grid: TDBGrid);
begin
  if grid.DataSource = nil then
    raise Exception.Create('TGridHandler.Configure > DataSource nil');

  if grid.DataSource.DataSet = nil then
    raise Exception.Create('TGridHandler.Configure > DataSet nil');

  if not Assigned(FOnNeedQueryOOP) then
    raise Exception.Create('TGridHandler.Configure > OnNeedQueryOOP nil');
end;

function TGridHandler.PersistGrid(grid: TDBGrid;
  componentName: string; onlyIfEmpty: Boolean): TGridHandler;
var
  columnsVis: TConfig_colunass_class;
  column: TConfig_colunas_class;
  dtset: TDataSet;
  C: Integer;
begin
  Result := Self;

  gridValidate(grid);

  if Trim(componentName) = '' then
    componentName := grid.DataSource.DataSet.Name;

  if onlyIfEmpty then
  begin
    columnsVis := GetCollumns(componentName);
    if columnsVis.Count > 0 then
    begin
      columnsVis.Free;
      Exit;
    end;
  end;

  columnsVis := TConfig_colunass_class.Create;
  try
    for C := 0 to grid.Columns.Count - 1 do
      //if grid.Columns[C].Visible then
      begin

        column                  := columnsVis.New;
        column.componente       := componentName;
        column.campos           := componentName + Trim(grid.Columns[C].FieldName);
        column.ordem            := grid.Columns[C].Index;
        column.visivel          := IfThen(grid.Columns[C].Visible, 1, 0);
        column.largura_exibicao := grid.Columns[C].Width;

      end;

    // Aqui todas colunas não existentes ficam invisiveis, pois no grid essas colunas nao existem
    dtSet := grid.DataSource.DataSet;
    for C := 0 to dtSet.Fields.Count - 1 do
      if columnsVis.IndexOfByFieldName(dtSet.Fields[C].FieldName) = -1 then
      begin
        column            := columnsVis.New;
        column.componente := componentName;
        column.campos     := componentName + dtSet.Fields[C].FieldName;
        column.ordem      := columnsVis.Count - 1;
        column.visivel    := 0;
      end;

    PostCollumns( componentName, columnsVis );

  finally
    columnsVis.Free;
  end;
end;

function TGridHandler.PersistGrid(grid: TDBGrid;
  onlyIfEmpty: Boolean): TGridHandler;
begin
  gridValidate(grid);

  Result := PersistGrid(grid, grid.DataSource.DataSet.Name, onlyIfEmpty);
end;

function TGridHandler.Position(fields: string; idx: Integer): TGridHandler;
var
  listF: TStrings;
  I: Integer;
begin
  Result := Self;

  listF := NewStringList(fields, ';');
  try
    for I := 0 to listF.Count - 1 do
      lastPositions.Values[listF[I]] := IntToStr(idx + I);

  finally
    listF.Free;
  end;
end;

procedure TGridHandler.PostCollumns(componentName: string;
  payload: TConfig_colunass_class);
var
  conf: TConfig_colunas_class;
  userName: string;
  queryCons: TQuery_OOP;
begin
  queryCons := FOnNeedQueryOOP(userName);
  try
    try

      queryCons.SQL('delete from config_colunas')
        .Equals('usuario', userName)
        .Equals('componente', componentName)
        .ExecSQL();

      for conf in payload do        
      begin
        conf.usuario := userName;
        queryCons.SQL(
          conf.SQLMotor().SQLUpdateOrInsert)
          .ExecSQL;
      end;

      if queryCons.query.Transaction.InTransaction then
          queryCons.query.Transaction.Commit;

    except on E: Exception do
      begin
        if queryCons.query.Transaction.InTransaction then
          queryCons.query.Transaction.Rollback;
      end;
    end;
  finally
    queryCons.Free();
  end;
end;

function TGridHandler.SchemaBase(schemaName: string): TGridHandler;
begin
  Result := Self;
  baseSchema := schemaName;
end;

function TGridHandler.Visibility(fields: string;
  isVisible: Boolean): TGridHandler;
var
  sField: string;
  listF: TStrings;
  I: Integer;
begin
  Result := Self;

  if lastVisibles <> nil then
    lastVisibles.Free;

  if lastInVisibles <> nil then
    lastInVisibles.Free;

  lastVisibles := NewStringList(True);
  lastInVisibles := NewStringList(True);

  listF := NewStringList(True, fields, ';');

  try
    if isVisible then
      for sField in listF do
        lastVisibles.Add(Trim(AnsiUpperCase(sField)));

    if not isVisible then
      for sField in listF do
        lastInVisibles.Add(Trim(AnsiUpperCase(sField)));
  finally
    listF.Free;
  end;
end;

initialization

finalization
  GridHandlerSingleton.ReleaseInstance();

end.
