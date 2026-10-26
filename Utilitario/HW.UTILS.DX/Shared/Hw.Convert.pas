unit Hw.Convert;

interface

uses
  HW.Utils.Classes.Rtti,
  Data.DB;

type
  Converter = class
  public
    class function NewObj<T: class, constructor>(ADataSet: TDataSet): T;
    class function NewArrayObj<T: class, constructor>(ADataSet: TDataSet): TArray<T>;
    class procedure Copy(sourceObject: TObject; detinationDataSet: TDataSet);
    class procedure CopyAll<T: class>(sourceArray: TArray<T>; detinationDataSet: TDataSet);
  end;

  ConverterAll = class(RttiHwUtils);
  DBField = class(HWDBField);

implementation

uses
  System.Math;

{ Converter }

class procedure Converter.Copy(sourceObject: TObject;
  detinationDataSet: TDataSet);
begin
  var builder := THwRttiConverter.Create;
  try

    builder.ObjectPostInDataSetRow(sourceObject, detinationDataSet,
      THwRttiEnumActionDataSet(IfThen(not detinationDataSet.IsEmpty, Ord(hwrtacUpdate), Ord(hwrtacInsert))));
  finally
    builder.Free;
  end;
end;

class procedure Converter.CopyAll<T>(sourceArray: TArray<T>;
  detinationDataSet: TDataSet);
begin
  var builder := THwRttiConverter.Create;
  try
    for var I := Low(sourceArray) to High(sourceArray) do
      builder.ObjectPostInDataSetRow(sourceArray[I], detinationDataSet, hwrtacInsert);
  finally
    builder.Free;
  end;
end;

class function Converter.NewArrayObj<T>(ADataSet: TDataSet): TArray<T>;
var
  builder: THwRttiConverter;
  arrayValue: TArray<T>;
  recNo: Integer;
begin
  builder := THwRttiConverter.Create;
  if ADataSet.IsEmpty then
    Exit;
  try
    ADataSet.DisableControls;
    recNo := ADataSet.RecNo;
    ADataSet.Last;

    SetLength(arrayValue, ADataSet.RecordCount);
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      arrayValue[ADataSet.RecNo - 1] := builder.DataSetRowToObject(T, ADataSet) as T;

      ADataSet.Next;
    end;

    Result := arrayValue;

  finally
    ADataSet.RecNo := recNo;
    ADataSet.EnableControls;
    builder.Free;
  end;
end;

class function Converter.NewObj<T>(ADataSet: TDataSet): T;
var
  builder: THwRttiConverter;
begin
  builder := THwRttiConverter.Create;
  try
    Result := builder.DataSetRowToObject(T, ADataSet) as T;
  finally
    builder.Free;
  end;
end;

end.
