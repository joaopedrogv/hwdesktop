# Generation Example

## SQL Input

```sql
CREATE TABLE NFSE (
  ID CHAR(36) NOT NULL,
  NUMERO INTEGER,
  DATA_EMISSAO TIMESTAMP,
  DATA_CADASTRO TIMESTAMP
);
```

## Existing Entity

```delphi
TNFSeEtd = class(EntityBase)
private
  FId: string;
  FNumero: Integer;
  FDataEmissao: TDateTime;
  FOpInterna: string;
public
  property Id: string read FId;
  property Numero: Integer read FNumero;
  property DataEmissao: TDateTime read FDataEmissao;
  property OpInterna: string read FOpInterna;
end;
```

## Output

```delphi
unit NFSeMetadataUnit;

interface

uses
  EntityMetadataUnit;

type
  TNFSeMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ TNFSeMetadata }

class function TNFSeMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('NFSe', 'NFSE');

  // Atributos vinculados
  Result.RegisterField('Id', 'ID', 'ID da NFSe');
  Result.RegisterField('Numero', 'NUMERO', 'Número da NFSe');
  Result.RegisterField('DataEmissao', 'DATA_EMISSAO', 'Data de emissão');

  // Atributos sem vinculo com a tabela
  Result.RegisterAttributeOnly('OpInterna', 'Operação Interna');

  // Campos da tabela sem vinculo com a classe
  Result.RegisterColumnOnly('DATA_CADASTRO', 'Data de cadastro');
end;

end.
```
