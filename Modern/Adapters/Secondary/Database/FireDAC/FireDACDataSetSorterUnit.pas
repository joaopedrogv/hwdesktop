// Delphi Rio
unit FireDACDataSetSorterUnit;

interface

uses
  Data.DB, IDataSetSorterUnit;

type
  // Adaptador FireDAC da ordenacao de conjuntos ja carregados. E o unico ponto
  // do modulo que conhece TFDDataSet e IndexFieldNames; o contrato consumido
  // pelo restante do codigo permanece neutro em relacao ao driver.
  TFireDACDataSetSorter = class(TInterfacedObject, IDataSetSorter)
  private
    function IsSortableField(const AField: TField): Boolean;
    function IsFDDataSet(const ADataSet: TDataSet): Boolean;
    function BuildIndexFieldNames(const ADataSet: TDataSet;
      const ASorts: TDataSetSortFields;
      out AIndexFieldNames: string): Boolean;
  public
    function CanSort(const ADataSet: TDataSet;
      const AFieldName: string): Boolean;
    function ApplySort(const ADataSet: TDataSet;
      const ASorts: TDataSetSortFields): Boolean;
  end;

implementation

uses
  System.SysUtils, FireDAC.Comp.DataSet;

{ TFireDACDataSetSorter }

function TFireDACDataSetSorter.IsSortableField(
  const AField: TField): Boolean;
begin
  // Tipos sem ordem natural (binarios, memorandos, variantes e conjuntos)
  // ficam fora da ordenacao; os demais tipos sao validados pelo FireDAC.
  Result := (AField <> nil) and (AField.DataType <> ftUnknown) and
    (not (AField is TBlobField)) and (not (AField is TMemoField)) and
    (not (AField is TGraphicField)) and (not (AField is TVariantField)) and
    (not (AField is TDataSetField)) and (not (AField is TReferenceField));
end;

function TFireDACDataSetSorter.IsFDDataSet(
  const ADataSet: TDataSet): Boolean;
begin
  Result := (ADataSet <> nil) and ADataSet.Active and
    (ADataSet is TFDDataSet);
end;

function TFireDACDataSetSorter.CanSort(const ADataSet: TDataSet;
  const AFieldName: string): Boolean;
var
  FDDataSet: TFDDataSet;
  FieldName: string;
begin
  Result := False;
  if not IsFDDataSet(ADataSet) then
    Exit;

  FDDataSet := TFDDataSet(ADataSet);
  if not FDDataSet.IndexesActive then
    Exit;

  FieldName := Trim(AFieldName);
  if FieldName = '' then
    Exit;

  Result := IsSortableField(FDDataSet.FindField(FieldName));
end;

function TFireDACDataSetSorter.BuildIndexFieldNames(const ADataSet: TDataSet;
  const ASorts: TDataSetSortFields; out AIndexFieldNames: string): Boolean;
var
  I: Integer;
  FieldName: string;
begin
  Result := False;
  AIndexFieldNames := '';

  for I := 0 to High(ASorts) do
  begin
    FieldName := Trim(ASorts[I].FieldName);
    if (FieldName = '') or (Pos(';', FieldName) > 0) or
      (Pos(':', FieldName) > 0) then
      Exit;
    if not IsSortableField(ADataSet.FindField(FieldName)) then
      Exit;

    if AIndexFieldNames <> '' then
      AIndexFieldNames := AIndexFieldNames + ';';
    AIndexFieldNames := AIndexFieldNames + FieldName;
    if ASorts[I].Ascending then
      AIndexFieldNames := AIndexFieldNames + ':A'
    else
      AIndexFieldNames := AIndexFieldNames + ':D';
  end;

  Result := True;
end;

function TFireDACDataSetSorter.ApplySort(const ADataSet: TDataSet;
  const ASorts: TDataSetSortFields): Boolean;
var
  FDDataSet: TFDDataSet;
  IndexFieldNames: string;
  PreviousIndexName: string;
  PreviousIndexFieldNames: string;
  Bookmark: TBookmark;
begin
  Result := False;
  if not IsFDDataSet(ADataSet) then
    Exit;

  FDDataSet := TFDDataSet(ADataSet);

  if Length(ASorts) = 0 then
  begin
    // Sem ordenacao a aplicar, basta devolver o conjunto a ordem de leitura.
    if not FDDataSet.IndexesActive then
      Exit(True);
    if FDDataSet.IndexFieldNames = '' then
      Exit(True);
    IndexFieldNames := '';
  end
  else
  begin
    if not FDDataSet.IndexesActive then
      Exit;
    if not BuildIndexFieldNames(ADataSet, ASorts, IndexFieldNames) then
      Exit;
  end;

  PreviousIndexName := FDDataSet.IndexName;
  PreviousIndexFieldNames := FDDataSet.IndexFieldNames;
  Bookmark := nil;

  ADataSet.DisableControls;
  try
    try
      Bookmark := ADataSet.GetBookmark;
      FDDataSet.IndexFieldNames := IndexFieldNames;
      Result := True;
    except
      // A ordenacao nao foi aceita. Restaurar o indice anterior mantem a ordem
      // visivel como estava antes da tentativa.
      try
        FDDataSet.IndexFieldNames := PreviousIndexFieldNames;
        if PreviousIndexName <> '' then
          FDDataSet.IndexName := PreviousIndexName;
      except
        // A restauracao e a melhor possivel; a operacao continua sem sucesso.
      end;
      Result := False;
    end;

    // A ordenacao altera somente a visao: o bookmark da ocorrencia continua
    // valido e devolve a linha corrente apos a nova ordem.
    if Result and (Bookmark <> nil) then
    begin
      try
        if ADataSet.BookmarkValid(Bookmark) then
          ADataSet.GotoBookmark(Bookmark);
      except
        // A linha corrente nao pode ser restaurada; a ordenacao permanece.
      end;
    end;
  finally
    if Bookmark <> nil then
      ADataSet.FreeBookmark(Bookmark);
    ADataSet.EnableControls;
  end;
end;

end.
