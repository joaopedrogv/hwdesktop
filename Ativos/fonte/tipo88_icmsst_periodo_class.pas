unit tipo88_icmsst_periodo_class;

interface

uses
{$IFDEF VER180}
  base_class,
  Contnrs,
  DB,
  IBQuery;
{$ELSE}
  base_class,
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ENDIF}

type
  TTipo88_icmsst_periodo_class = class(TBase_class)
  private
    Fperiodo    : string;
    Fcod_empresa: Integer;
    Ftipo_icm   : string;
    Ftipo_fcp   : string;
    Fvl_comp_icm: Double;
    Fvl_comp_fcp: Double;
    Fvl_rest_icm: Double;
    Fvl_rest_fcp: Double;
    Fcod_nf_comp: Integer;
    Fcod_nf_rest: Integer;
    procedure Setperiodo(const Value: string);
    procedure Setcod_empresa(const Value: Integer);
    procedure Settipo_icm(const Value: string);
    procedure Settipo_fcp(const Value: string);
    procedure Setvl_comp_icm(const Value: Double);
    procedure Setvl_comp_fcp(const Value: Double);
    procedure Setvl_rest_icm(const Value: Double);
    procedure Setvl_rest_fcp(const Value: Double);
    procedure Setcod_nf_comp(const Value: Integer);
    procedure Setcod_nf_rest(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TTipo88_icmsst_periodo_class; virtual;

    property periodo    : string  read Fperiodo     write Setperiodo;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property tipo_icm   : string  read Ftipo_icm    write Settipo_icm;
    property tipo_fcp   : string  read Ftipo_fcp    write Settipo_fcp;
    property vl_comp_icm: Double  read Fvl_comp_icm write Setvl_comp_icm;
    property vl_comp_fcp: Double  read Fvl_comp_fcp write Setvl_comp_fcp;
    property vl_rest_icm: Double  read Fvl_rest_icm write Setvl_rest_icm;
    property vl_rest_fcp: Double  read Fvl_rest_fcp write Setvl_rest_fcp;
    property cod_nf_comp: Integer read Fcod_nf_comp write Setcod_nf_comp;
    property cod_nf_rest: Integer read Fcod_nf_rest write Setcod_nf_rest;
  end;

  TTipo88_icmsst_periodo_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TTipo88_icmsst_periodo_class;
    procedure SetItem(Index: Integer; const Value: TTipo88_icmsst_periodo_class);
  public
    function New: TTipo88_icmsst_periodo_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TTipo88_icmsst_periodo_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TTipo88_icmsst_periodo_class }

constructor TTipo88_icmsst_periodo_class.Create;
begin
  Ftable := TTable_fb.Create('TIPO88_ICMSST_PERIODO',
                             'PERIODO, COD_EMPRESA',
                             'COD_NF_COMP, COD_NF_REST, COD_EMPRESA',
                             GetFieldsSql());
end;

destructor TTipo88_icmsst_periodo_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  inherited;
end;

function TTipo88_icmsst_periodo_class.Clone: TTipo88_icmsst_periodo_class;
begin
  Result             := TTipo88_icmsst_periodo_class.Create;
  Result.periodo     := Self.periodo;
  Result.cod_empresa := Self.cod_empresa;
  Result.tipo_icm    := Self.tipo_icm;
  Result.tipo_fcp    := Self.tipo_fcp;
  Result.vl_comp_icm := Self.vl_comp_icm;
  Result.vl_comp_fcp := Self.vl_comp_fcp;
  Result.vl_rest_icm := Self.vl_rest_icm;
  Result.vl_rest_fcp := Self.vl_rest_fcp;
  Result.cod_nf_comp := Self.cod_nf_comp;
  Result.cod_nf_rest := Self.cod_nf_rest;
  Result.recordState := Self.recordState;
end;

class function TTipo88_icmsst_periodo_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@periodo, @cod_empresa, @tipo_icm, @tipo_fcp, @vl_comp_icm, @vl_comp_fcp, @vl_rest_icm, @vl_rest_fcp,' +
            ' @cod_nf_comp, @cod_nf_rest';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TTipo88_icmsst_periodo_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    periodo     := Trim(ADataSet.FieldByName('PERIODO').AsString);
    cod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    tipo_icm    := Trim(ADataSet.FieldByName('TIPO_ICM').AsString);
    tipo_fcp    := Trim(ADataSet.FieldByName('TIPO_FCP').AsString);
    vl_comp_icm := ADataSet.FieldByName('VL_COMP_ICM').AsFloat;
    vl_comp_fcp := ADataSet.FieldByName('VL_COMP_FCP').AsFloat;
    vl_rest_icm := ADataSet.FieldByName('VL_REST_ICM').AsFloat;
    vl_rest_fcp := ADataSet.FieldByName('VL_REST_FCP').AsFloat;
    cod_nf_comp := ADataSet.FieldByName('COD_NF_COMP').AsInteger;
    cod_nf_rest := ADataSet.FieldByName('COD_NF_REST').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('PERIODO'    )) then periodo     := Trim(ADataSet.FieldByName('PERIODO').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then cod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('TIPO_ICM'   )) then tipo_icm    := Trim(ADataSet.FieldByName('TIPO_ICM').AsString);
    if Assigned(ADataSet.FindField('TIPO_FCP'   )) then tipo_fcp    := Trim(ADataSet.FieldByName('TIPO_FCP').AsString);
    if Assigned(ADataSet.FindField('VL_COMP_ICM')) then vl_comp_icm := ADataSet.FieldByName('VL_COMP_ICM').AsFloat;
    if Assigned(ADataSet.FindField('VL_COMP_FCP')) then vl_comp_fcp := ADataSet.FieldByName('VL_COMP_FCP').AsFloat;
    if Assigned(ADataSet.FindField('VL_REST_ICM')) then vl_rest_icm := ADataSet.FieldByName('VL_REST_ICM').AsFloat;
    if Assigned(ADataSet.FindField('VL_REST_FCP')) then vl_rest_fcp := ADataSet.FieldByName('VL_REST_FCP').AsFloat;
    if Assigned(ADataSet.FindField('COD_NF_COMP')) then cod_nf_comp := ADataSet.FieldByName('COD_NF_COMP').AsInteger;
    if Assigned(ADataSet.FindField('COD_NF_REST')) then cod_nf_rest := ADataSet.FieldByName('COD_NF_REST').AsInteger;
  end;
end;

function TTipo88_icmsst_periodo_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('PERIODO').AsString      := Copy(Fperiodo , 1, 6);
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('TIPO_ICM').AsString     := Copy(Ftipo_icm, 1, 16);
    ADataSet.ParamByName('TIPO_FCP').AsString     := Copy(Ftipo_fcp, 1, 16);
    ADataSet.ParamByName('VL_COMP_ICM').AsFloat   := Fvl_comp_icm;
    ADataSet.ParamByName('VL_COMP_FCP').AsFloat   := Fvl_comp_fcp;
    ADataSet.ParamByName('VL_REST_ICM').AsFloat   := Fvl_rest_icm;
    ADataSet.ParamByName('VL_REST_FCP').AsFloat   := Fvl_rest_fcp;
    ADataSet.ParamByName('COD_NF_COMP').AsInteger := Fcod_nf_comp;
    ADataSet.ParamByName('COD_NF_REST').AsInteger := Fcod_nf_rest;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('PERIODO'    )) then   ADataSet.ParamByName('PERIODO').AsString      := Copy(Fperiodo , 1, 6);
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA')) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('TIPO_ICM'   )) then   ADataSet.ParamByName('TIPO_ICM').AsString     := Copy(Ftipo_icm, 1, 16);
    if Assigned(ADataSet.Params.FindParam('TIPO_FCP'   )) then   ADataSet.ParamByName('TIPO_FCP').AsString     := Copy(Ftipo_fcp, 1, 16);
    if Assigned(ADataSet.Params.FindParam('VL_COMP_ICM')) then   ADataSet.ParamByName('VL_COMP_ICM').AsFloat   := Fvl_comp_icm;
    if Assigned(ADataSet.Params.FindParam('VL_COMP_FCP')) then   ADataSet.ParamByName('VL_COMP_FCP').AsFloat   := Fvl_comp_fcp;
    if Assigned(ADataSet.Params.FindParam('VL_REST_ICM')) then   ADataSet.ParamByName('VL_REST_ICM').AsFloat   := Fvl_rest_icm;
    if Assigned(ADataSet.Params.FindParam('VL_REST_FCP')) then   ADataSet.ParamByName('VL_REST_FCP').AsFloat   := Fvl_rest_fcp;
    if Assigned(ADataSet.Params.FindParam('COD_NF_COMP')) then   ADataSet.ParamByName('COD_NF_COMP').AsInteger := Fcod_nf_comp;
    if Assigned(ADataSet.Params.FindParam('COD_NF_REST')) then   ADataSet.ParamByName('COD_NF_REST').AsInteger := Fcod_nf_rest;
  end;
end;

procedure TTipo88_icmsst_periodo_class.Setperiodo(const Value: string);
begin
  Fperiodo := Value;
  ChangeField('PERIODO', strq(Fperiodo, 6));
end;

procedure TTipo88_icmsst_periodo_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TTipo88_icmsst_periodo_class.Settipo_icm(const Value: string);
begin
  Ftipo_icm := Value;
  ChangeField('TIPO_ICM', strq(Ftipo_icm, 16));
end;

procedure TTipo88_icmsst_periodo_class.Settipo_fcp(const Value: string);
begin
  Ftipo_fcp := Value;
  ChangeField('TIPO_FCP', strq(Ftipo_fcp, 16));
end;

procedure TTipo88_icmsst_periodo_class.Setvl_comp_icm(const Value: Double);
begin
  Fvl_comp_icm := Value;
  ChangeField_f('VL_COMP_ICM', Fvl_comp_icm);
end;

procedure TTipo88_icmsst_periodo_class.Setvl_comp_fcp(const Value: Double);
begin
  Fvl_comp_fcp := Value;
  ChangeField_f('VL_COMP_FCP', Fvl_comp_fcp);
end;

procedure TTipo88_icmsst_periodo_class.Setvl_rest_icm(const Value: Double);
begin
  Fvl_rest_icm := Value;
  ChangeField_f('VL_REST_ICM', Fvl_rest_icm);
end;

procedure TTipo88_icmsst_periodo_class.Setvl_rest_fcp(const Value: Double);
begin
  Fvl_rest_fcp := Value;
  ChangeField_f('VL_REST_FCP', Fvl_rest_fcp);
end;

procedure TTipo88_icmsst_periodo_class.Setcod_nf_comp(const Value: Integer);
begin
  Fcod_nf_comp := Value;
  ChangeField('COD_NF_COMP', Fcod_nf_comp);
end;

procedure TTipo88_icmsst_periodo_class.Setcod_nf_rest(const Value: Integer);
begin
  Fcod_nf_rest := Value;
  ChangeField('COD_NF_REST', Fcod_nf_rest);
end;

{ TTipo88_icmsst_periodo_classList }

function TTipo88_icmsst_periodo_classList.GetItem(Index: Integer): TTipo88_icmsst_periodo_class;
begin
  Result := TTipo88_icmsst_periodo_class(inherited Items[Index]);
end;

function TTipo88_icmsst_periodo_classList.New: TTipo88_icmsst_periodo_class;
begin
  Result := TTipo88_icmsst_periodo_class.Create;
  Add(Result);
end;

procedure TTipo88_icmsst_periodo_classList.SetItem(Index: Integer; const Value: TTipo88_icmsst_periodo_class);
begin
  Put(Index, Value);
end;

procedure TTipo88_icmsst_periodo_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
