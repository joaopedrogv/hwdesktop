unit OperacoesInternasDataSet;

interface

uses
  DataSetGrid, uDataSet_OOP, FieldsConfigUnit, hw_audit_utils, hw_filters,
  EntityMetadataUnit;

type
  TOperacoesInternasDataSet = class(TDataSetGrid)
  public
    constructor Create();

    procedure Setup(const Builder: IFieldsConfigBuilder; Meta: EntityMetadata);
    function GetAuditorFill(const AProcesso: string; const Additional: string = ''): TAudit_OOP; override;
  end;

implementation

uses
  SysUtils, StrUtils;

const
  OP_INTERNAS_PROJECTION =
    'o.ID, o.SEQID, o.DESCRICAO, o.ATIVO, o.DATA_CADASTRO, o.DATA_ALTERACAO';
  // Mesma projecao da pesquisa real, porem sem linhas: prepara os fields sem ler
  // registros de OP_INTERNAS antes da autorizacao em MOD001.
  OP_INTERNAS_EMPTY_SQL =
    'SELECT ' + OP_INTERNAS_PROJECTION + ' FROM OP_INTERNAS o WHERE 1=0';

{ TOperacoesInternasDataSet }

constructor TOperacoesInternasDataSet.Create;
begin
  inherited Create('cds_op_internas', 'OP_INTERNAS');

  SQLMaker.Build(
    TableName, 'o',
    OP_INTERNAS_PROJECTION,
    '', '', 'SEQID asc'
  );
end;

function TOperacoesInternasDataSet.GetAuditorFill(
  const AProcesso: string; const Additional: string
): TAudit_OOP;
var
  Descricao: string;
begin
  Descricao := Format('%d - %s', [fint('seqid'), fstr('descricao')]);

  Result := Auditor.Processo(
    AProcesso,
    Descricao + IfThen(Additional <> '', ' - ' + Additional),
    Descricao
  );
end;

procedure TOperacoesInternasDataSet.Setup(
  const Builder: IFieldsConfigBuilder; Meta: EntityMetadata
);
begin
  ConfigFields(
    Builder
      .Add('id,ativo', fvInvisivel)
      .AddPair(Meta.GetPairColumnAndDisplay('SEQID'), fvSempreVisivel)
      .AddPair(Meta.GetPairColumnAndDisplay('DESCRICAO'), fvSempreVisivel)
      .AddPair(Meta.GetPairColumnAndDisplay('DATA_CADASTRO'), fvSempreVisivel)
      .AddPair(Meta.GetPairColumnAndDisplay('DATA_ALTERACAO'), fvSempreVisivel)
      .ReorderAndSync(Self.GetSavedGrid().List)
  );

  CreateFieldsBySQL(OP_INTERNAS_EMPTY_SQL);

  ClientOpen(OP_INTERNAS_EMPTY_SQL);
end;

end.
