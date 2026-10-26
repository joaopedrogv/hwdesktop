unit transportador_class;

interface

uses
  Contnrs, DB;

type
  TTransportador_class = class(TObject)
  private
    Fcodigo_tr   : Integer;
    Fcod_empresa : Integer;
    Fnome_tr     : string;
    Fcnpj_tr     : string;
    Fend_tr      : string;
    Fmunicipio_tr: string;
    Fuf_tr       : Integer;
    Fie_tr       : string;
    Fativo       : Integer;
    Fcodigoantt  : string;
    Ffone_tr     : string;
    Ffax_tr      : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    property codigo_tr   : Integer read Fcodigo_tr    write Fcodigo_tr;
    property cod_empresa : Integer read Fcod_empresa  write Fcod_empresa;
    property nome_tr     : string  read Fnome_tr      write Fnome_tr;
    property cnpj_tr     : string  read Fcnpj_tr      write Fcnpj_tr;
    property end_tr      : string  read Fend_tr       write Fend_tr;
    property municipio_tr: string  read Fmunicipio_tr write Fmunicipio_tr;
    property uf_tr       : Integer read Fuf_tr        write Fuf_tr;
    property ie_tr       : string  read Fie_tr        write Fie_tr;
    property ativo       : Integer read Fativo        write Fativo;
    property codigoantt  : string  read Fcodigoantt   write Fcodigoantt;
    property fone_tr     : string  read Ffone_tr      write Ffone_tr;
    property fax_tr      : string  read Ffax_tr       write Ffax_tr;
  end;

  TTransportador_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TTransportador_class;
    procedure SetItem(Index: Integer; const Value: TTransportador_class);
  public
    function New: TTransportador_class;

    property Items[Index: Integer]: TTransportador_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{TTransportador_class}

constructor TTransportador_class.Create;
begin
  Fativo := 1;
end;

destructor TTransportador_class.Destroy;
begin
  inherited;
end;

procedure TTransportador_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcodigo_tr    := ADataSet.FieldByName('CODIGO_TR').AsInteger;
  Fcod_empresa  := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
  Fnome_tr      := Trim(ADataSet.FieldByName('NOME_TR').AsString);
  Fcnpj_tr      := Trim(ADataSet.FieldByName('CNPJ_TR').AsString);
  Fend_tr       := Trim(ADataSet.FieldByName('END_TR').AsString);
  Fmunicipio_tr := Trim(ADataSet.FieldByName('MUNICIPIO_TR').AsString);
  Fuf_tr        := ADataSet.FieldByName('UF_TR').AsInteger;
  Fie_tr        := Trim(ADataSet.FieldByName('IE_TR').AsString);
  Fativo        := ADataSet.FieldByName('ATIVO').AsInteger;
  Fcodigoantt   := Trim(ADataSet.FieldByName('CODIGOANTT').AsString);
  Ffone_tr      := Trim(ADataSet.FieldByName('FONE_TR').AsString);
  Ffax_tr       := Trim(ADataSet.FieldByName('FAX_TR').AsString);
end;

{TTransportador_classList}

function TTransportador_classList.GetItem(Index: Integer): TTransportador_class;
begin
  Result := TTransportador_class(inherited Items[Index]);
end;

function TTransportador_classList.New: TTransportador_class;
begin
  Result := TTransportador_class.Create;
  Add(Result);
end;

procedure TTransportador_classList.SetItem(Index: Integer; const Value: TTransportador_class);
begin
  Put(Index, Value);
end;

end.
