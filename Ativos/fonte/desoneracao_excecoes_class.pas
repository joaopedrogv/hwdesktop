unit desoneracao_excecoes_class;

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
  TDesoneracao_excecoes_class = class(TBase_class)
  private
    Fdesoneracaoid: Integer;
    Fcod_empresa  : Integer;
    Fncm          : string;
    procedure Setdesoneracaoid(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setncm(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TDesoneracao_excecoes_class; virtual;

    property desoneracaoid: Integer read Fdesoneracaoid write Setdesoneracaoid;
    property cod_empresa  : Integer read Fcod_empresa   write Setcod_empresa;
    property ncm          : string  read Fncm           write Setncm;
  end;

  TDesoneracao_excecoes_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TDesoneracao_excecoes_class;
    procedure SetItem(Index: Integer; const Value: TDesoneracao_excecoes_class);
  public
    function New: TDesoneracao_excecoes_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TDesoneracao_excecoes_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TDesoneracao_excecoes_class }

constructor TDesoneracao_excecoes_class.Create;
begin
  Ftable := TTable_fb.Create('DESONERACAO_EXCECOES',
                             'DESONERACAOID, COD_EMPRESA, NCM',
                             'DESONERACAOID, COD_EMPRESA',
                             GetFieldsSql());
end;

destructor TDesoneracao_excecoes_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  inherited;
end;

function TDesoneracao_excecoes_class.Clone: TDesoneracao_excecoes_class;
begin
  Result               := TDesoneracao_excecoes_class.Create;
  Result.desoneracaoid := Self.desoneracaoid;
  Result.cod_empresa   := Self.cod_empresa;
  Result.ncm           := Self.ncm;
  Result.recordState   := Self.recordState;
end;

class function TDesoneracao_excecoes_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@desoneracaoid, @cod_empresa, @ncm';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TDesoneracao_excecoes_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    desoneracaoid := ADataSet.FieldByName('DESONERACAOID').AsInteger;
    cod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    ncm           := Trim(ADataSet.FieldByName('NCM').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('DESONERACAOID')) then desoneracaoid := ADataSet.FieldByName('DESONERACAOID').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'  )) then cod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('NCM'          )) then ncm           := Trim(ADataSet.FieldByName('NCM').AsString);
  end;
end;

procedure TDesoneracao_excecoes_class.Setdesoneracaoid(const Value: Integer);
begin
  Fdesoneracaoid := Value;
  ChangeField('DESONERACAOID', Fdesoneracaoid);
end;

procedure TDesoneracao_excecoes_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TDesoneracao_excecoes_class.Setncm(const Value: string);
begin
  Fncm := Value;
  ChangeField('NCM', strq(Fncm, 8));
end;

{ TDesoneracao_excecoes_classList }

function TDesoneracao_excecoes_classList.GetItem(Index: Integer): TDesoneracao_excecoes_class;
begin
  Result := TDesoneracao_excecoes_class(inherited Items[Index]);
end;

function TDesoneracao_excecoes_classList.New: TDesoneracao_excecoes_class;
begin
  Result := TDesoneracao_excecoes_class.Create;
  Add(Result);
end;

procedure TDesoneracao_excecoes_classList.SetItem(Index: Integer; const Value: TDesoneracao_excecoes_class);
begin
  Put(Index, Value);
end;

procedure TDesoneracao_excecoes_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
