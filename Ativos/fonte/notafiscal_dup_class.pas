unit notafiscal_dup_class;

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
  TNotafiscal_dup_class = class(TObject)
  private
    Fcod_nf      : Integer;
    Fcod_empresa : Integer;
    Fseqid       : Integer;
    Fndup        : string;
    Fdvenc       : TDateTime;
    Fvdup        : Double;
    Fcod_controle: Integer;
    Fseqform     : Integer;
    Fn_seq_bol   : Integer;
    Fndoc        : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TNotafiscal_dup_class; virtual;

    property cod_nf      : Integer   read Fcod_nf       write Fcod_nf;
    property cod_empresa : Integer   read Fcod_empresa  write Fcod_empresa;
    property seqid       : Integer   read Fseqid        write Fseqid;
    property ndup        : string    read Fndup         write Fndup;
    property dvenc       : TDateTime read Fdvenc        write Fdvenc;
    property vdup        : Double    read Fvdup         write Fvdup;
    property cod_controle: Integer   read Fcod_controle write Fcod_controle;
    property seqform     : Integer   read Fseqform      write Fseqform;
    property n_seq_bol   : Integer   read Fn_seq_bol    write Fn_seq_bol;
    property ndoc        : string    read Fndoc         write Fndoc;
  end;

  TNotafiscal_dup_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_dup_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_dup_class);
  public
    function New: TNotafiscal_dup_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_dup_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TNotafiscal_dup_class }

function TNotafiscal_dup_class.Clone: TNotafiscal_dup_class;
begin
  Result              := TNotafiscal_dup_class.Create;
  Result.cod_nf       := Self.cod_nf;
  Result.cod_empresa  := Self.cod_empresa;
  Result.seqid        := Self.seqid;
  Result.ndup         := Self.ndup;
  Result.dvenc        := Self.dvenc;
  Result.vdup         := Self.vdup;
  Result.cod_controle := Self.cod_controle;
  Result.seqform      := Self.seqform;
  Result.n_seq_bol    := Self.n_seq_bol;
  Result.ndoc         := Self.ndoc;
end;

class function TNotafiscal_dup_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @seqid, @ndup, @dvenc, @vdup, @cod_controle, @seqform, @n_seq_bol, @ndoc';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_dup_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nf       := ADataSet.FieldByName('COD_NF').AsInteger;
    Fcod_empresa  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fseqid        := ADataSet.FieldByName('SEQID').AsInteger;
    Fndup         := Trim(ADataSet.FieldByName('NDUP').AsString);
    Fdvenc        := ADataSet.FieldByName('DVENC').AsDateTime;
    Fvdup         := ADataSet.FieldByName('VDUP').AsFloat;
    Fcod_controle := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    Fseqform      := ADataSet.FieldByName('SEQFORM').AsInteger;
    Fn_seq_bol    := ADataSet.FieldByName('N_SEQ_BOL').AsInteger;
    Fndoc         := Trim(ADataSet.FieldByName('NDOC').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NF'      )) then Fcod_nf       := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA' )) then Fcod_empresa  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('SEQID'       )) then Fseqid        := ADataSet.FieldByName('SEQID').AsInteger;
    if Assigned(ADataSet.FindField('NDUP'        )) then Fndup         := Trim(ADataSet.FieldByName('NDUP').AsString);
    if Assigned(ADataSet.FindField('DVENC'       )) then Fdvenc        := ADataSet.FieldByName('DVENC').AsDateTime;
    if Assigned(ADataSet.FindField('VDUP'        )) then Fvdup         := ADataSet.FieldByName('VDUP').AsFloat;
    if Assigned(ADataSet.FindField('COD_CONTROLE')) then Fcod_controle := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    if Assigned(ADataSet.FindField('SEQFORM'     )) then Fseqform      := ADataSet.FieldByName('SEQFORM').AsInteger;
    if Assigned(ADataSet.FindField('N_SEQ_BOL'   )) then Fn_seq_bol    := ADataSet.FieldByName('N_SEQ_BOL').AsInteger;
    if Assigned(ADataSet.FindField('NDOC'        )) then Fndoc         := Trim(ADataSet.FieldByName('NDOC').AsString);
  end;
end;

function TNotafiscal_dup_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_NF').AsInteger       := Fcod_nf;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger  := Fcod_empresa;
    ADataSet.ParamByName('SEQID').AsInteger        := Fseqid;
    ADataSet.ParamByName('NDUP').AsString          := Copy(Fndup, 1, 60);
    ADataSet.ParamByName('DVENC').AsDateTime       := Fdvenc;
    ADataSet.ParamByName('VDUP').AsFloat           := Fvdup;
    ADataSet.ParamByName('COD_CONTROLE').AsInteger := Fcod_controle;
    ADataSet.ParamByName('SEQFORM').AsInteger      := Fseqform;
    ADataSet.ParamByName('N_SEQ_BOL').AsInteger    := Fn_seq_bol;
    ADataSet.ParamByName('NDOC').AsString          := Copy(Fndoc, 1, 10);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_NF'      )) then   ADataSet.ParamByName('COD_NF').AsInteger       := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA' )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger  := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('SEQID'       )) then   ADataSet.ParamByName('SEQID').AsInteger        := Fseqid;
    if Assigned(ADataSet.Params.FindParam('NDUP'        )) then   ADataSet.ParamByName('NDUP').AsString          := Copy(Fndup, 1, 60);
    if Assigned(ADataSet.Params.FindParam('DVENC'       )) then   ADataSet.ParamByName('DVENC').AsDateTime       := Fdvenc;
    if Assigned(ADataSet.Params.FindParam('VDUP'        )) then   ADataSet.ParamByName('VDUP').AsFloat           := Fvdup;
    if Assigned(ADataSet.Params.FindParam('COD_CONTROLE')) then   ADataSet.ParamByName('COD_CONTROLE').AsInteger := Fcod_controle;
    if Assigned(ADataSet.Params.FindParam('SEQFORM'     )) then   ADataSet.ParamByName('SEQFORM').AsInteger      := Fseqform;
    if Assigned(ADataSet.Params.FindParam('N_SEQ_BOL'   )) then   ADataSet.ParamByName('N_SEQ_BOL').AsInteger    := Fn_seq_bol;
    if Assigned(ADataSet.Params.FindParam('NDOC'        )) then   ADataSet.ParamByName('NDOC').AsString          := Copy(Fndoc, 1, 10);
  end;
end;

{ TNotafiscal_dup_classList }

function TNotafiscal_dup_classList.GetItem(Index: Integer): TNotafiscal_dup_class;
begin
  Result := TNotafiscal_dup_class(inherited Items[Index]);
end;

function TNotafiscal_dup_classList.New: TNotafiscal_dup_class;
begin
  Result := TNotafiscal_dup_class.Create;
  Add(Result);
end;

procedure TNotafiscal_dup_classList.SetItem(Index: Integer; const Value: TNotafiscal_dup_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_dup_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
