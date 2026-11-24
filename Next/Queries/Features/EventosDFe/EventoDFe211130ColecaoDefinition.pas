unit EventoDFe211130ColecaoDefinition;

interface

uses
  DatasetColumnDefinition, NextMemoryDatasetDefinition, EventoDFe211130ItemEtdUnit,
  DataSetFieldDefinitionUnit;

type
  TEventoDFe211130ColecaoDefinition =
    class(TNextMemoryDatasetDefinitionBase<EventoDFe211130ItemEtd>)
  private
    function BuildColumns: TDatasetColumnDefinitions;
  protected
    procedure Configure; override;
    procedure ModelToDataSet(const AModel: EventoDFe211130ItemEtd); override;
    function DataSetToModel: EventoDFe211130ItemEtd; override;
  public
    class function Campos: TDataSetFieldDefinitions; static;
  end;

implementation

uses
  Data.DB, FilterDefinition, GridColumnDefinition, QueryResultUnit;

const
  LayoutDatasetId = 'eventos.dfe.211130.itens';

procedure TEventoDFe211130ColecaoDefinition.Configure;
var
  Columns: TDatasetColumnDefinitions;
begin
  FDatasetId := LayoutDatasetId;
  FLiberarModelo := nil;

  Columns := BuildColumns;
  FColumnsDef := BuildGridColumns(Columns);
  FFiltersDef := BuildFilterDefinition(Columns, True);
end;

function TEventoDFe211130ColecaoDefinition.BuildColumns: TDatasetColumnDefinitions;
begin
  Result := QueryColumns([
    QueryColumn('NITEM', 'nItem', fftInteger, 80),
    QueryColumn('VIBS', 'Valor IBS', fftCurrency, 120, qcaDefault,
      gcbConfigurableVisible, '#,##0.00'),
    QueryColumn('VCBS', 'Valor CBS', fftCurrency, 120, qcaDefault,
      gcbConfigurableVisible, '#,##0.00'),
    QueryColumn('QIMOBILIZADO', 'Qtd. imobilizada', fftCurrency, 140, qcaDefault,
      gcbConfigurableVisible, '#,##0.0000'),
    QueryColumn('UIMOBILIZADO', 'Unidade', fftString, 90)
  ]);
end;

class function TEventoDFe211130ColecaoDefinition.Campos: TDataSetFieldDefinitions;
begin
  SetLength(Result, 6);

  Result[0].Name := 'ID';
  Result[0].DataType := ftString;
  Result[0].Size := 36;

  Result[1].Name := 'NITEM';
  Result[1].DataType := ftInteger;

  Result[2].Name := 'VIBS';
  Result[2].DataType := ftCurrency;
  Result[2].Precision := 15;
  Result[2].Scale := 4;

  Result[3].Name := 'VCBS';
  Result[3].DataType := ftCurrency;
  Result[3].Precision := 15;
  Result[3].Scale := 4;

  Result[4].Name := 'QIMOBILIZADO';
  Result[4].DataType := ftCurrency;
  Result[4].Precision := 15;
  Result[4].Scale := 4;

  Result[5].Name := 'UIMOBILIZADO';
  Result[5].DataType := ftString;
  Result[5].Size := 6;
end;

procedure TEventoDFe211130ColecaoDefinition.ModelToDataSet(
  const AModel: EventoDFe211130ItemEtd);
var
  DataSet: TDataSet;
begin
  DataSet := GetDataSet;
  DataSet.FieldByName('ID').AsString := AModel.Id;
  DataSet.FieldByName('NITEM').AsInteger := AModel.NItem;
  DataSet.FieldByName('VIBS').AsCurrency := AModel.VIbs;
  DataSet.FieldByName('VCBS').AsCurrency := AModel.VCbs;
  DataSet.FieldByName('QIMOBILIZADO').AsCurrency := AModel.QImobilizado;
  DataSet.FieldByName('UIMOBILIZADO').AsString := AModel.UImobilizado;
end;

function TEventoDFe211130ColecaoDefinition.DataSetToModel: EventoDFe211130ItemEtd;
var
  Consulta: QueryResult;
begin
  Consulta := QueryResult.Create(GetDataSet, '', False);
  try
    Result := EventoDFe211130ItemEtd.Create(
      Consulta.FieldAsString('ID'),
      Consulta.FieldAsInteger('NITEM'),
      Consulta.FieldAsCurrency('VIBS'),
      Consulta.FieldAsCurrency('VCBS'),
      Consulta.FieldAsCurrency('QIMOBILIZADO'),
      Consulta.FieldAsString('UIMOBILIZADO'));
  finally
    Consulta.Free;
  end;
end;

end.
