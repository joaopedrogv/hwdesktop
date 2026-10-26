unit nbm_estado_class;

interface

uses
  Contnrs,
  DB;

type
  TNbm_estado_class = class(TObject)
  private
    Fcod_nbm  : string;
    Fcodigo_uf: Integer;
    Faliq     : Double;
    Fmva      : Double;
    Fcst      : string;
    Fpfcp     : Double;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property cod_nbm  : string  read Fcod_nbm   write Fcod_nbm;
    property codigo_uf: Integer read Fcodigo_uf write Fcodigo_uf;
    property aliq     : Double  read Faliq      write Faliq;
    property mva      : Double  read Fmva       write Fmva;
    property cst      : string  read Fcst       write Fcst;
    property pfcp     : Double  read Fpfcp      write Fpfcp;
  end;

  TNbm_estado_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNbm_estado_class;
    procedure SetItem(Index: Integer; const Value: TNbm_estado_class);
  public
    function New: TNbm_estado_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNbm_estado_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TNbm_estado_class }

class function TNbm_estado_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nbm, @codigo_uf, @aliq, @mva, @cst, @pfcp';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNbm_estado_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nbm   := Trim(ADataSet.FieldByName('COD_NBM').AsString);
    Fcodigo_uf := ADataSet.FieldByName('CODIGO_UF').AsInteger;
    Faliq      := ADataSet.FieldByName('ALIQ').AsFloat;
    Fmva       := ADataSet.FieldByName('MVA').AsFloat;
    Fcst       := Trim(ADataSet.FieldByName('CST').AsString);
    Fpfcp      := ADataSet.FieldByName('PFCP').AsFloat;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NBM'  )) then Fcod_nbm   := Trim(ADataSet.FieldByName('COD_NBM').AsString);
    if Assigned(ADataSet.FindField('CODIGO_UF')) then Fcodigo_uf := ADataSet.FieldByName('CODIGO_UF').AsInteger;
    if Assigned(ADataSet.FindField('ALIQ'     )) then Faliq      := ADataSet.FieldByName('ALIQ').AsFloat;
    if Assigned(ADataSet.FindField('MVA'      )) then Fmva       := ADataSet.FieldByName('MVA').AsFloat;
    if Assigned(ADataSet.FindField('CST'      )) then Fcst       := Trim(ADataSet.FieldByName('CST').AsString);
    if Assigned(ADataSet.FindField('PFCP'     )) then Fpfcp      := ADataSet.FieldByName('PFCP').AsFloat;
  end;
end;

{ TNbm_estado_classList }

function TNbm_estado_classList.GetItem(Index: Integer): TNbm_estado_class;
begin
  Result := TNbm_estado_class(inherited Items[Index]);
end;

function TNbm_estado_classList.New: TNbm_estado_class;
begin
  Result := TNbm_estado_class.Create;
  Add(Result);
end;

procedure TNbm_estado_classList.SetItem(Index: Integer; const Value: TNbm_estado_class);
begin
  Put(Index, Value);
end;
procedure TNbm_estado_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
