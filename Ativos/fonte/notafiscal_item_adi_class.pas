unit notafiscal_item_adi_class;

interface

uses
  Contnrs, DB;

type
  TNotafiscal_item_adi_class = class(TObject)
  private
    Fcod_nf     : Integer;
    Fcod_empresa: Integer;
    Fnitem      : Integer;
    Fnitem_di   : Integer;
    Fnitem_adi  : Integer;
    Fnadicao    : Integer;
    Fnseqadic   : Integer;
    Fcfabricante: string;
    Fvdescdi    : Double;
    Fndraw      : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    property cod_nf     : Integer read Fcod_nf      write Fcod_nf;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property nitem      : Integer read Fnitem       write Fnitem;
    property nitem_di   : Integer read Fnitem_di    write Fnitem_di;
    property nitem_adi  : Integer read Fnitem_adi   write Fnitem_adi;
    property nadicao    : Integer read Fnadicao     write Fnadicao;
    property nseqadic   : Integer read Fnseqadic    write Fnseqadic;
    property cfabricante: string  read Fcfabricante write Fcfabricante;
    property vdescdi    : Double  read Fvdescdi     write Fvdescdi;
    property ndraw      : string  read Fndraw       write Fndraw;
  end;

  TNotafiscal_item_adi_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_item_adi_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_item_adi_class);
  public
    function New: TNotafiscal_item_adi_class;

    property Items[Index: Integer]: TNotafiscal_item_adi_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{TNotafiscal_item_adi_class}

procedure TNotafiscal_item_adi_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_nf      := ADataSet.FieldByName('COD_NF').AsInteger;
  Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fnitem       := ADataSet.FieldByName('NITEM').AsInteger;
  Fnitem_di    := ADataSet.FieldByName('NITEM_DI').AsInteger;
  Fnitem_adi   := ADataSet.FieldByName('NITEM_ADI').AsInteger;
  Fnadicao     := ADataSet.FieldByName('NADICAO').AsInteger;
  Fnseqadic    := ADataSet.FieldByName('NSEQADIC').AsInteger;
  Fcfabricante := Trim(ADataSet.FieldByName('CFABRICANTE').AsString);
  Fvdescdi     := ADataSet.FieldByName('VDESCDI').AsFloat;
  Fndraw       := Trim(ADataSet.FieldByName('NDRAW').AsString);
end;

{TNotafiscal_item_adi_classList}

function TNotafiscal_item_adi_classList.GetItem(Index: Integer): TNotafiscal_item_adi_class;
begin
  Result := TNotafiscal_item_adi_class(inherited Items[Index]);
end;

function TNotafiscal_item_adi_classList.New: TNotafiscal_item_adi_class;
begin
  Result := TNotafiscal_item_adi_class.Create;
  Add(Result);
end;

procedure TNotafiscal_item_adi_classList.SetItem(Index: Integer; const Value: TNotafiscal_item_adi_class);
begin
  Put(Index, Value);
end;

end.
