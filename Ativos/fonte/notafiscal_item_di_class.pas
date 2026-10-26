unit notafiscal_item_di_class;

interface

uses
  Contnrs, DB;

type
  TNotafiscal_item_di_class = class(TObject)
  private
    Fcod_nf      : Integer;
    Fcod_empresa : Integer;
    Fnitem       : Integer;
    Fnitem_di    : Integer;
    Fndi         : string;
    Fddi         : TDateTime;
    Fxlocdesemb  : string;
    Fufdesemb    : string;
    Fddesemb     : TDateTime;
    Fcexportador : string;
    Ftpviatransp : Integer;
    Fvafrmm      : Double;
    Ftpintermedio: Integer;
    Fcnpj        : string;
    Fufterceiro  : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    property cod_nf      : Integer   read Fcod_nf       write Fcod_nf;
    property cod_empresa : Integer   read Fcod_empresa  write Fcod_empresa;
    property nitem       : Integer   read Fnitem        write Fnitem;
    property nitem_di    : Integer   read Fnitem_di     write Fnitem_di;
    property ndi         : string    read Fndi          write Fndi;
    property ddi         : TDateTime read Fddi          write Fddi;
    property xlocdesemb  : string    read Fxlocdesemb   write Fxlocdesemb;
    property ufdesemb    : string    read Fufdesemb     write Fufdesemb;
    property ddesemb     : TDateTime read Fddesemb      write Fddesemb;
    property cexportador : string    read Fcexportador  write Fcexportador;
    property tpviatransp : Integer   read Ftpviatransp  write Ftpviatransp;
    property vafrmm      : Double    read Fvafrmm       write Fvafrmm;
    property tpintermedio: Integer   read Ftpintermedio write Ftpintermedio;
    property cnpj        : string    read Fcnpj         write Fcnpj;
    property ufterceiro  : string    read Fufterceiro   write Fufterceiro;
  end;

  TNotafiscal_item_di_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_item_di_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_item_di_class);
  public
    function New: TNotafiscal_item_di_class;

    property Items[Index: Integer]: TNotafiscal_item_di_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{TNotafiscal_item_di_class}

procedure TNotafiscal_item_di_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_nf       := ADataSet.FieldByName('COD_NF').AsInteger;
  Fcod_empresa  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fnitem        := ADataSet.FieldByName('NITEM').AsInteger;
  Fnitem_di     := ADataSet.FieldByName('NITEM_DI').AsInteger;
  Fndi          := Trim(ADataSet.FieldByName('NDI').AsString);
  Fddi          := ADataSet.FieldByName('DDI').AsDateTime;
  Fxlocdesemb   := Trim(ADataSet.FieldByName('XLOCDESEMB').AsString);
  Fufdesemb     := Trim(ADataSet.FieldByName('UFDESEMB').AsString);
  Fddesemb      := ADataSet.FieldByName('DDESEMB').AsDateTime;
  Fcexportador  := Trim(ADataSet.FieldByName('CEXPORTADOR').AsString);
  Ftpviatransp  := ADataSet.FieldByName('TPVIATRANSP').AsInteger;
  Fvafrmm       := ADataSet.FieldByName('VAFRMM').AsFloat;
  Ftpintermedio := ADataSet.FieldByName('TPINTERMEDIO').AsInteger;
  Fcnpj         := Trim(ADataSet.FieldByName('CNPJ').AsString);
  Fufterceiro   := Trim(ADataSet.FieldByName('UFTERCEIRO').AsString);
end;

{TNotafiscal_item_di_classList}

function TNotafiscal_item_di_classList.GetItem(Index: Integer): TNotafiscal_item_di_class;
begin
  Result := TNotafiscal_item_di_class(inherited Items[Index]);
end;

function TNotafiscal_item_di_classList.New: TNotafiscal_item_di_class;
begin
  Result := TNotafiscal_item_di_class.Create;
  Add(Result);
end;

procedure TNotafiscal_item_di_classList.SetItem(Index: Integer; const Value: TNotafiscal_item_di_class);
begin
  Put(Index, Value);
end;

end.
