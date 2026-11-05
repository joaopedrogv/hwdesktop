unit HwNextViewRegistryUnit;

interface

uses
  Winapi.Windows, System.SysUtils, System.Generics.Collections, HwNextViewApi,
  HwNextBaseFormUnit;

type
  // The common signature: the function receives the host parent HWND, builds
  // the concrete screen, performs the dependency injection owned by the
  // catalog and returns it as the base type.
  THwNextViewCreateFunc = function(AParent: HWND): TfrmHwNextBase;

  THwNextViewEntry = record
    Identifier: string;
    CreateFunc: THwNextViewCreateFunc;
  end;

  THwNextViewRegistry = class
  private
    FEntries: TList<THwNextViewEntry>;
    function IndexOfIdentifier(const AIdentifier: string): Integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Register(const AIdentifier: string;
      ACreateFunc: THwNextViewCreateFunc);
    function CreateView(const AIdentifier: string; AParent: HWND): TfrmHwNextBase;
    function IsRegistered(const AIdentifier: string): Boolean;
  end;

implementation

procedure ValidateIdentifier(const AIdentifier: string);
var
  I: Integer;
  Code: Integer;
begin
  if AIdentifier = '' then
    raise Exception.Create('O identificador do formulário Next não pode ser vazio.');
  if Length(AIdentifier) > HW_NEXT_IDENTIFIER_MAX_CHARS then
    raise Exception.CreateFmt(
      'O identificador do formulário Next deve ter no máximo %d caracteres.',
      [HW_NEXT_IDENTIFIER_MAX_CHARS]);
  for I := 1 to Length(AIdentifier) do
  begin
    Code := Ord(AIdentifier[I]);
    if (Code < 32) or (Code > 126) then
      raise Exception.Create(
        'O identificador do formulário Next deve conter apenas caracteres ASCII imprimíveis.');
  end;
end;

constructor THwNextViewRegistry.Create;
begin
  inherited Create;
  FEntries := TList<THwNextViewEntry>.Create;
end;

destructor THwNextViewRegistry.Destroy;
begin
  if FEntries <> nil then
    FEntries.Free;
  inherited;
end;

function THwNextViewRegistry.IndexOfIdentifier(
  const AIdentifier: string): Integer;
var
  I: Integer;
  Entry: THwNextViewEntry;
begin
  for I := 0 to FEntries.Count - 1 do
  begin
    Entry := FEntries[I];
    if SameText(Entry.Identifier, AIdentifier) then
    begin
      Result := I;
      Exit;
    end;
  end;
  Result := -1;
end;

procedure THwNextViewRegistry.Register(const AIdentifier: string;
  ACreateFunc: THwNextViewCreateFunc);
var
  Entry: THwNextViewEntry;
begin
  ValidateIdentifier(AIdentifier);
  if not Assigned(ACreateFunc) then
    raise Exception.Create(
      'A fun'#231#227'o de cria'#231#227'o do formul'#225'rio Next n'#227'o foi informada.');
  if IndexOfIdentifier(AIdentifier) >= 0 then
    raise Exception.CreateFmt('O formulário Next já está registrado: %s.',
      [AIdentifier]);
  Entry.Identifier := AIdentifier;
  Entry.CreateFunc := ACreateFunc;
  FEntries.Add(Entry);
end;

function THwNextViewRegistry.CreateView(const AIdentifier: string;
  AParent: HWND): TfrmHwNextBase;
var
  Index: Integer;
  Entry: THwNextViewEntry;
  CreateFunc: THwNextViewCreateFunc;
begin
  Index := IndexOfIdentifier(AIdentifier);
  if Index < 0 then
    raise Exception.CreateFmt('Formulário Next não registrado: %s.',
      [AIdentifier]);
  Entry := FEntries[Index];
  CreateFunc := Entry.CreateFunc;
  if not Assigned(CreateFunc) then
    raise Exception.CreateFmt(
      'A fun'#231#227'o de cria'#231#227'o do formul'#225'rio Next n'#227'o foi informada: %s.',
      [AIdentifier]);
  // Lazy creation: this is the only place the function is invoked, so a
  // re-presented view never constructs another instance.
  Result := CreateFunc(AParent);
  if Result = nil then
    raise Exception.CreateFmt(
      'A fun'#231#227'o de cria'#231#227'o do formul'#225'rio Next n'#227'o criou a tela: %s.',
      [AIdentifier]);
end;

function THwNextViewRegistry.IsRegistered(const AIdentifier: string): Boolean;
begin
  Result := IndexOfIdentifier(AIdentifier) >= 0;
end;

end.
