unit QueryResultOperations;

interface

uses
 Data.DB, IDataSetReaderUnit;

type
  IQueryResultOperations = interface
    ['{76045AA4-FE97-4A2E-87CA-85077589168B}']
    procedure MarkAll();
    procedure UnmarkAll();
    procedure InverterAllMarks();
    procedure ToggleCurrentMark();
    function MarkingColumnName(): string;
    // Filtro rapido de igualdade sobre o mesmo conjunto ja carregado. O
    // criterio e unico nesta fatia e substitui o anterior quando aceito.
    function ApplyQuickFilter(const AField: TField): Boolean;
    procedure ClearQuickFilter();
    function QuickFilterActive(): Boolean;
    function QuickFilterDescription(): string;
  end;

  TMarkOperation = (moMarkAll, moUnmarkAll, moInvertAll, moToggle);

  TQueryResultOperations = class(TInterfacedObject, IQueryResultOperations)
  private
    FReader: IDataSetReader;
    FMarkingColumn: string;
    FQuickFilterActive: Boolean;
    FQuickFilterDataSet: TDataSet;
    FQuickFilterDescription: string;
    procedure DoMarkOperation(AOperation: TMarkOperation);
    function BuildQuickFilterExpression(const AField: TField): string;
    procedure ResetQuickFilterState();
  public
    constructor Create(AReader: IDataSetReader; const AMarkingColumn: string);
    procedure MarkAll();
    procedure UnmarkAll();
    procedure InverterAllMarks();
    procedure ToggleCurrentMark();
    function MarkingColumnName(): string;
    function ApplyQuickFilter(const AField: TField): Boolean;
    procedure ClearQuickFilter();
    function QuickFilterActive(): Boolean;
    function QuickFilterDescription(): string;
  end;

implementation

uses
  System.SysUtils;

type
  // Valor original que nao pode ser comparado pelo filtro rapido desta fatia.
  // O chamador recebe False e mantem o criterio anterior ou nenhum.
  EQuickFilterValue = class(Exception);

{ TQueryResultOperations }

constructor TQueryResultOperations.Create(AReader: IDataSetReader; const AMarkingColumn: string);
begin
  FReader := AReader;
  FMarkingColumn := AMarkingColumn;
end;

procedure TQueryResultOperations.DoMarkOperation(AOperation: TMarkOperation);
var
  fdMark: TField;
  dts: TDataSet;
  reNo: Integer;
begin
  dts := FReader.DataSet;
  fdMark := dts.FieldByName(FMarkingColumn);

  case AOperation of
    moMarkAll, moUnmarkAll, moInvertAll:
      begin
        // Com o filtro rapido ativo, First..Eof percorre apenas as linhas
        // visiveis; as linhas ocultas preservam a marcacao anterior.
        reNo := dts.RecNo;
        try
          dts.First;
          while not dts.Eof do
          begin
            dts.Edit;
            case AOperation of
              moMarkAll   : fdMark.AsBoolean :=  True;
              moUnmarkAll: fdMark.AsBoolean :=  False;
              moInvertAll: fdMark.AsBoolean :=  not fdMark.AsBoolean;
            end;
            dts.Post;
            dts.Next();
          end;
        finally
          dts.RecNo := reNo;
        end;
      end;

    moToggle:
      begin
        dts.Edit;
        fdMark.AsBoolean := not fdMark.AsBoolean;
        dts.Post;
      end;
  end;
end;

function TQueryResultOperations.ApplyQuickFilter(const AField: TField): Boolean;
var
  dts: TDataSet;
  NewFilter: string;
  PreviousFilter: string;
  PreviousFiltered: Boolean;
begin
  Result := False;
  if AField = nil then
    Exit;

  dts := FReader.DataSet;
  if (dts = nil) or (not dts.Active) then
    Exit;

  // A expressao e validada antes de alterar o conjunto. Uma falha preserva o
  // criterio anterior ou a ausencia de filtro.
  try
    NewFilter := BuildQuickFilterExpression(AField);
  except
    on E: EQuickFilterValue do
      Exit;
  end;

  PreviousFilter := dts.Filter;
  PreviousFiltered := dts.Filtered;
  try
    dts.Filter := NewFilter;
    dts.Filtered := True;
  except
    // Nenhum filtro parcial permanece: restaura o estado anterior.
    dts.Filtered := False;
    dts.Filter := PreviousFilter;
    dts.Filtered := PreviousFiltered;
    Exit;
  end;

  ResetQuickFilterState();
  FQuickFilterActive := True;
  FQuickFilterDataSet := dts;
  FQuickFilterDescription := Format('%s = %s',
    [AField.DisplayLabel, AField.DisplayText]);
  Result := True;
end;

function TQueryResultOperations.BuildQuickFilterExpression(
  const AField: TField): string;
var
  Value: string;
begin
  // O criterio usa o valor original do campo, nunca o texto de apresentacao.
  if AField.IsNull then
    raise EQuickFilterValue.Create(
      'O valor da celula esta vazio e nao pode ser filtrado.');

  case AField.DataType of
    ftString, ftWideString, ftFixedChar, ftFixedWideChar, ftMemo, ftWideMemo:
      Value := QuotedStr(AField.AsString);
    ftSmallint, ftInteger, ftWord, ftLargeint:
      Value := IntToStr(AField.AsLargeInt);
    ftFloat, ftCurrency:
      Value := FormatFloat('0.################', AField.AsFloat,
        TFormatSettings.Invariant);
    ftDate:
      Value := QuotedStr(FormatDateTime('yyyy-mm-dd', AField.AsDateTime,
        TFormatSettings.Invariant));
    ftTime:
      Value := QuotedStr(FormatDateTime('hh:nn:ss', AField.AsDateTime,
        TFormatSettings.Invariant));
    ftDateTime:
      Value := QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',
        AField.AsDateTime, TFormatSettings.Invariant));
    ftBoolean:
      if AField.AsBoolean then
        Value := 'True'
      else
        Value := 'False';
  else
    raise EQuickFilterValue.Create(
      'O tipo do campo nao e suportado pelo filtro rapido.');
  end;

  Result := Format('%s = %s', [AField.FieldName, Value]);
end;

procedure TQueryResultOperations.ClearQuickFilter;
var
  dts: TDataSet;
begin
  dts := FReader.DataSet;
  if dts <> nil then
  begin
    dts.Filtered := False;
    dts.Filter := '';
  end;
  ResetQuickFilterState();
end;

function TQueryResultOperations.QuickFilterActive: Boolean;
begin
  // O estado local so vale para o conjunto em que o criterio foi aplicado.
  Result := FQuickFilterActive
    and (FReader.DataSet <> nil)
    and (FReader.DataSet = FQuickFilterDataSet);
end;

function TQueryResultOperations.QuickFilterDescription: string;
begin
  if QuickFilterActive() then
    Result := FQuickFilterDescription
  else
    Result := '';
end;

procedure TQueryResultOperations.ResetQuickFilterState;
begin
  FQuickFilterActive := False;
  FQuickFilterDataSet := nil;
  FQuickFilterDescription := '';
end;

procedure TQueryResultOperations.InverterAllMarks;
begin
  DoMarkOperation(moInvertAll);
end;

procedure TQueryResultOperations.MarkAll;
begin
  DoMarkOperation(moMarkAll);
end;

function TQueryResultOperations.MarkingColumnName: string;
begin
  Result := FMarkingColumn;
end;

procedure TQueryResultOperations.ToggleCurrentMark;
begin
  DoMarkOperation(moToggle);
end;

procedure TQueryResultOperations.UnmarkAll;
begin
  DoMarkOperation(moUnmarkAll);
end;

end.