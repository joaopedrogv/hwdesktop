unit hw_desoneracao_class;

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
  THw_desoneracao_class = class(TObject)
  private
    Fncm            : string;
    Find_desoneracao: Integer;
    Fcsts           : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property ncm            : string  read Fncm             write Fncm;
    property ind_desoneracao: Integer read Find_desoneracao write Find_desoneracao;
    property csts           : string  read Fcsts            write Fcsts;
  end;

  THw_desoneracao_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): THw_desoneracao_class;
    procedure SetItem(Index: Integer; const Value: THw_desoneracao_class);
  public
    function New: THw_desoneracao_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: THw_desoneracao_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ THw_desoneracao_class }

procedure THw_desoneracao_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fncm             := Trim(ADataSet.FieldByName('NCM').AsString);
    Find_desoneracao := ADataSet.FieldByName('IND_DESONERACAO').AsInteger;
    Fcsts            := Trim(ADataSet.FieldByName('CSTS').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('NCM'            )) then Fncm             := Trim(ADataSet.FieldByName('NCM').AsString);
    if Assigned(ADataSet.FindField('IND_DESONERACAO')) then Find_desoneracao := ADataSet.FieldByName('IND_DESONERACAO').AsInteger;
    if Assigned(ADataSet.FindField('CSTS'           )) then Fcsts            := Trim(ADataSet.FieldByName('CSTS').AsString);
  end;
end;

{ THw_desoneracao_classList }

function THw_desoneracao_classList.GetItem(Index: Integer): THw_desoneracao_class;
begin
  Result := THw_desoneracao_class(inherited Items[Index]);
end;

function THw_desoneracao_classList.New: THw_desoneracao_class;
begin
  Result := THw_desoneracao_class.Create;
  Add(Result);
end;

procedure THw_desoneracao_classList.SetItem(Index: Integer; const Value: THw_desoneracao_class);
begin
  Put(Index, Value);
end;

procedure THw_desoneracao_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
