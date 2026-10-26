unit pedvenda_serv_terc_class;

interface

uses
  Contnrs,
  DB;

type
  TPedvenda_serv_terc_class = class(TObject)
  private
    Fnped         : Integer;
    Ftipo         : string;
    Fdescr_servt  : string;
    Fcod_empresa  : Integer;
    Fvl_servt     : Double;
    Fativo        : Integer;
    Fvlun_orig    : Double;
    Fnpedoriginado: Integer;
    Ftipooriginado: string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property nped         : Integer read Fnped          write Fnped;
    property tipo         : string  read Ftipo          write Ftipo;
    property descr_servt  : string  read Fdescr_servt   write Fdescr_servt;
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property vl_servt     : Double  read Fvl_servt      write Fvl_servt;
    property ativo        : Integer read Fativo         write Fativo;
    property vlun_orig    : Double  read Fvlun_orig     write Fvlun_orig;
    property npedoriginado: Integer read Fnpedoriginado write Fnpedoriginado;
    property tipooriginado: string  read Ftipooriginado write Ftipooriginado;
  end;

  TPedvenda_serv_terc_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TPedvenda_serv_terc_class;
    procedure SetItem(Index: Integer; const Value: TPedvenda_serv_terc_class);
  public
    function New: TPedvenda_serv_terc_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TPedvenda_serv_terc_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TPedvenda_serv_terc_class }

constructor TPedvenda_serv_terc_class.Create;
begin
  Fativo := 1;
end;

destructor TPedvenda_serv_terc_class.Destroy;
begin
  inherited;
end;

class function TPedvenda_serv_terc_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@nped, @tipo, @descr_servt, @cod_empresa, @vl_servt, @ativo, @vlun_orig, @npedoriginado, @tipooriginado';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedvenda_serv_terc_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fnped          := ADataSet.FieldByName('NPED').AsInteger;
    Ftipo          := Trim(ADataSet.FieldByName('TIPO').AsString);
    Fdescr_servt   := Trim(ADataSet.FieldByName('DESCR_SERVT').AsString);
    Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fvl_servt      := ADataSet.FieldByName('VL_SERVT').AsFloat;
    Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
    Fvlun_orig     := ADataSet.FieldByName('VLUN_ORIG').AsFloat;
    Fnpedoriginado := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    Ftipooriginado := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('NPED'         )) then Fnped          := ADataSet.FieldByName('NPED').AsInteger;
    if Assigned(ADataSet.FindField('TIPO'         )) then Ftipo          := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('DESCR_SERVT'  )) then Fdescr_servt   := Trim(ADataSet.FieldByName('DESCR_SERVT').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA'  )) then Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('VL_SERVT'     )) then Fvl_servt      := ADataSet.FieldByName('VL_SERVT').AsFloat;
    if Assigned(ADataSet.FindField('ATIVO'        )) then Fativo         := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('VLUN_ORIG'    )) then Fvlun_orig     := ADataSet.FieldByName('VLUN_ORIG').AsFloat;
    if Assigned(ADataSet.FindField('NPEDORIGINADO')) then Fnpedoriginado := ADataSet.FieldByName('NPEDORIGINADO').AsInteger;
    if Assigned(ADataSet.FindField('TIPOORIGINADO')) then Ftipooriginado := Trim(ADataSet.FieldByName('TIPOORIGINADO').AsString);
  end;
end;

{ TPedvenda_serv_terc_classList }

function TPedvenda_serv_terc_classList.GetItem(Index: Integer): TPedvenda_serv_terc_class;
begin
  Result := TPedvenda_serv_terc_class(inherited Items[Index]);
end;

function TPedvenda_serv_terc_classList.New: TPedvenda_serv_terc_class;
begin
  Result := TPedvenda_serv_terc_class.Create;
  Add(Result);
end;

procedure TPedvenda_serv_terc_classList.SetItem(Index: Integer; const Value: TPedvenda_serv_terc_class);
begin
  Put(Index, Value);
end;
procedure TPedvenda_serv_terc_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
