unit notafiscal_item_detexport_class;

interface

uses
  Contnrs, DB;

type
  TNotafiscal_item_detexport_class = class(TObject)
  private
    Fcod_nf     : Integer;
    Fcod_empresa: Integer;
    Fnitem      : Integer;
    Fnitem_det  : Integer;
    Fndraw      : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    property cod_nf     : Integer read Fcod_nf      write Fcod_nf;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property nitem      : Integer read Fnitem       write Fnitem;
    property nitem_det  : Integer read Fnitem_det   write Fnitem_det;
    property ndraw      : string  read Fndraw       write Fndraw;
  end;

  TNotafiscal_item_detexport_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_item_detexport_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_item_detexport_class);
  public
    function New: TNotafiscal_item_detexport_class;

    property Items[Index: Integer]: TNotafiscal_item_detexport_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{TNotafiscal_item_detexport_class}

procedure TNotafiscal_item_detexport_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_nf      := ADataSet.FieldByName('COD_NF').AsInteger;
  Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fnitem       := ADataSet.FieldByName('NITEM').AsInteger;
  Fnitem_det   := ADataSet.FieldByName('NITEM_DET').AsInteger;
  Fndraw       := Trim(ADataSet.FieldByName('NDRAW').AsString);
end;

{TNotafiscal_item_detexport_classList}

function TNotafiscal_item_detexport_classList.GetItem(Index: Integer): TNotafiscal_item_detexport_class;
begin
  Result := TNotafiscal_item_detexport_class(inherited Items[Index]);
end;

function TNotafiscal_item_detexport_classList.New: TNotafiscal_item_detexport_class;
begin
  Result := TNotafiscal_item_detexport_class.Create;
  Add(Result);
end;

procedure TNotafiscal_item_detexport_classList.SetItem(Index: Integer; const Value: TNotafiscal_item_detexport_class);
begin
  Put(Index, Value);
end;

end.
