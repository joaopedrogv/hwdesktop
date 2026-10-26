unit NFSeOSMetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  NFSeOSMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ NFSeOSMetadata }

class function NFSeOSMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Substituição NFSe');

  Result.RegisterField('Id', 'ID', 'Seq');
  Result.RegisterField('NFSeId', 'NFSE_ID', 'Id NFSe');
  Result.RegisterField('NumPed', 'NPED', 'Numero O.S.');
  Result.RegisterField('Tipo', 'TIPO', 'Tipo');
  Result.RegisterField('CodEmpresa', 'COD_EMPRESA', 'Codigo Empresa');
  Result.RegisterField('VServicos', 'VSERV', 'Valor Serviços');
  Result.RegisterField('VDescontos', 'VDESCINCOND', 'Valor Descontos');
  Result.RegisterField('VRetencoes', 'VTOTRET', 'Total Retenções NF');
end;

end.
