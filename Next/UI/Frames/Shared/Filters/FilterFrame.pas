unit FilterFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  System.UITypes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Menus, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Buttons, Vcl.Dialogs,
  FilterDefinition, FilterCriterion, LocalPreferences;

type
  TfrmFilterFrame = class(TFrame)
    pnCampo: TPanel;
    lbCampo: TLabel;
    cbCampo: TComboBox;
    pnCondicao: TPanel;
    lbCondicao: TLabel;
    cbCondicao: TComboBox;
    pnValores: TPanel;
    lbValor1: TLabel;
    edValor1: TMaskEdit;
    lbValor2: TLabel;
    edValor2: TMaskEdit;
    pnBotoes: TPanel;
    lblContador: TLabel;
    btnAdicionar: TSpeedButton;
    SplitterCampo: TSplitter;
    SplitterConteudo: TSplitter;
    pnConteudo1: TPanel;
    pnConteudo2: TPanel;
    spliterBtn: TSplitter;
  private
    FDefinition: TFilterDefinition;
    FPreferences: ILocalPreferences;
    FIdentity: string;
    FAccumulated: TFilterCriteria;
    FContadorMenu: TPopupMenu;
    FTodosSelected: Boolean;
    FConfigured: Boolean;
    FSingleMode: Boolean;
    FUpdating: Boolean;
    // Campo real correspondente ao estado atual dos editores. O OnChange do
    // combo ja entrega o novo item selecionado, por isso a persistencia do
    // campo anterior se apoia nesta identidade.
    FActiveFieldId: string;
    // Preferencias
    function FieldKey(const AFieldId, ASuffix: string): string;
    procedure RestorePreferences;
    procedure PersistCurrentIfValid;
    procedure PersistFieldIfValid(const AField: TFilterFieldDefinition;
      const AOperator: TFilterOperator);
    procedure LoadFieldPreferences(const AField: TFilterFieldDefinition);
    procedure LoadFieldValues(const AField: TFilterFieldDefinition;
      const AOperator: TFilterOperator);
    function TryBuildCriterionFor(const AField: TFilterFieldDefinition;
      const AOperator: TFilterOperator; const AValue1, AValue2: string;
      out ACriterion: TFilterCriterion; out AHasInput, AIsValid: Boolean;
      out AMessage: string): Boolean;
    // Estado do editor
    function CurrentField(out AField: TFilterFieldDefinition): Boolean;
    function CurrentOperator(out AOperator: TFilterOperator): Boolean;
    procedure ApplyOperator(const AOperator: TFilterOperator);
    procedure ApplyField(const AField: TFilterFieldDefinition);
    procedure SelectOperator(const AOperator: TFilterOperator);
    procedure UpdateArity;
    procedure UpdateCounter;
    procedure PopulateOperators(const AField: TFilterFieldDefinition);
    procedure ApplyCriterionValues(const AField: TFilterFieldDefinition;
      const ACriterion: TFilterCriterion);
    function FormatCriterionValue(const AValue: TFilterValue;
      const AValueType: TFilterFieldType): string;
    procedure ClearValues;
    function ReadCurrentCriterion(out ACriterion: TFilterCriterion;
      out AMessage: string): Boolean;
    function TryBuildCurrentCriterion(out ACriterion: TFilterCriterion;
      out AHasInput, AIsValid: Boolean; out AMessage: string): Boolean;
    function IsEditorBlank(const AText, AMask: string): Boolean;
    // Evento atribuido em codigo; nao precisa de visibilidade publicada.
    procedure RemoverItemClick(Sender: TObject);
  published
    // Eventos referenciados pelo DFM precisam ser publicados para que o
    // streaming do VCL resolva os metodos ao carregar o frame.
    procedure CampoChange(Sender: TObject);
    procedure CondicaoChange(Sender: TObject);
    procedure ValorExit(Sender: TObject);
    procedure AdicionarClick(Sender: TObject);
    procedure ContadorClick(Sender: TObject);
  public
    procedure Configure(const ADefinition: TFilterDefinition;
      const APreferences: ILocalPreferences; const AIdentity: string);
    procedure ConfigureSingle(const ADefinition: TFilterDefinition;
      const ACriterion: TFilterCriterion);
    function CollectCriteria: TFilterCriteriaResult;
    function CollectSingleCriterion(out ACriterion: TFilterCriterion;
      out AMessage: string): Boolean;
    property Definition: TFilterDefinition read FDefinition;
    property Identity: string read FIdentity;
  end;

implementation

uses
  System.MaskUtils;

{$R *.dfm}

const
  // Espacos nunca representam conteudo digitado em um valor mascarado.
  MaskWhitespaceChars: TSysCharSet = [' ', #9, #10, #13];

function FrameFieldCaption(const AField: TFilterFieldDefinition): string;
begin
  Result := Trim(AField.Label_);
  if Result = '' then
    Result := AField.Id;
end;

function FilterMaskFillChar(const AMask: string): Char;
begin
  // O terceiro campo da mascara VCL (formato mascara;salvar;preenchimento)
  // define o caractere exibido nas posicoes ainda nao preenchidas. Quando o
  // campo nao existe, o VCL usa sublinhado.
  Result := MaskGetMaskBlank(AMask);
end;

function FilterMaskIsBlankChar(const AChar, AFillChar: Char): Boolean;
begin
  Result := (AChar = AFillChar) or (AChar = #0) or (AChar = ' ') or
    (AChar = #9) or (AChar = #10) or (AChar = #13);
end;

function FilterMaskTextIsBlank(const AMask, AText: string): Boolean;
var
  I: Integer;
  DisplayOffset: Integer;
  CharType: TMaskCharType;
  FillChar: Char;
  TextChar: Char;
begin
  Result := True;

  // Sem mascara, apenas espacos e controles nao representam conteudo.
  if AMask = '' then
  begin
    for I := 1 to Length(AText) do
      if not CharInSet(AText[I], MaskWhitespaceChars) then
        Exit(False);

    Exit;
  end;

  FillChar := FilterMaskFillChar(AMask);

  // Percorre a mascara ativa. Um literal so e ignorado na posicao em que a
  // mascara o define; nas posicoes editaveis o caractere e conteudo, mesmo que
  // coincida com um literal existente em outro ponto da mascara.
  for I := 1 to Length(AMask) do
  begin
    CharType := MaskGetCharType(AMask, I);
    if not (CharType in [mcLiteral, mcIntlLiteral, mcMask, mcMaskOpt]) then
      Continue;

    DisplayOffset := MaskOffsetToOffset(AMask, I);
    if (DisplayOffset < 1) or (DisplayOffset > Length(AText)) then
      Continue; // posicao ausente equivale a vazia

    TextChar := AText[DisplayOffset];

    case CharType of
      mcLiteral:
        if TextChar <> AMask[I] then
          Exit(False);
      mcIntlLiteral:
        if TextChar <> MaskIntlLiteralToChar(AMask[I]) then
          Exit(False);
    else
      if not FilterMaskIsBlankChar(TextChar, FillChar) then
        Exit(False);
    end;
  end;

  // Caracteres alem do ultimo offset da mascara tambem sao conteudo.
  for I := MaskOffsetToOffset(AMask, Length(AMask)) + 1 to Length(AText) do
    if not CharInSet(AText[I], MaskWhitespaceChars) then
      Exit(False);
end;

function FilterMaskComplete(const AEdit: TMaskEdit): Boolean;
var
  I: Integer;
  DisplayOffset: Integer;
  FillChar: Char;
  CharType: TMaskCharType;
  Text: string;
begin
  Result := True;

  if AEdit.EditMask = '' then
    Exit;

  Text := AEdit.EditText;
  FillChar := FilterMaskFillChar(AEdit.EditMask);

  // Cada posicao de conteudo da mascara precisa estar preenchida, inclusive as
  // opcionais do VCL, para manter a data completa. O preenchimento configuravel
  // indica posicao ainda vazia, seja qual for o caractere escolhido.
  for I := 1 to Length(AEdit.EditMask) do
  begin
    CharType := MaskGetCharType(AEdit.EditMask, I);
    if not (CharType in [mcMask, mcMaskOpt]) then
      Continue;

    DisplayOffset := MaskOffsetToOffset(AEdit.EditMask, I);
    if (DisplayOffset < 1) or (DisplayOffset > Length(Text)) then
      Exit(False);

    if FilterMaskIsBlankChar(Text[DisplayOffset], FillChar) then
      Exit(False);
  end;
end;

procedure AssignPreferenceText(const AEdit: TMaskEdit; const AText: string);
begin
  try
    if AText = '' then
      AEdit.Clear
    else
      AEdit.Text := AText;
  except
    // Preferencia local nao critica: texto incompativel com a mascara atual
    // volta ao vazio, sem interromper a restauracao do frame.
    AEdit.Clear;
  end;
end;

procedure AssignVerifiedPreference(const AEdit: TMaskEdit;
  const AValueType: TFilterFieldType; const AText: string);
var
  ParsedValue: TFilterValue;
begin
  AssignPreferenceText(AEdit, AText);

  // O texto restaurado so permanece quando, apos aplicar a mascara ativa,
  // forma um valor completo e compativel com o tipo do campo. Caso contrario,
  // o editor volta ao vazio para nao falhar apenas na coleta.
  if AText = '' then
    Exit;

  if (AEdit.EditMask <> '') and (not FilterMaskComplete(AEdit)) then
  begin
    AEdit.Clear;
    Exit;
  end;

  if not TryParseFilterValue(AEdit.EditText, AValueType, ParsedValue) then
    AEdit.Clear;
end;

procedure AssignCriterionText(const AEdit: TMaskEdit; const AText: string);
begin
  // O criterio ja validado e apenas transportado para o editor; um valor
  // incompativel com a mascara ativa nao interrompe a abertura do modal.
  try
    if AText = '' then
      AEdit.Clear
    else
      AEdit.Text := AText;
  except
    AEdit.Clear;
  end;
end;

function TfrmFilterFrame.FieldKey(const AFieldId, ASuffix: string): string;
begin
  // Chave logica por campo: Field.<id>.<sufixo>. O id e estavel; o rotulo
  // exibido pelo combo nao participa da chave.
  Result := 'Field.' + AFieldId;
  if ASuffix <> '' then
    Result := Result + '.' + ASuffix;
end;

procedure TfrmFilterFrame.RestorePreferences;
var
  StoredFieldId: string;
  Field: TFilterFieldDefinition;
  FieldIndex: Integer;
  PreviousUpdating: Boolean;
begin
  // A secao logica e a identidade estavel do frame. Todos e a lista acumulada
  // nao sao persistidos e nunca sao restaurados.
  FTodosSelected := False;

  StoredFieldId := '';
  if FPreferences <> nil then
    StoredFieldId := FPreferences.ReadString(FIdentity, 'Field', '');

  FieldIndex := FDefinition.FieldIndex(StoredFieldId);
  if FieldIndex < 0 then
    FieldIndex := FDefinition.FirstFieldIndex;

  if FieldIndex < 0 then
  begin
    FActiveFieldId := '';
    PreviousUpdating := FUpdating;
    FUpdating := True;
    try
      cbCondicao.Items.Clear;
      cbCondicao.ItemIndex := -1;
    finally
      FUpdating := PreviousUpdating;
    end;

    edValor1.EditMask := '';
    edValor2.EditMask := '';
    lbValor1.Caption := 'Conteúdo';
    lbValor2.Caption := 'Conteúdo';
    ClearValues;
    UpdateArity;
    Exit;
  end;

  Field := FDefinition.Fields[FieldIndex];

  PreviousUpdating := FUpdating;
  FUpdating := True;
  try
    cbCampo.ItemIndex := FieldIndex;
  finally
    FUpdating := PreviousUpdating;
  end;

  // Aplica o campo e carrega condicao/valores compativeis com a definicao
  // atual. Incompatibilidades voltam aos padroes do campo.
  ApplyField(Field);
end;

procedure TfrmFilterFrame.PersistCurrentIfValid;
var
  Field: TFilterFieldDefinition;
  Operator: TFilterOperator;
begin
  if (FPreferences = nil) or (not FConfigured) or FTodosSelected then
    Exit;

  if not CurrentField(Field) then
    Exit;

  if not CurrentOperator(Operator) then
    Exit;

  PersistFieldIfValid(Field, Operator);
end;

procedure TfrmFilterFrame.PersistFieldIfValid(
  const AField: TFilterFieldDefinition; const AOperator: TFilterOperator);
var
  Criterion: TFilterCriterion;
  HasInput: Boolean;
  IsValid: Boolean;
  Message: string;
  Arity: Integer;
  Value1: string;
  Value2: string;
begin
  if (FPreferences = nil) or (FIdentity = '') then
    Exit;

  Criterion := Default(TFilterCriterion);
  HasInput := False;
  IsValid := False;
  Message := '';

  TryBuildCriterionFor(AField, AOperator, edValor1.EditText,
    edValor2.EditText, Criterion, HasInput, IsValid, Message);

  // Sem conteudo ou com conteudo invalido nao ha preferencia a gravar.
  if (not HasInput) or (not IsValid) then
    Exit;

  Arity := FilterOperatorArity(AOperator);
  if Arity >= 1 then
    Value1 := edValor1.EditText
  else
    Value1 := '';

  if Arity >= 2 then
    Value2 := edValor2.EditText
  else
    Value2 := '';

  FPreferences.WriteString(FIdentity, 'Field', AField.Id);
  FPreferences.WriteString(FIdentity, FieldKey(AField.Id, 'Operator'),
    FilterOperatorCode(AOperator));
  FPreferences.WriteString(FIdentity, FieldKey(AField.Id, 'Value1'), Value1);
  FPreferences.WriteString(FIdentity, FieldKey(AField.Id, 'Value2'), Value2);
end;

procedure TfrmFilterFrame.LoadFieldPreferences(
  const AField: TFilterFieldDefinition);
var
  Operators: TFilterOperatorSet;
  Operator: TFilterOperator;
  Preferred: TFilterOperator;
  StoredCode: string;
begin
  if FPreferences = nil then
    Exit;

  Operators := FilterFieldOperators(AField);
  if Operators = [] then
    Exit;

  StoredCode := FPreferences.ReadString(FIdentity,
    FieldKey(AField.Id, 'Operator'), '');

  // A condicao gravada so e usada quando existe e pertence ao campo atual;
  // caso contrario, aplica o padrao do tipo ou a primeira condicao permitida.
  if not (TryFilterOperatorFromCode(StoredCode, Preferred) and
    (Preferred in Operators)) then
  begin
    Preferred := FilterDefaultOperator(AField.ValueType);
    if not (Preferred in Operators) then
    begin
      Preferred := Low(TFilterOperator);
      for Operator := Low(TFilterOperator) to High(TFilterOperator) do
        if Operator in Operators then
        begin
          Preferred := Operator;
          Break;
        end;
    end;
  end;

  if not (Preferred in Operators) then
    Exit;

  SelectOperator(Preferred);
  LoadFieldValues(AField, Preferred);
end;

procedure TfrmFilterFrame.LoadFieldValues(
  const AField: TFilterFieldDefinition; const AOperator: TFilterOperator);
var
  Arity: Integer;
  StoredValue: string;
  ParsedValue: TFilterValue;
  Value1: string;
  Value2: string;
begin
  Arity := FilterOperatorArity(AOperator);
  Value1 := '';
  Value2 := '';

  if FPreferences <> nil then
  begin
    if Arity >= 1 then
    begin
      StoredValue := FPreferences.ReadString(FIdentity,
        FieldKey(AField.Id, 'Value1'), '');
      if (not IsEditorBlank(StoredValue, edValor1.EditMask)) and
        TryParseFilterValue(StoredValue, AField.ValueType, ParsedValue) then
        Value1 := StoredValue;
    end;

    if Arity >= 2 then
    begin
      StoredValue := FPreferences.ReadString(FIdentity,
        FieldKey(AField.Id, 'Value2'), '');
      if (not IsEditorBlank(StoredValue, edValor2.EditMask)) and
        TryParseFilterValue(StoredValue, AField.ValueType, ParsedValue) then
        Value2 := StoredValue;
    end;
  end;

  AssignVerifiedPreference(edValor1, AField.ValueType, Value1);
  AssignVerifiedPreference(edValor2, AField.ValueType, Value2);

  if Arity = 0 then
    ClearValues;
end;

function TfrmFilterFrame.CurrentField(
  out AField: TFilterFieldDefinition): Boolean;
var
  RawIndex: NativeInt;
begin
  AField := Default(TFilterFieldDefinition);
  Result := False;

  if (cbCampo.ItemIndex < 0) or
    (cbCampo.ItemIndex >= Length(FDefinition.Fields)) then
    Exit;

  RawIndex := NativeInt(cbCampo.Items.Objects[cbCampo.ItemIndex]);
  if (RawIndex < 0) or (RawIndex > High(FDefinition.Fields)) then
    Exit;

  AField := FDefinition.Fields[Integer(RawIndex)];
  Result := True;
end;

function TfrmFilterFrame.CurrentOperator(
  out AOperator: TFilterOperator): Boolean;
var
  RawOperator: NativeInt;
begin
  AOperator := Low(TFilterOperator);
  Result := False;

  if (cbCondicao.ItemIndex < 0) or
    (cbCondicao.ItemIndex >= cbCondicao.Items.Count) then
    Exit;

  RawOperator := NativeInt(cbCondicao.Items.Objects[cbCondicao.ItemIndex]);
  if (RawOperator < Ord(Low(TFilterOperator))) or
    (RawOperator > Ord(High(TFilterOperator))) then
    Exit;

  AOperator := TFilterOperator(RawOperator);
  Result := True;
end;

procedure TfrmFilterFrame.ApplyOperator(const AOperator: TFilterOperator);
var
  Field: TFilterFieldDefinition;
  Mask: string;
  Arity: Integer;
begin
  if not CurrentField(Field) then
  begin
    edValor1.EditMask := '';
    edValor2.EditMask := '';
    lbValor1.Caption := 'Conteúdo';
    lbValor2.Caption := 'Conteúdo';
    UpdateArity;
    Exit;
  end;

  Mask := FilterMaskForOperator(Field, AOperator);
  if edValor1.EditMask <> Mask then
    edValor1.EditMask := Mask;
  if edValor2.EditMask <> Mask then
    edValor2.EditMask := Mask;

  Arity := FilterOperatorArity(AOperator);
  if Arity = 2 then
  begin
    if Field.ValueType in [fftDate, fftDateTime] then
    begin
      lbValor1.Caption := 'Data Inicial';
      lbValor2.Caption := 'Data Final';
    end
    else
    begin
      lbValor1.Caption := 'Valor Inicial';
      lbValor2.Caption := 'Valor Final';
    end;
  end
  else
  begin
    lbValor1.Caption := 'Conteúdo';
    lbValor2.Caption := 'Conteúdo';
  end;

  UpdateArity;

  // Operadores sem valor nao mantem conteudo nos editores.
  if Arity = 0 then
    ClearValues;
end;

procedure TfrmFilterFrame.PopulateOperators(
  const AField: TFilterFieldDefinition);
var
  Operators: TFilterOperatorSet;
  Operator: TFilterOperator;
  PreviousUpdating: Boolean;
begin
  Operators := FilterFieldOperators(AField);

  PreviousUpdating := FUpdating;
  FUpdating := True;
  try
    cbCondicao.Items.BeginUpdate;
    try
      cbCondicao.Items.Clear;
      for Operator := Low(TFilterOperator) to High(TFilterOperator) do
        if Operator in Operators then
          cbCondicao.Items.AddObject(FilterOperatorLabel(Operator),
            TObject(NativeInt(Ord(Operator))));
    finally
      cbCondicao.Items.EndUpdate;
    end;
  finally
    FUpdating := PreviousUpdating;
  end;
end;

procedure TfrmFilterFrame.ApplyField(const AField: TFilterFieldDefinition);
var
  PreviousUpdating: Boolean;
begin
  PopulateOperators(AField);

  if cbCondicao.Items.Count = 0 then
  begin
    FActiveFieldId := '';
    PreviousUpdating := FUpdating;
    FUpdating := True;
    try
      cbCondicao.ItemIndex := -1;
    finally
      FUpdating := PreviousUpdating;
    end;

    edValor1.EditMask := '';
    edValor2.EditMask := '';
    lbValor1.Caption := 'Conteúdo';
    lbValor2.Caption := 'Conteúdo';
    ClearValues;
    UpdateArity;
    Exit;
  end;

  // Restaura a condicao e os valores compativeis do campo, aplicando os
  // padroes quando ainda nao ha preferencia gravada.
  LoadFieldPreferences(AField);
  FActiveFieldId := AField.Id;
end;

procedure TfrmFilterFrame.SelectOperator(const AOperator: TFilterOperator);
var
  Index: Integer;
  I: Integer;
  PreviousUpdating: Boolean;
begin
  Index := -1;

  for I := 0 to cbCondicao.Items.Count - 1 do
    if TFilterOperator(NativeInt(cbCondicao.Items.Objects[I])) = AOperator then
    begin
      Index := I;
      Break;
    end;

  if Index < 0 then
  begin
    UpdateArity;
    Exit;
  end;

  PreviousUpdating := FUpdating;
  FUpdating := True;
  try
    cbCondicao.ItemIndex := Index;
  finally
    FUpdating := PreviousUpdating;
  end;

  ApplyOperator(AOperator);
end;

procedure TfrmFilterFrame.UpdateArity;
var
  Field: TFilterFieldDefinition;
  Operator: TFilterOperator;
  Arity: Integer;
begin
  if FTodosSelected then
  begin
    cbCondicao.Enabled := False;
    edValor1.Enabled := False;
    edValor2.Enabled := False;
    btnAdicionar.Enabled := False;
    pnConteudo2.Visible := False;
    Exit;
  end;

  if not CurrentField(Field) or not CurrentOperator(Operator) then
  begin
    cbCondicao.Enabled := False;
    edValor1.Enabled := False;
    edValor2.Enabled := False;
    btnAdicionar.Enabled := False;
    pnConteudo2.Visible := False;
    Exit;
  end;

  Arity := FilterOperatorArity(Operator);
  cbCondicao.Enabled := True;
  btnAdicionar.Enabled := True;
  lbValor1.Visible := True;

  case Arity of
    0:
      begin
        edValor1.Visible := True;
        edValor1.Enabled := False;
        edValor2.Enabled := False;
        pnConteudo2.Visible := False;
        ClearValues;
      end;
    1:
      begin
        edValor1.Visible := True;
        edValor1.Enabled := True;
        edValor2.Enabled := False;
        pnConteudo2.Visible := False;
      end;
  else
    begin
      edValor1.Visible := True;
      edValor1.Enabled := True;
      edValor2.Enabled := True;
      pnConteudo2.Visible := True;
    end;
  end;
end;

procedure TfrmFilterFrame.UpdateCounter;
var
  Count: Integer;
  I: Integer;
  HintText: string;
begin
  lblContador.ShowHint := True;
  Count := Length(FAccumulated);

  // Contador vazio em zero; a partir de um item exibe +N.
  if Count = 0 then
  begin
    lblContador.Caption := ' ';
    lblContador.Hint := 'Nenhum filtro adicionado.';
    Exit;
  end;

  lblContador.Caption := Format('+%d', [Count]);

  // O hint reproduz a lista acumulada, como referencia do filtro legado.
  HintText := '';
  for I := 0 to High(FAccumulated) do
  begin
    if I > 0 then
      HintText := HintText + sLineBreak + '-' + sLineBreak;

    HintText := HintText +
      FilterCriterionDisplayText(FAccumulated[I], FDefinition);
  end;

  lblContador.Hint := HintText;
end;

procedure TfrmFilterFrame.ClearValues;
begin
  edValor1.Clear;
  edValor2.Clear;
end;

function TfrmFilterFrame.FormatCriterionValue(const AValue: TFilterValue;
  const AValueType: TFilterFieldType): string;
begin
  Result := '';
  if not FilterValueMatchesFieldType(AValue, AValueType) then
    Exit;

  case AValueType of
    fftString:
      Result := AValue.StringValue;
    fftInteger:
      Result := IntToStr(AValue.IntegerValue);
    fftInt64:
      Result := IntToStr(AValue.Int64Value);
    fftCurrency:
      Result := CurrToStr(AValue.CurrencyValue);
    fftDate:
      Result := FormatDateTime('dd/mm/yyyy', AValue.DateTimeValue);
    fftDateTime:
      Result := FormatDateTime('dd/mm/yyyy hh:nn:ss', AValue.DateTimeValue);
  else
    Result := '';
  end;
end;

procedure TfrmFilterFrame.ApplyCriterionValues(
  const AField: TFilterFieldDefinition; const ACriterion: TFilterCriterion);
var
  Arity: Integer;
  ValueText: string;
begin
  Arity := FilterOperatorArity(ACriterion.Operator);
  if Length(ACriterion.Values) <> Arity then
  begin
    ClearValues;
    Exit;
  end;

  if Arity >= 1 then
  begin
    ValueText := FormatCriterionValue(ACriterion.Values[0], AField.ValueType);
    AssignCriterionText(edValor1, ValueText);
  end
  else
    edValor1.Clear;

  if Arity >= 2 then
  begin
    ValueText := FormatCriterionValue(ACriterion.Values[1], AField.ValueType);
    AssignCriterionText(edValor2, ValueText);
  end
  else
    edValor2.Clear;

  if Arity = 0 then
    ClearValues;
end;

function TfrmFilterFrame.ReadCurrentCriterion(
  out ACriterion: TFilterCriterion; out AMessage: string): Boolean;
var
  AHasInput: Boolean;
  AIsValid: Boolean;
begin
  TryBuildCurrentCriterion(ACriterion, AHasInput, AIsValid, AMessage);
  Result := AIsValid;
end;

function TfrmFilterFrame.TryBuildCriterionFor(
  const AField: TFilterFieldDefinition; const AOperator: TFilterOperator;
  const AValue1, AValue2: string;
  out ACriterion: TFilterCriterion; out AHasInput, AIsValid: Boolean;
  out AMessage: string): Boolean;
var
  Arity: Integer;
  I: Integer;
  RequiredTexts: array of string;
  Values: TFilterValues;
  ParsedValue: TFilterValue;
  HasAnyInput: Boolean;
  FieldCaptionText: string;
  Mask: string;
begin
  ACriterion := Default(TFilterCriterion);
  AHasInput := False;
  AIsValid := False;
  AMessage := '';
  Result := False;

  Arity := FilterOperatorArity(AOperator);
  ACriterion.FieldId := AField.Id;
  ACriterion.Operator := AOperator;

  // Operadores sem valor (Vazio, Nao vazio, Nulo, Nao nulo) formam um criterio
  // completo assim que o campo e a condicao estao definidos.
  if Arity = 0 then
  begin
    AHasInput := True;
    AIsValid := ValidateFilterCriterion(ACriterion, FDefinition, AMessage);
    Result := AIsValid;
    Exit;
  end;

  FieldCaptionText := FrameFieldCaption(AField);

  SetLength(RequiredTexts, Arity);
  RequiredTexts[0] := AValue1;
  if Arity >= 2 then
    RequiredTexts[1] := AValue2;

  HasAnyInput := False;
  for I := 0 to High(RequiredTexts) do
  begin
    if I = 0 then
      Mask := edValor1.EditMask
    else
      Mask := edValor2.EditMask;

    if not IsEditorBlank(RequiredTexts[I], Mask) then
      HasAnyInput := True;
  end;

  // Editores completamente vazios representam ausencia de criterio corrente.
  if not HasAnyInput then
    Exit;

  AHasInput := True;

  // Valor obrigatorio ausente em um operador de dois valores.
  for I := 0 to High(RequiredTexts) do
  begin
    if I = 0 then
      Mask := edValor1.EditMask
    else
      Mask := edValor2.EditMask;

    if IsEditorBlank(RequiredTexts[I], Mask) then
    begin
      if Arity = 2 then
      begin
        if I = 0 then
          AMessage := 'Informe o valor inicial.'
        else
          AMessage := 'Informe o valor final.';
      end
      else
        AMessage := 'Informe o valor do filtro.';

      Exit;
    end;
  end;

  // Mascara ativa com posicoes nao preenchidas caracteriza valor incompleto.
  if (not FilterMaskComplete(edValor1)) or
    ((Arity >= 2) and (not FilterMaskComplete(edValor2))) then
  begin
    AMessage := Format('O valor informado está incompleto para o campo "%s".',
      [FieldCaptionText]);
    Exit;
  end;

  SetLength(Values, Arity);
  for I := 0 to High(RequiredTexts) do
  begin
    if not TryParseFilterValue(RequiredTexts[I], AField.ValueType,
      ParsedValue) then
    begin
      AMessage := Format('O valor informado não é válido para o campo "%s".',
        [FieldCaptionText]);
      Exit;
    end;

    Values[I] := ParsedValue;
  end;

  ACriterion.Values := Values;
  AIsValid := ValidateFilterCriterion(ACriterion, FDefinition, AMessage);
  Result := AIsValid;
end;

function TfrmFilterFrame.TryBuildCurrentCriterion(
  out ACriterion: TFilterCriterion; out AHasInput, AIsValid: Boolean;
  out AMessage: string): Boolean;
var
  Field: TFilterFieldDefinition;
  Operator: TFilterOperator;
  Value1: string;
  Value2: string;
begin
  ACriterion := Default(TFilterCriterion);
  AHasInput := False;
  AIsValid := False;
  AMessage := '';
  Result := False;

  // Todos e ausencia de campo ou condicao real nao geram criterio corrente.
  if FTodosSelected or (not CurrentField(Field)) or
    (not CurrentOperator(Operator)) then
    Exit;

  Value1 := edValor1.EditText;
  if FilterOperatorArity(Operator) >= 2 then
    Value2 := edValor2.EditText
  else
    Value2 := '';

  Result := TryBuildCriterionFor(Field, Operator, Value1, Value2,
    ACriterion, AHasInput, AIsValid, AMessage);
end;

function TfrmFilterFrame.IsEditorBlank(const AText, AMask: string): Boolean;
begin
  // A deteccao e posicional: literais da mascara so sao ignorados na propria
  // posicao; nas posicoes editaveis, o preenchimento e espacos sao vazios mas
  // qualquer outro caractere e conteudo, inclusive quando coincide com um
  // literal existente em outro ponto da mascara.
  Result := FilterMaskTextIsBlank(AMask, AText);
end;

procedure TfrmFilterFrame.CampoChange(Sender: TObject);
var
  Field: TFilterFieldDefinition;
  Operator: TFilterOperator;
  Selected: Integer;
begin
  if FUpdating then
    Exit;

  // O OnChange ja aponta para o novo campo, mas os editores e a condicao ainda
  // representam o campo anterior. Persiste esse estado antes de trocar.
  if FConfigured and (not FTodosSelected) and
    FDefinition.FindField(FActiveFieldId, Field) and
    CurrentOperator(Operator) then
    PersistFieldIfValid(Field, Operator);

  Selected := cbCampo.ItemIndex;

  if (Selected >= 0) and (Selected < Length(FDefinition.Fields)) then
  begin
    FTodosSelected := False;
    if CurrentField(Field) then
      ApplyField(Field)
    else
      UpdateArity;
  end
  else if FDefinition.AllowAll and (Selected = Length(FDefinition.Fields)) then
  begin
    FTodosSelected := True;
    UpdateArity;
  end
  else
  begin
    FTodosSelected := False;
    UpdateArity;
  end;
end;

procedure TfrmFilterFrame.CondicaoChange(Sender: TObject);
var
  Field: TFilterFieldDefinition;
  Operator: TFilterOperator;
begin
  if FUpdating then
    Exit;

  if not CurrentOperator(Operator) then
  begin
    UpdateArity;
    Exit;
  end;

  // Aplica mascara, rotulos e aridade da condicao escolhida.
  ApplyOperator(Operator);

  // Grava o estado corrente quando ele forma um criterio valido com a nova
  // condicao e, em seguida, recarrega os valores gravados para o campo.
  PersistCurrentIfValid;

  if CurrentField(Field) then
    LoadFieldValues(Field, Operator)
  else
    UpdateArity;
end;

procedure TfrmFilterFrame.ValorExit(Sender: TObject);
begin
  // A saida de qualquer editor de valor grava o criterio corrente valido.
  PersistCurrentIfValid;
end;

procedure TfrmFilterFrame.AdicionarClick(Sender: TObject);
var
  Criterion: TFilterCriterion;
  HasInput: Boolean;
  IsValid: Boolean;
  Message: string;
  I: Integer;
begin
  if FSingleMode then
    Exit;

  PersistCurrentIfValid;

  Criterion := Default(TFilterCriterion);
  HasInput := False;
  IsValid := False;
  Message := '';
  TryBuildCurrentCriterion(Criterion, HasInput, IsValid, Message);

  // Sem conteudo digitado nao ha criterio corrente para adicionar.
  if not HasInput then
    Exit;

  if not IsValid then
  begin
    if Trim(Message) = '' then
      Message := 'O filtro informado não é válido.';

    MessageDlg(Message, mtWarning, [mbOK], 0);
    Exit;
  end;

  // A duplicidade usa igualdade tipada, nao o texto exibido no menu.
  for I := 0 to High(FAccumulated) do
    if SameFilterCriterion(FAccumulated[I], Criterion) then
      Exit;

  // A lista guarda copias; os editores nao sao aliases dos itens.
  SetLength(FAccumulated, Length(FAccumulated) + 1);
  FAccumulated[High(FAccumulated)] := CloneFilterCriterion(Criterion);

  UpdateCounter;
end;

procedure TfrmFilterFrame.ContadorClick(Sender: TObject);
var
  Item: TMenuItem;
  I: Integer;
begin
  if Length(FAccumulated) = 0 then
    Exit;

  // O menu pertence ao frame para manter seus eventos validos apos Popup.
  if FContadorMenu = nil then
    FContadorMenu := TPopupMenu.Create(Self);

  FContadorMenu.Items.Clear;
  for I := 0 to High(FAccumulated) do
  begin
    Item := TMenuItem.Create(FContadorMenu);
    Item.Caption := FilterCriterionDisplayText(FAccumulated[I], FDefinition);
    Item.Tag := I;
    Item.OnClick := RemoverItemClick;
    FContadorMenu.Items.Add(Item);
  end;

  Item := TMenuItem.Create(FContadorMenu);
  Item.Caption := '-';
  FContadorMenu.Items.Add(Item);

  Item := TMenuItem.Create(FContadorMenu);
  Item.Caption := 'Limpar todos';
  Item.Tag := -1;
  Item.OnClick := RemoverItemClick;
  FContadorMenu.Items.Add(Item);

  FContadorMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmFilterFrame.RemoverItemClick(Sender: TObject);
var
  Index: Integer;
  I: Integer;
begin
  if not (Sender is TMenuItem) then
    Exit;

  Index := Integer(TMenuItem(Sender).Tag);

  if Index < -1 then
    Exit;

  // Tag -1 representa a acao de limpar toda a lista acumulada.
  if Index = -1 then
  begin
    SetLength(FAccumulated, 0);
    UpdateCounter;
    Exit;
  end;

  if Index > High(FAccumulated) then
    Exit;

  for I := Index to High(FAccumulated) - 1 do
    FAccumulated[I] := FAccumulated[I + 1];

  SetLength(FAccumulated, Length(FAccumulated) - 1);
  UpdateCounter;
end;

procedure TfrmFilterFrame.Configure(const ADefinition: TFilterDefinition;
  const APreferences: ILocalPreferences; const AIdentity: string);
var
  I: Integer;
  PreviousUpdating: Boolean;
begin
  if FConfigured then
    raise Exception.Create('O frame de filtros já foi configurado.');

  if APreferences = nil then
    raise Exception.Create(
      'As preferências locais do frame de filtros não foram informadas.');

  if Trim(AIdentity) = '' then
    raise Exception.Create(
      'A identidade do frame de filtros não foi informada.');

  FDefinition := ADefinition;
  FPreferences := APreferences;
  FIdentity := AIdentity;
  FActiveFieldId := '';
  FSingleMode := False;

  PreviousUpdating := FUpdating;
  FUpdating := True;
  try
    cbCampo.Items.BeginUpdate;
    try
      cbCampo.Items.Clear;
      for I := 0 to High(FDefinition.Fields) do
        cbCampo.Items.AddObject(FrameFieldCaption(FDefinition.Fields[I]),
          TObject(NativeInt(I)));

      if FDefinition.AllowAll then
        cbCampo.Items.AddObject('Todos', nil);
    finally
      cbCampo.Items.EndUpdate;
    end;
  finally
    FUpdating := PreviousUpdating;
  end;

  // Restaura o ultimo campo valido e suas preferencias; sem preferencia,
  // aplica o primeiro campo da definicao. Todos nunca e restaurado.
  RestorePreferences;

  FConfigured := True;
end;

procedure TfrmFilterFrame.ConfigureSingle(const ADefinition: TFilterDefinition;
  const ACriterion: TFilterCriterion);
var
  I: Integer;
  FieldIndex: Integer;
  Field: TFilterFieldDefinition;
  PreviousUpdating: Boolean;
begin
  if FConfigured then
    raise Exception.Create('O frame de filtros já foi configurado.');

  FieldIndex := ADefinition.FieldIndex(ACriterion.FieldId);
  if FieldIndex < 0 then
    raise Exception.Create(
      'O campo do filtro não pertence à definição informada.');

  FDefinition := ADefinition;
  FPreferences := nil;
  FIdentity := '';
  FActiveFieldId := '';
  FSingleMode := True;
  FTodosSelected := False;
  FAccumulated := nil;

  PreviousUpdating := FUpdating;
  FUpdating := True;
  try
    cbCampo.Items.BeginUpdate;
    try
      cbCampo.Items.Clear;
      for I := 0 to High(FDefinition.Fields) do
        cbCampo.Items.AddObject(FrameFieldCaption(FDefinition.Fields[I]),
          TObject(NativeInt(I)));

      cbCampo.ItemIndex := FieldIndex;
    finally
      cbCampo.Items.EndUpdate;
    end;
  finally
    FUpdating := PreviousUpdating;
  end;

  // O campo e fixo: o modal representa um criterio vinculado a celula ou ao
  // criterio existente. A inclusao acumulada e o contador nao se aplicam.
  cbCampo.Enabled := False;
  btnAdicionar.Visible := False;
  btnAdicionar.Enabled := False;
  lblContador.Visible := False;
  pnBotoes.Visible := False;
  spliterBtn.Visible := False;

  Field := FDefinition.Fields[FieldIndex];
  if not FilterFieldSupportsOperator(Field, ACriterion.Operator) then
    raise Exception.Create(
      'A condição do filtro não é permitida para o campo informado.');

  PopulateOperators(Field);
  SelectOperator(ACriterion.Operator);
  ApplyCriterionValues(Field, ACriterion);
  FActiveFieldId := Field.Id;
  FConfigured := True;
end;

function TfrmFilterFrame.CollectCriteria: TFilterCriteriaResult;
var
  CurrentCriterion: TFilterCriterion;
  HasInput: Boolean;
  IsValid: Boolean;
  Message: string;
  Collected: TFilterCriteria;
  I: Integer;
  IsDuplicate: Boolean;
begin
  if not FConfigured then
    raise Exception.Create('O frame de filtros ainda não foi configurado.');

  if FSingleMode then
    raise Exception.Create(
      'O frame de filtros está no modo de critério único.');

  // A coleta tambem grava o criterio corrente valido, mesmo sem "+".
  PersistCurrentIfValid;

  if FTodosSelected then
    Exit(TFilterCriteriaResult.NoUserFilters(True));

  CurrentCriterion := Default(TFilterCriterion);
  HasInput := False;
  IsValid := False;
  Message := '';
  TryBuildCurrentCriterion(CurrentCriterion, HasInput, IsValid, Message);

  // Entrada parcial ou invalida nunca e mascarada pela lista acumulada.
  if HasInput and (not IsValid) then
    Exit(TFilterCriteriaResult.Invalid(Message));

  Collected := CloneFilterCriteria(FAccumulated);

  if IsValid then
  begin
    IsDuplicate := False;
    for I := 0 to High(FAccumulated) do
      if SameFilterCriterion(FAccumulated[I], CurrentCriterion) then
      begin
        IsDuplicate := True;
        Break;
      end;

    if not IsDuplicate then
    begin
      SetLength(Collected, Length(Collected) + 1);
      Collected[High(Collected)] := CloneFilterCriterion(CurrentCriterion);
    end;
  end;

  if Length(Collected) = 0 then
    Result := TFilterCriteriaResult.NoUserFilters(False)
  else
    Result := TFilterCriteriaResult.Valid(Collected);
end;

function TfrmFilterFrame.CollectSingleCriterion(
  out ACriterion: TFilterCriterion; out AMessage: string): Boolean;
begin
  if not FConfigured then
    raise Exception.Create('O frame de filtros ainda não foi configurado.');

  // No modo de criterio unico a coleta usa somente os editores correntes; a
  // lista acumulada e as preferencias locais nao participam.
  Result := ReadCurrentCriterion(ACriterion, AMessage);
  if (not Result) and (Trim(AMessage) = '') then
    AMessage := 'Informe o valor do filtro.';
end;

end.
