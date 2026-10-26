unit ValidationEntityOutputUnit;

interface

uses
  SysUtils, EntityMetadataUnit;

type
  ValidationEntityProblem = (vepRequired, vepHasMin, vepHasMax, vepOutOffRange, vepIsNull, vepOuthers);

  ValidationEntityItem = record
  private
    FField: string;
    FDetail: string;
    FDisplay: string;
    FProblem: ValidationEntityProblem;
  public
    class function Create(
      const FieldName, Detail: string
    ): ValidationEntityItem; static;

    class function CreateProblem(
      const FieldName: string;
      Problem: ValidationEntityProblem;
      const Detail: string = ''
    ): ValidationEntityItem; static;

    function GetMessage(): string;

    property FieldName: string read FField;
    property Display: string read FDisplay;
    property Detail: string read FDetail;
    property Problem: ValidationEntityProblem read FProblem;
  end;

  ValidationsEntitiesItem = array of ValidationEntityItem;

  ValidationEntityOutput = record
  private
    FValidations: ValidationsEntitiesItem;
    FMetadata: EntityMetadata;
  public
    class function Create(): ValidationEntityOutput; overload; static;
    class function Create(const Metadata: EntityMetadata): ValidationEntityOutput; overload; static;

    procedure Add(const Validation: ValidationEntityItem); overload;
    procedure Add(const ValidationEntity: ValidationEntityOutput); overload;
    procedure Add(const FieldName, Detail: string); overload;
    function IsValid(): Boolean;

    property Validations: ValidationsEntitiesItem read FValidations;
  end;

implementation

{ ValidationEntityItem }

class function ValidationEntityItem.CreateProblem(const FieldName: string;
  Problem: ValidationEntityProblem;
  const Detail: string): ValidationEntityItem;
begin
  Result.FField := FieldName;
  Result.FProblem := Problem;
  Result.FDetail := Detail;
end;

function ValidationEntityItem.GetMessage(): string;
begin
  if Self.Detail <> '' then
    Result := Self.Detail
  else
  begin
    case Self.Problem of
      vepRequired: Result := 'Campo de preenchimento obrigatório';
      vepIsNull  : Result := 'Campo preenchido indevidamente';
      else
        Result := 'Validacao desconhecida para o campo';
    end;
  end;
end;

class function ValidationEntityItem.Create(const FieldName, Detail: string): ValidationEntityItem;
begin
  Result.FField := FieldName;
  Result.FDetail := Detail;
  Result.FProblem := vepOuthers;
end;

{ ValidationEntityOutput }

procedure ValidationEntityOutput.Add(const Validation: ValidationEntityItem);
var
  S: string;
  V: ValidationEntityItem;
begin
  V := Validation;

  if not FMetadata.IsNull then
    if FMetadata.TryGetDisplayAttribute(V.FieldName, S) then
      V.FDisplay := S;

  SetLength(FValidations, Length(FValidations) + 1);

  FValidations[High(FValidations)] := V;
end;

class function ValidationEntityOutput.Create: ValidationEntityOutput;
begin
  SetLength(Result.FValidations, 0);
end;

procedure ValidationEntityOutput.Add(const FieldName, Detail: string);
begin
  Self.Add(ValidationEntityItem.Create(FieldName, Detail));
end;

procedure ValidationEntityOutput.Add(const ValidationEntity: ValidationEntityOutput);
var
  I: Integer;
begin
  for I := 0 to High(ValidationEntity.Validations) do
    Self.Add(ValidationEntityItem.CreateProblem(
      ValidationEntity.Validations[I].FieldName,
      ValidationEntity.Validations[I].Problem,
      ValidationEntity.Validations[I].Detail
    ));
end;

class function ValidationEntityOutput.Create(const Metadata: EntityMetadata): ValidationEntityOutput;
begin
  if Metadata.IsNull then
    raise Exception.Create('EntityValidator Create Metadata IsNull');

  Result := ValidationEntityOutput.Create();
  Result.FMetadata := Metadata;
end;

function ValidationEntityOutput.IsValid: Boolean;
begin
  Result := Length(FValidations) = 0;
end;

end.
