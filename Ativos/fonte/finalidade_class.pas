unit finalidade_class;

interface

uses
{$IFDEF VER180}
  base_class,
  Contnrs,
  DB;
{$ELSE}
  base_class,
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  TFinalidade_class = class(TBase_class)
  private
    Fid         : Integer;
    Fcod_empresa: Integer;
    Fdescricao  : string;
    procedure Setid(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setdescricao(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property id         : Integer read Fid          write Setid;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property descricao  : string  read Fdescricao   write Setdescricao;
  end;

  TFinalidade_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TFinalidade_class;
    procedure SetItem(Index: Integer; const Value: TFinalidade_class);
  public
    function New: TFinalidade_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TFinalidade_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TFinalidade_class }

constructor TFinalidade_class.Create;
begin
  Ftable := TTable_fb.Create('FINALIDADE',
                             'ID, COD_EMPRESA',
                             '',
                             GetFieldsSql());
end;

destructor TFinalidade_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  inherited;
end;

class function TFinalidade_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@id, @cod_empresa, @descricao';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TFinalidade_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    id          := ADataSet.FieldByName('ID').AsInteger;
    cod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    descricao   := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('ID'         )) then id          := ADataSet.FieldByName('ID').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then cod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('DESCRICAO'  )) then descricao   := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
  end;
end;

procedure TFinalidade_class.Setid(const Value: Integer);
begin
  Fid := Value;
  ChangeField('ID', Fid);
end;

procedure TFinalidade_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TFinalidade_class.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
  ChangeField('DESCRICAO', strq(Fdescricao, 64));
end;

{ TFinalidade_classList }

function TFinalidade_classList.GetItem(Index: Integer): TFinalidade_class;
begin
  Result := TFinalidade_class(inherited Items[Index]);
end;

function TFinalidade_classList.New: TFinalidade_class;
begin
  Result := TFinalidade_class.Create;
  Add(Result);
end;

procedure TFinalidade_classList.SetItem(Index: Integer; const Value: TFinalidade_class);
begin
  Put(Index, Value);
end;

procedure TFinalidade_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
