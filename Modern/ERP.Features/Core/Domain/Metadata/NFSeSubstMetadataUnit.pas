unit NFSeSubstMetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  NFSeSubstMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ NFSeSubstMetadata }

class function NFSeSubstMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Substituição NFSe');

  Result.RegisterField('Id', 'ID', 'Id');
  Result.RegisterField('SubstId', 'SUBST_ID', 'Id NFSe Substituída');
  Result.RegisterField('Chave', 'CHAVE', 'Chave NFSe Substituída');
  Result.RegisterField('CMotivo', 'CMOTIVO', 'Código Motivo');
  Result.RegisterField('XMotivo', 'XMOTIVO', 'Motivo');
  Result.RegisterField('Serie', 'SERIE', 'Série');
  Result.RegisterField('Ndps', 'NDPS', 'Número DPS/RPS');
  Result.RegisterField('NNFSe', 'NNFSE', 'Número NFSe');
  Result.RegisterField('NLote', 'NLOTE', 'Lote');
  Result.RegisterField('CVerificacao', 'CVERIFICACAO', 'Código Verificação');
end;

end.
