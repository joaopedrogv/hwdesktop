unit clientes_trib_ad_class;

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
  TClientes_trib_ad_class = class(TObject)
  private
    Fcod_cliente      : Integer;
    Fcod_empresa      : Integer;
    Fend_doc_add_seqid: Integer;
    Fcod_trib_pf      : Integer;
    Fdatahora         : TDateTime;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TClientes_trib_ad_class; virtual;

    property cod_cliente      : Integer   read Fcod_cliente       write Fcod_cliente;
    property cod_empresa      : Integer   read Fcod_empresa       write Fcod_empresa;
    property end_doc_add_seqid: Integer   read Fend_doc_add_seqid write Fend_doc_add_seqid;
    property cod_trib_pf      : Integer   read Fcod_trib_pf       write Fcod_trib_pf;
    property datahora         : TDateTime read Fdatahora          write Fdatahora;
  end;

  TClientes_trib_ad_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TClientes_trib_ad_class;
    procedure SetItem(Index: Integer; const Value: TClientes_trib_ad_class);
  public
    function New: TClientes_trib_ad_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TClientes_trib_ad_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TClientes_trib_ad_class }

function TClientes_trib_ad_class.Clone: TClientes_trib_ad_class;
begin
  Result                   := TClientes_trib_ad_class.Create;
  Result.cod_cliente       := Self.cod_cliente;
  Result.cod_empresa       := Self.cod_empresa;
  Result.end_doc_add_seqid := Self.end_doc_add_seqid;
  Result.cod_trib_pf       := Self.cod_trib_pf;
  Result.datahora          := Self.datahora;
end;

class function TClientes_trib_ad_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_cliente, @cod_empresa, @end_doc_add_seqid, @cod_trib_pf, @datahora';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TClientes_trib_ad_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_cliente       := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    Fcod_empresa       := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fend_doc_add_seqid := ADataSet.FieldByName('END_DOC_ADD_SEQID').AsInteger;
    Fcod_trib_pf       := ADataSet.FieldByName('COD_TRIB_PF').AsInteger;
    Fdatahora          := ADataSet.FieldByName('DATAHORA').AsDateTime;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_CLIENTE'      )) then Fcod_cliente       := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'      )) then Fcod_empresa       := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('END_DOC_ADD_SEQID')) then Fend_doc_add_seqid := ADataSet.FieldByName('END_DOC_ADD_SEQID').AsInteger;
    if Assigned(ADataSet.FindField('COD_TRIB_PF'      )) then Fcod_trib_pf       := ADataSet.FieldByName('COD_TRIB_PF').AsInteger;
    if Assigned(ADataSet.FindField('DATAHORA'         )) then Fdatahora          := ADataSet.FieldByName('DATAHORA').AsDateTime;
  end;
end;

{ TClientes_trib_ad_classList }

function TClientes_trib_ad_classList.GetItem(Index: Integer): TClientes_trib_ad_class;
begin
  Result := TClientes_trib_ad_class(inherited Items[Index]);
end;

function TClientes_trib_ad_classList.New: TClientes_trib_ad_class;
begin
  Result := TClientes_trib_ad_class.Create;
  Add(Result);
end;

procedure TClientes_trib_ad_classList.SetItem(Index: Integer; const Value: TClientes_trib_ad_class);
begin
  Put(Index, Value);
end;

procedure TClientes_trib_ad_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
