unit FilterConditionFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB, Menus;

type
  FilterCondition = (fcEquals, fcStartsWith, fcEndsWith, fcContains, fcDiff, fcGreather, fcLess, fcGreatherEquals, fcLessEqual, fcEmpty, fcNotEmpty);
  TAllowedsFieldType = set of TFieldType;

const
  FilterConditionStr: array[FilterCondition] of string =
    ('Igual', 'Começa', 'Termina', 'Contém', 'Diferente', 'Maior', 'Menor', 'Maior ou igual', 'Menor ou igual', 'Vazio', 'Não vazio');
  AllowedsFieldType: TAllowedsFieldType = [ ftInteger, ftSmallint, ftLargeint, ftWord,
    ftFloat, ftCurrency, ftBCD,
    ftDateTime, ftDate,
    ftString, ftWideString ];

type
  TEnumDisplaySDK = record
    Value: Integer;
    Display: string;
  end;

  TEnumDisplaySDKList = array of TEnumDisplaySDK;

  TFilterConditionFrameInput = record
    DataType: TFieldType;
    Value: Variant;
    FieldName, DisplayLabel: string;
    class function Create(
      const AFieldName, ADisplayLabel: string; AValue: Variant; ADataType: TFieldType
    ): TFilterConditionFrameInput; static;
  end;

  TFilterConditionFrame = class(TFrame)
    filterPanel: TPanel;
    lbFilter: TLabel;
    moreBtn: TSpeedButton;
    procedure moreBtnClick(Sender: TObject);
    procedure lbFilterClick(Sender: TObject);
  private
    popMenu: TPopupMenu;
    FType: TFieldType;
    FValue: Variant;
    FFieldName: string;
    FDisplay: string;
    Condition: FilterCondition;
    NegativeCondition: Boolean;
    StoredValue: string;
    ValuesOptions: TEnumDisplaySDKList;
    FOnClickRemoveFilter: TNotifyEvent;
    FOnUpdateFilter: TNotifyEvent;
    function GetFieldValue(): string;
    function GetFieldDisplay(): string;
    procedure SetLabelDisplay;
    procedure AjustWidth;
    procedure popMenuCodicaoClickRuntime(Sender: TObject);
    procedure popMenuAlterarValorClick(Sender: TObject);
    procedure popMenuAlterarValorOptionsClick(Sender: TObject);
    procedure popMenuRemoveClick(Sender: TObject);
    function HandleInputStoreValue: Boolean;
  public
    procedure FillForm(AField: TFilterConditionFrameInput; ACondition: FilterCondition = fcEquals; ANegativeCondition: Boolean = False); overload;
    procedure FillForm(AField: TField; ACondition: FilterCondition = fcEquals; ANegativeCondition: Boolean = False); overload;
    procedure FillForm(AField: TField; ACondition: FilterCondition; ANegativeCondition: Boolean; AValuesOptions: TEnumDisplaySDKList); overload;
    function FilterString(): string;

    property OnClickRemoveFilter: TNotifyEvent read FOnClickRemoveFilter write FOnClickRemoveFilter;
    property OnUpdateFilter: TNotifyEvent read FOnUpdateFilter write FOnUpdateFilter;

  end;

  TFilterConditionFrameHelper = class
  public
    class function AllowType(AType: TFieldType): Boolean;
  end;

implementation

uses
  StrUtils, Math;

const
  FilterConditionDisplay: array[FilterCondition] of string =
    ('=', 'começa', 'termina', 'contém', 'diferente', '>', '<', '>=', '<=', 'Vazio', 'Não vazio');

{$R *.dfm}

procedure TFilterConditionFrame.AjustWidth;
begin
  Self.Width := lbFilter.Canvas.TextWidth(lbFilter.Caption) + lbFilter.Margins.Left + lbFilter.Margins.Right +
    moreBtn.Width + moreBtn.Margins.Left + moreBtn.Margins.Right +
    filterPanel.Margins.Left + filterPanel.Margins.Right + 5;
end;

procedure TFilterConditionFrame.FillForm(AField: TField; ACondition: FilterCondition;
  ANegativeCondition: Boolean);
begin
  FillForm( TFilterConditionFrameInput.Create(
    AField.FieldName, AField.DisplayLabel, AField.Value, AField.DataType
  ), ACondition, ANegativeCondition );
end;

procedure TFilterConditionFrame.FillForm(AField: TField; ACondition: FilterCondition; ANegativeCondition: Boolean;
  AValuesOptions: TEnumDisplaySDKList);
begin
  FillForm(AField, ACondition, ANegativeCondition);

  ValuesOptions := AValuesOptions;
  //ValuesOptions.Copy(AValuesOptions);
  SetLabelDisplay;
end;

procedure TFilterConditionFrame.FillForm(AField: TFilterConditionFrameInput; ACondition: FilterCondition;
  ANegativeCondition: Boolean);
begin
  StoredValue := '';
  FType := AField.DataType;
  
  case AField.DataType of
    ftString, ftWideString:
      FValue := Trim(string(AField.Value));
    else
      FValue := AField.Value;
  end;

  FFieldName := AField.FieldName;
  FDisplay := AField.DisplayLabel;
  Condition := ACondition;
  NegativeCondition := ANegativeCondition;
  SetLength(ValuesOptions, 0);
  //ValuesOptions := EncapsulatedList<TEnumDisplaySDK>.New();

  if Condition <> fcEquals then
   if not HandleInputStoreValue then
     StoredValue := '';

  SetLabelDisplay;
end;

function TFilterConditionFrame.FilterString: string;
begin
  Result := FFieldName;
  case Condition of
    fcEquals:
      Result := ' = ';

    fcStartsWith:
      Result := 'like%';

    fcEndsWith:
      Result := '%like';

    fcContains:
      Result := '%like%';

    fcDiff:
      Result := ' <> ';

    fcGreather:
      Result := ' > ';

    fcLess:
      Result := ' < ';

    fcGreatherEquals:
      Result := ' >= ';

    fcLessEqual:
      Result := ' <= ';

    fcEmpty:
      Result := ' is ';
  end;

  if Condition in [ fcEmpty, fcNotEmpty ] then
  begin
    if FType in [ ftString, ftWideString ] then
      Result := Format('(%s = '''' or %s is null)', [FFieldName, FFieldName])
    else
      Result := Format('(%s is null)', [FFieldName]);

    if Condition = fcNotEmpty then
      Result := Format('(not %s)', [Result]);
  end
  else if Condition in [ fcStartsWith, fcEndsWith, fcContains ] then
    Result := Format('(%s like %s)', [FFieldName, QuotedStr(ReplaceText(Result, 'like', GetFieldValue))])

  else
  begin
    if FType in [ ftDateTime, ftDate ] then
      Result := Format('(%s %s %s)', [FFieldName, Result, QuotedStr(GetFieldValue)])

    else if FType in [ ftSmallint, ftInteger, ftWord, ftLargeint ] then
      Result := Format('(%s %s %s)', [FFieldName, Result, GetFieldValue])

    else if FType in [ ftFloat, ftCurrency, ftBCD] then
      Result := Format('(%s %s %s)', [FFieldName, Result, GetFieldValue])

    else if FType in [ ftString, ftWideString ] then
      Result := Format('(%s %s %s)', [FFieldName, Result, QuotedStr(GetFieldValue)])

    else
      raise Exception.Create('DataType not defined');
  end;

  if NegativeCondition then
    Result := 'not ' + Result;
end;

function TFilterConditionFrame.GetFieldDisplay: string;
var
  iVal: Integer;
  eVal: TEnumDisplaySDK;
begin
  if (Length(ValuesOptions) > 0) and (FType in [ ftSmallint, ftInteger, ftLargeint, ftWord ]) then
  begin
    iVal := FValue;
    if Trim(StoredValue) <> '' then
      iVal := StrToInt(StoredValue);

    for eVal in ValuesOptions do
      if eVal.Value = iVal then
      begin
        Result := eVal.Display;
        Exit;
      end;
  end
  else
    Result := GetFieldValue();
end;

function TFilterConditionFrame.GetFieldValue: string;
var
  dVal: Double;
begin
  if FType in [ ftDateTime, ftDate ] then
  begin
    if Trim(StoredValue) = '' then
      Result := DateTimeToStr(VarToDateTime(FValue))
    else
      Result := StoredValue
  end

  else if FType in [ ftString, ftWideString, ftSmallint, ftInteger, ftWord, ftLargeint ] then
  begin
    if Trim(StoredValue) = '' then
      Result := VarToStr(FValue)
    else
      Result := StoredValue
  end

  else if FType in [ ftFloat, ftCurrency, ftBCD ] then
  begin
    if Trim(StoredValue) = '' then
    begin
      dVal := FValue;
      Result := Format('%f', [ dVal ])//.Replace(',', '.').QuotedString
    end
    else
      Result := StoredValue//.Replace('.', '').Replace(',', '.')
  end

  else
    raise Exception.Create('DataType not defined');
end;

function TFilterConditionFrame.HandleInputStoreValue: Boolean;
var
  strValue: string;
begin

  if Trim(StoredValue) = '' then
    strValue := GetFieldValue
  else
    strValue := Trim(StoredValue);

  StoredValue := '';
  try

    if not InputQuery('Altera valor', Format('%s %s', [ FDisplay, FilterConditionStr[Condition]]), strValue) then
      Exit;

    if FType in [ ftDateTime, ftDate ] then
      StoredValue := DateTimeToStr(StrToDateTime(strValue))

    else if FType in [ ftString, ftWideString] then
      StoredValue := strValue

    else if FType in [ ftSmallint, ftInteger, ftWord, ftLargeint ] then
      StoredValue := IntToStr(StrToInt(strValue))

    else if FType in [ ftFloat, ftCurrency, ftBCD ] then
      StoredValue := FloatToStr(StrToFloat(strValue))

    else
      raise Exception.Create('DataType not defined');

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox('Erro de conversão', 'Atenção');
    end;
  end;
end;

procedure TFilterConditionFrame.lbFilterClick(Sender: TObject);
begin
  lbFilter.Tag := IfThen(lbFilter.Tag = 0, 1);
  SetLabelDisplay;

//  if Self.Width <> 150 then
//    Self.Width := 150
//  else
//    Self.Width := lbFilter.Canvas.TextWidth(lbFilter.Caption) + lbFilter.Margins.Left + lbFilter.Margins.Right +
//      moreBtn.Width + moreBtn.Margins.Left + moreBtn.Margins.Right +
//      filterPanel.Margins.Left + filterPanel.Margins.Right + 5;
end;

procedure TFilterConditionFrame.moreBtnClick(Sender: TObject);
var
  mnItem, mnSubMn: TMenuItem;
  fc: FilterCondition;
  eValue: TEnumDisplaySDK;
begin
  if not Assigned(popMenu) then
  begin
    popMenu := TPopupMenu.Create(Self);

    mnItem := popMenu.CreateMenuItem;
    mnItem.Caption := 'Filtrar quando';
    popMenu.Items.Add(mnItem);

    for fc := Low(FilterCondition) to High(FilterCondition) do
    begin
      mnSubMn := TMenuItem.Create(mnItem);
      mnSubMn.Caption := FilterConditionStr[fc];
      mnSubMn.OnClick := popMenuCodicaoClickRuntime;
      mnItem.Add(mnSubMn);
    end;

    mnItem := popMenu.CreateMenuItem;
    mnItem.Caption := 'Filtrar quando não';
    popMenu.Items.Add(mnItem);

    for fc := Low(FilterCondition) to High(FilterCondition) do
    begin
      mnSubMn := TMenuItem.Create(mnItem);
      mnSubMn.Caption := FilterConditionStr[fc];
      mnSubMn.OnClick := popMenuCodicaoClickRuntime;
      mnSubMn.Tag := -1;
      mnItem.Add(mnSubMn);
    end;

    mnItem := popMenu.CreateMenuItem;
    mnItem.Caption := 'Alterar valor';
    popMenu.Items.Add(mnItem);

    if Length(ValuesOptions) = 0 then
      mnItem.OnClick := popMenuAlterarValorClick
    else
    begin
      for eValue in ValuesOptions do
      begin
        mnSubMn     := TMenuItem.Create(mnItem);
        mnSubMn.Caption := eValue.Display;
        mnSubMn.Tag     := eValue.Value;
        mnSubMn.OnClick := popMenuAlterarValorOptionsClick;
        mnItem.Add(mnSubMn);
      end;
    end;

    if Assigned(FOnClickRemoveFilter) then
    begin
      mnItem := popMenu.CreateMenuItem;
      mnItem.Caption := '-';
      popMenu.Items.Add(mnItem);

      mnItem := popMenu.CreateMenuItem;
      mnItem.Caption := 'Remover';
      mnItem.OnClick := popMenuRemoveClick;
      popMenu.Items.Add(mnItem);
    end;
  end;

  popMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFilterConditionFrame.popMenuAlterarValorClick(Sender: TObject);
var
  strValue: string;
begin
  if HandleInputStoreValue then
  begin
    SetLabelDisplay;
    FOnUpdateFilter(Self);
  end;
  {
  if StoredValue.Trim.IsEmpty then
    strValue := GetFieldValue
  else
    strValue := StoredValue.Trim;

  StoredValue := '';
  try

    if not InputQuery('Altera valor', Format('%s %s', [ FDisplay, FilterConditionStr[Condition]]), strValue) then
      Exit;


    if FType in [ ftDateTime, ftDate ] then
      StoredValue := DateTimeToStr(StrToDateTime(strValue))

    else if FType in [ ftString, ftWideString] then
      StoredValue := strValue

    else if FType in [ ftSmallint, ftInteger, ftWord, ftLargeint ] then
      StoredValue := IntToStr(StrToInt(strValue))

    else if FType in [ ftFloat, ftCurrency, ftExtended ] then
      StoredValue := FloatToStr(StrToFloat(strValue))

    else
      raise Exception.Create('DataType not defined');

    SetLabelDisplay;
    FOnUpdateFilter(Self);

  except on E: Exception do
    begin
      Application.MessageBox('Erro de conversão', 'Atenção');
    end;
  end;
  }
end;

procedure TFilterConditionFrame.popMenuAlterarValorOptionsClick(Sender: TObject);
var
  strValue: string;
  mnItem: TMenuItem;
  eVal: TEnumDisplaySDK;
begin
  if (not (Sender is TMenuItem)) or (Length(ValuesOptions) = 0) then
    Exit;

  mnItem := (Sender as TMenuItem);

  for eVal in ValuesOptions do
    if mnItem.Tag = eVal.Value then
    begin

      StoredValue := IntToStr(eVal.Value);
      SetLabelDisplay;
      FOnUpdateFilter(Self);
    end;
end;

procedure TFilterConditionFrame.popMenuCodicaoClickRuntime(Sender: TObject);
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
      // Colocar a valiudacao aqui, FLoat nao pdoe like, e por  ai vai

      Condition := fc;
      NegativeCondition := (Sender as TMenuItem).Tag = -1;
      SetLabelDisplay;
      FOnUpdateFilter(Self);
      Break;
    end;
end;

procedure TFilterConditionFrame.popMenuRemoveClick(Sender: TObject);
begin
  FOnClickRemoveFilter(Self);
end;

procedure TFilterConditionFrame.SetLabelDisplay;
var
  textCaption: string;
begin
  if Condition in [ fcEmpty, fcNotEmpty ] then
  begin
    textCaption   := Format('%s %s', [FDisplay, LowerCase(FilterConditionDisplay[Condition])]);
    lbFilter.Hint := Format('"%s" %s', [FDisplay, LowerCase(FilterConditionStr[Condition])]);
  end
  else
  begin
    textCaption   := Format('%s %s %s', [FDisplay, LowerCase(FilterConditionDisplay[Condition]), GetFieldDisplay]);
    lbFilter.Hint := Format('"%s" %s "%s"', [FDisplay, LowerCase(FilterConditionStr[Condition]), GetFieldDisplay]);
  end;

  if lbFilter.Tag = 1 then
    textCaption := FDisplay;

  if NegativeCondition then
    textCaption := '[!]' + textCaption;

  lbFilter.Caption := textCaption;
  Self.Hint        := lbFilter.Hint;
  filterPanel.Hint := lbFilter.Hint;

  AjustWidth;
end;

{ TFilterConditionFrameHelper }

class function TFilterConditionFrameHelper.AllowType(
  AType: TFieldType): Boolean;
begin
  Result := AType in AllowedsFieldType;
end;

{ TFilterConditionFrameInput }

class function TFilterConditionFrameInput.Create(const AFieldName, ADisplayLabel: string; AValue: Variant;
  ADataType: TFieldType): TFilterConditionFrameInput;
begin
  Result.FieldName := AFieldName;
  Result.DisplayLabel := ADisplayLabel;
  Result.Value := AValue;
  Result.DataType := ADataType;
end;

end.
