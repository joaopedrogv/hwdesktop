unit produtos_tmp_class;

interface

uses
{$IFNDEF VER180}
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ELSE}
  Contnrs,
  DB,
  IBQuery;
{$ENDIF}

type
  TProdutos_tmp_class = class(TObject)
  private
    Fid_tmp     : string;
    Fseqid      : Integer;
    Fcod_empresa: Integer;
    Fgrupo_prod : Integer;
    Fcod_prod   : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TProdutos_tmp_class; virtual;

    property id_tmp     : string  read Fid_tmp      write Fid_tmp;
    property seqid      : Integer read Fseqid       write Fseqid;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property grupo_prod : Integer read Fgrupo_prod  write Fgrupo_prod;
    property cod_prod   : string  read Fcod_prod    write Fcod_prod;
  end;

  TProdutos_tmp_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TProdutos_tmp_class;
    procedure SetItem(Index: Integer; const Value: TProdutos_tmp_class);
  public
    function New: TProdutos_tmp_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TProdutos_tmp_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TProdutos_tmp_class }

function TProdutos_tmp_class.Clone: TProdutos_tmp_class;
begin
  Result             := TProdutos_tmp_class.Create;
  Result.id_tmp      := Self.id_tmp;
  Result.seqid       := Self.seqid;
  Result.cod_empresa := Self.cod_empresa;
  Result.grupo_prod  := Self.grupo_prod;
  Result.cod_prod    := Self.cod_prod;
end;

class function TProdutos_tmp_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@id_tmp, @seqid, @cod_empresa, @grupo_prod, @cod_prod';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TProdutos_tmp_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fid_tmp      := Trim(ADataSet.FieldByName('ID_TMP').AsString);
    Fseqid       := ADataSet.FieldByName('SEQID').AsInteger;
    Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fgrupo_prod  := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    Fcod_prod    := Trim(ADataSet.FieldByName('COD_PROD').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('ID_TMP'     )) then Fid_tmp      := Trim(ADataSet.FieldByName('ID_TMP').AsString);
    if Assigned(ADataSet.FindField('SEQID'      )) then Fseqid       := ADataSet.FieldByName('SEQID').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('GRUPO_PROD' )) then Fgrupo_prod  := ADataSet.FieldByName('GRUPO_PROD').AsInteger;
    if Assigned(ADataSet.FindField('COD_PROD'   )) then Fcod_prod    := Trim(ADataSet.FieldByName('COD_PROD').AsString);
  end;
end;

function TProdutos_tmp_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('ID_TMP').AsString       := Copy(Fid_tmp  , 1, 60);
    ADataSet.ParamByName('SEQID').AsInteger       := Fseqid;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('GRUPO_PROD').AsInteger  := Fgrupo_prod;
    ADataSet.ParamByName('COD_PROD').AsString     := Copy(Fcod_prod, 1, 6);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('ID_TMP'     )) then   ADataSet.ParamByName('ID_TMP').AsString       := Copy(Fid_tmp  , 1, 60);
    if Assigned(ADataSet.Params.FindParam('SEQID'      )) then   ADataSet.ParamByName('SEQID').AsInteger       := Fseqid;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA')) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('GRUPO_PROD' )) then   ADataSet.ParamByName('GRUPO_PROD').AsInteger  := Fgrupo_prod;
    if Assigned(ADataSet.Params.FindParam('COD_PROD'   )) then   ADataSet.ParamByName('COD_PROD').AsString     := Copy(Fcod_prod, 1, 6);
  end;
end;

{ TProdutos_tmp_classList }

function TProdutos_tmp_classList.GetItem(Index: Integer): TProdutos_tmp_class;
begin
  Result := TProdutos_tmp_class(inherited Items[Index]);
end;

function TProdutos_tmp_classList.New: TProdutos_tmp_class;
begin
  Result := TProdutos_tmp_class.Create;
  Add(Result);
end;

procedure TProdutos_tmp_classList.SetItem(Index: Integer; const Value: TProdutos_tmp_class);
begin
  Put(Index, Value);
end;

procedure TProdutos_tmp_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
