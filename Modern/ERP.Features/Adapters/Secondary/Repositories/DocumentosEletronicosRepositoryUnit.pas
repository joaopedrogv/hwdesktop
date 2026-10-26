unit DocumentosEletronicosRepositoryUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  CacheableRepositoryUnit, IDocumentosEletronicosRepositoryUnit, DocumentoEletronicoEtdUnit,
  IDataBaseConnectionUnit, ISessionContextUnit, QueryResultUnit;

type
  DocumentosEletronicosRepository = class(IDocumentosEletronicosRepository)
  public
    function ObterPorIdDoc(const IdDocumento: string): DocumentoEletronicoEtd; override;
    procedure Incluir(const Input: DocumentoEletronicoEtd); override;
  end;

implementation

uses
  ParameterValueUnit;

{ DocumentosEletronicosRepository }

function DocumentosEletronicosRepository.ObterPorIdDoc(const IdDocumento: string): DocumentoEletronicoEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT SEQID, COD_EMPRESA, ID_DOC, DOC FROM DOC_ELETRONICO WHERE ID_DOC = :ID_DOC',
    ParametersBuilder.Create(1)
      .ByName('ID_DOC', IdDocumento)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := DocumentoEletronicoEtd.Create(
        Q.FieldAsInt64('SEQID'),
        Q.FieldAsInteger('COD_EMPRESA'),
        Q.FieldAsStringNullable('ID_DOC'),
        Q.FieldAsStringNullable('DOC')
      );

  finally
    Q.Free();
  end;
end;

procedure DocumentosEletronicosRepository.Incluir(const Input: DocumentoEletronicoEtd);
begin
  FConnection.ExecuteCommand(
    'INSERT INTO DOC_ELETRONICO (COD_EMPRESA, ID_DOC, DOC) VALUES (:COD_EMPRESA, :ID_DOC, :DOC)',
    ParametersBuilder.Create(3)
      .ByName('COD_EMPRESA', Input.CodEmpresa)
      .ByName('ID_DOC', Input.IdDoc)
      .ByName('DOC', Input.Doc)
      .Build()
  );
end;

end.
