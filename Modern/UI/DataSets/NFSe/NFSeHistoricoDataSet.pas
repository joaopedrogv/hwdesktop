unit NFSeHistoricoDataSet;

interface           

uses
  DataSetGrid, DB, FieldsConfigUnit;

type
  TNFSeHistoricoDataSet = class(TDataSetGrid)
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();

    procedure Setup(const Builder: IFieldsConfigBuilder);
  end;

implementation

uses
  SysUtils, NFSeTypesUnit, NFSeTypesDisplayUnit;

{ TNFSeHistoricoDataSet }

constructor TNFSeHistoricoDataSet.Create;
begin
  inherited Create( 'cdsNFSeHist', 'NFSE_HISTORICO' );

  SQLMaker.Build( TableName, 'H',
    'h.nfse_id, h.seqid, h.data_evento, h.situacao, h.tipo_evento, h.descricao ',
    '',
    '',
    'h.data_evento desc'
  );
end;

procedure TNFSeHistoricoDataSet.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := ''
  else if Sender.FieldName = 'SITUACAO' then
    Text := SituacaoNFSeEnumStr[SituacaoNFSeEnum(Sender.AsInteger)]
  else if Sender.FieldName = 'TIPO_EVENTO' then
    Text := TipoHistoricoNFSeEnumStr[TipoHistoricoNFSeEnum(Sender.AsInteger)];
end;

procedure TNFSeHistoricoDataSet.Setup(const Builder: IFieldsConfigBuilder);
var
  S: string;
begin
  ConfigFields( Builder
    .Add('nfse_id', '', fvInvisivel)
    .Add('seqid', 'Seq')
    .Add('data_evento', 'Data Hora')
    .Add('situacao', 'Situação', GetText).Width(100)
    .Add('tipo_evento', 'Tipo', GetText).Width( 160 )
    .Add('descricao', 'Discriminação Serviço').Width(500)
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('nfse_id', True);

  S := SQLMaker.GetSQL();

  CreateFieldsBySQL( S );

  RunSQLMaker();
end;

end.
