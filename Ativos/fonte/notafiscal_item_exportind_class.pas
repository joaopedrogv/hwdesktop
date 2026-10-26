unit notafiscal_item_exportind_class;

interface

uses
  Contnrs, DB;

type
  TNotafiscal_item_exportind_class = class(TObject)
  private
    Fcod_nf     : Integer;
    Fcod_empresa: Integer;
    Fnitem      : Integer;
    Fnitem_det  : Integer;
    Fnitem_exind: Integer;
    Fnre        : string;
    Fchnfe      : string;
    Fqexport    : Double;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    property cod_nf     : Integer read Fcod_nf      write Fcod_nf;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property nitem      : Integer read Fnitem       write Fnitem;
    property nitem_det  : Integer read Fnitem_det   write Fnitem_det;
    property nitem_exind: Integer read Fnitem_exind write Fnitem_exind;
    property nre        : string  read Fnre         write Fnre;
    property chnfe      : string  read Fchnfe       write Fchnfe;
    property qexport    : Double  read Fqexport     write Fqexport;
  end;

  TNotafiscal_item_exportind_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_item_exportind_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_item_exportind_class);
  public
    function New: TNotafiscal_item_exportind_class;

    property Items[Index: Integer]: TNotafiscal_item_exportind_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{TNotafiscal_item_exportind_class}

procedure TNotafiscal_item_exportind_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_nf      := ADataSet.FieldByName('COD_NF').AsInteger;
  Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fnitem       := ADataSet.FieldByName('NITEM').AsInteger;
  Fnitem_det   := ADataSet.FieldByName('NITEM_DET').AsInteger;
  Fnitem_exind := ADataSet.FieldByName('NITEM_EXIND').AsInteger;
  Fnre         := Trim(ADataSet.FieldByName('NRE').AsString);
  Fchnfe       := Trim(ADataSet.FieldByName('CHNFE').AsString);
  Fqexport     := ADataSet.FieldByName('QEXPORT').AsFloat;
end;

{TNotafiscal_item_exportind_classList}

function TNotafiscal_item_exportind_classList.GetItem(Index: Integer): TNotafiscal_item_exportind_class;
begin
  Result := TNotafiscal_item_exportind_class(inherited Items[Index]);
end;

function TNotafiscal_item_exportind_classList.New: TNotafiscal_item_exportind_class;
begin
  Result := TNotafiscal_item_exportind_class.Create;
  Add(Result);
end;

procedure TNotafiscal_item_exportind_classList.SetItem(Index: Integer; const Value: TNotafiscal_item_exportind_class);
begin
  Put(Index, Value);
end;

end.
