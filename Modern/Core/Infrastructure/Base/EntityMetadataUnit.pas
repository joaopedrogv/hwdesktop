unit EntityMetadataUnit;

interface

uses
  SysUtils;

type
  EntityFieldMetadata = record
  private
    FAttributeName: string;
    FFieldName: string;
    FDisplayName: string;
  public
    class function Create(const AAttributeName, AFieldName, ADisplayName: string): EntityFieldMetadata; static;

    property AttributeName: string read FAttributeName;
    property FieldName: string read FFieldName;
    property DisplayName: string read FDisplayName;
  end;

  EntityMetadata = record
  private
    FCount: Integer;
    FCapacity: Integer;
    FDisplayEntity: string;
    FTableName: string;
    FFields: array of EntityFieldMetadata;
    function GetAttribute(const Name: string): EntityFieldMetadata;
    procedure EnsureCapacity();
    function GetIsNull: Boolean;
  public
    class function Create(const DisplayNameForEntity: string; const ReferenceTable: string = ''): EntityMetadata; static;

    // Registra um atributo da classe vinculado a um campo da tabela
    procedure RegisterField(const Attribute, FieldName, DisplayName: string);
    // Registra um atributo da classe somente
    // Descreve um atributo sem coluna fisica (ex.: lista de vinculos para validacao).
    // Nao cria mapeamento de coluna nem inclui o atributo na projecao SQL do grid.
    procedure RegisterAttributeOnly(const Attribute, DisplayName: string);
    // Registra um campo da tabela somente
    procedure RegisterColumnOnly(const FieldName, DisplayName: string);
    // Registra um atributo da classe que provavelmente sera um objeto, replica os FFields do parametro Metadata em Self.FFields
    procedure RegisterDependenceAttributes(const Attribute, DisplayDependece: string; const Metadata: EntityMetadata);
    // Registra um campo da tabela que provavelmente sera um objeto, replica os FFields do parametro Metadata em Self.FFields
    procedure RegisterDependenceColumns(const AliasPrefix, DisplayDependece: string; const Metadata: EntityMetadata);

    function GetDisplayColumn(const FieldName: string): string;
    function GetDisplayAttribute(const AttributeName: string): string;
    function TryGetDisplayColumn(const FieldName: string; out DisplayName: string): Boolean;
    function TryGetDisplayAttribute(const AttributeName: string; out DisplayName: string): Boolean;
    function GetPairColumnAndDisplay(const FieldName: string): string;
    function GetPairAttributeAndDisplay(const AttributeName: string): string;

    property IsNull: Boolean read GetIsNull;
    property DisplayName: string read FDisplayEntity;
    property TableName: string read FTableName;
    property Attribute[const Name: string]: EntityFieldMetadata read GetAttribute;
  end;

implementation

{ EntityMetadata }

class function EntityMetadata.Create(const DisplayNameForEntity: string; const ReferenceTable: string = ''): EntityMetadata;
begin
  Result.FCount := 0;
  Result.FCapacity := 0;
  Result.FDisplayEntity := DisplayNameForEntity;
  Result.FTableName := ReferenceTable;
end;

procedure EntityMetadata.EnsureCapacity;
var
  NewCapacity: Integer;
begin
  if FCount >= FCapacity then
  begin
    NewCapacity := FCapacity + 10;//DEFAULT_DELTA;

    SetLength(FFields, NewCapacity);
    FCapacity := NewCapacity;
  end;
end;

function EntityMetadata.GetAttribute(const Name: string): EntityFieldMetadata;
var
  I: Integer;
begin
  for I := 0 to FCount - 1 do
  begin
    if CompareText(FFields[I].AttributeName, Name) = 0 then
    begin
      Result := FFields[I];
      Exit;
    end;
  end;

  raise Exception.CreateFmt('Has no Attribute for AttributeName %s in %s', [ Name, FDisplayEntity ]);
end;

function EntityMetadata.GetDisplayAttribute(const AttributeName: string): string;
begin
  if not TryGetDisplayAttribute(AttributeName, Result) then
    raise Exception.CreateFmt('Has no DisplayName for AttributeName %s in %s', [ AttributeName, FDisplayEntity ]);
end;

function EntityMetadata.GetDisplayColumn(const FieldName: string): string;
begin
  if not TryGetDisplayColumn(FieldName, Result) then
    raise Exception.CreateFmt('Has no DisplayName for FieldName %s in %s', [ FieldName, FDisplayEntity ]);
end;

function EntityMetadata.GetIsNull: Boolean;
begin
  Result := (Trim(FDisplayEntity) = '') or (Length(FFields) = 0);
end;

function EntityMetadata.GetPairAttributeAndDisplay(const AttributeName: string): string;
begin
  Result := Format('%s=%s', [ AttributeName, GetDisplayAttribute(AttributeName) ]);
end;

function EntityMetadata.GetPairColumnAndDisplay(const FieldName: string): string;
begin
  Result := Format('%s=%s', [ FieldName, GetDisplayColumn(FieldName) ]);
end;

procedure EntityMetadata.RegisterAttributeOnly(const Attribute, DisplayName: string);
begin
  EnsureCapacity();

  FFields[FCount] := EntityFieldMetadata.Create( Attribute, '', DisplayName );
  Inc(FCount);
end;

procedure EntityMetadata.RegisterColumnOnly(const FieldName, DisplayName: string);
begin
  EnsureCapacity();

  FFields[FCount] := EntityFieldMetadata.Create( '', FieldName, DisplayName );
  Inc(FCount);
end;

procedure EntityMetadata.RegisterDependenceColumns(
  const AliasPrefix, DisplayDependece: string; const Metadata: EntityMetadata
);
var
  I: Integer;
begin
  for I := 0 to High(Metadata.FFields) do
    RegisterField(
      '',
      Format('%s%s', [AliasPrefix, Metadata.FFields[I].FieldName ]),
      Format('%s - %s', [DisplayDependece, Metadata.FFields[I].DisplayName ])
    );
end;

procedure EntityMetadata.RegisterDependenceAttributes(
  const Attribute, DisplayDependece: string; const Metadata: EntityMetadata
);
var
  I: Integer;
begin
  for I := 0 to High(Metadata.FFields) do
    RegisterField(
      Format('%s.%s', [Attribute, Metadata.FFields[I].AttributeName ]),
      '',
      Format('%s - %s', [DisplayDependece, Metadata.FFields[I].DisplayName ])
    );
end;

procedure EntityMetadata.RegisterField(const Attribute, FieldName, DisplayName: string);
begin
  EnsureCapacity();

  FFields[FCount] := EntityFieldMetadata.Create( Attribute, FieldName, DisplayName );
  Inc(FCount);
end;

function EntityMetadata.TryGetDisplayAttribute(const AttributeName: string; out DisplayName: string): Boolean;
var
  I: Integer;
begin
  for I := 0 to FCount - 1 do
  begin
    if CompareText(FFields[I].AttributeName, AttributeName) = 0 then
    begin
      DisplayName := FFields[I].DisplayName;
      Result := True;
      Exit;
    end;
  end;

  Result := False;
end;

function EntityMetadata.TryGetDisplayColumn(const FieldName: string; out DisplayName: string): Boolean;
var
  I: Integer;
begin
  for I := 0 to FCount - 1 do
  begin
    if CompareText(FFields[I].FieldName, FieldName) = 0 then
    begin
      DisplayName := FFields[I].DisplayName;
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

{ EntityFieldMetadata }

class function EntityFieldMetadata.Create(const AAttributeName, AFieldName, ADisplayName: string): EntityFieldMetadata;
begin
  Result.FAttributeName := AAttributeName;
  Result.FFieldName := AFieldName;
  Result.FDisplayName := ADisplayName;
end;

end.
