unit dataset_list;

interface

uses
  DBClient, Contnrs, CLasses;

type

  TDataSetRunTimeList = class(TObjectList)
  private
    function GetItem(Index: Integer): TClientDataSet;
    procedure SetItem(Index: Integer; const Value: TClientDataSet);
  public
    function HandleNewClient(componentName: string; AOwner: TComponent): TClientDataSet;
    function HandleFreeClient(componentName: string): TClientDataSet;

    property Items[Index: Integer]: TClientDataSet read GetItem write SetItem;
  end;

  TDbComponents = class
  private
    FdbClients: TDataSetRunTimeList;
  public
    constructor Create;
    destructor Destroy; override;

    property dbClients: TDataSetRunTimeList read FdbClients write FdbClients;
  end;

implementation

uses
  SysUtils;

{ TDataSetRunTimeList }

function TDataSetRunTimeList.GetItem(Index: Integer): TClientDataSet;
begin
  Result := TClientDataSet(inherited Items[Index]);
end;

function TDataSetRunTimeList.HandleFreeClient(
  componentName: string): TClientDataSet;
var
  I: Integer;
begin
  
  for I := 0 to Self.Count - 1 do
    if AnsiUpperCase(Self.Items[I].Name) = AnsiUpperCase(componentName) then
    begin
      Self.Delete(I);
      Exit;
    end;
end;

function TDataSetRunTimeList.HandleNewClient(componentName: string;
  AOwner: TComponent): TClientDataSet;
var
  I: Integer;
begin
  if Trim(componentName) = '' then
  begin
    Result := TClientDataSet.Create(AOwner);
    Exit;
  end;  

  for I := 0 to Self.Count - 1 do
    if AnsiUpperCase(Self.Items[I].Name) = AnsiUpperCase(componentName) then
    begin
      Result := Self.Items[I];
      Exit;
    end;

  Result := TClientDataSet.Create(AOwner);
  Add(Result);
end;

procedure TDataSetRunTimeList.SetItem(Index: Integer;
  const Value: TClientDataSet);
begin
  Put(Index, Value);
end;

{ TDbComponents }

constructor TDbComponents.Create;
begin
  FdbClients := TDataSetRunTimeList.Create;
end;

destructor TDbComponents.Destroy;
begin
  FdbClients.Free;
  inherited;
end;

end.
