unit QueryResultOperations;

interface

uses
 IDataSetReaderUnit;

type
  IQueryResultOperations = interface
    ['{76045AA4-FE97-4A2E-87CA-85077589168B}']
    procedure MarkAll();
    procedure UnmarkAll();
    procedure InverterAllMarks();
    procedure ToggleCurrentMark();
    function MarkingColumnName(): string;
  end;

  TMarkOperation = (moMarkAll, moUnmarkAll, moInvertAll, moToggle);

  TQueryResultOperations = class(TInterfacedObject, IQueryResultOperations)
  private
    FReader: IDataSetReader;
    FMarkingColumn: string;
    procedure DoMarkOperation(AOperation: TMarkOperation);
  public
    constructor Create(AReader: IDataSetReader; const AMarkingColumn: string);
    procedure MarkAll();
    procedure UnmarkAll();
    procedure InverterAllMarks();
    procedure ToggleCurrentMark();
    function MarkingColumnName(): string;
  end;

implementation

uses
  Data.DB;

{ TQueryResultOperations }

constructor TQueryResultOperations.Create(AReader: IDataSetReader; const AMarkingColumn: string);
begin
  FReader := AReader;
  FMarkingColumn := AMarkingColumn;
end;

procedure TQueryResultOperations.DoMarkOperation(AOperation: TMarkOperation);
var
  fdMark: TField;
  dts: TDataSet;
  reNo: Integer;
begin
  dts := FReader.DataSet;
  fdMark := dts.FieldByName(FMarkingColumn);

  case AOperation of
    moMarkAll, moUnmarkAll, moInvertAll:
      begin
        reNo := dts.RecNo;
        try
          dts.First;
          while not dts.Eof do
          begin
            dts.Edit;
            case AOperation of
              moMarkAll   : fdMark.AsBoolean :=  True;
              moUnmarkAll: fdMark.AsBoolean :=  False;
              moInvertAll: fdMark.AsBoolean :=  not fdMark.AsBoolean;
            end;
            dts.Post;
            dts.Next();
          end;
        finally
          dts.RecNo := reNo;
        end;
      end;

    moToggle:
      begin
        dts.Edit;
        fdMark.AsBoolean := not fdMark.AsBoolean;
        dts.Post;
      end;
  end;
end;

procedure TQueryResultOperations.InverterAllMarks;
begin
  DoMarkOperation(moInvertAll);
end;

procedure TQueryResultOperations.MarkAll;
begin
  DoMarkOperation(moMarkAll);
end;

function TQueryResultOperations.MarkingColumnName: string;
begin
  Result := FMarkingColumn;
end;

procedure TQueryResultOperations.ToggleCurrentMark;
begin
  DoMarkOperation(moToggle);
end;

procedure TQueryResultOperations.UnmarkAll;
begin
  DoMarkOperation(moUnmarkAll);
end;

end.