unit estoque_ajuste_class;

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
  TEstoque_ajuste_class = class(TObject)
  private
    Fid_ajuste    : Integer;
    Fcod_empresa  : Integer;
    Fdata_confirm : TDateTime;
    Fdata_apuracao: TDateTime;
    Fstatus       : string;
    Fativo        : Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    property id_ajuste    : Integer   read Fid_ajuste     write Fid_ajuste;
    property cod_empresa  : Integer   read Fcod_empresa   write Fcod_empresa;
    property data_confirm : TDateTime read Fdata_confirm  write Fdata_confirm;
    property data_apuracao: TDateTime read Fdata_apuracao write Fdata_apuracao;
    property status       : string    read Fstatus        write Fstatus;
    property ativo        : Integer   read Fativo         write Fativo;
  end;

  TEstoque_ajuste_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TEstoque_ajuste_class;
    procedure SetItem(Index: Integer; const Value: TEstoque_ajuste_class);
  public
    function New: TEstoque_ajuste_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TEstoque_ajuste_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TEstoque_ajuste_class }

constructor TEstoque_ajuste_class.Create;
begin
  Fativo := 1;
end;

destructor TEstoque_ajuste_class.Destroy;
begin
  inherited;
end;

class function TEstoque_ajuste_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@id_ajuste, @cod_empresa, @data_confirm, @data_apuracao, @status, @ativo';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TEstoque_ajuste_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fid_ajuste     := ADataSet.FieldByName('ID_AJUSTE').AsInteger;
    Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fdata_confirm  := ADataSet.FieldByName('DATA_CONFIRM').AsDateTime;
    Fdata_apuracao := ADataSet.FieldByName('DATA_APURACAO').AsDateTime;
    Fstatus        := Trim(ADataSet.FieldByName('STATUS').AsString);
    Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('ID_AJUSTE'    )) then Fid_ajuste     := ADataSet.FieldByName('ID_AJUSTE').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'  )) then Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('DATA_CONFIRM' )) then Fdata_confirm  := ADataSet.FieldByName('DATA_CONFIRM').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_APURACAO')) then Fdata_apuracao := ADataSet.FieldByName('DATA_APURACAO').AsDateTime;
    if Assigned(ADataSet.FindField('STATUS'       )) then Fstatus        := Trim(ADataSet.FieldByName('STATUS').AsString);
    if Assigned(ADataSet.FindField('ATIVO'        )) then Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
  end;
end;

function TEstoque_ajuste_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('ID_AJUSTE').AsInteger      := Fid_ajuste;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger    := Fcod_empresa;
    ADataSet.ParamByName('DATA_CONFIRM').AsDateTime  := Fdata_confirm;
    ADataSet.ParamByName('DATA_APURACAO').AsDateTime := Fdata_apuracao;
    ADataSet.ParamByName('STATUS').AsString          := Copy(Fstatus, 1, 16);
    ADataSet.ParamByName('ATIVO').AsInteger          := Fativo;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('ID_AJUSTE'    )) then   ADataSet.ParamByName('ID_AJUSTE').AsInteger      := Fid_ajuste;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'  )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger    := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('DATA_CONFIRM' )) then   ADataSet.ParamByName('DATA_CONFIRM').AsDateTime  := Fdata_confirm;
    if Assigned(ADataSet.Params.FindParam('DATA_APURACAO')) then   ADataSet.ParamByName('DATA_APURACAO').AsDateTime := Fdata_apuracao;
    if Assigned(ADataSet.Params.FindParam('STATUS'       )) then   ADataSet.ParamByName('STATUS').AsString          := Copy(Fstatus, 1, 16);
    if Assigned(ADataSet.Params.FindParam('ATIVO'        )) then   ADataSet.ParamByName('ATIVO').AsInteger          := Fativo;
  end;
end;

{ TEstoque_ajuste_classList }

function TEstoque_ajuste_classList.GetItem(Index: Integer): TEstoque_ajuste_class;
begin
  Result := TEstoque_ajuste_class(inherited Items[Index]);
end;

function TEstoque_ajuste_classList.New: TEstoque_ajuste_class;
begin
  Result := TEstoque_ajuste_class.Create;
  Add(Result);
end;

procedure TEstoque_ajuste_classList.SetItem(Index: Integer; const Value: TEstoque_ajuste_class);
begin
  Put(Index, Value);
end;

procedure TEstoque_ajuste_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
