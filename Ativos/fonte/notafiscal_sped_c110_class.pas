unit notafiscal_sped_c110_class;

interface

uses
  Contnrs,
  DB,
  IBQuery;

type
  TNotafiscal_sped_c110_class = class(TObject)
  private
    Fcod_nf     : Integer;
    Fcod_empresa: Integer;
    Fcod_inf    : Integer;
    Ftxt_compl  : string;
    Ftipo       : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string;

    property cod_nf     : Integer read Fcod_nf      write Fcod_nf;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_inf    : Integer read Fcod_inf     write Fcod_inf;
    property txt_compl  : string  read Ftxt_compl   write Ftxt_compl;
    property tipo       : string  read Ftipo        write Ftipo;
  end;

  TNotafiscal_sped_c110_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_sped_c110_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_sped_c110_class);
  public
    function New: TNotafiscal_sped_c110_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_sped_c110_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TNotafiscal_sped_c110_class }

class function TNotafiscal_sped_c110_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @cod_inf, @txt_compl, @tipo';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_sped_c110_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nf      := ADataSet.FieldByName('COD_NF').AsInteger;
    Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcod_inf     := ADataSet.FieldByName('COD_INF').AsInteger;
    Ftxt_compl   := Trim(ADataSet.FieldByName('TXT_COMPL').AsString);
    Ftipo        := Trim(ADataSet.FieldByName('TIPO').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NF'     )) then Fcod_nf      := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_INF'    )) then Fcod_inf     := ADataSet.FieldByName('COD_INF').AsInteger;
    if Assigned(ADataSet.FindField('TXT_COMPL'  )) then Ftxt_compl   := Trim(ADataSet.FieldByName('TXT_COMPL').AsString);
    if Assigned(ADataSet.FindField('TIPO'       )) then Ftipo        := Trim(ADataSet.FieldByName('TIPO').AsString);
  end;
end;

function TNotafiscal_sped_c110_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_NF').AsInteger      := Fcod_nf;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('COD_INF').AsInteger     := Fcod_inf;
    ADataSet.ParamByName('TXT_COMPL').AsString    := Copy(Ftxt_compl, 1, 255);
    ADataSet.ParamByName('TIPO').AsString         := Copy(Ftipo     , 1, 20);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_NF'     )) then   ADataSet.ParamByName('COD_NF').AsInteger      := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA')) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('COD_INF'    )) then   ADataSet.ParamByName('COD_INF').AsInteger     := Fcod_inf;
    if Assigned(ADataSet.Params.FindParam('TXT_COMPL'  )) then   ADataSet.ParamByName('TXT_COMPL').AsString    := Copy(Ftxt_compl, 1, 255);
    if Assigned(ADataSet.Params.FindParam('TIPO'       )) then   ADataSet.ParamByName('TIPO').AsString         := Copy(Ftipo     , 1, 20);
  end;
end;

{ TNotafiscal_sped_c110_classList }

function TNotafiscal_sped_c110_classList.GetItem(Index: Integer): TNotafiscal_sped_c110_class;
begin
  Result := TNotafiscal_sped_c110_class(inherited Items[Index]);
end;

function TNotafiscal_sped_c110_classList.New: TNotafiscal_sped_c110_class;
begin
  Result := TNotafiscal_sped_c110_class.Create;
  Add(Result);
end;

procedure TNotafiscal_sped_c110_classList.SetItem(Index: Integer; const Value: TNotafiscal_sped_c110_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_sped_c110_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
