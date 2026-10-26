unit rotas_entr_class;

interface

uses
  Contnrs,
  DB,
  DBClient;

type
  TRotas_entr_class = class(TObject)
  private
    Fcod_rota   : Integer;
    Fcod_empresa: Integer;
    Fdescricao  : string;
    Frota       : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TRotas_entr_class;

    property cod_rota   : Integer read Fcod_rota    write Fcod_rota;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property descricao  : string  read Fdescricao   write Fdescricao;
    property rota       : string  read Frota        write Frota;
  end;

  TRotas_entr_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TRotas_entr_class;
    procedure SetItem(Index: Integer; const Value: TRotas_entr_class);
  public
    function New: TRotas_entr_class;

    property Items[Index: Integer]: TRotas_entr_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TRotas_entr_class }

function TRotas_entr_class.Clone: TRotas_entr_class;
begin
  Result             := TRotas_entr_class.Create;
  Result.cod_rota    := Self.cod_rota;
  Result.cod_empresa := Self.cod_empresa;
  Result.descricao   := Self.descricao;
  Result.rota        := Self.rota;
end;

class function TRotas_entr_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_rota, @cod_empresa, @descricao, @rota';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TRotas_entr_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_rota    := ADataSet.FieldByName('COD_ROTA').AsInteger;
  Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fdescricao   := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
  Frota        := Trim(ADataSet.FieldByName('ROTA').AsString);
end;


{ TRotas_entr_classList }

function TRotas_entr_classList.GetItem(Index: Integer): TRotas_entr_class;
begin
  Result := TRotas_entr_class(inherited Items[Index]);
end;

function TRotas_entr_classList.New: TRotas_entr_class;
begin
  Result := TRotas_entr_class.Create;
  Add(Result);
end;

procedure TRotas_entr_classList.SetItem(Index: Integer; const Value: TRotas_entr_class);
begin
  Put(Index, Value);
end;

end.
