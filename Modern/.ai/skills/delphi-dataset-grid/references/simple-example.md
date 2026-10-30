# Simple `TDataSetGrid` Example

This example shows the common pattern for a dataset that uses `EntityMetadata`
and `IFieldsConfigBuilder`.

```delphi
unit AjustesRedBenefPcDataSet;

interface

uses
  DataSetGrid,
  FieldsConfigUnit,
  EntityMetadataUnit;

type
  TAjustesRedBenefPcDataSet = class(TDataSetGrid)
  public
    constructor Create();

    procedure Setup(
      const Builder: IFieldsConfigBuilder;
      Meta: EntityMetadata
    );
  end;

implementation

{ TAjustesRedBenefPcDataSet }

constructor TAjustesRedBenefPcDataSet.Create;
begin
  inherited Create('CDS_AJ_REDBENEF', 'AJ_REDBENEF');

  SQLMaker.Build(
    TableName,
    'A',
    'A.ID, A.CHAVE_DFE, A.DATA_REF, A.CST, A.VBC, R.DESCR_AJ',
    'INNER JOIN REGRAS_REDBENEF_PC R ON R.ID = A.REGRA_ID',
    '',
    '',
    'DATA_REF desc, CHAVE_DFE'
  );
end;

procedure TAjustesRedBenefPcDataSet.Setup(
  const Builder: IFieldsConfigBuilder;
  Meta: EntityMetadata
);
var
  S: string;
begin
  ConfigFields(
    Builder
      .Add('ID', fvInvisivel)
      .AddPair(Meta.GetPairColumnAndDisplay('DATA_REF'), fvSempreVisivel)
      .AddPair(Meta.GetPairColumnAndDisplay('CHAVE_DFE'), fvSempreVisivel)
      .AddPair(Meta.GetPairColumnAndDisplay('CST'), fvSempreVisivel)
      .AddPair(Meta.GetPairColumnAndDisplay('VBC'))
      .AddPair(Meta.GetPairColumnAndDisplay('DESCR_AJ'))
      .ReorderAndSync(Self.GetSavedGrid().List)
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('ID', True);

  S := SQLMaker.GetSQL();

  CreateFieldsBySQL(S);
  RunSQLMaker();
end;

end.
```

Key characteristics:

- base SQL is defined in the constructor;
- metadata provides standard field/display pairs;
- technical fields can be hidden explicitly;
- `ReorderAndSync` preserves saved grid configuration;
- `Setup` builds fields from the final SQL and opens through RunSQLMaker, applying
  configured tags/labels before a form initializes FillForm;
- this query/setup-only example omits GetAuditorFill because no audited operation
  is shown. The real RedBenefPC flow has auditing callers: preserve its override
  when editing that implementation. See the extended example for the optional hook.

For an approved explicit empty projection, CreateFieldsBySQL(emptySQL) followed by
ClientOpen(emptySQL) is also valid. Do not repeat CommandText/Open or Tag assignments
already supplied by that lifecycle.
