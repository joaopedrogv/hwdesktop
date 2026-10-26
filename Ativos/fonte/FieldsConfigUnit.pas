unit FieldsConfigUnit;

interface

uses
  Contnrs, DB;

type
  FieldConfigVisibilidade = (fvConfiguravel, fvInvisivel, fvSempreVisivel, fvInvisivelConfiguravel);
  FieldConfigStateVisibilidade = (fsvNaoDefinido, fsvInvisivel, fsvVisivel );

  FieldConfigModel = class
  private
    FEditMask: string;
    FDisplayLabel: string;
    FFieldName: string;
    FDisplayFormat: string;
    FVisibilidade: FieldConfigVisibilidade;
    FGetText: TFieldGetTextEvent;
    FWidth: Integer;
    FVisivel: FieldConfigStateVisibilidade;
    function GetVisivel: Boolean;
    function GetTag: Integer;
  public
    constructor Create(
      const AFieldName, ADisplayLabel, AEditMask, ADisplayFormat: string;
      AVisibilidade: FieldConfigVisibilidade;
      GetTextEvent: TFieldGetTextEvent = nil
    );
    destructor Destroy; override;

    function Clone(): FieldConfigModel;

    property Tag          : Integer read GetTag;
    property FieldName    : string  read FFieldName;
    property DisplayLabel : string  read FDisplayLabel;
    property EditMask     : string  read FEditMask;
    property DisplayFormat: string  read FDisplayFormat;
    property Visibilidade : FieldConfigVisibilidade read FVisibilidade;
    property GetText      : TFieldGetTextEvent read FGetText;
    property Width        : Integer read FWidth;
    property Visivel      : Boolean read GetVisivel;
  end;

  FieldsConfigModel = class(TObjectList)
  private
    function GetField(const FieldName: string): FieldConfigModel;
    function GetItem(Index: integer): FieldConfigModel;
    procedure SetItem(Index: integer; const Value: FieldConfigModel);
  public
    procedure ReorderAndSync(const AReferenceList: FieldsConfigModel);
    function Clone(): FieldsConfigModel;

    property Items[Index: integer]: FieldConfigModel read GetItem write SetItem;
    property Field[const FieldName: string]: FieldConfigModel read GetField; default;
  end;

  IFieldsConfigBuilder = interface
    ['{E06F735A-87B6-410A-B3D0-B3E1E9A51F03}']
    function Add(const FieldName, DisplayLabel: string): IFieldsConfigBuilder; overload;
    function Add(const FieldName, DisplayLabel: string; Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder; overload;
    function Add(const FieldName, DisplayLabel: string; GetTextEvent: TFieldGetTextEvent; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function Add(const FieldName, DisplayLabel, EditMask: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function Add(const FieldName, DisplayLabel, EditMask, DisplayFormat: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function Add(const FieldName: string; Visibilidade: FieldConfigVisibilidade = fvInvisivel): IFieldsConfigBuilder; overload;
    function AddPair(const FieldAndDisplayLabel: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function AddPair(const FieldAndDisplayLabel: string; GetTextEvent: TFieldGetTextEvent; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function AddPair(const FieldAndDisplayLabel, EditMask: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function AddPair(const FieldAndDisplayLabel, EditMask, DisplayFormat: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function Width(Size: Integer): IFieldsConfigBuilder;
    function ReorderAndSync(const AReferenceList: FieldsConfigModel): IFieldsConfigBuilder;
    function GetList(): FieldsConfigModel;

    property List: FieldsConfigModel read GetList;
  end;

  FieldsConfigFactory = class
  public
    class function Create(): IFieldsConfigBuilder;
  end;

implementation

uses
  StrUtils,
  SysUtils,
  Classes;

type
  FieldsConfigBuilder = class(TInterfacedObject, IFieldsConfigBuilder)
  private
    FLastField: FieldConfigModel;
    FFields: FieldsConfigModel; // Caso de erro em qualquer metodo do builder FFields.Free é chamado para evitar vazamento de memoria
    procedure Check(const FieldName: string);
    function CreateField(
      const AFieldName, ADisplayLabel, AEditMask, ADisplayFormat: string;
      AVisibilidade: FieldConfigVisibilidade;
      GetTextEvent: TFieldGetTextEvent = nil
    ): FieldConfigModel;
  public
    constructor Create();
    destructor Destroy; override;

    function Add(const FieldName, DisplayLabel: string): IFieldsConfigBuilder; overload;
    function Add(const FieldName, DisplayLabel: string; Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder; overload;
    function Add(const FieldName, DisplayLabel: string; GetTextEvent: TFieldGetTextEvent; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function Add(const FieldName, DisplayLabel, EditMask: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function Add(const FieldName, DisplayLabel, EditMask, DisplayFormat: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function Add(const FieldName: string; Visibilidade: FieldConfigVisibilidade = fvInvisivel): IFieldsConfigBuilder; overload;
    function AddPair(const FieldAndDisplayLabel: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function AddPair(const FieldAndDisplayLabel: string; GetTextEvent: TFieldGetTextEvent; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function AddPair(const FieldAndDisplayLabel, EditMask: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function AddPair(const FieldAndDisplayLabel, EditMask, DisplayFormat: string; Visibilidade: FieldConfigVisibilidade = fvConfiguravel): IFieldsConfigBuilder; overload;
    function Width(Size: Integer): IFieldsConfigBuilder;
    function ReorderAndSync(const AReferenceList: FieldsConfigModel): IFieldsConfigBuilder;
    function GetList(): FieldsConfigModel;
  end;

{ FieldsConfigBuilder }

function FieldsConfigBuilder.Add(const FieldName,
  DisplayLabel: string): IFieldsConfigBuilder;
begin
  try
    Check(FieldName);

    FFields.Add(
      CreateField(FieldName, DisplayLabel, '', '', fvConfiguravel )
    );
    Result := Self;

  except on E: Exception do
    begin
      FFields.Free;
      raise;
    end;
  end;
end;

function FieldsConfigBuilder.Add(const FieldName: string;
  Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder;
const
  SEPS: array[0..2] of string = (';', ',', ' ');
var
  SList: TStrings;
  S: string;
  I, J: Integer;
begin
  try
    Check(FieldName);

    SList := nil;

    for I := Low(SEPS) + 1 to High(SEPS) do
      if ContainsText(FieldName, SEPS[I]) then
      begin
        SList := TStringList.Create;
        SList.LineBreak := ';';
        S := FieldName;
        for J := Low(SEPS) + 1 to High(SEPS) do // ignora o primeiro pois é o mesmo do replace
          S := StringReplace(S, SEPS[J], ';', [rfReplaceAll]) ;

        SList.Text := S;

        for J := 0 to SList.Count - 1 do
          FFields.Add(
            CreateField(SList[J], '', '', '', Visibilidade )
          ); 
        Result := Self;

        Exit;
      end;

    FFields.Add(
      CreateField(FieldName, '', '', '', Visibilidade )
    );
    Result := Self;

  except on E: Exception do
    begin
      FFields.Free();
      SList.Free();
      raise;
    end;
  end;  
end;

function FieldsConfigBuilder.AddPair(const FieldAndDisplayLabel: string; GetTextEvent: TFieldGetTextEvent;
  Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder;
var
  I: Integer;
  F, D: string;
begin
  I := Pos('=', FieldAndDisplayLabel);
  if I = 0 then
    raise Exception.Create('AddPair has then pattern "<FieldName>=<DisplayLable>"');

  F := Copy(FieldAndDisplayLabel, 1, I - 1);
  D := Copy(FieldAndDisplayLabel, I + 1, Length(FieldAndDisplayLabel) );

  Result := Self.Add( F, D, GetTextEvent, Visibilidade );
end;

function FieldsConfigBuilder.AddPair(
  const FieldAndDisplayLabel: string; Visibilidade: FieldConfigVisibilidade
): IFieldsConfigBuilder;
var
  E: TFieldGetTextEvent;
begin
  E := nil;
  Result := Self.AddPair( FieldAndDisplayLabel, E, Visibilidade );
end;

function FieldsConfigBuilder.Add(
  const FieldName, DisplayLabel: string;
  GetTextEvent: TFieldGetTextEvent;
  Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder;
begin
  try
    Check(FieldName);

    FFields.Add(
      CreateField(FieldName, DisplayLabel, '', '', Visibilidade, GetTextEvent )
    );
    Result := Self;

  except on E: Exception do
    begin
      FFields.Free;
      raise;
    end;
  end;
end;

function FieldsConfigBuilder.Add(const FieldName, DisplayLabel, EditMask,
  DisplayFormat: string;
  Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder;
begin
  try
    Check(FieldName);

    FFields.Add(
      CreateField(FieldName, DisplayLabel, EditMask, DisplayFormat, Visibilidade )
    );
    Result := Self;

  except on E: Exception do
    begin
      FFields.Free;
      raise;
    end;
  end;
end;

function FieldsConfigBuilder.Add(const FieldName, DisplayLabel,
  EditMask: string;
  Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder;
begin
  try
    Check(FieldName);

    FFields.Add(
      CreateField(FieldName, DisplayLabel, EditMask, '', Visibilidade )
    );
    Result := Self;

  except on E: Exception do
    begin
      FFields.Free;
      raise;
    end;
  end;
end;

function FieldsConfigBuilder.Add(const FieldName, DisplayLabel: string;
  Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder;
begin
  try
    Check(FieldName);

    FFields.Add(
      CreateField(FieldName, DisplayLabel, '', '', Visibilidade )
    );
    Result := Self;

  except on E: Exception do
    begin
      FFields.Free;
      raise;
    end;
  end;
end;

procedure FieldsConfigBuilder.Check(const FieldName: string);
begin
  if FFields.GetField(FieldName) <> nil then
    raise Exception.CreateFmt('FieldsConfigBuilder.Check %s already exists', [FieldName]);
end;

constructor FieldsConfigBuilder.Create;
begin
  FFields := FieldsConfigModel.Create();
end;

function FieldsConfigBuilder.CreateField(const AFieldName, ADisplayLabel,
  AEditMask, ADisplayFormat: string; AVisibilidade: FieldConfigVisibilidade;
  GetTextEvent: TFieldGetTextEvent): FieldConfigModel;
begin
  FLastField := FieldConfigModel.Create( AFieldName, ADisplayLabel, AEditMask, ADisplayFormat, AVisibilidade, GetTextEvent );
  Result := FLastField;
end;

destructor FieldsConfigBuilder.Destroy;
begin
  FFields.Free();
  inherited;
end;

function FieldsConfigBuilder.GetList: FieldsConfigModel;
begin
  Result := FFields;
end;

function FieldsConfigBuilder.ReorderAndSync(const AReferenceList: FieldsConfigModel): IFieldsConfigBuilder;
begin
  FFields.ReorderAndSync( AReferenceList );

  Result := Self;
end;

function FieldsConfigBuilder.Width(Size: Integer): IFieldsConfigBuilder;
begin
  FLastField.FWidth := Size;
  Result := Self;
end;

function FieldsConfigBuilder.AddPair(const FieldAndDisplayLabel, EditMask: string;
  Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder;
begin
  Result := Self.AddPair( FieldAndDisplayLabel, EditMask, '', Visibilidade );
end;

function FieldsConfigBuilder.AddPair(const FieldAndDisplayLabel, EditMask, DisplayFormat: string;
  Visibilidade: FieldConfigVisibilidade): IFieldsConfigBuilder;
var
  I: Integer;
  F, D: string;
begin
  I := Pos('=', FieldAndDisplayLabel);
  if I = 0 then
    raise Exception.Create('AddPair has then pattern "<FieldName>=<DisplayLable>"');

  F := Copy(FieldAndDisplayLabel, 1, I - 1);
  D := Copy(FieldAndDisplayLabel, I + 1, Length(FieldAndDisplayLabel) );

  Result := Self.Add( F, D, EditMask, DisplayFormat, Visibilidade );
end;

{ FieldConfigModel }

function FieldConfigModel.Clone: FieldConfigModel;
begin
  Result := FieldConfigModel.Create(
    FFieldName,
    FDisplayLabel,
    FEditMask,
    FDisplayFormat,
    FVisibilidade,
    FGetText
  );
  Result.FWidth := FWidth;
  Result.FVisivel := FVisivel;
end;

constructor FieldConfigModel.Create(
  const AFieldName, ADisplayLabel, AEditMask, ADisplayFormat: string;
  AVisibilidade: FieldConfigVisibilidade;
  GetTextEvent: TFieldGetTextEvent = nil
);
begin
  FFieldName := AnsiUpperCase(Trim(AFieldName));
  FDisplayLabel := IfThen( Trim(ADisplayLabel) <> '', ADisplayLabel );
  FEditMask := AEditMask;
  FDisplayFormat :=  ADisplayFormat;
  FVisibilidade := AVisibilidade;
  FGetText := GetTextEvent;
  FWidth := 0;
end;

destructor FieldConfigModel.Destroy;
begin
  FGetText := nil;
  inherited;
end;

function FieldConfigModel.GetTag: Integer;
begin
  case FVisibilidade of
    fvConfiguravel         : Result := 0;
    fvInvisivel            : Result := 1;
    fvSempreVisivel        : Result := 2;
    fvInvisivelConfiguravel: Result := 3;
  end;
end;

function FieldConfigModel.GetVisivel: Boolean;
begin
  case FVisibilidade of
    fvInvisivel    : Result := False;
    fvSempreVisivel: Result := True;
    else
    begin
      if FVisivel = fsvNaoDefinido then
        Result := FVisibilidade = fvConfiguravel  
      else
        Result := FVisivel = fsvVisivel
    end;
  end;
end;

{ FieldsConfigModel }

function FieldsConfigModel.Clone: FieldsConfigModel;
var
  I: Integer;
begin
  Result := FieldsConfigModel.Create;
  for I := 0 to Self.Count - 1 do
    Result.Add( Self.Items[I].Clone() );
end;

function FieldsConfigModel.GetField(const FieldName: string): FieldConfigModel;
var
  I: Integer;
begin

	for I := 0 to Self.Count - 1 do
    if Self.Items[I].FieldName = AnsiUpperCase(Trim(FieldName)) then
    begin
      Result := Self.Items[I];
      Exit;
    end;
  Result := nil;
  //Result := FieldConfigModel.Create(FieldName, '', '', '', fvConfiguravel);
  //Self.Add(Result);
end;

function FieldsConfigModel.GetItem(Index: integer): FieldConfigModel;
begin
	Result := FieldConfigModel(inherited Items[Index]);
end;

procedure FieldsConfigModel.ReorderAndSync(const AReferenceList: FieldsConfigModel);
var
  i, j, TargetIndex: Integer;
  RefItem: FieldConfigModel;
  CurrentItem: FieldConfigModel;
  NewOrder: array of FieldConfigModel;
  SeenNames: TStringList;
begin
  if not Assigned(AReferenceList) then
    Exit;

  SetLength(NewOrder, Count);
  TargetIndex := 0;

  SeenNames := TStringList.Create;
  try
    SeenNames.Sorted := False;
    SeenNames.Duplicates := dupIgnore;

    // Primeiro: preencher NewOrder com os itens na ordem da referência
    for i := 0 to AReferenceList.Count - 1 do
    begin
      RefItem := AReferenceList.Items[i];
      CurrentItem := GetField(RefItem.FieldName);
      if Assigned(CurrentItem) then
      begin
        // Atualiza o Width
        CurrentItem.FWidth := RefItem.Width;
        // Para atualizar quando vier de algum lugar salvo
        case CurrentItem.Visibilidade of
          fvConfiguravel,
          fvInvisivelConfiguravel:
            if RefItem.Visivel then
              CurrentItem.FVisivel := fsvVisivel
            else
              CurrentItem.FVisivel := fsvInvisivel
        end;

        // Evitar duplicatas
        if SeenNames.IndexOf(RefItem.FieldName) = -1 then
        begin
          SeenNames.Add(RefItem.FieldName);
          NewOrder[TargetIndex] := CurrentItem;
          Inc(TargetIndex);
        end;
      end;
    end;

    // Segundo: adicionar os restantes (não mencionados na referência)
    for i := 0 to Count - 1 do
    begin
      CurrentItem := Items[i];
      if SeenNames.IndexOf(CurrentItem.FieldName) = -1 then
      begin
        NewOrder[TargetIndex] := CurrentItem;
        Inc(TargetIndex);
      end;
    end;

    // Garantir que o array tem exatamente Count elementos
    SetLength(NewOrder, Count);

    // Etapa 2: Reordenar a lista interna SEM destruir objetos
    Self.OwnsObjects := False;
    try
      for i := 0 to Count - 1 do
        Items[i] := NewOrder[i];
    finally
      Self.OwnsObjects := True;
    end;

  finally
    SeenNames.Free;
  end;
end;

procedure FieldsConfigModel.SetItem(Index: integer; const Value: FieldConfigModel);
begin
	Put(Index, Value);
end;

{ FieldsConfigFactory }

class function FieldsConfigFactory.Create: IFieldsConfigBuilder;
begin
  Result := FieldsConfigBuilder.Create();
end;

end.
