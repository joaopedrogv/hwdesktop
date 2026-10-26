unit notafiscal_sped_c111_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB,
  IBQuery;
{$ELSE}
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ENDIF}

type
  TNotafiscal_sped_c111_class = class(TObject)
  private
    Fcod_nf           : Integer;
    Fcod_empresa      : Integer;
    Fcod_inf          : Integer;
    Fnum_proc         : string;
    Find_proc         : string;
    Fcod_acao_judicial: Integer;
    Fcod_adm          : Integer;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property cod_nf           : Integer read Fcod_nf            write Fcod_nf;
    property cod_empresa      : Integer read Fcod_empresa       write Fcod_empresa;
    property cod_inf          : Integer read Fcod_inf           write Fcod_inf;
    property num_proc         : string  read Fnum_proc          write Fnum_proc;
    property ind_proc         : string  read Find_proc          write Find_proc;
    property cod_acao_judicial: Integer read Fcod_acao_judicial write Fcod_acao_judicial;
    property cod_adm          : Integer read Fcod_adm           write Fcod_adm;
  end;

  TNotafiscal_sped_c111_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_sped_c111_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_sped_c111_class);
  public
    function New: TNotafiscal_sped_c111_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_sped_c111_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TNotafiscal_sped_c111_class }

class function TNotafiscal_sped_c111_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @cod_inf, @num_proc, @ind_proc, @cod_acao_judicial, @cod_adm';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_sped_c111_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nf            := ADataSet.FieldByName('COD_NF').AsInteger;
    Fcod_empresa       := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcod_inf           := ADataSet.FieldByName('COD_INF').AsInteger;
    Fnum_proc          := Trim(ADataSet.FieldByName('NUM_PROC').AsString);
    Find_proc          := Trim(ADataSet.FieldByName('IND_PROC').AsString);
    Fcod_acao_judicial := ADataSet.FieldByName('COD_ACAO_JUDICIAL').AsInteger;
    Fcod_adm           := ADataSet.FieldByName('COD_ADM').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NF'           )) then Fcod_nf            := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'      )) then Fcod_empresa       := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_INF'          )) then Fcod_inf           := ADataSet.FieldByName('COD_INF').AsInteger;
    if Assigned(ADataSet.FindField('NUM_PROC'         )) then Fnum_proc          := Trim(ADataSet.FieldByName('NUM_PROC').AsString);
    if Assigned(ADataSet.FindField('IND_PROC'         )) then Find_proc          := Trim(ADataSet.FieldByName('IND_PROC').AsString);
    if Assigned(ADataSet.FindField('COD_ACAO_JUDICIAL')) then Fcod_acao_judicial := ADataSet.FieldByName('COD_ACAO_JUDICIAL').AsInteger;
    if Assigned(ADataSet.FindField('COD_ADM'          )) then Fcod_adm           := ADataSet.FieldByName('COD_ADM').AsInteger;
  end;
end;

function TNotafiscal_sped_c111_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_NF').AsInteger            := Fcod_nf;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger       := Fcod_empresa;
    ADataSet.ParamByName('COD_INF').AsInteger           := Fcod_inf;
    ADataSet.ParamByName('NUM_PROC').AsString           := Copy(Fnum_proc, 1, 15);
    ADataSet.ParamByName('IND_PROC').AsString           := Copy(Find_proc, 1, 1);
    ADataSet.ParamByName('COD_ACAO_JUDICIAL').AsInteger := Fcod_acao_judicial;
    ADataSet.ParamByName('COD_ADM').AsInteger           := Fcod_adm;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_NF'           )) then   ADataSet.ParamByName('COD_NF').AsInteger            := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'      )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger       := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('COD_INF'          )) then   ADataSet.ParamByName('COD_INF').AsInteger           := Fcod_inf;
    if Assigned(ADataSet.Params.FindParam('NUM_PROC'         )) then   ADataSet.ParamByName('NUM_PROC').AsString           := Copy(Fnum_proc, 1, 15);
    if Assigned(ADataSet.Params.FindParam('IND_PROC'         )) then   ADataSet.ParamByName('IND_PROC').AsString           := Copy(Find_proc, 1, 1);
    if Assigned(ADataSet.Params.FindParam('COD_ACAO_JUDICIAL')) then   ADataSet.ParamByName('COD_ACAO_JUDICIAL').AsInteger := Fcod_acao_judicial;
    if Assigned(ADataSet.Params.FindParam('COD_ADM'          )) then   ADataSet.ParamByName('COD_ADM').AsInteger           := Fcod_adm;
  end;
end;

{ TNotafiscal_sped_c111_classList }

function TNotafiscal_sped_c111_classList.GetItem(Index: Integer): TNotafiscal_sped_c111_class;
begin
  Result := TNotafiscal_sped_c111_class(inherited Items[Index]);
end;

function TNotafiscal_sped_c111_classList.New: TNotafiscal_sped_c111_class;
begin
  Result := TNotafiscal_sped_c111_class.Create;
  Add(Result);
end;

procedure TNotafiscal_sped_c111_classList.SetItem(Index: Integer; const Value: TNotafiscal_sped_c111_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_sped_c111_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
