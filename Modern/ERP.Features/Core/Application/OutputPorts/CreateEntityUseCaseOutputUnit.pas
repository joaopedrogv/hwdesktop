unit CreateEntityUseCaseOutputUnit;

interface

uses
  ValidationEntityOutputUnit;

type
  CreateEntityUseCaseOutPut = class
  private
    FOutputObj: TObject;
    FValidation: ValidationEntityOutput;
  public
    constructor Create(Output: TObject) overload;
    constructor Create(const Validations: ValidationEntityOutput) overload;
    destructor Destroy; override;

    function ExtractOutputObj(): TObject;

    property OutputObj: TObject read FOutputObj;
    property Validation: ValidationEntityOutput read FValidation;
  end;

implementation

{ CreateEntityUseCaseOutPut }

constructor CreateEntityUseCaseOutPut.Create(const Validations: ValidationEntityOutput);
begin
  FValidation := Validations;
  FOutputObj := nil;
end;

constructor CreateEntityUseCaseOutPut.Create(Output: TObject);
begin
  FOutputObj := Output;
  FValidation := ValidationEntityOutput.Create();
end;

destructor CreateEntityUseCaseOutPut.Destroy;
begin
  FOutputObj.Free();
  inherited;
end;

function CreateEntityUseCaseOutPut.ExtractOutputObj: TObject;
begin
  Result := FOutputObj;
  FOutputObj := nil;
end;

end.
