unit notafiscal_sped_c113_class;

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
  TNotafiscal_sped_c113_class = class(TObject)
  private
    Fcod_nf       : Integer;
    Fcod_empresa  : Integer;
    Fcod_inf      : Integer;
    Fcod_nf_ref   : Integer;
    Fchave_nfe_ref: string;
    Fnnf          : Integer;
    Fmodelo       : Integer;
    Fserie        : Integer;
    Fcuf          : Integer;
    Faamm         : string;
    Fcnpj         : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property cod_nf       : Integer read Fcod_nf        write Fcod_nf;
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property cod_inf      : Integer read Fcod_inf       write Fcod_inf;
    property cod_nf_ref   : Integer read Fcod_nf_ref    write Fcod_nf_ref;
    property chave_nfe_ref: string  read Fchave_nfe_ref write Fchave_nfe_ref;
    property nnf          : Integer read Fnnf           write Fnnf;
    property modelo       : Integer read Fmodelo        write Fmodelo;
    property serie        : Integer read Fserie         write Fserie;
    property cuf          : Integer read Fcuf           write Fcuf;
    property aamm         : string  read Faamm          write Faamm;
    property cnpj         : string  read Fcnpj          write Fcnpj;
  end;

  TNotafiscal_sped_c113_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_sped_c113_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_sped_c113_class);
  public
    function New: TNotafiscal_sped_c113_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_sped_c113_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TNotafiscal_sped_c113_class }

class function TNotafiscal_sped_c113_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @cod_inf, @cod_nf_ref, @chave_nfe_ref, @nnf, @modelo, @serie, @cuf, @aamm, @cnpj';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_sped_c113_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nf        := ADataSet.FieldByName('COD_NF').AsInteger;
    Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcod_inf       := ADataSet.FieldByName('COD_INF').AsInteger;
    Fcod_nf_ref    := ADataSet.FieldByName('COD_NF_REF').AsInteger;
    Fchave_nfe_ref := Trim(ADataSet.FieldByName('CHAVE_NFE_REF').AsString);
    Fnnf           := ADataSet.FieldByName('NNF').AsInteger;
    Fmodelo        := ADataSet.FieldByName('MODELO').AsInteger;
    Fserie         := ADataSet.FieldByName('SERIE').AsInteger;
    Fcuf           := ADataSet.FieldByName('CUF').AsInteger;
    Faamm          := Trim(ADataSet.FieldByName('AAMM').AsString);
    Fcnpj          := Trim(ADataSet.FieldByName('CNPJ').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NF'       )) then Fcod_nf        := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'  )) then Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_INF'      )) then Fcod_inf       := ADataSet.FieldByName('COD_INF').AsInteger;
    if Assigned(ADataSet.FindField('COD_NF_REF'   )) then Fcod_nf_ref    := ADataSet.FieldByName('COD_NF_REF').AsInteger;
    if Assigned(ADataSet.FindField('CHAVE_NFE_REF')) then Fchave_nfe_ref := Trim(ADataSet.FieldByName('CHAVE_NFE_REF').AsString);
    if Assigned(ADataSet.FindField('NNF'          )) then Fnnf           := ADataSet.FieldByName('NNF').AsInteger;
    if Assigned(ADataSet.FindField('MODELO'       )) then Fmodelo        := ADataSet.FieldByName('MODELO').AsInteger;
    if Assigned(ADataSet.FindField('SERIE'        )) then Fserie         := ADataSet.FieldByName('SERIE').AsInteger;
    if Assigned(ADataSet.FindField('CUF'          )) then Fcuf           := ADataSet.FieldByName('CUF').AsInteger;
    if Assigned(ADataSet.FindField('AAMM'         )) then Faamm          := Trim(ADataSet.FieldByName('AAMM').AsString);
    if Assigned(ADataSet.FindField('CNPJ'         )) then Fcnpj          := Trim(ADataSet.FieldByName('CNPJ').AsString);
  end;
end;

function TNotafiscal_sped_c113_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_NF').AsInteger       := Fcod_nf;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger  := Fcod_empresa;
    ADataSet.ParamByName('COD_INF').AsInteger      := Fcod_inf;
    ADataSet.ParamByName('COD_NF_REF').AsInteger   := Fcod_nf_ref;
    ADataSet.ParamByName('CHAVE_NFE_REF').AsString := Copy(Fchave_nfe_ref, 1, 44);
    ADataSet.ParamByName('NNF').AsInteger          := Fnnf;
    ADataSet.ParamByName('MODELO').AsInteger       := Fmodelo;
    ADataSet.ParamByName('SERIE').AsInteger        := Fserie;
    ADataSet.ParamByName('CUF').AsInteger          := Fcuf;
    ADataSet.ParamByName('AAMM').AsString          := Copy(Faamm         , 1, 4);
    ADataSet.ParamByName('CNPJ').AsString          := Copy(Fcnpj         , 1, 14);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_NF'       )) then   ADataSet.ParamByName('COD_NF').AsInteger       := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'  )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger  := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('COD_INF'      )) then   ADataSet.ParamByName('COD_INF').AsInteger      := Fcod_inf;
    if Assigned(ADataSet.Params.FindParam('COD_NF_REF'   )) then   ADataSet.ParamByName('COD_NF_REF').AsInteger   := Fcod_nf_ref;
    if Assigned(ADataSet.Params.FindParam('CHAVE_NFE_REF')) then   ADataSet.ParamByName('CHAVE_NFE_REF').AsString := Copy(Fchave_nfe_ref, 1, 44);
    if Assigned(ADataSet.Params.FindParam('NNF'          )) then   ADataSet.ParamByName('NNF').AsInteger          := Fnnf;
    if Assigned(ADataSet.Params.FindParam('MODELO'       )) then   ADataSet.ParamByName('MODELO').AsInteger       := Fmodelo;
    if Assigned(ADataSet.Params.FindParam('SERIE'        )) then   ADataSet.ParamByName('SERIE').AsInteger        := Fserie;
    if Assigned(ADataSet.Params.FindParam('CUF'          )) then   ADataSet.ParamByName('CUF').AsInteger          := Fcuf;
    if Assigned(ADataSet.Params.FindParam('AAMM'         )) then   ADataSet.ParamByName('AAMM').AsString          := Copy(Faamm         , 1, 4);
    if Assigned(ADataSet.Params.FindParam('CNPJ'         )) then   ADataSet.ParamByName('CNPJ').AsString          := Copy(Fcnpj         , 1, 14);
  end;
end;

{ TNotafiscal_sped_c113_classList }

function TNotafiscal_sped_c113_classList.GetItem(Index: Integer): TNotafiscal_sped_c113_class;
begin
  Result := TNotafiscal_sped_c113_class(inherited Items[Index]);
end;

function TNotafiscal_sped_c113_classList.New: TNotafiscal_sped_c113_class;
begin
  Result := TNotafiscal_sped_c113_class.Create;
  Add(Result);
end;

procedure TNotafiscal_sped_c113_classList.SetItem(Index: Integer; const Value: TNotafiscal_sped_c113_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_sped_c113_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
