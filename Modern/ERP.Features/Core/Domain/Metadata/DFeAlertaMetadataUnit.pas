unit DFeAlertaMetadataUnit;

interface

uses
  Classes, SysUtils, EntityMetadataUnit;

type
  DFeAlertaMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ DFeAlertaMetadata }

class function DFeAlertaMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('DFe Alerta', 'DFE_ALERTAS');

  // Atributos vinculados
  Result.RegisterField('Id', 'ID', 'ID do Alerta');
  Result.RegisterField('ChaveDfe', 'CHAVE_DFE', 'Chave do Documento Fiscal');
  Result.RegisterField('Cmsg', 'CMSG', 'Código da Mensagem');
  Result.RegisterField('Xmsg', 'XMSG', 'Descrição da Mensagem');

  // Atributos sem vinculo com a tabela
  // Nenhum atributo adicional encontrado na classe
end;

end.
