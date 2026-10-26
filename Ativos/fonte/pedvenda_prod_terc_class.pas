unit pedvenda_prod_terc_class;

interface

uses
  Contnrs,
  DB;

type
  TPedvenda_prod_terc_class = class(TObject)
  private
    Fnped         : Integer;
    Ftipo         : string;
    Fcod_empresa  : Integer;
    Fdescricao    : string;
    Fqtde         : Double;
    Fvl_unit      : Double;
    Fvl_total     : Double;
    Funidade      : string;
    Fcod_vendedor : Integer;
    Fativo        : Integer;
    Fnpedoriginado: Integer;
    Ftipooriginado: string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property nped         : Integer read Fnped          write Fnped;
    property tipo         : string  read Ftipo          write Ftipo;
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property descricao    : string  read Fdescricao     write Fdescricao;
    property qtde         : Double  read Fqtde          write Fqtde;
    property vl_unit      : Double  read Fvl_unit       write Fvl_unit;
    property vl_total     : Double  read Fvl_total      write Fvl_total;
    property unidade      : string  read Funidade       write Funidade;
    property cod_vendedor : Integer read Fcod_vendedor  write Fcod_vendedor;
    property ativo        : Integer read Fativo         write Fativo;
    property npedoriginado: Integer read Fnpedoriginado write Fnpedoriginado;
    property tipooriginado: string  read Ftipooriginado write Ftipooriginado;
  end;

  TPedvenda_prod_terc_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TPedvenda_prod_terc_class;
    procedure SetItem(Index: Integer; const Value: TPedvenda_prod_terc_class);
  public
    function New: TPedvenda_prod_terc_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TPedvenda_prod_terc_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TPedvenda_prod_terc_class }

constructor TPedvenda_prod_terc_class.Create;
begin
  Fativo := 1;
end;

destructor TPedvenda_prod_terc_class.Destroy;
begin
  inherited;
end;

class function TPedvenda_prod_terc_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@nped, @tipo, @cod_empresa, @descricao, @qtde, @vl_unit, @vl_total, @unidade, @cod_vendedor, @ativo,' +
            ' @npedoriginado, @tipooriginado';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedvenda_prod_terc_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fnped          := ADataSet.FieldByName('NPED').AsInteger;
    Ftipo          := Trim(ADataSet.FieldByName('TIPO').AsString);
    Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fdescricao     := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
    Fqtde          := ADataSet.FieldByName('QTDE').AsFloat;
    Fvl_unit       := ADataSet.FieldByName('VL_UNIT').AsFloat;
    Fvl_total      := ADataSet.FieldByName('VL_TOTAL').AsFloat;
    Funidade       := Trim(ADataSet.FieldByName('UNIDADE').AsString);
    Fcod_vendedor  := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
    Fnpedoriginado := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    Ftipooriginado := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('NPED'         )) then Fnped          := ADataSet.FieldByName('NPED').AsInteger;
    if Assigned(ADataSet.FindField('TIPO'         )) then Ftipo          := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA'  )) then Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('DESCRICAO'    )) then Fdescricao     := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
    if Assigned(ADataSet.FindField('QTDE'         )) then Fqtde          := ADataSet.FieldByName('QTDE').AsFloat;
    if Assigned(ADataSet.FindField('VL_UNIT'      )) then Fvl_unit       := ADataSet.FieldByName('VL_UNIT').AsFloat;
    if Assigned(ADataSet.FindField('VL_TOTAL'     )) then Fvl_total      := ADataSet.FieldByName('VL_TOTAL').AsFloat;
    if Assigned(ADataSet.FindField('UNIDADE'      )) then Funidade       := Trim(ADataSet.FieldByName('UNIDADE').AsString);
    if Assigned(ADataSet.FindField('COD_VENDEDOR' )) then Fcod_vendedor  := ADataSet.FieldByName('COD_VENDEDOR').AsInteger;
    if Assigned(ADataSet.FindField('ATIVO'        )) then Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('NPEDORIGINADO')) then Fnpedoriginado := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    if Assigned(ADataSet.FindField('TIPOORIGINADO')) then Ftipooriginado := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
  end;
end;

{ TPedvenda_prod_terc_classList }

function TPedvenda_prod_terc_classList.GetItem(Index: Integer): TPedvenda_prod_terc_class;
begin
  Result := TPedvenda_prod_terc_class(inherited Items[Index]);
end;

function TPedvenda_prod_terc_classList.New: TPedvenda_prod_terc_class;
begin
  Result := TPedvenda_prod_terc_class.Create;
  Add(Result);
end;

procedure TPedvenda_prod_terc_classList.SetItem(Index: Integer; const Value: TPedvenda_prod_terc_class);
begin
  Put(Index, Value);
end;
procedure TPedvenda_prod_terc_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
