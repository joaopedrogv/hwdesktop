unit LocalPreferences;

interface

type
  // Preferencias locais reutilizaveis por componentes. Secoes e chaves sao
  // logicas; o armazenamento fisico pertence ao adaptador.
  ILocalPreferences = interface
    ['{6F1C2E3A-9B47-4C8D-9A15-3E7B2D5C8F01}']
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

end.
