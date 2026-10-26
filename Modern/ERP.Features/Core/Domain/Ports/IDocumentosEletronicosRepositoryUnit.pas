unit IDocumentosEletronicosRepositoryUnit;

interface

uses
  SysUtils, Classes,
  CacheableRepositoryUnit, DocumentoEletronicoEtdUnit;

type
  IDocumentosEletronicosRepository = class(CacheableRepository)
  public
    function ObterPorIdDoc(const IdDocumento: string): DocumentoEletronicoEtd; virtual; abstract;
    procedure Incluir(const Input: DocumentoEletronicoEtd); virtual; abstract;
  end;

implementation

end.