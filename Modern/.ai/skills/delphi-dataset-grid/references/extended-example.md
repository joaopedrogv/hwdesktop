# Extended `TDataSetGrid` Example

A complex dataset does not need to conform to the simple example's `Setup`
signature. Add extension points only when required.

The following patterns are representative of existing complex datasets.

## Custom Display Conversion

```delphi
procedure TNFSeDataSet.GetText(
  Sender: TField;
  var Text: string;
  DisplayText: Boolean
);
begin
  if Sender.IsNull then
    Text := ''
  else if Sender.FieldName = 'SITUACAO' then
    Text := SituacaoNFSeEnumGridStr[
      SituacaoNFSeEnum(Sender.AsInteger)
    ]
  else if Sender.FieldName = 'LAYOUT_NFSE' then
    Text := LayoutNFSeEnumGridStr[
      LayoutNFSeEnum(Sender.AsInteger)
    ];
end;
```

Use a `GetText` handler for presentation-only conversion such as enum values.

## Filter Condition Customization

```delphi
procedure TNFSeDataSet.HandleFilterField(
  const Field: TFilterProps;
  var CondSet: FilterConditionEnumSet
);
begin
  if Field.field = 'ORDENS_SERVICO' then
    CondSet := [feEquals, feBetween];
end;
```

Use this only when a field supports a constrained/custom set of filter
conditions.

## Custom Filter Translation

A dataset may override `RunSQLMaker` when a standard filter must be translated
into different SQL semantics, such as an `EXISTS` condition against a related
table.

The override should remain narrowly focused:

```text
inspect special filter
↓
validate/normalize values
↓
translate to custom SQL
↓
remove/replace generic filter
↓
execute through inherited dataset infrastructure
```

Do not reimplement the complete SQL/filter engine.

## Audit Support

GetAuditorFill is an optional virtual hook. Its default implementation raises an
exception when invoked. Override it only when consumers need a filled audit context;
a query-only dataset can omit it. This example prepares the existing audit context
without introducing new audit calls or authorizing new process identifiers:

```delphi
function TNFSeDataSet.GetAuditorFill(
  const AProcesso: string;
  const Additional: string
): TAudit_OOP;
begin
  Result := Auditor.Processo(
    AProcesso,
    Format(
      'Seq %d - DPS %s/%s - NF %s',
      [fint('SEQID'), fstr('NDPS'), fstr('SERIE'), fstr('NNFSE')]
    ),
    fstr('SEQID')
  );
end;
```

The actual description and key depend on the dataset's business context.

## Specialized `Setup`

A complex dataset may configure fields explicitly rather than through
`EntityMetadata`:

```delphi
procedure TNFSeDataSet.Setup(
  const Builder: IFieldsConfigBuilder
);
begin
  ConfigFields(
    Builder
      .Add('ID,COD_EMPRESA', fvInvisivel)
      .Add('SEQID', 'Código', fvSempreVisivel)
      .Add('SITUACAO', 'Situação', GetText)
      .Add('NNFSE', 'Número NFSe')
      .Add('ORDENS_SERVICO', 'Número O.S.', GetText)
  );

  CreateFieldsBySQL(SQLMaker.GetSQL());
  RunSQLMaker();
end;
```

This is valid when metadata does not yet cover, or should not represent, the
complete grid read model.

The Skill should therefore generate the smallest structure required by the
target dataset rather than forcing all datasets into one signature.
