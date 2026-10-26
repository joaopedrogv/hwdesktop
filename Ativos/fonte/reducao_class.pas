unit reducao_class;

interface

uses
  Contnrs,
  DB;

type
  TReducao_class = class(TObject)
  private
    Fcod_reducao: Integer;
    Fcod_empresa: Integer;
    Fgrupo_prod : Integer;
    Fcod_prod   : string;
    Fdentro_est : Integer;
    Fisento     : Integer;
    Faliquota   : Double;
    Fpercentual : Double;
    Fativo      : Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property cod_reducao: Integer read Fcod_reducao write Fcod_reducao;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property grupo_prod : Integer read Fgrupo_prod  write Fgrupo_prod;
    property cod_prod   : string  read Fcod_prod    write Fcod_prod;
    property dentro_est : Integer read Fdentro_est  write Fdentro_est;
    property isento     : Integer read Fisento      write Fisento;
    property aliquota   : Double  read Faliquota    write Faliquota;
    property percentual : Double  read Fpercentual  write Fpercentual;
    property ativo      : Integer read Fativo       write Fativo;
  end;

  TReducao_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TReducao_class;
    procedure SetItem(Index: Integer; const Value: TReducao_class);
  public
    function New: TReducao_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TReducao_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TReducao_class }

constructor TReducao_class.Create;
begin
  Fativo := 1;
end;

destructor TReducao_class.Destroy;
begin
  inherited;
end;

class function TReducao_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_reducao, @cod_empresa, @grupo_prod, @cod_prod, @dentro_est, @isento, @aliquota, @percentual, @ativo';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TReducao_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_reducao := ADataSet.FieldByName('COD_REDUCAO').AsInteger;
    Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fgrupo_prod  := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod    := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fdentro_est  := ADataSet.FieldByName('DENTRO_EST').AsInteger;
    Fisento      := ADataSet.FieldByName('ISENTO').AsInteger;
    Faliquota    := ADataSet.FieldByName('ALIQUOTA').AsFloat;
    Fpercentual  := ADataSet.FieldByName('PERCENTUAL').AsFloat;
    Fativo       := ADataSet.FieldByName('ATIVO').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_REDUCAO')) then Fcod_reducao := ADataSet.FieldByName('COD_REDUCAO').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('GRUPO_PROD' )) then Fgrupo_prod  := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'   )) then Fcod_prod    := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('DENTRO_EST' )) then Fdentro_est  := ADataSet.FieldByName('DENTRO_EST').AsInteger;
    if Assigned(ADataSet.FindField('ISENTO'     )) then Fisento      := ADataSet.FieldByName('ISENTO').AsInteger;
    if Assigned(ADataSet.FindField('ALIQUOTA'   )) then Faliquota    := ADataSet.FieldByName('ALIQUOTA').AsFloat;
    if Assigned(ADataSet.FindField('PERCENTUAL' )) then Fpercentual  := ADataSet.FieldByName('PERCENTUAL').AsFloat;
    if Assigned(ADataSet.FindField('ATIVO'      )) then Fativo       := ADataSet.FieldByName('ATIVO').AsInteger;
  end;
end;

{ TReducao_classList }

function TReducao_classList.GetItem(Index: Integer): TReducao_class;
begin
  Result := TReducao_class(inherited Items[Index]);
end;

function TReducao_classList.New: TReducao_class;
begin
  Result := TReducao_class.Create;
  Add(Result);
end;

procedure TReducao_classList.SetItem(Index: Integer; const Value: TReducao_class);
begin
  Put(Index, Value);
end;
procedure TReducao_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
