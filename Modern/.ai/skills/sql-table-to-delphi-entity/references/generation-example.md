# Generation Example

## Input

```sql
CREATE TABLE PRODUTOS (
  ID CHAR(36) NOT NULL,
  DESCRICAO VARCHAR(120),
  ATIVO SMALLINT NOT NULL,
  DATA_CADASTRO TIMESTAMP
);
```

## Output

```delphi
unit ProdutoEtdUnit;

interface

uses
  Contnrs, StringNullableUnit, DateAndTimeNullableUnit, StatusRegistroEnumUnit;

type
  TProdutoEtd = class
  private
    FId: string;
    FDescricao: StringNullable;
    FAtivo: StatusRegistroEnum;
    FDataCadastro: DateTimeNullable;
  public
    constructor Create(); overload;
    constructor Create(
      const AId: string;
      const ADescricao: StringNullable;
      AAtivo: StatusRegistroEnum;
      const ADataCadastro: DateTimeNullable
    ); overload;

    property Id: string read FId write FId;
    property Descricao: StringNullable read FDescricao write FDescricao;
    property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property DataCadastro: DateTimeNullable read FDataCadastro write FDataCadastro;
  end;

  TProdutoEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): TProdutoEtd;
    procedure SetItem(Index: Integer; const Value: TProdutoEtd);
  public
    property Items[Index: Integer]: TProdutoEtd read GetItem write SetItem;
  end;

implementation

{ TProdutoEtd }

constructor TProdutoEtd.Create();
begin
  inherited Create;
end;

constructor TProdutoEtd.Create(
  const AId: string;
  const ADescricao: StringNullable;
  AAtivo: StatusRegistroEnum;
  const ADataCadastro: DateTimeNullable
);
begin
  Create();
  FId := AId;
  FDescricao := ADescricao;
  FAtivo := AAtivo;
  FDataCadastro := ADataCadastro;
end;

{ TProdutoEtdList }

function TProdutoEtdList.GetItem(Index: Integer): TProdutoEtd;
begin
  Result := TProdutoEtd(inherited Items[Index]);
end;

procedure TProdutoEtdList.SetItem(Index: Integer; const Value: TProdutoEtd);
begin
  Put(Index, Value);
end;

end.
```
