unit notafiscal_sped_c114_class;

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
  TNotafiscal_sped_c114_class = class(TObject)
  private
    Fcod_nf     : Integer;
    Fcod_empresa: Integer;
    Fcod_inf    : Integer;
    Fecf_fab    : string;
    Fnum_doc    : Integer;
    Fdt_doc     : TDateTime;
    Fecf_cx     : Integer;
    Fcod_mod    : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property cod_nf     : Integer   read Fcod_nf      write Fcod_nf;
    property cod_empresa: Integer   read Fcod_empresa write Fcod_empresa;
    property cod_inf    : Integer   read Fcod_inf     write Fcod_inf;
    property ecf_fab    : string    read Fecf_fab     write Fecf_fab;
    property num_doc    : Integer   read Fnum_doc     write Fnum_doc;
    property dt_doc     : TDateTime read Fdt_doc      write Fdt_doc;
    property ecf_cx     : Integer   read Fecf_cx      write Fecf_cx;
    property cod_mod    : string    read Fcod_mod     write Fcod_mod;
  end;

  TNotafiscal_sped_c114_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_sped_c114_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_sped_c114_class);
  public
    function New: TNotafiscal_sped_c114_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_sped_c114_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TNotafiscal_sped_c114_class }

class function TNotafiscal_sped_c114_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @cod_inf, @ecf_fab, @num_doc, @dt_doc, @ecf_cx, @cod_mod';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_sped_c114_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nf      := ADataSet.FieldByName('COD_NF').AsInteger;
    Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fcod_inf     := ADataSet.FieldByName('COD_INF').AsInteger;
    Fecf_fab     := Trim(ADataSet.FieldByName('ECF_FAB').AsString);
    Fnum_doc     := ADataSet.FieldByName('NUM_DOC').AsInteger;
    Fdt_doc      := ADataSet.FieldByName('DT_DOC').AsDateTime;
    Fecf_cx      := ADataSet.FieldByName('ECF_CX').AsInteger;
    Fcod_mod     := Trim(ADataSet.FieldByName('COD_MOD').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NF'     )) then Fcod_nf      := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('COD_INF'    )) then Fcod_inf     := ADataSet.FieldByName('COD_INF').AsInteger;
    if Assigned(ADataSet.FindField('ECF_FAB'    )) then Fecf_fab     := Trim(ADataSet.FieldByName('ECF_FAB').AsString);
    if Assigned(ADataSet.FindField('NUM_DOC'    )) then Fnum_doc     := ADataSet.FieldByName('NUM_DOC').AsInteger;
    if Assigned(ADataSet.FindField('DT_DOC'     )) then Fdt_doc      := ADataSet.FieldByName('DT_DOC').AsDateTime;
    if Assigned(ADataSet.FindField('ECF_CX'     )) then Fecf_cx      := ADataSet.FieldByName('ECF_CX').AsInteger;
    if Assigned(ADataSet.FindField('COD_MOD'    )) then Fcod_mod     := Trim(ADataSet.FieldByName('COD_MOD').AsString);
  end;
end;

function TNotafiscal_sped_c114_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_NF').AsInteger      := Fcod_nf;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('COD_INF').AsInteger     := Fcod_inf;
    ADataSet.ParamByName('ECF_FAB').AsString      := Copy(Fecf_fab, 1, 20);
    ADataSet.ParamByName('NUM_DOC').AsInteger     := Fnum_doc;
    ADataSet.ParamByName('DT_DOC').AsDateTime     := Fdt_doc;
    ADataSet.ParamByName('ECF_CX').AsInteger      := Fecf_cx;
    ADataSet.ParamByName('COD_MOD').AsString      := Copy(Fcod_mod, 1, 2);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_NF'     )) then   ADataSet.ParamByName('COD_NF').AsInteger      := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA')) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('COD_INF'    )) then   ADataSet.ParamByName('COD_INF').AsInteger     := Fcod_inf;
    if Assigned(ADataSet.Params.FindParam('ECF_FAB'    )) then   ADataSet.ParamByName('ECF_FAB').AsString      := Copy(Fecf_fab, 1, 20);
    if Assigned(ADataSet.Params.FindParam('NUM_DOC'    )) then   ADataSet.ParamByName('NUM_DOC').AsInteger     := Fnum_doc;
    if Assigned(ADataSet.Params.FindParam('DT_DOC'     )) then   ADataSet.ParamByName('DT_DOC').AsDateTime     := Fdt_doc;
    if Assigned(ADataSet.Params.FindParam('ECF_CX'     )) then   ADataSet.ParamByName('ECF_CX').AsInteger      := Fecf_cx;
    if Assigned(ADataSet.Params.FindParam('COD_MOD'    )) then   ADataSet.ParamByName('COD_MOD').AsString      := Copy(Fcod_mod, 1, 2);
  end;
end;

{ TNotafiscal_sped_c114_classList }

function TNotafiscal_sped_c114_classList.GetItem(Index: Integer): TNotafiscal_sped_c114_class;
begin
  Result := TNotafiscal_sped_c114_class(inherited Items[Index]);
end;

function TNotafiscal_sped_c114_classList.New: TNotafiscal_sped_c114_class;
begin
  Result := TNotafiscal_sped_c114_class.Create;
  Add(Result);
end;

procedure TNotafiscal_sped_c114_classList.SetItem(Index: Integer; const Value: TNotafiscal_sped_c114_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_sped_c114_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
