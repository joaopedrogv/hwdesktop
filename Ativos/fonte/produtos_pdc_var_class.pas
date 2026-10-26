unit produtos_pdc_var_class;

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
  TProdutos_pdc_var_class = class(TObject)
  private
    Fid_ind     : Integer;
    Fcod_empresa: Integer;
    Fgrupo_prod : Integer;
    Fcod_prod   : string;
    Fcod_grade  : Integer;
    Fdescricao  : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TProdutos_pdc_var_class; virtual;

    property id_ind     : Integer read Fid_ind      write Fid_ind;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property grupo_prod : Integer read Fgrupo_prod  write Fgrupo_prod;
    property cod_prod   : string  read Fcod_prod    write Fcod_prod;
    property cod_grade  : Integer read Fcod_grade   write Fcod_grade;
    property descricao  : string  read Fdescricao   write Fdescricao;
  end;

  TProdutos_pdc_var_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TProdutos_pdc_var_class;
    procedure SetItem(Index: Integer; const Value: TProdutos_pdc_var_class);
  public
    function New: TProdutos_pdc_var_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TProdutos_pdc_var_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TProdutos_pdc_var_class }

function TProdutos_pdc_var_class.Clone: TProdutos_pdc_var_class;
begin
  Result             := TProdutos_pdc_var_class.Create;
  Result.id_ind      := Self.id_ind;
  Result.cod_empresa := Self.cod_empresa;
  Result.grupo_prod  := Self.grupo_prod;
  Result.cod_prod    := Self.cod_prod;
  Result.cod_grade   := Self.cod_grade;
  Result.descricao   := Self.descricao;
end;

class function TProdutos_pdc_var_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@id_ind, @cod_empresa, @grupo_prod, @cod_prod, @cod_grade, @descricao';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TProdutos_pdc_var_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fid_ind      := ADataSet.FieldByName('ID_IND').AsInteger;
    Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fgrupo_prod  := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod    := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    Fcod_grade   := ADataSet.FieldByName('COD_GRADE').AsInteger;
    Fdescricao   := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('ID_IND'     )) then Fid_ind      := ADataSet.FieldByName('ID_IND').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('GRUPO_PROD' )) then Fgrupo_prod  := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'   )) then Fcod_prod    := Trim(ADataSet.FieldByName('COD_PROD').AsString);
    if Assigned(ADataSet.FindField('COD_GRADE'  )) then Fcod_grade   := ADataSet.FieldByName('COD_GRADE').AsInteger;
    if Assigned(ADataSet.FindField('DESCRICAO'  )) then Fdescricao   := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
  end;
end;

function TProdutos_pdc_var_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('ID_IND').AsInteger      := Fid_ind;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('GRUPO_PROD').AsInteger  := Fgrupo_prod;
    ADataSet.ParamByName('COD_PROD').AsString     := Copy(Fcod_prod , 1, 6);
    ADataSet.ParamByName('COD_GRADE').AsInteger   := Fcod_grade;
    ADataSet.ParamByName('DESCRICAO').AsString    := Copy(Fdescricao, 1, 75);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('ID_IND'     )) then   ADataSet.ParamByName('ID_IND').AsInteger      := Fid_ind;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA')) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('GRUPO_PROD' )) then   ADataSet.ParamByName('GRUPO_PROD').AsInteger  := Fgrupo_prod;
    if Assigned(ADataSet.Params.FindParam('COD_PROD'   )) then   ADataSet.ParamByName('COD_PROD').AsString     := Copy(Fcod_prod , 1, 6);
    if Assigned(ADataSet.Params.FindParam('COD_GRADE'  )) then   ADataSet.ParamByName('COD_GRADE').AsInteger   := Fcod_grade;
    if Assigned(ADataSet.Params.FindParam('DESCRICAO'  )) then   ADataSet.ParamByName('DESCRICAO').AsString    := Copy(Fdescricao, 1, 75);
  end;
end;

{ TProdutos_pdc_var_classList }

function TProdutos_pdc_var_classList.GetItem(Index: Integer): TProdutos_pdc_var_class;
begin
  Result := TProdutos_pdc_var_class(inherited Items[Index]);
end;

function TProdutos_pdc_var_classList.New: TProdutos_pdc_var_class;
begin
  Result := TProdutos_pdc_var_class.Create;
  Add(Result);
end;

procedure TProdutos_pdc_var_classList.SetItem(Index: Integer; const Value: TProdutos_pdc_var_class);
begin
  Put(Index, Value);
end;

procedure TProdutos_pdc_var_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
