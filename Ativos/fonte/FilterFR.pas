unit FilterFR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, StdCtrls, Mask, ExtCtrls, hw_filters, Buttons, Menus;

type

  TProps = class
  private
    Fitems: TFilterPropsList;
    function GetFieldByDisplay(const Display: string): TFilterProps;
    function Add(dbField: TField): TProps;
  public
    constructor Create();
    destructor Destroy; override;

    property items: TFilterPropsList read Fitems write Fitems;
    property FieldByDisplay[const Display: string]: TFilterProps read GetFieldByDisplay;
  end;

  TFilterFrameFieldChange = procedure(const Field: TFilterProps; var CondSet: FilterConditionEnumSet) of object;

  TFilterFrame = class(TFrame)
    pnCampo: TPanel;
    lbCampo: TLabel;
    edCampos: TComboBox;
    SplitterCampo: TSplitter;
    pnCondicao: TPanel;
    lbCondicao: TLabel;
    edCondicao: TComboBox;
    spliterMeio: TSplitter;
    pnConteudo1: TPanel;
    lbConteudo1: TLabel;
    edConteudo1: TMaskEdit;
    SplitterConteudo: TSplitter;
    pnConteudo2: TPanel;
    lbConteudo2: TLabel;
    edConteudo2: TMaskEdit;
    pnConteudos: TPanel;
    spliterBtn: TSplitter;
    pnBtns: TPanel;
    lbCountFiltros: TLabel;
    btnAddFilter: TSpeedButton;
    procedure lbCountFiltrosClick(Sender: TObject);
    procedure btnAddFilterClick(Sender: TObject);
    procedure edCondicaoChange(Sender: TObject);
    procedure edCamposChange(Sender: TObject);
    procedure edCondicaoExit(Sender: TObject);
    procedure edConteudo2Exit(Sender: TObject);
    procedure edConteudo1Exit(Sender: TObject);
    procedure edCamposExit(Sender: TObject);
  private
    MyOwner: TComponent;
    MyOwnerForm: TForm;
    FDataSet: TDataSet;
    FProps: TProps;
    OwnerComponentName: string;
    CompleteComponentName: string;
    Filtros: TFilterPropsList;
    PopMenuFiltros: TPopupMenu;
    ConsultaPorTodos: Boolean;
    FOnFieldChange: TFilterFrameFieldChange;
    function GetCurrentFilter: TFilterProps;
    function GetCompleteName: string;
    procedure PopMenuDeleteItemClick(Sender: TObject);

    property Props: TProps read FProps;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    // Recebe campos ja preparados/configurados; nao abre a consulta.
    // Sem Displays: inclui fkData com Tag<>1; com Displays: seleciona por DisplayLabel.
    // A selecao configura operadores por tipo; OnFieldChange permite especializacao.
    function FillForm(DataSet: TDataSet; Displays: TStrings; defaultDisplay: string = ''): TFilterFrame;
    function TodosToggle(const OnOff: Boolean): TFilterFrame;
    // Valida o filtro corrente e retorna clones; a opcao Todos retorna lista vazia.
    function GetFiltros: TFiltersProps;

    property CurrentFilter: TFilterProps read GetCurrentFilter;
    property OnFieldChange: TFilterFrameFieldChange read FOnFieldChange write FOnFieldChange;
  end;

implementation

uses
  StrUtils, Math, DateUtils,
  hw_win_utils, Contnrs;

{$R *.dfm}

{ TFrame1 }

function TFilterFrame.TodosToggle(const OnOff: Boolean): TFilterFrame;
var
  idx: Integer;
begin
  Result := Self;
  ConsultaPorTodos := OnOff;

  if not Assigned(FDataSet) then
    Exit;

  idx := edCampos.Items.IndexOf('Todos');

  if OnOff and (idx = -1) then
    edCampos.Items.Add('Todos');

  if (not OnOff) and (idx > -1) then
  begin
    edCampos.Items.Delete(idx);
    if (Trim(LowerCase(edCampos.Text)) = 'todos') or (edCampos.ItemIndex = -1) then
      edCampos.ItemIndex := 0;

    pnCondicao.ParentFont := True;
    pnConteudos.ParentFont := True;
  end;
end;

procedure TFilterFrame.btnAddFilterClick(Sender: TObject);
var
  filter: TFilterProps;
  I: Integer;
  sCaption: string;
begin
  if Assigned(MyOwnerForm) then
    if MyOwnerForm.ActiveControl = edCampos then
      edCamposExit(edCampos)
    else if MyOwnerForm.ActiveControl = edCondicao then
      edCondicaoExit(edCondicao)
    else if MyOwnerForm.ActiveControl = edConteudo1 then
      edConteudo1Exit(edConteudo1)
    else if MyOwnerForm.ActiveControl = edConteudo2 then
      edConteudo2Exit(edConteudo2);

  filter := Props.FieldByDisplay[edCampos.Text];

  if not Assigned(filter) then
    Exit;

  if not CurrentFilter.IsValidQueryable(sCaption) then
  begin
    Application.MessageBox(PAnsiChar(sCaption), 'Atenção', MB_ICONERROR + MB_OK);
    Exit;
  end;

  sCaption := CurrentFilter.GetDisplayRead;
  for I := 0 to Filtros.Count - 1 do
    if sCaption = Filtros.Items[I].GetDisplayRead then
      Exit;

  Filtros.Add(CurrentFilter.Clone);

  lbCountFiltros.Caption := '+' + IntToStr(Filtros.Count);
  lbCountFiltros.Cursor := crHandPoint;

  lbCountFiltros.Hint := '';
  for I := 0 to Filtros.Count - 1 do
    lbCountFiltros.Hint := lbCountFiltros.Hint +
      IfThen(I > 0, sLineBreak + '-' + sLineBreak) +
      Filtros.Items[I].GetDisplayRead ;
end;

constructor TFilterFrame.Create(AOwner: TComponent);
var
  I: Integer;
begin
  inherited Create(AOwner);
  MyOwner := AOwner;
  // So obter o nome do componente após o create, ou seja fora daqui
  CompleteComponentName := '';
  FOnFieldChange := nil;

  FProps := TProps.Create;
  Filtros := TFilterPropsList.Create();

  edCondicao.Items.Clear;
  edCondicao.Text := '?';

  lbCountFiltros.Caption := ' ';
  lbCountFiltros.Visible := True;

  PopMenuFiltros := TPopupMenu.Create(nil);
//  for I := Low(COND_LIST) to High(COND_LIST) do
//    edCondicao.Items.Add(COND_LIST[I]);

end;

destructor TFilterFrame.Destroy;
begin
  FreeAndNil(FProps);
  FreeAndNil(Filtros);
  FreeAndNil(PopMenuFiltros);
  FOnFieldChange := nil;
  inherited;
end;

procedure TFilterFrame.edCamposChange(Sender: TObject);
var
  filter: TFilterProps;
  defaultCondicao, defaultValue1, defaultValue2: string;
  I: Integer;
  isBetween: Boolean;
  condSet: FilterConditionEnumSet;
  eCond: FilterConditionEnum;
begin
   filter := Props.FieldByDisplay[edCampos.Text];

  if not Assigned(filter) then
  begin
    if (ConsultaPorTodos) and (Trim(LowerCase(edCampos.Text)) = 'todos') and (edCampos.Items.IndexOf('Todos') >= 0) then
    begin
      pnCondicao.Enabled := False;
      pnConteudos.Enabled := False;
      pnCondicao.ParentFont := False;
      pnConteudos.ParentFont := False;
      pnCondicao.Font.Color := clGrayText;
      pnConteudos.Font.Color := clGrayText;
    end;
    Exit;
  end;

  pnCondicao.ParentFont := True;
  pnConteudos.ParentFont := True;
  pnCondicao.Enabled := True;
  pnConteudos.Enabled := True;

  edCondicao.Items.Clear;

  if filter.type_ = ftString then
    condSet := FilterSetString
  else
    condSet := FilterSetNumbers;

  if Assigned(FOnFieldChange) then
    FOnFieldChange(filter, condSet);

  for eCond := Low(FilterConditionEnum) to High(FilterConditionEnum) do
    if eCond in condSet then
      edCondicao.Items.Add( COND_LIST_ALL[eCond] );
  {
  if filter.type_ = ftString then
  begin
    for I := Low(COND_LIST_STRINGS) to High(COND_LIST_STRINGS) do
      edCondicao.Items.Add(COND_LIST_STRINGS[I]);
  end
  else
    for I := Low(COND_LIST_NUMBERS) to High(COND_LIST_NUMBERS) do
      edCondicao.Items.Add(COND_LIST_NUMBERS[I]);
  }
  defaultCondicao := IfThen(edCondicao.Text <> '?', edCondicao.Text,
    IfThen(filter.type_ in [ftDateTime, ftDate], 'Entre', 'Igual'));

  defaultCondicao := RegistroWin.Read(CompleteComponentName, edCondicao.Name + '_' + filter.field, defaultCondicao);
  edCondicao.ItemIndex := edCondicao.Items.IndexOf(defaultCondicao);
  edCondicao.ItemIndex := IfThen(edCondicao.ItemIndex >= 0, edCondicao.ItemIndex);
  edCondicaoChange(edCondicao);
end;

procedure TFilterFrame.edCamposExit(Sender: TObject);
var
  filter: TFilterProps;
  error: string;
//  defaultCondicao, defaultValue1, defaultValue2: string;
begin
  if (ConsultaPorTodos) and (Trim(LowerCase(edCampos.Text)) = 'todos') and (edCampos.Items.IndexOf('Todos') >= 0) then
  begin
    edCampos.Text := 'Todos';
    RegistroWin.Write(CompleteComponentName, edCampos.Name, Trim(edCampos.Text));
    Exit;
  end;

  filter := Props.FieldByDisplay[edCampos.Text];

  if not Assigned(filter) then
    Exit;

  edCampos.Text := filter.caption;

  if CurrentFilter.IsValidQueryable(error) then
    RegistroWin.Write(CompleteComponentName, edCampos.Name, Trim(edCampos.Text))
end;

procedure TFilterFrame.edCondicaoChange(Sender: TObject);
var
  isBetween, isNoContent: Boolean;
  filter: TFilterProps;
  defaultCondicao, defaultValue1, defaultValue2: string;  
begin
  filter := Props.FieldByDisplay[edCampos.Text];

  if not Assigned(filter) then
    Exit;

  isBetween := AnsiLowerCase(Trim(edCondicao.Text)) = 'entre';
  isNoContent := ContainsText(edCondicao.Text, 'vazio') or ContainsText(edCondicao.Text, 'nulo');
  pnConteudo2.Visible := isBetween;// filter.type_ in [ftDateTime, ftDate];
  SplitterConteudo.Visible := pnConteudo2.Visible;
  SplitterConteudo.Left := Self.Width;
  pnConteudo2.Left := SplitterConteudo.Left + SplitterConteudo.Width;//Self.Width;
  spliterBtn.Left := pnConteudo2.Left + pnConteudo2.Width; //Self.Width;
  pnBtns.Left := spliterBtn.Left + spliterBtn.Width;// Self.Width;

  edConteudo1.Enabled := not isNoContent;
  if isBetween then
  begin
    if filter.type_ in [ftDateTime, ftDate] then
    begin
      lbConteudo1.Caption  := 'Data Inicial';
      lbConteudo2.Caption  := 'Data Final';
      edConteudo2.EditMask := '!99/99/0000;1;_';
    end
    else
    begin
      lbConteudo1.Caption  := 'Valor Inicial';
      lbConteudo2.Caption  := 'Valor Final';
      edConteudo2.EditMask := '';
    end;
    edConteudo1.EditMask := edConteudo2.EditMask;
  end
  else
  begin
    lbConteudo1.Caption  := 'Conteúdo';
    if (filter.type_ in [ftDateTime, ftDate]) and (edConteudo1.EditMask <> '!99/99/0000;1;_') then
      edConteudo1.EditMask := '!99/99/0000;1;_'
    else if (not (filter.type_ in [ftDateTime, ftDate])) and (edConteudo1.EditMask <> '') then
      edConteudo1.EditMask := '';
  end;

//  defaultCondicao := RegistroWin.Read(CompleteComponentName, edCondicao.Name + '_' + filter.field, 'Igual');
//  if (defaultCondicao <> '') and (edCondicao.Items.IndexOf(defaultCondicao) >= 0) then
//    edCondicao.ItemIndex := edCondicao.Items.IndexOf(defaultCondicao);
  if isNoContent then
    edConteudo1.Text := ''
  else
  begin
    edConteudo1.Text := RegistroWin.Read(CompleteComponentName, edConteudo1.Name + '_' + filter.field, '');
    if isBetween then
      edConteudo2.Text := RegistroWin.Read(CompleteComponentName, edConteudo2.Name + '_' + filter.field, '');
  end;
end;

procedure TFilterFrame.edCondicaoExit(Sender: TObject);
var
  idx: Integer;
  filter: TFilterProps;
  error: string;
begin
  idx := edCondicao.Items.IndexOf(edCondicao.Text);
  if idx = -1 then
    Exit;

  filter := Props.FieldByDisplay[edCampos.Text];

  if not Assigned(filter) then
    Exit;

  edCondicao.Text := edCondicao.Items[idx];

  if CurrentFilter.IsValidQueryable(error) then
    RegistroWin.Write(CompleteComponentName, edCondicao.Name + '_' + filter.field, edCondicao.Text);
end;

procedure TFilterFrame.edConteudo1Exit(Sender: TObject);
var
  idx: Integer;
  filter: TFilterProps;
  error: string;
begin
  idx := edCondicao.Items.IndexOf(edCondicao.Text);
  if idx = -1 then
    Exit;

  filter := Props.FieldByDisplay[edCampos.Text];

  if not Assigned(filter) then
    Exit;

  //if CurrentFilter.IsValidQueryable(error) then
    RegistroWin.Write(CompleteComponentName, edConteudo1.Name + '_' + filter.field, edConteudo1.Text);
end;

procedure TFilterFrame.edConteudo2Exit(Sender: TObject);
var
  idx: Integer;
  filter: TFilterProps;
  error: string;
begin
  idx := edCondicao.Items.IndexOf(edCondicao.Text);
  if idx = -1 then
    Exit;

  filter := Props.FieldByDisplay[edCampos.Text];

  if not Assigned(filter) then
    Exit;

  //if CurrentFilter.IsValidQueryable(error) then
    RegistroWin.Write(CompleteComponentName, edConteudo2.Name + '_' + filter.field, edConteudo2.Text);
end;

function TFilterFrame.FillForm(DataSet: TDataSet; Displays: TStrings;
  defaultDisplay: string): TFilterFrame;
var
  I: Integer;
  camposLis: TStringList;
  defaultCampo: string;
begin
  Result := Self;
  if CompleteComponentName = '' then
    CompleteComponentName := GetCompleteName;

  edConteudo1.Text := '';

  FDataSet := DataSet;

  camposLis := TStringList.Create;
  try
    camposLis.Duplicates := dupIgnore;
    camposLis.Sorted := True;

    for I := 0 to DataSet.Fields.Count - 1 do
      if Assigned(Displays) then
      begin
        if Displays.IndexOf(DataSet.Fields[I].DisplayLabel) >= 0 then
        begin
          camposLis.Add(DataSet.Fields[I].DisplayLabel);
          FProps.Add(DataSet.Fields[I]);
        end;
      end
      else if (DataSet.Fields[I].FieldKind = fkData) and (DataSet.Fields[I].Tag <> 1) then
      begin
        camposLis.Add(DataSet.Fields[I].DisplayLabel);
        FProps.Add(DataSet.Fields[I]);
      end;

    edCampos.Items.Text := camposLis.Text;

    if ConsultaPorTodos and (edCampos.Items.IndexOf('Todos') = -1) then
      edCampos.Items.Add('Todos');

    defaultCampo := RegistroWin.Read(CompleteComponentName, edCampos.Name, Trim(defaultDisplay));
    edCampos.ItemIndex := edCampos.Items.IndexOf(defaultCampo);
    edCampos.ItemIndex := IfThen(edCampos.ItemIndex >= 0, edCampos.ItemIndex);
    edCamposChange(edCampos);

  finally
    FreeAndNil(camposLis);
  end;
end;

function TFilterFrame.GetCompleteName: string;
var
  winCtl: TWinControl;
  I: Integer;
  list: TStrings;
begin
  Result := '';
  if MyOwner is TWinControl then
    winCtl := (MyOwner as TWinControl)
  else
    winCtl := Self.Parent;
  while (Trim(Result) = '') and (winCtl <> nil) do
  begin
    if (winCtl is TForm)  then
    begin
      Result := winCtl.Name + '.';
      MyOwnerForm := (winCtl as TForm);
    end
    else
      winCtl := winCtl.Parent;
  end;

  Result := Result + Self.Name;
end;

function TFilterFrame.GetCurrentFilter: TFilterProps;
var
  dataInput: TDateTime;
begin
  Result := Props.FieldByDisplay[edCampos.Text];

  if not Assigned(Result) then
    Exit; 

  Result.condition := edCondicao.Text;

  if AnsiLowerCase(Trim(Result.condition)) = 'entre' then
  begin
    if Result.type_ in [ftDateTime, ftDate] then
    begin
      if TryStrToDate(edConteudo1.Text, dataInput) then
        Result.date1 := StartOfTheDay(dataInput);

      if TryStrToDate(edConteudo2.Text, dataInput) then
        Result.date2 := EndOfTheDay(dataInput);
    end
    else
    begin
      Result.between1 := edConteudo1.Text;
      Result.between2 := edConteudo2.Text;
    end;
  end

  else if Result.type_ in [ftDateTime, ftDate] then
  begin
    if TryStrToDate(edConteudo1.Text, dataInput) then
      Result.date1 := dataInput;

    Result.date2 := 0;
  end

  else
    Result.value := edConteudo1.Text;
end;

function TFilterFrame.GetFiltros: TFiltersProps;
var
  I: Integer;
  error: string;
begin
  if (ConsultaPorTodos) and (Trim(LowerCase(edCampos.Text)) = 'todos') and (edCampos.Items.IndexOf('Todos') >= 0) then
  begin
    SetLength(Result, 0);
    Exit;
  end;

  if not Assigned(CurrentFilter) then
    raise Exception.Create('Campo de pesquisa não existe ou preparado');

  if not CurrentFilter.IsValidQueryable(error) then
    raise Exception.Create(error);

  SetLength(Result, Filtros.Count);

  for I := 0 to Filtros.Count - 1 do
    Result[I] := Filtros.Items[I].Clone;

  if Filtros.IndexOfDisplay(CurrentFilter.GetDisplayRead) = -1 then
  begin
    SetLength(Result, Length(Result) + 1);

    Result[High(Result)] := CurrentFilter.Clone;
  end;
end;

procedure TFilterFrame.lbCountFiltrosClick(Sender: TObject);
var
  mnItem: TMenuItem;
  I: Integer;
begin
  if Filtros.Count = 0 then
    Exit;

  PopMenuFiltros.Items.Clear;

  for I := 0 to Filtros.Count - 1 do
  begin
    mnItem         := PopMenuFiltros.CreateMenuItem;
    mnItem.Caption := Filtros.Items[I].GetDisplayRead;
    mnItem.Tag     := I;
    mnItem.OnClick := PopMenuDeleteItemClick;
    PopMenuFiltros.Items.Add(mnItem);
  end;

  mnItem         := PopMenuFiltros.CreateMenuItem;
  mnItem.Caption := '-';
  mnItem.Tag     := -2;
  PopMenuFiltros.Items.Add(mnItem);

  mnItem         := PopMenuFiltros.CreateMenuItem;
  mnItem.Caption := 'Limpar todos';
  mnItem.Tag     := -1;
  mnItem.OnClick := PopMenuDeleteItemClick;
  PopMenuFiltros.Items.Add(mnItem);
             
  PopMenuFiltros.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFilterFrame.PopMenuDeleteItemClick(Sender: TObject);
var
  tagItem: Integer;
begin

  if not (Sender is TMenuItem) then
    Exit;

  tagItem := (Sender as TMenuItem).Tag;

  if (tagItem < -1) or (tagItem > Filtros.Count - 1) then
    Exit;

  if tagItem = -1 then
    Filtros.Clear
  else
    Filtros.Delete(tagItem);

  lbCountFiltros.Caption := IfThen( Filtros.Count = 0, ' ', '+' + IntToStr(Filtros.Count));
  if Filtros.Count = 0 then
    lbCountFiltros.Cursor := crDefault;
end;

{ TProps }

function TProps.Add(dbField: TField): TProps;
var
  newField: TFilterProps;
begin
  Result := Self;

  //newField := TFilterProps.Create;
  newField := Fitems.New;
  newField.caption := dbField.DisplayLabel;
  newField.field := dbField.FieldName;
  newField.type_ := TFieldTypeDB(Ord(dbField.DataType));

//  SetLength(Fitems, Length(Fitems) + 1);
//  Fitems[High(Fitems)] := newField;
end;

constructor TProps.Create;
begin
//  SetLength(Fitems, 0);
  Fitems := TFilterPropsList.Create;
end;

destructor TProps.Destroy;
var
  I: Integer;
begin
  FreeAndNil(Fitems);
//  for I := Low(Fitems) to High(Fitems) do
//    FreeAndNil(Fitems);

//  SetLength(Fitems, 0);

  inherited;
end;

function TProps.GetFieldByDisplay(const Display: string): TFilterProps;
var
  I: Integer;
begin
  Result := nil;
  //for I := Low(Fitems) to High(Fitems) do
//    if Trim(AnsiUpperCase(Fitems[I].caption)) = Trim(AnsiUpperCase(Display)) then
  for I := 0 to Fitems.Count - 1 do
    if Trim(AnsiUpperCase(Fitems.Items[I].caption)) = Trim(AnsiUpperCase(Display)) then
    begin
      Result := Fitems.Items[I];
      Exit;
    end;
end;

end.

