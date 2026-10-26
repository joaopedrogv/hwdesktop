unit desoneracao_class;

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
  TDesoneracao_class = class(TBase_class)
  private
    Fid             : Integer;
    Fcod_empresa    : Integer;
    Fdescricao      : string;
    Find_desoneracao: Integer;
    procedure Setid(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setdescricao(const Value: string);
    procedure Setind_desoneracao(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property id             : Integer read Fid              write Setid;
    property cod_empresa    : Integer read Fcod_empresa     write Setcod_empresa;
    property descricao      : string  read Fdescricao       write Setdescricao;
    property ind_desoneracao: Integer read Find_desoneracao write Setind_desoneracao;
  end;

  TDesoneracao_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TDesoneracao_class;
    procedure SetItem(Index: Integer; const Value: TDesoneracao_class);
  public
    function New: TDesoneracao_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TDesoneracao_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TDesoneracao_class }

constructor TDesoneracao_class.Create;
begin
  Ftable := TTable_fb.Create('DESONERACAO',
                             'ID, COD_EMPRESA',
                             '',
                             GetFieldsSql());
end;

destructor TDesoneracao_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  inherited;
end;

class function TDesoneracao_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@id, @cod_empresa, @descricao, @ind_desoneracao';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TDesoneracao_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    id              := ADataSet.FieldByName('ID').AsInteger;
    cod_empresa     := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    descricao       := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
    ind_desoneracao := ADataSet.FieldByName('IND_DESONERACAO').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('ID'             )) then id              := ADataSet.FieldByName('ID').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'    )) then cod_empresa     := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('DESCRICAO'      )) then descricao       := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
    if Assigned(ADataSet.FindField('IND_DESONERACAO')) then ind_desoneracao := ADataSet.FieldByName('IND_DESONERACAO').AsInteger;
  end;
end;

procedure TDesoneracao_class.Setid(const Value: Integer);
begin
  Fid := Value;
  ChangeField('ID', Fid);
end;

procedure TDesoneracao_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TDesoneracao_class.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
  ChangeField('DESCRICAO', strq(Fdescricao, 64));
end;

procedure TDesoneracao_class.Setind_desoneracao(const Value: Integer);
begin
  Find_desoneracao := Value;
  ChangeField('IND_DESONERACAO', Find_desoneracao);
end;

{ TDesoneracao_classList }

function TDesoneracao_classList.GetItem(Index: Integer): TDesoneracao_class;
begin
  Result := TDesoneracao_class(inherited Items[Index]);
end;

function TDesoneracao_classList.New: TDesoneracao_class;
begin
  Result := TDesoneracao_class.Create;
  Add(Result);
end;

procedure TDesoneracao_classList.SetItem(Index: Integer; const Value: TDesoneracao_class);
begin
  Put(Index, Value);
end;

procedure TDesoneracao_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
