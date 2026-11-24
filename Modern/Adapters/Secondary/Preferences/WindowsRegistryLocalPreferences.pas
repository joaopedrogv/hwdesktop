unit WindowsRegistryLocalPreferences;

interface

uses
  SysUtils, LocalPreferences;

type
  // Adaptador Windows das preferencias locais. O caminho fisico e fixo; secoes
  // logicas sao subchaves sob a raiz. Falhas de leitura voltam ao padrao.
  TWindowsRegistryLocalPreferences = class(TInterfacedObject, ILocalPreferences)
  private
    function SectionPath(const ASection: string): string;
    function IsValidLogicalName(const AValue: string): Boolean;
  public
    function ReadString(const ASection, AKey, ADefault: string): string;
    function ReadInteger(const ASection, AKey: string; ADefault: Integer): Integer;
    function ReadBoolean(const ASection, AKey: string; ADefault: Boolean): Boolean;
    procedure WriteString(const ASection, AKey, AValue: string);
    procedure WriteInteger(const ASection, AKey: string; AValue: Integer);
    procedure WriteBoolean(const ASection, AKey: string; AValue: Boolean);
    procedure DeleteKey(const ASection, AKey: string);
    procedure DeleteSection(const ASection: string);
  end;

implementation

{$IFDEF VER180}
uses
  Windows, Registry;
{$ELSE}
uses
  Winapi.Windows, System.Win.Registry;
{$ENDIF}

const
  RootKeyPath = 'Software\Hw\Configuracao\Telas';

function TWindowsRegistryLocalPreferences.IsValidLogicalName(
  const AValue: string): Boolean;
begin
  Result := Trim(AValue) <> '';
end;

function TWindowsRegistryLocalPreferences.SectionPath(
  const ASection: string): string;
begin
  Result := RootKeyPath + '\' + ASection;
end;

function TWindowsRegistryLocalPreferences.ReadString(
  const ASection, AKey, ADefault: string): string;
var
  Registro: TRegistry;
begin
  Result := ADefault;
  if (not IsValidLogicalName(ASection)) or (not IsValidLogicalName(AKey)) then
    Exit;

  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      if Registro.OpenKey(SectionPath(ASection), False) then
      try
        if Registro.ValueExists(AKey) then
          Result := Registro.ReadString(AKey);
      finally
        Registro.CloseKey;
      end;
    finally
      Registro.Free;
    end;
  except
    Result := ADefault;
  end;
end;

function TWindowsRegistryLocalPreferences.ReadInteger(
  const ASection, AKey: string; ADefault: Integer): Integer;
var
  Registro: TRegistry;
begin
  Result := ADefault;
  if (not IsValidLogicalName(ASection)) or (not IsValidLogicalName(AKey)) then
    Exit;

  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      if Registro.OpenKey(SectionPath(ASection), False) then
      try
        if Registro.ValueExists(AKey) then
          Result := Registro.ReadInteger(AKey);
      finally
        Registro.CloseKey;
      end;
    finally
      Registro.Free;
    end;
  except
    Result := ADefault;
  end;
end;

function TWindowsRegistryLocalPreferences.ReadBoolean(
  const ASection, AKey: string; ADefault: Boolean): Boolean;
var
  Registro: TRegistry;
begin
  Result := ADefault;
  if (not IsValidLogicalName(ASection)) or (not IsValidLogicalName(AKey)) then
    Exit;

  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      if Registro.OpenKey(SectionPath(ASection), False) then
      try
        if Registro.ValueExists(AKey) then
          Result := Registro.ReadBool(AKey);
      finally
        Registro.CloseKey;
      end;
    finally
      Registro.Free;
    end;
  except
    Result := ADefault;
  end;
end;

procedure TWindowsRegistryLocalPreferences.WriteString(
  const ASection, AKey, AValue: string);
var
  Registro: TRegistry;
begin
  if (not IsValidLogicalName(ASection)) or (not IsValidLogicalName(AKey)) then
    Exit;

  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      if Registro.OpenKey(SectionPath(ASection), True) then
      try
        Registro.WriteString(AKey, AValue);
      finally
        Registro.CloseKey;
      end;
    finally
      Registro.Free;
    end;
  except
    // Preferencia local nao critica: falha de escrita e ignorada.
  end;
end;

procedure TWindowsRegistryLocalPreferences.WriteInteger(
  const ASection, AKey: string; AValue: Integer);
var
  Registro: TRegistry;
begin
  if (not IsValidLogicalName(ASection)) or (not IsValidLogicalName(AKey)) then
    Exit;

  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      if Registro.OpenKey(SectionPath(ASection), True) then
      try
        Registro.WriteInteger(AKey, AValue);
      finally
        Registro.CloseKey;
      end;
    finally
      Registro.Free;
    end;
  except
    // Preferencia local nao critica: falha de escrita e ignorada.
  end;
end;

procedure TWindowsRegistryLocalPreferences.WriteBoolean(
  const ASection, AKey: string; AValue: Boolean);
var
  Registro: TRegistry;
begin
  if (not IsValidLogicalName(ASection)) or (not IsValidLogicalName(AKey)) then
    Exit;

  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      if Registro.OpenKey(SectionPath(ASection), True) then
      try
        Registro.WriteBool(AKey, AValue);
      finally
        Registro.CloseKey;
      end;
    finally
      Registro.Free;
    end;
  except
    // Preferencia local nao critica: falha de escrita e ignorada.
  end;
end;

procedure TWindowsRegistryLocalPreferences.DeleteKey(
  const ASection, AKey: string);
var
  Registro: TRegistry;
begin
  if (not IsValidLogicalName(ASection)) or (not IsValidLogicalName(AKey)) then
    Exit;

  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      if Registro.OpenKey(SectionPath(ASection), False) then
      try
        if Registro.ValueExists(AKey) then
          Registro.DeleteValue(AKey);
      finally
        Registro.CloseKey;
      end;
    finally
      Registro.Free;
    end;
  except
    // Preferencia local nao critica: falha de remocao e ignorada.
  end;
end;

procedure TWindowsRegistryLocalPreferences.DeleteSection(
  const ASection: string);
var
  Registro: TRegistry;
begin
  if not IsValidLogicalName(ASection) then
    Exit;

  try
    Registro := TRegistry.Create;
    try
      Registro.RootKey := HKEY_CURRENT_USER;
      Registro.DeleteKey(SectionPath(ASection));
    finally
      Registro.Free;
    end;
  except
    // Preferencia local nao critica: falha de remocao e ignorada.
  end;
end;

end.
