unit pedvenda_volumes_class;

interface

uses
{$IFDEF VER180}
  Contnrs,
  DB,
  IBQuery;
{$ELSE}
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ENDIF}

type
  TPedvenda_volumes_class = class(TObject)
  private
    Fnped       : Integer;
    Ftipo       : string;
    Fcod_empresa: Integer;
    Fqvol       : Integer;
    Fesp        : string;
    Fmarca      : string;
    Fnvol       : string;
    Fpesol      : Double;
    Fpesob      : Double;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TPedvenda_volumes_class; virtual;

    property nped       : Integer read Fnped        write Fnped;
    property tipo       : string  read Ftipo        write Ftipo;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property qvol       : Integer read Fqvol        write Fqvol;
    property esp        : string  read Fesp         write Fesp;
    property marca      : string  read Fmarca       write Fmarca;
    property nvol       : string  read Fnvol        write Fnvol;
    property pesol      : Double  read Fpesol       write Fpesol;
    property pesob      : Double  read Fpesob       write Fpesob;
  end;

  TPedvenda_volumes_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TPedvenda_volumes_class;
    procedure SetItem(Index: Integer; const Value: TPedvenda_volumes_class);
  public
    function New: TPedvenda_volumes_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TPedvenda_volumes_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TPedvenda_volumes_class }

function TPedvenda_volumes_class.Clone: TPedvenda_volumes_class;
begin
  Result             := TPedvenda_volumes_class.Create;
  Result.nped        := Self.nped;
  Result.tipo        := Self.tipo;
  Result.cod_empresa := Self.cod_empresa;
  Result.qvol        := Self.qvol;
  Result.esp         := Self.esp;
  Result.marca       := Self.marca;
  Result.nvol        := Self.nvol;
  Result.pesol       := Self.pesol;
  Result.pesob       := Self.pesob;
end;

class function TPedvenda_volumes_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@nped, @tipo, @cod_empresa, @qvol, @esp, @marca, @nvol, @pesol, @pesob';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TPedvenda_volumes_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fnped        := ADataSet.FieldByName('NPED').AsInteger;
    Ftipo        := Trim(ADataSet.FieldByName('TIPO').AsString);
    Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fqvol        := ADataSet.FieldByName('QVOL').AsInteger;
    Fesp         := Trim(ADataSet.FieldByName('ESP').AsString);
    Fmarca       := Trim(ADataSet.FieldByName('MARCA').AsString);
    Fnvol        := Trim(ADataSet.FieldByName('NVOL').AsString);
    Fpesol       := ADataSet.FieldByName('PESOL').AsFloat;
    Fpesob       := ADataSet.FieldByName('PESOB').AsFloat;
  end
  else
  begin
    if Assigned(ADataSet.FindField('NPED'       )) then Fnped        := ADataSet.FieldByName('NPED').AsInteger;
    if Assigned(ADataSet.FindField('TIPO'       )) then Ftipo        := Trim(ADataSet.FieldByName('TIPO').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('QVOL'       )) then Fqvol        := ADataSet.FieldByName('QVOL').AsInteger;
    if Assigned(ADataSet.FindField('ESP'        )) then Fesp         := Trim(ADataSet.FieldByName('ESP').AsString);
    if Assigned(ADataSet.FindField('MARCA'      )) then Fmarca       := Trim(ADataSet.FieldByName('MARCA').AsString);
    if Assigned(ADataSet.FindField('NVOL'       )) then Fnvol        := Trim(ADataSet.FieldByName('NVOL').AsString);
    if Assigned(ADataSet.FindField('PESOL'      )) then Fpesol       := ADataSet.FieldByName('PESOL').AsFloat;
    if Assigned(ADataSet.FindField('PESOB'      )) then Fpesob       := ADataSet.FieldByName('PESOB').AsFloat;
  end;
end;

function TPedvenda_volumes_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('NPED').AsInteger        := Fnped;
    ADataSet.ParamByName('TIPO').AsString         := Copy(Ftipo , 1, 3);
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('QVOL').AsInteger        := Fqvol;
    ADataSet.ParamByName('ESP').AsString          := Copy(Fesp  , 1, 60);
    ADataSet.ParamByName('MARCA').AsString        := Copy(Fmarca, 1, 60);
    ADataSet.ParamByName('NVOL').AsString         := Copy(Fnvol , 1, 60);
    ADataSet.ParamByName('PESOL').AsFloat         := Fpesol;
    ADataSet.ParamByName('PESOB').AsFloat         := Fpesob;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('NPED'       )) then   ADataSet.ParamByName('NPED').AsInteger        := Fnped;
    if Assigned(ADataSet.Params.FindParam('TIPO'       )) then   ADataSet.ParamByName('TIPO').AsString         := Copy(Ftipo , 1, 3);
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA')) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('QVOL'       )) then   ADataSet.ParamByName('QVOL').AsInteger        := Fqvol;
    if Assigned(ADataSet.Params.FindParam('ESP'        )) then   ADataSet.ParamByName('ESP').AsString          := Copy(Fesp  , 1, 60);
    if Assigned(ADataSet.Params.FindParam('MARCA'      )) then   ADataSet.ParamByName('MARCA').AsString        := Copy(Fmarca, 1, 60);
    if Assigned(ADataSet.Params.FindParam('NVOL'       )) then   ADataSet.ParamByName('NVOL').AsString         := Copy(Fnvol , 1, 60);
    if Assigned(ADataSet.Params.FindParam('PESOL'      )) then   ADataSet.ParamByName('PESOL').AsFloat         := Fpesol;
    if Assigned(ADataSet.Params.FindParam('PESOB'      )) then   ADataSet.ParamByName('PESOB').AsFloat         := Fpesob;
  end;
end;

{ TPedvenda_volumes_classList }

function TPedvenda_volumes_classList.GetItem(Index: Integer): TPedvenda_volumes_class;
begin
  Result := TPedvenda_volumes_class(inherited Items[Index]);
end;

function TPedvenda_volumes_classList.New: TPedvenda_volumes_class;
begin
  Result := TPedvenda_volumes_class.Create;
  Add(Result);
end;

procedure TPedvenda_volumes_classList.SetItem(Index: Integer; const Value: TPedvenda_volumes_class);
begin
  Put(Index, Value);
end;

procedure TPedvenda_volumes_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
