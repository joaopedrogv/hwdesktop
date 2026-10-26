unit cst_icms_inf_cpl_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB;
{$ELSE}
  System.Contnrs,
  Data.DB;
{$ENDIF}

type
  TCst_icms_inf_cpl_class = class(TObject)
  private
    Fcst_csosn  : string;
    Fcod_inf    : Integer;
    Fcod_empresa: Integer;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TCst_icms_inf_cpl_class; virtual;

    property cst_csosn  : string  read Fcst_csosn   write Fcst_csosn;
    property cod_inf    : Integer read Fcod_inf     write Fcod_inf;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
  end;

  TCst_icms_inf_cpl_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TCst_icms_inf_cpl_class;
    procedure SetItem(Index: Integer; const Value: TCst_icms_inf_cpl_class);
  public
    function New: TCst_icms_inf_cpl_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TCst_icms_inf_cpl_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TCst_icms_inf_cpl_class }

function TCst_icms_inf_cpl_class.Clone: TCst_icms_inf_cpl_class;
begin
  Result             := TCst_icms_inf_cpl_class.Create;
  Result.cst_csosn   := Self.cst_csosn;
  Result.cod_inf     := Self.cod_inf;
  Result.cod_empresa := Self.cod_empresa;
end;

class function TCst_icms_inf_cpl_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cst_csosn, @cod_inf, @cod_empresa';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TCst_icms_inf_cpl_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcst_csosn   := Trim(ADataSet.FieldByName('CST_CSOSN').AsString);
    Fcod_inf     := ADataSet.FieldByName('COD_INF').AsInteger;
    Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('CST_CSOSN'  )) then Fcst_csosn   := Trim(ADataSet.FieldByName('CST_CSOSN').AsString);
    if Assigned(ADataSet.FindField('COD_INF'    )) then Fcod_inf     := ADataSet.FieldByName('COD_INF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  end;
end;

{ TCst_icms_inf_cpl_classList }

function TCst_icms_inf_cpl_classList.GetItem(Index: Integer): TCst_icms_inf_cpl_class;
begin
  Result := TCst_icms_inf_cpl_class(inherited Items[Index]);
end;

function TCst_icms_inf_cpl_classList.New: TCst_icms_inf_cpl_class;
begin
  Result := TCst_icms_inf_cpl_class.Create;
  Add(Result);
end;

procedure TCst_icms_inf_cpl_classList.SetItem(Index: Integer; const Value: TCst_icms_inf_cpl_class);
begin
  Put(Index, Value);
end;

procedure TCst_icms_inf_cpl_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
